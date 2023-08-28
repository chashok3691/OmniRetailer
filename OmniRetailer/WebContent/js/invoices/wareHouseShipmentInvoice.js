/**
 * 
 *Project Name 	       		 : OmniRetailerCustomer
 * Written By		        : Vijay
 * description				: 
 */

function searchWarehouseInvoicesdetails(searchName, searchCategory,index)
{
	debugger;
//	var finalLocation =($("#from").val());
	var storeLocation="";
	//var buissnessActivity=finalLocation[1];
	var status="true";
	var supplier_Id = $("#supplier_Id").val();
		var contextPath = $("#contextPath").val(); 
		/* if(buissnessActivity == "Warehouse")
			 URL = contextPath + "/inventorymanager/searchWarehouseProducts.do";
		 else if(buissnessActivity == "Retail Outlet" || buissnessActivity == "Restaurant")*/
			URL = contextPath + "/inventorymanager/searchProductsWarehouse.do";
		 $.ajax({
    			type: "GET",
    			url : URL,
    			data : {
    				searchName : searchName,
    				storeLocation : storeLocation
    				
    			},
    			beforeSend: function(xhr){                    
 	   	   			$("#loading").css("display","block");
 	   	   			$("#mainDiv").addClass("disabled");
 	   	   		  },
    			success : function(result) {
            		appendInvoicedetails(result, searchCategory,searchName);
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





function appendInvoicedetails(productsList, searchCategory,searchName){
	debugger;
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
	 else{
		 for(var i=0;i<productsList.length;i++){
			 if(productsList[i].skuID == productsList[i].description){
					 if (i == 0) {
						 op += '<li id="'+productsList[i].pluCode+'"  class="selected" onclick=getIds(this,"'+searchCategory+'"); ><a>'+productsList[i].description+'   (PRICE   -   '+productsList[i].price+')</a></li>';
					}else
					     op += '<li id="'+productsList[i].pluCode+'" onclick=getIds(this,"'+searchCategory+'"); ><a>'+productsList[i].description+'   (PRICE   -   '+productsList[i].price+')</a></li>';
		 	}
			 else{
				 if (i == 0) {
					 op += '<li id="'+productsList[i].pluCode+'"  class="selected" onclick=getIds(this,"'+searchCategory+'"); ><a>'+productsList[i].description+'   (SKU ID   -   '+productsList[i].skuID+',   PRICE   -   '+productsList[i].price+')</a></li>';
				}else
				     op += '<li id="'+productsList[i].pluCode+'" onclick=getIds(this,"'+searchCategory+'"); ><a>'+productsList[i].description+'   (SKU ID   -   '+productsList[i].skuID+',   PRICE   -   '+productsList[i].price+')</a></li>';
			 }
		 } 
		 
	 }
		
	 
	 $("."+searchCategory).html(op);
	 $("."+searchCategory).show();
	 
}



function getIds(element,type){
	debugger;
	var id= $(element).attr("id");
	var description = null;
	description =  $("#"+id).children("a").text();
	description = description.split(' ( ');
	description = description[0];
	
	//$("#desc").val(description);
	if(type == "invoicesWarehouseShipmentDetails"){
		getInvoicedetails(id,type);
	}
	else if(type == "invoicepoRef"){
		$("#po_reference").val(id);
		$("#selected_po_ref").val(id);
		getPoItems(id);
	}
	
	else if(type == "grnRef"){
		$("#grn_reference").val(id);
		$("#selectedshipment_ref").val(id);
		getGrnItems(id);
	}
		 $(".services").hide();
		 $("."+type).html("");
	
}
function getInvoicedetails(skuId,type){
	debugger;
	var status ="false";
	 var contextPath = $("#contextPath").val();
	var WarehouseReturnflag=$("#whreturnflag").val();
		if(WarehouseReturnflag == "" || WarehouseReturnflag == undefined || WarehouseReturnflag == null){
			WarehouseReturnflag="";
   		}
	 var storeLocation = $("#buyer option:selected").text();
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
 				Invoicesdetails(result);
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
function Invoicesdetails(skuDetails)
{
	debugger;
	var parsedJson = jQuery.parseJSON(skuDetails);
	skuList = parsedJson.skuLists;
	appendingInvoicesdetails(skuList[0]);
	}

function appendingInvoicesdetails(sku){
	debugger;
	var contextPath = $("#contextPath").val();
	 var len = parseInt($("#invoiceproductsList tr").length) - 2 ;
	 var lenid=	$("#invoiceproductsList tbody").find('tr:last');
	 
		if ( len <= 0 )
//			len = parseInt($("#invoiceproductsList tr:last").attr("id").replace('dynamicdiv', '')) + 1;
			
		var len= $("#invoiceproductsList").find("tr").length -1;
		
		var description = null;
			if (sku.description != "" && sku.description != null)
				description = sku.description;
			else
				description = "";
		
	
		var make = sku.make;
		if(make == "" || make == null)
			make = "";
		var pluCode = null;
		if (sku.pluCode != "" && sku.pluCode != null)
			pluCode = sku.pluCode;
		else
			pluCode = sku.skuId;
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
		
		var hsnCode = sku.hsnCode;
		if(hsnCode == null)
			sku.hsnCode = "";
		
		var color = sku.color;
		if(color == null || color == "_")
			sku.color = "";
		var ean = sku.ean;
		if(ean == null)
			sku.ean = "";
		var size = sku.size;
		if(size == null || size == "_")
			sku.size = "";
		
		var batchNum = sku.productBatchNo;
		if(batchNum == null)
			sku.productBatchNo = "";
		
		var expiryDateStr = sku.expiryDateStr;
		if(expiryDateStr == null)
			sku.expiryDateStr = "";
		
		var discountAmt = sku.discountAmt;
		if(discountAmt == null || discountAmt == undefined || discountAmt == "")
			sku.discountAmt = 0;
		var discountPerc = sku.discountPercentage;
		if(discountPerc == null || discountPerc == undefined || discountPerc == "")
			sku.discountPercentage = 0;
		
		var freeQty = sku.freeQty;
		if(freeQty == null || freeQty == "")
			sku.freeQty = 0;
		
		var slNo = 1; 
			 $('.slno').each(function(){
				$(this).text(slNo);
				slNo = parseInt(slNo) + 1;
			});
			 
			 
			 var tax = sku.tax;
			 
			 var rate=0.0;
				if(tax!=null)
					if(tax.length>0){
						rate=tax[0].taxRate;
					}
				
			 
			var cost=sku.price;
			var quantity=1;
			
			
			var taxRate=0.0;
			if(tax!=null)
				if(tax.length>0){
					for(var i=0;i<tax.length;i++)
	    			{
	    			if(tax[i].taxCode == "CGST")
	    				if(tax[i].saleRangesList.length != null  && tax[i].saleRangesList.length > 0){
							
							for(var t=0;t<tax[i].saleRangesList.length;t++)
							{
							if(parseFloat(tax[i].saleRangesList[t].saleValueTo) >= sku.costPrice && parseFloat(tax[i].saleRangesList[t].saleValueFrom) <= sku.costPrice ){
								taxRate = tax[i].saleRangesList[t].taxRate;
							break;
							}
							}
							}else{
								taxRate = tax[i].taxRate;
							}
	    			}
					
				}
			
			var sgstTaxRate=0.0;
			var cgstTaxRate=0.0;  
			if(tax!=null)
				if(tax.length>0){
			for(var i=0;i<tax.length;i++)
			{
			if(tax[i].taxCode == "CGST")
				if(tax[i].saleRangesList.length != null && tax[i].saleRangesList.length > 0){
					
					for(var u=0;u<tax[i].saleRangesList.length;u++)
					{
						if(parseFloat(tax[i].saleRangesList[u].saleValueTo) >= sku.costPrice && parseFloat(tax[i].saleRangesList[u].saleValueFrom) <= sku.costPrice ){
							cgstTaxRate = tax[i].saleRangesList[u].taxRate;
						break;
						}
					
					}
					}else{
						cgstTaxRate = tax[i].taxRate;
					}
			}
			}
			
			
			var sgstTaxRate=0.0;
			if(tax!=null)
				if(tax.length>0){
			for(var i=0;i<tax.length;i++)
			{
			if(tax[i].taxCode == "SGST")
                     if(tax[i].saleRangesList.length != null  && tax[i].saleRangesList.length > 0){
					
					for(var v=0;v<tax[i].saleRangesList.length;v++)
					{
						if(parseFloat(tax[i].saleRangesList[v].saleValueTo) >= sku.costPrice && parseFloat(tax[i].saleRangesList[v].saleValueFrom) <= sku.costPrice ){
							sgstTaxRate = tax[i].saleRangesList[v].taxRate;
						break;
						}
					
					
					}
					}else{
						sgstTaxRate = tax[i].taxRate;
					}
			}
			}
			
			var cessRate=0.0;
			if(tax!=null)
				if(tax.length>0){
			for(var i=0;i<tax.length;i++)
			{
			if(tax[i].taxCode == "CESS")
				
                   if(tax[i].saleRangesList.length != null  && tax[i].saleRangesList.length > 0){
					
					for(var w=0;w<tax[i].saleRangesList.length;w++)
					{
						if(parseFloat(tax[i].saleRangesList[w].saleValueTo) >= sku.costPrice && parseFloat(tax[i].saleRangesList[w].saleValueFrom) <= sku.costPrice ){
							cessRate = tax[i].saleRangesList[w].taxRate;
						break;
						}
					
					
					}
					}else{
						cessRate = tax[i].taxRate;
					}
			}
			}	
			
			var igstRate=0.0;
			if(tax!=null)
				if(tax.length>0){
			for(var i=0;i<tax.length;i++)
			{
			if(tax[i].taxCode == "IGST")
				
				 if(tax[i].saleRangesList.length != null  && tax[i].saleRangesList.length > 0){
						
						for(var x=0;x<tax[i].saleRangesList.length;x++)
						{
							
							if(parseFloat(tax[i].saleRangesList[x].saleValueTo) >= sku.costPrice && parseFloat(tax[i].saleRangesList[x].saleValueFrom) <= sku.costPrice ){
								igstRate = tax[i].saleRangesList[x].taxRate;
						break;
						}
						
						}
						}else{
							igstRate = tax[i].taxRate;
						}
			}
			}	
			
			
			var locationstate = $("#stateName").val();
			var suppierstate = $("#supplier_state").val();
			
			 if(locationstate.toUpperCase() !=  suppierstate.toUpperCase()){
				sgstTaxRate= 0.0;
 				cgstTaxRate= 0.0;
 				taxRate= 0.0;
			 }else{
				 igstRate = 0.0;
			 }
			
				var taxvalueofCgst=0.0;
				if(tax!=null)
				if(tax.length>0){
				taxvalueofCgst =  (cgstTaxRate*cost*quantity)/100;
				}
				
				var taxvalueofsgst=0.0;
				if(tax!=null)
				if(tax.length>0){
				taxvalueofsgst =  (sgstTaxRate*cost*quantity)/100;
				}
				
				var taxvalueofCess=0.0;
				if(tax!=null)
				if(tax.length>0){
				taxvalueofCess =  (cessRate*cost*quantity)/100;
				}
				
				var taxvalueofIgst=0.0;
				if(tax!=null)
					if(tax.length>0){
						taxvalueofIgst =  (igstRate*cost*quantity)/100;
					}
				
				if(tax<=0)
					{
					taxvalueofsgst = 0.0;
					taxvalueofCgst = 0.0;
					taxvalueofIgst = 0.0;
					taxvalueofCess = 0.0;
					}
				
			 var  taxamount=0.0;
			if(tax!=null)
				if(tax.length>0){
						taxamount = parseFloat(((sku.costPrice)*taxRate)/100).toFixed(2);
				}
			
			
			 
				var row = "<tr id='dynamicdiv"+len+"' style='margin-top:5px;'><td class='slno' id='itemno"+len+"'>"+slNo+"</td><td id='itemCode"+len+"'>"+sku.skuId+"</td>" +
			"<td id='itemDesc"+len+"'>"+description+"</td>"+
			"<input type='hidden' id='taxvalue"+len+"' value='"+parseFloat(taxvalueofsgst+taxvalueofCgst+taxvalueofIgst).toFixed(2)+"' />" +
			"<input type='hidden' id='color"+len+"' value='"+sku.color+"' />" +
			"<input type='hidden' id='size"+len+"' value='"+sku.size+"' />" +
			"<input type='hidden' id='uom"+len+"' value='"+sku.uom+"' />" +
			"<input type='hidden' id='pluCode"+len+"' value='"+sku.pluCode+"' />" +
			"<input type='hidden' id='model"+len+"' value='"+sku.model+"' />" +
			"<input type='hidden' id='category"+len+"' value='"+sku.category+"' />" +
			"<input type='hidden' id='subCategory"+len+"' value='"+sku.subCategory+"' />" +
			"<input type='hidden' id='section"+len+"' value='"+sku.section+"' />" +
			"<input type='hidden' id='taxationlist"+len+"' value='"+JSON.stringify(sku.tax)+"'/>" +
            "<input type='hidden' id='pricereal"+len+"' value='"+sku.price+"'/>" +
            "<input type='hidden' id='pricerealedit"+len+"' value=''/>" +


	    			
			"<td id='ean"+len+"'>"+sku.ean+"</td>" +
			"<td id='HSN"+len+"'>"+sku.hsnCode+"</td>" +
			"<td><textarea id='batchNum"+len+"' rows=1 style='resize:none;width: 87px;'>"+sku.productBatchNo+"</textarea></td>"+
			"<td><input class='form-control calendar_icon endDate' readonly='readonly' style='width:100px;background-color: white;' id='expiryDate"+len+"' type='text' onfocus=callCalender('expiryDate"+len+"') onclick=callCalender('expiryDate"+len+"') placeholder='DD/MM/YYYY' value='"+sku.expiryDateStr+"' /></td>" +
			"<td id='qty"+len+"'><input style='text-align: center;width:75px;' type='number' id='Received"+len+"' class='Received'  name='Received' value='1'  onBlur='changePack(this);'/></td>" +
			"<td id='taxRate"+len+"'><input style='text-align: center;width:75px;' type='number' id='rate"+len+"' readonly='readonly'  name='rate' value='"+rate*2+"'  onBlur='changePackRate(this);'/></td>" +

			"<td class='cgstrate' id='cgstrate"+len+"' >"+parseFloat(cgstTaxRate).toFixed(2)+"</td>" +
			"<td class='cgst' id='cgst"+len+"'>"+parseFloat(taxvalueofCgst).toFixed(2)+"</td>" +
			"<td class='sgstrate' id='sgstrate"+len+"'>"+parseFloat(sgstTaxRate).toFixed(2)+"</td>" +
			"<td class='sgst'  id='sgst"+len+"'>"+parseFloat(taxvalueofsgst).toFixed(2)+"</td>" +
			"<td class='igstrate' id='igstrate"+len+"'>"+parseFloat(igstRate).toFixed(2)+"</td>" +
			"<td class='igst'  id='igst"+len+"'>"+parseFloat(taxvalueofIgst).toFixed(2)+"</td>" +
			"<td class='cessrate'  id='cessrate"+len+"'>"+parseFloat(cessRate).toFixed(2)+"</td>" +
			"<td class='cess'  id='cess"+len+"'>"+parseFloat(taxvalueofCess).toFixed(2)+"</td>" +
			"<td><input id='freeqty"+len+"'  class='freeqty' onBlur='changeTotalSubQuantities();changeTotalCost()' onkeypress='PreventEnter(this);' type='number' style='width:70px;text-align:center' value='"+sku.freeQty+"' min='0' oninput='this.value = Math.abs(this.value)'></td>"+
			"<td><input id='discountpercentage"+len+"'   class='discountpercentage' onBlur='changePack(this);changeDiscPerc(this);changeTotalCost();' onkeypress='PreventEnter(this);'  min='0' type='number' style='width:70px;text-align:center' value='"+sku.discountPercentage+"' oninput='this.value = Math.abs(this.value)'></td>"+
			"<td><input id='discountAmt"+len+"'  class='discountAmt' onBlur='changePack(this);changeDiscAmt(this);changeTotalCost();' onkeypress='PreventEnter(this);' type='number'  min='0' style='width:70px;text-align:center' value='"+sku.discountAmt+"' oninput='this.value = Math.abs(this.value)'></td>"+
			"<td class='price'  id='costPrice"+len+"'  onBlur='changeSupplyPrice(this);' contenteditable='true'>"+sku.price+"</td>" +
			"<td class='amount' id='amount"+len+"' >"+sku.price+"</td>"+
			"<td id='Del"+len+"'>" +
			"<img id='Img"+len+"' src='"+contextPath+"/images/itemdelete.png' style='width:32%;cursor:pointer;' onclick='deleteItem(this);' title='Delete "+sku.skuId+"'/></td></tr>";
		

				$("#invoiceproductsList tbody").find('tr:last').prev().after(row);

				$("#Received"+len).val("1");

             changeDiscPerc(len);
   			 changeDiscAmt(len);
			changeTotalSubQuantities();
			changeInvoiceTotal();

}



 function changeDiscAmt(element){
 		debugger;
  var id = $(element).attr("id");
	
	if(id != undefined){
		var rowNo = id.replace('discountAmt','');
		}else{
			var rowNo = element;
		}
	
	var discAmt = parseFloat($('#discountAmt'+rowNo).val());
	var discPerc = parseFloat($('#discountpercentage'+rowNo).val());
		
		if(discAmt == "" || isNaN(discAmt))  {
			$('#discountAmt'+rowNo).val("0");
		}
		if(discPerc == "" || isNaN(discPerc))  {
			$('#discountpercentage'+rowNo).val("0");
		}
		
		if(discAmt > 0 ){
			$('#discountpercentage'+rowNo).val("0");
			
		}  
		 changeTotalCost();
      
}
  
  
  function changeDiscPerc(element){
		debugger;
	var id = $(element).attr("id");
	
	if(id != undefined){
	var rowNo = id.replace('discountpercentage','');
	}else{
		var rowNo = element;
	}
	
	var discAmt = parseFloat($('#discountAmt'+rowNo).val());
	var discPerc = parseFloat($('#discountpercentage'+rowNo).val());
	if(discAmt == "" || isNaN(discAmt))  {
			$('#discountAmt'+rowNo).val("0");
		}
		if(discPerc == "" || isNaN(discPerc))  {
			$('#discountpercentage'+rowNo).val("0");
		}
		
	if(discPerc > 0)  {
			$('#discountAmt'+rowNo).val("0");
		}
 changeTotalCost();
 

}




$("#searchSupplier").on('input',function(e){
	debugger;
	$("#supplierNameError").html("");
	if($("#searchSupplier").val().length<3){
		$("#supplier_Id").val("");
	}
	$(".supplier").children("li").each(function(){
		var supplierName = $(this).children("a").text().trim();
		if($("#searchSupplier").val().trim().toLowerCase() == supplierName.toLowerCase()){
			$("#searchSupplier").val($("#searchSupplier").val().trim());
			$("#supplier_Id").val($(this).attr("id"));
			 $(".services").hide();
			 $(".matchedStringUl").html("");
			return;
		}
		else{
			$("#supplier_Id").val("");
		}
	});
	if(e.keyCode == 9){
		if($("#searchSupplier").val()!="" && $("#supplier_Id").val() == ""){
			 $("#supplierNameError").html("Supplier Name doesn't exist");
		 }
		 $(".services").hide();
		 $(".matchedStringUl").html("");
	}
});

function searchSuppliers(name, searchCategory){
	debugger;
	$("#searchSupplierError").html("");
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
				debugger
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
	$("#searchSupplierError").html("");
	debugger
	 $("."+searchCategory).html('');
	 var op = '';
	 for(var i=0;i<suppliersList.length;i++){
		 var state = suppliersList[i].state;
		 if (i == 0) {
			 op += '<li id="'+suppliersList[i].supplierCode+'" state="'+suppliersList[i].state+'"  class="selected" onclick=getCodes(this,"'+searchCategory+'"); ><a>'+suppliersList[i].firmName+'</a></li>';
		}else
			 op += '<li id="'+suppliersList[i].supplierCode+'" state="'+suppliersList[i].state+'" onclick=getCodes(this,"'+searchCategory+'"); ><a>'+suppliersList[i].firmName+'</a></li>';
	 }
	 $("."+searchCategory).html(op);
	 $("."+searchCategory).show();
}


function deleteItem(element){
	debugger;
    $(".Error").html("");
    if($("type").html() === 'edit')
    	var id=$(element).attr("id").replace('dynamicdiv','');
    else
	var id = $(element).attr("id").replace('Img','');
		
	var sku = $("#itemCode"+id).html();
	$( '#dynamicdiv' + id ).remove();
	var slNo = 1; 
	 $('.slno').each(function(){
		$(this).text(slNo);
		slNo = parseInt(slNo) + 1;
	});
	 
	 var length = parseInt($("#invoiceproductsList tr").length) - 2 ;
	 if( length === 0 )
		 {
		 var lenid=	$("#invoiceproductsList tbody").find('tr:last');
		 	var row="<tr id='dynamicdiv1'></tr>";

		 	$("#invoiceproductsList tbody").prepend(row);
		 }
	 changeTotalCost();
	 changeTotalSubQuantities();
	 changeInvoiceTotal();
}

/*
function deleteItem(element){
	debugger;
    $(".Error").html("");
    if($("type").html() === 'edit')
    	var id=$(element).attr("id").replace('dynamicdiv','');
    else
	var id = $(element).attr("id").replace('Img','');
		
	var sku = $("#itemCode"+id).html();
	$( '#dynamicdiv' + id ).remove();
	var slNo = 1; 
	 $('.slno').each(function(){
		$(this).text(slNo);
		slNo = parseInt(slNo) + 1;
	});
	 
	 var length = parseInt($("#invoiceproductsList tr").length) - 2 ;
	 if( length === 0 )
		 {
		 	var row="<tr id='dynamicdiv1'></tr>";
		 	$("#invoiceproductsList tbody").find('tr:last').prev().after(row);
		 }
	 changeTotalCost();
	 changeTotalSubQuantities();
	 changeInvoiceTotal();
}*/

function numerics(event) {
	 
    if(event.which == 8 || event.which == 0){
        return true;
    }
    if(event.which < 47 || event.which > 59) {
        return false;
        //event.preventDefault();
    } // prevent if not number/dot
    
    if(event.which == 46 && $(this).val().indexOf('.') != -1) {
        return false;
        //event.preventDefault();
    }
}




function createWarehouseShipmentInvoices(id,verificationCode,type){
	 debugger;
	 $("#Error").html("");
	 $("#Success").html("");
	 $("#invoiceNumberError").html("");
	 $("#gstinError").html("");
	 $("#searchSupplierError").html("");
	 $("#deliveryByError").html("");
	 $("#fromLocError").html("");
	 
	 var finalObj = {},items = [];
	 var contextPath = $("#contextPath").val();
	 
	 if($("#fromLocation").val() == "" || $("#fromLocation").val() == null || $("#fromLocation").val() == undefined){
		  $("#fromLocError").html("Please Select Location");
		  $("#fromLocation").focus();
		  return;
	  }
	 if ($("#fromLocation").length > 0)
	 finalObj.warehouseLocation=$("#fromLocation").val();
	 
	 if($("#invoiceNumber").val() == "" || $("#invoiceNumber").val() == null || $("#invoiceNumber").val() == undefined){
		  $("#invoiceNumberError").html("Please Enter Invoice Number");
		  $("#invoiceNumber").focus();
		  return;
	  }
	 finalObj.invoiceId = $("#invoiceNumber").val();
	
	 var len= $("#invoiceproductsList tr").length -3;
	 
	 var q= $("#Received1").text();
	
	
	 for(var i=1;i<=len;i++){
//	 		var idAttr = parseInt($("#invoiceproductsList tr:eq("+i+")").attr("id").replace('dynamicdiv', ''));
	 		 var idAttr = i;
	 		 var totalTax = parseFloat($("#cgst"+idAttr).text()) +parseFloat($("#sgst"+idAttr).text())+parseFloat($("#igst"+idAttr).text());
	 		 console.log(totalTax);
	 		 var obj = {
		 				skuId:$("#itemCode"+idAttr).text(),
		 				itemDescription:$("#itemDesc"+idAttr).text(),
		 				ean:$("#ean"+idAttr).text(),
		 				hsnCode:$("#HSN"+idAttr).text(),
		 				batchNum:$("#batchNum"+idAttr).val(),
		 				expiryDateStr:$("#expiryDate"+idAttr).val(),
		 				taxRate:$("#rate"+idAttr).val(),
		 				quantity:$("#Received"+idAttr).val(),
		 				cgstRate:$("#cgstrate"+idAttr).text(),
		 				cgstAmt:$("#cgst"+idAttr).text(),
		 				sgstRate:$("#sgstrate"+idAttr).text(),
		 				sgstAmt:$("#sgst"+idAttr).text(),
					    cessRate:$("#cessrate"+idAttr).text(),
		 				cessAmt:$("#cess"+idAttr).text(),
		 				igstRate:$("#igstrate"+idAttr).text(),
		 				igstAmt:$("#igst"+idAttr).text(),
		 				freeQty:$("#freeqty"+idAttr).val(),
		 				discount:$("#discountpercentage"+idAttr).val(),
		 				discountAmt:$("#discountAmt"+idAttr).val(),
		 				price:$("#costPrice"+idAttr).text(),
		 				total:$("#amount"+idAttr).text(),
		 		   		color:$("#color"+idAttr).val(),
		 		   		size:$("#size"+idAttr).val(),
		 		   		unitOfMeasurement:$("#uom"+idAttr).val(),
		 		   		pluCode:$("#pluCode"+idAttr).val(),
		 		   		model:$("#model"+idAttr).val(),
		 		   		category:$("#category"+idAttr).val(),
		 		   		subCategory:$("#subCategory"+idAttr).val(),
		 		   		totaltaxAmt:totalTax,
		                originalSupplyPrice :$("#pricereal"+idAttr).val(),
		 	
		 		   		};
	 		
	 		items.push(obj);
	 	}	
	 
	 finalObj.whInvoiceItemsList = items;
	 
	 
	 if($("#gstin").val() == "" || $("#gstin").val() == null || $("#gstin").val() == undefined){
		  $("#gstinError").html("Please Enter GSTIN Number");
		  $("#gstin").focus();
		  return;
	  }
	 if ($("#gstin").length > 0){
		
		 if($("#gstin").val() != ""){
		   var gstinformat = /^([0][1-9]|[1-2][0-9]|[3][0-7])([a-zA-Z]{5}[0-9]{4}[a-zA-Z]{1}[1-9a-zA-Z]{1}[zZ]{1}[0-9a-zA-Z]{1})+$/;
	        if (gstinformat.test($("#gstin").val().toUpperCase())) {
	            $("#gstinError").html("");
	        } else {
	        	 $("#gstinError").html("Please Check GST Number.");
	            return false;
	        }
		 }
		
		
		
	 finalObj.gstn= $("#gstin").val();
}
	 if ($("#pinValue").length > 0)
	 finalObj.shippedToZipCode =$("#pinValue").val();
	 if ($("#emailId").length > 0)
	 finalObj.email=$("#emailId").val();
	 
	 if ($("#goodsReceiptNoteRef").length > 0)
	 finalObj.goodsReceiptNoteRef=$("#goodsReceiptNoteRef").val();
	 
	 if ($("#shipmentId").length > 0)
		 finalObj.shipmentId=$("#shipmentId").val();
	 if ($("#deliveryNote").length > 0)
	 finalObj.shipmentNoteId=$("#deliveryNote").val();
	 
	 if($("#searchSupplier").val() == "" || $("#searchSupplier").val() == null || $("#searchSupplier").val() == undefined){
		  $("#searchSupplierError").html("Please Enter Supplier");
		  $("#searchSupplier").focus();
		  return;
	  }
	 if ($("#searchSupplier").length > 0)
	 finalObj.supplierName=$("#searchSupplier").val();
	 
	 /*if($("#supplier_Id").val() == "" || $("#supplier_Id").val() == null || $("#supplier_Id").val() == undefined){
		  $("#searchSupplierError").html("Please Enter Supplier");
		  $("#searchSupplier").focus();
		  return;
	  }*/
	 if ($("#po_reference").length > 0)
		 finalObj.orderId=$("#po_reference").val();
	 
	 if ($("#supplier_Id").length > 0)
	 finalObj.supplierId=$("#supplier_Id").val();
	 
	 if ($("#supplier_state").length > 0)
		 finalObj.supplier_state=$("#supplier_state").val();
	 
	 if($("#deliveryBy").val() == "" || $("#deliveryBy").val() == null || $("#deliveryBy").val() == undefined){
		  $("#deliveryByError").html("Please Enter Delivery By");
		  $("#deliveryBy").focus();
		  return;
	  }
	 if ($("#deliveryBy").length > 0)
	 finalObj.shipmentAgency =$("#deliveryBy").val();
	 
	 /*if ($("#buyer").length > 0)
	 finalObj.shipmentReceivedBy =$("#buyer").val();
	 if ($("#buyer").length > 0)
		 finalObj.toLocation =$("#buyer").val();*/
	 
	 if ($("#deliveryNoteDate").length > 0)
	 finalObj.createdOnStr=$("#deliveryNoteDate").val();
	 
	 var today = new Date();
	 finalObj.invoiceDate = today;
	 
	 if ($("#deliveryDate").length > 0)
		 finalObj.shipmentDateStr =$("#deliveryDate").val();
	 
	 if ($("#shipmentPaymentMode").length > 0)
	 finalObj.paymentTerms =$("#shipmentPaymentMode").val();
	 if ($("#shipmentDispatches").length > 0)
	 finalObj.shipmentMode =$("#shipmentDispatches").val();
	 
	 if ($("#stateName").length > 0)
		 finalObj.state= $("#stateName").val()
	  if ($("#counter").length > 0)
		 finalObj.counterId= $("#counter").val();
	 
	 if ($("#otherTaxes").length > 0)
	 finalObj.otherTaxAmt = $("#otherTaxes").val();
	 if ($("#totalQty").length > 0)
	 finalObj.otherTaxAmt = $("#totalQty").val();
	 if ($("#CGSTTotal").length > 0)
	 finalObj.cgstAmt =  $("#CGSTTotal").html();
	 if ($("#SGSTTotal").length > 0)
	 finalObj.sgstAmt =  $("#SGSTTotal").html();
	 if ($("#SGSTTotal").length > 0)
		 finalObj.sgstAmt =  $("#SGSTTotal").html();
	 if ($("#IGSTTotal").length > 0)
		 finalObj.igstAmt =  $("#IGSTTotal").html();
	 if ($("#totaldiscount").length > 0)
	 finalObj.totalDiscounts = $("#totaldiscount").html();
	 if ($("#grandTotal").length > 0)
	 finalObj.totalItemCost = $("#grandTotal").html();
	 
	 if ($("#totalAmt").length > 0)
	 finalObj.totalCost=  $("#totalAmt").html()
	 /*if ($("#discounts").length > 0)
	 finalObj.totalDiscounts = $("#discounts").val();*/
	 
	 var status = $("#statusofInvoice").val();
	 if(status==""){
		 $('#Error').html('Please Update The Status');
			focusDiv("Error");
    		 return;
		}else{
		var invoiceStatus = status;
		}
	 finalObj.invoiceStatus = invoiceStatus;
		
	 var formData  = JSON.stringify(finalObj);
	 
	 console.log(formData)
	 
	 if(type=='edit')
		 var URL = contextPath + "/whInvoice/updateInvoice.do";
	else
	var URL = contextPath + "/whInvoice/createInvoice.do";
	 $.ajax({
  			type: "POST",
  			url : URL,
  			contentType: "application/json",
  			data : 	formData,
  			beforeSend: function(xhr){                    
  	   			$("#loading").css("display","block");
  	   			$("#mainDiv").addClass("disabled");
  	   		  },
	   		success : function(result){
   			$('#right-side').html(result);
   			
   			if(id!=undefined && id != "")
   				activeMenu(id);
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


function searchorderref(searchName, searchCategory)
{
	var contextPath = $("#contextPath").val();
	 URL = contextPath + "/inventorymanager/searchOrderRef.do";
	 $.ajax({
			type: "GET",
			url : URL,
			data : {
				searchName : searchName
			},
			beforeSend: function(xhr){                    
 	   			$("#loading").css("display","block");
 	   			$("#mainDiv").addClass("disabled");
 	   		  },
			success : function(result) {
				appendOrderRef(result, searchCategory);
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
function appendOrderRef(suppliersList, searchCategory){
	 $("."+searchCategory).html('');
	 var op = '';
	 for(var i=0;i<suppliersList.length;i++){
		 if (i == 0) {
			 op += '<li id="'+suppliersList[i].orderId+'"  class="selected" onclick=getCode(this,"'+searchCategory+'"); ><a>'+suppliersList[i].orderId+'</a></li>';
		}else
			 op += '<li id="'+suppliersList[i].orderId+'" onclick=getCode(this,"'+searchCategory+'"); ><a>'+suppliersList[i].orderId+'</a></li>';
	 }
	 $("."+searchCategory).html(op);
	 $("."+searchCategory).show();
}

function getCode(element,type){
	var id= $(element).attr("id");
	//$("#supplier_Id").val(id);
	var label = $(element).children("a").text();
	$("#orderRef").val(label);
	 $(".services").hide();
	 $("."+type).html("");
	 var contextPath = $("#contextPath").val();
	 URL = contextPath + "/inventorymanager/searchOrderRefItems.do";
	 $.ajax({
			type: "GET",
			url : URL,
			data : {
				searchName : label
			},
			beforeSend: function(xhr){                    
 	   			$("#loading").css("display","block");
 	   			$("#mainDiv").addClass("disabled");
 	   		  },
			success : function(result) {
				appendInvoices(result);
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

function getCodes(element,type){
	debugger;
	var id= $(element).attr("id");
	$("#supplier_Id").val(id);
	var state= $(element).attr("state");
	$("#supplier_state").val(state);
	var label = $(element).children("a").text();
	$("#searchSupplier").val(label);
	 $(".services").hide();
	 $("."+type).html("");
}




function appendInvoices(invoice)
{ 
	var location=invoice.saleLocation;
	$("#fromLocation option:selected").text(invoice.saleLocation);	
	$("#orderDate").val(invoice.order_date);	
	var billto=invoice.billing_address_doorNo+","+invoice.billing_address_street;
	$("#billTo").val(billto);
	$("#billTo1").val(invoice.billing_address_city);
	$("#subTotal").val(invoice.totalOrderAmount);
	$("#tax").val(invoice.orderTax);
	$("#shipmentCharges").val(invoice.shipmentCharges);
	
	var contextPath = $("#contextPath").val();
	 var len = parseInt($("#invoiceproductsList tr").length);
		if (len != 1)
			len = parseInt($("#invoiceproductsList tr:last").attr("id").replace('dynamicdiv', '')) + 1;
		var description = null;
		if (invoice.description != "" && invoice.description != null)
			description = invoice.description;
		else
			description = $("#desc").val();
		
		var make = invoice.make;
		if(make == "" || make == null)
			make = "_";
		var slNo = 1; 
			 $('.slno').each(function(){
				$(this).text(slNo);
				slNo = parseInt(slNo) + 1;
			});
			 
			 for(var i=0;i<invoice.itemDetails.length;i++)
			{
			var row = "<tr id='dynamicdiv"+len+"' style='margin-top:5px;'><td class='slno' id='itemno"+len+"'>"+len+"</td><td id='itemCode"+len+"'>"+invoice.itemDetails[i].skuId+"</td>" +
			"<td id='itemDesc"+len+"'>"+invoice.itemDetails[i].item_name+"</td>"+
			"<td id='uom"+len+"'>-</td>" +
			"<td id='qty"+len+"' ><input style='text-align: center;width:75px;' type='number' id='Received"+len+"' class='Received'  name='Received'  onBlur='changePack(this);' value='1' /></td>" +
			"<td id='packets"+len+"' ><input type='text' id='packets"+len+"' style='  width: 75px;' name='packets'></td><td id='price"+len+"'>"+invoice.itemDetails[i].item_price+"</td>" +
			"<td class='amount' id='amount"+len+"' >"+invoice.itemDetails[i].total_cost+"</td><td id='Del"+len+"'>" +
			"<img id='Img"+len+"' src='"+contextPath+"/images/itemdelete.png' style='width:40%;cursor:pointer;' onclick='deleteItem(this);' title='Delete "+invoice.itemDetails[i].skuId+"'/></td></tr>";
			$("#invoiceproductsList tbody").append(row);
			len=len+1;
				 }
			changeTotalCost();
			
	appendreflocations(location);
}


function changePack(element){
	debugger;
	var id = $(element).attr("id");
	if (isNaN($("#"+id).val()) || $("#"+id).val() == "")
		$('#'+id).val("1");
	var rowNo = id.replace('Received','');
	var packVal = parseFloat($('#Received'+rowNo).val());
	
	
	if(packVal<=0){
		debugger;
		alert("Quantity should not be empty");
		var priceVal = parseFloat($('#costPrice'+rowNo).html());
		$('#Received'+rowNo).val(1);
		$('#amount'+rowNo).html(priceVal);


		changeTotalCost();
		changeTotalSubQuantities();
		changeInvoiceTotal();
		
	}else{
		/*var priceVal = parseFloat($('#costPrice'+rowNo).html());
		
		$('#amount'+rowNo).html(parseFloat(packVal*priceVal).toFixed(2));*/
		

		/*var cgstTaxRate = parseFloat($('#cgstrate'+rowNo).html());
		var sgstTaxRate = parseFloat($('#sgstrate'+rowNo).html());
		var igstTaxRate = parseFloat($('#igstrate'+rowNo).html());
		var cessTaxRate = parseFloat($('#cessrate'+rowNo).html());
		
		
		var cgst = parseFloat((cgstTaxRate*priceVal*packVal)/100).toFixed(2);
		var sgst = parseFloat((sgstTaxRate*priceVal*packVal)/100).toFixed(2);
		var igst = parseFloat((igstTaxRate*priceVal*packVal)/100).toFixed(2);
		var cess = parseFloat((cessTaxRate*priceVal*packVal)/100).toFixed(2);
	
		$('#cgst'+rowNo).html(cgst);
		$('#sgst'+rowNo).html(sgst);
		$('#igst'+rowNo).html(igst);
		$('#cess'+rowNo).html(cess);*/
		
		//changeTotalQuantity();
	
		changeTotalCost();
		changeTotalSubQuantities();
		changeInvoiceTotal();
	}
}


function changePackRate(element){
	debugger;
	var id = $(element).attr("id");
	if (isNaN($("#"+id).html()) || $("#"+id).html() == "")
		$('#'+id).html("1");
	var rowNo = id.replace('rate','');
	
	var rateVal = parseFloat($('#rate'+rowNo).val());
	var cost = parseFloat($('#costPrice'+rowNo).html());
	var quantity = parseFloat($('#Received'+rowNo).val());
	var rate = rateVal/2;
	
		
		var taxvalueofsgst =  (rate*cost*quantity)/100;
		var taxvalueofcgst =  (rate*cost*quantity)/100;
	
		$('#cgstrate'+rowNo).html(rate);
		$('#sgstrate'+rowNo).html(rate);
		$('#cgst'+rowNo).html(parseFloat(taxvalueofcgst).toFixed(2));
		$('#sgst'+rowNo).html(parseFloat(taxvalueofsgst).toFixed(2));
		
		//changeTotalQuantity();
		changeTotalCost();
		changeTotalSubQuantities();
		changeInvoiceTotal();
	}




function changeInvoiceTotal()
{
	debugger;
	var otherTax = parseFloat($("#other_taxgrn").val());
	if (isNaN(otherTax)){
		otherTax = 0;
	$("#other_taxgrn").val(0.0);
	}
	var discounts = parseFloat($("#discounts").val());
	if (isNaN(discounts)){
		discounts = 0;
	$("#discounts").val(0.0);
	}
	
	var shipcharges = parseFloat($("#shipmentCharges").val());
	
	
	
	var grandTotal = parseFloat($("#grandTotal").html());
	var total = (grandTotal + otherTax+shipcharges) - discounts; 
	$('#totalAmt').val(parseFloat(total+0.00).toFixed(2));

}

 

/*function changeTotalCost(){
	debugger;
	var totalCost=0.0;
	$('.amount').each(function(){
		debugger;
	  var productName = $(this).attr("id").replace('amount','');
	  var cost = $("#amount"+productName).html();
	  totalCost = totalCost + parseFloat(cost);
	
	  	
	});
	
	var taxval=parseFloat($("#taxvalue").val());
	if(isNaN(taxval))
		{
		
		} else
			{
			var tax=parseFloat($("#tax").val())+taxval;
			$("#tax").val(tax);
			}
	$("#subTotal").val(totalCost);
	var totalInvoice=0;
	totalInvoice=totalCost;//+parseFloat($("#tax").val())+parseFloat($("#shipmentCharges").val())
	$("#total").val(totalInvoice);
}*/


function changeTotalCost(){
	debugger;
	var totalCost=0.0;
	var countValue= 0;
	 var noofitems = 0.0;
	 var totalInvoice=0;
	 var taxval = 0.0;
	 var shipmentCost = 0.0;
	 var tax = 0.0;
	 var totaltax = 0.0;
	 
	$('.amount').each(function(){
		debugger;
	  var row = $(this).attr("id").replace('amount','');
	 
  var cost = $("#costPrice"+row).html();
 var taxlist=$("#taxationlist"+row).val();
	  if(taxlist != undefined && taxlist != ""){
	  var tax = JSON.parse(taxlist);

	  if(tax != undefined && tax != null){
		
			var taxRate=0.0;
			if(tax!=null)
				if(tax.length>0){
					for(var i=0;i<tax.length;i++)
	    			{
	    			if(tax[i].taxCode == "CGST")
	    				if(tax[i].saleRangesList.length != null  && tax[i].saleRangesList.length > 0){
							
							for(var t=0;t<tax[i].saleRangesList.length;t++)
							{
							if(parseFloat(tax[i].saleRangesList[t].saleValueTo) >= cost && parseFloat(tax[i].saleRangesList[t].saleValueFrom) <= cost ){
								taxRate = tax[i].saleRangesList[t].taxRate;
							break;
							}
							}
							}else{
								taxRate = tax[i].taxRate;
							}
	    			}
					
				}
			
			var cgstTaxRate=0.0;
			if(tax!=null)
				if(tax.length>0){
			for(var i=0;i<tax.length;i++)
			{
			if(tax[i].taxCode == "CGST")
				if(tax[i].saleRangesList.length != null && tax[i].saleRangesList.length > 0){
					
					for(var u=0;u<tax[i].saleRangesList.length;u++)
					{
						if(parseFloat(tax[i].saleRangesList[u].saleValueTo) >= cost && parseFloat(tax[i].saleRangesList[u].saleValueFrom) <= cost ){
							cgstTaxRate = tax[i].saleRangesList[u].taxRate;
						break;
						}
					
					}
					}else{
						cgstTaxRate = tax[i].taxRate;
					}
			}
			}
			
			
			var sgstTaxRate=0.0;
			if(tax!=null)
				if(tax.length>0){
			for(var i=0;i<tax.length;i++)
			{
			if(tax[i].taxCode == "SGST")
                   if(tax[i].saleRangesList.length != null  && tax[i].saleRangesList.length > 0){
					
					for(var v=0;v<tax[i].saleRangesList.length;v++)
					{
						if(parseFloat(tax[i].saleRangesList[v].saleValueTo) >= cost && parseFloat(tax[i].saleRangesList[v].saleValueFrom) <= cost ){
							sgstTaxRate = tax[i].saleRangesList[v].taxRate;
						break;
						}
					
					
					}
					}else{
						sgstTaxRate = tax[i].taxRate;
					}
			}
			}
			
			
			
			var cessRate=0.0;
			if(tax!=null)
				if(tax.length>0){
			for(var i=0;i<tax.length;i++)
			{
			if(tax[i].taxCode == "CESS")
				
                 if(tax[i].saleRangesList.length != null  && tax[i].saleRangesList.length > 0){
					
					for(var w=0;w<tax[i].saleRangesList.length;w++)
					{
						if(parseFloat(tax[i].saleRangesList[w].saleValueTo) >= cost && parseFloat(tax[i].saleRangesList[w].saleValueFrom) <= cost ){
							cessRate = tax[i].saleRangesList[w].taxRate;
						break;
						}
					
					
					}
					}else{
						cessRate = tax[i].taxRate;
					}
			}
			}	
			
			var igstRate=0.0;
			if(tax!=null)
				if(tax.length>0){
			for(var i=0;i<tax.length;i++)
			{
			if(tax[i].taxCode == "IGST")
				
				 if(tax[i].saleRangesList.length != null  && tax[i].saleRangesList.length > 0){
					
					for(var x=0;x<tax[i].saleRangesList.length;x++)
					{
						
						if(parseFloat(tax[i].saleRangesList[x].saleValueTo) >= cost && parseFloat(tax[i].saleRangesList[x].saleValueFrom) <= cost ){
							igstRate = tax[i].saleRangesList[x].taxRate;
						break;
						}
					
					}
					}else{
						igstRate = tax[i].taxRate;
					}
			}
			}	
			
			
			
			var locationstate = $("#stateName").val();
			var suppierstate = $("#supplier_state").val();
			
			
			 if(locationstate.toUpperCase() !=  suppierstate.toUpperCase()){
				sgstTaxRate= 0.0;
				cgstTaxRate= 0.0;
				taxRate= 0.0;
			 }else{
				 igstRate = 0.0;
			 }
			 if(cgstTaxRate == undefined){
				 cgstTaxRate = 0.0; 
			 }
          if(sgstTaxRate == undefined){
	                sgstTaxRate = 0.0;			 
			 }
                if(igstRate == undefined){
	            igstRate = 0.0; 
                    }
          	 /* if($("#taxInclusive").is(':checked'))
     		 {
			
			 $("#tax"+rowNo).html(parseFloat(cgstTaxRate+sgstTaxRate+igstRate).toFixed(1));
			 $("#igsttaxRate"+rowNo).val(igstRate);
			 }else{*/
		      
				 
				var  itemTaxExcl = ( ((parseFloat(cost) * (parseFloat(cgstTaxRate+sgstTaxRate+igstRate))) / 100));
				var exclsiveCost = parseFloat(cost)+itemTaxExcl;
				
				
				var taxRate=0.0;
				if(tax!=null)
					if(tax.length>0){
						for(var i=0;i<tax.length;i++)
		    			{
		    			if(tax[i].taxCode == "CGST")
		    				if(tax[i].saleRangesList.length != null  && tax[i].saleRangesList.length > 0){
								
								for(var t=0;t<tax[i].saleRangesList.length;t++)
								{
								if(parseFloat(tax[i].saleRangesList[t].saleValueTo) >= exclsiveCost && parseFloat(tax[i].saleRangesList[t].saleValueFrom) <= exclsiveCost ){
									taxRate = tax[i].saleRangesList[t].taxRate;
								break;
								}
								}
								}else{
									taxRate = tax[i].taxRate;
								}
		    			}
						
					}
				
				var cgstTaxRate=0.0;
				if(tax!=null)
					if(tax.length>0){
				for(var i=0;i<tax.length;i++)
				{
				if(tax[i].taxCode == "CGST")
					if(tax[i].saleRangesList.length != null && tax[i].saleRangesList.length > 0){
						
						for(var u=0;u<tax[i].saleRangesList.length;u++)
						{
							if(parseFloat(tax[i].saleRangesList[u].saleValueTo) >= exclsiveCost && parseFloat(tax[i].saleRangesList[u].saleValueFrom) <= exclsiveCost ){
								cgstTaxRate = tax[i].saleRangesList[u].taxRate;
							break;
							}
						
						}
						}else{
							cgstTaxRate = tax[i].taxRate;
						}
				}
				}
				
				
				var sgstTaxRate=0.0;
				if(tax!=null)
					if(tax.length>0){
				for(var i=0;i<tax.length;i++)
				{
				if(tax[i].taxCode == "SGST")
	                   if(tax[i].saleRangesList.length != null  && tax[i].saleRangesList.length > 0){
						
						for(var v=0;v<tax[i].saleRangesList.length;v++)
						{
							if(parseFloat(tax[i].saleRangesList[v].saleValueTo) >= exclsiveCost && parseFloat(tax[i].saleRangesList[v].saleValueFrom) <= exclsiveCost ){
								sgstTaxRate = tax[i].saleRangesList[v].taxRate;
							break;
							}
						
						
						}
						}else{
							sgstTaxRate = tax[i].taxRate;
						}
				}
				}
				
				
				
				var cessRate=0.0;
				if(tax!=null)
					if(tax.length>0){
				for(var i=0;i<tax.length;i++)
				{
				if(tax[i].taxCode == "CESS")
					
	                 if(tax[i].saleRangesList.length != null  && tax[i].saleRangesList.length > 0){
						
						for(var w=0;w<tax[i].saleRangesList.length;w++)
						{
							if(parseFloat(tax[i].saleRangesList[w].saleValueTo) >= exclsiveCost && parseFloat(tax[i].saleRangesList[w].saleValueFrom) <= exclsiveCost ){
								cessRate = tax[i].saleRangesList[w].taxRate;
							break;
							}
						
						
						}
						}else{
							cessRate = tax[i].taxRate;
						}
				}
				}	
				
				var igstRate=0.0;
				if(tax!=null)
					if(tax.length>0){
				for(var i=0;i<tax.length;i++)
				{
				if(tax[i].taxCode == "IGST")
					
					 if(tax[i].saleRangesList.length != null  && tax[i].saleRangesList.length > 0){
						
						for(var x=0;x<tax[i].saleRangesList.length;x++)
						{
							
							if(parseFloat(tax[i].saleRangesList[x].saleValueTo) >= exclsiveCost && parseFloat(tax[i].saleRangesList[x].saleValueFrom) <= exclsiveCost ){
								igstRate = tax[i].saleRangesList[x].taxRate;
							break;
							}
						
						}
						}else{
							igstRate = tax[i].taxRate;
						}
				}
				}	
				
				
				
				var locationstate = $("#stateName").val();
				var suppierstate = $("#supplier_state").val();
				
				
				 if(locationstate.toUpperCase() !=  suppierstate.toUpperCase()){
					sgstTaxRate= 0.0;
					cgstTaxRate= 0.0;
					taxRate= 0.0;
					$("#igstrate"+row).html(igstRate);	
					 $("#cgstrate"+row).html(cgstTaxRate);	
					 $("#sgstrate"+row).html(sgstTaxRate);	
				     $("#cessrate"+row).html(cessRate);	
				
				 }else{
					 igstRate = 0.0;
					 $("#cgstrate"+row).html(cgstTaxRate);
					 $("#igstrate"+row).html(igstRate);	
				      $("#sgstrate"+row).html(sgstTaxRate);	
					 $("#cessrate"+row).html(cessRate);	

				 }
				 if(cgstTaxRate == undefined){
					 cgstTaxRate = 0.0; 
				 }
	          if(sgstTaxRate == undefined){
		                sgstTaxRate = 0.0;			 
				 }
	                if(igstRate == undefined){
		            igstRate = 0.0; 
	                    }


	                if(cessRate == undefined){
		              cessRate = 0.0; 
	                    }


	  }
	  }


   
	
	     var freeqty = 0;
		 if (isNaN(parseFloat($("#freeqty"+row).val()))) {
			freeqty = 0;
			$("#freeqty"+row).val(0);
			}else{
			freeqty	= parseFloat($("#freeqty"+row).val());
			}
		noofitems = noofitems+  parseFloat($("#Received"+row).val())+freeqty;
		 countValue = countValue+1;
		 
		 var discountpercentage = 0;
		 if (isNaN(parseFloat($("#discountpercentage"+row).val()))) {
			discountpercentage = 0;
			$("#discountpercentage"+row).val(0);
			}else{
			discountpercentage	= parseFloat($("#discountpercentage"+row).val());
			}
		 
		 discountpercentage = discountpercentage/100;
		 
	     var discountAmt = parseFloat($("#discountAmt"+row).val());
	      if (isNaN(discountAmt)) {
					discountAmt = 0;
					$("#discountAmt"+row).val(0);
					}else{
					discountAmt	= parseFloat($("#discountAmt"+row).val());
					}
					
					var ette = parseFloat($("#Received"+row).val());
	          
	     var costPriceforQty = 0.0;
	     var costPriceOrg = 0.0;
         var Costpriceval = 0.0;
	     var received = parseFloat($("#Received"+row).val());


      if($('#pricerealedit'+row).val() == "true" ){
	
	 Costpriceval = parseFloat($("#costPrice"+row).html());
	 costPriceforQty = Costpriceval-((Costpriceval*discountpercentage)+(discountAmt/received));
	 costPriceOrg = costPriceforQty*received;
	
      $("#pricereal"+row).val(Costpriceval);

      }else{
	
	 Costpriceval = parseFloat($("#pricereal"+row).val());
	 costPriceforQty = Costpriceval-((Costpriceval*discountpercentage)+(discountAmt/received));
	 costPriceOrg = costPriceforQty*received;
      }

        $('#Received'+row).html(parseFloat(received).toFixed(2));
          $('#costPrice'+row).html(costPriceforQty.toFixed(2));





	   var discountpercentageval = parseFloat($('#discountpercentage'+row).val());
		
	    if(discountpercentageval >100){
		$("#Error").html("Discount Can not be more than 100%.");
		$('#discountpercentage'+row).val("0");
		return
	    }else{
		$("#Error").html("");
	    }
	    
		
		
		 if(isNaN(totaltax))
			 totaltax =0.0;
		
	    var  cessTaxrate = parseFloat($("#cessrate"+row).html());
		var  cgstTaxrate = parseFloat($("#cgstrate"+row).html());
		var  igstTaxrate = parseFloat($("#igstrate"+row).html());
		var  sgstTaxrate =parseFloat($("#sgstrate"+row).html());
		
	 if(isNaN(cessTaxrate))
			 cessTaxrate =0.0;
		 if(isNaN(cgstTaxrate))
			 cgstTaxrate =0.0;
		 if(isNaN(igstTaxrate))
			 igstTaxrate =0.0;
		 if(isNaN(sgstTaxrate))
			 sgstTaxrate =0.0;
		
		var  cessTax = (costPriceOrg*cessTaxrate)/ 100;
		var  cgstTax =  (costPriceOrg*cgstTaxrate)/ 100; 
		var  igstTax =  (costPriceOrg*igstTaxrate)/ 100;
		var  sgstTax =  (costPriceOrg*sgstTaxrate)/ 100;
		
		 $("#igst"+row).html(igstTax.toFixed(2));
	     $("#cgst"+row).html(cgstTax.toFixed(2));
         $("#sgst"+row).html(sgstTax.toFixed(2));
         $("#cess"+row).html(cessTax.toFixed(2));
		
		
		
		  if(isNaN(cessTax))
			 cessTax =0.0;
		 if(isNaN(cgstTax))
			 cgstTax =0.0;
		 if(isNaN(igstTax))
			 igstTax =0.0;
		 if(isNaN(sgstTax))
			 sgstTax =0.0;
		
		
		 var taxval = sgstTax+igstTax+cgstTax+cessTax;
	     var taxvalrate  = sgstTaxrate+igstTaxrate+cgstTaxrate+cessTaxrate;
		
		
	    $("#taxvalue"+row).val(taxval)
	 
		 var tax =  $("#taxvalue"+row).val();
			if(isNaN(tax) || tax == null || tax == undefined)
				tax = 0.0;
			
			if(isNaN(taxval))
				{
				taxval = 0.0;
				} else {
				totaltax=totaltax+taxval;
				}
				
		totalCost = totalCost+costPriceOrg;
	
      $("#amount"+row).html((costPriceOrg+taxval).toFixed(2));
			
	});
	
	
	
	$("#tax").val(totaltax.toFixed(2));
	$("#subtotalCostInv").val(parseFloat(totalCost).toFixed(2));
	
	var shipmentCost = $("#shipmentCharges").val();
	if(isNaN(shipmentCost) || shipmentCost == "" || shipmentCost == null)
		$("#shipmentCharges").val(0.0);
	
	 $("#totalqty").val(noofitems);
	 $("#noofitems").val(countValue);
	 
	totalInvoice=totalCost+parseFloat($("#shipmentCharges").val()+totaltax)
	
	$("#totalAmt").val(totalInvoice.toFixed(2));
	
	

}


function changeTotalSubQuantities(){
	debugger;
	
				
		 var packTotal = [];
		   var totalPack=0.0;
		 
		   $('.cgst').each(function(){
				   if($(this).text()=="")
					   packTotal.push("0");
				   else
					   {
					   packTotal.push( $(this).text() );  
					   }
		   });
		   	 
			
			for (var i = 0; i < packTotal.length; i++) {
				totalPack  = parseFloat(totalPack) + parseFloat(packTotal[i]);
			}
			if(totalPack < 0)
				totalPack = totalPack * (-1);
				
			$('#CGSTTotal').text(parseFloat(totalPack+0.00).toFixed(2));
	  	
	

			 var packTotal = [];
			   var totalPack=0.0;
			 
			   $('.sgst').each(function(){
					   if($(this).text()=="")
						   packTotal.push("0");
					   else
						   {
						   packTotal.push( $(this).text() );  
						   }
			   });
			   	 
				
				for (var i = 0; i < packTotal.length; i++) {
					totalPack  = parseFloat(totalPack) + parseFloat(packTotal[i]);
				}
				if(totalPack < 0)
					totalPack = totalPack * (-1);
					
				$('#SGSTTotal').text(parseFloat(totalPack+0.00).toFixed(2));
				
				
				var packTotal = [];
				   var totalPack=0.0;
				 
				   $('.igst').each(function(){
						   if($(this).text()=="")
							   packTotal.push("0");
						   else
							   {
							   packTotal.push( $(this).text() );  
							   }
				   });
				   	 
					
					for (var i = 0; i < packTotal.length; i++) {
						totalPack  = parseFloat(totalPack) + parseFloat(packTotal[i]);
					}
					if(totalPack < 0)
						totalPack = totalPack * (-1);
						
					$('#IGSTTotal').text(parseFloat(totalPack+0.00).toFixed(2));
	
					
					var packTotal = [];
					   var totalPack=0.0;
					   $('.cess').each(function(){
							   if($(this).text()=="")
								   packTotal.push("0");
							   else
								   {
								   packTotal.push( $(this).text() );  
								   }
					   });
					   	 
						
						for (var i = 0; i < packTotal.length; i++) {
							totalPack  = parseFloat(totalPack) + parseFloat(packTotal[i]);
						}
						if(totalPack < 0)
							totalPack = totalPack * (-1);
							
						$('#CESSTotal').text(parseFloat(totalPack+0.00).toFixed(2));
						
						
						var packTotal = [];
						   var totalPack=0.0;
						 
						   $('.discountAmt').each(function(){
								   if($(this).text()=="")
									   packTotal.push("0");
								   else
									   {
									   packTotal.push( $(this).text() );  
									   }
						   });
						   	 
							
							for (var i = 0; i < packTotal.length; i++) {
								totalPack  = parseFloat(totalPack) + parseFloat(packTotal[i]);
							}
							if(totalPack < 0)
								totalPack = totalPack * (-1);
								
							$('#totaldiscount').text(parseFloat(totalPack+0.00).toFixed(2));
							$('#discounts').text(parseFloat(totalPack+0.00).toFixed(2));
							
							
				 var packTotal = [];
				   var totalPack=0.0;
				 
				   $('.amount').each(function(){
						   if($(this).text()=="")
							   packTotal.push("0");
						   else
							   {
							   packTotal.push( $(this).text() );  
							   }
				   });
				   	 
					
					for (var i = 0; i < packTotal.length; i++) {
						totalPack  = parseFloat(totalPack) + parseFloat(packTotal[i]);
					}
					if(totalPack < 0)
						totalPack = totalPack * (-1);
						
					$('#grandTotal').text(parseFloat(totalPack+0.00).toFixed(2));
	  	

					 var packTotal = [];
					   var totalPack=0.0;
					
					 $('.Received').each(function(){
						   if($(this).val()=="")
							   packTotal.push("0");
						   else
							   {
							   		packTotal.push($(this).val());  
							   }
				   });
				   	 
				   
					
					for (var i = 0; i < packTotal.length; i++) {
						totalPack  = parseFloat(totalPack) + parseFloat(packTotal[i]);
					}
					if(totalPack < 0)
						totalPack = totalPack * (-1);
						
					$('#totalQty').text(parseFloat(totalPack+0.00).toFixed(2));
					
					
					
					 var freeqtyTotal = [];
					   var freeqtyPack=0.0;
					
					 $('.freeqty').each(function(){
						   if($(this).val()=="")
							   freeqtyTotal.push("0");
						   else
							   {
							   		freeqtyTotal.push($(this).val());  
							   }
				   });
				   	 
				   
					
					for (var i = 0; i < freeqtyTotal.length; i++) {
						freeqtyPack  = parseFloat(freeqtyPack) + parseFloat(freeqtyTotal[i]);
					}
					if(freeqtyPack < 0)
						freeqtyPack = freeqtyPack * (-1);
						
					$('#totalfreeqty').text(parseFloat(freeqtyPack+0.00).toFixed(2));
					
					
					
					
					 var disAmtTotal = [];
					   var disAmtPack=0.0;
					
					 $('.discountAmt').each(function(){
						   if($(this).val()=="")
							   disAmtTotal.push("0");
						   else
							   {
							   		disAmtTotal.push($(this).val());  
							   }
				   });
				   	 
				   
					
					for (var i = 0; i < disAmtTotal.length; i++) {
						disAmtPack  = parseFloat(disAmtPack) + parseFloat(disAmtTotal[i]);
					}
					if(disAmtPack < 0)
						disAmtPack = disAmtPack * (-1);
						
					$('#totaldiscount').text(parseFloat(disAmtPack+0.00).toFixed(2));
					
					
					
					
					var CessTotal = [];
					   var  CessPack=0.0;
					
					 $('.cess').each(function(){
						   if($(this).val()=="")
							   CessTotal.push("0");
						   else
							   {
							   		CessTotal.push($(this).val());  
							   }
				   });
				   	 
				   
					
					for (var i = 0; i < CessTotal.length; i++) {
						CessPack  = parseFloat(CessPack) + parseFloat(CessTotal[i]);
					}
					if(CessPack < 0)
						CessPack = CessPack * (-1);
						
					$('#CESSTotal').text(parseFloat(CessPack+0.00).toFixed(2));


	
	
	
}



function appendreflocations(location)
{
	//$("#billTo2").val(invoice[0].billing_address_street);
	 var contextPath = $("#contextPath").val();
	 URL = contextPath + "/inventorymanager/orderRefLocations.do";
	 $.ajax({
			type: "GET",
			url : URL,
			data : {
				locationId : location
			},
			beforeSend: function(xhr){                    
 	   			$("#loading").css("display","block");
 	   			$("#mainDiv").addClass("disabled");
 	   		  },
			success : function(result) {
				appendLocations(result);
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
function appendLocations(loc)
{
	$("#address_streetname").val(loc[0].address);	
	$("#address_city").val(loc[0].city);	
	$("#address_countryname").val(loc[0].country);
	$("#fromLocation option:selected").text(loc[0].locationId);
}

$("#orderRef").on('input',function(e){
	
	$("#orderRefError").html("");
	if($("#orderRef").val().length<3){
		$("#supplier_Id").val("");
	}
	$(".orderRef").children("li").each(function(){
		var supplierName = $(this).children("a").text().trim();
		if($("#orderRef").val().trim().toLowerCase() == supplierName.toLowerCase()){
			$("#orderRef").val($("#orderRef").val().trim());
			//$("#supplier_Id").val($(this).attr("id"));
			 $(".services").hide();
			 $(".matchedStringUl").html("");
			return;
		}
		else{
			$("#supplier_Id").val("");
		}
	});
	if(e.keyCode == 9){
		
		if($("#orderRef").val()!=""){
			 $("#orderRefError").html("Supplier Name doesn't exist");
		 }
		 $(".services").hide();
		 $(".matchedStringUl").html("");
	}
});


function changeAddressOfInvoice()
{
	debugger;
	$(".Error").html("");
	 $("#invoiceNumberError").html("");
	 $("#gstinError").html("");
	 $("#searchSupplierError").html("");
	 $("#deliveryByError").html("");
	 $("#fromLocError").html("");
	 
	var locationId = $("#fromLocation").val();
	if(locationId == "" || locationId == "-- Select --"){
		$("#fromStreetName").val("");
		$("#fromAddress").val("");
		$("#fromCity").val("");
		$("#fromState").val("");
		$("#fromCountry").val("");
		$("#fromContactNum").val("");
		$("#fromEmail").val("");
		$("#fromZipCode").val("");
		return;
	}
	var contextPath = $("#contextPath").val();
	URL = contextPath + "/admin/getLocationDetails.do";
	$.ajax({
		type: "GET",
		url : URL,
		data : {
			locationId : locationId
		},
		beforeSend: function(xhr){                    
	   			$("#loading").css("display","block");
	   			$("#mainDiv").addClass("disabled");
	   		  },
		success : function(result) {
			appendLocationDetails(result);
			$("#deliveryLocation ").val(locationId);/*each(function(){*/
				  /*if ($(this).text() == locationId)
					  $(this).attr("selected","selected");
				});*/
			$("#loading").css("display","none");
			$("#mainDiv").removeClass('disabled');
			$("#fromlocationError").html("");
		},
		error : function() {
			 alert("something went wrong");
			 $("#loading").css("display","none");
			 $("#mainDiv").removeClass('disabled');
		}
	});
	
}

function appendLocationDetails(locationBean){
	
	$("#stateName").val(locationBean.state);
	$("#emailId").val(locationBean.officeMailId);
	$("#pinValue").val(locationBean.pin);
}

/*function addSKUs()
{
	debugger;
	var poRef = "";
		if ($("#po_reference").length > 0)
			{
			poRef = $("#po_reference").val();
			getInvoicePoItems(poRef);
			}
}*/



function searchInvoicePoRefs(name, searchCategory){
	 var contextPath = $("#contextPath").val(); 
	 var storeLocation = $("#fromLocation  option:selected").text();
	 URL = contextPath + "/procurement/searchPoRefs.do";
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
       		appendPoRefs(result, searchCategory);
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









function appendPoRefs(poRefsList, searchCategory){
	 $("."+searchCategory).html('');
	 var op = '';
	 for(var i=0;i<poRefsList.length;i++){
			 if (i == 0) {
				 op += '<li id="'+poRefsList[i]+'"  class="selected" onclick=getIds(this,"'+searchCategory+'"); ><a>'+poRefsList[i]+'</a></li>';
			}else
			     op += '<li id="'+poRefsList[i]+'" onclick=getIds(this,"'+searchCategory+'"); ><a>'+poRefsList[i]+'</a></li>';
	 }
	 $("."+searchCategory).html(op);
	 $("."+searchCategory).show();
	 
}


function getPoItems(poRefId){
	debugger
	 var contextPath = $("#contextPath").val();
	 var storeLocation = $("#fromLocation  option:selected").text();
	 URL = contextPath + "/procurement/getPoItems.do";
	 var type = "";
	type = $("#type").val();
	 $.ajax({
 			type: "GET",
 			url : URL,
 			data : {
 				poRefId : poRefId,
 				type : type,
 				storeLocation : storeLocation
 				
 			},
 			beforeSend: function(xhr){                    
  	   			$("#loading").css("display","block");
  	   			$("#mainDiv").addClass("disabled");
  	   		  },
 			success : function(result) {
 				
 				appendingInvoicePOdetails(result);
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





function appendingInvoicePOdetails(poItemsList)
{
debugger
var itemslist = poItemsList.itemDetails;

for(var j = 0; j < itemslist.length ; j++){
	
	var sku = itemslist[j];
	var contextPath = $("#contextPath").val();
	 if(itemslist.length > 0 && itemslist[0].location != undefined && itemslist[0].location != null && itemslist[0].location != ""){
		 $("#warehouse_location  option:selected").text(itemslist[0].location);
		}
		if(itemslist.length > 0 && itemslist[0].supplierId != undefined && itemslist[0].supplierId != null && itemslist[0].supplierId != ""){
			$("#supplier_Id").val(itemslist[0].supplierId);
		}
		if(itemslist.length > 0 && itemslist[0].supplierName != undefined && itemslist[0].supplierName != null && itemslist[0].supplierName != ""){
			$("#searchSupplier").val(itemslist[0].supplierName);
			}
			if(itemslist.length > 0 && itemslist[0].supplierstate != undefined && itemslist[0].supplierstate != null && itemslist[0].supplierstate != ""){
			$("#supplier_state").val(itemslist[0].supplierstate);
			}
	


	 var len = parseInt($("#invoiceproductsList tr").length)-2;
		if (len < 1)
			len = parseInt($("#invoiceproductsList tr:last").attr("id").replace('dynamicdiv', '')) + 1;
	
		
		
		var description = null;
		if (sku.itemDesc != "" && sku.itemDesc != null)
			description = sku.itemDesc;
		else
			description = $("#desc").val();
		var make = sku.make;
		if(make == "" || make == null)
			make = "";
		var pluCode = null;
		if (sku.pluCode != "" && sku.pluCode != null)
			pluCode = sku.pluCode;
		else
			pluCode = sku.skuId;
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

		var color = sku.color;
		if(color == null || color == "_")
			sku.color = "";
		var ean = sku.ean;
		if(ean == null)
			sku.ean = "";
		var size = sku.size;
		if(size == null || size == "_")
			sku.size = "";
		
		var hsnCode = sku.hsnCode;
		if(hsnCode == null)
			sku.hsnCode = "";
			
		var bactchNum = sku.bactchNum;
			if(bactchNum == null)
				sku.bactchNum = "";
				
		var expiryDateStr = sku.expiryDateStr;
			if(expiryDateStr == null)
				sku.expiryDateStr = "";
			
				var quantity = sku.quantity;
			if(quantity == null || quantity == "0.0")
				sku.quantity = "1";
			
			
				 var tax = sku.tax;
			 
			
			var cost=sku.itemPrice;
			sku.costPrice = cost;
			var quantity=sku.quantity;
			
			
			var taxRate=0.0;
			if(tax!=null)
				if(tax.length>0){
					for(var i=0;i<tax.length;i++)
	    			{
	    			if(tax[i].taxCode == "CGST")
	    				if(tax[i].saleRangesList.length != null  && tax[i].saleRangesList.length > 0){
							
							for(var t=0;t<tax[i].saleRangesList.length;t++)
							{
							if(parseFloat(tax[i].saleRangesList[t].saleValueTo) >= sku.costPrice && parseFloat(tax[i].saleRangesList[t].saleValueFrom) <= sku.costPrice ){
								taxRate = tax[i].saleRangesList[t].taxRate;
							break;
							}
							}
							}else{
								taxRate = tax[i].taxRate;
							}
	    			}
					
				}
			
			var sgstTaxRate=0.0;
			var cgstTaxRate=0.0;  
			if(tax!=null)
				if(tax.length>0){
			for(var i=0;i<tax.length;i++)
			{
			if(tax[i].taxCode == "CGST")
				if(tax[i].saleRangesList.length != null && tax[i].saleRangesList.length > 0){
					
					for(var u=0;u<tax[i].saleRangesList.length;u++)
					{
						if(parseFloat(tax[i].saleRangesList[u].saleValueTo) >= sku.costPrice && parseFloat(tax[i].saleRangesList[u].saleValueFrom) <= sku.costPrice ){
							cgstTaxRate = tax[i].saleRangesList[u].taxRate;
						break;
						}
					
					}
					}else{
						cgstTaxRate = tax[i].taxRate;
					}
			}
			}
			
			
			var sgstTaxRate=0.0;
			if(tax!=null)
				if(tax.length>0){
			for(var i=0;i<tax.length;i++)
			{
			if(tax[i].taxCode == "SGST")
                     if(tax[i].saleRangesList.length != null  && tax[i].saleRangesList.length > 0){
					
					for(var v=0;v<tax[i].saleRangesList.length;v++)
					{
						if(parseFloat(tax[i].saleRangesList[v].saleValueTo) >= sku.costPrice && parseFloat(tax[i].saleRangesList[v].saleValueFrom) <= sku.costPrice ){
							sgstTaxRate = tax[i].saleRangesList[v].taxRate;
						break;
						}
					
					
					}
					}else{
						sgstTaxRate = tax[i].taxRate;
					}
			}
			}
			
			var cessRate=0.0;
			if(tax!=null)
				if(tax.length>0){
			for(var i=0;i<tax.length;i++)
			{
			if(tax[i].taxCode == "CESS")
				
                   if(tax[i].saleRangesList.length != null  && tax[i].saleRangesList.length > 0){
					
					for(var w=0;w<tax[i].saleRangesList.length;w++)
					{
						if(parseFloat(tax[i].saleRangesList[w].saleValueTo) >= sku.costPrice && parseFloat(tax[i].saleRangesList[w].saleValueFrom) <= sku.costPrice ){
							cessRate = tax[i].saleRangesList[w].taxRate;
						break;
						}
					
					
					}
					}else{
						cessRate = tax[i].taxRate;
					}
			}
			}	
			
			var igstRate=0.0;
			if(tax!=null)
				if(tax.length>0){
			for(var i=0;i<tax.length;i++)
			{
			if(tax[i].taxCode == "IGST")
				
				 if(tax[i].saleRangesList.length != null  && tax[i].saleRangesList.length > 0){
						
						for(var x=0;x<tax[i].saleRangesList.length;x++)
						{
							
							if(parseFloat(tax[i].saleRangesList[x].saleValueTo) >= sku.costPrice && parseFloat(tax[i].saleRangesList[x].saleValueFrom) <= sku.costPrice ){
								igstRate = tax[i].saleRangesList[x].taxRate;
						break;
						}
						
						}
						}else{
							igstRate = tax[i].taxRate;
						}
			}
			}	
			
			
			var locationstate = $("#stateName").val();
			var suppierstate = $("#supplier_state").val();
			
			 if(locationstate.toUpperCase() !=  suppierstate.toUpperCase()){
				sgstTaxRate= 0.0;
 				cgstTaxRate= 0.0;
 				taxRate= 0.0;
			 }else{
				 igstRate = 0.0;
			 }
			
				var taxvalueofCgst=0.0;
				if(tax!=null)
				if(tax.length>0){
				taxvalueofCgst =  (cgstTaxRate*cost*quantity)/100;
				}
				
				var taxvalueofsgst=0.0;
				if(tax!=null)
				if(tax.length>0){
				taxvalueofsgst =  (sgstTaxRate*cost*quantity)/100;
				}
				
				var taxvalueofCess=0.0;
				if(tax!=null)
				if(tax.length>0){
				taxvalueofCess =  (cessRate*cost*quantity)/100;
				}
				
				var taxvalueofIgst=0.0;
				if(tax!=null)
					if(tax.length>0){
						taxvalueofIgst =  (igstRate*cost*quantity)/100;
					}
				
				if(tax<=0)
					{
					taxvalueofsgst = 0.0;
					taxvalueofCgst = 0.0;
					taxvalueofIgst = 0.0;
					taxvalueofCess = 0.0;
					}
				
			 var  taxamount=0.0;
			if(tax!=null)
				if(tax.length>0){
						taxamount = parseFloat(((sku.costPrice)*taxRate)/100).toFixed(2);
				}
			
			
			
			
		/*
		var tax=sku.cgstRate;
		var	 taxRate=0.0;
		//var cgstTaxRate=0.0
		if(tax!=null)
		 taxRate=sku.cgstRate;
		 else
		 taxRate=0.0;
		
		var grnsgstTax=sku.sgstRate;
		
		var grnsgstTaxRate=0.0;
		if(grnsgstTax!=null)
			grnsgstTaxRate=sku.sgstRate;
		else
			grnsgstTaxRate=0.0;
		
		
		
		
		var cgstValue=sku.cgstValue;
		var cgstTaxRateValue=0.0;
		if(cgstValue!=null)
			cgstTaxRateValue=sku.cgstValue;
		
		var sgstValue=sku.sgstValue;
		var sgstTaxRateValue=0.0;
		if(cgstValue!=null)
			sgstTaxRateValue=sku.sgstValue;
		
		
		if(tax <= 0)
		{
			sgstTaxRateValue=0.0;
			cgstTaxRateValue = 0.0;
		}*/
		
		
		/*var make = sku.make;
		if(make == "" || make == null)
			make = "_";*/
		var slNo = 1; 
			 $('.slno').each(function(){
				$(this).text(slNo);
				slNo = parseInt(slNo) + 1;
			});
			 
			
				var row = "<tr id='dynamicdiv"+len+"' style='margin-top:5px;'><td class='slno' id='itemno"+len+"'>"+slNo+"</td><td id='itemCode"+len+"'>"+sku.skuId+"</td>" +
				"<td id='itemDesc"+len+"'>"+description+"</td>"+
				"<input type='hidden' id='taxvalue"+len+"' value='"+parseFloat(taxvalueofsgst+taxvalueofCgst+taxvalueofIgst).toFixed(2)+"' />" +
				"<input type='hidden' id='color"+len+"' value='"+sku.color+"' />" +
				"<input type='hidden' id='size"+len+"' value='"+sku.size+"' />" +
				"<input type='hidden' id='uom"+len+"' value='"+sku.uom+"' />" +
				"<input type='hidden' id='pluCode"+len+"' value='' />" +
				"<input type='hidden' id='model"+len+"' value='' />" +
				"<input type='hidden' id='category"+len+"' value='"+sku.category+"' />" +
				"<input type='hidden' id='subCategory"+len+"' value='' />" +
				"<input type='hidden' id='section"+len+"' value='' />" +
		      	"<input type='hidden' id='taxationlist"+len+"' value='"+sku.taxdetailsStr+"'/>" +
                 "<input type='hidden' id='pricereal"+len+"' value='"+sku.itemPrice+"'/>" +
                 "<input type='hidden' id='pricerealedit"+len+"' value=''/>" +
       			 "<td id='ean"+len+"'>"+sku.ean+"</td>" +
				"<td id='HSN"+len+"'>"+sku.hsnCode+"</td>" +
				
				
			"<td><textarea id='batchNum"+len+"' rows=1 style='resize:none;width: 87px;'>"+sku.bactchNum+"</textarea></td>"+
			"<td><input class='form-control calendar_icon endDate' readonly='readonly' style='width:100px;background-color: white;' id='expiryDate"+len+"' type='text' onfocus=callCalender('expiryDate"+len+"') onclick=callCalender('expiryDate"+len+"') placeholder='DD/MM/YYYY' value='"+sku.expiryDateStr+"' /></td>" +
			"<td id='qty"+len+"'><input style='text-align: center;width:75px;' type='number' id='Received"+len+"' class='Received'  name='Received' value='"+sku.quantity+"'  onBlur='changePack(this);'/></td>" +
			"<td id='taxRate"+len+"'><input style='text-align: center;width:75px;' type='number' id='rate"+len+"' readonly='readonly'  name='rate' value='"+sku.tax+"'  onBlur='changePackRate(this);'/></td>" +

			"<td class='cgstrate' id='cgstrate"+len+"' >"+parseFloat(cgstTaxRate).toFixed(2)+"</td>" +
			"<td class='cgst' id='cgst"+len+"'>"+parseFloat(taxvalueofCgst).toFixed(2)+"</td>" +
			"<td class='sgstrate' id='sgstrate"+len+"'>"+parseFloat(sgstTaxRate).toFixed(2)+"</td>" +
			"<td class='sgst'  id='sgst"+len+"'>"+parseFloat(taxvalueofsgst).toFixed(2)+"</td>" +
			"<td class='igstrate' id='igstrate"+len+"'>"+parseFloat(igstRate).toFixed(2)+"</td>" +
			"<td class='igst'  id='igst"+len+"'>"+parseFloat(taxvalueofIgst).toFixed(2)+"</td>" +
			"<td class='cessrate'  id='cessrate"+len+"'>"+parseFloat(cessRate).toFixed(2)+"</td>" +
			"<td class='cess'  id='cess"+len+"'>"+parseFloat(taxvalueofCess).toFixed(2)+"</td>" +
			"<td><input id='freeqty"+len+"'  class='freeqty' onBlur='changeTotalSubQuantities();changeTotalCost()' onkeypress='PreventEnter(this);' type='number' style='width:70px;text-align:center' value='"+sku.freeQty+"' min='0' oninput='this.value = Math.abs(this.value)'></td>"+
			"<td><input id='discountpercentage"+len+"'   class='discountpercentage' onBlur='changePack(this);changeDiscPerc(this);changeTotalCost();' onkeypress='PreventEnter(this);'  min='0' type='number' style='width:70px;text-align:center' value='"+sku.discountPercentage+"' oninput='this.value = Math.abs(this.value)'></td>"+
			"<td><input id='discountAmt"+len+"'  class='discountAmt' onBlur='changePack(this);changeDiscAmt(this);changeTotalCost();' onkeypress='PreventEnter(this);' type='number'  min='0' style='width:70px;text-align:center' value='"+sku.discountAmt+"' oninput='this.value = Math.abs(this.value)'></td>"+
			"<td class='price'  id='costPrice"+len+"'  onBlur='changeSupplyPrice(this);' contenteditable='true'>"+sku.itemPrice+"</td>" +
			"<td class='amount' id='amount"+len+"' >"+sku.itemPrice+"</td>"+
			"<td id='Del"+len+"'>" +
			"<img id='Img"+len+"' src='"+contextPath+"/images/itemdelete.png' style='width:12%;cursor:pointer;' onclick='deleteItem(this);' title='Delete "+sku.skuId+"'/></td></tr>";

				$("#invoiceproductsList tbody").find('tr:last').prev().after(row);


			var cost=0;
			var quantity = $("#qty"+len).val();
			
			
			if(tax!=null)
				 taxRate=sku.cgstRate;
				 else
				 taxRate=0.0;
			
			//var taxRate=$("#cgstrate"+len).val();
			
			var taxvalueofCgst =  (taxRate*cost*quantity)/100;
			
			changeTotalCost();
			changeTotalSubQuantities();
			changeInvoiceTotal();
}
}


function invoicedetailsviewedit(invoice,type){
	debugger;
	 var contextPath = $('#contextPath').val();
	 var URL = contextPath + "/whInvoice/editViewInvoiceDetails.do";
	 $.ajax({
		type : "GET",
		url : URL,
		data : {
			type: type,
			invoiceId: invoice
		},
		beforeSend: function(xhr){                    
	   		$("#loading").css("display","block");
	   		$("#mainDiv").addClass("disabled");
	   	},
		success : function(result){
			$('#right-side').html(result);
			$("#loading").css("display","none");
			$("#mainDiv").removeClass('disabled');
		},
		error : function(){
			alert("Something went wrong");
			$("#loading").css("display","none");
			$("#mainDiv").removeClass('disabled');
		}
	 });
}


/*function searchInvoiceShipmentRefs(name, searchCategory){
	 var contextPath = $("#contextPath").val(); 
	 var storeLocation = $("#fromLocation  option:selected").text();
	 URL = contextPath + "/procurement/searchGRNRefs.do";
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
     		appendGRNRefs(result, searchCategory);
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
function appendGRNRefs(grnRefsList, searchCategory){
	 $("."+searchCategory).html('');
	 var op = '';
	 for(var i=0;i<grnRefsList.length;i++){
			 if (i == 0) {
				 op += '<li id="'+grnRefsList[i]+'"  class="selected" onclick=getIdsBasedonGRN(this,"'+searchCategory+'"); ><a>'+grnRefsList[i]+'</a></li>';
			}else
			     op += '<li id="'+grnRefsList[i]+'" onclick=getIds(this,"'+searchCategory+'"); ><a>'+grnRefsList[i]+'</a></li>';
	 }
	 $("."+searchCategory).html(op);
	 $("."+searchCategory).show();
	 
}*/

function searchGRNRefs(name, searchCategory){
	debugger;
	 var contextPath = $("#contextPath").val(); 
	 var storeLocation = $("#fromLocation  option:selected").text();
	 URL = contextPath + "/whInvoice/searchGRNRefs.do";
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
				console.log("grns" +result)
				appendGRNRefs(result, searchCategory);
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

function appendGRNRefs(grnRefsList, searchCategory){
	 $("."+searchCategory).html('');
	 var op = '';
	 for(var i=0;i<grnRefsList.length;i++){
			 if (i == 0) {
				 op += '<li id="'+grnRefsList[i]+'"  class="selected" onclick=getIds(this,"'+searchCategory+'"); ><a>'+grnRefsList[i]+'</a></li>';
			}else
			     op += '<li id="'+grnRefsList[i]+'" onclick=getIds(this,"'+searchCategory+'"); ><a>'+grnRefsList[i]+'</a></li>';
	 }
	 $("."+searchCategory).html(op);
	 $("."+searchCategory).show();
	 
}




function getIdsBasedonGRN(element,type){
	debugger;
	var id= $(element).attr("id");
	var description = null;
	description =  $("#"+id).children("a").text();
	description = description.split(' ( ');
	description = description[0];
	
	if(type == "invoicesWarehouseShipmentDetails")
		getInvoicedetails(id,type);
	
	else if(type == "invoiceShipmentRef"){
		$("#shipment_reference").val(id);
		$("#selected_shipment_ref").val(id);
		getGrnItems(id);
	}
	
		 $(".services").hide();
		 $("."+type).html("");
}

function getGrnItems(grnRefId){
	debugger
	 var contextPath = $("#contextPath").val();
	 var storeLocation = $("#fromLocation  option:selected").text();
	 URL = contextPath + "/whInvoice/getGrnItems.do";
	//var URL = contextPath + "/procurement/getGrnItems.do";
	
	 $.ajax({
			type: "GET",
			url : URL,
			data : {
				grnRefId : grnRefId,
				storeLocation : storeLocation
			},
 			beforeSend: function(xhr){                    
  	   			$("#loading").css("display","block");
  	   			$("#mainDiv").addClass("disabled");
  	   		  },
 			success : function(result) {
 				//alert(result)
 				appendingInvoiceGRNdetails(result);
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


	function appendingInvoiceGRNdetails(poItemsList)
	{
	debugger
	var itemslist = poItemsList.itemDetails;
	var invoice = poItemsList.invoiceNo;
	var supplierName = poItemsList.supplierName;
	var supplierId = poItemsList.supplierId;
	var supplierState = poItemsList.supplier_state;
	
	if(supplierName!=null)
	$("#searchSupplier").val(supplierName);
	if(supplierId!=null)
	$("#supplier_Id").val(supplierId);
	if(supplierState!=null)
	$("#supplier_state").val(supplierState);
	
	for(var j = 0; j < itemslist.length ; j++){
		var sku = itemslist[j];
		var contextPath = $("#contextPath").val();
		/* if(itemslist.length > 0 && itemslist[0].location != undefined && itemslist[0].location != null && itemslist[0].location != ""){
			 $("#warehouse_location  option:selected").text(itemslist[0].location);
			}
			if(itemslist.length > 0 && itemslist[0].supplierId != undefined && itemslist[0].supplierId != null && itemslist[0].supplierId != ""){
				$("#supplier_Id").val(itemslist[0].supplierId);
			}
			if(itemslist.length > 0 && itemslist[0].supplierName != undefined && itemslist[0].supplierName != null && itemslist[0].supplierName != ""){
				$("#supplierRef").val(itemslist[0].supplierName);
				}
		*/


		 var len = parseInt($("#invoiceproductsList tr").length)-2;
			if (len < 1)
				len = parseInt($("#invoiceproductsList tr:last").attr("id").replace('dynamicdiv', '')) + 1;
		
			
			
			var description = null;
			if (sku.itemDesc != "" && sku.itemDesc != null)
				description = sku.itemDesc;
			else
				description = $("#desc").val();
		
			var pluCode = null;
			if (sku.pluCode != "" && sku.pluCode != null)
				pluCode = sku.pluCode;
			else
				pluCode = sku.skuId;
			var brandCode = sku.brand;
			if(brandCode == null)
				sku.brandCode = "";
			var category = sku.category;
			if(category == null)
				sku.category = "";
			
			var measureRange = sku.measurementRange;
			if(measureRange == null)
				sku.measureRange = "";
			var utility = sku.utility;
			if(utility == null)
				sku.utility = "";

			var color = sku.color;
			if(color == null || color == "_")
				sku.color = "";
			var ean = sku.ean;
			if(ean == null)
				sku.ean = "";
			var size = sku.size;
			if(size == null || size == "_")
				sku.size = "";
			
			var hsnCode = sku.hsnCode;
			if(hsnCode == null)
				sku.hsnCode = "";
				
				var bactchNum = sku.bactchNum;
			if(bactchNum == null)
				sku.bactchNum = "";
				
				var expiryDateStr = sku.expiryDateStr;
			if(expiryDateStr == null)
				sku.expiryDateStr = "";
				
				var quantity = sku.quantity;
			if(quantity == null || quantity == "0.0")
				sku.quantity = "1";
			
			
				 var tax = sku.tax;
			 
			
			var cost=sku.itemPrice;
			sku.costPrice = cost;
			var quantity=sku.quantity;
			
			
			var taxRate=0.0;
			if(tax!=null)
				if(tax.length>0){
					for(var i=0;i<tax.length;i++)
	    			{
	    			if(tax[i].taxCode == "CGST")
	    				if(tax[i].saleRangesList.length != null  && tax[i].saleRangesList.length > 0){
							
							for(var t=0;t<tax[i].saleRangesList.length;t++)
							{
							if(parseFloat(tax[i].saleRangesList[t].saleValueTo) >= sku.costPrice && parseFloat(tax[i].saleRangesList[t].saleValueFrom) <= sku.costPrice ){
								taxRate = tax[i].saleRangesList[t].taxRate;
							break;
							}
							}
							}else{
								taxRate = tax[i].taxRate;
							}
	    			}
					
				}
			
			var sgstTaxRate=0.0;
			var cgstTaxRate=0.0;  
			if(tax!=null)
				if(tax.length>0){
			for(var i=0;i<tax.length;i++)
			{
			if(tax[i].taxCode == "CGST")
				if(tax[i].saleRangesList.length != null && tax[i].saleRangesList.length > 0){
					
					for(var u=0;u<tax[i].saleRangesList.length;u++)
					{
						if(parseFloat(tax[i].saleRangesList[u].saleValueTo) >= sku.costPrice && parseFloat(tax[i].saleRangesList[u].saleValueFrom) <= sku.costPrice ){
							cgstTaxRate = tax[i].saleRangesList[u].taxRate;
						break;
						}
					
					}
					}else{
						cgstTaxRate = tax[i].taxRate;
					}
			}
			}
			
			
			var sgstTaxRate=0.0;
			if(tax!=null)
				if(tax.length>0){
			for(var i=0;i<tax.length;i++)
			{
			if(tax[i].taxCode == "SGST")
                     if(tax[i].saleRangesList.length != null  && tax[i].saleRangesList.length > 0){
					
					for(var v=0;v<tax[i].saleRangesList.length;v++)
					{
						if(parseFloat(tax[i].saleRangesList[v].saleValueTo) >= sku.costPrice && parseFloat(tax[i].saleRangesList[v].saleValueFrom) <= sku.costPrice ){
							sgstTaxRate = tax[i].saleRangesList[v].taxRate;
						break;
						}
					
					
					}
					}else{
						sgstTaxRate = tax[i].taxRate;
					}
			}
			}
			
			var cessRate=0.0;
			if(tax!=null)
				if(tax.length>0){
			for(var i=0;i<tax.length;i++)
			{
			if(tax[i].taxCode == "CESS")
				
                   if(tax[i].saleRangesList.length != null  && tax[i].saleRangesList.length > 0){
					
					for(var w=0;w<tax[i].saleRangesList.length;w++)
					{
						if(parseFloat(tax[i].saleRangesList[w].saleValueTo) >= sku.costPrice && parseFloat(tax[i].saleRangesList[w].saleValueFrom) <= sku.costPrice ){
							cessRate = tax[i].saleRangesList[w].taxRate;
						break;
						}
					
					
					}
					}else{
						cessRate = tax[i].taxRate;
					}
			}
			}	
			
			var igstRate=0.0;
			if(tax!=null)
				if(tax.length>0){
			for(var i=0;i<tax.length;i++)
			{
			if(tax[i].taxCode == "IGST")
				
				 if(tax[i].saleRangesList.length != null  && tax[i].saleRangesList.length > 0){
						
						for(var x=0;x<tax[i].saleRangesList.length;x++)
						{
							
							if(parseFloat(tax[i].saleRangesList[x].saleValueTo) >= sku.costPrice && parseFloat(tax[i].saleRangesList[x].saleValueFrom) <= sku.costPrice ){
								igstRate = tax[i].saleRangesList[x].taxRate;
						break;
						}
						
						}
						}else{
							igstRate = tax[i].taxRate;
						}
			}
			}	
			
			
			var locationstate = $("#stateName").val();
			var suppierstate = $("#supplier_state").val();
			
			 if(locationstate.toUpperCase() !=  suppierstate.toUpperCase()){
				sgstTaxRate= 0.0;
 				cgstTaxRate= 0.0;
 				taxRate= 0.0;
			 }else{
				 igstRate = 0.0;
			 }
			
				var taxvalueofCgst=0.0;
				if(tax!=null)
				if(tax.length>0){
				taxvalueofCgst =  (cgstTaxRate*cost*quantity)/100;
				}
				
				var taxvalueofsgst=0.0;
				if(tax!=null)
				if(tax.length>0){
				taxvalueofsgst =  (sgstTaxRate*cost*quantity)/100;
				}
				
				var taxvalueofCess=0.0;
				if(tax!=null)
				if(tax.length>0){
				taxvalueofCess =  (cessRate*cost*quantity)/100;
				}
				
				var taxvalueofIgst=0.0;
				if(tax!=null)
					if(tax.length>0){
						taxvalueofIgst =  (igstRate*cost*quantity)/100;
					}
				
				if(tax<=0)
					{
					taxvalueofsgst = 0.0;
					taxvalueofCgst = 0.0;
					taxvalueofIgst = 0.0;
					taxvalueofCess = 0.0;
					}
				
			 var  taxamount=0.0;
			if(tax!=null)
				if(tax.length>0){
						taxamount = parseFloat(((sku.costPrice)*taxRate)/100).toFixed(2);
				}
			
			
			
			
			
			
			
			
			
			
			
			
		/*	
			var tax=sku.tax;
			
			var	 taxRate;
			//var cgstTaxRate=0.0
			if(tax!=null)
			 taxRate=sku.tax;
			 else
			 taxRate=0.0;
			
			if(taxRate > 0)
				{
				var cgstRate = taxRate/2;
				var sgstRate = taxRate/2;
				
				}
			else
				{
				var cgstRate = 0.0;
				var sgstRate = 0.0;
				
				}
			
		var quantity = 1;
		var cost = sku.itemPrice;
		var rate = sku.tax/2;
		
			var taxamount = 0.0;
			var taxvalueofCgst=0.0;
			if(tax!=null)
			if(tax>0){
			taxvalueofCgst =   parseFloat((rate*cost*quantity)/100).toFixed(2);
			}
			
			
			var taxvalueofSgst=0.0;
			
			if(tax!=null)
			if(tax>0){
			taxvalueofSgst =  parseFloat((rate*cost*quantity)/100).toFixed(2);
			if(tax<=0)
				{
				taxvalueofSgst=0.0;
				taxvalueofCgst = 0.0;
				}
			}
			
		*/
			
		
			var slNo = 1; 
				 $('.slno').each(function(){
					$(this).text(slNo);
					slNo = parseInt(slNo) + 1;
				});
				 
				
					var row = "<tr id='dynamicdiv"+len+"' style='margin-top:5px;'><td class='slno' id='itemno"+len+"'>"+slNo+"</td><td id='itemCode"+len+"'>"+sku.skuId+"</td>" +
				"<td id='itemDesc"+len+"'>"+description+"</td>"+
				"<input type='hidden' id='taxvalue"+len+"' value='"+parseFloat(taxvalueofsgst+taxvalueofCgst+taxvalueofIgst).toFixed(2)+"' />" +
				"<input type='hidden' id='color"+len+"' value='"+sku.color+"' />" +
				"<input type='hidden' id='size"+len+"' value='"+sku.size+"' />" +
				"<input type='hidden' id='uom"+len+"' value='"+sku.uom+"' />" +
				"<input type='hidden' id='pluCode"+len+"' value='' />" +
				"<input type='hidden' id='model"+len+"' value='' />" +
				"<input type='hidden' id='category"+len+"' value='"+sku.category+"' />" +
				"<input type='hidden' id='subCategory"+len+"' value='' />" +
				"<input type='hidden' id='section"+len+"' value='' />" +
		      	"<input type='hidden' id='taxationlist"+len+"' value='"+sku.taxdetailsStr+"'/>" +
                 "<input type='hidden' id='pricereal"+len+"' value='"+sku.itemPrice+"'/>" +
                 "<input type='hidden' id='pricerealedit"+len+"' value=''/>" +
       			 "<td id='ean"+len+"'>"+sku.ean+"</td>" +
				"<td id='HSN"+len+"'>"+sku.hsnCode+"</td>" +
				
				
			"<td><textarea id='batchNum"+len+"' rows=1 style='resize:none;width: 87px;'>"+sku.bactchNum+"</textarea></td>"+
			"<td><input class='form-control calendar_icon endDate' readonly='readonly' style='width:100px;background-color: white;' id='expiryDate"+len+"' type='text' onfocus=callCalender('expiryDate"+len+"') onclick=callCalender('expiryDate"+len+"') placeholder='DD/MM/YYYY' value='"+sku.expiryDateStr+"' /></td>" +
			"<td id='qty"+len+"'><input style='text-align: center;width:75px;' type='number' id='Received"+len+"' class='Received'  name='Received' value='"+sku.quantity+"'  onBlur='changePack(this);'/></td>" +
			"<td id='taxRate"+len+"'><input style='text-align: center;width:75px;' type='number' id='rate"+len+"' readonly='readonly'  name='rate' value='"+sku.tax+"'  onBlur='changePackRate(this);'/></td>" +

			"<td class='cgstrate' id='cgstrate"+len+"' >"+parseFloat(cgstTaxRate).toFixed(2)+"</td>" +
			"<td class='cgst' id='cgst"+len+"'>"+parseFloat(taxvalueofCgst).toFixed(2)+"</td>" +
			"<td class='sgstrate' id='sgstrate"+len+"'>"+parseFloat(sgstTaxRate).toFixed(2)+"</td>" +
			"<td class='sgst'  id='sgst"+len+"'>"+parseFloat(taxvalueofsgst).toFixed(2)+"</td>" +
			"<td class='igstrate' id='igstrate"+len+"'>"+parseFloat(igstRate).toFixed(2)+"</td>" +
			"<td class='igst'  id='igst"+len+"'>"+parseFloat(taxvalueofIgst).toFixed(2)+"</td>" +
			"<td class='cessrate'  id='cessrate"+len+"'>"+parseFloat(cessRate).toFixed(2)+"</td>" +
			"<td class='cess'  id='cess"+len+"'>"+parseFloat(taxvalueofCess).toFixed(2)+"</td>" +
			"<td><input id='freeqty"+len+"'  class='freeqty' onBlur='changeTotalSubQuantities();changeTotalCost()' onkeypress='PreventEnter(this);' type='number' style='width:70px;text-align:center' value='"+sku.freeQty+"' min='0' oninput='this.value = Math.abs(this.value)'></td>"+
			"<td><input id='discountpercentage"+len+"'   class='discountpercentage' onBlur='changePack(this);changeDiscPerc(this);changeTotalCost();' onkeypress='PreventEnter(this);'  min='0' type='number' style='width:70px;text-align:center' value='"+sku.discountPercentage+"' oninput='this.value = Math.abs(this.value)'></td>"+
			"<td><input id='discountAmt"+len+"'  class='discountAmt' onBlur='changePack(this);changeDiscAmt(this);changeTotalCost();' onkeypress='PreventEnter(this);' type='number'  min='0' style='width:70px;text-align:center' value='"+sku.discountAmt+"' oninput='this.value = Math.abs(this.value)'></td>"+
			"<td class='price'  id='costPrice"+len+"'  onBlur='changeSupplyPrice(this);' contenteditable='true'>"+sku.itemPrice+"</td>" +
			"<td class='amount' id='amount"+len+"' >"+sku.itemPrice+"</td>"+
				
			
				"<td id='Del"+len+"'>" +
				"<img id='Img"+len+"' src='"+contextPath+"/images/itemdelete.png' style='width:40%;cursor:pointer;' onclick='deleteItem(this);' title='Delete "+sku.skuId+"'/></td></tr>";

					$("#invoiceproductsList tbody").find('tr:last').prev().after(row);

				$("#invoiceNumber").val(invoice);
				var cost=0;
				var quantity = $("#qty"+len).val();
				
				
				
			/*	if(tax!=null)
					 taxRate=sku.cgstRate;
					 else
					 taxRate=0.0;
				
				//var taxRate=$("#cgstrate"+len).val();
				
				var taxvalueofCgst =  (taxRate*cost*quantity)/100;*/
				
				changeTotalCost();
				changeTotalSubQuantities();
				changeInvoiceTotal();
	}
	}


function changeSupplyPrice(element){
	debugger;
	var id = $(element).attr("id");
	var rowNo = id.replace('costPrice','');
	
	//modifed by manasa
	var packVal = parseFloat($('#Received'+rowNo).val());
	if (isNaN(packVal) ){
		packVal =0;
		$('#Received'+rowNo).html("0");
	}
	
	if(packVal<=0){
		$('#Error').html("Pack should not be empty");
		
	}else{
		var priceVal = parseFloat($('#costPrice'+rowNo).html());
		if (isNaN(priceVal) || priceVal == 0){
		    priceVal =1;
			$('#Price'+rowNo).html("1");
	}
		$('#Price'+rowNo).html(parseFloat(priceVal).toFixed(2))
		
		
	}
	
		$('#pricerealedit'+rowNo).val("true");
	
	changeTotalCost();
	
}
