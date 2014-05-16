@Equitabletod.module "FstationsApp", (FstationsApp, App, Backbone, Marionette, $, _) ->
	@startWithParent = false
	class FstationsApp.Router extends Marionette.AppRouter
		appRoutes:
			"fss/q/:q" : "getFstation"

	App.vent.on 'get:fstation', (q) ->
		Backbone.history.navigate "fstations/#{q}", { trigger: true }

	API = 

		getFstation: (q) ->
			FstationsApp.List.Controller.getFstationById(q) 

	App.addInitializer ->
		new FstationsApp.Router
			controller: API 
 