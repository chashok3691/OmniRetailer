/*******************************************************************************
 * Copyright  2015 Omni Retailer Customer Console, All rights reserved.
 * Author : Sahitya P
 * Created On : 1-4-2015
 * 
 * Licensed under the Technolabs Software License, Version 1.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 * 
 *   http://www.technolabssoftware.com/pages/privacy-policy/
 * 
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 ******************************************************************************/

$(document).ready(function(){

     $('#fromlocation').on('change', function() {
   	   $("#Error").html("");
     });
     $('#tolocation').on('change', function() {
   	   $("#Error").html("");
     });

    
    $("#delivered").keydown(function(){
		   $("#deliveredByError").html("");
		   $("#Error").html("");
	 });
    
    $("#inspected").keydown(function(){
		   $("#inspectedByError").html("");
		   $("#Error").html("");
	 });
 
    $("#received").keydown(function(){
		   $("#receivedByError").html("");
		   $("#Error").html("");
	 });
    
    
   /* $('#stockRequestRef').keypress(function(e){
    	if($("#stockRequestRef").val() == "")
        if(e.which == 13){//Enter key pressed
        	$("#tableId > tbody").html("");
        	// $('#mySearch').click();//Trigger search button click event
        }
    });*/
    
    
   
});

function PreventEnter(element){
	 debugger;
	 var id = $(element).attr("id");
	 
	if (event.keyCode === 13) {
		event.preventDefault();
		$("#"+id).blur(); 
		$("#searchItems").focus(); 
		
  }
}

var skuList = null;
var warehouseskumaster = null;
/**
 * @author Sahitya 
 * Prepare table rows dynamically with the provided details, then append to table
 * @param List of Raw Material Details
 */
function appendSkuDetails(list,flowUnder,storeLocation) {
	debugger;
	if(list==""){
		$("#loading").css("display","none");
		$("#mainDiv").removeClass("disabled");
	 }
	 //purpose:for checking internet conection
	var online = window.navigator.onLine;
  	if(!online){
  	alert("check your internet connection,please try agian after some time");
  	return;
  	}
	//var contextPath = $("#contextPath").val();
	var parsedJson = jQuery.parseJSON(list);
	$("#searchItems").val("");
	skuList = parsedJson.skuLists;
	
	
	if(flowUnder == "warehouse"){
	
		if(parsedJson.warehouseskumaster.hsnCode!=null && parsedJson.warehouseskumaster.hsnCode!=undefined && parsedJson.warehouseskumaster.hsnCode!="")
			{
			if(parsedJson.warehouseskumaster.hsnCode != "" && parsedJson.warehouseskumaster.hsnCode != null && parsedJson.warehouseskumaster.hsnCode!=undefined){
				skuList[0].hsnCode=parsedJson.warehouseskumaster.hsnCode;
			
			}
			
			}
		
		var manufacturedItem = parsedJson.warehouseskumaster.manufacturedItem;
		skuList[0].manufacturedItem = manufacturedItem;
		
	if(parsedJson.warehouseskumaster.warehouseSkuPriceLists[0].blockedQuantity == "" || parsedJson.warehouseskumaster.warehouseSkuPriceLists[0].blockedQuantity == null || parsedJson.warehouseskumaster.warehouseSkuPriceLists[0].blockedQuantity == undefined){
		parsedJson.warehouseskumaster.warehouseSkuPriceLists[0].blockedQuantity = 0;
	}
	
	}
	
	
	if(flowUnder == "outlet"){
		
		if(skuList[0].blockedQuantity == null || skuList[0].blockedQuantity == "" || skuList[0].blockedQuantity == undefined){
			skuList[0].blockedQuantity= 0;
		}
		
		if(skuList[0].quantity-skuList[0].blockedQuantity <=0){
			$(".Error").html("Item is out of Stock in    "+storeLocation);
			return;
		}
		
		
		
	}
	
	
	
	
	
	//written by manasa
	//purpose:to get track item when we call warehouse location
	//if(warehouseskumaster.trackingRequired!=null)
	
	// commented on 05-10-2019
	/*if($("#flowUnder").val() == "warehouse"){
	warehouseskumaster=parsedJson.warehouseskumaster;
	
	var itemTrack = warehouseskumaster.trackingRequired;
	var uom = warehouseskumaster.uom;
	var hsnCode = warehouseskumaster.hsnCode;
	
	skuList[0].trackingRequired = itemTrack;
	skuList[0].uom = uom;
	skuList[0].hsnCode = hsnCode;
	
	}*/

	
	
	
	if(skuList.length >1){
		var priceLength = skuList.length;
		var priceArray = [];
		$("#itemsList tbody").html("");
		for(var i=0; i<priceLength; i++){
			var price = skuList[i].costPrice;
			
			
			 if($("#flowUnder").val() == "warehouse"){
				var itemTrack = parsedJson.warehouseskumaster.trackingRequired;
				skuList[i].trackingRequired = itemTrack;
				
				var manufacturedItem = parsedJson.warehouseskumaster.manufacturedItem;
				skuList[i].manufacturedItem = manufacturedItem;
				
				
			 }
			//skuList[i].costPrice = 
			
			if (! $.inArray(price, priceArray) > -1)
			{
				priceArray.push(price);
				
				if(skuList[i].productBatchNo ==  null){
						skuList[i].productBatchNo = "";
					}
					if(skuList[i].expiry_date ==  null){
						skuList[i].expiry_date = "";
					}
				
				var row = '<tr id=price'+i+' style="margin-top:5px;cursor:pointer" onclick=getPrice(this) ><td style="    white-space: nowrap;">'+skuList[i].description+'</td><td>'+skuList[i].productBatchNo+'</td><td>'+skuList[i].expiry_date+'</td><td>'+skuList[i].quantity+'</td><td>'+price+'</td><td>'+skuList[i].mrp+'</td><td>'+skuList[i].color+'</td><td>'+skuList[i].size+'</td></tr>';
				//'<li id="'+productsList[i].skuID+'"  class="selected" onclick=getId(this,"'+searchCategory+'"); ><a>'+productsList[i].description+'   -   '+productsList[i].skuID+'</a></li>';
				$("#itemsList tbody").append(row);
			}
		}
		var  op = '<a id="selectPrice"  data-toggle="modal" data-target="#items-modal"></a>';
		 $("#triggerEvent").append(op);
		 $("#selectPrice" ).trigger( "click" );
		 $("#triggerEvent").html("");
		 $('#items-modal').modal('show');
	}
	else{
		addItem(skuList[0]);
	}
	
	
	/* var len = parseInt($("#productsList tr").length);
		if (len != 1)
			len = parseInt($("#productsList tr:last").attr("id").replace('dynamicdiv', '')) + 1;
		
		for (var i = 1; i <= len; i++) {
			if ($("#skuId" + i).val() == parsedJson.skuId) {
			//if ($("#Name" + i).text() == parsedJson.productName) {
				var pack =  parseInt($("#Pack"+i).text())+1;
    			 $("#Pack"+i).text(pack);
    			 $("#Supplied"+i).text(pack);
    			 $("#Received"+i).text(pack);
    			 $("#Rejected"+i).text(0);
    			 var cost =  parseInt($("#Price"+i).text());
    			 $("#Cost"+i).text(pack*cost);
    			 changeTotalCost();
        		 changeTotalQuantity();
        		 return;
			}
		}
		var row = "<tr id='dynamicdiv"+len+"' style='margin-top:5px;'><td id='Name"+len+"'>"+parsedJson.productName+"" +
		"<input type='hidden' id='skuId"+len+"' value='"+parsedJson.skuId+"'/></td>" +
		"<td id='Desc"+len+"'>"+parsedJson.description+"</td><td id='UOM"+len+"'>"+ parsedJson.sell_UOM + "</td>" +
		"<td class='Price' id='Price"+len+"'>"+parsedJson.price+"</td>" +
		"<td id='Pack"+len+"' class='Pack' onBlur='changePack(this);' contenteditable='true'>1</td>" +
		"<td id='Cost"+len+"'>"+parsedJson.price+"</td>" +
		"<td id='Supplied"+len+"'>1</td><td class='Received' id='Received"+len+"'>1</td>" +
		"<td id='Rejected"+len+"' onBlur='changeRejected(this);' contenteditable='true'>0</td><td id='Del"+len+"'>" +
		"<img id='Img"+len+"' src='"+contextPath+"/images/itemdelete.png' style='width:15%;cursor:pointer;' onclick='deleteItem(this);' title='Delete "+parsedJson.productName+"'/></td></tr>";
		$("#productsList tbody").append(row);
		changeTotalCost();
		changeTotalQuantity();*/
	
}

/*function addItem(sku){
	 var contextPath = $("#contextPath").val();
	 var len = parseInt($("#productsList tr").length);
		if (len != 1)
			len = parseInt($("#productsList tr:last").attr("id").replace('dynamicdiv', '')) + 1;
		for (var i = 1; i <= len; i++) {
			if ($("#skuId" + i).val() == sku.skuId && $("#Price"+i).text() == sku.costPrice) {
				var pack =  parseInt($("#Pack"+i).text())+1;
  			 $("#Pack"+i).text(pack);
  			 $("#Supplied"+i).text(pack);
			 $("#Received"+i).text(pack);
			 $("#Rejected"+i).text(0);
  			 var cost =  parseFloat($("#Price"+i).text());
  			 $("#Cost"+i).text(pack*cost);
  			 changeTotalCost();
  			 changeTotalQuantity();
      		 return;
			}
		}
		var availableQty = sku.availableQty;
		if(availableQty == null)
			availableQty = "0";
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
		var color = sku.color;
		if(color == null)
			sku.color = "";
		var size = sku.size;
		if(size == null)
			sku.size = "";
		
		var description = null;
		if (sku.description != "" && sku.description != null)
			description = sku.description;
		else
			description = $("#desc").val();
		var sell_UOM = sku.uom;
		if(sell_UOM == "" || sell_UOM == null)                      
			sell_UOM = "_";
		var slNo = 1; 
		 $('.slno').each(function(){
			$(this).text(slNo);
			slNo = parseInt(slNo) + 1;
		});
			if($("#flowUnder").val()=="warehouse"){
				if($("#type").val()=="receipt"){
					var row = "<tr id='dynamicdiv"+len+"' style='margin-top:5px;'><td class='slno'>"+slNo+"</td>" +"<td id='Name"+len+"'>"+sku.skuId+"</td>" +
	   				"<input type='hidden' id='skuId"+len+"' value='"+sku.skuId+"'/>" +
	   				"<input type='hidden' id='pluCode"+len+"' value='"+sku.pluCode+"'/>" +
	   				"<input type='hidden' id='category"+len+"' value='"+sku.category+"'/>" +
	    			"<input type='hidden' id='brandCode"+len+"' value='"+sku.brandCode+"'/>" +
	    			"<input type='hidden' id='productRange"+len+"' value='"+sku.productRange+"'/>" +
	    			"<input type='hidden' id='measureRange"+len+"' value='"+sku.measureRange+"'/>" +
	    			"<input type='hidden' id='color"+len+"' value='"+sku.color+"'/>" +
	    			"<input type='hidden' id='size"+len+"' value='"+sku.size+"'/>" +
	   				"<td id='Desc"+len+"'>"+description+"</td><td id='UOM"+len+"'>"+ sell_UOM + "</td>" +
	   				"<td class='Price' id='Price"+len+"'>"+sku.costPrice+"</td>" +
	   				"<td id='Pack"+len+"' class='Pack' onBlur='changePack(this);' onkeypress='PreventEnter(this);' contenteditable='true'>1</td>" +
	   				"<td id='Cost"+len+"'>"+sku.costPrice+"</td>" +
	   				"<td id='Supplied"+len+"' contenteditable='true'>1</td><td class='Received' id='Received"+len+"' contenteditable='true'>1</td>" +
	   				"<td id='Rejected"+len+"' onBlur='changeRejected(this);' onkeypress='PreventEnter(this);' contenteditable='true'>0</td><td id='Del"+len+"'>" +
	   				"<img id='Img"+len+"' src='"+contextPath+"/images/itemdelete.png' style='width:12%;cursor:pointer;' onclick='deleteItem(this);' title='Delete "+sku.skuId+"'/></td></tr>";
	   				$("#productsList tbody").append(row);
				}
				else{
					var row = "<tr id='dynamicdiv"+len+"' style='margin-top:5px;'><td class='slno'>"+slNo+"</td>" +"<td id='Name"+len+"'>"+sku.skuId+"</td>" +
					"<input type='hidden' id='skuId"+len+"' value='"+sku.skuId+"'/>" +
					"<input type='hidden' id='pluCode"+len+"' value='"+sku.pluCode+"'/>" +
					"<input type='hidden' id='category"+len+"' value='"+sku.category+"'/>" +
	    			"<input type='hidden' id='brandCode"+len+"' value='"+sku.brandCode+"'/>" +
	    			"<input type='hidden' id='productRange"+len+"' value='"+sku.productRange+"'/>" +
	    			"<input type='hidden' id='measureRange"+len+"' value='"+sku.measureRange+"'/>" +
	    			"<input type='hidden' id='color"+len+"' value='"+sku.color+"'/>" +
	    			"<input type='hidden' id='size"+len+"' value='"+sku.size+"'/>" +
					"<td id='Desc"+len+"'>"+description+"</td><td id='UOM"+len+"'>"+ sell_UOM + "</td>" +
					"<td class='Price' id='Price"+len+"'>"+sku.costPrice+"</td>" +
					"<td id='Pack"+len+"' class='Pack' >1</td>" +
					"<td id='Supplied"+len+"' onBlur='changeIssued(this);' onkeypress='PreventEnter(this);' contenteditable='true'>1</td><td class='Received' id='Received"+len+"' onBlur='changeReceived(this);' onkeypress='PreventEnter(this);' contenteditable='true'>1</td>" +
					"<td  id='availableQty"+len+"' >"+availableQty+"</td>" +
					"<td id='Cost"+len+"'>"+sku.costPrice+"</td>" +
					"<td id='Del"+len+"'><img id='Img"+len+"' src='"+contextPath+"/images/itemdelete.png' style='width:15%;cursor:pointer;' onclick='deleteItem(this);' title='Delete "+sku.skuId+"'/></td></tr>";
					$("#productsList tbody").append(row);
				}
				
   			}
			else{
				var zeroStockValue = $("#zeroStock").val();
				if($("#flowType").val()=="issue"){
					var row = "<tr id='dynamicdiv"+len+"' style='margin-top:5px;'><td class='slno'>"+slNo+"</td>" +"<td id='Name"+len+"'>"+sku.skuId+"</td>" +
	   				"<input type='hidden' id='skuId"+len+"' value='"+sku.skuId+"'/>" +
	   				"<input type='hidden' id='pluCode"+len+"' value='"+sku.pluCode+"'/>" +
	   				"<input type='hidden' id='category"+len+"' value='"+sku.category+"'/>" +
	    			"<input type='hidden' id='brandCode"+len+"' value='"+sku.brandCode+"'/>" +
	    			"<input type='hidden' id='productRange"+len+"' value='"+sku.productRange+"'/>" +
	    			"<input type='hidden' id='measureRange"+len+"' value='"+sku.measureRange+"'/>" +
	    			"<input type='hidden' id='color"+len+"' value='"+sku.color+"'/>" +
	    			"<input type='hidden' id='size"+len+"' value='"+sku.size+"'/>" +
	   				"<td id='Desc"+len+"'>"+description+"</td><td id='UOM"+len+"'>"+ sell_UOM + "</td>" +
	   				"<td class='Price' id='Price"+len+"'>"+sku.costPrice+"</td>" +
	   				"<td id='Pack"+len+"' class='Pack' onBlur='changePack(this);' onkeypress='PreventEnter(this);' contenteditable='true'>1</td>" +
	   				"<td id='Supplied"+len+"' contenteditable='true'>1</td><td class='Received' id='Received"+len+"' contenteditable='true'>1</td>" +
	   				"<td  id='availableQty"+len+"' >"+availableQty+"</td>" +
	   				"<td id='Cost"+len+"'>"+sku.costPrice+"</td>" +
	   				"<td id='Del"+len+"'>" +
	   				"<img id='Img"+len+"' src='"+contextPath+"/images/itemdelete.png' style='width:12%;cursor:pointer;' onclick='deleteItem(this);' title='Delete "+sku.skuId+"'/></td></tr>";
	   				$("#productsList tbody").append(row);
				}
				else{
					var row = "<tr id='dynamicdiv"+len+"' style='margin-top:5px;'><td class='slno'>"+slNo+"</td>" +"<td id='Name"+len+"'>"+sku.skuId+"</td>" +
	   				"<input type='hidden' id='skuId"+len+"' value='"+sku.skuId+"'/>" +
	   				"<input type='hidden' id='pluCode"+len+"' value='"+sku.pluCode+"'/>" +
	   				"<input type='hidden' id='category"+len+"' value='"+sku.category+"'/>" +
	    			"<input type='hidden' id='brandCode"+len+"' value='"+sku.brandCode+"'/>" +
	    			"<input type='hidden' id='productRange"+len+"' value='"+sku.productRange+"'/>" +
	    			"<input type='hidden' id='measureRange"+len+"' value='"+sku.measureRange+"'/>" +
	    			"<input type='hidden' id='color"+len+"' value='"+sku.color+"'/>" +
	    			"<input type='hidden' id='size"+len+"' value='"+sku.size+"'/>" +
	   				"<td id='Desc"+len+"'>"+description+"</td><td id='UOM"+len+"'>"+ sell_UOM + "</td>" +
	   				"<td class='Price' id='Price"+len+"'>"+sku.costPrice+"</td>" +
	   				"<td id='Pack"+len+"' class='Pack' onBlur='changePack(this);' onkeypress='PreventEnter(this);' contenteditable='true'>1</td>" +
	   				"<td id='Cost"+len+"'>"+sku.costPrice+"</td>" +
	   				"<td id='Supplied"+len+"' onBlur='changeSuppliedPack(this);' onkeypress='PreventEnter(this);' contenteditable='true'>1</td>" +
	   				"<td id='weighted"+len+"'  onkeypress='PreventEnter(this);' contenteditable='true'>1</td>" +
	   				"<td class='Received' onBlur='changeReceivedPack(this);' onkeypress='PreventEnter(this);' id='Received"+len+"' contenteditable='true'>1</td>" +
	   				"<td id='Rejected"+len+"' onBlur='changeRejected(this);' onkeypress='PreventEnter(this);' contenteditable='true'>0</td><td id='Del"+len+"'>" +
	   				"<img id='Img"+len+"' src='"+contextPath+"/images/itemdelete.png' style='width:12%;cursor:pointer;' onclick='deleteItem(this);' title='Delete "+sku.skuId+"'/></td></tr>";
	   				$("#productsList tbody").append(row);
				}
   			
   				
   			}
		 
		 
		 
		
     changeTotalCost();
	 changeTotalQuantity();
}

*/
function addItem(sku){
	debugger;
	 //purpose:for checking internet conection
	var online = window.navigator.onLine;
  	if(!online){
  	alert("check your internet connection,please try agian after some time");
  	return;
  	}
  	var locationWH = $("#fromLocation").val();
  	if(locationWH == undefined || locationWH == null || locationWH == ""){
  		locationWH =""
  	}
	if(sku.manufacturedItem == false){
  	if(sku.availableQty<=0){
		$(".Error").html("Item is out of Stock  in   "+locationWH);
		return;
	}
}
  	
	 var contextPath = $("#contextPath").val();
	
	 var len = parseInt($("#productsList tr").length);
		if (len != 1)
			len = parseInt($("#productsList tr:last").attr("id").replace('dynamicdiv', '')) + 1;
		
		debugger
		var trackreq=sku.trackingRequired;
		if(trackreq!=null)
			trackreq = sku.trackingRequired;
		else
			trackreq=false;
		
		
		
		if(trackreq == false){
		for (var i = 1; i <= len; i++) {
			
			var tester = $("#skuId"+i).val();
			var tester2 = $("#Cost"+i).text()
			
			if ($("#skuId"+i).val() == sku.skuId && ($("#Price"+i).text() == sku.costPrice || $("#Price"+i).text() == sku.price)) {
			var pack =  parseInt($("#Pack"+i).text())+1;
 			 $("#Pack"+i).text(pack);
 			 $("#Supplied"+i).text(pack);
			 $("#Received"+i).text(pack);
			 $("#Rejected"+i).text(0);
 			 var cost =  parseFloat($("#Price"+i).text());
 			 $("#Cost"+i).text(pack*cost);
 			 changeTotalCost();
 			 changeTotalQuantity();
 			$("#Supplied"+i).focus();
 			$("#Supplied"+i).select(); 
     		 return;
			}
		}
		 }
		if($("#flowUnder").val()=="warehouse")
			var availableQty = sku.availableQty;
			else
		var availableQty = sku.quantity;
		if(availableQty == null)
			availableQty = "0";
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
		var ean = sku.ean;
		if(ean == null)
			sku.ean = "";
		var color = sku.color;
		if(color == null)
			sku.color = "";
		var size = sku.size;
		if(size == null)
			sku.size = "";
		var zeroflag = sku.zeroStock;
		if(zeroflag == null)
			sku.zeroStock = "";
		var description = null;
		if (sku.description != "" && sku.description != null)
			description = sku.description;
		else
			description = $("#desc").val();
		var sell_UOM = sku.uom;
		if(sell_UOM == "" || sell_UOM == null)                      
			sell_UOM = "";
		var slNo = 1; 
		 $('.slno').each(function(){
			$(this).text(slNo);
			slNo = parseInt(slNo) + 1;
		});
		
		 var scanCode = sku.itemScanCode;
			if(scanCode == null)
				sku.itemScanCode = "";
		 
		if(sku.trackingRequired == "" || sku.trackingRequired == null)
			sku.trackingRequired = false;
			
			
				var batchNum = sku.productBatchNo;
    			if(batchNum == null)
    				sku.productBatchNo = "";
		 
		

		var hsnCode = sku.hsnCode;
		if(hsnCode == null)
			sku.hsnCode = "";
		
		var tax = sku.tax;
		var taxRate=0.0;
		if(tax!=null)
			if(tax.length>0){
			 taxRate=tax[0].taxRate;
			}
		
		
		var igstRate=0.0;
		var igstvalue=0.0;
		if(tax!=null)
			if(tax.length>0){
		for(var i=0;i<tax.length;i++)
		{
		if(tax[i].taxCode == "IGST")
			
		igstRate = tax[i].taxRate;
		}
		}	
		
		if(igstRate!="0.0"){
			igstvalue = parseFloat(((sku.costPrice)*(igstRate))/100).toFixed(2);
		}
		
		var taxamount = 0.0;
		if(tax!=null)
		if(tax.length>0){
				taxamount = parseFloat(((sku.costPrice)*(tax[0].taxRate))/100).toFixed(2);
		}
		var companyType=$("#companyType").val();
		if(companyType==undefined){
			companyType="";
		}
		
		if($("#flowUnder").val()=="warehouse"){
		
		if(companyType=="franchise"){
            sku.costPrice = sku.salePrice;
	    }/*else{
	        sku.price = sku.costPrice;
	    }*/
		}
		
		 var itemZeroStock = sku.zeroStock;
		 /*if(zeroStock==true){
		 if(sku.zeroStock == false ){*/
			if($("#flowUnder").val()=="warehouse"){
				if($("#type").val()=="receipt"){
					if(trackreq == false){
					var row = "<tr id='dynamicdiv"+len+"' style='margin-top:5px;'><td class='slno'>"+slNo+"</td>" +"<td id='Name"+len+"'>"+sku.skuId+"</td>" +
	   				"<input type='hidden' id='skuId"+len+"' value='"+sku.skuId+"'/>" +
	   				"<input type='hidden' id='pluCode"+len+"' value='"+sku.pluCode+"'/>" +
	   				"<input type='hidden' id='category"+len+"' value='"+sku.category+"'/>" +
	   				"<input type='hidden' id='department"+len+"' value='"+sku.department+"'/>" +
	    			"<input type='hidden' id='brandCode"+len+"' value='"+sku.brandCode+"'/>" +
	    			"<input type='hidden' id='productRange"+len+"' value='"+sku.productRange+"'/>" +
                    "<input type='hidden' id='productBatchNo"+len+"' value='"+sku.productBatchNo+"'/>" +
	    			"<input type='hidden' id='measureRange"+len+"' value='"+sku.measureRange+"'/>" +
	    			"<input type='hidden' id='ean"+len+"' value='"+sku.ean+"'/>" +
	    			"<input type='hidden' id='utility"+len+"' value='"+sku.utility+"'/>" +
	    			"<input type='hidden' id='color"+len+"' value='"+sku.color+"'/>" +
	    			"<input type='hidden' id='size"+len+"' value='"+sku.size+"'/>" +
	    			"<input type='hidden' id='manufacturedItem"+len+"' value='"+sku.manufacturedItem+"'/>" +
                    "<input type='hidden' id='mrpPrice"+len+"' value='"+sku.mrp+"'/>" +
	    			

	    			"<input type='hidden' id='trackingRequired"+len+"' name ='trackingRequired' class='trackingRequired' value='"+sku.trackingRequired+"'/>"+
	    			"<td id='itemScanCode"+len+"' class='itemScanCode'  contenteditable='true' ></td>" +
	    			"<td id='Desc"+len+"'>"+description+"</td><td id='UOM"+len+"'>"+ sell_UOM + "</td>" +
	   				"<td class='Price' id='Price"+len+"'>"+sku.costPrice+"</td>" +
	   				"<td id='Pack"+len+"' class='Pack' onBlur='changePack(this);' onkeypress='PreventEnter(this);' contenteditable='true'>1</td>" +
	   				"<td id='Cost"+len+"'>"+parseFloat(sku.costPrice).toFixed(2)+"</td>" +
	   				"<td id='Supplied"+len+"' contenteditable='true'>1</td>+" +
	   				"<td id='weighted"+len+"'  onkeypress='PreventEnter(this);' contenteditable='true'>1</td>" +
	   				"<td class='Received' id='Received"+len+"' contenteditable='true'>1</td>" +
	   				"<td id='Rejected"+len+"' onBlur='changeRejected(this);' onkeypress='PreventEnter(this);' contenteditable='true'>0</td><td id='Del"+len+"'>" +
	   				"<img id='Img"+len+"' src='"+contextPath+"/images/itemdelete.png' style='width:12%;cursor:pointer;' onclick='deleteItem(this);' title='Delete "+sku.skuId+"'/></td></tr>";
	   				$("#productsList tbody").append(row);
					}
					else
						{
						var row = "<tr id='dynamicdiv"+len+"' style='margin-top:5px;'><td class='slno'>"+slNo+"</td>" +"<td id='Name"+len+"'>"+sku.skuId+"</td>" +
		   				"<input type='hidden' id='skuId"+len+"' value='"+sku.skuId+"'/>" +
		   				"<input type='hidden' id='pluCode"+len+"' value='"+sku.pluCode+"'/>" +
		   				"<input type='hidden' id='category"+len+"' value='"+sku.category+"'/>" +
		   				"<input type='hidden' id='department"+len+"' value='"+sku.department+"'/>" +
		    			"<input type='hidden' id='brandCode"+len+"' value='"+sku.brandCode+"'/>" +
		    			"<input type='hidden' id='productRange"+len+"' value='"+sku.productRange+"'/>" +
	                    "<input type='hidden' id='productBatchNo"+len+"' value='"+sku.productBatchNo+"'/>" +
		    			"<input type='hidden' id='measureRange"+len+"' value='"+sku.measureRange+"'/>" +
		    			"<input type='hidden' id='ean"+len+"' value='"+sku.ean+"'/>" +
		    			"<input type='hidden' id='utility"+len+"' value='"+sku.utility+"'/>" +
		    			"<input type='hidden' id='color"+len+"' value='"+sku.color+"'/>" +
		    			"<input type='hidden' id='size"+len+"' value='"+sku.size+"'/>" +
		    			"<input type='hidden' id='manufacturedItem"+len+"' value='"+sku.manufacturedItem+"'/>" +
	                    "<input type='hidden' id='mrpPrice"+len+"' value='"+sku.mrp+"'/>" +

		    			"<input type='hidden' id='trackingRequired"+len+"' name ='trackingRequired' class='trackingRequired' value='"+sku.trackingRequired+"'/>"+
		    			"<td id='itemScanCode"+len+"' class='itemScanCode'  contenteditable='true' ></td>" +
		    			"<td id='Desc"+len+"'>"+description+"</td><td id='UOM"+len+"'>"+ sell_UOM + "</td>" +
		   				"<td class='Price' id='Price"+len+"'>"+sku.costPrice+"</td>" +
		   				"<td id='Pack"+len+"' class='Pack' onBlur='changePack(this);' onkeypress='PreventEnter(this);' >1</td>" +
		   				"<td id='Cost"+len+"'>"+sku.costPrice+"</td>" +
		   				"<td id='Supplied"+len+"' contenteditable='true'>1</td><td class='Received' id='Received"+len+"' >1</td>" +
		   				"<td id='Rejected"+len+"' onBlur='changeRejected(this);' onkeypress='PreventEnter(this);' >0</td><td id='Del"+len+"'>" +
		   				"<img id='Img"+len+"' src='"+contextPath+"/images/itemdelete.png' style='width:12%;cursor:pointer;' onclick='deleteItem(this);' title='Delete "+sku.skuId+"'/></td></tr>";
		   				$("#productsList tbody").append(row);
						
						}
				}
				else{
					var packrefnum = 1;
					if($("#packReference"+(len-1)).text() != ""){
						packrefnum = $("#packReference"+(len-1)).text();
					}
					
					if($("#finalStatus").val() != undefined && $("#finalStatus").val() != null){
					 if($("#defaultstatus").val() == $("#finalStatus").val()){
						 $("#Error").html("Not Allowed To Add Items After "+$("#finalStatus").val()+" State");
						 return false;
						}
					}
					
				if(trackreq == false){
						if(companyType=="franchise"){
							var row = "<tr id='dynamicdiv"+len+"' style='margin-top:5px;'><td class='slno'>"+slNo+"</td>" +"<td id='Name"+len+"'>"+sku.skuId+"</td>" +
							"<input type='hidden' id='skuId"+len+"' value='"+sku.skuId+"'/>" +
							"<input type='hidden' id='pluCode"+len+"' value='"+sku.pluCode+"'/>" +
							"<input type='hidden' id='category"+len+"' value='"+sku.category+"'/>" +
			    			"<input type='hidden' id='brandCode"+len+"' value='"+sku.brandCode+"'/>" +
			    			"<input type='hidden' id='productRange"+len+"' value='"+sku.productRange+"'/>" +
			    			"<input type='hidden' id='measureRange"+len+"' value='"+sku.measureRange+"'/>" +
	                 	  "<input type='hidden' id='productBatchNo"+len+"' value='"+sku.productBatchNo+"'/>" +
			    			"<input type='hidden' id='ean"+len+"' value='"+sku.ean+"'/>" +
			    			"<input type='hidden' id='utility"+len+"' value='"+sku.utility+"'/>" +
			    			"<input type='hidden' id='color"+len+"' value='"+sku.color+"'/>" +
			    			"<input type='hidden' id='size"+len+"' value='"+sku.size+"'/>" +
			    			
			    			"<input type='hidden' id='hsnCode"+len+"' value='"+sku.hsnCode+"'/>" +
			    			"<input type='hidden' id='taxRate"+len+"' value='"+parseFloat(taxRate*2).toFixed(2)+"'/>" +
			    			"<input type='hidden' id='cgsgstAmt"+len+"' value='"+taxamount+"'/>" +
			    			"<input type='hidden' id='igstAmt"+len+"' value='"+igstvalue+"'/>" +
			    			"<input type='hidden' id='manufacturedItem"+len+"' value='"+sku.manufacturedItem+"'/>" +
			    			"<input type='hidden' id='availableQtydup"+len+"' value='"+availableQty+"'/>" +
		                    "<input type='hidden' id='mrpPrice"+len+"' value='"+sku.mrp+"'/>" +
			    			
			    			"<input type='hidden' id='trackingRequired"+len+"' name ='trackingRequired' class='trackingRequired' value='"+sku.trackingRequired+"'/>"+
			    			"<td id='itemScanCode"+len+"' class='itemScanCode'  contenteditable='true'></td>" +
			    			"<td id='itemHSNCode"+len+"' class='itemHSNCode'   >"+sku.hsnCode+"</td>" +
			    			"<td id='Desc"+len+"'>"+description+"</td><td id='UOM"+len+"'>"+ sell_UOM + "</td>"+
			    			"<td class='Price' id='Price"+len+"' onBlur='changeIssued(this);' onkeypress='PreventEnter(this);' contenteditable='true'>"+sku.costPrice+"</td>"+
							"<td id='Pack"+len+"' class='Pack' >1</td>" +
							"<td id='Supplied"+len+"' onBlur='changeIssued(this);' onkeypress='PreventEnter(this);' contenteditable='true' >1</td><td class='Received' id='Received"+len+"' onBlur='changeReceived(this);' onkeypress='PreventEnter(this);' contenteditable='true'>1</td>" +
							"<td class='packReference' id='packReference"+len+"' onBlur='changeReceived(this);' onkeypress='PreventEnter(this);' contenteditable='true'>"+packrefnum+"</td>" +

							"<td  id='availableQty"+len+"' onclick='popupskuQty("+sku.skuId+")' ><a style='text-decoration: underline;cursor: pointer;text-decoration-color: blue;'>"+availableQty+"</a></td>" +
							"<td id='Cost"+len+"'>"+sku.costPrice+"</td>" +
							"<td id='Del"+len+"'><img id='Img"+len+"' src='"+contextPath+"/images/itemdelete.png' style='width:35%;cursor:pointer;' onclick='deleteItem(this);' title='Delete "+sku.skuId+"'/></td></tr>";
							$("#productsList tbody").append(row);
							$("#Supplied"+len).focus();
							$("#dynamicdiv"+(len-1)).css("background","none");
							$("#dynamicdiv"+len).css("background","lightgreen");
						
							
						}else{
							var row = "<tr id='dynamicdiv"+len+"' style='margin-top:5px;'><td class='slno'>"+slNo+"</td>" +"<td id='Name"+len+"'>"+sku.skuId+"</td>" +
							"<input type='hidden' id='skuId"+len+"' value='"+sku.skuId+"'/>" +
							"<input type='hidden' id='pluCode"+len+"' value='"+sku.pluCode+"'/>" +
							"<input type='hidden' id='category"+len+"' value='"+sku.category+"'/>" +
			    			"<input type='hidden' id='brandCode"+len+"' value='"+sku.brandCode+"'/>" +
			    			"<input type='hidden' id='productRange"+len+"' value='"+sku.productRange+"'/>" +
			    			"<input type='hidden' id='measureRange"+len+"' value='"+sku.measureRange+"'/>" +
		                    "<input type='hidden' id='productBatchNo"+len+"' value='"+sku.productBatchNo+"'/>" +
			    			"<input type='hidden' id='ean"+len+"' value='"+sku.ean+"'/>" +
			    			"<input type='hidden' id='utility"+len+"' value='"+sku.utility+"'/>" +
			    			"<input type='hidden' id='color"+len+"' value='"+sku.color+"'/>" +
			    			"<input type='hidden' id='size"+len+"' value='"+sku.size+"'/>" +
			    			"<input type='hidden' id='manufacturedItem"+len+"' value='"+sku.manufacturedItem+"'/>" +
			    			"<input type='hidden' id='availableQtydup"+len+"' value='"+availableQty+"'/>" +
		                    "<input type='hidden' id='mrpPrice"+len+"' value='"+sku.mrp+"'/>" + 

			    			"<input type='hidden' id='hsnCode"+len+"' value='"+sku.hsnCode+"'/>" +
			    			"<input type='hidden' id='taxRate"+len+"' value='"+parseFloat(taxRate*2).toFixed(2)+"'/>" +
			    			"<input type='hidden' id='cgsgstAmt"+len+"' value='"+taxamount+"'/>" +
			    			"<input type='hidden' id='igstAmt"+len+"' value='"+igstvalue+"'/>" +
			    			
			    			"<input type='hidden' id='trackingRequired"+len+"' name ='trackingRequired' class='trackingRequired' value='"+sku.trackingRequired+"'/>"+
			    			"<td id='itemScanCode"+len+"' class='itemScanCode'  onkeypress='PreventEnter(this);' contenteditable='true'></td>" +
			    			"<td id='itemHSNCode"+len+"' class='itemHSNCode'   >"+sku.hsnCode+"</td>" +
			    			"<td id='Desc"+len+"'><div id='overflowtext'><a href='#' data-toggle='tooltip'  title='"+description+"'>"+description+"</a></div></td>"+

/*			    			"<td id='Desc"+len+"'>"+description+"</td>" +
*/			    			"<td id='UOM"+len+"'>"+ sell_UOM + "</td>"+
			    			"<td class='Price' id='Price"+len+"'>"+sku.costPrice+"</td>"+
							"<td id='Pack"+len+"' class='Pack' >1</td>" +
							"<td id='Supplied"+len+"' onBlur='changeIssued(this);' onchange='return (this.innerText.length < 10)' onkeypress='PreventEnter(this);' contenteditable='true'>1</td><td class='Received' id='Received"+len+"' onBlur='changeReceived(this);' onchange='return (this.innerText.length < 10)' onkeypress='PreventEnter(this);' contenteditable='true'>1</td>" +
							"<td class='packReference' id='packReference"+len+"' onBlur='changeReceived(this);' onkeypress='PreventEnter(this);' contenteditable='true'>"+packrefnum+"</td>" +
							"<td  id='availableQty"+len+"' onclick='popupskuQty("+sku.skuId+")' ><a style='text-decoration: underline;cursor: pointer;text-decoration-color: blue;'>"+availableQty.toFixed(2)+"</a></td>" +
							"<td id='Cost"+len+"'>"+sku.costPrice.toFixed(2)+"</td>" +
							"<td id='Del"+len+"'><img id='Img"+len+"' src='"+contextPath+"/images/itemdelete.png' style='width:35%;cursor:pointer;' onclick='deleteItem(this);' title='Delete "+sku.skuId+"'/></td></tr>";
							$("#productsList tbody").append(row);
							$("#Supplied"+len).focus();
							$("#dynamicdiv"+(len-1)).css("background","none");
							$("#dynamicdiv"+len).css("background","lightgreen");
						}
					
					}
					else
						{
						
						var packrefnum = 1;
						if($("#packReference"+(len-1)).text() != ""){
							packrefnum = $("#packReference"+(len-1)).text();
						}
						
						if(companyType=="franchise"){
							var row = "<tr id='dynamicdiv"+len+"' style='margin-top:5px;'><td class='slno'>"+slNo+"</td>" +"<td id='Name"+len+"'>"+sku.skuId+"</td>" +
							"<input type='hidden' id='skuId"+len+"' value='"+sku.skuId+"'/>" +
							"<input type='hidden' id='pluCode"+len+"' value='"+sku.pluCode+"'/>" +
							"<input type='hidden' id='category"+len+"' value='"+sku.category+"'/>" +
			    			"<input type='hidden' id='brandCode"+len+"' value='"+sku.brandCode+"'/>" +
			    			"<input type='hidden' id='productRange"+len+"' value='"+sku.productRange+"'/>" +
			    			"<input type='hidden' id='measureRange"+len+"' value='"+sku.measureRange+"'/>" +
		                    "<input type='hidden' id='productBatchNo"+len+"' value='"+sku.productBatchNo+"'/>" +
			    			"<input type='hidden' id='ean"+len+"' value='"+sku.ean+"'/>" +
			    			"<input type='hidden' id='utility"+len+"' value='"+sku.utility+"'/>" +
			    			"<input type='hidden' id='color"+len+"' value='"+sku.color+"'/>" +
			    			"<input type='hidden' id='size"+len+"' value='"+sku.size+"'/>" +
			    			"<input type='hidden' id='manufacturedItem"+len+"' value='"+sku.manufacturedItem+"'/>" +
			    			"<input type='hidden' id='availableQtydup"+len+"' value='"+availableQty+"'/>" +
		                    "<input type='hidden' id='mrpPrice"+len+"' value='"+sku.mrp+"'/>" + 

			    			"<input type='hidden' id='trackingRequired"+len+"' name ='trackingRequired' class='trackingRequired' value='"+sku.trackingRequired+"'/>"+
			    			"<td id='itemScanCode"+len+"' class='itemScanCode'  contenteditable='true'></td>" +
			    			"<td id='itemHSNCode"+len+"' class='itemHSNCode'   >"+sku.hsnCode+"</td>" +
			    			"<td id='Desc"+len+"'>"+description+"</td><td id='UOM"+len+"'>"+ sell_UOM + "</td>"+
			    			"<td class='Price' id='Price"+len+"' onBlur='changeIssued(this);' onkeypress='PreventEnter(this);' contenteditable='true'>"+sku.costPrice+"</td>"+
							"<td id='Pack"+len+"' class='Pack' >1</td>" +
							"<td id='Supplied"+len+"' onBlur='changeIssued(this);' onkeypress='PreventEnter(this);' >1</td>" +
							"<td class='Received' id='Received"+len+"' onBlur='changeReceived(this);' onkeypress='PreventEnter(this);'>1</td>" +
							"<td class='packReference' id='packReference"+len+"' onBlur='changeReceived(this);' onkeypress='PreventEnter(this);' contenteditable='true'>"+packrefnum+"</td>" +
							"<td  id='availableQty"+len+"' onclick='popupskuQty("+sku.skuId+")' ><a style='text-decoration: underline;cursor: pointer;text-decoration-color: blue;'>"+availableQty+"</a></td>" +
							"<td id='Cost"+len+"'>"+sku.costPrice+"</td>" +
							"<td id='Del"+len+"'><img id='Img"+len+"' src='"+contextPath+"/images/itemdelete.png' style='width:35%;cursor:pointer;' onclick='deleteItem(this);' title='Delete "+sku.skuId+"'/></td></tr>";
							$("#productsList tbody").append(row);
							$("#Supplied"+len).focus();
							$("#dynamicdiv"+(len-1)).css("background","none");
							$("#dynamicdiv"+len).css("background","lightgreen");
						}else{
							var row = "<tr id='dynamicdiv"+len+"' style='margin-top:5px;'><td class='slno'>"+slNo+"</td>" +"<td id='Name"+len+"'>"+sku.skuId+"</td>" +
							"<input type='hidden' id='skuId"+len+"' value='"+sku.skuId+"'/>" +
							"<input type='hidden' id='pluCode"+len+"' value='"+sku.pluCode+"'/>" +
							"<input type='hidden' id='category"+len+"' value='"+sku.category+"'/>" +
			    			"<input type='hidden' id='brandCode"+len+"' value='"+sku.brandCode+"'/>" +
			    			"<input type='hidden' id='productRange"+len+"' value='"+sku.productRange+"'/>" +
			    			"<input type='hidden' id='measureRange"+len+"' value='"+sku.measureRange+"'/>" +
		                     "<input type='hidden' id='productBatchNo"+len+"' value='"+sku.productBatchNo+"'/>" +
			    			"<input type='hidden' id='ean"+len+"' value='"+sku.ean+"'/>" +
			    			"<input type='hidden' id='utility"+len+"' value='"+sku.utility+"'/>" +
			    			"<input type='hidden' id='color"+len+"' value='"+sku.color+"'/>" +
			    			"<input type='hidden' id='size"+len+"' value='"+sku.size+"'/>" +
			    			"<input type='hidden' id='manufacturedItem"+len+"' value='"+sku.manufacturedItem+"'/>" +
			    			"<input type='hidden' id='availableQtydup"+len+"' value='"+availableQty+"'/>" +
		                    "<input type='hidden' id='mrpPrice"+len+"' value='"+sku.mrp+"'/>" + 
			    			"<input type='hidden' id='trackingRequired"+len+"' name ='trackingRequired' class='trackingRequired' value='"+sku.trackingRequired+"'/>"+
			    			"<td id='itemScanCode"+len+"' class='itemScanCode'  contenteditable='true'></td>" +
			    			"<td id='itemHSNCode"+len+"' class='itemHSNCode'   >"+sku.hsnCode+"</td>" +
			    			"<td id='Desc"+len+"'>"+description+"</td><td id='UOM"+len+"'>"+ sell_UOM + "</td>"+
			    			"<td class='Price' id='Price"+len+"'>"+sku.costPrice+"</td>"+
							"<td id='Pack"+len+"' class='Pack' >1</td>" +
							"<td id='Supplied"+len+"' onBlur='changeIssued(this);' onkeypress='PreventEnter(this);' >1</td>" +
							"<td class='Received' id='Received"+len+"' onBlur='changeReceived(this);' onkeypress='PreventEnter(this);'>1</td>" +
							"<td class='packReference' id='packReference"+len+"' onBlur='changeReceived(this);' onkeypress='PreventEnter(this);' contenteditable='true'>"+packrefnum+"</td>" +
							"<td  id='availableQty"+len+"' onclick='popupskuQty("+sku.skuId+")' ><a style='text-decoration: underline;cursor: pointer;text-decoration-color: blue;'>"+availableQty+"</a></td>" +
							"<td id='Cost"+len+"'>"+sku.costPrice+"</td>" +
							"<td id='Del"+len+"'><img id='Img"+len+"' src='"+contextPath+"/images/itemdelete.png' style='width:35%;cursor:pointer;' onclick='deleteItem(this);' title='Delete "+sku.skuId+"'/></td></tr>";
							$("#productsList tbody").append(row);
							$("#Supplied"+len).focus();
							$("#dynamicdiv"+(len-1)).css("background","none");
							$("#dynamicdiv"+len).css("background","lightgreen");
							
						}
						}
				}
			}
  			
			else{
				debugger
				 var zeroStockValue = $("#zeroStock").val();
				
				 if($("#flowType").val()=="issue" ){
						if($("#finalStatus").val() != undefined && $("#finalStatus").val() != null){
					 if($("#defaultstatus").val() == $("#finalStatus").val()){
						 $("#Error").html("Not Allowed To Add Items After "+$("#finalStatus").val()+" State");
						 return false;
						}
						}
					 
					 if(trackreq == false){	
					 
					 if(zeroStockValue == "false"){
						 if(sku.zeroStock == true || sku.quantity>=0){
					var row = "<tr id='dynamicdiv"+len+"' style='margin-top:5px;'><td class='slno'>"+slNo+"</td>" +"<td id='Name"+len+"'>"+sku.skuId+"</td>" +
	   				"<input type='hidden' id='skuId"+len+"' value='"+sku.skuId+"'/>" +
	   				"<input type='hidden' id='pluCode"+len+"' value='"+sku.pluCode+"'/>" +
	   				"<input type='hidden' id='category"+len+"' value='"+sku.category+"'/>" +
	    			"<input type='hidden' id='brandCode"+len+"' value='"+sku.brandCode+"'/>" +
	    			"<input type='hidden' id='productRange"+len+"' value='"+sku.productRange+"'/>" +
	    			"<input type='hidden' id='measureRange"+len+"' value='"+sku.measureRange+"'/>" +
                     "<input type='hidden' id='productBatchNo"+len+"' value='"+sku.productBatchNo+"'/>" +
	    			"<input type='hidden' id='ean"+len+"' value='"+sku.ean+"'/>" +
	    			"<input type='hidden' id='utility"+len+"' value='"+sku.utility+"'/>" +
	    			"<input type='hidden' id='color"+len+"' value='"+sku.color+"'/>" +
	    			"<input type='hidden' id='size"+len+"' value='"+sku.size+"'/>" +
	    			"<input type='hidden' id='availableQtydup"+len+"' value='"+availableQty+"'/>" +
	    			"<input type='hidden' id='trackingRequired"+len+"' name ='trackingRequired' class='trackingRequired' value='"+sku.trackingRequired+"'/>"+
	    			"<input type='hidden' id='mrpPrice"+len+"' value='"+sku.mrp+"'/>" + 

                    "<td id='itemScanCode"+len+"'  class='itemScanCode' contenteditable='true'onkeypress='PreventEnter(this);'></td>" +
	    			"<td id='itemHSNCode"+len+"' class='itemHSNCode'>"+sku.hsnCode+"</td>" +
	    			"<td id='Desc"+len+"'>"+description+"</td><td id='UOM"+len+"'>"+ sell_UOM + "</td>" +
	   				"<td class='Price' id='Price"+len+"'>"+sku.price+"</td>" +
	   				"<td id='Pack"+len+"' class='Pack' onBlur='changePack(this);' onkeypress='PreventEnter(this);' contenteditable='true'>1</td>" +
	   				"<td id='Supplied"+len+"' onBlur='changeIssued(this)' onkeypress='PreventEnter(this);' contenteditable='true'>1</td><td class='Received' id='Received"+len+"' contenteditable='true' onkeypress='PreventEnter(this);'>1</td>" +
	   				"<td  id='availableQty"+len+"' onclick='popupskuQty("+sku.skuId+")' ><a style='text-decoration: underline;cursor: pointer;text-decoration-color: blue;'>"+availableQty+"</a></td>" +
	   				"<td id='Cost"+len+"'>"+parseFloat(sku.costPrice).toFixed(2)+"</td>" +
	   				"<td id='Del"+len+"'>" +
	   				"<img id='Img"+len+"' src='"+contextPath+"/images/itemdelete.png' style='width:35%;cursor:pointer;' onclick='deleteItem(this);' title='Delete "+sku.skuId+"'/></td></tr>";
	   				$("#productsList tbody").append(row);
	   				$("#Supplied"+len).focus();
					$("#dynamicdiv"+(len-1)).css("background","none");
					$("#dynamicdiv"+len).css("background","lightgreen");
	   				
					  
				}
						 else{
							 alert("stock not available");
						 }
					 } 
					 else 
						 {	
						 var row = "<tr id='dynamicdiv"+len+"' style='margin-top:5px;'><td class='slno'>"+slNo+"</td>" +"<td id='Name"+len+"'>"+sku.skuId+"</td>" +
				   				"<input type='hidden' id='skuId"+len+"' value='"+sku.skuId+"'/>" +
				   				"<input type='hidden' id='pluCode"+len+"' value='"+sku.pluCode+"'/>" +
				   				"<input type='hidden' id='category"+len+"' value='"+sku.category+"'/>" +
				    			"<input type='hidden' id='brandCode"+len+"' value='"+sku.brandCode+"'/>" +
				    			"<input type='hidden' id='productRange"+len+"' value='"+sku.productRange+"'/>" +
				    			"<input type='hidden' id='measureRange"+len+"' value='"+sku.measureRange+"'/>" +
		                      	  "<input type='hidden' id='productBatchNo"+len+"' value='"+sku.productBatchNo+"'/>" + 
				    			"<input type='hidden' id='ean"+len+"' value='"+sku.ean+"'/>" +
				    			"<input type='hidden' id='utility"+len+"' value='"+sku.utility+"'/>" +
				    			"<input type='hidden' id='color"+len+"' value='"+sku.color+"'/>" +
				    			"<input type='hidden' id='size"+len+"' value='"+sku.size+"'/>" +
				    			"<input type='hidden' id='availableQtydup"+len+"' value='"+availableQty+"'/>" +
				    			"<input type='hidden' id='trackingRequired"+len+"' name ='trackingRequired' class='trackingRequired' value='"+sku.trackingRequired+"'/>"+
				                "<input type='hidden' id='mrpPrice"+len+"' value='"+sku.mrp+"'/>" + 		    		
			                    "<td id='itemScanCode"+len+"' class='itemScanCode'  onkeypress='PreventEnter(this);' contenteditable='true'></td>" +
				    			"<td id='itemHSNCode"+len+"' class='itemHSNCode'>"+sku.hsnCode+"</td>" +
				    			"<td id='Desc"+len+"'><div id='overflowtext'><a href='#' data-toggle='tooltip'  title='"+description+"'>"+description+"</a></div></td>"+
/*
				    			"<td id='Desc"+len+"'>"+description+"</td>" +*/
				    		    "<td id='UOM"+len+"'>"+ sell_UOM + "</td>" +
				   				"<td class='Price' id='Price"+len+"'>"+sku.price+"</td>" +
				   				"<td id='Pack"+len+"' class='Pack' onBlur='changePack(this);' onkeypress='PreventEnter(this);' contenteditable='true'>1</td>" +
				   				"<td id='Supplied"+len+"'onBlur='changeIssued(this)'onchange='return (this.innerText.length < 10)' onkeypress='PreventEnter(this);' contenteditable='true'>1</td><td class='Received' id='Received"+len+"' contenteditable='true' onkeypress='PreventEnter(this);'	onchange='return (this.innerText.length < 10)' onkeypress='PreventEnter(this);' >1</td>" +
				   				"<td  id='availableQty"+len+"' onclick='popupskuQty("+sku.skuId+")' ><a style='text-decoration: underline;cursor: pointer;text-decoration-color: blue;'>"+availableQty.toFixed(2)+"</a></td>" +
				   				"<td id='Cost"+len+"'>"+parseFloat(sku.costPrice).toFixed(2)+"</td>" +
				   				"<td id='Del"+len+"'>" +
				   				"<img id='Img"+len+"' src='"+contextPath+"/images/itemdelete.png' style='width:35%;cursor:pointer;' onclick='deleteItem(this);' title='Delete "+sku.skuId+"'/></td></tr>";
				   				$("#productsList tbody").append(row);
				   				$("#Supplied"+len).focus();
								$("#dynamicdiv"+(len-1)).css("background","none");
								$("#dynamicdiv"+len).css("background","lightgreen");
							 
						 }
					 
					 
					 }	 
					 else
						 {
						 
						 if(zeroStockValue == "false"){
							 if(sku.zeroStock == true || sku.quantity>=0){
						var row = "<tr id='dynamicdiv"+len+"' style='margin-top:5px;'><td class='slno'>"+slNo+"</td>" +"<td id='Name"+len+"'>"+sku.skuId+"</td>" +
		   				"<input type='hidden' id='skuId"+len+"' value='"+sku.skuId+"'/>" +
		   				"<input type='hidden' id='pluCode"+len+"' value='"+sku.pluCode+"'/>" +
		   				"<input type='hidden' id='category"+len+"' value='"+sku.category+"'/>" +
		    			"<input type='hidden' id='brandCode"+len+"' value='"+sku.brandCode+"'/>" +
		    			"<input type='hidden' id='productRange"+len+"' value='"+sku.productRange+"'/>" +
		    			"<input type='hidden' id='measureRange"+len+"' value='"+sku.measureRange+"'/>" +
	                    "<input type='hidden' id='productBatchNo"+len+"' value='"+sku.productBatchNo+"'/>" +
		    			"<input type='hidden' id='ean"+len+"' value='"+sku.ean+"'/>" +
		    			"<input type='hidden' id='utility"+len+"' value='"+sku.utility+"'/>" +
		    			"<input type='hidden' id='color"+len+"' value='"+sku.color+"'/>" +
		    			"<input type='hidden' id='size"+len+"' value='"+sku.size+"'/>" +
		    			"<input type='hidden' id='availableQtydup"+len+"' value='"+availableQty+"'/>" +
			             "<input type='hidden' id='mrpPrice"+len+"' value='"+sku.mrp+"'/>" + 
		    			"<input type='hidden' id='trackingRequired"+len+"' name ='trackingRequired' class='trackingRequired' value='"+sku.trackingRequired+"'/>"+
		    			"<td id='itemScanCode"+len+"'  class='itemScanCode' onkeypress='PreventEnter(this);' contenteditable='true'></td>" +
		    			"<td id='itemHSNCode"+len+"' class='itemHSNCode'>"+sku.hsnCode+"</td>" +
		    			"<td id='Desc"+len+"'>"+description+"</td><td id='UOM"+len+"'>"+ sell_UOM + "</td>" +
		   				"<td class='Price' id='Price"+len+"'>"+sku.price+"</td>" +
		   				"<td id='Pack"+len+"' class='Pack' onBlur='changePack(this);' onkeypress='PreventEnter(this);' >1</td>" +
		   				"<td id='Supplied"+len+"' onBlur='changeIssued(this)' >1</td><td class='Received' id='Received"+len+"' >1</td>" +
		   				"<td  id='availableQty"+len+"' onclick='popupskuQty("+sku.skuId+")' ><a style='text-decoration: underline;cursor: pointer;text-decoration-color: blue;'>"+availableQty+"</a></td>" +
		   				"<td id='Cost"+len+"'>"+parseFloat(sku.costPrice).toFixed(2)+"</td>" +
		   				"<td id='Del"+len+"'>" +
		   				"<img id='Img"+len+"' src='"+contextPath+"/images/itemdelete.png' style='width:35%;cursor:pointer;' onclick='deleteItem(this);' title='Delete "+sku.skuId+"'/></td></tr>";
		   				$("#productsList tbody").append(row);
		   				$("#Supplied"+len).focus();
						$("#dynamicdiv"+(len-1)).css("background","none");
						$("#dynamicdiv"+len).css("background","lightgreen");
						  
					}
							 else{
								 alert("stock not available");
							 }
						 } 
						 else 
							 {	
							 var row = "<tr id='dynamicdiv"+len+"' style='margin-top:5px;'><td class='slno'>"+slNo+"</td>" +"<td id='Name"+len+"'>"+sku.skuId+"</td>" +
					   				"<input type='hidden' id='skuId"+len+"' value='"+sku.skuId+"'/>" +
					   				"<input type='hidden' id='pluCode"+len+"' value='"+sku.pluCode+"'/>" +
					   				"<input type='hidden' id='category"+len+"' value='"+sku.category+"'/>" +
					    			"<input type='hidden' id='brandCode"+len+"' value='"+sku.brandCode+"'/>" +
					    			"<input type='hidden' id='productRange"+len+"' value='"+sku.productRange+"'/>" +
					    			"<input type='hidden' id='measureRange"+len+"' value='"+sku.measureRange+"'/>" +
			                     	  "<input type='hidden' id='productBatchNo"+len+"' value='"+sku.productBatchNo+"'/>" +
					    			"<input type='hidden' id='ean"+len+"' value='"+sku.ean+"'/>" +
					    			"<input type='hidden' id='utility"+len+"' value='"+sku.utility+"'/>" +
					    			"<input type='hidden' id='color"+len+"' value='"+sku.color+"'/>" +
					    			"<input type='hidden' id='size"+len+"' value='"+sku.size+"'/>" +
					    			"<input type='hidden' id='availableQtydup"+len+"' value='"+availableQty+"'/>" +
						            "<input type='hidden' id='mrpPrice"+len+"' value='"+sku.mrp+"'/>" + 
					    			"<input type='hidden' id='trackingRequired"+len+"' name ='trackingRequired' class='trackingRequired' value='"+sku.trackingRequired+"'/>"+
					    			"<td id='itemScanCode"+len+"' class='itemScanCode' onkeypress='PreventEnter(this);' contenteditable='true'></td>" +
					    			"<td id='itemHSNCode"+len+"' class='itemHSNCode'>"+sku.hsnCode+"</td>" +
					    			"<td id='Desc"+len+"'>"+description+"</td><td id='UOM"+len+"'>"+ sell_UOM + "</td>" +
					   				"<td class='Price' id='Price"+len+"'>"+sku.price+"</td>" +
					   				"<td id='Pack"+len+"' class='Pack' onBlur='changePack(this);' onkeypress='PreventEnter(this);'>1</td>" +
					   				"<td id='Supplied"+len+"'onBlur='changeIssued(this)' >1</td><td class='Received' id='Received"+len+"' >1</td>" +
					   				"<td  id='availableQty"+len+"' onclick='popupskuQty("+sku.skuId+")' ><a style='text-decoration: underline;cursor: pointer;text-decoration-color: blue;'>"+availableQty+"</a></td>" +
					   				"<td id='Cost"+len+"'>"+parseFloat(sku.costPrice).toFixed(2)+"</td>" +
					   				"<td id='Del"+len+"'>" +
					   				"<img id='Img"+len+"' src='"+contextPath+"/images/itemdelete.png' style='width:35%;cursor:pointer;' onclick='deleteItem(this);' title='Delete "+sku.skuId+"'/></td></tr>";
					   				$("#productsList tbody").append(row);
					   				$("#Supplied"+len).focus();
									$("#dynamicdiv"+(len-1)).css("background","none");
									$("#dynamicdiv"+len).css("background","lightgreen");
								 
							 }
						 
						 
						 
						 
						 }
					 
}
				
				else{
					
					if(trackreq == false){
						var row = "<tr id='dynamicdiv"+len+"' style='margin-top:5px;'><td class='slno'>"+slNo+"</td>" +"<td id='skuID"+len+"'>"+sku.skuId+"</td>"+ "<td id='itemScanCode"+len+"'>"+sku.itemScanCode+"</td>" +
		   				"<input type='hidden' id='skuId"+len+"' value='"+sku.skuId+"'/>" +
		   				"<input type='hidden' id='pluCode"+len+"' value='"+sku.pluCode+"'/>" +
		   				"<input type='hidden' id='category"+len+"' value='"+sku.category+"'/>" +
		    			"<input type='hidden' id='brandCode"+len+"' value='"+sku.brandCode+"'/>" +
		    			"<input type='hidden' id='productRange"+len+"' value='"+sku.productRange+"'/>" +
		    			"<input type='hidden' id='measureRange"+len+"' value='"+sku.measureRange+"'/>" +
	                     "<input type='hidden' id='productBatchNo"+len+"' value='"+sku.productBatchNo+"'/>" +
		    			"<input type='hidden' id='ean"+len+"' value='"+sku.ean+"'/>" +
		    			"<input type='hidden' id='utility"+len+"' value='"+sku.utility+"'/>" +
		    			"<input type='hidden' id='color"+len+"' value='"+sku.color+"'/>" +
		    			"<input type='hidden' id='size"+len+"' value='"+sku.size+"'/>" +
			            "<input type='hidden' id='mrpPrice"+len+"' value='"+sku.mrp+"'/>" + 
		    			"<input type='hidden' id='trackingRequired"+len+"' name ='trackingRequired' class='trackingRequired' value='"+sku.trackingRequired+"'/>"+

		    			"<td id='Desc"+len+"'><div id='overflowtext'><a href='#' data-toggle='tooltip'  title='"+description+"'>"+description+"</a></div></td>"+
		    			"<td id='UOM"+len+"'>"+ sell_UOM + "</td>" +
		   				"<td class='Price' id='Price"+len+"'>"+sku.price+"</td>" +
		   				"<td id='Pack"+len+"' class='Pack' onBlur='changePack(this);' onkeypress='PreventEnter(this);' contenteditable='true'>1</td>" +
		   				"<td id='Cost"+len+"'>"+sku.costPrice+"</td>" +
		   				"<td id='Supplied"+len+"' onBlur='changeSuppliedPack(this);' onkeypress='PreventEnter(this);' contenteditable='true'>1</td>" +
		   				"<td id='weighted"+len+"'  onkeypress='PreventEnter(this);' contenteditable='true'>1</td>" +
		   				"<td class='Received' onBlur='changeReceivedPack(this);' onkeypress='PreventEnter(this);' id='Received"+len+"' contenteditable='true'>1</td>" +
		   				"<td id='Rejected"+len+"' onBlur='changeRejected(this);' onkeypress='PreventEnter(this);' contenteditable='true'>0</td><td id='Del"+len+"'>" +
		   				"<img id='Img"+len+"' src='"+contextPath+"/images/itemdelete.png' style='width:20px;cursor:pointer;' onclick='deleteItem(this);' title='Delete "+sku.skuId+"'/></td></tr>";
		   				$("#productsList tbody").append(row);
					        }
					else
						{
						var row = "<tr id='dynamicdiv"+len+"' style='margin-top:5px;'><td class='slno'>"+slNo+"</td>" +"<td id='Name"+len+"'>"+sku.skuId+"</td>" +
		   				"<input type='hidden' id='skuId"+len+"' value='"+sku.skuId+"'/>" +
		   				"<input type='hidden' id='pluCode"+len+"' value='"+sku.pluCode+"'/>" +
		   				"<input type='hidden' id='category"+len+"' value='"+sku.category+"'/>" +
		    			"<input type='hidden' id='brandCode"+len+"' value='"+sku.brandCode+"'/>" +
		    			"<input type='hidden' id='productRange"+len+"' value='"+sku.productRange+"'/>" +
		    			"<input type='hidden' id='measureRange"+len+"' value='"+sku.measureRange+"'/>" +
	                    "<input type='hidden' id='productBatchNo"+len+"' value='"+sku.productBatchNo+"'/>" +
		    			"<input type='hidden' id='ean"+len+"' value='"+sku.ean+"'/>" +
		    			"<input type='hidden' id='utility"+len+"' value='"+sku.utility+"'/>" +
		    			"<input type='hidden' id='color"+len+"' value='"+sku.color+"'/>" +
		    			"<input type='hidden' id='size"+len+"' value='"+sku.size+"'/>" +
			            "<input type='hidden' id='mrpPrice"+len+"' value='"+sku.mrp+"'/>" + 
		    			"<input type='hidden' id='trackingRequired"+len+"' name ='trackingRequired' class='trackingRequired' value='"+sku.trackingRequired+"'/>"+
		    			"<td id='itemScanCode"+len+"' class='itemScanCode'  contenteditable='true'></td>" +
		    			"<td id='Desc"+len+"'>"+description+"</td><td id='UOM"+len+"'>"+ sell_UOM + "</td>" +
		   				"<td class='Price' id='Price"+len+"'>"+sku.price+"</td>" +
		   				"<td id='Pack"+len+"' class='Pack' onBlur='changePack(this);' onkeypress='PreventEnter(this);' >1</td>" +
		   				"<td id='Cost"+len+"'>"+sku.costPrice+"</td>" +
		   				"<td id='Supplied"+len+"' onBlur='changeSuppliedPack(this);' onkeypress='PreventEnter(this);'>1</td>" +
		   				"<td id='weighted"+len+"'  onkeypress='PreventEnter(this);' >1</td>" +
		   				"<td class='Received' onBlur='changeReceivedPack(this);' onkeypress='PreventEnter(this);' id='Received"+len+"' >1</td>" +
		   				"<td id='Rejected"+len+"' onBlur='changeRejected(this);' onkeypress='PreventEnter(this);'>0</td><td id='Del"+len+"'>" +
		   				"<img id='Img"+len+"' src='"+contextPath+"/images/itemdelete.png' style='width:12%;cursor:pointer;' onclick='deleteItem(this);' title='Delete "+sku.skuId+"'/></td></tr>";
		   				$("#productsList tbody").append(row);
						
						}
					
				}
			}
		
    changeTotalCost();
	 changeTotalQuantity();
}


function getPrice(ele){
	debugger
	var id = $(ele).attr("id");
	id = id.replace('price','');
	$(".modal-backdrop").trigger("click");
	addItem(skuList[id]);
}

/**
 * @author Sahitya 
 * Delete row in dynamic table based on provided element
 * @param html element
 */
function deleteItem(element){
	
	var id = $(element).attr("id").replace('Img','');
	$('#dynamicdiv'+id).remove();
	
	 
	
	var slNo = 1; 
	 $('.slno').each(function(){
		$(this).text(slNo);
		slNo = parseInt(slNo) + 1;
	});
	
	changeTotalCost();
	changeTotalQuantity();
}


/**
 * @author Sahitya 
 * change supplied,received,cost,totalcost,totalqty values whenever pack/quantity is changing
 * @param html element
 */

function changePack(element){
	var id = $(element).attr("id");
	var rowNo = id.replace('Pack','');
	if (isNaN($("#"+id).html()) || $("#"+id).html() == ""){
		var supplied = parseFloat($('#Supplied'+rowNo).html());
		$('#'+id).html(supplied);
	}
	//isNumeric(element);
	var packVal = parseFloat($('#Pack'+rowNo).html());
	if(packVal<=0){
		alert("Pack should not be empty");
		var supplied = parseFloat($('#Supplied'+rowNo).html());
		var receivedVal = parseFloat($('#Received'+rowNo).html());
		var priceVal = parseFloat($('#Price'+rowNo).html());
		$('#Pack'+rowNo).html(supplied);
		$('#Cost'+rowNo).html(receivedVal*priceVal);
	}else{
		var priceVal = parseFloat($('#Price'+rowNo).html());
		var rejected = 0;
		if (isNaN($("#Rejected"+rowNo).html()) || $("#Rejected"+rowNo).html() == ""){
			
		}
		else
		 rejected = parseFloat($('#Rejected'+rowNo).html());
		
			var receivedVal =  packVal - rejected;
			$('#Supplied'+rowNo).html(packVal);
			$('#Received'+rowNo).html(receivedVal);
			$('#Cost'+rowNo).html(packVal*priceVal);
	
	}
	changeTotalCost();
	changeTotalQuantity();
}

function changeReceivedPack(element){
	var id = $(element).attr("id");
	var rowNo = id.replace('Received','');
	if (isNaN($("#"+id).html()) || $("#"+id).html() == ""){
		var supplied = parseFloat($('#Supplied'+rowNo).html());
		$('#'+id).html(supplied);
	}
	//isNumeric(element);
	var packVal = parseFloat($('#Received'+rowNo).html());
	var supplied = parseFloat($('#Supplied'+rowNo).html());
	if(packVal<=0){
		alert("Received Quantity should not be empty");
		var supplied = parseFloat($('#Supplied'+rowNo).html());
		var receivedVal = parseFloat($('#Received'+rowNo).html());
		var priceVal = parseFloat($('#Price'+rowNo).html());
		$('#Pack'+rowNo).html(supplied);
		$('#Cost'+rowNo).html(receivedVal*priceVal);
	}else{
		if(packVal>supplied)
			{
			alert("Received Quantity should not be greater than issued qty");
			$('#Received'+rowNo).html(supplied);
			}
		else{
			var priceVal = parseFloat($('#Price'+rowNo).html());
			var rejected = parseFloat(supplied-packVal);
				//var receivedVal =  packVal - rejected;
				//$('#Supplied'+rowNo).html(packVal);
				$('#Received'+rowNo).html(packVal);
				$('#Rejected'+rowNo).html(rejected);
				$('#Cost'+rowNo).html(packVal*priceVal);
		}
		
	
	}
	//changeRejected()
	changeTotalCost();
	changeTotalQuantity();
}

function changeSuppliedPack(element){
	var id = $(element).attr("id");
	var rowNo = id.replace('Supplied','');
	if (isNaN($("#"+id).html()) || $("#"+id).html() == ""){
		var supplied = parseFloat($('#Supplied'+rowNo).html());
		$('#'+id).html(supplied);
	}
	//isNumeric(element);
	var packVal = parseFloat($('#Supplied'+rowNo).html());
	if(packVal<=0){
		alert("Supplied Quantity should not be empty");
		var supplied = parseFloat($('#Supplied'+rowNo).html());
		var receivedVal = parseFloat($('#Received'+rowNo).html());
		var priceVal = parseFloat($('#Price'+rowNo).html());
		$('#Pack'+rowNo).html(supplied);
		$('#Cost'+rowNo).html(parseFloat(receivedVal*priceVal).toFixed(2));
	}else{
		var priceVal = parseFloat($('#Price'+rowNo).html());
		var rejected = parseFloat($('#Rejected'+rowNo).html());
		if(packVal<rejected){
			alert("Supplied Quantity cannot be less than Rejected");
			var supplied = parseFloat($('#Supplied'+rowNo).html());
			$('#'+id).html(supplied);
		}
		else{
			var receivedVal =  packVal - rejected;
			$('#Supplied'+rowNo).html(packVal);
			$('#Received'+rowNo).html(receivedVal);
			$('#Cost'+rowNo).html(parseFloat(packVal*priceVal).toFixed(2));
			$('#weighted'+rowNo).html(packVal);
		}
	}
	changeTotalCost();
	changeTotalQuantity();
}

function changeIssued(element){
	debugger
	var id = $(element).attr("id");
	var exit =id.includes("Price");
	if(exit==true){
		id =id.replace('Price','Supplied');
	}
	
	
	var rowNo = id.replace('Supplied','');
	
	var packedData = $('#Pack'+rowNo).text();
	 $('#Supplied'+rowNo).text();
	 $('#Received'+rowNo).text();
	 
	 if(parseFloat($('#Supplied'+rowNo).text()) > 9999 ){
		 $('#Supplied'+rowNo).html(packedData);
		 $('#Error').html("Maximum Allowed Qty is 9999");
		 $('#Error').focus();
	 }
	
	
	if (isNaN($("#"+id).html()) || $("#"+id).html() == ""){
		var supplied = $('#Supplied'+rowNo).html();
		$('#'+id).html(supplied);
	}
	//isNumeric(element);
	var packVal = parseFloat($('#Supplied'+rowNo).html());
	var avail = parseFloat($('#availableQtydup'+rowNo).val());
	if(packVal<=0){
		$('#Error').html("Pack should not be empty");
		$('#Error').focus();
		var supplied = parseFloat($('#Supplied'+rowNo).html());
		var receivedVal = parseFloat($('#Received'+rowNo).html());
		var priceVal = parseFloat($('#Price'+rowNo).html());
		$('#Pack'+rowNo).html(supplied);
		$('#Cost'+rowNo).html(supplied*priceVal);
	}else{
		var priceVal = parseFloat($('#Price'+rowNo).html());
		var rejected = parseFloat($('#Rejected'+rowNo).html());
		if(packVal<rejected){
			$('#Error').html("Pack cannot be less than Rejected");
			$('#Error').focus();
			var supplied = parseFloat($('#Supplied'+rowNo).html());
			$('#'+id).html(supplied);
		}
		else if(packVal>avail){
			if($('#manufacturedItem'+rowNo).val() != "true"){
			$('#Error').html("Issued Qty Should not be greater than Available Qty");
			$('#Error').focus();
			 $('#Supplied'+rowNo).html(avail);
			 $('#Received'+rowNo).html(avail);
			 var supplied = parseFloat($('#Supplied'+rowNo).html());
			 $('#Cost'+rowNo).html(supplied*priceVal);
			}else{
			 var supplied = parseFloat($('#Supplied'+rowNo).html());
			 $('#Received'+rowNo).html(supplied);
			 $('#Pack'+rowNo).html(supplied);
			 $('#Cost'+rowNo).html(supplied*priceVal);
			}
		}
		else{
			var receivedVal =  packVal;
			$('#Supplied'+rowNo).html(packVal);
			$('#Received'+rowNo).html(receivedVal);
			$('#Cost'+rowNo).html((receivedVal*priceVal).toFixed(2));
			$('#Pack'+rowNo).html(packVal);
		}
	}
	changeTotalCost();
	changeTotalQuantity();
}

function validateStockReceipt(status,operation,receipt_ref_num,id_goods_receipt){
		 var shippedFrom = $('#fromLocation :selected').val();
		 var shippedTo = $('#tolocation :selected').val();
		 /*var deliveredBy = $('#delivered').val();
		 var inspectedBy = $('#inspected').val();
		 var receivedBy = $('#received').val();
		 var totalQty = $('#totalQty').val();
		 var totalCost = $('#totalCost').val();
		 var remarks = $('#remarks').val();
		 var date = $('#date').val();
		 var issue_ref = $("#issueRef").val();
		 var request_ref = $("#stockreqref").val();
		 var issueddate = $("#issueddate").val();
		 var issuedBy = $("#issuedBy").val();
		 var shippmentMode = $("#shippmentMode").val();
		 var shippmentRef = $("#shippmentRef").val();*/
		 var obj = {},reciptDetails=[];
		 
		 
		 //purpose:for checking internet conection
			var online = window.navigator.onLine;
		  	if(!online){
		  	alert("check your internet connection,please try agian after some time");
		  	return;
		  	}
		 
		 debugger
		 var itemScanCodes = [];
		 var trackingRequireds = [];
			  $('.itemScanCode').each( function(){
				  			  
				  		itemScanCodes.push($(this).text() );  
					});
			
	      
			  $('.trackingRequired').each(function() {
	  			  
				  trackingRequireds.push($(this).val() );  
				});
			
			
			  for(var i=0; i<itemScanCodes.length;i++)
				  {
				  var scanCode=itemScanCodes[i];
				  
				  if(trackingRequireds[i] == "true"){
				  if(scanCode == "")
		  			{
		  				alert("Scan Codes can't be Empty");
		  				return;
		  			}
				  
				  for(var j=i+1; j<itemScanCodes.length;j++)
				   {
					  var scanTempCode = itemScanCodes[j];
				  		if(scanTempCode == scanCode)
				  			{
				  				alert("can't be duplicates in Scan Codes");
				  				return;
				  			}
				   }	
				  }
		// }
		
				  }
		 
		 debugger;
		  
		 var re = /^[0-9/]+$/;
		
		 if($("#date").val() == ""){
				//$("#deliveryDateError").html("Enter a Date");
				$("#date").focus();
				//focusDiv('deliveryDateError');
				return;
		 }
		 var noOfDays = daydiff(parseDate($('#createdDate').val()), parseDate($('#date').val()));
		 if(noOfDays < 0){
			 $("#deliveryDateError").html("Delivery Date can't be less than Date");
			 $("#deliveryDateError").focus();
			 focusDiv('deliveryDateError');
			 return;
		 }
		 
		 if($("#delivered").val() == ""){
			    $("#delivered").focus();
				$("#deliveredByError").html("Enter Delivered By");
				//focusDiv('deliveredByError');
				
				return;
		 }
		 if(!re.test($("#date").val())){
				$("#deliveryDateError").html("Invalid Date");
				focusDiv('deliveryDateError');
				return;
		 }
		
		
		 
		 if(status != "Draft"){
    		 if(shippedFrom==shippedTo){
    			 $('#Error').html('From and To locations must be different');
    			 return false;
    	
		 }
		 }
		 if(operation=="update"){
			 if($('#nostatus').val()=='nostatus'){
				 if($('#defaultstatus').val() == 'Draft')
				 {
				 status = 'Received';
				 }
				 else
    			 status = $('#defaultstatus').val();
        		 }
			 else if($('#statusissue').val() == ''){
				 status = $('#defaultstatus').val();
			 }
        		 else{
        			 status = $('#statusissue').val(); 
        		 }
		 }
		 var flag = "";
		 if($("#trackingRequired").val()== undefined || $("#trackingRequired").val()== null || $("#trackingRequired").val()== "" || $("#trackingRequired").val()== false){
	  			flag = false;
	  			}
	  	  	else{
	  	  	flag = true;
	  	  	}
		 
		 var createdDate = "";
		 var itemDetails;
		 if($("#createdDate").length > 0)
			 createdDate = $("#createdDate").val();
		  var len = $("#productsList tr").length-1;
			 if(len == 0){
	            alert("Add Atleast One Item to Receipt");
	           	return;
	         }
	    	 else{
	    		 var flowUnder = $("#flowUnder").val();
	    			  var len = $("#productsList tr").length-1;
	    			  for(var i=1;i<=len;i++){
	    			  		var items; 
	    			  	  		var idAttr = $("#productsList tr:eq("+i+") td:last").attr("id").replace('Del','');
	    			  	  		if($("#flowUnder").val()=='warehouse'){
	    			  	  		items = {trackingRequired:$("#trackingRequired"+idAttr).val(),itemScanCode:$("#itemScanCode"+idAttr).text(),utility:$("#utility"+idAttr).val(),ean:$("#ean"+idAttr).val(),skuId:$("#skuId"+idAttr).val(),pluCode:$("#pluCode"+idAttr).val(),item:$("#Name"+idAttr).text(),description:$("#Desc"+idAttr).text(),uom:$("#UOM"+idAttr).text(),price:parseFloat($("#Price"+idAttr).text()),costPrice:parseFloat($("#Cost"+idAttr).text()),receivedQty:parseFloat($("#Received"+idAttr).text()),reqQty:parseFloat($("#Pack"+idAttr).text()),receivedQty:parseFloat($("#weighted"+idAttr).text()),acceptedQty:parseFloat($("#Received"+idAttr).text()),rejQty:parseFloat($("#Rejected"+idAttr).text()),returnQty:parseFloat($("#Supplied"+idAttr).text()),reciept_id:receipt_ref_num,productBatchNo:$("#productBatchNo"+idAttr).val()};
	    			  	  	  		}
	    			  	  		else
	    			  	  			{
	    			  	  		items = {trackingRequired:flag,itemScanCode:$("#itemScanCode"+idAttr).text(),utility:$("#utility"+idAttr).val(),ean:$("#ean"+idAttr).val(),weighedQty:parseFloat($("#weighted"+idAttr).text()),color:$("#color"+idAttr).val(),size:$("#size"+idAttr).val(),category:$("#category"+idAttr).val(),department:$("#department"+idAttr).val(),measurementRange:$("#measureRange"+idAttr).val(),productRange:$("#productRange"+idAttr).val(),brand:$("#brandCode"+idAttr).val(),skuId:$("#skuId"+idAttr).val(),pluCode:$("#pluCode"+idAttr).val(),item:$("#Name"+idAttr).text(),description:$("#Desc"+idAttr).text(),uom:$("#UOM"+idAttr).text(),cost:parseFloat($("#Cost"+idAttr).text()),price:parseFloat($("#mrpPrice"+idAttr).val()),recieved:parseFloat($("#Received"+idAttr).text()),rejected:parseFloat($("#Rejected"+idAttr).text()),supplied:parseFloat($("#Supplied"+idAttr).text()),quantity:parseFloat($("#Pack"+idAttr).text()),max_quantity:parseFloat($("#Pack"+idAttr).text()),productBatchNo:$("#productBatchNo"+idAttr).val()};
	    			  	  			}
	    			  	  	reciptDetails.push(items);
	    			  	}
	    			if(id_goods_receipt == null  || id_goods_receipt== undefined || id_goods_receipt==""){
	    				id_goods_receipt =0;
	    			}
	    			  
	    			debugger
				 var contextPath = $("#contextPath").val();
				 var location = $("#toLocation").val();
				 obj.shipped_from = $('#fromLocation :selected').val();
        		 obj.receipt_location = $('#tolocation :selected').val();
        		 obj.delivered_by = $('#delivered').val();
        		 obj.status = status;
        		 obj.sub_total = parseFloat($('#totalCost').val());
        		 obj.remarks = $('#remarks').val();
        		 obj.goods_Request_Ref = $("#stockreqref").val();
        		 obj.inspectedBy = $('#inspected').val();
        		 obj.received_by = $('#received').val();
        		 obj.issueReferenceNo = $('#issueRef').val();
        		 obj.issuedDateStr = $("#issueddate").val();
        		 obj.shipmentRefNo = $("#shippmentRef").val();
        		 obj.issuedBy = $("#issuedBy").val();
        		 obj.receipt_total_qty = parseFloat($('#totalQty').val());
        		 obj.grand_total =  parseFloat($('#totalCost').val());
        		 obj.id_goods_receipt = parseInt(id_goods_receipt);
        		 obj.deliveryDate = $('#date').val();
        		 obj.createdDateStr = $('#createdDate').val();
        		 obj.shipmentMode = $("#shippmentMode").val();
        		 obj.flowUnder = flowUnder
        		 obj.goods_receipt_ref_num = receipt_ref_num;
        		 obj.receipt_total =  parseFloat($('#totalCost').val());
        		 obj.reciptDetails = reciptDetails;
        		 var formData = JSON.stringify(obj);
        		 console.log(formData);
				 if(operation=="new"){
					URL = contextPath + "/inventorymanager/createStockReceipt.do";
				 }else if(operation=="update"){
					 URL = contextPath + "/inventorymanager/updateStockReceipt.do";
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
		       				if(flowUnder == "outlet"){
		    					openMenu("liGoodsTransfer","ulGoodsTransfer",0);
		    					openMenu("liInventoryManagement","ulInventoryManagement",1);
		    					openMenu("storedetails","ulstoredetails",1);
		    				}
		    				else if(flowUnder == "warehouse"){
		    					openMenu("liWarehouseGoodsTransfer","ulWarehouseGoodsTransfer",0);
		    					openMenu("liStockManagement","ulStockManagement",1);
		    					openMenu("warehouseDetails","ulwarehouseDetails",1);
		    				
		       			}
//		       				$("#tab_1").html(result);
		       			    $("#right-side").html(result);
		       			    $("#toLocation").val(location);
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
		
	 }

function getStorelistByLocation(location){
	debugger
	 //purpose:for checking internet conection
	var online = window.navigator.onLine;
  	if(!online){
  	alert("check your internet connection,please try agian after some time");
  	return;
  	}
	var contextPath = $('#contextPath').val();
	  var URL = contextPath + "/inventorymanager/getStorelistByLocation.do";
	  $.ajax({
		type: "GET",
		url : URL,
		data : {
			location : location
		},
		beforeSend: function(xhr){                    
				$("#loading").css("display","block");
				$("#mainDiv").addClass("disabled");
			},
		success : function(result){
			
			 //$("#right-side").html(result);
				
			//alert("Result:::"+result);
			//appendStorelistDetails(result);
			for (index = 0; index < result.length; index++) 
				{
				//alert("zerostock : " +result[index].zeroStock)
				//$("#zeroStock").text(result[index].zeroStock)
				$("#zeroStock").attr("value",result[index].zeroStock);
				}
			
			$("#loading").css("display","none");
			$("#mainDiv").removeClass('disabled');
		},
		error : function(){
			
			 alert("something went wrong");
			 $("#loading").css("display","none");
			 $("#mainDiv").removeClass('disabled');
		}
	 });
}



function changeReceived(element){
	debugger;
	var id = $(element).attr("id");
	var rowNo = id.replace('Pack','');
	if(rowNo.length > 1){
		var rowNoreceived = id.replace('Received','');
	}
	
	var packedData = $('#Pack'+rowNoreceived).text();
	 $('#Received'+rowNoreceived).text();
	 if($('#Received'+rowNoreceived).text().length > 4 ){
		 $('#Received'+rowNoreceived).html(packedData);
		 alert("Maximum Allowed Qty is 9999");
	 }
	
	if (isNaN($("#"+id).html()) || $("#"+id).html() == ""){
		var supplied = parseFloat($('#Supplied'+rowNo).html());
		$('#'+id).html(supplied);
	}
	//isNumeric(element);
	var packVal = parseFloat($('#Pack'+rowNo).html());
	if(packVal<=0){
		alert("Pack should not be empty");
		var supplied = parseFloat($('#Supplied'+rowNo).html());
		var receivedVal = parseFloat($('#Received'+rowNo).html());
		var priceVal = parseFloat($('#Price'+rowNo).html());
		$('#Pack'+rowNo).html(supplied);
		$('#Cost'+rowNo).html(receivedVal*priceVal);
	}else{
		var priceVal = parseFloat($('#Price'+rowNo).html());
		var rejected = parseFloat($('#Rejected'+rowNo).html());
		if(packVal<rejected){
			alert("Pack cannot be less than Rejected");
			var supplied = parseFloat($('#Supplied'+rowNo).html());
			$('#'+id).html(supplied);
		}
		else{
			var receivedVal =  packVal - rejected;
			$('#Supplied'+rowNo).html(packVal);
			$('#Received'+rowNo).html(receivedVal);
			$('#Cost'+rowNo).html(receivedVal*priceVal);
		}
	}
	changeTotalCost();
	changeTotalQuantity();
}
/**
 * @author Sahitya 
 * change totalcost whenever receieved value is changing
 * @param html element
 */
function changeTotalCost(){
	var totalCost=0.0;
	$('.Received').each(function(){
	  var rowNo = $(this).attr("id").replace('Received','');
	  var cost = $("#Price"+rowNo).html();
	  var received = $('#Received'+rowNo).html();
	  totalCost = parseFloat(cost)*parseFloat(received)+totalCost;
	  
	  $("#Pack"+rowNo).attr('contenteditable', 'false')
	  
	 });
	$('#totalCost').val(totalCost.toFixed(2));
	
}

/**
 * @author Sahitya 
 * change totalqty whenever receieved value is changing
 * @param html element
 */
function changeTotalQuantity(){
	var totalQty=0;
	var count= 0;
	
	$('.Received').each(function(){
	  var rowNo = $(this).attr("id").replace('Received','');
	  var qty = $("#Supplied"+rowNo).html();
	  totalQty = parseFloat(qty)+totalQty;
	  count +=1 ;
	 });
	$('#totalQty').val(totalQty.toFixed(2));
	$('#itemcount').val(count);
	$('#discount').val(0);
}

/**
 * @author Sahitya 
 * change received,cost,totalcost,totalqty values whenever rejected value is changing
 * @param html element
 */
function changeRejected(element){
	//isNumeric(element);
	var id = $(element).attr("id");
	if (isNaN($("#"+id).html()) || $("#"+id).html() == "")
		$('#'+id).html("0");
	var rowNo = id.replace('Rejected','');
	var rejectedVal = $(element).html();
//	alert("index of + "+ )
	if(rejectedVal.indexOf('+') != -1 || rejectedVal.indexOf('-') != -1){
		$('#'+id).html("0");
		rejectedVal = 0;
	}
	var suppliedVal = $('#Supplied'+rowNo).html();
	if(parseFloat(rejectedVal)>0){
		if(parseFloat(suppliedVal)>=parseFloat(rejectedVal)){
			$('#Received'+rowNo).html(parseFloat(suppliedVal)-parseFloat(rejectedVal));
		}else{
			alert("Rejected Quantity should be less than or equal to Supplied Quantity");
			$(element).html(0);
			$('#Received'+rowNo).html(suppliedVal);
		}
	}else{
		$('#Received'+rowNo).html(suppliedVal);
	}
	var cost = parseFloat($("#Price"+rowNo).html());
	var received = parseFloat($('#Received'+rowNo).html());
	$('#Cost'+rowNo).html(cost*received);
	changeTotalCost();
	changeTotalQuantity();

}

/**
 * @author Sahitya 
 * check whether the element value is number or not 
 * @param html element
 */
function isNumeric(element){
	 var $th = $(element);
	 var id = $(element).attr("id");
	 if(id.indexOf("Pack") > -1){
	// if(id.contains("Pack")){
		 $th.html( $th.html().replace(/[^0-9]+( [0-9]+)*$/g, function(str) 
				 {  
			      $('#'+id).html('');
			      return 1;
				 } 
			  ));
	 }else{
		 $th.html( $th.html().replace(/[^0-9]+( [0-9]+)*$/g, function(str) 
				 {  
					return 0;
				 } 
				 )); 
	 }
	
	
}

/**
 * @author Sahitya 
 * 
 * Prepare Json object with items details which contained in dynamic table
 * 
 * @return JSON object
 */
function goodsTransferItems(transferType){
    var len = $("#productsList tr").length-1;
    //alert(transferType);
  	var finalObj = {},itemDetails = [];
  	finalObj.itemDetails = itemDetails;
  	for(var i=1;i<=len;i++){
  		var obj;
  	  		var idAttr = $("#productsList tr:eq("+i+") td:last").attr("id").replace('Del','');
  	  		if(transferType=='receipt'){
  	  			obj = {weighedQty:$("#weighted"+idAttr).text(),color:$("#color"+idAttr).val(),size:$("#size"+idAttr).val(),category:$("#category"+idAttr).val(),measurementRange:$("#measureRange"+idAttr).val(),productRange:$("#productRange"+idAttr).val(),brand:$("#brandCode"+idAttr).val(),skuId:$("#skuId"+idAttr).val(),pluCode:$("#pluCode"+idAttr).val(),item:$("#Name"+idAttr).text(),description:$("#Desc"+idAttr).text(),uom:$("#UOM"+idAttr).text(),price:$("#Price"+idAttr).text(),cost:$("#Cost"+idAttr).text(),recieved:$("#Received"+idAttr).text(),rejected:$("#Rejected"+idAttr).text(),supplied:$("#Supplied"+idAttr).text(),quantity:$("#Pack"+idAttr).text(),max_quantity:$("#Pack"+idAttr).text()};
  	  		}else{
  	  		if($("#flowUnder").val()=='warehouse'){
  	  	  		obj = {skuId:$("#skuId"+idAttr).val(),pluCode:$("#pluCode"+idAttr).val(),item:$("#Name"+idAttr).text(),description:$("#Desc"+idAttr).text(),uom:$("#UOM"+idAttr).text(),price:$("#Price"+idAttr).text(),cost:$("#Cost"+idAttr).text(),actualQty:$("#Received"+idAttr).text(),quantity:$("#Supplied"+idAttr).text(),indentQty:$("#Pack"+idAttr).text()};
  	  	  		}
  	  		else
  	  			obj = {skuId:$("#skuId"+idAttr).val(),pluCode:$("#pluCode"+idAttr).val(),item:$("#Name"+idAttr).text(),description:$("#Desc"+idAttr).text(),uom:$("#UOM"+idAttr).text(),price:$("#Price"+idAttr).text(),cost:$("#Cost"+idAttr).text(),recieved:$("#Received"+idAttr).text(),rejected:$("#Rejected"+idAttr).text(),issued:$("#Supplied"+idAttr).text(),quantity:$("#Pack"+idAttr).text(),max_quantity:$("#Pack"+idAttr).text()};
  	  		}
  	  		finalObj.itemDetails.push(obj);
  	}
  	return finalObj;
}
function getstockIssueSummary(id){
	
	 //purpose:for checking internet conection
	var online = window.navigator.onLine;
  	if(!online){
  	alert("check your internet connection,please try agian after some time");
  	return;
  	}
	 var location = "";
		 var warehouse = "";
		var startDate = "";
		 var endDate = "";
		  var zone = "";
		 if($("#fromlocation").length>0 && $("#fromlocation").val != "select" && $("#fromlocation").val != "-- Select --")
 		location = $("#fromlocation").val();
		 if($("#warehouseLocation").length>0 && $("#warehouseLocation").val != "select" && $("#warehouseLocation").val != "-- Select --")
			warehouse = $("#warehouseLocation").val();
		 if($("#outletZone").length>0 && $("#outletZone").val != "select" && $("#outletZone").val != "-- Select --")
	 		zone = $("#outletZone").val();
		 var operation ="";
			 if($("#operation").val() != '' && $("#operation").val().length>0)
				 operation=$("#operation").val();
			 var CurrentDate=getCurrentDate().split(" ");
			var  finalstr=CurrentDate[0];
			var dobDiff = daydiff(parseDateMMDDYYYY(finalstr), parseDate($('#from').val()));
			if(dobDiff > 0){
				alert("Start Date  can't be Future Date");
				return false;
			}
			if($("#from").val() != "" && $("#to").val() != ""){
 			var noOfDays = daydiff(parseDate($('#from').val()), parseDate($('#to').val()));
			 if(noOfDays < 0){
				 alert("Start Date can't be less than End Date");
				 return;
			 }
			 startDate = $("#from").val() + " 00:00:00";
			 endDate = $("#to").val() + " 00:00:00";
			}else if($("#from").val() != "")
			 startDate = $("#from").val() + " 00:00:00";
			else if($("#to").val() != "")
				endDate = $("#to").val() + " 00:00:00";

			var  itemwise = $("#itemwise option:selected").val();
 			var itemname = $("#itemwise option:selected").text();		
	 var contextPath = $("#contextPath").val();
	 URL = contextPath +"/inventorymanager/getstockIssueSummary.do";
	 var flowUnder = "";
	 if($("#flowUnder").length > 0)
			flowUnder = $("#flowUnder").val();
		$.ajax({
			type: "GET",
			url : URL,
			data : {
					flowUnder : flowUnder,
					location : location,
					startDate : startDate,
					endDate : endDate,
					zone : zone,
					itemwise :itemwise,
					itemname : itemname,
					warehouse : warehouse
			},
			beforeSend: function(xhr){                    
	   			$("#loading").css("display","block");
	   			$("#mainDiv").addClass("disabled");
	   		  },
			success : function(result) {
				$("#stockIssueSummary").html(result);
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
function getallProductsByCriteria(name, searchCategory, index) {
	 //purpose:for checking internet conection
	var online = window.navigator.onLine;
  	if(!online){
  	alert("check your internet connection,please try agian after some time");
  	return;
  	}
	var contextPath = $("#contextPath").val();
	storeLocation = "";
	
	URL = contextPath + "/inventorymanager/getallProductsByCriteria.do";
	$.ajax({
		type : "GET",
		url : URL,
		data : {
			index : index,
			storeLocation : storeLocation,
		},
		beforeSend : function(xhr) {
			$("#loading").css("display", "block");
			$("#mainDiv").addClass("disabled");
		},
		success : function(result) {
			appendproductsbyfilter(result,searchCategory)
			$("#loading").css("display", "none");
			$("#mainDiv").removeClass('disabled');
		},
		error : function() {
			alert("something went wrong");
			$("#loading").css("display", "none");
			$("#mainDiv").removeClass('disabled');
		}
	});

	
}
function appendproductsbyfilter(productsList,searchCategory){
	 if(productsList.length =='0'){
		alert("no products found");
	 }
	 var op = '<option value="" >ALL</option>';
	 for(var i=0;i<productsList.length;i++){
		 sku = productsList[i];
		
		 op += '<option data-tokens="'+sku.description+'" value="'+sku.skuId+'" >'+sku.description+'</option>';
		 }
		 $("#itemwise").html('');
		 $("#itemwise").html(op);
		 $("#itemwise").val($("#skuidpo").val());
	 } 

function searchProducts(name,searchCategory){
	 debugger;
	 var contextPath = $("#contextPath").val();
	 var storeLocation = "";
	 //purpose:for checking internet conection
		var online = window.navigator.onLine;
	  	if(!online)
	  	{
	  	alert("check your internet connection,please try agian after some time");
	  	return;
	  	}
	 if( $("#type").val() == "issue")
		 storeLocation = $("#fromLocation").val();
//	 else
//		 storeLocation = $("#tolocation").val();
		 var flowUnder = $("#flowUnder").val();
		 
		 var Category = $("#outletCategory").val();
		 
		 if(Category == null || Category == undefined){
			 Category = "";
		 }
		 
		 
			var subCategory = $("#outletSubcategory").val();
			
			if(subCategory == null || subCategory == undefined){
				subCategory = "";
			 }
		 
		 if(flowUnder == "warehouse"){
			 if( $("#type").val() == "issue")
				 storeLocation = $("#fromLocation").val();
			 else
			 storeLocation = "";
			 
			 if( $("#type").val() == "issue")
			 URL = contextPath + "/inventorymanager/IssuesearchWarehouseProducts.do";
			 else
				 URL = contextPath + "/inventorymanager/searchWarehouseProducts.do";	 
		 }
			
		 else	{ 
			 
			 if( $("#type").val() == "issue")
			 URL = contextPath + "/inventorymanager/IssuesearchProducts.do";
			 else
		     URL = contextPath + "/inventorymanager/searchProducts.do";
		 }
			 
	 $.ajax({
   			type: "GET",
   			url : URL,
   			data : {
   				searchName : name,
   				storeLocation : storeLocation,
   				Category : Category,
				subCategory : subCategory
   			},
   			beforeSend: function(xhr){                    
   				$("#loading").css("display","block");
   				$("#mainDiv").addClass("disabled");
   			},
   			success : function(result) {
   				appendProducts(result,searchCategory);
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
 
function appendProducts(productsList,searchCategory){
    debugger;
   
    $("."+searchCategory).html('');
    var op = '';
    for(var i=0;i<productsList.length;i++){
            
            if(productsList[i].measurementRange==null)
                    productsList[i].measurementRange="";
           if(productsList[i].color==null)
                    productsList[i].color="";                 
           if(productsList[i].size==null)
                    productsList[i].size="";
           if(productsList[i].model==null)
                   productsList[i].model="";
           if(productsList[i].price==null)
                   productsList[i].price=0;
           if(productsList[i].category==null)
                   productsList[i].category="";
           if(productsList[i].productName=="" || productsList[i].productName == null || productsList[i].productName== undefined  ){
                   
                   productsList[i].productName = "";
           }
if(productsList[i].mrp=="" || productsList[i].mrp == null || productsList[i].mrp== undefined  ){
                   
                   productsList[i].mrp = 0;
           }
           
if(productsList[i].reorderPoint=="" || productsList[i].reorderPoint == null || productsList[i].reorderPoint== undefined  ){
           
           productsList[i].reorderPoint = 0;
   }


if(productsList[i].quantity=="" || productsList[i].quantity == null || productsList[i].quantity== undefined  ){
           
           productsList[i].quantity = 0;
   }  


if(productsList[i].quantityInHand=="" || productsList[i].quantityInHand == null || productsList[i].quantityInHand== undefined  ){
           
           productsList[i].quantityInHand = productsList[i].quantity;
   }


           
            if(productsList[i].skuID == productsList[i].description){
                            if (i == 0) {
                                    op += '<li style="text-align: left;" id="'+productsList[i].skuID+'"  class="selected" onclick=getId(this,"'+searchCategory+'");><a><label style="width: 15%;">'+productsList[i].skuID+'</label>&nbsp &nbsp &nbsp <label style="width: 30%;">'+productsList[i].productName+'</label> &nbsp   <label style="width: 8%;">'+productsList[i].quantityInHand+' </label> &nbsp     <label style="width: 5%;"> '+productsList[i].mrp+'</label> &nbsp     <label style="width: 5%;"> '+productsList[i].price+'</label>     &nbsp  <label style="width: 5%;"> '+productsList[i].size+'</label>&nbsp &nbsp <label style="width: 5%;">'+productsList[i].color+'</label>&nbsp &nbsp '+productsList[i].reorderPoint+'</a></li>';
                           }else
                                    op += '<li style="text-align: left;" id="'+productsList[i].skuID+'"   onclick=getId(this,"'+searchCategory+'");><a><label style="width: 15%;">'+productsList[i].skuID+'</label>&nbsp &nbsp &nbsp <label style="width: 30%;">'+productsList[i].productName+'</label> &nbsp   <label style="width: 8%;">'+productsList[i].quantityInHand+' </label> &nbsp    <label style="width: 5%;"> '+productsList[i].mrp+'</label> &nbsp    <label style="width: 5%;"> '+productsList[i].price+'</label>    &nbsp  <label style="width: 5%;"> '+productsList[i].size+'</label>&nbsp &nbsp <label style="width: 5%;">'+productsList[i].color+'</label>&nbsp &nbsp '+productsList[i].reorderPoint+'</a></li>';
            }
            else{
                    if (i == 0) {
                            op += '<li style="text-align: left;" id="'+productsList[i].skuID+'"  class="selected" onclick=getId(this,"'+searchCategory+'");><a><label style="width: 15%;">'+productsList[i].skuID+'</label>&nbsp &nbsp &nbsp<label style="width: 30%;">'+productsList[i].productName+'</label> &nbsp   <label style="width: 8%;">'+productsList[i].quantityInHand+' </label> &nbsp     <label style="width: 5%;"> '+productsList[i].mrp+'</label> &nbsp     <label style="width: 5%;"> '+productsList[i].price+'</label>   &nbsp  <label style="width: 5%;"> '+productsList[i].size+'</label>&nbsp &nbsp <label style="width: 5%;">'+productsList[i].color+'</label>&nbsp &nbsp '+productsList[i].reorderPoint+'</a></li>';
                   }else
                            op += '<li style="text-align: left;" id="'+productsList[i].skuID+'"   onclick=getId(this,"'+searchCategory+'");><a><label style="width: 15%;">'+productsList[i].skuID+'</label>&nbsp &nbsp &nbsp <label style="width: 30%;">'+productsList[i].productName+'</label> &nbsp  <label style="width: 8%;">'+productsList[i].quantityInHand+' </label> &nbsp  <label style="width: 5%;"> '+productsList[i].mrp+'</label> &nbsp   <label style="width: 5%;"> '+productsList[i].price+'</label>    &nbsp  <label style="width: 5%;"> '+productsList[i].size+'</label>&nbsp &nbsp <label style="width: 5%;">'+productsList[i].color+'</label>&nbsp &nbsp '+productsList[i].reorderPoint+'</a></li>';
            }
    }
    $("."+searchCategory).html(op);
    $("."+searchCategory).show();
}




function getId(element,type){
	 debugger;
	var description = null;
	var id= $(element).attr("id");
	description =  $("#"+id).children("a").text();
	description = description.split(' ( ');
	description = description[0];
	$("#desc").val(description);
	if(type == "apparel")
		getItemDetails(id);
	else if(type == "receipt")
		getSkuDetails(id,description);
	else if(type == "itemname"){
		$(".itemwise").val(description);
		$("#skuidpo").val(id);
		return searchStockIssues('','','0');
		}
	 $(".services").hide();
	 $("."+type).html("");
}
function goodsTransferItemsWarehouse(transferType){
    var len = $("#productsList tr").length-1;
    //alert(transferType);
  	var finalObj = {},itemDetails = [];
  
  	finalObj.itemDetails = itemDetails;
  	for(var i=1;i<=len;i++){
  		var obj;
	  		var idAttr = $("#productsList tr:eq("+i+") td:last").attr("id").replace('Del','');
  		if(transferType=='receipt'){
  	  	  		obj = {skuId:$("#skuId"+idAttr).val(),pluCode:$("#pluCode"+idAttr).val(),item:$("#Name"+idAttr).text(),description:$("#Desc"+idAttr).text(),UOM:$("#UOM"+idAttr).text(),price:$("#Price"+idAttr).text(),cost:$("#Cost"+idAttr).text(),rejected:$("#Rejected"+idAttr).text(),actualQty:$("#Received"+idAttr).text(),quantity:$("#Supplied"+idAttr).text(),indentQty:$("#Pack"+idAttr).text()};
  	  	  		}
  	  		
  	  		finalObj.itemDetails.push(obj);
  	}
  	console.log(finalObj);
  	return finalObj;
}
	 function getSkuDetails(skuId,description){
		debugger;
	 //purpose:for checking internet conection
			var online = window.navigator.onLine;
		  	if(!online)
		  	{
		  	alert("check your internet connection,please try agian after some time");
		  	return;
		  	}
	// var materialName = $('#searchCriteria').val();
	 $("#desc").val(description);
	 var contextPath = $("#contextPath").val();
	 var storeLocation = "";
	 if( $("#type").val() == "issue")
		 storeLocation = $("#fromLocation").val();

	 var flowUnder = $("#flowUnder").val();


var WarehouseReturnflag=$("#whreturnflag").val();
                if(WarehouseReturnflag == "" || WarehouseReturnflag == undefined || WarehouseReturnflag == null){
                        WarehouseReturnflag="";
                   }




	 if(flowUnder == "warehouse"){
		 URL = contextPath + "/inventorymanager/getWarehouseSkuDetails.do";
	 }
	 else{
		 storeLocation = $("#fromLocation").val();
		 URL = contextPath + "/inventorymanager/getSkuDetails.do";
	 }
		
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
  				
  				//$('#searchCriteria').val('');
  				//$('#skuList').html('');
  				$("#loading").css("display","none");
  				$("#mainDiv").removeClass('disabled');
  				appendSkuDetails(result,flowUnder,storeLocation);
  			},
  			error : function() {
  				 alert("something went wrong");
  				$("#loading").css("display","none");
				$("#mainDiv").removeClass('disabled');
  			}
  		});
}

	 function searchGoodsRequest(name, searchCategory){
		 
		 //purpose:for checking internet conection
			var online = window.navigator.onLine;
		  	if(!online)
		  	{
		  	alert("check your internet connection,please try agian after some time");
		  	return;
		  	}
			var fromlocation = $("#fromLocation").val();
			var flowUnder = $("#flowUnder").val();
			var contextPath = $("#contextPath").val();
			URL = contextPath + "/inventorymanager/searchGoodsRequest.do";
			$.ajax({
				type: "GET",
				url : URL,
				data : {
					searchName : name,
					fromlocation : fromlocation,
					flowUnder : flowUnder
				},
				beforeSend: function(xhr){                    
					$("#loading").css("display","block");
					$("#mainDiv").addClass("disabled");
				},
				success : function(result) {
					appendGoodsRequestRefs(result, searchCategory);
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


		function appendGoodsRequestRefs(stockRequestRefList, searchCategory){
			 $("."+searchCategory).html('');
			 var op = '';
			 for(var i=0;i<stockRequestRefList.length;i++){
				 if (i == 0) {
					 op += '<li id="'+stockRequestRefList[i]+'"  class="selected" onclick=getCode(this,"'+searchCategory+'"); ><a>'+stockRequestRefList[i]+'</a></li>';
				}else
					 op += '<li id="'+stockRequestRefList[i]+'" onclick=getCode(this,"'+searchCategory+'"); ><a>'+stockRequestRefList[i]+'</a></li>';
			 }
			 $("."+searchCategory).html(op);
			 $("."+searchCategory).show();
		}


		function getCode(element,type){
			debugger
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
			 }
			 else if(type == 'searchReturn'){
				 $("#searchReturn").val(label);
				 $("#ReturnRef").val(id);
				 getGoodsReturn(id);
			 }
			 $(".services").hide();
			 $("."+type).html("");
		}

	/*	function clearTable(){
			
			$("#productsList tbody").html('');
			
		}
		*/
		
		function getGoodsRequest(requestId){
			 
			//purpose:for checking internet conection
			var online = window.navigator.onLine;
		  	if(!online)
		  	{
		  	alert("check your internet connection,please try agian after some time");
		  	return;
		  	}
			var flowUnder = $("#flowUnder").val();
			var contextPath = $("#contextPath").val();
			debugger
			//if(requestId!=""){
			
			URL = contextPath + "/inventorymanager/getGoodsRequest.do";
			$.ajax({
				type: "GET",
				url : URL,
				data : {
					requestId : requestId,
					flowUnder : flowUnder
				},
				beforeSend: function(xhr){                    
					$("#loading").css("display","block");
					$("#mainDiv").addClass("disabled");
				},
				success : function(result) {
					appendRequestedItemDetails(result);
					$("#loading").css("display","none");
					$("#mainDiv").removeClass('disabled');
				},
				error : function() {
					alert("something went wrong");
					$("#loading").css("display","none");
					$("#mainDiv").removeClass('disabled');
				}
			});
		//	}
			/*else
				{
				$("#productsList tbody").html('');
				}*/
			
		}
		
		
		$("#searchStockRequest").keydown(function(e){
			debugger
			$("#stockRequestRefError").html("");
			if($("#searchStockRequest").val().length<3){
				$("#stockRequestRef").val("");
			}
			$(".searchStockRequest").children("li").each(function(){
				debugger
				var requestRef = $(this).children("a").text().trim();
				if($("#searchStockRequest").val().trim().toLowerCase() == requestRef.toLowerCase()){
					$("#searchStockRequest").val($("#searchStockRequest").val().trim());
					$("#stockRequestRef").val($(this).attr("id"));
					 $(".services").hide();
					 $(".matchedStringUl").html("");
					return;
				}
			/*	if($("#stockRequestRef").val().trim()==""){
					//$("#searchStockRequest").val($("#searchStockRequest").val().trim());
					$("#productsList tbody").html('');
				}*/
				else{
					$("#stockRequestRef").val("");
					//$("#productsList tbody").html('');
				}
			});
			if(e.keyCode == 9){
				debugger
				if($("#searchStockRequest").val()!="" && $("#stockRequestRef").val() == ""){
					 $("#stockRequestRefError").html("Stock Request Ref. doesn't exist");
				 }
				 $(".services").hide();
				 $(".matchedStringUl").html("");
				 //$("#productsList tbody").html("");
			}
			/*if(e.keyCode == 13){
			if($("#stockRequestRef").val() == "")
				$("#productsList tbody").html("");
				}*/
		});
		
		
		$("#searchIssue").keydown(function(e){
			$("#searchIssueError").html("");
			if($("#searchIssue").val().length<3){
				$("#issueRef").val("");
			}
			$(".searchIssue").children("li").each(function(){
				var issueRef = $(this).children("a").text().trim();
				if($("#searchIssue").val().trim().toLowerCase() == issueRef.toLowerCase()){
					$("#searchIssue").val($("#searchIssue").val().trim());
					$("#issueRef").val($(this).attr("id"));
					 $(".services").hide();
					 $(".matchedStringUl").html("");
					return;
				}
				else{
					$("#issueRef").val("");
				}
			});
			if(e.keyCode == 9){
				if($("#searchIssue").val()!="" && $("#issueRef").val() == ""){
					 $("#searchIssueError").html("Issue Ref. doesn't exist");
				 }
				 $(".services").hide();
				 $(".matchedStringUl").html("");
			}
		});

		
		
		function appendRequestedItemDetails(skuList) {
			debugger
			var contextPath = $("#contextPath").val();
			for(var j=0;j<skuList.length;j++){	
				var sku = skuList[j];
				 var quantity = sku.quantity;
				 
			    // var reqQty = skuList[0].reqQty;
				 
				 if(skuList.length > 0 && skuList[0].fromLocation != undefined && skuList[0].fromLocation != null && skuList[0].fromLocation != ""){
					$("#tolocation").val(skuList[0].fromLocation);
				}
				if(skuList.length > 0 && skuList[0].deliveryDateStr != undefined && skuList[0].deliveryDateStr != null && skuList[0].deliveryDateStr != ""){
					$("#date").val(skuList[0].deliveryDateStr);
				}
				if(skuList.length > 0 && skuList[0].requestedBy != undefined && skuList[0].requestedBy != null && skuList[0].requestedBy != ""){
					$("#requested").val(skuList[0].requestedBy);
				}
				var len = parseInt($("#productsList tr").length);
				if (len != 1)
					len = parseInt($("#productsList tr:last").attr("id").replace('dynamicdiv', '')) + 1;
				
				 if(sku.trackingRequired== false){
				for (var i = 1; i <= len; i++) {
					if ($("#skuId" + i).val() == sku.skuId && $("#Price"+i).text() == sku.itemPrice) {
						var pack =  parseInt($("#Pack"+i).text())+parseFloat(quantity);
		  			 $("#Pack"+i).text(pack);
		  			 $("#Supplied"+i).text(pack);
					 $("#Received"+i).text(pack);
					 $("#Rejected"+i).text(0);
		  			 var cost =  parseFloat($("#Price"+i).text());
		  			 $("#Cost"+i).text(pack*cost);
		  			 changeTotalCost();
		  			 changeTotalQuantity();
		      		 return;
					}
				}
				 }
				var availableQty = sku.availableQty;
				if(availableQty == null)
					availableQty = "0";
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
				var ean = sku.ean;
				if(ean == null)
					sku.ean = "";
				var color = sku.color;
				if(color == null)
					sku.color = "";
				var size = sku.size;
				if(size == null)
					sku.size = "";
				 var appqty = sku.approvedQty;
				if(appqty == null)
					 appqty = 0;
				
				var appqtyItemTrack = sku.quantity;
				if(sku.trackingRequired == true)
					if(appqtyItemTrack == null)
						appqtyItemTrack = 0;
					else
						appqtyItemTrack=sku.quantity/sku.quantity;	
				
				
				var description = null;
				if (sku.itemDesc != "" && sku.itemDesc != null)
					description = sku.itemDesc;
				else
					description = $("#desc").val();
				var sell_UOM = sku.uom;
				if(sell_UOM == "" || sell_UOM == null)                      
					sell_UOM = "_";
				
				
				if(sku.trackingRequired == "" || sku.trackingRequired == null)
    				sku.trackingRequired = false;
				
				var slNo = 1; 
				 $('.slno').each(function(){
					$(this).text(slNo);
					slNo = parseInt(slNo) + 1;
				});
				 var cost = parseFloat(sku.quantity) * parseFloat(sku.itemPrice);
				 var costItemTrack = parseFloat(sku.quantity) * parseFloat(sku.itemPrice)/sku.quantity;
			
			
		         
						var packrefnum = 1;
	
			
				 if($("#flowUnder").val()=="warehouse"){
					 debugger
					
					 if(sku.trackingRequired == true){
	   		  				for(var i=0;i<sku.quantity;i++){
	   		  					
	   						 var len = parseInt($("#productsList tr").length);
	   							if (len != 1)
	   								len = parseInt($("#productsList tr:last").attr("id").replace('dynamicdiv', '')) + 1;
	   						 
	   						 var slNo = 1; 
	   						 $('.slno').each(function(){
	   							$(this).text(slNo);
	   							slNo = parseInt(slNo) + 1;
	   						});
	   		  					
						var row = "<tr id='dynamicdiv"+len+"' style='margin-top:5px;'><td class='slno'>"+slNo+"</td>" +"<td id='Name"+len+"'>"+sku.skuId+"</td>" +
						"<input type='hidden' id='skuId"+len+"' value='"+sku.skuId+"'/>" +
						"<input type='hidden' id='pluCode"+len+"' value='"+sku.pluCode+"'/>" +
						"<input type='hidden' id='category"+len+"' value='"+sku.category+"'/>" +
		    			"<input type='hidden' id='brandCode"+len+"' value='"+sku.brand+"'/>" +
		    			"<input type='hidden' id='productRange"+len+"' value='"+sku.productRange+"'/>" +
		    			"<input type='hidden' id='measureRange"+len+"' value='"+sku.measurementRange+"'/>" +
		    			"<input type='hidden' id='color"+len+"' value='"+sku.color+"'/>" +
		    			"<input type='hidden' id='size"+len+"' value='"+sku.size+"'/>" +
		    			"<input type='hidden' id='ean"+len+"' value='"+sku.ean+"'/>" +
		    			"<input type='hidden' id='utility"+len+"' value='"+sku.utility+"'/>" +
		    			"<input type='hidden' id='trackingRequired"+len+"' class='trackingRequired' value='"+sku.trackingRequired+"'/>"+
		    			"<td id='itemScanCode"+len+"' class='itemScanCode'  contenteditable='true'></td>" +
					    "<td id='itemHSNCode"+len+"' class='itemHSNCode'   ></td>" +
		    			"<td id='Desc"+len+"'>"+description+"</td><td id='UOM"+len+"'>"+ sell_UOM + "</td>" +
						"<td class='Price' id='Price"+len+"'>"+sku.itemPrice+"</td>" +
						"<td id='Pack"+len+"' class='Pack' >"+appqtyItemTrack+"</td>" +
						"<td id='Supplied"+len+"' onBlur='changeIssued(this);' onkeypress='PreventEnter(this);'>"+appqtyItemTrack+ "</td>" +
						"<td class='Received' id='Received"+len+"' onBlur='changeReceived(this);' onkeypress='PreventEnter(this);' >"+appqtyItemTrack + "</td>" +
						"<td class='packReference' id='packReference"+len+"' onBlur='changeReceived(this);' onkeypress='PreventEnter(this);' contenteditable='true'>"+packrefnum+"</td>" +

						"<td  id='availableQty"+len+"' >"+availableQty+"</td>" +
						"<td id='Cost"+len+"'>"+costItemTrack+"</td>" +
						"<td id='Del"+len+"'><img id='Img"+len+"' src='"+contextPath+"/images/itemdelete.png' style='width:15%;cursor:pointer;' onclick='deleteItem(this);' title='Delete "+sku.skuId+"'/></td></tr>";
						$("#productsList tbody").append(row);
	   		  				}
					 }
					 
					 else
						 {
						 
						 var row = "<tr id='dynamicdiv"+len+"' style='margin-top:5px;'><td class='slno'>"+slNo+"</td>" +"<td id='Name"+len+"'>"+sku.skuId+"</td>" +
							"<input type='hidden' id='skuId"+len+"' value='"+sku.skuId+"'/>" +
							"<input type='hidden' id='pluCode"+len+"' value='"+sku.pluCode+"'/>" +
							"<input type='hidden' id='category"+len+"' value='"+sku.category+"'/>" +
			    			"<input type='hidden' id='brandCode"+len+"' value='"+sku.brand+"'/>" +
			    			"<input type='hidden' id='productRange"+len+"' value='"+sku.productRange+"'/>" +
			    			"<input type='hidden' id='measureRange"+len+"' value='"+sku.measurementRange+"'/>" +
			    			"<input type='hidden' id='color"+len+"' value='"+sku.color+"'/>" +
			    			"<input type='hidden' id='size"+len+"' value='"+sku.size+"'/>" +
			    			"<input type='hidden' id='ean"+len+"' value='"+sku.ean+"'/>" +
			    			"<input type='hidden' id='trackingRequired"+len+"' class='trackingRequired' value='"+sku.trackingRequired+"'/>"+"<input type='hidden' id='utility"+len+"' value='"+sku.utility+"'/>" +
			    			"<td id='itemScanCode"+len+"' class='itemScanCode' contenteditable='true'></td>" +
						    "<td id='itemHSNCode"+len+"' class='itemHSNCode'   ></td>" +
			    			"<td id='Desc"+len+"'>"+description+"</td><td id='UOM"+len+"'>"+ sell_UOM + "</td>" +
							"<td class='Price' id='Price"+len+"'>"+sku.itemPrice+"</td>" +
							"<td id='Pack"+len+"' class='Pack' >"+appqty+"</td>" +
							"<td id='Supplied"+len+"' onBlur='changeIssued(this);' onkeypress='PreventEnter(this);' contenteditable='true'>"+ appqty + "</td>" +
							"<td class='Received' id='Received"+len+"' onBlur='changeReceived(this);' onkeypress='PreventEnter(this);' contenteditable='true'>"+ appqty + "</td>" +
							"<td class='packReference' id='packReference"+len+"' onBlur='changeReceived(this);' onkeypress='PreventEnter(this);' contenteditable='true'>"+packrefnum+"</td>" +

							"<td  id='availableQty"+len+"' >"+availableQty+"</td>" +
							"<td id='Cost"+len+"'>"+cost+"</td>" +
							"<td id='Del"+len+"'><img id='Img"+len+"' src='"+contextPath+"/images/itemdelete.png' style='width:15%;cursor:pointer;' onclick='deleteItem(this);' title='Delete "+sku.skuId+"'/></td></tr>";
							$("#productsList tbody").append(row);
						 
						 }
					 
	   		  				}else{
		   				if($("#flowType").val()=="issue"){
		   				
		   					if(sku.trackingRequired == true){
		   		  				for(var i=0;i<sku.quantity;i++){
		   		  					
		   		  				var len = parseInt($("#productsList tr").length);
	   							if (len != 1)
	   								len = parseInt($("#productsList tr:last").attr("id").replace('dynamicdiv', '')) + 1;
	   						 
	   						 var slNo = 1; 
	   						 $('.slno').each(function(){
	   							$(this).text(slNo);
	   							slNo = parseInt(slNo) + 1;
	   						});
		   		  					
							var row = "<tr id='dynamicdiv"+len+"' style='margin-top:5px;'><td class='slno'>"+slNo+"</td>" +"<td id='Name"+len+"'>"+sku.skuId+"</td>" +
			   				"<input type='hidden' id='skuId"+len+"' value='"+sku.skuId+"'/>" +
			   				"<input type='hidden' id='pluCode"+len+"' value='"+sku.pluCode+"'/>" +
			   				"<input type='hidden' id='category"+len+"' value='"+sku.category+"'/>" +
			    			"<input type='hidden' id='brandCode"+len+"' value='"+sku.brand+"'/>" +
			    			"<input type='hidden' id='productRange"+len+"' value='"+sku.productRange+"'/>" +
			    			"<input type='hidden' id='measureRange"+len+"' value='"+sku.measurementRange+"'/>" +
			    			"<input type='hidden' id='ean"+len+"' value='"+sku.ean+"'/>" +
			    			"<input type='hidden' id='utility"+len+"' value='"+sku.utility+"'/>" +
			    			"<input type='hidden' id='color"+len+"' value='"+sku.color+"'/>" +
			    			"<input type='hidden' id='size"+len+"' value='"+sku.size+"'/>" +
			    			"<input type='hidden' id='trackingRequired"+len+"' class='trackingRequired' value='"+sku.trackingRequired+"'/>"+
			    			"<td id='itemScanCode"+len+"' class='itemScanCode'  contenteditable='true'></td>" +
							    "<td id='itemHSNCode"+len+"' class='itemHSNCode'   ></td>" +
			    			"<td id='Desc"+len+"'>"+description+"</td><td id='UOM"+len+"'>"+ sell_UOM + "</td>" +
			   				"<td class='Price' id='Price"+len+"'>"+sku.itemPrice+"</td>" +
			   				"<td id='Pack"+len+"' class='Pack' onBlur='changePack(this);' onkeypress='PreventEnter(this);' >"+appqtyItemTrack+ "</td>" +
			   				
			   				"<td id='Supplied"+len+"'>"+ appqtyItemTrack+ "</td><td class='Received' id='Received"+len+"'>"+ appqtyItemTrack+ "</td>" +
			             	"<td class='packReference' id='packReference"+len+"' onBlur='changeReceived(this);' onkeypress='PreventEnter(this);' contenteditable='true'>"+packrefnum+"</td>" +
			
				             "<td  id='availableQty"+len+"' >"+availableQty+"</td>" +
			   				"<td id='Cost"+len+"'>"+costItemTrack+"</td>" +
			   				"<td id='Del"+len+"'>" +
			   				"<img id='Img"+len+"' src='"+contextPath+"/images/itemdelete.png' style='width:12%;cursor:pointer;' onclick='deleteItem(this);' title='Delete "+sku.skuId+"'/></td></tr>";
			   				$("#productsList tbody").append(row);
						}
		   					}
		   					
		   					else
		   						{
		   						var row = "<tr id='dynamicdiv"+len+"' style='margin-top:5px;'><td class='slno'>"+slNo+"</td>" +"<td id='Name"+len+"'>"+sku.skuId+"</td>" +
				   				"<input type='hidden' id='skuId"+len+"' value='"+sku.skuId+"'/>" +
				   				"<input type='hidden' id='pluCode"+len+"' value='"+sku.pluCode+"'/>" +
				   				"<input type='hidden' id='category"+len+"' value='"+sku.category+"'/>" +
				    			"<input type='hidden' id='brandCode"+len+"' value='"+sku.brand+"'/>" +
				    			"<input type='hidden' id='productRange"+len+"' value='"+sku.productRange+"'/>" +
				    			"<input type='hidden' id='measureRange"+len+"' value='"+sku.measurementRange+"'/>" +
				    			"<input type='hidden' id='ean"+len+"' value='"+sku.ean+"'/>" +
				    			"<input type='hidden' id='utility"+len+"' value='"+sku.utility+"'/>" +
				    			"<input type='hidden' id='color"+len+"' value='"+sku.color+"'/>" +
				    			"<input type='hidden' id='size"+len+"' value='"+sku.size+"'/>" +
				    			"<input type='hidden' id='trackingRequired"+len+"' class='trackingRequired' value='"+sku.trackingRequired+"'/>"+
				    			"<td id='itemScanCode"+len+"'  class='itemScanCode' contenteditable='true'></td>" +
				    			"<td id='itemHSNCode"+len+"' class='itemHSNCode'></td>" +
				    			"<td id='Desc"+len+"'><div id='overflowtext'><a href='#' data-toggle='tooltip'  title='"+description+"'>"+description+"</a></div></td>"+

/*				    			"<td id='Desc"+len+"'>"+description+"</td>" +
*/				    			"<td id='UOM"+len+"'>"+ sell_UOM + "</td>" +
				   				"<td class='Price' id='Price"+len+"'>"+sku.itemPrice+"</td>" +
				   				"<td id='Pack"+len+"' class='Pack' onBlur='changePack(this);' onkeypress='PreventEnter(this);' contenteditable='true'>"+ appqty + "</td>" +
				   				"<td id='Supplied"+len+"' contenteditable='true'>"+ appqty + "</td><td class='Received' id='Received"+len+"' contenteditable='true'>"+ appqty + "</td>" +
				   				"<td class='packReference' id='packReference"+len+"' onBlur='changeReceived(this);' onkeypress='PreventEnter(this);' contenteditable='true'>"+packrefnum+"</td>" +

					          "<td  id='availableQty"+len+"' onclick='popupskuQty("+sku.skuId+")' ><a style='text-decoration: underline;cursor: pointer;text-decoration-color: blue;'>"+availableQty+"</a></td>" +
				   				"<td id='Cost"+len+"'>"+sku.itemPrice*appqty+"</td>" +
				   				"<td id='Del"+len+"'>" +
				   				"<img id='Img"+len+"' src='"+contextPath+"/images/itemdelete.png' style='width:12%;cursor:pointer;' onclick='deleteItem(this);' title='Delete "+sku.skuId+"'/></td></tr>";
				   				$("#productsList tbody").append(row);
		   						
		   						}
		   					
		   				}
						else{
							var row = "<tr id='dynamicdiv"+len+"' style='margin-top:5px;'><td class='slno'>"+slNo+"</td>" +"<td id='Name"+len+"'>"+sku.skuId+"</td>" +
							"<input type='hidden' id='skuId"+len+"' value='"+sku.skuId+"'/>" +
							"<input type='hidden' id='pluCode"+len+"' value='"+sku.pluCode+"'/>" +
							"<input type='hidden' id='category"+len+"' value='"+sku.category+"'/>" +
			    			"<input type='hidden' id='brandCode"+len+"' value='"+sku.brand+"'/>" +
			    			"<input type='hidden' id='productRange"+len+"' value='"+sku.productRange+"'/>" +
			    			"<input type='hidden' id='measureRange"+len+"' value='"+sku.measurementRange+"'/>" +
			    			"<input type='hidden' id='ean"+len+"' value='"+sku.ean+"'/>" +
			    			"<input type='hidden' id='utility"+len+"' value='"+sku.utility+"'/>" +
			    			"<input type='hidden' id='color"+len+"' value='"+sku.color+"'/>" +
			    			"<input type='hidden' id='size"+len+"' value='"+sku.size+"'/>" +
			    			"<input type='hidden' id='trackingRequired"+len+"' class='trackingRequired' value='"+sku.trackingRequired+"'/>"+
			    			"<td id='Desc"+len+"'>"+description+"</td><td id='UOM"+len+"'>"+ sell_UOM + "</td>" +
							"<td class='Price' id='Price"+len+"'>"+sku.itemPrice+"</td>" +
							"<td id='Pack"+len+"' class='Pack' onBlur='changePack(this);' onkeypress='PreventEnter(this);' contenteditable='true' >"+quantity+"</td>" +
							"<td id='Cost"+len+"'>"+cost+"</td>" +
							"<td id='Supplied"+len+"' contenteditable='true'>"+quantity+"</td><td class='Received' id='Received"+len+"' contenteditable='true'>"+quantity+"</td>" +
							"<td id='Rejected"+len+"' onBlur='changeRejected(this);' onkeypress='PreventEnter(this);' contenteditable='true'>0</td><td id='Del"+len+"'>" +
							"<img id='Img"+len+"' src='"+contextPath+"/images/itemdelete.png' style='width:12%;cursor:pointer;' onclick='deleteItem(this);' title='Delete "+sku.skuId+"'/></td></tr>";
							$("#productsList tbody").append(row);
						}
				
		   				
			}
			}
			changeTotalCost();
			changeTotalQuantity();
		}
		
		
		function searchGoodsIssue(name, searchCategory){
			 //purpose:for checking internet conection
			var online = window.navigator.onLine;
		  	if(!online)
		  	{
		  	alert("check your internet connection,please try agian after some time");
		  	return;
		  	}
			
			var issueToLocation = $("#fromLocation").val();
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
					 op += '<li id="'+issueRefList[i]+'"  class="selected" onclick=getCode(this,"'+searchCategory+'"); ><a>'+issueRefList[i]+'</a></li>';
				}else
					 op += '<li id="'+issueRefList[i]+'" onclick=getCode(this,"'+searchCategory+'"); ><a>'+issueRefList[i]+'</a></li>';
			 }
			 $("."+searchCategory).html(op);
			 $("."+searchCategory).show();
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
				var quantity = sku.quantity;
				if(skuList[0].stockRequestId != undefined && skuList[0].stockRequestId != null && skuList[0].stockRequestId != "")
					$("#stockreqref").val(skuList[0].stockRequestId);
				if(skuList.length > 0 && skuList[0].fromLocation != undefined && skuList[0].fromLocation != null && skuList[0].fromLocation != "")
					$("#fromLocation").val(skuList[0].fromLocation);
				if(skuList.length > 0 && skuList[0].deliveryDateStr != undefined && skuList[0].deliveryDateStr != null && skuList[0].deliveryDateStr != "")
					$("#date").val(skuList[0].deliveryDateStr);
				if(skuList.length > 0 && skuList[0].deliveredBy != undefined && skuList[0].deliveredBy != null && skuList[0].deliveredBy != "")
					$("#delivered").val(skuList[0].deliveredBy);
				if(skuList.length > 0 && skuList[0].inspectedBy != undefined && skuList[0].inspectedBy != null && skuList[0].inspectedBy != "")
					$("#inspected").val(skuList[0].inspectedBy);
				if(skuList.length > 0 && skuList[0].receivedBy != undefined && skuList[0].receivedBy != null && skuList[0].receivedBy != "")
					$("#received").val(skuList[0].receivedBy);
			
				var len = parseInt($("#productsList tr").length);
				if (len != 1)
					len = parseInt($("#productsList tr:last").attr("id").replace('dynamicdiv', '')) + 1;
				if(sku.trackingRequired== false){
				for (var i = 1; i <= len; i++) {
					if ($("#skuId" + i).val() == sku.skuId && $("#Price"+i).text() == sku.price) {
						var pack =  parseInt($("#Pack"+i).text())+parseInt(quantity);
		  			 $("#Pack"+i).text(pack);
		  			 $("#Supplied"+i).text(pack);
					 $("#Received"+i).text(pack);
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
				var ean = sku.ean;
				if(ean == null)
					sku.ean = "";
				var color = sku.color;
				if(color == null)
					sku.color = "";
				var size = sku.size;
				if(size == null)
					sku.size = "";
				var sell_UOM = sku.uom;
				if(sell_UOM == "" || sell_UOM == null)                      
					sell_UOM = "";
				
				
				
				
				if(sku.trackingRequired == "" || sku.trackingRequired == null)
    				sku.trackingRequired = false;
				
				var slNo = 1; 
				 $('.slno').each(function(){
					$(this).text(slNo);
					slNo = parseInt(slNo) + 1;
				});
				 var cost = parseFloat(quantity) * parseFloat(sku.price);
				 
				 var costItemTrack = parseFloat(quantity) * parseFloat(sku.price)/quantity;
				 
				 debugger
				 
				 if(sku.trackingRequired == true){
		  				for(var i=0;i<sku.quantity;i++){
				 
		  					var len = parseInt($("#productsList tr").length);
		  					if (len != 1)
		  						len = parseInt($("#productsList tr:last").attr("id").replace('dynamicdiv', '')) + 1;
		  					var slNo = 1; 
		  					 $('.slno').each(function(){
		  						$(this).text(slNo);
		  						slNo = parseInt(slNo) + 1;
		  					});	
		  					
		  					debugger; 
		  					 if(sku.itemScanCode == null){
		  						sku.itemScanCode ="";
		  					 }
		  					
				var row = "<tr id='dynamicdiv"+len+"' style='margin-top:5px;'><td class='slno'>"+slNo+"</td>" +"<td id='Name"+len+"'>"+sku.skuId+"</td>" +
				"<input type='hidden' id='skuId"+len+"' value='"+sku.skuId+"'/>" +
				"<input type='hidden' id='pluCode"+len+"' value='"+sku.pluCode+"'/>" +
				"<input type='hidden' id='category"+len+"' value='"+sku.category+"'/>" +
    			"<input type='hidden' id='brandCode"+len+"' value='"+sku.brand+"'/>" +
    			"<input type='hidden' id='productRange"+len+"' value='"+sku.productRange+"'/>" +
    			"<input type='hidden' id='measureRange"+len+"' value='"+sku.measurementRange+"'/>" +
    			"<input type='hidden' id='color"+len+"' value='"+sku.color+"'/>" +
    			"<input type='hidden' id='size"+len+"' value='"+sku.size+"'/>" +
    			"<input type='hidden' id='ean"+len+"' value='"+sku.ean+"'/>" +
    			"<input type='hidden' id='utility"+len+"' value='"+sku.utility+"'/>" +
    			"<input type='hidden' id='trackingRequired"+len+"' class='trackingRequired' value='"+sku.trackingRequired+"'/>"+
    			"<td id='itemScanCode"+len+"' class='itemScanCode'  contenteditable='true'>"+sku.itemScanCode+"</td>" +
    			"<td id='Desc"+len+"'>"+description+"</td><td id='UOM"+len+"'>"+ sell_UOM + "</td>" +
				"<td class='Price' id='Price"+len+"'>"+sku.price+"</td>" +
				"<td id='Pack"+len+"' class='Pack' onBlur='changePack(this);' onkeypress='PreventEnter(this);'>"+quantity/quantity+"</td>" +
				"<td id='Cost"+len+"'>"+costItemTrack+"</td>" +
				"<td id='Supplied"+len+"' onBlur='changeSuppliedPack(this);' onkeypress='PreventEnter(this);'>"+quantity/quantity+"</td>" +
				"<td id='weighted"+len+"'  onkeypress='PreventEnter(this);' >1</td>" +
				"<td class='Received' onBlur='changeReceivedPack(this);' onkeypress='PreventEnter(this);' id='Received"+len+"'>"+quantity/quantity+"</td>" +
				"<td id='Rejected"+len+"' onBlur='changeRejected(this);' onkeypress='PreventEnter(this);' contenteditable='true'>0</td><td id='Del"+len+"'>" +
				"<img id='Img"+len+"' src='"+contextPath+"/images/itemdelete.png' style='width:20px;cursor:pointer;' onclick='deleteItem(this);' title='Delete "+sku.skuId+"'/></td></tr>";
				$("#productsList tbody").append(row);
				
		  				}
				 }
				 else
					 {
					 debugger; 
  					 if(sku.itemScanCode == null){
  						sku.itemScanCode ="";
  					 }
					 
					 var row = "<tr id='dynamicdiv"+len+"' style='margin-top:5px;'><td class='slno'>"+slNo+"</td>" +"<td id='Name"+len+"'>"+sku.skuId+"</td>" +
						"<input type='hidden' id='skuId"+len+"' value='"+sku.skuId+"'/>" +
						"<input type='hidden' id='pluCode"+len+"' value='"+sku.pluCode+"'/>" +
						"<input type='hidden' id='category"+len+"' value='"+sku.category+"'/>" +
		    			"<input type='hidden' id='brandCode"+len+"' value='"+sku.brand+"'/>" +
		    			"<input type='hidden' id='productRange"+len+"' value='"+sku.productRange+"'/>" +
		    			"<input type='hidden' id='measureRange"+len+"' value='"+sku.measurementRange+"'/>" +
		    			"<input type='hidden' id='color"+len+"' value='"+sku.color+"'/>" +
		    			"<input type='hidden' id='size"+len+"' value='"+sku.size+"'/>" +
		    			"<input type='hidden' id='ean"+len+"' value='"+sku.ean+"'/>" +
		    			"<input type='hidden' id='utility"+len+"' value='"+sku.utility+"'/>" +
		    			"<input type='hidden' id='trackingRequired"+len+"' class='trackingRequired' value='"+sku.trackingRequired+"'/>"+
		    			"<td id='itemScanCode"+len+"' class='itemScanCode'  contenteditable='true' >"+sku.itemScanCode+"</td>" +
		    			"<td id='Desc"+len+"'><div id='overflowtext'><a href='#' data-toggle='tooltip'  title='"+description+"'>"+description+"</a></div></td>"+
		    			"<td id='UOM"+len+"'>"+ sell_UOM + "</td>" +
						"<td class='Price' id='Price"+len+"'>"+sku.price+"</td>" +
						"<td id='Pack"+len+"' class='Pack' onBlur='changePack(this);' onkeypress='PreventEnter(this);' contenteditable='true'>"+quantity+"</td>" +
						"<td id='Cost"+len+"'>"+cost+"</td>" +
						"<td id='Supplied"+len+"' onBlur='changeSuppliedPack(this);' onkeypress='PreventEnter(this);' contenteditable='true' >"+quantity+"</td>" +
						"<td id='weighted"+len+"'  onkeypress='PreventEnter(this);' contenteditable='true'>1</td>" +
						"<td class='Received' onBlur='changeReceivedPack(this);' onkeypress='PreventEnter(this);' id='Received"+len+"'>"+quantity+"</td>" +
						"<td id='Rejected"+len+"' onBlur='changeRejected(this);' onkeypress='PreventEnter(this);' contenteditable='true'>0</td><td id='Del"+len+"'>" +
						"<img id='Img"+len+"' src='"+contextPath+"/images/itemdelete.png' style='width:20px;cursor:pointer;' onclick='deleteItem(this);' title='Delete "+sku.skuId+"'/></td></tr>";
						$("#productsList tbody").append(row);

					 }

			}
			changeTotalCost();
			changeTotalQuantity();
		}
		

		
		
		
		
		
		function issuetooutlets(id,flag){
			
			 //purpose:for checking internet conection
			var online = window.navigator.onLine;
		  	if(!online)
		  	{
		  	alert("check your internet connection,please try agian after some time");
		  	return;
		  	}
			 var selected = "";
			 if(flag=='true')
				 {
				 var selectedLabel = 'Please Select Atleast One Issue to Close the Corresponding Indents';
				 	var name=$('#deleteActionLabel').val();
			   		var atLeastOneIsChecked = $('input[name="selectall"]:checked').length > 0;
			   		var selectedLength = $('input[name="selectall"]:checked').length;
			   		var selectedID = $("#selectall").length;
			   		if(selectedLength == 1 && selectedID == 0)
			   			atLeastOneIsChecked = false;
			   		var yes = false;
			   		if(!atLeastOneIsChecked){
			   			alert(selectedLabel+" ");
			   			return false;
			   		}
			   		else{
			   			var selectedLength = $('input[name="selectall"]:checked');
			   		    $(selectedLength).each(function(){
			   		    	if($(this).attr("onClick") != "selectAll(this)")
			   		    		selected += $(this).val()+",";
			   		    	//selected += $(this).val().replace(/\//g, '')+",";
			   			});
			   			selected = selected.slice(0,-1);// Remove last comma
			  
			   			yes = confirm("Are you sure, you want to Close "+selected+"   Indents");
			   		}
				 }
			
			 var contextPath = $("#contextPath").val();
			 URL = contextPath +"/inventorymanager/issueToOutlets.do";
			 var flowUnder = "";
			 if($("#warehouseLocation").length > 0)
					flowUnder = $("#warehouseLocation").val();
				$.ajax({
					type: "GET",
					url : URL,
					data : {
						flowUnder : flowUnder,
						flag : flag,
						ids : selected
					},
					beforeSend: function(xhr){                    
			   			$("#loading").css("display","block");
			   			$("#mainDiv").addClass("disabled");
			   		  },
					success : function(result) {
						$("#po").html(result);
						var  op = '<a id="summaryTag1"  data-toggle="modal" data-target="#myModalIos"></a>';
						 $("#triggerEvent").append(op);
						 $("#summaryTag1" ).trigger( "click" );
						 $("#triggerEvent").html("");
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
 function saveallStockIssue(ele) {
	 
	 //purpose:for checking internet conection
		var online = window.navigator.onLine;
	  	if(!online)
	  	{
	  	alert("check your internet connection,please try agian after some time");
	  	return;
	  	}
		 		$('.saveall').each(function(){
		 			 var stockissueobj = {},stockReqobj = {},itemDetails=[], skuId = [], Qty = [],issued = [];
		 			var srid= $(this).attr("id");
		 	 		skuId.push($("#itemwise").val());
		 	 		Qty.push($("#actualQty"+srid).text());
		 	 		issued.push($("#Issued"+srid).text());
		 	 		 stockissueobj.issuedqty = issued;
	        		 stockissueobj.qty = Qty;
	        		 stockissueobj.skuId = skuId;
	        		 stockissueobj.goods_issue_ref_num = srid;
	        		 stockissueobj.reciptDetails=itemDetails;
	        		 stockissueobj.flowUnder = $("#flowUnder").val();
	        		 	 var formData = JSON.stringify(stockissueobj);
	        		 	 console.log(formData)
	        			 var contextPath = $("#contextPath").val();
	        				URL = contextPath + "/inventorymanager/saveStockIssue.do";
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
	        	       			    $("#fromlocation").val(location);
	        	       				$("#loading").css("display","none");
	        	       				$("#mainDiv").removeClass('disabled');
	        	       			},
	        	       			error : function() {
	        	       				 alert("something went wrong");
	        	       				$("#loading").css("display","none");
	        	     				$("#mainDiv").removeClass('disabled');
	        	       			}
	        	       		});
		 		});
		 return searchStockIssues('','','0');
			 
}
		
		


//added by Surya.k
 function addIssueSkuExcelItem(skuList){
 	debugger;
 		 for(var i=0;i<skuList.length;i++){
 			 var sku =skuList[i];
 		 
 		 var contextPath = $("#contextPath").val();
 		 var len = parseInt($("#productsList tr").length);
 		// alert("table"+len)add
 		 //debugger
 			if (len != 1)
 				len = parseInt($("#productsList tr:last").attr("id").replace('dynamicdiv', '')) + 1;
 			for (var i = 1; i <=len; i++) {
 				if ($("#skuId" + i).val() == sku.skuId  && $("#itemPrice"+i).text() == sku.costPrice && $("#ean"+i).text() == sku.ean && $("#size"+i).text() == sku.size && $("#color"+i).text() == sku.color && $("#productRange"+i).val() == sku.productRange && $("#measureRange"+i).val() == sku.measureRange) {
 					var pack =  parseInt($("#quantity"+i).text())+sku.quantity;
 	    			 $("#quantity"+i).text(pack);
 	    			 var cost =  parseFloat($("#itemPrice"+i).text());
 	    			 $("#totalCost"+i).text(pack*cost);
 	    			 changeTotalOrderCost();
 	        		 return;
 				}
 			}
 			var description = null;
 			if (sku.description != "" && sku.description != null)
 				description = sku.description;
 			else
 				description = "";
 			
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
 			var color = sku.color;
 			if(color == null)
 				sku.color = "";
 			var ean = sku.ean;
 			if(ean == null)
 				sku.ean = "";
 			
 			var utility = sku.utility;
 			if(utility == null)
 				sku.utility = "";

 			var size = sku.size;
 			if(size == null)
 				sku.size = "";
 			
 		
 		      
 		    var reqquantity = sku.reqQuantity;
 		      if(reqquantity == null)
 		    	  reqquantity = 1;
 			
 		      var quantity = sku.quantity;
 		      if(quantity == null)
 		    	  quantity = 1;
 		      
 		      var actlquantity = sku.actuvalQuantity;
 		      if(actlquantity == null)
 		    	  actlquantity = 1;
 		      
 		      
 		      var hsnCode = sku.hsnCode;
 				if(hsnCode == null)
 					sku.hsnCode = "";
 		      
 					  var itemScanCode = sku.itemScanCode;
 	 				if(itemScanCode == null)
 	 					sku.itemScanCode = "";
 					
 					
 			var make = sku.uom;
 			if(make == "" || make == null)
 				make = "";
 			var model = sku.availableQty;
 			if(model == null)
 				model = "0";
 			var color = sku.color;
 			if(color == "" || color == null)
 				color = "";
 			var size = sku.size;
 			if(size == "" || size == null)
 				size = "";
 			var slNo = 1; 
 			 $('.slno').each(function(){
 				$(this).text(slNo);
 				slNo = parseInt(slNo) + 1;
 			});
 			 
 			 
 			
 			var row = "<tr id='dynamicdiv"+len+"' style='margin-top:5px;'><td class='slno'>"+slNo+"</td>" +
 					"<td id='itemId"+len+"'>"+sku.skuId+"</td>" +
 			"<td id='scanCode"+len+"'>"+sku.itemScanCode+"</td>" +	
 			"<td id='hsnCode"+len+"'>"+sku.hsnCode+"</td>" +
 	 		"<input type='hidden' id='skuId"+len+"' value='"+sku.skuId+"'/>" +
 	 		"<input type='hidden' id='eanExcel"+len+"' value='"+sku.ean+"'/>" +
 	 		"<input type='hidden' id='pluCode"+len+"' value='"+sku.pluCode+"'/>" +
 	 		"<input type='hidden' id='category"+len+"' value='"+sku.category+"'/>" +
 			"<input type='hidden' id='brandCode"+len+"' value='"+sku.brandCode+"'/>" +
 			"<input type='hidden' id='productRange"+len+"' value='"+sku.productRange+"'/>" +
 			"<input type='hidden' id='measureRange"+len+"' value='"+sku.measureRange+"'/>" +
 			"<input type='hidden' id='utility"+len+"' value='"+sku.utility+"'/>" +
 			/*"<input type='hidden' id='colour"+len+"' value='"+sku.color+"'/>" +
 			"<input type='hidden' id='sizeExcel"+len+"' value='"+sku.size+"'/>" +*/
 			"<input type='hidden' id='productRange"+len+"' value='"+sku.productRange+"'/>" +
 			"<input type='hidden' id='measureRange"+len+"' value='"+sku.measureRange+"'/>" +
 			
 	 		"<td id='itemDesc"+len+"' style='width:300px!important;'>"+description+"</td>" +
 	 		"<td id='make"+len+"'>"+make+"</td>"+
 	 		"<td class='Price' id='Price"+len+"'>"+parseFloat(sku.price).toFixed(2)+"</td>" +
 	 		"<td id='Pack"+len+"' class='Pack' onBlur='changePack(this);' onkeypress='PreventEnter(this);' contenteditable='true'>"+reqquantity+"</td>" +
 				"<td id='Supplied"+len+"' onBlur='changeIssued(this)' contenteditable='true'>"+quantity+"</td>"+
 				"<td class='Received' id='Received"+len+"' contenteditable='true'>"+actlquantity+"</td>" +
 				"<td  id='availableQty"+len+"' >"+sku.quantityInHand+"</td>" +
 				
 	 		"<td class='cost' id='Cost"+len+"'>"+(parseFloat(sku.price)* sku.quantity).toFixed(2)+"</td>" +
 	 		"<td id='Del"+ len +"' ><img id='Img"+ len +"' src='"+contextPath+"/images/itemdelete.png' style='width:12%;cursor:pointer;' onclick='deleteItemDetails(this);' title='Delete "+sku.skuId+"'/></td>" +
 	 		"</tr>";
 			$("#productsList tbody").append(row);
 			changeTotalCost();
 			changeTotalQuantity();
 		 }
 	}


 function clearTableData(){
 	 $("#productsList tbody").html('');
 	 $("#Error").html("");
 	 changeTotalCost();
 	changeTotalQuantity();
 	 productFiles = [];
 	 $("#fileUploadCSV").val('');
 }




function totalCost(){
	var totalCost=0.0;
	$('.quantity').each(function(){
	  var rowNo = $(this).attr("id").replace('quantity','');
	  var cost = $("#itemPrice"+rowNo).html();
	  var received = $('#quantity'+rowNo).html();
	  totalCost = parseFloat(cost)*parseFloat(received)+totalCost;
	  
	  $("#Pack"+rowNo).attr('contenteditable', 'false')
	  
	 });
	$('#totalCost').val(totalCost);
	
}

function totalQuantity(){
	var totalQty=0;
	$('.quantity').each(function(){
	  var rowNo = $(this).attr("id").replace('quantity','');
	  var qty = $("#quantity"+rowNo).html();
	  totalQty = parseFloat(qty)+totalQty;
	 });
	$('#totalQty').val(totalQty);
	
}



function getStockIssuePDF(refId){

	debugger
	var online = window.navigator.onLine;
	if(!online)
	{
	alert("check your internet connection,please try agian after some time");
	return;
	}
	
	var contextPath = $('#contextPath').val();
	var URL = contextPath + "/userAccessControl/getStockIssuePDF.do";
		
		
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

function getLocationChanges(flow){
	
	debugger
	var online = window.navigator.onLine;
	if(!online)
	{
	alert("check your internet connection,please try agian after some time");
	return;
	}
	
	if(flow=="receipt")
	var tolocation = $('#fromLocation').val();
	else
    var tolocation = $('#tolocation').val();
		
	var contextPath = $('#contextPath').val();
	var URL = contextPath + "/inventorymanager/getOutletDetails.do";
	
	
	$.ajax({
		
		url : URL,
		data : {
			tolocation:tolocation,			
		},
		beforeSend: function(xhr){                    
			$("#loading").css("display","block");
			$("#mainDiv").addClass("disabled");
		},
		success : function(result){
			appendCompanyType(result,flow);
			$("#loading").css("display","none");
			$("#mainDiv").removeClass('disabled');
		},
		error : function(e){
			console.log(JSON.stringify(e));
			$("#loading").css("display","none");
			$("#mainDiv").removeClass('disabled');
		}
	});
} 

function appendCompanyType(list,flow){
	 $('#companyType').val("");
	 
	 
	 if(list != null && list != ""){
	 $('#companyType').val(list[0].companyOwned);
	 
	 if(list[0].companyOwned == "franchise" || list[0].companyOwned == "Franchise"){
	 $('#franchiseBlink').css("display","block");
	 }else{
		 $('#franchiseBlink').css("display","none");
	 }
	 }
	 
}


function popupskuQty(sku){
	  
	  debugger;
	  try{  
	  skuid = sku;
	  var LocationType = "";
	  var storeLocation = $("#fromLocation").val();
	  var issue = $("#pageType").val();
	  
	  if(issue == undefined || issue == null || issue == ""){
		  issue = false; 
	  }else{
		  issue = true;
	  }
	  
	 
		
	var contextPath = $("#contextPath").val();

	var online = window.navigator.onLine;
	if(!online){
	alert("Check your internet connection,Please try agian after some time.");
	return;
	}

URL = contextPath + "/inventorymanager/skuSuppliers.do";
	 
	$.ajax({
		type: "GET",
		url : URL,
		data : {
			skuid : skuid,
			LocationType:LocationType,
			storeLocation:storeLocation,
			issue : issue
		},
		beforeSend: function(xhr){                    
   			$("#loading").css("display","block");
   			$("#mainDiv").addClass("disabled");
   		  },
		success : function(result) {
		    appendSupplierslist(result);
			/*$("#supplierdata").text(result);*/
			// $('#Popupitems').modal('show'); 
			$('#locationqty').modal('show');
			
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

function  appendSupplierslist(suppliersResponce){
	debugger;
	 var op = ''; 
	 $("#location5").html("");
	 var tolocation = $("#tolocation").val();
	 if(tolocation == undefined || tolocation == null){
		 tolocation = ""; 
	 }
if(suppliersResponce.skulist != null){
	 var hashLength=Object.keys(suppliersResponce.skulist).length;
	 var loc = '';
	 var Total=0;
	
	 if(hashLength != "" && hashLength != null && hashLength != undefined && hashLength>0){
		 for (var i = 0, keys = Object.keys(suppliersResponce.skulist), ii = keys.length; i < ii; i++) {
			if(keys[i] == tolocation){
			 loc +='<label style="width:49%;background: lightgreen;" >'+keys[i]+'<span style="text-align:right;float: right;">&nbsp &nbsp : &nbsp &nbsp<span></label><label style="width:49%;padding-left: 5px;background: lightgreen;">'+suppliersResponce.skulist[keys[i]]+'</label>';
			}else{
		     loc +='<label style="width:49%" >'+keys[i]+'<span style="text-align:right;float: right;">&nbsp &nbsp : &nbsp &nbsp<span></label><label style="width:49%;padding-left: 5px;">'+suppliersResponce.skulist[keys[i]]+'</label>';
			}
			
			
			Total+=suppliersResponce.skulist[keys[i]];
			 // console.log('key : ' + keys[i] + ' val : ' + suppliersResponce.skulist[keys[i]]);
			}
		 $("#location5").html(loc);
		 $("#location5").show();
		 $("#QtyTotalValueId").text(Total);
	 }
}else{
	 $("#QtyTotalValueId").text("");
}
	
}


function searchGoodsReturn(name, searchCategory){
	debugger;
	 //purpose:for checking internet conection
	var online = window.navigator.onLine;
  	if(!online)
  	{
  	alert("check your internet connection,please try agian after some time");
  	return;
  	}
	
	var returnToLocation = $("#fromLocation").val();
	var contextPath = $("#contextPath").val();
	URL = contextPath + "/inventorymanager/searchGoodsReturn.do";
	$.ajax({
		type: "GET",
		url : URL,
		data : {
			searchName : name,
			returnToLocation : returnToLocation
		},
		beforeSend: function(xhr){                    
			$("#loading").css("display","block");
			$("#mainDiv").addClass("disabled");
		},
		success : function(result) {
			appendGoodsReturnRefs(result, searchCategory);
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


function appendGoodsReturnRefs(ReturnRefList, searchCategory){
	 $("."+searchCategory).html('');
	 var op = '';
	 for(var i=0;i<ReturnRefList.length;i++){
		 if (i == 0) {
			 op += '<li id="'+ReturnRefList[i]+'"  class="selected" onclick=getCode(this,"'+searchCategory+'"); ><a>'+ReturnRefList[i]+'</a></li>';
		}else
			 op += '<li id="'+ReturnRefList[i]+'" onclick=getCode(this,"'+searchCategory+'"); ><a>'+ReturnRefList[i]+'</a></li>';
	 }
	 $("."+searchCategory).html(op);
	 $("."+searchCategory).show();
}

function getGoodsReturn(retrunNoteRef){
	debugger;
	
	 var contextPath = $("#contextPath").val();
	 var flowUnder = "";
		if($("#flowUnder").length > 0)
			flowUnder = $("#flowUnder").val();
		var location = $("#formLocation").val();
		
		//added by manasa
		 var formData={}
		 formData.zone = $("#outletZone").val();
		 formData.fromLocation = $("#outletLocation").val();
		 formData.startDate = $("#from").val();
		 formData.endDate = $("#to").val();
		 var formData = JSON.stringify(formData);
	
	 //purpose:for checking internet conection
	var online = window.navigator.onLine;
  	if(!online)
  	{
  	alert("check your internet connection,please try agian after some time");
  	return;
  	}
	var contextPath = $("#contextPath").val();
	URL = contextPath + "/inventorymanager/getGoodsReturn.do";
	$.ajax({
		type: "GET",
		url : URL,
		data : {
			retrunNoteRef : retrunNoteRef,
			flowUnder : flowUnder,
			formData : formData
		},
		beforeSend: function(xhr){                    
			$("#loading").css("display","block");
			$("#mainDiv").addClass("disabled");
		},
		success : function(result) {
			appendReturnedItemDetails(result);
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

function appendReturnedItemDetails(skuList) {
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
		var quantity = sku.quantity;
		
		if(skuList.length > 0 && skuList[0].fromLocation != undefined && skuList[0].fromLocation != null && skuList[0].fromLocation != "")
			$("#fromLocation").val(skuList[0].fromLocation);
		/*if(skuList.length > 0 && skuList[0].deliveryDateStr != undefined && skuList[0].deliveryDateStr != null && skuList[0].deliveryDateStr != "")
			$("#date").val(skuList[0].deliveryDateStr);*/
		if(skuList.length > 0 && skuList[0].returnBy != undefined && skuList[0].returnBy != null && skuList[0].returnBy != "")
			$("#delivered").val(skuList[0].returnBy);
		if(skuList.length > 0 && skuList[0].shippedBy != undefined && skuList[0].shippedBy != null && skuList[0].shippedBy != "")
			$("#received").val(skuList[0].shippedBy);
		
	
		var len = parseInt($("#productsList tr").length);
		if (len != 1)
			len = parseInt($("#productsList tr:last").attr("id").replace('dynamicdiv', '')) + 1;
		if(sku.trackingRequired== false){
		for (var i = 1; i <= len; i++) {
			if ($("#skuId" + i).val() == sku.skuId && $("#Price"+i).text() == sku.price) {
				var pack =  parseInt($("#Pack"+i).text())+parseInt(quantity);
  			 $("#Pack"+i).text(pack);
  			 $("#Supplied"+i).text(pack);
			 $("#Received"+i).text(pack);
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
		if(brandCode == null ||brandCode == undefined)
			sku.brandCode = "";
		var category = sku.category;
		if(category == null ||category == undefined)
			sku.category = "";
		var productRange = sku.productRange;
		if(productRange == null || productRange == undefined)
			sku.productRange = "";
		var measureRange = sku.measureRange;
		if(measureRange == null ||  measureRange == undefined )
			sku.measureRange = "";
		var utility = sku.utility;
		if(utility == null ||  utility == undefined )
			sku.utility = "";
		var ean = sku.ean;
		if(ean == null ||  ean == undefined)
			sku.ean = "";
		var color = sku.color;
		if(color == null ||  ean == undefined )
			sku.color = "";
		var size = sku.size;
		if(size == null ||  size == undefined )
			sku.size = "";
		var sell_UOM = sku.uOM;
		if(sell_UOM == "" || sell_UOM == null ||  sell_UOM == undefined )                      
			sell_UOM = "";
		
		
		
		
		if(sku.trackingRequired == "" || sku.trackingRequired == null  ||  sku.trackingRequired == undefined)
			sku.trackingRequired = false;
		
		var slNo = 1; 
		 $('.slno').each(function(){
			$(this).text(slNo);
			slNo = parseInt(slNo) + 1;
		});
		 var cost = parseFloat(quantity) * parseFloat(sku.price);
		 
		 var costItemTrack = parseFloat(quantity) * parseFloat(sku.price)/quantity;
		 
		 debugger
		 
		 if(sku.trackingRequired == true){
  				for(var i=0;i<sku.quantity;i++){
		 
  					var len = parseInt($("#productsList tr").length);
  					if (len != 1)
  						len = parseInt($("#productsList tr:last").attr("id").replace('dynamicdiv', '')) + 1;
  					var slNo = 1; 
  					 $('.slno').each(function(){
  						$(this).text(slNo);
  						slNo = parseInt(slNo) + 1;
  					});	
  					
  					debugger; 
  					 if(sku.itemScanCode == null){
  						sku.itemScanCode ="";
  					 }
  					
		var row = "<tr id='dynamicdiv"+len+"' style='margin-top:5px;'><td class='slno'>"+slNo+"</td>" +"<td id='Name"+len+"'>"+sku.itemId+"</td>" +
		"<input type='hidden' id='skuId"+len+"' value='"+sku.itemId+"'/>" +
		"<input type='hidden' id='pluCode"+len+"' value='"+sku.pluCode+"'/>" +
		"<input type='hidden' id='category"+len+"' value='"+sku.category+"'/>" +
		"<input type='hidden' id='brandCode"+len+"' value='"+sku.brand+"'/>" +
		"<input type='hidden' id='productRange"+len+"' value='"+sku.productRange+"'/>" +
		"<input type='hidden' id='measureRange"+len+"' value='"+sku.measurementRange+"'/>" +
		"<input type='hidden' id='color"+len+"' value='"+sku.color+"'/>" +
		"<input type='hidden' id='size"+len+"' value='"+sku.size+"'/>" +
		"<input type='hidden' id='ean"+len+"' value='"+sku.ean+"'/>" +
		"<input type='hidden' id='utility"+len+"' value='"+sku.utility+"'/>" +
		"<input type='hidden' id='trackingRequired"+len+"' class='trackingRequired' value='"+sku.trackingRequired+"'/>"+
		"<td id='itemScanCode"+len+"' class='itemScanCode'  contenteditable='true'>"+sku.itemScanCode+"</td>" +
		"<td id='Desc"+len+"'>"+description+"</td><td id='UOM"+len+"'>"+ sell_UOM + "</td>" +
		"<td class='Price' id='Price"+len+"'>"+sku.price+"</td>" +
		"<td id='Pack"+len+"' class='Pack' onBlur='changePack(this);' onkeypress='PreventEnter(this);'>"+quantity/quantity+"</td>" +
		"<td id='Cost"+len+"'>"+costItemTrack+"</td>" +
		"<td id='Supplied"+len+"' onBlur='changeSuppliedPack(this);' onkeypress='PreventEnter(this);'>"+quantity/quantity+"</td>" +
		"<td id='weighted"+len+"'  onkeypress='PreventEnter(this);' >1</td>" +
		"<td class='Received' onBlur='changeReceivedPack(this);' onkeypress='PreventEnter(this);' id='Received"+len+"'>"+quantity/quantity+"</td>" +
		"<td id='Rejected"+len+"' onBlur='changeRejected(this);' onkeypress='PreventEnter(this);' contenteditable='true'>0</td><td id='Del"+len+"'>" +
		"<img id='Img"+len+"' src='"+contextPath+"/images/itemdelete.png' style='width:20px;cursor:pointer;' onclick='deleteItem(this);' title='Delete "+sku.itemId+"'/></td></tr>";
		$("#productsList tbody").append(row);
		
  				}
		 }
		 else
			 {
			 debugger; 
				 if(sku.itemScanCode == null){
					sku.itemScanCode ="";
				 }
			 
			 var row = "<tr id='dynamicdiv"+len+"' style='margin-top:5px;'><td class='slno'>"+slNo+"</td>" +"<td id='Name"+len+"'>"+sku.itemId+"</td>" +
				"<input type='hidden' id='skuId"+len+"' value='"+sku.itemId+"'/>" +
				"<input type='hidden' id='pluCode"+len+"' value='"+sku.pluCode+"'/>" +
				"<input type='hidden' id='category"+len+"' value='"+sku.category+"'/>" +
    			"<input type='hidden' id='brandCode"+len+"' value='"+sku.brand+"'/>" +
    			"<input type='hidden' id='productRange"+len+"' value='"+sku.productRange+"'/>" +
    			"<input type='hidden' id='measureRange"+len+"' value='"+sku.measurementRange+"'/>" +
    			"<input type='hidden' id='color"+len+"' value='"+sku.color+"'/>" +
    			"<input type='hidden' id='size"+len+"' value='"+sku.size+"'/>" +
    			"<input type='hidden' id='ean"+len+"' value='"+sku.ean+"'/>" +
    			"<input type='hidden' id='utility"+len+"' value='"+sku.utility+"'/>" +
    			"<input type='hidden' id='trackingRequired"+len+"' class='trackingRequired' value='"+sku.trackingRequired+"'/>"+
    			"<td id='itemScanCode"+len+"' class='itemScanCode'  contenteditable='true' >"+sku.itemScanCode+"</td>" +
    			"<td id='Desc"+len+"'><div id='overflowtext'><a href='#' data-toggle='tooltip'  title='"+description+"'>"+description+"</a></div></td>"+
    			"<td id='UOM"+len+"'>"+ sell_UOM + "</td>" +
				"<td class='Price' id='Price"+len+"'>"+sku.price+"</td>" +
				"<td id='Pack"+len+"' class='Pack' onBlur='changePack(this);' onkeypress='PreventEnter(this);' contenteditable='true'>"+quantity+"</td>" +
				"<td id='Cost"+len+"'>"+cost+"</td>" +
				"<td id='Supplied"+len+"' onBlur='changeSuppliedPack(this);' onkeypress='PreventEnter(this);' contenteditable='true' >"+quantity+"</td>" +
				"<td id='weighted"+len+"'  onkeypress='PreventEnter(this);' contenteditable='true'>1</td>" +
				"<td class='Received' onBlur='changeReceivedPack(this);' onkeypress='PreventEnter(this);' id='Received"+len+"'>"+quantity+"</td>" +
				"<td id='Rejected"+len+"' onBlur='changeRejected(this);' onkeypress='PreventEnter(this);' contenteditable='true'>0</td><td id='Del"+len+"'>" +
				"<img id='Img"+len+"' src='"+contextPath+"/images/itemdelete.png' style='width:20px;cursor:pointer;' onclick='deleteItem(this);' title='Delete "+sku.itemId+"'/></td></tr>";
				$("#productsList tbody").append(row);

			 }

	}
	changeTotalCost();
	changeTotalQuantity();
}








$(".searchItemsForIssue").bind('input', function () {
		 try{
		
			var online = window.navigator.onLine;
		  	if(!online){
		  	alert("Check your internet connection,Please try agian after some time.");
		  	return;
		  	} 
		  	var pagetype= $('#pageType').val();
		  	/*if(pagetype=="new"){
		  	 var Category = $('#outletCategory').val();
				
			 	if(Category == undefined || Category ==  null ||Category == ""){
			 		$('#Error').html("You don't have permission to Issue Stock.");
   				  	return;
				} 
		  	}*/
		  	
		  	
		  	$(".Error").html("");
		  	$("#searchItemsErrorID").html("");
				 var searchName = $(this).val().trim();
				 if(searchName!=""){ 
					 
				if($("#searchScan").is(':checked'))
					 {
					
					if(searchName.length ==7 ||  searchName.length ==13)
					{
						debugger;
					getSkuDetails(searchName,"")
					}
					
					 }
  			else
  				 {
  			 if(searchName!=""&&searchName.length>=3){
  					$(this).siblings("div").show();
  					 var searchCategory = $(this).siblings("div").children("div").children("ul").attr("class").replace('matchedStringUl ','');
  					 
  					searchProducts(searchName,searchCategory);
  					 
  				 }
  				 }
				
				 }
				
		 	}
		catch(e)
		{
			errorCode(e);
		}
	});
	
$(".searchItemsForIssue").bind('blur', function () {
	 try{
		 
		var online = window.navigator.onLine;
	  	if(!online){
	  	alert("Check your internet connection,Please try agian after some time.");
	  	return;
	  	} 
	  	
	  	$(".Error").html("");
	  	$("#searchItemsErrorID").html("");
	  	
	  	var pagetype= $('#pageType').val();
	  /*	if(pagetype=="new"){
	  	 var Category = $('#outletCategory').val();
			
		 	if(Category == undefined || Category ==  null ||Category == ""){
		 		$('#Error').html("You don't have permission to Issue Stock.");
				  	return;
			} 
	  	}*/
	  	
			 var searchName = $(this).val().trim();
			 if(searchName!=""){ 
				 
			if($("#searchScan").is(':checked'))
				 {
					var searchName = $(this).val().trim();
					if(searchName.length>=5)
						{
						getSkuDetails(searchName,"")
						}
					else
						{
						
						}
				
				 }
			
			
			 }
			
	 	}
	catch(e)
	{
		errorCode(e);
	}
});


function addTransactionDetails(billId,flow){
    debugger;
    $("#Errortrans").html("");
   
     //purpose:for checking internet conection
    var online = window.navigator.onLine;
      if(!online){
      alert("check your internet connection,please try agian after some time");
      return;
      }
    
             var len = parseInt($("#transactionList tr").length);
            if (len != 1)
            len = parseInt($("#transactionList tr:last").attr("id").replace('dynamicdiv', '')) + 1;
             
             
            var slNo = 1; 
                     $('.slno').each(function(){
                            $(this).text(slNo);
                            slNo = parseInt(slNo) + 1;
                    });
                     
                    
                            var dateTime = getCurrentDate();
                               var date = dateTime.split(' ');
                                   date = date[0].split('/');
                              var formatedDate = date[1]+"/"+date[0]+"/"+date[2];

                                   dateTime = formatedDate;
                                   
    	   $('#tableRowCount').val(slNo);
    	   
             var row = "<tr id='dynamicdiv"+len+"'><td class='slno'>"+slNo+"</td>" +
             "<td class='transaction' id='transaction"+len+"'>"+billId+"_P"+slNo+"</td>" +        
             "<td id='dateTime"+len+"'>"+dateTime+"</td>" +
             "<td><select  style='width:180px' class='modeOfPayment"+len+"'  id='modeOfPayment"+len+"' onblur='changeToBillId("+len+");paymentTOinfo("+len+");' onchange='myNewFunction(this,"+len+");'>" +
             "<td><input id='cardType"+len+"' class='cardType"+len+"' type='text' style='border-radius: 0px;outline: none;border: none;text-align:center'></td>" +
             "<td><input id='cardPayment"+len+"' class='cardPayment"+len+"' type='text' style='border-radius: 0px;outline: none;border: none;text-align:center'></td>" +
             "<input type='hidden' id='paymentMode"+len+"' value=''/>" +
             "<input type='hidden' id='paymentbillId"+len+"' value='"+billId+"'/>" +
             "<input type='hidden' id='cardInfo"+len+"' value=''/>" +
             "<input type='hidden' id='tenderMode"+len+"' value=''/>" +
             "<td><input id='approvalCode"+len+"' class='approvalCode"+len+"' type='text' style='border-radius: 0px;outline: none;border: none;text-align:center'></td>" +
             "<td id='paidAmount"+len+"' class='paidAmount"+len+"' contenteditable='true' onblur='checkforTotals();'></td>" +
             "<td  id='Del"+len+"'><a  id='Dele" +len+ "'  style='cursor: pointer;color: #3c8dbc;text-decoration: underline;margin-left:3px;' onclick='deleteItemTrans(this);' title='Delete'>Delete</a></td></tr>";
                    
    $("#transactionList tbody").append(row);
    return  searchModeofPayment('',"modeOfPayment"+len);
    
}



function searchModeofPayment(name, searchCategory){
	 //purpose:for checking internet conection
	var online = window.navigator.onLine;
 	if(!online)
 	{
 	alert("check your internet connection,please try agian after some time");
 	return;
 	}
	var location = "";
	 var contextPath = $("#contextPath").val();
	 URL = contextPath + "/admin/searchTenderMaster.do";
	 $.ajax({
			type: "GET",
			url : URL,
			data : {
				empName : name,
				location : location
			},
			beforeSend: function(xhr){                    
  	   			$("#loading").css("display","block");
  	   			$("#mainDiv").addClass("disabled");
  	   		  },
			success : function(result) {
				appendModePaymentToBox(result, searchCategory);
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


function appendModePaymentToBox(tenderList, searchCategory){
	debugger;
	
    for(var i=0;i<tenderList.length;i++){
		$("#"+searchCategory).append(
				'<option value='+tenderList[i].modeOfPayment+'>'+tenderList[i].tenderName+","+tenderList[i].tenderCode+'</option>');
           }
    
    
    $("."+searchCategory).append('');
	 //$("."+searchCategory).append(op);

    
}

function myNewFunction(sel,len) {
	debugger
	var s = sel.options[sel.selectedIndex].text.split(",");
	$("#tenderMode"+len).val(s[1]);
	}


function paymentTOinfo(id)
{
	debugger;
	var mode = $('.modeOfPayment'+id).val();
	var cardNo ="";
	
	if(mode != ''){
		$('#cardInfo'+id).html(mode);
		$('#paymentMode'+id).html(mode);
	
	}
	
}

function deleteItemTrans(element){
	debugger
	var id = $(element).attr("id").replace('Dele','');
	$('#dynamicdiv'+id).remove();
	
	var slNo = 1; 
	 $('.slnoAdd').each(function(){
		$(this).text(slNo);
		slNo = parseInt(slNo) + 1;
	});

}





	

