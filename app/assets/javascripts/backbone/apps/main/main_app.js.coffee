@Equitabletod.module "MainApp", (MainApp, App, Backbone, Marionette, $, _) ->
  @startWithParent = false
  
  class MainApp.Router extends Marionette.AppRouter
    appRoutes:
      "/": "showSimpleSearchForm"

  MainApp.vent = new Backbone.Wreqr.EventAggregator()
  
  API =
    showSimpleSearchForm: (searchargs)->
      MainApp.Search.Controller.showSimpleSearchForm()


  MainApp.vent.on "searchFired", ->
    App.vent.trigger "searchFired"

  MainApp.on "start", ->
    API.showSimpleSearchForm()  
