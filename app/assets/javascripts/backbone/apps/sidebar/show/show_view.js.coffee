@Equitabletod.module "SidebarApp.Show", (Show, App, Backbone, Marionette, $, _) ->

  class Show.Layout extends App.Views.Layout
    template: "sidebar/show/show_layout"

    regions:
      fooRegion: "#foo-region"