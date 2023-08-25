function activateHeader(id){
	$(".subBlock").each(function() {
		$(this).slideUp("slow");
	});
	var headerImg = $("#"+id+"Img").attr("src");
	var subBlockOpened = false;
	 if(headerImg.indexOf('right')!= -1){
		 subBlockOpened = true; 
	 }
	 var contextPath = $("#contextPath").val();
	 var img = contextPath+"/images/leftHeaderIconGreen.png";
	 $(".headerImg").each(function() {
		$(this).attr("src",img); 
	 });
	 if(subBlockOpened == true){
		 return;
	 }
	 $("#"+id+"Img").attr("src",contextPath+"/images/rightHeaderIconGreen.png");
	 $("."+id).slideDown("slow");
}

$("#greetingBatch").keydown(function(e){
	var batchName = $("#greetingBatch").val();
	if(e.keyCode == 9 || e.keyCode == 13){
		$(".greeting").hide();
		return;
	}
	$("#greetingBatchError").html("");
	resetForm();
	clearGreetings();
	$("#greetingBatch").val(batchName);
});

$("#campaignBatch").keydown(function(e){
	var batchName = $("#campaignBatch").val();
	if(e.keyCode == 9 || e.keyCode == 13){
		$(".campaign").hide();
		return;
	}
	$("#campaignBatchError").html("");
	resetForm();
	clearCampaigns();
	$("#campaignBatch").val(batchName);
});

$("#arrivalBatch").keydown(function(e){
	var batchName = $("#arrivalBatch").val();
	if(e.keyCode == 9 || e.keyCode == 13){
		$(".arrival").hide();
		return;
	}
	$("#arrivalBatchError").html("");
	resetForm();
	clearArrivals();
	$("#arrivalBatch").val(batchName);
});

$("#outletBatch").keydown(function(e){
	var batchName = $("#outletBatch").val();
	if(e.keyCode == 9 || e.keyCode == 13){
		$(".outlet").hide();
		return;
	}
	$("#outletBatchError").html("");
	resetForm();
	clearOutlets();
	$("#outletBatch").val(batchName);
});


function saveGreetingsNotification(notify) {
	if(notify == undefined)
		if($("#greetingBatch").val().trim() == ""){
			$("#greetingBatchError").html("Package Name is Required");
			return;
		}
	var option = $("input[type='radio'][name='greetingsOption']:checked").val();
	var finalObj = getFormData();
	finalObj.notificationType = option;
	finalObj.batchName = $("#greetingBatch").val().trim();
	finalObj.enable = $("#greetingEnabled").prop("checked");
	finalObj.notificationCategory = "greeting";
	var flag = false;
	if($("#birthdayMsg").val().trim() != "" && option == "sms"){
		finalObj.birthDayEnable = $("#birthdayEnabled").prop("checked");
		finalObj.birthDayMessage = $("#birthdayMsg").val().trim();
		flag = true;
	}
	if($("#birthdayMailMsg").val().trim() != "" && (option == "all" || option == "mail")){
		finalObj.birthDayEnable = $("#birthdayEnabled").prop("checked");
		finalObj.birthDaySubject = $("#birthdayMailSub").val().trim();
		finalObj.birthDayMessage = $("#birthdayMailMsg").val().trim();
		flag = true;
	}
	if($("#marriagedayMsg").val().trim() != "" && option == "sms"){
		finalObj.marriageDayEnable = $("#marriagedayEnabled").prop("checked");
		finalObj.marriageDayMessage = $("#marriagedayMsg").val().trim();
		flag = true;
	}
	if($("#marriagedayMailMsg").val().trim() != "" && (option == "all" || option == "mail")){
		finalObj.marriageDayEnable = $("#marriagedayEnabled").prop("checked");
		finalObj.marriageDaySubject = $("#marriagedayMailSub").val().trim();
		finalObj.marriageDayMessage = $("#marriagedayMailMsg").val().trim();
		flag = true;
	}
	if($("#festivalMsg").val().trim() != "" && option == "sms"){
		finalObj.festivalEnable = $("#festivalEnabled").prop("checked");
		finalObj.festivalMessage = $("#festivalMsg").val().trim();
		finalObj.calendarType = $("#calendarType").val();
		flag = true;
	}
	if($("#festivalMailMsg").val().trim() != "" && (option == "all" || option == "mail")){
		finalObj.festivalEnable = $("#festivalEnabled").prop("checked");
		finalObj.festivalSubject = $("#festivalMailSub").val().trim();
		finalObj.festivalMessage = $("#festivalMailMsg").val().trim();
		finalObj.calendarType = $("#calendarType").val();
		flag = true;
	}
	if(flag == false){
		$("#Error").html("Please Add Atleast One Message");
		return;
	}
	if(notify != undefined && notify != "")
		finalObj.notify = "true";
	else
		finalObj.notify = "false";
	var formData = JSON.stringify(finalObj);
	var contextPath = $("#contextPath").val();
	URL = contextPath + "/crm/createNotificationPackage.do";
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
			messageStatus= JSON.stringify(result);
			var parsed_json = JSON.parse(messageStatus);
			var msg = parsed_json.msg;
			if(msg != undefined && msg !=""){
				$("#Error").html(msg);
			}
			var batchName = parsed_json.batchName;
			var flag = false;
			if(batchName != undefined && batchName !=""){
				$(".greetingPackageName").each(function(){
					if($(this).text() == batchName)
						flag = true;
				});
			}
			if(flag == false){
				var batchId = batchName.replace(/ /g,'');	
				var op = '<li id="'+batchId+'greeting"  onclick="getCode(this,'+"'"+'greeting'+"'"+');" ><a class="greetingPackageName">'+batchName+'</a></li>';
				$(".greeting").append(op);
			}
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


function saveNewArrival(notify) {
	if(notify == undefined)
	if($("#arrivalBatch").val().trim() == ""){
		$("#arrivalBatchError").html("Package Name is Required");
		return;
	}
	var option = $("input[type='radio'][name='arrivalOption']:checked").val();
	var finalObj = getFormData();
	finalObj.notificationType = option;
	finalObj.batchName = $("#arrivalBatch").val().trim();
//	finalObj.enable = $("#arrivalEnabled").prop("checked");
	finalObj.notificationCategory = "arrival";
	finalObj.notificationSubCategory = "arrival";
	var flag = false;
	if($("#arrivalMsg").val().trim() != "" && option == "sms"){
		finalObj.newArrivalMessage = $("#arrivalMsg").val().trim();
		flag = true;
	}
	if($("#arrivalMailMsg").val().trim() != "" && (option == "all" || option == "mail")){
		finalObj.newArrivalSubject = $("#arrivalMailSub").val().trim();
		finalObj.newArrivalMessage = $("#arrivalMailMsg").val().trim();
		flag = true;
	}
	if(flag == true){
		finalObj.eventEndDateStr = $("#arrivalEndDate").val().trim()+" 00:00:00";
		finalObj.periodInDays = $("#arrivalDays").val().trim();
		finalObj.periodInHours = $("#arrivalHours").val().trim();
	}
	if(flag == false){
		$("#Error").html("Please Add Atleast One Message for the batch");
		return;
	}
	if(notify != undefined && notify != "")
		finalObj.notify = "true";
	else
		finalObj.notify = "false";
	var formData = JSON.stringify(finalObj);
//	console.log(formData);
	var contextPath = $("#contextPath").val();
	URL = contextPath + "/crm/createNotificationPackage.do";
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
			messageStatus= JSON.stringify(result);
			var parsed_json = JSON.parse(messageStatus);
			var msg = parsed_json.msg;
			if(msg != undefined && msg !=""){
				$("#Error").html(msg);
			}
			var batchName = parsed_json.batchName;
			var flag = false;
			if(batchName != undefined && batchName !=""){
				$(".arrivalPackageName").each(function(){
					if($(this).text() == batchName)
						flag = true;
				});
			}
			if(flag == false){
				var batchId = batchName.replace(/ /g,'');	
				var op = '<li id="'+batchId+'arrival"  onclick="getCode(this,'+"'"+'arrival'+"'"+');" ><a class="arrivalPackageName">'+batchName+'</a></li>';
				$(".arrival").append(op);
			}
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

function saveOutlet(notify) {
	if(notify == undefined)
	if($("#outletBatch").val().trim() == ""){
		$("#outletBatchError").html("Package Name is Required");
		return;
	}
	var option = $("input[type='radio'][name='outletOption']:checked").val();
	var finalObj = getFormData();
	finalObj.notificationType = option;
	finalObj.batchName = $("#outletBatch").val().trim();
//	finalObj.enable = $("#arrivalEnabled").prop("checked");
	finalObj.notificationCategory = "outlet";
	finalObj.notificationSubCategory = "outlet";
	var flag = false;
	if($("#outletMsg").val().trim() != "" && option == "sms"){
		finalObj.outletMessage = $("#outletMsg").val().trim();
		flag = true;
	}
	if($("#outletMailMsg").val().trim() != "" && (option == "all" || option == "mail")){
		finalObj.outletSubject = $("#outletMailSub").val().trim();
		finalObj.outletMessage = $("#outletMailMsg").val().trim();
		flag = true;
	}
	if(flag == true){
		finalObj.eventEndDateStr = $("#outletEndDate").val().trim()+" 00:00:00";
		finalObj.periodInDays = $("#outletDays").val().trim();
		finalObj.periodInHours = $("#outletHours").val().trim();
	}
	if(flag == false){
		$("#Error").html("Please Add Atleast One Message for the batch");
		return;
	}
	if(notify != undefined && notify != "")
		finalObj.notify = "true";
	else
		finalObj.notify = "false";
	var formData = JSON.stringify(finalObj);
	var contextPath = $("#contextPath").val();
	URL = contextPath + "/crm/createNotificationPackage.do";
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
			messageStatus= JSON.stringify(result);
			var parsed_json = JSON.parse(messageStatus);
			var msg = parsed_json.msg;
			if(msg != undefined && msg !=""){
				$("#Error").html(msg);
			}
			var batchName = parsed_json.batchName;
			var flag = false;
			if(batchName != undefined && batchName !=""){
				$(".outletPackageName").each(function(){
					if($(this).text() == batchName)
						flag = true;
				});
			}
			if(flag == false){
				var batchId = batchName.replace(/ /g,'');	
				var op = '<li id="'+batchId+'outlet"  onclick="getCode(this,'+"'"+'outlet'+"'"+');" ><a class="outletPackageName">'+batchName+'</a></li>';
				$(".outlet").append(op);
			}
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


$("#greetingBatch").click(function(){
	$(".greeting").show();
	return false;
});

$("#campaignBatch").click(function(){
	$(".campaign").show();
	return false;
});

$("#arrivalBatch").click(function(){
	$(".arrival").show();
	return false;
});

$("#outletBatch").click(function(){
	$(".outlet").show();
	return false;
});

function getFormData(){
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
	var priceRange = $("#priceRange").val();
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
	if(priceRange.trim() != "-- Select --")
		finalObj.priceRange = priceRange;
	if(fromDate != "")
		finalObj.startDateStr = fromDate+" 00:00:00";
	if(endDate != "")
		finalObj.endDateStr = endDate+" 00:00:00";
	if(purchaseChannel.trim() != "-- Select --")
		finalObj.purchaseChannel = purchaseChannel;
	return finalObj;
}


function clearGreetings() {
	$(".greetings :input:not(select):not(:radio)").val("");
	$(".greetings :input[type=checkbox]").each(function() {
		   $(this).prop("checked",true);
		});
}

function clearCampaigns() {
	$(".campaigns :input:not(:radio)").val("");
	$(".campaigns :input[type=checkbox]").each(function() {
	   $(this).prop("checked",true);
	});
}

function clearArrivals() {
	$(".arrival :input:not(:radio)").val("");
}

function clearOutlets() {
	$(".outlet :input:not(:radio)").val("");
}

function displayMessageBox(type,category){
	if(type == "all" || type == "mail"){
		$("."+category+"SMS").css("display","none");
		$("."+category+"Sub").css("display","block");
		$("."+category+"Mail").css("display","block");
	}
	else{
		$("."+category+"SMS").css("display","block");
		$("."+category+"Sub").css("display","none");
		$("."+category+"Mail").css("display","none");
	}
}


function getCode(element,category){
//	var id= $(element).attr("id");
//	$("#"+category+"FilterId").val(id);
	var label = $(element).children("a").text();
	$("#"+category+"Batch").val(label);
	 $("."+category).hide();
	 getBatchDetails(category);
}

function getBatchDetails(category) {
	var batchName = $('#'+category+"Batch").val();
	var contextPath = $("#contextPath").val();
	 URL = contextPath + "/crm/getBatchDetails.do";
	 $.ajax({
			type: "GET",
			url : URL,
			data : {
//				id : id,
				batchName : batchName,
				category : category
			},
			beforeSend: function(xhr){                    
  	   			$("#loading").css("display","block");
  	   			$("#mainDiv").addClass("disabled");
  	   		  },
			success : function(result) {
				appendBatchNames(result, category);
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
	$("#priceRange").val("-- Select --");
	$("#purchaseChannel").val("-- Select --");
	$("#Error").html("");
}


function appendBatchNames(filterInputList, category){
	resetForm();
	if(filterInputList.length > 0){
		var greetingFlag = true;
		var campaignFlag = true;
		for(var i = 0;i< filterInputList.length ;i++){
			if(filterInputList[i].notificationCategory == "greeting" && greetingFlag == true){
				$("input[type='radio'][name='greetingsOption']").prop("checked",false);
				clearGreetings();
				$("#greetingBatch").val(filterInputList[i].batchName);
				$("input[type='checkbox'][name='greetingEnabled']").prop("checked",false);
				setFilterValues(filterInputList[i]);
				greetingFlag = false;
			}
			if(filterInputList[i].notificationCategory == "greeting"){
				$("#greeting"+filterInputList[i].notificationChannel).prop("checked",true);
				setValues(filterInputList[i]);
				displayMessageBox(filterInputList[i].notificationChannel,"greeting");
				if($("input:checkbox[name='greetingEnabled']:checked").length == 0){
					$("#greetingEnabled").prop("checked",false);
				}
			}
			if(filterInputList[i].notificationCategory == "campaign" && campaignFlag == true){
				$("input[type='radio'][name='campaignOption']").prop("checked",false);
				clearCampaigns();
				$("#campaignBatch").val(filterInputList[i].batchName);
//				$("input[type='checkbox'][name='campaignEnabled']").prop("checked",false);
				setFilterValues(filterInputList[i]);
				campaignFlag = false;
			}
			if(filterInputList[i].notificationCategory == "campaign"){
				$("#campaign"+filterInputList[i].notificationChannel).prop("checked",true);
				setCampaignValues(filterInputList[i]);
				displayMessageBox(filterInputList[i].notificationChannel,"campaign");
				/*if($("input:checkbox[name='greetingEnabled']:checked").length == 0){
					$("#greetingsEnabled").prop("checked",false);
				}*/
			}
			if(filterInputList[i].notificationCategory == "arrival" && campaignFlag == true){
				$("input[type='radio'][name='arrivalOption']").prop("checked",false);
				clearCampaigns();
				$("#arrivalBatch").val(filterInputList[i].batchName);
//				$("input[type='checkbox'][name='campaignEnabled']").prop("checked",false);
				setFilterValues(filterInputList[i]);
				campaignFlag = false;
			}
			if(filterInputList[i].notificationCategory == "arrival"){
				$("#arrival"+filterInputList[i].notificationChannel).prop("checked",true);
				setCampaignValues(filterInputList[i]);
				displayMessageBox(filterInputList[i].notificationChannel,"arrival");
				/*if($("input:checkbox[name='greetingEnabled']:checked").length == 0){
					$("#greetingsEnabled").prop("checked",false);
				}*/
			}	
			if(filterInputList[i].notificationCategory == "outlet" && campaignFlag == true){
				$("input[type='radio'][name='outletOption']").prop("checked",false);
				clearCampaigns();
				$("#outletBatch").val(filterInputList[i].batchName);
//				$("input[type='checkbox'][name='campaignEnabled']").prop("checked",false);
				setFilterValues(filterInputList[i]);
				campaignFlag = false;
			}
			if(filterInputList[i].notificationCategory == "outlet"){
				$("#outlet"+filterInputList[i].notificationChannel).prop("checked",true);
				setCampaignValues(filterInputList[i]);
				displayMessageBox(filterInputList[i].notificationChannel,"outlet");
				/*if($("input:checkbox[name='greetingEnabled']:checked").length == 0){
					$("#greetingsEnabled").prop("checked",false);
				}*/
			}	
		}
	}
}

function setCampaignValues(list){
	setValues(list);
	$("#"+list.notificationSubCategory+"Days").val(list.periodInDays);
	$("#"+list.notificationSubCategory+"Hours").val(list.periodInHours);
	if(list.eventStartDateStr != "" && list.eventStartDateStr != null){
		var startDate = list.eventStartDateStr.split(' ');
		$("#"+list.notificationSubCategory+"StartDate").val(startDate[0]);
	}
	if(list.eventEndDateStr != "" && list.eventEndDateStr != null){
		var endDate = list.eventEndDateStr.split(' ');
		$("#"+list.notificationSubCategory+"EndDate").val(endDate[0]);
	}
	if(list.notificationSubCategory == "deals")
		$("#dealsNames").val(list.dealName);
	if(list.notificationSubCategory == "offers")
		$("#offersNames").val(list.offerName);
}




function setFilterValues(list){
	if(list.country != null && list.country != ""){
		$("#country").val(list.country);
	}
	if(list.state != null && list.state != ""){
		var selectedCountry = list.country;
		var selectedState = list.state;
		var id = getCountryIndex(selectedCountry);
		print_state('states',id);
		$("#states").val(selectedState);
	}
		$("#city").val(list.city);
	if(list.customerCategory != null && list.customerCategory != "")
		$("#customerType").val(list.customerCategory);
	if(list.fromAge != null && list.fromAge != "" && list.toAge != null && list.toAge != "")
		$("#age").val(list.fromAge+"-"+list.toAge);
	if(list.gender != null && list.gender != "")
		$("#gender").val(list.gender);
	if(list.productCategory != null && list.productCategory != "")
		$("#productCategory").val(list.productCategory);
	if(list.productName != null && list.productName != ""){
		$("#searchItems").val(list.productName);
		$("#product").val(list.productName);

	}
	if(list.startDateStr != null && list.startDateStr != ""){
		var startDate = list.startDateStr.split(' ');
		$("#fromDate").val(startDate[0]);
	}
	if(list.endDateStr != null && list.endDateStr != ""){
		var endDate = list.endDateStr.split(' ');
		$("#endDate").val(endDate[0]);
	}
	if(list.purchaseChannel != null && list.purchaseChannel != "")
		$("#purchaseChannel").val(list.purchaseChannel);
}

function setValues(list){
	if(list.notificationChannel == "sms"){
		$("#"+list.notificationSubCategory+"Msg").val(list.message);
		if(list.status == "true")
			$("#"+list.notificationSubCategory+"Enabled").prop("checked",true);
	}
	if(list.notificationChannel == "all" || list.notificationChannel == "mail"){
		$("#"+list.notificationSubCategory+"MailMsg").val(list.message);
		$("#"+list.notificationSubCategory+"MailSub").val(list.subject);
		if(list.status == "true")
			$("#"+list.notificationSubCategory+"Enabled").prop("checked",true);
	}
	if(list.notificationSubCategory == "festival")
		$("#calendarType").val(list.calendarType);
}

function searchProductsBasedOnCategory(name,searchCategory){
	 var contextPath = $("#contextPath").val();
	 var productCategory = $("#productCategory").val();
	 if (productCategory.trim() == "-- Select --"){
		 alert("Please Select a Product Category");
		 return;
	 }
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
	 $("."+type).hide();
	 $("."+type).html("");
}

function getDealName(element,type){
	var id= $(element).attr("id");
	$("#dealsNames").val(id);
	 $("."+type).hide();
	 $("."+type).html("");
}

function getofferName(element,type){
	var id= $(element).attr("id");
	$("#offersNames").val(id);
	 $("."+type).hide();
	 $("."+type).html("");
}

function searchDealNames(name,searchCategory){
	 var contextPath = $("#contextPath").val();
	 URL = contextPath + "/inventorymanager/searchDealNames.do";
	 $.ajax({
			type: "GET",
			url : URL,
			data : {
				searchName : name,
			},
			beforeSend: function(xhr){                    
	   	   		$("#loading").css("display","block");
	   	   		$("#mainDiv").addClass("disabled");
	   	   	},
			success : function(result) {
				appendDealNames(result,searchCategory);
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

function appendDealNames(dealNameList,searchCategory){
	 $("."+searchCategory).html('');
	 var op = '';
	 for(var i=0;i<dealNameList.length;i++){
			 if (i == 0) {
				 op += '<li id="'+dealNameList[i]+'"  class="selected" onclick=getDealName(this,"'+searchCategory+'"); ><a>'+dealNameList[i]+'</a></li>';
			}else
			     op += '<li id="'+dealNameList[i]+'" onclick=getDealName(this,"'+searchCategory+'"); ><a>'+dealNameList[i]+'</a></li>';
	 }
	 $("."+searchCategory).html(op);
	 $("."+searchCategory).show();
}

function searchOfferNames(name,searchCategory){
	 var contextPath = $("#contextPath").val();
	 URL = contextPath + "/inventorymanager/searchOfferNames.do";
	 $.ajax({
			type: "GET",
			url : URL,
			data : {
				searchName : name,
			},
			beforeSend: function(xhr){                    
	   	   		$("#loading").css("display","block");
	   	   		$("#mainDiv").addClass("disabled");
	   	   	},
			success : function(result) {
				appendOfferNames(result,searchCategory);
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

function appendOfferNames(offerNameList,searchCategory){
	 $("."+searchCategory).html('');
	 var op = '';
	 for(var i=0;i<offerNameList.length;i++){
			 if (i == 0) {
				 op += '<li id="'+offerNameList[i]+'"  class="selected" onclick=getofferName(this,"'+searchCategory+'"); ><a>'+offerNameList[i]+'</a></li>';
			}else
			     op += '<li id="'+offerNameList[i]+'" onclick=getofferName(this,"'+searchCategory+'"); ><a>'+offerNameList[i]+'</a></li>';
	 }
	 $("."+searchCategory).html(op);
	 $("."+searchCategory).show();
}

function saveCampaignNotification(notify) {
	if(notify == undefined)
	if($("#campaignBatch").val().trim() == ""){
		$("#campaignBatchError").html("Package Name is Required");
		return;
	}
	var option = $("input[type='radio'][name='campaignOption']:checked").val();
	var finalObj = getFormData();
	finalObj.notificationType = option;
	finalObj.batchName = $("#campaignBatch").val().trim();
	finalObj.enable = $("#campaignEnabled").prop("checked");
	finalObj.notificationCategory = "campaign";
	var flag = false;
	if($("#dealsMsg").val().trim() != "" && option == "sms"){
		finalObj.dealMessage = $("#dealsMsg").val().trim();
		flag = true;
	}
	if($("#dealsMailMsg").val().trim() != "" && (option == "all" || option == "mail")){
		finalObj.dealSubject = $("#dealsMailSub").val().trim();
		finalObj.dealMessage = $("#dealsMailMsg").val().trim();
		flag = true;
	}
	if(flag == true){
		finalObj.dealStartDateStr = $("#dealsStartDate").val().trim()+" 00:00:00";
		finalObj.dealEndDateStr = $("#dealsEndDate").val().trim()+" 00:00:00";
		finalObj.dealPeriodInDays = $("#dealsDays").val().trim();
		finalObj.dealPeriodInHours = $("#dealsHours").val().trim();
		finalObj.dealName = $("#dealsNames").val().trim();
	}
	flag = false;
	if($("#offersMsg").val().trim() != "" && option == "sms"){
		finalObj.offerMessage = $("#offersMsg").val().trim();
		flag = true;
	}
	if($("#offersMailMsg").val().trim() != "" && (option == "all" || option == "mail")){
		finalObj.offerSubject = $("#offersMailSub").val().trim();
		finalObj.offerMessage = $("#offersMailMsg").val().trim();
		flag = true;
	}
	if(flag == true){
		finalObj.offerStartDateStr = $("#offersStartDate").val().trim()+" 00:00:00";
		finalObj.offerEndDateStr = $("#offersEndDate").val().trim()+" 00:00:00";
		finalObj.offerPeriodInDays = $("#offersDays").val().trim();
		finalObj.offerPeriodInHours = $("#offersHours").val().trim();
		finalObj.offerName = $("#offersNames").val().trim();
	}
	flag = false;
	if($("#periodicMsg").val().trim() != "" && option == "sms"){
		finalObj.periodicMessage = $("#periodicMsg").val().trim();
		flag = true;
	}
	if($("#periodicMailMsg").val().trim() != "" && (option == "all" || option == "mail")){
		finalObj.periodicSubject = $("#periodicMailSub").val().trim();
		finalObj.periodicMessage = $("#periodicMailMsg").val().trim();
		flag = true;
	}
	if(flag == true){
		finalObj.periodicStartDateStr = $("#periodicStartDate").val().trim()+" 00:00:00";
		finalObj.periodicEndDateStr = $("#periodicEndDate").val().trim()+" 00:00:00";
		finalObj.periodicPeriodInDays = $("#periodicDays").val().trim();
		finalObj.periodicPeriodInHours = $("#periodicHours").val().trim();
	}
	if(notify != undefined && notify != "")
		finalObj.notify = "true";
	else
		finalObj.notify = "false";
	var formData = JSON.stringify(finalObj);
//	console.log(formData);
	var contextPath = $("#contextPath").val();
	URL = contextPath + "/crm/createNotificationPackage.do";
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
			messageStatus= JSON.stringify(result);
			var parsed_json = JSON.parse(messageStatus);
			var msg = parsed_json.msg;
			if(msg != undefined && msg !=""){
				$("#Error").html(msg);
			}
			var batchName = parsed_json.batchName;
			var flag = false;
			if(batchName != undefined && batchName !=""){
				$(".campaignPackageName").each(function(){
					if($(this).text() == batchName)
						flag = true;
				});
			}
			if(flag == false){
				var batchId = batchName.replace(/ /g,'');	
				var op = '<li id="'+batchId+'campaign"  onclick="getCode(this,'+"'"+'campaign'+"'"+');" ><a class="campaignPackageName">'+batchName+'</a></li>';
				$(".campaign").append(op);
			}
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

function setBatchStatus(element){
	var id = $(element).attr("id");
	var enable = $(element).prop("checked");
	var category = id.replace('Enabled','');
	var batchName = $("#"+category+"Batch").val();
	if(batchName.trim() == ""){
		alert("Select a Package to disable");
		return;
	}
	$("input:checkbox[name='"+category+"Enabled']").prop('checked', enable);
//	$("input[name='greetingsEnabled']").prop("checked",enable);
	var contextPath = $("#contextPath").val();
	URL = contextPath + "/crm/enableOrDisableBatches.do";
	$.ajax({
		type: "GET",
		url : URL,
		data : {
			category : category,
			batchName : batchName,
			enable : enable,
			subCategory : ''
		},
		beforeSend: function(xhr){       
		},
		success : function(result) {
		},
		error : function() {
		}
	});
}

	
function setSubCategoryStatus(element){
	var id = $(element).attr("id");
	var enable = $(element).prop("checked");
	var category = $(element).attr("name").replace('Enabled','');
	var subCategory = id.replace('Enabled','');
	var batchName = $("#"+category+"Batch").val();
	if(batchName.trim() == ""){
		alert("Select a Package to disable");
		return;
	}
//	$("input:checkbox[name='"+category+"Enabled']").prop('checked', enable);
//	$("input[name='greetingsEnabled']").prop("checked",enable);
	var contextPath = $("#contextPath").val();
	URL = contextPath + "/crm/enableOrDisableBatches.do";
	$.ajax({
		type: "GET",
		url : URL,
		data : {
			category : category,
			batchName : batchName,
			enable : enable,
			subCategory : subCategory
		},
		beforeSend: function(xhr){       
		},
		success : function(result) {
		},
		error : function() {
		}
	});
}

function emptyProduct(){
	$("#searchItems").val("");
	$("#product").val("");
}
