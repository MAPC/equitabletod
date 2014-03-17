@Equitabletod.module "MainApp.Search", (Search, App, Backbone, Marionette, $, _) ->
    
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
            sugestions: App.request "sugestion:entities"
        events: 
            'click #searchbuttom': 'inputChange'
            'click #resetbuttom':  'resetFormArgs' 
            
        inputChange: (e)=>
            query = []
            @collection.add 'muni': $('input#searchinput2').val() if $('input#searchinput2').val() 
            @collection.add 'station_name': $('input#searchinput1').val() if $('input#searchinput1').val() 
            @collection.add 'service_type': $('#selectbasic2 option:selected').val() 
            @collection.add 'transit_line': $('#selectbasic1 option:selected').val()
            @collection.add 'station_type': $('#selectbasic3 option:selected').val()
            @collection.add 'etod_group': $('#selectbasic4 option:selected').val()

            _.map @collection.models, (model) =>
                muni = model.get 'muni' if not _.isUndefined model.get 'muni'
                station_name = model.get 'station_name' if not _.isUndefined model.get 'station_name'
                console.log(station_name)
                console.log(muni)
                (query = query.concat muni, station_name) if not (_.isUndefined(_(model).value)) 

            ###isFoundIn = (searchTerm, arrayToSearch) ->
                return true for item in arrayToSearch when item is searchTerm
                false###
            myquery = "search/?#{query}"
            console.log(myquery) 
            
            triggers: 
                'click #searchbuttom': 'search:query'
           



            



