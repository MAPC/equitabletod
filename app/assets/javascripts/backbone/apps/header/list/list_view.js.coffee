@Equitabletod.module "HeaderApp.List", (List, App, Backbone, Marionette, $, _) ->
	
	class List.Header extends App.Views.ItemView
		template: "header/list/templates/_header"
		tagName: "li"
	
	class List.Headers extends App.Views.CompositeView
		template: "header/list/templates/headers"
		itemView: List.Header
		itemViewContainer: "ul"
		events:
			"click #homeClick": "homeFired"
			"click #guidClick" : "fireGuid"
			"click #etod" : "etodFired"

		homeFired: (e) =>
			App.MainApp.vent.trigger "homeFired"

		fireGuid: (e) =>
			App.UsrGuidApp.vent.trigger "fireGuid"

		etodFired: (e) =>
			App.MainApp.vent.trigger "etodFired"