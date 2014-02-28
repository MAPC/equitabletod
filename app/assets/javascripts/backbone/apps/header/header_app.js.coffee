@Etod.module "HeaderApp", (HeaderApp, App, Backbone, Marionette, $, _) ->

  class HeaderApp.Router extends Marionette.AppRouter
    appRoutes:
      "headers": "list"
    
  API =
    list: ->
      new HeaderApp.List.Controller

      
  App.addInitializer ->
    new HeaderApp.Router
      controller: API
  