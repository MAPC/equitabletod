@Equitabletod.module "MainApp.Carousel", (Carousel, App, Backbone, Marionette, $, _) ->

  Carousel.Controller =

  	showCarousel: ->
  		carouselView = @getCarousel()
  		App.carouselRegion.show carouselView
  	
  	getCarousel: ->
  		new Carousel.CarouselView