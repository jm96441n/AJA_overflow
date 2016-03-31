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
    var votes_count = response.votes
    debugger
    $("#up-vote-count").text(votes_count)
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
    var votes_count = response.votes
    $("#down-vote-count").text(votes_count)
  }).fail(function(){
    //raise error
  })
})





})
