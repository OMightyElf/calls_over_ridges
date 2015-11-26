# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/


$(document).ready ->
  $("#covers-bxslider").bxSlider({
    pager: false
    auto: true
    controls: false
    autoStart: true
    pause: 2000
    infiniteLoop: true
    })