(function() {
  $(window).scroll(function() {
    var opacity, wScroll;
    wScroll = $(this).scrollTop();
    if ($('.peri').length) {
      if (wScroll > $('.peri').offset().top - $(window).height()) {
        $('.peri').css({
          'background-position': 'center ' + wScroll - $('.peri').offset().top + 'px'
        });
        opacity = (wScroll - $('.peri').offset().top + 400) / (wScroll / 5);
        return $('.window-tint').css({
          'opacity': opacity
        });
      }
    }
  });

}).call(this);
