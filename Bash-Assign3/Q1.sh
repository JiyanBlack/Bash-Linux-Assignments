#!/bin/bash

bash ./handleData.sh > tmpData
echo '<html>
  <head>
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script type="text/javascript">
      google.charts.load("current", {"packages":["corechart"]});
      google.charts.setOnLoadCallback(drawChart);
      function drawChart() {
        var data = google.visualization.arrayToDataTable([
          ["Age", "Weight"],
          [ 8,      12],
          [ 4,      5.5],
          [ 11,     14],
          [ 4,      5],
          [ 3,      3.5],
          [ 6.5,    7]
        ]);
' > result.html

echo '    var options = {
          title: "Age vs. Weight comparison",
          hAxis: {title: "Age", minValue: 0, maxValue: 15},
          vAxis: {title: "Weight", minValue: 0, maxValue: 15},
          legend: "none"
        };

        var chart = new google.visualization.ScatterChart(document.getElementById("chart_div"));

        chart.draw(data, options);
      }
    </script>
  </head>
  <body>
    <div id="chart_div" style="width: 900px; height: 500px;"></div>
  </body>
</html>' >> result.html
