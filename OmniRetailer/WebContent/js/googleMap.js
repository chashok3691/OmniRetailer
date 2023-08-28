      function initAutocomplete() {
//    	  var markers = [];
    	  var input = document.getElementById('street');
//    	  var input1 = document.getElementById('landMark');
          var southWest = new google.maps.LatLng( -37.904116, 144.907608 );
          var northEast = new google.maps.LatLng( -37.785368, 145.067425 );
          var hyderabadBounds = new google.maps.LatLngBounds( southWest, northEast );
          var options = {
        		  componentRestrictions: {country: 'in'}
        		};
          var searchBox = new google.maps.places.SearchBox(input);
//          var searchBox1 = new google.maps.places.Autocomplete(input1,options);
//          var result = searchBox1.getPlace();
          var markers = [];
          searchBox.addListener('places_changed', function() {
          var places = searchBox.getPlaces();
//          console.info(JSON.stringify(places));
          if (places.length == 0) {
            return;
          }
          markers.forEach(function(marker) {
            marker.setMap(null);
          });
          markers = [];
          var bounds = new google.maps.LatLngBounds();
          places.forEach(function(place) {
//        	  console.info(JSON.stringify(place));
        	  data=JSON.parse(JSON.stringify(place));
        	  $('#mapid').html("");
              $('#mapid').append(data.adr_address);  
  				$(".street-class").val($(".street-address").text())
       		 	$(".locality-class").val($(".extended-address").text())
  		   		$(".city-class").val($(".locality").text())
  		   		$(".state-class").val($(".region").text())
       		 	$(".zip-code-class").val($(".postal-code").text())
  		   		$(".country-class").val($(".country-name").text())
                $(".latitude-class").val($(".lat").text());
  				$(".longitude-class").val($(".lng").text());
        	  $("#latitude").val(JSON.stringify(data.geometry.location.lat));
        	  $("#longitude").val(JSON.stringify(data.geometry.location.lng));
//        	  marker.setMap(null);
          });
        });
      }
