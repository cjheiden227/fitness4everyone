# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).ready ->
  $('.fail').hide()
  $('.sent').hide()
	$(document).bind "ajaxSuccess", "form.new_contact", (event, xhr, settings) ->
		$('.fail').hide()
		$('.sent').hide()
		#ToDo
		#Create inline message and update text in modal
		$('#modalTitle').addClass('sent').text('Message Sent!')
		$('.progress').addClass('success')
		$('.sent').fadeIn()	
		$('.meter').width "100%"
		$('.progress').removeClass('sucess')
		$('form.new_contact').trigger('reset')
		$('form.new_contact').resetClientSideValidations();
	$(document).bind "ajaxError", "form.new_contact", (event, jqxhr, settings, exception) ->
		$('.fail').hide()
		$('.sent').hide()
		#ToDo
		#create error message from ajax error object
		$('.fail').fadeIn()
		$('.progress').removeClass('success').addClass('alert')
		$('.meter').width "75%"

