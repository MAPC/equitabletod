@Etod.module "MainApp.Show", (Show, App, Backbone, Marionette, $, _) ->

  class Show.Layout extends Marionette.ItemView
    template: "main/show/show_layout"
