@Equitabletod.module "GsaApp.List", (List, App, Backbone, Marionette, $, _) ->

	List.Controller =
		showGsaPage: ->
			@layout = @getLayoutView() 
			@layout.on 'show', ->
				@showGsa 
			App.mainRegion.show @layout

		showGsa: ->
			gsaLayout = @getGsaLayout
			@layout.gsaRegion.show gsaLayout
		
		getGsaLayout: ->
			new List.Layout

		getLayoutView: ->
			new List.Layout 


