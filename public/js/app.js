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


$('.top-bar-right').on('click','#login_link', function(event){
  event.preventDefault()
  $('#login_form').fadeIn(1000)
})




$('#login').on('submit', function(event){
  event.preventDefault();
  var data = $(this).serialize();
  var params = {
    url: '/login',
    method: 'post',
    data: data,
    dataType: 'html',
  }
  $.ajax(params).done(function(response){
    console.log(data)
  $('#login_form').fadeOut(1000)
  $('.top-bar-right').load('/index .top-bar-right');
  }).fail(function(response){
    alert('A correct username or password enter, you must')
  })
 });

$('.top-bar-right').on('click','#logout', function(event){
  event.preventDefault
  params = {
    url: '/logout',
    method: 'get',
    dataType: 'html'
  }
  $.ajax(params).done(function(){
    $('.top-bar-right').load('/index .top-bar-right')
  })
})

})
