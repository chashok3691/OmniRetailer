
function validateRegionalSettingsForm(operation){
	var regionalSettings = {};
	if($("#dateFormat").val().trim() == ""){
		$("#dateFormatError").html("Select Date Format");
		return;
	}
	
	if($("#currency").val().trim() == ""){
		$("#currencyError").html("Select Currency");
		return;
	}
	
	if($("#numberFormat").val().trim() == ""){
		$("#numberFormatError").html("Select Number Format");
		return;
	}
	
	
	if($("#timeFormat").val().trim() == ""){
		$("#timeFormatError").html("Select Time Format");
		return;
	}
	

																
	regionalSettings.dateFormat = $("#dateFormat").val();
	regionalSettings.currency = $("#currency").val();
	regionalSettings.numberFormat = $("#numberFormat").val();
	regionalSettings.timeFormat = $("#timeFormat").val();
	regionalSettings.language=$("#language").val();
	regionalSettings.timeZone=$("#timeZone").val();
	regionalSettings.date=$("#date").val();
	regionalSettings.time=$("#time").val();
	regionalSettings.countryCode=$("#countryCode").val();
		var formData = JSON.stringify(regionalSettings);
//		console.log(formData);
		var contextPath = $("#contextPath").val();
	   if(operation=="new"){
		   URL = contextPath + "/settings/createRegionalSettings.do";
	   }
	   else if(operation=="edit"){
		   
		   URL = contextPath + "/settings/updateRegionalSettings.do";
	   }
	   
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



