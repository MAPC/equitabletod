@Equitabletod.module "Entities", (Entities, App, Backbone, Marionette, $, _) ->
	
	class Entities.SimpleSearchArg extends Entities.Model

	class Entities.SimpleSearchArgs extends Entities.Collection
		model: Entities.SimpleSearchArg
		sync: ->
			return null

		fetch: ->
			return null


	API =
		getSearchArgs: ->
			searchargs = new Entities.SimpleSearchArgs [
				{qury: ""}
				{muni_name: ""}
				{station: ""}
				{service_type: ""}
				{station_type: ""}
				{etod_group: ""}
				]

		getSearchArg: (query) ->
			searcharg = new Entities.SimpleSearchArg(query: query)


	App.reqres.setHandler "searcharg:entities", ->
		API.getSearchArgs()

	App.reqres.setHandler "searcharg:entity", (query)->
		API.getSearchArgs(query)





