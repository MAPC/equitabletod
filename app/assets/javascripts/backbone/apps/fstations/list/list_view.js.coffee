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

	class List.Fstations extends App.Views.CollectionView
		template: "fstations/list/templates/_fstations"
		itemView: List.Fstation
		itemViewContainer: "tbody"
		onBeforeRender: ->
			stationfeature = gon.features
			muni_names = _.map stationfeature, (key, value) ->
                muni_names = (_.pluck key, 'muni_name')
                muni_names[2].toLowerCase()
                names = (_.pluck key, 'name')
                names[2].toLowerCase()
            console.log muni_names
            console.log names
            #@collection = names
            names = _.map stationfeature, (key, value) ->
                    names = (_.pluck key, 'name')
                    names[2].toLowerCase()
                console.log names
			# create some people
			station = [
			  {
			    name: names
			    municipality: muni_names
			  }
			]
			console.log stationfeature
			console.log station
		
		onShow: ->
			#@collection = gon.features
			console.log @collection


	class List.Table extends App.Views.Layout
		template: "fstations/list/templates/_table"
		onShow: ->
			tabulate = (data, columns) ->
			  table = d3.select("#table").append("table")
			  thead = table.append("thead")
			  tbody = table.append("tbody")
			  
			  # append the header row
			  thead.append("tr").selectAll("th").data(columns).enter().append("th").text (column) ->
			    column

			  
			  # create a row for each object in the data
			  rows = tbody.selectAll("tr").data(data).enter().append("tr")
			  
			  # create a cell in each row for each column
			  cells = rows.selectAll("td").data((row) ->
			    columns.map (column) ->
			      column: column
			      value: row[column]

			  ).enter().append("td").text((d) ->
			    d.value
			  )
			  table

			features = gon.features
			if features.length == 1
				stationfeature = gon.feature["0"]
				station = [
				  {
				    name: stationfeature.properties.name.toLowerCase()
				    municipality: stationfeature.properties.muni_name.toLowerCase()
				  }
				]
			else
				stationfeature = gon.features
				muni_names = _.map stationfeature, (key, value) ->
                    muni_names = (_.pluck key, 'muni_name')
                    muni_names[2].toLowerCase()
                    names = (_.pluck key, 'name')
                    names[2].toLowerCase()
                console.log muni_names
                console.log names
	            names = _.map stationfeature, (key, value) ->
	                    names = (_.pluck key, 'name')
	                    names[2].toLowerCase()
	                console.log names
				# create some people
				station = [
				  {
				    name: names
				    municipality: muni_names
				  }
				]
			console.log stationfeature
			

			# render the table
			stationsTable = tabulate(station, [
			  "name"
			  "municipality"
			])

			# uppercase the column headers
			stationsTable.selectAll("thead th").text (column) ->
			  column.charAt(0).toUpperCase() + column.substr(1)


			# sort by age
			stationsTable.selectAll("tbody tr").sort (a, b) ->
			  d3.descending a.age, b.age



	class List.EmptyMap extends App.Views.Layout
		template: "fstations/list/templates/_empty_map"
		
	class List.Chart extends App.Views.Layout
		template: "fstations/list/templates/_chart"
		onShow: ->
			console.log gon.feature
			console.log gon.feature["0"]
			stationfeature = gon.feature["0"]
			console.log stationfeature.properties.etod_sub1t
			console.log _.values gon.feature.properties
			console.log _.keys gon.feature
			w = 300
			h = 300
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
			      axis: "Orientation"
			      value: stationfeature.properties.etod_sub2o
			    }
			    {
			      axis: "Transit"
			      value: stationfeature.properties.etod_sub1t
			    }
			    {
			      axis: "Development"
			      value: stationfeature.properties.etod_sub3d
			    }
			  ]
			 
			]

			#Options for the Radar chart, other than default
			mycfg =
			  w: w
			  h: h
			  maxValue: 20
			  levels: 4
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
			  maxZoom: 16
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

			#searchCtrl1.addTo map
			#searchCtrl2.addTo map
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
				    L.circle latlng, 200,
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
		

			




