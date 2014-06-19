@Equitabletod.module "PrintApp.List", (List, App, Backbone, Marionette, $, _) ->

	class List.Layout extends App.Views.Layout
		template: "print/list/templates/list_layout"
		regions: 
			mapRegion: "#map-region"
			fstationsRegion: "#fstations-region-print"
			chartRegion: "#chart-region"

	class List.Detstation extends App.Views.ItemView
		template: "print/list/templates/_detstation"
		tagName: "tr"
		onShow: ->
			allfeaturesResponse = $.ajax
                	url: "/search.json?by_name="
                	done: (result) =>
                    	return result
            allfeature = allfeaturesResponse.complete()
            allfeature.done =>
                ###if _.isEmpty gon.features
                    allfeatures = allfeature.responseJSON
                    features = _.values allfeatures.features
                else if (gon.feature != gon.features) and (gon.searchresults = [])
                    features = gon.features 
                else###
                allfeatures = allfeature.responseJSON
                features = _.values allfeatures.features # this returns an array of each features obkect
                console.log features 
                console.log gon.features
                fars = _.map features, (key, value) -> key.properties.ov_far.toFixed 2
                vmts = _.map features, (key, value) -> key.properties.ov_vmthday.toFixed 2
                pcttrans = _.map features, (key, value) -> (key.properties.ov_pcttran.toFixed 2) * 100
                prkacs = _.map features, (key, value) -> key.properties.ov_prkac.toFixed 2
                emp10s = _.map features, (key, value) -> key.properties.ov_emp10.toFixed 2
                extaxrevs = _.map features, (key, value) -> key.properties.ex_taxrev.toFixed 0
                hh10s = _.map features, (key, value) -> key.properties.ov_hh10.toFixed 0
                hhincs = _.map features, (key, value) -> key.properties.ov_hhinc.toFixed 0
                vehphhs = _.map features, (key, value) -> key.properties.ov_vehphh.toFixed 4
                trnpcmis = _.map features, (key, value) -> (key.properties.ov_trnpcmi.toFixed 4) * 100 if key.properties.ov_trnpcmi
                ghgs = _.map features, (key, value) -> key.properties.ov_ghg.toFixed 4 if key.properties.ov_ghg
                intntots = _.map features, (key, value) -> key.properties.ov_intntot if key.properties.ov_intntot
                mixs = _.map features, (key, value) -> key.properties.ov_mix.toFixed 4 if key.properties.ov_mix
                hupacs = _.map features, (key, value) -> key.properties.ov_hupac.toFixed 6 if key.properties.ov_hupac
                empdens = _.map features, (key, value) -> key.properties.ov_empden.toFixed 2 if key.properties.ov_empden
                est10s = _.map features, (key, value) -> key.properties.ov_est_10.toFixed 4 if key.properties.ov_est_10
                avals = _.map features, (key, value) -> key.properties.ov_aval.toFixed 0 if key.properties.ov_aval
                rentoccs = _.map features, (key, value) -> (key.properties.ov_rentocc.toFixed 4) * 100 if key.properties.ov_rentocc
                hhnocars = _.map features, (key, value) -> (key.properties.ov_hhnocar.toFixed 4) * 100 if key.properties.ov_hhnocar
                edatts = _.map features, (key, value) -> key.properties.ov_ed_att.toFixed 2 if key.properties.ov_ed_att
                walkscores = _.map features, (key, value) -> key.properties.walkscore.toFixed 2 if key.properties.walkscore

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
                gon.walkscores = walkscores

                fvmt = gon.feature["0"].properties.ov_vmthday.toFixed 4
                ffar = gon.feature["0"].properties.ov_far.toFixed 4
                fpcttran = (gon.feature["0"].properties.ov_pcttran.toFixed 4) * 100
                femp10 = gon.feature["0"].properties.ov_emp10.toFixed 4
                fprkac = gon.feature["0"].properties.ov_prkac.toFixed 4
                fextaxrev = gon.feature["0"].properties.ex_taxrev.toFixed 4
                fhh10 = gon.feature["0"].properties.ov_hh10.toFixed 4
                fhhinc = gon.feature["0"].properties.ov_hhinc.toFixed 4
                $(".inlinesparklinevmt").sparkline gon.vmts, type: "box", target: fvmt, lineColor: '#7f7e7e', whiskerColor: '#7f7e7e', boxFillColor: '#ffffff', spotRadius: 2.5, width: '250', outlierLineColor: '#303030', showOutliers: false, tooltipFormatFieldlistKey: 'field', medianColor: '#7f7e7e', targetColor: '#bf0000'     
                $(".inlinesparklinefar").sparkline gon.fars, type: "box", target: ffar, lineColor: '#7f7e7e', whiskerColor: '#7f7e7e', boxFillColor: '#ffffff', spotRadius: 2.5, width: '290', outlierLineColor: '#303030', showOutliers: false, tooltipFormatFieldlistKey: 'field', medianColor: '#7f7e7e', targetColor: '#bf0000'
                $(".inlinesparklinepcttran").sparkline gon.pcttrans, type: "box", target: fpcttran, lineColor: '#7f7e7e', whiskerColor: '#7f7e7e', boxFillColor: '#ffffff', spotRadius: 2.5, width: '250', outlierLineColor: '#303030', showOutliers: false, tooltipFormatFieldlistKey: 'field', medianColor: '#7f7e7e', targetColor: '#bf0000'
                $(".inlinesparklineprkac").sparkline gon.prkacs, type: "box", target: fprkac, lineColor: '#7f7e7e', whiskerColor: '#7f7e7e', boxFillColor: '#ffffff', spotRadius: 2.5, width: '250', outlierLineColor: '#303030', showOutliers: false, tooltipFormatFieldlistKey: 'field', medianColor: '#7f7e7e', targetColor: '#bf0000'       
                $(".inlinesparklineemp10").sparkline gon.emp10s, type: "box", target: femp10, lineColor: '#7f7e7e', whiskerColor: '#7f7e7e', boxFillColor: '#ffffff', spotRadius: 2.5, width: '250', outlierLineColor: '#303030', showOutliers: false, tooltipFormatFieldlistKey: 'field', medianColor: '#7f7e7e', targetColor: '#bf0000'       
                $(".inlinesparklineextaxrev").sparkline gon.extaxrevs, type: "box", target: fextaxrev, lineColor: '#7f7e7e', whiskerColor: '#7f7e7e', boxFillColor: '#ffffff', spotRadius: 2.5, width: '250', outlierLineColor: '#303030', showOutliers: false, tooltipFormatFieldlistKey: 'field', medianColor: '#7f7e7e', targetColor: '#bf0000'      
                $(".inlinesparklinehh10").sparkline gon.hh10s, type: "box", target: fhh10, lineColor: '#7f7e7e', whiskerColor: '#7f7e7e', boxFillColor: '#ffffff', spotRadius: 2.5, width: '250', outlierLineColor: '#303030', showOutliers: false, tooltipFormatFieldlistKey: 'field', medianColor: '#7f7e7e', targetColor: '#bf0000'      
                $(".inlinesparklinehhinc").sparkline gon.hhincs, type: "box", target: fhhinc, lineColor: '#7f7e7e', whiskerColor: '#7f7e7e', boxFillColor: '#ffffff', spotRadius: 2.5, width: '250', outlierLineColor: '#303030', showOutliers: false, tooltipFormatFieldlistKey: 'field', medianColor: '#7f7e7e', targetColor: '#bf0000'

                fvehphh = gon.feature["0"].properties.ov_vehphh.toFixed 4
                ftrnpcmi = (gon.feature["0"].properties.ov_trnpcmi.toFixed 4) * 100 if gon.feature["0"].properties.ov_trnpcmi
                fghg = gon.feature["0"].properties.ov_ghg.toFixed 4 if gon.feature["0"].properties.ov_ghg
                fintntot = gon.feature["0"].properties.ov_intntot if gon.feature["0"].properties.ov_intntot
                fmix = gon.feature["0"].properties.ov_mix.toFixed 4 if gon.feature["0"].properties.ov_mix
                fhupac = gon.feature["0"].properties.ov_hupac.toFixed 2 if gon.feature["0"].properties.ov_hupac
                fempden = gon.feature["0"].properties.ov_empden.toFixed 2 if gon.feature["0"].properties.ov_empden
                fest10 = gon.feature["0"].properties.ov_est_10.toFixed 4 if gon.feature["0"].properties.ov_est_10
                faval = gon.feature["0"].properties.ov_aval.toFixed 0 if gon.feature["0"].properties.ov_aval
                frentocc = (gon.feature["0"].properties.ov_rentocc.toFixed 4) * 100 if gon.feature["0"].properties.ov_rentocc
                fhhnocar = (gon.feature["0"].properties.ov_hhnocar.toFixed 4) * 100 if gon.feature["0"].properties.ov_hhnocar
                fedatt = gon.feature["0"].properties.ov_ed_att.toFixed 2 if gon.feature["0"].properties.ov_ed_att
                fwalkscore = gon.feature["0"].properties.walkscore.toFixed 2 if gon.feature["0"].properties.walkscore
                $(".inlinesparklinevehphh").sparkline gon.vehphhs, type: "box", target: fvehphh, lineColor: '#7f7e7e', whiskerColor: '#7f7e7e', boxFillColor: '#ffffff', spotRadius: 2.5, width: '310', outlierLineColor: '#303030', showOutliers: false, tooltipFormatFieldlistKey: 'field', medianColor: '#7f7e7e', targetColor: '#bf0000' 
                $(".inlinesparklinetrnpcmi").sparkline gon.trnpcmis, type: "box", target: ftrnpcmi, lineColor: '#7f7e7e', whiskerColor: '#7f7e7e', boxFillColor: '#ffffff', spotRadius: 2.5, width: '250', outlierLineColor: '#303030', showOutliers: false, tooltipFormatFieldlistKey: 'field', medianColor: '#7f7e7e', targetColor: '#bf0000' 
                $(".inlinesparklineghg").sparkline gon.ghgs, type: "line", target: fghg, lineColor: '#7f7e7e', whiskerColor: '#7f7e7e', boxFillColor: '#ffffff', spotRadius: 2.5, width: '250', outlierLineColor: '#303030', showOutliers: true, tooltipFormatFieldlistKey: 'field', medianColor: '#7f7e7e', targetColor: '#bf0000'    
                $(".inlinesparklineintntot").sparkline gon.intntots, type: "box", target: fintntot, lineColor: '#7f7e7e', whiskerColor: '#7f7e7e', boxFillColor: '#ffffff', spotRadius: 2.5, width: '250', outlierLineColor: '#303030', showOutliers: false, tooltipFormatFieldlistKey: 'field', medianColor: '#7f7e7e', targetColor: '#bf0000'    
                $(".inlinesparklinemix").sparkline gon.mixs, type: "box", target: fmix, lineColor: '#7f7e7e', whiskerColor: '#7f7e7e', boxFillColor: '#ffffff', spotRadius: 2.5, width: '510', outlierLineColor: '#303030', showOutliers: false, tooltipFormatFieldlistKey: 'field', medianColor: '#7f7e7e', targetColor: '#bf0000'   
                $(".inlinesparklinehupac").sparkline gon.hupacs, type: "line", target: fhupac, lineColor: '#7f7e7e', whiskerColor: '#7f7e7e', boxFillColor: '#ffffff', spotRadius: 2.5, width: '250', outlierLineColor: '#303030', showOutliers: false, tooltipFormatFieldlistKey: 'field', medianColor: '#7f7e7e', targetColor: '#bf0000'   
                $(".inlinesparklineempden").sparkline gon.empdens, type: "line", target: fempden, lineColor: '#7f7e7e', whiskerColor: '#7f7e7e', boxFillColor: '#ffffff', spotRadius: 2.5, width: '250', outlierLineColor: '#303030', showOutliers: false, tooltipFormatFieldlistKey: 'field', medianColor: '#7f7e7e', targetColor: '#bf0000'   
                $(".inlinesparklineest10").sparkline gon.est10s, type: "box", target: fest10, lineColor: '#7f7e7e', whiskerColor: '#7f7e7e', boxFillColor: '#ffffff', spotRadius: 2.5, width: '250', outlierLineColor: '#303030', showOutliers: false, tooltipFormatFieldlistKey: 'field', medianColor: '#7f7e7e', targetColor: '#bf0000'   
                $(".inlinesparklineaval").sparkline gon.avals, type: "box", target: faval, lineColor: '#7f7e7e', whiskerColor: '#7f7e7e', boxFillColor: '#ffffff', spotRadius: 2.5, width: '250', outlierLineColor: '#303030', showOutliers: false, tooltipFormatFieldlistKey: 'field', medianColor: '#7f7e7e', targetColor: '#bf0000'   
                $(".inlinesparklinerentocc").sparkline gon.rentoccs, type: "box", target: frentocc, lineColor: '#7f7e7e', whiskerColor: '#7f7e7e', boxFillColor: '#ffffff', spotRadius: 2.5, width: '250', outlierLineColor: '#303030', showOutliers: false, tooltipFormatFieldlistKey: 'field', medianColor: '#7f7e7e', targetColor: '#bf0000'   
                $(".inlinesparklinehhnocar").sparkline gon.hhnocars, type: "line", target: fhhnocar, lineColor: '#7f7e7e', whiskerColor: '#7f7e7e', boxFillColor: '#ffffff', spotRadius: 2.5, width: '250', outlierLineColor: '#303030', showOutliers: false, tooltipFormatFieldlistKey: 'field', medianColor: '#7f7e7e', targetColor: '#bf0000'   
                $(".inlinesparklineedatt").sparkline gon.edatts, type: "box", target: fedatt, lineColor: '#7f7e7e', whiskerColor: '#7f7e7e', boxFillColor: '#ffffff', spotRadius: 2.5, width: '580', outlierLineColor: '#303030', showOutliers: false, tooltipFormatFieldlistKey: 'field', medianColor: '#7f7e7e', targetColor: '#bf0000' 
                $(".inlinesparklinewalkscore").sparkline gon.walkscores, type: "box", target: fwalkscore, lineColor: '#7f7e7e', whiskerColor: '#7f7e7e', boxFillColor: '#ffffff', spotRadius: 2.5, width: '250', outlierLineColor: '#303030', showOutliers: false, tooltipFormatFieldlistKey: 'field', medianColor: '#7f7e7e', targetColor: '#bf0000' 
           
            $(document).ready -> 
                $("body").removeClass "nav-expanded"
                $("#print-region").prepend '<a class="print-preview" style="display: None;"><p></p>&nbsp;&nbsp;&nbsp;&nbsp;<button id="print-preview" type="button" class="btn btn-default btn3d col-xs-offset-0"></button></a>'
                $("a.print-preview").printPreview()
                $("#titles").html "<p class='h4'>Stations Area Details</br> #{gon.feature['0'].properties.name}</p>"
                $("#navigationsb").html "<p></p>"
                $("#header-region").html "<p></p>"
                $("#footer-region").html "<p></p>"
                setTimeout (->
                    console.log "inside the timeout"
                    $("#print-preview").click()
                    ), 1000

	class List.Detstations extends App.Views.CollectionView
		template: "print/list/templates/_detstations"
		itemView: List.Detstation
		itemViewContainer: "tbody"

	class List.Fstation extends App.Views.ItemView
		template: "print/list/templates/_fstation"
		tagName: "tr"            

	class List.Fstations extends App.Views.CollectionView
		template: "print/list/templates/_fstations"
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
            pfeatures = _.values gon.features
            pjfeatures = pfeatures.map (pf) -> pf.properties
            jfeatures = JSON.stringify(pjfeatures)
            console.log jfeatures
            $("#titles").html "<p class='h2'>Search Results</p>"
            $("#dllink").html "<button id='download' type='button' class='btn btn-default btn3d col-xs-offset-0'>Download This Data</button>"
            $("#panel").html "<a href='#advsearch/' id='searchrefine'><button type='button' class='btn btn-default btn3d col-xs-offset-0'>Refine Results</button></a>"
            
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

	class List.Table extends App.Views.Layout
		template: "print/list/templates/_table"
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

		
	class List.Chart extends App.Views.Layout
		template: "print/list/templates/_chart"
		onShow: ->
			stationfeature = gon.feature["0"] 
			w = 100
			h = 100
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
			RadarChart.draw "#chartprint", d, mycfg


	class List.MapDetail extends App.Views.Layout
        template: "print/list/templates/_map"
        el: "#mapPrint"
        modelEvents:
          "change" : "render"
        onBeforeClose: ->
            $("#nav-expander").html '<i class="fa fa-bars fa-md black"></i>'  
        onShow: ->
            $("#nav-expander").html ""
            L.Control.Attribution::options.prefix = ""
            mapPrint = L.map("mapPrint",
              scrollWheelZoom: false
              touchZoom: false
              doubleClickZoom: true
              zoomControl: false
              dragging: true
            )

            

            mapc = L.tileLayer("http://tiles.mapc.org/basemap/{z}/{x}/{y}.png"
            ).addTo(mapPrint)
            #defaultLayer = L.tileLayer.provider("OpenStreetMap.Mapnik").addTo(map)
            #streets = L.tileLayer.provider "MapBox.mapc.i8ddbf5a"
            #esri = L.tileLayer.provider "Esri.WorldImagery"
            #esring = L.tileLayer.provider "Esri.NatGeoWorldMap"
            #esrism = L.tileLayer.provider "Esri.WorldStreetMap"
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
                
            geoCollection =  gon.feature

            fstation = new L.GeoJSON geoCollection,
                style: (feature) ->
                    feature.properties and feature.properties.style
                pointToLayer: (feature, latlng) ->
                    L.circle latlng, 804.672,
                      fillColor: "#FFFFFF"
                      color: "#000"
                      weight: 1
                      opacity: 0.4
                      fillOpacity: 0.1
            mapPrint.addLayer(fstation)
            L.control.scale().addTo(mapPrint)
            bbox = fstation.getBounds().toBBoxString()
            console.log bbox
            mapPrint.fitBounds [
              [
                parseFloat(bbox.split(",")[1])
                parseFloat(bbox.split(",")[0])
              ]
              [
                parseFloat(bbox.split(",")[3])
                parseFloat(bbox.split(",")[2])
              ]
            ]
            L.Control.Attribution::options.prefix = '<a href="http://leafletjs.com" title="A JS library for interactive maps">Leaflet</a>'
			




