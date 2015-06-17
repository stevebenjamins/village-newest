$(document).ready(function(){

	$('#toggle-mobile-navigation').click(function(){
		$('.header ul').slideToggle("fast");
	});

	// Ensure the nav is visible when the window is resized (even if it's been set to hidden)
	$(window).resize(function(){  
		var menu = $('.header ul'); 
	    var w = $(window).width();  
	    if(w > 450 && menu.is(':hidden')) {  
	        menu.removeAttr('style');  
	    }  
	});

});
