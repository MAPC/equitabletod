@Equitabletod.module "MainApp.Show", (Show, App, Backbone, Marionette, $, _) ->

  Show.Controller =

  	showHomeRegion: ->
  		collapsterms = App.request "collapsterm:entities"
  		homeRegionView = @getLayoutView collapsterms
  		App.mainRegion.show homeRegionView
  	
  	getLayoutView: (collapsterms) ->
  		new Show.Home
  			model: collapsterms