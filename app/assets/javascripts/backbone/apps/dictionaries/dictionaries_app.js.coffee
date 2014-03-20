@Equitabletod.module "DictionariesApp", (DictionariesApp, App, Backbone, Marionette, $, _) ->

	class DictionariesApp.Router extends Marionette.AppRouter
		appRoutes:
			"dictionries" : "listDictionaries"

	API =
		listDictionaries: ->
			DictionariesApp.List.Controller.listDictionaries() 

	App.addInitializer ->
		new DictionariesApp.Router
			controller: API 