@Equitabletod.module "HomeApp.Main", (Home, App, Backbone, Marionette, $, _) ->

  Home.Controller =

    showHome: ->
    	homeView = @getLayoutView()
    	App.mainRegion.show homeView

    getLayoutView: ->
      new Home.Layout