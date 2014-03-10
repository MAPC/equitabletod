@Equitabletod.module "Entities", (Entities, App, Backbone, Marionette, $, _) ->

  class Entities.Fstation extends Entities.Model

  class Entities.Fstations extends Entities.Collection
    model: Entities.Fstation
  
  API =
      getFstationEntities: ->
          new Entities.Fstations [
                          {
                            "muni": "Boston",
                            "location": "42.60695437425236, 72.992694222399",
                            "station_name": "689 Lueilwitz Pine",
                            "vehicle_miles_traveled": "91351.1024313926"
                          },
                          {
                            "muni": "Brookline",
                            "location": "42.616342943209894, 70.99862224140912",
                            "station_name": "59762 Kiehn Branch",
                            "vehicle_miles_traveled": "35220.96878240332"
                          },
                          {
                            "muni": "Boston",
                            "location": "40.74935588199052, 70.36903506127108",
                            "station_name": "1971 Heaney Loop",
                            "vehicle_miles_traveled": "25828.29604683144"
                          },
                          {
                            "muni": "Malden",
                            "location": "42.52381061977313, 70.22045415586543",
                            "station_name": "3865 Gilda Ridge",
                            "vehicle_miles_traveled": "51281.65639362494"
                          },
                          {
                            "muni": "Boston",
                            "location": "40.27732712829793, 71.84946839447203",
                            "station_name": "2179 Emmet Union",
                            "vehicle_miles_traveled": "80859.42852290759"
                          },
                          {
                            "muni": "Cambridge",
                            "location": "41.5193692391427, 71.81407158555264",
                            "station_name": "30371 Angeline Light",
                            "vehicle_miles_traveled": "13511.74021060102"
                          },
                          {
                            "muni": "Malden",
                            "location": "42.3650054386412, 71.09501617180462",
                            "station_name": "10055 Elva Mount",
                            "vehicle_miles_traveled": "64223.00646508707"
                          },
                          {
                            "muni": "Brookline",
                            "location": "42.21295274608193, 72.17357496690445",
                            "station_name": "506 Timothy Hollow",
                            "vehicle_miles_traveled": "58249.39757664184"
                          }
          ]

  App.reqres.setHandler 'fstation:entities', ->
    API.getFstationEntities()
    