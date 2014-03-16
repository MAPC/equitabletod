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
#    usrGuidRegion: "#usrguid-region"
    simpleSearchRegion: "#simple-search"
#    resultsTableGrid: "#results-table"

  App.vent.on "cleanHomeRegion", ->
    RegionMan.removeRegion "carouselRegion"
  

  App.vent.on "fireHomeRegion", ->
    RegionMan.addRegions 
      homeRegion: "#home-region"


  App.addInitializer ->
    App.module("HeaderApp").start()
    App.module("MainApp").start()
#    App.module("UsrGuid").start()

  App.on "initialize:after", (options) ->
    if Backbone.history
      Backbone.history.start()
      #@navigate(@rootRoute, trigger: true) if @getCurrentRoute() is ""


  App