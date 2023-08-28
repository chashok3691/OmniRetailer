function viewCounterMaster(id,index){
	
	 //purpose:for checking internet conection
	var online = window.navigator.onLine;
  	if(!online){
  	alert("check your internet connection,please try agian after some time");
  	return;
  	}
	
	if($("#searchCounterMaster").length > 0 && $("#searchCounterMaster").val().trim() != ""){
		searchCounterMaster($("#searchCounterMaster").val(), 'searchCounterMaster',index);
		return;
	}
	var location = "";
	if($("#counterLocation").length > 0 && $("#counterLocation").val()!= "" && $("#counterLocation").val()!= "-- Select --")
		location = $("#counterLocation").val();
		var contextPath = $("#contextPath").val();
		
		var searchName=""
   		 if($("#searchCounterMaster").length>0)
   			 searchName = $("#searchCounterMaster").val().trim();
		
		//added maxrecords as param by manasa
		
		
		var maxRecords = 10;
  	  if($("#maxRecords").length>0)
  		  maxRecords = $("#maxRecords").val();
	    URL = contextPath + "/admin/viewCounters.do";
 		$.ajax({
 			type: "GET",
 			url : URL,
 			data : {
 				index : index,
 				maxRecords : maxRecords,
 				location : location,
 				searchName : searchName
 			},
 			beforeSend: function(xhr){                    
   	   			$("#loading").css("display","block");
   	   			$("#mainDiv").addClass("disabled");
   	   		  },
 			success : function(result) {
 				 if(id != undefined && id != "")
                 	activeMenu(id);
                 openMenu("storedetails", "ulstoredetails",0);
 				$("#right-side").html(result);
 				$("#loading").css("display","none");
 				$("#mainDiv").removeClass('disabled');
 			},
 			error : function(jqXhr) {
 				errorCode(jqXhr.status)
 				// alert("something went wrong");
 				$("#loading").css("display","none");
 				$("#mainDiv").removeClass('disabled');
 			}
 		});
	}






function searchCounterMaster(name,searchCategory,index){
	 //purpose:for checking internet conection
	var online = window.navigator.onLine;
  	if(!online){
  	alert("check your internet connection,please try agian after some time");
  	return;
  	}
	debugger
	var location = "";
	if($("#counterLocation").length > 0 && $("#counterLocation").val()!= "select" && $("#counterLocation").val()!= "-- Select --")
		location = $("#counterLocation").val();
	 var contextPath = $("#contextPath").val();
	 
	 name=""
   		 if($("#searchCounterMaster").length>0)
   			name = $("#searchCounterMaster").val().trim();
	 
//added maxrecords   by manasa
	 var maxRecords = 10;
	 	if($("#maxRecords").length>0)
	 	     maxRecords = $("#maxRecords").val();
	 	    	  
	 	    	  
	 	   //written by manasa
	    	 var allLocationsList = [];
	    	 var length = $('#counterLocation').children('option').length;
	    	 console.log(length)
	    	 	$('#counterLocation option').each(function() { 
	    	 		allLocationsList.push( $(this).attr('value'));
	    		    	});
	    		 console.log(allLocationsList)
	    		 var  locationList="";
	    			for(i=1;i<allLocationsList.length;i++)
	    			   	{
	    			     locationList =locationList+ allLocationsList[i]+',';
	    			     }
	    			      //	locationList = locationList.slice(0,-1);//remove last comma
	    	console.log(locationList)
	 	    	  
	 URL = contextPath + "/inventorymanager/searchCounterMaster.do";
	 $.ajax({
			type: "GET",
			url : URL,
			data : {
				searchName : name,
				index : index,
				maxRecords : maxRecords,
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





function viewNewCounter(id){
	 //purpose:for checking internet conection
	var online = window.navigator.onLine;
  	if(!online){
  	alert("check your internet connection,please try agian after some time");
  	return;
  	}
	
  	var location = "";
	if($("#counterLocation").length > 0)
		location = $("#counterLocation").val();
  	
	 var contextPath = $("#contextPath").val();
	 URL = contextPath + "/admin/newCounter.do";
		$.ajax({
			type: "GET",
			url : URL,
			data : {
				location : location
			},
			beforeSend: function(xhr){                    
	   			$("#loading").css("display","block");
	   			$("#mainDiv").addClass("disabled");
	   		  },
			success : function(result) {
				$("#right-side").html(result);
				 if(id != undefined && id != "")
                 	activeMenu(id);
                 openMenu("storedetails", "ulstoredetails",0);
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
/*function saveCounter(){
	debugger;
	 //purpose:for checking internet conection
	var online = window.navigator.onLine;
  	if(!online){
  	alert("check your internet connection,please try agian after some time");
  	return;
  	}
	
	var name = $("#counterName").val();
	var location = $("#location").val();
	var counter = $("#counterDeviceId").val();
	var type = $("#counterType").val();
	var remarks = $("#counterRemarks").val();
	var deviceType = $("#counterDeviceType").val();
	var counterUserId = $("#counterUserId").val();
	var printingType = $("#printingType").val();
	var  menu= $("#menu").val();
	var quickBillFlag = $("#quickBill").val();
	
	var quickbill = false;
	//alert("name : " + name +" location : "+ location +" counter : "+counter +" type : "+ type);
	if(quickBillFlag == "true"){
		quickbill =true;
	}
	var counterCategory =  $("#counterCategory").val();
	var b2bCounter = false;
	if(counterCategory == "B2B"){
		b2bCounter =true;
	}
	
	
	//alert("name : " + name +" location : "+ location +" counter : "+counter +" type : "+ type);
	
	if(name == null || name == "" || name == undefined){
		$("#Error").html("Please Enter Counter Name");
		return;
	}
	if(location == null || location == "" || location == undefined){
		$("#Error").html("Please Select One Location");
		return;
	}
	if(counter == null || counter == "" || counter == undefined){
		$("#Error").html("Please Select One Counter Device");
		return;
	}
	if(type == null || type == "" || type == undefined){
		$("#Error").html("Please Select One Counter Type");
		return;
	}
	 var formData={};
formData.quickBill = quickbill;
formData.counterName =name;
formData.deviceId = counter;
formData.counterType =type;
formData.storeLocation = location;
formData.remarks =remarks;
formData.printingType = deviceType;
formData.deviceType = deviceType;
formData.menu = menu;
formData.b2bCounter = b2bCounter;
formData.counterUserId =counterUserId;
var taxCodeQuick = $("#taxCodeQuick").val();

formData.taxCode=taxCodeQuick;



 var nformData = JSON.stringify(formData);
	
	 var contextPath = $("#contextPath").val();
	 URL = contextPath + "/admin/createCounter.do";
		$.ajax({
			type: "POST",
			url : URL,
			data : {
									nformData : nformData,
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

}*/


function saveCounter(){
	debugger;
	 //purpose:for checking internet conection
	var online = window.navigator.onLine;
  	if(!online){
  	alert("check your internet connection,please try agian after some time");
  	return;
  	}
	
	var name = $("#counterName").val();
	var location = $("#location").val();
	var counter = $("#counterDeviceId").val();
	var type = $("#counterType").val();
	var remarks = $("#counterRemarks").val();
	var deviceType = $("#counterDeviceType").val();
	var counterUserId = $("#counterUserId").val();
	var printingType = $("#printingType").val();
	var  menu= $("#menu").val();
	var quickBillFlag = $("#quickBill").val();
	var paymentDevicePort = $("#paymentDevicePort").val();
	var paymentDeviceUsername = $("#paymentDeviceUsername").val();
	var paymentDevicePin = $("#paymentDevicePin").val();
	
	
	var quickbill = false;
	//alert("name : " + name +" location : "+ location +" counter : "+counter +" type : "+ type);
	if(quickBillFlag == "true"){
		quickbill =true;
	}
	var counterCategory =  $("#counterCategory").val();
	var b2bCounter = false;
	if(counterCategory == "B2B"){
		b2bCounter =true;
	}
	
	
	//alert("name : " + name +" location : "+ location +" counter : "+counter +" type : "+ type);
	
	if(name == null || name == "" || name == undefined){
		$("#Error").html("Please Enter Counter Name");
		focusDiv('counterName');
		$("#counterName").focus();
		return;
	}
	
	else if($("#counterName").val().length>250){
		$("#Error").html("Counter Name cannot me more than 250 characters");
		$("#counterName").focus();
		return false;
	}else{
		$("#Error").html("");
	}	
	
	
	if(location == null || location == "" || location == undefined){
		$("#Error").html("Please Select One Location");
		focusDiv('location');
		$("#location").focus();
		return;
	}
	if(counter == null || counter == "" || counter == undefined){
		$("#Error").html("Please Select One Counter Device");
		focusDiv('counterDeviceId');
		$("#counterDeviceId").focus();
		return;
	}
	if(type == null || type == "" || type == undefined){
		$("#Error").html("Please Select One Counter Type");
		focusDiv('counterType');
		$("#counterType").focus();
		return;
	}
	if(paymentDeviceUsername.length > 25){
		$("#Error").html("Payment device username should not exceed 25 characters");
		//focusDiv('counterName');
		$("#paymentDeviceUsername").focus();
		return;
	}
	if(paymentDevicePin.length > 15){
		$("#Error").html("Payment device pin should not exceed 15 characters");
		//focusDiv('counterName');
		$("#paymentDevicePin").focus();
		return;
	}
	if(paymentDevicePort.length > 10){
		$("#Error").html("Payment device port should not exceed 10 characters");
		//focusDiv('counterName');
		$("#paymentDevicePort").focus();
		return;
	}
	
	if(parseInt($("#counterRemarks").val().length)>250){
		 $("#counterRemarks").focus();
		 $("#counterRemarksError").html("Counter Remarks can't exceeds 250 Character");
		 return;
	} else{
	$("#counterRemarksError").html("");
}
	
	 var formData={};
formData.quickBill = quickbill;
formData.counterName =name;
formData.deviceId = counter;
formData.counterType =type;
formData.storeLocation = location;
formData.remarks =remarks;
formData.printingType = printingType;
formData.deviceType = deviceType;
formData.menu = menu;
formData.b2bCounter = b2bCounter;
formData.counterUserId =counterUserId;
formData.paymentDeviceUsername=paymentDeviceUsername;
formData.paymentDevicePin=paymentDevicePin;
formData.paymentDevicePort=paymentDevicePort;
var taxCodeQuick = $("#taxCodeQuick").val();

formData.taxCode=taxCodeQuick;
 var nformData = JSON.stringify(formData);
	
	 var contextPath = $("#contextPath").val();
	 URL = contextPath + "/admin/createCounter.do";
		$.ajax({
			type: "POST",
			url : URL,
			data : {
			nformData : nformData
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


function viewEditCounter(counterId,location,purpose){
	
	 //purpose:for checking internet conection
	var online = window.navigator.onLine;
  	if(!online){
  	alert("check your internet connection,please try agian after some time");
  	return;
  	}
		var contextPath = $("#contextPath").val();
		
		// added location  by manasa
		 var outletlocation=$("#counterLocation").val();
		 
		 var searchName=""
	   		 if($("#searchCounterMaster").length>0)
	   			 searchName = $("#searchCounterMaster").val();
		 
		 var maxRecords = 10;
	  	  if($("#maxRecords").length>0)
	  		  maxRecords = $("#maxRecords").val();
		 
		 URL = contextPath + "/admin/getCounterDetails.do";
			$.ajax({
				type: "POST",
				url : URL,
				data : {
					counterId : counterId,
					purpose : purpose,
					location : location,
					outletlocation : outletlocation,
					searchName : searchName,
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
				error : function(jqXhr) {
					// alert("something went wrong");
					errorCode(jqXhr.status)
					$("#loading").css("display","none");
				$("#mainDiv").removeClass('disabled');
				}
			});
	}
/*function updateCounter(){
	debugger;
	 //purpose:for checking internet conection
	var online = window.navigator.onLine;
  	if(!online){
  	alert("check your internet connection,please try agian after some time");
  	return;
  	}
	
	var name = $("#counterName").val();
	var location = $("#location").val();
	var counter = $("#counterDeviceId").val();
	var counterType = $("#counterType").val();
	var remarks = $("#counterRemarks").val();
	var counterId = $("#counterIdSpan").html();
	var deviceType = $("#counterDeviceType").val();
	var counterUserId = $("#counterUserId").val();	
	var printingType = $("#printingType").val();
	var  menu= $("#menu").val();
	var quickBillFlag = $("#quickBill").val();
	//alert("name : " + name +" location : "+ location +" counter : "+counter +" type : "+ type);
	if(quickBillFlag == "true"){
		quickBillFlag =true;
	}
	
	
	var counterCategory =  $("#counterCategory").val();
	var b2bCounter = false;
	if(counterCategory == "B2B"){
		b2bCounter =true;
	}
	
	
	var searchnName=""
   		 if($("#searchCounterMaster").length>0)
   			searchName = $("#searchCounterMaster").val().trim();
	
	if(name == null || name == "" || name == undefined){
		$("#Error").html("Please Enter Counter Name");
		focusDiv("Error");
		return;
	}
	if(location == null || location == "" || location == undefined){
		$("#Error").html("Please Select One Location");
		focusDiv("Error");
		return;
	}
	if(counter == null || counter == "" || counter == undefined){
		$("#Error").html("Please Select One Counter Device");
		focusDiv("Error");
		return;
	}
	if(counterType == null || counterType == "" || counterType == undefined){
		$("#Error").html("Please Select One Counter Type");
		focusDiv("Error");
		return;
	}
	if(counterId == null || counterId == "" || counterId == undefined){
		$("#Error").html("Counterid is Required");
		focusDiv("Error");
		return;
	}
	
	
	
	var finalObj = {};
	finalObj.counterId = counterId;
	finalObj.counterName = name;
	finalObj.deviceId = counter;
	finalObj.counterType = counterType;
	finalObj.storeLocation = location;
	finalObj.remarks = remarks;
	finalObj.deviceType = deviceType;
	finalObj.counterUserId = counterUserId;
	finalObj.printingType = printingType;
	finalObj.b2bCounter = b2bCounter;
	finalObj.quickBill = quickBillFlag;
	
	
	var taxCodeQuick1 = $("#taxCodeQuick1").val();

    finalObj.taxCode=taxCodeQuick1;
	
	finalObj.menu= $("#menu").val();
	var maxRecords = 10;
	   if($("#maxRecords").length > 0)
	     maxRecords = $("#maxRecords").val();
	   finalObj.maxRecords = maxRecords;
	   
	   var outletlocation=""
		   if($("#counterLocation").length > 0) 
			   outletlocation = $("#counterLocation").val();
	   
	   
	var formData = JSON.stringify(finalObj);
	 var contextPath = $("#contextPath").val();
	 URL = contextPath + "/admin/updateCounter.do";
		$.ajax({
			type: "POST",
			url : URL,
			contentType : "application/json",
			data : formData,
			data : {
				counterId : counterId,
				counterName : name,
				deviceId : counter,
				counterType : counterType,
				storeLocation : location,
				remarks : remarks,
				deviceType : deviceType
			},
			beforeSend: function(xhr){                    
	   			$("#loading").css("display","block");
	   			$("#mainDiv").addClass("disabled");
	   		  },
			success : function(result) {
				debugger
				$("#right-side").html(result);
			    $("#searchCounterMaster").val(searchName);
			    $("#counterLocation").val(outletlocation);
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

function updateCounter(){
	debugger;
	 //purpose:for checking internet conection
	var online = window.navigator.onLine;
  	if(!online){
  	alert("check your internet connection,please try agian after some time");
  	return;
  	}
	
	var name = $("#counterName").val();
	var location = $("#location").val();
	var counter = $("#counterDeviceId").val();
	var counterType = $("#counterType").val();
	var remarks = $("#counterRemarks").val();
	var counterId = $("#counterIdSpan").html();
	var deviceType = $("#counterDeviceType").val();
	var counterUserId = $("#counterUserId").val();	
	var printingType = $("#printingType").val();
	var  menu= $("#menu").val();
	var  createdOnStr= $("#createdOnStr").val();
	
	var quickBillFlag = $("#quickBill").val();
	var paymentDevicePort = $("#paymentDevicePort").val();
	var paymentDeviceUsername = $("#paymentDeviceUsername").val();
	var paymentDevicePin = $("#paymentDevicePin").val();
	//alert("name : " + name +" location : "+ location +" counter : "+counter +" type : "+ type);
	if(quickBillFlag == "true"){
		quickBillFlag =true;
	}
	
	
	var counterCategory =  $("#counterCategory").val();
	var b2bCounter = false;
	if(counterCategory == "B2B"){
		b2bCounter =true;
	}
	
	
	var searchnName=""
   		 if($("#searchCounterMaster").length>0)
   			searchName = $("#searchCounterMaster").val().trim();
	
	
	
	if(name == null || name == "" || name == undefined){
		$("#Error").html("Please Enter Counter Name");
		focusDiv('counterName');
		$("#counterName").focus();
		return;
	}
	
	else if($("#counterName").val().length>250){
		$("#Error").html("Counter Name cannot me more than 250 characters");
		$("#counterName").focus();
		return false;
	}else{
		$("#Error").html("");
	}	
	
	
	if(location == null || location == "" || location == undefined){
		$("#Error").html("Please Select One Location");
		focusDiv("Error");
		return;
	}
	if(counter == null || counter == "" || counter == undefined){
		$("#Error").html("Please Select One Counter Device");
		focusDiv('counterName');
		$("#counterName").focus();
		focusDiv("Error");
		return;
	}
	
	else if($("#counterName").val().length>250){
		$("#Error").html("Counter Name cannot me more than 250 characters");
		$("#counterName").focus();
		return false;
	}else{
		$("#Error").html("");
	}
	
	if(counterType == null || counterType == "" || counterType == undefined){
		$("#Error").html("Please Select One Counter Type");
		focusDiv("Error");
		return;
	}
	if(counterId == null || counterId == "" || counterId == undefined){
		$("#Error").html("Counterid is Required");
		focusDiv("Error");
		return;
	}
	
	if(paymentDeviceUsername.length > 25){
		$("#Error").html("Payment device username should not exceed 25 characters");
		//focusDiv('counterName');
		$("#paymentDeviceUsername").focus();
		return;
	}
	if(paymentDevicePin.length > 15){
		$("#Error").html("Payment device pin should not exceed 15 characters");
		//focusDiv('counterName');
		$("#paymentDevicePin").focus();
		return;
	}
	if(paymentDevicePort.length > 10){
		$("#Error").html("Payment device port should not exceed 10 characters");
		//focusDiv('counterName');
		$("#paymentDevicePort").focus();
		return;
	}
	
	if($("#counterRemarks").val().length>250){
		$("#counterRemarks").focus();
		$("#counterRemarksError").html("Counter Ranks can't exceeds 250 Character");
		
		return false;
	}else{
		$("#counterRemarksError").html("");
	}
	
	var finalObj = {};
	finalObj.counterId = counterId;
	finalObj.counterName = name;
	finalObj.deviceId = counter;
	finalObj.counterType = counterType;
	finalObj.storeLocation = location;
	finalObj.remarks = remarks;
	finalObj.deviceType = deviceType;
	finalObj.counterUserId = counterUserId;
	finalObj.printingType = printingType;
	finalObj.b2bCounter = b2bCounter;
	finalObj.quickBill = quickBillFlag;
	finalObj.createdOnStr = createdOnStr;
	finalObj.paymentDeviceUsername=paymentDeviceUsername;
	finalObj.paymentDevicePin=paymentDevicePin;
	finalObj.paymentDevicePort=paymentDevicePort;
	
	var taxCodeQuick1 = $("#taxCodeQuick1").val();

    finalObj.taxCode=taxCodeQuick1;
	
	finalObj.menu= $("#menu").val();
	var maxRecords = 10;
	   if($("#maxRecords").length > 0)
	     maxRecords = $("#maxRecords").val();
	   finalObj.maxRecords = maxRecords;
	   
	   var outletlocation=""
		   if($("#counterLocation").length > 0) 
			   outletlocation = $("#counterLocation").val();
	   
	   
	var formData = JSON.stringify(finalObj);
	 var contextPath = $("#contextPath").val();
	 URL = contextPath + "/admin/updateCounter.do";
		$.ajax({
			type: "POST",
			url : URL,
			contentType : "application/json",
			data : formData,
			/*data : {
				counterId : counterId,
				counterName : name,
				deviceId : counter,
				counterType : counterType,
				storeLocation : location,
				remarks : remarks,
				deviceType : deviceType
			},*/
			beforeSend: function(xhr){                    
	   			$("#loading").css("display","block");
	   			$("#mainDiv").addClass("disabled");
	   		  },
			success : function(result) {
				debugger
				$("#right-side").html(result);
			    $("#searchCounterMaster").val(searchName);
			    $("#counterLocation").val(outletlocation);
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

function viewWhCounterMaster(id,index){
	debugger
	 //purpose:for checking internet conection
	var online = window.navigator.onLine;
  	if(!online){
  	alert("check your internet connection,please try agian after some time");
  	return;
  	}
	if($("#searchCounterMaster").length > 0 && $("#searchCounterMaster").val().trim() != ""){
		searchWhCounterMaster($("#searchCounterMaster").val(), 'searchCounterMaster',index);
		return;
	}
	var location = "";
	if($("#counterLocation").length > 0 && $("#counterLocation").val()!= "" && $("#counterLocation").val()!= "-- Select --")
		location = $("#counterLocation").val();
		var contextPath = $("#contextPath").val();
		//added by manasa
		var searchName=""
	   		 if($("#searchCounterMaster").length>0)
	   			 searchName = $("#searchCounterMaster").val();
		var maxRecords = 10;
	  	  if($("#maxRecords").length>0)
	  		  maxRecords = $("#maxRecords").val();
	    URL = contextPath + "/admin/viewWhCounters.do";
 		$.ajax({
 			type: "GET",
 			url : URL,
 			data : {
 				index : index,
 				location : location,
 				maxRecords : maxRecords,
 				searchName : searchName
 			},
 			beforeSend: function(xhr){                    
   	   			$("#loading").css("display","block");
   	   			$("#mainDiv").addClass("disabled");
   	   		  },
 			success : function(result) {
 				 if(id != undefined && id != "")
                 	activeMenu(id);
 				openMenu("warehouseDetails", "ulwarehouseDetails",0);
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


function searchWhCounterMaster(name,searchCategory,index){
	debugger
	 //purpose:for checking internet conection
	var online = window.navigator.onLine;
  	if(!online){
  	alert("check your internet connection,please try agian after some time");
  	return;
  	}
	var location = "";
	if($("#counterLocation").length > 0 && $("#counterLocation").val()!= "select" && $("#counterLocation").val()!= "-- Select --")
		location = $("#counterLocation").val();
	
	name=""
  		 if($("#searchCounterMaster").length>0)
  			name = $("#searchCounterMaster").val().trim();
	
	//added maxrecords   by manasa
	 var maxRecords = 10;
	  if($("#maxRecords").length>0)
	 	     maxRecords = $("#maxRecords").val();
	 	    	  
	  
	  //written by manasa
 	 var allLocationsList = [];
 	 var length = $('#counterLocation').children('option').length;
 	 console.log(length)
 	 	$('#counterLocation option').each(function() { 
 	 		allLocationsList.push( $(this).attr('value'));
 		    	});
 		 console.log(allLocationsList)
 		 var  locationList="";
 			for(i=1;i<allLocationsList.length;i++)
 			   	{
 			     locationList =locationList+ allLocationsList[i]+',';
 			     }
 			      //	locationList = locationList.slice(0,-1);//remove last comma
 	console.log(locationList)
	  
	 var contextPath = $("#contextPath").val();
	 URL = contextPath + "/inventorymanager/searchWhCounterMaster.do";
	 $.ajax({
			type: "GET",
			url : URL,
			data : {
				searchName : name,
				index : index,
				maxRecords : maxRecords,
				location : location,
				locationList : locationList
			},
			beforeSend: function(xhr){                    
	   	   		$("#loading").css("display","block");
	   	   		$("#mainDiv").addClass("disabled");
	   	   	},
			success : function(result) {
				debugger
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

function viewNewWhCounter(id){
	 //purpose:for checking internet conection
	var online = window.navigator.onLine;
  	if(!online){
  	alert("check your internet connection,please try agian after some time");
  	return;
  	}
  	
  	var location = "";
	if($("#counterLocation").length > 0)
		location = $("#counterLocation").val();
	
	 var contextPath = $("#contextPath").val();
	 URL = contextPath + "/admin/newWhCounter.do";
		$.ajax({
			type: "GET",
			url : URL,
			data : {
				location : location
			},
			beforeSend: function(xhr){                    
	   			$("#loading").css("display","block");
	   			$("#mainDiv").addClass("disabled");
	   		  },
			success : function(result) {
				$("#right-side").html(result);
				 if(id != undefined && id != "")
                 	activeMenu(id);
				 openMenu("warehouseDetails", "ulwarehouseDetails",0);
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


function saveWhCounter(){
	debugger
	 //purpose:for checking internet conection
	var online = window.navigator.onLine;
  	if(!online){
  	alert("check your internet connection,please try agian after some time");
  	return;
  	}
	var name = $("#counterName").val();
	var location = $("#location").val();
	var counter = $("#counterDeviceId").val();
	var type = $("#counterType").val();
	var remarks = $("#counterRemarks").val();
	var deviceType = $("#counterDeviceType").val();
	
	var counterId = "";
	var b2bCounter = $("#counterCategory").val();
	
	if(b2bCounter == "B2B"){
		b2bCounter = true;
	}else{
		b2bCounter = false;
	}
	
	var outletUserId = $("#counterUserId").val();	
	var printingType = $("#printingType").val();
	var  menu= $("#menu").val();
	var quickBillFlag = $("#quickBill").val();
	var taxcode = $("#taxCodeQuick").val();
	if(quickBillFlag == "true"){
		quickBillFlag =true;
	}
	
	if(menu == null || menu == "" || menu == undefined){
		menu = "";
	}
	
	if(name == null || name == "" || name == undefined){
		$("#Error").html("Please Enter Counter Name");
		return;
	}
	if(location == null || location == "" || location == undefined){
		$("#Error").html("Please Select One Location");
		return;
	}
	if(counter == null || counter == "" || counter == undefined){
		$("#Error").html("Please Select One Counter Device");
		return;
	}
	if(type == null || type == "" || type == undefined){
		$("#Error").html("Please Select One Counter Type");
		return;
	}
	
	var finalObj = {};
	finalObj.counterId = counterId;
	finalObj.counterName = name;
	finalObj.deviceId = counter;
	finalObj.counterType = type;
	finalObj.warehouseLocation = location;
	finalObj.remarks = remarks;
	finalObj.deviceType = deviceType;
	finalObj.counterUserId = outletUserId;
	finalObj.printingType = printingType;
	finalObj.menu = menu;
	finalObj.b2bCounters = b2bCounter;
	finalObj.quickBill = quickBillFlag;
	finalObj.taxCode = taxcode;
	
	var formData = JSON.stringify(finalObj);
	console.log(formData)
	
	 var contextPath = $("#contextPath").val();
	 URL = contextPath + "/admin/createWhCounter.do";
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



function updateWhCounter(){
	 //purpose:for checking internet conection
debugger
	$("#Error").html("");
	var online = window.navigator.onLine;
  	if(!online){
  	alert("check your internet connection,please try agian after some time");
  	return;
  	}
	var name = $("#counterName").val();
	var location = $("#location").val();
	var deviceID = $("#counterDeviceId").val();
	var counterType = $("#counterType").val();
	var remarks = $("#counterRemarks").val();
	var counterId = $("#counterIdSpan").html();
	var b2bCounter = $("#counterCategory").val();
	
	if(b2bCounter == "B2B"){
		b2bCounter = true;
	}else{
		b2bCounter = false;
	}
	
	var deviceType = $("#counterDeviceType").val();
	var outletUserId = $("#counterUserId").val();	
	var printingType = $("#printingType").val();
	var  menu= $("#menu").val();
	
	if(menu == null || menu == "" || menu == undefined){
		menu = "";
	}
	var taxcode = $("#taxCodeQuick").val();
	var quickBillFlag = $("#quickBill").val();
	if(quickBillFlag == "true"){
		quickBillFlag =true;
	}else{
		quickBillFlag =false;
	}
	
	var searchnName=""
  		 if($("#searchCounterMaster").length>0)
  			searchName = $("#searchCounterMaster").val().trim();
	
	if(name == null || name == "" || name == undefined){
		$("#Error").html("Please Enter Counter Name");
		focusDiv("Error");
		return;
	}
	if(location == null || location == "" || location == undefined){
		$("#Error").html("Please Select Location");
		focusDiv("Error");
		return;
	}
	if(deviceID == null || deviceID == "" || deviceID == undefined){
		$("#Error").html("Please Select Device ID");
		focusDiv("Error");
		return;
	}
	if(counterType == null || counterType == "" || counterType == undefined){
		$("#Error").html("Please Select Counter Type");
		focusDiv("Error");
		return;
	}
	if(counterId == null || counterId == "" || counterId == undefined){
		$("#Error").html("Counterid is Required");
		focusDiv("Error");
		return;
	}
	
	if(taxcode == null || taxcode == "" || taxcode == undefined){
		$("#Error").html("Taxcode is Required");
		focusDiv("Error");
		return;
	}
	
	
	var finalObj = {};
	finalObj.counterId = counterId;
	finalObj.counterName = name;
	finalObj.deviceId = deviceID;
	finalObj.counterType = counterType;
	finalObj.warehouseLocation = location;
	finalObj.remarks = remarks;
	finalObj.deviceType = deviceType;
	finalObj.counterUserId = outletUserId;
	finalObj.printingType = printingType;
	finalObj.menu = menu;
	finalObj.b2bCounters = b2bCounter;
	finalObj.quickBill = quickBillFlag;
	finalObj.taxCode = taxcode;
	
	
	var maxRecords = 10;
	   if($("#maxRecords").length > 0)
	     maxRecords = $("#maxRecords").val();
	   finalObj.maxRecords = maxRecords;
	
	   
	  	var formData = JSON.stringify(finalObj);
	console.log(formData)
	 var contextPath = $("#contextPath").val();
	 URL = contextPath + "/admin/updateWhCounter.do";
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
				/*$("#searchCounterMaster").val(searchName);
			    $("#counterLocation").val(outletlocation);*/
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




function viewEditWhCounter(counterId,location,purpose){
		var contextPath = $("#contextPath").val();
		
		
		 //purpose:for checking internet conection
		var online = window.navigator.onLine;
	  	if(!online){
	  	alert("check your internet connection,please try agian after some time");
	  	return;
	  	}
		// added  by manasa to get selected filter details
		 var outletlocation=$("#counterLocation").val();
		
		 var searchName=""
	   		 if($("#searchCounterMaster").length>0)
	   			 searchName = $("#searchCounterMaster").val();
		 
		 var maxRecords = 10;
	  	  if($("#maxRecords").length>0)
	  		  maxRecords = $("#maxRecords").val();
		 
		 URL = contextPath + "/admin/getWhCounterDetails.do";
			$.ajax({
				type: "POST",
				url : URL,
				data : {
					counterId : counterId,
					purpose : purpose,
					location : location,
					outletlocation : outletlocation,
					searchName : searchName,
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


