
$(function() {
	var ladgeLevels = $("#lodgingFloor").val();
	//alert(ladgeLevels);
	var ladgeLevel = ladgeLevels.split(",");
	var ladgeLevelOption = '';
	for(var i=0;i<ladgeLevel.length;i++){
		ladgeLevelOption = ladgeLevelOption+'<option value="'+ladgeLevel[i]+'">'+ladgeLevel[i]+'</option>'; 		
	}
	//$("#slot_id").append(ladgeLevelOption);
	
	
});


function searchRestaurantBookingIds(name, searchCategory){
	 var contextPath = $("#contextPath").val();
	 URL = contextPath + "/inventorymanager/searchRestaurantBookingIds.do";
//	 URL = contextPath + "/inventorymanager/searchSuppliers.do";
	 $.ajax({
			type: "GET",
			url : URL,
			data : {
				searchName : name
			},
			beforeSend: function(xhr){                    
  	   			$("#loading").css("display","block");
  	   			$("#mainDiv").addClass("disabled");
  	   		  },
			success : function(result) {
				if(result == null || result == "")
					alert("Entered Booking Id doesn't exist");
				appendBookingIds(result, searchCategory);
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

function appendBookingIds(suppliersList, searchCategory){
	 $("."+searchCategory).html('');
	 var op = '';
	 for(var i=0;i<suppliersList.length;i++){
		 
		 if (i == 0) {
			 //alert(suppliersList[i].suppliersList[i].orderReference);
			 op += '<li id="'+suppliersList[i].orderReference+'"  class="selected" onclick=getCode(this,"'+searchCategory+'"); ><a>'+suppliersList[i].orderReference+'</a></li>';
		}else
			//alert(suppliersList[i].suppliersList[i].orderReference);
			 op += '<li id="'+suppliersList[i].orderReference+'" onclick=getCode(this,"'+searchCategory+'"); ><a>'+suppliersList[i].orderReference+'</a></li>';
	 }
	 $("."+searchCategory).html(op);
	 $("."+searchCategory).show();
	 
}

/*function appendBookingIds(suppliersList, searchCategory){
	 $("."+searchCategory).html('');
	 var op = '';
	 for(var i=0;i<suppliersList.length;i++){
		 
		 if (i == 0) {
			 op += '<li id="'+suppliersList[i].bookingId+'"  class="selected" onclick=getCode(this,"'+searchCategory+'"); ><a>'+suppliersList[i].bookingId+'</a></li>';
		}else
			 op += '<li id="'+suppliersList[i].bookingId+'" onclick=getCode(this,"'+searchCategory+'"); ><a>'+suppliersList[i].bookingId+'</a></li>';
	 }
	 $("."+searchCategory).html(op);
	 $("."+searchCategory).show();
}*/
function getCode(element,type){
	var id= $(element).attr("id");
//	$("#supplier_Id").val(id);
	$("#searchItems").val(id);
	var label = $(element).children("a").text();
	console.info("label : "+label);
	$("#searchItems").val(label);
	 $(".services").hide();
	 $("."+type).html("");
	 //alert(label);
	 viewRestaurantBookingsByFilter(0,label);
}
/*

$("#searchSupplier").keydown(function(e){
	$("#supplierNameError").html("");
	if($("#searchSupplier").val().length<3){
		$("#supplier_Id").val("");
	}
	$(".supplier").children("li").each(function(){
		var supplierName = $(this).children("a").text().trim();
		if($("#searchSupplier").val().trim().toLowerCase() == supplierName.toLowerCase()){
			$("#searchSupplier").val($("#searchSupplier").val().trim());
			$("#supplier_Id").val($(this).attr("id"));
			 $(".services").hide();
			 $(".matchedStringUl").html("");
			return;
		}
		else{
			$("#supplier_Id").val("");
		}
	});
	if(e.keyCode == 9){
		if($("#searchSupplier").val()!="" && $("#supplier_Id").val() == ""){
			 $("#supplierNameError").html("Supplier Name doesn't exist");
		 }
		 $(".services").hide();
		 $(".matchedStringUl").html("");
	}
});

*/


/**
 * 
 * 
 * @param index
 */
function viewRestaurantBookingsByFilter(index,bookingId){
	var level = "";
	var location = null;
	var startDate = null;
	var endDate = null;
	var slot = null;
	if (bookingId == "") {
		bookingId = $("#searchItems").val();
	}
	
	if ($("#restaurantStartDate1").val() == "" || $("#restaurantStartDate1").val() == undefined) {
		startDate = "";
	}else {
		startDate = $("#restaurantStartDate1").val() ;
		if (startDate > endDate) {
			alert("Start Date  should be Less than the End Date");
			$("#restaurantStartDate1").val('');
			return false;
		}
		
	}
	
	if ($("#restaurantEndDate1").val() == "" || $("#restaurantEndDate1").val() == undefined) {
		endDate = "";
		
	}else {
		endDate = $("#restaurantEndDate1").val() ;
		if (startDate > endDate) {
			alert("End Date  should be greater than  Start Date");
			$("#restaurantEndDate1").val('');
			return false;
		}
	}
	
	if ($("#slot_id").val().trim() == "Filter By Slot") {
		slot = "";
	}else {
		slot = $("#slot_id").val() ;
		
	}
		
	if(   $("#locationList :selected").text().trim() == "Filter By Location"){
		location = "";
	}else{
		location = $("#locationList :selected").text()
		if (location == "Filter By Location") {
			location = "";
		}
	}
	
	
	
	console.info("viewBookings>>> " +location+" : "+level+"  :  "+startDate+"  :  "+endDate+" : "+bookingId+" : "+slot);
	 var contextPath = $('#contextPath').val();
	// alert("calling");
	   var URL = contextPath + "/inventorymanager/viewRestaurantBookings.do";
	  $.ajax({
		url : URL,
		data : {
				location:location,
				level : level,
				startDate : startDate,
				endDate : endDate,
				index: index,
				bookingId : bookingId,
				slot : slot,
				orderType :""
			},
		beforeSend: function(xhr){                    
   				$("#loading").css("display","block");
   				$("#mainDiv").addClass("disabled");
   				
	        },

		success : function(result){
			$("#right-side").html(result);
			$("#restaurantStartDate1").val(startDate);
			$("#restaurantEndDate1").val(endDate);
			$("#searchItems").val(bookingId);
			 $("#locationList option").each(function(i){
			        if ($(this).text().trim() == location.trim()) {
			        	//alert($(this).text() + " : " + $(this).val());
			        	$(this).attr('selected','selected');
					}
			    });
			 $("#slot_id option").each(function(i){
			        if ($(this).val().trim() == slot.trim()) {
				        //alert($(this).val() + " : " + $(this).val());
			        	$(this).attr('selected','selected');
					}
			    });
				
			//activeMenu(id);
			$("#loading").css("display","none");
			$("#mainDiv").removeClass('disabled');
		},
		error : function(){
			alert("Something went wrong");
		  $("#loading").css("display","none");
			   $("#mainDiv").removeClass('disabled');

		}
	 });
}
