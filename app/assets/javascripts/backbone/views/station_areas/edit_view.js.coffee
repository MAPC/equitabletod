Equitabletod.Views.StationAreas ||= {}

class Equitabletod.Views.StationAreas.EditView extends Backbone.View
  template : JST["backbone/templates/station_areas/edit"]

  events :
    "submit #edit-station_area" : "update"

  update : (e) ->
    e.preventDefault()
    e.stopPropagation()

    @model.save(null,
      success : (station_area) =>
        @model = station_area
        window.location.hash = "/#{@model.id}"
    )

  render : ->
    $(@el).html(@template(@model.toJSON() ))

    this.$("form").backboneLink(@model)

    return this
