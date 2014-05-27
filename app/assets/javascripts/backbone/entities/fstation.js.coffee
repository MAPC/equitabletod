@Equitabletod.module "Entities", (Entities, App, Backbone, Marionette, $, _) ->

  class Entities.Fstation extends Backbone.Model

  class Entities.FstationsCollection extends Backbone.Collection
  	model: Entities.Fstation

  API = 

  	setFstation: (fstations) ->
  		new Entities.FstationsCollection fstations

  App.reqres.setHandler "set:fstation", (fstations) ->
  	API.setFstation fstations
