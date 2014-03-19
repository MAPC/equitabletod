@Equitabletod.module "Views", (Views, App, Backbone, Marionette, $, _) ->

  _.extend Marionette.View::,

    templateHelpers: ->

    	###munisList:
    		App.request("get:munis:munis").toJSON()###