/**
 * 
 */


function searchCouponIds(name, searchCategory){
	 var contextPath = $("#contextPath").val(); 
	 //var storeLocation = $("#warehouse_location  option:selected").text();
	 URL = contextPath + "/crm/searchCouponIds.do";
	 $.ajax({
			type: "GET",
			url : URL,
			data : {
				searchName : name,
			//	storeLocation : storeLocation
			},
			beforeSend: function(xhr){                    
	   	   			$("#loading").css("display","block");
	   	   			$("#mainDiv").addClass("disabled");
	   	   		  },
			success : function(result) {
			appendCouponRef(result, searchCategory);
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


function appendCouponRef(couponRefsList, searchCategory){
	 $("."+searchCategory).html('');
	 var op = '';
	 for(var i=0;i<couponRefsList.length;i++){
			 if (i == 0) {
				 op += '<li id="'+couponRefsList[i]+'"  class="selected" onclick=getId(this,"'+searchCategory+'"); ><a>'+couponRefsList[i]+'</a></li>';
			}else
			     op += '<li id="'+couponRefsList[i]+'" onclick=getId(this,"'+searchCategory+'"); ><a>'+couponRefsList[i]+'</a></li>';
	 }
	 $("."+searchCategory).html(op);
	 $("."+searchCategory).show();
	 
}


function getId(element,type){
	var id= $(element).attr("id");
   if(type == "couponRef"){
		$("#couponRef").val(id);
		getGiftCouponDetails(id);
	}
}

function getGiftCouponDetails(id,type){
	var contextPath = $("#contextPath").val();
		URL = contextPath + "/crm/getGiftCouponDetails.do";
		////debugger 
		$.ajax({
			type: "GET",
			url : URL,
			data : {
				couponProgramCode : id
			},
			beforeSend: function(xhr){                    
  	   			$("#loading").css("display","block");
  	   			$("#mainDiv").addClass("disabled");
  	   		  },
  			success : function(result) {
//				$("#right-side").html(result);
//				appendCouponIds(result);
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

/*
function appendCouponIds(couponsList){
	
	$("#noOfReferral").val(couponsList.unitCashValue);
	
}
*/

function viewEditCustomerReferral(referralId,operation){
	 var contextPath = $("#contextPath").val();
	 //purpose:for checking internet conection
		var online = window.navigator.onLine;
	  	if(!online)
	  	{
	  	alert("check your internet connection,please try agian after some time");
	  	return;
	  	}
	 var maxRecords = 10;
	  if($("#maxRecords").length>0)
		  maxRecords = $("#maxRecords").val();
	  
		 var searchCategory = 10;
		  if($("#searchCategory ").length>0)
			  searchCategory = $("#searchCategory ").val();
	  
	 URL = contextPath + "/crm/viewEditCustomerReferral.do";
	$.ajax({
		type: "GET",
		url : URL,
		data : {
			referralId : referralId,
			operation : operation,
			maxRecords : maxRecords,
			searchName: searchCategory 
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


function validateCustomerReferral(operation){
	
	debugger;
	 //purpose:for checking internet conection
	var online = window.navigator.onLine;
  	if(!online)
  	{
  	alert("check your internet connection,please try agian after some time");
  	return;
  	}
  	$("#minpurchaseError").html("");
	$("#referralError").html("");
	$("#couponError").html("");
	$("#validityPeriodError").html("");
	$("#offer_end_dateError").html("");
	var contextPath = $("#contextPath").val();
    var programId = $("#programId").val();
    var programDescription = $("#programDescription").val();
    var noofReferrals = $("#noOfReferral").val();
    var minpurchaseAmt = $("#minPurchaseAmt").val();
    var referralPriority = $("#referralPriority").val();
    var startDate = $("#from").val();
    var endDate = $("#to").val();
    //var couponRef = $("#couponRef").val();
   
    var expiryDate = $("#expiry").val();
    var productGroup = $("#productGroup").val();
    var assignedStatus = $("#assignedStatus").val();
    var multiUser = $("#multiUser").val();
    var validityPeriod = $("#validityPeriod").val();
    var discountType = $("#discountType").val();
    var referralValue = $("#referralValue").val();
    var status = $("#status").val();
    
    var noOfDays = daydiff(parseDate($('#from').val()), parseDate($('#to').val()));
	if(noOfDays < 0){
		$("#offer_end_dateError").html("Expiry Date can't be less than Date");
		return;
	}
    
    if ($('#otpRequired').is(':checked')) 
			$("#otpRequired").val("0");
		else
			$("#otpRequired").val("1");
		
    if ($('#autoCoupons').is(':checked')) 
		$("#autoCoupons").val("0");
	else
		$("#autoCoupons").val("1");
	
    
    var autoCoupons = $("#autoCoupons").val();
    var otpRequired = $("#otpRequired").val();
    var country = $("#country").val();
    
    var zoneLocations = $("#location").val();
	var locations = "";
	var zone = "";
	var zones = $("#zones").val();
	
	if(zones == "" || zones == null){
		$("#errStates").html("Select Zones");
		return;
	}
	
	var locations = $("#location").val();
	if(locations == "" || locations == null){
		$("#errLocation").html("Select Location");
		return;
	}

	$("#selectedLocation").val(locations.toString());
	for(var locItem in zoneLocations)
	{
		locations += zoneLocations[locItem] +","; 
	}
	
	for(var zoneItem in zones )
	{
		zone += zones[zoneItem] +","; 
	}
    var maxRecords = 10;
 	  if($("#maxRecords").length>0)
 		  maxRecords = $("#maxRecords").val();
 	  
 	var searchName = "";
 	  if($("#searchCategory").length>0)
 	   	searchName = $("#searchCategory").val();
    
    var priority="";
    if($("#categoryPriority").length>0)
    	priority = $("#categoryPriority").val();
   
 
    
    if($("#programId").val() == ""){
    	$("#programId").focus();
    	$("#referralError").html("Program ID is Required");
    	return false;
    }
   /* if($("#couponRef").val() == ""){
    	$("#couponRef").focus();
    	$("#couponError").html("Coupon  Batch ref is Required");
    	return false;
    }*/
    if($("#minPurchaseAmt").val() == ""){
    	$("#minPurchaseAmt").focus();
    	$("#minpurchaseError").html("Min Purchase Amt is Required");
    	return false;
    }
    
    if($("#validityPeriod").val() == ""){
    	$("#validityPeriod").focus();
    	$("#validityPeriodError").html("Validity Period is Required");
    	return false;
    }
    var validityPeriod = parseInt($("#validityPeriod").val().trim());
		if(validityPeriod > noOfDays+1){
			if(noOfDays==0 && validityPeriod==1)
				{
				
				}
			else
				{
				$("#validityPeriodError").html("Enter no of days properly");
   			return;
				}

		 }
    if($("#from").val() == ""){
    	$("#from").focus();
    	return false;
    }
    if($("#to").val() == ""){
    	$("#to").focus();
    	return false;
    }
    
    if($("#expiry").val() == ""){
    	$("#expiry").focus();
    	return false;
    }
    
    if(operation=="new"){
     URL = contextPath + "/crm/createCustomerReferral.do";
   	}
   	else if(operation=="edit"){
   	 URL = contextPath + "/crm/updateCustomerReferral.do";
   	}
    var finalObj={}
   
    finalObj.referralProgramId = programId;
    finalObj.programDescription = programDescription;
    //finalObj.couponBatchReference=couponRef;
    finalObj.minumumPurchaseAmount=minpurchaseAmt;
    finalObj.noOfReferrals = noofReferrals;
    finalObj.referralPriority = referralPriority;
    finalObj.startDateStr = startDate;
    finalObj.endDateStr = endDate;
    finalObj.maxRecords = maxRecords;
    finalObj.searchCriteria = searchName;
    finalObj.expiryDateStr=expiryDate;
    finalObj.states=zone;
    finalObj.locations=locations;
    
    finalObj.productGroup=productGroup;
    if(assignedStatus=="0"){
    	finalObj.assignedReferral=true;
    	}
    else{
    	finalObj.assignedReferral=false;
    }
    if(multiUser=="0"){
    	finalObj.multiUser=true;
    	}
    else{
    	finalObj.multiUser=false;
    }
    finalObj.validatePeriod=validityPeriod;
    finalObj.discountType=discountType;
    finalObj.referralValue=referralValue;
    if(otpRequired=="0"){
    	finalObj.otpRequired=true;
    	}
    else{
    	finalObj.otpRequired=false;
    }
    if(autoCoupons=="0"){
    	finalObj.autoGenerated=true;
    	}
    else{
    	finalObj.autoGenerated=false;
    }
    //autoCoupons

    finalObj.country=country;
    
    
    if(status=="Active"){
    	finalObj.status=true;
    	}
    else{
    	finalObj.status=false;
    }
    

     var  formData=JSON.stringify(finalObj);
     console.log("formObj::"+formData);
	$.ajax({
			type: "POST",
			url : URL,
			data:formData,
			contentType: "application/json",
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