<!DOCTYPE html>
<html>
  <head>
    <meta name="viewport" content="initial-scale=1.0, user-scalable=no">
    <meta charset="utf-8">
    <title>Places Searchbox</title>
    <style>
      html, body {
        height: 100%;
        margin: 0;
        padding: 0;
      }
      #map {
        height: 100%;
            position: initial !important;
    overflow: visible !important;
    transform: initial !important;
    background-color: rgb(229, 227, 223) !important;
        
      }
      .controls {
        margin-top: 10px;
        border: 1px solid transparent;
        border-radius: 2px 0 0 2px;
        box-sizing: border-box;
        -moz-box-sizing: border-box;
        height: 32px;
        outline: none;
        box-shadow: 0 2px 6px rgba(0, 0, 0, 0.3);
      }

      #pac-input {
/*       background-color: #fff;
    font-family: Roboto;
    font-size: 15px;
    font-weight: 300;
    margin-left: 0px;
    padding: 0 3px 0 9px;
    text-overflow: ellipsis;
    width: 100%;
    z-index: 999 !important;
    position: relative !important;
    border: 1px solid grey;
    margin-top: 0px;
    overflow: visible;
    border-radius: 3px;
    height: 32px !important;
    margin-bottom: 20px !important; */
      }

      #pac-input:focus {
        border-color: #4d90fe;
      }

      .pac-container {
        font-family: Roboto;
      }

      #type-selector {
        color: #fff;
        background-color: #4d90fe;
        padding: 5px 11px 0px 11px;
      }

      #type-selector label {
        font-family: Roboto;
        font-size: 13px;
        font-weight: 300;
      }
      #target {
        width: 345px;
      }
      .gm-style{
      height: 137% !important;
      }
    </style>
  </head>
  <body>
    
    <script>
   
      // This example adds a search box to a map, using the Google Place Autocomplete
      // feature. People can enter geographical searches. The search box will return a
      // pick list containing a mix of places and predicted search terms.

      // This example requires the Places library. Include the libraries=places
      // parameter when you first load the API. For example:
      // <script src="https://maps.googleapis.com/maps/api/js?key=YOUR_API_KEY&libraries=places">

      function initAutocomplete() {
    	  var markers = [];
    	  
        /*  var map = new google.maps.Map(document.getElementById('map'), {
          center: {lat: -33.8688, lng: 151.2195},
          zoom: 13,
          mapTypeId: google.maps.MapTypeId.ROADMAP
        });  */

        // Create the search box and link it to the UI element.
       var input = document.getElementById('pac-input');
        
        var input1 = document.getElementById('landMark');
        //var input = document.getElementById('street');
       // alert(input.value.length);
        //var input = $("#pac-input").val();
       
       /*  if( input.value.length!='0'){
        	var city = $("#city").val();
        	input+=","+city;
        	alert(input);
        }  
          */
          var southWest = new google.maps.LatLng( -37.904116, 144.907608 );
          var northEast = new google.maps.LatLng( -37.785368, 145.067425 );
          var hyderabadBounds = new google.maps.LatLngBounds( southWest, northEast );
          var options = {
        		  componentRestrictions: {country: 'in'}
        		};
          
          
         // var searchBox = new google.maps.places.SearchBox(input);
          var searchBox = new google.maps.places.SearchBox(input);
          var searchBox1 = new google.maps.places.Autocomplete(input1,options);
        //var searchBox = new google.maps.places.Autocomplete(input,options);
   
        var result = searchBox1.getPlace();
       /*  console.info(result); // take a look at this result object
        console.info(result.address_components);  */
      /*   map.controls[google.maps.ControlPosition.TOP_LEFT].push(input); */
       

        // Bias the SearchBox results towards current map's viewport.
       /*  map.addListener('bounds_changed', function() {
          searchBox.setBounds(map.getBounds());
        }); */

        var markers = [];
        // Listen for the event fired when the user selects a prediction and retrieve
        // more details for that place.
        searchBox.addListener('places_changed', function() {
        
          var places = searchBox.getPlaces();
          console.info(JSON.stringify(places));
          if (places.length == 0) {
            return;
          }

          // Clear out the old markers.
          markers.forEach(function(marker) {
            marker.setMap(null);
          });
          markers = [];

          // For each place, get the icon, name and location.
          var bounds = new google.maps.LatLngBounds();
          places.forEach(function(place) {
        	
        	  console.info(JSON.stringify(place));
        	  data=JSON.parse(JSON.stringify(place));
        	  $('#mapid').html("");
              $('#mapid').append(data.adr_address);  
            
  				$("#landMark").val($(".street-address").text())
       		 	$("#pac-input").val($(".extended-address").text())
  		   		$("#city").val($(".locality").text())
                  $("#lat").val($(".lat").text());
        	  $("#lng").val($(".lng").text());
       			//Do whatever you want with htmlDoc.getElementsByTagName('a');
       			
        	  $("#lat").val(JSON.stringify(data.geometry.location.lat));
        	  $("#lng").val(JSON.stringify(data.geometry.location.lng));
        	  getShippmentprice(this)
        	  marker.setMap(null);
        /*     var icon = {
              url: place.icon,
              size: new google.maps.Size(0, 0),
              origin: new google.maps.Point(0, 0),
              anchor: new google.maps.Point(17, 34),
              scaledSize: new google.maps.Size(25, 25)
            }; */

            // Create a marker for each place.
         /*    markers.push(new google.maps.Marker({
            	
              map: map,
              icon: icon,
              title: place.name,
              position: place.geometry.location
            })); */

            /* if (place.geometry.viewport) {
              // Only geocodes have viewport.
              bounds.union(place.geometry.viewport);
            } else {
              bounds.extend(place.geometry.location);
            } */
          });
          /* map.fitBounds(bounds); */
        });
      //  marker.setMap(null);
      }

    </script>
    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDHNN78JQSuDoLAZigF4cTbHgyeduFpVn8&libraries=places&callback=initAutocomplete"
         async defer></script>
<div id="mapid" style="    display: none;"></div>
  </body>
</html>