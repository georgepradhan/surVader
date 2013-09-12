$(".barGraphs").each(function(index){
  var element_id = this.id 
  var id = "#" + element_id
  $.ajax({
    url: "/surveys/" + $(id).data("survey") + "/results/questions/" + $(id).data("question"),
    type: "get"
  }).done(function(data){
      new Morris.Donut({ //Donut
      // ID of the element in which to draw the chart.
      element: element_id,
      // Chart data records -- each entry in this array corresponds to a point on
      // the chart.
      data: data,
      // The name of the data record attribute that contains x-values.
      xkey: 'label',
      // A list of names of data record attributes that contain y-values.
      ykeys: ['value'],
      // Labels for the ykeys -- will be displayed when you hover over the
      // chart.
      //labels: ['Value'] //this functionality not currently being utilized
      });
  })
});

