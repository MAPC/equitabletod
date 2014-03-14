@Equitabletod.module "Entities", (Entities, App, Backbone, Marionette, $, _) ->
	
	class Entities.Sugestion extends Entities.Model

	class Entities.Sugestions extends Entities.Collection
		model: Entities.Sugestion

	API =
		getSugestions: ->
			new Entities.SimpleSearchArgs [
				{ munis: ""}
				{ station_names: ""}
				{ service_types: ""}
				{ transit_lines: ""}
				{ station_types: ""}
				{ etod_groups: ""}
			]


	App.reqres.setHandler "sugestion:entities", ->
		API.getSugestions()