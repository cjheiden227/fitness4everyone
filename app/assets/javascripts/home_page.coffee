# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(window).scroll ->
  wScroll = $(this).scrollTop()
  if(wScroll > $('.peri').offset().top - $(window).height())
      $('.peri').css({'background-position':'center '+ wScroll - $('.peri').offset().top + 'px'})
      opacity = (wScroll - $('.peri').offset().top + 400) / (wScroll / 5)
      console.log opacity
      $('.window-tint').css({'opacity': opacity})