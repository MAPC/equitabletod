@Equitabletod.module "MainApp", (MainApp, App, Backbone, Marionette, $, _) ->
  @startWithParent = false
      
  class MainApp.Router extends Marionette.AppRouter
    appRoutes:
      "home": "showHomeRegion"
      "map": "addMap"
      "search/submit": "searchSubmit"
      "carousel": "showCarousel"

  MainApp.vent = new Backbone.Wreqr.EventAggregator()
  
  API =
    showHomeRegion: ->
      MainApp.Show.Controller.showHomeRegion()

    showEtodpage: ->
      MainApp.Etod.Controller.showEtodpage()

    showSimpleSearchForm: (searchargs)->
      MainApp.Search.Controller.showSimpleSearchForm()

    addMap: ->
      MainApp.Map.Controller.addMap()

#    showResultsPage: ->
#      MainApp.Results.Controller.showResultsView()


#    removeHomeRegion: =>
#      @RegionMan.reset()
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


  MainApp.on "initialize:before", ->
    fstations = App.request 'fstation:entities'
    searchargs = App.request 'searcharg:entity'
    
  MainApp.on "start", ->
    API.showHomeRegion() 
#    API.showCarousel()
#    API.showResultsPage()
#    API.provideMap()
    API.showSimpleSearchForm()  
