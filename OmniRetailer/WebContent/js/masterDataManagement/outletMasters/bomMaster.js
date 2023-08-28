




function searchProducts(name, searchCategory){
	debugger;
	 //purpose:for checking internet conection
	var online = window.navigator.onLine;
  	if(!online)
  	{
  	alert("check your internet connection,please try agian after some time");
  	return;
  	}
	var storeLocation = "";
	var bomsearchSkusFlag = false;
	var supplier_Id = $("#supplier_Id").val();	
	var flowUnder =  $("#flowUnder").val();	
	if(flowUnder == undefined || flowUnder == null){
		flowUnder ="";
	}
	
	if(searchCategory == "bomRequest2"){
		bomsearchSkusFlag = true;
	} else {
		bomsearchSkusFlag = false;
	}
	
		var contextPath = $("#contextPath").val();
		if(flowUnder == "")
			URL = contextPath + "/inventorymanager/BomSearchProducts.do";
		else
			URL = contextPath + "/inventorymanager/BomSearchWarehouseProducts.do";	
		 $.ajax({
    			type: "GET",
    			url : URL,
    			data : {
    				searchName : name,
    				storeLocation : storeLocation,
    				bomsearchSkusFlag : bomsearchSkusFlag
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
	 else{for(var i=0;i<productsList.length;i++){
		 
		 debugger;
		 
		
			 if(productsList[i].productName==null){
				 productsList[i].productName= "";
				}
			 
			 
		 if(productsList[i].skuID == productsList[i].description){
			 if (i == 0) {
				 op += '<li style="text-align: left;" id="'+productsList[i].skuID+'"  class="selected" onclick=getId(this,"'+searchCategory+'"); ><a><label style="width: 15%;">'+productsList[i].skuID+'</label><label  style="width: 45%;">'+productsList[i].productName+'</label>&nbsp &nbsp<label  style="width: 10%;"> '+productsList[i].mrp+' </label>  &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp    '+productsList[i].price+'  </a></li>';

			}else
			    
				 op += '<li style="text-align: left;" id="'+productsList[i].skuID+'"   onclick=getId(this,"'+searchCategory+'"); ><a><label style="width: 15%;">'+productsList[i].skuID+'</label ><label style="width: 45%;">'+productsList[i].productName+'</label>&nbsp &nbsp<label  style="width: 10%;"> '+productsList[i].mrp+' </label>  &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp    '+productsList[i].price+'  </a></li>';

 	}
	 else{
		 if (i == 0) {
			 op += '<li style="text-align: left;" id="'+productsList[i].skuID+'"  class="selected" onclick=getId(this,"'+searchCategory+'"); ><a><label style="width: 15%;">'+productsList[i].skuID+'</label><label  style="width: 45%;">'+productsList[i].productName+'</label>&nbsp &nbsp<label  style="width: 10%;"> '+productsList[i].mrp+'</label>   &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp    '+productsList[i].price+'  </a></li>';

		}else
			 op += '<li style="text-align: left;" id="'+productsList[i].skuID+'"   onclick=getId(this,"'+searchCategory+'"); ><a><label style="width: 15%;">'+productsList[i].skuID+'</label><label  style="width: 45%;">'+productsList[i].productName+'</label>&nbsp &nbsp<label  style="width: 10%;">'+productsList[i].mrp+' </label>  &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp    '+productsList[i].price+'  </a></li>';

	 }
 } }
	 
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
	if(type == "request")
		getSkuDetails(id,type);
	else if(type == "bomRequest2")
		getSkuDetails(id,type);
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
	else if(type == "itemname"){
		getItemDetails(id);
		}
		 $(".services").hide();
		 $("."+type).html("");
	
}
function getSkuDetails(skuId){
	debugger;
	 //purpose:for checking internet conection
	var online = window.navigator.onLine;
  	if(!online)
  	{
  	alert("check your internet connection,please try agian after some time");
  	return;
  	}
	 var contextPath = $("#contextPath").val();
	 var storeLocation = $("#warehouse_location option:selected").text();
	 var flowUnder =  $("#flowUnder").val();	
		if(flowUnder == undefined || flowUnder == null){
			flowUnder ="";
		}
		var WarehouseReturnflag=$("#whreturnflag").val();
		if(WarehouseReturnflag == "" || WarehouseReturnflag == undefined || WarehouseReturnflag == null){
			WarehouseReturnflag="";
   		}

		
		
	 if(flowUnder == "")
		 URL = contextPath + "/inventorymanager/getSkuDetails.do";
	 else
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
			addSku(skuList[0]);
		}
}
function getPrice(ele){
	var id = $(ele).attr("id");
	id = id.replace('price','');
	$(".modal-backdrop").trigger("click");
	addSku(skuList[id]);
}
function getItemDetails(skuId){
	debugger;
	 //purpose:for checking internet conection
	var online = window.navigator.onLine;
  	if(!online)
  	{
  	alert("check your internet connection,please try agian after some time");
  	return;
  	}
	 var contextPath = $("#contextPath").val();
	 var storeLocation = $("#warehouse_location option:selected").text();
	 
	 var flowUnder =  $("#flowUnder").val();	
		if(flowUnder == undefined || flowUnder == null){
			flowUnder ="";
		}
		
		var WarehouseReturnflag=$("#whreturnflag").val();
		if(WarehouseReturnflag == "" || WarehouseReturnflag == undefined || WarehouseReturnflag == null){
			WarehouseReturnflag="";
   		}

	 if(flowUnder == "")
		 URL = contextPath + "/inventorymanager/getSkuDetails.do";
	 else
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
 				appendproductDetails(result);
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


function appendproductDetails(skuDetails){
	debugger;
	 var parsedJson = jQuery.parseJSON(skuDetails);
		$("#searchItems").val("");
		skuList = parsedJson.skuLists;
	/*	if(skuList.length >1){
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
		else{*/
			
			$(".itemwise").val(skuList[0].skuId);
			
			if(parsedJson.category == null || parsedJson.category == undefined){
				parsedJson.category = skuList[0].category;
			}
			
			
			
			$("#category").val(parsedJson.category);
			$("#description").val(skuList[0].description);
			$("#uom").val(skuList[0].uom);
			$("#costprice").val(skuList[0].price);
			$("#saleprice").val(skuList[0].price);
			
			//addSku(skuList[0]);
		/*}*/
}

 function addSku(sku){
	 var contextPath = $("#contextPath").val();
	 var len = parseInt($("#productsList tr").length);
		if (len != 1)
			len = parseInt($("#productsList tr:last").attr("id").replace('dynamicdiv', '')) + 1;
	
		for (var i = 1; i <= len; i++) {
			if ($("#skuId" + i).val() == sku.skuId && $("#Price"+i).text() == sku.price && $("#pluCode" + i).val() == sku.pluCode) {
				var pack =  parseInt($("#Pack"+i).text())+1;
  			 $("#Pack"+i).text(pack);
  			 $("#Supplied"+i).text(pack);
			 $("#Received"+i).text(pack);
			 $("#Rejected"+i).text(0);
  			 var cost =  parseFloat($("#Price"+i).text());
  			 $("#Cost"+i).text(pack*cost);
  			 changeTotalCost();
  			 //changeTotalQuantity();
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
		var slNo = 1; 
			 $('.slno').each(function(){
				$(this).text(slNo);
				slNo = parseInt(slNo) + 1;
			});
		
				var row = "<tr id='dynamicdiv"+len+"' style='margin-top:5px;'><td class='slno' id='itemno"+len+"'>"+slNo+"</td><td id='Name"+len+"'>"+sku.skuId+"</td>" +
			"<input type='hidden' id='skuId"+len+"' value='"+sku.skuId+"'/>" +
			"<input type='hidden' id='pluCode"+len+"' value='"+sku.pluCode+"'/>" +
			"<input type='hidden' id='itemprice"+len+"' value='"+sku.price+"'/>" +
			"<td id='Desc"+len+"'>"+description+"</td>"+
			"<td class='Price' id='Price"+len+"'>"+sku.uom+"</td>" +
			"<td id='Pack"+len+"' class='Pack' onBlur='changePack(this);'  contenteditable='true'>1</td>" +
			"<td id='Rejected"+len+"'><input id='checkboxmaster"+len+"' type='checkbox' style='  width: 43px;  height: 17px;'></td><td contenteditable='true' id='Make"+len+"'></td>" +
			"<td  contenteditable='true'> <div class='bootstrap-timepicker'>"+
            "<input type='text' class='form-control timepicker' value='00:00:00' style='width:100px;' name='startTime' id='ltime"+len+"'/> "+                                       
            "</div></td>" +
			"<td class='Received'contenteditable='true' ><div class='bootstrap-timepicker'>"+
            "<input type='text' class='form-control timepicker' value='00:00:00' style='width:100px;' name='startTime' id='ptime"+len+"'/> "+    
			 "</div></td>" +
			"<td id='Cost"+len+"'  contenteditable='true'>"+sku.price+"</td><td id='Del"+len+"'>" +
			"<img id='Img"+len+"' src='"+contextPath+"/images/itemdelete.png' style='width:12%;cursor:pointer;' onclick='deleteItem(this);' title='Delete "+sku.skuId+"'/></td></tr>";
			$("#productsList tbody").append(row);
			/*if (len == 1){
				alert("time")
				$(".timepicker").timepicker({
				     showInputs: false,
				     showMeridian:false,
				     showSeconds:true,
				     
				  });
			}*/
		
	 changeTotalCost();
	 //changeTotalQuantity();
}
 function setTwoNumberDecimal(event) {
		var id = $(event).attr("id");
		var rowNo = id.replace('Pack','');
	        var val = $('#Pack'+rowNo).text();
	        parseFloat($('#Pack'+rowNo).text(val));
	       /* alert(val)
	        if(isNaN(val)){
	             val = val.replace(/[^0-9]./g,'');


	             if(val.split('.').length>2) 
	                 val =val.replace(/\.+$/,"");
	        }
	        $('#Pack'+rowNo).text(val);*/
	   
	}
 function changePack(element){
	 
		var id = $(element).attr("id");
		var rowNo = id.replace('Pack','');
		if (isNaN($("#"+id).html()) || $("#"+id).html() == ""){
			var supplied = parseInt($('#Supplied'+rowNo).html());
			$('#'+id).html(supplied);
		}
		var packVal = $('#Pack'+rowNo).text();
		if(packVal<=0){
			alert("Pack should not be empty");
			var supplied = parseInt($('#Supplied'+rowNo).html());
			
			var priceVal = parseFloat($('#Price'+rowNo).val());
			$('#Pack'+rowNo).html(supplied);
			$('#Cost'+rowNo).html(receivedVal*priceVal);
		}else{
			var priceVal = parseFloat($('#itemprice'+rowNo).val());

				var receivedVal =  packVal ;
				$('#Cost'+rowNo).html(receivedVal*priceVal);
			
		}
		changeTotalCost();
		//changeTotalQuantity();
	}
 
 function changeTotalCost(){
		var totalCost=0.0;
		$('.Pack').each(function(){
		  var rowNo = $(this).attr("id").replace('Pack','');
		  var cost = parseFloat($('#itemprice'+rowNo).val());
		  var received = $('#Pack'+rowNo).text();
		  totalCost = cost*received+totalCost;
		 });
		$('#totalCost').val(totalCost);
	}

	function changeTotalQuantity(){
		var totalQty=0;
		$('.Received').each(function(){
		  var rowNo = $(this).attr("id").replace('Received','');
		  var qty = $("#Received"+rowNo).html();
		  totalQty = parseInt(qty)+totalQty;
		 });
		$('#totalQty').val(totalQty);
	}
	
	
	function validateBomForm(operation){
		 //purpose:for checking internet conection
		var online = window.navigator.onLine;
	  	if(!online)
	  	{
	  	alert("check your internet connection,please try agian after some time");
	  	return;
	  	}
		var featuredproducts = {}, productList = [];
			
			 var len = parseInt($("#productsList tr").length);
			 if($(".itemwise").val().trim() == ""){
				 $("#searchItems").focus();
					$("#leadTimeError").html("Enter SKU Id ");
					return;
				}
			 var len = parseInt($("#productsList tr").length);
				if(len <= 1){
					alert("Add Atleast One Item");
					return false;
					}
			 var maxRecords = 10;
	 	 		if($("#maxRecords").length >0)
	 	 			maxRecords = $("#maxRecords").val();
	 	 		
	 	 		var searchName ="";
	 	 		if($("#searchBOM").length >0)
	 	 			searchName = $("#searchBOM").val().trim();
			 
			 featuredproducts.productId = $(".itemwise").val();
			 
			 featuredproducts.productUom = $("#uom").val();
			 featuredproducts.description = $("#description").val().trim();
			 featuredproducts.productCategory = $("#category").val();
			 featuredproducts.costPrice = $("#costprice").val().trim();
			 featuredproducts.salePrice = $("#saleprice").val().trim();
			 featuredproducts.productExpiryPeriodDays = $("#days").val().trim();
			 featuredproducts.productExpiryPeriodHours = $("#hours").val().trim();
			 featuredproducts.materialCategory = $("#materialcategory").val();
			 featuredproducts.processInstructions = $("#processdescription").val().trim();
			 featuredproducts.totalBomCost = $("#totalCost").val();
			 featuredproducts.bomRef = $("#bomRef").val();
			 featuredproducts.searchCriteria = searchName;
			 featuredproducts.maxRecords = maxRecords;
			for(var i=1;i<len;i++){
				var idAttr = $("#productsList tr:eq("+i+") td:last").attr("id");
				idAttr = idAttr.replace('Del','');
				var obj = {pluCode:$("#pluCode"+idAttr).val(),itemId:$("#skuId"+idAttr).val(),itemDescription:$("#Desc"+idAttr).text(),optionalFlag:$("#checkboxmaster"+idAttr).prop('checked'),itemSeqNumber:$("#itemno"+idAttr).text(),uom:$("#Price"+idAttr).text(),quantity:$("#Pack"+idAttr).text(),leadTimeStr:$("#ltime"+idAttr).val(),processTimeStr:$("#ptime"+idAttr).val(),variance:$("#Make"+idAttr).text(),itemPrice:$("#itemprice"+idAttr).val()};
				productList.push(obj);
				
			}
			featuredproducts.boMaterialChilds = productList;
			var contextPath = $("#contextPath").val();
		   if(operation=="new"){
			   URL = contextPath + "/outletMaster/createBom.do";
		   }
		   else if(operation=="edit"){
			   URL = contextPath + "/outletMaster/updateFeatureProductGroupMaster.do";
			   featuredproducts.featureId = $("#featuredGroup").val();
			   
		   }
			var formData = JSON.stringify(featuredproducts);
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
	
	
	function viewEditBomMaster(priceRangeId, type) {
		contextPath = $('#contextPath').val();
		 //purpose:for checking internet conection
		var online = window.navigator.onLine;
	  	if(!online)
	  	{
	  	alert("check your internet connection,please try agian after some time");
	  	return;
	  	}
		 var maxRecords = 10;
	 		if($("#maxRecords").length >0)
	 			maxRecords = $("#maxRecords").val();
	 		
	 		var searchName ="";
	 		if($("#searchBOM").length >0)
	 			searchName = $("#searchBOM").val().trim();
	 		
		var URL = contextPath + "/outletMaster/viewEditBomMaster.do";
		$.ajax({
			type : "GET",
			url : URL,
			data : {
				type : type,
				priceRangeId : priceRangeId,
				searchName : searchName,
				maxRecords : maxRecords
			},	beforeSend: function(xhr){                    
   	   			$("#loading").css("display","block");
   	   			$("#mainDiv").addClass("disabled");
   	   		  },
			success : function(result) {
				$('#right-side').html(result);
				/*
				 * if(id != undefined && id != "") activeMenu(id);
				 */
				openMenu("master-details", "ulMasterDetails", 0);
				openMenu("liMasterDataManagement", "ulMasterDataManagement", 1);
				$("#loading").css("display", "none");
				$("#mainDiv").removeClass('disabled');
			},
			error : function() {
				alert("Something went wrong");
				$("#loading").css("display", "none");
				$("#mainDiv").removeClass('disabled');
			}

		});
	}
	
	function deleteItem(element){
	    $(".Error").html("");
		var id = $(element).attr("id").replace('Img','');
		var sku = $("#skuId"+id).val();
		$('#dynamicdiv'+id).remove();
		var slNo = 1; 
		 $('.slno').each(function(){
			$(this).text(slNo);
			slNo = parseInt(slNo) + 1;
		});
	}
	
	
	
	function searchBomMaster(name,searchCategory,index){
		 //purpose:for checking internet conection
		var online = window.navigator.onLine;
	  	if(!online)
	  	{
	  	alert("check your internet connection,please try agian after some time");
	  	return;
	  	}
		 var contextPath = $("#contextPath").val();
		 var URL = contextPath + "/outletMaster/searchBomMaster.do";
		 $.ajax({
				type: "GET",
				url : URL,
				data : {
					searchName : name,
					index : index
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
	
	function viewEditWHBomMaster(priceRangeId, type) {
		contextPath = $('#contextPath').val();
		 //purpose:for checking internet conection
		var online = window.navigator.onLine;
	  	if(!online)
	  	{
	  	alert("check your internet connection,please try agian after some time");
	  	return;
	  	}
		 var maxRecords = 10;
	 		if($("#maxRecords").length >0)
	 			maxRecords = $("#maxRecords").val();
	 		
	 		var searchName ="";
	 		if($("#searchBOM").length >0)
	 			searchName = $("#searchBOM").val().trim();
	 		
		var URL = contextPath + "/warehouseMaster/viewEditBomMaster.do";
		$.ajax({
			type : "GET",
			url : URL,
			data : {
				type : type,
				priceRangeId : priceRangeId,
				searchName : searchName,
				maxRecords : maxRecords
			},	beforeSend: function(xhr){                    
   	   			$("#loading").css("display","block");
   	   			$("#mainDiv").addClass("disabled");
   	   		  },
			success : function(result) {
				$('#right-side').html(result);
				
				$("#loading").css("display", "none");
				$("#mainDiv").removeClass('disabled');
			},
			error : function() {
				alert("Something went wrong");
				$("#loading").css("display", "none");
				$("#mainDiv").removeClass('disabled');
			}

		});
	}
	
	
	
	function validateWHBomForm(operation){
		 //purpose:for checking internet conection
		var online = window.navigator.onLine;
	  	if(!online)
	  	{
	  	alert("check your internet connection,please try agian after some time");
	  	return;
	  	}
       debugger;
		var featuredproducts = {}, productList = [];
			
			 var len = parseInt($("#productsList tr").length);
			 if($(".itemwise").val() == ""){
				 $("#searchItems").focus();
					$("#leadTimeError").html("Enter SKU Id ");
					return;
				}
			 var len = parseInt($("#productsList tr").length);
				if(len <= 1){
					alert("Add Atleast One Item");
					return false;
					}
			 var maxRecords = 10;
	 	 		if($("#maxRecords").length >0)
	 	 			maxRecords = $("#maxRecords").val();
	 	 		
	 	 		var searchName ="";
	 	 		if($("#searchBOM").length >0)
	 	 			searchName = $("#searchBOM").val().trim();
			 
			 featuredproducts.productId = $(".itemwise").val();
			 
			 featuredproducts.productUom = $("#uom").val();
			 featuredproducts.description = $("#description").val();
			 featuredproducts.productCategory = $("#category").val();
			 featuredproducts.costPrice = $("#costprice").val();
			 featuredproducts.salePrice = $("#saleprice").val();
			 featuredproducts.productExpiryPeriodDays = $("#days").val();
			 featuredproducts.productExpiryPeriodHours = $("#hours").val();
			 featuredproducts.materialCategory = $("#materialcategory").val();
			 featuredproducts.processInstructions = $("#processdescription").val();
			 featuredproducts.totalBomCost = $("#totalCost").val();
			 featuredproducts.bomRef = $("#bomRef").val();
			 featuredproducts.searchCriteria = searchName;
			 featuredproducts.maxRecords = maxRecords;
			for(var i=1;i<len;i++){
				var idAttr = $("#productsList tr:eq("+i+") td:last").attr("id");
				idAttr = idAttr.replace('Del','');
				var obj = {pluCode:$("#pluCode"+idAttr).val(),itemId:$("#skuId"+idAttr).val(),itemDescription:$("#Desc"+idAttr).text(),optionalFlag:$("#checkboxmaster"+idAttr).prop('checked'),itemSeqNumber:$("#itemno"+idAttr).text(),uom:$("#Price"+idAttr).text(),quantity:$("#Pack"+idAttr).text(),leadTimeStr:$("#ltime"+idAttr).val(),processTimeStr:$("#ptime"+idAttr).val(),variance:$("#Make"+idAttr).text(),itemPrice:$("#itemprice"+idAttr).val()};
				productList.push(obj);
				
			}
			featuredproducts.boMaterialChilds = productList;
			var contextPath = $("#contextPath").val();
		   if(operation=="new"){
			   URL = contextPath + "/warehouseMaster/createBom.do";
		   }
		   else if(operation=="edit"){
			   URL = contextPath + "/warehouseMaster/updateFeatureProductGroupMaster.do";
			   featuredproducts.featureId = $("#featuredGroup").val();
			   
		   }
			var formData = JSON.stringify(featuredproducts);
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
	function searchWHBomMaster(name,searchCategory,index){
		 //purpose:for checking internet conection
		var online = window.navigator.onLine;
	  	if(!online)
	  	{
	  	alert("check your internet connection,please try agian after some time");
	  	return;
	  	}
		 var contextPath = $("#contextPath").val();
		 var URL = contextPath + "/warehouseMaster/searchBomMaster.do";
		 $.ajax({
				type: "GET",
				url : URL,
				data : {
					searchName : name,
					index : index
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
	
	