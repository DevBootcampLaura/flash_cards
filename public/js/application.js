$(document).ready(function() {
  // This is called after the document has loaded in its entirety
  // This guarantees that any elements we bind to will exist on the page
  // when we try to bind to them

  // See: http://docs.jquery.com/Tutorials:Introducing_$(document).ready()

  // Hide signup form on load
  $(".signup").css("display","none");
  // Show signup form on click
	$("#show_signup").click(function(event){
	    event.preventDefault(); //to prevent standard click event
	    $(".signup").toggle();
	});


});
