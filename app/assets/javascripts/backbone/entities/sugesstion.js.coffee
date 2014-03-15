@Equitabletod.module "Entities", (Entities, App, Backbone, Marionette, $, _) ->
	
	class Entities.Sugestion extends Entities.Model

	class Entities.Sugestions extends Entities.Collection
		model: Entities.Sugestion
		url: "/suggest.json"

	API =
		getSugestions: ->
			sugestions = new Entities.SimpleSearchArgs [
				{station_names: ['', '']}
				{munis: ['', '']}
			]


	App.reqres.setHandler "sugestion:entities", ->
		API.getSugestions()