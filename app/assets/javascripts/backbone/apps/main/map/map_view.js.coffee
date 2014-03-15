@Equitabletod.module "MainApp.Map", (Map, App, Backbone, Marionette, $, _) ->

<<<<<<< HEAD
  class Map.Map extends Backbone.Leaflet.MapView
  	template: "main/map/map_layout"
=======
  class Map.MapView extends App.Views.Layout
  class Map.MapView extends Backbone.Leaflet.MapView
		template: "main/map/map_layout"
>>>>>>> parent of c5fce05... leaflet loaded
		el: "#map"
  class Map.MapView extends App.Views.CompositeView
  	template: "main/map/map_composite"
  	itemView: "map"
  	itemViewContainer: "map-container"

<<<<<<< HEAD
=======






###  class Map.View extends Backbone.Leaflet.MapView
  	el: "#map"
  	collection: geoCollection
  	# map: (options)###
>>>>>>> parent of c5fce05... leaflet loaded
