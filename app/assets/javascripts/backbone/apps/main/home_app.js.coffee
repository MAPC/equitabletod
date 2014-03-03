@Equitabletod.module "HomeApp.Main", (Home, App, Backbone, Marionette, $, _) ->
  @startWithParent = false

  API =
    showHome: ->
      Main.Home.Controller.showHome()

      
  Home.on "start", ->
  	API.showHome()