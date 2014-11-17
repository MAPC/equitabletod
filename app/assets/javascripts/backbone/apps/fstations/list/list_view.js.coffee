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
                fempden = gon.feature["0"].properties.ov_empden.toFixed 2 if gon.feature["0"].properties.ov_empden
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

                    spintarget = document.getElementById("print")
                    spinner = new Spinner(spinopts).spin(spintarget)
                    #get a image of snapshot of the current map object
                    html2canvas document.getElementById("resize-map"),
                        # allowTaint: true
                        taintTest: false
                        useCORS: true
                        proxy: 'assets/php/proxy.php'
                        onrendered: (canvas) ->
                            imagel = document.createElement("div")
                            imagel.setAttribute('id', 'mapImage')
                            # imagel.setAttribute('style', 'display:none;')
                            # or it can get a img from leaflet-image plugin and return it as part of the function
                            imagel.appendChild canvas
                            # gon.imgData = canvas.toDataURL("image/png")
                            document.body.appendChild imagel
                            ctx = canvas.getContext("2d")
                            gon.imageData = canvas.toDataURL()
                            ## making up the pdf using jspdf
                            doc = new jsPDF("p", "pt", "letter")
                            doc.setFont('helvetica')
                            doc.setFontType('bold')
                            doc.setLineWidth(2)
                            doc.circle(45, 34, 9, '')
                            doc.text("T  station.info", 40, 40)
                            doc.setLineWidth(1)
                            doc.setDrawColor(0.00, 0.60, 0.80, 0.00)
                            doc.line(40, 48, 540, 48)
                            doc.setFontSize(12)
                            doc.setFontType('normal')
                            doc.text("Station Area Details For: #{gon.feature[0].properties.name}", 40, 62)

                            doc.addImage gon.imageData, "PNG", 400, 50, 180, 180


                            doc.save "tstationinfo.pdf"
                            return 

                    spinner.stop()

                $(".feedback_trigger").click (event, ui) ->
                    # $("#accordion").accordion "disable"
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
                                                    <div id='boxplot' class='col-md-10 class='col-xs-4'>
                                                        <p class='hm2' style='text-align: left; padding-top: 35px;'>
                                                        Box plot is a way of displaying the distribution of data based on the five number summary: minimum, first quartile, median, third quartile, and maximum. Box plots show distribution of an attribute for all the station areas. the central rectangle spans the first quartile to the third quartile (the interquartile range or IQR). A segment inside the rectangle shows the median and 'whiskers' above and below the box show the locations of the minimum and maximum for all staton areas. The red + indicates the current station value for the field. 
                                                        </p>
                                                    </div>
                                                </div>
                                            </div>")
                    $("#dialog-modal").dialog height: "auto" 
                    $("#dialog-modal").dialog modal: true
                        

                $("#searchrefine").click (event, ui) ->
                    console.log "it gets the click"
                    App.vent.trigger "searchrefineFired"
                $("#dialog-modal").dialog 
                    position:
                        my: "right"
                        at: "right"
                        of: window
                    autoOpen: false
                    closeOnEscape: true
                    height: 1150
                    width: 820
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
                                                    <div class='col-md-1'>
                                                        <span class='glyphicon-class'></span><span class='glyphicon glyphicon-check'>
                                                    </div>
                                                    <div class='col-md-10' style='text-align: left;'>
                                                        <hm2><strong> #{@dictionaryentries.models["0"].get("interpretation")}: </strong> <span style='font-style: italic;'>#{@dictionaryentries.models["0"].get("code")} </span>
                                                    </div>
                                                </div>
                                                <hr> 
                                                <div class='row'>
                                                    <div class='col-md-1'>
                                                        <span class='glyphicon glyphicon-info-sign'></span>
                                                    </div>
                                                    <div class='col-md-10' style='text-align: left; font-style: italic;'>
                                                        #{@dictionaryentries.models["0"].get("importance")} 
                                                    </div>
                                                </div>
                                                <hr>
                                                <div class='row'>
                                                    <div class='col-md-1'> 
                                                        <span class='glyphicon glyphicon-warning-sign'></span>
                                                    </div>
                                                    <div class='col-md-10' style='text-align: left; font-style: italic;'>
                                                        #{@dictionaryentries.models["0"].get("description")} 
                                                    </div>
                                                </div>
                                                <hr>
                                                <div class='row'>
                                                    <div class='col-md-1'><span class='glyphicon glyphicon-asterisk'>
                                                        </span></div><div class='col-md-10' style='font-style: italic;'>
                                                            #{@dictionaryentries.models["0"].get("technical_notes")}
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
              exportTableToCSV.apply this, [
                jfeatures
                "tstationinfo.csv"
              ]
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
            snapshot = document.getElementById("snapshot")
            $("#chart").click (event, ui) ->
                    console.log "chart clicked"
                    sub1 = gon.feature["0"].properties.etod_sub1t
                    sub2 = gon.feature["0"].properties.etod_sub2o
                    sub3 = gon.feature["0"].properties.etod_sub3d
                    totscore = gon.feature["0"].properties.etod_total
                    $("#dialog-chart").dialog "open"
                    $("#dialog-chart").html("Transit Score: #{sub1}<br>Orientation Score: #{sub2}<br>Development Score: #{sub3}<br><hr>Total Score: #{totscore}")

			




