@Equitabletod.module "DatadlApp.List", (List, App, Backbone, Marionette, $, _) ->

	class List.Layout extends App.Views.Layout
		template: "datadl/list/templates/_layout"
		regions: 
			datadlRegion: "#datadl-region"


