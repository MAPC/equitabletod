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
        initialize:->
            Marionette.bindEntityEvents @, @model, @modelEvents
        template: "main/search/templates/simple_search_layout" 
        itemViewContainer: "#form-horizontal"
        className: "col-md-12 col-md-offset-0 text-left"
        #templateHelpers:->
            #sugestions: App.request "sugestion:entities"
        events: 
            'click #searchbuttom': 'inputChange'
            'click #resetbuttom':  'resetFormArgs'    

        inputChange: (e)=>
            #MainApp.vent.trigger "searchFired"
            query = []
            muni = $('input#searchinput2').val() 
            station_name = $('input#searchinput1').val()
            service_type = $('#selectbasic2 option:selected').val() 
            transit_line = $('#selectbasic1 option:selected').val()
            station_type = $('#selectbasic3 option:selected').val()
            etod_group = $('#selectbasic4 option:selected').val()
            mymuni = "#{muni}"
            mystationname = "#{station_name}"
            @collection.add 'muni': "#{muni}"
            @collection.add 'station_name': "#{station_name}"
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
        
            

        
           



            



