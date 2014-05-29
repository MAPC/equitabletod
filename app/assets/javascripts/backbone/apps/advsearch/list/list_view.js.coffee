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
                # make arrays of all values for each field #
                fars = _.map features, (key, value) -> key.properties.ov_far
                hhincs = _.map features, (key, value) -> key.properties.ov_hhinc
                vmts = _.map features, (key, value) -> key.properties.ov_vmthday
                pcttrans = _.map features, (key, value) -> key.properties.ov_pcttran * 100
                prkacs = _.map features, (key, value) -> key.properties.ov_prkac
                emp10s = _.map features, (key, value) -> key.properties.ov_emp10
                extaxrevs = _.map features, (key, value) -> key.properties.ex_taxrev
                hh10s = _.map features, (key, value) -> key.properties.ov_hh10
                vehphhs = _.map features, (key, value) -> key.properties.ov_vehphh
                trnpcmis = _.map features, (key, value) -> key.properties.ov_trnpcmi * 100 if key.properties.ov_trnpcmi
                ghgs = _.map features, (key, value) -> key.properties.ov_ghg if key.properties.ov_ghg
                intntots = _.map features, (key, value) -> key.properties.ov_intntot if key.properties.ov_intntot
                mixs = _.map features, (key, value) -> key.properties.ov_mix if key.properties.ov_mix
                hupacs = _.map features, (key, value) -> key.properties.ov_hupac if key.properties.ov_hupac
                empdens = _.map features, (key, value) -> key.properties.ov_empden if key.properties.ov_empden
                est10s = _.map features, (key, value) -> key.properties.ov_est_10 if key.properties.ov_est_10
                avals = _.map features, (key, value) -> key.properties.ov_aval if key.properties.ov_aval
                rentoccs = _.map features, (key, value) -> key.properties.ov_rentocc * 100 if key.properties.ov_rentocc
                hhnocars = _.map features, (key, value) -> key.properties.ov_hhnocar * 100 if key.properties.ov_hhnocar
                edatts = _.map features, (key, value) -> key.properties.ov_ed_att if key.properties.ov_ed_att
                walkscores = _.map features, (key, value) -> key.properties.walkscore if key.properties.walkscore
                # find minimum and maximum values #
                maxhhinc = hhincs.reduce (a,b) -> Math.max a, b
                minhhinc = hhincs.reduce (a,b) -> Math.min a, b
                maxvmt = vmts.reduce (a,b) -> Math.max a, b
                minvmt = vmts.reduce (a,b) -> Math.min a, b
                maxpcttran = pcttrans.reduce (a,b) -> Math.max a, b
                minpcttran = pcttrans.reduce (a,b) -> Math.min a, b
                maxvehphh = vehphhs.reduce (a,b) -> Math.max a, b
                minvehphh = vehphhs.reduce (a,b) -> Math.min a, b
                maxtrnpcmi = trnpcmis.reduce (a,b) -> Math.max a, b
                mintrnpcmi = trnpcmis.reduce (a,b) -> Math.min a, b
                maxghg = ghgs.reduce (a,b) -> Math.max a, b
                minghg = ghgs.reduce (a,b) -> Math.min a, b
                maxfar = fars.reduce (a,b) -> Math.max a, b
                minfar = fars.reduce (a,b) -> Math.min a, b
                maxprkac = prkacs.reduce (a,b) -> Math.max a, b
                minprkac = prkacs.reduce (a,b) -> Math.min a, b

                maxprkac = prkacs.reduce (a,b) -> Math.max a, b
                minprkac = prkacs.reduce (a,b) -> Math.min a, b
                # assign max min values to gon #
                gon.minhhinc = minhhinc
                gon.maxhhinc = maxhhinc
                gon.minvmt = minvmt
                gon.maxvmt = maxvmt
                gon.minpcttran = minpcttran
                gon.maxpcttran = maxpcttran
                gon.minvehphh = minvehphh
                gon.maxvehphh = maxvehphh
                gon.mintrnpcmi = mintrnpcmi
                gon.maxtrnpcmi = maxtrnpcmi
                gon.minghg = minghg
                gon.maxghg = maxghg
                gon.minfar = minfar
                gon.maxfar = maxfar
                gon.minprkac = minprkac
                gon.maxprkac = maxprkac

                gon.minprkac = minprkac
                gon.maxprkac = maxprkac
                # setup sliders
                $("#slider27").slider
                    min: Math.round gon.minhhinc = if gon.minhhinc then gon.minhhinc else 0
                    max: Math.round gon.maxhhinc = if gon.maxhhinc then gon.maxhhinc else 100
                    value:[minhhinc,maxhhinc]
                    step: 1
                $("#slider6").slider
                    min: Math.round gon.minvmt = if gon.minvmt then gon.minvmt else 0
                    max: Math.round gon.maxvmt = if gon.maxvmt then gon.maxvmt else 100
                    value:[minvmt,maxvmt]
                    step: 1 
                $("#slider7").slider
                    min: Math.round gon.minpcttran = if gon.minpcttran then gon.minpcttran else 0
                    max: Math.round gon.maxpcttran = if gon.maxpcttran then gon.maxpcttran else 100
                    value:[minpcttran,maxpcttran]
                    step: 1 
                $("#slider8").slider
                    min: Math.round gon.minvehphh = if gon.minvehphh then gon.minvehphh else 0
                    max: Math.round gon.maxvehphh = if gon.maxvehphh then gon.maxvehphh else 100
                    value:[minvehphh,maxvehphh]
                    step: 1 
                $("#slider9").slider
                    min: Math.round gon.mintrnpcmi = if gon.mintrnpcmi then gon.mintrnpcmi else 0
                    max: Math.round gon.maxtrnpcmi = if gon.maxtrnpcmi then gon.maxtrnpcmi else 100
                    value:[mintrnpcmi,maxtrnpcmi]
                    step: 1 
                $("#slider10").slider
                    min: Math.round gon.minghg = if gon.minghg then gon.minghg else 0
                    max: Math.round gon.maxghg = if gon.maxghg then gon.maxghg else 80
                    value:[0,80]
                    step: 0.1 
                $("#slider11").slider
                    min: Math.round gon.minfar = if gon.minfar then gon.minfar else 0
                    max: Math.round gon.maxfar = if gon.maxfar then gon.maxfar else 80
                    value:[minfar,maxfar]
                    step: 0.01 
                $("#slider12").slider
                    min: Math.round gon.minprkac = if gon.minprkac then gon.minprkac else 0
                    max: Math.round gon.maxprkac = if gon.maxprkac then gon.maxprkac else 80
                    value:[minprkac,maxprkac]
                    step: 1

                $("#slider12").slider
                    min: Math.round gon.minprkac = if gon.minprkac then gon.minprkac else 0
                    max: Math.round gon.maxprkac = if gon.maxprkac then gon.maxprkac else 80
                    value:[minprkac,maxprkac]
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
            