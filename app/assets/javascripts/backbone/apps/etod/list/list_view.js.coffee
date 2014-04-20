@Equitabletod.module "EtodApp.List", (List, App, Backbone, Marionette, $, _) ->

	class List.Layout extends App.Views.Layout
		template: "etod/list/templates/_layout"
		regions: 
			etodRegion: "#etod-region"



