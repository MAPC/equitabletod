@Equitabletod.module "SidebarApp.List", (List, App, Backbone, Marionette, $, _) ->

	class List.Sidebar extends App.Views.ItemView
		template: "sidebar/list/templates/_sidebar"
		tagName: "li"
	
	class List.Sidebars extends App.Views.CompositeView
		template: "sidebar/list/templates/sidebars"
		itemView: List.Sidebar
		itemViewContainer: "ul"