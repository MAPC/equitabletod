@Equitabletod.module "Entities", (Entities, App, Backbone, Marionette, $, _) ->

  class Entities.Fstation extends Backbone.Leaflet.GeoModel
    #since search may respond with a dingle model it should have a urlRoot which can be a function
    #urlRoot: -> somefuction

  class Entities.FstationsCollection extends Entities.Collection
  	url: "/search.json"

  API =
  	getFstationsEntities: ->
  	    geojsonFeatureCollection = new Entities.FstationsCollection
  	    geojsonFeatureCollection.fetch()

  	getFstation: (stn_id) ->
  	    fstation = new Entities.Fstation({ id: stn_id })
  	    fstation.fetch()

  App.reqres.setHandler 'fstation:entities', ->
      geojsonFeatureCollection = API.getFstationsEntities()
      fstations = new Backbone.Leaflet.GeoCollection(geojsonFeatureCollection)
      fstations

  App.reqres.setHandler 'fstation:entity', (stn_id) ->
      API.getFstation(stn_id)