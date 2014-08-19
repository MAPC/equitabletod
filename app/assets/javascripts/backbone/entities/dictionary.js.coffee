@Equitabletod.module "Entities", (Entities, App, Backbone, Marionette, $, _) ->

  class Entities.Dictionaryentry extends Backbone.Model

  class Entities.DictionaryentriesCollection extends Backbone.Collection
    model: Entities.Dictionaryentry
    url: "/dictionary_entries.json?by_name="

  API = 

    setDictionaryentry: (dictionaryentries) ->
      new Entities.DictionaryentriesCollection dictionaryentries


  App.reqres.setHandler "set:dictionaryentry", (dictionaryentries) ->
    API.setDictionaryentry dictionaryentries