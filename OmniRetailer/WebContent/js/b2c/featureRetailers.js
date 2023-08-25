function validateFeaturedRetailers(operation){
	debugger;
	var featuredRetailer = {};

	if($("#featureId").val().trim() == ""){
		$("#featureId").focus().border="1px solid red";
		$("#featureIdError").html("Enter featured retailer ID");
		return;
	}else{
		$("#featureIdError").html("");
	}


	var re = /^[0-9/]+$/;
	if($("#startDate").val().trim() == ""){
		$("#startDate").focus();
		$("#startDateError").html("Enter start date");
		return;
	}
	/*else if(!re.test($("#startDate").val())){
		$("#startDate").focus();
		$("#startDateError").html("Invalid date");
		return;
	}*/
	else {
		$("#startDateError").html("");
	}

	if($("#endDate").val().trim() == ""){
		$("#endDate").focus();
		$("#endDateError").html("Enter End Date");
		return;
	}
	/*else if(!re.test($("#endDate").val())){
		$("#endDate").focus();
		$("#endDateError").html("Invalid Date");
		return;
	}*/
	else {
		$("#endDateError").html("");
	}
	
	 var dateTime = getCurrentDate();
  	 var date = dateTime.split(' ');
  	  date = date[0].split('/');
  	 var formatedDate = date[1]+"/"+date[0]+"/"+date[2];
  	  
	var noOfDaysstart = daydiff(parseDate($('#startDate').val()), parseDate(formatedDate));
	 if(noOfDaysstart > 0){
		 $("#startDate").focus();
		  $("#startDateError").html("Past Date Not allowed"); 
		 return false;
	  }
	 
	var noOfDays = daydiff(parseDate($('#startDate').val()), parseDate($('#endDate').val()));
	if(noOfDays < 0){
		$("#endDateError").html("End Date can't be less than Start Date");
		return;
	}

	var selectedLocation = $("#reatilerLocation").val();
	 if(selectedLocation == "" || selectedLocation == null || selectedLocation == undefined){
		 $("#reatilerLocation").focus();
		 $("#reatilerLocationError").html("Add location from dropdown.");
		 return;
	 }
	 
	 
    var imagerefId=$("#retailerImage_refId").val();
    featuredRetailer.locationId =selectedLocation;
	featuredRetailer.featuredRetailerId = $("#featureId").val();
	featuredRetailer.priorityNo = $("#featuredRating").val();
	featuredRetailer.status = $("#status").val();
	featuredRetailer.featureDescription = $("#description").val();
	featuredRetailer.startDateStr = $("#startDate").val()+ " 00:00:00";
	featuredRetailer.endDateStr = $("#endDate").val()+ " 00:00:00";
	featuredRetailer.packageName = $("#package").val();
	featuredRetailer.zoneId = $("#zone").val();
	featuredRetailer.strPicture = imagerefId;
	featuredRetailer.imageLink = $("#retailerImageFile").val();
	
	if(operation=="edit"){
		featuredRetailer.createdDateStr = $("#frCreatedDateStr").val();
		featuredRetailer.updatedDateStr = $("#frUpdatedDateStr").val();
	}
	var formData = JSON.stringify(featuredRetailer);
	var contextPath = $("#contextPath").val();
	if(operation=="new"){
		URL = contextPath + "/b2c/createFeatureRetailers.do";
	}
	else if(operation=="edit"){
		URL = contextPath + "/b2c/updateFeatureRetailers.do";
	}
	
	var formData = JSON.stringify(featuredRetailer);
	//console.info(formData)
	
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
		 
 function addNameToTextBox(id){
		debugger;
		addFileToArray(id);
		if($("#"+id)[0].files[0] != undefined)
			$("#"+id+"File").val($("#"+id)[0].files[0]['name']);
		else
			$("#"+id+"File").val("");
	}
	 
 
 function loadImageFileAsURL(id,ele) {
		debugger
		$("."+id+"Error").text("");
		$("#"+id+"Error").text("");
		var filesSelected = document.getElementById(id).files;
		if (filesSelected.length > 0) {
			var fileToLoad = filesSelected[0];
			 var fsize = fileToLoad.size;
			if (fileToLoad.type.match("image.*")) {
				if((fsize <= 70000 && id == "bannerThumbnail") || id == "retailerImage" ){
				var name = fileToLoad['name'];
				$("#"+id+"File").val(name);
				var fileReader = new FileReader();
				fileReader.onload = function(fileLoadedEvent) {
					var byteVal = fileLoadedEvent.target.result;
					var index = byteVal.indexOf(',');
					byteVal = byteVal.substring(index + 1);
					/*
					 * var imageLoaded = document.createElement("img");
					 * imageLoaded.src = fileLoadedEvent.target.result;
					 * alert(imageLoaded); document.body.appendChild(imageLoaded);
					 */
					$("#" + id + "byte").val(byteVal);
					$("#retailerImageimage").css("display","block");
					$("#" + id + "image").html(
							'<img style="width:65px;height:50px;" src=' + fileLoadedEvent.target.result + '>');

				};
				fileReader.readAsDataURL(fileToLoad);
				var oMyForm = new FormData();
		        oMyForm.append("file",  ele.files[0]);
		        if($("#"+id+"_refId").val() != "")
		        	oMyForm.append("refId",  $("#"+id+"_refId").val().trim());
		        else
		        	oMyForm.append("refId", "");
		        var contextPath = $("#contextPath").val();
		        var URL = contextPath + "/inventorymanager/addToAttachementList.do";
		        $.ajax({
//						dataType : 'json',
		        	url : URL,
		        	data : oMyForm,
		        	type : "POST",
		        	enctype : 'multipart/form-data',
		        	processData : false,
		        	contentType : false,
		        	beforeSend : function(xhr) {
		        	},
		        	success : function(result) {
		        		$("#"+id+"_refId").val(result);
		        	},
		        	error : function() {
		        		alert("something went wrong");
		        	}
		        });
				 }else{
	        		$("#"+id+"Error").text("Select Image < 70kb");
		        	return;
	        	} 
			}
		}
	}
 
 
 function replaceReatilerLocs(){
		debugger;
		 var selectedLocation = $("#selectedRetailerloc").val();
		 
		 if(selectedLocation == "" || selectedLocation == null || selectedLocation == undefined){
			 $("#selectedRetailerloc").focus();
				$("#selectedRetailerlocError").html("Enter End Date");
				return;
		 }
		 
		if(selectedLocation != ""){
			$("#reatilerLocation").html("");
			$("#reatilerLocation").val(selectedLocation);
			
		}	
	}
 
 
 function viewEditFeaturedRetailer(featuredId,operation){
	 debugger;
	 var contextPath = $("#contextPath").val();
	 
	 URL = contextPath + "/b2c/viewEditFeaturedRetailer.do";
	$.ajax({
		type: "GET",
		url : URL,
		data : {
			featuredId : featuredId,
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
		error : function() {
			 alert("something went wrong");
			 $("#loading").css("display","none");
 			 $("#mainDiv").removeClass('disabled');
		}
	});
}