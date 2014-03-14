@Equitabletod.module "MainApp.Search", (Search, App, Backbone, Marionette, $, _) ->

    class Search.SimpleSearchFormLayout extends App.Views.Layout
        template: "main/search/templates/simple_search_layout" 
        initialize: ->
            collection = @collection
            @listenTo(collection, 'change', @render)
        onBeforeRender: (e)=> 
            munis = []
            for each in fstations._layers
                muni = fstations._layers[each].feature.properties.station_name
                munis.push({label: muni, value: muni})
        itemViewContainer: "#form-horizontal"
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



            



