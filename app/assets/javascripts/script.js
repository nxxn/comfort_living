$(document).ready(function() {
  $('.carousel[data-type="multi"] .item').each(function() {
  	var next = $(this).next();
  	if (!next.length) {
  		next = $(this).siblings(':first');
  	}
  	next.children(':first-child').clone().appendTo($(this));

  	for (var i = 0; i < 2; i++) {
  		next = next.next();
  		if (!next.length) {
  			next = $(this).siblings(':first');
  		}

  		next.children(':first-child').clone().appendTo($(this));
  	}
  });

  $('a[href*=#]:not([href=#])').click(function() {
    if (location.pathname.replace(/^\//,'') == this.pathname.replace(/^\//,'')
      || location.hostname == this.hostname) {

      var target = $(this.hash);
      target = target.length ? target : $('[name=' + this.hash.slice(1) +']');
       if (target.length) {
         $('html,body').animate({
           scrollTop: target.offset().top
        }, 1000);
        return false;
      }
    }
  });
});
