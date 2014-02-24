Equitabletod.Views.StationAreas ||= {}

class Equitabletod.Views.StationAreas.NewView extends Backbone.View
  template: JST["backbone/templates/station_areas/new"]

  events:
    "submit #new-station_area": "save"

  constructor: (options) ->
    super(options)
    @model = new @collection.model()

    @model.bind("change:errors", () =>
      this.render()
    )

  save: (e) ->
    e.preventDefault()
    e.stopPropagation()

    @model.unset("errors")

    @collection.create(@model.toJSON(),
      success: (station_area) =>
        @model = station_area
        window.location.hash = "/#{@model.id}"

      error: (station_area, jqXHR) =>
        @model.set({errors: $.parseJSON(jqXHR.responseText)})
    )

  render: ->
    $(@el).html(@template(@model.toJSON() ))

    this.$("form").backboneLink(@model)

    return this
