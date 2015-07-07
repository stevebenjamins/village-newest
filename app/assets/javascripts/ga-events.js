$(document).ready(function(){
	
	$(".newsfeed ul a").click(function() {
		ga('send', 'event', 'Article Click', $(this).attr("domain"), $(this).attr("headline"));
	});
	
	$(".facebook").click(function() { 
		ga('send', 'event', 'Social Share', 'Click', 'Twitter');
	});
	
	$(".twitter").click(function() { 
		ga('send', 'event', 'Social Share', 'Click', 'Twitter');
	});
	
	$("span.comments a").click(function() { 
		ga('send', 'event', 'Comments Pane', 'Click', 'Comments');
	});
	
});