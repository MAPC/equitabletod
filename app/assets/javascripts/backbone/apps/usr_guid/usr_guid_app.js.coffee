@Equitabletod.module "UsrguidApp", (UsrguidApp, App, Backbone, Marionette, $, _) ->
	@startWithParent = false
	class UsrguidApp.Router extends Marionette.AppRouter
		appRoutes:
			"guide/": "showUsrGuid"
		
	API =
		showUsrGuid: ->
			UsrguidApp.List.Controller.showUsrguidPage()

	App.addInitializer ->
		new UsrguidApp.Router
			controller: API 