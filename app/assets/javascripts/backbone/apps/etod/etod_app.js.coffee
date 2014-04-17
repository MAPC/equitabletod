@Equitabletod.module "EtodApp", (EtodApp, App, Backbone, Marionette, $, _) ->
	@startWithParent = false
	class EtodApp.Router extends Marionette.AppRouter
		appRoutes:
			"etod/" : "showEtodPage"
			"learnabouttod/" : "showLearnabouttodPage"
	API = 	
		showEtodPage: ->
			EtodApp.List.Controller.showEtodPage()

		showLearnabouttodPage: ->
			EtodApp.List.Controller.showLearnabouttodPage()

	App.addInitializer ->
		new EtodApp.Router
			controller: API 