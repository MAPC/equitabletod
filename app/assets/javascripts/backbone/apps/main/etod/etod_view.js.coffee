@Equitabletod.module "MainApp.Etod", (Etod, App, Backbone, Marionette, $, _) ->

  class Etod.Etodpage extends App.Views.Layout
    template: "main/etod/templates/etodpage_layout"
    tagName: "etod-region"