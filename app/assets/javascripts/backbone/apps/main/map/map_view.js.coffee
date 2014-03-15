@Equitabletod.module "MainApp.Map", (Map, App, Backbone, Marionette, $, _) ->

  class Map.Map extends Backbone.Leaflet.MapView
  	template: "main/map/map_layout"
		el: "#map"
  class Map.MapView extends App.Views.CompositeView
  	template: "main/map/map_composite"
  	itemView: "map"
  	itemViewContainer: "map-container"

