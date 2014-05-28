@Equitabletod.module "SearchApp.Search", (Search, App, Backbone, Marionette, $, _) ->
	Search.Controller =

	  	showSimpleSearch: ->
	  		searchargs = App.request 'searcharg:entities'
	  		simpleSearchForm = @getSimpleSearchView searchargs
	  		App.mainRegion.show simpleSearchForm


	  	getSimpleSearchView: (searchargs) ->
	  		new Search.SimpleSearchFormLayout
	  			collection: searchargs
