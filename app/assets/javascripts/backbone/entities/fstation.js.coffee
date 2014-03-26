@Equitabletod.module "Entities", (Entities, App, Backbone, Marionette, $, _) ->

  class Entities.FstationsFeatures extends Backbone.Leaflet.GeoModel
    urlRoot: "search.json"
    query: @query
    url: ->
      @urlRoot+@query if @query


  class Entities.FstationsFeaturesCollection extends Backbone.Collection
    url: "search.json"
    model: Entities.FstationsFeatures
    parse: (response) ->
      response.features

  API =
  	getFstationsEntities: (cb) ->
  	    fstations = new Entities.FstationsFeaturesCollection
  	    fstations.fetch
          success: ->
            cb fstations

    getFstationEntity: (cb, query) ->
      fstation = new Entities.FstationsFeaturesCollection({query: query})
      fstation.fetch
        success: ->
          cb fstations


  App.reqres.setHandler 'fstation:entities', (cb) ->
      API.getFstationsEntities cb

  App.reqres.setHandler 'fstation:entity', (cb, query) ->
      console.log "im inside handler definition"
      console.log query
      API.getFstationEntity(cb, query)