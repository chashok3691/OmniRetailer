
 $("#emailId").blur(function(){
   	  var email = $("#emailId").val();
   	  if(email==""){
   		 return false;
   	  }
 	  if(!emailValidation(email)){
 	   	$("#emailError").html("Invalid EmailId (Ex:abc@gmail.com)");
 	   	return false;
 	  }
 	  else{
 		$("#emailError").html("");
	    return true;
 	  }
 	}); 
 
 $("#emailId").keydown(function(){
	   $("#emailError").html("");
	   $("#Error").html("");
});

	
 /*
 $("#employeeCode").blur(function(){
	 debugger;
	 var empCode =  $("#employeeCode").val();
	
if(empCode.length < 4)
	{
	
		$("#employeeCodeError").html("Id should be atleast 4 charecters");
		$("#employeeCode").focus();
	}
else
	$("#employeeCodeError").html("");


});*/

 
 $(".searchItems").bind('input', function () {
	 debugger;
		$(".Error").html("");
		 var searchName = $(this).val();
	
		 
		 if(searchName!=""&&searchName.length>=2){
			 $(this).siblings("div").show();
			 var searchCategory = $(this).siblings("div").children("div").children("ul").attr("class").replace('matchedStringUl ','');
			
			 if(searchCategory == "searchDepartmentNames")
					
					searchDepartmentNames(searchName, searchCategory);
		 } 
		});

$(".searchItems").keydown(function(e) {
		if (e.keyCode == 27) {
 	
		$(this).siblings("div .services").hide();
		$(this).siblings("div").children("div").children(".matchedStringUl").html(""); // need check
		}
	    if (e.keyCode == 13) { // enter
	        if ($(this).siblings("div").is(":visible")) {
	        	$(this).val($(this).siblings("div").children("div").children("ul").children(".selected").children("a").text());
	        	if($(this).val().trim() != ""){
	        		var id = $(this).siblings("div").children("div").children("ul").children(".selected").children("a").parent().attr("id");
	        		var typeSearch = $(this).siblings("div").children("div").children("ul").attr("class").replace('matchedStringUl ','');
	        
	        	 if(typeSearch == "searchDepartmentNames")
	        			selectDepartment(id);
	        		 $(this).siblings("div .services").hide();
	        		$(this).siblings("div").children("div").children("."+typeSearch).html("");
	        	}
	        } else 
	        	$(this).siblings("div").show();
	    }
	    if (e.keyCode == 38) { // up
	        var selected = $(this).siblings("div").children("div").children("ul").children(".selected");
	        if ($(this).siblings("div").children("div").children("ul").children("li").length != 1 ) 
	        	$(this).siblings("div").children("div").children("ul").children("li").removeClass("selected");
	        if (selected.prev().length == 0) 
	            selected.siblings().last().addClass("selected");
	        else 
	            selected.prev().addClass("selected");
	    }
	    if (e.keyCode == 40) { // down
	        var selected = $(this).siblings("div").children("div").children("ul").children(".selected");
	        if ($(this).siblings("div").children("div").children("ul").children("li").length != 1 ) 
	        	$(this).siblings("div").children("div").children("ul").children("li").removeClass("selected");
	        if (selected.next().length == 0) 
	            selected.siblings().first().addClass("selected");
	        else 
	            selected.next().addClass("selected");
	    }
	});
 

 
 function getCode(element,type){
	 debugger;
		var id= $(element).attr("id");
		if(type == "employee"){
			$("#employeeId").val(id);
			var label = $(element).children("a").text();
			$("#searchEmployee").val(label);
		}
		if(type == "searchDepartmentNames"){
			$("#department").val(id);
			$("#searchDepartmentNames").val(id);
		}
		if(type == "searchOrganizationDepartmentNames"){
			$("#department").val(id);
			$("#searchDepartmentNames").val(id);
		}
		if(type == "searchDepartmentNames"){
			$("#department").val(id);
			$("#searchDepartmentNames").val(id);
		}
		if(type == "primaryDepartment"){
			$("#primaryDepartment").val(id);
			$("#primaryDepartmentQuick").val(id);
			
		}
		
		if(type == "secondaryDepartment"){
			$("#secondaryDepartment").val(id);
			$("#secondaryDepartmentQuick").val(id);
		}
		
		if(type == "supplier"){
			var label = $(element).children("a").text();
			
			$("#searchSupplier").val(label);
			$("#searchSupplierW").val(label);
			$("#supplier_Id").val(id);
			
		}
		 $(".services").hide();
		 $("."+type).html("");
	}
function searchDepartmentNames(name, searchCategory){
	 //purpose:for checking internet conection
	var online = window.navigator.onLine;
  	if(!online)
  	{
  	alert("check your internet connection,please try agian after some time");
  	return;
  	}
	 var contextPath = $("#contextPath").val();
	 URL = contextPath + "/admin/searchDepartmentNames.do";
	 $.ajax({
			type: "GET",
			url : URL,
			data : {
				deptName : name,
			},
			beforeSend: function(xhr){                    
   	   			$("#loading").css("display","block");
   	   			$("#mainDiv").addClass("disabled");
   	   		  },
			success : function(result) {
				appendDepartment(result, searchCategory);
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
function appendDepartment(deptList, searchCategory){
	 $("."+searchCategory).html('');
	 var op = '';
	 for(var i=0;i<deptList.length;i++){
		 if (i == 0) {
			 op += '<li id="'+deptList[i]+'"  class="selected" onclick=getCode(this,"'+searchCategory+'"); ><a>'+deptList[i]+'</a></li>';
		}else
			 op += '<li id="'+deptList[i]+'" onclick=getCode(this,"'+searchCategory+'"); ><a>'+deptList[i]+'</a></li>';
	 }
	 $("."+searchCategory).html(op);
	 $("."+searchCategory).show();
}
	
$("#searchDepartmentNames").keydown(function(e){
	$("#departmentError").html("");
	if($("#searchDepartmentNames").val().length<3){
		$("#department").val("");
	}
	$(".searchDepartmentNames").children("li").each(function(){
		var deptName = $(this).attr("id");
		if($("#searchDepartmentNames").val().trim().toLowerCase() == deptName.toLowerCase()){
			$("#searchDepartmentNames").val($("#searchDepartmentNames").val().trim());
			$("#department").val(deptName);
			 $(".services").hide();
			 $(".matchedStringUl").html("");
			return;
		}
		else{
			$("#department").val(deptName);
		}
	});
	if(e.keyCode == 9){
		if($("#searchDepartmentNames").val()!="" && $("#department").val() == ""){
			 $("#departmentError").html("Department doesn't exist");
		 }
		 $(".services").hide();
		 $(".matchedStringUl").html("");
	}
});

function selectDepartment(id){
	$("#department").val(id);
	$("#searchDepartmentNames").val(id);
}

function searchEmployee(name, searchCategory){
	 //purpose:for checking internet conection
	var online = window.navigator.onLine;
  	if(!online)
  	{
  	alert("check your internet connection,please try agian after some time");
  	return;
  	}
		var location = null;
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


function searchSubDepartmentNames(name, searchCategory){
	 //purpose:for checking internet conection
	var online = window.navigator.onLine;
  	if(!online)
  	{
  	alert("check your internet connection,please try agian after some time");
  	return;
  	}
	 var contextPath = $("#contextPath").val();
	 URL = contextPath + "/admin/searchSubDepartmentNames.do";
	 $.ajax({
			type: "GET",
			url : URL,
			data : {
				deptName : name,
			},
			beforeSend: function(xhr){                    
 	   			$("#loading").css("display","block");
 	   			$("#mainDiv").addClass("disabled");
 	   		  },
			success : function(result) {
				appendDepartment(result, searchCategory);
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
				 op += '<li id="'+empList[i].employeeCode+'"  class="selected" onclick=getCode(this,"'+searchCategory+'"); ><a>'+empList[i].firstName+' '+empList[i].lastName+' - '+empList[i].employeeCode+'</a>';
				/* '<input type="hidden" id="'+empList[i].employeeCode+'FN" value="'+empList[i].firstName+'" />'+
				 '<input type="hidden" id="'+empList[i].employeeCode+'LN" value="'+empList[i].lastName+'" />'+
				 '<input type="hidden" id="'+empList[i].employeeCode+'Email" value="'+empList[i].email+'" /></li>';*/
			}else
				 op += '<li id="'+empList[i].employeeCode+'" onclick=getCode(this,"'+searchCategory+'"); ><a>'+empList[i].firstName+' '+empList[i].lastName+' - '+empList[i].employeeCode+'</a>';
				/* '<input type="hidden" id="'+empList[i].employeeCode+'FN" value="'+empList[i].firstName+'" />'+
				 '<input type="hidden" id="'+empList[i].employeeCode+'LN" value="'+empList[i].lastName+'" />'+
				 '<input type="hidden" id="'+empList[i].employeeCode+'Email" value="'+empList[i].email+'" /></li>';*/
		 }
		 $("."+searchCategory).html(op);
		 $("."+searchCategory).show();
	}
		
	$("#searchEmployee").keydown(function(e){
		$("#repoManagerError").html("");
		if($("#searchEmployee").val().length<3){
			/*$("#firstName").val("");
			$("#lastName").val("");
			$("#email").val("");*/
			$("#employeeId").val("");
		}
		$(".employee").children("li").each(function(){
			var empName = $(this).children("a").text().trim();
			if($("#searchEmployee").val().trim().toLowerCase() == empName.toLowerCase()){
				$("#searchEmployee").val($("#searchEmployee").val().trim());
				var id = $(this).attr("id");
//				$("#firstName").val($("#"+id+"FN").val());
//				$("#lastName").val($("#"+id+"LN").val());
//				$("#email").val($("#"+id+"Email").val());
				$("#employeeId").val(id);
				 $(".services").hide();
				 $(".matchedStringUl").html("");
				return;
			}
			else{
				/*$("#firstName").val("");
 				$("#lastName").val("");
 				$("#email").val("");*/
 				$("#employeeId").val("");
			}
		});
		if(e.keyCode == 9){
			if($("#searchEmployee").val()!="" && $("#employeeId").val() == ""){
				 $("#repoManagerError").html("Employee doesn't exist");
			 }
			 $(".services").hide();
			 $(".matchedStringUl").html("");
		}
	});
	
	function selectEmployee(id){
		/*$("#firstName").val($("#"+id+"FN").val());
		$("#lastName").val($("#"+id+"LN").val());
		$("#email").val($("#"+id+"Email").val());*/
		$("#employeeId").val(id);
	}	
	
	
	$('#searchEmployeeMaster').on('input',function(e){
		if($(this).val().trim()==""){
			viewEmployeeMaster('employeeMaster','0','');
		}
	});

	function searchEmployeeMaster(name,searchCategory,index){
		debugger
		 //purpose:for checking internet conection
		var online = window.navigator.onLine;
	  	if(!online)
	  	{
	  	alert("check your internet connection,please try agian after some time");
	  	return;
	  	}
		var location = $("#employeelocation").val();
		//written by manasa
		 var billedLocationsList = [];
		 var length = $('#employeelocation').children('option').length;
		 console.log(length)
	      	$('#employeelocation option').each(function() { 
	      		billedLocationsList.push( $(this).attr('value'));
	      	   
	      	});
		
		 console.log(billedLocationsList)
		// finalobj.billedLocations = billedLocationsList;
		
		//written by manasa
			 var  locationList="";
		      	for(i=1;i<billedLocationsList.length;i++)
		      		{
		      		locationList =locationList+ billedLocationsList[i]+',';
		      		}
		      //	locationList = locationList.slice(0,-1);//remove last comma
		    
		      	console.log(locationList)
		
		 var contextPath = $("#contextPath").val();
		 URL = contextPath + "/genericMaster/searchEmployeeMaster.do";
		 $.ajax({
				type: "GET",
				url : URL,
				data : {
					searchName : name,
					index : index,
					location : location,
					locationList : locationList
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
	
/*	
	function validateEmployeeForm(operation){
		debugger
		 //purpose:for checking internet conection
		var online = window.navigator.onLine;
	  	if(!online)
	  	{
	  	alert("check your internet connection,please try agian after some time");
	  	return;
	  	}
	  	debugger;
		 var employeeCode = $("#employeeCode").val().trim();
		 var firstName = $("#firstName").val().trim();
		 var lastName = $("#lastName").val().trim();
		 var dob = $("#dob").val().trim();
		 var doj = $("#doj").val().trim();
		 var designation = $("#designation").val().trim();
   	 
 	
		var maxRecords="10";
		if($("#maxRecords").length > 0)
			maxRecords = $("#maxRecords").val();
		var searchName;
		if($("#searchEmployee").length > 0)
			searchName = $("#searchEmployee").val();
   	 
   	 var yearsOfExperience="";
   	 if($("#yearsOfExperience").val()!="")
   	 yearsOfExperience=$("#yearsOfExperience").val();
   	 else
   		yearsOfExperience=0.0; 
   		 
		var	location=""
	   		 if($("#employeelocation").length>0)
	   			location = $("#employeelocation").val();
   	 
   	var defaultCountry = $("#defaultCountry1").val().trim();
  	 var phoneNumber = $("#phoneNumber1").val().trim();
  	if(defaultCountry != "" && phoneNumber != ""){
  		var phonuNum= $("#phoneNum").val(defaultCountry+"-"+phoneNumber);
  	}
   	 
	 if(employeeCode.trim() == ""){
     	$("#employeeCodeError").html("Employee ID  is required");
     	$("#employeeCode").focus();
	  		return false;
	  	 }
  	
   	 if(firstName.trim() == ""){
        	$("#firstNameError").html("First Name is required");
        	$("#firstName").focus();
 	  		return false;
 	  	 }
   	 if(lastName.trim() == ""){
         	$("#lastNameError").html("Last Name is required");
         	$("#lastName").focus();
  	  		return false;
  	  	 }
   	 	if(dob == ""){
         	$("#dobError").html("Date of Birth is required");
         	$("#dob").focus();
  	  		return false;
  	  	 }
        if(doj == ""){
        	$("#dojError").html("Date of Joining is required");
        	$("#doj").focus();
 	  		return false;
 	  	 }
        var noOfDays = daydiff(parseDate(dob), parseDate(doj));
        if(noOfDays < 0){
			 $("#Error").html("Date Of Joining can't be less than Date Of Birth");
			 return;
		 }
     	  if(designation.trim() == ""){
     		$("#designationError").html("Designation is required");
     		$("#designation").focus();
     		  return false;
     	  }
     	if($("#location").val() == "" || $("#location").val() == null){
     		$("#locationError").html("Location is required");
     		  return false;
     	  }
     	if($("#searchDepartmentNames").val().trim() != "" && $("#department").val().trim() == ""){
     		$("#departmentError").html("Department doesn't exist");
     		  return false;
     	  }
     	if($("#department").val().trim() == ""){
     		$("#departmentError").html("Department is required");
     		  return false;
     	  }
   	 
   	  if($("#highestQualification").val().trim() == ""){
       		$("#highestQualificationError").html("Qualification is required");
       		$("#highestQualification").focus();
       		  return false;
       	  }
     	 
     	 if($("#yearsOfExp").val().trim() == ""){
        		 $("#yearsOfExpError").html("Experience is required");
        		 $("#yearsOfExp").focus();
        		  return false;
        	  }
    	 if($("#emailError").text()!=""){
   		 return;
   	 }
   	 var email = $("#emailId").val().trim();
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
	}*/
	
	
	function validateEmployeeForm(operation){
		debugger
		 //purpose:for checking internet conection
		var online = window.navigator.onLine;
	  	if(!online)
	  	{
	  	alert("check your internet connection,please try agian after some time");
	  	return;
	  	}
	  	debugger;
		 var employeeCode = $("#employeeCode").val().trim();
		 var firstName = $("#firstName").val().trim();
		 var lastName = $("#lastName").val().trim();
		 var dob = $("#dob").val().trim();
		 var doj = $("#doj").val().trim();
		 var designation = $("#designation").val().trim();
   	 
 	
		var maxRecords="10";
		if($("#maxRecords").length > 0)
			maxRecords = $("#maxRecords").val();
		var searchName;
		if($("#searchEmployee").length > 0)
			searchName = $("#searchEmployee").val();
   	 
   /*	 var yearsOfExperience="";
   	 if($("#yearsOfExperience").val()!="")
   	 yearsOfExperience=$("#yearsOfExperience").val();
   	 else
   		yearsOfExperience=0.0; */
   		 
		var	location=""
	   		 if($("#employeelocation").length>0)
	   			location = $("#employeelocation").val();
   	 
   	var defaultCountry = $("#defaultCountry1").val().trim();
  	 var phoneNumber = $("#phoneNumber1").val().trim();
  	if(defaultCountry != "" && phoneNumber != ""){
  		var phonuNum= $("#phoneNum").val(defaultCountry+"-"+phoneNumber);
  	}
   	 
	 if(employeeCode.trim() == ""){
     	$("#employeeCodeError").html("Employee ID  is required");
     	$("#employeeCode").focus();
	  		return false;
	  	 }else if(parseInt($("#employeeCode").val().length)>10){
	  		$("#employeeCode").focus(); 
	  		$("#employeeCodeError").html("Employee ID can't exceeds 10 Characters");
	  		return false;
	  	 }
	 
   	 if(firstName.trim() == ""){
        	$("#firstNameError").html("First Name is required");
        	$("#firstName").focus();
 	  		return false;
 	  	 }else if(parseInt($("#firstName").val().length)>15){
	  		$("#firstName").focus(); 
	  		$("#firstNameError").html("First Name can't exceeds 15 Characters");
	  		return false;
	  	 }
	 
 	if(parseInt($("#middleName").val().length)>15){
  		$("#middleName").focus(); 
  		$("#middleNameError").html("Middle Name can't exceeds 15 Characters");
  		return false;
  	 }
   	else{
   		$("#middleNameError").html("");
   	}
   	 
 	if(parseInt($("#designation").val().length)>100){
  		$("#designation").focus(); 
  		$("#designationError").html("Designation can't exceeds 100 Characters");
  		return false;
  	 }
   	else{
   		$("#designationError").html("");
   	}
 	
   	 if(lastName.trim() == ""){
         	$("#lastNameError").html("Last Name is required");
         	$("#lastName").focus();
  	  		return false;
  	  	 }else if(parseInt($("#lastName").val().length)>15){
	  		$("#lastName").focus(); 
	  		$("#lastNameError").html("Last Name can't exceeds 15 Characters");
	  		return false;
	  	 }else{
	  		$("#lastNameError").html("");
	  	 }
   	 
 	if(parseInt($("#highestQualification").val().length)>15){
  		$("#highestQualification").focus(); 
  		$("#highestQualificationError").html("Qualification can't exceeds 15 Characters");
  		return false;
  	 }else{
	  		$("#highestQualificationError").html("");
  	 }
   	 
   	 	/*if(dob == ""){
         	$("#dobError").html("Date of Birth is required");
         	$("#dob").focus();
  	  		return false;
  	  	 }*/
        if(doj == ""){
        	$("#dojError").html("Date of Joining is required");
        	$("#doj").focus();
 	  		return false;
 	  	 }
        var noOfDays = daydiff(parseDate(dob), parseDate(doj));
        if(noOfDays < 0){
			 $("#Error").html("Date Of Joining can't be less than Date Of Birth");
			 return;
		 }
     	/*  if(designation.trim() == ""){
     		$("#designationError").html("Designation is required");
     		$("#designation").focus();
     		  return false;
     	  }*/
     	if($("#location").val() == "" || $("#location").val() == null){
     		$("#locationError").html("Location is required");
     		  return false;
     	  }
     	/*if($("#searchDepartmentNames").val().trim() != "" && $("#department").val().trim() == ""){
     		$("#departmentError").html("Department doesn't exist");
     		  return false;
     	  }
     	if($("#department").val().trim() == ""){
     		$("#departmentError").html("Department is required");
     		  return false;
     	  }*/
     	
     	
   	 
   	/*  if($("#highestQualification").val().trim() == ""){
       		$("#highestQualificationError").html("Qualification is required");
       		$("#highestQualification").focus();
       		  return false;
       	  }
     	 */
     	 /*if($("#yearsOfExp").val().trim() == ""){
        		 $("#yearsOfExpError").html("Experience is required");
        		 $("#yearsOfExp").focus();
        		  return false;
        	  }*/
    	 if($("#emailError").text()!=""){
   		 return;
   	 }
   	 var email = $("#emailId").val().trim();
     	  if(email==""){
     		$("#emailError").html("Email Id is required");
     		 return false;
     	  }
   	  if(!emailValidation(email)){
   	   	$("#emailError").html("Invalid EmailId (Ex:abc@gmail.com)");
   	   	return false;
   	  }

     var phonenum = $("#phoneNumber1").val().trim();
     	  if(phonenum==""){
     		$("#phoneError").html("Phone number required");
     		 return false;
     	  }else{
	$("#phoneError").html("");
}
   	 
     	 if(parseInt($("#doorNum").val().length)>60){
       		$("#doorNum").focus(); 
       		$("#doorNumError").html("Door No can't exceeds 60 Characters");
       		return false;
       	 }else{
     	  		$("#doorNumError").html("");
       	 }
     	
     	 if(parseInt($("#streetName").val().length)>100){
        		$("#streetName").focus(); 
        		$("#doorNumError").html("Street Name can't exceeds 100 Characters");
        		return false;
        	 }else{
      	  		$("#doorNumError").html("");
        	 }
     	 
     	 if(parseInt($("#jobLocation").val().length)>100){
     		$("#jobLocation").focus(); 
     		$("#jobLocationError").html("Area Name can't exceeds 100 Characters");
     		return false;
     	 }else{
   	  		$("#jobLocationError").html("");
     	 }
     	
     	 if(parseInt($("#city").val().length)>30){
     		$("#city").focus(); 
     		$("#cityError").html("City Name can't exceeds 30 Characters");
     		return false;
     	 }else{
   	  		$("#cityError").html("");
     	 }
     	 
     	if(parseInt($("#zipCode").val().length)>10){
     		$("#zipCode").focus(); 
     		$("#zipCodeError").html("Zip Code can't exceeds 10 digits");
     		return false;
     	 }else{
   	  		$("#zipCodeError").html("");
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
	
	

	function validatePhoneNumber1(){
			debugger;
			 phoneNumberParser1();
			 var output = $("#output1").val();
			 if(output.indexOf(":")<0){
				 $("#error1").html(output);
				 return false;
			 }
			 var result = output.split(",");
			 for(var i=0;i<result.length; i++){
				 var val=result[i].split(":");
				 if(val[1] != "true"){
					 $("#error1").html("Invalid Phone Number");
					 return false;
				 }
			 }
		}	
	
	
	
		
		function viewEditEmployee(empCode,operation){
	    	 var contextPath = $("#contextPath").val();
	    	 //added location  by manasa  
	    	 var location = $("#location").val();
	    	 //purpose:for checking internet conection
	    		var online = window.navigator.onLine;
	    	  	if(!online)
	    	  	{
	    	  	alert("check your internet connection,please try agian after some time");
	    	  	return;
	    	  	}
	    		
	 		var maxRecords="10";
	 		if($("#maxRecords").length > 0)
	 			maxRecords = $("#maxRecords").val();
	 		
	 		var	location=""
		   		 if($("#employeelocation").length>0)
		   			location = $("#employeelocation").val();
	 		
	 		var searchName="";
	 		if($("#searchEmployeeMaster").length > 0)
	 			searchName = $("#searchEmployeeMaster").val().trim();
	 		
	    	
	    	 URL = contextPath + "/genericMaster/editEmployeeView.do";
	  		$.ajax({
	  			type: "GET",
	  			url : URL,
	  			data : {
	  				empCode : empCode,
	  				operation : operation,
	  				location : location,
	  				maxRecords : maxRecords,
	  				searchName : searchName
	  			},
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
	
		
		function searchOrganizationDepartmentNames(name, searchCategory){
			 //purpose:for checking internet conection
			var online = window.navigator.onLine;
		  	if(!online)
		  	{
		  	alert("check your internet connection,please try agian after some time");
		  	return;
		  	}
			 var contextPath = $("#contextPath").val();
			 URL = contextPath + "/admin/searchOrganizationDepartmentNames.do";
			 $.ajax({
					type: "GET",
					url : URL,
					data : {
						deptName : name,
					},
					beforeSend: function(xhr){                    
		   	   			$("#loading").css("display","block");
		   	   			$("#mainDiv").addClass("disabled");
		   	   		  },
					success : function(result) {
						appendDepartment(result, searchCategory);
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
		
		
	
		
		function loadHRMS(){
			
			// purpose:for checking internet conection
			try{
			var online = window.navigator.onLine;
		  	if(!online){
		  	alert("Check your internet connection,Please try agian after some time.");
		  	return;
		  	}
				// debugger;
			var	location=""
			   		 if($("#employeelocation").length>0)
			   			location = $("#employeelocation").val();
			var index= "0";
			var maxRecords="10";
				if($("#maxRecords").length > 0)
					maxRecords = $("#maxRecords").val();
				
				
				var contextPath = $("#contextPath").val();
				URL = contextPath + "/genericMaster/LoadHRMS.do";
		 		$.ajax({
		 			type: "GET",
		 			url : URL,
		 			data : {
		 				index : index,
		 				location : location,
		 				maxRecords : maxRecords,
		 				
		 			},
		 			beforeSend: function(xhr){                    
		 				 $("#suppliersImgspan").css("visibility","visible");
		   	   		  },
		 			success : function(result) {
		 				$("#right-side").html(result);
		 				openMenu("liGenericData","ulGenericData",0);
			    		openMenu("liMasterDataManagement","ulMasterDataManagement",1);
			    		$("#skuMasterImg").attr("src",contextPath+"/images/tickMark.png");
			    		$("#skuMasterImg").closest('span').css("visibility","visible");
		 			},
		 			error : function(jqXHR, textStatus, errorThrown)  {
		 				 errorCode(jqXHR.status);
		 				$("#skuMasterImg").attr("src",contextPath+"/images/error.jpg");
			    		$("#skuMasterImg").closest('span').css("visibility","visible");
		 				
		 			}
		 		});
			}
			catch(e)
			{
			errorCode(e);
			}

			}
	
		
		 
	