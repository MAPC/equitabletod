@Equitabletod.module "MainApp.Search", (Search, App, Backbone, Marionette, $, _) ->

  class Search.Layout extends App.Views.Layout
    template: "main/search/search_layout"

    regions:
      fooRegion: "#foo-region"