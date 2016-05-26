$(document).ready(function(){
	$("#edit-user-form").hide();

  $("#edit-user-link").on("click", function(event){
    event.preventDefault();
    $("#edit-user-form").fadeIn("100000");
    $("#profile-view").hide();
  });

    //hide tabs on user show page when document loads
  // $("#user-questions-tab-data").hide();
  $("#user-answers-tab-data").hide();
  $("#user-history-tab-data").hide();
  $("#user-favorites-tab-data").hide();

  $("#user-question-tab-link").on("click", function(event){
    $("#user-questions-tab-data").show();
    $("#user-answers-tab-data").hide();
    $("#user-history-tab-data").hide();
    $("#user-favorites-tab-data").hide();
  })

  $("#user-answers-questions-tab-link").on("click", function(event){
    $("#user-answers-tab-data").show();
    $("#user-questions-tab-data").hide();
    $("#user-history-tab-data").hide();
    $("#user-favorites-tab-data").hide();
  })

  $("#user-history-questions-tab-link").on("click", function(event){
    $("#user-history-tab-data").show();
    $("#user-answers-tab-data").hide();
    $("#user-questions-tab-data").hide();
    $("#user-favorites-tab-data").hide();
  })

  $("#user-favorites-questions-tab-link").on("click", function(event){
    $("#user-favorites-tab-data").show();
    $("#user-history-tab-data").hide();
    $("#user-answers-tab-data").hide();
    $("#user-questions-tab-data").hide();
  })

  $("#profile-pic").mouseenter(function(){
    $("#profile-pic").css("opacity", "0.4")
  })

  $("#profile-pic").mouseleave(function(){
    $("#profile-pic").css("opacity", "10")
  })
})