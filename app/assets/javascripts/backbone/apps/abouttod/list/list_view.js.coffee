@Equitabletod.module "AbouttodApp.List", (List, App, Backbone, Marionette, $, _) ->

	class List.Layout extends App.Views.Layout
		template: "abouttod/list/templates/_layout"
		regions: 
			abouttodRegion: "#abouttod-region"


