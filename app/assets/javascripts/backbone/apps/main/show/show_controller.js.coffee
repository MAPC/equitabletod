@Etod.module "MainApp.Show", (Show, App, Backbone, Marionette, $, _) ->

  Show.Controller =

    showMain: ->
    	mainView = @getLayoutView()
    	App.mainRegion.show mainView

    getLayoutView: ->
      new Show.Layout