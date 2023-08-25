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

function viewRequestForQuotationDetails(rfqId,index,operation){
	var location = $("#outletLocation").val();
	 var contextPath = $('#contextPath').val();
	 //purpose:for checking internet conection
		var online = window.navigator.onLine;
	  	if(!online)
	  	{
	  	alert("check your internet connection,please try agian after some time");
	  	return;
	  	}
	//added by manasa
	 var formData={}
	
	 formData.fromLocation = $("#outletLocation").val();
	 formData.startDate = $("#from").val();
	 formData.endDate = $("#to").val();
	 formData.searchCriteria=$("#rfqSearch").val();
	 var formData = JSON.stringify(formData);
	 
	 var URL = contextPath + "/procurement/viewRequestForQuotationDetails.do";
	 $.ajax({
		type : "GET",
		url : URL,
		data : {
			rfqId : rfqId,
			operation : operation,
			formData : formData
		},
		beforeSend: function(xhr){                    
	   		$("#loading").css("display","block");
	   		$("#mainDiv").addClass("disabled");
	   	},
		success : function(result){
			$('#right-side').html(result);
			/*if(id != undefined)
				activeMenu(id);*/
			$("#outletLocation").val(location);
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

function searchRFQ(name,searchCategory,index){
	 //purpose:for checking internet conection
	var online = window.navigator.onLine;
  	if(!online)
  	{
  	alert("check your internet connection,please try agian after some time");
  	return;
  	}
	var location = ""
	if($("#outletLocation").length > 0)
		location = $("#outletLocation").val();
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
		 endDate = $("#to").val() + " 00:00:00";
	}else if($("#from").val() != "")
		 startDate = $("#from").val() + " 00:00:00";
	else if($("#to").val() != "")
			endDate = $("#to").val() + " 00:00:00";
	 
	 name=""
   		 if($("#rfqSearch").length>0)
   			name = $("#rfqSearch").val();
	 
	 var contextPath = $("#contextPath").val();
	 URL = contextPath + "/procurement/searchRequestForQuotation.do";
	 $.ajax({
			type: "GET",
			url : URL,
			data : {
				searchName : name,
				index : index,
				location : location,
				maxRecords : maxRecords,
				startDate : startDate,
				endDate : endDate
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



function searchProducts(name, searchCategory){
	$(".Error").html("");
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
				var row = "<tr id='dynamicdiv"+len+"' style='margin-top:5px;'><td class='slno'>"+slNo+"</td><td id='itemId"+len+"'>"+sku.skuId+"</td>" +
		 		"<input type='hidden' id='skuId"+len+"' value='"+sku.skuId+"'/>" +
		 		"<input type='hidden' id='pluCode"+len+"' value='"+sku.pluCode+"'/>" +
		 		"<input type='hidden' id='itemPrice"+len+"' value='"+sku.price+"'/>" +
		 		"<input type='hidden' id='make"+len+"' value='"+make+"'/>" +
		 		"<input type='hidden' id='model"+len+"' value='"+model+"'/>" +
		 		"<input type='hidden' id='color"+len+"' value='"+color+"'/>" +
		 		"<input type='hidden' id='size"+len+"' value='"+size+"'/>" +
		 		"<td id='itemDesc"+len+"'>"+description+"</td><td id='uom"+len+"'>"+uom+"</td>" +
		 		
		 		"<td  ><input id='demand"+len+"' type='number' value='1' style='height: 100%;border: none;text-align: center;width: 100%' min='1' maxlength='10'></td>"+
		 		"<td  class='minQuantity' onkeypress='return (this.innerText.length < 10)' contenteditable='true'><input id='minQuantity"+len+"' type='number' value='1' style='height: 100%;border: none;text-align: center;width: 100%' min='1' maxlength='10'></td>"+
		 		"<td   onBlur='changeOrderedPack(this);' onkeypress='return (this.innerText.length < 10)' contenteditable='true'><input id='quantity"+len+"' type='number' value='1' style='height: 100%;border: none;text-align: center;width: 100%' min='1' maxlength='8'></td>"+
		 		
		 		"<td><textarea id='remarks"+len+"' rows=1 oninput='fillRemarks(this)' style='resize:none;'></textarea></td>"+
		 		"<td id='Del"+ len +"' ><img id='Img"+ len +"' src='"+contextPath+"/images/itemdelete.png' style='width:25px;cursor:pointer;' onclick='deleteItemDetails(this);' title='Delete "+sku.skuId+"'/>" +
		 		"</td></tr>";
				$("#productsList tbody").append(row);
		}
 }
 function changeOrderedPack(element){
	 $(".Error").html("");
	 var id = $(element).attr("id");
	 if (isNaN($("#"+id).html()) || $("#"+id).html() == "")
		$('#'+id).html("1");
 }
 
 function fillRemarks(element){
	 
 }
 
 function deleteItemDetails(element){
	    $(".Error").html("");
		var id = $(element).attr("id").replace('Img','');
		var sku = $("#skuId"+id).val();
		$("."+sku).each(function(){
			$(this).parent().remove();
		 });
		$('#dynamicdiv'+id).remove();
		var slNo = 1; 
		 $('.slno').each(function(){
			$(this).text(slNo);
			slNo = parseInt(slNo) + 1;
		});
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

function validateRequestForQuotation(status,type){
	
	 //purpose:for checking internet conection
	var online = window.navigator.onLine;
  	if(!online)
  	{
  	alert("check your internet connection,please try agian after some time");
  	return;
  	}
	
	$(".Error").html("");
	 var finalObj = {};
	 if($("#fromlocation").val() == "" || $("#fromlocation").val() == "-- Select --"){
		 $("#fromlocationError").html("Please Select From Location");
		 focusDiv('fromlocationError');
		 return;
	 }
	 finalObj.fromLocation = $("#fromlocation").val();
	 if($("#fromCompany").val() == ""){
		 $("#Error").html("Please save your Profile Settings under Customer Settings Menu");
		 focusDiv('Error');
		 return;
	}
	 finalObj.fromCompany = $("#fromCompany").val();	
	 finalObj.fromAddressStreet =$("#fromStreetName").val();
	 finalObj.fromAddressLocality = $("#fromAddress").val();
	 finalObj.fromCity = $("#fromCity").val();
	 finalObj.fromState =$("#fromState").val();
	 finalObj.fromContactNum = $("#fromContactNum").val();
	 finalObj.fromCountry = $("#fromCountry").val();
	 finalObj.fromEmail = $("#fromEmail").val();
	 finalObj.fromZipCode =$("#fromZipCode").val();
	 finalObj.preparedBy =$("#preparedBy").val();
	 
	 var re = /^[0-9/]+$/;
	 if($("#createdDate").val().trim() == ""){
			$("#createdDateError").html("Enter a Date");
			focusDiv('createdDateError');
			return;
	 }
	 if(!re.test($("#createdDate").val())){
			$("#createdDateError").html("Invalid Date");
			focusDiv('createdDateError');
			return;
	 }
	 if($("#lastDateForQuoteStr").val().trim() == ""){
			$("#lastDateForQuoteStrError").html("Enter a Date");
			focusDiv('lastDateForQuoteStrError');
			return;
	 }
	 if(!re.test($("#lastDateForQuoteStr").val())){
			$("#lastDateForQuoteStrError").html("Invalid Date");
			focusDiv('lastDateForQuoteStrError');
			return;
	 }
	 
	 var noOfDays = daydiff(parseDateDDMMYYYY($('#createdDate').val()), parseDateDDMMYYYY($('#lastDateForQuoteStr').val()));
	 if(noOfDays < 0){
		 $("#lastDateForQuoteStrError").html("Due Date can't be less than Created Date");
		 focusDiv('lastDateForQuoteStrError');
		 return;
	 }
	 
	 finalObj.createdDateStr =$("#createdDate").val()+" 00:00:00";
	 finalObj.lastDateForQuoteStr =$("#lastDateForQuoteStr").val()+" 00:00:00";
	 var suppliers = $("#suppliers").val();
	 if(suppliers == null || suppliers == "" || suppliers == undefined){
		 $("#Error").html("Please Atleast One Supplier");
		 focusDiv('Error');
		 return;
	 }
	 suppliers = suppliers.toString().split(',');
	 var suppliersList = [];
	 for(var i = 0; i < suppliers.length; i++){
		var suppliersObj = {supplierId:suppliers[i],supplierName:$("#suppliers option[value='"+suppliers[i]+"']").text()}
		suppliersList.push(suppliersObj);
	 }
	 finalObj.suppliersList = suppliersList;
	 finalObj.status = status;
	 finalObj.specialInstructions = $("#specialInstructions").val();
	 finalObj.paymentInstructions = $("#paymentInstructions").val();
	 finalObj.shipmentTerms = $("#shipmentTerms").val();
	 finalObj.purchaseTerms = $("#purchaseTerms").val();
	  var len = $("#productsList tr").length-1;
	  var itemsList = [];
	  var shipmentLocationsList = [];
		if(len == 0){
			$("#Error").html("Add Atleast One Item to List");
				 focusDiv('Error');
				 return;
			}
		$("#selectedItemsList tbody").html("");
		for(var i=1;i<=len;i++){
			var idAttr = $("#productsList tr:eq("+i+") td:last").attr("id");
			idAttr = idAttr.replace('Del','');
			
			
			var sku = $("#skuId"+idAttr).val();
			var pack = $("#quantity"+idAttr).val();
			var selectedPack = 0;
			
			$("."+sku).each(function() { 

			     selectedPack = selectedPack+parseInt($(this).text()); 
			    
			   

			});
			
			
			
			
			
			
			/*alert(pack+" "+selectedPack);*/
			if(pack != selectedPack){
				$("#Error").html("Quantity requested for "+$("#skuId"+idAttr).val()+" is not equal to sum of Quantity allocated to Delivery Locations");
				focusDiv('Error');
				return;
			}
			var packVal = parseInt($('#quantity'+idAttr).html());
			var priceVal = parseFloat($('#itemPrice'+idAttr).val());
			var total = packVal*priceVal; 
			
			var obj = {skuId:$("#skuId"+idAttr).val(),pluCode:$("#pluCode"+idAttr).val(),itemId:$("#itemId"+idAttr).text(),itemDescription:$("#itemDesc"+idAttr).text(),unitOfMeasurement:$("#uom"+idAttr).text(),priceStr:$("#itemPrice"+idAttr).val(),minQty:$("#minQuantity"+idAttr).val(),quantityStr:$("#quantity"+idAttr).val(),demandForecast:$("#demand"+idAttr).val(),totalStr:total,make:$("#make"+idAttr).val(),model:$("#model"+idAttr).val(),color:$("#color"+idAttr).val(),size:$("#size"+idAttr).val(),remarks:$("#remarks"+idAttr).val()};
//			var obj = {skuId:$("#skuId"+idAttr).val(),itemId:$("#itemId"+idAttr).text(),itemDescription:$("#itemDesc"+idAttr).text(),unitOfMeasurement:$("#uom"+idAttr).text(),quantity:$("#quantity"+idAttr).text(),remarks:$("#remarks"+idAttr).val()};
			itemsList.push(obj);
			$(".locationRow").each(function(){
				var locationId = $(this).attr("id");
				locationId = locationId.replace('locations','');
				if(locationId != 0){
					var selectedQty = parseInt($("#relatedItemsTable"+locationId+" tbody").find("."+sku).text());
					if(selectedQty > 0 && selectedQty != null && selectedQty != "null"){
						var shipmentLocationObj = {skuId:$("#skuId"+idAttr).val(),itemDescription:$("#itemDesc"+idAttr).text(),unitOfMeasurement:$("#uom"+idAttr).text(),remarks:$("#remarks"+idAttr).val(),shipmentLocation:$("#location"+locationId).val(),shipmentStreet:$("#street"+locationId).val(),shipmentAddress:$("#area"+locationId).val(),shipmentCity:$("#city"+locationId).val(),shipmentZipCode:$("#pin"+locationId).val(),shipmentState:$("#state"+locationId).val(),shipmentCountry:$("#country"+locationId).val(),quantity:selectedQty};
						shipmentLocationsList.push(shipmentLocationObj);
					}
				}
			});
		}
		var selectedLocationList = [];
		$(".locationRow").each(function(){
			var locationId = $(this).attr("id");
			locationId = locationId.replace('locations','');
			if(locationId != 0){
			//	var selectedQty = parseInt($("#relatedItemsTable"+locationId+" tbody").find("."+sku).text());
			//	if(selectedQty > 0 && selectedQty != null && selectedQty != "null"){
					var locationObj = {locationId:$("#location"+locationId).val(),address:$("#street"+locationId).val(),area:$("#area"+locationId).val(),city:$("#city"+locationId).val(),pin:$("#pin"+locationId).val(),state:$("#state"+locationId).val(),country:$("#country"+locationId).val()};
					selectedLocationList.push(locationObj);
			//	}
			}
		});
		finalObj.selectedLocationList = selectedLocationList;
		finalObj.itemsList = itemsList;
		finalObj.shipmentLocationsList = shipmentLocationsList;
		if ($("#radioYes").is(":checked")) {
			finalObj.taxInclusive=true;
			}
		if ($("#radioNo").is(":checked")) {
			finalObj.taxInclusive=false;
			}
		if ($("#inclusive").is(":checked")) {
			finalObj.shipment="inclusive";
			}
		if ($("#exclusive").is(":checked")) {
			finalObj.shipment="exclusive";
			}
		finalObj.shipmentMode=$("#shipping_mode").val();
		finalObj.repeatSupply=$("#repeatSupply").val();
		finalObj.repeatPeriod=$("#repeatPeriod").val();
//		var items = JSON.stringify(itemsList);
//		var deliveryLocations = JSON.stringify(shipmentLocationsList);
//		$("#whPurchaseItems").val(items);
//		$("#deliveryLocations").val(deliveryLocations);
//		 var storeLocation = $("#warehouseLocation option:selected").text();
//		 $("#storeLocation").val(storeLocation);
		var contextPath = $("#contextPath").val();
		if(type == "new")
			URL = contextPath + "/procurement/createRequestForQuotation.do";
		else{
			finalObj.quoteRef = $("#quoteRef").val();
			URL = contextPath + "/procurement/createRequestForQuotation.do";
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


