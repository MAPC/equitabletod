@Equitabletod.module "MainApp", (MainApp, App, Backbone, Marionette, $, _) ->
  @startWithParent = false



  class MainApp.Router extends Marionette.AppRouter
    appRoutes:
      "main/": "showMainRegion"
#      "search/": "showSearchModule"
#      "map/": "provideMap"
  

  API =
    showMainRegion: ->
      MainApp.Show.Controller.showMainRegion()

#    showSearchModule: ->
#      MainApp.Search.Controller.showSearchModule()

#    provideMap: ->
#      MainApp.Map.Controller.provideMap()

  
  MainApp.on "start", ->
    API.showMainRegion()
#    API.showSearchModule()
#    API.provideMap()