@Equitabletod.module "MainApp.Etod", (Etod, App, Backbone, Marionette, $, _) ->

  Etod.Controller =

  	showEtodpage: ->
  		etodPageView = @getEtodpageLayout() 
  		App.etodRegion.show etodPageView
  	
  	getEtodpageLayout: ->
  		new Etod.Etodpage