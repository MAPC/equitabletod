@Equitabletod.module "Entities", (Entities, App, Backbone, Marionette, $, _) ->
	
	class Entities.Sidebar extends Entities.Model
	
	class Entities.GeoCollection extends Entities.Collection
		model: Entities.GeoFeature
	
	API =
		getGeoCollection: ->
			new Entities.GeoCollection [
				{ id: "Home"}
				{ name: "User Guid"}
				{ score: "Learn About TOD"}
				{ vmt: "Download All Data"}
			]
	
	App.reqres.setHandler "geofeature:entities", ->
		API.getGeoCollection()