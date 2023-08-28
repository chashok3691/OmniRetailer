/* Project Name 	        : OmniRetailerCustomer
 * Written By		        : Manoj...
 * file name		        : bachOperations.js
 * 
 */

function replacePeriodicTypes(){
	debugger;
	 var periodicType = $("#periodicType").val();
	 
	if(periodicType == "Daily"){
		document.getElementById("excutionTime").value = "Select Execution Time";
		
		$("#setExecutionTime").css("display","block");
		$("#weeklyExecution").css("display","none");
		$("#dateforMonthly").css("display","none");
		$("#nthDayExecution").css("display","none");
		
	}else if(periodicType == "Weekly"){
		document.getElementById("weeklysartTime").value = "Select Execution Time";
		
		$("#setExecutionTime").css("display","none");
		$("#weeklyExecution").css("display","block");
		$("#dateforMonthly").css("display","none");
		$("#nthDayExecution").css("display","none");
	
	}else if(periodicType == "Monthly"){
		$("#setExecutionTime").css("display","none");
		$("#weeklyExecution").css("display","none");
		$("#dateforMonthly").css("display","block");
		$("#nthDayExecution").css("display","none");
	
	}else if(periodicType == "nDays"){
		$("#setExecutionTime").css("display","none");
		$("#weeklyExecution").css("display","none");
		$("#dateforMonthly").css("display","none");
		$("#nthDayExecution").css("display","block");
	
	}	
}


function selectOperations(){
	debugger;
	//$("#Error").html("");
	$("#batchNameError").html("");
	$("#subOperationError").html("");
	$("#batchStatusError").html("");
	var mainOperation = $("#batchMainOption").val();
	 
	if(mainOperation == "Reports"){
		
		$("#optionBatch").css("display","none");
		
		$("#ItemWise").css("display","block");
		$("#Datewise").css("display","block");
		$("#CategoryWise").css("display","block");
		$("#DepartmentWise").css("display","block");
		$("#SupplierWise").css("display","block");
		$("#SalesVSprocurement").css("display","block");
		$("#ItemWiseTax").css("display","block");
		$("#Profitability").css("display","block");
		$("#DSR").css("display","block");
		$("#Purchases").css("display","block");
		$("#DateWiseMail").css("display","block");
		
		$("#Incremental").css("display","none");
		$("#Absolute").css("display","none");
		
		$("#SKUMasterData").css("display","none");
		$("#SalesBilling").css("display","none");
		$("#PurchaseGRN").css("display","none");
		$("#POSSAPOffline").css("display","none");
		$("#POSSAPOnline").css("display","none");
		$("#WarehouseStocktransfer").css("display","none");
		$("#OutletStockReceipt").css("display","none");
		
		$("#SyncSkuMaster").css("display","none");
		$("#SyncBillsData").css("display","none");
		$("#SyncCustomerData").css("display","none");
		$("#SyncCustomerLoyaltyPoints").css("display","none");
		
		$("#PushCompletedBills").css("display","none");
		$("#PushReturnBills").css("display","none");
		$("#PosToSap-Idoc").css("display","none");
		$("#PosToSap-Csv").css("display","none");
		$("#Order").css("display","none");
		$("#pushOrders").css("display","none");
		$("#dailyStock").css("display","none");
		$("#ItemWiseTax").css("display","none");
		
	}else if(mainOperation == "DatabaseBackup"){
		
		$("#optionBatch").css("display","none");
		
		$("#ItemWise").css("display","none");
		$("#Datewise").css("display","none");
		$("#CategoryWise").css("display","none");
		$("#DepartmentWise").css("display","none");
		$("#SupplierWise").css("display","none");
		$("#SalesVSprocurement").css("display","none");
		$("#ItemWiseTax").css("display","none");
		$("#Profitability").css("display","none");
		$("#DSR").css("display","none");
		$("#Purchases").css("display","none");
		
		$("#Incremental").css("display","block");
		$("#Absolute").css("display","block");
		$("#Order").css("display","none");
		$("#pushOrders").css("display","none");
		$("#SKUMasterData").css("display","none");
		$("#SalesBilling").css("display","none");
		$("#PurchaseGRN").css("display","none");
		$("#POSSAPOffline").css("display","none");
		$("#POSSAPOnline").css("display","none");
		$("#WarehouseStocktransfer").css("display","none");
		$("#OutletStockReceipt").css("display","none");
	
		$("#PosToSap-Idoc").css("display","none");
		$("#PosToSap-Csv").css("display","none");
		$("#dailyStock").css("display","none");
		
		$("#PushCompletedBills").css("display","none");
		$("#SyncBillsData").css("display","none");
		$("#SyncCustomerData").css("display","none");
		$("#SyncSkuMaster").css("display","none");
		$("#SyncCustomerLoyaltyPoints").css("display","none");
		$("#PushReturnBills").css("display","none");
		$("#ItemWiseTax").css("display","none");
		$("#DateWiseMail").css("display","none");
		
	}else if(mainOperation == "Collaboration"){
		
		$("#optionBatch").css("display","none");
		$("#DateWiseMail").css("display","none");
		$("#ItemWise").css("display","none");
		$("#Datewise").css("display","none");
		$("#CategoryWise").css("display","none");
		$("#DepartmentWise").css("display","none");
		$("#SupplierWise").css("display","none");
		$("#SalesVSprocurement").css("display","none");
		$("#ItemWiseTax").css("display","none");
		$("#Profitability").css("display","none");
		$("#DSR").css("display","none");
		$("#Purchases").css("display","none");
		
		$("#Incremental").css("display","none");
		$("#Absolute").css("display","none");
		$("#Order").css("display","none");
		$("#pushOrders").css("display","none");
		$("#SKUMasterData").css("display","none");
		$("#SalesBilling").css("display","none");
		$("#PurchaseGRN").css("display","none");
		$("#POSSAPOffline").css("display","none");
		$("#POSSAPOnline").css("display","none");
		$("#WarehouseStocktransfer").css("display","none");
		$("#OutletStockReceipt").css("display","none");
		$("#dailyStock").css("display","none");
		$("#ItemWiseTax").css("display","none");
		$("#DateWiseMail").css("display","none");
	}
else if(mainOperation == "FTPReports"){
	
	$("#ItemWiseTax").css("display","none");
	$("#DateWiseMail").css("display","none");
	$("#optionBatch").css("display","none");
	$("#ItemWise").css("display","none");
	$("#Datewise").css("display","none");
	$("#CategoryWise").css("display","none");
	$("#DepartmentWise").css("display","none");
	$("#SupplierWise").css("display","none");
	$("#SalesVSprocurement").css("display","none");
	$("#ItemWiseTax").css("display","none");
	$("#Profitability").css("display","none");
	$("#DSR").css("display","none");
	$("#Purchases").css("display","none");
	$("#Incremental").css("display","none");
	$("#Absolute").css("display","none");
	$("#Order").css("display","none");
	$("#pushOrders").css("display","none");
	$("#SKUMasterData").css("display","none");
	$("#SalesBilling").css("display","none");
	$("#PurchaseGRN").css("display","none");
	$("#POSSAPOffline").css("display","none");
	$("#POSSAPOnline").css("display","none");
	$("#WarehouseStocktransfer").css("display","none");
	$("#OutletStockReceipt").css("display","none");
	$("#PosToSap-Idoc").css("display","none");
	$("#PosToSap-Csv").css("display","none");
	$("#dailyStock").css("display","none");
	$("#PushCompletedBills").css("display","none");
	$("#SyncBillsData").css("display","none");
	$("#SyncCustomerData").css("display","none");
	$("#SyncSkuMaster").css("display","none");
	$("#SyncCustomerLoyaltyPoints").css("display","none");
	$("#PushReturnBills").css("display","none");
	$("#PushCompletedBills").css("display","none");
	$("#SyncSkuMaster").css("display","none");

	
	
	}
	else if(mainOperation == "DataExport"){
		
		$("#optionBatch").css("display","none");
		$("#DateWiseMail").css("display","none");
		$("#ItemWise").css("display","none");
		$("#Datewise").css("display","none");
		$("#CategoryWise").css("display","none");
		$("#DepartmentWise").css("display","none");
		$("#SupplierWise").css("display","none");
		$("#SalesVSprocurement").css("display","none");
		$("#ItemWiseTax").css("display","none");
		$("#Profitability").css("display","none");
		$("#DSR").css("display","none");
		$("#Purchases").css("display","none");
		
		$("#Incremental").css("display","none");
		$("#Absolute").css("display","none");
		$("#Order").css("display","none");
		$("#pushOrders").css("display","none");
		$("#SKUMasterData").css("display","block");
		$("#SalesBilling").css("display","block");
		$("#PurchaseGRN").css("display","block");
		$("#POSSAPOffline").css("display","block");
		$("#POSSAPOnline").css("display","block");
		$("#WarehouseStocktransfer").css("display","block");
		$("#OutletStockReceipt").css("display","block");
		$("#dailyStock").css("display","none");
		$("#ItemWiseTax").css("display","none");
		
	}else if(mainOperation == "DataImport"){
		$("#optionBatch").css("display","none");
		$("#DateWiseMail").css("display","none");
		$("#ItemWise").css("display","none");
		$("#Datewise").css("display","none");
		$("#CategoryWise").css("display","none");
		$("#DepartmentWise").css("display","none");
		$("#SupplierWise").css("display","none");
		$("#SalesVSprocurement").css("display","none");
		$("#ItemWiseTax").css("display","none");
		$("#Profitability").css("display","none");
		$("#DSR").css("display","none");
		$("#Purchases").css("display","none");
		
		$("#Incremental").css("display","none");
		$("#Absolute").css("display","none");
		
		$("#SKUMasterData").css("display","none");
		$("#SalesBilling").css("display","none");
		$("#PurchaseGRN").css("display","none");
		$("#POSSAPOffline").css("display","none");
		$("#POSSAPOnline").css("display","none");
		$("#WarehouseStocktransfer").css("display","none");
		$("#OutletStockReceipt").css("display","none");
		$("#Order").css("display","none");
		$("#pushOrders").css("display","none");
		$("#dailyStock").css("display","none");
		$("#ItemWiseTax").css("display","none");
		
	}else if(mainOperation == "IntegrationAPI"){
		$("#optionBatch").css("display","none");
		$("#DateWiseMail").css("display","none");
		$("#ItemWise").css("display","none");
		$("#Datewise").css("display","none");
		$("#CategoryWise").css("display","none");
		$("#DepartmentWise").css("display","none");
		$("#SupplierWise").css("display","none");
		$("#SalesVSprocurement").css("display","none");
		$("#ItemWiseTax").css("display","none");
		$("#Profitability").css("display","none");
		$("#DSR").css("display","none");
		$("#Purchases").css("display","none");
		
		$("#Incremental").css("display","none");
		$("#Absolute").css("display","none");
		
		$("#SKUMasterData").css("display","none");
		$("#SalesBilling").css("display","none");
		$("#PurchaseGRN").css("display","none");
		$("#POSSAPOffline").css("display","none");
		$("#POSSAPOnline").css("display","none");
		$("#WarehouseStocktransfer").css("display","none");
		$("#OutletStockReceipt").css("display","none");
		$("#Order").css("display","none");
		$("#pushOrders").css("display","none");
		$("#dailyStock").css("display","none");
	
	}else if(mainOperation == "UsageLog"){
		$("#optionBatch").css("display","none");
		$("#DateWiseMail").css("display","none");
		$("#ItemWise").css("display","none");
		$("#Datewise").css("display","none");
		$("#CategoryWise").css("display","none");
		$("#DepartmentWise").css("display","none");
		$("#SupplierWise").css("display","none");
		$("#SalesVSprocurement").css("display","none");
		$("#ItemWiseTax").css("display","none");
		$("#Profitability").css("display","none");
		$("#DSR").css("display","none");
		$("#Purchases").css("display","none");
		
		$("#Incremental").css("display","none");
		$("#Absolute").css("display","none");
		
		$("#SKUMasterData").css("display","none");
		$("#SalesBilling").css("display","none");
		$("#PurchaseGRN").css("display","none");
		$("#POSSAPOffline").css("display","none");
		$("#POSSAPOnline").css("display","none");
		$("#WarehouseStocktransfer").css("display","none");
		$("#OutletStockReceipt").css("display","none");
		$("#Order").css("display","none");
		$("#pushOrders").css("display","none");
		$("#dailyStock").css("display","none");
	
	}else if(mainOperation == "ExceptionLog"){
		$("#optionBatch").css("display","none");
		$("#DateWiseMail").css("display","none");
		$("#ItemWise").css("display","none");
		$("#Datewise").css("display","none");
		$("#CategoryWise").css("display","none");
		$("#DepartmentWise").css("display","none");
		$("#SupplierWise").css("display","none");
		$("#SalesVSprocurement").css("display","none");
		$("#ItemWiseTax").css("display","none");
		$("#Profitability").css("display","none");
		$("#DSR").css("display","none");
		$("#Purchases").css("display","none");
		
		$("#Incremental").css("display","none");
		$("#Absolute").css("display","none");
		
		$("#SKUMasterData").css("display","none");
		$("#SalesBilling").css("display","none");
		$("#PurchaseGRN").css("display","none");
		$("#POSSAPOffline").css("display","none");
		$("#POSSAPOnline").css("display","none");
		$("#WarehouseStocktransfer").css("display","none");
		$("#OutletStockReceipt").css("display","none");
		$("#Order").css("display","none");
		$("#pushOrders").css("display","none");
		$("#dailyStock").css("display","none");
	
	}else if(mainOperation == "PosToSap")	{
		$("#optionBatch").css("display","none");
		$("#ItemWise").css("display","none");
		$("#Datewise").css("display","none");
		$("#CategoryWise").css("display","none");
		$("#DepartmentWise").css("display","none");
		$("#SupplierWise").css("display","none");
		$("#SalesVSprocurement").css("display","none");
		$("#ItemWiseTax").css("display","none");
		$("#Profitability").css("display","none");
		$("#DSR").css("display","none");
		$("#Purchases").css("display","none");
		
		$("#Incremental").css("display","none");
		$("#Absolute").css("display","none");
		
		$("#SKUMasterData").css("display","none");
		$("#SalesBilling").css("display","none");
		$("#PurchaseGRN").css("display","none");
		$("#POSSAPOffline").css("display","none");
		$("#POSSAPOnline").css("display","none");
		$("#WarehouseStocktransfer").css("display","none");
		$("#OutletStockReceipt").css("display","none");
		$("#Order").css("display","none");
		$("#pushOrders").css("display","none");
		
		$("#PosToSap-Idoc").css("display","block");
		$("#PosToSap-Csv").css("display","block");
		$("#dailyStock").css("display","none");
		$("#DateWiseMail").css("display","none");
	}else if(mainOperation == "PushBills"){
		$("#optionBatch").css("display","none");
		$("#ItemWise").css("display","none");
		$("#Datewise").css("display","none");
		$("#CategoryWise").css("display","none");
		$("#DepartmentWise").css("display","none");
		$("#SupplierWise").css("display","none");
		$("#SalesVSprocurement").css("display","none");
		$("#ItemWiseTax").css("display","none");
		$("#Profitability").css("display","none");
		$("#DSR").css("display","none");
		$("#Purchases").css("display","none");
		
		$("#Incremental").css("display","none");
		$("#Absolute").css("display","none");
		$("#Order").css("display","none");
		$("#pushOrders").css("display","none");
		$("#SKUMasterData").css("display","none");
		$("#SalesBilling").css("display","none");
		$("#PurchaseGRN").css("display","none");
		$("#POSSAPOffline").css("display","none");
		$("#POSSAPOnline").css("display","none");
		$("#WarehouseStocktransfer").css("display","none");
		$("#OutletStockReceipt").css("display","none");
		$("#PosToSap-Idoc").css("display","none");
		$("#PosToSap-Csv").css("display","none");
		$("#SyncSkuMaster").css("display","none");
		$("#SyncBillsData").css("display","none");
		$("#SyncCustomerData").css("display","none");
		$("#SyncCustomerLoyaltyPoints").css("display","none");
		$("#PushCompletedBills").css("display","block");
		$("#PushReturnBills").css("display","block");
		$("#dailyStock").css("display","none");
		$("#DateWiseMail").css("display","none");
	}else if(mainOperation == "SyncData"){
		$("#optionBatch").css("display","none");
		$("#ItemWise").css("display","none");
		$("#Datewise").css("display","none");
		$("#CategoryWise").css("display","none");
		$("#DepartmentWise").css("display","none");
		$("#SupplierWise").css("display","none");
		$("#SalesVSprocurement").css("display","none");
		$("#ItemWiseTax").css("display","none");
		$("#Profitability").css("display","none");
		$("#DSR").css("display","none");
		$("#Purchases").css("display","none");
		
		$("#Incremental").css("display","none");
		$("#Absolute").css("display","none");
		
		$("#SKUMasterData").css("display","none");
		$("#SalesBilling").css("display","none");
		$("#PurchaseGRN").css("display","none");
		$("#POSSAPOffline").css("display","none");
		$("#POSSAPOnline").css("display","none");
		$("#WarehouseStocktransfer").css("display","none");
		$("#OutletStockReceipt").css("display","none");
		$("#PosToSap-Idoc").css("display","none");
		$("#PosToSap-Csv").css("display","none");
		$("#PushCompletedBills").css("display","none");
		$("#PushReturnBills").css("display","none");
		$("#Order").css("display","none");
		$("#pushOrders").css("display","none");
		$("#SyncSkuMaster").css("display","block");
		$("#SyncBillsData").css("display","block");
		$("#SyncCustomerData").css("display","block");
		$("#SyncCustomerLoyaltyPoints").css("display","block");
		$("#dailyStock").css("display","none");
		$("#DateWiseMail").css("display","none");
		
	}else if(mainOperation == "Orders"){
		$("#optionBatch").css("display","none");
		$("#ItemWise").css("display","none");
		$("#Datewise").css("display","none");
		$("#CategoryWise").css("display","none");
		$("#DepartmentWise").css("display","none");
		$("#SupplierWise").css("display","none");
		$("#SalesVSprocurement").css("display","none");
		$("#ItemWiseTax").css("display","none");
		$("#Profitability").css("display","none");
		$("#DSR").css("display","none");
		$("#Purchases").css("display","none");
		
		$("#Incremental").css("display","none");
		$("#Absolute").css("display","none");
		
		$("#SKUMasterData").css("display","none");
		$("#SalesBilling").css("display","none");
		$("#PurchaseGRN").css("display","none");
		$("#POSSAPOffline").css("display","none");
		$("#POSSAPOnline").css("display","none");
		$("#WarehouseStocktransfer").css("display","none");
		$("#OutletStockReceipt").css("display","none");
		$("#PosToSap-Idoc").css("display","none");
		$("#PosToSap-Csv").css("display","none");
		$("#PushCompletedBills").css("display","none");
		$("#PushReturnBills").css("display","none");
		
		$("#SyncSkuMaster").css("display","none");
		$("#SyncBillsData").css("display","none");
		$("#SyncCustomerData").css("display","none");
		$("#SyncCustomerLoyaltyPoints").css("display","none");
		
		$("#Order").css("display","block");
		$("#pushOrders").css("display","block");
		$("#dailyStock").css("display","none");
		$("#DateWiseMail").css("display","none");
		
	}else if(mainOperation == "StockHistory"){
		$("#optionBatch").css("display","none");
		$("#ItemWise").css("display","none");
		$("#Datewise").css("display","none");
		$("#CategoryWise").css("display","none");
		$("#DepartmentWise").css("display","none");
		$("#SupplierWise").css("display","none");
		$("#SalesVSprocurement").css("display","none");
		$("#ItemWiseTax").css("display","none");
		$("#Profitability").css("display","none");
		$("#DSR").css("display","none");
		$("#Purchases").css("display","none");
		
		$("#Incremental").css("display","none");
		$("#Absolute").css("display","none");
		
		$("#SKUMasterData").css("display","none");
		$("#SalesBilling").css("display","none");
		$("#PurchaseGRN").css("display","none");
		$("#POSSAPOffline").css("display","none");
		$("#POSSAPOnline").css("display","none");
		$("#WarehouseStocktransfer").css("display","none");
		$("#OutletStockReceipt").css("display","none");
		$("#PosToSap-Idoc").css("display","none");
		$("#PosToSap-Csv").css("display","none");
		$("#PushCompletedBills").css("display","none");
		$("#PushReturnBills").css("display","none");
		
		$("#SyncSkuMaster").css("display","none");
		$("#SyncBillsData").css("display","none");
		$("#SyncCustomerData").css("display","none");
		$("#SyncCustomerLoyaltyPoints").css("display","none");
		
		$("#Order").css("display","none");
		$("#pushOrders").css("display","none");
		$("#dailyStock").css("display","block");
		$("#DateWiseMail").css("display","none");
		
	}

}


function parseDateDDMMYYYY(str) {
	debugger;
    var mdy = str.split('/');
    var yr = mdy[2].split(' ');
    return new Date(yr[0], mdy[0]-1, mdy[1]);
}

function daydiff(first, second) {
	debugger;
    return (second-first)/(1000*60*60*24);
}

function viewNewBatchOperation(id){
	debugger;
	try{
		var online = window.navigator.onLine;
	  	if(!online){
	  	alert("Check your internet connection,Please try agian after some time.");
	  	return;
	  	}
	  	
	var contextPath = $('#contextPath').val();
	 var URL = contextPath + "/dataManagement/viewNewBatchOperation.do";
	 $.ajax({
		type : "GET",
		url : URL,
		data : {},
		beforeSend: function(xhr){                    
	   		$("#loading").css("display","block");
	   		$("#mainDiv").addClass("disabled");
	   	},
		success : function(result){
			$('#right-side').html(result);
			if(id != undefined)
				activeMenu(id);
			openMenu("liDataManagement", "ulDataManagement",0);
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



function appendBatches(id1,id2){
	debugger;
	$("#Error").html("");
	$("#batchNameError").html("");
	$("#subOperationError").html("");
	$("#batchStatusError").html("");
	
	var mainBatch = $("#"+id1).val();
	var subBatch = $("#"+id2).val();
	if(mainBatch == null || mainBatch == undefined){
		$("#Error").text("Please Select Main Operation");
		return;
	}
	if(subBatch == null || subBatch == undefined){
		$("#Error").text("Please Select Sub Operation");
		return;
	}
	
	var batches = mainBatch+"|"+subBatch;
	var appendFlag=true;
	
	if(batches.trim() != ''){
		$("#batchesList > option").each(function(){
			
			if($(this).val()==batches)  // to check for given section
											// value is in selected list
				appendFlag=false;
		});
		if(appendFlag)
	$("#batchesList").append('<option value='+batches+'>'+batches+'</option>');
		else
	$("#subOperationError").text("This Operation Already Exists");
	}
	
	if(appendFlag){
		$("#batchMainOption").css("pointer-events","none");
		$("#batchMainOption").css("background","lightgray");
	}
	/*$("#"+id1).val("");
	$("#"+id2).val("");*/
}


/*function clearBatches(){
	debugger;
	$("#batchMainOption").css("pointer-events","all");
	$("#batchMainOption").css("background","none");
	var section = document.getElementById("batchesList");
	var length = $("#batchesList option").length;
	for (i = length-1; i >= 0; i--) {
		$("#batchesList option").remove(i);
		}
	}*/


function clearBatches(){
	debugger;
	$("#Error").html("");
	$("#batchNameError").html("");
	$("#subOperationError").html("");
	$("#batchStatusError").html("");
	
	$("#batchMainOption").css("pointer-events","all");
	$("#batchMainOption").css("background","none");
	var section = document.getElementById("batchesList");
	var length = $("#batchesList option").length;
	for (i = length-1; i >= 0; i--) {
		$("#batchesList option").remove(i);
		}
	
	$("#batchMainOption").val("");
	$("#batchSubOption").val("");
	}
	
function isPeriodicCheck(){
        debugger;
         if (document.querySelector('#isPeriodic').checked) {
                 $("#periodicType").css("pointer-events","all");
                        $("#periodicType").css("display","block");
                        $("#from").addClass('disabled');
                        $("#from").css("background","lightgray");
                        $("#startTime").addClass('disabled');
						$("#from").val("");
						$("#startTime").val("");
                        
            } else {
                    $("#periodicType").css("pointer-events","none");
                    $("#periodicType").css("display","none");
					$("#periodicType").val("");
                    $("#from").css("background","none");
                    $("#from").removeClass('disabled');
                    $("#startTime").removeClass('disabled');
					$("#setExecutionTime").css("display","none");
					$("#weeklyExecution").css("display","none");
					$("#dateforMonthly").css("display","none");
					$("#nthDayExecution").css("display","none");

            }
}



function validateBatch(operation){
	debugger;
	$('#Success').html("");
	$("#Error").html("");
	$("#batchNameError").html("");
	$("#subOperationError").html("");
	$("#batchStatusError").html("");
	
		 try{
			// purpose:for checking internet conection
			var online = window.navigator.onLine;
		  	if(!online){
		  	alert("Check your internet connection,Please try agian after some time.");
		  	return;
		  	}
			 
		  	 var batchName = $("#batchName").val();
		     if(batchName.trim() == ""){
		  	   	 $("#batchName").focus();
		  	   	$("#batchNameError").html("Batch Name Required");
		  	   	return false;
		  	   }
		     
		     var status = $("#batchStatus").val();
		     if(status == "" || status == null || status == undefined){
		  	   	 $("#batchStatus").focus();
		  	   	$("#batchStatusError").html("Please Select Status");
		  	   	return false;
		  	   }
		     
		     var batchDescription = $("#batchDescription").val();
		     var batchMainOperation = $("#batchMainOption").val();
		     var batchSubOperation = $("#batchSubOption").val();
		     
		     var dayList =[];
		     var batchOperations =[]; var finalObj = {},obj = {}, data = {};
		     
		     $("#batchesList > option").each(function(){
		     
		     	obj=$(this).val();
		     	batchOperations.push(obj);
		     });
		     
		     
		     if(batchOperations == "" || batchOperations == null || batchOperations == undefined){
		  	   	 $("#batchesList").focus();
		  	   	$("#Error").html("Please Add Batches");
		  	   	return false;
		  	   }
		     
		     if($("#isPeriodic").is(':checked')){
		  		 var isPeriodic =  "true";
		  	 }else {
		  	    var	isPeriodic = "false";
		  	 }
		     finalObj.periodic = isPeriodic;
		     
		     if(isPeriodic == "false"){
		     var batchStartDate = $("#from").val();
		     	if(batchStartDate == ""){
		  	   	 $("#from").focus();
		  	   	 $("#Error").html("Please Select Start Date");
		  	   	return false;
		  	   }
		     	var dateTime = getCurrentDate();
			   	var date = dateTime.split(' ');
			   	  date = date[0].split('/');
			   	var formatedDate = date[1]+"/"+date[0]+"/"+date[2];
			   	  
			  	var noOfDaysstart = daydiff(parseDateDDMMYYYY($("#from").val()), parseDateDDMMYYYY(formatedDate));
			  	 
			  	 if(noOfDaysstart > 0){
			  	  $("#Error").html("For Start Date, Past Dates Not allowed"); 
			  	  $("#from").focus();
			  	 return false;
			   		}
			  	 
		  	 var batchStartTime = $("#startTime").val();
		  	 if(batchStartTime == "" || batchStartTime.trim() == "00:00:00"){
		  	   	 $("#startTime").focus();
		  	   	$("#Error").html("Please Select Start Time");
		  	   	return false;
		  	   }
		  	 
		  	if(batchStartDate == "" && batchStartTime == ""){
		  		$("#from").focus();
		    	$("#Error").html("Please Select Batch Timings");
		    		return false;
		     }
		  	
		  	finalObj.startDateStr=batchStartDate;
		    finalObj.startTimeStr = batchStartTime;
		     
		   } else {
		  		 
			   finalObj.startDateStr="";
			   finalObj.startTimeStr = "";
		  		
		  		 var periodicType = $("#periodicType").val();
		  		 if(periodicType == "" || periodicType == null || periodicType == undefined){
		  		   	 $("#periodicType").focus();
		  		   	$("#Error").html("Please Select Periodic Type");
		  		   	return false;
		  		 	}
		  		 if(periodicType == "Daily"){
		  			 var timeforDaily = $("#excutionTime").val();
		  			 if(timeforDaily == "" || timeforDaily == "Select Execution Time"){
		  			   	 $("#excutionTime").focus();
		  			   	$("#Error").html("Please Select Execution Time");
		  			   	return false;
		  			   }
		  			finalObj.dailyBatchTimeStr=timeforDaily;
		  			
		  		 }else if(periodicType == "Weekly"){
		  				if($("#mondayChkbox").is(':checked')){
		  	 					data="Monday";
		  	 					dayList.push(data);
		  	 			}
		  				if($("#tuesdayChkbox").is(':checked')){
		   					data="Tuesday";
		   					dayList.push(data);
		  				}
		  				if($("#wednesdayChkbox").is(':checked')){
		   					data="Wednesday";
		   					dayList.push(data);
		  				}
		  				if($("#thursdayChkbox").is(':checked')){
		   					data="Thursday";
		   					dayList.push(data);
		  				}
		  				if($("#fridayChkbox").is(':checked')){
		   					data="Friday";
		   					dayList.push(data);
		  				}
		  				if($("#saturdayChkbox").is(':checked')){
		   					data="Saturday";
		   					dayList.push(data);
		  				}
		  				if($("#sundayChkbox").is(':checked')){
		   					data="Sunday";
		   					dayList.push(data);
		  				}
		  				finalObj.dayList = dayList;
		  				
		  				var timeforweekly = $("#weeklysartTime").val();
		  				if(timeforweekly == "" || timeforweekly == "Select Execution Time"){
		  				   	$("#weeklysartTime").focus();
		  				   	$("#Error").html("Please Select Execution Time");
		  				   	return false;
		  				   	}
		  				finalObj.execustiomTimeStr = timeforweekly;
		  			
		  			}else if(periodicType == "Monthly"){
		  				
		  				
		  			}else if(periodicType == "nDays") {
		  			
		  				var nthDay = $("#nthDay").val();
		  				finalObj.noOfDDays = nthDay;
		  			}
		  	 }
		     
		     finalObj.role_name=$("#roleName").val();
		     finalObj.batch_title=batchName;
		     finalObj.status=status;
		     finalObj.batch_description=batchDescription;
		     finalObj.batch_operation=batchMainOperation;
		     finalObj.batch_sub_operation=batchSubOperation;
		     finalObj.batchoperations=batchOperations;
		     finalObj.batch_period = periodicType;
		 
		     
		     if(operation=="edit"){
		    	 finalObj.batch_id=$("#batchId").val();
			     finalObj.batch_day=$("#batchDay").val();
			   ////  finalObj.created_on=$("#createdonDate").val();
			     finalObj.createOnStr=$("#createdDateStr").val();
		     }
		     
	    	
				
		  	var contextPath = $("#contextPath").val();
		    if(operation=="new"){
		 	  URL = contextPath + "/dataManagement/createBatch.do";
		 	} else if(operation=="edit"){
		   	 URL = contextPath + "/dataManagement/updateBatch.do";
		   	}
				var formData = JSON.stringify(finalObj);
				console.log(formData);
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
	        			error : function(jqXHR, textStatus, errorThrown)  {
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



function viewEditBatchOperation(batchId,operation){
	debugger;
	$('#Success').html("");
	try{
 	 var contextPath = $("#contextPath").val();
 	 
 	// purpose:for checking internet conection
 	var online = window.navigator.onLine;
   	if(!online){
   	alert("Check your internet connection,Please try agian after some time.");
   	return;
   	}
 	 
 	 URL = contextPath + "/dataManagement/viewEditBatchOperation.do";
		$.ajax({
			type: "GET",
			url : URL,
			data : {
				batchId : batchId,
				operation : operation
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
			error : function(jqXHR, textStatus, errorThrown)  {
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

function Run(batchDate,batchId,operation){
        debugger;
        $('#Success').html("");
        $("#Error").html("");
                 try{
                        // purpose:for checking internet conection
                        var online = window.navigator.onLine;
                          if(!online){
                          alert("Check your internet connection,Please try agian after some time.");
                          return;
                          }
                    var finalObj = {};
                    
                    var batchId=batchId;
                    if(batchId == "" || batchId == null || batchId == undefined){
                             $("#batchId").focus();
                                     $("#Error").html("Please Select Batch Id");
                            batchId = "";
                    }
                    
                   
                    
                          var batchlogStartDate = batchDate;
                          if(batchlogStartDate == "" || batchlogStartDate == null || batchlogStartDate == undefined){
                                     $("#batchDate").focus();
                                     $("#Error").html("Please Select Batch Date");
                                    return false;
                              }
                          
                    finalObj.batch_id=batchId;
                    
                    finalObj.startDateStr=batchlogStartDate;
                    
                          var contextPath = $("#contextPath").val();
                     if(operation=="edit"){
                            URL = contextPath + "/dataManagement/run.do";
                           }
                                var formData = JSON.stringify(finalObj);
                                console.log(formData);
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
                                                /*if(result.includes("success")){
                                                        $('#Success').html(result);
                                                }else{
                                                        $("#Error").html(result);
                                                }*/
                                         $("#right-side").html(result);
                                         $("#loading").css("display","none");
                                         $("#mainDiv").removeClass('disabled');
                                         },
                                        error : function(jqXHR, textStatus, errorThrown)  {
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
                 return false;
             }


/*function Run(batchId){
	debugger;
	 $("#Error").html("");
	$('#Success').html("");
	try{
 	 var contextPath = $("#contextPath").val();
 	 
 	// purpose:for checking internet conection
 	var online = window.navigator.onLine;
   	if(!online){
   	alert("Check your internet connection,Please try agian after some time.");
   	return;
   	}
   	
    var batchlogStartDate = $("#from1").val();
 	if(batchlogStartDate == ""){
	   	 $("#from1").focus();
	   	 $("#Error").html("Please Select Start Date");
	   	return false;
	   }
 	 
 	 URL = contextPath + "/dataManagement/viewEditBatchOperation.do";
		$.ajax({
			type: "GET",
			url : URL,
			data : {
				batchId : batchId,
				operation : batchlogStartDate,
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
			error : function(jqXHR, textStatus, errorThrown)  {
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

  }*/

