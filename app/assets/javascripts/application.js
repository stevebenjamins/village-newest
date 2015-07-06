// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .


$(document).ready(function(){
	
	// Mobile Menu
	
	$('.menu-toggle').click(function(){
		$('.mobile-toggle').slideToggle("fast");
	});	
	
	$("#show-post-stats").click(function(){
		$('span.clicks').toggle();
	});
	
	// $(".newsfeed ul li").hover(function(){
	// 	$('.meta', this).toggle();
	// });
	
	// Sharrre
	
	$('.twitter').sharrre({
	  share: {
	    twitter: true
	  },
	  template: '<a class="box" href="javascript:;"><div class="count" href="#">{total}</div><div class="share"><span></span>Tweet</div></a>',
	  enableHover: false,
	  enableTracking: true,
	  buttons: { twitter: {via: 'itsonvillage'}},
	  click: function(api, options){
	    api.simulateClick();
	    api.openPopup('twitter');
	  }
	});
	$('.facebook').sharrre({
	  share: {
	    facebook: true
	  },
	  template: '<a class="box" href="javascript:;"><div class="count" href="#">{total}</div><div class="share"><span></span>Facebook</div></a>',
	  enableHover: false,
	  enableTracking: true,
	  click: function(api, options){
	    api.simulateClick();
	    api.openPopup('facebook');
	  }
	});

});
