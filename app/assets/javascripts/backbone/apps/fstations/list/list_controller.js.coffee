@Equitabletod.module "FstationsApp.List", (List, App, Backbone, Marionette, $, _) ->

	List.Controller =


		getFstationById: (q) ->
			console.log "inside Controller getFstationById"
			console.log q
			#searchargs 
			#searchargs = App.request 'fstation:entities'
			urlstr = "/search.json?" + "#{q}"
			console.log urlstr
			responseFeature = $.ajax
		          	url: urlstr
		          	done: (result) =>
		              	return result
		    console.log responseFeature
		 

		    collection = responseFeature.complete()
		   	collection.done =>
				    fstations = collection.responseJSON
				    console.log fstations
				    features = _.values fstations.features
				    gon.features = features
				    fstationsCollection = new Backbone.Collection features
				    console.log features.length
				    if features.length == 1
				    	gon.feature = gon.features
		    			@layout = @getLayoutView() 
		    			@layout.on 'show', =>
		    				@showDetstations fstationsCollection
		    				#@showFstationsTable gon.features
		    				@showMap gon.features
		    				@showChart gon.feature
		    		else
		    			@layout = @getLayoutView() 
		    			@layout.on 'show', =>
		    				@showFstations fstationsCollection
		    				@showMap gon.features
		    		App.mainRegion.show @layout

		listFstations: (q) ->
			console.log "isnide listFstations"
			console.log q

			urlstr = "/search.json?" + "#{q}"
			console.log urlstr
			responseFeature = $.ajax
		          	url: urlstr
		          	done: (result) =>
		              	return result
		    console.log responseFeature
		 

		    collection = responseFeature.complete()
		   	collection.done =>
				    fstations = collection.responseJSON
				    console.log fstations
				    @layout = @getLayoutView()
				    @layout.on "show", =>
				    	@showFstations gon.features
				    	@showMap gon.features
				    	#@showChart gon.feature
				    App.mainRegion.show @layout

		showFstationsTable: (fstations) ->
			tableView = @getTableView fstations
			@layout.fstationsRegion.show tableView

		getTableView: (fstations) ->
			console.log fstations
			new List.Table
				collection: fstations.toJSON

		showDetstations: (fstations) ->
			detstationsView = @getDetstationsView fstations
			@layout.fstationsRegion.show detstationsView

		getDetstationsView: (fstations) ->
			console.log "ikehuiuehrfueih"
			console.log gon.features
			console.log fstations
			new List.Detstations
				collection: fstations


		showFstations: (fstations) ->
			fstationsView = @getFstationsView fstations
			@layout.fstationsRegion.show fstationsView

		getFstationsView: (fstations) ->
			console.log "ikehuiuehrfueih"
			console.log gon.features
			console.log fstations
			new List.Fstations
				collection: fstations

		showMap: (fstations) ->
			mapView = @getMapView fstations
			@layout.mapRegion.show mapView

		showChart: (fstation) ->
			chartView = @getChartView fstation
			@layout.chartRegion.show chartView

		getChartView: (fstation) ->
			new List.Chart
				collection: fstation.toJSON

		getMapView: (fstations) ->
			new List.Map
				collection: fstations.toJSON

		getLayoutView: ->
			new List.Layout