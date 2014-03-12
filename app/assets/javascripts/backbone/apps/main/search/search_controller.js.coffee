@Equitabletod.module "MainApp.Search", (Search, App, Backbone, Marionette, $, _) ->
	Search.Controller =
	  	showSimpleSearchForm: ->
	  		searchargs = App.request "searcharg:entities"
	  		simpleSearchForm = @getSimpleSearchView searchargs
	  		App.simpleSearchRegion.show simpleSearchForm

	  	getSimpleSearchView: (searchargs) ->
	  		new Search.SimpleSearchFormItemView
	  			collection: searchargs


