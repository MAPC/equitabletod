@Equitabletod.module "DictionariesApp.List", (List, App, Backbone, Marionette, $, _) ->

	List.Controller =

		listDictionaries: ->
			App.request "dictionary:entities", (dictionary) =>

				@layout = @getLayoutView()

				@layout.on "show", =>
					@showModals dictionary
					#@showFstations dictionary

				App.mainRegion.show @layout

		###showMap: (fstations) ->
			mapView = @getMapView fstations
			@layout.mapRegion.show mapView###

		showModals: (dictionary) ->
			modalsView = @getModalsView dictionary
			@layout.modals.show modalsView

		getModalsView: (dictionary) ->
			new List.Modal1
				collection: dictionary

		###getMapView: (fstations) ->
			new List.Map
				collection: fstations###

		getLayoutView: ->
			new List.Layout