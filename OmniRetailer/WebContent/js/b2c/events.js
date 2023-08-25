function searchEvents(name,searchCategory,index){
	 var startDate = "";
	 var endDate = "";
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
		
		
		name=""
	   		 if($("#searchEventsId").length>0)
	   			name = $("#searchEventsId").val();
		
 		var maxRecords = 10;
 		 if($("#maxRecords").length>0)
 			 maxRecords = $("#maxRecords").val();
  		 var contextPath = $("#contextPath").val();
  		 URL = contextPath + "/b2c/searchEvents.do";
  		 $.ajax({
  				type: "GET",
  				url : URL,
  				data : {
  					searchName : name,
  					index : index,
  					maxRecords : maxRecords,
  					startDate : startDate,
 					endDate : endDate,
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

function editEvent(eventId,operation){
	 var contextPath = $("#contextPath").val();
	 
	//added by manasa
		var formData={}
		// formData.storeLocation = $("#outletLocation").val();
		formData.eventStartDateStr = $("#from").val();
		 formData.eventEndDateStr = $("#to").val();
		 formData.searchCriteria = $("#searchEventsId").val();
		 var formData = JSON.stringify(formData);
		 
	 URL = contextPath + "/b2c/editEvent.do";
	$.ajax({
	type: "GET",
	url : URL,
	data : {
		eventId : eventId,
		operation : operation,
		formData : formData
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


function loadImageFileAsURL(id,ele) {
	$("."+id+"Error").text("");
	$("#"+id+"Error").text("");
	var filesSelected = document.getElementById(id).files;
	if (filesSelected.length > 0) {
		var fileToLoad = filesSelected[0];
		 var fsize = fileToLoad.size;
		if (fileToLoad.type.match("image.*")) {
//			if(fsize <= 70000){
			var name = fileToLoad['name'];
			$("#"+id+"File").val(name);
			var fileReader = new FileReader();
			fileReader.onload = function(fileLoadedEvent) {
//				var byteVal = fileLoadedEvent.target.result;
//				var index = byteVal.indexOf(',');
//				byteVal = byteVal.substring(index + 1);
				
			/*	  var imageLoaded = document.createElement("img");
				  imageLoaded.src = fileLoadedEvent.target.result;
				  alert(imageLoaded); document.body.appendChild(imageLoaded);*/
				 
//				$("#" + id + "byte").val(byteVal);
				$("#"+id+"image").html("");
				$("#" + id + "image").html(
						'<img style="width:65px;height:40px;" id='+id+'_thumbnail src=' + fileLoadedEvent.target.result + '>');

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
//					dataType : 'json',
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
			/* }else{
        		$("#"+id+"Error").text("Select Image < 70kb");
	        	return;
        	} */
		}
	}
}


$("#targetUrl").blur(function(){
	var txt = $('#targetUrl').val();
	if($('#targetUrl').val().trim() == "")
		return;
	var re = /^(http:\/\/www\.|https:\/\/www\.|http:\/\/|https:\/\/|www\.)[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}(:[0-9]{1,5})?(\/.*)?$/
	if (!re.test(txt)) {
		$("#targetUrlError").html("Enter Valid URL");
		return;
	}
});


function validateEventForm(operation){
	var finalObj = {};
	if($("#eventTitle").val().trim() == ""){
		$("#eventTitle").focus();
		$("#eventTitleError").html("Enter Event Title");
		focusDiv('eventTitleError');
		return;
	}
	var re = /^[0-9/]+$/;
	 if($("#startDate").val().trim() == ""){
		 $("#startDate").focus();
			$("#startDate").html("Enter a Date");
			return;
	 }
	 if(!re.test($("#startDate").val())){
		 $("#startDate").focus();
			$("#startDateError").html("Invalid Date");
			return;
	 }
	 if($("#endDate").val().trim() == ""){
		 $("#endDate").focus();
			$("#endDateError").html("Enter a End Date");
			return;
	 }
	
		 if(!re.test($("#endDate").val())){
				$("#endDateError").html("Invalid Date");
				return;
		 }
		 var noOfDays = daydiff(parseDate($('#startDate').val()), parseDate($('#endDate').val()));
		 if(noOfDays < 0){
			 $("#endDateError").html("End Date can't be less than Start Date");
			 return;
		 }
	
	finalObj.eventId = $("#eventId").val();
	finalObj.eventTitle = $("#eventTitle").val();
	finalObj.status = $("#status").val();
	finalObj.approvedBy= $("#approvedBy").val();
	var txt = $('#targetUrl').val().trim();
	var re = /^(http:\/\/www\.|https:\/\/www\.|http:\/\/|https:\/\/|www\.)[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}(:[0-9]{1,5})?(\/.*)?$/
	if (txt != "" && !re.test(txt)) {
		$("#targetUrlError").html("Enter Valid URL");
		return;
	}
	finalObj.targetUrl = $("#targetUrl").val();
	finalObj.type = $("#eventType").val();
	finalObj.description = $("#description").val();
	if($("#startDate").val() != "")
		finalObj.eventStartDateStr = $("#startDate").val()+" 00:00:00";
	if($("#endDate").val() != "")
		finalObj.eventEndDateStr = $("#endDate").val()+" 00:00:00";
	finalObj.eventImage1RefId = $("#eventImage1_refId").val();
	finalObj.eventImage1 = $("#eventImage1File").val();
	if($("#eventImage1_thumbnail").length > 0)
		finalObj.eventImage1Flag = "true";
	else
		finalObj.eventImage1Flag = "false";
	finalObj.eventImage2RefId = $("#eventImage2_refId").val();
	finalObj.eventImage2 = $("#eventImage2File").val();
	if($("#eventImage2_thumbnail").length > 0)
		finalObj.eventImage2Flag = "true";
	else
		finalObj.eventImage2Flag = "false";
	finalObj.eventImage3RefId = $("#eventImage3_refId").val();
	finalObj.eventImage3 = $("#eventImage3File").val();
	if($("#eventImage3_thumbnail").length > 0)
		finalObj.eventImage3Flag = "true";
	else
		finalObj.eventImage3Flag = "false";
   var contextPath = $("#contextPath").val();
   if(operation=="new"){
	 URL = contextPath + "/b2c/createEvent.do";
   }
   else if(operation=="edit"){
	 URL = contextPath + "/b2c/updateEvent.do";
   }
   	 var formData = JSON.stringify(finalObj);
//   	 console.log(formData);
//   	 return;
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
