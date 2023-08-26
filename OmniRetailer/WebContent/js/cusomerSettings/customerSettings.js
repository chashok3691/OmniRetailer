function enableFileBrowse(ele,id){
	
//	$("#Error").html('');
	 var contextPath = $("#contextPath").val();
	if (ele != '')
	   id = $(ele).attr("id");
	if($("#"+id).prop('checked')){
		$("#"+id+"Btn").closest('div').removeClass('btn-primar');
		$("#"+id+"Btn").closest('div').addClass('btn-primary');
		$("#"+id+"Btn").removeAttr("disabled");
		//$("#"+id+"File").val("");
	}
	else{
		replaceWithNewFileType(id);
		$("#"+id+"Btn").closest('div').removeClass('btn-primary');
		$("#"+id+"Btn").closest('div').addClass('btn-primar');
		$("#"+id+"Btn").attr("disabled","disabled");
	}
	$("#"+id+"Img").closest('span').css("visibility","hidden");
	$("#"+id+"Img").attr("src",contextPath+"/images/circleWait.gif");
//	$("#"+id+"File").val("");
}

function replaceWithNewFileType(id){
	var newFile = "<input id='"+id+"Btn' disabled='disabled' type='file' accept='.csv, application/vnd.openxmlformats-officedocument.spreadsheetml.sheet, application/vnd.ms-excel' onchange=addNameToTextBox('"+id+"'); class='upload' />";
	var $fileInput=$("#"+id+"Btn");
	var $fileCopy = $(newFile);
	$fileInput.replaceWith($fileCopy);
}

function deletePic(id){
	var k = confirm("Are you sure you want to Delete");     
	if(k == true){
		var fileControl = '<input type="file" id="dealBanner" name="dealBanner" onchange="loadImageFileAsURL('+"'"+'dealBanner'+"'"+',this);" />';
		var $fileInput=$("#"+id);
		var $fileCopy = $(fileControl);
		$fileInput.replaceWith($fileCopy);
		$("#dealBannerLabel").after("<br>");
		$("#"+id+"_thumbnail").remove();
		$("#"+id+"_delImage").remove();
		$("#"+id+"_label").css("display","block");
		//$("#picture"+id+"_byte").val('');
	}
}
//sku.js
function loadImageFileAsURL(id,ele) {
	if (ele.files && ele.files[0]) {
        var reader = new FileReader();

        reader.onload = function (e) {
        	$("#"+id+"_label").css("display","none");
        	$("#" + id + "_image").html("");//added
        	$("#" + id + "_image").append('<img class="thumbnail companyimage" id="'+id+'_thumbnail" src=' + e.target.result + ' style="">');
        };

        reader.readAsDataURL(ele.files[0]);
       
        var oMyForm = new FormData();
        oMyForm.append("file",  ele.files[0]);

        if($("#"+id+"_refId").val() != "")
        	oMyForm.append("refId",  $("#"+id+"_refId").val());
       
        else
        	oMyForm.append("refId", "");
      
        var contextPath = $("#contextPath").val();
        var URL = contextPath + "/inventorymanager/addToAttachementList.do";
        $.ajax({
//				dataType : 'json',
        	url : URL,
        	data : oMyForm,
        	type : "POST",
        	enctype : 'multipart/form-data',
        	processData : false,
        	contentType : false,
        	beforeSend : function(xhr) {
        	},
        	success : function(result) {
        		$("#"+id+"_refId").val(result);
        	},
        	error : function() {
        		alert("something went wrong");
        	}
        });
    }
};



function addNameToTextBox(id,ele){
	
	if($("#"+id+"Btn")[0].files[0] != undefined){
		$("#"+id+"File").val($("#"+id+"Btn")[0].files[0]['name']);
		loadImageFileAsURL(id,ele);
	}
		
	else
		$("#"+id+"File").val("");

}






$("#businessName").keydown(function(){
	   $("#businessNameError").html("");
	   $(".Error").html("");
}); 
 
$("#phoneNumber").keydown(function(){
	   $("#error").html("");
	   $(".Error").html("");
}); 

$("#mailId").keydown(function(){
	   $("#mailIdError").html("");
	   $(".Error").html("");
});

$("#expireson").keydown(function(){
	   $("#expiresonError").html("");
	   $(".Error").html("");
});
/*$("#lastRenewedDate").keydown(function(){
	   $("#lastRenewedDateError").html("");
	   $("#Error").html("");
});*/
$("#corporateAddress").keydown(function(){
	   $("#corporateAddressError").html("");
	   $(".Error").html("");
}); 

$("#billingAddress").keydown(function(){
	   $("#billingAddressError").html("");
	   $(".Error").html("");
}); 
/*$("#saasPlan").keydown(function(){
	   $("#saasPlanError").html("");
	   $("#Error").html("");
});*/
/*$("#logoFile").keydown(function(){
	   $("#logoFileError").html("");
	   $("#Error").html("");
});
$("#proofFile").keydown(function(){
	   $("#proofFileError").html("");
	   $("#Error").html("");
});*/
function validateCustomerSettingsForm(operation){
	var customerSettings = {}/*,templatesList = []*/;
/*	if($("#customerId").val().trim() == ""){
		$("#customerIdError").html("Enter Customer Id");
		return;
	}*/
	if($("#businessName").val().trim() == ""){
		$("#businessNameError").html("Enter Business Name");
		return;
	}
	if($("#defaultLocation").val() == "" || $("#defaultLocation").val() == null){
		$("#Error").html("Please Create Outlet or Warehouse to select Default Location");
		return;
	}
	/*
	if($("#error").text() != ""){
		 $("#phoneNumber").focus();
		 return false;
	}*/
	if($("#phoneNumber").val().trim() == ""){
		$("#error").html("Enter  Personal Contact Number");
		return;
	}
	
		
	if($("#mailId").val().trim() == ""){
		$("#mailIdError").html("Enter E-Mail Id");
		return;
	}
	
	
//	$("#mailId").blur(function(){
	 	  var email = $("#mailId").val();
	 	  if(email==""){
	 		 return false;
	 	  }
	 	 // alert(emailValidation(email));
		  if(!emailValidation(email)){
		   	$("#mailIdError").html("Invalid EmailId (Ex:abc@gmail.com)");
		   	return false;
		  }
		  else{
			$("#mailIdError").html("");
		  }
		//});  
		 
			if($("#expireson").val().trim() == ""){
				$("#expiresonError").html("Select Expiry Date");
				return;
			}
			
		/*	if($("#lastRenewedDate").val().trim() == ""){
				$("#lastRenewedDateError").html("Select Last Renewed Date");
				return;
			}
		  */


var defaultCountry = $("#defaultCountry").val().trim();
var phoneNumber = $("#phoneNumber").val().trim();
if(defaultCountry != "" && phoneNumber != ""){
	$("#pcn").val(defaultCountry+"-"+phoneNumber);
	// $("#pcn").val(phoneNumber);
	 //alert($("#pcn").val());
}
var contactNo = $("#pcn").val();
if(contactNo.trim() == ""){
	$("#phoneNumber").focus();
	$("#error").html("Contact Number Required");
	return false;
}
	

	
	if($("#error1").text() != ""){
		 $("#phoneNumber1").focus();
		 return false;
	}
	var defaultCountry1 = $("#defaultCountry1").val().trim();
	var phoneNumber1 = $("#phoneNumber1").val().trim();
	if(defaultCountry1 != "" && phoneNumber1 != ""){
		$("#acn").val(defaultCountry1+"-"+phoneNumber1);
		// $("#acn").val(phoneNumber1);
		 //alert($("#pcn").val());
	}
	var contactNo1 = $("#acn").val();
/*	if(contactNo1.trim() == ""){
		$("#phoneNumber1").focus();
		$("#error1").html("Contact Number Required");
		return false;
	}*/
		
	if($("#corporateAddress").val() == ""){
		$("#corporateAddressError").html("Enter Corporate Address");
		return;
	}
	
	if($("#billingAddress").val() == ""){
		$("#billingAddressError").html("Enter Billing Address");
		return;
	}
	
	
	


	//mailSettings.templatesList=templatesList;
	//customerSettings.customerID = $("#customerId").val();
	customerSettings.name = $("#businessName").val();
	customerSettings.contactPerson = $("#contactPerson").val();
	customerSettings.primaryContactNumber = $("#pcn").val();
	customerSettings.alternateContactNum = $("#acn").val();
	customerSettings.mailID = $("#mailId").val();
	customerSettings.monthlyLicensePrice = $("#monthlyLicensePrice").val();
	customerSettings.businessDescription = $("#businessDescription").val();
	customerSettings.corporateAddress = $("#corporateAddress").val();
	customerSettings.corporateLocation = $("#location").val();
	customerSettings.corporateCity = $("#city").val();
	customerSettings.billingAddress = $("#billingAddress").val();
	customerSettings.billingCity = $("#city1").val();
	customerSettings.billingLocation = $("#location1").val();
	customerSettings.siteURL = $("#siteUrl").val();
	customerSettings.billingCycle = $("#bilingCycle").val();
	customerSettings.saasPlan = $("#saasPlan").val();
	customerSettings.expiresOn = $("#expireson").val();
	customerSettings.lastRenewedDate = $("#lastRenewedDate").val();
	customerSettings.logoName = $("#logo1File").val();
	customerSettings.logoImageID = $("#logo1_refId").val();
	customerSettings.proofDocName = $("#proofFile").val();
	customerSettings.proofDocumentID = $("#proof_refId").val();
	customerSettings.defaultLocation = $("#defaultLocation").val();
	customerSettings.corporateId = $("#corporateId").val();
	customerSettings.vat = $("#vatNum").val();
	customerSettings.serviceTax = $("#serviceTaxNum").val();
		var formData = JSON.stringify(customerSettings);
//		console.log(formData);
		var contextPath = $("#contextPath").val();
	   if(operation=="new"){
		   URL = contextPath + "/settings/createCustomerSettings.do";
	   }
	   else if(operation=="edit"){
		   
		   URL = contextPath + "/settings/updateCustomerSettings.do";
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



