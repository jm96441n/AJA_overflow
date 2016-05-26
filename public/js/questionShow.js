$(document).ready(function(){
		$("#comments-section").on("click", "#new-comment-link-question", function(event){
	  event.preventDefault()

	  var $target = $(event.target)
	  var questionURL = $("#question-action-buttons").find("a").first().attr('href')
	  var questionID = questionURL.split('/')[2]

	  $.ajax({
	    url: $target.attr('href'),
	    method: 'get',
	    data: {commentable_type: "Question", commentable_id: questionID}
	  }).done(function(response){
	    $("#new-comment-link-question").hide()
	    $("#comments-section").append(response)
	  }).fail(function(){
	    //raise error
	  })
	})

	$("#comments-section").on("submit", "#new_comment_form", function(event){
	  event.preventDefault()

	  var $target = $(event.target)
	  var info = $target.serialize()

	  $.ajax({
	    url: $target.attr('action'),
	    method: 'post',
	    data: info
	  }).done(function(response){
	    $("#new-comment-link-question").show()
	    $("#comments-in-comments-section").append(response)
	    $("#new_comment_form").text("")
	  }).fail(function(){
	    //raise error
	  })
	})


	$("#answers-section").on("click", ".new-comment-link-answer", function(event){
	  event.preventDefault()

	  var $target = $(event.target)
	  var answerID = $(event.target).attr("id").split("-")[4]

	  $.ajax({
	    url: $target.attr('href'),
	    method: 'get',
	    data: {commentable_type: "Answer", commentable_id: answerID}
	  }).done(function(response){
	    $("#new-comment-link-answer-" + answerID).hide()
	    $("#answer-comments-" + answerID).append(response)
	  }).fail(function(){
	    //raise error
	  })
	})

	$("#answers-section").on("submit", "#new_comment_form", function(event){
	  event.preventDefault()

	  var $target = $(event.target)
	  var info = $target.serialize()

	  $.ajax({
	    url: $target.attr('action'),
	    method: 'post',
	    data: info
	  }).done(function(response){
	    var target = $target
	    $target.parent().find("#comments-in-answers-section").append(response)
	    $target.parent().find("#your_comment").val("")
	    $target.parent().find("#new-comment-link-answer").show()
	  }).fail(function(){
	    //raise error
	  })
	})


	$("#your_answer_form").on("submit", function(event){
	  event.preventDefault()
	  var $target = $(event.target)
	  var answerData = $target.serialize()

	  $.ajax({
	    url: $target.attr('action'),
	    method: 'post',
	    data: answerData
	  }).done(function(response){
	    $("#answers-section").append(response)

	  }).fail(function(){
	    alert('Something went wrong. Try again you must')
	  })
	})

// shows a partial with the edit question form instead of loading an edit form page
	$("#edit_question_button").on("submit", function(event){
	  event.preventDefault()
	  var $target = $(event.target)

	  $.ajax({
	    url: $target.attr('action'),
	    method: 'get',
	    data: {action: "edit"}
	  }).done(function(response){
	    $("#question-header-text").append(response)
	  }).fail(function(){
	    //raise error
	  })
	})

	$("#edit_question_form").on("submit", function(event){
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

})