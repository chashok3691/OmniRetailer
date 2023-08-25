
	$("#roles").change(function(){
		   $("#rolesError").html("");
		   $("#Error").html("");
	 });

function getCode(element,type){
	debugger;
	var id= $(element).attr("id");
	$("#firstName").val($("#"+id+"FN").val());
	$("#lastName").val($("#"+id+"LN").val());
	$("#emailId").val($("#"+id.split(" ").join("")+"Email").val());
	$("#employeeId").val(id);
	var label = $(element).children("a").text();
	$("#searchEmployee").val(label);
	 $(".services").hide();
	 $("."+type).html("");
}

function searchEmployee(name, searchCategory){
		var location = null;
		 //purpose:for checking internet conection
		var online = window.navigator.onLine;
	  	if(!online)
	  	{
	  	alert("check your internet connection,please try agian after some time");
	  	return;
	  	}
		 var contextPath = $("#contextPath").val();
		 URL = contextPath + "/admin/searchEmployee.do";
		 $.ajax({
				type: "GET",
				url : URL,
				data : {
					empName : name,
					location : location
				},
				beforeSend: function(xhr){                    
	   	   			$("#loading").css("display","block");
	   	   			$("#mainDiv").addClass("disabled");
	   	   		  },
				success : function(result) {
					appendEmployee(result, searchCategory);
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

	function appendEmployee(empList, searchCategory){
		 $("."+searchCategory).html('');
		 var op = '';
		 for(var i=0;i<empList.length;i++){
			 if (i == 0) {
				 op += '<li id="'+empList[i].employeeCode+'"  class="selected" onclick=getCode(this,"'+searchCategory+'"); ><a>'+empList[i].firstName+' '+empList[i].lastName+' - '+empList[i].employeeCode+'</a>'+
				 '<input type="hidden" id="'+empList[i].employeeCode.split(" ").join("")+'FN" value="'+empList[i].firstName+'" />'+
				 '<input type="hidden" id="'+empList[i].employeeCode.split(" ").join("")+'LN" value="'+empList[i].lastName+'" />'+
				 '<input type="hidden" id="'+empList[i].employeeCode.split(" ").join("")+'Email" value="'+empList[i].email+'" /></li>';
			}else
				 op += '<li id="'+empList[i].employeeCode+'" onclick=getCode(this,"'+searchCategory+'"); ><a>'+empList[i].firstName+' '+empList[i].lastName+' - '+empList[i].employeeCode+'</a>'+
				 '<input type="hidden" id="'+empList[i].employeeCode.split(" ").join("")+'FN" value="'+empList[i].firstName+'" />'+
				 '<input type="hidden" id="'+empList[i].employeeCode.split(" ").join("")+'LN" value="'+empList[i].lastName+'" />'+
				 '<input type="hidden" id="'+empList[i].employeeCode.split(" ").join("")+'Email" value="'+empList[i].email+'" /></li>';
		 }
		 $("."+searchCategory).html(op);
		 $("."+searchCategory).show();
	}
		
	$("#searchEmployee").keydown(function(e){
		$("#firstNameError").html("");
		if($("#searchEmployee").val().length<3){
			$("#firstName").val("");
			$("#lastName").val("");
			$("#emailId").val("");
			$("#employeeId").val("");
		}
		$(".employee").children("li").each(function(){
			var empName = $(this).children("a").text().trim();
			if($("#searchEmployee").val().trim().toLowerCase() == empName.toLowerCase()){
				$("#searchEmployee").val($("#searchEmployee").val().trim());
				var id = $(this).attr("id");
				$("#firstName").val($("#"+id+"FN").val());
				$("#lastName").val($("#"+id+"LN").val());
				$("#emailId").val($("#"+id+"Email").val());
				$("#employeeId").val(id);
				 $(".services").hide();
				 $(".matchedStringUl").html("");
				return;
			}
			else{
				$("#firstName").val("");
 				$("#lastName").val("");
 				$("#emailId").val("");
 				$("#employeeId").val("");
			}
		});
		if(e.keyCode == 9){
			if($("#searchEmployee").val()!="" && $("#firstName").val() == ""){
				 $("#firstNameError").html("Employee Name doesn't exist");
			 }
			 $(".services").hide();
			 $(".matchedStringUl").html("");
		}
	});
	
	function selectEmployee(id){
		$("#firstName").val($("#"+id+"FN").val());
		$("#lastName").val($("#"+id+"LN").val());
		$("#emailId").val($("#"+id+"Email").val());
		$("#employeeId").val(id);
	}	
	
	
	function viewEditUser(email,operation){
		 var contextPath = $("#contextPath").val();
		 var type = $("#type").val();
		 //purpose:for checking internet conection
			var online = window.navigator.onLine;
		  	if(!online)
		  	{
		  	alert("check your internet connection,please try agian after some time");
		  	return;
		  	}
		 var maxRecords = 10;
		   if($("#maxRecords").length > 0)
		     maxRecords = $("#maxRecords").val();
		 
		   var userLocation=""
		   		 if($("#location").length>0)
		   			userLocation = $("#location").val();
	    	 
	    	 var roleName=""
		   		 if($("#rolesName").length>0)
		   			roleName = $("#rolesName").val();
	    	 
	    	 var searchName=""
		   		 if($("#SkuMaster").length>0)
		   			searchName = $("#SkuMaster").val().trim();
		   
		 URL = contextPath + "/userAccessControl/editUser.do";
		$.ajax({
			type: "GET",
			url : URL,
			data : {
				email : email,
				type : type,
				operation : operation,
				maxRecords : maxRecords,
				userLocation : userLocation,
				roleName : roleName
			},
			beforeSend: function(xhr){                    
  	   			$("#loading").css("display","block");
  	   			$("#mainDiv").addClass("disabled");
  	   		  },
  			success : function(result) {
				$("#right-side").html(result);
				$("#SkuMaster").val(searchName);
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
	
	 function validateNewUserForm(operation){
		 debugger;
    	 var firstName = $("#firstName").val();
    	 
    	 //purpose:for checking internet conection
 		var online = window.navigator.onLine;
 	  	if(!online)
 	  	{
 	  	alert("check your internet connection,please try agian after some time");
 	  	return;
 	  	}
    	 if($("#firstNameError").text() != ""){
    		 $("#firstNameError").html("Employee Name doesn't exist");
				return false;
			}
		  if($("#searchEmployee").val().trim() == ""){
			  $("#firstNameError").html("Enter User Name");
			  $("#searchEmployee").focus();
			  return;
		  }
		  if(firstName == ""){
			  $("#firstNameError").html("Employee Name doesn't exist");
			  $("#searchEmployee").focus();
			  return;
		  }
    	// var lastName = $("#lastName").val();
		 var role = $("#roles").val();
		 if(role == null || role == ""){
			 $("#rolesError").html("Select Atleast one Role");
			 return;
		 }
		/* var r=role.toString();*/
		 if(role.toString().length > 500){
			 $("#Error").html("Length of the Role should not exeed 500 characters");
			 return;
		 }
		 $("#rolenames").val(role.toString());
		 //alert($("#rolenames").val());
    	 var type = $("#type").val();
    	 /*if($("#error").text() != ""){
    		 $("#phoneNumber").focus();
    		 return false;
    	 }
    	*/
    	 if($("#phoneNumber").val() == ""){
    	 $("#phoneNumberError").html("Enter Phone Number"); 	 
		 $("#phoneNumber").focus();
		 return false;
	 }
	
    	 
    	 
    	 var mobileNumber = validateMobileNumber();
  	 	 if(mobileNumber == false){
  	 		$("#phoneNumber").focus();
  	 		$("#phoneNumberError").html("Enter 10 digits Only"); 
  	 		return;
  	 	 }
  	 	 
  	 	 var personalmobileNumber = validatePersonalMobileNumber();
  	 	 if(personalmobileNumber == false){
  	 		$("#phoneNumber1").focus();
  	 		$("#phoneNumber1Error").html("Enter 10 digits Only"); 
  	 		return;
  	 	 }
  	 	 
    	 
    	 var maxRecords = 10;
    	   if($("#maxRecords").length > 0)
    	     maxRecords = $("#maxRecords").val();
    	 

		   var userLocation=""
		   		 if($("#location").length>0)
		   			userLocation = $("#location").val();
	    	 
	    	 var roleName=""
		   		 if($("#rolesName").length>0)
		   			roleName = $("#rolesName").val();
	    	 var searchName=""
		   		 if($("#SkuMaster").length>0)
		   			searchName = $("#SkuMaster").val().trim();
    	   
    	 var defaultCountry = $("#defaultCountry").val().trim();
    	 var phoneNumber = $("#phoneNumber").val().trim();
		 if(defaultCountry != "" && phoneNumber != ""){
			 $("#contactOffice").val(defaultCountry+"-"+phoneNumber);
		 }
    	 var contactOffice = $("#contactOffice").val();
    	 if(contactOffice == ""){
    		 $("#error").html("Contact Office is Required");
    		 $("#phoneNumber").focus();
    		 return false;
    	 }
    	/* if($("#error1").text() != ""){
    		 $("#phoneNumber1").focus();
    		 return false;
    	 }*/
    	 defaultCountry = $("#defaultCountry1").val().trim();
    	 phoneNumber = $("#phoneNumber1").val().trim();
		 if(defaultCountry != "" && phoneNumber != ""){
			 $("#contactPersonnel").val(defaultCountry+"-"+phoneNumber);
		 }
    	 var contactPersonnel = $("#contactPersonnel").val();
    	 if(contactPersonnel == ""){
    		 $("#error1").html("Contact Personnal is Required");
    		 $("#phoneNumber1").focus();
    		 return false;
    	 }
    	 if(firstName.trim() == ""){
         	$("#firstNameError").html("First Name is required");
         	$("#firstName").focus();
  	  		return false;
  	  	 }
         
       /*  if(lastName.trim() == ""){
         	$("#lastNameError").html("Last Name is required");
         	$("#lastName").focus();
  	  		return false;
  	  	 }*/
    	 var email = $("#emailId").val();
    	 var password = $("#password").val();
      	  if(email.trim() == ""){
      		$("#emailError").html("Email is required");
      		$("#email").focus();
      		  return false;
      	  }
    	  if(!emailValidation(email)){
    	   	$("#emailError").html("Invalid EmailId (Ex:abc@gmail.com)");
    	   	$("#email").focus();
    	   	return false;
    	  }
    	  if(password.trim() == ""){
       		 $("#passError").html("Password is required");
       		 $("#password").focus();
       		  return false;
       	  }
    	  if(!passwordValidation(password)){
   	  		$("#passError").html("Invalid Password (Ex:Tech123@)");
   	  		$("#password").focus();
   	  		$("#password").val("");
   	  		return false;
   	  	  }
    	  if($("#confirmPassword").length){
    	  var confirmPassword = $("#confirmPassword").val();
    	  if(confirmPassword.trim() == ""){
        	 $("#confPassError").html("Confirm Password is required");
        	 $("#confirmPassword").focus();
        	 return false;
          }
    	  if(password != confirmPassword){
    		 $("#confPassError").html("Password did not match");
         	 $("#confirmPassword").focus();
         	 $("#confirmPassword").val("");
         	 return false;
    	  }
    	  }
    	  if(contactOffice.trim() == ""){
         	 $("#error").html("Contact Office is required");
         	 $("#phoneNumber").focus();
         	 return false;
           }
    	  if(contactPersonnel.trim() == ""){
         	 $("#error1").html("Contact Personnal is required");
         	 $("#phoneNumber1").focus();
         	 return false;
           }
    	  var formData  = JSON.stringify($('form').serializeObject());
    	  var contextPath = $("#contextPath").val();
    	  if(operation=="new"){
 	    	 URL = contextPath + "/userAccessControl/createUser.do";
 	   	   }
 	   	   else if(operation=="edit"){
 	   		 URL = contextPath + "/userAccessControl/updateUser.do";
 	   	   }
    	 
   		$.ajax({
   			type: "POST",
   			url : URL,
   		//	contentType: "application/json",
   			data : {
   				formData : formData,
   				type : type,
   				maxRecords : maxRecords
   			},
   			beforeSend: function(xhr){                    
	   	   		$("#loading").css("display","block");
	   	   		$("#mainDiv").addClass("disabled");
	   	   	},
   			success : function(result) {
   				$("#right-side").html(result);
   				$("#location").val(userLocation);
   				$("#rolesName").val(roleName);
   				$("#SkuMaster").val(searchName);
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