###@Equitabletod.module "Entities", (Entities, App, Backbone, Marionette, $, _) ->

  class Entities.Fstation extends Backbone.Model
  	name: ->
    	@get("station_name")
  
  class Entities.FstationsCollection extends Backbone.Collection
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
      API.getFstation(fstation)###

###  	parse: (response)->
    	_.map(response, (fstationJson) ->
      	new FStation(fstationJson))###

###    initialize: (models, options) ->
        @url = options.url
        @

    comparator: (item) ->
        item.get('station_name')###







