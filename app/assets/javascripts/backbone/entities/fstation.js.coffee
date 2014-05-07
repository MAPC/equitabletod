@Equitabletod.module "Entities", (Entities, App, Backbone, Marionette, $, _) ->

  class Entities.FstationsFeatures extends Backbone.Leaflet.GeoModel 
    initialize: ->
      id = @id
    url: (id) ->
      Routes.station_area_path(@id)

  class Entities.FstationsFeaturesCollection extends Backbone.Collection
    initialize: ->
      fetch: (options, q) =>
        @url = @url + '?' + $.param(q) if q
        @fetch(options)


    model: Entities.FstationsFeatures
    url: ->
      Routes.station_areas_path() + ".json"
    parse: (response) ->
      response.features

  API =
  	getFstationsEntities: (cb) ->
  	    fstations = new Entities.FstationsFeaturesCollection
  	    fstations.fetch
          success: ->
            cb fstations

    getFstationEntity: (q) =>
      fstations = new Entities.FstationsFeaturesCollection
      fstations.fetch q
          success: ->
            cb fstations

      ###fstation = new Entities.FstationsFeatures
               id: id
      fstation.fetch
        sucsess: ->
          cb fstation###

  App.reqres.setHandler 'fstation:entities', (cb) ->
      API.getFstationsEntities cb

  App.reqres.setHandler 'fstation:entity:q', (q, cb) ->
      console.log "im inside id-handler definition"
      console.log q
      API.getFstationEntity(q)
