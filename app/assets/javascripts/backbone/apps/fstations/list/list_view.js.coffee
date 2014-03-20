@Equitabletod.module "FstationsApp.List", (List, App, Backbone, Marionette, $, _) ->

	class List.Layout extends App.Views.Layout
		template: "fstations/list/templates/list_layout"
		
		regions: 
			mapRegion: "#map-region"
			#fstationsRegion: "#fstations-region"

	class List.Map extends App.Views.MapView
		template: "fstations/list/templates/_map"
		collection: @collection