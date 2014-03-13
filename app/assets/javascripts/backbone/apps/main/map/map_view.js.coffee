@Equitabletod.module "MainApp.Map", (Map, App, Backbone, Marionette, $, _) ->

  class Map.MapView extends App.Views.Layout
  class Map.MapView extends Backbone.Leaflet.MapView
		template: "main/map/map_layout"
		el: "#map"







###  class Map.View extends Backbone.Leaflet.MapView
  	el: "#map"
  	collection: geoCollection
  	# map: (options)###
