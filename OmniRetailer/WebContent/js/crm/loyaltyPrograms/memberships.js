function validateMemberships(operation){
	 //purpose:for checking internet conection
	var re = /^[0-9/]+$/;
	debugger;
	 //purpose:for checking internet conection
	var online = window.navigator.onLine;
 	if(!online)
 	{
 	alert("check your internet connection,please try agian after some time");
 	return;
 	}
	var membership = {};
	if($("#promoCode").val().trim() == ""){
		$("#promoCode").focus();
		$("#errpromoCode").html("Enter Promo Code");
		return;
	}
	var promoCode=$("#promoCode").val();
	if(promoCode.length<5){
			$("#errpromoCode").html("Enter atleast 5 Characters/Numbers");
			return;
		}
	
	if(parseInt($("#promoCode").val().length)>50){
		 $("#promoCode").focus();
			$("#errpromoCode").html("Program Code can't exceeds 50 Characters");
			return;
	}else{
	 $("#errpromoCode").html(" ");
    } 
	
	if($("#startDate").val() == ""){
		$("#startDateError").html("Enter a Date");
		return;
	}
	if(!re.test($("#startDate").val())){
		$("#startDateError").html("Invalid Date");
		return;
	}
	
	if(parseInt($("#graceperiod").val().length)>11){
		 $("#graceperiod").focus();
			$("#graceperiodError").html("Grace Period can't exceeds 11 Digits");
			return;
	}else{
	 $("#graceperiodError").html(" ");
  }
	
	if($("#promoName").val().trim() == ""){
		$("#promoName").focus();
		$("#errPromoName").html("Enter Promo Name");
		return;
	}
	
	if(parseInt($("#promoName").val().length)>45){
		 $("#promoName").focus();
			$("#errPromoName").html("Program Name can't exceeds 45 Characters");
			return;
	}else{
	 $("#errPromoName").html(" ");
   }
			
	if($("#expiryDate").val() == ""){
		$("#expiryDateError").html("Enter a Date");
		return;
	}
	if(!re.test($("#expiryDate").val())){
		$("#expiryDateError").html("Invalid Date");
		return;
	}
	var daysToExpire = daydiff(new Date(), parseDate($('#expiryDate').val()));
if(daysToExpire < 0){
	 $("#expiryDateError").html("Expiry Date should be greater than today");
	 return;
 }
debugger;
	 var noOfDays = daydiff(parseDate($('#startDate').val()), parseDate($('#expiryDate').val()));
	 
	 if(noOfDays>=0)
		{
		noOfDays=noOfDays+1;
		}
	 
	 if(noOfDays < 0){
		 $("#expiryDateError").html("Expiry Date can't be less than Start Date");
		 return;
	 }
	if($("#validityPeriod").val().trim() == ""){
		$("#validityPeriod").focus();
		$("#errValidityPeriod").html("Enter Validity Period");
		return;
	}
	
	if(noOfDays != parseInt($("#validityPeriod").val())){
  		$("#errValidityPeriod").html("Enter Number of Days Properly");
  		return;
  	}
	
	if(parseInt($("#validityPeriod").val().length)>11){
		 $("#validityPeriod").focus();
			$("#errValidityPeriod").html("Validity period can't exceeds 11 Digits");
			return;
	}else{
	 $("#errValidityPeriod").html(" ");
   }
		
	if(parseInt($("#quantity").val().length)>11){
		 $("#quantity").focus();
			$("#errQuantity").html("No Of Membership can't exceeds 11 Digits");
			return;
	}else{
	 $("#errQuantity").html(" ");
   }
	
	  var maxRecords = 10;
 	  if($("#maxRecords").length>0)
 		  maxRecords = $("#maxRecords").val();
 	  
 	  var searchName ="";
 	  if($("#searchAsset").length>0)
	  searchName = $("#searchAsset").val();	 
 	  
 	 var zones = $("#zones").val();
		if(zones == "" || zones == null){
			$("#errStates").html("Select zone");
			return;
		}
		var locations = $("#location").val();
		if(locations == "" || locations == null){
			$("#errLocation").html("Select Location");
			return;
		}
		
		if ($('#otpRequired').is(':checked')) 
			$("#otpRequired").val("true");
		else
			$("#otpRequired").val("false");
 		
		var location = "";
		if($("#outletLocation").length > 0)
			location = $("#outletLocation").val();
		var zone = "";
		if($("#outletZone").length > 0)
			zone = $("#outletZone").val();
		var startdate = "";
		if($("#couponStartDate").length > 0)
			startdate = $("#couponStartDate").val();
		var enddate = "";
		if($("#couponEndDate").length > 0)
			enddate = $("#couponEndDate").val();
		var searchName = "";
	 		if($("#searchCoupons").length > 0 )
	 			searchName = $("#searchCoupons").val().trim();
			
 	 $("#selectedZone").val(zones.toString());
		$("#selectedLocation").val(locations.toString());
	
		
		var graceperiod = 0;
		if($("#graceperiod").length > 0)
			graceperiod = $("#graceperiod").val();
		
		var renewalPrice = 0;
		if($("#renewalprice").length > 0)
			renewalPrice = $("#renewalprice").val();
		
		if($("#quantity").val().trim() == ""){
			$("#errQuantity").html("Enter a Number");
			return;
		}
		
 	 membership.membershipProgramCode = $("#promoCode").val();
 	membership.promoName = $("#promoName").val();
 	membership.startDateStr = $("#startDate").val();
 	membership.expiryDateStr  = $("#expiryDate").val();
 	membership.membershipFee = $("#membershipFee").val();
 	membership.validityPeriod = $("#validityPeriod").val();
 	membership.status = $("#status").val();
 	membership.country = $("#country").val();
 	membership.selectedZones = $("#selectedZone").val();
 	membership.locations = $("#selectedLocation").val();
 	membership.otpRequired = $("#otpRequired").val();
 	
 	if($("#assignedStatus").val() == "1"){
 		membership.assignedStatus = true;	
 	}else{
 		membership.assignedStatus = false;
 	}
 	
 	
 	membership.membershipType = $("#membershipType").val();
 	membership.gracePeriod=graceperiod;
 	membership.renewalPrice=renewalPrice;
 	membership.quantity=$("#quantity").val().trim();
 	
 	
 	
 
if(operation == "edit"){
	var len = $("#cardsDetails tr").length-1;
	var memberships = [];
	var customerMemberships = [];
	
	  $('.edited').each(function() {
		
		  var idAttr= $(this).attr("id").replace('membershipCode','');
		
		
		debugger;
		
		var assignedStatus=$("#assignrdstatus"+idAttr).val()
			if(assignedStatus=="No")
				{
				assignedStatus=false;
				}
			else
				{
				assignedStatus=true;
				}
			
			var membershipStatus=$("#membershipstatus"+idAttr).val()
			if(membershipStatus=="InActive")
				{
				membershipStatus=false;
				}
			else
				{
				membershipStatus=true;
				}
			
			var status=$("#status"+idAttr).val()
			if(status=="false")
				{
				status=false;
				}
			else
				{
				status=true;
				}
			
			var isAutoRenewal= 0;
			isAutoRenewal =parseInt($("#isAutoRenewal"+idAttr).val());
			
			if(isAutoRenewal == null || isAutoRenewal == undefined || isNaN(isAutoRenewal)){
				isAutoRenewal = 0;
			}
			var isOnline= 0;
			isOnline =parseInt($("#isOnline"+idAttr).val());
			
			if(isOnline == null || isOnline == undefined || isNaN(isOnline)){
				isOnline = 0;
			}
			
		
			/*var statuscus=$("#statuscus"+idAttr).val()
			if(statuscus=="false")
				{
				statuscus=false;
				}
			else
				{
				statuscus=true;
				}
			
			var saveReportcus=$("#saveReportcus"+idAttr).text()
			if(saveReportcus=="false")
				{
				saveReportcus=false;
				}
			else
				{
				saveReportcus=true;
				}
		
			
			var membershipFeecus= 0;
			membershipFeecus =parseInt($("#membershipFeecus"+idAttr).val());
			
			if(membershipFeecus == null || membershipFeecus == undefined || isNaN(membershipFeecus)){
				membershipFeecus = 0;
			}
			
			var activationPointscus= 0;
			activationPointscus =parseInt($("#activationPoints"+idAttr).val());
			
			if(activationPointscus == null || activationPointscus == undefined || isNaN(activationPointscus)){
				activationPointscus = 0;
			}
			
			var creditAmount= 0;
			creditAmount =parseInt($("#creditAmount"+idAttr).val());
			
			if(creditAmount == null || creditAmount == undefined || isNaN(creditAmount)){
				creditAmount = 0;
			}
			
			var isAutoRenewalcus= 0;
			isAutoRenewalcus =parseInt($("#isAutoRenewalcus"+idAttr).val());
			
			if(isAutoRenewalcus == null || isAutoRenewalcus == undefined || isNaN(isAutoRenewalcus)){
				isAutoRenewalcus = 0;
			}
			
			var isOnlinecus= 0;
			isOnline =parseInt($("#isOnlinecus"+idAttr).val());
			
			if(isOnlinecus == null || isOnlinecus == undefined || isNaN(isOnlinecus)){
				isOnlinecus = 0;
			}
			
		*/
		
		
		
			var obj = {membershipCode:$("#membershipCode"+idAttr).val(),membershipProgramCode:$("#promoCode").val(),assignedStatus:assignedStatus,membershipStatus:membershipStatus,membershipId:$("#membershipId"+idAttr).val(),status:status,isAutoRenewal:isAutoRenewal,isOnline:isOnline};
			//var obj1 = {member_ship_id:$("#member_ship_id"+idAttr).text(),membershipProgramCode:$("#membershipProgramCodecus"+idAttr).text(),phone_num:$("#phone_num"+idAttr).val(),customer_category:$("#customer_category"+idAttr).val(),status:statuscus,start_date:$("#start_date"+idAttr).val(),end_date:$("#end_date"+idAttr).val(),membershipFee:membershipFeecus,activationPoints:activationPointscus,creditAmount:creditAmount,isAutoRenewal:isAutoRenewalcus,isOnline:isOnlinecus,saveReport:saveReportcus};

			memberships.push(obj);
	        membership.memberships = memberships;
		
		
			console.log(memberships);
			
			if(($("#membershipCode"+idAttr).val()) == ($("#member_ship_id"+idAttr).val())){
				

				  
				 
				 var statuscus=$("#statuscus"+idAttr).val()
					if(statuscus=="false")
						{
						statuscus=false;
						}
					else
						{
						statuscus=true;
						}
					
					var saveReportcus=$("#saveReportcus"+idAttr).val()
					if(saveReportcus=="false")
						{
						saveReportcus=false;
						}
					else
						{
						saveReportcus=true;
						}
				
					
					var membershipFeecus= 0;
					membershipFeecus =$("#membershipFeecus"+idAttr).val();
					
					if(membershipFeecus == null || membershipFeecus == undefined || isNaN(membershipFeecus)){
						membershipFeecus = 0;
					}
					
					var activationPointscus= 0;
					activationPointscus =$("#activationPoints"+idAttr).val();
					
					if(activationPointscus == null || activationPointscus == undefined || isNaN(activationPointscus)){
						activationPointscus = 0;
					}
					
					var creditAmount= 0;
					creditAmount =$("#creditAmount"+idAttr).val();
					
					if(creditAmount == null || creditAmount == undefined || isNaN(creditAmount)){
						creditAmount = 0;
					}
					
					var isAutoRenewalcus= 0;
					isAutoRenewalcus =parseInt($("#isAutoRenewalcus"+idAttr).val());
					
					if(isAutoRenewalcus == null || isAutoRenewalcus == undefined || isNaN(isAutoRenewalcus)){
						isAutoRenewalcus = 0;
					}
					
					var isOnlinecus= 0;
					isOnline =parseInt($("#isOnlinecus"+idAttr).val());
					
					if(isOnlinecus == null || isOnlinecus == undefined || isNaN(isOnlinecus)){
						isOnlinecus = 0;
					}
					
				
				
				
				
					var obj1 = {member_ship_id:$("#member_ship_id"+idAttr).val(),membershipProgramCode:$("#membershipProgramCodecus"+idAttr).val(),phone_num:$("#phone_num"+idAttr).val(),customer_category:$("#customer_category"+idAttr).val(),status:statuscus,startDateStr:$("#startDateStr"+idAttr).val(),endDateStr:$("#expirydateStr"+idAttr).val(),membershipFee:(parseFloat(membershipFeecus)),activationPoints:(parseFloat(activationPointscus)),creditAmount:(parseFloat(creditAmount)),isAutoRenewal:isAutoRenewalcus,isOnline:isOnlinecus,saveReport:saveReportcus,name:$("#name"+idAttr).val(),renewalDateStr:$("#renewaldate"+idAttr).val()};

				
				  
				  
					customerMemberships.push(obj1);
					
					debugger;
					console.log(customerMemberships);
			  
				
			         membership.customerMemberships = customerMemberships;

				
			}
			
			//customerMemberships.push(obj1);

	});
	  debugger;
	  /*var customerData  = parseInt($("#customerdata").val());
	  var idAttr;
	 
	  for(idAttr =1;idAttr<=customerData;idAttr++){
		  
		 
		 var statuscus=$("#statuscus"+idAttr).val()
			if(statuscus=="false")
				{
				statuscus=false;
				}
			else
				{
				statuscus=true;
				}
			
			var saveReportcus=$("#saveReportcus"+idAttr).val()
			if(saveReportcus=="false")
				{
				saveReportcus=false;
				}
			else
				{
				saveReportcus=true;
				}
		
			
			var membershipFeecus= 0;
			membershipFeecus =$("#membershipFeecus"+idAttr).val();
			
			if(membershipFeecus == null || membershipFeecus == undefined || isNaN(membershipFeecus)){
				membershipFeecus = 0;
			}
			
			var activationPointscus= 0;
			activationPointscus =$("#activationPoints"+idAttr).val();
			
			if(activationPointscus == null || activationPointscus == undefined || isNaN(activationPointscus)){
				activationPointscus = 0;
			}
			
			var creditAmount= 0;
			creditAmount =$("#creditAmount"+idAttr).val();
			
			if(creditAmount == null || creditAmount == undefined || isNaN(creditAmount)){
				creditAmount = 0;
			}
			
			var isAutoRenewalcus= 0;
			isAutoRenewalcus =parseInt($("#isAutoRenewalcus"+idAttr).val());
			
			if(isAutoRenewalcus == null || isAutoRenewalcus == undefined || isNaN(isAutoRenewalcus)){
				isAutoRenewalcus = 0;
			}
			
			var isOnlinecus= 0;
			isOnline =parseInt($("#isOnlinecus"+idAttr).val());
			
			if(isOnlinecus == null || isOnlinecus == undefined || isNaN(isOnlinecus)){
				isOnlinecus = 0;
			}
			
		
		
		
		
			var obj1 = {member_ship_id:$("#member_ship_id"+idAttr).val(),membershipProgramCode:$("#membershipProgramCodecus"+idAttr).val(),phone_num:$("#phone_num"+idAttr).val(),customer_category:$("#customer_category"+idAttr).val(),status:statuscus,start_date:$("#start_date"+idAttr).val(),end_date:$("#end_date"+idAttr).val(),membershipFee:(parseFloat(membershipFeecus)),activationPoints:(parseFloat(activationPointscus)),creditAmount:(parseFloat(creditAmount)),isAutoRenewal:isAutoRenewalcus,isOnline:isOnlinecus,saveReport:saveReportcus};

		
		  
		  
			customerMemberships.push(obj1);
			
			debugger;
			console.log(customerMemberships);
	  }
	  */
	
	
	
         
         var editPlusmembershipss="";
         
         
         for(var editPlusMembership in editPlusMemberships )
			{
        	 editPlusmembershipss += editPlusMemberships[editPlusMembership] +","; 
			}
         
         
         membership.membershipIdsStr = editPlusmembershipss;
         membership.customerMembershipIdsStr = editPlusmembershipss;
        // membership.customerMemberships = customerMemberships;
	
	}

if(importfile == 1){
   membership.uploadedfilePath ="Membership.xlsx";
	   membership.importFlag =true;
}
 	debugger;
 	
		var formData = JSON.stringify(membership);
		console.log(formData);
		var contextPath = $("#contextPath").val();
	   if(operation=="new"){
		   URL = contextPath + "/crm/createMembership.do";
	   }
	   else if(operation=="edit"){
		   
		   URL = contextPath + "/crm/updateMembership.do";
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
		  			    $("#outletLocation").val(location);
					    $("#outletZone").val(zone);
					    $("#couponStartDate").val(startdate);
					    $("#couponEndDate").val(enddate);
						$("#searchCoupons").val(searchName);
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



function viewMembershipDetails(id,type,index,pagination){
	debugger;
	var contextPath = $("#contextPath").val();
		URL = contextPath + "/crm/viewMembershipDetails.do";
		 //
		var location = "";
	if($("#outletLocation").length > 0)
		location = $("#outletLocation").val();
	var zone = "";
	if($("#outletZone").length > 0)
		zone = $("#outletZone").val();
	var startdate = "";
	if($("#couponStartDate").length > 0)
		startdate = $("#couponStartDate").val();
	var enddate = "";
	if($("#couponEndDate").length > 0)
		enddate = $("#couponEndDate").val();
	
	
	if(pagination=="" || pagination == null || pagination == undefined){
		pagination ="";
	}
	
	var searchName = "";
	
	if(id=="" || id == null){	
 		if($("#searchItems").length > 0 )
 			searchName = $("#searchItems").val().trim();
		
 		if(id=="" || id == null){
 			id = $("#promoCode").val();
 		}
 		
	}
 		
 		
 		
		$.ajax({
			type: "GET",
			url : URL,
			data : {
				id : id,
				type : type,
				index:index,
				searchName:searchName,
				pagination:pagination,
			},
			beforeSend: function(xhr){                    
  	   			$("#loading").css("display","block");
  	   			$("#mainDiv").addClass("disabled");
  	   		  },
  			success : function(result) {
  				//
				$("#right-side").html(result);
  			    $("#outletLocation").val(location);
			    $("#outletZone").val(zone);
			    $("#couponStartDate").val(startdate);
			    $("#couponEndDate").val(enddate);
			    $("#searchCoupons").val(searchName);
				$("#loading").css("display","none");
				$("#mainDiv").removeClass('disabled');
			},
			error : function() {
				 alert("Internal Error.Please Contact Technolabs Support.");
				$("#loading").css("display","none");
				$("#mainDiv").removeClass('disabled');
			}
		});
	
}

function saveMembership(type,saveflag){
	debugger;
	
	var contextPath = $("#contextPath").val();
	URL = contextPath + "/crm/saveMembershipDetails.do";
			
			var location = "";
		if($("#outletLocation").length > 0)
			location = $("#outletLocation").val();
		var zone = "";
		if($("#outletZone").length > 0)
			zone = $("#outletZone").val();
		var startdate = "";
		if($("#couponStartDate").length > 0)
			startdate = $("#couponStartDate").val();
		var enddate = "";
		if($("#couponEndDate").length > 0)
			enddate = $("#couponEndDate").val();
		var searchName = "";
				if($("#searchItems").length > 0 )
					searchName = $("#searchItems").val().trim();
				
			var	id=$("#promoCode").val();
			var type=$("#typeop").val();
			
			if(type == "" || type == null ||type == undefined){
				type = "view";
			}
			
			$.ajax({
				type: "GET",
				url : URL,
				data : {
					id : id,
					type : type,
					searchName:searchName,
					saveflag:saveflag,
				},
				beforeSend: function(xhr){                    
			   			$("#loading").css("display","block");
			   			$("#mainDiv").addClass("disabled");
			   		  },
					success : function(result) {
						//
						 if(saveflag == "true"){
							 $("#right-side").html(result);
						 }else{
							 $("#childsearchMembership").html(result);
						 }
						
					
					    $("#outletLocation").val(location);
				    $("#outletZone").val(zone);
				    $("#couponStartDate").val(startdate);
				    $("#couponEndDate").val(enddate);
				    $("#searchCoupons").val(searchName);
				    
				    
				    if(saveflag == "true"){
				    var downloadUrl=$("#DowlnoadUrlId").val();
				    if(downloadUrl!=null && downloadUrl!="" && downloadUrl!=undefined)
				    	{
				    	var anchor = document.createElement('a');
	 					anchor.href = downloadUrl;
	 					anchor.target = '_blank';
	 					anchor.download = '';
	 						anchor.click();
				    	}
				    else
				    	{
				    	 alert("Internal Error.Please Contact Technolabs Support.");
				    	}
				    }
				    
					$("#loading").css("display","none");
					$("#mainDiv").removeClass('disabled');
				},
				error : function() {
					 alert("Internal Error.Please Contact Technolabs Support.");
					$("#loading").css("display","none");
					$("#mainDiv").removeClass('disabled');
				}
			});
			
	
}

function addNameToTextBox(id){
	debugger;
	membershipsFiles = [];
	membershipsFiles = event.target.files;
	
}


var importfile = 0;

function importDataxls(){
	//;
	debugger;
	
	
	if(membershipsFiles.length <= 0)
	{
	alert("Please Select Excel Sheet... ");
		return;
	}
	
	var oMyForm = new FormData();
	//var files = id+'Files';
	importfile = 1;

		oMyForm.append("file",membershipsFiles[0]);
//		var fileSize = couponsFiles[0].size;

	var contextPath = $("#contextPath").val();
	URL = contextPath + "/dataManagement/membershipImportData.do";
	$.ajax({
		dataType : 'json',
		url : URL,
		data :	oMyForm,
		type : "POST",
		enctype: 'multipart/form-data',
		processData: false, 
		contentType:false,
		success : function(result) {
			debugger;
			var myJSON = JSON.stringify(result);
			var n = myJSON.includes("Imported");
			var m = myJSON.includes("Rename");
			if(n == true){	
			alert("Imported Successfully");
			}else if(m == true){
				alert("Please Rename File as 'Membership.xlsx'!");
			}else{
				alert("Error,Please try again");
			}
			
		},
		error : function(e){
			debugger;
			alert("Error,Please try again");
//			messageStatus= JSON.stringify(e.responseText);
  			var parsed_json = JSON.parse(e.responseText);
  			var error = parsed_json.errorUrl;
  			

  			var errorUrl = parsed_json.errorUrl;
  			if(errorUrl != undefined && errorUrl !="")
  			{
  				var pattern = /\\/;
				var err = errorUrl.split(pattern);
				errorUrl = err[0] + "//" + err[1];	
  				//$("#errorUrl").attr("href", errorUrl); 
  				$("#url").css("display","block");

  			}

  			var msg = parsed_json.msg;
  			
  		
			
		}
	});
}

var editPlusMemberships = [];

function membershipEdit(count)
{
	var end_date = $("#expirydateStr"+count).val();
	if(end_date == null || end_date == undefined ){
		
		alert("Assign Membership to Customers Before Updation.");
		return;
	}

	debugger;
	
	var membershipedit = $("#membershipCode"+count).val();
	
	
		$(".renewaldate"+count).removeAttr("disabled");
		$(".expiryateStr"+count).removeAttr("readonly");
		$(".name"+count).removeAttr("disabled");
		$(".phone_num"+count).removeAttr("disabled");
		$(".membershipstatus"+count).removeAttr("disabled");
		$(".assignrdstatus"+count).removeAttr("disabled");
		
		editPlusMemberships.push(membershipedit);
		$("#membershipCode"+count).addClass("edited");
}
	
