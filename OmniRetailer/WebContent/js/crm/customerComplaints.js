$('#searchComplaint').on('input',function(e){
	if($(this).val().trim()==""){
		viewCustomerComplaints('customerComplaints','0');
	}
});


function searchCustomerComplaints(name,searchCategory,index){
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
	 URL = contextPath + "/crm/searchCustomerComplaints.do";
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

function viewEditCustomerComplaints(complaint,operation){
	 var contextPath = $("#contextPath").val();
	 URL = contextPath + "/crm/editCustomerComplaints.do";
	$.ajax({
		type: "GET",
		url : URL,
		data : {
			complaintId : complaint,
			operation : operation
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

function userRating(userRated) {
	$("#userRating1").val(userRated);
}


/*$("#phoneNumber").blur(function(){
	var defaultCountry = $("#defaultCountry").val().trim();
	var phoneNumber = $("#phoneNumber").val().trim();
	if(phoneNumber != ""){
		validateCustomerNumber() ;
	}
});*/

function phoneNumberBlur(){
	var defaultCountry = $("#defaultCountry").val().trim();
	var phoneNumber = $("#phoneNumber").val().trim();
	if(phoneNumber != ""){
		validateCustomerNumber() ;
	}
}

function complaints()
{
	 var mobileNum = $("#mobileNo").val();
	 var contextPath = $("#contextPath").val();
	 URL = contextPath + "/crm/getComplaints.do";
	 $.ajax({
			type: "GET",
			url : URL,
			data : {
				searchName : mobileNum
				
			},
			beforeSend: function(xhr){                    
				$("#loading").css("display","block");
				$("#mainDiv").addClass("disabled");
			},
			success : function(result) {
				appendComplaints(result);
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

function appendComplaints(complaintsList)
{
//	console.log("result:"+complaintsList);
		$("#example1 tbody").html("");
		for(var i=0; i<complaintsList.length; i++){
				var row = '<tr id=dynamicDiv'+i+'><td>'+complaintsList[i].complaintID+'</td><td>'+complaintsList[i].createdBy+'</td><td>'+complaintsList[i].dateTimeStr+'</td><td>'+complaintsList[i].complaintType+'</td><td>'+complaintsList[i].complaintStatus+'</td><td>'+complaintsList[i].complaintDetails+'</td></tr>';
				$("#example1 tbody").append(row);
		}
		var  op = '<a id="Complaint"  data-toggle="modal" data-target="#myModal1"></a>';
		 $("#triggerEvent").append(op);
		 $("#Complaint" ).trigger( "click" );
		 $("#triggerEvent").html("");
	}
	
//9032459458
/*function purchases(index)
{
	var Customer ="customer";
	 var mobileNum = $("#mobileNo").val();
	 var phoneNo = mobileNum ;
	 var contextPath = $("#contextPath").val();
	 URL = contextPath + "/crm/getPurchases.do";
	 $.ajax({
			type: "GET",
			url : URL,
			data : {
				status :Customer ,
				phoneNumber : phoneNo,
				index : index 
			},
			beforeSend: function(xhr){                    
				$("#loading").css("display","block");
				$("#mainDiv").addClass("disabled");
			},
			success : function(result) {
				$('#purchasesBody').html(result);
				var  op = '<a id="purchase"  data-toggle="modal" data-target="#myModal"></a>';
				 $("#triggerEvent").append(op);
				 $("#purchase" ).trigger( "click" );
				 $("#triggerEvent").html("");
				appendPurchases(result);
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

function appendPurchases(purchasesList)
{
//	console.log("result:"+purchasesList);
		$("#example2 tbody").html("");
		for(var i=0; i<purchasesList.length; i++){
				var row = '<tr id=dynamicDiv'+i+'><td>'+purchasesList[i].billId+'</td><td>'+purchasesList[i].sku_id+'</td><td>'+purchasesList[i].item_name+'</td><td>'+purchasesList[i].quantity+'</td><td>'+purchasesList[i].item_total_price+'</td></tr>';
				$("#example2 tbody").append(row);
		}
		var  op = '<a id="purchase"  data-toggle="modal" data-target="#myModal"></a>';
		 $("#triggerEvent").append(op);
		 $("#purchase" ).trigger( "click" );
		 $("#triggerEvent").html("");
	}*/


function getCustomerPurchaseDetails(phoneNo,index){
	//if(phoneNo == undefined || phoneNo == "")
		phoneNo = $("#phoneNumber").val();
	 var maxRecords = "10";
	 if($("#myModal").css("display") == "block")
		 if($("#purchaseMaxRecords").length > 0)
			 maxRecords = $("#purchaseMaxRecords").val();
	 var startDate = "";
	 var endDate = "";
	 if($("#myModal").css("display") == "block")
		 if($("#from").length > 0 && $("#to").length > 0){
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
		 }
	 var searchName = "";
	 if($("#myModal").css("display") == "block")
		 if($("#searchPurchases").length > 0){
			 searchName = $("#searchPurchases").val();
			 if(searchName.length == 1 || searchName.length == 2)
				 return;
		 }
	 var contextPath = $("#contextPath").val();
	 URL = contextPath + "/crm/getCustomerPurchaseDetails.do";
	 $.ajax({
			type: "GET",
			url : URL,
			data : {
				phoneNumber : phoneNo,
				index : index,
				maxRecords : maxRecords,
				startDate : startDate,
				endDate : endDate,
				searchName : searchName
			},
			beforeSend: function(xhr){                    
				$("#loading").css("display","block");
				$("#mainDiv").addClass("disabled");
			},
			success : function(result) {
				$("#purchaseDetails").html(result);
				if($("#myModal").css("display") == "none"){
					var  op = '<a id="purchase"  data-toggle="modal" data-target="#myModal"></a>';
					$("#triggerEvent").append(op);
					$("#purchase" ).trigger( "click" );
					$("#triggerEvent").html("");
				}
//				appendPurchases(result);
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

/*function appendPurchases(purchasesList){
		$("#example2 tbody").html("");
		for(var i=0; i<purchasesList.length; i++){
				var row = '<tr id=dynamicDiv'+i+'><td>'+purchasesList[i].billId+'</td><td>'+purchasesList[i].sku_id+'</td><td>'+purchasesList[i].item_name+'</td><td>'+purchasesList[i].quantity+'</td><td>'+purchasesList[i].item_total_price+'</td></tr>';
				$("#example2 tbody").append(row);
		}
		var  op = '<a id="purchase"  data-toggle="modal" data-target="#myModal"></a>';
		 $("#triggerEvent").append(op);
		 $("#purchase" ).trigger( "click" );
		 $("#triggerEvent").html("");
	}*/

$("#phoneNumber").keydown(function(){
$("#error").html("");
$("#Error").html("");
}); 

$("#phoneNumber").focus(function(){
	$("#error").html("");
	$("#Error").html("");
	}); 

$("#customerEmail").keydown(function(){
$("#customerEmailError").html("");
$("#Error").html("");
}); 

$("#customerEmail").focus(function(){
	$("#customerEmailError").html("");
	$("#Error").html("");
	});

$("#firstName").keydown(function(){
$("#firstNameError").html("");
$("#Error").html("");
}); 
$("#firstName").focus(function(){
	$("#firstNameError").html("");
	$("#Error").html("");
	}); 

$("#lastName").keydown(function(){
$("#lastNameError").html("");
$("#Error").html("");
});

$("#lastName").focus(function(){
	$("#lastNameError").html("");
	$("#Error").html("");
	});

$("#dob").keydown(function(){
$("#dobError").html("");
$("#Error").html("");
});

$("#createdBy").keydown(function(){
$("#createdByError").html("");
$("#Error").html("");
}); 

$("#createdBy").focus(function(){
	$("#createdByError").html("");
	$("#Error").html("");
	}); 

$("#complaintType").keydown(function(){
$("#complaintTypeError").html("");
$("#Error").html("");
}); 

$("#estimatedClosureDate").keydown(function(){
$("#estimatedClosureDateError").html("");
$("#Error").html("");
});

$("#status").keydown(function(){
	$("#statusError").html("");
	$("#Error").html("");
	}); 

$("#status").focus(function(){
	$("#statusError").html("");
	$("#Error").html("");
	}); 




/*$( "#estimatedClosureDate" )
.change(function () {
	  
	   
		alert(d);
}).change();*/
function validateCustomerComplaintsForm(operation){
	debugger;
	var customerComplaints = {}, customer = {};
	var CurrentDate=getCurrentDate().split(" ");
	var  finalstr=CurrentDate[0];
	var noOfDays = daydiff(parseDateMMDDYYYY(finalstr), parseDate($('#estimatedClosureDate').val()));
	if(noOfDays < 0){
		 $("#estimatedClosureDateError").html("Estimated Closure Date can't be Past Date");
		return false;
	}
	var dobDiff = daydiff(parseDateMMDDYYYY(finalstr), parseDate($('#dob').val()));
	if(dobDiff > 0){
		 $("#dobError").html("Birth Date  can't be Future Date");
		return false;
	}
	
	if($("#phoneNumber").val().trim() == ""){
		$("#phoneNumber").focus();
		$("#error").html("Enter  Mobile Number");
		return;
	}
	/*if($("#phoneNumber").val()!= 10){
		$("#error").html("Invalid  Mobile Number");
		return;
	}*/

	var defaultCountry = $("#defaultCountry").val().trim();
	var phoneNumber = $("#phoneNumber").val().trim();
	if(defaultCountry != "" && phoneNumber != ""){
		$("#mobileNo").val(defaultCountry+"-"+phoneNumber);
	}
	var contactNo = $("#mobileNo").val();
	if(contactNo.trim() == ""){
		$("#phoneNumber").focus();
		$("#error").html("Mobile Number Required");
		return false;
	}
	
	if(parseInt($("#customerEmail").val().length)>100){
		 $("#customerEmail").focus();
			$("#customerEmailError").html("Email can't exceeds 100 Characters");
			return;
	}else{
	 $("#customerEmailError").html(" ");
 }
	
	if($("#firstName").val().trim() == ""){
		$("#firstName").focus();
		$("#firstNameError").html("Enter First Name");
		return;
	}
	
	if(parseInt($("#firstName").val().length)>50){
		 $("#firstName").focus();
			$("#firstNameError").html("First Name can't exceeds 50 Characters");
			return;
	}else{
	 $("#firstNameError").html(" ");
  }
	
	if($("#lastName").val().trim() == ""){
		$("#lastName").focus();
		$("#lastNameError").html("Enter Last Name");
		return;
	}
	
	if(parseInt($("#lastName").val().length)>50){
		 $("#lastName").focus();
			$("#lastNameError").html("Last Name can't exceeds 50 Characters");
			return;
	}else{
	 $("#lastNameError").html(" ");
    }
	
	if(parseInt($("#houseNumber").val().length)>20){
		 $("#houseNumber").focus();
			$("#houseNumberError").html("House Number can't exceeds 20 Character");
			return;
	}else{
	 $("#houseNumberError").html(" ");
 }
	 if(parseInt($("#streetName").val().length)>200){
		 $("#streetName").focus();
			$("#streetNameError").html("Street Name can't exceeds 200 Character");
			return;
	}else{
	 $("#streetNameError").html(" ");
   }
	 
	 if(parseInt($("#locality").val().length)>150){
		 $("#locality").focus();
			$("#localityError").html("Locality can't exceeds 150 Character");
			return;
	}else{
	 $("#localityError").html(" ");
   }
	 
	 if(parseInt($("#city").val().length)>30){
		 $("#city").focus();
			$("#cityError").html("City can't exceeds 30 Characters");
			return;
	}else{
	 $("#cityError").html(" ");
   }
	 
	 if(parseInt($("#zipcode").val().length)>6){
		 $("#zipcode").focus();
		 $("#zipcodeError").html("Zip Code can't exceeds 6 Digits");
			return;
	}else{
	     $("#zipcodeError").html(" ");
   }
	
	 if(parseInt($("#landmark").val().length)>150){
		 $("#landmark").focus();
			$("#landmarkError").html("Landmark can't exceeds 150 Characters");
			return;
	}else{
	 $("#landmarkError").html(" ");
   }
	 
	 if(parseInt($("#organizationName").val().length)>50){
		 $("#organizationName").focus();
			$("#organizationNameError").html("Organization Name can't exceeds 50 Characters");
			return;
	}else{
	 $("#organizationNameError").html(" ");
   }
	 
	 if(parseInt($("#createdBy").val().length)>50){
		 $("#createdBy").focus();
		 $("#createdByError").html("Created By can't exceeds 50 Characters");
			return;
	}else{
	 $("#createdByError").html(" ");
    }
	 
	 if(parseInt($("#complaintDetails").val().length)>100){
		 $("#complaintDetails").focus();
		 $("#complaintDetailsError").html("Complaint Details can't exceeds 100 Characters");
			return;
	}else{
	 $("#complaintDetailsError").html(" ");
    }
	
	
	if($("#dob").val().trim() == ""){
		$("#dob").focus();
		$("#dobError").html("Select Date Of Birth");
		return;
	}
	
	if($("#createdBy").val().trim() == ""){
		$("#createdBy").focus();
		$("#createdByError").html("Enter Creater Name");
		return;
	}
	
	if($("#estimatedClosureDate").val().trim() == ""){
		$("#estimatedClosureDate").focus();
		$("#estimatedClosureDateError").html("Select Estimated Closure Date");
		return;
	}
	if($("#storeLocation").val().trim() == ""){
		$("#storeLocation").focus();
		$("#StorelocationError").html("Select Location");
		return;
	}

	/*if($("#status").val().trim() == ""){
		$("#statusError").html("Enter Status");
		return;
	}*/
	
	customer.phone = $("#phoneNumber").val();
	customer.email = $("#customerEmail").val();
	customer.ratingStr = $("#userRating1").val();
	customer.name = $("#firstName").val();
	customer.lastName = $("#lastName").val();
	customer.street = $("#streetName").val();
	customer.locality = $("#locality").val();
	customer.pin_no = $("#zipcode").val();
	customer.city = $("#city").val();
	customer.country = $("#country").val();
	customer.landMark = $("#landmark").val();
	customer.designation = $("#profession").val();
	customer.companyName = $("#organizationName").val();
	customer.gender = $("#gender").val();
	customer.dobStr = $("#dob").val();
	customer.houseNo = $("#houseNumber").val();
	customer.qualification = $("#qualification").val();
	customer.monthlyIncome = $("#monthlyIncome").val();
	customer.relationShipStatus = $("#relationshipStatus").val();
	customer.familySizeStr = $("#familySize").val();
	customer.hobbies = $("#habits").val();
	customerComplaints.complaintID = $("#cid").val();
	customerComplaints.complaintType = $("#complaintType").val();
	customerComplaints.createdBy = $("#createdBy").val();
	customerComplaints.estimatedClosureDateStr = $("#estimatedClosureDate").val();
	customerComplaints.complaintStatus = $("#complaintStatus").val();
	customerComplaints.complaintDetails = $("#complaintDetails").val();
	customerComplaints.complaintMode = $("#complaintMode").val();
	customerComplaints.assignedTo = $("#assignedTo").val();
	customerComplaints.priority = $("#priority").val();
	customerComplaints.complaintStatus = $("#status").val();
	if($("#storeLocation").val() != "")
		customerComplaints.storeLocation = $("#storeLocation").val();

	    customerComplaints.customerObj=customer;
	
		var formData = JSON.stringify(customerComplaints);
//		console.log(formData);
		var contextPath = $("#contextPath").val();
	   if(operation=="new"){
		   URL = contextPath + "/crm/createCustomerComplaints.do";
	   }
	   else if(operation=="edit"){
		   URL = contextPath + "/crm/updateCustomerComplaints.do";
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

function validateCustomerNumber(){
		 phoneNumberParser();
		 var output = $("#output").val();
		 if(output.indexOf(":")<0){
			 $("#error").html(output);
			 return false;
		 }
		 var result = output.split(",");
		 for(var i=0;i<result.length; i++){
			 var val=result[i].split(":");
			 if(val[1] != "true"){
				 $("#error").html("Invalid Phone Number");
				 return false;
			 }
		 }
		var MobileNo= $("#phoneNumber").val();
		var contextPath = $("#contextPath").val();
	   URL = contextPath + "/crm/getCustomerInfo.do";
	$.ajax({
		type: "GET",
	url : URL,
	       data : {
	    	   mobileNum : MobileNo
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
