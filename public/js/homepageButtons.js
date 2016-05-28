$(document).ready(function(){
	$("#find-button-homepage").on("click",function(){
	  event.preventDefault();
	  $.ajax({
	    url: '/questions/index',
	    type: 'get',
	  }).done(function(response){
	    $("#ask-button-homepage").fadeOut("10000");
	    $("#find-button-homepage").fadeOut("10000");
	    $("main").html(response)
	    $('main').css('height','auto')
	  });
	});

	$("#ask-button-homepage").on("click",function(){
	  event.preventDefault();
	  $.ajax({
	    url: '/questions/new',
	    type: 'get',
	  }).done(function(response){
	    $("#ask-button-homepage").fadeOut("10000");
	    $("#find-button-homepage").fadeOut("10000");
	    $("main").html(response)
	  });
	});

	$('.top-bar-right').on('click','#login_link', function(event){
	  event.preventDefault()
	  $('#login-form-container').show()
	  $("#login_form").fadeIn("100000")
	  $('#login_link').css('display', 'none')
	})

	$("#register-link").on("click", function(event){
    if ($('#questions-list-section').size() > 0) {
      event.preventDefault();
      $("#login_form").fadeOut();

      var path = $("a[href='/users/new']").attr("href");

      $.ajax({
        url: path,
        type: "get"
      })
      .done(function(response){
        $("#form-placeholder").html(response).fadeIn("100");
        $("#new_question_form").fadeOut("10000");
        $("#questions-list-section").fadeOut("10000");
      });
    }
  });
})