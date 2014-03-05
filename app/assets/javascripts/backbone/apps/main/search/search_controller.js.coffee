@Equitabletod.module "MainApp.Search", (Search, App, Backbone, Marionette, $, _) ->

  Search.Controller =

  	showSimpleSearchForm: ->
  		simpleSearchForm = @getSimpleSearchView()
  		App.simpleSearchRegion.show simpleSearchForm
  	
  	getSimpleSearchView: ->
  		new Search.SimpleSearch