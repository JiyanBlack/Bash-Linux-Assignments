#!/bin/bash
# The code of the first question
# Execute it, no parameter needs to be provided


# filter target columns into a tmp file
bash ./handleData1.sh > tmpData


# echo html headers 
echo '<html>
  <head>
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script type="text/javascript">
      google.charts.load("current", {"packages":["corechart"]});
      google.charts.setOnLoadCallback(drawChart);
      var myData=[
' > result1.html


# Assigning the tmpData to js array "myData"
awk 'BEGIN {print "[\"Time\", \"Package Length\",\"Channel\"],"}
     { print "["$1 "," $2"," $3"]," }
' tmpData >> result1.html


# the first chart
echo '      ];
      function drawChart() {
        var data = google.visualization.arrayToDataTable(myData.map(
          function(oneDatum){
            return [
              (function(){
                if (typeof oneDatum[0]==="string")
                  return oneDatum[0];
                else
                  return oneDatum[0]-1477025434;
              })()
              ,oneDatum[1]];
          }
          ));
          var options = {
          title: "Time Stamp - Package Length Scatter Chart",
          hAxis: {title: "Relative Time (seconds)", minValue: 0, maxValue: 44},
          vAxis: {title: "Package Length (bytes)", minValue: 0, maxValue: 2500},
          legend: "none"
        };

        var chart = new google.visualization.ScatterChart(document.getElementById("chart_div1"));

        chart.draw(data, options);
      }
    </script>
' >> result1.html

# second diagram, calculate the total channel number and display diagram
echo '
<script type="text/javascript">
      google.charts.load("current", {"packages":["corechart"]});
      google.charts.setOnLoadCallback(drawPieChart);

      var addedRows={};
      myData.slice(1).forEach(function(oneDatum){
        if (addedRows[oneDatum[2]] !=undefined)
          addedRows[oneDatum[2]]+=1;
        else
          addedRows[oneDatum[2]]=1;
      });

      var dataArray=[];
      for (var channel in addedRows){
        dataArray.push([channel,addedRows[channel]]);
      }
      dataArray.sort(function(a,b){
        return a[0]-b[0];
      });
      dataArray=[["Channel","Number"]].concat(dataArray.map(function(oneDatum){
        return ["Channel "+oneDatum[0],oneDatum[1]];
      }));
      console.log(dataArray);

      function drawPieChart() {
        var data = google.visualization.arrayToDataTable(dataArray);
        var options = {
          title: "Channel Number Pie Chart"
        };
        var chart = new google.visualization.PieChart(document.getElementById("chart_div2"));
        chart.draw(data, options);
      }
</script>' >> result1.html

# html body
  echo '
  </head>
  <body>
    <div id="chart_div1" style="width: 1600px; height: 900px; margin:0 auto;"></div>
    <div><hr></div>
    <div id="chart_div2" style="width: 1600px; height: 900px; margin:0 auto;"></div>
  </body>
</html>' >> result1.html

# clean temp file
rm tmpData
