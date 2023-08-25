//modified by manasa
/*
function saveTax(){
	 //purpose:for checking internet conection
	debugger;
	var online = window.navigator.onLine;
	
  	if(!online)
  	{
  	alert("check your internet connection,please try agian after some time");
  	return;
  	}
  	debugger;
		var contextPath = $("#contextPath").val();
	    var taxName = $("#taxName").val();
	    var maxRecords = 10;
  	  if($("#maxRecords").length>0)
  		  maxRecords = $("#maxRecords").val();
  	  var searchName ="";
  	  if($("#searchTax").length>0)
	  searchName = $("#searchTax").val();

	    
  
  	
	    var taxDescription = $("#taxDescription").val().trim();
	    if(taxName.trim() == ""){
	    	$("#taxNameError").html("Tax Name Required");
	    	return false;
	    }
	    
	    //debugger
	  	var finalObj = {};
		var locDetails=[];
		if($("#taxLocation").val() != null){
			var locations = $("#taxLocation").val().toString().split(',');
			for(var i=0; i<locations.length; i++){
			//	lc = locations[i];
				obj = {"store_location":locations[i]};
				locDetails.push(obj);
			}
		}
	  	
		//finalObj.taxLocationsList = locDetails;
		finalObj.taxName = taxName;
//		finalObj.taxId = taxId;
		finalObj.taxDescription = taxDescription;
		finalObj.maxRecords = maxRecords;
		finalObj.searchCriteria = searchName;
	  	console.log(locDetails)
	  	  	var formData = JSON.stringify(finalObj);
	    
	    
		URL = contextPath + "/genericMaster/saveTax.do";
 		 
		$.ajax({
 			type: "POST",
 			url : URL,
 			contentType: "application/json",
 			data :formData,
 			beforeSend: function(xhr){                    
   	   			$("#loading").css("display","block");
   	   			$("#mainDiv").addClass("disabled");
   	   		  },
 			success : function(result) {
 				$("#right-side").html(result);
// 				$("#maxRecords").val(maxRecords);
 				$("#loading").css("display","none");
 				$("#mainDiv").removeClass('disabled');
 				
 			},
 			error : function() {
 				 alert("something went wrong");
 				$("#loading").css("display","none");
 				$("#mainDiv").removeClass('disabled');
 			}
 		});
	}*/

function saveTax(){
	 //purpose:for checking internet conection
	debugger;
	var online = window.navigator.onLine;
	
  	if(!online)
  	{
  	alert("check your internet connection,please try agian after some time");
  	return;
  	}
  	debugger;
		var contextPath = $("#contextPath").val();
	    var taxName = $("#taxName").val();
	    var maxRecords = 10;
  	  if($("#maxRecords").length>0)
  		  maxRecords = $("#maxRecords").val();
  	  var searchName ="";
  	  if($("#searchTax").length>0)
	  searchName = $("#searchTax").val();

	    
  
  	
	    var taxDescription = $("#taxDescription").val().trim();
	    if(taxName.trim() == ""){
	    	$("#taxNameError").html("Tax Name Required");
	    	return false;
	    }else if(parseInt($("#taxName").val().length)>=50){
			 $("#taxName").focus();
				$("#taxNameError").html("Tax Name can't exceeds 50 Characters");
				return;
			}
	    
	    if(taxDescription.trim() != "" && parseInt($("#taxDescription").val().length)>=50){
			$("#taxDescription").focus();
			$("#taxdescError").html("Tax Description can't exceeds 50 Characters");
			return false;
		}else{
			$("#taxdescError").html("");
		}

	    
	    /*if(taxDescription.trim() != "" && parseInt($("#taxDescription").val().length)>=50){
				$("#taxDescription").focus();
				$("#taxdescError").html("Tax Name Length should be within  50");
			}*/
	    //debugger
	  	var finalObj = {};
		var locDetails=[];
		if($("#taxLocation").val() != null){
			var locations = $("#taxLocation").val().toString().split(',');
			for(var i=0; i<locations.length; i++){
			//	lc = locations[i];
				obj = {"store_location":locations[i]};
				locDetails.push(obj);
			}
		}
	  	
		//finalObj.taxLocationsList = locDetails;
		finalObj.taxName = taxName;
//		finalObj.taxId = taxId;
		finalObj.taxDescription = taxDescription;
		finalObj.maxRecords = maxRecords;
		finalObj.searchCriteria = searchName;
	  	console.log(locDetails)
	  	  	var formData = JSON.stringify(finalObj);
	    
	    
		URL = contextPath + "/genericMaster/saveTax.do";
 		 
		$.ajax({
 			type: "POST",
 			url : URL,
 			contentType: "application/json",
 			data :formData,
 			beforeSend: function(xhr){                    
   	   			$("#loading").css("display","block");
   	   			$("#mainDiv").addClass("disabled");
   	   		  },
 			success : function(result) {
 				$("#right-side").html(result);
// 				$("#maxRecords").val(maxRecords);
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


	
	function viewEditTax(taxId,operation){
		 //purpose:for checking internet conection
		debugger;
		var online = window.navigator.onLine;
	  	if(!online)
	  	{
	  	alert("check your internet connection,please try agian after some time");
	  	return;
	  	}
		 var contextPath = $("#contextPath").val();
		 var maxRecords = 10;
	  	  if($("#maxRecords").length>0)
	  		  maxRecords = $("#maxRecords").val();
	  	  var searchName ="";
	  	  if($("#searchTax").length>0)
		  searchName = $("#searchTax").val();
	  	  
  	 URL = contextPath + "/genericMaster/editTax.do";
		$.ajax({
			type: "GET",
			url : URL,
			data : {
				taxId : taxId,
				operation : operation,
				maxRecords: maxRecords,
 				searchName: searchName
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
	//modified by manasa
	function updateTax(){
		 //purpose:for checking internet conection
		var online = window.navigator.onLine;
	  	if(!online)
	  	{
	  	alert("check your internet connection,please try agian after some time");
	  	return;
	  	}
		var contextPath = $("#contextPath").val();
	    var taxName = $("#taxName").val();
	    var taxId = $("#taxId").val();
	    var taxDescription = $("#taxDescription").val();
	    if(taxName == ""){
	    	$("#taxNameError").html("Tax Name Required");
	    	return false;
	    }
	    var maxRecords = 10;
	  	  if($("#maxRecords").length>0)
	  		  maxRecords = $("#maxRecords").val();
	  	  var searchName ="";
	  	  if($("#searchTax").length>0)
		  searchName = $("#searchTax").val();
	    
	  	  
	  /*	if($("#taxLocation").val() != null){
			var locations = $("#taxLocation").val().toString().split(',');
	  	 var  locationList="";
	    	for(i=1;i<locations.length;i++)
	    		{
	    		locationList =locationList+ locations[i]+',';
	    		}
	  	}
	  	
	  	console.log(locationList);*/
	  	  //debugger
	  	var finalObj = {};
		var locDetails=[];
		if($("#taxLocation").val() != null){
			var locations = $("#taxLocation").val().toString().split(',');
			for(var i=0; i<locations.length; i++){
			//	lc = locations[i];
				obj = {"store_location":locations[i]};
				locDetails.push(obj);
			}
		}
	  	
		finalObj.taxLocationsList = locDetails;
		finalObj.taxName = taxName;
		finalObj.taxId = taxId;
		finalObj.taxDescription = taxDescription;
		finalObj.maxRecords = maxRecords;
		finalObj.searchCriteria = searchName;
		
	  	console.log(locDetails);
	  	  	var formData = JSON.stringify(finalObj);
		URL = contextPath + "/genericMaster/updateTax.do";
 		$.ajax({
 			type: "POST",
 			url : URL,
 			contentType: "application/json",
 			data :formData,
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
	
	$('#searchTax').on('input',function(e){
		if($(this).val().trim()==""){
			viewTaxMaster('taxMaster','0');
		}
	});


	function searchTaxMaster(name,searchCategory,index){
		 //purpose:for checking internet conection
		var online = window.navigator.onLine;
	  	if(!online)
	  	{
	  	alert("check your internet connection,please try agian after some time");
	  	return;
	  	}
		 var contextPath = $("#contextPath").val();
		 var maxRecords = 10;
	  	  if($("#maxRecords").length>0)
	  		  maxRecords = $("#maxRecords").val();
	  	  
		 URL = contextPath + "/genericMaster/searchTaxMaster.do";
		 $.ajax({
				type: "GET",
				url : URL,
				data : {
					searchName : name,
					index : index,
					maxRecords : maxRecords
				},
				beforeSend: function(xhr){                    
		   	   		$("#loading").css("display","block");
		   	   		$("#mainDiv").addClass("disabled");
		   	   	},
				success : function(result) {
					$('#right-side').html(result);
					/*if($("#searchProduct").val != "")
						$("#pagination").css("display","none");
					else
						$("#pagination").css("display","block");*/
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