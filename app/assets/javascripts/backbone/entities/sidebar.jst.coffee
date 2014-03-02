@Equitabletod.module "Entities", (Entities, App, Backbone, Marionette, $, _) ->
	
	class Entities.Sidebar extends Entities.Model
	
	class Entities.SidebarCollection extends Entities.Collection
		model: Entities.Sidebar
	
	API =
		getSidebars: ->
			new Entities.SidebarCollection [
				{ name: "Home", url: "/"}
				{ name: "User Guid", url: "/"}
				{ name: "Learn About TOD", url: "/"}
				{ name: "Download All Data", url: "/"}
			]
	
	App.reqres.setHandler "sidebar:entities", ->
		API.getSidebars()