@Equitabletod.module "FstationsApp.List", (List, App, Backbone, Marionette, $, _) ->

	class List.Layout extends App.Views.Layout
		template: "fstations/list/templates/list_layout"
		regions: 
			mapRegion: "#map-region"
			fstationsRegion: "#fstations-region"
		

	class List.Fstation extends App.Views.ItemView
		template: "fstations/list/templates/_fstation"
		tagName: "tr"

	class List.Fstations extends App.Views.Layout
		template: "fstations/list/templates/_fstations"


	class List.EmptyMap extends App.Views.Layout
		template: "fstations/list/templates/_empty_map"
		

	class List.Map extends App.Views.Layout
		template: "fstations/list/templates/_map"
		el: "#map"
		collectionEvents:
			"change" : "render"

		onShow: ->
			console.log "insede on show enevt list_view"
			console.log @collection
			console.log fstations
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
			searchCtrl1 = L.control.fuseSearch()
			searchCtrl2 = L.control.fuseSearch()

			searchCtrl1.addTo map
			searchCtrl2.addTo map
			@collection = gon.features
			console.log @collection
			#fstations = JSON.parse(fstations)
			geoCollection = gon.features
			console.log geoCollection
			###stationGeoCollection = new L.GeoJSON.AJAX(."/station_areas.json")###
			fstations = new L.GeoJSON geoCollection,
				style: (feature) ->
					feature.properties and feature.properties.style
				pointToLayer: (feature, latlng) ->
				    L.circleMarker latlng,
				      radius: 10
				      fillColor: "#FFFFFF"
				      color: "#000"
				      weight: 1
				      opacity: 0.2
				      fillOpacity: 0.4
				onEachFeature: (feature, layer) ->
					layer.bindPopup feature.properties.name + " town of " + feature.properties.muni_name
					return
				filter: (feature, layer) ->
					not (feature.properties and feature.properties.isHidden)

			map.addLayer(fstations)
			#points = new L.LatLng @collection.toJSON
			console.log map
			#map.addControl new L.Control.Search(layer: fstations)
			searchCtrl1.indexFeatures geoCollection, [
			  "muni_name"
			]
			searchCtrl2.indexFeatures geoCollection, [
			  "name"
			]
		

			




