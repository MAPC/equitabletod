@Equitabletod.module "UsrguidApp.List", (List, App, Backbone, Marionette, $, _) ->

	class List.Layout extends App.Views.Layout
		template: "usr_guid/list/templates/_layout"
		regions: 
			guidRegion: "#guid-region"



