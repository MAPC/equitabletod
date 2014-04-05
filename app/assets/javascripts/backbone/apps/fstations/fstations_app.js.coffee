@Equitabletod.module "FstationsApp", (FstationsApp, App, Backbone, Marionette, $, _) ->
	@startWithParent = false
	class FstationsApp.Router extends Marionette.AppRouter
		appRoutes:
			"fstations/:q" : "listFstations"
			"fss/q/:q" : "getFstation"

	App.vent.on 'get:fstation', (q) ->
		Backbone.history.navigate "fstations/#{q}", { trigger: true }
	App.vent.on 'list:fstations', (q) ->
		console.log "inside list fstations trigger"
		console.log q


	API = 

		getFstation: (q) ->
			FstationsApp.List.Controller.getFstationById(q) 
		
		listFstations: ->
			FstationsApp.List.Controller.listFstations()

	App.addInitializer ->
		new FstationsApp.Router
			controller: API 
 
