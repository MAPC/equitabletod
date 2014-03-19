@Equitabletod.module "Entities", (Entities, App, Backbone, Marionette, $, _) ->

  class Entities.Fstation extends Entities.Model
    #since search may respond with a single model it should have a urlRoot which can be a function
    #urlRoot: -> somefuction

  class Entities.FstationsCollection extends Entities.Collection
    model: Entities.Fstation
    url: "search.json"

  API =
  	getFstationsEntities: ->
  	    fstations = new Entities.FstationsCollection
  	    fstations.fetch()


  App.reqres.setHandler 'fstation:entities', ->
      API.getFstationsEntities()

  App.reqres.setHandler 'set:selected:fstation', (selectedFstations) ->
      API.getFstation(selectedFstations)