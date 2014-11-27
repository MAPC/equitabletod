@Equitabletod.module "MainApp.Search", (Search, App, Backbone, Marionette, $, _) ->

    class Search.SimpleSearchFormLayout extends App.Views.Layout
        template: "main/search/templates/simple_search_layout" 
        
        onShow: ->
            $('.selectpicker').selectpicker()
            $(document).ready ->
                if gon.muni_name == 'undefined'
                    $("#searchinput2").val []
                else
                    $("#searchinput2").val gon.muni_name if gon.muni_name

                if gon.name == 'undefined'
                    $("#searchinput1").val []
                else
                    $("#searchinput1").val gon.name if gon.name

                if gon.etod_group == 'undefined'
                    $("#selectbasic4").val []
                else
                    $('select[name=selectbasic4]').val(gon.etod_group)
                    $('.selectpicker').selectpicker('refresh')
                if gon.service_type == 'undefined'
                    $("#selectbasic2").val []
                else
                    $('select[name=selectbasic2]').val(gon.service_type)
                    $('.selectpicker').selectpicker('refresh')
                if gon.station_type == 'undefined'
                    $("#selectbasic3").val []
                else
                    $('select[name=selectbasic3]').val(gon.station_type)
                    $('.selectpicker').selectpicker('refresh')
                # $("select").val []
                # empty the boxplot element if it is not already empty
                $("#boxplot").html ""
                # 
            $(document).ready ->
              # empty the space for title element 
              $("#titles").html "<p class='h2'></p>" 
              # initiate the default tooltip  
              $("[rel=tooltip]").tooltip placement: "top"
              # initiate the left tooltip
              # $("[rel=tooltipl]").tooltip placement: "left"
              # initiate the modal that contains the dictionary information
              # $("#dialog-modal").dialog 
              #       position:
              #           my: "right"
              #           at: "right"
              #       autoOpen: false
              #       closeOnEscape: true
              #       width: 280
              #       show:
              #           effect: "blind"
              #           duration: 200  
              #       hide:
              #           effect: "blind"
              #           duration: 200
              #       title: 
              #           $("[rel=tooltipd]").title
                # initiate the tooltip for question marks and assign the response to the click 
                # $("[rel=tooltipd]").click (event, ui) ->

                #     $("#dialog-modal").dialog 
                #     dictionaryResponse = $.ajax
                #             url: "/dictionary_entries.json?by_name=#{@.title}"
                #             done: (result) =>
                #                 return result
                #     dictionary = dictionaryResponse.complete()
                #     dictionary.done =>
                #         dictionaries = dictionary.responseJSON
                #         @dictionaryentries = App.request "set:dictionaryentry", dictionaries
                #         $(@el).tooltip "option", title: ""
                #         $("#dialog-modal").dialog "open"
                #         $("#dialog-modal").html("")
                #         $("#dialog-modal").dialog title: "Data Dictionary - #{@dictionaryentries.models["0"].get("interpretation")}"
                #         $("#dialog-modal").html("<hm2>#{@dictionaryentries.models["0"].get("code")} <br><br> <span>What it is: </span>#{@dictionaryentries.models["0"].get("importance")} <br><br> <span>Why it's important: </span>#{@dictionaryentries.models["0"].get("description")} <br><br> <span>Technical notes: </span>#{@dictionaryentries.models["0"].get("technical_notes")}</hm2>")
                #         $("#dialog-modal").dialog height: "auto" 
                #         $("#dialog-modal").dialog modal: true
              # bind an event to search navbar on the header to scroll to search element 
              # empty out the input element text if not defined else retain the inputs
                

              $("#resetbuttom").on "click", (e) ->
                $("select").val []
                $('.selectpicker').selectpicker('render')
                $("input").val []

              $("homeClick").on "click", (e) ->
                $("html, body").animate
                    scrollTop: $("#search").offset().top
                    , "fast"
                return 
              # bind an event to search by station name input to do search when hit enter
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

                spintarget1 = document.getElementById("searchinput1")
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
                    urlstr = "/search.json?" + "#{query}"
                    responseFeature = $.ajax
                            url: urlstr
                            done: (result) =>
                                return result
                    collection = responseFeature.complete()
                    collection.done =>
                            fstations = collection.responseJSON
                            features = _.values fstations.features
                            spinner1.stop()
                            if features.length > 0
                                gon.features = features
                                App.vent.trigger "searchFired", query
                            else
                                $("#dialog-modal").dialog "open"
                                $("#dialog-modal").dialog title: "Error"
                                $("#dialog-modal").html("")
                                $("#dialog-modal").html("Search has no results, Please try again with different parameteres")
            # make an ajax call for populating the autocomplete/typeahead when scrolling down 15% of the page  
            $(window).scroll (options) ->
                    if $(window).scrollTop() + $(window).height() > $(document).height() - .75 * $(document).height()
                        $(window).unbind "scroll"
                        @names = App.request "set:name", gon.names.names
                        @muni_names = App.request "set:muni_name", gon.muni_names.muni_names
                        features = _.values @muni_names.models # this returns an array of each features object
                        l_muni_names = []
                        _.map features, (key, value) -> l_muni_names.push _.keys key.attributes
                        l_n_muni_names = []
                        _.map l_muni_names, (key, value) -> l_n_muni_names.push key["0"]
                        $("#searchinput2").autocomplete
                            source: l_n_muni_names
                            minLength: 3
                            select: (event, ui) ->
                                # console.log event.view.gon
                                # console.log ui.item.value.toLowerCase()  
                        $("#searchinput1").autocomplete
                            source: gon.names.names
                            minLength: 3
                            select: (event, ui) ->
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

                                spintarget2 = document.getElementById("searchinput1")
                                spinner2 = new Spinner(spinopts).spin(spintarget2)
                                name = ui.item.value.replace(" ", "%20").toLowerCase()
                                urlstr = "by_name=" + "#{name}".replace(/\s*\(.*?\)\s*/g, "")
                                query = "#{urlstr}"
                                spinner2.stop()
                                App.vent.trigger "searchFired", query
                    return

        # binding general events to the page's elements
        events: 
            'click #searchbuttom': 'inputChange'
            'click #advSearchButtom': 'searchrefineFired'
            'click #etod': 'etodFired'
            'click #gsa': 'gsaFired'
            'click #resetbuttom':  'resetFormArgs' 
            'click #mapClick': 'fireMap' 
            'select #searchinput1': 'inputChange'
        # actions in respond to event: clicking on search
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
            btn = e
            # btn.button('loading')
            # making up the query string for the search from the form inputs and assiging in to a gon object
            urlq = "?"
            muni_name = $('input#searchinput2').val().replace(" ", "%20").toLowerCase() if $('input#searchinput2').val()
            if muni_name is undefined
                qury = ""
            else
                qury = "by_muni_name=#{muni_name}"
            gon.muni_name = $('input#searchinput2').val()
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
            gon.service_type = $('#selectbasic2 option:selected').val()
            station_type = $('#selectbasic3 option:selected').val().replace(" ", "%20").toLowerCase() if $('#selectbasic3 option:selected').val()
            if station_type is undefined
                qury = qury + ""
            else
                qury = qury + "&by_station_class=#{station_type}".replace(/\s*\(.*?\)\s*/g, "")
            gon.station_type = $('#selectbasic3 option:selected').val()
            etod_group = $('#selectbasic4 option:selected').val().replace(" ", "%20").toLowerCase() if $('#selectbasic4 option:selected').val()
            if etod_group is undefined
                qury = qury + ""
            else
                qury = qury + "&by_etod_category=#{etod_group}".replace(/\s*\(.*?\)\s*/g, "")
            gon.etod_group = $('#selectbasic4 option:selected').val()
            query = "#{qury}"
            urlstr = "/search.json?" + "#{query}"
            # making the ajax call using the search query string
            responseFeature = $.ajax
                    url: urlstr
                    done: (result) =>
                        return result
            collection = responseFeature.complete()
            collection.done =>
                    fstations = collection.responseJSON
                    features = _.values fstations.features
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
                        $("#dialog-modal").dialog "open"
                        $("#dialog-modal").dialog title: "Error"
                        $("#dialog-modal").html("")
                        $("#dialog-modal").html("Error - Search has no results, Reload Page Or Refine The Search")
                        $("#dialog-modal").dialog height: "auto" 
                        $("#dialog-modal").dialog modal: true
                        # btn.target.validity.valid = false
                        # btn.target.innerText = 'Error - Search has no results, Reload Page Or Refine The Search'

        etodFired: (e) =>
            App.vent.trigger "etodFired"

        gsaFired: (e) =>
            App.vent.trigger "gsaFired"

        searchrefineFired: (e) =>
            App.vent.trigger "searchrefineFired"

        fireSimpleSearch: (e) =>
            $("html, body").animate
                scrollTop: $("#search").offset().top
            , "fast"



  