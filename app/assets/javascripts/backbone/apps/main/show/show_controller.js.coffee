@Equitabletod.module "MainApp.Show", (Show, App, Backbone, Marionette, $, _) ->

  Show.Controller =

  	showHomeRegion: ->
  		homeRegionView = @getLayoutView()
  		App.mainRegion.show homeRegionView
  	
  	getLayoutView: ->
  		new Show.Home