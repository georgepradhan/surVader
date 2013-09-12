// why is this separate from application.js?
// again, think about creating a surveyUI object and define all the functions here. on application.js, you can create a new instance and then bind the events to the named functions

$(document).ready(function(){
  var question_count = 0;
  var choice_count = [];

  $("#new_survey").on("click", ".add_question", function(e){
    e.preventDefault();
    var current_button = $(this);
    $.ajax({
      url: "/questions/new",
      type: "get",
      data: { question_index: question_count }
    })
    .done(function(question_form) {
      current_button.before(question_form);
      $("#submit_survey").show();
      choice_count.push(0);
      question_count++;
    })
    .fail(function() {
      console.log("error on question create");
    });
  });

  $("#new_survey").on("click", ".add_choice", function(e) {
    e.preventDefault();
    var current_button = $(this);
    var q_index = getQuestionIndex(current_button);
    $.ajax({
      url: "/choices/new",
      type: "post",
      data: { question_index: q_index, choice_index: choice_count[q_index] }
    })
    .done(function(choice_form) {
      current_button.before(choice_form);
      choice_count[q_index] += 1;
    })
    .fail(function() {
      console.log("error on choice create")
    });
  });

  $("#new_survey").on("click", ".set", function(e){
    e.preventDefault();
    var current_div = $(this).parent();
    var survey_text = textInput(current_div);
    current_div.children().toggle();
    $.each(survey_text, function(k, v){
        current_div.find(".set").before("<p>" + v + "</p>");
    });
  });

  $("#new_survey").on("click", ".edit", function(e){
    e.preventDefault();
    var current_div = $(this).parent();
    current_div.children("p").remove();
    current_div.children().toggle();
  });

});

var textInput = function(div) {
  var input = {};
  div.children("input, textarea").each(function(i) {
    var key = $(this).attr('name');
    var value = $(this).val();
    input[key] = value;
  })
  return input;
}

var getQuestionIndex = function(button) {
  var q_div = button.prevAll(".question_input").first();

  return $(".question_input").index(q_div);
}
