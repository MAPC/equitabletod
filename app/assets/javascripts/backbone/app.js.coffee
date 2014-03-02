@Equitabletod = do (Backbone, Marionette) ->

  App = new Marionette.Application
  
  App.addRegions
    headerRegion: "#header-region"
    mainRegion:   "#main-region"
    sidebarRegion: "#sidebar-region"

  App.reqres.setHandler "default:region", ->
    App.sidebarRegion

  App.addInitializer ->
    App.module("HeaderApp").start()
    App.module("SidebarApp").start()

  # App.addInitializer ->
  #   App.module("HeaderApp").start()
  #   App.module("FooterApp").start()

  App.on "initialize:after", (options) ->
    if Backbone.history
      Backbone.history.start()
      # @navigate(@rootRoute, trigger: true) if @getCurrentRoute() is ""

  App