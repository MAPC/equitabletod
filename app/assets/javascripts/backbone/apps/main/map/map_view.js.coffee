@Equitabletod.module "MainApp.Map", (Map, App, Backbone, Marionette, $, _) ->

    class Map.Layout extends App.Views.Layout
      template: "main/map/map_layout"







###  class Map.View extends Backbone.Leaflet.MapView
  	el: "#map"
  	collection: geoCollection
  	# map: (options)###
