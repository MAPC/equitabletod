@Equitabletod.module "MainApp.UsrGuid", (UsrGuid, App, Backbone, Marionette, $, _) ->

  UsrGuid.Controller =


  	showUsrGuid: ->

  		usrGuidView = @getUsrGuidView()
  		App.mainRegion.show usrGuidView



  	getUsrGuidView: ->
  		new UsrGuid.UsrGuid

