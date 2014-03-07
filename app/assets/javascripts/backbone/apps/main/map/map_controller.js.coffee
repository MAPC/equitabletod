@Equitabletod.module "MainApp.Map", (Map, App, Backbone, Marionette, $, _) ->

  Map.Controller =

  	provideMap: ->
  		map = @getMap()
  		App.mapRegion.show map

  	getMap: ->
#      App.request "reset:mainRegion"
  		new Map.Layout


###
    emptyRegion: ->
      App.mainRegion.close homeRegionView###



###    class getGeoCollection extends Backbone.Leaflet.GeoModel 
    	collection: getGeoCollection	


    	    getGeoFeature: ->
    	geoclass = App.request "geofeature:entities"

    	mapView = @getMapView geoclass
    	App.MainRegion.show mapView

    getGeoCollection: (geoclass) ->
    	new Map.MapView
    		collection: geoclass  ###


