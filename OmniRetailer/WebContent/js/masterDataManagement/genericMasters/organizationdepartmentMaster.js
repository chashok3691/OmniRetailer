//validating the email format
$("#orgdeptEmail").blur(function(){
	  var email = $("#orgdeptEmail").val();
	  if(email==""){
		 return false;
	  }
	  if(!emailValidation(email)){
	   	$("#orgdeptEmailError").html("Invalid EmailId (Ex:abc@gmail.com)");
	   	return false;
	  }
	  else{
		$("#orgdeptEmailError").html("");
	    return true;
	  }
	}); 

$("orgdeptEmail").keydown(function(){
	   $("#orgdeptEmailError").html("");
	   $("#Error").html("");
});
/**
 * @author Vasudeva Reddy.G
 * @param operation
 * @returns {Boolean}
 * @description: This function is used to validate the form data.
 * This method checks the operation to be performed and sends the corresponding request to the method in the controller
 * @Created_On:06-Aug-2019
 * @Reviewed_by Surya on 20-Aug-2019
 */

/*function validateOrganizationDepartment(operation){
	 //purpose:for checking internet conection
	debugger;
	 //purpose:for checking internet conection
	var online = window.navigator.onLine;
 	if(!online)
 	{
 	alert("check your internet connection,please try agian after some time");
 	return;
 	}
	var orgdeptDetails = {};
	if($("#orgdeptId").val().trim() == ""){
		$("#orgdeptId").focus();
		$("#orgdeptIDError").html("Enter Department ID");
		return;
	}
	if($("#orgdeptName").val().trim() == ""){
		$("#orgdeptName").focus();
		$("#orgdeptNameError").html("Enter Department Name");
		return;
	}
	if($("#orgdeptDescription").val().trim() == ""){
		$("#orgdeptDescription").focus();
		$("#orgdeptDescError").html("Enter Department description");
		return;
	}
	if($("#orgdeptEmail").val().trim() == ""){
		$("#orgdeptEmail").focus();
		$("#orgdeptEmailError").html("Enter Department Email");
		return;
	}
	orgdeptDetails.deptEmail = $("#orgdeptEmail").val().trim();
	 if(!emailValidation(orgdeptDetails.deptEmail)){
	   	   	$("#orgdeptEmailError").html("Invalid EmailId (Ex:abc@gmail.com)");
	   	   	return ;
	   	  }
	if($("#orgdeptPhonenum").val().trim() == ""){
		$("#orgdeptPhonenum").focus();
		$("#orgdeptPhnError").html("Enter mobile number");
		return;
	}
	var phoneNumber = $("#orgdeptPhonenum").val().trim();
	if(phoneNumber.length != 10){
		$("#orgdeptPhnError").html("Invalid  Mobile Number");
		return ;
		}
	  var maxRecords = 10;
 	  if($("#maxRecords").length>0)
 		  maxRecords = $("#maxRecords").val();
 	  
 	  var searchName ="";
 	  if($("#searchAsset").length>0)
	  searchName = $("#searchAsset").val();	 

	
 	 orgdeptDetails.deptId = $("#orgdeptId").val().trim();
 	orgdeptDetails.deptName = $("#orgdeptName").val().trim();
 	orgdeptDetails.deptDescription = $("#orgdeptDescription").val().trim();
 	orgdeptDetails.parentDept = $("#orgdeptParent").val().trim();
 	orgdeptDetails.deptEmail=$("#orgdeptEmail").val().trim();
 	orgdeptDetails.deptPhnNo = $("#orgdeptPhonenum").val().trim();
 	orgdeptDetails.maxRecords = maxRecords;
 	orgdeptDetails.searchCriteria = searchName; 	
		var formData = JSON.stringify(orgdeptDetails);
		console.log(formData);
		var contextPath = $("#contextPath").val();
	   if(operation=="new"){
		   URL = contextPath + "/inventorymanager/createOrganizationalDept.do";
	   }
	   else if(operation=="edit"){
		   
		   URL = contextPath + "/inventorymanager/updateOrganizationDepartment.do";
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
						alert("Internal error, please contact Technolabs support.");
						$("#loading").css("display","none");
						$("#mainDiv").removeClass('disabled');
					}
			});
}*/


function validateOrganizationDepartment(operation){
	 //purpose:for checking internet conection
	debugger;
	 //purpose:for checking internet conection
	var online = window.navigator.onLine;
	if(!online)
	{
	alert("check your internet connection,please try agian after some time");
	return;
	}
	$("#orgdeptIDError").html("");
	$("#orgdeptNameError").html("");
	$("#orgdeptDescError").html("");
	$("#orgdeptEmailError").html("");
	$("#orgdeptPhnError").html("");
	var orgdeptDetails = {};
	if($("#orgdeptId").val().trim() == ""){
		$("#orgdeptId").focus();
		$("#orgdeptIDError").html("Enter Department ID");
		return;
	}else if(parseInt($("#orgdeptId").val().length)>=10){
		 $("#orgdeptId").focus();
			$("#orgdeptIDError").html("Department ID can't exceeds 10 Characters");
			return;
		}
	if($("#orgdeptName").val().trim() == ""){
		$("#orgdeptName").focus();
		$("#orgdeptNameError").html("Enter Department Name");
		return;
	}else if(parseInt($("#orgdeptName").val().length)>=10){
		 $("#orgdeptName").focus();
			$("#orgdeptNameError").html("Department name can't exceeds 10 Characters");
			return;
		}
	if($("#orgdeptDescription").val().trim() == ""){
		$("#orgdeptDescription").focus();
		$("#orgdeptDescError").html("Enter Department description");
		return;
	}else if(parseInt($("#orgdeptDescription").val().length)>=50){
		$("#orgdeptDescription").focus();
		$("#orgdeptDescError").html("description can't exceeds 50 Characters");
	}
	if($("#orgdeptEmail").val().trim() == ""){
		$("#orgdeptEmail").focus();
		$("#orgdeptEmailError").html("Enter Department Email");
		return;
	}
	orgdeptDetails.deptEmail = $("#orgdeptEmail").val().trim();
	 if(!emailValidation(orgdeptDetails.deptEmail)){
	   	   	$("#orgdeptEmailError").html("Invalid EmailId (Ex:abc@gmail.com)");
	   	   	return ;
	   	  }
	if($("#orgdeptPhonenum").val().trim() == ""){
		$("#orgdeptPhonenum").focus();
		$("#orgdeptPhnError").html("Enter mobile number");
		return;
	}
	var phoneNumber = $("#orgdeptPhonenum").val().trim();
	if(phoneNumber.length != 10){
		$("#orgdeptPhnError").html("Invalid  Mobile Number");
		return ;
		}
	  var maxRecords = 10;
	  if($("#maxRecords").length>0)
		  maxRecords = $("#maxRecords").val();
	  
	  var searchName ="";
	  if($("#searchAsset").length>0)
	  searchName = $("#searchAsset").val();	 

	
	 orgdeptDetails.deptId = $("#orgdeptId").val().trim();
	orgdeptDetails.deptName = $("#orgdeptName").val().trim();
	orgdeptDetails.deptDescription = $("#orgdeptDescription").val().trim();
	orgdeptDetails.parentDept = $("#orgdeptParent").val().trim();
	orgdeptDetails.deptEmail=$("#orgdeptEmail").val().trim();
	orgdeptDetails.deptPhnNo = $("#orgdeptPhonenum").val().trim();
	orgdeptDetails.maxRecords = maxRecords;
	orgdeptDetails.searchCriteria = searchName; 	
		var formData = JSON.stringify(orgdeptDetails);
		console.log(formData);
		var contextPath = $("#contextPath").val();
	   if(operation=="new"){
		   URL = contextPath + "/inventorymanager/createOrganizationalDept.do";
	   }
	   else if(operation=="edit"){
		   
		   URL = contextPath + "/inventorymanager/updateOrganizationDepartment.do";
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
						alert("Internal error, please contact Technolabs support.");
						$("#loading").css("display","none");
						$("#mainDiv").removeClass('disabled');
					}
			});
}


/**
 * @author Vasudeva Reddy.G
 * @param deptId
 * @param operation
 * @Created_on:06-Aug-2019
 * @Reviewed_by Surya on 20-Aug-2019
 */
function viewEditOrganizationDepartment(deptId,operation){
	var contextPath = $("#contextPath").val();
	 var maxRecords = 10;
	  if($("#maxRecords").length>0)
		  maxRecords = $("#maxRecords").val();
	  var searchName = "";
	  if($("#searchDepartment").length>0)
		  searchName = $("#searchDepartment").val();

    URL = contextPath + "/inventorymanager/editOrganizationDepartment.do";
		$.ajax({
			type: "GET",
			url : URL,
			data : {
				deptId : deptId,
				operation : operation,
				maxRecords :maxRecords,
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
				 alert("Internal error, please contact Technolabs support.");
				$("#loading").css("display","none");
				$("#mainDiv").removeClass('disabled');
			}
		});
	}
/**
 * @author Vasudeva Reddy.G
 * @param name
 * @param searchCategory
 * @param index
 * @Created_on:06-Aug-2019
 * @Reviewed_by Surya on 20-Aug-2019
 */
function searchOrganizationDepartmentMaster(name, searchCategory,index){
	 debugger;
	 var contextPath = $("#contextPath").val();
	 
	 var maxRecords = 10;
	  if($("#maxRecords").length>0)
		  maxRecords = $("#maxRecords").val();
	  
	  var searchName = "";
	  if($("#searchOrganizationDepartment").length>0)
		  searchName = $("#searchOrganizationDepartment").val();

	 URL = contextPath + "/inventorymanager/viewOrganizationDepartmentMaster.do";
	 $.ajax({
			type: "GET",
			url : URL,
			data : {
				searchName : name,
				maxRecords : maxRecords, 
				index : index,
				
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
				 alert("Internal error, please contact Technolabs support.");
				 $("#loading").css("display","none");
	 			 $("#mainDiv").removeClass('disabled');
			}
		});
}

$('#searchOrganizationDepartment').on('input',function(e){
		if($(this).val().trim()==""){
			viewOrganizationDepartmentMaster('organizationdepartmentMaster','0');
		}
	});



