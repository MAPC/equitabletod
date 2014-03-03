@Equitabletod.module "MainApp.Map", (Map, App, Backbone, Marionette, $, _) ->

  class Map.Controller extends App.Controllers.Application

    initialize: ->
      @layout = @getLayoutView()

      @listenTo @layout, "show", =>

      @show @layout

    getLayoutView: ->
      new Map.Layout