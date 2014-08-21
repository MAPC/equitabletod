@Equitabletod.module "FstationsApp.List", (List, App, Backbone, Marionette, $, _) ->

	class List.Layout extends App.Views.Layout
		template: "fstations/list/templates/list_layout"
		regions: 
			mapRegion: "#map-region"
			fstationsRegion: "#fstations-region"
			chartRegion: "#chart-region"
        
	class List.Detstation extends App.Views.ItemView
		template: "fstations/list/templates/_detstation"
		tagName: "div"

		onShow: ->
			$(document).ready ->
                fvmt = gon.feature["0"].properties.ov_vmthday.toFixed 4
                ffar = gon.feature["0"].properties.ov_far.toFixed 4
                fpcttran = (gon.feature["0"].properties.ov_pcttran.toFixed 4)
                femp10 = gon.feature["0"].properties.ov_emp10.toFixed 4
                fprkac = gon.feature["0"].properties.ov_prkac.toFixed 4
                fextaxrev = gon.feature["0"].properties.ex_taxrev.toFixed 4
                fhh10 = gon.feature["0"].properties.ov_hh10.toFixed 4
                fhhinc = gon.feature["0"].properties.ov_hhinc.toFixed 4
                femppipe = gon.feature["0"].properties.ov_emppipe.toFixed 1 if gon.feature["0"].properties.ov_emppipe
                $(".inlinesparklinevmt").sparkline gon.vmts, type: "box", target: fvmt, lineColor: '#7f7e7e', whiskerColor: '#7f7e7e', boxFillColor: '#ffffff', spotRadius: 2.5, width: '150', outlierLineColor: '#303030', showOutliers: false, tooltipFormatFieldlistKey: 'field', medianColor: '#7f7e7e', targetColor: '#bf0000'     
                $(".inlinesparklinefar").sparkline gon.fars, type: "box", target: ffar, lineColor: '#7f7e7e', whiskerColor: '#7f7e7e', boxFillColor: '#ffffff', spotRadius: 2.5, width: '170', outlierLineColor: '#303030', showOutliers: false, tooltipFormatFieldlistKey: 'field', medianColor: '#7f7e7e', targetColor: '#bf0000'
                $(".inlinesparklinepcttran").sparkline gon.pcttrans, type: "box", target: fpcttran, lineColor: '#7f7e7e', whiskerColor: '#7f7e7e', boxFillColor: '#ffffff', spotRadius: 2.5, width: '210', outlierLineColor: '#303030', showOutliers: false, tooltipFormatFieldlistKey: 'field', medianColor: '#7f7e7e', targetColor: '#bf0000'
                $(".inlinesparklineprkac").sparkline gon.prkacs, type: "box", target: fprkac, lineColor: '#7f7e7e', whiskerColor: '#7f7e7e', boxFillColor: '#ffffff', spotRadius: 2.5, width: '150', outlierLineColor: '#303030', showOutliers: false, tooltipFormatFieldlistKey: 'field', medianColor: '#7f7e7e', targetColor: '#bf0000' 
                $(".inlinesparklineemp10").sparkline gon.emp10s, type: "box", target: femp10, lineColor: '#7f7e7e', whiskerColor: '#7f7e7e', boxFillColor: '#ffffff', spotRadius: 2.5, width: '150', outlierLineColor: '#303030', showOutliers: false, tooltipFormatFieldlistKey: 'field', medianColor: '#7f7e7e', targetColor: '#bf0000'       
                $(".inlinesparklineextaxrev").sparkline gon.extaxrevs, type: "box", target: fextaxrev, lineColor: '#7f7e7e', whiskerColor: '#7f7e7e', boxFillColor: '#ffffff', spotRadius: 2.5, width: '150', outlierLineColor: '#303030', showOutliers: false, tooltipFormatFieldlistKey: 'field', medianColor: '#7f7e7e', targetColor: '#bf0000'      
                $(".inlinesparklinehh10").sparkline gon.hh10s, type: "box", target: fhh10, lineColor: '#7f7e7e', whiskerColor: '#7f7e7e', boxFillColor: '#ffffff', spotRadius: 2.5, width: '150', outlierLineColor: '#303030', showOutliers: false, tooltipFormatFieldlistKey: 'field', medianColor: '#7f7e7e', targetColor: '#bf0000'      
                $(".inlinesparklinehhinc").sparkline gon.hhincs, type: "box", target: fhhinc, lineColor: '#7f7e7e', whiskerColor: '#7f7e7e', boxFillColor: '#ffffff', spotRadius: 2.5, width: '150', outlierLineColor: '#303030', showOutliers: false, tooltipFormatFieldlistKey: 'field', medianColor: '#7f7e7e', targetColor: '#bf0000'     
                # $("#accordion").accordion activate: (event, ui) ->
                #     $("#accordion").accordion "refresh"
                fhupipe = gon.feature["0"].properties.ov_hupipe.toFixed 1 if gon.feature["0"].properties.ov_hupipe.toFixed
                femppipe = gon.feature["0"].properties.ov_emppipe.toFixed 1 if gon.feature["0"].properties.ov_emppipe.toFixed
                fvehphh = gon.feature["0"].properties.ov_vehphh.toFixed 4
                ftrnpcmi = (gon.feature["0"].properties.ov_trnpcmi.toFixed 4) if gon.feature["0"].properties.ov_trnpcmi
                fghg = gon.feature["0"].properties.ov_ghg.toFixed 4 if gon.feature["0"].properties.ov_ghg
                fintntot = gon.feature["0"].properties.ov_intntot if gon.feature["0"].properties.ov_intntot
                fmix = gon.feature["0"].properties.ov_mix.toFixed 4 if gon.feature["0"].properties.ov_mix
                fhupac = gon.feature["0"].properties.ov_hupac.toFixed 2 if gon.feature["0"].properties.ov_hupac
                fempden = gon.feature["0"].properties.ov_empden.toFixed 2 if gon.feature["0"].properties.ov_empden
                fest10 = gon.feature["0"].properties.ov_est_10.toFixed 4 if gon.feature["0"].properties.ov_est_10
                faval = gon.feature["0"].properties.ov_aval.toFixed 0 if gon.feature["0"].properties.ov_aval
                frentocc = (gon.feature["0"].properties.ov_rentocc.toFixed 4) if gon.feature["0"].properties.ov_rentocc
                fhhnocar = (gon.feature["0"].properties.ov_hhnocar.toFixed 4) if gon.feature["0"].properties.ov_hhnocar
                fedatt = gon.feature["0"].properties.ov_ed_att.toFixed 2 if gon.feature["0"].properties.ov_ed_att
                fwalkscore = gon.feature["0"].properties.walkscore.toFixed 2 if gon.feature["0"].properties.walkscore
                $(".inlinesparklinehupipe").sparkline [0, 82, 337, 1125.95, 4719], type: "box", raw: true, target: fhupipe, lineColor: '#7f7e7e', whiskerColor: '#7f7e7e', boxFillColor: '#ffffff', spotRadius: 2.5, width: '150', outlierLineColor: '#303030', showOutliers: false, tooltipFormatFieldlistKey: 'field', medianColor: '#7f7e7e', targetColor: '#bf0000' 
                $(".inlinesparklineemppipe").sparkline [0, 126.05, 1353.59, 2744.05, 16587.49], type: "box", raw: true, target: femppipe, lineColor: '#7f7e7e', whiskerColor: '#7f7e7e', boxFillColor: '#ffffff', spotRadius: 2.5, width: '150', outlierLineColor: '#303030', showOutliers: false, tooltipFormatFieldlistKey: 'field', medianColor: '#7f7e7e', targetColor: '#bf0000'   
                $(".inlinesparklinevehphh").sparkline gon.vehphhs, type: "box", target: fvehphh, lineColor: '#7f7e7e', whiskerColor: '#7f7e7e', boxFillColor: '#ffffff', spotRadius: 2.5, width: '150', outlierLineColor: '#303030', showOutliers: false, tooltipFormatFieldlistKey: 'field', medianColor: '#7f7e7e', targetColor: '#bf0000' 
                $(".inlinesparklinetrnpcmi").sparkline gon.trnpcmis, type: "box", target: ftrnpcmi, lineColor: '#7f7e7e', whiskerColor: '#7f7e7e', boxFillColor: '#ffffff', spotRadius: 2.5, width: '205', outlierLineColor: '#303030', showOutliers: false, tooltipFormatFieldlistKey: 'field', medianColor: '#7f7e7e', targetColor: '#bf0000' 
                $(".inlinesparklineghg").sparkline [0, 6.6, 11.15, 17.15, 75.9], type: "box", raw: true, target: fghg, lineColor: '#7f7e7e', whiskerColor: '#7f7e7e', boxFillColor: '#ffffff', spotRadius: 2.5, width: '130', outlierLineColor: '#303030', showOutliers: false, tooltipFormatFieldlistKey: 'field', medianColor: '#7f7e7e', targetColor: '#bf0000'    
                $(".inlinesparklineintntot").sparkline gon.intntots, type: "box", target: fintntot, lineColor: '#7f7e7e', whiskerColor: '#7f7e7e', boxFillColor: '#ffffff', spotRadius: 2.5, width: '150', outlierLineColor: '#303030', showOutliers: false, tooltipFormatFieldlistKey: 'field', medianColor: '#7f7e7e', targetColor: '#bf0000'    
                $(".inlinesparklinemix").sparkline gon.mixs, type: "box", target: fmix, lineColor: '#7f7e7e', whiskerColor: '#7f7e7e', boxFillColor: '#ffffff', spotRadius: 2.5, width: '309', outlierLineColor: '#303030', showOutliers: false, tooltipFormatFieldlistKey: 'field', medianColor: '#7f7e7e', targetColor: '#bf0000'                       
                $(".inlinesparklinehupac").sparkline [0, 4.62, 13.03, 28.42, 200], type: "box", raw: true, target: fhupac, lineColor: '#7f7e7e', whiskerColor: '#7f7e7e', boxFillColor: '#ffffff', spotRadius: 2.5, width: '150', outlierLineColor: '#303030', showOutliers: false, tooltipFormatFieldlistKey: 'field', medianColor: '#7f7e7e', targetColor: '#bf0000'   
                $(".inlinesparklineempden").sparkline [0, 12.102, 20.264, 34.031, 424.07], type: "box", raw: true, target: fempden, lineColor: '#7f7e7e', whiskerColor: '#7f7e7e', boxFillColor: '#ffffff', spotRadius: 2.5, width: '150', outlierLineColor: '#303030', showOutliers: false, tooltipFormatFieldlistKey: 'field', medianColor: '#7f7e7e', targetColor: '#bf0000'   
                $(".inlinesparklineest10").sparkline gon.est10s, type: "box", target: fest10, lineColor: '#7f7e7e', whiskerColor: '#7f7e7e', boxFillColor: '#ffffff', spotRadius: 2.5, width: '150', outlierLineColor: '#303030', showOutliers: false, tooltipFormatFieldlistKey: 'field', medianColor: '#7f7e7e', targetColor: '#bf0000'   
                $(".inlinesparklineaval").sparkline gon.avals, type: "box", target: faval, lineColor: '#7f7e7e', whiskerColor: '#7f7e7e', boxFillColor: '#ffffff', spotRadius: 2.5, width: '150', outlierLineColor: '#303030', showOutliers: false, tooltipFormatFieldlistKey: 'field', medianColor: '#7f7e7e', targetColor: '#bf0000'   
                $(".inlinesparklinerentocc").sparkline [0, 0.379, 0.584, 0.719, 0.996], type: "box", raw: true, target: frentocc, lineColor: '#7f7e7e', whiskerColor: '#7f7e7e', boxFillColor: '#ffffff', spotRadius: 2.5, width: '275', outlierLineColor: '#303030', showOutliers: false, tooltipFormatFieldlistKey: 'field', medianColor: '#7f7e7e', targetColor: '#bf0000'   
                $(".inlinesparklinehhnocar").sparkline [0, 0.06658, 0.20144, 0.36543, 0.6522], type: "box", raw: true, target: fhhnocar, lineColor: '#7f7e7e', whiskerColor: '#7f7e7e', boxFillColor: '#ffffff', spotRadius: 2.5, width: '235', outlierLineColor: '#303030', showOutliers: false, tooltipFormatFieldlistKey: 'field', medianColor: '#7f7e7e', targetColor: '#bf0000'                       
                $(".inlinesparklineedatt").sparkline gon.edatts, type: "box", target: fedatt, lineColor: '#7f7e7e', whiskerColor: '#7f7e7e', boxFillColor: '#ffffff', spotRadius: 2.5, width: '215', outlierLineColor: '#303030', showOutliers: false, tooltipFormatFieldlistKey: 'field', medianColor: '#7f7e7e', targetColor: '#bf0000' 
                $(".inlinesparklinewalkscore").sparkline gon.walkscores, type: "box", target: fwalkscore, lineColor: '#7f7e7e', whiskerColor: '#7f7e7e', boxFillColor: '#ffffff', spotRadius: 2.5, width: '150', outlierLineColor: '#303030', showOutliers: false, tooltipFormatFieldlistKey: 'field', medianColor: '#7f7e7e', targetColor: '#bf0000'   
           
            fm_options =
                bootstrap: true
                show_radio_button_list: false
                show_email: false
                name_placeholder: "boxplot"
                title_label : ""
                trigger_label : "How to Read Diagrams"
                custom_html: '<div id="boxplot" class="col-md-6 class="col-xs-4"><p style="line-height: 1.8em; text-align: justify; font-size: 12px; background-color: white;">The box plot (a.k.a. box and whisker diagram) is a way of displaying the distribution of data based on the five number summary: minimum, first quartile, median, third quartile, and maximum. Box plots show distribution of an attribute for all the station areas. the central rectangle spans the first quartile to the third quartile (the interquartile range or IQR). A segment inside the rectangle shows the median and "whiskers" above and below the box show the locations of the minimum and maximum for all staton areas. The red + indicates the current station value for the field. </p></div><div class="col-md-6 class="col-xs-4"><img src="img/boxplotsimple08.png" class="img-responsive" alt="Box Plot"></div>'
                show_form: false
                name_required: false
                close_on_click_outisde: true
                message_placeholder: ""
                feedback_url: "send_feedback_bootstrap"
                custom_params:
                  csrf: "my_secret_token"
                  user_id: "john_doe"
                  feedback_type: "bootstarp"

                delayed_options:
                  success_color: "#5cb85c"
                  fail_color: "#d2322d"
                  delay_success_milliseconds: 3500
                  send_success: "Thanks for your feedback, now go ahead and follow me on twitter/github :)"
              #init feedback_me plugin
            $(document).ready ->
              #set up some minimal options for the feedback_me plugin
              fm.init fm_options
              return
            $(document).ready -> 
                $("html, body").animate
                  scrollTop: 0
                , 600
                $("body").removeClass "nav-expanded"        
                $("#printpaker").click ->
                    $("a.print-preview").printPreview()
                    App.vent.trigger "printFired"                    
                #$("[rel=tooltipu]").tooltip placement: "top"
                $("#navigationsbl").html ''
                $("#navigationsbr").html ''
                $("#navigationsbl").html '<span class="glyphicon-class"></span><a><span id="previousbuttom" class="glyphicon glyphicon-chevron-left">  </span></a>' if gon.length > 1
                $("#navigationsbr").html '<span id="nextbuttom" class="glyphicon glyphicon-chevron-right">  </span>' if gon.length > 1
                $("#previousbuttom").click (event)->
                    @fstation = gon.feature
                    @fstations = gon.fstations     
                    fstationsList = @fstations.models
                    thisFeature = _.find fstationsList, (key, value) -> gon.feature["0"].properties.name == key.attributes.properties.name
                    nextCid = parseInt(thisFeature.cid.slice(1)) - 1 
                    nextFeature = _.find fstationsList, (key, value) -> nextCid == parseInt(key.cid.slice(1))
                    App.vent.trigger "searchFired", "by_name=#{nextFeature.attributes.properties.name}"
                $("#nextbuttom").click ->
                    @fstation = gon.feature
                    @fstations = gon.fstations     
                    fstationsList = @fstations.models
                    thisFeature = _.find fstationsList, (key, value) -> gon.feature["0"].properties.name == key.attributes.properties.name
                    nextCid = parseInt(thisFeature.cid.slice(1)) + 1 
                    nextFeature = _.find fstationsList, (key, value) -> nextCid == parseInt(key.cid.slice(1))
                    App.vent.trigger "searchFired", "by_name=#{nextFeature.attributes.properties.name}"
                pfeature = _.values gon.feature
                pjfeature = pfeature.map (pf) -> pf.properties
                jfeature = JSON.stringify(pjfeature)
                $("#panel").html "<span class='glyphicon-class'></span> <a href='#advsearch/' id='searchrefine'><span class='glyphicon glyphicon-filter' rel='tooltipb' title='Refine the Search Results'>  </span></a>"
                $("#titlepage").html "<p class='h3'>Stations Area Details</p>"
                $("#titlename").html "<span class='h4'>  #{gon.feature['0'].properties.name}  </span>"
                $("#dllink").html "<span class='glyphicon-class'></span> <a href='#' id='download'><span class='glyphicon glyphicon-download' rel='tooltipb' title='Download Data for This Station' >  </span></a>"
                JSON2CSV = (objArray) ->
                  array = (if typeof objArray isnt "object" then JSON.parse(objArray) else objArray)
                  str = ""
                  line = ""
                  head = array[0]

                  for index of array[0]
                    value = index + ""
                    line += "\"" + value.replace(/"/g, "\"\"") + "\","
                  line = line.slice(0, -1)
                  str += line + "\r\n"
                  i = 0

                  while i < array.length
                    line = ""
                    for index of array[i]
                        value = array[i][index] + ""
                        line += "\"" + value.replace(/"/g, "\"\"") + "\","
                    line = line.slice(0, -1)
                    str += line + "\r\n"
                    i++
                  str

                $(document).ready -> 
                    $("body").removeClass "nav-expanded"

                $("#download").click ->
                  json = $.parseJSON(jfeature)
                  csv = JSON2CSV(json)
                  window.open "data:text/csv;charset=utf-8," + escape(csv)
                  return

                $("#searchrefine").click (event, ui) ->
                    console.log "it gets the click"
                    App.vent.trigger "searchrefineFired"
                $("#dialog-modal").dialog 
                    position:
                        my: "center"
                    autoOpen: false
                    closeOnEscape: true
                    height: 950
                    width: 950
                    show:
                        effect: "fade"
                        duration: 100  
                    hide:
                        effect: "fade"
                        duration: 100


                $("#dialog-modal").dialog beforeClose: (event, ui) ->
                    $("#accordion").accordion "enable"

                $("[rel=tooltipr]").tooltip placement: "top"
                $("#detailscol").resizable()
                $("#resize-map").resizable()
                $("#map-region").resizable()
                $("[rel=tooltiprf]").click (event, ui) ->
                    $("#accordion").accordion "disable"
                    gon.query = "#{@.title}&" + gon.query
                    App.vent.trigger "searchFired", gon.query
                $("[rel=tooltipd]").click (event, ui) ->
                    $("#accordion").accordion "disable"
                    dictionaryResponse = $.ajax
                            url: "/dictionary_entries.json?by_name=#{@.title}"
                            done: (result) =>
                                return result
                    dictionary = dictionaryResponse.complete()
                    dictionary.done =>
                        dictionaries = dictionary.responseJSON
                        @dictionaryentries = App.request "set:dictionaryentry", dictionaries
                        $(@el).tooltip "option", title: ""
                        $("#dialog-modal").dialog "open"
                        $("#dialog-modal").html("")
                        $("#dialog-modal").dialog title: "#{@dictionaryentries.models["0"].get("interpretation")}"
                        $("#dialog-modal").html("<hm2>#{@dictionaryentries.models["0"].get("code")} <br><br> <span>What it is: </span>#{@dictionaryentries.models["0"].get("importance")} <br><br> <span>Why it's important: </span>#{@dictionaryentries.models["0"].get("description")} <br><br> <span>Technical notes: </span>#{@dictionaryentries.models["0"].get("technical_notes")}</hm2>")
                        $("#dialog-modal").dialog height: "auto" 
                        $("#dialog-modal").dialog modal: true

			$("[rel=tooltip]").tooltip placement: "left"
			$("[rel=tooltipb]").tooltip placement: "buttom"
			$("[rel=tooltip]").tooltip track: true
			$("#accordion").accordion 
                header: "hm3" 
                active: "" # the index of accordion category to show expanded by inititiation
                heightStyle: "content"
                autoHeight: true
                width: 100
                collapsible: true
                icons:
                    header: "ui-icon-plus"
                    activeHeader: "ui-icon-minus"

            $("#accordion").find($("span.accordion-header")).text " Click For More"
            return

	class List.Detstations extends App.Views.CollectionView
		template: "fstations/list/templates/_detstations"
		itemView: List.Detstation
		itemViewContainer: "tbody"

	class List.Fstation extends App.Views.ItemView
		template: "fstations/list/templates/_fstation"
		tagName: "tr"            

	class List.Fstations extends App.Views.CollectionView
		template: "fstations/list/templates/_fstations"
		itemView: List.Fstation
		itemViewContainer: "tbody"
		onBeforeRender: ->
			stationfeature = gon.features
			muni_names = _.map stationfeature, (key, value) ->
                muni_names = (_.pluck key, 'muni_name')
                muni_names[2].toLowerCase()
                names = (_.pluck key, 'name')
                names[2].toLowerCase()
            #@collection = names
            names = _.map stationfeature, (key, value) ->
                    names = (_.pluck key, 'name')
                    names[2].toLowerCase()
                console.log names
			station = [
			  {
			    name: names
			    municipality: muni_names
			  }
			]

		onShow: ->
            pfeatures = _.values gon.features
            pjfeatures = pfeatures.map (pf) -> pf.properties
            jfeatures = JSON.stringify(pjfeatures)
            $("#titles").html "<p class='h2'>Search Results </p><p><a href='#advsearch/' id='searchrefine'><button type='button' class='btn btn-default btn3d col-xs-offset-0'>Refine Results</button></a></p>" #<p>#{gon.query}</p><a>Page #{gon.page_number} of #{gon.num_pages} </a>"
            $("html, body").animate
                  scrollTop: 0
                , "fast"
            #$("[rel=tooltipu]").tooltip placement: "top"
            $("#panel").html "<a href='#advsearch/' id='searchrefine'><button type='button' class='btn btn-default btn3d col-xs-offset-0'>Refine Results</button></a> "
            $("[rel=tooltiprf]").click (event, ui) ->
                gon.query = "#{@.title}&" + gon.query
                App.vent.trigger "searchFired", gon.query
            $("#dllink").html "<button id='download' type='button' class='btn btn-default btn3d col-xs-offset-0'>Download This Data</button>"
            if gon.paginate == true
                $("#navigationsb").html '<button id="previousbuttom" type="button" class="btn btn-default btn3d">&lsaquo;</button><strong class="col-xs-offset-0"><a class="hm2" href="#"> <strong>Navigate Results</strong></a></strong><button id="nextbuttom" type="button" class="btn btn-default btn3d col-xs-offset-0">&rsaquo;</button>'
                $("#panel").html "<a href='#advsearch/' id='searchrefine'><button type='button' class='btn btn-default btn3d col-xs-offset-0'>Refine Results</button></a>"
                $("#nextbuttom").click ->
                    if gon.num_pages > gon.page_number is true
                        App.vent.trigger "searchFired", gon.query
                    else
                        gon.page_number = gon.page_number + 1 
                        App.vent.trigger "searchFired", "pgr" + "#{gon.page_number}"
                $("#previousbuttom").click ->
                    if gon.num_pages > gon.page_number is true
                        App.vent.trigger "searchFired", gon.query
                    else
                        gon.page_number = gon.page_number - 1 if gon.page_number > 1
                        App.vent.trigger "searchFired", "pgr" + "#{gon.page_number}"

            else
                $("#panel").html "<a href='#advsearch/' id='searchrefine'><button type='button' class='btn btn-default btn3d col-xs-offset-0'>Refine Results</button></a> "

            JSON2CSV = (objArray) ->
              array = (if typeof objArray isnt "object" then JSON.parse(objArray) else objArray)
              str = ""
              line = ""
              head = array[0]

              for index of array[0]
                value = index + ""
                line += "\"" + value.replace(/"/g, "\"\"") + "\","
              line = line.slice(0, -1)
              str += line + "\r\n"
              i = 0

              while i < array.length
                line = ""
                for index of array[i]
                    value = array[i][index] + ""
                    line += "\"" + value.replace(/"/g, "\"\"") + "\","
                line = line.slice(0, -1)
                str += line + "\r\n"
                i++
              str

            $(document).ready -> 
                $("body").removeClass "nav-expanded"

            $("#download").click ->
              json = $.parseJSON(jfeatures)
              csv = JSON2CSV(json)
              window.open "data:text/csv;charset=utf-8," + escape(csv)
              return

            $("#searchrefine").click (event, ui) ->
                console.log "it gets the click"
                App.vent.trigger "searchrefineFired"

		
	class List.Chart extends App.Views.Layout
		template: "fstations/list/templates/_chart"
		onShow: ->
			stationfeature = gon.feature["0"] 
			w = 150
			h = 150
			colorscale = d3.scale.category10()

			#Legend titles
			LegendOptions = [
			  "Orientation"
			  "Transit"
              "Development"
			]

			#Data
			d = [
			  [
			    {
			      axis: "Orientation"
			      value: stationfeature.properties.etod_sub2o
			    }
			    {
			      axis: "Transit"
			      value: stationfeature.properties.etod_sub1t
			    }
			    {
			      axis: "Development"
			      value: stationfeature.properties.etod_sub3d
			    }
			  ]
			 
			]

			#Options for the Radar chart, other than default
			mycfg =
			  w: w
			  h: h
			  maxValue: 20
			  levels: 4
			  ExtraWidthX: 160


			#Call function to draw the Radar chart
			#Will expect that data is in %'s
			RadarChart.draw "#chart", d, mycfg

	class List.Map extends App.Views.Layout
		template: "fstations/list/templates/_map"
		el: "#maplist"
		modelEvents:
		  "change" : "render"

		onShow: -> 
			maplist = L.map("maplist",
			  scrollWheelZoom: false
			  touchZoom: false
			  doubleClickZoom: true
			  zoomControl: true
			  dragging: true
			  maxZoom: 18
			)

			L.tileLayer("http://tiles.mapc.org/basemap/{z}/{x}/{y}.png",
			  attribution: 'Map tiles by <a href="http://leafletjs.com">MAPC</a>'
			).addTo maplist
			if gon.paginate == true 
                geoCollection = gon.features_sliced 
            else 
                geoCollection = gon.features 
			fstations = new L.GeoJSON geoCollection,   
				pointToLayer: (feature, latlng) ->

                    L.Icon.Default.imagePath = "/assets"
                    L.marker(latlng).on 'mouseover', (e) ->
                        popup = L.popup().setLatLng(latlng).setContent("<p class='hm2'><a id='popup' href='#fss/q/by_name=#{feature.properties.name}'>#{feature.properties.name}</a></br><span>#{feature.properties.muni_name}</span></br><span>#{feature.properties.line_descr}</span></p>").openOn(maplist)    
                    


			maplist.addLayer(fstations)
			bbox = fstations.getBounds().toBBoxString()
			maplist.fitBounds [
			  [
			    parseFloat(bbox.split(",")[1])
			    parseFloat(bbox.split(",")[0])
			  ]
			  [
			    parseFloat(bbox.split(",")[3])
			    parseFloat(bbox.split(",")[2])
			  ]
			] 

	class List.DictView extends App.Views.Layout
        template: "fstations/list/templates/_dict"
        el: "#dictview"
        modelEvents:
          "change" : "render"

        onShow: ->
            console.log "this is dictview"
            dictionaryResponse = $.ajax
                        url: "/dictionary_entries.json?by_name=#{@.title}"
                        done: (result) =>
                            return result
                dictionary = dictionaryResponse.complete()
                dictionary.done =>
                    dictionaries = dictionary.responseJSON
                    @dictionaryentries = App.request "set:dictionaryentry", dictionaries
                    @collection = @dictionaryentries
                    
            $("[rel=tooltipd]").click (event, ui) ->
                $("#accordion").accordion "disable"
                $(@el).tooltip "option", title: ""
                $("#dialog-modal").dialog "open"
                $("#dialog-modal").html("")
                $("#dialog-modal").dialog title: "#{@dictionaryentries.models["0"].get("interpretation")}"
                $("#dialog-modal").html("<hm2>#{@dictionaryentries.models["0"].get("code")} <br><br> <span>What it is: </span>#{@dictionaryentries.models["0"].get("importance")} <br><br> <span>Why it's important: </span>#{@dictionaryentries.models["0"].get("description")} <br><br> <span>Technical notes: </span>#{@dictionaryentries.models["0"].get("technical_notes")}</hm2>")
                $("#dialog-modal").dialog height: "auto" 
                $("#dialog-modal").dialog modal: true

    class List.MapDetail extends App.Views.Layout
        template: "fstations/list/templates/_map"
        el: "#map"
        modelEvents:
          "change" : "render"

        onShow: ->
            map = L.map("map",
              scrollWheelZoom: false
              touchZoom: false
              doubleClickZoom: true
              zoomControl: true
              dragging: true
            )
            map.setView [
              42.31
              -71.077359
            ], 10
            

            info = L.control()
            info.onAdd = (map) ->
              @_div = L.DomUtil.create("div", "info")
              @update()
              @_div
            info.update = (props) ->
              @_div.innerHTML = '<div id="chart"> </div>' 
              return
            #info.addTo map
            mapc = L.tileLayer("http://tiles.mapc.org/basemap/{z}/{x}/{y}.png",
              attribution: 'Map tiles by <a href="http://leafletjs.com">MAPC</a>'
            ).addTo(map)
            #defaultLayer = L.tileLayer.provider("OpenStreetMap.Mapnik").addTo(map)
            streets = L.tileLayer.provider "MapBox.mapc.i8ddbf5a"
            esri = L.tileLayer.provider "Esri.WorldImagery"
            #esring = L.tileLayer.provider "Esri.NatGeoWorldMap"
            #esrism = L.tileLayer.provider "Esri.WorldStreetMap"
            basemap = new L.MAPCTileLayer("basemap")
            regional = new L.MAPCTileLayer("trailmap-regional")
            onroad = new L.MAPCTileLayer("trailmap-onroad")
            paths = new L.MAPCTileLayer("trailmap-paths")
            sidewalks = L.tileLayer.wms("http://metrobostondatacommon.org/geoserver/gwc/service/wms",
              layers: "geonode:sidewalks"
              format: "image/png"
              transparent: true
            )
            baseMaps =
                "MAPC Base Map": mapc
                "Esri Aerial": esri
                "MapBox StreetMap": streets
            geoCollection =  gon.feature
            fstation = new L.GeoJSON geoCollection,
                style: (feature) ->
                    feature.properties and feature.properties.style
                pointToLayer: (feature, latlng) ->
                    L.circle latlng, 804.672,
                      fillColor: "#FFFFFF"
                      color: "#000"
                      weight: 1
                      opacity: 0.3
                      fillOpacity: 0.5
                    
            map.addLayer(fstation)
            fstationZoom = new L.GeoJSON geoCollection,
                style: (feature) ->
                    feature.properties and feature.properties.style
                pointToLayer: (feature, latlng) ->
                    L.circle latlng, 804.672,
                      fillColor: "#FFFFFF"
                      color: "#000"
                      weight: 2
                      opacity: 0.5
                      fillOpacity: 0
            L.control.scale().addTo(map)
            overlays =
                "Regional Networks": regional
                "On-road Bicycle Facilities": onroad
                "Paths and Trails": paths
                "Sidewalk Inventory": sidewalks
                "Station Area": fstation
                "Half Mile Boundary": fstationZoom
            
            layersControl = new L.Control.Layers(baseMaps, overlays,
                collapsed: false
                )
            map.addControl layersControl

            bbox = fstation.getBounds().toBBoxString()
            console.log bbox
            map.fitBounds [
              [
                parseFloat(bbox.split(",")[1])
                parseFloat(bbox.split(",")[0])
              ]
              [
                parseFloat(bbox.split(",")[3])
                parseFloat(bbox.split(",")[2])
              ]
            ]
            onZoomend = ->
                zoom = map.getZoom()
                if zoom >= 16
                    map.removeLayer fstation
                    fstationZoom.addTo map
                else
                    map.removeLayer fstationZoom
                    fstation.addTo map
                return
            map.on "zoomend", onZoomend
            $("#chart").click (event, ui) ->
                    console.log "chart clicked"
                    sub1 = gon.feature["0"].properties.etod_sub1t
                    sub2 = gon.feature["0"].properties.etod_sub2o
                    sub3 = gon.feature["0"].properties.etod_sub3d
                    totscore = gon.feature["0"].properties.etod_total
                    $("#dialog-chart").dialog "open"
                    $("#dialog-chart").html("Transit Score: #{sub1}<br>Orientation Score: #{sub2}<br>Development Score: #{sub3}<br><hr>Total Score: #{totscore}")

			




