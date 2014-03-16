@Equitabletod.module "UsrGuidApp", (UsrGuidApp, App, Backbone, Marionette, $, _) ->
	@startWithParent = false

	class UsrGuidApp.Router extends Marionette.AppRouter
		appRoutes:
			"guid/": "showUsrGuid"
	
	UsrGuidApp.vent = new Backbone.Wreqr.EventAggregator()
	
	API =
		showUsrGuid: ->
			UsrGuidApp.Show.Controller.showUsrGuid()

	UsrGuidApp.vent.on "fireGuid", ->
    	App.vent.trigger "cleanForGuid"
    	App.vent.trigger "fireGuid"
    	API.showUsrGuid()