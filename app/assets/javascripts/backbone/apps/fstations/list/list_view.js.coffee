@Equitabletod.module "FstationsApp.List", (List, App, Backbone, Marionette, $, _) ->

	class List.Layout extends App.Views.Layout
		template: "fstations/list/templates/list_layout"
		
		regions: 
			mapRegion: "#map-region"
			fstationsRegion: "#fstations-region"

	class List.Map extends App.Views.MapView
		template: "fstations/list/templates/_map"
		collection: =>
			@collection.toJSON()

	class List.Fstation extends App.Views.ItemView
		template: "fstations/list/templates/_fstation"
		tagName: "tr"
		collection: =>
			@collection.toJSON()

	class List.Fstations extends App.Views.CompositeView
		template: "fstations/list/templates/_fstations"
		itemView: List.Fstation
		itemViewContainer: "tbody"