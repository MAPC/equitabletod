@Equitabletod.module "Entities", (Entities, App, Backbone, Marionette, $, _) ->
	
	class Entities.CollapseTerm extends Entities.Model
	
	class Entities.CollapseTerms extends Entities.Collection
		model: Entities.CollapseTerm
	
	API =
		getTerms: ->
			new Entities.CollapseTerms [
				{more: "More", less: "Less"}
			]
	
	App.reqres.setHandler "collapsterm:entities", ->
		API.getTerms()