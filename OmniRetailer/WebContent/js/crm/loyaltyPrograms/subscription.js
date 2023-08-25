/**
 * 
 */
function createSubscription(operation){
	var re = /^[0-9/]+$/;
	debugger;
	 //purpose:for checking internet conection
	var online = window.navigator.onLine;
 	if(!online)
 	{
 	alert("check your internet connection,please try agian after some time");
 	return;
 	}
	var subscription = {};
	if($("#subscriptionCode").val().trim() == ""){
		$("#subscriptionCode").focus();
		$("#errsubscriptionCode").html("Enter Subscription Code");
		return;
	}
	
	/*if($("#subscriptionName").val().trim() == ""){
		$("#subscriptionName").focus();
		$("#errPromoName1").html("Enter Subscription name");
		return;
	}*/
	
	var subscriptionCode=$("#subscriptionCode").val();
	if(subscriptionCode.length<5){
			$("#errsubscriptionCode").html("Enter atleast 5 Characters/Numbers");
			return;
		}
	if($("#startDate").val() == ""){
		$("#startDateError").html("select start date");
		return;
	}
	if(!re.test($("#startDate").val())){
		$("#startDateError").html("Invalid Date");
		return;
	}
	if($("#endDate").val() == ""){
		$("#endDateError").html("select end date");
		return;
	}
	if(!re.test($("#endDate").val())){
		$("#endDateError").html("Invalid Date");
		return;
	}
	var daysToExpire = daydiff(new Date(), parseDate($('#endDate').val()));
if(daysToExpire < 0){
	 $("#endDateError").html("End Date should be greater than today");
	 return;
 }
	debugger;
	 var noOfDays = daydiff(parseDate($('#startDate').val()), parseDate($('#endDate').val()));
	 
	 if(noOfDays>=0)
		{
		noOfDays=noOfDays+1;
		}
	 
	 if(noOfDays < 0){
		 $("#endDateError").html("End Date can't be less than Start Date");
		 return;
	 }
		
	  var maxRecords = 10;
 	  if($("#maxRecords").length>0)
 		  maxRecords = $("#maxRecords").val();
		
		var rewardType = "";
		if($("#rewardType").length > 0)
			rewardType = $("#rewardType").val();
			
			var rewardPrice = 0;
		if($("#rewardPrice").length > 0)
			rewardPrice = $("#rewardPrice").val();
		
		
    subscription.subscriptionId = $("#subscriptionCode").val();
    subscription.subscriptionName = $("#subscriptionName").val();
    subscription.startDateStr = $("#startDate").val();
    subscription.endDateStr = $("#endDate").val();
    subscription.period = $("#subscriptionType").val();
    subscription.status= $("#subscriptionStatus").val();
    subscription.rewardPrice= rewardPrice;
    subscription.rewardType= rewardType;
    subscription.SubcriptionNo= $("#noOfSubscriptions").val();

	if(operation == "edit"){
    subscription.createdDateStr=$("#subsCreatedDate").val();
    subscription.updatedDateStr=$("#subsUpdatedDate").val();
    subscription.discount=$("#discount").val();
    subscription.assignedStatus=$("#assignedStatus").val();
    subscription.mobileNum=$("#mobileNum").val();

	/*subscription.creditBasedOrder=$("#isCreditBasedOrder").val();*/
    subscription.userName=$("#userName").val();
	subscription.roleName=$("#roleName").val();
	subscription.previousOrderDateStr=$("#previousordereddate").val();
	}
	
    debugger
    var len = $("#subpItmesList tr").length-1;
	var subscriptionItems = [];
	
		for(var i=1;i<=len;i++){
			
			var idAttr = $("#subpItmesList tr:eq("+i+") td:last").attr("id");
				idAttr = idAttr.replace('action','');
				
				var itemStatus = $("#subsItemStatus"+idAttr+" option:selected").val();
				
						
					var obj = {
							skuId:$("#SkuID"+idAttr).text(),
							quantity:$("#quantity"+idAttr).text(),
							pluCode:$("#pluCode"+idAttr).text(),
							itemName:$("#itemName"+idAttr).text(),
							mrp:$("#mrp"+idAttr).text(),
							status:itemStatus,
							createdDateStr:$("#createdDate"+idAttr).val(),
							updatedDateStr:$("#updatedDate"+idAttr).val(),
							salePrice:$("#salePrice"+idAttr).text(),
							uom:$("#uom"+idAttr).text(),
							measureRange:$("#measureRange"+idAttr).text(),
							taxCode:$("#taxCode"+idAttr).text(),
					};
					subscriptionItems.push(obj);
			}		
					
					subscription.subscriptionProductsList = subscriptionItems;
	
		var formData = JSON.stringify(subscription);
		console.log(formData);
		var contextPath = $("#contextPath").val();
		
	   if(operation=="new"){
		   URL = contextPath + "/crm/createSubscription.do";
	   }
	   else if(operation=="edit"){
		   URL = contextPath + "/crm/updateSubscription.do";
	   }
	   
	  	 $.ajax({
			type: "POST",
			url : URL,
			 data : {
				 formData : formData,
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
						alert("Something went wrong.");
						$("#loading").css("display","none");
						$("#mainDiv").removeClass('disabled');
					}
			});
}

function viewSubscriptionDetails(id,subscriptionType,type){
	debugger;
	var contextPath = $("#contextPath").val();
	
	  var URL = contextPath + "/crm/viewEditSubscriptionDetails.do";
	
 		if(id=="" || id == null){
 			id = $("#subscriptionId").val();
 		}
	
		$.ajax({
			/*type: "GET",*/
			url : URL,
			data : {
				id : id,
				type : type,
				subscriptionType : subscriptionType
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
				 alert("Something went wrong.");
				$("#loading").css("display","none");
				$("#mainDiv").removeClass('disabled');
			}
		});
	
}


