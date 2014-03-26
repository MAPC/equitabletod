@Equitabletod.module "Entities", (Entities, App, Backbone, Marionette, $, _) ->

  class Entities.Name extends Backbone.Model

  class Entities.NamesCollection extends Backbone.Collection
  	model: Entities.Name

  API = 

  	setName: (names) ->
  		new Entities.NamesCollection names


  App.reqres.setHandler "set:name", (names) ->
  	API.setName names
