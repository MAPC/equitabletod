@Equitabletod.module "FstationsApp", (FstationsApp, App, Backbone, Marionette, $, _) ->
	@startWithParent = false
	class FstationsApp.Router extends Marionette.AppRouter
		appRoutes:
			"fstations" : "listFstations"
			"fstations/:id" : "getFstation"

	App.vent.on 'get:fstation', (id) ->
		Backbone.history.navigate "fstations/#{id}", { trigger: true }

	API =
		makeMapContainer: ->
			FstationsApp.List.Controller.makeMapContainer()
		
		listFstations: ->
			FstationsApp.List.Controller.listFstations() 

		getFstation: (id) ->
			FstationsApp.List.Controller.getFstationById(id) 


	App.addInitializer ->
		new FstationsApp.Router
			controller: API 

	FstationsApp.on "start", ->
    	API.makeMapContainer() 
