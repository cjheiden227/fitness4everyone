# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).ready ->
  $('form.new_contact').submit ()->
    $('.icon').hide()
    $('.spinner').show()
    $('.lead').text('Sending Message...')

    $('.modal-area').removeClass('sent fail')
  $(document).bind "ajaxSuccess", "form.new_contact", (event, xhr, settings) ->
    $('.spinner').hide()
    $('.sent').show()	
    $('.modal-area').addClass('sent')
    $('.lead').text('Message Sent!')
    $('form.new_contact').trigger('reset').resetClientSideValidations()
 
    
  $(document).bind "ajaxError", "form.new_contact", (event, jqxhr, settings, exception) ->
    $('.spinner').hide()
    $('.fail').show()
    $('.lead').text('Oops!  Something went wrong!')
    $('.modal-area').addClass('fail').append("<p> Here's what we think went wrong: </p>")
    response = JSON.parse(jqxhr.responseText)
    $.each response.errors, (key, value) ->
      $('.modal-area').append("<p> #{key} #{value} </p>")
