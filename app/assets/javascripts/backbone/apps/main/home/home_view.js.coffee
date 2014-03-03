@Equitabletod.module "HomeApp.Main", (Home, App, Backbone, Marionette, $, _) ->

  class Home.Layout extends Marionette.ItemView
    template: "main/home/home_layout"