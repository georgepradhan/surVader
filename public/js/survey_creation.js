$(document).ready(function(){
  $('#new_survey').on('submit', function(e){
    e.preventDefault();
    $.ajax({
      url: this.action,
      type: this.method,
      data: $(this).serialize(),
    })
    .done(function(data) {
      $('#question_form').html(data);
      $('#new_survey input[type=submit]').hide();
    })
    .fail(function() {
      console.log("error");
    });
  });
  $('#question_form').on('submit', '#new_question', function(e){
    e.preventDefault();
    $.ajax({
      url: this.action,
      type: this.method,
      data: $(this).serialize(),
    })
    .done(function(data) {
      $('#question_submit').hide();
      $('#question_form').append(data);
    })
    .fail(function() {
      console.log("error");
    });
  });
  $('#question_form').on('submit', '#new_choice', function(e){
    e.preventDefault();
    $.ajax({
      url: this.action,
      type: this.method,
      data: $(this).serialize(),
    })
    .done(function(data) {
      $('input[value="Add Choices"]').last().hide();
      $('.finish_survey').hide();
      $('#question_form').append(data);
    })
    .fail(function() {
      console.log("error");
    });
  });
});
