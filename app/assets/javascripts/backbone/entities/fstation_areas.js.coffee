@Equitabletod.module "Entities", (Entities, App, Backbone, Marionette, $, _) ->

  class Entities.Fstation extends Backbone.Leaflet.GeoModel
    
  class Entities.FstationsCollection extends Backbone.Leaflet.GeoCollection
    url: "/station_areas.json"

  API =
  	getFstationsEntities: ->
        fstations = new Entities.FstationsCollection
        fstations.fetch()

  	getFstation: (stn_id) ->
  	    fstation = new Entities.Fstation({ id: stn_id })
  	    fstation.fetch()

  App.reqres.setHandler 'fstation:entities', ->
      API.getFstationsEntities()
      

  App.reqres.setHandler 'fstation:entity', (stn_id) ->
      API.getFstation(stn_id)