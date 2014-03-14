@Equitabletod.module "Entities", (Entities, App, Backbone, Marionette, $, _) ->

  class Entities.Fstation extends Entities.Model
    urlRoot: ->
      "/station_areas?id=" + @get('id')
  
  class Entities.FstationsCollection extends Entities.Collection
  	model: Entities.Fstation
  	url: "/station_areas.json"

  API =
  	getFstationsEntities: ->
  	    fstations = new Entities.FstationsCollection
  	    fstations.fetch()

  	getFstation: (stn_id) ->
  	    fstation = new Entities.Fstation({ id: stn_id });
  	    fstation.fetch()

  App.reqres.setHandler 'fstation:entities', ->
      API.getFstationsEntities()

  App.reqres.setHandler 'fstation:entity', (stn_id) ->
      API.getFstation(stn_id)