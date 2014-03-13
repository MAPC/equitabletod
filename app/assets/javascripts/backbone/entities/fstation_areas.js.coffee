@Equitabletod.module "Entities", (Entities, App, Backbone, Marionette, $, _) ->

  class Entities.Fstation extends Backbone.Leaflet.GeoModel
  
  class Entities.FstationsCollection extends Backbone.Leaflet.GeoCollection
  	model: Entities.Fstation
  	url: "/station_areas.json"

  API =
  	getFstationsEntities: ->
  	    fstations = new Entities.FstationsCollection
  	    fstations.fetch()

  	getFstation: (fstation) ->
  	    fstation = new Entities.Fstation({ id: fstation });
  	    fstation.fetch()

  App.reqres.setHandler 'fstation:entities', ->
      API.getFstationsEntities()

  App.reqres.setHandler 'fstation:entity', (fstation) ->
      API.getFstation(fstation)