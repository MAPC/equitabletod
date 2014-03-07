@Equitabletod.module "SidebarApp.Show", (Show, App, Backbone, Marionette, $, _) ->

  class Show.Controller extends App.Controllers.Application

    initialize: ->
      @layout = @getLayoutView()

      @listenTo @layout, "show", =>

      @show @layout

    getLayoutView: ->
      new Show.Layout