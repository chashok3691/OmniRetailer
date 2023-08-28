function emptyProduct(){
	$("#searchItems").val("");
	$("#product").val("");
}

$(".clearError").on('input',function(e){
	$("#Error").html("");
});

$(".clearError").on('change',function(e){
	$("#Error").html("");
});
$(".calendar_icon").on('click',function(e){
	$("#Error").html("");
});
$(".calendar_icon").on('focus',function(e){
	$("#Error").html("");
});


function searchCustomerPurchases(searchName, searchCategory,index){
	var maxRecords = $("#maxRecords").val();
	if($("#startPrice").val() != "" && $("#endPrice").val() != ""){
		if(parseFloat($("#startPrice").val()) > parseFloat($("#endPrice").val())){
			$("#Error").html("Enter End Price greater than Start Price");
			return;
		}
	}
	if($("#fromDate").val() != "" && $("#endDate").val() != ""){
		 var noOfDays = daydiff(parseDate($('#fromDate').val()), parseDate($('#endDate').val()));
		 if(noOfDays < 0){
			$("#Error").html("Enter End Date greater than Start Date");
			return;
		 }
	}
	var formData = getFormData('',index,maxRecords,searchName);
	var contextPath = $("#contextPath").val();
	URL = contextPath + "/crm/getCustomerPurchases.do";
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
        		$('#customerTable').html(result);
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


function getCustomerPurchases(index){
	 if($("#searchCustomers").length > 0 && $("#searchCustomers").val().trim() != ""){
		 searchCustomerPurchases($("#searchCustomers").val(), 'searchCustomers',index);
		 return;
	 }
	var maxRecords = $("#maxRecords").val();
	if($("#startPrice").val() != "" && $("#endPrice").val() != ""){
		if(parseFloat($("#startPrice").val()) > parseFloat($("#endPrice").val())){
			$("#Error").html("Enter End Price greater than Start Price");
			return;
		}
	}
	
	 if(parseInt($("#city").val().length)>30){
		 $("#city").focus();
		 $("#Error").html("City can't exceeds 30 Characters");
			return;
	  }else{
	    $("#Error").html(" ");
      }
	
	 
	if($("#fromDate").val() != "" && $("#endDate").val() != ""){
		 var noOfDays = daydiff(parseDate($('#fromDate').val()), parseDate($('#endDate').val()));
		 if(noOfDays < 0){
//			$("#Error").html("Enter End Date greater than Start Date");
			 alert("End Date can't be less than Start Date");
			return;
		 }
		
		/* else if(noOfDays > 31){
 			 alert("Date Range should not be more than month");
 			 return;
 		 }	*/
		 
	}
	if(index == "save")
		$("#saveflag").val("true");
	var formData = getFormData('',index,maxRecords,'');
	var contextPath = $("#contextPath").val();
	URL = contextPath + "/crm/getCustomerPurchases.do";
	 $.ajax({
			type: "POST",
			url : URL,
			contentType : "application/json",
			data : formData,
			beforeSend: function(xhr){                    
   				$("#loadingreport").css("display","block");
   				$("#mainDiv").addClass("disabled");
	        },
			success : function(result) {
        		$('#customerTable').html(result);
        		$("#loadingreport").css("display","none");
        		 var anchor = document.createElement('a');
				  anchor.href = $("#customerurl").val();
				  anchor.target = '_blank';
				  anchor.download = '';
				if($("#customerurl").val()!=null && $("#customerurl").val()!='')
				  anchor.click();
				$("#saveflag").val("false");
        		
    			$("#mainDiv").removeClass('disabled');

			},
			error : function() {
				alert("something went wrong");
				$("#loadingreport").css("display","none");
    			$("#mainDiv").removeClass('disabled');

			}
		});
}

function getFormData(message,index,maxRecords,searchName){
	debugger
	var country = $("#country").val();
	var region = $("#states").val();
	var city = $("#city").val();
	var customerType = $("#customerType").val();
	var age = $("#age").val();
	var gender = $("#gender").val();
	var productCategory = $("#productCategory").val();
	var fromDate = $("#fromDate").val();
	var product = $("#product").val();
	var endDate = $("#endDate").val();
//	var priceRange = $("#priceRange").val();
	var purchaseChannel = $("#purchaseChannel").val();
	var finalObj = {};
	if(country.trim() != "Select Country")
		finalObj.country = country;
	if(region.trim() != "Select State")
		finalObj.state = region;
	if(city.trim() != "")
		finalObj.city = city;
	if(customerType.trim() != "-- Select --")
		finalObj.category = customerType;
	if(age.trim() != "-- Select --")
		finalObj.age = age;
	if(gender.trim() != "-- Select --")
		finalObj.gender = gender;
	if(productCategory != null && productCategory != undefined && productCategory.trim() != "-- Select --")
		finalObj.productCategory = productCategory;
	if(product.trim() != "-- Select --")
		finalObj.productName = product;
//	if(priceRange.trim() != "-- Select --")
	finalObj.priceRangeStartAmount = $("#startPrice").val();
	finalObj.priceRangeEndAmount = $("#endPrice").val();
	
	 var dateTime = getCurrentDate();
  	 var date = dateTime.split(' ');
  		 date = date[0].split('/');
  	 var formatedDate = date[1]+"/"+date[0]+"/"+date[2];
  	 
  	if(fromDate == "" || fromDate == null || fromDate == undefined){
  		$("#fromDate").val(formatedDate);
  		fromDate = formatedDate;
  	 }
  	if(endDate == "" || endDate == null || endDate == undefined){
  		$("#endDate").val(formatedDate);
  		endDate = formatedDate;
  	 }
  	
	finalObj.startDateStr = fromDate;
	finalObj.endDateStr = endDate;
	
	finalObj.storeLocation = $("#location").val();
	finalObj.zoneID = $("#outletZone").val();
	
	if(purchaseChannel.trim() != "-- Select --")
		finalObj.purchaseChannel = purchaseChannel;
	if(message != "")
		finalObj.message = $("#notificationMsg").val();
	if(index == undefined || index == "" || index == "save")
		index = 0;
	finalObj.startIndex = index;
	if(maxRecords == undefined || maxRecords == "")
		maxRecords = 10;
	finalObj.maxRecords = maxRecords;
	
	var saveCustomer = $("#saveflag").val();
	finalObj.saveCustomer = saveCustomer;
	
	console.log(finalObj.saveCustomer)
	
	finalObj.searchCriteria = searchName;
	var formData = JSON.stringify(finalObj);
	return formData;
}



function getVistitFormData(message,index,maxRecords,searchName){
	var country = $("#country").val();
	var region = $("#states").val();
	var city = $("#city").val();
	var customerType = $("#customerType").val();
	var age = $("#age").val();
	var gender = $("#gender").val();
	var productCategory = $("#productCategory").val();
	var fromDate = $("#fromDate").val();
	var product = $("#product").val();
	var endDate = $("#endDate").val();
//	var priceRange = $("#priceRange").val();
	var purchaseChannel = $("#purchaseChannel").val();
	var finalObj = {};
	if(country.trim() != "Select Country")
		finalObj.country = country;
	if(region.trim() != "Select State")
		finalObj.state = region;
	if(city.trim() != "")
		finalObj.city = city;
	if(customerType.trim() != "-- Select --")
		finalObj.category = customerType;
	if(age.trim() != "-- Select --")
		finalObj.age = age;
	if(gender.trim() != "-- Select --")
		finalObj.gender = gender;
	if(productCategory.trim() != "-- Select --")
		finalObj.productCategory = productCategory;
	if(product.trim() != "-- Select --")
		finalObj.productName = product;
//	if(priceRange.trim() != "-- Select --")
	finalObj.priceRangeStartAmount = $("#startPrice").val();
	finalObj.priceRangeEndAmount = $("#endPrice").val();
	finalObj.startDateStr = fromDate;
	finalObj.endDateStr = endDate;
	
	finalObj.storeLocation = $("#location").val();
	finalObj.zoneID = $("#outletZone").val();
	
	if(purchaseChannel.trim() != "-- Select --")
		finalObj.purchaseChannel = purchaseChannel;
	if(message != "")
		finalObj.message = $("#notificationMsg").val();
	if(index == undefined || index == "" || index == "save")
		index = 0;
	finalObj.startIndex = index;
	if(maxRecords == undefined || maxRecords == "")
		maxRecords = 10;
	finalObj.maxRecords = maxRecords;
	
	var saveCustomer = $("#saveflag").val();
	finalObj.saveCustomer = saveCustomer;
	
	console.log(finalObj.saveCustomer)
	
	finalObj.searchCriteria = searchName;
	var formData = JSON.stringify(finalObj);
	return formData;
}


function searchProductsBasedOnCategory(name,searchCategory){
	 var contextPath = $("#contextPath").val();
	 var productCategory = "";
	 if ($("#productCategory").val() != "-- Select --")
	 	productCategory = $("#productCategory").val();
	 /*if (productCategory.trim() == "-- Select --"){
		 alert("Please Select a Product Category");
		 return;
	 }*/
//	 URL = contextPath + "/inventorymanager/searchProductsBasedOnCategory.do";
	 URL = contextPath + "/inventorymanager/searchProductsBasedOnCategory.do";
	 $.ajax({
			type: "GET",
			url : URL,
			data : {
				searchName : name,
				productCategory : productCategory
			},
			beforeSend: function(xhr){                    
	   	   		$("#loading").css("display","block");
	   	   		$("#mainDiv").addClass("disabled");
	   	   	},
			success : function(result) {
				appendProducts(result,searchCategory);
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


function appendProducts(productsList,searchCategory){
	 $("."+searchCategory).html('');
	 var op = '';
	 for(var i=0;i<productsList.length;i++){
			 if (i == 0) {
				 op += '<li id="'+productsList[i].skuID+'"  class="selected" onclick=getId(this,"'+searchCategory+'"); ><a>'+productsList[i].productName+'</a></li>';
			}else
			     op += '<li id="'+productsList[i].skuID+'" onclick=getId(this,"'+searchCategory+'"); ><a>'+productsList[i].productName+'</a></li>';
	 }
	 $("."+searchCategory).html(op);
	 $("."+searchCategory).show();
}


function getId(element,type){
	var id= $(element).attr("id");
	var productName =  $("#"+id).children("a").text();
//	$("#product").val(productName);
	$("#product").val(id);
	$("#searchItems").val(productName);
	 $(".services").hide();
	 $("."+type).html("");
}

function resetForm(){
	$("#country").prop('selectedIndex',0);
	$("#states").html("");
	var op ='<option value="Select State" >Select State</option>';
	$("#states").append(op);
	$("#city").val("");
	$("#customerType").val("-- Select --");
	$("#age").val("-- Select --");
	$("#gender").val("-- Select --");
	$("#productCategory").val("-- Select --");
	$("#fromDate").val("");
	$("#searchItems").val("");
	$("#product").val("");
	$("#endDate").val("");
	$("#fromDate").html("");
	$("#startPrice").val("");
	$("#endPrice").val("");
//	$("#priceRange").val("-- Select --");
	$("#purchaseChannel").val("-- Select --");
}


function getCustomerPurchaseDetails(phoneNo,index){
	 var maxRecords = "10";
	 if($("#myModal").css("display") == "block")
		 if($("#purchaseMaxRecords").length > 0)
			 maxRecords = $("#purchaseMaxRecords").val();
	 var startDate = "";
	 var endDate = "";
	 if($("#myModal").css("display") == "block")
		 if($("#from").length > 0 && $("#to").length > 0){
			 if($("#from").val() != "" && $("#to").val() != ""){
				var noOfDays = daydiff(parseDate($('#from').val()), parseDate($('#to').val()));
				 if(noOfDays < 0){
					 alert("Start Date can't be less than End Date");
					 return;
				 }
				 startDate = $("#from").val() + " 00:00:00";
				 endDate = $("#to").val() + " 00:00:00";
			 }else if($("#from").val() != "")
				 startDate = $("#from").val() + " 00:00:00";
			 else if($("#to").val() != "")
				endDate = $("#to").val() + " 00:00:00";
		 }
	 //debugger
	 var searchName = "";
	 if($("#myModal").css("display") == "block")
		 if($("#searchPurchases").length > 0){
			 searchName = $("#searchPurchases").val();
			 if(searchName.length == 1 || searchName.length == 2)
				 return;
		 }
	 var contextPath = $("#contextPath").val();
	 URL = contextPath + "/crm/getCustomerPurchaseDetails.do";
	 $.ajax({
			type: "GET",
			url : URL,
			data : {
				phoneNumber : phoneNo,
				index : index,
				maxRecords : maxRecords,
				startDate : startDate,
				endDate : endDate,
				searchName : searchName
			},
			beforeSend: function(xhr){                    
				$("#loading").css("display","block");
				$("#mainDiv").addClass("disabled");
			},
			success : function(result) {
				$("#purchaseDetails").html(result);
				if($("#myModal").css("display") == "none"){
					var  op = '<a id="purchase"  data-toggle="modal" data-target="#myModal"></a>';
					$("#triggerEvent").append(op);
					$("#purchase" ).trigger( "click" );
					$("#triggerEvent").html("");
				}
//				appendPurchases(result);
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

function appendPurchases(purchasesList){
		$("#example2 tbody").html("");
		for(var i=0; i<purchasesList.length; i++){
				var row = '<tr id=dynamicDiv'+i+'><td>'+purchasesList[i].billId+'</td><td>'+purchasesList[i].sku_id+'</td><td>'+purchasesList[i].item_name+'</td><td>'+purchasesList[i].quantity+'</td><td>'+purchasesList[i].item_total_price+'</td></tr>';
				$("#example2 tbody").append(row);
		}
		var  op = '<a id="purchase"  data-toggle="modal" data-target="#myModal"></a>';
		 $("#triggerEvent").append(op);
		 $("#purchase" ).trigger( "click" );
		 $("#triggerEvent").html("");
	}


