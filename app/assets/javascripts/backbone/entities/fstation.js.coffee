@Equitabletod.module "Entities", (Entities, App, Backbone, Marionette, $, _) ->


  class Entities.FstationsFeaturesCollection extends Backbone.Leaflet.GeoModel
    url: "search.json?by_name=ash"
    parse: (response) ->
      response.features


  API =
  	getFstationsEntities: (cb) ->
  	    fstations = new Entities.FstationsFeaturesCollection
  	    fstations.fetch
          success: ->
            cb fstations


  App.reqres.setHandler 'fstation:entities', (cb) ->
      API.getFstationsEntities cb

###  App.reqres.setHandler 'fstation:entity', (query, cb) ->
      API.getFstation(query, cb)###