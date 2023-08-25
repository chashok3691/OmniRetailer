
function deleteItem(element){
	//debugger
	var id = $(element).attr("id").replace('Dele','');
	$('#dynamicdiv'+id).remove();
	
	var slNo = 1; 
	 $('.slno').each(function(){
		$(this).text(slNo);
		slNo = parseInt(slNo) + 1;
	});

}

/*
//Modified by vijay modified creation of single location to all locations
function validateStoreTaxation(type){
	
	  //purpose:for checking internet conection
	var online = window.navigator.onLine;
  	if(!online){
  	alert("check your internet connection,please try agian after some time");
  	return;
  	}
	
	var finalObj = {},saleRangesList = [];
	var contextPath = $("#contextPath").val();
   var location = $("#workLocation").val();
    var taxName = $("#taxName").val();
    var taxcode = $("#taxcode").val();
    var taxType = $("#taxType").val();
    var taxRate = $("#taxRate").val();
    var effectiveFrom = $("#effectiveFrom").val();
    var effectiveTime = $("#effectiveTime").val();
    var status = $("#status").val();
    var taxDescription = $("#taxDescription").val();
    var remarks = $("#remarks").val();
    var taxCategoryName = $("#taxCategory").val();
  
    if(taxCategoryName == "" || taxCategoryName == null){
    	$("#Error").html("Tax Category is Required");
    	return;
    }
    if(taxName.trim() == ""){
    	$("#taxNameError").html("Tax Name is Required");
    	return;
    }
    if(taxRate.trim() == ""){
    	$("#taxRateError").html("Tax Rate is Required");
    	return;
    }
    if(effectiveFrom.trim() == ""){
    	$("#effectiveFromError").html("Effective From Date is Required");
    	return;
    }
    if(effectiveTime.trim() == ""){
    	$("#effectiveTimeError").html("Effective From Time is Required");
    	return;
    }
    
  
    
  	var allLocationsList = [];
  	var length = $('#workLocation').children('option').length;
  	$('#workLocation option').each(function() { 
  		allLocationsList.push( $(this).attr('value'));
  	});
  	var  locationList="";
  	for(i=1;i<allLocationsList.length;i++)
  	{
  		locationList =locationList+ allLocationsList[i]+',';
  	}
    finalObj.location = location;
    finalObj.allLocationsStr = locationList;
    finalObj.taxName = taxName;
    finalObj.taxCode = taxcode;
    finalObj.taxType = taxType;
    finalObj.taxRateStr = taxRate;
    finalObj.taxDescription = taxDescription;
    finalObj.remarks = remarks;
    finalObj.effectiveFromStr = effectiveFrom + " " +effectiveTime;
    finalObj.status = status;
    finalObj.taxCategoryName = taxCategoryName;
    
    debugger;
    var categoryType = $('input:radio[name=taxtype]:checked').val();
	
    
			finalObj.categoryTypeStr = categoryType;	
	
					
			
	 
	 
    //debugger
    var len = parseInt($("#taxranges tr").length);
	for(var i=1;i<len;i++){
 		var idAttr = $("#taxranges tr:eq("+i+") td:last").attr("id").replace('Del','');
	var obj = {autoNumber:$("#autoNumber"+idAttr).val(),saleValueFrom:$("#startvalue"+idAttr).text(),saleValueTo:$("#endvalue"+idAttr).text(),taxRate:$("#taxrate"+idAttr).text()}; 
 		saleRangesList.push(obj);
 	}
	finalObj.saleRangesList= saleRangesList;
    if(type == "new")
    	URL = contextPath + "/inventorymanager/createStoreTaxation.do";
    else{
    	sectionId = $("#sectionId").val();
    	finalObj.sectionId = sectionId;
    	URL = contextPath + "/inventorymanager/updateStoreTaxation.do";
    }
    var formData = JSON.stringify(finalObj);
    
    console.log(formData);
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
*/

function validateStoreTaxation(type){
	
	  //purpose:for checking internet conection
	var online = window.navigator.onLine;
	if(!online){
	alert("check your internet connection,please try agian after some time");
	return;
	}
	
	var finalObj = {},saleRangesList = [];
	var contextPath = $("#contextPath").val();
 var location = $("#workLocation").val();
  var taxName = $("#taxName").val();
  var taxcode = $("#taxcode").val();
  var taxType = $("#taxType").val();
  var taxRate = $("#taxRate").val();
  var effectiveFrom = $("#effectiveFrom").val();
  var effectiveTime = $("#effectiveTime").val();
  var status = $("#status").val();
  var taxDescription = $("#taxDescription").val();
  var remarks = $("#remarks").val();
  var taxCategoryName = $("#taxCategory").val();

  if(taxCategoryName == "" || taxCategoryName == null){
  	$("#Error").html("Tax Category is Required");
  	return;
  }
  if(taxName.trim() == ""){
  	$("#taxNameError").html("Tax Name is Required");
  	focusDiv('taxName');
		$("#taxName").focus();
  	return;
  }
	else if($("#taxName").val().length>50){
		$("#taxNameError").html("TAX Name should not be more than 50");
		$("#taxName").focus();
		return false;
	}else{
		$("#taxNameError").html("");
	}	
  
  
  
  if(taxRate.trim() == ""){
  	$("#taxRateError").html("Tax Rate is Required");
  	focusDiv('taxRate');
		$("#taxRate").focus();
  	return;
  }
  else if($("#taxRate").val().length>10){
		$("#taxRateError").html("TAX Name should not be more than 10");
		$("#taxRate").focus();
		return false;
	}else{
		$("#taxRateError").html("");
	}
  
  
  
  
  if(effectiveFrom.trim() == ""){
  	$("#effectiveFromError").html("Effective From Date is Required");
  	focusDiv('effectiveFrom');
		$("#effectiveFrom").focus();
  	return;
  }
  if(effectiveTime.trim() == ""){
  	$("#effectiveTimeError").html("Effective From Time is Required");
  	return;
  }
  

  
	var allLocationsList = [];
	var length = $('#workLocation').children('option').length;
	$('#workLocation option').each(function() { 
		allLocationsList.push( $(this).attr('value'));
	});
	var  locationList="";
	for(i=1;i<allLocationsList.length;i++)
	{
		locationList =locationList+ allLocationsList[i]+',';
	}
  finalObj.location = location;
  finalObj.allLocationsStr = locationList;
  finalObj.taxName = taxName;
  finalObj.taxCode = taxcode;
  finalObj.taxType = taxType;
  finalObj.taxRateStr = taxRate;
  finalObj.taxDescription = taxDescription;
  finalObj.remarks = remarks;
  finalObj.effectiveFromStr = effectiveFrom + " " +effectiveTime;
  finalObj.status = status;
  finalObj.taxCategoryName = taxCategoryName;
  
  debugger;
  var categoryType = $('input:radio[name=taxtype]:checked').val();
	
  
			finalObj.categoryTypeStr = categoryType;	
	
					
			
	 
	 
  //debugger
  var len = parseInt($("#taxranges tr").length);
	for(var i=1;i<len;i++){
		var idAttr = $("#taxranges tr:eq("+i+") td:last").attr("id").replace('Del','');
	var obj = {autoNumber:$("#autoNumber"+idAttr).val(),saleValueFrom:$("#startvalue"+idAttr).text(),saleValueTo:$("#endvalue"+idAttr).text(),taxRate:$("#taxrate"+idAttr).text()}; 
		saleRangesList.push(obj);
	}
	finalObj.saleRangesList= saleRangesList;
  if(type == "new")
  	URL = contextPath + "/inventorymanager/createStoreTaxation.do";
  else{
  	sectionId = $("#sectionId").val();
  	finalObj.sectionId = sectionId;
  	URL = contextPath + "/inventorymanager/updateStoreTaxation.do";
  }
  var formData = JSON.stringify(finalObj);
  
  console.log(formData);
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


function validateWarehouseTaxation(type){
	
	  //purpose:for checking internet conection
	var online = window.navigator.onLine;
	if(!online){
	alert("check your internet connection,please try agian after some time");
	return;
	}
	
	var finalObj = {},saleRangesList = [];
	var contextPath = $("#contextPath").val();
 var location = $("#workLocation").val();
  var taxName = $("#taxName").val();
  var taxcode = $("#taxcode").val();
  var taxType = $("#taxType").val();
  var taxRate = $("#taxRate").val();
  var effectiveFrom = $("#effectiveFrom").val();
  var effectiveTime = $("#effectiveTime").val();
  var status = $("#status").val();
  var taxDescription = $("#taxDescription").val();
  var remarks = $("#remarks").val();
  var taxCategoryName = $("#taxCategory").val();

  if(taxCategoryName == "" || taxCategoryName == null){
  	$("#Error").html("Tax Category is Required");
  	return;
  }
  if(taxName.trim() == ""){
  	$("#taxNameError").html("Tax Name is Required");
  	return;
  }
  if(taxRate.trim() == ""){
  	$("#taxRateError").html("Tax Rate is Required");
  	return;
  }
  if(effectiveFrom.trim() == ""){
  	$("#effectiveFromError").html("Effective From Date is Required");
  	return;
  }
  if(effectiveTime.trim() == ""){
  	$("#effectiveTimeError").html("Effective From Time is Required");
  	return;
  }
  

  
	var allLocationsList = [];
	var length = $('#workLocation').children('option').length;
	$('#workLocation option').each(function() { 
		allLocationsList.push( $(this).attr('value'));
	});
	var  locationList="";
	for(i=1;i<allLocationsList.length;i++)
	{
		locationList =locationList+ allLocationsList[i]+',';
	}
  finalObj.location = location;
  finalObj.allLocationsStr = locationList;
  finalObj.taxName = taxName;
  finalObj.taxCode = taxcode;
  finalObj.taxType = taxType;
  finalObj.taxRateStr = taxRate;
  finalObj.taxDescription = taxDescription;
  finalObj.remarks = remarks;
  finalObj.effectiveFromStr = effectiveFrom + " " +effectiveTime;
  finalObj.status = status;
  finalObj.taxCategoryName = taxCategoryName;
  
  debugger;
  var categoryType = $('input:radio[name=taxtype]:checked').val();
	
  
			finalObj.categoryTypeStr = categoryType;	
	
					
			
	 
	 
  //debugger
  var len = parseInt($("#taxranges tr").length);
	for(var i=1;i<len;i++){
		var idAttr = $("#taxranges tr:eq("+i+") td:last").attr("id").replace('Del','');
	var obj = {autoNumber:$("#autoNumber"+idAttr).val(),saleValueFrom:$("#startvalue"+idAttr).text(),saleValueTo:$("#endvalue"+idAttr).text(),taxRate:$("#taxrate"+idAttr).text()}; 
		saleRangesList.push(obj);
	}
	finalObj.saleRangesList= saleRangesList;
  if(type == "new")
  	URL = contextPath + "/inventorymanager/createWarehouseTaxation.do";
  else{
  	sectionId = $("#sectionId").val();
  	finalObj.sectionId = sectionId;
  	URL = contextPath + "/inventorymanager/updateWarehouseTaxation.do";
  }
  var formData = JSON.stringify(finalObj);
  
  console.log(formData);
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


function getTaxDesc(){
	
	 //purpose:for checking internet conection
	var online = window.navigator.onLine;
  	if(!online){
  	alert("check your internet connection,please try agian after some time");
  	return;
  	}
	var taxId = $("#taxCategory").val();
	 var contextPath = $("#contextPath").val();
	 URL = contextPath + "/inventorymanager/getTaxDesc.do";
	$.ajax({
		type: "GET",
		url : URL,
		data : {
			taxId : taxId
		},
		beforeSend: function(xhr){                    
	   			$("#loading").css("display","block");
	   			$("#mainDiv").addClass("disabled");
	   		  },
		success : function(result) {
			$("#taxDescription").val(result);
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
function addtaxranges(){
	//debugger
	
	 //purpose:for checking internet conection
	var online = window.navigator.onLine;
  	if(!online){
  	alert("check your internet connection,please try agian after some time");
  	return;
  	}
	
		 var len = parseInt($("#taxranges tr").length);
		if (len != 1)
		len = parseInt($("#taxranges tr:last").attr("id").replace('dynamicdiv', '')) + 1;
		 var type = $("#type").val();
		var slNo = 1; 
			 $('.slno').each(function(){
				$(this).text(slNo);
				slNo = parseInt(slNo) + 1;
			});
			 var startvalue = 0;
			 var endvalue = 0;
			 var taxrate = 0;
			 if($("#startvalue").length>0 &&$("#startvalue").val()!="")
				startvalue = $("#startvalue").val();
			 if($("#endvalue").length>0)
				endvalue = $("#endvalue").val();
			 if($("#taxrate").length>0)
				taxrate = $("#taxrate").val();
		 var row = "<tr id='dynamicdiv"+len+"' class='MoveableRow' style='margin-top:5px;'><td class='slno'>"+slNo+"</td>" +
			"<td id='startvalue"+len+"'>"+startvalue+"</td>" +
		 "<td id='endvalue"+len+"'>"+endvalue+"</td>" +
		 "<td id='taxrate"+len+"'>"+taxrate+"</td>" +
		"<td  id='Del"+len+"'><a  id='Dele" +len+ "'  style=' text-decoration: underline;margin-left:3px;' onclick='deleteItem(this);' title='Delete'>Delete</a>"
		"</td></tr>";
			
	$("#taxranges tbody").append(row);
	$("#data").css("display","block");
}
