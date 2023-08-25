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
	var currentLocationsDivContent = locationsDivContent;
	currentLocationsDivContent = currentLocationsDivContent.replace('locations0','locations'+id);
	currentLocationsDivContent = currentLocationsDivContent.replace('location0','location'+id);
	currentLocationsDivContent = currentLocationsDivContent.replace('street0','street'+id);
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
		 
		 for(var i=1;i<=len;i++){
			 var idAttr = $("#productsList tr:eq("+i+") td:last").attr("id");
			 idAttr = idAttr.replace('Del','');
			 var pack = parseFloat($("#quantity"+idAttr).text());
			 var selectedPack = 0;
			 $("."+$("#pluCode"+idAttr).val()).each(function(){
				 selectedPack = selectedPack + parseFloat($(this).text());
			 });
			 selectedPack = pack - selectedPack;
			 var totalCost = parseFloat($("#itemPrice"+idAttr).text()) * selectedPack;
			 var row = "<tr id='selected"+i+"' style='margin-top:5px;'><td class='selecetedSlno'>"+i+"</td><td id='selectedItemId"+i+"'>"+$("#itemId"+idAttr).text()+"</td>" +
			 "<input type='hidden' id='selectedSkuId"+i+"' value='"+$("#skuId"+idAttr).val()+"'/>" +
			 "<input type='hidden' id='selectedPluCode"+i+"' value='"+$("#pluCode"+idAttr).val()+"'/>" +
			 "<td id='selectedItemDesc"+i+"'>"+$("#itemDesc"+idAttr).text()+"</td><td id='selectedItemPrice"+i+"'>"+$("#itemPrice"+idAttr).text()+"</td>" +
			 "<td id='selectedQuantity"+i+"' class='selectedPack "+$("#pluCode"+idAttr).val()+"' onBlur='changeSelectedPack(this);' onkeypress='return (this.innerText.length < 10)' contenteditable='true' >"+selectedPack+"</td><td class='selectedCost' id='selectedTotalCost"+i+"'>"+totalCost+"</td>" ;
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
			 "<td id='selectedQuantity"+pluCodeLen+"' class='selectedPack "+$("#pluCode"+idAttr).val()+"' onBlur='changeSelectedPack(this);' onkeypress='return (this.innerText.length < 10)' contenteditable='true'>"+selectedPack+"</td><td class='selectedCost' id='selectedTotalCost"+pluCodeLen+"'>"+totalCost+"</td>" +
			 "<td id='selectedDel"+pluCodeLen+"' ><img id='selectedImg"+pluCodeLen+"' src='"+contextPath+"/images/itemdelete.png' style='width:12%;cursor:pointer;' onclick='deleteSelectedItemDetails(this);' title='Delete "+$("#skuId"+idAttr).val()+"'/>" +
			 "</td></tr>";
//		var obj = {skuId:$("#skuId"+idAttr).val(),pluCode:$("#pluCode"+idAttr).val(),itemId:$("#itemId"+idAttr).text(),itemDesc:$("#itemDesc"+idAttr).text(),itemPrice:$("#itemPrice"+idAttr).text(),quantity:$("#quantity"+idAttr).text(),totalCost:$("#totalCost"+idAttr).text(),make:$("#make"+idAttr).text(),model:$("#model"+idAttr).text(),color:$("#color"+idAttr).text(),size:$("#size"+idAttr).text()};
			 $("#selectedItemsList tbody").append(row);
			 pluCodeLen = pluCodeLen + 1;
		 }
	 }
}

function saveSelectedSkus(){
	var selectedLocationId = $("#selectedLocationId").val();
	var selectedSkuContent = $("#selectedItemsList tbody").prop('innerHTML');
	
	/*var len = $("#selectedItemsList tr").length-1;
	 if(len == 0){
		 for(var i=1;i<=len;i++){
				var idAttr = $("#productsList tr:eq("+i+") td:last").attr("id");
				idAttr = idAttr.replace('Del','');
				var row = "<tr id='selected_"+i+"' style='margin-top:5px;'><td class='selecetedSlno_'>"+i+"</td><td id='selectedItemId_"+i+"'>"+$("#itemId"+idAttr).text()+"</td>" +
				"<input type='hidden' id='selectedSkuId_"+i+"' value='"+$("#skuId"+idAttr).val()+"'/>" +
				"<input type='hidden' id='selectedPluCode_"+i+"' value='"+$("#pluCode"+idAttr).val()+"'/>" +
				"<td id='selectedItemDesc_"+i+"'>"+$("#itemDesc"+idAttr).text()+"</td><td id='selectedItemPrice_"+i+"'>"+$("#itemPrice"+idAttr).text()+"</td>" +
				"<td id='selectedQuantity_"+i+"' class='selectedPack "+$("#pluCode"+idAttr).val()+"' onBlur='changeSelectedPack(this);' onkeypress='return (this.innerText.length < 10)' contenteditable='true'>0</td><td class='selectedCost' id='selectedTotalCost_"+i+"'>0</td>" +
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
	var id= $(element).attr("id");
	var description = null;
	description =  $("#"+id).children("a").text();
	description = description.split(' ( ');
	description = description[0];
	$("#desc").val(description);
	if(type == "apparel")
		getItemDetails(id,type);
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

function getCode(element,type){
	var id= $(element).attr("id");
	$("#supplier_Id").val(id);
	var label = $(element).children("a").text();
	$("#searchSupplier").val(label);
	 $(".services").hide();
	 $("."+type).html("");
}


function searchSuppliers(name, searchCategory){
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


function searchInspectedEmployee(name, searchCategory){
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
	
	
    for(var i=0;i<empList.length;i++){
		$("#"+searchCategory).append(
				'<option>'+empList[i].firstName+' '+empList[i].lastName+' - '+empList[i].employeeCode+'</option>');
           }
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

function getPoItems(poRefId){
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

function appendPoItems(poItemsList){
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
				var color = sku.color;
				if(color == null || color == "_")
					sku.color = "";
				var ean = sku.ean;
				if(ean == null)
					sku.ean = "";
				var size = sku.size;
				if(size == null || size == "_")
					sku.size = "";
				var slNo = 1; 
	  			 $('.slno').each(function(){
	  				$(this).text(slNo);
	  				slNo = parseInt(slNo) + 1;
	  			});
	  		/*	
	  			var row = "<tr id='dynamicdiv"+len+"' style='margin-top:5px;'><td class='slno'>"+slNo+"</td><td id='Name"+len+"'>"+sku.skuId+"</td>" +
    			"<input type='hidden' id='skuId"+len+"' value='"+sku.skuId+"'/>" +
    			"<input type='hidden' id='pluCode"+len+"' value='"+sku.pluCode+"'/>" +
    			"<td id='Desc"+len+"'>"+description+"</td>"+
    			"<td class='Price' id='Price"+len+"'>"+sku.price+"</td>" +
    			"<td id='Supplied"+len+"' >1</td>" +
    			"<td id='Make"+len+"'>"+make+"</td>" +
    			"<td id='Pack"+len+"' class='Pack' onBlur='changePack(this);' onkeypress='return (this.innerText.length < 10)' contenteditable='true'>1</td>" +
    			"<td id='Rejected"+len+"' onBlur='changeRejected(this);' onkeypress='return (this.innerText.length < 10)' contenteditable='true'>0</td><td id='Cost"+len+"'>"+sku.price+"</td><td id='Del"+len+"'>" +
    			"<img id='Img"+len+"' src='"+contextPath+"/images/itemdelete.png' style='width:15%;cursor:pointer;' onclick='deleteItem(this);' title='Delete "+sku.skuId+"'/></td></tr>";
    			$("#productsList tbody").append(row);*/
	  			 
	  			 
				var row = "<tr id='dynamicdiv"+len+"' style='margin-top:5px;'><td class='slno'>"+slNo+"</td><td id='Name"+len+"'>"+sku.skuId+"</td>" +
				"<td id='ean"+len+"'>"+sku.ean+"</td>" +
				"<input type='hidden' id='skuId"+len+"' value='"+sku.skuId+"'/>" +
				"<input type='hidden' id='pluCode"+len+"' value='"+pluCode+"'/>" +
				"<input type='hidden' id='category"+len+"' value='"+sku.category+"'/>" +
    			"<input type='hidden' id='brandCode"+len+"' value='"+sku.brand+"'/>" +
    			"<input type='hidden' id='productRange"+len+"' value='"+sku.productRange+"'/>" +
    			"<input type='hidden' id='measureRange"+len+"' value='"+sku.measurementRange+"'/>" +
    			"<input type='hidden' id='color"+len+"' value='"+sku.color+"'/>" +
    			"<input type='hidden' id='size"+len+"' value='"+sku.size+"'/>" +
				"<input type='hidden' id='Rejected"+len+"' value='0'/>" +
				
				"<td id='Desc"+len+"'>"+description+"</td>"+
				"<td id='Make"+len+"'>"+sku.uom+"</td>" +
				"<td id='Requested"+len+"'>"+sku.quantity+"</td>" +
				"<td class='Price' id='SPrice"+len+"'>"+sku.itemPrice+"</td>" +
				"<td  id='tax"+len+"' onBlur='changeGrnTax(this);' contenteditable='true'>"+sku.tax+"</td>" +
				"<td style='border: 1px solid #ccc;padding:0px;'><input style='border: none;height: 100%;text-align: center;' id='Pack"+len+"' class='Pack' onBlur='changePack(this);'   type='number' value='1' /></td>" +
    			"<td style='border: 1px solid #ccc;padding:0px;'><input style='border: none;height: 100%;text-align: center;' id='Price"+len+"'    type='number' value='"+sku.itemPrice+"' /></td>" +
    			"<td id='Cost"+len+"'>"+sku.itemPrice+"</td>" +
    			"<td><select  style='width:180px' class='handledBy"+len+"'  id='handledBy"+len+"'></select> </td>"+
    			"<td id='Del"+len+"'>" +
				"<img id='Img"+len+"' src='"+contextPath+"/images/itemdelete.png' style='width:12%;cursor:pointer;' onclick='deleteItem(this);' title='Delete "+sku.skuId+"'/></td></tr>";
				$("#productsList tbody").append(row);
			 changeTotalCost();
			 changeTotalQuantity();
				 searchhaEmployee('',"handledBy"+len);
		}
}

function searchProducts(name, searchCategory){
	var storeLocation = $("#warehouseLocation option:selected").text();
	var supplier_Id = $("#supplier_Id").val();
		var contextPath = $("#contextPath").val();
		if(searchCategory == "receipt"){
			supplier_Id = $("#supplier_Id").val();
			storeLocation = $("#warehouse_location option:selected").text();
			 var type = $("#warehouse_location").val();
			 if(type == "Warehouse")
				 URL = contextPath + "/inventorymanager/searchWarehouseProducts.do";
			 else if(type == "Retail Outlet" || type == "Restaurant")
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
    				storeLocation : storeLocation
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

  	 




function searchProductsItem(name, searchCategory){
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
			 
		 }
		 
		 $("."+searchCategory).html(op);
		 $("."+searchCategory).show();
		 
	 }
    	 
	 
	 function getItemDetails(skuId,searchCategory){
 		 var contextPath = $("#contextPath").val();
 		 var storeLocation = $("#warehouseLocation option:selected").text();
 		 var type = $("#warehouseLocation").val();

var WarehouseReturnflag=$("#whreturnflag").val();
                if(WarehouseReturnflag == "" || WarehouseReturnflag == undefined || WarehouseReturnflag == null){
                        WarehouseReturnflag="";
                   }


		 if(type == "Warehouse")
			 URL = contextPath + "/inventorymanager/getWarehouseSkuDetails.do";
		 else if(type == "Retail Outlet" || type == "Restaurant")
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
		 debugger
		 var parsedJson = jQuery.parseJSON(skuDetails);
			$("#searchItems").val("");
			skuList = parsedJson.skuLists;
			if(skuList.length >1){
				var priceLength = skuList.length;
				var priceArray = [];
				$("#itemsList tbody").html("");
				for(var i=0; i<priceLength; i++){
					var price = skuList[i].costPrice;
					if (! $.inArray(price, priceArray) > -1)
					{
						priceArray.push(price);
						var row = '<tr id=price'+i+' style="margin-top:5px;cursor:pointer;white-space: nowrap;"  ><td><input type="checkbox" name="selectall" class="selectableCheckbox" id="selectall" value='+i+' /></td><td>'+skuList[i].description+'</td><td>'+price+'</td><td>'+skuList[i].measureRange+'</td><td>'+skuList[i].productRange+'</td><td>'+skuList[i].brandCode+'</td><td>'+skuList[i].color+'</td><td>'+skuList[i].size+'</td><td>'+skuList[i].ean+'</td></tr>';
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
	 
	 function addItem(sku){
		 var contextPath = $("#contextPath").val();
		 var len = parseInt($("#productsList tr").length);
		 debugger
			if (len != 1)
				len = parseInt($("#productsList tr:last").attr("id").replace('dynamicdiv', '')) + 1;
			for (var i = 1; i <= len; i++) {
				if ($("#skuId" + i).val() == sku.skuId && $("#itemPrice"+i).text() == sku.costPrice && $("#pluCode" + i).val() == sku.pluCode) {
					var pack =  parseInt($("#quantity"+i).text())+1;
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
			var size = sku.size;
			if(size == null)
				sku.size = "";
			var tax = sku.tax;
			var taxamount = 0.0;
			/*if(tax!=null)
			if(tax.length>0){
				if(tax[0].taxType == "Percentage")
					taxamount = parseFloat(((sku.costPrice)*(tax[0].taxRate))/100).toFixed(2);
                if(tax[0].taxType == "Fixed")
                	taxamount = tax[0].taxRate;
			}*/
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
					"<td id='ean"+len+"'>"+sku.ean+"</td>" +
	 		"<input type='hidden' id='skuId"+len+"' value='"+sku.skuId+"'/>" +
	 		"<input type='hidden' id='pluCode"+len+"' value='"+sku.pluCode+"'/>" +
	 		"<input type='hidden' id='category"+len+"' value='"+sku.category+"'/>" +
			"<input type='hidden' id='brandCode"+len+"' value='"+sku.brandCode+"'/>" +
			"<input type='hidden' id='productRange"+len+"' value='"+sku.productRange+"'/>" +
			"<input type='hidden' id='measureRange"+len+"' value='"+sku.measureRange+"'/>" +
			//"<input type='hidden' id='tax"+len+"' value='"+taxamount+"'/>" +
	 		"<td id='itemDesc"+len+"'>"+description+"</td><td class='Price' id='itemPrice"+len+"' onBlur='changeOrderedPrice(this);' contenteditable='true'>"+parseFloat(sku.costPrice).toFixed(2)+"</td>" +
	 		"<td id='quantity"+len+"' class='Pack' onBlur='changeOrderedPack(this);' onkeypress='return (this.innerText.length < 10)' contenteditable='true'>1</td>" +
	 		"<td  id='tax"+len+"' onBlur='changeTax(this);' contenteditable='true'>0</td>" +
	 		"<td class='cost' id='totalCost"+len+"'>"+parseFloat(sku.costPrice).toFixed(2)+"</td>" +
	 		"<td id='make"+len+"'>"+make+"</td><td id='model"+len+"'>"+model+"</td><td id='color"+len+"'>"+color+"</td>" +
	 		"<td id='size"+len+"'>"+size+"</td><td id='Del"+ len +"' ><img id='Img"+ len +"' src='"+contextPath+"/images/itemdelete.png' style='width:12%;cursor:pointer;' onclick='deleteItemDetails(this);' title='Delete "+sku.skuId+"'/>" +
	 		"</td></tr>";
			$("#productsList tbody").append(row);
			changeTotalOrderCost();
	}
			
	 function changeTotalOrderCost(){
		 var totalCost = 0.0;
		 var totaltax = 0.0;
			$('.cost').each(function(){
				  var rowNo = $(this).attr("id").replace('totalCost','');
				  var cost = $("#totalCost"+rowNo).html();
				  var taxvalue =  ($("#tax"+rowNo).html()*$("#totalCost"+rowNo).html())/100;
				  totalCost = totalCost + parseFloat(cost);
				  totaltax = totaltax + parseFloat(taxvalue);
				 });
			$('#subtotalCost').val(parseFloat(totalCost));
			var shipmentCost = $("#shipping_cost").val();
			if($('#shipping_cost').val()!="")
				totalCost = totalCost + parseFloat(shipmentCost);
			var discount = $("#discount").val();
			if($('#discount').val()!="")
				totalCost = totalCost - parseFloat(discount);
			
			if(totaltax != "" && totaltax!= undefined && totaltax!= NaN)
				{
				if (isNaN(totaltax))
				console.info(totaltax);	
				else		
				$("#total_tax").val(parseFloat(totaltax).toFixed(2));
				}
			
			var tax = $("#total_tax").val();
			if(tax != "")
				totalCost = parseFloat(totalCost) + parseFloat(tax);
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
				/*var tax = parseFloat($('#tax'+rowNo).html());
				$('#tax'+rowNo).html(packVal*tax);*/
			}
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
    		 var contextPath = $("#contextPath").val();
    		 var storeLocation = $("#warehouse_location option:selected").text();
    		 var type = $("#warehouse_location").val();
              var WarehouseReturnflag=$("#whreturnflag").val();
                if(WarehouseReturnflag == "" || WarehouseReturnflag == undefined || WarehouseReturnflag == null){
                        WarehouseReturnflag="";
                   }

    		 if(type == "Warehouse")
    			 URL = contextPath + "/inventorymanager/getWarehouseSkuDetails.do";
    		 else if(type == "Retail Outlet" || type == "Restaurant")
    			 URL = contextPath + "/inventorymanager/getSkuDetails.do";
    		 $.ajax({
	       			type: "GET",
	       			url : URL,
	       			data : {
	       				skuId : skuId,
	       				storeLocation : storeLocation,
                         WarehouseReturnflag :WarehouseReturnflag
	       			},
	       			beforeSend: function(xhr){                    
     	   	   			$("#loading").css("display","block");
     	   	   			$("#mainDiv").addClass("disabled");
     	   	   		  },
	       			success : function(result) {
	       				appendSkuDetails(result);
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
    	
    	 
    	 function appendSkuDetails(skuDetails){
    		 var parsedJson = jQuery.parseJSON(skuDetails);
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
    				addSku(skuList[0]);
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
    		 debugger
    		 
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
    	 function addSku(sku){
    		 var contextPath = $("#contextPath").val();
    		 var len = parseInt($("#productsList tr").length);
    			if (len != 1)
    				len = parseInt($("#productsList tr:last").attr("id").replace('dynamicdiv', '')) + 1;
    			for (var i = 1; i <= len; i++) {
    				if ($("#skuId" + i).val() == sku.skuId && $("#Price"+i).text() == sku.costPrice && $("#pluCode" + i).val() == sku.pluCode) {
    					var pack =  parseInt($("#Pack"+i).text())+1;
    					//var requested=parseInt($("#Requested"+i).text())+1;
    	  			 $("#Pack"+i).text(pack);
    	  			 $("#Supplied"+i).text(pack);
    	  			 $("#Received"+i).text(pack);
    				 $("#Requested"+i).text(pack);
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
    			var ean = sku.ean;
    			if(ean == null)
    				sku.ean = "";
    			var make = sku.uom;
    			if(make == "" || make == null)
    				make = "_";
    			var slNo = 1; 
	   			 $('.slno').each(function(){
	   				$(this).text(slNo);
	   				slNo = parseInt(slNo) + 1;
	   			});
	   			if($("#flowUnder").val()=='warehouse' || $("#flowUnder").val()=='procurement'){
	   				var row = "<tr id='dynamicdiv"+len+"' style='margin-top:5px;'><td class='slno'>"+slNo+"</td><td id='Name"+len+"'>"+sku.skuId+"</td>" +
	   				"<td id='ean"+len+"'>"+sku.ean+"</td>" +
	   				"<input type='hidden' id='skuId"+len+"' value='"+sku.skuId+"'/>" +
	    			"<input type='hidden' id='pluCode"+len+"' value='"+sku.pluCode+"'/>" +
	    			"<input type='hidden' id='category"+len+"' value='"+sku.category+"'/>" +
	    			"<input type='hidden' id='brandCode"+len+"' value='"+sku.brandCode+"'/>" +
	    			"<input type='hidden' id='productRange"+len+"' value='"+sku.productRange+"'/>" +
	    			"<input type='hidden' id='measureRange"+len+"' value='"+sku.measureRange+"'/>" +
	    			"<input type='hidden' id='color"+len+"' value='"+sku.color+"'/>" +
	    			"<input type='hidden' id='size"+len+"' value='"+sku.size+"'/>" +
	    			"<td id='Desc"+len+"'>"+description+"</td>"+
	    			"<td id='Make"+len+"'>"+make+"</td>" +
	    			"<td id='Requested"+len+"' class='Requested' >0</td>" +
	    			"<td class='Price' id='SPrice"+len+"'>0</td>" +
	    			"<td  id='tax"+len+"' onBlur='changeGrnTax(this);' contenteditable='true'>0</td>" +
	    			"<td style='border: 1px solid #ccc;padding:0px;'><input style='border: none;height: 100%;text-align: center;' id='Pack"+len+"' class='Pack' onBlur='changePack(this);'   type='number' value='1' /></td>" +
	    			"<td style='border: 1px solid #ccc;padding:0px;'><input style='border: none;height: 100%;text-align: center;' id='Price"+len+"' onBlur='changeSupplyPrice(this);'   type='number' value='"+sku.costPrice+"' /></td>" +
	    			
	    			"<td id='Cost"+len+"'>"+sku.costPrice+"</td>" +
	    			"<td><select  style='width:180px' class='handledBy"+len+"'  id='handledBy"+len+"'></select> </td>"+
	    			"<td id='Del"+len+"'>" +
	    			"<img id='Img"+len+"' src='"+contextPath+"/images/itemdelete.png' style='width:12%;cursor:pointer;' onclick='deleteItem(this);' title='Delete "+sku.skuId+"'/></td></tr>";
	    			$("#productsList tbody").append(row);
	    			
	   			}else{
	   				var row = "<tr id='dynamicdiv"+len+"' style='margin-top:5px;'><td class='slno'>"+slNo+"</td><td id='Name"+len+"'>"+sku.skuId+"</td>" +
	    			"<input type='hidden' id='skuId"+len+"' value='"+sku.skuId+"'/>" +
	    			"<input type='hidden' id='pluCode"+len+"' value='"+sku.pluCode+"'/>" +
	    			"<input type='hidden' id='category"+len+"' value='"+sku.category+"'/>" +
	    			"<input type='hidden' id='brandCode"+len+"' value='"+sku.brandCode+"'/>" +
	    			"<input type='hidden' id='productRange"+len+"' value='"+sku.productRange+"'/>" +
	    			"<input type='hidden' id='measureRange"+len+"' value='"+sku.measureRange+"'/>" +
	    			"<input type='hidden' id='color"+len+"' value='"+sku.color+"'/>" +
	    			"<input type='hidden' id='size"+len+"' value='"+sku.size+"'/>" +
	    			"<td id='Desc"+len+"'>"+description+"</td>"+
	    			"<td class='Price' id='Price"+len+"'>"+sku.costPrice+"</td>" +
	    			"<td id='Pack"+len+"' class='Pack' onBlur='changePack(this);' onkeypress='return (this.innerText.length < 10)' contenteditable='true'>1</td>" +
	    			"<td id='Cost"+len+"'>"+sku.costPrice+"</td><td id='Make"+len+"'>"+make+"</td>" +
	    			"<td id='Supplied"+len+"'>1</td><td class='Received' id='Received"+len+"'>1</td>" +
	    			"<td id='Rejected"+len+"' onBlur='changeRejected(this);' onkeypress='return (this.innerText.length < 10)' contenteditable='true'>0</td><td id='Del"+sku.price+"'>" +
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
  
function changePack(element){
	var id = $(element).attr("id");
	var rowNo = id.replace('Pack','');
	if (isNaN($("#"+id).html()) || $("#"+id).html() == ""){
		var supplied = parseInt($('#Supplied'+rowNo).html());
		$('#'+id).html(supplied);
	}
	var packVal = parseFloat($('#Pack'+rowNo).val());
	if(packVal<=0){
		alert("Pack should not be empty");
		var supplied = parseInt($('#Supplied'+rowNo).html());
		var receivedVal = parseInt($('#Received'+rowNo).html());
		var priceVal = parseFloat($('#Price'+rowNo).val());
		$('#Pack'+rowNo).html(supplied);
		$('#Cost'+rowNo).html(receivedVal*priceVal);
	}else{
		var priceVal = parseFloat($('#Price'+rowNo).val());
		var rejected = parseInt($('#Rejected'+rowNo).html());
		if(packVal<rejected){
			alert("Pack cannot be less than Rejected");
			var supplied = parseFloat($('#Supplied'+rowNo).html());
			$('#'+id).html(supplied);
		}
		else{
			var receivedVal =  packVal ;
			$('#Supplied'+rowNo).html(packVal);
			$('#Received'+rowNo).html(receivedVal);
			$('#Cost'+rowNo).html(receivedVal*priceVal);
		}
	}
	changeTotalCost();
	changeTotalQuantity();
}
function changeSupplyPrice(element){
	var id = $(element).attr("id");
	var rowNo = id.replace('Price','');
	if (isNaN($("#"+id).html()) || $("#"+id).html() == ""){
		var supplied = parseInt($('#Supplied'+rowNo).html());
		$('#'+id).html(supplied);
	}
	var packVal = parseFloat($('#Pack'+rowNo).val());
	if(packVal<=0){
		alert("Pack should not be empty");
		var supplied = parseInt($('#Supplied'+rowNo).html());
		var receivedVal = parseInt($('#Received'+rowNo).html());
		var priceVal = parseFloat($('#Price'+rowNo).val());
		$('#Pack'+rowNo).html(supplied);
		$('#Cost'+rowNo).html(receivedVal*priceVal);
	}else{
		var priceVal = parseFloat($('#Price'+rowNo).val());
		var rejected = parseInt($('#Rejected'+rowNo).html());
		if(packVal<rejected){
			alert("Pack cannot be less than Rejected");
			var supplied = parseInt($('#Supplied'+rowNo).html());
			$('#'+id).html(supplied);
		}
		else{
			var receivedVal =  packVal ;
			$('#Supplied'+rowNo).html(packVal);
			$('#Received'+rowNo).html(receivedVal);
			$('#Cost'+rowNo).html(receivedVal*priceVal);
		}
	}
	changeTotalCost();
	changeTotalQuantity();
}


function changeTotalCost(){
	debugger
	var totalCost=0.0;
	 var totaltax = 0.0;
	$('.Pack').each(function(){
	  var rowNo = $(this).attr("id").replace('Pack','');
	  var cost = $("#Price"+rowNo).val();
	  var received = $('#Pack'+rowNo).val();
	  totalCost = parseFloat(cost)*parseFloat(received)+totalCost;
	  var taxvalue =  parseFloat(($("#tax"+rowNo).html()*$("#Cost"+rowNo).html())/100);
	  totaltax = totaltax + parseFloat(taxvalue);
	 });
		$('#subtotalCostgrn').val(parseFloat(totalCost));
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
			$("#total_taxgrn").val(parseFloat(totaltax).toFixed(2));
			}
		
		var tax = $("#total_taxgrn").val();
		if(tax != "")
			totalCost = parseFloat(totalCost) + parseFloat(tax);
		$("#totalCost").val(parseFloat(totalCost).toFixed(2));
	
	
}
function changeGrnTax(element){
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


function changeTotalQuantity(){
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
	$('#Cost'+rowNo).html(cost*received);
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
	var flowUnder = $("#flowUnder").val();
	
	if(operation == "save"){
		
		var delivered_by = $("#po_reference").val();
		var inspected_by = $("#inspected_by").val();
		/*if(delivered_by == ""){
			$("#po_referenceError").html("PO reference is required");
			return false;
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
	/* if(!re.test($("#date").val())){
			$("#dateError").html("Invalid Date");
			$("#date").focus();
			return false;
	 }*/
	
	var len = $("#productsList tr").length-1;
	var finalObj = {},items = [];

	if(len == 0){
		alert("Add Atleast One Item to Receipt");
		return;
		}
	for(var i=1;i<=len;i++){
		var idAttr = $("#productsList tr:eq("+i+") td:last").attr("id").replace('Del','');
		if($("#flowUnder").val()=="warehouse" || $("#flowUnder").val()=="procurement"){
			var obj = {ean:$("#ean"+idAttr).text(),itemTax:$("#tax"+idAttr).html(),color:$("#color"+idAttr).val(),size:$("#size"+idAttr).val(),category:$("#category"+idAttr).val(),measurementRange:$("#measureRange"+idAttr).val(),productRange:$("#productRange"+idAttr).val(),brand:$("#brandCode"+idAttr).val(),uom:$("#Make"+idAttr).text(),sno:$("#sno"+idAttr).val(),skuId:$("#skuId"+idAttr).val(),pluCode:$("#pluCode"+idAttr).val(),itemName:$("#Name"+idAttr).text(),itemDesc:$("#Desc"+idAttr).text(),handledBy:$("#handledBy"+idAttr).val(),orderPrice:$("#SPrice"+idAttr).text(),supplyPrice:$("#Price"+idAttr).val(),suppliedQty:$("#Pack"+idAttr).val(),orderQty:$("#Requested"+idAttr).text(),totalCost:$("#Cost"+idAttr).text()};
		/*	items.push(obj);
			alert(JSON.stringify(itemDetails))*/
		}
		else{
			//var obj = {skuId:$("#skuId"+idAttr).val(),pluCode:$("#pluCode"+idAttr).val(),item_code:$("#Name"+idAttr).text(),item_description:$("#Desc"+idAttr).text(),price:$("#Price"+idAttr).text(),make:$("#Make"+idAttr).text(),cost:$("#Cost"+idAttr).text(),received:$("#Received"+idAttr).text(),reject:$("#Rejected"+idAttr).text(),supplied:$("#"+idAttr).text(),pack:$("#Supplied"+idAttr).text()};
			var obj = {uom:$("#Make"+idAttr).text(),sno:$("#sno"+idAttr).val(),skuId:$("#skuId"+idAttr).val(),pluCode:$("#pluCode"+idAttr).val(),itemName:$("#Name"+idAttr).text(),itemDesc:$("#Desc"+idAttr).text(),handledBy:$("#handledBy"+idAttr).val(),orderPrice:$("#SPrice"+idAttr).text(),supplyPrice:$("#Price"+idAttr).val(),suppliedQty:$("#Pack"+idAttr).val(),orderQty:$("#Requested"+idAttr).text(),totalCost:$("#Cost"+idAttr).text()};
		}
		items.push(obj);
		
	}
	finalObj.itemDetails = items;
	if($("#po_reference").val() != ""&& poflag == "" ){
		var  op = '<a id="summaryTag"  data-toggle="modal" data-target="#myModalIos"></a>';
		 $("#triggerEvent").append(op);
		 $("#summaryTag" ).trigger( "click" );
		 return
		 $("#triggerEvent").html("");
	}
	if(poflag != undefined)
	$("#toBeClosePO").val(poflag);
	var storeLocation = $("#warehouse_location option:selected").text();
	//finalObj.status=status;
	$("#location").val(storeLocation);
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
	console.log(status);
	var itemDetails = JSON.stringify(finalObj);
	console.info(JSON.stringify(finalObj))
	var contextPath = $("#contextPath").val();
	console.log(operation);
	if(operation=="edit")
		{
	URL = contextPath + "/procurement/updateShipmentReceipt.do";
		}
	else
	URL = contextPath + "/procurement/createShipmentReceipt.do";

	$.ajax({
 			type: "POST",
 			url : URL,
 			data :{ 
          	formData : formData,
            totalQty : totalQty,
           	totalCost : totalCost,
          	itemDetails : itemDetails,
          //  status : status,
           	flowUnder : flowUnder
           },
           beforeSend: function(xhr){                    
   	   			$("#loading").css("display","block");
   	   			$("#mainDiv").addClass("disabled");
   	   		  },
 			success : function(result) {
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


function validatePurchaseOrder(operation,type){
	debugger;
	
	var countv = $("#countv").val();
	
	
	if(countv == 0 ||countv == undefined || countv == null){
		alert("google");
		
	}
	
	
	
	
	
	 if(operation == 'gridupdate'){}
	 else{
		 var re = /^[0-9/]+$/;
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
		  if($("#order_submitted_by").val() == ""){
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
	  }
		 
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
				
				var selectedPack = 0;
				$("."+plu).each(function(){
						selectedPack = selectedPack + parseInt($(this).text());
				});
				if(pack != selectedPack){
					$("#Error").html("Quantity ordered for "+$("#skuId"+idAttr).val()+" is not equal to sum of Quantity allocated to Delivery Locations");
					focusDiv('Error');
					return;
				}
				var obj = {ean:$("#ean"+idAttr).text(),tax:$("#tax"+idAttr).html(),category:$("#category"+idAttr).val(),measurementRange:$("#measureRange"+idAttr).val(),productRange:$("#productRange"+idAttr).val(),brand:$("#brandCode"+idAttr).val(),skuId:$("#skuId"+idAttr).val(),pluCode:$("#pluCode"+idAttr).val(),itemId:$("#pluCode"+idAttr).val(),itemDesc:$("#itemDesc"+idAttr).text(),itemPrice:$("#itemPrice"+idAttr).text(),quantity:$("#quantity"+idAttr).text(),requestedQty:$("#quantity"+idAttr).text(),totalCost:$("#totalCost"+idAttr).text(),uom:$("#make"+idAttr).text(),availableQty:$("#model"+idAttr).text(),color:$("#color"+idAttr).text(),size:$("#size"+idAttr).text()};
				itemDetails.push(obj);
			
				$(".locationRow").each(function(){
					var locationId = $(this).attr("id");
					locationId = locationId.replace('locations','');
					if(locationId != 0){
						var selectedQty = parseInt($("#relatedItemsTable"+locationId+" tbody").find("."+plu).text());
						if(selectedQty > 0 && selectedQty != null && selectedQty != "null"){
							var shipmentLocationObj = {skuId:$("#skuId"+idAttr).val(),skuName:$("#itemDesc"+idAttr).text(),pluCode:$("#pluCode"+idAttr).val(),storeLocation:$("#location"+locationId).val(),quantity:selectedQty,skuPrice:$("#itemPrice"+idAttr).text()};
							pOShipmentLocations.push(shipmentLocationObj);
						}
					}
				});
			} 
	 }
	

		 
		
		
		/*var items = JSON.stringify(itemDetails);
		var deliveryLocations = JSON.stringify(pOShipmentLocations);
		$("#whPurchaseItems").val(items);
		$("#deliveryLocations").val(deliveryLocations);*/
		 var storeLocation = $("#warehouseLocation option:selected").text();
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
			finalObj.order_submitted_by = $("#order_submitted_by").val();
			finalObj.order_approved_by = $("#order_approved_by").val();
			finalObj.storeLocation = $("#storeLocation").val();
			finalObj.warehouse_location = $("#storeLocation").val();
			finalObj.shipping_mode = $("#shipping_mode").val();
			if(type == "new"){
				finalObj.status = $("#orderStatus").val();	
			}
			else{
				if($('#nostatus').val()=='nostatus'){
					 finalObj.status = $('#defaultstatus').val();
	     		 }
				 else if($('#statusissue').val() == ''){
					 finalObj.status = $('#defaultstatus').val();
    			 }
	     		 else{
	     			finalObj.status = $('#statusissue').val(); 
	     		 }
				
			}
			 if(operation == 'gridupdate'){
		    	
		    	 finalObj.poRef = type;
		    	 var quantity= [],skuId = [], itemPrice = [];
			 var reqid = type;
		 		$('.'+reqid).each(function(){
		 			var id= $(this).attr("id").replace('quantity','');
		 		/*	alert(id)
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
			if($("#shipping_cost").val() == ""){
				$("#Error").html("Enter Shippment Charges")	
				focusDiv("Error");
				return;
			}
				
			
			else
				finalObj.shipping_cost = $("#shipping_cost").val();
			if($("#total_tax").val() == "")
				finalObj.total_tax = "0.0";
			else
				finalObj.total_tax = $("#total_tax").val();
			if($("#discount").val() == "")
				finalObj.discount = "0.0";
			else
				finalObj.discount = $("#discount").val();
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



function searchPurchaseOrders(name,searchCategory,index){
	 var location = "";
	 var startDate = "";
	 var endDate = "";
	 debugger
	 if(name == "")
			name = $("#searchPurchaseOrders").val();
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
		 URL = contextPath + "/procurement/searchPurchaseOrders.do";
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
					itemwise : itemwise,
					supplier : supplier,
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




function viewPurchaseOrderDetails(receiptRefNo,operation){
	var op = $("#operation").val();
	var location = $("#warehouse_location").val();
	var contextPath = $("#contextPath").val();
	URL = contextPath + "/procurement/viewPurchaseOrderDetails.do";
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
				//$("#tab_1").html(result);
				$("#right-side").html(result);
				//activeMenu(id);
				$("#operation").val(op);
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
  	 URL = contextPath + "/procurement/editShipmentReceiptDetails.do";
		$.ajax({
			type: "GET",
			url : URL,
			data : {
				receiptRefNo : receiptRefNo,
				location : location,
				flowUnder : flowUnder
				
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
  	 URL = contextPath + "/procurement/viewShipmentReceiptDetails.do";
		$.ajax({
			type: "GET",
			url : URL,
			data : {
				receiptRefNo : receiptRefNo,
				flowUnder : flowUnder
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


function searchShipmentReceipt(name,searchCategory,index){
	 var location = "";
	 var startDate = "";
	 var endDate = "";
	 var flowUnder = $("#flowUnder").val();
	 debugger
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
					supplier : supplier
				},
				beforeSend: function(xhr){                    
		   	   		$("#loading").css("display","block");
		   	   		$("#mainDiv").addClass("disabled");
		   	   	},
				success : function(result) {
					$('#right-side').html(result);
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
		 var selected = "";
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
	   			debugger
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
	
