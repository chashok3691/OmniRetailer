
function enableFileBrowse(ele,id){
	debugger
//	$("#Error").html('');
	 var contextPath = $("#contextPath").val();
	if (ele != '')
	   id = $(ele).attr("id");
	if($("#"+id).prop('checked')){
		if(id=="stockReceipts" || id=="stockIssues" ||id=="customerComplaintss"||id=="customerFeedbacks"){
			 id= id.substring(0,id.length-1);
		  }
		if(id=="billing"){
			$("#thermalpdfuiBtn").closest('div').removeClass('btn-primar');
			$("#thermalpdfuiBtn").closest('div').addClass('btn-primary');
			$("#thermalpdfuiBtn").removeAttr("disabled");
		}
		$("#"+id+"dataBtn").closest('div').removeClass('btn-primar');
		$("#"+id+"dataBtn").closest('div').addClass('btn-primary');
		$("#"+id+"dataBtn").removeAttr("disabled");
		$("#"+id+"uiBtn").closest('div').removeClass('btn-primar');
		$("#"+id+"uiBtn").closest('div').addClass('btn-primary');
		$("#"+id+"uiBtn").removeAttr("disabled");
		
		
	} else {
		if(id=="stockReceipts" || id=="stockIssues" ||id=="customerComplaintss"||id=="customerFeedbacks"){
			 id= id.substring(0,id.length-1);
		  }
		
		replaceWithNewFileType(id);
		if(id=="billing"){
			$("#thermalpdfuiBtn").closest('div').removeClass('btn-primary');
			$("#thermalpdfuiBtn").closest('div').addClass('btn-primar');
			$("#thermalpdfuiBtn").attr("disabled","disabled");
		}
		$("#"+id+"dataBtn").closest('div').removeClass('btn-primary');
		$("#"+id+"dataBtn").closest('div').addClass('btn-primar');
		$("#"+id+"dataBtn").attr("disabled","disabled");
		$("#"+id+"uiBtn").closest('div').removeClass('btn-primary');
		$("#"+id+"uiBtn").closest('div').addClass('btn-primar');
		$("#"+id+"uiBtn").attr("disabled","disabled");
		
	}
	$("#"+id+"Img").closest('span').css("visibility","hidden");
	$("#"+id+"Img").attr("src",contextPath+"/images/circleWait.gif");
	//$("#"+id+"File").val("");
}

function replaceWithNewFileType(id){
	debugger
	var newFile = "<input id='"+id+"Btn' disabled='disabled' type='file' accept='.xml' onchange=addNameToTextBox('"+id+"'); class='upload' />";
	var $fileInput=$("#"+id+"Btn");
	var $fileCopy = $(newFile);
	$fileInput.replaceWith($fileCopy);
}
//sku.js
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
     // alert($("#"+id+"_refId").val());
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
	debugger
	if($("#"+id+"Btn")[0].files[0] != undefined){
		$("#"+id+"File").val($("#"+id+"Btn")[0].files[0]['name']);
		loadImageFileAsURL(id,ele);
		
		// allows xml files only.
		if($("#"+id+"File").val() != ""){
			var filename=$("#"+id+"File").val();
			var ext=filename.split('.');
			if((ext[1] != 'xml') && (ext[1] != 'XML')&& (ext[1] != 'XSL')&& (ext[1] != 'xsl')){
				$("#"+id+"File").val("");
				alert("Upload XML or XSL Files Only.");
			}
		}else{}
		
	}
		
	else
		$("#"+id+"File").val("");

}



/*$("#password").keydown(function(){
	   $("#passwordError").html("");
	   $("#Error").html("");
});*/ 

function validatePrintSettingsForm(operation){
	var printSettings = {},templatesList = [];
	debugger
	/*if($("#username").val().trim() == ""){
		$("#usernameError").html("Enter User Name");
		return;
	}*/
																
var obj={};	

	if($("#salesOrderB2c").prop('checked')){
		if($("#salesOrderB2cdataFile").val()!=null && $("#salesOrderB2cdataFile").val() != undefined && $("#salesOrderB2cdataFile").val() != ""){
			obj={templateType:"salesOrderB2cdata",fileId:$("#salesOrderB2cdata_refId").val(),fileName:$("#salesOrderB2cdataFile").val(),status:"true"};
//			console.log(obj);
			templatesList.push(obj);
		}
}
else{
	if($("#salesOrderB2cdataFile").val()!=null && $("#salesOrderB2cdataFile").val() != undefined && $("#salesOrderB2cdataFile").val() != ""){
		obj={templateType:"salesOrderB2cdata",fileId:$("#salesOrderB2cdata_refId").val(),fileName:$("#salesOrderB2cdataFile").val(),status:"false"};
//		console.log(obj);
		templatesList.push(obj);
	}
}
if($("#salesOrderB2c").prop('checked')){
	if($("#salesOrderB2cuiFile").val()!=null && $("#salesOrderB2cuiFile").val() != undefined && $("#salesOrderB2cuiFile").val() != ""){
		obj={templateType:"salesOrderB2cui",fileId:$("#salesOrderB2cui_refId").val(),fileName:$("#salesOrderB2cuiFile").val(),status:"true"};
//		console.log(obj);
		templatesList.push(obj);
	}
}else{
	if($("#salesOrderB2cuiFile").val()!=null && $("#salesOrderB2cuiFile").val() != undefined && $("#salesOrderB2cuiFile").val() != ""){
		obj={templateType:"salesOrderB2cui",fileId:$("#salesOrderB2cui_refId").val(),fileName:$("#salesOrderB2cuiFile").val(),status:"false"};
//		console.log(obj);
		templatesList.push(obj);
	}
}



if($("#salesOrderDirect").prop('checked')){
	if($("#salesOrderDirectdataFile").val()!=null && $("#salesOrderDirectdataFile").val() != undefined && $("#salesOrderDirectdataFile").val() != ""){
		obj={templateType:"salesOrderDirectdata",fileId:$("#salesOrderDirectdata_refId").val(),fileName:$("#salesOrderDirectdataFile").val(),status:"true"};
//		console.log(obj);
		templatesList.push(obj);
	}
}
else{
	if($("#salesOrderDirectdataFile").val()!=null && $("#salesOrderDirectdataFile").val() != undefined && $("#salesOrderDirectdataFile").val() != ""){
		obj={templateType:"salesOrderDirectdata",fileId:$("#salesOrderDirectdata_refId").val(),fileName:$("#salesOrderDirectdataFile").val(),status:"false"};
//		console.log(obj);
		templatesList.push(obj);
	}
}
if($("#salesOrderDirect").prop('checked')){
	if($("#salesOrderDirectuiFile").val()!=null && $("#salesOrderDirectuiFile").val() != undefined && $("#salesOrderDirectuiFile").val() != ""){
		obj={templateType:"salesOrderDirectui",fileId:$("#salesOrderDirectui_refId").val(),fileName:$("#salesOrderDirectuiFile").val(),status:"true"};
//		console.log(obj);
		templatesList.push(obj);
	}
}
else{
	if($("#salesOrderDirectuiFile").val()!=null && $("#salesOrderDirectuiFile").val() != undefined && $("#salesOrderDirectuiFile").val() != ""){
		obj={templateType:"salesOrderDirectui",fileId:$("#salesOrderDirectui_refId").val(),fileName:$("#salesOrderDirectuiFile").val(),status:"false"};
//		console.log(obj);
		templatesList.push(obj);
	}
}

if($("#salesOrderMobile").prop('checked')){
	if($("#salesOrderMobiledataFile").val()!=null && $("#salesOrderMobiledataFile").val() != undefined && $("#salesOrderMobiledataFile").val() != ""){
		obj={templateType:"salesOrderMobiledata",fileId:$("#salesOrderMobiledata_refId").val(),fileName:$("#salesOrderMobiledataFile").val(),status:"true"};
//		console.log(obj);
		templatesList.push(obj);
	}
}
else{
	if($("#salesOrderMobiledataFile").val()!=null && $("#salesOrderMobiledataFile").val() != undefined && $("#salesOrderMobiledataFile").val() != ""){
		obj={templateType:"salesOrderMobiledata",fileId:$("#salesOrderMobiledata_refId").val(),fileName:$("#salesOrderMobiledataFile").val(),status:"false"};
//		console.log(obj);
		templatesList.push(obj);
	}
}
if($("#salesOrderMobile").prop('checked')){
	if($("#salesOrderMobileuiFile").val()!=null && $("#salesOrderMobileuiFile").val() != undefined && $("#salesOrderMobileuiFile").val() != ""){
		obj={templateType:"salesOrderMobileui",fileId:$("#salesOrderMobileui_refId").val(),fileName:$("#salesOrderMobileuiFile").val(),status:"true"};
	//	console.log(obj);
		templatesList.push(obj);
	}
}
else{
	if($("#salesOrderMobileuiFile").val()!=null && $("#salesOrderMobileuiFile").val() != undefined && $("#salesOrderMobileuiFile").val() != ""){
		obj={templateType:"salesOrderMobileui",fileId:$("#salesOrderMobileui_refId").val(),fileName:$("#salesOrderMobileuiFile").val(),status:"false"};
//		console.log(obj);
		templatesList.push(obj);
	}
}
if($("#salesOrderTelephonic").prop('checked')){
	if($("#salesOrderTelephonicdataFile").val()!=null && $("#salesOrderTelephonicdataFile").val() != undefined && $("#salesOrderTelephonicdataFile").val() != ""){
		obj={templateType:"salesOrderTelephonicdata",fileId:$("#salesOrderTelephonicdata_refId").val(),fileName:$("#salesOrderTelephonicdataFile").val(),status:"true"};
//		console.log(obj);
		templatesList.push(obj);
	}
}
else{
	if($("#salesOrderTelephonicdataFile").val()!=null && $("#salesOrderTelephonicdataFile").val() != undefined && $("#salesOrderTelephonicdataFile").val() != ""){
		obj={templateType:"salesOrderTelephonicdata",fileId:$("#salesOrderTelephonicdata_refId").val(),fileName:$("#salesOrderTelephonicdataFile").val(),status:"false"};
//		console.log(obj);
		templatesList.push(obj);
	}
}
if($("#salesOrderTelephonic").prop('checked')){
	if($("#salesOrderTelephonicuiFile").val()!=null && $("#salesOrderTelephonicuiFile").val() != undefined && $("#salesOrderTelephonicuiFile").val() != ""){
		obj={templateType:"salesOrderTelephonicui",fileId:$("#salesOrderTelephonicui_refId").val(),fileName:$("#salesOrderTelephonicuiFile").val(),status:"true"};
//		console.log(obj);
		templatesList.push(obj);
	}
}
else{
	if($("#salesOrderTelephonicuiFile").val()!=null && $("#salesOrderTelephonicuiFile").val() != undefined && $("#salesOrderTelephonicuiFile").val() != ""){
		obj={templateType:"salesOrderTelephonicui",fileId:$("#salesOrderTelephonicui_refId").val(),fileName:$("#salesOrderTelephonicuiFile").val(),status:"false"};
	//	console.log(obj);
		templatesList.push(obj);
	}
}

if($("#billing").prop('checked')){
	if($("#billingdataFile").val()!=null && $("#billingdataFile").val() != undefined && $("#billingdataFile").val() != ""){
		obj={templateType:"billingdata",fileId:$("#billingdata_refId").val(),fileName:$("#billingdataFile").val(),status:"true"};
	//	console.log(obj);
		templatesList.push(obj);
	}
}
else{
	if($("#billingdataFile").val()!=null && $("#billingdataFile").val() != undefined && $("#billingdataFile").val() != ""){
		obj={templateType:"billingdata",fileId:$("#billingdata_refId").val(),fileName:$("#billingdataFile").val(),status:"false"};
	//	console.log(obj);
		templatesList.push(obj);
	}
}
if($("#billing").prop('checked')){
	if($("#billinguiFile").val()!=null && $("#billinguiFile").val() != undefined && $("#billinguiFile").val() != ""){
		obj={templateType:"billingui",fileId:$("#billingui_refId").val(),fileName:$("#billinguiFile").val(),status:"true"};
	//	console.log(obj);
		templatesList.push(obj);
	}
}
else{
	if($("#billinguiFile").val()!=null && $("#billinguiFile").val() != undefined && $("#billinguiFile").val() != ""){
		obj={templateType:"billingui",fileId:$("#billingui_refId").val(),fileName:$("#billinguiFile").val(),status:"false"};
	//	console.log(obj);
		templatesList.push(obj);
	}
}
debugger
if($("#billing").prop('checked')){
	if($("#thermalpdfuiFile").val()!=null && $("#thermalpdfuiFile").val() != undefined && $("#thermalpdfuiFile").val() != ""){
		obj={templateType:"thermalpdfui",fileId:$("#thermalpdfui_refId").val(),fileName:$("#thermalpdfuiFile").val(),status:"true"};
	//	console.log(obj);
		templatesList.push(obj);
	}
}
else{
	if($("#thermalpdfuiFile").val()!=null && $("#thermalpdfuiFile").val() != undefined && $("#thermalpdfuiFile").val() != ""){
		obj={templateType:"thermalpdfui",fileId:$("#thermalpdfui_refId").val(),fileName:$("#thermalpdfuiFile").val(),status:"false"};
	//	console.log(obj);
		templatesList.push(obj);
	}
}

if($("#billingCC").prop('checked')){
	if($("#billingCCdataFile").val()!=null && $("#billingCCdataFile").val() != undefined && $("#billingCCdataFile").val() != ""){
		obj={templateType:"billingCCdata",fileId:$("#billingCCdata_refId").val(),fileName:$("#billingCCdataFile").val(),status:"true"};
	//	console.log(obj);
		templatesList.push(obj);
	}
}
else{
	if($("#billingCCdataFile").val()!=null && $("#billingCCdataFile").val() != undefined && $("#billingCCdataFile").val() != ""){
		obj={templateType:"billingCCdata",fileId:$("#billingCCdata_refId").val(),fileName:$("#billingCCdataFile").val(),status:"false"};
	//	console.log(obj);
		templatesList.push(obj);
	}
}
if($("#billingCC").prop('checked')){
	if($("#billingCCuiFile").val()!=null && $("#billingCCuiFile").val() != undefined && $("#billingCCuiFile").val() != ""){
	obj={templateType:"billingCCui",fileId:$("#billingCCui_refId").val(),fileName:$("#billingCCuiFile").val(),status:"true"};
//	console.log(obj);
	templatesList.push(obj);
	}
}
else{
	if($("#billingCCuiFile").val()!=null && $("#billingCCuiFile").val() != undefined && $("#billingCCuiFile").val() != ""){
		obj={templateType:"billingCCui",fileId:$("#billingCCui_refId").val(),fileName:$("#billingCCuiFile").val(),status:"false"};
	//	console.log(obj);
		templatesList.push(obj);
	}
}

if($("#stockReceipts").prop('checked')){
	if($("#stockReceiptdataFile").val()!=null && $("#stockReceiptdataFile").val() != undefined && $("#stockReceiptdataFile").val() != ""){
		obj={templateType:"stockReceiptdata",fileId:$("#stockReceiptdata_refId").val(),fileName:$("#stockReceiptdataFile").val(),status:"true"};
	//	console.log(obj);
		templatesList.push(obj);
	}
}
else{
	if($("#stockReceiptdataFile").val()!=null && $("#stockReceiptdataFile").val() != undefined && $("#stockReceiptdataFile").val() != ""){
		obj={templateType:"stockReceiptdata",fileId:$("#stockReceiptdata_refId").val(),fileName:$("#stockReceiptdataFile").val(),status:"false"};
	//	console.log(obj);
		templatesList.push(obj);
	}
}
if($("#stockReceipts").prop('checked')){
	if($("#stockReceiptuiFile").val()!=null && $("#stockReceiptuiFile").val() != undefined && $("#stockReceiptuiFile").val() != ""){
		obj={templateType:"stockReceiptui",fileId:$("#stockReceiptui_refId").val(),fileName:$("#stockReceiptuiFile").val(),status:"true"};
	//	console.log(obj);
		templatesList.push(obj);
	}
}
else{
	if($("#stockReceiptuiFile").val()!=null && $("#stockReceiptuiFile").val() != undefined && $("#stockReceiptuiFile").val() != ""){
		obj={templateType:"stockReceiptui",fileId:$("#stockReceiptui_refId").val(),fileName:$("#stockReceiptuiFile").val(),status:"false"};
	//	console.log(obj);
		templatesList.push(obj);
	}
}

if($("#stockIssues").prop('checked')){
	if($("#stockIssuedataFile").val()!=null && $("#stockIssuedataFile").val() != undefined && $("#stockIssuedataFile").val() != ""){
		obj={templateType:"stockIssuedata",fileId:$("#stockIssuedata_refId").val(),fileName:$("#stockIssuedataFile").val(),status:"true"};
	//	console.log(obj);
		templatesList.push(obj);
	}
}
else{
	if($("#stockIssuedataFile").val()!=null && $("#stockIssuedataFile").val() != undefined && $("#stockIssuedataFile").val() != ""){
		obj={templateType:"stockIssuedata",fileId:$("#stockIssuedata_refId").val(),fileName:$("#stockIssuedataFile").val(),status:"false"};
	//	console.log(obj);
		templatesList.push(obj);
	}
}
if($("#stockIssues").prop('checked')){
	if($("#stockIssueuiFile").val()!=null && $("#stockIssueuiFile").val() != undefined && $("#stockIssueuiFile").val() != ""){
		obj={templateType:"stockIssueui",fileId:$("#stockIssueui_refId").val(),fileName:$("#stockIssueuiFile").val(),status:"true"};
	//	console.log(obj);
		templatesList.push(obj);
	}
}
else{
	if($("#stockIssueuiFile").val()!=null && $("#stockIssueuiFile").val() != undefined && $("#stockIssueuiFile").val() != ""){
		obj={templateType:"stockIssueui",fileId:$("#stockIssueui_refId").val(),fileName:$("#stockIssueuiFile").val(),status:"false"};
	//	console.log(obj);
		templatesList.push(obj);
	}
}

if($("#stockRequest").prop('checked')){
	if($("#stockRequestdataFile").val()!=null && $("#stockRequestdataFile").val() != undefined && $("#stockRequestdataFile").val() != ""){
		obj={templateType:"stockRequestdata",fileId:$("#stockRequestdata_refId").val(),fileName:$("#stockRequestdataFile").val(),status:"true"};
	//	console.log(obj);
		templatesList.push(obj);
	}
}else{
	if($("#stockRequestdataFile").val()!=null && $("#stockRequestdataFile").val() != undefined && $("#stockRequestdataFile").val() != ""){
		obj={templateType:"stockRequestdata",fileId:$("#stockRequestdata_refId").val(),fileName:$("#stockRequestdataFile").val(),status:"false"};
	//	console.log(obj);
		templatesList.push(obj);
	}
}
if($("#stockRequest").prop('checked')){
	if($("#stockRequestuiFile").val()!=null && $("#stockRequestuiFile").val() != undefined && $("#stockRequestuiFile").val() != ""){
		obj={templateType:"stockRequestui",fileId:$("#stockRequestui_refId").val(),fileName:$("#stockRequestuiFile").val(),status:"true"};
	//	console.log(obj);
		templatesList.push(obj);
	}
}
else{
	if($("#stockRequestuiFile").val()!=null && $("#stockRequestuiFile").val() != undefined && $("#stockRequestuiFile").val() != ""){
		obj={templateType:"stockRequestui",fileId:$("#stockRequestui_refId").val(),fileName:$("#stockRequestuiFile").val(),status:"false"};
	//	console.log(obj);
		templatesList.push(obj);
	}
}
if($("#stockReturn").prop('checked')){
	if($("#stockReturndataFile").val()!=null && $("#stockReturndataFile").val() != undefined && $("#stockReturndataFile").val() != ""){
		obj={templateType:"stockReturndata",fileId:$("#stockReturndata_refId").val(),fileName:$("#stockReturndataFile").val(),status:"true"};
	//	console.log(obj);
		templatesList.push(obj);
	}
}
else{
	if($("#stockReturndataFile").val()!=null && $("#stockReturndataFile").val() != undefined && $("#stockReturndataFile").val() != ""){
		obj={templateType:"stockReturndata",fileId:$("#stockReturndata_refId").val(),fileName:$("#stockReturndataFile").val(),status:"false"};
	//	console.log(obj);
		templatesList.push(obj);
	}
}

if($("#stockReturn").prop('checked')){
	if($("#stockReturnuiFile").val()!=null && $("#stockReturnuiFile").val() != undefined && $("#stockReturnuiFile").val() != ""){
		obj={templateType:"stockReturnui",fileId:$("#stockReturnui_refId").val(),fileName:$("#stockReturnuiFile").val(),status:"true"};
	//	console.log(obj);
		templatesList.push(obj);
	}
}
else{
	if($("#stockReturnuiFile").val()!=null && $("#stockReturnuiFile").val() != undefined && $("#stockReturnuiFile").val() != ""){
		obj={templateType:"stockReturnui",fileId:$("#stockReturnui_refId").val(),fileName:$("#stockReturnuiFile").val(),status:"false"};
	//	console.log(obj);
		templatesList.push(obj);
	}
}

if($("#inventoryAlerts").prop('checked')){
	if($("#inventoryAlertsdataFile").val()!=null && $("#inventoryAlertsdataFile").val() != undefined && $("#inventoryAlertsdataFile").val() != ""){
		obj={templateType:"inventoryAlertsdata",fileId:$("#inventoryAlertsdata_refId").val(),fileName:$("#inventoryAlertsdataFile").val(),status:"true"};
	//	console.log(obj);
		templatesList.push(obj);
	}
}
else{
	if($("#inventoryAlertsdataFile").val()!=null && $("#inventoryAlertsdataFile").val() != undefined && $("#inventoryAlertsdataFile").val() != ""){
		obj={templateType:"inventoryAlertsdata",fileId:$("#inventoryAlertsdata_refId").val(),fileName:$("#inventoryAlertsdataFile").val(),status:"false"};
	//	console.log(obj);
		templatesList.push(obj);
	}
}
if($("#inventoryAlerts").prop('checked')){
	if($("#inventoryAlertsuiFile").val()!=null && $("#inventoryAlertsuiFile").val() != undefined && $("#inventoryAlertsuiFile").val() != ""){
		obj={templateType:"inventoryAlertsui",fileId:$("#inventoryAlertsui_refId").val(),fileName:$("#inventoryAlertsuiFile").val(),status:"true"};
	//	console.log(obj);
		templatesList.push(obj);
	}
}
else{
	if($("#inventoryAlertsuiFile").val()!=null && $("#inventoryAlertsuiFile").val() != undefined && $("#inventoryAlertsuiFile").val() != ""){
		obj={templateType:"inventoryAlertsui",fileId:$("#inventoryAlertsui_refId").val(),fileName:$("#inventoryAlertsuiFile").val(),status:"false"};
	//	console.log(obj);
		templatesList.push(obj);
	}
}

if($("#stockVerification").prop('checked')){
	if($("#stockVerificationdataFile").val()!=null && $("#stockVerificationdataFile").val() != undefined && $("#stockVerificationdataFile").val() != ""){
		obj={templateType:"stockVerificationdata",fileId:$("#stockVerificationdata_refId").val(),fileName:$("#stockVerificationdataFile").val(),status:"true"};
	//	console.log(obj);
		templatesList.push(obj);
	}
}
else{
	if($("#stockVerificationdataFile").val()!=null && $("#stockVerificationdataFile").val() != undefined && $("#stockVerificationdataFile").val() != ""){
		obj={templateType:"stockVerificationdata",fileId:$("#stockVerificationdata_refId").val(),fileName:$("#stockVerificationdataFile").val(),status:"false"};
	//	console.log(obj);
		templatesList.push(obj);
	}

}
if($("#stockVerification").prop('checked')){
	if($("#stockVerificationuiFile").val()!=null && $("#stockVerificationuiFile").val() != undefined && $("#stockVerificationuiFile").val() != ""){
		obj={templateType:"stockVerificationui",fileId:$("#stockVerificationui_refId").val(),fileName:$("#stockVerificationuiFile").val(),status:"true"};
	//	console.log(obj);
		templatesList.push(obj);
	}
}
else{
	if($("#stockVerificationuiFile").val()!=null && $("#stockVerificationuiFile").val() != undefined && $("#stockVerificationuiFile").val() != ""){
		obj={templateType:"stockVerificationui",fileId:$("#stockVerificationui_refId").val(),fileName:$("#stockVerificationuiFile").val(),status:"false"};
	//	console.log(obj);
		templatesList.push(obj);
	}
}


if($("#customerRegistration").prop('checked')){
	if($("#customerRegistrationdataFile").val()!=null && $("#customerRegistrationdataFile").val() != undefined && $("#customerRegistrationdataFile").val() != ""){
	obj={templateType:"customerRegistrationdata",fileId:$("#customerRegistrationdata_refId").val(),fileName:$("#customerRegistrationdataFile").val(),status:"true"};
//	console.log(obj);
	templatesList.push(obj);
	}
}
else{
	if($("#customerRegistrationdataFile").val()!=null && $("#customerRegistrationdataFile").val() != undefined && $("#customerRegistrationdataFile").val() != ""){
		obj={templateType:"customerRegistrationdata",fileId:$("#customerRegistrationdata_refId").val(),fileName:$("#customerRegistrationdataFile").val(),status:"false"};
	//	console.log(obj);
		templatesList.push(obj);
	}

}
if($("#customerRegistration").prop('checked')){
	if($("#customerRegistrationuiFile").val()!=null && $("#customerRegistrationuiFile").val() != undefined && $("#customerRegistrationuiFile").val() != ""){
		obj={templateType:"customerRegistrationui",fileId:$("#customerRegistrationui_refId").val(),fileName:$("#customerRegistrationuiFile").val(),status:"true"};
	//	console.log(obj);
		templatesList.push(obj);
	}
}
else{
	if($("#customerRegistrationuiFile").val()!=null && $("#customerRegistrationuiFile").val() != undefined && $("#customerRegistrationuiFile").val() != ""){
		obj={templateType:"customerRegistrationui",fileId:$("#customerRegistrationui_refId").val(),fileName:$("#customerRegistrationuiFile").val(),status:"false"};
	//	console.log(obj);
		templatesList.push(obj);
	}

}
if($("#customerUpdate").prop('checked')){
	if($("#customerUpdatedataFile").val()!=null && $("#customerUpdatedataFile").val() != undefined && $("#customerUpdatedataFile").val() != ""){
		obj={templateType:"customerUpdatedata",fileId:$("#customerUpdatedata_refId").val(),fileName:$("#customerUpdatedataFile").val(),status:"true"};
	//	console.log(obj);
		templatesList.push(obj);
	}
}
else{
	if($("#customerUpdatedataFile").val()!=null && $("#customerUpdatedataFile").val() != undefined && $("#customerUpdatedataFile").val() != ""){
		obj={templateType:"customerUpdatedata",fileId:$("#customerUpdatedata_refId").val(),fileName:$("#customerUpdatedataFile").val(),status:"false"};
	//	console.log(obj);
		templatesList.push(obj);
	}

}
if($("#customerUpdate").prop('checked')){
	if($("#customerUpdateuiFile").val()!=null && $("#customerUpdateuiFile").val() != undefined && $("#customerUpdateuiFile").val() != ""){
		obj={templateType:"customerUpdateui",fileId:$("#customerUpdateui_refId").val(),fileName:$("#customerUpdateuiFile").val(),status:"true"};
	//	console.log(obj);
		templatesList.push(obj);
	}
}
else{
	if($("#customerUpdateuiFile").val()!=null && $("#customerUpdateuiFile").val() != undefined && $("#customerUpdateuiFile").val() != ""){
		obj={templateType:"customerUpdateui",fileId:$("#customerUpdateui_refId").val(),fileName:$("#customerUpdateuiFile").val(),status:"false"};
	//	console.log(obj);
		templatesList.push(obj);
	}
}
if($("#loginPassword").prop('checked')){
	if($("#loginPassworddataFile").val()!=null && $("#loginPassworddataFile").val() != undefined && $("#loginPassworddataFile").val() != ""){
		obj={templateType:"loginPassworddata",fileId:$("#loginPassworddata_refId").val(),fileName:$("#loginPassworddataFile").val(),status:"true"};
	//	console.log(obj);
		templatesList.push(obj);
	}
}
else{
	if($("#loginPassworddataFile").val()!=null && $("#loginPassworddataFile").val() != undefined && $("#loginPassworddataFile").val() != ""){
		obj={templateType:"loginPassworddata",fileId:$("#loginPassworddata_refId").val(),fileName:$("#loginPassworddataFile").val(),status:"false"};
	//	console.log(obj);
		templatesList.push(obj);
	}
}
if($("#loginPassword").prop('checked')){
	if($("#loginPassworduiFile").val()!=null && $("#loginPassworduiFile").val() != undefined && $("#loginPassworduiFile").val() != ""){
		obj={templateType:"loginPasswordui",fileId:$("#loginPasswordui_refId").val(),fileName:$("#loginPassworduiFile").val(),status:"true"};
	//	console.log(obj);
		templatesList.push(obj);
	}
}
else{
	if($("#loginPassworduiFile").val()!=null && $("#loginPassworduiFile").val() != undefined && $("#loginPassworduiFile").val() != ""){
		obj={templateType:"loginPasswordui",fileId:$("#loginPasswordui_refId").val(),fileName:$("#loginPassworduiFile").val(),status:"false"};
	//	console.log(obj);
		templatesList.push(obj);
	}
}
if($("#purchaseRequest").prop('checked')){
	if($("#purchaseRequestdataFile").val()!=null && $("#purchaseRequestdataFile").val() != undefined && $("#purchaseRequestdataFile").val() != ""){
		obj={templateType:"purchaseRequestdata",fileId:$("#purchaseRequestdata_refId").val(),fileName:$("#purchaseRequestdataFile").val(),status:"true"};
	//	console.log(obj);
		templatesList.push(obj);
	}
}
else{
	if($("#purchaseRequestdataFile").val()!=null && $("#purchaseRequestdataFile").val() != undefined && $("#purchaseRequestdataFile").val() != ""){
		obj={templateType:"purchaseRequestdata",fileId:$("#purchaseRequestdata_refId").val(),fileName:$("#purchaseRequestdataFile").val(),status:"false"};
	//	console.log(obj);
		templatesList.push(obj);
	}
}
if($("#purchaseRequest").prop('checked')){
	if($("#purchaseRequestuiFile").val()!=null && $("#purchaseRequestuiFile").val() != undefined && $("#purchaseRequestuiFile").val() != ""){
		obj={templateType:"purchaseRequestui",fileId:$("#purchaseRequestui_refId").val(),fileName:$("#purchaseRequestuiFile").val(),status:"true"};
	//	console.log(obj);
		templatesList.push(obj);
	}
}
else{
	if($("#purchaseRequestuiFile").val()!=null && $("#purchaseRequestuiFile").val() != undefined && $("#purchaseRequestuiFile").val() != ""){
		obj={templateType:"purchaseRequestui",fileId:$("#purchaseRequestui_refId").val(),fileName:$("#purchaseRequestuiFile").val(),status:"false"};
	//	console.log(obj);
		templatesList.push(obj);
	}
}
if($("#purchaseOrder").prop('checked')){
	if($("#purchaseOrderdataFile").val()!=null && $("#purchaseOrderdataFile").val() != undefined && $("#purchaseOrderdataFile").val() != ""){
		obj={templateType:"purchaseOrderdata",fileId:$("#purchaseOrderdata_refId").val(),fileName:$("#purchaseOrderdataFile").val(),status:"true"};
	//	console.log(obj);
		templatesList.push(obj);
	}
}
else{
	if($("#purchaseOrderdataFile").val()!=null && $("#purchaseOrderdataFile").val() != undefined && $("#purchaseOrderdataFile").val() != ""){
		obj={templateType:"purchaseOrderdata",fileId:$("#purchaseOrderdata_refId").val(),fileName:$("#purchaseOrderdataFile").val(),status:"false"};
	//	console.log(obj);
		templatesList.push(obj);
	}
}
if($("#purchaseOrder").prop('checked')){
	if($("#purchaseOrderuiFile").val()!=null && $("#purchaseOrderuiFile").val() != undefined && $("#purchaseOrderuiFile").val() != ""){
		obj={templateType:"purchaseOrderui",fileId:$("#purchaseOrderui_refId").val(),fileName:$("#purchaseOrderuiFile").val(),status:"true"};
	//	console.log(obj);
		templatesList.push(obj);
	}
}
else{
	if($("#purchaseOrderuiFile").val()!=null && $("#purchaseOrderuiFile").val() != undefined && $("#purchaseOrderuiFile").val() != ""){
		obj={templateType:"purchaseOrderui",fileId:$("#purchaseOrderui_refId").val(),fileName:$("#purchaseOrderuiFile").val(),status:"false"};
	//	console.log(obj);
		templatesList.push(obj);
	}
}
if($("#shippmentNote").prop('checked')){
	if($("#shippmentNotedataFile").val()!=null && $("#shippmentNotedataFile").val() != undefined && $("#shippmentNotedataFile").val() != ""){
		obj={templateType:"shippmentNotedata",fileId:$("#shippmentNotedata_refId").val(),fileName:$("#shippmentNotedataFile").val(),status:"true"};
	//	console.log(obj);
		templatesList.push(obj);
	}
}
else{
	if($("#shippmentNotedataFile").val()!=null && $("#shippmentNotedataFile").val() != undefined && $("#shippmentNotedataFile").val() != ""){
		obj={templateType:"shippmentNotedata",fileId:$("#shippmentNotedata_refId").val(),fileName:$("#shippmentNotedataFile").val(),status:"false"};
	//	console.log(obj);
		templatesList.push(obj);
	}
}
if($("#shippmentNote").prop('checked')){
	if($("#shippmentNoteuiFile").val()!=null && $("#shippmentNoteuiFile").val() != undefined && $("#shippmentNoteuiFile").val() != ""){
		obj={templateType:"shippmentNoteui",fileId:$("#shippmentNoteui_refId").val(),fileName:$("#shippmentNoteuiFile").val(),status:"true"};
	//	console.log(obj);
		templatesList.push(obj);
	}
}
else{
	if($("#shippmentNoteuiFile").val()!=null && $("#shippmentNoteuiFile").val() != undefined && $("#shippmentNoteuiFile").val() != ""){
		obj={templateType:"shippmentNoteui",fileId:$("#shippmentNoteui_refId").val(),fileName:$("#shippmentNoteuiFile").val(),status:"false"};
	//	console.log(obj);
		templatesList.push(obj);
	}
}
if($("#shippmentReceipt").prop('checked')){
	if($("#shippmentReceiptdataFile").val()!=null && $("#shippmentReceiptdataFile").val() != undefined && $("#shippmentReceiptdataFile").val() != ""){
		obj={templateType:"shippmentReceiptdata",fileId:$("#shippmentReceiptdata_refId").val(),fileName:$("#shippmentReceiptdataFile").val(),status:"true"};
	//	console.log(obj);
		templatesList.push(obj);
	}
}
else{
	if($("#shippmentReceiptdataFile").val()!=null && $("#shippmentReceiptdataFile").val() != undefined && $("#shippmentReceiptdataFile").val() != ""){
		obj={templateType:"shippmentReceiptdata",fileId:$("#shippmentReceiptdata_refId").val(),fileName:$("#shippmentReceiptdataFile").val(),status:"false"};
	//	console.log(obj);
		templatesList.push(obj);
	}
}

if($("#shippmentReceipt").prop('checked')){
	if($("#shippmentReceiptuiFile").val()!=null && $("#shippmentReceiptuiFile").val() != undefined && $("#shippmentReceiptuiFile").val() != ""){
		obj={templateType:"shippmentReceiptui",fileId:$("#shippmentReceiptui_refId").val(),fileName:$("#shippmentReceiptuiFile").val(),status:"true"};
	//	console.log(obj);
		templatesList.push(obj);
	}
}
else{
	if($("#shippmentReceiptuiFile").val()!=null && $("#shippmentReceiptuiFile").val() != undefined && $("#shippmentReceiptuiFile").val() != ""){
		obj={templateType:"shippmentReceiptui",fileId:$("#shippmentReceiptui_refId").val(),fileName:$("#shippmentReceiptuiFile").val(),status:"false"};
	//	console.log(obj);
		templatesList.push(obj);
	}
}
if($("#shippmentInspection").prop('checked')){
	if($("#shippmentInspectiondataFile").val()!=null && $("#shippmentInspectiondataFile").val() != undefined && $("#shippmentInspectiondataFile").val() != ""){
		obj={templateType:"shippmentInspectiondata",fileId:$("#shippmentInspectiondata_refId").val(),fileName:$("#shippmentInspectiondataFile").val(),status:"true"};
	//	console.log(obj);
		templatesList.push(obj);
	}
}
else{
	if($("#shippmentInspectiondataFile").val()!=null && $("#shippmentInspectiondataFile").val() != undefined && $("#shippmentInspectiondataFile").val() != ""){
		obj={templateType:"shippmentInspectiondata",fileId:$("#shippmentInspectiondata_refId").val(),fileName:$("#shippmentInspectiondataFile").val(),status:"false"};
	//	console.log(obj);
		templatesList.push(obj);
	}
}
if($("#shippmentInspection").prop('checked')){
	if($("#shippmentInspectionuiFile").val()!=null && $("#shippmentInspectionuiFile").val() != undefined && $("#shippmentInspectionuiFile").val() != ""){
		obj={templateType:"shippmentInspectionui",fileId:$("#shippmentInspectionui_refId").val(),fileName:$("#shippmentInspectionuiFile").val(),status:"true"};
	//	console.log(obj);
		templatesList.push(obj);
	}
}
else{
	if($("#shippmentInspectionuiFile").val()!=null && $("#shippmentInspectionuiFile").val() != undefined && $("#shippmentInspectionuiFile").val() != ""){
		obj={templateType:"shippmentInspectionui",fileId:$("#shippmentInspectionui_refId").val(),fileName:$("#shippmentInspectionuiFile").val(),status:"false"};
	//	console.log(obj);
		templatesList.push(obj);
	}
}

if($("#invoicing").prop('checked')){
	if($("#invoicingdataFile").val()!=null && $("#invoicingdataFile").val() != undefined && $("#invoicingdataFile").val() != ""){
		obj={templateType:"invoicingdata",fileId:$("#invoicingdata_refId").val(),fileName:$("#invoicingdataFile").val(),status:"true"};
	//	console.log(obj);
		templatesList.push(obj);
	}
}
else{
	if($("#invoicingdataFile").val()!=null && $("#invoicingdataFile").val() != undefined && $("#invoicingdataFile").val() != ""){
		obj={templateType:"invoicingdata",fileId:$("#invoicingdata_refId").val(),fileName:$("#invoicingdataFile").val(),status:"false"};
	//	console.log(obj);
		templatesList.push(obj);
	}
}
if($("#invoicing").prop('checked')){
	if($("#invoicinguiFile").val()!=null && $("#invoicinguiFile").val() != undefined && $("#invoicinguiFile").val() != ""){
		obj={templateType:"invoicingui",fileId:$("#invoicingui_refId").val(),fileName:$("#invoicinguiFile").val(),status:"true"};
	//	console.log(obj);
		templatesList.push(obj);
	}
}
else{
	if($("#invoicinguiFile").val()!=null && $("#invoicinguiFile").val() != undefined && $("#invoicinguiFile").val() != ""){
		obj={templateType:"invoicingui",fileId:$("#invoicingui_refId").val(),fileName:$("#invoicinguiFile").val(),status:"false"};
	//	console.log(obj);
		templatesList.push(obj);
	}
}


if($("#payments").prop('checked')){
	if($("#paymentsdataFile").val()!=null && $("#paymentsdataFile").val() != undefined && $("#paymentsdataFile").val() != ""){
		obj={templateType:"paymentsdata",fileId:$("#paymentsdata_refId").val(),fileName:$("#paymentsdataFile").val(),status:"true"};
	//	console.log(obj);
		templatesList.push(obj);
	}
}
else{
	if($("#paymentsdataFile").val()!=null && $("#paymentsdataFile").val() != undefined && $("#paymentsdataFile").val() != ""){
		obj={templateType:"paymentsdata",fileId:$("#paymentsdata_refId").val(),fileName:$("#paymentsdataFile").val(),status:"false"};
	//	console.log(obj);
		templatesList.push(obj);
	}

}

if($("#payments").prop('checked')){
	if($("#paymentsuiFile").val()!=null && $("#paymentsuiFile").val() != undefined && $("#paymentsuiFile").val() != ""){
		obj={templateType:"paymentsui",fileId:$("#paymentsui_refId").val(),fileName:$("#paymentsuiFile").val(),status:"true"};
	//	console.log(obj);
		templatesList.push(obj);
	}
}
else{
	if($("#paymentsuiFile").val()!=null && $("#paymentsuiFile").val() != undefined && $("#paymentsuiFile").val() != ""){
		obj={templateType:"paymentsui",fileId:$("#paymentsui_refId").val(),fileName:$("#paymentsuiFile").val(),status:"false"};
	//	console.log(obj);
		templatesList.push(obj);
	}

}
if($("#customerComplaintss").prop('checked')){
	if($("#customerComplaintsdataFile").val()!=null && $("#customerComplaintsdataFile").val() != undefined && $("#customerComplaintsdataFile").val() != ""){
		obj={templateType:"customerComplaintsdata",fileId:$("#customerComplaintsdata_refId").val(),fileName:$("#customerComplaintsdataFile").val(),status:"true"};
	//	console.log(obj);
		templatesList.push(obj);
	}
}
else{
	if($("#customerComplaintsdataFile").val()!=null && $("#customerComplaintsdataFile").val() != undefined && $("#customerComplaintsdataFile").val() != ""){
		obj={templateType:"customerComplaintsdata",fileId:$("#customerComplaintsdata_refId").val(),fileName:$("#customerComplaintsdataFile").val(),status:"false"};
	//	console.log(obj);
		templatesList.push(obj);
	}

}
if($("#customerComplaintss").prop('checked')){
	if($("#customerComplaintsuiFile").val()!=null && $("#customerComplaintsuiFile").val() != undefined && $("#customerComplaintsuiFile").val() != ""){
		obj={templateType:"customerComplaintsui",fileId:$("#customerComplaintsui_refId").val(),fileName:$("#customerComplaintsuiFile").val(),status:"true"};
	//	console.log(obj);
		templatesList.push(obj);
	}
}
else{
	if($("#customerComplaintsuiFile").val()!=null && $("#customerComplaintsuiFile").val() != undefined && $("#customerComplaintsuiFile").val() != ""){
		obj={templateType:"customerComplaintsui",fileId:$("#customerComplaintsui_refId").val(),fileName:$("#customerComplaintsuiFile").val(),status:"false"};
	//	console.log(obj);
		templatesList.push(obj);
	}

}
if($("#customerFeedbacks").prop('checked')){
	if($("#customerFeedbackdataFile").val()!=null && $("#customerFeedbackdataFile").val() != undefined && $("#customerFeedbackdataFile").val() != ""){
		obj={templateType:"customerFeedbackdata",fileId:$("#customerFeedbackdata_refId").val(),fileName:$("#customerFeedbackdataFile").val(),status:"true"};
	//	console.log(obj);
		templatesList.push(obj);
	}
}
else{
	if($("#customerFeedbackdataFile").val()!=null && $("#customerFeedbackdataFile").val() != undefined && $("#customerFeedbackdataFile").val() != ""){
		obj={templateType:"customerFeedbackdata",fileId:$("#customerFeedbackdata_refId").val(),fileName:$("#customerFeedbackdataFile").val(),status:"false"};
	//	console.log(obj);
		templatesList.push(obj);
	}

}
if($("#customerFeedbacks").prop('checked')){
	if($("#customerFeedbackuiFile").val()!=null && $("#customerFeedbackuiFile").val() != undefined && $("#customerFeedbackuiFile").val() != ""){
		obj={templateType:"customerFeedbackui",fileId:$("#customerFeedbackui_refId").val(),fileName:$("#customerFeedbackuiFile").val(),status:"true"};
	//	console.log(obj);
		templatesList.push(obj);
	}
}
else{
	if($("#customerFeedbackuiFile").val()!=null && $("#customerFeedbackuiFile").val() != undefined && $("#customerFeedbackuiFile").val() != ""){
		obj={templateType:"customerFeedbackui",fileId:$("#customerFeedbackui_refId").val(),fileName:$("#customerFeedbackuiFile").val(),status:"false"};
	//	console.log(obj);
		templatesList.push(obj);
	}

}
if($("#giftCoupons").prop('checked')){
	if($("#giftCouponsdataFile").val()!=null && $("#giftCouponsdataFile").val() != undefined && $("#giftCouponsdataFile").val() != ""){
		obj={templateType:"giftCouponsdata",fileId:$("#giftCouponsdata_refId").val(),fileName:$("#giftCouponsdataFile").val(),status:"true"};
	//	console.log(obj);
		templatesList.push(obj);
	}
}
else{
	if($("#giftCouponsdataFile").val()!=null && $("#giftCouponsdataFile").val() != undefined && $("#giftCouponsdataFile").val() != ""){
		obj={templateType:"giftCouponsdata",fileId:$("#giftCouponsdata_refId").val(),fileName:$("#giftCouponsdataFile").val(),status:"false"};
	//	console.log(obj);
		templatesList.push(obj);
	}

}
if($("#giftCoupons").prop('checked')){
	if($("#giftCouponsuiFile").val()!=null && $("#giftCouponsuiFile").val() != undefined && $("#giftCouponsuiFile").val() != ""){
		obj={templateType:"giftCouponsui",fileId:$("#giftCouponsui_refId").val(),fileName:$("#giftCouponsuiFile").val(),status:"true"};
	//	console.log(obj);
		templatesList.push(obj);
	}
}
else{
	if($("#giftCouponsuiFile").val()!=null && $("#giftCouponsuiFile").val() != undefined && $("#giftCouponsuiFile").val() != ""){
		obj={templateType:"giftCouponsui",fileId:$("#giftCouponsui_refId").val(),fileName:$("#giftCouponsuiFile").val(),status:"false"};
	//	console.log(obj);
		templatesList.push(obj);
	}

}
if($("#giftVouchers").prop('checked')){
	if($("#giftVouchersdataFile").val()!=null && $("#giftVouchersdataFile").val() != undefined && $("#giftVouchersdataFile").val() != ""){
		obj={templateType:"giftVouchersdata",fileId:$("#giftVouchersdata_refId").val(),fileName:$("#giftVouchersdataFile").val(),status:"true"};
	//	console.log(obj);
		templatesList.push(obj);
	}
}
else{
	if($("#giftVouchersdataFile").val()!=null && $("#giftVouchersdataFile").val() != undefined && $("#giftVouchersdataFile").val() != ""){
		obj={templateType:"giftVouchersdata",fileId:$("#giftVouchersdata_refId").val(),fileName:$("#giftVouchersdataFile").val(),status:"false"};
	//	console.log(obj);
		templatesList.push(obj);
	}

}
if($("#giftVouchers").prop('checked')){
	if($("#giftVouchersuiFile").val()!=null && $("#giftVouchersuiFile").val() != undefined && $("#giftVouchersuiFile").val() != ""){
		obj={templateType:"giftVouchersui",fileId:$("#giftVouchersui_refId").val(),fileName:$("#giftVouchersuiFile").val(),status:"true"};
	//	console.log(obj);
		templatesList.push(obj);
	}
}
else{
	if($("#giftVouchersuiFile").val()!=null && $("#giftVouchersuiFile").val() != undefined && $("#giftVouchersuiFile").val() != ""){
		obj={templateType:"giftVouchersui",fileId:$("#giftVouchersui_refId").val(),fileName:$("#giftVouchersuiFile").val(),status:"false"};
	//	console.log(obj);
		templatesList.push(obj);
	}

}

if($("#loyalityRewarding").prop('checked')){
	if($("#loyalityRewardingdataFile").val()!=null && $("#loyalityRewardingdataFile").val() != undefined && $("#loyalityRewardingdataFile").val() != ""){
		obj={templateType:"loyalityRewardingdata",fileId:$("#loyalityRewardingdata_refId").val(),fileName:$("#loyalityRewardingdataFile").val(),status:"true"};
	//	console.log(obj);
		templatesList.push(obj);
	}
}
else{
	if($("#loyalityRewardingdataFile").val()!=null && $("#loyalityRewardingdataFile").val() != undefined && $("#loyalityRewardingdataFile").val() != ""){
		obj={templateType:"loyalityRewardingdata",fileId:$("#loyalityRewardingdata_refId").val(),fileName:$("#loyalityRewardingdataFile").val(),status:"false"};
	//	console.log(obj);
		templatesList.push(obj);
	}

}
if($("#loyalityRewarding").prop('checked')){
	if($("#loyalityRewardinguiFile").val()!=null && $("#loyalityRewardinguiFile").val() != undefined && $("#loyalityRewardinguiFile").val() != ""){
		obj={templateType:"loyalityRewardingui",fileId:$("#loyalityRewardingui_refId").val(),fileName:$("#loyalityRewardinguiFile").val(),status:"true"};
	//	console.log(obj);
		templatesList.push(obj);
	}
}
else{
	if($("#loyalityRewardinguiFile").val()!=null && $("#loyalityRewardinguiFile").val() != undefined && $("#loyalityRewardinguiFile").val() != ""){
		obj={templateType:"loyalityRewardingui",fileId:$("#loyalityRewardingui_refId").val(),fileName:$("#loyalityRewardinguiFile").val(),status:"false"};
	//	console.log(obj);
		templatesList.push(obj);
	}
}


if($("#notificationGreetings").prop('checked')){
	if($("#notificationGreetingsdataFile").val()!=null && $("#notificationGreetingsdataFile").val() != undefined && $("#notificationGreetingsdataFile").val() != ""){
		obj={templateType:"notificationGreetingsdata",fileId:$("#notificationGreetingsdata_refId").val(),fileName:$("#notificationGreetingsdataFile").val(),status:"true"};
	//	console.log(obj);
		templatesList.push(obj);
	}
}
else{
	if($("#notificationGreetingsdataFile").val()!=null && $("#notificationGreetingsdataFile").val() != undefined && $("#notificationGreetingsdataFile").val() != ""){
		obj={templateType:"notificationGreetingsdata",fileId:$("#notificationGreetingsdata_refId").val(),fileName:$("#notificationGreetingsdataFile").val(),status:"false"};
	//	console.log(obj);
		templatesList.push(obj);
	}

}
if($("#notificationGreetings").prop('checked')){
	if($("#notificationGreetingsuiFile").val()!=null && $("#notificationGreetingsuiFile").val() != undefined && $("#notificationGreetingsuiFile").val() != ""){
		obj={templateType:"notificationGreetingsui",fileId:$("#notificationGreetingsui_refId").val(),fileName:$("#notificationGreetingsuiFile").val(),status:"true"};
	//	console.log(obj);
		templatesList.push(obj);
	}
}
else{
	if($("#notificationGreetingsuiFile").val()!=null && $("#notificationGreetingsuiFile").val() != undefined && $("#notificationGreetingsuiFile").val() != ""){
		obj={templateType:"notificationGreetingsui",fileId:$("#notificationGreetingsui_refId").val(),fileName:$("#notificationGreetingsuiFile").val(),status:"false"};
	//	console.log(obj);
		templatesList.push(obj);
	}

}
if($("#notificationCampaigns").prop('checked')){
	if($("#notificationGreetingsuiFile").val()!=null && $("#notificationGreetingsuiFile").val() != undefined && $("#notificationGreetingsuiFile").val() != ""){
		obj={templateType:"notificationCampaignsdata",fileId:$("#notificationCampaignsdata_refId").val(),fileName:$("#notificationGreetingsuiFile").val(),status:"true"};
	//	console.log(obj);
		templatesList.push(obj);
	}
}
else{
	if($("#notificationGreetingsuiFile").val()!=null && $("#notificationGreetingsuiFile").val() != undefined && $("#notificationGreetingsuiFile").val() != ""){
		obj={templateType:"notificationCampaignsdata",fileId:$("#notificationCampaignsdata_refId").val(),fileName:$("#notificationCampaignsdataFile").val(),status:"false"};
	//	console.log(obj);
		templatesList.push(obj);
	}

}
if($("#notificationCampaigns").prop('checked')){
	if($("#notificationCampaignsuiFile").val()!=null && $("#notificationCampaignsuiFile").val() != undefined && $("#notificationCampaignsuiFile").val() != ""){
		obj={templateType:"notificationCampaignsui",fileId:$("#notificationCampaignsui_refId").val(),fileName:$("#notificationCampaignsuiFile").val(),status:"true"};
	//	console.log(obj);
		templatesList.push(obj);
	}
}
else{
	if($("#notificationCampaignsuiFile").val()!=null && $("#notificationCampaignsuiFile").val() != undefined && $("#notificationCampaignsuiFile").val() != ""){
		obj={templateType:"notificationCampaignsui",fileId:$("#notificationCampaignsui_refId").val(),fileName:$("#notificationCampaignsuiFile").val(),status:"false"};
	//	console.log(obj);
		templatesList.push(obj);
	}

}

printSettings.templatesList=templatesList;
printSettings.enableRemotePrinting = $("#rmtPrint").val();
printSettings.allowDownLoading = $("#allowDL").val();
printSettings.allowSignature = $("#allowSign").val();
printSettings.formatSupported = $("#formatSupported").val();
	
		var formData = JSON.stringify(printSettings);
//		console.log(formData);
		var contextPath = $("#contextPath").val();
	   if(operation=="new"){
		   URL = contextPath + "/settings/createPrintSettings.do";
	   }
	   else if(operation=="edit"){
		   
		   URL = contextPath + "/settings/updatePrintSettings.do";
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



