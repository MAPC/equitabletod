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
			"click #guidClick": "guidFired"
			"click #abouttod" : "abouttodFired"
			"click #datadl" : "datadlFired"

		homeFired: (e) =>
			try
				$("html, body").animate
                	scrollTop: $("#search").offset().top
            	, "fast"
			catch error
				App.vent.trigger "homeFired"

		etodFired: (e) =>
			App.vent.trigger "etodFired"

		abouttodFired: (e) =>
			App.vent.trigger "abouttodFired"

		guidFired: (e) =>
			App.vent.trigger "guidFired"

		datadlFired: (e) =>
			App.vent.trigger "datadlFired"

		onShow: ->
			$("body").toggleClass "nav-expanded"
			$("#nav-expander").on "click", (e) ->
			  $("body").toggleClass "nav-expanded"
			  return

			$("#nav-close").on "click", (e) ->
			  e.preventDefault()
			  $("body").removeClass "nav-expanded"
			  return