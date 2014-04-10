@Equitabletod.module "MainApp.Search", (Search, App, Backbone, Marionette, $, _) ->
    #MainApp.commands = new Backbone.Wreqr.Commands()

    class Search.SimpleSearchFormLayout extends App.Views.Layout
        template: "main/search/templates/simple_search_layout" 
        itemViewContainer: "#form-horizontal"
        className: "col-md-12 col-md-offset-0 text-left"
        
        templateHelpers:->
            #names = "#{gon.lables.names}" # this just makes a list of the names
            $(document).ready ->
              $("#searchinput1").autocomplete
                source: gon.names.names
                minLength: 3
                select: (event, ui) ->
                    console.log ui.item.value.toLowerCase()
                    name = ui.item.value.toLowerCase()
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
                            event.view.gon.sugestion.muni_names = muni_names
                            console.log event.view.gon
              return
            $(document).ready ->
              $("#searchinput2").autocomplete
                source: gon.muni_names.muni_names
                minLength: 3
                select: (event, ui) ->
                    console.log event.view.gon
                    console.log ui.item.value.toLowerCase()
                    
              return
            $(document).ready ->
              $("#accordion").accordion
              return

        events: 
            'change #selectbasic2' : 'servicTypeSelected'
            'click #searchbuttom': 'inputChange'
            'click #resetbuttom':  'resetFormArgs' 
            'click #mapClick': 'fireMap'   
            'select #searchinput1': 'nameSelected'
            'change #searchinput1': 'nameSelected'
            #'change #searchinput2': 'muniNameSelected'

        inputChange: (e)=>
            urlq = "?"
            muni_name = $('input#searchinput2').val().replace(" ", "%20").toLowerCase() if $('input#searchinput2').val()
            name = $('input#searchinput1').val().replace(" ", "%20").toLowerCase() if $('input#searchinput1').val()
            if muni_name is undefined
                console.log "empty muni name selected"
            else
                name = $('input#searchinput1').val().replace(" ", "%20").toLowerCase() if $('input#searchinput1').val()
                console.log "muni name is not empty and is:"
                console.log muni_name
                qury = "by_muni_name=#{muni_name}"
                console.log qury
            if name is undefined
                console.log "empty nameSelected"
                if muni_name is undefined
                    console.log "empty nameSelected"
                    console.log "empty muni name selected"
                    qury = "by_name="
                else
                    qury = "by_muni_name=#{muni_name}"
            else
                qury = qury + "&by_name=#{name}"
                console.log qury
            service_type = $('#selectbasic2 option:selected').val().replace(" ", "%20").toLowerCase() if $('#selectbasic2 option:selected').val()
            if service_type 
                console.log "service type:"
                console.log service_type
                qury = qury + "&by_type=#{service_type}"
            if station_type
                station_type = $('#selectbasic3 option:selected').val().replace(" ", "%20").toLowerCase()
            etod_group = $('#selectbasic4 option:selected').val().replace(" ", "%20").toLowerCase()
            query = "#{qury}"
            console.log(query)
            # here would be the basic validation and if passed the vent will trigger
            App.vent.trigger "searchFired", query
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


            #sugestions = @sugestions()
            #console.log('after the call')
            #textSuggestions = "#{sugestions}"
            #console.log(textSuggestions) 
            #console.log(sugestions) 

        servicTypeSelected: (e) =>
            service_type = $('#selectbasic2 option:selected').val() 
            console.log service_type # this logs the first service type selected and will later 
                                     # helps as a boolean value  
            #$("#selectbasic1").html("<option> will load accordingly </option>")



           



            



