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
    
   
});


var skuList = null;
/**
 * @author Sahitya 
 * Prepare table rows dynamically with the provided details, then append to table
 * @param List of Raw Material Details
 */
function appendSkuDetails(list) {
	 //purpose:for checking internet conection
	var online = window.navigator.onLine;
  	if(!online)
  	{
  	alert("check your internet connection,please try agian after some time");
  	return;
  	}
	//var contextPath = $("#contextPath").val();
	var parsedJson = jQuery.parseJSON(list);
	$("#searchItems").val("");
	skuList = parsedJson.skuLists;
	if(skuList.length >1){
		var priceLength = skuList.length;
		var priceArray = [];
		$("#itemsList tbody").html("");
		for(var i=0; i<priceLength; i++){
			var price = skuList[i].price;
			if (! $.inArray(price, priceArray) > -1)
			{
				priceArray.push(price);
				var row = '<tr id=price'+i+' style="margin-top:5px;cursor:pointer" onclick=getPrice(this) ><td>'+skuList[i].description+'</td><td>'+price+'</td></tr>';
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

var re = /^[0-9/]+$/;
function changeInfoBasedOnLocation(location){
	//alert("Location>>>"+location);
	getStorageUnitsByLocation(location);
	//getShiftsByLocation(location);
}



function appendStoragelocation(result){
	$("#storageunit").val(result);
	
}


function getStorageUnitsByLocation(location){
	debugger
	 //purpose:for checking internet conection
	var online = window.navigator.onLine;
  	if(!online)
  	{
  	alert("check your internet connection,please try agian after some time");
  	return;
  	}
	var contextPath = $('#contextPath').val();
	 URL = contextPath + "/inventorymanager/getStorageUnitByLocation.do";
	  $.ajax({
		url : URL,
		data : {
			location : location
		},
		success : function(counterslist){
			//alert("Result:::"+counters);
			//appendstorageDetails(counterslist);
			if(counterslist.length>0){
				
				var op='';
				$("#storageunit").html("");
				$("#counterError").html("");
				for(var i=0;i<counterslist.length;i++){
					op += '<option value="'+counterslist[i]+'">'+counterslist[i]+'</option>';
				}
				$("#storageunit").html(op);
			}else{
				$("#storageunit").html("");
				//alert("Counters are not found in "+location+" location");
				$("#counterError").html("Storage Units are not found in "+location+" location");
			}
		},
		error : function(){
			//alert("Counters are not found in "+location+" location");
			$("#counterError").html("Counters are not found in "+location+" location");
		}
	 });
}






function addItem(sku){
	debugger
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
			 var supplied = $("#Supplied"+i).text(pack);
  			 var cost =  parseFloat($("#Price"+i).text());
  			 $("#Cost"+i).text(pack-supplied);
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
		
		var stockqty=sku.quantity;
			
		var stockloss=1-stockqty;
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
		 
					var row = "<tr id='dynamicdiv"+len+"' style='margin-top:5px;'><td class='slno' >"+slNo+"</td>" +"<td id='Name"+len+"'>"+sku.skuId+"</td>" +
	   				"<input type='hidden' id='skuId"+len+"' value='"+sku.skuId+"'/>" +
	   				"<input type='hidden' id='sno"+len+"' value='"+slNo+"'/>" +
	   				"<input type='hidden' id='pluCode"+len+"' value='"+sku.pluCode+"'/>" +
	   				"<input type='hidden' id='category"+len+"' value='"+sku.category+"'/>" +
	   				"<input type='hidden' id='subCategory"+len+"' value='"+sku.subCategory+"'/>" +
	    			"<input type='hidden' id='brandCode"+len+"' value='"+sku.brandCode+"'/>" +
	    			"<input type='hidden' id='productRange"+len+"' value='"+sku.productRange+"'/>" +
	    			"<input type='hidden' id='measureRange"+len+"' value='"+sku.measureRange+"'/>" +
	    			"<input type='hidden' id='color"+len+"' value='"+sku.color+"'/>" +
	    			"<input type='hidden' id='size"+len+"' value='"+sku.size+"'/>" +
	    			"<input type='hidden' id='saleQty"+len+"' value='"+sku.salePrice+"'/>" +
	   				"<td  style='white-space:nowrap' id='Desc"+len+"'>"+description+"</td>" +
	   				"<td id='Grade"+len+"'>"+sku.productRange+"</td>" +
	   				"<td class='Price' id='Price"+len+"'>"+sku.price+"</td>" +
	   				"<td id='OpenStock"+len+"' class='OpenStock' >"+sku.quantity+"</td>"+
	   				"<td id='Supplied"+len+"' class='Supplied' >"+sku.quantity+"</td>" +
	   				"<td id='ActualQty"+len+"' onBlur='changeReceivedPack(this)' class='ActualQty' contenteditable='true'>1</td>"+
	   				"<td id='Dump"+len+"' class='Dump' contenteditable='true'>1</td>"+
	   			   "<td id='Diff"+len+"' class='Diff' contenteditable='true'>1</td>"+
	   				"<td class='Received' id='Received"+len+"' contenteditable=''>"+sku.quantity+"</td>" +
	   				"<td id='Pack"+len+"' class='Pack' onBlur='changePack(this);' onkeypress='return (this.innerText.length < 10)' contenteditable='true'>1</td>" +
	   				"<td id='Cost"+len+"'>"+stockloss+"</td>" +
	   				"<td ><select  style='width:180px' class='lossType"+len+"'  id='lossType"+len+"'><option value='Damaged'>Damaged</option><option value='Expired'>Expired</option><option value='Manufacturing Defect'>Manufacturing Defect</option><option value='Other'>Other</option></select></td><td id='Del"+len+"'>" +
	   				"<img id='Img"+len+"' src='"+contextPath+"/images/itemdelete.png' style='width:12%;cursor:pointer;' onclick='deleteItem(this);' title='Delete "+sku.skuId+"'/></td></tr>";
	   				$("#productsList tbody").append(row);
				/*
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
					"<td id='Supplied"+len+"' onBlur='changeIssued(this);' onkeypress='return (this.innerText.length < 10)' contenteditable='true'>1</td><td class='Received' id='Received"+len+"' onBlur='changeReceived(this);' onkeypress='return (this.innerText.length < 10)' contenteditable='true'>1</td>" +
					"<td  id='availableQty"+len+"' >"+availableQty+"</td>" +
					"<td id='Cost"+len+"'>"+sku.costPrice+"</td>" +
					"<td id='Del"+len+"'><img id='Img"+len+"' src='"+contextPath+"/images/itemdelete.png' style='width:15%;cursor:pointer;' onclick='deleteItem(this);' title='Delete "+sku.skuId+"'/></td></tr>";
					$("#productsList tbody").append(row);
				}
				
   			}
			else{
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
	   				"<td id='Pack"+len+"' class='Pack' onBlur='changePack(this);' onkeypress='return (this.innerText.length < 10)' contenteditable='true'>1</td>" +
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
	   				"<td id='Pack"+len+"' class='Pack' onBlur='changePack(this);' onkeypress='return (this.innerText.length < 10)' contenteditable='true'>1</td>" +
	   				"<td id='Cost"+len+"'>"+sku.costPrice+"</td>" +
	   				"<td id='Supplied"+len+"' onBlur='changeSuppliedPack(this);' onkeypress='return (this.innerText.length < 10)' contenteditable='true'>1</td><td class='Received' onBlur='changeReceivedPack(this);' onkeypress='return (this.innerText.length < 10)' id='Received"+len+"' contenteditable='true'>1</td>" +
	   				"<td id='Rejected"+len+"' onBlur='changeRejected(this);' onkeypress='return (this.innerText.length < 10)' contenteditable='true'>0</td><td id='Del"+len+"'>" +
	   				"<img id='Img"+len+"' src='"+contextPath+"/images/itemdelete.png' style='width:12%;cursor:pointer;' onclick='deleteItem(this);' title='Delete "+sku.skuId+"'/></td></tr>";
	   				$("#productsList tbody").append(row);
				}
   			
   				
   			}
		 */
		 
		 
		
     changeTotalCost();
	 changeTotalQuantity();
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
		var supplied = parseFloat($('#Supplied'+rowNo).html());
			var receivedVal =  packVal - rejected;
			//$('#Supplied'+rowNo).html(packVal);
			//$('#Received'+rowNo).html(packVal);
			$('#Cost'+rowNo).html(packVal-supplied);
	
	}
	changeTotalCost();
	changeTotalQuantity();
}

function changeReceivedPack(element){
	debugger
	var id = $(element).attr("id");
	var rowNo = id.replace('Supplied','');
	if (isNaN($("#"+id).html()) || $("#"+id).html() == ""){
		var supplied = parseFloat($('#Supplied'+rowNo).html());
		$('#'+id).html(supplied);
	}
	//isNumeric(element);
	var packVal = parseFloat($('#Supplied'+rowNo).html());
	if(packVal<=0){
		alert("Received Quantity should not be empty");
		var supplied = parseFloat($('#Supplied'+rowNo).html());
		var receivedVal = parseFloat($('#Received'+rowNo).html());
		var priceVal = parseFloat($('#Price'+rowNo).html());
		$('#Pack'+rowNo).html(supplied);
		$('#Cost'+rowNo).html(receivedVal*priceVal);
	}else{
		var priceVal = parseFloat($('#Price'+rowNo).html());
		var rejected = parseFloat($('#Rejected'+rowNo).html());
			var receivedVal =  packVal - rejected;
			$('#Supplied'+rowNo).html(packVal);
			$('#Received'+rowNo).html(packVal);
			$('#Cost'+rowNo).html(packVal*priceVal);
	
	}
	changeTotalCost();
	changeTotalQuantity();
}

function changeSuppliedPack(element){
	debugger
	var id = $(element).attr("id");
	var rowNo = id.replace('Supplied','');
	if (isNaN($("#"+id).html()) || $("#"+id).html() == ""){
		var supplied = parseFloat($('#Supplied'+rowNo).html());
		$('#'+id).html(supplied);
	}
	//isNumeric(element);
	var packVal = parseFloat($('#Supplied'+rowNo).html());
	var actualVal = parseFloat($('#ActualQty'+rowNo).html());
	if(packVal<=0){
		alert("Supplied Quantity should not be empty");
		var supplied = parseFloat($('#Supplied'+rowNo).html());
		var receivedVal = parseFloat($('#Received'+rowNo).html());
		var priceVal = parseFloat($('#Price'+rowNo).html());
		$('#Pack'+rowNo).html(supplied);
		$('#Cost'+rowNo).html(receivedVal*priceVal);
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
			var dumpQty = packVal-actualVal;
			//$('#Supplied'+rowNo).html(packVal);
			$('#Dump1'+rowNo).html(dumpQty);
			//$('#Cost'+rowNo).html(packVal*priceVal);
		}
	}
	//changeTotalCost();
	//changeTotalQuantity();
}

function changeIssued(element){
	var id = $(element).attr("id");
	var rowNo = id.replace('Supplied','');
	if (isNaN($("#"+id).html()) || $("#"+id).html() == ""){
		var supplied = $('#Supplied'+rowNo).html();
		$('#'+id).html(supplied);
	}
	//isNumeric(element);
	var packVal = $('#Supplied'+rowNo).html();
	if(packVal<=0){
		alert("Pack should not be empty");
		var supplied = parseFloat($('#Supplied'+rowNo).html());
		var receivedVal = parseFloat($('#Received'+rowNo).html());
		var priceVal = parseFloat($('#Price'+rowNo).html());
		$('#Pack'+rowNo).html(supplied);
		$('#Cost'+rowNo).html(supplied*priceVal);
	}else{
		var priceVal = parseFloat($('#Price'+rowNo).html());
		var rejected = parseFloat($('#Rejected'+rowNo).html());
		if(packVal<rejected){
			alert("Pack cannot be less than Rejected");
			var supplied = parseFloat($('#Supplied'+rowNo).html());
			$('#'+id).html(supplied);
		}
		else{
			var receivedVal =  packVal;
			$('#Supplied'+rowNo).html(packVal);
			$('#Received'+rowNo).html(receivedVal);
			$('#Cost'+rowNo).html(receivedVal*priceVal);
		}
	}
	changeTotalCost();
	changeTotalQuantity();
}

function changeReceived(element){
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
		var rejected = parseFloat($('#Rejected'+rowNo).html());
		if(packVal<rejected){
			alert("Pack cannot be less than Rejected");
			var supplied = parseFloat($('#Supplied'+rowNo).html());
			$('#'+id).html(supplied);
		}
		else{
			var receivedVal =  packVal - supplied;
			$('#Supplied'+rowNo).html(packVal);
			$('#Received'+rowNo).html(receivedVal);
			$('#Cost'+rowNo).html(receivedVal);
		}
	}
	changeTotalCost();
	changeTotalQuantity();
}


function validateOutletStockVerification(operation){
	 //purpose:for checking internet conection
	var online = window.navigator.onLine;
  	if(!online)
  	{
  	alert("check your internet connection,please try agian after some time");
  	return;
  	}
	if($("#outletLocation").val() == ""){
		$("#Error").html("Select Location")	
		focusDiv("Error");
		return;
	}
	debugger
	var location = "";
	if($("#outletLocation").length > 0)
		location = $("#outletLocation").val();
	else
		{
		$("#Error").html("Location Recquired")	
		focusDiv("Error");
		return;
		}

	var flowUnder ="";
	if($("#flowUnder").length > 0)
	flowUnder = $("#flowUnder").val();
	var finalobj = {};
	finalobj.location= location;
	finalobj.productcategory= category;
	finalobj.subcategory= subcategory;
	finalobj.brand= brand;
	finalobj.department= department;
	finalobj.startDateStr= startdate;
	finalobj.endDateStr= enddate;
	finalobj.approvedBy= approvedBy;
	finalobj.flowUnder= flowUnder;
	finalobj.status= status;
	
	
	 var formData = JSON.stringify(finalobj);
	 var contextPath = $("#contextPath").val();
	 URL = contextPath + "/inventorymanager/createstockverification.do";
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





function validateVerification(operation){
	 //purpose:for checking internet conection
	var online = window.navigator.onLine;
  	if(!online)
  	{
  	alert("check your internet connection,please try agian after some time");
  	return;
  	}
		$("#Error").html("");
		debugger
		var finaldata={},items = [];
		var contextPath = $("#contextPath").val();
		finaldata.location = $("#outletLocation").val();
		//finaldata.storage_unit ="All";
		finaldata.masterVerificationCode=$("#master_verification_code").val();
		finaldata.verification_code =$("#verification_code").val();
		//finaldata.verified_by = $("#approvedBy"+idAttr).val()
		finaldata.verifiedDateStr= $("#createdDate").val()+" 00:00:00";
		finaldata.startTime= $("#startTime").val();
		finaldata.endTime= $("#endTime").val();
		//finaldata.endDate=  $("#to").val()+" 00:00:00";
		finaldata.verified_by=  $("#approvedBy").val();
		 var len = $("#productsList tr").length-1;
		 if(len == 0){
           alert("Add Atleast One Item to Receipt");
          	return;
        }
			for(var i=1;i<=len;i++){
				
				var idAttr = $("#productsList tr:eq("+i+") td:last").attr("id");
				idAttr = idAttr.replace('Del','');
				
				obj = {s_no:$("#sno"+idAttr).val(),productCategory:$("#category"+idAttr).val(),subCategory:$("#subCategory"+idAttr).val(),sku_id:$("#skuId"+idAttr).val(),skuSalePrice:$("#saleQty"+idAttr).val(),skuDescription:$("#Desc"+idAttr).text(),skuCostPrice:$("#Price"+idAttr).text(),sku_book_stock:$("#Supplied"+idAttr).text(),sku_physical_stock:$("#Pack"+idAttr).text(),stock_loss:$("#Cost"+idAttr).text(),loss_type:$('option:selected', $('#lossType'+idAttr)).val(),openStock:$("#OpenStock"+idAttr).text(),sku_book_stock:$("#ActualQty"+idAttr).text(),dumpQty:$("#Dump"+idAttr).text(),productRange:$("#Grade"+idAttr).text(),product_book_stock:$("#Supplied"+idAttr).text()};
				items.push(obj);
			}
		console.log(items);
			finaldata.itemsList=items;
			console.log(finaldata);
		if(operation=="new"){
			
		var	URL = contextPath + "/inventorymanager/createVerification.do";
  }else if(operation=="edit"){
	 
  var	URL =  contextPath + "/inventorymanager/updateVerification.do";
  }
  console.log("JSon Format:::"+JSON.stringify(finaldata));
  finaldata = JSON.stringify(finaldata);
		$.ajax({
			type: "POST",
			url : URL,
		    contentType: "application/json",
			data : finaldata,
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







/**
 * @author Sahitya 
 * change totalcost whenever receieved value is changing
 * @param html element
 */
function changeTotalCost(){
	debugger
	var totalCost=0.0;
	$('.Pack').each(function(){
		  var rowNo = $(this).attr("id").replace('Pack','');
	  var cost = $("#Pack"+rowNo).html();
	  var received = $('#Supplied'+rowNo).html();
	  totalCost = parseFloat(cost)-parseFloat(received)+totalCost;
	 });
	$('#Cost').val(totalCost);
	
}

/**
 * @author Sahitya 
 * change totalqty whenever receieved value is changing
 * @param html element
 */
function changeTotalQuantity(){
	var totalQty=0;
	$('.Received').each(function(){
	  var rowNo = $(this).attr("id").replace('Received','');
	  var qty = $("#Received"+rowNo).html();
	  totalQty = parseFloat(qty)+totalQty;
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
  	  			obj = {color:$("#color"+idAttr).val(),size:$("#size"+idAttr).val(),category:$("#category"+idAttr).val(),measurementRange:$("#measureRange"+idAttr).val(),productRange:$("#productRange"+idAttr).val(),brand:$("#brandCode"+idAttr).val(),skuId:$("#skuId"+idAttr).val(),pluCode:$("#pluCode"+idAttr).val(),item:$("#Name"+idAttr).text(),description:$("#Desc"+idAttr).text(),uom:$("#UOM"+idAttr).text(),price:$("#Price"+idAttr).text(),cost:$("#Cost"+idAttr).text(),recieved:$("#Received"+idAttr).text(),rejected:$("#Rejected"+idAttr).text(),supplied:$("#Supplied"+idAttr).text(),quantity:$("#Pack"+idAttr).text(),max_quantity:$("#Pack"+idAttr).text()};
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
  	if(!online)
  	{
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
  	if(!online)
  	{
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
	debugger;
	try{
		 //purpose:for checking internet conection
		var online = window.navigator.onLine;
	  	if(!online)
	  	{
	  	alert("check your internet connection,please try agian after some time");
	  	return;
	  	}
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
				
			"<td style='border: 1px solid #ccc;'><input style='border: none;height: 100%;text-align: center;' class='Pack' id='Pack"+len+"' onblur='changePack(this);'  type='number' value='1' /></td>" +
			"<td><input style='border: none;height: 100%;text-align: center;' id='approvedQty"+len+"'  readonly type='number' value='0' /></td>" +
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
					"<td id='Desc"+len+"'>"+description+"</td><td id='UOM"+len+"'>"+ sell_UOM+ "</td>" +
					"<td id='colour"+len+"'>"+color+"</td>" +
					"<td id='size"+len+"'>"+size+"</td>"+
					"<td class='Price' id='Price"+len+"'>"+sku.skuPriceLists[j].costPrice+"</td>" +
					
//					"<td class='Qoh' id='Qoh"+len+"'>"+sku.skuPriceLists[j].quantityInHand+"</td>" +
//					"<td class='PrvQty' id='PrvQty"+len+"'>0</td>" +
						
					"<td style='border: 1px solid #ccc;'><input style='border: none;height: 100%;text-align: center;' class='Pack' id='Pack"+len+"' onblur='changePack(this);'  type='number' value='1' /></td>" +
					"<td><input style='border: none;height: 100%;text-align: center;' id='approvedQty"+len+"'  readonly type='number' value='0' /></td>" +
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
	 //purpose:for checking internet conection
	var online = window.navigator.onLine;
  	if(!online)
  	{
  	alert("check your internet connection,please try agian after some time");
  	return;
  	}
	 var contextPath = $("#contextPath").val();
	 var storeLocation = "";
	 
	 if( $("#type").val() == "issue")
		 storeLocation = $("#fromLocation").val();
//	 else
//		 storeLocation = $("#tolocation").val();
		 var flowUnder = $("#flowUnder").val();
		 if(flowUnder == "warehouse"){
			 storeLocation = "";
			 URL = contextPath + "/inventorymanager/searchWarehouseProducts.do";
		 }
			
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
	 $("."+searchCategory).html('');
	 var op = '';
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
			     op += '<li id="'+productsList[i].skuID+'" onclick=getId(this,"'+searchCategory+'"); ><a>'+productsList[i].description+'   (SKU ID   -   '+productsList[i].skuID+',   PRICE   -   '+productsList[i].price+')</a></li>';
		 }
	 }
	 $("."+searchCategory).html(op);
	 $("."+searchCategory).show();
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

	 function getSkuDetails(skuId,description){
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
//	 else
//		 storeLocation = $("#tolocation").val();
//	 URL = contextPath + "/inventorymanager/getSkuDetails.do";

 var WarehouseReturnflag=$("#whreturnflag").val();
		if(WarehouseReturnflag == "" || WarehouseReturnflag == undefined || WarehouseReturnflag == null){
			WarehouseReturnflag="";
   		}
	
	 
	 var flowUnder = $("#flowUnder").val();
	 if(flowUnder == "warehouse"){
		 storeLocation = "";
		 URL = contextPath + "/inventorymanager/getWarehouseSkuDetails.do";
	 }
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
				if(skuList.length > 0 && skuList[0].requestedBy != undefined && skuList[0].requestedBy != null && skuList[0].requestedBy != ""){
					$("#requested").val(skuList[0].requestedBy);
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
				 if($("#flowUnder").val()=="warehouse"){
						var row = "<tr id='dynamicdiv"+len+"' style='margin-top:5px;'><td class='slno'>"+slNo+"</td>" +"<td id='Name"+len+"'>"+sku.skuId+"</td>" +
						"<input type='hidden' id='skuId"+len+"' value='"+sku.skuId+"'/>" +
						"<input type='hidden' id='pluCode"+len+"' value='"+sku.pluCode+"'/>" +
						"<input type='hidden' id='category"+len+"' value='"+sku.category+"'/>" +
		    			"<input type='hidden' id='brandCode"+len+"' value='"+sku.brand+"'/>" +
		    			"<input type='hidden' id='productRange"+len+"' value='"+sku.productRange+"'/>" +
		    			"<input type='hidden' id='measureRange"+len+"' value='"+sku.measurementRange+"'/>" +
		    			"<input type='hidden' id='color"+len+"' value='"+sku.color+"'/>" +
		    			"<input type='hidden' id='size"+len+"' value='"+sku.size+"'/>" +
						"<td id='Desc"+len+"'>"+description+"</td><td id='UOM"+len+"'>"+ sell_UOM + "</td>" +
						"<td class='Price' id='Price"+len+"'>"+sku.itemPrice+"</td>" +
						"<td id='Pack"+len+"' class='Pack' >"+sku.quantity+"</td>" +
						
						"<td id='Supplied"+len+"' onBlur='changeIssued(this);' onkeypress='return (this.innerText.length < 10)' contenteditable='true'>1</td>" +
						"<td class='Received' id='Received"+len+"' onBlur='changeReceived(this);' onkeypress='return (this.innerText.length < 10)' contenteditable='true'>1</td>" +
						"<td  id='availableQty"+len+"' >"+availableQty+"</td>" +
						"<td id='Cost"+len+"'>"+cost+"</td>" +
						"<td id='Del"+len+"'><img id='Img"+len+"' src='"+contextPath+"/images/itemdelete.png' style='width:15%;cursor:pointer;' onclick='deleteItem(this);' title='Delete "+sku.skuId+"'/></td></tr>";
						$("#productsList tbody").append(row);
		   			}else{
		   				if($("#flowType").val()=="issue"){
							var row = "<tr id='dynamicdiv"+len+"' style='margin-top:5px;'><td class='slno'>"+slNo+"</td>" +"<td id='Name"+len+"'>"+sku.skuId+"</td>" +
			   				"<input type='hidden' id='skuId"+len+"' value='"+sku.skuId+"'/>" +
			   				"<input type='hidden' id='pluCode"+len+"' value='"+sku.pluCode+"'/>" +
			   				"<input type='hidden' id='category"+len+"' value='"+sku.category+"'/>" +
			    			"<input type='hidden' id='brandCode"+len+"' value='"+sku.brand+"'/>" +
			    			"<input type='hidden' id='productRange"+len+"' value='"+sku.productRange+"'/>" +
			    			"<input type='hidden' id='measureRange"+len+"' value='"+sku.measurementRange+"'/>" +
			    			"<input type='hidden' id='color"+len+"' value='"+sku.color+"'/>" +
			    			"<input type='hidden' id='size"+len+"' value='"+sku.size+"'/>" +
			   				"<td id='Desc"+len+"'>"+description+"</td><td id='UOM"+len+"'>"+ sell_UOM + "</td>" +
			   				"<td class='Price' id='Price"+len+"'>"+sku.itemPrice+"</td>" +
			   				"<td id='Pack"+len+"' class='Pack' onBlur='changePack(this);' onkeypress='return (this.innerText.length < 10)' contenteditable='true'>1</td>" +
			   				
			   				"<td id='Supplied"+len+"' contenteditable='true'>1</td><td class='Received' id='Received"+len+"' contenteditable='true'>1</td>" +
			   				"<td  id='availableQty"+len+"' >"+availableQty+"</td>" +
			   				"<td id='Cost"+len+"'>"+sku.itemPrice+"</td>" +
			   				"<td id='Del"+len+"'>" +
			   				"<img id='Img"+len+"' src='"+contextPath+"/images/itemdelete.png' style='width:12%;cursor:pointer;' onclick='deleteItem(this);' title='Delete "+sku.skuId+"'/></td></tr>";
			   				$("#productsList tbody").append(row);
						}
						else{
							var row = "<tr id='dynamicdiv"+len+"' style='margin-top:5px;'><td class='slno'>"+slNo+"</td>" +"<td id='Name"+len+"'>"+sku.skuId+"</td>" +
							"<input type='hidden' id='skuId"+len+"' value='"+sku.skuId+"'/>" +
							"<input type='hidden' id='pluCode"+len+"' value='"+sku.pluCode+"'/>" +
							"<input type='hidden' id='category"+len+"' value='"+sku.category+"'/>" +
			    			"<input type='hidden' id='brandCode"+len+"' value='"+sku.brand+"'/>" +
			    			"<input type='hidden' id='productRange"+len+"' value='"+sku.productRange+"'/>" +
			    			"<input type='hidden' id='measureRange"+len+"' value='"+sku.measurementRange+"'/>" +
			    			"<input type='hidden' id='color"+len+"' value='"+sku.color+"'/>" +
			    			"<input type='hidden' id='size"+len+"' value='"+sku.size+"'/>" +
							"<td id='Desc"+len+"'>"+description+"</td><td id='UOM"+len+"'>"+ sell_UOM + "</td>" +
							"<td class='Price' id='Price"+len+"'>"+sku.itemPrice+"</td>" +
							"<td id='Pack"+len+"' class='Pack' onBlur='changePack(this);' onkeypress='return (this.innerText.length < 10)' contenteditable='true' >"+quantity+"</td>" +
							"<td id='Cost"+len+"'>"+cost+"</td>" +
							"<td id='Supplied"+len+"' contenteditable='true'>"+quantity+"</td><td class='Received' id='Received"+len+"' contenteditable='true'>"+quantity+"</td>" +
							"<td id='Rejected"+len+"' onBlur='changeRejected(this);' onkeypress='return (this.innerText.length < 10)' contenteditable='true'>0</td><td id='Del"+len+"'>" +
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
				var sell_UOM = sku.uom;
				if(sell_UOM == "" || sell_UOM == null)                      
					sell_UOM = "";
				var slNo = 1; 
				 $('.slno').each(function(){
					$(this).text(slNo);
					slNo = parseInt(slNo) + 1;
				});
				 var cost = parseFloat(quantity) * parseFloat(sku.price);
				var row = "<tr id='dynamicdiv"+len+"' style='margin-top:5px;'><td class='slno'>"+slNo+"</td>" +"<td id='Name"+len+"'>"+sku.skuId+"</td>" +
				"<input type='hidden' id='skuId"+len+"' value='"+sku.skuId+"'/>" +
				"<input type='hidden' id='pluCode"+len+"' value='"+sku.pluCode+"'/>" +
				"<input type='hidden' id='category"+len+"' value='"+sku.category+"'/>" +
    			"<input type='hidden' id='brandCode"+len+"' value='"+sku.brand+"'/>" +
    			"<input type='hidden' id='productRange"+len+"' value='"+sku.productRange+"'/>" +
    			"<input type='hidden' id='measureRange"+len+"' value='"+sku.measurementRange+"'/>" +
    			"<input type='hidden' id='color"+len+"' value='"+sku.color+"'/>" +
    			"<input type='hidden' id='size"+len+"' value='"+sku.size+"'/>" +
				"<td id='Desc"+len+"'>"+description+"</td><td id='UOM"+len+"'>"+ sell_UOM + "</td>" +
				"<td class='Price' id='Price"+len+"'>"+sku.price+"</td>" +
				"<td id='Pack"+len+"' class='Pack' onBlur='changePack(this);' onkeypress='return (this.innerText.length < 10)' contenteditable='true'>"+quantity+"</td>" +
				"<td id='Cost"+len+"'>"+cost+"</td>" +
				"<td id='Supplied"+len+"' onBlur='changeSuppliedPack(this);' onkeypress='return (this.innerText.length < 10)' contenteditable='true' >"+quantity+"</td><td class='Received' onBlur='changeReceivedPack(this);' onkeypress='return (this.innerText.length < 10)' id='Received"+len+"'>"+quantity+"</td>" +
				"<td id='Rejected"+len+"' onBlur='changeRejected(this);' onkeypress='return (this.innerText.length < 10)' contenteditable='true'>0</td><td id='Del"+len+"'>" +
				"<img id='Img"+len+"' src='"+contextPath+"/images/itemdelete.png' style='width:15%;cursor:pointer;' onclick='deleteItem(this);' title='Delete "+sku.skuId+"'/></td></tr>";
				$("#productsList tbody").append(row);
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
		
		
		function changeStockQty(element){
			debugger
			var id = $(element).attr("id");
			if (isNaN($("#"+id).html()) || $("#"+id).html() == "")
				$('#'+id).html("0");
			var rowNo = id.replace('skuPhyStock','');
			//isNumeric(element);
			var packVal = parseFloat($('#skuPhyStock'+rowNo).html());
			var dumpQty= parseFloat($('#dumpQty'+rowNo).html());
			if(packVal<=0){
				var priceVal = parseFloat($('#Price'+rowNo).html());
				$('#skuPhyStock'+rowNo).html(0);
				$('#declaredQty'+rowNo).html(0);
				$('#closedStock'+rowNo).html(0);
				$('#dumpQty'+rowNo).html(0);
			}
			else{
				if(packVal<dumpQty)
				{
				alert("actual stock should greater than dump");
				var packVal = parseFloat($('#skuPhyStock'+rowNo).html());
				$('#skuPhyStock'+rowNo).html(dumpQty);
				$('#closedStock'+rowNo).html(0);
				}
			
			else{
				var priceVal = parseFloat($('#skuPhyStock'+rowNo).html());
				var dumpQty= parseFloat($('#dumpQty'+rowNo).html());
				$('#closedStock'+rowNo).html(priceVal-dumpQty);
				/*var tax = parseFloat($('#tax'+rowNo).html());
				$('#tax'+rowNo).html(packVal*tax);*/
			}
			}
		}
		
		
		function changeDumpQty(element){
			var id = $(element).attr("id");
			if (isNaN($("#"+id).html()) || $("#"+id).html() == "")
				$('#'+id).html("0");
			var rowNo = id.replace('dumpQty','');
			//isNumeric(element);
			var packVal = parseFloat($('#dumpQty'+rowNo).html());
			var phyStock = parseFloat($('#skuPhyStock'+rowNo).html());
			
			if(packVal>phyStock)
				{
				alert("dump qty should not be  greater than dump qty");
				$('#dumpQty'+rowNo).html(phyStock);
				$('#closedStock'+rowNo).html(0);
				}
			else
				{
			
				var priceVal = parseFloat($('#skuPhyStock'+rowNo).html());
				var dumpQty= parseFloat($('#dumpQty'+rowNo).html());
				$('#closedStock'+rowNo).html(priceVal-dumpQty);
				/*var tax = parseFloat($('#tax'+rowNo).html());
				$('#tax'+rowNo).html(packVal*tax);*/
				}
			
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
		 

 
 