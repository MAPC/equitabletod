@Equitabletod.module "MainApp", (MainApp, App, Backbone, Marionette, $, _) ->
  @startWithParent = false
      
  class MainApp.Router extends Marionette.AppRouter
    appRoutes:
      "home": "showHomeRegion"
      "usrguid": "showUsrGuid"
      "map": "provideMap"
      "search/simple": "showSimpleSearchForm"
#      "map/": "provideMap"


  API =
    showHomeRegion: ->
      MainApp.Show.Controller.showHomeRegion()

    showSimpleSearchForm: ->
      MainApp.Search.Controller.showSimpleSearchForm()

    provideMap: ->
      MainApp.Map.Controller.provideMap()

#    removeHomeRegion: =>
#      @RegionMan.reset()

    #showUsrGuid: ->
    #	MainApp.UsrGuid.Controller.showUsrGuid()

    
#    showSearchModule: ->
#      MainApp.Search.Controller.showSearchModule()
#    provideMap: ->
#      MainApp.Map.Controller.provideMap()
  MainApp.on "start", ->
#    API.showSearchModule()
    API.provideMap()
    API.showHomeRegion()
    API.showSimpleSearchForm()
