@Equitabletod.module "Entities", (Entities, App, Backbone, Marionette, $, _) ->

  class Entities.Dictionary extends Entities.Model

  class Entities.DictionariesCollection extends Entities.Collection
    model: Entities.Dictionary
    url: "dictionary_entries.json"

  API =
  	getDictionariesEntities: (cb) ->
  	    dictionaries = new Entities.DictionariesCollection
  	    dictionaries.fetch
          success: ->
            cb dictionaries


  App.reqres.setHandler 'dictionary:entities', (cb) ->
      API.getictionariesEntities cb

  #App.reqres.setHandler 'dictionary:entity', (cb) ->
      #API.getictionariesEntity cb topic