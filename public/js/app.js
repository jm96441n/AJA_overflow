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
    $("#composite-votes").text(response.composite_votes)
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

    $("#down-vote-count").text(response.down_votes)
    $("#composite-votes").text(response.composite_votes)
  }).fail(function(){
    //raise error
  })
})





})
