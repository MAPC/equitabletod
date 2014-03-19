@Equitabletod.module "FstationsApp.List", (List, App, Backbone, Marionette, $, _) ->

	List.Controller =

		listFstations: ->
			fstations = App.request "fstation:entities"

			@layout = @getLayoutView()

			@layout.on "show", =>
				@showPanel fstations
				@showFstations fstations

			App.mainRegion.show @layout

		showPanel: (fstations) ->
			PanelView = @getPanelView fstations
			@layout.panelRegion.show PanelView

		showFstations: (fstations) ->
			fstationsView = @getFstationsView fstations
			@layout.fstationsRegion.show fstationsView

		getFstationsView: (fstations) ->
			new List.Fstations
				collection: fstations

		getPanelView: (fstations) ->
			new List.Panel
				collection: fstations

		getLayoutView: ->
			new List.Layout