window.ClientSideValidations.validators.local["email_format"] = function(element, options) {
  if (!/^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i.test(element.val())) {
    return options.message;
  }
}

window.ClientSideValidations.formBuilders['ActionView::Helpers::FormBuilder'] = {
  add: function(element, settings, message) {
    $(element).parent().find('.input-label span.message').remove();
    $(element).addClass('field_with_errors').parent().find('.input-label').addClass('message').append($('<span>').attr('class', 'message').html(message));
  },
  remove: function(element, settings) {
    $(element).parent().find('.input-label span.message').remove();
    $(element).removeClass('field_with_errors').parent().find('.input-label').removeClass('message');
  }
}

 window.ClientSideValidations.callbacks.form.pass = function(element, callback){
  $('#contact-modal').foundation('reveal', 'open');
  $('.progress').removeClass('success alert');
 }
       