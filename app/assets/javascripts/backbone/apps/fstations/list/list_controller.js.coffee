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
		    		@layout = @getLayoutView() 
		    		@layout.on 'show', =>
		    			@showFstations gon.features
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
				    App.mainRegion.show @layout

		showFstations: (fstations) ->
			fstationsView = @getFstationsView fstations
			@layout.fstationsRegion.show fstationsView

		getFstationsView: (fstations) ->
			console.log fstations
			new List.Fstations
				collection: fstations.toJSON


		showMap: (fstations) ->
			mapView = @getMapView fstations
			@layout.mapRegion.show mapView



		getMapView: (fstations) ->
			new List.Map
				collection: fstations.toJSON

		getLayoutView: ->
			new List.Layout