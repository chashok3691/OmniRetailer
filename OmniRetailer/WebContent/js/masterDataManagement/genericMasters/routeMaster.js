function appendRouteMapDetails(){
	$('.odd').remove();
	 var routeStartDate =  $("#startDate").val();
	 var routeEndDate = $("#endDate").val();
	var slNo=1;
	$('.slno').each(function(){
			$(this).text(slNo);
			slNo = parseInt(slNo) + 1;
		});
//debugger
     var contextPath = $("#contextPath").val();
	 var len = parseInt($("#routeMasterTable tr").length);
		if (len != 1)
			len = parseInt($("#routeMasterTable tr:last").attr("id").replace('dynamicdiv', '')) + 1;
	 var row = "<tr id='dynamicdiv"+len+"' style='margin-top:5px;'><td id='slno"+len+"' class='slno'>"+slNo+"</td>" +
	"<td><input class='form-control calendar_icon startDate'  readonly='readonly' style='width:100px;background-color: white;' id='routeStartDate"+len+"' value='"+routeStartDate+"' type='text' onfocus=callCalender('routeStartDate"+len+"') onclick=callCalender('routeStartDate"+len+"') placeholder='DD/MM/YYYY' /></td>" +
	"<td><input class='form-control calendar_icon endDate'  readonly='readonly' style='width:100px;background-color: white;' id='routeEndDate"+len+"' type='text' value='"+routeEndDate+"' onfocus=callCalender('routeEndDate"+len+"') onclick=callCalender('routeEndDate"+len+"') placeholder='DD/MM/YYYY' /></td>" +
	"<td style=''><input type='text' class='form-control ' placeholder='HH:MM:SS' onBlur='validatetime()'  id='routeStartTime"+len+"'/></td>" +
	"<td ><input type='text' class='form-control '  placeholder='HH:MM:SS'  onBlur='validateEndtime()' id='routeEndTime"+len+"'/></td>" +
	"<td><div ><input type='text' id='latitude"+len+"' style='vertical-align: -2px;width:100%' ></div></td>"+
	"<td><div ><input type='text' id='langitude"+len+"'  style='vertical-align: -2px;width:100%' ></div></td>"+
	"<td><div style='width: 170px;'><input type='text' id='description"+len+"'  style='vertical-align: -2px' class='sun'></div></td>"+
	"<td><div><input type='text' id='maxOrders"+len+"'  style='vertical-align: -2px;width:100%' class='sun'></div></td>"+
	"<td id='Del"+ len +"' ><img id='Img"+ len +"' src='"+contextPath+"/images/itemdelete.png' style='width:30px;cursor:pointer;' onclick='deleteItem(this);' />" +
	"</td></tr>";
	 $("#routeMasterTable tbody").append(row);
	callCalender("routeStartDate"+len);
	callCalender("routeEndDate"+len);
}

function deleteItem(element){
	var id = $(element).attr("id").replace('Img','');
	$('#dynamicdiv'+id).remove();
}


function createRouteMaster(id,operation){
	 //purpose:for checking internet conection
	var online = window.navigator.onLine;
	
	if(!online)
	{
	alert("check your internet connection,please try agian after some time");
	return;
	}
	debugger;
		var contextPath = $("#contextPath").val();
	  
	    var maxRecords = 10;
	  if($("#maxRecords").length>0)
		  maxRecords = $("#maxRecords").val();
	  var searchName ="";
	  if($("#searchTax").length>0)
	  searchName = $("#searchTax").val();

	    
	
	    var routeId = $("#routeId").val().trim();
	    var routeName = $("#routeName").val().trim();
	    var routeCategory = $("#routeCategory").val();
	    var routeZone = $("#outletZone").val();
	    var pickupLocation = $("#location").val();
	    var enddate = $("#endDate").val().trim();
	    var endpoint = $("#endPoint").val().trim();
	    var startdate = $("#startDate").val().trim();
	    var zoneId = $("#outletZone").val();
	    
	   
	    if(routeName.trim() == ""){
	    	$("#routeNameError").html("Route  Name Required");
	    	return false;
	    }else if(parseInt($("#routeName").val().length)>=100){
			 $("#routeName").focus();
				$("#routeNameError").html("Route name can't exceeds 100 Characters");
				return;
			}
	    
	    if(startdate.trim() == ""){
	    	$("#startDateError").html("Start Date Required");
	    	$("#startDate").focus();
	    	return false;
	    }
	    
	    if(enddate.trim() == ""){
	    	$("#endDateError").html("End Date Required");
	    	$("#endDate").focus();
	    	return false;
	    }
	    
	    var noOfDays = daydiff(parseDate($('#startDate').val()), parseDate($('#endDate').val()));
		 if(noOfDays < 0){
			 $("#endDateError").focus();
			 $("#endDateError").html("End Date  can't be less than Start Date");
			 return;
		 }
	    
	    //debugger
	  	var finalObj = {};
		
	  	
//		finalObj.taxLocationsList = locDetails;
		finalObj.routeId = routeId;
		finalObj.routeName = routeName;
		finalObj.routeCategory = routeCategory;
//		finalObj.taxName = routeZone;
		finalObj.city = pickupLocation;
		finalObj.pickupPoint = pickupLocation;
		finalObj.endDateStr = enddate;
		finalObj.endPoint = endpoint;
		finalObj.startDateStr = startdate;
		finalObj.zone = zoneId;
		finalObj.maxRecords = maxRecords;
		finalObj.searchCriteria = searchName;
		finalObj.routeStatusStr = $("#routeStatusStr").val();
		
		
		finalObj.day1 = $("#mondayChkbox").prop("checked");
		finalObj.day2 = $("#tuesdayChkbox").prop("checked");
		finalObj.day3 = $("#wednesdayChkbox").prop("checked");
		finalObj.day4 = $("#thursdayChkbox").prop("checked");
		finalObj.day5 = $("#fridayChkbox").prop("checked");
		finalObj.day6 = $("#saturdayChkbox").prop("checked");
		finalObj.day7 = $("#sundayChkbox").prop("checked");

		
		
		 var len = $("#routeMasterTable tr").length-1;
		var items=[];
		 for(var i=1;i<=len;i++){
				var idAttr = $("#routeMasterTable tr:eq("+i+") td:last").attr("id");
				idAttr = idAttr.replace('Del','');
				
				if(len == 0){
					alert("Add atleast one Map Details");
					return;
				}
				
				
				if($("#routeStartTime"+i).val() == "")
				{
					alert("Please Enter Start Time as Format of HH:MM:SS");
//					$("#routeStartTime" + idAttr).css("border-color", "red");
//					$("#routeStartTime" + idAttr).focus();
					return false;
				}
				if($("#routeEndTime"+idAttr).val() == "")
				{
					alert("Please Enter End Time as Format of HH:MM:SS");
//					$("#routeEndTime" + idAttr).css("border-color", "red");
//					$("#routeEndTime" + idAttr).focus();
					return false;
				}
					
				/*var mapStartTime = $("#routeStartTime"+idAttr).html();
				var  mapStartTimeWithoutam = mapStartTime.split(" ");
				alert(mapStartTimeWithoutam)*/
				var obj = {sno:$("#slno").val(),startDateStr:$("#routeStartDate"+idAttr).val(),startTimeStr:$("#routeStartTime"+idAttr).val(),endDateStr:$("#routeEndDate"+idAttr).val(),endTimeStr:$("#routeEndTime"+idAttr).val(),gpsLatitude:$("#latitude"+idAttr).val(),gpsLongitude:$("#langitude"+idAttr).val(),description:$("#description"+idAttr).val(),maximum_allowed_orders:$("#maxOrders"+idAttr).val()};
				items.push(obj);
				
		 }
		
		 finalObj.routeList = items;
	  	  	var formData = JSON.stringify(finalObj);
	    
	  	if(operation == "new")
		URL = contextPath + "/genericMaster/createRouteMaster.do";
	  	else
	  	URL = contextPath + "/genericMaster/updateRouteMaster.do"; 		
		 
		$.ajax({
			type: "POST",
			url : URL,
			contentType: "application/json",
			data :formData,
			beforeSend: function(xhr){                    
 	   			$("#loading").css("display","block");
 	   			$("#mainDiv").addClass("disabled");
 	   		  },
			success : function(result) {
				$("#right-side").html(result);
//				$("#maxRecords").val(maxRecords);
				$("#loading").css("display","none");
				$("#mainDiv").removeClass('disabled');
				
			},
			error : function() {
				 alert("something went wrong");
				$("#loading").css("display","none");
				$("#mainDiv").removeClass('disabled');
			}
		});
	}



/*function createRouteMaster(id,operation){
	 //purpose:for checking internet conection
	var online = window.navigator.onLine;
	
 	if(!online)
 	{
 	alert("check your internet connection,please try agian after some time");
 	return;
 	}
 	debugger;
		var contextPath = $("#contextPath").val();
	  
	    var maxRecords = 10;
 	  if($("#maxRecords").length>0)
 		  maxRecords = $("#maxRecords").val();
 	  var searchName ="";
 	  if($("#searchTax").length>0)
	  searchName = $("#searchTax").val();

	    
 	
	    var routeId = $("#routeId").val().trim();
	    var routeName = $("#routeName").val().trim();
	    var routeCategory = $("#routeCategory").val();
	    var routeZone = $("#outletZone").val();
	    var pickupLocation = $("#location").val();
	    var enddate = $("#endDate").val().trim();
	    var endpoint = $("#endPoint").val().trim();
	    var startdate = $("#startDate").val().trim();
	    var zoneId = $("#outletZone").val();
	    
	   
	    if(routeName.trim() == ""){
	    	$("#routeNameError").html("Route  Name Required");
	    	return false;
	    }
	    
	    if(startdate.trim() == ""){
	    	$("#startDateError").html("Start Date Required");
	    	$("#startDate").focus();
	    	return false;
	    }
	    
	    if(enddate.trim() == ""){
	    	$("#endDateError").html("End Date Required");
	    	$("#endDate").focus();
	    	return false;
	    }
	    
	    var noOfDays = daydiff(parseDate($('#startDate').val()), parseDate($('#endDate').val()));
		 if(noOfDays < 0){
			 $("#endDateError").focus();
			 $("#endDateError").html("End Date  can't be less than Start Date");
			 return;
		 }
	    
	    //debugger
	  	var finalObj = {};
		
	  	
//		finalObj.taxLocationsList = locDetails;
		finalObj.routeId = routeId;
		finalObj.routeName = routeName;
		finalObj.routeCategory = routeCategory;
//		finalObj.taxName = routeZone;
		finalObj.city = pickupLocation;
		finalObj.pickupPoint = pickupLocation;
		finalObj.endDateStr = enddate;
		finalObj.endPoint = endpoint;
		finalObj.startDateStr = startdate;
		finalObj.zone = zoneId;
		finalObj.maxRecords = maxRecords;
		finalObj.searchCriteria = searchName;
		finalObj.routeStatusStr = $("#routeStatusStr").val();
		
		 var len = $("#routeMasterTable tr").length-1;
		var items=[];
		 for(var i=1;i<=len;i++){
				var idAttr = $("#routeMasterTable tr:eq("+i+") td:last").attr("id");
				idAttr = idAttr.replace('Del','');
				
				if(len == 0){
					alert("Add atleast one Map Details");
					return;
				}
				
				
				if($("#routeStartTime"+i).val() == "")
				{
					alert("Please Enter Start Time as Format of HH:MM:SS");
//					$("#routeStartTime" + idAttr).css("border-color", "red");
//					$("#routeStartTime" + idAttr).focus();
					return false;
				}
				if($("#routeEndTime"+idAttr).val() == "")
				{
					alert("Please Enter End Time as Format of HH:MM:SS");
//					$("#routeEndTime" + idAttr).css("border-color", "red");
//					$("#routeEndTime" + idAttr).focus();
					return false;
				}
					
				var mapStartTime = $("#routeStartTime"+idAttr).html();
				var  mapStartTimeWithoutam = mapStartTime.split(" ");
				alert(mapStartTimeWithoutam)
				var obj = {sno:$("#slno").val(),startDateStr:$("#routeStartDate"+idAttr).val(),startTimeStr:$("#routeStartTime"+idAttr).val(),endDateStr:$("#routeEndDate"+idAttr).val(),endTimeStr:$("#routeEndTime"+idAttr).val(),gpsLatitude:$("#latitude"+idAttr).val(),gpsLongitude:$("#langitude"+idAttr).val(),description:$("#description"+idAttr).val(),maximum_allowed_orders:$("#maxOrders"+idAttr).val()};
				items.push(obj);
				
		 }
		
		 finalObj.routeList = items;
	  	  	var formData = JSON.stringify(finalObj);
	    
	  	if(operation == "new")
		URL = contextPath + "/genericMaster/createRouteMaster.do";
	  	else
	  	URL = contextPath + "/genericMaster/updateRouteMaster.do"; 		
		 
		$.ajax({
			type: "POST",
			url : URL,
			contentType: "application/json",
			data :formData,
			beforeSend: function(xhr){                    
  	   			$("#loading").css("display","block");
  	   			$("#mainDiv").addClass("disabled");
  	   		  },
			success : function(result) {
				$("#right-side").html(result);
//				$("#maxRecords").val(maxRecords);
				$("#loading").css("display","none");
				$("#mainDiv").removeClass('disabled');
				
			},
			error : function() {
				 alert("something went wrong");
				$("#loading").css("display","none");
				$("#mainDiv").removeClass('disabled');
			}
		});
	}*/

function viewEditRouteMaster(routeId,operation){
	 //purpose:for checking internet conection
	var online = window.navigator.onLine;
 	if(!online)
 	{
 	alert("check your internet connection,please try agian after some time");
 	return;
 	}
	 var contextPath = $("#contextPath").val();
	 var maxRecords = 10;
 	  if($("#maxRecords").length>0)
 		  maxRecords = $("#maxRecords").val();
 	  var searchName ="";
 	  if($("#searchTax").length>0)
	  searchName = $("#searchTax").val();
 	  
	 URL = contextPath + "/genericMaster/viewEditRouteMaster.do";
	$.ajax({
		type: "GET",
		url : URL,
		data : {
			routeId : routeId,
			operation : operation,
			maxRecords: maxRecords,
			searchName: searchName
		},
		beforeSend: function(xhr){                    
	   			$("#loading").css("display","block");
	   			$("#mainDiv").addClass("disabled");
	   		  },
		success : function(result) {
			$("#right-side").html(result);
			$("#loading").css("display","none");
			$("#mainDiv").removeClass('disabled');
		},
		error : function() {
			 alert("something went wrong");
			 $("#loading").css("display","none");
			 $("#mainDiv").removeClass('disabled');
		}
	});
}

function validatetime() {
	
	 var len = $("#routeMasterTable tr").length-1;
	 for(var i=1;i<=len;i++){
		
			var idAttr = $("#routeMasterTable tr:eq("+i+") td:last").attr("id");
			idAttr = idAttr.replace('Del','');
    var time = document.getElementById("routeStartTime"+idAttr).value;
    //alert(time);
    var re = /^([0-9]|0[0-9]|1[0-9]|2[0-3]):[0-5][0-9]:[0-5][0-9]$/;


    if (!re.test(time)) {
        alert("Time is Invalid and Please Enter Start Time as Format Of HH:MM:SS");
//        $("#routeStartTime" +idAttr).focus();
        return false;
//        document.getElementById("result").innerHTML = "Please Enter Time AS is valid";
    } 
	 }
}

function validateEndtime() {
	
	 var len = $("#routeMasterTable tr").length-1;
	 for(var i=1;i<=len;i++){
		//debugger
		var idAttr = $("#routeMasterTable tr:eq("+i+") td:last").attr("id");
		idAttr = idAttr.replace('Del','');
   var time = document.getElementById("routeEndTime"+idAttr).value;
   //alert(time);
   var re = /^([0-9]|0[0-9]|1[0-9]|2[0-3]):[0-5][0-9]:[0-5][0-9]$/;


   if (!re.test(time)) {
       alert("Time is Invalid and Please Enter End Time as Format Of HH:MM:SS");
//       $("#routeEndTime" + idAttr).focus();
//   	$("#qty" + idAttr).focus();
       return false;
//       document.getElementById("result").innerHTML = "Please Enter Time AS is valid";
   } 
	 }
}