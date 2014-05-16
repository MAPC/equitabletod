@Equitabletod.module "EtodApp", (EtodApp, App, Backbone, Marionette, $, _) ->
	@startWithParent = false
	class EtodApp.Router extends Marionette.AppRouter
		appRoutes:
			"etod/" : "showEtodPage"
	API = 	
		showEtodPage: ->
			EtodApp.List.Controller.showEtodPage()


	App.addInitializer ->
		new EtodApp.Router
			controller: API 