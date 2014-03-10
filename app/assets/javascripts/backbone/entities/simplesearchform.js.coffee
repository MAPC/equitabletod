@Equitabletod.module "Entities", (Entities, App, Backbone, Marionette, $, _) ->
	class Entities.SimpleSearchFormInputItem extends Entities.Model
		defaults: ->
			muni: 'all munis'
		label: ->
			@get("lable")
			@
	class Entities.SimpleSearchFormInputCollection extends Entities.Collection
		model: Entities.SimpleSearchFormInputItem
	
###	API =
		getSimpleSearchParams: (collection: data.thingsCollection) ->
			new Entities.SimpleSearchInputCollection [
				{ station_name: "searchinput1"}
				{ muni: "searchinput2"}
				{ service_type: "selectbasic2"}
				{ selectbasic1: "Download All Data"}
				{ selectbasic1: "Download All Data"}
			]
	
	App.reqres.setHandler "searchparams:entities", ->
		API.getSimpleSearchParams()######





