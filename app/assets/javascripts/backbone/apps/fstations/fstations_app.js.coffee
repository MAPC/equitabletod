@Equitabletod.module "FstationsApp", (FstationsApp, App, Backbone, Marionette, $, _) ->

	class FstationsApp.Router extends Marionette.AppRouter
		appRoutes:
			"fstations" : "listFstations"
			"fstations/:query" : "listFstationsQuery"

	API =
		listFstations: ->
			FstationsApp.List.Controller.listFstations() 

		listFstationsQuery: (query) ->
			console.log "im inside the FstationsApp"
			console.log query
			FstationsApp.List.Controller.listFstationsQuery(query) 

	App.addInitializer ->
		new FstationsApp.Router
			controller: API 
