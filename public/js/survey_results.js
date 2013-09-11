// the only differences I'm seeing between this file and survey_results_large.js are the two console.log statements on lines 12-13

$(".barGraphs").each(function(index){
  var id = "#" + this.id
  var element_id = this.id 
  console.log("/surveys/" + $(id).data("survey") + "/results/questions/" + $(id).data("question"))
  $.ajax({
    url: "/surveys/" + $(id).data("survey") + "/results/questions/" + $(id).data("question"),
    type: "get"
  }).done(function(data){
    console.log("sucess" + data)
      console.log(this);
      console.log(this.class);
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
      labels: ['Value']
});
  })
});

