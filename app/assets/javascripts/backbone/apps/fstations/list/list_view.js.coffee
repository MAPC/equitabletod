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
                gon.describton_fontStyle = 'italic'
                gon.sparkline_lead = -9
                gon.sparkline_x_left = 220
                gon.sparkline_x_right = 495
                # # section zero points

                gon.page_header_z_point_x = 463
                gon.page_header_z_point_y = 30

                gon.basic_z_point_x = 40
                gon.basic_z_point_y = 55

                gon.etod_z_point_x = 40
                gon.etod_z_point_y = 130

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
                ftrnpcmi = (gon.feature["0"].properties.ov_trnpcmi.toFixed 4) if gon.feature["0"].properties.ov_trnpcmi
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
                console.log gon
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

                $("#print").click ->
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
                        proxy: 'assets/php/proxy.php'
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
                            # defining zero_x_points and zero_y_points for each sections
                            doc = new jsPDF("p", "pt", "letter")
                            ## line height is about each 15 pts
                            ## the header seperation lines are 4 pts after the header
                            ## header themselves have the line height of 16
                            doc.setFont('helvetica')
                            doc.setFontType('bold')
                            doc.setLineWidth(2)
                            doc.circle(gon.page_header_z_point_x+5, gon.page_header_z_point_y-6, 9, '')
                            doc.text("T  station.info", gon.page_header_z_point_x, gon.page_header_z_point_y)
                            doc.setLineWidth(1)
                            doc.setDrawColor(0.00, 0.60, 0.80, 0.00)
                            doc.line(40, 50, 340, 50)
                            doc.setFontSize(10)
                            doc.setFontType('normal')
                            doc.setTextColor(255, 102, 51)
                            doc.text("Station Area Summary", gon.page_header_z_point_x+4, gon.page_header_z_point_y+14)
                            doc.setTextColor(0, 0, 0)
                            doc.setFontSize(10)
                            doc.setFontType('bold')
                            if "#{gon.feature[0].properties.name}".indexOf("STATION") isnt -1 or "#{gon.feature[0].properties.name}".indexOf("STOP") isnt -1
                                doc.text("#{gon.feature[0].properties.name}, #{gon.feature[0].properties.line_descr}", gon.basic_z_point_x, gon.basic_z_point_y - 15)
                            else if "#{gon.feature[0].properties.name}".indexOf("STATION") is -1 and "#{gon.feature[0].properties.name}".indexOf("STOP") isnt -1
                                doc.text("#{gon.feature[0].properties.name}, #{gon.feature[0].properties.line_descr}", gon.basic_z_point_x, gon.basic_z_point_y - 15)
                            else if "#{gon.feature[0].properties.name}".indexOf("@") isnt -1 and "#{gon.feature[0].properties.name}".indexOf("STOP") isnt -1 
                                doc.text("#{gon.feature[0].properties.name}, #{gon.feature[0].properties.line_descr}", gon.basic_z_point_x, gon.basic_z_point_y - 15)
                            else if "#{gon.feature[0].properties.line_descr}".indexOf("73,71") isnt -1 and "#{gon.feature[0].properties.name}".indexOf("STOP") is -1
                                doc.text("#{gon.feature[0].properties.name} STOP, #{gon.feature[0].properties.line_descr}", gon.basic_z_point_x, gon.basic_z_point_y - 15)
                            else if "#{gon.feature[0].properties.name}".indexOf("@") isnt -1 and "#{gon.feature[0].properties.name}".indexOf("STOP") is -1
                                doc.text("#{gon.feature[0].properties.name} STOP, #{gon.feature[0].properties.line_descr}", gon.basic_z_point_x, gon.basic_z_point_y - 15)
                            else if "#{gon.feature[0].properties.line_descr}".indexOf("SL") isnt -1 and "#{gon.feature[0].properties.name}".indexOf("STOP") is -1
                                doc.text("#{gon.feature[0].properties.name} STOP, #{gon.feature[0].properties.line_descr}", gon.basic_z_point_x, gon.basic_z_point_y - 15)
                            else
                                doc.text("#{gon.feature[0].properties.name} STATION, #{gon.feature[0].properties.line_descr}", gon.basic_z_point_x, gon.basic_z_point_y - 15)

                            doc.setFontType('normal')
                            doc.setDrawColor(0.0314, 0.0135, 0.00, 0.125)
                            doc.setLineWidth(0.25)

                            doc.setFontSize(gon.item_fontSize)
                            doc.setTextColor(0, 0, 0)
                            doc.text("Municipality: #{gon.feature[0].properties.muni_name}", gon.basic_z_point_x, gon.basic_z_point_y+(gon.item_lead/2))
                            doc.setFontSize(gon.describton_fontSize)
                            doc.setTextColor(169, 167, 166)
                            doc.setFontType(gon.describton_fontStyle)

                            doc.setFontSize(gon.item_fontSize)
                            doc.setTextColor(0, 0, 0)
                            doc.setFontType(gon.item_fontStyle)
                            doc.text("Station Type: #{gon.feature[0].properties.station_class}", gon.basic_z_point_x, gon.basic_z_point_y+(2*gon.item_lead/2))
                            doc.text("Community Type: #{gon.feature[0].properties.community_type_description}", gon.basic_z_point_x, gon.basic_z_point_y+(3*gon.item_lead/2))
                            doc.text("Community Subtype: #{gon.feature[0].properties.subcommunity_type_description}", gon.basic_z_point_x, gon.basic_z_point_y+(4*gon.item_lead/2))


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
                            doc.text("Aggregate eTOD measure",  gon.radar_z_x-36, gon.radar_z_y+gon.radar_height+12+(1*gon.describton_lead))
                            doc.text("of transit quality",  gon.radar_z_x-36, gon.radar_z_y+gon.radar_height+12+(2*gon.describton_lead))
                            doc.text("Aggregate eTOD measure of development",  gon.radar_z_x+gon.radar_width+18, gon.radar_z_y+gon.radar_height+7+ gon.describton_lead)
                            doc.text("characteristics conducive to transit ridership",  gon.radar_z_x+gon.radar_width+18, gon.radar_z_y+gon.radar_height+7+ 2*(gon.describton_lead))

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
                            doc.text("   Development", gon.radar_z_x+gon.radar_width+10, gon.radar_z_y+gon.radar_height+5)
                            doc.line(gon.radar_z_x, gon.radar_z_y+gon.radar_height, gon.radar_z_x+gon.radar_width, gon.radar_z_y+gon.radar_height)
                            doc.setFontSize(gon.describton_fontSize)
                            doc.text("        15", gon.radar_z_x-27, gon.radar_z_y+gon.radar_height+3)
                            doc.setFontSize(gon.item_fontSize)
                            doc.setTextColor(0, 0, 0)
                            doc.text("Transit", gon.radar_z_x-37, gon.radar_z_y+gon.radar_height+10)
                            # drawing the trangle based on the station's etod values
                            doc.setFillColor(253, 3, 3)
                            doc.setDrawColor(253, 3, 3)
                            doc.setLineWidth(1)
                            doc.triangle(gon.radar_z_x + (gon.radar_width/2), (amood * ((20-gon.feature[0].properties.etod_sub2o)/20)) + gon.radar_z_y, gon.radar_z_x + (((15-gon.feature[0].properties.etod_sub1t)/15)*(gon.radar_width/2)), gon.radar_z_y+(gon.radar_height - ((15-gon.feature[0].properties.etod_sub1t)/15)*(gon.radar_height - amood)), gon.radar_z_x + (gon.radar_width/2) + ((gon.feature[0].properties.etod_sub3d)/15)*(gon.radar_width/2), gon.radar_z_y+(gon.radar_height - ((15-gon.feature[0].properties.etod_sub3d)/15)*(gon.radar_height - amood)), 'S')


                            doc.addImage gon.imageData, "PNG", 380, 55, 190, 185


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
                            doc.text("Equitable Transit Oriented Development (eTOD)", gon.etod_z_point_x, gon.etod_z_point_y+gon.section_header_lead)

                            doc.setFontSize(gon.item_fontSize)
                            doc.setFontType(gon.item_fontStyle)
                            doc.setTextColor(0, 0, 0)
                            doc.text("eTOD Group: #{gon.feature[0].properties.etod_type}", gon.etod_z_point_x, gon.etod_z_point_y+gon.section_header_lead+(1*gon.item_lead)-10)
                            doc.setFontSize(gon.describton_fontSize)
                            doc.setTextColor(169, 167, 166)
                            doc.setFontType(gon.describton_fontStyle)
                            doc.text("Expression of the suitability of the station area for high performing, equitable TOD", gon.etod_z_point_x, gon.etod_z_point_y+gon.section_header_lead+gon.item_lead+gon.describton_lead-10)
                            
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
                            doc.text("Daily vehicle miles traveled (VMT) for households in station areas", gon.transportation_z_point_x, gon.transportation_z_point_y+gon.section_header_lead+gon.describton_lead)
                            
                            doc.setFontSize(gon.item_fontSize)
                            doc.setTextColor(0, 0, 0)
                            doc.setFontType(gon.item_fontStyle)
                            doc.text("GHG Emissions-Transportation: #{gon.feature[0].properties.ov_ghg.toFixed 2}", gon.transportation_z_point_x, gon.transportation_z_point_y+gon.section_header_lead+gon.item_lead)
                            doc.addImage gon.sparklineGhg, "PNG", gon.sparkline_x_left, gon.transportation_z_point_y+gon.section_header_lead+gon.item_lead+gon.sparkline_lead, 75, 9
                            doc.setFontSize(gon.describton_fontSize)
                            doc.setTextColor(169, 167, 166)
                            doc.setFontType(gon.describton_fontStyle)
                            doc.text("Estimated total greenhouse gases (kilograms CO2 equivalent)", gon.transportation_z_point_x, gon.transportation_z_point_y+gon.section_header_lead+gon.item_lead+gon.describton_lead)

                            doc.setFontSize(gon.item_fontSize)
                            doc.setTextColor(0, 0, 0)
                            doc.setFontType(gon.item_fontStyle)
                            doc.text("Vehicle Ownership: #{gon.feature[0].properties.ov_vehphh.toFixed 2}", gon.transportation_z_point_x, gon.transportation_z_point_y+gon.section_header_lead+(2*gon.item_lead))
                            doc.addImage gon.sparklineVehphh, "PNG", gon.sparkline_x_left, gon.transportation_z_point_y+gon.section_header_lead+(2*gon.item_lead)+gon.sparkline_lead, 93, 9
                            doc.setFontSize(gon.describton_fontSize)
                            doc.setTextColor(169, 167, 166)
                            doc.setFontType(gon.describton_fontStyle)
                            doc.text("Number of vehicles per household", gon.transportation_z_point_x, gon.transportation_z_point_y+gon.section_header_lead+(2*gon.item_lead)+gon.describton_lead)

                            doc.setFontSize(gon.item_fontSize)
                            doc.setTextColor(0, 0, 0)
                            doc.setFontType(gon.item_fontStyle)
                            doc.text("Transit Share of Commuting miles: #{(gon.feature[0].properties.ov_trnpcmi * 100).toFixed 2}%", gon.transportation_z_point_x, gon.transportation_z_point_y+gon.section_header_lead+(3*gon.item_lead))
                            doc.addImage gon.sparklineTrnpcmi, "PNG", gon.sparkline_x_left, gon.transportation_z_point_y+gon.section_header_lead+(3*gon.item_lead)+gon.sparkline_lead, 75, 9
                            doc.setFontSize(gon.describton_fontSize)
                            doc.setTextColor(169, 167, 166)
                            doc.setFontType(gon.describton_fontStyle)
                            doc.text("Percentage of total commuting miles for which transit was used", gon.transportation_z_point_x, gon.transportation_z_point_y+gon.section_header_lead+(3*gon.item_lead)+gon.describton_lead)

                            doc.setFontSize(gon.item_fontSize)
                            doc.setTextColor(0, 0, 0)
                            doc.setFontType(gon.item_fontStyle)
                            doc.text("Transit Commuter Share: #{(gon.feature[0].properties.ov_pcttran * 100).toFixed 2}%", gon.transportation_z_point_x, gon.transportation_z_point_y+gon.section_header_lead+(4*gon.item_lead))
                            doc.addImage gon.sparklinePcttran, "PNG", gon.sparkline_x_left, gon.transportation_z_point_y+gon.section_header_lead+(4*gon.item_lead)+gon.sparkline_lead, 215, 9
                            doc.setFontSize(gon.describton_fontSize)
                            doc.setTextColor(169, 167, 166)
                            doc.setFontType(gon.describton_fontStyle)
                            doc.text("Percent of commuters using transit", gon.transportation_z_point_x, gon.transportation_z_point_y+gon.section_header_lead+(4*gon.item_lead)+gon.describton_lead)

                            doc.setFontSize(gon.section_header_fontSize)
                            doc.setFontType(gon.section_header_fontSyle)
                            doc.setTextColor(255, 102, 51)
                            doc.text("Development Context", gon.development_z_point_x, gon.development_z_point_y)

                            doc.setFontSize(gon.item_fontSize)
                            doc.setTextColor(0, 0, 0)
                            doc.setFontType(gon.item_fontStyle)
                            doc.text("Floor Area Ratio (FAR): #{gon.feature[0].properties.ov_far.toFixed 2}", gon.development_z_point_x, gon.development_z_point_y+gon.section_header_lead)
                            doc.addImage gon.sparklinePcttran, "PNG", gon.sparkline_x_right, gon.development_z_point_y+gon.section_header_lead+gon.sparkline_lead, 215, 9
                            doc.setFontSize(gon.describton_fontSize)
                            doc.setTextColor(169, 167, 166)
                            doc.setFontType(gon.describton_fontStyle)
                            doc.text("Total gross floor area divided by total parcel size", gon.development_z_point_x, gon.development_z_point_y+gon.section_header_lead+gon.describton_lead)

                            doc.setFontSize(gon.item_fontSize)
                            doc.setTextColor(0, 0, 0)
                            doc.setFontType(gon.item_fontStyle)
                            doc.text("Surface Parking (acre): #{gon.feature[0].properties.ov_prkac.toFixed 2}", gon.development_z_point_x, gon.development_z_point_y+gon.section_header_lead+gon.item_lead)
                            doc.addImage gon.sparklinePrkac, "PNG", gon.sparkline_x_right, gon.development_z_point_y+gon.section_header_lead+gon.item_lead+gon.sparkline_lead, 75, 9
                            doc.setFontSize(gon.describton_fontSize)
                            doc.setTextColor(169, 167, 166)
                            doc.setFontType(gon.describton_fontStyle)
                            doc.text("Acres of surface parking within the station area", gon.development_z_point_x, gon.development_z_point_y+gon.section_header_lead+gon.item_lead+gon.describton_lead)

                            doc.setFontSize(gon.item_fontSize)
                            doc.setTextColor(0, 0, 0)
                            doc.setFontType(gon.item_fontStyle)
                            doc.text("Current Development Intensity: #{gon.feature[0].properties.ov_intntot.toFixed(0).replace(/(\d)(?=(\d{3})+$)/g, "$1,")}", gon.development_z_point_x, gon.development_z_point_y+gon.section_header_lead+(2*gon.item_lead))
                            doc.addImage gon.sparklineIntntot, "PNG", gon.sparkline_x_right, gon.development_z_point_y+gon.section_header_lead+(2*gon.item_lead)+gon.sparkline_lead, 75, 9
                            doc.setFontSize(gon.describton_fontSize)
                            doc.setTextColor(169, 167, 166)
                            doc.setFontType(gon.describton_fontStyle)
                            doc.text("Sum of population and employment in the station area", gon.development_z_point_x, gon.development_z_point_y+gon.section_header_lead+(2*gon.item_lead)+gon.describton_lead)
                            

                            doc.setFontSize(gon.item_fontSize)
                            doc.setTextColor(0, 0, 0)
                            doc.setFontType(gon.item_fontStyle)
                            doc.text("Current Development Mix: #{gon.feature[0].properties.ov_mix.toFixed 2}", gon.development_z_point_x, gon.development_z_point_y+gon.section_header_lead+(3*gon.item_lead))
                            doc.addImage gon.sparklineMix, "PNG", gon.sparkline_x_right, gon.development_z_point_y+gon.section_header_lead+(3*gon.item_lead)+gon.sparkline_lead, 150, 9
                            doc.setFontSize(gon.describton_fontSize)
                            doc.setTextColor(169, 167, 166)
                            doc.setFontType(gon.describton_fontStyle)
                            doc.text("Employment share of total Development Intensity", gon.development_z_point_x, gon.development_z_point_y+gon.section_header_lead+(3*gon.item_lead)+gon.describton_lead)
                            

                            doc.setFontSize(gon.item_fontSize)
                            doc.setTextColor(0, 0, 0)
                            doc.setFontType(gon.item_fontStyle)
                            doc.text("Net Residential Density: #{gon.feature[0].properties.ov_hupac.toFixed 2}", gon.development_z_point_x, gon.development_z_point_y+gon.section_header_lead+(4*gon.item_lead))
                            doc.addImage gon.sparklineHupac, "PNG", gon.sparkline_x_right, gon.development_z_point_y+gon.section_header_lead+(4*gon.item_lead)+gon.sparkline_lead, 75, 9
                            doc.setFontSize(gon.describton_fontSize)
                            doc.setTextColor(169, 167, 166)
                            doc.setFontType(gon.describton_fontStyle)
                            doc.text("Housing units per acre of residential land use", gon.development_z_point_x, gon.development_z_point_y+gon.section_header_lead+(4*gon.item_lead)+gon.describton_lead)
                            

                            doc.setFontSize(gon.item_fontSize)
                            doc.setTextColor(0, 0, 0)
                            doc.setFontType(gon.item_fontStyle)
                            doc.text("Net Employment Density: #{gon.feature[0].properties.ov_empden.toFixed 2}", gon.development_z_point_x, gon.development_z_point_y+gon.section_header_lead+(5*gon.item_lead))
                            doc.addImage gon.sparklineEmpden, "PNG", gon.sparkline_x_right, gon.development_z_point_y+gon.section_header_lead+(5*gon.item_lead)+gon.sparkline_lead, 75, 9
                            doc.setFontSize(gon.describton_fontSize)
                            doc.setTextColor(169, 167, 166)
                            doc.setFontType(gon.describton_fontStyle)
                            doc.text("Estimated employment per acre of developed land use", gon.development_z_point_x, gon.development_z_point_y+gon.section_header_lead+(5*gon.item_lead)+gon.describton_lead)
                            

                            doc.setFontSize(gon.item_fontSize)
                            doc.setTextColor(0, 0, 0)
                            doc.setFontType(gon.item_fontStyle)
                            doc.text("WalkScore®: #{gon.feature[0].properties.walkscore.toFixed 2}", gon.development_z_point_x, gon.development_z_point_y+gon.section_header_lead+(6*gon.item_lead))
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
                            doc.text("Number of Employees: #{gon.feature[0].properties.ov_emp10.toFixed(0).replace(/(\d)(?=(\d{3})+$)/g, "$1,")}", gon.economics_z_point_x, gon.economics_z_point_y+gon.section_header_lead)
                            doc.addImage gon.sparklineEmp10, "PNG", gon.sparkline_x_right, gon.economics_z_point_y+gon.section_header_lead+gon.sparkline_lead, 75, 9
                            doc.setFontSize(gon.describton_fontSize)
                            doc.setTextColor(169, 167, 166)
                            doc.setFontType(gon.describton_fontStyle)
                            doc.text("Total employment in the station area, 2011", gon.economics_z_point_x, gon.economics_z_point_y+gon.section_header_lead+(0*gon.item_lead)+gon.describton_lead)
                            

                            doc.setFontSize(gon.item_fontSize)
                            doc.setTextColor(0, 0, 0)
                            doc.setFontType(gon.item_fontStyle)
                            doc.text("Tax Revenue ($): #{gon.feature[0].properties.ex_taxrev.toFixed(0).replace(/(\d)(?=(\d{3})+$)/g, "$1,")}", gon.economics_z_point_x, gon.economics_z_point_y+gon.section_header_lead+gon.item_lead)
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
                            doc.text("Assessed Value ($): #{gon.feature[0].properties.ov_aval.toFixed(0).replace(/(\d)(?=(\d{3})+$)/g, "$1,")}", gon.economics_z_point_x, gon.economics_z_point_y+gon.section_header_lead+(3*gon.item_lead))
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
                            doc.text("Household Median Income ($): #{gon.feature[0].properties.ov_hhinc.toFixed(0).replace(/(\d)(?=(\d{3})+$)/g, "$1,")}", gon.demographics_z_point_x, gon.demographics_z_point_y+gon.section_header_lead+gon.item_lead)
                            doc.addImage gon.sparklineHhinc, "PNG", gon.sparkline_x_left, gon.demographics_z_point_y+gon.section_header_lead+gon.item_lead+gon.sparkline_lead, 75, 9
                            doc.setFontSize(gon.describton_fontSize)
                            doc.setTextColor(169, 167, 166)
                            doc.setFontType(gon.describton_fontStyle)
                            doc.text("Weighted average of the median annual household income", gon.demographics_z_point_x, gon.demographics_z_point_y+gon.section_header_lead+(1*gon.item_lead)+gon.describton_lead)

                            doc.setFontSize(gon.item_fontSize)
                            doc.setTextColor(0, 0, 0)
                            doc.setFontType(gon.item_fontStyle)
                            doc.text("Renter Households: #{gon.feature[0].properties.ov_rentocc.toFixed 2}", gon.demographics_z_point_x, gon.demographics_z_point_y+gon.section_header_lead+(2*gon.item_lead))
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

                            # put a date of download 
                            doc.setFontType('italic')
                            doc.text("Sources: U.S. Census, American Community Survey", 405, 743)
                            doc.text("MassGIS, Infogroup, MAPC, Dukakis Center", 405, 751)
                            doc.text("Created on #{gon.today}", 405, 759)
                            doc.text("tstation.info/#fss/q/by_name=#{gon.feature[0].properties.name}", 405, 768)
                            
                            zoomScale = 15 - gon.currentZoom
                            if zoomScale < 0
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
                        field_interp = gon.dict_lookup_dict[event.target.previousSibling.previousElementSibling.innerText.replace(":", "").replace("®", "").replace /^\s+|\s+$/g, ""]
                    catch e
                        try
                            field_interp = gon.dict_lookup_dict[event.target.parentNode.previousSibling.previousElementSibling.outerText.replace(":", "").replace("®", "").replace /^\s+|\s+$/g, ""]
                        catch
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
            esri.addTo(map)
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
                      opacity: 0.5
                      fillOpacity: 0
            L.control.scale().addTo(map)
            circle1 = new L.Icon.Canvas(iconSize: new L.Point(460, 460), scaleFactor: 1)
            circle2 = new L.Icon.Canvas(iconSize: new L.Point(460, 460), scaleFactor: 1)
            circle3 = new L.Icon.Canvas(iconSize: new L.Point(460, 460), scaleFactor: 1)
            circle4 = new L.Icon.Canvas(iconSize: new L.Point(460, 460), scaleFactor: 1)
            circle1.draw = (ctx, w, h) ->
              ctx.translate w / 2, h / 2
              ctx.beginPath()
              ctx.fillStyle = "#000"
              ctx.arc 0, 0, w / 2 - 1, 0, Math.PI * 2, true
              ctx.lineWidth = 5
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
            currentZoom = map.getZoom()
            gon.currentZoom = currentZoom

            onZoomend = ->
                zoom = map.getZoom()
                gon.currentZoom = zoom
                if zoom != 15
                    map.removeLayer canvasCircles
                else if zoom == 15
                    canvasCircles.addTo map

                if zoom >= 16
                    map.removeLayer fstation
                    fstationZoom.addTo map
                else
                    map.removeLayer fstationZoom
                    fstation.addTo map
                return
            map.on "zoomend", onZoomend
            L_PREFER_CANVAS = true



