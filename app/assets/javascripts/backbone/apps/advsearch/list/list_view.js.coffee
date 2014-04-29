@Equitabletod.module "AdvsearchApp.List", (List, App, Backbone, Marionette, $, _) ->

	class List.Layout extends App.Views.Layout
		template: "advsearch/list/templates/_layout"
		regions: 
			advsearchRegion: "#advsearch-region"


		onShow: ->
            $(document).ready ->
                $("#fpaccordion").accordion 
                    header: "hm2" 
                    active: "false"
                    heightStyle: "content"
                    collapsible: true
                    icons:
                        header: "ui-icon-plus"
                        activeHeader: "ui-icon-minus"
            $(document).ready ->
              $("[rel=tooltip]").tooltip placement: "top"
              $("#dialog-modal").dialog 
                    position:
                        my: "center"
                        at: "center"
                        of: "#main-region"
                    autoOpen: false
                    closeOnEscape: true
   
                    show:
                        effect: "blind"
                        duration: 100  
                    hide:
                        effect: "blind"
                        duration: 100
                    title: 
                        $("[rel=tooltipd]").title

               
                $("#dialog-modal").dialog beforeClose: (event, ui) ->
                    $("#accordion").accordion "enable"

                $("[rel=tooltipd]").click (event, ui) ->
                    console.log @
                    console.log @.title
                    $("#dialog-modal").dialog 
                    dictionaryResponse = $.ajax
                            url: "/dictionary_entries.json?by_name=#{@.title}"
                            done: (result) =>
                                return result
                    dictionary = dictionaryResponse.complete()
                    dictionary.done =>
                        dictionaries = dictionary.responseJSON
                        console.log dictionaries["0"].description if dictionaries["0"]
                        $("#dialog-modal").dialog "open"
                        $("#dialog-modal").dialog title: "Data Dictionary"
                        $("#dialog-modal").html("")
                        $("#dialog-modal").html("#{dictionaries["0"].description}")
              $(".selectpicker").selectpicker()
              $("#searchinput5").autocomplete
                source: ["<", ">", "="]
                minLength: 0
              
            $(document).ready ->
              $("#searchinput2").autocomplete
                source: gon.muni_names.muni_names
                minLength: 3
                select: (event, ui) ->
                    console.log event.view.gon
                    console.log ui.item.value.toLowerCase()      
              return