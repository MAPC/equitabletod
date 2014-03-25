@Equitabletod.module "FstationsApp.List", (List, App, Backbone, Marionette, $, _) ->

	class List.Layout extends App.Views.Layout
		template: "fstations/list/templates/list_layout"
		
		regions: 
			mapRegion: "#map-region"
			#fstationsRegion: "#fstations-region"

	class List.Map extends App.Views.Layout
		template: "fstations/list/templates/_map"
		
		collectionEvents:
			"change" : "render"

		templateHelpers: ->
			map = L.map("map",
			  scrollWheelZoom: false
			  touchZoom: false
			  doubleClickZoom: true
			  zoomControl: true
			  dragging: true
			)
			map.setView [
			  42.31
			  -71.077359
			], 10
			cloudmade = L.tileLayer("http://tiles.mapc.org/basemap/{z}/{x}/{y}.png",
			  attribution: "Map data &copy; 2011 OpenStreetMap contributors, Imagery &copy; 2011 CloudMade"
			).addTo(map)
			console.log @collection
			#fstations = JSON.parse(fstations)
			geoCollection = @collection.toJSON(cid: true)
			console.log geoCollection
			###stationGeoCollection = new L.GeoJSON.AJAX(."/station_areas.json")###
			fstations = new L.GeoJSON geoCollection
			map.addLayer(fstations)
			console.log map

		onRender: ->
			console.log @map
		

			




