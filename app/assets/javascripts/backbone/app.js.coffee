@Equitabletod = do (Backbone, Marionette) ->

  App = new Marionette.Application 
  RegionMan = new Marionette.RegionManager
  App.vent = new Backbone.Wreqr.EventAggregator()

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
    carouselRegion: "#carousel-region"
    homeRegion: "#home"
    simpleSearchRegion: "#simple-search"
    resultsTableGrid: "#results-table"

  App.vent.on "cleanHomeRegion", ->
    RegionMan.removeRegion "carouselRegion"


  App.addInitializer ->
    App.module("HeaderApp").start()
    App.module("MainApp").start()

  App.on "initialize:after", (options) ->
    if Backbone.history
      Backbone.history.start()
      #@navigate(@rootRoute, trigger: true) if @getCurrentRoute() is ""


  App