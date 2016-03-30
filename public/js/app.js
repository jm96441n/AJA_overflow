// $(document).foundation()

$(document).ready(function(){

$("#up-vote-button").on("click",function(event){
  event.preventDefault()
  debugger
  var $target = $(event.target)

  $.ajax({
    url: $target.attr('href'),
    method: 'get'
  }).done(function(response){
    debugger
  })
})





})
