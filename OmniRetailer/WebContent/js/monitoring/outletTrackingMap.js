


var  lattitude = "";
var longitude ="";

function myMap(index) 
{
	var gpsLatitude = []; 
	$('.gpsLatitude').each( function(){
		gpsLatitude.push($(this).val());

	});

	var gpsLongitude = []; 

	$('.gpsLongitude').each( function(){
		gpsLongitude.push($(this).val());


	});

	var location = []; 

	$('.location').each( function(){
		location.push($(this).val());


	});

	var outletType = [];

	$('.outletType').each( function(){

		outletType.push($(this).val());


	});

	var activeStatus= [];

	$('.activeStatus').each( function(){

		activeStatus.push($(this).val());


	});

	var email= [];

	$('.email').each( function(){

		email.push($(this).val());


	});

	var locality= [];

	$('.locality').each( function(){

		locality.push($(this).val());


	});

//	var street= [];
//
//	$('.street').each( function(){
//
//		street.push($(this).val());
//
//
//	});


	var phone= [];

	$('.phone').each( function(){

		phone.push($(this).val());


	});

	var zoneId= [];

	$('.zoneId').each( function(){

		zoneId.push($(this).val());


	});

	var storeName= [];

	$('.storeName').each( function(){

		storeName.push($(this).val());


	});


	
	
//debugger

	markersListArray = [];
	for(var i=0; i<location.length;i++)
	{
		var obj = {
				location:location[i], 
				gpsLongitude:gpsLongitude[i],
				gpsLatitude:gpsLatitude[i],
				activeStatus:activeStatus[i]}
		markersListArray.push(obj);
	}

	var mapCanvas = document.getElementById("map");
	var myCenter="";

	if (navigator.geolocation != null) 
	{
		navigator.geolocation.getCurrentPosition(showPosition);
	}


	if(gpsLongitude[index] != "" && gpsLatitude[index] != "" && typeof gpsLongitude[index] != 'undefined' && typeof gpsLatitude[index] != 'undefined')
	{

		if( validateGps(gpsLatitude[index])  && validateGps(gpsLongitude[index]))  
			myCenter = new google.maps.LatLng(gpsLatitude[index],gpsLongitude[index]);
		else
		{
			alert("Incorrect GPS Lattitudes and Longitude");
			return;
		}


	}
	else if((lattitude == "" || longitude == ""))
	{
		if( validateGps(markersListArray[0].gpsLongitude)  && validateGps(markersListArray[0].gpsLatitude))  
			myCenter = new google.maps.LatLng(markersListArray[0].gpsLatitude,markersListArray[0].gpsLongitude);
		else
		{
			myCenter = new google.maps.LatLng(20.5937,78.9629);
		}

	}
	else
		myCenter = new google.maps.LatLng(lattitude,longitude);



	var mapCanvas = document.getElementById("map");
	var mapOptions = "";
	if(gpsLongitude[index] != "" && gpsLatitude[index] != "" && typeof gpsLongitude[index] != 'undefined' && typeof gpsLatitude[index] != 'undefined')
		mapOptions = {
			center: myCenter, 
			zoom: 20,
			mapTypeId: google.maps.MapTypeId.ROADMAP};
	else
		mapOptions = {
			center: myCenter, 
			zoom: 5,
			mapTypeId: google.maps.MapTypeId.ROADMAP};


	var map = new google.maps.Map(mapCanvas,mapOptions);

	var infowindow = new google.maps.InfoWindow();
	var marker = "";


	var path = "";
	if(typeof index != "undefined")
		{
		//debugger;
		if(markersListArray[index].activeStatus === 'true')
			path = $("#contextPath").val()+"/images/location-pointer.png";
		else
			path = "";
		
		marker = new google.maps.Marker({
			position: new google.maps.LatLng(markersListArray[index].gpsLatitude,markersListArray[index].gpsLongitude),
			animation: google.maps.Animation.BOUNCE,
			icon :	path,
			map: map
		});
		var infowindow = new google.maps.InfoWindow()

		var content = location[index];
		google.maps.event.addListener(marker,'click', (function(marker,content,infowindow){ 
			return function() {
				infowindow.setContent(content);
				infowindow.open(map,marker);
			};
		})(marker,content,infowindow));  


		marker.setMap(map);

		
		}
	else
	for(var i=0;i<=markersListArray.length-1;i++)
	{
		if(markersListArray[i].activeStatus === 'true')
			path = $("#contextPath").val()+"/images/location-pointer.png";
		else
			path = "";

		if(gpsLatitude[index] == markersListArray[i].gpsLatitude && gpsLongitude[index] == markersListArray[i].gpsLongitude)
		{

			marker = new google.maps.Marker({
				position: new google.maps.LatLng(markersListArray[i].gpsLatitude,markersListArray[i].gpsLongitude),
				animation: google.maps.Animation.BOUNCE,
				icon :	path,
				map: map
			});
		}
		else
		{
			marker = new google.maps.Marker({
				position: new google.maps.LatLng(markersListArray[i].gpsLatitude,markersListArray[i].gpsLongitude),
				icon :	path,
				map: map
			});
		}


		var infowindow = new google.maps.InfoWindow()

		var content = markersListArray[i].location;
		google.maps.event.addListener(marker,'click', (function(marker,content,infowindow){ 
			return function() {
				infowindow.setContent(content);
				infowindow.open(map,marker);
			};
		})(marker,content,infowindow));  


		marker.setMap(map);

	}

	if(typeof index != "undefined")
	{
		//debugger;
		$('div').removeClass("activeMapSel");
		$(".enable"+index).addClass("activeMapSel");
		var headerStr = ' <div class="box-header"><h3 class="box-title" >'+storeName[index]+' </h3>'; 
		
		headerStr += "<img src='"+ $("#contextPath").val()+ "/images/cancel.png' class = 'divClose' onclick='removeDiv();' /></div>";
		
		
		var bodyStr = 
			"<b>Location : </b>"+location[index]+
			"<br><b>Email : </b>"+email[index]+ 
			"<br><b>Outlet Type : </b>"+outletType[index];
		if(activeStatus[index] === 'true')
			bodyStr += "<br><b>Status : </b>Opened";
		else
			bodyStr += "<br><b>Status : </b>Closed";

		bodyStr+="<br><b>Locality : </b>"+locality[index]+
//		"<br><b>Street : </b>"+street[index]+

		"<br><b>Latitude : </b>"+gpsLatitude[index]+
		"<br><b>Longitude : </b>"+gpsLongitude[index]+

		"<br><b>Contact No : </b>"+phone[index];

		$('#mapPopup').show();
		$('#mapPopup').html(headerStr+bodyStr);
		
		
		return;
	}


}


function removeDiv()
{
	$('#mapPopup').hide();

}

var gpsLocation;
function showPosition(position) {
	//debugger;

	lattitude = position.coords.latitude ;
	longitude = position.coords.longitude;
}


function validateGps(value)
{
	//debugger;
	var type = typeof  Number(value);
	if (typeof Number(value) == 'number')
	{
		if(Number(value) >= -180  && Number(value) <= 180)
			return true;
		else
			return false;
	}
	else
		return false;

}

function showError(error) {
	switch(error.code) {
	case error.PERMISSION_DENIED:
		alert("User denied the request for Geolocation.");
		break;
	case error.POSITION_UNAVAILABLE:
		alert("Location information is unavailable.");
		break;
	case error.TIMEOUT:
		alert("The request to get user location timed out.");
		break;
	case error.UNKNOWN_ERROR:
		alert("An unknown error occurred.");
		break;
	}
}


$("body").on("click", ".modal-dialog", function(e) {
	if ($(e.target).hasClass('modal-dialog')) {
		var hidePopup = $(e.target.parentElement).attr('id');
		$('#' + hidePopup).modal('hide');
	}
});

