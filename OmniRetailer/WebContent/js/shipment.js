

function searchSalesOrders(searchName, searchCategory){
	 //purpose:for checking internet conection
	var online = window.navigator.onLine;
  	if(!online)
  	{
  	alert("check your internet connection,please try agian after some time");
  	return;
  	}
	var location = $("#shipmentFrom option:selected").text();
	var shipmentMode = $("#transportMode").val();
	var contextPath = $('#contextPath').val();
	 var URL = contextPath + "/orderManagement/searchSalesOrders.do";
	 $.ajax({
		type : "GET",
		url : URL,
		data : {
			location : location,
			searchName : searchName,
			shipmentMode : shipmentMode
		},
		beforeSend: function(xhr){                    
	   		$("#loading").css("display","block");
	   		$("#mainDiv").addClass("disabled");
	   	},
		success : function(result){
			appendSalesOrderIds(result,searchCategory);
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

function getOrderForShipment(orderId){
	 //purpose:for checking internet conection
	var online = window.navigator.onLine;
  	if(!online)
  	{
  	alert("check your internet connection,please try agian after some time");
  	return;
  	}
	var orderedItemsCount = 0;
	$(".orderId").each(function(){
		if($(this).text() == orderId)
			orderedItemsCount = parseInt(orderedItemsCount) + 1;
	});
	if(orderedItemsCount > 0){
		alert("This Order is already added");
		return ;
	}
	var contextPath = $('#contextPath').val();
	 var URL = contextPath + "/orderManagement/getOrderForShipment.do";
	 $.ajax({
		type : "GET",
		url : URL,
		data : {
			orderId : orderId
		},
		beforeSend: function(xhr){                    
	   		$("#loading").css("display","block");
	   		$("#mainDiv").addClass("disabled");
	   	},
		success : function(result){
			appendSalesOrders(result);
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

function appendSalesOrders(orderDetails){
	 //purpose:for checking internet conection
	var online = window.navigator.onLine;
  	if(!online)
  	{
  	alert("check your internet connection,please try agian after some time");
  	return;
  	}
	var parsedJson = jQuery.parseJSON(orderDetails);
	 var contextPath = $("#contextPath").val();
	 var len = parseInt($("#productsList tr").length);
		if (len != 1)
			len = parseInt($("#productsList tr:last").attr("id").replace('dynamicdiv', '')) + 1;
	 for(var i=0;i<parsedJson.itemDetails.length;i++){
		 var slNo = 1; 
		 $('.slno').each(function(){
			$(this).text(slNo);
			slNo = parseInt(slNo) + 1;
		});
		 var make = parsedJson.itemDetails[i].make;
		if(make == undefined || make == "" || make == null)
			make = "_";
		var model = parsedJson.itemDetails[i].model;
		if(model == undefined || model == "" || model == null)
			model = "_";
		var color = parsedJson.itemDetails[i].colour;
		if(color == undefined || color == "" || color == null)
			color = "_";
		var size = parsedJson.itemDetails[i].size;
		if(size == undefined || size == "" || size == null)
			size = "_";
		var pluCode = parsedJson.itemDetails[i].pluCode;
		if(pluCode == undefined || pluCode == null)
			pluCode = "";
		 var row = "<tr id='dynamicdiv"+len+"' style='margin-top:5px;'><td class='slno'>"+slNo+"</td><td class='orderId' id='orderId"+len+"'>"+parsedJson.orderId+"</td><td id='itemId"+len+"'>"+parsedJson.itemDetails[i].item_id+"</td>" +
	 		"<input type='hidden' id='skuId"+len+"' value='"+parsedJson.itemDetails[i].skuId+"'/>" +
	 		"<input type='hidden' id='pluCode"+len+"' value='"+pluCode+"'/>" +
	 		"<input type='hidden' id='shipmentChrg"+len+"' value='"+parsedJson.shipmentCharges+"'/>" +
	 		"<input type='hidden' class='taxRate' id='taxValue"+len+"' value='"+parsedJson.itemDetails[i].taxValue+"'/>" +
		"<td id='itemName"+len+"'>"+parsedJson.itemDetails[i].item_name+"</td><td class='Price' id='itemPrice"+len+"'>"+parsedJson.itemDetails[i].item_price+"</td>" +
		"<input type='hidden' id='ordered"+len+"' value='"+parsedJson.itemDetails[i].ordered_quantity+"'/>" +
		"<td id='orderedQuantity"+len+"' class='Pack' onkeypress='return (this.innerText.length < 10)' onBlur='changePack(this);'" +
		" contenteditable='true'>"+parsedJson.itemDetails[i].ordered_quantity+"" +
		"</td><td class='cost' id='totalCost"+len+"'>"+parsedJson.itemDetails[i].total_cost+"</td>" +
		"<td id='make"+len+"'>"+make+"</td><td id='model"+len+"'>"+model+"</td><td id='colour"+len+"'>"+color+"</td>" +
		"<td id='size"+len+"'>"+size+"</td><td id='Del"+ len +"' ><img id='Img"+ len +"' src='"+contextPath+"/images/itemdelete.png' style='width:25px;cursor:pointer;' onclick='deleteItem(this);' title='Delete "+parsedJson.itemDetails[i].item_name+"'/>" +
		"</td></tr>";
		$("#productsList tbody").append(row);
	 }
	 
	 	var locationLen = parseInt($("#locationsList tr").length);
		if (locationLen != 0)
			locationLen = parseInt($("#locationsList tr:last").attr("id").replace('country', '')) + 1;
		else
			locationLen = 1;
		var rowLoc = "<tr id='div"+locationLen+"' style='margin-top:5px;'><td class='slnoLoc'></td><td class='orderIdLoc' id='orderIdLoc"+locationLen+"'>"+parsedJson.orderId+"</td><td id='plotNumber"+locationLen+"'>"+parsedJson.shipement_address_doorNo+"</td>" +
		"<td id='streetName"+locationLen+"'>"+parsedJson.shipement_address_street+"</td><td id='location"+locationLen+"'>"+parsedJson.shipement_address_location+"</td>" +
		"<td id='city"+locationLen+"'>"+parsedJson.shipement_address_city+"</td><td id='zip"+locationLen+"'></td>" +
		"<td id='state"+locationLen+"'></td><td id='country"+locationLen+"'></td></tr>";
		$("#locationsList tbody").append(rowLoc);
	 
	 if(parsedJson.shipmentCharges != undefined && parsedJson.shipmentCharges != null && parsedJson.shipmentCharges != ""){
		 var shipmentCharges = 0;
		 if($('#shipmentCharges').val()!="")
			 shipmentCharges = $("#shipmentCharges").val();
		 shipmentCharges = parseFloat(shipmentCharges) + parseFloat(parsedJson.shipmentCharges);
		 $("#shipmentCharges").val(shipmentCharges);
	 }
	 changeTotalCost();
	// $("#totalTax").val(parsedJson.orderTax);
		//$("#totalOrderValues").text(parsedJson.orderTotalCost);
}

function clearSalesOrders(){
	$("#salesOrders").val("");
}

function deleteItem(element){
	var id = $(element).attr("id").replace('Img','');
	var orderId = $("#orderId"+id).text();
	var orderedItemsCount = 0;
	$(".orderId").each(function(){
		if($(this).text() == orderId)
			orderedItemsCount = parseInt(orderedItemsCount) + 1;
	});
	if(orderedItemsCount == 1){
		var shipmentCharges = $("#shipmentChrg"+id).val();
		if(shipmentCharges != undefined && shipmentCharges != null && shipmentCharges != ""){
			var totalShipmentCharges = $("#shipmentCharges").val();
			if(totalShipmentCharges != "")
				totalShipmentCharges = parseFloat(totalShipmentCharges) - parseFloat(shipmentCharges);
			$("#shipmentCharges").val(totalShipmentCharges);
		}
		$(".orderIdLoc").each(function(){
			if($(this).text() == orderId){
				var locationLen = parseInt($("#locationsList tr:last").attr("id").replace('country', '')) + 1;
				$("#div"+locationLen).remove();
			}
		});
	}
	$('#dynamicdiv'+id).remove();
	changeTotalCost();
}

function changePack(element){
	var id = $(element).attr("id");
	if (isNaN($("#"+id).html()) || $("#"+id).html() == "")
		$('#'+id).html("1");
	var rowNo = id.replace('orderedQuantity','');
	var packVal = parseInt($('#orderedQuantity'+rowNo).html());
	var orderedVal = parseInt($("#ordered"+rowNo).val());
	if(packVal>orderedVal){
		alert("You cant ship more than "+orderedVal);
		$('#orderedQuantity'+rowNo).html(orderedVal);
		return;
	}
	if(packVal<=0){
		alert("Quantity should not be empty");
		var priceVal = parseFloat($('#itemPrice'+rowNo).html());
		$('#orderedQuantity'+rowNo).html(1);
		$('#totalCost'+rowNo).html(priceVal);
	}else{
		var priceVal = parseFloat($('#itemPrice'+rowNo).html());
		$('#totalCost'+rowNo).html(packVal*priceVal);
		changeTotalCost();
	}
}

function changeTotalCost(){
	/*var totalCost=0.0;
	$('.cost').each(function(){
	  var productName = $(this).attr("id").replace('totalCost','');
	  var cost = $("#totalCost"+productName).html();
	  totalCost = totalCost + parseFloat(cost);
	 });
	$('#orderTotalCost').val(totalCost);*/
	var totalCost=0.0;
	var tax=0.0;
	$('.cost').each(function(){
	  var productName = $(this).attr("id").replace('totalCost','');
	  var cost = $("#totalCost"+productName).html();
	  totalCost = totalCost + parseFloat(cost);
	 });
	 $("#subTotal").val(totalCost);
	var i = 1;
	var totalTax = 0;
	// assuming tax as 10%, formula------
	// subtotal = total*100/(100+tax)
	//	var subtotal = (totalCost*100)/(100+10);
	//	tax = totalCost - subtotal;
	/*$('.taxRate').each(function(){
		  var taxRate = $(this).html();
		  var subtotal = (totalCost*100)/(100+parseInt(taxRate));
		  tax = totalCost - subtotal;
		  tax = tax.toFixed(2);
		  totalTax = totalTax + parseFloat(tax);
		  $("#orderTax"+i).val(tax);
		  i=i+1;
		 });*/
	$('.taxRate').each(function(){
		  tax = parseFloat($(this).val());
		  totalTax = totalTax + tax;
	});
	$("#totalTax").val(totalTax);
	var shipmentCost = $("#shipmentCharges").val();
	 if($('#shipmentCharges').val()!="")
		 totalCost = totalCost + parseFloat(shipmentCost);
	//$("#totalTax").val(totalTax);
	$('#totalOrderValues').text(totalCost + totalTax);
}

function appendSalesOrderIds(orderIdsList,searchCategory){
	 $("."+searchCategory).html('');
	 var op = '';
	 for(var i=0;i<orderIdsList.length;i++){
			 if (i == 0) {
				 op += '<li id="'+orderIdsList[i]+'"  class="selected" onclick=getId(this,"'+searchCategory+'"); ><a>'+orderIdsList[i]+'</a></li>';
			}else
			     op += '<li id="'+orderIdsList[i]+'" onclick=getId(this,"'+searchCategory+'"); ><a>'+orderIdsList[i]+'</a></li>';
	 }
	 $("."+searchCategory).html(op);
	 $("."+searchCategory).show();
}

function getId(ele,searchCategory){
	var id= $(ele).attr("id");
	$("#"+searchCategory).val(id);
	getOrderForShipment(id);
}


function viewShipmentDetails(shipmentId,operation){
	 //purpose:for checking internet conection
	var online = window.navigator.onLine;
  	if(!online)
  	{
  	alert("check your internet connection,please try agian after some time");
  	return;
  	}
	var type = $("#type").val();
	var location = "";
	if($("#outletLocation").length > 0)
		location = $("#outletLocation").val();
	var flowUnder = "";
	if($("#flowUnder").length > 0)
    	flowUnder = $("#flowUnder").val();
	var status = "";
	if($("#status").length > 0)
		status = $("#status").val();
	var contextPath = $('#contextPath').val();
 	var URL = contextPath + "/orderManagement/viewShipmentDetails.do";
 		$.ajax({
   		url : URL,
   		data : {
   			shipmentId : shipmentId,
   			operation : operation,
   			flowUnder : flowUnder
   		},
   		beforeSend: function(xhr){                    
   			$("#loading").css("display","block");
   			$("#mainDiv").addClass("disabled");
   		  },
   		success : function(result){
   			$("#right-side").html(result);
   			$("#type").val(type);
   			$("#outletLocation").val(location);
//			$("#flowUnder").val(flowUnder);
			$("#status").val(status);
   			$("#loading").css("display","none");
   			$("#mainDiv").removeClass("disabled");
   		},
   		error : function(){
   			alert("Something went wrong");
   			$("#loading").css("display","none");
			$("#mainDiv").removeClass('disabled');
   		}
   	 });
}

		/*function viewEditShipmentDetails(shipmentId){
			var contextPath = $('#contextPath').val();
		 	var URL = contextPath + "/inventorymanager/editShipmentDetails.do";
		 		$.ajax({
		   		url : URL,
		   		data : {
		   			shipmentId : shipmentId,
		   		},
		   		beforeSend: function(xhr){                    
		   			$("#loading").css("display","block");
		   			$("#mainDiv").addClass("disabled");
		   		  },
		   		success : function(result){
		   			$("#right-side").html(result);
		   			$("#loading").css("display","none");
		   			$("#mainDiv").removeClass("disabled");
		   		},
		   		error : function(){
		   			alert("Something went wrong");
		   			$("#loading").css("display","none");
					$("#mainDiv").removeClass('disabled');
		   		}
		   	 });
		}
*/
/*function viewShipmentsByLocation(){
	var contextPath = $('#contextPath').val();
 	var URL = contextPath + "/inventorymanager/viewShipmentsByLocation.do";
 	var location = "";
 	if($("#warehouse_location").length)
 		location = $("#warehouse_location").val();
 	    $.ajax({
   		url : URL,
   		data : {
   			location : location
   		},
   		beforeSend: function(xhr){                    
	   		$("#loading").css("display","block");
	   		$("#mainDiv").addClass("disabled");
	   	},
   		success : function(result){
   			$("#right-side").html(result);
   			$("#loading").css("display","none");
   			$("#mainDiv").removeClass('disabled');
   		},
   		error : function(){
   			alert("Something went wrong");
   			$("#loading").css("display","none");
			$("#mainDiv").removeClass('disabled');
   		}
   	 });
   }*/

/*function changeTotalQuantity(){
	var totalQty=0;
	$('.Pack').each(function(){
	  var productName = $(this).attr("id").replace('orderedQuantity','');
	  var qty = $("#orderedQuantity"+productName).html();
	  	totalQty = parseInt(qty)+totalQty;
	 });
	if($("#totalQty").length){
		$('#totalQty').val(totalQty);
	}
}*/

function validateShipment(type){
	 var re = /^[0-9/]+$/;
	 if($("#date").val().trim() == ""){
			$("#shipmentDateError").html("Enter a Date");
			return;
	 }
	 if(!re.test($("#date").val())){
			$("#shipmentDateError").html("Invalid Date");
			return;
	 }
	 if($("#error").text() != ""){
		 $("#phoneNumber").val("");
		 $("#error").text("");
		 return false;
	 }
	 var defaultCountry = $("#defaultCountry").val().trim();
	 var phoneNumber = $("#phoneNumber").val().trim();
	 if(defaultCountry != "" && phoneNumber != ""){
		 $("#mobile_num").val(defaultCountry+"-"+phoneNumber);
	 }
	  var len = $("#productsList tr").length-1;
	  var itemDetails = [];
		if(len == 0){
			alert("Add Atleast One Item to Receipt");
			return false;
			}
		for(var i=1;i<=len;i++){
			var idAttr = $("#productsList tr:eq("+i+") td:last").attr("id");
			idAttr = idAttr.replace('Del','');
			var obj = {skuId:$("#skuId"+idAttr).val(),pluCode:$("#pluCode"+idAttr).val(),shipmentCharge:$("#shipmentChrg").val(),taxValue:$("#taxValue"+idAttr).val(),orderId:$("#orderId"+idAttr).text(),itemId:$("#itemId"+idAttr).text(),itemDescription:$("#itemName"+idAttr).text(),price:$("#itemPrice"+idAttr).text(),quantity:$("#orderedQuantity"+idAttr).text(),total:$("#totalCost"+idAttr).text(),make:$("#make"+idAttr).text(),model:$("#model"+idAttr).text(),color:$("#colour"+idAttr).text(),size:$("#size"+idAttr).text()};
			itemDetails.push(obj);
		}
		var shipmentLocations = [];
		var lenLoc = $("#locationsList tr").length;
		if(lenLoc == 0){
			alert("No Shipment Address for Shipping");
			return false;
		}
		for(var i=0;i<lenLoc;i++){
			var idAttr = $("#locationsList tr:eq("+i+") td:last").attr("id");
			idAttr = idAttr.replace('country','');
			var obj = {orderId:$("#orderIdLoc"+idAttr).text(),plotNumber:$("#plotNumber"+idAttr).text(),streetName:$("#streetName"+idAttr).text(),location:$("#location"+idAttr).text(),city:$("#city"+idAttr).text(),zip:$("#zip"+idAttr).text(),state:$("#state"+idAttr).text(),country:$("#country"+idAttr).text()};
			shipmentLocations.push(obj);
		}
		var finalObj = {};
		finalObj.shipmentItemsList = itemDetails;
		finalObj.shipmentLocations = shipmentLocations;
		finalObj.gatePassRef = $("#gatePassRef").val();
		finalObj.inspectedBy = $("#inspectedBy").val();
		finalObj.packagesDescription = $("#packagesDescription").val();
		finalObj.contactNum = $("#mobile_num").val();
		finalObj.rfidTagNo = $("#rfidTagNo").val();
		finalObj.shipmentAgency = $("#shipmentAgency").val();
		finalObj.shipmentCostStr = $("#shipmentCharges").val();
		finalObj.orderShippedDateStr = $("#date").val()+" 00:00:00";
		finalObj.shipmentMode = $("#transportMode").val();
		finalObj.shipmentNote = $("#shipmentNote").val();
		finalObj.shipmentStatus = $("#shipmentStatus").val();
		finalObj.taxStr = $("#totalTax").val();
		finalObj.totalCostStr = $("#totalOrderValues").text();
		finalObj.shippedBy = $("#shippedBy").val();
		finalObj.remarks = $("#remarks").val();
		finalObj.location = $("#shipmentFrom option:selected").text();
		finalObj.carrier_name = $("#carrier").val();
		finalObj.vehicleNo = $("#vehicleNumber").val();
		finalObj.driverName = $("#driverName").val();
		finalObj.routingInstructions = $("#routingInstruction").val();
		finalObj.subTotal = $("#subTotal").val();
		finalObj.flowUnder = $("#flowUnder").val(); 
//		var items = JSON.stringify(itemDetails);
//		$("#itemDetails").val(items);
		var contextPath = $("#contextPath").val();
		if(type == "new")
			URL = contextPath + "/orderManagement/createShipment.do";
		else{
			finalObj.shipmentId = $("#shipmentId").val();
			URL = contextPath + "/orderManagement/updateShipment.do";
		}
		var formData  = JSON.stringify(finalObj);
	  	 	 $.ajax({
	 			type: "POST",
	 			url : URL,
	 			contentType: "application/json",
	 			data : formData,
	 			beforeSend: function(xhr){                    
	   	   			$("#loading").css("display","block");
	   	   			$("#mainDiv").addClass("disabled");
	   	   		  },
	 			success : function(result){
	    			$("#right-side").html(result);
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



	/*function viewShipmentDetails(){
			 var contextPath = $('#contextPath').val();
			 var URL = contextPath + "/orderManagement/viewShipmentDetails.do";
			 $.ajax({
				type : "GET",
				url : URL,
				data : {
					index:"0"
				},
				beforeSend: function(xhr){                    
			   		$("#loading").css("display","block");
			   		$("#mainDiv").addClass("disabled");
			   	},
				success : function(result){
					$('#right-side').html(result);
					if(id != undefined)
						activeMenu(id);
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
*/

