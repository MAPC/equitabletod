Equitabletod.Views.StationAreas ||= {}

class Equitabletod.Views.StationAreas.IndexView extends Backbone.View
  template: JST["backbone/templates/station_areas/index"]

  initialize: () ->
    @options.stationAreas.bind('reset', @addAll)

  addAll: () =>
    @options.stationAreas.each(@addOne)

  addOne: (stationArea) =>
    view = new Equitabletod.Views.StationAreas.StationAreaView({model : stationArea})
    @$("tbody").append(view.render().el)

  render: =>
    $(@el).html(@template(stationAreas: @options.stationAreas.toJSON() ))
    @addAll()

    return this
