@Equitabletod.module "AbouttodApp.List", (List, App, Backbone, Marionette, $, _) ->

	class List.Layout extends App.Views.Layout
		template: "abouttod/list/templates/_layout"
		regions: 
			abouttodRegion: "#abouttod-region"
		onShow: ->
			$(document).ready ->
				$("#titles").html "<p class='h2'></p>"


