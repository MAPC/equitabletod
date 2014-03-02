@Equitabletod.module "Entities", (Entities, App, Backbone, Marionette, $, _) ->
	
	class Entities.Header extends Entities.Model
	
	class Entities.HeaderCollection extends Entities.Collection
		model: Entities.Header
	
	API =
		getHeaders: ->
			new Entities.HeaderCollection [
				{ name: "Home"}
				{ name: "User Guid"}
				{ name: "Learn About TOD"}
				{ name: "Download All Data"}
			]
	
	App.reqres.setHandler "header:entities", ->
		API.getHeaders()