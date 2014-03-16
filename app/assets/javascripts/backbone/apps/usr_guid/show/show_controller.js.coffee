@Equitabletod.module "UsrGuidApp.Show", (Show, App, Backbone, Marionette, $, _) ->

  Show.Controller =
  	showUsrGuid: ->
  		App.vent.trigger "cleanHomeRegion"
  		usrGuidView = @getUsrGuidView()
  		App.usrGuidRegion.show usrGuidView

  	getUsrGuidView: ->
  		new Show.UsrGuidLayout

