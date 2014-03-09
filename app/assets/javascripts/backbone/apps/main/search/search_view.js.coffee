@Equitabletod.module "MainApp.Search", (Search, App, Backbone, Marionette, $, _) ->

	class Search.SimpleSearchFormItemView extends App.Views.ItemView
        template: "main/search/templates/simple_search_layout" 
        tagName: "div"
        className: "col-sm-6 col-sm-offset-0 text-left"

        ui:
            muniField:           'option[muni=muni]'

        events:
            'keypress .btn btn-default': 'submit'
        
        modelEvents:
            'change:muni':        'render'

        API =
            submitSearch: (event) ->
                # Stop the form from actually submitting to the server.
                event.stopPropagation();
                event.preventDefault();
                @muni.set
                        'muni': @ui.muniField.val()