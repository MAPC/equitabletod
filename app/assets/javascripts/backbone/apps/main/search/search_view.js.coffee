@Equitabletod.module "MainApp.Search", (Search, App, Backbone, Marionette, $, _) ->
    #MainApp.commands = new Backbone.Wreqr.Commands()

    class Search.SimpleSearchFormLayout extends App.Views.Layout
        template: "main/search/templates/simple_search_layout" 
        
        onShow: ->
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
                        my: "center"
                        at: "center"
                        of: "#main-region"
                    autoOpen: false
                    closeOnEscape: true
   
                    show:
                        effect: "blind"
                        duration: 100  
                    hide:
                        effect: "blind"
                        duration: 100
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
                        console.log dictionaries["0"].description if dictionaries["0"]
                        $("#dialog-modal").dialog "open"
                        $("#dialog-modal").dialog title: "Data Dictionary"
                        $("#dialog-modal").html("")
                        $("#dialog-modal").html("#{dictionaries["0"].description}")
              $(".selectpicker").selectpicker()
              $("#searchinput1").on "keypress", (e) ->
                p = e.which
                if p is 13
                    name = $('input#searchinput1').val().replace(" ", "%20").toLowerCase() 
                    console.log name 
                    if name is undefined
                        qury = qury + ""
                    else
                        qury = qury + "&by_name=#{name}"
                        gon.name = "#{name}"
                    query = "#{qury}"
                    console.log(query)
                      # here would are the basic validation and if passed the vent will trigger
                    urlstr = "/search.json?" + "#{query}"
                      #console.log urlstr
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
                            #window.features = Backbone.Collection.extend(localStorage: new Backbone.LocalStorage("features"))
                            #window.features = features
                            if features.length > 0
                                gon.features = features
                                App.vent.trigger "searchFired", query
                            else
                                console.log "error"
                                $("#dialog-modal").dialog "open"
                                $("#dialog-modal").dialog title: "Error"
                                $("#dialog-modal").html("")
                                $("#dialog-modal").html("Search has no results, Please try again with different parameteres")
              $("#searchinput1").autocomplete
                source: gon.names.names
                minLength: 3
                select: (event, ui) ->
                    console.log ui.item.value.toLowerCase()
                    name = ui.item.value.replace(" ", "%20").toLowerCase()
                    console.log name
                    urlstr = "by_name=" + "#{name}"
                    console.log urlstr
                    query = "#{urlstr}"
                    App.vent.trigger "searchFired", query
              
            $(document).ready ->
              $("#searchinput2").autocomplete
                source: gon.muni_names.muni_names
                minLength: 3
                select: (event, ui) ->
                    console.log event.view.gon
                    console.log ui.item.value.toLowerCase()      
              return

        events: 
            'change #selectbasic2' : 'servicTypeSelected'
            'click #searchbuttom': 'inputChange'
            'click #etod': 'etodFired'
            'click #gsa': 'gsaFired'
            'click #resetbuttom':  'resetFormArgs' 
            'click #mapClick': 'fireMap'   
            'select #searchinput1': 'inputChange'
            'click #ui-accordion-fpaccordion-header-0': 'moreText'
            'click #ui-accordion-header-icon ui-icon ui-icon-minus': 'lessText'

        inputChange: (e)=>
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
                qury = qury + "&by_name=#{name}"
            gon.name = "#{name}"
            service_type = $('#selectbasic2 option:selected').val().replace(" ", "%20").toLowerCase() if $('#selectbasic2 option:selected').val()
            if service_type is undefined
                qury = qury + ""
            else    
                qury = qury + "&by_line=#{service_type}"
            gon.service_type = "#{service_type}"
            station_type = $('#selectbasic3 option:selected').val().replace(" ", "%20").toLowerCase() if $('#selectbasic3 option:selected').val()
            if station_type is undefined
                qury = qury + ""
            else
                qury = qury + "&by_station_type=#{station_type}"
            gon.station_type = "#{station_type}"
            etod_group = $('#selectbasic4 option:selected').val().replace(" ", "%20").toLowerCase() if $('#selectbasic4 option:selected').val()
            if etod_group is undefined
                qury = qury + ""
            else
                qury = qury + "&by_etod_category=#{etod_group}"
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
            console.log "response to the ajax call"
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
                        App.vent.trigger "searchFired", query
                    else
                        console.log "error"
                        $("#dialog-modal").dialog "open"
                        $("#dialog-modal").dialog title: "Error"
                        $("#dialog-modal").html("")
                        $("#dialog-modal").html("Search has no results, Please try again with different parameteres")

            #App.vent.trigger "search:term", query
            #App.request "fstation:entity" (query)
        
        nameSelected: (e, ui) =>
            console.log "inside name sekected"
            name = $('input#searchinput1').val()
            console.log name 
            urlstr = "/search.json?by_name=" + "#{name}"
            console.log urlstr
            sugestion = $.ajax
                url: urlstr
                success: (result) ->
                    return result
            sugestion.done =>
                console.log sugestion
                if sugestion.responseJSON
                    sugestions = sugestion.responseJSON
                    features = _.values sugestions.features # this returns an array of each features obkect
                console.log features 
                muni_names = _.map features, (key, value) -> key.properties.muni_name.toLowerCase()
                console.log muni_names
                #console.log "#{suggestionsCollection.models}"
                #if features.length == 1
                muni_names = _.map features, (key, value) ->
                    muni_names = (_.pluck key, 'muni_name')
                    muni_names[2].toLowerCase()
                console.log muni_names
                @muni_names = muni_names
                @muni_names
                @validatedAs = true
                console.log @validatedAs
                # muni_names is the list of the possible muni name values with the submitted first choice
                # here it can change the muni name search to a drop down! to do later
                # for now:
                #   - helps validate the next choices
                #   - shows a hint/alarm of possible choices: to do


        muniNameSelected: (e) =>
            console.log "inside muni_name sekected"
            muni_name = $('input#searchinput2').val().toLowerCase()
            console.log muni_name 
            if muni_name not in @muni_names
                console.log "validates as false"
                @validatedAs = false
                console.log "this is validated as:"
                console.log @validatedAs

        servicTypeSelected: (e) =>
            service_type = $('#selectbasic2 option:selected').val() 
            console.log service_type # this logs the first service type selected and will later 
                                     # helps as a boolean value  
            #$("#selectbasic1").html("<option> will load accordingly </option>")

        moreText: (e) =>
            $("#ui-accordion-fpaccordion-header-0 > a").html '<a id="less-text"></a> '

        lessText: (e) =>
            $("#ui-accordion-fpaccordion-header-0 > a").html '<a id="More-text">More</a> '

        etodFired: (e) =>
            App.vent.trigger "etodFired"

        gsaFired: (e) =>
            App.vent.trigger "gsaFired"
           



            



