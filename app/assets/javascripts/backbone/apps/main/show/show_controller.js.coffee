@Equitabletod.module "MainApp.Show", (Show, App, Backbone, Marionette, $, _) ->

  Show.Controller =

  	showMainRegion: ->
  		mainRegionView = @getLayoutView()
  		App.mainRegion.show mainRegionView

  	getLayoutView: ->
  		new Show.Home




