@Equitabletod.module "MainApp.Map", (Map, App, Backbone, Marionette, $, _) ->

  Map.Controller =

    getGeoFeature: ->
    	geoclass = App.request "geofeature:entities"

    	mapView = @getMapView geoclass
    	App.MainRegion.show mapView

    getGeoCollection: (geoclass) ->
    	new Map.MapView
    		collection: geoclass
