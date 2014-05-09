@Equitabletod.module "AdvsearchApp", (AdvsearchApp, App, Backbone, Marionette, $, _) ->
	@startWithParent = false
	class AdvsearchApp.Router extends Marionette.AppRouter
		appRoutes:
			"advsearch/" : "showAdvsearchPage"
	API = 	
		showAdvsearchPage: ->
			AdvsearchApp.List.Controller.showAdvsearchPage()


	App.addInitializer ->
		new AdvsearchApp.Router
			controller: API 