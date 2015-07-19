# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
# TODO: Create progress bar logic.
$(document).ready ->
	$('.fail').hide()
	$('.sent').hide()
 
	$('form.new_contact').submit (e)->
	  $('.fail').hide()
	  $('.sent').hide()
	  # console.log $(this).valid()
	  if $(this).valid()
	    $('#contact-modal').foundation 'reveal', 'open'
	    $('.progress').removeClass('success alert')

	$(document).bind "ajaxSuccess", "form.new_contact", (event, xhr, settings) ->
		$('.progress').addClass('success')
		$('#modal-email').hide()
		$('.sent').fadeIn()	
		$('.meter').width "100%"
		$('.progress').removeClass('sucess')

	$(document).bind "ajaxError", "form.new_contact", (event, jqxhr, settings, exception) ->
		$('#modal-email').hide()
		$('.fail').fadeIn()
		$('.progress').removeClass('success').addClass('alert')
		$('.meter').width "75%"


	$('#new_contact').validate
        errorPlacement: (error, element) ->
            element.prev().addClass 'label-error'
            element.prev().after error
        rules:
            'contact[name]' : {required: true},
            'contact[email]': {required: true, email: true},
            'contact[phone]': {required: true, phoneUS: true}, 
            'contact[message]' : {required: true}
        messages: 
             'contact[name]': {
                required: "We need your name to contact you"
            },
            'contact[email]': {
                required: "We need your email address to contact you",
                email: "Email address must be in the format of name@domain.com"
            },
            'contact[phone]': {
                required: "We need your phone number contact you",
                phoneUS: "Please enter a valid phone number"
            },
             'contact[message]': {
                required: "We need a message"
            }

  	$('#new_contact .input').on 'blur', ->
  		console.log $(this).valid()
  		if ($(this).valid())
            $(this).prev().prev().removeClass('label-error')
        else
            $(this).prev().prev().addClass('label-error')