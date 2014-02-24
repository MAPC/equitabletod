Equitabletod.Views.StationAreas ||= {}

class Equitabletod.Views.StationAreas.StationAreaView extends Backbone.View
  template: JST["backbone/templates/station_areas/station_area"]

  events:
    "click .destroy" : "destroy"

  tagName: "tr"

  destroy: () ->
    @model.destroy()
    this.remove()

    return false

  render: ->
    $(@el).html(@template(@model.toJSON() ))
    return this
