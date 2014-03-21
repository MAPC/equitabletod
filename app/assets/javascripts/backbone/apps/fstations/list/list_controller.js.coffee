@Equitabletod.module "FstationsApp.List", (List, App, Backbone, Marionette, $, _) ->

	List.Controller =

		listFstations: ->
			App.request "fstation:entities", (fstations) =>
				

				@layout = @getLayoutView()

				@layout.on "show", =>
					@showMap fstations
					#@showFstations fstations

				App.mainRegion.show @layout

		showMap: (fstations) ->
			mapView = @getMapView fstations
			@layout.mapRegion.show mapView


		getMapView: (fstations) ->
			new List.Map
				collection: fstations

		getLayoutView: ->
			new List.Layout