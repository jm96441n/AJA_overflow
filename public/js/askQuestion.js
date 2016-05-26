$(document).ready(function(){

  $("#main-area").on("submit","#new_question_form", function(event){
    event.preventDefault();
    var path = $(event.target).attr("action");
    var formData = $(event.target).serialize();

    $.ajax({
      url: path,
      type: 'post',
      data: formData,
      dataType: 'html'
    }).done(function(event){
      $("main").html(event)

    });
  });

  $('#main-area').on('click','.tag_partial', function(event){
  	event.preventDefault();
    var data = {tag_id: $(event.target).parent().attr('href').slice(6)}
    $.ajax({
      url: '/tag_questions/new',
      type: 'post',
      data: data,
    }).done(function(e){
      $(event.target).addClass('tag_partial_clicked')
      $(event.target).removeClass('tag_partial')
    });
  });

  $('#main-area').on('click','.tag_partial_clicked', function(event){
    event.preventDefault();
  });
})