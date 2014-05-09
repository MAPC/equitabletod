@Equitabletod.module "Entities", (Entities, App, Backbone, Marionette, $, _) ->
	
	class Entities.Sugestion extends Entities.Model
		defaults: ->
			station_names: []
			munis: []
		initialize: ->
			@get('station_names')
			@get('munis')
		localStorage: -> 
			new Backbone.LocalStorage("SugestionsLocal")

	class Entities.Sugestions extends Entities.Collection
		model: Entities.Sugestion
		url: "/suggest.json"

	API =
		getSugestions: ->
			sugestions = new Entities.SimpleSearchArgs
			sugestions.fetch()

		getSugestion: ->
			sugestion = new Entities.Sugestions(field: muni)


	App.reqres.setHandler "sugestion:entities", ->
		API.getSugestions()
	
	App.reqres.setHandler "sugestion:entity", (muni)->
		API.getSugestions(muni)