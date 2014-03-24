@Equitabletod.module "FstationsApp", (FstationsApp, App, Backbone, Marionette, $, _) ->

	class FstationsApp.Router extends Marionette.AppRouter
		appRoutes:
			"fstations" : "listFstations"

	API =
		listFstations: ->
			FstationsApp.List.Controller.listFstations() 

	App.addInitializer ->
		new FstationsApp.Router
			controller: API 
