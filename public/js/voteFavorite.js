$(document).ready(function(){

    // up vote button on question page
  $("#question-action-buttons").on("click", "#up-vote-button", function(event){
    event.preventDefault();

    var $target = $(event.target);
    $.ajax({
      url: $target.parent().attr('href'),
      method: 'get',
      data: {action: "up-vote"}
    }).done(function(response){
      var votesCount = response.up_votes;
      var allVotes = response.composite_votes
      $("#up-vote-count").text(votesCount);
      $("#composite-votes").text(allVotes);
    }).fail(function(){
      //error message
    });
  });


  $("#question-action-buttons").on("click", "#down-vote-button", function(event){

    event.preventDefault()

    var $target = $(event.target)

    $.ajax({
      url: $target.parent().attr('href'),
      method: 'get',
      data: {action: "down-vote"}
    }).done(function(response){

      $("#down-vote-count").text(response.down_votes)
      $("#composite-votes").text(response.composite_votes)
    }).fail(function(){
      //raise error
    })
  })

  $("#favorite-button").on("click", function(event){
    event.preventDefault()

    var $target = $(event.target)

    $.ajax({
      url: $target.parent().attr('href'),
      method: 'get',
      data: {action: "favorite"}
    }).done(function(response){
      $("#favorite_count").text(response.favorite_count)
    }).fail(function(){
      //raise error
    })
  })

  // up-vote answers
  $("#answers-section").on("click","#up-vote-button", function(event){
    event.preventDefault();

    var $target = $(event.target);

    $.ajax({
      url: $target.parent().attr('href'),
      method: 'get',
      data: {action: "up-vote"}
    }).done(function(response){
      var allVotes = response.composite_votes
      $target.parent().parent().parent().find("#composite-votes").text(allVotes)
    }).fail(function(){
      //raise error
    });
  });

// down-vote answers

  $("#answers-section").on("click", "#down-vote-button", function(event){

    event.preventDefault()

    var $target = $(event.target)

    $.ajax({
      url: $target.parent().attr('href'),
      method: 'get',
      data: {action: "down-vote"}
    }).done(function(response){
      var allVotes = response.composite_votes
      $target.parent().parent().parent().find("#composite-votes").text(allVotes)
    }).fail(function(){
      //raise error
    })
  })


})