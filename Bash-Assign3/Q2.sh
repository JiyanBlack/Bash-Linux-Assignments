#!/bin/bash
# 21824073 Yan Ji
# The code of the second question
# Execute it, no parameter needs to be provided

# handle data
bash ./handleData2.sh weblog-1.txt > tmpData2-1.tmp
awk -F"/" '{print $1,$2,$3}' tmpData2-1.tmp > tmpData2-2.tmp
awk -F":" '{print $1,$2,$3,$4}' tmpData2-2.tmp > tmpData2-3.tmp

# remove all redirected url(302) with '-' package size
awk '!/-/'  tmpData2-3.tmp > tmpData2-4.tmp

# echo html headers 
echo '<html>
  <head>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>    <script type="text/javascript">
      google.charts.load("current", {"packages":["corechart"]});
      google.charts.setOnLoadCallback(drawChart);
      var myData=[
' > result2.html

# input all data as myData into js file
awk '{print "[",$1,",\""$2"\",",$3,",",$4,",",$5,",",$6,",",$7,",",$8,"],"}' tmpData2-4.tmp >> result2.html

# handle data and draw diagram
# convert time as seconds relative to 25 Sep 2016 03 42 25 
echo '
];

function drawChart() {

    var startTime=25+42*60+3*3600;

    var rowData= myData.map(function(oneDatum){
        return [oneDatum[3]*3600+oneDatum[4]*60+oneDatum[5]- startTime,oneDatum[7]];
    });

    var timeGap=300;
    var maxHV=Math.floor(rowData[rowData.length-1][1]/timeGap)+2;
    var result=[["Group","Data Size"]];
    var lastTime=rowData[0][0];;
    var groupSum=0;
    var groupNumber=1;
    for(var i in rowData){
        if(rowData[i][0]-lastTime <= timeGap){
        groupSum+=rowData[i][1];
        }
        else{
            lastTime+=timeGap;
            result.push([groupNumber,groupSum]);
            groupNumber+=1;
            groupSum=rowData[i][1];
        }
    }

    console.log(rowData,result);

    var data = google.visualization.arrayToDataTable(result);

    var options = {
        title: "Group - Data Size Scatter Chart",
        hAxis: {title: "Group", minValue: 0, maxValue: maxHV},
        vAxis: {title: "Group Data Size(bytes)", minValue: 0, maxValue: result.reduce(
        function(a,b){
            return a[1]>b[1]?a:b;
        }
        )[1]
},
        legend: "none"
    };

    var chart = new google.visualization.ScatterChart(document.getElementById("chart_div1"));

    chart.draw(data, options);
}
</script>
' >> result2.html

# html body
  echo '
  </head>
  <body>
    <div id="chart_div1" style="width: 1600px; height: 900px; margin:0 auto;"></div>
  </body>
  <h4 style="margin:0 auto;">A group is a sets of data that are divided by 5 minutes interval start from the first data point: 25/Sep/2016 03:42:25
</html>' >> result2.html

# clean temp files
rm *.tmp