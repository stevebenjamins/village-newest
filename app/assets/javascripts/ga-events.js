$(document).ready(function(){
	
	$(".newsfeed ul a").click(function() {
		ga('send', 'event', 'Article Click', $(this).attr("domain"), $(this).attr("headline"));
	});
	
	$("span.comments a").click(function() { 
		ga('send', 'event', 'Comments Pane', 'Click', 'Comments');
	});
	
	$(document.body).on("click", ".voter-no-user", function(){
		ga('send', 'event', 'Tried to upvote, not logged in', 'Click', 'Upvote');
	});
	
	
	$(document.body).on("click", ".voter a", function(){
		ga('send', 'event', 'Vote', 'Click', 'Vote');
	});
	
});