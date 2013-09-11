$(document).ready(function() {
  $('.left a.my_surveys').on('click', function(e){ //include the element that .left belongs to in order to reduce expense
    e.preventDefault();
    $('#results-container').html('');
    var url = this.href+"/results";
    console.log(url);
    $.ajax({
      type: "GET",
      url: url
    }).done(function(server_response){
      $('#results-container').append(server_response);
    }).fail(function(){ console.log('wah wah'); });
    // pull this out to a named function
    // or even create an object like surveyUI that contains all the UI functions
  });
});
