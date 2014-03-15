@Equitabletod.module "UsrGuidApp", (UsrGuidApp, App, Backbone, Marionette, $, _) ->
	@startWithParent = false

	class UsrGuidApp.Router extends Marionette.AppRouter
		appRoutes:
			"usrguid/usrguid": "showUsrGuid"
	
	UsrGuidApp.vent = new Backbone.Wreqr.EventAggregator()
	
	API =
		showUsrGuid: ->
			UsrGuidApp.Show.Controller.showUsrGuid()

	UsrGuidApp.on "start", ->
#		API.showUsrGuid()
	UsrGuidApp.vent.on "fireGuid", ->
    	MainApp.vent.trigger "cleanForGuid"
    	MainApp.vent.trigger "fireUsrGuid"
    	API.showUsrGuid()