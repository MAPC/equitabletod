@Equitabletod.module "UsrGuidApp.Show", (Show, App, Backbone, Marionette, $, _) ->

  Show.Controller =
  	showUsrGuid: ->
  		usrGuidView = @getUsrGuidView()
  		UsrGuidApp.vent.trigger "cleanHomeRegion"
  		App.usrGuidRegion.show usrGuidView

  	getUsrGuidView: ->
  		new UsrGuidApp.UsrGuidLayout

