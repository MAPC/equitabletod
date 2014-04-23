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
				    #window.features = Backbone.Collection.extend(localStorage: new Backbone.LocalStorage("features"))
				    #window.features = features
				    gon.features = features
				    #gon.searchresults = features
				    fstationsCollection = new Backbone.Collection features
				    console.log features.length
				    if features.length == 1
				    	gon.feature = gon.features
				    	gon.features = gon.searchresults if gon.searchresults
		    			console.log "this is gon.features being re populated using the gon.searchresults"
		    			console.log gon.features
		    			@layout = @getLayoutView() 
		    			fstationCollection = new Backbone.Collection gon.feature
		    			@layout.on 'show', =>
		    				@showDetstations fstationCollection
		    				#@showFstationsTable gon.features
		    				@showDetailMap fstationCollection
		    				@showChart gon.feature
		    		else
		    			console.log "number of search results: "
		    			console.log features.length
		    			gon.searchresults = features
		    			gon.length = features.length
		    			@layout = @getLayoutView() 
		    			@layout.on 'show', =>
		    				@showFstations fstationsCollection
		    				@showMap fstationsCollection
		    				#@showChart gon.searchresults["0"]
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

		showDetailMap: (fstation) ->
			detailMapView = @getDetailMapView fstation
			@layout.mapRegion.show detailMapView

		showChart: (fstation) ->
			chartView = @getChartView fstation
			@layout.chartRegion.show chartView

		getChartView: (fstation) ->
			new List.Chart
				collection: fstation.toJSON

		getMapView: (fstations) ->
			new List.Map
				collection: fstations

		getDetailMapView: (fstation) ->
			new List.MapDetail
				collection: fstation

		getLayoutView: ->
			new List.Layout