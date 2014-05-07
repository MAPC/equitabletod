@Equitabletod.module "Entities", (Entities, App, Backbone, Marionette, $, _) ->

	class Entities.Station extends Entities.Model
		urlRoot: "search.json/"
		url: (query)->
			@urlRoot+query if query

		parse: (response) ->
			response.features

	class Entities.StationsCollection extends Entities.Collection
		model: Entities.Station
	

	API = 
		getStationEntities: (cb) ->
			stations = new Entities.StationsCollection
			stations.fetch
				success: ->
					cb stations

		getStationEntity: (query, cb) ->
			station = new Entities.Station(query: query)
			station.fetch
				success: ->
					cb station

	App.reqres.setHandler 'station:entities', (cb) ->
		API.getStationEntities cb

	App.reqres.setHandler 'station:entity', (query, cb) ->
		API.getStationEntity(query, cb)


