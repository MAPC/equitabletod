@Equitabletod = do (Backbone, Marionette) ->

  App = new Marionette.Application 

  App.on "initialize:before", (options) ->

  RegionMan = new Marionette.RegionManager
  App.vent = new Backbone.Wreqr.EventAggregator()

  App.addRegions
    headerRegion: "#header-region"
    mainRegion:   "#main-region"
    dictRegion:   "#dict-region"
    footerRegion: "#footer-region"

  RegionMan.on "region:add", (name, region) ->
    App[name] = region
    return

  App.vent.on "abouttodFired", ->
    App.navigate "abouttod/", trigger: true
  
  App.vent.on "etodFired", ->
    App.navigate "etod/", trigger: true

  App.vent.on "gsaFired", ->
    App.navigate "gsa/", trigger: true

  App.vent.on "guidFired", ->
    App.navigate "guide/", trigger: true

  App.vent.on "datadlFired", ->
    App.navigate "datadl/", trigger: true

  App.vent.on "searchrefineFired", ->
    App.navigate "advsearch/", trigger: true

  App.vent.on "printFired", ->
    App.navigate "print/q/", trigger: true

  App.vent.on "searchFired", (query)->
    query = "fss/q/" + query
    App.navigate query, trigger: true

  App.vent.on "mainFired", ->
    App.navigate "/", trigger: true

  App.vent.on "homeFired", ->
    App.module("SearchApp").stop()
    App.module("MainApp").stop()
    App.module("SearchApp").start()
    App.navigate "search/", trigger: true

  App.addInitializer ->
    App.module("HeaderApp").start()
    App.module("FooterApp").start()
    App.module("MainApp").start()
    App.module("FstationsApp").start()
    # App.module("PrintApp").start()

  App.on "initialize:after", (options) ->
    if Backbone.history
      Backbone.history.start()
      @navigate("/", trigger: true) if @getCurrentRoute() is ""

  App