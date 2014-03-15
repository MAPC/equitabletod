@Equitabletod.module "MainApp.Search", (Search, App, Backbone, Marionette, $, _) ->

    class Search.SimpleSearchFormLayout extends App.Views.Layout
        template: "main/search/templates/simple_search_layout" 
        itemViewContainer: "#form-horizontal"
        className: "col-sm-6 col-sm-offset-0 text-left"
        templateHelpers:->
            sugestions: App.request "sugestion:entities"
        events: 
            'click #searchbuttom': 'inputChange'
            'click #resetbuttom':  'resetFormArgs' 
            
        inputChange: (e)=>
            query = []
            @collection.add 'muni': $('input#searchinput2').val()
            @collection.add 'station_name': $('input#searchinput1').val()
           



            



