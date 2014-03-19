@Equitabletod.module "Entities", (Entities, App, Backbone, Marionette, $, _) ->

  class Entities.Muni extends Backbone.Model

  class Entities.MunisCollection extends Backbone.Collection
  	model: Entities.Muni

  API = 

  	setMuni: (munis) ->
  		new Entities.MunisCollection munis


  App.reqres.setHandler "set:muni", (munis) ->
  	API.setMuni munis
