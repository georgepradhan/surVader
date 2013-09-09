//survey_results.js
console.log("LOADED")

new Morris.Bar({
  // ID of the element in which to draw the chart.
  element: 'barGraph-0',
  // Chart data records -- each entry in this array corresponds to a point on
  // the chart.
  data: [
    { year: 'Darth Vader', value: 20 },
    { year: 'JarJar Binks', value: 10 },
    { year: 'Boba Fett', value: 5 }
  ],
  // The name of the data record attribute that contains x-values.
  xkey: 'year',
  // A list of names of data record attributes that contain y-values.
  ykeys: ['value'],
  // Labels for the ykeys -- will be displayed when you hover over the
  // chart.
  labels: ['Value']
});