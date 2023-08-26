
function CreateOrginization(searchName,index){

	debugger
	 //purpose:for checking internet conection
	var online = window.navigator.onLine;
  	if(!online)
  	{
  	alert("check your internet connection,please try agian after some time");
  	return;
  	}
	
	var contextPath = $('#contextPath').val();
	
	DisabelErrors();
	
	var OrganizationId = $("#OrganizationId").val();
	
	if(OrganizationId=="" || OrganizationId == null || OrganizationId== undefined)
		{
		
		$("#errorOrgId").css("display", "block");
		 return;
		}
	
	var IncorporationName = $("#IncorporationName").val();
	var status = $("#status").val();
	var DiscriptionId = $("#DiscriptionId").val();
	var GstinId = $("#GstinId").val();
	
	if(IncorporationName=="" || IncorporationName == null || IncorporationName== undefined)
	{
		$("#errorIncorporationName").css("display", "block");
	 return;
	}
	
	if(GstinId=="" || GstinId == null || GstinId== undefined)
	{
		$("#errorGstinId").css("display", "block");
	 return;
	}
	
	var panNo = $("#panNo").val();
	var bankAccNo = $("#bankAccNo").val();
	var WebSiteId = $("#WebSiteId").val();
	var phoneNumber = $("#phoneNumber").val();
	var EmailId = $("#EmailId").val();
	var IncorporationType = $("#IncorporationType").val();
	var streetName = $("#AddressId2").val();
	var city = $("#AddressId3").val();
	var Area = $("#AddressId4").val();
	var pinCode = $("#AddressId5").val();
	var businessType = $("#businessType").val();
	var Address = $("#AddressId1").val();
	
	
	if(panNo=="" || panNo == null || panNo== undefined)
	{
		$("#errorPANno").css("display", "block");
	 return;
	}
	
	if(bankAccNo=="" || bankAccNo == null || bankAccNo== undefined)
	{
		$("#errorbank").css("display", "block");
	 return;
	}
	
	if(WebSiteId=="" || WebSiteId == null || WebSiteId== undefined)
	{
		$("#errorwebsite").css("display", "block");
	 return;
	}
	
	if(Address=="" || Address == null || Address== undefined)
	{
		$("#errorAddressId").css("display", "block");
	 return;
	}
	
	
	
	if(streetName=="" || streetName == null || streetName== undefined)
	{
		$("#errorAddressId").css("display", "block");
	 return;
	}
	if(city=="" || city == null || city== undefined)
	{
		$("#errorAddressId").css("display", "block");
	 return;
	}
	if(Area=="" || Area == null || Area== undefined)
	{
		$("#errorAddressId").css("display", "block");
	 return;
	}
	if(pinCode=="" || pinCode == null || pinCode== undefined)
	{
		$("#errorAddressId").css("display", "block");
	 return;
	}
	
	
	var location =$("#location").val();
	
	if(location=="" || location == null || location== undefined)
	{
		$("#errorlocation").css("display", "block");
	 return;
	}
	
	var startIndex=index;
	location=JSON.stringify(location);
	
	if(searchName=="Edit")
		{
		var URL = contextPath + "/userAccessControl/editOrganizationMasterNew.do";
		}
	else
		{
		var URL = contextPath + "/userAccessControl/createOrganizationMasterNew.do";
		}
		
		$.ajax({
			type: "POST",
			url : URL,
			//contentType: "application/json",
			data : {
				location : location,
				organization : OrganizationId,
				incorporationName : IncorporationName,
				discription : DiscriptionId,
				gstin : GstinId,
				webSite :WebSiteId,
				phoneNumber : phoneNumber,
				email : EmailId,
				incorporationType : IncorporationType,
				address :Address,
				streetName :streetName,
				city :city,
				Area :Area,
				pinCode :pinCode,
				businessType :businessType,
				startIndex:startIndex,
				status:status,
				panNo:panNo,
				bankAccNo:bankAccNo,
			},
			beforeSend: function(xhr){                    
				$("#loading").css("display","block");
				$("#mainDiv").addClass("disabled");
			},
			success : function(result){
				$("#right-side").html(result);
				/*var anchor = document.createElement('a');
				anchor.href = $("#stockdownloadurl").val();
				anchor.target = '_blank';
				anchor.download = '';
				if($("#stockdownloadurl").val()!=null && $("#stockdownloadurl").val()!='')
					anchor.click();*/
				$("#loading").css("display","none");
				$("#mainDiv").removeClass('disabled');
			},
			error : function(e){
				console.log(JSON.stringify(e));
				alert("Something went wrong");
				$("#loading").css("display","none");
				$("#mainDiv").removeClass('disabled');
			}
		});
}

function DisabelErrors()
{
	debugger;
	$("#errorOrgId").css("display", "none");
	$("#errorIncorporationName").css("display", "none");
	$("#errorAddressId").css("display", "none");
	$("#errorGstinId").css("display", "none");
	
	$("#errorPANno").css("display", "none");
	$("#errorbank").css("display", "none");
	$("#errorwebsite").css("display", "none");
	$("#errorlocation").css("display", "none");


}
function getLocations()
	{
	debugger;
	
		var contextPath = $('#contextPath').val();
		var businessType = $("#businessType").val();
		var URL = contextPath + "/userAccessControl/getBusinessLocations.do";

	
	$.ajax({
		type: "POST",
		url : URL,
		
		data : {
			
			businessType :businessType,
			
		},
		beforeSend: function(xhr){                    
			$("#loading").css("display","block");
			$("#mainDiv").addClass("disabled");
		},
		success : function(result){
			
			appendBusinessLocation(result);
			$("#loading").css("display","none");
			$("#mainDiv").removeClass('disabled');
		},
		error : function(e){
			console.log(JSON.stringify(e));
			alert("Something went wrong");
			$("#loading").css("display","none");
			$("#mainDiv").removeClass('disabled');
		}
	});
	
	}

function RemoveAccountErr()
	{
	  $("#errorAccId").css("display", "none");
	  $("#errorAccName").css("display", "none");
	  $("#errorOrganizationId").css("display", "none");
	}


function CreateAsset(searchName,index){

	debugger
	 //purpose:for checking internet conection
	var online = window.navigator.onLine;
  	if(!online)
  	{
  	alert("check your internet connection,please try agian after some time");
  	return;
  	}
	
	var contextPath = $('#contextPath').val();
	
	
	var AccountId = $("#AccountId").val();
	var AccountName = $("#AccountName").val();
	var DiscriptionId = $("#DiscriptionId").val();

	var AccountType = $("#AccountType").val();
	var OrganizationId = $("#organization").val();
	if(OrganizationId == undefined)
		OrganizationId ='';
	
	if(AccountId=="" || AccountId == null || AccountId== undefined)
		{
		
		$("#errorAccId").css("display", "block");
		 return;
		}
	
	if(OrganizationId=="" || OrganizationId == null || OrganizationId== undefined)
	{
	
	$("#errorOrganizationId").css("display", "block");
	 return;
	}
	if(AccountName=="" || AccountName == null || AccountName== undefined)
	{
	
	$("#errorAccName").css("display", "block");
	 return;
	}

	
	

	//var location =$("#location").val();
	//location=JSON.stringify(location);
	var Status= $("#StatusId").val();
	if(searchName=="Edit")
		{
		var State = $("#StatusId").val();
		if(State=="Active")
			{
			Status="Active";
			}
		else
			{
				Status="Active";
			}
		var URL = contextPath + "/userAccessControl/editAssetMasterNew.do";
		}
	else
		{
		var URL = contextPath + "/userAccessControl/createAssetMasterNew.do";
		}
		
		$.ajax({
			type: "POST",
			url : URL,
			//contentType: "application/json",
			data : {
				accountId : AccountId,
				accountName : AccountName,
				OrganizationId:OrganizationId,
				discription : DiscriptionId,
				accountType : AccountType,
				Status		:Status,
				
			},
			beforeSend: function(xhr){                    
				$("#loading").css("display","block");
				$("#mainDiv").addClass("disabled");
			},
			success : function(result){
				$("#right-side").html(result);
				/*var anchor = document.createElement('a');
				anchor.href = $("#stockdownloadurl").val();
				anchor.target = '_blank';
				anchor.download = '';
				if($("#stockdownloadurl").val()!=null && $("#stockdownloadurl").val()!='')
					anchor.click();*/
				$("#loading").css("display","none");
				$("#mainDiv").removeClass('disabled');
			},
			error : function(e){
				console.log(JSON.stringify(e));
				alert("Something went wrong");
				$("#loading").css("display","none");
				$("#mainDiv").removeClass('disabled');
			}
		});
}




function CreateLiability(searchName,index){

	debugger
	 //purpose:for checking internet conection
	var online = window.navigator.onLine;
  	if(!online)
  	{
  	alert("check your internet connection,please try agian after some time");
  	return;
  	}
	
	var contextPath = $('#contextPath').val();
	
	
	var AccountId = $("#AccountId").val();
	var OrganizationId = $("#organization").val();
	if(OrganizationId == undefined)
		OrganizationId ='';
	
	if(AccountId=="" || AccountId == null || AccountId== undefined)
		{
		
		$("#errorAccId").css("display", "block");
		 return;
		}
	
	var AccountName = $("#AccountName").val();
	var DiscriptionId = $("#DiscriptionId").val();

	var AccountType = $("#AccountType").val();
	
	if(OrganizationId=="" || OrganizationId == null || OrganizationId== undefined)
	{
	
	$("#errorOrganizationId").css("display", "block");
	 return;
	}
	if(AccountName=="" || AccountName == null || AccountName== undefined)
	{
	
	$("#errorAccName").css("display", "block");
	 return;
	}

	//var location =$("#location").val();
	//location=JSON.stringify(location);
	var Status= $("#StatusId").val();
	if(searchName=="Edit")
		{
		var State = $("#StatusId").val();
		if(State=="Active")
			{
			Status="Active";
			}
		else
			{
			Status="Active";
			}
		var URL = contextPath + "/userAccessControl/editLiabilityMasterNew.do";
		}
	else
		{
		var URL = contextPath + "/userAccessControl/createLiabilityMasterNew.do";
		}
		
		$.ajax({
			type: "POST",
			url : URL,
			//contentType: "application/json",
			data : {
				accountId : AccountId,
				OrganizationId:OrganizationId,
				accountName : AccountName,
				discription : DiscriptionId,
				accountType : AccountType,
				Status		:Status,
				
			},
			beforeSend: function(xhr){                    
				$("#loading").css("display","block");
				$("#mainDiv").addClass("disabled");
			},
			success : function(result){
				$("#right-side").html(result);
				/*var anchor = document.createElement('a');
				anchor.href = $("#stockdownloadurl").val();
				anchor.target = '_blank';
				anchor.download = '';
				if($("#stockdownloadurl").val()!=null && $("#stockdownloadurl").val()!='')
					anchor.click();*/
				$("#loading").css("display","none");
				$("#mainDiv").removeClass('disabled');
			},
			error : function(e){
				console.log(JSON.stringify(e));
				alert("Something went wrong");
				$("#loading").css("display","none");
				$("#mainDiv").removeClass('disabled');
			}
		});
}


function CreateIncome(searchName,index){

	debugger
	 //purpose:for checking internet conection
	var online = window.navigator.onLine;
  	if(!online)
  	{
  	alert("check your internet connection,please try agian after some time");
  	return;
  	}
	
	var contextPath = $('#contextPath').val();
	
	
	var AccountId = $("#AccountId").val();
	var OrganizationId = $("#organization").val();
	if(OrganizationId == undefined)
		OrganizationId ='';
	
	if(AccountId=="" || AccountId == null || AccountId== undefined)
		{
		
		$("#errorAccId").css("display", "block");
		 return;
		}
	
	var AccountName = $("#AccountName").val();
	var DiscriptionId = $("#DiscriptionId").val();

	var AccountType = $("#AccountType").val();
	
	if(OrganizationId=="" || OrganizationId == null || OrganizationId== undefined)
	{
	
	$("#errorOrganizationId").css("display", "block");
	 return;
	}
	if(AccountName=="" || AccountName == null || AccountName== undefined)
	{
	
	$("#errorAccName").css("display", "block");
	 return;
	}
	
	//var location =$("#location").val();
	//location=JSON.stringify(location);
	var Status= $("#StatusId").val();
	if(searchName=="Edit")
		{
		var State = $("#StatusId").val();
		if(State=="Active")
			{
			Status="Active";
			}
		else
			{
			Status="Active";
			}
		var URL = contextPath + "/userAccessControl/editIncomeMasterNew.do";
		}
	else
		{
		var URL = contextPath + "/userAccessControl/createIncomeMasterNew.do";
		}
		
		$.ajax({
			type: "POST",
			url : URL,
			//contentType: "application/json",
			data : {
				accountId : AccountId,
				OrganizationId:OrganizationId,
				accountName : AccountName,
				discription : DiscriptionId,
				accountType : AccountType,
				Status		:Status,
				
			},
			beforeSend: function(xhr){                    
				$("#loading").css("display","block");
				$("#mainDiv").addClass("disabled");
			},
			success : function(result){
				$("#right-side").html(result);
				/*var anchor = document.createElement('a');
				anchor.href = $("#stockdownloadurl").val();
				anchor.target = '_blank';
				anchor.download = '';
				if($("#stockdownloadurl").val()!=null && $("#stockdownloadurl").val()!='')
					anchor.click();*/
				$("#loading").css("display","none");
				$("#mainDiv").removeClass('disabled');
			},
			error : function(e){
				console.log(JSON.stringify(e));
				alert("Something went wrong");
				$("#loading").css("display","none");
				$("#mainDiv").removeClass('disabled');
			}
		});
}


function CreateExpenses(searchName,index){

	debugger
	 //purpose:for checking internet conection
	var online = window.navigator.onLine;
  	if(!online)
  	{
  	alert("check your internet connection,please try agian after some time");
  	return;
  	}
	
	var contextPath = $('#contextPath').val();
	
	
	var AccountId = $("#AccountId").val();
	var OrganizationId = $("#organization").val();
	if(OrganizationId == undefined)
		OrganizationId ='';
	
	if(AccountId=="" || AccountId == null || AccountId== undefined)
		{
		
		$("#errorAccId").css("display", "block");
		 return;
		}
	
	var AccountName = $("#AccountName").val();
	var DiscriptionId = $("#DiscriptionId").val();

	var AccountType = $("#AccountType").val();
	
	if(OrganizationId=="" || OrganizationId == null || OrganizationId== undefined)
	{
	
	$("#errorOrganizationId").css("display", "block");
	 return;
	}
	if(AccountName=="" || AccountName == null || AccountName== undefined)
	{
	
	$("#errorAccName").css("display", "block");
	 return;
	}

	//var location =$("#location").val();
	//location=JSON.stringify(location);
	var Status= $("#StatusId").val();
	if(searchName=="Edit")
		{
		var State = $("#StatusId").val();
		if(State=="Active")
			{
			Status="Active";
			}
		else
			{
			Status="Active";
			}
		var URL = contextPath + "/userAccessControl/editExpensesMasterNew.do";
		}
	else
		{
		var URL = contextPath + "/userAccessControl/createExpensesMasterNew.do";
		}
		
		$.ajax({
			type: "POST",
			url : URL,
			//contentType: "application/json",
			data : {
				accountId : AccountId,
				OrganizationId:OrganizationId,
				accountName : AccountName,
				discription : DiscriptionId,
				accountType : AccountType,
				Status		:Status,
				
			},
			beforeSend: function(xhr){                    
				$("#loading").css("display","block");
				$("#mainDiv").addClass("disabled");
			},
			success : function(result){
				$("#right-side").html(result);
				/*var anchor = document.createElement('a');
				anchor.href = $("#stockdownloadurl").val();
				anchor.target = '_blank';
				anchor.download = '';
				if($("#stockdownloadurl").val()!=null && $("#stockdownloadurl").val()!='')
					anchor.click();*/
				$("#loading").css("display","none");
				$("#mainDiv").removeClass('disabled');
			},
			error : function(e){
				console.log(JSON.stringify(e));
				alert("Something went wrong");
				$("#loading").css("display","none");
				$("#mainDiv").removeClass('disabled');
			}
		});
}

// Added by Surya.k

function searchTransactions(SearchName,id){
	debugger;
	try{
		var online = window.navigator.onLine;
	  	if(!online){
	  	alert("Check your internet connection,Please try agian after some time.");
	  	return;
	  	}
	  	
	  	var AccountId = $("#accountId").val();
	  	var organization = $("#organization").val();
		var zone = $("#zone").val();
		var location = $("#location").val();
		var txnType = $("#TxnTypeF").val();
		var start_date = $("#start_date").val();
		var end_date = $("#end_date").val();
		var maxRecords='10';
		var index ='0';
		var contextPath = $('#contextPath').val();
		
		if ($("#start_date").val() != "" && $("#end_date").val() != "") {
	   	   		var noOfDays = daydiff(parseDate(start_date), parseDate(end_date));
	   	   		if (noOfDays < 0) {
	   	   			alert("Start Date can't be less than End Date");
	   	   			return;
	   	   		}
	   	   	}
	if(SearchName=='Asset')
		{
	
		var URL = contextPath + "/userAccessControl/showAssetsTransactions.do";
		}
	else if(SearchName=='Liabilites')
		{
		
		 var URL = contextPath + "/userAccessControl/showLiabilitesTransactions.do";
		}
	else if(SearchName=='Income')
		{
		
		 var URL = contextPath + "/userAccessControl/showIncomeTransactions.do";
		}		
	else if(SearchName=='Expenses')
		{
		
		 var URL = contextPath + "/userAccessControl/showExpensesTransactions.do";
		}
	else if(SearchName=='journal')
		{
		
		 var URL = contextPath + "/userAccessControl/viewJournalTransactions.do";
		}	
 
    $.ajax({
	url : URL,
	data : {
		AccountId:AccountId,
		Organization:organization,
		Zone:zone,
		Location:location,
		TxnType:txnType,
		Start_date:start_date,
		End_date:end_date,
		maxRecords:maxRecords,
		index:index,
	},
	beforeSend: function(xhr){                    
			$("#loading").css("display","block");
			$("#mainDiv").addClass("disabled");
	},
	success : function(result){
		$(".active-menu").removeClass("active-menu");
	//	$(".menu-open").css("display","none");
		$('#right-side').html(result);
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


//AssetAccountTransaction
function CreateAssetAccountTransaction(){

	debugger
	 //purpose:for checking internet conection
	var online = window.navigator.onLine;
  	if(!online)
  	{
  	alert("check your internet connection,please try agian after some time");
  	return;
  	}
	
	var contextPath = $('#contextPath').val();
	
	
	var AccountId = $("#accountId").val();
	
	if(AccountId=="" || AccountId == null || AccountId== undefined)
		{
		
		$("#errorAccId").css("display", "block");
		 return;
		}
	
var AccountName = $('#account_name').val();
 	
 	var TxnDiscription = $("#txnDescription").val();
 	 if(TxnDiscription == ""){
 		$("#txnDescription").focus();
 		 $("#txnDescriptionError").html("Please Enter Tax Description");
 		 return;
 	 }
 	 else{
 		 $("#txnDescriptionError").html("")
 		 
 	 }
 	 
 	var TxnValue = $("#txnValue").val();
 	if(TxnValue == ""){
 		$("#txnValue").focus();
 		 $("#txnValueError").html("Please Enter Total Amount");
 		 return;
 	 } else{
 		 $("#txnValueError").html("")
 	 }
	
	
	var AccountName = $("#accountName").val();
	var Location = $("#Location").val();
	var TxnDiscription = $("#txnDescription").val();
	var TxnDate = $("#date").val();
	var TxnType = $("#txnType").val();
	//var TxnValue = $("#txnValue").val();

	
	//var Status=true;
	
	var URL = contextPath + "/userAccessControl/createAssetsTransactions.do";
		
		
		$.ajax({
			type: "POST",
			url : URL,
			//contentType: "application/json",
			data : {
				accountId : AccountId,
				accountName : AccountName,
				location : Location,
				txnDiscription : TxnDiscription,
				txnDate : TxnDate,
				txnType		:TxnType,
				txnValue		:TxnValue,
				//Status		:Status,				
			},
			beforeSend: function(xhr){                    
				$("#loading").css("display","block");
				$("#mainDiv").addClass("disabled");
			},
			success : function(result){
				$("#right-side").html(result);
				/*var anchor = document.createElement('a');
				anchor.href = $("#stockdownloadurl").val();
				anchor.target = '_blank';
				anchor.download = '';
				if($("#stockdownloadurl").val()!=null && $("#stockdownloadurl").val()!='')
					anchor.click();*/
				$("#loading").css("display","none");
				$("#mainDiv").removeClass('disabled');
			},
			error : function(e){
				console.log(JSON.stringify(e));
				alert("Something went wrong");
				$("#loading").css("display","none");
				$("#mainDiv").removeClass('disabled');
			}
		});
}



function viewAssetTransactions(SearchName,id,index){
		debugger;
		try{
			var online = window.navigator.onLine;
		  	if(!online){
		  	alert("Check your internet connection,Please try agian after some time.");
		  	return;
		  	}
		  	
		 var maxRecords=10; 	
		 var AccountId=id;
		 var organization = '';
		 var zone = '';
		 var location ='';
		 var txnType = '';
		 var start_date = '';
		 var end_date = '';
		 var contextPath = $('#contextPath').val();
			
 		 var URL = contextPath + "/userAccessControl/showAssetsTransactions.do";
 		
		  	
		
	 
	    $.ajax({
		url : URL,
		data : {
			AccountId:AccountId,
			Organization:organization,
			Zone:zone,
			Location:location,
			TxnType:txnType,
			Start_date:start_date,
			End_date:end_date,
			maxRecords:maxRecords,
			index:index
		},
		beforeSend: function(xhr){                    
				$("#loading").css("display","block");
				$("#mainDiv").addClass("disabled");
		},
		success : function(result){
			$(".active-menu").removeClass("active-menu");
		//	$(".menu-open").css("display","none");
			$("#loading").css("display","none");
			$('#right-side').html(result);
			
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

// LiabilitesTransactions
function viewLiabilitesTransactions(SearchName,id,index){
	debugger;
	try{
		var online = window.navigator.onLine;
	  	if(!online){
	  	alert("Check your internet connection,Please try agian after some time.");
	  	return;
	  	}
	  	var maxRecords=10; 	
	 var AccountId=id;
	 var organization = '';
	 var zone = '';
	 var location ='';
	 var txnType = '';
	 var start_date = '';
	 var end_date = '';
		var contextPath = $('#contextPath').val();
		
	
	
		 var URL = contextPath + "/userAccessControl/showLiabilitesTransactions.do";
		
	  	
	
 
    $.ajax({
	url : URL,
	data : {
		AccountId:AccountId,
		Organization:organization,
		Zone:zone,
		Location:location,
		TxnType:txnType,
		Start_date:start_date,
		End_date:end_date,
		maxRecords:maxRecords,
		index:index
	},
	beforeSend: function(xhr){                    
			$("#loading").css("display","block");
			$("#mainDiv").addClass("disabled");
	},
	success : function(result){
		$(".active-menu").removeClass("active-menu");
	//	$(".menu-open").css("display","none");
		$('#right-side').html(result);
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

function CreateLiabilitesTransactions(){

	debugger
	 //purpose:for checking internet conection
	var online = window.navigator.onLine;
  	if(!online)
  	{
  	alert("check your internet connection,please try agian after some time");
  	return;
  	}
	
	var contextPath = $('#contextPath').val();
	
	
	var AccountId = $("#accountId").val();
	
	if(AccountId=="" || AccountId == null || AccountId== undefined)
		{
		
		$("#errorAccId").css("display", "block");
		 return;
		}
	
 var AccountName = $("#account_name").val();
 	 
	 var TxnDiscription = $("#txnDescription").val();
	 if(TxnDiscription == ""){
 		$("#txnDescription").focus();
 		 $("#txnDescriptionError").html("Please Enter Tax Description");
 		 return;
 	 }else
	 {
 		$("#txnDescriptionError").html("");
	 }
	 var TxnValue = $("#txnValue").val();
	 if(TxnValue == ""){
	 		$("#txnValue").focus();
	 		 $("#txnValueError").html("Please Enter Total Amount");
	 		 return;
	 	 }else
		 {
	 		$("#txnValueError").html("");
		 }
	var AccountName = $("#accountName").val();
	var TxnDiscription = $("#txnDescription").val();
	var Location = $("#Location").val();
	var TxnDate = $("#date").val();
	var TxnType = $("#txnType").val();
	

	
	//var Status=true;
	
	var URL = contextPath + "/userAccessControl/createLiabilitesTransactions.do";
		
		
		$.ajax({
			type: "POST",
			url : URL,
			//contentType: "application/json",
			data : {
				accountId : AccountId,
				accountName : AccountName,
				txnDiscription : TxnDiscription,
				location : Location,
				txnDate : TxnDate,
				txnType		:TxnType,
				txnValue		:TxnValue,
				//Status		:Status,				
			},
			beforeSend: function(xhr){                    
				$("#loading").css("display","block");
				$("#mainDiv").addClass("disabled");
			},
			success : function(result){
				$("#right-side").html(result);
				/*var anchor = document.createElement('a');
				anchor.href = $("#stockdownloadurl").val();
				anchor.target = '_blank';
				anchor.download = '';
				if($("#stockdownloadurl").val()!=null && $("#stockdownloadurl").val()!='')
					anchor.click();*/
				$("#loading").css("display","none");
				$("#mainDiv").removeClass('disabled');
			},
			error : function(e){
				console.log(JSON.stringify(e));
				alert("Something went wrong");
				$("#loading").css("display","none");
				$("#mainDiv").removeClass('disabled');
			}
		});
}

//IncomeTransactions
function viewIncomeTransactions(SearchName,id,index){
	debugger;
	try{
		var online = window.navigator.onLine;
	  	if(!online){
	  	alert("Check your internet connection,Please try agian after some time.");
	  	return;
	  	}
	  var maxRecords=10;	
	 var AccountId=id;
	 var organization = '';
	 var zone = '';
	 var location ='';
	 var txnType = '';
	 var start_date = '';
	 var end_date = '';
		var contextPath = $('#contextPath').val();
		
	
	
		 var URL = contextPath + "/userAccessControl/showIncomeTransactions.do";
		
	  	
	
 
    $.ajax({
	url : URL,
	data : {
		AccountId:AccountId,
		Organization:organization,
		Zone:zone,
		Location:location,
		TxnType:txnType,
		Start_date:start_date,
		End_date:end_date,
		maxRecords:maxRecords,
		index:index

	},
	beforeSend: function(xhr){                    
			$("#loading").css("display","block");
			$("#mainDiv").addClass("disabled");
	},
	success : function(result){
		$(".active-menu").removeClass("active-menu");
	//	$(".menu-open").css("display","none");
		$('#right-side').html(result);
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

function CreateIncomeTransactions(){

	debugger
	 //purpose:for checking internet conection
	var online = window.navigator.onLine;
  	if(!online)
  	{
  	alert("check your internet connection,please try agian after some time");
  	return;
  	}
	
	var contextPath = $('#contextPath').val();
	
	
	var AccountId = $("#accountId").val();
	
	if(AccountId=="" || AccountId == null || AccountId== undefined)
		{
		
		$("#errorAccId").css("display", "block");
		 return;
		}
	
	 var AccountName = $("#account_name").val();
	 var TxnDiscription = $("#txnDescription").val();
	 if(TxnDiscription == ""){
 		$("#txnDescription").focus();
 		 $("#txnDescriptionError").html("Please Enter Tax Description");
 		 return;
 	 }else{
 		$("#txnDescriptionError").html("");
 	 }
	 
	 var TxnValue = $("#txnValue").val();
	 if(TxnValue == ""){
	 		$("#txnValue").focus();
	 		 $("#txnValueError").html("Please Enter Total Amount");
	 		 return;
	 	 }else{
	 		$("#txnValueError").html("");
	 	 }
	
	
	var AccountName = $("#accountName").val();
	var TxnDiscription = $("#txnDescription").val();
	var TxnDate = $("#date").val();
	var TxnType = $("#txnType").val();
	
	var Location = $("#Location").val();
	
	//var Status=true;
	
	var URL = contextPath + "/userAccessControl/createIncomeTransactions.do";
		
		
		$.ajax({
			type: "POST",
			url : URL,
			//contentType: "application/json",
			data : {
				accountId : AccountId,
				accountName : AccountName,
				txnDiscription : TxnDiscription,
				location : Location,
				txnDate : TxnDate,
				txnType		:TxnType,
				txnValue		:TxnValue,
				//Status		:Status,				
			},
			beforeSend: function(xhr){                    
				$("#loading").css("display","block");
				$("#mainDiv").addClass("disabled");
			},
			success : function(result){
				$("#right-side").html(result);
				/*var anchor = document.createElement('a');
				anchor.href = $("#stockdownloadurl").val();
				anchor.target = '_blank';
				anchor.download = '';
				if($("#stockdownloadurl").val()!=null && $("#stockdownloadurl").val()!='')
					anchor.click();*/
				$("#loading").css("display","none");
				$("#mainDiv").removeClass('disabled');
			},
			error : function(e){
				console.log(JSON.stringify(e));
				alert("Something went wrong");
				$("#loading").css("display","none");
				$("#mainDiv").removeClass('disabled');
			}
		});
}


//ExpensesTransactions
function viewExpensesTransactions(SearchName,id,index){
	debugger;
	try{
		var online = window.navigator.onLine;
	  	if(!online){
	  	alert("Check your internet connection,Please try agian after some time.");
	  	return;
	  	}
	  	var maxRecords=10;
	 var AccountId=id;
	 var organization = '';
	 var zone = '';
	 var location ='';
	 var txnType = '';
	 var start_date = '';
	 var end_date = '';
		var contextPath = $('#contextPath').val();
		
	
	
		 var URL = contextPath + "/userAccessControl/showExpensesTransactions.do";
		
	  	
	

  $.ajax({
	url : URL,
	data : {
		AccountId:AccountId,
		Organization:organization,
		Zone:zone,
		Location:location,
		TxnType:txnType,
		Start_date:start_date,
		End_date:end_date,
		maxRecords:maxRecords,
		index:index
	},
	beforeSend: function(xhr){                    
			$("#loading").css("display","block");
			$("#mainDiv").addClass("disabled");
	},
	success : function(result){
		$(".active-menu").removeClass("active-menu");
	//	$(".menu-open").css("display","none");
		$('#right-side').html(result);
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

function CreateExpensesTransactions(){

	debugger
	 //purpose:for checking internet conection
	var online = window.navigator.onLine;
	if(!online)
	{
	alert("check your internet connection,please try agian after some time");
	return;
	}
	
	var contextPath = $('#contextPath').val();
	
	
	var AccountId = $("#accountId").val();
	
	if(AccountId=="" || AccountId == null || AccountId== undefined)
		{
		
		$("#errorAccId").css("display", "block");
		 return;
		}
	
	 var AccountName = $("#account_name").val();
	
	 var TxnDiscription = $("#txnDescription").val();
	 if(TxnDiscription == ""){
 		$("#txnDescription").focus();
 		 $("#txnDescriptionError").html("Please Enter Tax Description");
 		 return;
 	 }else{
 		$("#txnDescriptionError").html("");
 	 }
	 
	 var TxnValue = $("#txnValue").val();
	 if(TxnValue == ""){
	 		$("#txnValue").focus();
	 		 $("#txnValueError").html("Please Enter Total Amount");
	 		 return;
	 	 }else{
	 		$("#txnValueError").html("");
	 	 }
	
	
	var AccountName = $("#accountName").val();
	
	var TxnDate = $("#date").val();
	var TxnType = $("#txnType").val();
	
	var Location = $("#Location").val();
	
	//var Status=true;
	
	var URL = contextPath + "/userAccessControl/createExpensesTransactions.do";
		
		
		$.ajax({
			type: "POST",
			url : URL,
			//contentType: "application/json",
			data : {
				accountId : AccountId,
				accountName : AccountName,
				txnDiscription : TxnDiscription,
				location : Location,
				txnDate : TxnDate,
				txnType		:TxnType,
				txnValue		:TxnValue,
				//Status		:Status,				
			},
			beforeSend: function(xhr){                    
				$("#loading").css("display","block");
				$("#mainDiv").addClass("disabled");
			},
			success : function(result){
				$("#right-side").html(result);
				/*var anchor = document.createElement('a');
				anchor.href = $("#stockdownloadurl").val();
				anchor.target = '_blank';
				anchor.download = '';
				if($("#stockdownloadurl").val()!=null && $("#stockdownloadurl").val()!='')
					anchor.click();*/
				$("#loading").css("display","none");
				$("#mainDiv").removeClass('disabled');
			},
			error : function(e){
				console.log(JSON.stringify(e));
				alert("Something went wrong");
				$("#loading").css("display","none");
				$("#mainDiv").removeClass('disabled');
			}
		});
}


//journal 
function viewJournalTransactions(){
	debugger;
	try{
		var online = window.navigator.onLine;
	  	if(!online){
	  	alert("Check your internet connection,Please try agian after some time.");
	  	return;
	  	}
	  	
	 
	 var AccountType =$('#account_type').val();
	 var OrganizationId='';
	var contextPath = $('#contextPath').val();
		
	
	
	var URL = contextPath + "/userAccessControl/showJournal.do";

  $.ajax({
	url : URL,
	data : {
		AccountType:AccountType,
		OrganizationId:OrganizationId,
		
	},
	beforeSend: function(xhr){                    
			$("#loading").css("display","block");
			$("#mainDiv").addClass("disabled");
	},
	success : function(result){
		$(".active-menu").removeClass("active-menu");
	//	$(".menu-open").css("display","none");
		$('#right-side').html(result);
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

//journal 
function createJournalTransactions(){
	debugger;
	try{
		var online = window.navigator.onLine;
	  	if(!online){
	  	alert("Check your internet connection,Please try agian after some time.");
	  	return;
	  	}
	  	
	  	
	  	 var TxnDiscription = $("#txnDescription").val();
		 if(TxnDiscription == ""){
	 		$("#txnDescription").focus();
	 		 $("#txnDescriptionError").html("Please Enter Tax Description");
	 		 return;
	 	 }else{
	 		$("#txnDescriptionError").html("");
	 	 }
		 
		 var TxnValue = $("#txnValue").val();
		 if(TxnValue == ""){
		 		$("#txnValue").focus();
		 		 $("#txnValueError").html("Please Enter Total Amount");
		 		 return;
		 	 }else{
		 		$("#txnValueError").html("");
		 	 }
	  	
	  	
	  	
	  	
	 
	 var AccountType =$('#account_type').val();
	 var AccountId =$('#account_id').val();
	 var Location=$('#Location').val();
	 
	 var AccountName = $('#account_name').val();
	var TxnDiscription = $("#txnDescription").val();
	var TxnDate = $("#date").val();
	var TxnType = $("#txnType").val();
	var TxnValue = $("#txnValue").val();
	 //var Status =true;
	var contextPath = $('#contextPath').val();
		
	
	
	var URL = contextPath + "/userAccessControl/createJournal.do";

  $.ajax({
	url : URL,
	data : {
		AccountType:AccountType,
		accountId : AccountId,
		accountName : AccountName,
		txnDiscription : TxnDiscription,
		txnDate : TxnDate,
		txnType		:TxnType,
		txnValue		:TxnValue,
		location		:Location,
			
	},
	beforeSend: function(xhr){                    
			$("#loading").css("display","block");
			$("#mainDiv").addClass("disabled");
	},
	success : function(result){
		$(".active-menu").removeClass("active-menu");
	//	$(".menu-open").css("display","none");
		$('#right-side').html(result);
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


//journal 
function viewBalanceSheet(){
	debugger;
	try{
		var online = window.navigator.onLine;
	  	if(!online){
	  	alert("Check your internet connection,Please try agian after some time.");
	  	return;
	  	}
	  	
	
	var contextPath = $('#contextPath').val();
		
	
	var URL = contextPath + "/userAccessControl/viewBalanceSheet.do";

$.ajax({
	url : URL,
	data : {
	
			
	},
	beforeSend: function(xhr){                    
			$("#loading").css("display","block");
			$("#mainDiv").addClass("disabled");
	},
	success : function(result){
		$(".active-menu").removeClass("active-menu");
	//	$(".menu-open").css("display","none");
		$('#right-side').html(result);
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

function getOrganizationlocations(){
	debugger;
	try{
		var online = window.navigator.onLine;
	  	if(!online){
	  	alert("Check your internet connection,Please try agian after some time.");
	  	return;
	  	}
	  	
	
	var contextPath = $('#contextPath').val();
	var organization = $('#organization').val();	
		
	
	var URL = contextPath + "/userAccessControl/organizationLocations.do";

$.ajax({
	type:"POST",
	url : URL,
	data : {
	
		organization : organization,
	},
	beforeSend: function(xhr){                    
			$("#loading").css("display","block");
			$("#mainDiv").addClass("disabled");
	},
	success : function(result){
		
		 appendlocationsForDashbord(result);
		$(".active-menu").removeClass("active-menu");
	//	$(".menu-open").css("display","none");
		//$('#right-side').html(result);
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


function appendBusinessLocation(locationList){
	 debugger
	 try{

		 var online = window.navigator.onLine;
		 if(!online){
			 alert("Check your internet connection,Please try agian after some time.");
			 return;
		 }
		 
		
		 var op;
		 var wa = '';
		 var outlets ="";
		 var location = "";
		 
		 for(var i=0;i<locationList.length;i++){
			 outlets ="";
			 location = locationList[i].locationId;
			
			op += '<option value="'+location+'" >'+location+'</option>';
				
			 

		 }
		 $("#location").html('');
		 $("#location").html(op);
		
		 
			 }
	 catch(e)
	 {
		 errorCode(e);
	 }
	
}


function appendlocationsForDashbord(locationList){
	 debugger
	 try{

		 var online = window.navigator.onLine;
		 if(!online){
			 alert("Check your internet connection,Please try agian after some time.");
			 return;
		 }
		 
		
		 var op;
		 var wa = '';
		 var outlets ="";
		 var location = "";
		 
		 for(var i=0;i<locationList.length;i++){
			 outlets ="";
			 location = locationList[i].locationId;
			
			op += '<option value="'+location+'" >'+location+'</option>';
				
			 

		 }
		 $("#location").html('');
		 $("#location").html(op);
		 $("#Location").html('');
		 $("#Location").html(op);
		 
			 }
	 catch(e)
	 {
		 errorCode(e);
	 }
	
}


function getAccountList(){
	debugger;
	try{
		var online = window.navigator.onLine;
	  	if(!online){
	  	alert("Check your internet connection,Please try agian after some time.");
	  	return;
	  	}
	  	
	
	var contextPath = $('#contextPath').val();
	var accountType = $('#account_type').val();	
		
	
	var URL = contextPath + "/userAccessControl/getAccountList.do";

$.ajax({
	type:"POST",
	url : URL,
	data : {
	
		accountType : accountType,
	},
	beforeSend: function(xhr){                    
			$("#loading").css("display","block");
			$("#mainDiv").addClass("disabled");
	},
	success : function(result){
		
		 appendAccountlist(result);
		$(".active-menu").removeClass("active-menu");
	//	$(".menu-open").css("display","none");
		//$('#right-side').html(result);
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
function appendAccountlist(accountList){
	 debugger
	 try{

		 var online = window.navigator.onLine;
		 if(!online){
			 alert("Check your internet connection,Please try agian after some time.");
			 return;
		 }
		 
		
		 var accountid;
		 var accountname;
		 var wa = '';
		 var outlets ="";
		 var locations = "";
		 for(var i=0;i<accountList.length;i++){
			 outlets ="";
			 locations = accountList[i];
			 outlets = locations;
			 if(outlets.length > 1)
			 {
				 
				 accountid += '<option value="'+outlets.accountId+'" >'+outlets.accountName+''+outlets2+'</option>';
				 accountname += '<option value="'+outlets.accountName+'" >'+outlets.accountName+''+outlets2+'</option>';
			 }
			 else
			 {
				 accountid += '<option value="'+outlets.accountId+'" >'+outlets.accountName+'</option>';
				 accountname += '<option value="'+outlets.accountName+'" >'+outlets.accountName+'</option>';
				
			 }

		 }
		 $("#account_id").html('');
		 $("#account_id").html(accountid);
		 
		 $("#account_name").html('');
		 $("#account_name").html(accountname);
		
		 
			 }
	 catch(e)
	 {
		 errorCode(e);
	 }
	
}



function viewTrialBalance(){
	debugger;
	try{
		var online = window.navigator.onLine;
	  	if(!online){
	  	alert("Check your internet connection,Please try agian after some time.");
	  	return;
	  	}
	  	
	
	var contextPath = $('#contextPath').val();
	
	var	organization= $("#organization").val();
	if(organization ==undefined)
		organization=''; 
	
	var	startDate= $("#startDate").val();
	if(startDate ==undefined)
		startDate=''; 
	
	var	endDate= $("#endDate").val();
	if(endDate ==undefined)
		endDate=''; 
	
	var URL = contextPath + "/userAccessControl/viewTrialBalanceSheet.do";

$.ajax({
	url : URL,
	data : {
		organization:organization,
		startDate:startDate,
		endDate:endDate,
	},
	beforeSend: function(xhr){                    
			$("#loading").css("display","block");
			$("#mainDiv").addClass("disabled");
	},
	success : function(result){
		$(".active-menu").removeClass("active-menu");
	//	$(".menu-open").css("display","none");
		$('#right-side').html(result);
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


function syncOrganizationMaster(id,flowname){
	   debugger;
		try{
			var online = window.navigator.onLine;
		  	if(!online){
		  	alert("Check your internet connection,Please try agian after some time.");
		  	return;
		  	}

		var contextPath = $('#contextPath').val();
		
		var subAccountName="";
		var organization=id;
		var flowname=flowname;
		/*if(flowname=="STOCK ISSUE"){
			 subAccountName= $('#accountName').val();
			 
				if(subAccountName==""){
					alert("Please select Account Name.");
					return;
				}
		}*/
		
		if(organization==""){
			
			organization =$('#organization').val();
			if(organization==""){
				alert("Please select OrganizationId.");
			  	return;
			}
		
		}
		 var URL = contextPath + "/userAccessControl/syncOrganizationMaster.do";
		
	
  
		 
 	    $.ajax({
 		url : URL,
 		data : {
 			organization:organization,
 			flowname:flowname,
 			subAccountName:subAccountName,
 			
 		},
 		beforeSend: function(xhr){                    
				$("#loading").css("display","block");
				$("#mainDiv").addClass("disabled");
 		},
 		success : function(result){
 			$(".active-menu").removeClass("active-menu");
 		//	$(".menu-open").css("display","none");
 			//$('#right-side').html(result);
 			if(result == 'Success'){
 				alert(id + "Sync Successfully completed");
 				if(flowname=="STOCK ISSUE"){
 					getSalesAndPayments('back','salesandpayments','','false');
 				}else if(flowname=="GRN"){
 					getPurchasesAndPayments('back','purchasesPayments','','false');
 				}
 			}else{
 				alert(id + "Sync failed...");
 			}
 			
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
function viewProfitAndLoss(){
	debugger;
	try{
		var online = window.navigator.onLine;
	  	if(!online){
	  	alert("Check your internet connection,Please try agian after some time.");
	  	return;
	  	}
	  	
	
	var contextPath = $('#contextPath').val();
		
	var	organization= $("#organization").val();
	if(organization ==undefined)
		organization=''; 
	
	var	Strategy= $("#strategy").val();
	if(Strategy ==undefined)
		Strategy=''; 
	
	var	startDate= $("#startDate").val();
	if(startDate ==undefined)
		startDate=''; 
	
	var	endDate= $("#endDate").val();
	if(endDate ==undefined)
		endDate=''; 
	
	var URL = contextPath + "/userAccessControl/viewProfitAndLoss.do";

$.ajax({
	url : URL,
	data : {
	
		organization:organization,
		startDate:startDate,
		endDate:endDate,
		Strategy:Strategy,
	},
	beforeSend: function(xhr){                    
			$("#loading").css("display","block");
			$("#mainDiv").addClass("disabled");
	},
	success : function(result){
		$(".active-menu").removeClass("active-menu");
	//	$(".menu-open").css("display","none");
		$('#right-side').html(result);
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


function CreateSubAsset(searchName,index){

	debugger
	 //purpose:for checking internet conection
	var online = window.navigator.onLine;
  	if(!online)
  	{
  	alert("check your internet connection,please try agian after some time");
  	return;
  	}
	
	var contextPath = $('#contextPath').val();
	
	if(searchName=="Edit")
	{
	var AccountId = $("#editAccountId").val();
	var SubAccountId = $('#editSub_AccountId').val();
	var SubAccountName = $("#editSub_AccountName").val();
	var SubDiscriptionId = $("#editSub_DiscriptionId").val();
	var Status=$("#editStatusId").val();
	var AccountType=$("#editSub_AccountType").val();
	}else{
		var AccountId = $("#AccountId").val();
		var SubAccountId = $('#Sub_AccountId').val();
		var SubAccountName = $("#Sub_AccountName").val();
		var SubDiscriptionId = $("#Sub_DiscriptionId").val();
		var Status=$("#StatusId").val();
		var AccountType=$("#Sub_AccountType").val();
	}
	var organizationId = $("#organization").val();
	var accountName = $("#accountName").val();
	
	
	if(AccountId=="" || AccountId == null || AccountId== undefined)
		{
		
		$("#errorAccId").css("display", "block");
		 return;
		}
	if(SubAccountId=="" || SubAccountId == null || SubAccountId== undefined)
	{
	
	$("#errorAccId").css("display", "block");
	 return;
	}
	if(SubAccountName=="" || SubAccountName == null || SubAccountName== undefined)
	{
	
	$("#errorAccId").css("display", "block");
	 return;
	}

	
	if(searchName=="Edit")
		{
		var URL = contextPath + "/userAccessControl/editSubAssetMaster.do";
		}
	else
		{
		var URL = contextPath + "/userAccessControl/createSubAssetMaster.do";
		}
		
		$.ajax({
			type: "POST",
			url : URL,
			//contentType: "application/json",
			data : {
				accountId : AccountId,		
				subaccountId : SubAccountId,
				subaccountName : SubAccountName,
				subdiscription : SubDiscriptionId,			
				accountType : AccountType,
				Status		:Status,
				organizationId:organizationId,
				accountName:accountName,
				
			},
			beforeSend: function(xhr){                    
				$("#loading").css("display","block");
				$("#mainDiv").addClass("disabled");
			},
			success : function(result){
				$("#right-side").html(result);
				if(searchName=="Edit")
				{
					$('#editModal').modal('show');
				}else{
					$('#myModal').modal('show');
				}
				
				$("#loading").css("display","none");
				$("#mainDiv").removeClass('disabled');
			},
			error : function(e){
				console.log(JSON.stringify(e));
				alert("Something went wrong");
				$("#loading").css("display","none");
				$("#mainDiv").removeClass('disabled');
			}
		});
}

//Added by Surya.k on 27/04/2019

function AssetSubLedger(SearchName,organizationId,accountid,accountName,index){
	debugger;
	try{
		var online = window.navigator.onLine;
	  	if(!online){
	  	alert("Check your internet connection,Please try agian after some time.");
	  	return;
	  	}
	 
	 var maxRecords =10;
	 var AccountId=accountid;
	 var organization = organizationId;
	 var AccountName = accountName;
	 var start_date = $('#startDate').val();;
	 var end_date = $('#endDate').val();;
	 var status = $('#status').val();
	 if(status=="all")
		 status='';
	 if(SearchName=="clear"){
		 status='';
		 end_date='';
		 start_date='';
		 
	 }
	 var contextPath = $('#contextPath').val();
		
	var URL = contextPath + "/userAccessControl/showAssetSubLedger.do";
		
	  	
	
 
    $.ajax({
	url : URL,
	data : {
		AccountId:AccountId,
		AccountName:AccountName,
		Organization:organization,
		Start_date:start_date,
		End_date:end_date,
		status:status,
		maxRecords:maxRecords,
		index:index,
	},
	beforeSend: function(xhr){                    
			$("#loading").css("display","block");
			$("#mainDiv").addClass("disabled");
	},
	success : function(result){
		$(".active-menu").removeClass("active-menu");
	//	$(".menu-open").css("display","none");
		$("#loading").css("display","none");
		$('#right-side').html(result);
		
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
//Added by Surya.k on 27/04/2019
function createAssetsSubLedger(SearchName,id){
	debugger;
	try{
		var online = window.navigator.onLine;
	  	if(!online){
	  	alert("Check your internet connection,Please try agian after some time.");
	  	return;
	  	}
	  	
	 var AccountId=id;
	
	 var contextPath = $('#contextPath').val();
		
		 var URL = contextPath + "/userAccessControl/createAssetSubLedger.do";
    $.ajax({
	url : URL,
	data : {
		AccountId:AccountId,
	},
	beforeSend: function(xhr){                    
			$("#loading").css("display","block");
			$("#mainDiv").addClass("disabled");
	},
	success : function(result){
		$(".active-menu").removeClass("active-menu");
		$("#loading").css("display","none");
		$('#right-side').html(result);
		
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
//Added by Surya.k on 27/04/2019
function viewAssetsSubLedger(SearchName,accountId,subAccountId){
	debugger;
	try{
		var online = window.navigator.onLine;
	  	if(!online){
	  	alert("Check your internet connection,Please try agian after some time.");
	  	return;
	  	}
	  	
	 var AccountId=accountId;
	 var SubAccountId=subAccountId;
	 var organizationId = $("#organization").val();
	var accountName = $("#accountName").val();
	 var contextPath = $('#contextPath').val();
	
	 if(SearchName == 'View'){
		 var URL = contextPath + "/userAccessControl/viewAssetSubLedger.do";
	 }else{
		 var URL = contextPath + "/userAccessControl/editAssetSubLedger.do";
	 }
    
    
    $.ajax({
	url : URL,
	data : {
		AccountId:AccountId,
		SubAccountId:SubAccountId,
		organizationId:organizationId,
		accountName:accountName,
	},
	beforeSend: function(xhr){                    
			$("#loading").css("display","block");
			$("#mainDiv").addClass("disabled");
	},
	success : function(result){
		$(".active-menu").removeClass("active-menu");
		$("#loading").css("display","none");
		$('#right-side').html(result);
		if(SearchName == 'View'){
			$('#viewModal').modal('show');
		}else{
			$('#editModal').modal('show');
		}
		
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

function CreateSubLiabilities(searchName,index){

	debugger
	 //purpose:for checking internet conection
	var online = window.navigator.onLine;
  	if(!online)
  	{
  	alert("check your internet connection,please try agian after some time");
  	return;
  	}
	
	var contextPath = $('#contextPath').val();
	
	if(searchName=="Edit")
	{
	var AccountId = $("#editAccountId").val();
	var SubAccountId = $('#editSub_AccountId').val();
	var SubAccountName = $("#editSub_AccountName").val();
	var SubDiscriptionId = $("#editSub_DiscriptionId").val();
	var Status=$("#editStatusId").val();
	var AccountType=$("#editSub_AccountType").val();
	}else{
		var AccountId = $("#AccountId").val();
		var SubAccountId = $('#Sub_AccountId').val();
		var SubAccountName = $("#Sub_AccountName").val();
		var SubDiscriptionId = $("#Sub_DiscriptionId").val();
		var Status=$("#StatusId").val();
		var AccountType=$("#Sub_AccountType").val();
	}
	
	
	var organizationId = $("#organization").val();
	var accountName = $("#accountName").val();
	
	if(AccountId=="" || AccountId == null || AccountId== undefined)
		{
		
		$("#errorAccId").css("display", "block");
		 return;
		}
	if(SubAccountId=="" || SubAccountId == null || SubAccountId== undefined)
	{
	
	$("#errorAccId").css("display", "block");
	 return;
	}
	

	
	if(searchName=="Edit")
		{
		var URL = contextPath + "/userAccessControl/editSubLiabilitiesMaster.do";
		}
	else
		{
		var URL = contextPath + "/userAccessControl/createSubLiabilitiesMaster.do";
		}
		
		$.ajax({
			type: "POST",
			url : URL,
			//contentType: "application/json",
			data : {
				accountId : AccountId,		
				subaccountId : SubAccountId,
				subaccountName : SubAccountName,
				subdiscription : SubDiscriptionId,			
				accountType : AccountType,
				Status		:Status,
				organizationId:organizationId,
				accountName:accountName,
				
			},
			beforeSend: function(xhr){                    
				$("#loading").css("display","block");
				$("#mainDiv").addClass("disabled");
			},
			success : function(result){
				$("#right-side").html(result);
				if(searchName=="Edit")
				{
					$('#editModal').modal('show');
				}else{
					$('#myModal').modal('show');
				}
				$("#loading").css("display","none");
				$("#mainDiv").removeClass('disabled');
			},
			error : function(e){
				console.log(JSON.stringify(e));
				alert("Something went wrong");
				$("#loading").css("display","none");
				$("#mainDiv").removeClass('disabled');
			}
		});
}

//Added by Surya.k on 27/04/2019
function LiabilitiesSubLedger(SearchName,organizationId,accountid,accountName,index){
	debugger;
	try{
		var online = window.navigator.onLine;
	  	if(!online){
	  	alert("Check your internet connection,Please try agian after some time.");
	  	return;
	  	}
	 
	 var maxRecords =10;
	 var AccountId=accountid;
	 var organization = organizationId;
	 var AccountName = accountName;
	 var start_date = $('#startDate').val();;
	 var end_date = $('#endDate').val();;
	 var status = $('#status').val();
	 if(status=="all")
		 status='';
	 if(SearchName=="clear"){
		 status='';
		 end_date='';
		 start_date='';
		 
	 }
	 var contextPath = $('#contextPath').val();
		
		 var URL = contextPath + "/userAccessControl/showLiabilitiesSubLedger.do";
		
	  	
	
 
    $.ajax({
	url : URL,
	data : {
		AccountId:AccountId,
		AccountName:AccountName,
		Organization:organization,
		Start_date:start_date,
		End_date:end_date,
		status:status,
		maxRecords:maxRecords,
		index:index,
	},
	beforeSend: function(xhr){                    
			$("#loading").css("display","block");
			$("#mainDiv").addClass("disabled");
	},
	success : function(result){
		$(".active-menu").removeClass("active-menu");
	//	$(".menu-open").css("display","none");
		$("#loading").css("display","none");
		$('#right-side').html(result);
		
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
//Added by Surya.k on 27/04/2019
function createLiabilitiesSubLedger(SearchName,id){
	debugger;
	try{
		var online = window.navigator.onLine;
	  	if(!online){
	  	alert("Check your internet connection,Please try agian after some time.");
	  	return;
	  	}
	  	
	 var AccountId=id;
	
	 var contextPath = $('#contextPath').val();
		
		 var URL = contextPath + "/userAccessControl/createLiabilitiesSubLedger.do";
    $.ajax({
	url : URL,
	data : {
		AccountId:AccountId,
	},
	beforeSend: function(xhr){                    
			$("#loading").css("display","block");
			$("#mainDiv").addClass("disabled");
	},
	success : function(result){
		$(".active-menu").removeClass("active-menu");
		$("#loading").css("display","none");
		$('#right-side').html(result);
		
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
//Added by Surya.k on 27/04/2019
function viewLiabilitiesSubLedger(SearchName,accountId,subAccountId){
	debugger;
	try{
		var online = window.navigator.onLine;
	  	if(!online){
	  	alert("Check your internet connection,Please try agian after some time.");
	  	return;
	  	}
	  	
	 var AccountId=accountId;
	 var SubAccountId=subAccountId;

	 var organizationId = $("#organization").val();
		var accountName = $("#accountName").val();

	 var contextPath = $('#contextPath').val();
	
	 if(SearchName == 'View'){
		 var URL = contextPath + "/userAccessControl/viewLiabilitiesSubLedger.do";
	 }else{
		 var URL = contextPath + "/userAccessControl/editLiabilitiesSubLedger.do";
	 }
    
    
    $.ajax({
	url : URL,
	data : {
		AccountId:AccountId,
		SubAccountId:SubAccountId,
		organizationId:organizationId,
		accountName:accountName,
	},
	beforeSend: function(xhr){                    
			$("#loading").css("display","block");
			$("#mainDiv").addClass("disabled");
	},
	success : function(result){
		$(".active-menu").removeClass("active-menu");
		$("#loading").css("display","none");
		$('#right-side').html(result);
		if(SearchName == 'View'){
			$('#viewModal').modal('show');
		}else{
			$('#editModal').modal('show');
		}
		
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
function CreateSubIncome(searchName,index){

	debugger
	 //purpose:for checking internet conection
	var online = window.navigator.onLine;
  	if(!online)
  	{
  	alert("check your internet connection,please try agian after some time");
  	return;
  	}
	
  	if(searchName=="Edit")
	{
	var AccountId = $("#editAccountId").val();
	var SubAccountId = $('#editSub_AccountId').val();
	var SubAccountName = $("#editSub_AccountName").val();
	var SubDiscriptionId = $("#editSub_DiscriptionId").val();
	var Status=$("#editStatusId").val();
	var AccountType=$("#editSub_AccountType").val();
	}else{
		var AccountId = $("#AccountId").val();
		var SubAccountId = $('#Sub_AccountId').val();
		var SubAccountName = $("#Sub_AccountName").val();
		var SubDiscriptionId = $("#Sub_DiscriptionId").val();
		var Status=$("#StatusId").val();
		var AccountType=$("#Sub_AccountType").val();
	}
  	
	var contextPath = $('#contextPath').val();
	

	 var organizationId = $("#organization").val();
		var accountName = $("#accountName").val();

	
	
	if(AccountId=="" || AccountId == null || AccountId== undefined)
		{
		
		$("#errorAccId").css("display", "block");
		 return;
		}
	if(SubAccountId=="" || SubAccountId == null || SubAccountId== undefined)
	{
	
	$("#errorAccId").css("display", "block");
	 return;
	}
	

	if(searchName=="Edit")
		{
		var URL = contextPath + "/userAccessControl/editSubIncomeMaster.do";
		}
	else
		{
		var URL = contextPath + "/userAccessControl/createSubIncomeMaster.do";
		}
		
		$.ajax({
			type: "POST",
			url : URL,
			//contentType: "application/json",
			data : {
				accountId : AccountId,		
				subaccountId : SubAccountId,
				subaccountName : SubAccountName,
				subdiscription : SubDiscriptionId,			
				accountType : AccountType,
				Status		:Status,
				organizationId:organizationId,
				accountName:accountName,
			},
			beforeSend: function(xhr){                    
				$("#loading").css("display","block");
				$("#mainDiv").addClass("disabled");
			},
			success : function(result){
				$("#right-side").html(result);
				if(searchName=="Edit")
				{
					$('#editModal').modal('show');
				}else{
					$('#myModal').modal('show');
				}
				$("#loading").css("display","none");
				$("#mainDiv").removeClass('disabled');
			},
			error : function(e){
				console.log(JSON.stringify(e));
				alert("Something went wrong");
				$("#loading").css("display","none");
				$("#mainDiv").removeClass('disabled');
			}
		});
}
//Added by Surya.k on 27/04/2019
function IncomeSubLedger(SearchName,organizationId,accountid,accountName,index){
	debugger;
	try{
		var online = window.navigator.onLine;
	  	if(!online){
	  	alert("Check your internet connection,Please try agian after some time.");
	  	return;
	  	}
	 
	 var maxRecords =10;
	 var AccountId=accountid;
	 var organization = organizationId;
	 var AccountName = accountName;
	 var start_date = $('#startDate').val();;
	 var end_date = $('#endDate').val();;
	 var status = $('#status').val();
	 if(status=="all")
		 status='';
	 if(SearchName=="clear"){
		 status='';
		 end_date='';
		 start_date='';
		 
	 }
	 var contextPath = $('#contextPath').val();
		
		 var URL = contextPath + "/userAccessControl/showIncomeSubLedger.do";
		
	  	
	

  $.ajax({
	url : URL,
	data : {
		AccountId:AccountId,
		AccountName:AccountName,
		Organization:organization,
		Start_date:start_date,
		End_date:end_date,
		status:status,
		maxRecords:maxRecords,
		index:index,
	},
	beforeSend: function(xhr){                    
			$("#loading").css("display","block");
			$("#mainDiv").addClass("disabled");
	},
	success : function(result){
		$(".active-menu").removeClass("active-menu");
	//	$(".menu-open").css("display","none");
		$("#loading").css("display","none");
		$('#right-side').html(result);
		
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
//Added by Surya.k on 27/04/2019
function createIncomeSubLedger(SearchName,id){
	debugger;
	try{
		var online = window.navigator.onLine;
	  	if(!online){
	  	alert("Check your internet connection,Please try agian after some time.");
	  	return;
	  	}
	  	
	 var AccountId=id;
	
	 var contextPath = $('#contextPath').val();
		
		 var URL = contextPath + "/userAccessControl/createIncomeSubLedger.do";
  $.ajax({
	url : URL,
	data : {
		AccountId:AccountId,
	},
	beforeSend: function(xhr){                    
			$("#loading").css("display","block");
			$("#mainDiv").addClass("disabled");
	},
	success : function(result){
		$(".active-menu").removeClass("active-menu");
		$("#loading").css("display","none");
		$('#right-side').html(result);
		
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
//Added by Surya.k on 27/04/2019
function viewIncomeSubLedger(SearchName,accountId,subAccountId){
	debugger;
	try{
		var online = window.navigator.onLine;
	  	if(!online){
	  	alert("Check your internet connection,Please try agian after some time.");
	  	return;
	  	}
	  	
	 var AccountId=accountId;
	 var SubAccountId=subAccountId;

	 var organizationId = $("#organization").val();
		var accountName = $("#accountName").val();

	 var contextPath = $('#contextPath').val();
	
	 if(SearchName == 'View'){
		 var URL = contextPath + "/userAccessControl/viewIncomeSubLedger.do";
	 }else{
		 var URL = contextPath + "/userAccessControl/editIncomeSubLedger.do";
	 }
  
  
  $.ajax({
	url : URL,
	data : {
		AccountId:AccountId,
		SubAccountId:SubAccountId,
		organizationId:organizationId,
		accountName:accountName,
	},
	beforeSend: function(xhr){                    
			$("#loading").css("display","block");
			$("#mainDiv").addClass("disabled");
	},
	success : function(result){
		$(".active-menu").removeClass("active-menu");
		$("#loading").css("display","none");
		$('#right-side').html(result);
		if(SearchName == 'View'){
			$('#viewModal').modal('show');
		}else{
			$('#editModal').modal('show');
		}
		
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

function CreateSubExpenses(searchName,index){

	debugger
	 //purpose:for checking internet conection
	var online = window.navigator.onLine;
  	if(!online)
  	{
  	alert("check your internet connection,please try agian after some time");
  	return;
  	}
	
	var contextPath = $('#contextPath').val();
	
	if(searchName=="Edit")
	{
	var AccountId = $("#editAccountId").val();
	var SubAccountId = $('#editSub_AccountId').val();
	var SubAccountName = $("#editSub_AccountName").val();
	var SubDiscriptionId = $("#editSub_DiscriptionId").val();
	var Status=$("#editStatusId").val();
	var AccountType=$("#editSub_AccountType").val();
	
	}else{
		var AccountId = $("#AccountId").val();
		var SubAccountId = $('#Sub_AccountId').val();
		var SubAccountName = $("#Sub_AccountName").val();
		var SubDiscriptionId = $("#Sub_DiscriptionId").val();
		var Status=$("#StatusId").val();
		var AccountType=$("#Sub_AccountType").val();
	}

	 var organizationId = $("#organization").val();
		var accountName = $("#accountName").val();

	
	if(AccountId=="" || AccountId == null || AccountId== undefined)
		{
		
		$("#errorAccId").css("display", "block");
		 return;
		}
	if(SubAccountId=="" || SubAccountId == null || SubAccountId== undefined)
	{
	
	$("#errorAccId").css("display", "block");
	 return;
	}
	

	
	if(searchName=="Edit")
		{
		var URL = contextPath + "/userAccessControl/editSubExpensesMaster.do";
		}
	else
		{
		var URL = contextPath + "/userAccessControl/createSubExpensesMaster.do";
		}
		
		$.ajax({
			type: "POST",
			url : URL,
			//contentType: "application/json",
			data : {
				accountId : AccountId,		
				subaccountId : SubAccountId,
				subaccountName : SubAccountName,
				subdiscription : SubDiscriptionId,			
				accountType : AccountType,
				Status		:Status,
				organizationId:organizationId,
				accountName:accountName,
				
			},
			beforeSend: function(xhr){                    
				$("#loading").css("display","block");
				$("#mainDiv").addClass("disabled");
			},
			success : function(result){
				$("#right-side").html(result);
				if(searchName=="Edit")
				{
					$('#editModal').modal('show');
				}else{
					$('#myModal').modal('show');
				}
				$("#loading").css("display","none");
				$("#mainDiv").removeClass('disabled');
			},
			error : function(e){
				console.log(JSON.stringify(e));
				alert("Something went wrong");
				$("#loading").css("display","none");
				$("#mainDiv").removeClass('disabled');
			}
		});
}
//Added by Surya.k on 27/04/2019
function ExpensesSubLedger(SearchName,organizationId,accountid,accountName,index){
	debugger;
	try{
		var online = window.navigator.onLine;
	  	if(!online){
	  	alert("Check your internet connection,Please try agian after some time.");
	  	return;
	  	}
	 
	 var maxRecords =10;
	 var AccountId=accountid;
	 var organization = organizationId;
	 var AccountName = accountName;
	 var start_date = $('#startDate').val();;
	 var end_date = $('#endDate').val();;
	 var status = $('#status').val();
	 if(status=="all")
		 status='';
	 if(SearchName=="clear"){
		 status='';
		 end_date='';
		 start_date='';
		 
	 }
	 var contextPath = $('#contextPath').val();
		
		 var URL = contextPath + "/userAccessControl/showExpensesSubLedger.do";
		
	  	
	

  $.ajax({
	url : URL,
	data : {
		AccountId:AccountId,
		AccountName:AccountName,
		Organization:organization,
		Start_date:start_date,
		End_date:end_date,
		status:status,
		maxRecords:maxRecords,
		index:index,
	},
	beforeSend: function(xhr){                    
			$("#loading").css("display","block");
			$("#mainDiv").addClass("disabled");
	},
	success : function(result){
		$(".active-menu").removeClass("active-menu");
	//	$(".menu-open").css("display","none");
		$("#loading").css("display","none");
		$('#right-side').html(result);
		
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
//Added by Surya.k on 27/04/2019
function createExpensesSubLedger(SearchName,id){
	debugger;
	try{
		var online = window.navigator.onLine;
	  	if(!online){
	  	alert("Check your internet connection,Please try agian after some time.");
	  	return;
	  	}
	  	
	 var AccountId=id;
	
	 var contextPath = $('#contextPath').val();
		
		 var URL = contextPath + "/userAccessControl/createExpensesSubLedger.do";
  $.ajax({
	url : URL,
	data : {
		AccountId:AccountId,
	},
	beforeSend: function(xhr){                    
			$("#loading").css("display","block");
			$("#mainDiv").addClass("disabled");
	},
	success : function(result){
		$(".active-menu").removeClass("active-menu");
		$("#loading").css("display","none");
		$('#right-side').html(result);
		
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
//Added by Surya.k on 27/04/2019
function viewExpensesSubLedger(SearchName,accountId,subAccountId){
	debugger;
	try{
		var online = window.navigator.onLine;
	  	if(!online){
	  	alert("Check your internet connection,Please try agian after some time.");
	  	return;
	  	}
	  	
	 var AccountId=accountId;
	 var SubAccountId=subAccountId;

	 var organizationId = $("#organization").val();
		var accountName = $("#accountName").val();

	 var contextPath = $('#contextPath').val();
	
	 if(SearchName == 'View'){
		 var URL = contextPath + "/userAccessControl/viewExpensesSubLedger.do";
	 }else{
		 var URL = contextPath + "/userAccessControl/editExpensesSubLedger.do";
	 }
  
  
  $.ajax({
	url : URL,
	data : {
		AccountId:AccountId,
		SubAccountId:SubAccountId,
		organizationId:organizationId,
		accountName:accountName,
	},
	beforeSend: function(xhr){                    
			$("#loading").css("display","block");
			$("#mainDiv").addClass("disabled");
	},
	success : function(result){
		$(".active-menu").removeClass("active-menu");
		$("#loading").css("display","none");
		$('#right-side').html(result);
		if(SearchName == 'View'){
			$('#viewModal').modal('show');
		}else{
			$('#editModal').modal('show');
		}
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


//Added by Surya.k on 17/06/2019
function syncTransaction(flowName,organizationId){
	debugger;
	try{
		var online = window.navigator.onLine;
	  	if(!online){
	  	alert("Check your internet connection,Please try agian after some time.");
	  	return;
	  	}
	  	
	 var flowname=flowName;
	 var organization=$('#organization').val();;
	if(organization==""){
		alert("Please select organizationId.");
	  	return;
	}
	 
	 var contextPath = $('#contextPath').val();
	
	 var URL = contextPath + "/userAccessControl/syncTransaction.do";
  
  
  $.ajax({
	url : URL,
	data : {
		flowname:flowname,
		organization:organization,
	},
	beforeSend: function(xhr){                    
			$("#loading").css("display","block");
			$("#mainDiv").addClass("disabled");
	},
	success : function(result){
		
		if(result == 'Success'){
				alert(id + "Sync Successfully completed");
			}else{
				alert(id + "Sync failed...");
			}
		$(".active-menu").removeClass("active-menu");
		$("#loading").css("display","none");
		$('#right-side').html(result);
		
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




function searchProducts(name, searchCategory){
	debugger;
	var online = window.navigator.onLine;
  	if(!online)
  	{
  	alert("check your internet connection,please try agian after some time");
  	return;
  	}
	var storeLocation = $("#outletLocation option:selected").text();
	 var storeLocationWithoutDesc =storeLocation.split("-");
	storeLocation = storeLocationWithoutDesc[0];
	
	var supplier_Id = "";
	var supplierflag="false";
		var contextPath = $("#contextPath").val();
		if(searchCategory == "payments"){
			var type = $("#warehouseLocation").val();
		
					
			 if(type == "Warehouse")
				 URL = contextPath + "/inventorymanager/searchWarehouseProducts.do";
			 else if(type == "Retail Outlet" || type == "Restaurant")
				 URL = contextPath + "/inventorymanager/searchProducts.do";
			 else
				 URL = contextPath + "/inventorymanager/searchProducts.do";
		}else{
			var type = $("#warehouseLocation").val();
			
			
			 if(type == "Warehouse")
				 URL = contextPath + "/inventorymanager/searchWarehouseProducts.do";
			 else if(type == "Retail Outlet" || type == "Restaurant")
				 URL = contextPath + "/inventorymanager/searchProducts.do";
			 else
				 URL = contextPath + "/inventorymanager/searchProducts.do";
		}
		
			 if(storeLocation =='ALL')
				 storeLocation = "";
		 $.ajax({
    			type: "GET",
    			url : URL,
    			data : {
    				searchName : name,
    				storeLocation : storeLocation,
    				supplier : supplier_Id,
    				supplierflag : supplierflag
    			},
    			beforeSend: function(xhr){                    
 	   	   			$("#loading").css("display","block");
 	   	   			$("#mainDiv").addClass("disabled");
 	   	   		  },
    			success : function(result) {
            		appendProducts(result, searchCategory);
            		
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

 

function appendProducts(productsList, searchCategory){
	 $("."+searchCategory).html('');
	 var op = '';
	
	 if(searchCategory == 'itemname'){
		
		 for(var i=0;i<productsList.length;i++){
			 if(productsList[i].skuID == productsList[i].description){
					 if (i == 0) {
						 op += '<li id="'+productsList[i].skuID+'"  class="selected" onclick=getId(this,"'+searchCategory+'"); ><a>'+productsList[i].description+'   </a></li>';
					}else
					     op += '<li id="'+productsList[i].skuID+'" onclick=getId(this,"'+searchCategory+'"); ><a>'+productsList[i].description+'   </a></li>';
		 	}
			 else{
				 if (i == 0) {
					 op += '<li id="'+productsList[i].skuID+'"  class="selected" onclick=getId(this,"'+searchCategory+'"); ><a>'+productsList[i].description+'   (SKU ID   -   '+productsList[i].skuID+')</a></li>';
				}else
				     op += '<li id="'+productsList[i].skuID+'"  onclick=getId(this,"'+searchCategory+'"); ><a>'+productsList[i].description+'   (SKU ID   -   '+productsList[i].skuID+')</a></li>';
			 }
		 } 
	 }
	 else{
		 for(var i=0;i<productsList.length;i++){
			 if(productsList[i].skuID == productsList[i].description){
					 if (i == 0) {
						 op += '<li id="'+productsList[i].skuID+'"  class="selected" onclick=getId(this,"'+searchCategory+'"); ><a>'+productsList[i].description+'   </a></li>';
					}else
					     op += '<li id="'+productsList[i].skuID+'" onclick=getId(this,"'+searchCategory+'"); ><a>'+productsList[i].description+'   </a></li>';
		 	}
			 else{
				 if (i == 0) {
					 op += '<li id="'+productsList[i].skuID+'"  class="selected" onclick=getId(this,"'+searchCategory+'"); ><a>'+productsList[i].description+'   (SKU ID   -   '+productsList[i].skuID+')</a></li>';
				}else
				     op += '<li id="'+productsList[i].skuID+'" onclick=getId(this,"'+searchCategory+'"); ><a>'+productsList[i].description+'   (SKU ID   -   '+productsList[i].skuID+')</a></li>';
			 }
		 } 
		 
	 }
	 
	 $("."+searchCategory).html(op);
	 $("."+searchCategory).show();
	 
}
	 



function getId(element,type){
	debugger;
	var id= $(element).attr("id");
	var description = null;
	description =  $("#"+id).children("a").text();
	description = description.split(' ( ');
	description = description[0];
	$("#desc").val(description);
	if(type == "apparel")
		getItemDetails(id,type);
	else if(type == "po")
		getItemDetails(id,type);
	else if(type == "receipt")
		getSkuDetails(id);
	else if(type == "payments")
		getPaymentSkuDetails(id);
	else if(type == "debitNoteItems")
		getdebitNoteSkuDetails(id);
	else if(type == "salespayments")
		getSalesPaymentsSkuDetails(id);
	else if(type == "poRef"){
		$("#po_reference").val(id);
		$("#selected_po_ref").val(id);
		getPoItems(id);
	}
	else if(type == "searchShipmentNoteRefs"){
		$("#searchShipmentNoteRefs").val(id);
		$("#shipment_note").val(id);
		getShipmentNoteItems(id);
	}
	else if(type == "quoteRef"){
		$("#quoteReference").val(id);
		$("#quoteRef").val(id);
		addQuoteItemsToPurchaseOrder(id);
	}
	else if(type == "insemployee"){
		$("#searchEmployee").val(id);
		//$("#quoteRef").val(id);
		return searchInspectedEmployee('','','0');
	}
	else if(type == "recemployee"){
		$("#searchRecEmployee").val(id);
	//	$("#quoteRef").val(id);
		return searchInspectedEmployee('','','0');
	}
	else if(type == "itemname"){
		$(".itemwise").val(description);
		$("#skuidpo").val(id);
		//return searchPurchaseOrders('','','0');
		}
	 $(".services").hide();
	 $("."+type).html("");
}



function getdebitNoteSkuDetails(skuId){
	 debugger;
		var online = window.navigator.onLine;
	  	if(!online)
	  	{
	  	alert("check your internet connection,please try agian after some time");
	  	return;
	  	}
	 //debugger
	 var contextPath = $("#contextPath").val();
	 var storeLocation = $("#warehouse_location option:selected").text();
	 if(storeLocation=='')
		 storeLocation =$("#outletLocation").val();
	 var WarehouseReturnflag=$("#whreturnflag").val();
		if(WarehouseReturnflag == "" || WarehouseReturnflag == undefined || WarehouseReturnflag == null){
			WarehouseReturnflag="";
   		}
	 var type = $("#warehouse_location").val();
	 if(type == "Warehouse")
		 URL = contextPath + "/inventorymanager/getWarehouseSkuDetails.do";
	 else if(type == "Retail Outlet" || type == "Restaurant")
		 URL = contextPath + "/inventorymanager/getSkuDetails.do";
	 else 
		 URL = contextPath + "/inventorymanager/getSkuDetails.do";
	 $.ajax({
   			type: "GET",
   			url : URL,
   			data : {
   				skuId : skuId,
   				storeLocation : storeLocation,
				WarehouseReturnflag:WarehouseReturnflag
   			},
   			beforeSend: function(xhr){                    
   	   			$("#loading").css("display","block");
   	   			$("#mainDiv").addClass("disabled");
   	   		  },
   			success : function(result) {
   				
   				$("#loading").css("display","none");
   				$("#mainDiv").removeClass('disabled');
   				appendDebitNoteSkuDetails(result);
   			},
   			error : function() {
   				 alert("something went wrong");
   				$("#loading").css("display","none");
 				$("#mainDiv").removeClass('disabled');
   			}
   		});
}


function appendDebitNoteSkuDetails(skuDetails){
	 debugger;
	 
	 var parsedJson = jQuery.parseJSON(skuDetails);
		$("#searchItems").val("");
		skuList = parsedJson.skuLists;
		
		
		//written by manasa
		//purpose:to get track item when we call warehouse location
		var storeLocation = $("#warehouse_location option:selected").text();
		 var type = $("#warehouse_location").val();
		
		if(skuList.length >1){
			var priceLength = skuList.length;
			var priceArray = [];
			$("#itemsList tbody").html("");
			for(var i=0; i<priceLength; i++){
				
				if(type == "Warehouse")
					skuList[i].trackingRequired = itemTrack;
				
				var price = skuList[i].costPrice;
				if (! $.inArray(price, priceArray) > -1)
				{
					priceArray.push(price);
					var row = '<tr id=price'+i+' style="margin-top:5px;cursor:pointer;white-space: nowrap;"  ><td><input type="checkbox" name="selectall" class="selectableCheckbox" id="selectall" value='+i+' /></td><td>'+skuList[i].description+'</td><td>'+price+'</td><td>'+skuList[i].measureRange+'</td><td>'+skuList[i].productRange+'</td><td>'+skuList[i].brandCode+'</td><td>'+skuList[i].color+'</td><td>'+skuList[i].size+'</td><td>'+skuList[i].ean+'</td></tr>';
					//'<li id="'+productsList[i].skuID+'"  class="selected" onclick=getId(this,"'+searchCategory+'"); ><a>'+productsList[i].description+'   -   '+productsList[i].skuID+'</a></li>';
					$("#itemsList tbody").append(row);
				}
			}
			var  op = '<a id="selectPrice"  data-toggle="modal" data-target="#items-modal"></a>';
			 $("#triggerEvent").append(op);
			 $("#selectPrice" ).trigger( "click" );
			 $("#triggerEvent").html("");
		}
		else{
			addDebitNoteSku(skuList[0]);
		}
		
}

function addDebitNoteSku(sku){
	 var contextPath = $("#contextPath").val();
	 var len = parseInt($("#productsList tr").length);
		if (len != 1)
			len = parseInt($("#productsList tr:last").attr("id").replace('dynamicdiv', '')) + 1;
		
		
		
		
		 if(sku.trackingRequired == false){
		for (var i = 1; i <= len; i++) {
			if ($("#skuId" + i).val() == sku.skuId && $("#Price"+i).text() == sku.costPrice && $("#pluCode" + i).val() == sku.pluCode && sku.trackingRequired == false) {
				var pack =  parseInt($("#Pack"+i).text()*2);
				//var requested=parseInt($("#Requested"+i).text())+1;
 			 $("#Pack"+i).text(pack);
 			 $("#Supplied"+i).text(pack);
 			 $("#Received"+i).text(pack);
		   $("#Requested"+i).text(0);
			 $("#Rejected"+i).text(0);
 			 var cost =  parseFloat($("#Price"+i).text());
 			
 			 $("#Cost"+i).text(pack*cost);
 			 changeTotalCost();
 			 changeTotalQuantity();
     		 return;
			}
		}
		}
		var description = null;
		if (sku.description != "" && sku.description != null)
			description = sku.description;
		else
			description = $("#desc").val();
		var brandCode = sku.brandCode;
		if(brandCode == null)
			sku.brandCode = "";
		var category = sku.category;
		if(category == null)
			sku.category = "";
		var productRange = sku.productRange;
		if(productRange == null)
			sku.productRange = "";
		var measureRange = sku.measureRange;
		if(measureRange == null)
			sku.measureRange = "";
		var utility = sku.utility;
		if(utility == null)
			sku.utility = "";
		
		var batchNum = sku.productBatchNo;
		if(batchNum == null)
			sku.productBatchNo = "";
		
		var color = sku.color;
		if(color == null)
			sku.color = "";
		var size = sku.size;
		if(size == null)
			sku.size = "";
		var ean = sku.ean;
		if(ean == null)
			sku.ean = "";
		var make = sku.uom;
		if(make == "" || make == null)
			make = "_";
		
		var hsnCode = sku.hsnCode;
		if(hsnCode == null)
			sku.hsnCode = "";
		
		var scanCode = sku.itemScanCode;
		if(scanCode == null)
			sku.itemScanCode = "";
		
		
		/*written by manasa 
		purpose:to get track item*/
		if(sku.trackingRequired == "" || sku.trackingRequired == null)
			sku.trackingRequired = false;
		
	  /*  added by manasa
		purpose:to get cgst and sgst igst rates Taxrates*/
		
		var tax = sku.tax;
		var taxamount = 0.0;
		
		
		if(sku.trackingRequired == "" || sku.trackingRequired == null)
			sku.trackingRequired = false;
		
		var taxRate=0.0;
		var skutaxRate=0.0;
		if(tax!=null)
			if(tax.length>0){
			 taxRate=tax[0].taxRate;
			 skutaxRate=(tax[0].taxRate)*2;
			}
		
		var cgstTaxRate=0.0;
		if(tax!=null)
			if(tax.length>0){
		for(var i=0;i<tax.length;i++)
		{
		if(tax[i].taxCode == "CGST")
			cgstTaxRate = tax[i].taxRate;
		}
		}
		
		
		var sgstTaxRate=0.0;
		if(tax!=null)
			if(tax.length>0){
		for(var i=0;i<tax.length;i++)
		{
		if(tax[i].taxCode == "SGST")
			sgstTaxRate = tax[i].taxRate;
		}
		}
		
		
		
		var igstRate=0.0;
		if(tax!=null)
			if(tax.length>0){
		for(var i=0;i<tax.length;i++)
		{
		if(tax[i].taxCode == "IGST")
			
		igstRate = tax[i].taxRate;
		}
		}	
		
		 var  taxamount=0.0;
		if(tax!=null)
			if(tax.length>0){
					taxamount = parseFloat(((sku.costPrice)*taxRate)/100).toFixed(2);
			}
		
		
		
	
		var slNo = 1; 
			 $('.slno').each(function(){
				$(this).text(slNo);
				slNo = parseInt(slNo) + 1;
			});
		
				var row = "<tr id='dynamicdiv"+len+"' style='margin-top:5px;height:35px'><td class='slno'>"+slNo+"</td>" +
				"<td id='skuId"+len+"'>"+sku.skuId+"</td>" +	    			
			"<td id='description"+len+"'>"+description+"</td>"+
			"<td id='Qty"+len+"' class='Qty' onBlur='changeQty(this);' onkeypress='return (this.innerText.length < 10)' contenteditable='true'>1</td>" +
			"<td id='costPrice"+len+"'>"+sku.costPrice+"</td>" +
			"<td id='tax"+len+"'>"+skutaxRate+"</td>" +
			"<td id='cost"+len+"'>"+sku.costPrice+"</td>" +
			"<td id='resonForReturn"+len+"'></td>" +
			"</tr>";
			$("#productsList tbody").append(row);
		
			grandTotal();
	

}


function grandTotal(){
		debugger;
		
		var len = parseInt($("#productsList tr").length);
		var netCost =0;
		for (var i = 1; i < len; i++) {
			 netCost = netCost + parseInt($('#cost'+i).text());
			
		}
		$('#grandTotal').html(netCost);
		//$('#Invoice_Amount').html(netCost);
	}
	
	function changeQty(element){
		debugger;
		var id = $(element).attr("id");
		var rowNo = id.replace('Qty','');
		var Qty = $('#Qty'+rowNo).text();
		var Price = $('#costPrice'+rowNo).text();
		
		var totalValue =Qty*Price; 		
		$('#cost'+rowNo).html(totalValue);
		
		grandTotal();
	}

	function editAccountTransaction(accountId,accountName,location,description,date,creditAmt,debitAmt,sno){
		debugger;
		
		$("#accountId").val(accountId);
		$("#accountName").val(accountName);
		$("#txnDescription").val(description);
		$("#date").val(date);
		$("#Location").val(location);
		$("#sno").val(sno);
		if(creditAmt!="0.00"){
			$("#txnValue").val(creditAmt);
			$("#txnType").val("Credit");
		}else{
			$("#txnValue").val(debitAmt);
			$("#txnType").val("Debit");
		}
		
		var Account = $("#accountId").val();;
		var AccountName = $("#accountName").val();;
		var Location = $("#Location").val();
		var TxnDiscription = $("#txnDescription").val();
		var TxnDate = $("#date").val();
		var TxnType = $("#txnType").val();
		var TxnValue = $("#txnValue").val();

		$("#updateBtn").show();
		 $("#sumbitBtn").hide();
	}
	
	function updateAccountTransaction(accountType){
		
		debugger
		 //purpose:for checking internet conection
		var online = window.navigator.onLine;
	  	if(!online)
	  	{
	  	alert("check your internet connection,please try agian after some time");
	  	return;
	  	}
		
		var contextPath = $('#contextPath').val();
		
		
		var AccountId = $("#accountId").val();
		
		if(AccountId=="" || AccountId == null || AccountId== undefined)
			{
			
			$("#errorAccId").css("display", "block");
			 return;
			}
		
		var AccountName = $("#accountName").val();
		var Location = $("#Location").val();
		var TxnDiscription = $("#txnDescription").val();
		var TxnDate = $("#date").val();
		var TxnType = $("#txnType").val();
		var TxnValue = $("#txnValue").val();
		var sno = $("#sno").val();
		
		
		var URL = contextPath + "/userAccessControl/editAccountTransactions.do";
			
			
			$.ajax({
				type: "POST",
				url : URL,
				//contentType: "application/json",
				data : {
					accountId : AccountId,
					accountName : AccountName,
					location : Location,
					txnDiscription : TxnDiscription,
					txnDate : TxnDate,
					txnType		:TxnType,
					txnValue		:TxnValue,
					accountType:accountType,
					sno:sno,
					//Status		:Status,				
				},
				beforeSend: function(xhr){                    
					$("#loading").css("display","block");
					$("#mainDiv").addClass("disabled");
				},
				success : function(result){
					$("#right-side").html(result);
					$("#loading").css("display","none");
					$("#mainDiv").removeClass('disabled');
				},
				error : function(e){
					console.log(JSON.stringify(e));
					alert("Something went wrong");
					$("#loading").css("display","none");
					$("#mainDiv").removeClass('disabled');
				}
			});
	}
	
	function deleteAccountTransaction(sno,accountType,accountId){
		debugger;
		var online = window.navigator.onLine;
	  	if(!online)
	  	{
	  	alert("check your internet connection,please try agian after some time");
	  	return;
	  	}
		//var sno=sNo;
		//var accountType=accountType;
		var contextPath = $('#contextPath').val();
		
		var URL = contextPath + "/userAccessControl/deleteAccountTransactions.do";
		
		
			
			
			$.ajax({
				type: "POST",
				url : URL,
				//contentType: "application/json",
				data : {
					sno : sno,
					accountType:accountType,
				},
				beforeSend: function(xhr){                    
					$("#loading").css("display","block");
					$("#mainDiv").addClass("disabled");
				},
				success : function(result){
					$("#right-side").html(result);
					if(accountType=="Assets"){
						viewAssetTransactions('',accountId,'');
					}else if(accountType=="Liability"){
						viewLiabilitesTransactions('',accountId,'');
					}else if(accountType=="Income"){
						viewIncomeTransactions('',accountId,'');
					}else{
						viewExpensesTransactions('',accountId,'');
					}
					
					$("#loading").css("display","none");
					$("#mainDiv").removeClass('disabled');
				},
				error : function(e){
					console.log(JSON.stringify(e));
					alert("Something went wrong");
					$("#loading").css("display","none");
					$("#mainDiv").removeClass('disabled');
				}
			});
		
	}
	
	function editJournal(sno,date,location,description,creditAmt,debitAmt,accType,accId,accName){
		
		debugger;
		$("#account_id").val(accId);
		$("#account_name").val(accName);
		$("#txnDescription").val(description);
		$("#date").val(date);
		$("#Location").val(location);
		$("#account_type").val(accType);
		
		$("#sno").val(sno);
		if(creditAmt!="0.00"){
			$("#txnValue").val(creditAmt);
			$("#txnType").val("Credit");
		}else{
			$("#txnValue").val(debitAmt);
			$("#txnType").val("Debit");
		}
		
		var Account = $("#account_id").val();;
		var AccountName = $("#account_name").val();;
		var Location = $("#Location").val();
		var TxnDiscription = $("#txnDescription").val();
		var TxnDate = $("#date").val();
		var TxnType = $("#txnType").val();
		var TxnValue = $("#txnValue").val();

		$("#updateBtn").show();
		 $("#sumbitBtn").hide();
		
		
	}
	

	function updateJournal(){
		
		debugger
		 //purpose:for checking internet conection
		var online = window.navigator.onLine;
	  	if(!online)
	  	{
	  	alert("check your internet connection,please try agian after some time");
	  	return;
	  	}
		
		var contextPath = $('#contextPath').val();
		
		
		var AccountId = $("#account_id").val();
		
		if(AccountId=="" || AccountId == null || AccountId== undefined)
			{
			
			$("#errorAccId").css("display", "block");
			 return;
			}
		
		var AccountName = $("#account_name").val();
		var Location = $("#Location").val();
		var TxnDiscription = $("#txnDescription").val();
		var TxnDate = $("#date").val();
		var TxnType = $("#txnType").val();
		var TxnValue = $("#txnValue").val();
		var sno = $("#sno").val();
		var accountType =$("#account_type").val();
		
		var URL = contextPath + "/userAccessControl/updateJournal.do";
			
			
			$.ajax({
				type: "POST",
				url : URL,
				//contentType: "application/json",
				data : {
					accountId : AccountId,
					accountName : AccountName,
					location : Location,
					txnDiscription : TxnDiscription,
					txnDate : TxnDate,
					txnType		:TxnType,
					txnValue		:TxnValue,
					accountType:accountType,
					sno:sno,
					//Status		:Status,				
				},
				beforeSend: function(xhr){                    
					$("#loading").css("display","block");
					$("#mainDiv").addClass("disabled");
				},
				success : function(result){
					$("#right-side").html(result);
					$("#loading").css("display","none");
					$("#mainDiv").removeClass('disabled');
				},
				error : function(e){
					console.log(JSON.stringify(e));
					alert("Something went wrong");
					$("#loading").css("display","none");
					$("#mainDiv").removeClass('disabled');
				}
			});
	}
	
	function deleteJournal(sno){
		debugger;
		var online = window.navigator.onLine;
	  	if(!online)
	  	{
	  	alert("check your internet connection,please try agian after some time");
	  	return;
	  	}
		//var sno=sNo;
		//var accountType=accountType;
		var contextPath = $('#contextPath').val();
		
		var URL = contextPath + "/userAccessControl/deleteJournal.do";
		
		
			
			
			$.ajax({
				type: "POST",
				url : URL,
				//contentType: "application/json",
				data : {
					sno : sno,
					
				},
				beforeSend: function(xhr){                    
					$("#loading").css("display","block");
					$("#mainDiv").addClass("disabled");
				},
				success : function(result){
					$("#right-side").html(result);
					accountingjournal('View','','')
					
					$("#loading").css("display","none");
					$("#mainDiv").removeClass('disabled');
				},
				error : function(e){
					console.log(JSON.stringify(e));
					alert("Something went wrong");
					$("#loading").css("display","none");
					$("#mainDiv").removeClass('disabled');
				}
			});
		
	}
	
	function startReconciliation(){
		debugger;
		var online = window.navigator.onLine;
	  	if(!online)
	  	{
	  	alert("check your internet connection,please try agian after some time");
	  	return;
	  	}
		var contextPath = $('#contextPath').val();
		
		var URL = contextPath + "/userAccessControl/startReconciliation.do";
		
		var start_date = $('#start_date').val();
		var end_date = $('#end_date').val();
		var AccountId = $('#Account_Id').val();
		var Account_Name = $('#Account_Name').val();
			
			$.ajax({
				type: "POST",
				url : URL,
				//contentType: "application/json",
				data : {
					start_date:start_date,
					end_date:end_date,
					AccountId:AccountId,
					Account_Name:Account_Name,
				},
				beforeSend: function(xhr){                    
					$("#loading").css("display","block");
					$("#mainDiv").addClass("disabled");
				},
				success : function(result){
					$("#right-side").html(result);
					activeMenu("reconciliation");
					$("#loading").css("display","none");
					$("#mainDiv").removeClass('disabled');
				},
				error : function(e){
					console.log(JSON.stringify(e));
					alert("No Records Found");
					$("#loading").css("display","none");
					$("#mainDiv").removeClass('disabled');
				}
			});
		
	}
	
	

	function saveReconciliation(){
		debugger;
		var online = window.navigator.onLine;
	  	if(!online)
	  	{
	  	alert("check your internet connection,please try agian after some time");
	  	return;
	  	}
	  	var reconciliationMasterobj = {},reconciliationdetailsObj=[];
		var contextPath = $('#contextPath').val();
		
		
		var assest = parseInt($("#asstesList tr").length);
			if(assest<=1){
				$("#Error").html("Add at least one Item..");
				return;
			 }
			var bankList = parseInt($("#bankListIds tr").length);
			if(bankList<=1){
				$("#Error").html("Add at least one Item..");
				return;
			 }
		var start_date = $('#start_date').val();
		var end_date = $('#end_date').val();
		var AccountId = $('#Account_Id').val();
		var comments = $('#comments').val();
		
		var assetdiff = $('#assetdiff').val();
		var bankdiff = $('#bankdiff').val();
		var diffAmt = assetdiff-bankdiff;
		reconciliationMasterobj.accountId=$('#Account_Id').val();
		reconciliationMasterobj.accountName=$('#Account_Name').val();
		reconciliationMasterobj.comments=$('#comments').val();
		reconciliationMasterobj.bankId=$('#bankId').val();
		reconciliationMasterobj.startDate=start_date;
		reconciliationMasterobj.endDate=end_date;
		reconciliationMasterobj.differnceAmount=Math.abs(diffAmt);
		reconciliationMasterobj.reconciliationDetails=reconciliationdetailsObj;
		
		for(var i=1;i<assest;i++){
 	 			var idAttr = $("#asstesList tr:eq("+i+") td:last").attr("id").replace('assetCreditAmt','');
 	 		
 	 			var obj = {transactionDateStr:$("#assetDate"+idAttr).text(),transactionDescription:$("#assetDes"+idAttr).text(),debitAmount:$("#assetDebitAmt"+idAttr).text(),creditAmount:$("#assetCreditAmt"+idAttr).text(),bankTransactionStr:$("#assetflag"+idAttr).val()}; 
 	 		
 	 			reconciliationdetailsObj.push(obj);
 	 	}
		for(var i=1;i<bankList;i++){
	 			var idAttr = $("#bankListIds tr:eq("+i+") td:last").attr("id").replace('bankCredit','');
	 			var flag=true;
	 			var obj = {transactionDateStr:$("#bankDate"+idAttr).text(),transactionDescription:$("#bankDes"+idAttr).text(),debitAmount:$("#bankDebit"+idAttr).text(),creditAmount:$("#bankCredit"+idAttr).text(),bankTransactionStr:$("#bankflag"+idAttr).val()}; 
	 		
	 			reconciliationdetailsObj.push(obj);
	 	}
		
		 var formData = JSON.stringify(reconciliationMasterobj);
		
		 var URL = contextPath + "/userAccessControl/saveReconciliation.do";
		 
			$.ajax({
				type: "POST",
	    			url : URL,
	    			contentType: "application/json",
	               data : formData,
    		beforeSend: function(xhr){                    
   				$("#loading").css("display","block");
   				$("#mainDiv").addClass("disabled");
    		},
				success : function(result){
					$("#right-side").html(result);
					$("#loading").css("display","none");
					$("#mainDiv").removeClass('disabled');
				},
				error : function(e){
					console.log(JSON.stringify(e));
					alert("Something went wrong");
					$("#loading").css("display","none");
					$("#mainDiv").removeClass('disabled');
				}
			});
		
	}
	
	function viewReconciliation(reconciliationId){
		try{
			debugger;
			
			var online = window.navigator.onLine;
		  	if(!online){
		  	alert("Check your internet connection,Please try agian after some time.");
		  	return;
		  	}
		  	
		 
			var contextPath = $('#contextPath').val();
			var URL = contextPath + "/userAccessControl/viewReconciliation.do";
  		
  	    $.ajax({
  		url : URL,
  		data : {
  			reconciliationId:reconciliationId,
  		},
 		beforeSend: function(xhr){                    
				$("#loading").css("display","block");
				$("#mainDiv").addClass("disabled");
 		},
 		success : function(result){
 			$(".active-menu").removeClass("active-menu");
 		//	$(".menu-open").css("display","none");
 			activeMenu("reconciliation");
 			$('#right-side').html(result);
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
	
	//........................newly Added...............


	// Added by Surya.k

	function searchSubTransactions(SearchName,id){
		debugger;
		try{
			var online = window.navigator.onLine;
		  	if(!online){
		  	alert("Check your internet connection,Please try agian after some time.");
		  	return;
		  	}
		  	
		  	var AccountId = $("#accountId").val();
		  	var organization = $("#organization").val();
			var zone = $("#zone").val();
			var location = $("#location").val();
			var txnType = $("#TxnTypeF").val();
			var start_date = $("#start_date").val();
			var end_date = $("#end_date").val();
			var maxRecords='10';
			var index ='0';
			var contextPath = $('#contextPath').val();
			
			if ($("#start_date").val() != "" && $("#end_date").val() != "") {
		   	   		var noOfDays = daydiff(parseDate(start_date), parseDate(end_date));
		   	   		if (noOfDays < 0) {
		   	   			alert("Start Date can't be less than End Date");
		   	   			return;
		   	   		}
		   	   	}
		if(SearchName=='Asset')
			{
		
			var URL = contextPath + "/userAccessControl/showAssetsSubTransactions.do";
			}
		else if(SearchName=='Liabilites')
			{
			
			 var URL = contextPath + "/userAccessControl/showLiabilitesSubTransactions.do";
			}
		else if(SearchName=='Income')
			{
			
			 var URL = contextPath + "/userAccessControl/showIncomeSubTransactions.do";
			}		
		else if(SearchName=='Expenses')
			{
			
			 var URL = contextPath + "/userAccessControl/showExpensesSubTransactions.do";
			}
			
	 
	    $.ajax({
		url : URL,
		data : {
			SubAccountId:AccountId,
			Organization:organization,
			Zone:zone,
			Location:location,
			TxnType:txnType,
			Start_date:start_date,
			End_date:end_date,
			maxRecords:maxRecords,
			index:index,
		},
		beforeSend: function(xhr){                    
				$("#loading").css("display","block");
				$("#mainDiv").addClass("disabled");
		},
		success : function(result){
			$(".active-menu").removeClass("active-menu");
		//	$(".menu-open").css("display","none");
			$('#right-side').html(result);
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

	
	
	
	//AssetAccountTransaction
	function CreateAssetSubAccountTransaction(){

		debugger
		 //purpose:for checking internet conection
		var online = window.navigator.onLine;
	  	if(!online)
	  	{
	  	alert("check your internet connection,please try agian after some time");
	  	return;
	  	}
		
		var contextPath = $('#contextPath').val();
		
		
		var AccountId = $("#accountId").val();
		
		if(AccountId=="" || AccountId == null || AccountId== undefined)
			{
			
			$("#errorAccId").css("display", "block");
			 return;
			}
		
		var AccountName = $("#accountName").val();
		var Location = $("#Location").val();
		var TxnDiscription = $("#txnDescription").val();
		var TxnDate = $("#date").val();
		var TxnType = $("#txnType").val();
		var TxnValue = $("#txnValue").val();

		
		//var Status=true;
		
		var URL = contextPath + "/userAccessControl/createAssetsSubTransactions.do";
			
			
			$.ajax({
				type: "POST",
				url : URL,
				//contentType: "application/json",
				data : {
					accountId : AccountId,
					accountName : AccountName,
					location : Location,
					txnDiscription : TxnDiscription,
					txnDate : TxnDate,
					txnType		:TxnType,
					txnValue		:TxnValue,
					//Status		:Status,				
				},
				beforeSend: function(xhr){                    
					$("#loading").css("display","block");
					$("#mainDiv").addClass("disabled");
				},
				success : function(result){
					$("#right-side").html(result);
					/*var anchor = document.createElement('a');
					anchor.href = $("#stockdownloadurl").val();
					anchor.target = '_blank';
					anchor.download = '';
					if($("#stockdownloadurl").val()!=null && $("#stockdownloadurl").val()!='')
						anchor.click();*/
					$("#loading").css("display","none");
					$("#mainDiv").removeClass('disabled');
				},
				error : function(e){
					console.log(JSON.stringify(e));
					alert("Something went wrong");
					$("#loading").css("display","none");
					$("#mainDiv").removeClass('disabled');
				}
			});
	}



	function viewAssetSubTransactions(SearchName,id,index){
			debugger;
			try{
				var online = window.navigator.onLine;
			  	if(!online){
			  	alert("Check your internet connection,Please try agian after some time.");
			  	return;
			  	}
			  	
			 var maxRecords=10; 	
			 var SubAccountId=id;
			 var organization = '';
			 var zone = '';
			 var location ='';
			 var txnType = '';
			 var start_date = '';
			 var end_date = '';
			 var contextPath = $('#contextPath').val();
				
	 		 var URL = contextPath + "/userAccessControl/showAssetsSubTransactions.do";
	 		
			  	
			
		 
		    $.ajax({
			url : URL,
			data : {
				SubAccountId:SubAccountId,
				Organization:organization,
				Zone:zone,
				Location:location,
				TxnType:txnType,
				Start_date:start_date,
				End_date:end_date,
				maxRecords:maxRecords,
				index:index
			},
			beforeSend: function(xhr){                    
					$("#loading").css("display","block");
					$("#mainDiv").addClass("disabled");
			},
			success : function(result){
				$(".active-menu").removeClass("active-menu");
			//	$(".menu-open").css("display","none");
				$("#loading").css("display","none");
				$('#right-side').html(result);
				
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

	// LiabilitesTransactions
	function viewLiabilitesSubTransactions(SearchName,id,index){
		debugger;
		try{
			var online = window.navigator.onLine;
		  	if(!online){
		  	alert("Check your internet connection,Please try agian after some time.");
		  	return;
		  	}
		  	var maxRecords=10; 	
		 var AccountId=id;
		 var organization = '';
		 var zone = '';
		 var location ='';
		 var txnType = '';
		 var start_date = '';
		 var end_date = '';
			var contextPath = $('#contextPath').val();
			
		
		
			 var URL = contextPath + "/userAccessControl/showLiabilitesSubTransactions.do";
			
		  	
		
	 
	    $.ajax({
		url : URL,
		data : {
			SubAccountId:AccountId,
			Organization:organization,
			Zone:zone,
			Location:location,
			TxnType:txnType,
			Start_date:start_date,
			End_date:end_date,
			maxRecords:maxRecords,
			index:index
		},
		beforeSend: function(xhr){                    
				$("#loading").css("display","block");
				$("#mainDiv").addClass("disabled");
		},
		success : function(result){
			$(".active-menu").removeClass("active-menu");
		//	$(".menu-open").css("display","none");
			$('#right-side').html(result);
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

	function CreateLiabilitesSubTransactions(){

		debugger
		 //purpose:for checking internet conection
		var online = window.navigator.onLine;
	  	if(!online)
	  	{
	  	alert("check your internet connection,please try agian after some time");
	  	return;
	  	}
		
		var contextPath = $('#contextPath').val();
		
		
		var AccountId = $("#accountId").val();
		
		if(AccountId=="" || AccountId == null || AccountId== undefined)
			{
			
			$("#errorAccId").css("display", "block");
			 return;
			}
		
		var AccountName = $("#accountName").val();
		var TxnDiscription = $("#txnDescription").val();
		var Location = $("#Location").val();
		var TxnDate = $("#date").val();
		var TxnType = $("#txnType").val();
		var TxnValue = $("#txnValue").val();

		
		//var Status=true;
		
		var URL = contextPath + "/userAccessControl/createLiabilitesSubTransactions.do";
			
			
			$.ajax({
				type: "POST",
				url : URL,
				//contentType: "application/json",
				data : {
					accountId : AccountId,
					accountName : AccountName,
					txnDiscription : TxnDiscription,
					location : Location,
					txnDate : TxnDate,
					txnType		:TxnType,
					txnValue		:TxnValue,
					//Status		:Status,				
				},
				beforeSend: function(xhr){                    
					$("#loading").css("display","block");
					$("#mainDiv").addClass("disabled");
				},
				success : function(result){
					$("#right-side").html(result);
					/*var anchor = document.createElement('a');
					anchor.href = $("#stockdownloadurl").val();
					anchor.target = '_blank';
					anchor.download = '';
					if($("#stockdownloadurl").val()!=null && $("#stockdownloadurl").val()!='')
						anchor.click();*/
					$("#loading").css("display","none");
					$("#mainDiv").removeClass('disabled');
				},
				error : function(e){
					console.log(JSON.stringify(e));
					alert("Something went wrong");
					$("#loading").css("display","none");
					$("#mainDiv").removeClass('disabled');
				}
			});
	}

	//IncomeTransactions
	function viewIncomeSubTransactions(SearchName,id,index){
		debugger;
		try{
			var online = window.navigator.onLine;
		  	if(!online){
		  	alert("Check your internet connection,Please try agian after some time.");
		  	return;
		  	}
		  var maxRecords=10;	
		 var AccountId=id;
		 var organization = '';
		 var zone = '';
		 var location ='';
		 var txnType = '';
		 var start_date = '';
		 var end_date = '';
			var contextPath = $('#contextPath').val();
			
		
		
			 var URL = contextPath + "/userAccessControl/showIncomeSubTransactions.do";
			
		  	
		
	 
	    $.ajax({
		url : URL,
		data : {
			SubAccountId:AccountId,
			Organization:organization,
			Zone:zone,
			Location:location,
			TxnType:txnType,
			Start_date:start_date,
			End_date:end_date,
			maxRecords:maxRecords,
			index:index

		},
		beforeSend: function(xhr){                    
				$("#loading").css("display","block");
				$("#mainDiv").addClass("disabled");
		},
		success : function(result){
			$(".active-menu").removeClass("active-menu");
		//	$(".menu-open").css("display","none");
			$('#right-side').html(result);
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

	function CreateIncomeSubTransactions(){

		debugger
		 //purpose:for checking internet conection
		var online = window.navigator.onLine;
	  	if(!online)
	  	{
	  	alert("check your internet connection,please try agian after some time");
	  	return;
	  	}
		
		var contextPath = $('#contextPath').val();
		
		
		var AccountId = $("#accountId").val();
		
		if(AccountId=="" || AccountId == null || AccountId== undefined)
			{
			
			$("#errorAccId").css("display", "block");
			 return;
			}
		
		var AccountName = $("#accountName").val();
		var TxnDiscription = $("#txnDescription").val();
		var TxnDate = $("#date").val();
		var TxnType = $("#txnType").val();
		var TxnValue = $("#txnValue").val();
		var Location = $("#Location").val();
		
		//var Status=true;
		
		var URL = contextPath + "/userAccessControl/createIncomeSubTransactions.do";
			
			
			$.ajax({
				type: "POST",
				url : URL,
				//contentType: "application/json",
				data : {
					accountId : AccountId,
					accountName : AccountName,
					txnDiscription : TxnDiscription,
					location : Location,
					txnDate : TxnDate,
					txnType		:TxnType,
					txnValue		:TxnValue,
					//Status		:Status,				
				},
				beforeSend: function(xhr){                    
					$("#loading").css("display","block");
					$("#mainDiv").addClass("disabled");
				},
				success : function(result){
					$("#right-side").html(result);
					/*var anchor = document.createElement('a');
					anchor.href = $("#stockdownloadurl").val();
					anchor.target = '_blank';
					anchor.download = '';
					if($("#stockdownloadurl").val()!=null && $("#stockdownloadurl").val()!='')
						anchor.click();*/
					$("#loading").css("display","none");
					$("#mainDiv").removeClass('disabled');
				},
				error : function(e){
					console.log(JSON.stringify(e));
					alert("Something went wrong");
					$("#loading").css("display","none");
					$("#mainDiv").removeClass('disabled');
				}
			});
	}


	//ExpensesTransactions
	function viewExpensesSubTransactions(SearchName,id,index){
		debugger;
		try{
			var online = window.navigator.onLine;
		  	if(!online){
		  	alert("Check your internet connection,Please try agian after some time.");
		  	return;
		  	}
		  	var maxRecords=10;
		 var AccountId=id;
		 var organization = '';
		 var zone = '';
		 var location ='';
		 var txnType = '';
		 var start_date = '';
		 var end_date = '';
			var contextPath = $('#contextPath').val();
			
		
		
			 var URL = contextPath + "/userAccessControl/showExpensesSubTransactions.do";
			
		  	
		

	  $.ajax({
		url : URL,
		data : {
			SubAccountId:AccountId,
			Organization:organization,
			Zone:zone,
			Location:location,
			TxnType:txnType,
			Start_date:start_date,
			End_date:end_date,
			maxRecords:maxRecords,
			index:index
		},
		beforeSend: function(xhr){                    
				$("#loading").css("display","block");
				$("#mainDiv").addClass("disabled");
		},
		success : function(result){
			$(".active-menu").removeClass("active-menu");
		//	$(".menu-open").css("display","none");
			$('#right-side').html(result);
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

	function CreateExpensesSubTransactions(){

		debugger
		 //purpose:for checking internet conection
		var online = window.navigator.onLine;
		if(!online)
		{
		alert("check your internet connection,please try agian after some time");
		return;
		}
		
		var contextPath = $('#contextPath').val();
		
		
		var AccountId = $("#accountId").val();
		
		if(AccountId=="" || AccountId == null || AccountId== undefined)
			{
			
			$("#errorAccId").css("display", "block");
			 return;
			}
		
		var AccountName = $("#accountName").val();
		var TxnDiscription = $("#txnDescription").val();
		var TxnDate = $("#date").val();
		var TxnType = $("#txnType").val();
		var TxnValue = $("#txnValue").val();
		var Location = $("#Location").val();
		
		//var Status=true;
		
		var URL = contextPath + "/userAccessControl/createExpensesSubTransactions.do";
			
			
			$.ajax({
				type: "POST",
				url : URL,
				//contentType: "application/json",
				data : {
					accountId : AccountId,
					accountName : AccountName,
					txnDiscription : TxnDiscription,
					location : Location,
					txnDate : TxnDate,
					txnType		:TxnType,
					txnValue		:TxnValue,
					//Status		:Status,				
				},
				beforeSend: function(xhr){                    
					$("#loading").css("display","block");
					$("#mainDiv").addClass("disabled");
				},
				success : function(result){
					$("#right-side").html(result);
					
					$("#loading").css("display","none");
					$("#mainDiv").removeClass('disabled');
				},
				error : function(e){
					console.log(JSON.stringify(e));
					alert("Something went wrong");
					$("#loading").css("display","none");
					$("#mainDiv").removeClass('disabled');
				}
			});
	}



	function getPurcphasePaymentsPDF(refId){

		debugger
		var online = window.navigator.onLine;
		if(!online)
		{
		alert("check your internet connection,please try agian after some time");
		return;
		}
		
		var contextPath = $('#contextPath').val();
		var URL = contextPath + "/userAccessControl/getPurcphasePaymentsPDF.do";
			
			
			$.ajax({
				
				url : URL,
				data : {
					RefId:refId,			
				},
				beforeSend: function(xhr){                    
					$("#loading").css("display","block");
					$("#mainDiv").addClass("disabled");
				},
				success : function(result){
					var anchor = document.createElement('a');
					anchor.href = result;
					anchor.target = '_blank';
					anchor.download = '';
					
					anchor.click();
					
					$("#loading").css("display","none");
					$("#mainDiv").removeClass('disabled');
				},
				error : function(e){
					console.log(JSON.stringify(e));
					//alert("Something went wrong");
					$("#loading").css("display","none");
					$("#mainDiv").removeClass('disabled');
				}
			});
	}

	


	function getSalesPaymentsPDF(refId){

		debugger
		var online = window.navigator.onLine;
		if(!online)
		{
		alert("check your internet connection,please try agian after some time");
		return;
		}
		
		var contextPath = $('#contextPath').val();
		var URL = contextPath + "/userAccessControl/getSalesPaymentsPDF.do";
			
			
			$.ajax({
				
				url : URL,
				data : {
					RefId:refId,			
				},
				beforeSend: function(xhr){                    
					$("#loading").css("display","block");
					$("#mainDiv").addClass("disabled");
				},
				success : function(result){
					var anchor = document.createElement('a');
					anchor.href = result;
					anchor.target = '_blank';
					anchor.download = '';
					
					anchor.click();
					
					$("#loading").css("display","none");
					$("#mainDiv").removeClass('disabled');
				},
				error : function(e){
					console.log(JSON.stringify(e));
					//alert("Something went wrong");
					$("#loading").css("display","none");
					$("#mainDiv").removeClass('disabled');
				}
			});
	}


	var newcountProduct = $("#slabLis tr").length - 1;
	function addProductOfferSlab() {
		debugger;
		newcountProduct = newcountProduct + 1;
		var dealProductSlabDivContent = $('#productrange1').prop('outerHTML');

		var currentDealSlabDivContent = dealProductSlabDivContent;
		currentDealSlabDivContent = currentDealSlabDivContent.replace('productrange1',
				'productrange' + newcountProduct);
		

		currentDealSlabDivContent = currentDealSlabDivContent.replace('sno1',
				'sno' + newcountProduct);
		
		currentDealSlabDivContent = currentDealSlabDivContent.replace(
				'1description', newcountProduct + 'description');
		
		currentDealSlabDivContent = currentDealSlabDivContent.replace(
				'1amt', newcountProduct + 'amt');
		
		$("#slabLis tbody").append(currentDealSlabDivContent);
		
	}
	
	function deleteProductSlab(id) {
		debugger;
		/*var newcountProduct = $("#slabLis tr").length - 1;
		newcountProduct = newcountProduct -1;*/
		// var id = $(element).attr("id").replace('Img','');
		var len = $("#slabLis tr").length - 1;
		
		if (len <= 1) {
			alert("Atleast One Range is Required");
			return;
		}
		
		$('#' + id).remove();
	}

	function viewCashReceipt(searchView,Id){
		debugger;
		try{
			var online = window.navigator.onLine;
		  	if(!online){
		  	alert("Check your internet connection,Please try agian after some time.");
		  	return;
		  	}
		  	
		 var transactionId=Id;
	
		 var contextPath = $('#contextPath').val();
		
		
		 var URL = contextPath + "/userAccessControl/viewCashReceipt.do";
		
	    
	    
	    $.ajax({
		url : URL,
		data : {
			transactionId:transactionId,
		},
		beforeSend: function(xhr){                    
				$("#loading").css("display","block");
				$("#mainDiv").addClass("disabled");
		},
		success : function(result){
			$(".active-menu").removeClass("active-menu");
			$("#loading").css("display","none");
			$('#right-side').html(result);
			if(searchView == 'View'){
				$('#viewRceiptsModal').modal('show');
			}else{
				$('#editRceiptsModal').modal('show');
			}
			
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
	
	

	function viewCashPayments(searchView,Id){
		debugger;
		try{
			var online = window.navigator.onLine;
		  	if(!online){
		  	alert("Check your internet connection,Please try agian after some time.");
		  	return;
		  	}
		  	
		 var transactionId=Id;
	
		 var contextPath = $('#contextPath').val();
		
		
		 var URL = contextPath + "/userAccessControl/viewCashPayments.do";
		
	    
	    
	    $.ajax({
		url : URL,
		data : {
			transactionId:transactionId,
		},
		beforeSend: function(xhr){                    
				$("#loading").css("display","block");
				$("#mainDiv").addClass("disabled");
		},
		success : function(result){
			$(".active-menu").removeClass("active-menu");
			$("#loading").css("display","none");
			$('#right-side').html(result);
			if(searchView == 'View'){
				$('#viewPaymentModal').modal('show');
			}else{
				$('#editPaymentModal').modal('show');
			}
			
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
	