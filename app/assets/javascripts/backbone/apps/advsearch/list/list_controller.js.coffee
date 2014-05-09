@Equitabletod.module "AdvsearchApp.List", (List, App, Backbone, Marionette, $, _) ->

	List.Controller =
		showAdvsearchPage: ->
			@layout = @getLayoutView() 
			@layout.on 'show', ->
				@showAdvsearch
			App.mainRegion.show @layout

		showAdvsearch: ->
			AdvsearchLayout = @getAdvsearchLayout
			@layout.advsearchRegion.show advsearchView
		
		getAdvsearchView: ->
			new List.Layout

		getLayoutView: ->
			new List.Layout 
