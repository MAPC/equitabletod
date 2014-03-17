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
    carouselRegion: "#carousel-region"
    homeRegion: "#home-region"
    usrGuidRegion: "#usrguid-region"
    simpleSearchRegion: "#simple-search"
    usrGuidRegion: "#usrguid-region"
#    resultsTableGrid: "#results-table"
  
  App.vent.on "etodFired", ->
    RegionMan.removeRegion "homeRegion"


  App.vent.on "homeFired", ->
    RegionMan.addRegions 
      homeRegion: "#home-region"
  
  App.vent.on "cleanForGuid", ->
    App.module("UsrGuid").start()
    RegionMan.removeRegion "homeRegion"
    RegionMan.removeRegion "simpleSearchRegion"

  App.vent.on "fireHomeRegion", ->
    RegionMan.addRegions 
      homeRegion: "#home-region"

    App.vent.on "fireGuid", ->
    App.addRegions 
      usrGuidRegion: "#usrguid-region"
    App.module("MainApp").stop()


  App.addInitializer ->
    App.module("HeaderApp").start()
    App.module("MainApp").start()
#    App.module("UsrGuid").start()

  App.on "initialize:after", (options) ->
    if Backbone.history
      Backbone.history.start()
      #@navigate(@rootRoute, trigger: true) if @getCurrentRoute() is ""


  App