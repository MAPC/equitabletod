@Equitabletod.module "Entities", (Entities, App, Backbone, Marionette, $, _) ->

  class Entities.Slider extends Backbone.Model
  	defaults:
  		name: ""
  		all_values: []
  		maxvalue: 0.00
  		minvalue: 0.00


  class Entities.Sliders extends Backbone.Collection
    model: Entities.Slider

  API = 
    setSlider: (attr_name, all_values, maxvalue, minvalue) ->
      slider = new Entities.Slider (name: attr_name, all_values: all_values, maxvalue: maxvalue, minvalue: minvalue)
      return slider

  App.reqres.setHandler "set:slider", (attr_name, all_values, maxvalue, minvalue)->
    API.setSlider attr_name, all_values, maxvalue, minvalue