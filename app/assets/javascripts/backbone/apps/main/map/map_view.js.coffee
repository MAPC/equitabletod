@Equitabletod.module "MainApp.Map", (Map, App, Backbone, Marionette, $, _) ->

  #class Map.MapView extends Backbone.Leaflet.MapView
  class Map.MapView extends App.Views.Layout	
		template: "main/map/map_layout"
		el: "#map"
		templateHelpers: ->
		   `var map = L.map('maphome', {
				center: [42.35, -71.06],
				zoom: 10,
				scrollWheelZoom: false,
				zoomAnimation: false,
				closePopupOnClick: true,
				dragging : false,
				});
			        L.tileLayer('http://tiles.mapc.org/basemap/{z}/{x}/{y}.png', {
					attribution: 'Tiles by <a href="http://www.mapc.org/">Metropolitan Area Planning Council</a>.'
				}).addTo(map);`

	








###  class Map.View extends Backbone.Leaflet.MapView
  	el: "#map"
  	collection: geoCollection
  	# map: (options)###
