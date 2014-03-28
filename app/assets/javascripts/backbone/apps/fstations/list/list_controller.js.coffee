@Equitabletod.module "FstationsApp.List", (List, App, Backbone, Marionette, $, _) ->

	List.Controller =

		makeMapContainer: ->
			@layout = @getLayoutView()
			@layout.on "show", =>
				@showEmptyMap
			
		showEmptyMap: ->
			emptyMapView = @getEmptyMapView 
			App.mainRegion.show emptyMapView

		getEmptyMapView: ->
			new List.EmptyMap


		listFstations: ->
			App.request "fstation:entities", (fstations) =>
				

				@layout = @getLayoutView()

				@layout.on "show", =>
					@showEmptyMap
					@showMap fstations
					@showFstations fstations

				App.mainRegion.show @layout

		listFstationsQuery: (query)  ->
			App.request "fstation:entities", (fstations) =>

				@layout = @getLayoutView()

				@layout.on "show", =>
					@showMap fstations
					@showFstations fstations

				App.mainRegion.show @layout

		showFstations: (fstations) ->
			fstationsView = @getFstationsView fstations
			@layout.fstationsRegion.show fstationsView

		getFstationsView: (fstations) ->
			new List.Fstations
				collection: fstations


		showMap: (fstations) ->
			mapView = @getMapView fstations
			@layout.mapRegion.show mapView



		getMapView: (fstations) ->
			new List.Map
				collection: fstations

		getLayoutView: ->
			new List.Layout