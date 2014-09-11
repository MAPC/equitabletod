@Equitabletod.module "UsrguidApp.List", (List, App, Backbone, Marionette, $, _) ->

	List.Controller =
		showUsrguidPage: ->
			dictionaryResponse = $.ajax
                    url: "/dictionary_entries.json?by_name="
                    done: (result) =>
                        return result
            dictionary = dictionaryResponse.complete()
            dictionary.done =>
                # dictionaries = dictionary.responseJSON
                # features = _.values dictionaries.features
                # dictionaryentries = App.request "set:dictionaryentry", dictionaries
                @dictionaryentries = new Backbone.Collection dictionary.responseJSON 
				@layout = @getLayoutView() 
				@layout.on 'show', (@dictionaryentries) =>
					@showUsrguid @dictionaryentries
					App.mainRegion.show @layout

		showUsrguid: (dictionaryentries) ->
			usrGuidView = @getDictionriesCollectionView(dictionaryentries)
			@layout.guidRegion.show usrGuidView
		
		getDictionriesCollectionView: (dictionaryentries) ->
			new List.DictionriesCollectionView collection: dictionaryentries

		getLayoutView: ->
			new List.Layout 
				

