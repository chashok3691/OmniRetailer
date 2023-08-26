
//var properFormat = true;
var noOfFiles = 0;
//var savedFiles = 0;
var productFiles;
var skuFiles;
var warehouseskuFiles;
var skuRequestFiles;
var priceListFiles;
var suppliersFiles;
var taxMasterImportFiles;
var importbrandMasterFiles
$("body").on("change", function () {
	noOfFiles =0;
	$("input:file").each(function(e){
		noOfFiles = noOfFiles + $(this)[0].files.length;
	});
	if(noOfFiles == 1)
		$("#Error").html('');
});




function importExcelData(){
	debugger
	var oMyForm = new FormData();
	if(productFiles.length <= 0)
	{
	alert("Please Select Excel Sheet... ");
		return;
	}
	 
//	for(var i = 0; i<productFiles.length; i++)
//		alert(productFiles[i].size);
    oMyForm.append("file", productFiles[0]);
    var contextPath = $("#contextPath").val();
	 URL = contextPath + "/procurement/importExcelData.do";
	 $.ajax({
		  dataType : 'json',
          url : URL,
          data : oMyForm,
          type : "POST",
          enctype: 'multipart/form-data',
          processData: false, 
          contentType:false,
          beforeSend: function(xhr){
        	//  $("#loading").css("display","block");
        	  //$("#productMasterImg").closest('span').css("visibility","visible");
  	   	},
          success : function(skuList) {
        	/*  alert(result);*/
        	/*  var skuList = jQuery.parseJSON(result);
  			$("#searchItems").val("");
  		 * alert
  			skuList = parsedJson.skuLists;
        	  alert(skuList);*/
        	  //debugger
        	 /* var status = skuList[0].status;
        	  $("#loading").css("display","none");
        	  $("#Error").html(status);
        	 // $("#productsList").html("");
        	  if(status=="" || status == null)*/
  			for (var i = 0; i <skuList.length; i++){
  				addExcelItem(skuList[i]);
  			}
  			
  		},
  		error : function(){
  			//debugger
  			//$("#loading").css("display","none");
  			//alert("Select a valid  File.");	//savedFiles = savedFiles + 1;
 		}
 	 });
 }

function importExcelDataForPo(){
	
	$('#ErrorExcel').html("");
 	$('#urlfordoc').val("");
 	$("#loglink").css("display","none");

	
	
	
	
	$('#ErrorExcel').html("");
 	$('#urlfordoc').val("");
 	$("#loglink").css("display","none");
 var supplier = $('#searchSupplier').val();
				 	if(supplier==""){
					 $('#Error').html("Please Select Supplier...");
	   				  	return;
				}  	
			 var warehouseLocation = $('#warehouseLocation').val();
				 	if(warehouseLocation==""){
					 $('#Error').html("Please Select Location...");
	   				  	return;
				} 	
	debugger;
	var oMyForm = new FormData();
	if(productFiles.length <= 0)
	{
	 $('#Error').html("Please Select Excel Sheet... ");
		return;
	}
	
	
	
		        	
		       
	   
	
	
	var supplier = $('#supplier_Id').val();
	var warehouseLocation = $("#warehouseLocation option:selected").text();
	var flag=$("#supplier_flag").val();
	oMyForm.append("supplier",  supplier);
	oMyForm.append("warehouseLocation", warehouseLocation);
	oMyForm.append("flag", flag);	   
	
    oMyForm.append("file", productFiles[0]);
    var contextPath = $("#contextPath").val();
	 URL = contextPath + "/procurement/importExcelData.do";
	 $.ajax({
		  dataType : 'json',
          url : URL,
          data :  oMyForm,
          type : "POST",
          enctype: 'multipart/form-data',
          processData: false, 
          contentType:false,
          beforeSend: function(xhr){
	$("#loading").css("display","block");
	$("#mainDiv").addClass("disabled");
  	   	},
          success : function(skuListExe) {
        	
  				if(skuListExe.length<=0)
        		 {
        		 $('#Error').html("No Matching SKU's found,Please Check Excel File.");
        		 $("#loading").css("display","none");
     			 $("#mainDiv").removeClass('disabled');
        		 return;
        	    } else if(skuListExe[0].responseHeader.responseCode == -1 && skuListExe[0].skuID != null){
           				for(var j=0; j< skuListExe.length; j++){
	                        if(j==skuListExe.length-1){
            				addExcelItem(skuListExe[j],j);
                             }else{
	                      	addExcelItem(skuListExe[j]);
                              }

                             }

          			$('#ErrorExcel').html(skuListExe[0].responseHeader.responseMessage);

                  if(skuListExe[0].urlList != null){
                  for(var j=0; j< skuListExe[0].urlList.length; j++){
                  var anchor = document.createElement('a');
 				  anchor.href = skuListExe[0].urlList[j]
 				  anchor.target = '_blank';
 				  anchor.download = '';
 				
 				  anchor.click();
	              }
                    }
 		
          			$("#loglink").css("display","block");
             	 } else {
        	 
 		
 			for (var i = 0; i <skuListExe.length; i++){
 	

                           if(i==skuListExe.length-1){
            				addExcelItem(skuListExe[i],i);
                             }else{
	                      	addExcelItem(skuListExe[i]);
                              }

  				
		     }
  		
 			$('#ErrorExcel').html("");
 			$('#urlfordoc').val("");
 			$("#loglink").css("display","none");
           }
	
	
	
 			$("#loading").css("display","none");
			$("#mainDiv").removeClass('disabled');
			
  		},
  		error : function(){
  			 $('#Error').html("Select a valid  File.");
              $("#loading").css("display","none");
			$("#mainDiv").removeClass('disabled');
 		}
 	 });
 }

function GetSkuDetailsForPo(skuList){
	$('#ErrorExcel').html("");
 	$('#urlfordoc').val("");
 	$("#loglink").css("display","none");

	$("#loading").css("display","block");
	$("#mainDiv").addClass("disabled");
	var SkuIds="";
	
	
	for (var i = 0; i <skuList.length; i++){
		SkuIds=SkuIds+skuList[i].skuId+',';
		}
	var supplier = $('#supplier_Id').val();
	var warehouseLocation = $("#warehouseLocation option:selected").text();
	var flag=$("#supplier_flag").val();
	var contextPath = $("#contextPath").val();
	 URL = contextPath + "/inventorymanager/importSkuDetails.do";
	 $.ajax({
         url : URL,
         type : "POST",
         data : {
        	 	SkuIds : SkuIds,
        	 	warehouseLocation : warehouseLocation,
				supplier : supplier,
				flag:flag,
			},
         beforeSend: function(xhr){
        	$("#loading").css("display","block");
			$("#mainDiv").addClass("disabled");
 	   	},
         success : function(skuListExe) {
 			
          	if(skuListExe.length<=0)
        		 {
        		 $('#Error').html("No Matching SKU's found,Please Check Excel File.");
        		 $("#loading").css("display","none");
     			 $("#mainDiv").removeClass('disabled');
        		 return;
        	    } else if(skuListExe[0].responseHeader.responseCode == -1 && skuListExe[0].skuID != null){
            		
           				
           			///	console.log(skuList);
           				for(var j=0; j< skuList.length; j++){
	
	                    var count = 0;
                        var countofsku= -1;
	                    for (var i = 0; i <skuListExe.length; i++){
           						if(skuListExe[i].skuID==skuList[j].skuId && count==0)
           							{
	                                count = count+1;
           							skuListExe[i].quantityInHand=skuListExe[i].quantity;
           							skuListExe[i].quantity=skuList[j].quantity;
           							if(skuList[j].costPrice != null && skuList[j].costPrice != "")
           							skuListExe[i].cost=skuList[j].costPrice;
           							skuListExe[i].costPrice=skuList[j].costPrice;
                                    if(skuListExe[i].tax.length >0)
           							skuListExe[i].taxCode= skuListExe[i].tax[0].taxCategory;
                                    countofsku = i;
           							
           							}
           					}
                           if(countofsku != -1){
            				addExcelItem(skuListExe[countofsku]);
}
            			}
          			$('#ErrorExcel').html(skuListExe[0].responseHeader.responseMessage);
          			$('#urlfordoc').val(skuListExe[0].url);
          			$("#loglink").css("display","block");
             	 } else {
        	 
 			///	console.log(skuList);
 				for(var j=0; j< skuList.length; j++){
	                     var count = 0;
                        var countofsku= -1;
 			for (var i = 0; i <skuListExe.length; i++){
 						if(skuListExe[i].skuID==skuList[j].skuId && count==0)
 							{
	                        count = count+1;
 							skuListExe[i].quantityInHand=skuListExe[i].quantity;
 							skuListExe[i].quantity=skuList[j].quantity;
 							if(skuList[j].costPrice != null && skuList[j].costPrice != "")
 							skuListExe[i].cost=skuList[j].costPrice;
 							skuListExe[i].costPrice=skuList[j].costPrice;
						    if(skuListExe[i].tax.length >0)
 							skuListExe[i].taxCode= skuListExe[i].tax[0].taxCategory;
						
 							countofsku = i;
 							}
 					}
				  if(countofsku != -1){
  				addExcelItem(skuListExe[countofsku]);
		}
  			}
 			$('#ErrorExcel').html("");
 			$('#urlfordoc').val("");
 			$("#loglink").css("display","none");
           }
	
	
	
 			$("#loading").css("display","none");
			$("#mainDiv").removeClass('disabled');
 		},
 		error : function(){
 			 $('#Error').html("Something Went Wrong");	//savedFiles = savedFiles + 1;
 			$("#loading").css("display","none");
			$("#mainDiv").removeClass('disabled');
		}
	 });


	
}

function importIssueSkuExcelData(){
	debugger
	var oMyForm = new FormData();
	if(productFiles.length <= 0)
	{
	alert("Please Select Excel Sheet... ");
		return;
	}
	 
//	for(var i = 0; i<productFiles.length; i++)
//		alert(productFiles[i].size);
    oMyForm.append("file", productFiles[0]);
    var contextPath = $("#contextPath").val();
	 URL = contextPath + "/procurement/importStockissueExcelData.do";
	 $.ajax({
		  dataType : 'json',
          url : URL,
          data : oMyForm,
          type : "POST",
          enctype: 'multipart/form-data',
          processData: false, 
          contentType:false,
          beforeSend: function(xhr){
        	  $("#loading").css("display","block");
  			  $("#mainDiv").addClass("disabled");
  	   	},
          success : function(skuList) {
        	
  			//for (var i = 0; i <skuList.length; i++){
  				//addIssueSkuExcelItem(skuList);
  				GetSkuDetailsForStockIssue(skuList);
  				$("#loading").css("display","none");
  				 $("#mainDiv").removeClass("disabled");
  			//}
  			
  		},
  		error : function(){
  			//debugger
  			$("#loading").css("display","none");
			 $("#mainDiv").removeClass("disabled");
  			//alert("Select a valid  File.");	//savedFiles = savedFiles + 1;
 		}
 	 });
 }


function GetSkuDetailsForStockIssue(skuList){
	debugger;
	$("#loading").css("display","block");
	$("#mainDiv").addClass("disabled");
	var SkuIds="";
	for (var i = 0; i <skuList.length; i++){
		SkuIds=SkuIds+skuList[i].skuId+',';
		}
	var supplier = "";
	var warehouseLocation = $("#fromLocation").val();
	var flag="false";
	var contextPath = $("#contextPath").val();
	 URL = contextPath + "/inventorymanager/importSkuDetails.do";
	 $.ajax({
         url : URL,
         type : "GET",
         data : {
        	 	SkuIds : SkuIds,
        	 	warehouseLocation : warehouseLocation,
				supplier : supplier,
				flag:flag,
			},
         beforeSend: function(xhr){
        	$("#loading").css("display","block");
			$("#mainDiv").addClass("disabled");
 	   	},
         success : function(skuListExe) {
 			//console.log(JSON.stringify(skuListExe));
        	 if(skuListExe.length<=0)
        		 {
        		 alert("No records found.");
        		 $("#loading").css("display","none");
     			 $("#mainDiv").removeClass('disabled');
        		 return;
        		 }
 			for (var i = 0; i <skuListExe.length; i++){
 				for(var j=0; j< skuList.length; j++)
 					{
 						if(skuListExe[i].skuID==skuList[j].skuId)
 							{
 							skuListExe[i].skuId=skuListExe[i].skuID;
 							skuListExe[i].quantityInHand=skuListExe[i].quantity;
 							skuListExe[i].quantity=skuList[j].quantity;
 							skuListExe[i].reqQuantity=skuList[j].reqQuantity;
 							skuListExe[i].actuvalQuantity=skuList[j].actuvalQuantity;
 							}
 					}
  			}
 			addIssueSkuExcelItem(skuListExe);
 			$("#loading").css("display","none");
			$("#mainDiv").removeClass('disabled');
 		},
 		error : function(){
 			alert("Something Went Wrong");	//savedFiles = savedFiles + 1;
 			$("#loading").css("display","none");
			$("#mainDiv").removeClass('disabled');
		}
	 });
	
	
	
}


function uploadBankStatement(){
	debugger
	var oMyForm = new FormData();
	if(productFiles.length <= 0)
	{
	alert("Please Select Excel Sheet... ");
		return;
	}
	 
    oMyForm.append("file", productFiles[0]);
    var contextPath = $("#contextPath").val();
	 URL = contextPath + "/userAccessControl/uploadBankStatement.do";
	 $.ajax({
		  dataType : 'json',
          url : URL,
          data : oMyForm,
          type : "POST",
          enctype: 'multipart/form-data',
          processData: false, 
          contentType:false,
          beforeSend: function(xhr){
  	   	},
          success : function(result) {
        	
        		alert(result.msg);
  				//addIssueSkuExcelItem(skuList);
  			
  		},
  		error : function(){
  			//debugger
  			//$("#loading").css("display","none");
  			//alert("Select a valid  File.");	//savedFiles = savedFiles + 1;
 		}
 	 });
 }


productFiles = [];
function addFileToArray(id){
	//debugger
	   var ext = $("#"+id)[0].files[0]['name'].split('.').pop().toLowerCase();
	    
	    	productFiles=event.target.files;
	   
	   
}

function addNameToTextBox(id){
	//debugger
	addFileToArray(id);
	if($("#"+id)[0].files[0] != undefined){
		$("#skuMasterFile").val($("#"+id)[0].files[0]['name']);
	
	
	
/*
	 if($("#skuMasterFile").val() != ""){
				 var ext = $("#"+id)[0].files[0]['name'].split('.').pop().toLowerCase();
				if(ext!='xlsx')
					{
					alert("Upload Xls Files Only.");
					//$("#skuMasterFile").val("");
					//$("#fileUploadCSV").val("");
					return;
					}
	 }*/
	}
	
	else
		$("#"+id+"File").val("");
}


function importExcelDataForOffers(){
	debugger;
	$(".Error").html("");
	$("#loglink").css("display","none");
	var oMyForm = new FormData();
	if(productFiles.length <= 0)
	{
	alert("Please Select Excel Sheet... ");
		return;
	}
	
	 var location = $('#offerLocation').val();
		if(location==null){
			alert("Please Select location...");
				return;
		}  		
	
	var offercategory=	$('#offercategory').val();
	if(offercategory!="item_specific"){
		$("#ErrorNoRecords").html("Invalid import! Please choose proper offer category.");
		//alert("Import is applicable only for Item specific offers.");
			return;
	}  
		if($("#itemDisountBased").is(':checked'))
			{
			
			}
		else
			{
			$("#ErrorNoRecords").html("Invalid import! Applicable only for Item specific offers");
				//alert("Import is applicable only for Item specific offers.");
				return;
			}
			
			
			
			
    oMyForm.append("file", productFiles[0]);
    var contextPath = $("#contextPath").val();
	 URL = contextPath + "/dealsAndOffers/importExcelDataForOffers.do";
	 $.ajax({
		  dataType : 'json',
          url : URL,
          data : oMyForm,
          type : "POST",
          enctype: 'multipart/form-data',
          processData: false, 
          contentType:false,
          beforeSend: function(xhr){
  	   	},
          success : function(skuList) {
        	  //console.log(JSON.stringify(skuList));
        	  
        	  GetSkuDetailsForOffersExcel(skuList);

  		},
  		error : function(){
  			alert("Select a valid  File.");
 		}
 	 });
 }

function GetSkuDetailsForOffersExcel(skuList){
	debugger;
	$("#loglink").css("display","none");
	$("#loading").css("display","block");
	$("#mainDiv").addClass("disabled");
	
	var storeLocation =""
		if($("#offerLocation").val()!=null){
	    storeLocation = $("#offerLocation option:selected").text();
	if(storeLocation.indexOf(",")){
		storeLocation = $("#offerLocation").val().toString();
	}
		}
	
	var SkuIds="";
	for (var i = 0; i <skuList.length; i++){
		SkuIds=SkuIds+skuList[i].skuId+',';
		}
	
	var contextPath = $("#contextPath").val();
	 URL = contextPath + "/dealsAndOffers/importSkuDetailsForOffers.do";
	 $.ajax({
         url : URL,
         type : "POST",
         data : {
        	 	SkuIds : SkuIds,
        	 	storeLocation : storeLocation,
			},
         beforeSend: function(xhr){
        	$("#loading").css("display","block");
			$("#mainDiv").addClass("disabled");
 	   	},
         success : function(skuListExe) {
 			//console.log(JSON.stringify(skuListExe));
        	 if(skuListExe.length<=0)
        		 {
        		 alert("No records found.");
        		 $("#loading").css("display","none");
     			 $("#mainDiv").removeClass('disabled');
        		 return;
        		 }
 			for (var i = 0; i <skuListExe.length; i++){
 				
 				for(var j=0; j< skuList.length; j++)
 					{
 						if(skuListExe[i].skuID==skuList[j].skuId)
 							{
 							skuListExe[i].quantity=skuList[j].quantity;
 							//skuListExe[i].quantity=1;
 							skuListExe[i].skuId=skuList[j].skuId;
 							skuListExe[i].offerType=skuList[j].offerType;
 							skuListExe[i].offerValue=skuList[j].offerValue;
 							if(skuListExe[i].category==null)
 								{
 									skuListExe[i].category="";
 								}
 							
 							}
 					}
  			}
 			//console.log(JSON.stringify(skuListExe));
				addSkuFromExcelImport(skuListExe);
				
				if(skuListExe != null && skuListExe.length >0 && skuListExe[0].logURL != null && skuListExe[0].logURL != "" && skuListExe[0].logURL.length>0){
	 				$("#ErrorNoRecords").html(skuListExe[0].noSkusMessage);
	 				$("#urlfordoc").val(skuListExe[0].logURL);
	 				$("#loglink").css("display","block");
	 				$(".errorMsgLogdiv").css("display","-webkit-box");
	 			}
				
 			$("#loading").css("display","none");
			$("#mainDiv").removeClass('disabled');
 		},
 		error : function(){
 			alert("Something Went Wrong");	
 			$("#loading").css("display","none");
			$("#mainDiv").removeClass('disabled');
		}
	 });
	
}
	 


function importExcelDataForDeals(operation){
	debugger;
	$(".Error").html("");
	$(".ErrorNoRecords").html("");
	$("#loglink").css("display","none");
	var oMyForm = new FormData();
	if(productFiles.length <= 0)
	{
		$("#ErrorNoRecords").html("Please Select Excel Sheet... ");
		return;
	}
		if(operation == "edit"){
			var location = $('#editdealLocation').val();
		}else {
			var location = $('#dealLocation').val();
		}
		
		if(location==null){
			$("#ErrorNoRecords").html("Please Select location...");
				return;
		}  		
	
		if(operation == "edit"){
			var dealCategory=$('#editdealcategory').val();
			
		}else {
			var dealCategory=$('#dealcategory').val();
		}
	
	if(dealCategory!="item_specific"){
		$("#ErrorNoRecords").html("Invalid import! Please choose proper deal category.");
		//alert("Import is applicable only for Item specific offers.");
			return;
	}  
	
		if($("#itemDisountBased").is(':checked'))
			{
			
			}
		else
			{
			$("#ErrorNoRecords").html("Invalid import! Applicable only for Item specific deals");
			//alert("Import is applicable only for Item specific offers.");
				return;
			}
			
    oMyForm.append("file", productFiles[0]);
    
    var contextPath = $("#contextPath").val();
	 URL = contextPath + "/dealsAndOffers/importExcelDataForDeals.do";
	 $.ajax({
		  dataType : 'json',
          url : URL,
          data : oMyForm,
          type : "POST",
          enctype: 'multipart/form-data',
          processData: false, 
          contentType:false,
          beforeSend: function(xhr){
  	   		},
          success : function(skuList) {
        	  //console.log(JSON.stringify(skuList));
        	  
        	  GetSkuDetailsForDealsExcel(skuList,operation);

  		},
  		error : function(){
  			alert("Select a valid  File.");
 		}
 	 });
 }


function GetSkuDetailsForDealsExcel(skuList,operation){
	debugger;
	$("#loglink").css("display","none");
	$("#loading").css("display","block");
	$("#mainDiv").addClass("disabled");
	
	var storeLocation ="";
	
	if(operation == 'edit'){
		
	if($("#editdealLocation").val()!=null){
	    storeLocation = $("#editdealLocation option:selected").text();
	if(storeLocation.indexOf(",")){
		storeLocation = $("#editdealLocation").val().toString();
		}
		}
	
	}else {
		
		if($("#dealLocation").val()!=null){
		    storeLocation = $("#dealLocation option:selected").text();
		if(storeLocation.indexOf(",")){
			storeLocation = $("#dealLocation").val().toString();
			}
			}
	}
	
	
	var SkuIds="";
	var skuIdsList=[];
	for (var i = 0; i <skuList.length; i++){
		//if(SkuIds != null && !SkuIds.includes(skuList[i].skuId) && !SkuIds.includes(skuList[i].dealSkuId))
		SkuIds=SkuIds+skuList[i].skuId+','+skuList[i].dealSkuId+',';
		skuIdsList.push(skuList[i].skuId);
		skuIdsList.push(skuList[i].dealSkuId);
		}
	
	var contextPath = $("#contextPath").val();
	 URL = contextPath + "/dealsAndOffers/importSkuDetailsForDeals.do";
	 $.ajax({
         url : URL,
         type : "POST",
         data : {
        	 	SkuIds : SkuIds,
        	 	storeLocation : storeLocation,
			},
         beforeSend: function(xhr){
        	$("#loading").css("display","block");
			$("#mainDiv").addClass("disabled");
 	   	},
         success : function(skuListExe) {
 			//console.log(JSON.stringify(skuListExe));
        	 if(skuListExe.length<=0)
        		 {
        		 alert("No records found.");
        		 $("#loading").css("display","none");
     			 $("#mainDiv").removeClass('disabled');
        		 return;
        		 }
 				
        	 var allSkusList=[];
        	 var skusNA=[];
        	 var noDataSkus=[];
 				for(var j=0; j< skuList.length; j++) {
 					var skuCount=0;
 					var dealCount=0;
 					
 					for (var i = 0; i <skuListExe.length; i++) {
 						if(skuList[j].skuId == skuListExe[i].skuID  && skuList[j].dealSkuId == skuListExe[i].skuID) {
 							skuCount++;
 							dealCount++;
 							
 							skuList[j].pluCode=skuListExe[i].pluCode;
 							skuList[j].dealPluCode=skuListExe[i].pluCode;
 							skuList[j].description=skuListExe[i].description;
 							skuList[j].dealDesc=skuListExe[i].description;
							skuList[j].dealEAN=skuListExe[i].ean;
							skuList[j].dealSize=skuListExe[i].size;
							
							allSkusList.push(skuList[j]);
							
							skusNA.push(skuListExe[i].skuID);
 							break;
 						}else  {
 							if(skuList[j].skuId == skuListExe[i].skuID){
 								skuCount++;
 								skusNA.push(skuListExe[i].skuID);
 								
 								skuList[j].pluCode=skuListExe[i].pluCode;
 								skuList[j].description=skuListExe[i].description;
 								}
 							if(skuList[j].dealSkuId == skuListExe[i].skuID){
 								dealCount++;
 								skusNA.push(skuListExe[i].skuID);
 								
 								skuList[j].dealPluCode=skuListExe[i].pluCode;
 								skuList[j].dealDesc=skuListExe[i].description;
 								skuList[j].dealEAN=skuListExe[i].ean;
 								skuList[j].dealSize=skuListExe[i].size;
 							}
 						}
 						
 						if(skuCount>=1 && dealCount>=1){
 							allSkusList.push(skuList[j]);
 							break;
 						}
 					}
 				}
 				
 				/*for(var j=0; j< skuIdsList.length; j++){
 					var count = 0;
 					for(var i=0; i< skusNA.length; i++){
 					if(skuIdsList[j]==skusNA[i]){
 						count++;
 						}
 					}
 					if(count==0)
 						noDataSkus.push(skuIdsList[j]);
 				}*/
 				
 			//console.log(JSON.stringify(noDataSkus));
 			//console.log(JSON.stringify(allSkusList));
 			//console.log(JSON.stringify(skusNA));
 			//console.log(JSON.stringify(skuIdsList));
 			
 			addSkuFromExcelDealsImport(allSkusList);
 			/*if(noDataSkus != null && noDataSkus.length >0){
 				$("#ErrorNoRecords").html("no records found. for skuIds : "+noDataSkus+"");
 			}*/
 			
 			if(skuListExe != null && skuListExe.length >0 && skuListExe[0].logURL != null && skuListExe[0].logURL != "" && skuListExe[0].logURL.length>0){
 				$("#ErrorNoRecords").html(skuListExe[0].noSkusMessage);
 				$("#urlfordoc").val(skuListExe[0].logURL);
 				$(".errorMsgLogdiv").css("display","-webkit-box");
 				$("#loglink").css("display","block");
 			}
 			
 			$("#loading").css("display","none");
			$("#mainDiv").removeClass('disabled');
 		},
 		error : function(){
 			alert("Something Went Wrong");	
 			$("#loading").css("display","none");
			$("#mainDiv").removeClass('disabled');
		}
	 });
	
}


function downloadLogs(){
	debugger;
	var anchor = document.createElement('a');
	anchor.href = $("#urlfordoc").val();
	anchor.target = '_blank';
	anchor.download = '';
	if($("#urlfordoc").val()!=null && $("#urlfordoc").val()!='')
		anchor.click();
}


