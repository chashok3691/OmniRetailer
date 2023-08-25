function emptyProduct(){
	$("#searchItems").val("");
	$("#product").val("");
}

$(".clearError").on('input',function(e){
	var id = $(this).attr("id");
	if($("#"+id+"Error").length > 0)
		$("#"+id+"Error").html("");
	$(".Error").html("");
});

$(".clearError").on('change',function(e){
	var id = $(this).attr("id");
	if($("#"+id+"Error").length > 0)
		$("#"+id+"Error").html("");
	$(".Error").html("");
});
$(".calendar_icon").on('click',function(e){
	var id = $(this).attr("id");
	if($("#"+id+"Error").length > 0)
		$("#"+id+"Error").html("");
	$(".Error").html("");
});
$(".calendar_icon").on('focus',function(e){
	var id = $(this).attr("id");
	if($("#"+id+"Error").length > 0)
		$("#"+id+"Error").html("");
	$(".Error").html("");
});

$("#emailId").blur(function(){
	 var email = $("#emailId").val();
  	  if(email==""){
  		 return false;
  	  }
	  if(!emailValidation(email)){
	   	$("#Error").html("Invalid EmailId (Ex:abc@gmail.com)");
	   	return false;
	  }
	  else{
		$("#Error").html("");
	    return true;
	  }
});
 $('#firstName').on('input',function(e){
	 if($(".highlightaddress").attr("id") == "address1"){
		 if($(this).data("lastval") == undefined || $(this).data("lastval")== $("#shipmentName").data("firstName") || $("#shipmentName").val().trim() == ""){
			 if($("#lastName").data("lastval") == undefined){
				 $("#shipmentName").val($(this).val());
				 $("#shipmentName").data("firstName",$(this).val());
			 }
			 else if($("#lastName").val()== $("#shipmentName").data("lastName")){
				 $("#shipmentName").val($(this).val()+" "+$("#lastName").val());
				 $("#shipmentName").data("firstName",$(this).val());
			 }
			 else if($("#shipmentName").val().trim() == ""){
				 $("#shipmentName").val($(this).val()+" "+$("#lastName").val());
				 $("#shipmentName").data("firstName",$(this).val());
				 $("#shipmentName").data("lastName",$("#lastName").val());
			 }
			 else
				 return;
		 $(this).data("lastval",$(this).val());
		 }
	 }
}); 
 $('#lastName').on('input',function(e){
	 if($(".highlightaddress").attr("id") == "address1"){
		 if($(this).data("lastval") == undefined || $(this).data("lastval")== $("#shipmentName").data("lastName") || $("#shipmentName").val().trim() == ""){
			 if($("#firstName").data("lastval") == undefined){
				 $("#shipmentName").val($(this).val());
				 $("#shipmentName").data("lastName",$(this).val());
			 }
			 else if($("#firstName").val()== $("#shipmentName").data("firstName")){
				 $("#shipmentName").val($("#firstName").val()+" "+$(this).val());
				 $("#shipmentName").data("lastName",$(this).val());
			 } 
			 else if($("#shipmentName").val().trim() == ""){
				 $("#shipmentName").val($("#firstName").val()+" "+$(this).val());
				 $("#shipmentName").data("firstName",$("#firstName").val());
				 $("#shipmentName").data("lastName",$(this).val());
			 }
			 else
				 return;
		 $(this).data("lastval",$(this).val());
		 }
	 }
}); 

 $('#shipmentName').on('input',function(e){
		 if($(".highlightaddress").attr("id") == "address1"){
			 $(this).data("lastval",$(this).val());
			 $(this).data("lastName",$(this).val());
			 $(this).data("firstName",$(this).val());
		 }
});
 
$('#phoneNumber').on('input',function(e){
	 if($(".highlightaddress").attr("id") == "address1"){
	 if($(this).data("lastval") == undefined || $("#shipmentContact").val() == ""){
		 $("#shipmentContact").val($(this).val());
	 }
	 else if($(this).data("lastval")== $("#shipmentContact").val()){
		 $("#shipmentContact").val($(this).val());
	 }else
		 return;
	 $(this).data("lastval",$(this).val());
	 }
});
$('#phoneNumber1').on('input',function(e){
	 if($(".highlightaddress").attr("id") == "address1"){
	 if($(this).data("lastval") == undefined || $("#landLine").val() == ""){
		 $("#landLine").val($(this).val());
	 }
	 else if($(this).data("lastval")== $("#landLine").val()){
		 $("#landLine").val($(this).val());
	 }else
		 return;
	 $(this).data("lastval",$(this).val());
	 }
});
$('#houseNo').on('input',function(e){
	 if($(".highlightaddress").attr("id") == "address1"){
	 if($(this).data("lastval") == undefined ||  $("#doorNumber").val().trim() == ""){
		 $("#doorNumber").val($(this).val());
	 }
	 else if($(this).data("lastval")== $("#doorNumber").val()){
		 $("#doorNumber").val($(this).val());
	 }else
		 return;
	 $(this).data("lastval",$(this).val());
	 }
});
$('#street').on('input',function(e){
	 if($(".highlightaddress").attr("id") == "address1"){
	 if($(this).data("lastval") == undefined ||  $("#street1").val().trim() == ""){
		 $("#street1").val($(this).val());
	 }
	 else if($(this).data("lastval")== $("#street1").val()){
		 $("#street1").val($(this).val());
	 }else
		 return;
	 $(this).data("lastval",$(this).val());
	 }
});
$('#locality').on('input',function(e){
	 if($(".highlightaddress").attr("id") == "address1"){
	 if($(this).data("lastval") == undefined ||  $("#locality1").val().trim() == ""){
		 $("#locality1").val($(this).val());
	 }
	 else if($(this).data("lastval")== $("#locality1").val()){
		 $("#locality1").val($(this).val());
	 }else
		 return;
	 $(this).data("lastval",$(this).val());
	 }
});
$('#city').on('input',function(e){
	 if($(".highlightaddress").attr("id") == "address1"){
	 if($(this).data("lastval") == undefined || $("#city1").val().trim() == ""){
		 $("#city1").val($(this).val());
	 }
	 else if($(this).data("lastval")== $("#city1").val()){
		 $("#city1").val($(this).val());
	 }else
		 return;
	 $(this).data("lastval",$(this).val());
	 }
});
$('#zipCode').on('input',function(e){
	 if($(".highlightaddress").attr("id") == "address1"){
	 if($(this).data("lastval") == undefined ||  $("#zipCode1").val().trim() == ""){
		 $("#zipCode1").val($(this).val());
	 }
	 else if($(this).data("lastval")== $("#zipCode1").val()){
		 $("#zipCode1").val($(this).val());
	 }else
		 return;
	 $(this).data("lastval",$(this).val());
	 }
});


$("#shipmentContact").on('input',function(e){
	 $("#error2").html("");
	$("#Error").html("");
	$(".Error").html("");
 });
	$("#shipmentContact").blur(function(){
	var phoneNumber = $("#shipmentContact").val().trim();
	if(phoneNumber != ""){
		validatePhoneNumber2() ;
	}
});
$("#defaultCountry2").change(function(){
	$("#error2").html("");
	$("#Error").html("");
	var phoneNumber = $("#shipmentContact").val().trim();
	if(phoneNumber != ""){
		validatePhoneNumber2() ;
	}
});
	
function validatePhoneNumber2(){
	 phoneNumberParser2();
	 var output = $("#output2").val();
	 if(output.indexOf(":")<0){
		 $("#error2").html(output);
		 return false;
	 }
	 var result = output.split(",");
	 for(var i=0;i<result.length; i++){
		 var val=result[i].split(":");
		 if(val[1] != "true"){
			 $("#error2").html("Invalid Phone Number");
			 return false;
		 }
	 }
	 return true;
}	

$("#landLine").on('input',function(e){
	 $("#error3").html("");
	$("#Error").html("");
	$(".Error").html("");
});
	$("#landLine").blur(function(){
	var phoneNumber = $("#landLine").val().trim();
	if(phoneNumber != ""){
		validatePhoneNumber3() ;
	}
});
$("#defaultCountry3").change(function(){
	$("#error3").html("");
	$("#Error").html("");
	var phoneNumber = $("#landLine").val().trim();
	if(phoneNumber != ""){
		validatePhoneNumber3() ;
	}
});
	
function validatePhoneNumber3(){
	 phoneNumberParser3();
	 var output = $("#output3").val();
	 if(output.indexOf(":")<0){
		 $("#error3").html(output);
		 return false;
	 }
	 var result = output.split(",");
	 for(var i=0;i<result.length; i++){
		 var val=result[i].split(":");
		 if(val[1] != "true"){
			 $("#error3").html("Invalid Phone Number");
			 return false;
		 }
	 }
	 return true;
}

function searchCustomers(searchName, searchCategory,index){
	var maxRecords = $("#maxRecords").val();
	if($("#startPrice").val() != "" && $("#endPrice").val() != ""){
		if(parseFloat($("#startPrice").val()) > parseFloat($("#endPrice").val())){
			$("#Error").html("Enter End Price greater than Start Price");
			return;
		}
	}
	
	
	if($("#fromDate").val() != "" && $("#endDate").val() != ""){
		 var noOfDays = daydiff(parseDate($('#fromDate').val()), parseDate($('#endDate').val()));
		 if(noOfDays < 0){
			$("#Error").html("Enter End Date greater than Start Date");
			return;
		 }
	}
	var formData = getFormData('',index,maxRecords,searchName);
	var contextPath = $("#contextPath").val();
	URL = contextPath + "/crm/getCustomers.do";
	 $.ajax({
			type: "POST",
			url : URL,
			contentType : "application/json",
			data : formData,
			beforeSend: function(xhr){                    
   				$("#loading").css("display","block");
   				$("#mainDiv").addClass("disabled");
	        },
			success : function(result) {
        		$('#customerTable').html(result);
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


function getCustomers(index){
	//
	
	 if($("#searchCustomers").length > 0 && $("#searchCustomers").val().trim() != ""){
		 searchCustomers($("#searchCustomers").val(), 'searchCustomers',index);
		 return;
	 }
//	var maxRecords = $("#maxRecords").val();
	
	var maxRecords = 10;
		if($("#maxRecords").length >0 && $("#maxRecords").val() !="")
			maxRecords = $("#maxRecords").val();
	
	
		
		
	if($("#startPrice").val() != "" && $("#endPrice").val() != ""){
		if(parseFloat($("#startPrice").val()) > parseFloat($("#endPrice").val())){
			$("#Error").html("Enter End Price greater than Start Price");
			return;
		}
	}
	
	 if($("#fromDate").length>0 && $("#endDate").length>0){
	if($("#fromDate").val() != "" && $("#endDate").val() != ""){
		 var noOfDays = daydiff(parseDate($('#fromDate').val()), parseDate($('#endDate').val()));
		 if(noOfDays < 0){
//			$("#Error").html("Enter End Date greater than Start Date");
			 alert("Start Date can't be less than End Date");
			return;
		 }
	}
	 }
	if(index == "save")
		$("#saveflag").val("true");
	var formData = getFormData('',index,maxRecords,'');
	var contextPath = $("#contextPath").val();
	
	
	
	URL = contextPath + "/crm/getCustomers.do";
	 $.ajax({
			type: "POST",
			url : URL,
			contentType : "application/json",
			data : formData,
			beforeSend: function(xhr){                    
   				$("#loading").css("display","block");
   				$("#mainDiv").addClass("disabled");
	        },
			success : function(result) {
        		$('#customerTable').html(result);
        		$("#loading").css("display","none");
        		 var anchor = document.createElement('a');
 				  anchor.href = $("#customerurl").val();
 				  anchor.target = '_blank';
 				  anchor.download = '';
 				if($("#customerurl").val()!=null && $("#customerurl").val()!='')
 				  anchor.click();
 				$("#saveflag").val("false");
    			$("#mainDiv").removeClass('disabled');

			},
			error : function() {
				alert("something went wrong");
				$("#loading").css("display","none");
    			$("#mainDiv").removeClass('disabled');

			}
		});
}


function getFormData(message,index,maxRecords,searchName){
	//
	var country = $("#country").val();
	var region = $("#states").val();
	var city = $("#city").val();
	var customerType = $("#customerType").val();
	var age = $("#age").val();
	var gender = $("#gender").val();
	var productCategory = $("#productCategory").val();
	var fromDate = $("#fromDate").val();
	var product = $("#product").val();
	var endDate = $("#endDate").val();
	var priceRange = $("#priceRange").val();
	var purchaseChannel = $("#purchaseChannel").val();
	

	
	var finalObj = {};
	if(country.trim() != "Select Country")
		finalObj.country = country;
	if(region.trim() != "Select State")
		finalObj.state = region;
	if(city.trim() != "")
		finalObj.city = city;
	if(customerType.trim() != "-- Select --")
		finalObj.customerType = customerType;
	if(age.trim() != "-- Select --")
		finalObj.age = age;
	if(gender.trim() != "-- Select --")
		finalObj.gender = gender;
	if(productCategory.trim() != "-- Select --")
		finalObj.productCategory = productCategory;
	if(product.trim() != "-- Select --")
		finalObj.productName = product;
	
	finalObj.zoneID = $("#outletZone").val();


	
	finalObj.priceRangeStartAmount = $("#startPrice").val();
	finalObj.priceRangeEndAmount = $("#endPrice").val();
	finalObj.startDateStr = fromDate;
	finalObj.endDateStr = endDate;
	if(purchaseChannel.trim() != "-- Select --")
		finalObj.purchaseChannel = purchaseChannel;
	if(message != ""){
		finalObj.message = $("#notificationMsg").val().trim();
		if($("#notificationSubject").val().trim() != "")
			finalObj.subject = $("#notificationSubject").val();
	}
	if(index == undefined || index == "" || index == "save")
		index = 0;
	finalObj.startIndex = index;
	var saveCustomer = $("#saveflag").val();
	finalObj.saveCustomer = saveCustomer;
	if(maxRecords == undefined || maxRecords == "")
		maxRecords = 10;
	finalObj.maxRecords = maxRecords;
	finalObj.searchCriteria = searchName;
	
	//written by manasa
	 var billedLocationsList = [];
	 var length = $('#location').children('option').length;
     	$('#location option').each(function() { 
     		billedLocationsList.push( $(this).attr('value'));
     	});
     	billedLocationsList.splice(0,1);
	/* var  locationList="";
  	for(i=1;i<billedLocationsList.length;i++)
  		{
  		locationList =locationList+ billedLocationsList[i]+',';
  		}*/
//	 console.log(billedLocationsList)
	 
	 var locationStore = ""
		 if($("#location").length>0)
		 locationStore = $("#location").val();
	 if(locationStore =="" || locationStore=="all")
	 finalObj.locationsList = billedLocationsList;
	 else
	 finalObj.storeLocation = $("#location").val();
	 //upto here
	 
		var group_id = $("#customerGroup").val();
		
		var emailOrSms = $("input:radio[name='emailOrSms']:checked").val()
	 
		if(emailOrSms !== undefined && emailOrSms !== null)
			finalObj.notification_channel = emailOrSms;
		
		if(group_id !== undefined && group_id !== null)
			finalObj.group_id = group_id;
	var formData = JSON.stringify(finalObj);
	return formData;
}

function searchProductsBasedOnCategory(name,searchCategory){
	 var contextPath = $("#contextPath").val();
	 var productCategory = "";
	 if ($("#productCategory").val() != "-- Select --")
	 	productCategory = $("#productCategory").val();
	 /*if (productCategory.trim() == "-- Select --"){
		 alert("Please Select a Product Category");
		 return;
	 }*/
//	 URL = contextPath + "/inventorymanager/searchProductsBasedOnCategory.do";
	 URL = contextPath + "/inventorymanager/searchProductsBasedOnCategory.do";
	 $.ajax({
			type: "GET",
			url : URL,
			data : {
				searchName : name,
				productCategory : productCategory
			},
			beforeSend: function(xhr){                    
	   	   		$("#loading").css("display","block");
	   	   		$("#mainDiv").addClass("disabled");
	   	   	},
			success : function(result) {
				appendProducts(result,searchCategory);
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


function appendProducts(productsList,searchCategory){
	 $("."+searchCategory).html('');
	 var op = '';
	 for(var i=0;i<productsList.length;i++){
			 if (i == 0) {
				 op += '<li id="'+productsList[i].skuID+'"  class="selected" onclick=getId(this,"'+searchCategory+'"); ><a>'+productsList[i].productName+'</a></li>';
			}else
			     op += '<li id="'+productsList[i].skuID+'" onclick=getId(this,"'+searchCategory+'"); ><a>'+productsList[i].productName+'</a></li>';
	 }
	 $("."+searchCategory).html(op);
	 $("."+searchCategory).show();
}


function getId(element,type){
	var id= $(element).attr("id");
	var productName =  $("#"+id).children("a").text();
//	$("#product").val(productName);
	$("#product").val(id);
	$("#searchItems").val(productName);
	 $(".services").hide();
	 $("."+type).html("");
}

function displayNotificationPopup(){
	var  op = '<a id="message"  data-toggle="modal" data-target="#notification-modal"></a>';
	 $("#notification").append(op);
	 $("#notificationMsg").val("");
	 $("#message" ).trigger( "click" );
	 $("#notification").html("");
}

function closePopup() {
	$(".modal-backdrop").trigger("click");
}
 
	function displayMessageBox(type){
		$("#notificationError").html("");
		if(type != "sms"){
			$("#subjectDiv").css("display","block");
		}
		else{
			$("#subjectDiv").css("display","none");
		}
	}

function sendNotification(){
	$("#notificationError").html("");
	if($("input[type='radio'][name='emailOrSms']:checked").val() == "email"){
		if($("#notificationSubject").val().trim() == ""){
			$("#notificationError").html("Please Enter Subject");
			return;
		}
	}
	if($("#notificationMsg").val().trim() == ""){
		$("#notificationError").html("Please Enter Message");
		return;
	}
	if($("#notificationMsg").val().trim() != ""){
		if($("#startPrice").val() != "" && $("#endPrice").val() != ""){
			if(parseFloat($("#startPrice").val()) > parseFloat($("#endPrice").val())){
				$("#Error").html("Enter End Price greater than Start Price");
				return;
			}
		}
		if($("#fromDate").val() != "" && $("#endDate").val() != ""){
			 var noOfDays = daydiff(parseDate($('#fromDate').val()), parseDate($('#endDate').val()));
			 if(noOfDays < 0){
				$("#Error").html("Enter End Date greater than Start Date");
				return;
			 }
		}
		//
		var formData = getFormData('notify');
		var contextPath = $("#contextPath").val();
		URL = contextPath + "/crm/sendNotification.do";
		 $.ajax({
				type: "POST",
				url : URL,
				contentType : "application/json",
				data : formData,
				beforeSend: function(xhr){       
					$(".modal-backdrop").trigger("click");
		   				/*$("#loading").css("display","block");
		   				$("#mainDiv").addClass("disabled");*/
		        },
				success : function(result) {
	        		$('#success').val(result);
	        		/*$("#loading").css("display","none");
	    			$("#mainDiv").removeClass('disabled');*/
	
				},
				error : function() {
					 /*alert("something went wrong");
					 $("#loading").css("display","none");
	    			   $("#mainDiv").removeClass('disabled');*/
	
				}
			});
	}
}

function resetForm(){
	$("#country").prop('selectedIndex',0);
	$("#states").html("");
	var op ='<option value="Select State" >Select State</option>';
	$("#states").append(op);
	$("#city").val("");
	$("#customerType").val("-- Select --");
	$("#age").val("-- Select --");
	$("#gender").val("-- Select --");
	$("#productCategory").val("-- Select --");
	$("#fromDate").val("");
	$("#searchItems").val("");
	$("#product").val("");
	$("#endDate").val("");
	$("#startPrice").val("");
	$("#endPrice").val("");
//	$("#priceRange").val("-- Select --");
	$("#purchaseChannel").val("-- Select --");
}


function reset1Form(){
	$("#country").prop('selectedIndex',0);
	$("#states").html("");
	var op ='<option value="Select State" >Select State</option>';
	$("#states").append(op);
	$("#city").val("");
	$("#customerType").val("-- Select --");
	$("#age").val("-- Select --");
	$("#gender").val("-- Select --");
	$("#productCategory").val("-- Select --");
	$("#fromDate").val("");
	$("#searchItems").val("");
	$("#product").val("");
	$("#endDate").val("");
	$("#startPrice").val("");
	$("#endPrice").val("");
	$("#location").val("");
	$("#outletZone").val("");
//	$("#priceRange").val("-- Select --");
	$("#purchaseChannel").val("-- Select --");
}
$("#email").blur(function(){
	  var emailId = $("#email").val();
	  if(emailId==""){
		  return false;
	  }
	  if(!emailValidation(emailId)){
	   	$("#Error").html("Invalid Email Id");
	   	return false;
	  }
	  else{
		$("#Error").html("");
	    return true;
	  }
	});

$("#siteUrl").blur(function(){
	if($("#siteUrl").val().trim() == "")
		return;
	var txt = $('#siteUrl').val();
	var re = /^(http:\/\/www\.|https:\/\/www\.|http:\/\/|https:\/\/|www\.)[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}(:[0-9]{1,5})?(\/.*)?$/
	if (!re.test(txt)) {
		$("#Error").html("Enter Valid URL");
		return;
	}
});

function validateCustomerForm(operation){
	debugger;
	var previousId = $(".highlightaddress").attr("id");
	 $("#"+previousId ).trigger( "click" );
	var finalObj = {};
	var addressList = [];
	finalObj.category = $("#customerType").val();
	finalObj.title = $("#title").val();
	if($("#firstName").val().trim() == ""){
		$("#firstName").focus();
		$("#firstNameError").html("First Name Required");
		return;
	}
	finalObj.name = $("#firstName").val();
	finalObj.lastName = $("#lastName").val();
	finalObj.companyName = $("#companyName").val();
	var txt = $('#siteUrl').val().trim();
	var re = /^(http:\/\/www\.|https:\/\/www\.|http:\/\/|https:\/\/|www\.)[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}(:[0-9]{1,5})?(\/.*)?$/
	if (txt != "" && !re.test(txt)) {
		$("#Error").html("Enter Valid URL");
		return;
	}
	finalObj.siteUrl = $("#siteUrl").val();
	var emailId = $("#emailId").val().trim();
	if(emailId != "" && !emailValidation(emailId)){
		$("#Error").html("Invalid EmailId (Ex:abc@gmail.com)");
	   	return false;
	}
	 if($("#error").text() != ""){
		 $("#phoneNumber").focus();
		 return false;
	 }
	 if($("#error1").text() != ""){
		 $("#phoneNumber1").focus();
		 return false;
	 }
	 //
     var defaultCountry = $("#defaultCountry").val().trim();
	 var phoneNumber = $("#phoneNumber").val().trim();
	 if(defaultCountry != "" && phoneNumber != ""){
		 if(operation == "new"){
			 finalObj.phone = phoneNumber;
		 }
		 else{
			 if($("#phoneNumber").attr("readonly") != "readonly")
				 finalObj.mobileNumber = phoneNumber;
			 finalObj.phoneNumber = phoneNumber;
			 finalObj.phone = $("#phone").val();
		 }
		 if($("#country").val().trim() == "")
			 finalObj.country = $("#defaultCountry option:selected").attr("text");
	 }
	 
	 if( emailId == ""){
		 $("#Error").html("Enter  E-Mail");
		 focusDiv('Error');
		 return;
	 }
	 
	 if(phoneNumber == "" ){
		 $("#Error").html("Enter  Mobile Number ");
		 focusDiv('Error');
		 return;
	 }
	 
	 finalObj.email = emailId;
     var defaultCountry1 = $("#defaultCountry1").val().trim();
	 var phoneNumber1 = $("#phoneNumber1").val().trim();
	 if(defaultCountry1 != "" && phoneNumber1 != ""){
		 finalObj.alternatePhoneNum = phoneNumber1;
		 if($("#country").val().trim() == "" && phoneNumber == "")
			 finalObj.country = $("#defaultCountry1 option:selected").attr("text");
	 }
	finalObj.houseNo = $("#houseNo").val();
	finalObj.street = $("#street").val();
	finalObj.locality = $("#locality").val();
	finalObj.city = $("#city").val();
	finalObj.pin_no = $("#zipCode").val();
	finalObj.state = $("#state").val();
	finalObj.cardCode=$("#cardCode").val();
	if($("#country").val().trim() != "")
		finalObj.country = $("#country").val();
	finalObj.age = $("#age").val();
	finalObj.gender = $("#gender").val();
	finalObj.nationality = $("#nationality").val();
	if($("#dob").val().trim() != "")
		finalObj.dobStr = $("#dob").val();
	if($("#marriageDate").val().trim() != "")
	finalObj.marriageDateStr = $("#marriageDate").val();
	finalObj.customerGstin = $("#customertaxid").val();
	finalObj.qualification = $("#qualification").val();
	finalObj.designation = $("#profession").val();
	finalObj.monthlyIncome = $("#monthlyIncome").val();
	finalObj.familySize = $("#familySize").val();
	finalObj.status = true;
	finalObj.creditBillLimit = $("#creditBillLimit").val();
	if(operation == "new")
		{
		finalObj.availableCreditLimit=$("#creditBillLimit").val();
		}
	/*if($("#shipmentName").val().trim() == ""){
		$("#shipmentNameError").html("shipment Name Required");
		return;
	}*/
	
	for(var id=1;id<5;id++){
		if($("#shipmentNameaddress"+id).val() != "" || $("#shipmentContactaddress"+id).val() != "" || $("#landLineaddress"+id).val() != "" || $("#doorNumberaddress"+id).val() != "" || $("#street1address"+id).val() != "" || $("#locality1address"+id).val() != "" || $("#city1address"+id).val() != "" || $("#zipCode1address"+id).val() != "" ||  $("#state1address"+id).val() != "" ||  $("#country1address"+id).val() != ""){
			if($("#shipmentNameaddress"+id).val() == ""){
				$("#address"+id ).trigger( "click" );
				$("#shipmentNameError").html("Name is Required");
				focusDiv('shipmentNameError');
				return;
			}
			/*if($("#latitude1address"+id).val() == "" || $("#longitude1address"+id).val() == ""){
				$("#address"+id ).trigger( "click" );
				$("#Error").html("Could not find Latitude and Longitude of Shipment Address");
 				focusDiv('Error');
				return;
			}*/
			if($("#country1address"+id).val().trim() == "" && $("#shipmentCountryNameaddress"+id).val() == "")
				$("#country1address"+id).val($("#shipmentCountryNameaddress"+id).val());
			if($("#country1address"+id).val().trim() == "" && $("#landLineCountryNameaddress"+id).val() == "")
				$("#country1address"+id).val($("#landLineCountryNameaddress"+id).val());
			if($("#addressTypeaddress"+id).val() == "")
				$("#addressTypeaddress"+id).val("SA");
			var obj = {
					shipmentName : $("#shipmentNameaddress"+id).val(),
					shipmentContact : $("#shipmentContactaddress"+id).val(),
					landLine : $("#landLineaddress"+id).val(),
					doorNumber : $("#doorNumberaddress"+id).val(),
					streetName : $("#street1address"+id).val(),
					locality : $("#locality1address"+id).val(),
					city : $("#city1address"+id).val(),
					zipCode : $("#zipCode1address"+id).val(),
					state : $("#state1address"+id).val(),
					country : $("#country1address"+id).val(),
					latitude : $("#latitude1address"+id).val(),
					longitude : $("#longitude1address"+id).val(),
					addressType : $("#addressTypeaddress"+id).val(),
					custAddressId : $("#custAddressIdaddress"+id).val()
			}
			addressList.push(obj);
		}
	}
	finalObj.addressList = addressList;
	var formData = JSON.stringify(finalObj);
	var contextPath = $("#contextPath").val();
	if(operation == "new")
		URL = contextPath + "/crm/createCustomer.do";
	else{
		finalObj.password = $("#password").val();
		URL = contextPath + "/crm/updateCustomer.do";
	}
	var formData = JSON.stringify(finalObj);
	 $.ajax({
			type: "POST",
			url : URL,
			contentType : "application/json",
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
function viewEditCustomerDetails(phone,operation){
	 var contextPath = $("#contextPath").val();
	 
	 var maxRecords = 10;
	  if($("#maxRecords").length>0)
		  maxRecords = $("#maxRecords").val();
	  
	 URL = contextPath + "/crm/editCustomerDetails.do";
		$.ajax({
			type: "GET",
			url : URL,
			data : {
				phone : phone,
				operation : operation,
				maxRecords : maxRecords
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

/*function purchases(index)
{
	var Customer ="customer";
	 var mobileNum = $("#phoneNumber").val();
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

function appendPurchases(purchasesList){
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

	////debugger
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
//			appendPurchases(result);
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


function shipmentAddress(ele){
	if($("#shipmentContact").val() != "" && $("#shipmentContact").attr("readonly") != "readonly"){
		var mobileNumberStatus = validatePhoneNumber2();
		if(mobileNumberStatus == false)
			return false;
	}
	if($("#landLine").val() != "" && $("#landLine").attr("readonly") != "readonly"){
		var landlineStatus = validatePhoneNumber3();
		if(landlineStatus == false)
			return false;
	}
	var id = $(ele).attr("id");
	var previousId = $(".highlightaddress").attr("id");
	$('#shipmentName'+previousId).val($("#shipmentName").val());
	if($("#shipmentContact").val() != ""){
		$('#shipmentContactCode'+previousId).val($("#defaultCountry2").val());
		$('#shipmentCountryNameaddress'+previousId).val($("#defaultCountry2 option:selected").attr("text"));
		$('#shipmentContact'+previousId).val($("#shipmentContact").val());
	}
//	$('#shipmentContact'+previousId).val($("#shipmentContact").val());
	
//	$('#landLine'+previousId).val($("#landLine").val());
	if($("#landLine").val() != ""){
		$('#landLineCode'+previousId).val($("#defaultCountry3").val());
		$('#landLineCountryName'+previousId).val($("#defaultCountry3 option:selected").attr("text"));
		$('#landLine'+previousId).val($("#landLine").val());
	}
	$('#doorNumber'+previousId).val($("#doorNumber").val());
	$('#street1'+previousId).val($("#street1").val());
	$('#locality1'+previousId).val($("#locality1").val());
	$('#city1'+previousId).val($("#city1").val());
	$('#zipCode1'+previousId).val($("#zipCode1").val());
	$('#state1'+previousId).val($("#state1").val());
	$('#country1'+previousId).val($("#country1").val());
	$('#latitude1'+previousId).val($("#latitude1").val());
	$('#longitude1'+previousId).val($("#longitude1").val());
	
	
	$(".highlightaddress").removeClass("highlightaddress");
	$("#"+id).addClass("highlightaddress");
	$('#shipmentName').val($("#shipmentName"+id).val());
	$('#shipmentContact').val($("#shipmentContact"+id).val());
	if($("#shipmentContactCode"+id).val() != ""){
		$("#defaultCountry2").val($("#shipmentContactCode"+id).val());
	}
	if($("#shipmentContactCode"+id).val() == "" && $("#shipmentCountryName"+id).val() != ""){
		$("#defaultCountry2 option").each(function (){
			$(this).removeAttr("selected");
			if($(this).attr("text") == $("#shipmentCountryName"+id).val())
				$(this).attr("selected","selected");
		});
	}
	$('#landLine').val($("#landLine"+id).val());
	if($("#landLineCode"+id).val() != "")
		$("#defaultCountry3").val($("#landLineCode"+id).val());
	if($("#landLineCode"+id).val() == "" && $("#landLineCountryName"+id).val() != ""){
		$("#defaultCountry3 option").each(function (){
			$(this).removeAttr("selected");
			if($(this).attr("text") == $("#landLineCountryName"+id).val())
				$(this).attr("selected","selected");
		});
	}
	$('#doorNumber').val($("#doorNumber"+id).val());
	$('#street1').val($("#street1"+id).val());
	$('#locality1').val($("#locality1"+id).val());
	$('#city1').val($("#city1"+id).val());
	$('#zipCode1').val($("#zipCode1"+id).val());
	$('#state1').val($("#state1"+id).val());
	$('#country1').val($("#country1"+id).val());
	$('#latitude1').val($("#latitude1"+id).val());
	$('#longitude1').val($("#longitude1"+id).val());
}
	
	
	

    function initAutocomplete() {
     var input = document.getElementById('street');
        var searchBox = new google.maps.places.SearchBox(input);
      searchBox.addListener('places_changed', function() {
        var places = searchBox.getPlaces();
        if (places.length == 0) {
          return;
        }
        places.forEach(function(place) {
      	    data=JSON.parse(JSON.stringify(place));
      	  	$('#mapid').html("");
            $('#mapid').append(data.adr_address);  
			$("#street").val(data.name);
		 	$("#locality").val($("#mapid .extended-address").text());
	   		$("#city").val($("#mapid .locality").text());
	   		$("#zipCode").val($("#mapid .region").text());
		 	$("#state").val($("#mapid .postal-code").text());
	   		$("#country").val($("#mapid .country-name").text());
		  	$("#latitude").val(JSON.stringify(data.geometry.location.lat));
		  	$("#longitude").val(JSON.stringify(data.geometry.location.lng));
		  	if(($("#street1").val() == "" || $("#street").data("lastval") == $("#street1").val())&& $("#state1").val() == "" && $("#country1").val() == "" && $("#latitude1").val() == "" && $("#longitude1").val() == ""){
		  		$("#street1").val(data.name);
			 	$("#locality1").val($("#mapid .extended-address").text());
		   		$("#city1").val($("#mapid .locality").text());
		   		$("#zipCode1").val($("#mapid .region").text());
			 	$("#state1").val($("#mapid .postal-code").text());
		   		$("#country1").val($("#mapid .country-name").text());
			  	$("#latitude1").val(JSON.stringify(data.geometry.location.lat));
			  	$("#longitude1").val(JSON.stringify(data.geometry.location.lng));
		  	}
//		  	marker.setMap(null);
        });
      });
      var input1 = document.getElementById('street1');
      var searchBox1 = new google.maps.places.SearchBox(input1);
      searchBox1.addListener('places_changed', function() {
      var places1 = searchBox1.getPlaces();
      if (places1.length == 0) {
        return;
      }
      places1.forEach(function(place1) {
    	    data1=JSON.parse(JSON.stringify(place1));
    	  	$('#mapid1').html("");
            $('#mapid1').append(data1.adr_address);  
			$(".street-class1").val(data1.name)
		 	$(".locality-class1").val($("#mapid1 .extended-address").text())
	   		$(".city-class1").val($("#mapid1 .locality").text())
	   		$(".state-class1").val($("#mapid1 .region").text())
		 	$(".zip-code-class1").val($("#mapid1 .postal-code").text())
	   		$(".country-class1").val($("#mapid1 .country-name").text())
		  	$("#latitude1").val(JSON.stringify(data1.geometry.location.lat));
		  	$("#longitude1").val(JSON.stringify(data1.geometry.location.lng));
//		  	marker.setMap(null);
      });
    });
    }
	
	
	
		
	
