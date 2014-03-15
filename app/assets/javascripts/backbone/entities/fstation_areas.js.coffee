@Equitabletod.module "Entities", (Entities, App, Backbone, Marionette, $, _) ->

<<<<<<< HEAD
  class Entities.Fstation extends Backbone.Leaflet.GeoModel
    
  class Entities.FstationsCollection extends Backbone.Leaflet.GeoCollection
    url: "/station_areas.json"

  API =
  	getFstationsEntities: ->
        fstations = new Entities.FstationsCollection
        fstations.fetch()
=======
  class Entities.Fstation extends Entities.Model
    urlRoot: "/station_areas"
  
  class Entities.FstationsCollection extends Entities.Collection
  	model: Entities.Fstation
  	url: "/station_areas.json"

  API =
  	getFstationsEntities: ->
  	    fstations = new Entities.FstationsCollection
  	    fstations.fetch()
>>>>>>> parent of c5fce05... leaflet loaded

  	getFstation: (stn_id) ->
  	    fstation = new Entities.Fstation({ id: stn_id })
  	    fstation.fetch()

  App.reqres.setHandler 'fstation:entities', ->
      API.getFstationsEntities()
<<<<<<< HEAD
      
=======
>>>>>>> parent of c5fce05... leaflet loaded

  App.reqres.setHandler 'fstation:entity', (stn_id) ->
      API.getFstation(stn_id)