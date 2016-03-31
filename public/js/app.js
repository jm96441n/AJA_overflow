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

    // render login form on index/home page
  $("#login-link").on("click", function(event){
    event.preventDefault();

    var path = $("a[href='/login']").attr("href");

    $.ajax({
      url: path,    
      method: "get"
    }).done(function(response){
      $("#user-login-form-placeholder").html(response);
      $("#new_question_form").fadeOut("10000"); 
      $("#questions-list-section").fadeOut("10000");
    });
   });

  $("#user-login-form-placeholder").on("submit", "#login-form", function(event){
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
    })
  })

});


// var parsedResponse = JSON.parse(response);
//       $("#tasks_details_aside h1").html(parsedResponse.name);
//       $("#tasks_details_aside h3").html(parsedResponse.note);

