@Equitabletod.module "UsrguidApp.List", (List, App, Backbone, Marionette, $, _) ->

	List.Controller =
		showUsrguidPage: ->
			@layout = @getLayoutView() 
			@layout.on 'show', ->
				@showUsrguid
			App.mainRegion.show @layout

		showUsrguid: =>
			usrguidLayout = @getUsrguidLayout
			@layout.guidRegion.show usrguidLayout
		
		getUsrguidLayout: ->
			new List.Layout

		getLayoutView: ->
			new List.Layout 

