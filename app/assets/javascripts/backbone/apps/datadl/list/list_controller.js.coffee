@Equitabletod.module "DatadlApp.List", (List, App, Backbone, Marionette, $, _) ->

	List.Controller =
		showDatadlPage: ->
			@layout = @getLayoutView() 
			@layout.on 'show', ->
				@showDatadl
			App.mainRegion.show @layout

		showDatadl: ->
			DatadlLayout = @getDatadlLayout
			@layout.datadlRegion.show datadlView
		
		getDatadlView: ->
			new List.Layout

		getLayoutView: ->
			new List.Layout 
