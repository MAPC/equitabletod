@Equitabletod.module "UsrGuid.Show", (Show, App, Backbone, Marionette, $, _) ->

  Show.Controller =
  	showUsrGuid: ->
  		usrGuidView = @getUsrGuidView()
  		App.mainRegion.show usrGuidView

  	getUsrGuidView: ->
  		new UsrGuid.UsrGuidLayout

