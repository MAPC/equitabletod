@Equitabletod.module "MainApp.Map", (Map, App, Backbone, Marionette, $, _) ->

  Map.Controller =
  	provideMap: (fstation) ->
  		App.request "fstation:entities", fstation, (fstation) ->
        map = @getMap(collection: fstation)
  		App.mapRegion.show map

  	getMap: (collection) ->
#      App.request "reset:mainRegion"
  		new Map.Layout(collection: collection)

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


