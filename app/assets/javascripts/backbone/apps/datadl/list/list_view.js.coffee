@Equitabletod.module "DatadlApp.List", (List, App, Backbone, Marionette, $, _) ->

	class List.Layout extends App.Views.Layout
		template: "datadl/list/templates/_layout"
		regions: 
			datadlRegion: "#datadl-region"
		
		onShow: ->
			$(document).ready -> 
        allfeaturesResponse = $.ajax
              url: "/search.json?by_name="
              done: (result) =>
                  return result
        allfeature = allfeaturesResponse.complete()
        allfeature.done =>
            allfeatures = allfeature.responseJSON
            features = _.values allfeatures.features
            pfeatures = _.values allfeatures.features
            pjfeatures = pfeatures.map (pf) -> pf.properties
            gon.jfeatures = JSON.stringify(pjfeatures)
        # $("html, body").animate
        #   scrollTop: 0
        # , 600
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

            $("#downloader").click ->
              exportTableToCSV.apply this, [
                gon.jfeatures
                "tstationinfo.csv"
              ]
              return

		events:
			"click #guidClick": "guidFired"

		guidFired: (e) =>
			App.vent.trigger "guidFired"
