$(document).ready(function(){

    // up vote button on question page
  $("#up-vote-button").on("click",function(event){
    event.preventDefault();

    var $target = $(event.target);

    $.ajax({
      url: $target.attr('href'),
      method: 'get',
      data: {action: "up-vote"}
    }).done(function(response){
      var votes_count = response.votes;
      $("#vote-count").text(votes_count);
    }).fail(function(){
      //raise error
    });
  });

    // get route for login form 
  $("#login-link").on("click", function(event){
    event.preventDefault();

    var path = $("a[href='/login']").attr("href");

    $.ajax({
      url: path,    
      method: "get"
    }).done(function(response){
      $("#form-placeholder").html(response);
      $("#new_question_form").fadeOut("10000"); 
      $("#questions-list-section").fadeOut("10000");
    });
   });

    // post route for login form 
  $("#form-placeholder").on("submit", "#login-form", function(event){
    event.preventDefault();
    var path = $(event.target).attr("action");
    var formData = $(event.target).serialize();

    $.ajax({
      url: path, 
      type: "post",
      data: formData,
      dataType: "html"
    })
    .done(function(response){
      var parsedResponse = JSON.parse(response);
      // $("#user-login-form-placeholder").hide();
      // $("#new_question_form").show();
      // $("#questions-list-section").show();
      location.reload();
    });
  });

    // get route for register form
  $("#register-link").on("click", function(event){
    event.preventDefault();
    
    var path = $("a[href='/users/new']").attr("href");

    $.ajax({
      url: path,
      type: "get"
    })
    .done(function(response){
      $("#form-placeholder").html(response);
      $("#new_question_form").fadeOut("10000"); 
      $("#questions-list-section").fadeOut("10000");
    });
  });

    // post route for register form
  $("main").on("submit", "#register-form", function(event){
    event.preventDefault();
    var path = $(event.target).attr("action");
    var formData = $(event.target).serialize();
    
    $.ajax({
      url: path,
      type: 'post',
      data: formData,
      dataType: 'html'
    }).done(function(response){
      $(".top-bar-right").load("/index .top-bar-right");
      $("#register-form").fadeOut("10000");
      $("#new_question_form").fadeIn("10000"); 
      $("#questions-list-section").fadeIn("10000");
      $("body").scrollTop(0);
    });
  });
    
  $("#new_question_form").on("submit", function(event){
    event.preventDefault();

    var path = $(event.target).attr("action");
    var formData = $(event.target).serialize();
    
    $.ajax({
      url: path,
      type: 'post',
      data: formData,
      dataType: 'html'
    }).done(function(event){
      $("#new_question_form").load("/index #new_question_form");

    });
  });

});

  // post for register form. having trouble targeting parent div in order to bubble. for and parent div ids correspond and are in correct place. not sure what the problem is. 

 
