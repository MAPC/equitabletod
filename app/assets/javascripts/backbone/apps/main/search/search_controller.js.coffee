@Equitabletod.module "MainApp.Search", (Search, App, Backbone, Marionette, $, _) ->
	Search.Controller =
	  	showSimpleSearchForm: ->
	  		searchargs = App.request 'fstation:entities'
	  		simpleSearchForm = @getSimpleSearchView searchargs
	  		App.simpleSearchRegion.show simpleSearchForm
	  		simpleSearchForm.on 'search:query', ->
	  			console.log('hwe')


	  	getSimpleSearchView: (searchargs) ->
	  		new Search.SimpleSearchFormLayout
	  			collection: searchargs
	  	

