# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$ ->
  $(".gallery-item").on "click", ->
    $(this).closest(".media-items").find(".main-gallery-image").attr("src", $(this).attr("data-img-lg"))
    $(this).closest(".media-items").find(".high-res-image").attr("href", $(this).attr("data-img-original"))

  $(".thumbnail-links").hover ->
    $(this).find('.project-overlay').slideToggle()

  # $(".thumbnail-links").on "mouseenter", ->
  #   $(this).animate
  #     "position": "absolute"
  #     "width": "200%"
  #     "height": "200%"
  #     "marginLeft": "-20%"
  #     "marginTop": "-20%"

  # $(".thumbnail-links").on "mouseleave", ->
  #   $(this).animate
  #     "width": "100%"
  #     "height": "100%"
  #     "marginLeft": "0%"
  #     "marginTop": "0%"
  #     "position": "relative"
# $(document).ready(function(){
#   $(".gallery-item").on("click", function({


#   });
# });
