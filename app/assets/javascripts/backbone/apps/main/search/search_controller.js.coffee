@Equitabletod.module "MainApp.Search", (Search, App, Backbone, Marionette, $, _) ->

  class Search.Controller extends App.Controllers.Application

    initialize: ->
      @layout = @getLayoutView()

      @listenTo @layout, "show", =>

      @show @layout

    getLayoutView: ->
      new Search.Layout