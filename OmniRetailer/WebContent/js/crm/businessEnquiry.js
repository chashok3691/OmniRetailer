function searchBusinessEnquiry(name,searchCategory,index){
	 var location = "";
	 var startDate = "";
	 var endDate = "";
	 if($("#toLocation").length>0 && $("#toLocation").val != "select" && $("#toLocation").val != "-- Select --")
 		location = $("#toLocation").val();
		if($("#from").val() != "" && $("#to").val() != ""){
 			var noOfDays = daydiff(parseDate($('#from').val()), parseDate($('#to').val()));
			 if(noOfDays < 0){
				 alert("Start Date can't be less than End Date");
				 return;
			 }
			 startDate = $("#from").val() + " 00:00:00";
			 endDate = $("#to").val() + " 00:00:00";
		}else if($("#from").val() != "")
			 startDate = $("#from").val() + " 00:00:00";
		else if($("#to").val() != "")
			endDate = $("#to").val() + " 00:00:00";
 		var maxRecords = 10;
 		 if($("#maxRecords").length>0)
 			 maxRecords = $("#maxRecords").val();
  		 var contextPath = $("#contextPath").val();
  		 URL = contextPath + "/crm/searchBusinessEnquiry.do";
  		 $.ajax({
  				type: "GET",
  				url : URL,
  				data : {
  					searchName : name,
  					index : index,
  					location : location,
  					maxRecords : maxRecords,
  					startDate : startDate,
 					endDate : endDate
  				},
  				beforeSend: function(xhr){                    
  		   	   		$("#loading").css("display","block");
  		   	   		$("#mainDiv").addClass("disabled");
  		   	   	},
  				success : function(result) {
  					$('#right-side').html(result);
  					/*if($("#searchProduct").val != "")
  						$("#pagination").css("display","none");
  					else
  						$("#pagination").css("display","block");*/
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


$(document).ready(function(){
$("#firstName").focus(function(e){
	if($("#firstName").val().trim()!="")
	   $("#firstNameError").html("");
	   
})
});

function validateBusinessEnquiry(operation){
	var finalObj = {};
	var CurrentDate=getCurrentDate().split(" ");
	var  finalstr=CurrentDate[0];
	var noOfDays = daydiff(parseDateMMDDYYYY(finalstr), parseDate($('#enquiryDate').val()));
	if(noOfDays > 0){
		 $("#enquiryDateError").html("EnquiryDate can't be Futuer Date");
		return false;
	}
	var countOfDays = daydiff(parseDateMMDDYYYY(finalstr), parseDate($('#contactDate').val()));
	if(countOfDays < 0){
		 $("#contactDateError").html("contactDate can't be Past Date");
		return false;
	}
	if($("#firstName").val().trim() == ""){
		$("#firstNameError").html("Enter Name");
		focusDiv('firstNameError');
		return;
	}
	
	if(parseInt($("#firstName").val().length)>30){
		 $("#firstName").focus();
			$("#firstNameError").html("First Name can't exceeds 30 Characters");
			return;
	}else{
	 $("#firstNameError").html(" ");
 }
	
	if(parseInt($("#lastName").val().length)>30){
		 $("#lastName").focus();
			$("#lastNameError").html("Last Name can't exceeds 30 Characters");
			return;
	}else{
	 $("#lastNameError").html(" ");
   }
	
	var emailId = $("#emailId").val().trim();
	if(emailId == ""){
		$("#emailIdError").html("EmailId Required(Ex:abc@gmail.com)");
		focusDiv('emailIdError');
	   	return false;
	}
	if(!emailValidation(emailId)){
		$("#emailIdError").html("Invalid EmailId (Ex:abc@gmail.com)");
		focusDiv('emailIdError');
	   	return false;
	}
	
	if(parseInt($("#emailId").val().length)>100){
		 $("#emailId").focus();
			$("#emailIdError").html("EmailId can't exceeds 100 Characters");
			return;
	}else{
	 $("#emailIdError").html(" ");
  }
	
	if($("#phoneNumber").val().length!= 10){
	$("#error").html("Invalid  Mobile Number");
	return;
}
	
	if(parseInt($("#houseNo").val().length)>20){
		 $("#houseNo").focus();
			$("#houseNoError").html("House Number can't exceeds 20 Character");
			return;
	}else{
	 $("#houseNoError").html(" ");
 }
	 if(parseInt($("#streetName").val().length)>100){
		 $("#streetName").focus();
			$("#streetNameError").html("Street Name can't exceeds 100 Character");
			return;
	}else{
	 $("#streetNameError").html(" ");
   }
	 
	 if(parseInt($("#location").val().length)>150){
		 $("#location").focus();
			$("#locationError").html("Locality can't exceeds 150 Character");
			return;
	}else{
	 $("#locationError").html(" ");
   }
	 
	 if(parseInt($("#city").val().length)>30){
		 $("#city").focus();
			$("#cityError").html("City can't exceeds 30 Characters");
			return;
	}else{
	 $("#cityError").html(" ");
   }
	 if(parseInt($("#state").val().length)>25){
		 $("#state").focus();
			$("#stateError").html("State can't exceeds 25 Characters");
			return;
	}else{
	 $("#stateError").html(" ");
    }
	 
	 if(parseInt($("#zipCode").val().length)>6){
		 $("#zipCode").focus();
			$("#zipCodeError").html("Zip Code can't exceeds 6 Digits");
			return;
	}else{
	 $("#zipCodeError").html(" ");
   }
	 if(parseInt($("#enquirySubject").val().length)>150){
		 $("#enquirySubject").focus();
		 $("#enquirySubjectError").html("Subject can't exceeds 150 Character");
			return;
	}else{
	 $("#enquirySubjectError").html(" ");
   }
	 
	 if(parseInt($("#enquiryDesc").val().length)>200){
		 $("#enquiryDesc").focus();
		 $("#enquiryDescError").html("Description can't exceeds 200 Character");
			return;
	}else{
	 $("#enquiryDescError").html(" ");
   }

    var defaultCountry = $("#defaultCountry").val().trim();
	 var phoneNumber = $("#phoneNumber").val().trim();
	 if(defaultCountry != "" && phoneNumber != ""){
		 finalObj.phoneNumber = defaultCountry+"-"+phoneNumber;
		 $("#error").text("");
	 }else{
		 $("#error").text("Phone Number is Required");
		 focusDiv('error');
		 return;
	 }
	 if($("#error").text() != ""){
		 $("#phoneNumber").focus();
		 return false;
	 }
	var re = /^[0-9/]+$/;
	 if($("#enquiryDate").val().trim() == ""){
			$("#enquiryDateError").html("Enter a Date");
			return;
	 }
	 if(!re.test($("#enquiryDate").val())){
			$("#enquiryDateError").html("Invalid Date");
			return;
	 }
	 if($("#contactDate").val().trim() != ""){
		 if(!re.test($("#contactDate").val())){
				$("#contactDateError").html("Invalid Date");
				return;
		 }
	var noOfDays = daydiff(parseDate($('#enquiryDate').val()), parseDate($('#contactDate').val()));
	if(noOfDays < 0){
			 $("#contactDateError").html("Contact Date can't be less than Enquiry Date");
			 return;
		 }
	 }
	 if($("#enquiryDesc").val() == ""){
		 $("#enquiryDesc").html("Enter Description");
		 return;
	 }
	 if($("#storeLocation").val()==""){
		 $("#Error").html("Select Location");
		 $("#storeLocation").focus();
		 return;
	 }else{
		 $("#Error").html("");
	 }
	 
	 /*var storeLocation=$("#storeLocation").val();
	 
	 alert(storeLocation);*/
	 
	finalObj.fromFirstName = $("#firstName").val().trim();
	finalObj.fromLastName = $("#lastName").val();
	finalObj.emailId = $("#emailId").val();
	finalObj.enquiryDateStr = $("#enquiryDate").val();
	finalObj.enquiryTimeStr= $("#enquiryTime").val();
	finalObj.contactDateStr = $("#contactDate").val();
	finalObj.contactTimeStr= $("#contactTime").val();
	finalObj.houseNo = $("#houseNo").val();
	finalObj.streetName= $("#streetName").val();
	finalObj.location = $("#storeLocation").val();
	finalObj.city= $("#city").val();
	finalObj.state = $("#state").val();
	finalObj.zipCode= $("#zipCode").val();
	finalObj.enquiryType = $("#enquiryType").val();
	finalObj.enquiryChannel= $("#enquiryChannel").val();
	finalObj.enquirySubject = $("#enquirySubject").val();
	finalObj.enquiryDesc = $("#enquiryDesc").val();
	if($("#storeLocation").val() != "")
		finalObj.storeLocation = $("#storeLocation").val();
	finalObj.status = $("#statusType").val();
    var contextPath = $("#contextPath").val();
    if(operation=="new"){
	 URL = contextPath + "/crm/createBusinessEnquiry.do";
    }
    else if(operation=="edit"){
	   finalObj.enquiryId = $("#enquiryId").val();
	   URL = contextPath + "/crm/updateBusinessEnquiry.do";
    }
   	var formData = JSON.stringify(finalObj);
//   	 console.log(formData);
//   	 return;
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


function viewEditBusinessEnquiry(enquiryId,operation){
	 var contextPath = $("#contextPath").val();
	//added by manasa
		var formData={}
		 formData.storeLocation = $("#toLocation").val();
		formData.startDate = $("#from").val();
		 formData.endDate = $("#to").val();
		 var formData = JSON.stringify(formData);
	 
	 URL = contextPath + "/crm/viewEditBusinessEnquiry.do";
	$.ajax({
	type: "GET",
	url : URL,
	data : {
		enquiryId : enquiryId,
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