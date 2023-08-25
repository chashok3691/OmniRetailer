function searchCustomerFeedback(name,searchCategory,index){
	                  debugger;
		   		 var location = "";
		   		var feedbackCategory = "";
		   		var startDate = $("#startdate").val();
 	 		 var endDate = $("#enddate").val();
 	 		 var status="";
 	 		
 	 		 if($("#location").length>0 && $("#location").val != "")
	    	 		location = $("#location").val();
 	 		 
 	 		 
 	 		 
 	 		 
 /*	 		if($("#feedbackCategory").length>0 && $("#feedbackCategory").val != "")
 	 			feedbackCategory = $("#feedbackCategory").val();*/
 	 		 
 	 			
	    	 		var maxRecords = 10;
	    	 		 if($("#maxRecords").length>0)
	    	 			 maxRecords = $("#maxRecords").val();
	    	 		
			  		 var contextPath = $("#contextPath").val();
			  		 URL = contextPath + "/crm/searchCustomerFeedback.do";
			  		 $.ajax({
			  				type: "GET",
			  				url : URL,
			  				data : {
			  					searchName : name,
			  					index : index,
			  					location : location,
			  					maxRecords : maxRecords,
			  					status : status,
			  					startDate : startDate,
			  					feedbackCategory:feedbackCategory,
	    	 					endDate : endDate
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

function validateCustomerFeedbackForm(operation){
	
	debugger;
	var Feedback = {}, customer = {};
	
	var location=$("#location").val();
	
	
	
	/*if($("#location").val().trim() == ""){
		$("#locationError").html("Enter Location");
		return;
	}*/
	if($("#customer_rating").val()==0){
		$("#Error").html("Customer Rating must be between 1 to 5");
		return;
	}
	
	
	var date=/^[0-9/]+$/;
	
	
	
	
	
	var feedbackChannel=$("#feedbackChannel").val();
	/*if($("#feedbackChannel").val().trim() == ""){
		$("#channelError").html("Enter feedback channel");
		return;
	}*/
	
	
	var defaultCountry = $("#defaultCountry").val().trim();
	
	var phoneNumber = $("#phoneNumber").val().trim();
	
	
	
	var contactNo = $("#mobileNo").val();
	
	
	var firstName = $("#firstName").val();
	
	
	
	
	
	
	
	
	
	
	Feedback.feedback_id = $("#feedbackId").val();
	Feedback.customer_emailId = $("#customerEmail").val();
	//Feedback.customer_rating = $("#userRating1").val();
	Feedback.customerName = $("#firstName").val()+' '+$("#lastName").val();
	Feedback.feedbackCategory =$("#feedbackCategory").val();
	Feedback.lastName = $("#lastName").val();
	Feedback.storeLocation = $("#location").val();
	Feedback.feedbackChannel = $("#feedbackChannel").val();
	Feedback.customer_mobileNo = $("#phoneNumber").val();
	//Feedback.country = $("#defaultCountry").val();
	Feedback.feedback_date = $("#date").val();
	Feedback.customerComments =$("#customerComments").val();
	//Feedback.rating=rating;
	
	//added by koti
	
	Feedback.customer_rating=$("input:radio[name='stars']:checked").val();
	Feedback.outlet_rating=$("input:radio[name='starss']:checked").val();
	Feedback.onlineExp_rating=$("input:radio[name='starsss']:checked").val();
	Feedback.mobileShopping_rating=$("input:radio[name='starssss']:checked").val();
	Feedback.staffBehaviour_rating=$("input:radio[name='starsssss']:checked").val();
	
	Feedback.houseNo=$("#customerAddress1").val();
	Feedback.street=$("#customerAddress2").val();
	Feedback.locality=$("#Area").val();
	Feedback.city=$("#City").val();
	Feedback.summaryRating=parseFloat($("#summaryRatingHid").val());
		//$("input:radio[name='star']:checked").val();
	Feedback.order_ref=$("#orderId").val();

	
	
	
		var formData = JSON.stringify(Feedback);
		console.log(formData);
		var contextPath = $("#contextPath").val();
	   if(operation=="new"){
		   URL = contextPath + "/crm/createCustomerFeedback.do";
	   }
	   else if(operation=="edit"){
		   
		   URL = contextPath + "/crm/updateFeedback.do";
	   }
	   
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
function editFeedback(feedback_id,operation){
	 var contextPath = $("#contextPath").val();
	 
	//added by manasa
		var formData={}
		 formData.storeLocation = $("#gridlocation").val();
		formData.startDate = $("#From").val();
		 formData.endDate = $("#To").val();
		 var formData = JSON.stringify(formData);
	 
	 URL = contextPath + "/crm/editFeedback.do";
	$.ajax({
	type: "GET",
	url : URL,
	data : {
		feedback_id : feedback_id,
		operation : operation,
		formData : formData
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
var rating_value;

function userrating(rating){
	$(("#"+rating_value)).val(rating);
}

$( "#feedbackCategory" )
	.change(function () {
		rating_value=$((this)).val();
		var num=$(("#"+rating_value)).val();
		 
		if(num==0){
	    	$('#stars_group').find('input:radio').prop('checked', false);
	 }
	else if(num == 1){	 
		 $(".star-1").trigger("click");
	}else if(num == 2){
		$(".star-2").trigger("click");
	}else if(num == 3){
		$(".star-3").trigger("click");
	}else if(num == 4){
		$(".star-4").trigger("click");
	}else if(num == 5){
		$(".star-5").trigger("click");
	} 	
		
	}).change();
	

/*$( "#feedbackCategory" )
.change(function () {
	
	 
	searchCustomerFeedback('','','0');
	
}).change();
*/
