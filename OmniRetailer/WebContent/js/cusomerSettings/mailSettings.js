
function enableFileBrowse(ele,id){
	debugger;
	 var contextPath = $("#contextPath").val();
	if (ele != '')
	   id = $(ele).attr("id");
	   
	if($("#"+id).prop('checked')){
		  if(id=="stockReceipts" || id=="stockIssues" ||id=="customerComplaintss"||id=="customerFeedbacks"){
			 id= id.substring(0,id.length-1);
		  }
		 /* if($("#"+id+"dataFile").val()== null || $("#"+id+"dataFile").val()=="" ||$("#"+id+"dataFile").val()==undefined){*/
		$("#"+id+"dataBtn").closest('div').removeClass('btn-primar');
		$("#"+id+"dataBtn").closest('div').addClass('btn-primary');
		$("#"+id+"dataBtn").removeAttr("disabled");/*}
		if($("#"+id+"uiFile").val()== null || $("#"+id+"uiFile").val()=="" ||$("#"+id+"uiFile").val()==undefined){*/
		$("#"+id+"uiBtn").closest('div').removeClass('btn-primar');
		$("#"+id+"uiBtn").closest('div').addClass('btn-primary');
		$("#"+id+"uiBtn").removeAttr("disabled");/*}*/
		
		//$("#"+id+"File").val("");
	}
	else{
		replaceWithNewFileType(id);
		 if(id=="stockReceipts"||id=="stockIssues"||id=="customerComplaintss"||id=="customerFeedbacks"){
			 id= id.substring(0,id.length-1);
		  }
		/* if($("#"+id+"dataFile").val()== null || $("#"+id+"dataFile").val()=="" ||$("#"+id+"dataFile").val()==undefined){*/
		$("#"+id+"dataBtn").closest('div').removeClass('btn-primary');
		$("#"+id+"dataBtn").closest('div').addClass('btn-primar');
		$("#"+id+"dataBtn").attr("disabled","disabled");/*}
		 if($("#"+id+"uiFile").val()== null || $("#"+id+"uiFile").val()=="" ||$("#"+id+"uiFile").val()==undefined){*/
		$("#"+id+"uiBtn").closest('div').removeClass('btn-primary');
		$("#"+id+"uiBtn").closest('div').addClass('btn-primar');
		$("#"+id+"uiBtn").attr("disabled","disabled");/*}*/
	
		
	}
	$("#"+id+"Img").closest('span').css("visibility","hidden");
	$("#"+id+"Img").attr("src",contextPath+"/images/circleWait.gif");
	//$("#"+id+"File").val("");
	
	
	
}

function replaceWithNewFileType(id){
	
	
	var newFile = "<input id='"+id+"Btn' disabled='disabled' type='file' accept='.csv, application/vnd.openxmlformats-officedocument.spreadsheetml.sheet, application/vnd.ms-excel' onchange=addNameToTextBox('"+id+"'); class='upload' />";
	var $fileInput=$("#"+id+"Btn");
	var $fileCopy = $(newFile);
	$fileInput.replaceWith($fileCopy);
	
	
}
function loadImageFileAsURL(id,ele) {
	if (ele.files && ele.files[0]) {
        var reader = new FileReader();

       
        reader.readAsDataURL(ele.files[0]);
       
        var oMyForm = new FormData();
        oMyForm.append("file",  ele.files[0]);
       
       
        if($("#"+id+"_refId").val() != "")
        	oMyForm.append("refId",  $("#"+id+"_refId").val());
        else
        	oMyForm.append("refId", "");
      
        var contextPath = $("#contextPath").val();
        var URL = contextPath + "/inventorymanager/addToAttachementList.do";
        $.ajax({
//				dataType : 'json',
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
};


function addNameToTextBox(id,ele){
	debugger;
	
	if($("#"+id+"Btn")[0].files[0] != undefined){
		$("#"+id+"File").val($("#"+id+"Btn")[0].files[0]['name']);
		loadImageFileAsURL(id,ele);
		
		if($("#"+id+"File").val() != ""){
			var filename=$("#"+id+"File").val();
			var ext=filename.split('.');
			if((ext[1] != 'xml') && (ext[1] != 'XML')&& (ext[1] != 'XSL')&& (ext[1] != 'xsl')){
				$("#"+id+"File").val("");
				alert("Upload XML Files Only.");
			}
		}else{}
		
		
	}
		
	else
		$("#"+id+"File").val("");

}




$("#smtp").keydown(function(){
	   $("#smtpError").html("");
	   $(".Error").html("");
}); 

$("#mailId").keydown(function(){
	   $("#mailIdError").html("");
	   $(".Error").html("");
}); 
 
$("#portNo").keydown(function(){
	   $("#portNoError").html("");
	   $(".Error").html("");
}); 

/*$("#portNo").keydown(function(){
	if($("#portNo").val().trim() == "25" || $("#portNo").val().trim() == "587" ||$("#portNo").val().trim() == "2525" ||$("#portNo").val().trim() == "465" ||$("#portNo").val().trim() == "2526"){
	   $("#portNoError").html("");
	   $("#Error").html("");
	}
}); */

/*$("#host").keydown(function(){
	   $("#hostError").html("");
	   $(".Error").html("");
});*/
$("#password").keydown(function(){
	   $("#passwordError").html("");
	   $(".Error").html("");
}); 




function sendtestMail(){
	debugger;
    	    	 try{
    	    	// purpose:for checking internet conection
    	    		var online = window.navigator.onLine;
    	    	  	if(!online){
    	    	  	alert("Check your internet connection,Please try agian after some time.");
    	    	  	return;
    	    	  	}

var testmsg = $("#testmsg").val();
var testmail = $("#testmailId").val();
        if(testmsg==""){
 			$("#testmsg").focus();
            $("#testmsgError").html("enter the text");
            return;
 			}else{
	 $("#testmsgError").html("");
             }
		 if(testmail==""){
 			$("#testmailId").focus();
            $("#testmailIdError").html("enter the mail id");
            return;
 			}
		else{
	   $("#testmailIdError").html("");
             }


           var mailformat = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;


			if(!$("#testmailId").val().match(mailformat))
			{
			 $("#testmailIdError").html("Enter valid eamil");
			
			return;
			}else{
				  $("#testmailIdError").html("");
			}



    	    	 // debugger
    	    		var contextPath = $("#contextPath").val();
    	    		URL = contextPath + "/inventorymanager/sendtestMail.do";
    	    			$.ajax({
    	    				type: "GET",
    	    				url : URL,
    	    				data : {
    	    					testmail : testmail,
    	    					testmsg : testmsg
    	    				},
    	    				beforeSend: function(xhr){                    
    	    		   			$("#loading").css("display","block");
    	    		   			$("#mainDiv").addClass("disabled");
    	    		   		  },
    	    				success : function(result) {
    	    					
    	    					$("#loading").css("display","none");
    	    					$("#mainDiv").removeClass('disabled')
    	    				},
    	    				error : function(jqXHR, textStatus, errorThrown)  {
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


function validateMailSettingsForm(operation){
	
	var mailSettings = {},templatesList = [];
	if($("#smtp").val().trim() == ""){
		$("#smtpError").html("Enter SMTP");
		return;
	}
	
	if($("#mailId").val().trim() == ""){
		$("#mailIdError").html("Enter Mail Id");
		return;
	}
	
	//$("#mailId").blur(function(){
		  var email = $("#mailId").val();
		  if(email==""){
			 return false;
		  }
		  if(!emailValidation(email)){
		   	$("#mailIdError").html("Invalid EmailId (Ex:abc@gmail.com)");
		   	return false;
		  }
		  else{
			$("#mailIdError").html("");
		//    return true;
		  }
		//});
	
	
	if($("#password").val().trim() == ""){
		$("#passwordError").html("Enter Password");
		return;
	}
	
	
	if($("#portNo").val().trim() == ""){
		$("#portNoError").html("Enter Port Number");
		return;
	}
	
	
	if($("#protocol").val().trim() == ""){
		$("#portNoError").html("Enter Protocol");
		return;
	}
	
	/*if($("#portNo").val().trim() == "25" || $("#portNo").val().trim() == "587" ||$("#portNo").val().trim() == "2525" ||$("#portNo").val().trim() == "465" ||$("#portNo").val().trim() == "2526"){
		$("#portNoError").html("");
	
	}
	else{
		$("#portNoError").html("Enter Valid Port Number");
		return;
		
	}	*/	

																
var obj={};

if($("#salesOrderB2c").prop('checked')){

	if($("#salesOrderB2cdataFile").val() != ""  ){
		obj={templateType:"salesOrderB2cdata",fileId:$("#salesOrderB2cdata_refId").val(),fileName:$("#salesOrderB2cdataFile").val(),status:"true"};
//		console.log(obj);
		templatesList.push(obj);
	}
	
	if($("#salesOrderB2cuiFile").val() != "" ){
		obj={templateType:"salesOrderB2cui",fileId:$("#salesOrderB2ceui_refId").val(),fileName:$("#salesOrderB2cuiFile").val(),status:"true"};
//		console.log(obj);
		templatesList.push(obj);
	}
}
else{


	if($("#salesOrderB2cdataFile").val() != ""  ){
		obj={templateType:"salesOrderB2cdata",fileId:$("#salesOrderB2cdata_refId").val(),fileName:$("#salesOrderB2cdataFile").val(),status:"false"};
//		console.log(obj);
		templatesList.push(obj);
	}
	
	if($("#salesOrderB2cuiFile").val() != ""){
		obj={templateType:"salesOrderB2cui",fileId:$("#salesOrderB2cui_refId").val(),fileName:$("#salesOrderB2cuiFile").val(),status:"false"};
//		console.log(obj);
		templatesList.push(obj);
	}

}
/*else{
	
		obj={templateType:"salesOrderB2cdata",fileId:"",fileName:""};
//		console.log(obj);
		templatesList.push(obj);
	
}*/

if($("#salesOrderDirect").prop('checked')){


	if($("#salesOrderDirectdataFile").val() != ""){
		obj={templateType:"salesOrderDirectdata",fileId:$("#salesOrderDirectdata_refId").val(),fileName:$("#salesOrderDirectdataFile").val(),status:"true"};
//		console.log(obj);
		templatesList.push(obj);
	}if($("#salesOrderDirectuiFile").val() != ""){
		obj={templateType:"salesOrderDirectui",fileId:$("#salesOrderDirectui_refId").val(),fileName:$("#salesOrderDirectuiFile").val(),status:"true"};
//		console.log(obj);
		templatesList.push(obj);
	}

}
else{



	if($("#salesOrderDirectdataFile").val() != ""){
		obj={templateType:"salesOrderDirectdata",fileId:$("#salesOrderDirectdata_refId").val(),fileName:$("#salesOrderDirectdataFile").val(),status:"false"};
//		console.log(obj);
		templatesList.push(obj);
	}if($("#salesOrderDirectuiFile").val() != ""){
		obj={templateType:"salesOrderDirectui",fileId:$("#salesOrderDirectui_refId").val(),fileName:$("#salesOrderDirectuiFile").val(),status:"false"};
//		console.log(obj);
		templatesList.push(obj);
	}


}

if($("#salesOrderMobile").prop('checked')){

	if($("#salesOrderMobiledataFile").val() != ""){
		obj={templateType:"salesOrderMobiledata",fileId:$("#salesOrderMobiledata_refId").val(),fileName:$("#salesOrderMobiledataFile").val(),status:"true"};
//		console.log(obj);
		templatesList.push(obj);
	}if($("#salesOrderMobileuiFile").val() != ""){
		obj={templateType:"salesOrderMobileui",fileId:$("#salesOrderMobileui_refId").val(),fileName:$("#salesOrderMobileuiFile").val(),status:"true"};
//		console.log(obj);
		templatesList.push(obj);
	}
}
else{


	if($("#salesOrderMobiledataFile").val() != ""){
		obj={templateType:"salesOrderMobiledata",fileId:$("#salesOrderMobiledata_refId").val(),fileName:$("#salesOrderMobiledataFile").val(),status:"false"};
//		console.log(obj);
		templatesList.push(obj);
	}if($("#salesOrderMobileuiFile").val() != ""){
		obj={templateType:"salesOrderMobileui",fileId:$("#salesOrderMobileui_refId").val(),fileName:$("#salesOrderMobileuiFile").val(),status:"false"};
//		console.log(obj);
		templatesList.push(obj);
	}

}

if($("#salesOrderMobile").prop('checked')){


	if($("#salesOrderTelephonicdataFile").val() != ""){
		obj={templateType:"salesOrderTelephonicdata",fileId:$("#salesOrderTelephonicdata_refId").val(),fileName:$("#salesOrderTelephonicdataFile").val(),status:"true"};
//		console.log(obj);
		templatesList.push(obj);
	}if($("#salesOrderTelephonicuiFile").val() != ""){
		obj={templateType:"salesOrderTelephonicui",fileId:$("#salesOrderTelephonicui_refId").val(),fileName:$("#salesOrderTelephonicuiFile").val(),status:"true"};
//		console.log(obj);
		templatesList.push(obj);
	}

}
else{



	if($("#salesOrderTelephonicdataFile").val() != ""){
		obj={templateType:"salesOrderTelephonicdata",fileId:$("#salesOrderTelephonicdata_refId").val(),fileName:$("#salesOrderTelephonicdataFile").val(),status:"false"};
//		console.log(obj);
		templatesList.push(obj);
	}if($("#salesOrderTelephonicuiFile").val() != ""){
		obj={templateType:"salesOrderTelephonicui",fileId:$("#salesOrderTelephonicui_refId").val(),fileName:$("#salesOrderTelephonicuiFile").val(),status:"false"};
//		console.log(obj);
		templatesList.push(obj);
	}


}
if($("#billing").prop('checked')){


	if($("#billingdataFile").val() != ""){
		obj={templateType:"billingdata",fileId:$("#billingdata_refId").val(),fileName:$("#billingdataFile").val(),status:"true"};
//		console.log(obj);
		templatesList.push(obj);
	}if($("#billinguiFile").val() != ""){
		obj={templateType:"billingui",fileId:$("#billingui_refId").val(),fileName:$("#billinguiFile").val(),status:"true"};
//		console.log(obj);
		templatesList.push(obj);
	}


}
else{



	if($("#billingdataFile").val() != ""){
		obj={templateType:"billingdata",fileId:$("#billingdata_refId").val(),fileName:$("#billingdataFile").val(),status:"false"};
//		console.log(obj);
		templatesList.push(obj);
	}if($("#billinguiFile").val() != ""){
		obj={templateType:"billingui",fileId:$("#billingui_refId").val(),fileName:$("#billinguiFile").val(),status:"false"};
//		console.log(obj);
		templatesList.push(obj);
	}



}

if($("#stockReceipts").prop('checked')){
	if($("#stockReceiptdataFile").val() != ""){
		obj={templateType:"stockReceiptdata",fileId:$("#stockReceiptdata_refId").val(),fileName:$("#stockReceiptdataFile").val(),status:"true"};
//		console.log(obj);
		templatesList.push(obj);
	}
	if($("#stockReceiptuiFile").val() != ""){
		obj={templateType:"stockReceiptui",fileId:$("#stockReceiptui_refId").val(),fileName:$("#stockReceiptuiFile").val(),status:"true"};
//		console.log(obj);
		templatesList.push(obj);
	}
}else{

	if($("#stockReceiptdataFile").val() != ""){
		obj={templateType:"stockReceiptdata",fileId:$("#stockReceiptdata_refId").val(),fileName:$("#stockReceiptdataFile").val(),status:"false"};
//		console.log(obj);
		templatesList.push(obj);
	}
	if($("#stockReceiptuiFile").val() != ""){
		obj={templateType:"stockReceiptui",fileId:$("#stockReceiptui_refId").val(),fileName:$("#stockReceiptuiFile").val(),status:"false"};
//		console.log(obj);
		templatesList.push(obj);
	}

}

if($("#stockIssues").prop('checked')){
	if($("#stockIssuedataFile").val() != ""){
		obj={templateType:"stockIssuedata",fileId:$("#stockIssuedata_refId").val(),fileName:$("#stockIssuedataFile").val(),status:"true"};
//		console.log(obj);
		templatesList.push(obj);
	}if($("#stockIssueuiFile").val() != ""){
		obj={templateType:"stockIssueui",fileId:$("#stockIssueui_refId").val(),fileName:$("#stockIssueuiFile").val(),status:"true"};
//		console.log(obj);
		templatesList.push(obj);
	}
}else{

	if($("#stockIssuedataFile").val() != ""){
		obj={templateType:"stockIssuedata",fileId:$("#stockIssuedata_refId").val(),fileName:$("#stockIssuedataFile").val(),status:"false"};
//		console.log(obj);
		templatesList.push(obj);
	}if($("#stockIssueuiFile").val() != ""){
		obj={templateType:"stockIssueui",fileId:$("#stockIssueui_refId").val(),fileName:$("#stockIssueuiFile").val(),status:"false"};
//		console.log(obj);
		templatesList.push(obj);
	}

}

if($("#stockRequest").prop('checked')){
	if($("#stockRequestdataFile").val() != ""){
		obj={templateType:"stockRequestdata",fileId:$("#stockRequestdata_refId").val(),fileName:$("#stockRequestdataFile").val(),status:"true"};
//		console.log(obj);
		templatesList.push(obj);
	}
	if($("#stockRequestuiFile").val() != ""){
		obj={templateType:"stockrequest",fileId:$("#stockRequestui_refId").val(),fileName:$("#stockRequestuiFile").val(),status:"true"};
//		console.log(obj);
		templatesList.push(obj);
	}
}
else{

	if($("#stockRequestdataFile").val() != ""){
		obj={templateType:"stockRequestdata",fileId:$("#stockRequestdata_refId").val(),fileName:$("#stockRequestdataFile").val(),status:"false"};
//		console.log(obj);
		templatesList.push(obj);
	}
	if($("#stockRequestuiFile").val() != ""){
		obj={templateType:"stockrequest",fileId:$("#stockRequestui_refId").val(),fileName:$("#stockRequestuiFile").val(),status:"false"};
//		console.log(obj);
		templatesList.push(obj);
	}

}
if($("#stockReturn").prop('checked')){
	if($("#stockReturndataFile").val() != ""){
		obj={templateType:"stockReturndata",fileId:$("#stockReturndata_refId").val(),fileName:$("#stockReturndataFile").val(),status:"true"};
//		console.log(obj);
		templatesList.push(obj);
	}if($("#stockReturnuiFile").val() != ""){
		obj={templateType:"stockReturnui",fileId:$("#stockReturnui_refId").val(),fileName:$("#stockReturnuiFile").val(),status:"true"};
//		console.log(obj);
		templatesList.push(obj);
	}
}
else{

	if($("#stockReturndataFile").val() != ""){
		obj={templateType:"stockReturndata",fileId:$("#stockReturndata_refId").val(),fileName:$("#stockReturndataFile").val(),status:"false"};
//		console.log(obj);
		templatesList.push(obj);
	}if($("#stockReturnuiFile").val() != ""){
		obj={templateType:"stockReturnui",fileId:$("#stockReturnui_refId").val(),fileName:$("#stockReturnuiFile").val(),status:"false"};
//		console.log(obj);
		templatesList.push(obj);
	}

}
if($("#inventoryAlerts").prop('checked')){
	if($("#inventoryAlertsdataFile").val() != ""){
		obj={templateType:"inventoryAlertsdata",fileId:$("#inventoryAlertsdata_refId").val(),fileName:$("#inventoryAlertsdataFile").val(),status:"true"};
//		console.log(obj);
		templatesList.push(obj);
	}if($("#inventoryAlertsuiFile").val() != ""){
		obj={templateType:"inventoryAlertsui",fileId:$("#inventoryAlertsui_refId").val(),fileName:$("#inventoryAlertsuiFile").val(),status:"true"};
//		console.log(obj);
		templatesList.push(obj);
	}
}else{

	if($("#inventoryAlertsdataFile").val() != ""){
		obj={templateType:"inventoryAlertsdata",fileId:$("#inventoryAlertsdata_refId").val(),fileName:$("#inventoryAlertsdataFile").val(),status:"false"};
//		console.log(obj);
		templatesList.push(obj);
	}if($("#inventoryAlertsuiFile").val() != ""){
		obj={templateType:"inventoryAlertsui",fileId:$("#inventoryAlertsui_refId").val(),fileName:$("#inventoryAlertsuiFile").val(),status:"false"};
//		console.log(obj);
		templatesList.push(obj);
	}

}

if($("#stockVerification").prop('checked')){
	if($("#stockVerificationdataFile").val() != ""){
		obj={templateType:"stockVerificationdata",fileId:$("#stockVerificationdata_refId").val(),fileName:$("#stockVerificationdataFile").val(),status:"true"};
//		console.log(obj);
		templatesList.push(obj);
	}if($("#stockVerificationuiFile").val() != ""){
		obj={templateType:"stockVerificationui",fileId:$("#stockVerificationui_refId").val(),fileName:$("#stockVerificationuiFile").val(),status:"true"};
//		console.log(obj);
		templatesList.push(obj);
	}
}else{

	if($("#stockVerificationdataFile").val() != ""){
		obj={templateType:"stockVerificationdata",fileId:$("#stockVerificationdata_refId").val(),fileName:$("#stockVerificationdataFile").val(),status:"false"};
//		console.log(obj);
		templatesList.push(obj);
	}if($("#stockVerificationuiFile").val() != ""){
		obj={templateType:"stockVerificationui",fileId:$("#stockVerificationui_refId").val(),fileName:$("#stockVerificationuiFile").val(),status:"false"};
//		console.log(obj);
		templatesList.push(obj);
	}

}

if($("#customerRegistration").prop('checked')){
	if($("#customerRegistrationdataFile").val() != ""){
		obj={templateType:"customerRegistrationdata",fileId:$("#customerRegistrationdata_refId").val(),fileName:$("#customerRegistrationdataFile").val(),status:"true"};
//		console.log(obj);
		templatesList.push(obj);
	}if($("#customerRegistrationuiFile").val() != ""){
		obj={templateType:"customerRegistrationui",fileId:$("#customerRegistrationui_refId").val(),fileName:$("#customerRegistrationuiFile").val(),status:"true"};
//		console.log(obj);
		templatesList.push(obj);
	}
}
else{

	if($("#customerRegistrationdataFile").val() != ""){
		obj={templateType:"customerRegistrationdata",fileId:$("#customerRegistrationdata_refId").val(),fileName:$("#customerRegistrationdataFile").val(),status:"false"};
//		console.log(obj);
		templatesList.push(obj);
	}if($("#customerRegistrationuiFile").val() != ""){
		obj={templateType:"customerRegistrationui",fileId:$("#customerRegistrationui_refId").val(),fileName:$("#customerRegistrationuiFile").val(),status:"false"};
//		console.log(obj);
		templatesList.push(obj);
	}

}

if($("#customerUpdate").prop('checked')){
	if($("#customerUpdatedataFile").val() != ""){
		obj={templateType:"customerUpdatedata",fileId:$("#customerUpdatedata_refId").val(),fileName:$("#customerUpdatedataFile").val(),status:"true"};
//		console.log(obj);
		templatesList.push(obj);
	}if($("#customerUpdateuiFile").val() != ""){
		obj={templateType:"customerUpdateui",fileId:$("#customerUpdateui_refId").val(),fileName:$("#customerUpdateuiFile").val(),status:"true"};
//		console.log(obj);
		templatesList.push(obj);
	}
}else{

	if($("#customerUpdatedataFile").val() != ""){
		obj={templateType:"customerUpdatedata",fileId:$("#customerUpdatedata_refId").val(),fileName:$("#customerUpdatedataFile").val(),status:"false"};
//		console.log(obj);
		templatesList.push(obj);
	}if($("#customerUpdateuiFile").val() != ""){
		obj={templateType:"customerUpdateui",fileId:$("#customerUpdateui_refId").val(),fileName:$("#customerUpdateuiFile").val(),status:"false"};
//		console.log(obj);
		templatesList.push(obj);
	}

}

if($("#loginPassword").prop('checked')){
	if($("#loginPassworddataFile").val() != ""){
		obj={templateType:"loginPassworddata",fileId:$("#loginPassworddata_refId").val(),fileName:$("#loginPassworddataFile").val(),status:"true"};
//		console.log(obj);
		templatesList.push(obj);
	}if($("#loginPassworduiFile").val() != ""){
		obj={templateType:"loginPasswordui",fileId:$("#loginPasswordui_refId").val(),fileName:$("#loginPassworduiFile").val(),status:"true"};
//		console.log(obj);
		templatesList.push(obj);
	}
}
else{

	if($("#loginPassworddataFile").val() != ""){
		obj={templateType:"loginPassworddata",fileId:$("#loginPassworddata_refId").val(),fileName:$("#loginPassworddataFile").val(),status:"false"};
//		console.log(obj);
		templatesList.push(obj);
	}if($("#loginPassworduiFile").val() != ""){
		obj={templateType:"loginPasswordui",fileId:$("#loginPasswordui_refId").val(),fileName:$("#loginPassworduiFile").val(),status:"false"};
//		console.log(obj);
		templatesList.push(obj);
	}

}
if($("#emailotp").prop('checked')){
	if($("#emailotpdataFile").val() != ""){
		obj={templateType:"emailotpdata",fileId:$("#emailotpdata_refId").val(),fileName:$("#emailotpdataFile").val(),status:"true"};
//		console.log(obj);
		templatesList.push(obj);
	}
}
else{

	if($("#emailotpdataFile").val() != ""){
		obj={templateType:"emailotpdata",fileId:$("#emailotpdata_refId").val(),fileName:$("#emailotpdataFile").val(),status:"false"};
//		console.log(obj);
		templatesList.push(obj);
	}

}
if($("#purchaseRequest").prop('checked')){
	if($("#purchaseRequestdataFile").val() != ""){
		obj={templateType:"purchaseRequestdata",fileId:$("#purchaseRequestdata_refId").val(),fileName:$("#purchaseRequestdataFile").val(),status:"true"};
//		console.log(obj);
		templatesList.push(obj);
	}if($("#purchaseRequestuiFile").val() != ""){
		obj={templateType:"purchaseRequestui",fileId:$("#purchaseRequestui_refId").val(),fileName:$("#purchaseRequestuiFile").val(),status:"true"};
//		console.log(obj);
		templatesList.push(obj);
	}
}else{

	if($("#purchaseRequestdataFile").val() != ""){
		obj={templateType:"purchaseRequestdata",fileId:$("#purchaseRequestdata_refId").val(),fileName:$("#purchaseRequestdataFile").val(),status:"false"};
//		console.log(obj);
		templatesList.push(obj);
	}if($("#purchaseRequestuiFile").val() != ""){
		obj={templateType:"purchaseRequestui",fileId:$("#purchaseRequestui_refId").val(),fileName:$("#purchaseRequestuiFile").val(),status:"false"};
//		console.log(obj);
		templatesList.push(obj);
	}

}

if($("#purchaseOrder").prop('checked')){
	if($("#purchaseOrderdataFile").val() != ""){
		obj={templateType:"purchaseOrderdata",fileId:$("#purchaseOrderdata_refId").val(),fileName:$("#purchaseOrderdataFile").val(),status:"true"};
//		console.log(obj);
		templatesList.push(obj);
	}if($("#purchaseOrderuiFile").val() != ""){
		obj={templateType:"purchaseOrderui",fileId:$("#purchaseOrderui_refId").val(),fileName:$("#purchaseOrderuiFile").val(),status:"true"};
//		console.log(obj);
		templatesList.push(obj);
	}
}
else{

	if($("#purchaseOrderdataFile").val() != ""){
		obj={templateType:"purchaseOrderdata",fileId:$("#purchaseOrderdata_refId").val(),fileName:$("#purchaseOrderdataFile").val(),status:"false"};
//		console.log(obj);
		templatesList.push(obj);
	}if($("#purchaseOrderuiFile").val() != ""){
		obj={templateType:"purchaseOrderui",fileId:$("#purchaseOrderui_refId").val(),fileName:$("#purchaseOrderuiFile").val(),status:"false"};
//		console.log(obj);
		templatesList.push(obj);
	}

}
if($("#shippmentNote").prop('checked')){
	if($("#shippmentNotedataFile").val() != ""){
		obj={templateType:"shippmentNotedata",fileId:$("#shippmentNotedata_refId").val(),fileName:$("#shippmentNotedataFile").val(),status:"true"};
//		console.log(obj);
		templatesList.push(obj);
	}if($("#shippmentNoteuiFile").val() != ""){
		obj={templateType:"shippmentNoteui",fileId:$("#shippmentNoteui_refId").val(),fileName:$("#shippmentNoteuiFile").val(),status:"true"};
//		console.log(obj);
		templatesList.push(obj);
	}
}else{

	if($("#shippmentNotedataFile").val() != ""){
		obj={templateType:"shippmentNotedata",fileId:$("#shippmentNotedata_refId").val(),fileName:$("#shippmentNotedataFile").val(),status:"false"};
//		console.log(obj);
		templatesList.push(obj);
	}if($("#shippmentNoteuiFile").val() != ""){
		obj={templateType:"shippmentNoteui",fileId:$("#shippmentNoteui_refId").val(),fileName:$("#shippmentNoteuiFile").val(),status:"false"};
//		console.log(obj);
		templatesList.push(obj);
	}

}

if($("#shippmentReceipt").prop('checked')){
	if($("#shippmentReceiptdataFile").val() != ""){
		obj={templateType:"shippmentReceiptdata",fileId:$("#shippmentReceiptdata_refId").val(),fileName:$("#shippmentReceiptdataFile").val(),status:"true"};
//		console.log(obj);
		templatesList.push(obj);
	}if($("#shippmentReceiptuiFile").val() != ""){
		obj={templateType:"shippmentReceiptui",fileId:$("#shippmentReceiptui_refId").val(),fileName:$("#shippmentReceiptuiFile").val(),status:"true"};
//		console.log(obj);
		templatesList.push(obj);
	}
}
else{

	if($("#shippmentReceiptdataFile").val() != ""){
		obj={templateType:"shippmentReceiptdata",fileId:$("#shippmentReceiptdata_refId").val(),fileName:$("#shippmentReceiptdataFile").val(),status:"false"};
//		console.log(obj);
		templatesList.push(obj);
	}if($("#shippmentReceiptuiFile").val() != ""){
		obj={templateType:"shippmentReceiptui",fileId:$("#shippmentReceiptui_refId").val(),fileName:$("#shippmentReceiptuiFile").val(),status:"false"};
//		console.log(obj);
		templatesList.push(obj);
	}

}
if($("#shippmentInspection").prop('checked')){
	if($("#shippmentInspectiondataFile").val() != ""){
		obj={templateType:"shippmentInspectiondata",fileId:$("#shippmentInspectiondata_refId").val(),fileName:$("#shippmentInspectiondataFile").val(),status:"true"};
//		console.log(obj);
		templatesList.push(obj);
	}if($("#shippmentInspectionuiFile").val() != ""){
		obj={templateType:"shippmentInspectionui",fileId:$("#shippmentInspectionui_refId").val(),fileName:$("#shippmentInspectionuiFile").val(),status:"true"};
//		console.log(obj);
		templatesList.push(obj);
	}
}
else{

	if($("#shippmentInspectiondataFile").val() != ""){
		obj={templateType:"shippmentInspectiondata",fileId:$("#shippmentInspectiondata_refId").val(),fileName:$("#shippmentInspectiondataFile").val(),status:"false"};
//		console.log(obj);
		templatesList.push(obj);
	}if($("#shippmentInspectionuiFile").val() != ""){
		obj={templateType:"shippmentInspectionui",fileId:$("#shippmentInspectionui_refId").val(),fileName:$("#shippmentInspectionuiFile").val(),status:"false"};
//		console.log(obj);
		templatesList.push(obj);
	}

}
if($("#invoicing").prop('checked')){
	if($("#invoicingdataFile").val() != ""){
		obj={templateType:"invoicingdata",fileId:$("#invoicingdata_refId").val(),fileName:$("#invoicingdataFile").val(),status:"true"};
//		console.log(obj);
		templatesList.push(obj);
	}if($("#invoicinguiFile").val() != ""){
		obj={templateType:"invoicingui",fileId:$("#invoicingui_refId").val(),fileName:$("#invoicinguiFile").val(),status:"true"};
//		console.log(obj);
		templatesList.push(obj);
	}
}
else{

	if($("#invoicingdataFile").val() != ""){
		obj={templateType:"invoicingdata",fileId:$("#invoicingdata_refId").val(),fileName:$("#invoicingdataFile").val(),status:"false"};
//		console.log(obj);
		templatesList.push(obj);
	}if($("#invoicinguiFile").val() != ""){
		obj={templateType:"invoicingui",fileId:$("#invoicingui_refId").val(),fileName:$("#invoicinguiFile").val(),status:"false"};
//		console.log(obj);
		templatesList.push(obj);
	}

}

if($("#payments").prop('checked')){
	if($("#paymentsdataFile").val() != ""){
		obj={templateType:"paymentsdata",fileId:$("#paymentsdata_refId").val(),fileName:$("#paymentsdataFile").val(),status:"true"};
//		console.log(obj);
		templatesList.push(obj);
	}if($("#paymentsuiFile").val() != ""){
		obj={templateType:"paymentsui",fileId:$("#paymentsui_refId").val(),fileName:$("#paymentsuiFile").val(),status:"true"};
//		console.log(obj);
		templatesList.push(obj);
	}
}
else{

	if($("#paymentsdataFile").val() != ""){
		obj={templateType:"paymentsdata",fileId:$("#paymentsdata_refId").val(),fileName:$("#paymentsdataFile").val(),status:"false"};
//		console.log(obj);
		templatesList.push(obj);
	}if($("#paymentsuiFile").val() != ""){
		obj={templateType:"paymentsui",fileId:$("#paymentsui_refId").val(),fileName:$("#paymentsuiFile").val(),status:"false"};
//		console.log(obj);
		templatesList.push(obj);
	}

}
if($("#customerComplaintss").prop('checked')){
	if($("#customerComplaintsdataFile").val() != ""){
		obj={templateType:"customerComplaintsdata",fileId:$("#customerComplaintsdata_refId").val(),fileName:$("#customerComplaintsdataFile").val(),status:"true"};
//		console.log(obj);
		templatesList.push(obj);
	}if($("#customerComplaintsuiFile").val() != ""){
		obj={templateType:"customerComplaintsui",fileId:$("#customerComplaintsui_refId").val(),fileName:$("#customerComplaintsuiFile").val(),status:"true"};
//		console.log(obj);
		templatesList.push(obj);
	}
}
else{

	if($("#customerComplaintsdataFile").val() != ""){
		obj={templateType:"customerComplaintsdata",fileId:$("#customerComplaintsdata_refId").val(),fileName:$("#customerComplaintsdataFile").val(),status:"false"};
//		console.log(obj);
		templatesList.push(obj);
	}if($("#customerComplaintsuiFile").val() != ""){
		obj={templateType:"customerComplaintsui",fileId:$("#customerComplaintsui_refId").val(),fileName:$("#customerComplaintsuiFile").val(),status:"false"};
//		console.log(obj);
		templatesList.push(obj);
	}

}
if($("#customerFeedbacks").prop('checked')){
	if($("#customerFeedbackdataFile").val() != ""){
		obj={templateType:"customerFeedbackdata",fileId:$("#customerFeedbackdata_refId").val(),fileName:$("#customerFeedbackdataFile").val(),status:"true"};
//		console.log(obj);
		templatesList.push(obj);
	}if($("#customerFeedbackuiFile").val() != ""){
		obj={templateType:"customerFeedbackui",fileId:$("#customerFeedbackui_refId").val(),fileName:$("#customerFeedbackuiFile").val(),status:"true"};
//		console.log(obj);
		templatesList.push(obj);
	}
}
else{

	if($("#customerFeedbackdataFile").val() != ""){
		obj={templateType:"customerFeedbackdata",fileId:$("#customerFeedbackdata_refId").val(),fileName:$("#customerFeedbackdataFile").val(),status:"false"};
//		console.log(obj);
		templatesList.push(obj);
	}if($("#customerFeedbackuiFile").val() != ""){
		obj={templateType:"customerFeedbackui",fileId:$("#customerFeedbackui_refId").val(),fileName:$("#customerFeedbackuiFile").val(),status:"false"};
//		console.log(obj);
		templatesList.push(obj);
	}

}

if($("#giftCoupons").prop('checked')){
	if($("#giftCouponsdataFile").val() != ""){
		obj={templateType:"giftCouponsdata",fileId:$("#giftCouponsdata_refId").val(),fileName:$("#giftCouponsdataFile").val(),status:"true"};
//		console.log(obj);
		templatesList.push(obj);
	}if($("#giftCouponsuiFile").val() != ""){
		obj={templateType:"giftCouponsui",fileId:$("#giftCouponsui_refId").val(),fileName:$("#giftCouponsuiFile").val(),status:"true"};
//		console.log(obj);
		templatesList.push(obj);
	}
}else{

	if($("#giftCouponsdataFile").val() != ""){
		obj={templateType:"giftCouponsdata",fileId:$("#giftCouponsdata_refId").val(),fileName:$("#giftCouponsdataFile").val(),status:"false"};
//		console.log(obj);
		templatesList.push(obj);
	}if($("#giftCouponsuiFile").val() != ""){
		obj={templateType:"giftCouponsui",fileId:$("#giftCouponsui_refId").val(),fileName:$("#giftCouponsuiFile").val(),status:"false"};
//		console.log(obj);
		templatesList.push(obj);
	}

}

if($("#giftVouchers").prop('checked')){
	if($("#giftVouchersdataFile").val() != ""){
		obj={templateType:"giftVouchersdata",fileId:$("#giftVouchersdata_refId").val(),fileName:$("#giftVouchersdataFile").val(),status:"true"};
//		console.log(obj);
		templatesList.push(obj);
	}if($("#giftVouchersuiFile").val() != ""){
		obj={templateType:"giftVouchersui",fileId:$("#giftVouchersui_refId").val(),fileName:$("#giftVouchersuiFile").val(),status:"true"};
//		console.log(obj);
		templatesList.push(obj);
	}
}else{

	if($("#giftVouchersdataFile").val() != ""){
		obj={templateType:"giftVouchersdata",fileId:$("#giftVouchersdata_refId").val(),fileName:$("#giftVouchersdataFile").val(),status:"false"};
//		console.log(obj);
		templatesList.push(obj);
	}if($("#giftVouchersuiFile").val() != ""){
		obj={templateType:"giftVouchersui",fileId:$("#giftVouchersui_refId").val(),fileName:$("#giftVouchersuiFile").val(),status:"false"};
//		console.log(obj);
		templatesList.push(obj);
	}

}
debugger
if($("#loyalityRewarding").prop('checked')){
	if($("#loyalityRewardingdataFile").val() != ""){
		obj={templateType:"loyalityRewardingdata",fileId:$("#loyalityRewardingdata_refId").val(),fileName:$("#loyalityRewardingdataFile").val(),status:"true"};
//		console.log(obj);
		templatesList.push(obj);
	}if($("#loyalityRewardinguiFile").val() != ""){
		obj={templateType:"loyalityRewardingui",fileId:$("#loyalityRewardingui_refId").val(),fileName:$("#loyalityRewardinguiFile").val(),status:"true"};
//		console.log(obj);
		templatesList.push(obj);
	}
}else{

	if($("#loyalityRewardingdataFile").val() != ""){
		obj={templateType:"loyalityRewardingdata",fileId:$("#loyalityRewardingdata_refId").val(),fileName:$("#loyalityRewardingdataFile").val(),status:"false"};
//		console.log(obj);
		templatesList.push(obj);
	}if($("#loyalityRewardinguiFile").val() != ""){
		obj={templateType:"loyalityRewardingui",fileId:$("#loyalityRewardingui_refId").val(),fileName:$("#loyalityRewardinguiFile").val(),status:"false"};
//		console.log(obj);
		templatesList.push(obj);
	}

}

if($("#notificationGreetings").prop('checked')){
	if($("#notificationGreetingsdataFile").val() != ""){
		obj={templateType:"notificationGreetingsdata",fileId:$("#notificationGreetingsdata_refId").val(),fileName:$("#notificationGreetingsdataFile").val(),status:"true"};
//		console.log(obj);
		templatesList.push(obj);
	}if($("#notificationGreetingsuiFile").val() != ""){
		obj={templateType:"notificationGreetingsui",fileId:$("#notificationGreetingsui_refId").val(),fileName:$("#notificationGreetingsuiFile").val(),status:"true"};
//		console.log(obj);
		templatesList.push(obj);
	}
}
else{

	if($("#notificationGreetingsdataFile").val() != ""){
		obj={templateType:"notificationGreetingsdata",fileId:$("#notificationGreetingsdata_refId").val(),fileName:$("#notificationGreetingsdataFile").val(),status:"false"};
//		console.log(obj);
		templatesList.push(obj);
	}if($("#notificationGreetingsuiFile").val() != ""){
		obj={templateType:"notificationGreetingsui",fileId:$("#notificationGreetingsui_refId").val(),fileName:$("#notificationGreetingsuiFile").val(),status:"false"};
//		console.log(obj);
		templatesList.push(obj);
	}

}
//if($("#reportsdata_refId").val() != ""){
//	obj={templateType:"reportsdata",fileId:$("#reportsdata_refId").val(),fileName:$("#reportsdataFile").val()};
////	console.log(obj);
//	templatesList.push(obj);
//}
if($("#notificationCampaigns").prop('checked')){
	if($("#hourlyWiseReportuiFile").val() != ""){
		obj={templateType:"hourlyWiseReportui",fileId:$("#hourlyWiseReportui_refId").val(),fileName:$("#hourlyWiseReportuiFile").val(),status:"true"};
		templatesList.push(obj);
	}
}else{

	if($("#hourlyWiseReportuiFile").val() != ""){
		obj={templateType:"hourlyWiseReportui",fileId:$("#hourlyWiseReportui_refId").val(),fileName:$("#hourlyWiseReportuiFile").val(),status:"false"};
		templatesList.push(obj);
	}

}

if($("#notificationCampaigns").prop('checked')){
	if($("#notificationCampaignsdataFile").val() != ""){
		obj={templateType:"notificationCampaignsdata",fileId:$("#notificationCampaignsdata_refId").val(),fileName:$("#notificationCampaignsdataFile").val(),status:"true"};
//		console.log(obj);
		templatesList.push(obj);
	}if($("#notificationCampaignsuiFile").val() != ""){
		obj={templateType:"notificationCampaignsui",fileId:$("#notificationCampaignsui_refId").val(),fileName:$("#notificationCampaignsuiFile").val(),status:"true"};
//		console.log(obj);
		templatesList.push(obj);
	}
}else{

	if($("#notificationCampaignsdataFile").val() != ""){
		obj={templateType:"notificationCampaignsdata",fileId:$("#notificationCampaignsdata_refId").val(),fileName:$("#notificationCampaignsdataFile").val(),status:"false"};
//		console.log(obj);
		templatesList.push(obj);
	}if($("#notificationCampaignsuiFile").val() != ""){
		obj={templateType:"notificationCampaignsui",fileId:$("#notificationCampaignsui_refId").val(),fileName:$("#notificationCampaignsuiFile").val(),status:"false"};
//		console.log(obj);
		templatesList.push(obj);
	}

}	
	/*if(templatesList.length == "")
		{
		alert("AttachMent Required");
		return;
		}
	*/
	
	
	/*for(var i=0;i<templatesList.length;i++)
		{
		var temp;
		if(temp != templatesList[i].fileName){
		var a=templatesList[i].fileName;
		temp=a;
		}
		else{
		alert("Duplicate File");
		return;
		}}*/
	mailSettings.templatesList=templatesList;
	mailSettings.server = $("#smtp").val();
	mailSettings.userID = $("#mailId").val();
	mailSettings.userPassword = $("#password").val();
	mailSettings.portNO = $("#portNo").val();
	mailSettings.protocol=$("#protocol").val();
		var formData = JSON.stringify(mailSettings);
		console.log(formData);
		var contextPath = $("#contextPath").val();
	   if(operation=="new"){
		   URL = contextPath + "/settings/createMailSettings.do";
	   }
	   else if(operation=="edit"){
		   
		   URL = contextPath + "/settings/updateMailSettings.do";
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


function testEmail(){
	
	if($("#smtp").val().trim() == ""){
	$("#smtpError").html("Enter SMTP");
	return;
}

	
if($("#mailId").val().trim() == ""){
	$("#mailIdError").html("Enter Mail Id");
	return;
}


//$("#mailId").blur(function(){
	  var email = $("#mailId").val();
	  if(email==""){
		 return false;
	  }
	  if(!emailValidation(email)){
	   	$("#mailIdError").html("Invalid EmailId (Ex:abc@gmail.com)");
	   	return false;
	  }
	  else{
		$("#mailIdError").html("");
	//    return true;
	  }
	//});
	  

if($("#password").val().trim() == ""){
	$("#passwordError").html("Enter Password");
	return;
}


if($("#portNo").val().trim() == ""){
	$("#portNoError").html("Enter Port Number");
	return;
}



if($("#testMailText").val().trim() == ""){
	$("#testMailTextError").html("Enter e-mail text");
	return;
}



if($("#testmailId").val().trim() == ""){
	$("#testmailIdError").html("Enter test e-mail id");
	return;
}

var smtp = $("#smtp").val();
var mailId = $("#mailId").val();
 var password = $("#password").val();
var port = $("#portNo").val();
var testmsg = $("#testMailText").val();
var testemail = $("#testmailId").val();
var protocol = $("#protocol").val();	
	var contextPath = $("#contextPath").val();
  
	   URL = contextPath + "/settings/sendTestMail.do";
   
   
  	 $.ajax({
		type: "POST",
		url : URL,
	
		       data : {
	            	   testmsg:testmsg,
	            	  testemail:testemail,
	            	  smtp:smtp,
	            	  mailId:mailId,
	            	  password:password,
	            	  port:port,
	            	  protocol:protocol
	            	  
	            	  
	            	  
	            	  
	               },
		       beforeSend: function(xhr){                    
			   			$("#loading").css("display","block");
			   			$("#mainDiv").addClass("disabled");
		  	   	},
		  		success : function(result) {
			         if(result.includes("Successfully")){
						$("#Success").html(result);
						 $("#Error").html("");
			         }else{
			        	 $("#Success").html("");
			        	 $("#Error").html(result);
			        	 
			         }
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




