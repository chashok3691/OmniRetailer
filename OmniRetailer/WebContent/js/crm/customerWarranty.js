function searchWarrant(name,searchCategory,index){
	var product = "";
	var maxRecords = "10";
	if($("#maxRecords").length > 0)
		maxRecords = $("#maxRecords").val();
		
	 if($("#product").length>0 && $("#product").val() != "select")
	 		product = $("#product").val();
	 var warehouse_location = "";
	 if($("#warehouse_location").length>0 && $("#warehouse_location").val() != "ALL")
		 warehouse_location = $("#warehouse_location").val();
		 
	 var dealStatus = "";
	 if($("#dealStatus").length>0 && $("#dealStatus").val() != "select")
		 dealStatus = $("#dealStatus").val();
		 
	 var startDate = $("#From").val();
	 var endDate = $("#To").val();
	 if($("#From").val() != "" && $("#To").val() != ""){
 	 var noOfDays = daydiff(parseDate($('#From').val()), parseDate($('#To').val()));
			 if(noOfDays < 0){
				 alert("Start Date can't be less than End Date");
				 return;
			 }
			startDate = $("#From").val() + " 00:00:00";
			 endDate = $("#To").val() + " 00:00:00";
			}else if($("#From").val() != "")
			 startDate = $("#From").val() + " 00:00:00";
			else if($("#To").val() != "")
				endDate = $("#To").val() + " 00:00:00";
	 		var maxRecords = 10;
	 		 if($("#maxRecords").length>0)
	 			 maxRecords = $("#maxRecords").val();

	 var contextPath = $("#contextPath").val();
	 URL = contextPath + "/crm/searchWarrant.do";
	 $.ajax({
			type: "GET",
			url : URL,
			data : {
				searchName : name,
				index : index,
				maxRecords : maxRecords,
				startDate : startDate,
				endDate : endDate,
				product : product,
				warehouse_location : warehouse_location,
				dealStatus : dealStatus
				
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