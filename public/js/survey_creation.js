$(document).ready(function(){
  $('#new_survey').on('click', '#survey_confirm', function(e){
    e.preventDefault();
    $.ajax({
      url: '/surveys/new',
      type: 'post',
      data: { label: $("#survey_input input[name=label]").val(), description: $("#survey_input input[name=description]").val() }
    })
    .done(function(data) {
      var current_div = $('#new_survey').find("#survey_input");
      var survey_text = textInput(current_div);
      $("#new_survey").append(data);
      current_div.children().hide();
      $.each(survey_text, function(k, v){
        current_div.append("<p>" + k + ": " + v + "</p>");
      });
      current_div.append(createButton("edit_survey", "Edit Survey"));
    })
    .fail(function() {
      console.log("error on survey create");
    });
  });
  // $('#question_form').on('submit', '#new_question', function(e){
  //   e.preventDefault();
  //   $.ajax({
  //     url: this.action,
  //     type: this.method,
  //     data: $(this).serialize(),
  //   })
  //   .done(function(data) {
  //     $('#question_submit').hide();
  //     $('#question_form').append(data);
  //   })
  //   .fail(function() {
  //     console.log("error on add question");
  //   });
  // });
  // $('#question_form').on('submit', '#new_choice', function(e){
  //   e.preventDefault();
  //   $.ajax({
  //     url: this.action,
  //     type: this.method,
  //     data: $(this).serialize(),
  //   })
  //   .done(function(data) {
  //     $('input[value="Add Choices"]').last().hide();
  //     $('.finish_survey').hide();
  //     $('#question_form').append(data);
  //   })
  //   .fail(function() {
  //     console.log("error on choice add");
  //   });
  // });
});

var createButton = function(button_class, button_text) {
  return $("<button type='button' class='" + button_class + "'>" + button_text + "</button>");
}

var textInput = function(div) {
  var input = {};
  div.children("input, textarea").each(function(i) {
    var key = $(this).attr('name');
    var value = $(this).val();
    input[key] = value;
  })
  return input;
}
