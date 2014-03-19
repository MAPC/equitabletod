@Equitabletod.module "FstationsApp.List", (List, App, Backbone, Marionette, $, _) ->

	class List.Layout extends App.Views.Layout
		template: "fstations/list/templates/list_layout"
		
		regions: 
			panelRegion: "#panel-region"
			fstationsRegion: "#fstations-region"

	class List.Panel extends App.Views.ItemView
		template: "fstations/list/templates/_panel"

	class List.Fstations extends App.Views.ItemView
		template: "fstations/list/templates/_fstations"