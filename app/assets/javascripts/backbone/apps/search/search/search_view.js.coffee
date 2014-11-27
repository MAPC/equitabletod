@Equitabletod.module "SearchApp.Search", (Search, App, Backbone, Marionette, $, _) ->

    class Search.SimpleSearchFormLayout extends App.Views.Layout
        template: "search/search/templates/simple_search_layout" 
        
        onShow: ->
            $("select").val []
            gon.paginate = false
            gon.page_number = -1
            @names = App.request "set:name", gon.names.names
            @muni_names = App.request "set:muni_name", gon.muni_names.muni_names
            console.log "@muni_names:"
            console.log @muni_names
            console.log "@collection:"
            console.log @muni_names.models
            features = _.values @muni_names.models # this returns an array of each features obkect
            console.log "features: "
            console.log features 
            l_muni_names = []
            _.map features, (key, value) -> l_muni_names.push _.keys key.attributes
            l_n_muni_names = []
            _.map l_muni_names, (key, value) -> l_n_muni_names.push key["0"]
                #console.log muni_names
                #muni_names[2].toLowerCase()
            $("#resetbuttom").on "click", (e) ->
                    $("select").val []
                    $("input").val []

            $("#searchinput2").autocomplete
                source: l_n_muni_names
                minLength: 3
                select: (event, ui) ->
                    console.log "gon object:"
                    console.log event.view.gon
                    console.log ui.item.value.toLowerCase()  
                        #console.log gon.muni_names.muni_names
            $("#searchinput1").autocomplete
                source: gon.names.names
                minLength: 3
                select: (event, ui) ->
                    console.log ui.item.value.toLowerCase()
                    name = ui.item.value.replace(" ", "%20").toLowerCase()
                    console.log name
                    urlstr = "by_name=" + "#{name}".replace(/\s*\(.*?\)\s*/g, "")
                    console.log urlstr          
                    query = "#{urlstr}"
                    App.vent.trigger "searchFired", query
            $(document).ready ->
                $("#fpaccordion").accordion 
                    header: "hm2" 
                    active: "false"
                    heightStyle: "content"
                    collapsible: true
                    icons:
                        header: "ui-icon-plus"
                        activeHeader: "ui-icon-minus"
            $(document).ready ->
              $("#titles").html "<p class='h2'></p>" 
              $("[rel=tooltip]").tooltip placement: "top"
              $("#dialog-modal").dialog 
                    position:
                        my: "right"
                        at: "right"
                    autoOpen: false
                    closeOnEscape: true
                    width: 780
                    show:
                        effect: "blind"
                        duration: 200  
                    hide:
                        effect: "blind"
                        duration: 200
                    title: 
                        $("[rel=tooltipd]").title

               
                $("#dialog-modal").dialog beforeClose: (event, ui) ->
                    $("#accordion").accordion "enable"

                $("[rel=tooltipd]").click (event, ui) ->
                    console.log @
                    console.log @.title
                    $("#dialog-modal").dialog 
                    dictionaryResponse = $.ajax
                            url: "/dictionary_entries.json?by_name=#{@.title}"
                            done: (result) =>
                                return result
                    dictionary = dictionaryResponse.complete()
                    dictionary.done =>
                        dictionaries = dictionary.responseJSON
                        @dictionaryentries = App.request "set:dictionaryentry", dictionaries
                        $("#dialog-modal").dialog "open"
                        $("#dialog-modal").dialog title: "Data Dictionary"
                        $("#dialog-modal").html("")
                        $("#dialog-modal").html("#{@dictionaryentries.models["0"].get("description")}")
              # $(".selectpicker").selectpicker()
              $("homeClick").on "click", (e) ->
                $("html, body").animate
                    scrollTop: $("#search").offset().top
                    , "fast"
                return 
              $("#searchinput1").on "keypress", (e) ->
                spinopts =
                    lines: 13 # The number of lines to draw
                    length: 20 # The length of each line
                    width: 10 # The line thickness
                    radius: 30 # The radius of the inner circle
                    corners: 1 # Corner roundness (0..1)
                    rotate: 0 # The rotation offset
                    direction: 1 # 1: clockwise, -1: counterclockwise
                    color: "#000" # #rgb or #rrggbb or array of colors
                    speed: 1 # Rounds per second
                    trail: 60 # Afterglow percentage
                    shadow: false # Whether to render a shadow
                    hwaccel: false # Whether to use hardware acceleration
                    className: "spinner" # The CSS class to assign to the spinner
                    zIndex: 2e9 # The z-index (defaults to 2000000000)
                    top: "50%" # Top position relative to parent
                    left: "50%" # Left position relative to parent

                spintarget1 = document.getElementById("searchbuttom")
                spinner1 = new Spinner(spinopts).spin(spintarget1)
                p = e.which
                if p is 13
                    name = $('input#searchinput1').val().replace(" ", "%20").toLowerCase() 
                    if name is undefined
                        qury = qury + ""
                    else
                        qury = qury + "&by_name=#{name}"
                        gon.name = "#{name}"
                    query = "#{qury}"
                    console.log(query)
                    urlstr = "/search.json?" + "#{query}"
                    responseFeature = $.ajax
                            url: urlstr
                            done: (result) =>
                                return result
                    console.log "response to the ajax call"
                      #console.log responseFeature
                    collection = responseFeature.complete()
                    collection.done =>
                            fstations = collection.responseJSON
                            console.log fstations
                            features = _.values fstations.features
                            spinner1.stop()
                            #window.features = Backbone.Collection.extend(localStorage: new Backbone.LocalStorage("features"))
                            #window.features = features
                            if features.length > 0
                                gon.features = features
                                App.vent.trigger "searchFired", query
                            else
                                $("#dialog-modal").dialog "open"
                                $("#dialog-modal").dialog title: "Error"
                                $("#dialog-modal").html("")
                                $("#dialog-modal").html("Error - Search has no results, Reload Page Or Refine The Search")
              

        events: 
            'click #searchbuttom': 'inputChange'
            'click #advSearchButtom': 'searchrefineFired'
            'click #etod': 'etodFired'
            'click #gsa': 'gsaFired'
            'click #resetbuttom':  'resetFormArgs' 
            'click #mapClick': 'fireMap' 
            'select #searchinput1': 'inputChange'
            'click #ui-accordion-fpaccordion-header-0': 'moreText'
            'click #ui-accordion-header-icon ui-icon ui-icon-minus': 'lessText'

        inputChange: (e)=>
            spinopts =
                lines: 13 # The number of lines to draw
                length: 20 # The length of each line
                width: 10 # The line thickness
                radius: 30 # The radius of the inner circle
                corners: 1 # Corner roundness (0..1)
                rotate: 0 # The rotation offset
                direction: 1 # 1: clockwise, -1: counterclockwise
                color: "#000" # #rgb or #rrggbb or array of colors
                speed: 1 # Rounds per second
                trail: 60 # Afterglow percentage
                shadow: false # Whether to render a shadow
                hwaccel: false # Whether to use hardware acceleration
                className: "spinner" # The CSS class to assign to the spinner
                zIndex: 2e9 # The z-index (defaults to 2000000000)
                top: "50%" # Top position relative to parent
                left: "50%" # Left position relative to parent

            spintarget = document.getElementById("searchbuttom")
            spinner = new Spinner(spinopts).spin(spintarget)
            console.log e
            #console.log $(@)
            btn = e
            #btn.button('loading')
            urlq = "?"
            muni_name = $('input#searchinput2').val().replace(" ", "%20").toLowerCase() if $('input#searchinput2').val()
            if muni_name is undefined
                qury = ""
            else
                #name = $('input#searchinput1').val().replace(" ", "%20").toLowerCase() if $('input#searchinput1').val()
                qury = "by_muni_name=#{muni_name}"
            gon.muni_name = "#{muni_name}"
            name = $('input#searchinput1').val().replace(" ", "%20").toLowerCase() if $('input#searchinput1').val()
            if name is undefined
                qury = qury + ""
            else
                qury = qury + "&by_name=#{name}".replace(/\s*\(.*?\)\s*/g, "")
            gon.name = "#{name}"
            service_type = $('#selectbasic2 option:selected').val().replace(" ", "%20").toLowerCase() if $('#selectbasic2 option:selected').val()
            if service_type is undefined
                qury = qury + ""
            else    
                qury = qury + "&by_line=#{service_type}".replace(/\s*\(.*?\)\s*/g, "")
            gon.service_type = "#{service_type}"
            station_type = $('#selectbasic3 option:selected').val().replace(" ", "%20").toLowerCase() if $('#selectbasic3 option:selected').val()
            if station_type is undefined
                qury = qury + ""
            else
                qury = qury + "&by_station_class=#{station_type}".replace(/\s*\(.*?\)\s*/g, "")
            gon.station_type = "#{station_type}"
            etod_group = $('#selectbasic4 option:selected').val().replace(" ", "%20").toLowerCase() if $('#selectbasic4 option:selected').val()
            if etod_group is undefined
                qury = qury + ""
            else
                qury = qury + "&by_etod_category=#{etod_group}".replace(/\s*\(.*?\)\s*/g, "")
            gon.etod_group = "#{etod_group}"
            query = "#{qury}"
            console.log(query)
            # here would are the basic validation and if passed the vent will trigger
            urlstr = "/search.json?" + "#{query}"
            #console.log urlstr
            responseFeature = $.ajax
                    url: urlstr
                    done: (result) =>
                        return result
            #console.log responseFeature
            collection = responseFeature.complete()
            collection.done =>
                    fstations = collection.responseJSON
                    console.log fstations
                    features = _.values fstations.features
                    #window.features = Backbone.Collection.extend(localStorage: new Backbone.LocalStorage("features"))
                    #window.features = features
                    if features.length > 0
                        gon.features = features
                        num_pages = features.length / 10
                        num = num_pages.toString()
                        num = num.slice(0, (num.indexOf(".")) + 0)  if num.indexOf(".") > 0
                        num = Number(num) + 1 if num_pages > num
                        gon.num_pages = num
                        gon.query = query
                        spinner.stop()
                        App.vent.trigger "searchFired", query
                    else
                        # console.log "error"
                        # console.log btn
                        # btn.target.validity.valid = false
                        # btn.target.innerText = 'Error'
                        # console.log @
                        # console.log btn
                        $("#dialog-modal").dialog "open"
                        $("#dialog-modal").dialog title: "Error"
                        $("#dialog-modal").html("")
                        spinner.stop()
                        $("#dialog-modal").html("Error - Search has no results, Reload Page Or Refine The Search")


        moreText: (e) =>
            $("#ui-accordion-fpaccordion-header-0 > a").html '<a id="less-text"></a> '

        lessText: (e) =>
            $("#ui-accordion-fpaccordion-header-0 > a").html '<a id="More-text">More</a> '

        etodFired: (e) =>
            App.vent.trigger "etodFired"

        gsaFired: (e) =>
            App.vent.trigger "gsaFired"

        searchrefineFired: (e) =>
            App.vent.trigger "searchrefineFired"
            
        fireSimpleSearch: (e) =>
            console.log "i get the click"
            $("html, body").animate
                scrollTop: $("#search").offset().top
            , "fast"



