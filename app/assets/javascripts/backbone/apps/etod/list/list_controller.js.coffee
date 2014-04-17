@Equitabletod.module "EtodApp.List", (List, App, Backbone, Marionette, $, _) ->

	List.Controller =
		showEtodPage: ->
			@layout = @getLayoutView() 
			@layout.on 'show', =>
				@showEtod 
			App.mainRegion.show @layout

		showEtod: ->
			etodLayout = @getEtodLayout
			@layout.etodRegion.show etodLayout
		
		getEtodLayout: ->
			new List.Etod

		getLayoutView: ->
			new List.Layout 


