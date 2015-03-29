# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

@scrollToElement = (el, ms) ->
  speed = if ms then ms else 300
  $('html,body').animate { scrollTop: $(el).offset().top }, speed
  return

hljs.initHighlightingOnLoad()  
