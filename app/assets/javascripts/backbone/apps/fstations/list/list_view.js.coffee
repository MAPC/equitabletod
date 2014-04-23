@Equitabletod.module "FstationsApp.List", (List, App, Backbone, Marionette, $, _) ->

	class List.Layout extends App.Views.Layout
		template: "fstations/list/templates/list_layout"
		regions: 
			mapRegion: "#map-region"
			fstationsRegion: "#fstations-region"
			chartRegion: "#chart-region"
       ### previousClicked: (e) =>
            console.log "inside previousClicked"
            console.log gon.searchresults  
        

        nextbuttomClicked: (e) =>
            console.log "inside nextbuttomClicked"
            console.log gon.length###
	class List.Detstation extends App.Views.ItemView
		template: "fstations/list/templates/_detstation"
		tagName: "tr"
		onShow: ->
			allfeaturesResponse = $.ajax
                	url: "/search.json?by_name="
                	done: (result) =>
                    	return result
            allfeature = allfeaturesResponse.complete()
            allfeature.done =>
                allfeatures = allfeature.responseJSON
                features = _.values allfeatures.features # this returns an array of each features obkect
                console.log features 
                fars = _.map features, (key, value) -> key.properties.ov_far.toFixed 2
                vmts = _.map features, (key, value) -> key.properties.ov_vmthday.toFixed 2
                pcttrans = _.map features, (key, value) -> key.properties.ov_pcttran.toFixed 2
                prkacs = _.map features, (key, value) -> key.properties.ov_prkac.toFixed 2
                emp10s = _.map features, (key, value) -> key.properties.ov_emp10.toFixed 2
                extaxrevs = _.map features, (key, value) -> key.properties.ex_taxrev.toFixed 0
                hh10s = _.map features, (key, value) -> key.properties.ov_hh10.toFixed 0
                hhincs = _.map features, (key, value) -> key.properties.ov_hhinc.toFixed 0
                vehphhs = _.map features, (key, value) -> key.properties.ov_vehphh.toFixed 4
                trnpcmis = _.map features, (key, value) -> key.properties.ov_trnpcmi.toFixed 4 if key.properties.ov_trnpcmi
                ghgs = _.map features, (key, value) -> key.properties.ov_ghg.toFixed 4 if key.properties.ov_ghg
                intntots = _.map features, (key, value) -> key.properties.ov_intntot if key.properties.ov_intntot
                mixs = _.map features, (key, value) -> key.properties.ov_mix.toFixed 4 if key.properties.ov_mix
                hupacs = _.map features, (key, value) -> key.properties.ov_hupac.toFixed 2 if key.properties.ov_hupac
                empdens = _.map features, (key, value) -> key.properties.ov_empden.toFixed 2 if key.properties.ov_empden
                est10s = _.map features, (key, value) -> key.properties.ov_est_10.toFixed 4 if key.properties.ov_est_10
                avals = _.map features, (key, value) -> key.properties.ov_aval.toFixed 0 if key.properties.ov_aval
                rentoccs = _.map features, (key, value) -> key.properties.ov_rentocc.toFixed 4 if key.properties.ov_rentocc
                hhnocars = _.map features, (key, value) -> key.properties.ov_hhnocar.toFixed 2 if key.properties.ov_hhnocar
                edatts = _.map features, (key, value) -> key.properties.ov_ed_att.toFixed 2 if key.properties.ov_ed_att

                gon.vehphhs = vehphhs
                gon.vmts = vmts
                gon.fars = fars
                gon.pcttrans = pcttrans
                gon.prkacs = prkacs
                gon.emp10s = emp10s
                gon.extaxrevs = extaxrevs
                gon.hh10s = hh10s
                gon.hhincs = hhincs
                gon.trnpcmis = trnpcmis
                gon.ghgs = ghgs
                gon.intntots = intntots
                gon.mixs = mixs
                gon.hupacs = hupacs
                gon.empdens = empdens
                gon.est10s = est10s
                gon.avals = avals
                gon.rentoccs = rentoccs
                gon.hhnocars = hhnocars
                gon.edatts = edatts

                fvmt = gon.feature["0"].properties.ov_vmthday.toFixed 4
                ffar = gon.feature["0"].properties.ov_far.toFixed 4
                fpcttran = gon.feature["0"].properties.ov_pcttran.toFixed 4
                femp10 = gon.feature["0"].properties.ov_emp10.toFixed 4
                fprkac = gon.feature["0"].properties.ov_prkac.toFixed 4
                fextaxrev = gon.feature["0"].properties.ex_taxrev.toFixed 4
                fhh10 = gon.feature["0"].properties.ov_hh10.toFixed 4
                fhhinc = gon.feature["0"].properties.ov_hhinc.toFixed 4
                $(".inlinesparklinevmt").sparkline gon.vmts, type: "box", target: fvmt, lineColor: '#c6c6c6', whiskerColor: '#c6c6c6', boxFillColor: '#e8e9ed', spotRadius: 2.5, width: '250', outlierLineColor: '#303030', showOutliers: false, tooltipFormatFieldlistKey: 'field', medianColor: '#0015ff', targetColor: '#bf0000'		
                $(".inlinesparklinefar").sparkline gon.fars, type: "box", target: ffar, lineColor: '#c6c6c6', whiskerColor: '#c6c6c6', boxFillColor: '#e8e9ed', spotRadius: 2.5, width: '250', outlierLineColor: '#303030', showOutliers: false, tooltipFormatFieldlistKey: 'field', medianColor: '#0015ff', targetColor: '#bf0000'
                $(".inlinesparklinepcttran").sparkline gon.pcttrans, type: "box", target: fpcttran, lineColor: '#c6c6c6', whiskerColor: '#c6c6c6', boxFillColor: '#e8e9ed', spotRadius: 2.5, width: '250', outlierLineColor: '#303030', showOutliers: false, tooltipFormatFieldlistKey: 'field', medianColor: '#0015ff', targetColor: '#bf0000'
                $(".inlinesparklineprkac").sparkline gon.prkacs, type: "box", target: fprkac, lineColor: '#c6c6c6', whiskerColor: '#c6c6c6', boxFillColor: '#e8e9ed', spotRadius: 2.5, width: '250', outlierLineColor: '#303030', showOutliers: false, tooltipFormatFieldlistKey: 'field', medianColor: '#0015ff', targetColor: '#bf0000'		
                $(".inlinesparklineemp10").sparkline gon.emp10s, type: "box", target: femp10, lineColor: '#c6c6c6', whiskerColor: '#c6c6c6', boxFillColor: '#e8e9ed', spotRadius: 2.5, width: '250', outlierLineColor: '#303030', showOutliers: false, tooltipFormatFieldlistKey: 'field', medianColor: '#0015ff', targetColor: '#bf0000'		
                $(".inlinesparklineextaxrev").sparkline gon.extaxrevs, type: "box", target: fextaxrev, lineColor: '#c6c6c6', whiskerColor: '#c6c6c6', boxFillColor: '#e8e9ed', spotRadius: 2.5, width: '250', outlierLineColor: '#303030', showOutliers: false, tooltipFormatFieldlistKey: 'field', medianColor: '#0015ff', targetColor: '#bf0000'      
                $(".inlinesparklinehh10").sparkline gon.hh10s, type: "box", target: fhh10, lineColor: '#c6c6c6', whiskerColor: '#c6c6c6', boxFillColor: '#e8e9ed', spotRadius: 2.5, width: '250', outlierLineColor: '#303030', showOutliers: false, tooltipFormatFieldlistKey: 'field', medianColor: '#0015ff', targetColor: '#bf0000'      
                $(".inlinesparklinehhinc").sparkline gon.hhincs, type: "box", target: fhhinc, lineColor: '#c6c6c6', whiskerColor: '#c6c6c6', boxFillColor: '#e8e9ed', spotRadius: 2.5, width: '250', outlierLineColor: '#303030', showOutliers: false, tooltipFormatFieldlistKey: 'field', medianColor: '#0015ff', targetColor: '#bf0000'      
                $("#accordion").accordion activate: (event, ui) ->
                    $("#accordion").accordion "refresh"
                    fvehphh = gon.feature["0"].properties.ov_vehphh.toFixed 4
                    ftrnpcmi = gon.feature["0"].properties.ov_trnpcmi.toFixed 4 if gon.feature["0"].properties.ov_trnpcmi
                    fghg = gon.feature["0"].properties.ov_ghg.toFixed 4 if gon.feature["0"].properties.ov_ghg
                    fintntot = gon.feature["0"].properties.ov_intntot if gon.feature["0"].properties.ov_intntot
                    fmix = gon.feature["0"].properties.ov_mix.toFixed 4 if gon.feature["0"].properties.ov_mix
                    fhupac = gon.feature["0"].properties.ov_hupac.toFixed 2 if gon.feature["0"].properties.ov_hupac
                    fempden = gon.feature["0"].properties.ov_empden.toFixed 2 if gon.feature["0"].properties.ov_empden
                    fest10 = gon.feature["0"].properties.ov_est_10.toFixed 4 if gon.feature["0"].properties.ov_est_10
                    faval = gon.feature["0"].properties.ov_aval.toFixed 0 if gon.feature["0"].properties.ov_aval
                    frentocc = gon.feature["0"].properties.ov_rentocc.toFixed 2 if gon.feature["0"].properties.ov_rentocc
                    fhhnocar = gon.feature["0"].properties.ov_hhnocar.toFixed 2 if gon.feature["0"].properties.ov_hhnocar
                    fedatt = gon.feature["0"].properties.ov_ed_att.toFixed 2 if gon.feature["0"].properties.ov_ed_att
                    $(".inlinesparklinevehphh").sparkline gon.vehphhs, type: "box", target: fvehphh, lineColor: '#c6c6c6', whiskerColor: '#c6c6c6', boxFillColor: '#e8e9ed', spotRadius: 2.5, width: '250', outlierLineColor: '#303030', showOutliers: false, tooltipFormatFieldlistKey: 'field', medianColor: '#0015ff', targetColor: '#bf0000' 
                    $(".inlinesparklinetrnpcmi").sparkline gon.trnpcmis, type: "box", target: ftrnpcmi, lineColor: '#c6c6c6', whiskerColor: '#c6c6c6', boxFillColor: '#e8e9ed', spotRadius: 2.5, width: '250', outlierLineColor: '#303030', showOutliers: false, tooltipFormatFieldlistKey: 'field', medianColor: '#0015ff', targetColor: '#bf0000' 
                    $(".inlinesparklineghg").sparkline gon.ghgs, type: "box", target: fghg, lineColor: '#c6c6c6', whiskerColor: '#c6c6c6', boxFillColor: '#e8e9ed', spotRadius: 2.5, width: '250', outlierLineColor: '#303030', showOutliers: false, tooltipFormatFieldlistKey: 'field', medianColor: '#0015ff', targetColor: '#bf0000'    
                    $(".inlinesparklineintntot").sparkline gon.intntots, type: "box", target: fintntot, lineColor: '#c6c6c6', whiskerColor: '#c6c6c6', boxFillColor: '#e8e9ed', spotRadius: 2.5, width: '250', outlierLineColor: '#303030', showOutliers: false, tooltipFormatFieldlistKey: 'field', medianColor: '#0015ff', targetColor: '#bf0000'    
                    $(".inlinesparklinemix").sparkline gon.mixs, type: "box", target: fmix, lineColor: '#c6c6c6', whiskerColor: '#c6c6c6', boxFillColor: '#e8e9ed', spotRadius: 2.5, width: '250', outlierLineColor: '#303030', showOutliers: false, tooltipFormatFieldlistKey: 'field', medianColor: '#0015ff', targetColor: '#bf0000'   
                    $(".inlinesparklinehupac").sparkline gon.hupacs, type: "box", target: fhupac, lineColor: '#c6c6c6', whiskerColor: '#c6c6c6', boxFillColor: '#e8e9ed', spotRadius: 2.5, width: '250', outlierLineColor: '#303030', showOutliers: false, tooltipFormatFieldlistKey: 'field', medianColor: '#0015ff', targetColor: '#bf0000'   
                    $(".inlinesparklineempden").sparkline gon.empdens, type: "box", target: fempden, lineColor: '#c6c6c6', whiskerColor: '#c6c6c6', boxFillColor: '#e8e9ed', spotRadius: 2.5, width: '250', outlierLineColor: '#303030', showOutliers: false, tooltipFormatFieldlistKey: 'field', medianColor: '#0015ff', targetColor: '#bf0000'   
                    $(".inlinesparklineest10").sparkline gon.est10s, type: "box", target: fest10, lineColor: '#c6c6c6', whiskerColor: '#c6c6c6', boxFillColor: '#e8e9ed', spotRadius: 2.5, width: '250', outlierLineColor: '#303030', showOutliers: false, tooltipFormatFieldlistKey: 'field', medianColor: '#0015ff', targetColor: '#bf0000'   
                    $(".inlinesparklineaval").sparkline gon.avals, type: "box", target: faval, lineColor: '#c6c6c6', whiskerColor: '#c6c6c6', boxFillColor: '#e8e9ed', spotRadius: 2.5, width: '250', outlierLineColor: '#303030', showOutliers: false, tooltipFormatFieldlistKey: 'field', medianColor: '#0015ff', targetColor: '#bf0000'   
                    $(".inlinesparklinerentocc").sparkline gon.rentoccs, type: "box", target: frentocc, lineColor: '#c6c6c6', whiskerColor: '#c6c6c6', boxFillColor: '#e8e9ed', spotRadius: 2.5, width: '250', outlierLineColor: '#303030', showOutliers: false, tooltipFormatFieldlistKey: 'field', medianColor: '#0015ff', targetColor: '#bf0000'   
                    $(".inlinesparklinehhnocar").sparkline gon.hhnocars, type: "box", target: fhhnocar, lineColor: '#c6c6c6', whiskerColor: '#c6c6c6', boxFillColor: '#e8e9ed', spotRadius: 2.5, width: '250', outlierLineColor: '#303030', showOutliers: false, tooltipFormatFieldlistKey: 'field', medianColor: '#0015ff', targetColor: '#bf0000'   
                    $(".inlinesparklineedatt").sparkline gon.edatts, type: "box", target: fedatt, lineColor: '#c6c6c6', whiskerColor: '#c6c6c6', boxFillColor: '#e8e9ed', spotRadius: 2.5, width: '250', outlierLineColor: '#303030', showOutliers: false, tooltipFormatFieldlistKey: 'field', medianColor: '#0015ff', targetColor: '#bf0000'  
            $(document).ready ->
                $("[rel=tooltipu]").tooltip placement: "top"
                $("#previousbuttom").click ->
                    console.log "inside previousClicked"
                    console.log gon.feature["0"].properties.name
                    thisFeature = _.find gon.searchresults, (key, value) -> gon.feature["0"].properties.name == key.properties.name
                    otherFeatures = _.without gon.searchresults, thisFeature
                    priviousFeature = _.first otherFeatures
                    console.log priviousFeature.properties.name
                    App.vent.trigger "searchFired", "by_name=#{priviousFeature.properties.name}"
                    #console.log otherFeatures
                    #console.log thisFeature
                    #window.location = "www.example.com/index.php?id=" + @id
                    #return
                    #console.log gon.searchresults  
                $("#nextbuttom").click ->
                    console.log "inside nextClicked"
                    console.log gon.length
                    thisFeature = _.find gon.searchresults, (key, value) -> gon.feature["0"].properties.name == key.properties.name
                    otherFeatures = _.without gon.searchresults, thisFeature
                    nextFeature = _.last otherFeatures
                    console.log nextFeature.properties.name
                    App.vent.trigger "searchFired", "by_name=#{nextFeature.properties.name}"
                $("#dialog-modal").dialog 
                    position:
                        at: "center"
                    autoOpen: false
                    closeOnEscape: true
                    height: 400
                    width: 600
                    show:
                        effect: "blind"
                        duration: 100  
                    hide:
                        effect: "blind"
                        duration: 100
    

                $("#dialog-chart").dialog 
                    position:
                        at: "left"
                        my: "center"
                        of: $("#chart")
                    autoOpen: false
                    closeOnEscape: true
                    height: 200
                    width: 300
                    show:
                        effect: "blind"
                        duration: 100  
                    hide:
                        effect: "blind"
                        duration: 100
                    title: 
                        "eTOD Score Components"

                $("#dialog-modal").dialog beforeClose: (event, ui) ->
                    $("#accordion").accordion "enable"

                $("#chart").click (event, ui) ->
                    sub1 = gon.feature["0"].properties.etod_sub1t
                    sub2 = gon.feature["0"].properties.etod_sub2o
                    sub3 = gon.feature["0"].properties.etod_sub3d
                    totscore = gon.feature["0"].properties.etod_total
                    $("#dialog-chart").dialog "open"
                    $("#dialog-chart").html("Transit Score: #{sub1}<br>Orientation Score: #{sub2}<br>Development Score: #{sub3}<br><hr>Total Score: #{totscore}")

                $("[rel=tooltipd]").click (event, ui) ->
                    console.log @.title
                    $("#accordion").accordion "disable"
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
                    
                        

			$("[rel=tooltip]").tooltip placement: "left"
			#$("[rel=tooltipd]").tooltip placement: "right"
			$("[rel=tooltip]").tooltip track: true
			$("#accordion").accordion 
                header: "hm3" 
                active: "false"
                heightStyle: "content"
                width: 600
                collapsible: true
                icons:
                    header: "ui-icon-plus"
                    activeHeader: "ui-icon-minus"
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
            console.log muni_names
            console.log names
            #@collection = names
            names = _.map stationfeature, (key, value) ->
                    names = (_.pluck key, 'name')
                    names[2].toLowerCase()
                console.log names
			# create some people
			station = [
			  {
			    name: names
			    municipality: muni_names
			  }
			]
			console.log stationfeature
			console.log station
		
		onShow: ->
			#@collection = gon.features
			console.log @collection


	class List.Table extends App.Views.Layout
		template: "fstations/list/templates/_table"
		onShow: ->
			tabulate = (data, columns) ->
			  table = d3.select("#table").append("table")
			  thead = table.append("thead")
			  tbody = table.append("tbody")
			  
			  # append the header row
			  thead.append("tr").selectAll("th").data(columns).enter().append("th").text (column) ->
			    column

			  
			  # create a row for each object in the data
			  rows = tbody.selectAll("tr").data(data).enter().append("tr")
			  
			  # create a cell in each row for each column
			  cells = rows.selectAll("td").data((row) ->
			    columns.map (column) ->
			      column: column
			      value: row[column]

			  ).enter().append("td").text((d) ->
			    d.value
			  )
			  table

			features = gon.features
			if features.length == 1
				stationfeature = gon.feature["0"]
				station = [
				  {
				    name: stationfeature.properties.name.toLowerCase()
				    municipality: stationfeature.properties.muni_name.toLowerCase()
				    vMT: stationfeature.properties.ov_vmthday
				  }
				]
			else
				stationfeature = gon.features
				muni_names = _.map stationfeature, (key, value) ->
                    muni_names = (_.pluck key, 'muni_name')
                    muni_names[2].toLowerCase()
                    names = (_.pluck key, 'name')
                    names[2].toLowerCase()
                console.log muni_names
                console.log names
	            names = _.map stationfeature, (key, value) ->
	                    names = (_.pluck key, 'name')
	                    names[2].toLowerCase()
	                console.log names
				# create some people
				station = [
				  {
				    name: names
				    municipality: muni_names
				  }
				]
			console.log stationfeature
			

			# render the table
			stationsTable = tabulate(station, [
			  "name"
			  "municipality"
			  "vMT"
			])

			# uppercase the column headers
			stationsTable.selectAll("thead th").text (column) ->
			  column.charAt(0).toUpperCase() + column.substr(1)


			# sort by age
			stationsTable.selectAll("tbody tr").sort (a, b) ->
			  d3.descending a.age, b.age



	class List.EmptyMap extends App.Views.Layout
		template: "fstations/list/templates/_empty_map"
		
	class List.Chart extends App.Views.Layout
		template: "fstations/list/templates/_chart"
		onShow: ->
			stationfeature = gon.feature["0"] 
			w = 200
			h = 200
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
			  ExtraWidthX: 300


			#Call function to draw the Radar chart
			#Will expect that data is in %'s
			RadarChart.draw "#chart", d, mycfg

			#//////////////////////////////////////////
			#///////// Initiate legend ////////////////
			#//////////////////////////////////////////
			svg = d3.select("#body").selectAll("svg").append("svg").attr("width", w + 300).attr("height", h)

			#Create the title for the legend
			text = svg.append("text").attr("class", "title").attr("transform", "translate(90,0)").attr("x", w - 70).attr("y", 10).attr("font-size", "12px").attr("fill", "#404040").text("eTOD Score Composite")

			#Initiate Legend	
			legend = svg.append("g").attr("class", "legend").attr("height", 100).attr("width", 200).attr("transform", "translate(90,20)")

			#Create text next to squares
			legend.selectAll("text").data(LegendOptions).enter().append("text").attr("x", w - 52).attr("y", (d, i) ->
			  i * 20 + 9
			).attr("font-size", "18px").attr("fill", "#737373").text (d) ->
			  d



	class List.Map extends App.Views.Layout
		template: "fstations/list/templates/_map"
		el: "#map"
		modelEvents:
		  "change" : "render"

		onShow: ->
			console.log "insede on show enevt list_view"
			console.log @collection
			console.log fstations
			map = L.map("map",
			  scrollWheelZoom: false
			  touchZoom: false
			  doubleClickZoom: true
			  zoomControl: true
			  dragging: true
			  maxZoom: 18
			)
			map.setView [
			  42.31
			  -71.077359
			], 10
			cloudmade = L.tileLayer("http://tiles.mapc.org/basemap/{z}/{x}/{y}.png",
			  attribution: 'Map tiles by <a href="http://leafletjs.com">MAPC</a>'
			).addTo(map)
			LeafIcon = L.Icon.extend(options:
			  	iconSize: [
			    	15
			    	15
			  	]
			  	popupAnchor: [
			    	-3
			    	-76
			  	]
				)
			stationIcon = new LeafIcon(iconUrl: "../../../../../../../../img/icon_97.png")
			@collection = gon.feature
			console.log @collection
			#fstations = JSON.parse(fstations)
			geoCollection = switch
                when gon.length < 2 then gon.feature
                else gon.features
            console.log "this is after the swith and the geoCollecyion is:"
			console.log geoCollection
			fstations = new L.GeoJSON geoCollection,
				style: (feature) ->
					feature.properties and feature.properties.style
				pointToLayer: (feature, latlng) ->
				    L.circle latlng, 250,
				      fillColor: "#FFFFFF"
				      color: "#000"
				      weight: 1
				      opacity: 0.2
				      fillOpacity: 0.4
			map.addLayer(fstations)
			fstation = new L.GeoJSON geoCollection,
				pointToLayer: (feature, latlng) ->
                    L.marker(latlng, icon: stationIcon).on 'click', (e)->
                        console.log feature
                        console.log App.vent.trigger "searchFired", "by_name=#{feature.properties.name}"
			map.addLayer(fstation)
			bbox = fstations.getBounds().toBBoxString()
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

	class List.MapDetail extends App.Views.Layout
        template: "fstations/list/templates/_map"
        el: "#map"
        modelEvents:
          "change" : "render"

        onShow: ->
            console.log "insede on show enevt list_view"
            console.log @collection
            console.log fstations
            map = L.map("map",
              scrollWheelZoom: false
              touchZoom: false
              doubleClickZoom: true
              zoomControl: true
              dragging: true
              maxZoom: 18
            )
            map.setView [
              42.31
              -71.077359
            ], 10
            cloudmade = L.tileLayer("http://tiles.mapc.org/basemap/{z}/{x}/{y}.png",
              attribution: 'Map tiles by <a href="http://leafletjs.com">MAPC</a>'
            ).addTo(map)
            LeafIcon = L.Icon.extend(options:
                iconSize: [
                    15
                    15
                ]
                popupAnchor: [
                    -3
                    -76
                ]
                )
            stationIcon = new LeafIcon(iconUrl: "../../../../../../../../img/icon_97.png")
            @collection = gon.feature
            console.log @collection
            geoCollection = switch
                when gon.length < 2 then gon.feature
                else gon.features
            #printProvider = L.print.provider(
            #    method: "GET"
            #    url: " http://path/to/mapfish/print"
            #    autoLoad: true
            #    dpi: 90
            #)
            fstations = new L.GeoJSON geoCollection,
                style: (feature) ->
                    feature.properties and feature.properties.style
                pointToLayer: (feature, latlng) ->
                    L.circle latlng, 250,
                      fillColor: "#FFFFFF"
                      color: "#000"
                      weight: 1
                      opacity: 0.2
                      fillOpacity: 0.4
            map.addLayer(fstations)
            fstation = new L.GeoJSON geoCollection,
                style: (feature) ->
                    feature.properties and feature.properties.style
                pointToLayer: (feature, latlng) ->
                    L.marker latlng, icon: stationIcon
            map.addLayer(fstation)
            console.log map.getBounds()
            bbox = fstations.getBounds().toBBoxString()
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
            #printControl = L.control.print(provider: printProvider)
            #map.addControl printControl

			




