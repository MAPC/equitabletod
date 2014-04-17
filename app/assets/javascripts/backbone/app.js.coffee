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
    App[name] = region
    return
  
  App.vent.on "etodFired", ->
    App.navigate "etod/", trigger: true

  App.vent.on "searchFired", (query)->
    console.log "im inside the app itself"
    query = "fss/q/" + query
    console.log query
    App.navigate query, trigger: true

  App.vent.on "homeFired", ->
    App.module("MainApp").stop()
    App.module("EtodApp").stop()
    App.module("MainApp").start()
    App.navigate "home/", trigger: true

  App.addInitializer ->
    App.module("HeaderApp").start()
    App.module("MainApp").start()
    App.module("FstationsApp").start()

  App.on "initialize:after", (options) ->
    if Backbone.history
      Backbone.history.start()
      @navigate("home/", trigger: true) if @getCurrentRoute() is ""

  App