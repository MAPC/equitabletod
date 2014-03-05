@Equitabletod.module "MainApp.Map", (Map, App, Backbone, Marionette, $, _) ->

  Map.Controller =
  	provideMap: ->
  		map = @getMap()
  		App.mainRegion.show map

  	getMap: ->
  		new Map.Layout


###    class getGeoCollection extends Backbone.Leaflet.GeoModel 
    	collection: getGeoCollection	


    	    getGeoFeature: ->
    	geoclass = App.request "geofeature:entities"

    	mapView = @getMapView geoclass
    	App.MainRegion.show mapView

    getGeoCollection: (geoclass) ->
    	new Map.MapView
    		collection: geoclass  ###
