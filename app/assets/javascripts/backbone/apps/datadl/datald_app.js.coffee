@Equitabletod.module "DatadlApp", (DatadlApp, App, Backbone, Marionette, $, _) ->
	@startWithParent = false
	class DatadlApp.Router extends Marionette.AppRouter
		appRoutes:
			"datadl/" : "showDatadlPage"
	API = 	
		showDatadlPage: ->
			DatadlApp.List.Controller.showDatadlPage()


	App.addInitializer ->
		new DatadlApp.Router
			controller: API 