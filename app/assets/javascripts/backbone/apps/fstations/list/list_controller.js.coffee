@Equitabletod.module "FstationsApp.List", (List, App, Backbone, Marionette, $, _) ->

	List.Controller =

		getFstationById: (q) ->
			gon.page_qn = "#{q}".slice(0,3)
			if gon.page_qn == "pgr"
    			if gon.page_number > 1  
    				if "#{q}".slice(3, 4) > gon.num_pages
    					App.vent.trigger "searchFired", gon.query
    				else 
    					gon.features_sliced = gon.unsliced.slice((gon.page_number - 1 ) * 10, (gon.page_number) * 10)
    			fstationsCollection = new Backbone.Collection gon.features_sliced
    			@layout = @getLayoutView() 
    			@layout.on 'show', =>
    				@showFstations fstationsCollection
    				@showMap fstationsCollection
    				#@showChart gon.searchresults["0"]
	    		App.mainRegion.show @layout
			else
				urlstr = "/search.json?" + "#{q}"
				console.log urlstr
				responseFeature = $.ajax
			          	url: urlstr
			          	done: (result) =>
			              	return result
			    console.log "response to the ajax call"
			    console.log responseFeature
			    collection = responseFeature.complete()
			   	collection.done =>
					    fstations = collection.responseJSON
					    console.log fstations
					    features = _.values fstations.features
					    gon.features = features
					    gon.unsliced = features
					    #gon.searchresults = features
					    console.log features.length
					    if gon.features.length == 1
					    	gon.feature = gon.features
					    	gon.features = gon.searchresults if gon.searchresults
					    	gon.searchresults = []
			    			console.log "this is gon.features being re populated using the gon.searchresults"
			    			console.log gon.features
			    			@layout = @getLayoutView() 
			    			fstationCollection = new Backbone.Collection gon.feature
			    			@layout.on 'show', =>
			    				@showDetstations fstationCollection
			    				#@showFstationsTable gon.features
			    				@showDetailMap fstationCollection
			    				@showChart gon.feature
			    		else if features.length < 10
			    			gon.paginate == false
			    			fstationsCollection = new Backbone.Collection features
			    			gon.length = features.length
			    			gon.searchresults = features
			    			@layout = @getLayoutView() 
			    			@layout.on 'show', =>
			    				@showFstations fstationsCollection
			    				@showMap fstationsCollection
			    				#@showChart gon.searchresults["0"]
			    		else 
			    			console.log "gon.page_number: "
			    			console.log gon.page_number
			    			if _.isUndefined gon.page_number 
			    				gon.page_number = 1 
			    				gon.features_sliced = features.slice((gon.page_number - 1 ) * 10, (gon.page_number) * 10)
			    			else if gon.page_number > 1
			    				gon.features_sliced = features.slice((gon.page_number - 1 ) * 10, (gon.page_number) * 10)

			    			fstationsCollection = new Backbone.Collection gon.features_sliced
			    			gon.paginate = true
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
		showMap: (fstationsCollection) ->
			mapView = @getMapView fstationsCollection
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

		getMapView: (fstationsCollection) ->
			new List.Map
				collection: fstationsCollection

		getDetailMapView: (fstation) ->
			new List.MapDetail
				collection: fstation

		getLayoutView: ->
			new List.Layout