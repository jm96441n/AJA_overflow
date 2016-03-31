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
    $("#user-login-form-placeholder").append(response);
    $("body").css("background-color", "black")
    $("#new_question_form").hide(); // just fucking around w/ this and line 32 until fix issue detailed below.
    // $("#user-login-form-placeholder-background").show(); // I added this div to change the background color of a div covering the whole screen with opacity. it might not be working because of foundation's css. will figure out tomorrow.
  });
 });
});
