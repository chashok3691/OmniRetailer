function appendServiceAreaDetails(){
	$('.odd').remove();
	debugger
	var latitude = $("#gpsLatitude").val();
	var longitude = $("#gpsLongitude").val();
	var locationDescription = $("#locationDescription").val();
	
	var latitudeValue=parseFloat($("#gpsLatitude").val());
	var longitudeValue=parseFloat($("#gpsLongitude").val());
//	loadMap(latitude,longitude);
	var locationDescription = $("#locationDescription").val();
	
	var slNo=1;
	$('.slno').each(function(){
			$(this).text(slNo);
			slNo = parseInt(slNo) + 1;
     });
//debugger
     var contextPath = $("#contextPath").val();
	 var len = parseInt($("#serviceAreaMasterTable tr").length);
		if (len != 1)
			len = parseInt($("#serviceAreaMasterTable tr:last").attr("id").replace('dynamicdiv', '')) + 1;
	 var row = "<tr id='dynamicdiv"+len+"' style='margin-top:5px;'><td id='slno"+len+"' class='slno'>"+slNo+"</td>" +
	"<td><div ><input type='text'  class='latitude' id='latitude"+len+"' style='vertical-align: -2px' value='"+latitude+"' ></div></td>"+
	"<td><div ><input type='text' class='langitude' id='langitude"+len+"'  style='vertical-align: -2px' value='"+longitude+"'></div></td>"+
	"<td><div style='width: 170px;'><input type='text' id='description"+len+"'  style='vertical-align: -2px' class='sun' value='"+locationDescription+"'></div></td>"+
	"<td id='Del"+ len +"' ><img id='Img"+ len +"' src='"+contextPath+"/images/itemdelete.png' style='width:30px;cursor:pointer;' onclick='deleteItem(this);' />" +
	"</td></tr>";
	 $("#serviceAreaMasterTable tbody").append(row);
	 loadMap(latitudeValue,longitudeValue);
}




function appendServiceAreapinDetails(){
	debugger;
	var pincode = $("#pincode").val();
	var areaname = $("#areaname").val();
	var description = $("#description").val();

	
	if(pincode == "" || pincode == null || pincode == undefined){
		 $("#pincode").focus();
		 $("#pinError").html("Please Enter PinCode");
		return false;
	} else if(pincode.length != 6) {
		 $("#pincode").focus();
		 $("#pinError").html("Please Enter valid PinCode");
		 return false;
		} else {
		$("#pinError").html("");	
	}

	if(areaname == "" || areaname == null || areaname == undefined){
		 $("#areaname").focus();
		$("#pinError").html(" Please Enter Area Name");
			return;
	}
	else{
		$("#pinError").html("");	
	}
	
		
	var pincodeValue=parseFloat($("#pincode").val());
	var areanameValue=parseFloat($("#areaname").val());
	var description = $("#description").val();
	
	
		var slNo=1;
	$('.slnos').each(function(){
			$(this).text(slNo);
			slNo = parseInt(slNo) + 1;
		});  
	

	//debugger
	 var contextPath = $("#contextPath").val();
	 var len = parseInt($("#serviceAreaMasterpinTable tr").length);
		if (len != 1)
			len = parseInt($("#serviceAreaMasterpinTable tr:last").attr("id").replace('dynamicdiv', '')) + 1;
		
		for(var i=0;i<len;i++){
			var tablePincode = $("#pinCode"+i).val();
		if(pincode == tablePincode){
			$("#pincode").focus();
			 $("#pinError").html("This pin is Aleady Available,Please Enter valid PinCode");
			 return false;
		}
		}
		
	 var row = "<tr id='dynamicdiv"+len+"' style='margin-top:5px;'><td id='slnoPin"+len+"' class='slnos'>"+slNo+"</td>" +
	"<td><div ><input type='text'  class='pinCode' id='pinCode"+len+"' style='vertical-align: -2px' value='"+pincode+"' ></div></td>"+
	"<td><div ><input type='text' class='pinArea' id='pinArea"+len+"'  style='vertical-align: -2px' value='"+areaname+"'></div></td>"+
	"<td><div style='width: 170px;'><input type='text' id='pinDescription"+len+"'  style='vertical-align: -2px' class='pinDescription' value='"+description+"'></div></td>"+
	"<td id='Del"+ len +"' ><img id='Img"+ len +"' src='"+contextPath+"/images/itemdelete.png' style='width:30px;cursor:pointer;' onclick='deleteItem(this);' />" +
	"</td></tr>";
	 $("#serviceAreaMasterpinTable tbody").append(row);

	
}
 
 
 
 
 
 function loadMap(latitude,longitude){
	debugger
	
	 var input = document.getElementById('city');
	   var searchBox = new google.maps.places.SearchBox(input);
	   searchBox.addListener('places_changed', function() {
	   var places = searchBox.getPlaces();
	   if (places.length == 0) {
	     return;
	   }
	   places.forEach(function(place) {
	  	  var data=JSON.parse(JSON.stringify(place));
	  	  $('#mapid').html("");
	  	 $('#mapid').append(data.adr_address);  
	  	  $("#city").val($("#mapid .locality").text());
	   });
	  });
	   
	
	   
		
		  var input = document.getElementById('city');
		  
		  var autocomplete = new google.maps.places.Autocomplete(input);
		  
		  
		  
		  var infowindow = new google.maps.InfoWindow();
	      var infowindowContent = document.getElementById('infowindow-content');
	      infowindow.setContent(infowindowContent);
	      var marker = new google.maps.Marker({
	        map: map,
	        anchorPoint: new google.maps.Point(0, -29)
	      });

	      autocomplete.addListener('place_changed', function() {
	        infowindow.close();
	        marker.setVisible(false);
	        var place = autocomplete.getPlace();
	        if (!place.geometry) {
	          // User entered the name of a Place that was not suggested and
	          // pressed the Enter key, or the Place Details request failed.
	          window.alert("No details available for input: '" + place.name + "'");
	          return;
	        }

	        // If the place has a geometry, then present it on a map.
	        if (place.geometry.viewport) {
	          map.fitBounds(place.geometry.viewport);
	        } else {
	          map.setCenter(place.geometry.location);
	          map.setZoom(17);  // Why 17? Because it looks good.
	        }
	        marker.setPosition(place.geometry.location);
	        marker.setVisible(true);
	        
	        infowindowContent.children['place-icon'].src = place.icon;
	          infowindowContent.children['place-name'].textContent = place.name;
	          infowindowContent.children['place-address'].textContent = address;
	          infowindow.open(map, marker);
		  
	      });
		
	   
	/*var gpsLatitude=[],gpsLongitude=[];
	gpsLatitude.push(latitude);
	gpsLongitude.push(longitude);
	console.log(gpsLatitude);
	console.log(gpsLongitude);*/
	
	var gpsLatitude = []; 
	$(".latitude").each( function(){
		gpsLatitude.push($(this).val());

	});

	var gpsLongitude = []; 
	$('.langitude').each( function(){
		gpsLongitude.push($(this).val());


	});
	
	console.log(gpsLatitude);
	console.log(gpsLongitude);
	
var mapProp = {
        center:new google.maps.LatLng(20.5937,78.9629),
        zoom:3,
        mapTypeId:'terrain'
     };
     
     var map = new google.maps.Map(document.getElementById("googleMap"),mapProp);
   
     var len = $("#serviceAreaMasterTable tr").length-1;
     
   /*  for(var i=1;i<=len;i++){
			var idAttr = $("#serviceAreaMasterTable tr:eq("+i+") td:last").attr("id");
			idAttr = idAttr.replace('Del','');
			var obj = {gpsLatitude:$("#latitude"+idAttr).val(),gpsLongitude:$("#langitude"+idAttr).val()};
				items.push(obj);
     }
    */ 
     
 /*    markersListArray = [];
  
		 for(var i=0;i<len;i++){
 		var obj = {
 				gpsLongitude:gpsLongitude[i],
 				gpsLatitude:gpsLatitude[i],
 				}
 		markersListArray.push(obj);
 	}
     
	console.log(markersListArray);*/
   //debugger
//     var flightPlanCoordinates =[]; 
   
  /* var flightPlanCoordinates = [
                                {lat: 37.772, lng: -122.214},
                                {lat: 21.291, lng: -157.821},
                                {lat: -18.142, lng: 178.431},
                                {lat: -27.467, lng: 153.027}
                              ];*/
   
   
  
  var items=[];
	 for(var i=1;i<=len;i++){
     
//     marker.setMap(map);
			var idAttr = $("#serviceAreaMasterTable tr:eq("+i+") td:last").attr("id");
			idAttr = idAttr.replace('Del','');
			var gpslatitude = parseFloat($("#latitude"+idAttr).val());
			var gpslongitude = parseFloat($("#langitude"+idAttr).val());
		 var flightPlanCoordinates = {lat:gpslatitude,lng:gpslongitude};
		 items.push(flightPlanCoordinates);
//		var flightPlanCoordinates= [{lat:gpsLatitude[i], lng:gpsLongitude[i]}];
		 
		 
		 
		 
		 
	  
	 }
	  var lineSymbol = {
	          path: google.maps.SymbolPath.CIRCLE,
	          scale: 8,
	          strokeColor: '#393'
	        };
   console.log("latlon"+items) 
   //to draw the lines between points
   var tourplan = new google.maps.Polyline({
    	 path: items,
    	 geodesic: true,
        strokeColor:"#FF6347",
        strokeOpacity:0.6,
        zoom:15,
        geodesc:true,
        icons: [{
            icon: lineSymbol,
            offset: '100%'
          }],
        strokeWeight:2
     });
	 
   //to zoom the polygon lines
   if(items.length>0){
   var bounds = new google.maps.LatLngBounds();
   for (var i = 0; i < items.length; i++) {
     bounds.extend(items[i]);
   }
   bounds.getCenter();
   map.fitBounds(bounds);
   }
   
   
   animateCircle(tourplan);
   
   tourplan.setMap(map);
    /* console.log(latitude)
 	console.log(longitude)*/
     
  /*   if(latitude!=null && longitude!=null){
     var mapProp = {
    	        center:new google.maps.LatLng(latitude,longitude),
    	        zoom:3,
    	        mapTypeId:google.maps.MapTypeId.ROADMAP
    	     };
    	     
    	     var map = new google.maps.Map(document.getElementById("googleMap"),mapProp);
    	     tourplan.setMap(map);
     }
     */
 
     
     
     //to remove plylines
     //tourplan.setmap(null);
  }
 
 function animateCircle(line) {
     var count = 0;
     window.setInterval(function() {
       count = (count + 1) % 200;

       var icons = line.get('icons');
       icons[0].offset = (count / 2) + '%';
       line.set('icons', icons);
   }, 20);
 }
 
 
 function createServiceAreaMaster(operation){
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
  	  if($("#searchTax").length>0)
 	  searchName = $("#searchTax").val();
  	  
 	   debugger ;
  	
 	    var areaCode = $("#areaCode").val().trim();
 	    var city = $("#city").val().trim();
 	    var startDate = $("#startDate").val().trim();
 	    var priority = $("#priority").val().trim();
 	    var location = $("#location").val();
 	    var outletzone = $("#outletZone").val();
 	    var endDate = $("#endDate").val().trim();;
 	    var status = $("#status").val();
 	    var areaDescription = $("#areaDescription").val().trim();
 	    var areaType=$("#AreaTypeId").val();
 	    
 	    
 	    
 	   if(areaCode.trim() == ""){
	    	$("#areCodeError").html("Enter Area Code");
	    	$("#areaCode").focus();
	    	return false;
	    }else if(parseInt($("#areaCode").val().length)>50){
			 $("#areaCode").focus();
				$("#areCodeError").html("Area code can't exceeds 50 Characters");
				return;
			}else{
				$("#areCodeError").html("");
			}
 	    
 	  if(parseInt($("#city").val().length)>20){
           $("#city").focus();
           $("#areaError").html("City can't exceeds 20 Characters");
             return;
      }else{
			$("#areaError").html("");
		}
 	   
 	  if(areaDescription.trim() != "" && parseInt($("#areaDescription").val().length)>150){
			$("#areaDescription").focus();
			$("#areaDescriptionError").html("Area Description can't exceeds 150 Characters");
			return false;
		}else{
			$("#areaDescriptionError").html("");
		}
 	  
 	 debugger
 	 if(startDate!=null && endDate!=null)
  	    var noOfDays = daydiff(parseDate($('#startDate').val()), parseDate($('#endDate').val()));
  		 if(noOfDays < 0) {
  			 $("#endDateError").html("End Date can't be less than Start Date");
  			 return;
  		 }
 	  
 	   var radius=0;
 	   var isRadiusSpecific="false";
 	    if(areaType=="Open")
 	    	{
 	    	radius=0
 	    	isRadiusSpecific="false";
 	    	}	
 	    else
 	    	{
 	    	isRadiusSpecific="true";
 	    	 radius=$("#radius").val();
 	    	}
 	    	
 	   
 	 if(startDate!=null && endDate!=null)
 	    var noOfDays = daydiff(parseDate($('#startDate').val()), parseDate($('#endDate').val()));
 		 if(noOfDays < 0){
 			 $("#endDateError").html("End Date  can't be less than Start Date");
 			 return;
 		 }
 	    
 	    //debugger
 	  	var finalObj = {};
 		
 	  	
// 		finalObj.taxLocationsList = locDetails;
 		finalObj.area_code = areaCode;
 		finalObj.city = city;
 		finalObj.startDateStr = startDate;
 		finalObj.endDateStr = endDate;
 		finalObj.area_description = areaDescription;
 		finalObj.priority = priority;
// 		finalObj.pickupPoint = location;
 		finalObj.zone = outletzone;
 		finalObj.status = status;
 		finalObj.defaultLocation = location;
 		finalObj.serviceAreaType = areaType;
 		finalObj.radius = radius;
 		finalObj.isRadiusSepcificFlag=isRadiusSpecific;
 		
 	/*	finalObj.maxRecords = maxRecords;
 		finalObj.searchCriteria = searchName;*/
 		debugger
 		var pinCheck =$("#pinid").prop("checked");
 		var mapCheck =$("#map").prop("checked");
 		var mapCheckflag = false;
 		var pinCheckflag = false;
 		$("#radioBtnError").html("");
 		
 		if(pinCheck == false && mapCheck == false){
 			$("#radioBtnError").html("Please Check Atleast One.");
	    	return false;
 		}else if(mapCheck == true){
 			mapCheckflag = true;
 			pinCheckflag = false;
 			$("#radioBtnError").html("");
 		}else if(pinCheck == true){
 			pinCheckflag = true;
 			mapCheckflag = false;
 			$("#radioBtnError").html("");
 		}
 		
 		 var len = $("#serviceAreaMasterTable tr").length-1;
 		 
 		var items=[];
 		if(mapCheckflag == true && pinCheckflag == false){
 			
 			if(areaType=="Open")
				if(len < 3){
					alert("Add atleast Three Map");
					return;
				}
 			
 		 for(var i=1;i<=len;i++){
 				var idAttr = $("#serviceAreaMasterTable tr:eq("+i+") td:last").attr("id");
 				idAttr = idAttr.replace('Del','');
 				
 				
 				var obj = {slNo:$("#slno").val(),latitude:$("#latitude"+idAttr).val(),longitude:$("#langitude"+idAttr).val()};
 				items.push(obj);
 		 }
 		}
 		 finalObj.serviceAreaList = items;
 		 
 		 
 		 
 		var len2 = $("#serviceAreaMasterpinTable tr").length-1;
 		var items2=[];
 		if(pinCheckflag == true && mapCheckflag == false){
 			
 			if(len2 < 3){
					alert("Add atleast Three pincode");
					return;
				}
 			
 		 for(var i=1;i<=len2;i++){
 				var idAttr2 = $("#serviceAreaMasterpinTable tr:eq("+i+") td:last").attr("id");
 				idAttr2 = idAttr2.replace('Del','');
 				
 				var obj2 = {slNo:$("#slnoPin"+idAttr2).val(),servicePin:$("#pinCode"+idAttr2).val(),pinAreaName:$("#pinArea"+idAttr2).val(),description:$("#pinDescription"+idAttr2).val()};
 				items2.push(obj2);
 				
 		 }
 		}
 		 finalObj.serviceAreaPinWiseList = items2; 
 		 
 		 
 		 
 	  	  	var formData = JSON.stringify(finalObj);
 	    console.log(formData)
 	  if(operation == "new")
 		URL = contextPath + "/genericMaster/createServiceAreaMaster.do";
 	  	else
 	  	URL = contextPath + "/genericMaster/updateServiceAreaMaster.do"; 		
 		 
 		$.ajax({
 			type: "POST",
 			url : URL,
 			contentType: "application/json",
 			data :formData,
 			beforeSend: function(xhr){                    
   	   			$("#loading").css("display","block");
   	   			$("#mainDiv").addClass("disabled");
   	   		  },
 			success : function(result) {
 				$("#right-side").html(result);
// 				$("#maxRecords").val(maxRecords);
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
 function createServiceAreaMaster(operation){
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
  	  if($("#searchTax").length>0)
 	  searchName = $("#searchTax").val();
  	  
 	   debugger ;
  	
 	    var areaCode = $("#areaCode").val().trim();
 	    var city = $("#city").val().trim();
 	    var startDate = $("#startDate").val().trim();
 	    var priority = $("#priority").val().trim();
 	    var location = $("#location").val();
 	    var outletzone = $("#outletZone").val();
 	    var endDate = $("#endDate").val().trim();;
 	    var status = $("#status").val();
 	    var areaDescription = $("#areaDescription").val().trim();
 	    var areaType=$("#AreaTypeId").val();
 	    
 	    
 	   if(areaCode.trim() == ""){
	    	$("#areCodeError").html("Enter Area Code");
	    	$("#areaCode").focus();
	    	return false;
	    }
 	    
 	   var radius=0;
 	   var isRadiusSpecific="false";
 	    if(areaType=="Open")
 	    	{
 	    	radius=0
 	    	isRadiusSpecific="false";
 	    	}	
 	    else
 	    	{
 	    	isRadiusSpecific="true";
 	    	 radius=$("#radius").val();
 	    	}
 	    	
 	   
 	 if(startDate!=null && endDate!=null)
 	    var noOfDays = daydiff(parseDate($('#startDate').val()), parseDate($('#endDate').val()));
 		 if(noOfDays < 0){
 			 $("#endDateError").html("End Date  can't be less than Start Date");
 			 return;
 		 }
 	    
 	    //debugger
 	  	var finalObj = {};
 		
 	  	
// 		finalObj.taxLocationsList = locDetails;
 		finalObj.area_code = areaCode;
 		finalObj.city = city;
 		finalObj.startDateStr = startDate;
 		finalObj.endDateStr = endDate;
 		finalObj.area_description = areaDescription;
 		finalObj.priority = priority;
// 		finalObj.pickupPoint = location;
 		finalObj.zone = outletzone;
 		finalObj.status = status;
 		finalObj.defaultLocation = location;
 		finalObj.serviceAreaType = areaType;
 		finalObj.radius = radius;
 		finalObj.isRadiusSepcificFlag=isRadiusSpecific;
 		
 		finalObj.maxRecords = maxRecords;
 		finalObj.searchCriteria = searchName;
 		 var len = $("#serviceAreaMasterTable tr").length-1;
 		var items=[];
 		 for(var i=1;i<=len;i++){
 				var idAttr = $("#serviceAreaMasterTable tr:eq("+i+") td:last").attr("id");
 				idAttr = idAttr.replace('Del','');
 				
 				if(len < 3){
 					alert("Add atleast Three Map");
 					return;
 				}
 				var obj = {slNo:$("#slno").val(),latitude:$("#latitude"+idAttr).val(),longitude:$("#langitude"+idAttr).val()};
 				items.push(obj);
 				
 		 }
 		
 		 finalObj.serviceAreaList = items;
 	  	  	var formData = JSON.stringify(finalObj);
 	    console.log(formData)
 	  if(operation == "new")
 		URL = contextPath + "/genericMaster/createServiceAreaMaster.do";
 	  	else
 	  	URL = contextPath + "/genericMaster/updateServiceAreaMaster.do"; 		
 		 
 		$.ajax({
 			type: "POST",
 			url : URL,
 			contentType: "application/json",
 			data :formData,
 			beforeSend: function(xhr){                    
   	   			$("#loading").css("display","block");
   	   			$("#mainDiv").addClass("disabled");
   	   		  },
 			success : function(result) {
 				$("#right-side").html(result);
// 				$("#maxRecords").val(maxRecords);
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



 function deleteItem(element){
		var id = $(element).attr("id").replace('Img','');
		$('#dynamicdiv'+id).remove();
		 loadMap(latitudeValue,longitudeValue);
	}


 
 
 function initAutocomplete() {
	 //debugger
	 var input = document.getElementById('city');
 var searchBox = new google.maps.places.SearchBox(input);
 searchBox.addListener('places_changed', function() {
 var places = searchBox.getPlaces();
 if (places.length == 0) {
   return;
 }
 places.forEach(function(place) {
	  var data=JSON.parse(JSON.stringify(place));
	  $("#city").val($("#mapid .locality").text());
 });
});
}
 
 function viewEditServiceAreaMaster(areaCode,operation,status){
 	 //purpose:for checking internet conection
 	var online = window.navigator.onLine;
  	if(!online)
  	{
  	alert("check your internet connection,please try agian after some time");
  	return;
  	}
  	//debugger
 	 var contextPath = $("#contextPath").val();
 	 var maxRecords = 10;
  	  if($("#maxRecords").length>0)
  		  maxRecords = $("#maxRecords").val();
  	  var searchName ="";
  	  if($("#searchRoute").length>0)
 	  searchName = $("#searchRoute").val();
  	  
 	 URL = contextPath + "/genericMaster/viewEditServiceAreaMaster.do";
 	$.ajax({
 		type: "GET",
 		url : URL,
 		data : {
 			areaCode : areaCode,
 			operation : operation,
 			maxRecords: maxRecords,
 			searchName: searchName,
 			status : status
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
 
 function selectServiceAreaType() {   
		debugger
	 if ($("#map").prop("checked") == true){
	    	$("#serviceAreaMasterpinTable").addClass('disabled');
	    	$("#serviceAreaMasterTable").removeClass('disabled');
	    	$("#addpin").addClass("disabled");
	    	$("#addlocation").removeClass("disabled");
	    	$("#serviceAreaMasterpinTable tbody").html('');
		    $("#gpsLatitude").val("");
			$("#gpsLongitude").val("");
			$("#locationDescription").val("");
	    	 
	} else{
    	    $("#serviceAreaMasterpinTable").removeClass('disabled');
	    	$("#serviceAreaMasterTable").addClass('disabled');
	    	$("#addlocation").addClass("disabled");
	    	$("#addpin").removeClass("disabled");
	    	$("#serviceAreaMasterTable tbody").html('');
		    $("#pincode").val("");
		    $("#areaname").val("");
		    $("#description").val("");
	    }	
}
 
 
 function selectServiceAreaTypeinEdit() {   
		debugger
	 if ($("#map").prop("checked") == true){
	    	$("#serviceAreaMasterpinTable").addClass('disabled');
	    	$("#serviceAreaMasterTable").removeClass('disabled');
	    	$("#addpin").removeClass("disabled");
	    	$("#addlocation").removeClass("disabled");
	    	/*$("#serviceAreaMasterpinTable tbody").html('');*/
	    	$("#gpsLatitude").removeClass("disabled");
			$("#gpsLongitude").removeClass("disabled");
			$("#locationDescription").removeClass("disabled");
		    $("#gpsLatitude").val("");
			$("#gpsLongitude").val("");
			$("#locationDescription").val("");
			$(".addPinListBtn").addClass("disabled");
			 $(".addServiceListBtn").removeClass("disabled");
	} else{
 	    $("#serviceAreaMasterpinTable").removeClass('disabled');
	    	$("#serviceAreaMasterTable").addClass('disabled');
	    	$("#addlocation").removeClass("disabled");
	    	$("#addpin").removeClass("disabled");
	    	/*$("#serviceAreaMasterTable tbody").html('');*/
	    	$("#pincode").removeClass("disabled");
			$("#areaname").removeClass("disabled");
			$("#description").removeClass("disabled");
		    $("#pincode").val("");
		    $("#areaname").val("");
		    $("#description").val("");
		    $(".addServiceListBtn").addClass("disabled");
		    $(".addPinListBtn").removeClass("disabled");
	    }	
}
 
 