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
    
    class List.DictionriesItemView extends App.Views.ItemView
		template: "usr_guid/list/templates/_dictionary"
		tagName: "tr"
		modelEvents:
		  "change" : "render"

	class List.DictionriesCollectionView extends App.Views.CollectionView
		template: "usr_guid/list/templates/_dictionaries"
		itemView: List.DictionriesItemView
		itemViewContainer: "tbody"
		tagName: "div"
		collectionEvents:
		  "change" : "render"


