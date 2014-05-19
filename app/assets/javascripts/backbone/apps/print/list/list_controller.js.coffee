@Equitabletod.module "PrintApp.List", (List, App, Backbone, Marionette, $, _) ->

	List.Controller =

		printFstation: ->
			console.log "inside Controller printFstation"
			console.log 
			#searchargs 
			#searchargs = App.request 'fstation:entities'
			@layout = @getLayoutView() 
			fstationCollection = new Backbone.Collection gon.feature
			@layout.on 'show', =>
				@showDetstations fstationCollection
				#@showFstationsTable gon.features
				@showDetailMap fstationCollection
				@showChart gon.feature
			App.mainRegion.show @layout


		showDetstations: (fstations) ->
			detstationsView = @getDetstationsView fstations
			@layout.fstationsRegion.show detstationsView

		getDetstationsView: (fstations) ->
			console.log "ikehuiuehrfueih"
			console.log gon.features
			console.log fstations
			new List.Detstations
				collection: fstations

		showDetailMap: (fstation) ->
			detailMapView = @getDetailMapView fstation
			@layout.mapRegion.show detailMapView

		showChart: (fstation) ->
			chartView = @getChartView fstation
			@layout.chartRegion.show chartView

		getChartView: (fstation) ->
			new List.Chart
				collection: fstation.toJSON

		getDetailMapView: (fstation) ->
			new List.MapDetail
				collection: fstation

		getLayoutView: ->
			new List.Layout