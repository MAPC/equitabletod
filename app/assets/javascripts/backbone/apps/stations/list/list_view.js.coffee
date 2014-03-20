@Equitabletod.module "StationsApp.List", (List, App, Backbone, Marionette, $, _) ->

	class List.Layout extends App.Views.Layout
		template: "stations/list/templates/list_layout"
		
		regions: 
			#mapRegion: "#map-region"
			stationsRegion: "#stations-region"

	class List.Station extends App.Views.ItemView
		template: "stations/list/templates/_station"
		tagName: "tr"

	class List.Stations extends App.Views.CompositeView
		template: "stations/list/templates/_stations"
		itemView: List.Station
		itemViewContainer: "tbody"




