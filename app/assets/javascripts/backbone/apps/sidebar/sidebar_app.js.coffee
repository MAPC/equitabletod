@Equitabletod.module "SidebarApp", (SidebarApp, App, Backbone, Marionette, $, _) ->
  @startWithParent = false

  API =
    listSidebar: ->
      SidebarApp.List.Controller.listSidebar()

    
  
  SidebarApp.on "start", ->
    API.listSidebar()