@Equitabletod.module "MainApp.Search", (Search, App, Backbone, Marionette, $, _) ->
    #MainApp.commands = new Backbone.Wreqr.Commands()
    Array::where = (query, matcher = (a,b) -> a is b) ->
        return [] if typeof query isnt "object"
        hit = Object.keys(query).length
        @filter (item) ->
            match = 0
            for key, val of query
                match += 1 if item[key] is val
            if match is hit then true else false

    class Search.SimpleSearchFormLayout extends App.Views.Layout
        template: "main/search/templates/simple_search_layout" 
        itemViewContainer: "#form-horizontal"
        className: "col-md-12 col-md-offset-0 text-left"
        
        templateHelpers:->
            munis = "#{gon.munis.munis}"
            console.log munis
                


            ###@sugestions = ->
                console.log('inside the callback function definition in templateHelpers') 
                fsugestions = App.request "sugestion:entities", (fsugestions) ->
                    #promise.then (sugestions) ->
                    $.when(fsugestions).then (sugestions) ->
                        responseText = "#{sugestions}"
                        console.log(responseText) 
                        sugestions
                fsugestions
                console.log('inside the callback function definition in templateHelpers after the promise')### 
            


        events: 
            'click #searchbuttom': 'inputChange'
            'click #resetbuttom':  'resetFormArgs'
            'mouseover #searchinput2': 'hoverMuniFired' 
            'click #mapClick': 'fireMap'   

        inputChange: (e)=>
            #MainApp.vent.trigger "searchFired"
            query = []
            muni = $('input#searchinput2').val() 
            station_name = $('input#searchinput1').val()
            service_type = $('#selectbasic2 option:selected').val() 
            transit_line = $('#selectbasic1 option:selected').val()
            station_type = $('#selectbasic3 option:selected').val()
            etod_group = $('#selectbasic4 option:selected').val()
            @collection.add 'muni': "#{muni}"
            @collection.add 'station_name': "#{station_name}"
            @collection.add 'service_type': "#{service_type}"
            @collection.add 'transit_line': "#{transit_line}"
            @collection.add 'station_type': "#{station_type}"
            @collection.add 'etod_group': "#{etod_group}"
            ###_.map @collection.models, (model) =>
                muni = model.get 'muni'
                _.compact muni
                #query = query.concat muni
                station_name = model.get 'station_name'
                _.compact station_name
                #console.log(station_name)
                #console.log(muni)
                query = query.concat station_name
                #console.log(query)### 

            #query = "#{query}"
            #console.log(query)
            #console.log(myquery)
        
        hoverMuniFired: (e) =>
            console.log('inside hover event') 
            #sugestions = @sugestions()
            #console.log('after the call')
            #textSuggestions = "#{sugestions}"
            #console.log(textSuggestions) 
            #console.log(sugestions) 

        fireMap: (e) =>
            App.vent.trigger "fireMap"


           



            



