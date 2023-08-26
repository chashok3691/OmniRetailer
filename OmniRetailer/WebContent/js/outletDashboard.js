

var newopts = {
	      inGraphDataShow : false,
	      datasetFill : true,
	      scaleTickSizeRight : 5,
	      scaleTickSizeLeft : 5,
	      scaleTickSizeBottom : 5,
	      scaleTickSizeTop : 5,
	      scaleFontSize : 16,
	      canvasBorders : false,
	      canvasBordersWidth : 3,
	      canvasBordersColor : "black",
	      legend : true,
		    legendFontFamily : "'Arial'",
		    legendFontSize : 12,
		    legendFontStyle : "normal",
		    legendFontColor : "#666",
	      legendBlockSize : 15,
	      legendBorders : false,
	      legendBordersWidth : 1,
	      legendBordersColors : "#666",
	      yAxisLeft : true,
	      yAxisRight : false,
	      xAxisBottom : true,
	      xAxisTop : false,
	      yAxisLabel : "",
				yAxisFontFamily : "'Arial'",
				yAxisFontSize : 16,
				yAxisFontStyle : "normal",
				yAxisFontColor : "#666",
	      xAxisLabel : "",
		 	  xAxisFontFamily : "'Arial'",
				xAxisFontSize : 16,
				xAxisFontStyle : "normal",
				xAxisFontColor : "#666",
	      yAxisUnit : "Y Unit",
				yAxisUnitFontFamily : "'Arial'",
				yAxisUnitFontSize : 8,
				yAxisUnitFontStyle : "normal",
				yAxisUnitFontColor : "#666",
	      annotateDisplay : true, 
	      spaceTop : 0,
	      spaceBottom : 0,
	      spaceLeft : 0,
	      spaceRight : 0,
	      logarithmic: true,
//	      showYAxisMin : false,
	      rotateLabels : "smart",
	      xAxisSpaceOver : 0,
	      xAxisSpaceUnder : 0,
	      xAxisLabelSpaceAfter : 0,
	      xAxisLabelSpaceBefore : 0,
	      legendBordersSpaceBefore : 0,
	      legendBordersSpaceAfter : 0,
	      footNoteSpaceBefore : 0,
	      footNoteSpaceAfter : 0, 
	      startAngle : 0,
	      dynamicDisplay : true
	}


var barChartOptions                  = {
	      //Boolean - Whether the scale should start at zero, or an order of magnitude down from the lowest value
	      scaleBeginAtZero        : true,
	      //Boolean - Whether grid lines are shown across the chart
	      scaleShowGridLines      : true,
	      //String - Colour of the grid lines
	      scaleGridLineColor      : 'rgba(0,0,0,.05)',
	      //Number - Width of the grid lines
	      scaleGridLineWidth      : 1,
	      //Boolean - Whether to show horizontal lines (except X axis)
	      scaleShowHorizontalLines: true,
	      //Boolean - Whether to show vertical lines (except Y axis)
	      scaleShowVerticalLines  : true,
	      //Boolean - If there is a stroke on each bar
	      barShowStroke           : true,
	      //Number - Pixel width of the bar stroke
	      barStrokeWidth          : 1,
	      //Number - Spacing between each of the X value sets
	      barValueSpacing         : 2,
	      //Number - Spacing between data sets within X values
	      barDatasetSpacing       : 1,
	      //String - A legend template
	      legendTemplate          : '<ul class="<%=name.toLowerCase()%>-legend"><% for (var i=0; i<datasets.length; i++){%><li><span style="background-color:<%=datasets[i].fillColor%>"></span><%if(datasets[i].label){%><%=datasets[i].label%><%}%></li><%}%></ul>',
	      //Boolean - whether to make the chart responsive
	      responsive              : false,
	      maintainAspectRatio     : false
	    }



var pieOptions     = {
	    // Boolean - Whether we should show a stroke on each segment
	    segmentShowStroke    : true,
	    // String - The colour of each segment stroke
	    segmentStrokeColor   : '#fff',
	    // Number - The width of each segment stroke
	    segmentStrokeWidth   : 1,
	    // Number - The percentage of the chart that we cut out of the middle
	    percentageInnerCutout: 50, // This is 0 for Pie charts
	    // Number - Amount of animation steps
	    animationSteps       : 100,
	    // String - Animation easing effect
	    animationEasing      : 'easeOutBounce',
	    // Boolean - Whether we animate the rotation of the Doughnut
	    animateRotate        : true,
	    // Boolean - Whether we animate scaling the Doughnut from the centre
	    animateScale         : false,
	    // Boolean - whether to make the chart responsive to window resizing
	    responsive           : false,
	    // Boolean - whether to maintain the starting aspect ratio or not when responsive, if set to false, will take up entire container
	    maintainAspectRatio  : false,
	    // String - A legend template
	    legendTemplate       : '<ul class=\'<%=name.toLowerCase()%>-legend\'><% for (var i=0; i<segments.length; i++){%><li><span style=\'background-color:<%=segments[i].fillColor%>\'></span><%if(segments[i].label){%><%=segments[i].label%><%}%></li><%}%></ul>',
	    // String - A tooltip template
	    tooltipTemplate      : '<%=value %> <%=label%> users'
	  };

function getOrderPieChartData(){
	
var completed = $("#completed").val();
var cancelled = $("#cancelled").val();
var returned = $("#returned").val();
var exchanged = $("#exchanged").val();
var credit = $("#credit").val();



var orderPieChartData = [
 	{
 		value : parseInt(completed),
 		label : "Completed Bills"
 	},
 	{
 		value : parseInt(cancelled),
 		label : "Cancelled Bills"
 	},
 	{
 		value : parseInt(returned),
 		label : "Returned Bills"
 	},
 	{
 		value : parseInt(exchanged),
 		label : "Exchanged Bills"
 	},
 	{
 		value : parseInt(credit),
 		label : "Credit Bills"
 	},
  ];
return orderPieChartData;
}
/*var orderPieChartData = [
           	{
           		value : phoneCount,
           		color: "#FF7F27",
                  title : "Mobile"
           	},
           	{
           		value : directCount,
           		color: "#B5E61D",
                  title : "Direct"
           	},
           	{
           		value : salesExecutiveCount,
           		color: "#EFE4B3",
                  title : "sales Executive"
           	},
           	{
           		value : onlineCount,
           		color: "#B97A57",
                  title : "Online"
           	},
            ]*/

function getWastagePieChartDta(){
	
	var perishedStockAmount = $("#perishedStockAmount").val();
	var damagedStockAmount = $("#damagedStockAmount").val();
	var expiredStockAmount = $("#expiredStockAmount").val();
	var theftStockAmount = $("#theftStockAmount").val();
	var wastagePieChartData = [
		{
			value : parseInt(perishedStockAmount),
			label : "Perished"
		},
		{
			value : parseInt(damagedStockAmount),
			label : "Damage"
		},
		{
			value : parseInt(expiredStockAmount),
			label : "Loss"
		},
		{
			value : parseInt(theftStockAmount),
			label : "Theft"
	 	},
	];
	return wastagePieChartData;
}
/*var wastagePieChartData = [
           	{
           		value : perishedStockAmount,
           		color: "#FFFF66",
                  title : "Perished"
           	},
           	{
           		value : damagedStockAmount,
           		color: "#663300",
                  title : "Damage"
           	},
           	{
           		value : expiredStockAmount,
           		color: "#0066FF",
                  title : "Expiry"
           	},
           	{
           		value : theftStockAmount,
           		color: "#FFCCFF",
                  title : "Theft"
           	},
            ]*/





function getturnOverPieChartContent(){
	var segments =["#2484c1", "#65a620", "#7b6888", "#a05d56", "#961a1a", "#d8d23a", "#e98125", "#d0743c", "#635222", "#6ada6a",
			"#0c6197", "#7d9058", "#207f33", "#44b9b0", "#bca44a", "#e4a14b", "#a3acb2", "#8cc3e9", "#69a6f9", "#5b388f",
			"#546e91", "#8bde95", "#d2ab58", "#273c71", "#98bf6e", "#4daa4b", "#98abc5", "#cc1010", "#31383b", "#006391",
			"#c2643f", "#b0a474", "#a5a39c", "#a9c2bc", "#22af8c", "#7fcecf", "#987ac6", "#3d3b87", "#b77b1c", "#c9c2b6",
			"#807ece", "#8db27c", "#be66a2", "#9ed3c6", "#00644b", "#005064", "#77979f", "#77e079", "#9c73ab", "#1f79a7"];
			
	
	debugger;
	var turnOverObj =  $("#turnOverObj").val();
	var parsedJson = jQuery.parseJSON(turnOverObj);  
	var turnOvers = parsedJson.turnOvers;
	var row ='';
	var quote ='\'';
	var total=0;
//	var turnOvers = $("#turnOverObj").val();
	var turnOverPieChartData=[];
	for(var i=0;i<turnOvers.length && turnOvers[i].totalCategoryAmount!= 0 ;i++){
//		console.log(turnOvers[i].category)
		var obj ={
				value : turnOvers[i].totalCategoryAmount,
				label : turnOvers[i].category,
				 color    : segments[i],
                 highlight: segments[i],
		};
		var turnOversCate = turnOvers[i].category;
		total=total+turnOvers[i].totalCategoryAmount;
		 // = "<input type='text' style='border: none;'readonly id='categoryname"+i+"' value='"+turnOvers[i].category+"' />" ;
		  row= row +  "<li><i class='fa fa-circle' style='color:"+segments[i]+" !important'></i><label style='width:52%;'>"+turnOvers[i].category+"</label> = <label style='width:32%;'>"+turnOvers[i].totalCategoryAmount+"</label></li>";
		//$("#categorydesc"+i).append(row);
		//$("#talkbubble"+i).css("display","inline-block");
		turnOverPieChartData.push(obj);
	}
	row = row.replace('\"', '');
	$(".chart-legend-category").append(row);
	$("#totalturnover").text(total.toFixed(2));
	
	return turnOverPieChartData;
}


function getSalesLineChartData(){

var salesObj = $("#salesObj").val();
salesObj = salesObj.replace(/ /g,'').replace('[','').replace(']','');
salesObj = salesObj.split(',');
//salesObj = JSON.parse(salesObj);
var label = [];
var searchCriteria = $("#searchCriteria").val();
if(searchCriteria == "month"){
	for(var i=1;i<=salesObj.length;i++){
		label.push(i);
	}
}

else{
	label = ["Sun","Mon","Tue","Wed","Thu","Fri","Sat"];
}
var sales =[];
for(var i=0; i<salesObj.length;i++)
{	
	if(salesObj[i]!=null)
		sales.push(salesObj[i]);
	else
		sales.push(0);

}
var salesLineChartData = {
			labels : label,
			datasets : [
				{
					
			          fillColor           : '#3c8dbc',
			          strokeColor         : 'rgba(210, 214, 222, 1)',
			          pointColor          : 'rgba(210, 214, 222, 1)',
			          pointStrokeColor    : '#c1c7d1',
			          pointHighlightFill  : '#fff',
			          pointHighlightStroke: 'rgba(220,220,220,1)',
			          data                : sales
				}
			],
tooltips: {
    enabled: true,
    type: "placeholder",
    string: "{label}: {percentage}% ({value})",
    placeholderParser: function(index, data) {
      data.label = data.label + "!";
      data.percentage = data.percentage.toFixed(2);
      data.value = data.value.toFixed(2);
    }
}
		}
return salesLineChartData;
}

function getStocksLineChartData(){
	debugger
var stocksObj = $("#stocksObj").val();
stocksObj = stocksObj.replace(/ /g,'').replace('[','').replace(']','');
stocksObj = stocksObj.split(',');
var stocks =[];
for(var i=0; i<stocksObj.length;i++)
{	
	if(stocksObj[i]!=null)
	stocks.push(stocksObj[i]);
	else
		stocks.push(0);

}
//stocksObj = JSON.parse(stocksObj);
var label = [];
var searchCriteria = $("#searchCriteria").val();
if(searchCriteria == "month"){
	for(var i=1;i<=stocksObj.length;i++){
		label.push(i);
	}
}
else{
	label = ["Sun","Mon","Tue","Wed","Thu","Fri","Sat"];
}
var stocksLineChartData = {
		labels : label,
		datasets : [
			{
				 fillColor           : '#3c8dbc',
		          strokeColor         : 'rgba(210, 214, 222, 1)',
		          pointColor          : 'rgba(210, 214, 222, 1)',
		          pointStrokeColor    : '#c1c7d1',
		          pointHighlightFill  : '#fff',
		          pointHighlightStroke: 'rgba(220,220,220,1)',
		          data                : stocks
			}
		]
	}
 return stocksLineChartData;
}

