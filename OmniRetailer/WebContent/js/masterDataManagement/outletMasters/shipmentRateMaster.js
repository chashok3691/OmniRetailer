
$(document).ready(function(){
	
});


//viswanath
$('#searchShipmentRate').on('input',function(e){
	if($(this).val().trim()==""){
		viewShipmentRateMaster('shipmentRateMaster','0');
	}
});

function searchShipmentRate(name,searchCategory,index){
	 //purpose:for checking internet conection
	var online = window.navigator.onLine;
  	if(!online)
  	{
  	alert("check your internet connection,please try agian after some time");
  	return;
  	}
	 var contextPath = $("#contextPath").val();
	 URL = contextPath + "/outletMaster/searchShipmentRate.do";

	 var maxRecords = 10;
	    	  if($("#maxRecords").length>0)
	    		  maxRecords = $("#maxRecords").val();

	  name=""
	 	  if($("#searchShipmentRate").length>0)
	 	   	name = $("#searchShipmentRate").val().trim();
	    	  
	 $.ajax({
			type: "GET",
			url : URL,
			data : {
				searchName : name,
				index : index,
				maxRecords: maxRecords 
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
function viewEditShipmentRate(rateNo,operation){
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
	  		if($("#searchShipmentRate").length>0)
	  			searchName = $("#searchShipmentRate").val();

	 URL = contextPath + "/outletMaster/editShipmentRate.do";
	$.ajax({
		type: "GET",
		url : URL,
		data : {
			rateNo : rateNo,
			operation : operation,
			maxRecords : maxRecords,
			searchName : searchName

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


$("#locationId").change(function(){
	if($("#locationId").val().trim() == ""){
		$("#locationIdError").html("Select any Location");
		return;
	} else{
		$("#locationIdError").html("");
	}

});

$("#shipmentMode").change(function(){
	if($("#shipmentMode").val().trim() == ""){
		$("#shipmentModeError").html("Select Shipment Mode");
		return;
	} else{
		$("#shipmentModeError").html("");
	}

});

$("#shipmentType").change(function(){
	if($("#shipmentType").val().trim() == ""){
		$("#shipmentTypeError").html("Select Shipment Type");
		return;
	} else{
		$("#shipmentTypeError").html("");
	}

});

$("#shipmentCost").keydown(function(){
	   $("#shipmentCostError").html("");
	   $(".Error").html("");
}); 


/*function validateShipmentRateForm(operation){
	
	 //purpose:for checking internet conection
	var online = window.navigator.onLine;
  	if(!online)
  	{
  	alert("check your internet connection,please try agian after some time");
  	return;
  	}
	var shipmentRateMaster = {};
	 
	if($("#locationId").val().trim() == ""){
		$("#locationIdError").html("Select any Location");
		 $("#locationId").focus();
		
		return;
	}
	if($("#shipmentType").val().trim() == ""){
		$("#shipmentTypeError").html("Select Shipment Type");
		 $("#shipmentType").focus();
		return;
	}
	
	if($("#shipmentMode").val().trim() == ""){
		$("#shipmentModeError").html("Select Shipment Mode");
		$("#shipmentMode").focus();
		return;
	}
	if($("#shipmentCost").val().trim() == ""){
		$("#shipmentCostError").html("Enter Shipment Cost");
		 $("#shipmentCost").focus();
		return;
	}

	shipmentRateMaster.sno = $("#sno").val();
	shipmentRateMaster.locationId = $("#locationId").val();
	shipmentRateMaster.shipmentCountry = $("#country").val();
	shipmentRateMaster.shipmentType = $("#shipmentType").val();
	shipmentRateMaster.shipmentMode = $("#shipmentMode").val();
	shipmentRateMaster.packageType = $("#packageType").val();
	shipmentRateMaster.distanceStartRangeValue = $("#distanceStartRange").val();
	shipmentRateMaster.distanceEndRangeValue = $("#distanceEndRange").val();
	shipmentRateMaster.orderStartPrice = $("#orderValueStartRange").val();
	shipmentRateMaster.orderEndPrice = $("#orderValueEndRange").val();
	shipmentRateMaster.orderQuantityStartValue = $("#orderQuantityStartRange").val();
	shipmentRateMaster.orderQuantityEndValue = $("#orderQuantityEndRange").val();
	shipmentRateMaster.weightStartRangeValue = $("#weightStartRange").val();
	shipmentRateMaster.weightEndRangeValue = $("#weightEndRange").val();
	shipmentRateMaster.shipmentCost = $("#shipmentCost").val();
	shipmentRateMaster.remarks = $("#remarks").val();
	shipmentRateMaster.maxRecords = $("#maxRecords").val();
	shipmentRateMaster.searchCriteria = $("#searchShipmentRate").val();
		
		var contextPath = $("#contextPath").val();
	   if(operation=="new"){
		   URL = contextPath + "/outletMaster/createShipmentRateMaster.do";
	   }
	   else if(operation=="edit"){
		   URL = contextPath + "/outletMaster/updateShipmentRateMaster.do";
	   }
		var formData = JSON.stringify(shipmentRateMaster);
//		console.log(formData);
	  	 $.ajax({
			type: "POST",
			url : URL,
			contentType: "application/json",
			data : formData,
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

}*/


function validateShipmentRateForm(operation){
	
	 //purpose:for checking internet conection
	var online = window.navigator.onLine;
 	if(!online)
 	{
 	alert("check your internet connection,please try agian after some time");
 	return;
 	}
 	$("#distanceStartRangeError").html("");
 	$("#distanceEndRangeError").html("");
	$("#orderValueStartRangeError").html("");
	$("#orderValueEndRangeError").html("");
	var shipmentRateMaster = {};
	if($("#locationId").val().trim() == ""){
		$("#locationIdError").html("Select any Location");
		 $("#locationId").focus();
		
		return;
	}
	if($("#shipmentType").val().trim() == ""){
		$("#shipmentTypeError").html("Select Shipment Type");
		 $("#shipmentType").focus();
		return;
	}
	
	if($("#shipmentMode").val().trim() == ""){
		$("#shipmentModeError").html("Select Shipment Mode");
		$("#shipmentMode").focus();
		return;
	}
	
	if($("#distanceStartRange").val().trim() == ""){
		$("#distanceStartRangeError").html("Enter Distance Start Range");
		 $("#distanceStartRange").focus();
		return;
	}
	
	if($("#distanceEndRange").val().trim() == ""){
		$("#distanceEndRangeError").html("Enter Distance End Range");
		 $("#distanceEndRange").focus();
		return;
	}
	
	if($("#orderValueStartRange").val().trim() == ""){
		$("#orderValueStartRangeError").html("Enter ordervalue Start Range");
		 $("#orderValueStartRange").focus();
		return;
	}
	
	
	if($("#orderValueEndRange").val().trim() == ""){
		$("#orderValueEndRangeError").html("Enter ordervalue End Range");
		 $("#orderValueEndRange").focus();
		return;
	}

	if($("#shipmentCost").val().trim() == ""){
		$("#shipmentCostError").html("Enter Shipment Cost");
		 $("#shipmentCost").focus();
		return;
	}
	
	var remarks = $("#remarks").val().trim();
	 if(remarks.trim() != "" && parseInt($("#remarks").val().length)>250){
			$("#remarks").focus();
			$("#remarksError").html("Remarks can't exceeds 250 Characters");
			return false;
	}

	shipmentRateMaster.sno = $("#sno").val();
	shipmentRateMaster.locationId = $("#locationId").val();
	shipmentRateMaster.shipmentCountry = $("#country").val();
	shipmentRateMaster.shipmentType = $("#shipmentType").val();
	shipmentRateMaster.shipmentMode = $("#shipmentMode").val();
	shipmentRateMaster.packageType = $("#packageType").val();
	shipmentRateMaster.distanceStartRangeValue = $("#distanceStartRange").val();
	shipmentRateMaster.distanceEndRangeValue = $("#distanceEndRange").val();
	shipmentRateMaster.orderStartPrice = $("#orderValueStartRange").val();
	shipmentRateMaster.orderEndPrice = $("#orderValueEndRange").val();
	shipmentRateMaster.orderQuantityStartValue = $("#orderQuantityStartRange").val();
	shipmentRateMaster.orderQuantityEndValue = $("#orderQuantityEndRange").val();
	shipmentRateMaster.weightStartRangeValue = $("#weightStartRange").val();
	shipmentRateMaster.weightEndRangeValue = $("#weightEndRange").val();
	shipmentRateMaster.shipmentCost = $("#shipmentCost").val();
	shipmentRateMaster.remarks = $("#remarks").val();
	shipmentRateMaster.maxRecords = $("#maxRecords").val();
	shipmentRateMaster.searchCriteria = $("#searchShipmentRate").val();
		
		var contextPath = $("#contextPath").val();
	   if(operation=="new"){
		   URL = contextPath + "/outletMaster/createShipmentRateMaster.do";
	   }
	   else if(operation=="edit"){
		   URL = contextPath + "/outletMaster/updateShipmentRateMaster.do";
	   }
		var formData = JSON.stringify(shipmentRateMaster);
//		console.log(formData);
	  	 $.ajax({
			type: "POST",
			url : URL,
			contentType: "application/json",
			data : formData,
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




