@Equitabletod.module "FstationsApp.List", (List, App, Backbone, Marionette, $, _) ->

	class List.Layout extends App.Views.Layout
		template: "fstations/list/templates/list_layout"
		
		regions: 
			mapRegion: "#map-region"
			#fstationsRegion: "#fstations-region"

	class List.Map extends App.Views.Layout
		template: "fstations/list/templates/_map"
		collection: @collection
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

			getColor = (d) ->
			  (if d > 50 then "#E31A1C" else (if d > 40 then "#FC4E2A" else (if d > 30 then "#FD8D3C" else (if d > 20 then "#FEB24C" else "#FED976"))))
			style = (feature) ->
			  weight: 0.1
			  opacity: 1
			  color: "black"
			  dashArray: "1"
			  fillOpacity: 0.4
			  fillColor: getColor(feature.properties.Unweighted)
			styleTwo = (feature) ->
			  weight: 1
			  opacity: 0.5
			  color: "black"
			  dashArray: "1"
			  fillOpacity: 0.01
			  fillColor: getColor(feature.properties.Unweighted)
			geojsonData = (style, feature) ->
			  geojson = new L.GeoJSON(@collection,
			    style: style
			    onEachFeature: onEachFeature
			  )
			  return
			geojsonDataTwo = (style, feature) ->
			  geojsonTwo = new L.GeoJSON(@collection,
			    style: styleTwo
			    onEachFeature: onEachFeatureTwo
			  )
			  return
			geojsonData style
			geojsonDataTwo styleTwo

			highlightFeature = (e) ->
			  layer = e.target
			  layer.setStyle
			    weight: 5
			    color: "#000000"
			    dashArray: ""
			    fillOpacity: 0.2

			  layer.bringToFront()  if not L.Browser.ie and not L.Browser.opera
			  return
			resetHighlight = (id) ->
			  id.setStyle
			    weight: 1
			    color: "#000000"
			    dashArray: ""
			    fillOpacity: 0.01

			  return
			geojson = undefined
			geojsonTwo = undefined

			zoomToFeatureTwo = (e) ->
			  layer = e.target
			  map.fitBounds e.target.getBounds()
			  info.update layer.feature.properties
			  return

			zoomToFeature = (e) ->
			  layer = e.target
			  map.fitBounds e.target.getBounds()
			  info.update layer.feature.properties
			  return





