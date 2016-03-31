$(document).ready(function(){


  // up vote button on question page
$("#up-vote-button").on("click",function(event){
  event.preventDefault()

  var $target = $(event.target)

  $.ajax({
    url: $target.attr('href'),
    method: 'get',
    data: {action: "up-vote"}
  }).done(function(response){
    $("#up-vote-count").text(response.up_votes)
    $("composite-votes").text(response.composite_votes)
  }).fail(function(){
    //raise error
  })
})


$("#down-vote-button").on("click",function(event){
  event.preventDefault()

  var $target = $(event.target)

  $.ajax({
    url: $target.attr('href'),
    method: 'get',
    data: {action: "down-vote"}
  }).done(function(response){
    debugger
    $("#down-vote-count").text(response.down_votes)
    $("composite-votes").text(response.composite_votes)
  }).fail(function(){
    //raise error
  })
})


$('#login_link').on('click', function(event){
  event.preventDefault()
  $('#login_form').css('display','inline');
})




$('#login').on('submit', function(event){
  event.preventDefault();
  var $target = $(event.target)
  var data = $(this).serialize();
  var params = {
    url: '/login',
    method: 'post',
    data: data,
    dataType: 'html',
  }
  $.ajax(params).done(function(response){
    $('login_form').css('display','hidden')
  })
 });


})
