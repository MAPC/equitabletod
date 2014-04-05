@Equitabletod.module "FstationsApp.List", (List, App, Backbone, Marionette, $, _) ->

	class List.Layout extends App.Views.Layout
		template: "fstations/list/templates/list_layout"
		regions: 
			mapRegion: "#map-region"
			fstationsRegion: "#fstations-region"
			chartRegion: "#chart-region"
		

	class List.Fstation extends App.Views.ItemView
		template: "fstations/list/templates/_fstation"
		tagName: "tr"

	class List.Fstations extends App.Views.Layout
		template: "fstations/list/templates/_fstations"


	class List.EmptyMap extends App.Views.Layout
		template: "fstations/list/templates/_empty_map"
		
	class List.Chart extends App.Views.Layout
		template: "fstations/list/templates/_chart"
		onShow: ->
			w = 500
			h = 500
			colorscale = d3.scale.category10()

			#Legend titles
			LegendOptions = [
			  "Smartphone"
			  "Tablet"
			]

			#Data
			d = [
			  [
			    {
			      axis: "Email"
			      value: 0.59
			    }
			    {
			      axis: "Social Networks"
			      value: 0.56
			    }
			    {
			      axis: "Internet Banking"
			      value: 0.42
			    }
			    {
			      axis: "News Sportsites"
			      value: 0.34
			    }
			    {
			      axis: "Search Engine"
			      value: 0.48
			    }
			    {
			      axis: "View Shopping sites"
			      value: 0.14
			    }
			    {
			      axis: "Paying Online"
			      value: 0.11
			    }
			    {
			      axis: "Buy Online"
			      value: 0.05
			    }
			    {
			      axis: "Stream Music"
			      value: 0.07
			    }
			    {
			      axis: "Online Gaming"
			      value: 0.12
			    }
			    {
			      axis: "Navigation"
			      value: 0.27
			    }
			    {
			      axis: "App connected to TV program"
			      value: 0.03
			    }
			    {
			      axis: "Offline Gaming"
			      value: 0.12
			    }
			    {
			      axis: "Photo Video"
			      value: 0.4
			    }
			    {
			      axis: "Reading"
			      value: 0.03
			    }
			    {
			      axis: "Listen Music"
			      value: 0.22
			    }
			    {
			      axis: "Watch TV"
			      value: 0.03
			    }
			    {
			      axis: "TV Movies Streaming"
			      value: 0.03
			    }
			    {
			      axis: "Listen Radio"
			      value: 0.07
			    }
			    {
			      axis: "Sending Money"
			      value: 0.18
			    }
			    {
			      axis: "Other"
			      value: 0.07
			    }
			    {
			      axis: "Use less Once week"
			      value: 0.08
			    }
			  ]
			  [
			    {
			      axis: "Email"
			      value: 0.48
			    }
			    {
			      axis: "Social Networks"
			      value: 0.41
			    }
			    {
			      axis: "Internet Banking"
			      value: 0.27
			    }
			    {
			      axis: "News Sportsites"
			      value: 0.28
			    }
			    {
			      axis: "Search Engine"
			      value: 0.46
			    }
			    {
			      axis: "View Shopping sites"
			      value: 0.29
			    }
			    {
			      axis: "Paying Online"
			      value: 0.11
			    }
			    {
			      axis: "Buy Online"
			      value: 0.14
			    }
			    {
			      axis: "Stream Music"
			      value: 0.05
			    }
			    {
			      axis: "Online Gaming"
			      value: 0.19
			    }
			    {
			      axis: "Navigation"
			      value: 0.14
			    }
			    {
			      axis: "App connected to TV program"
			      value: 0.06
			    }
			    {
			      axis: "Offline Gaming"
			      value: 0.24
			    }
			    {
			      axis: "Photo Video"
			      value: 0.17
			    }
			    {
			      axis: "Reading"
			      value: 0.15
			    }
			    {
			      axis: "Listen Music"
			      value: 0.12
			    }
			    {
			      axis: "Watch TV"
			      value: 0.1
			    }
			    {
			      axis: "TV Movies Streaming"
			      value: 0.14
			    }
			    {
			      axis: "Listen Radio"
			      value: 0.06
			    }
			    {
			      axis: "Sending Money"
			      value: 0.16
			    }
			    {
			      axis: "Other"
			      value: 0.07
			    }
			    {
			      axis: "Use less Once week"
			      value: 0.17
			    }
			  ]
			]

			#Options for the Radar chart, other than default
			mycfg =
			  w: w
			  h: h
			  maxValue: 0.6
			  levels: 6
			  ExtraWidthX: 300


			#Call function to draw the Radar chart
			#Will expect that data is in %'s
			RadarChart.draw "#chart", d, mycfg

			#//////////////////////////////////////////
			#///////// Initiate legend ////////////////
			#//////////////////////////////////////////
			svg = d3.select("#body").selectAll("svg").append("svg").attr("width", w + 300).attr("height", h)

			#Create the title for the legend
			text = svg.append("text").attr("class", "title").attr("transform", "translate(90,0)").attr("x", w - 70).attr("y", 10).attr("font-size", "12px").attr("fill", "#404040").text("What % of owners use a specific service in a week")

			#Initiate Legend	
			legend = svg.append("g").attr("class", "legend").attr("height", 100).attr("width", 200).attr("transform", "translate(90,20)")

			#Create colour squares
			legend.selectAll("rect").data(LegendOptions).enter().append("rect").attr("x", w - 65).attr("y", (d, i) ->
			  i * 20
			).attr("width", 10).attr("height", 10).style "fill", (d, i) ->
			  colorscale i


			#Create text next to squares
			legend.selectAll("text").data(LegendOptions).enter().append("text").attr("x", w - 52).attr("y", (d, i) ->
			  i * 20 + 9
			).attr("font-size", "11px").attr("fill", "#737373").text (d) ->
			  d



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
			  maxZoom: 14
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
			console.log map.getBounds()
			bbox = fstations.getBounds().toBBoxString()
			console.log bbox
			map.fitBounds [
			  [
			    parseFloat(bbox.split(",")[1])
			    parseFloat(bbox.split(",")[0])
			  ]
			  [
			    parseFloat(bbox.split(",")[3])
			    parseFloat(bbox.split(",")[2])
			  ]
			]
			#points = new L.LatLng @collection.toJSON
			console.log map
			#map.addControl new L.Control.Search(layer: fstations)
			searchCtrl1.indexFeatures geoCollection, [
			  "muni_name"
			]
			searchCtrl2.indexFeatures geoCollection, [
			  "name"
			]
		

			




