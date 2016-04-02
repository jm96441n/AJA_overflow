$(document).ready(function(){

    // up vote button on question page
  $("#up-vote-button").on("click", function(event){
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
      //raise error
    });
  });


$("#down-vote-button").on("click", function(event){

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

//edit question form is different from edit question button
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


$('.top-bar-right').on('click','#login_link', function(event){
  event.preventDefault()
  $('#log-reg-links').fadeOut(1000, function(){
     $('#login_form').fadeIn(1000)
  })

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

    // get route for register form
  $("#register-link").on("click", function(event){
    if ($('#questions-list-section').size() > 0) {
      event.preventDefault();
      $("#login_form").fadeOut();

      var path = $("a[href='/users/new']").attr("href");

      $.ajax({
        url: path,
        type: "get"
      })
      .done(function(response){
        $("#form-placeholder").html(response).fadeIn("100");
        $("#new_question_form").fadeOut("10000");
        $("#questions-list-section").fadeOut("10000");
      });
    }
  });

    // post route for register form
  // $("main").on("submit", "#register-form", function(event){
  //   event.preventDefault();
  //   var path = $(event.target).attr("action");
  //   var formData = $(event.target).serialize();

  //   $.ajax({
  //     url: path,
  //     type: 'post',
  //     data: formData,
  //     dataType: 'html'
  //   }).done(function(response){
  //     $(".top-bar-right").load("/index .top-bar-right");
  //     $("#register-form").fadeOut("10000");
  //     $("#new_question_form").fadeIn("10000");
  //     $("#questions-list-section").fadeIn("10000");
  //     $("body").scrollTop(0);
  //   });
  // });

  $("#new_question_form").on("submit", function(event){
    event.preventDefault();

    var path = $(event.target).attr("action");
    var formData = $(event.target).serialize();

    $.ajax({
      url: path,
      type: 'post',
      data: formData,
      dataType: 'html'
    }).done(function(event){
      $("#new_question_form").load("/index #new_question_form");
    });
  });




// TWO HOMEPAGE BUTTONS BELOW ARE NOT COMPLETE
$("#find-questions-button").on("submit",function(){
  event.preventDefault();
  $.ajax({
    url: $(event.target).attr("action"),
    type: 'get',
  }).done(function(response){
    $("#ask-button-homepage").fadeOut("10000");
    $("#find-button-homepage").fadeOut("10000");
    $("main").html(response)
    $('main').css('height','auto')
  });
});

$("#ask-button").on("submit",function(){
  event.preventDefault();
  $.ajax({
    url: $(event.target).attr("action"),
    type: 'get',
  }).done(function(response){
    $("#ask-button-homepage").fadeOut("10000");
    $("#find-button-homepage").fadeOut("10000");
    $("main").html(response)
  });
});
    //hide edit user form on user show page when page loads
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

});

  // post for register form. having trouble targeting parent div in order to bubble. for and parent div ids correspond and are in correct place. not sure what the problem is.





