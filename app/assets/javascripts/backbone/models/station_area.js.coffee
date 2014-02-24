class Equitabletod.Models.StationArea extends Backbone.Model
  paramRoot: 'station_area'

  defaults: ->
    @get('id')

class Equitabletod.Collections.StationAreasCollection extends Backbone.Collection
  model: Equitabletod.Models.StationArea
  url: '/station_areas'
