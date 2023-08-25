$(document).ready(function(){
 	  $("#zoneID").keydown(function(){
 		   $("#zoneIDError").html("");
		   $(".Error").html("");
 	 });
 	 $("#addressOne").keydown(function(){
		   $("#addressOneError").html("");
		   $(".Error").html("");
	 });
 	 $("#addressTwo").keydown(function(){
		   $("#address2Error").html("");
		   $(".Error").html("");
	 });
 	 $("#phone").keydown(function(){
		   $("#error").html("");
		   $(".Error").html("");
	 });
 	 $("#location").change(function(){
		   $(".Error").html("");
	 });
});

function searchZoneMaster(name,searchCategory,index){
	 var contextPath = $("#contextPath").val();
	 //purpose:for checking internet conection
		var online = window.navigator.onLine;
	  	if(!online)
	  	{
	  	alert("check your internet connection,please try agian after some time");
	  	return;
	  	}
	    var maxRecords = 10;
	  	  if($("#maxRecords").length>0)
	  		  maxRecords = $("#maxRecords").val();
	  		  	  
	 URL = contextPath + "/genericMaster/searchZoneMaster.do";
	 $.ajax({
			type: "GET",
			url : URL,
			data : {
				searchName : name,
				index : index,
				maxRecords : maxRecords,

				
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
				 alert("something went wrong");
				 $("#loading").css("display","none");
	 			 $("#mainDiv").removeClass('disabled');
			}
		});
}


$('#searchZone').on('input',function(e){
	if($(this).val().trim()==""){
		viewZoneMaster('zoneMaster','0');
	}
});

/*
function validateZone(operation){
	 //purpose:for checking internet conection
	var online = window.navigator.onLine;
  	if(!online)
  	{
  	alert("check your internet connection,please try agian after some time");
  	return;
  	}
  		debugger;
		var finalObj = {}, zoneDetails = [];
		if($("#zoneID").val().trim() == ""){
			$("#zoneIDError").html("Enter Zone Name");
			$("#zoneID").focus();
			return false;
		}
		var zoneID = $("#zoneID").val().trim();
		finalObj.zoneID = zoneID;
		if($("#addressOne").val().trim() == ""){
			$("#addressOneError").html("Enter Address1");
			$("#addressOne").focus();
			return false;
		}
		finalObj.addressOne = $("#addressOne").val().trim();
		finalObj.addressTwo = $("#addressTwo").val().trim();
		 if($("#error").text() != ""){
			 $("#phoneNumber").focus();
			 return false;
		 }
		 
		  var maxRecords = 10;
	  	  if($("#maxRecords").length>0)
	  		  maxRecords = $("#maxRecords").val();
	  	  var searchName ="";
	  	  if($("#searchZone").length>0)
		  searchName = $("#searchZone").val();	
	  	  
	  	 var localityZone ="";
	  	  if($("#locality").length>0)
	  		localityZone = $("#locality").val();
	  	  
	  	  
	  	  
	   	 var defaultCountry = $("#defaultCountry").val().trim();
		 var phoneNumber = $("#phoneNumber").val().trim();
		 if(phoneNumber.trim() == ""){
			 $("#phoneNumberError").text("Please Enter Phone Number");
				return false;
		 }
		 if(defaultCountry != "" && phoneNumber != ""){
			 $("#phone").val(defaultCountry+"-"+phoneNumber);
		 }
		finalObj.phoneNum = $("#phone").val().trim();
		if($("#location").val() == null){
			$("#Error").text("Please Select Location");
			return false;
		}
		
		 var locationZone = $("#workLocationZone").val();
		 if(locationZone == ""){
			 $("#workLocationZoneError").text("Please select location");
				return false;
		 }
		
		 
		 
		 var mobileNumber = validateMobileNumber();
  	 	 if(mobileNumber == false){
  	 		 $("#phoneNumber").focus();
  	 		$("#phoneNumberError").html("Enter 10 digits Only"); 
  	 		return;
  	 	 }
		
		var lc="";
		var act = ""
		if($("#location").val() != null){
			var locations = $("#location").val().toString().split(',');
			for(var i=0; i<locations.length; i++){
				lc = locations[i];
				lc = lc.split('+');
				obj = {"location":lc[0],"locationType":lc[1]};
				zoneDetails.push(obj);
			}
		}
		finalObj.zoneDetails = zoneDetails;
		finalObj.maxRecords = maxRecords;
		finalObj.searchCriteria = searchName; 
		finalObj.location = $("#workLocationZone").val();
		finalObj.zoneDescription = $("#zoneDescription").val().trim();
		
		finalObj.gpsLatitude = $("#gpsLatitude").val().trim();
		finalObj.gpsLongitude = $("#gpsLongitude").val().trim();
		
		 var formData = JSON.stringify(finalObj);
		 console.log(formData)
		 var contextPath = $("#contextPath").val();
	   	   if(operation=="new"){
	    	 URL = contextPath + "/genericMaster/createZone.do";
	   	   }
	   	   else{
	   		 URL = contextPath + "/genericMaster/updateZone.do";
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
	  				$("#locality").val(localityZone);
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

function validateZone(operation){
	 //purpose:for checking internet conection
	var online = window.navigator.onLine;
 	if(!online)
 	{
 	alert("check your internet connection,please try agian after some time");
 	return;
 	}
 	
 	 $("#phoneNumberError").text("");
 	 $("#DescError").html("");
 		debugger;
		var finalObj = {}, zoneDetails = [];
		if($("#zoneID").val().trim() == ""){
			$("#zoneIDError").html("Enter Zone Name");
			$("#zoneID").focus();
			return false;
		}
		var zoneID = $("#zoneID").val().trim();
		finalObj.zoneID = zoneID;
		if($("#addressOne").val().trim() == ""){
			$("#addressOneError").html("Enter Address1");
			$("#addressOne").focus();
			return false;
		}else if(parseInt($("#addressOne").val().length)>200){
			$("#addressOne").focus();
			$("#addressOneError").html("Address1 can't exceeds 200 Characters");
			return;
			}
		if($("#addressTwo").val().trim() == ""){
			$("#address2Error").html("Enter Address2");
			$("#addressTwo").focus();
			return false;
		}else if(parseInt($("#addressTwo").val().length)>200){
			$("#addressTwo").focus();
			$("#address2Error").html("Address2 can't exceeds 200 Characters");
		}
		
		
		finalObj.addressOne = $("#addressOne").val().trim();
		finalObj.addressTwo = $("#addressTwo").val().trim();
		 if($("#error").text() != ""){
			 $("#phoneNumber").focus();
			 return false;
		 }
		  var maxRecords = 10;
	  	  if($("#maxRecords").length>0)
	  		  maxRecords = $("#maxRecords").val();
	  	  var searchName ="";
	  	  if($("#searchZone").length>0)
		  searchName = $("#searchZone").val();	
	  	  
	  	 var localityZone ="";
	  	  if($("#locality").length>0)
	  		localityZone = $("#locality").val();
	  	  
	  	  
	  	  
	   	 var defaultCountry = $("#defaultCountry").val().trim();
		 var phoneNumber = $("#phoneNumber").val().trim();
		 if(phoneNumber.trim() == ""){
			 $("#phoneNumber").focus();
			 $("#phoneNumberError").text("Please Enter Phone Number");
				return false;
		 }
		 if(defaultCountry != "" && phoneNumber != ""){
			 $("#phone").val(defaultCountry+"-"+phoneNumber);
		 }
		finalObj.phoneNum = $("#phone").val().trim();
		if($("#zoneDescription").val().trim() == ""){
			$("#zoneDescription").focus();
			$("#DescError").html("Enter Description");
			return false;
		}else if(parseInt($("#zoneDescription").val().length)>250){
			$("#zoneDescription").focus();
			$("#DescError").html("Description can't exceeds 250 characters");
			return false;
		}
		
		if($("#location").val() == null){
			 $("#location").focus();
			$("#Error").text("Please Select Location");
			return false;
		}
		
		 var locationZone = $("#workLocationZone").val();
		 if(locationZone == ""){
			 $("#workLocationZone").focus();
			 $("#workLocationZoneError").text("Please select location");
				return false;
		 }
		
		 
		 
		 var mobileNumber = validateMobileNumber();
 	 	 if(mobileNumber == false){
 	 		 $("#phoneNumber").focus();
 	 		$("#phoneNumberError").html("Enter 10 digits Only"); 
 	 		return;
 	 	 }
		
		var lc="";
		var act = ""
		if($("#location").val() != null){
			var locations = $("#location").val().toString().split(',');
			for(var i=0; i<locations.length; i++){
				lc = locations[i];
				lc = lc.split('+');
				obj = {"location":lc[0],"locationType":lc[1]};
				zoneDetails.push(obj);
			}
		}
		finalObj.zoneDetails = zoneDetails;
		finalObj.maxRecords = maxRecords;
		finalObj.searchCriteria = searchName; 
		finalObj.location = $("#workLocationZone").val();
		finalObj.zoneDescription = $("#zoneDescription").val().trim();
		
		finalObj.gpsLatitude = $("#gpsLatitude").val().trim();
		finalObj.gpsLongitude = $("#gpsLongitude").val().trim();
		
		 var formData = JSON.stringify(finalObj);
		 console.log(formData)
		 var contextPath = $("#contextPath").val();
	   	   if(operation=="new"){
	    	 URL = contextPath + "/genericMaster/createZone.do";
	   	   }
	   	   else{
	   		 URL = contextPath + "/genericMaster/updateZone.do";
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
	  				$("#locality").val(localityZone);
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


function viewEditZone(zoneID,operation){
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
		  	  var searchName ="";
		  	  if($("#searchZone").length>0)
			  searchName = $("#searchZone").val();	 

		  	var localityZone ="";
		  	  if($("#locality").length>0)
		  		localityZone = $("#locality").val();  
		  	  
		  	  
  	 URL = contextPath + "/genericMaster/editZone.do";
		$.ajax({
 		type: "GET",
 		url : URL,
 		data : {
 			zoneID : zoneID,
 			operation : operation,
 			maxRecords: maxRecords,
 			searchName : searchName
 		},
 		beforeSend: function(xhr){                    
  	   		$("#loading").css("display","block");
  	   		$("#mainDiv").addClass("disabled");
  	   	},
  		success : function(result) {
 			$("#right-side").html(result);
 			$("#locality").val(localityZone);
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


function initAutocomplete() {
	 var input = document.getElementById('locality');
var searchBox = new google.maps.places.SearchBox(input);
searchBox.addListener('places_changed', function() {
var places = searchBox.getPlaces();
if (places.length == 0) {
  return;
}
places.forEach(function(place) {
	  var data=JSON.parse(JSON.stringify(place));
$("#gpsLatitude").val(JSON.stringify(data.geometry.location.lat));
$("#gpsLongitude").val(JSON.stringify(data.geometry.location.lng));
});
});
}

