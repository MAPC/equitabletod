@Equitabletod.module "MainApp", (MainApp, App, Backbone, Marionette, $, _) ->
  @startWithParent = false
      
  class MainApp.Router extends Marionette.AppRouter
    appRoutes:
      "home": "showHomeRegion"
      "map": "provideMap"
      "search/submit": "searchSubmit"
      "carousel": "showCarousel"
#      "map/": "provideMap"

  MainApp.vent = new Backbone.Wreqr.EventAggregator()
  
  API =
    showHomeRegion: ->
      MainApp.Show.Controller.showHomeRegion()

    showCarousel: ->
      MainApp.Carousel.Controller.showCarousel()

    showSimpleSearchForm: (searchargs)->
      MainApp.Search.Controller.showSimpleSearchForm()

#    provideMap: ->
#      MainApp.Map.Controller.addMap()

#    showResultsPage: ->
#      MainApp.Results.Controller.showResultsView()


#    removeHomeRegion: =>
#      @RegionMan.reset()

  MainApp.vent.on "cleanHome", ->
    App.vent.trigger "cleanHomeRegion"
    API.showHomeRegion()

  MainApp.vent.on "cleanForGuid", ->
    App.vent.trigger "cleanHomeRegion"




    
#    showSearchModule: ->
#      MainApp.Search.Controller.showSearchModule()
#    provideMap: ->
#      MainApp.Map.Controller.provideMap()
  MainApp.on "initialize:before", ->
    fstations = App.request 'fstation:entities'
    searchargs = App.request 'searcharg:entity'
    
  MainApp.on "start", ->
#    API.showHomeRegion() 
    API.showCarousel()
#    API.showResultsPage()
#    API.provideMap()
    API.showSimpleSearchForm()  
