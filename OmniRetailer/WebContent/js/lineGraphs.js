/**
 * @Author : Vijay
 * @Created on: 04/10/2017
 * @Decription : this java Script file consists of code which is used to implement line graphs 
 */

function getLineGraph(title,xAxisLabels,yAxisValues){
		                   	
		                   	var LineChartData = {
		                   			labels : xAxisLabels,
		                   			datasets : [
		                   				
		                   				{
		                   					fillColor : "rgba(151,187,205,0)",
		                   					fill: true,
		                   					strokeColor : "#337ab7",
		                   					pointColor : "#ccc",
		                   					pointStrokeColor : "#fff",
		                   					data : yAxisValues,
		                   		            title : title,
		                   		            label : "Quantity"
		                   				}
		                   			]
		                   	

		                   		}
		                   	 return LineChartData;
		                   	}
function getlinegraph(title, title2,title3,title4,title5,title6, title7,title8,title9,title10, xAxisLabels, yAxisValues,yAxisValues2,yAxisValues3,yAxisValues4,yAxisValues5,yAxisValues6,yAxisValues7,yAxisValues8,yAxisValues9,yAxisValues10) {
	var LineChartData;
	if( (typeof yAxisValues !== "undefined")&& (typeof yAxisValues2 !== "undefined") && (typeof yAxisValues3 === "undefined") && (typeof yAxisValues4 === "undefined")
			&& (typeof yAxisValues5 === "undefined")&& (typeof yAxisValues6 === "undefined")&& (typeof yAxisValues7 === "undefined")
			&& (typeof yAxisValues8 === "undefined")&& (typeof yAxisValues9 === "undefined")&& (typeof yAxisValues10 === "undefined"))
	{
	LineChartData = {
		labels : xAxisLabels,
		datasets : [ {
			fillColor : "rgba(151,187,205,0)",
			fill : true,
			strokeColor : "#337ab7",
			pointColor : "#ccc",
			pointStrokeColor : "#fff",
			data : yAxisValues,
			title : title,
			label : title
			
	
			
		} ,
		 {
			fillColor : "rgba(151,187,205,0)",
				fill : true,
				strokeColor : "#33b7b2",
				pointColor : "#ccc",
				pointStrokeColor : "#fff",
				data : yAxisValues2,
				title : title2,
				label : title2
			} 
		]
	
	}

	return LineChartData;
	}
	
	
	if( (typeof yAxisValues !== "undefined")&& (typeof yAxisValues2 === "undefined") && (typeof yAxisValues3 === "undefined") && (typeof yAxisValues4 === "undefined")
			&& (typeof yAxisValues5 === "undefined")&& (typeof yAxisValues6 === "undefined")&& (typeof yAxisValues7 === "undefined")
			&& (typeof yAxisValues8 === "undefined")&& (typeof yAxisValues9 === "undefined")&& (typeof yAxisValues10 === "undefined"))
	{
	LineChartData = {
		labels : xAxisLabels,
		datasets : [ {
			fillColor : "rgba(151,187,205,0)",
			fill: true,
			strokeColor : "#337ab7",
			pointColor : "#ccc",
			pointStrokeColor : "#fff",
			data : yAxisValues,
            title : title,
            label : title
		} 
		]
	
	}
	return LineChartData;
	}
	
	if( (typeof yAxisValues !== "undefined")&& (typeof yAxisValues2 !== "undefined") && (typeof yAxisValues3 !== "undefined") && (typeof yAxisValues4 === "undefined")
			&& (typeof yAxisValues5 === "undefined")&& (typeof yAxisValues6 === "undefined")&& (typeof yAxisValues7 === "undefined")
			&& (typeof yAxisValues8 === "undefined")&& (typeof yAxisValues9 === "undefined")&& (typeof yAxisValues10 === "undefined"))
	{
	LineChartData = {
		labels : xAxisLabels,
		datasets : [ {
			fillColor : "rgba(151,187,205,0)",
			fill : true,
			strokeColor : "#337ab7",
			pointColor : "#ccc",
			pointStrokeColor : "#fff",
			data : yAxisValues,
			title : title,
			label : title
		} ,
		 {
			fillColor : "rgba(151,187,205,0)",
				fill : true,
				strokeColor : "#33b7b2",
				pointColor : "#ccc",
				pointStrokeColor : "#fff",
				data : yAxisValues2,
				title : title2,
				label : title2
			} ,
		 {
			fillColor : "rgba(151,187,205,0)",
				fill : true,
				strokeColor : "#3296b7",
				pointColor : "#ccc",
				pointStrokeColor : "#fff",
				data : yAxisValues3,
				title : title3,
				label : title3
			} 
		]
	
	}

	return LineChartData;
	}
	
	if( (typeof yAxisValues !== "undefined")&& (typeof yAxisValues2 !== "undefined") && (typeof yAxisValues3 !== "undefined") && (typeof yAxisValues4 !== "undefined")
			&& (typeof yAxisValues5 === "undefined")&& (typeof yAxisValues6 === "undefined")&& (typeof yAxisValues7 === "undefined")
			&& (typeof yAxisValues8 === "undefined")&& (typeof yAxisValues9 === "undefined")&& (typeof yAxisValues10 === "undefined"))
	{
	LineChartData = {
		labels : xAxisLabels,
		datasets : [ {
			fillColor : "rgba(151,187,205,0)",
			fill : true,
			strokeColor : "#337ab7",
			pointColor : "#ccc",
			pointStrokeColor : "#fff",
			data : yAxisValues,
			title : title,
			label : title
		} ,
		 {
			fillColor : "rgba(151,187,205,0)",
				fill : true,
				strokeColor : "#33b7b2",
				pointColor : "#ccc",
				pointStrokeColor : "#fff",
				data : yAxisValues2,
				title : title2,
				label : title2
			} ,
		 {
			fillColor : "rgba(151,187,205,0)",
				fill : true,
				strokeColor : "#3296b7",
				pointColor : "#ccc",
				pointStrokeColor : "#fff",
				data : yAxisValues3,
				title : title3,
				label : title3
			} ,
			 {
				fillColor : "rgba(151,187,205,0)",
					fill : true,
					strokeColor : "#b73164",
					pointColor : "#ccc",
					pointStrokeColor : "#fff",
					data : yAxisValues4,
					title : title4,
					label : title4
				} 
		]
	
	}

	return LineChartData;
	}
	
	   
	if( (typeof yAxisValues !== "undefined")&& (typeof yAxisValues2 !== "undefined") && (typeof yAxisValues3 !== "undefined") && (typeof yAxisValues4 !== "undefined")
			&& (typeof yAxisValues5 !== "undefined")&& (typeof yAxisValues6 === "undefined")&& (typeof yAxisValues7 === "undefined")
			&& (typeof yAxisValues8 === "undefined")&& (typeof yAxisValues9 === "undefined")&& (typeof yAxisValues10 === "undefined"))
	{
	LineChartData = {
		labels : xAxisLabels,
		datasets : [ {
			fillColor : "rgba(151,187,205,0)",
			fill : true,
			strokeColor : "#337ab7",
			pointColor : "#ccc",
			pointStrokeColor : "#fff",
			data : yAxisValues,
			title : title,
			label : title
		} ,
		 {
			fillColor : "rgba(151,187,205,0)",
				fill : true,
				strokeColor : "#33b7b2",
				pointColor : "#ccc",
				pointStrokeColor : "#fff",
				data : yAxisValues2,
				title : title2,
				label : title2
			} ,
		 {
			fillColor : "rgba(151,187,205,0)",
				fill : true,
				strokeColor : "#3296b7",
				pointColor : "#ccc",
				pointStrokeColor : "#fff",
				data : yAxisValues3,
				title : title3,
				label : title3
			} ,
			 {
				fillColor : "rgba(151,187,205,0)",
					fill : true,
					strokeColor : "#b73164",
					pointColor : "#ccc",
					pointStrokeColor : "#fff",
					data : yAxisValues4,
					title : title4,
					label : title4
				} ,
				{
					fillColor : "rgba(151,187,205,0)",
						fill : true,
						strokeColor : "#605358",
						pointColor : "#ccc",
						pointStrokeColor : "#fff",
						data : yAxisValues5,
						title : title5,
						label : title5
					} 
		]
	
	}

	return LineChartData;
	}
	
	
	   
	if( (typeof yAxisValues !== "undefined")&& (typeof yAxisValues2 !== "undefined") && (typeof yAxisValues3 !== "undefined") && (typeof yAxisValues4 !== "undefined")
			&& (typeof yAxisValues5 !== "undefined")&& (typeof yAxisValues6 !== "undefined")&& (typeof yAxisValues7 === "undefined")
			&& (typeof yAxisValues8 === "undefined")&& (typeof yAxisValues9 === "undefined")&& (typeof yAxisValues10 === "undefined"))
	{
	LineChartData = {
		labels : xAxisLabels,
		datasets : [ {
			fillColor : "rgba(151,187,205,0)",
			fill : true,
			strokeColor : "#337ab7",
			pointColor : "#ccc",
			pointStrokeColor : "#fff",
			data : yAxisValues,
			title : title,
			label : title
		} ,
		 {
			fillColor : "rgba(151,187,205,0)",
				fill : true,
				strokeColor : "#33b7b2",
				pointColor : "#ccc",
				pointStrokeColor : "#fff",
				data : yAxisValues2,
				title : title2,
				label : title2
			} ,
		 {
			fillColor : "rgba(151,187,205,0)",
				fill : true,
				strokeColor : "#3296b7",
				pointColor : "#ccc",
				pointStrokeColor : "#fff",
				data : yAxisValues3,
				title : title3,
				label : title3
			} ,
			 {
				fillColor : "rgba(151,187,205,0)",
					fill : true,
					strokeColor : "#b73164",
					pointColor : "#ccc",
					pointStrokeColor : "#fff",
					data : yAxisValues4,
					title : title4,
					label : title4
				} ,
				{
					fillColor : "rgba(151,187,205,0)",
						fill : true,
						strokeColor : "#605358",
						pointColor : "#ccc",
						pointStrokeColor : "#fff",
						data : yAxisValues5,
						title : title5,
						label : title5
					} ,
					{
						fillColor : "rgba(151,187,205,0)",
							fill : true,
							strokeColor : "#72022d",
							pointColor : "#ccc",
							pointStrokeColor : "#fff",
							data : yAxisValues6,
							title : title6,
							label : title6
						} 
		]
	
	}

	return LineChartData;
	}
	
	
}


//@written by vijay
//@desc: auto generates or increments the date(format dd/mm/yyyy), accepts two parameters as arguments, they are date and date seperators 
function incr_Date(date_str,customSplit){
	
 	var parts, incrementedDate; 
 	var unIncrementedDate = date_str;
 	  parts = unIncrementedDate.split(customSplit);
 	  var dt = new Date(
 	    parseInt(parts[2], 10),       //date
 	    parseInt(parts[1], 10) - 1,   //month
 	    parseInt(parts[0], 10)        //year
 	  );
 	  
 	  dt.setDate(dt.getDate() + 1);
 	  parts[0] = "" + dt.getFullYear();
 	  parts[1] = "" + (dt.getMonth() + 1);
 	  if (parts[1].length < 2) {
 	    parts[1] = "0" + parts[1];
 	  }
 	  parts[2] = "" + dt.getDate();
 	  if (parts[2].length < 2) {
 	    parts[2] = "0" + parts[2];
 	  }
 	  incrementedDate = parts[2]+"/"+parts[1]+"/"+parts[0];
 	  
 	 return incrementedDate;
  }

//@written by vijay
//@desc: auto generates or decrements the date(format dd/mm/yyyy), accepts two parameters as arguments, they are date and date seperators  	 
function decr_Date(date_str,customSplit){
	
 	var parts, incrementedDate; 
 	var unIncrementedDate = date_str;
 	  parts = unIncrementedDate.split(customSplit);
 	  var dt = new Date(
 	    parseInt(parts[2], 10),       //date
 	    parseInt(parts[1], 10) - 1,   //month
 	    parseInt(parts[0], 10)        //year
 	  );
 	  dt.setDate(dt.getDate()-1);
 	  parts[0] = "" + dt.getFullYear();
 	  parts[1] = "" + (dt.getMonth()+1);
 	  if (parts[1].length < 2) {
 	    parts[1] = "0" + parts[1];
 	  }
 	  parts[2] = "" + dt.getDate();
 	  if (parts[2].length < 2) {
 	    parts[2] = "0" + parts[2];
 	  }
 	  incrementedDate = parts[2]+"/"+parts[1]+"/"+parts[0];
 	  return incrementedDate;
  }
 	 
function newOpts(customXAxisUnit,customYAxisUnit)
{
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
	      yAxisUnit : customYAxisUnit,
				yAxisUnitFontFamily : "'Arial'",
				yAxisUnitFontSize : 12,
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
   return newopts;
}