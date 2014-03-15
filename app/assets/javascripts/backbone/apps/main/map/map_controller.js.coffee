@Equitabletod.module "MainApp.Map", (Map, App, Backbone, Marionette, $, _) ->

  Map.Controller =
<<<<<<< HEAD

    addMap: ->
        fstations = App.request 'fstation:entities'
        map = @getMap fstations
        App.mapRegion.show map
=======
    
    addEmptyMap: ->
      mapEmpty = @getMapEmpty
      App.mapRegion.show mapEmpty

    getMapEmpty: ->
      new Map.MapView

    addMap: ->
      fstations = App.request 'fstation:entity', (2)
      map = @getMap fstations
      App.mapRegion show map
>>>>>>> parent of c5fce05... leaflet loaded

    getMap: (fstations) ->
      new Map.MapView
          collection: fstations

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


