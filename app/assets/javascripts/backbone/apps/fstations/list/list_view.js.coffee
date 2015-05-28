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
                $("#dialog-modal").dialog 
                    position:
                        my: "right"
                        at: "right"
                    autoOpen: false
                    closeOnEscape: true
                    width: 780
                    show:
                        effect: "fade"
                        duration: 400  
                    hide:
                        effect: "fade"
                        duration: 400
                    title: 
                        $("[rel=tooltipd]").title
                dictionaryResponse = $.ajax
                            url: "/dictionary_entries.json?by_name="
                            done: (result) =>
                                return result
                    dictionary = dictionaryResponse.complete()
                    dictionary.done =>
                        dictionaries = dictionary.responseJSON
                        @dictionaryentries = App.request "set:dictionaryentry", dictionaries
                        dict_lookup_dict = {}
                        for each in @dictionaryentries.models
                            dict_lookup_dict[each.get("interpretation")] = each.get("name")

                        gon.dict_lookup_dict = dict_lookup_dict
                
                # seting up design parameters for pdf exports

                gon.section_header_lead = 18
                gon.section_header_fontSize = 10
                gon.section_header_fontSyle = 'bold'
                gon.item_lead = 32
                gon.item_fontSize = 8
                gon.item_fontStyle = 'normal'
                gon.describton_lead = 10
                gon.describton_fontSize = 7
                gon.describton_fontSize2 = 6
                gon.describton_fontStyle = 'italic'
                gon.sparkline_lead = -9
                gon.sparkline_x_left = 220
                gon.sparkline_x_right = 495
                # # section zero points

                gon.page_header_z_point_x = 463
                gon.page_header_z_point_y = 30

                gon.basic_z_point_x = 40
                gon.basic_z_point_y = 55

                gon.columns_width = 170 

                gon.etod_z_point_x = 40
                gon.etod_z_point_y = 95

                gon.transportation_z_point_x = 40
                gon.transportation_z_point_y = 350

                gon.development_z_point_x = 340
                gon.development_z_point_y = 265

                gon.economics_z_point_x = 340
                gon.economics_z_point_y = 585

                gon.demographics_z_point_x = 40
                gon.demographics_z_point_y = 540

                # drawing the radar chart manually
                gon.radar_z_x = 80
                gon.radar_z_y = gon.etod_z_point_y+gon.section_header_lead+gon.item_lead + 30
                gon.radar_width = 70
                gon.radar_height = 70




                # seting up data for sparklines
                fvmt = gon.feature["0"].properties.ov_vmthday.toFixed 4
                ffar = gon.feature["0"].properties.ov_far.toFixed 4
                fpcttran = (gon.feature["0"].properties.ov_pcttran.toFixed 4)
                femp10 = gon.feature["0"].properties.ov_emp10.toFixed 4
                fprkac = gon.feature["0"].properties.ov_prkac.toFixed 4
                fextaxrev = gon.feature["0"].properties.ex_taxrev.toFixed 4
                fhh10 = gon.feature["0"].properties.ov_hh10.toFixed 4
                fhhinc = gon.feature["0"].properties.ov_hhinc.toFixed 4
                femppipe = gon.feature["0"].properties.ov_emppipe.toFixed 1 if gon.feature["0"].properties.ov_emppipe
                $(".inlinesparklinevmt").sparkline gon.vmts, type: "box", raw: true, target: fvmt, lineColor: '#7f7e7e', whiskerColor: '#7f7e7e', boxFillColor: '#ffffff', spotRadius: 2.5, width: '150', outlierLineColor: '#303030', showOutliers: false, tooltipFormatFieldlistKey: 'field', medianColor: '#7f7e7e', targetColor: '#bf0000'     
                $(".inlinesparklinefar").sparkline gon.fars, type: "box", raw: true, target: ffar, lineColor: '#7f7e7e', whiskerColor: '#7f7e7e', boxFillColor: '#ffffff', spotRadius: 2.5, width: '170', outlierLineColor: '#303030', showOutliers: false, tooltipFormatFieldlistKey: 'field', medianColor: '#7f7e7e', targetColor: '#bf0000'
                $(".inlinesparklinepcttran").sparkline gon.pcttrans, type: "box", raw: true, target: fpcttran, lineColor: '#7f7e7e', whiskerColor: '#7f7e7e', boxFillColor: '#ffffff', spotRadius: 2.5, width: '425', outlierLineColor: '#303030', showOutliers: false, tooltipFormatFieldlistKey: 'field', medianColor: '#7f7e7e', targetColor: '#bf0000'
                $(".inlinesparklineprkac").sparkline gon.prkacs, type: "box", raw: true, target: fprkac, lineColor: '#7f7e7e', whiskerColor: '#7f7e7e', boxFillColor: '#ffffff', spotRadius: 2.5, width: '150', outlierLineColor: '#303030', showOutliers: false, tooltipFormatFieldlistKey: 'field', medianColor: '#7f7e7e', targetColor: '#bf0000' 
                $(".inlinesparklineemp10").sparkline gon.emp10s, type: "box", target: femp10, lineColor: '#7f7e7e', whiskerColor: '#7f7e7e', boxFillColor: '#ffffff', spotRadius: 2.5, width: '150', outlierLineColor: '#303030', showOutliers: false, tooltipFormatFieldlistKey: 'field', medianColor: '#7f7e7e', targetColor: '#bf0000'       
                $(".inlinesparklineextaxrev").sparkline gon.extaxrevs, type: "box", raw: true, target: fextaxrev, lineColor: '#7f7e7e', whiskerColor: '#7f7e7e', boxFillColor: '#ffffff', spotRadius: 2.5, width: '150', outlierLineColor: '#303030', showOutliers: false, tooltipFormatFieldlistKey: 'field', medianColor: '#7f7e7e', targetColor: '#bf0000'      
                $(".inlinesparklinehh10").sparkline gon.hh10s, type: "box", raw: true, target: fhh10, lineColor: '#7f7e7e', whiskerColor: '#7f7e7e', boxFillColor: '#ffffff', spotRadius: 2.5, width: '150', outlierLineColor: '#303030', showOutliers: false, tooltipFormatFieldlistKey: 'field', medianColor: '#7f7e7e', targetColor: '#bf0000'      
                $(".inlinesparklinehhinc").sparkline gon.hhincs, type: "box", raw: true, target: fhhinc, lineColor: '#7f7e7e', whiskerColor: '#7f7e7e', boxFillColor: '#ffffff', spotRadius: 2.5, width: '150', outlierLineColor: '#303030', showOutliers: false, tooltipFormatFieldlistKey: 'field', medianColor: '#7f7e7e', targetColor: '#bf0000'     
                # $("#accordion").accordion activate: (event, ui) ->
                #     $("#accordion").accordion "refresh"
                fhupipe = gon.feature["0"].properties.ov_hupipe.toFixed 1 if gon.feature["0"].properties.ov_hupipe.toFixed
                femppipe = gon.feature["0"].properties.ov_emppipe.toFixed 1 if gon.feature["0"].properties.ov_emppipe.toFixed
                fvehphh = gon.feature["0"].properties.ov_vehphh.toFixed 2
                ftrnpcmi = ((gon.feature["0"].properties.ov_trnpcmi.toFixed 4) * 100) if gon.feature["0"].properties.ov_trnpcmi
                fghg = gon.feature["0"].properties.ov_ghg.toFixed 4 if gon.feature["0"].properties.ov_ghg
                fintntot = gon.feature["0"].properties.ov_intntot if gon.feature["0"].properties.ov_intntot
                fmix = gon.feature["0"].properties.ov_mix.toFixed 4 if gon.feature["0"].properties.ov_mix
                fhupac = gon.feature["0"].properties.ov_hupac.toFixed 2 if gon.feature["0"].properties.ov_hupac
                fempden = gon.feature["0"].properties.ov_empden.toFixed 0 if gon.feature["0"].properties.ov_empden
                fest10 = gon.feature["0"].properties.ov_est_10.toFixed 4 if gon.feature["0"].properties.ov_est_10
                faval = gon.feature["0"].properties.ov_aval.toFixed 0 if gon.feature["0"].properties.ov_aval
                frentocc = (gon.feature["0"].properties.ov_rentocc.toFixed 4) if gon.feature["0"].properties.ov_rentocc
                fhhnocar = ((gon.feature["0"].properties.ov_hhnocar.toFixed 2) * 100) if gon.feature["0"].properties.ov_hhnocar
                fedatt = gon.feature["0"].properties.ov_ed_att.toFixed 2 if gon.feature["0"].properties.ov_ed_att
                fwalkscore = gon.feature["0"].properties.walkscore.toFixed 2 if gon.feature["0"].properties.walkscore
                $(".inlinesparklinehupipe").sparkline gon.hupipes, type: "box", raw: true, target: fhupipe, lineColor: '#7f7e7e', whiskerColor: '#7f7e7e', boxFillColor: '#ffffff', spotRadius: 2.5, width: '150', outlierLineColor: '#303030', showOutliers: false, tooltipFormatFieldlistKey: 'field', medianColor: '#7f7e7e', targetColor: '#bf0000' 
                $(".inlinesparklineemppipe").sparkline gon.emppipes, type: "box", raw: true, target: femppipe, lineColor: '#7f7e7e', whiskerColor: '#7f7e7e', boxFillColor: '#ffffff', spotRadius: 2.5, width: '150', outlierLineColor: '#303030', showOutliers: false, tooltipFormatFieldlistKey: 'field', medianColor: '#7f7e7e', targetColor: '#bf0000'   
                $(".inlinesparklinevehphh").sparkline gon.vehphhs, type: "box", raw: true, target: fvehphh, lineColor: '#7f7e7e', whiskerColor: '#7f7e7e', boxFillColor: '#ffffff', spotRadius: 2.5, width: '180', outlierLineColor: '#303030', showOutliers: false, tooltipFormatFieldlistKey: 'field', medianColor: '#7f7e7e', targetColor: '#bf0000' 
                $(".inlinesparklinetrnpcmi").sparkline gon.trnpcmis, type: "box", raw: true, target: ftrnpcmi, lineColor: '#7f7e7e', whiskerColor: '#7f7e7e', boxFillColor: '#ffffff', spotRadius: 2.5, width: '150', outlierLineColor: '#303030', showOutliers: false, tooltipFormatFieldlistKey: 'field', medianColor: '#7f7e7e', targetColor: '#bf0000' 
                $(".inlinesparklineghg").sparkline gon.ghgs, type: "box", raw: true, target: fghg, lineColor: '#7f7e7e', whiskerColor: '#7f7e7e', boxFillColor: '#ffffff', spotRadius: 2.5, width: '150', outlierLineColor: '#303030', showOutliers: false, tooltipFormatFieldlistKey: 'field', medianColor: '#7f7e7e', targetColor: '#bf0000'    
                $(".inlinesparklineintntot").sparkline gon.intntots, type: "box", raw: true, target: fintntot, lineColor: '#7f7e7e', whiskerColor: '#7f7e7e', boxFillColor: '#ffffff', spotRadius: 2.5, width: '150', outlierLineColor: '#303030', showOutliers: false, tooltipFormatFieldlistKey: 'field', medianColor: '#7f7e7e', targetColor: '#bf0000'    
                $(".inlinesparklinemix").sparkline gon.mixs, type: "box", raw: true, target: fmix, lineColor: '#7f7e7e', whiskerColor: '#7f7e7e', boxFillColor: '#ffffff', spotRadius: 2.5, width: '309', outlierLineColor: '#303030', showOutliers: false, tooltipFormatFieldlistKey: 'field', medianColor: '#7f7e7e', targetColor: '#bf0000'                       
                $(".inlinesparklinehupac").sparkline gon.hupacs, type: "box", raw: true, target: fhupac, lineColor: '#7f7e7e', whiskerColor: '#7f7e7e', boxFillColor: '#ffffff', spotRadius: 2.5, width: '150', outlierLineColor: '#303030', showOutliers: false, tooltipFormatFieldlistKey: 'field', medianColor: '#7f7e7e', targetColor: '#bf0000'   
                $(".inlinesparklineempden").sparkline gon.empdens, type: "box", raw: true, target: fempden, lineColor: '#7f7e7e', whiskerColor: '#7f7e7e', boxFillColor: '#ffffff', spotRadius: 2.5, width: '150', outlierLineColor: '#303030', showOutliers: false, tooltipFormatFieldlistKey: 'field', medianColor: '#7f7e7e', targetColor: '#bf0000'   
                $(".inlinesparklineest10").sparkline gon.est10s, type: "box", raw: true, target: fest10, lineColor: '#7f7e7e', whiskerColor: '#7f7e7e', boxFillColor: '#ffffff', spotRadius: 2.5, width: '150', outlierLineColor: '#303030', showOutliers: false, tooltipFormatFieldlistKey: 'field', medianColor: '#7f7e7e', targetColor: '#bf0000'   
                $(".inlinesparklineaval").sparkline gon.avals, type: "box", raw: true, target: faval, lineColor: '#7f7e7e', whiskerColor: '#7f7e7e', boxFillColor: '#ffffff', spotRadius: 2.5, width: '150', outlierLineColor: '#303030', showOutliers: false, tooltipFormatFieldlistKey: 'field', medianColor: '#7f7e7e', targetColor: '#bf0000'   
                $(".inlinesparklinerentocc").sparkline gon.rentoccs, raw: true, type: "box", raw: true, target: frentocc, lineColor: '#7f7e7e', whiskerColor: '#7f7e7e', boxFillColor: '#ffffff', spotRadius: 2.5, width: '295', outlierLineColor: '#303030', showOutliers: false, tooltipFormatFieldlistKey: 'field', medianColor: '#7f7e7e', targetColor: '#bf0000'   
                $(".inlinesparklinehhnocar").sparkline gon.hhnocars, raw: true, type: "box", raw: true, target: fhhnocar, lineColor: '#7f7e7e', whiskerColor: '#7f7e7e', boxFillColor: '#ffffff', spotRadius: 2.5, width: '150', outlierLineColor: '#303030', showOutliers: false, tooltipFormatFieldlistKey: 'field', medianColor: '#7f7e7e', targetColor: '#bf0000'                       
                $(".inlinesparklineedatt").sparkline gon.edatts, type: "box", raw: true, target: fedatt, lineColor: '#7f7e7e', whiskerColor: '#7f7e7e', boxFillColor: '#ffffff', spotRadius: 2.5, width: '355', outlierLineColor: '#303030', showOutliers: false, tooltipFormatFieldlistKey: 'field', medianColor: '#7f7e7e', targetColor: '#bf0000' 
                $(".inlinesparklinewalkscore").sparkline gon.walkscores, type: "box", raw: true, target: fwalkscore, lineColor: '#7f7e7e', whiskerColor: '#7f7e7e', boxFillColor: '#ffffff', spotRadius: 2.5, width: '150', outlierLineColor: '#303030', showOutliers: false, tooltipFormatFieldlistKey: 'field', medianColor: '#7f7e7e', targetColor: '#bf0000'   
           
            fm_options =
                bootstrap: true
                show_radio_button_list: false
                show_email: false
                name_placeholder: "boxplot"
                title_label : ""
                trigger_label : "How to Read Diagrams"
                custom_html: ''
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
            $("[rel=tooltipd]").tooltip placement: "right"
            $(document).ready ->
                #set up some minimal options for the feedback_me plugin
                fm.init fm_options
                return
            $(document).ready -> 
                $("html, body").animate
                  scrollTop: ($("#detailscol").offset().top)
                , 500
                $("body").removeClass "nav-expanded"                           
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
                $("#print").html "<span class='glyphicon-class'></span> <a href='#' id='print'><span class='glyphicon glyphicon-print' rel='tooltipb' title='Save as PDF' >  </span></a>"
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

                exportTableToCSV = (jfeature, filename, spinnerD) ->
                  json = $.parseJSON(jfeature)
                  csv = JSON2CSV(json)
                  spinnerD.stop()
                  # Data URI
                  csvData = "data:application/csv;charset=utf-8," + encodeURIComponent(csv)
                  $(this).attr
                    download: filename
                    href: csvData
                    target: "_blank"

                  return

                # This must be a hyperlink
                $(".export").on "click", (event) ->
                  
                  # CSV
                  exportTableToCSV.apply this, [
                    $("#dvData>table")
                    "export.csv"
                  ]
                  return


                # IF CSV, don't do event.preventDefault() or return false
                # We actually need this to be a typical hyperlink
                $("#download").on "click", (event) ->
                    spinopts =
                        lines: 13 # The number of lines to draw
                        length: 20 # The length of each line
                        width: 10 # The line thickness
                        radius: 30 # The radius of the inner circle
                        corners: 1 # Corner roundness (0..1)
                        rotate: 0 # The rotation offset
                        direction: 1 # 1: clockwise, -1: counterclockwise
                        color: "#000" # #rgb or #rrggbb or array of colors
                        speed: 1 # Rounds per second
                        trail: 60 # Afterglow percentage
                        shadow: false # Whether to render a shadow
                        hwaccel: false # Whether to use hardware acceleration
                        className: "spinner" # The CSS class to assign to the spinner
                        zIndex: 2e9 # The z-index (defaults to 2000000000)
                        top: "50%" # Top position relative to parent
                        left: "50%" # Left position relative to parent

                    spintargetD = document.getElementById("main-region")
                    spinnerD = new Spinner(spinopts).spin(spintargetD)
                    exportTableToCSV.apply this, [
                        jfeature
                        "tstationinfo.csv"
                        spinnerD
                    ]
                    return

                # $("#print").click ->
                    

                $(".feedback_trigger").click (event, ui) ->
                    # $("#accordion").accordion "disable"
                    $("#dialog-modal").dialog
                    $(@el).tooltip "option", title: ""
                    $("#dialog-modal").dialog "open"
                    $("#dialog-modal").html("")
                    $("#dialog-modal").dialog title: ""
                    $("#dialog-modal").html("<div class='container-fluid' style='padding: 0px; padding-left: 80px; padding-right: 40px;'>
                                                <div class='row'>
                                                    <div class='col-md-10 class='col-xs-4'>
                                                        <img src='assets/boxplotsimple09.png' class='img-responsive' alt='Box Plot'>
                                                    </div>
                                                </div>
                                                <div class='row'>
                                                    <div id='boxplot' class='col-md-4 class='col-xs-4'>
                                                        <p style='text-align: left; padding-top: 35px;'>
                                                        Box plot is a way of displaying the distribution of data based on the five number summary: minimum, first quartile, median, third quartile, and maximum. Box plots show distribution of an attribute for all the station areas. the central rectangle spans the first quartile to the third quartile (the interquartile range or IQR).
                                                        </p>
                                                    </div>
                                                    <div id='boxplot' class='col-md-4 class='col-xs-4'>
                                                        <p style='text-align: left; padding-top: 35px;'>
                                                         A segment inside the rectangle shows the median and 'whiskers' above and below the box show the locations of the minimum and maximum for all staton areas. The red + indicates the current station value for the field.
                                                        </p>
                                                    </div>
                                                </div>
                                            </div>")
                    $("#dialog-modal").dialog height: "auto" 
                    # $("#dialog-modal").dialog modal: false
                        

                $("#searchrefine").click (event, ui) ->
                    App.vent.trigger "searchrefineFired"
                
                $("#dialog-modal").dialog 
                    position:
                        my: "right"
                        at: "right"
                        of: window
                    autoOpen: false
                    closeOnEscape: true
                    height: 1150
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
                    spinopts =
                        lines: 13 # The number of lines to draw
                        length: 20 # The length of each line
                        width: 10 # The line thickness
                        radius: 30 # The radius of the inner circle
                        corners: 1 # Corner roundness (0..1)
                        rotate: 0 # The rotation offset
                        direction: 1 # 1: clockwise, -1: counterclockwise
                        color: "#000" # #rgb or #rrggbb or array of colors
                        speed: 1 # Rounds per second
                        trail: 60 # Afterglow percentage
                        shadow: false # Whether to render a shadow
                        hwaccel: false # Whether to use hardware acceleration
                        className: "spinner" # The CSS class to assign to the spinner
                        zIndex: 2e9 # The z-index (defaults to 2000000000)
                        top: "50%" # Top position relative to parent
                        left: "50%" # Left position relative to parent

                    spintarget = document.getElementById("main-region")
                    spinner = new Spinner(spinopts).spin(spintarget)
                    dict_dict = []
                    dict_dict.push event.view.document.dictionaryentries.models
                    try
                        # console.log "event.target.previousSibling.previousElementSibling", event.target.previousSibling.previousElementSibling.nextSibling.textContent
                        field_interp = gon.dict_lookup_dict[event.target.previousSibling.previousElementSibling.innerText.replace(":", "").replace("®", "").replace /^\s+|\s+$/g, ""]
                    catch e
                        try
                            field_interp = gon.dict_lookup_dict[event.target.parentNode.previousSibling.previousElementSibling.outerText.replace(":", "").replace("®", "").replace /^\s+|\s+$/g, ""]                        
                            try
                                field_interp = gon.dict_lookup_dict[event.target.previousSibling.previousElementSibling.textContent.replace(":", "").replace("®", "").replace /^\s+|\s+$/g, ""]
                            catch e
                                console.log event.target.previousSibling.previousElementSibling.nextSibling.textContent
                        catch e
                            console.log event.target.previousSibling.previousElementSibling.textContent
                            if gon.dict_lookup_dict[event.target.previousElementSibling.innerText is undefined
                                field_interp = gon.dict_lookup_dict[event.target.previousSibling.previousElementSibling.textContent.replace(":", "").replace("®", "").replace /^\s+|\s+$/g, ""]
                            else
                                field_interp = gon.dict_lookup_dict[event.target.previousElementSibling.innerText.replace(":", "").replace("®", "").replace /^\s+|\s+$/g, ""]
                    for each in dict_dict[0]
                        dict_entry = each if each.get("name").toLowerCase() == field_interp.toLowerCase()

                    # $("#accordion").accordion "disable"
                    $(@el).tooltip "option", title: ""
                    $("#dialog-modal").dialog "open"
                    $("#dialog-modal").html("")
                    $("#dialog-modal").dialog title: ""
                    spinner.stop()
                    $("#dialog-modal").html("<div class='row'>
                                                <div class='col-md-2'>
                                                   <strong>Description</strong> 
                                                </div>
                                                <div class='col-md-10' style='text-align: left;'>
                                                    <hm2><strong> #{dict_entry.get("interpretation").replace("пїЅ","'")}: </strong> <span><p>#{dict_entry.get("code")} <p></span>
                                                </div>
                                            </div>
                                            <br> 
                                            <div class='row'>
                                                <div class='col-md-2'>
                                                    <span><strong>Interpretation</strong></span>
                                                </div>
                                                <div class='col-md-10' style='text-align: left;'>
                                                    <p>#{dict_entry.get("importance").replace("ђ","'").replace("пїЅ","'") if dict_entry.get("importance") isnt null} </p>
                                                </div>
                                            </div>
                                            <br>
                                            <div class='row'>
                                                <div class='col-md-2'> 
                                                    <span><strong>Importance</strong></span>
                                                </div>
                                                <div class='col-md-10' style='text-align: left;'>
                                                    <p>#{dict_entry.get("description").replace("пїЅ","'")} </p>
                                                </div>
                                            </div>
                                            <br>
                                            <div class='row'>
                                                <div class='col-md-2'>
                                                    <span><strong>Note</strong>
                                                    </span></div><div class='col-md-10' style='font-style: italic; font-size:10;'>
                                                        <p>#{dict_entry.get("technical_notes").replace("пїЅ","'")}</p>
                                                </div>
                                            </div></hm2>")
                    $("#dialog-modal").dialog height: "auto" 
                    $("#dialog-modal").dialog modal: false

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
            names = _.map stationfeature, (key, value) ->
                    names = (_.pluck key, 'name')
                    names[2].toLowerCase()

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
            $("html, body").animate
              scrollTop: ($("#detailscol").offset().top)
            , 500
            $("#panel").html "<span class='glyphicon-class'></span> <a href='#advsearch/' id='searchrefine'><span class='glyphicon glyphicon-filter' rel='tooltipb' title='Refine the Search Results'>  </span></a>"
            $("[rel=tooltiprf]").click (event, ui) ->
                gon.query = "#{@.title}&" + gon.query
                App.vent.trigger "searchFired", gon.query
            $("#dllink").html "<span class='glyphicon-class'></span> <a href='#' id='download'><span class='glyphicon glyphicon-download' rel='tooltipb' title='Download Data for These Stations' >  </span></a>"
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
                $("[rel=tooltipb]").tooltip placement: "buttom"

            exportTableToCSV = (jfeature, filename) ->
              json = $.parseJSON(jfeature)
              csv = JSON2CSV(json)

              # Data URI
              csvData = "data:application/csv;charset=utf-8," + encodeURIComponent(csv)
              $(this).attr
                download: filename
                href: csvData
                target: "_blank"

              return

            # This must be a hyperlink
            $(".export").on "click", (event) ->
              
              # CSV
              exportTableToCSV.apply this, [
                $("#dvData>table")
                "export.csv"
              ]
              return


            # IF CSV, don't do event.preventDefault() or return false
            # We actually need this to be a typical hyperlink
            $("#download").click ->
                
                exportTableToCSV.apply this, [
                    jfeatures
                    "tstationinfo.csv"
                ]
                return
                spintargetDl.stop()

            $("#searchrefine").click (event, ui) ->
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
            maplist = undefined
            maplist = L.map("maplist",
              scrollWheelZoom: false
              touchZoom: false
              doubleClickZoom: true
              zoomControl: true
              dragging: true
              maxZoom: 18
            )
            L.tileLayer("http://tiles.mapc.org/basemap/{z}/{x}/{y}.png",
              attribution: "Map tiles by <a href=\"http://leafletjs.com\">MAPC</a>"
            ).addTo maplist
            if gon.paginate is true
              geoCollection = gon.features_sliced
            else
              geoCollection = gon.features
            fstations = new L.GeoJSON(geoCollection,
              pointToLayer: (feature, latlng) ->
                L.Icon.Default.imagePath = "/assets"
                L.marker(latlng).on "mouseover", (e) ->
                  popup = undefined
                  popup = undefined
                  popup = undefined
                  popup = L.popup().setLatLng(latlng).setContent("<p class='hm2'><a id='popup' href='#fss/q/by_name=" + feature.properties.name + "'>" + feature.properties.name + "</a></br><span>" + feature.properties.muni_name + "</span></br><span>" + feature.properties.line_descr + "</span></p>").openOn(maplist)

            )
            maplist.addLayer fstations
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
            # maplist.whenReady ->
            #     _dom_list = L.DomUtil.get("station-list")
            #     console.log "_dom_list", _dom_list
            #     L.DomEvent.addListener _dom_list, 'mouseover', (e) ->
            #         e.stopPropagation()
            #         console.log "mouse over e", e

	class List.DictView extends App.Views.Layout
        template: "fstations/list/templates/_dict"
        el: "#dictview"
        modelEvents:
          "change" : "render"

        onShow: ->
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
              dragging: false
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
            mapc = L.tileLayer("http://tiles.mapc.org/basemap/{z}/{x}/{y}.png",
              attribution: 'Map tiles by <a href="http://leafletjs.com">MAPC</a>'
            )
            streets = L.tileLayer.provider "MapBox.mapc.i8ddbf5a"
            esri = L.tileLayer.provider "Esri.WorldImagery"
            streets.addTo(map)
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
                # "MAPC Base Map": mapc
                "Esri Aerial": esri
                "MapBox StreetMap": streets
            geoCollection =  gon.feature
            fstation = new L.GeoJSON geoCollection,
                style: (feature) ->
                    feature.properties and feature.properties.style
                pointToLayer: (feature, latlng) ->
                    gon.latlong = latlng
                    L.circle latlng, 804.672,
                      fillColor: "#FFFFFF"
                      color: "#000"
                      weight: 1
                      opacity: 0.3
                      fillOpacity: 0.5
          
            map.addLayer(fstation)
            fstationI = new L.GeoJSON geoCollection,
                L.Icon.Default.imagePath = "/assets"
                L.marker(gon.latlong).on 'mouseover', (e) ->
                    popup = L.popup().setLatLng(latlong)
            
            map.addLayer fstationI
            fstationZoom = new L.GeoJSON geoCollection,
                style: (feature) ->
                    feature.properties and feature.properties.style
                pointToLayer: (feature, latlng) ->
                    L.circle latlng, 804.672,
                      fillColor: "#FFFFFF"
                      color: "#000"
                      weight: 2
                      opacity: 0.0
                      fillOpacity: 0
            L.control.scale().addTo(map)
            circle1 = new L.Icon.Canvas(iconSize: new L.Point(920, 920), scaleFactor: 1)
            circle2 = new L.Icon.Canvas(iconSize: new L.Point(460, 460), scaleFactor: 1)
            circle3 = new L.Icon.Canvas(iconSize: new L.Point(460, 460), scaleFactor: 1)
            circle4 = new L.Icon.Canvas(iconSize: new L.Point(460, 460), scaleFactor: 1)
            circle1.draw = (ctx, w, h) ->
              ctx.translate w / 2, h / 2
              ctx.beginPath()
              ctx.fillStyle = "#000"
              ctx.arc 0, 0, w / 2 - 1, 0, Math.PI * 2, true
              ctx.lineWidth = 2
              ctx.strokeStyle = "#000"
              ctx.stroke()
              ctx.closePath()
              return

            canvasCircles = new L.Marker(gon.latlong,
              icon: circle1
              draggable: false
              opacity: 0.8
            )

            map.addLayer canvasCircles
            overlays =
                "Regional Networks": regional
                "On-road Bicycle Facilities": onroad
                "Paths and Trails": paths
                "Sidewalk Inventory": sidewalks
                "Station Area": fstation
                "Half Mile Boundary": fstationZoom
            
            layersControl = new L.Control.Layers(baseMaps, overlays,
                collapsed: true
                )
            map.addControl layersControl

            bbox = fstationZoom.getBounds().toBBoxString()
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
            map.zoomIn()
            currentZoom = map.getZoom()
            gon.currentZoom = currentZoom

            onZoomend = ->
                zoom = map.getZoom()
                gon.currentZoom = zoom
                if zoom != 16
                    map.removeLayer canvasCircles
                else if zoom == 16
                    canvasCircles.addTo map

                if zoom >=16 
                    map.removeLayer fstation
                    fstationZoom.addTo map
                else
                    map.removeLayer fstationZoom
                    fstation.addTo map
                return
            map.on "zoomend", onZoomend
            L_PREFER_CANVAS = true
            L.DomEvent.addListener L.DomUtil.get("print"), 'click', (e) ->
                map.removeLayer fstationZoom
                map.removeLayer fstation
                map.removeLayer canvasCircles
                gon.d3ChartElement = $("#chart")[0]
                    # make a spinner object to put in while loading/waiting
                spinopts =
                    lines: 13 # The number of lines to draw
                    length: 20 # The length of each line
                    width: 10 # The line thickness
                    radius: 30 # The radius of the inner circle
                    corners: 1 # Corner roundness (0..1)
                    rotate: 0 # The rotation offset
                    direction: 1 # 1: clockwise, -1: counterclockwise
                    color: "#000" # #rgb or #rrggbb or array of colors
                    speed: 1 # Rounds per second
                    trail: 60 # Afterglow percentage
                    shadow: false # Whether to render a shadow
                    hwaccel: false # Whether to use hardware acceleration
                    className: "spinner" # The CSS class to assign to the spinner
                    zIndex: 2e9 # The z-index (defaults to 2000000000)
                    top: "50%" # Top position relative to parent
                    left: "50%" # Left position relative to parent

                spintarget = document.getElementById("main-region")
                spinner = new Spinner(spinopts).spin(spintarget)
                

                
                sparklineVmt = $(".inlinesparklinevmt")[0].firstChild
                sparklineGhg = $(".inlinesparklineghg")[0].firstChild
                sparklineVehphh = $(".inlinesparklinevehphh")[0].firstChild
                sparklineTrnpcmi = $(".inlinesparklinetrnpcmi")[0].firstChild
                sparklinePcttran = $(".inlinesparklinepcttran")[0].firstChild
                sparklineFar = $(".inlinesparklinefar")[0].firstChild
                sparklinePrkac = $(".inlinesparklineprkac")[0].firstChild
                sparklineIntntot = $(".inlinesparklineintntot")[0].firstChild
                sparklineMix = $(".inlinesparklinemix")[0].firstChild
                sparklineHupac = $(".inlinesparklinehupac")[0].firstChild
                sparklineEmpden = $(".inlinesparklineempden")[0].firstChild
                sparklineWalkscore = $(".inlinesparklinewalkscore")[0].firstChild
                sparklineHupipe = $(".inlinesparklinehupipe")[0].firstChild
                sparklineEmppipe = $(".inlinesparklineemppipe")[0].firstChild
                sparklineEmp10 = $(".inlinesparklineemp10")[0].firstChild
                sparklineExtaxrev = $(".inlinesparklineextaxrev")[0].firstChild
                sparklineEst10 = $(".inlinesparklineest10")[0].firstChild
                sparklineAval = $(".inlinesparklineaval")[0].firstChild
                sparklineHh10 = $(".inlinesparklinehh10")[0].firstChild
                sparklineHhinc = $(".inlinesparklinehhinc")[0].firstChild
                sparklineRentocc = $(".inlinesparklinerentocc")[0].firstChild
                sparklineHhnocar = $(".inlinesparklinehhnocar")[0].firstChild
                sparklineEdatt = $(".inlinesparklineedatt")[0].firstChild



                gon.sparklineVmt = sparklineVmt.toDataURL()
                gon.sparklineGhg = sparklineGhg.toDataURL()
                gon.sparklineVehphh = sparklineVehphh.toDataURL()
                gon.sparklineTrnpcmi = sparklineTrnpcmi.toDataURL()
                gon.sparklinePcttran = sparklinePcttran.toDataURL()
                gon.sparklineFar = sparklineFar.toDataURL()
                gon.sparklinePrkac = sparklinePrkac.toDataURL()
                gon.sparklineIntntot = sparklineIntntot.toDataURL()
                gon.sparklineMix = sparklineMix.toDataURL()
                gon.sparklineHupac = sparklineHupac.toDataURL()
                gon.sparklineEmpden = sparklineEmpden.toDataURL()
                gon.sparklineWalkscore = sparklineWalkscore.toDataURL()
                gon.sparklineHupipe = sparklineHupipe.toDataURL()
                gon.sparklineEmppipe = sparklineEmppipe.toDataURL()
                gon.sparklineEmp10 = sparklineEmp10.toDataURL()
                gon.sparklineExtaxrev = sparklineExtaxrev.toDataURL()
                gon.sparklineEst10 = sparklineEst10.toDataURL()
                gon.sparklineAval = sparklineAval.toDataURL()
                gon.sparklineHh10 = sparklineHh10.toDataURL()
                gon.sparklineHhinc = sparklineHhinc.toDataURL()
                gon.sparklineRentocc = sparklineRentocc.toDataURL()
                gon.sparklineHhnocar = sparklineHhnocar.toDataURL()
                gon.sparklineEdatt = sparklineEdatt.toDataURL()

                html2canvas document.getElementById("map"),
                    taintTest: false
                    useCORS: true
                    #proxy: 'assets/php/proxy.php'
                    onrendered: (canvas) ->
                        imagel = document.createElement("div")
                        imagel.setAttribute('id', 'mapImage')
                        imagel.setAttribute('style', 'display:none;')
                        # or it can get a img from leaflet-image plugin and return it as part of the function
                        imagel.appendChild canvas
                        document.body.appendChild imagel
                        ctx = canvas.getContext("2d")
                        gon.imageData = canvas.toDataURL()
                        ## making up the pdf using jspdf
                        mapcLogoData = 'data:image/png;base64,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'
                        northeasternLogoData = 'data:image/png;base64,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'
                        gon.markerElementData = 'data:image/png;base64,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'
                        mbta_logo = 'data:image/png;base64,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'
                        # defining zero_x_points and zero_y_points for each sections
                        doc = new jsPDF("p", "pt", "letter")
                        ## line height is about each 15 pts
                        ## the header seperation lines are 4 pts after the header
                        ## header themselves have the line height of 16
                        doc.setFont('helvetica')
                        doc.setFontType('bold')
                        doc.setLineWidth(2)

                        # doc.circle(gon.page_header_z_point_x+5, gon.page_header_z_point_y-6, 9, '')
                        doc.addImage mbta_logo, "PNG", gon.page_header_z_point_x+2, gon.page_header_z_point_y-14, 15, 15
                        doc.text("     station.info", gon.page_header_z_point_x, gon.page_header_z_point_y)
                        doc.setLineWidth(1)
                        doc.setDrawColor(0.00, 0.60, 0.80, 0.00)
                        doc.line(40, 50, 340, 50)
                        doc.setFontSize(10)
                        doc.setFontType('bold')
                        doc.setTextColor(255, 102, 51)
                        doc.text("Station Area Summary", gon.page_header_z_point_x, gon.page_header_z_point_y+14)
                        doc.setTextColor(0, 0, 0)
                        doc.setFontSize(10)
                        doc.setFontType('bold')
                        if "#{gon.feature[0].properties.name}".indexOf("STATION") isnt -1 or "#{gon.feature[0].properties.name}".indexOf("STOP") isnt -1
                            doc.text("#{(gon.feature[0].properties.name.split(' ').map (word) -> word[0].toUpperCase() + word[1..-1].toLowerCase()).join ' '}, #{gon.feature[0].properties.line_descr}", gon.basic_z_point_x, gon.basic_z_point_y - 15)
                        else if "#{gon.feature[0].properties.name}".indexOf("STATION") is -1 and "#{gon.feature[0].properties.name}".indexOf("STOP") isnt -1
                            doc.text("#{(gon.feature[0].properties.name.split(' ').map (word) -> word[0].toUpperCase() + word[1..-1].toLowerCase()).join ' '}, #{gon.feature[0].properties.line_descr}", gon.basic_z_point_x, gon.basic_z_point_y - 15)
                        else if "#{gon.feature[0].properties.name}".indexOf("@") isnt -1 and "#{gon.feature[0].properties.name}".indexOf("STOP") isnt -1 
                            doc.text("#{(gon.feature[0].properties.name.split(' ').map (word) -> word[0].toUpperCase() + word[1..-1].toLowerCase()).join ' '}, #{gon.feature[0].properties.line_descr}", gon.basic_z_point_x, gon.basic_z_point_y - 15)
                        else if "#{gon.feature[0].properties.line_descr}".indexOf("73,71") isnt -1 and "#{gon.feature[0].properties.name}".indexOf("STOP") is -1
                            doc.text("#{(gon.feature[0].properties.name.split(' ').map (word) -> word[0].toUpperCase() + word[1..-1].toLowerCase()).join ' '} Stop, #{gon.feature[0].properties.line_descr}", gon.basic_z_point_x, gon.basic_z_point_y - 15)
                        else if "#{gon.feature[0].properties.name}".indexOf("@") isnt -1 and "#{gon.feature[0].properties.name}".indexOf("STOP") is -1
                            doc.text("#{(gon.feature[0].properties.name.split(' ').map (word) -> word[0].toUpperCase() + word[1..-1].toLowerCase()).join ' '} Stop, #{gon.feature[0].properties.line_descr}", gon.basic_z_point_x, gon.basic_z_point_y - 15)
                        else if "#{gon.feature[0].properties.line_descr}".indexOf("SL") isnt -1 and "#{gon.feature[0].properties.name}".indexOf("STOP") is -1
                            doc.text("#{(gon.feature[0].properties.name.split(' ').map (word) -> word[0].toUpperCase() + word[1..-1].toLowerCase()).join ' '} Stop, #{gon.feature[0].properties.line_descr}", gon.basic_z_point_x, gon.basic_z_point_y - 15)
                        else
                            doc.text("#{(gon.feature[0].properties.name.split(' ').map (word) -> word[0].toUpperCase() + word[1..-1].toLowerCase()).join ' '} Station, #{gon.feature[0].properties.line_descr}", gon.basic_z_point_x, gon.basic_z_point_y - 15)
                        doc.setFontType('normal')
                        doc.setDrawColor(0.0314, 0.0135, 0.00, 0.125)
                        doc.setLineWidth(0.25)
                        # console.log "something: ",  (gon.feature[0].properties.name.split(' ').map (word) -> word[0].toUpperCase() + word[1..-1].toLowerCase()).join ' '
                        doc.setFontSize(gon.item_fontSize)
                        doc.setFontType(gon.section_header_fontSyle)
                        doc.setTextColor(0, 0, 0)
                        doc.text("Municipality: ", gon.basic_z_point_x, gon.basic_z_point_y+(gon.item_lead/2))
                        doc.setFontType(gon.item_fontStyle)
                        doc.text("                        #{gon.feature[0].properties.muni_name}", gon.basic_z_point_x, gon.basic_z_point_y+(gon.item_lead/2))
                        doc.setFontSize(gon.describton_fontSize)
                        doc.setTextColor(169, 167, 166)
                        doc.setFontType(gon.describton_fontStyle)

                        doc.setFontSize(gon.item_fontSize)
                        doc.setTextColor(0, 0, 0)
                        doc.setFontType(gon.section_header_fontSyle)
                        doc.text("Station Type: ", gon.basic_z_point_x , gon.basic_z_point_y+(2*gon.item_lead/2))
                        doc.setFontType(gon.item_fontStyle)
                        doc.text("                        #{gon.feature[0].properties.station_class}", gon.basic_z_point_x , gon.basic_z_point_y+(2*gon.item_lead/2))
                        
                        # go to a second columns and follow the y position as the two prev lines
                        doc.setFontType(gon.section_header_fontSyle)
                        doc.text("Community Type: ", gon.basic_z_point_x + gon.columns_width , gon.basic_z_point_y+(gon.item_lead/2))
                        doc.setFontType(gon.item_fontStyle)
                        doc.text("                                #{gon.feature[0].properties.community_type_description}", gon.basic_z_point_x + gon.columns_width , gon.basic_z_point_y+(gon.item_lead/2))
                        doc.setFontType(gon.section_header_fontSyle)
                        doc.text("Community Subtype: ", gon.basic_z_point_x + gon.columns_width, gon.basic_z_point_y+(2*gon.item_lead/2))
                        doc.setFontType(gon.item_fontStyle)
                        doc.text("#{gon.feature[0].properties.subcommunity_type_description}", gon.basic_z_point_x + gon.columns_width, gon.basic_z_point_y+(3*gon.item_lead/2))


                        doc.setFontSize(7)
                        doc.setTextColor(0, 0, 0)
                        doc.setFontType('bold')


                        # drawing the radar chart manually
                        # diagram charts
                        radar_ratio = 1 - ((gon.radar_width/2)**2)/gon.radar_height**2
                        amood = radar_ratio * gon.radar_height
                        yaal = Math.sqrt (gon.radar_width/2)**2 + (1-(radar_ratio*gon.radar_height))**2

                        doc.setDrawColor(0.0, 0.0, 0.00, 53)
                        doc.line(gon.radar_z_x+(gon.radar_width/2), gon.radar_z_y, gon.radar_z_x, gon.radar_z_y+gon.radar_height)
                        doc.setFontSize(gon.item_fontSize)
                        doc.setFontType('normal')
                        doc.setTextColor(0, 0, 0)
                        
                        doc.setLineWidth(0.5)
                        doc.line(gon.radar_z_x+(gon.radar_width/2), gon.radar_z_y, gon.radar_z_x+(gon.radar_width/2), gon.radar_z_y+(gon.radar_height*radar_ratio))
                        doc.line(gon.radar_z_x+gon.radar_width, gon.radar_z_y+gon.radar_height, gon.radar_z_x+(gon.radar_width/2), gon.radar_z_y+(gon.radar_height*radar_ratio))
                        doc.line(gon.radar_z_x, gon.radar_z_y+gon.radar_height, gon.radar_z_x+(gon.radar_width/2), gon.radar_z_y+(gon.radar_height*radar_ratio))
                        doc.line(gon.radar_z_x + (gon.radar_width/2), gon.radar_z_y, gon.radar_z_x+gon.radar_width, gon.radar_z_y+gon.radar_height)
                        doc.setLineWidth(0.25)
                        
                        doc.setDrawColor(169, 167, 166)
                        
                        doc.line(gon.radar_z_x + (gon.radar_width/2)-1,  (amood * ((20-gon.feature[0].properties.etod_sub2o)/20)) + gon.radar_z_y-1, gon.radar_z_x + (gon.radar_width/2)-20,  (amood * ((20-gon.feature[0].properties.etod_sub2o)/20)) + gon.radar_z_y-8)
                        doc.line(gon.radar_z_x + (((15-gon.feature[0].properties.etod_sub1t)/15)*(gon.radar_width/2))-1, gon.radar_z_y+(gon.radar_height - ((15-gon.feature[0].properties.etod_sub1t)/15)*(gon.radar_height - amood))-1, gon.radar_z_x + (((15-gon.feature[0].properties.etod_sub1t)/15)*(gon.radar_width/2)) - 20, gon.radar_z_y+(gon.radar_height - ((15-gon.feature[0].properties.etod_sub1t)/15)*(gon.radar_height - amood)) - 16)
                        doc.line(gon.radar_z_x + (gon.radar_width/2) + ((gon.feature[0].properties.etod_sub3d)/15)*(gon.radar_width/2)+1, gon.radar_z_y+(gon.radar_height - ((15-gon.feature[0].properties.etod_sub3d)/15)*(gon.radar_height - amood))-1, gon.radar_z_x + (gon.radar_width/2) + ((gon.feature[0].properties.etod_sub3d)/15)*(gon.radar_width/2)+20, gon.radar_z_y+(gon.radar_height - ((15-gon.feature[0].properties.etod_sub3d)/15)*(gon.radar_height - amood))-8)
                        
                        doc.setDrawColor(0.0, 0.0, 0.00, 53)
                        doc.setTextColor(169, 167, 166)
                        doc.setFontSize(gon.describton_fontSize)
                        doc.text("#{gon.feature[0].properties.etod_sub2o}", gon.radar_z_x + (gon.radar_width/2)-28,  (amood * ((20-gon.feature[0].properties.etod_sub2o)/20)) + gon.radar_z_y-8)
                        doc.text("#{gon.feature[0].properties.etod_sub1t}", gon.radar_z_x + (((15-gon.feature[0].properties.etod_sub1t)/15)*(gon.radar_width/2)) - 26, gon.radar_z_y+(gon.radar_height - ((15-gon.feature[0].properties.etod_sub1t)/15)*(gon.radar_height - amood)) - 16)
                        doc.text("#{gon.feature[0].properties.etod_sub3d}", gon.radar_z_x + (gon.radar_width/2) + ((gon.feature[0].properties.etod_sub3d)/15)*(gon.radar_width/2)+23, gon.radar_z_y+(gon.radar_height - ((15-gon.feature[0].properties.etod_sub3d)/15)*(gon.radar_height - amood))-8)
                        doc.setFontSize(gon.describton_fontSize)
                        doc.setFontType(gon.describton_fontStyle)
                        doc.setTextColor(169, 167, 166)
                        doc.text("Aggregate eTOD measure of demographic", gon.radar_z_x+(gon.radar_width/2)+23, gon.radar_z_y-3 + gon.describton_lead)
                        doc.text("orientation toward transit", gon.radar_z_x+(gon.radar_width/2)+23, gon.radar_z_y-3 + 2*(gon.describton_lead))
                        doc.text("Aggregate eTOD measure",  gon.radar_z_x-36, gon.radar_z_y+gon.radar_height+14+(1*gon.describton_lead))
                        doc.text("of transit quality",  gon.radar_z_x-36, gon.radar_z_y+gon.radar_height+14+(2*gon.describton_lead))
                        doc.text("Aggregate eTOD measure of development",  gon.radar_z_x+gon.radar_width+18, gon.radar_z_y+gon.radar_height+5+ gon.describton_lead)
                        doc.text("characteristics conducive to transit ridership",  gon.radar_z_x+gon.radar_width+18, gon.radar_z_y+gon.radar_height+5+ 2*(gon.describton_lead))

                        doc.setFontSize(gon.describton_fontSize)
                        doc.setTextColor(0, 0, 0)
                        doc.setFontType(gon.item_fontStyle)
                        doc.text("20", gon.radar_z_x+(gon.radar_width/2)+3, gon.radar_z_y-3)
                        doc.setFontSize(gon.item_fontSize)
                        doc.setTextColor(0, 0, 0)
                        doc.text("   Orientation", gon.radar_z_x+(gon.radar_width/2)+15, gon.radar_z_y-6)
                        doc.setFontSize(gon.describton_fontSize)
                        doc.text("15", gon.radar_z_x+gon.radar_width+3, gon.radar_z_y+gon.radar_height+3)
                        doc.setFontSize(gon.item_fontSize)
                        doc.setTextColor(0, 0, 0)
                        doc.text("   Development", gon.radar_z_x+gon.radar_width+10, gon.radar_z_y+gon.radar_height+3)
                        doc.line(gon.radar_z_x, gon.radar_z_y+gon.radar_height, gon.radar_z_x+gon.radar_width, gon.radar_z_y+gon.radar_height)
                        doc.setFontSize(gon.describton_fontSize)
                        doc.text("        15", gon.radar_z_x-27, gon.radar_z_y+gon.radar_height+3)
                        doc.setFontSize(gon.item_fontSize)
                        doc.setTextColor(0, 0, 0)
                        doc.text("Transit", gon.radar_z_x-37, gon.radar_z_y+gon.radar_height+12)
                        # drawing the trangle based on the station's etod values
                        doc.setFillColor(253, 3, 3)
                        doc.setDrawColor(253, 3, 3)
                        doc.setLineWidth(1)
                        doc.triangle(gon.radar_z_x + (gon.radar_width/2), (amood * ((20-gon.feature[0].properties.etod_sub2o)/20)) + gon.radar_z_y, gon.radar_z_x + (((15-gon.feature[0].properties.etod_sub1t)/15)*(gon.radar_width/2)), gon.radar_z_y+(gon.radar_height - ((15-gon.feature[0].properties.etod_sub1t)/15)*(gon.radar_height - amood)), gon.radar_z_x + (gon.radar_width/2) + ((gon.feature[0].properties.etod_sub3d)/15)*(gon.radar_width/2), gon.radar_z_y+(gon.radar_height - ((15-gon.feature[0].properties.etod_sub3d)/15)*(gon.radar_height - amood)), 'S')


                        doc.addImage gon.imageData, "PNG", 380, 55, 190, 190


                        doc.addImage mapcLogoData, "PNG", 40, 725, 55, 55
                        doc.addImage northeasternLogoData, "PNG", 184, 735, 30, 30

                        doc.line(40, 730, 574, 730)
                        doc.setFontType('bold')
                        doc.setFontSize(7)
                        doc.text("MAPC", 96, 743)
                        doc.setFontType('normal')
                        doc.setFontSize(6)
                        doc.setFont('helvetica')
                        doc.text("60 Temple Place", 96, 753)
                        doc.text("Boston, MA 02111", 96, 761)
                        doc.text("(617) 451-2770", 96, 769)
                        doc.setFontSize(7)
                        doc.setFont('helvetica')
                        doc.setFontType('bold')
                        
                        doc.text("Dukakis Center For Urban and Regional Policy", 220, 743)
                        doc.setFont('helvetica')

                        doc.setFontType('normal')
                        doc.setFontSize(6)
                        doc.text("Northeastern University", 220, 753)
                        doc.text("www.northeastern.edu/dukakiscenter", 220, 761)

                        doc.setFont('helvetica')

                        doc.setFontSize(gon.section_header_fontSize)
                        doc.setFontType(gon.section_header_fontSyle)
                        doc.setTextColor(255, 102, 51)
                        doc.text("Equitable Transit Oriented", gon.etod_z_point_x, gon.etod_z_point_y+gon.section_header_lead)
                        doc.text("Development (eTOD) Rating System", gon.etod_z_point_x, gon.etod_z_point_y+gon.section_header_lead+gon.item_lead/3)

                        doc.setFontSize(gon.item_fontSize)
                        doc.setFontType(gon.item_fontStyle)
                        doc.setTextColor(0, 0, 0)
                        doc.text("eTOD Group: #{gon.feature[0].properties.etod_type}", gon.etod_z_point_x, gon.etod_z_point_y+gon.section_header_lead+gon.item_lead/3+(1*gon.item_lead)-15)
                        doc.setFontSize(gon.describton_fontSize)
                        doc.setTextColor(169, 167, 166)
                        doc.setFontType(gon.describton_fontStyle)
                        doc.text("Expression of the suitability of the station area for high performing, equitable TOD", gon.etod_z_point_x, gon.etod_z_point_y+gon.section_header_lead+gon.item_lead/3+gon.item_lead+gon.describton_lead-15)
                        
                        doc.setDrawColor(169, 167, 166)
                        doc.setLineWidth(0.25)
                        doc.line(gon.sparkline_x_left, gon.transportation_z_point_y+gon.section_header_lead+gon.sparkline_lead-4, gon.sparkline_x_left, gon.transportation_z_point_y+gon.section_header_lead+gon.sparkline_lead-19)
                        doc.text("min", gon.sparkline_x_left-10, gon.transportation_z_point_y+gon.section_header_lead+gon.sparkline_lead-20)
                        doc.line(gon.sparkline_x_left+14, gon.transportation_z_point_y+gon.section_header_lead+gon.sparkline_lead-4, gon.sparkline_x_left+14, gon.transportation_z_point_y+gon.section_header_lead+gon.sparkline_lead-28)
                        doc.text("25th quantile", gon.sparkline_x_left-26, gon.transportation_z_point_y+gon.section_header_lead+gon.sparkline_lead-29)
                        doc.line(gon.sparkline_x_left+23, gon.transportation_z_point_y+gon.section_header_lead+gon.sparkline_lead-4, gon.sparkline_x_left+23, gon.transportation_z_point_y+gon.section_header_lead+gon.sparkline_lead-21)
                        doc.text("median", gon.sparkline_x_left+24, gon.transportation_z_point_y+gon.section_header_lead+gon.sparkline_lead-22)
                        doc.line(gon.sparkline_x_left+34, gon.transportation_z_point_y+gon.section_header_lead+gon.sparkline_lead-4, gon.sparkline_x_left+34, gon.transportation_z_point_y+gon.section_header_lead+gon.sparkline_lead-10)
                        doc.text("75th quantile", gon.sparkline_x_left+33, gon.transportation_z_point_y+gon.section_header_lead+gon.sparkline_lead-11)
                        doc.line(gon.sparkline_x_left+75, gon.transportation_z_point_y+gon.section_header_lead+gon.sparkline_lead-4, gon.sparkline_x_left+75, gon.transportation_z_point_y+gon.section_header_lead+gon.sparkline_lead-25)
                        doc.text("max", gon.sparkline_x_left+76, gon.transportation_z_point_y+gon.section_header_lead+gon.sparkline_lead-26)
                        doc.line(gon.sparkline_x_left+85, gon.transportation_z_point_y+gon.section_header_lead+gon.sparkline_lead/2, gon.sparkline_x_left+105, gon.transportation_z_point_y+gon.section_header_lead+gon.sparkline_lead/2)
                        doc.line(gon.sparkline_x_left+105, gon.transportation_z_point_y+gon.section_header_lead+gon.sparkline_lead/2, gon.sparkline_x_left+105, gon.etod_z_point_y+gon.section_header_lead+gon.item_lead/3+gon.item_lead+gon.describton_lead+135-gon.describton_lead)
                        doc.line(gon.sparkline_x_left+100, gon.etod_z_point_y+gon.section_header_lead+gon.item_lead/3+gon.item_lead+gon.describton_lead+135-gon.describton_lead, gon.sparkline_x_left+105, gon.etod_z_point_y+gon.section_header_lead+gon.item_lead/3+gon.item_lead+gon.describton_lead+135-gon.describton_lead)
                        doc.setFontSize(gon.describton_fontSize2)
                        doc.setTextColor(255, 102, 51)
                        doc.text("How To Read a Box Plot", gon.sparkline_x_left-10, gon.etod_z_point_y+gon.section_header_lead+gon.item_lead/3+gon.item_lead+gon.describton_lead+131-gon.describton_lead)
                        doc.setTextColor(169, 167, 166)
                        doc.text("The box plots show how this station area,", gon.sparkline_x_left-10, gon.etod_z_point_y+gon.section_header_lead+gon.item_lead/3+gon.item_lead+gon.describton_lead+131)
                        doc.text("indicated by the red cross (+) compares", gon.sparkline_x_left-10, gon.etod_z_point_y+gon.section_header_lead+gon.item_lead/3+gon.item_lead+gon.describton_lead+131+gon.describton_lead)
                        doc.text("to the 350 other transit station areas.", gon.sparkline_x_left-10, gon.etod_z_point_y+gon.section_header_lead+gon.item_lead/3+gon.item_lead+gon.describton_lead+131+(2*gon.describton_lead))
                        doc.setFontSize(gon.describton_fontSize)
                        doc.setFontSize(gon.section_header_fontSize)
                        doc.setFontType(gon.section_header_fontSyle)
                        doc.setTextColor(255, 102, 51)
                        doc.text("Transportation Performance", gon.transportation_z_point_x, gon.transportation_z_point_y)

                        doc.setFontSize(gon.item_fontSize)
                        doc.setTextColor(0, 0, 0)
                        doc.setFontType(gon.item_fontStyle)
                        doc.text("Vehicle Miles Traveled (VMT): #{gon.feature[0].properties.ov_vmthday.toFixed 2}", gon.transportation_z_point_x, gon.transportation_z_point_y+gon.section_header_lead)
                        doc.addImage gon.sparklineVmt, "PNG", gon.sparkline_x_left, gon.transportation_z_point_y+gon.section_header_lead+gon.sparkline_lead, 75, 9
                        doc.setFontSize(gon.describton_fontSize)
                        doc.setTextColor(169, 167, 166)
                        doc.setFontType(gon.describton_fontStyle)
                        doc.text("Vehicle Miles Traveled per Household", gon.transportation_z_point_x, gon.transportation_z_point_y+gon.section_header_lead+gon.describton_lead)
                        
                        doc.setFontSize(gon.item_fontSize)
                        doc.setTextColor(0, 0, 0)
                        doc.setFontType(gon.item_fontStyle)
                        doc.text("GHG Emissions-Transportation: #{gon.feature[0].properties.ov_ghg.toFixed 2}", gon.transportation_z_point_x, gon.transportation_z_point_y+gon.section_header_lead+gon.item_lead)
                        doc.addImage gon.sparklineGhg, "PNG", gon.sparkline_x_left, gon.transportation_z_point_y+gon.section_header_lead+gon.item_lead+gon.sparkline_lead, 75, 9
                        doc.setFontSize(gon.describton_fontSize)
                        doc.setTextColor(169, 167, 166)
                        doc.setFontType(gon.describton_fontStyle)
                        doc.text("Kilograms of CO2 equivalent, per household, passenger vehicles", gon.transportation_z_point_x, gon.transportation_z_point_y+gon.section_header_lead+gon.item_lead+gon.describton_lead)

                        doc.setFontSize(gon.item_fontSize)
                        doc.setTextColor(0, 0, 0)
                        doc.setFontType(gon.item_fontStyle)
                        doc.text("Vehicle Ownership: #{gon.feature[0].properties.ov_vehphh.toFixed 2}", gon.transportation_z_point_x, gon.transportation_z_point_y+gon.section_header_lead+(2*gon.item_lead))
                        doc.addImage gon.sparklineVehphh, "PNG", gon.sparkline_x_left, gon.transportation_z_point_y+gon.section_header_lead+(2*gon.item_lead)+gon.sparkline_lead, 93, 9
                        doc.setFontSize(gon.describton_fontSize)
                        doc.setTextColor(169, 167, 166)
                        doc.setFontType(gon.describton_fontStyle)
                        doc.text("Number of registered vehicles per household", gon.transportation_z_point_x, gon.transportation_z_point_y+gon.section_header_lead+(2*gon.item_lead)+gon.describton_lead)

                        doc.setFontSize(gon.item_fontSize)
                        doc.setTextColor(0, 0, 0)
                        doc.setFontType(gon.item_fontStyle)
                        doc.text("Transit Share of Commuting miles: #{(gon.feature[0].properties.ov_trnpcmi * 100).toFixed 1}%", gon.transportation_z_point_x, gon.transportation_z_point_y+gon.section_header_lead+(3*gon.item_lead))
                        doc.addImage gon.sparklineTrnpcmi, "PNG", gon.sparkline_x_left, gon.transportation_z_point_y+gon.section_header_lead+(3*gon.item_lead)+gon.sparkline_lead, 75, 9
                        doc.setFontSize(gon.describton_fontSize)
                        doc.setTextColor(169, 167, 166)
                        doc.setFontType(gon.describton_fontStyle)
                        doc.text("Percentage of total resident commuting miles for which transit was used", gon.transportation_z_point_x, gon.transportation_z_point_y+gon.section_header_lead+(3*gon.item_lead)+gon.describton_lead)

                        doc.setFontSize(gon.item_fontSize)
                        doc.setTextColor(0, 0, 0)
                        doc.setFontType(gon.item_fontStyle)
                        doc.text("Transit Commuter Share: #{(gon.feature[0].properties.ov_pcttran * 100).toFixed 1}%", gon.transportation_z_point_x, gon.transportation_z_point_y+gon.section_header_lead+(4*gon.item_lead))
                        doc.addImage gon.sparklinePcttran, "PNG", gon.sparkline_x_left, gon.transportation_z_point_y+gon.section_header_lead+(4*gon.item_lead)+gon.sparkline_lead, 215, 9
                        doc.setFontSize(gon.describton_fontSize)
                        doc.setTextColor(169, 167, 166)
                        doc.setFontType(gon.describton_fontStyle)
                        doc.text("Percent of resident commuters using transit", gon.transportation_z_point_x, gon.transportation_z_point_y+gon.section_header_lead+(4*gon.item_lead)+gon.describton_lead)

                        doc.setFontSize(gon.section_header_fontSize)
                        doc.setFontType(gon.section_header_fontSyle)
                        doc.setTextColor(255, 102, 51)
                        doc.text("Development Context", gon.development_z_point_x, gon.development_z_point_y)

                        doc.setFontSize(gon.item_fontSize)
                        doc.setTextColor(0, 0, 0)
                        doc.setFontType(gon.item_fontStyle)
                        doc.text("Floor Area Ratio (FAR): #{gon.feature[0].properties.ov_far.toFixed 2}", gon.development_z_point_x, gon.development_z_point_y+gon.section_header_lead)
                        doc.addImage gon.sparklineFar, "PNG", gon.sparkline_x_right, gon.development_z_point_y+gon.section_header_lead+gon.sparkline_lead, 86, 9
                        doc.setFontSize(gon.describton_fontSize)
                        doc.setTextColor(169, 167, 166)
                        doc.setFontType(gon.describton_fontStyle)
                        doc.text("Total gross floor area divided by total land area in fee parcels", gon.development_z_point_x, gon.development_z_point_y+gon.section_header_lead+gon.describton_lead)

                        doc.setFontSize(gon.item_fontSize)
                        doc.setTextColor(0, 0, 0)
                        doc.setFontType(gon.item_fontStyle)
                        doc.text("Surface Parking (acre): #{gon.feature[0].properties.ov_prkac.toFixed 1}", gon.development_z_point_x, gon.development_z_point_y+gon.section_header_lead+gon.item_lead)
                        doc.addImage gon.sparklinePrkac, "PNG", gon.sparkline_x_right, gon.development_z_point_y+gon.section_header_lead+gon.item_lead+gon.sparkline_lead, 75, 9
                        doc.setFontSize(gon.describton_fontSize)
                        doc.setTextColor(169, 167, 166)
                        doc.setFontType(gon.describton_fontStyle)
                        doc.text("Acres of surface parking within the station area", gon.development_z_point_x, gon.development_z_point_y+gon.section_header_lead+gon.item_lead+gon.describton_lead)

                        doc.setFontSize(gon.item_fontSize)
                        doc.setTextColor(0, 0, 0)
                        doc.setFontType(gon.item_fontStyle)
                        doc.text("Development Intensity: #{gon.feature[0].properties.ov_intntot.toFixed(0).replace(/(\d)(?=(\d{3})+$)/g, "$1,")}", gon.development_z_point_x, gon.development_z_point_y+gon.section_header_lead+(2*gon.item_lead))
                        doc.addImage gon.sparklineIntntot, "PNG", gon.sparkline_x_right, gon.development_z_point_y+gon.section_header_lead+(2*gon.item_lead)+gon.sparkline_lead, 75, 9
                        doc.setFontSize(gon.describton_fontSize)
                        doc.setTextColor(169, 167, 166)
                        doc.setFontType(gon.describton_fontStyle)
                        doc.text("Sum of population and employment in the station area (2010 & 2011)", gon.development_z_point_x, gon.development_z_point_y+gon.section_header_lead+(2*gon.item_lead)+gon.describton_lead)
                        

                        doc.setFontSize(gon.item_fontSize)
                        doc.setTextColor(0, 0, 0)
                        doc.setFontType(gon.item_fontStyle)
                        doc.text("Development Mix: #{gon.feature[0].properties.ov_mix.toFixed 2}", gon.development_z_point_x, gon.development_z_point_y+gon.section_header_lead+(3*gon.item_lead))
                        doc.addImage gon.sparklineMix, "PNG", gon.sparkline_x_right, gon.development_z_point_y+gon.section_header_lead+(3*gon.item_lead)+gon.sparkline_lead, 150, 9
                        doc.setFontSize(gon.describton_fontSize)
                        doc.setTextColor(169, 167, 166)
                        doc.setFontType(gon.describton_fontStyle)
                        doc.text("Employment share of total Development Intensity", gon.development_z_point_x, gon.development_z_point_y+gon.section_header_lead+(3*gon.item_lead)+gon.describton_lead)
                        

                        doc.setFontSize(gon.item_fontSize)
                        doc.setTextColor(0, 0, 0)
                        doc.setFontType(gon.item_fontStyle)
                        doc.text("Net Residential Density: #{gon.feature[0].properties.ov_hupac.toFixed 1}", gon.development_z_point_x, gon.development_z_point_y+gon.section_header_lead+(4*gon.item_lead))
                        doc.addImage gon.sparklineHupac, "PNG", gon.sparkline_x_right, gon.development_z_point_y+gon.section_header_lead+(4*gon.item_lead)+gon.sparkline_lead, 75, 9
                        doc.setFontSize(gon.describton_fontSize)
                        doc.setTextColor(169, 167, 166)
                        doc.setFontType(gon.describton_fontStyle)
                        doc.text("Housing units per acre of residential land use", gon.development_z_point_x, gon.development_z_point_y+gon.section_header_lead+(4*gon.item_lead)+gon.describton_lead)
                        

                        doc.setFontSize(gon.item_fontSize)
                        doc.setTextColor(0, 0, 0)
                        doc.setFontType(gon.item_fontStyle)
                        doc.text("Net Employment Density: #{gon.feature[0].properties.ov_empden.toFixed 1}", gon.development_z_point_x, gon.development_z_point_y+gon.section_header_lead+(5*gon.item_lead))
                        doc.addImage gon.sparklineEmpden, "PNG", gon.sparkline_x_right, gon.development_z_point_y+gon.section_header_lead+(5*gon.item_lead)+gon.sparkline_lead, 75, 9
                        doc.setFontSize(gon.describton_fontSize)
                        doc.setTextColor(169, 167, 166)
                        doc.setFontType(gon.describton_fontStyle)
                        doc.text("Estimated employment per acre of developed land use", gon.development_z_point_x, gon.development_z_point_y+gon.section_header_lead+(5*gon.item_lead)+gon.describton_lead)
                        

                        doc.setFontSize(gon.item_fontSize)
                        doc.setTextColor(0, 0, 0)
                        doc.setFontType(gon.item_fontStyle)
                        doc.text("Walk Score®: #{gon.feature[0].properties.walkscore.toFixed 1}", gon.development_z_point_x, gon.development_z_point_y+gon.section_header_lead+(6*gon.item_lead))
                        doc.addImage gon.sparklineWalkscore, "PNG", gon.sparkline_x_right, gon.development_z_point_y+gon.section_header_lead+(6*gon.item_lead)+gon.sparkline_lead, 75, 9
                        doc.setFontSize(gon.describton_fontSize)
                        doc.setTextColor(169, 167, 166)
                        doc.setFontType(gon.describton_fontStyle)
                        doc.text("Rating of walkability on a 100-point scale", gon.development_z_point_x, gon.development_z_point_y+gon.section_header_lead+(6*gon.item_lead)+gon.describton_lead)
                        

                        doc.setFontSize(gon.item_fontSize)
                        doc.setTextColor(0, 0, 0)
                        doc.setFontType(gon.item_fontStyle)
                        doc.text("Residential Pipeline: #{(gon.feature[0].properties.ov_hupipe.toFixed 0).replace(/(\d)(?=(\d{3})+$)/g, "$1,")}", gon.development_z_point_x, gon.development_z_point_y+gon.section_header_lead+(7*gon.item_lead))
                        doc.addImage gon.sparklineHupipe, "PNG", gon.sparkline_x_right, gon.development_z_point_y+gon.section_header_lead+(7*gon.item_lead)+gon.sparkline_lead, 75, 9
                        doc.setFontSize(gon.describton_fontSize)
                        doc.setTextColor(169, 167, 166)
                        doc.setFontType(gon.describton_fontStyle)
                        doc.text("Estimated housing units in projects under construction or planned", gon.development_z_point_x, gon.development_z_point_y+gon.section_header_lead+(7*gon.item_lead)+gon.describton_lead)
                        

                        doc.setFontSize(gon.item_fontSize)
                        doc.setTextColor(0, 0, 0)
                        doc.setFontType(gon.item_fontStyle)
                        doc.text("Commercial Pipeline: #{(gon.feature[0].properties.ov_emppipe.toFixed 0).replace(/(\d)(?=(\d{3})+$)/g, "$1,")}", gon.development_z_point_x, gon.development_z_point_y+gon.section_header_lead+(8*gon.item_lead))
                        doc.addImage gon.sparklineEmppipe, "PNG", gon.sparkline_x_right, gon.development_z_point_y+gon.section_header_lead+(8*gon.item_lead)+gon.sparkline_lead, 75, 9
                        doc.setFontSize(gon.describton_fontSize)
                        doc.setTextColor(169, 167, 166)
                        doc.setFontType(gon.describton_fontStyle)
                        doc.text("Anticipated employment in projects under construction or planned", gon.development_z_point_x, gon.development_z_point_y+gon.section_header_lead+(8*gon.item_lead)+gon.describton_lead)
                        

                        doc.setFontSize(gon.section_header_fontSize)
                        doc.setFontType(gon.section_header_fontSyle)
                        doc.setTextColor(255, 102, 51)
                        doc.text("Economics", gon.economics_z_point_x, gon.economics_z_point_y)

                        doc.setFontSize(gon.item_fontSize)
                        doc.setTextColor(0, 0, 0)
                        doc.setFontType(gon.item_fontStyle)
                        doc.text("Employment: #{gon.feature[0].properties.ov_emp10.toFixed(0).replace(/(\d)(?=(\d{3})+$)/g, "$1,")}", gon.economics_z_point_x, gon.economics_z_point_y+gon.section_header_lead)
                        doc.addImage gon.sparklineEmp10, "PNG", gon.sparkline_x_right, gon.economics_z_point_y+gon.section_header_lead+gon.sparkline_lead, 75, 9
                        doc.setFontSize(gon.describton_fontSize)
                        doc.setTextColor(169, 167, 166)
                        doc.setFontType(gon.describton_fontStyle)
                        doc.text("Total employment in the station area, 2011", gon.economics_z_point_x, gon.economics_z_point_y+gon.section_header_lead+(0*gon.item_lead)+gon.describton_lead)
                        

                        doc.setFontSize(gon.item_fontSize)
                        doc.setTextColor(0, 0, 0)
                        doc.setFontType(gon.item_fontStyle)
                        doc.text("Tax Revenue: $#{gon.feature[0].properties.ex_taxrev.toFixed(0).replace(/(\d)(?=(\d{3})+$)/g, "$1,")}", gon.economics_z_point_x, gon.economics_z_point_y+gon.section_header_lead+gon.item_lead)
                        doc.addImage gon.sparklineExtaxrev, "PNG", gon.sparkline_x_right, gon.economics_z_point_y+gon.section_header_lead+gon.item_lead+gon.sparkline_lead, 75, 9
                        doc.setFontSize(gon.describton_fontSize)
                        doc.setTextColor(169, 167, 166)
                        doc.setFontType(gon.describton_fontStyle)
                        doc.text("Estimated municipal property tax revenue from parcels in the station area", gon.economics_z_point_x, gon.economics_z_point_y+gon.section_header_lead+(1*gon.item_lead)+gon.describton_lead)
                        

                        doc.setFontSize(gon.item_fontSize)
                        doc.setTextColor(0, 0, 0)
                        doc.setFontType(gon.item_fontStyle)
                        doc.text("Number of Establishments: #{gon.feature[0].properties.ov_est_10.toFixed(0).replace(/(\d)(?=(\d{3})+$)/g, "$1,")}", gon.economics_z_point_x, gon.economics_z_point_y+gon.section_header_lead+(2*gon.item_lead))
                        doc.addImage gon.sparklineEst10, "PNG", gon.sparkline_x_right, gon.economics_z_point_y+gon.section_header_lead+(2*gon.item_lead)+gon.sparkline_lead, 75, 9
                        doc.setFontSize(gon.describton_fontSize)
                        doc.setTextColor(169, 167, 166)
                        doc.setFontType(gon.describton_fontStyle)
                        doc.text("Number of businesses, public agencies, non–profits, and other employers", gon.economics_z_point_x, gon.economics_z_point_y+gon.section_header_lead+(2*gon.item_lead)+gon.describton_lead)
                        

                        doc.setFontSize(gon.item_fontSize)
                        doc.setTextColor(0, 0, 0)
                        doc.setFontType(gon.item_fontStyle)
                        doc.text("Assessed Value: $#{gon.feature[0].properties.ov_aval.toFixed(0).replace(/(\d)(?=(\d{3})+$)/g, "$1,")}", gon.economics_z_point_x, gon.economics_z_point_y+gon.section_header_lead+(3*gon.item_lead))
                        doc.addImage gon.sparklineAval, "PNG", gon.sparkline_x_right, gon.economics_z_point_y+gon.section_header_lead+(3*gon.item_lead)+gon.sparkline_lead, 75, 9
                        doc.setFontSize(gon.describton_fontSize)
                        doc.setTextColor(169, 167, 166)
                        doc.setFontType(gon.describton_fontStyle)
                        doc.text("Total assessed value of land and improvements in station area", gon.economics_z_point_x, gon.economics_z_point_y+gon.section_header_lead+(3*gon.item_lead)+gon.describton_lead)
                        

                        doc.setFontSize(gon.section_header_fontSize)
                        doc.setFontType(gon.section_header_fontSyle)
                        doc.setTextColor(255, 102, 51)
                        doc.text("Demographics", gon.demographics_z_point_x, gon.demographics_z_point_y)

                        doc.setFontSize(gon.item_fontSize)
                        doc.setTextColor(0, 0, 0)
                        doc.setFontType(gon.item_fontStyle)
                        doc.text("Number of Households: #{gon.feature[0].properties.ov_hh10.toFixed(0).replace(/(\d)(?=(\d{3})+$)/g, "$1,")}", gon.demographics_z_point_x, gon.demographics_z_point_y+gon.section_header_lead)
                        doc.addImage gon.sparklineHh10, "PNG", gon.sparkline_x_left, gon.demographics_z_point_y+gon.section_header_lead+gon.sparkline_lead, 75, 9
                        doc.setFontSize(gon.describton_fontSize)
                        doc.setTextColor(169, 167, 166)
                        doc.setFontType(gon.describton_fontStyle)
                        doc.text("Number of households in 2010", gon.demographics_z_point_x, gon.demographics_z_point_y+gon.section_header_lead+(0*gon.item_lead)+gon.describton_lead)
                        
                        doc.setFontSize(gon.item_fontSize)
                        doc.setTextColor(0, 0, 0)
                        doc.setFontType(gon.item_fontStyle)
                        doc.text("Household Median Income: $#{gon.feature[0].properties.ov_hhinc.toFixed(0).replace(/(\d)(?=(\d{3})+$)/g, "$1,")}", gon.demographics_z_point_x, gon.demographics_z_point_y+gon.section_header_lead+gon.item_lead)
                        doc.addImage gon.sparklineHhinc, "PNG", gon.sparkline_x_left, gon.demographics_z_point_y+gon.section_header_lead+gon.item_lead+gon.sparkline_lead, 75, 9
                        doc.setFontSize(gon.describton_fontSize)
                        doc.setTextColor(169, 167, 166)
                        doc.setFontType(gon.describton_fontStyle)
                        doc.text("Estimated median annual household income, 2008 - 2012", gon.demographics_z_point_x, gon.demographics_z_point_y+gon.section_header_lead+(1*gon.item_lead)+gon.describton_lead)

                        doc.setFontSize(gon.item_fontSize)
                        doc.setTextColor(0, 0, 0)
                        doc.setFontType(gon.item_fontStyle)
                        doc.text("Renter Households: #{(gon.feature[0].properties.ov_rentocc * 100).toFixed 0 }%", gon.demographics_z_point_x, gon.demographics_z_point_y+gon.section_header_lead+(2*gon.item_lead))
                        doc.addImage gon.sparklineRentocc, "PNG", gon.sparkline_x_left, gon.demographics_z_point_y+gon.section_header_lead+(2*gon.item_lead)+gon.sparkline_lead, 150, 9
                        doc.setFontSize(gon.describton_fontSize)
                        doc.setTextColor(169, 167, 166)
                        doc.setFontType(gon.describton_fontStyle)
                        doc.text("Renter households as a share of total occupied housing units", gon.demographics_z_point_x, gon.demographics_z_point_y+gon.section_header_lead+(2*gon.item_lead)+gon.describton_lead)

                        doc.setFontSize(gon.item_fontSize)
                        doc.setTextColor(0, 0, 0)
                        doc.setFontType(gon.item_fontStyle)
                        doc.text("Zero-Car Households: #{(gon.feature[0].properties.ov_hhnocar * 100).toFixed 0 }%", gon.demographics_z_point_x, gon.demographics_z_point_y+gon.section_header_lead+(3*gon.item_lead))
                        doc.addImage gon.sparklineHhnocar, "PNG", gon.sparkline_x_left, gon.demographics_z_point_y+gon.section_header_lead+(3*gon.item_lead)+gon.sparkline_lead, 75, 9
                        doc.setFontSize(gon.describton_fontSize)
                        doc.setTextColor(169, 167, 166)
                        doc.setFontType(gon.describton_fontStyle)
                        doc.text("Percentage of households in station area reporting zero vehicles available", gon.demographics_z_point_x, gon.demographics_z_point_y+gon.section_header_lead+(3*gon.item_lead)+gon.describton_lead)

                        doc.setFontSize(gon.item_fontSize)
                        doc.setTextColor(0, 0, 0)
                        doc.setFontType(gon.item_fontStyle)
                        doc.text("Adult College Graduates: #{(gon.feature[0].properties.ov_ed_att * 100).toFixed 0}%", gon.demographics_z_point_x, gon.demographics_z_point_y+gon.section_header_lead+(4*gon.item_lead))
                        doc.addImage gon.sparklineEdatt, "PNG", gon.sparkline_x_left, gon.demographics_z_point_y+gon.section_header_lead+(4*gon.item_lead)+gon.sparkline_lead, 175, 9
                        doc.setFontSize(gon.describton_fontSize)
                        doc.setTextColor(169, 167, 166)
                        doc.setFontType(gon.describton_fontStyle)
                        doc.text("Share of adult population with a four-year college degree or higher", gon.demographics_z_point_x, gon.demographics_z_point_y+gon.section_header_lead+(4*gon.item_lead)+gon.describton_lead)

                        doc.setFontSize(gon.describton_fontSize2)
                        doc.setFontType('italic')
                        doc.text("Sources: U.S. Census, American Community Survey", 405, 743)
                        doc.text("MassGIS, Infogroup, MAPC, Dukakis Center, walkscore.com", 405, 751)
                        doc.text("Created on #{gon.today}", 405, 759)
                        doc.text("tstation.info/#fss/q/by_name=#{gon.feature[0].properties.name}", 405, 768)
                        doc.setFontSize(gon.describton_fontSize)
                        zoomScale = 15 - gon.currentZoom
                        if zoomScale < 0
                            doc.addImage gon.markerElementData, "PNG", 380+(190 / 4 * (zoomScale+1)), 55+(190 / 4 * (zoomScale+1) ), 190 / ( 1 * (zoomScale+2) ) , 190 / ( 1 * (zoomScale+2))
                            doc.save "tstationinfo.pdf"
                            spinner.stop()
                        else if zoomScale < 2
                            doc.addImage gon.markerElementData, "PNG", 380+(190 / 4 * (zoomScale+1))-(190 / (2**(zoomScale+2)) * (zoomScale)), 55+(190 / 4 * (zoomScale+1) ) - (190 / (2**(zoomScale+2)) * (zoomScale) ), 190 / ( 2 * (zoomScale+1) ) , 190 / ( 2 * (zoomScale+1))
                            doc.save "tstationinfo.pdf"
                            spinner.stop()
                        else if zoomScale < 3
                            doc.addImage gon.markerElementData, "PNG", 380+(190 / ((zoomScale)))-(190 / (2**(zoomScale+2)) ), 55+(190 / ((zoomScale) )) - (190 / (2**(zoomScale+2)) ), 190 / ( 2 * (zoomScale+1) ) , 190 / ( 2 * (zoomScale+1))
                            doc.save "tstationinfo.pdf"
                            spinner.stop()
                        else
                            doc.save "tstationinfo.pdf"
                            spinner.stop()
                        return 

                # map.removeLayer esri
                # map.addLayer streets
                e.stopPropagation()




