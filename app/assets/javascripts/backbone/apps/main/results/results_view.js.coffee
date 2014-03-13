@Equitabletod.module "MainApp.Results", (Results, App, Backbone, Marionette, $, _) ->

  class Results.ResultItemView extends bbGrid.View
  	container: $('#bbGrid-container')
  	colModel: [
  		{ title: 'ID', name: 'id', sorttype: 'number' }
  		{ title: 'Full Name', name: 'name' }
  		{ title: 'Company', name: 'company' }
  		{ title: 'Email', name: 'email' }
  	]


###  class Results.ResultsCompositeView extends Marionette.CompositeView
    ItemView: "ResultItemView"###