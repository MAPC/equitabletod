@Equitabletod.module "FooterApp.List", (List, App, Backbone, Marionette, $, _) ->

	class List.Footer extends App.Views.ItemView
		template: "footer/list/templates/_footer"