@Equitabletod.module "Entities", (Entities, App, Backbone, Marionette, $, _) ->

  class Entities.Fstation extends Entities.Model
    #since search may respond with a single model it should have a urlRoot which can be a function
    #urlRoot: -> somefuction

  class Entities.FstationsCollection extends Entities.Collection
    model: Entities.Fstation
    url: "search.json?by_name=ash"

  API =
  	getFstationsEntities: (cb) ->
  	    fstations = new Entities.FstationsCollection
  	    fstations.fetch
          success: ->
            cb fstations


  App.reqres.setHandler 'fstation:entities', (cb) ->
      API.getFstationsEntities cb

###  App.reqres.setHandler 'fstation:entity', (query, cb) ->
      API.getFstation(query, cb)###