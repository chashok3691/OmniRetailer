function searchSuppliers(name, searchCategory){
	debugger;
	 //purpose:for checking internet conection
	var online = window.navigator.onLine;
  	if(!online)
  	{
  	alert("check your internet connection,please try agian after some time");
  	return;
  	}
	 var contextPath = $("#contextPath").val();
	 URL = contextPath + "/inventorymanager/searchSuppliers.do";
	 $.ajax({
			type: "GET",
			url : URL,
			data : {
				searchName : name
			},
			beforeSend: function(xhr){                    
  	   			$("#loading").css("display","block");
  	   			$("#mainDiv").addClass("disabled");
  	   		  },
			success : function(result) {
				appendSuppliers(result, searchCategory);
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

function appendSuppliers(suppliersList, searchCategory){
	debugger;
	 $("."+searchCategory).html('');
	 var op = '';
	 for(var i=0;i<suppliersList.length;i++){
		 if (i == 0) {
			 op += '<li id="'+suppliersList[i].supplierCode+'"  class="selected" onclick=getCode(this,"'+searchCategory+'"); ><a>'+suppliersList[i].firmName+'</a></li>';
		}else
			 op += '<li id="'+suppliersList[i].supplierCode+'" onclick=getCode(this,"'+searchCategory+'"); ><a>'+suppliersList[i].firmName+'</a></li>';
	 }
	 $("."+searchCategory).html(op);
	 $("."+searchCategory).show();
}

function getCode(element,type){
	
	debugger;
	var id= $(element).attr("id");
	$("#supplier_Id").val(id);
	var label = $(element).children("a").text();
	$("#searchSupplier").val(label);
	$("#searchSupplierW").val(label);
	 $(".services").hide();
	 $("."+type).html("");
}


function getCodes(element,type){
	debugger;
	var id= $(element).attr("id");
	var label = $(element).children("a").text();
	 if(type == 'searchStockRequest'){
		 $("#searchStockRequest").val(label);
		 $("#stockRequestRef").val(id);
		 getGoodsRequest(id);
	 }
	 else if(type == 'searchIssue'){
		 $("#searchIssue").val(label);
		 $("#issueRef").val(id);
		 getGoodsIssues(id);
	 }else if(type == 'searchIssuePack'){
		 debugger;
		 $("#searchIssue").val(label);
		 $("#issueRef").val(id);
		 getGoodsIssues(id);
	 }
	 $(".services").hide();
	 $("."+type).html("");
}






function searchGoodsIssue(name, searchCategory){
	debugger
	 //purpose:for checking internet conection
	var online = window.navigator.onLine;
  	if(!online)
  	{
  	alert("check your internet connection,please try agian after some time");
  	return;
  	}
	
	var issueToLocation = $("#fromLocation").val();
	if(issueToLocation == undefined || issueToLocation == null){
		var issueToLocation = $("#warehouseLocation").val();
	}
	
	var contextPath = $("#contextPath").val();
	URL = contextPath + "/inventorymanager/searchGoodsIssue.do";
	$.ajax({
		type: "GET",
		url : URL,
		data : {
			searchName : name,
			issueToLocation : issueToLocation
		},
		beforeSend: function(xhr){                    
			$("#loading").css("display","block");
			$("#mainDiv").addClass("disabled");
		},
		success : function(result) {
			appendGoodsIssueRefs(result, searchCategory);
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


function appendGoodsIssueRefs(issueRefList, searchCategory){
	 $("."+searchCategory).html('');
	 var op = '';
	 for(var i=0;i<issueRefList.length;i++){
		 if (i == 0) {
			 op += '<li id="'+issueRefList[i]+'"  class="selected" onclick=getCodes(this,"'+searchCategory+'"); ><a>'+issueRefList[i]+'</a></li>';
		}else
			 op += '<li id="'+issueRefList[i]+'" onclick=getCodes(this,"'+searchCategory+'"); ><a>'+issueRefList[i]+'</a></li>';
	 }
	 $("."+searchCategory).html(op);
	 $("."+searchCategory).show();
}


function searchProducts(name, searchCategory){
	 //purpose:for checking internet conection
	var online = window.navigator.onLine;
  	if(!online)
  	{
  	alert("check your internet connection,please try agian after some time");
  	return;
  	}
	var storeLocation = "";
	var supplier_Id = $("#supplier_Id").val();
		var contextPath = $("#contextPath").val();
			URL = contextPath + "/inventorymanager/searchWarehouseProducts.do";
		 $.ajax({
    			type: "GET",
    			url : URL,
    			data : {
    				searchName : name,
    				storeLocation : storeLocation
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




function searchBomMaster(name, searchCategory){
	debugger;
	 //purpose:for checking internet conection
	var online = window.navigator.onLine;
  	if(!online)
  	{
  	alert("check your internet connection,please try agian after some time");
  	return;
  	}
	var supplier = $("#searchSupplier").val();
	var contextPath = $("#contextPath").val();
	var location =  $("#warehouseLocation").val();
			URL = contextPath + "/inventorymanager/searchBOMMaster.do";
		 $.ajax({
    			type: "GET",
    			url : URL,
    			data : {
    				searchName : name,
    				searchCategory : searchCategory,
    				supplier : supplier,
    				location : location
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
						 op += '<li id="'+productsList[i].skuID+'"  class="selected" onclick=getId(this,"'+searchCategory+'"); ><a>'+productsList[i].description+'   (PRICE   -   '+productsList[i].price+')</a></li>';
					}else
					     op += '<li id="'+productsList[i].skuID+'" onclick=getId(this,"'+searchCategory+'"); ><a>'+productsList[i].description+'   (PRICE   -   '+productsList[i].price+')</a></li>';
		 	}
			 else{
				 if (i == 0) {
					 op += '<li id="'+productsList[i].skuID+'"  class="selected" onclick=getId(this,"'+searchCategory+'"); ><a>'+productsList[i].description+'   (SKU ID   -   '+productsList[i].skuID+',   PRICE   -   '+productsList[i].price+')</a></li>';
				}else
				     op += '<li id="'+productsList[i].skuID+'"  onclick=getId(this,"'+searchCategory+'"); ><a>'+productsList[i].description+'   (SKU ID   -   '+productsList[i].skuID+',   PRICE   -   '+productsList[i].price+')</a></li>';
			 }
		 } 
	 }
	 else if(searchCategory == 'packaging'){
		 debugger;
			
		 for(var i=0;i<productsList.length;i++){
			 
			/* if(productsList[i].manufacturedItem == true){ */
			 
			 if(productsList[i].productId == productsList[i].description){
					 if (i == 0) {
						 op += '<li id="'+productsList[i].productId+'"  class="selected" onclick=getId(this,"'+searchCategory+'"); ><a><label style="width: 10%;">'+productsList[i].productId+'</label> &nbsp &nbsp &nbsp &nbsp   <label style="width: 30%;">'+productsList[i].description+' </label> &nbsp &nbsp &nbsp &nbsp  <label style="width: 10%;">'+productsList[i].costPrice+' </label> &nbsp &nbsp &nbsp &nbsp  <label style="width: 10%;">'+productsList[i].salePrice+' </label></a></li>';
					}else
						 op += '<li id="'+productsList[i].productId+'"   onclick=getId(this,"'+searchCategory+'"); ><a><label style="width: 10%;">'+productsList[i].productId+'</label> &nbsp &nbsp &nbsp &nbsp   <label style="width: 30%;">'+productsList[i].description+' </label> &nbsp &nbsp &nbsp &nbsp  <label style="width: 10%;">'+productsList[i].costPrice+' </label> &nbsp &nbsp &nbsp &nbsp  <label style="width: 10%;">'+productsList[i].salePrice+' </label></a></li>';
		 	}
			 else{
				 if (i == 0) {
					 op += '<li id="'+productsList[i].productId+'"  class="selected" onclick=getId(this,"'+searchCategory+'"); ><a><label style="width: 10%;">'+productsList[i].productId+'</label> &nbsp &nbsp &nbsp &nbsp   <label style="width: 30%;">'+productsList[i].description+' </label> &nbsp &nbsp &nbsp &nbsp  <label style="width: 10%;">'+productsList[i].costPrice+' </label> &nbsp &nbsp &nbsp &nbsp  <label style="width: 10%;">'+productsList[i].salePrice+' </label></a></li>';
				}else
					 op += '<li id="'+productsList[i].productId+'"   onclick=getId(this,"'+searchCategory+'"); ><a><label style="width: 10%;">'+productsList[i].productId+'</label> &nbsp &nbsp &nbsp &nbsp   <label style="width: 30%;">'+productsList[i].description+' </label> &nbsp &nbsp &nbsp &nbsp  <label style="width: 10%;">'+productsList[i].costPrice+' </label> &nbsp &nbsp &nbsp &nbsp  <label style="width: 10%;">'+productsList[i].salePrice+' </label></a></li>';
			 }
			/* }*/
		 
		 } 
	 }
	 else if(searchCategory == 'StorageMasterWarehouse'){
		 debugger;
			
		 for(var i=0;i<productsList.length;i++){
			 
			 if(productsList[i].uomLabel == null || productsList[i].uomLabel == ""){
				 productsList[i].uomLabel = "";
				 
			 }
			 
			
			 
			 
			 if(productsList[i].skuID == productsList[i].description){
					 if (i == 0) {
						 op += '<li id="'+productsList[i].skuID+'"  class="selected" onclick=getId(this,"'+searchCategory+'"); ><a><label style="width: 10%;">'+productsList[i].skuID+'</label> &nbsp &nbsp &nbsp &nbsp   <label style="width: 30%;">'+productsList[i].productName+' </label> &nbsp &nbsp &nbsp &nbsp  <label style="width: 10%;">'+productsList[i].pluCode+' </label> &nbsp &nbsp &nbsp &nbsp  <label style="width: 10%;">'+productsList[i].minSaleQty+productsList[i].uomLabel+' </label></a></li>';
					}else
						 op += '<li id="'+productsList[i].skuID+'"   onclick=getId(this,"'+searchCategory+'"); ><a><label style="width: 10%;">'+productsList[i].skuID+'</label> &nbsp &nbsp &nbsp &nbsp   <label style="width: 30%;">'+productsList[i].productName+' </label> &nbsp &nbsp &nbsp &nbsp  <label style="width: 10%;">'+productsList[i].pluCode+' </label> &nbsp &nbsp &nbsp &nbsp  <label style="width: 10%;">'+productsList[i].minSaleQty+productsList[i].uomLabel+' </label></a></li>';
		 	}
			 else{
				 if (i == 0) {
					 op += '<li id="'+productsList[i].skuID+'"  class="selected" onclick=getId(this,"'+searchCategory+'"); ><a><label style="width: 10%;">'+productsList[i].skuID+'</label> &nbsp &nbsp &nbsp &nbsp   <label style="width: 30%;">'+productsList[i].productName+' </label> &nbsp &nbsp &nbsp &nbsp  <label style="width: 10%;">'+productsList[i].pluCode+' </label> &nbsp &nbsp &nbsp &nbsp  <label style="width: 10%;">'+productsList[i].minSaleQty+productsList[i].uomLabel+' </label></a></li>';
				}else
					 op += '<li id="'+productsList[i].skuID+'"   onclick=getId(this,"'+searchCategory+'"); ><a><label style="width: 10%;">'+productsList[i].skuID+'</label> &nbsp &nbsp &nbsp &nbsp   <label style="width: 30%;">'+productsList[i].productName+' </label> &nbsp &nbsp &nbsp &nbsp  <label style="width: 10%;">'+productsList[i].pluCode+' </label> &nbsp &nbsp &nbsp &nbsp  <label style="width: 10%;">'+productsList[i].minSaleQty+productsList[i].uomLabel+' </label></a></li>';
			 }
			 
		 
		 } 
	 }
	 
	 
	 else if(searchCategory == 'stockUploading'){
		 debugger;
			
		 for(var i=0;i<productsList.length;i++){
			 
			 if(productsList[i].model == null || productsList[i].model == undefined || productsList[i].model == ""){
				 productsList[i].model = ""
				 
			 }
			 if(productsList[i].color == null || productsList[i].color == undefined || productsList[i].color == ""){
				 productsList[i].color = ""
				 
			 }
			 
			 if(productsList[i].ean == null || productsList[i].ean == undefined || productsList[i].ean == ""){
				 productsList[i].ean = ""
				 
			 }
			 if(productsList[i].size == null || productsList[i].size == undefined || productsList[i].size == ""){
				 productsList[i].size = ""
				 
			 }
			
			 
			 
			 if(productsList[i].productId == productsList[i].description){
					 if (i == 0) {
						 op += '<li id="'+productsList[i].skuID+'"  class="selected" onclick=getId(this,"'+searchCategory+'"); ><a><label style="width: 10%;">'+productsList[i].skuID+'</label> &nbsp &nbsp &nbsp &nbsp   <label style="width: 30%;">'+productsList[i].productName+' </label> &nbsp &nbsp &nbsp &nbsp  <label style="width: 10%;">'+productsList[i].ean+' </label> &nbsp &nbsp &nbsp &nbsp  <label style="width: 10%;">'+productsList[i].color+' </label>&nbsp &nbsp &nbsp &nbsp  <label style="width: 10%;">'+productsList[i].size+' </label>&nbsp &nbsp &nbsp &nbsp  <label style="width: 10%;">'+productsList[i].model+' </label></a></li>';
					}else
						 op += '<li id="'+productsList[i].skuID+'"   onclick=getId(this,"'+searchCategory+'"); ><a><label style="width: 10%;">'+productsList[i].skuID+'</label> &nbsp &nbsp &nbsp &nbsp   <label style="width: 30%;">'+productsList[i].productName+' </label> &nbsp &nbsp &nbsp &nbsp  <label style="width: 10%;">'+productsList[i].ean+' </label> &nbsp &nbsp &nbsp &nbsp  <label style="width: 10%;">'+productsList[i].color+' </label>&nbsp &nbsp &nbsp &nbsp  <label style="width: 10%;">'+productsList[i].size+' </label>&nbsp &nbsp &nbsp &nbsp  <label style="width: 10%;">'+productsList[i].model+' </label></a></li>';
		 	}
			 else{
				 if (i == 0) {
					 op += '<li id="'+productsList[i].skuID+'"  class="selected" onclick=getId(this,"'+searchCategory+'"); ><a><label style="width: 10%;">'+productsList[i].skuID+'</label> &nbsp &nbsp &nbsp &nbsp   <label style="width: 30%;">'+productsList[i].productName+' </label> &nbsp &nbsp &nbsp &nbsp  <label style="width: 10%;">'+productsList[i].ean+' </label> &nbsp &nbsp &nbsp &nbsp  <label style="width: 10%;">'+productsList[i].color+' </label>&nbsp &nbsp &nbsp &nbsp  <label style="width: 10%;">'+productsList[i].size+' </label>&nbsp &nbsp &nbsp &nbsp  <label style="width: 10%;">'+productsList[i].model+' </label></a></li>';
				}else
					 op += '<li id="'+productsList[i].skuID+'"   onclick=getId(this,"'+searchCategory+'"); ><a><label style="width: 10%;">'+productsList[i].skuID+'</label> &nbsp &nbsp &nbsp &nbsp   <label style="width: 30%;">'+productsList[i].productName+' </label> &nbsp &nbsp &nbsp &nbsp  <label style="width: 10%;">'+productsList[i].ean+' </label> &nbsp &nbsp &nbsp &nbsp  <label style="width: 10%;">'+productsList[i].color+' </label>&nbsp &nbsp &nbsp &nbsp  <label style="width: 10%;">'+productsList[i].size+' </label>&nbsp &nbsp &nbsp &nbsp  <label style="width: 10%;">'+productsList[i].model+' </label></a></li>';
			 }
			
		 
		 } 
	 }
	 
	 
	 else {
		 for(var i=0;i<productsList.length;i++){
			 if(productsList[i].skuID == productsList[i].description){
					 if (i == 0) {
						 op += '<li id="'+productsList[i].pluCode+'"  class="selected" onclick=getId(this,"'+searchCategory+'"); ><a>'+productsList[i].description+'   (PRICE   -   '+productsList[i].price+')</a></li>';
					}else
					     op += '<li id="'+productsList[i].pluCode+'" onclick=getId(this,"'+searchCategory+'"); ><a>'+productsList[i].description+'   (PRICE   -   '+productsList[i].price+')</a></li>';
		 	}
			 else{
				 if (i == 0) {
					 op += '<li id="'+productsList[i].pluCode+'"  class="selected" onclick=getId(this,"'+searchCategory+'"); ><a>'+productsList[i].description+'   (SKU ID   -   '+productsList[i].skuID+',   PRICE   -   '+productsList[i].price+')</a></li>';
				}else
				     op += '<li id="'+productsList[i].pluCode+'" onclick=getId(this,"'+searchCategory+'"); ><a>'+productsList[i].description+'   (SKU ID   -   '+productsList[i].skuID+',   PRICE   -   '+productsList[i].price+')</a></li>';
			 }
		 } 
		 
	 }
	 
	 $("."+searchCategory).html(op);
	 $("."+searchCategory).show();
	 
}

function getId(element,type){
	var id= $(element).attr("id");
	var description = null;
	description =  $("#"+id).children("a").text();
	description = description.split(' ( ');
	description = description[0];
	$("#desc").val(description);
	if(type == "request")
		getSkuDetails(id,type);
	else if(type == "packaging")
		getBOMPackedSkuDetails(id,type);
	
	else if(type == "StorageMasterWarehouse" || type == "stockUploading")
		getPackedSkuDetails(id,type);
	
	
	
	else if(type == "receipt")
		getSkuDetails(id);
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
	else if(type == "itemname"){
		getItemDetails(id);
		}
		 $(".services").hide();
		 $("."+type).html("");
	
}

function getPackedSkuDetails(skuId,type){
	debugger;
	 //purpose:for checking internet conection
	var online = window.navigator.onLine;
	if(!online)
	{
	alert("check your internet connection,please try agian after some time");
	return;
	}
	 var contextPath = $("#contextPath").val();
	 var storeLocation = $("#warehouseLocation option:selected").text();
	 if(storeLocation == undefined || storeLocation == null || storeLocation == "ALL"){
		 storeLocation = "";
	 }
var WarehouseReturnflag=$("#whreturnflag").val();
		if(WarehouseReturnflag == "" || WarehouseReturnflag == undefined || WarehouseReturnflag == null){
			WarehouseReturnflag="";
   		}

	 
		 URL = contextPath + "/inventorymanager/getWarehouseSkuDetails.do";
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
				appendPackedSkuDetails(result,type);
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




function getBOMPackedSkuDetails(skuId,type){
	 //purpose:for checking internet conection
	var online = window.navigator.onLine;
	if(!online)
	{
	alert("check your internet connection,please try agian after some time");
	return;
	}
	 var contextPath = $("#contextPath").val();
	 var searchCategory = "";
	 var supplier = "";
	 var location =  $("#warehouseLocation").val();
	
	 
	 URL = contextPath + "/inventorymanager/searchBOMMaster.do";
	 $.ajax({
			type: "GET",
			url : URL,
			data : {
				searchName : skuId,
				searchCategory : searchCategory,
				supplier : supplier,
				location : location
			},
			beforeSend: function(xhr){                    
	   			$("#loading").css("display","block");
	   			$("#mainDiv").addClass("disabled");
	   		  },
			success : function(result) {
				appendPackedSkuDetails(result,type);
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





function appendPackedSkuDetails(skuDetails,type){
	debugger;
	//console.log(skuDetails);
	var parsedJson = jQuery.parseJSON(skuDetails);
		
		skuList = parsedJson.skuLists;
		
			addPackedSku(skuList[0],type);
		
}
function addPackedSku(sku,type){
	 
	 
	 debugger;
	 var contextPath = $("#contextPath").val();
	 
	 if(type == "packaging"){
	 var len = parseInt($("#packagingList tr").length);
		if (len != 1)
			len = parseInt($("#packagingList tr:last").attr("id").replace('dynamicdiv', '')) + 1;
		
		
	
		
		var description = null;
		if (sku.description != "" && sku.description != null ||sku.description != undefined)
			description = sku.description;
		else
			description = "";
		
		
		var parsedparents =  JSON.stringify(sku.boMaterialChilds);
		//console.log(parsedparents[0].avlQty);
		
		
		
		
		var count = 1;
		 $('.slnos').each(function(){
				$(this).text(count);
				count = parseInt(count) + 1;
			});
		
		var slNo = count; 
			 $('.slno').each(function(){
				$(this).text(slNo);
				slNo = parseInt(slNo) + 1;
			});
			 
			
			 
			 
			 
			 
			 var lenth = parseInt($("#packagingList tr").length);
			
				if (lenth != 1)
					lenth = parseInt($("#packagingList tr:last").attr("id").replace('dynamicdiv', ''));
				
				debugger;
				
				
				for(var j = 1; j<=lenth;j++){
					
					var addedSkuid = $("#skuID"+j).text();
					if(addedSkuid == undefined || addedSkuid == null ){
						addedSkuid = "";
					}
					
					if(addedSkuid == sku.productId){
						
						alert("Item Already Added.");
						return false;
					}
					
				}
				
			
			 
			 
			 
			var row = "<tr id='dynamicdiv"+len+"' style='margin-top:5px;'><td><input type='checkbox' name='selectall' class='selectableCheckbox' id='selectall' value='"+slNo+"' /></td><td class='slno' id='itemno"+len+"'>"+slNo+"</td><td class='skuID"+len+"' id='skuID"+len+"'>"+sku.productId+"</td>" +
			"<td id='Desc"+len+"'>"+description+"</td>"+
			
			"<td id='batchID"+len+"' class='Pack"+len+"'    contenteditable='true'>1</td>" +
			"<td id='EAN"+len+"' class='Pack"+len+"'   contenteditable='true'>1</td>" +
			"<td id='availQty"+len+"' class='Pack"+len+"' >"+sku.boMaterialChilds[0].avlQty+"</td>" +
			"<td id='inwardQty"+len+"' class='Pack"+len+"' ></td>" +
			"<td id='procQty"+len+"' class='Pack"+len+" '   contenteditable='true'  onBlur='changeProcPack(this);'>0</td>" +
			"<td id='noofpacks"+len+"' class='Pack"+len+" ' onBlur='changePack(this);setData()'  contenteditable='true'>1</td>" +
			"<input type='hidden' id='parentData"+len+"' value='"+parsedparents+"'/>"+
			"<td class='Price' id='salePrice"+len+"'>"+sku.salePrice+"</td>" +"<td id='costPrice"+len+"'>"+sku.costPrice+"</td>"+
			"<td class='Price' id='saleValue"+len+"'>"+sku.salePrice+"</td>" +"<td id='costValue"+len+"'>"+sku.costPrice+"</td></tr>"
			
			
			
				
			
			$("#packagingList tbody").append(row);
			setData();
	 }else if(type == "stockUploading"){
		 
		 
		 

		 
		 var len = parseInt($("#StockUploadingList tr").length);
			if (len != 1)
				len = parseInt($("#StockUploadingList tr:last").attr("id").replace('dynamicdiv', '')) + 1;
		
			
			var description = null;
			if (sku.description != "" && sku.description != null)
				description = sku.description;
			else
				description = $("#desc").val();
			
			
			var slNo = 1; 
				 $('.slno').each(function(){
					$(this).text(slNo);
					slNo = parseInt(slNo) + 1;
				});
			
				 
				 if (sku.ean == "" || sku.ean == null)
					 sku.ean = "";
				 if (sku.size == "" || sku.size == null)
					 sku.size = "";
				 if (sku.color == "" || sku.color == null)
					 sku.color = "";
				 if (sku.model == "" || sku.model == null)
					 sku.model = "";
				 if (sku.price == "" || sku.price == null)
					 sku.price = 0;
				 if (sku.stock == "" || sku.stock == null)
					 sku.stock = 0;
				 
				 
				 
				 
				 
				var row = "<tr id='dynamicdiv"+len+"' style='margin-top:5px;'><td class='slno' id='itemno"+len+"'>"+slNo+"</td><td class='skuID"+len+"' id='skuID"+len+"'>"+sku.skuId+"</td>" +
				"<td id='Desc"+len+"'>"+description+"</td>"+
				"<td id='EAN"+len+"' class='Pack"+len+"'  '>"+sku.ean+"</td>" +
				"<td id='Size"+len+"' class='Pack"+len+"'  >"+sku.size+"</td>" +
				"<td id='Color"+len+"' class='Pack"+len+"'  >"+sku.color+"</td>"+
				"<td id='Model"+len+"' class='Pack"+len+"'   >"+sku.model+"</td>" +
				"<td id='Batchno"+len+"' class='Pack"+len+"'   contenteditable='true'>1</td>" +
				"<td id='Costprice"+len+"' class='Pack"+len+"'  >"+sku.price+"</td>"+
				"<td id='StockQty"+len+"' class='Pack"+len+"'   contenteditable='true'>"+sku.stock+"</td></tr>";
			
				
				$("#StockUploadingList tbody").append(row);
		 
	 
		 
	 }
	 else{
		 
		 var len = parseInt($("#packagingList tr").length);
			if (len != 1)
				len = parseInt($("#packagingList tr:last").attr("id").replace('dynamicdiv', '')) + 1;
		
			
			var description = null;
			if (sku.description != "" && sku.description != null)
				description = sku.description;
			else
				description = $("#desc").val();
			
			
			 var lenth = parseInt($("#packagingList tr").length);
				
				if (lenth != 1)
					lenth = parseInt($("#packagingList tr:last").attr("id").replace('dynamicdiv', ''));
				
				debugger;
				
				
				for(var j = 1; j<=lenth;j++){
					
					var addedSkuid = $("#skuID"+j).text();
					if(addedSkuid == undefined || addedSkuid == null ){
						addedSkuid = "";
					}
					
					if(addedSkuid == sku.skuId){
						
						alert("Item Already Added.");
						return false;
					}
					
				}
			
			
			var slNo = 1; 
				 $('.slno').each(function(){
					$(this).text(slNo);
					slNo = parseInt(slNo) + 1;
				});
			
				var row = "<tr id='dynamicdiv"+len+"' style='margin-top:5px;'><td><input type='checkbox' name='selectall' class='selectableCheckbox' id='selectall' value='"+slNo+"' /></td><td class='slno' id='itemno"+len+"'>"+slNo+"</td><td class='skuID"+len+"' id='skuID"+len+"'>"+sku.skuId+"</td>" +
				"<td id='Desc"+len+"'>"+description+"</td>"+
				"<td id='level"+len+"' class='Pack"+len+"'   contenteditable='true'>1</td>" +
				"<td id='capacity"+len+"' class='Pack"+len+"'   contenteditable='true'>1</td>" +
				"<td id='comments"+len+"' class='Pack"+len+"' style='width:40%'  contenteditable='true'>1</td>" +
				"<td id='Del"+len+"' style='width:5%'>" +
				"<img id='Img"+len+"' src='"+contextPath+"/images/itemdelete.png' style='cursor:pointer;display: block;margin-left: auto;margin-right: auto;width: 50%;' onclick='deleteItem(this);' title='Delete "+sku.skuId+"'/></td></tr>";
			
				
				$("#packagingList tbody").append(row);
		 
	 }
			
		
	// changeTotalCost();
}


function setData(){
	 var len = parseInt($("#packagingList tr").length);
	 var test = len-1;
		if (len != 1)
			len = parseInt($("#packagingList tr:last").attr("id").replace('dynamicdiv', ''));
		
		
		var packedQty = 0;
		var salePrice = 0;
		var costPrice = 0;
		debugger;
		
		
		for(var i = 1; i<=len;i++){
			
			var looppackedQty = parseInt($("#noofpacks"+i).text());
			if(looppackedQty == undefined || looppackedQty == null || Number.isNaN(looppackedQty)){
				looppackedQty = 0;
			}
			var loopcostPrice = parseInt($("#costValue"+i).text());
			if(loopcostPrice == undefined || loopcostPrice == null || Number.isNaN(loopcostPrice)){
				loopcostPrice = 0;
			}
			var loopsalePrice = parseInt($("#saleValue"+i).text());
			if(loopsalePrice == undefined || loopsalePrice == null || Number.isNaN(loopsalePrice)){
				loopsalePrice = 0;
			}
			
			packedQty = packedQty+looppackedQty;
			costPrice = costPrice+loopcostPrice;
			salePrice = salePrice+loopsalePrice;
			
		}
		$("#totalitems").val(test);
		$("#packedstock").val(packedQty);
		$("#costvaluetotal").val(costPrice);
		$("#salevaluetotal").val(salePrice);
	
	
}


function changePack(element){
	debugger;
	 
	var id = $(element).attr("class");
	var rowNo = id.replace('Pack','');
	
	var StockQty = parseFloat($('#stockQty'+rowNo).text());
	var noOfPacks = parseFloat($('#noofpacks'+rowNo).text());
	if(StockQty<=0 ||noOfPacks<=0 ){
		alert("Value can not be empty");
		
	}else{
		var salePrice = parseFloat($('#salePrice'+rowNo).text());
		var costPrice = parseFloat($('#costPrice'+rowNo).text());
			
			$('#saleValue'+rowNo).html(StockQty*noOfPacks*salePrice);
			$('#costValue'+rowNo).html(StockQty*noOfPacks*costPrice);
		
	}
	//changeTotalCost();
	//changeTotalQuantity();
}





function changeProcPack(element){
	debugger;
	 
	var id = $(element).attr("class");
	var rowNo = id.replace('Pack','');
	
	var ProcQty = parseFloat($('#procQty'+rowNo).text());
	var avlQty = parseFloat($('#availQty'+rowNo).text());
	if(avlQty < ProcQty ){
		alert("Processed Quantity cant be greater than Available Quantity");
		
	
}
}

function addclassslNo(count){
	debugger;
	$("#slno"+count).addClass("edited");
	
}





function updateStockUploading(operation)
{
		 debugger;
		try{
			
			var online = window.navigator.onLine;
		  	if(!online){
		  	alert("Check your internet connection,Please try agian after some time.");
		  	return;
		  	}

		  var contextPath = $('#contextPath').val();
		  
		  $('#Error').html("");
		  $('#Success').html("");
		  
		  var len = $("#StockUploadingList tr").length-1;
		  var formData={}
		  var postingList = [];
		  var Sno = [];
		  var count = 1;
			$('.edited').each(function() {
				count= count +1;
				  var idAttr= $(this).attr("id").replace('slno','');
				  
				  var obj = {s_no:parseInt($('#slnos'+idAttr).val()),verification_code:$('#verefcode'+idAttr).val(),verification_reference:$('#verefref'+idAttr).val(),verifiedby:$('#verefby'+idAttr).val(),masterVerificationCode:$('#masterver'+idAttr).val(),sku_id:$('#skuid'+idAttr).text(),sku_physical_stock:parseFloat($('#stock'+idAttr).text()),pluCode:$('#plucode'+idAttr).val(),skuCostPrice:parseFloat($('#skucostprice'+idAttr).text()),skuDescription:$('#description'+idAttr).text(),color:$('#color'+idAttr).text(),size:$('#size'+idAttr).text(),ean:$('#ean'+idAttr).text(),productBatchNo:$('#productbatchno'+idAttr).text(),location:$('#location'+idAttr).val(),status:$('#status'+idAttr).val(),bookedQty:parseFloat($('#bookqty'+idAttr).val()),dumpQty:parseFloat($('#dumpqty'+idAttr).val())};
				  var obj2 = parseInt($('#slnos'+idAttr).val());
				  postingList.push(obj);
				  Sno.push(obj2);
			});
			
			if(count == 1){
				$('#Error').html("Update atleat one SKU and then try again.");
				return;
			}
			
		formData.Sno = Sno;	
		formData.postingList = postingList;
		 
		
		     var formData = JSON.stringify(formData); 
		     console.log(formData); 
	   URL = contextPath+"/inventorymanager/updateStockPosting.do";
	 $.ajax({
		      type: "POST",
			  url : URL,
			//  contentType: "application/json",
			  data :  {
				  formData : formData,
				},
		beforeSend: function(xhr){                    
   			$("#loading").css("display","block");
   			$("#mainDiv").addClass("disabled");
   		  },
		success : function(result) {
			$("#right-side").html(result);
			// $('.left-side').css('height','683px');
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
		catch (e) {
	
	}
			
		}
function getGoodsIssues(issueRef){
	debugger;
	 //purpose:for checking internet conection
	var online = window.navigator.onLine;
  	if(!online)
  	{
  	alert("check your internet connection,please try agian after some time");
  	return;
  	}
	var contextPath = $("#contextPath").val();
	URL = contextPath + "/inventorymanager/getGoodsIssues.do";
	$.ajax({
		type: "GET",
		url : URL,
		data : {
			issueRef : issueRef
		},
		beforeSend: function(xhr){                    
			$("#loading").css("display","block");
			$("#mainDiv").addClass("disabled");
		},
		success : function(result) {
			appendIssuedItemDetails(result);
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



function appendIssuedItemDetails(skuList) {

debugger

 //purpose:for checking internet conection
var online = window.navigator.onLine;
	if(!online)
	{
	alert("check your internet connection,please try agian after some time");
	return;
	}

var contextPath = $("#contextPath").val();
for(var j=0;j<skuList.length;j++){	
	var sku = skuList[j];
	

	var len = parseInt($("#packagingList tr").length);
	if (len != 1)
		len = parseInt($("#packagingList tr:last").attr("id").replace('dynamicdiv', '')) + 1;
	
	
	
	var slNo = 1; 
	 $('.slno').each(function(){
		$(this).text(slNo);
		slNo = parseInt(slNo) + 1;
	});
	
	 
	 debugger
	 
	
				for(var i=0;i<sku.quantity;i++){
	 
					var len = parseInt($("#packagingList tr").length);
					if (len != 1)
						len = parseInt($("#packagingList tr:last").attr("id").replace('dynamicdiv', '')) + 1;
					var slNo = 1; 
					 $('.slno').each(function(){
						$(this).text(slNo);
						slNo = parseInt(slNo) + 1;
					});	
					
					debugger; 
					 if(sku.itemScanCode == null){
						sku.itemScanCode ="";
					 }
					 
					 var description = null;
						if (sku.description != "" && sku.description != null)
							description = sku.description;
						else
							description = $("#desc").val();
						
					

						var row = "<tr id='dynamicdiv"+len+"' style='margin-top:5px;'><td class='slno' id='itemno"+len+"'>"+slNo+"</td><td class='skuID"+len+"' id='skuID"+len+"'>"+sku.skuId+"</td>" +
						"<td id='Desc"+len+"'>"+description+"</td>"+
						"<td id='stockQty"+len+"' class='Pack"+len+"' onBlur='changePack(this);'  contenteditable='true'>1</td>" +
						"<td id='noofpacks"+len+"' class='Pack"+len+"' onBlur='changePack(this);'  contenteditable='true'>1</td>" +
						"<td class='Price' id='salePrice"+len+"'>"+sku.salePrice+"</td>" +"<td id='costPrice"+len+"'>"+sku.cost+"</td>"+
						"<td class='Price' id='saleValue"+len+"'>"+sku.salePrice+"</td>" +"<td id='costValue"+len+"'>"+sku.cost+"</td></tr>";
	                    $("#packagingList tbody").append(row);
	
				}
	 
	


///changeTotalCost();
//changeTotalQuantity();
}
}

function clearAll(){
	debugger;
	$("#StockUploadingList tbody tr").remove();
	setData();
}
function deleteSelected(){
	debugger;
	var selectedLength = $('input[name="selectall"]:checked');
    $(selectedLength).each(function(){
    	
    	var value=$(this).val();
    	$('#dynamicdiv' + value).remove();
	});
    
    
    
    var count = 1;
	 $('.slnos').each(function(){
			$(this).text(count);
			count = parseInt(count) + 1;
		});
	
	var slNo = count; 
		 $('.slno').each(function(){
			$(this).text(slNo);
			slNo = parseInt(slNo) + 1;
		});
    setData();
}




function deleteItem(element){
	var id = $(element).attr("id").replace('Img','');
	$('#dynamicdiv'+id).remove();
	var slNo = 1; 
	 $('.slno').each(function(){
		$(this).text(slNo);
		slNo = parseInt(slNo) + 1;
	});
}





function deleteAll(){
	debugger;
	$("#packagingList tbody tr").remove();
	
}






