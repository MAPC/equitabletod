@Equitabletod.module "Entities", (Entities, App, Backbone, Marionette, $, _) ->
	
	class Entities.GeoFeature extends Entities.Model
		paramRoot: 'geofeature'

	API =
		getGeoCollection: ->
			@features = new Entities.GeoCollection([], {url: @url()});


	
	class Entities.GeoCollection extends Entities.Collection
		model: Entities.GeoFeature
		url: '/statiion_areas.json'

	App.reqres.setHandler "geofeature:entities", ->
		API.getGeoCollection()


