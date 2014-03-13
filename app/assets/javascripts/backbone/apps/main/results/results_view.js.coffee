@Equitabletod.module "MainApp.Results", (Results, App, Backbone, Marionette, $, _) ->

  class Results.ResultItemView extends App.Views.Layout
    template: "main/results/results_layout"

