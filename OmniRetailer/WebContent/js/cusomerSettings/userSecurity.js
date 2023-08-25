




/*$("#password").keydown(function(){
	   $("#passwordError").html("");
	   $("#Error").html("");
});*/ 

function validateUserSecurityForm(operation){
	
	var userSecurityObj = {};
	
	/*if($("#username").val().trim() == ""){
		$("#usernameError").html("Enter User Name");
		return;
	}*/
	
	if($("#capitalLetters").val() == ""){
		$("#capitalLetters").val("3");
	}
	if($("#smallLetters").val() == ""){
		$("#smallLetters").val("3");
	}
	if($("#specialCharacters").val() == ""){
		$("#specialCharacters").val("1");
	}
	if($("#expiryInDays").val() == ""){
		$("#expiryInDays").val("30");
	}
	if($("#lockTheAccount").val() == ""){
		$("#lockTheAccount").val("3");
	}
	if($("#passwordHistoryCount").val() == ""){
		$("#passwordHistoryCount").val("3");
	}
	if($("#enforcePasswordHistory").val() == ""){
		$("#enforcePasswordHistory").val("3");
	}
	
	if(parseInt($("#passwordLength").val()) >= 8 &&parseInt($("#passwordLength").val()) <= 10){
		$("#passwordLength").val($("#passwordLength").val());
	}else{
		$("#passwordLength").val("");
		alert("Password Range 8-10 Characters");
		return;
	}
	
	if(parseInt($("#capitalLetters").val()) >= 1 && parseInt($("#capitalLetters").val()) <= 4){
		$("#capitalLetters").val($("#capitalLetters").val());
	}else{
		$("#capitalLetters").val("");
		alert("Capital Letters Range 1-4 Characters");
		return;
	}
	
	if(parseInt($("#smallLetters").val()) >= 1 && parseInt($("#smallLetters").val()) <= 4){
		$("#smallLetters").val($("#smallLetters").val());
	}else{
		$("#smallLetters").val("");
		alert("Small Letters Range 1-4 Characters");
		return;
	}
	
	if(parseInt($("#specialCharacters").val()) >= 1 && parseInt($("#specialCharacters").val()) <= 4){
		$("#specialCharacters").val($("#specialCharacters").val());
	}else{
		$("#specialCharacters").val("");
		alert("Special Chatacters Range 1-4 Characters");
		return;
	}
	
	if(parseInt($("#enforcePasswordHistory").val()) >= 3 && parseInt($("#enforcePasswordHistory").val()) <= 5){
		$("#enforcePasswordHistory").val($("#enforcePasswordHistory").val());
	}else{
		$("#enforcePasswordHistory").val("");
		alert("Enforce Password History Ranges From 3 to 5 ");
		return;
	}
	
	if(parseInt($("#passwordHistoryCount").val()) >= 3 && parseInt($("#passwordHistoryCount").val()) <= 5){
		$("#passwordHistoryCount").val($("#passwordHistoryCount").val());
	}else{
		$("#passwordHistoryCount").val("");
		alert("Password History Count Ranges From 3 to 5 ");
		return;
	}
	
	

	
	
	
	if($("#eutc").val() == ""){
		$("#eutc").val(false);
	}
		
	if($("#cpdll").val() == ""){
		$("#cpdll").val(false);
	}
	if($("#offLogin").val() == ""){
		$("#offLogin").val(false);
	}
	
	userSecurityObj.minPasswordLength = $("#passwordLength").val();
	userSecurityObj.capitalLetters = $("#capitalLetters").val();
	userSecurityObj.smallLetters = $("#smallLetters").val();
	userSecurityObj.specialLetters = $("#specialCharacters").val();
	userSecurityObj.passwordExpiryInDays = $("#expiryInDays").val();
	userSecurityObj.enforceUserToChange = $("#eutc").val();
	userSecurityObj.passwordHistoryCount = $("#passwordHistoryCount").val();
	userSecurityObj.enforcePasswordHistory = $("#enforcePasswordHistory").val();
	userSecurityObj.firstTimeLogin = $("#cpdll").val();
	userSecurityObj.allowOfflineLogin = $("#offLogin").val();
	userSecurityObj.noOfAttempts = $("#lockTheAccount").val();
	userSecurityObj.restrictedAreaLongitude = $("#restrictedAreaLongitude").val();
	userSecurityObj.restrictedAreaLatitude = $("#restrictedAreaLatitude").val();
	
	
		var formData = JSON.stringify(userSecurityObj);
//		console.log(formData);
		var contextPath = $("#contextPath").val();
	   if(operation=="new"){
		   URL = contextPath + "/settings/createUserSecuritySettings.do";
	   }
	   else if(operation=="edit"){
		   
		   URL = contextPath + "/settings/updateUserSecuritySettings.do";
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



