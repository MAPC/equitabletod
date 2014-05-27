@Equitabletod.module "Entities", (Entities, App, Backbone, Marionette, $, _) ->

  class Entities.Dstation extends Backbone.Model

  class Entities.DstationsCollection extends Backbone.Collection
  	model: Entities.Dstation

  API = 

  	setDstation: (dstations) ->
  		new Entities.DstationsCollection dstations


  App.reqres.setHandler "set:dstation", (dstations) ->
  	API.setFstation dstations