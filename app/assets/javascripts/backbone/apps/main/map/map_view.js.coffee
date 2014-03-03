@Equitabletod.module "MainApp.Map", (Map, App, Backbone, Marionette, $, _) ->

  class Map.Layout extends App.Views.Layout
    template: "main/map/map_layout"

    regions:
      fooRegion: "#foo-region"