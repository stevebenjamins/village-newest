$(document).ready(function(){
	
	$(".newsfeed ul a").click(function() {
		ga('send', 'event', 'Article Click', $(this).attr("domain"), $(this).attr("headline"));
	});
	
});