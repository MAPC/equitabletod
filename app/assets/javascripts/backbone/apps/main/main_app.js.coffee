@Equitabletod.module "MainApp", (MainApp, App, Backbone, Marionette, $, _) ->
  @startWithParent = false



  class MainApp.Router extends Marionette.AppRouter
    appRoutes:
      "home/": "showHomeRegion"
      "usrguid/": "showUsrGuid"
#      "search/": "showSearchModule"
#      "map/": "provideMap"

  

  API =
    showHomeRegion: ->
        MainApp.Show.Controller.showHomeRegion()

    showUsrGuid: ->
    	MainApp.UsrGuid.Controller.showUsrGuid()

    




#    showSearchModule: ->
#      MainApp.Search.Controller.showSearchModule()

#    provideMap: ->
#      MainApp.Map.Controller.provideMap()

  
  MainApp.on "start", ->
    API.showHomeRegion()
#    API.showSearchModule()
#    API.provideMap()

