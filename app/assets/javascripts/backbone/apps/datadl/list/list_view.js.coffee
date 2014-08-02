@Equitabletod.module "DatadlApp.List", (List, App, Backbone, Marionette, $, _) ->

	class List.Layout extends App.Views.Layout
		template: "datadl/list/templates/_layout"
		regions: 
			datadlRegion: "#datadl-region"
		
		onShow: ->
			$(document).ready -> 
                $("html, body").animate
                  scrollTop: 0
                , 600
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
                

			JSON2CSV = (objArray) ->
			  array = (if typeof objArray isnt "object" then JSON.parse(objArray) else objArray)
			  str = ""
			  line = ""
			  if $("#labels").is(":checked")
			    head = array[0]
			    if $("#quote").is(":checked")
			      for index of array[0]
			        value = index + ""
			        line += "\"" + value.replace(/"/g, "\"\"") + "\","
			    else
			      for index of array[0]
			        line += index + ","
			    line = line.slice(0, -1)
			    str += line + "\r\n"
			  i = 0

			  while i < array.length
			    line = ""
			    if $("#quote").is(":checked")
			      for index of array[i]
			        value = array[i][index] + ""
			        line += "\"" + value.replace(/"/g, "\"\"") + "\","
			    else
			      for index of array[i]
			        line += array[i][index] + ","
			    line = line.slice(0, -1)
			    str += line + "\r\n"
			    i++
			  str

			$("#download").click ->
			  json = $.parseJSON(gon.jfeatures)
			  csv = JSON2CSV(json)
			  window.open "data:text/csv;charset=utf-8," + escape(csv)
			  return

		events:
			"click #guidClick": "guidFired"

		guidFired: (e) =>
			App.vent.trigger "guidFired"
