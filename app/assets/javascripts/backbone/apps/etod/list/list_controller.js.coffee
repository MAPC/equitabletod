@Equitabletod.module "EtodApp.List", (List, App, Backbone, Marionette, $, _) ->

	List.Controller =
		showEtodPage: ->
			@layout = @getLayoutView() 
			@layout.on 'show', ->
				@showEtod 
			App.mainRegion.show @layout

		showEtod: ->
			etodLayout = @getEtodLayout
			@layout.etodRegion.show etodView
		
		getEtodView: ->
			new List.Layout

		getLayoutView: ->
			new List.Layout 


