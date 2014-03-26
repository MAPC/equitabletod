@Equitabletod = do (Backbone, Marionette) ->

  App = new Marionette.Application 

  App.on "initialize:before", (options) ->
    @names = App.request "set:name", options.names
    @muni_names = App.request "set:muni_name", options.muni_names
    #@transit_lines = App.request "set:transit_line", options.

  RegionMan = new Marionette.RegionManager
  App.vent = new Backbone.Wreqr.EventAggregator()

  App.addRegions
    headerRegion: "#header-region"
    mainRegion:   "#main-region"

  RegionMan.on "region:add", (name, region) ->
  # add the region instance to an object
    App[name] = region
    return

  RegionMan.addRegions
    #carouselRegion: "#carousel-region"
    #homeRegion: "#home-region"
    #usrGuidRegion: "#usrguid-region"
    simpleSearchRegion: "#simple-search"
  
  App.vent.on "etodFired", ->
    RegionMan.removeRegion "homeRegion"
    RegionMan.addRegions
      etodRegion: "#etod-region"

  App.vent.on "searchFired", (query)->
    console.log "im inside the app itself"
    query = "fstations/" + query
    console.log query
    App.navigate query, trigger: true


  #App.vent.on "search:term", (query) -> 

  App.vent.on "homeFired", ->
    RegionMan.removeRegion "etodRegion"
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
    App.module("FstationsApp").start()
    App.module("MainApp").start()

  App.on "initialize:after", (options) ->
    if Backbone.history
      Backbone.history.start()
      @navigate(@rootRoute, trigger: true) if @getCurrentRoute() is ""

  App