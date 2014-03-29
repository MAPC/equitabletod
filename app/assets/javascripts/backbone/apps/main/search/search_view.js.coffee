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
                source: gon.lables.names
                minLength: 3
              return
            $(document).ready ->
              $("#searchinput2").autocomplete
                source: gon.munis.munis
                minLength: 3
              return


        events: 
            'change #selectbasic2' : 'servicTypeSelected'
            'click #searchbuttom': 'inputChange'
            'click #resetbuttom':  'resetFormArgs' 
            'click #mapClick': 'fireMap'   
            'change #searchinput1': 'nameSelected'
            'change #searchinput2': 'muniNameSelected'

        inputChange: (e)=>
            urlq = "?"
            muni_name = $('input#searchinput2').val().toLowerCase()
            name = $('input#searchinput1').val().toLowerCase()
            service_type = $('#selectbasic2 option:selected').val().toLowerCase()
            station_type = $('#selectbasic3 option:selected').val().toLowerCase()
            etod_group = $('#selectbasic4 option:selected').val().toLowerCase()
            qury = "#{urlq}by_name=#{name}"
            @collection.add 'muni_name': "#{muni_name}"
            @collection.add 'name': "#{name}"
            @collection.add 'service_type': "#{service_type}"
            @collection.add 'station_type': "#{station_type}"
            @collection.add 'etod_group': "#{etod_group}"
            @collection.add 'qury': "#{qury}"
            query = "#{qury}"
            console.log(query)
            # here would be the basic validation and if passed the vent will trigger
            App.vent.trigger "searchFired", query
            #App.vent.trigger "search:term", query
            #App.request "fstation:entity" (query)
        
        nameSelected: (e) =>
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
            @collection.add 'service_type': "#{service_type}"
            console.log service_type # this logs the first service type selected and will later 
                                     # helps as a boolean value  
            #$("#selectbasic1").html("<option> will load accordingly </option>")


        fireMap: (e) =>
            App.vent.trigger "fireMap"


           



            



