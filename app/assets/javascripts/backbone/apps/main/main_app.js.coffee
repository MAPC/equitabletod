@Etod.module "MainApp", (MainApp, App, Backbone, Marionette, $, _) ->
  @startWithParent = false

  API =
    showMain: ->
      MainApp.Show.Controller.showMain()

      
  MainApp.on "start", ->
  	API.showMain()