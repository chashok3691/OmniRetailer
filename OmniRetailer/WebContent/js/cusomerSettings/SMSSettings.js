
var parameterList = [];



function enableFileBrowse(ele,id){
	try{
		debugger
//		$("#Error").html('');
		var contextPath = $("#contextPath").val();
		if (ele != '')
			id = $(ele).attr("id");
		if($("#"+id).prop('checked')){
			$("#"+id+"Btn").closest('div').removeClass('btn-primar');
			$("#"+id+"Btn").closest('div').addClass('btn-primary');
			$("#"+id+"Btn").removeAttr("disabled");

		}
		else{
			replaceWithNewFileType(id);
			$("#"+id+"Btn").closest('div').removeClass('btn-primary');
			$("#"+id+"Btn").closest('div').addClass('btn-primar');
			$("#"+id+"Btn").attr("disabled","disabled");
		}
		$("#"+id+"Img").closest('span').css("visibility","hidden");
		$("#"+id+"Img").attr("src",contextPath+"/images/circleWait.gif");
		//$("#"+id+"File").val("");
	}
	catch(e){}
}

function replaceWithNewFileType(id){
	try{

		var newFile = "<input id='"+id+"Btn' disabled='disabled' type='file' accept='.xml' onchange=addNameToTextBox('"+id+"'); class='upload' />";
		var $fileInput=$("#"+id+"Btn");
		var $fileCopy = $(newFile);
		$fileInput.replaceWith($fileCopy);
	}
	catch(e){}
}


//sku.js
function loadImageFileAsURL(id,ele) {
	try{


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
	}
	catch(e){}

}


function addNameToTextBox(id,ele){
	try{

		if($("#"+id+"Btn")[0].files[0] != undefined){
			$("#"+id+"File").val($("#"+id+"Btn")[0].files[0]['name']);
			loadImageFileAsURL(id,ele);



			//to allow only xml files
			if($("#"+id+"File").val() != ""){
				var filename=$("#"+id+"File").val();
				var ext=filename.split('.');
				if((ext[1] != 'xml') && (ext[1] != 'XML') && (ext[1] != 'XSL')&& (ext[1] != 'xsl')){
					$("#"+id+"File").val("");
					alert("Upload XML Files Only.");
				}
			}else{}




		}

		else
			$("#"+id+"File").val("");
	}
	catch(e)
	{

	}

}


$("#gateway").keydown(function(){
	$("#gatewayError").html("");
	$(".Error").html("");
}); 

$("#username").keydown(function(){
	$("#usernameError").html("");
	$(".Error").html("");
}); 

$("#password").keydown(function(){
	$("#passwordError").html("");
	$(".Error").html("");
}); 



function validateSMSSettingsForm(operation){
	try{
		var SMSSettings = {},templatesList = [];
		
		if($("#gateway").val().trim() == ""){
			$("#gatewayError").html("Enter Gateway");

		}

		validateGateWay();

		var enabled = false;
		if($('#enabled').is(':checked'))
		{
				enabled = true;
		}


		var obj={};	
		var file = "", fileName = "";

			/*if($("#salesOrderB2c").prop('checked')){
				file = $("#salesOrderB2c_refId").val();
				fileName = $("#salesOrderB2cFile").val()
			}else {
				file = "";
				fileName = "";
			}
			obj={templateType:"salesOrderB2c",fileId:file,fileName:fileName};
			templatesList.push(obj);
			
			
			if($("#salesOrderB2cui").prop('checked')){
				file = $("#salesOrderB2cui_refId").val();
				fileName = $("#salesOrderB2cuiFile").val()
			}else {
				file = "";
				fileName = "";
			}
			obj={templateType:"salesOrderB2cui",fileId:file,fileName:fileName};
			templatesList.push(obj);*/
			
			
			if($("#salesOrderB2c").prop('checked')){
				
				if($("#salesOrderB2cFile").val()!=null && $("#salesOrderB2cFile").val() != undefined && $("#salesOrderB2cFile").val() != ""){
					obj={templateType:"salesOrderB2c",fileId:$("#salesOrderB2c_refId").val(),fileName:$("#salesOrderB2cFile").val(),status:"true" };
	//				console.log(obj);
					templatesList.push(obj);
				}
				
			}
			else{
				
				if($("#salesOrderB2cFile").val()!=null && $("#salesOrderB2cFile").val()!=undefined  && $("#salesOrderB2cFile").val()!=""){
					obj={templateType:"salesOrderB2c",fileId:$("#salesOrderB2c_refId").val(),fileName:$("#salesOrderB2cFile").val(),status:"false"};
	//				console.log(obj);
					templatesList.push(obj);
				}
			
			}
			if($("#salesOrderB2cui").prop('checked')){
				
				if($("#salesOrderB2cuiFile").val()!=null && $("#salesOrderB2cuiFile").val()!=undefined && $("#salesOrderB2cuiFile").val()!=""){
					obj={templateType:"salesOrderB2cui",fileId:$("#salesOrderB2cui_refId").val(),fileName:$("#salesOrderB2cuiFile").val(),status:"true"};
	//				console.log(obj);
					templatesList.push(obj);
				}
				
			}
			else{

				if($("#salesOrderB2cuiFile").val()!=null && $("#salesOrderB2cuiFile").val()!=undefined && $("#salesOrderB2cuiFile").val()!=""){
					obj={templateType:"salesOrderB2cui",fileId:$("#salesOrderB2cui_refId").val(),fileName:$("#salesOrderB2cuiFile").val(),status:"false"};
	//				console.log(obj);
					templatesList.push(obj);
				}
			
			}
			

/*
		if($("#salesOrderDirectdata_refId").val() != ""){
			obj={templateType:"salesOrderDirectdata",fileId:$("#salesOrderDirectdata_refId").val(),fileName:$("#salesOrderDirectdataFile").val()};
//			console.log(obj);
			templatesList.push(obj);
		}if($("#salesOrderDirectui_refId").val() != ""){
			obj={templateType:"salesOrderDirectui",fileId:$("#salesOrderDirectui_refId").val(),fileName:$("#salesOrderDirectuiFile").val()};
//			console.log(obj);
			templatesList.push(obj);
		}

		if($("#salesOrderMobiledata_refId").val() != ""){
			obj={templateType:"salesOrderMobiledata",fileId:$("#salesOrderMobiledata_refId").val(),fileName:$("#salesOrderMobiledataFile").val()};
//			console.log(obj);
			templatesList.push(obj);
		}if($("#salesOrderMobileui_refId").val() != ""){
			obj={templateType:"salesOrderMobileui",fileId:$("#salesOrderMobileui_refId").val(),fileName:$("#salesOrderMobileuiFile").val()};
//			console.log(obj);
			templatesList.push(obj);
		}

		if($("#salesOrderTelephonicdata_refId").val() != ""){
			obj={templateType:"salesOrderTelephonicdata",fileId:$("#salesOrderTelephonicdata_refId").val(),fileName:$("#salesOrderTelephonicdataFile").val()};
//			console.log(obj);
			templatesList.push(obj);
		}if($("#salesOrderTelephonicui_refId").val() != ""){
			obj={templateType:"salesOrderTelephonicui",fileId:$("#salesOrderTelephonicui_refId").val(),fileName:$("#salesOrderTelephonicuiFile").val()};
//			console.log(obj);
			templatesList.push(obj);
		}*/
			
			/*if($("#billDetailsdata").prop('checked')){
				file = $("#billDetailsdata_refId").val();
				fileName = $("#billDetailsdataFile").val()
			}else {
				file = "";
				fileName = "";
			}
			obj={templateType:"billDetailsdata",fileId:file,fileName:fileName};
			templatesList.push(obj);
			
			if($("#billDetailscui").prop('checked')){
				file = $("#billDetailscui_refId").val();
				fileName = $("#billDetailscuiFile").val()
			}else {
				file = "";
				fileName = "";
			}
			obj={templateType:"billDetailscui",fileId:file,fileName:fileName};
			templatesList.push(obj);*/
			
			
		if($("#billDetailsdata").prop('checked')){
			if($("#billDetailsdataFile").val()!=null && $("#billDetailsdataFile").val()!=undefined && $("#billDetailsdataFile").val()!=""){
				obj={templateType:"billDetailsdata",fileId:$("#billDetailsdata_refId").val(),fileName:$("#billDetailsdataFile").val(),status:"true"};
	//			console.log(obj);
				templatesList.push(obj);
			}
		}
		else{

			if($("#billDetailsdataFile").val()!=null && $("#billDetailsdataFile").val()!=undefined && $("#billDetailsdataFile").val()!=""){
				obj={templateType:"billDetailsdata",fileId:$("#billDetailsdata_refId").val(),fileName:$("#billDetailsdataFile").val(),status:"false"};
	//			console.log(obj);
				templatesList.push(obj);
			}
		
		}
		
		
		
		if($("#billDetailscui").prop('checked')){
			if($("#billDetailscuiFile").val()!=null && $("#billDetailscuiFile").val()!=undefined && $("#billDetailscuiFile").val()!=""){
					obj={templateType:"billDetailscui",fileId:$("#billDetailscui_refId").val(),fileName:$("#billDetailscuiFile").val(),status:"true"};
		//			console.log(obj);
					templatesList.push(obj);
			}
		}
		else{

			if($("#billDetailscuiFile").val()!=null && $("#billDetailscuiFile").val()!=undefined && $("#billDetailscuiFile").val()!=""){
					obj={templateType:"billDetailscui",fileId:$("#billDetailscui_refId").val(),fileName:$("#billDetailscuiFile").val(),status:"false"};
		//			console.log(obj);
					templatesList.push(obj);
			}
		
		}


		if($("#stockReceiptdata").prop('checked')){
			if($("#stockReceiptdataFile").val()!=null && $("#stockReceiptdataFile").val()!=undefined && $("#stockReceiptdataFile").val()!=""){
				obj={templateType:"stockReceiptdata",fileId:$("#stockReceiptdata_refId").val(),fileName:$("#stockReceiptdataFile").val(),status:"true"};
	//			console.log(obj);
				templatesList.push(obj);
			}
		}
		else{

			if($("#stockReceiptdataFile").val()!=null && $("#stockReceiptdataFile").val()!=undefined && $("#stockReceiptdataFile").val()!=""){
				obj={templateType:"stockReceiptdata",fileId:$("#stockReceiptdata_refId").val(),fileName:$("#stockReceiptdataFile").val(),status:"false"};
	//			console.log(obj);
				templatesList.push(obj);
			}
		
		}

		if($("#whStockReceiptdata").prop('checked')){
			if($("#whStockReceiptdataFile").val()!=null && $("#whStockReceiptdataFile").val()!=undefined && $("#whStockReceiptdataFile").val()!=""){
				obj={templateType:"whStockReceiptdata",fileId:$("#whStockReceiptdata_refId").val(),fileName:$("#whStockReceiptdataFile").val(),status:"true"};
	//			console.log(obj);
				templatesList.push(obj);
			}
		}
		else{

			if($("#whStockReceiptdataFile").val()!=null && $("#whStockReceiptdataFile").val()!=undefined && $("#whStockReceiptdataFile").val()!=""){
				obj={templateType:"whStockReceiptdata",fileId:$("#whStockReceiptdata_refId").val(),fileName:$("#whStockReceiptdataFile").val(),status:"false"};
	//			console.log(obj);
				templatesList.push(obj);
			}
		
		}
		
		if($("#stockReceiptui").prop('checked')){
			if($("#stockReceiptuiFile").val()!=null && $("#stockReceiptuiFile").val()!=undefined && $("#stockReceiptuiFile").val()!=""){
				obj={templateType:"stockReceiptui",fileId:$("#stockReceiptui_refId").val(),fileName:$("#stockReceiptuiFile").val(),status:"true"};
	//			console.log(obj);
				templatesList.push(obj);
			}
		}
		else{

			if($("#stockReceiptuiFile").val()!=null && $("#stockReceiptuiFile").val()!=undefined && $("stockReceiptuiFile").val()!=""){
				obj={templateType:"stockReceiptui",fileId:$("#stockReceiptui_refId").val(),fileName:$("#stockReceiptuiFile").val(),status:"false"};
	//			console.log(obj);
				templatesList.push(obj);
			}
		
		}

		if($("#stockIssuedata").prop('checked')){
			if($("#stockIssuedataFile").val()!=null && $("#stockIssuedataFile").val()!=undefined && $("#stockIssuedataFile").val()!=""){
				obj={templateType:"stockIssuedata",fileId:$("#stockIssuedata_refId").val(),fileName:$("#stockIssuedataFile").val(),status:"true"};
	//			console.log(obj);
				templatesList.push(obj);
			}
			
		}
		else{

			if($("#stockIssuedataFile").val()!=null && $("#stockIssuedataFile").val()!=undefined && $("#stockIssuedataFile").val()!=""){
				obj={templateType:"stockIssuedata",fileId:$("#stockIssuedata_refId").val(),fileName:$("#stockIssuedataFile").val(),status:"false"};
	//			console.log(obj);
				templatesList.push(obj);
			}
			
		
		}
		if($("#whStockIssuedata").prop('checked')){
			if($("#whStockIssuedataFile").val()!=null && $("#whStockIssuedataFile").val()!=undefined&&$("#whStockIssuedataFile").val()!=""){
				obj={templateType:"whStockIssuedata",fileId:$("#whStockIssuedata_refId").val(),fileName:$("#whStockIssuedataFile").val(),status:"true"};
	//			console.log(obj);
				templatesList.push(obj);
			}
		}
		else{

			if($("#whStockIssuedataFile").val()!=null && $("#whStockIssuedataFile").val()!=undefined && $("#whStockIssuedataFile").val()!=""){
				obj={templateType:"whStockIssuedata",fileId:$("#whStockIssuedata_refId").val(),fileName:$("#whStockIssuedataFile").val(),status:"false"};
	//			console.log(obj);
				templatesList.push(obj);
			}
		
		}
		if($("#stockIssueui").prop('checked')){
			if($("#stockIssueuiFile").val()!=null && $("#stockIssueuiFile").val()!=undefined && $("#stockIssueuiFile").val()!=""){
				obj={templateType:"stockIssueui",fileId:$("#stockIssueui_refId").val(),fileName:$("#stockIssueuiFile").val(),status:"true"};
	//			console.log(obj);
				templatesList.push(obj);
			}
		}
		else{

			if($("#stockIssueuiFile").val()!=null && $("#stockIssueuiFile").val()!=undefined && $("#stockIssueuiFile").val()!=""){
				obj={templateType:"stockIssueui",fileId:$("#stockIssueui_refId").val(),fileName:$("#stockIssueuiFile").val(),status:"false"};
	//			console.log(obj);
				templatesList.push(obj);
			}
		
		}


		if($("#stockRequestdata").prop('checked')){
			if($("#stockRequestdataFile").val()!=null && $("#stockRequestdataFile").val()!=undefined && $("#stockRequestdataFile").val()!=""){
				obj={templateType:"stockRequestdata",fileId:$("#stockRequestdata_refId").val(),fileName:$("#stockRequestdataFile").val(),status:"true"};
	//			console.log(obj);
				templatesList.push(obj);
			}
		}
		else{

			if($("#stockRequestdataFile").val()!=null && $("#stockRequestdataFile").val()!=undefined && $("#stockRequestdataFile").val()!=""){
				obj={templateType:"stockRequestdata",fileId:$("#stockRequestdata_refId").val(),fileName:$("#stockRequestdataFile").val(),status:"false"};
	//			console.log(obj);
				templatesList.push(obj);
			}
		
		}
		if($("#whStockRequestdata").prop('checked')){
			if($("#whStockRequestdataFile").val()!=null && $("#whStockRequestdataFile").val()!=undefined && $("#whStockRequestdataFile").val()!=""){
				obj={templateType:"whStockRequestdata",fileId:$("#whStockRequestdata_refId").val(),fileName:$("#whStockRequestdataFile").val(),status:"true"};
	//			console.log(obj);
				templatesList.push(obj);
			}
		}else{

			if($("#whStockRequestdataFile").val()!=null && $("#whStockRequestdataFile").val()!=undefined && $("#whStockRequestdataFile").val()!=""){
				obj={templateType:"whStockRequestdata",fileId:$("#whStockRequestdata_refId").val(),fileName:$("#whStockRequestdataFile").val(),status:"false"};
	//			console.log(obj);
				templatesList.push(obj);
			}
		
		}
		
		
		
		if($("#shipmentReturndata").prop('checked'))
		{
			if($("#shipmentReturndataFile").val()!=null && $("#shipmentReturndataFile").val()!=undefined && $("#shipmentReturndataFile").val()!=""){
				obj={templateType:"shipmentReturndata",fileId:$("#shipmentReturndata_refId").val(),fileName:$("#shipmentReturndataFile").val(),status:"true"};
				templatesList.push(obj);
			}
		}
		else{

			if($("#shipmentReturndataFile").val()!=null && $("#shipmentReturndataFile").val()!=undefined && $("#shipmentReturndataFile").val()!=""){
				obj={templateType:"shipmentReturndata",fileId:$("#shipmentReturndata_refId").val(),fileName:$("#shipmentReturndataFile").val(),status:"false"};
				templatesList.push(obj);
			}
		
		}
		if($("#stockRequestui").prop('checked')){
			if($("#stockRequestuiFile").val()!=null && $("#stockRequestuiFile").val()!=undefined && $("#stockRequestuiFile").val()!=""){
				obj={templateType:"stockRequestui",fileId:$("#stockRequestui_refId").val(),fileName:$("#stockRequestuiFile").val(),status:"true"};
	//			console.log(obj);
				templatesList.push(obj);
			}
		}
		else{

			if($("#stockRequestuiFile").val()!=null && $("#stockRequestuiFile").val()!=undefined && $("#stockRequestuiFile").val()!=""){
				obj={templateType:"stockRequestui",fileId:$("#stockRequestui_refId").val(),fileName:$("#stockRequestuiFile").val(),status:"false"};
	//			console.log(obj);
				templatesList.push(obj);
			}
		
		}

		if($("#stockReturndata").prop('checked')){
			if($("#stockReturndataFile").val()!=null && $("#stockReturndataFile").val()!=undefined && $("#stockReturndataFile").val()!=""){
				obj={templateType:"stockReturndata",fileId:$("#stockReturndata_refId").val(),fileName:$("#stockReturndataFile").val(),status:"true"};
	//			console.log(obj);
				templatesList.push(obj);
			}
		}
		else{

			if($("#stockReturndataFile").val()!=null && $("#stockReturndataFile").val()!=undefined && $("#stockReturndataFile").val()!=""){
				obj={templateType:"stockReturndata",fileId:$("#stockReturndata_refId").val(),fileName:$("#stockReturndataFile").val(),status:"false"};
	//			console.log(obj);
				templatesList.push(obj);
			}
		
		}
		if($("#stockReturnui").prop('checked')){
			if($("#stockReturnuiFile").val()!=null && $("#stockReturnuiFile").val()!=undefined && $("#stockReturnuiFile").val()!=""){
				obj={templateType:"stockReturnui",fileId:$("#stockReturnui_refId").val(),fileName:$("#stockReturnuiFile").val(),status:"true"};
	//			console.log(obj);
				templatesList.push(obj);
			}
		}
		else{

			if($("#stockReturnuiFile").val()!=null && $("#stockReturnuiFile").val()!=undefined && $("#stockReturnuiFile").val()!=""){
				obj={templateType:"stockReturnui",fileId:$("#stockReturnui_refId").val(),fileName:$("#stockReturnuiFile").val(),status:"false"};
	//			console.log(obj);
				templatesList.push(obj);
			}
		
		}
		
		if($("#whStockReturndata").prop('checked')){
			if($("#whStockReturndataFile").val()!=null && $("#whStockReturndataFile").val()!=undefined && $("#whStockReturndataFile").val()!=""){
				obj={templateType:"whStockReturndata",fileId:$("#whStockReturndata_refId").val(),fileName:$("#whStockReturndataFile").val(),status:"true"};
	//			console.log(obj);
				templatesList.push(obj);
			}
		}
		else{

			if($("#whStockReturndataFile").val()!=null && $("#whStockReturndataFile").val()!=undefined && $("#whStockReturndataFile").val()!=""){
				obj={templateType:"whStockReturndata",fileId:$("#whStockReturndata_refId").val(),fileName:$("#whStockReturndataFile").val(),status:"false"};
	//			console.log(obj);
				templatesList.push(obj);
			}
		
		}
		if($("#inventoryAlertsdata").prop('checked')){
			
			if($("#inventoryAlertsdataFile").val()!=null && $("#inventoryAlertsdataFile").val()!=undefined && $("#inventoryAlertsdataFile").val()!=""){
				obj={templateType:"inventoryAlertsdata",fileId:$("#inventoryAlertsdata_refId").val(),fileName:$("#inventoryAlertsdataFile").val(),status:"true"};
	//			console.log(obj);
				templatesList.push(obj);
			}
		}
		else{

			if($("#inventoryAlertsdataFile").val()!=null && $("#inventoryAlertsdataFile").val()!=undefined && $("#inventoryAlertsdataFile").val()!=""){
				obj={templateType:"inventoryAlertsdata",fileId:$("#inventoryAlertsdata_refId").val(),fileName:$("#inventoryAlertsdataFile").val(),status:"false"};
	//			console.log(obj);
				templatesList.push(obj);
			}
		
		}
		
		if($("#inventoryAlertsui").prop('checked')){
			if($("#inventoryAlertsuiFile").val()!=null && $("#inventoryAlertsuiFile").val()!=undefined && $("#inventoryAlertsuiFile").val()!=""){
				obj={templateType:"inventoryAlertsui",fileId:$("#inventoryAlertsui_refId").val(),fileName:$("#inventoryAlertsuiFile").val(),status:"true"};
	//			console.log(obj);
				templatesList.push(obj);
			}
		}
		else{

			if($("#inventoryAlertsuiFile").val()!=null && $("#inventoryAlertsuiFile").val()!=undefined && $("#inventoryAlertsuiFile").val()!=""){
				obj={templateType:"inventoryAlertsui",fileId:$("#inventoryAlertsui_refId").val(),fileName:$("#inventoryAlertsuiFile").val(),status:"false"};
	//			console.log(obj);
				templatesList.push(obj);
			}
		
		}


		if($("#stockVerificationdata").prop('checked')){
			if($("#stockVerificationdataFile").val()!=null && $("#stockVerificationdataFile").val()!=undefined && $("#stockVerificationdataFile").val()!=""){
				obj={templateType:"stockVerificationdata",fileId:$("#stockVerificationdata_refId").val(),fileName:$("#stockVerificationdataFile").val(),status:"true"};
	//			console.log(obj);
				templatesList.push(obj);
			}
		}
		else{

			if($("#stockVerificationdataFile").val()!=null &&  $("#stockVerificationdataFile").val()!=undefined && $("#stockVerificationdataFile").val()!=""){
				obj={templateType:"stockVerificationdata",fileId:$("#stockVerificationdata_refId").val(),fileName:$("#stockVerificationdataFile").val(),status:"false"};
	//			console.log(obj);
				templatesList.push(obj);
			}
		
		}
		if($("#stockVerificationui").prop('checked')){
			if($("#stockVerificationuiFile").val()!=null && $("#stockVerificationuiFile").val()!=undefined && $("#stockVerificationuiFile").val()!=""){
				obj={templateType:"stockVerificationui",fileId:$("#stockVerificationui_refId").val(),fileName:$("#stockVerificationuiFile").val(),status:"true"};
	//			console.log(obj);
				templatesList.push(obj);
			}
		
		}
		else{

			if($("#stockVerificationuiFile").val()!=null && $("#stockVerificationuiFile").val()!=undefined && $("#stockVerificationuiFile").val()!=""){
				obj={templateType:"stockVerificationui",fileId:$("#stockVerificationui_refId").val(),fileName:$("#stockVerificationuiFile").val(),status:"false"};
	//			console.log(obj);
				templatesList.push(obj);
			}
		
		
		}


		if($("#customerRegistrationdata").prop('checked')){
			if($("#customerRegistrationdataFile").val()!=null && $("#customerRegistrationdataFile").val()!=undefined && $("#customerRegistrationdataFile").val()!=""){
				obj={templateType:"customerRegistrationdata",fileId:$("#customerRegistrationdata_refId").val(),fileName:$("#customerRegistrationdataFile").val(),status:"true"};
	//			console.log(obj);
				templatesList.push(obj);
			}
		}
		else{

			if($("#customerRegistrationdataFile").val()!=null && $("#customerRegistrationdataFile").val()!=undefined && $("#customerRegistrationdataFile").val()!=""){
				obj={templateType:"customerRegistrationdata",fileId:$("#customerRegistrationdata_refId").val(),fileName:$("#customerRegistrationdataFile").val(),status:"false"};
	//			console.log(obj);
				templatesList.push(obj);
			}
		
		}
		if($("#customerRegistrationui").prop('checked')){
			if($("#customerRegistrationuiFile").val()!=null && $("#customerRegistrationuiFile").val()!=undefined && $("#customerRegistrationuiFile").val()!=""){
				obj={templateType:"customerRegistrationui",fileId:$("#customerRegistrationui_refId").val(),fileName:$("#customerRegistrationuiFile").val(),status:"true"};
	//			console.log(obj);
				templatesList.push(obj);
			}
		}
		else{

			if($("#customerRegistrationuiFile").val()!=null && $("#customerRegistrationuiFile").val()!=undefined && $("#customerRegistrationuiFile").val()!=""){
				obj={templateType:"customerRegistrationui",fileId:$("#customerRegistrationui_refId").val(),fileName:$("#customerRegistrationuiFile").val(),status:"false"};
	//			console.log(obj);
				templatesList.push(obj);
			}
		
		}
			debugger
		if($("#customerUpdatedata").prop('checked')){
			if($("#customerUpdatedataFile").val()!=null && $("#customerUpdatedataFile").val()!=undefined && $("#customerUpdatedataFile").val()!=""){
				obj={templateType:"customerUpdatedata",fileId:$("#customerUpdatedata_refId").val(),fileName:$("#customerUpdatedataFile").val(),status:"true"};
	//			console.log(obj);
				templatesList.push(obj);
			}
		}
		else{

			if($("#customerUpdatedataFile").val()!=null && $("#customerUpdatedataFile").val()!=undefined && $("#customerUpdatedataFile").val()!=""){
				obj={templateType:"customerUpdatedata",fileId:$("#customerUpdatedata_refId").val(),fileName:$("#customerUpdatedataFile").val(),status:"false"};
	//			console.log(obj);
				templatesList.push(obj);
			}
		
		}
		
		if($("#customerUpdateui").prop('checked')){
			if($("#customerUpdateuiFile").val()!=null && $("#customerUpdateuiFile").val()!=undefined && $("#customerUpdateuiFile").val()!=""){
			obj={templateType:"customerUpdateui",fileId:$("#customerUpdateui_refId").val(),fileName:$("#customerUpdateuiFile").val(),status:"true"};
//			console.log(obj);
			templatesList.push(obj);
			}
		}
		else{

			if($("#customerUpdateuiFile").val()!=null && $("#customerUpdateuiFile").val()!=undefined && $("#customerUpdateuiFile").val()!=""){
			obj={templateType:"customerUpdateui",fileId:$("#customerUpdateui_refId").val(),fileName:$("#customerUpdateuiFile").val(),status:"false"};
//			console.log(obj);
			templatesList.push(obj);
			}
		
		}

		if($("#loginPassworddata").prop('checked')){
			if($("#loginPassworddataFile").val()!=null && $("#loginPassworddataFile").val()!=undefined && $("#loginPassworddataFile").val()!=""){
				obj={templateType:"loginPassworddata",fileId:$("#loginPassworddata_refId").val(),fileName:$("#loginPassworddataFile").val(),status:"true"};
				templatesList.push(obj);
			}
		}
		else{

			if($("#loginPassworddataFile").val()!=null && $("#loginPassworddataFile").val()!=undefined && $("#loginPassworddataFile").val()!=""){
				obj={templateType:"loginPassworddata",fileId:$("#loginPassworddata_refId").val(),fileName:$("#loginPassworddataFile").val(),status:"false"};
				templatesList.push(obj);
			}
		
		}
		/*if($("#loginPasswordui_refId").val() != ""){
			obj={templateType:"loginPasswordui",fileId:$("#loginPasswordui_refId").val(),fileName:$("#loginPassworduiFile").val()};
			templatesList.push(obj);
		}*/
		
		if($("#customerOTPdata").prop('checked')){
			if($("#customerOTPdataFile").val()!=null && $("#customerOTPdataFile").val()!=undefined && $("#customerOTPdataFile").val()!=""){
				obj={templateType:"customerOTPdata",fileId:$("#customerOTPdata_refId").val(),fileName:$("#customerOTPdataFile").val(),status:"true"};
				templatesList.push(obj);
			}
		}else{

			if($("#customerOTPdataFile").val()!=null && $("#customerOTPdataFile").val()!=undefined && $("#customerOTPdataFile").val()!=""){
				obj={templateType:"customerOTPdata",fileId:$("#customerOTPdata_refId").val(),fileName:$("#customerOTPdataFile").val(),status:"false"};
				templatesList.push(obj);
			}
		
		}
		
		if($("#customerActivationdata").prop('checked')){
			if($("#customerActivationdataFile").val()!=null && $("#customerActivationdataFile").val()!=undefined && $("#customerActivationdataFile").val()!=""){
				obj={templateType:"customerActivationdata",fileId:$("#customerActivationdata_refId").val(),fileName:$("#customerActivationdataFile").val(),status:"true"};
				templatesList.push(obj);
			}
		}
		else{

			if($("#customerActivationdataFile").val()!=null && $("#customerActivationdataFile").val()!=undefined && $("#customerActivationdataFile").val()!=""){
				obj={templateType:"customerActivationdata",fileId:$("#customerActivationdata_refId").val(),fileName:$("#customerActivationdataFile").val(),status:"false"};
				templatesList.push(obj);
			}
		
		}
		

		if($("#purchaseRequestdata").prop('checked')){
			if($("#purchaseRequestdataFile").val()!=null && $("#purchaseRequestdataFile").val()!=undefined && $("#purchaseRequestdataFile").val()!=""){
				obj={templateType:"purchaseRequestdata",fileId:$("#purchaseRequestdata_refId").val(),fileName:$("#purchaseRequestdataFile").val(),status:"true"};
	//			console.log(obj);
				templatesList.push(obj);
			}
		}
		else{
			

			if($("#purchaseRequestdataFile").val()!=null && $("#purchaseRequestdataFile").val()!=undefined && $("#purchaseRequestdataFile").val()!=""){
				obj={templateType:"purchaseRequestdata",fileId:$("#purchaseRequestdata_refId").val(),fileName:$("#purchaseRequestdataFile").val(),status:"false"};
	//			console.log(obj);
				templatesList.push(obj);
			}
		
		}
		if($("#purchaseRequestui").prop('checked')){
			if($("#purchaseRequestuiFile").val()!=null && $("#purchaseRequestuiFile").val()!=undefined && $("#purchaseRequestuiFile").val()!=""){
				obj={templateType:"purchaseRequestui",fileId:$("#purchaseRequestui_refId").val(),fileName:$("#purchaseRequestuiFile").val(),status:"true"};
	//			console.log(obj);
				templatesList.push(obj);
			}
		}
		else{

			if($("#purchaseRequestuiFile").val()!=null && $("#purchaseRequestuiFile").val()!=undefined && $("#purchaseRequestuiFile").val()!=""){
				obj={templateType:"purchaseRequestui",fileId:$("#purchaseRequestui_refId").val(),fileName:$("#purchaseRequestuiFile").val(),status:"false"};
	//			console.log(obj);
				templatesList.push(obj);
			}
		
		}
		if($("#purchaseOrderdata").prop('checked')){
			if($("#purchaseOrderdataFile").val()!=null && $("#purchaseOrderdataFile").val()!=undefined && $("#purchaseOrderdataFile").val()!=""){
				obj={templateType:"purchaseOrderdata",fileId:$("#purchaseOrderdata_refId").val(),fileName:$("#purchaseOrderdataFile").val(),status:"true"};
	//			console.log(obj);
				templatesList.push(obj);
			}
		}
		else{

			if($("#purchaseOrderdataFile").val()!=null && $("#purchaseOrderdataFile").val()!=undefined && $("#purchaseOrderdataFile").val()!=""){
				obj={templateType:"purchaseOrderdata",fileId:$("#purchaseOrderdata_refId").val(),fileName:$("#purchaseOrderdataFile").val(),status:"false"};
	//			console.log(obj);
				templatesList.push(obj);
			}
		
		}
		if($("#purchaseOrderui").prop('checked')){
			if($("#purchaseOrderuiFile").val()!=null && $("#purchaseOrderuiFile").val()==undefined && $("#purchaseOrderuiFile").val()!=""){
				obj={templateType:"purchaseOrderui",fileId:$("#purchaseOrderui_refId").val(),fileName:$("#purchaseOrderuiFile").val(),status:"true"};
	//			console.log(obj);
				templatesList.push(obj);
			}
		}
		else{

			if($("#purchaseOrderuiFile").val()!=null && $("#purchaseOrderuiFile").val()!=undefined && $("#purchaseOrderuiFile").val()!=""){
				obj={templateType:"purchaseOrderui",fileId:$("#purchaseOrderui_refId").val(),fileName:$("#purchaseOrderuiFile").val(),status:"false"};
	//			console.log(obj);
				templatesList.push(obj);
			}
		
		}

		if($("#shippmentNotedata").prop('checked')){
			if($("#shippmentNotedataFile").val()!=null && $("#shippmentNotedataFile").val()!=undefined && $("#shippmentNotedataFile").val()!=""){
				obj={templateType:"shippmentNotedata",fileId:$("#shippmentNotedata_refId").val(),fileName:$("#shippmentNotedataFile").val(),status:"true"};
	//			console.log(obj);
				templatesList.push(obj);
			}
		}
		else{

			if($("#shippmentNotedataFile").val()!=null && $("#shippmentNotedataFile").val()!=undefined && $("#shippmentNotedataFile").val()!=""){
				obj={templateType:"shippmentNotedata",fileId:$("#shippmentNotedata_refId").val(),fileName:$("#shippmentNotedataFile").val(),status:"false"};
	//			console.log(obj);
				templatesList.push(obj);
			}
		
		}
		if($("#shippmentNoteui").prop('checked')){
			if($("#shippmentNoteuiFile").val()!=null && $("#shippmentNoteuiFile").val()!=undefined && $("#shippmentNoteuiFile").val()!=""){
				obj={templateType:"shippmentNoteui",fileId:$("#shippmentNoteui_refId").val(),fileName:$("#shippmentNoteuiFile").val(),status:"true"};
	//			console.log(obj);
				templatesList.push(obj);
			}
		}
		else{

			if($("#shippmentNoteuiFile").val()!=null && $("#shippmentNoteuiFile").val()!=undefined && $("#shippmentNoteuiFile").val()!=""){
				obj={templateType:"shippmentNoteui",fileId:$("#shippmentNoteui_refId").val(),fileName:$("#shippmentNoteuiFile").val(),status:"false"};
	//			console.log(obj);
				templatesList.push(obj);
			}
		
		}

		if($("#shippmentReceiptdata").prop('checked')){
			if($("#shippmentReceiptdataFile").val()!=null && $("#shippmentReceiptdataFile").val()!=undefined && $("#shippmentReceiptdataFile").val()!=""){
				obj={templateType:"shippmentReceiptdata",fileId:$("#shippmentReceiptdata_refId").val(),fileName:$("#shippmentReceiptdataFile").val(),status:"true"};
	//			console.log(obj);
				templatesList.push(obj);
			}
		}
		else{

			if($("#shippmentReceiptdataFile").val()!=null && $("#shippmentReceiptdataFile").val()!=undefined && $("#shippmentReceiptdataFile").val()!=""){
				obj={templateType:"shippmentReceiptdata",fileId:$("#shippmentReceiptdata_refId").val(),fileName:$("#shippmentReceiptdataFile").val(),status:"false"};
	//			console.log(obj);
				templatesList.push(obj);
			}
		
		}
		if($("#whShipmentReceiptdata").prop('checked')){
			if($("#whShipmentReceiptdataFile").val()!=null && $("#whShipmentReceiptdataFile").val()!=undefined && $("#whShipmentReceiptdataFile").val()!=""){
				obj={templateType:"whShipmentReceiptdata",fileId:$("#whShipmentReceiptdata_refId").val(),fileName:$("#whShipmentReceiptdataFile").val(),status:"true"};
	//			console.log(obj);
				templatesList.push(obj);
			}
		}
		else{

			if($("#whShipmentReceiptdataFile").val()!=null && $("#whShipmentReceiptdataFile").val()!=undefined && $("#whShipmentReceiptdataFile").val()!=""){
				obj={templateType:"whShipmentReceiptdata",fileId:$("#whShipmentReceiptdata_refId").val(),fileName:$("#whShipmentReceiptdataFile").val(),status:"false"};
	//			console.log(obj);
				templatesList.push(obj);
			}
		
		}
		if($("#shippmentReceiptui").prop('checked')){
			
			if($("#shippmentReceiptuiFile").val()!=null && $("#shippmentReceiptuiFile").val()!=undefined && $("#shippmentReceiptuiFile").val()!=""){
			obj={templateType:"shippmentReceiptui",fileId:$("#shippmentReceiptui_refId").val(),fileName:$("#shippmentReceiptuiFile").val(),status:"true"};
//			console.log(obj);
			templatesList.push(obj);
			}
		}
		else{

			if($("#shippmentReceiptuiFile").val()!=null && $("#shippmentReceiptuiFile").val()!=undefined && $("#shippmentReceiptuiFile").val()!=""){
			obj={templateType:"shippmentReceiptui",fileId:$("#shippmentReceiptui_refId").val(),fileName:$("#shippmentReceiptuiFile").val(),status:"false"};
//			console.log(obj);
			templatesList.push(obj);
			}
		
		}
		if($("#shippmentInspectiondata").prop('checked')){
			if($("#shippmentInspectiondataFile").val()!=null && $("#shippmentInspectiondataFile").val()!=undefined && $("#shippmentInspectiondataFile").val()!=""){
				obj={templateType:"shippmentInspectiondata",fileId:$("#shippmentInspectiondata_refId").val(),fileName:$("#shippmentInspectiondataFile").val(),status:"true"};
	//			console.log(obj);
				templatesList.push(obj);
			}
		}
		else{

			if($("#shippmentInspectiondataFile").val()!=null && $("#shippmentInspectiondataFile").val()!=undefined && $("#shippmentInspectiondataFile").val()!=""){
				obj={templateType:"shippmentInspectiondata",fileId:$("#shippmentInspectiondata_refId").val(),fileName:$("#shippmentInspectiondataFile").val(),status:"false"};
	//			console.log(obj);
				templatesList.push(obj);
			}
		
		}
		if($("#shippmentInspectionui").prop('checked')){
			if($("#shippmentInspectionuiFile").val()!=null && $("#shippmentInspectionuiFile").val()!=undefined && $("#shippmentInspectionuiFile").val()!=""){
				obj={templateType:"shippmentInspectionui",fileId:$("#shippmentInspectionui_refId").val(),fileName:$("#shippmentInspectionuiFile").val(),status:"true"};
	//			console.log(obj);
				templatesList.push(obj);
			}
		}
		else{

			if($("#shippmentInspectionuiFile").val()!=null && $("#shippmentInspectionuiFile").val()!=undefined && $("#shippmentInspectionuiFile").val()!=""){
				obj={templateType:"shippmentInspectionui",fileId:$("#shippmentInspectionui_refId").val(),fileName:$("#shippmentInspectionuiFile").val(),status:"false"};
	//			console.log(obj);
				templatesList.push(obj);
			}
		
		}

		if($("#invoicingdata").prop('checked')){
			if($("#invoicingdataFile").val()!=null && $("#invoicingdataFile").val()!=undefined && $("#invoicingdataFile").val()!=""){
				obj={templateType:"invoicingdata",fileId:$("#invoicingdata_refId").val(),fileName:$("#invoicingdataFile").val(),status:"true"};
	//			console.log(obj);
				templatesList.push(obj);
			}
		}
		else{

			if($("#invoicingdataFile").val()!=null && $("#invoicingdataFile").val()!=undefined && $("#invoicingdataFile").val()!=""){
				obj={templateType:"invoicingdata",fileId:$("#invoicingdata_refId").val(),fileName:$("#invoicingdataFile").val(),status:"false"};
	//			console.log(obj);
				templatesList.push(obj);
			}
		
		}
		if($("#invoicingui").prop('checked')){
			if($("#invoicinguiFile").val()!=null && $("#invoicinguiFile").val()!=undefined && $("#invoicinguiFile").val()!=""){
				obj={templateType:"invoicingui",fileId:$("#invoicingui_refId").val(),fileName:$("#invoicinguiFile").val(),status:"true"};
	//			console.log(obj);
				templatesList.push(obj);
			}
		}
		else{

			if($("#invoicinguiFile").val()!=null && $("#invoicinguiFile").val()!=undefined && $("#invoicinguiFile").val()!=""){
				obj={templateType:"invoicingui",fileId:$("#invoicingui_refId").val(),fileName:$("#invoicinguiFile").val(),status:"false"};
	//			console.log(obj);
				templatesList.push(obj);
			}
		
		}



		if($("#paymentsdata").prop('checked')){
			if($("#paymentsdataFile").val()!=null && $("#paymentsdataFile").val()!=undefined && $("#paymentsdataFile").val()!=""){
				obj={templateType:"paymentsdata",fileId:$("#paymentsdata_refId").val(),fileName:$("#paymentsdataFile").val(),status:"true"};
	//			console.log(obj);
				templatesList.push(obj);
			}
		}
		
		else{

			if($("#paymentsdataFile").val()!=null && $("#paymentsdataFile").val()!=undefined && $("#paymentsdataFile").val()!=""){
				obj={templateType:"paymentsdata",fileId:$("#paymentsdata_refId").val(),fileName:$("#paymentsdataFile").val(),status:"false"};
	//			console.log(obj);
				templatesList.push(obj);
			}
		
		}
		if($("#paymentsui").prop('checked')){
			if($("#paymentsuiFile").val()!=null && $("#paymentsuiFile").val()!=undefined && $("#paymentsuiFile").val()!=""){
				obj={templateType:"paymentsui",fileId:$("#paymentsui_refId").val(),fileName:$("#paymentsuiFile").val(),status:"true"};
	//			console.log(obj);
				templatesList.push(obj);
			}
		}
		else{

			if($("#paymentsuiFile").val()!=null && $("#paymentsuiFile").val()!=undefined && $("#paymentsuiFile").val()!=""){
				obj={templateType:"paymentsui",fileId:$("#paymentsui_refId").val(),fileName:$("#paymentsuiFile").val(),status:"false"};
	//			console.log(obj);
				templatesList.push(obj);
			}
		
		}

		if($("#customerComplaintsdata").prop('checked')){
			if($("#customerComplaintsdataFile").val()!=null && $("#customerComplaintsdataFile").val()!=undefined && $("#customerComplaintsdataFile").val()!=""){
				obj={templateType:"customerComplaintsdata",fileId:$("#customerComplaintsdata_refId").val(),fileName:$("#customerComplaintsdataFile").val(),status:"true"};
	//			console.log(obj);
				templatesList.push(obj);
			}
		}
		else{

			if($("#customerComplaintsdataFile").val()!=null && $("#customerComplaintsdataFile").val()!=undefined && $("#customerComplaintsdataFile").val()!=""){
				obj={templateType:"customerComplaintsdata",fileId:$("#customerComplaintsdata_refId").val(),fileName:$("#customerComplaintsdataFile").val(),status:"false"};
	//			console.log(obj);
				templatesList.push(obj);
			}
		
		}
		
		if($("#customerComplaintsui").prop('checked')){
			if($("#customerComplaintsuiFile").val()!=null && $("#customerComplaintsuiFile").val()!=undefined && $("#customerComplaintsuiFile").val()!=""){
				obj={templateType:"customerComplaintsui",fileId:$("#customerComplaintsui_refId").val(),fileName:$("#customerComplaintsuiFile").val(),status:"true"};
	//			console.log(obj);
				templatesList.push(obj);
			}
		}
		else{

			if($("#customerComplaintsuiFile").val()!=null && $("#customerComplaintsuiFile").val()!=undefined && $("#customerComplaintsuiFile").val()!=""){
				obj={templateType:"customerComplaintsui",fileId:$("#customerComplaintsui_refId").val(),fileName:$("#customerComplaintsuiFile").val(),status:"false"};
	//			console.log(obj);
				templatesList.push(obj);
			}
		
		}

		if($("#customerFeedbackdata").prop('checked')){
			if($("#customerFeedbackdataFile").val()!=null && $("#customerFeedbackdataFile").val()!=undefined && $("#customerFeedbackdataFile").val()!=""){
				obj={templateType:"customerFeedbackdata",fileId:$("#customerFeedbackdata_refId").val(),fileName:$("#customerFeedbackdataFile").val(),status:"true"};
	//			console.log(obj);
				templatesList.push(obj);
			}
		}
		else{

			if($("#customerFeedbackdataFile").val()!=null && $("#customerFeedbackdataFile").val()!=undefined && $("#customerFeedbackdataFile").val()!=""){
				obj={templateType:"customerFeedbackdata",fileId:$("#customerFeedbackdata_refId").val(),fileName:$("#customerFeedbackdataFile").val(),status:"false"};
	//			console.log(obj);
				templatesList.push(obj);
			}
		
		}
		if($("#customerFeedbackui").prop('checked')){
			if($("#customerFeedbackuiFile").val()!=null && $("#customerFeedbackuiFile").val()!=undefined && $("#customerFeedbackuiFile").val()!=""){
				obj={templateType:"customerFeedbackui",fileId:$("#customerFeedbackui_refId").val(),fileName:$("#customerFeedbackuiFile").val(),status:"true"};
	//			console.log(obj);
				templatesList.push(obj);
			}
		}
		else{

			if($("#customerFeedbackuiFile").val()!=null && $("#customerFeedbackuiFile").val()!=undefined && $("#customerFeedbackuiFile").val()!=""){
				obj={templateType:"customerFeedbackui",fileId:$("#customerFeedbackui_refId").val(),fileName:$("#customerFeedbackuiFile").val(),status:"false"};
	//			console.log(obj);
				templatesList.push(obj);
			}
		
		}
		if($("#giftCouponsdata").prop('checked')){
			if($("#giftCouponsdataFile").val()!=null && $("#giftCouponsdataFile").val()!=undefined && $("#giftCouponsdataFile").val()!=""){
				obj={templateType:"giftCouponsdata",fileId:$("#giftCouponsdata_refId").val(),fileName:$("#giftCouponsdataFile").val(),status:"true"};
	//			console.log(obj);
				templatesList.push(obj);
			}
		}
		else{

			if($("#giftCouponsdataFile").val()!=null && $("#giftCouponsdataFile").val()!=undefined && $("#giftCouponsdataFile").val()!=""){
				obj={templateType:"giftCouponsdata",fileId:$("#giftCouponsdata_refId").val(),fileName:$("#giftCouponsdataFile").val(),status:"false"};
	//			console.log(obj);
				templatesList.push(obj);
			}
		
		}
		
		if($("#giftCouponsui").prop('checked')){
			if($("#giftCouponsuiFile").val()!=null && $("#giftCouponsuiFile").val()!=undefined && $("#giftCouponsuiFile").val()!=""){
				obj={templateType:"giftCouponsui",fileId:$("#giftCouponsui_refId").val(),fileName:$("#giftCouponsuiFile").val(),status:"true"};
	//			console.log(obj);
				templatesList.push(obj);
			}
		}
		else{

			if($("#giftCouponsuiFile").val()!=null && $("#giftCouponsuiFile").val()!=undefined && $("#giftCouponsuiFile").val()!=""){
				obj={templateType:"giftCouponsui",fileId:$("#giftCouponsui_refId").val(),fileName:$("#giftCouponsuiFile").val(),status:"false"};
	//			console.log(obj);
				templatesList.push(obj);
			}
		
		}
		if($("#giftVouchersdata").prop('checked')){
			if($("#giftVouchersdataFile").val()!=null && $("#giftVouchersdataFile").val()!=undefined && $("#giftVouchersdataFile").val()!=""){
				obj={templateType:"giftVouchersdata",fileId:$("#giftVouchersdata_refId").val(),fileName:$("#giftVouchersdataFile").val(),status:"true"};
	//			console.log(obj);
				templatesList.push(obj);
			}
		}
		else{

			if($("#giftVouchersdataFile").val()!=null && $("#giftVouchersdataFile").val()!=undefined && $("#giftVouchersdataFile").val()!=""){
				obj={templateType:"giftVouchersdata",fileId:$("#giftVouchersdata_refId").val(),fileName:$("#giftVouchersdataFile").val(),status:"false"};
	//			console.log(obj);
				templatesList.push(obj);
			}
		
		}
		if($("#giftVouchersui").prop('checked')){
			if($("#giftVouchersuiFile").val()!=null && $("#giftVouchersuiFile").val()!=undefined && $("#giftVouchersuiFile").val()!=""){
				obj={templateType:"giftVouchersui",fileId:$("#giftVouchersui_refId").val(),fileName:$("#giftVouchersuiFile").val(),status:"true"};
	//			console.log(obj);
				templatesList.push(obj);
			}
		}
		else{

			if($("#giftVouchersuiFile").val()!=null && $("#giftVouchersuiFile").val()!=undefined && $("#giftVouchersuiFile").val()!=""){
				obj={templateType:"giftVouchersui",fileId:$("#giftVouchersui_refId").val(),fileName:$("#giftVouchersuiFile").val(),status:"false"};
	//			console.log(obj);
				templatesList.push(obj);
			}
		
		}

//debugger;
var test = $("#loyalityRewardingdata_refId").val();
		if($("#loyalityRewardingdata").prop('checked')){
			if($("#loyalityRewardingdataFile").val()!=null && $("#loyalityRewardingdataFile").val()!=undefined && $("#loyalityRewardingdataFile").val()!=""){
				obj={templateType:"loyalityRewardingdata",fileId:$("#loyalityRewardingdata_refId").val(),fileName:$("#loyalityRewardingdataFile").val(),status:"true"};
	//			console.log(obj);
				templatesList.push(obj);
			}
		}
		else{

			if($("#loyalityRewardingdataFile").val()!=null && $("#loyalityRewardingdataFile").val()!=undefined && $("#loyalityRewardingdataFile").val()!=""){
				obj={templateType:"loyalityRewardingdata",fileId:$("#loyalityRewardingdata_refId").val(),fileName:$("#loyalityRewardingdataFile").val(),status:"false"};
	//			console.log(obj);
				templatesList.push(obj);
			}
		
		}
		if($("#loyalityRewardingui").prop('checked')){
			if($("#loyalityRewardinguiFile").val()!=null && $("#loyalityRewardinguiFile").val()!=undefined && $("#loyalityRewardinguiFile").val()!=""){
				obj={templateType:"loyalityRewardingui",fileId:$("#loyalityRewardingui_refId").val(),fileName:$("#loyalityRewardinguiFile").val(),status:"true"};
	//			console.log(obj);
				templatesList.push(obj);
			}
		}
		else{

			if($("#loyalityRewardinguiFile").val()!=null && $("#loyalityRewardinguiFile").val()!=undefined && $("#loyalityRewardinguiFile").val()!=""){
				obj={templateType:"loyalityRewardingui",fileId:$("#loyalityRewardingui_refId").val(),fileName:$("#loyalityRewardinguiFile").val(),status:"false"};
	//			console.log(obj);
				templatesList.push(obj);
			}
		
		}

		if($("#notificationGreetingsdata").prop('checked')){
			if($("#notificationGreetingsdataFile").val()!=null && $("#notificationGreetingsdataFile").val()!=undefined && $("#notificationGreetingsdataFile").val()!=""){
				obj={templateType:"notificationGreetingsdata",fileId:$("#notificationGreetingsdata_refId").val(),fileName:$("#notificationGreetingsdataFile").val(),status:"true"};
	//			console.log(obj);
				templatesList.push(obj);
			}
		}
		else{

			if($("#notificationGreetingsdataFile").val()!=null && $("#notificationGreetingsdataFile").val()!=undefined && $("#notificationGreetingsdataFile").val()!=""){
				obj={templateType:"notificationGreetingsdata",fileId:$("#notificationGreetingsdata_refId").val(),fileName:$("#notificationGreetingsdataFile").val(),status:"false"};
	//			console.log(obj);
				templatesList.push(obj);
			}
		
		}
		if($("#notificationGreetingsui").prop('checked')){
			if($("#notificationGreetingsuiFile").val()!=null && $("#notificationGreetingsuiFile").val()!=undefined && $("#notificationGreetingsuiFile").val()!=""){
				obj={templateType:"notificationGreetingsui",fileId:$("#notificationGreetingsui_refId").val(),fileName:$("#notificationGreetingsuiFile").val(),status:"true"};
	//			console.log(obj);
				templatesList.push(obj);
			}
		}
		else{

			if($("#notificationGreetingsuiFile").val()!=null && $("#notificationGreetingsuiFile").val()!=undefined && $("#notificationGreetingsuiFile").val()!=""){
				obj={templateType:"notificationGreetingsui",fileId:$("#notificationGreetingsui_refId").val(),fileName:$("#notificationGreetingsuiFile").val(),status:"false"};
	//			console.log(obj);
				templatesList.push(obj);
			}
		
		}
debugger;
		if($("#notificationCampaignsdata").prop('checked')){
			if($("#notificationCampaignsdataFile").val()!=null && $("#notificationCampaignsdataFile").val()!=undefined && $("#notificationCampaignsdataFile").val()!=""){
				obj={templateType:"notificationCampaignsdata",fileId:$("#notificationCampaignsdata_refId").val(),fileName:$("#notificationCampaignsdataFile").val(),status:"true"};
	//			console.log(obj);
				templatesList.push(obj);
			}
		}
		else{

			if($("#notificationCampaignsdataFile").val()!=null && $("#notificationCampaignsdataFile").val()!=undefined && $("#notificationCampaignsdataFile").val()!=""){
				obj={templateType:"notificationCampaignsdata",fileId:$("#notificationCampaignsdata_refId").val(),fileName:$("#notificationCampaignsdataFile").val(),status:"false"};
	//			console.log(obj);
				templatesList.push(obj);
			}
		
		}
		if($("#notificationCampaignsui").prop('checked')){
			if($("#notificationCampaignsuiFile").val()!=null && $("#notificationCampaignsuiFile").val()!=undefined && $("#notificationCampaignsuiFile").val()!=""){
				obj={templateType:"notificationCampaignsui",fileId:$("#notificationCampaignsui_refId").val(),fileName:$("#notificationCampaignsuiFile").val(),status:"true"};
	//			console.log(obj);
				templatesList.push(obj);
			}
		}
		else{

			if($("#notificationCampaignsuiFile").val()!=null && $("#notificationCampaignsuiFile").val()!=undefined && $("#notificationCampaignsuiFile").val()!=""){
				obj={templateType:"notificationCampaignsui",fileId:$("#notificationCampaignsui_refId").val(),fileName:$("#notificationCampaignsuiFile").val(),status:"false"};
	//			console.log(obj);
				templatesList.push(obj);
			}
		
		}

		SMSSettings.templatesList=templatesList;
		SMSSettings.gateWay = $("#gateway").val();
		SMSSettings.userName = $("#username").val();
		SMSSettings.password = $("#password").val();
		SMSSettings.enabled = enabled;
		
		if(parameterList.length > 0 )
			SMSSettings.parametersList = parameterList;

		SMSSettings.messageKey = $("#messageKey").val();
		SMSSettings.mobileKey = $("#mobileKey").val();
		SMSSettings.smsURL = $("#smsURL").val();
		SMSSettings.mobileNumber=$("#mobilenumber").val();
		SMSSettings.templateId=$("#templateId").val();
		SMSSettings.textMsg=$("#textmessage").val();

		var formData = JSON.stringify(SMSSettings);
		console.log(formData);
		var contextPath = $("#contextPath").val();
		if(operation=="new"){
			URL = contextPath + "/settings/createSMSSettings.do";
		}
		else if(operation=="edit"){

			URL = contextPath + "/settings/updateSMSSettings.do";
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
				$(this).scrollTop(0);
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
	catch(e){}
}





function validatesetting(operation){
	debugger;
	try{
		
		var online = window.navigator.onLine;
	 	if(!online)
	 	{
	 	alert("check your internet connection,please try agian after some time");
	 	return;
	 	}
	 	var contextPath = $("#contextPath").val();
	 	$("#gatewayError").html("");
	 	$("#mobileKeyError").html("");
		$("#mobilenumberError").html("");
		$("#templateIdError").html("");
		$("#messageKeyError").html("");
	 	var finalObj={}
	 	
	 	if($("#gateway").val().trim() == ""){
			$("#gatewayError").html("Enter Gateway");
			
			return false;
			
		}
	 	
	 	if($("#mobileKey").val().trim() == ""){
			$("#mobileKeyError").html("Enter Mobile Key");
			
			return false;
			
		}
	 	
	 	if($("#mobilenumber").val().trim() == ""){
			$("#mobilenumberError").html("Enter Mobile Number");
			return false;
		}
	 	
	 	if($("#templateId").val().trim() == ""){
			$("#templateIdError").html("Enter Template ID");
			return false;
		}
	 	
	 	if($("#messageKey").val().trim() == ""){
			$("#messageKeyError").html("Enter Message key");
			return false;
			
		}
		validateGateWay();
		
	 	var enabled = false;
		if($('#enabled').is(':checked'))
		{
				enabled = true;
		}
		
		
	 	finalObj.mobileNumber=$("#mobilenumber").val();
	 	finalObj.templateId=$("#templateId").val();
	 	finalObj.textMsg=$("#textmessage").val();
	 	finalObj.messageKey = $("#messageKey").val();
	 	finalObj.mobileKey = $("#mobileKey").val();
	 	finalObj.smsURL = $("#smsURL").val();
	 	finalObj.gateWay = $("#gateway").val();
	 	finalObj.enabled = enabled;
	 	
		var formData = JSON.stringify(finalObj);
		console.log(formData);
		
		if(operation=="new"){
			/*URL = contextPath + "/settings/createSMSSettings.do";*/
		}
		else if(operation=="edit"){

			URL = contextPath + "/settings/validatesettings.do";
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
				$(this).scrollTop(0);
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
	catch(e){}
}





function addParameters()
{
	try{
		//debugger;
		var params = {};

		if($("#parameterName").val() === undefined || $("#parameterName").val() === null || $("#parameterName").val() === "")
		{
			alert("Parameter Name is required.");
			return;
		}
		if($("#parameterValue").val() === undefined || $("#parameterValue").val() === null|| $("#parameterValue").val() === "")
		{
			alert("Parameter Value is required.");
			return;
		}

		var attr= 'parameterName';
		var index =-1;
		var idValue = $("#parameterName").val();


		for(var i = 0; i < parameterList.length; i++) {
			for(var key in parameterList[i] ) {
				if(key === attr)
				{
					var keyValue = parameterList[i][attr];
					if(idValue === keyValue)
						index = i;
				}
			}
		}

		if(index >= 0)
		{
			alert("ParameterName already exist, please choose another parameter for SMS settings");
			return;
		}



		var paramName = $("#parameterName").val();
		var paramValue = $("#parameterValue").val();

		$('#paramsTable tr:last').after('<tr   class="'+paramName.replace(/[^a-z0-9\s]/gi, '').replace(/[_\s]/g, '-')+paramValue.replace(/[^a-z0-9\s]/gi, '').replace(/[_\s]/g, '-')+'" ><td><input type = "checkbox" class="CheckBoxChild" name="rowsSelected" value="'+paramName+"_"+paramValue+'""/></td><td>'+paramName+'</td><td>'+paramValue+'</td></tr>');
		params.parameterName =paramName;
		params.parameterValue = paramValue;
		parameterList.push(params);
		$("#parameterName").val("");
		$("#parameterValue").val("");
		changeUrl();
	}
	catch(e){
		
		console.log(e)
		
	}
}


function removeParameters(ele)
{
	try{
		//debugger;
		var selectList=[];
		$("input:checkbox[name=rowsSelected]:checked").each(function(){
			selectList.push($(this).val());
		});
		for(var i = 0; i < selectList.length; i++)
		{
			var rem =selectList[i];
			var values = rem.split("_");
			
			rem = rem.replace(/[^a-z0-9\s]/gi, '').replace(/[_\s]/g, '-');
			
			$("."+rem).remove();
			parameterList = parameterList.filter(function( obj ) {
				return obj.parameterValue !== values[values.length -1];
			});
		}
		changeUrl();
	}
	catch(e){
		console.log(e)
	}
}






function resetSettings()
{
	try{
		$("#gateway").val("");
		$("#parameterName").val("");
		$("#parameterValue").val("");
		$("#mobileKey").val("");
		$("#messageKey").val("");
		$("#paramsTable > tbody").html("");
		parameterList = [];
		$("#smsURL").val("https://");
	}
	catch(e)
	{

	}
}


$('#CheckBoxParent').click(function(){
	//debugger;
//	if($(this).prop("checked")) {
//	$(".checkBoxChild").prop("checked", true);
//	} else {
//	$(".checkBoxChild").prop("checked", false);
//	}


	var status = this.checked; // "select all" checked status
	$('.CheckBoxChild').each(function(){ //iterate all listed checkbox items

		this.checked = status; //change ".checkbox" checked status
	});

});


function addItemIdOnLoad(count)
{
	try{
		//debugger;
		var params = {};
		var paramName = $("#parameterName"+count).val();
		var paramValue = $("#parameterValue"+count).val();
		
		
		$('#paramsTable tr:last').after('<tr   class="'+paramName.replace(/[^a-z0-9\s]/gi, '').replace(/[_\s]/g, '-')+paramValue.replace(/[^a-z0-9\s]/gi, '').replace(/[_\s]/g, '-')+'" ><td><input type = "checkbox" class="CheckBoxChild" name="rowsSelected" value="'+paramName+"_"+paramValue+'""/></td><td>'+paramName+'</td><td>'+paramValue+'</td></tr>');
		params.parameterName =paramName;
		params.parameterValue = paramValue;
		parameterList.push(params);
	}
	catch(e){}
	changeUrl();
}



/*
function changeUrl()
{
	try{
		//debugger;


//		var gateway = $("#gateway").val(); 
		var smsUrl = "https://";
		if( $("#gateway").length>0)
			smsUrl += $("#gateway").val();
		if(parameterList.length>0)
		{
			for(var i=0; i<parameterList.length ; i++)
			{

				var parameters = parameterList[i];
				var parname = parameters.parameterName;
				var parVal = parameters.parameterValue;
				if(i==0)
					smsUrl+="?"+parname;
				else
					smsUrl+="&"+parname;
				smsUrl+="="+parVal;
			}

		}
		if( $("#mobileKey").length>0)
		{
			smsUrl  += "&"+$("#mobileKey").val()+"=";

		}
		if( $("#messageKey").length>0)
		{
			smsUrl += "&"+ $("#messageKey").val()+"=";

		}

		$("#smsURL").val(smsUrl);
	}
	catch(e)
	{

	}

}*/

function changeUrl()
{
	try{
		//debugger;


//		var gateway = $("#gateway").val(); 
		var smsUrl = "";
		if( $("#gateway").length>0)
			smsUrl += $("#gateway").val();
		
		validateGateWay();

//	    var expr = /(http(s)?:\/\/.)?(www\.)?[-a-zA-Z0-9@:%._\+~#=]{2,256}\.[a-z]{2,6}\b([-a-zA-Z0-9@:%_\+.~#?&//=]*)/g);
	  
		
		if(parameterList.length>0)
		{
			for(var i=0; i<parameterList.length ; i++)
			{

				var parameters = parameterList[i];
				var parname = parameters.parameterName;
				var parVal = parameters.parameterValue;
				if(i==0)
					smsUrl+="?"+parname.trim();
				else
					smsUrl+="&"+parname.trim();
				smsUrl+="="+parVal;
			}

		}
	/*	if( $("#mobileKey").length>0 &&  $("#mobileKey").val().trim() != "")
		{
			smsUrl  += "&"+$("#mobileKey").val().trim()+"=";

		}
		if( $("#messageKey").length>0 &&  $("#messageKey").val().trim() != "")
		{
			smsUrl += "&"+ $("#messageKey").val().trim()+"=";

		}*/

		$("#smsURL").val(smsUrl);
	}
	catch(e)
	{

	}

}

function validateUrl()
{
	debugger;
	
	var smsUrl = "";
	if( $("#gateway").length>0)
		smsUrl += $("#smsURL").val();
    
	validateGateWay();
	
	
	if( $("#mobileKey").length>0)
	{
		smsUrl  += "&"+$("#mobileKey").val()+"="+$("#mobileNo").val();
		

	}
	if( $("#messageKey").length>0)
	{
		smsUrl += "&"+ $("#messageKey").val()+"=verified successfully" ;

	}
	
	
	
	var win = window.open(smsUrl, '_blank');
	if (win) {
		//Browser has allowed it to be opened
		win.focus();
		return;
	} else {
		//Browser has blocked it
		alert('Please allow popups for this website');
	}

}


function validateGateWay()
{
	var smsUrl = "";
	if( $("#gateway").length>0)
		smsUrl += $("#gateway").val();
	
	  var expr = new RegExp("^http(s?)\:\/\/[0-9a-zA-Z]([-.\w]*[0-9a-zA-Z])*(:(0-9)*)*(\/?)([a-zA-Z0-9\-\.\?\,\'\/\\\+&amp;%\$#_]*)?$");
      
		if(!expr.test(smsUrl))
			{
				$("#gatewayError").html("Invalid GateWay, start with http or https protocol.");
				$("#gateway").focus();
				return;
			}	

}
