
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
     $("#from").on('input',function(e){
		   $("#fromError").html("");
		   $(".Error").html("");
	});
	$("#toWarehouse").on('input',function(e){
		   $("#toWarehouseError").html("");
		   $(".Error").html("");
	});
	$("#requestDate").on('input',function(e){
		   $("#requestDateError").html("");
		   $(".Error").html("");
	});
	$("#requestedUserName").on('input',function(e){
		   $("#requestedByError").html("");
		   $(".Error").html("");
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
    
   
    
    
});



function getallProductsByCriteria(name, searchCategory, index) {
	debugger;
	try{
	var len = parseInt($("#productsList tr").length);
		if(len<2){
	var contextPath = $("#contextPath").val();
	storeLocation = $("#from").val();
	var category = "";
	var subCategory = "";
	var Brand="";
	
	if ($("#outletCategory").length > 0)
		category = $("#outletCategory").val();
	
	if ($("#outletSubCategory").length > 0)
		subCategory = $("#outletSubCategory").val();
	
	if ($("#outletBrand").length > 0)
		 Brand = $("#outletBrand").val();
	
	
	
	URL = contextPath + "/inventorymanager/getallStockRequestProductsByCriteria.do";
	$.ajax({
		type : "GET",
		url : URL,
		data : {
			index : index,
			storeLocation : storeLocation,
			category : category,
			subCategory : subCategory,
			Brand:Brand,
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
		
		else{
			 $("#productsList tbody").html('');
		}
	}
	catch(exception)
	{
		
	}
}



function appendproductsbyfilter(productsList,searchCategory){
	debugger;
	try{
	var contextPath = $("#contextPath").val();
	 var appendtype=$("#featurededit").val();
	 var flowUnder=$("#flowUnder").val();
	 var len = parseInt($("#productsList tr").length);
		if (len != 1)
			len = parseInt($("#productsList tr:last").attr("id").replace('dynamicdiv', '')) + 1;
		len=len-2;
	/* if(appendtype == 'new'){
		 $("#productsList tbody").html('');
	 }*/
	 if(productsList.length =='0'){
		alert("no products found");
	 }
	 //$("#productsList tbody").html('');
	 for(var i=0;i<productsList.length;i++){
		 sku = productsList[i];
		 
		 for(var j=0;j<sku.skuPriceLists.length;j++){
		 var len = parseInt($("#productsList tr").length);
			if (len != 1)
				{
					len = parseInt($("#productsList tr:last").attr("id").replace('dynamicdiv', '')) + 1;
				}

			var description = null;
			if (sku.description != "" && sku.description != null)
				description = sku.skuPriceLists[j].description;
			else
				description = $("#desc").val();
			var sell_UOM = sku.skuPriceLists[j].uom;
			if(sell_UOM == "" || sell_UOM == null)                      
				sell_UOM = "";
			var color = sku.skuPriceLists[j].color;
			if(color == "" || color == null)
				color = "";
			var size = sku.skuPriceLists[j].size;
			if(size == "" || size == null)
				size = ""; 
			var brandCode = sku.skuPriceLists[j].brandCode;
			if(brandCode == null)
				sku.brandCode = "";
			var category = sku.skuPriceLists[j].category;
			if(category == null)
				sku.category = "";
			var productRange = sku.skuPriceLists[j].productRange;
			if(productRange == null)
				sku.productRange = "";
			var measureRange = sku.skuPriceLists[j].measureRange;
			if(measureRange == null)
				sku.measureRange = "";
			var slNo = 1; 
			 $('.slno').each(function(){
				$(this).text(slNo);
				slNo = parseInt(slNo) + 1;
			});
			 if(flowUnder === 'outlet')
				{
			var row = "<tr id='dynamicdiv"+len+"' style='margin-top:5px;'><td class='slno'>"+slNo+"</td>" +"<td id='Name"+len+"'>"+sku.skuId+"</td>" +
			"<input type='hidden' id='skuId"+len+"' value='"+sku.skuId+"'/>" +
			"<input type='hidden' id='pluCode"+len+"' value='"+sku.skuPriceLists[j].pluCode+"'/>" +
			"<input type='hidden' id='category"+len+"' value='"+sku.skuPriceLists[j].category+"'/>" +
			"<input type='hidden' id='brandCode"+len+"' value='"+sku.skuPriceLists[j].brandCode+"'/>" +
			"<input type='hidden' id='productRange"+len+"' value='"+sku.skuPriceLists[j].productRange+"'/>" +
			"<input type='hidden' id='measureRange"+len+"' value='"+sku.skuPriceLists[j].measureRange+"'/>" +
			"<input type='hidden' id='trackingRequired"+len+"' value='"+sku.trackingRequired+"'/>" +

			"<td id='Desc"+len+"'>"+description+"</td><td id='UOM"+len+"'>"+ sell_UOM+ "</td>" +
			"<td id='colour"+len+"'>"+color+"</td>" +
			"<td id='size"+len+"'>"+size+"</td>"+
			"<td class='Price' id='Price"+len+"'>"+sku.skuPriceLists[j].costPrice+"</td>" +
			
			"<td class='Qoh' id='Qoh"+len+"'>"+sku.skuPriceLists[j].quantityInHand+"</td>" +
			"<td class='PrvQty' id='PrvQty"+len+"'>0</td>" +
				
			"<td style='border: 1px solid #ccc;'><input style='border: none;height: 35px;text-align: center;' class='Pack' id='Pack"+len+"' onblur='changePack(this);'  type='number' value='1' /></td>" +
			"<td><input style='border: none;height: 35px;text-align: center;' id='approvedQty"+len+"'  readonly type='number' value='1' /></td>" +
			"<td id='Cost"+len+"'>"+sku.skuPriceLists[j].costPrice+"</td>"+
			"<td id='Del"+len+"'><img id='Img"+len+"' src='"+contextPath+"/images/itemdelete.png' style='width:20%;cursor:pointer;' onclick='deleteItem(this);' title='Delete "+sku.skuId+"'/></td></tr>";
			
				}
			 
			 if(flowUnder === 'warehouse')
				{
				 
					var row = "<tr id='dynamicdiv"+len+"' style='margin-top:5px;'><td class='slno'>"+slNo+"</td>" +"<td id='Name"+len+"'>"+sku.skuId+"</td>" +
					"<input type='hidden' id='skuId"+len+"' value='"+sku.skuId+"'/>" +
					"<input type='hidden' id='pluCode"+len+"' value='"+sku.skuPriceLists[j].pluCode+"'/>" +
					"<input type='hidden' id='category"+len+"' value='"+sku.skuPriceLists[j].category+"'/>" +
					"<input type='hidden' id='brandCode"+len+"' value='"+sku.skuPriceLists[j].brandCode+"'/>" +
					"<input type='hidden' id='productRange"+len+"' value='"+sku.skuPriceLists[j].productRange+"'/>" +
					"<input type='hidden' id='measureRange"+len+"' value='"+sku.skuPriceLists[j].measureRange+"'/>" +
					"<input type='hidden' id='trackingRequired"+len+"' value='"+sku.trackingRequired+"'/>" +
					"<td id='Desc"+len+"'>"+description+"</td><td id='UOM"+len+"'>"+ sell_UOM+ "</td>" +
					"<td id='colour"+len+"'>"+color+"</td>" +
					"<td id='size"+len+"'>"+size+"</td>"+
					"<td class='Price' id='Price"+len+"'>"+sku.skuPriceLists[j].costPrice+"</td>" +
				   "<td class='Qoh' id='Qoh"+len+"'>"+sku.skuPriceLists[j].quantityInHand+"</td>" +
				   "<td class='PrvQty' id='PrvQty"+len+"'>0</td>" +
					"<td style='border: 1px solid #ccc;'><input style='border: none;height: 35px;text-align: center;' class='Pack' id='Pack"+len+"' onblur='changePack(this);'  type='number' value='1' /></td>" +
					"<td><input style='border: none;height: 35px;text-align: center;' id='approvedQty"+len+"'  readonly type='number' value='1' /></td>" +
					"<td id='Cost"+len+"'>"+sku.skuPriceLists[j].costPrice+"</td>"+
					"<td id='Del"+len+"'><img id='Img"+len+"' src='"+contextPath+"/images/itemdelete.png' style='width:20%;cursor:pointer;' onclick='deleteItem(this);' title='Delete "+sku.skuId+"'/></td></tr>";
					
				 
				}
			 
			 $("#productsList tbody").append(row);
		
	 } 
	 }
	 
		changeTotalCost();
		 changeTotalQuantity();
	}
	catch(exception)
	{
		console.log();
	}
}


/*function getallProductsByCriteria(name, searchCategory, index) {
	 var len = parseInt($("#productsList tr").length);
if(len<2){
	var contextPath = $("#contextPath").val();
	storeLocation = $("#from").val();
	var category = $("#outletCategory").val();
	URL = contextPath + "/inventorymanager/getallProductsByCriteria.do";
	$.ajax({
		type : "GET",
		url : URL,
		data : {
			index : index,
			storeLocation : storeLocation,
			category : category,
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
else{
	 $("#productsList tbody").html('');
}
	
}*/
/*function appendproductsbyfilter(productsList,searchCategory){
	 var contextPath = $("#contextPath").val();
	 var appendtype=$("#featurededit").val();
	 var len = parseInt($("#productsList tr").length);
		if (len != 1)
			len = parseInt($("#productsList tr:last").attr("id").replace('dynamicdiv', '')) + 1;
		len=len-2;
	 if(appendtype == 'new'){
		 $("#productsList tbody").html('');
	 }
	 if(productsList.length =='0'){
		alert("no products found");
	 }
	 //$("#productsList tbody").html('');
	 for(var i=0;i<productsList.length;i++){
		 sku = productsList[i];
		 var len = parseInt($("#productsList tr").length);
			if (len != 1)
				{
				len = parseInt($("#productsList tr:last").attr("id").replace('dynamicdiv', '')) + 1;
	}
			for (var i = 1; i <= len; i++) {
				if ($("#skuId" + i).val() == sku.skuId && $("#Price"+i).text() == sku.price) {
					var pack =  parseInt($("#Pack"+i).val())+1;
	  			 $("#Pack"+i).val(pack);
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
			var description = null;
			if (sku.description != "" && sku.description != null)
				description = sku.description;
			else
				description = $("#desc").val();
			var sell_UOM = sku.uom;
			if(sell_UOM == "" || sell_UOM == null)                      
				sell_UOM = "";
			var color = sku.color;
			if(color == "" || color == null)
				color = "";
			var size = sku.size;
			if(size == "" || size == null)
				size = "";
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
			var slNo = 1; 
			 $('.slno').each(function(){
				$(this).text(slNo);
				slNo = parseInt(slNo) + 1;
			});
			 
			 
			 if($("#flowUnder").val() != "warehouse"){
			 
			var row = "<tr id='dynamicdiv"+len+"' style='margin-top:5px;'><td class='slno'>"+slNo+"</td>" +"<td id='Name"+len+"'>"+sku.skuId+"</td>" +
			"<input type='hidden' id='skuId"+len+"' value='"+sku.skuId+"'/>" +
			"<input type='hidden' id='pluCode"+len+"' value='"+sku.pluCode+"'/>" +
			"<input type='hidden' id='category"+len+"' value='"+sku.category+"'/>" +
			"<input type='hidden' id='brandCode"+len+"' value='"+sku.brandCode+"'/>" +
			"<input type='hidden' id='productRange"+len+"' value='"+sku.productRange+"'/>" +
			"<input type='hidden' id='measureRange"+len+"' value='"+sku.measureRange+"'/>" +
			"<td id='Desc"+len+"'>"+description+"</td><td id='UOM"+len+"'>"+ sku.uom + "</td>" +
			"<td id='colour"+len+"'>"+color+"</td>" +
			"<td id='size"+len+"'>"+size+"</td>"+
			"<td class='Price' id='Price"+len+"'>"+sku.price+"</td>" +
			"<td class='Qoh' id='Qoh"+len+"'>"+sku.quantity+"</td>" +
			"<td class='PrvQty' id='PrvQty"+len+"'>0</td>" +
			"<td style='border: 1px solid #ccc;padding:0px;'><input style='border: none;height: 100%;text-align: center;' class='Pack' id='Pack"+len+"' onblur='changePack(this);'  type='number' value='0' /></td>" +
			"<td><input style='border: none;height: 100%;text-align: center;' id='approvedQty"+len+"'  readonly type='number' value='0' /></td>" +
			"<td id='Cost"+len+"'>0</td>" +
			"<td id='Del"+len+"'><img id='Img"+len+"' src='"+contextPath+"/images/itemdelete.png' style='width:12%;cursor:pointer;' onclick='deleteItem(this);' title='Delete "+sku.skuId+"'/></td></tr>";
			$("#productsList tbody").append(row);
			changeTotalCost();
			 changeTotalQuantity();
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
					"<td id='Desc"+len+"'>"+description+"</td><td id='UOM"+len+"'>"+ sku.uom + "</td>" +
					"<td id='colour"+len+"'>"+color+"</td>" +
					"<td id='size"+len+"'>"+size+"</td>"+
					"<td class='Price' id='Price"+len+"'>"+sku.price+"</td>" +
					"<td class='Qoh' id='Qoh"+len+"'>"+sku.quantity+"</td>" +
					"<td class='PrvQty' id='PrvQty"+len+"'>0</td>" +
					"<td style='border: 1px solid #ccc;padding:0px;'><input style='border: none;height: 100%;text-align: center;' class='Pack' id='Pack"+len+"' onblur='changePack(this);'  type='number' value='0' /></td>" +
					"<td><input style='border: none;height: 100%;text-align: center;' id='approvedQty"+len+"'  readonly type='number' value='0' /></td>" +
					"<td id='Cost"+len+"'>0</td>" +
					"<td id='Del"+len+"'><img id='Img"+len+"' src='"+contextPath+"/images/itemdelete.png' style='width:12%;cursor:pointer;' onclick='deleteItem(this);' title='Delete "+sku.skuId+"'/></td></tr>";
				 
				 $("#productsList tbody").append(row);
					changeTotalCost();
					 changeTotalQuantity();
				 }
			 
			 
			
	 } 
}*/
var skuList = null;
/**
 * @author Sahitya 
 * Prepare table rows dynamically with the provided details, then append to table
 * @param List of Raw Material Details
 */
var warehouseskumaster=null;
function appendSkuDetails(list) {
	debugger;
	//var contextPath = $("#contextPath").val();
	var parsedJson = jQuery.parseJSON(list);
	$("#searchItems").val("");
	skuList = parsedJson.skuLists;
	
	//written by manasa
	//purpose:to get track item when we call warehouse location
	if($("#flowUnder").val() == "warehouse"){
	warehouseskumaster=parsedJson.warehouseskumaster;
	
	var itemTrack = warehouseskumaster.trackingRequired;
	skuList[0].trackingRequired = itemTrack;
	}
	
	if(skuList.length >1){
		var priceLength = skuList.length;
		var priceArray = [];
		$("#itemsList tbody").html("");
		for(var i=0; i<priceLength; i++){
			
			if($("#flowUnder").val() == "warehouse")
				skuList[i].trackingRequired = itemTrack;
			
			var price = skuList[i].costPrice;
			if (! $.inArray(price, priceArray) > -1)
			{
				priceArray.push(price);
				
				
				if(skuList[i].productBatchNo ==  null){
						skuList[i].productBatchNo = "";
					}
					if(skuList[i].expiry_date ==  null){
						skuList[i].expiry_date = "";
					}
				
				
				
				var row = '<tr id=price'+i+' style="margin-top:5px;cursor:pointer" onclick=getPrice(this) ><td>'+skuList[i].description+'</td><td>'+skuList[i].productBatchNo+'</td><td>'+skuList[i].expiry_date+'</td><td>'+skuList[i].quantity+'</td><td>'+price+'</td><td>'+skuList[i].color+'</td><td>'+skuList[i].size+'</td></tr>';
				//'<li id="'+productsList[i].skuID+'"  class="selected" onclick=getId(this,"'+searchCategory+'"); ><a>'+productsList[i].description+'   -   '+productsList[i].skuID+'</a></li>';
				$("#itemsList tbody").append(row);
			}
		}
		var  op = '<a id="selectPrice"  data-toggle="modal" data-target="#items-modal"></a>';
		 $("#triggerEvent").append(op);
		 $("#selectPrice" ).trigger( "click" );
		 $("#triggerEvent").html("");
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

function addItem(sku){
	debugger;
	 var contextPath = $("#contextPath").val();
	 var len = parseInt($("#productsList tr").length);
		if (len != 1)
			{
			len = parseInt($("#productsList tr:last").attr("id").replace('dynamicdiv', '')) + 1;
}
		//if(sku.trackingRequired == false){
		for (var i = 1; i <= len; i++) {
			if ($("#skuId" + i).val() == sku.skuId ) {
				var pack =  parseInt($("#Pack"+i).val())+1;
  			 $("#Pack"+i).val(pack);
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
		//}
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
		var color = sku.color;
		if(color == "" || color == null)
			color = "";
		var size = sku.size;
		if(size == "" || size == null)
			size = "";
		
		if(sku.trackingRequired == "" || sku.trackingRequired == null)
			sku.trackingRequired = false;
		
		var slNo = 1; 
		 $('.slno').each(function(){
			$(this).text(slNo);
			slNo = parseInt(slNo) + 1;
		});
		 
		 
		// $('Qoh').attr('name', 'value');
		 
		// if($("#type").val() == "new"){
		 
		 if($("#flowUnder").val() != "warehouse"){
		 if($("#type").val() == "new"){
			 debugger
			
				 var row = "<tr id='dynamicdiv"+len+"' style='margin-top:5px;'><td class='slno'>"+slNo+"</td>" +"<td id='Name"+len+"'>"+sku.skuId+"</td>" +
					"<input type='hidden' id='skuId"+len+"' value='"+sku.skuId+"'/>" +
					"<input type='hidden' id='pluCode"+len+"' value='"+sku.pluCode+"'/>" +
					"<input type='hidden' id='category"+len+"' value='"+sku.category+"'/>" +
	    			"<input type='hidden' id='brandCode"+len+"' value='"+sku.brandCode+"'/>" +
	    			"<input type='hidden' id='productRange"+len+"' value='"+sku.productRange+"'/>" +
	    			"<input type='hidden' id='measureRange"+len+"' value='"+sku.measureRange+"'/>" +
	    			"<input type='hidden' id='ean"+len+"' value='"+sku.ean+"'/>" +
	    			"<input type='hidden' id='utility"+len+"' value='"+sku.utility+"'/>" +
	    			"<input type='hidden' id='trackingRequired"+len+"' value='"+sku.trackingRequired+"'/>" +
	    			"<td id='Desc"+len+"'><div id='overflowtext'><a href='#' data-toggle='tooltip'  title='"+description+"'>"+description+"</a></div></td>"+
/*	    			"<td id='Desc"+len+"'>"+description+"</td>" +
*/	    			"<td id='UOM"+len+"'>"+ sell_UOM + "</td>" +
					"<td id='colour"+len+"'>"+color+"</td>" +
					"<td id='size"+len+"'>"+size+"</td>"+
					"<td class='Price' id='Price"+len+"'>"+sku.costPrice+"</td>" +
					"<td class='Qoh' id='Qoh"+len+"'>"+sku.quantity+"</td>" +
					"<td class='PrvQty' id='PrvQty"+len+"'>"+sku.prvIndentQty+"</td>" +
					"<td style='border: 1px solid #ccc;'><input style='border: none;height: 35px;text-align: center;' class='Pack' id='Pack"+len+"' onblur='changePack(this);'  type='number' value='1' /></td>" +
					"<td ><input style='border: none;height: 35px;text-align: center;' readonly id='approvedQty"+len+"'   type='number' value='1' /></td>" +
					"<td id='Cost"+len+"'>"+sku.costPrice+"</td>" +
					"<td id='Del"+len+"'><img id='Img"+len+"' src='"+contextPath+"/images/itemdelete.png' style='width:12%;cursor:pointer;' onclick='deleteItem(this);' title='Delete "+sku.skuId+"'/></td></tr>";
				
			 $("#productsList tbody").append(row);
		     changeTotalCost();
			 changeTotalQuantity(); 
		 }
		 else{
			 var row = "<tr id='dynamicdiv"+len+"' style='margin-top:5px;'><td class='slno'>"+slNo+"</td>" +"<td id='Name"+len+"'>"+sku.skuId+"</td>" +
					"<input type='hidden' id='skuId"+len+"' value='"+sku.skuId+"'/>" +
					"<input type='hidden' id='pluCode"+len+"' value='"+sku.pluCode+"'/>" +
					"<input type='hidden' id='category"+len+"' value='"+sku.category+"'/>" +
	    			"<input type='hidden' id='brandCode"+len+"' value='"+sku.brandCode+"'/>" +
	    			"<input type='hidden' id='productRange"+len+"' value='"+sku.productRange+"'/>" +
	    			"<input type='hidden' id='measureRange"+len+"' value='"+sku.measureRange+"'/>" +
	    			"<input type='hidden' id='ean"+len+"' value='"+sku.ean+"'/>" +
	    			"<input type='hidden' id='utility"+len+"' value='"+sku.utility+"'/>" +
	    			"<input type='hidden' id='trackingRequired"+len+"' value='"+sku.trackingRequired+"'/>" +
	    			/*"<td id='itemScanCode"+len+"' class='itemScanCode'  contenteditable='true'>"+sku.itemScanCode+"</td>" +*/
	    			"<td id='Desc"+len+"'><div id='overflowtext'><a href='#' data-toggle='tooltip'  title='"+description+"'>"+description+"</a></div></td>"+

/*	    			"<td id='Desc"+len+"'>"+description+"</td>" +
*/	    	        "<td id='UOM"+len+"'>"+ sell_UOM + "</td>" +
					"<td id='colour"+len+"'>"+color+"</td>" +
					"<td id='size"+len+"'>"+size+"</td>"+
					"<td class='Price' id='Price"+len+"'>"+sku.costPrice+"</td>" +
					"<td class='Qoh' id='Qoh"+len+"'>"+sku.quantity+"</td>" +
					"<td class='PrvQty' id='PrvQty"+len+"'>"+sku.prvIndentQty+"</td>" +
					"<td style='border: 1px solid #ccc;'><input style='border: none;height: 35px;text-align: center;' class='Pack' id='Pack"+len+"' onblur='changePack(this);'  type='number' value='1' /></td>" +
					"<td style='border: 1px solid #ccc;'><input style='border: none;height: 35px;text-align: center;' id='approvedQty"+len+"'   type='number' value='1' /></td>" +
					"<td id='Cost"+len+"'>"+sku.costPrice+"</td>" +
					"<td id='Del"+len+"'><img id='Img"+len+"' src='"+contextPath+"/images/itemdelete.png' style='width:12%;cursor:pointer;' onclick='deleteItem(this);' title='Delete "+sku.skuId+"'/></td></tr>";
			 $("#productsList tbody").append(row);
		     changeTotalCost();
			 changeTotalQuantity();
		 }
		
		 
		 }
		 else
			 {
			 
			 if($("#type").val() == "new"){
				 debugger
				
					 var row = "<tr id='dynamicdiv"+len+"' style='margin-top:5px;'><td class='slno'>"+slNo+"</td>" +"<td id='Name"+len+"'>"+sku.skuId+"</td>" +
						"<input type='hidden' id='skuId"+len+"' value='"+sku.skuId+"'/>" +
						"<input type='hidden' id='pluCode"+len+"' value='"+sku.pluCode+"'/>" +
						"<input type='hidden' id='category"+len+"' value='"+sku.category+"'/>" +
		    			"<input type='hidden' id='brandCode"+len+"' value='"+sku.brandCode+"'/>" +
		    			"<input type='hidden' id='productRange"+len+"' value='"+sku.productRange+"'/>" +
		    			"<input type='hidden' id='measureRange"+len+"' value='"+sku.measureRange+"'/>" +
		    			"<input type='hidden' id='ean"+len+"' value='"+sku.ean+"'/>" +
		    			"<input type='hidden' id='utility"+len+"' value='"+sku.utility+"'/>" +
		    			"<input type='hidden' id='trackingRequired"+len+"' value='"+sku.trackingRequired+"'/>" +
		    			/*"<td id='itemScanCode"+len+"' class='itemScanCode'  contenteditable='true'>"+sku.itemScanCode+"</td>" +*/
		    			"<td id='Desc"+len+"'><div id='overflowtext'><a href='#' data-toggle='tooltip'  title='"+description+"'>"+description+"</a></div></td>"+

/*		    			"<td id='Desc"+len+"'>"+description+"</td>" +
*/		    			"<td id='UOM"+len+"'>"+ sell_UOM + "</td>" +
						"<td id='colour"+len+"'>"+color+"</td>" +
						"<td id='size"+len+"'>"+size+"</td>"+
						"<td class='Price' id='Price"+len+"'>"+sku.costPrice+"</td>" +
						"<td class='Qoh' id='Qoh"+len+"'>"+sku.quantity+"</td>" +
						"<td class='PrvQty' id='PrvQty"+len+"'>"+sku.prvIndentQty+"</td>" +
						"<td style='border: 1px solid #ccc;'><input style='border: none;height: 35px;text-align: center;' class='Pack' id='Pack"+len+"' onblur='changePack(this);'  type='number' value='1' /></td>" +
						"<td ><input style='border: none;height: 35px;text-align: center;' readonly id='approvedQty"+len+"'   type='number' value='1' /></td>" +
						"<td id='Cost"+len+"'>"+sku.costPrice+"</td>" +
						"<td id='Del"+len+"'><img id='Img"+len+"' src='"+contextPath+"/images/itemdelete.png' style='width:12%;cursor:pointer;' onclick='deleteItem(this);' title='Delete "+sku.skuId+"'/></td></tr>";
					
				 $("#productsList tbody").append(row);
			     changeTotalCost();
				 changeTotalQuantity(); 
			 }
			 else{
				 var row = "<tr id='dynamicdiv"+len+"' style='margin-top:5px;'><td class='slno'>"+slNo+"</td>" +"<td id='Name"+len+"'>"+sku.skuId+"</td>" +
						"<input type='hidden' id='skuId"+len+"' value='"+sku.skuId+"'/>" +
						"<input type='hidden' id='pluCode"+len+"' value='"+sku.pluCode+"'/>" +
						"<input type='hidden' id='category"+len+"' value='"+sku.category+"'/>" +
		    			"<input type='hidden' id='brandCode"+len+"' value='"+sku.brandCode+"'/>" +
		    			"<input type='hidden' id='productRange"+len+"' value='"+sku.productRange+"'/>" +
		    			"<input type='hidden' id='measureRange"+len+"' value='"+sku.measureRange+"'/>" +
		    			"<input type='hidden' id='ean"+len+"' value='"+sku.ean+"'/>" +
		    			"<input type='hidden' id='utility"+len+"' value='"+sku.utility+"'/>" +
		    			"<input type='hidden' id='trackingRequired"+len+"' value='"+sku.trackingRequired+"'/>" +
		    			/*"<td id='itemScanCode"+len+"' class='itemScanCode'  contenteditable='true'>"+sku.itemScanCode+"</td>" +*/
		    			"<td id='Desc"+len+"'><div id='overflowtext'><a href='#' data-toggle='tooltip'  title='"+description+"'>"+description+"</a></div></td>"+

/*		    			"<td id='Desc"+len+"'>"+description+"</td>" +
*/		    			"<td id='UOM"+len+"'>"+ sell_UOM + "</td>" +
						"<td id='colour"+len+"'>"+color+"</td>" +
						"<td id='size"+len+"'>"+size+"</td>"+
						"<td class='Price' id='Price"+len+"'>"+sku.costPrice+"</td>" +
						"<td class='Qoh' id='Qoh"+len+"'>"+sku.quantity+"</td>" +
						"<td class='PrvQty' id='PrvQty"+len+"'>"+sku.prvIndentQty+"</td>" +
						"<td style='border: 1px solid #ccc;'><input style='border: none;height: 35px;text-align: center;' class='Pack' id='Pack"+len+"' onblur='changePack(this);'  type='number' value='1' /></td>" +
						"<td style='border: 1px solid #ccc;'><input style='border: none;height: 35px;text-align: center;' id='approvedQty"+len+"'   type='number' value='1' /></td>" +
						"<td id='Cost"+len+"'>"+sku.costPrice+"</td>" +
						"<td id='Del"+len+"'><img id='Img"+len+"' src='"+contextPath+"/images/itemdelete.png' style='width:12%;cursor:pointer;' onclick='deleteItem(this);' title='Delete "+sku.skuId+"'/></td></tr>";
				 $("#productsList tbody").append(row);
			     changeTotalCost();
				 changeTotalQuantity();
			 }
			 
			 }
		 
}

function getPrice(ele){
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
	debugger
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
		var supplied = parseInt($('#Supplied'+rowNo).html());
		$('#'+id).html(supplied);
	}
	//isNumeric(element);
	var packVal = parseFloat($('#Pack'+rowNo).val());
	if(packVal<=0){
		//alert("Pack should not be empty");
		var supplied = parseInt($('#Supplied'+rowNo).html());
		var receivedVal = parseInt($('#Received'+rowNo).html());
		var priceVal = parseFloat($('#Price'+rowNo).html());
		$('#Pack'+rowNo).html(0);
		$('#Cost'+rowNo).html(0);
	}else{
		var priceVal = parseFloat($('#Price'+rowNo).html());
		var rejected = 0;
		if(packVal<rejected){
			//alert("Pack cannot be less than Rejected");
			var supplied = parseInt($('#Supplied'+rowNo).html());
			$('#'+id).html(supplied);
		}
		else{
			var receivedVal =  packVal - rejected;
			$('#Cost'+rowNo).html(receivedVal*priceVal);
		}
	}
	changeTotalCost();
	changeTotalQuantity();
}
function changeApproved(element){
	var id = $(element).attr("id");
	var rowNo = id.replace('approvedQty','');
	if (isNaN($("#"+id).html()) || $("#"+id).html() == ""){
		var supplied = parseInt($('#Supplied'+rowNo).html());
		$('#'+id).html(supplied);
	}
	//isNumeric(element);
	var packVal = parseInt($('#approvedQty'+rowNo).val());
	if(packVal<=0){
		//alert("Pack should not be empty");
		var supplied = parseInt($('#Supplied'+rowNo).html());
		var receivedVal = parseInt($('#Received'+rowNo).html());
		var priceVal = parseFloat($('#Price'+rowNo).html());
		$('#approvedQty'+rowNo).html(0);
		$('#Cost'+rowNo).html(0);
	}else{
		var priceVal = parseFloat($('#Price'+rowNo).html());
		var rejected = 0;
		if(packVal<rejected){
			//alert("Pack cannot be less than Rejected");
			var supplied = parseInt($('#Supplied'+rowNo).html());
			$('#'+id).html(supplied);
		}
		else{
			var receivedVal =  packVal - rejected;
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
	debugger
	var totalCost=0.0;
	$('.Price').each(function(){
	  var rowNo = $(this).attr("id").replace('Price','');
	  var cost = $("#Price"+rowNo).html();
	  if($("#flowUnder").val()=='outlet')
		  var received = $('#Pack'+rowNo).val();
	  else
	  var received = $('#approvedQty'+rowNo).val();
	  
	  totalCost = parseFloat(cost)*parseFloat(received)+totalCost;
	 });
	$('#totalCost').val(totalCost);
	
}

/**
 * @author Sahitya 
 * change totalqty whenever receieved value is changing
 * @param html element
 */
/*function changeTotalQuantity(){
	var totalQty=0;
	$('.Received').each(function(){
	  var rowNo = $(this).attr("id").replace('Received','');
	  var qty = $("#Received"+rowNo).html();
	  totalQty = parseInt(qty)+totalQty;
	 });
	$('#totalQty').val(totalQty);
	
}*/

function changeTotalQuantity(){
	var totalQty=0;
	$('.Pack').each(function(){
	  var rowNo = $(this).attr("id").replace('Pack','');
	  var qty = $("#Pack"+rowNo).val();
			  totalQty = parseInt(qty)+totalQty;
	 });
	$('#totalQty').val(totalQty);
	
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
	if(parseInt(rejectedVal)>0){
		if(parseInt(suppliedVal)>=parseInt(rejectedVal)){
			$('#Received'+rowNo).html(parseInt(suppliedVal)-parseInt(rejectedVal));
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
  	  			obj = {skuId:$("#skuId"+idAttr).val(),pluCode:$("#pluCode"+idAttr).val(),item:$("#Name"+idAttr).text(),description:$("#Desc"+idAttr).text(),UOM:$("#UOM"+idAttr).text(),price:$("#Price"+idAttr).text(),cost:$("#Cost"+idAttr).text(),recieved:$("#Received"+idAttr).text(),rejected:$("#Rejected"+idAttr).text(),supplied:$("#Supplied"+idAttr).text(),quantity:$("#Pack"+idAttr).text(),max_quantity:$("#Pack"+idAttr).text()};
  	  		}else{
  	  		obj = {skuId:$("#skuId"+idAttr).val(),pluCode:$("#pluCode"+idAttr).val(),item:$("#Name"+idAttr).text(),description:$("#Desc"+idAttr).text(),UOM:$("#UOM"+idAttr).text(),price:$("#Price"+idAttr).text(),cost:$("#Cost"+idAttr).text(),recieved:$("#Received"+idAttr).text(),rejected:$("#Rejected"+idAttr).text(),issued:$("#Supplied"+idAttr).text(),quantity:$("#Pack"+idAttr).text(),max_quantity:$("#Pack"+idAttr).text()};
  	  		}
  	  		finalObj.itemDetails.push(obj);
  	}
  	return finalObj;
}
function getstockIssueSummary(id){
	 var contextPath = $("#contextPath").val();
	 URL = contextPath +"/inventorymanager/getstockIssueSummary.do";
	 var flowUnder = "";
	 if($("#flowUnder").length > 0)
			flowUnder = $("#flowUnder").val();
		$.ajax({
			type: "GET",
			url : URL,
			data : {
				flowUnder : flowUnder
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

function searchProducts(name,searchCategory){
	
	debugger
	 var contextPath = $("#contextPath").val();
	 var storeLocation = "";
	
	 if( $("#type").val() == "issue")
		 storeLocation = $("#fromLocation").val();
	 else
		 storeLocation = $("#from").val();
	 var flowUnder = $("#flowUnder").val();
		 if(flowUnder == "warehouse")
			 URL = contextPath + "/inventorymanager/searchWarehouseProducts.do";
		 else	 
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
	 if(productsList.length == 0){
		 $("."+searchCategory).html("No item found. Please check location you selected.");
		 $("."+searchCategory).show();
	 }else{
	 for(var i=0;i<productsList.length;i++){
		 if(productsList[i].color==null)
			 productsList[i].color="";	 
		if(productsList[i].size==null)
			 productsList[i].size="";
			 
			if(productsList[i].price==null || productsList[i].price=="" || productsList[i].price==undefined)
			productsList[i].price=0;
		if(productsList[i].category==null)
			productsList[i].category="";
		
		if(productsList[i].quantity=="" || productsList[i].quantity==undefined || productsList[i].quantity== null)
			productsList[i].quantity=0;
			
		if(productsList[i].quantityInHand=="" || productsList[i].quantityInHand==undefined || productsList[i].quantityInHand== null)
			productsList[i].quantityInHand=productsList[i].quantity;
		if(productsList[i].reorderPoint=="" || productsList[i].reorderPoint==undefined || productsList[i].reorderPoint== null)
			productsList[i].reorderPoint=0;
		
		
		if(productsList[i].mrp=="" || productsList[i].mrp==undefined || productsList[i].mrp== null)
			productsList[i].mrp=0;
			 
		
		 if(productsList[i].skuID == productsList[i].description){
				 if (i == 0) {
					 op += '<li id="'+productsList[i].pluCode+'"  class="selected" onclick=getId(this,"'+searchCategory+'"); ><a><label style="width: 10%;">'+productsList[i].skuID+'</label> &nbsp &nbsp &nbsp &nbsp   <label style="width: 40%;">'+productsList[i].productName+' </label> &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp   <label style="width: 5%;">  '+productsList[i].quantityInHand+'</label> &nbsp &nbsp &nbsp &nbsp   <label style="width: 5%;">'+productsList[i].mrp+' </label> &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp   <label style="width: 5%;">  '+productsList[i].price+'</label>&nbsp &nbsp &nbsp &nbsp  <label style="width: 5%;"> '+productsList[i].reorderPoint+'</label> &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp   <label style="width: 5%;"> '+productsList[i].color+'</label>  &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp     '+productsList[i].size+'</a></li>';
				}else
					 op += '<li id="'+productsList[i].pluCode+'"   onclick=getId(this,"'+searchCategory+'"); ><a><label style="width: 10%;">'+productsList[i].skuID+'</label> &nbsp &nbsp &nbsp &nbsp   <label style="width: 40%;">'+productsList[i].productName+' </label> &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp   <label style="width: 5%;">  '+productsList[i].quantityInHand+'</label> &nbsp &nbsp &nbsp &nbsp   <label style="width: 5%;">'+productsList[i].mrp+' </label> &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp   <label style="width: 5%;">  '+productsList[i].price+'</label>&nbsp &nbsp &nbsp &nbsp  <label style="width: 5%;"> '+productsList[i].reorderPoint+'</label> &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp   <label style="width: 5%;"> '+productsList[i].color+'</label>  &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp     '+productsList[i].size+'</a></li>';
		 	}
			 else{
				 if (i == 0) {
					 op += '<li id="'+productsList[i].pluCode+'"  class="selected" onclick=getId(this,"'+searchCategory+'"); ><a><label style="width: 10%;">'+productsList[i].skuID+'</label> &nbsp &nbsp &nbsp &nbsp   <label style="width: 40%;">'+productsList[i].productName+' </label> &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp   <label style="width: 5%;">  '+productsList[i].quantityInHand+'</label> &nbsp &nbsp &nbsp &nbsp   <label style="width: 5%;">'+productsList[i].mrp+' </label> &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp   <label style="width: 5%;">  '+productsList[i].price+'</label>&nbsp &nbsp &nbsp &nbsp  <label style="width: 5%;"> '+productsList[i].reorderPoint+'</label> &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp   <label style="width: 5%;"> '+productsList[i].color+'</label>  &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp     '+productsList[i].size+'</a></li>';
				}else
					 op += '<li id="'+productsList[i].pluCode+'"   onclick=getId(this,"'+searchCategory+'"); ><a><label style="width: 10%;">'+productsList[i].skuID+'</label> &nbsp &nbsp &nbsp &nbsp   <label style="width: 40%;">'+productsList[i].productName+' </label> &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp   <label style="width: 5%;">  '+productsList[i].quantityInHand+'</label> &nbsp &nbsp &nbsp &nbsp   <label style="width: 5%;">'+productsList[i].mrp+' </label> &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp   <label style="width: 5%;">  '+productsList[i].price+'</label>&nbsp &nbsp &nbsp &nbsp  <label style="width: 5%;"> '+productsList[i].reorderPoint+'</label> &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp   <label style="width: 5%;"> '+productsList[i].color+'</label>  &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp     '+productsList[i].size+'</a></li>';
			 }
	 }
	 $("."+searchCategory).html(op);
	 $("."+searchCategory).show();
	 }
}

function getId(element,type){
	var description = null;
	var id= $(element).attr("id");
	description =  $("#"+id).children("a").text();
	description = description.split(' ( ');
	description = description[0];
	$("#desc").val(description);
	if(type == "apparel")
		getItemDetails(id);
	else if(type == "request")
		getSkuDetails(id,description);
	 $(".services").hide();
	 $("."+type).html("");
}

	 function getSkuDetails(skuId,description){
		 debugger;
	// var materialName = $('#searchCriteria').val();
	 $("#desc").val(description);
	 var contextPath = $("#contextPath").val();
	 var storeLocation = "";
	 if( $("#type").val() == "issue")
		 storeLocation = $("#fromLocation").val();
	 else
		 storeLocation = $("#from").val();
//	 else
//		 storeLocation = $("#tolocation").val();
//	 URL = contextPath + "/inventorymanager/getSkuDetails.do";
	 
	 var flowUnder = $("#flowUnder").val();
       var WarehouseReturnflag=$("#whreturnflag").val();
		if(WarehouseReturnflag == "" || WarehouseReturnflag == undefined || WarehouseReturnflag == null){
			WarehouseReturnflag="";
   		}


	 if(flowUnder == "warehouse")
		 URL = contextPath + "/inventorymanager/getWarehouseSkuDetails.do";
	 else	 
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
  				appendSkuDetails(result);
  				//$('#searchCriteria').val('');
  				//$('#skuList').html('');
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

	 function searchGoodsRequest(name, searchCategory){
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
			 }
			 $(".services").hide();
			 $("."+type).html("");
		}
		function getPrice(ele){
			var id = $(ele).attr("id");
			id = id.replace('price','');
			$(".modal-backdrop").trigger("click");
			addItem(skuList[id]);
		}
		function getGoodsRequest(requestId){
			var flowUnder = $("#flowUnder").val();
			var contextPath = $("#contextPath").val();
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
		}
		
		
		$("#searchStockRequest").keydown(function(e){
			$("#stockRequestRefError").html("");
			if($("#searchStockRequest").val().length<3){
				$("#stockRequestRef").val("");
			}
			$(".searchStockRequest").children("li").each(function(){
				var requestRef = $(this).children("a").text().trim();
				if($("#searchStockRequest").val().trim().toLowerCase() == requestRef.toLowerCase()){
					$("#searchStockRequest").val($("#searchStockRequest").val().trim());
					$("#stockRequestRef").val($(this).attr("id"));
					 $(".services").hide();
					 $(".matchedStringUl").html("");
					return;
				}
				else{
					$("#stockRequestRef").val("");
				}
			});
			if(e.keyCode == 9){
				if($("#searchStockRequest").val()!="" && $("#stockRequestRef").val() == ""){
					 $("#stockRequestRefError").html("Stock Request Ref. doesn't exist");
				 }
				 $(".services").hide();
				 $(".matchedStringUl").html("");
			}
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
			var contextPath = $("#contextPath").val();
			for(var j=0;j<skuList.length;j++){	
				var sku = skuList[j];
				 var quantity = sku.quantity;
				 if(skuList.length > 0 && skuList[0].fromLocation != undefined && skuList[0].fromLocation != null && skuList[0].fromLocation != ""){
					$("#tolocation").val(skuList[0].fromLocation);
				}
				if(skuList.length > 0 && skuList[0].deliveryDateStr != undefined && skuList[0].deliveryDateStr != null && skuList[0].deliveryDateStr != ""){
					$("#date").val(skuList[0].deliveryDateStr);
				}
				var len = parseInt($("#productsList tr").length);
				if (len != 1)
					len = parseInt($("#productsList tr:last").attr("id").replace('dynamicdiv', '')) + 1;
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
				
				/*if(sku.stockRequestId == $("#stockRequestRef").val())
					{
					$("#productsList tbody").html('');
					}
				*/
				
				var description = null;
				if (sku.itemDesc != "" && sku.itemDesc != null)
					description = sku.itemDesc;
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
				 var cost = parseFloat(sku.quantity) * parseFloat(sku.itemPrice);
				var row = "<tr id='dynamicdiv"+len+"' style='margin-top:5px;'><td class='slno'>"+slNo+"</td>" +"<td id='Name"+len+"'>"+sku.skuId+"</td>" +
				"<input type='hidden' id='skuId"+len+"' value='"+sku.skuId+"'/>" +
				"<input type='hidden' id='pluCode"+len+"' value='"+sku.pluCode+"'/>" +
				"<td id='Desc"+len+"'>"+description+"</td><td id='UOM"+len+"'>"+ sell_UOM + "</td>" +
				"<td class='Price' id='Price"+len+"'>"+sku.itemPrice+"</td>" +
				"<td id='Pack"+len+"' class='Pack' onBlur='changePack(this);' onkeypress='return (this.innerText.length < 10)' contenteditable='true'>"+quantity+"</td>" +
				"<td id='Cost"+len+"'>"+cost+"</td>" +
				"<td id='colour"+len+"'>"+color+"</td>" +
				"<td id='size"+len+"'>"+size+"</td>1</td><td id='Del"+len+"'>" +
				"<img id='Img"+len+"' src='"+contextPath+"/images/itemdelete.png' style='width:15%;cursor:pointer;' onclick='deleteItem(this);' title='Delete "+sku.skuId+"'/></td></tr>";
				$("#productsList tbody").append(row);
			}
			changeTotalCost();
			changeTotalQuantity();
		}
		
		
		function searchGoodsIssue(name, searchCategory){
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
			var contextPath = $("#contextPath").val();
			for(var j=0;j<skuList.length;j++){	
				var sku = skuList[j];
				var quantity = sku.quantity;
				if(skuList.stockRequestId > 0 && skuList[0].stockRequestId != undefined && skuList[0].stockRequestId != null && skuList[0].stockRequestId != "")
					$("#requestRef").val(skuList[0].stockRequestId);
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
				var description = null;
				if (sku.description != "" && sku.description != null)
					description = sku.description;
				else
					description = $("#desc").val();
				var sell_UOM = sku.uOM;
				if(sell_UOM == "" || sell_UOM == null)                      
					sell_UOM = "_";
				var color = sku.color;
				if(color == "" || color == null)
					color = "_";
				var size = sku.size;
				if(size == "" || size == null)
					size = "_";
				var slNo = 1; 
				 $('.slno').each(function(){
					$(this).text(slNo);
					slNo = parseInt(slNo) + 1;
				});
				 var cost = parseFloat(quantity) * parseFloat(sku.price);
				var row = "<tr id='dynamicdiv"+len+"' style='margin-top:5px;'><td class='slno'>"+slNo+"</td>" +"<td id='Name"+len+"'>"+sku.skuId+"</td>" +
				"<input type='hidden' id='skuId"+len+"' value='"+sku.skuId+"'/>" +
				"<input type='hidden' id='pluCode"+len+"' value='"+sku.pluCode+"'/>" +
				"<td id='Desc"+len+"'>"+description+"</td><td id='UOM"+len+"'>"+ sell_UOM + "</td>" +
				"<td class='Price' id='Price"+len+"'>"+sku.price+"</td>" +
				"<td id='Pack"+len+"' class='Pack' onBlur='changePack(this);' onkeypress='return (this.innerText.length < 10)' contenteditable='true'>"+quantity+"</td>" +
				"<td id='Cost"+len+"'>"+cost+"</td>" +
				"<td id='colour"+len+"'>"+color+"</td>" +
				"<td id='size"+len+"'>"+size+"</td>"+
		        "<td id='Del"+len+"'><img id='Img"+len+"' src='"+contextPath+"/images/itemdelete.png' style='width:15%;cursor:pointer;' onclick='deleteItem(this);' title='Delete "+sku.skuId+"'/></td></tr>";
				$("#productsList tbody").append(row);
			}
			changeTotalCost();
			changeTotalQuantity();
		}
		



function searchStockRequests(name,searchCategory,index){
	var startDate = "";
	 var endDate = "";
	 var maxRecords = 10;
	 debugger
	 name=""
	   		 if($("#searchStock").length>0)
	   			name = $("#searchStock").val().trim();
	 
	 if($("#maxRecords").length>0)
		 maxRecords = $("#maxRecords").val();
	 
	 var location = "";
	 if($("#outletLocation").length>0 && $("#outletLocation").val != "select" && $("#outletLocation").val != "" && $("#outletLocation").val != "-- Select --")
 		location = $("#outletLocation").val();
	 var zone = "";
	 if($("#outletZone").length>0 && $("#outletZone").val != "select" && $("#outletZone").val != "" && $("#outletZone").val != "-- Select --")
 		zone = $("#outletZone").val();
	 var CurrentDate=getCurrentDate().split(" ");
		var  finalstr=CurrentDate[0];
		var dobDiff = daydiff(parseDateMMDDYYYY(finalstr), parseDate($('#fromDate').val()));
		if(dobDiff > 0){
			alert("Start Date  can't be Future Date");
			return false;
		}
	if($("#fromDate").val() != "" && $("#to").val() != ""){
		var noOfDays = daydiff(parseDate($('#fromDate').val()), parseDate($('#to').val()));
		 if(noOfDays < 0){
			 alert("Start Date can't be less than End Date");
			 return;
		 }
		 startDate = $("#fromDate").val() + " 00:00:00";
		 endDate = $("#to").val() + " 00:00:00";
	}else if($("#fromDate").val() != "")
		 startDate = $("#fromDate").val() + " 00:00:00";
	else if($("#to").val() != "")
		endDate = $("#to").val() + " 00:00:00";
	var warehouse = "";
	if($("#warehouseLocation").length > 0)
		warehouse = $("#warehouseLocation").val();
	if($("#flowUnder").length > 0)
		flowUnder = $("#flowUnder").val();
	
	//alert(startDate)
	var zone = "";
	if($("#outletZone").length > 0)
		zone = $("#outletZone").val();

var category = "";
	if($("#outletCategory").length > 0)
		category = $("#outletCategory").val();
	var subcategory = "";
	if($("#outletSubcategory").length > 0)
		subcategory = $("#outletSubcategory").val();
	var brand = "";
	if($("#outletBrandId").length > 0)
		brand = $("#outletBrandId").val();
	
	
	//written by manasa
	 var allLocationsList = [];
	 var length = $('#outletLocation').children('option').length;
	 console.log(length)
     	$('#outletLocation option').each(function() { 
     		allLocationsList.push( $(this).attr('value'));
     	   
     	});
	
	 console.log(allLocationsList)
	// finalobj.billedLocations = billedLocationsList;
	if(searchCategory=="Cancel")
		zone="";
	//written by manasa
		 var  locationList="";
	      	for(i=1;i<allLocationsList.length;i++)
	      		{
	      		locationList =locationList+ allLocationsList[i]+',';
	      		}
	      //	locationList = locationList.slice(0,-1);//remove last comma
	    
	      	console.log(locationList)

    var requestType = $("#requestType").val();
	if(requestType == undefined || requestType == null){
		requestType = "";
	}

	
	
	 var contextPath = $("#contextPath").val();
	 URL = contextPath + "/inventorymanager/searchStockRequests.do";
	 $.ajax({
			type: "GET",
			url : URL,
			data : {
				searchName : name,
				index : index,
				location : location,
				maxRecords : maxRecords,
				startDate : startDate,
				endDate : endDate,
				flowUnder : flowUnder,
				productCategory : category,
				subcategory : subcategory,
				brand : brand,
				zone : zone,
				warehouse : warehouse,
				locationList : locationList,
				requestType : requestType
			},
			beforeSend: function(xhr){                    
	   	   		$("#loading").css("display","block");
	   	   		$("#mainDiv").addClass("disabled");
	   	   	},
			success : function(result) {
				$('#right-side').html(result);
				/*if($("#searchProduct").val != "")
					$("#pagination").css("display","none");
				else
					$("#pagination").css("display","block");*/
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




function updatePriceDetails(operation){
	var priceUpdateobj = {},items=[];
	
	for(var i=1;i<=len1;i++){
	 var idAttr = $("#example1 tr:eq("+i+")").attr("id").replace("skuPriceList",'');
	 var obj={storeLocation:$("#pluStoreLocation"+idAttr).val(),skuId:$("#skuId"+idAttr).text(),ean:$("#ean"+idAttr).text(),uom:$("#uom"+idAttr).text(),color:$("#color"+idAttr).text(),size:$("#size"+idAttr).text(),costPrice:$("#costPrice"+idAttr).text(),price:$("#price"+idAttr).text(),newSalePrice:$("#newPrice"+idAttr).text(),skuDescription:$("#profitability"+idAttr).text()};
	 items.push(obj);
	}
	
	priceUpdateobj.skuPriceListsDetails=items;
	console.log(priceUpdateobj);
	URL = contextPath + "/outletMaster/updateSkuPrice.do";
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
function validateStockRequest(viewoperatiob,operation,stockRequestId){
	
	 //purpose:for checking internet conection
	var online = window.navigator.onLine;
  	if(!online)
  	{
  	alert("check your internet connection,please try agian after some time");
  	return;
  	}
	if(operation != 'gridupdate'){
		if($("#from").val() == ""){
			$("#fromError").html("Enter Outlet Location")	
			focusDiv("from");
			return;
		}
		if($("#toWarehouse").val() == ""){
			$("#toWarehouseError").html("Enter Warehouse Location")	
			focusDiv("toWarehouseError");
			return;
		}
		if($("#requestDate").val() == ""){
			$("#requestDateError").html("Enter Requested Date")	
			focusDiv("requestDateError");
			return;
		}
		if($("#deliveryDate").val() == ""){
			$("#deliveryDateError").html("Enter Delivery Date")	
			focusDiv("deliveryDate");
			return;
		}
		
		
//		purpose:for back button filters
		 var location = "";
		 if($("#outletLocation").length>0 && $("#outletLocation").val != "select" && $("#outletLocation").val != "" && $("#outletLocation").val != "-- Select --")
	 		location = $("#outletLocation").val();
		 var zone = "";
		 if($("#outletZone").length>0 && $("#outletZone").val != "select" && $("#outletZone").val != "" && $("#outletZone").val != "-- Select --")
	 		zone = $("#outletZone").val();
		 var startDate = "";
	    	 var endDate = "";
	    	 var category =""
	    var subcategory =""		
	    	var flowUnder = ""
	    	var searchName=""
	    	 if($("#fromDate").length>0)
	    		 startDate = $("#fromDate").val();
	    	 if($("#to").length>0)
	    		 endDate = $("#to").val();
	    	 if($("#outletCategory").length>0)
	    		 category = $("#outletCategory").val();
	    	 if($("#outletSubcategory").length>0)
	    		 subcategory=$("#outletSubcategory").val();
	    	 if($("#searchStock").length>0)
	    		 searchName = $("#searchStock").val();
	    	 if($("#flowUnder").length > 0)
	    			flowUnder = $("#flowUnder").val();
	    	 var maxRecords = 10;
	    		if($("#maxRecords").length > 0)
	    			maxRecords = $("#maxRecords").val();
		
		var CurrentDate=getCurrentDate().split(" ");
		 
		var  finalstr=CurrentDate[0];
		var dobDiff = daydiff(parseDateMMDDYYYY(finalstr), parseDate($('#requestDate').val()));
		var dodDiff = daydiff(parseDateMMDDYYYY(finalstr), parseDate($('#deliveryDate').val()));
		if(dobDiff > 0){
			 $("#requestDateError").html("Requested Date  can't be Future Date");
			return false;
		}
	
		if(dodDiff < 0){
			 $("#deliveryDateError").html("Delivery Date  can't be Past Date");
			return false;
		}
		if($("#requestedUserName").val() == ""){
			$("#requestedByError").html("Enter Requested By ")	
			focusDiv("Error");
			return;
		}
		
		if(parseInt($("#requestedUserName").val().length)>100){
 			 $("#requestedUserName").focus();
 				$("#requestedByError").html("User Name can't exceeds 100 Characters");
 				return;
 		}else{
 	   	 $("#requestedByError").html(" ");
 	   }
		
		if(parseInt($("#remarks").val().length)>250){
			 $("#remarks").focus();
				$("#remarksError").html("Remark can't exceeds 250 Characters");
				return;
		}else{
	   	 $("#remarksError").html(" ");
	   }
		
		
	}
	
	
	
	 var itemScanCodes = [];
	 var trackingRequireds = [];
		  $('.itemScanCode').each( function(){
			  			  
			  		itemScanCodes.push($(this).text() );  
				});
	
	$('.trackingRequired').each(function() {
		  
		  trackingRequireds.push($(this).val() );  
		});
	
	//  var trackReq = $("#itemScanCode"+idAttr).text();
	
//if(trackReq == true){
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
	
 	var stockReqobj = {},stockRequestItems=[], skuId = [], Qty = [];
 	stockReqobj.toWareHouseId=$("#toWarehouse").val();
 	stockReqobj.reason= $("#reason").val();
 	stockReqobj.requestedUserName= $("#requestedUserName").val();
 	stockReqobj.requestApprovedBy= $("#requestApprovedBy").val();
 	stockReqobj.shippingMode= $("#shippingMode").val();
    stockReqobj.shippingCost= $("#shippingCost").val();
 	stockReqobj.remarks= $("#remarks").val();
 	stockReqobj.zoneId = $("#outletZone").val();
 	stockReqobj.stockRequestId=$("#stockRequestId").val();
 	stockReqobj.requestApprovedBy=$("#requestApprovedBy").val();
 	stockReqobj.requestedQty=$("#requestedQty").val();
 	stockReqobj.totalStockRequestValue=$("#totalCost").val();
 	stockReqobj.priority = $("#priority").val();
 
 	debugger
	if($("#flowUnder").length > 0)
		stockReqobj.flowUnder = $("#flowUnder").val();
 	var len = parseInt($("#productsList tr").length);
 	stockReqobj.qty=Qty;
	  	stockReqobj.sid=skuId;
 	if(operation == 'gridupdate'){
 		stockReqobj.stockRequestId=stockRequestId;
 		$('.'+stockRequestId).each(function(){
 			var id= $(this).attr("id").replace('approvedQty','');
 			id = id.replace(stockRequestId,'');
 			var srid = stockRequestId.concat(id)
 	 		skuId.push($("#skuId"+srid).text());
 	 		Qty.push($("#approvedQty"+srid).val());
 		});
 		stockReqobj.qty=Qty;
 	  	stockReqobj.sid=skuId;
 	}
 	else{
 		 if($('#statusissue').val()==''){
     		status = $('#defaultstatus').val();
 		 }
 		 else{
 			 status = $('#statusissue').val(); 
 		 }
  	if(viewoperatiob == 'new')
  		status = 'Submitted';
  	stockReqobj.status=status;
  	stockReqobj.stockRequestItems=stockRequestItems;
  	
 		stockReqobj.fromStoreCode= $("#from").val();
 		stockReqobj.requestDateStr= $("#requestDate").val();
 	 	stockReqobj.deliveryDateStr= $("#deliveryDate").val();
 		if(len <= 1){
 			alert("Add Atleast One Item");
 	 		return false;
 		}
 	debugger
 	for(var i=1;i<len;i++){
 		var idAttr = $("#productsList tr:eq("+i+") td:last").attr("id").replace('Del','');
 		 if(viewoperatiob == 'new')
	var obj = {itemScanCode:$("#itemScanCode"+idAttr).text(),trackingRequired:$("#trackingRequired"+idAttr).val(),utility:$("#utility"+idAttr).val(),ean:$("#ean"+idAttr).val(),category:$("#category"+idAttr).val(),measurementRange:$("#measureRange"+idAttr).val(),productRange:$("#productRange"+idAttr).val(),brand:$("#brandCode"+idAttr).val(),approvedQty:$("#Pack"+idAttr).val(),prvIndentQty:$("#PrvQty"+idAttr).text(),avlQty:$("#Qoh"+idAttr).text(),pluCode:$("#pluCode"+idAttr).val(),skuId:$("#Name"+idAttr).text(),itemDesc:$("#Desc"+idAttr).text(),uom:$("#UOM"+idAttr).text(),itemPrice:$("#Price"+idAttr).text(),quantity:$("#Pack"+idAttr).val(),totalCost:$("#Cost"+idAttr).text(),color:$("#colour"+idAttr).text(),size:$("#size"+idAttr).text()};
 		 else
 			var obj = {itemScanCode:$("#itemScanCode"+idAttr).text(),trackingRequired:$("#trackingRequired"+idAttr).val(),utility:$("#utility"+idAttr).val(),ean:$("#ean"+idAttr).val(),category:$("#category"+idAttr).val(),measurementRange:$("#measureRange"+idAttr).val(),productRange:$("#productRange"+idAttr).val(),brand:$("#brandCode"+idAttr).val(),approvedQty:$("#approvedQty"+idAttr).val(),prvIndentQty:$("#PrvQty"+idAttr).text(),avlQty:$("#Qoh"+idAttr).text(),pluCode:$("#pluCode"+idAttr).val(),skuId:$("#Name"+idAttr).text(),itemDesc:$("#Desc"+idAttr).text(),uom:$("#UOM"+idAttr).text(),itemPrice:$("#Price"+idAttr).text(),quantity:$("#Pack"+idAttr).val(),totalCost:$("#Cost"+idAttr).text(),color:$("#colour"+idAttr).text(),size:$("#size"+idAttr).text()}; 
 		 if($("#Pack"+idAttr).val()>0)
	stockRequestItems.push(obj);
 	}
 	}
 	
 	console.log(stockRequestItems);
 	 var contextPath = $("#contextPath").val();
 	 if(viewoperatiob == 'new')
 	 	 URL = contextPath + "/inventorymanager/createStockRequests.do"; 
 	 else
 	 URL = contextPath + "/inventorymanager/updateStockRequests.do";
 	 var formData = JSON.stringify(stockReqobj);
 		console.info(formData)
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
 				$("#maxRecords").val(maxRecords);
 				$("#fromDate").val(startDate);
 				$("#to").val(endDate);
 				$("#outletLocation").val(location);
 				$("#outletCategory").val(category);
 				$("#outletSubcategory").val(subcategory);
// 				$("#outletZone").val(startDate);
 				$("#searchStock").val(searchName);
 				$("#flowUnder").val(flowUnder);
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


function viewStockRequestDetails(id,operation){
	
	 //purpose:for checking internet conection
	var online = window.navigator.onLine;
  	if(!online)
  	{
  	alert("check your internet connection,please try agian after some time");
  	return;
  	}
	
	var maxRecords = 10;
	if($("#maxRecords").length > 0)
		maxRecords = $("#maxRecords").val();
  	
	 var contextPath = $("#contextPath").val();
	 var location = $("#outletLocation").val();

	debugger 
//added by manasa
	 
	 var formData={}
	 var productCategory = "";
	 if($("#outletCategory").length > 0)
		 productCategory = $("#outletCategory").val();
	// alert(productCategory)
	 formData.zone = $("#outletZone").val();
	 formData.storeLocation = $("#outletLocation").val();
	 formData.category = productCategory;
	 formData.subCategory = $("#outletSubcategory").val();
	 formData.brand= $("#outletBrandId").val();
	 formData.department = $("#outletDepartmentId").val();
	 formData.startDate = $("#fromDate").val();
	 formData.endDate = $("#to").val();
	 formData.searchCriteria = $("#searchStock").val();
	 
	 var formData = JSON.stringify(formData);
	 
	 
	 URL = contextPath +"/inventorymanager/viewStockRequestDetails.do";
	 var flowUnder = "";
	 if($("#flowUnder").length > 0)
			flowUnder = $("#flowUnder").val();
		$.ajax({
			type: "GET",
			url : URL,
			data : {
				requestId:id,
				operation : operation,
				flowUnder : flowUnder,
				formData : formData
			},
			beforeSend: function(xhr){                    
	   			$("#loading").css("display","block");
	   			$("#mainDiv").addClass("disabled");
	   		  },
			success : function(result) {
				/*$(".active-menu").removeClass("active-menu");
				$(".menu-open").css("display","none");
				$(".menu-open").removeClass("menu-open");
				$(".active").removeClass("active");*/
			//	activeMenu(id);
				$("#right-side").html(result);
				//$('.left-side').css('height','525px');
				$("#outletLocation").val(location);
				$("#maxRecords").val(maxRecords);
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

function getstockRequestSummary(id){
	
	 //purpose:for checking internet conection
	var online = window.navigator.onLine;
  	if(!online)
  	{
  	alert("check your internet connection,please try agian after some time");
  	return;
  	}
	 var contextPath = $("#contextPath").val();
	 URL = contextPath +"/inventorymanager/getstockRequestSummary.do";
	 var flowUnder = "";
	 if($("#flowUnder").length > 0)
			flowUnder = $("#flowUnder").val();
	 var startDate = "";
	 var endDate = "";
	 var maxRecords = 10;
	 if($("#maxRecords").length>0)
		 maxRecords = $("#maxRecords").val();
	 
	 var location = "";
	 if($("#outletLocation").length>0 && $("#outletLocation").val != "select" && $("#outletLocation").val != "" && $("#outletLocation").val != "-- Select --")
 		location = $("#outletLocation").val();
	 var zone = "";
	 if($("#outletZone").length>0 && $("#outletZone").val != "select" && $("#outletZone").val != "" && $("#outletZone").val != "-- Select --")
 		zone = $("#outletZone").val();
	if($("#fromDate").val() != "" && $("#to").val() != ""){
		var noOfDays = daydiff(parseDate($('#fromDate').val()), parseDate($('#to').val()));
		 if(noOfDays < 0){
			 alert("Start Date can't be less than End Date");
			 return;
		 }
		 startDate = $("#fromDate").val() + " 00:00:00";
		 endDate = $("#to").val() + " 00:00:00";
	}else if($("#fromDate").val() != "")
		 startDate = $("#fromDate").val() + " 00:00:00";
	else if($("#to").val() != "")
		endDate = $("#to").val() + " 00:00:00";
	console.log(startDate);
	var warehouse = "";
	if($("#warehouseLocation").length > 0)
		warehouse = $("#warehouseLocation").val();
	
	//written by manasa
	 var allLocationsList = [];
	 var length = $('#outletLocation').children('option').length;
	 console.log(length)
    	$('#outletLocation option').each(function() { 
    		allLocationsList.push( $(this).attr('value'));
    	   
    	});
	
	 console.log(allLocationsList)
	// finalobj.billedLocations = billedLocationsList;
	
	//written by manasa
		 var  locationList="";
	      	for(i=1;i<allLocationsList.length;i++)
	      		{
	      		locationList =locationList+ allLocationsList[i]+',';
	      		}
	      //	locationList = locationList.slice(0,-1);//remove last comma
	    
	      	console.log(locationList)
		$.ajax({
			type: "GET",
			url : URL,
			data : {
				flowUnder : flowUnder,
				warehouse : warehouse,
				zone : zone,
				location : location,
				startDate : startDate,
				endDate : endDate,
				locationList : locationList
			},
			beforeSend: function(xhr){                    
	   			$("#loading").css("display","block");
	   			$("#mainDiv").addClass("disabled");
	   		  },
			success : function(result) {
				$("#stockrequestSummary").html(result);
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

function openedIndents(id){
	 //purpose:for checking internet conection
	var online = window.navigator.onLine;
  	if(!online)
  	{
  	alert("check your internet connection,please try agian after some time");
  	return;
  	}
  /*	 var location = "";
	 if($("#outletLocation").length>0 && $("#outletLocation").val != "select" && $("#outletLocation").val != "" && $("#outletLocation").val != "-- Select --")
 		location = $("#outletLocation").val();*/
  	var location = ""
  		if($("#outletLocation").length > 0)
  			location = $("#outletLocation").val();
	 var contextPath = $("#contextPath").val();
	 URL = contextPath +"/inventorymanager/openedIndents.do";
	 var flowUnder = "";
	 if($("#outletLocation").length > 0)
			flowUnder = $("#warehouseLocation").val();
		$.ajax({
			type: "GET",
			url : URL,
			data : {
				flowUnder : flowUnder,
				location:location,
			},
			beforeSend: function(xhr){                    
	   			$("#loading").css("display","block");
	   			$("#mainDiv").addClass("disabled");
	   		  },
			success : function(result) {
				$("#po").html(result);
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



function generateIndents(id){
	debugger;
	 //purpose:for checking internet conection
	var online = window.navigator.onLine;
  	if(!online)
  	{
  	alert("check your internet connection,please try agian after some time");
  	return;
  	}
	 var selected = "";
		var selectedLabel = 'Please Select Atleast One Location to Submit';
		var name=$('#deleteActionLabel').val();
		var atLeastOneIsChecked = $('input[name="checkalloutlets"]:checked').length > 0;
		var selectedLength = $('input[name="checkalloutlets"]:checked').length;
		var selectedID = $("#checkalloutlets").length;
		if(selectedLength == 1 && selectedID == 0)
			atLeastOneIsChecked = false;
		//var yes = false;
		if(!atLeastOneIsChecked){
			/*alert(selectedLabel+" ");*/
			$("#divError").html(selectedLabel+" ").addClass("error-msg");

			return false;
		}
		else{
			var selectedLength = $('input[name="checkalloutlets"]:checked');
		    $(selectedLength).each(function(){
		    	if($(this).attr("onClick") != "modalselectAll(this)")
		    		selected += $(this).val()+",";
		    	//selected += $(this).val().replace(/\//g, '')+",";
			});
			selected = selected.slice(0,-1);// Remove last comma
			//yes = confirm("Are you sure, you want to Generate Indents for these Locations "+selected);
			
			 var indentCategory = $('input:radio[name=autoIndent]:checked').val();
			 
			 if(indentCategory == "brandWise"){
				 indentCategory ="Brand";
				 
			 }else if(indentCategory == "categoryWise"){
				 indentCategory = "category";
			 }else if(indentCategory == "departmentWise"){
				 indentCategory = "department";
			 }else if(indentCategory == "sectionWise"){
				 indentCategory="section";
			 }else{
				 indentCategory = "none";
			 }
		
		
	
		
             var selectindentperiod=$("#selectindent").val();
				if(selectindentperiod == "" || selectindentperiod == undefined || selectindentperiod == null){
					selectindentperiod="";
		   		}


				if(selectindentperiod == ""){
				
				$("#divError").html("Please Select Atleast One Indent Period").addClass("error-msg");
				 $("#selectindent").focus();
				 return;
			 }
           
			/* var allLocationsList = [];
			 var length = $('#Wlocation').children('option').length;
			 console.log(length)
		     	$('#Wlocation option').each(function() { 
		     		allLocationsList.push( $(this).attr('value'));
		     	   
		     	});
			 var Tolocation = "";
		      	for(i=1;i<allLocationsList.length;i++)
		      		{
		      		Tolocation =Tolocation+ allLocationsList[i]+',';
		      		}
		      //	locationList = locationList.slice(0,-1);//remove last comma
		      	if($("#Wlocation").length > 0)
			  		Tolocation = $("#Wlocation").val();*/
			
			var Tolocation = "";
		  	 if($("#Wlocation").length > 0)
		  		Tolocation = $("#Wlocation").val();
		  	 
		  	 var selectindents = "";
		  	 if($("#selectindent").length > 0)
		  		selectindents = $("#selectindent").val();
		  	 
		  	var option="";
			option = $("#selectindent").val();
		  	 if(option =="Custom"){
		  		var startDate="";
				if($("#indentfromDate").length > 0)
					startDate = $("#indentfromDate").val();
				var endDate="";
					if($("#indentto").length > 0)
						endDate = $("#indentto").val();
		  		if(startDate==""){
		  				$("#indentfromDate").focus();
		 				
						$("#divError").html("Start Date is Required").addClass("error-msg");
		 				return;
		 			}
		  		if(endDate==""){
		  				$("#indentto").focus();
		 				
						$("#divError").html("End Date is Required").addClass("error-msg");
					
		 				return;
		 			}
		  		if(endDate!=""){
	 				 var date = daydiff(parseDate($('#indentfromDate').val()), parseDate($('#indentto').val()));
	 				 if(date < 0){
	 					 
						$("#divError").html("End Date can't be less than start date").addClass("error-msg");
					
	 					 return;
	 				 }
				}
		  		
		  	 }
		  	 
			var startDate="";
				if($("#indentfromDate").length > 0)
					startDate = $("#indentfromDate").val();
				var endDate="";
					if($("#indentto").length > 0)
						endDate = $("#indentto").val();
						
				var requestType = $("#requestType").val();
		if(requestType == undefined || requestType == null){
			requestType = "";
		}		
						
						
		 var contextPath = $("#contextPath").val();
		 URL = contextPath +"/inventorymanager/generateIndents.do";
		 var flowUnder = "";
		 if($("#warehouseLocation").length > 0)
				flowUnder = $("#warehouseLocation").val();
			$.ajax({
				type: "GET",
				url : URL,
				data : {
					ids : selected,
					indentCategory : indentCategory,
					Tolocation : Tolocation,
					startDate : startDate,
					endDate : endDate,
					select:selectindents,
					flowUnder : flowUnder,
					requestType : requestType,
				},
				beforeSend: function(xhr){                    
		   			$("#loading").css("display","block");
		   			$("#mainDiv").addClass("disabled");
		   		  },
				success : function(result){
					$("#po").html(result);
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

	
	/* var contextPath = $("#contextPath").val();
	 URL = contextPath +"/inventorymanager/generateIndents.do";
	 var flowUnder = "";
	 if($("#outletLocation").length > 0)
			flowUnder = $("#warehouseLocation").val();
		$.ajax({
			type: "GET",
			url : URL,
			data : {
				flowUnder : flowUnder
			},
			beforeSend: function(xhr){                    
	   			$("#loading").css("display","block");
	   			$("#mainDiv").addClass("disabled");
	   		  },
			success : function(result) {
				$("#po").html(result);
				$("#loading").css("display","none");
				$("#mainDiv").removeClass('disabled');
			},
			error : function() {
				 alert("something went wrong");
				$("#loading").css("display","none");
			$("#mainDiv").removeClass('disabled');
			}
		});*/
	 
}

	function replaceselectindent(){
	debugger;
	var option =  $("#selectindent").val();
	if(option == "Inventory Average Period"){
		document.getElementById("selectindent").select = "Inventory Average Period";
		$("#indentfromDate").css("display","none");
		$("#indentto").css("display","none");
		$("#start").css("display","none");
		$("#end").css("display","none");
		$("#inv").css("display","none");
		$("#h4s").css("display","none");
	}else if(option == "Custom"){
		document.getElementById("selectindent").select = "Custom"; 
		$("#indentfromDate").css("display","block");
		$("#indentto").css("display","block");
		$("#start").css("display","block");
		$("#end").css("display","block");
		$("#inv").css("display","block");
		$("#h4s").css("display","block");
	
	}else if(option == "15 Days"){
		document.getElementById("selectindent").select = "15 Days"; 
		$("#indentfromDate").css("display","none");
		$("#indentto").css("display","none");
		$("#start").css("display","none");
		$("#end").css("display","none");
		$("#inv").css("display","none");
		$("#h4s").css("display","none");
		
		
		
	}else if(option == "Weekly"){
		document.getElementById("selectindent").select = "Weekly"; 
		$("#indentfromDate").css("display","none");
		$("#indentto").css("display","none");
		$("#start").css("display","none");
		$("#end").css("display","none");
		$("#inv").css("display","none");
		$("#h4s").css("display","none");
	
	}
	
}
	
	
	
	/* var contextPath = $("#contextPath").val();
	 URL = contextPath +"/inventorymanager/generateIndents.do";
	 var flowUnder = "";
	 if($("#outletLocation").length > 0)
			flowUnder = $("#warehouseLocation").val();
		$.ajax({
			type: "GET",
			url : URL,
			data : {
				flowUnder : flowUnder
			},
			beforeSend: function(xhr){                    
	   			$("#loading").css("display","block");
	   			$("#mainDiv").addClass("disabled");
	   		  },
			success : function(result) {
				$("#po").html(result);
				$("#loading").css("display","none");
				$("#mainDiv").removeClass('disabled');
			},
			error : function() {
				 alert("something went wrong");
				$("#loading").css("display","none");
			$("#mainDiv").removeClass('disabled');
			}
		});*/
	 


function modalselectAll(source){	
   	 debugger;
 		checkboxes = document.getElementsByName('checkalloutlets');		
 		  /*
			 * for each( var checkbox in checkboxes) { checkbox.checked =
			 * source.checked; }
			 */
 		
 		for ( var i = 0; i < checkboxes.length; i++) {
 		
 			 checkboxes[i].checked= source.checked;	
 		}
 		
     }



function createprovisionalPo(id,status){
	
	 //purpose:for checking internet conection
	var online = window.navigator.onLine;
  	if(!online)
  	{
  	alert("check your internet connection,please try agian after some time");
  	return;
  	}
	 var selected = "";
	 if(status=='false')
		 {
		 var selectedLabel = 'Please Select Atleast One Indent to generate PO for ';
		 	var name=$('#deleteActionLabel').val();
	   		var atLeastOneIsChecked = $('input[name="selectall"]:checked').length > 0;
	   		var selectedLength = $('input[name="selectall"]:checked').length;
	   		var selectedID = $("#selectall").length;
	   		if(selectedLength == 1 && selectedID == 0)
	   			atLeastOneIsChecked = false;
	   		var yes = false;
	   			var selectedLength = $('input[name="selectall"]:checked');
	   		    $(selectedLength).each(function(){
	   		    	if($(this).attr("onClick") != "selectAll(this)")
	   		    		selected += $(this).val()+",";
	   		    	//selected += $(this).val().replace(/\//g, '')+",";
	   			});
	   			selected = selected.slice(0,-1);// Remove last comma
	   			if(atLeastOneIsChecked)
	   			yes = confirm("Are you sure, you want to generate PO "+selected+"   Indents");
	   		
		 }
	 var contextPath = $("#contextPath").val();
	 URL = contextPath +"/inventorymanager/createprovisionalPo.do";
	 var flowUnder = "";
	 if($("#outletLocation").length > 0)
			flowUnder = $("#warehouseLocation").val();
		$.ajax({
			type: "GET",
			url : URL,
			data : {
				flowUnder : flowUnder,
				status : status,
				ids : selected,
			},
			beforeSend: function(xhr){                    
	   			$("#loading").css("display","block");
	   			$("#mainDiv").addClass("disabled");
	   		  },
			success : function(result) {
				$("#po").html(result);
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