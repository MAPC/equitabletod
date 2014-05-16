@Equitabletod.module "FooterApp.List", (List, App, Backbone, Marionette, $, _) ->
	
	List.Controller =
		
		listFooter: ->			
			footerView = @getFooterView()
			App.footerRegion.show footerView

		getFooterView: ->
			new List.Footer