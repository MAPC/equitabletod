@Equitabletod.module "SearchApp", (SearchApp, App, Backbone, Marionette, $, _) ->
  @startWithParent = false
  
  class SearchApp.Router extends Marionette.AppRouter
    appRoutes:
      "search/": "showSimpleSearch"

  SearchApp.vent = new Backbone.Wreqr.EventAggregator()
  
  API =
    showSimpleSearch: (searchargs)->
      SearchApp.Search.Controller.showSimpleSearch()


  SearchApp.vent.on "searchFired", ->
    App.vent.trigger "searchFired"

  SearchApp.vent.on "searchrefineFired", ->
    App.vent.trigger "searchrefineFired"

  SearchApp.on "start", ->
    API.showSimpleSearch()  
