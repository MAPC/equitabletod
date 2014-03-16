@Equitabletod.module "MainApp.Search", (Search, App, Backbone, Marionette, $, _) ->

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
            @collection.add 'muni': $('input#searchinput2').val()
            @collection.add 'station_name': $('input#searchinput1').val()
            @collection.add 'service_type': $('#selectbasic2 option:selected').val()
            @collection.add 'transit_line': $('#selectbasic1 option:selected').val()
            @collection.add 'station_type': $('#selectbasic3 option:selected').val()
            @collection.add 'etod_group': $('#selectbasic4 option:selected').val()
        
            _.map @collection.models, (model) ->
                muni = model.get 'muni'
                station_name = model.get 'station_name'
                query = query.concat "/?muni=", muni,"station_name=", station_name
            
            triggers: 
                'click #searchbuttom': 'search:query'
           



            



