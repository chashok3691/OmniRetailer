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
			URL = contextPath + "/inventorymanager/searchProducts.do";
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
	
	else if(type == "StorageMasterWarehouse")
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
	 //purpose:for checking internet conection
	var online = window.navigator.onLine;
	if(!online)
	{
	alert("check your internet connection,please try agian after some time");
	return;
	}
	 var contextPath = $("#contextPath").val();
	 var storeLocation = $("#warehouse_location option:selected").text();
	 if(storeLocation == undefined || storeLocation == null){
		 storeLocation = "";
	 }

var WarehouseReturnflag=$("#whreturnflag").val();
		if(WarehouseReturnflag == "" || WarehouseReturnflag == undefined || WarehouseReturnflag == null){
			WarehouseReturnflag="";
   		}

	 
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
	console.log(skuDetails);
	
		
			addPackedSku(skuDetails[0],type);
		
}
function addPackedSku(sku,type){
	 
	$(".submit").removeAttr('disabled');
	 debugger;
	 var contextPath = $("#contextPath").val();
	 
	 if(type == "packaging"){
		 
		 var divLength=1;
		 $('.dynamicdiv').each(function(){
			 divLength = divLength + 1;
		});
		 
	 var len = parseInt($("#packagingList tr").length);
		if (len != 1)
			len = parseInt($("#packagingList tr:last").attr("id").replace('dynamicdiv', '')) + 1;
		
		
	
		
		var description = null;
		if (sku.description != "" && sku.description != null ||sku.description != undefined)
			description = sku.description;
		else
			description = "";
		
		
		var parsedparents =  JSON.stringify(sku.boMaterialChilds);
		var parentsunparsed = sku.boMaterialChilds;
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
				
				
				for(var j = 1; j<=divLength;j++){
					
					var addedSkuid = $("#skuID"+j).text();
					if(addedSkuid == undefined || addedSkuid == null ){
						addedSkuid = "";
					}
					
					if(addedSkuid == sku.productId){
						
						alert("Item Already Added.");
						return false;
					}
					
				}
				
			
			 
			 
			 
			var row = "<tr class='dynamicdiv' id='dynamicdiv"+divLength+"' style='margin-top:5px;'><td><input type='checkbox' name='selectall' class='selectableCheckbox' id='selectall' value='"+slNo+"' /></td><td class='slno' id='itemno"+divLength+"'>"+slNo+"</td><td class='skuID"+divLength+"' id='skuID"+divLength+"'>"+sku.productId+"</td>" +
			"<td id='Desc"+divLength+"'>"+description+"</td>"+
			
			"<td id='batchID"+divLength+"' class='Pack"+divLength+"'    contenteditable='true'></td>" +
			"<td id='EAN"+divLength+"' class='Pack"+divLength+"'   contenteditable='true'></td>" +
			"<td id='availQty"+divLength+"' class='Pack"+divLength+"' >"+sku.packSkuIDQty+"</td>" +
			"<td id='inwardQty"+divLength+"' class='Pack"+divLength+"' ></td>" +
			"<td id='procQty"+divLength+"' class='Pack"+divLength+" '  oninput='changeValue("+divLength+",this)' contenteditable='true'  onBlur=''>1</td>" +
			"<td id='noofpacks"+divLength+"' class='Pack"+divLength+" ' oninput='changeValue("+divLength+",this)' onBlur='changePack(this);setData()'  contenteditable='true'>1</td>" +
			"<input type='hidden' id='parentData"+divLength+"' value='"+parsedparents+"'/>"+
			"<input type='hidden' id='parentDataUnparsed"+divLength+"' value='"+parentsunparsed+"'/>"+
			"<td class='Price' id='salePrice"+divLength+"'>"+sku.salePrice+"</td>" +"<td id='costPrice"+divLength+"'>"+sku.costPrice+"</td>"+
			"<td class='Price' id='saleValue"+divLength+"'>"+sku.salePrice+"</td>" +"<td id='costValue"+divLength+"'>"+sku.costPrice+"</td>"+
			"<td>"+"<a  class='clickable' data-toggle='collapse' id='row"+divLength+"' data-target=''.row"+divLength+"''> <span style='font-size: 17px' onclick='expandPackage("+divLength+")' id='categoryExpand"+divLength+"'><i class='fa fa1 fa-sort-desc'></i></span></a></td></tr>"+
			
			
			"<tr  class='collapse rowone"+divLength+"' id='packagingList"+divLength+"1'>"+
                              "<th  style='padding:3px;'></th>"+
                               "<th  style='padding:3px;'><div style='white-space: nowrap;padding: 5px;background: #c1c1c1;'>S No.</div></th>"+
                             	"<th style='padding:3px'><div style='white-space: nowrap;padding: 5px;background: #c1c1c1;'>SKU id</div></th>"+
                             	"<th  style='width:200px !important;padding:3px;'><div style='white-space: nowrap;padding: 5px;background: #c1c1c1;'>SKU Description</div></th>"+
                             	"<th style='padding:3px;'><div style='white-space: nowrap;padding: 5px;background: #c1c1c1;'>UOM</div></th>"+
                             	"<th style='padding:3px;'><div style='white-space: nowrap;padding: 5px;background: #c1c1c1;'>Size/Weight</div></th>"+
                             	"<th style='padding:3px;'><div style='white-space: nowrap;padding: 5px;background: #c1c1c1;'>Cost Price</div></th>"+
                             	"<th style='padding:3px;'><div style='white-space: nowrap;padding: 5px;background: #c1c1c1;'>MRP</div></th>"+
                             	"<th style='padding:3px;'><div style='white-space: nowrap;padding: 5px;background: #c1c1c1;'>Avail Qty</div></th></tr>"

			
            var row2 ="";                  	
            var row3 = "";               	
			debugger;
			console.log(parentsunparsed);
                             	
			
			var count = 1;
			var error="";
                     for (i = 0, lenths = parentsunparsed.length; i < lenths; i++) { 
                    	 
                    	 if(parentsunparsed[i].avlQty <= 0 && parentsunparsed[i].iszeroBilling == false){
                    		 
                    		 if(i == 0){
                    			 error += "We can't process your request, Due to "+parentsunparsed[i].itemId
                    		 }else{
                    			 if(error == ""){
                    				 error += "We can't process your request, Due to "+parentsunparsed[i].itemId
                    			 }else{
                    				 error += ","+parentsunparsed[i].itemId
                    			 }
                    			 
                    		 }
                    		 
                    	 }
                    	 
                    	 
         	  		  	row2 =  "<tr  class='collapse rowone"+divLength+"' id='packagingdetails"+divLength+"' class='packagingdetails'>"+
         	  		  			 "<td></td>"+
         	  		  			 " <td>"+count+"</td>"+
         	  		  			 " <td>"+parentsunparsed[i].itemId+"</td>"+
         	  		  			 " <td>"+parentsunparsed[i].itemDescription+"</td>"+
         	  		  			 " <td>"+parentsunparsed[i].uom+"</td>"+
         	  		  			 " <td></td>"+
         	  		  			 " <td>"+parentsunparsed[i].itemPrice+"</td>"+
         	  		  			 " <td>"+parentsunparsed[i].itemPrice+"</td>"+
         	  		  			 " <td>"+parentsunparsed[i].avlQty+"</td></tr>"
         	  		  		    
         	        			 count =  count+1;
         	  		 row3 = row3 + row2
         	  		  			};
         	  		  			
         	  		  		/*$("#ErrorDetail").html("We can't process your request, Due to "+$("#skuID"+idAttr)+" Avl Quantity Should not be 0");*/
         	  		  		if(error != ""){
         	  		  			error += " SKU(s) has insufficient quantity."
         	  		  			$(".submit").attr('disabled','disabled');
         	  		  		    $("#ErrorDetail").html(error);
         	  		  		}
                 debugger;     
			row = row + row3;
			$("#packagingList tbody").append(row);
			$("#warehouseLocation").attr('disabled','disabled');
			//"We can't process your request, Due to "+$("#skuID"+idAttr)+" Avl Quantity Should not be 0"
			setData();
	 }else{
		 
		 var len = parseInt($("#packagingList tr").length)-1;
			if (len != 1)
				len = parseInt($("#packagingList tr:last").attr("id").replace('dynamicdiv', '')) + 1;
		
			
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
			
				var row = "<tr id='dynamicdiv"+len+"' style='margin-top:5px;'><td class='slno' id='itemno"+len+"'>"+slNo+"</td><td class='skuID"+len+"' id='skuID"+len+"'>"+sku.skuId+"</td>" +
				"<td id='Desc"+len+"'>"+description+"</td>"+
				"<td id='level"+len+"' class='Pack"+len+"'   contenteditable='true'>1</td>" +
				"<td id='capacity"+len+"' class='Pack"+len+"'   contenteditable='true'>1</td>" +
				"<td id='comments"+len+"' class='Pack"+len+"'   contenteditable='true'>1</td></tr>";
			
				
				$("#packagingList tbody").append(row);
		 
	 }
			
		
	// changeTotalCost();
}


function setData(){
	debugger;
	 var len = parseInt($("#packagingList tr").length);
	 var test = len-1;
		if (len != 1)
			len = parseInt($("#packagingList tr:last").attr("id").replace('dynamicdiv', ''));
		
		var divLength=1;
		 $('.dynamicdiv').each(function(){
			 divLength = divLength + 1;
		});
		
		var packedQty = 0;
		var salePrice = 0;
		var costPrice = 0;
		debugger;
		
		
		for(var i = 1; i<=divLength;i++){
			
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
		$("#totalitems").val(divLength-1);
		$("#packedstock").val(packedQty);
		$("#costvaluetotal").val(costPrice);
		$("#salevaluetotal").val(salePrice);
	
	
}


function changePack(element){
	debugger;
	 
	var id = $(element).attr("class");
	var rowNo = id.replace('Pack','');
	
	//var StockQty = parseFloat($('#stockQty'+rowNo).text());
	var noOfPacks = parseFloat($('#noofpacks'+rowNo).text());
	
	
	
	if(noOfPacks<=0 ){
		alert("Value can not be empty");
		
		
	}else{
		
		
		
      var noOfPacksold = parseFloat($('#noofpacksold'+rowNo).val());
		
		if(noOfPacksold != undefined){
			
			if(noOfPacks < noOfPacksold){
				$('#noofpacks'+rowNo).text(noOfPacksold);
				alert("New No Of Packs cant be lesser than Old No Of Packs");
				$('#noofpacks'+rowNo).text(noOfPacksold);
			}
		}
		
		
		
		var noOfPacksUpdated = parseFloat($('#noofpacks'+rowNo).text());

		var salePrice = parseFloat($('#salePrice'+rowNo).text());
		var costPrice = parseFloat($('#costPrice'+rowNo).text());
			
			$('#saleValue'+rowNo).html(noOfPacksUpdated*salePrice);
			$('#costValue'+rowNo).html(noOfPacksUpdated*costPrice);
		
	}
	//changeTotalCost();
	//changeTotalQuantity();
}





function changeProcPack(element){
	debugger;
	 
	var id = $(element).attr("class");
	var rowNo = id.replace('Pack','');
	
	var ProcQty = parseFloat($('#procQty'+rowNo).text());
	/*var ProcQtyold = parseFloat($('#procQtyold'+rowNo).val());
	
	if(ProcQtyold != undefined){
		
		if(ProcQty < ProcQtyold){
			$('#procQty'+rowNo).text(ProcQty);
			alert("New Processed Quantity cant be lesser than Old Processed Quantity");
			$('#procQty'+rowNo).text(ProcQtyold);
		}
	}*/
	
	var avlQty = parseFloat($('#availQty'+rowNo).text());
	if(avlQty < ProcQty ){
		alert("Processed Quantity cant be greater than Available Quantity");
		$('#procQty'+rowNo).text("0");
	
}
}

function createPackageAndProcessing(operation)
{
		 debugger;
		try{
			
			var online = window.navigator.onLine;
		  	if(!online){
		  	alert("Check your internet connection,Please try agian after some time.");
		  	return;
		  	}
		  	if($('#searchSupplier').val() == "" || $('#searchSupplier').val() == null || $('#searchSupplier').val() == undefined){
		   		$('#supplierNameError').html("Enter Supplier Name")
		   		return
		   	}
		  var contextPath = $('#contextPath').val();
	  
	   	
		 var formData={}
		 
		formData.zone = $('#warehouseZone').val();
		 
		formData.storeLocation = $('#warehouseLocation').val();
		
		
		formData.supplierName = $('#searchSupplier').val();

		formData.GRNNumber = $('#searchIssue').val();

		formData.packer = $('#packedBy').val();

		formData.storageArea = $('#storageArea').val();

		formData.storageLevel = $('#storageLevel').val();

		formData.packedBy = $('#packedbyadd').val();

		formData.verifiedBy = $('#verifiedby').val();

		formData.packageLine = $('#packagelinearea').val();
		
		

		
		 
		 
		  
		  
		  
		  debugger;
		 var len = $("#packagingList tr").length-1;
		 var divLength=1;
		 $('.dynamicdiv').each(function(){
			 divLength = divLength + 1;
		});
		var PackagingDetails = [];
		
		 if(operation == "submit" || operation == "draft"){
		
		$('.slno').each(function() {
			
			  var idAttr= $(this).attr("id").replace('itemno','');
			
			debugger;
			var ParentData = $("#parentData"+idAttr).val();
			//console.log(ParentData);
			var parentDataList = JSON.parse(ParentData);
			
			for(var i =0; i<parentDataList.length;i++ ){
				
				var obj = {childSkuId:$("#skuID"+idAttr).text(),childSkuIdDescription:$("#Desc"+idAttr).text(),stockQty:$("#stockQty"+idAttr).text(),noOfPacks:$("#noofpacks"+idAttr).text(),salePrice:parseInt($("#salePrice"+idAttr).text()),costPrice:parseInt($("#costPrice"+idAttr).text()),saleValue:parseInt($("#saleValue"+idAttr).text()),costValue:parseInt($("#costValue"+idAttr).text()),ean:$("#EAN"+idAttr).text(),batchId:$("#batchID"+idAttr).text(),avlQty:parentDataList[i].avlQty,inwardQty:parseFloat($("#inwardQty"+idAttr).text()),procQty:parseFloat($("#procQty"+idAttr).text()),parentSkuId:parentDataList[i].itemId,parentSkuIdDescription:parentDataList[i].itemDescription,uom:parentDataList[i].uom,inwardQty:parentDataList[i].quantity,childSkuAvailableQty:parseFloat($("#availQty"+idAttr).text())};
				/*var obj = {childSkuId:$("#skuID"+idAttr).text(),childSkuIdDescription:$("#Desc"+idAttr).text(),stockQty:$("#stockQty"+idAttr).text(),noOfPacks:$("#noofpacks"+idAttr).text(),salePrice:parseInt($("#salePrice"+idAttr).text()),costPrice:parseInt($("#costPrice"+idAttr).text()),saleValue:parseInt($("#saleValue"+idAttr).text()),costValue:parseInt($("#costValue"+idAttr).text()),ean:$("#EAN"+idAttr).text(),batchId:$("#batchID"+idAttr).text(),avlQty:parentDataList[i].avlQty,inwardQty:parseFloat($("#inwardQty"+idAttr).text()),procQty:parseFloat($("#procQty"+idAttr).text()),parentSkuId:parentDataList[i].itemId,parentSkuIdDescription:parentDataList[i].itemDescription,uom:parentDataList[i].uom,childSkuAvailableQty:parseFloat($("#availQty"+idAttr).text())};
				*///var obj = {childSkuId:$("#skuID"+idAttr).text(),childSkuIdDescription:$("#Desc"+idAttr).text(),stockQty:$("#stockQty"+idAttr).text(),noOfPacks:$("#noofpacks"+idAttr).text()};
				
        
         PackagingDetails.push(obj);
				
				
			}
			    
				
	   	
		  });
		 }else{
			 
				formData.packagingRefId = $('#packageRef').val();
				
				formData.status = $('#status').val();
				
				formData.isUpdateQty = $('#isUpdateQty').val();
				
			 debugger;
			 $('.slnos').each(function() {
					
				  var idAttr= $(this).attr("id").replace('itemno','');
				  
				  var editParentDataList = $("#editPackageList").val();
				 
				 // console.log(editParentDataList);
				  var editParentDataList = JSON.parse(editParentDataList);
				 // console.log(editParentDataList);
				  
				  
				

				   var childSkuId = $("#skuID"+idAttr).text();
				  for(var i =0; i<editParentDataList.length;i++ ){
				  	
				  	
				  	if(childSkuId == editParentDataList[i].childSkuId ){
				  		
				  		debugger;
				  		var childSkuId = editParentDataList[i].childSkuId;
				  		
				  		var childSkuIdDescription = editParentDataList[i].childSkuIdDescription;
				  		

				  		var stockQty = $("#stockQty"+idAttr).text();
				  		
				  		var noOfPacks = $("#noofpacks"+idAttr).text();
				  		
				  		var salePrice = parseInt($("#salePrice"+idAttr).text());
				  		

				  		var costPrice = parseInt($("#costPrice"+idAttr).text());
				  		
				  		var saleValue = parseInt($("#saleValue"+idAttr).text());
				  		
				  		var ean = $("#EAN"+idAttr).text();
				  		var batchId = $("#batchID"+idAttr).text();
				  		var avlQty = editParentDataList[i].avlQty;
				  		var inwardQty = parseFloat($("#inwardQty"+idAttr).text());
				  		var procQty = parseFloat($("#procQty"+idAttr).text());
				  		var noOfPacksold = parseFloat($("#noofpacksold"+idAttr).val());
				  		
				  		
				  		if(noOfPacks != noOfPacksold){
				  		noOfPacks = noOfPacks-noOfPacksold;
				  		avlQty = avlQty-noOfPacksold;
				  		}
				  		
				  		
				  		var costValue = parseInt($("#costValue"+idAttr).text());
				  		

				  		var parentSkuId = editParentDataList[i].parentSkuId;
				  		var parentSkuIdDescription = editParentDataList[i].parentSkuIdDescription;
				  		var uom = editParentDataList[i].uom;
				  		var childSkuAvailableQty = parseFloat($("#availQty"+idAttr).text());
				  		

				  		var obj = {childSkuId:childSkuId,childSkuIdDescription:childSkuIdDescription,stockQty:stockQty,noOfPacks:noOfPacks,salePrice:salePrice,costPrice:costPrice,saleValue:saleValue,costValue:costValue,ean:ean,batchId:batchId,procQty:procQty,inwardQty:inwardQty,avlQty:avlQty,parentSkuId:parentSkuId,parentSkuIdDescription:parentSkuIdDescription,packagingRefId:$('#packageRef').val(),uom:uom,inwardQty:editParentDataList[i].inwardQty,childSkuAvailableQty:childSkuAvailableQty};



				  			/*var obj = {childSkuId:childSkuId,childSkuIdDescription:childSkuIdDescription,stockQty:stockQty,noOfPacks:noOfPacks,salePrice:salePrice,costPrice:costPrice,saleValue:saleValue,costValue:costValue,ean:ean,batchId:batchId,procQty:procQty,inwardQty:inwardQty,avlQty:avlQty,parentSkuId:parentSkuId,parentSkuIdDescription:parentSkuIdDescription,packagingRefId:$('#packageRef').val(),uom:uom,childSkuAvailableQty:childSkuAvailableQty};
				  			*///var obj = {childSkuId:$("#skuID"+idAttr).text(),childSkuIdDescription:$("#Desc"+idAttr).text(),stockQty:$("#stockQty"+idAttr).text(),noOfPacks:$("#noofpacks"+idAttr).text()};
				  			PackagingDetails.push(obj);
				  			

				  	}
				  		
				  	}
				  
				  
				 
					    
			
		   	
			  });
			 $('.slno').each(function() {
					
				  var idAttr= $(this).attr("id").replace('itemno','');
			 
			 var ParentData = $("#parentData"+idAttr).val();
				//console.log(ParentData);
				
				if(ParentData != undefined || ParentData != null){
				var parentDataList = JSON.parse(ParentData);
				
				for(var j =0; j<parentDataList.length;j++ ){
					
					/*if(parseFloat($("#availQty"+idAttr).text()) < 0 || parseFloat($("#availQty"+idAttr).text()) != 0){
						 $("#ErrorDetail").html("We can't process your request, Due to "+$("#skuID"+idAttr)+" Avl Quantity Should not be 0");
						 return
					}
*/
					/*var obj1 = {childSkuId:$("#skuID"+idAttr).text(),childSkuIdDescription:$("#Desc"+idAttr).text(),stockQty:$("#stockQty"+idAttr).text(),noOfPacks:$("#noofpacks"+idAttr).text(),salePrice:parseInt($("#salePrice"+idAttr).text()),costPrice:parseInt($("#costPrice"+idAttr).text()),saleValue:parseInt($("#saleValue"+idAttr).text()),costValue:parseInt($("#costValue"+idAttr).text()),ean:$("#EAN"+idAttr).text(),batchId:$("#batchID"+idAttr).text(),avlQty:parseFloat($("#availQty"+idAttr).text()),inwardQty:parseFloat($("#inwardQty"+idAttr).text()),procQty:parseFloat($("#procQty"+idAttr).text()),parentSkuId:parentDataList[j].itemId,parentSkuIdDescription:parentDataList[j].itemDescription};
*/					//var obj = {childSkuId:$("#skuID"+idAttr).text(),childSkuIdDescription:$("#Desc"+idAttr).text(),stockQty:$("#stockQty"+idAttr).text(),noOfPacks:$("#noofpacks"+idAttr).text()};
					
					var obj1 = {childSkuId:$("#skuID"+idAttr).text(),childSkuIdDescription:$("#Desc"+idAttr).text(),stockQty:$("#stockQty"+idAttr).text(),noOfPacks:$("#noofpacks"+idAttr).text(),salePrice:parseInt($("#salePrice"+idAttr).text()),costPrice:parseInt($("#costPrice"+idAttr).text()),saleValue:parseInt($("#saleValue"+idAttr).text()),costValue:parseInt($("#costValue"+idAttr).text()),ean:$("#EAN"+idAttr).text(),batchId:$("#batchID"+idAttr).text(),avlQty:parseFloat($("#availQty"+idAttr).text()),inwardQty:parseFloat($("#inwardQty"+idAttr).text()),procQty:parseFloat($("#procQty"+idAttr).text()),parentSkuId:parentDataList[j].itemId,inwardQty:parentDataList[i].quantity,parentSkuIdDescription:parentDataList[j].itemDescription};

					PackagingDetails.push(obj1);
					
					
				}
				}
			 });
			 
			 
			 
			 
		 }
		  formData.operation = operation;
		  formData.packagingDetails = PackagingDetails;
		     var formData = JSON.stringify(formData); 
		    // console.log(formData); 
	   URL = contextPath+"/inventorymanager/addPackagingNew.do";
	 $.ajax({
		      type: "POST",
			  url : URL,
			  //contentType: "application/json",
			  data : {
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
	

	var divLength = parseInt($("#packagingList tr").length);
	if (divLength != 1)
		divLength = parseInt($("#packagingList tr:last").attr("id").replace('dynamicdiv', '')) + 1;
	
	
	
	var slNo = 1; 
	 $('.slno').each(function(){
		$(this).text(slNo);
		slNo = parseInt(slNo) + 1;
	});
	
	 
	 debugger
	 
	
				/*for(var i=0;i<sku.quantity;i++){*/
	 
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
						
						var parsedparents =  JSON.stringify(sku.boMaterialChilds);
						var parentsunparsed = sku.boMaterialChilds;

						/*var row = "<tr id='dynamicdiv"+len+"' style='margin-top:5px;'><td><input type='checkbox' name='selectall' class='selectableCheckbox' id='selectall' value='"+slNo+"' /></td><td class='slno' id='itemno"+len+"'>"+slNo+"</td><td class='skuID"+len+"' id='skuID"+len+"'>"+sku.skuId+"</td>" +
						"<td id='Desc"+len+"'>"+description+"</td>"+
						"<td id='stockQty"+len+"' class='Pack"+len+"' onBlur='changePack(this);'  contenteditable='true'>1</td>" +
						"<td id='noofpacks"+len+"' class='Pack"+len+"' onBlur='changePack(this);'  contenteditable='true'>1</td>" +
						"<td class='Price' id='salePrice"+len+"'>"+sku.salePrice+"</td>" +"<td id='costPrice"+len+"'>"+sku.cost+"</td>"+
						"<td class='Price' id='saleValue"+len+"'>"+sku.salePrice+"</td>" +"<td id='costValue"+len+"'>"+sku.cost+"</td></tr>";*/
						var row = "<tr class='dynamicdiv' id='dynamicdiv"+divLength+"' style='margin-top:5px;'><td><input type='checkbox' name='selectall' class='selectableCheckbox' id='selectall' value='"+slNo+"' /></td><td class='slno' id='itemno"+divLength+"'>"+slNo+"</td><td class='skuID"+divLength+"' id='skuID"+divLength+"'>"+sku.skuId+"</td>" +
						"<td id='Desc"+divLength+"'>"+description+"</td>"+
						
						"<td id='batchID"+divLength+"' class='Pack"+divLength+"'    contenteditable='true'></td>" +
						"<td id='EAN"+divLength+"' class='Pack"+divLength+"'   contenteditable='true'></td>" +
						"<td id='availQty"+divLength+"' class='Pack"+divLength+"' ></td>" +
						"<td id='inwardQty"+divLength+"' class='Pack"+divLength+"' >"+sku.quantity+"</td>" +
						"<td id='procQty"+divLength+"' class='Pack"+divLength+" '  oninput='changeValue("+divLength+",this)' contenteditable='true'  onBlur=''>1</td>" +
						"<td id='noofpacks"+divLength+"' class='Pack"+divLength+" ' oninput='changeValue("+divLength+",this)' onBlur='changePack(this);setData()'  contenteditable='true'>1</td>" +
						"<input type='hidden' id='parentData"+divLength+"' value='"+parsedparents+"'/>"+
						"<input type='hidden' id='parentDataUnparsed"+divLength+"' value='"+parentsunparsed+"'/>"+
						"<td class='Price' id='salePrice"+divLength+"'>"+sku.price+"</td>" +"<td id='costPrice"+divLength+"'></td>"+
						"<td class='Price' id='saleValue"+divLength+"'>"+sku.price+"</td>" +"<td id='costValue"+divLength+"'></td>"+
						"<td>"+"<a  class='clickable' data-toggle='collapse' id='row"+divLength+"' data-target=''.row"+divLength+"''> <span style='font-size: 17px' onclick='expandPackage("+divLength+")' id='categoryExpand"+divLength+"'><i class='fa fa1 fa-sort-desc'></i></span></a></td></tr>"
	                    $("#packagingList tbody").append(row);
	
			/*	}*/
	 
	


///changeTotalCost();
//changeTotalQuantity();
}
}

function clearAll(){
	debugger;
	$("#warehouseLocation").removeAttr('disabled');
	$("#packagingList tbody tr").remove();
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





function expandPackage(ele){
		try{
			// purpose:for checking internet conection
			var online = window.navigator.onLine;
		  	if(!online){
		  	alert("Check your internet connection,Please try agian after some time.");
		  	return;
		  	}
		  	debugger;
		var id = ele;
		$("#Error").text("");
	    $("#Success").text("");
		$(".collapsed").addClass("collapse");
		$(".collapsed").removeClass("collapsed");
		   if($("#categoryExpand" + id + " " + "i").hasClass("fa-sort-desc"))
			 {
			   $('.rowone'+id).removeClass("collapse");
			   $('.rowone'+id).addClass("collapsed");
				$(".fa-sort-asc").addClass("fa-sort-desc");
				$(".fa-sort-asc").removeClass("fa-sort-asc");
				$("#categoryExpand" + id + " " + "i" + ".fa-sort-desc").removeClass("fa-sort-desc");
				$("#categoryExpand" + id + " " + "i" + ".fa").addClass("fa-sort-asc");
			 }
		   else{
			  $('.rowone'+id).removeClass("collapsed");
		   $('.rowone'+id).addClass("collapse");
				  $(".fa-sort-asc").addClass("fa-sort-desc");
					$(".fa-sort-asc").removeClass("fa-sort-asc");
			
		   }
		   // debugger
		  // var rowno=$("#rowcount").val();
		  //caluclateProfitability(rowno);
		}
		catch(e)
		{
		errorCode(e);
		}

	}

function changeValue(divLength,element){
	
	
	var value =  element.innerText;
	 $("#procQty"+divLength).html(value);
	 $("#noofpacks"+divLength).html(value);
}










