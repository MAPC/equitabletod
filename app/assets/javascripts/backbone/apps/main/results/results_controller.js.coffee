@Equitabletod.module "MainApp.Results", (Results, App, Backbone, Marionette, $, _) ->
	Results.Controller =
	  	showResultsView: ->
	  		results = App.request "result:entities"
	  		ResultsView = @getResultsView results
	  		App.simpleSearchRegion.show ResultsView


	  	getResultsView: (results) ->
	  		new Results.ResultItemView
	  			collection: results