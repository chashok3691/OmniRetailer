function viewShipmentReturnDetails(purchaseStockReturnRef,operation){
	var flowUnder = $("#flowUnder").val();
	 //purpose:for checking internet conection
	debugger;
	var online = window.navigator.onLine;
  	if(!online)
  	{
  	alert("check your internet connection,please try agian after some time");
  	return;
  	}
	//added by manasa
	 var formData={}
	 var locationgrid = $("#gridLocation").val();
	 formData.fromLocation = locationgrid;
	 formData.startDate = $("#from").val();
	 formData.endDate = $("#to").val();
	 formData.searchCriteria = $("#searchShipmentReturnsId").val();
	 
	 var formData = JSON.stringify(formData);
	
	 var contextPath = $('#contextPath').val();
	 var URL = contextPath + "/procurement/viewShipmentReturnDetails.do";
	 $.ajax({
		type : "GET",
		url : URL,
		data : {
			purchaseStockReturnRef : purchaseStockReturnRef,
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
			/*if(id != undefined)
				activeMenu(id);*/
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

function getCode(element,type){
	debugger;
	var id= $(element).attr("id");
	var state= $(element).attr("state");
	
	$("#supplier_Id").val(id);
	var label = $(element).children("a").text();
	$("#searchSupplier").val(label);
	$("#searchSupplierW").val(label);
	$("#supplier_state").val(state);
	 $(".services").hide();
	 $("."+type).html("");
}


function clearAll(){
	debugger;
	$("#clearall").empty();
	
	$("#goodsVal").val(0);
	$("#taxValue").val(0);
	$("#shipmentCharges").val(0);
	$("#totalcost").val(0);
	
	
	
	
	
}


function PreventEnter(element){
	 debugger;
	 
	 
	if (event.keyCode === 13) {
		event.preventDefault();
  }
}

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
	debugger;
	 //purpose:for checking internet conection
	var online = window.navigator.onLine;
  	if(!online)
  	{
  	alert("check your internet connection,please try agian after some time");
  	return;
  	}
	 var contextPath = $("#contextPath").val(); 
	 var storeLocation = $("#fromLocation  option:selected").text();
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
	debugger;
	 //purpose:for checking internet conection
	var online = window.navigator.onLine;
  	if(!online)
  	{
  	alert("check your internet connection,please try agian after some time");
  	return;
  	}
	 var contextPath = $("#contextPath").val();
	 var storeLocation = $("#fromLocation  option:selected").text();
	 URL = contextPath + "/procurement/getPoItems.do";
	 $.ajax({
 			type: "GET",
 			url : URL,
 			data : {
 				poRefId : poRefId,
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
	debugger;
	console.log(poItemsList);
		$("#searchItems").val("");
//		alert(poItemsList.length);
		
		
		
		
		poItemsList = poItemsList.itemDetails;
		for(var j = 0; j < poItemsList.length ; j++){
			var sku = poItemsList[j];
			var contextPath = $("#contextPath").val();
			 var len = parseInt($("#productsList tr").length);
				if (len != 1)
					len = parseInt($("#productsList tr:last").attr("id").replace('dynamicdiv', '')) + 1;
				for (var i = 1; i <= len; i++) {
					if ($("#skuId" + i).val() == sku.skuId && $("#itemPrice"+i).text() == sku.skuPrice && $("#pluCode" + i).val() == sku.pluCode) {
						var pack =  parseInt($("#quantity"+i).text())+parseFloat(sku.quantity);
		    			 $("#quantity"+i).text(pack);
		    			 var cost =  parseFloat($("#itemPrice"+i).text());
		    			 $("#totalCost"+i).text(pack*cost);
		    			 changeTotalOrderCost();
		        		 return;
					}
				}
				var POdescription = null;
				if (sku.skuName != "" && sku.skuName != null)
					POdescription = sku.skuName;
				else
					POdescription = $("#desc").val();
				var make = sku.make;
				if(make == "" || make == null)
					make = "";
				var uom = sku.uom;
				if(uom == "" || uom == null)
					uom = "";
				var model = sku.model;
				if(model == "" || model == null)
					model = "";
				var color = sku.color;
				if(color == "" || color == null)
					color = "";
				var size = sku.size;
				if(size == "" || size == null)
					size = "";
				
				var hsnCode = sku.hsnCode;
				if(hsnCode== null || hsnCode == undefined || hsnCode == ""){
					hsnCode = "";
				}
				var ean = sku.ean;
				if(ean== null || ean == undefined || ean == ""){
					ean ="";
				}
				var tax = sku.tax;
				if(tax== null || tax == undefined || tax == ""){
					tax =0;
				}
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
				
				
				if(poItemsList.length > 0 && poItemsList[0].supplierName != undefined && poItemsList[0].supplierName != null && poItemsList[0].supplierName != ""){
					$("#searchSupplier").val(poItemsList[0].supplierName);
				}
				
				if(poItemsList.length > 0 && poItemsList[0].supplierstate != undefined && poItemsList[0].supplierstate != null && poItemsList[0].supplierstate != ""){
					$("#supplier_state").val(poItemsList[0].supplierstate);
					
				}
				if(poItemsList.length > 0 && poItemsList[0].supplierId != undefined && poItemsList[0].supplierId != null && poItemsList[0].supplierId != ""){
					$("#supplier_Id").val(poItemsList[0].supplierId);
					
				}
				
				
				
				var slNo = 1; 
	  			 $('.slno').each(function(){
	  				$(this).text(slNo);
	  				slNo = parseInt(slNo) + 1;
	  			});
	  			
	  			var row = "<tr id='dynamicdiv"+len+"' style='margin-top:5px;'><td class='slno sticky-col first-col' style='background: #f9f9f9;'>"+slNo+"</td><td id='Name"+len+"' class='sticky-col second-col' style='background: #f9f9f9;'>"+sku.skuId+"</td>" +
				"<td id='ean"+len+"'class='sticky-col third-col' style='background: #f9f9f9;'>"+sku.ean+"</td>" +
				"<td id='hsnCode"+len+"'  class='sticky-col fourth-col' style='background: #f9f9f9;'>"+sku.hsnCode+"</td>" +
/*				"<td id='itemScanCode"+len+"' class='itemScanCode sticky-col fifth-col'      style='background: #f9f9f9;'>"+POdescription+"</td>" +
*/				"<input type='hidden' id='skuId"+len+"' value='"+sku.skuId+"'/>" +
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
    			"<input type='hidden' id='cessTaxRate"+len+"' value='"+parseFloat(cessTaxRate).toFixed(2)+"'/>" +
    			"<input type='hidden' id='igsttaxRate"+len+"' value='"+parseFloat(igstTaxRate).toFixed(2)+"'/>" +
    			"<input type='hidden' id='cgstsgsttaxRate"+len+"' value='"+parseFloat(grnsgstTaxRate).toFixed(2)+"'/>" +

    			"<input type='hidden' id='taxationlist"+len+"' value='"+JSON.stringify(sku.taxdetails)+"'/>" +

				"<input type='hidden' id='trackingRequired"+len+"' class='trackingRequired' value='"+sku.trackingRequired+"'/>" +
				"<td id='Desc"+len+"'  class='sticky-col fifth-col' style='background: #f9f9f9;'><div id='overflowtext'><a href='#' data-toggle='tooltip'  title='"+description+"'>"+description+"</a></div></td>"+
				"<td><textarea id='batchNum"+len+"' rows=1 style='resize:none;width: 87px;'></textarea></td>"+
				"<td>"+sku.measurementRange+"</td>" +
				"<td id='Make"+len+"'>"+sku.uom+"</td>" +
				"<td><input type='text' id='mrp"+len+"'  style='width:70px;text-align:center' value='"+sku.mrp+"'></td>"+
				"<td id='Requested"+len+"'>"+sku.quantity+"</td>" +
				"<td class='Price' id='SPrice"+len+"'>"+sku.itemPrice+"</td>" +
				"<td  id='tax"+len+"' onBlur='changeGrnTax(this);' contenteditable='true'>"+parseFloat((taxRate*2)+igstTaxRate).toFixed(2)+"</td>" +
				"<td  id='cgsttax"+len+"'>"+parseFloat(taxRate).toFixed(2)+"</td>" +
		 		"<td  id='sgsttax"+len+"'>"+parseFloat(grnsgstTaxRate).toFixed(2)+"</td>" +
		 		"<td id='igsttax"+len+"'>"+parseFloat(igstTaxRate).toFixed(2)+"</td>"+
    	 		"<td id='cess"+len+"'>"+parseFloat(cessTaxRate).toFixed(2)+"</td>"+
		 		"<td id='Pack"+len+"' class='Pack' onBlur='changePack(this);' onkeypress='PreventEnter(this);'  contenteditable='true' >"+sku.quantity+"</td>" +
    			"<td class='Price' id='Price"+len+"' onBlur='changeSupplyPrice(this);'  type='number' onkeypress='PreventEnter(this);' contenteditable='true'>"+sku.itemPrice+"</td>" +
				//"<td style='border: 1px solid #ccc;padding:0px;'><input style='border: none;height: 100%;text-align: center;' id='Pack"+len+"' class='Pack' onBlur='changePack(this);'   type='number' value='"+sku.quantity+"' /></td>" +
    			//"<td style='border: 1px solid #ccc;padding:0px;'><input style='border: none;height: 100%;text-align: center;' id='Price"+len+"'    type='number' value='"+sku.itemPrice+"' /></td>" +
    			"<td id='Cost"+len+"'>"+sku.totalCost/sku.quantity+"</td>" +
    	 		"<td><textarea id='remarks"+len+"' rows=1 style='resize:none;width: 150px;'></textarea></td>"+

    			"<td id='Del"+len+"'>" +
				"<img id='Img"+len+"' src='"+contextPath+"/images/itemdelete.png' style='width:32%;cursor:pointer;' onclick='deleteItem(this);' title='Delete "+sku.skuId+"'/></td></tr>";
				 $("#Pack"+len).focus();
	  			$("#productsList tbody").append(row);
	  			$("#Pack"+len).focus();
				$("#dynamicdiv"+(len-1)).css("background","none");
				$("#dynamicdiv"+len).css("background","lightgreen", "important");
	  			changeTotalCost();
		}
}


function searchProducts(name, searchCategory){
	 //purpose:for checking internet conection
	var online = window.navigator.onLine;
  	if(!online)
  	{
  	alert("check your internet connection,please try agian after some time");
  	return;
  	}
	var storeLocation = $("#fromLocation option:selected").text();
	 if(storeLocation=='')
	 {
		 storeLocation =$("#fromLocation").val();
	 }
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
	 debugger;
	 $("."+searchCategory).html('');
	 var op = '';
	 for(var i=0;i<productsList.length;i++){
		 
		 
			
			if(productsList[i].color=="" || productsList[i].color == null || productsList[i].color== undefined  ){
				
				productsList[i].color = "";
			}
			if(productsList[i].size=="" || productsList[i].size == null || productsList[i].size== undefined  ){
				
				productsList[i].size = "";
			}
			if(productsList[i].model=="" || productsList[i].model == null || productsList[i].model== undefined  ){
				
				productsList[i].model = "";
			}
			if(productsList[i].price=="" || productsList[i].price == null || productsList[i].price== undefined  ){
				
				productsList[i].price = "";
			}
			if(productsList[i].category=="" || productsList[i].category == null || productsList[i].category== undefined  ){
				
				productsList[i].category = "";
			}
			
			
			
			if(productsList[i].productName=="" || productsList[i].productName == null || productsList[i].productName== undefined  ){
				
				productsList[i].productName = "";
			}
			if(productsList[i].mrp=="" || productsList[i].mrp == null || productsList[i].mrp== undefined  ){
				
				productsList[i].mrp = 0;
			}
			
		if(productsList[i].reorderPoint=="" || productsList[i].reorderPoint == null || productsList[i].reorderPoint== undefined  ){
			
			productsList[i].reorderPoint = 0;
		}
		if(productsList[i].quantity=="" || productsList[i].quantity == null || productsList[i].quantity== undefined  ){
			
			productsList[i].quantity = 0;
		}
		 
		 
		 if(productsList[i].skuID == productsList[i].description){
			 
			 
			 
			 
				 if (i == 0) {
					 op += '<li id="'+productsList[i].skuID+'"  class="selected" onclick=getId(this,"'+searchCategory+'"); ><a><label style="width: 5%;">'+productsList[i].skuID+'</label>&nbsp &nbsp &nbsp <a><label style="width: 30%;">'+productsList[i].productName+'</label> &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp  <label style="width: 5%;">'+productsList[i].quantity+' </label> &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp    <label style="width: 3%;"> '+productsList[i].color+'</label> &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp    <label style="width: 5%;"> '+productsList[i].size+'</label>    &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp  <label style="width: 5%;"> '+productsList[i].mrp+'</label>&nbsp &nbsp <label style="width: 5%;">'+productsList[i].price+'</label>&nbsp &nbsp '+productsList[i].reorderPoint+'</a></li>';
				}else
					 op += '<li id="'+productsList[i].skuID+'"  onclick=getId(this,"'+searchCategory+'"); ><a><label style="width: 5%;">'+productsList[i].skuID+'</label>&nbsp &nbsp &nbsp <a><label style="width: 30%;">'+productsList[i].productName+'</label> &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp  <label style="width: 5%;">'+productsList[i].quantity+' </label> &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp    <label style="width: 3%;"> '+productsList[i].color+'</label> &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp    <label style="width: 5%;"> '+productsList[i].size+'</label>    &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp  <label style="width: 5%;"> '+productsList[i].mrp+'</label>&nbsp &nbsp <label style="width: 5%;">'+productsList[i].price+'</label>&nbsp &nbsp '+productsList[i].reorderPoint+'</a></li>';
	 	}
		 else{
			 if (i == 0) {
				 op += '<li id="'+productsList[i].skuID+'"  class="selected" onclick=getId(this,"'+searchCategory+'"); ><a><label style="width: 5%;">'+productsList[i].skuID+'</label>&nbsp &nbsp &nbsp <a><label style="width: 30%;">'+productsList[i].productName+'</label> &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp  <label style="width: 5%;">'+productsList[i].quantity+' </label> &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp    <label style="width: 3%;"> '+productsList[i].color+'</label> &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp    <label style="width: 5%;"> '+productsList[i].size+'</label>    &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp  <label style="width: 5%;"> '+productsList[i].mrp+'</label>&nbsp &nbsp <label style="width: 5%;">'+productsList[i].price+'</label>&nbsp &nbsp '+productsList[i].reorderPoint+'</a></li>';
			}else
				 op += '<li id="'+productsList[i].skuID+'"   onclick=getId(this,"'+searchCategory+'"); ><a><label style="width: 5%;">'+productsList[i].skuID+'</label>&nbsp &nbsp &nbsp <a><label style="width: 30%;">'+productsList[i].productName+'</label> &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp  <label style="width: 5%;">'+productsList[i].quantity+' </label> &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp    <label style="width: 3%;"> '+productsList[i].color+'</label> &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp    <label style="width: 5%;"> '+productsList[i].size+'</label>    &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp  <label style="width: 5%;"> '+productsList[i].mrp+'</label>&nbsp &nbsp <label style="width: 5%;">'+productsList[i].price+'</label>&nbsp &nbsp '+productsList[i].reorderPoint+'</a></li>';
		 }
	 }
	 $("."+searchCategory).html(op);
	 $("."+searchCategory).show();
	 
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
	 var storeLocation = $("#fromLocation option:selected").text();
		 if(storeLocation=='')
		 {
			 storeLocation =$("#fromLocation").val();
		 }
		 var type = $("#flowUnder").val();
	
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
	
/* function appendItemDetails(skuDetails){
	 debugger;
	 var parsedJson = jQuery.parseJSON(skuDetails);
		$("#searchItems").val("");
		skuList = parsedJson.skuLists;
		skuList = parsedJson.warehouseskumaster.warehouseSkuPriceLists;
		
		var storeLocation = $("#fromLocation option:selected").text();
		var type = $("#flowUnder").val();
		if(type == "warehouse" || type == "Warehouse"){
		warehouseskumaster=parsedJson.warehouseskumaster;
		
		var itemTrack = warehouseskumaster.trackingRequired;
		skuList[0].trackingRequired = itemTrack;
		if(warehouseskumaster.is_cost_price_editable!=null && warehouseskumaster.is_cost_price_editable!=undefined && warehouseskumaster.is_cost_price_editable!="")
			{
			skuList[0].costpriceEditable=warehouseskumaster.is_cost_price_editable;
			}
		if(skuList[0].hsnCode == null && warehouseskumaster != null){
			skuList[0].hsnCode = warehouseskumaster.hsnCode;
		}
		}




		
		skuList[0].hsnCode = parsedJson.warehouseskumaster.hsnCode;
		if(skuList.length >1){
			var priceLength = skuList.length;
			var priceArray = [];
			$("#itemsList tbody").html("");
			for(var i=0; i<priceLength; i++){
				if(type == "warehouse" || type == "Warehouse")
				skuList[i].trackingRequired = itemTrack;
				
				var price = skuList[i].price;
				if (! $.inArray(price, priceArray) > -1)
				{
					priceArray.push(price);
					var row = '<tr id=price'+i+' style="margin-top:5px;cursor:pointer white-space: nowrap;"> onclick=getItemPrice(this) ><td><input type="checkbox" name="selectall" class="selectableCheckbox" id="selectall" value='+i+' /></td><td>'+skuList[i].description+'</td><td>'+price+'</td><td>'+skuList[i].measureRange+'</td><td>'+skuList[i].productRange+'</td><td>'+skuList[i].brandCode+'</td><td>'+skuList[i].color+'</td><td>'+skuList[i].size+'</td><td>'+skuList[i].ean+'</td></tr>';
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
 */



 var warehouseskumaster = null;	
 function appendItemDetails(skuDetails){
	 debugger;
	 var parsedJson = jQuery.parseJSON(skuDetails);
		$("#searchItems").val("");
		skuList = parsedJson.skuLists;
		skuList[0].hsnCode = parsedJson.warehouseskumaster.hsnCode;
		var storeLocation = $("#fromLocation option:selected").text();
		var type = $("#flowUnder").val();
		if(type == "warehouse" || type == "Warehouse"){
		warehouseskumaster=parsedJson.warehouseskumaster;
		
		var itemTrack = warehouseskumaster.trackingRequired;
		skuList[0].trackingRequired = itemTrack;
		if(warehouseskumaster.is_cost_price_editable!=null && warehouseskumaster.is_cost_price_editable!=undefined && warehouseskumaster.is_cost_price_editable!="")
			{
			skuList[0].costpriceEditable=warehouseskumaster.is_cost_price_editable;
			}
		if(skuList[0].hsnCode == null && warehouseskumaster != null){
			skuList[0].hsnCode = warehouseskumaster.hsnCode;
		}
		}
		debugger;
		if(skuList.length >1){
			var priceLength = skuList.length;
			var priceArray = [];
			$("#itemsList tbody").html("");
			for(var i=0; i<priceLength; i++){
				
			if(type == "warehouse" || type == "Warehouse")
				skuList[i].trackingRequired = itemTrack;
			
				var price = skuList[i].price;
				if (! $.inArray(price, priceArray) > -1)
				{
					
					if(skuList[i].productBatchNo ==  null){
						skuList[i].productBatchNo = "";
					}
					if(skuList[i].expiry_date ==  null){
						skuList[i].expiry_date = "";
					}
					if(skuList[i].color ==  null){
						skuList[i].color = "";
					}
					if(skuList[i].size ==  null){
						skuList[i].size = "";
					}
					if(skuList[i].ean ==  null){
						skuList[i].ean = "";
					}
					
					
					priceArray.push(price);/*<td><input type="checkbox" name="selectall" class="selectableCheckbox" id="selectall" value='+i+' /></td><td>'+skuList[i].description+'</td><td>'+price+'</td><td>'+skuList[i].measureRange+'</td><td>'+skuList[i].productRange+'</td><td>'+skuList[i].brandCode+'</td><td>'+skuList[i].color+'</td><td>'+skuList[i].size+'</td><td>'+skuList[i].ean+'</td></tr>';
*/				var row = '<tr id=price'+i+' style="margin-top:5px;cursor:pointer white-space: nowrap;"> onclick=getItemPrice(this) ><td><input type="checkbox" name="selectall" class="selectableCheckbox" id="selectall" value='+i+' /></td><td>'+skuList[i].description+'</td><td>'+skuList[i].productBatchNo+'</td><td>'+skuList[i].expiry_date+'</td><td>'+skuList[i].quantity+'</td><td>'+price+'</td><td>'+skuList[i].color+'</td><td>'+skuList[i].size+'</td><td>'+skuList[i].ean+'</td><td>'+skuList[i].mrp+'</td></tr>';
					//'<li id="'+productsList[i].skuID+'"  class="selected" onclick=getId(this,"'+searchCategory+'"); ><a>'+productsList[i].description+'   -   '+productsList[i].skuID+'</a></li>';
					$("#itemsList tbody").append(row);
				}
			}
			var  op = '<a id="selectPrice"  data-toggle="modal" data-target="#items-modals"></a>';
			 $("#triggerEvent").append(op);
			 $("#selectPrice" ).trigger( "click");
			 $("#triggerEvent").html("");
		}
		else{
			addSku(skuList[0]);
		}
 }






 function addItem(sku){
	 debugger;
	 var contextPath = $("#contextPath").val();
	 var len = parseInt($("#productsList tr").length);
		if (len != 1)
			len = parseInt($("#productsList tr:last").attr("id").replace('dynamicdiv', '')) + 1;
		for (var i = 1; i <= len; i++) {
			if ($("#skuId" + i).val() == sku.skuId && $("#itemPrice"+i).text() == sku.price && $("#pluCode" + i).val() == sku.pluCode) {
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
		var uom = sku.uom;
		if(uom == "" || uom == null)
			uom = "";
		var make = sku.make;
		if(make == "" || make == null)
			make = "";
		var model = sku.model;
		if(model == "" || model == null)
			model = "";
		var color = sku.color;
		if(color == "" || color == null)
			color = "";
		var size = sku.size;
		if(size == "" || size == null)
			size = "";
		var hsnCode = sku.hsnCode;
		if(hsnCode== null || hsnCode == undefined || hsnCode == ""){
			hsnCode = "";
		}
		var ean = sku.ean;
		if(ean== null || ean == undefined || ean == ""){
			ean ="";
		}
		var taxValue = sku.taxValue;
		if(taxValue== null || taxValue == undefined || taxValue == ""){
			taxValue ="";
		}
		
		var slNo = 1; 
		 $('.slno').each(function(){
			$(this).text(slNo);
			slNo = parseInt(slNo) + 1;
		});
		var row = "<tr id='dynamicdiv"+len+"' style='margin-top:5px;'><td class='slno'>"+slNo+"</td><td id='itemId"+len+"'>"+sku.skuId+"</td>" +
 		"<input type='hidden' id='skuId"+len+"' value='"+sku.skuId+"'/>" +
 		"<input type='hidden' id='pluCode"+len+"' value='"+sku.pluCode+"'/>" +
 		"<td id='ean"+len+"'>"+ean+"</td>" +
 		"<td id='hsn"+len+"'>"+hsnCode+"</td>" +
/* 		"<td id='itemDesc"+len+"'>"+description+"</td>" +
*/		"<td id='itemDesc"+len+"'><div id='overflowtext'><a href='#' data-toggle='tooltip'  title='"+description+"'>"+description+"</a></div></td>"+

 		
 		
 				"<td id='uom"+len+"'>"+uom+"</td>" +
 		"<td class='Price' id='itemPrice"+len+"'>"+sku.costPrice+"</td>" +
 		"<td id='quantity"+len+"' class='Pack' onBlur='changeOrderedPack(this);' onchange='return (this.innerText.length < 10)' onkeypress='PreventEnter(this);' contenteditable='true'>1</td>" +
 		"<td class='cost' id='totalCost"+len+"'>"+sku.costPrice+"</td>" +
 		"<td class='taxvalue' id='taxvalue"+len+"'>"+sku.taxValue+"</td>" +
 		"<td><textarea id='remarks"+len+"' rows=1 style='resize:none;width: 150px;'></textarea></td>"+
 		"<input type='hidden' id='make"+len+"' value='"+make+"'/><input type='hidden' id='model"+len+"' value='"+model+"'/><input type='hidden' id='color"+len+"' value='"+color+"'/>" +
 		"<input type='hidden' id='size"+len+"' value='"+size+"'/><td id='Del"+ len +"' ><img id='Img"+ len +"' src='"+contextPath+"/images/itemdelete.png' style='width:15%;cursor:pointer;' onclick='deleteItemDetails(this);' title='Delete "+sku.skuId+"'/>" +
 		"</td></tr>";
		$("#productsList tbody").append(row);
		changeTotalOrderCost();
}
		
 function changeTotalOrderCost(shipcharge){
	 debugger;
	 var subtotalCost = 0.0;
	 var totalCost = 0.0;
	 var totalTax = 0.0;
	 if(shipcharge == null || shipcharge == undefined || shipcharge == ""){
		 if( $('#shipmentCharges').val() == null ||  $('#shipmentCharges').val() == undefined ||  $('#shipmentCharges').val() == ""){
		 
			 shipcharge = 0;
	 }else{
		 shipcharge = $('#shipmentCharges').val();
		 }
	 }
		$('.cost').each(function(){
			  var rowNo = $(this).attr("id").replace('totalCost','');
			  var cost = $("#totalCost"+rowNo).html();
			  var taxValue = $("#taxvalue"+rowNo).html();
            
			  totalTax = totalTax + parseFloat(taxValue);
			  subtotalCost = subtotalCost + parseFloat(cost)-taxValue;
			 totalCost = totalCost + parseFloat(cost);
			 });
		if(Number.isNaN(totalTax)){
			totalTax=0;
		}
		if(Number.isNaN(subtotalCost)){
			subtotalCost=0;
		}
		if(Number.isNaN(totalCost)){
			totalCost=0;
		}
		var totalCostship = totalCost+parseFloat(shipcharge);
		if(Number.isNaN(totalCostship)){
			totalCostship=0;
		}
		
		$('#goodsVal').val(subtotalCost.toFixed(2));
		$('#taxValue').val(totalTax.toFixed(2));
		$('#totalcost').val(totalCostship.toFixed(2));
		
		/*var shipmentCost = $("#shipping_cost").val();
		if($('#shipping_cost').val()!="")
			totalCost = totalCost + parseFloat(shipmentCost);
		var tax = $("#total_tax").val();
		if(tax != "")
			totalCost = totalCost + parseFloat(tax);
		$("#totalCost").val(totalCost);*/
		
	}
 
 $('#total_tax').on('input',function(e){
	// if($('#shipping_cost').val()!="")
		 changeTotalOrderCost();
 });
 
 $('#shipping_cost').on('input',function(e){
		// if($('#shipping_cost').val()!="")
			 changeTotalOrderCost();
	 });
 $('#shipmentCharges').on('input',function(e){
	var shipcharge = $('#shipmentCharges').val();
		// if($('#shipping_cost').val()!="")
	 
	changeTotalCost();
	 });

 function changeOrderedPack(element){
		var id = $(element).attr("id");
		if (isNaN($("#"+id).html()) || $("#"+id).html() == "")
			$('#'+id).html("1");
		var rowNo = id.replace('quantity','');
		//isNumeric(element);
		var packVal = parseInt($('#quantity'+rowNo).html());
		if(packVal<=0){
				$('#Error').html("Pack should not be empty");
			var priceVal = parseFloat($('#itemPrice'+rowNo).html());
			$('#quantity'+rowNo).html(1);
			$('#totalCost'+rowNo).html(priceVal);
		}else{
			var priceVal = parseFloat($('#itemPrice'+rowNo).html());
			$('#totalCost'+rowNo).html(packVal*priceVal);
		}
		changeTotalOrderCost();
	}
 

 function activateTextBox(ele){
	 if($(ele).attr("name") == "returnReason"){
		 var id = $(ele).attr("id");
		 $(".returnReason").each(function(){
			 if($(this).attr("id") == id+"Txt" && $(ele).prop("checked") == true){
				 $(this).removeAttr("readonly");
				 if($(this).attr("id") == "overShipmentTxt" || $(this).attr("id") == "substitutionTxt")
					 $(this).val($("#selected_po_ref").val());
			 }
			 else{
				 $(this).attr("readonly","readonly");
				 $(this).val("");
			 }
			 
		 });
	 }else  if($(ele).attr("name") == "actionRequired"){
		 var id = $(ele).attr("id");
		 $(".actionRequired").each(function(){
			 if($(this).attr("id") == id+"Txt" && $(ele).prop("checked") == true)
				 $(this).removeAttr("readonly");
			 else{
				 $(this).attr("readonly","readonly");
				 $(this).val("");
			 }
		 });
	 }
 }
 
 function validateShipmentReturn(status,type){
	 debugger;
	 //purpose:for checking internet conection
		var online = window.navigator.onLine;
	  	if(!online)
	  	{
	  	alert("check your internet connection,please try agian after some time");
	  	return;
	  	}
	 $(".Error").html("");
	 if($("#fromLocation  option:selected").text() == ""){
		 $("#Error").html("Please Select Location");
		 focusDiv('Error');
		 return;
	 }
	 
	 if(parseInt($("#returnBy").val().length)>30){
		 $("#returnBy").focus();
			$("#returnByError").html("Returned By can't exceeds 30 Characters");
			return;
	}else{
   	 $("#returnByError").html(" ");
 }
	
	if(parseInt($("#supplierLocation").val().length)>50){
		 $("#supplierLocation").focus();
			$("#supplierLocationError").html("Supplier Location can't exceeds 50 Characters");
			return;
	}else{
   	 $("#supplierLocationError").html(" ");
 }
	
	if(parseInt($("#supplierShipmentRef").val().length)>25){
		 $("#supplierShipmentRef").focus();
			$("#supplierShipmentRefError").html("GRN Ref can't exceeds 25 Characters");
			return;
	}else{
   	 $("#supplierShipmentRefError").html(" ");
 }
	
	if(parseInt($("#pickedby").val().length)>50){
		 $("#pickedby").focus();
			$("#pickedbyError").html("Picked By can't exceeds 50 Characters");
			return;
	}else{
   	 $("#pickedbyError").html(" ");
 }
	 
	 if($("#supplierNameError").text() != ""){
			$("#supplierNameError").html("Supplier Name doesn't exist");
			focusDiv('supplierNameError');
			return false;
		}
	  if($("#searchSupplier").val().trim() == ""){
		  $("#supplierNameError").html("Enter Supplier Name");
		  $("#searchSupplier").focus();
		  return;
	  }
	 /* if($("#supplier_Id").val() == ""){
		  $("#supplierNameError").html("Supplier Name doesn't exist");
		  $("#searchSupplier").focus();
		  return;
	  }*/

     if(type != "new"){
      if($('#statusissue').val() == '' && $('#currentstatus').val() != "Draft"){
       $('#Error').html("Shipment return Already in "+$('#currentstatus').val()+" State");
        return false;
            		 }
        }

	  if($("#returnDateStr").val() == ""){
		  $("#returnDateStrError").html("Enter Return Date");
		  focusDiv('returnDateStrError');
		  return;
	  }
	 var len = $("#productsList tr").length-1;
		var finalObj = {},stockReturnItems = [];
		finalObj.stockReturnItems = stockReturnItems;
		if(len == 0){
			$("#Error").html("Add Atleast One Item to List");
			focusDiv('Error');
			return;
			}
		for(var i=1;i<=len;i++){
			var idAttr = $("#productsList tr:eq("+i+") td:last").attr("id").replace('Del','');
			//var obj = {itemId:$("#skuId"+idAttr).val(),pluCode:$("#pluCode"+idAttr).val(),itemDesc:$("#itemDesc"+idAttr).text(),costPrice:$("#itemPrice"+idAttr).text(),quantity:$("#quantity"+idAttr).text(),itemTotalValue:$("#totalCost"+idAttr).text(),uom:$("#uom"+idAttr).text(),remarks:$("#remarks"+idAttr).val(),make:$("#make"+idAttr).val(),model:$("#model"+idAttr).val(),color:$("#color"+idAttr).val(),size:$("#size"+idAttr).val(),ean:$("#ean"+idAttr).text(),hsnCode:$("#hsn"+idAttr).text(),taxValue:$("#taxvalue"+idAttr).text()};
			var obj = {bactchNum:$("#batchNum"+idAttr).val(),productBatchNo:$("#batchNum"+idAttr).val(),ean:$("#ean"+idAttr).text(),hsnCode:$("#hsnCode"+idAttr).text(),igstValue:$("#igsttax"+idAttr).text(),cessAmt:$("#cess"+idAttr).text(),cgstValue:$("#cgsttax"+idAttr).text(),sgstValue:$("#sgsttax"+idAttr).text(),igstRate:$("#igsttaxRate"+idAttr).val(),cgstRate:$("#cgstsgsttaxRate"+idAttr).val(),sgstRate:$("#cgstsgsttaxRate"+idAttr).val(),utility:$("#utility"+idAttr).val(),itemTax:$("#tax"+idAttr).html(),cessRate:$("cessTaxRate"+idAttr).val(),color:$("#color"+idAttr).val(),size:$("#size"+idAttr).val(),category:$("#category"+idAttr).val(),measurementRange:$("#measureRange"+idAttr).val(),productRange:$("#productRange"+idAttr).val(),brand:$("#brandCode"+idAttr).val(),uom:$("#Make"+idAttr).text(),itemId:$("#skuId"+idAttr).val(),pluCode:$("#pluCode"+idAttr).val(),itemDesc:$("#Name"+idAttr).text(),itemDesc:$("#Desc"+idAttr).text(),orderPrice:$("#SPrice"+idAttr).text(),supplyPrice:$("#Price"+idAttr).text(),suppliedQty:$("#Pack"+idAttr).text(),quantity:$("#Pack"+idAttr).text(),orderQty:$("#Requested"+idAttr).text(),costPrice:$("#Cost"+idAttr).text(),mrp:$("#mrp"+idAttr).val(),remarks:$("#remarks"+idAttr).val()};

			finalObj.stockReturnItems.push(obj);
		}
		finalObj.purchaseStockReturnRef = $("#purchaseStockReturnRef").val();
		finalObj.fromLocation =  $("#fromLocation  option:selected").text();
		finalObj.returnBy = $("#returnBy").val();
		finalObj.pickedBy = $("#pickedby").val();
		finalObj.transportMode = $("#transportMode").val();
		finalObj.poRef = $("#po_reference").val();;
		finalObj.returnDateStr = $("#returnDateStr").val()+" 00:00:00";
		finalObj.supplierId = $("#supplier_Id").val();
		finalObj.supplierDescription = $("#searchSupplier").val();
		finalObj.supplierLocation = $("#supplierLocation").val();
		finalObj.supplierShipmentRef = $("#supplierShipmentRef").val();
		//finalObj.grnRef = $("#supplierShipmentRef").val();
		finalObj.goodsVal = $("#goodsVal").val();
		finalObj.type = type;
		
		 if($("#statusissue").val() == undefined ||  $("#statusissue").val() == ""){
			finalObj.status = status;
		}else{
			finalObj.status = $("#statusissue").val();
		}
		
		if($("#taxValue").val() != "")
			finalObj.taxValue = $("#taxValue").val();
		if($("#shipmentCharges").val() != "")
			finalObj.shipmentCharges = $("#shipmentCharges").val();
		var returnReason = $("input[name=returnReason]:checked").val();
		finalObj.returnReason = returnReason;
		var id = $("input[name=returnReason][value='"+returnReason+"']").attr("id");
		if($("#"+id+"Txt").length > 0){
			if($("#"+id+"Txt").val() == ""){
				$("#"+id+"Txt").focus();
				return
			}
			finalObj.returnComments = $("#"+id+"Txt").val();
		}
		if($("input[name=actionRequired]:checked").val() == "Other"){
			if($("#otherTxt").val() == ""){
				$("#otherTxt").focus();
				return;
			}
			else	
				finalObj.actionRequired = $("#otherTxt").val();
		}
		else
			finalObj.actionRequired = $("input[name=actionRequired]:checked").val();
		finalObj.flowUnder = $('#flowUnder').val();
		var formData  = JSON.stringify(finalObj);
		console.log(formData);
	var contextPath = $("#contextPath").val();
//	if(type == "new")
		URL = contextPath + "/procurement/createShipmentReturn.do";
//	else
//		URL = contextPath + "/procurement/updateShipmentReturn.do";
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
 
 //Modified by Surya.k on 27/08/2019
 function searchShipmentReturns(name,searchCategory,index,search){
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
		
		var category = ""
			if($("#outletCategory").length > 0)
				category = $("#outletCategory").val();
		
		var subcategory = ""
			if($("#outletSubcategory").length > 0)
				subcategory = $("#outletSubcategory").val();
		
		var supplier = ""
			if($("#searchSupplier").length > 0)
				supplier = $("#searchSupplier").val();
		
		var supplierid = ""
			if($("#supplier_Id").length > 0)
				supplierid = $("#supplier_Id").val();
 
            name=""
		 if($("#searchShipmentReturnsId").length>0)
			name = $("#searchShipmentReturnsId").val();
            
		var maxRecords = 10;
		if($("#maxRecords").length > 0)
			maxRecords = $("#maxRecords").val();
		var startDate = "";
		 var endDate = "";
		 if($("#from").val() != "" && $("#to").val() != ""){
			
			 debugger
			 var noOfDays = daydiff(parseDate($('#from').val()), parseDate($('#to').val()));
			 if(noOfDays < 0){
				 	$('#EndDateError').html("End Date can't be less than Start Date");
				     return;
		 }else{
		  	   	 $("#EndDateError").html(" ");
		  	 }
			 
			 startDate = $("#from").val() + " 00:00:00";
			 endDate = $("#to").val() + " 23:59:59";
		}else if($("#from").val() != "")
			 startDate = $("#from").val() + " 00:00:00";
		else if($("#to").val() != "")
				endDate = $("#to").val() + " 23:59:59";
		 var contextPath = $("#contextPath").val();
		 var flowUnder = $("#flowUnder").val();
		 
		 var currentDate = getSystemDate();
			if ($("#from").val() != "" && currentDate != "") {
	   	   		var noOfDays = daydiff(parseDate($("#from").val()), parseDate(currentDate));
	   	   		if (noOfDays < 0) {
	   	   				$('#Error').html("Start Date can't be grater than Current Date");
	   	   			$("#from").val("");
	   	   			return;
	   	   		}
	   	   	}
			if (currentDate != "" && $("#to").val() != "") {
	   	   		var noOfDays = daydiff(parseDate($("#to").val()), parseDate(currentDate));
	   	   		if (noOfDays < 0) {
	   	   				$('#Error').html("End Date can't be grater than Current Date");
	   	   			$("#to").val("");
	   	   			return;
	   	   		}
	   	   	}
		 
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
		 if(search=="clear"){
			 name="";
			 location="";
			 startDate="";
			 endDate="";
			 
		 }
		
		 URL = contextPath + "/procurement/searchShipmentReturns.do";
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
					locationList : locationList,
					category : category,
					subcategory :subcategory,
					supplier : supplier,
					supplierid : supplierid
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

 
 //modified by koti bommineni
 function addSku(sku){
	 var contextPath = $("#contextPath").val();
	 var len = parseInt($("#productsList tr").length);
		if (len != 1)
			len = parseInt($("#productsList tr:last").attr("id").replace('dynamicdiv', '')) + 1;
		
		
		debugger;
		
		 if(sku.trackingRequired == false){
		for (var i = 1; i <= len; i++) {
			if ($("#skuId" + i).val() == sku.skuId && $("#Price"+i).text() == sku.costPrice && $("#pluCode" + i).val() == sku.pluCode && sku.trackingRequired == false) {
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
/*   				"<td class='sticky-col fifth-col' style='background: #f9f9f9;' id='itemScanCode"+len+"' class='itemScanCode'  contenteditable='true'>"+sku.itemScanCode+"</td>" +
*/   			"<input type='hidden' id='trackingRequired"+len+"' name ='trackingRequired' class='trackingRequired' value='"+sku.trackingRequired+"'/>"+
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
    			"<input type='hidden' id='cgstTaxAmt"+len+"' value='"+taxamount+"'/>" +
    			"<input type='hidden' id='cgstsgsttaxRate"+len+"' value='"+parseFloat(sgstTaxRate).toFixed(2)+"'/>" +
    			"<input type='hidden' id='cessTaxRate"+len+"' value='"+parseFloat(cessRate).toFixed(2)+"'/>" +
    			"<input type='hidden' id='igsttaxRate"+len+"' value='"+parseFloat(igstRate).toFixed(2)+"'/>" +
    			"<input type='hidden' id='taxationlist"+len+"' value='"+JSON.stringify(sku.tax)+"'/>" +
    			"<td class='sticky-col fifth-col' style='background: #f9f9f9;' id='Desc"+len+"' style='width:30%'>"+description+"</td>"+
    			"<td><textarea id='batchNum"+len+"' rows=1 style='resize:none;width: 87px;'>"+sku.productBatchNo+"</textarea></td>"+
    			"<td >"+sku.measureRange+"</td>" +
    			"<td id='Make"+len+"'>"+make+"</td>" +
    			"<td><input type='text' id='mrp"+len+"'  style='width:70px;text-align:center' value='"+sku.mrp+"'></td>"+
    			"<td id='Requested"+len+"' class='Requested' >0</td>" +
    			"<td class='Price' id='SPrice"+len+"'>0</td>" +
    			"<td  id='tax"+len+"' onBlur='changeGrnTax(this);' contenteditable='true'>"+parseFloat((taxRate*2)+igstRate).toFixed(2)+"</td>" +
    			"<td  id='cgsttax"+len+"'>"+parseFloat(cgstTaxRate).toFixed(2)+"</td>" +
    	 		"<td  id='sgsttax"+len+"'>"+parseFloat(sgstTaxRate).toFixed(2)+"</td>" +
    	 		"<td id='igsttax"+len+"'>"+parseFloat(igstRate).toFixed(2)+"</td>"+
    	 		"<td id='cess"+len+"'>"+parseFloat(cessRate).toFixed(2)+"</td>"+
    	 		"<td id='Pack"+len+"' class='Pack' onBlur='changePack(this);' onkeypress='PreventEnter(this);' contenteditable='true'>1</td>" +
    			"<td class='Price' id='Price"+len+"' onBlur='changeSupplyPrice(this);' onkeypress='PreventEnter(this);' type='number' contenteditable='true'>"+sku.costPrice+"</td>" +
    			"<td id='Cost"+len+"'>"+sku.costPrice+"</td>" +
    	 		"<td><textarea id='remarks"+len+"' rows=1 style='resize:none;width: 150px;'></textarea></td>"+
    			"<td id='Del"+len+"'>" +
    			"<img id='Img"+len+"' src='"+contextPath+"/images/itemdelete.png' style='width:32%;cursor:pointer;' onclick='deleteItem(this);' title='Delete "+sku.skuId+"'/></td></tr>";
					$("#productsList tbody").append(row);
    			$("#Pack"+len).focus();
				$("#dynamicdiv"+(len-1)).css("background","none");
				$("#dynamicdiv"+len).css("background","lightgreen", "important");
				}
				else{
					var row = "<tr id='dynamicdiv"+len+"' style='margin-top:5px;'><td class='slno sticky-col first-col' style='background: #f9f9f9;' >"+slNo+"</td><td class='sticky-col second-col' style='background: #f9f9f9; id='Name"+len+"'>"+sku.skuId+"</td>" +
   				"<td class='sticky-col third-col' style='background: #f9f9f9;' id='ean"+len+"'>"+sku.ean+"</td>" +
   				"<td class='sticky-col fourth-col' style='background: #f9f9f9;' id='hsnCode"+len+"' contenteditable='true'>"+sku.hsnCode+"</td>" +
/*   				"<td class='sticky-col fifth-col' style='background: #f9f9f9;' id='itemScanCode"+len+"' class='itemScanCode'  contenteditable='true'>"+sku.itemScanCode+"</td>" +
*/   				"<input type='hidden' id='trackingRequired"+len+"' name ='trackingRequired' class='trackingRequired' value='"+sku.trackingRequired+"'/>"+
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
    			"<input type='hidden' id='cgstTaxAmt"+len+"' value='"+taxamount+"'/>" +
    			"<input type='hidden' id='cgstsgsttaxRate"+len+"' value='"+parseFloat(sgstTaxRate).toFixed(2)+"'/>" +

    			"<input type='hidden' id='cessTaxRate"+len+"' value='"+parseFloat(cessRate).toFixed(2)+"'/>" +
    			"<input type='hidden' id='igsttaxRate"+len+"' value='"+parseFloat(igstRate).toFixed(2)+"'/>" +
    			"<input type='hidden' id='taxationlist"+len+"' value='"+JSON.stringify(sku.tax)+"'/>" +
    			
				"<td id='Desc"+len+"' style='width:300px!important;text-align: left;background-color: #f9f9f9 !important;' class='sticky-col fifth-col'><div id='overflowtext'><a href='#' data-toggle='tooltip'  title='"+description+"'>"+description+"</a></div></td>"+

//    			"<td class='sticky-col sixth-col' style='background: #f9f9f9;' id='Desc"+len+"' style='width:30%'>"+description+"</td>"+
    			"<td><textarea id='batchNum"+len+"' rows=1 style='resize:none;width: 87px;'>"+sku.productBatchNo+"</textarea></td>"+
    			"<td >"+sku.measureRange+"</td>" +
    			"<td id='Make"+len+"'>"+make+"</td>" +
    			"<td><input type='text' id='mrp"+len+"'  style='width:70px;text-align:center' disabled='disabled' value='"+sku.mrp+"'></td>"+
    			"<td id='Requested"+len+"' class='Requested' >0</td>" +
    			"<td class='Price' id='SPrice"+len+"'>0</td>" +
    			"<td  id='tax"+len+"' onBlur='changeGrnTax(this);' contenteditable='true'>"+parseFloat((taxRate*2)+igstRate).toFixed(2)+"</td>" +
    			"<td  id='cgsttax"+len+"'>"+parseFloat(cgstTaxRate).toFixed(2)+"</td>" +
    	 		"<td  id='sgsttax"+len+"'>"+parseFloat(sgstTaxRate).toFixed(2)+"</td>" +
    	 		"<td id='igsttax"+len+"'>"+parseFloat(igstRate).toFixed(2)+"</td>"+
    	 		"<td id='cess"+len+"'>"+parseFloat(cessRate).toFixed(2)+"</td>"+
    	 		"<td id='Pack"+len+"' class='Pack' onBlur='changePack(this);' onkeypress='PreventEnter(this);' contenteditable='true'>1</td>" +
    			"<td class='Price' id='Price"+len+"' onBlur='changeSupplyPrice(this);' onkeypress='PreventEnter(this);' type='number' contenteditable='true'>"+sku.costPrice+"</td>" +
    			"<td id='Cost"+len+"'>"+sku.costPrice+"</td>" +
    	 		"<td><textarea id='remarks"+len+"' rows=1 style='resize:none;width: 150px;'></textarea></td>"+

    			"<td id='Del"+len+"'>" +
    			"<img id='Img"+len+"' src='"+contextPath+"/images/itemdelete.png' style='width:32%;cursor:pointer;' onclick='deleteItem(this);' title='Delete "+sku.skuId+"'/></td></tr>";
					
					$("#productsList tbody").append(row);
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
/*   				"<td class='sticky-col fifth-col' style='background: #f9f9f9;' id='itemScanCode"+len+"'   class='itemScanCode'  contenteditable='true'>"+sku.itemScanCode+"</td>" +
*/   				"<input type='hidden' id='trackingRequired"+len+"' class='trackingRequired' value='"+sku.trackingRequired+"'/>"+
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
    			"<input type='hidden' id='cgstTaxAmt"+len+"' value='"+taxamount+"'/>" +
    			"<input type='hidden' id='cgstsgsttaxRate"+len+"' value='"+parseFloat(sgstTaxRate).toFixed(2)+"'/>" +

    			"<input type='hidden' id='cessTaxRate"+len+"' value='"+parseFloat(cessRate).toFixed(2)+"'/>" +
    			"<input type='hidden' id='igsttaxRate"+len+"' value='"+parseFloat(igstRate).toFixed(2)+"'/>" +
    			"<input type='hidden' id='taxationlist"+len+"' value='"+JSON.stringify(sku.tax)+"'/>" +
    			"<td class='sticky-col fifth-col' style='background: #f9f9f9;' id='Desc"+len+"' style='width:30%'>"+description+"</td>"+
    			"<td><textarea id='batchNum"+len+"' rows=1 style='resize:none;width: 87px;'>"+sku.productBatchNo+"</textarea></td>"+
    			"<td >"+sku.measureRange+"</td>" +
    			"<td id='Make"+len+"'>"+make+"</td>" +
    			"<td><input type='text'id='mrp"+len+"'  style='width:70px;text-align:center' value='"+sku.mrp+"'></td>"+
    			"<td id='Requested"+len+"' class='Requested' >0</td>" +
    			"<td class='Price' id='SPrice"+len+"'>0</td>" +
    			"<td  id='tax"+len+"' onBlur='changeGrnTax(this);' contenteditable='true'>"+parseFloat((taxRate*2)+igstRate).toFixed(2)+"</td>" +
    			"<td  id='cgsttax"+len+"'>"+parseFloat(cgstTaxRate).toFixed(2)+"</td>" +
    	 		"<td  id='sgsttax"+len+"'>"+parseFloat(sgstTaxRate).toFixed(2)+"</td>" +
    	 		"<td id='igsttax"+len+"'>"+parseFloat(igstRate).toFixed(2)+"</td>"+
    	 		"<td id='cess"+len+"'>"+parseFloat(cessRate).toFixed(2)+"</td>"+
    	 		"<td id='Pack"+len+"' class='Pack' onBlur='changePack(this);' onkeypress='PreventEnter(this);' type='number' contenteditable='true'>1</td>" +
    			"<td class='Price' id='Price"+len+"' onBlur='changeSupplyPrice(this);' onkeypress='PreventEnter(this);' type='number' contenteditable='true'>"+sku.costPrice+"</td>" +
    			"<td id='Cost"+len+"'>"+sku.costPrice+"</td>" +
    	 		"<td><textarea id='remarks"+len+"' rows=1 style='resize:none;width: 150px;'></textarea></td>"+

    				"<td id='Del"+len+"'>" +
    			"<img id='Img"+len+"' src='"+contextPath+"/images/itemdelete.png' style='width:12%;cursor:pointer;' onclick='deleteItem(this);' title='Delete "+sku.skuId+"'/></td></tr>";
    			$("#productsList tbody").append(row);
				}
				else
				{
					var row = "<tr id='dynamicdiv"+len+"' style='margin-top:5px;'><td class='slno sticky-col first-col' style='background: #f9f9f9;'>"+slNo+"</td><td  class='sticky-col second-col' style='background: #f9f9f9; id='Name"+len+"'>"+sku.skuId+"</td>" +
   				"<td class='sticky-col third-col' style='background: #f9f9f9; id='ean"+len+"'>"+sku.ean+"</td>" +
   				"<td class='sticky-col fourth-col' style='background: #f9f9f9;' id='hsnCode"+len+"' contenteditable='true'>"+sku.hsnCode+"</td>" +
/*   				"<td class='sticky-col fifth-col' style='background: #f9f9f9;' id='itemScanCode"+len+"'   class='itemScanCode'  contenteditable='true'>"+sku.itemScanCode+"</td>" +
*/   				"<input type='hidden' id='trackingRequired"+len+"' class='trackingRequired' value='"+sku.trackingRequired+"'/>"+
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
    			"<input type='hidden' id='cgstTaxAmt"+len+"' value='"+taxamount+"'/>" +
    			"<input type='hidden' id='cgstsgsttaxRate"+len+"' value='"+parseFloat(sgstTaxRate).toFixed(2)+"'/>" +

    			"<input type='hidden' id='cessTaxRate"+len+"' value='"+parseFloat(cessRate).toFixed(2)+"'/>" +
    			"<input type='hidden' id='igsttaxRate"+len+"' value='"+parseFloat(igstRate).toFixed(2)+"'/>" +
    			"<input type='hidden' id='taxationlist"+len+"' value='"+JSON.stringify(sku.tax)+"'/>" +
    			"<td class='sticky-col fifth-col' style='background: #f9f9f9;' id='Desc"+len+"' style='width:30%'>"+description+"</td>"+
    			"<td><textarea id='batchNum"+len+"' rows=1 style='resize:none;width: 87px;'>"+sku.productBatchNo+"</textarea></td>"+
    			"<td >"+sku.measureRange+"</td>" +
    			"<td id='Make"+len+"'>"+make+"</td>" +
    			"<td><input type='text'id='mrp"+len+"'  style='width:70px;text-align:center' disabled='disabled' value='"+sku.mrp+"'></td>"+
    			"<td id='Requested"+len+"' class='Requested' >0</td>" +
    			"<td class='Price' id='SPrice"+len+"'>0</td>" +
    			"<td  id='tax"+len+"' onBlur='changeGrnTax(this);' contenteditable='true'>"+parseFloat((taxRate*2)+igstRate).toFixed(2)+"</td>" +
    			"<td  id='cgsttax"+len+"'>"+parseFloat(cgstTaxRate).toFixed(2)+"</td>" +
    	 		"<td  id='sgsttax"+len+"'>"+parseFloat(sgstTaxRate).toFixed(2)+"</td>" +
    	 		"<td id='igsttax"+len+"'>"+parseFloat(igstRate).toFixed(2)+"</td>"+
    	 		"<td id='cess"+len+"'>"+parseFloat(cessRate).toFixed(2)+"</td>"+
    	 		"<td id='Pack"+len+"' class='Pack' onBlur='changePack(this);' onkeypress='PreventEnter(this);' type='number' contenteditable='true'>1</td>" +
    			"<td class='Price' id='Price"+len+"' onBlur='changeSupplyPrice(this);' onkeypress='PreventEnter(this);' type='number' contenteditable='true'>"+sku.costPrice+"</td>" +
    			"<td id='Cost"+len+"'>"+sku.costPrice+"</td>" +
    	 		"<td><textarea id='remarks"+len+"' rows=1 style='resize:none;width: 150px;'></textarea></td>"+

    			"<td id='Del"+len+"'>" +
    			"<img id='Img"+len+"' src='"+contextPath+"/images/itemdelete.png' style='width:32%;cursor:pointer;' onclick='deleteItem(this);' title='Delete "+sku.skuId+"'/></td></tr>";
					
					$("#productsList tbody").append(row);
    			$("#Pack"+len).focus();
				$("#dynamicdiv"+(len-1)).css("background","none");
				$("#dynamicdiv"+len).css("background","lightgreen", "important");
				}
				
				 
				 }
			 
			}
		
	 changeTotalCost();
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
 	  //modified by manasa
 	  var cost = $("#Price"+rowNo).html();
 	  
 	  var costPriceForTax = $("#Price"+rowNo).html()*$("#Pack"+rowNo).html();

 	  
 	  
 	  var received = $('#Pack'+rowNo).html();
 	  totalCost = parseFloat(cost)*parseFloat(received)+totalCost;
 	  var taxvalue =  parseFloat(($("#tax"+rowNo).html()*$("#Cost"+rowNo).html())/100);
 	  $('#Pack'+rowNo).html(parseFloat(received).toFixed(2))
 	 
 	  
 	  /*if(sku.trackingRequired == false)
 			 $(".Pack").attr("contenteditable",true);
 			 else
 			$(".Pack").attr("contenteditable",false); */
 	  /*//added by manasa
 	  purpose:to caluclate cgst and sgst taxes
 	   */
 	  
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
 				 
 				var  itemTaxExcl = ( ((parseFloat(costPriceForTax) * (parseFloat(cgstTaxRate+sgstTaxRate+igstRate))) / 100));
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
 					
 					$("#cgstsgsttaxRate"+rowNo).val(sgstTaxRate);	 
 					$("#igsttaxRate"+rowNo).val(igstRate);	 
 				 }else{
 					 igstRate = 0.0;
 					$("#cgstsgsttaxRate"+rowNo).val(sgstTaxRate);	 
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
 				 $('#Cost'+rowNo).html(parseFloat(costPriceForTax));
 			
 			 }else{
 				 $('#Cost'+rowNo).html(parseFloat(costPriceForTax+itemTax+cessTaxExc+cessTaxInc+IGSTTaxExc+IGSTTaxInc).toFixed(2));
  
 			 }
 				 
 				 noofitems = noofitems+  parseFloat($("#Pack"+rowNo).html());
 			 
 			 countValue = countValue+1;

 		 
 	  
 	 });
 	
 	$("#totalqty").val(noofitems);
 	 $("#noofitems").val(countValue);
 	
 	 $("#cgstAmt").val(parseFloat(cgstAmt).toFixed(2));
 	 $("#sgstAmt").val(parseFloat(sgstAmt).toFixed(2));
 	
 	 	var totalcost=parseFloat(totalCost);
 	 	
 	 	 if($("#taxInclusive").is(':checked'))
 		 {
 	 		 totaltax = totaltax + parseFloat(itemTaxfinal)+cessTaxIncfinal+IGSTTaxIncfinal;
 	 		totalcost	= (totalcost-totaltax);
 	 		totalCost	= (totalCost-totaltax);
 	 		
 		  $('#goodsVal').val(totalcost.toFixed(2));
 		 }else{
 			 totaltax = totaltax + parseFloat(itemTaxfinal)+cessTaxExcfinal+IGSTTaxExcfinal;
 			 $('#goodsVal').val(totalcost.toFixed(2)); 
 		 }
 		
 		var shipmentCost = $("#shipmentCharges").val();
 		if($('#shipmentCharges').val()!="")
 			totalCost = totalCost + parseFloat(shipmentCost);
 	
 		if(totaltax!= undefined)
 			{
 			if (totaltax != "" && isNaN(totaltax))
 			console.info(totaltax);	
 			else
 				{
 				
 			$("#taxValue").val(parseFloat(totaltax).toFixed(2));
 			
 				}
 			}
 		
 		$("#totalcost").val(parseFloat(totalCost+totaltax).toFixed(2));
 	
 }

 
 function changePack(element){
 	debugger
 	var id = $(element).attr("id");
 	var rowNo = id.replace('Pack','');
 	if (isNaN($("#"+id).html()) || $("#"+id).html() == ""){
 		var supplied = parseInt($('#Supplied'+rowNo).html());
 		$('#'+id).html(supplied);
 	}
 	var packVal = parseFloat($('#Pack'+rowNo).html());
 	if(packVal<=0){
 			$('#Error').html("Pack should not be empty");
 		var supplied = parseInt($('#Pack'+rowNo).html());
 		var receivedVal = parseInt($('#Pack'+rowNo).html());
 		var priceVal = parseFloat($('#Price'+rowNo).html());
 		$('#Pack'+rowNo).html(supplied);
 		$('#Cost'+rowNo).html(receivedVal*priceVal);
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
 			$('#Cost'+rowNo).html(parseFloat(receivedVal*priceVal).toFixed(2));
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
 			$('#Cost'+rowNo).html(parseFloat(receivedVal*priceVal).toFixed(2));
 		}
 	}
 	
 	changeTotalCost();
 	changeTotalQuantity();
 }


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
	 var storeLocation = $("#fromLocation option:selected").text();
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
			 if(locList[i].state == Supplier){
				 SupplierState = locList[i].state;
			 }
		 }
		
		 $("#supplier_state").val(SupplierState);
	}
 

 function printShipmentReturnDetails(receiptRefNo){
 	debugger;
 	 //purpose:for checking internet conection
 	var online = window.navigator.onLine;
   	if(!online)
   	{
   	alert("check your internet connection,please try agian after some time");
   	return;
   	}
 var flowUnder = $("#flowUnder").val();
 	var contextPath = $("#contextPath").val();
 	URL = contextPath + "/procurement/printShipmentReturnDetails.do";
 		$.ajax({
 			type: "GET",
 			url : URL,
 			data : {
 				PO_Ref : receiptRefNo,
 				flowUnder : flowUnder
 			},
 			beforeSend: function(xhr){                    
 	   			$("#loading").css("display","block");
 	   			$("#mainDiv").addClass("disabled");
 	   		  },
 			success : function(result) {
 				 
 				if(result.includes("Sorry")){
 					alert(result);
 				}else{
 				  var anchor = document.createElement('a');
 				  anchor.href = result;
 				  anchor.target = '_blank';
 				  //anchor.download = '';
 				  anchor.click();
 				}
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


function getPriceshipmentreturn(ele){
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
 
 
 
 function selectAll(source){	
	 
		checkboxes = document.getElementsByName('selectall');		
		  /*
			 * for each( var checkbox in checkboxes) { checkbox.checked =
			 * source.checked; }
			 */
		
		for ( var i = 0; i < checkboxes.length; i++) {
		
			 checkboxes[i].checked= source.checked;	
		}
		
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

 