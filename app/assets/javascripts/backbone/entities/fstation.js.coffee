@Equitabletod.module "Entities", (Entities, App, Backbone, Marionette, $, _) ->

  class Entities.FstationsFeatures extends Backbone.Model
    urlRoot: "station_areas/"
    url: ->
      @urlRoot+@id+'.json' if @id
    parse: (response) ->
      response

  class Entities.FstationsFeaturesCollection extends Backbone.Leaflet.GeoCollection
    url: "search.json?by_name=ash"
    model: Entities.FstationsFeatures
    parse: (response) ->
      response.features

  API =
  	getFstationsEntities: (cb) ->
  	    fstations = new Entities.FstationsFeaturesCollection
  	    fstations.fetch
          success: ->
            cb fstations

    getFstationEntity: (id, cb) ->
      fstation = new Entities.FstationsFeatures({id: id})
      fstation.fetch
        success: ->
          cb fstation


  App.reqres.setHandler 'fstation:entities', (cb) ->
      API.getFstationsEntities cb

  App.reqres.setHandler 'fstation:entity', (id, cb) ->
      API.getFstationEntity(id, cb)