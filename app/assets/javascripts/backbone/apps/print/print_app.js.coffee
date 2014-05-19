@Equitabletod.module "PrintApp", (PrintApp, App, Backbone, Marionette, $, _) ->
	@startWithParent = false
	class PrintApp.Router extends Marionette.AppRouter
		appRoutes:
			"print/q/" : "printFstation"

	API = 

		printFstation: ->
			PrintApp.List.Controller.printFstation() 

	App.addInitializer ->
		new PrintApp.Router
			controller: API 
 