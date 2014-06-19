@Equitabletod.module "GsaApp.List", (List, App, Backbone, Marionette, $, _) ->

	class List.Layout extends App.Views.Layout
		template: "gsa/list/templates/_layout"
		regions: 
			gsaRegion: "#gsa-region"

		onShow: ->
			$(document).ready -> 
                $("html, body").animate
                  scrollTop: 0
                , 600


