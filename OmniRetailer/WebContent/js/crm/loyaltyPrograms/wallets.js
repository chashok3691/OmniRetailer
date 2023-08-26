 /*Added by:Koti Bommineni
		Purpose :To Communicate with Controller
		*/
	function newWallets(type,id,index,menu){
		debugger;
	 try{
		var contextPath = $('#contextPath').val();
	        // purpose:for checking internet conection
 		var online = window.navigator.onLine;
 	  	if(!online){
 	  	alert("Check your internet connection,Please try agian after some time.");
 	  	return;
 	  	}
 	  	$("#error").html("");
     	$("#success").html("");
 	  	var location = "";
	    	if($("#outletLocation").length > 0)
	    		location = $("#outletLocation").val();
	    	var zone = "";
	    	if($("#outletZone").length > 0)
	    		zone = $("#outletZone").val();
	    	var startdate = "";
	    	if($("#startDate").length > 0)
	    		startdate = $("#startDate").val();
	    	var enddate = "";
	    	if($("#endDate").length > 0)
	    		enddate = $("#endDate").val();
	    	
	    	 if ($("#startDate").val() != "" && $("#endDate").val() != "") {
	 	   		var noOfDays = daydiff(parseDate(startdate), parseDate(enddate));
	 	   		if (noOfDays < 0) {
	 	   			alert("Start Date can't be less than End Date");
	 	   			return;
	 	   		}
	 	   	}
	    	
	    	
	    	var searchName = "";
		 		if($("#searchWallet").length > 0 )
		 			searchName = $("#searchWallet").val().trim();
	    	
		 	 var maxRecords = 10;
 	  if($("#maxRecords").length > 0)
 		  maxRecords = $("#maxRecords").val();
		 		
		 		var allLocationsList = [];
		 	 var length = $('#outletLocation').children('option').length;
		       	$('#outletLocation option').each(function() { 
		       		allLocationsList.push( $(this).attr('value'));
		       	});
		 	 var  locationList="";
		    	for(i=1;i<allLocationsList.length;i++)
		    		{
		    		locationList =locationList+ allLocationsList[i]+',';
		    		}
 	  var URL = contextPath + "/crm/newWallets.do";
	    	 $.ajax({
	    		type : "GET",
	    		url : URL,
	    		data : {
	    			index : index,
	    			location : location,
	    			zone : zone,
	    			startdate : startdate,
	    			enddate : enddate,	    	
	    			searchName : searchName,
	    			maxRecords : maxRecords,
	    			/*membershipType : membershipType,
	    			allLocationsList : locationList,*/

	    		},
	    		beforeSend: function(xhr){                    
	   	   			$("#loading").css("display","block");
	   	   			$("#mainDiv").addClass("disabled");
	   	   		  },
	    		success : function(result){
	    	    	$('#right-side').html(result);
	    			activeMenu(id);
	    			$("#loading").css("display","none");
	    			$("#mainDiv").removeClass('disabled');
	    		},
	    		error : function(jqXHR, textStatus, errorThrown) {
	    			errorCode(jqXHR.status);
	    			$("#loading").css("display","none");
	 				$("#mainDiv").removeClass('disabled');
	    		}
	    	 });
	}
	catch(e)
	{
		errorCode(e);
	}

}
	
	
	
	 /*Added by:Koti Bommineni
	Purpose :To Communicate with Controller
	*/
 function validateWallet(type){
	debugger;
 try{
	var contextPath = $('#contextPath').val();
       
		var online = window.navigator.onLine;
	  	if(!online){
	  	alert("Check your internet connection,Please try agian after some time.");
	  	return;
	  	}
	     	$("#error").html("");
	     	$("#success").html("");
	     	$("#errpromoCode").html("");
	     	$("#errpromoName").html("");
	     	$("#createdOnError").html("");
	     	$("#updatedOnError").html("");
	     	$("#errvalidityPeriod").html("");
	     	$("#errStates").html("");
	     	$("#errLocation").html("");
	     	var importStatus=$("#importStatus").val();
	     	var fileName=$("#fileName").val();
	     	if(fileName != "" && fileName != undefined && fileName!= null)
	     		importStatus='true';
	     		
	     	
	     	var walletProgramId =$("#promoCode").val();

	     	if(walletProgramId == "" || walletProgramId == undefined || walletProgramId== null){
	     		$("#errpromoCode").html("Enter Program Code");
	     		return;
	     	}
	  	
	  	var walletProgramName=$("#walletprogramname").val();
	  	
	  	if(walletProgramName == "" || walletProgramName == undefined || walletProgramName== null){
	  		$("#errpromoName").html("Enter Program Name");
	  		return;
	  	}
	  	
	  	var createdDate=$("#startdate").val();
	  	var updatedDate=$("#expirydate").val();
	  	
		if(createdDate == "" || createdDate == undefined || createdDate== null){
			$("#startdate").focus();
			return;
    	}
		
		if(updatedDate == "" || updatedDate == undefined || updatedDate== null){
			$("#expirydate").focus();
			return;
    	}
		var noOfDays = daydiff(parseDate(createdDate), parseDate(updatedDate));
		if(noOfDays>=0)
			{
			noOfDays=noOfDays+1;
			}
		
	   		if (noOfDays < 0) {
	   		 $('#updatedOnError').html("expiry Date can't be less than Start Date");
	   			return;
	   		}
	  	
	  	
	 	var autoAssigned=$("#assignedStatus").val();
	 	
	 	if(autoAssigned == "" || autoAssigned == undefined || autoAssigned== null){
	 		autoAssigned = "false";
    	}
	  	
	  	
	  	var walletType=$("#walletType").val();
		if(walletType == "" || walletType == undefined || walletType== null){
			walletType = "Bronze";
    	}
	  	
	  	
	  	var minCashDeposit=($("#minbalance").val());
	  	if(minCashDeposit == "" || minCashDeposit == undefined || minCashDeposit== null){
	  		minCashDeposit = "0";
    	}
	  	var activationFee=($("#membershipprice").val());
	  	if(activationFee == "" || activationFee == undefined || activationFee== null){
	  		activationFee = "0";
    	}
	  	var validityPeriod=parseInt($("#validityperiod").val());
		if(validityPeriod == "" || validityPeriod == undefined || validityPeriod== null || isNaN(validityPeriod)){
			validityPeriod = 0;
    	}
	  	if(validityPeriod == "" || validityPeriod == undefined || validityPeriod== null){
	  		$("#errvalidityPeriod").html("Enter Validity period");
	  		return;
    	}
	  	
	  	if(noOfDays<validityPeriod){
	  		$("#errvalidityPeriod").html("Enter Number of Days Properly");
	  		return;
	  	}
	  	
	  	
	  	
		var status=$("#status").val();
		
		if(status == "" || status == undefined || status== null){
			status = "Suspended";
    	}
	  
	  	var maxCashDeposit=($("#maxdeposite").val());
	  	if(maxCashDeposit == "" || maxCashDeposit == undefined || maxCashDeposit== null){
	  		maxCashDeposit = "0";
    	}
	  	
	  	
	  	var renewalFee=($("#renewalprice").val());
	  	if(renewalFee == "" || renewalFee == undefined || renewalFee== null){
	  		renewalFee = "0";
    	}
	  	
	  	var minBillAmount=($("#minbill").val());
	  	if(minBillAmount == "" || minBillAmount == undefined || minBillAmount== null){
	  		minBillAmount = "0";
    	}
	  	
	  	var maxBillAmount=($("#maxbill").val());
	  	if(maxBillAmount == "" || maxBillAmount == undefined || maxBillAmount== null){
	  		maxBillAmount = "0";
    	}
	  	var maxTopupAmt=$("#maxTopupAmt").val();
	  	 if(maxTopupAmt == "" || maxTopupAmt == undefined || maxTopupAmt== null || maxTopupAmt== "0"){
	  		maxTopupAmt = "0";
	    	}
	  	if(parseFloat(minBillAmount)>=parseFloat(maxBillAmount)){
	  		$("#maxbillError").html("Max Bill Amt should be greater than Min Bill Amt.");
	  		return;
	  	}
	  	
	  	var noOfWallets=$("#noOfwallets").val();
		
	  	if(type == "new"){
	  	if(noOfWallets == "" || noOfWallets == undefined || noOfWallets== null){
	  		$("#noOfwalletsErrors").html("enter no of wallets");
			$("#noOfwallets").focus();
			return;
    	}
	  	
	  	}
	  	
	  	if ($('#autoGenerated').is(':checked')) 
			$("#autoGenerated").val("true");
		 else
			$("#autoGenerated").val("false");
	  	
	  	var autoGenerated = $('#autoGenerated').val();

	  	if(autoGenerated == "true" && type=="new"){
	  		if(noOfWallets != "" && (noOfWallets == "0" || noOfWallets == 0)){
	  			$("#noOfwalletsErrors").html("no of wallets can't be zero");
				$("#noOfwallets").focus();
				return;
	  		}else{
	  			$("#noOfwalletsErrors").html("");
				
	  		}
	  	}
	  	
	  	var otpRequired=$("#otpRequired").val();
	  	if(otpRequired == "" || otpRequired == undefined || otpRequired== null){
	  		otpRequired = "false";
    	}
	  	
		var signupCash=($("#signupCash").val());
	  	if(signupCash == "" || signupCash == undefined || signupCash== null){
	  		signupCash = "0";
    	}
	  	
	  var country=$("#country").val();
	  var zone=$("#zones").val();
	  
	  if(zone == "" || zone == undefined || zone== null){
		  $("#errStates").html("Select Zone");
		  return;
  	}
	  zone = zone.toString();
	  
	  
	  	var location=$("#location").val();
	  	if(location == "" || location == undefined || location== null){
	  		$("#errLocation").html("Select location");
	  		return;
    	}
	  	location = location.toString();
	 

	  var URL = contextPath + "/crm/createWallet.do";
    	 $.ajax({
    		type : "POST",
    		url : URL,
    		data : {
    			fileName:fileName,
    			importStatus:importStatus,
    			walletProgramId:walletProgramId,
    			createdDate:createdDate,
    			updatedDate:updatedDate,
    			autoAssigned:autoAssigned,
    			walletType:walletType,
    			minCashDeposit:minCashDeposit,
    			activationFee:activationFee,
    			walletProgramName:walletProgramName,
    			validityPeriod:validityPeriod,
    			status:status,
    			maxCashDeposit:maxCashDeposit,
    			renewalFee:renewalFee,
    			minBillAmount:minBillAmount,
    			maxBillAmount:maxBillAmount,
    			otpRequired:otpRequired,
    			country:country,
    			zone:zone,
    			type:type,
    			location:location,
    			signupCash:signupCash,
    			noOfWallets: noOfWallets,
    			maxTopupAmt:maxTopupAmt,
    			autoGenerated : autoGenerated
    			
    		},
    		beforeSend: function(xhr){                    
   	   			$("#loading").css("display","block");
   	   			$("#mainDiv").addClass("disabled");
   	   		  },
    		success : function(result){
    			debugger
    			function loadingStop(){
    				$("#loading").css("display","none");
        			$("#mainDiv").removeClass('disabled');
    			}
    	    	$('#right-side').html(result);
    	    	loadingStop()
    		},
    		error : function(jqXHR, textStatus, errorThrown) {
    			errorCode(jqXHR.status);
    			console.log(JSON.stringify(errorThrown,textStatus,jqXHR));
    			$("#loading").css("display","none");
 				$("#mainDiv").removeClass('disabled');
    		}
    	 });
}
catch(e)
{
	errorCode(JSON.stringify(e));
}
}





function walletPopUp(operation,programCode,phone,walletName,status,index,type){
	debugger;	
	$("#error").html("");
		var contextPath = $("#contextPath").val();
		
		/*if(type== 'debit'){
			if($("#balAmount").val() == "0.0"){
				$("#error").html("Balance ")
			}
		}*/
		 var txnRef = "";
		 var tenderMode = "";
		// var transctionDate = "";
		 var amount = "";
	     var totalAmount="";
	     var walletId="";
	    
		 if(tenderMode == "" || tenderMode == null || tenderMode == undefined){
			 tenderMode ="";
			}
		 totalAmount = $("#balAmount").val();
		 
		/* if(phone==""){
		  $("#selectedItemsList").css("display","none"); 
		 }*/
		 
	 if(operation == "new"){
		 txnRef = $("#txnRef").val();
		 if(txnRef == ""){
		 $("#txnRef").focus();
 		 $("#txnRefError").html("Please Enter Tax Reference");
 		 return;
 	 }
 	 else{
 		 $("#txnRefError").html("");
 	 }
 		 tenderMode = $("#tenderCode").val();
 		 phone = $("#mobile").val();
		 transctionDate = $("#date").val();
		 walletId = $("#walletId").val();
		 totalAmount = $("#balAmount").val();
		
		/* walletName = $("#name").val();
		 status = $("#status").val();*/
		 
		
		 
		/* if(transctionDate == ""){
 			 $("#date").focus();
 	 		 $("#txnRefError").html("Please Select Date");
 	 		 return;
 	 	 }
 	 	 else{
 	 		 $("#txnRefError").html("");
 	 	 }*/
  		
  		
		 
		 amount = $("#amount").val();
		 if(amount == ""){
			 $("#amount").focus();
			 $("#txnRefError").html("Please Enter Amount");
			 return false;
		 } else {
			 $("#txnRefError").html("");
		 }
		// amount = parseFloat(amount);
	 }
	  var maxRecords = 10;
	  if($("#maxRecords").length > 0)
		  maxRecords = $("#maxRecords").val();
	  var testBalance=totalAmount - amount;
	  if(type== 'debit'){
		  if(testBalance < 0){
			  $(".err").html("Debit amount must be less than balance amount")
			  return
		  }
	  }
	  debugger;
	  var URL = contextPath + "/crm /geteditWalletLedger.do";
		 $.ajax({
			type : "GET",
			url : URL,
			data : {
				id : programCode,
				operation : operation,
				phone:phone,
				walletName:walletName,
				status:status,
				index:index,
				maxRecords:maxRecords,
				txnRef : txnRef,
    			tender : tenderMode,
    		  //  date : transctionDate,
    			amount : amount,
    			walletId : walletId,
    			totalAmount : totalAmount,
    			type:type,
			},
			beforeSend: function(xhr){                    
		   			$("#loading").css("display","block");
		   			$("#mainDiv").addClass("disabled");
		   		  },
			success : function(result){

				$('#customerWalletTransdiv').html('');
				$('#customerWalletTransdiv').html(result);
				$('#selected-items-modal').modal('show');
				
				activeMenu("Wallet");
				$("#loading").css("display","none");
				$("#mainDiv").removeClass('disabled');
			},
			error : function(jqXHR, textStatus, errorThrown) {
				errorCode(jqXHR.status);
				$("#loading").css("display","none");
				$("#mainDiv").removeClass('disabled');
		
				//$("#txnRef").addClass('disabled');
				
				
			}
		 });
		 }









/*Added by:Koti Bommineni
Purpose :To Communicate with Controller
*/
 
function searchWallets(){
	
		debugger;
	 try{
		var contextPath = $('#contextPath').val();
	        // purpose:for checking internet conection
			var online = window.navigator.onLine;
		  	if(!online){
		  	alert("Check your internet connection,Please try agian after some time.");
		  	return;
		  	}
		  debugger
		  	var location = "";
	    	if($("#outletLocation").length > 0)
	    		location = $("#outletLocation").val();
	    	var zone = "";
	    	if($("#outletZone").length > 0)
	    		zone = $("#outletZone").val();
	    	var startdate = "";
	    	if($("#startDate").length > 0){
	    		startdate = $("#startDate").val();
	    	}else{
	    		
	    			
	    			
	    		 var dateTime = getCurrentDate();
	    	  	  var date = dateTime.split(' ');
	    	  	  date = date[0].split('/');
	    	  	  var formatedDate = date[1]+"/"+date[0]+"/"+date[2];
	    	  	  var startdate = formatedDate;	
	    	  	startdate = startdate

	    			
	    	}
	    	var enddate = "";
	    	if($("#endDate").length > 0){
	    		enddate = $("#endDate").val();
	    	}else{
	    		
	    		 var dateTime = getCurrentDate();
	    	  	  var date = dateTime.split(' ');
	    	  	  date = date[0].split('/');
	    	  	  var formatedDate = date[1]+"/"+date[0]+"/"+date[2];
	    	  	  var enddate = formatedDate;	
	    	  	enddate = enddate
	    		
	    		
	    		
	    	}
	    	var index = 0;
	    	
	    	
	    	 if ($("#startDate").val() != "" && $("#endDate").val() != "") {
	 	   		var noOfDays = daydiff(parseDate(startdate), parseDate(enddate));
	 	   		if (noOfDays < 0) {
	 	   			alert("Start Date can't be less than End Date");
	 	   			return;
	 	   		}
	 	   	}
	    	
	    	
	    	var searchName = "";
		 		if($("#searchWallet").length > 0 )
		 			searchName = $("#searchWallet").val().trim();
	    	
		 	 var maxRecords = 10;
		  if($("#maxRecords").length > 0)
			  maxRecords = $("#maxRecords").val();
		 		
		 		var allLocationsList = [];
		 	 var length = $('#outletLocation').children('option').length;
		       	$('#outletLocation option').each(function() { 
		       		allLocationsList.push( $(this).attr('value'));
		       	});
		 	 var  locationList="";
		    	for(i=1;i<allLocationsList.length;i++)
		    		{
		    		locationList =locationList+ allLocationsList[i]+',';
		    		}
		  var URL = contextPath + "/crm/viewWallets.do";
	    	 $.ajax({
	    		type : "GET",
	    		url : URL,
	    		data : {
	    			index : index,
	    			location : location,
	    			zone : zone,
	    			startdate : startdate,
	    			enddate : enddate,	    	
	    			searchName : searchName,
	    			maxRecords : maxRecords,
	    			/*membershipType : membershipType,
	    			allLocationsList : locationList,*/

	    		},
	    		beforeSend: function(xhr){                    
	   	   			$("#loading").css("display","block");
	   	   			$("#mainDiv").addClass("disabled");
	   	   		  },
	    		success : function(result){
	    	    	$('#right-side').html(result);
	    			activeMenu(id);
	    			$("#loading").css("display","none");
	    			$("#mainDiv").removeClass('disabled');
	    		},
	    		error : function(jqXHR, textStatus, errorThrown) {
	    			errorCode(jqXHR.status);
	    			$("#loading").css("display","none");
	 				$("#mainDiv").removeClass('disabled');
	    		}
	    	 });
	}
	catch(e)
	{
		errorCode(e);
	}
	}


function viewEditWallet(id,operation,index,childsearch){
	 try{
		 debugger;
	 var contextPath = $('#contextPath').val();
	 
	// purpose:for checking internet conection
		var online = window.navigator.onLine;
	  	if(!online){
	  	alert("Check your internet connection,Please try agian after some time.");
	  	return;
	  	}
	 
	var walletMaxRecords="10";
	
	if(childsearch == "" || childsearch == null || childsearch == undefined){
		childsearch ="";
	}
	
	var walletID = $("#promoCode").val();
	
	if(walletID == "" || walletID == null || walletID == undefined){
		walletID = "";
		}
	
	var searchName = "";
		if($("#searchChildWallet").length > 0 )
			searchName = $("#searchChildWallet").val().trim();
		
		if(operation == "" || operation == null || operation == undefined){
		operation = $("#operationwallet").val();
		}
	 var URL = contextPath + "/crm/viewEditWallet.do";
	 $.ajax({
		type : "GET",
		url : URL,
		data : {
			id : id,
			operation : operation,
			index:index,
			walletMaxRecords:walletMaxRecords,
			childsearch:childsearch,
			searchName:searchName,
			walletID :walletID,
		
		},
		beforeSend: function(xhr){                    
	   			$("#loading").css("display","block");
	   			$("#mainDiv").addClass("disabled");
	   		  },
		success : function(result){
			$('#right-side').html(result);
			
			activeMenu("Wallet");
			$("#loading").css("display","none");
			$("#mainDiv").removeClass('disabled');
		},
		error : function(jqXHR, textStatus, errorThrown) {
			errorCode(jqXHR.status);
			$("#loading").css("display","none");
			$("#mainDiv").removeClass('disabled');
		}
	 });
	 }catch(e)
	{
		errorCode(e);
	}

}






/*function viewEditWallet(id,operation,index,childsearch){
	 try{
		 debugger;
	 var contextPath = $('#contextPath').val();
	 
	// purpose:for checking internet conection
		var online = window.navigator.onLine;
	  	if(!online){
	  	alert("Check your internet connection,Please try agian after some time.");
	  	return;
	  	}
	 
	var walletMaxRecords="10";
	
	if(childsearch == "" || childsearch == null || childsearch == undefined){
		childsearch ="";
	}
	
	var searchName = "";
		if($("#searchChildWallet").length > 0 )
			searchName = $("#searchChildWallet").val().trim();
		
		if(operation == "" || operation == null || operation == undefined){
		operation = $("#operationwallet").val();
		}
	 var URL = contextPath + "/crm/viewEditWallet.do";
	 $.ajax({
		type : "GET",
		url : URL,
		data : {
			id : id,
			operation : operation,
			index:index,
			walletMaxRecords:walletMaxRecords,
			childsearch:childsearch,
			searchName:searchName,
		
		},
		beforeSend: function(xhr){                    
	   			$("#loading").css("display","block");
	   			$("#mainDiv").addClass("disabled");
	   		  },
		success : function(result){
			$('#right-side').html(result);
			
			activeMenu("Wallet");
			$("#loading").css("display","none");
			$("#mainDiv").removeClass('disabled');
		},
		error : function(jqXHR, textStatus, errorThrown) {
			errorCode(jqXHR.status);
			$("#loading").css("display","none");
			$("#mainDiv").removeClass('disabled');
		}
	 });
	 }catch(e)
	{
		errorCode(e);
	}

}*/













function viewWalletsLedgers(operation,programCode,walletId,phone,index){
	
	 try{
		 debugger;
		 var contextPath = $('#contextPath').val();
		 
		// purpose:for checking internet conection
			var online = window.navigator.onLine;
		  	if(!online){
		  	alert("Check your internet connection,Please try agian after some time.");
		  	return;
		  	}
		  	var saveflag='false';
		  	if(index== null || index == undefined ||index == '')
		  		index='0'
		  	 var maxRecords = 10;
			  if($("#maxRecords").length > 0)
				  maxRecords = $("#maxRecords").val();
			  
			  
		 var URL = contextPath + "/crm/getWalletLedger.do";
		 $.ajax({
			type : "GET",
			url : URL,
			data : {
				id : programCode,
				operation : operation,
				phone:phone,
				index:index,
				maxRecords:maxRecords,
				saveflag:saveflag,
				walletId:walletId,
			
			},
			beforeSend: function(xhr){                    
		   			$("#loading").css("display","block");
		   			$("#mainDiv").addClass("disabled");
		   		  },
			success : function(result){
				$('#right-side').html(result);
				$('#walletId').val(walletId);
				activeMenu("Wallet");
				$("#loading").css("display","none");
				$("#mainDiv").removeClass('disabled');
			},
			error : function(jqXHR, textStatus, errorThrown) {
				errorCode(jqXHR.status);
				$("#loading").css("display","none");
				$("#mainDiv").removeClass('disabled');
			}
		 });
		 }catch(e)
		{
			errorCode(e);
		}

}
function addNameToTextBox(id){
	debugger;
	walletsFiles = [];
	walletsFiles = event.target.files;
	var fileName=walletsFiles.length
	$("#importStatus").val(fileName);
	$("#importButton").val("Import")
}



function importDataxls(){
	//;
	debugger;
	
	
	if(walletsFiles.length <= 0)
	{
	alert("Please Select Excel Sheet... ");
		return;
	}
	
	var oMyForm = new FormData();
	//var files = id+'Files';

		oMyForm.append("file", walletsFiles[0]);
//		var fileSize = couponsFiles[0].size;

	var contextPath = $("#contextPath").val();
	URL = contextPath + "/dataManagement/walletsImportData.do";
	$.ajax({
		dataType : 'json',
		url : URL,
		data :	oMyForm,
		type : "POST",
		enctype: 'multipart/form-data',
		processData: false, 
		contentType:false,
		beforeSend: function(xhr){ 
			$("#importButton").val("")
			$("#importCoupounscircleWait").css("display","block");
   			
   		  },
		success : function(result) {
			debugger;
			$("#importCoupounscircleWait").css("display","none");
			messageStatus= JSON.stringify(result);
			var parsed_json = JSON.parse(messageStatus);
			var error = parsed_json.msg;
			$("#fileName").val(error)
			$("#fileNameShow").html(error)
			$("#importButton").val("Uploded")
			oMyForm ==null;
			walletsFiles = [];
			$("#wallets").val("")
			//alert(error);

			//var msg = parsed_json.msg;
			
		},
		error : function(e){
			debugger;
			$("#importCoupounscircleWait").css("display","none");
//			messageStatus= JSON.stringify(e.responseText);
  			var parsed_json = JSON.parse(e.responseText);
  			var error = parsed_json.errorUrl;
  			var errorUrl = parsed_json.errorUrl;
  			if(errorUrl != undefined && errorUrl !="")
  			{
  				var pattern = /\\/;
				var err = errorUrl.split(pattern);
				errorUrl = err[0] + "//" + err[1];	
  				//$("#errorUrl").attr("href", errorUrl); 
  				$("#url").css("display","block");

  			}

  			var msg = parsed_json.msg;
  			
  		alert("Something, went wrong.")
			
		}
	});
}


function ExportDataxls(walletProgramId,saveFlag,operation){
	debugger;
 	 var contextPath = $('#contextPath').val();
 	var maxRecords = 10;
 	if ($("#maxRecords").length > 0)
 		maxRecords = $("#maxRecords").val();	
 	//var operation = 'edit';
 	var searchName='';
 	var childsearch='';
 	var walletID='';
 	var index = '0';
 	 var URL = contextPath + "/crm/exportWallet.do";
 	 $.ajax({
 		type : "GET",
 		url : URL,
 		data : {
 			walletProgramId : walletProgramId,
 			operation:operation,
 			index:index,
 			maxRecords : maxRecords,
 			childsearch:childsearch,
 			searchName:searchName,
 			walletID:walletID,
 			saveFlag : saveFlag


 		},
 		beforeSend: function(xhr){                     
 			$("#loading").css("display","block");
 			$("#mainDiv").addClass("disabled");
 		},
	   		  success : function(result){
	   			  $('#generatedWallets').html(result);

	   			  if(saveFlag=="true"){
	   				  var anchor = document.createElement('a');
	   				  anchor.href = $("#downloadurl").val();
//	   				  alert($("#stockdownloadurl").val())
	   				  anchor.target = '_blank';
	   				  anchor.download = '';
	   				  if($("#downloadurl").val()!=null && $("#downloadurl").val()!='')
	   					  anchor.click();

	   			  }

	   			  $("#loading").css("display","none");
	   			  $("#mainDiv").removeClass('disabled');
	   		  },
	   		  error : function(){
	   			  alert("Internal error, please contact Technolabs support. ");
	   			  $("#loading").css("display","none");
	   			  $("#mainDiv").removeClass('disabled');
	   		  }
 	 });
 	 
  }
	 
/*function ExportTransactionsDataxls(operation,programCode,phone,index,saveflag){
	
	 try{
		 debugger;
		 $("#error").html("");
		 var walletId=$('#walletId').val();
		 var contextPath = $('#contextPath').val();
		 var rowCount = $("#example1 tr").length;
		 if(rowCount == 1){
			 $("#error").html("No, records found.");
			 return
		 }
			 
		// purpose:for checking internet conection
			var online = window.navigator.onLine;
		  	if(!online){
		  	alert("Check your internet connection,Please try agian after some time.");
		  	return;
		  	}
		  	
		  	 var maxRecords = 10;
			  if($("#maxRecords").length > 0)
				  maxRecords = $("#maxRecords").val();
			  
			  
		 var URL = contextPath + "/crm/getWalletLedger.do";
		 $.ajax({
			type : "GET",
			url : URL,
			data : {
				id : programCode,
				operation : operation,
				phone:phone,
				index:index,
				maxRecords:maxRecords,
				saveflag:saveflag,
				walletId:walletId,
			
			},
			beforeSend: function(xhr){                    
		   			$("#loading").css("display","block");
		   			$("#mainDiv").addClass("disabled");
		   		  },
			success : function(result){
				$('#right-side').html(result);
				//$('#generatedWallets').html(result);

	   			  if(saveflag=="true"){
	   				  var anchor = document.createElement('a');
	   				  anchor.href = $("#downloadurl").val();
//	   				  alert($("#stockdownloadurl").val())
	   				  anchor.target = '_blank';
	   				  anchor.download = '';
	   				  if($("#downloadurl").val()!=null && $("#downloadurl").val()!='')
	   					  anchor.click();

	   			  }
				activeMenu("Wallet");
				$("#loading").css("display","none");
				$("#mainDiv").removeClass('disabled');
			},
			error : function(jqXHR, textStatus, errorThrown) {
				errorCode(jqXHR.status);
				$("#loading").css("display","none");
				$("#mainDiv").removeClass('disabled');
			}
		 });
		 }catch(e)
		{
			errorCode(e);
		}

}
*/	 

function ExportTransactionsDataxls(operation,programCode,phone,index,saveflag,saveLedgerflag){
	
	 try{
		 debugger;
		 $("#error").html("");
		 var walletId = ""
			 if(saveLedgerflag == undefined || saveLedgerflag == null)
				 walletId = $('#walletId').val();
		 var contextPath = $('#contextPath').val();
		 var rowCount = $("#example1 tr").length;
		/* if(rowCount == 1){
			 $("#error").html("No, records found.");
			 return
		 }*/
			 
		// purpose:for checking internet conection
			var online = window.navigator.onLine;
		  	if(!online){
		  	alert("Check your internet connection,Please try agian after some time.");
		  	return;
		  	}
		  	
		  	 var maxRecords = 10;
			  if($("#maxRecords").length > 0)
				  maxRecords = $("#maxRecords").val();
			  
			  
		 var URL = contextPath + "/crm/getWalletLedger.do";
		 $.ajax({
			type : "GET",
			url : URL,
			data : {
				id : programCode,
				operation : operation,
				phone:phone,
				index:index,
				maxRecords:maxRecords,
				saveflag:saveflag,
				walletId:walletId,
			
			},
			beforeSend: function(xhr){                    
		   			$("#loading").css("display","block");
		   			$("#mainDiv").addClass("disabled");
		   		  },
			success : function(result){
				$('#right-side').html(result);
				//$('#generatedWallets').html(result);

	   			  if(saveflag=="true"){
	   				  var anchor = document.createElement('a');
	   				  anchor.href = $("#downloadurl").val();
//	   				  alert($("#stockdownloadurl").val())
	   				  anchor.target = '_blank';
	   				  anchor.download = '';
	   				  if($("#downloadurl").val()!=null && $("#downloadurl").val()!='')
	   					  anchor.click();

	   			  }
				activeMenu("Wallet");
				$("#loading").css("display","none");
				$("#mainDiv").removeClass('disabled');
			},
			error : function(jqXHR, textStatus, errorThrown) {
				errorCode(jqXHR.status);
				$("#loading").css("display","none");
				$("#mainDiv").removeClass('disabled');
			}
		 });
		 }catch(e)
		{
			errorCode(e);
		}

}



