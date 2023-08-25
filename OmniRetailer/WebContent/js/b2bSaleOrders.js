var locationsDivContent = null;
function setLocationsDivContent(){
	locationsDivContent = $('#locations').prop('innerHTML');
}
function deleteDiv(element){
	$(".Error").html("");
	var id = $(element).attr("id").replace('img','');
	$('#locations'+id).remove();
}
$("#deliveryLocation").change(function(){
	$("#locationAddError").html("");
	$(".Error").html("");
});

$(".clearError").on('input',function(e){
	$(".Error").html("");
});

function clearError(){
	$(".Error").html("");
}

function getLocationDetails(){
	 //purpose:for checking internet conection
	var online = window.navigator.onLine;
  	if(!online)
  	{
  	alert("check your internet connection,please try agian after some time");
  	return;
  	}
	$(".Error").html("");
	var locationId = $("#fromlocation").val();
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
	$("#fromStreetName").val(locationBean.address);
	$("#fromAddress").val(locationBean.area);
	$("#fromCity").val(locationBean.city);
	$("#fromState").val(locationBean.state);
	$("#fromCountry").val(locationBean.country);
	$("#fromContactNum").val(locationBean.officePhone);
	$("#fromEmail").val(locationBean.officeMailId);
	$("#fromZipCode").val(locationBean.pin);
}


//purpose:for checking internet conection
function searchProducts(name, searchCategory){
	debugger;
	$(".Error").html("");
	 //purpose:for checking internet conection
	var online = window.navigator.onLine;
  	if(!online)
  	{
  	alert("check your internet connection,please try agian after some time");
  	return;
  	}
	var storeLocation = $("#fromlocation option:selected").text();
	var contextPath = $("#contextPath").val();
	var type = $("#fromlocation").val();
	if(type=="Warehouse"){
		URL = contextPath + "/inventorymanager/searchWarehouseProducts.do";
	}else{
		URL = contextPath + "/inventorymanager/searchProducts.do";
	}
		
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
 
 function getId(element,type){
		var id= $(element).attr("id");
		var description = null;
		description =  $("#"+id).children("a").text();
		description = description.split(' ( ');
		description = description[0];
		$("#desc").val(description);
		getItemDetails(id,type);
		$(".services").hide();
		$("."+type).html("");
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
		 var storeLocation = $("#fromlocation option:selected").text();
		 var WarehouseReturnflag=$("#whreturnflag").val();
		if(WarehouseReturnflag == "" || WarehouseReturnflag == undefined || WarehouseReturnflag == null){
			WarehouseReturnflag="";
   		}
		 var type = $("#fromlocation").val();
		 if(type=="Warehouse"){
			 URL = contextPath + "/inventorymanager/getWarehouseSkuDetails.do";
			}else{
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
       				appendItemDetails(result);
       				$('.borderClass').css("display","none");
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
	 var parsedJson = jQuery.parseJSON(skuDetails);
		$("#searchItems").val("");
		skuList = parsedJson.skuLists;
		if(skuList.length > 0){
			var sku = skuList[0];
			var contextPath = $("#contextPath").val();
			 var len = parseInt($("#productsList tr").length);
				if (len != 1)
					len = parseInt($("#productsList tr:last").attr("id").replace('dynamicdiv', '')) + 1;
				for (var i = 1; i <= len; i++) {
					if ($("#skuId" + i).val() == sku.skuId) {
						alert("Item Already Added");
		        		return;
					}
				}
				var description = null;
				if (sku.description != "" && sku.description != null)
					description = sku.description;
				else
					description = $("#desc").val();
				var uom = sku.uom;
				if(uom == "" || uom == null)
					uom = "_";
				
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
				 
				 
				 
					var tax = sku.tax;
					var taxRate=0.0;
					if(tax!=null){
						if(tax.length>0){
							
							if(tax[0].taxType != "Percentage")
								taxRate=tax[0].taxRate;
							else
								taxRate=tax[0].taxRate*2;
						  }
					}
						
					
					
					
					
					 var  taxamount=0.0;
					 
					 if(sku.itemTaxExclusive == false || sku.itemTaxExclusive == true){
						 
						 if(tax!=null)
								if(tax.length>0){
									if(tax[0].taxType == "Percentage")
									taxamount = parseFloat(sku.price - (sku.price * ( 100 / ( 100 + parseFloat(taxRate))))).toFixed(2);
									 if(tax[0].taxType == "Fixed")
										 taxamount = tax[0].taxRate;
								}
					}else{
						 if(tax!=null)
								if(tax.length>0){
									if(tax[0].taxType == "Percentage")
									taxamount = parseFloat(((sku.price)*taxRate)/100).toFixed(2);
									 if(tax[0].taxType == "Fixed")
										 taxamount = tax[0].taxRate;
								}
						}

							
						
				 
				 
				 
				var row = "<tr id='dynamicdiv"+len+"' style='margin-top:5px;'><td class='slno'>"+slNo+"</td><td id='itemId"+len+"'>"+sku.skuId+"</td>" +
		 		
		 		"<input type='hidden' id='pluCode"+len+"' value='"+sku.pluCode+"'/>" +
		 		"<input type='hidden' id='itemPrice"+len+"' value='"+sku.price+"'/>" +
		 		"<input type='hidden' id='make"+len+"' value='"+make+"'/>" +
		 		"<input type='hidden' id='model"+len+"' value='"+model+"'/>" +
		 		"<input type='hidden' id='color"+len+"' value='"+color+"'/>" +
		 		"<input type='hidden' id='taxrate"+len+"' value='"+taxRate+"'/>" +
		 		"<td id='itemDesc"+len+"'>"+description+"</td><td id='uom"+len+"'>"+uom+"</td>" +
		 		"<td id='size"+len+"'>"+size+"</td><td id='itemPrice"+len+"'>"+sku.price+"</td>" +
		 		
		 		
		 		"<td  onkeypress='return (this.innerText.length < 10)' contenteditable='true'><input id='quantity"+len+"' onchange='PreventEnter(this);'  onBlur='changeOrderedPack(this);'   type='number' value='1' style='height: 100%;border: none;text-align: center;width: 100%' min='1' maxlength='8'></td>"+
		 		
		 		"<td id='discount"+len+"'>"+0+"</td><td id='tax"+len+"'>"+taxamount+"</td>" +
		 		"<td id='cost"+len+"'>"+sku.price+"</td>" +
		 		"<td id='Del"+ len +"' ><img id='Img"+ len +"' src='"+contextPath+"/images/itemdelete.png' style='width:25px;cursor:pointer;' onclick='deleteItemDetails(this);' title='Delete "+sku.skuId+"'/>" +
		 		"</td></tr>";
				$("#productsList tbody").append(row);
				grandTotals();
		}
 }
 function changeOrderedPack(element){
	 debugger;
	 $(".Error").html("");
	 var id = $(element).attr("id");
	 if (isNaN($("#"+id).html()) || $("#"+id).html() == "")
		$('#'+id).html("1");
	 
	 var rowNo = id.replace('quantity','');
	 var packVal = parseFloat($('#quantity'+rowNo).val());
	 var cost = parseFloat($('#itemPrice'+rowNo).val());
	 var taxRate = parseFloat($('#taxrate'+rowNo).val());
	var totalCostValue=packVal*cost;
	
	 var taxAmt = totalCostValue - (totalCostValue * ( 100 / ( 100 + parseFloat(taxRate))));
	
	$('#tax'+rowNo).html(parseFloat(taxAmt).toFixed(2));
	$('#cost'+rowNo).html(parseFloat(totalCostValue).toFixed(2));
	grandTotals();
 }
 
 

 function grandTotals(){
 	debugger;
 	var totalCost=0;
 	var totalTax=0;
 	var totalDiscount=0;
 	
 	var rowCount = $('#productsList tr').length-1;
 	for(var i=1;i<rowCount+1;i++){
 		 var cost = $("#cost"+i).html();
 		 totalCost = parseFloat(cost)+totalCost;
 		 
 		 var tax = $("#tax"+i).html();
 		 totalTax = parseFloat(tax)+totalTax;
 		 
 		 var discount = $("#discount"+i).html();
 		 totalDiscount = parseFloat(discount)+totalDiscount;
 	}
 	
 
 	
 	$("#sub_total").val(totalCost-totalTax);
 	$("#tax").val(totalTax);
 	$("#discounts").val(totalDiscount);
 	$("#net_value").val(totalCost);
 }


 
 function fillRemarks(element){
	 
 }
 
 function deleteItemDetails(element){
	    $(".Error").html("");
		var id = $(element).attr("id").replace('Img','');
		
		$('#dynamicdiv'+id).remove();
		var slNo = 1; 
		 $('.slno').each(function(){
			$(this).text(slNo);
			slNo = parseInt(slNo) + 1;
		});
		 grandTotals();
	}
 
 
 function appendLocationsDiv(){
	 //purpose:for checking internet conection
		var online = window.navigator.onLine;
	  	if(!online)
	  	{
	  	alert("check your internet connection,please try agian after some time");
	  	return;
	  	}
	 $(".Error").html("");
	 var locationId = $("#deliveryLocation").val();
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
	
	currentLocationsDivContent = currentLocationsDivContent.replace('pin0','pin'+id);
	currentLocationsDivContent = currentLocationsDivContent.replace('state0','state'+id);
	currentLocationsDivContent = currentLocationsDivContent.replace('country0','country'+id);
	
	
	$(".locationsAdded").append(currentLocationsDivContent);
	$("#location"+id).val(locationBean.locationId);
	$("#street"+id).val(locationBean.address);
	$("#area"+id).val(locationBean.area);
	$("#city"+id).val(locationBean.city);
	
	$("#pin"+id).val(locationBean.pin);
	$("#state"+id).val(locationBean.state);
	$("#country"+id).val(locationBean.country);
	
}



function deleteSelectedItemDetails(element){
	$(".Error").html("");
	var id = $(element).attr("id").replace('selectedImg','');
	$('#selectedQuantity'+id).html(0);
	//$('#selectedTotalCost'+id).html(0);
	/*$('#selected'+id).remove();
	var slNo = 1; 
	 $('.selecetedSlno').each(function(){
		$(this).text(slNo);
		slNo = parseInt(slNo) + 1;
	});*/
}

function changeSelectedPack(element){
	$(".Error").html("");
	var id = $(element).attr("id");
	if (isNaN($("#"+id).html()) || $("#"+id).html() == "")
		$('#'+id).html("1");
	var rowNo = id.replace('selectedQuantity','');
	var packVal = parseInt($('#selectedQuantity'+rowNo).html());
	if(packVal<0){
		alert("Pack should not be empty");
		//var priceVal = parseFloat($('#selectedItemPrice'+rowNo).html());
		$('#selectedQuantity'+rowNo).html(1);
	//	$('#selectedTotalCost'+rowNo).html(priceVal);
	}else if(packVal == 0){
		$('#selectedQuantity'+rowNo).html(0);
		//$('#selectedTotalCost'+rowNo).html(0);
	}else{
		var sku = $(element).attr("class");
		sku = sku.replace('selectedPack ','');
		var len = $("#productsList tr").length-1;
		for(var i=1;i<=len;i++){
			var idAttr = $("#productsList tr:eq("+i+") td:last").attr("id");
			idAttr = idAttr.replace('Del','');
			if(sku == $("#skuId"+idAttr).val()){
				var pack = parseInt($("#quantity"+idAttr).val());
				var selectedPack = 0;
				$("."+sku).each(function(){
					if($(this).attr("id") != "selectedQuantity"+rowNo)
						selectedPack = selectedPack + parseInt($(this).text());
				});
				var selectedLocationId = $("#selectedLocationId").val();
				var prevSelectedQty = $("#relatedItemsTable"+selectedLocationId+" tbody").find("."+sku).text();
				//alert("pack:::"+pack+" selectedPack::"+selectedPack+" prevSelectedQty::"+prevSelectedQty);
				selectedPack = selectedPack - prevSelectedQty;
				if(pack >= (selectedPack + packVal)){
					//var priceVal = parseFloat($('#selectedItemPrice'+rowNo).html());
				//	$('#selectedTotalCost'+rowNo).html(packVal*priceVal);
				}else{
					alert("Items cannot be shipped more than the Pack Requested");
				//	var priceVal = parseFloat($('#selectedItemPrice'+rowNo).html());
					packVal = pack - selectedPack;
					$('#selectedQuantity'+rowNo).html(packVal);
				//	$('#selectedTotalCost'+rowNo).html(packVal*priceVal);
				}
			}
		}
	}
}

function showPopUp(element,type){
	$(".Error").html("");
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
		 var skuId = [];
		 for(var i=0;i<selectedItemlen;i++){
			 var idAttr = $("#relatedItemsTable"+id+" tr:eq("+i+")").attr("id");
				idAttr = idAttr.replace('selected_','');
				skuId.push($("#selectedSkuId_"+idAttr).val());
				relatedItemsTableContent = relatedItemsTableContent.replace('selected_'+idAttr,'selected'+idAttr);
				relatedItemsTableContent = relatedItemsTableContent.replace('selectedItemId_'+idAttr,'selectedItemId'+idAttr);
				relatedItemsTableContent = relatedItemsTableContent.replace('selectedSkuId_'+idAttr,'selectedSkuId'+idAttr);
			//	relatedItemsTableContent = relatedItemsTableContent.replace('selectedPluCode_'+idAttr,'selectedPluCode'+idAttr);
				relatedItemsTableContent = relatedItemsTableContent.replace('selectedItemDesc_'+idAttr,'selectedItemDesc'+idAttr);
				relatedItemsTableContent = relatedItemsTableContent.replace('selectedUom_'+idAttr,'selectedUom'+idAttr);
			//	relatedItemsTableContent = relatedItemsTableContent.replace('selectedItemPrice_'+idAttr,'selectedItemPrice'+idAttr);
				relatedItemsTableContent = relatedItemsTableContent.replace('selectedQuantity_'+idAttr,'selectedQuantity'+idAttr);
				relatedItemsTableContent = relatedItemsTableContent.replace('selectedRemarks_'+idAttr,'selectedRemarks'+idAttr);
			//	relatedItemsTableContent = relatedItemsTableContent.replace('selectedTotalCost_'+idAttr,'selectedTotalCost'+idAttr);
				relatedItemsTableContent = relatedItemsTableContent.replace('selectedDel_'+idAttr,'selectedDel'+idAttr);
				relatedItemsTableContent = relatedItemsTableContent.replace('selectedImg_'+idAttr,'selectedImg'+idAttr);
				relatedItemsTableContent = relatedItemsTableContent.replace('selecetedSlno_','selecetedSlno');
		 }
		 $("#selectedItemsList tbody").html(relatedItemsTableContent);
		 var selectedItemlen = $("#relatedItemsTable"+id+" tr").length;
		 var skuId = [];
		 for(var i=0;i<selectedItemlen;i++){
			 var idAttr = $("#relatedItemsTable"+id+" tr:eq("+i+")").attr("id");
				idAttr = idAttr.replace('selected_','');
				skuId.push($("#selectedSkuId"+idAttr).val());
				
		 }
//		 $("#relatedItemsTable"+id+" tbody").html("");
		 if(type == undefined)
			 appendPendingSkus(skuId);
	 }else{
		 
		 for(var i=1;i<=len;i++){
			 var idAttr = $("#productsList tr:eq("+i+") td:last").attr("id");
			 idAttr = idAttr.replace('Del','');
			 var pack = parseInt($("#quantity"+idAttr).val());
			 var selectedPack = 0;
			
			 $("."+$("#skuId"+idAttr).val()).each(function(){
				
				 selectedPack = selectedPack + parseInt($(this).val());
			 });
			
			 selectedPack = pack - selectedPack;
			 
			 //var totalCost = parseFloat($("#itemPrice"+idAttr).text()) * selectedPack;
			 var row = "<tr id='selected"+i+"' style='margin-top:5px;'><td class='selecetedSlno'>"+i+"</td><td id='selectedItemId"+i+"'>"+$("#itemId"+idAttr).text()+"</td>" +
			 "<input type='hidden' id='selectedSkuId"+i+"' value='"+$("#skuId"+idAttr).val()+"'/>" +
		//	 "<input type='hidden' id='selectedPluCode"+i+"' value='"+$("#pluCode"+idAttr).val()+"'/>" +
			 "<td id='selectedItemDesc"+i+"'>"+$("#itemDesc"+idAttr).text()+"</td><td id='selectedUom"+len+"'>"+$("#uom"+idAttr).text()+"</td>" +
			 "<td id='selectedQuantity"+i+"' class='selectedPack "+$("#skuId"+idAttr).val()+"' onBlur='changeSelectedPack(this);' onkeypress='return (this.innerText.length < 10)' contenteditable='true'>"+selectedPack+"</td>" +
//			 if(type != undefined)
			 "<td><textarea id='selectedRemarks"+len+"' rows=1 style='resize:none;width: 200px;'>"+$("#remarks"+idAttr).val()+"</textarea></td>";
			 row = row +"<td id='selectedDel"+ i +"' ><img id='selectedImg"+ i +"' src='"+contextPath+"/images/itemdelete.png' style='width:25px;cursor:pointer;' onclick='deleteSelectedItemDetails(this);' title='Delete "+$("#skuId"+idAttr).val()+"'/></td>"; 
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

function appendPendingSkus(skuId){
	/*var len = $("#selectedItemsList tr").length-1;
	var pluCode = [];
	 for(var i=1;i<=len;i++){
		 var idAttr = $("#selectedItemsList tr:eq("+i+")").attr("id");
		 idAttr = idAttr.replace('selected','');
		 pluCode.push($("#selectedPluCode"+idAttr).val());
	 }*/
	var contextPath = $("#contextPath").val();
	 var len = $("#productsList tr").length-1;
	 var skuIdLen = skuId.length + 1;
	 for(var i=1;i<=len;i++){
		 var idAttr = $("#productsList tr:eq("+i+") td:last").attr("id");
		 idAttr = idAttr.replace('Del','');
		 var sku = $("#skuId"+idAttr).val();
		 if ($.inArray(sku, skuId) < 0)
		 {
			// alert(sku +"not there in array");
			 var pack = parseInt($("#quantity"+idAttr).val());
			 var selectedPack = 0;
			 $("."+$("#skuId"+idAttr).val()).each(function(){
				 selectedPack = selectedPack + parseInt($(this).text());
			 });
			 selectedPack = pack - selectedPack;
			 var totalCost = parseFloat($("#itemPrice"+idAttr).text()) * selectedPack;
			 var row = "<tr id='selected"+skuIdLen+"' style='margin-top:5px;' class='item'><td class='selecetedSlno'>"+skuIdLen+"</td><td id='selectedItemId"+skuIdLen+"'>"+$("#itemId"+idAttr).text()+"</td>" +
			 "<input type='hidden' id='selectedSkuId"+skuIdLen+"' value='"+$("#skuId"+idAttr).val()+"'/>" +
			// "<input type='hidden' id='selectedPluCode"+skuIdLen+"' value='"+$("#pluCode"+idAttr).val()+"'/>" +
			 "<td id='selectedItemDesc"+skuIdLen+"'>"+$("#itemDesc"+idAttr).text()+"</td><td id='selectedUom"+len+"'>"+$("#uom"+idAttr).text()+"</td>" +
			// "<td id='selectedItemPrice"+skuIdLen+"'>"+$("#itemPrice"+idAttr).text()+"</td>" +
			 "<td id='selectedQuantity"+skuIdLen+"' class='selectedPack "+$("#skuId"+idAttr).val()+"' onBlur='changeSelectedPack(this);' onkeypress='return (this.innerText.length < 10)' contenteditable='true'>"+selectedPack+"</td>" +
			// "<td class='selectedCost' id='selectedTotalCost"+skuIdLen+"'>"+totalCost+"</td>" +
			 "<td><textarea id='selectedRemarks"+len+"' readonly='readonly' rows=1 style='resize:none;width: 200px;'>"+$("#remarks"+idAttr).val()+"</textarea></td>"+
			 "<td id='selectedDel"+skuIdLen+"' ><img id='selectedImg"+skuIdLen+"' src='"+contextPath+"/images/itemdelete.png' style='width:25px;cursor:pointer;' onclick='deleteSelectedItemDetails(this);' title='Delete "+$("#skuId"+idAttr).val()+"'/>" +
			 "</td></tr>";
//		var obj = {skuId:$("#skuId"+idAttr).val(),pluCode:$("#pluCode"+idAttr).val(),itemId:$("#itemId"+idAttr).text(),itemDesc:$("#itemDesc"+idAttr).text(),itemPrice:$("#itemPrice"+idAttr).text(),quantity:$("#quantity"+idAttr).text(),totalCost:$("#totalCost"+idAttr).text(),make:$("#make"+idAttr).text(),model:$("#model"+idAttr).text(),color:$("#color"+idAttr).text(),size:$("#size"+idAttr).text()};
			 $("#selectedItemsList tbody").append(row);
			 skuIdLen = skuIdLen + 1;
		 }
	 }
}

function saveSelectedSkus(){
	$(".Error").html("");
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
//			selectedSkuContent = selectedSkuContent.replace('selectedPluCode'+idAttr,'selectedPluCode_'+idAttr);
			selectedSkuContent = selectedSkuContent.replace('selectedItemDesc'+idAttr,'selectedItemDesc_'+idAttr);
			selectedSkuContent = selectedSkuContent.replace('selectedUom'+idAttr,'selectedUom_'+idAttr);
//			selectedSkuContent = selectedSkuContent.replace('selectedItemPrice'+idAttr,'selectedItemPrice_'+idAttr);
			selectedSkuContent = selectedSkuContent.replace('selectedQuantity'+idAttr,'selectedQuantity_'+idAttr);
//			selectedSkuContent = selectedSkuContent.replace('selectedTotalCost'+idAttr,'selectedTotalCost_'+idAttr);
			selectedSkuContent = selectedSkuContent.replace('selectedRemarks'+idAttr,'selectedRemarks_'+idAttr);
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



function createSaleQuotation(status,type){
	
	debugger;
	 //purpose:for checking internet conection
	var online = window.navigator.onLine;
  	if(!online)
  	{
  	alert("check your internet connection,please try agian after some time");
  	return;
  	}
	
	$("#Error").html("");
	if($("#customerId").val()==""){
		$("#Error").html("Enter Customer Id");
		focusDiv("Error");
		return;
	}
	if($("#tenderOpenDate").val()==""){
		$("#Error").html("Select Tender Open Date");
		focusDiv("Error");
		return;
	}
	if($("#tenderCloseDate").val()==""){
		$("#Error").html("Select Tender Close Date");
		focusDiv("Error");
		return;
	}
	if ($("#tenderOpenDate").val() != "" && $("#tenderCloseDate").val() != "") {
   		var noOfDays = daydiff(parseDate($("#tenderOpenDate").val()), parseDate($("#tenderCloseDate").val()));
   		if (noOfDays < 0) {
   			alert("Tender Open Date can't be less than Tender Close Date");
   			return;
   		}
   	}
	
	if($("#startDate").val()==""){
		$("#Error").html("Select Start Date");
		focusDiv("Error");
		return;
	}
	if($("#endDate").val()==""){
		$("#Error").html("Select End Date");
		focusDiv("Error");
		return;
	}
	
	if ($("#startDate").val() != "" && $("#endDate").val() != "") {
   		var noOfDays = daydiff(parseDate($("#startDate").val()), parseDate($("#endDate").val()));
   		if (noOfDays < 0) {
   			alert("Start Date can't be less than End Date");
   			return;
   		}
   	}
	
	if($("#toAddress").val()==""){
		$("#Error").html("Enter Customer Address");
		focusDiv("Error");
		return;
	}
	if($("#toContactNum").val()==""){
		$("#Error").html("Select Customer Phone No");
		focusDiv("Error");
		return;
	}
	if($("#tenderRef").val()==""){
		$("#Error").html("Enter Tender Ref");
		focusDiv("Error");
		return;
	}
	
	
	
	 var finalObj = {},saleQuotationItems=[];
	
	 
	 
	 finalObj.fromLocation = $("#fromlocation option:selected").text();
	 finalObj.fromAddress = $("#fromAdderss").val();	
	 finalObj.fromStreetName =$("#fromStreetName").val();
	 finalObj.fromLocality = $("#fromLocality").val();
	 finalObj.fromCity = $("#fromCity").val();
	 finalObj.fromState =$("#fromState").val();
	 finalObj.fromPhoneNo = $("#fromContactNum").val();
	 finalObj.tenderOpenDateStr =$("#tenderOpenDate").val();
	 finalObj.tenderCloseDateStr = $("#tenderCloseDate").val();
	
	 finalObj.customerId = $("#customerId").val();
	 finalObj.customerName = $("#customerName").val();
	 finalObj.toAddress = $("#toAddress").val();	
	 finalObj.toStreetName =$("#toStreetName").val();
	 finalObj.toLocality = $("#toLocality").val();
	 finalObj.toCity = $("#toCity").val();
	 finalObj.toState =$("#toState").val();
	 finalObj.toPhone = $("#toContactNum").val();
	 finalObj.tenderRef =$("#tenderRef").val();
	 finalObj.depositAmount = $("#depositAmt").val();

	 finalObj.status=status;
	 finalObj.shipmentTerms = $("#shipmentTerms").val();
	 finalObj.salesTerms = $("#salesTerms").val();
	 finalObj.discount = $("#discounts").val();
	 finalObj.quotationValue = $("#net_value").val();
	 finalObj.projectStartDateStr = $("#startDate").val();
	 finalObj.projectEndDateStr = $("#endDate").val();
	 
	  var len = $("#productsList tr").length-1;
	 
	
		if(len == 0){
			$("#Error").html("Add Atleast One Item to List");
				 focusDiv('Error');
				 return;
			}
		
		for(var i=1;i<=len;i++){
			var idAttr = $("#productsList tr:eq("+i+") td:last").attr("id");
			idAttr = idAttr.replace('Del','');
			var price = 0;
			if(type == "new")
				var price =$("#itemPrice"+idAttr).val();
			else
				var price =$("#itemPrice"+idAttr).text();
			
			var obj = {productId:$("#itemId"+idAttr).text(),
					productName:$("#itemDesc"+idAttr).text(),
					size:$("#size"+idAttr).text(),mrp:price,
					quantity:$("#quantity"+idAttr).val(),tax:$("#tax"+idAttr).text(),
					discount:$("#discount"+idAttr).text(),cost:$("#cost"+idAttr).text(),uom:$("#uom"+idAttr).text(),
				};
			
			
			saleQuotationItems.push(obj);
			
		}
		
		finalObj.salesQuotationItems = saleQuotationItems;
		
		var nextStatus =$("#statusissue").val();
		if(nextStatus=="")
			nextStatus = $("#defaultstatus").val();

		var contextPath = $("#contextPath").val();
		if(type == "new")
			URL = contextPath + "/orderManagement/createSaleQuotation.do";
		else{
			finalObj.quotationRef = $("#quoteRef").val();
			 finalObj.status=nextStatus;
			URL = contextPath + "/orderManagement/updateSaleQuotation.do";
		}
			var formData  = JSON.stringify(finalObj);
			console.log(formData);
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



function viewSaleQuotation(id,type){
	debugger;
	 //purpose:for checking internet conection
		var online = window.navigator.onLine;
	  	if(!online)
	  	{
	  	alert("check your internet connection,please try agian after some time");
	  	return;
	  	}
	  	var QuotationID=id;
		var contextPath = $("#contextPath").val();
		if(type == "view")
			URL = contextPath + "/orderManagement/viewSaleQuotation.do";
		else{
			URL = contextPath + "/orderManagement/editSaleQuotation.do";
		}
			
	  	 	 $.ajax({
	 			url : URL,
	 			data : {
	 				QuotationID:QuotationID,
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
}	 


function showSalePurchaseOrder(operation,id,index,menu){
	try{
	// purpose:for checking internet conection
	var online = window.navigator.onLine;
  	if(!online){
  	alert("Check your internet connection,Please try agian after some time.");
  	return;
  	}
	// debugger
	var contextPath = $("#contextPath").val();
	 var location = "";
	  if(operation == "")
		  operation = $("#operation").val();
    if(menu == undefined){
    	
    	if((($("#searchPurchaseOrders").length > 0 && $("#searchPurchaseOrders").val().trim() != "") || ($("#from").length > 0 && $("#from").val().trim() != "") || ($("#to").length > 0 && $("#to").val().trim() != ""))  || index != '0'){	
    	    searchPurchaseOrders($("#searchPurchaseOrders").val(), 'searchPurchaseOrders',index);
    		return;
    	}
    	if($("#warehouse_location").length>0)
  		  location = $("#warehouse_location").val();    	
    }
	var maxRecords = 10;
	if($("#maxRecords").length > 0)
		maxRecords = $("#maxRecords").val();
	 var dateTime = getCurrentDate();
	  var date = dateTime.split(' ');
	  date = date[0].split('/');
	  var formatedDate = date[1]+"/"+date[0]+"/"+date[2];
	  var startdate = formatedDate;
	URL = contextPath + "/procurement/viewPurchaseOrder.do";
		 
		$.ajax({
			type: "GET",
			url : URL,
			data : {
				operation : operation,
				location : location,
				index : index,
				maxRecords : maxRecords,
				startdate : startdate
			},
			beforeSend: function(xhr){                    
	   			$("#loading").css("display","block");
	   			$("#mainDiv").addClass("disabled");
	   		  },
			success : function(result) {
				/*
				 * $("#tab_2").html(""); $("#tab_1").html(result);
				 */
				$("#right-side").html(result);
				activeMenu(id);
				if(id == 'warehousePurchaseOrder'){
					openMenu("liWarehouseProcurementShipment","ulWarehouseProcurementShipment",0);
					openMenu("liStockManagement","ulStockManagement",1);
					openMenu("warehouseDetails","ulwarehouseDetails",1);
				}
				else
					openMenu("liOutletProcurement","ulOutletProcurement",1);	
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



