@Equitabletod.module "EtodApp.List", (List, App, Backbone, Marionette, $, _) ->

	class List.Layout extends App.Views.Layout
		template: "etod/list/templates/_layout"
		regions: 
			etodRegion: "#etod-region"
			learnabouttodRegion: "#learnabouttod-region"

	class List.Etod extends App.Views.Layout
		template: "etod/list/templates/etod_layout"

	class List.Learnabouttod extends App.Views.Layout
		template: "etod/list/templates/learnabouttod_layout"
