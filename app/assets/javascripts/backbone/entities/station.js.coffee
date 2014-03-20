@Equitabletod.module "Entities", (Entities, App, Backbone, Marionette, $, _) ->

	class Entities.Station extends Entities.Model


	class Entities.StationsCollection extends Entities.Collection
		url: "search.json?by_name=ash"
		parse: (response) ->
			response.features
	

	API = 
		getStationEntities: (cb) ->
			stations = new Entities.StationsCollection
			stations.fetch
				success: ->
					cb stations

	App.reqres.setHandler 'station:entities', (cb) ->
		API.getStationEntities cb


