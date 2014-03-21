@Equitabletod.module "StationsApp.List", (List, App, Backbone, Marionette, $, _) ->

	List.Controller =

		listStations: ->

			App.request "station:entity", (stations) =>

				@layout = @getLayoutView()

				@layout.on "show", =>
					#@showMap stations
					@showStations stations

				App.mainRegion.show @layout

		#showMap: (stations) ->
			#mapView = @getMapView stations
			#@layout.mapRegion.show mapView

		showStations: (stations) ->
			stationsView = @getStationsView stations
			@layout.stationsRegion.show stationsView

		getStationsView: (stations) ->
			new List.Stations
				collection: stations

		#getMapView: (fstations) ->
			#new List.Map
				#model: fstations

		getLayoutView: ->
			new List.Layout