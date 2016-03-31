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

$("#favorite-button").on("click",function(event){
  event.preventDefault()

  var $target = $(event.target)

  $.ajax({
    url: $target.attr('href'),
    method: 'get',
    data: {action: "favorite"}
  }).done(function(response){
    $("#favorite_count").text(response.favorite_count)
  }).fail(function(){
    //raise error
  })
})

//edit question form is different from edit question button
$("#edit_question_form").on("submit",function(event){
  event.preventDefault()

  var $target = $(event.target)
  var editedQuestion = $target.serialize()

  $.ajax({
    url: $target.attr('action'),
    method: 'post',
    data: editedQuestion
  }).done(function(response){
    $("#question-header-text").text(response)
  }).fail(function(){
    //raise error
  })
})

// shows a partial with the edit question form instead of loading an edit form page
$("#edit_question_button").on("submit",function(event){
  event.preventDefault()
  var $target = $(event.target)

  $.ajax({
    url: $target.attr('action'),
    method: 'get',
    data: {action: "edit"}
  }).done(function(response){
    // response should be updated question text
    $("#question-header-text").append(response)
  }).fail(function(){
    //raise error
  })
})

$("#your_answer_form").on("submit",function(event){
  event.preventDefault()
  var $target = $(event.target)
  var answerData = $target.serialize()

  $.ajax({
    url: $target.attr('action'),
    method: 'post',
    data: answerData
  }).done(function(response){
    debugger
    // response should be partial html for new answer
    $("#answers-section").append(response)
  }).fail(function(){
    //raise error
  })
})



})
