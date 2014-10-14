@Equitabletod.module "AdvsearchApp.List", (List, App, Backbone, Marionette, $, _) ->

	List.Controller =
		showAdvsearchPage: ->
			sliders = App.request 'set:slider', "name", [23,33,32,33,33,222]
			@layout = @getLayoutView sliders 
			@layout.on 'show', ->
				@showAdvsearch
			App.mainRegion.show @layout

		showAdvsearch: ->
			AdvsearchLayout = @getAdvsearchLayout sliders
			@layout.advsearchRegion.show advsearchView
		
		getAdvsearchView: (sliders) ->
			new List.Layout
				collection: sliders

		getLayoutView: (sliders) ->
			new List.Layout 
				collection: sliders
