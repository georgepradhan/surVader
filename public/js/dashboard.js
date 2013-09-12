$(document).ready(function() {
  $('.eliminate').on('click', function(event){
    event.preventDefault();
    var link = event.target
    var row = $(link).closest('tr');
    var surveyName = row.find('.my_surveys').text();

    $.ajax({
      url: '/survey',
      type: 'delete',
      data: surveyName
    }).done(function(response){
      alert(response);
      row.remove();
    }).fail(function(jqXHR, textStatus, errorThrown){
       console.log("fail" + errorThrown);
     });
  });
})
