@Equitabletod.module "MainApp.Search", (Search, App, Backbone, Marionette, $, _) ->
    #MainApp.commands = new Backbone.Wreqr.Commands()

    class Search.SimpleSearchFormLayout extends App.Views.Layout
        template: "main/search/templates/simple_search_layout" 
        itemViewContainer: "#form-horizontal"
        className: "col-md-12 col-md-offset-0 text-left"
        
        templateHelpers:->
            munis = "#{gon.munis.munis}"
            console.log munis


        events: 
            'change #selectbasic2' : 'servicTypeSelected'
            'click #searchbuttom': 'inputChange'
            'click #resetbuttom':  'resetFormArgs' 
            'click #mapClick': 'fireMap'   
            #'mouseover #searchinput2': 'hoverMuniFired'

        inputChange: (e)=>
            #MainApp.vent.trigger "searchFired"
            urlq = "search.json?"
            muni = $('input#searchinput2').val() 
            station_name = $('input#searchinput1').val()
            transit_line = $('#selectbasic1 option:selected').val()
            station_type = $('#selectbasic3 option:selected').val()
            etod_group = $('#selectbasic4 option:selected').val()
            query = "#{urlq}by_muni#{muni}"
            @collection.add 'muni': "#{muni}"
            @collection.add 'station_name': "#{station_name}"
            @collection.add 'transit_line': "#{transit_line}"
            @collection.add 'station_type': "#{station_type}"
            @collection.add 'etod_group': "#{etod_group}"
            @collection.add 'query': "#{query}"
            query = "#{query}"
            console.log(query)
            #App.request "fstation:entity" (query)
        
        hoverMuniFired: (e) =>
            console.log('inside hover event') 
            #sugestions = @sugestions()
            #console.log('after the call')
            #textSuggestions = "#{sugestions}"
            #console.log(textSuggestions) 
            #console.log(sugestions) 

        servicTypeSelected: (e) =>
            service_type = $('#selectbasic2 option:selected').val() 
            @collection.add 'service_type': "#{service_type}"
            $("#selectbasic1").html("<option> will load accordingly </option>")


        fireMap: (e) =>
            App.vent.trigger "fireMap"


           



            



