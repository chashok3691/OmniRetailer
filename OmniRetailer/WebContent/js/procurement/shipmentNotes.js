$(".clearError").on('input',function(e){
	$(".Error").html("");
	var id = $(this).attr("id");
	if($("#"+id+"Error").length > 0)
		$("#"+id+"Error").html("");
});

function viewShipmentNoteDetails(shipmentNoteRef,operation){
	 //purpose:for checking internet conection
	var online = window.navigator.onLine;
  	if(!online)
  	{
  	alert("check your internet connection,please try agian after some time");
  	return;
  	}
	var flowUnder = $("#flowUnder").val();
	 var contextPath = $('#contextPath').val();
	 
	//added by manasa
	 var formData={}
	 formData.location = $("#outletLocation").val();
	 formData.startDate = $("#from").val();
	 formData.endDate = $("#to").val();
	 
	 var formData = JSON.stringify(formData);
	 
	 
	 var URL = contextPath + "/procurement/viewShipmentNoteDetails.do";
	 $.ajax({
		type : "GET",
		url : URL,
		data : {
			shipmentNoteRef : shipmentNoteRef,
			operation : operation,
			flowUnder : flowUnder,
			formData : formData
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


function searchSuppliers(name, searchCategory){
	 //purpose:for checking internet conection
	debugger;
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
	var id= $(element).attr("id");
	$("#supplier_Id").val(id);
	var label = $(element).children("a").text();
	$("#searchSupplier").val(label);
	 $(".services").hide();
	 $("."+type).html("");
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


function searchPoRefs(name, searchCategory){
	 //purpose:for checking internet conection
	var online = window.navigator.onLine;
  	if(!online)
  	{
  	alert("check your internet connection,please try agian after some time");
  	return;
  	}
	 var contextPath = $("#contextPath").val(); 
	 var storeLocation = "";
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

function getId(element,type){
	var id= $(element).attr("id");
	if(type == "apparel")
		getItemDetails(id,type);
	else if(type == "poRef"){
		$("#po_reference").val(id);
		$("#selected_po_ref").val(id);
		getPoItems(id);
	}
	 $(".services").hide();
	 $("."+type).html("");
}

function deleteItemDetails(element){
	var id = $(element).attr("id").replace('Img','');
	var plu = $("#pluCode"+id).val();
	$("."+plu).each(function(){
		$(this).parent().remove();
	 });
	$('#dynamicdiv'+id).remove();
	var slNo = 1; 
	 $('.slno').each(function(){
		$(this).text(slNo);
		slNo = parseInt(slNo) + 1;
	});
//	changeTotalOrderCost();
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
	 var storeLocation = $("#outletLocation").val();
	 var finalObj = {};
	 finalObj.shipmentNoteRef = $("#shipmentNoteRef").val();
	 finalObj.shipmentRef = $("#shipmentRef").val();
	 finalObj.supplierId = $("#supplier_Id").val();
	 finalObj.supplierName = $("#searchSupplier").val();
	 finalObj.shippedDateStr = $("#shipmentDate").val();
	 finalObj.arrivalDateStr = $("#arrivalDate").val();
	 finalObj.poRef = $("#selected_po_ref").val();
	 finalObj.shipmentFrom = $("#shippedFrom").val();
	 finalObj.transporterCode = $("#transporterCode").val();
	 finalObj.transporterName = $("#transporterName").val();
	 finalObj.carrierNo = $("#carrierNo").val();
	 finalObj.deliveryPerson = $("#deliveryPerson").val();
	 var defaultCountry = $("#defaultCountry").val().trim();
	 var phoneNumber = $("#phoneNumber").val().trim();
	 if(defaultCountry != "" && phoneNumber != ""){
		 $("#phone").val(defaultCountry+"-"+phoneNumber);
	 }
	 finalObj.contactNumber = $("#phone").val();
	 finalObj.status = $("#status").val();
	 finalObj.shipmentTerms = $("#shipmentTerms").val();
	 finalObj.shipmentComments = $("#shipmentComments").val();
	 finalObj.flowUnder = $("#flowUnder").val();
	 URL = contextPath + "/procurement/addPoItemsToShipmentNote.do";
	 var formData = JSON.stringify(finalObj);
//		console.log(formData);
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
				$("#outletLocation").val(storeLocation);
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


function searchProducts(name, searchCategory){
	 //purpose:for checking internet conection
	var online = window.navigator.onLine;
  	if(!online)
  	{
  	alert("check your internet connection,please try agian after some time");
  	return;
  	}
	var storeLocation = "";
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

	 
 function appendProducts(productsList, searchCategory){
	 $("."+searchCategory).html('');
	 var op = '';
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
	 $("."+searchCategory).html(op);
	 $("."+searchCategory).show();
	 
 }
 
 function getItemDetails(skuId,searchCategory){
	 //purpose:for checking internet conection
		var online = window.navigator.onLine;
	  	if(!online)
	  	{
	  	alert("check your internet connection,please try agian after some time");
	  	return;
	  	}
		 var contextPath = $("#contextPath").val();
		 var storeLocation = "";
	

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
					var row = '<tr id=price'+i+' style="margin-top:5px;cursor:pointer" onclick=getItemPrice(this) ><td>'+skuList[i].description+'</td><td>'+price+'</td></tr>';
					$("#itemsList tbody").append(row);
				}
			}
			var  op = '<a id="selectPrice"  data-toggle="modal" data-target="#items-modal"></a>';
			 $("#triggerEvent").append(op);
			 $("#selectPrice" ).trigger("click");
			 $("#triggerEvent").html("");
		}
		else{
			addItem(skuList[0]);
		}
 }
 
 function addItem(sku){
	 var contextPath = $("#contextPath").val();
	 var len = parseInt($("#productsList tr").length);
		if (len != 1)
			len = parseInt($("#productsList tr:last").attr("id").replace('dynamicdiv', '')) + 1;
		for (var i = 1; i <= len; i++) {
			if ($("#skuId" + i).val() == sku.skuId && $("#itemPrice"+i).text() == sku.price) {
				var pack =  parseInt($("#quantity"+i).text())+1;
    			 $("#quantity"+i).text(pack);
    			 var cost =  parseFloat($("#itemPrice"+i).text());
    			 $("#totalCost"+i).text(pack*cost);
//    			 changeTotalOrderCost();
        		 return;
			}
		}
		var description = null;
		if (sku.description != "" && sku.description != null)
			description = sku.description;
		else
			description = $("#desc").val();
		var make = sku.make;
		if(make == "" || make == null)
			make = "_";
		var model = sku.model;
		if(model == "" || model == null)
			model = "_";
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
		var row = "<tr id='dynamicdiv"+len+"' style='margin-top:5px;'><td class='slno'>"+slNo+"</td><td id='itemId"+len+"'>"+sku.skuId+"</td>" +
 		"<input type='hidden' id='skuId"+len+"' value='"+sku.skuId+"'/>" +
 		"<input type='hidden' id='pluCode"+len+"' value='"+sku.pluCode+"'/>" +
 		"<td id='itemDesc"+len+"'>"+description+"</td><td class='Price' id='itemPrice"+len+"'>"+sku.price+"</td>" +
 		"<td id='quantity"+len+"' class='Pack' onBlur='changeOrderedPack(this);' onkeypress='return (this.innerText.length < 10)' contenteditable='true'>1</td><td class='cost' id='totalCost"+len+"'>"+sku.price+"</td>" +
 		"<td id='make"+len+"'>"+make+"</td><td id='model"+len+"'>"+model+"</td><td id='color"+len+"'>"+color+"</td>" +
 		"<td id='size"+len+"'>"+size+"</td><td id='Del"+ len +"' ><img id='Img"+ len +"' src='"+contextPath+"/images/itemdelete.png' style='width:15%;cursor:pointer;' onclick='deleteItemDetails(this);' title='Delete "+sku.skuId+"'/>" +
 		"</td></tr>";
		$("#productsList tbody").append(row);
//		changeTotalOrderCost();
}
 
 function changeOrderedPack(element){
		var id = $(element).attr("id");
		if (isNaN($("#"+id).html()) || $("#"+id).html() == "")
			$('#'+id).html("1");
		var rowNo = id.replace('quantity','');
		var packVal = parseInt($('#quantity'+rowNo).html());
		if(packVal<=0){
			alert("Pack should not be empty");
			var priceVal = parseFloat($('#itemPrice'+rowNo).html());
			$('#quantity'+rowNo).html(1);
			$('#totalCost'+rowNo).html(priceVal);
		}else{
			var priceVal = parseFloat($('#itemPrice'+rowNo).html());
			$('#totalCost'+rowNo).html(packVal*priceVal);
		}
//		changeTotalOrderCost();
	}
 
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
 	 if(locationId == null || locationId == "")
		 return;
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
	}

 
 function changeSelectedPack(element){
		var id = $(element).attr("id");
		if (isNaN($("#"+id).html()) || $("#"+id).html() == "")
			$('#'+id).html("1");
		var rowNo = id.replace('selectedQuantity','');
		var packVal = parseInt($('#selectedQuantity'+rowNo).html());
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
		var contextPath = $("#contextPath").val();
		var id = $(element).attr("id").replace('popup','');
		$("#selectedLocationId").val(id);
		$("#selectedItemsList tbody").html("");
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
			 if(type == undefined)
				 appendPendingSkus(pluCode);
		 }else{
			 
			 for(var i=1;i<=len;i++){
				 var idAttr = $("#productsList tr:eq("+i+") td:last").attr("id");
				 idAttr = idAttr.replace('Del','');
				 var pack = parseInt($("#quantity"+idAttr).text());
				 var selectedPack = 0;
				 $("."+$("#pluCode"+idAttr).val()).each(function(){
					 selectedPack = selectedPack + parseInt($(this).text());
				 });
				 selectedPack = pack - selectedPack;
				 var totalCost = parseFloat($("#itemPrice"+idAttr).text()) * selectedPack;
				 var row = "<tr id='selected"+i+"' style='margin-top:5px;'><td class='selecetedSlno'>"+i+"</td><td id='selectedItemId"+i+"'>"+$("#itemId"+idAttr).text()+"</td>" +
				 "<input type='hidden' id='selectedSkuId"+i+"' value='"+$("#skuId"+idAttr).val()+"'/>" +
				 "<input type='hidden' id='selectedPluCode"+i+"' value='"+$("#pluCode"+idAttr).val()+"'/>" +
				 "<td id='selectedItemDesc"+i+"'>"+$("#itemDesc"+idAttr).text()+"</td><td id='selectedItemPrice"+i+"'>"+$("#itemPrice"+idAttr).text()+"</td>" +
				 "<td id='selectedQuantity"+i+"' class='selectedPack "+$("#pluCode"+idAttr).val()+"' onBlur='changeSelectedPack(this);' onkeypress='return (this.innerText.length < 10)' contenteditable='true'>"+selectedPack+"</td><td class='selectedCost' id='selectedTotalCost"+i+"'>"+totalCost+"</td>" ;
					 row = row +"<td id='selectedDel"+ i +"' ><img id='selectedImg"+ i +"' src='"+contextPath+"/images/itemdelete.png' style='width:15%;cursor:pointer;' onclick='deleteSelectedItemDetails(this);' title='Delete "+$("#skuId"+idAttr).val()+"'/></td>"; 
				row = row + "</tr>";
				 $("#selectedItemsList tbody").append(row);
			 }
		 }
		var  op = '<a id="selectLocation"  data-toggle="modal" data-target="#selected-items-modal"></a>';
		 $("#triggerEvent").append(op);
		 $("#selectLocation" ).trigger( "click" );
		 $("#triggerEvent").html("");
	}

	function appendPendingSkus(pluCode){
		var contextPath = $("#contextPath").val();
		 var len = $("#productsList tr").length-1;
		 var pluCodeLen = pluCode.length + 1;
		 for(var i=1;i<=len;i++){
			 var idAttr = $("#productsList tr:eq("+i+") td:last").attr("id");
			 idAttr = idAttr.replace('Del','');
			 var plu = $("#pluCode"+idAttr).val();
			 if ($.inArray(plu, pluCode) < 0)
			 {
				 var pack = parseInt($("#quantity"+idAttr).text());
				 var selectedPack = 0;
				 $("."+$("#pluCode"+idAttr).val()).each(function(){
					 selectedPack = selectedPack + parseInt($(this).text());
				 });
				 selectedPack = pack - selectedPack;
				 var totalCost = parseFloat($("#itemPrice"+idAttr).text()) * selectedPack;
				 var row = "<tr id='selected"+pluCodeLen+"' style='margin-top:5px;'><td class='selecetedSlno'>"+pluCodeLen+"</td><td id='selectedItemId"+pluCodeLen+"'>"+$("#itemId"+idAttr).text()+"</td>" +
				 "<input type='hidden' id='selectedSkuId"+pluCodeLen+"' value='"+$("#skuId"+idAttr).val()+"'/>" +
				 "<input type='hidden' id='selectedPluCode"+pluCodeLen+"' value='"+$("#pluCode"+idAttr).val()+"'/>" +
				 "<td id='selectedItemDesc"+pluCodeLen+"'>"+$("#itemDesc"+idAttr).text()+"</td><td id='selectedItemPrice"+pluCodeLen+"'>"+$("#itemPrice"+idAttr).text()+"</td>" +
				 "<td id='selectedQuantity"+pluCodeLen+"' class='selectedPack "+$("#pluCode"+idAttr).val()+"' onBlur='changeSelectedPack(this);' onkeypress='return (this.innerText.length < 10)' contenteditable='true'>"+selectedPack+"</td><td class='selectedCost' id='selectedTotalCost"+pluCodeLen+"'>"+totalCost+"</td>" +
				 "<td id='selectedDel"+pluCodeLen+"' ><img id='selectedImg"+pluCodeLen+"' src='"+contextPath+"/images/itemdelete.png' style='width:15%;cursor:pointer;' onclick='deleteSelectedItemDetails(this);' title='Delete "+$("#skuId"+idAttr).val()+"'/>" +
				 "</td></tr>";
				 $("#selectedItemsList tbody").append(row);
				 pluCodeLen = pluCodeLen + 1;
			 }
		 }
	}

	function saveSelectedSkus(){
		var selectedLocationId = $("#selectedLocationId").val();
		var selectedSkuContent = $("#selectedItemsList tbody").prop('innerHTML');
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
 
	function daydiff(first, second) {
	    return (second-first)/(1000*60*60*24);
	}
	function parseDateDDMMYYYY(str){
		var mdy = str.split('/');
		return new Date(mdy[2], mdy[1]-1, mdy[0]);
	}
 
 function validateShipmentNote(status,operation){
	 if($("#supplierNameError").text() != ""){
			$("#supplierNameError").html("Supplier Name doesn't exist");
			return false;
		}
	 /* if($("#searchSupplier").val().trim() == ""){
		  $("#supplierNameError").html("Enter Supplier Name");
		  $("#searchSupplier").focus();
		  return;
	  }*/
	  if($("#supplier_Id").val() == ""){
		  $("#supplierNameError").html("Supplier Name doesn't exist");
		  $("#searchSupplier").focus();
		  return;
	  }
	 if($("#shipmentRef").val() == ""){
		 $("#shipmentRefError").html("Shipment Ref is Required");
		 $("#shipmentRef").focus();
		 return;
	 }
	
	 if(parseInt($("#shipmentRef").val().length)>18){
			 $("#shipmentRef").focus();
			 $("#shipmentRefError").html("Shipment Ref can't exceeds 18 Characters");
				return;
		}else{
	   	 $("#shipmentRefError").html(" ");
	 }
	 
	 
	 if($("#shippedFrom").val() == ""){
		 $("#shippedFromError").html("Shipped From is Required");
		 $("#shippedFrom").focus();
		 return;
	 }
	 var re = /^[0-9/]+$/;
	 if($("#arrivalDate").val().trim() == ""){
			$("#arrivalDateError").html("Enter a Date");
			 $("#arrivalDate").focus();
			//focusDiv('arrivalDateError');
			return;
	 }
	 if(!re.test($("#arrivalDate").val())){
			$("#arrivalDateError").html("Invalid Date");
			//focusDiv('arrivalDateError');
			 $("#arrivalDate").focus();
			return;
	 }
	 if($("#shipmentDate").val().trim() == ""){
		    $("#shipmentDate").focus();
			$("#shipmentDateError").html("Enter a Date");
			//focusDiv('shipmentDateError');
			return;
	 }
	 if(!re.test($("#shipmentDate").val())){
			$("#shipmentDateError").html("Invalid Date");
			focusDiv('shipmentDateError');
			return;
	 }
	 
	 var noOfDays = daydiff(parseDateDDMMYYYY($('#shipmentDate').val()), parseDateDDMMYYYY($('#arrivalDate').val()));
	 if(noOfDays < 0){
		 $("#arrivalDateError").html("Arrival Date can't be less than Shipment Date");
		 focusDiv('arrivalDateError');
		 return;
	 }
	 
	 if(parseInt($("#transporterCode").val().length)>30){
		 $("#transporterCode").focus();
		 $("#transporterCodeError").html("Transporter Code can't exceeds 30 Characters");
			return;
	}else{
   	 $("#transporterCodeError").html(" ");
 }
	 
	 if(parseInt($("#deliveryPerson").val().length)>40){
		 $("#deliveryPerson").focus();
		 $("#deliveryPersonError").html("Delivery Person can't exceeds 40 Characters");
			return;
	}else{
   	 $("#deliveryPersonError").html(" ");
 }
	 
	 if(parseInt($("#transporterName").val().length)>100){
		 $("#transporterName").focus();
		 $("#transporterNameError").html("Transporter Name can't exceeds 100 Characters");
			return;
	}else{
   	 $("#transporterNameError").html(" ");
 }
	 
	 if(parseInt($("#carrierNo").val().length)>30){
		 $("#carrierNo").focus();
		 $("#carrierNoError").html("Carrier No can't exceeds 30 Characters");
			return;
	}else{
   	 $("#carrierNoError").html(" ");
 }
	 
	 if(parseInt($("#shipmentTerms").val().length)>250){
		 $("#shipmentTerms").focus();
		 $("#shipmentTermsError").html("Shipment Terms can't exceeds 250 Characters");
			return;
	}else{
   	 $("#shipmentTermsError").html(" ");
 }
	 
	 if(parseInt($("#shipmentComments").val().length)>250){
		 $("#shipmentComments").focus();
		 $("#shipmentCommentsError").html("Shipment Terms can't exceeds 250 Characters");
			return;
	}else{
   	 $("#shipmentCommentsError").html(" ");
 }
	 
	 
	 var len = $("#productsList tr").length-1;
	  var shipmentNoteItems = [];
	  var shipmentNoteLocations = [];
		if(len == 0){
			$("#Error").html("Add Atleast One Item to Order");
			focusDiv("Error");
			return;
			}
		$("#selectedItemsList tbody").html("");
		for(var i=1;i<=len;i++){
			var idAttr = $("#productsList tr:eq("+i+") td:last").attr("id");
			idAttr = idAttr.replace('Del','');
			//debugger
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
			var obj = {skuId:$("#skuId"+idAttr).val(),pluCode:$("#pluCode"+idAttr).val(),itemId:$("#itemId"+idAttr).text(),itemDesc:$("#itemDesc"+idAttr).text(),itemPrice:$("#itemPrice"+idAttr).text(),quantity:$("#quantity"+idAttr).text(),totalCost:$("#totalCost"+idAttr).text(),make:$("#make"+idAttr).text(),model:$("#model"+idAttr).text(),color:$("#color"+idAttr).text(),size:$("#size"+idAttr).text()};
			shipmentNoteItems.push(obj);
			$(".locationRow").each(function(){
				var locationId = $(this).attr("id");
				locationId = locationId.replace('locations','');
				if(locationId != 0){
					var selectedQty = parseInt($("#relatedItemsTable"+locationId+" tbody").find("."+plu).text());
					if(selectedQty > 0 && selectedQty != null && selectedQty != "null"){
						var shipmentLocationObj = {skuId:$("#skuId"+idAttr).val(),skuName:$("#itemDesc"+idAttr).text(),pluCode:$("#pluCode"+idAttr).val(),storeLocation:$("#location"+locationId).val(),quantity:selectedQty,skuPrice:$("#itemPrice"+idAttr).text()};
						shipmentNoteLocations.push(shipmentLocationObj);
					}
				}
			});
		}
	 
	 var contextPath = $("#contextPath").val();
	 var storeLocation = $("#outletLocation").val();
	 var finalObj = {};
	 if($("#shipmentNoteRef").val() != "")
		 finalObj.shipmentNoteRef = $("#shipmentNoteRef").val();
	 finalObj.shipmentRef = $("#shipmentRef").val();
	 finalObj.supplierId = $("#supplier_Id").val();
	 finalObj.supplierName = $("#searchSupplier").val();
	 finalObj.shippedDateStr = $("#shipmentDate").val()+" 00:00:00";
	 finalObj.arrivalDateStr = $("#arrivalDate").val()+" 00:00:00";
	 if($("#selected_po_ref").val() != "")
		 finalObj.poRef = $("#selected_po_ref").val();
	 finalObj.shipmentFrom = $("#shippedFrom").val();
	 finalObj.transporterCode = $("#transporterCode").val();
	 finalObj.transporterName = $("#transporterName").val();
	 finalObj.carrierNo = $("#carrierNo").val();
	 finalObj.deliveryPerson = $("#deliveryPerson").val();
	 var defaultCountry = $("#defaultCountry").val().trim();
	 var phoneNumber = $("#phoneNumber").val().trim();
	 if(defaultCountry != "" && phoneNumber != ""){
		 $("#phone").val(defaultCountry+"-"+phoneNumber);
	 }
	 finalObj.contactNumber = $("#phone").val();
	 finalObj.status = status;
	 finalObj.shipmentTerms = $("#shipmentTerms").val();
	 finalObj.shipmentComments = $("#shipmentComments").val();
	 finalObj.shipmentNoteItems = shipmentNoteItems;
	 finalObj.shipmentNoteLocations = shipmentNoteLocations;
	 finalObj.flowUnder = $("#flowUnder").val();
	 if(operation == "new")
			URL = contextPath + "/procurement/createShipmentNote.do";
		else
			URL = contextPath + "/procurement/updateShipmentNote.do";
	 var formData = JSON.stringify(finalObj);
//		console.log(formData);
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
				$("#outletLocation").val(storeLocation);
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
 
 function searchShipmentNotes(name,searchCategory,index){
		var location = ""
		if($("#outletLocation").length > 0)
			location = $("#outletLocation").val();
		alert(location)
		var maxRecords = 10;
		if($("#maxRecords").length > 0)
			maxRecords = $("#maxRecords").val();
		var startDate = "";
		 var endDate = "";
		 if($("#from").val() != "" && $("#to").val() != ""){
			var noOfDays = daydiff(parseDate($('#from').val()), parseDate($('#to').val()));
			 if(noOfDays < 0){
				 alert("Start Date can't be less than End Date");
				 return;
			 }
			 startDate = $("#from").val() + " 00:00:00";
			 endDate = $("#to").val() + " 23:59:59";
		}else if($("#from").val() != "")
			 startDate = $("#from").val() + " 00:00:00";
		else if($("#to").val() != "")
				endDate = $("#to").val() + " 23:59:59";
		 var contextPath = $("#contextPath").val();
		 var flowUnder = $("#flowUnder").val();
		 URL = contextPath + "/procurement/searchShipmentNotes.do";
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
					flowUnder : flowUnder
				},
				beforeSend: function(xhr){                    
		   	   		$("#loading").css("display","block");
		   	   		$("#mainDiv").addClass("disabled");
		   	   	},
				success : function(result) {
					$('#right-side').html(result);
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
 
 