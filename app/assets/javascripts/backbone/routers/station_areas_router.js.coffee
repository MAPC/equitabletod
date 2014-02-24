class Equitabletod.Routers.StationAreasRouter extends Backbone.Router
  initialize: (options) ->
    @stationAreas = new Equitabletod.Collections.StationAreasCollection()
    @stationAreas.reset options.stationAreas

  routes:
    "new"      : "newStationArea"
    "index"    : "index"
    ":id/edit" : "edit"
    ":id"      : "show"
    ".*"        : "index"

  newStationArea: ->
    @view = new Equitabletod.Views.StationAreas.NewView(collection: @station_areas)
    $("#station_areas").html(@view.render().el)

  index: ->
    @view = new Equitabletod.Views.StationAreas.IndexView(station_areas: @station_areas)
    $("#station_areas").html(@view.render().el)

  show: (id) ->
    station_area = @station_areas.get(id)

    @view = new Equitabletod.Views.StationAreas.ShowView(model: station_area)
    $("#station_areas").html(@view.render().el)

  edit: (id) ->
    station_area = @station_areas.get(id)

    @view = new Equitabletod.Views.StationAreas.EditView(model: station_area)
    $("#station_areas").html(@view.render().el)
