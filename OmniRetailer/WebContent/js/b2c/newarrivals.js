function filterNewarrivals(name, searchCategory, index) {
	var type = $("#type").val();
	var category=$("#category").val();
	var brandcode=$("#brandcode").val();
	var group=$("#groupid").val();
	var productrange="";
	var startdate=$("#from").val();
	var enddate=$("#to").val();
	var maxRecords=$("#maxRecords").val();
	
	var contextPath = $("#contextPath").val();
	URL = contextPath + "/b2c/getNewArrivals.do";
	$.ajax({
		type : "GET",
		url : URL,
		data : {
			searchName : name,
			index : index,
			category : category,
			brand:brandcode,
			groupid:group,
			startdate:startdate,
			enddate:enddate,
			maxRecords:maxRecords,
			
		},
		beforeSend : function(xhr) {
			$("#loading").css("display", "block");
			$("#mainDiv").addClass("disabled");
		},
		success : function(result) {
			$('#right-side').html(result);
			$("#type").val(type);
			$("#loading").css("display", "none");
			$("#mainDiv").removeClass('disabled');
		},
		error : function() {
			alert("something went wrong");
			$("#loading").css("display", "none");
			$("#mainDiv").removeClass('disabled');
		}
	});
}


function getProductsByCriteria(name, searchCategory, index) {
	var category=$("#category").val();
	if($("#category").val().trim() == ""){
		alert("Please select a category")
		return;
	}
	var brandcode=$("#brandcode").val();
	var contextPath = $("#contextPath").val();
	URL = contextPath + "/b2c/getProductsByCriteria.do";
	var pricerange= $("#pricerange").val();
	var maxRecords = $("#maxRecords").val();
	console.info(pricerange+""+pricerange);
	$.ajax({
		type : "GET",
		url : URL,
		data : {
			searchName : name,
			index : index,
			category : category,
			brand:brandcode,
			priceRange:pricerange,
			maxRecords:"30",
		},
		beforeSend : function(xhr) {
			$("#loading").css("display", "block");
			$("#mainDiv").addClass("disabled");
		},
		success : function(result) {
			appendproductsbyfilter(result,searchCategory)
			$("#loading").css("display", "none");
			$("#mainDiv").removeClass('disabled');
		},
		error : function() {
			alert("something went wrong");
			$("#loading").css("display", "none");
			$("#mainDiv").removeClass('disabled');
		}
	});
}

function appendproductsbyfilter(productsList,searchCategory){
	 var contextPath = $("#contextPath").val();
	 var appendtype=$("#featurededit").val();
	 var len = parseInt($("#productsList tr").length);
		if (len != 1)
			len = parseInt($("#productsList tr:last").attr("id").replace('dynamicdiv', '')) + 1;
		len=len-2;
	/* if(appendtype == 'new'){
		 $("#productsList tbody").html('');
	 }*/
	 if(productsList.length =='0'){
		alert("no results found");
	 }
	 //$("#productsList tbody").html('');
	 for(var i=0;i<productsList.length;i++){
		 len=len+1;
		 var pic='picture'+len;
		 var sno=1+len;
		 var row ="<tr id='dynamicdiv"+len+"' style='margin-top:5px;'><td class='slno' id='sno"+len+"'>"+sno+
			 "<td id='skuId"+len+"'>"+productsList[i].productId+"</td>"+
			"<td id='productDescription"+len+"'>"+productsList[i].skuDescription+"</td>" +
			"<td id='skuImage"+ len +"'>"+
			"<div id='picture"+len+"image'></div>" +
			"<input type='file'  id='picture"+len+"' onchange=loadImageFileAsURL('"+pic+"',this); style='' />"+
                "<input type='hidden' id='picture"+len+"_refId' name='picture' />"+
                 "<input type='hidden' id='picture"+len+"_name' />" +
                 
                 		"</td>"+
			"<td><input id='featuredText"+len+"' type='textbox' value='' /></td>" +

			"<td id='Del"+ len +"' ><img id='Img"+ len +"' src='"+contextPath+"/images/itemdelete.png' style='width:25px;cursor:pointer;' onclick='deleteItem(this);' title='Delete "+productsList[i].skuDescription+"'/>" +
			"</td></tr>";
		 $("#productsList tbody").append(row);
	 }
}


function searchNewarrivalproducts(name,searchCategory,index){
	 var startDate = "";
	 var endDate = "";
	 
	 
	 
	 //modified by manasa
		if($("#arrivalfrom").val() != "" && $("#arrivalto").val() != ""){
			var noOfDays = daydiff(parseDate($('#from').val()), parseDate($('#to').val()));
			 if(noOfDays < 0){
				 alert("Start Date can't be less than End Date");
				 return;
			 }
			 startDate = $("#arrivalfrom").val();
			 endDate = $("#arrivalto").val();
		}else if($("#arrivalfrom").val() != "")
			 startDate = $("#arrivalfrom").val();
		else if($("#arrivalto").val() != "")
			endDate = $("#arrivalto").val();
		
		var maxRecords = 10;
		 if($("#maxRecords").length>0)
		maxRecords = $("#maxRecords").val();
		 var searchName = $("#searchNewarrivalGroup").val();
		 var newarrivalType = $("#newarrivaltype").val();
		 var contextPath = $("#contextPath").val();
		 URL = contextPath + "/b2c/viewNewArrivals.do";
		 $.ajax({
				type: "GET",
				url : URL,
				data : {
					searchName : searchName,
					index : index,
					maxRecords : maxRecords,
					startDate : startDate,
					endDate : endDate,
					newarrivalType:newarrivalType,
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

function validateNewarrivalForm(type){
	var newarrivals = {}, newArrivalProductsList = [];
	if($("#newarrivalGroup").val().trim() == ""){
		$("#newarrivalGroup").focus();
			$("#groupNameError").html("Enter Featured Group Name");
			return;
		}
	var re = /^[0-9/]+$/;
	 if($(".fromNewarrivals").val().trim() == ""){
		 $(".fromNewarrivals").focus();
			$("#startDateError").html("Enter a Date");
			return;
	 }
	 if(!re.test($(".fromNewarrivals").val())){
			$("#startDateError").html("Invalid Date");
			return;
	 }
	 if($(".toNewarrivals").val().trim() != ""){
		 if(!re.test($(".toNewarrivals").val())){
				$("#endDateError").html("Invalid Date");
				return;
		 }
		 var noOfDays = daydiff(parseDate($('.fromNewarrivals').val()), parseDate($('.toNewarrivals').val()));
		 if(noOfDays < 0){
			 $("#endDateError").html("End Date can't be less than Start Date");
			 return;
		 }
	 }
		var len = parseInt($("#productsList tr").length);
		if(len <= 1){
			alert("Add Atleast One Item");
			return false;
			}
		/* $(".update").each(function(){
				$(this).remove();
			 });*/
		 var len = parseInt($("#productsList tr").length);
		 newarrivals.newCategoryName = $("#newarrivalGroup").val();
		 newarrivals.startDateStr = $(".fromNewarrivals").val()+ " 00:00:00";
		 newarrivals.endDateStr = $(".toNewarrivals").val()+ " 00:00:00";
		 newarrivals.newCategoryType = $("#newarrivalType").val();
		 newarrivals.remarks = $("#description").val();
		 newarrivals.effectiveFromStr = $("#effective").val()+ " 00:00:00";
		 newarrivals.lastDateStr = $("#last").val()+ " 00:00:00";
		 //newarrivals.priceRange = $("#pricerange").val();
		 brandId = $("#brandcode").val();
		 if($("#brandcode").val().trim() == "")
			 brandId = null;
		 newarrivals.brandId = brandId;
		 newarrivals.groupId = $("#groupId").val();
		 var category= $("#category").val();
		 newarrivals.categoryId = $("#category").val();
		 if(category == "Select"){
			 newarrivals.productCategory="Select";
		 }
		 
		 
	/*	if($("#groupImageimage").length > 0)
			productGroupMaster.imageFlag = "true";
		else
			productGroupMaster.imageFlag = "false";*/
		for(var i=1;i<len;i++){
			var idAttr = $("#productsList tr:eq("+i+") td:last").attr("id");
			idAttr = idAttr.replace('Del','');
			
			var obj = {skuId:$("#skuId"+idAttr).text(),skuDesc:$("#productDescription"+idAttr).text(),serNo:$("#itemno"+idAttr).val(),newArrivalImageRefId:$("#picture"+idAttr+"_refId").val(),image:$("#picture"+idAttr+"_name").val(),newArrivalImageFlag:true};
			newArrivalProductsList.push(obj);
			
		}
		newarrivals.newArrivalProductsList = newArrivalProductsList;
		var contextPath = $("#contextPath").val();
	   if(type=="new"){
		   URL = contextPath + "/b2c/createNewarrivalGroupMaster.do";
	   }
	   else if(type=="edit"){
		   URL = contextPath + "/b2c/updateNewarrivalGroupMaster.do";
		   newarrivals.newRefId = $("#newarrivalId").val();
	   }
		var formData = JSON.stringify(newarrivals);
		console.info(formData)
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
function deleteItem(element){
	var id = $(element).attr("id").replace('Img','');
	//deletedPlus.push($("#skuId"+id).text());
	$('#dynamicdiv'+id).remove();
}

//chaithanya
function viewEditNewarrivalGroup(newarrivalId,operation){
	 var contextPath = $("#contextPath").val();
	 
	//added by manasa
		var formData={}
		 formData.newCategoryType = $("#newarrivaltype").val();
		formData.startDateStr = $("#arrivalfrom").val();
		 formData.endDateStr = $("#arrivalto").val();
		 var formData = JSON.stringify(formData);
	 
	 
	 URL = contextPath + "/b2c/viewEditNewarrivalGroup.do";
	$.ajax({
		type: "GET",
		url : URL,
		data : {
			newarrivalId : newarrivalId,
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
			var name = fileToLoad['name'];
			$("#"+id+"_name").val(name);
			var fileReader = new FileReader();
			fileReader.onload = function(fileLoadedEvent) {
				var byteVal = fileLoadedEvent.target.result;
				/*var index = byteVal.indexOf(',');*/
			/*	byteVal = byteVal.substring(index + 1);*/
				/*
				 * var imageLoaded = document.createElement("img");
				 * imageLoaded.src = fileLoadedEvent.target.result;
				 * alert(imageLoaded); document.body.appendChild(imageLoaded);
				 */
				/*$("#" + id + "byte").val(byteVal);*/
				$("#"+id+"image").html("");
				$("#" + id + "image").html(
						'<img style="width:65px;height:50px;float:left" src=' + fileLoadedEvent.target.result + '>');

			};
			fileReader.readAsDataURL(fileToLoad);
			var oMyForm = new FormData();
	        oMyForm.append("file",  ele.files[0]);
	        if($("#"+id+"_refId").val() != "")
	        	oMyForm.append("refId",  $("#"+id+"_refId").val().trim());
	        else
	        	oMyForm.append("refId", "");
	        var contextPath = $("#contextPath").val();
	        var URL = contextPath + "/b2c/addToAttachementList.do";
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
			
		}
	}
}
