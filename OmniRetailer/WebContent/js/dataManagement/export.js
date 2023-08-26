/*$("body").on("change", function () {
	
	noOfFiles =10;
	$("input:file").each(function(e){
		
		noOfFiles = noOfFiles + $(this)[0].files.length;
		var id = $(this)[0].files;
	});
	if(noOfFiles == 1)
		$("#Error").html('');
	
	
	
});
*/

function exportBills(ele) {

	debugger;
	/*if ($("#exportModebilling").val() == 'ftp') {
		connecttoftp(this, 'ftpserver');
	} */ if ($("#billingExportMode").val() != '') {
		var type = $("#billingFileType").val();
		$('#errBillDates').html("");
		
		if ($('#billingAll').prop('checked')) {
			var startdate = $("#billingAllFrom").val();
			var enddate = $("#billingAllTo").val();
			var location = $("#billingAllLocation").val();
			
			
			var noOfDays = daydiff(parseDate(startdate), parseDate(enddate));
			
			if(type=="JDA")
				{
				if (noOfDays > 30) {
			   		 $('#errBillDates').html("Cannot download data for more than 30 days.");
			   			return;
			   		}
				}
			else if(type=="CSV")
				{
				if (noOfDays > 30) {
			   		 $('#errBillDates').html("Cannot download data for more than 30 days.");
			   			return;
			   		}
				}
			
			
			
			if(type=="SAP_ONLINE")
				{
				exportbillsbyStatusSapOnline(this, "", startdate, enddate,location,type);
				}
			else if(type=="SAP_IDOCS")
				{
				exportbillsbySapIdocs(this,status,startdate,enddate,location,type);
				}
			else
				{
				 exportbillsbyStatus(this, null, startdate, enddate,location,type);
				}
			
		}
		if ($('#billingCompleted').prop('checked')) {
			var startdate = $("#billingCompletedFrom").val();
			var enddate = $("#billingCompletedTo").val();
			var location = $("#billingCompletedLocation").val();
			
			var noOfDays = daydiff(parseDate(startdate), parseDate(enddate));
			if(type=="JDA")
				{
				if (noOfDays > 30) {
			   		 $('#errBillDates').html("Cannot download data for more than 30 days.");
			   			return;
			   		}
				}
			else if(type=="CSV")
				{
				if (noOfDays > 30) {
			   		 $('#errBillDates').html("Cannot download data for more than 30 days.");
			   			return;
			   		}
				}
			exportbillsbyStatus(this, 'TA-Completed', startdate, enddate,location,type);
		}
		if ($('#billingCancelled').prop('checked')) {
			var startdate = $("#billingCancelledFrom").val();
			var enddate = $("#billingCancelledTo").val();
			var location = $("#billingCancelledLocation").val();
			
			var noOfDays = daydiff(parseDate(startdate), parseDate(enddate));
			if(type=="JDA")
				{
				if (noOfDays > 30) {
			   		 $('#errBillDates').html("Cannot download data for more than 30 days.");
			   			return;
			   		}
				}
			else if(type=="CSV")
				{
				if (noOfDays > 30) {
			   		 $('#errBillDates').html("Cannot download data for more than 30 days.");
			   			return;
			   		}
				}
			
			
			exportbillsbyStatus(this, 'TA-CANCELLED', startdate, enddate,location,type);
		}
		if ($('#billingReturned').prop('checked')) {
			var startdate = $("#billingReturnedFrom").val();
			var enddate = $("#billingReturnedTo").val();
			var location = $("#billingReturnedLocation").val();
			
			var noOfDays = daydiff(parseDate(startdate), parseDate(enddate));
			if(type=="JDA")
				{
				if (noOfDays > 30) {
			   		 $('#errBillDates').html("Cannot download data for more than 30 days.");
			   			return;
			   		}
				}
			else if(type=="CSV")
				{
				if (noOfDays > 30) {
			   		 $('#errBillDates').html("Cannot download data for more than 30 days.");
			   			return;
			   		}
				}
			
			if(type=="SAP_ONLINE")
			{
				exportbillsbyStatusSapOnline(this,"return", startdate, enddate,location,type);
			}
			else
			{
				exportbillsbyStatus(this, 'TA-Returned', startdate, enddate,location,type);
			}
			
		}
		if ($('#billingExchanged').prop('checked')) {
			var startdate = $("#billingExchangedFrom").val();
			var enddate = $("#billingExchangedTo").val();
			var location = $("#billingExchangedLocation").val();
			
			var noOfDays = daydiff(parseDate(startdate), parseDate(enddate));
			
			if(type=="JDA")
				{
				if (noOfDays > 30) {
			   		 $('#errBillDates').html("Cannot download data for more than 30 days.");
			   			return;
			   		}
				}
			else if(type=="CSV")
				{
				if (noOfDays > 30) {
			   		 $('#errBillDates').html("Cannot download data for more than 30 days.");
			   			return;
			   		}
				}
			exportbillsbyStatus(this, 'TA-Exchanged', startdate, enddate,location,type);
		}
	}
	else{
		alert("select  type of export");
	}
}



/*
function exportBills(ele) {

	if ($("#exportModebilling").val() == 'ftp') {
		connecttoftp(this, 'ftpserver');
	}  if ($("#billingExportMode").val() != '') {
		var type = $("#billingFileType").val();
		if ($('#billingExchanged').prop('checked')) {
			var startdate = $("#billingExchangedFrom").val();
			var enddate = $("#billingExchangedTo").val();
			var location = $("#billingExchangedLocation").val();
			exportbillsbyStatus(this, 'TA-Exchanged', startdate, enddate,location,type);
		}
		if ($('#billingAll').prop('checked')) {
			var startdate = $("#billingAllFrom").val();
			var enddate = $("#billingAllTo").val();
			var location = $("#billingAllLocation").val();
			exportbillsbyStatus(this, null, startdate, enddate,location,type);
		}
		if ($('#billingCompleted').prop('checked')) {
			var startdate = $("#billingCompletedFrom").val();
			var enddate = $("#billingCompletedTo").val();
			var location = $("#billingCompletedLocation").val();
			exportbillsbyStatus(this, 'TA-Completed', startdate, enddate,location,type);
		}
		if ($('#billingCancelled').prop('checked')) {
			var startdate = $("#billingCancelledFrom").val();
			var enddate = $("#billingCancelledTo").val();
			var location = $("#billingCancelledLocation").val();
			exportbillsbyStatus(this, 'TA-CANCELLED', startdate, enddate,location,type);
		}
		if ($('#billingReturned').prop('checked')) {
			var startdate = $("#billingReturnedFrom").val();
			var enddate = $("#billingReturnedTo").val();
			var location = $("#billingReturnedLocation").val();
			exportbillsbyStatus(this, 'TA-Returned', startdate, enddate,location,type);
		}
	}
	else{
		alert("select  type of export");
	}
}
*/

function exportInventoryManagement(ele) {

	if ($("#inventoryExportMode").val() == 'ftp') {
		connecttoftp(this, 'ftpserver');
	} else if ($("#inventoryExportMode").val() == 'localdownload') {
		if ($('#inventoryStockReceipts').prop('checked')) {
			var startdate = $("#inventoryStockReceiptsFrom").val();
			var enddate = $("#inventoryStockReceiptsTo").val();
			var location = $("#inventoryStockReceiptsLocation").val();
			exportStockReceipts(this, location, startdate, enddate);
		}
		if ($('#inventoryStockIssue').prop('checked')) {
			var startdate = $("#inventoryStockIssueFrom").val();
			var enddate = $("#inventoryStockIssueTo").val();
			var location = $("#inventoryStockIssueLocation").val();
			exportStockIssue(this, location, startdate, enddate);
		}
		if ($('#inventoryStockRequest').prop('checked')) {
			var startdate = $("#inventoryStockRequestFrom").val();
			var enddate = $("#inventoryStockRequestTo").val();
			var location = $("#inventoryStockRequestLocation").val();
			exportStockVerification(this, location, startdate, enddate);
		}
		if ($('#inventoryStockReturn').prop('checked')) {
			var startdate = $("#inventoryStockReturnFrom").val();
			var enddate = $("#inventoryStockReturnTo").val();
			var location = $("#inventoryStockReturnLocation").val();
			exportStockReturn(this, location, startdate, enddate);
		}
		if ($('#inventoryStockVerification').prop('checked')) {
			var startdate = $("#inventoryStockVerificationFrom").val();
			var enddate = $("#inventoryStockVerificationTo").val();
			var location = $("#inventoryStockVerificationLocation").val();
			exportStockVerification(this,location,startdate,enddate);
		}
		
	}
}

function connecttoftp(ele,id){
	 var contextPath = $("#contextPath").val();
	 URL = contextPath + "/dataManagement/uploadtoftp.do";
	 var ftpserver =$("#ftpserverbilling").val();
		var port =$("#portbilling").val();
		var loginid =$("#loginidbilling").val();
		var password =$("#passwordbilling").val();
	 $.ajax({
			type: "GET",
			url : URL,
			data : {
				ftpserver : ftpserver,
				port : port,
				loginid : loginid,
				password : password
			},
			beforeSend: function(xhr){                    
	   	   	},
			success : function(result) {
				 messageStatus= JSON.stringify(result);
				var parsed_json = JSON.parse(messageStatus);
				console.info(parsed_json)
				var error = parsed_json.err;
				if(error=='530')
				{
				alert("FTP Authentication Failed");
				return false;
				}
				else
					return true;
				
				$("#loading").css("display","none");
			},
			error : function(result) {
				 messageStatus= JSON.stringify(result);
					var parsed_json = JSON.parse(messageStatus);
					console.info(parsed_json)
					var error = parsed_json.err;
					if(error=='530')
					{
					alert("FTP Authentication Failed");
					return false;
					}
					else
						return true;
				 $("#loading").css("display","none");
	 			 $("#mainDiv").removeClass('disabled');
			}
		});
}

function exportbillsbyStatusSapOnline(ele,status,startdate,enddate,location,type){
	debugger;
	 var contextPath = $("#contextPath").val();
	 URL = contextPath + "/dataManagement/exportBillsSapOnline.do";
	 
	 if(startdate==null || startdate==undefined || startdate=="")
		 {
		 alert("Start date is required.");
		 return;
		 }
	 if(enddate==null || enddate==undefined || enddate=="")
		 {
		 alert("End date is required.");
		 return;
		 }
	 if(location==null || location==undefined || location=="")
		 {
		 alert("Location is required.");
		 return;
		 }
	 
	 $.ajax({
			type: "GET",
			url : URL,
			data : {
				startdate : startdate,
				enddate : enddate,
				location:location,
				status:status,
			},
			beforeSend: function(xhr){  
				$("#loading").css("display","block");
		   		$("#mainDiv").addClass("disabled");
	   	   	},
			success : function(result) {
				debugger
				 data=JSON.parse(JSON.stringify(result));
				  //console.info(data);
				$("#loading").css("display","none");
				$("#mainDiv").removeClass('disabled');
				var ResponseCode=data.responseHeader.responseCode;
				if(ResponseCode=="0")
					{
						alert("Bills Exported Successfully.");
					}
				else
					{
						alert("Bills Export Failed.");
					}
				
				
			},
			error : function() {
				 $("#loading").css("display","none");
	 			 $("#mainDiv").removeClass('disabled');
			}
		});
}

function exportbillsbySapIdocs(ele,status,startdate,enddate,location,type){
	debugger;
	 var contextPath = $("#contextPath").val();

     var mode = $("#billingExportMode").val();

       if(mode != "ftp"){
	 alert("We are Supporting Only FTP mode for SAP IDOCS.");
		 return;
          }

	 URL = contextPath + "/dataManagement/exportBillsSapIdocs.do";
	 
	 if(startdate==null || startdate==undefined || startdate=="")
		 {
		 alert("Start date is required.");
		 return;
		 }
	 if(enddate==null || enddate==undefined || enddate=="")
		 {
		 alert("End date is required.");
		 return;
		 }
	 
	 $.ajax({
			type: "GET",
			url : URL,
			data : {
				startdate : startdate,
				enddate : enddate,
				status : status,
				location : location,
			},
			beforeSend: function(xhr){  
				$("#loadingreport").css("display","block");
		   		$("#mainDiv").addClass("disabled");
	   	   	},
			success : function(result) {
				debugger
				 data=JSON.parse(JSON.stringify(result));
				  //console.info(data);
				$("#loadingreport").css("display","none");
				$("#mainDiv").removeClass('disabled');
				var ResponseCode=data.responseHeader.responseCode;
				var ResponseMsg = data.responseHeader.responseMessage;
				if(ResponseCode=="0")
					{
						alert(ResponseMsg);
					}
				else
					{
						alert(ResponseMsg);
					}
			},
			error : function() {
				 $("#loadingreport").css("display","none");
	 			 $("#mainDiv").removeClass('disabled');
			}
		});
}


function exportbillsbyStatus(ele,status,startdate,enddate,location,type){
	debugger;
	 var contextPath = $("#contextPath").val();
	 var mode = $("#billingExportMode").val();
	 var isFtpUploadRequired = false;
	 if(mode == 'ftp')
		 isFtpUploadRequired = true;
	 var ftpserver =$("#ftpserverbilling").val();
	 		var port =$("#portbilling").val();
	 		var loginid =$("#loginidbilling").val();
	 		var password =$("#passwordbilling").val();

	 URL = contextPath + "/dataManagement/exportBills.do";
	 $.ajax({
			type: "GET",
			url : URL,
			data : {
				startdate : startdate,
				enddate : enddate,
				status :status,
				location:location,
				type : type,
				isFtpUploadRequired : isFtpUploadRequired,
				ftpserver : ftpserver,
				port : port,
				loginid : loginid,
				password : password
			},
			beforeSend: function(xhr){  
				$("#loading").css("display","block");
		   		$("#mainDiv").addClass("disabled");
	   	   	},
			success : function(result) {
				debugger
				 data=JSON.parse(JSON.stringify(result));
				  console.info(data);
				if(type == "JDA" && mode != 'ftp'){
					  var anchor = document.createElement('a');
					  //anchor.href = data.billItemsFilePath;
					  var link = "";
					  if(data.billItemsFilePath == null)
						  link = data.billingUrl;
					  else
						  link = data.billItemsFilePath;
						  //link = link.replace('183.82.102.209', '10.10.0.90');
						  anchor.href = link;
						  	if (window.location.protocol == 'https:') {
								 link = link.replace(':80', '');
								 link = link.replace('http', 'https');
							anchor.href = link;
							}
						else{
							anchor.href = link;
						}
					  
					  anchor.target = '_blank';
					  anchor.download = '';
					  anchor.click();
					  
					  
					  var anchor = document.createElement('a');
					   var link = data.billTransactionFilePath;
						  //link = link.replace('183.82.102.209', '10.10.0.90');
						  anchor.href = link;
						  	if (window.location.protocol == 'https:') {
								 link = link.replace(':80', '');
								 link = link.replace('http', 'https');
							anchor.href = link;
							}
						else{
							anchor.href = link;
						}
					  
//					  anchor.href = data.billTransactionFilePath;
					  anchor.target = '_blank';
					  anchor.download = '';
					  anchor.click();
				}
				
				else if(type == "JDA" && mode == 'ftp'){
					if(data.billItemsFilePath!=null)
					alert("Files Uploaded Successfully");
					else
						alert("Files not uploded try after some time");
					  /*var anchor = document.createElement('a');
					  anchor.href = data.billItemsFilePath;
					  anchor.target = '_blank';
					  anchor.download = '';
					  anchor.click();
					  var anchor = document.createElement('a');
					  anchor.href = data.billTransactionFilePath;
					  anchor.target = '_blank';
					  anchor.download = '';
					  anchor.click();*/
				}
				
				else if(type == "TALLY" && mode != 'ftp'){
					  var anchor = document.createElement('a');
					   var link = data.salesReportFilePath;
				// link = link.replace('183.82.102.209', '10.10.0.90');
				anchor.href = link;
				if (window.location.protocol == 'https:') {
					link = link.replace(':80', '');
					link = link.replace('http', 'https');
					anchor.href = link;
				} else {
					anchor.href = link;
				}
					  
					  
					  // anchor.href = data.salesReportFilePath;
					  anchor.target = '_blank';
					  anchor.download = '';
					  anchor.click();
				}
				
				else if(type == "TALLY" && mode == 'ftp'){
					if(data.billItemsFilePath!=null)
					alert("Files Uploaded Successfully");
					else
						alert("Files not uploded try after some time");
					  /*var anchor = document.createElement('a');
					  anchor.href = data.billItemsFilePath;
					  anchor.target = '_blank';
					  anchor.download = '';
					  anchor.click();
					  var anchor = document.createElement('a');
					  anchor.href = data.billTransactionFilePath;
					  anchor.target = '_blank';
					  anchor.download = '';
					  anchor.click();*/
				}
				else if(type == "SAP" && mode != 'ftp'){
					
					//billTransactionURL 
					  var anchor = document.createElement('a');
					   var link = data.billTransactionURL;
						anchor.href = link;
						if (window.location.protocol == 'https:') {
							link = link.replace(':80', '');
							link = link.replace('http', 'https');
							anchor.href = link;
						} else {
							anchor.href = link;
						}
					  anchor.target = '_blank';
					  anchor.download = '';
					  anchor.click();
					  
					  //skuTransactionDetailsURL
					  var anchor = document.createElement('a');
					   var link = data.skuTransactionDetailsURL;
						anchor.href = link;
						if (window.location.protocol == 'https:') {
							link = link.replace(':80', '');
							link = link.replace('http', 'https');
							anchor.href = link;
						} else {
							anchor.href = link;
						}
					  anchor.target = '_blank';
					  anchor.download = '';
					  anchor.click();
					  
					  //posDiscountTransactionURL
					  var anchor = document.createElement('a');
					   var link = data.posDiscountTransactionURL;
						anchor.href = link;
						if (window.location.protocol == 'https:') {
							link = link.replace(':80', '');
							link = link.replace('http', 'https');
							anchor.href = link;
						} else {
							anchor.href = link;
						}
					  anchor.target = '_blank';
					  anchor.download = '';
					  anchor.click();
					  
					  //posPaymentDetailsURL
					  var anchor = document.createElement('a');
					   var link = data.posPaymentDetailsURL;
						anchor.href = link;
						if (window.location.protocol == 'https:') {
							link = link.replace(':80', '');
							link = link.replace('http', 'https');
							anchor.href = link;
						} else {
							anchor.href = link;
						}
					  anchor.target = '_blank';
					  anchor.download = '';
					  anchor.click();
					  
					  //skuTaxTransactionURL
					  var anchor = document.createElement('a');
					   var link = data.skuTaxTransactionURL;
						anchor.href = link;
						if (window.location.protocol == 'https:') {
							link = link.replace(':80', '');
							link = link.replace('http', 'https');
							anchor.href = link;
						} else {
							anchor.href = link;
						}
					  anchor.target = '_blank';
					  anchor.download = '';
					  anchor.click();
					  
					  //declarationpostosapURL
					  var anchor = document.createElement('a');
					   var link = data.declarationpostosapURL;
						anchor.href = link;
						if (window.location.protocol == 'https:') {
							link = link.replace(':80', '');
							link = link.replace('http', 'https');
							anchor.href = link;
						} else {
							anchor.href = link;
						}
					  anchor.target = '_blank';
					  anchor.download = '';
					  anchor.click();
				}
				
				else if(type == "SAP" && mode == 'ftp'){
					if(data.billItemsFilePath!=null)
					alert("Files Uploaded Successfully");
					else
						alert("Files not uploded try after some time");
					 
				}
				else{
					 var anchor = document.createElement('a');
					  var link =  "";
					  if(data.billingUrl == null ||  data.billingUrl == "")
						  link =data.stockReturnsFilePath;
					  else
						  link = data.billingUrl;
					  
					  anchor.href = link;
					  anchor.target = '_blank';
					  anchor.download = '';
					  anchor.click();
				}
				$("#loading").css("display","none");
				$("#mainDiv").removeClass('disabled')
			},
			error : function() {
				 $("#loading").css("display","none");
	 			 $("#mainDiv").removeClass('disabled');
			}
		});
}

/*
function exportproductcatelouge(ele){
	debugger;
	var filetype = $("#productCatelogueFileType").val();
	var exportType = $("#productCatelogueExportType").val();
	var productCatelogRadio = $('input[name=productCatelogRadio]:checked').val();
	
	if ($("#productCatelogueExportMode").val() == 'ftp') {
		connecttoftp(this, 'ftpserver');
	} else if ($("#productCatelogueExportMode").val() == 'localdownload') {
		if ($('#ProductMaster').prop('checked')) {
			count=true;
			var startdate = $("fromProductMaster").val();
			var enddate = $("#toProductMaster").val();
			exportMasterData(this, '', startdate, enddate);
		}
		if ($('#productCatelogueSkuMasters').prop('checked')) {
			count=true;
			var startDate = "";
			if($("#productCatelogueSkuMastersFrom").length > 0)
				startDate = $("#productCatelogueSkuMastersFrom").val();
			
			var endDate = "";
			if($("#productCatelogueSkuMastersTo").length > 0)
				endDate = $("#productCatelogueSkuMastersTo").val();
			
			var location = "";
			if($("#productCatelogueSkuMastersLocation").length > 0)
				location = $("#productCatelogueSkuMastersLocation").val();
			
			//exportMasterData(this, 'sku', startdate, enddate);
			exportSkuMaster(this,false);
		}
	if ($('#productCatelogueSkuMaster').prop('checked')) {
		count=true;
			var startdate = $("#productCatelogueSkuMasterFrom").val();
			var enddate = $("#productCatelogueSkuMasterTo").val();
			//exportMasterData(this, 'sku', startdate, enddate);
			exportSkuMaster(this,true);
		}
		if ($('#productCatelogueSuppliers').prop('checked')) {
			count=true;
			var startdate = "";
				if($("#productCatelogueSuppliersFrom").length > 0)
					startDate = $("#productCatelogueSuppliersFrom").val();
			var enddate = "";
			if($("#productCatelogueSuppliersTo").length > 0)
				endDate = $("#productCatelogueSuppliersTo").val();
			var location = "";
			if($("#productCatelogueSuppliersLocation").length > 0)
				location = $("#productCatelogueSuppliersLocation").val();
			
			
			exportMasterData(this, 'supplier', startdate, enddate,location);
		}
		if ($('#productCatelogueTaxMaster').prop('checked')) {
			count=true;
			var startDate = "";
			if ($("#productCatelogueTaxMasterFrom").length > 0)
			startDate = $("#productCatelogueTaxMasterFrom").val();
			
			var endDate = "";
			if ($("#productCatelogueTaxMasterTo").length > 0)
			endDate = $("#productCatelogueTaxMasterTo").val();
			
			var location;
			if ($("#productCatelogueTaxMasterLocation").length > 0)
			location = $("#productCatelogueTaxLocation").val();
			
			exportMasterData(this, 'tax', startdate, enddate,location);
		}
		
		if ($('#productCatelogueBrandMaster').prop('checked')) {
			count=true;
			var startDate = "";
			if ($("#productCatelogueBrandMasterFrom").length > 0)
			 startdate = $("#productCatelogueBrandMasterFrom").val();
			
			var endDate = "";
			if ($("#productCatelogueBrandMasterTo").length > 0)
			enddate = $("#productCatelogueBrandMasterTo").val();
			
			var location = "";
			if ($("#productCatelogueBrandMasterLocation").length > 0)
				location = $("#productCatelogueBrandMasterTo").val();
			
			exportMasterData(this, 'brand', startdate, enddate,location);
		}
		if ($('#productCatelogueDepartments').prop('checked')) {
			count=true;
			var startdate = $("#productCatelogueDepartmentsFrom").val();
			var enddate = $("#productCatelogueDepartmentsTo").val();
			var location=($("#productCatelogueDepartmentsLocation").val());
			exportMasterData(this, 'department', startdate, enddate,location);
		}
	}
	if(!count)
		alert("Please select atlest one item under product catelogs");
	
}
function exportbillsbyStatus(ele,status,startdate,enddate,location,type){
	 var contextPath = $("#contextPath").val();
	 URL = contextPath + "/dataManagement/exportBills.do";

	 $.ajax({
			type: "GET",
			url : URL,
			data : {
				startdate : startdate,
				enddate : enddate,
				status :status,
				location:location,
				type : type,
			},
			beforeSend: function(xhr){  
				$("#loading").css("display","block");
		   		$("#mainDiv").addClass("disabled");
	   	   	},
			success : function(result) {
				 data=JSON.parse(JSON.stringify(result));
				  console.info(data);
				if(type == "JDA"){
					  var anchor = document.createElement('a');
					  anchor.href = data.billItemsFilePath;
					  anchor.target = '_blank';
					  anchor.download = '';
					  anchor.click();
					  var anchor = document.createElement('a');
					  anchor.href = data.billTransactionFilePath;
					  anchor.target = '_blank';
					  anchor.download = '';
					  anchor.click();
				}
				else{
					 var anchor = document.createElement('a');
					  //anchor.href = data.billingUrl;
					  anchor.href = data.stockReturnsFilePath;
					  anchor.target = '_blank';
					  anchor.download = '';
					  anchor.click();
				}
				
				$("#loading").css("display","none");
				$("#mainDiv").removeClass('disabled')
			},
			error : function() {
				 $("#loading").css("display","none");
	 			 $("#mainDiv").removeClass('disabled');
			}
		});
}*/


function exportStockReceipts(ele,location,startdate,enddate){
	 var contextPath = $("#contextPath").val();
	 URL = contextPath + "/dataManagement/exportStockReceipts.do";

	 $.ajax({
			type: "GET",
			url : URL,
			data : {
				enddate : enddate,
				startDate :startdate,
				location:location,
			},
			beforeSend: function(xhr){  
				$("#loading").css("display","block");
		   		$("#mainDiv").addClass("disabled");
	   	   	},
			success : function(result) {
				  data=JSON.parse(JSON.stringify(result));
				  console.info(data);
					console.info(data.billItemsFilePath)
				  var anchor = document.createElement('a');
				  anchor.href = data.stockReceiptsFilePath;
				  anchor.target = '_blank';
				  anchor.download = '';
				  anchor.click();
				$("#loading").css("display","none");
				$("#mainDiv").removeClass('disabled')
			},
			error : function() {
				 $("#loading").css("display","none");
	 			 $("#mainDiv").removeClass('disabled');
			}
		});
}

function exportMasterData(ele,status,startdate,enddate,location){
	 var contextPath = $("#contextPath").val();
	 URL = contextPath + "/dataManagement/exportMasterData.do";
	 $.ajax({
			type: "GET",
			url : URL,
			data : {
				enddate : enddate,
				startDate :startdate,
				status :status,
				location : location
			},
			beforeSend: function(xhr){  
				$("#loading").css("display","block");
		   		$("#mainDiv").addClass("disabled");
	   	   	},
			success : function(result) {
				//debugger;
				  data=JSON.parse(JSON.stringify(result));
				console.log(data);
				  if(status == 'brand'){
					  var anchor = document.createElement('a');
					  anchor.href = data.brandMasterFilePath; 
					  anchor.target = '_blank';
					  anchor.download = '';
					  anchor.click();
				  }
				 
				  else if(status == 'tax'){
					  var anchor = document.createElement('a');
					 // anchor.href = data.taxMasterFilePath;
					  anchor.href = data.brandMasterFilePath; 
					  anchor.target = '_blank';
					  anchor.download = '';
					  anchor.click();
				  }
					  else if(status == 'supplier'){
						  var anchor = document.createElement('a');
						  anchor.href = data.supplierMasterFilePath;
						  anchor.target = '_blank';
						  anchor.download = '';
						  anchor.click();  
					  }
					  else if(status == 'sku'){
						  var anchor = document.createElement('a');
						  anchor.href = data.exportSkuMasterPath;
						  anchor.target = '_blank';
						  anchor.download = '';
						  anchor.click();  
					  }
					//debugger;
				$("#loading").css("display","none");
				$("#mainDiv").removeClass('disabled')
			},
			error : function() {
				 $("#loading").css("display","none");
	 			 $("#mainDiv").removeClass('disabled');
			}
		});
}
function exportStockVerification(ele,location,startdate,enddate){
	 var contextPath = $("#contextPath").val();
	 URL = contextPath + "/dataManagement/exportStockRequest.do";

	 $.ajax({
			type: "GET",
			url : URL,
			data : {
				enddate : enddate,
				startDate :startdate,
				location: location,
			},
			beforeSend: function(xhr){  
				$("#loading").css("display","block");
		   		$("#mainDiv").addClass("disabled");
	   	   	},
			success : function(result) {
				  data=JSON.parse(JSON.stringify(result));
				  console.info(data);
					console.info(data.stockRequestsFilePath)
				  var anchor = document.createElement('a');
				  anchor.href = data.stockRequestsFilePath;
				  anchor.target = '_blank';
				  anchor.download = '';
				  anchor.click();
				$("#loading").css("display","none");
				$("#mainDiv").removeClass('disabled')
			},
			error : function() {
				 $("#loading").css("display","none");
	 			 $("#mainDiv").removeClass('disabled');
			}
		});
}
function exportStockReturn(ele,location,startdate,enddate){
	 var contextPath = $("#contextPath").val();
	 URL = contextPath + "/dataManagement/exportStockReturn.do";

	 $.ajax({
			type: "GET",
			url : URL,
			data : {
				enddate : enddate,
				startDate :startdate,
				location : location,
			},
			beforeSend: function(xhr){  
				$("#loading").css("display","block");
		   		$("#mainDiv").addClass("disabled");
	   	   	},
			success : function(result) {
				  data=JSON.parse(JSON.stringify(result));
				  console.info(data);
					console.info(data.billItemsFilePath)
				  var anchor = document.createElement('a');
				  anchor.href = data.stockReturnsFilePath;
				  anchor.target = '_blank';
				  anchor.download = '';
				  anchor.click();
				$("#loading").css("display","none");
				$("#mainDiv").removeClass('disabled')
			},
			error : function() {
				 $("#loading").css("display","none");
	 			 $("#mainDiv").removeClass('disabled');
			}
		});
}
function exportStockIssue(ele,location,startdate,enddate){
	 var contextPath = $("#contextPath").val();
	 URL = contextPath + "/dataManagement/exportStockIssue.do";

	 $.ajax({
			type: "GET",
			url : URL,
			data : {
				enddate : enddate,
				startDate :startdate,
				location : location,
			},
			beforeSend: function(xhr){  
				$("#loading").css("display","block");
		   		$("#mainDiv").addClass("disabled");
	   	   	},
			success : function(result) {
				  data=JSON.parse(JSON.stringify(result));
				  console.info(data);
					console.info(data.billItemsFilePath)
				  var anchor = document.createElement('a');
				  anchor.href = data.stockIssuesFilePath;
				  anchor.target = '_blank';
				  anchor.download = '';
				  anchor.click();
				$("#loading").css("display","none");
				$("#mainDiv").removeClass('disabled')
			},
			error : function() {
				 $("#loading").css("display","none");
	 			 $("#mainDiv").removeClass('disabled');
			}
		});
}
/*function exportSkuMaster(ele,whflag){
	 $("#Error").html('');
	 if($("#exportModeproductcatelouge").val()==""){
			$("#Error").html('Choose File Type');
			return;
		}
		if($("#exportModeproductcatelouge").val() == "1" ){
			$("#Error").html('JDA File Not Implemented');
			return;
		}
	 if(whflag)
		 {
			 var startdate = $("#productCatelogueSkuMasterFrom").val();
			 var enddate = $("#productCatelogueSkuMasterTo").val();
			 var fileType = 'warehouse';
			 var location = $("#productCatelogueSkuMasterLocation").val();
		 }
	 else
		 {
		
			 var startdate = $("#productCatelogueSkuMastersFrom").val();
			 var enddate = $("#productCatelogueSkuMastersTo").val();
			 var fileType = 'outlet';
			 var location = $("#productCatelogueSkuMastersLocation").val();
		 }
	
	 
	 var contextPath = $("#contextPath").val();
	 URL = contextPath + "/dataManagement/exportSkuMaster.do";
	
	 $.ajax({
			type: "GET",
			url : URL,
			data : {
				startdate : startdate,
				enddate : enddate,
				fileType:fileType,
				location:location
			},
			beforeSend: function(xhr){  
				$("#loading").css("display","block");
		   		$("#mainDiv").addClass("disabled");
	   	   	},
			success : function(result) {
				  data=JSON.parse(JSON.stringify(result));
				  messageStatus= JSON.stringify(result);
					var parsed_json = JSON.parse(messageStatus);
					var error = parsed_json.err;
					if(error != undefined && error !=""){
						 $("#Error").html(error);
					}
				  var anchor = document.createElement('a');
				  anchor.href = data.exportSkuMasterPath;
				  anchor.target = '_blank';
				  anchor.download = '';
				  anchor.click();
				$("#loading").css("display","none");
				$("#mainDiv").removeClass('disabled')
			},
			error : function() {
				 $("#loading").css("display","none");
	 			 $("#mainDiv").removeClass('disabled');
			}
		});
}*/
function fileurl(){
	 var contextPath = $("#contextPath").val();
	 URL = contextPath + "/dataManagement/fileurl.do";
	 var startdate = $("#fromCompletedBills").val();
	 var enddate = $("#toCompletedBills").val();
	 $.ajax({
			type: "GET",
			url : URL,
			data : {
				startdate : startdate,
				enddate : enddate
			},
			beforeSend: function(xhr){                    
	   	   	},
			success : function(result) {
				  data=JSON.parse(JSON.stringify(result));
				  console.info(data);
				  console.log(data.billItemsFilePath);
				  console.log(data.billTransactionFilePath);
//				  window.location.href = data.billItemsFilePath;
//				  window.location.href = data.billTransactionFilePath;
				 /* myTempWindow = window.open(data.billItemsFilePath,'','left=10000,screenX=10000');
				  myTempWindow.document.execCommand('SaveAs','null','POLL05.DOS');
				  myTempWindow.close();*/
				  var anchor = document.createElement('a');
				  anchor.href = data.billItemsFilePath;
				  anchor.target = '_blank';
				  anchor.download = '';
				  anchor.click();
				  var anchor = document.createElement('a');
				  anchor.href = data.billTransactionFilePath;
				  anchor.target = '_blank';
				  anchor.download = '';
				  anchor.click();
				  $("#billItemsFilePath").attr("href",data.billItemsFilePath);
				  $("#billTransactionFilePath").attr("href",data.billTransactionFilePath);
				  //$('#billTransactionFilePath').find('a').trigger('click');
				/*  $.fileDownload(data.billItemsFilePath);*/
				  $("#billTransactionFilePath").trigger("href");
				$("#loading").css("display","none");
				$("#mainDiv").removeClass('disabled')
			},
			error : function() {
				 $("#loading").css("display","none");
	 			 $("#mainDiv").removeClass('disabled');
			}
		});
}


function selectAllExports(ele,id){
	
	debugger;
		
	var i = [];
	i=	$("checkbox[id^='"+id+"']");
	
		var checkboxes = document.getElementsByName(id);		
		
		
		for ( var i = 0; i < checkboxes.length; i++) {
		
			 checkboxes[i].checked = ele.checked;
			
		
		}
		

		
		$('input:checkbox[id^="'+id+'"]:checked').each(function(){
		   /// alert($(this).attr("id"));
			enableFilesBrowse(this,$(this).attr("id"),id);
		
		});
		
		 $('input:checkbox[id^="'+id+'"]:not(:checked)').each(function () {
			 
			 	enableFilesBrowse(this,$(this).attr("id"),id);
				
			});
		 
		 if(id=="billing")
			 {
			 var dateTime = getCurrentDate();
			  var date = dateTime.split(' ');
			  date = date[0].split('/');
			  var formatedDate = date[1]+"/"+date[0]+"/"+date[2];
			  var startDate = formatedDate;
			  ///console.log("startDate:::"+startDate);
			  $("#billingAllFrom").val(startDate);
			  $("#billingAllTo").val(startDate);
			  
			  $("#billingReturnedFrom").val(startDate);
			  $("#billingReturnedTo").val(startDate);
			  
			  $("#billingCancelledFrom").val(startDate);
			  $("#billingCancelledTo").val(startDate);
			  
			  $("#billingExchangedFrom").val(startDate);
			  $("#billingExchangedTo").val(startDate);
			  
			  $("#billingCompletedFrom").val(startDate);
			  $("#billingCompletedTo").val(startDate);
			  
			  $("#billingPendingFrom").val(startDate);
			  $("#billingPendingTo").val(startDate);
			 }
		 
		 
		
 }



/*
function selectAllOutletExports(ele,id){
	
	debugger;
		var checkboxes = document.getElementsByName(id);		
		
		for ( var i = 0; i < checkboxes.length; i++) {
			 checkboxes[i].checked = ele.checked;
		}
		
		var Id= id+"SkuMaster";
		enableFilesOutletBrowse(this,Id,id);
		
		
		
 }

function selectAllWareHouseExports(ele,id){
	
	debugger;
		var checkboxes = document.getElementsByName(id);		
		
		for ( var i = 0; i < checkboxes.length; i++) {
		
			 checkboxes[i].checked = ele.checked;
			
		
		}
		
		var Id= id+"SkuMaster";
		enableFilesBrowse(this,Id,id);
		
		
		
 }*/


function viewftppopup(ele,id){	
	if(ele.value=='ftp')
	{
   $('.dialog'+id).css("display","block");
	}
else{
	$('.dialog'+id).css("display","none");
}
	
}


function enableFilesBrowse(ele,id,flow){
//	$("#Error").html('');
debugger
	var bcount=0;
	 var contextPath = $("#contextPath").val();
	/*if (ele != '')
	   id = $(ele).attr("id");*/
	 
	 var checkbox=false;
	 $('input:checkbox[id^="'+flow+'"]:checked').each(function(){
		    //alert($(this).attr("id"));
		    checkbox=true;
		
		});
	 
	 $('input:checkbox[id^="'+flow+'"]:not(:checked)').each(function () {
//		alert($(this).attr("id"));
         bcount++;
     });
	
		 
	if($("#"+id).prop('checked')){
	
		$("#"+id+"Location").removeAttr("disabled");
		$("#"+id+"To").removeAttr("disabled");
		$("#"+id+"To").attr("readonly",false);
		$("#"+id+"From").removeAttr("disabled");
		$("#"+id+"From").attr("readonly",false);
	}
	else{
		replaceWithNewFileType(id);
		
		$("#"+id+"Location").attr("disabled","disabled");
		$("#"+id+"To").attr("disabled","disabled");
		$("#"+id+"From").attr("disabled","disabled");
		$("#"+id+"To").attr("readonly",true);
		$("#"+id+"From").attr("readonly",true);
		$("#"+id+"To").val("");
		$("#"+id+"From").val("");
	
	}
	$("#"+id+"Img").closest('span').css("visibility","hidden");
	$("#"+id+"Img").attr("src",contextPath+"/images/circleWait.gif");
	$("#"+id+"File").val("");
	
	if(!checkbox)
		{
		$("#"+flow+"ExportType").attr("disabled","disabled");
		$("#"+flow+"FileType").attr("disabled","disabled");
		$("#"+flow+"ExportMode").attr("disabled","disabled");
		
		$('#'+flow).attr('checked', false);
		}
	
	if(checkbox)
		{
			$("#"+flow+"ExportType").removeAttr("disabled");
			$("#"+flow+"FileType").removeAttr("disabled");
			$("#"+flow+"ExportMode").removeAttr("disabled");
			if((bcount) === 0)
				$('#select'+flow).prop('checked', true);
			if(bcount >= 1)
				$('#select'+flow).prop('checked', false);
		}
	
}



function resetFiles(){
	//debugger;
	$("#Error").html('');
	 var contextPath = $("#contextPath").val();
	 $("input:file").each(function(e){
		var id = $(this).attr("id");
		
		id = id.replace('Btn','');
	
		$("#"+id).prop('checked',false);
		
		enableFilesBrowse('',id);
	 });
	 	
}

function resetOnName(Name)
{
	debugger;
	$('#errBillDates').html("");
	$("input[name='"+Name+"']:checkbox").prop('checked',false);
	
	selectAllExports(this,Name);
	 
}




$("#suppliersProductCatolog").each(function(i){
    $(this).on("change", function(event){
        alert("The . paragraph has data: ");
    });
});



function exportShipments(ele) {
	//debugger
	if ($("#shipmentsExportMode").val() != '') {
		var type = $("#shipmentsFileType").val();
		if ($('#shipmentsReciept').prop('checked')) {
			var startdate = $("#shipmentsRecieptFrom").val();
			var enddate = $("#shipmentsRecieptTo").val();
			var location = $("#shipmentsRecieptLocation").val();
			exportShipmentReceipts(this, location, startdate, enddate,type);
		}
	}
	else{
		alert("select  type of export");
	}
}

function exportShipmentReceipts(ele,location,startdate,enddate,type){
	var contextPath = $("#contextPath").val();
	URL = contextPath + "/dataManagement/exportShipmentReceipt.do";
	debugger
	$.ajax({
		type: "GET",
		url : URL,
		data : {
			enddate : enddate,
			startDate :startdate,
			location : location,
			type : type
		},
		beforeSend: function(xhr){  
			$("#loading").css("display","block");
			$("#mainDiv").addClass("disabled");
		},
		success : function(result) {
			data=JSON.parse(JSON.stringify(result));
			console.info(data);
			var anchor = document.createElement('a');
			var link = "";
			if(data.filePath == null)
			{
				link  =	data.salesReportFilePath;
			}
			else
			{
				link  =	data.filePath;
			}
			anchor.href = link;
			anchor.target = '_blank';
			anchor.download = '';
			anchor.click();
			$("#loading").css("display","none");
			$("#mainDiv").removeClass('disabled')
		},
		error : function() {
			$("#loading").css("display","none");
			$("#mainDiv").removeClass('disabled');
		}
	});
}



$(document).ready(function() {

	//debugger
	

	
	 $('input:checkbox[id^="productCatelogueGeneric"]:not(:checked)').each(function () {
	
		 callCalender($(this).attr("id")+"From");
		 callCalender($(this).attr("id")+"To");
		 	
		});
	 


	 
	 $('input:checkbox[id^="billing"]:not(:checked)').each(function () {
		 
		 
		 callCalender($(this).attr("id")+"From");
		 callCalender($(this).attr("id")+"To");
		
		});

	 $('input:checkbox[id^="outletCustomerOrders"]:not(:checked)').each(function () {
		 
		 callCalender($(this).attr("id")+"From");
		 callCalender($(this).attr("id")+"To");
		 
		});
			$('input:checkbox[id^="shipments"]:not(:checked)').each(function () {
		 
		 callCalender($(this).attr("id")+"From");
		 callCalender($(this).attr("id")+"To");
		 
		});
	
			$('input:checkbox[id^="inventory"]:not(:checked)').each(function () {
				 
				 callCalender($(this).attr("id")+"From");
				 callCalender($(this).attr("id")+"To");
				 	
				});
			$('input:checkbox[id^="dealsAndOffers"]:not(:checked)').each(function () {
				 
				 callCalender($(this).attr("id")+"From");
				 callCalender($(this).attr("id")+"To");
					
				});
			
			$('input:checkbox[id^="loyaltyProgram"]:not(:checked)').each(function () {
			 
			 callCalender($(this).attr("id")+"From");
			 callCalender($(this).attr("id")+"To");
			 	
			});
			$('input:checkbox[id^="CRM"]:not(:checked)').each(function () {
			 
			 callCalender($(this).attr("id")+"From");
			 callCalender($(this).attr("id")+"To");
			 	
			});
			

		$(".subBlock").hide();


	
});
function activateHeader(id, open) {
	//debugger;
	$(".subBlock").each(function() {
		$(this).slideUp("fast");
	});
	var headerImg = $("#" + id + "Img").attr("src");
	var subBlockOpened = false;
	if (headerImg.indexOf('right') != -1) {
		subBlockOpened = true;
	}
	var contextPath = $("#contextPath").val();
	var img = contextPath + "/images/leftHeaderIconGreen.png";
	$(".headerImg").each(function() {
		$(this).attr("src", img);
	});
	if (subBlockOpened == true) {
		return;
	}
	$("#" + id + "Img").attr("src",
			contextPath + "/images/rightHeaderIconGreen.png");
	$("." + id).slideDown("fast");
	
}



//added by vijay
function exportMasters(className)
{
	

	debugger;
	if(className == 'billing')
		exportBills();
	else
	$('input.'+className+':checkbox:checked').each(function () 
			{
				
			if($(this).val() == "shipmentsReciept")
				exportShipments(this);
			else
				exportFiles($(this).val(),className); 
			//console.log($(this).val());
			});
}




function exportFiles(id,className){
	
debugger;
var replaceid = "";
if(id == "WarehouseSku"){
	replaceid = id;
	id="Sku";
	
}

	var location = ""
		if($("#"+className+id+"Location").val() != null && typeof $("#"+className+id+"Location").val() != "undefined")
			location = $("#"+className+id+"Location").val() ;

	
	
	
	var startDate = ""
		if($("#"+className+id+"From").val() != null && typeof $("#"+className+id+"From").val() != "undefined")
			startDate = $("#"+className+id+"From").val() ;
	
	var endDate = ""
		if($("#"+className+id+"To").val() != null && typeof $("#"+className+id+"To").val() != "undefined")
			endDate = $("#"+className+id+"To").val() ;
	
	
	if(replaceid == "WarehouseSku"){
		id = replaceid;

	}
	var fileType = ""
		if($("#"+className+id+"FileType").val() != null && typeof $("#"+className+id+"FileType").val() != "undefined")
			fileType = $("#"+className+id+"FileType").val() ;
	
	var exportType = ""
		if($("#"+className+id+"ExportType").val() != null && typeof $("#"+className+id+"ExportType").val() != "undefined")
			exportType = $("#"+className+id+"ExportType").val() ;

	var contextPath = $("#contextPath").val();
	URL = contextPath + "/dataManagement/exportFiles.do";

	$.ajax({
		type: "GET",
		url : URL,
		data : {
			endDate : endDate,
			startDate :startDate,
			location : location,
			flow : id
		},
		beforeSend: function(xhr){  
			$("#loading").css("display","block");
			$("#mainDiv").addClass("disabled");
		},
		success : function(result) {
			debugger;
			data=JSON.parse(JSON.stringify(result));
			console.info(data);
			var anchor = document.createElement('a');
			anchor.href = data.filePath;
			anchor.target = '_blank';
			anchor.download = '';
			anchor.click();
			$("#loading").css("display","none");
			$("#mainDiv").removeClass('disabled')
		},
		error : function() {
			$("#loading").css("display","none");
			$("#mainDiv").removeClass('disabled');
		}
	});
}






