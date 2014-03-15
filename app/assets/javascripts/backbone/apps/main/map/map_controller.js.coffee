@Equitabletod.module "MainApp.Map", (Map, App, Backbone, Marionette, $, _) ->

  Map.Controller =

    addMap: ->
        fstations = App.request 'fstation:entities'
        map = @getMap fstations
        App.mapRegion.show map

    getMap: (fstations) ->
      new Map.MapView
          collection: fstations



