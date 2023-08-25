//viswanath

$('#searchLog').on('input',function(e){
	if($(this).val().trim()==""){
		viewApplicationLog('applicationLog','0');
	}
});

	/*function searchApplicationLog(name,searchCategory,index){
		debugger;
 		if(name == "")
 			name = $("#searchLog").val();
 		 var maxRecords = 10;
 		 if($("#maxRecords").length>0)
 			 maxRecords = $("#maxRecords").val();
 		 
 		var startDate = "";
 		var endDate = "";

 		if($("#from").val() != "" && $("#to").val() != ""){
 			 			var noOfDays = daydiff(parseDate($('#from').val()), parseDate($('#to').val()));
 						 if(noOfDays < 0){
 							 alert("End Date Can't be less than Start Date");
 							 return;
 						 }else if(noOfDays > 0){
 		 		 			 alert("Start Date and End Date must need to be same");
 		 		 			 return;
 		 		 		 }	
 						 startDate = $("#from").val() + " 00:00:00";
 						 endDate = $("#to").val() + " 00:00:00";
 		 			}else if($("#from").val() != ""){
 						 startDate = $("#from").val() + " 00:00:00";
 		 			}else if($("#to").val() != ""){
 		 				endDate = $("#to").val() + " 00:00:00";
 		 			} 	 
 		 var location = "";
 		 if($("#outletLocation").length>0 && $("#outletLocation").val != "select" && $("#outletLocation").val != "-- Select --")
	 		location = $("#outletLocation").val();
 		 
 		 var contextPath = $("#contextPath").val();
 		 URL = contextPath + "/systemLog/searchApplicationLog.do";
 		 $.ajax({
 				type: "GET",
 				url : URL,
 				data : {
 					searchName : name,
 					index : index,
 					location : location,
 					maxRecords : maxRecords,
 					startDate : startDate,
 					endDate : endDate,
 				},
 				beforeSend: function(xhr){                    
 		   	   		$("#loading").css("display","block");
 		   	   		$("#mainDiv").addClass("disabled");
 		   	   	},
 				success : function(result) {
 					$('#right-side').html(result);
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


function searchApplicationLog(name,searchCategory,index){
		debugger;
 		if(name == "")
 			name = $("#searchLog").val();
 		 var maxRecords = 10;
 		 if($("#maxRecords").length>0)
 			 maxRecords = $("#maxRecords").val();
 		 
 		var startDate = "";
 		var endDate = "";

 		if($("#appfrom").val() != "" && $("#to").val() != ""){
 			 			var noOfDays = daydiff(parseDate($('#appfrom').val()), parseDate($('#to').val()));
 						 if(noOfDays < 0){
 							 alert("End Date Can't be less than Start Date");
 							 return;
 						 }else if(noOfDays > 0){
 		 		 			 alert("Start Date and End Date must need to be same");
 		 		 			 return;
 		 		 		 }	
 						 startDate = $("#appfrom").val() + " 00:00:00";
 						 endDate = $("#to").val() + " 00:00:00";
 		 			}else if($("#appfrom").val() != ""){
 						 startDate = $("#appfrom").val() + " 00:00:00";
 		 			}else if($("#to").val() != ""){
 		 				endDate = $("#to").val() + " 00:00:00";
 		 			} 	 
 		 var location = "";
 		 if($("#outletLocation").length>0 && $("#outletLocation").val != "select" && $("#outletLocation").val != "-- Select --")
	 		location = $("#outletLocation").val();
 		 
 		 var contextPath = $("#contextPath").val();
 		 URL = contextPath + "/systemLog/searchApplicationLog.do";
 		 $.ajax({
 				type: "GET",
 				url : URL,
 				data : {
 					searchName : name,
 					index : index,
 					location : location,
 					maxRecords : maxRecords,
 					startDate : startDate,
 					endDate : endDate,
 				},
 				beforeSend: function(xhr){                    
 		   	   		$("#loading").css("display","block");
 		   	   		$("#mainDiv").addClass("disabled");
 		   	   	},
 				success : function(result) {
 					$('#right-side').html(result);
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




