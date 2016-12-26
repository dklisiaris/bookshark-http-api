# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).ready ->
  Tipped.create('#clipboard-btn')

  clip = new ZeroClipboard($('#clipboard-btn'))
  $('#clipboard-btn').on 'click', ->
    $('#clipboard-text').select()
    return
  return
