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

function addItem(sku){
	 var contextPath = $("#contextPath").val();
	 var len = parseInt($("#productsList tr").length);
		if (len != 1)
			len = parseInt($("#productsList tr:last").attr("id").replace('dynamicdiv', '')) + 1;
		for (var i = 1; i <= len; i++) {
			if ($("#skuId" + i).val() == sku.skuId && $("#Price"+i).text() == sku.price) {
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
		var description = null;
		if (sku.description != "" && sku.description != null)
			description = sku.description;
		else
			description = $("#desc").val();
		var sell_UOM = sku.sell_UOM;
		if(sell_UOM == "" || sell_UOM == null)                      
			sell_UOM = "_";
		var slNo = 1; 
		 $('.slno').each(function(){
			$(this).text(slNo);
			slNo = parseInt(slNo) + 1;
		});
			if($("#flowUnder").val()=="warehouse"){
				var row = "<tr id='dynamicdiv"+len+"' style='margin-top:5px;'><td class='slno'>"+slNo+"</td>" +"<td id='Name"+len+"'>"+sku.skuId+"</td>" +
				"<input type='hidden' id='skuId"+len+"' value='"+sku.skuId+"'/>" +
				"<input type='hidden' id='pluCode"+len+"' value='"+sku.pluCode+"'/>" +
				"<td id='Desc"+len+"'>"+description+"</td><td id='UOM"+len+"'>"+ sell_UOM + "</td>" +
				"<td class='Price' id='Price"+len+"'>"+sku.price+"</td>" +
				"<td id='Pack"+len+"' class='Pack' >1</td>" +
				"<td id='Cost"+len+"'>"+sku.price+"</td>" +
				"<td id='Supplied"+len+"' onBlur='changeIssued(this);' onkeypress='return (this.innerText.length < 10)' contenteditable='true'>1</td><td class='Received' id='Received"+len+"' onBlur='changeReceived(this);' onkeypress='return (this.innerText.length < 10)' contenteditable='true'>1</td>" +
				"<td id='Del"+len+"'><img id='Img"+len+"' src='"+contextPath+"/images/itemdelete.png' style='width:15%;cursor:pointer;' onclick='deleteItem(this);' title='Delete "+sku.skuId+"'/></td></tr>";
				$("#productsList tbody").append(row);
   			}else{
   				
   				var row = "<tr id='dynamicdiv"+len+"' style='margin-top:5px;'><td class='slno'>"+slNo+"</td>" +"<td id='Name"+len+"'>"+sku.skuId+"</td>" +
   				"<input type='hidden' id='skuId"+len+"' value='"+sku.skuId+"'/>" +
   				"<input type='hidden' id='pluCode"+len+"' value='"+sku.pluCode+"'/>" +
   				"<td id='Desc"+len+"'>"+description+"</td><td id='UOM"+len+"'>"+ sell_UOM + "</td>" +
   				"<td class='Price' id='Price"+len+"'>"+sku.price+"</td>" +
   				"<td id='Pack"+len+"' class='Pack' onBlur='changePack(this);' onkeypress='return (this.innerText.length < 10)' contenteditable='true'>1</td>" +
   				"<td id='Cost"+len+"'>"+sku.price+"</td>" +
   				"<td id='Supplied"+len+"' contenteditable='true'>1</td><td class='Received' id='Received"+len+"' contenteditable='true'>1</td>" +
   				"<td class='Rejected' id='Rejected"+len+"' onBlur='changeRejected(this);' onkeypress='return (this.innerText.length < 10)' contenteditable='true'>0</td><td id='Del"+len+"'>" +
   				"<img id='Img"+len+"' src='"+contextPath+"/images/itemdelete.png' style='width:15%;cursor:pointer;' onclick='deleteItem(this);' title='Delete "+sku.skuId+"'/></td></tr>";
   				$("#productsList tbody").append(row);
   				
   			}
		 
		 
		 
		
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
	changeTotalRejectedQty();
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
	var packVal = parseInt($('#Pack'+rowNo).html());
	if(packVal<=0){
		alert("Pack should not be empty");
		var supplied = parseInt($('#Supplied'+rowNo).html());
		var receivedVal = parseInt($('#Received'+rowNo).html());
		var priceVal = parseFloat($('#Price'+rowNo).html());
		$('#Pack'+rowNo).html(supplied);
		$('#Cost'+rowNo).html(receivedVal*priceVal);
	}else{
		var priceVal = parseFloat($('#Price'+rowNo).html());
		var rejected = parseInt($('#Rejected'+rowNo).html());
		if(packVal<rejected){
			alert("Pack cannot be less than Rejected");
			var supplied = parseInt($('#Supplied'+rowNo).html());
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
		var supplied = parseInt($('#Supplied'+rowNo).html());
		var receivedVal = parseInt($('#Received'+rowNo).html());
		var priceVal = parseFloat($('#Price'+rowNo).html());
		$('#Pack'+rowNo).html(supplied);
		$('#Cost'+rowNo).html(supplied*priceVal);
	}else{
		var priceVal = parseFloat($('#Price'+rowNo).html());
		var rejected = parseInt($('#Rejected'+rowNo).html());
		if(packVal<rejected){
			alert("Pack cannot be less than Rejected");
			var supplied = parseInt($('#Supplied'+rowNo).html());
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
		var supplied = parseInt($('#Supplied'+rowNo).html());
		$('#'+id).html(supplied);
	}
	//isNumeric(element);
	var packVal = parseInt($('#Pack'+rowNo).html());
	if(packVal<=0){
		alert("Pack should not be empty");
		var supplied = parseInt($('#Supplied'+rowNo).html());
		var receivedVal = parseInt($('#Received'+rowNo).html());
		var priceVal = parseFloat($('#Price'+rowNo).html());
		$('#Pack'+rowNo).html(supplied);
		$('#Cost'+rowNo).html(receivedVal*priceVal);
	}else{
		var priceVal = parseFloat($('#Price'+rowNo).html());
		var rejected = parseInt($('#Rejected'+rowNo).html());
		if(packVal<rejected){
			alert("Pack cannot be less than Rejected");
			var supplied = parseInt($('#Supplied'+rowNo).html());
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
	  totalCost = parseFloat(cost)*parseInt(received)+totalCost;
	 });
	$('#totalCost').val(totalCost);
	
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
	 
	  totalQty = parseInt(qty)+totalQty;
	 });
	$('#totalQty').val(totalQty);
	$('#totalReceived').val(totalQty);
	if($("#totalRejected").val()=='')
	$("#totalRejected").val(0);
	
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
	/*var totalRejectedVal=0;*/
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
			/*$("#totalRejected").val(0);*/
			$(element).html(0);
			$('#Received'+rowNo).html(suppliedVal);
		}
	}else{
		$('#Received'+rowNo).html(suppliedVal);
	}
	var cost = parseFloat($("#Price"+rowNo).html());
	var received = parseFloat($('#Received'+rowNo).html());
	
	$("#totalRejected").val(parseInt($("#totalRejected").val())+parseInt(rejectedVal));
	$('#Cost'+rowNo).html(cost*received);
	changeTotalRejectedQty();
	changeTotalCost();
	changeTotalQuantity();

}


function changeTotalRejectedQty(){
	var totalRejectedQty=0;
	
	$('.Rejected').each(function(){
		
		  var rowNo = $(this).attr("id").replace('Rejected','');
		  var qty = $("#Rejected"+rowNo).html();
		 
		  totalRejectedQty = parseInt(qty)+totalRejectedQty;
		 
		 });
	$('#totalRejected').val(totalRejectedQty);
	
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
  	  		if($("#flowUnder").val()=='warehouse'){
  	    	  	
  	  	  		obj = {skuId:$("#skuId"+idAttr).val(),pluCode:$("#pluCode"+idAttr).val(),item:$("#Name"+idAttr).text(),description:$("#Desc"+idAttr).text(),UOM:$("#UOM"+idAttr).text(),price:$("#Price"+idAttr).text(),cost:$("#Cost"+idAttr).text(),actualQty:$("#Received"+idAttr).text(),quantity:$("#Supplied"+idAttr).text(),indentQty:$("#Pack"+idAttr).text()};
  	  	  		}
  	  		else
  	  			obj = {skuId:$("#skuId"+idAttr).val(),pluCode:$("#pluCode"+idAttr).val(),item:$("#Name"+idAttr).text(),description:$("#Desc"+idAttr).text(),UOM:$("#UOM"+idAttr).text(),price:$("#Price"+idAttr).text(),cost:$("#Cost"+idAttr).text(),recieved:$("#Received"+idAttr).text(),rejected:$("#Rejected"+idAttr).text(),issued:$("#Supplied"+idAttr).text(),quantity:$("#Pack"+idAttr).text(),max_quantity:$("#Pack"+idAttr).text()};
  	  		}
  	  		finalObj.itemDetails.push(obj);
  	}
  	return finalObj;
}
function getstockIssueSummary(id){
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
	// var materialName = $('#searchCriteria').val();
	 $("#desc").val(description);
	 var contextPath = $("#contextPath").val();
	 var storeLocation = "";
	 if( $("#type").val() == "issue")
		 storeLocation = $("#fromLocation").val();
//	 else
//		 storeLocation = $("#tolocation").val();
//	 URL = contextPath + "/inventorymanager/getSkuDetails.do";
	 
	 var flowUnder = $("#flowUnder").val();

var WarehouseReturnflag=$("#whreturnflag").val();
                if(WarehouseReturnflag == "" || WarehouseReturnflag == undefined || WarehouseReturnflag == null){
                        WarehouseReturnflag="";
                   }

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
						"<td id='Desc"+len+"'>"+description+"</td><td id='UOM"+len+"'>"+ sell_UOM + "</td>" +
						"<td class='Price' id='Price"+len+"'>"+sku.itemPrice+"</td>" +
						"<td id='Pack"+len+"' class='Pack' contenteditable='true' >"+sku.quantity+"</td>" +
						"<td id='Cost"+len+"'>"+cost+"</td>" +
						"<td id='Supplied"+len+"' contenteditable='true' onBlur='changeIssued(this);' onkeypress='return (this.innerText.length < 10)' >1</td><td class='Received' id='Received"+len+"' onBlur='changeReceived(this);' onkeypress='return (this.innerText.length < 10)' contenteditable='true'>1</td>" +
						"<td id='Del"+len+"'><img id='Img"+len+"' src='"+contextPath+"/images/itemdelete.png' style='width:15%;cursor:pointer;' onclick='deleteItem(this);' contenteditable='true' title='Delete "+sku.skuId+"'/></td></tr>";
						$("#productsList tbody").append(row);
		   			}else{
				 
				
		   				var row = "<tr id='dynamicdiv"+len+"' style='margin-top:5px;'><td class='slno'>"+slNo+"</td>" +"<td id='Name"+len+"'>"+sku.skuId+"</td>" +
						"<input type='hidden' id='skuId"+len+"' value='"+sku.skuId+"'/>" +
						"<input type='hidden' id='pluCode"+len+"' value='"+sku.pluCode+"'/>" +
						"<td id='Desc"+len+"'>"+description+"</td><td id='UOM"+len+"'>"+ sell_UOM + "</td>" +
						"<td class='Price' id='Price"+len+"'>"+sku.itemPrice+"</td>" +
						"<td id='Pack"+len+"' class='Pack' onBlur='changePack(this);' onkeypress='return (this.innerText.length < 10)' contenteditable='true' >"+quantity+"</td>" +
						"<td id='Cost"+len+"'>"+cost+"</td>" +
						"<td id='Supplied"+len+"' contenteditable='true'>"+quantity+"</td><td class='Received' id='Received"+len+"' contenteditable='true'>"+quantity+"</td>" +
						"<td id='Rejected"+len+"' onBlur='changeRejected(this);' onkeypress='return (this.innerText.length < 10)' contenteditable='true'>0</td><td id='Del"+len+"'>" +
						"<img id='Img"+len+"' src='"+contextPath+"/images/itemdelete.png' style='width:20px;cursor:pointer;' onclick='deleteItem(this);' title='Delete "+sku.skuId+"'/></td></tr>";
						$("#productsList tbody").append(row);
			}
			}
			changeTotalCost();
			changeTotalQuantity();
		}
		
		
		function searchGoodsIssue(name, searchCategory){
			var issueToLocation = $("#tolocation").val();
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
				"<td id='Supplied"+len+"' contenteditable='true' >"+quantity+"</td><td class='Received' id='Received"+len+"'>"+quantity+"</td>" +
				"<td id='Rejected"+len+"' onBlur='changeRejected(this);' onkeypress='return (this.innerText.length < 10)' contenteditable='true'>0</td><td id='Del"+len+"'>" +
				"<img id='Img"+len+"' src='"+contextPath+"/images/itemdelete.png' style='width:15%;cursor:pointer;' onclick='deleteItem(this);' title='Delete "+sku.skuId+"'/></td></tr>";
				$("#productsList tbody").append(row);
			}
			changeTotalCost();
			changeTotalQuantity();
		}
		

		function issuetooutlets(id,flag){
			 
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
						flag : flag
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
		 		$('.saveall').each(function(){
		 			 var stockissueobj = {},stockReqobj = {},itemDetails=[], skuId = [], Qty = [],issued = [];
		 			var srid= $(this).attr("id");
		 	 		skuId.push($("#itemwise").val());
		 	 		Qty.push($("#actualQty"+srid).text());
		 	 		issued.push($("#Issued"+srid).text());
		 	 		 stockissueobj.issued = issued;
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
		
		
		
		