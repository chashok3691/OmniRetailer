	function viewNewB2BPartner(id){
		try{
		 var contextPath = $("#contextPath").val();
		 
		// purpose:for checking internet conection
			var online = window.navigator.onLine;
		  	if(!online){
		  	alert("Check your internet connection,Please try agian after some time.");
		  	return;
		  	}
			var maxRecords="10";
			if($("#maxRecords").length > 0)
				maxRecords = $("#maxRecords").val();
			
			var searchName="";
			if($("#searchB2BPartners").length > 0)
				searchName = $("#searchB2BPartners").val();
			
			URL = contextPath + "/genericMaster/newB2BPartner.do";
 		$.ajax({
 			type: "GET",
 			url : URL,
 			data : {
 				
 			},
 			beforeSend: function(xhr){                    
  	   			$("#loading").css("display","block");
  	   			$("#mainDiv").addClass("disabled");
  	   		  },
 			success : function(result) {
 				if(id != undefined)
 					activeMenu(id);
 				$("#right-side").html(result);
 				$("#loading").css("display","none");
 				$("#mainDiv").removeClass('disabled');
 			},
 			error : function(jqXHR, textStatus, errorThrown)  {
 				 errorCode(jqXHR.status);
 				$("#loading").css("display","none");
				$("#mainDiv").removeClass('disabled');
 			}
 		});
		}catch(e)
		{
			errorCode(e);
			}
	}






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

function selectDepartment(id){
	$("#department").val(id);
	$("#searchDepartmentNames").val(id);
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
	function validateB2BForm(operation){
		debugger;
		 //purpose:for checking internet conection
		var online = window.navigator.onLine;
	  	if(!online)
	  	{
	  	alert("check your internet connection,please try agian after some time");
	  	return;
	  	}
	  	debugger;
		 var partnerId = $("#partnerId").val().trim();
		 var firmName = $("#firmName").val().trim();
		 var plotNo = $("#plotNumber").val().trim();
	     var street = $("#street").val().trim();
	     var city =  $("#city").val().trim();
	     var Adress = $("#location").val().trim();
		 var phone = $("#b2bPhoneNumber").val().trim();
		 var email = $("#emailId").val().trim();
 	
		var maxRecords="10";
		if($("#maxRecords").length > 0)
			maxRecords = $("#maxRecords").val();
   
		
	 if(partnerId.trim() == "" || partnerId.trim() == null || partnerId.trim() == undefined){
     	$("#partnerIDError").html("Partner ID  is required");
     	$("#partnerId").focus();
	  		return false;
	  	 }else{
	  		$("#partnerIDError").html("");
	  	 }
	 
   	 if(firmName.trim() == "" || firmName.trim() == null || firmName.trim() == undefined){
        	$("#firmNameError").html("Firm Name is required");
        	$("#firmName").focus();
 	  		return false;
 	  	 }else{
	  		$("#firmNameError").html("");
	  	 }
       
    	 if(plotNo=="" || plotNo==undefined || plotNo==null){ 
    		 $("#plotNoError").html("Plot number required");
    		 $("#plotNo").focus();
    		 return false;
    	  }else{
    		  $("#plotNoError").html("");
    	  }
    	 
    	 if(street=="" || street==undefined || street==null){ 
    		 $("#streetError").html("street required");
    		 $("#street").focus();
    		 return false;
    	  }else{
    		  $("#streetError").html("");
    	  }
    	 
    	 if(Adress=="" || Adress==undefined || Adress==null){ 
    		 $("#locationError").html("location required");
    		 $("#location").focus();
    		 return false;
    	  }else{
    		  $("#locationError").html("");
    	  }
    	 if(city=="" || city==undefined || city==null){ 
    		 $("#cityError").html("city required");
    		 $("#city").focus();
    		 return false;
    	  }else{
    		  $("#cityError").html("");
    	  }
    	 
    	 
    	
    	  if(phone=="" || phone==undefined || phone==null){
    		$("#phoneError").html("Phone number required");
    		 return false;
    	  } else{
    		  $("#phoneError").html("");
    	  }
    	 
    	 
   	 var email = $("#emailId").val().trim();
     	  if(email==""|| email==null || email==undefined){
     		$("#emailError").html("Email Id is required");
     		 return false;
     	  }else{
  	  		$("#emailError").html("");
 	  	 }
     	  
   	  if(!emailValidation(email)){
   	   	$("#emailError").html("Invalid EmailId (Ex:abc@gmail.com)");
   	   	return false;
   	  }

     
     	  
     	var finalObj = {};
     	finalObj.partnerId = $("#partnerId").val().trim();
     	finalObj.firmName = $("#firmName").val().trim();
     	finalObj.bankName = $("#bankName").val().trim();
     	finalObj.phone = $("#b2bPhoneNumber").val().trim();
     	finalObj.email = $("#emailId").val().trim();
     	finalObj.bankAccount = $("#accountNo").val().trim();
     	finalObj.buisinessType = $("#businessType").val().trim();
     	finalObj.panNumber = $("#panNumber").val().trim();
    	finalObj.plotNo = $("#plotNumber").val().trim();
     	finalObj.street = $("#street").val().trim();
     	finalObj.city = $("#city").val().trim();
     	finalObj.Adress = $("#location").val().trim();
     
		
   	  var contextPath = $("#contextPath").val();
   	 
   	  if(operation == "new")
   		  URL = contextPath + "/genericMaster/createB2BPartner.do";
   	  else
   		  URL = contextPath + "/genericMaster/updateB2BPartner.do";
   	  
   	  var formData  = JSON.stringify(finalObj);
   	  
   	  
  		 $.ajax({
  			type: "POST",
  			url : URL,
  			contentType: "application/json",
  			data : formData,
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
	}*/
	

	function validateB2BPartnerForm(operation){
		debugger;
		$('#Success').html("");
		$("#Error").html("");
			 try{
				// purpose:for checking internet conection
				var online = window.navigator.onLine;
			  	if(!online){
			  	alert("Check your internet connection,Please try agian after some time.");
			  	return;
			  	}
				 
			  	debugger;
				 var partnerId = $("#partnerId").val();
				 var firmName = $("#firmName").val();
				 var plotNo = $("#plotNumber").val();
			     var street = $("#street").val();
			     var city =  $("#city").val();
			     var Adrress = $("#location").val();
			     var accoutNo = $("#bankAccountNo").val();
				 var phoneNumber = $("#b2bPhoneNumber").val();
				 var personName = $("#personName").val();
		 	
				var maxRecords="10";
				if($("#maxRecords").length > 0)
					maxRecords = $("#maxRecords").val();
		   
				
			 if(partnerId.trim() == "" || partnerId.trim() == null || partnerId.trim() == undefined){
		     	$("#partnerIDError").html("Partner ID  is required");
		     	$("#partnerId").focus();
			  	return false;
			  	 }else{
			  		$("#partnerIDError").html("");
			  	 }
			 
		   	if(firmName.trim() == "" || firmName.trim() == null || firmName.trim() == undefined){
	        	$("#firmNameError").html("Firm name is required");
	        	$("#firmName").focus();
	 	  		return false;
	 	  	 }else{
		  		$("#firmNameError").html("");
		  	 }
		   	
		   	if(personName.trim() == "" || personName.trim() == null || personName.trim() == undefined){
	        	$("#personNameError").html("Person name is required");
	        	$("#personName").focus();
	 	  		return false;
	 	  	 }else{
		  		$("#personNameError").html("");
		  	 }
		   	
		    	 if(plotNo=="" || plotNo==undefined || plotNo==null){ 
		    		 $("#plotNumberError").html("Plot number required");
		    		 $("#plotNo").focus();
		    		 return false;
		    	  }else{
		    		  $("#plotNumberError").html("");
		    	  }
		    	 
		    	 if(street=="" || street==undefined || street==null){ 
		    		 $("#streetError").html("street required");
		    		 $("#street").focus();
		    		 return false;
		    	  }else{
		    		  $("#streetError").html("");
		    	  }
		    	 
		    	 if(Adrress=="" || Adrress==undefined || Adrress==null){ 
		    		 $("#locationError").html("Location required");
		    		 $("#location").focus();
		    		 return false;
		    	  }else{
		    		  $("#locationError").html("");
		    	  }
		    	 if(city=="" || city==undefined || city==null){ 
		    		 $("#cityError").html("City required");
		    		 $("#city").focus();
		    		 return false;
		    	  }else{
		    		  $("#cityError").html("");
		    	  }
		    	 
		    	/* if($("#state").val()=="" || $("#state").val()==undefined || $("#state").val()==null){ 
		    		 $("#stateError").html("please select state");
		    		 $("#state").focus();
		    		 return false;
		    	  }else{
		    		  $("#stateError").html("");
		    	  }*/
		    	 
		    	  if(phoneNumber=="" || phoneNumber==undefined || phoneNumber==null){
		    		$("#b2bPhoneNumberError").html("Phone number required");
		    		 return false;
		    	  }else if(phoneNumber.length != 10) { 
		    		  $("#b2bPhoneNumberError").html("Phone number must be 10 characters.");
			    		 return false;
		    	  }else {
		    		  $("#b2bPhoneNumberError").html("");
		    	  }
		    	 
		    	  var emailId = $("#emailId").val();
		     	  if(emailId==""|| emailId==null || emailId==undefined){
			     		$("#emailError").html("Email ID is required");
			     		 return false;
		     	  }else if(!emailValidation(emailId)){
				   	   	$("#emailError").html("Invalid EmailId (Ex:abc@gmail.com)");
				   	   	return false;
				  }else {
		  	  			$("#emailError").html("");
		 	  	 }
		     	  
		     	 var txtPANCard = document.getElementById("panNumber");
				 if(txtPANCard.value != ""){
			        var regex = /([A-Z]){5}([0-9]){4}([A-Z]){1}$/;
			        if (regex.test(txtPANCard.value.toUpperCase())) {
			        
			        } else {
			        	 $("#panNumberError").html("Please Check PAN Number.");
			            return false;
			        }
				 }
				
				var URLLink = "/NTMCart/home/registrationbyQR.do?partnerId="+partnerId+"";
				var partnerQRURL = $("#partnerqrCodePdfUrl").val();
				 
		     	var finalObj = {};
		     	finalObj.partnerId = $("#partnerId").val();
		     	finalObj.partnerName = $("#firmName").val();
		     	finalObj.personName = $("#personName").val();
		     	finalObj.bankAccountNumber = $("#bankAccountNo").val();
		     	finalObj.bankName = $("#bankName").val();
		    	finalObj.plotNo = $("#plotNumber").val();
		     	finalObj.street = $("#street").val();
		     	finalObj.address = $("#location").val();
		     	finalObj.city = $("#city").val();
		     	finalObj.state = $("#state").val();
		     	finalObj.businessType = $("#businessType").val();
		     	finalObj.phone = $("#b2bPhoneNumber").val();
		     	finalObj.email = $("#emailId").val();
		     	finalObj.gstNumber = $("#gstNumber").val();
		     	finalObj.pan = $("#panNumber").val();
		     	finalObj.registerUrl = URLLink;
		     	finalObj.operation = operation;
		     	finalObj.ifscCode=$("#ifscCode").val();
		     	if(operation=="edit"){
		     	finalObj.qrCodePdfUrl = partnerQRURL;
		     	finalObj.createdDateStr = $("#createdDateStr").val();
		     	finalObj.updatedDateStr = $("#updatedDateStr").val();
		     	}
		     	
			  	var contextPath = $("#contextPath").val();
			    if(operation=="new"){
			 	  URL = contextPath + "/genericMaster/createB2BPartner.do";
			 	} else if(operation=="edit"){
			 	  URL = contextPath + "/genericMaster/createB2BPartner.do";
			   	}
			    
				var formData = JSON.stringify(finalObj);
					console.log(formData);
					
					$.ajax({
						type: "POST",
						url : URL,
						data :{
							dataform : formData,
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
		        			error : function(jqXHR, textStatus, errorThrown)  {
		        				 errorCode(jqXHR.status);
		        				$("#loading").css("display","none");
	        			   $("#mainDiv").removeClass('disabled');
		        			}
		        		});
		    	 }
			 
			 catch(e)
				{
				errorCode(e);
				}
		    	
		     }
	

		function viewEditB2BPartners(partnerId,operation){
	    	debugger
			var contextPath = $("#contextPath").val();
	    	 //purpose:for checking internet conection
	    		var online = window.navigator.onLine;
	    	  	if(!online)
	    	  	{
	    	  	alert("check your internet connection,please try agian after some time");
	    	  	return;
	    	  	}
	    	
	    	 URL = contextPath + "/genericMaster/viewEditB2BPartner.do";
	  		$.ajax({
	  			type: "GET",
	  			url : URL,
	  			data : {
	  				partnerId : partnerId,
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
	
		
		
function downloadPartnerQRs(){
	debugger
		 var anchor = document.createElement('a');
			anchor.href = $("#partnerURLlink").val();
			anchor.target = '_blank';
			anchor.download = '';
			if($("#partnerURLlink").val()!=null && $("#partnerURLlink").val()!='')
				anchor.click();
		
}	

function downloadPartnerQRsEdit(){
	debugger
		 var anchor = document.createElement('a');
			anchor.href = $("#partnerqrCodePdfUrl").val();
			anchor.target = '_blank';
			anchor.download = '';
			if($("#partnerqrCodePdfUrl").val()!=null && $("#partnerqrCodePdfUrl").val()!='')
				anchor.click();
		
}
		
		 
	