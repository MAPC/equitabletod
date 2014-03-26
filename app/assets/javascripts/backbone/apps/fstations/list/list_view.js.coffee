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
			# searchCtrl = L.control.fuseSearch()
			# searchCtrl.addTo map
			console.log @collection
			#fstations = JSON.parse(fstations)
			geoCollection = @collection.toJSON(cid: true)
			console.log geoCollection
			###stationGeoCollection = new L.GeoJSON.AJAX(."/station_areas.json")###
			fstations = new L.GeoJSON geoCollection,
				style: (feature) ->
					feature.properties and feature.properties.style
				pointToLayer: (feature, latlng) ->
				    L.circleMarker latlng,
				      radius: 25
				      fillColor: "#FFFFFF"
				      color: "#000"
				      weight: 1
				      opacity: 0.9
				      fillOpacity: 0.2
				onEachFeature: (feature, layer) ->
					layer.bindPopup feature.properties.name 
					return
				filter: (feature, layer) ->
					not (feature.properties and feature.properties.isHidden)

			map.addLayer(fstations)
			#points = new L.LatLng @collection.toJSON
			console.log map
			map.addControl new L.Control.Search(layer: fstations)
###			searchCtrl.indexFeatures geoCollection, [
			  "name"
			  #"muni_name"
			]###
		

			




