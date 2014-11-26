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

                console.log "#{gon.feature[0].properties.name}".indexOf("STATION") isnt -1
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

                    # html2canvas document.getElementsByClassName("leaflet-layer"),
                    html2canvas document.getElementById("map"),
                        # allowTaint: true
                        taintTest: false
                        useCORS: true
                        proxy: 'assets/php/proxy.php'
                        onrendered: (canvas) ->
                            # console.log document.getElementsByClassName("leaflet-marker-icon leaflet-zoom-animated leaflet-clickable")
                            imagel = document.createElement("div")
                            imagel.setAttribute('id', 'mapImage')
                            imagel.setAttribute('style', 'display:none;')
                            # or it can get a img from leaflet-image plugin and return it as part of the function
                            imagel.appendChild canvas
                            # gon.imgData = canvas.toDataURL("image/png")
                            document.body.appendChild imagel
                            ctx = canvas.getContext("2d")
                            gon.imageData = canvas.toDataURL()
                            ## making up the pdf using jspdf
                            mapcLogoData = 'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAGQAAABkCAMAAABHPGVmAAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAAYBQTFRFN2mleJrB5+3z8/nr3PSxGVKW1OTUCUeQ2+3LttWrRXSryeSu4vHR2eLu1O2wvMzgXIW20dzqorrV5fu0DEmR8vX56/D2lKvNIViYpcep0+m8OG2YADiNsMTbE06U0euvnbPRZJGezdno+fr8xuKuZIu5ytTlq8HZ4/bDusrfWomdlbqmzea0zOWy6vXg5fLYorTSbJef+Pz1AkCPgaiiiabJ9ff6jKnL4unxcpXAbZG8/v79xtTl3ubwqL7Yws3h7vzPyuWuU36y7/fn/P36z+iv/P3+haPI9vvwwNDiSXua/f78zOevfKailrDP2ezH1erA0+TPf5/FssrHB0OQy9jnyOOuy93S6PPcwtLk/Pz9ibCkL2OfyuWwv9ys////nsGn2/C6tcjd7/P3xdLk+/34sb/Zp7zXyuauma7P2PCxoLfU/v7/+/z9/f7+/v7+///+/v/+3+/P/v//7PXjrcbHKF6c4/Dcz+e30eXHsNCq6vjScp2g9/n7p7bTusfdjND1NgAABzNJREFUeNrsmPtX2tgWgIOQHg3PYIDII1BAGRBFZVAEohWEQrGKDFJRxmPFx4ggr17GcUrnX5+TEDBW1pq45vau+0O2LNw5hHzZZz8DBv8HgskQGSJDZIgMkSEyRIbIkH8Lia+FCqn8j4XkQ4UltVXZ+3GQlnJZo0YSTP1AS5RWDlHeq2viPwySOuAYO3Xd2UNWMuTqy/JrpBvk7UjPBPqr76CZlQZJBZdeI8iInXJ69pwO26nYgqHqakqBhNSvlD2n6uz0Q7gESiWcYrYaEiDtaekXT6vTabXuMbBqKwFeKDqyLmW7rqxSGWer5/WZGdWZzR4OgxJHIO6iA0k+UQYlIXb2VKd22yndXzwF4aEZ1cS91Og6XpIEKadVX0thTihqyAAYKTUZ211JDOfM149VtEkU8vYQUSL0kgtkviDJjvojZReuPhTa4G9IhfSyD5IsSXtXqbAYgidM0kv9sjSXeFWP9DNI9egV/UQjLX69urOqXWxIbuoiIxWSP5CaivVzXOQUKuJOzk9Jg7TXrJIhi7h4vxisSvUjJimQeCookbGjeht+Fl4ApQu1uS4Bsiu9OurmxJ5HSckj7xr/DMlKro7ldP3D2PNhxmYL0NwhFhUNF+3JkOWC9ApfP2WG+1UK2+lH7yx3SFEb40uuaULKq0mQbrBcHt9rWaTzr6d1JF51/WdUe8N2ux0PLO45d3TnuN0exhOjS2YLBw/Tuy8h7Z9Uqvrwct60Csk4K5C+U37SeZlV0+ESbusH5pyq9G97Tt0qjTO0oTaqgmv5lLXbeWnJm8M3b95pNN1uV9NF6mF3KO+mP3369KeG1zXTbwQ5/PM/CsOc99GJgDqdrq5yzswt7ufEI0tIffwC0rm+tbibnU4+H283Fm4t2k48H4/nOxnWElnItJEez7fNKy4X99LXYHM3OouuXn/8+DYQWF10zqrqwVBWNEgeqx/WXlhSLZX6wrzBYqXS7ejjTVDCTgR9gSlxQuEY+ji7U9Z539Il5JkwZTt37qTrVo1oJFu2hl5CUAea58cNzzyKm30h6rVVlNIO4dQKQ1EMw6BIYt7H1zSfz2zI+Uwf595PdchzhSdT4vFp0ZEAwbjM9XHaFiOCbHDNLymcmmAoA1lJ6DcZwLjh1fQHFF4fH8/OTm12ek6HQsMqCtz8dFD5HaSB8VU7CnssrwmQKQIkDYCujCFF7n9TQYH3cPcXlCVzdedeun62uqgbzsSjkGrnldal1EtLGIIBMZhRoIqHjyBGBmwdUSDWGEEUvOLHQaxXm7eHf1b9xoX3ni49jPiH0BoKEJjPHh88qB+WX1rC+AnA5CoMmHfRAmSQRMY1CdDXPocYcaCAWjpcndGNM1Vd4Mu4VaP5opzm+l8wpJzgE/IIBxgBaPJiZImfBsVm7wb1DPF2ebQEAD6YoOwBnXMMechmhToeFFpsd22CTyq9It+EuBvlIZ4Y4MK6SZSIqSEEEJZIZBNFHFGDesquONSNCs5DSjS3Ba2Fg+50ITvBkhw0YxQgzGMI2QfE3dbWVhIwd70hRBACDVokA5K1n7iSg6bud8p4O/TrcNuOv6Sya3lU1ydZkoMwR3FlToBkIsguXlAUm4YQGkNisHBlPYpRVPTqs1ft/fx7tNaGba4j/dpdHt3/8kFnoiWwWSzCMSSKAQpneAG4v8f7JMZqtWyNf0JsFkHJ0D7UlfdCbS2LOgjqSEvW8d13lCk42RI4MD1BjBRQuBOXl5dHLhTFg6c8EYREVSL2C6qRf/hotH9XmuMvStET14QqLEBGEYogZhS/woyL1L5bFMJDud/CAdUPfH1rQ76ywM5u+5/ab1UEuWOApQEdAGwKw3p7HwBFE9UusCn+asbXB/zoDfCNdSnTyjxGuEdLFwTm6Hk2qsnKaIU1VNFsRRLE/vMvs0WCxmks5m5ImrvWa6bxHNg0mTywYaqJHms8JlMT3q+j9efSMGlJrbn3//bbisczGNw3YWYdNhvQ1IDobzC0ZrgbyLzBvaB9J8113lxoEs71mCZB/A7H0Y32wkfekYkb1ucjb3Ks2Uxu5Vh/05dAVSVHmo2VnMOUQxEXdVXIXu3CfOnXXpBa0u+OOvwDWHNUtDcVLcv6j6aQ6mZ730MURHIjuWDcuME2LJtGQ3Gj+H7f73ds+CKEO0kkoNkQyxHviwqSUAygw+AqRh2YI0IYY4at/XmDcVPBwpzCbykW9yOOTYNRob+J7Ne+h2z7/fqIlnWTtwvXliNH1H37V27lUkuSjm/b13dsh73xuW/813fk3bUZkttTLv/2in7BmFhYWdjWf7v8ZpmCaO3SkstF3G6Xe0Xv1rvcE3xycuLJtFoQtprctprv79cHrRNPA6IlLvBayBEZ0wA2MtyhqdaCaMBAU0GPc1OLO6NZg4NM6+Sk0YCZGjyp1V4dXU+Z0Bqn/JMq/wYpQ2SIDJEhMkSGyBAZIkP+q/K3AAMA4Q0c4s4ow90AAAAASUVORK5CYII='
                            northeasternLogoData = 'data:image/png;base64,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'
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
                            # doc.line(40, 108, 400, 108)

                            # doc.setFontSize(12)
                            # doc.setTextColor(255, 102, 51)
                            # doc.text("Basic info", 40, 104)

                            doc.setFontSize(gon.item_fontSize)
                            doc.setTextColor(0, 0, 0)
                            doc.text("Municipality: #{gon.feature[0].properties.muni_name}", gon.basic_z_point_x, gon.basic_z_point_y+(gon.item_lead/2))
                            # doc.text("#{gon.feature[0].properties.line_descr}", gon.basic_z_point_x, gon.basic_z_point_y - 27 + gon.item_lead)
                            doc.setFontSize(gon.describton_fontSize)
                            doc.setTextColor(169, 167, 166)
                            doc.setFontType(gon.describton_fontStyle)
                            # doc.text("Whether the station is served by Raipid Tranist Line, Commuter Rail Line, Key Bus Route, or Ferry Routes.",gon.basic_z_point_x, gon.basic_z_point_y+gon.section_header_lead+gon.item_lead+gon.describton_lead)

                            doc.setFontSize(gon.item_fontSize)
                            doc.setTextColor(0, 0, 0)
                            doc.setFontType(gon.item_fontStyle)
                            doc.text("Station Type: #{gon.feature[0].properties.station_class}", gon.basic_z_point_x, gon.basic_z_point_y+(2*gon.item_lead/2))
                            doc.text("Community Type: #{gon.feature[0].properties.community_type_description}", gon.basic_z_point_x, gon.basic_z_point_y+(3*gon.item_lead/2))
                            doc.text("Community Subtype: #{gon.feature[0].properties.subcommunity_type_description}", gon.basic_z_point_x, gon.basic_z_point_y+(4*gon.item_lead/2))


                            doc.setFontSize(7)
                            doc.setTextColor(0, 0, 0)
                            doc.setFontType('bold')



                            # console.log "gon.d3ChartElement", gon.d3ChartElement
                            # doc.addSVG gon.d3ChartElement, 120, 140,
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
                            # doc.setTextColor(169, 167, 166)
                            doc.text("20", gon.radar_z_x+(gon.radar_width/2)+3, gon.radar_z_y-3)
                            doc.setFontSize(gon.item_fontSize)
                            doc.setTextColor(0, 0, 0)
                            doc.text("   Orientation", gon.radar_z_x+(gon.radar_width/2)+15, gon.radar_z_y-6)
                            doc.setFontSize(gon.describton_fontSize)
                            # doc.setTextColor(169, 167, 166)
                            doc.text("15", gon.radar_z_x+gon.radar_width+3, gon.radar_z_y+gon.radar_height+3)
                            doc.setFontSize(gon.item_fontSize)
                            doc.setTextColor(0, 0, 0)
                            doc.text("   Development", gon.radar_z_x+gon.radar_width+10, gon.radar_z_y+gon.radar_height+5)
                            doc.line(gon.radar_z_x, gon.radar_z_y+gon.radar_height, gon.radar_z_x+gon.radar_width, gon.radar_z_y+gon.radar_height)
                            doc.setFontSize(gon.describton_fontSize)
                            # doc.setTextColor(169, 167, 166)
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
                            # doc.circle(460, 260, 9, '')


                            doc.addImage mapcLogoData, "PNG", 40, 725, 55, 55
                            doc.addImage northeasternLogoData, "PNG", 184, 735, 30, 30

                            doc.line(40, 730, 574, 730)

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
                            # doc.text("School of Public Policy & Urban Affairs", 340, 761)
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
                            
                            # doc.text("Total eTOD Score: #{gon.feature[0].properties.etod_total} out of 50", gon.etod_z_point_x, gon.etod_z_point_y+gon.section_header_lead+(2*gon.item_lead))
                            # doc.text("Transit Score: #{gon.feature[0].properties.etod_sub1t} out of 15", gon.etod_z_point_x, gon.etod_z_point_y+gon.section_header_lead+(3*gon.item_lead))
                            # doc.text("Orientation Score: #{gon.feature[0].properties.etod_sub2o} out of 20", gon.etod_z_point_x, gon.etod_z_point_y+gon.section_header_lead+(4*gon.item_lead))
                            # doc.text("Development Score: #{gon.feature[0].properties.etod_sub3d} out of 15", gon.etod_z_point_x, gon.etod_z_point_y+gon.section_header_lead+(5*gon.item_lead))
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
                            # doc.text("for households in station areas", gon.transportation_z_point_x, gon.transportation_z_point_y+gon.section_header_lead+(2*gon.describton_lead))
                            
                            doc.setFontSize(gon.item_fontSize)
                            doc.setTextColor(0, 0, 0)
                            doc.setFontType(gon.item_fontStyle)
                            doc.text("GHG Emissions-Transportation: #{gon.feature[0].properties.ov_ghg.toFixed 2}", gon.transportation_z_point_x, gon.transportation_z_point_y+gon.section_header_lead+gon.item_lead)
                            doc.addImage gon.sparklineGhg, "PNG", gon.sparkline_x_left, gon.transportation_z_point_y+gon.section_header_lead+gon.item_lead+gon.sparkline_lead, 75, 9
                            doc.setFontSize(gon.describton_fontSize)
                            doc.setTextColor(169, 167, 166)
                            doc.setFontType(gon.describton_fontStyle)
                            doc.text("Estimated total greenhouse gases (kilograms CO2 equivalent)", gon.transportation_z_point_x, gon.transportation_z_point_y+gon.section_header_lead+gon.item_lead+gon.describton_lead)
                            # doc.text("(kilograms CO2 equivalent) ", gon.transportation_z_point_x, gon.transportation_z_point_y+gon.section_header_lead+gon.item_lead+(2*gon.describton_lead))

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
                            # doc.text("for which transit was used", gon.transportation_z_point_x, gon.transportation_z_point_y+gon.section_header_lead+(3*gon.item_lead)+(2*gon.describton_lead))

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
                            # doc.text("by total parcel size", gon.development_z_point_x, gon.development_z_point_y+gon.section_header_lead+(2*gon.describton_lead))

                            doc.setFontSize(gon.item_fontSize)
                            doc.setTextColor(0, 0, 0)
                            doc.setFontType(gon.item_fontStyle)
                            doc.text("Surface Parking (acre): #{gon.feature[0].properties.ov_prkac.toFixed 2}", gon.development_z_point_x, gon.development_z_point_y+gon.section_header_lead+gon.item_lead)
                            doc.addImage gon.sparklinePrkac, "PNG", gon.sparkline_x_right, gon.development_z_point_y+gon.section_header_lead+gon.item_lead+gon.sparkline_lead, 75, 9
                            doc.setFontSize(gon.describton_fontSize)
                            doc.setTextColor(169, 167, 166)
                            doc.setFontType(gon.describton_fontStyle)
                            doc.text("Acres of surface parking within the station area", gon.development_z_point_x, gon.development_z_point_y+gon.section_header_lead+gon.item_lead+gon.describton_lead)
                            # doc.text("within the station area", gon.development_z_point_x, gon.development_z_point_y+gon.section_header_lead+gon.item_lead+(2*gon.describton_lead))

                            doc.setFontSize(gon.item_fontSize)
                            doc.setTextColor(0, 0, 0)
                            doc.setFontType(gon.item_fontStyle)
                            doc.text("Current Development Intensity: #{gon.feature[0].properties.ov_intntot.toFixed(0).replace(/(\d)(?=(\d{3})+$)/g, "$1,")}", gon.development_z_point_x, gon.development_z_point_y+gon.section_header_lead+(2*gon.item_lead))
                            doc.addImage gon.sparklineIntntot, "PNG", gon.sparkline_x_right, gon.development_z_point_y+gon.section_header_lead+(2*gon.item_lead)+gon.sparkline_lead, 75, 9
                            doc.setFontSize(gon.describton_fontSize)
                            doc.setTextColor(169, 167, 166)
                            doc.setFontType(gon.describton_fontStyle)
                            doc.text("Sum of population and employment in the station area", gon.development_z_point_x, gon.development_z_point_y+gon.section_header_lead+(2*gon.item_lead)+gon.describton_lead)
                            # doc.text("in the station area", gon.development_z_point_x, gon.development_z_point_y+gon.section_header_lead+(2*gon.item_lead)+(2*gon.describton_lead))
                            

                            doc.setFontSize(gon.item_fontSize)
                            doc.setTextColor(0, 0, 0)
                            doc.setFontType(gon.item_fontStyle)
                            doc.text("Current Development Mix: #{gon.feature[0].properties.ov_mix.toFixed 2}", gon.development_z_point_x, gon.development_z_point_y+gon.section_header_lead+(3*gon.item_lead))
                            doc.addImage gon.sparklineMix, "PNG", gon.sparkline_x_right, gon.development_z_point_y+gon.section_header_lead+(3*gon.item_lead)+gon.sparkline_lead, 150, 9
                            doc.setFontSize(gon.describton_fontSize)
                            doc.setTextColor(169, 167, 166)
                            doc.setFontType(gon.describton_fontStyle)
                            doc.text("Employment share of total Development Intensity", gon.development_z_point_x, gon.development_z_point_y+gon.section_header_lead+(3*gon.item_lead)+gon.describton_lead)
                            # doc.text("Intensity (population + employment)", gon.development_z_point_x, gon.development_z_point_y+gon.section_header_lead+(3*gon.item_lead)+(2*gon.describton_lead))
                            

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
                            # doc.text("of developed land use", gon.development_z_point_x, gon.development_z_point_y+gon.section_header_lead+(5*gon.item_lead)+(2*gon.describton_lead))
                            

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
                            # doc.text("under construction or planned", gon.development_z_point_x, gon.development_z_point_y+gon.section_header_lead+(7*gon.item_lead)+(2*gon.describton_lead))
                            

                            doc.setFontSize(gon.item_fontSize)
                            doc.setTextColor(0, 0, 0)
                            doc.setFontType(gon.item_fontStyle)
                            doc.text("Commercial Pipeline: #{(gon.feature[0].properties.ov_emppipe.toFixed 0).replace(/(\d)(?=(\d{3})+$)/g, "$1,")}", gon.development_z_point_x, gon.development_z_point_y+gon.section_header_lead+(8*gon.item_lead))
                            doc.addImage gon.sparklineEmppipe, "PNG", gon.sparkline_x_right, gon.development_z_point_y+gon.section_header_lead+(8*gon.item_lead)+gon.sparkline_lead, 75, 9
                            doc.setFontSize(gon.describton_fontSize)
                            doc.setTextColor(169, 167, 166)
                            doc.setFontType(gon.describton_fontStyle)
                            doc.text("Anticipated employment in projects under construction or planned", gon.development_z_point_x, gon.development_z_point_y+gon.section_header_lead+(8*gon.item_lead)+gon.describton_lead)
                            # doc.text("projects under construction or planned", gon.development_z_point_x, gon.development_z_point_y+gon.section_header_lead+(8*gon.item_lead)+(2*gon.describton_lead))
                            

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
                            # doc.text("from parcels in the station area", gon.economics_z_point_x, gon.economics_z_point_y+gon.section_header_lead+(1*gon.item_lead)+(2*gon.describton_lead))
                            

                            doc.setFontSize(gon.item_fontSize)
                            doc.setTextColor(0, 0, 0)
                            doc.setFontType(gon.item_fontStyle)
                            doc.text("Number of Establishments: #{gon.feature[0].properties.ov_est_10.toFixed(0).replace(/(\d)(?=(\d{3})+$)/g, "$1,")}", gon.economics_z_point_x, gon.economics_z_point_y+gon.section_header_lead+(2*gon.item_lead))
                            doc.addImage gon.sparklineEst10, "PNG", gon.sparkline_x_right, gon.economics_z_point_y+gon.section_header_lead+(2*gon.item_lead)+gon.sparkline_lead, 75, 9
                            doc.setFontSize(gon.describton_fontSize)
                            doc.setTextColor(169, 167, 166)
                            doc.setFontType(gon.describton_fontStyle)
                            doc.text("Number of businesses, public agencies, non–profits, and other employers", gon.economics_z_point_x, gon.economics_z_point_y+gon.section_header_lead+(2*gon.item_lead)+gon.describton_lead)
                            # doc.text("profit organizations, and other employers", gon.economics_z_point_x, gon.economics_z_point_y+gon.section_header_lead+(2*gon.item_lead)+(2*gon.describton_lead))
                            

                            doc.setFontSize(gon.item_fontSize)
                            doc.setTextColor(0, 0, 0)
                            doc.setFontType(gon.item_fontStyle)
                            doc.text("Assessed Value ($): #{gon.feature[0].properties.ov_aval.toFixed(0).replace(/(\d)(?=(\d{3})+$)/g, "$1,")}", gon.economics_z_point_x, gon.economics_z_point_y+gon.section_header_lead+(3*gon.item_lead))
                            doc.addImage gon.sparklineAval, "PNG", gon.sparkline_x_right, gon.economics_z_point_y+gon.section_header_lead+(3*gon.item_lead)+gon.sparkline_lead, 75, 9
                            doc.setFontSize(gon.describton_fontSize)
                            doc.setTextColor(169, 167, 166)
                            doc.setFontType(gon.describton_fontStyle)
                            doc.text("Total assessed value of land and improvements in station area", gon.economics_z_point_x, gon.economics_z_point_y+gon.section_header_lead+(3*gon.item_lead)+gon.describton_lead)
                            # doc.text("for all parcels in station area", gon.economics_z_point_x, gon.economics_z_point_y+gon.section_header_lead+(3*gon.item_lead)+(2*gon.describton_lead))
                            

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
                            # doc.text("annual household income", gon.demographics_z_point_x, gon.demographics_z_point_y+gon.section_header_lead+(1*gon.item_lead)+(2*gon.describton_lead))

                            doc.setFontSize(gon.item_fontSize)
                            doc.setTextColor(0, 0, 0)
                            doc.setFontType(gon.item_fontStyle)
                            doc.text("Renter Households: #{gon.feature[0].properties.ov_rentocc.toFixed 2}", gon.demographics_z_point_x, gon.demographics_z_point_y+gon.section_header_lead+(2*gon.item_lead))
                            doc.addImage gon.sparklineRentocc, "PNG", gon.sparkline_x_left, gon.demographics_z_point_y+gon.section_header_lead+(2*gon.item_lead)+gon.sparkline_lead, 150, 9
                            doc.setFontSize(gon.describton_fontSize)
                            doc.setTextColor(169, 167, 166)
                            doc.setFontType(gon.describton_fontStyle)
                            doc.text("Renter households as a share of total occupied housing units", gon.demographics_z_point_x, gon.demographics_z_point_y+gon.section_header_lead+(2*gon.item_lead)+gon.describton_lead)
                            # doc.text("total occupied housing units", gon.demographics_z_point_x, gon.demographics_z_point_y+gon.section_header_lead+(2*gon.item_lead)+(2*gon.describton_lead))

                            doc.setFontSize(gon.item_fontSize)
                            doc.setTextColor(0, 0, 0)
                            doc.setFontType(gon.item_fontStyle)
                            doc.text("Zero-Car Households: #{(gon.feature[0].properties.ov_hhnocar * 100).toFixed 0 }%", gon.demographics_z_point_x, gon.demographics_z_point_y+gon.section_header_lead+(3*gon.item_lead))
                            doc.addImage gon.sparklineHhnocar, "PNG", gon.sparkline_x_left, gon.demographics_z_point_y+gon.section_header_lead+(3*gon.item_lead)+gon.sparkline_lead, 75, 9
                            doc.setFontSize(gon.describton_fontSize)
                            doc.setTextColor(169, 167, 166)
                            doc.setFontType(gon.describton_fontStyle)
                            doc.text("Percentage of households in station area reporting zero vehicles available", gon.demographics_z_point_x, gon.demographics_z_point_y+gon.section_header_lead+(3*gon.item_lead)+gon.describton_lead)
                            # doc.text("reporting zero vehicles available", gon.demographics_z_point_x, gon.demographics_z_point_y+gon.section_header_lead+(3*gon.item_lead)+(2*gon.describton_lead))

                            doc.setFontSize(gon.item_fontSize)
                            doc.setTextColor(0, 0, 0)
                            doc.setFontType(gon.item_fontStyle)
                            doc.text("Adult College Graduates: #{(gon.feature[0].properties.ov_ed_att * 100).toFixed 0}%", gon.demographics_z_point_x, gon.demographics_z_point_y+gon.section_header_lead+(4*gon.item_lead))
                            doc.addImage gon.sparklineEdatt, "PNG", gon.sparkline_x_left, gon.demographics_z_point_y+gon.section_header_lead+(4*gon.item_lead)+gon.sparkline_lead, 175, 9
                            doc.setFontSize(gon.describton_fontSize)
                            doc.setTextColor(169, 167, 166)
                            doc.setFontType(gon.describton_fontStyle)
                            doc.text("Share of adult population with a four-year college degree or higher", gon.demographics_z_point_x, gon.demographics_z_point_y+gon.section_header_lead+(4*gon.item_lead)+gon.describton_lead)
                            # doc.text("college degree or higher", gon.docemographics_z_point_x, gon.demographics_z_point_y+gon.section_header_lead+(4*gon.item_lead)+(2*gon.describton_lead))

                            # put a date of download 
                            doc.setFontType('italic')
                            doc.text("Sources: U.S. Census, American Community Survey", 405, 743)
                            doc.text("MassGIS, Infogroup, MAPC, Dukakis Center", 405, 751)
                            doc.text("Created on #{gon.today}", 405, 759)
                            doc.text("tstation.info/#fss/q/by_name=#{gon.feature[0].properties.name}", 405, 768)
                            
                            html2canvas document.getElementsByClassName("leaflet-marker-icon leaflet-canvas-icon leaflet-zoom-animated leaflet-clickable"),
                                # allowTaint: true
                                taintTest: false
                                useCORS: true
                                proxy: 'assets/php/proxy.php'
                                onrendered: (canvas) ->
                                    # console.log document.getElementsByClassName("leaflet-marker-icon leaflet-zoom-animated leaflet-clickable")
                                    markel = document.createElement("div")
                                    markel.setAttribute('id', 'markerElement')
                                    markel.setAttribute('style', 'display:none;')
                                    # or it can get a img from leaflet-image plugin and return it as part of the function
                                    markel.appendChild canvas
                                    # gon.imgData = canvas.toDataURL("image/png")
                                    document.body.appendChild markel
                                    ctx = canvas.getContext("2d")
                                    gon.markerElementData = canvas.toDataURL()
                                    doc.addImage gon.markerElementData, "PNG", 380+(190/4), 55+(190/4), 190/2, 190/2
                                    console.log "canvas", canvas
                                    doc.save "tstationinfo.pdf"
                                    spinner.stop()
                            
                            return 


                $(".feedback_trigger").click (event, ui) ->
                    $("#accordion").accordion "disable"
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
                    $("#dialog-modal").dialog modal: false
                        

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
                    console.log event
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
                    # $("#accordion").accordion "disable"
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
                        $("#dialog-modal").dialog title: ""
                        spinner.stop()
                        $("#dialog-modal").html("<div class='row'>
                                                    <div class='col-md-2'>
                                                       <strong>Description</strong> 
                                                    </div>
                                                    <div class='col-md-10' style='text-align: left;'>
                                                        <hm2><strong> #{@dictionaryentries.models["0"].get("interpretation").replace("пїЅ","'")}: </strong> <span><p>#{@dictionaryentries.models["0"].get("code")} <p></span>
                                                    </div>
                                                </div>
                                                <br> 
                                                <div class='row'>
                                                    <div class='col-md-2'>
                                                        <span><strong>Interpretation</strong></span>
                                                    </div>
                                                    <div class='col-md-10' style='text-align: left;'>
                                                        <p>#{@dictionaryentries.models["0"].get("importance").replace("ђ","'").replace("пїЅ","'")} </p>
                                                    </div>
                                                </div>
                                                <br>
                                                <div class='row'>
                                                    <div class='col-md-2'> 
                                                        <span><strong>Importance</strong></span>
                                                    </div>
                                                    <div class='col-md-10' style='text-align: left;'>
                                                        <p>#{@dictionaryentries.models["0"].get("description").replace("пїЅ","'")} </p>
                                                    </div>
                                                </div>
                                                <br>
                                                <div class='row'>
                                                    <div class='col-md-2'>
                                                        <span><strong>Note</strong>
                                                        </span></div><div class='col-md-10' style='font-style: italic; font-size:10;'>
                                                            <p>#{@dictionaryentries.models["0"].get("technical_notes").replace("пїЅ","'")}</p>
                                                    </div>
                                                </div></hm2>")
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
            # $("#titles").html "<p class='h2'>Search Results </p><p><a href='#advsearch/' id='searchrefine'><button type='button' class='btn btn-default btn3d col-xs-offset-0'>Refine Results</button></a></p>"
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

                spintargetDl = document.getElementById("main-region")
                spinnerDl = new Spinner(spinopts).spin(spintargetDl)

                exportTableToCSV.apply this, [
                    jfeatures
                    "tstationinfo.csv"
                ]
                return
                spintargetDl.stop()

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
            )
            #defaultLayer = L.tileLayer.provider("OpenStreetMap.Mapnik").addTo(map)
            streets = L.tileLayer.provider "MapBox.mapc.i8ddbf5a"
            esri = L.tileLayer.provider "Esri.WorldImagery"
            esri.addTo(map)
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
            console.log gon.feature
            console.log gon.feature[0].geometry.coordinates
            fstation = new L.GeoJSON geoCollection,
                style: (feature) ->
                    feature.properties and feature.properties.style
                pointToLayer: (feature, latlng) ->
                    gon.latlong = latlng
                    console.log latlng.lat
                    L.circle latlng, 804.672,
                      fillColor: "#FFFFFF"
                      color: "#000"
                      weight: 1
                      opacity: 0.3
                      fillOpacity: 0.5
                    # circleOptions =
                    #   fillColor: "#FFFFFF"
                    #   color: "#000"
                    #   weight: 1
                    #   opacity: 0.3
                    #   fillOpacity: 0.5
                    # circle = new L.Circle(circleLocation, 804.672, circleOptions)
                    # group = new L.LayerGroup()
                    # circleMarker = new L.CircleMarker(circleLocation,
                    #   fillColor: "#FFFFFF"
                    #   fillOpacity: 1
                    #   stroke: true
                    # )
                    # # L.CircleMarker latlng, 
                    # #   fillColor: "#FFFFFF"
                    # #   color: "#000"
                    # #   weight: 1
                    # #   opacity: 0.3
                    # #   fillOpacity: 0.5
                    # group.addLayer(circle).addLayer(circleMarker)            
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
              # ctx.fill()
              ctx.lineWidth = 5
              ctx.strokeStyle = "#000"
              # ctx.moveTo -w / 5, -h / 5
              # ctx.lineTo w / 5, h / 5
              # ctx.moveTo -w / 5, h / 5
              # ctx.lineTo w / 5, -h / 5
              ctx.stroke()
              ctx.closePath()
              return
            # circle2.draw = (ctx, w, h) ->
            #   ctx.translate w / 2, h / 2
            #   ctx.beginPath()
            #   ctx.fillStyle = "#000"
            #   ctx.arc 0, 0, w / 2 - 1, Math.PI * 0.5, Math.PI * 1, true
            #   # ctx.fill()
            #   ctx.lineWidth = 3
            #   ctx.strokeStyle = "#000"
            #   # ctx.moveTo -w / 5, -h / 5
            #   # ctx.lineTo w / 5, h / 5
            #   # ctx.moveTo -w / 5, h / 5
            #   # ctx.lineTo w / 5, -h / 5
            #   ctx.stroke()
            #   ctx.closePath()
            #   return
            # circle3.draw = (ctx, w, h) ->
            #   ctx.translate w / 2, h / 2
            #   ctx.beginPath()
            #   ctx.fillStyle = "#000"
            #   ctx.arc 0, 0, w / 2 - 1, Math.PI * 1, Math.PI * 1.5, true
            #   # ctx.fill()
            #   ctx.lineWidth = 3
            #   ctx.strokeStyle = "#000"
            #   # ctx.moveTo -w / 5, -h / 5
            #   # ctx.lineTo w / 5, h / 5
            #   # ctx.moveTo -w / 5, h / 5
            #   # ctx.lineTo w / 5, -h / 5
            #   ctx.stroke()
            #   ctx.closePath()
            #   return  
            # circle4.draw = (ctx, w, h) ->
            #   ctx.translate w / 2, h / 2
            #   ctx.beginPath()
            #   ctx.fillStyle = "#000"
            #   ctx.arc 0, 0, w / 2 - 1, Math.PI * 1.5, Math.PI * 2, true
            #   # ctx.fill()
            #   ctx.lineWidth = 3
            #   ctx.strokeStyle = "#000"
            #   # ctx.moveTo -w / 5, -h / 5
            #   # ctx.lineTo w / 5, h / 5
            #   # ctx.moveTo -w / 5, h / 5
            #   # ctx.lineTo w / 5, -h / 5
            #   ctx.stroke()
            #   ctx.closePath()
            #   return
            canvasCircles = new L.Marker(gon.latlong,
              icon: circle1
              draggable: false
              opacity: 0.8
            )
            # canvasCircles2 = new L.Marker(gon.latlong,
            #   icon: circle2
            #   draggable: false
            #   opacity: 0.8
            # )
            # canvasCircles3 = new L.Marker(gon.latlong,
            #   icon: circle3
            #   draggable: false
            #   opacity: 0.8
            # )
            # canvasCircles4 = new L.Marker(gon.latlong,
            #   icon: circle4
            #   draggable: false
            #   opacity: 0.8
            # )
            map.addLayer canvasCircles
            # map.addLayer canvasCircles2, canvasCircles3, canvasCircles4
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
            currentZoom = map.getZoom()
            console.log "currentZoom", currentZoom
            console.log "L", L
            onZoomend = ->
                zoom = map.getZoom()
                if zoom != 15
                    map.removeLayer canvasCircles
                else if zoom == 15
                    canvasCircles.addTo map
                console.log "new zoom is", zoom
                console.log currentZoom/zoom
                console.log "map", map
                # if zoom - currentZoom + 1 == 2
                #     map.removeLayer canvasCircles
                #     map.addLayer canvasCircles1to2
                # else if zoom - currentZoom + 1 == 3
                #     map.removeLayer canvasCircles
                #     map.addLayer canvasCircles1to3
                # else if zoom - currentZoom + 1 == 0
                #     map.removeLayer canvasCircles
                #     map.addLayer canvasCircles2

                if zoom >= 16
                    map.removeLayer fstation
                    fstationZoom.addTo map
                else
                    map.removeLayer fstationZoom
                    fstation.addTo map
                return
            map.on "zoomend", onZoomend
            # Lsvg = L.noConflict()
            L_PREFER_CANVAS = true




