@Equitabletod.module "MainApp.Search", (Search, App, Backbone, Marionette, $, _) ->

	class Search.SimpleSearchFormItemView extends App.Views.ItemView
        template: "main/search/templates/simple_search_layout" 

        tagName: "div"
        className: "col-sm-6 col-sm-offset-0 text-left"
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
        
            _.map @collection.models, (model) -> console.log model
            triggers: 
                'click #searchbuttom': 'search:query'



            



