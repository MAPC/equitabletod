@Equitabletod.module "Entities", (Entities, App, Backbone, Marionette, $, _) ->
	
	class Entities.Sidebar extends Entities.Model
	
	class Entities.SidebarCollection extends Entities.Collection
		model: Entities.Sidebar
	
	API =
		getSidebars: ->
			new Entities.SidebarCollection [
				{ name: "Home"}
				{ name: "User Guid"}
				{ name: "Learn About TOD"}
				{ name: "Download All Data"}
			]
	
	App.reqres.setHandler "sidebar:entities", ->
		API.getSidebars()