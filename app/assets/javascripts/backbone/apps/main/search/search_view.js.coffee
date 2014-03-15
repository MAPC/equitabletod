@Equitabletod.module "MainApp.Search", (Search, App, Backbone, Marionette, $, _) ->

    class Search.SimpleSearchFormLayout extends App.Views.CollectionView

        template: "main/search/templates/simple_search_layout" 
        itemViewContainer: "#form-horizontal"
        className: "col-sm-6 col-sm-offset-0 text-left"
        events: 
            'click #searchbuttom': 'inputChange'
            'click #resetbuttom':  'resetFormArgs' 

        inputChange: (e)=>
            query = []
            @model.add 'muni': $('input#searchinput2').val()
            @model.add 'station_name': $('input#searchinput1').val()
           



            



