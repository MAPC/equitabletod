@Equitabletod.module "MainApp.Search", (Search, App, Backbone, Marionette, $, _) ->

  class Search.SimpleSearch extends App.Views.Layout
    template: "main/search/simple_search_layout"