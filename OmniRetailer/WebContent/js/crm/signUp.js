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
		//debugger 
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
function viewEditCustomerSignUp(campignId,operation){
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
	  
	 URL = contextPath + "/crm/viewEditCustomerSignup.do";
	$.ajax({
		type: "GET",
		url : URL,
		data : {
			campignId : campignId,
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


function validateCustomerSignup(operation){
	debugger;
	 //purpose:for checking internet conection
	$("#programIdError").html("");
	$("#fromError").html("");
	$("#toError").html("");
	
	var online = window.navigator.onLine;
 	if(!online){
 	alert("check your internet connection,please try agian after some time");
 	return;
 	}
   var contextPath = $("#contextPath").val();
   var programId = $("#programId").val();
   if(programId == null || programId.trim() == "" || typeof programId == 'undefined'){
   		$("#programId").val("");
   		$("#programId").focus();
   		$("#programIdError").html("Program Id can't be empty");
   		return;
   	}
   if(parseInt($("#programId").val().length)>50){
		 $("#programId").focus();
			$("#programIdError").html("Program Id can't exceeds 50 Characters");
			return;
	}else{
	 $("#programIdError").html(" ");
 } 
 
   if(parseInt($("#programDescription").val().length)>100){
		 $("#programDescription").focus();
			$("#programDescriptionError").html("Program Description can't exceeds 100 Characters");
			return;
	}else{
	 $("#programDescriptionError").html(" ");
   } 
   
   var noOfDays = daydiff(parseDate($('#from').val()), parseDate($('#to').val()));
	if(noOfDays < 0){
		$("#toError").html("End Date can't be less than Start Date");
		return;
	}
   
   var programDescription = $("#programDescription").val();
   var noOfSignUps = $("#noOfReferral").val();
   
   if(noOfSignUps == null || noOfSignUps.trim() == "" || typeof noOfSignUps == 'undefined')
  	{
  		$("#noOfReferral").val("");
  		$("#noOfReferral").focus();
  		$("#noOfReferralError").html("No of SignUp can't be empty");
  		return;
  	}
   var minimumPurchaseAmount = $("#minPurchaseAmt").val();
   
   if(minimumPurchaseAmount == null || minimumPurchaseAmount.trim() == "" || typeof minimumPurchaseAmount == 'undefined')
 	{
 		$("#minPurchaseAmt").val("");
 		$("#minPurchaseAmt").focus();
 		$("#minimumPurchaseamtError").html("Minimum Purchase Amount can't be empty");
 		return;
 	}
   var signupPriority = $("#referralPriority").val();
   
   var startDate = $("#from").val();
   
   if(startDate == null || startDate.trim() == "" || typeof startDate == 'undefined')
	{
		$("#from").val("");
		$("#fromError").html("Start Date can't be empty");
		$("#from").focus();
		return;
	}
   var endDate = $("#to").val();
   if(endDate == null || endDate.trim() == "" || typeof endDate == 'undefined')
	{
		$("#to").val("");
		$("#toError").html("End Date can't be empty");
		$("#to").focus();
		return;
	}
   var couponRef = $("#couponRef").val();
   var status = $("#status").val();
   if(status == "true"){
	   status = true;
   }else{
	   status =false;
   }
   
   var rewardType = $("#rewardtype").val();
   var loyaltyPlan = $("#loyaltyPlan").val();
  	if(loyaltyPlan == undefined || loyaltyPlan == null || loyaltyPlan == ""){
  		loyaltyPlan = "";
     }  	   	 
   
   
   var offer = $("#offer").val();
	if(offer == undefined || offer == null || offer == ""){
		offer = "";
     }  	   	 
   var signupCash = $("#signupCash").val();
   if(signupCash == undefined || signupCash == null || signupCash == "")
	   signupCash = 0;
   var customerType = $("#customerType").val();
   var maxRecords = "10";
	  if($("#maxRecords").length>0)
		  maxRecords = $("#maxRecords").val();
		 var searchName = "";
	   	 if($("#searchCategory").length>0)
	   	    searchName = $("#searchCategory").val();

   if(operation=="new"){
    URL = contextPath + "/crm/createCustomerSignup.do";
  	}
  	else if(operation=="edit"){
  	 URL = contextPath + "/crm/updateCustomerSignUp.do";
  	}
 
   var finalObj={}
  
   finalObj.campaignId = programId;
   finalObj.campaignDescription = programDescription;
   finalObj.couponBatchReference=couponRef;
   finalObj.minimumPurchaseAmount=parseFloat(minimumPurchaseAmount);
   finalObj.noOfSignUps = parseInt(noOfSignUps);
   finalObj.signupPriority = signupPriority;
   finalObj.startDateStr = startDate;
   finalObj.endDateStr = endDate;
   finalObj.maxRecords = maxRecords;
   finalObj.searchCriteria = searchName;
   finalObj.status = status;
   finalObj.customerType = customerType;
   
   finalObj.rewardType = rewardType;
   finalObj.loyaltyPlan = loyaltyPlan;
   finalObj.offerId = offer;
   finalObj.signupCash = signupCash;
   
    var  formData=JSON.stringify(finalObj);
    console.log(formData);
	$.ajax({
			type: "POST",
			url : URL,
			data:{
				formData : formData,
			},
			//contentType: "application/json",
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