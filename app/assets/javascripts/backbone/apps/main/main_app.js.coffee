@Equitabletod.module "MainApp", (MainApp, App, Backbone, Marionette, $, _) ->
  @startWithParent = false
      
  class MainApp.Router extends Marionette.AppRouter
    appRoutes:
      "home": "showHomeRegion"

  MainApp.vent = new Backbone.Wreqr.EventAggregator()
  
  API =
    showHomeRegion: ->
      MainApp.Show.Controller.showHomeRegion()

    showEtodpage: ->
      MainApp.Etod.Controller.showEtodpage()

    showSimpleSearchForm: (searchargs)->
      MainApp.Search.Controller.showSimpleSearchForm()


  MainApp.vent.on "searchFired", ->
    App.vent.trigger "searchFired"

  MainApp.vent.on "etodFired", ->
    App.vent.trigger "etodFired"
    API.showEtodpage()

  MainApp.vent.on "homeFired", ->
    App.vent.trigger "homeFired"
    API.showHomeRegion()

  MainApp.vent.on "cleanForGuid", ->
    App.vent.trigger "cleanHomeRegion"
    
  MainApp.on "start", ->
    API.showHomeRegion() 
    API.showSimpleSearchForm()  
