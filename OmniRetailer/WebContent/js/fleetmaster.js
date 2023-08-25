/*var countranges = 0;
 function addynamicrow(){
	 debugger;
		//
		 var contextPath = $("#contextPath").val();
		 //purpose:for checking internet conection
		var online = window.navigator.onLine;
	  	if(!online){
	  	alert("check your internet connection,please try agian after some time");
	  	return;
	  	}
		
			 var len = parseInt($("#dynamictblerow tr").length);
			if (len != 1)
			len = parseInt($("#dynamictblerow tr:last").attr("id").replace('dynamicdiv', '')) + 1;
			 var type = $("#type").val();
			var slNo = 1; 
				 $('.slno').each(function(){
					$(this).text(slNo);
					slNo = parseInt(slNo) + 1;
				});
				 var vehicleno = 0;
				 var vehicledescription = 0;
				 var vehicletype = 0;
				 var carrycapacity=0;
				 var status=0;
				 
				 
				 
				 if($("#vno").length>0 &&$("#vno").val()!="")
					 vehicleno = $("#vno").val();
				 if($("#vdes").length>0)
					 vehicledescription = $("#vdes").val();
				 if($("#vtype").length>0)
					 vehicletype = $("#vehicletype").val();
				 if($("#ccapacity").length>0)
					var carrycapacity = $("#ccapacity").val();
				 var status = $("#status").val();
				 
				 if(vehicleno=="")
				 {
				 alert("Please select vehicle no");
				 return;
				 }
				 if(vehicledescription=="")
				 {
				 alert("Please select vehicle description");
				 return;
				 }
				 if(vehicletype=="")
				 {
				 alert("Please select vehicle type");
				 return;
				 }
				 
				 if(carrycapacity =="")
				 {
				 alert("Please select carry capacity");
				 return;
				 }
				 
				 if(status =="")
				 {
				 alert("Please select status");
				 return;
				 }
				 
				 if(len!=0){
                for (var i = 1; i <= len; i++) {
					 if(startvalue==$("#startvalue"+i).text().trim() && endvalue==$("#endvalue"+i).text().trim() && rewardValue==$("#rewardValue"+i).text().trim() ){
					 alert("Purchase Rnage already added");
					 return;
					 }
					if(parseFloat(startvalue)<=parseFloat($("#endvalue"+i).text().trim()) || parseFloat(endvalue)<=parseFloat($("#endvalue"+i).text().trim())) 
					 {
						alert("start end end value should be greater than previous range");
						return;
					 }
				 }
				 } 
			 var row = "<tr id='dynamicdiv"+len+"' class='MoveableRow' style='margin-top:5px;'>" +
			 "<td id='vno"+len+"'>"+vehicleno+"</td>" +	
			 "<td id='vdes"+len+"'>"+vehicledescription+"</td>" +
			 "<td id='vtype"+len+"'>"+vehicletype+"</td>" +
			 "<td id='ccapacity"+len+"'>"+carrycapacity+"</td>" +
			 "<td id='status"+len+"'>"+status+"</td>" +
			"<td  id='Del"+len+"'><img id='Dele"+len+"' src='"+contextPath+"/images/itemdelete.png' style='width:45%;cursor:pointer;' onclick='deleteItem(this);' title='Delete'/>"+
			"</td></tr>";
				
		$("#dynamictblerow tbody").append(row);
		$("#data").css("display","block");
		countranges = countranges+1;
	}*/



 function deleteItem(element){
	 debugger;
		var id = $(element).attr("id").replace('Del','');
		$('#dynamicdiv'+id).remove();
	}

function appendVehicleDetails(){
	debugger;
	
	var vehicleNo = $("#vehicleNo").val();
	if(vehicleNo == "" || vehicleNo == null || vehicleNo == undefined){
 		$("#vehicleNoError").html("Please enter Vehicle No");
    	$("#vehicleNo").focus();
	  	return false;
 	}else{
 		$("#vehicleNoError").html("");
 	}
	
	var vehicleType = $("#vehicleType").val();
	if(vehicleType == "" || vehicleType == null || vehicleType == undefined){
 		$("#vehicleTypeError").html("Please enter Vehicle type");
    	$("#vehicleType").focus();
	  	return false;
 	}else{
 		$("#vehicleTypeError").html("");
 	}
	
	var vehicleDescription = $("#vehicleDesc").val();
	if(vehicleDescription == "" || vehicleDescription == null || vehicleDescription == undefined){
 		$("#vehicleDescError").html("Please enter description");
    	$("#vehicleDesc").focus();
	  	return false;
 	}else{
 		$("#vehicleDescError").html("");
 	}
	
	var carryCapacity=$("#carryCapacity").val();
	if(carryCapacity == "" || carryCapacity == null || carryCapacity == undefined){
 		$("#carryCapacityError").html("Please Enter Capacity");
    	$("#carryCapacity").focus();
	  	return false;
 	}else{
 		$("#carryCapacityError").html("");
 	}
	
	var dateofPurchase=$("#dateofPurchase").val();
	if(dateofPurchase == "" || dateofPurchase == null || dateofPurchase == undefined){
 		$("#dateofPurchaseError").html("Please Select Purchase Date");
    	$("#dateofPurchase").focus();
	  	return false;
 	}else{
 		$("#dateofPurchaseError").html("");
 	}
	
	var vehicleOwner=$("#vehicleOwner").val();
	if(vehicleOwner == "" || vehicleOwner == null || vehicleOwner == undefined){
 		$("#vehicleOwnerError").html("Please Enter Driver Name");
    	$("#vehicleOwner").focus();
	  	return false;
 	}else{
 		$("#vehicleOwnerError").html("");
 	}
	
	var typeWO=$("#warehouseorOutlet").val();
	
	var status=$("#vehicleStatus").val();
	if(status == "" || status == null || status == undefined){
 		$("#vehicleStatusError").html("Please Select Status");
    	$("#vehicleStatus").focus();
	  	return false;
 	}else{
 		$("#vehicleStatusError").html("");
 	}
	
	if(status == "true")
		status = "Active";
	else
		status = "InActive";
		
		var slNo=1;
	$('.slno').each(function(){
			$(this).text(slNo);
			slNo = parseInt(slNo) + 1;
		});
	
	 var len = parseInt($("#vehicleList tr").length);
		if (len != 1)
			len = parseInt($("#vehicleList tr:last").attr("id").replace('dynamicdiv', '')) + 1;
		
		 var row = "<tr id='dynamicdiv"+len+"'style='margin-top:5px;'>" +
		 "<td id='slno"+len+"' class='slno'>"+slNo+"</td>"+
		 
		 "<input type='hidden' id='dateofPurchase"+len+"' value='"+dateofPurchase+"'/>" +
		 "<input type='hidden' id='vehicleOwner"+len+"' value='"+vehicleOwner+"'/>" +
		 "<input type='hidden' id='typeWO"+len+"' value='"+typeWO+"'/>" +
		 
		 "<td id='vehicleNo"+len+"'>"+vehicleNo+"</td>" +	
		 "<td id='vehicleDescription"+len+"'>"+vehicleDescription+"</td>" +
		 "<td id='vehicleType"+len+"'>"+vehicleType+"</td>" +
		 "<td id='carryCapacity"+len+"'>"+carryCapacity+"</td>" +
		 "<td id='status"+len+"'>"+status+"</td>" +
		 "<td  id='Del"+len+"'><a id='Del"+len+"' style='color: #3c8dbc;text-decoration: underline;margin-left:3px;' onclick='deleteItem(this);' title='Delete'>Delete</a>"+
		"</td></tr>";
	 
	 $("#vehicleList tbody").append(row);
	
}
/*
function validateFleetMaster(operation){
debugger;
$("#Error").html("");
var online = window.navigator.onLine;
 	
  	if(!online)
  	{
  	alert("check your internet connection,please try agian after some time");
  	return;
  	}
 		var contextPath = $("#contextPath").val();
 		
 		var transporterId = $("#transporterId").val();
 		var phoneno=$("#phoneNo").val();
 		var transportername=$("#transporterName").val();
 		var gstno=$("#gstNo").val();
 		var emailid=$("#emailId").val();
 		var panNumber=$("#panNumber").val();
 		var plotno=$("#plotNo").val();
 		var streetName=$("#streetName").val();
 		var state=$("#state").val();
 		var location=$("#fleetLocation").val();
 		var city=$("#city").val();
 		var zipCode=$("#zipCode").val();
 		
 	
 		if(transporterId == "" || transporterId == null || transporterId == undefined){
 	 		$("#transporterIdError").html("Please enter Transporter ID");
 	    	$("#transporterId").focus();
 		  	return false;
 	 	}else{
 	 		$("#transporterIdError").html("");
 	 	}
 		
 		if(phoneno == "" || phoneno == null || phoneno == undefined){
 	 		$("#phoneNoError").html("Please enter Phone Number");
 	    	$("#phoneNo").focus();
 		  	return false;
 	 	}else if(phoneno.length !=10){
	    	$("#phoneNoError").html("enter 10 digits Phone No.");
	    	$("#phoneNo").focus();
			return false;
	    }else{
 	 		$("#phoneNoError").html("");
 	 	}
 		
 		if(plotno == "" || plotno == null || plotno == undefined){
 	 		$("#plotNoError").html("Please enter Plot Number");
 	    	$("#plotNo").focus();
 		  	return false;
 	 	}else{
 	 		$("#plotNoError").html("");
 	 	}
 		if(location == "" || location == null || location == undefined || location== "-- Select --"){
 	 		$("#locationError").html("Please select Location");
 	    	$("#fleetLocation").focus();
 		  	return false;
 	 	}else{
 	 		$("#locationError").html("");
 	 	}
 		if(transportername == "" || transportername == null || transportername == undefined){
 	 		$("#transporterNameError").html("Please enter transporter name");
 	    	$("#transporterName").focus();
 		  	return false;
 	 	}else{
 	 		$("#transporterNameError").html("");
 	 	}
 		if(emailid == "" || emailid == null || emailid == undefined){
 	 		$("#emailIdError").html("Please enter Email ID");
 	    	$("#emailId").focus();
 		  	return false;
 	 	}else{
 	 		$("#emailIdError").html("");
 	 	}
 		
 		if(!emailValidation(emailid)){
      		$("#emailIdError").html("Invalid EmailId (Ex:abc@gmail.com)");
      		$("#emailId").focus();
      		return false;
      	 }
 		
 		if(streetName == "" || streetName == null || streetName == undefined){
 	 		$("#streetNameError").html("Please enter street name");
 	    	$("#streetName").focus();
 		  	return false;
 	 	}else{
 	 		$("#streetNameError").html("");
 	 	}
 		if(city == "" || city == null || city == undefined){
 	 		$("#cityError").html("Please enter Phone Number");
 	    	$("#city").focus();
 		  	return false;
 	 	}else{
 	 		$("#cityError").html("");
 	 	}
 		
 		if(gstno == "" || gstno == null || gstno == undefined){
 	 		$("#gstNoError").html("Please enter GST Number");
 	    	$("#gstNo").focus();
 		  	return false;
 	 	}else{
 	 		$("#gstNoError").html("");
 	 	}
 		if(panNumber == "" || panNumber == null || panNumber == undefined){
 	 		$("#panNumberError").html("Please enter PAN Number");
 	    	$("#panNumber").focus();
 		  	return false;
 	 	}else{
 	 		$("#panNumberError").html("");
 	 	}
 		if(!ValidatePAN(panNumber)){
 			$("#Error").html("Please Check PAN Number.");
 			$("#panno").focus();
	    	return false;
 		}
 		
 		if(state == "" || state == null || state == undefined){
	    	$("#stateError").html("Please select state");
	    	$("#state").focus();
	    	return false;
	    }else{
 	 		$("#stateError").html("");
 	 	}
 		
 		if(zipCode == "" || zipCode == null || zipCode == undefined){
	    	$("#zipCodeError").html("Please select state");
	    	$("#zipCode").focus();
	    	return false;
	    }else{
 	 		$("#zipCodeError").html("");
 	 	}
 		
 		var finalobjfleetmaster = {};
 		finalobjfleetmaster.tranporterId=transporterId;
 		finalobjfleetmaster.transporterName=transportername;
 		finalobjfleetmaster.gstId=gstno;
 		finalobjfleetmaster.phoneNo=phoneno;
 		finalobjfleetmaster.userName=emailid;
 		finalobjfleetmaster.panId=panNumber;
 		finalobjfleetmaster.buldingHouseNo=plotno;
 		finalobjfleetmaster.roadName=streetName;
 		finalobjfleetmaster.state=state;
 		finalobjfleetmaster.location=location;
 		finalobjfleetmaster.city=city;
 		finalobjfleetmaster.pinCode=zipCode;
 		
 		if(operation == "new"){
  			finalobjfleetmaster.status=true; 
  		 }
 		
 		var len = $("#vehicleList tr").length-1;
  		var items=[];
  		 for(var i=1;i<=len;i++){
  				var idAttr = $("#vehicleList tr:eq("+i+") td:last").attr("id");
  				idAttr = idAttr.replace('Del','');
  				
  				if(len < 3){
  					alert("Please Add Vehicle Details");
  					return;
  				}
  				var statusofVH = $("#status"+idAttr).text();
  				
  				if(statusofVH == "Active")
  					statusofVH ="true";
  				else
  					statusofVH ="false";
  				
  				var obj = {vehicleNo:$("#vehicleNo"+idAttr).text(),vehicledescription:$("#vehicleDescription"+idAttr).text(),vehicleType:$("#vehicleType"+idAttr).text(),vehicleCapacity:$("#carryCapacity"+idAttr).text(),vehicleStatus:statusofVH,driverName:$("#vehicleOwner"+idAttr).val(),mfgDateStr:$("#dateofPurchase"+idAttr).val(),
  						priceRate:$("#pricerate"+idAttr).val(),
  						tansporterId:$("#tansporterIdofVH"+idAttr).val()
  						
  							};
  				items.push(obj);
  				
  		 }
  		 
  		 
  		 if(operation == "edit"){
  			 
  			finalobjfleetmaster.roleName=$("#roleName").val();
  			finalobjfleetmaster.status=$("#statusoffleet").val();
  			
  		 }
  		 
  		finalobjfleetmaster.fleetDetails = items;
	  	 var formData = JSON.stringify(finalobjfleetmaster);
	    console.log(formData)
	  if(operation == "new"){
		URL = contextPath + "/genericMaster/createfleetmaster.do"; 
	  }else if(operation == "edit"){
		URL = contextPath + "/genericMaster/updateFleetMaster.do"; 
	  }
		$.ajax({
			type: "POST",
			url : URL,
			data :{
				beanval : formData,
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
*/

function validateFleetMaster(operation){
	debugger;
	$("#Error").html("");
	var online = window.navigator.onLine;
	 	
	  	if(!online)
	  	{
	  	alert("check your internet connection,please try agian after some time");
	  	return;
	  	}
	 		var contextPath = $("#contextPath").val();
	 		
	 		var transporterId = $("#transporterId").val();
	 		var phoneno=$("#phoneNo").val();
	 		var transportername=$("#transporterName").val();
	 		var gstno=$("#gstNo").val();
	 		var emailid=$("#emailId").val();
	 		var panNumber=$("#panNumber").val();
	 		var plotno=$("#plotNo").val();
	 		var streetName=$("#streetName").val();
	 		var state=$("#state").val();
	 		var location=$("#fleetLocation").val();
	 		var city=$("#city").val();
	 		var zipCode=$("#zipCode").val();
	 		
	 	
	 		/*if(transporterId == "" || transporterId == null || transporterId == undefined){
	 	 		$("#transporterIdError").html("Please enter Transporter ID");
	 	    	$("#transporterId").focus();
	 		  	return false;
	 	 	}else{
	 	 		$("#transporterIdError").html("");
	 	 	}*/
	 		
	 		if($("#transporterId").val().trim() == ""){
			$("#transporterIdError").html("Please enter Transporter ID");
			focusDiv('transporterId');
			$("#transporterId").focus();
			return;
		}
		else if($("#transporterId").val().length>20){
			$("#transporterIdError").html("Transport ID can't exceeds 20 digits");
			$("#transporterId").focus();
			return false;
		}else{
			$("#transporterIdError").html("");
		}
	 		
	 		
	 		if(phoneno == "" || phoneno == null || phoneno == undefined){
	 	 		$("#phoneNoError").html("Please enter Phone Number");
	 	    	$("#phoneNo").focus();
	 		  	return false;
	 	 	}else if(phoneno.length !=10){
		    	$("#phoneNoError").html("enter 10 digits Phone No.");
		    	$("#phoneNo").focus();
				return false;
		    }else{
	 	 		$("#phoneNoError").html("");
	 	 	}
	 		
	 		
	 		/*if(plotno == "" || plotno == null || plotno == undefined){
	 	 		$("#plotNoError").html("Please enter Plot Number");
	 	    	$("#plotNo").focus();
	 		  	return false;
	 	 	}else{
	 	 		$("#plotNoError").html("");
	 	 	}*/
	 	 	
	 	 	
	 		if($("#plotNo").val().trim() == ""){
			$("#plotNoError").html("Please enter Plot Number");
			focusDiv('plotNo');
			$("#plotNo").focus();
			return;
		}
		else if($("#plotNo").val().length>15){
			$("#plotNoError").html("plot no can't exceeds 15 characters");
			$("#plotNo").focus();
			return false;
		}else{
			$("#plotNoError").html("");
		}
	 	 	
	 	 	
	 		if(location == "" || location == null || location == undefined || location== "-- Select --"){
	 	 		$("#locationError").html("Please select Location");
	 	    	$("#fleetLocation").focus();
	 		  	return false;
	 	 	}else if($("#fleetLocation").val().length>100){
			$("#locationError").html("Location can't exceeds 100 characters");
			$("#fleetLocation").focus();
			return false;
		}else{
	 	 		$("#locationError").html("");
	 	 	}
	 	 	
	 	 	
	 	 	
	 		/*if(transportername == "" || transportername == null || transportername == undefined){
	 	 		$("#transporterNameError").html("Please enter transporter name");
	 	    	$("#transporterName").focus();
	 		  	return false;
	 	 	}else{
	 	 		$("#transporterNameError").html("");
	 	 	}*/
	 	 	
	 	 	if($("#transporterName").val().trim() == ""){
			$("#transporterNameError").html("Please enter transporter name");
			focusDiv('transporterName');
			$("#transporterName").focus();
			return;
		}
		else if($("#transporterName").val().length>150){
			$("#transporterNameError").html("Transport name can't exceed 150 characters");
			$("#transporterName").focus();
			return false;
		}else{
			$("#transporterNameError").html("");
		}
	 	 	
	 	 	
	 		if(emailid == "" || emailid == null || emailid == undefined){
	 	 		$("#emailIdError").html("Please enter Email ID");
	 	    	$("#emailId").focus();
	 		  	return false;
	 	 	}else{
	 	 		$("#emailIdError").html("");
	 	 	}
	 		
	 		
	 		
	 		
	 		if(!emailValidation(emailid)){
	      		$("#emailIdError").html("Invalid EmailId (Ex:abc@gmail.com)");
	      		$("#emailId").focus();
	      		return false;
	      	 }
	 		
	 		/*if(streetName == "" || streetName == null || streetName == undefined){
	 	 		$("#streetNameError").html("Please enter street name");
	 	    	$("#streetName").focus();
	 		  	return false;
	 	 	}else{
	 	 		$("#streetNameError").html("");
	 	 	}*/
	 	 	
	 	 	if($("#streetName").val().trim() == ""){
			$("#streetNameError").html("Please enter street name");
			focusDiv('streetName');
			$("#streetName").focus();
			return;
		}
		else if($("#streetName").val().length>100){
			$("#streetNameError").html("Street Name can't exceed 100 characters");
			$("#streetName").focus();
			return false;
		}else{
			$("#streetNameError").html("");
		}
	 	 	
	 		/*if(city == "" || city == null || city == undefined){
	 	 		$("#cityError").html("Please enter Phone Number");
	 	    	$("#city").focus();
	 		  	return false;
	 	 	}else{
	 	 		$("#cityError").html("");
	 	 	}*/
	 		
	 		if($("#city").val().trim() == ""){
			$("#cityError").html("Please enter City Name");
			focusDiv('city');
			$("#city").focus();
			return;
		}
		else if($("#city").val().length>50){
			$("#cityError").html("City Name can't exceed 50 characters");
			$("#city").focus();
			return false;
		}else{
			$("#cityError").html("");
		}
	 		
	 		
	 		/*if(gstno == "" || gstno == null || gstno == undefined){
	 	 		$("#gstNoError").html("Please enter GST Number");
	 	    	$("#gstNo").focus();
	 		  	return false;
	 	 	}else{
	 	 		$("#gstNoError").html("");
	 	 	}*/
	 	 	
	 	 	if($("#gstNo").val().trim() == ""){
			$("#gstNoError").html("Please enter GST Number");
			focusDiv('gstNo');
			$("#gstNo").focus();
			return;
		}
		else if($("#gstNo").val().length>12){
			$("#gstNoError").html("GST Number can't exceeds 12 characters");
			$("#gstNo").focus();
			return false;
		}else{
			$("#gstNoError").html("");
		}
	 	 	
	 		/*if(panNumber == "" || panNumber == null || panNumber == undefined){
	 	 		$("#panNumberError").html("Please enter PAN Number");
	 	    	$("#panNumber").focus();
	 		  	return false;
	 	 	}else{
	 	 		$("#panNumberError").html("");
	 	 	}*/
	 	 	
	 	 	if($("#panNumber").val().trim() == ""){
			$("#panNumberError").html("Please enter PAN Number");
			focusDiv('panNumber');
			$("#panNumber").focus();
			return;
		}
		else if($("#panNumber").val().length>12){
			$("#panNumberError").html("PAN Number can't exceeds 12 characters");
			$("#panNumber").focus();
			return false;
		}else{
			$("#panNumberError").html("");
		}
	 	 	
	 		/*if(!ValidatePAN(panNumber)){
	 			$("#Error").html("Please Check PAN Number.");
	 			$("#panno").focus();
		    	return false;
	 		}*/
	 		
	 		if(state == "" || state == null || state == undefined){
		    	$("#stateError").html("Please select state");
		    	$("#state").focus();
		    	focusDiv('state');
		    	return false;
		    }else{
	 	 		$("#stateError").html("");
	 	 	}
	 	 	
	 	 	
	 		
	 		/*if(zipCode == "" || zipCode == null || zipCode == undefined){
		    	$("#zipCodeError").html("Please select state");
		    	$("#zipCode").focus();
		    	return false;
		    }else{
	 	 		$("#zipCodeError").html("");
	 	 	}*/
	 	 	
	 	 	
	 	 	if($("#zipCode").val().trim() == ""){
			$("#zipCodeError").html("Please select ZIP CODE");
			focusDiv('zipCode');
			$("#zipCode").focus();
			return;
		}
		else if($("#zipCode").val().length>10){
			$("#zipCodeError").html("ZIP CODE can't exceeds 10 characters");
			$("#zipCode").focus();
			return false;
		}else{
			$("#zipCodeError").html("");
		}
	 	 	
	 	 	if($("#vehicleNo").val().length>10){
	 	 		$("#vehicleNo").focus();
				$("#vehicleNoError").html("Vehicle No can't exceeds 10 characters");
				return false;
		}else{
				$("#vehicleNoError").html("");
			}
	 	
	 	if($("#vehicleType").val().length>50){
 	 		$("#vehicleType").focus();
			$("#vehicleTypeError").html("Vehicle Type can't exceeds 50 characters");
			return false;
	}else{
			$("#vehicleTypeError").html("");
		}
	 	
	 	if($("#vehicleDesc").val().length>150){
 	 		$("#vehicleDesc").focus();
			$("#vehicleDescError").html("Vehicle description can't exceeds 150 characters");
			return false;
	    }else{
			$("#vehicleDescError").html("");
		}
	 	
	 	if($("#carryCapacity").val().length>11){
 	 		$("#carryCapacity").focus();
			$("#carryCapacityError").html("Carry Capacity can't exceeds 11 digits");
			return false;
	    }else{
			$("#carryCapacityError").html("");
		}
	 	
	 	if($("#vehicleOwner").val().length>50){
 	 		$("#vehicleOwner").focus();
			$("#vehicleOwnerError").html("Vehicle Owner can't exceeds 50 characters");
			return false;
	    }else{
			$("#vehicleOwnerError").html("");
		}
	 		
	 		var finalobjfleetmaster = {};
	 		finalobjfleetmaster.tranporterId=transporterId;
	 		finalobjfleetmaster.transporterName=transportername;
	 		finalobjfleetmaster.gstId=gstno;
	 		finalobjfleetmaster.phoneNo=phoneno;
	 		finalobjfleetmaster.userName=emailid;
	 		finalobjfleetmaster.panId=panNumber;
	 		finalobjfleetmaster.buldingHouseNo=plotno;
	 		finalobjfleetmaster.roadName=streetName;
	 		finalobjfleetmaster.state=state;
	 		finalobjfleetmaster.location=location;
	 		finalobjfleetmaster.city=city;
	 		finalobjfleetmaster.pinCode=zipCode;
	 		
	 		if(operation == "new"){
	  			finalobjfleetmaster.status=true; 
	  		 }
	 		
	 		var len = $("#vehicleList tr").length-1;
	  		var items=[];
	  		 for(var i=1;i<=len;i++){
	  				var idAttr = $("#vehicleList tr:eq("+i+") td:last").attr("id");
	  				idAttr = idAttr.replace('Del','');
	  				
	  				/*if(len < 3){
	  					alert("Please Add Vehicle Details");
	  					return;
	  				}*/
	  				var statusofVH = $("#status"+idAttr).text();
	  				
	  				if(statusofVH == "Active")
	  					statusofVH ="true";
	  				else
	  					statusofVH ="false";
	  				
	  				var obj = {vehicleNo:$("#vehicleNo"+idAttr).text(),vehicledescription:$("#vehicleDescription"+idAttr).text(),vehicleType:$("#vehicleType"+idAttr).text(),vehicleCapacity:$("#carryCapacity"+idAttr).text(),vehicleStatus:statusofVH,driverName:$("#vehicleOwner"+idAttr).val(),mfgDateStr:$("#dateofPurchase"+idAttr).val(),
	  						priceRate:$("#pricerate"+idAttr).val(),
	  						tansporterId:$("#tansporterIdofVH"+idAttr).val()
	  						
	  							};
	  				items.push(obj);
	  				
	  		 }
	  		 
	  		 
	  		 if(operation == "edit"){
	  			 
	  			finalobjfleetmaster.roleName=$("#roleName").val();
	  			finalobjfleetmaster.status=$("#statusoffleet").val();
	  			
	  		 }
	  		 
	  		finalobjfleetmaster.fleetDetails = items;
		  	 var formData = JSON.stringify(finalobjfleetmaster);
		    console.log(formData)
		  if(operation == "new"){
			URL = contextPath + "/genericMaster/createfleetmaster.do"; 
		  }else if(operation == "edit"){
			URL = contextPath + "/genericMaster/updateFleetMaster.do"; 
		  }
			$.ajax({
				type: "POST",
				url : URL,
				data :{
					beanval : formData,
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



function emailValidation(emailid) {
	emailid = emailid.trim();
	var mailformat = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
	if(!mailformat.test(emailid)){
		return false;
	} else
		return true;
}



function selectAll(source){	
	 
		checkboxes = document.getElementsByName('selectall');		
		  /*
		 * for each( var checkbox in checkboxes) { checkbox.checked =
		 * source.checked; }
		 */
		
		for ( var i = 0; i < checkboxes.length; i++) {
		
			 checkboxes[i].checked= source.checked;	
		}
		
 }

/*function ValidatePAN() {
	 $("#Error").html("");
   var txtPANCard = document.getElementById("panno");
   var regex = /([A-Z]){5}([0-9]){4}([A-Z]){1}$/;
   if (regex.test(txtPANCard.value.toUpperCase())) {
       return true;
   } else {
   	 $("#Error").html("Please Check PAN Number.");
       return false;
   }
}
*/


function viewFleetMasterDetails(fleetId,operation){
	debugger;
	$('#Success').html("");
	try{
 	 var contextPath = $("#contextPath").val();
 	 
 	// purpose:for checking internet conection
 	var online = window.navigator.onLine;
   	if(!online){
   	alert("Check your internet connection,Please try agian after some time.");
   	return;
   	}
 	 
 	 URL = contextPath + "/genericMaster/editFleetMasterDetails.do";
		$.ajax({
			type: "GET",
			url : URL,
			data : {
				fleetId : fleetId,
				operation : operation,
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


function resetFormFleet(){
	 debugger
	$("#vehicleNo").val("");
	$("#vehicleDesc").val("");
	$("#dateofPurchase").val("");
	$("#warehouseorOutlet").val("");
	$("#vehicleType").val("");
	$("#carryCapacity").val("");
	$("#vehicleOwner").val("");
	$("#vehicleStatus").val("");
	
	$("#warehouseZone").val("");
	$("#warehouseLocation").val("");
	/*$("#status").val("");*/
	$("#from").val("");
	$("#to").val("");
	$("#searchFleets").val("");
}

