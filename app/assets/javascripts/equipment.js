
$(document).ready(function(){
	$(document).foundation('equalizer', 'reflow');
	$(document).foundation({
		  equalizer : {
		    // Specify if Equalizer should make elements equal height once they become stacked.
		    equalize_on_stack: true,
		    // Allow equalizer to resize hidden elements
		    act_on_hidden_el: false
		  }
	});
	// $('.img-wrapper.odd').hover(
	// 	function(){
	// 		$(this).children('.icon').animate({
	// 			left: "100%"
	// 		}, 400);
	// 	}, 
	// 	function(){
	// 		$(this).children('.icon').animate({
	// 		left: "50%"
	// 		}, 400);
	// 	});
});

