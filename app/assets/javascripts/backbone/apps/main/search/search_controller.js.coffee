@Equitabletod.module "MainApp.Search", (Search, App, Backbone, Marionette, $, _) ->
	Search.Controller =
	  	showSimpleSearchForm: ->
	  		searchargs = App.request 'searcharg:entities'
	  		simpleSearchForm = @getSimpleSearchView searchargs
	  		App.mainRegion.show simpleSearchForm

	  	getSimpleSearchView: (searchargs) ->
	  		new Search.SimpleSearchFormLayout
	  			collection: searchargs

	  	

