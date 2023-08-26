$(document).click(function(){
	$(".matchedStringUl").css("display", "none");
});


var locationsDivContent = null;
function setLocationsDivContent(){
	locationsDivContent = $('#locations').prop('innerHTML');
}
function deleteDiv(element){
	var id = $(element).attr("id").replace('img','');
	$('#locations'+id).remove();
}
$("#deliveryLocation").change(function(){
	$("#locationAddError").html("");
	$(".Error").html("");
});





function appendLocationsDiv(){
	debugger;
	 //purpose:for checking internet conection
	var online = window.navigator.onLine;
  	if(!online)
  	{
  	alert("check your internet connection,please try agian after some time");
  	return;
  	}
	 var locationId = $("#deliveryLocation").val();
	// if(locationId == null || locationId == "")
		 
	 var flag = false;
	 $(".addedLocation").each(function(){
		 if(locationId == $(this).val()){
			 $("#locationAddError").html("This Location is Already Added");
			 flag = true;
			 return;
		 }
	 });
	 
	
	 if(flag)
		 return;
	 var id = parseInt($(".locationRow:last").attr("id").replace('locations',''))+1;
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
				appendLocationValues(result,id);
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

function appendLocationValues(locationBean,id){
	debugger;
	
	var currentLocationsDivContent = locationsDivContent;
	currentLocationsDivContent = currentLocationsDivContent.replace('locations0','locations'+id);
	currentLocationsDivContent = currentLocationsDivContent.replace('location0','location'+id);
	currentLocationsDivContent = currentLocationsDivContent.replace('street0','street'+id);
	currentLocationsDivContent = currentLocationsDivContent.replace('locationhidden0','locationhidden'+id);
	currentLocationsDivContent = currentLocationsDivContent.replace('area0','area'+id);
	currentLocationsDivContent = currentLocationsDivContent.replace('city0','city'+id);
	currentLocationsDivContent = currentLocationsDivContent.replace('popup0','popup'+id);
	currentLocationsDivContent = currentLocationsDivContent.replace('img0','img'+id);
	currentLocationsDivContent = currentLocationsDivContent.replace('relatedItemsTable0','relatedItemsTable'+id);
	currentLocationsDivContent = currentLocationsDivContent.replace('relatedItemsDiv0','relatedItemsDiv'+id);
	$(".locationsAdded").append(currentLocationsDivContent);
	$("#location"+id).val(locationBean.locationId);
	$("#street"+id).val(locationBean.address);
	$("#area"+id).val(locationBean.area);
	$("#city"+id).val(locationBean.city);
	$("#locationhidden"+id).val("false");
	
	
	
	
}

function deleteSelectedItemDetails(element){
	var id = $(element).attr("id").replace('selectedImg','');
	$('#selectedQuantity'+id).html(0);
	$('#selectedTotalCost'+id).html(0);
	/*$('#selected'+id).remove();
	var slNo = 1; 
	 $('.selecetedSlno').each(function(){
		$(this).text(slNo);
		slNo = parseInt(slNo) + 1;
	});*/
}

function changeSelectedPack(element){
	//debugger
	
	var id = $(element).attr("id");
	if (isNaN($("#"+id).html()) || $("#"+id).html() == "")
		$('#'+id).html("1");
	var rowNo = id.replace('selectedQuantity','');
	var packVal = parseFloat($('#selectedQuantity'+rowNo).html());
	if(packVal<0){
		alert("Pack should not be empty");
		var priceVal = parseFloat($('#selectedItemPrice'+rowNo).html());
		$('#selectedQuantity'+rowNo).html(1);
		$('#selectedTotalCost'+rowNo).html(priceVal);
	}else if(packVal == 0){
		$('#selectedQuantity'+rowNo).html(0);
		$('#selectedTotalCost'+rowNo).html(0);
	}else{
		var sku = $(element).attr("class");
		sku = sku.replace('selectedPack ','');
		var len = $("#productsList tr").length-1;
		for(var i=1;i<=len;i++){
			var idAttr = $("#productsList tr:eq("+i+") td:last").attr("id");
			idAttr = idAttr.replace('Del','');
			if(sku == $("#pluCode"+idAttr).val()){
				var pack = parseInt($("#quantity"+idAttr).text());
				var selectedPack = 0;
				$("."+sku).each(function(){
					if($(this).attr("id") != "selectedQuantity"+rowNo)
						selectedPack = selectedPack + parseInt($(this).text());
				});
				var selectedLocationId = $("#selectedLocationId").val();
				var prevSelectedQty = $("#relatedItemsTable"+selectedLocationId+" tbody").find("."+sku).text();
				selectedPack = selectedPack - prevSelectedQty;
				if(pack >= (selectedPack + packVal)){
					var priceVal = parseFloat($('#selectedItemPrice'+rowNo).html());
					$('#selectedTotalCost'+rowNo).html(packVal*priceVal);
				}else{
					alert("Items cannot be shipped more than the Pack ordered");
					var priceVal = parseFloat($('#selectedItemPrice'+rowNo).html());
					packVal = pack - selectedPack;
					$('#selectedQuantity'+rowNo).html(packVal);
					$('#selectedTotalCost'+rowNo).html(packVal*priceVal);
				}
			}
		}
	}
}



function showPopUp(element,type){
	$("#Error").html("");
	debugger
	var contextPath = $("#contextPath").val();
	var id = $(element).attr("id").replace('popup','');
	$("#selectedLocationId").val(id);
	$("#selectedItemsList tbody").html("");
//	$("#selectedItemsList tbody").html("<input type='hidden' id='selectedLocationId' value='"+id+"'/>");
	 var len = $("#productsList tr").length-1;
	 if(len == 0){
		 $("#Error").html("Please Select Items Before Allocating to Location");
		 focusDiv('Error');
		 return;
	 }
	 var relatedItemsTableContent = $("#relatedItemsTable"+id+" tbody").html().trim();
	 if(relatedItemsTableContent.length > 0){
		 var selectedItemlen = $("#relatedItemsTable"+id+" tr").length;
		 var pluCode = [];
		 for(var i=0;i<selectedItemlen;i++){
			 var idAttr = $("#relatedItemsTable"+id+" tr:eq("+i+")").attr("id");
				idAttr = idAttr.replace('selected_','');
				pluCode.push($("#selectedPluCode_"+idAttr).val());
				relatedItemsTableContent = relatedItemsTableContent.replace('selected_'+idAttr,'selected'+idAttr);
				relatedItemsTableContent = relatedItemsTableContent.replace('selectedItemId_'+idAttr,'selectedItemId'+idAttr);
				relatedItemsTableContent = relatedItemsTableContent.replace('selectedSkuId_'+idAttr,'selectedSkuId'+idAttr);
				relatedItemsTableContent = relatedItemsTableContent.replace('selectedPluCode_'+idAttr,'selectedPluCode'+idAttr);
				relatedItemsTableContent = relatedItemsTableContent.replace('selectedItemDesc_'+idAttr,'selectedItemDesc'+idAttr);
				relatedItemsTableContent = relatedItemsTableContent.replace('selectedItemPrice_'+idAttr,'selectedItemPrice'+idAttr);
				relatedItemsTableContent = relatedItemsTableContent.replace('selectedQuantity_'+idAttr,'selectedQuantity'+idAttr);
				relatedItemsTableContent = relatedItemsTableContent.replace('selectedTotalCost_'+idAttr,'selectedTotalCost'+idAttr);
				relatedItemsTableContent = relatedItemsTableContent.replace('selectedDel_'+idAttr,'selectedDel'+idAttr);
				relatedItemsTableContent = relatedItemsTableContent.replace('selectedImg_'+idAttr,'selectedImg'+idAttr);
				relatedItemsTableContent = relatedItemsTableContent.replace('selecetedSlno_','selecetedSlno');
		 }
		 $("#selectedItemsList tbody").html(relatedItemsTableContent);
		 var selectedItemlen = $("#relatedItemsTable"+id+" tr").length;
		 var pluCode = [];
		 for(var i=0;i<selectedItemlen;i++){
			 var idAttr = $("#relatedItemsTable"+id+" tr:eq("+i+")").attr("id");
				idAttr = idAttr.replace('selected_','');
				pluCode.push($("#selectedPluCode"+idAttr).val());
				
		 }
//		 $("#relatedItemsTable"+id+" tbody").html("");
		 if(type == undefined)
			 appendPendingSkus(pluCode);
	 }else{
		 //debugger
		 for(var i=1;i<=len;i++){
			 var idAttr = $("#productsList tr:eq("+i+") td:last").attr("id");
			 idAttr = idAttr.replace('Del','');
			 var pack = parseFloat($("#quantity"+idAttr).text());
			 var selectedPack = 0;
			 $("."+$("#pluCode"+idAttr).val()).each(function(){
				 selectedPack = selectedPack + parseFloat($(this).text());
			 });
			 selectedPack = pack ;
			 var totalCost = parseFloat($("#itemPrice"+idAttr).text()) * selectedPack;
			 var row = "<tr id='selected"+i+"' style='margin-top:5px;'><td class='selecetedSlno'>"+i+"</td><td id='selectedItemId"+i+"'>"+$("#itemId"+idAttr).text()+"</td>" +
			 "<input type='hidden' id='selectedSkuId"+i+"' value='"+$("#skuId"+idAttr).val()+"'/>" +
			 "<input type='hidden' id='selectedPluCode"+i+"' value='"+$("#pluCode"+idAttr).val()+"'/>" +
			 "<td id='selectedItemDesc"+i+"'>"+$("#itemDesc"+idAttr).text()+"</td><td id='selectedItemPrice"+i+"'>"+$("#itemPrice"+idAttr).text()+"</td>" +
			 "<td id='selectedQuantity"+i+"' class='selectedPack "+$("#pluCode"+idAttr).val()+"' onBlur='changeSelectedPack(this);' onkeypress='PreventEnter(this);' onchange='return (this.innerText.length < 10)' contenteditable='true' >"+selectedPack+"</td><td class='selectedCost' id='selectedTotalCost"+i+"'>"+parseFloat(totalCost).toFixed(2)+"</td>" ;
//			 if(type != undefined)
				 row = row +"<td id='selectedDel"+ i +"' ><img id='selectedImg"+ i +"' src='"+contextPath+"/images/itemdelete.png' style='width:12%;cursor:pointer;' onclick='deleteSelectedItemDetails(this);' title='Delete "+$("#skuId"+idAttr).val()+"'/></td>"; 
			row = row + "</tr>";
//			var obj = {skuId:$("#skuId"+idAttr).val(),pluCode:$("#pluCode"+idAttr).val(),itemId:$("#itemId"+idAttr).text(),itemDesc:$("#itemDesc"+idAttr).text(),itemPrice:$("#itemPrice"+idAttr).text(),quantity:$("#quantity"+idAttr).text(),totalCost:$("#totalCost"+idAttr).text(),make:$("#make"+idAttr).text(),model:$("#model"+idAttr).text(),color:$("#color"+idAttr).text(),size:$("#size"+idAttr).text()};
			 $("#selectedItemsList tbody").append(row);
		 }
	 }
	var  op = '<a id="selectLocation"  data-toggle="modal" data-target="#selected-items-modal"></a>';
	 $("#triggerEvent").append(op);
	 $("#selectLocation" ).trigger( "click" );
	 $("#triggerEvent").html("");
}


function appendPendingSkus(pluCode){
	//debugger
	/*var len = $("#selectedItemsList tr").length-1;
	var pluCode = [];
	 for(var i=1;i<=len;i++){
		 var idAttr = $("#selectedItemsList tr:eq("+i+")").attr("id");
		 idAttr = idAttr.replace('selected','');
		 pluCode.push($("#selectedPluCode"+idAttr).val());
	 }*/
	var contextPath = $("#contextPath").val();
	 var len = $("#productsList tr").length-1;
	 var pluCodeLen = pluCode.length + 1;
	 for(var i=1;i<=len;i++){
		 var idAttr = $("#productsList tr:eq("+i+") td:last").attr("id");
		 idAttr = idAttr.replace('Del','');
		 var plu = $("#pluCode"+idAttr).val();
		 if ($.inArray(plu, pluCode) < 0)
		 {
//			 alert(plu +"not there in array");
			 var pack = parseFloat($("#quantity"+idAttr).text());
			 var selectedPack = 0;
			 $("."+$("#pluCode"+idAttr).val()).each(function(){
				 selectedPack = selectedPack + parseFloat($(this).text());
			 });
			 selectedPack = pack - selectedPack;
			 var totalCost = parseFloat($("#itemPrice"+idAttr).text()) * selectedPack;
			 var row = "<tr id='selected"+pluCodeLen+"' style='margin-top:5px;'><td class='selecetedSlno'>"+pluCodeLen+"</td><td id='selectedItemId"+pluCodeLen+"'>"+$("#itemId"+idAttr).text()+"</td>" +
			 "<input type='hidden' id='selectedSkuId"+pluCodeLen+"' value='"+$("#skuId"+idAttr).val()+"'/>" +
			 "<input type='hidden' id='selectedPluCode"+pluCodeLen+"' value='"+$("#pluCode"+idAttr).val()+"'/>" +
			 "<td id='selectedItemDesc"+pluCodeLen+"'>"+$("#itemDesc"+idAttr).text()+"</td><td id='selectedItemPrice"+pluCodeLen+"'>"+$("#itemPrice"+idAttr).text()+"</td>" +
			 "<td id='selectedQuantity"+pluCodeLen+"' class='selectedPack "+$("#pluCode"+idAttr).val()+"' onBlur='changeSelectedPack(this);' onkeypress='PreventEnter(this);' contenteditable='true'>"+selectedPack+"</td><td class='selectedCost' id='selectedTotalCost"+pluCodeLen+"'>"+totalCost+"</td>" +
			 "<td id='selectedDel"+pluCodeLen+"' ><img id='selectedImg"+pluCodeLen+"' src='"+contextPath+"/images/itemdelete.png' style='width:12%;cursor:pointer;' onclick='deleteSelectedItemDetails(this);' title='Delete "+$("#skuId"+idAttr).val()+"'/>" +
			 "</td></tr>";
//		var obj = {skuId:$("#skuId"+idAttr).val(),pluCode:$("#pluCode"+idAttr).val(),itemId:$("#itemId"+idAttr).text(),itemDesc:$("#itemDesc"+idAttr).text(),itemPrice:$("#itemPrice"+idAttr).text(),quantity:$("#quantity"+idAttr).text(),totalCost:$("#totalCost"+idAttr).text(),make:$("#make"+idAttr).text(),model:$("#model"+idAttr).text(),color:$("#color"+idAttr).text(),size:$("#size"+idAttr).text()};
			 $("#selectedItemsList tbody").append(row);
			 pluCodeLen = pluCodeLen + 1;
		 }
	 }
}
function saveSelectedSkus(){  
	debugger;
	var selectedLocationId = $("#selectedLocationId").val();
	var selectedSkuContent = $("#selectedItemsList tbody").prop('innerHTML');
	
	$("#locationhidden"+selectedLocationId).val("true");
	
	/*var len = $("#selectedItemsList tr").length-1;
	 if(len == 0){
		 for(var i=1;i<=len;i++){
				var idAttr = $("#productsList tr:eq("+i+") td:last").attr("id");
				idAttr = idAttr.replace('Del','');
				var row = "<tr id='selected_"+i+"' style='margin-top:5px;'><td class='selecetedSlno_'>"+i+"</td><td id='selectedItemId_"+i+"'>"+$("#itemId"+idAttr).text()+"</td>" +
				"<input type='hidden' id='selectedSkuId_"+i+"' value='"+$("#skuId"+idAttr).val()+"'/>" +
				"<input type='hidden' id='selectedPluCode_"+i+"' value='"+$("#pluCode"+idAttr).val()+"'/>" +
				"<td id='selectedItemDesc_"+i+"'>"+$("#itemDesc"+idAttr).text()+"</td><td id='selectedItemPrice_"+i+"'>"+$("#itemPrice"+idAttr).text()+"</td>" +
				"<td id='selectedQuantity_"+i+"' class='selectedPack "+$("#pluCode"+idAttr).val()+"' onBlur='changeSelectedPack(this);' onkeypress='PreventEnter(this);' contenteditable='true'>0</td><td class='selectedCost' id='selectedTotalCost_"+i+"'>0</td>" +
				"<td id='selectedDel_"+ i +"' ><img id='selectedImg_"+ i +"' src='"+contextPath+"/images/itemdelete.png' style='width:15%;cursor:pointer;' onclick='deleteSelectedItemDetails(this);' title='Delete "+$("#skuId"+idAttr).val()+"'/>" +
				"</td></tr>";
				$("#relatedItemsTable"+selectedLocationId+" tbody").append(row);
			}
		 return;
	 }*/
	var len = $("#selectedItemsList tr").length-1;
	 for(var i=1;i<=len;i++){
		 var idAttr = $("#selectedItemsList tr:eq("+i+")").attr("id");
			idAttr = idAttr.replace('selected','');
			selectedSkuContent = selectedSkuContent.replace('selected'+idAttr,'selected_'+idAttr);
			selectedSkuContent = selectedSkuContent.replace('selectedItemId'+idAttr,'selectedItemId_'+idAttr);
			selectedSkuContent = selectedSkuContent.replace('selectedSkuId'+idAttr,'selectedSkuId_'+idAttr);
			selectedSkuContent = selectedSkuContent.replace('selectedPluCode'+idAttr,'selectedPluCode_'+idAttr);
			selectedSkuContent = selectedSkuContent.replace('selectedItemDesc'+idAttr,'selectedItemDesc_'+idAttr);
			selectedSkuContent = selectedSkuContent.replace('selectedItemPrice'+idAttr,'selectedItemPrice_'+idAttr);
			selectedSkuContent = selectedSkuContent.replace('selectedQuantity'+idAttr,'selectedQuantity_'+idAttr);
			selectedSkuContent = selectedSkuContent.replace('selectedTotalCost'+idAttr,'selectedTotalCost_'+idAttr);
			selectedSkuContent = selectedSkuContent.replace('selectedDel'+idAttr,'selectedDel_'+idAttr);
			selectedSkuContent = selectedSkuContent.replace('selectedImg'+idAttr,'selectedImg_'+idAttr);
			selectedSkuContent = selectedSkuContent.replace('selecetedSlno','selecetedSlno_');
	 }
	$("#relatedItemsTable"+selectedLocationId+" tbody").html(selectedSkuContent);
	
	
	 $("#cancelSelection" ).trigger( "click" );	
	 
	 if(save == "false"){
	  save= true;
	 }
	 
     	
}

$(document).ready(function(){
	 $("#delivered_by").on('input',function(e){
		   $("#deliveredByError").html("");
		   $(".Error").html("");
	 }); 
	 $("#inspected_by").on('input',function(e){
		   $("#inspectedByError").html("");
		   $(".Error").html("");
	 }); 
	 $("#date").on('input',function(e){
		 $("#dateError").html("");
		 $(".Error").html("");
	 });
});

$("#deliveryDate").on('input',function(e){
	   $("#deliveryDateError").html("");
	   $(".Error").html("");
});

$("#orderDate").on('input',function(e){
	   $("#orderDateError").html("");
	   $(".Error").html("");
});

$("#order_submitted_by").on('input',function(e){
	   $("#orderSubmittedByError").html("");
	   $(".Error").html("");
});

$("#order_approved_by").on('input',function(e){
	   $("#orderApprovedByError").html("");
	   $(".Error").html("");
});

$("#supplier_contact_name").on('input',function(e){
	   $("#supplierContactNameError").html("");
	   $(".Error").html("");
});


$("#po_reference").on('input',function(e){
	   $("#poRefError").html("");
	   $(".Error").html("");
});
$("#invoiceRefNumber").on('input',function(e){
	   $("#invoiceNumberError").html("");
	   $(".Error").html("");
});

$("#shipDno").on('input',function(e){
	   $("#shipDnoError").html("");
	   $(".Error").html("");
});
$("#shipStreet").on('input',function(e){
	   $("#shipStreetError").html("");
	   $(".Error").html("");
});
$("#shipLoc").on('input',function(e){
	   $("#shipLocError").html("");
	   $(".Error").html("");
});
$("#shipCity").on('input',function(e){
	   $("#shipCityError").html("");
	   $(".Error").html("");
});

$("#shipping_cost").on('input',function(e){
	   $("#shipCostError").html("");
	   $(".Error").html("");
});
$("total_tax").on('input',function(e){
	   $("#totalTaxError").html("");
	   $(".Error").html("");
});




function getId(element,type){
	debugger;
	var id= $(element).attr("id");
	var description = null;
	description =  $("#"+id).children("a").text();
	description = description.split(' ( ');
	description = description[0];
	$("#desc").val(description);
	if(type == "apparel")
		getItemDetails(id,type);
	else if(type == "po")
		getItemDetailspo(id,type);
	else if(type == "receipt")
		getSkuDetails(id);
	else if(type == "payments")
		getPaymentSkuDetails(id);
	else if(type == "debitNoteItems")
		getdebitNoteSkuDetails(id);
	else if(type == "salespayments")
		getSalesPaymentsSkuDetails(id);
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
	else if(type == "insemployee"){
		$("#searchEmployee").val(id);
		//$("#quoteRef").val(id);
		return searchInspectedEmployee('','','0');
	}
	else if(type == "recemployee"){
		$("#searchRecEmployee").val(id);
	//	$("#quoteRef").val(id);
		return searchInspectedEmployee('','','0');
	}
	else if(type == "itemname"){
		$(".itemwise").val(description);
		$("#skuidpo").val(id);
		//return searchPurchaseOrders('','','0');
		}
	 $(".services").hide();
	 $("."+type).html("");
}





function getIdEnter(Id,type){
	debugger;
	var id= Id;
	var description = null;
	description =  $("#"+id).children("a").text();
	description = description.split(' ( ');
	description = description[0];
	$("#desc").val(description);
	if(type == "apparel")
		getItemDetails(id,type);
	else if(type == "po")
		getItemDetailspo(id,type);
	else if(type == "receipt")
		getSkuDetails(id);
	else if(type == "payments")
		getPaymentSkuDetails(id);
	else if(type == "debitNoteItems")
		getdebitNoteSkuDetails(id);
	else if(type == "salespayments")
		getSalesPaymentsSkuDetails(id);
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
	else if(type == "insemployee"){
		$("#searchEmployee").val(id);
		//$("#quoteRef").val(id);
		return searchInspectedEmployee('','','0');
	}
	else if(type == "recemployee"){
		$("#searchRecEmployee").val(id);
	//	$("#quoteRef").val(id);
		return searchInspectedEmployee('','','0');
	}
	else if(type == "itemname"){
		$(".itemwise").val(description);
		$("#skuidpo").val(id);
		//return searchPurchaseOrders('','','0');
		}
	 $(".services").hide();
	 $("."+type).html("");
}



function addQuoteItemsToPurchaseOrder(quoteRef){
	 //purpose:for checking internet conection
	var online = window.navigator.onLine;
  	if(!online)
  	{
  	alert("check your internet connection,please try agian after some time");
  	return;
  	}
	var op = $("#operation").val();
	var contextPath = $("#contextPath").val();
	var poRef = $("#pO_Ref").val();
	var finalObj = {};
	finalObj.quoteRef = quoteRef;
	finalObj.poRef = $("#pO_Ref").val();
	finalObj.supplier_Id = $("#supplier_Id").val();
	finalObj.supplier_name = $("#searchSupplier").val();
	finalObj.ordereDate = $("#orderDate").val();
	finalObj.deliveryDate = $("#deliveryDate").val();
	finalObj.order_submitted_by = $("#order_submitted_by").val();
	finalObj.order_approved_by = $("#order_approved_by").val();
	finalObj.storeLocation = $("#storeLocation").val();
	finalObj.shipping_mode = $("#shipping_mode").val();
	finalObj.status = $("#orderStatus").val();
	if($("#shipping_cost").val() != "")
		finalObj.shipping_cost = $("#shipping_cost").val();
	if($("#total_tax").val() != "")
		finalObj.total_tax = $("#total_tax").val();
	finalObj.credit_terms = $("#credit_terms").val();
	finalObj.payment_terms = $("#payment_terms").val();
	finalObj.shipping_terms = $("#shipping_terms").val();
	finalObj.remarks = $("#remarks").val();
	
	var location = $("#warehouse_location").val();
	URL = contextPath + "/procurement/addQuoteItemsToPurchaseOrder.do";
	var formData = JSON.stringify(finalObj);
//	console.log(formData);
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
				//$("#tab_1").html(result);
				$("#right-side").html(result);
				//activeMenu(id);
				$("#operation").val(op);
				$("#pO_Ref").val(poRef);
				$("#warehouse_location").val(location);
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

function getCode(element,type,status){
	debugger;
	
	
	if(status == "true"){
	
	var id= $(element).attr("id");
	var flag= $(element).attr("flag");
	var state= $(element).attr("state");
	var gstn_num= $(element).attr("gstn_num");
	$("#supplier_Id").val(id);
	

	$("#supplierid").val(id);
	$("#supplier_flag").val(flag);
	$("#gstin").val(gstn_num);
	$("#supplier_state").val(state);
	
	
	var label = $(element).children("a").text();
	$("#searchSupplier").val(label);
	$('input[name="supplierName"]').val(label);
	
	 $(".services").hide();
	 $("."+type).html("");
	 
	} else{
		$("#searchSupplier").val("");
	 $("#supplierNameError").html("deactivated Supplier");
	}
	 
	
}


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
			 op += '<li id="'+suppliersList[i].supplierCode+'"  flag="'+suppliersList[i].productRestrictions+'" state="'+suppliersList[i].state+'" gstn_num="'+suppliersList[i].gstn_num+'" class="selected" onclick=getCode(this,"'+searchCategory+'","'+suppliersList[i].status+'"); ><a>'+suppliersList[i].firmName+'</a></li>';
		}else
			 op += '<li id="'+suppliersList[i].supplierCode+'" flag="'+suppliersList[i].productRestrictions+'"  state="'+suppliersList[i].state+'" gstn_num="'+suppliersList[i].gstn_num+'" onclick=getCode(this,"'+searchCategory+'","'+suppliersList[i].status+'"); ><a>'+suppliersList[i].firmName+'</a></li>';
	 }
	 $("."+searchCategory).html(op);
	 $("."+searchCategory).show();
}


function searchInspectedEmployee(name, searchCategory){
	 //purpose:for checking internet conection
	var online = window.navigator.onLine;
  	if(!online)
  	{
  	alert("check your internet connection,please try agian after some time");
  	return;
  	}
	var location = "";
	 var contextPath = $("#contextPath").val();
	 URL = contextPath + "/admin/searchEmployee.do";
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
				appendEmployee(result, searchCategory);
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





function searchhaEmployee(name, searchCategory){
	 //purpose:for checking internet conection
	var online = window.navigator.onLine;
  	if(!online)
  	{
  	alert("check your internet connection,please try agian after some time");
  	return;
  	}
	var location = "";
	 var contextPath = $("#contextPath").val();
	 URL = contextPath + "/admin/searchEmployee.do";
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
				appendEmployeeToHandledby(result, searchCategory);
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







function appendEmployee(empList, searchCategory){
	 $("."+searchCategory).html('');
	var op='';
	 for(var i=0;i<empList.length;i++){
		 if (i == 0) {
			 op += '<li id="'+empList[i].employeeCode+'"  class="selected" onclick=getInsEmployee(this,"'+searchCategory+'"); ><a>'+empList[i].firstName+' '+empList[i].lastName+' - '+empList[i].employeeCode+'</a>';
		}else
			 op += '<li id="'+empList[i].employeeCode+'" onclick=getInsEmployee(this,"'+searchCategory+'"); ><a>'+empList[i].firstName+' '+empList[i].lastName+' - '+empList[i].employeeCode+'</a>';
	 }
	 $("."+searchCategory).html(op);
	 $("."+searchCategory).show();
}


function appendEmployeeToHandledby(empList, searchCategory){
	debugger;
	
    for(var i=0;i<empList.length;i++){
		$("#"+searchCategory).append(
				'<option>'+empList[i].firstName+' '+empList[i].lastName+' - '+empList[i].employeeCode+'</option>');
           }
    $("."+searchCategory).append('');
	 //$("."+searchCategory).append(op);

    
}


function appendStorageSystemID(sku, searchCategory){
	
	debugger;
	if(sku.storageRefList != undefined || sku.storageRefList != null){
	for(var i=0;i<sku.storageRefList.length;i++){
		$("#"+searchCategory).append(
				'<option value='+sku.storageRefList[i].storageSystemId+'>'+sku.storageRefList[i].storageSystemId+'</option>');
           }}
    $("."+searchCategory).append('');
	 //$("."+searchCategory).append(op);

    
}


function getInsEmployee(element,type){
	var id= $(element).attr("id");
	$("#desc").val(id);
	
	var label = $(element).children("a").text();

	if(type == "insemployee"){
	$("#inspectedBy").val(label);
	}
	else if(type == "recemployee"){
		$("#receivedBy").val(label);
		}
	else
		{
		$('#handledBy').text(label);
		}
	
	$(".services").hide();
	$("."+type).html("");
}


function searchQuoteRef(name, searchCategory){
	 //purpose:for checking internet conection
	var online = window.navigator.onLine;
  	if(!online)
  	{
  	alert("check your internet connection,please try agian after some time");
  	return;
  	}
	 var contextPath = $("#contextPath").val(); 
	 //var storeLocation = $("#warehouse_location  option:selected").text();
	 URL = contextPath + "/procurement/searchQuoteRef.do";
	 $.ajax({
			type: "GET",
			url : URL,
			data : {
				searchName : name,
			//	storeLocation : storeLocation
			},
			beforeSend: function(xhr){                    
	   	   			$("#loading").css("display","block");
	   	   			$("#mainDiv").addClass("disabled");
	   	   		  },
			success : function(result) {
       		appendQuoteRef(result, searchCategory);
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

function appendQuoteRef(quoteRefsList, searchCategory){
	 $("."+searchCategory).html('');
	 var op = '';
	 for(var i=0;i<quoteRefsList.length;i++){
			 if (i == 0) {
				 op += '<li id="'+quoteRefsList[i]+'"  class="selected" onclick=getId(this,"'+searchCategory+'"); ><a>'+quoteRefsList[i]+'</a></li>';
			}else
			     op += '<li id="'+quoteRefsList[i]+'" onclick=getId(this,"'+searchCategory+'"); ><a>'+quoteRefsList[i]+'</a></li>';
	 }
	 $("."+searchCategory).html(op);
	 $("."+searchCategory).show();
	 
}
function searchShipmentNoteRefs(name,searchCategory){
	 //purpose:for checking internet conection
	var online = window.navigator.onLine;
  	if(!online)
  	{
  	alert("check your internet connection,please try agian after some time");
  	return;
  	}
	 var contextPath = $("#contextPath").val(); 
	 var storeLocation = $("#warehouse_location  option:selected").text();
	 URL = contextPath + "/procurement/searchShipmentNoteRefs.do";
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
        		appendShipmentNoteRefs(result, searchCategory);
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

function appendShipmentNoteRefs(shipmentNoteRefsList, searchCategory){
	 $("."+searchCategory).html('');
	 var op = '';
	 for(var i=0;i<shipmentNoteRefsList.length;i++){
			 if (i == 0) {
				 op += '<li id="'+shipmentNoteRefsList[i]+'"  class="selected" onclick=getId(this,"'+searchCategory+'"); ><a>'+shipmentNoteRefsList[i]+'</a></li>';
			}else
			     op += '<li id="'+shipmentNoteRefsList[i]+'" onclick=getId(this,"'+searchCategory+'"); ><a>'+shipmentNoteRefsList[i]+'</a></li>';
	 }
	 $("."+searchCategory).html(op);
	 $("."+searchCategory).show();
	 
}


function getShipmentNoteItems(shipmentNoteRefId){
	 //purpose:for checking internet conection
	var online = window.navigator.onLine;
  	if(!online)
  	{
  	alert("check your internet connection,please try agian after some time");
  	return;
  	}
	 var contextPath = $("#contextPath").val();
	 var storeLocation = $("#warehouse_location  option:selected").text();
	 URL = contextPath + "/procurement/getShipmentNoteItems.do";
	 $.ajax({
 			type: "GET",
 			url : URL,
 			data : {
 				shipmentNoteRefId : shipmentNoteRefId,
 				storeLocation : storeLocation
 			},
 			beforeSend: function(xhr){                    
  	   			$("#loading").css("display","block");
  	   			$("#mainDiv").addClass("disabled");
  	   		  },
 			success : function(result) {
 				appendPoItems(result);
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

function searchPoRefs(name, searchCategory){
	debugger;
	 //purpose:for checking internet conection
	var online = window.navigator.onLine;
  	if(!online)
  	{
  	alert("check your internet connection,please try agian after some time");
  	return;
  	}
	 var contextPath = $("#contextPath").val(); 
	 var storeLocation = $("#warehouse_location  option:selected").text();
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



function searchGRNRefs(name, searchCategory){
	 //purpose:for checking internet conection
	var online = window.navigator.onLine;
  	if(!online)
  	{
  	alert("check your internet connection,please try agian after some time");
  	return;
  	}
	 var contextPath = $("#contextPath").val(); 
	 var storeLocation = $("#warehouse_location  option:selected").text();
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

function appendPoRefs(poRefsList, searchCategory){
	 $("."+searchCategory).html('');
	 var op = '';
	 for(var i=0;i<poRefsList.length;i++){
			 if (i == 0) {
				 op += '<li id="'+poRefsList[i]+'"  class="selected" onclick=getId(this,"'+searchCategory+'"); ><a>'+poRefsList[i]+'</a></li>';
			}else
			     op += '<li id="'+poRefsList[i]+'" onclick=getId(this,"'+searchCategory+'"); ><a>'+poRefsList[i]+'</a></li>';
	 }
	 $("."+searchCategory).html(op);
	 $("."+searchCategory).show();
	 
 }


function appendGRNRefs(poRefsList, searchCategory){
	 $("."+searchCategory).html('');
	 var op = '';
	 for(var i=0;i<poRefsList.length;i++){
			 if (i == 0) {
				 op += '<li id="'+poRefsList[i]+'"  class="selected" onclick=getIdS(this,"'+searchCategory+'"); ><a>'+poRefsList[i]+'</a></li>';
			}else
			     op += '<li id="'+poRefsList[i]+'" onclick=getIdS(this,"'+searchCategory+'"); ><a>'+poRefsList[i]+'</a></li>';
	 }
	 $("."+searchCategory).html(op);
	 $("."+searchCategory).show();
	 
}


function getPoItems(poRefId){
	 //purpose:for checking internet conection
	var online = window.navigator.onLine;
  	if(!online)
  	{
  	alert("check your internet connection,please try agian after some time");
  	return;
  	}
	 var contextPath = $("#contextPath").val();
	 var storeLocation = $("#warehouse_location  option:selected").text();
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
  				
  				appendPoItems(result);
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

/*function appendPoItems(poItemsList){
	var itemslist = poItemsList.itemDetails;
	var wh = poItemsList.WhPurchaseOrder;
	alert(wh.supplier_Id)
	
		$("#searchItems").val("");

		$("#supplier_Id").val(wh.supplier_Id);
		$("#searchSupplier").val(wh.supplier_name);
		$("#submitedby").val(wh.deliveryDate);
		
		$("#deliveredOnStr").val(poItemsList.deliveryDate);
		
	
		for(var j = 0; j < itemslist.length ; j++){
			
			
			
			var sku = itemslist[j];
			
			
			if(sku.trackingRequired == true)
				var trackQty = sku.quantity/itemslist.length;
				else
				var trackQty = sku.quantity	
				
			
			
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
				
				
			 var len = parseInt($("#productsList tr").length);
				if (len != 1)
					len = parseInt($("#productsList tr:last").attr("id").replace('dynamicdiv', '')) + 1;
				for (var i = 1; i <= len; i++) {
					if ($("#skuId" + i).val() == sku.skuId) {
						var pack =  parseInt($("#Pack"+i).val())+parseFloat(sku.quantity);
		  			 $("#Pack"+i).val(pack);
		  			 $("#Supplied"+i).text(pack);
					 $("#Received"+i).text(pack);
					 $("#Rejected"+i).text(0);
		  			 var cost =  parseFloat($("#Price"+i).val());
		  			 $("#Cost"+i).text(pack*cost);
		  			 changeTotalCost();
		  			 changeTotalQuantity();
		      		 return;
					}
				}
				//debugger
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
				
				
				added by manasa
				 * purpose:to get cgst and sgst taxex
				
				var tax=sku.cgstRate;
				var	 taxRate=0.0;
				//var cgstTaxRate=0.0
				if(tax!=null)
				 taxRate=sku.cgstRate;
				 else
				 taxRate=0.0;
				
				
				
				var grnsgstTax=sku.sgstRate;
				var grnsgstTaxRate=0.0;
				if(grnsgstTaxRate!=null)
					grnsgstTaxRate=sku.sgstRate;
				
				
				var igstTax=sku.igstRate
				var igstTaxRate=0.0;
				if(igstTax!=null)
					igstTaxRate=sku.igstRate;
					 else
					 igstTaxRate=0.0;
				
				var hsnCode = sku.hsnCode;
				if(hsnCode == null)
					sku.hsnCode = "";
				
				
				var slNo = 1; 
	  			 $('.slno').each(function(){
	  				$(this).text(slNo);
	  				slNo = parseInt(slNo) + 1;
	  			});
	  			 //debugger
	  			
	  			var row = "<tr id='dynamicdiv"+len+"' style='margin-top:5px;'><td class='slno'>"+slNo+"</td><td id='Name"+len+"'>"+sku.skuId+"</td>" +
    			"<input type='hidden' id='skuId"+len+"' value='"+sku.skuId+"'/>" +
    			"<input type='hidden' id='pluCode"+len+"' value='"+sku.pluCode+"'/>" +
    			"<td id='Desc"+len+"'>"+description+"</td>"+
    			"<td class='Price' id='Price"+len+"'>"+sku.price+"</td>" +
    			"<td id='Supplied"+len+"' >1</td>" +
    			"<td id='Make"+len+"'>"+make+"</td>" +
    			"<td id='Pack"+len+"' class='Pack' onBlur='changePack(this);' onkeypress='PreventEnter(this);' contenteditable='true'>1</td>" +
    			"<td id='Rejected"+len+"' onBlur='changeRejected(this);' onkeypress='PreventEnter(this);' contenteditable='true'>0</td><td id='Cost"+len+"'>"+sku.price+"</td><td id='Del"+len+"'>" +
    			"<img id='Img"+len+"' src='"+contextPath+"/images/itemdelete.png' style='width:15%;cursor:pointer;' onclick='deleteItem(this);' title='Delete "+sku.skuId+"'/></td></tr>";
    			$("#productsList tbody").append(row);
	  			 
	  			if(sku.trackingRequired == true){
	  				for(var i=0;i<sku.quantity;i++){
	  			 
				var row = "<tr id='dynamicdiv"+len+"' style='margin-top:5px;'><td class='slno'>"+slNo+"</td><td id='Name"+len+"'>"+sku.skuId+"</td>" +
				"<td id='ean"+len+"'>"+sku.ean+"</td>" +
				"<td id='hsnCode"+len+"'>"+sku.hsnCode+"</td>" +
				"<td id='itemScanCode"+len+"'  contenteditable='true'></td>" +
				"<input type='hidden' id='skuId"+len+"' value='"+sku.skuId+"'/>" +
				"<input type='hidden' id='pluCode"+len+"' value='"+pluCode+"'/>" +
				"<input type='hidden' id='category"+len+"' value='"+sku.category+"'/>" +
    			"<input type='hidden' id='brandCode"+len+"' value='"+sku.brand+"'/>" +
    			"<input type='hidden' id='productRange"+len+"' value='"+sku.productRange+"'/>" +
    			"<input type='hidden' id='measureRange"+len+"' value='"+sku.measurementRange+"'/>" +
    			"<input type='hidden' id='color"+len+"' value='"+sku.color+"'/>" +
    			"<input type='hidden' id='size"+len+"' value='"+sku.size+"'/>" +
				"<input type='hidden' id='Rejected"+len+"' value='0'/>" +
				"<input type='hidden' id='utility"+len+"' value='"+sku.utility+"'/>" +
				"<input type='hidden' id='trackingRequired"+len+"' value='"+sku.trackingRequired+"'/>" +
				"<td id='Desc"+len+"'>"+description+"</td>"+
				"<td id='Make"+len+"'>"+sku.uom+"</td>" +
				"<td id='Requested"+len+"'>"+sku.quantity/sku.quantity+"</td>" +
				"<td class='Price' id='SPrice"+len+"'>"+sku.itemPrice+"</td>" +
				"<td  id='tax"+len+"' onBlur='changeGrnTax(this);' contenteditable='true'>"+parseFloat(taxRate*2).toFixed(2)+"</td>" +
				"<td  id='cgsttax"+len+"'>"+parseFloat(taxRate).toFixed(2)+"</td>" +
		 		"<td  id='sgsttax"+len+"'>"+parseFloat(grnsgstTaxRate).toFixed(2)+"</td>" +
		 		"<td id='igsttax"+len+"'>"+parseFloat(igstTaxRate).toFixed(2)+"</td>"+
				"<td id='Pack"+len+"' class='Pack' onBlur='changePack(this);' onkeypress='PreventEnter(this);' >"+sku.quantity+"</td>" +
    			"<td class='Price' id='Price"+len+"' onBlur='changeSupplyPrice(this);'  type='number' onkeypress='PreventEnter(this);' contenteditable='true'>"+sku.itemPrice+"</td>" +
				//"<td style='border: 1px solid #ccc;padding:0px;'><input style='border: none;height: 100%;text-align: center;' id='Pack"+len+"' class='Pack' onBlur='changePack(this);'   type='number' value='"+sku.quantity+"' /></td>" +
    			//"<td style='border: 1px solid #ccc;padding:0px;'><input style='border: none;height: 100%;text-align: center;' id='Price"+len+"'    type='number' value='"+sku.itemPrice+"' /></td>" +
    			"<td id='Cost"+len+"'>"+sku.totalCost+"</td>" +
    			"<td><select  style='width:180px' class='handledBy"+len+"'  id='handledBy"+len+"'></select> </td>"+
    			"<td id='Del"+len+"'>" +
				"<img id='Img"+len+"' src='"+contextPath+"/images/itemdelete.png' style='width:12%;cursor:pointer;' onclick='deleteItem(this);' title='Delete "+sku.skuId+"'/></td></tr>";
				$("#productsList tbody").append(row);
				
	  				}
	  			}
	  			
	  			else
	  				{
	  				
	  				var row = "<tr id='dynamicdiv"+len+"' style='margin-top:5px;'><td class='slno'>"+slNo+"</td><td id='Name"+len+"'>"+sku.skuId+"</td>" +
					"<td id='ean"+len+"'>"+sku.ean+"</td>" +
					"<td id='hsnCode"+len+"'>"+sku.hsnCode+"</td>" +
					"<td id='itemScanCode"+len+"' class='itemScanCode' contenteditable='true'></td>" +
					"<input type='hidden' id='skuId"+len+"' value='"+sku.skuId+"'/>" +
					"<input type='hidden' id='pluCode"+len+"' value='"+pluCode+"'/>" +
					"<input type='hidden' id='category"+len+"' value='"+sku.category+"'/>" +
	    			"<input type='hidden' id='brandCode"+len+"' value='"+sku.brand+"'/>" +
	    			"<input type='hidden' id='productRange"+len+"' value='"+sku.productRange+"'/>" +
	    			"<input type='hidden' id='measureRange"+len+"' value='"+sku.measurementRange+"'/>" +
	    			"<input type='hidden' id='color"+len+"' value='"+sku.color+"'/>" +
	    			"<input type='hidden' id='size"+len+"' value='"+sku.size+"'/>" +
					"<input type='hidden' id='Rejected"+len+"' value='0'/>" +
					"<input type='hidden' id='utility"+len+"' value='"+sku.utility+"'/>" +
					"<td id='Desc"+len+"'>"+description+"</td>"+
					"<td id='Make"+len+"'>"+sku.uom+"</td>" +
					"<td id='Requested"+len+"'>"+sku.quantity+"</td>" +
					"<td class='Price' id='SPrice"+len+"'>"+sku.itemPrice+"</td>" +
					"<td  id='tax"+len+"' onBlur='changeGrnTax(this);' contenteditable='true'>"+parseFloat(taxRate*2).toFixed(2)+"</td>" +
					"<td  id='cgsttax"+len+"'>"+parseFloat(taxRate).toFixed(2)+"</td>" +
			 		"<td  id='sgsttax"+len+"'>"+parseFloat(grnsgstTaxRate).toFixed(2)+"</td>" +
			 		"<td id='igsttax"+len+"'>"+parseFloat(igstTaxRate).toFixed(2)+"</td>"+
					"<td id='Pack"+len+"' class='Pack' onBlur='changePack(this);' onkeypress='PreventEnter(this);' contenteditable='true'>"+sku.quantity+"</td>" +
	    			"<td class='Price' id='Price"+len+"' onBlur='changeSupplyPrice(this);'  type='number' onkeypress='PreventEnter(this);' contenteditable='true'>"+sku.itemPrice+"</td>" +
					//"<td style='border: 1px solid #ccc;padding:0px;'><input style='border: none;height: 100%;text-align: center;' id='Pack"+len+"' class='Pack' onBlur='changePack(this);'   type='number' value='"+sku.quantity+"' /></td>" +
	    			//"<td style='border: 1px solid #ccc;padding:0px;'><input style='border: none;height: 100%;text-align: center;' id='Price"+len+"'    type='number' value='"+sku.itemPrice+"' /></td>" +
	    			"<td id='Cost"+len+"'>"+sku.totalCost+"</td>" +
	    			"<td><select  style='width:180px' class='handledBy"+len+"'  id='handledBy"+len+"'></select> </td>"+
	    			"<td id='Del"+len+"'>" +
					"<img id='Img"+len+"' src='"+contextPath+"/images/itemdelete.png' style='width:12%;cursor:pointer;' onclick='deleteItem(this);' title='Delete "+sku.skuId+"'/></td></tr>";
					$("#productsList tbody").append(row);
	  				
	  				//}
	  				
			 changeTotalCost();
			 changeTotalQuantity();
				 searchhaEmployee('',"handledBy"+len);
		}
			
}*/




function appendPoItems(poItemsList){
	debugger;
	var itemslist = poItemsList.itemDetails;
/*	var wh = poItemsList.WhPurchaseOrder;
	alert(wh.supplier_Id)*/
	
		$("#searchItems").val("");

	/*	$("#supplier_Id").val(wh.supplier_Id);
		$("#searchSupplier").val(wh.supplier_name);
		$("#submitedby").val(wh.deliveryDate);
		
		$("#deliveredOnStr").val(poItemsList.deliveryDate);*/
		
	
		for(var j = 0; j < itemslist.length ; j++){
			
			
			
			var sku = itemslist[j];
			
			
			/*if(sku.trackingRequired == true)
				var trackQty = sku.quantity/itemslist.length;
				else
				var trackQty = sku.quantity	*/
				
			
			
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
				
				if(itemslist.length > 0 && itemslist[0].gstin != undefined && itemslist[0].gstin != null && itemslist[0].gstin != ""){
					$("#gstin").val(itemslist[0].gstin);
				}
				if( $("#supplier_state").val() == ""){
				getstateforSuppier();
				}
				
			 var len = parseInt($("#productsList tr").length);
				if (len != 1)
					len = parseInt($("#productsList tr:last").attr("id").replace('dynamicdiv', '')) + 1;
			/*	for (var i = 1; i <= len; i++) {
					if ($("#skuId" + i).val() == sku.skuId) {
						var pack =  parseInt($("#Pack"+i).val())+parseFloat(sku.quantity);
		  			 $("#Pack"+i).val(pack);
		  			 $("#Supplied"+i).text(pack);
					 $("#Received"+i).text(pack);
					 $("#Rejected"+i).text(0);
		  			 var cost =  parseFloat($("#Price"+i).val());
		  			 $("#Cost"+i).text(pack*cost);
		  			 changeTotalCost();
		  			 changeTotalQuantity();
		      		 return;
					}
				}*/
				debugger;
				var description = null;
				if (sku.itemDesc != "" && sku.itemDesc != null)
					description = sku.itemDesc;
				else
					description = $("#desc").val();
				var make = sku.make;
				if(make == "" || make == null)
					make = "";
				var pluCode = null;
				if (sku.itemId != "" && sku.itemId != null)
					pluCode = sku.itemId;
				else
					pluCode = sku.skuId;
				var brandCode = sku.brandCode;
				if(brandCode == null)
					sku.brandCode = "";
				
				var brand = sku.brand;
				if(brand == null)
					sku.brand = "";
				
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
				
				
				if(sku.trackingRequired == "" || sku.trackingRequired == null)
    				sku.trackingRequired = false;
				
				/*added by manasa
				 * purpose:to get cgst and sgst taxex
				*/
				var tax=sku.cgstRate;
				var	 taxRate=0.0;
				//var cgstTaxRate=0.0
				if(tax==null)
				tax=sku.sgstRate;
				
				if(tax!=null){
				 taxRate=sku.cgstRate;
				 if(taxRate==null)
				taxRate=sku.sgstRate;
				}else{
				 taxRate=0.0;
				}
				
				
				
				var grnsgstTax=sku.sgstRate;
				var grnsgstTaxRate=0.0;
				if(grnsgstTaxRate!=null)
					grnsgstTaxRate=sku.sgstRate;
				
				
				var igstTax=sku.igstRate
				var igstTaxRate=0.0;
				if(igstTax!=null)
					igstTaxRate=sku.igstRate;
					 else
					 igstTaxRate=0.0;
				
				
				
				
				
				var locationstate = $("#location_state").val();
    			var suppierstate = $("#supplier_state").val();
    			
    			
    			 if(locationstate.toUpperCase() !=  suppierstate.toUpperCase()){
    				 taxRate=0.0;
					 grnsgstTaxRate=0.0;
    			 }else{
    				 igstRate = 0.0;
    			 }
    			
				
				
				
				var cessTax=sku.cessRate
				var cessTaxRate=0.0;
				if(cessTax!=null)
					cessTaxRate=sku.cessRate;
					 else
					cessTaxRate=0.0;
				
				
				
				var hsnCode = sku.hsnCode;
				if(hsnCode == null)
					sku.hsnCode = "";
				
				var itemTaxExclusive = sku.itemTaxExclusive;
				if(itemTaxExclusive == null || itemTaxExclusive == undefined )
					sku.itemTaxExclusive = false;
				
				
				var slNo = 1; 
	  			 $('.slno').each(function(){
	  				$(this).text(slNo);
	  				slNo = parseInt(slNo) + 1;
	  			});
	  			 //debugger
	  		/*	
	  			var row = "<tr id='dynamicdiv"+len+"' style='margin-top:5px;'><td class='slno'>"+slNo+"</td><td id='Name"+len+"'>"+sku.skuId+"</td>" +
    			"<input type='hidden' id='skuId"+len+"' value='"+sku.skuId+"'/>" +
    			"<input type='hidden' id='pluCode"+len+"' value='"+sku.pluCode+"'/>" +
    			"<td id='Desc"+len+"'>"+description+"</td>"+
    			"<td class='Price' id='Price"+len+"'>"+sku.price+"</td>" +
    			"<td id='Supplied"+len+"' >1</td>" +
    			"<td id='Make"+len+"'>"+make+"</td>" +
    			"<td id='Pack"+len+"' class='Pack' onBlur='changePack(this);' onkeypress='PreventEnter(this);' contenteditable='true'>1</td>" +
    			"<td id='Rejected"+len+"' onBlur='changeRejected(this);' onkeypress='PreventEnter(this);' contenteditable='true'>0</td><td id='Cost"+len+"'>"+sku.price+"</td><td id='Del"+len+"'>" +
    			"<img id='Img"+len+"' src='"+contextPath+"/images/itemdelete.png' style='width:15%;cursor:pointer;' onclick='deleteItem(this);' title='Delete "+sku.skuId+"'/></td></tr>";
    			$("#productsList tbody").append(row);*/
	  			 
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
	  		  	// var quantity = sku.quantity/sku.quantity;
	  		  if(sku.is_cost_price_editable == true){			 
						var row = "<tr id='dynamicdiv"+len+"' style='margin-top:5px;'><td class='slno sticky-col first-col' style='background: #f9f9f9;'>"+slNo+"</td><td id='Name"+len+"' class='sticky-col second-col' style='background: #f9f9f9;'>"+sku.skuId+"</td>" +
						"<td id='ean"+len+"'class='sticky-col third-col' style='background: #f9f9f9;'>"+sku.ean+"</td>" +
						"<td id='hsnCode"+len+"'  class='sticky-col fourth-col' style='background: #f9f9f9;'>"+sku.hsnCode+"</td>" +
						"<td id='itemScanCode"+len+"' class='itemScanCode sticky-col fifth-col'  contenteditable='true'    style='background: #f9f9f9;'></td>" +
						"<input type='hidden' id='skuId"+len+"' value='"+sku.skuId+"'/>" +
						"<input type='hidden' id='pluCode"+len+"' value='"+pluCode+"'/>" +
						"<input type='hidden' id='category"+len+"' value='"+sku.category+"'/>" +
		    			"<input type='hidden' id='brandCode"+len+"' value='"+sku.brand+"'/>" +
		    			"<input type='hidden' id='productRange"+len+"' value='"+sku.productRange+"'/>" +
		    			"<input type='hidden' id='measureRange"+len+"' value='"+sku.measurementRange+"'/>" +
		    			"<input type='hidden' id='color"+len+"' value='"+sku.color+"'/>" +
		    			"<input type='hidden' id='size"+len+"' value='"+sku.size+"'/>" +
						"<input type='hidden' id='Rejected"+len+"' value='0'/>" +
						"<input type='hidden' id='utility"+len+"' value='"+sku.utility+"'/>" +
		    			"<input type='hidden' id='itemTaxExclusive"+len+"' value='"+sku.itemTaxExclusive+"'/>" +
		    			"<input type='hidden' id='cgstTaxRate"+len+"' value='"+parseFloat(taxRate).toFixed(2)+"'/>" +
		    			"<input type='hidden' id='cessTaxRate"+len+"' value='"+parseFloat(cessTaxRate).toFixed(2)+"'/>" +
		    			"<input type='hidden' id='igsttaxRate"+len+"' value='"+parseFloat(igstTaxRate).toFixed(2)+"'/>" +
		    			"<input type='hidden' id='taxationlist"+len+"' value='"+JSON.stringify(sku.taxdetails)+"'/>" +
	                     "<input type='hidden' id='priceDuplicate"+len+"' value='"+sku.itemPrice+"'/>" +
                        "<input type='hidden' id='pricereal"+len+"' value='"+sku.itemPrice+"'/>" +
                        "<input type='hidden' id='pricerealedit"+len+"' value=''/>" +
                    

	
						"<input type='hidden' id='trackingRequired"+len+"' class='trackingRequired' value='"+sku.trackingRequired+"'/>" +
						"<td id='Desc"+len+"'  class='sticky-col sixth-col' style='background: #f9f9f9;'><div id='overflowtext'><a href='#' data-toggle='tooltip'  title='"+description+"'>"+description+"</a></div></td>"+
						"<td><textarea id='batchNum"+len+"' rows=1 style='resize:none;width: 87px;'></textarea></td>"+
						"<td><input class='form-control calendar_icon endDate'  readonly='readonly' style='width:100px;background-color: white;' id='expiryDate"+len+"' type='text' onfocus=callCalender('expiryDate"+len+"') onclick=callCalender('expiryDate"+len+"') placeholder='DD/MM/YYYY' /></td>" +
				 		"<td id='Pack"+len+"' class='Pack' onBlur='changePack(this);' onkeypress='PreventEnter(this);'  contenteditable='true' >"+sku.quantity+"</td>" +

						"<td>"+sku.measurementRange+"</td>" +
						"<td id='Make"+len+"'>"+sku.uom+"</td>" +
						"<td><input type='text' id='mrp"+len+"'  style='width:70px;text-align:center' value='"+sku.mrp+"'></td>"+
						"<td id='Requested"+len+"'>"+sku.quantity+"</td>" +
						"<td class='Price' id='SPrice"+len+"'>"+sku.itemPrice+"</td>" +
						  "<td><input id='discountpercentage"+len+"' class='discountpercentage' onBlur='changeDiscPerc(this);changeTotalCost();changeTotalQuantity();' onkeypress='PreventEnter(this);' type='number' style='width:70px;text-align:center' value='"+sku.discountPercentage+"'></td>"+
		    			"<td><input id='discountAmt"+len+"' class='discountAmt' onBlur='changeDiscAmt(this);changeTotalCost();changeTotalQuantity();' onkeypress='PreventEnter(this);' type='number' style='width:70px;text-align:center' value='"+sku.discountAmt+"'></td>"+
	                 	"<td><input id='freeqty"+len+"' class='freeqty' onBlur='changePack(this);' onkeypress='PreventEnter(this);' type='number' style='width:70px;text-align:center' value='"+sku.freeQty+"'></td>"+	
	

						"<td  id='tax"+len+"' onBlur='changeGrnTax(this);' contenteditable='true'>"+parseFloat((taxRate*2)+igstTaxRate).toFixed(2)+"</td>" +
						"<td  id='cgsttax"+len+"'>"+parseFloat(taxRate).toFixed(2)+"</td>" +
				 		"<td  id='sgsttax"+len+"'>"+parseFloat(grnsgstTaxRate).toFixed(2)+"</td>" +
				 		"<td id='igsttax"+len+"'>"+parseFloat(igstTaxRate).toFixed(2)+"</td>"+
		    	 		"<td id='cess"+len+"'>"+parseFloat(cessTaxRate).toFixed(2)+"</td>"+
		    			"<td class='Price' id='Price"+len+"' onBlur='changeSupplyPrice(this);'  type='number' onkeypress='PreventEnter(this);' contenteditable='true'>"+sku.itemPrice+"</td>" +
						//"<td style='border: 1px solid #ccc;padding:0px;'><input style='border: none;height: 100%;text-align: center;' id='Pack"+len+"' class='Pack' onBlur='changePack(this);'   type='number' value='"+sku.quantity+"' /></td>" +
		    			//"<td style='border: 1px solid #ccc;padding:0px;'><input style='border: none;height: 100%;text-align: center;' id='Price"+len+"'    type='number' value='"+sku.itemPrice+"' /></td>" +
		    			"<td id='Cost"+len+"'>"+sku.totalCost/sku.quantity+"</td>" +
		    			"<td><select  style='width:180px' class='storageRef"+len+"'  id='storageRef"+len+"'></select> </td>"+
		    			"<td><select  style='width:180px' class='handledBy"+len+"'  id='handledBy"+len+"'></select> </td>"+
		    			"<td id='Del"+len+"'>" +
						"<img id='Img"+len+"' src='"+contextPath+"/images/itemdelete.png' style='width:32%;cursor:pointer;' onclick='deleteItem(this);' title='Delete "+sku.skuId+"'/>"+
						"<img id='Img"+len+"' src='"+contextPath+"/images/bulewhiteplusicon.png' style='width:32%;cursor:pointer;margin-left: 10px;' onclick='addSkuwithplus("+len+");' title='Additem "+sku.skuId+"'/></td></tr>";
						$("#productsList tbody").append(row);
						
						appendStorageSystemID(sku,"storageRef"+len);
						 searchhaEmployee('',"handledBy"+len);
						 callCalender("expiryDate"+len);
						 $("#Pack"+len).focus();
	  				}
		  		else
					{			 
						var row = "<tr id='dynamicdiv"+len+"' style='margin-top:5px;'><td class='slno sticky-col first-col' style='background: #f9f9f9;'>"+slNo+"</td><td id='Name"+len+"' class='sticky-col second-col' style='background: #f9f9f9;'>"+sku.skuId+"</td>" +
						"<td id='ean"+len+"'class='sticky-col third-col' style='background: #f9f9f9;'>"+sku.ean+"</td>" +
						"<td id='hsnCode"+len+"'  class='sticky-col fourth-col' style='background: #f9f9f9;'>"+sku.hsnCode+"</td>" +
						"<td id='itemScanCode"+len+"' class='itemScanCode sticky-col fifth-col'  contenteditable='true'    style='background: #f9f9f9;'></td>" +
						"<input type='hidden' id='skuId"+len+"' value='"+sku.skuId+"'/>" +
						"<input type='hidden' id='pluCode"+len+"' value='"+pluCode+"'/>" +
						"<input type='hidden' id='category"+len+"' value='"+sku.category+"'/>" +
		    			"<input type='hidden' id='brandCode"+len+"' value='"+sku.brand+"'/>" +
		    			"<input type='hidden' id='productRange"+len+"' value='"+sku.productRange+"'/>" +
		    			"<input type='hidden' id='measureRange"+len+"' value='"+sku.measurementRange+"'/>" +
		    			"<input type='hidden' id='color"+len+"' value='"+sku.color+"'/>" +
		    			"<input type='hidden' id='size"+len+"' value='"+sku.size+"'/>" +
						"<input type='hidden' id='Rejected"+len+"' value='0'/>" +
						"<input type='hidden' id='utility"+len+"' value='"+sku.utility+"'/>" +
		    			"<input type='hidden' id='itemTaxExclusive"+len+"' value='"+sku.itemTaxExclusive+"'/>" +
		    			"<input type='hidden' id='cgstTaxRate"+len+"' value='"+parseFloat(taxRate).toFixed(2)+"'/>" +
		    			"<input type='hidden' id='cessTaxRate"+len+"' value='"+parseFloat(cessTaxRate).toFixed(2)+"'/>" +
		    			"<input type='hidden' id='igsttaxRate"+len+"' value='"+parseFloat(igstTaxRate).toFixed(2)+"'/>" +
		    			"<input type='hidden' id='taxationlist"+len+"' value='"+JSON.stringify(sku.taxdetails)+"'/>" +
	                     "<input type='hidden' id='priceDuplicate"+len+"' value='"+sku.itemPrice+"'/>" +
                        "<input type='hidden' id='pricereal"+len+"' value='"+sku.itemPrice+"'/>" +
                        "<input type='hidden' id='pricerealedit"+len+"' value=''/>" +
                  


						"<input type='hidden' id='trackingRequired"+len+"' class='trackingRequired' value='"+sku.trackingRequired+"'/>" +
						"<td id='Desc"+len+"'  class='sticky-col sixth-col' style='background: #f9f9f9;'><div id='overflowtext'><a href='#' data-toggle='tooltip'  title='"+description+"'>"+description+"</a></div></td>"+
						"<td><textarea id='batchNum"+len+"' rows=1 style='resize:none;width: 87px;'></textarea></td>"+
						"<td><input class='form-control calendar_icon endDate'  readonly='readonly' style='width:100px;background-color: white;' id='expiryDate"+len+"' type='text' onfocus=callCalender('expiryDate"+len+"') onclick=callCalender('expiryDate"+len+"') placeholder='DD/MM/YYYY' /></td>" +
				 		"<td id='Pack"+len+"' class='Pack' onBlur='changePack(this);' onkeypress='PreventEnter(this);'  contenteditable='true' >"+sku.quantity+"</td>" +

						"<td>"+sku.measurementRange+"</td>" +
						"<td id='Make"+len+"'>"+sku.uom+"</td>" +
						"<td><input type='text' id='mrp"+len+"' disabled='disabled' style='width:70px;text-align:center' value='"+sku.mrp+"'></td>"+
						"<td id='Requested"+len+"'>"+sku.quantity+"</td>" +
						"<td class='Price' id='SPrice"+len+"'>"+sku.itemPrice+"</td>" +
						  "<td><input id='discountpercentage"+len+"' class='discountpercentage' onBlur='changeDiscPerc(this);changeTotalCost();changeTotalQuantity();' onkeypress='PreventEnter(this);' type='number' style='width:70px;text-align:center' value='"+sku.discountPercentage+"'></td>"+
		    			"<td><input id='discountAmt"+len+"' class='discountAmt' onBlur='changeDiscAmt(this);changeTotalCost();changeTotalQuantity();' onkeypress='PreventEnter(this);' type='number' style='width:70px;text-align:center' value='"+sku.discountAmt+"'></td>"+
	                 	"<td><input id='freeqty"+len+"' class='freeqty' onBlur='changePack(this);' onkeypress='PreventEnter(this);' type='number' style='width:70px;text-align:center' value='"+sku.freeQty+"'></td>"+	
	

						"<td  id='tax"+len+"' onBlur='changeGrnTax(this);' contenteditable='true'>"+parseFloat((taxRate*2)+igstTaxRate).toFixed(2)+"</td>" +
						"<td  id='cgsttax"+len+"'>"+parseFloat(taxRate).toFixed(2)+"</td>" +
				 		"<td  id='sgsttax"+len+"'>"+parseFloat(grnsgstTaxRate).toFixed(2)+"</td>" +
				 		"<td id='igsttax"+len+"'>"+parseFloat(igstTaxRate).toFixed(2)+"</td>"+
		    	 		"<td id='cess"+len+"'>"+parseFloat(cessTaxRate).toFixed(2)+"</td>"+
		    			"<td class='Price' id='Price"+len+"' onBlur='changeSupplyPrice(this);'  type='number' onkeypress='PreventEnter(this);' contenteditable='true'>"+sku.itemPrice+"</td>" +
						//"<td style='border: 1px solid #ccc;padding:0px;'><input style='border: none;height: 100%;text-align: center;' id='Pack"+len+"' class='Pack' onBlur='changePack(this);'   type='number' value='"+sku.quantity+"' /></td>" +
		    			//"<td style='border: 1px solid #ccc;padding:0px;'><input style='border: none;height: 100%;text-align: center;' id='Price"+len+"'    type='number' value='"+sku.itemPrice+"' /></td>" +
		    			"<td id='Cost"+len+"'>"+sku.totalCost/sku.quantity+"</td>" +
		    			"<td><select  style='width:180px' class='storageRef"+len+"'  id='storageRef"+len+"'></select> </td>"+
		    			"<td><select  style='width:180px' class='handledBy"+len+"'  id='handledBy"+len+"'></select> </td>"+
		    			"<td id='Del"+len+"'>" +
						"<img id='Img"+len+"' src='"+contextPath+"/images/itemdelete.png' style='width:32%;cursor:pointer;' onclick='deleteItem(this);' title='Delete "+sku.skuId+"'/>"+
						"<img id='Img"+len+"' src='"+contextPath+"/images/bulewhiteplusicon.png' style='width:32%;cursor:pointer;margin-left: 10px;' onclick='addSkuwithplus("+len+");' title='Additem "+sku.skuId+"'/></td></tr>";
						$("#productsList tbody").append(row);
						
						appendStorageSystemID(sku,"storageRef"+len);
						 searchhaEmployee('',"handledBy"+len);
						 callCalender("expiryDate"+len);
						 $("#Pack"+len).focus();
		  			}
	  			}
	  				
	  			}
	  			else
	  				{
	  				 if(sku.is_cost_price_editable == true){
		  				var row = "<tr id='dynamicdiv"+len+"' style='margin-top:5px;'><td class='slno sticky-col first-col' style='background: #f9f9f9;'>"+slNo+"</td><td id='Name"+len+"' class='sticky-col second-col' style='background: #f9f9f9;'>"+sku.skuId+"</td>" +
						"<td id='ean"+len+"'class='sticky-col third-col' style='background: #f9f9f9;'>"+sku.ean+"</td>" +
						"<td id='hsnCode"+len+"'  class='sticky-col fourth-col' style='background: #f9f9f9;'>"+sku.hsnCode+"</td>" +
						"<td id='itemScanCode"+len+"' class='itemScanCode sticky-col fifth-col'  contenteditable='true'    style='background: #f9f9f9;'></td>" +
						"<input type='hidden' id='skuId"+len+"' value='"+sku.skuId+"'/>" +
						"<input type='hidden' id='pluCode"+len+"' value='"+pluCode+"'/>" +
						"<input type='hidden' id='category"+len+"' value='"+sku.category+"'/>" +
		    			"<input type='hidden' id='brandCode"+len+"' value='"+sku.brand+"'/>" +
		    			"<input type='hidden' id='productRange"+len+"' value='"+sku.productRange+"'/>" +
		    			"<input type='hidden' id='measureRange"+len+"' value='"+sku.measurementRange+"'/>" +
		    			"<input type='hidden' id='color"+len+"' value='"+sku.color+"'/>" +
		    			"<input type='hidden' id='size"+len+"' value='"+sku.size+"'/>" +
						"<input type='hidden' id='Rejected"+len+"' value='0'/>" +
						"<input type='hidden' id='utility"+len+"' value='"+sku.utility+"'/>" +
		    			"<input type='hidden' id='itemTaxExclusive"+len+"' value='"+sku.itemTaxExclusive+"'/>" +
		    			"<input type='hidden' id='cgstTaxRate"+len+"' value='"+parseFloat(taxRate).toFixed(2)+"'/>" +

		    			"<input type='hidden' id='cessTaxRate"+len+"' value='"+parseFloat(cessTaxRate).toFixed(2)+"'/>" +
		    			"<input type='hidden' id='igsttaxRate"+len+"' value='"+parseFloat(igstTaxRate).toFixed(2)+"'/>" +
	 	    			"<input type='hidden' id='taxationlist"+len+"' value='"+JSON.stringify(sku.taxdetails)+"'/>" +
	                    "<input type='hidden' id='priceDuplicate"+len+"' value='"+sku.itemPrice+"'/>" +
                        "<input type='hidden' id='pricereal"+len+"' value='"+sku.itemPrice+"'/>" +
                        "<input type='hidden' id='pricerealedit"+len+"' value=''/>" +
                  

						"<input type='hidden' id='trackingRequired"+len+"' class='trackingRequired' value='"+sku.trackingRequired+"'/>" +
						"<td id='Desc"+len+"'  class='sticky-col sixth-col' style='background: #f9f9f9;text-align:left'>"+description+"</td>"+
						"<td><textarea id='batchNum"+len+"' rows=1 style='resize:none;width: 87px;'></textarea></td>"+
						"<td><input class='form-control calendar_icon endDate'  readonly='readonly' style='width:100px;background-color: white;' id='expiryDate"+len+"' type='text' onfocus=callCalender('expiryDate"+len+"') onclick=callCalender('expiryDate"+len+"') placeholder='DD/MM/YYYY' /></td>" +
				 		"<td id='Pack"+len+"' class='Pack' onBlur='changePack(this);' onkeypress='PreventEnter(this);' contenteditable='true' >"+sku.quantity+"</td>" +

						"<td>"+sku.measurementRange+"</td>" +
						"<td id='Make"+len+"'>"+sku.uom+"</td>" +
						"<td><input type='text' id='mrp"+len+"'  style='width:70px;text-align:center' value='"+sku.mrp+"'></td>"+
						"<td id='Requested"+len+"'>"+sku.quantity+"</td>" +
						"<td class='Price' id='SPrice"+len+"'>"+sku.itemPrice+"</td>" +
						  "<td><input id='discountpercentage"+len+"' class='discountpercentage' onBlur='changeDiscPerc(this);changeTotalCost();changeTotalQuantity();' onkeypress='PreventEnter(this);' type='number' style='width:70px;text-align:center' value='"+sku.discountPercentage+"'></td>"+
		    			"<td><input id='discountAmt"+len+"' class='discountAmt' onBlur='changeDiscAmt(this);changeTotalCost();changeTotalQuantity();' onkeypress='PreventEnter(this);' type='number' style='width:70px;text-align:center' value='"+sku.discountAmt+"'></td>"+
	                 	"<td><input id='freeqty"+len+"' class='freeqty' onBlur='changePack(this);' onkeypress='PreventEnter(this);' type='number' style='width:70px;text-align:center' value='"+sku.freeQty+"'></td>"+	
	

						"<td  id='tax"+len+"' onBlur='changeGrnTax(this);' contenteditable='true'>"+parseFloat((taxRate*2)+igstTaxRate).toFixed(2)+"</td>" +
						"<td  id='cgsttax"+len+"'>"+parseFloat(taxRate).toFixed(2)+"</td>" +
				 		"<td  id='sgsttax"+len+"'>"+parseFloat(grnsgstTaxRate).toFixed(2)+"</td>" +
				 		"<td id='igsttax"+len+"'>"+parseFloat(igstTaxRate).toFixed(2)+"</td>"+
		    	 		"<td id='cess"+len+"'>"+parseFloat(cessTaxRate).toFixed(2)+"</td>"+
		    			"<td class='Price' id='Price"+len+"' onBlur='changeSupplyPrice(this);'  type='number' onkeypress='PreventEnter(this);' contenteditable='true'>"+sku.itemPrice+"</td>" +
						//"<td style='border: 1px solid #ccc;padding:0px;'><input style='border: none;height: 100%;text-align: center;' id='Pack"+len+"' class='Pack' onBlur='changePack(this);'   type='number' value='"+sku.quantity+"' /></td>" +
		    			//"<td style='border: 1px solid #ccc;padding:0px;'><input style='border: none;height: 100%;text-align: center;' id='Price"+len+"'    type='number' value='"+sku.itemPrice+"' /></td>" +
		    			"<td id='Cost"+len+"'>"+sku.totalCost/sku.quantity+"</td>" +
		    			"<td><select  style='width:180px' class='storageRef"+len+"'  id='storageRef"+len+"'></select> </td>"+
		    			"<td><select  style='width:180px' class='handledBy"+len+"'  id='handledBy"+len+"'></select> </td>"+
		    			"<td id='Del"+len+"'>" +
						"<img id='Img"+len+"' src='"+contextPath+"/images/itemdelete.png' style='width:32%;cursor:pointer;' onclick='deleteItem(this);' title='Delete "+sku.skuId+"'/>"+
						"<img id='Img"+len+"' src='"+contextPath+"/images/bulewhiteplusicon.png' style='width:32%;cursor:pointer;margin-left: 10px;' onclick='addSkuwithplus("+len+");' title='Additem "+sku.skuId+"'/></td></tr>";
						$("#productsList tbody").append(row);
		  				appendStorageSystemID(sku,"storageRef"+len);
						callCalender("expiryDate"+len);
						$("#Pack"+len).focus();
	  				 }
	  				 else
	  					 {
		  					var row = "<tr id='dynamicdiv"+len+"' style='margin-top:5px;'><td class='slno sticky-col first-col' style='background: #f9f9f9;'>"+slNo+"</td><td id='Name"+len+"' class='sticky-col second-col' style='background: #f9f9f9;'>"+sku.skuId+"</td>" +
							"<td id='ean"+len+"'class='sticky-col third-col' style='background: #f9f9f9;'>"+sku.ean+"</td>" +
							"<td id='hsnCode"+len+"'  class='sticky-col fourth-col' style='background: #f9f9f9;'>"+sku.hsnCode+"</td>" +
							"<td id='itemScanCode"+len+"' class='itemScanCode sticky-col fifth-col'  contenteditable='true'    style='background: #f9f9f9;'></td>" +
							"<input type='hidden' id='skuId"+len+"' value='"+sku.skuId+"'/>" +
							"<input type='hidden' id='pluCode"+len+"' value='"+pluCode+"'/>" +
							"<input type='hidden' id='category"+len+"' value='"+sku.category+"'/>" +
			    			"<input type='hidden' id='brandCode"+len+"' value='"+sku.brand+"'/>" +
			    			"<input type='hidden' id='productRange"+len+"' value='"+sku.productRange+"'/>" +
			    			"<input type='hidden' id='measureRange"+len+"' value='"+sku.measurementRange+"'/>" +
			    			"<input type='hidden' id='color"+len+"' value='"+sku.color+"'/>" +
			    			"<input type='hidden' id='size"+len+"' value='"+sku.size+"'/>" +
							"<input type='hidden' id='Rejected"+len+"' value='0'/>" +
							"<input type='hidden' id='utility"+len+"' value='"+sku.utility+"'/>" +
			    			"<input type='hidden' id='itemTaxExclusive"+len+"' value='"+sku.itemTaxExclusive+"'/>" +

							"<input type='hidden' id='trackingRequired"+len+"' class='trackingRequired' value='"+sku.trackingRequired+"'/>" +
			    			"<input type='hidden' id='cgstTaxRate"+len+"' value='"+parseFloat(taxRate).toFixed(2)+"'/>" +

							"<input type='hidden' id='cessTaxRate"+len+"' value='"+parseFloat(cessTaxRate).toFixed(2)+"'/>" +
			    			"<input type='hidden' id='igsttaxRate"+len+"' value='"+parseFloat(igstTaxRate).toFixed(2)+"'/>" +
			    			"<input type='hidden' id='taxationlist"+len+"' value='"+JSON.stringify(sku.taxdetails)+"'/>" +
		                    "<input type='hidden' id='priceDuplicate"+len+"' value='"+sku.itemPrice+"'/>" +
                            "<input type='hidden' id='pricereal"+len+"' value='"+sku.itemPrice+"'/>" +
                            "<input type='hidden' id='pricerealedit"+len+"' value=''/>" +
                 


							"<td id='Desc"+len+"' style='width:300px!important;text-align: left;background-color: #f9f9f9 !important;' class='sticky-col sixth-col'><div id='overflowtext'><a href='#' data-toggle='tooltip'  title='"+description+"'>"+description+"</a></div></td>"+
	
							
/*							"<td id='Desc"+len+"'  class='sticky-col sixth-col' style='background: #f9f9f9;text-align:left'>"+description+"</td>"+
*/							"<td><textarea id='batchNum"+len+"' rows=1 style='resize:none;width: 87px;'></textarea></td>"+
			    			"<td><input class='form-control calendar_icon endDate'  readonly='readonly' style='width:100px;background-color: white;' id='expiryDate"+len+"' type='text' onfocus=callCalender('expiryDate"+len+"') onclick=callCalender('expiryDate"+len+"') placeholder='DD/MM/YYYY' /></td>" +
					 		"<td id='Pack"+len+"' class='Pack' onBlur='changePack(this);' onkeypress='PreventEnter(this);' contenteditable='true' >"+sku.quantity+"</td>" +

                            "<td>"+sku.measurementRange+"</td>" +	
                            "<td id='Make"+len+"'>"+sku.uom+"</td>" +
							"<td><input type='text' id='mrp"+len+"'  style='width:70px;text-align:center' disabled='disabled' value='"+sku.mrp+"'></td>"+
							"<td id='Requested"+len+"'>"+sku.quantity+"</td>" +
							"<td class='Price' id='SPrice"+len+"'>"+sku.itemPrice+"</td>" +
							
							  "<td><input id='discountpercentage"+len+"' class='discountpercentage' onBlur='changeDiscPerc(this);changeTotalCost();changeTotalQuantity();' onkeypress='PreventEnter(this);' type='number' style='width:70px;text-align:center' value='"+sku.discountPercentage+"'></td>"+
		    			"<td><input id='discountAmt"+len+"' class='discountAmt' onBlur='changeDiscAmt(this);changeTotalCost();changeTotalQuantity();' onkeypress='PreventEnter(this);' type='number' style='width:70px;text-align:center' value='"+sku.discountAmt+"'></td>"+
	                 	"<td><input id='freeqty"+len+"' class='freeqty' onBlur='changePack(this);' onkeypress='PreventEnter(this);' type='number' style='width:70px;text-align:center' value='"+sku.freeQty+"'></td>"+	
	

							"<td  id='tax"+len+"' onBlur='changeGrnTax(this);' contenteditable='true'>"+parseFloat((taxRate*2)+igstTaxRate).toFixed(2)+"</td>" +
							"<td  id='cgsttax"+len+"'>"+parseFloat(taxRate).toFixed(2)+"</td>" +
					 		"<td  id='sgsttax"+len+"'>"+parseFloat(grnsgstTaxRate).toFixed(2)+"</td>" +
					 		"<td id='igsttax"+len+"'>"+parseFloat(igstTaxRate).toFixed(2)+"</td>"+
			    	 		"<td id='cess"+len+"'>"+parseFloat(cessTaxRate).toFixed(2)+"</td>"+
			    			"<td class='Price' id='Price"+len+"' onBlur='changeSupplyPrice(this);'  type='number' onkeypress='PreventEnter(this);' contenteditable='true'>"+sku.itemPrice+"</td>" +
							//"<td style='border: 1px solid #ccc;padding:0px;'><input style='border: none;height: 100%;text-align: center;' id='Pack"+len+"' class='Pack' onBlur='changePack(this);'   type='number' value='"+sku.quantity+"' /></td>" +
			    			//"<td style='border: 1px solid #ccc;padding:0px;'><input style='border: none;height: 100%;text-align: center;' id='Price"+len+"'    type='number' value='"+sku.itemPrice+"' /></td>" +
			    			"<td id='Cost"+len+"'>"+sku.totalCost/sku.quantity+"</td>" +
			    			"<td><select  style='width:180px' class='storageRef"+len+"'  id='storageRef"+len+"'></select> </td>"+
			    			"<td><select  style='width:180px' class='handledBy"+len+"'  id='handledBy"+len+"'></select> </td>"+
			    			"<td id='Del"+len+"'>" +
							"<img id='Img"+len+"' src='"+contextPath+"/images/itemdelete.png' style='width:32%;cursor:pointer;' onclick='deleteItem(this);' title='Delete "+sku.skuId+"'/>"+
						"<img id='Img"+len+"' src='"+contextPath+"/images/bulewhiteplusicon.png' style='width:32%;cursor:pointer;margin-left: 10px;' onclick='addSkuwithplus("+len+");' title='Additem "+sku.skuId+"'/></td></tr>";
						$("#productsList tbody").append(row);
		  					appendStorageSystemID(sku,"storageRef"+len);
							callCalender("expiryDate"+len);
							$("#Pack"+len).focus();
	  					 }
	  				}
	  				
			 changeTotalCost();
			 changeTotalQuantity();
			 searchhaEmployee('',"handledBy"+len);
		}
			
}

function searchProducts(name, searchCategory){
	debugger;
	 //purpose:for checking internet conection
	var online = window.navigator.onLine;
  	if(!online)
  	{
  	alert("check your internet connection,please try agian after some time");
  	return;
  	}
	var storeLocation = $("#warehouseLocation option:selected").text();
	 var storeLocationWithoutDesc =storeLocation.split("-");
	storeLocation = storeLocationWithoutDesc[0];
	
	var supplier_Id = $("#supplier_Id").val();
	var Category = $("#outletCategory").val();
	var subCategory = $("#outletSubcategory").val();
	
	 if(Category == null || Category == undefined){
		 Category = "";
	 }
	 
		if(subCategory == null || subCategory == undefined){
			subCategory = "";
		 }
	
	
	var supplierflag="false";
		var contextPath = $("#contextPath").val();
		if(searchCategory == "receipt"){
			supplier_Id = $("#supplier_Id").val();
			storeLocation = $("#warehouse_location option:selected").text();
			
			
//			alert(storeLocationWithoutDesc[0])
			 var type = $("#flowUnder").val();
			 if(type == "warehouse" || type == "Warehouse")
				 URL = contextPath + "/inventorymanager/GRNsearchWarehouseProducts.do";
			 else if(type == "Retail Outlet" || type == "Restaurant")
				 URL = contextPath + "/inventorymanager/GRNsearchProducts.do";
			 else 
				 URL = contextPath + "/inventorymanager/GRNsearchProducts.do";
		}else if(searchCategory == "po"){
			supplier_Id = $("#supplier_Id").val();
			supplierflag = $("#supplier_flag").val();
			if(supplierflag==""){
				supplierflag="false";
			}
				
			storeLocation = $("#warehouseLocation option:selected").text();
			
			
//			alert(storeLocationWithoutDesc[0])
			 var type = $("#operation").val();
			 if(type == "warehouse" || type == "Warehouse"){
				 //supplier_Id="";
				 URL = contextPath + "/inventorymanager/posearchWarehouseProducts.do";
			 }else if(type == "Retail Outlet" || type == "Restaurant")
				 URL = contextPath + "/inventorymanager/posearchProducts.do";
			 else 
				 URL = contextPath + "/inventorymanager/posearchProducts.do";
		}else if(searchCategory == "payments"){
			var type = $("#warehouseLocation").val();
		
					
			 if(type == "Warehouse" || type == "warehouse")
				 URL = contextPath + "/inventorymanager/searchWarehouseProducts.do";
			 else if(type == "Retail Outlet" || type == "Restaurant")
				 URL = contextPath + "/inventorymanager/searchProducts.do";
			 else
				 URL = contextPath + "/inventorymanager/searchProducts.do";
		}else{
			var type = $("#warehouseLocation").val();
			
			
			 if(type == "Warehouse" || type == "warehouse")
				 URL = contextPath + "/inventorymanager/searchWarehouseProducts.do";
			 else if(type == "Retail Outlet" || type == "Restaurant")
				 URL = contextPath + "/inventorymanager/searchProducts.do";
			 else
				 URL = contextPath + "/inventorymanager/searchProducts.do";
		}
		
			 if(storeLocation =='ALL')
				 storeLocation = "";
		 $.ajax({
    			type: "GET",
    			url : URL,
    			data : {
    				searchName : name,
    				storeLocation : storeLocation,
    				supplier : supplier_Id,
    				supplierflag : supplierflag,
    				Category : Category,
    				subCategory : subCategory
    			},
    			beforeSend: function(xhr){                    
 	   	   			$("#loading").css("display","block");
 	   	   			$("#mainDiv").addClass("disabled");
 	   	   		  },
    			success : function(result) {
            		appendProducts(result, searchCategory);
            		appendEmployee(result);
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

  	 
/*
function searchProductsforAutoAppend(name, searchCategory){
	debugger;
	 //purpose:for checking internet conection
	var online = window.navigator.onLine;
  	if(!online)
  	{
  	alert("check your internet connection,please try agian after some time");
  	return;
  	}
	var storeLocation = $("#warehouseLocation option:selected").text();
	 var storeLocationWithoutDesc =storeLocation.split("-");
	storeLocation = storeLocationWithoutDesc[0];
	
	var supplier_Id = $("#supplier_Id").val();
	var Category = $("#outletCategory").val();
	var subCategory = $("#outletSubcategory").val();
	
	
	var supplierflag="false";
		var contextPath = $("#contextPath").val();
		if(searchCategory == "receipt"){
			supplier_Id = $("#supplier_Id").val();
			storeLocation = $("#warehouse_location option:selected").text();
			
			
//			alert(storeLocationWithoutDesc[0])
			 var type = $("#warehouse_location").val();
			 if(type == "Warehouse")
				 URL = contextPath + "/inventorymanager/GRNsearchWarehouseProducts.do";
			 else if(type == "Retail Outlet" || type == "Restaurant")
				 URL = contextPath + "/inventorymanager/GRNsearchProducts.do";
			 else 
				 URL = contextPath + "/inventorymanager/GRNsearchProducts.do";
		}else if(searchCategory == "po"){
			supplier_Id = $("#supplier_Id").val();
			supplierflag = $("#supplier_flag").val();
			if(supplierflag==""){
				supplierflag="false";
			}
				
			storeLocation = $("#warehouseLocation option:selected").text();
			
			
//			alert(storeLocationWithoutDesc[0])
			 var type = $("#warehouseLocation").val();
			 if(type == "Warehouse"){
				 //supplier_Id="";
				 URL = contextPath + "/inventorymanager/posearchWarehouseProducts.do";
			 }else if(type == "Retail Outlet" || type == "Restaurant")
				 URL = contextPath + "/inventorymanager/posearchProducts.do";
			 else 
				 URL = contextPath + "/inventorymanager/posearchProducts.do";
		}else if(searchCategory == "payments"){
			var type = $("#warehouseLocation").val();
		
					
			 if(type == "Warehouse")
				 URL = contextPath + "/inventorymanager/searchWarehouseProducts.do";
			 else if(type == "Retail Outlet" || type == "Restaurant")
				 URL = contextPath + "/inventorymanager/searchProducts.do";
			 else
				 URL = contextPath + "/inventorymanager/searchProducts.do";
		}else{
			var type = $("#warehouseLocation").val();
			
			
			 if(type == "Warehouse")
				 URL = contextPath + "/inventorymanager/searchWarehouseProducts.do";
			 else if(type == "Retail Outlet" || type == "Restaurant")
				 URL = contextPath + "/inventorymanager/searchProducts.do";
			 else
				 URL = contextPath + "/inventorymanager/searchProducts.do";
		}
		
			 if(storeLocation =='ALL')
				 storeLocation = "";
		 $.ajax({
    			type: "GET",
    			url : URL,
    			data : {
    				searchName : name,
    				storeLocation : storeLocation,
    				supplier : supplier_Id,
    				supplierflag : supplierflag,
    				Category : Category,
    				subCategory : subCategory
    			},
    			beforeSend: function(xhr){                    
 	   	   			$("#loading").css("display","block");
 	   	   			$("#mainDiv").addClass("disabled");
 	   	   		  },
    			success : function(result) {
    				appendItemDetailsforAutoAppend(result, searchCategory);
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
*/
  	



function getItemDetailspoforAutoAppend(skuId,searchCategory){
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
	 var Category = $("#outletCategory").val();
		var subCategory = $("#outletSubcategory").val();
		var supplier_Id = $("#supplier_Id").val();
		var supplierflag = $("#supplier_flag").val();
		var supplierName = $("#searchSupplier").val();
		
		if(supplierflag==""){
			supplierflag="false";
		}

		 var type = $("#warehouseLocation").val();
		
			 URL = contextPath + "/inventorymanager/getWarehouseSkuDetailsforAutoAppend.do";
		
	 $.ajax({
  			type: "GET",
  			url : URL,
  			data : {
  				skuId : skuId,
  				storeLocation : storeLocation,
  				supplier : supplier_Id,
				supplierflag : supplierflag,
				Category : Category,
				subCategory : subCategory,
				supplierName : supplierName
  			},
  			beforeSend: function(xhr){                    
	   	   			$("#loading").css("display","block");
	   	   			$("#mainDiv").addClass("disabled");
	   	   		  },
      			success : function(result) {
      				appendItemDetailsforAutoAppend(result);
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







function searchProductsItem(name, searchCategory){
	 //purpose:for checking internet conection
	var online = window.navigator.onLine;
  	if(!online)
  	{
  	alert("check your internet connection,please try agian after some time");
  	return;
  	}
	 var contextPath = $("#contextPath").val();
	 var categoryName="";
	 var subCategory="";
	 if(searchCategory == "offersellproducts" || searchCategory == "editproductList"){
		 categoryName=$("#saleCategory").val();
		 if(categoryName.trim() == "-- Select --")
			 categoryName = "";
		 subCategory=$("#sale_sub_category").val();
		 if(subCategory != null && subCategory.trim() == "-- Select --")
			 subCategory = "";
	 }
	 URL = contextPath + "/inventorymanager/searchProductsOnCategoryBasis.do";
	 $.ajax({
			type: "GET",
			url : URL,
			data : {
				searchName : name,
				categoryName: categoryName,
				subCategory: subCategory
			},
			beforeSend: function(xhr){                    
 	   			$("#loading").css("display","block");
 	   			$("#mainDiv").addClass("disabled");
 	   		  },
			success : function(result) {
     		appendProductsBasedOnCategoryBasis(result, searchCategory);
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

function appendProductsBasedOnCategoryBasis(productsList, searchCategory){
	 $("."+searchCategory).html('');
	 if(productsList.length == 0){
		 $("#Error").html("There is No Products for the given Search");
		 $("."+searchCategory).hide();
		 $("."+searchCategory).html("");
		 focusDiv('Error');
		 return;
	 }
	 var op = '';
	 for(var i=0;i<productsList.length;i++){
		 if (i == 0) 
			 op += '<li id="'+productsList[i].productId+'"  class="selected" onclick=getItem(this,"'+searchCategory+'"); ><a>'+productsList[i].productName+'</a></li>';
		 else
		     op += '<li id="'+productsList[i].productId+'" onclick=getItem(this,"'+searchCategory+'"); ><a>'+productsList[i].productName+'</a></li>';
	 }
	 $("."+searchCategory).html(op);
	 $("."+searchCategory).show();
}




function getItem(element,type){
	var id= $(element).attr("id");
	$("#skuidpo").val(id);
	var label = $(element).children("a").text();
	$("#searchItems").val(label);
	 $(".services").hide();
	 $("."+type).html("");
}






function appendProducts(productsList, searchCategory){
	debugger;
	if(productsList.length == 0){
		$("."+searchCategory).html("No item found. Please check location you selected.");
		 $("."+searchCategory).show();
	}else{

	 $("."+searchCategory).html('');
	 var op = '';
	 var count = 0;
	debugger;
	 if(searchCategory == 'itemname'){
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
				
			 if(productsList[i].skuID == productsList[i].description){
					 if (i == 0) {
						 op += '<li style="text-align: left;" id="'+productsList[i].skuID+'"  class="selected" onclick=getId(this,"'+searchCategory+'"); ><a><label style="width: 30%;">'+productsList[i].description+'</label>&nbsp &nbsp &nbsp'+productsList[i].skuID+'&nbsp &nbsp &nbsp &nbsp &nbsp'+productsList[i].measurementRange+'   &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp    '+productsList[i].color+'  &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp     '+productsList[i].size+'    &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp   '+productsList[i].model+'   &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp    '+productsList[i].price+'   &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp    '+productsList[i].category+'   </a></li>';
					}else
					     op += '<li style="text-align: left;" id="'+productsList[i].skuID+'" onclick=getId(this,"'+searchCategory+'"); ><a><label style="width: 30%;">'+productsList[i].description+'</label>&nbsp &nbsp &nbsp'+productsList[i].skuID+'&nbsp &nbsp &nbsp &nbsp &nbsp'+productsList[i].measurementRange+'  &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp     '+productsList[i].color+'  &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp     '+productsList[i].size+'    &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp   '+productsList[i].model+'  &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp     '+productsList[i].price+'  &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp     '+productsList[i].category+'   </a></li>';
		 	}
			 else{
				 if (i == 0) {
					 op += '<li style="text-align: left;" id="'+productsList[i].skuID+'"class="selected" onclick=getId(this,"'+searchCategory+'");><a><label style="width: 30%;">'+productsList[i].description+'</label>&nbsp &nbsp &nbsp'+productsList[i].skuID+'&nbsp &nbsp &nbsp &nbsp &nbsp'+productsList[i].measurementRange+'     &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp  '+productsList[i].color+'  &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp     '+productsList[i].size+'     &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp  '+productsList[i].model+'  &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp     '+productsList[i].price+'    &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp   '+productsList[i].category+'</a></li>';
				}else
				     op += '<li style="text-align: left;" id="'+productsList[i].skuID+'"onclick=getId(this,"'+searchCategory+'"); ><a><label style="width: 30%;">'+productsList[i].description+'</label>&nbsp &nbsp &nbsp'+productsList[i].skuID+'&nbsp &nbsp &nbsp &nbsp &nbsp'+productsList[i].measurementRange+'    &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp   '+productsList[i].color+'   &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp    '+productsList[i].size+'     &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp  '+productsList[i].model+'    &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp   '+productsList[i].price+'  &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp     '+productsList[i].category+'</a></li>';
			 }
		 } 
	 }
	 else{
		 for(var i=0;i<productsList.length;i++){
			 
			if(productsList[i].productName==null || productsList[i].productName=="" || productsList[i].productName==undefined)
				productsList[i].productName="";
			 
			if(productsList[i].measurementRange==null)
				 productsList[i].measurementRange="";
			if(productsList[i].color==null)
				 productsList[i].color="";		 
			if(productsList[i].size==null)
				 productsList[i].size="";
			
			if(productsList[i].buy_price==null || productsList[i].buy_price=="" || productsList[i].buy_price==undefined)
				productsList[i].buy_price=0;
			if(productsList[i].category==null)
				productsList[i].category="";
				
			if(productsList[i].quantity=="" || productsList[i].quantity==undefined || productsList[i].quantity== null)
				productsList[i].quantity=0;
			if(productsList[i].reorderPoint=="" || productsList[i].reorderPoint==undefined || productsList[i].reorderPoint== null)
				productsList[i].reorderPoint=0;
			if(productsList[i].mbq=="" || productsList[i].mbq==undefined || productsList[i].mbq== null)
				productsList[i].mbq=0;
			
			if(productsList[i].mrp=="" || productsList[i].mrp==undefined || productsList[i].mrp== null)
				productsList[i].mrp=0;
			
			
			
				
			count = count + 1; 	
			if(productsList[i].skuID == productsList[i].description){
                if (i == 0) {
                        op += '<li style="text-align: left;" id="'+productsList[i].skuID+'"  class="selected" onclick=getId(this,"'+searchCategory+'"); ><a><label style="width: 10%;">'+productsList[i].skuID+'</label> &nbsp &nbsp &nbsp &nbsp   <label style="width: 30%;">'+productsList[i].productName+' </label>  &nbsp &nbsp     <label style="width: 5%;">'+productsList[i].quantity+'</label> &nbsp '+productsList[i].measurementRange+' &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp      '+productsList[i].color+'  &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp     '+productsList[i].size+' &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp      <label style="width: 5%;">'+productsList[i].mrp+'</label> &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp      <label style="width: 5%;">'+productsList[i].buy_price+' </label>  &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp    <label style="width: 3%;">'+productsList[i].mbq+' </label> &nbsp &nbsp     '+productsList[i].reorderPoint+'  &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp     '+productsList[i].category+'   </a></li>';
               }else
                   op += '<li style="text-align: left;" id="'+productsList[i].skuID+'"   onclick=getId(this,"'+searchCategory+'"); ><a><label style="width: 10%;">'+productsList[i].skuID+'</label> &nbsp &nbsp &nbsp &nbsp  <label style="width: 30%;">'+productsList[i].productName+' </label>  &nbsp &nbsp    <label style="width: 5%;">'+productsList[i].quantity+'</label> &nbsp '+productsList[i].measurementRange+' &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp      '+productsList[i].color+'  &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp     '+productsList[i].size+' &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp      <label style="width: 5%;">'+productsList[i].mrp+'</label> &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp      <label style="width: 5%;">'+productsList[i].buy_price+' </label>  &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp    <label style="width: 3%;">'+productsList[i].mbq+' </label> &nbsp &nbsp     '+productsList[i].reorderPoint+'  &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp     '+productsList[i].category+'   </a></li>';
                      }
       else{
        if (i == 0) {
            op += '<li style="text-align: left;" id="'+productsList[i].skuID+'"  class="selected" onclick=getId(this,"'+searchCategory+'"); ><a><label style="width: 10%;">'+productsList[i].skuID+'</label> &nbsp &nbsp &nbsp &nbsp  <label style="width: 30%;">'+productsList[i].description+' </label>  &nbsp &nbsp     <label style="width: 5%;">'+productsList[i].quantity+'</label> &nbsp &nbsp '+productsList[i].measurementRange+' &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp      '+productsList[i].color+'  &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp     '+productsList[i].size+' &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp     <label style="width: 5%;"> '+productsList[i].mrp+'</label> &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp      <label style="width: 5%;">'+productsList[i].buy_price+' </label>  &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp    <label style="width: 3%;">'+productsList[i].mbq+' </label> &nbsp &nbsp      '+productsList[i].reorderPoint+'  &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp     '+productsList[i].category+'   </a></li>';
       }else
           op += '<li style="text-align: left;" id="'+productsList[i].skuID+'"   onclick=getId(this,"'+searchCategory+'"); ><a><label style="width: 10%;">'+productsList[i].skuID+'</label> &nbsp &nbsp &nbsp &nbsp  <label style="width: 30%;">'+productsList[i].description+' </label>  &nbsp &nbsp     <label style="width: 5%;">'+productsList[i].quantity+'</label> &nbsp &nbsp '+productsList[i].measurementRange+' &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp      '+productsList[i].color+'  &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp     '+productsList[i].size+' &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp     <label style="width: 5%;"> '+productsList[i].mrp+'</label> &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp      <label style="width: 5%;">'+productsList[i].buy_price+' </label>  &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp    <label style="width: 3%;">'+productsList[i].mbq+' </label> &nbsp &nbsp      '+productsList[i].reorderPoint+'  &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp     '+productsList[i].category+'   </a></li>';
           }
			
			
		 } 
	 } 
	 if(count == 0){
		 $("."+searchCategory).html("No Active item found. Please check location you selected.");
		 $("."+searchCategory).show(); 
	 }else{
	 $("."+searchCategory).html(op);
	 $("."+searchCategory).show();
	 }
	}
	 
}
	 
	 
	 function getItemDetails(skuId,searchCategory){
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
		 
		/*var storeLocationWithoutDesc =storeLocation.split("-");
		storeLocation = storeLocationWithoutDesc[0];*/
		 
	var WarehouseReturnflag=$("#whreturnflag").val();
		if(WarehouseReturnflag == "" || WarehouseReturnflag == undefined || WarehouseReturnflag == null){
			WarehouseReturnflag="";
   		}
		
			 var type = $("#warehouseLocation").val();
			 if(type == "Warehouse" || type == "warehouse")
				 URL = contextPath + "/inventorymanager/getWarehouseSkuDetails.do";
			 else if(type == "Retail Outlet" || type == "Restaurant")
				 URL = contextPath + "/inventorymanager/getSkuDetails.do";
			 else
				 URL = contextPath + "/inventorymanager/getSkuDetails.do";
		
		
		 
		 $.ajax({
      			type: "GET",
      			url : URL,
      			data : {
      				skuId : skuId,
      				storeLocation : storeLocation,
                    WarehouseReturnflag : WarehouseReturnflag
      			},
      			beforeSend: function(xhr){                    
 	   	   			$("#loading").css("display","block");
 	   	   			$("#mainDiv").addClass("disabled");
 	   	   		  },
	       			success : function(result) {
	       				appendItemDetails(result);
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


	 function getItemDetailspo(skuId,searchCategory){
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
 		 
 		var WarehouseReturnflag=$("#whreturnflag").val();
		if(WarehouseReturnflag == "" || WarehouseReturnflag == undefined || WarehouseReturnflag == null){
			WarehouseReturnflag="";
   		}

 		 
 		
 			 var type = $("#operation").val();
 			 if(type == "warehouse" || type == "Warehouse")
 				 URL = contextPath + "/inventorymanager/getWarehouseSkuDetails.do";
 			 else if(type == "Retail Outlet" || type == "Restaurant")
 				 URL = contextPath + "/inventorymanager/getSkuDetails.do";
 			 else
 				 URL = contextPath + "/inventorymanager/getSkuDetails.do";
 		
 		
		 
		 $.ajax({
       			type: "GET",
       			url : URL,
       			data : {
       				skuId : skuId,
       				storeLocation : storeLocation,
                  WarehouseReturnflag : WarehouseReturnflag
       			},
       			beforeSend: function(xhr){                    
  	   	   			$("#loading").css("display","block");
  	   	   			$("#mainDiv").addClass("disabled");
  	   	   		  },
	       			success : function(result) {
	       				appendItemDetails(result);
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
 	
	 function appendItemDetails(skuDetails){
		 debugger;
		 if(skuDetails==""){
			 $("#loading").css("display","none");
				$("#mainDiv").removeClass('disabled');
				 alert("No Records Found");
		 }
		 
		 var parsedJson = jQuery.parseJSON(skuDetails);
		 
			$("#searchItems").val("");
			skuList = parsedJson.skuLists;
			
			 var storeLocation = $("#warehouseLocation option:selected").text();
			 /*var storeLocationWithoutDesc =storeLocation.split("-");
		 		storeLocation = storeLocationWithoutDesc[0];*/
		 		 
	 		 var type = $("#flowUnder").val();
			 if(type == "warehouse" || type == "Warehouse"){
			var warehouseskumaster=parsedJson.warehouseskumaster[0];
			var warehouseskumaster=parsedJson.warehouseskumaster;
			var itemTrack = warehouseskumaster.trackingRequired;
			
			
			
			
			skuList[0].trackingRequired = itemTrack;
			skuList[0].returnableItem = warehouseskumaster.returnableItem;
			skuList[0].lifeTimeSpan = warehouseskumaster.lifeTimeSpan;
			skuList[0].costpriceEditable=warehouseskumaster.is_cost_price_editable;
			if(skuList[0].hsnCode == null && warehouseskumaster != null)
				skuList[0].hsnCode = warehouseskumaster.hsnCode;
			
			
			if(warehouseskumaster.itemTaxExclusive!=null && warehouseskumaster.itemTaxExclusive!=undefined && warehouseskumaster.itemTaxExclusive!="")
				{
				skuList[0].itemTaxExclusive=warehouseskumaster.itemTaxExclusive;
				}
			if(warehouseskumaster.itemTaxExclusive==true || warehouseskumaster.itemTaxExclusive==false)
				{
				skuList[0].itemTaxExclusive=warehouseskumaster.itemTaxExclusive;
				}
			}
			 
			 
			if(skuList.length >1){
				var priceLength = skuList.length;
				var priceArray = [];
				$("#itemsList tbody").html("");
				for(var i=0; i<priceLength; i++){
					var price = skuList[i].costPrice;
					
					if(type == "warehouse" || type == "Warehouse")
						skuList[i].trackingRequired = itemTrack;
					
					if (! $.inArray(price, priceArray) > -1)
					{
						priceArray.push(price);
						var row = '<tr id=price'+i+' style="margin-top:5px;cursor:pointer;white-space: nowrap;"  ><td><input type="checkbox" name="selectall" class="selectableCheckbox" id="selectall" value='+i+' /></td><td>'+skuList[i].description+'</td><td>'+price+'</td><td>'+skuList[i].measureRange+'</td><td>'+skuList[i].productRange+'</td><td>'+skuList[i].brandCode+'</td><td>'+skuList[i].color+'</td><td>'+skuList[i].size+'</td><td>'+skuList[i].ean+'</td><td>'+skuList[i].quantity+'</td></tr>';
						//var row = '<tr id=price'+i+' style="margin-top:5px;cursor:pointer" onclick=getItemPrice(this) ><td>'+skuList[i].description+'</td><td>'+price+'</td><td>'+skuList[i].measureRange+'</td><td>'+skuList[i].color+'</td><td>'+skuList[i].size+'</td></tr>';
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
	 }
	 
	 
	 
	 
	 
	 
	 
	 
	 function appendItemDetailsforAutoAppend(skuDetails){
		 debugger;
		 if(skuDetails==""){
			 $("#loading").css("display","none");
				$("#mainDiv").removeClass('disabled');
				 alert("No Records Found");
		 }
		 
				 var parsedJson = jQuery.parseJSON(skuDetails);
				 
				 
				 
					$("#searchItems").val("");
					skuList = parsedJson.skuLists;
					
					 var storeLocation = $("#warehouseLocation option:selected").text();
					 /*var storeLocationWithoutDesc =storeLocation.split("-");
				 		storeLocation = storeLocationWithoutDesc[0];*/
				 		 
			 		 var type = $("#warehouseLocation").val();
			 		 
			 		 for(var i=0;i<skuList.length;i++){
			 		 
					 if(type == "Warehouse" || type == "warehouse"){
					
					var itemTrack = skuList[i].wareHouseSku.trackingRequired;
					skuList[i].trackingRequired = itemTrack;
					skuList[i].returnableItem = skuList[i].wareHouseSku.returnableItem;
					skuList[i].lifeTimeSpan = skuList[i].wareHouseSku.lifeTimeSpan;
					skuList[i].costpriceEditable= skuList[i].wareHouseSku.is_cost_price_editable;
					
					
					if(skuList[i].wareHouseSku.itemTaxExclusive!=null && skuList[i].wareHouseSku.itemTaxExclusive!=undefined && skuList[i].wareHouseSku.itemTaxExclusive!="")
						{
						skuList[i].itemTaxExclusive= skuList[i].wareHouseSku.itemTaxExclusive;
						}
					if(skuList[i].wareHouseSku.itemTaxExclusive==true || skuList[i].wareHouseSku.itemTaxExclusive==false)
						{
						skuList[i].itemTaxExclusive= skuList[i].wareHouseSku.itemTaxExclusive;
						}
					}
					 
					 
						if(skuList[i].hsnCode == null && skuList[i].wareHouseSku != null)
							skuList[i].hsnCode = skuList[i].wareHouseSku.hsnCode;
			 		 }

						
			 		addItemsforAutoAppend(skuList);
			
	 }
	 
	 
	 function clearTableData(){
		 $("#productsList tbody").html('');
		 $("#Error").html("");
		 changeTotalOrderCost();
		 productFiles = [];
		 $("#fileUploadCSV").val('');
		 
	 }
	 
	 
	 function PreventEnter(element){
		 debugger;
	  var id = $(element).attr("id");
		 
		if (event.keyCode === 13) {
			event.preventDefault();
			$("#"+id).blur(); 
			$("#searchItems").focus(); 
	   }
	}
	 
      function popupsku(sku){
    	  
    	  debugger;
    	  console.log(sku);
    	  $(".Clear").text("");
    	  try{  
    		  
    		if(sku.skuId != null && sku.skuId != undefined && sku.skuId != ""){
    			
    			sku.skuId = sku.skuId;
    		}else{
    			sku.skuId = "N/A";
    		}
          if(sku.description != null && sku.description != undefined && sku.description != ""){
    			
        	  sku.description = sku.description;
    		}else{
    			sku.description = "N/A"
    		}
             if(sku.category != null && sku.category != undefined && sku.category != ""){
	
	      sku.category = sku.category;
            }else{
	       sku.category = "N/A"
           }
      if(sku.primaryDepartment != null && sku.primaryDepartment != undefined && sku.primaryDepartment != ""){
	
	   sku.primaryDepartment = sku.primaryDepartment;
          }else{
	   sku.primaryDepartment = "N/A"
       }

        if(sku.uom != null && sku.uom != undefined && sku.uom != ""){
	
	sku.uom = sku.uom;
       }else{
	sku.uom = "N/A"
       }
         if(sku.hsnCode != null && sku.hsnCode != undefined && sku.hsnCode != ""){
	
	sku.hsnCode = sku.hsnCode;
        }else{
	 sku.hsnCode = "N/A"
      }
      if(sku.taxCode != null && sku.taxCode != undefined && sku.taxCode != ""){
	
	sku.taxCode = sku.taxCode;
     }else{
	sku.taxCode = "N/A"
    }
    if(sku.costPrice != null && sku.costPrice != undefined && sku.costPrice != ""){
	
	sku.costPrice = sku.costPrice;
    }else if(sku.cost != null && sku.cost != undefined && sku.cost != ""){
	sku.costPrice = sku.cost;
     }else{
    	 sku.costPrice = "N/A" 
     }
       if(sku.ean != null && sku.ean != undefined && sku.ean != ""){
	
	sku.ean = sku.ean;
    }else{
	sku.ean = "N/A"
     }
     if(sku.measureRange != null && sku.measureRange != undefined && sku.measureRange != ""){
	
	sku.measureRange = sku.measureRange+''+sku.uom;
    }else{
	sku.measureRange = "N/A"
    }
     if(sku.color != null && sku.color != undefined && sku.color != ""){
    		
    		sku.color = sku.color;
    	}else{
    		sku.color = "N/A"
    	}
     if(sku.mbq != null && sku.mbq != undefined && sku.mbq != ""){
    		
    		sku.mbq = sku.mbq;
    	}else{
    		sku.mbq = "N/A"
    	}
     if(sku.availableQty != null && sku.availableQty != undefined && sku.availableQty != ""){
    		
    		sku.availableQty = sku.availableQty;
    	}else{
    		sku.availableQty = "N/A"
    	}
     
     
    	if(sku.skuId=="N/A")	
    		{
    		sku.skuId=sku.skuID;
    		}
    		  
    	  $("#modelSkuId").text(sku.skuId);
    	  $("#modelDescId").text(sku.description);
    	  $("#modelCategoryId").text(sku.category);
    	  $("#modelDepartmentId").text(sku.primaryDepartment);
    	  $("#modelUomId").text(sku.uom);
    	  $("#modelHsncode").text(sku.hsnCode);
    	  $("#modeltaxcode").text(sku.taxCode);
    	  $("#modelCostPrice").text(sku.costPrice);
    	  $("#modelean").text(sku.ean);
    	  $("#modelSizeWeight").text(sku.measureRange);
    	  $("#modelcolor").text(sku.color);
    	  $("#modelmbq").text(sku.mbq);
    	  $("#modelavaistock").text(sku.availableQty);
    	  $("#modelOrderedStock").text("N/A");
    	/*  supplierdata*/
    	  skuid = sku.skuId;
    	  var LocationType = $("#warehouseLocation").val();
    	  var storeLocation = $("#warehouseLocation option:selected").text();
    	 
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
  				issue:issue
  			},
  			beforeSend: function(xhr){                    
  	   			$("#loading").css("display","block");
  	   			$("#mainDiv").addClass("disabled");
  	   		  },
  			success : function(result) {
  			    appendSupplierslist(result);
  				/*$("#supplierdata").text(result);*/
  				 $('#Popupitems').modal('show'); 
  				
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
 
      
function popupskuAvgQty(sku){
    	  
    	  debugger;
    	  console.log(sku);
    	  $(".Clear").text("");
    	  try{  
    		  
    		if(sku.skuId != null && sku.skuId != undefined && sku.skuId != ""){
    			
    			sku.skuId = sku.skuId;
    		}else{
    			sku.skuId = "N/A";
    		}
          if(sku.description != null && sku.description != undefined && sku.description != ""){
    			
        	  sku.description = sku.description;
    		}else{
    			sku.description = "N/A"
    		}
             if(sku.category != null && sku.category != undefined && sku.category != ""){
	
	      sku.category = sku.category;
            }else{
	       sku.category = "N/A"
           }
      if(sku.primaryDepartment != null && sku.primaryDepartment != undefined && sku.primaryDepartment != ""){
	
	   sku.primaryDepartment = sku.primaryDepartment;
          }else{
	   sku.primaryDepartment = "N/A"
       }

        if(sku.uom != null && sku.uom != undefined && sku.uom != ""){
	
	sku.uom = sku.uom;
       }else{
	sku.uom = "N/A"
       }
         if(sku.hsnCode != null && sku.hsnCode != undefined && sku.hsnCode != ""){
	
	sku.hsnCode = sku.hsnCode;
        }else{
	 sku.hsnCode = "N/A"
      }
      if(sku.taxCode != null && sku.taxCode != undefined && sku.taxCode != ""){
	
	sku.taxCode = sku.taxCode;
     }else{
	sku.taxCode = "N/A"
    }
    if(sku.costPrice != null && sku.costPrice != undefined && sku.costPrice != ""){
	
	sku.costPrice = sku.costPrice;
    }else{
	sku.costPrice = "N/A"
     }
       if(sku.ean != null && sku.ean != undefined && sku.ean != ""){
	
	sku.ean = sku.ean;
    }else{
	sku.ean = "N/A"
     }
     if(sku.measureRange != null && sku.measureRange != undefined && sku.measureRange != ""){
	
	sku.measureRange = sku.measureRange+''+sku.uom;
    }else{
	sku.measureRange = "N/A"
    }
     if(sku.color != null && sku.color != undefined && sku.color != ""){
    		
    		sku.color = sku.color;
    	}else{
    		sku.color = "N/A"
    	}
     if(sku.mbq != null && sku.mbq != undefined && sku.mbq != ""){
    		
    		sku.mbq = sku.mbq;
    	}else{
    		sku.mbq = "N/A"
    	}
     if(sku.availableQty != null && sku.availableQty != undefined && sku.availableQty != ""){
    		
    		sku.availableQty = sku.availableQty;
    	}else{
    		sku.availableQty = "N/A"
    	}
     
     
    	if(sku.skuId=="N/A")	
    		{
    		sku.skuId=sku.skuID;
    		}
    		  
    	  $("#modelSkuId").text(sku.skuId);
    	  $("#modelDescId").text(sku.description);
    	  $("#modelCategoryId").text(sku.category);
    	  $("#modelDepartmentId").text(sku.primaryDepartment);
    	  $("#modelUomId").text(sku.uom);
    	  $("#modelHsncode").text(sku.hsnCode);
    	  $("#modeltaxcode").text(sku.taxCode);
    	  $("#modelCostPrice").text(sku.costPrice);
    	  $("#modelean").text(sku.ean);
    	  $("#modelSizeWeight").text(sku.measureRange);
    	  $("#modelcolor").text(sku.color);
    	  $("#modelmbq").text(sku.mbq);
    	  $("#modelavaistock").text(sku.availableQty);
    	  $("#modelOrderedStock").text("N/A");
    	/*  supplierdata*/
    	  skuid = sku.skuId;
    	  var LocationType = $("#warehouseLocation").val();
    	  var storeLocation = $("#warehouseLocation option:selected").text();
    	 
  			
    	var contextPath = $("#contextPath").val();
      
     	var online = window.navigator.onLine;
    	if(!online){
    	alert("Check your internet connection,Please try agian after some time.");
    	return;
    	}
    	 var issue = $("#pageType").val();
   	  
   	  if(issue == undefined || issue == null || issue == ""){
   		  issue = false; 
   	  }else{
   		  issue = true;
   	  }
  	
  	URL = contextPath + "/inventorymanager/skuSuppliers.do";
  		 
  		$.ajax({
  			type: "GET",
  			url : URL,
  			data : {
  				skuid : skuid,
  				LocationType:LocationType,
  				storeLocation:storeLocation,	
  				issue:issue
  			},
  			beforeSend: function(xhr){                    
  	   			$("#loading").css("display","block");
  	   			$("#mainDiv").addClass("disabled");
  	   		  },
  			success : function(result) {
  			    appendSupplierslist(result);
  				/*$("#supplierdata").text(result);*/
  				 $('#AverageSalePopup').modal('show'); 
  				
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
      function popupskuQty(sku){
    	  
    	  debugger;
    	  console.log(sku);
    	  $(".Clear").text("");
    	  try{  
    		  
    		if(sku.skuId != null && sku.skuId != undefined && sku.skuId != ""){
    			
    			sku.skuId = sku.skuId;
    		}else{
    			sku.skuId = "N/A";
    		}
          if(sku.description != null && sku.description != undefined && sku.description != ""){
    			
        	  sku.description = sku.description;
    		}else{
    			sku.description = "N/A"
    		}
             if(sku.category != null && sku.category != undefined && sku.category != ""){
	
	      sku.category = sku.category;
            }else{
	       sku.category = "N/A"
           }
      if(sku.primaryDepartment != null && sku.primaryDepartment != undefined && sku.primaryDepartment != ""){
	
	   sku.primaryDepartment = sku.primaryDepartment;
          }else{
	   sku.primaryDepartment = "N/A"
       }

        if(sku.uom != null && sku.uom != undefined && sku.uom != ""){
	
	sku.uom = sku.uom;
       }else{
	sku.uom = "N/A"
       }
         if(sku.hsnCode != null && sku.hsnCode != undefined && sku.hsnCode != ""){
	
	sku.hsnCode = sku.hsnCode;
        }else{
	 sku.hsnCode = "N/A"
      }
      if(sku.taxCode != null && sku.taxCode != undefined && sku.taxCode != ""){
	
	sku.taxCode = sku.taxCode;
     }else{
	sku.taxCode = "N/A"
    }
    if(sku.costPrice != null && sku.costPrice != undefined && sku.costPrice != ""){
	
	sku.costPrice = sku.costPrice;
    }else{
	sku.costPrice = "N/A"
     }
       if(sku.ean != null && sku.ean != undefined && sku.ean != ""){
	
	sku.ean = sku.ean;
    }else{
	sku.ean = "N/A"
     }
     if(sku.measureRange != null && sku.measureRange != undefined && sku.measureRange != ""){
	
	sku.measureRange = sku.measureRange+''+sku.uom;
    }else{
	sku.measureRange = "N/A"
    }
     if(sku.color != null && sku.color != undefined && sku.color != ""){
    		
    		sku.color = sku.color;
    	}else{
    		sku.color = "N/A"
    	}
     if(sku.mbq != null && sku.mbq != undefined && sku.mbq != ""){
    		
    		sku.mbq = sku.mbq;
    	}else{
    		sku.mbq = "N/A"
    	}
     if(sku.availableQty != null && sku.availableQty != undefined && sku.availableQty != ""){
    		
    		sku.availableQty = sku.availableQty;
    	}else{
    		sku.availableQty = "N/A"
    	}
     
     
    	if(sku.skuId=="N/A")	
    		{
    		sku.skuId=sku.skuID;
    		}
    		  
    	  $("#modelSkuId").text(sku.skuId);
    	  $("#modelDescId").text(sku.description);
    	  $("#modelCategoryId").text(sku.category);
    	  $("#modelDepartmentId").text(sku.primaryDepartment);
    	  $("#modelUomId").text(sku.uom);
    	  $("#modelHsncode").text(sku.hsnCode);
    	  $("#modeltaxcode").text(sku.taxCode);
    	  $("#modelCostPrice").text(sku.costPrice);
    	  $("#modelean").text(sku.ean);
    	  $("#modelSizeWeight").text(sku.measureRange);
    	  $("#modelcolor").text(sku.color);
    	  $("#modelmbq").text(sku.mbq);
    	  $("#modelavaistock").text(sku.availableQty);
    	  $("#modelOrderedStock").text("N/A");
    	/*  supplierdata*/
    	  skuid = sku.skuId;
    	  var LocationType = $("#warehouseLocation").val();
    	  var storeLocation = $("#warehouseLocation option:selected").text();
    	 
  			
    	var contextPath = $("#contextPath").val();
      
     	var online = window.navigator.onLine;
    	if(!online){
    	alert("Check your internet connection,Please try agian after some time.");
    	return;
    	}
    	
    	 var issue = true;
      	  
      	
      		
  	
  	URL = contextPath + "/inventorymanager/skuSuppliers.do";
  		 
  		$.ajax({
  			type: "GET",
  			url : URL,
  			data : {
  				skuid : skuid,
  				LocationType:LocationType,
  				storeLocation:storeLocation,	
  				issue:issue
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
      
      
function popupskuu(skuId,description,category,primaryDepartment,uom,hsnCode,taxCode,costPrice,ean,measureRange,color,mbq,availableQty){
    	  
    	  debugger;
    	
    	  $(".Clear").text("");
    	  try{  
    	 
    	  $("#modelSkuId").text(skuId);
    	  $("#modelDescId").text(description);
    	  $("#modelCategoryId").text(category);
    	  $("#modelDepartmentId").text(primaryDepartment);
    	  $("#modelUomId").text(uom);
    	  $("#modelHsncode").text(hsnCode);
    	  $("#modeltaxcode").text(taxCode);
    	  $("#modelCostPrice").text(costPrice);
    	  $("#modelean").text(ean);
    	  $("#modelSizeWeight").text(measureRange);
    	  $("#modelcolor").text(color);
    	  $("#modelmbq").text(mbq);
    	  $("#modelavaistock").text(availableQty);
    	  $("#modelOrderedStock").text("N/A");
    	/*  supplierdata*/
    	
    	  skuid = skuId;
    	  var LocationType = $("#warehouseLocation").val();
    	  var storeLocation = $("#warehouseLocation option:selected").text();
  			
    	var contextPath = $("#contextPath").val();
      
     	var online = window.navigator.onLine;
    	if(!online){
    	alert("Check your internet connection,Please try agian after some time.");
    	return;
    	}
    	 var issue = $("#pageType").val();
     	  
     	  if(issue == undefined || issue == null || issue == ""){
     		  issue = false; 
     	  }else{
     		  issue = true;
     	  }
 	
  	
  	URL = contextPath + "/inventorymanager/skuSuppliers.do";
  		 
  		$.ajax({
  			type: "GET",
  			url : URL,
  			data : {
  				skuid : skuid,
  				LocationType:LocationType,
  				storeLocation:storeLocation,
  				issue:issue
  			},
  			beforeSend: function(xhr){                    
  	   			$("#loading").css("display","block");
  	   			$("#mainDiv").addClass("disabled");
  	   		  },
  			success : function(result) {
  			    appendSupplierslist(result);
  				/*$("#supplierdata").text(result);*/
  				 $('#Popupitems').modal('show'); 
  				
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
      
function popupskuuQty(skuId,description,category,primaryDepartment,uom,hsnCode,taxCode,costPrice,ean,measureRange,color,mbq,availableQty){
	  
	  debugger;
	
	  $(".Clear").text("");
	  try{  
	 
	  $("#modelSkuId").text(skuId);
	  $("#modelDescId").text(description);
	  $("#modelCategoryId").text(category);
	  $("#modelDepartmentId").text(primaryDepartment);
	  $("#modelUomId").text(uom);
	  $("#modelHsncode").text(hsnCode);
	  $("#modeltaxcode").text(taxCode);
	  $("#modelCostPrice").text(costPrice);
	  $("#modelean").text(ean);
	  $("#modelSizeWeight").text(measureRange);
	  $("#modelcolor").text(color);
	  $("#modelmbq").text(mbq);
	  $("#modelavaistock").text(availableQty);
	  $("#modelOrderedStock").text("N/A");
	/*  supplierdata*/
	
	  skuid = skuId;
	  var LocationType = $("#warehouseLocation").val();
	  var storeLocation = $("#warehouseLocation option:selected").text();
		
	var contextPath = $("#contextPath").val();

	var online = window.navigator.onLine;
	if(!online){
	alert("Check your internet connection,Please try agian after some time.");
	return;
	}
	 var issue = true;
 	  
 	 

URL = contextPath + "/inventorymanager/skuSuppliers.do";
	 
	$.ajax({
		type: "GET",
		url : URL,
		data : {
			skuid : skuid,
			LocationType:LocationType,
			storeLocation:storeLocation,
			issue:issue
		},
		beforeSend: function(xhr){                    
   			$("#loading").css("display","block");
   			$("#mainDiv").addClass("disabled");
   		  },
		success : function(result) {
		    appendSupplierslist(result);
			/*$("#supplierdata").text(result);*/
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


function popupskuuAvgQty(skuId,description,category,primaryDepartment,uom,hsnCode,taxCode,costPrice,ean,measureRange,color,mbq,availableQty){
	  
	  debugger;
	
	  $(".Clear").text("");
	  try{  
	 
	  $("#modelSkuId").text(skuId);
	  $("#modelDescId").text(description);
	  $("#modelCategoryId").text(category);
	  $("#modelDepartmentId").text(primaryDepartment);
	  $("#modelUomId").text(uom);
	  $("#modelHsncode").text(hsnCode);
	  $("#modeltaxcode").text(taxCode);
	  $("#modelCostPrice").text(costPrice);
	  $("#modelean").text(ean);
	  $("#modelSizeWeight").text(measureRange);
	  $("#modelcolor").text(color);
	  $("#modelmbq").text(mbq);
	  $("#modelavaistock").text(availableQty);
	  $("#modelOrderedStock").text("N/A");
	/*  supplierdata*/
	
	  skuid = skuId;
	  var LocationType = $("#warehouseLocation").val();
	  var storeLocation = $("#warehouseLocation option:selected").text();
		
	var contextPath = $("#contextPath").val();

	var online = window.navigator.onLine;
	if(!online){
	alert("Check your internet connection,Please try agian after some time.");
	return;
	}

	 var issue = $("#pageType").val();
 	  
 	  if(issue == undefined || issue == null || issue == ""){
 		  issue = false; 
 	  }else{
 		  issue = true;
 	  }
	
URL = contextPath + "/inventorymanager/skuSuppliers.do";
	 
	$.ajax({
		type: "GET",
		url : URL,
		data : {
			skuid : skuid,
			LocationType:LocationType,
			storeLocation:storeLocation,
			issue:issue
		},
		beforeSend: function(xhr){                    
 			$("#loading").css("display","block");
 			$("#mainDiv").addClass("disabled");
 		  },
		success : function(result) {
		    appendSupplierslist(result);
			/*$("#supplierdata").text(result);*/
		    $('#AverageSalePopup').modal('show'); 
			
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
    			 $("#AvgsalePop").html("");
    			 $("#location5").html("");
    			 $("#supplierdata").html("");
    			 var length = suppliersResponce.suppliers;
    			 if(length != "" && length != null && length != undefined){
    				 for(var i=0;i<=suppliersResponce.suppliers.length-1;i++){
        				 op +='<label style="width:100%;padding-left: 5px;cursor: pointer;" class="removeSelectId" onclick="changeSuplierdata('+suppliersResponce.suppliers[i].supplierProducts[0].costPrice+','+i+')" id="supplierNameId'+i+'">'+suppliersResponce.suppliers[i].firmName+'</label>';
        			 }
        			 $("#supplierdata").html(op);
        			 $("#supplierdata").show();
    				
    			 }
    			 
    			 
    			 if(suppliersResponce.skulist != null ){
    			 var hashLength=Object.keys(suppliersResponce.skulist).length;
    			 var loc = '';
    			 var Total=0;
    			
    			 if(hashLength != "" && hashLength != null && hashLength != undefined && hashLength>0){
    				 for (var i = 0, keys = Object.keys(suppliersResponce.skulist), ii = keys.length; i < ii; i++) {
    					 loc +='<label style="width:49%" >'+keys[i]+'<span style="text-align:right;float: right;">&nbsp &nbsp : &nbsp &nbsp<span></label><label style="width:49%;padding-left: 5px;">'+suppliersResponce.skulist[keys[i]]+'</label>';
    					 Total+=suppliersResponce.skulist[keys[i]];
       				 // console.log('key : ' + keys[i] + ' val : ' + suppliersResponce.skulist[keys[i]]);
       				}
        			 $("#location5").html(loc);
        			 $("#location5").show();
        			 $("#QtyTotalValueId").text(Total);
    			 }
    			 }
    			 
    			 var AvgTotal=0;
    			 if(suppliersResponce.avgSales!=null)
    				 { 				 
    				 var avgLength=Object.keys(suppliersResponce.avgSales).length;
        			 var loc2 = '';
        			 
        			 if(avgLength != "" && avgLength != null && avgLength != undefined && avgLength>0){
        				 for (var j = 0, keys = Object.keys(suppliersResponce.avgSales), jj = keys.length; j < jj; j++) {
        					 loc2 +='<label style="width:49%" >'+keys[j]+'<span style="text-align:right;float: right;">&nbsp &nbsp : &nbsp &nbsp<span></label><label style="width:49%;padding-left: 5px;">'+suppliersResponce.avgSales[keys[j]]+'</label>';
        					 AvgTotal+=suppliersResponce.avgSales[keys[j]];
           				}
            			 $("#AvgsalePop").html(loc2);
            			 $("#AvgsalePop").show();
            			 $("#AvgSaleTotalValueId").text(AvgTotal);
        			 }
    				 }
    			 else
    				 {
    				 $("#AvgSaleTotalValueId").text(AvgTotal);
    				 }
    			
    		}
     
     /*function locationData(){
    	 $('#locationqty').modal('show'); 
     }
     */
     
function changeSuplierdata(costPrice,Supid){
	debugger;
	$(".removeSelectId").removeClass('SelectedSuplier');
	$("#supplierNameId"+Supid).addClass('SelectedSuplier');
	$("#modelCostPrice").text("");
	$("#modelCostPrice").text(costPrice);
}
     
function changeDeliveryLocation(){
	debugger;
	var storeLocation = $("#warehouseLocation option:selected").text();
	$("#deliveryLocation").val(storeLocation).change();
}
     
function addItem(sku){
		 debugger;
		
		 var contextPath = $("#contextPath").val();
		 var len = parseInt($("#productsList tr").length);
		 //debugger
			if (len != 1)
				len = parseInt($("#productsList tr:last").attr("id").replace('dynamicdiv', '')) + 1;
		
		 //added by manasa
		 var trackreq=sku.trackingRequired;
			if(trackreq!=null)
				trackreq = sku.trackingRequired;
			else
				trackreq=false;
		
		 //var trackReq=sku.trackingRequired;
			
			// if(trackreq == false){
		 for (var i = 1; i <= len; i++) {
			 
				if ($("#skuId" + i).val() == sku.skuId  &&  $("#ean"+i).text() == sku.ean && $("#size"+i).text() == sku.size && $("#color"+i).text() == sku.color && $("#productRange"+i).val() == sku.productRange && $("#measureRange"+i).val() == sku.measureRange || ($("#skuId" + i).val() == sku.skuId && $("#itemPrice"+i).text() == sku.costPrice && $("#pluCode" + i).val() == sku.pluCode)) {
					var pack =  parseInt($("#quantity"+i).text())+1;
	    			 $("#quantity"+i).text(pack);
	    			 var cost =  parseFloat($("#itemPrice"+i).text());
	    			 $("#totalCost"+i).text(pack*cost);
	    			 changeTotalOrderCost();
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
			
			
			
			var hsnCode = sku.hsnCode;
			if(hsnCode == null)
				sku.hsnCode = "";
			
			var tax = sku.tax;
			
			
			/*added by Koti bmmineni
			purpose:for cgst sgst caluclation*/
			//var taxRate=tax[0].taxRate;
			
			var taxRate=0.0;
			if(tax!=null)
				if(tax.length>0){
					if(tax[0].saleRangesList.length != null  && tax[0].saleRangesList.length > 0){
					
					for(var t=0;t<tax[0].saleRangesList.length;t++)
					{
					if(parseFloat(tax[0].saleRangesList[t].saleValueTo) >= sku.costPrice && parseFloat(tax[0].saleRangesList[t].saleValueFrom) <= sku.costPrice ){
						taxRate = tax[0].saleRangesList[t].taxRate;
					break;
					}
					}
					}else{
						taxRate = tax[0].taxRate;
					}
				}
			
			
			var igstRate=0.0
			if(tax!=null)
				if(tax.length>0){
			for(var i=0;i<tax.length;i++)
			{
			if(tax[i].taxCode == "IGST"){
				
				 if(tax[i].saleRangesList.length != null  && tax[i].saleRangesList.length > 0){
						
						for(var u=0;u<tax[i].saleRangesList.length;u++)
						{
							if(parseFloat(tax[i].saleRangesList[u].saleValueTo) >= sku.costPrice && parseFloat(tax[i].saleRangesList[u].saleValueFrom) <= sku.costPrice ){
							igstRate = tax[i].saleRangesList[u].taxRate;
						break;
						}	
				 }
				
				}else{
					igstRate = tax[i].taxRate;
				}
				
				
			}
		//	
			}
			}	
			
			
			
			var locationstate = $("#location_state").val();
			var suppierstate = $("#supplier_state").val();
			
			
			 if(locationstate.toUpperCase() !=  suppierstate.toUpperCase()){
				 taxRate = 0.0;
			 }else{
				 igstRate = 0.0;
			 }
			
			
			/*var taxRate=0.0;
		      if(taxRate == null)
		    	  taxRate= 0;
			*/
		      
		      
		      
		      
		      /* var quantity = sku.quantity;
		      if(quantity == null)
		    	  quantity = 1;*/
		      
		      
		    /*if(tax!=null)
				if(tax.length>0){
					if(tax[0].taxType == "Percentage")
						taxamount = parseFloat(((sku.costPrice)*(tax[0].taxRate))/100).toFixed(2);
	                if(tax[0].taxType == "Fixed")
	                	taxamount = tax[0].taxRate;
				}
		      */
		      
			var taxamount = 0.0;
			if(tax!=null)
			if(tax.length>0){
				if(sku.itemTaxExclusive==true)
					{
						taxamount = parseFloat(((sku.costPrice)*(tax[0].taxRate))/100).toFixed(2);
					}
				else
					{
						taxamount = parseFloat(((sku.costPrice) - (((sku.costPrice) / (100 + (tax[0].taxRate) *2 )) * 100)) / 2);
					}
					
			}
			var make = sku.uom;
			if(make == "" || make == null)
				make = "";
			var model = sku.availableQty;
			if(model == null)
				model = "0";
			var color = sku.color;
			if(color == "" || color == null)
				color = "";
			if(sku.trackingRequired == "" || sku.trackingRequired == null)
				sku.trackingRequired = false;
			var size = sku.size;
			if(size == "" || size == null)
				size = "";
			var slNo = 1; 
			 $('.slno').each(function(){
				$(this).text(slNo);
				slNo = parseInt(slNo) + 1;
			});
			 
			 if(sku.profitability == "" || sku.profitability == null || sku.profitability == undefined)
				 {
				  sku.profitability=0;
				 }
			 
			 if(sku.mrpProfitability == "" || sku.mrpProfitability == null || sku.mrpProfitability == undefined)
				 {
				   sku.mrpProfitability=0;
				 }
			 
			 if(sku.averageSaleQty == "" || sku.averageSaleQty == null || sku.averageSaleQty == undefined)
				 {
				   sku.averageSaleQty=0;
				 }
			 
			/* if(sku.trackingRequired == false){
			var row = "<tr id='dynamicdiv"+len+"' style='margin-top:5px;'><td class='slno'>"+slNo+"</td>" +
					"<td id='itemId"+len+"'>"+sku.skuId+"</td>" +
					"<td id='ean"+len+"'>"+sku.ean+"</td>" +
					"<td id='hsnCode"+len+"'>"+sku.hsnCode+"</td>" +
	 		"<input type='hidden' id='skuId"+len+"' value='"+sku.skuId+"'/>" +
	 		"<input type='hidden' id='pluCode"+len+"' value='"+sku.pluCode+"'/>" +
	 		"<input type='hidden' id='category"+len+"' value='"+sku.category+"'/>" +
			"<input type='hidden' id='brandCode"+len+"' value='"+sku.brandCode+"'/>" +
			"<input type='hidden' id='productRange"+len+"' value='"+sku.productRange+"'/>" +
			"<input type='hidden' id='measureRange"+len+"' value='"+sku.measureRange+"'/>" +
			"<input type='hidden' id='utility"+len+"' value='"+sku.utility+"'/>" +
			"<input type='hidden' id='taxRate"+len+"' value='"+taxRate+"'/>" +
			"<input type='hidden' id='cgsgstAmt"+len+"' value='"+taxamount+"'/>" +
			"<input type='hidden' id='trackingRequired"+len+"' value='"+sku.trackingRequired+"'/>"+
	 		"<td id='itemDesc"+len+"' style='width:300px!important;'>"+description+"</td><td class='Price' id='itemPrice"+len+"' onkeypress='PreventEnter(this);' onBlur='changeOrderedPrice(this);' contenteditable='true'>"+parseFloat(sku.costPrice).toFixed(2)+"</td>" +
	 		"<td id='quantity"+len+"' class='Pack' onBlur='changeOrderedPack(this);' onkeypress='PreventEnter(this);' contenteditable='true'>1</td>" +
	 		"<td class='taxcgst'  id='tax"+len+"' onBlur='changeTax(this);' contenteditable='true'>"+parseFloat(taxRate*2).toFixed(2)+"</td>" +
	 		"<td  class='cgstTaxValue' id='cgsttax"+len+"'>"+parseFloat(taxRate).toFixed(2)+"</td>" +
	 		"<td  id='sgsttax"+len+"'>"+parseFloat(taxRate).toFixed(2)+"</td>" +
	 		"<td id='igsttax"+len+"'>"+parseFloat(igstRate).toFixed(2)+"</td>"+
	 		"<td class='cost' id='totalCost"+len+"'>"+(parseFloat(sku.costPrice).toFixed(2))+"</td>" +
	 		"<td id='make"+len+"'>"+make+"</td><td id='model"+len+"'>"+model+"</td><td id='color"+len+"'>"+color+"</td>" +
	 		"<td id='size"+len+"'>"+size+"</td><td id='Del"+ len +"' ><img id='Img"+ len +"' src='"+contextPath+"/images/itemdelete.png' style='width:12%;cursor:pointer;' onclick='deleteItemDetails(this);' title='Delete "+sku.skuId+"'/>" +
	 		"</td></tr>";
			
			 }
			 else
				 {
				 */
	
			 var skudetails=JSON.stringify(sku);
			 if(sku.returnableItem==true)
			 {
			 var row = "<tr id='dynamicdiv"+len+"' style='margin-top:5px;background: #b3ffb3;'><td class='slno sticky-col first-col'  style='width: 60px;background-color: #b3ffb3 !important;'>"+slNo+"</td>" +
				"<td id='itemId"+len+"' onclick='popupsku("+skudetails+")' class='sticky-col second-col' style='background-color: #b3ffb3 !important;' ><a style='text-decoration: underline;cursor: pointer;text-decoration-color: blue;'>"+sku.skuId+"</a></td>" +
				"<td id='ean"+len+"' class='sticky-col third-col' style='background-color: #b3ffb3 !important;'>"+sku.ean+"</td>" +
				"<td id='hsnCode"+len+"' class='sticky-col fourth-col' style='background-color: #b3ffb3 !important;'>"+sku.hsnCode+"</td>" +
		 		"<input type='hidden' id='skuId"+len+"' value='"+sku.skuId+"'/>" +
		 		"<input type='hidden' id='pluCode"+len+"' value='"+sku.pluCode+"'/>" +
		 		"<input type='hidden' id='category"+len+"' value='"+sku.category+"'/>" +
				"<input type='hidden' id='brandCode"+len+"' value='"+sku.brandCode+"'/>" +
				"<input type='hidden' id='productRange"+len+"' value='"+sku.productRange+"'/>" +
				"<input type='hidden' id='measureRange"+len+"' value='"+sku.measureRange+"'/>" +
				"<input type='hidden' id='utility"+len+"' value='"+sku.utility+"'/>" +
				"<input type='hidden' id='taxRate"+len+"' value='"+taxRate+"'/>" +
				"<input type='hidden' id='cgsgstAmt"+len+"' value='"+taxamount+"'/>" +
				"<input type='hidden' id='trackingRequired"+len+"' value='"+sku.trackingRequired+"'/>"+
				"<input type='hidden' id='itemTaxExclusive"+len+"' value='"+sku.itemTaxExclusive+"'/>"+
				"<input type='hidden' id='CostpriceEditable"+len+"' value='"+sku.costpriceEditable+"'/>"+
				"<input type='hidden' id='sgsttax"+len+"' value='"+parseFloat(taxRate).toFixed(2)+"'/>"+
				"<input type='hidden' id='cgstTax"+len+"' value='"+parseFloat(taxRate).toFixed(2)+"'/>"+
				"<input type='hidden' id='igsttax"+len+"' value='"+parseFloat(igstRate).toFixed(2)+"'/>"+
    			"<input type='hidden' id='taxationlist"+len+"' value='"+JSON.stringify(sku.tax)+"'/>" +

				"<td id='itemDesc"+len+"' style='width:300px!important;text-align: left;background-color: #b3ffb3 !important;' class='sticky-col fifth-col'><div id='overflowtext'><a href='#' data-toggle='tooltip'  title='"+description+"'>"+description+"</a></div></td>"+

/*		 		"<td id='itemDesc"+len+"' style='width:300px!important;text-align: left;background-color: #b3ffb3 !important;' class='sticky-col fifth-col'>"+description+"</td>" +
*/		 				"<td class='Price' id='itemPrice"+len+"' onkeypress='PreventEnter(this);' onBlur='changeOrderedPrice(this);' contenteditable='true'>"+parseFloat(sku.costPrice).toFixed(2)+"</td>" +
		 		"<td id='quantity"+len+"' class='Pack'  onBlur='changeOrderedPack(this);' onchange='return (this.innerText.length < 10)' onkeypress='PreventEnter(this);'   contenteditable='true'>1</td>" +
		 		"<td class='taxcgst'  id='tax"+len+"'  onBlur='changeTax(this);'  onkeypress='PreventEnter(this);' contenteditable='true'  >"+parseFloat((taxRate*2)+igstRate).toFixed(2)+"</td>" +
		 		"<td  class='cgstTaxalue' id='cgsttaxvalue"+len+"'>"+parseFloat(taxRate).toFixed(2)+"</td>" +
		 		"<td  id='sgsttaxvalue"+len+"'>"+parseFloat(taxRate).toFixed(2)+"</td>" +
		 		"<td id='igsttaxvalue"+len+"'>"+parseFloat(igstRate).toFixed(2)+"</td>"+
		 		"<td class='cost' id='totalCost"+len+"'>"+(parseFloat(sku.costPrice).toFixed(2))+"</td>" +
		 		"<td class='mrp' id='mrp"+len+"'>"+(parseFloat(sku.mrp).toFixed(2))+"</td>" +
		 		"<td class='salePrice' id='salePrice"+len+"'>"+(parseFloat(sku.salePrice).toFixed(2))+"</td>" +
		 		"<td class='mbq' id='mbq"+len+"'>"+(parseFloat(sku.mbq).toFixed(2))+"</td>" +
		 		"<td class='probability' id='profitability"+len+"'>"+(parseFloat(sku.profitability).toFixed(2))+"</td>" +
		 		"<td class='MrpProbability' id='MrpProfitability"+len+"'>"+(parseFloat(sku.mrpProfitability).toFixed(2))+"</td>" +
		 		"<td id='make"+len+"'>"+make+"</td><td id='model"+len+"' onclick='popupskuQty("+skudetails+")'><a style='text-decoration: underline;cursor: pointer;text-decoration-color: blue;'>"+model+"</a></td>" +
		 		"<td id='avgSale"+len+"' onclick='popupskuAvgQty("+skudetails+")'><a style='text-decoration: underline;cursor: pointer;text-decoration-color: blue;'>"+sku.averageSaleQty+"</a></td><td id='color"+len+"'>"+color+"</td>" +
		 		"<td id='size"+len+"'>"+size+"</td><td id='Del"+ len +"' ><img id='Img"+ len +"' src='"+contextPath+"/images/itemdelete.png' style='width:18px;cursor:pointer;' onclick='deleteItemDetails(this);' title='Delete "+sku.skuId+"'/>" +
		 		"</td></tr>";
			 }
		 else
			 {
			 var row = "<tr id='dynamicdiv"+len+"' style='margin-top:5px;'><td class='slno sticky-col first-col' style='width: 60px;background-color: #ffffff !important;'>"+slNo+"</td>" +
				"<td id='itemId"+len+"' onclick='popupsku("+skudetails+")' class='sticky-col second-col' style='background-color: #ffffff !important;'><a style='text-decoration: underline;cursor: pointer;text-decoration-color: blue;'>"+sku.skuId+"</a></td>" +
				"<td id='ean"+len+"' class='sticky-col third-col' style='background-color: #ffffff !important;'>"+sku.ean+"</td>" +
				"<td id='hsnCode"+len+"' class='sticky-col fourth-col' style='background-color: #ffffff !important;'>"+sku.hsnCode+"</td>" +
		 		"<input type='hidden' id='skuId"+len+"' value='"+sku.skuId+"'/>" +
		 		"<input type='hidden' id='pluCode"+len+"' value='"+sku.pluCode+"'/>" +
		 		"<input type='hidden' id='category"+len+"' value='"+sku.category+"'/>" +
				"<input type='hidden' id='brandCode"+len+"' value='"+sku.brandCode+"'/>" +
				"<input type='hidden' id='productRange"+len+"' value='"+sku.productRange+"'/>" +
				"<input type='hidden' id='measureRange"+len+"' value='"+sku.measureRange+"'/>" +
				"<input type='hidden' id='utility"+len+"' value='"+sku.utility+"'/>" +
				"<input type='hidden' id='taxRate"+len+"' value='"+taxRate+"'/>" +
				"<input type='hidden' id='cgsgstAmt"+len+"' value='"+taxamount+"'/>" +
				"<input type='hidden' id='trackingRequired"+len+"' value='"+sku.trackingRequired+"'/>"+
				"<input type='hidden' id='itemTaxExclusive"+len+"' value='"+sku.itemTaxExclusive+"'/>"+
				"<input type='hidden' id='CostpriceEditable"+len+"' value='"+sku.costpriceEditable+"'/>"+
				"<input type='hidden' id='sgsttax"+len+"' value='"+parseFloat(taxRate).toFixed(2)+"'/>"+
				"<input type='hidden' id='cgstTax"+len+"' value='"+parseFloat(taxRate).toFixed(2)+"'/>"+
				"<input type='hidden' id='igsttax"+len+"' value='"+parseFloat(igstRate).toFixed(2)+"'/>"+
    			"<input type='hidden' id='taxationlist"+len+"' value='"+JSON.stringify(sku.tax)+"'/>" +

				"<td id='itemDesc"+len+"' style='width:300px!important;text-align: left;background-color: #b3ffb3 !important;' class='sticky-col fifth-col'><div id='overflowtext'><a href='#' data-toggle='tooltip'  title='"+description+"'>"+description+"</a></div></td>"+

/*		 		"<td id='itemDesc"+len+"' class='sticky-col fifth-col' style='width:300px!important;text-align: left;background-color: #ffffff !important;'>"+description+"</td>" +
*/		 				"<td class='Price' id='itemPrice"+len+"' onkeypress='PreventEnter(this);' onBlur='changeOrderedPrice(this);' contenteditable='true'>"+parseFloat(sku.costPrice).toFixed(2)+"</td>" +
		 		"<td id='quantity"+len+"' class='Pack'  onBlur='changeOrderedPack(this);' onchange='return (this.innerText.length < 10)' onkeypress='PreventEnter(this);'   contenteditable='true'>1</td>" +
		 		"<td class='taxcgst'  id='tax"+len+"'  onBlur='changeTax(this);'  onkeypress='PreventEnter(this);' contenteditable='true'  >"+parseFloat((taxRate*2)+igstRate).toFixed(2)+"</td>" +
		 		"<td  class='cgstTaxValue' id='cgsttaxvalue"+len+"'>"+parseFloat(taxRate).toFixed(2)+"</td>" +
		 		"<td  id='sgsttaxvalue"+len+"'>"+parseFloat(taxRate).toFixed(2)+"</td>" +
		 		"<td id='igsttaxvalue"+len+"'>"+parseFloat(igstRate).toFixed(2)+"</td>"+
		 		"<td class='cost' id='totalCost"+len+"'>"+(parseFloat(sku.costPrice).toFixed(2))+"</td>" +
		 		"<td class='mrp' id='mrp"+len+"'>"+(parseFloat(sku.mrp).toFixed(2))+"</td>" +
		 		"<td class='salePrice' id='salePrice"+len+"'>"+(parseFloat(sku.salePrice).toFixed(2))+"</td>" +
		 		"<td class='mbq' id='mbq"+len+"'>"+(parseFloat(sku.mbq).toFixed(2))+"</td>" +
		 		"<td class='probability' id='profitability"+len+"'>"+(parseFloat(sku.profitability).toFixed(2))+"</td>" +
		 		"<td class='MrpProbability' id='MrpProfitability"+len+"'>"+(parseFloat(sku.mrpProfitability).toFixed(2))+"</td>" +
		 		"<td id='make"+len+"'>"+make+"</td><td id='model"+len+"' onclick='popupskuQty("+skudetails+")' ><a style='text-decoration: underline;cursor: pointer;text-decoration-color: blue;'>"+model+"</a></td>" +
		 		"<td id='avgSale"+len+"' onclick='popupskuAvgQty("+skudetails+")'><a style='text-decoration: underline;cursor: pointer;text-decoration-color: blue;'>"+sku.averageSaleQty+"</a></td><td id='color"+len+"'>"+color+"</td>" +
		 		"<td id='size"+len+"'>"+size+"</td><td id='Del"+ len +"' ><img id='Img"+ len +"' src='"+contextPath+"/images/itemdelete.png' style='width:18px;cursor:pointer;' onclick='deleteItemDetails(this);' title='Delete "+sku.skuId+"'/>" +
		 		"</td></tr>";
			 }
			$("#productsList tbody").append(row);
			changeTotalOrderCost();
			
	}
			
	


function addItemsforAutoAppend(skudetails){
		 debugger;
		
		 var contextPath = $("#contextPath").val();
		 $("#productsList tbody tr").remove();
		 var len = parseInt($("#productsList tr").length);
		 //debugger
			if (len != 1)
				len = parseInt($("#productsList tr:last").attr("id").replace('dynamicdiv', '')) + 1;
		
		
		 
			for(var j = 0;j<skudetails.length;j++){
			
				 
				 var trackreq=skudetails[j].trackingRequired;
					if(trackreq!=null)
						trackreq = skudetails[j].trackingRequired;
					else
						trackreq=false;
				
		 for (var i = 1; i <= len; i++) {
			 
				if ($("#skuId" + i).val() == skudetails[j].skuId  &&  $("#ean"+i).text() == skudetails[j].ean && $("#size"+i).text() == skudetails[j].size && $("#color"+i).text() == skudetails[j].color && $("#productRange"+i).val() == skudetails[j].productRange && $("#measureRange"+i).val() == skudetails[j].measureRange || ($("#skuId" + i).val() == skudetails[j].skuId && $("#itemPrice"+i).text() == skudetails[j].costPrice && $("#pluCode" + i).val() == skudetails[j].pluCode)) {
					var pack =  parseInt($("#quantity"+i).text())+1;
	    			 $("#quantity"+i).text(pack);
	    			 var cost =  parseFloat($("#itemPrice"+i).text());
	    			 $("#totalCost"+i).text(pack*cost);
	    			 changeTotalOrderCost();
	        		 return;
				}
			 }
			
			var description = null;
			if (skudetails[j].description != "" && skudetails[j].description != null)
				description = skudetails[j].description;
			else
				description = $("#desc").val();
			var brandCode = skudetails[j].brandCode;
			if(brandCode == null)
				skudetails[j].brandCode = "";
			var category = skudetails[j].category;
			if(category == null)
				skudetails[j].category = "";
			var productRange = skudetails[j].productRange;
			if(productRange == null)
				skudetails[j].productRange = "";
			var measureRange = skudetails[j].measureRange;
			if(measureRange == null)
				skudetails[j].measureRange = "";
			var color = skudetails[j].color;
			if(color == null)
				skudetails[j].color = "";
			var ean = skudetails[j].ean;
			if(ean == null)
				skudetails[j].ean = "";
			var utility = skudetails[j].utility;
			if(utility == null)
				skudetails[j].utility = "";

			var size = skudetails[j].size;
			if(size == null)
				skudetails[j].size = "";
			
			
			
			var hsnCode = skudetails[j].hsnCode;
			if(hsnCode == null)
				skudetails[j].hsnCode = "";
			
			var tax = skudetails[j].tax;
			
			
			/*added by manasa
			purpose:for cgst sgst caluclation*/
			//var taxRate=tax[0].taxRate;
			
			var taxRate=0.0;
			if(tax!=null)
				if(tax.length>0){
				 taxRate=tax[0].taxRate;
				}
			
			
			var igstRate=0.0
			if(tax!=null)
				if(tax.length>0){
			for(var i=0;i<tax.length;i++)
			{
			if(tax[i].taxCode == "IGST")
			igstRate = tax[i].taxRate;
			}
			}	
			
		      
			var taxamount = 0.0;
			if(tax!=null)
			if(tax.length>0){
				if(skudetails[j].itemTaxExclusive==true)
					{
						taxamount = parseFloat(((skudetails[j].costPrice)*(tax[0].taxRate))/100).toFixed(2);
					}
				else
					{
						taxamount = parseFloat(((skudetails[j].costPrice) - (((skudetails[j].costPrice) / (100 + (tax[0].taxRate) *2 )) * 100)) / 2);
					}
					
			}
			
		
			var make = skudetails[j].uom;
			if(make == "" || make == null)
				make = "";
			var model = skudetails[j].availableQty;
			if(model == null)
				model = "0";
			var color = skudetails[j].color;
			if(color == "" || color == null)
				color = "";
			
			
			if(skudetails[j].mbq == "0" || skudetails[j].mbq == null)
				skudetails[j].mbq = "0";
			
			
			
			if(skudetails[j].trackingRequired == "" || skudetails[j].trackingRequired == null)
				skudetails[j].trackingRequired = false;
			
			
			
			if(skudetails[j].itemTaxExclusive == "" || skudetails[j].itemTaxExclusive == null)
				skudetails[j].itemTaxExclusive = false;
			
			
			
			if(skudetails[j].costpriceEditable == "" || skudetails[j].costpriceEditable == null)
				skudetails[j].costpriceEditable = false;
			var size = skudetails[j].size;
			if(size == "" || size == null)
				size = "";
			var slNo = 1; 
			 $('.slno').each(function(){
				$(this).text(slNo);
				slNo = parseInt(slNo) + 1;
			});
			 
			 if(skudetails[j].profitability == "" || skudetails[j].profitability == null || skudetails[j].profitability == undefined)
				 {
				  skudetails[j].profitability=0;
				 }
			 
			 if(skudetails[j].mrpProfitability == "" || skudetails[j].mrpProfitability == null || skudetails[j].mrpProfitability == undefined)
				 {
				   skudetails[j].mrpProfitability=0;
				 }
			 
			 if(skudetails[j].averageSaleQty == "" || skudetails[j].averageSaleQty == null || skudetails[j].averageSaleQty == undefined)
				 {
				   skudetails[j].averageSaleQty=0;
				 }
			 
			
	        var skuDetailsData = JSON.stringify(skudetails[j]);
			
			 if(skudetails[j].returnableItem==true)
			 {
			 var row = "<tr id='dynamicdiv"+len+"' style='margin-top:5px;background: #b3ffb3;'><td class='slno sticky-col first-col'  style='width: 60px;background-color: #b3ffb3 !important;'>"+slNo+"</td>" +
				"<td id='itemId"+len+"' onclick='popupsku("+skuDetailsData+")' class='sticky-col second-col' style='background-color: #b3ffb3 !important;' ><a style='text-decoration: underline;cursor: pointer;text-decoration-color: blue;'>"+skudetails[j].skuId+"</a></td>" +
				"<td id='ean"+len+"' class='sticky-col third-col' style='background-color: #b3ffb3 !important;'>"+skudetails[j].ean+"</td>" +
				"<td id='hsnCode"+len+"' class='sticky-col fourth-col' style='background-color: #b3ffb3 !important;'>"+skudetails[j].hsnCode+"</td>" +
		 		"<input type='hidden' id='skuId"+len+"' value='"+skudetails[j].skuId+"'/>" +
		 		"<input type='hidden' id='pluCode"+len+"' value='"+skudetails[j].pluCode+"'/>" +
		 		"<input type='hidden' id='category"+len+"' value='"+skudetails[j].category+"'/>" +
				"<input type='hidden' id='brandCode"+len+"' value='"+skudetails[j].brandCode+"'/>" +
				"<input type='hidden' id='productRange"+len+"' value='"+skudetails[j].productRange+"'/>" +
				"<input type='hidden' id='measureRange"+len+"' value='"+skudetails[j].measureRange+"'/>" +
				"<input type='hidden' id='utility"+len+"' value='"+skudetails[j].utility+"'/>" +
				"<input type='hidden' id='taxRate"+len+"' value='"+taxRate+"'/>" +
				"<input type='hidden' id='cgsgstAmt"+len+"' value='"+taxamount+"'/>" +
				"<input type='hidden' id='trackingRequired"+len+"' value='"+skudetails[j].trackingRequired+"'/>"+
				"<input type='hidden' id='itemTaxExclusive"+len+"' value='"+skudetails[j].itemTaxExclusive+"'/>"+
				"<input type='hidden' id='CostpriceEditable"+len+"' value='"+skudetails[j].costpriceEditable+"'/>"+
    		
				"<td id='itemDesc"+len+"' style='width:300px!important;text-align: left;background-color: #b3ffb3 !important;' class='sticky-col fifth-col'><div id='overflowtext'><a href='#' data-toggle='tooltip'  title='"+description+"'>"+description+"</a></div></td>"+

/*		 		"<td id='itemDesc"+len+"' style='width:300px!important;text-align: left;background-color: #b3ffb3 !important;' class='sticky-col fifth-col'>"+description+"</td>" +
*/		 				"<td class='Price' id='itemPrice"+len+"' onkeypress='PreventEnter(this);' onBlur='changeOrderedPrice(this);' contenteditable='true'>"+parseFloat(skudetails[j].costPrice).toFixed(2)+"</td>" +
		 		"<td id='quantity"+len+"' class='Pack'  onBlur='changeOrderedPack(this);' onchange='return (this.innerText.length < 10)' onkeypress='PreventEnter(this);'   contenteditable='true'>1</td>" +
		 		"<td class='taxcgst'  id='tax"+len+"'  onBlur='changeTax(this);'  onkeypress='PreventEnter(this);' contenteditable='true'  >"+parseFloat(taxRate*2).toFixed(2)+"</td>" +
		 		"<td  class='cgstTaxValue' id='cgsttax"+len+"'>"+parseFloat(taxRate).toFixed(2)+"</td>" +
		 		"<td  id='sgsttax"+len+"'>"+parseFloat(taxRate).toFixed(2)+"</td>" +
		 		"<td id='igsttax"+len+"'>"+parseFloat(igstRate).toFixed(2)+"</td>"+
		 		"<td class='cost' id='totalCost"+len+"'>"+(parseFloat(skudetails[j].costPrice).toFixed(2))+"</td>" +
		 		"<td class='mrp' id='mrp"+len+"'>"+(parseFloat(skudetails[j].mrp).toFixed(2))+"</td>" +
		 		"<td class='salePrice' id='salePrice"+len+"'>"+(parseFloat(skudetails[j].salePrice).toFixed(2))+"</td>" +
		 		"<td class='mbq' id='mbq"+len+"'>"+(parseFloat(skudetails[j].mbq).toFixed(2))+"</td>" +
		 		"<td class='probability' id='profitability"+len+"'>"+(parseFloat(skudetails[j].profitability).toFixed(2))+"</td>" +
		 		"<td class='MrpProbability' id='MrpProfitability"+len+"'>"+(parseFloat(skudetails[j].mrpProfitability).toFixed(2))+"</td>" +
		 		"<td id='make"+len+"'>"+make+"</td><td id='model"+len+"' onclick='popupskuQty("+skuDetailsData+")'><a style='text-decoration: underline;cursor: pointer;text-decoration-color: blue;'>"+model+"</a></td>" +
		 		"<td id='avgSale"+len+"' onclick='popupskuAvgQty("+skuDetailsData+")'><a style='text-decoration: underline;cursor: pointer;text-decoration-color: blue;'>"+skudetails[j].averageSaleQty+"</a></td><td id='color"+len+"'>"+color+"</td>" +
		 		"<td id='size"+len+"'>"+size+"</td><td id='Del"+ len +"' ><img id='Img"+ len +"' src='"+contextPath+"/images/itemdelete.png' style='width:18px;cursor:pointer;' onclick='deleteItemDetails(this);' title='Delete "+skudetails[j].skuId+"'/>" +
		 		"</td></tr>";
			 }
		 else
			 {
			 var row = "<tr id='dynamicdiv"+len+"' style='margin-top:5px;'><td class='slno sticky-col first-col' style='width: 60px;background-color: #ffffff !important;'>"+slNo+"</td>" +
				"<td id='itemId"+len+"' onclick='popupsku("+skuDetailsData+")' class='sticky-col second-col' style='background-color: #ffffff !important;'><a style='text-decoration: underline;cursor: pointer;text-decoration-color: blue;'>"+skudetails[j].skuId+"</a></td>" +
				"<td id='ean"+len+"' class='sticky-col third-col' style='background-color: #ffffff !important;'>"+skudetails[j].ean+"</td>" +
				"<td id='hsnCode"+len+"' class='sticky-col fourth-col' style='background-color: #ffffff !important;'>"+skudetails[j].hsnCode+"</td>" +
		 		"<input type='hidden' id='skuId"+len+"' value='"+skudetails[j].skuId+"'/>" +
		 		"<input type='hidden' id='pluCode"+len+"' value='"+skudetails[j].pluCode+"'/>" +
		 		"<input type='hidden' id='category"+len+"' value='"+skudetails[j].category+"'/>" +
				"<input type='hidden' id='brandCode"+len+"' value='"+skudetails[j].brandCode+"'/>" +
				"<input type='hidden' id='productRange"+len+"' value='"+skudetails[j].productRange+"'/>" +
				"<input type='hidden' id='measureRange"+len+"' value='"+skudetails[j].measureRange+"'/>" +
				"<input type='hidden' id='utility"+len+"' value='"+skudetails[j].utility+"'/>" +
				"<input type='hidden' id='taxRate"+len+"' value='"+taxRate+"'/>" +
				"<input type='hidden' id='cgsgstAmt"+len+"' value='"+taxamount+"'/>" +
				"<input type='hidden' id='trackingRequired"+len+"' value='"+skudetails[j].trackingRequired+"'/>"+
				"<input type='hidden' id='itemTaxExclusive"+len+"' value='"+skudetails[j].itemTaxExclusive+"'/>"+
				"<input type='hidden' id='CostpriceEditable"+len+"' value='"+skudetails[j].costpriceEditable+"'/>"+
				
				"<td id='itemDesc"+len+"' style='width:300px!important;text-align: left;background-color: #b3ffb3 !important;' class='sticky-col fifth-col'><div id='overflowtext'><a href='#' data-toggle='tooltip'  title='"+description+"'>"+description+"</a></div></td>"+

/*		 		"<td id='itemDesc"+len+"' class='sticky-col fifth-col' style='width:300px!important;text-align: left;background-color: #ffffff !important;'>"+description+"</td>" +
*/		 				"<td class='Price' id='itemPrice"+len+"' onkeypress='PreventEnter(this);' onBlur='changeOrderedPrice(this);' contenteditable='true'>"+parseFloat(skudetails[j].costPrice).toFixed(2)+"</td>" +
		 		"<td id='quantity"+len+"' class='Pack'  onBlur='changeOrderedPack(this);' onchange='return (this.innerText.length < 10)' onkeypress='PreventEnter(this);'   contenteditable='true'>1</td>" +
		 		"<td class='taxcgst'  id='tax"+len+"'  onBlur='changeTax(this);'  onkeypress='PreventEnter(this);' contenteditable='true'  >"+parseFloat(taxRate*2).toFixed(2)+"</td>" +
		 		"<td  class='cgstTaxValue' id='cgsttax"+len+"'>"+parseFloat(taxRate).toFixed(2)+"</td>" +
		 		"<td  id='sgsttax"+len+"'>"+parseFloat(taxRate).toFixed(2)+"</td>" +
		 		"<td id='igsttax"+len+"'>"+parseFloat(igstRate).toFixed(2)+"</td>"+
		 		"<td class='cost' id='totalCost"+len+"'>"+(parseFloat(skudetails[j].costPrice).toFixed(2))+"</td>" +
		 		"<td class='mrp' id='mrp"+len+"'>"+(parseFloat(skudetails[j].mrp).toFixed(2))+"</td>" +
		 		"<td class='salePrice' id='salePrice"+len+"'>"+(parseFloat(skudetails[j].salePrice).toFixed(2))+"</td>" +
		 		"<td class='mbq' id='mbq"+len+"'>"+(parseFloat(skudetails[j].mbq).toFixed(2))+"</td>" +
		 		"<td class='probability' id='profitability"+len+"'>"+(parseFloat(skudetails[j].profitability).toFixed(2))+"</td>" +
		 		"<td class='MrpProbability' id='MrpProfitability"+len+"'>"+(parseFloat(skudetails[j].mrpProfitability).toFixed(2))+"</td>" +
		 		"<td id='make"+len+"'>"+make+"</td><td id='model"+len+"' onclick='popupskuQty("+skuDetailsData+")' ><a style='text-decoration: underline;cursor: pointer;text-decoration-color: blue;'>"+model+"</a></td>" +
		 		"<td id='avgSale"+len+"' onclick='popupskuAvgQty("+skuDetailsData+")'><a style='text-decoration: underline;cursor: pointer;text-decoration-color: blue;'>"+skudetails[j].averageSaleQty+"</a></td><td id='color"+len+"'>"+color+"</td>" +
		 		"<td id='size"+len+"'>"+size+"</td><td id='Del"+ len +"' ><img id='Img"+ len +"' src='"+contextPath+"/images/itemdelete.png' style='width:18px;cursor:pointer;' onclick='deleteItemDetails(this);' title='Delete "+skudetails[j].skuId+"'/>" +
		 		"</td></tr>";
			 }
			$("#productsList tbody").append(row);
			changeTotalOrderCost();
			}
			
	}


	 
	 //added by manasa
 function addExcelItem(sku,last){
	
	
	
		 var contextPath = $("#contextPath").val();
		 var len = parseInt($("#productsList tr").length);
		// alert("table"+len)add
		 //debugger
	if(last == undefined){
	last =0; 
	}
	
	
			if (len != 1)
				len = parseInt($("#productsList tr:last").attr("id").replace('dynamicdiv', '')) + 1;
			for (var i = 1; i <=len; i++) {
				if ($("#skuId" + i).val() == sku.skuID   && $("#ean"+i).text() == sku.ean ) {
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
			if(color == null || color == 'null')
				sku.color = "";
			var ean = sku.ean;
			if(ean == null)
				sku.ean = "";
			
			var utility = sku.utility;
			if(utility == null)
				sku.utility = "";

			var size = sku.size;
			if(size == null || size == 'null')
				sku.size = "";
			
			
			
		      
		    var quantity = sku.quantity;
		      if(quantity == null)
		    	  quantity = 1;
			
			var tax = sku.tax;

		      var taxRate=0.0;
				if(tax!=null)
					if(tax.length>0){
						if(tax[0].saleRangesList.length != null || tax[0].saleRangesList.length>0){
							
							for(var t=0;t<tax[0].saleRangesList.length;t++)
							{
								if(parseFloat(tax[0].saleRangesList[t].saleValueTo) >= sku.cost && parseFloat(tax[0].saleRangesList[t].saleValueFrom) <= sku.cost ){
									taxRate = tax[0].saleRangesList[t].taxRate;
								break;
								}	
							}
							}else{
								taxRate = tax[0].taxRate;
							}
					}

			
		      
		    var quantity = sku.quantity;
		      if(quantity == null)
		    	  quantity = 1;
		      
		    /*  var costprice=sku.costPrice;
		      if(costprice == null || costprice=="")
		    	alert("price should not be empty")
		    	return;*/
		      
		      /*var cgstRate=sku.cgstRate;
		      if(cgstRate == null)
		    	  cgstRate = 0.0;
		      
		      var sgstRate=sku.sgstRate;
		      if(sgstRate == null)
		    	  sgstRate = 0.0;
*/
		      
		      var igstRate=0.0
				if(tax!=null)
					if(tax.length>0){
				for(var i=0;i<tax.length;i++)
				{
				if(tax[i].taxCode == "IGST")
					 if(tax[i].saleRangesList.length != null || tax[i].saleRangesList.length>0){
							
							for(var u=0;u<tax[i].saleRangesList.length;u++)
							{
								if(parseFloat(tax[i].saleRangesList[u].saleValueTo) >= sku.cost && parseFloat(tax[i].saleRangesList[u].saleValueFrom) <= sku.cost ){
									igstRate = tax[i].saleRangesList[u].taxRate;
								break;
								}	
							}	
					
					}else{
						igstRate = tax[i].taxRate;
					}
				}
				}
		      
		    
		      
		      var locationstate = $("#location_state").val();
				var suppierstate = $("#supplier_state").val();
				
				
				 if(locationstate.toUpperCase() !=  suppierstate.toUpperCase()){
					 taxRate = 0.0;
				 }else{
					 igstRate = 0.0;
				 }
				
		      
		      
		      var hsnCode = sku.hsnCode;
				if(hsnCode == null)
					sku.hsnCode = "";
				
				if(sku.cost == "" || sku.cost == null || sku.cost==undefined)
					sku.cost = 0;
				
				var taxamount = 0.0;
				if(tax!=null)
					if(tax.length>0){
							taxamount = parseFloat(((sku.cost)*(tax[0].taxRate))/100).toFixed(2);
					}

			
			
			var make = sku.uom;
			if(make == "" || make == null)
				make = "";
			
			
			if(sku.quantityInHand>0)
				{
						if(sku.availableQty == "" || sku.availableQty == null || sku.availableQty==undefined)
							sku.availableQty = sku.quantityInHand;
				}
			
			var model = sku.availableQty;
			if(model == null)
				model = "0";
			
			var color = sku.color;
			if(color == "" || color == null)
				color = "";
			var size = sku.size;
			if(size == "" || size == null)
				size = "";
			
			if(sku.quantity == "" || sku.quantity == null || sku.quantity==undefined)
				sku.quantity = 1;
			
			
			
			if(sku.mrp == "" || sku.mrp == null || sku.mrp==undefined)
				sku.mrp = 0;
			
			if(sku.mbq == "" || sku.mbq == null || sku.mbq==undefined)
				sku.mbq = 0;
			
			var slNo = 1; 
			 $('.slno').each(function(){
				$(this).text(slNo);
				slNo = parseInt(slNo) + 1;
			});
			 
			 if(sku.profitability == "" || sku.profitability == null || sku.profitability == undefined)
			 {
			  sku.profitability=0;
			 }
		 
		 if(sku.mrpProfitability == "" || sku.mrpProfitability == null || sku.mrpProfitability == undefined)
			 {
			   sku.mrpProfitability=0;
			 }
		 
		 if(sku.averageSaleQty == "" || sku.averageSaleQty == null || sku.averageSaleQty == undefined)
			 {
			   sku.averageSaleQty=0;
			 }
			 
			 
			 
			 var skudetails=JSON.stringify(sku);
			
			var row = "<tr id='dynamicdiv"+len+"' style='margin-top:5px;'><td class='slno sticky-col first-col' style='width: 60px;background-color: #ffffff !important;'>"+slNo+"</td>" +
					"<td id='itemId"+len+"' onclick='popupsku("+skudetails+")' class='sticky-col second-col' style='background-color: #ffffff !important;'><a style='text-decoration: underline;cursor: pointer;text-decoration-color: blue;'>"+sku.skuID+"</a></td>" +
					"<td id='ean"+len+"' class='sticky-col third-col' style='background-color: #ffffff !important;'>"+sku.ean+"</td>" +
					"<td id='hsnCode"+len+"' class='sticky-col fourth-col' style='background-color: #ffffff !important;'>"+sku.hsnCode+"</td>" +
	 		"<input type='hidden' id='skuId"+len+"' value='"+sku.skuID+"'/>" +
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
			"<input type='hidden' id='taxRate"+len+"' value='"+taxRate+"'/>" +
			"<input type='hidden' id='cgstAmt"+len+"' value='"+taxamount+"'/>" +
			"<input type='hidden' id='sgsttax"+len+"' value='"+parseFloat(taxRate).toFixed(2)+"'/>"+
			"<input type='hidden' id='cgstTax"+len+"' value='"+parseFloat(taxRate).toFixed(2)+"'/>"+
			"<input type='hidden' id='igsttax"+len+"' value='"+parseFloat(igstRate).toFixed(2)+"'/>"+
			"<input type='hidden' id='taxationlist"+len+"' value='"+JSON.stringify(sku.tax)+"'/>" +

			"<td id='itemDesc"+len+"' style='width:300px!important;background-color: #ffffff !important;' class='sticky-col fifth-col'><div id='overflowtext'><a href='#' data-toggle='tooltip'  title='"+description+"'>"+description+"</a></div></td>"+

/*	 		"<td id='itemDesc"+len+"' style='width:300px!important;background-color: #ffffff !important;' class='sticky-col fifth-col'>"+description+"</td>" +
*/	 				"<td class='Price' id='itemPrice"+len+"' onkeypress='PreventEnter(this);' onBlur='changeOrderedPrice(this);' contenteditable='true'>"+parseFloat(sku.cost).toFixed(2)+"</td>" +
	 		"<td id='quantity"+len+"' class='Pack' onBlur='changeOrderedPack(this);' onkeypress='PreventEnter(this);' contenteditable='true'>"+quantity+"</td>" +
	 		"<td  id='tax"+len+"' onBlur='changeTax(this);' contenteditable='true'>"+parseFloat((taxRate*2)+igstRate).toFixed(2)+"</td>" +
	 		"<td  id='cgsttaxvalue"+len+"'>"+parseFloat(taxRate).toFixed(2)+"</td>" +
	 		"<td  id='sgsttaxvalue"+len+"'>"+parseFloat(taxRate).toFixed(2)+"</td>" +
	 		"<td id='igsttaxvalue"+len+"'>"+parseFloat(igstRate).toFixed(2)+"</td>"+
	 		"<td class='cost' id='totalCost"+len+"'>"+(parseFloat(sku.cost)* parseFloat(sku.quantity)).toFixed(2)+"</td>" +
	 		"<td class='mrp' id='mrp"+len+"'>"+(parseFloat(sku.mrp).toFixed(2))+"</td>" +
	 		"<td class='salePrice' id='salePrice"+len+"'>"+(parseFloat(sku.price).toFixed(2))+"</td>" +
	 		"<td class='mbq' id='mbq"+len+"'>"+(parseFloat(sku.mbq).toFixed(2))+"</td>" +
	 		"<td class='probability' id='profitability"+len+"'>"+(parseFloat(sku.profitability).toFixed(2))+"</td>" +
	 		"<td class='MrpProbability' id='MrpProfitability"+len+"'>"+(parseFloat(sku.mrpProfitability).toFixed(2))+"</td>" +
	 		"<td id='make"+len+"'>"+make+"</td><td id='model"+len+"' onclick='popupskuQty("+skudetails+")'><a style='text-decoration: underline;cursor: pointer;text-decoration-color: blue;'>"+model+"</a></td>" +
	 		"<td id='avgSale"+len+"' onclick='popupskuAvgQty("+skudetails+")'><a style='text-decoration: underline;cursor: pointer;text-decoration-color: blue;'>"+sku.averageSaleQty+"</a></td><td id='color"+len+"'>"+color+"</td>" +
	 		"<td id='size"+len+"'>"+size+"</td><td id='Del"+ len +"' ><img id='Img"+ len +"' src='"+contextPath+"/images/itemdelete.png' style='width:32%;cursor:pointer;' onclick='deleteItemDetails(this);' title='Delete "+sku.skuId+"'/>" +
	 		"</td></tr>";
			$("#productsList tbody").append(row);
			
		if(last != undefined && last != 0  ){
			 debugger;
			changeTotalOrderCost();
			
		}
			
				
	}
 
 function changeTotalPOitems(){
		debugger;
		 var countValue= 0;
		 var noofitems = 0.0;

		$('.cost').each(function(){
			  var rowNo = $(this).attr("id").replace('totalCost','');
			 noofitems = noofitems+  parseFloat($("#quantity"+rowNo).html());
			 
			 countValue = countValue+1;

	 });

		
	$("#totalqty").val(noofitems);
	 $("#noofitems").val(countValue);
		}
 
	 
	 
	 
	 function changeTotalOrderCost(){
		 debugger;
		 var totalCost = 0.0;
		 var totaltax = 0.0;
		 var taxesValue=0.0;
		 var cgstsgstAmt=0.0;
		 var cgstsgstTaxAmt=0.0;
		 var cgstAmt=0.0;
		 var countValue= 0;
		 var noofitems = 0.0;
			$('.cost').each(function(){
				  var rowNo = $(this).attr("id").replace('totalCost','');
				  var prPrice = $("#itemPrice"+rowNo).html();
				  var taxlist=$("#taxationlist"+rowNo).val();
				  if(taxlist != undefined){
				  var tax = JSON.parse(taxlist);
				  
				  if(tax != undefined && tax != null){
					  
					  
					  var taxRate=0.0;
						if(tax!=null)
							if(tax.length>0){
								if(tax[0].saleRangesList.length != null  && tax[0].saleRangesList.length > 0){
								
								for(var t=0;t<tax[0].saleRangesList.length;t++)
								{
								if(parseFloat(tax[0].saleRangesList[t].saleValueTo) >= prPrice && parseFloat(tax[0].saleRangesList[t].saleValueFrom) <= prPrice ){
									taxRate = tax[0].saleRangesList[t].taxRate;
								break;
								}
								}
								}else{
									taxRate = tax[0].taxRate;
								}
							}
						
						
						var igstRate=0.0
						if(tax!=null)
							if(tax.length>0){
						for(var i=0;i<tax.length;i++)
						{
						if(tax[i].taxCode == "IGST"){
							
							 if(tax[i].saleRangesList.length != null  && tax[i].saleRangesList.length > 0){
									
									for(var u=0;u<tax[i].saleRangesList.length;u++)
									{
										if(parseFloat(tax[i].saleRangesList[u].saleValueTo) >= prPrice && parseFloat(tax[i].saleRangesList[u].saleValueFrom) <= prPrice ){
										igstRate = tax[i].saleRangesList[u].taxRate;
									break;
									}	
							 }
							
							}else{
								igstRate = tax[i].taxRate;
							}
							
							
						}
					//	
						}
						}	
						
						
						
						var locationstate = $("#location_state").val();
						var suppierstate = $("#supplier_state").val();
						
						
						 if(locationstate.toUpperCase() !=  suppierstate.toUpperCase()){
							 taxRate = 0.0;
						 }else{
							 igstRate = 0.0;
						 }
						
						 var costPriceForTax = $("#itemPrice"+rowNo).html()*$("#quantity"+rowNo).html();
							var  itemTaxExcl = (((parseFloat(prPrice) * (parseFloat(taxRate*2)+igstRate)) / 100));
							var exclsiveCost = parseFloat(prPrice)+itemTaxExcl;
						 
							  var taxRate=0.0;
								if(tax!=null)
									if(tax.length>0){
										if(tax[0].saleRangesList.length != null  && tax[0].saleRangesList.length > 0){
										
										for(var t=0;t<tax[0].saleRangesList.length;t++)
										{
										if(parseFloat(tax[0].saleRangesList[t].saleValueTo) >= exclsiveCost && parseFloat(tax[0].saleRangesList[t].saleValueFrom) <= exclsiveCost ){
											taxRate = tax[0].saleRangesList[t].taxRate;
										break;
										}
										}
										}else{
											taxRate = tax[0].taxRate;
										}
									}
								
								
								var igstRate=0.0
								if(tax!=null)
									if(tax.length>0){
								for(var i=0;i<tax.length;i++)
								{
								if(tax[i].taxCode == "IGST"){
									
									 if(tax[i].saleRangesList.length != null  && tax[i].saleRangesList.length > 0){
											
											for(var u=0;u<tax[i].saleRangesList.length;u++)
											{
												if(parseFloat(tax[i].saleRangesList[u].saleValueTo) >= exclsiveCost && parseFloat(tax[i].saleRangesList[u].saleValueFrom) <= exclsiveCost ){
												igstRate = tax[i].saleRangesList[u].taxRate;
											break;
											}	
									 }
									
									}else{
										igstRate = tax[i].taxRate;
									}
									
									
								}
							//	
								}
								}	
								
								
								
								var locationstate = $("#location_state").val();
								var suppierstate = $("#supplier_state").val();
								
								
								 if(locationstate.toUpperCase() !=  suppierstate.toUpperCase()){
									 taxRate = 0.0;
									 $("#sgsttax"+rowNo).val(taxRate);
									 $("#igsttax"+rowNo).val(igstRate);
								 }else{
									 igstRate = 0.0;
									 $("#sgsttax"+rowNo).val(taxRate);
									 $("#igsttax"+rowNo).val(igstRate);
								 }
								
							
					  
						 $("#tax"+rowNo).html((taxRate*2)+igstRate);
						 $("#igsttax"+rowNo).val(igstRate);
						 
					  
				  }
				  }
				  
				  
				  
				  
				  var cost = $("#totalCost"+rowNo).html();
				  var taxvalue =  ($("#tax"+rowNo).html()*$("#itemPrice"+rowNo).html())*$("#quantity"+rowNo).html()/100;
				  
				  var itemcostprice =  (parseFloat(prPrice)*$("#quantity"+rowNo).html())+parseFloat(taxvalue);
				  /*var taxExclusive=$("#itemTaxExclusive"+rowNo).val();
				  if(taxExclusive=="true")
					  {
					  totalCost = totalCost + parseFloat(cost);
					  }
				  else
					  {*/
					  totalCost = totalCost +(parseFloat(prPrice)*$("#quantity"+rowNo).html())+ parseFloat(taxvalue);
					 /* }*/
				  
				  totaltax = totaltax + parseFloat(taxvalue);
				  
				  var taxCGSGSTValue=$("#tax"+rowNo).html();
				  var taxIGSTValue=$("#igsttax"+rowNo).val();
				 // var taxCGSGSTValue = parseFloat(taxCGSGSTValue)-parseFloat(taxIGSTValue);
					var cgstTaxRate=parseFloat((taxCGSGSTValue/2)).toFixed(2);
					var taxgst=$("#cgsgstAmt"+rowNo).val();
					cgstsgstTaxAmt=cgstsgstAmt+(parseFloat(taxgst));
					
					if(taxIGSTValue == 0.0){
					$('#cgsttax'+rowNo).html(cgstTaxRate);
					$('#sgsttax'+rowNo).html(cgstTaxRate);
					$('#cgsttaxvalue'+rowNo).html(parseFloat((cgstTaxRate*$("#itemPrice"+rowNo).html()*$("#quantity"+rowNo).html())/100).toFixed(2));
					$('#sgsttaxvalue'+rowNo).html(parseFloat((cgstTaxRate*$("#itemPrice"+rowNo).html()*$("#quantity"+rowNo).html())/100).toFixed(2));
					$('#igsttaxvalue'+rowNo).html("0.0");
					
					}else{
						$('#cgsttax'+rowNo).html("0.0");
						$('#sgsttax'+rowNo).html("0.0");
						$('#cgsttaxvalue'+rowNo).html("0.0");
						$('#sgsttaxvalue'+rowNo).html("0.0");
						$('#igsttaxvalue'+rowNo).html(parseFloat((taxIGSTValue*$("#itemPrice"+rowNo).html()*$("#quantity"+rowNo).html())/100).toFixed(2));

					}
					
					 var taxvalueofCgst =  (cgstTaxRate*$("#totalCost"+rowNo).html())/100;
					 cgstAmt = cgstAmt + parseFloat(taxvalueofCgst);
					 
					 noofitems = noofitems+  parseFloat($("#quantity"+rowNo).html());
					 
					 countValue = countValue+1;
					 $('#totalCost'+rowNo).html(parseFloat(itemcostprice).toFixed(2));
					 
				 });
			
			
			 $("#totalqty").val(noofitems);
			 $("#noofitems").val(countValue);
			 $("#cgstAmt").val(parseFloat(cgstAmt).toFixed(2));
			var subtotalvalue  = parseFloat(totalCost)-parseFloat(totaltax);
			 
			$('#subtotalCost').val(parseFloat(subtotalvalue).toFixed(2));
			var shipmentCost = $("#shipping_cost").val();
			if($('#shipping_cost').val()!="")
				totalCost = totalCost + parseFloat(shipmentCost);
			var discount = $("#discount").val();
			if($('#discount').val()!="")
				totalCost = totalCost - parseFloat(discount);
			
			
			if(totaltax!= undefined)
			{
			if (totaltax != "" && isNaN(totaltax))
			console.info(totaltax);	
			else		
			$("#total_tax").val(parseFloat(totaltax).toFixed(2));
			}
		/*	if(totaltax != "" && totaltax!= undefined && totaltax!= NaN)
				{
				if (isNaN(totaltax))
				console.info(totaltax);	
				else		
				$("#total_tax").val(parseFloat(totaltax).toFixed(2));
				}*/
			
			//added by manasa
			var othertax = $("#otherTaxAmt").val();
			if($('#otherTaxAmt').val()!="")
				totalCost = totalCost + parseFloat(othertax);
			
			/*var tax = $("#total_tax").val();
			if(tax != "")
				totalCost = parseFloat(totalCost) + parseFloat(tax);*/
			//commented by koti 
			$("#totalCost").val(parseFloat(totalCost).toFixed(2));
			
		}
	 
	 $('#total_tax').on('input',function(e){
		// if($('#shipping_cost').val()!="")
			 changeTotalOrderCost();
	 });
	 
	 $('#shipping_cost').on('input',function(e){
			// if($('#shipping_cost').val()!="")
				 changeTotalOrderCost();
		 });
	 $('#discount').on('input',function(e){
			// if($('#shipping_cost').val()!="")
				 changeTotalOrderCost();
		 });
	 $('#otherTaxAmt').on('input',function(e){
			// if($('#shipping_cost').val()!="")
				 changeTotalOrderCost();
		 });
	 
	
	 function changeOrderedPack(element){
			var id = $(element).attr("id");
			if (isNaN($("#"+id).html()) || $("#"+id).html() == "")
				$('#'+id).html("1");
			var rowNo = id.replace('quantity','');
			//isNumeric(element);
			var packVal = parseFloat($('#quantity'+rowNo).html());
			if(packVal<=0){
				alert("Pack should not be empty");
				var priceVal = parseFloat($('#itemPrice'+rowNo).html());
				$('#quantity'+rowNo).html(1);
				$('#totalCost'+rowNo).html(priceVal);
			}else{
				var priceVal = parseFloat($('#itemPrice'+rowNo).html());
				$('#totalCost'+rowNo).html(packVal*priceVal);
			/*	var tax = parseFloat($('#tax'+rowNo).html());
				$('#tax'+rowNo).html(packVal*tax);*/
			}
			changeTotalOrderCost();
		}
	 function changeTax(element){
		/*	var id = $(element).attr("id");
			if (isNaN($("#"+id).html()) || $("#"+id).html() == "")
				$('#'+id).html("1");
			var rowNo = id.replace('quantity','');
			//isNumeric(element);
			var packVal = parseFloat($('#quantity'+rowNo).html());
			if(packVal<=0){
				alert("Pack should not be empty");
				var priceVal = parseFloat($('#itemPrice'+rowNo).html());
				$('#quantity'+rowNo).html(1);
				$('#totalCost'+rowNo).html(priceVal);
			}else{
				var priceVal = parseFloat($('#itemPrice'+rowNo).html());
				$('#totalCost'+rowNo).html(packVal*priceVal);
				var tax = parseFloat($('#tax'+rowNo).html());
				$('#tax'+rowNo).html(packVal*tax);
			}*/
			changeTotalOrderCost();
		}
	 function changeOrderedPrice(element){
			var id = $(element).attr("id");
			if (isNaN($("#"+id).html()) || $("#"+id).html() == "")
				$('#'+id).html("1");
			var rowNo = id.replace('itemPrice','');
			//isNumeric(element);
			var packVal = parseFloat($('#quantity'+rowNo).html());
			if(packVal<=0){
				alert("Pack should not be empty");
				var priceVal = parseFloat($('#itemPrice'+rowNo).html());
				$('#quantity'+rowNo).html(1);
				$('#totalCost'+rowNo).html(priceVal);
			}else{
				var priceVal = parseFloat($('#itemPrice'+rowNo).html()).toFixed(2);
				$('#totalCost'+rowNo).html(packVal*priceVal);
				/*var tax = parseFloat($('#tax'+rowNo).html()).toFixed(2);
				$('#tax'+rowNo).html(packVal*tax);*/
			}
			changeTotalOrderCost();
		}
	 
    	 function getSkuDetails(skuId){
    		 //purpose:for checking internet conection
    		 debugger;
    			var online = window.navigator.onLine;
    		  	if(!online)
    		  	{
    		  	alert("check your internet connection,please try agian after some time");
    		  	return;
    		  	}
    		 //debugger
    		 var contextPath = $("#contextPath").val();
    		 var storeLocation = $("#warehouse_location option:selected").text();
    		 if(storeLocation=='')
    			 storeLocation =$("#outletLocation").val();
    		 var type = $("#flowUnder").val();


           var WarehouseReturnflag=$("#whreturnflag").val();
		if(WarehouseReturnflag == "" || WarehouseReturnflag == undefined || WarehouseReturnflag == null){
			WarehouseReturnflag="";
   		}




    		 if(type == "warehouse" || type == "Warehouse")
    			 URL = contextPath + "/inventorymanager/getWarehouseSkuDetails.do";
    		 else if(type == "Retail Outlet" || type == "Restaurant")
    			 URL = contextPath + "/inventorymanager/getSkuDetails.do";
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
	       				
	       				$("#loading").css("display","none");
	       				$("#mainDiv").removeClass('disabled');
	       				appendSkuDetails(result);
	       			},
	       			error : function() {
	       				 alert("something went wrong");
	       				$("#loading").css("display","none");
	     				$("#mainDiv").removeClass('disabled');
	       			}
	       		});
    	 }
    	function getPaymentSkuDetails(skuId){
    		 debugger;
    			var online = window.navigator.onLine;
    		  	if(!online)
    		  	{
    		  	alert("check your internet connection,please try agian after some time");
    		  	return;
    		  	}
    		 //debugger
    		 var contextPath = $("#contextPath").val();
    		 var storeLocation = $("#warehouse_location option:selected").text();



    		 if(storeLocation=='')
    			 storeLocation =$("#outletLocation").val();
    		 var type = $("#warehouse_location").val();
                var WarehouseReturnflag=$("#whreturnflag").val();
		if(WarehouseReturnflag == "" || WarehouseReturnflag == undefined || WarehouseReturnflag == null){
			WarehouseReturnflag="";
   		}



    		 if(type == "Warehouse"|| type == "warehouse")
    			 URL = contextPath + "/inventorymanager/getWarehouseSkuDetails.do";
    		 else if(type == "Retail Outlet" || type == "Restaurant")
    			 URL = contextPath + "/inventorymanager/getSkuDetails.do";
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
	       				
	       				$("#loading").css("display","none");
	       				$("#mainDiv").removeClass('disabled');
	       				appendPaymentSkuDetails(result);
	       			},
	       			error : function() {
	       				 alert("something went wrong");
	       				$("#loading").css("display","none");
	     				$("#mainDiv").removeClass('disabled');
	       			}
	       		});
    	 }
    	 
    	
    	
    	function getSalesPaymentsSkuDetails(skuId){
      		 debugger;
      			var online = window.navigator.onLine;
      		  	if(!online)
      		  	{
      		  	alert("check your internet connection,please try agian after some time");
      		  	return;
      		  	}
      		 //debugger
      		 var contextPath = $("#contextPath").val();
      		 var storeLocation = $("#warehouse_location option:selected").text();
      		 if(storeLocation=='')
      			 storeLocation =$("#outletLocation").val();
      		 var type = $("#warehouse_location").val();


var WarehouseReturnflag=$("#whreturnflag").val();
		if(WarehouseReturnflag == "" || WarehouseReturnflag == undefined || WarehouseReturnflag == null){
			WarehouseReturnflag="";
   		}

      		 if(type == "Warehouse" || type == "warehouse")
      			 URL = contextPath + "/inventorymanager/getWarehouseSkuDetails.do";
      		 else if(type == "Retail Outlet" || type == "Restaurant")
      			 URL = contextPath + "/inventorymanager/getSkuDetails.do";
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
   	       				
   	       				$("#loading").css("display","none");
   	       				$("#mainDiv").removeClass('disabled');
   	       			appendSalesPaymentsSkuDetails(result);
   	       			},
   	       			error : function() {
   	       				 alert("something went wrong");
   	       				$("#loading").css("display","none");
   	     				$("#mainDiv").removeClass('disabled');
   	       			}
   	       		});
      	 }
      	 
    	 var warehouseskumaster = null;
    	 function appendSkuDetails(skuDetails){
    		 debugger;
    		 
    		 var parsedJson = jQuery.parseJSON(skuDetails);
    			$("#searchItems").val("");
    			skuList = parsedJson.skuLists;
    			
    			
    			//written by manasa
    			//purpose:to get track item when we call warehouse location
    			var storeLocation = $("#warehouse_location option:selected").text();
       		 var type = $("#flowUnder").val();
    			 if(type == "warehouse" || type == "Warehouse"){
    			warehouseskumaster=parsedJson.warehouseskumaster;
    			
    			var itemTrack = warehouseskumaster.trackingRequired;
    			skuList[0].trackingRequired = itemTrack;
    			if(warehouseskumaster.is_cost_price_editable!=null && warehouseskumaster.is_cost_price_editable!=undefined && warehouseskumaster.is_cost_price_editable!="")
    				{
    				skuList[0].costpriceEditable=warehouseskumaster.is_cost_price_editable;
    				}
    			if(skuList[0].hsnCode == null && warehouseskumaster != null)
					skuList[0].hsnCode = warehouseskumaster.hsnCode;
					
					  skuList[0].batchRequired=warehouseskumaster.batchRequired;
    			}
    			
    			if(skuList.length >1){
    				var priceLength = skuList.length;
    				var priceArray = [];
    				$("#itemsList tbody").html("");
    				for(var i=0; i<priceLength; i++){
    					
    					if(type == "warehouse" || type == "Warehouse")
    						skuList[i].trackingRequired = itemTrack;
    					
    					var price = skuList[i].costPrice;
    					if (! $.inArray(price, priceArray) > -1)
    					{
    						priceArray.push(price);
    						var row = '<tr id=price'+i+' style="margin-top:5px;cursor:pointer;white-space: nowrap;"  ><td><input type="checkbox" name="selectall" class="selectableCheckbox" id="selectall" value='+i+' /></td><td>'+skuList[i].description+'</td><td>'+price+'</td><td>'+skuList[i].measureRange+'</td><td>'+skuList[i].productRange+'</td><td>'+skuList[i].brandCode+'</td><td>'+skuList[i].color+'</td><td>'+skuList[i].size+'</td><td>'+skuList[i].ean+'</td><td>'+skuList[i].quantity+'</td></tr>';
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
    				addSku(skuList[0]);
    			}
    			
    	}
    	 function appendPaymentSkuDetails(skuDetails){
    		 debugger;
    		 
    		 var parsedJson = jQuery.parseJSON(skuDetails);
    			$("#searchItems").val("");
    			skuList = parsedJson.skuLists;
    			
    			
    			//written by manasa
    			//purpose:to get track item when we call warehouse location
    			var storeLocation = $("#warehouse_location option:selected").text();
       		 var type = $("#warehouse_location").val();
    			
    			if(skuList.length >1){
    				var priceLength = skuList.length;
    				var priceArray = [];
    				$("#itemsList tbody").html("");
    				for(var i=0; i<priceLength; i++){
    					
    					if(type == "Warehouse" || type == "warehouse")
    						skuList[i].trackingRequired = itemTrack;
    					
    					var price = skuList[i].costPrice;
    					if (! $.inArray(price, priceArray) > -1)
    					{
    						priceArray.push(price);
    						var row = '<tr id=price'+i+' style="margin-top:5px;cursor:pointer;white-space: nowrap;"  ><td><input type="checkbox" name="selectall" class="selectableCheckbox" id="selectall" value='+i+' /></td><td>'+skuList[i].description+'</td><td>'+price+'</td><td>'+skuList[i].measureRange+'</td><td>'+skuList[i].productRange+'</td><td>'+skuList[i].brandCode+'</td><td>'+skuList[i].color+'</td><td>'+skuList[i].size+'</td><td>'+skuList[i].ean+'</td></tr>';
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
    				addPaymentSku(skuList[0]);
    			}
    			
    	}
    	 
 
    	 function appendSalesPaymentsSkuDetails(skuDetails){
    		 debugger;
    		 
    		 var parsedJson = jQuery.parseJSON(skuDetails);
    			$("#searchItems").val("");
    			skuList = parsedJson.skuLists;
    			
    			
    			//written by manasa
    			//purpose:to get track item when we call warehouse location
    			var storeLocation = $("#warehouse_location option:selected").text();
       		 var type = $("#warehouse_location").val();
    			
    			if(skuList.length >1){
    				var priceLength = skuList.length;
    				var priceArray = [];
    				$("#itemsList tbody").html("");
    				for(var i=0; i<priceLength; i++){
    					
    					if(type == "Warehouse" || type == "warehouse")
    						skuList[i].trackingRequired = itemTrack;
    					
    					var price = skuList[i].costPrice;
    					if (! $.inArray(price, priceArray) > -1)
    					{
    						priceArray.push(price);
    						var row = '<tr id=price'+i+' style="margin-top:5px;cursor:pointer;white-space: nowrap;"  ><td><input type="checkbox" name="selectall" class="selectableCheckbox" id="selectall" value='+i+' /></td><td>'+skuList[i].description+'</td><td>'+price+'</td><td>'+skuList[i].measureRange+'</td><td>'+skuList[i].productRange+'</td><td>'+skuList[i].brandCode+'</td><td>'+skuList[i].color+'</td><td>'+skuList[i].size+'</td><td>'+skuList[i].ean+'</td></tr>';
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
    				addSalesPaymentsSku(skuList[0]);
    			}
    			
    	}
    	 
    	 
    	 function getItemPrice(ele){
    		 
    		 var selected = "";
 			var selectedLabel = 'Please Select Atleast One Sku to Submit';
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
 			    		{
 			    		selected += $(this).val()+",";
     			    	addItem(skuList[$(this).val()]);
 			    		}
 			    		
 			    	//selected += $(this).val().replace(/\//g, '')+",";
 				});
 			    $(".modal-backdrop").trigger("click");
 			}
    		 
 		/*	var id = $(ele).attr("id");
 			id = id.replace('price','');
 			$(".modal-backdrop").trigger("click");
 			addItem(skuList[id]);*/
 		}
    	 
    	 function getPrice(ele){
    		 //debugger
    		 
    		 var selected = "";
    			var selectedLabel = 'Please Select Atleast One Sku to Submit';
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
    			    		{
    			    		selected += $(this).val()+",";
        			    	addSku(skuList[$(this).val()]);
    			    		}
    			    		
    			    	//selected += $(this).val().replace(/\//g, '')+",";
    				});
    			    $(".modal-backdrop").trigger("click");
    			}
    		/*	var id = $(ele).attr("id");
    			id = id.replace('price','');
    			$(".modal-backdrop").trigger("click");
    			addSku(skuList[id]);*/
    		}
    	 
    	 function addSalesPaymentsSku(sku){
    		 var contextPath = $("#contextPath").val();
    		 var len = parseInt($("#productsList tr").length);
    			if (len != 1)
    				len = parseInt($("#productsList tr:last").attr("id").replace('dynamicdiv', '')) + 1;
    			
    			
    			
    			
    			 if(sku.trackingRequired == false){
    			for (var i = 1; i <= len; i++) {
    				if ($("#skuId" + i).val() == sku.skuId && $("#Price"+i).text() == sku.costPrice && $("#pluCode" + i).val() == sku.pluCode && sku.trackingRequired == false) {
    					var pack =  parseInt($("#Pack"+i).text()*2);
    					//var requested=parseInt($("#Requested"+i).text())+1;
    	  			 $("#Pack"+i).text(pack);
    	  			 $("#Supplied"+i).text(pack);
    	  			 $("#Received"+i).text(pack);
    			   $("#Requested"+i).text(0);
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
    			
    			var batchNum = sku.productBatchNo;
    			if(batchNum == null)
    				sku.productBatchNo = "";
    			
    			var color = sku.color;
    			if(color == null)
    				sku.color = "";
    			var size = sku.size;
    			if(size == null)
    				sku.size = "";
    			var ean = sku.ean;
    			if(ean == null)
    				sku.ean = "";
    			var make = sku.uom;
    			if(make == "" || make == null)
    				make = "_";
    			
    			var hsnCode = sku.hsnCode;
    			if(hsnCode == null)
    				sku.hsnCode = "";
    			
    			var scanCode = sku.itemScanCode;
    			if(scanCode == null)
    				sku.itemScanCode = "";
    			
    			
    			/*written by manasa 
    			purpose:to get track item*/
    			if(sku.trackingRequired == "" || sku.trackingRequired == null)
    				sku.trackingRequired = false;
    			
    		  /*  added by manasa
    			purpose:to get cgst and sgst igst rates Taxrates*/
    			
    			var tax = sku.tax;
    			var taxamount = 0.0;
    			
    			
    			if(sku.trackingRequired == "" || sku.trackingRequired == null)
    				sku.trackingRequired = false;
    			
    			var taxRate=0.0;
    			if(tax!=null)
    				if(tax.length>0){
    				 taxRate=tax[0].taxRate;
    				}
    			
    			var cgstTaxRate=0.0;
    			if(tax!=null)
    				if(tax.length>0){
    			for(var i=0;i<tax.length;i++)
    			{
    			if(tax[i].taxCode == "CGST")
    				cgstTaxRate = tax[i].taxRate;
    			}
    			}
    			
    			
    			var sgstTaxRate=0.0;
    			if(tax!=null)
    				if(tax.length>0){
    			for(var i=0;i<tax.length;i++)
    			{
    			if(tax[i].taxCode == "SGST")
    				sgstTaxRate = tax[i].taxRate;
    			}
    			}
    			
    			
    			
    			var igstRate=0.0;
    			if(tax!=null)
    				if(tax.length>0){
    			for(var i=0;i<tax.length;i++)
    			{
    			if(tax[i].taxCode == "IGST")
    				
    			igstRate = tax[i].taxRate;
    			}
    			}	
    			
    			 var  taxamount=0.0;
    			if(tax!=null)
    				if(tax.length>0){
    						taxamount = parseFloat(((sku.costPrice)*taxRate)/100).toFixed(2);
    				}
    			
    			
    			
    		
    			var slNo = 1; 
	   			 $('.slno').each(function(){
	   				$(this).text(slNo);
	   				slNo = parseInt(slNo) + 1;
	   			});
	   		
	   				var row = "<tr id='dynamicdiv"+len+"' style='margin-top:5px;height:35px'><td class='slno'>"+slNo+"</td>" +
	   				"<td id='skuId"+len+"'>"+sku.skuId+"</td>" +	    			
	    			"<td id='description"+len+"'>"+description+"</td>"+
	    			"<td id='supplyQty"+len+"' class='SupplyQty' onBlur='changeQtyPack(this);' onkeypress='PreventEnter(this);' contenteditable='true'>1</td>" +
	    			"<td id='supplyPrice"+len+"'>"+sku.costPrice+"</td>" +
	    			"<td id='cost"+len+"'>"+sku.costPrice+"</td>" +
	    			"<td id='discount"+len+"'>0</td>" +
	    			"<td id='netCost"+len+"'>"+sku.costPrice+"</td>" +
	    			"</tr>";
	    			$("#productsList tbody").append(row);
	    		
	    			totalValues();
    		return  searchhaEmployee('',"handledBy"+len);
    	
    	}
    	 

    	 function addPaymentSku(sku){
    		 var contextPath = $("#contextPath").val();
    		 var len = parseInt($("#productsList tr").length);
    			if (len != 1)
    				len = parseInt($("#productsList tr:last").attr("id").replace('dynamicdiv', '')) + 1;
    			
    			
    			
    			
    			 if(sku.trackingRequired == false){
    			for (var i = 1; i <= len; i++) {
    				if ($("#skuId" + i).val() == sku.skuId && $("#Price"+i).text() == sku.costPrice && $("#pluCode" + i).val() == sku.pluCode && sku.trackingRequired == false) {
    					var pack =  parseInt($("#Pack"+i).text()*2);
    					//var requested=parseInt($("#Requested"+i).text())+1;
    	  			 $("#Pack"+i).text(pack);
    	  			 $("#Supplied"+i).text(pack);
    	  			 $("#Received"+i).text(pack);
    			   $("#Requested"+i).text(0);
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
    			
    			var batchNum = sku.productBatchNo;
    			if(batchNum == null)
    				sku.productBatchNo = "";
    			
    			var color = sku.color;
    			if(color == null)
    				sku.color = "";
    			var size = sku.size;
    			if(size == null)
    				sku.size = "";
    			var ean = sku.ean;
    			if(ean == null)
    				sku.ean = "";
    			var make = sku.uom;
    			if(make == "" || make == null)
    				make = "_";
    			
    			var hsnCode = sku.hsnCode;
    			if(hsnCode == null)
    				sku.hsnCode = "";
    			
    			var scanCode = sku.itemScanCode;
    			if(scanCode == null)
    				sku.itemScanCode = "";
    			
    			
    			/*written by manasa 
    			purpose:to get track item*/
    			if(sku.trackingRequired == "" || sku.trackingRequired == null)
    				sku.trackingRequired = false;
    			
    		  /*  added by manasa
    			purpose:to get cgst and sgst igst rates Taxrates*/
    			
    			var tax = sku.tax;
    			var taxamount = 0.0;
    			
    			
    			if(sku.trackingRequired == "" || sku.trackingRequired == null)
    				sku.trackingRequired = false;
    			
    			var taxRate=0.0;
    			if(tax!=null)
    				if(tax.length>0){
    				 taxRate=tax[0].taxRate;
    				}
    			
    			var cgstTaxRate=0.0;
    			if(tax!=null)
    				if(tax.length>0){
    			for(var i=0;i<tax.length;i++)
    			{
    			if(tax[i].taxCode == "CGST")
    				cgstTaxRate = tax[i].taxRate;
    			}
    			}
    			
    			
    			var sgstTaxRate=0.0;
    			if(tax!=null)
    				if(tax.length>0){
    			for(var i=0;i<tax.length;i++)
    			{
    			if(tax[i].taxCode == "SGST")
    				sgstTaxRate = tax[i].taxRate;
    			}
    			}
    			
    			
    			
    			var igstRate=0.0;
    			if(tax!=null)
    				if(tax.length>0){
    			for(var i=0;i<tax.length;i++)
    			{
    			if(tax[i].taxCode == "IGST")
    				
    			igstRate = tax[i].taxRate;
    			}
    			}	
    			
    			 var  taxamount=0.0;
    			if(tax!=null)
    				if(tax.length>0){
    						taxamount = parseFloat(((sku.costPrice)*taxRate)/100).toFixed(2);
    				}
    			
    			
    			
    		
    			var slNo = 1; 
	   			 $('.slno').each(function(){
	   				$(this).text(slNo);
	   				slNo = parseInt(slNo) + 1;
	   			});
	   		
	   				var row = "<tr id='dynamicdiv"+len+"' style='margin-top:5px;height:35px'><td class='slno'>"+slNo+"</td>" +
	   				"<td id='skuId"+len+"'>"+sku.skuId+"</td>" +	    			
	    			"<td id='description"+len+"'>"+description+"</td>"+
	    			"<td id='poQty"+len+"'>"+0+"</td>" +
	    			"<td id='supplyQty"+len+"' class='SupplyQty' onBlur='changeQtyPack(this);' onkeypress='PreventEnter(this);' contenteditable='true'>1</td>" +
	    			"<td id='supplyPrice"+len+"'>"+sku.costPrice+"</td>" +
	    			"<td id='cost"+len+"'>"+sku.costPrice+"</td>" +
	    			"<td id='discount"+len+"'>0</td>" +
	    			"<td id='netCost"+len+"'>"+sku.costPrice+"</td>" +
	    			"</tr>";
	    			$("#productsList tbody").append(row);
	    		
	    			totalValues();
    		return  searchhaEmployee('',"handledBy"+len);
    	
    	}
    	 

    	 //modified by koti bommineni
    	 function addSku(sku){
    		 var contextPath = $("#contextPath").val();
    		 var len = parseInt($("#productsList tr").length);
    			if (len != 1)
    				len = parseInt($("#productsList tr:last").attr("id").replace('dynamicdiv', '')) + 1;
    			
    			
    			debugger;
    			
    			 if(sku.trackingRequired == false){
    			for (var i = 1; i < len; i++) {
	              var plucode= $("#pluCode" + i).val();
	               plucode = plucode.replace('PBN', '');
    				if ($("#skuId" + i).val() == sku.skuId && $("#Price"+i).text() == sku.costPrice && plucode == sku.pluCode && sku.trackingRequired == false) {
    					var pack =  parseInt($("#Pack"+i).text())+1;
    					//var requested=parseInt($("#Requested"+i).text())+1;
    	  			 $("#Pack"+i).text(pack);
    	  			 $("#Supplied"+i).text(pack);
    	  			 $("#Received"+i).text(pack);
    			   $("#Requested"+i).text(0);
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
    			
    		/*	var batchNum = sku.productBatchNo;
    			if(batchNum == null)*/
    				sku.productBatchNo = "";
    			
    			var color = sku.color;
    			if(color == null)
    				sku.color = "";
    			var size = sku.size;
    			if(size == null)
    				sku.size = "";
    			var ean = sku.ean;
    			if(ean == null)
    				sku.ean = "";
    			var make = sku.uom;
    			if(make == "" || make == null)
    				make = "_";
    			
    			var hsnCode = sku.hsnCode;
    			if(hsnCode == null)
    				sku.hsnCode = "";
    			
    			var discountAmt = sku.discountAmt;
    			if(discountAmt == null || discountAmt == undefined)
    				sku.discountAmt = 0;
    			var discountPerc = sku.discountPercentage;
    			if(discountPerc == null || discountPerc == undefined)
    				sku.discountPercentage = 0;


    			var scanCode = sku.itemScanCode;
    			if(scanCode == null)
    				sku.itemScanCode = "";
    			
    			
    			/*written by manasa 
    			purpose:to get track item*/
    			if(sku.trackingRequired == "" || sku.trackingRequired == null)
    				sku.trackingRequired = false;
    			
    		  /*  added by manasa
    			purpose:to get cgst and sgst igst rates Taxrates*/
    			
    			var tax = sku.tax;
    			var taxamount = 0.0;
    			
    			
    			if(sku.trackingRequired == "" || sku.trackingRequired == null)
    				sku.trackingRequired = false;
    			
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
    			
    			
    			
    			var locationstate = $("#location_state").val();
    			var suppierstate = $("#supplier_state").val();
    			
    			
    			 if(locationstate.toUpperCase() !=  suppierstate.toUpperCase()){
    				sgstTaxRate= 0.0;
     				cgstTaxRate= 0.0;
     				taxRate= 0.0;
    			 }else{
    				 igstRate = 0.0;
    			 }
    			
    			
    			 var  taxamount=0.0;
    			if(tax!=null)
    				if(tax.length>0){
    						taxamount = parseFloat(((sku.costPrice)*taxRate)/100).toFixed(2);
    				}
    			
    			
    			
    		
    			var slNo = 1; 
	   			 $('.slno').each(function(){
	   				$(this).text(slNo);
	   				slNo = parseInt(slNo) + 1;
	   			});
	   			if($("#flowUnder").val()=='warehouse' || $("#flowUnder").val()=='procurement'){
	   			 if(sku.trackingRequired == false){
	   				 
	   				if(sku.costpriceEditable == true){
	   					var row = "<tr id='dynamicdiv"+len+"' style='margin-top:5px;'><td class='slno sticky-col first-col' style='background: #f9f9f9;' >"+slNo+"</td><td class='sticky-col second-col' style='background: #f9f9f9; id='Name"+len+"'>"+sku.skuId+"</td>" +
		   				"<td class='sticky-col third-col' style='background: #f9f9f9;' id='ean"+len+"'>"+sku.ean+"</td>" +
		   				"<td class='sticky-col fourth-col' style='background: #f9f9f9;' id='hsnCode"+len+"' contenteditable='true'>"+sku.hsnCode+"</td>" +
		   				"<td class='sticky-col fifth-col' style='background: #f9f9f9;' id='itemScanCode"+len+"' class='itemScanCode'  contenteditable='true'>"+sku.itemScanCode+"</td>" +
		   				"<input type='hidden' id='trackingRequired"+len+"' name ='trackingRequired' class='trackingRequired' value='"+sku.trackingRequired+"'/>"+
		             	"<input type='hidden' id='batchRequired"+len+"' name ='batchRequired' class='batchRequired' value='"+sku.batchRequired+"'/>"+			
			            "<input type='hidden' id='skuId"+len+"' value='"+sku.skuId+"'/>" +
		    			"<input type='hidden' id='pluCode"+len+"' value='"+sku.pluCode+"'/>" +
		    			"<input type='hidden' id='category"+len+"' value='"+sku.category+"'/>" +
		    			"<input type='hidden' id='brandCode"+len+"' value='"+sku.brandCode+"'/>" +
		    			"<input type='hidden' id='productRange"+len+"' value='"+sku.productRange+"'/>" +
		    			"<input type='hidden' id='measureRange"+len+"' value='"+sku.measureRange+"'/>" +
		    			"<input type='hidden' id='utility"+len+"' value='"+sku.utility+"'/>" +
		    			"<input type='hidden' id='itemTaxExclusive"+len+"' value='"+sku.itemTaxExclusive+"'/>" +
		    			"<input type='hidden' id='color"+len+"' value='"+sku.color+"'/>" +
		    			"<input type='hidden' id='size"+len+"' value='"+sku.size+"'/>" +
		    			"<input type='hidden' id='cgstTaxRate"+len+"' value='"+parseFloat(cgstTaxRate).toFixed(2)+"'/>" +
		    			"<input type='hidden' id='cessTaxRate"+len+"' value='"+parseFloat(cessRate).toFixed(2)+"'/>" +
		    			"<input type='hidden' id='igsttaxRate"+len+"' value='"+parseFloat(igstRate).toFixed(2)+"'/>" +
		    			"<input type='hidden' id='taxationlist"+len+"' value='"+JSON.stringify(sku.tax)+"'/>" +
	                    "<input type='hidden' id='priceDuplicate"+len+"' value='"+sku.costPrice+"'/>" +
                        "<input type='hidden' id='pricereal"+len+"' value='"+sku.costPrice+"'/>" +
                        "<input type='hidden' id='pricerealedit"+len+"' value=''/>" +
                  
	
		    			"<td class='sticky-col sixth-col' style='background: #f9f9f9;' id='Desc"+len+"' style='width:30%'>"+description+"</td>"+
		    			"<td><textarea id='batchNum"+len+"' rows=1 style='resize:none;width: 87px;'>"+sku.productBatchNo+"</textarea></td>"+
			    			"<td><input class='form-control calendar_icon endDate'readonly='readonly' style='width:100px;background-color: white;' id='expiryDate"+len+"' type='text' onfocus=callCalender('expiryDate"+len+"') onclick=callCalender('expiryDate"+len+"') placeholder='DD/MM/YYYY' /></td>" +
		    	 		"<td id='Pack"+len+"' class='Pack' onBlur='changePack(this);' onkeypress='PreventEnter(this);' contenteditable='true'>1</td>" +

		    			"<td >"+sku.measureRange+"</td>" +
		    			"<td id='Make"+len+"'>"+make+"</td>" +
		    			"<td><input type='text' id='mrp"+len+"'  style='width:70px;text-align:center' value='"+sku.mrp+"'></td>"+
		    			"<td id='Requested"+len+"' class='Requested' >0</td>" +
		    			"<td class='Price' id='SPrice"+len+"'>0</td>" +
	                   "<td><input id='discountpercentage"+len+"' class='discountpercentage' onBlur='changeDiscPerc(this);changeTotalCost();changeTotalQuantity();' onkeypress='PreventEnter(this);' type='number' style='width:70px;text-align:center' value='"+sku.discountPercentage+"'></td>"+
		    			"<td><input id='discountAmt"+len+"' class='discountAmt' onBlur='changeDiscAmt(this);changeTotalCost();changeTotalQuantity();' onkeypress='PreventEnter(this);' type='number' style='width:70px;text-align:center' value='"+sku.discountAmt+"'></td>"+
	                 	"<td><input id='freeqty"+len+"' class='freeqty' onBlur='changePack(this);' onkeypress='PreventEnter(this);' type='number' style='width:70px;text-align:center' value='"+sku.freeQty+"'></td>"+	
	
	                    "<td  id='tax"+len+"' onBlur='changeGrnTax(this);' contenteditable='true'>"+parseFloat((taxRate*2)+igstRate).toFixed(2)+"</td>" +
		    			"<td  id='cgsttax"+len+"'>"+parseFloat(cgstTaxRate).toFixed(2)+"</td>" +
		    	 		"<td  id='sgsttax"+len+"'>"+parseFloat(sgstTaxRate).toFixed(2)+"</td>" +
		    	 		"<td id='igsttax"+len+"'>"+parseFloat(igstRate).toFixed(2)+"</td>"+
		    	 		"<td id='cess"+len+"'>"+parseFloat(cessRate).toFixed(2)+"</td>"+
		    			"<td class='Price' id='Price"+len+"' onBlur='changeSupplyPrice(this);' onkeypress='changeSupplyPriceonchange(this);PreventEnter(this);'    type='number' contenteditable='true'>"+sku.costPrice+"</td>" +
	
	                    "<td id='Cost"+len+"'>"+sku.costPrice+"</td>" +
		    			"<td><select  style='width:180px' class='storageRef"+len+"'  id='storageRef"+len+"'></select> </td>"+
		    			"<td><select  style='width:180px' class='handledBy"+len+"'  id='handledBy"+len+"'></select> </td>"+
		    			"<td id='Del"+len+"'>" +
		    			"<img id='Img"+len+"' src='"+contextPath+"/images/itemdelete.png' style='width:32%;cursor:pointer;' onclick='deleteItem(this);' title='Delete "+sku.skuId+"'/>"+
	                     "<img id='Img"+len+"' src='"+contextPath+"/images/bulewhiteplusicon.png' style='width:30%;cursor:pointer;margin-left: 10px;' onclick='addSkuwithplus("+slNo+");' title='Additem "+sku.skuId+"'/></td></tr>";

	   					$("#productsList tbody").append(row);
	   					appendStorageSystemID(sku,"storageRef"+len);
		    			callCalender("expiryDate"+len);
		    			
		    			$("#Pack"+len).focus();
						$("#dynamicdiv"+(len-1)).css("background","none");
						$("#dynamicdiv"+len).css("background","lightgreen", "important");
	   				}
	   				else{
	   					var row = "<tr id='dynamicdiv"+len+"' style='margin-top:5px;'><td class='slno sticky-col first-col' style='background: #f9f9f9;' >"+slNo+"</td><td class='sticky-col second-col' style='background: #f9f9f9; id='Name"+len+"'>"+sku.skuId+"</td>" +
		   				"<td class='sticky-col third-col' style='background: #f9f9f9;' id='ean"+len+"'>"+sku.ean+"</td>" +
		   				"<td class='sticky-col fourth-col' style='background: #f9f9f9;' id='hsnCode"+len+"' contenteditable='true'>"+sku.hsnCode+"</td>" +
		   				"<td class='sticky-col fifth-col' style='background: #f9f9f9;' id='itemScanCode"+len+"' class='itemScanCode'  contenteditable='true'>"+sku.itemScanCode+"</td>" +
		   				"<input type='hidden' id='trackingRequired"+len+"' name ='trackingRequired' class='trackingRequired' value='"+sku.trackingRequired+"'/>"+
		              	"<input type='hidden' id='batchRequired"+len+"' name ='batchRequired' class='batchRequired' value='"+sku.batchRequired+"'/>"+			
			            "<input type='hidden' id='skuId"+len+"' value='"+sku.skuId+"'/>" +
		    			"<input type='hidden' id='pluCode"+len+"' value='"+sku.pluCode+"'/>" +
		    			"<input type='hidden' id='category"+len+"' value='"+sku.category+"'/>" +
		    			"<input type='hidden' id='brandCode"+len+"' value='"+sku.brandCode+"'/>" +
		    			"<input type='hidden' id='productRange"+len+"' value='"+sku.productRange+"'/>" +
		    			"<input type='hidden' id='measureRange"+len+"' value='"+sku.measureRange+"'/>" +
		    			"<input type='hidden' id='utility"+len+"' value='"+sku.utility+"'/>" +
		    			"<input type='hidden' id='itemTaxExclusive"+len+"' value='"+sku.itemTaxExclusive+"'/>" +
		    			"<input type='hidden' id='color"+len+"' value='"+sku.color+"'/>" +
		    			"<input type='hidden' id='size"+len+"' value='"+sku.size+"'/>" +
		    			"<input type='hidden' id='cgstTaxRate"+len+"' value='"+parseFloat(cgstTaxRate).toFixed(2)+"'/>" +
		    			"<input type='hidden' id='cessTaxRate"+len+"' value='"+parseFloat(cessRate).toFixed(2)+"'/>" +
		    			"<input type='hidden' id='igsttaxRate"+len+"' value='"+parseFloat(igstRate).toFixed(2)+"'/>" +
		    			"<input type='hidden' id='taxationlist"+len+"' value='"+JSON.stringify(sku.tax)+"'/>" +
	                    "<input type='hidden' id='priceDuplicate"+len+"' value='"+sku.costPrice+"'/>" +
		    			"<input type='hidden' id='pricereal"+len+"' value='"+sku.costPrice+"'/>" +
                     	"<input type='hidden' id='pricerealedit"+len+"' value=''/>" +
                  
						"<td id='Desc"+len+"' style='width:300px!important;text-align: left;background-color: #f9f9f9 !important;' class='sticky-col sixth-col'><div id='overflowtext'><a href='#' data-toggle='tooltip'  title='"+description+"'>"+description+"</a></div></td>"+

//		    			"<td class='sticky-col sixth-col' style='background: #f9f9f9;' id='Desc"+len+"' style='width:30%'>"+description+"</td>"+
		    			"<td><textarea id='batchNum"+len+"' rows=1 style='resize:none;width: 87px;'>"+sku.productBatchNo+"</textarea></td>"+
			    			"<td><input class='form-control calendar_icon endDate'readonly='readonly' style='width:100px;background-color: white;' id='expiryDate"+len+"' type='text' onfocus=callCalender('expiryDate"+len+"') onclick=callCalender('expiryDate"+len+"') placeholder='DD/MM/YYYY' /></td>" +
		    	 		"<td id='Pack"+len+"' class='Pack' onBlur='changePack(this);' onkeypress='PreventEnter(this);' contenteditable='true'>1</td>" +

		    			"<td >"+sku.measureRange+"</td>" +
		    			"<td id='Make"+len+"'>"+make+"</td>" +
		    			"<td><input type='text' id='mrp"+len+"'  style='width:70px;text-align:center' disabled='disabled' value='"+sku.mrp+"'></td>"+
		    			"<td id='Requested"+len+"' class='Requested' >0</td>" +
		    			"<td class='Price' id='SPrice"+len+"'>0</td>" +
		    			
	 					"<td><input id='discountpercentage"+len+"' class='discountpercentage' onBlur='changeDiscPerc(this);changeTotalCost();changeTotalQuantity();' onkeypress='PreventEnter(this);' type='number' style='width:70px;text-align:center' value='"+sku.discountPercentage+"'></td>"+
		    			"<td><input id='discountAmt"+len+"' class='discountAmt' onBlur='changeDiscAmt(this);changeTotalCost();changeTotalQuantity();' onkeypress='PreventEnter(this);' type='number' style='width:70px;text-align:center' value='"+sku.discountAmt+"'></td>"+
	                 	"<td><input id='freeqty"+len+"' class='freeqty' onBlur='changePack(this);' onkeypress='PreventEnter(this);' type='number' style='width:70px;text-align:center' value='"+sku.freeQty+"'></td>"+
 			
						"<td  id='tax"+len+"' onBlur='changeGrnTax(this);' contenteditable='true'>"+parseFloat((taxRate*2)+igstRate).toFixed(2)+"</td>" +
		    			"<td  id='cgsttax"+len+"'>"+parseFloat(cgstTaxRate).toFixed(2)+"</td>" +
		    	 		"<td  id='sgsttax"+len+"'>"+parseFloat(sgstTaxRate).toFixed(2)+"</td>" +
		    	 		"<td id='igsttax"+len+"'>"+parseFloat(igstRate).toFixed(2)+"</td>"+
		    	 		"<td id='cess"+len+"'>"+parseFloat(cessRate).toFixed(2)+"</td>"+
		    			"<td class='Price' id='Price"+len+"' onBlur='changeSupplyPrice(this);' onkeypress='changeSupplyPriceonchange(this);PreventEnter(this);'    type='number' contenteditable='true'>"+sku.costPrice+"</td>" +
		    			
	
	                    "<td id='Cost"+len+"'>"+sku.costPrice+"</td>" +
		    			"<td><select  style='width:180px' class='storageRef"+len+"'  id='storageRef"+len+"'></select> </td>"+
		    			"<td><select  style='width:180px' class='handledBy"+len+"'  id='handledBy"+len+"'></select> </td>"+
		    			"<td id='Del"+len+"'>" +
		    			"<img id='Img"+len+"' src='"+contextPath+"/images/itemdelete.png' style='width:32%;cursor:pointer;' onclick='deleteItem(this);' title='Delete "+sku.skuId+"'/>"+
	                     "<img id='Img"+len+"' src='"+contextPath+"/images/bulewhiteplusicon.png' style='width:30%;cursor:pointer;margin-left: 10px;' onclick='addSkuwithplus("+slNo+");' title='Additem "+sku.skuId+"'/></td></tr>";

	   					
	   					$("#productsList tbody").append(row);
	   					appendStorageSystemID(sku,"storageRef"+len);
		    			callCalender("expiryDate"+len);
		    			$("#Pack"+len).focus();
						$("#dynamicdiv"+(len-1)).css("background","none");
						$("#dynamicdiv"+len).css("background","lightgreen", "important");
	   				}
	   				
	   			 }
	   			 else
	   				 {
	   				if(sku.costpriceEditable == true){
	   					var row = "<tr id='dynamicdiv"+len+"' style='margin-top:5px;'><td class='slno sticky-col first-col' style='background: #f9f9f9;'>"+slNo+"</td><td  class='sticky-col second-col' style='background: #f9f9f9; id='Name"+len+"'>"+sku.skuId+"</td>" +
		   				"<td class='sticky-col third-col' style='background: #f9f9f9; id='ean"+len+"'>"+sku.ean+"</td>" +
		   				"<td class='sticky-col fourth-col' style='background: #f9f9f9;' id='hsnCode"+len+"' contenteditable='true'>"+sku.hsnCode+"</td>" +
		   				"<td class='sticky-col fifth-col' style='background: #f9f9f9;' id='itemScanCode"+len+"'   class='itemScanCode'  contenteditable='true'>"+sku.itemScanCode+"</td>" +
		   				"<input type='hidden' id='trackingRequired"+len+"' class='trackingRequired' value='"+sku.trackingRequired+"'/>"+
			           "<input type='hidden' id='batchRequired"+len+"' name ='batchRequired' class='batchRequired' value='"+sku.batchRequired+"'/>"+
		   				"<input type='hidden' id='skuId"+len+"' value='"+sku.skuId+"'/>" +
		    			"<input type='hidden' id='pluCode"+len+"' value='"+sku.pluCode+"'/>" +
		    			"<input type='hidden' id='category"+len+"' value='"+sku.category+"'/>" +
		    			"<input type='hidden' id='brandCode"+len+"' value='"+sku.brandCode+"'/>" +
		    			"<input type='hidden' id='productRange"+len+"' value='"+sku.productRange+"'/>" +
		    			"<input type='hidden' id='measureRange"+len+"' value='"+sku.measureRange+"'/>" +
		    			"<input type='hidden' id='utility"+len+"' value='"+sku.utility+"'/>" +
		    			"<input type='hidden' id='itemTaxExclusive"+len+"' value='"+sku.itemTaxExclusive+"'/>" +

		    			"<input type='hidden' id='color"+len+"' value='"+sku.color+"'/>" +
		    			"<input type='hidden' id='size"+len+"' value='"+sku.size+"'/>" +
		    			"<input type='hidden' id='cgstTaxRate"+len+"' value='"+parseFloat(cgstTaxRate).toFixed(2)+"'/>" +
		    			"<input type='hidden' id='cessTaxRate"+len+"' value='"+parseFloat(cessRate).toFixed(2)+"'/>" +
		    			"<input type='hidden' id='igsttaxRate"+len+"' value='"+parseFloat(igstRate).toFixed(2)+"'/>" +
		    			"<input type='hidden' id='taxationlist"+len+"' value='"+JSON.stringify(sku.tax)+"'/>" +
	                    "<input type='hidden' id='priceDuplicate"+len+"' value='"+sku.costPrice+"'/>" +
                        "<input type='hidden' id='pricereal"+len+"' value='"+sku.costPrice+"'/>" +
                        "<input type='hidden' id='pricerealedit"+len+"' value=''/>" +
                   
		    			"<td class='sticky-col sixth-col' style='background: #f9f9f9;' id='Desc"+len+"' style='width:30%'>"+description+"</td>"+
		    			"<td><textarea id='batchNum"+len+"' rows=1 style='resize:none;width: 87px;'>"+sku.productBatchNo+"</textarea></td>"+
			    			"<td><input class='form-control calendar_icon endDate'  readonly='readonly' style='width:100px;background-color: white;' id='expiryDate"+len+"' type='text' onfocus=callCalender('expiryDate"+len+"') onclick=callCalender('expiryDate"+len+"') placeholder='DD/MM/YYYY' /></td>" +
		    	 		"<td id='Pack"+len+"' class='Pack' onBlur='changePack(this);' onkeypress='PreventEnter(this);' type='number' contenteditable='true'>1</td>" +

		    			"<td >"+sku.measureRange+"</td>" +
		    			"<td id='Make"+len+"'>"+make+"</td>" +
		    			"<td><input type='text'id='mrp"+len+"'  style='width:70px;text-align:center' value='"+sku.mrp+"'></td>"+
		    			"<td id='Requested"+len+"' class='Requested' >0</td>" +
		    			"<td class='Price' id='SPrice"+len+"'>0</td>" +
	                    "<td><input id='discountpercentage"+len+"' class='discountpercentage' onBlur='changeDiscPerc(this);changeTotalCost();changeTotalQuantity();' onkeypress='PreventEnter(this);' type='number' style='width:70px;text-align:center' value='"+sku.discountPercentage+"'></td>"+
		    			"<td><input id='discountAmt"+len+"' class='discountAmt' onBlur='changeDiscAmt(this);changeTotalCost();changeTotalQuantity();' onkeypress='PreventEnter(this);' type='number' style='width:70px;text-align:center' value='"+sku.discountAmt+"'></td>"+
	                 	"<td><input id='freeqty"+len+"' class='freeqty' onBlur='changePack(this);' onkeypress='PreventEnter(this);' type='number' style='width:70px;text-align:center' value='"+sku.freeQty+"'></td>"+
			    			
	                    "<td  id='tax"+len+"' onBlur='changeGrnTax(this);' contenteditable='true'>"+parseFloat((taxRate*2)+igstRate).toFixed(2)+"</td>" +
		    			"<td  id='cgsttax"+len+"'>"+parseFloat(cgstTaxRate).toFixed(2)+"</td>" +
		    	 		"<td  id='sgsttax"+len+"'>"+parseFloat(sgstTaxRate).toFixed(2)+"</td>" +
		    	 		"<td id='igsttax"+len+"'>"+parseFloat(igstRate).toFixed(2)+"</td>"+
		    	 		"<td id='cess"+len+"'>"+parseFloat(cessRate).toFixed(2)+"</td>"+
		    			"<td class='Price' id='Price"+len+"' onBlur='changeSupplyPrice(this);' onkeypress='changeSupplyPriceonchange(this);PreventEnter(this);'    type='number' contenteditable='true'>"+sku.costPrice+"</td>" +
		    			
	
                
	"<td id='Cost"+len+"'>"+sku.costPrice+"</td>" +
		    			
		    			"<td><select  style='width:180px' class='handledBy"+len+"'  id='handledBy"+len+"'></select> </td>"+
		    			"<td id='Del"+len+"'>" +
		    			"<img id='Img"+len+"' src='"+contextPath+"/images/itemdelete.png' style='width:32%;cursor:pointer;' onclick='deleteItem(this);' title='Delete "+sku.skuId+"'/>"+
	                     "<img id='Img"+len+"' src='"+contextPath+"/images/bulewhiteplusicon.png' style='width:30%;cursor:pointer;margin-left: 10px;' onclick='addSkuwithplus("+slNo+");' title='Additem "+sku.skuId+"'/></td></tr>";

	   						$("#productsList tbody").append(row);
		    			callCalender("expiryDate"+len);
	   				}
	   				else
	   				{
	   					var row = "<tr id='dynamicdiv"+len+"' style='margin-top:5px;'><td class='slno sticky-col first-col' style='background: #f9f9f9;'>"+slNo+"</td><td  class='sticky-col second-col' style='background: #f9f9f9; id='Name"+len+"'>"+sku.skuId+"</td>" +
		   				"<td class='sticky-col third-col' style='background: #f9f9f9; id='ean"+len+"'>"+sku.ean+"</td>" +
		   				"<td class='sticky-col fourth-col' style='background: #f9f9f9;' id='hsnCode"+len+"' contenteditable='true'>"+sku.hsnCode+"</td>" +
		   				"<td class='sticky-col fifth-col' style='background: #f9f9f9;' id='itemScanCode"+len+"'   class='itemScanCode'  contenteditable='true'>"+sku.itemScanCode+"</td>" +
		   				"<input type='hidden' id='trackingRequired"+len+"' class='trackingRequired' value='"+sku.trackingRequired+"'/>"+
		             	"<input type='hidden' id='batchRequired"+len+"' name ='batchRequired' class='batchRequired' value='"+sku.batchRequired+"'/>"+
		   				"<input type='hidden' id='skuId"+len+"' value='"+sku.skuId+"'/>" +
		    			"<input type='hidden' id='pluCode"+len+"' value='"+sku.pluCode+"'/>" +
		    			"<input type='hidden' id='category"+len+"' value='"+sku.category+"'/>" +
		    			"<input type='hidden' id='brandCode"+len+"' value='"+sku.brandCode+"'/>" +
		    			"<input type='hidden' id='productRange"+len+"' value='"+sku.productRange+"'/>" +
		    			"<input type='hidden' id='measureRange"+len+"' value='"+sku.measureRange+"'/>" +
		    			"<input type='hidden' id='utility"+len+"' value='"+sku.utility+"'/>" +
		    			"<input type='hidden' id='itemTaxExclusive"+len+"' value='"+sku.itemTaxExclusive+"'/>" +

		    			"<input type='hidden' id='color"+len+"' value='"+sku.color+"'/>" +
		    			"<input type='hidden' id='size"+len+"' value='"+sku.size+"'/>" +
		    			"<input type='hidden' id='cgstTaxRate"+len+"' value='"+parseFloat(cgstTaxRate).toFixed(2)+"'/>" +
		    			"<input type='hidden' id='cessTaxRate"+len+"' value='"+parseFloat(cessRate).toFixed(2)+"'/>" +
		    			"<input type='hidden' id='igsttaxRate"+len+"' value='"+parseFloat(igstRate).toFixed(2)+"'/>" +
		    			"<input type='hidden' id='taxationlist"+len+"' value='"+JSON.stringify(sku.tax)+"'/>" +
	                     "<input type='hidden' id='priceDuplicate"+len+"' value='"+sku.costPrice+"'/>" +
                          "<input type='hidden' id='pricereal"+len+"' value='"+sku.costPrice+"'/>" +
                          "<input type='hidden' id='pricerealedit"+len+"' value=''/>" +
              
		    			"<td class='sticky-col sixth-col' style='background: #f9f9f9;' id='Desc"+len+"' style='width:30%'>"+description+"</td>"+
		    			"<td><textarea id='batchNum"+len+"' rows=1 style='resize:none;width: 87px;'>"+sku.productBatchNo+"</textarea></td>"+
			    			"<td><input class='form-control calendar_icon endDate'  readonly='readonly' style='width:100px;background-color: white;' id='expiryDate"+len+"' type='text' onfocus=callCalender('expiryDate"+len+"') onclick=callCalender('expiryDate"+len+"') placeholder='DD/MM/YYYY' /></td>" +
		    	 		"<td id='Pack"+len+"' class='Pack' onBlur='changePack(this);' onkeypress='PreventEnter(this);' type='number' contenteditable='true'>1</td>" +

		    			"<td >"+sku.measureRange+"</td>" +
		    			"<td id='Make"+len+"'>"+make+"</td>" +
		    			"<td><input type='text'id='mrp"+len+"'  style='width:70px;text-align:center' disabled='disabled' value='"+sku.mrp+"'></td>"+
		    			"<td id='Requested"+len+"' class='Requested' >0</td>" +
		    			"<td class='Price' id='SPrice"+len+"'>0</td>" +
	 "<td><input id='discountpercentage"+len+"' class='discountpercentage' onBlur='changeDiscPerc(this);changeTotalCost();changeTotalQuantity();' onkeypress='PreventEnter(this);' type='number' style='width:70px;text-align:center' value='"+sku.discountPercentage+"'></td>"+
		    			"<td><input id='discountAmt"+len+"' class='discountAmt' onBlur='changeDiscAmt(this);changeTotalCost();changeTotalQuantity();' onkeypress='PreventEnter(this);' type='number' style='width:70px;text-align:center' value='"+sku.discountAmt+"'></td>"+
	                 	"<td><input id='freeqty"+len+"' class='freeqty' onBlur='changePack(this);' onkeypress='PreventEnter(this);' type='number' style='width:70px;text-align:center' value='"+sku.freeQty+"'></td>"+
 				    			
	"<td  id='tax"+len+"' onBlur='changeGrnTax(this);' contenteditable='true'>"+parseFloat((taxRate*2)+igstRate).toFixed(2)+"</td>" +
		    			"<td  id='cgsttax"+len+"'>"+parseFloat(cgstTaxRate).toFixed(2)+"</td>" +
		    	 		"<td  id='sgsttax"+len+"'>"+parseFloat(sgstTaxRate).toFixed(2)+"</td>" +
		    	 		"<td id='igsttax"+len+"'>"+parseFloat(igstRate).toFixed(2)+"</td>"+
		    	 		"<td id='cess"+len+"'>"+parseFloat(cessRate).toFixed(2)+"</td>"+
		    			"<td class='Price' id='Price"+len+"' onBlur='changeSupplyPrice(this);' onkeypress='changeSupplyPriceonchange(this);PreventEnter(this);'    type='number' contenteditable='true'>"+sku.costPrice+"</td>" +
	
                  	    			
	
                    	"<td id='Cost"+len+"'>"+sku.costPrice+"</td>" +
		    	      	"<td><select  style='width:180px' class='storageRef"+len+"'  id='storageRef"+len+"'></select> </td>"+
		    			"<td><select  style='width:180px' class='handledBy"+len+"'  id='handledBy"+len+"'></select> </td>"+
		    			"<td id='Del"+len+"'>" +
		    			"<img id='Img"+len+"' src='"+contextPath+"/images/itemdelete.png' style='width:32%;cursor:pointer;' onclick='deleteItem(this);' title='Delete "+sku.skuId+"'/>"+
	                     "<img id='Img"+len+"' src='"+contextPath+"/images/bulewhiteplusicon.png' style='width:30%;cursor:pointer;margin-left: 10px;' onclick='addSkuwithplus("+slNo+");' title='Additem "+sku.skuId+"'/></td></tr>";

	   					
	   					$("#productsList tbody").append(row);
	   					appendStorageSystemID(sku,"storageRef"+len);
		    			callCalender("expiryDate"+len);
		    			$("#Pack"+len).focus();
						$("#dynamicdiv"+(len-1)).css("background","none");
						$("#dynamicdiv"+len).css("background","lightgreen", "important");
	   				}
	   				
	   				 
	   				 }
	   			 
	   			}else{
	   				var row = "<tr id='dynamicdiv"+len+"' style='margin-top:5px;'><td class='slno'>"+slNo+"</td><td id='Name"+len+"'>"+sku.skuId+"</td>" +
	    			"<input type='hidden' id='skuId"+len+"' value='"+sku.skuId+"'/>" +
	    			"<input type='hidden' id='pluCode"+len+"' value='"+sku.pluCode+"'/>" +
	    			"<input type='hidden' id='category"+len+"' value='"+sku.category+"'/>" +
	    			"<input type='hidden' id='brandCode"+len+"' value='"+sku.brandCode+"'/>" +
	    			"<input type='hidden' id='productRange"+len+"' value='"+sku.productRange+"'/>" +
	    			"<input type='hidden' id='measureRange"+len+"' value='"+sku.measureRange+"'/>" +
	    			"<input type='hidden' id='utility"+len+"' value='"+sku.utility+"'/>" +
	    			"<input type='hidden' id='itemTaxExclusive"+len+"' value='"+sku.itemTaxExclusive+"'/>" +

	    			"<input type='hidden' id='color"+len+"' value='"+sku.color+"'/>" +
	    			"<input type='hidden' id='size"+len+"' value='"+sku.size+"'/>" +
	    			"<input type='hidden' id='trackingRequired"+len+"' value='"+sku.trackingRequired+"'/>"+
	    			"<td id='Desc"+len+"'>"+description+"</td>"+
	    			"<td class='Price' id='Price"+len+"'>"+sku.costPrice+"</td>" +
	    			"<td id='Pack"+len+"' class='Pack' onBlur='changePack(this);' onkeypress='PreventEnter(this);' contenteditable='true'>1</td>" +
	    			"<td id='Cost"+len+"'>"+sku.costPrice+"</td><td id='Make"+len+"'>"+make+"</td>" +
	    			"<td id='Supplied"+len+"'>1</td><td class='Received' id='Received"+len+"'>1</td>" +
	    			"<td id='Rejected"+len+"' onBlur='changeRejected(this);' onkeypress='PreventEnter(this);' contenteditable='true'>0</td><td id='Del"+sku.price+"'>" +
	    			"<img id='Img"+len+"' src='"+contextPath+"/images/itemdelete.png' style='width:12%;cursor:pointer;' onclick='deleteItem(this);' title='Delete "+sku.skuId+"'/></td></tr>";
	    			$("#productsList tbody").append(row);
	    			
	   			}
    			
    		 changeTotalCost();
    		 changeTotalQuantity();
    		//changeEmp("handledBy"+len);
    		return  searchhaEmployee('',"handledBy"+len);
    	
    	}

  	 function changeEmp(element){	 
  		
  		return  searchhaEmployee('',element);
  		$('.handledBy').each(function(){
  		  var rowNo = $(this).attr("id").replace('handledBy','');
  		
  		  var received = $('#handledBy'+rowNo).text();
  		$('#handledBy').text(received);
  		
  		
  		 });
  	
  		
  	}
  
  	function changeQtyPack(element){
  		debugger;
  		var id = $(element).attr("id");
  		var rowNo = id.replace('supplyQty','');
  		var supplyQty = $('#supplyQty'+rowNo).text();
  		var supplyPrice = $('#supplyPrice'+rowNo).text();
  		
  		var totalValue =supplyQty*supplyPrice; 		
  		$('#cost'+rowNo).html(totalValue);
  		$('#netCost'+rowNo).html(totalValue);
  		totalValues();
  	}
  	
  	function totalValues(){
  		debugger;
  		
  		var len = parseInt($("#productsList tr").length);
  		var netCost =0;
  		for (var i = 1; i < len; i++) {
  			 netCost = netCost + parseInt($('#netCost'+i).text());
  			
  		}
  		$('#Totalcost').html(netCost);
  		$('#Invoice_Amount').html(netCost);
  	}
  
  	
  	 
function changePack(element){
	debugger
	
		
	var id = $(element).attr("id");
	var rowNo = id.replace('Pack','');
	

	
	
	
	var dup = parseFloat($('#priceDuplicate'+rowNo).val());
		
		if(dup == null || dup == undefined){
			dup = 0;
		}
	
	
	if (isNaN($("#"+id).html()) || $("#"+id).html() == ""){
		var supplied = parseInt($('#Supplied'+rowNo).html());
		$('#'+id).html(supplied);
	}
	var packVal = parseFloat($('#Pack'+rowNo).html());
	
	if (isNaN(packVal)){
		packVal =0;
		$('#Pack'+rowNo).html("0");
	}
	
	
	if(packVal<0){
		$('#Error').html("Pack should not be empty");
		var supplied = parseInt($('#Supplied'+rowNo).html());
		var receivedVal = parseInt($('#Received'+rowNo).html());
		var priceVal = parseFloat($('#Price'+rowNo).html());
		if (isNaN(priceVal) || priceVal == 0){
		 priceVal =1;
		$('#Price'+rowNo).html("1");
	  }
		$('#Pack'+rowNo).html(supplied);
		
		
		if(dup >priceVal){
				
			$('#Cost'+rowNo).html((parseFloat(receivedVal)*dup).toFixed(2));	
			
				
			}else{
				
		    $('#Cost'+rowNo).html(receivedVal*priceVal);
				
			}
		
		
		
		
	}else{
		var priceVal = parseFloat($('#Price'+rowNo).html());
		var rejected = parseInt($('#Rejected'+rowNo).html());
		if(packVal<rejected){
			$('#Error').html("Pack cannot be less than Rejected");
			var supplied = parseFloat($('#Supplied'+rowNo).html());
			$('#'+id).html(supplied);
		}
		else{
			var receivedVal =  packVal ;
			$('#Supplied'+rowNo).html(packVal);
			$('#Received'+rowNo).html(receivedVal);
			
		
			
			if(dup >= priceVal){
				
			$('#Cost'+rowNo).html((parseFloat(receivedVal)*dup).toFixed(2));	
			
			}else{
				
			$('#Cost'+rowNo).html(parseFloat(receivedVal*priceVal).toFixed(2));	
				
			}
			
			
			
			
		}
	}
	changeTotalCost();
	changeTotalQuantity();
}
function changeSupplyPrice(element){
	debugger;
	var id = $(element).attr("id");
	var rowNo = id.replace('Price','');
	if (isNaN($("#"+id).html()) || $("#"+id).html() == ""){
		var supplied = parseInt($('#Supplied'+rowNo).html());
		$('#'+id).html(supplied);
	}
	//modifed by manasa
	var packVal = parseFloat($('#Pack'+rowNo).html());
	if (isNaN(packVal) ){
		packVal =0;
		$('#Pack'+rowNo).html("0");
	}
	
	
	
	if(packVal<=0){
		$('#Error').html("Pack should not be empty");
		var supplied = parseInt($('#Supplied'+rowNo).html());
		var receivedVal = parseInt($('#Received'+rowNo).html());
		var priceVal = parseFloat($('#Price'+rowNo).html());
		$('#Pack'+rowNo).html(supplied);
		$('#Cost'+rowNo).html(parseFloat(receivedVal*priceVal).toFixed(2));
		$('#Price'+rowNo).html(parseFloat(priceVal).toFixed(2))
	}else{
		var priceVal = parseFloat($('#Price'+rowNo).html());
		if (isNaN(priceVal) || priceVal == 0){
		    priceVal =1;
			$('#Price'+rowNo).html("1");
	}
		$('#Price'+rowNo).html(parseFloat(priceVal).toFixed(2))
		var rejected = parseInt($('#Rejected'+rowNo).html());
		if(packVal<rejected){
			$('#Error').html("Pack cannot be less than Rejected");
			var supplied = parseInt($('#Supplied'+rowNo).html());
			$('#'+id).html(supplied);
		}
		else{
			var receivedVal =  packVal ;
			$('#Supplied'+rowNo).html(packVal);
			$('#Received'+rowNo).html(receivedVal);
			$("#priceDuplicate"+rowNo).val("");
			$('#Cost'+rowNo).html(parseFloat(receivedVal*priceVal).toFixed(2));
		}
	}
	
		$('#pricerealedit'+rowNo).val("true");
	
	changeTotalCost();
	changeTotalQuantity();
}

function changeSupplyPriceonchange(element){
	
	debugger;
	var id = $(element).attr("id");
	var rowNo = id.replace('Price','');
	$('#pricerealedit'+rowNo).val("true");
	}





function changeTotalitems(){
	debugger;
	 var countValue= 0;
	 var noofitems = 0.0;

	$('.Pack').each(function(){
		var rowNo = $(this).attr("id").replace('Pack','');
		 noofitems = noofitems+  parseFloat($("#Pack"+rowNo).html());
		 
		 countValue = countValue+1;

 });

$("#totalqty").val(noofitems);
 $("#noofitems").val(countValue);
	}

function changeTotalCost(){
	debugger
	var totalCost=0.0;
	 var totaltax = 0.0;
	 var taxesValue=0.0;
	 var cgstsgstAmt=0.0;
	 var cgstsgstTaxAmt=0.0;
	 var cgstAmt=0.0;
	 var sgstAmt=0.0;
	 var itemTaxfinal = 0.0;
		var cessTaxIncfinal = 0.0;
		var cessTaxExcfinal = 0.0;
		var IGSTTaxIncfinal = 0.0;
		var IGSTTaxExcfinal = 0.0;
		
		 var countValue= 0;
		 var noofitems = 0.0;
	 
	$('.Pack').each(function(){
		var itemTax = 0.0;
		var cessTaxInc = 0.0;
		var cessTaxExc = 0.0;
		var IGSTTaxInc = 0.0;
		var IGSTTaxExc = 0.0;
	  var rowNo = $(this).attr("id").replace('Pack','');
	  //modified by Koti Bomminei

var test =$("#priceDuplicate"+rowNo).val();
 if($("#taxInclusive").is(':checked'))
     		 {
	 var taxvalue =  parseFloat(($("#tax"+rowNo).html()*($("#Price"+rowNo).html()*$("#Pack"+rowNo).html()))/100);
if($("#priceDuplicate"+rowNo).val() != ""){   
  $("#Price"+rowNo).html(parseFloat($("#priceDuplicate"+rowNo).val()));
  $("#priceDuplicate"+rowNo).val("");
}else{
	$("#Price"+rowNo).html(parseFloat($("#Price"+rowNo).html()));
}
	}else{
		
   var taxvalue = ( parseFloat(($("#priceDuplicate"+rowNo).val()*$("#Pack"+rowNo).html())) - ( parseFloat(($("#priceDuplicate"+rowNo).val()*$("#Pack"+rowNo).html())) / (100 + (parseFloat($("#tax"+rowNo).html())))) * 100)
	
	
	if($("#priceDuplicate"+rowNo).val() != "" && $("#priceDuplicate"+rowNo).val() != undefined){
	$("#Price"+rowNo).html(parseFloat((parseFloat((parseFloat($("#priceDuplicate"+rowNo).val())*parseFloat($("#Pack"+rowNo).html()))-(taxvalue).toFixed(2)))/parseFloat($("#Pack"+rowNo).html())).toFixed(2));
	$("#priceDuplicate"+rowNo).val("");
	}
		
	}
	  var cost = $("#Price"+rowNo).html();
      var discountpercentage = 0;

            
			 if (isNaN(parseFloat($("#discountpercentage"+rowNo).val()))) {
				discountpercentage = 0;
				$("#discountpercentage"+rowNo).val(0);
				}else{
				discountpercentage	= parseFloat($("#discountpercentage"+rowNo).val());
				}
			
			 var costPriceFor = 0;
		       discountpercentage = discountpercentage/100;
     var discountAmt = parseFloat($("#discountAmt"+rowNo).val());


      if (isNaN(discountAmt)) {
				discountAmt = 0;
				$("#discountAmt"+rowNo).val(0);
				}else{
				discountAmt	= parseFloat($("#discountAmt"+rowNo).val());
				}
          

			
      if($('#pricerealedit'+rowNo).val() == "true" ){
	  var costPriceForTax = $("#Price"+rowNo).html()*($("#Pack"+rowNo).html());
      costPriceFor = $("#Price"+rowNo).html();
      $("#pricereal"+rowNo).val(costPriceFor);

      }else{
	  var costPriceForTax = $("#pricereal"+rowNo).val()*($("#Pack"+rowNo).html());
      costPriceFor = $("#pricereal"+rowNo).val();
      }
	

          costPriceForTax = costPriceForTax-((costPriceForTax*discountpercentage)+discountAmt);
          costPriceFor = costPriceFor-((costPriceFor*discountpercentage)+(discountAmt/parseFloat($("#Pack"+rowNo).html())));


       $("#Price"+rowNo).html(costPriceFor.toFixed(2));
	
	  var received = $("#Pack"+rowNo).html();
	  totalCost = parseFloat(costPriceForTax)+totalCost;
	
	  $('#Pack'+rowNo).html(parseFloat(received).toFixed(2))

   var discountpercentageval = parseFloat($('#discountpercentage'+rowNo).val());
	
    if(discountpercentageval >100){
	$("#Error").html("Discount Can not be more than 100%.");
	$('#discountpercentage'+rowNo).val("0");
	return
    }


	  var taxlist=$("#taxationlist"+rowNo).val();
	  if(taxlist != undefined){
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
			
			var sgstTaxRate=0.0;
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
			
			
			
			var locationstate = $("#location_state").val();
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
          	  if($("#taxInclusive").is(':checked'))
     		 {
			
			 $("#tax"+rowNo).html(parseFloat(cgstTaxRate+sgstTaxRate+igstRate).toFixed(1));
			 $("#igsttaxRate"+rowNo).val(igstRate);
			 }else{
				 
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
				
				var sgstTaxRate=0.0;
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
				
				
				
				var locationstate = $("#location_state").val();
				var suppierstate = $("#supplier_state").val();
				
				
				 if(locationstate.toUpperCase() !=  suppierstate.toUpperCase()){
					sgstTaxRate= 0.0;
					cgstTaxRate= 0.0;
					taxRate= 0.0;
					$("#igsttaxRate"+rowNo).val(igstRate);	
					 $("#cgstTaxRate"+rowNo).val(cgstTaxRate);	
				 }else{
					 igstRate = 0.0;
					 $("#cgstTaxRate"+rowNo).val(cgstTaxRate);
					 $("#igsttaxRate"+rowNo).val(igstRate);	

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
				 
	              $("#tax"+rowNo).html(parseFloat(cgstTaxRate+sgstTaxRate+igstRate).toFixed(1));
	   			 
	   			 
			
				 
			 }
		  
	  }
	  }
	  
	  var taxCGSGSTValue=$("#tax"+rowNo).html();
	  var taxIGSTValue=$("#igsttaxRate"+rowNo).val();
	 // taxCGSGSTValue = parseFloat(taxCGSGSTValue) - parseFloat(taxIGSTValue);
	  var taxCESSValue=$("#cessTaxRate"+rowNo).val();
		var cgstTaxRate=parseFloat(taxCGSGSTValue/2).toFixed(2);
		var cessTaxRate=parseFloat(taxCESSValue).toFixed(2);
		var IGSTTaxRate=parseFloat(taxIGSTValue).toFixed(2);

		
		var taxgst=$("#cgsgstAmt"+rowNo).val();
		cgstsgstTaxAmt=cgstsgstAmt+(parseFloat(taxgst));
		
		
		
		//$('#cgsttax'+rowNo).html(cgstTaxRate);
		//$('#sgsttax'+rowNo).html(cgstTaxRate);
		
		if(IGSTTaxRate != 0.0 || IGSTTaxRate != 0){
		 var taxvalueofCgst =  (cgstTaxRate*cost*received)/100;
		 cgstAmt = cgstAmt + parseFloat(taxvalueofCgst);
		 sgstAmt = sgstAmt + parseFloat(taxvalueofCgst);
		}
		
			 if($("#taxInclusive").is(':checked'))
			 {
				if(parseFloat(taxIGSTValue) == 0.0){
			  itemTax = ( parseFloat(costPriceForTax) - ( parseFloat(costPriceForTax) / (100 + (parseFloat(taxCGSGSTValue)))) * 100);
				}
			  cessTaxInc = ( parseFloat(costPriceForTax) - ( parseFloat(costPriceForTax) / (100 + (parseFloat(taxCESSValue)))) * 100);
			  IGSTTaxInc = ( parseFloat(costPriceForTax) - ( parseFloat(costPriceForTax) / (100 + (parseFloat(taxIGSTValue)))) * 100);

			  IGSTTaxIncfinal = IGSTTaxIncfinal+IGSTTaxInc;
			  
			  if(isNaN(cessTaxInc)){
					 cessTaxInc = 0.0;
				 }
			  
			  cessTaxIncfinal = cessTaxIncfinal+cessTaxInc;
			  
			  itemTaxfinal = itemTaxfinal+itemTax;
			  $('#cess'+rowNo).html(parseFloat(cessTaxInc).toFixed(2));
			  $('#igsttax'+rowNo).html(parseFloat(IGSTTaxInc).toFixed(2));
			  
		}else{
			if(parseFloat(taxIGSTValue) == 0.0){
			 itemTax = ( ((parseFloat(costPriceForTax) * (parseFloat(taxCGSGSTValue))) / 100));
			}
			 cessTaxExc = ( ((parseFloat(costPriceForTax) * (parseFloat(taxCESSValue))) / 100));
			 IGSTTaxExc = ( ((parseFloat(costPriceForTax) * (parseFloat(taxIGSTValue))) / 100));
			 
			 IGSTTaxExcfinal = IGSTTaxExcfinal+IGSTTaxExc;
			 
			 if(isNaN(cessTaxExc)){
				 cessTaxExc = 0.0;
			 } 
			 cessTaxExcfinal = cessTaxExcfinal+cessTaxExc;
			 itemTaxfinal = itemTaxfinal+itemTax;
			 $('#cess'+rowNo).html(parseFloat(cessTaxExc).toFixed(2));
			 $('#igsttax'+rowNo).html(parseFloat(IGSTTaxExc).toFixed(2));
	         }
		 
			 if((IGSTTaxExcfinal == 0.0 || IGSTTaxExcfinal != 0)  && (IGSTTaxIncfinal == 0.0 || IGSTTaxIncfinal != 0.)){
		    $('#cgsttax'+rowNo).html(parseFloat(itemTax/2).toFixed(2));
		    $('#sgsttax'+rowNo).html(parseFloat(itemTax/2).toFixed(2));
			 }else{
				 $('#cgsttax'+rowNo).html(parseFloat("0.0").toFixed(2));
				 $('#sgsttax'+rowNo).html(parseFloat("0.0").toFixed(2));
			 }
		 
			 if($("#taxInclusive").is(':checked'))
			 {
				 $('#Cost'+rowNo).html(parseFloat(costPriceForTax).toFixed(2));
			
			 }else{
				 $('#Cost'+rowNo).html(parseFloat(costPriceForTax+itemTax+cessTaxExc+cessTaxInc+IGSTTaxExc+IGSTTaxInc).toFixed(2));
 
			 }
				 
			   var freeqty = 0;
			 if (isNaN(parseFloat($("#freeqty"+rowNo).val()))) {
				freeqty = 0;
				$("#freeqty"+rowNo).val(0);
				}else{
				freeqty	= parseFloat($("#freeqty"+rowNo).val());
				}
			
			
				 noofitems = noofitems+  parseFloat($("#Pack"+rowNo).html())+freeqty;
			 
			 countValue = countValue+1;

		 $('#pricerealedit'+rowNo).val("false");
	  
	 });
	
	$("#totalqty").val(noofitems);
	 $("#noofitems").val(countValue);
	
	
		var locationstate = $("#location_state").val();
				var suppierstate = $("#supplier_state").val();
	 if(locationstate.toUpperCase() !=  suppierstate.toUpperCase()){
     $("#igstAmt").val(parseFloat(sgstAmt*2).toFixed(2));
    $("#cgstAmt").val("0");
	 $("#sgstAmt").val("0");
   }else{
	 $("#cgstAmt").val(parseFloat(cgstAmt).toFixed(2));
	 $("#sgstAmt").val(parseFloat(sgstAmt).toFixed(2));
      $("#igstAmt").val("0");
    }

	
	 	var totalcost=parseFloat(totalCost);
	 	
	 	 if($("#taxInclusive").is(':checked'))
		 {
	 		 totaltax = totaltax + parseFloat(itemTaxfinal)+cessTaxIncfinal+IGSTTaxIncfinal;
	 		totalcost	= (totalcost-totaltax);
	 		totalCost	= (totalCost-totaltax);
	 		
		  $('#subtotalCostgrn').val(totalcost.toFixed(2));
		 }else{
			 totaltax = totaltax + parseFloat(itemTaxfinal)+cessTaxExcfinal+IGSTTaxExcfinal;
			 $('#subtotalCostgrn').val(totalcost.toFixed(2)); 
		 }
		
		var shipmentCost = $("#shipping_costgrn").val();
		if($('#shipping_costgrn').val()!="")
			totalCost = totalCost + parseFloat(shipmentCost);
		var discount = $("#discountgrn").val();
		if($('#discountgrn').val()!="")
			totalCost = totalCost - parseFloat(discount);
		
		if(totaltax!= undefined)
			{
			if (totaltax != "" && isNaN(totaltax))
			console.info(totaltax);	
			else
				{
				
			$("#total_taxgrn").val(parseFloat(totaltax).toFixed(2));
			
				}
			}
		
		var othergrntax = $("#other_taxgrn").val();
		if($('#other_taxgrn').val()!="")
			totalCost = totalCost + parseFloat(othergrntax);
		
		var tax = $("#total_taxgrn").val();
		if(tax != "")
			totalCost = parseFloat(totalCost) + parseFloat(tax);
		$("#totalCost").val(parseFloat(totalCost).toFixed(2));
	
}



function changeGrnTax(element){
	//debugger
	var id = $(element).attr("id");
	if (isNaN($("#"+id).html()) || $("#"+id).html() == "")
		$('#'+id).html("0");
	var rowNo = id.replace('Pack','');
	//isNumeric(element);
	var packVal = parseFloat($('#Pack'+rowNo).html());
	if(packVal<=0){
		alert("Pack should not be empty");
		var priceVal = parseFloat($('#Price'+rowNo).html());
		$('#Pack'+rowNo).html(1);
		$('#totalCost'+rowNo).html(priceVal);
	}else{
		var priceVal = parseFloat($('#Price'+rowNo).html());
		$('#totalCost'+rowNo).html(packVal*priceVal);
		
		/*var tax = parseFloat($('#tax'+rowNo).html());
		$('#tax'+rowNo).html(packVal*tax);*/
	}
	/*var taxCGSGSTValue=$("#tax"+rowNo).html();
	var cgstTaxRate=parseFloat(taxCGSGSTValue/2).toFixed(2);
	$('#cgsttax'+rowNo).html(cgstTaxRate);
	$('#sgsttax'+rowNo).html(cgstTaxRate);*/
	changeTotalCost();
}
$('#total_taxgrn').on('input',function(e){
	// if($('#shipping_cost').val()!="")
	changeTotalCost();
});

$('#shipping_costgrn').on('input',function(e){
		// if($('#shipping_cost').val()!="")
	changeTotalCost();
	 });
$('#discountgrn').on('input',function(e){
		// if($('#shipping_cost').val()!="")
	changeTotalCost();
	 });

$('#other_taxgrn').on('input',function(e){
	// if($('#shipping_cost').val()!="")
changeTotalCost();
 });




function changeTotalQuantity(){
	debugger;
	var totalQty=0;
	$('.Received').each(function(){
	  var rowNo = $(this).attr("id").replace('Received','');
	  var qty = $("#Received"+rowNo).html();
	  totalQty = parseInt(qty)+totalQty;
	 });
	$('#totalQty').val(totalQty);
}

function changeRejected(element){
	//isNumeric(element);
	var id = $(element).attr("id");
	if (isNaN($("#"+id).html()) || $("#"+id).html() == "")
		$('#'+id).html("0");
	var rowNo = id.replace('Rejected','');
	var rejectedVal = $(element).html();
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
	$('#Cost'+rowNo).html(parseFloat(cost*received).toFixed(2));
	changeTotalCost();
	changeTotalQuantity();
}


function deleteItemDetails(element){
	var id = $(element).attr("id").replace('Img','');
	var plu = $("#pluCode"+id).val();
	$("."+plu).each(function(){
		$(this).parent().remove();
//		 selectedPack = selectedPack + parseInt($(this).text());
	 });
	$('#dynamicdiv'+id).remove();
	var slNo = 1; 
	 $('.slno').each(function(){
		$(this).text(slNo);
		slNo = parseInt(slNo) + 1;
	});
	changeTotalOrderCost();
}

function deleteDiv(element){
	var id = $(element).attr("id").replace('img','');
	$('#locations'+id).remove();
}
var deletedPlus = '';
function deleteItem(element){
	var id = $(element).attr("id").replace('Img','');
	deletedPlus = deletedPlus.concat($("#sno"+id).val()+',');
	$("#itemDeletionList").val(deletedPlus)
	$('#dynamicdiv'+id).remove();
	var slNo = 1; 
	 $('.slno').each(function(){
		$(this).text(slNo);
		slNo = parseInt(slNo) + 1;
	});
	changeTotalCost();
	changeTotalQuantity();
}

function isNumeric(element){ 
	 var $th = $(element);
	 var id = $(element).attr("id");
	 if(id.indexOf("Pack") > -1){
		 $th.html( $th.html().replace(/[^0-9]+( [0-9]+)*$/g, function(str){  
			      $('#'+id).html('');
			      return 1;
				 } 
			  ));
	 }
	 else if(id.indexOf("quantity") > -1){
		 $th.html( $th.html().replace(/[^0-9]+( [0-9]+)*$/g, function(str){  
			      $('#'+id).html('');
			      return 1;
				 } 
			  ));
	 }
	 else{
		 $th.html( $th.html().replace(/[^0-9]+( [0-9]+)*$/g, function(str){  
					return 0;
				 } 
				 )); 
	 }
}

$("#searchSupplier").on('input',function(e){
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

/*function validateProcurementReceipt(operation){
	if(operation == "submit"){
		if($("#supplierNameError").text() != ""){
			$("#supplierNameError").html("Supplier Name doesn't exist");
			return false;
		}
		 if($("#searchSupplier").val().trim() == ""){
			  $("#supplierNameError").html("Enter Supplier Name");
			  $("#searchSupplier").focus();
			  return;
		  }
		  if($("#supplier_Id").val() == ""){
			  $("#supplierNameError").html("Supplier Name doesn't exist");
			  $("#searchSupplier").focus();
			  return;
		  }
		var delivered_by = $("#delivered_by").val();
		var inspected_by = $("#inspected_by").val();
		if(delivered_by == ""){
			$("#deliveredByError").html("Delivered By is required");
			return false;
		}
		if(inspected_by == ""){
			$("#inspectedByError").html("Inspected By is required");
			return false;
		}
		
	}
	if(operation=="save"){
		var status = $("#status").val();
		$("#status option[value='"+status+"']").attr("value", "draft");
		if($("#supplierNameError").text() != ""){
			$("#searchSupplier").val("");
			$("#supplier_Id").val("");
		}
	}
	else{
		if($("#status").val() == "draft"){
			var status = $("#status option:selected").text();
			$("#status :selected").attr("value", status);
		}
	}
	var re = /^[0-9/]+$/;
	 if($("#date").val().trim() == ""){
			$("#dateError").html("Enter a Date");
			$("#date").focus();
			return false;
	 }
	 if(!re.test($("#date").val())){
			$("#dateError").html("Invalid Date");
			$("#date").focus();
			return false;
	 }
	var len = $("#productsList tr").length-1;
	var finalObj = {},itemDetails = [];
	finalObj.itemDetails = itemDetails;
	if(len == 0){
		alert("Add Atleast One Item to Receipt");
		return;
		}
	for(var i=1;i<=len;i++){
		var idAttr = $("#productsList tr:eq("+i+") td:last").attr("id").replace('Del','');
		var obj = {skuId:$("#skuId"+idAttr).val(),item_code:$("#Name"+idAttr).text(),item_description:$("#Desc"+idAttr).text(),price:$("#Price"+idAttr).text(),make:$("#Make"+idAttr).text(),cost:$("#Cost"+idAttr).text(),received:$("#Received"+idAttr).text(),reject:$("#Rejected"+idAttr).text(),supplied:$("#Supplied"+idAttr).text(),pack:$("#Pack"+idAttr).text()};
		finalObj.itemDetails.push(obj);
	}
	var formData  = JSON.stringify($('form').serializeObject());
	var totalQty = $("#totalQty").html();
	var totalCost = $("#totalCost").html();
	var itemDetails = JSON.stringify(finalObj);
	var contextPath = $("#contextPath").val();
	URL = contextPath + "/inventorymanager/createNewProcurementReceipt.do";
  	 	 $.ajax({
 			type: "POST",
 			url : URL,
 			data :{ 
           	formData : formData,
           	totalQty : totalQty,
           	totalCost : totalCost,
           	itemDetails : itemDetails
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
 			error : function() {
 				 alert("something went wrong");
 				$("#loading").css("display","none");
 				$("#mainDiv").removeClass('disabled');
 			}
 		});
}*/

function parseDate(str) {
    var mdy = str.split('/');
    return new Date(mdy[0], mdy[1]-1, mdy[2]);
}
function parseDateDDMMYYYY(str){
	var mdy = str.split('/');
	return new Date(mdy[2], mdy[1]-1, mdy[0]);
}

function parseDateMMDDYYYY(str) {
    var mdy = str.split('/');
    var yr = mdy[2].split(' ');
    return new Date(yr[0], mdy[0]-1, mdy[1]);
}

function parseDateYYYYMMDD(str) {
    var mdy = str.split('-');
    var yr = mdy[2].split(' ');
    return new Date(mdy[0], mdy[1]-1, yr[0]);
}
function daydiff(first, second) {
    return (second-first)/(1000*60*60*24);
}

/*function validatePurchaseOrder(operation,type){
	 var re = /^[0-9/]+$/;
	 if($("#orderDate").val().trim() == ""){
			$("#orderDateError").html("Enter a Date");
			$("#orderDate").focus();
			return;
	 }
	 if(!re.test($("#orderDate").val())){
			$("#orderDateError").html("Invalid Date");
			$("#orderDate").focus();
			return;
	 }
	 if($("#deliveryDate").val().trim() == ""){
			$("#deliveryDateError").html("Enter a Date");
			$("#deliveryDate").focus();
			return;
	 }
	 if(!re.test($("#deliveryDate").val())){
			$("#deliveryDateError").html("Invalid Date");
			$("#deliveryDate").focus();
			return;
	 }
	 
	 var noOfDays = daydiff(parseDateDDMMYYYY($('#orderDate').val()), parseDateDDMMYYYY($('#deliveryDate').val()));
	 if(noOfDays < 0){
		 $("#deliveryDateError").html("Delivery Date can't be less than Order Date");
		 return;
	 }
	 if(operation == "draft"){
		 if($("#supplierNameError").text() != ""){
				$("#searchSupplier").val("");
				$("#supplier_Id").val("");
			}
	 }
	 
	  var len = $("#productsList tr").length-1;
	  var itemDetails = [];
	  $("#orderStatus").val(operation);
	  if(operation == "submitted"){
		  if($("#order_submitted_by").val().trim() == ""){
			  $("#orderSubmittedByError").html("Enter Submitted By");
			  $("#order_submitted_by").focus();
			  return;
		  }
		  if($("#supplierNameError").text() != ""){
				$("#supplierNameError").html("Supplier Name doesn't exist");
				return false;
			}
		  if($("#searchSupplier").val().trim() == ""){
			  $("#supplierNameError").html("Enter Supplier Name");
			  $("#searchSupplier").focus();
			  return;
		  }
		  if($("#supplier_Id").val() == ""){
			  $("#supplierNameError").html("Supplier Name doesn't exist");
			  $("#searchSupplier").focus();
			  return;
		  }
		  if($("#supplier_contact_name").val().trim() == ""){
			  $("#supplierContactNameError").html("Enter Supplier Contanct Name");
			  $("#supplier_contact_name").focus();
			  return;
		  }
		  if($("#shipDno").val().trim() == ""){
			  $("#shipDnoError").html("Door No. is required");
			  $("#shipDno").focus();
			  return;
		  }
		  if($("#shipStreet").val().trim() == ""){
			  $("#shipStreetError").html("Street is required");
			  $("#shipStreet").focus();
			  return;
		  }
		  if($("#shipLoc").val().trim() == ""){
			  $("#shipLocError").html("Location is required");
			  $("#shipLoc").focus();
			  return;
		  }
		  if($("#shipCity").val().trim() == ""){
			  $("#shipCityError").html("City is required");
			  $("#shipCity").focus();
			  return;
		  }
	  }
		if(len == 0){
			alert("Add Atleast One Item to Order");
			return;
			}
		if(operation == "submitted"){
			  if($("#total_tax").val().trim() == ""){
				  $("#totalTaxError").html("Tax is required");
				  $("#total_tax").focus();
				  return;
			  }
		}
		for(var i=1;i<=len;i++){
			var idAttr = $("#productsList tr:eq("+i+") td:last").attr("id");
			idAttr = idAttr.replace('Del','');
			var obj = {skuId:$("#skuId"+idAttr).val(),pluCode:$("#pluCode"+idAttr).val(),itemId:$("#itemId"+idAttr).text(),itemDesc:$("#itemDesc"+idAttr).text(),itemPrice:$("#itemPrice"+idAttr).text(),quantity:$("#quantity"+idAttr).text(),totalCost:$("#totalCost"+idAttr).text(),make:$("#make"+idAttr).text(),model:$("#model"+idAttr).text(),color:$("#color"+idAttr).text(),size:$("#size"+idAttr).text()};
			itemDetails.push(obj);
		}
		
		var items = JSON.stringify(itemDetails);
		$("#whPurchaseItems").val(items);
		var formData  = JSON.stringify($('form').serializeObject());
		console.log(formData);
		var contextPath = $("#contextPath").val();
		if(type == "new")
			URL = contextPath + "/inventorymanager/createPurchaseOrder.do";
		else
			URL = contextPath + "/inventorymanager/updatePurchaseOrder.do";
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
}	*/ 





function validateShipmentReceipt(operation,poflag){
	
	
	debugger;
	$("#Success").html("");
	$('#ErrorExcel').html("");
	$("#AttachmentSuccess").html("");
	 $("#loglink").css("display","none");
	$('#receivedByError').html("");
	$('#approvedByError').html("");
	var flowUnder = $("#flowUnder").val();
	var qtyFlagStr = $("#qtyFlagstr").val();
	var  qtyFlag = false;
	if(qtyFlagStr == "" || qtyFlagStr == "false"){
		qtyFlag = qtyFlag;
	}else{
		qtyFlag = true;
	}
	
	$('#myModalIoss').modal('hide');
	 //purpose:for checking internet conection
	var online = window.navigator.onLine;
  	if(!online)
  	{
  	alert("check your internet connection,please try agian after some time");
  	return;
  	}

      if( $("#igstAmt").val()==""){
			 $("#igstAmt").val("0");
		}
		
	if(operation == "save"){
		
		debugger
		
		var subtotalval = $("#subtotalCostgrn").val();
		$("#subtotalCostgrn").val(subtotalval.replace(",",""));
		var delivered_by = $("#po_reference").val();
		var inspected_by = $("#inspected_by").val();
		
		
		
		/*if(delivered_by == ""){
			$("#po_referenceError").html("PO reference is required");
			return false;
		}*/
		//added by manasa
		/*if($("#po_reference").val().trim() == ""){
			  $("#poRefError").html("Enter po ref number");
			  $("#po_reference").focus();
			  return;
		  }*/
		
		
		
		if($("#supplierNameError").text() != ""){
			$("#supplierNameError").html("Supplier Name doesn't exist");
			return false;
		}
		 if($("#searchSupplier").val().trim() == ""){
			  $("#supplierNameError").html("Enter Supplier Name");
			  $("#searchSupplier").focus();
			  return;
		  }
		  if($("#supplier_Id").val() == ""){
			  $("#supplierNameError").html("Supplier Name doesn't exist");
			  $("#searchSupplier").focus();
			  return;
		  }
		  if($("#warehouse_location option:selected").text() == ""){
			  $("#warehouse_locationError").html("warehouse location required");
			  $("#warehouse_location").focus();
			  return;
		  }
		  if($("#deliveredOnStr").val() == ""){
			  $("#deliveredOnStrError").html("delivery date required");
			  $("#deliveredOnStr").focus();
			  return;
		  }
		  
		  var sdate= $("#date").val();
			var ddate= $("#deliveredOnStr").val();
			
			var noOfDays = daydiff(parseDate(sdate), parseDate(ddate));
				if (noOfDays < 0) {
					$("#deliveredOnStrError").html("Delivery  Date can't be less than  Date");
					return;
				} 
		  if($('#invoiceRefNumber').val().trim()==""){
				 //alert("fbhdf");
	     			$('#invoiceNumberError').html('Enter Invoice Number');
	     			 $("#invoiceRefNumber").focus();
	     			
	   	    		 return ;
	   	    	 }	
	}
	 
	  
	if(operation=="edit")
	{
		 if($('#invoiceRefNumber').val().trim()==""){
			 //alert("fbhdf");
     			$('#invoiceNumberError').html('Enter Invoice Number');
     			 $("#invoiceRefNumber").focus();
     			
   	    		 return ;
   	    	 }	
		 
		 if($('#receivedBy').val().trim()==""){
			 //alert("fbhdf");
     			$('#receivedByError').html('Received By');
     			 $("#receivedBy").focus();
     			
   	    		 return ;
   	    	 }	
		 
		 
		/* if($('#Approvedby').val().trim()==""){
			 //alert("fbhdf");
     			$('#approvedByError').html('Approved Number');
     			 $("#Approvedby").focus();
     			
   	    		 return ;
   	    	 }	*/
		 if($('#delivered_by').val().trim()==""){
			 //alert("fbhdf");
     			$('#deliveredByError').html('Delivered Number');
     			 $("#delivered_by").focus();
     			
   	    		 return ;
   	    	 }	
		 
		 
	var statusofGRN = $('#statusofGRN').val();
	var Statusofcurrent = $("#statusissue").val();
	 if(statusofGRN == Statusofcurrent && statusofGRN != "Submitted" && statusofGRN != "draft"){
     			$('#Error').html('Please Update The Status');
     			focusDiv("Error");
   	    		 return ;
   	    	 }	
	
	
	
		 
		 
		 
		 
	}
	
	if(operation=="save"){
	
		var status = $("#statusissue").val();
		$("#statusissue option[value='"+status+"']").attr("value", "draft");
		if($("#supplierNameError").text() != ""){
			$("#searchSupplier").val("");
			$("#supplier_Id").val("");
		}
	}
	else{
		if($("#statusissue").val() == "draft"){
		var status = "Submitted";
			$("#statusissue :selected").attr("value", "Submitted");
			
			
		}
		
	}
	var re = /^[0-9/]+$/;
	 if($("#date").val().trim() == ""){
			$("#dateError").html("Enter a Date");
			$("#date").focus();
			return false;
	 }
	 
	

var docLink = $("#attachmentUpload_refId").val();
                if(docLink == null || docLink == undefined){
                        docLink == ""; 
                }





		var docLink = $("#attachmentUploadFile").val();
        var docLinkId = $("#attachmentUpload_refId").val();
	 
	if(operation == "edit" && docLink == ""){
			var fileName = $("#linktoDownloadfileName").val();
			$("#attachmentUploadFile").val(fileName);
	}

	
	var len = $("#productsList tr").length-1;
	var finalObj = {},items = [];

	//added by manasa
	/*if($("#po_reference").val().trim() == ""){
		  $("#poRefError").html("Enter po ref number");
		  $("#po_reference").focus();
		  return;
	  }*/
	
	if(len == 0){
		alert("Add Atleast One Item to Receipt");
		return;
		}
	
	//debugger
	
	
	 var GSTIN = $('#GSTIN').val();
		
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
	

	debugger

	for(var i=1;i<=len;i++){
		
		var idAttr = $("#productsList tr:eq("+i+") td:last").attr("id").replace('Del','');
		
		
		//debugger
		
		
		
		 // }
		
		/*var rowNum =  parseInt(idAttr);
		 var  rowCompare=i;
		  var itemScanCode = $("#itemScanCode"+rowNum).html();
		  
		  if(trackReq == "true")
		  if(rowCompare == rowNum){
			  i++;
		  if ($("#itemScanCode"+i).text() == itemScanCode) {
		  		alert("scan code should not be duplicate")
		  		return ;
		  }
			  }*/
		
		
		
		var pack = $("#Pack"+idAttr).text();
		var basePriceValue=$("#Price"+idAttr).text();
		var taxCGSGSTValue=$("#tax"+idAttr).text();
		
		var cgsttaxRate=$("#cgsttax"+idAttr).text();
		var sgsttaxRate=$("#sgsttax"+idAttr).text();
		//debugger
		//var cgstTaxRate=parseFloat(taxCGSGSTValue/2).toFixed(2);
		//var sgstTaxRate=parseFloat(taxCGSGSTValue/2).toFixed(2);
		
		var cgstValue=parseFloat((basePriceValue*cgsttaxRate*pack)/100).toFixed(2);
		var sgstValue=parseFloat((basePriceValue*sgsttaxRate*pack)/100).toFixed(2);
		
		
		var storageRef = $("#storageRef"+idAttr).val();
		if(storageRef == undefined || storageRef == null || storageRef ==""){
			storageRef = "";
		}
		
		
		var cessAmt = parseFloat($("#cess"+idAttr).text());
		if(isNaN(cessAmt)){
			cessAmt = 0.0
		}
		
		var cessRate = parseFloat($("#cessTaxRate"+idAttr).val());
		if(isNaN(cessRate)){
			cessRate = 0.0
		}
		if($("#batchRequired"+idAttr).val()=="true"){
			
			if($("#batchNum"+idAttr).val() == ""){
					$("#Error").html("Enter The Batch Number");
					$("#Error").focus();
					return;
						}
			
			if($("#expiryDate"+idAttr).val() == ""){
					$("#Error").html("Select The Expiry Date");
					$("#expiryDate"+idAttr).focus();
					return;
						
						}
						
			var dateTime = getCurrentDate();
	   	  var date = dateTime.split(' ');
	   	  date = date[0].split('/');
	   	  var formatedDate = date[1]+"/"+date[0]+"/"+date[2];
	   	  var dateofexpiry = $('#expiryDate'+idAttr).val();
		 var noOfDaysstart = daydiff(parseDateDDMMYYYY(dateofexpiry), parseDateDDMMYYYY(formatedDate));
		 
  	 if(noOfDaysstart > 0){
 		  $("#Error").html("For Expiry Date, Past Dates Not allowed"); 
 		$("#expiryDate"+idAttr).focus();
 		 return false;
 	  }
					}
					
					
					
	
					
		var saleprice= 0;
			
			saleprice = $("#saleprice"+idAttr).val();
		if(saleprice == undefined || saleprice == null || saleprice == ""){
			saleprice = 0
		}
		
		if($("#flowUnder").val()=="warehouse" || $("#flowUnder").val()=="procurement"){
			
				var obj = {expiryDateStr:$("#expiryDate"+idAttr).val(),bactchNum:$("#batchNum"+idAttr).val(),trackingRequired:$("#trackingRequired"+idAttr).val(),ean:$("#ean"+idAttr).text(),itemScanCode:$("#itemScanCode"+idAttr).text(),hsnCode:$("#hsnCode"+idAttr).text(),igstRate:$("#igsttaxRate"+idAttr).val(),igstValue:$("#igsttax"+idAttr).text(),cgstRate:$("#cgstTaxRate"+idAttr).val(),cgstValue:$("#cgsttax"+idAttr).text(),sgstRate:$("#cgstTaxRate"+idAttr).val(),sgstValue:$("#sgsttax"+idAttr).text(),utility:$("#utility"+idAttr).val(),itemTax:$("#tax"+idAttr).html(),cessAmt:cessAmt,cessRate:cessRate,color:$("#color"+idAttr).val(),size:$("#size"+idAttr).val(),category:$("#category"+idAttr).val(),measurementRange:$("#measureRange"+idAttr).val(),productRange:$("#productRange"+idAttr).val(),brand:$("#brandCode"+idAttr).val(),uom:$("#Make"+idAttr).text(),sno:$("#sno"+idAttr).val(),skuId:$("#skuId"+idAttr).val(),pluCode:$("#pluCode"+idAttr).val(),itemName:$("#Name"+idAttr).text(),itemDesc:$("#Desc"+idAttr).text(),handledBy:$("#handledBy"+idAttr).val(),storageRef:storageRef,orderPrice:$("#SPrice"+idAttr).text(),supplyPrice:$("#Price"+idAttr).text(),suppliedQty:$("#Pack"+idAttr).text(),orderQty:$("#Requested"+idAttr).text(),totalCost:$("#Cost"+idAttr).text(),mrp:$("#mrp"+idAttr).val(),salePrice:saleprice,discount:$("#discountpercentage"+idAttr).val(),discountAmt:$("#discountAmt"+idAttr).val(),freeQty:$("#freeqty"+idAttr).val(),originalSupplierPrice:$("#pricereal"+idAttr).val()};
			//	var obj = {ean:$("#ean"+idAttr).text(),cgstRate:cgstTaxRate,cgstValue:cgstValue,sgstRate:cgstTaxRate,sgstValue:cgstValue,utility:$("#utility"+idAttr).val(),itemTax:$("#tax"+idAttr).html(),color:$("#color"+idAttr).val(),size:$("#size"+idAttr).val(),category:$("#category"+idAttr).val(),measurementRange:$("#measureRange"+idAttr).val(),productRange:$("#productRange"+idAttr).val(),brand:$("#brandCode"+idAttr).val(),uom:$("#Make"+idAttr).text(),sno:$("#sno"+idAttr).val(),skuId:$("#skuId"+idAttr).val(),pluCode:$("#pluCode"+idAttr).val(),itemName:$("#Name"+idAttr).text(),itemDesc:$("#Desc"+idAttr).text(),handledBy:$("#handledBy"+idAttr).val(),orderPrice:$("#SPrice"+idAttr).text(),supplyPrice:$("#Price"+idAttr).text(),suppliedQty:$("#Pack"+idAttr).text(),orderQty:$("#Requested"+idAttr).text(),totalCost:$("#Cost"+idAttr).text()};
		/*	items.push(obj);
			alert(JSON.stringify(itemDetails))*/
		}
		else{
			
			//var obj = {skuId:$("#skuId"+idAttr).val(),pluCode:$("#pluCode"+idAttr).val(),item_code:$("#Name"+idAttr).text(),item_description:$("#Desc"+idAttr).text(),price:$("#Price"+idAttr).text(),make:$("#Make"+idAttr).text(),cost:$("#Cost"+idAttr).text(),received:$("#Received"+idAttr).text(),reject:$("#Rejected"+idAttr).text(),supplied:$("#"+idAttr).text(),pack:$("#Supplied"+idAttr).text()};
			var obj = {utility:$("#utility"+idAttr).val(),uom:$("#Make"+idAttr).text(),sno:$("#sno"+idAttr).val(),skuId:$("#skuId"+idAttr).val(),pluCode:$("#pluCode"+idAttr).val(),itemName:$("#Name"+idAttr).text(),itemDesc:$("#Desc"+idAttr).text(),handledBy:$("#handledBy"+idAttr).val(),orderPrice:$("#SPrice"+idAttr).text(),supplyPrice:$("#Price"+idAttr).val(),suppliedQty:$("#Pack"+idAttr).val(),orderQty:$("#Requested"+idAttr).text(),totalCost:$("#Cost"+idAttr).text(),salePrice:saleprice};
		}
		items.push(obj);
		
	}
	finalObj.itemDetails = items;
/*	if($("#po_reference").val() != ""&& poflag == "" ){
		var  op = '<a id="summaryTag"  data-toggle="modal" data-target="#myModalIos"></a>';
		 $("#triggerEvent").append(op);
		 $("#summaryTag" ).trigger( "click" );
		 return
		 $("#triggerEvent").html("");
	}*/
	if(poflag != undefined)
	$("#toBeClosePO").val(poflag);
	var storeLocation = $("#warehouse_location option:selected").text();
	//finalObj.status=status;
	$("#location").val(storeLocation);
	
	
	if($("#po_reference").val() == ""){
		qtyFlag = true;
	}
	
	
	
	/*if(flowUnder=='warehouse'  || flowUnder=='procurement' )
	{
	 if(operation=="edit"){
	if($('#statusissue').val() == ''){
		 
	 }
		 else{
			 $('#defaultstatus').val("");
			 $('#defaultstatus').val($('#statusissue').val());
		 }
 }
	}*/
	/*if(operation=="edit"){
		if($('#statusissue').val() == ''){
			//$('#statusissue').val("Submitted");
		 }
    		 else{
    			 $('#defaultstatus').val("Submitted");
    			 $('#defaultstatus').val($('#statusissue').val());
    		 }
	 }*/
	if(flowUnder=='warehouse'  || flowUnder=='procurement' )
		{
	if(operation!="draft")
		{
		
		status=$("#status").val("Submitted");
		}
	else
		status="draft";
	
	
		}

	
	if(flowUnder=='procurement')
	{
   if(operation=="edit" && operation=="draft")
	{
	$("#status").val("Submitted");
	}
	}
	
   var date = $("#date").val();
	var duedate = $("#deliveredOnStr").val()
	var time = " 00:00:00";
	date = date.concat(time);
	duedate = duedate.concat(time);
	$("#date").val(date);
	$("#deliveredOnStr").val(duedate);
	var invoiceRefNumber = $("#invoiceRefNumber").val();
	//var handledBy = $("#handledBy").val()
	//$("#itemDeletionList").val(deletedPlus);
	var formData  = JSON.stringify($('form').serializeObject());
	console.info(JSON.stringify(formData))

	if(operation=="edit")
		{
		var totalQty ="";
		var totalCost = "";
		
		}
	else{
		var totalQty ="";
		var totalCost = "";
	}
	
	
	var maxRecords = 10;
	if($("#maxRecords").length > 0)
		maxRecords = $("#maxRecords").val();
	
	var startDate=""
	if($("#from").val() != ""){
		 startDate = $("#from").val();
	
	startDate = startDate+ " 00:00:00";
	
	}
	var endDate=""
		if($("#to").val() != ""){
			 endDate = $("#to").val();
	
		endDate= endDate+ " 00:00:00";
		}
	
	console.log(status);
	var itemDetails = JSON.stringify(finalObj);
	console.info(JSON.stringify(finalObj))
	var contextPath = $("#contextPath").val();
	console.log(operation);
	
	
	if(qtyFlag==false && Statusofcurrent =="Inwarded"){
		URL = contextPath + "/procurement/updateShipmentReceiptforPocomparision.do";
		
		}	
      else{
	
		if(operation=="edit")
		{
	   URL = contextPath + "/procurement/updateShipmentReceipt.do";
		}
	   else
    	URL = contextPath + "/procurement/createShipmentReceipt.do";
	
	   }
	
	   

	$.ajax({
 			type: "POST",
 			url : URL,
 			data :{ 
          	formData : formData,
            totalQty : totalQty,
           	totalCost : totalCost,
          	itemDetails : itemDetails,
          //  status : status,
           	flowUnder : flowUnder,
           	maxRecords : maxRecords,
           	startDate : startDate, 
           	endDate : endDate,
            qtyFlag : qtyFlag
           },
           beforeSend: function(xhr){                    
   	   			$("#loading").css("display","block");
   	   			$("#mainDiv").addClass("disabled");
   	   		  },
 			success : function(result) {
	
	       if(qtyFlag==false && Statusofcurrent =="Inwarded"){
		        $("#errmsg").html(result);
				$("#qtyFlagstr").val("true");
				$('#myModalIoss').modal('show');
	      	}else{
	         	$("#errmsg").html("");
 				$("#right-side").html(result);
             	}
	
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


function flagset(){
	$("#qtyFlagstr").val("false");	
}
function validatePurchaseOrder(operation,type){
	 //purpose:for checking internet conection
	debugger;
	$('#ErrorExcel').html("");
 	$('#urlfordoc').val("");
 	$("#loglink").css("display","none");
	$("#confirmError2").html("");
	$("#confirmError").html("");
	var online = window.navigator.onLine;
  	if(!online)
  	{
  	alert("check your internet connection,please try agian after some time");
  	return;
  	}
	 if(operation == 'gridupdate'){}
	 else{
		 var re = /^[0-9/]+$/;
		 
		 
		 if(operation != "draft"){
		 if($("#orderDate").val() == ""){
				$("#orderDateError").html("Enter a Date");
				focusDiv('orderDateError');
				return;
		 }
		 if(!re.test($("#orderDate").val())){
				$("#orderDateError").html("Invalid Date");
				focusDiv('orderDateError');
				return;
		 }
		 if($("#deliveryDate").val() == ""){
				$("#deliveryDateError").html("Enter a Date");
				focusDiv('deliveryDateError');
				return;
		 }
		 if(!re.test($("#deliveryDate").val())){
				$("#deliveryDateError").html("Invalid Date");
				focusDiv('deliveryDateError');
				return;
		 }
		 var noOfDays = daydiff(parseDateDDMMYYYY($('#orderDate').val()), parseDateDDMMYYYY($('#deliveryDate').val()));
		 if(noOfDays < 0){
			 $("#deliveryDateError").html("Delivery Date can't be less than Order Date");
			 focusDiv('deliveryDateError');
			 return;
		 }
		 }
	  if($("#supplierNameError").text() != ""){
			$("#supplierNameError").html("Supplier Name doesn't exist");
			return false;
		}
	  if($("#searchSupplier").val() == ""){
		  $("#supplierNameError").html("Enter Supplier Name");
		  $("#searchSupplier").focus();
		  return;
	  }
	  if($("#supplier_Id").val() == ""){
		  $("#supplierNameError").html("Supplier Name doesn't exist");
		  $("#searchSupplier").focus();
		  return;
	  }
	  /*if(operation != "draft"){
	  if($("#order_submitted_by").val() == ""){
		  $("#orderSubmittedByError").html("Enter Submitted By");
		  $("#order_submitted_by").focus();
		  return;
	  }
	  }*/
		 
	  //debugger
		
	

		 
		
		
		/*var items = JSON.stringify(itemDetails);
		var deliveryLocations = JSON.stringify(pOShipmentLocations);
		$("#whPurchaseItems").val(items);
		$("#deliveryLocations").val(deliveryLocations);*/
		 var storeLocation = $("#warehouseLocation option:selected").text();
		/* var storeLocationWithoutDesc =storeLocation.split("-");
			storeLocation = storeLocationWithoutDesc[0];*/
		 $("#storeLocation").val(storeLocation);
		
		 var finalObj = {};
			finalObj.quoteRef = $("#quoteReference").val();
			finalObj.poRef = $("#pO_Ref").val();
			finalObj.supplier_Id = $("#supplier_Id").val();
			finalObj.supplier_name = $("#searchSupplier").val();
			finalObj.order_date = $("#orderDate").val();
			finalObj.delivery_due_date = $("#deliveryDate").val();
			finalObj.ordereDate = $("#orderDate").val();
			finalObj.deliveryDate = $("#deliveryDate").val();
			if(operation != "Submitted" || operation != "draft"){
			finalObj.order_submitted_by = $("#order_submitted_by").val();
			}
			if(operation != "Submitted" && operation != "draft"){
			finalObj.order_approved_by = $("#order_approved_by").val();
			}
			finalObj.storeLocation = $("#storeLocation").val();
			finalObj.warehouse_location = $("#storeLocation").val();
			finalObj.shipping_mode = $("#shipping_mode").val();
			finalObj.cgstAmt = $("#cgstAmt").val();
			
			
			if(type == "new"){
				finalObj.status = operation;	
			}
			else{
				
				
				
				if($('#nostatus').val()=='nostatus'){
					 finalObj.status = $('#defaultstatus').val();
				
				if(finalObj.status == "draft" && operation == 'Submitted')
				finalObj.status =operation;
	     		 }
				 else if($('#statusissue').val() == ''){
					 finalObj.status = $('#defaultstatus').val();
    			 }
	     		 else{
	     			finalObj.status = $('#statusissue').val(); 
	     		 }
				
			}
		
			if($("#shipping_cost").val() == ""){
				$("#Error").html("Enter Shippment Charges")	
				focusDiv("Error");
				return;
			}
				
			
			else
				finalObj.shipping_cost = $("#shipping_cost").val();
			
			
			var count = 0;
			 $(".addedLocation").each(function(){
				 count= count+1;
			 });
			 
			 
			 if(operation != "draft"){
			 if(count == 1){
				 $("#confirmError2").html("Please Add Atleast One Delivery Location to Order.");	
				 focusDiv("confirmErrorDiv");
             return;
			 }
			 }
			 
			
			 if(operation != "draft"){
			 //if(type=="new"){
			 
			 for(i=1;i<=count-1;i++){
				var saver=  $("#locationhidden"+i).val();
				var Qtyflag = $("#selectedQuantity_"+i).text();
				 if( saver != "true" || Qtyflag==""){
					 $("#confirmError").html("Please enter the quantities against of each delivery location, you added.")	 
					 focusDiv("confirmErrorDiv");
					 return;
				 }
			 }
			 
			 }
			
			
			
			if($("#total_tax").val() == "")
				finalObj.total_tax = "0.0";
			else
				finalObj.total_tax = $("#total_tax").val();
			if($("#discount").val() == "")
				finalObj.discount = "0.0";
			else
				finalObj.discount = $("#discount").val();
			
			/*added by manasa 
			 * purpose:for othertax Amount
			 * */
		
		
		          $("#loading").css("display","block");
	   	   			$("#mainDiv").addClass("disabled");
			
			
			  var len = $("#productsList tr").length-1;
		  var itemDetails = [];
		  var pOShipmentLocations = [];
		  $("#orderStatus").val(operation);
//		  if(operation == "submitted"){
			  /*if($("#order_submitted_by").val() == ""){
				  $("#orderSubmittedByError").html("Enter Submitted By");
				  $("#order_submitted_by").focus();
				  return;
			  }
			  if($("#supplierNameError").text() != ""){
					$("#supplierNameError").html("Supplier Name doesn't exist");
					return false;
				}
			  if($("#searchSupplier").val() == ""){
				  $("#supplierNameError").html("Enter Supplier Name");
				  $("#searchSupplier").focus();
				  return;
			  }
			  if($("#supplier_Id").val() == ""){
				  $("#supplierNameError").html("Supplier Name doesn't exist");
				  $("#searchSupplier").focus();
				  return;
			  }*/
			 /* if($("#supplier_contact_name").val().trim() == ""){
				  $("#supplierContactNameError").html("Enter Supplier Contanct Name");
				  $("#supplier_contact_name").focus();
				  return;
			  }*/
//		  }
			if(len == 0){
				$("#Error").html("Add Atleast One Item to Order");
				focusDiv("Error");
				return;
				}
			
			
			
			$("#selectedItemsList tbody").html("");
			for(var i=1;i<=len;i++){
				var idAttr = $("#productsList tr:eq("+i+") td:last").attr("id");
				idAttr = idAttr.replace('Del','');
				
				var plu = $("#pluCode"+idAttr).val();
				var pack = $("#quantity"+idAttr).text();
				
				//written by manasa to get the cgst and sgst taxes
				var basePriceValue=$("#itemPrice"+idAttr).text();
				var taxCGSGSTValue=$("#cgsttax"+idAttr).text();
				
				
				//var cgstTaxRate=parseFloat(taxCGSGSTValue/2).toFixed(2);
				var cgstValue=parseFloat((basePriceValue*taxCGSGSTValue*pack)/100).toFixed(3);
				
				
				
				var selectedPack = 0;
				$("."+plu).each(function(){
						selectedPack = selectedPack + parseInt($(this).text());
				});
			/*	if(pack != selectedPack){
					$("#Error").html("Quantity ordered for "+$("#skuId"+idAttr).val()+" is not equal to sum of Quantity allocated to Delivery Locations");
					focusDiv('Error');
					return;
				}*/
				var is_cost_price_editable=$("#CostpriceEditable"+idAttr).val();
				if(is_cost_price_editable=="true")
					{
					is_cost_price_editable=true;
					}
				else
					{
					is_cost_price_editable=false;
					}
					
					
					
				var obj = {ean:$("#ean"+idAttr).text(),trackingRequired:$("#trackingRequired"+idAttr).val(),hsnCode:$("#hsnCode"+idAttr).text(),utility:$("#utility"+idAttr).val(),cgstRate:$("#sgsttax"+idAttr).val(),cgstValue:$("#cgsttaxvalue"+idAttr).text(),sgstRate:$("#sgsttax"+idAttr).val(),sgstValue:$("#sgsttaxvalue"+idAttr).text(),tax:$("#tax"+idAttr).html(),igstRate:$("#igsttax"+idAttr).val(),igstValue:$("#igsttaxvalue"+idAttr).text(),category:$("#category"+idAttr).val(),measurementRange:$("#measureRange"+idAttr).val(),productRange:$("#productRange"+idAttr).val(),brand:$("#brandCode"+idAttr).val(),skuId:$("#skuId"+idAttr).val(),pluCode:$("#pluCode"+idAttr).val(),itemId:$("#pluCode"+idAttr).val(),itemDesc:$("#itemDesc"+idAttr).text(),itemPrice:$("#itemPrice"+idAttr).text(),quantity:$("#quantity"+idAttr).text(),avlQty:$("#quantity"+idAttr).text(),totalCost:$("#totalCost"+idAttr).text(),uom:$("#make"+idAttr).text(),availableQty:$("#model"+idAttr).text(),color:$("#color"+idAttr).text(),size:$("#size"+idAttr).text(),mbq:$("#mbq"+idAttr).text(),profitability:$("#profitability"+idAttr).text(),mrpProfitability:$("#MrpProfitability"+idAttr).text(),mrp:$("#mrp"+idAttr).text(),avgsaleQty:$("#avgSale"+idAttr).text(),is_cost_price_editable:is_cost_price_editable};
				itemDetails.push(obj);
			
				$(".locationRow").each(function(){
					var locationId = $(this).attr("id");
					locationId = locationId.replace('locations','');
					if(locationId != 0){
						var selectedQty = parseInt($("#relatedItemsTable"+locationId+" tbody").find("."+plu).text());
						if(selectedQty > 0 && selectedQty != null && selectedQty != "null"){
							var shipmentLocationObj = {skuId:$("#skuId"+idAttr).val(),skuName:$("#itemDesc"+idAttr).text(),pluCode:$("#pluCode"+idAttr).val(),storeLocation:$("#location"+locationId).val(),quantity:$("#selectedQuantity_"+idAttr).text(),skuPrice:$("#itemPrice"+idAttr).text()};
							pOShipmentLocations.push(shipmentLocationObj);
						}
					}
				});
			} 
	 }
			
				 if(operation == 'gridupdate'){
		    	
		    	 finalObj.poRef = type;
		    	 var quantity= [],skuId = [], itemPrice = [];
			 var reqid = type;
		 		$('.'+reqid).each(function(){
		 			var id= $(this).attr("id").replace('quantity','');
		 		/*	alert(id)searc
		 			alert(id)
		 			id = id.replace(reqid,'');
		 			alert(id)
		 			var srid = reqid.concat(id)
		 			alert(srid)
		 			alert($("#skuId"+id).val())
		 			alert($("#quantity"+id).text())
		 			alert($("#itemPrice"+id).text())*/
		 	 		skuId.push($("#skuId"+id).val());
		 			quantity.push($("#quantity"+id).text());
		 			itemPrice.push($("#itemPrice"+id).text());
		 	 		finalObj.quantity = quantity;
		 	 		finalObj.itemPrice = itemPrice;
		 	 		finalObj.id = skuId;
		 		
		 		});
		 	
		 	}
			
			if($("#otherTaxAmt").val() == "")
				finalObj.otherTaxAmt = "0.0";
			else
				finalObj.otherTaxAmt = $("#otherTaxAmt").val();
			
			
			finalObj.credit_terms = $("#credit_terms").val();
			finalObj.payment_terms = $("#payment_terms").val();
			finalObj.shipping_terms = $("#shipping_terms").val();
			finalObj.remarks = $("#remarks").val();
			finalObj.sub_total = $("#subtotalCost").val();
			finalObj.products_cost = $("#subtotalCost").val();
			finalObj.total_po_value = $("#totalCost").val();
			finalObj.whPurchaseItems = itemDetails;
			finalObj.pOShipmentLocations = pOShipmentLocations;
			finalObj.shipmentLocations = pOShipmentLocations;
			finalObj.whPOShipmentLocations = pOShipmentLocations;
			finalObj.flowUnder = $("#operation").val();
			
			var formData  = JSON.stringify(finalObj);
//			console.log(formData);
//		var formData  = JSON.stringify($('form').serializeObject());
		console.log(formData);
		var contextPath = $("#contextPath").val();
		if(type == "new")
			URL = contextPath + "/procurement/createPurchaseOrder.do";
		else
			URL = contextPath + "/procurement/updatePurchaseOrder.do";
	  	 	 $.ajax({
	 			type: "POST",
	 			url : URL,
	 			contentType: "application/json",
	 			data : formData,
	 			beforeSend: function(xhr){                    
	   	   			
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



function searchPurchaseOrders(name,searchCategory,index){
	 //purpose:for checking internet conection
	var online = window.navigator.onLine;
  	if(!online)
  	{
  	alert("check your internet connection,please try agian after some time");
  	return;
  	}
	 var location = "";
	 var startDate = "";
	 var endDate = "";
	 var zone = "";
	 var category = "";
	 name=""
   		 if($("#searchPurchaseOrders").length>0)
   			name = $("#searchPurchaseOrders").val().trim();
	 //debugger
	 if($("#warehouseLocation").length > 0 && $("#warehouseLocation").val() != "ALL"){
	    	location = $("#warehouseLocation").val();
	    }
	 
	 if($("#outletZone").length > 0 && $("#outletZone").val() != "ALL"){
		 zone = $("#outletZone").val();
	    }
	 
	 debugger;
	 if($("#category").length > 0 && $("#category").val() != "ALL"){
		 category = $("#category").val();
	    }
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
		 if($("#from").length>0 && $("#to").length>0){
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
	 		}
		var maxRecords = 10;
		 if($("#maxRecords").length>0)
			 maxRecords = $("#maxRecords").val();
		var  itemwise = $("#skuidpo").val();
		var  supplier = $("#supplier_Id").val();
		var itemname = $(".itemwise").val();
		var suppliername = $(".vendorid").val();
		 var contextPath = $("#contextPath").val();
		 
	/*	//written by manasa
			 var allLocationsList = [];
			 var length = $('#warehouseLocation').children('option').length;
			 console.log(length)
		      	$('#warehouseLocation option').each(function() { 
		      		allLocationsList.push( $(this).attr('value'));
		      	   
		      	});
			
			 console.log(allLocationsList)
			//written by manasa
				 var  locationList="";
			      	for(i=1;i<allLocationsList.length;i++)
			      		{
			      		locationList =locationList+ allLocationsList[i]+',';
			      		}
			   
			    
			      	console.log(locationList)
		 */
		 
		 URL = contextPath + "/procurement/searchPurchaseOrders.do";
		 $.ajax({
				type: "GET",
				url : URL,
				data : {
					searchName : name,
					index : index,
					location : location,
					zone : zone,
					category : category,
					maxRecords : maxRecords,
					startDate : startDate,
					endDate : endDate,
					operation : operation,
					itemwise : itemwise,
					supplier : supplier,
					//locationList : locationList
				},
				beforeSend: function(xhr){                    
		   	   		$("#loading").css("display","block");
		   	   		$("#mainDiv").addClass("disabled");
		   	   	},
				success : function(result) {
					$('#right-side').html(result);
					 $(".itemwise").val(itemname);
					 $(".vendorid").val(suppliername);
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


function getPoSummary(id){
	 //purpose:for checking internet conection
	var online = window.navigator.onLine;
  	if(!online)
  	{
  	alert("check your internet connection,please try agian after some time");
  	return;
  	}
	 var location = "";
	 var startDate = "";
	 var endDate = "";
	 if($("#warehouseLocation").length > 0 && $("#warehouseLocation").val() != "ALL"){
	    	location = $("#warehouseLocation").val();
	    }
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
		 if($("#from").length>0 && $("#to").length>0){
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
	 		}
		var maxRecords = 10;
		 if($("#maxRecords").length>0)
			 maxRecords = $("#maxRecords").val();
		var  itemwise = $("#skuidpo").val();
		var  supplier = $("#supplier_Id").val();
		var itemname = $(".itemwise").val();
		var suppliername = $(".vendorid").val();
	
	 var contextPath = $("#contextPath").val();
	 URL = contextPath +"/procurement/getPoSummary.do";
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
				itemwise : itemwise,
				supplier : supplier,
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




function viewPurchaseOrderDetails(receiptRefNo,operation,status){
	 //purpose:for checking internet conection
	var online = window.navigator.onLine;
  	if(!online)
  	{
  	alert("check your internet connection,please try agian after some time");
  	return;
  	}
  	 var maxRecords = 10;
		if ($("#maxRecords").length > 0)
			maxRecords= $("#maxRecords").val();
  	//debugger
		
  	 var startDate = "";
	 var endDate = "";
	 if($("#from").length>0)
		 startDate = $("#from").val();
	 if($("#to").length>0)
		 endDate = $("#to").val();
  	
	 var formData={}
			/* var productCategory = "";
			 if($("#outletCategory").length > 0)
				 productCategory = $("#outletCategory").val();*/
			
	formData.storeLocation = $("#warehouseLocation").val();
    formData.startDateStr = $("#from").val();
    formData.endDateStr = $("#to").val();
	formData.maxRecords= maxRecords;
	
	 var searchName = "";
		if($("#searchShipmentReceiptId").length > 0 )
			searchName = $("#searchShipmentReceiptId").val().trim();
		formData.searchCriteria = searchName;
	var formData = JSON.stringify(formData);
		
	var op = $("#operation").val();
	var location = $("#warehouse_location").val();
	var contextPath = $("#contextPath").val();
	URL = contextPath + "/procurement/viewPurchaseOrderDetails.do";
		$.ajax({
			type: "GET",
			url : URL,
			data : {
				PO_Ref : receiptRefNo,
				operation : operation,
				formData : formData,
				op : op,
				status : status
			},
			beforeSend: function(xhr){                    
	   			$("#loading").css("display","block");
	   			$("#mainDiv").addClass("disabled");
	   		  },
			success : function(result) {
				//$("#tab_1").html(result);
				$("#right-side").html(result);
				//activeMenu(id);
				$("#operation").val(op);
				$("#fromDate").val(startDate);
				$("#toDate").val(startDate);
				$("#warehouse_location").val(location);
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

function printPurchaseOrderDetails(receiptRefNo,operation){
	debugger;
	 //purpose:for checking internet conection
	var online = window.navigator.onLine;
  	if(!online)
  	{
  	alert("check your internet connection,please try agian after some time");
  	return;
  	}
	var op = $("#operation").val();
	var location = $("#warehouse_location").val();
	var contextPath = $("#contextPath").val();
	URL = contextPath + "/procurement/printPurchaseOrderDetails.do";
		$.ajax({
			type: "GET",
			url : URL,
			data : {
				PO_Ref : receiptRefNo,
				operation : operation
			},
			beforeSend: function(xhr){                    
	   			$("#loading").css("display","block");
	   			$("#mainDiv").addClass("disabled");
	   		  },
			success : function(result) {
				  data=JSON.parse(JSON.stringify(result));
				  messageStatus= JSON.stringify(result);
					var parsed_json = JSON.parse(messageStatus);
					var error = parsed_json.err;
					if(error != undefined && error !=""){
						 $("#Error").html(error);
					}
				  var anchor = document.createElement('a');
				  anchor.href = data.urlOfPdf;
				  anchor.target = '_blank';
				  //anchor.download = '';
				  anchor.click();
				$("#loading").css("display","none");
				$("#mainDiv").removeClass('disabled')
			},
			error : function() {
				 alert("something went wrong");
				$("#loading").css("display","none");
				$("#mainDiv").removeClass('disabled');
			}
		});
}
function printgrnDetails(receiptRefNo,operation){
	 //purpose:for checking internet conection
	var online = window.navigator.onLine;
  	if(!online)
  	{
  	alert("check your internet connection,please try agian after some time");
  	return;
  	}
	var op = $("#operation").val();
	var location = $("#warehouse_location").val();
	var contextPath = $("#contextPath").val();
	URL = contextPath + "/procurement/printgrnOrderDetails.do";
		$.ajax({
			type: "GET",
			url : URL,
			data : {
				PO_Ref : receiptRefNo,
				operation : operation
			},
			beforeSend: function(xhr){                    
	   			$("#loading").css("display","block");
	   			$("#mainDiv").addClass("disabled");
	   		  },
			success : function(result) {
				  data=JSON.parse(JSON.stringify(result));
				  messageStatus= JSON.stringify(result);
					var parsed_json = JSON.parse(messageStatus);
					var error = parsed_json.err;
					if(error != undefined && error !=""){
						 $("#Error").html(error);
					}
				  var anchor = document.createElement('a');
				  anchor.href = data.urlOfPdf;
				  anchor.target = '_blank';
				  //anchor.download = '';
				  anchor.click();
				$("#loading").css("display","none");
				$("#mainDiv").removeClass('disabled')
			},
			error : function() {
				 alert("something went wrong");
				$("#loading").css("display","none");
				$("#mainDiv").removeClass('disabled');
			}
		});
}

function editShipmentReceiptDetails(receiptRefNo,location){
	var flowUnder = $("#flowUnder").val();
	 var contextPath = $("#contextPath").val();
	 var location = $("#warehouse_location").val();
	 //purpose:for checking internet conection
		var online = window.navigator.onLine;
	  	if(!online)
	  	{
	  	alert("check your internet connection,please try agian after some time");
	  	return;
	  	}
	  	 var maxRecords = 10;
			if ($("#maxRecords").length > 0)
				maxRecords= $("#maxRecords").val();
		
	
	  	 var formData={}
		/* var productCategory = "";
		 if($("#outletCategory").length > 0)
			 productCategory = $("#outletCategory").val();*/
		
		 formData.location = $("#warehouseLocation").val();
		 formData.startDate = $("#from").val();
		 formData.endDate = $("#to").val();
	//	 formData.brandName= $("#outletBrandId").val();
		
		 
		 var searchName = "";
			if($("#searchShipmentReceiptId").length > 0 )
				searchName = $("#searchShipmentReceiptId").val().trim();
			formData.searchCriteria = searchName;
		var formData = JSON.stringify(formData);
  	 URL = contextPath + "/procurement/editShipmentReceiptDetails.do";
		$.ajax({
			type: "GET",
			url : URL,
			data : {
				receiptRefNo : receiptRefNo,
				location : location,
				flowUnder : flowUnder,
			    formData : formData,
			    maxRecords : maxRecords
				//operation : operation
				
			},
			beforeSend: function(xhr){                    
 	   			$("#loading").css("display","block");
 	   			$("#mainDiv").addClass("disabled");
 	   		  },
 			success : function(result) {
 			
 				//changeEmp($("#handledBy").text());
 				//searchhaEmployee('',handledBy);
				//$("#tab_2").html(result);
 				$("#right-side").html(result);
// 				$("#flowUnder").val(flowUnder);
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

function viewShipmentReceiptDetails(receiptRefNo){
	var flowUnder = $("#flowUnder").val();
	 var contextPath = $("#contextPath").val();
	 
	 //purpose:for checking internet conection
		var online = window.navigator.onLine;
	  	if(!online)
	  	{
	  	alert("check your internet connection,please try agian after some time");
	  	return;
	  	}
	 
	 var operation ="";
	 if($("#operation").val() != '' && $("#operation").val().length>0)
		 operation=$("#operation").val();
	 
	 var maxRecords = 10;
		if ($("#maxRecords").length > 0)
			maxRecords= $("#maxRecords").val();
	 
	 var formData={}
		
	 formData.skuId = $("#skuidpo").val();
	 //formData.brandCode= $("#searchItems").val();
	 formData.location= $("#warehouseLocation").val();
	 formData.startDate= $("#from").val();
	 formData.endDate= $("#to").val();
	 formData.itemName=$(".itemwise").val();
	 formData.searchCriteria=$("#searchShipmentReceiptId").val();
	 formData.maxRecords = maxRecords;
	// var suppliername = $(".vendorid").val();
	 
	 var formData = JSON.stringify(formData);
	 
  	 URL = contextPath + "/procurement/viewShipmentReceiptDetails.do";
		$.ajax({
			type: "GET",
			url : URL,
			data : {
				receiptRefNo : receiptRefNo,
				flowUnder : flowUnder,
				formData : formData,
				operation : operation
			},
			beforeSend: function(xhr){                    
 	   			$("#loading").css("display","block");
 	   			$("#mainDiv").addClass("disabled");
 	   		  },
 			success : function(result) {
				//$("#tab_2").html(result);
 				$("#right-side").html(result);
// 				$("#flowUnder").val(flowUnder);
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


function searchShipmentReceipt(name,searchCategory,index,saveFlag){
	var location = "";
	if(saveFlag === undefined || saveFlag == null)
		saveFlag = false;

	//purpose:for checking internet conection
	var online = window.navigator.onLine;
	if(!online)
	{
		alert("check your internet connection,please try agian after some time");
		return;
	}
	//debugger
	var startDate = "";
	var endDate = "";
	var flowUnder = $("#flowUnder").val();
	if($("#warehouseLocation").length > 0){
		location = $("#warehouseLocation").val();
	}

	name=""
		if($("#searchShipmentReceiptId").length>0)
			name = $("#searchShipmentReceiptId").val().trim();

	var operation ="";
	if($("#operation").val() != '' && $("#operation").val().length>0)
		operation=$("#operation").val();
	var CurrentDate=getCurrentDate().split(" ");
	var  finalstr=CurrentDate[0];
	var dobDiff = daydiff(parseDateMMDDYYYY(finalstr), parseDate($('#from').val()));
	if(dobDiff > 0){
		alert("Start Date  can't be Future Date");
		return false;s
	}
	if($("#from").length>0 && $("#to").length>0){
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
	}
	var maxRecords = 10;
	if($("#maxRecords").length>0)
		maxRecords = $("#maxRecords").val();
	var contextPath = $("#contextPath").val();
	URL = contextPath + "/procurement/searchShipmentReceipts.do";
	var  itemwise = "";
	var  supplier = "";
	if($(".itemwise").length>0)
		itemwise = $("#skuidpo").val();
	if($(".vendorid").length>0)
		supplier = $("#supplier_Id").val();
	var itemname = $(".itemwise").val();
	var suppliername = $(".vendorid").val();

	var category = "";
	if($("#outletCategory").length>0)
		category = $("#outletCategory").val();




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
			operation : operation,
			flowUnder : flowUnder,
			itemwise : itemwise,
			supplier : supplier,
			saveFlag : saveFlag,
			category : category
		},
		beforeSend: function(xhr){                    
			$("#loading").css("display","block");
			$("#mainDiv").addClass("disabled");
		},
		success : function(result) {
			$('#right-side').html(result);
			var anchor = document.createElement('a');
			anchor.href = $("#stockdownloadurl").val();
			anchor.target = '_blank';
			anchor.download = '';
			if($("#stockdownloadurl").val()!=null && $("#stockdownloadurl").val()!='')
				anchor.click();
			$(".itemwise").val(itemname);
			$(".vendorid").val(suppliername);
			$("#skuidpo").val(itemwise);
			$("#supplier_Id").val(supplier);
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

	function updatePurchaseOrder(status,poRef){
		 //purpose:for checking internet conection
		var online = window.navigator.onLine;
	  	if(!online)
	  	{
	  	alert("check your internet connection,please try agian after some time");
	  	return;
	  	}
		var operation = $("#operation").val();
		var location = $("#warehouse_location").val();
		var contextPath = $("#contextPath").val();
		 URL = contextPath + "/procurement/updatePOStatus.do";
		 $.ajax({
				type: "GET",
				url : URL,
				data : {
					status : status,
					poRef : poRef,
				},
				beforeSend: function(xhr){                    
		   	   		$("#loading").css("display","block");
		   	   		$("#mainDiv").addClass("disabled");
		   	   	},
				success : function(result) {
					$('#right-side').html(result);
					$("#operation").val(operation);
					$("#warehouse_location").val(location);
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
	
	
	function userrating(rating){
		$(("#outlet_rating")).val(rating);
	}
	
	function getgoodsReceiptSummary(id){
		 //purpose:for checking internet conection
		var online = window.navigator.onLine;
	  	if(!online)
	  	{
	  	alert("check your internet connection,please try agian after some time");
	  	return;
	  	}
		 var location = "";
		 var startDate = "";
		 var endDate = "";
		 var flowUnder = $("#flowUnder").val();
		 if($("#warehouseLocation").length > 0){
		    	location = $("#warehouseLocation").val();
		    }
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
			 if($("#from").length>0 && $("#to").length>0){
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
		 		}
			 var  itemwise = $("#skuidpo").val();
				var  supplier = $("#supplier_Id").val();
				var itemname = $(".itemwise").val();
				var suppliername = $(".vendorid").val();
		 var contextPath = $("#contextPath").val();
		 URL = contextPath +"/procurement/getgoodsReceiptSummary.do";
		 var flowUnder = "";
		 if($("#flowUnder").length > 0)
				flowUnder = $("#flowUnder").val();
			$.ajax({
				type: "GET",
				url : URL,
				data : {
					flowUnder : flowUnder,
					startDate : startDate,
					endDate : endDate,
					itemwise : itemwise,
					supplier : supplier
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



	function dispatchPo(id,flag){
		debugger;
		 var selected = "";
		 //purpose:for checking internet conection
			var online = window.navigator.onLine;
		  	if(!online)
		  	{
		  	alert("check your internet connection,please try agian after some time");
		  	return;
		  	}
		 if(flag)
			 var selectedLabel = 'Please Select Atleast One PO to Confirm';
		 else
	   		var selectedLabel = 'Please Select Atleast One PO to Dispatch';
	   		var name=$('#deleteActionLabel').val();
	   		var atLeastOneIsChecked = $('input[name="selectall"]:checked').length > 0;
	   		var selectedLength = $('input[name="selectall"]:checked').length;
	   		var selectedID = $("#selectall").length;
	   		if(selectedLength == 1 && selectedID == 0)
	   			atLeastOneIsChecked = false;
	   		var yes = false;
	   		if(!atLeastOneIsChecked){
	   			alert(selectedLabel+" ");
	   			$(".iospopup").css("visibility","hidden");
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
	   			//debugger
	   		 if(flag=='true')
	   			yes = confirm("Are you sure, you want to Confirm "+selected);
	   		 else
	   			yes = confirm("Are you sure, you want to Dispatch "+selected); 
	   		 var contextPath = $("#contextPath").val();
			 URL = contextPath +"/procurement/dispatchPo.do";
			 var flowUnder = "";
			 if($("#warehouseLocation").length > 0)
					flowUnder = $("#warehouseLocation").val();
				$.ajax({
					type: "GET",
					url : URL,
					data : {
						ids:selected,
						flowUnder : flowUnder,
						flag : flag,
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
	   	
		
		 
	}
	
	function createGrn(id){
		 //purpose:for checking internet conection
		var online = window.navigator.onLine;
	  	if(!online)
	  	{
	  	alert("check your internet connection,please try agian after some time");
	  	return;
	  	}
		 var contextPath = $("#contextPath").val();
		 URL = contextPath +"/procurement/createGrn.do";
		 var flowUnder = "";
		 if($("#warehouseLocation").length > 0)
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
	
	
	function updateShippentReceipt(gnid){
		
		 //purpose:for checking internet conection
		var online = window.navigator.onLine;
	  	if(!online)
	  	{
	  	alert("check your internet connection,please try agian after some time");
	  	return;
	  	}
		 var stockissueobj = {}, Qty = [],skuId = [],issued = [],itemDetails = [];
		 stockissueobj.goods_issue_ref_num = gnid;
			 var reqid = gnid;
		 		$('.'+reqid).each(function(){
		 			var srid= $(this).attr("id").replace('approvedQty','');
		 	 		skuId.push($("#skuId"+srid).val());
		 	 		Qty.push($("#approvedQty"+srid).val());
		 	 		issued.push($("#supplyPrice"+srid).val());
		 		});
		 		
		 		 stockissueobj.issuedqty = issued;
	     		 stockissueobj.qty = Qty;
	     		 stockissueobj.skuId = skuId;
	     		 stockissueobj.reciptDetails=itemDetails;
		 		 var formData = JSON.stringify(stockissueobj);
			 	 console.log(formData)
			 	var contextPath = $("#contextPath").val();
			 		URL = contextPath + "/procurement/updateShipmentReceiptGrid.do";
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
//			  				$("#flowUnder").val(flowUnder);
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
	
	/* function getCurrentDate(){
     	var date = new Date();
     	var dd = date.getDate();
 		var mm = date.getMonth()+1; //January is 0!
 		var yyyy = date.getFullYear();
 		var hrs = date.getHours();
 		var mints = date.getMinutes();
 		var sec = date.getSeconds();
 		 if(dd<10) {
 		     dd='0'+dd;
 		 } 
 		 if(mm<10) {
 		     mm='0'+mm;
 		 } 
 		 today = mm+'/'+dd+'/'+yyyy+' '+hrs+':'+mints+':'+sec;
 		 return today;
     }
	*/
	
	
	function generateAutoPO(operation,index){
		
		debugger;

         var online = window.navigator.onLine;
	  	if(!online)
	  	{
	  	alert("check your internet connection,please try agian after some time");
	  	return;
	  	}
	  	
	  	
	  	var radioValue = $("input[name='selectb']:checked"). val();
	  	var location = "";
	  	var outletLocation = "";
	  	
	  	if(radioValue == "warehouse"){
	  	
	  	var location = $("#warehouseLocation").val();
	  	}else{
	  	
	  	var outletLocation = $("#outletLocation").val();
	  	
	  	}
	  	
	  	var maxRecords = 10;
	  	 var contextPath = $("#contextPath").val();
		 URL = contextPath +"/inventorymanager/generateAutoPO.do";
		 
		 $.ajax({
	  			type: "POST",
	  			url : URL,
	  			
	  			data : {
	  				location: location,
	  				maxRecords :maxRecords,
	  				operation : operation,
					index : index,
	  				
	  				
	  				
	  				
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
	  			error : function() {
	  				 alert("something went wrong");
	  				$("#loading").css("display","none");
	  				$("#mainDiv").removeClass('disabled');
	  			}
	  		});
		
		
	}
	function initAutocomplete() {
		debugger
		 var input = document.getElementById('locality');
    var searchBox = new google.maps.places.SearchBox(input);
    searchBox.addListener('places_changed', function() {
    var places = searchBox.getPlaces();
    if (places.length == 0) {
      return;
    }
    places.forEach(function(place) {
  	  var data=JSON.parse(JSON.stringify(place));
    $("#gpsLatitude").val(JSON.stringify(data.geometry.location.lat));
    $("#gpsLongitude").val(JSON.stringify(data.geometry.location.lng));
    });
  });
}

	
	function clearAutoAppend(){
		
		$("#outletCategory").val("");
		$("#outletSubcategory").val("");
		$("#searchSupplier").val("");
		
		
		
		
	}
	
	$('ul.supplier').on('focus', 'li', function() {
		debugger;
	   /*  $this = $(this);
	    $this.addClass('selected').siblings().removeClass();
	    $this.closest('ul').scrollTop($this.index() * $this.outerHeight()); */
	}).on('keydown', 'li', function(e) {
		debugger;
	    $this = $(this);
	    if (e.keyCode == 40) {  
	    	$('ul').scrollTo(this);
	        //$this.next().focus();
	        return false;
	    } else if (e.keyCode == 38) { 
	    	debugger;
	    	$('ul').scrollTo(this);
	        /* $this.prev().focus(); */
	        return false;
	    }
	}).find('li').first().focus();	
	
	
	

	$(".searchItemsforGRN").bind('input', function () {
			 try{
				 debugger;
				var online = window.navigator.onLine;
			  	if(!online){
			  	alert("Check your internet connection,Please try agian after some time.");
			  	return;
			  	} 
			  	
						var supplier = $('#searchSupplier').val();
						var supplier_Id = $('#supplier_Id').val();
	   					if(supplier_Id == undefined || supplier_Id ==null || supplier_Id == ""){
	   						supplier_Id = "";
	   					}
	   					
	   				if(supplier=="" && supplier_Id == ""){
						alert("Please Select Supplier...");
	   				  	return;
					}  
						 
					
			  	
			  	
			  	$(".Error").html("");
			  	$("#searchItemsErrorID").html("");
					 var searchName = $(this).val().trim();
					 if(searchName!=""){ 
						 
					if($("#searchScan").is(':checked'))
						 {
							var searchName = $(this).val().trim();
							if(searchName.length == 13 || searchName.length == 7)
								{
								
								getSkuDetails(searchName,"")
								}
							else
								{
								
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
		
	
	/*$(".searchItemsforGRN").bind('blur', function () {
		 try{
			 debugger;
			var online = window.navigator.onLine;
		  	if(!online){
		  	alert("Check your internet connection,Please try agian after some time.");
		  	return;
		  	}
		  	
		  	$(".Error").html("");
		  	$("#searchItemsErrorID").html("");
				 var searchName = $(this).val().trim();
				 
					var supplier = $('#searchSupplier').val();
					var supplier_Id = $('#supplier_Id').val();
   					if(supplier_Id == undefined || supplier_Id ==null || supplier_Id == ""){
   						supplier_Id = "";
   					}
				 
				 if(searchName!=""){ 
					 
				if($("#searchScan").is(':checked'))
					 {
						var searchName = $(this).val().trim();
						if(supplier!="" && supplier_Id != ""){
						if(searchName.length>=5)
							{
							getSkuDetails(searchName,"")
							}
						}
						
					
					 }
 			
				
				 }
		 	}
		catch(e)
		{
			errorCode(e);
		}
	});
*/
	
	
	 
	 
	 function getstateforPOandGRN(){
		 //purpose:for checking internet conection
		 debugger;
			var online = window.navigator.onLine;
		  	if(!online)
		  	{
		  	alert("check your internet connection,please try agian after some time");
		  	return;
		  	}
		 //debugger
		 var contextPath = $("#contextPath").val();
		 var storeLocation = $("#warehouse_location option:selected").text();
		 if(storeLocation=='')
			 storeLocation =$("#warehouseLocation option:selected").text();
		
			 URL = contextPath + "/inventorymanager/getLocationsforPOGRN.do";
		
		 $.ajax({
     			type: "GET",
     			url : URL,
     			data : {
     				
     				storeLocation : storeLocation
     			},
     			beforeSend: function(xhr){                    
	   	   			$("#loading").css("display","block");
	   	   			$("#mainDiv").addClass("disabled");
	   	   		  },
     			success : function(result) {
     				appendstate(result,storeLocation);
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
	
	 
	 function appendstate(locList,storeLocation){
			debugger;
			var locState="";
			 for(var i=0;i<locList.length;i++){
				 if(locList[i].locationId == storeLocation){
					 locState = locList[i].state;
				 }
			 }
			 $("#location_state").val(locState);
		}
	 
	 function getstateforSuppier(){
		 //purpose:for checking internet conection
		 debugger;
			var online = window.navigator.onLine;
		  	if(!online)
		  	{
		  	alert("check your internet connection,please try agian after some time");
		  	return;
		  	}
		 //debugger
		 var contextPath = $("#contextPath").val();
		 var Supplier = $("#searchSupplier").val();
		 
		 URL = contextPath + "/inventorymanager/searchSuppliers.do";
		
		 $.ajax({
     			type: "GET",
     			url : URL,
     			data : {
     				searchName : Supplier
     			},
     			beforeSend: function(xhr){                    
	   	   			$("#loading").css("display","block");
	   	   			$("#mainDiv").addClass("disabled");
	   	   		  },
     			success : function(result) {
     				
     				$("#loading").css("display","none");
     				$("#mainDiv").removeClass('disabled');
     				appendSuppierstate(result,Supplier);
     			},
     			error : function() {
     				 alert("something went wrong");
     				$("#loading").css("display","none");
   				$("#mainDiv").removeClass('disabled');
     			}
     		});
	 }
	
	 
	 function appendSuppierstate(locList,Supplier){
			debugger;
			var SupplierState="";
			 for(var i=0;i<locList.length;i++){
				 if(locList[i].firmName == Supplier){
					 SupplierState = locList[i].state;
				 }
			 }
		
			 $("#supplier_state").val(SupplierState);
		}
		
		
		
		
		
			 productFiles = [];
	 function addFileToArrayGRN(id){
	 	debugger;
	 	   var ext = $("#"+id)[0].files[0]['name'].split('.').pop().toLowerCase();
	 	    
	 	    	productFiles=event.target.files;
	 	   
	 	   
	 }

	 function addNameToTextBoxGRN(id){
	 	debugger
	 	addFileToArrayGRN(id);
	 	if($("#"+id)[0].files[0] != undefined){
	 		$("#skuMasterFile").val($("#"+id)[0].files[0]['name']);
	 	
	 
	 	}
	 	
	 	else
	 		$("#"+id+"File").val("");
	 }


	 function importExcelDataForGRN(file,type){
	 	debugger;
	 	var oMyForm = new FormData();
	 	$('#ErrorExcel').html("");
	$("#AttachmentSuccess").html("");
	 $("#loglink").css("display","none");
	 	
	 	var supplierCode = $('#supplier_Id').val();
	  	if(supplierCode == "" || supplierCode == undefined || supplierCode == null){
	  		alert("Please Select Supplier...");
	 		  	return;
	  	} 
	  	
        if(productFiles.length <= 0)
	 	{
	 	alert("Please Select Excel Sheet... ");
	 		return;
	 	}
	 	
	 	if( $("#fileUploadCSV").val().toLowerCase().indexOf('.xlsx') == -1){
			$("#Error").html('Not a XLSX File');
			return;
		}
	  	warehouseLocation = $("#warehouse_location option:selected").text();
	  	if($("#warehouse_location option:selected").text() == "" || $("#warehouse_location option:selected").text() == undefined){
	 		  $("#warehouse_locationError").html("warehouse location required");
	 		  $("#warehouse_location").focus();
	 		  return;
	 	  }
	  	
	  	
	  	oMyForm.append("flowunder", $("#flowUnder").val());
        oMyForm.append("supplierCode", $("#supplier_Id").val());
	  	oMyForm.append("warehouseLocation", $("#warehouse_location option:selected").text());
	  	
	     oMyForm.append("file", productFiles[0]);
	     var contextPath = $("#contextPath").val();

          if($("#flowUnder").val() == "warehouse"){
	 	 URL = contextPath + "/procurement/importExcelDataGRN.do";
          }else{
	     URL = contextPath + "/procurement/importExcelDataGRNOutlet.do";
           }
	 	 $.ajax({
	 		  dataType : 'json',
	           url : URL,
	           data : oMyForm,
	           type : "POST",
	           enctype: 'multipart/form-data',
	           processData: false, 
	           contentType:false,
	           beforeSend: function(xhr){
	         	  debugger;
	         	  $("#loading").css("display","block");
	   			$("#mainDiv").addClass("disabled");
	   	   	},
	           success : function(skuList) {
	         	  debugger;
	         	
	         	if(skuList != null  && skuList.length> 0 && skuList[0].bill_num != ""){
	         	var invoiceNum = skuList[0].bill_num
	         	$("#invoiceRefNumber").val(invoiceNum);
	         	}

                if(skuList.length>0){
			
	         	  
	         	 if(skuList[0].responseHeader.responseCode == 0){
	         		 
	         		for (var i = 0; i <skuList.length; i++){
	         			addSkuforGRN(skuList[i]);
		         		 }

			
	         	 } else if(skuList[0].responseHeader.responseCode == 1 && skuList[0].skuId != null){
	         			for(var j = 0; j<skuList.length; j++){
	         				addSkuforGRN(skuList[j]);
		         			
	        			 }


	         			$('#ErrorExcel').html(skuList[0].responseHeader.responseMessage);
	         			$('#urlfordoc').val(skuList[0].url)
	         			$("#loglink").css("display","block");
	         			
	         		} else {
	         			$('#Error').html(skuList[0].responseHeader.responseMessage); 
	         			$('#urlfordoc').val(skuList[0].url);
	         			$("#loglink").css("display","block");
	         		}
	         	 
	         	}else{
				$('#ErrorExcel').html("No SKU matches found.");
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



//modified by MK
	 function addSkuforGRN(sku){
		debugger;
		 var contextPath = $("#contextPath").val();
		 var len = parseInt($("#productsList tr").length);
			if (len != 1)
				len = parseInt($("#productsList tr:last").attr("id").replace('dynamicdiv', '')) + 1;
			
			
			debugger;
			
			 if(sku.trackingRequired == false){
			for (var i = 1; i < len; i++) {
				
				var plucode = $("#pluCode" + i).val();
				plucode = plucode.replace('PBN', '');
				if ($("#skuId" + i).val() == sku.skuId &&  plucode == sku.pluCode && sku.trackingRequired == false) {
					var pack =  parseInt($("#Pack"+i).text())+sku.quantity;
					//var requested=parseInt($("#Requested"+i).text())+1;
	  			 $("#Pack"+i).text(pack);
	  			 $("#Supplied"+i).text(pack);
	  			 $("#Received"+i).text(pack);
			   $("#Requested"+i).text(0);
				 $("#Rejected"+i).text(0);
	  			 var cost =  parseFloat($("#Price"+i).text());
	  			
	  			 $("#Cost"+i).text(pack*cost);
	  			 changeTotalCost();
	  			 changeTotalQuantity();
	      		 return;
				}
			}
			}
			 
			 var skuId = sku.skuId;
				if(skuId == null || skuId == undefined)
					sku.skuId = "";
				
				
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
			
			/*var batchNum = sku.productBatchNo;
			if(batchNum == null)*/
				sku.productBatchNo = "";
			
			var color = sku.color;
			if(color == null)
				sku.color = "";
			var size = sku.size;
			if(size == null)
				sku.size = "";
			var ean = sku.ean;
			if(ean == null)
				sku.ean = "";
			var make = sku.uom;
			if(make == "" || make == null)
				make = "_";
			
			
			var hsnCode = sku.hsnCode;
			if(hsnCode == null)
				sku.hsnCode = "";
			
			var discountAmt = sku.discountAmt;
    			if(discountAmt == null || discountAmt == undefined)
    				sku.discountAmt = 0;
    			var discountPerc = sku.discountPercentage;
    			if(discountPerc == null || discountPerc == undefined)
    				sku.discountPercentage = 0;
			
			var scanCode = sku.itemScanCode;
			if(scanCode == null)
				sku.itemScanCode = "";
			
		
			if(sku.trackingRequired == "" || sku.trackingRequired == null)
				sku.trackingRequired = false;
			
		  
			 if($("#flowUnder").val() == "warehouse"){
			var tax = sku.warehouseSkuPriceLists[0].tax;
			var taxamount = 0.0;
			
			var warehouseskudata = sku.warehouseSkuPriceLists;
			
			sku.costPrice = warehouseskudata[0].costPrice;
			sku.mrp = warehouseskudata[0].price;
			
			sku.productBatchNo = warehouseskudata[0].productBatchNo;
            sku.expiryDateStr = warehouseskudata[0].expiryDateStr;
             sku.salePrice = warehouseskudata[0].salePrice;
              }else{
	         var tax = sku.skuPriceLists[0].tax;
			var taxamount = 0.0;
			
			var warehouseskudata = sku.skuPriceLists;
			
			sku.costPrice = warehouseskudata[0].costPrice;
			sku.mrp = warehouseskudata[0].price;
			
			sku.productBatchNo = warehouseskudata[0].productBatchNo;
            sku.expiryDateStr = warehouseskudata[0].expiryDateStr;
            sku.salePrice = warehouseskudata[0].salePrice;
                }
                        
                        var batchNum = sku.productBatchNo;
                        if(batchNum == null || batchNum == undefined)
                                sku.productBatchNo = "";
                        
                        var expiryDate = sku.expiryDateStr;
                        if(expiryDate == null || expiryDate == undefined)
                                sku.expiryDateStr = "";

			
			
			if(sku.trackingRequired == "" || sku.trackingRequired == null)
				sku.trackingRequired = false;
			
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
			
			
			
			var locationstate = $("#location_state").val();
			var suppierstate = $("#supplier_state").val();
			
			
			 if(locationstate.toUpperCase() !=  suppierstate.toUpperCase()){
				sgstTaxRate= 0.0;
 				cgstTaxRate= 0.0;
 				taxRate= 0.0;
			 }else{
				 igstRate = 0.0;
			 }
			
			
			 var  taxamount=0.0;
			if(tax!=null)
				if(tax.length>0){
						taxamount = parseFloat(((sku.costPrice)*taxRate)/100).toFixed(2);
				}
			
			
			
		
			var slNo = 1; 
   			 $('.slno').each(function(){
   				$(this).text(slNo);
   				slNo = parseInt(slNo) + 1;
   			});
   			if($("#flowUnder").val()=='warehouse' || $("#flowUnder").val()=='procurement'){
   			 if(sku.trackingRequired == false){
   				 
   				if(sku.costpriceEditable == true){
   					var row = "<tr id='dynamicdiv"+len+"' style='margin-top:5px;'><td class='slno sticky-col first-col' style='background: #f9f9f9;' >"+slNo+"</td><td class='sticky-col second-col' style='background: #f9f9f9; id='Name"+len+"'>"+sku.skuId+"</td>" +
	   				"<td class='sticky-col third-col' style='background: #f9f9f9;' id='ean"+len+"'>"+sku.ean+"</td>" +
	   				"<td class='sticky-col fourth-col' style='background: #f9f9f9;' id='hsnCode"+len+"' contenteditable='true'>"+sku.hsnCode+"</td>" +
	   				"<td class='sticky-col fifth-col' style='background: #f9f9f9;' id='itemScanCode"+len+"' class='itemScanCode'  contenteditable='true'>"+sku.itemScanCode+"</td>" +
	   				"<input type='hidden' id='trackingRequired"+len+"' name ='trackingRequired' class='trackingRequired' value='"+sku.trackingRequired+"'/>"+
	   				"<input type='hidden' id='batchRequired"+len+"' name ='batchRequired' class='batchRequired' value='"+sku.batchRequired+"'/>"+
	   				"<input type='hidden' id='skuId"+len+"' value='"+sku.skuId+"'/>" +
	    			"<input type='hidden' id='pluCode"+len+"' value='"+sku.pluCode+"'/>" +
	    			"<input type='hidden' id='category"+len+"' value='"+sku.category+"'/>" +
	    			"<input type='hidden' id='brandCode"+len+"' value='"+sku.brandCode+"'/>" +
	    			"<input type='hidden' id='productRange"+len+"' value='"+sku.productRange+"'/>" +
	    			"<input type='hidden' id='measureRange"+len+"' value='"+sku.measureRange+"'/>" +
	    			"<input type='hidden' id='utility"+len+"' value='"+sku.utility+"'/>" +
	    			"<input type='hidden' id='itemTaxExclusive"+len+"' value='"+sku.itemTaxExclusive+"'/>" +
	    			"<input type='hidden' id='color"+len+"' value='"+sku.color+"'/>" +
	    			"<input type='hidden' id='size"+len+"' value='"+sku.size+"'/>" +
	    			"<input type='hidden' id='cgstTaxRate"+len+"' value='"+parseFloat(cgstTaxRate).toFixed(2)+"'/>" +
	    			"<input type='hidden' id='cessTaxRate"+len+"' value='"+parseFloat(cessRate).toFixed(2)+"'/>" +
	    			"<input type='hidden' id='igsttaxRate"+len+"' value='"+parseFloat(igstRate).toFixed(2)+"'/>" +
	    			"<input type='hidden' id='taxationlist"+len+"' value='"+JSON.stringify(sku.tax)+"'/>" +
                    "<input type='hidden' id='priceDuplicate"+len+"' value='"+sku.costPrice+"'/>" +
                    "<input type='hidden' id='pricereal"+len+"' value='"+sku.costPrice+"'/>" +
                    "<input type='hidden' id='pricerealedit"+len+"' value=''/>" +
                    "<input type='hidden' id='saleprice"+len+"' value='"+sku.salePrice+"'/>" +

                     
	    			"<td class='sticky-col sixth-col' style='background: #f9f9f9;' id='Desc"+len+"' style='width:30%'>"+description+"</td>"+
	    			"<td><textarea id='batchNum"+len+"' rows=1 style='resize:none;width: 87px;'>"+sku.productBatchNo+"</textarea></td>"+
	    			"<td><input class='form-control calendar_icon endDate'readonly='readonly' style='width:100px;background-color: white;' id='expiryDate"+len+"' type='text' onfocus=callCalender('expiryDate"+len+"') onclick=callCalender('expiryDate"+len+"') placeholder='DD/MM/YYYY' value='"+sku.expiryDateStr+"' /></td>" +
	    	 		"<td id='Pack"+len+"' class='Pack' onBlur='changePack(this);' onkeypress='PreventEnter(this);' contenteditable='true'>"+sku.quantity+"</td>" +

	    			"<td >"+sku.measureRange+"</td>" +
	    			"<td id='Make"+len+"'>"+make+"</td>" +
	    			"<td><input type='text' id='mrp"+len+"'  style='width:70px;text-align:center' value='"+sku.mrp+"'></td>"+
	    			"<td id='Requested"+len+"' class='Requested' >0</td>" +
	    			"<td class='Price' id='SPrice"+len+"'>0</td>" +
	    			
                     "<td><input id='discountpercentage"+len+"' class='discountpercentage' onBlur='changeDiscPerc(this);changeTotalCost();changeTotalQuantity();' onkeypress='PreventEnter(this);' type='number' style='width:70px;text-align:center' value='"+sku.discountPercentage+"'></td>"+
	    			"<td><input id='discountAmt"+len+"' class='discountAmt' onBlur='changeDiscAmt(this);changeTotalCost();changeTotalQuantity();' onkeypress='PreventEnter(this);' type='number' style='width:70px;text-align:center' value='"+sku.discountAmt+"'></td>"+
                 	"<td><input id='freeqty"+len+"' class='freeqty' onBlur='changePack(this);' onkeypress='PreventEnter(this);' type='number' style='width:70px;text-align:center' value='"+sku.freeQty+"'></td>"+
 			
                    "<td  id='tax"+len+"' onBlur='changeGrnTax(this);' contenteditable='true'>"+parseFloat((taxRate*2)+igstRate).toFixed(2)+"</td>" +
	    			"<td  id='cgsttax"+len+"'>"+parseFloat(cgstTaxRate).toFixed(2)+"</td>" +
	    	 		"<td  id='sgsttax"+len+"'>"+parseFloat(sgstTaxRate).toFixed(2)+"</td>" +
	    	 		"<td id='igsttax"+len+"'>"+parseFloat(igstRate).toFixed(2)+"</td>"+
	    	 		"<td id='cess"+len+"'>"+parseFloat(cessRate).toFixed(2)+"</td>"+
	    			"<td class='Price' id='Price"+len+"' onBlur='changeSupplyPrice(this);' onkeypress='changeSupplyPriceonchange(this);PreventEnter(this);'    type='number' contenteditable='true'>"+sku.costPrice+"</td>" +
	    		

                 
	                "<td id='Cost"+len+"'>"+sku.costPrice+"</td>" +
	    			"<td><select  style='width:180px' class='storageRef"+len+"'  id='storageRef"+len+"'></select> </td>"+
	    			"<td><select  style='width:180px' class='handledBy"+len+"'  id='handledBy"+len+"'></select> </td>"+
	    			"<td id='Del"+len+"'>" +
	    			"<img id='Img"+len+"' src='"+contextPath+"/images/itemdelete.png' style='width:32%;cursor:pointer;' onclick='deleteItem(this);' title='Delete "+sku.skuId+"'/>"+
                     "<img id='Img"+len+"' src='"+contextPath+"/images/bulewhiteplusicon.png' style='width:30%;cursor:pointer;margin-left: 10px;' onclick='addSkuwithplus("+slNo+");' title='Additem "+sku.skuId+"'/></td></tr>";
   					$("#productsList tbody").append(row);
   					appendStorageSystemID(sku,"storageRef"+len);
	    			callCalender("expiryDate"+len);
	    			
	    			$("#Pack"+len).focus();
					$("#dynamicdiv"+(len-1)).css("background","none");
					/*$("#dynamicdiv"+len).css("background","lightgreen", "important");*/
   				}
   				else{
   					var row = "<tr id='dynamicdiv"+len+"' style='margin-top:5px;'><td class='slno sticky-col first-col' style='background: #f9f9f9;' >"+slNo+"</td><td class='sticky-col second-col' style='background: #f9f9f9; id='Name"+len+"'>"+sku.skuId+"</td>" +
	   				"<td class='sticky-col third-col' style='background: #f9f9f9;' id='ean"+len+"'>"+sku.ean+"</td>" +
	   				"<td class='sticky-col fourth-col' style='background: #f9f9f9;' id='hsnCode"+len+"' contenteditable='true'>"+sku.hsnCode+"</td>" +
	   				"<td class='sticky-col fifth-col' style='background: #f9f9f9;' id='itemScanCode"+len+"' class='itemScanCode'  contenteditable='true'>"+sku.itemScanCode+"</td>" +
	   				"<input type='hidden' id='trackingRequired"+len+"' name ='trackingRequired' class='trackingRequired' value='"+sku.trackingRequired+"'/>"+
	   				"<input type='hidden' id='batchRequired"+len+"' name ='batchRequired' class='batchRequired' value='"+sku.batchRequired+"'/>"+
	   				"<input type='hidden' id='skuId"+len+"' value='"+sku.skuId+"'/>" +
	    			"<input type='hidden' id='pluCode"+len+"' value='"+sku.pluCode+"'/>" +
	    			"<input type='hidden' id='category"+len+"' value='"+sku.category+"'/>" +
	    			"<input type='hidden' id='brandCode"+len+"' value='"+sku.brandCode+"'/>" +
	    			"<input type='hidden' id='productRange"+len+"' value='"+sku.productRange+"'/>" +
	    			"<input type='hidden' id='measureRange"+len+"' value='"+sku.measureRange+"'/>" +
	    			"<input type='hidden' id='utility"+len+"' value='"+sku.utility+"'/>" +
	    			"<input type='hidden' id='itemTaxExclusive"+len+"' value='"+sku.itemTaxExclusive+"'/>" +
	    			"<input type='hidden' id='color"+len+"' value='"+sku.color+"'/>" +
	    			"<input type='hidden' id='size"+len+"' value='"+sku.size+"'/>" +
	    			"<input type='hidden' id='cgstTaxRate"+len+"' value='"+parseFloat(cgstTaxRate).toFixed(2)+"'/>" +
	    			"<input type='hidden' id='cessTaxRate"+len+"' value='"+parseFloat(cessRate).toFixed(2)+"'/>" +
	    			"<input type='hidden' id='igsttaxRate"+len+"' value='"+parseFloat(igstRate).toFixed(2)+"'/>" +
	    			"<input type='hidden' id='taxationlist"+len+"' value='"+JSON.stringify(sku.tax)+"'/>" +
                    "<input type='hidden' id='priceDuplicate"+len+"' value='"+sku.costPrice+"'/>" +
                    " <input type='hidden' id='pricereal"+len+"' value='"+sku.costPrice+"'/>" +
                    "<input type='hidden' id='saleprice"+len+"' value='"+sku.salePrice+"'/>" +
	    			
					"<td id='Desc"+len+"' style='width:300px!important;text-align: left;background-color: #f9f9f9 !important;' class='sticky-col sixth-col'><div id='overflowtext'><a href='#' data-toggle='tooltip'  title='"+description+"'>"+description+"</a></div></td>"+

//	    			"<td class='sticky-col sixth-col' style='background: #f9f9f9;' id='Desc"+len+"' style='width:30%'>"+description+"</td>"+
	    			"<td><textarea id='batchNum"+len+"' rows=1 style='resize:none;width: 87px;'>"+sku.productBatchNo+"</textarea></td>"+
	    			"<td><input class='form-control calendar_icon endDate'readonly='readonly' style='width:100px;background-color: white;' id='expiryDate"+len+"' type='text' onfocus=callCalender('expiryDate"+len+"') onclick=callCalender('expiryDate"+len+"') placeholder='DD/MM/YYYY' value='"+sku.expiryDateStr+"' /></td>" +
	    	 		"<td id='Pack"+len+"' class='Pack' onBlur='changePack(this);' onkeypress='PreventEnter(this);' contenteditable='true'>"+sku.quantity+"</td>" +

	    			"<td >"+sku.measureRange+"</td>" +
	    			"<td id='Make"+len+"'>"+make+"</td>" +
	    			"<td><input type='text' id='mrp"+len+"'  style='width:70px;text-align:center' disabled='disabled' value='"+sku.mrp+"'></td>"+
	    			"<td id='Requested"+len+"' class='Requested' >0</td>" +
	    			"<td class='Price' id='SPrice"+len+"'>0</td>" +
                     "<td><input id='discountpercentage"+len+"' class='discountpercentage' onBlur='changeDiscPerc(this);changeTotalCost();changeTotalQuantity();' onkeypress='PreventEnter(this);' type='number' style='width:70px;text-align:center' value='"+sku.discountPercentage+"'></td>"+
	    			"<td><input id='discountAmt"+len+"' class='discountAmt' onBlur='changeDiscAmt(this);changeTotalCost();changeTotalQuantity();' onkeypress='PreventEnter(this);' type='number' style='width:70px;text-align:center' value='"+sku.discountAmt+"'></td>"+
                 	"<td><input id='freeqty"+len+"' class='freeqty' onBlur='changePack(this);' onkeypress='PreventEnter(this);' type='number' style='width:70px;text-align:center' value='"+sku.freeQty+"'></td>"+
  				    			

"<td  id='tax"+len+"' onBlur='changeGrnTax(this);' contenteditable='true'>"+parseFloat((taxRate*2)+igstRate).toFixed(2)+"</td>" +
	    			"<td  id='cgsttax"+len+"'>"+parseFloat(cgstTaxRate).toFixed(2)+"</td>" +
	    	 		"<td  id='sgsttax"+len+"'>"+parseFloat(sgstTaxRate).toFixed(2)+"</td>" +
	    	 		"<td id='igsttax"+len+"'>"+parseFloat(igstRate).toFixed(2)+"</td>"+
	    	 		"<td id='cess"+len+"'>"+parseFloat(cessRate).toFixed(2)+"</td>"+
	    			"<td class='Price' id='Price"+len+"' onBlur='changeSupplyPrice(this);' onkeypress='changeSupplyPriceonchange(this);PreventEnter(this);'    type='number' contenteditable='true'>"+sku.costPrice+"</td>" +
	    			

                
"<td id='Cost"+len+"'>"+sku.costPrice+"</td>" +
	    			"<td><select  style='width:180px' class='storageRef"+len+"'  id='storageRef"+len+"'></select> </td>"+
	    			"<td><select  style='width:180px' class='handledBy"+len+"'  id='handledBy"+len+"'></select> </td>"+
	    			"<td id='Del"+len+"'>" +
	    			"<img id='Img"+len+"' src='"+contextPath+"/images/itemdelete.png' style='width:32%;cursor:pointer;' onclick='deleteItem(this);' title='Delete "+sku.skuId+"'/>"+
                     "<img id='Img"+len+"' src='"+contextPath+"/images/bulewhiteplusicon.png' style='width:30%;cursor:pointer;margin-left: 10px;' onclick='addSkuwithplus("+slNo+");' title='Additem "+sku.skuId+"'/></td></tr>";
   					
   					$("#productsList tbody").append(row);
   					appendStorageSystemID(sku,"storageRef"+len);
	    			callCalender("expiryDate"+len);
	    			$("#Pack"+len).focus();
					$("#dynamicdiv"+(len-1)).css("background","none");
					/*$("#dynamicdiv"+len).css("background","lightgreen", "important");*/
   				}
   				
   			 }
   			 else
   				 {
   				if(sku.costpriceEditable == true){
   					var row = "<tr id='dynamicdiv"+len+"' style='margin-top:5px;'><td class='slno sticky-col first-col' style='background: #f9f9f9;'>"+slNo+"</td><td  class='sticky-col second-col' style='background: #f9f9f9; id='Name"+len+"'>"+sku.skuId+"</td>" +
	   				"<td class='sticky-col third-col' style='background: #f9f9f9; id='ean"+len+"'>"+sku.ean+"</td>" +
	   				"<td class='sticky-col fourth-col' style='background: #f9f9f9;' id='hsnCode"+len+"' contenteditable='true'>"+sku.hsnCode+"</td>" +
	   				"<td class='sticky-col fifth-col' style='background: #f9f9f9;' id='itemScanCode"+len+"'   class='itemScanCode'  contenteditable='true'>"+sku.itemScanCode+"</td>" +
	   				"<input type='hidden' id='trackingRequired"+len+"' class='trackingRequired' value='"+sku.trackingRequired+"'/>"+
	   				"<input type='hidden' id='batchRequired"+len+"' name ='batchRequired' class='batchRequired' value='"+sku.batchRequired+"'/>"+
	   				"<input type='hidden' id='skuId"+len+"' value='"+sku.skuId+"'/>" +
	    			"<input type='hidden' id='pluCode"+len+"' value='"+sku.pluCode+"'/>" +
	    			"<input type='hidden' id='category"+len+"' value='"+sku.category+"'/>" +
	    			"<input type='hidden' id='brandCode"+len+"' value='"+sku.brandCode+"'/>" +
	    			"<input type='hidden' id='productRange"+len+"' value='"+sku.productRange+"'/>" +
	    			"<input type='hidden' id='measureRange"+len+"' value='"+sku.measureRange+"'/>" +
	    			"<input type='hidden' id='utility"+len+"' value='"+sku.utility+"'/>" +
	    			"<input type='hidden' id='itemTaxExclusive"+len+"' value='"+sku.itemTaxExclusive+"'/>" +

	    			"<input type='hidden' id='color"+len+"' value='"+sku.color+"'/>" +
	    			"<input type='hidden' id='size"+len+"' value='"+sku.size+"'/>" +
	    			"<input type='hidden' id='cgstTaxRate"+len+"' value='"+parseFloat(cgstTaxRate).toFixed(2)+"'/>" +
	    			"<input type='hidden' id='cessTaxRate"+len+"' value='"+parseFloat(cessRate).toFixed(2)+"'/>" +
	    			"<input type='hidden' id='igsttaxRate"+len+"' value='"+parseFloat(igstRate).toFixed(2)+"'/>" +
	    			"<input type='hidden' id='taxationlist"+len+"' value='"+JSON.stringify(sku.tax)+"'/>" +
                    "<input type='hidden' id='priceDuplicate"+len+"' value='"+sku.costPrice+"'/>" +
                    "<input type='hidden' id='pricereal"+len+"' value='"+sku.costPrice+"'/>" +
                    "<input type='hidden' id='pricerealedit"+len+"' value=''/>" +
                     "<input type='hidden' id='saleprice"+len+"' value='"+sku.salePrice+"'/>" +
                  
	    			"<td class='sticky-col sixth-col' style='background: #f9f9f9;' id='Desc"+len+"' style='width:30%'>"+description+"</td>"+
	    			"<td><textarea id='batchNum"+len+"' rows=1 style='resize:none;width: 87px;'>"+sku.productBatchNo+"</textarea></td>"
	    			"<td><input class='form-control calendar_icon endDate'  readonly='readonly' style='width:100px;background-color: white;' id='expiryDate"+len+"' type='text' onfocus=callCalender('expiryDate"+len+"') onclick=callCalender('expiryDate"+len+"') placeholder='DD/MM/YYYY' value='"+sku.expiryDateStr+"' /></td>" +
+	    	 		"<td id='Pack"+len+"' class='Pack' onBlur='changePack(this);' onkeypress='PreventEnter(this);' type='number' contenteditable='true'>"+sku.quantity+"</td>" +

	    			"<td >"+sku.measureRange+"</td>" +
	    			"<td id='Make"+len+"'>"+make+"</td>" +
	    			"<td><input type='text'id='mrp"+len+"'  style='width:70px;text-align:center' value='"+sku.mrp+"'></td>"+
	    			"<td id='Requested"+len+"' class='Requested' >0</td>" +
	    			"<td class='Price' id='SPrice"+len+"'>0</td>" +
                   "<td><input id='discountpercentage"+len+"' class='discountpercentage' onBlur='changeDiscPerc(this);changeTotalCost();changeTotalQuantity();' onkeypress='PreventEnter(this);' type='number' style='width:70px;text-align:center' value='"+sku.discountPercentage+"'></td>"+
	    			"<td><input id='discountAmt"+len+"' class='discountAmt' onBlur='changeDiscAmt(this);changeTotalCost();changeTotalQuantity();' onkeypress='PreventEnter(this);' type='number' style='width:70px;text-align:center' value='"+sku.discountAmt+"'></td>"+
                 	"<td><input id='freeqty"+len+"' class='freeqty' onBlur='changePack(this);' onkeypress='PreventEnter(this);' type='number' style='width:70px;text-align:center' value='"+sku.freeQty+"'></td>"+

                    "<td  id='tax"+len+"' onBlur='changeGrnTax(this);' contenteditable='true'>"+parseFloat((taxRate*2)+igstRate).toFixed(2)+"</td>" +
	    			"<td  id='cgsttax"+len+"'>"+parseFloat(cgstTaxRate).toFixed(2)+"</td>" +
	    	 		"<td  id='sgsttax"+len+"'>"+parseFloat(sgstTaxRate).toFixed(2)+"</td>" +
	    	 		"<td id='igsttax"+len+"'>"+parseFloat(igstRate).toFixed(2)+"</td>"+
	    	 		"<td id='cess"+len+"'>"+parseFloat(cessRate).toFixed(2)+"</td>"+
	    			"<td class='Price' id='Price"+len+"' onBlur='changeSupplyPrice(this);' onkeypress='changeSupplyPriceonchange(this);PreventEnter(this);'    type='number' contenteditable='true'>"+sku.costPrice+"</td>" +

                   	    			
                   "<td id='Cost"+len+"'>"+sku.costPrice+"</td>" +
	    			
	    			"<td><select  style='width:180px' class='handledBy"+len+"'  id='handledBy"+len+"'></select> </td>"+
	    			"<td id='Del"+len+"'>" +
	    			"<img id='Img"+len+"' src='"+contextPath+"/images/itemdelete.png' style='width:12%;cursor:pointer;' onclick='deleteItem(this);' title='Delete "+sku.skuId+"'/>"+
                     "<img id='Img"+len+"' src='"+contextPath+"/images/bulewhiteplusicon.png' style='width:30%;cursor:pointer;margin-left: 10px;' onclick='addSkuwithplus("+slNo+");' title='Additem "+sku.skuId+"'/></td></tr>";
	    			$("#productsList tbody").append(row);
	    			callCalender("expiryDate"+len);
   				}
   				else
   				{
   					var row = "<tr id='dynamicdiv"+len+"' style='margin-top:5px;'><td class='slno sticky-col first-col' style='background: #f9f9f9;'>"+slNo+"</td><td  class='sticky-col second-col' style='background: #f9f9f9; id='Name"+len+"'>"+sku.skuId+"</td>" +
	   				"<td class='sticky-col third-col' style='background: #f9f9f9; id='ean"+len+"'>"+sku.ean+"</td>" +
	   				"<td class='sticky-col fourth-col' style='background: #f9f9f9;' id='hsnCode"+len+"' contenteditable='true'>"+sku.hsnCode+"</td>" +
	   				"<td class='sticky-col fifth-col' style='background: #f9f9f9;' id='itemScanCode"+len+"'   class='itemScanCode'  contenteditable='true'>"+sku.itemScanCode+"</td>" +
	   				"<input type='hidden' id='trackingRequired"+len+"' class='trackingRequired' value='"+sku.trackingRequired+"'/>"+
	   				"<input type='hidden' id='batchRequired"+len+"' name ='batchRequired' class='batchRequired' value='"+sku.batchRequired+"'/>"+
	   				"<input type='hidden' id='skuId"+len+"' value='"+sku.skuId+"'/>" +
	    			"<input type='hidden' id='pluCode"+len+"' value='"+sku.pluCode+"'/>" +
	    			"<input type='hidden' id='category"+len+"' value='"+sku.category+"'/>" +
	    			"<input type='hidden' id='brandCode"+len+"' value='"+sku.brandCode+"'/>" +
	    			"<input type='hidden' id='productRange"+len+"' value='"+sku.productRange+"'/>" +
	    			"<input type='hidden' id='measureRange"+len+"' value='"+sku.measureRange+"'/>" +
	    			"<input type='hidden' id='utility"+len+"' value='"+sku.utility+"'/>" +
	    			"<input type='hidden' id='itemTaxExclusive"+len+"' value='"+sku.itemTaxExclusive+"'/>" +

	    			"<input type='hidden' id='color"+len+"' value='"+sku.color+"'/>" +
	    			"<input type='hidden' id='size"+len+"' value='"+sku.size+"'/>" +
	    			"<input type='hidden' id='cgstTaxRate"+len+"' value='"+parseFloat(cgstTaxRate).toFixed(2)+"'/>" +
	    			"<input type='hidden' id='cessTaxRate"+len+"' value='"+parseFloat(cessRate).toFixed(2)+"'/>" +
	    			"<input type='hidden' id='igsttaxRate"+len+"' value='"+parseFloat(igstRate).toFixed(2)+"'/>" +
	    			"<input type='hidden' id='taxationlist"+len+"' value='"+JSON.stringify(sku.tax)+"'/>" +
                     "<input type='hidden' id='priceDuplicate"+len+"' value='"+sku.costPrice+"'/>" +
                     "<input type='hidden' id='pricereal"+len+"' value='"+sku.costPrice+"'/>" +
                     "<input type='hidden' id='pricerealedit"+len+"' value=''/>" +
                      "<input type='hidden' id='saleprice"+len+"' value='"+sku.salePrice+"'/>" +
                 
	    			"<td class='sticky-col sixth-col' style='background: #f9f9f9;' id='Desc"+len+"' style='width:30%'>"+description+"</td>"+
	    			"<td><textarea id='batchNum"+len+"' rows=1 style='resize:none;width: 87px;'>"+sku.productBatchNo+"</textarea></td>"+
	    			"<td><input class='form-control calendar_icon endDate'  readonly='readonly' style='width:100px;background-color: white;' id='expiryDate"+len+"' type='text' onfocus=callCalender('expiryDate"+len+"') onclick=callCalender('expiryDate"+len+"') placeholder='DD/MM/YYYY' value='"+sku.expiryDateStr+"' /></td>" +
	    			"<td id='Pack"+len+"' class='Pack' onBlur='changePack(this);' onkeypress='PreventEnter(this);' type='number' contenteditable='true'>"+sku.quantity+"</td>" +

                    "<td >"+sku.measureRange+"</td>" +
	    			"<td id='Make"+len+"'>"+make+"</td>" +
	    			"<td><input type='text'id='mrp"+len+"'  style='width:70px;text-align:center' disabled='disabled' value='"+sku.mrp+"'></td>"+
	    			"<td id='Requested"+len+"' class='Requested' >0</td>" +
	    			"<td class='Price' id='SPrice"+len+"'>0</td>" +
	    			"<td><input id='discountpercentage"+len+"' class='discountpercentage' onBlur='changeDiscPerc(this);changeTotalCost();changeTotalQuantity();' onkeypress='PreventEnter(this);' type='number' style='width:70px;text-align:center' value='"+sku.discountPercentage+"'></td>"+
	    			"<td><input id='discountAmt"+len+"' class='discountAmt' onBlur='changeDiscAmt(this);changeTotalCost();changeTotalQuantity();' onkeypress='PreventEnter(this);' type='number' style='width:70px;text-align:center' value='"+sku.discountAmt+"'></td>"+
                 	"<td><input id='freeqty"+len+"' class='freeqty' onBlur='changePack(this);' onkeypress='PreventEnter(this);' type='number' style='width:70px;text-align:center' value='"+sku.freeQty+"'></td>"+


                    "<td  id='tax"+len+"' onBlur='changeGrnTax(this);' contenteditable='true'>"+parseFloat((taxRate*2)+igstRate).toFixed(2)+"</td>" +
	    			"<td  id='cgsttax"+len+"'>"+parseFloat(cgstTaxRate).toFixed(2)+"</td>" +
	    	 		"<td  id='sgsttax"+len+"'>"+parseFloat(sgstTaxRate).toFixed(2)+"</td>" +
	    	 		"<td id='igsttax"+len+"'>"+parseFloat(igstRate).toFixed(2)+"</td>"+
	    	 		"<td id='cess"+len+"'>"+parseFloat(cessRate).toFixed(2)+"</td>"+
	    			"<td class='Price' id='Price"+len+"' onBlur='changeSupplyPrice(this);' onkeypress='changeSupplyPriceonchange(this);PreventEnter(this);'    type='number' contenteditable='true'>"+sku.costPrice+"</td>" +
	    		
                     "<td id='Cost"+len+"'>"+sku.costPrice+"</td>" +
	    	      	"<td><select  style='width:180px' class='storageRef"+len+"'  id='storageRef"+len+"'></select> </td>"+
	    			"<td><select  style='width:180px' class='handledBy"+len+"'  id='handledBy"+len+"'></select> </td>"+
	    			"<td id='Del"+len+"'>" +
	    			"<img id='Img"+len+"' src='"+contextPath+"/images/itemdelete.png' style='width:32%;cursor:pointer;' onclick='deleteItem(this);' title='Delete "+sku.skuId+"'/>"+
                     "<img id='Img"+len+"' src='"+contextPath+"/images/bulewhiteplusicon.png' style='width:30%;cursor:pointer;margin-left: 10px;' onclick='addSkuwithplus("+slNo+");' title='Additem "+sku.skuId+"'/></td></tr>";
   					
   					$("#productsList tbody").append(row);
   					appendStorageSystemID(sku,"storageRef"+len);
	    			callCalender("expiryDate"+len);
	    			$("#Pack"+len).focus();
					$("#dynamicdiv"+(len-1)).css("background","none");
					/*$("#dynamicdiv"+len).css("background","lightgreen", "important");*/
   				}
   				
   				 
   				 }
   			 
   			}else{
   				var row = "<tr id='dynamicdiv"+len+"' style='margin-top:5px;'><td class='slno'>"+slNo+"</td><td id='Name"+len+"'>"+sku.skuId+"</td>" +
    			"<input type='hidden' id='skuId"+len+"' value='"+sku.skuId+"'/>" +
    			"<input type='hidden' id='pluCode"+len+"' value='"+sku.pluCode+"'/>" +
    			"<input type='hidden' id='category"+len+"' value='"+sku.category+"'/>" +
    			"<input type='hidden' id='brandCode"+len+"' value='"+sku.brandCode+"'/>" +
    			"<input type='hidden' id='productRange"+len+"' value='"+sku.productRange+"'/>" +
    			"<input type='hidden' id='measureRange"+len+"' value='"+sku.measureRange+"'/>" +
    			"<input type='hidden' id='utility"+len+"' value='"+sku.utility+"'/>" +
    			"<input type='hidden' id='itemTaxExclusive"+len+"' value='"+sku.itemTaxExclusive+"'/>" +

    			"<input type='hidden' id='color"+len+"' value='"+sku.color+"'/>" +
    			"<input type='hidden' id='size"+len+"' value='"+sku.size+"'/>" +
    			"<input type='hidden' id='trackingRequired"+len+"' value='"+sku.trackingRequired+"'/>"+
    			"<input type='hidden' id='batchRequired"+len+"' value='"+sku.batchRequired+"'/>"+
    			"<td id='Desc"+len+"'>"+description+"</td>"+
    			"<td class='Price' id='Price"+len+"'>"+sku.costPrice+"</td>" +
    			"<td id='Pack"+len+"' class='Pack' onBlur='changePack(this);' onkeypress='PreventEnter(this);' contenteditable='true'>"+sku.quantity+"</td>" +
    			"<td id='Cost"+len+"'>"+sku.costPrice+"</td><td id='Make"+len+"'>"+make+"</td>" +
    			"<td id='Supplied"+len+"'>1</td><td class='Received' id='Received"+len+"'>1</td>" +
    			"<td id='Rejected"+len+"' onBlur='changeRejected(this);' onkeypress='PreventEnter(this);' contenteditable='true'>0</td><td id='Del"+sku.price+"'>" +
    			"<img id='Img"+len+"' src='"+contextPath+"/images/itemdelete.png' style='width:12%;cursor:pointer;' onclick='deleteItem(this);' title='Delete "+sku.skuId+"'/></td></tr>";
    			$("#productsList tbody").append(row);
    			
   			}
			
		 	changeDiscPerc(len);
   			changeDiscAmt(len);
		return  searchhaEmployee('',"handledBy"+len);
	
	}
	
	
	//modified by koti bommineni
     function addSkuwithplus(ele){
             var contextPath = $("#contextPath").val();
             debugger;
             
            

        var pack = $("#Pack"+ele).text();
        var basePriceValue=$("#Price"+ele).text();
        var taxCGSGSTValue=$("#tax"+ele).text();
        
        var cgsttaxRate=$("#cgsttax"+ele).text();
        var sgsttaxRate=$("#sgsttax"+ele).text();
        
        
        var cgstValue=parseFloat((basePriceValue*cgsttaxRate*pack)/100).toFixed(2);
        var sgstValue=parseFloat((basePriceValue*sgsttaxRate*pack)/100).toFixed(2);
        
        
        var storageRef = $("#storageRef"+ele).val();
        if(storageRef == undefined || storageRef == null || storageRef ==""){
                storageRef = "";
        }
        
        
        var cessAmt = parseFloat($("#cess"+ele).text());
        if(isNaN(cessAmt)){
                cessAmt = 0.0
        }
        
        var cessRate = parseFloat($("#cessTaxRate"+ele).val());
        if(isNaN(cessRate)){
                cessRate = 0.0
        }
        if($("#batchRequired"+ele).val()=="true"){
                
                if($("#batchNum"+ele).val() == ""){
                                $("#Error").html("Enter The Batch Number");
                                return;
                                        }
                
                if($("#expiryDate"+ele).val() == ""){
                                $("#Error").html("Select The Expiry Date");
                                $("#expiryDate"+ele).focus();
                                return;
                                        
                                        }
		var dateTime = getCurrentDate();
	   	  var date = dateTime.split(' ');
	   	  date = date[0].split('/');
	   	  var formatedDate = date[1]+"/"+date[0]+"/"+date[2];
	   	  
		 var noOfDaysstart = daydiff(parseDate($('#expiryDate'+ele).val()), parseDate(formatedDate));
		 
  	 if(noOfDaysstart > 0){
 		  $("#Error").html("For Expiry Date, Past Dates Not allowed"); 
 		$("#expiryDate"+ele).focus();
 		 return false;
 	  }

                                }
        
             
        
var expiryDateStr = $("#expiryDate"+ele).val();
var bactchNum = "";
var trackingRequired = $("#trackingRequired"+ele).val();
var batchRequired = $("#batchRequired"+ele).val();
var ean = $("#ean"+ele).text();
var itemScanCode = $("#itemScanCode"+ele).text();
var hsnCode = $("#hsnCode"+ele).text();
var  igstRate = $("#igsttaxRate"+ele).val();
var igstValue = $("#igsttax"+ele).text();
var cgstRate = $("#cgstTaxRate"+ele).val();
var cgstValue = $("#cgsttax"+ele).text();
var sgstRate = $("#cgstTaxRate"+ele).val();
var sgstValue = $("#sgsttax"+ele).text();
var utility = $("#utility"+ele).val();
var itemTax = $("#tax"+ele).html();
var cessAmt = cessAmt;
var cessRate = cessRate;
var color = $("#color"+ele).val();
var size = $("#size"+ele).val();
var category = $("#category"+ele).val();
var measurementRange = $("#measureRange"+ele).val();
var productRange = $("#productRange"+ele).val();
var brand = $("#brandCode"+ele).val();
var  uom = $("#Make"+ele).text();
var  sno = $("#sno"+ele).val();
var skuId = $("#skuId"+ele).val();
var pluCode = $("#pluCode"+ele).val();
var itemName = $("#Name"+ele).text();
var itemDesc = $("#Desc"+ele).text();
var handledBy = $("#handledBy"+ele).val();
var storageRef = storageRef;
var orderPrice = $("#SPrice"+ele).text();
var supplyPrice = $("#Price"+ele).text();
var suppliedQty = $("#Pack"+ele).text();
var orderQty = $("#Requested"+ele).text();
var totalCost = $("#Cost"+ele).text();
var mrp = $("#mrp"+ele).val();
var discount = $("#discountpercentage"+ele).val();
var discountAmt = $("#discountAmt"+ele).val();
var freeQty = $("#freeqty"+ele).val();
var expiryDate = "";
var tataxationlist = $("#taxationlist"+ele).val();
var priceDuplicate = $("#priceDuplicate"+ele).val();
var pricereal = $("#pricereal"+ele).val();
var itemTaxExclusive = $("#itemTaxExclusive"+ele).val();



var slNo = 1; 
$('.slno').each(function(){
       $(this).text(slNo);
       slNo = parseInt(slNo) + 1;
});

len = slNo;


             debugger;
              var row = "<tr id='dynamicdiv"+len+"' style='margin-top:5px;'><td class='slno sticky-col first-col' style='background: #f9f9f9;' >"+slNo+"</td><td class='sticky-col second-col' style='background: #f9f9f9; id='Name"+len+"'>"+skuId+"</td>" +
                                      "<td class='sticky-col third-col' style='background: #f9f9f9;' id='ean"+len+"'>"+ean+"</td>" +
                        "<td class='sticky-col fourth-col' style='background: #f9f9f9;' id='hsnCode"+len+"' contenteditable='true'>"+hsnCode+"</td>" +
                        "<td class='sticky-col fifth-col' style='background: #f9f9f9;' id='itemScanCode"+len+"' class='itemScanCode'  contenteditable='true'>"+itemScanCode+"</td>" +
                        "<input type='hidden' id='trackingRequired"+len+"' name ='trackingRequired' class='trackingRequired' value='"+trackingRequired+"'/>"+
                        "<input type='hidden' id='batchRequired"+len+"' name ='batchRequired' class='batchRequired' value='"+batchRequired+"'/>"+                        
                        "<input type='hidden' id='skuId"+len+"' value='"+skuId+"'/>" +
                        "<input type='hidden' id='pluCode"+len+"' value='"+pluCode+"'/>" +
                        "<input type='hidden' id='category"+len+"' value='"+category+"'/>" +
                        "<input type='hidden' id='brandCode"+len+"' value='"+brand+"'/>" +
                        "<input type='hidden' id='productRange"+len+"' value='"+productRange+"'/>" +
                        "<input type='hidden' id='measureRange"+len+"' value='"+measurementRange+"'/>" +
                        "<input type='hidden' id='utility"+len+"' value='"+utility+"'/>" +
                        "<input type='hidden' id='itemTaxExclusive"+len+"' value='"+itemTaxExclusive+"'/>" +
                        "<input type='hidden' id='color"+len+"' value='"+color+"'/>" +
                        "<input type='hidden' id='size"+len+"' value='"+size+"'/>" +
                        "<input type='hidden' id='cgstTaxRate"+len+"' value='"+cgstRate+"'/>" +
                        "<input type='hidden' id='cessTaxRate"+len+"' value='"+cessRate+"'/>" +
                        "<input type='hidden' id='igsttaxRate"+len+"' value='"+igstRate+"'/>" +
                        "<input type='hidden' id='taxationlist"+len+"' value='"+tataxationlist+"'/>" +
                        "<input type='hidden' id='priceDuplicate"+len+"' value='"+priceDuplicate+"'/>" +
                         "<input type='hidden' id='pricereal"+len+"' value='"+pricereal+"'/>" +
                          "<input type='hidden' id='pricerealedit"+len+"' value=''/>" +

                        "<td class='sticky-col sixth-col' style='background: #f9f9f9;' id='Desc"+len+"' style='width:30%'>"+itemDesc+"</td>"+
                        "<td><textarea id='batchNum"+len+"' rows=1 style='resize:none;width: 87px;'>"+bactchNum+"</textarea></td>"+
                        "<td><input class='form-control calendar_icon endDate'readonly='readonly' style='width:100px;background-color: white;' id='expiryDate"+len+"' type='text' value='"+expiryDate+"' onfocus=callCalender('expiryDate"+len+"') onclick=callCalender('expiryDate"+len+"') placeholder='DD/MM/YYYY' /></td>" +
                        "<td id='Pack"+len+"' class='Pack' onBlur='changePack(this);' onkeypress='PreventEnter(this);' contenteditable='true'>"+suppliedQty+"</td>" +

                        "<td>"+measurementRange+"</td>" +
                        "<td id='Make"+len+"'>"+uom+"</td>" +
                        "<td><input type='text' id='mrp"+len+"'  style='width:70px;text-align:center' value='"+mrp+"'></td>"+
                        "<td id='Requested"+len+"' class='Requested' >"+orderQty+"</td>" +
                        "<td class='Price' id='SPrice"+len+"'>"+orderPrice+"</td>" +
                       	"<td><input id='discountpercentage"+len+"' class='discountpercentage' onBlur='changeDiscPerc(this);changeTotalCost();changeTotalQuantity();' onkeypress='PreventEnter(this);' type='number' style='width:70px;text-align:center;' value='"+discount+"'></td>"+
		    			"<td><input id='discountAmt"+len+"' class='discountAmt' onBlur='changeDiscAmt(this);changeTotalCost();changeTotalQuantity();' onkeypress='PreventEnter(this);' type='number' style='width:70px;text-align:center;' value='"+discountAmt+"'></td>"+

                        "<td><input id='freeqty"+len+"' class='freeqty' onBlur='changePack(this);' onkeypress='PreventEnter(this);' type='number' style='width:70px;text-align:center' value='"+freeQty+"'></td>"+
                                        
                        "<td  id='tax"+len+"' onBlur='changeGrnTax(this);' contenteditable='true'>"+itemTax+"</td>" +
                        "<td  id='cgsttax"+len+"'>"+cgstValue+"</td>" +
                        "<td  id='sgsttax"+len+"'>"+sgstValue+"</td>" +
                        "<td id='igsttax"+len+"'>"+igstValue+"</td>"+
                        "<td id='cess"+len+"'>"+cessAmt+"</td>"+
                        "<td class='Price' id='Price"+len+"' onBlur='changeSupplyPrice(this);' onkeypress='changeSupplyPriceonchange(this);PreventEnter(this);'    type='number' contenteditable='true'>"+supplyPrice+"</td>" +

                        "<td id='Cost"+len+"'>"+totalCost+"</td>" +
                        "<td><select  style='width:180px' class='storageRef"+len+"'  id='storageRef"+len+"'></select></td>"+
                        "<td><select  style='width:180px' class='handledBy"+len+"'  id='handledBy"+len+"'></select></td>"+
                        "<td id='Del"+len+"'>" +
                        "<img id='Img"+len+"' src='"+contextPath+"/images/itemdelete.png' style='width:35%;cursor:pointer;' onclick='deleteItem(this);' title='Delete "+skuId+"'/>" +
                        "<img id='Img"+len+"' src='"+contextPath+"/images/bulewhiteplusicon.png' style='width:32%;cursor:pointer;margin-left: 10px;' onclick='addSkuwithplus("+slNo+");' title='Additem "+skuId+"'/></td></tr>";
                                
                                                      $("#productsList tbody").append(row);
                               // appendStorageSystemID(ele,storageRef);
                                callCalender("expiryDate"+len);
                                
                                $("#Pack"+len).focus();
                                $("#dynamicdiv"+(len-1)).css("background","none");
                                $("#dynamicdiv"+len).css("background","lightgreen", "important");
                               
                    
             changeTotalCost();
             changeTotalQuantity();
            //changeEmp("handledBy"+len);
            return  searchhaEmployee('',"handledBy"+len);
    
    }



function importExcelDataForGRNupdate(){
			debugger;
			var oMyForm = new FormData();
			if(productFiles.length <= 0)
			{
			alert("Please Select Excel Sheet... ");
				return;
			}
			
			if( $("#fileUploadCSV").val().toLowerCase().indexOf('.xlsx') == -1){
				$("#Error").html('Not a XLSX File');
				return;
			}
			
		    oMyForm.append("file", productFiles[0]);
		    
		    var supplierCode = $('#supplier_Id').val();
		  	if(supplierCode == "" || supplierCode == undefined || supplierCode == null){
		  		alert("Please Select Supplier...");
		 		  	return;
		  	} 
		 	
		  	warehouseLocation = $("#warehouse_location option:selected").text();
		  	if($("#warehouse_location option:selected").text() == "" || $("#warehouse_location option:selected").text() == undefined){
		 		  $("#warehouse_locationError").html("warehouse location required");
		 		  $("#warehouse_location").focus();
		 		  return;
		 	  }
		  	
		  	
		  	oMyForm.append("supplierCode", $("#supplier_Id").val());
		  	oMyForm.append("warehouseLocation", $("#warehouse_location option:selected").text());
		  	
		    var contextPath = $("#contextPath").val();
			 URL = contextPath + "/procurement/importExcelDataforGRNupdate.do";
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
		        	
		        	  if(skuList[0].responnseMessage == null || skuList[0].responnseMessage == ""){
		        	  if(skuList[0].skuId != null || skuList[0].skuId != ""){
		        		  
		        	  var len = $("#productsList tr").length-1;
		        		var finalObj = {},items = []; highQtySkus = []; lowQtySkus = []; equalQtySkus = []; noMatchedSkus = [];
		        		
		        		if(len == 0){
		        			$('#Error').html("Add Atleast One Item to Receipt");
		        			return;
		        			}
		        		
		        		debugger;
		        		for(var i=1;i<=len;i++){
		        			
		        			var idAttr = $("#productsList tr:eq("+i+") td:last").attr("id").replace('Del','');
		        			
		        			if($("#flowUnder").val()=="warehouse" || $("#flowUnder").val()=="procurement"){
		        				
		        				var obj = {skuId:$("#skuId"+idAttr).val(),suppliedQty:$("#Pack"+idAttr).text(),costPrice:$("#mrp"+idAttr).val(),hsnCode:$("#hsnCode"+idAttr).text(),itemTax:$("#tax"+idAttr).html(),rowCount:idAttr};
		        			}
		        			
		        			items.push(obj);
		        			
		        		}
		        		finalObj.itemDetails = items;
		        		
		        		var formData = JSON.stringify(finalObj);
		        		console.log(formData);
		        		
		        		if(items[0].skuId != null || items[0].skuId != undefined || items[0].skuId != ""){
		        		var count = 0;
		        				for (var i = 0; i <skuList.length; i++){
		        					for (var j = 0; j <items.length; j++){
				        	  
		        		
		        						if(skuList[i].skuId == items[j].skuId){
		        							count = count+1;
		        						if( items[j].skuId == skuList[i].skuId && items[j].costPrice == parseFloat(skuList[i].costPrice) && items[j].hsnCode == skuList[i].hsnCode && items[j].suppliedQty == parseFloat(skuList[i].quantity) && parseFloat(skuList[i].taxCode) == (parseFloat(items[j].itemTax))){
		        		        				highQtySkus.push(skuList[i].skuId);
		        						} else {
		        		        			
		        		        				lowQtySkus.push(skuList[i].skuId);
		        						}
		        				}
		        						
			        	} // end of for loop
		        	} // end of for loop
		        				
		        				if(count == 0) {
				        			$('#Error').html("There is no  Matched Item!");
					        		
						         	}	
		        				
		        				
		        		} else {
		        			$('#Error').html("There is no items in GRN to Compare!");
			        	
				         	}
		        	 
		        		for (var i = 0; i <items.length; i++){
		        			for (var j = 0; j <highQtySkus.length; j++){
		            if(items[i].skuId == highQtySkus[j] ){
		            	$("#dynamicdiv"+items[i].rowCount).css("background","lightgreen", "important");	// light green
		        	
		            }
		        			}	
		        		}
		        		for (var i = 0; i <items.length; i++){
		        			for (var j = 0; j <lowQtySkus.length; j++){
		        				 if(items[i].skuId == lowQtySkus[j] ){
		        	$("#dynamicdiv"+items[i].rowCount).css("background","#F08080", "important");  // LightCoral (Red)
		        	
		        				 }
		        				 }	
		        		}
		        		/*for (var i = 0; i <items.length; i++){
		        			for (var j = 0; j <equalQtySkus.length; j++){
		        				 if(items[i].skuId == equalQtySkus[j] ){
		        					 $("#dynamicdiv"+items[i].rowCount).css("background","#00FFFF", "important");	// light blue
		        				 }
		        				 }	
		        		}*/
		        		
		        	if(highQtySkus.length == 0 && lowQtySkus.length == 0 &&  equalQtySkus.length == 0  ){
		        		$('#Error').html("Please Select Valid  File...");
		        			
	        			}
		        	 
		        	  }
		        	  else {
		        		  $('#Error').html("Select a valid  File.");
		        			
			         	}
		        	}
		        	  else {
		        		  $('#Error').html(skuList[0].responnseMessage); 
		        		 
		        	  }
		        	
		        		
		        	$("#loading").css("display","none");
	  				$("#mainDiv").removeClass("disabled");
		  		},
		  		error : function(){
		  			alert("Something Went Wrong.");
		  			$("#loading").css("display","none");
		 			$("#mainDiv").removeClass("disabled");
		 		}
		 	 });
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
    	  			 changeTotalQuantity();
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
    	  			 changeTotalQuantity();

}




function addNameToTextBox(id,ele){
		 debugger;
		 $("#Error").html("");

	        if(($("#"+id)[0].files[0] != undefined) && $("#"+id)[0].files[0].size < 5000000){

			if($("#"+id)[0].files[0] != undefined){
				$("#"+id+"File").val($("#"+id)[0].files[0]['name']);
				var fullPath = $("#"+id)[0].files[0]['name'];
				loadImageFileAsURL(id,ele);
			}else{
				$("#"+id+"File").val("");
				}
				
			}else{
		 $("#Error").html("File too Big, please select a file less than 5MB");
			
			}

		}

		function loadImageFileAsURL(id,ele) {
			debugger;
			if (ele.files && ele.files[0]) {
		        var reader = new FileReader();

		        reader.readAsDataURL(ele.files[0]);
		       
		        var oMyForm = new FormData();
		        oMyForm.append("file",  ele.files[0]);

		        if($("#"+id+"_refId").val() != "")
		        	oMyForm.append("refId",  $("#"+id+"_refId").val());
		       
		        else
		        	oMyForm.append("refId", "");
		      
		        var contextPath = $("#contextPath").val();
		        var URL = contextPath + "/inventorymanager/addToAttachementList.do";
		        $.ajax({
//						dataType : 'json',
		        	url : URL,
		        	data : oMyForm,
		        	type : "POST",
		        	enctype : 'multipart/form-data',
		        	processData : false,
		        	contentType : false,
		        	
		       beforeSend : function(xhr) {
		    			
		    	     $("#skuMasterImg1").css("display","block");
		       },
		          success : function(result) {
		        	  debugger
		        	  if(result != null || result != ""){
		        		  
		        	  $("#"+id+"_refId").val(result);
		        	  $("#skuMasterImg1").attr("src",contextPath+"/images/tickMark.png");
		        	  $("#skuMasterImg1").css("display","block");
		        	  }else {
		        		  
		        	  $("#Error").html("Please Upload Proper Attachment");
		        	  }		
		  		},
		        
		        	error : function() {
		        		$("#Error").html("Something Went Wrong, please Check Document Size");
		        		$("#skuMasterImg1").css("display","none");
		        	
		        	}

		        });
		    }
		};
		
		
		function downloadlog(){
			debugger;
			var anchor = document.createElement('a');
			anchor.href = $("#urlfordoc").val();
			anchor.target = '_blank';
			anchor.download = '';
			if($("#urlfordoc").val()!=null && $("#urlfordoc").val()!='')
				anchor.click();
		}
		
		
		function downloadlogedit(){
			debugger;
			
			
			var anchor = document.createElement('a');
			anchor.href =  $("#doclinkfile").val();
			anchor.target = '_blank';
			anchor.download = '';
			if($("#doclinkfile").val() != null && $("#doclinkfile").val() != '')
				anchor.click();
		}
		
		
		
		
		


