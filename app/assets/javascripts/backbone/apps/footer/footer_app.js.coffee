@Equitabletod.module "FooterApp", (FooterApp, App, Backbone, Marionette, $, _) ->
	@startWithParent = false

	API =
		listFooter: ->
			FooterApp.List.Controller.listFooter()

	FooterApp.on "start", ->
		API.listFooter()