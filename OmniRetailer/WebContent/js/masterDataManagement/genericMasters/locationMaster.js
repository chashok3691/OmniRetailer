/*function validateLocationForm(operation){
	 //purpose:for checking internet conection
	var online = window.navigator.onLine;
	debugger;
  	if(!online)
  	{
  	alert("check your internet connection,please try agian after some time");
  	return;
  	}
  	debugger;
		var contextPath = $("#contextPath").val();
	    var streetName = $("#address").val();
	    var area = $("#area").val();
	    var city = $("#city").val();
	    var multipleUserDB = $("#multipleUserDB").val();
	  // var multiuser = ${sessionScope.multipleUserDB};
	    
	    if($("#locationId").val().trim()==""){
	    	$("#locationId").focus();
	    	$("#locationIdError").html("Enter Location Id");
	    	return false;
	    }
	    
	    
	    
	    	
	    if($("#error").text() != ""){
			 $("#phoneNumber").focus();
			 return false;
		 }
	     var defaultCountry = $("#defaultCountry").val().trim();
		 var phoneNumber = $("#phoneNumber").val().trim();
		if(phoneNumber.length!=10){
			$("#phoneNumber").focus();
			$("#error3").html("Enter Valid Phone Number");
			return false;
		}
		 if(defaultCountry != "" && phoneNumber != ""){
			 $("#officePhone").val(defaultCountry+"-"+phoneNumber);
		 }
	    var officePhone = $("#officePhone").val().trim();
	    if(officePhone.trim() == ""){
	    	$("#phoneNumber").focus();
	    	$("#error").html("Office Phone Required");
	    	return false;
	    }
	    var officeMailId = $("#officeMailId").val().trim();
	    if(officeMailId.trim() == ""){
	    	$("#officeMailId").focus();
	    	$("#officeMailIdError").html("Office MailId Required");
	    	return false;
	    }
	    if(!emailValidation(officeMailId)){
	    	$("#officeMailId").focus();
		   	$("#officeMailIdError").html("Invalid EmailId (Ex:abc@gmail.com)");
		   	return false;
		  }
	    if(city.trim() == ""){
	    	$("#city").focus();
	    	$("#cityError").html("City Required");
	    	return false;
	    }
	    if(streetName.trim() == ""){
	    	$("#address").focus();
	    	$("#streetNameError").html("Street Name Required");
	    	return false;
	    }
	    if($("#pin").val().trim() == ""){
	    	$("#pin").focus();
	    	$("#pinError").html("Enter PIN Number");
	    	return false;
	    }
	    else if(area.trim() == ""){
	    	$("#area").focus();
	    	$("#areaError").html("Area Required");
	    	return false;
	    }
	    
	    if(multipleUserDB=="true"){
	    	if($("#gpsLongitude").val().trim() == ""){
		    	$("#gpsLongitude").focus();
		    	$("#gpsLongitudeError").html("GpsLongitude Required");
		    	return false;
		    }
	    	if($("#gpsLatitude").val().trim() == ""){
		    	$("#gpsLatitude").focus();
		    	$("#gpsLatitudeError").html("GpsLatitude Required");
		    	return false;
		    }
	    	if($("#customergstin").val().trim() == ""){
		    	$("#customergstin").focus();
		    	$("#gstnNoError").html("GstnNo Required");
		    	return false;
		    }
	    	if($("#distance").val().trim() == ""){
		    	$("#distance").focus();
		    	$("#distanceError").html("Distance Required");
		    	return false;
		    }
	    	
	    }
	    
	    var formData  = $('form').serializeObject();
	    //debugger;
	    formData.searchCriteria = $("#searchLocation").val(); 
	    formData.maxRecords = $("#maxRecords").val(); 
	    formData.multipleUserDBStr = $("#multipleUserDB").val();
	    formData=JSON.stringify(formData);
	    
	    if(operation=="new"){
	    	 URL = contextPath + "/genericMaster/saveLocation.do";
	   	}
	   	else if(operation=="edit"){
	   		 URL = contextPath + "/genericMaster/updateLocation.do";
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
*/

function validateLocationForm(operation){
	 //purpose:for checking internet conection
	var online = window.navigator.onLine;
	debugger;
  	if(!online)
  	{
  	alert("check your internet connection,please try agian after some time");
  	return;
  	}
  	$("#locationIdError").html("");
  	$("#error3").html("");
  	$("#cityError").html("");
  
		var contextPath = $("#contextPath").val();
	    var streetName = $("#address").val();
	    var area = $("#area").val();
	    var city = $("#city").val();
	    var multipleUserDB = $("#multipleUserDB").val();
	    //var multiuser = ${sessionScope.multipleUserDB};
	    
	    if($("#locationId").val().trim()==""){
	    	$("#locationId").focus();
	    	$("#locationIdError").html("Enter Location Id");
	    	return false;
	    }else if(parseInt($("#locationId").val().length)>50){
			 $("#locationId").focus();
			 $("#locationIdError").html("Location Id can't exceeds 50 characters");
			 return;
		} 
	    	
	    if($("#error").text() != ""){
			 $("#phoneNumber").focus();
			 return false;
		 }
	     var defaultCountry = $("#defaultCountry").val().trim();
		 var phoneNumber = $("#phoneNumber").val().trim();
		if(phoneNumber.length!=10){
			$("#phoneNumber").focus();
			$("#error3").html("Enter Valid Phone Number");
			return false;
		}
		 if(defaultCountry != "" && phoneNumber != ""){
			 $("#officePhone").val(defaultCountry+"-"+phoneNumber);
		 }
	    var officePhone = $("#officePhone").val().trim();
	    if(officePhone.trim() == ""){
	    	$("#phoneNumber").focus();
	    	$("#error").html("Office Phone Required");
	    	return false;
	    }
	    var officeMailId = $("#officeMailId").val().trim();
	    if(officeMailId.trim() == ""){
	    	$("#officeMailId").focus();
	    	$("#officeMailIdError").html("Office MailId Required");
	    	return false;
	    }
	    if(!emailValidation(officeMailId)){
	    	$("#officeMailId").focus();
		   	$("#officeMailIdError").html("Invalid EmailId (Ex:abc@gmail.com)");
		   	return false;
		  }
	    if(city.trim() == ""){
	    	$("#city").focus();
	    	$("#cityError").html("City Required");
	    	return false;
	    }else if(parseInt($("#city").val().length)>15){
			 $("#city").focus();
			 $("#cityError").html("City can't exceeds 15 characters");
			 return;
		} 
	    if(streetName.trim() == ""){
	    	$("#address").focus();
	    	$("#streetNameError").html("Street Name Required");
	    	return false;
	    }else if(parseInt($("#address").val().length)>100){
	    	$("#address").focus();
	    	 $("#streetNameError").html("Street name can't exceeds 100 characters");
	    	 return;
	    }
	    
	    if(area.trim() == ""){
	    	$("#area").focus();
	    	$("#areaError").html("Area Required");
	    	return false;
	    }else if(parseInt($("#area").val().length)>100){
			 $("#area").focus();
			 $("#areaError").html("Area can't exceeds 100 characters");
			 return;
		}
	    
	    if($("#pin").val().trim() == ""){
	    	$("#pin").focus();
	    	$("#pinError").html("Enter PIN Number");
	    	return false;
	    }else if(parseInt($("#pin").val().length)!= 6){
			 $("#pin").focus();
			 $("#pinError").html("Pin should be in 6 digits");
			 return;
		}
	    
	    if(parseInt($("#gpsLongitude").val().length) >50){
	    	$("#gpsLongitude").focus();
	    	$("#gpsLongitudeError").html("GpsLongitude can't exceeds 50 characters");
	    	return false;
	    }
    	if(parseInt($("#gpsLatitude").val().length) >50){
	    	$("#gpsLatitude").focus();
	    	$("#gpsLatitudeError").html("GpsLatitude can't exceeds 50 characters");
	    	return false;
	    }
	    
	    if(operation=="new"){
	    	
	    if(parseInt($("#customergstin").val().length) >20){
			 $("#customergstin").focus();
			 $("#gstnNoError").html("GSTIN No can't exceeds 20 characters");
			 return false;
		}
	    }
	    
	    if(operation=="edit"){
	    	
		    if(parseInt($("#customergstin").val().length) > 20){
				 $("#customergstin").focus();
				 $("#gstnNoError").html("GSTIN No can't exceeds 20 characters");
				 return false;
			}
		    }
	    
	    if(parseInt($("#franchiseCode").val().length) > 50){
			 $("#franchiseCode").focus();
			 $("#franchiseCodeError").html("FranchiseCode can't exceeds 50 characters");
			 return;
		}else{
			 $("#franchiseCodeError").html(" ");
		}
	    
	    var description = $("#description").val().trim();
	    if(description.trim() != "" && parseInt($("#description").val().length)>250){
			$("#description").focus();
			$("#descriptionError").html("Description can't exceeds 250 Characters");
			return false;
		}else{
			$("#descriptionError").html("");
		}
	    
	    if(multipleUserDB=="true"){
	    	if($("#gpsLongitude").val().trim() == ""){
		    	$("#gpsLongitude").focus();
		    	$("#gpsLongitudeError").html("GpsLongitude Required");
		    	return false;
		    }
	    	if($("#gpsLatitude").val().trim() == ""){
		    	$("#gpsLatitude").focus();
		    	$("#gpsLatitudeError").html("GpsLatitude Required");
		    	return false;
		    }
	    	if($("#customergstin").val().trim() == ""){
		    	$("#customergstin").focus();
		    	$("#gstnNoError").html("GstnNo Required");
		    	return false;
		    }
	    	
	    	if($("#distance").val().trim() == ""){
		    	$("#distance").focus();
		    	$("#distanceError").html("Distance Required");
		    	return false;
		    }
	    	
	    }
	    
	    var formData  = $('form').serializeObject();
	    //debugger;
	    formData.searchCriteria = $("#searchLocation").val(); 
	    formData.maxRecords = $("#maxRecords").val(); 
	    formData.multipleUserDBStr = $("#multipleUserDB").val();
	    formData=JSON.stringify(formData);
	    
	    if(operation=="new"){
	    	 URL = contextPath + "/genericMaster/saveLocation.do";
	   	}
	   	else if(operation=="edit"){
	   		 URL = contextPath + "/genericMaster/updateLocation.do";
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


	function viewEditLocation(locationId,operation){
		debugger;
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
   	var searchName = "";
 	  if($("#searchLocation").length>0)
 		 searchName= $("#searchLocation").val();
 	  
 	 /*var zoneID = "";
	  if($("#outletZone").length>0)
		  zoneID= $("#outletZone").val();
	  
	  var gpslongitude = "";
	  if($("#gpsLongitude").length>0)
		  gpslongitude= $("#gpsLongitude").val();
	  
	  var gpslattitude = "";
	  if($("#gpsLatitude").length>0)
		  gpslattitude= $("#gpsLatitude").val();
	  
	  var customergstin = "";
	  if($("#customergstin").length>0)
		  customergstin= $("#customergstin").val();
	  
	  var distance = "";
	  if($("#distance").length>0)
		  distance= $("#distance").val();*/
	 
  	 URL = contextPath + "/genericMaster/editLocation.do";
		$.ajax({
			type: "GET",
			url : URL,
			data : {
				locationId : locationId,
				maxRecords : maxRecords,
				operation : operation,
				searchName : searchName
				//zoneId		:zoneID,
				//gpslongitude:gpslongitude,
				//gpslattitude:gpslattitude,
				//customergstin:customergstin,
				//distance:distance
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
	
	
	$('#searchLocation').on('input',function(e){
		if($(this).val().trim()==""){
			viewLocationMaster('locationMaster','0');
		}
	});
	
	function searchLocationMaster(name,searchCategory,index){
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

   	 name=""
   		 if($("#searchLocation").length>0)
   			name = $("#searchLocation").val().trim();
   	  	
		 URL = contextPath + "/genericMaster/searchLocationMaster.do";
		 $.ajax({
				type: "GET",
				url : URL,
				data : {
					searchName : name,
					maxRecords:maxRecords,
					index : index
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
	

	function validateEmployeeForm(operation){
		debugger
		 //purpose:for checking internet conection
		var online = window.navigator.onLine;
	  	if(!online)
	  	{
	  	alert("check your internet connection,please try agian after some time");
	  	return;
	  	}
		 var employeeCode = $("#locationId").val();
		 var firstName = $("#locationId").val();
		 var lastName = $("#locationId").val();
		 var dob = getCurrentDate();
   	 var doj = getCurrentDate();
   	 var designation = "";
   	 
 	
		var maxRecords="10";
		if($("#maxRecords").length > 0)
			maxRecords = $("#maxRecords").val();
		var searchName;
		
			searchName = "";
   	 
  
   		 
		var	location=""
	   		 if($("#locationId").length>0)
	   			location = $("#locationId").val();
   	 
		 var defaultCountry = $("#defaultCountry").val().trim();
		 var phoneNumber = $("#phoneNumber").val().trim();
   	
  	if(defaultCountry != "" && phoneNumber != ""){
  		var phonuNum= $("#phoneNum").val(defaultCountry+"-"+phoneNumber);
  	}
   	 
	 
   	 
     	
     	
    	 if($("#emailError").text()!=""){
   		 return;
   	 }
   	 var email = $("#emailId").val();
     	  if(email==""){
     		$("#emailError").html("Email Id is required");
     		 return false;
     	  }
   	  if(!emailValidation(email)){
   	   	$("#emailError").html("Invalid EmailId (Ex:abc@gmail.com)");
   	   	return false;
   	  }
   	 
   	  var formData  = JSON.stringify($('form').serializeObject());
   	  var contextPath = $("#contextPath").val();
   	  if(operation == "new")
   		  URL = contextPath + "/genericMaster/createEmployee.do";
   	  else
   		  URL = contextPath + "/genericMaster/updateEmployee.do";
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
  				$("#employeelocation").val(location);
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
	
