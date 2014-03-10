@Equitabletod.module "MainApp.Map", (Map, App, Backbone, Marionette, $, _) ->
  
  Map.Leaflet = ->
    # Create new map
    createMap: (elementId) ->
      @map = new L.Map(elementId)
      @addBaseMap()
      map
    
    addBaseMap: ()->
      # TODO: This should probably be private
      cloudmadeUrl = 'http://{s}.tile.cloudmade.com/da13504e06a041dcb81804e6100c8b55/106695/256/{z}/{x}/{y}.png'
      cloudmadeAttribution = 'Map data &copy; 2011 OpenStreetMap contributors, Imagery &copy; 2011 CloudMade'
      layer = new L.tileLayer(cloudmadeUrl, {maxZoom: 18, attribution: cloudmadeAttribution})
      @addLayerToMap(layer)
    
    addLayerToMap: (layer) ->
      @map.addLayer(layer)
    
    setViewForMap: (options) ->
      point = new L.LatLng(options.latitude, options.longitude)
      @map.setView(point, options.zoomLevel)

