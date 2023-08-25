	function searchHomePageBanners(name,searchCategory,index){
			var type = $("#type").val();
			var contextPath = $("#contextPath").val();
			 
			 name=""
		   		 if($("#homePageBannerMaster").length>0)
		   			name = $("#homePageBannerMaster").val().trim();
			 
			 URL = contextPath + "/b2c/searchHomePageBanners.do";
			 $.ajax({
					type: "GET",
					url : URL,
					data : {
						searchName : name,
						index : index,
						type : type
					},
					beforeSend: function(xhr){                    
			   	   		$("#loading").css("display","block");
			   	   		$("#mainDiv").addClass("disabled");
			   	   	},
					success : function(result) {
						$('#right-side').html(result);
						$("#type").val(type);
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
	
	
	function validateHomePageBanner(operation){
		debugger;
		$("#bannerNameError").html("");
			$("#startDateError").html("");
			$("#Error").html("");
			$("#descriptionError").html("");
		var type = $("#type").val();
		var finalObj = {};
		finalObj.bannerId = $("#bannerId").val();
		
		if(parseInt($("#bannerId").val().length)>25){
			 $("#bannerId").focus();
			 $("#bannerIdError").html("Banner Id can't exceeds 25 Characters");
				return;
		}else{
		 $("#bannerIdError").html(" ");
	    }
		
		if($("#bannerName").val().trim() == ""){
			$("#bannerName").focus();
			$("#bannerNameError").html("Banner Name is Required");
			return;
		}
		
		if(parseInt($("#bannerName").val().length)>50){
			 $("#bannerName").focus();
			 $("#bannerNameError").html("Banner Name can't exceeds 50 Characters");
				return;
		}else{
		        $("#bannerNameError").html(" ");
	    }
		
		
		
		finalObj.bannerName = $("#bannerName").val();
		finalObj.bannerPriorityStr = $("#bannerPriority").val();
		if($("#startDate").val() == ""){
			$("#startDate").focus();
			$("#startDateError").html("Start Date is Required");
			return;
		}
		finalObj.effectiveFromStr = $("#startDate").val()+" 00:00:00";
		if($("#endDate").val() != ""){
			var noOfDays = daydiff(parseDate($('#startDate').val()), parseDate($('#endDate').val()));
			 if(noOfDays < 0){
				 $("#Error").focus();
				 $("#Error").html("End Date can't be less than Start Date");
				 return;
			 }
		finalObj.endDateStr = $("#endDate").val()+" 00:00:00";
		}
		finalObj.statusStr = $("#status").val();
		if($("#description").val() == ""){
			$("#description").focus();
			$("#descriptionError").html("Banner Description is Required");
			return;
		}
		if(parseInt($("#description").val().length)>250){
			 $("#description").focus();
			 $("#descriptionError").html("Banner Description can't exceeds 250 Characters");
				return;
		}else{
		     $("#descriptionError").html(" ");
	    }
		
		if(parseInt($("#bannerImageText").val().length)>250){
			 $("#bannerImageText").focus();
			 $("#Error").html("Banner Image Text can't exceeds 250 Characters");
				return;
		}else{
		        $("#Error").html(" ");
	    }
		
		finalObj.bannerDescription = $("#description").val();
		finalObj.productCategory = $("#productCategory").val();
		finalObj.departmentCategory = $("#departmentcategory").val();
		finalObj.brandCategory = $("#brandCategory").val();
		finalObj.dealId = $("#dealId").val();
		finalObj.offerId = $("#offerId").val();
		if($("#displayDeal").prop('checked') == true)
			finalObj.dealsDisplay = 1;
		else
			finalObj.dealsDisplay = 0;
		if($("#displayOffer").prop('checked') == true)
			finalObj.offerDisplay = 1;
		else
		finalObj.offerDisplay = 0;
		finalObj.bannerImageText = $("#bannerImageText").val();
		finalObj.bannerImageTextFont  = $("#bannerImageTextFontHidden").val();
		finalObj.bannerImageFontSize = $("#bannerImageFontSize").val();
		finalObj.bannerImageColor = $("#bannerImageColor").val();
		if($("#bannerImageBold").prop('checked') == true)
			finalObj.bannerImageBoldStr = 1;
		else
			finalObj.bannerImageBoldStr = 0;
		if($("#bannerImageItalic").prop('checked') == true)
			finalObj.bannerImageItalicStr = 1;
		else
			finalObj.bannerImageItalicStr = 0;
		if($("#bannerImageStrike").prop('checked') == true)
			finalObj.bannerImageStrikeStr = 1;
		else
			finalObj.bannerImageStrikeStr = 0;
		if($("#bannerImage_refId").val().trim() == "" && type == "new"){
			$("#Error").html("Banner Image is Required");
			return;
		}
		finalObj.image_name = $("#bannerImageFile").val();
		finalObj.thumbnail_name = $("#bannerThumbnailFile").val();
		finalObj.bannerImageRefId = $("#bannerImage_refId").val();
		finalObj.bannerThumbnailRefId = $("#bannerThumbnail_refId").val();
		finalObj.type = type;
		finalObj.targetURL=$("#targetURL").val();
		finalObj.groupId=$("#grroupId").val();
		var formData = JSON.stringify(finalObj);
//		console.log(formData);
		var contextPath = $("#contextPath").val();
		if(operation == "new")
			URL = contextPath + "/b2c/createBanner.do";
		else
			URL = contextPath + "/b2c/updateBanner.do";
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
            		$('#right-side').html(result);
            		$("#type").val(type);
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
	
	function viewEditBanner(bannerId,operation){
		var type = $("#type").val();
		 var contextPath = $("#contextPath").val();
	  	 URL = contextPath + "/b2c/editBanner.do";
			$.ajax({
				type: "GET",
				url : URL,
				data : {
					bannerId : bannerId,
					type : type,
					operation : operation
				},
				beforeSend: function(xhr){                    
	   	   			$("#loading").css("display","block");
	   	   			$("#mainDiv").addClass("disabled");
	   	   		  },
				success : function(result) {
					$("#right-side").html(result);
					$("#type").val(type);
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
		debugger
		$("."+id+"Error").text("");
		$("#"+id+"Error").text("");
		var filesSelected = document.getElementById(id).files;
		if (filesSelected.length > 0) {
			var fileToLoad = filesSelected[0];
			 var fsize = fileToLoad.size;
			if (fileToLoad.type.match("image.*")) {
				if((fsize <= 70000 && id == "bannerThumbnail") || id == "bannerImage" ){
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