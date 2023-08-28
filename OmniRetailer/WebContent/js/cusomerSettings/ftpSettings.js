function validateFTPSettingsForm(operation){
	
		debugger
		var ftpSettings = {},backUpftpSettings = {},commonconfigSettingsObj = {},finalObj = {};
		
		if($("#fUsername").val() == "" || $("#fUsername").val() == null || $("#fUsername").val() == undefined){
			$("#fUsernameError").html("Please Enter User Name")
			$("#fUsername").focus();
			return;
		} else {
			$("#fUsernameError").html("");
		}
		
		if($("#fHost").val() == "" || $("#fHost").val() == null || $("#fHost").val() == undefined){
			$("#fHostError").html("Please Enter Host")
			$("#fHost").focus();
			return;
		} else {
			$("#fHostError").html("");
		}
		
		if($("#fPassword").val() == "" || $("#fPassword").val() == null || $("#fPassword").val() == undefined){
			$("#fPasswordError").html("Please Enter Password")
			$("#fPassword").focus();
			return;
		} else {
			$("#fPasswordError").html("");
		}
		
		/*if($("#fPortNo").val() == "" || $("#fPortNo").val() == null || $("#fPortNo").val() == undefined){
			$("#fPortNoError").html("Please Enter Port no")
			$("#fPortNo").focus();
			return;
		}*/
		
		ftpSettings.userID = $("#fUsername").val();
		ftpSettings.hostName = $("#fHost").val();
		ftpSettings.userPassword = $("#fPassword").val();
		ftpSettings.portNO = $("#fPortNo").val();
		
		
		if($("#backUpfUsername").val() == "" || $("#backUpfUsername").val() == null || $("#backUpfUsername").val() == undefined){
			$("#backUpfUsernameError").html("Please Enter User Name")
			$("#backUpfUsername").focus();
			return;
		} else {
			$("#backUpfUsernameError").html("");
		}
		
		if($("#backUpfHost").val() == "" || $("#backUpfHost").val() == null || $("#backUpfHost").val() == undefined){
			$("#backUpfHostError").html("Please Enter Host")
			$("#backUpfHost").focus();
			return;
		} else {
			$("#backUpfHostError").html("");
		}
		
		if($("#backUpfDestinationPath").val() == "" || $("#backUpfDestinationPath").val() == null || $("#backUpfDestinationPath").val() == undefined){
			$("#backUpfDestinationPathError").html("Please Enter Destination Path")
			$("#backUpfDestinationPath").focus();
			return;
		} else {
			$("#backUpfDestinationPathError").html("");
		}
		
		if($("#backUpfPassword").val() == "" || $("#backUpfPassword").val() == null || $("#backUpfPassword").val() == undefined){
			$("#backUpfPasswordError").html("Please Enter Password")
			$("#backUpfPassword").focus();
			return;
		} else {
			$("#backUpfPasswordError").html("");
		}
		
		if($("#backUpfPortNo").val() == "" || $("#backUpfPortNo").val() == null || $("#backUpfPortNo").val() == undefined){
			$("#backUpfPortNoError").html("Please Enter Port no")
			$("#backUpfPortNo").focus();
			return;
		} else {
			$("#backUpfPortNoError").html("");
		}
		
		
		backUpftpSettings.userID = $("#backUpfUsername").val();
		backUpftpSettings.hostName = $("#backUpfHost").val();
		backUpftpSettings.userPassword = $("#backUpfPassword").val();
		backUpftpSettings.portNO = $("#backUpfPortNo").val();
		backUpftpSettings.remotePath = $("#backUpfDestinationPath").val();
		
		finalObj.ftpSettings = ftpSettings;
		finalObj.backUpftpSettings = backUpftpSettings;
		finalObj.operation = operation;
		
		/*if($("#publicIPAddress").val() == "" || $("#publicIPAddress").val() == null || $("#publicIPAddress").val() == undefined){
			$("#publicIPAddressError").html("Please Enter IP Address")
			$("#publicIPAddress").focus();
			return;
		} else {
			$("#publicIPAddressError").html("");
		}
		
		if($("#yearlySerialBillIdFormat").val() == "" || $("#yearlySerialBillIdFormat").val() == null || $("#yearlySerialBillIdFormat").val() == undefined){
			$("#yearlySerialBillIdFormatError").html("please enter yearly serial bill ID format")
			$("#yearlySerialBillIdFormat").focus();
			return;
		} else {
			$("#yearlySerialBillIdFormatError").html("");
		}
		
		if($("#yearlyServerSerialYear").val() == "" || $("#yearlyServerSerialYear").val() == null || $("#yearlyServerSerialYear").val() == undefined){
			$("#yearlyServerSerialYearError").html("please enter yearly server serial year")
			$("#yearlyServerSerialYear").focus();
			return;
		} else {
			$("#yearlyServerSerialYearError").html("");
		}
		
		if($("#ysbillIdResetDate").val() == "" || $("#ysbillIdResetDate").val() == null || $("#ysbillIdResetDate").val() == undefined){
			$("#ysbillIdResetDateError").html("Please Select Reset Date")
			$("#ysbillIdResetDate").focus();
			return;
		} else {
			$("#ysbillIdResetDateError").html("");
		}*/
		
		//commonconfigSettingsObj.publicIPAddress = $("#publicIPAddress").val();
		//commonconfigSettingsObj.yearlySerialBillIdFormat = $("#yearlySerialBillIdFormat").val();
		//commonconfigSettingsObj.yearlyServerSerialYear = $("#yearlyServerSerialYear").val();
		//commonconfigSettingsObj.yearlySerialbillIdResetDate = $("#ysbillIdResetDate").val();
		
		///finalObj.commonconfigSettings = commonconfigSettingsObj;
		
		var formData = JSON.stringify(finalObj);
		console.log(formData)
		
		var contextPath = $("#contextPath").val();
		URL = contextPath + "/settings/validateFTPSettings.do";
		
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