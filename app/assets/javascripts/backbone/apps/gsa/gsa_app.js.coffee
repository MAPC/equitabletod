@Equitabletod.module "GsaApp", (GsaApp, App, Backbone, Marionette, $, _) ->
	@startWithParent = false
	class GsaApp.Router extends Marionette.AppRouter
		appRoutes:
			"gsa/" : "showGsaPage"
	API = 	
		showGsaPage: ->
			GsaApp.List.Controller.showGsaPage()


	App.addInitializer ->
		new GsaApp.Router
			controller: API 