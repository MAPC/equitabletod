@Equitabletod = do (Backbone, Marionette) ->

  App = new Marionette.Application 
  RegionMan = new Marionette.RegionManager

  App.addRegions
    headerRegion: "#header-region"
    mainRegion:   "#main-region"
      #  sidebarRegion: "#sidebar-region"

  RegionMan.on "region:add", (name, region) ->
  # add the region instance to an object
    App[name] = region
    return

  RegionMan.addRegions
    mapRegion: "#map"
    homeRegion: "#home"
    simpleSearchRegion: "#simple-search"


  App.addInitializer ->
    App.module("HeaderApp").start()
    App.module("MainApp").start()

  # App.addInitializer ->
  #   App.module("HeaderApp").start()
  #   App.module("FooterApp").start()

  App.on "initialize:after", (options) ->
    if Backbone.history
      Backbone.history.start()
      #@navigate(@rootRoute, trigger: true) if @getCurrentRoute() is ""

  App