@Equitabletod.module "Entities", (Entities, App, Backbone, Marionette, $, _) ->
	
	class Entities.SimpleSearchArg extends Entities.Model

	class Entities.SimpleSearchArgs extends Entities.Collection
		model: Entities.SimpleSearchArg

	API =
		getSearchArgs: ->
			new Entities.SimpleSearchArgs [
				{ muni: ""}
				{ station_name: ""}
				{ service_type: ""}
				{ transit_line: ""}
				{ station_type: ""}
				{ etod_group: ""}
			]


	App.reqres.setHandler "searcharg:entities", ->
		API.getSearchArgs()





