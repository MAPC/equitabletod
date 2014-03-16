@Equitabletod.module "HeaderApp.List", (List, App, Backbone, Marionette, $, _) ->
	
	class List.Header extends App.Views.ItemView
		template: "header/list/templates/_header"
		tagName: "li"
	
	class List.Headers extends App.Views.CompositeView
		template: "header/list/templates/headers"
		itemView: List.Header
		itemViewContainer: "ul"
		events:
			"click #homeClick": "cleanHome"
			"click #guidClick" : "fireGuid"

		cleanHome: (e) =>
			App.MainApp.vent.trigger "cleanHome"

		fireGuid: (e) =>
			App.UsrGuidApp.vent.trigger "fireGuid"