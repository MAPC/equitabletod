@Equitabletod.module "AdvsearchApp.List", (List, App, Backbone, Marionette, $, _) ->

	class List.Layout extends App.Views.Layout
		template: "advsearch/list/templates/_layout"
		regions: 
			advsearchRegion: "#advsearch-region"


		onShow: ->
            allfeaturesResponse = $.ajax
                    url: "/search.json?by_name="
                    done: (result) =>
                        return result
            allfeature = allfeaturesResponse.complete()
            allfeature.done =>
                allfeatures = allfeature.responseJSON
                features = _.values allfeatures.features # this returns an array of each features obkect
                hhincs = _.map features, (key, value) -> key.properties.ov_hhinc
                vmts = _.map features, (key, value) -> key.properties.ov_vmthday
                maxhhinc = hhincs.reduce (a,b) -> Math.max a, b
                minhhinc = hhincs.reduce (a,b) -> Math.min a, b
                maxvmt = vmts.reduce (a,b) -> Math.max a, b
                minvmt = vmts.reduce (a,b) -> Math.min a, b
                gon.minhhinc = minhhinc
                gon.maxhhinc = maxhhinc
                gon.minvmt = minvmt
                gon.maxvmt = maxvmt
                $("#slider27").slider
                    min: Math.round gon.minhhinc = if gon.minhhinc then gon.minhhinc else 0
                    max: Math.round gon.maxhhinc = if gon.maxhhinc then gon.maxhhinc else 100
                    value:[0,maxhhinc]
                    step: 1
                $("#slider6").slider
                    min: Math.round gon.minvmt = if gon.minvmt then gon.minvmt else 0
                    max: Math.round gon.maxvmt = if gon.maxvmt then gon.maxvmt else 100
                    value:[0,maxvmt]
                    step: 1 
            $("html, body").animate
                  scrollTop: 0
                , 600
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
            median_income = $('#slider27').val().replace(" ", "%20").toLowerCase() if $('#slider27').val()
            median_income_min = median_income.slice(0,(median_income.indexOf ",", 0)) if median_income
            median_income_max = median_income.slice((median_income.indexOf ",", 0)+1, median_income.length) if median_income
            console.log median_income_max
            if median_income is undefined
                qury = qury + ""
            else if median_income_min
                qury = "&by_median_income[min]=#{median_income_min}&by_median_income[max]=#{median_income_max}".replace(/\s*\(.*?\)\s*/g, "")
                #qury = "#{qury}" + "&by_median_income[min]=#{median_income_min}&by_median_income[max]=#{median_income_max}".replace(/\s*\(.*?\)\s*/g, "")
            query = "#{qury}"
            # here would are the basic validation and if passed the vent will trigger
            #urlstr = "/search.json?" + "#{gon.query}" + "#{query}".replace(/\s*\(.*?\)\s*/g, "")
            #console.log urlstr
            gon.query = "#{query}".replace(/\s*\(.*?\)\s*/g, "")
            #gon.query = "#{gon.query}" + "#{query}".replace(/\s*\(.*?\)\s*/g, "")

            App.vent.trigger "searchFired", gon.query
            