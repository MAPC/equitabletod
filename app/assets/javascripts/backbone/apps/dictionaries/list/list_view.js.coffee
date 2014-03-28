@Equitabletod.module "DictionariesApp.List", (List, App, Backbone, Marionette, $, _) ->

	class List.Layout extends App.Views.Layout
		template: "dictionaries/list/templates/list_layout"

		regions: 
			modals:
				selector: ".modals-contrainer"
				regionType: Backbone.Marionette.Modals

	class List.Modal1 extends App.Views.Layout
		template: "dictionaries/list/templates/_modal1"
		el: "#modal"
		submitEl: ".bbm-button"
		events:
		    "click .open-2": "openModal"

		  openModal: (e) ->
		    e.preventDefault()
		    myLayout.modals.show new Modal2()
		    return
		templateHelpers: ->
			$("body").on "click", ".open-1", ->
			  myLayout.modals.show new Modal1()
			  return

			$(".open-1").click()


	class List.Modal2 extends Backbone.Modal
		template: "dictionaries/list/templates/_modal2"
		submitEl: '.bbm-button'



	###class List.Station extends App.Views.ItemView
		template: "stations/list/templates/_station"
		tagName: "tr"

	class List.Stations extends App.Views.CompositeView
		template: "stations/list/templates/_stations"
		itemView: List.Station
		itemViewContainer: "tbody"###