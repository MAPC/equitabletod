@Equitabletod.module "UsrGuidApp.UsrGuid", (UsrGuid, App, Backbone, Marionette, $, _) ->
	@startWithParent = false
	class UsrGuid.UsrGuidLayout extends App.Views.Layout
    	template: "main/usr_guid/templates/usr_guid_layout"
    	
