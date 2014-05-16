@Equitabletod.module "AbouttodApp.List", (List, App, Backbone, Marionette, $, _) ->

	List.Controller =
		showAbouttodPage: ->
			@layout = @getLayoutView() 
			@layout.on 'show', ->
				@showAbouttod 
			App.mainRegion.show @layout

		showAbouttod: ->
			abouttodLayout = @getAbouttodLayout
			@layout.abouttodRegion.show abouttodView
		
		getAbouttodView: ->
			new List.Layout

		getLayoutView: ->
			new List.Layout 


