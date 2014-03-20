@Equitabletod.module "StationsApp", (StationsApp, App, Backbone, Marionette, $, _) ->

	class StationsApp.Router extends Marionette.AppRouter
		appRoutes:
			"stations" : "listStations"

	API =
		listStations: ->
			StationsApp.List.Controller.listStations() 

	App.addInitializer ->
		new StationsApp.Router
			controller: API 