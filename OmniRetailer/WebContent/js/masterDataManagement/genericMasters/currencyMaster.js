function validateCurrencyForm(operation){
	 //purpose:for checking internet conection
	var online = window.navigator.onLine;
  	if(!online)
  	{
  	alert("check your internet connection,please try agian after some time");
  	return;
  	}
  	debugger;
	 var maxRecords = 10;
	  if($("#maxRecords").length>0)
		  maxRecords = $("#maxRecords").val();
	  var searchName = 10;
	  if($("#searchCurrency").length>0)
		  searchName = $("#searchCurrency").val();
	  
		var contextPath = $("#contextPath").val();
//	    var countryName = $("#countryName").val();
	    var countryName = $("#countryName option:selected").text();
	    var currencyCode = $("#currencyCode").val();
	    currencyCode = currencyCode.split('-');
	    currencyCode = currencyCode[0];
	    var baseCurrency = $("#baseCurrency").val();
	    var conversionRatio = $("#conversionRatio").val().trim();
	    if(baseCurrency == ""){
	    	
	    	$("#Error").focus();
	    	$("#Error").html("Please Set Currency in Regional Settings");
	    	return false;
	    }
	    if(countryName.trim() == ""){
	    	 $("#countryName").focus();
	    	$("#countryNameError").html("Country Name is required");
	    	return false;
	    }
	    if(currencyCode.trim() == ""){
	    	 $("#currencyCode").focus();
	    	$("#currencyCodeError").html("Currency Code is required");
	    	return false;
	    }
	    if(conversionRatio.trim() == ""){
	    	$("#conversionRatio").focus();
	    	$("#conversionRatioError").html("Conversion Ratio is required");
	    	return false;
	    }
	    if(conversionRatio.trim() == 0){
	    	$("#conversionRatio").focus();
	    	$("#conversionRatioError").html("Conversion Ratio cann't be 0");
	    	return false;
	    }
		if(operation=="new"){
	    	URL = contextPath + "/genericMaster/saveCurrency.do";
	   	}
	   	else if(operation=="edit"){
	   		URL = contextPath + "/genericMaster/updateCurrency.do";
	   	}
 		$.ajax({
 			type: "POST",
 			url : URL,
 			data : {
 				countryName : countryName,
 				currencyCode : currencyCode,
 				baseCurrency : baseCurrency,
 				conversionRatio : conversionRatio,
 				maxRecords : maxRecords,
 				searchName : searchName
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
function viewEditCurrency(countryName,operation){
debugger;
	//purpose:for checking internet conection
	var online = window.navigator.onLine;
  	if(!online)
  	{
  	alert("check your internet connection,please try agian after some time");
  	return;
  	}
	 if($("#maxRecords").length>0)
		  maxRecords = $("#maxRecords").val();
	  var searchName = 10;
	  if($("#searchCurrency").length>0)
		  searchName = $("#searchCurrency").val();
	 var contextPath = $("#contextPath").val();
	 URL = contextPath + "/genericMaster/editCurrency.do";
	$.ajax({
		type: "GET",
		url : URL,
		data : {
			countryName : countryName,
			operation : operation,
			maxRecords : maxRecords,
			searchName : searchName
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

$('#searchCurrency').on('input',function(e){
	if($(this).val().trim()==""){
		viewCurrencyMaster('currencyMaster','0');
	}
});

function searchCurrencyMaster(name, searchCategory,index){
	 var contextPath = $("#contextPath").val();
	 //purpose:for checking internet conection
		var online = window.navigator.onLine;
	  	if(!online)
	  	{
	  	alert("check your internet connection,please try agian after some time");
	  	return;
	  	}
	 var maxRecords = 10;
	    	  if($("#maxRecords").length>0)
	    		  maxRecords = $("#maxRecords").val();
	    	  var searchName = 10;
	    	  if($("#searchCurrency").length>0)
	    		  searchName = $("#searchCurrency").val().trim();

	 URL = contextPath + "/genericMaster/searchCurrencyMaster.do";
	 $.ajax({
			type: "GET",
			url : URL,
			data : {
				searchName : name,
				index : index,
				maxRecords : maxRecords,
				searchName:searchName
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