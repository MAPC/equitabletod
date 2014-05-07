@Equitabletod.module "AbouttodApp", (AbouttodApp, App, Backbone, Marionette, $, _) ->
	@startWithParent = false
	class AbouttodApp.Router extends Marionette.AppRouter
		appRoutes:
			"abouttod/" : "showAbouttodPage"
	API = 	
		showAbouttodPage: ->
			AbouttodApp.List.Controller.showAbouttodPage()


	App.addInitializer ->
		new AbouttodApp.Router
			controller: API 