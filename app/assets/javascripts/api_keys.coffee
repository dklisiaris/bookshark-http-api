# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).ready ->
  Tipped.create('.api-key-tooltip')

  client = new ZeroClipboard($(".api-key-tooltip"))
  client.on 'copy', (event) ->    
    clipboard = event.clipboardData
    clipboard.setData 'text/plain', event.target.innerText
    return
