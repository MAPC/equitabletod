@Equitabletod.module "AdvsearchApp.List", (List, App, Backbone, Marionette, $, _) ->

	class List.Layout extends App.Views.Layout
		template: "advsearch/list/templates/_layout"
		regions: 
			advsearchRegion: "#advsearch-region"


		onShow: ->
            $("html, body").animate
                  scrollTop: 0
                , "600
            $(document).ready ->
                $("#titles").html "<p class='h2'></p>"
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

                $("#searchbuttom").click (event, ui) ->
                    console.log "advanced search clicked"


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


        events: 
            'click #searchbuttom': 'inputChange'
            'click #etod': 'etodFired'
            'click #gsa': 'gsaFired'
            'click #resetbuttom':  'resetFormArgs' 
            'click #mapClick': 'fireMap'   
            'select #searchinput1': 'inputChange'
            'click #ui-accordion-fpaccordion-header-0': 'moreText'
            'click #ui-accordion-header-icon ui-icon ui-icon-minus': 'lessText'

        inputChange: (e)=>
            urlq = "?"
            muni_name = $('input#searchinput2').val().replace(" ", "%20").toLowerCase() if $('input#searchinput2').val()
            if muni_name is undefined
                qury = ""
            else
                #name = $('input#searchinput1').val().replace(" ", "%20").toLowerCase() if $('input#searchinput1').val()
                qury = "by_muni_name=#{muni_name}".replace(/\s*\(.*?\)\s*/g, "")
            name = $('input#searchinput1').val().replace(" ", "%20").toLowerCase() if $('input#searchinput1').val()
            if name is undefined
                qury = qury + ""
            else
                qury = qury + "&by_name=#{name}".replace(/\s*\(.*?\)\s*/g, "")
            service_type = $('#selectbasic2 option:selected').val().replace(" ", "%20").toLowerCase() if $('#selectbasic2 option:selected').val()
            if service_type is undefined
                qury = qury + ""
            else    
                qury = qury + "&by_line=#{service_type}".replace(/\s*\(.*?\)\s*/g, "")
            station_type = $('#selectbasic3 option:selected').val().replace(" ", "%20").toLowerCase() if $('#selectbasic3 option:selected').val()
            if station_type is undefined
                qury = qury + ""
            else
                qury = qury + "&by_station_class=#{station_type}".replace(/\s*\(.*?\)\s*/g, "")
            etod_group = $('#selectbasic4 option:selected').val().replace(" ", "%20").toLowerCase() if $('#selectbasic4 option:selected').val()
            if etod_group is undefined
                qury = qury + ""
            else
                qury = qury + "&by_etod_category=#{etod_group}".replace(/\s*\(.*?\)\s*/g, "")
            #gon.etod_group = "#{etod_group}"
            query = "#{qury}"
            console.log gon,
            # here would are the basic validation and if passed the vent will trigger
            urlstr = "/search.json?" + "#{gon.query}" + "#{query}".replace(/\s*\(.*?\)\s*/g, "")
            #console.log urlstr
            responseFeature = $.ajax
                    url: urlstr
                    done: (result) =>
                        return result
            console.log "response to the ajax call"
            #console.log responseFeature
            collection = responseFeature.complete()
            collection.done =>
                    fstations = collection.responseJSON
                    console.log fstations
                    features = _.values fstations.features
                    #window.features = Backbone.Collection.extend(localStorage: new Backbone.LocalStorage("features"))
                    #window.features = features
                    if features.length > 0
                        gon.features = features
                        num_pages = features.length / 10
                        num = num_pages.toString()
                        num = num.slice(0, (num.indexOf(".")) + 0)  if num.indexOf(".") > 0
                        num = Number(num) + 1 if num_pages > num
                        gon.num_pages = num
                        gon.query = "#{gon.query}" + "#{query}".replace(/\s*\(.*?\)\s*/g, "")
                        App.vent.trigger "searchFired", gon.query
                    else
                        console.log "error"
                        gon.query = ""
                        gon.muni_name = ""
                        gon.name = ""
                        $("#searchinput2").attr "placeholder", ""
                        $("#selectbasic3").val ""
                        $("#dialog-modal").dialog "open"
                        $("#dialog-modal").dialog title: "Error"
                        $("#dialog-modal").html("")
                        $("#dialog-modal").html("Search has no results, Please try again with different parameteres")
