@Equitabletod.module "UsrGuidApp", (UsrGuidApp, App, Backbone, Marionette, $, _) ->
	@startWithParent = false

	class UsrGuidApp.Router extends Marionette.AppRouter
		AppRoutes:
			"show": "showUsrGuid"


	API =
		showUsrGuid: ->
			UsrGuidApp.Show.Controller.showGuid()


	UsrGuidApp.on "start", ->
		API.showUsrGuid()

