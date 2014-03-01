@Equitabletod.module "SidebarApp.List", (List, App, Backbone, Marionette, $, _) ->

  List.Controller =

    listSidebar: ->
    	links = App.request "sidebar:entities"

    	sidebarView = @getSidebarView links
    	App.sidebarRegion.show sidebarView

    getSidebarView: (links) ->
    	new List.Layout