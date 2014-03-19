@Equitabletod.module "FstationsApp.List", (List, App, Backbone, Marionette, $, _) ->

	class List.Fstation extends App.Views.ItemView
		template: "header/list/templates/_header"
		tagName: "li"
	
	class List.FstationsCollection extends App.Views.CompositeView
		template: "header/list/templates/headers"
		itemView: List.Header
		itemViewContainer: "ul"

