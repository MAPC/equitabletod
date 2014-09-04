@Equitabletod.module "UsrguidApp.List", (List, App, Backbone, Marionette, $, _) ->

	class List.Layout extends App.Views.Layout
		template: "usr_guid/list/templates/_layout"
		tagName: "div"
		regions: 
			guidRegion: "#guid-region"

		onShow:->
			$(document).ready -> 
                $("html, body").animate
                  scrollTop: 0
                , 600
    
    class List.DictionriesItemView extends Backbone.Marionette.ItemView
		template: "usr_guid/list/templates/_dictionary"
		tagName: "tr"
		modelEvents:
		  "change" : "render"

	class List.DictionriesCollectionView extends Backbone.Marionette.CompositeView
		template: "usr_guid/list/templates/_dictionaries"
		itemView: List.DictionriesItemView 
		itemViewContainer: "tbody"
		modelEvents:
		  "add" : "render"
		CollectionEvents:
		  "change" : "render"

		# onShow: ->
		# 	$(document).ready ->
		# 		dictionaryResponse = $.ajax
	 #                            url: "/dictionary_entries.json?by_name="
	 #                            done: (result) =>
	 #                                return result
	            
	 #            dictionary = dictionaryResponse.complete()
	 #            dictionary.done =>
	 #                dictionaries = dictionary.responseJSON
	 #                @dictionaryentries = App.request "set:dictionaryentry", dictionaries
	 #                @collection = @dictionaryentries


