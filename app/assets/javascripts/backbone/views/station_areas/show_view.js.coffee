Equitabletod.Views.StationAreas ||= {}

class Equitabletod.Views.StationAreas.ShowView extends Backbone.View
  template: JST["backbone/templates/station_areas/show"]

  render: ->
    $(@el).html(@template(@model.toJSON() ))
    return this
