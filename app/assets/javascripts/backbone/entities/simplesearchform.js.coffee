@Equitabletod.module "Entities", (Entities, App, Backbone, Marionette, $, _) ->
	
	class Entities.SimpleSearchArg extends Entities.Model


	class Entities.SimpleSearchArgs extends Entities.Collection
		model: Entities.SimpleSearchArg
		url: "/suggest.json"

	API =
		getSearchArgs: ->
			#sugestions = new Entities.SimpleSearchArgs
			#sugestions.festch()
			sugestions = new Entities.SimpleSearchArgs [
				{station_names: ['', '']}
				{munis: ['', '']}
			]

		getSearchArg: ->
			sugestion = new Entities.SimpleSearchArg(field: muni)


	App.reqres.setHandler "searcharg:entities", ->
		API.getSearchArgs()

	App.reqres.setHandler "searcharg:entity", (muni)->
		API.getSearchArgs(muni)





