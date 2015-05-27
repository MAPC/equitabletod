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

            # $("#downloadguide").click ->
            #   spinopts =
            #       lines: 13 # The number of lines to draw
            #       length: 20 # The length of each line
            #       width: 10 # The line thickness
            #       radius: 30 # The radius of the inner circle
            #       corners: 1 # Corner roundness (0..1)
            #       rotate: 0 # The rotation offset
            #       direction: 1 # 1: clockwise, -1: counterclockwise
            #       color: "#000" # #rgb or #rrggbb or array of colors
            #       speed: 1 # Rounds per second
            #       trail: 60 # Afterglow percentage
            #       shadow: false # Whether to render a shadow
            #       hwaccel: false # Whether to use hardware acceleration
            #       className: "spinner" # The CSS class to assign to the spinner
            #       zIndex: 2e9 # The z-index (defaults to 2000000000)
            #       top: "50%" # Top position relative to parent
            #       left: "50%" # Left position relative to parent

            #   spintarget = document.getElementById("main-region")
            #   spinner = new Spinner(spinopts).spin(spintarget)
            #   dictionaryResponse = $.ajax
            #                   url: "/dictionary_entries.json?by_name="
            #                   done: (result) =>
            #                       return result
              
            #   dictionary = dictionaryResponse.complete()
            #   dictionary.done =>
            #       dictionaries = dictionary.responseJSON
            #       gon.dictionaries = JSON.stringify(dictionaries)
            #       # console.log gon.dictionaries
            #       doctjson = $.parseJSON(gon.dictionaries)
            #       dictcsv = JSON2CSV(doctjson)

            #       # Data URI
            #       dictcsvData = "data:application/csv;charset=utf-8," + encodeURIComponent(dictcsv)
            #       $(this).attr
            #         # download: "DataDictionary.csv"
            #         href: dictcsvData
            #         target: "_blank"
            #       return

		events:
			"click #downloadguide": "guidFired"

		guidFired: (e) =>
			App.vent.trigger "guidFired"
