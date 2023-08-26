function toggleBased(id) {
	if (id == "basedOnProduct") {
		if ($("#" + id).prop("checked") == true) {
			$("input.basedOnProduct").removeAttr("readonly");
			$("select.basedOnProduct").removeAttr("disabled");
			$("input.basedOnGroup").attr("readonly", "readonly");
			$("#basedOnGroup").removeAttr("checked");
		} else {
			$("input.basedOnProduct").attr("readonly", "readonly");
			$("select.basedOnProduct").attr("disabled", "disabled");
			$("input.basedOnGroup").removeAttr("readonly");
			$("#basedOnGroup").prop("checked", true);
		}
	} else {
		if ($("#" + id).prop("checked") == true) {
			$("input.basedOnGroup").removeAttr("readonly");
			$("select.basedOnProduct").attr("disabled", "disabled");
			$("input.basedOnProduct").attr("readonly", "readonly");
			$("#basedOnProduct").removeAttr("checked");
		} else {
			$("input.basedOnGroup").attr("readonly", "readonly");
			$("select.basedOnProduct").removeAttr("disabled");
			$("input.basedOnProduct").removeAttr("readonly");
			$("#basedOnProduct").prop("checked", true);
		}
	}

}




function createShoppingList(operation){
	
	var customerShoppingList = {}, itemsList = [];
	var filterAdded = false;
	
	
	if($("#list_type").val().trim() == ""){
			$("#listtypeError").html("Enter List Name");
            return false;			
		}
	 var zoneID= $("#salesZone").val();
	 if(zoneID.trim() != "-- Select --"){
		filterAdded = true;
		customerShoppingList.zoneID = salesZone;
	}
	
	if($("#basedOnProduct").prop("checked") == true){
	
		var categoryIdVal="";
		if($("#categoryMasterId").length>0)
			categoryIdVal=$("#categoryMasterId").text();
		console.log(categoryIdVal);
		 var len = $("#offerSaleProductsIds tr").length;
		 
		 for(var i=1;i<len;i++){
				var idAttr = $("#offerSaleProductsIds tr:eq("+i+") td:last").attr("id");
				
				idAttr = idAttr.replace('Del','');
				
				var obj = {skuId:$("#itemId"+idAttr).text(),skuDescription:$("#itemName"+idAttr).text(),orderQty:$("#orderedQuantity"+idAttr).text(),categoryId:categoryIdVal};
				itemsList.push(obj);
				
			}
		 customerShoppingList.itemsList = itemsList;
		 console.log(itemsList);
		}
	else if($("#basedOnGroup").prop("checked")==true)
	{
		var groupIdVal = "";
		if($("#saleGroupId").length >0)
			groupIdVal = $("#saleGroupId").text();
		console.log($("#saleGroupId").text());
		
	  var len = $("#saleGroupSku tr").length;
	  for(var i=1;i<len;i++){
			var idAttr = $("#saleGroupSku tr:eq("+i+") td:last").attr("id");
			
			idAttr = idAttr.replace('Del','');
			
			var obj = {skuId:$("#itemId"+idAttr).text(),skuDescription:$("#itemName"+idAttr).text(),orderQty:$("#orderedQuantity"+idAttr).text(),groupId:groupIdVal};
			itemsList.push(obj);
			console.log($("#itemPrice"+idAttr).text());
		}
	 customerShoppingList.itemsList = itemsList;
	}
	customerShoppingList.listName=$("#list_type").val();
	customerShoppingList.listDescription=$("#list_description").val();
	customerShoppingList.country=$("#country").val();
	customerShoppingList.status = $("#status").val();
	customerShoppingList.customerCategory=$("#category").val();
	customerShoppingList.channel= $("#purchaseChannel").val();
	customerShoppingList.zoneID=$("#salesZone").val();
	console.log(customerShoppingList);
		var contextPath = $("#contextPath").val();
	   if(operation=="new"){
		  
		   URL = contextPath + "/b2c/createShoppinglistForm.do";
		  
	   }
	   else if(operation=="edit"){
		  
		   
		   customerShoppingList.listId=$("#list_id").val();
		   URL = contextPath + "/b2c/updateShoppingList.do";
	console.log(customerShoppingList);
	   }
	  
		var formData = JSON.stringify(customerShoppingList);
		
		console.log(formData)
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
  			var listName=customerShoppingList.listName;
  			$("#list_type").val(listName);
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




function searchCategoryMaster(name, searchCategory,index){
	var contextPath = $("#contextPath").val();
	URL = contextPath + "/inventorymanager/searchCategoryMaster.do";
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
			appendCategories(result,searchCategory);
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

function searchsubCategoryMaster(name, searchCategory,index){
 var categoryName = $("#categoryMasterId").val();
 if(categoryName!= undefined){
		var contextPath = $("#contextPath").val();
		URL = contextPath + "/inventorymanager/searchSubCategoriesBasedOnCategory.do";
		
		$.ajax({
		type: "GET",
		url : URL,
		data : {
				 categoryName : categoryName
			},
			beforeSend: function(xhr){                    
	   				$("#loading").css("display","block");
	   				$("#mainDiv").addClass("disabled");
	        },
			success : function(result) {
				appendsubCategories(result,searchCategory);
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
 else{
	 
	 alert("select category")
 }
}

function appendCategories(categoriesList,searchCategory){
	 $("."+searchCategory).html('');
	 var op = '';
	 for(var i=0;i<categoriesList.length;i++){
			 if (i == 0) {
				 op += '<li id="'+categoriesList[i].categoryDescription+'"  class="selected" onclick=getId(this,"'+searchCategory+'"); ><a>'+categoriesList[i].categoryDescription+'</a></li>';
			}else
			     op += '<li id="'+categoriesList[i].categoryDescription+'" onclick=getId(this,"'+searchCategory+'"); ><a>'+categoriesList[i].categoryDescription+'</a></li>';
	 }
	 $("."+searchCategory).html(op);
	 $("."+searchCategory).show();
}

function appendsubCategories(categoriesList,searchCategory){
	 $("."+searchCategory).html('');
	 var op = '';
	 for(var i=0;i<categoriesList.length;i++){
			 if (i == 0) {
				 op += '<li id="'+categoriesList[i].subcategoryDescription+'"  class="selected" onclick=getId(this,"'+searchCategory+'"); ><a>'+categoriesList[i].subcategoryDescription+'</a></li>';
			}else
			     op += '<li id="'+categoriesList[i].subcategoryDescription+'" onclick=getId(this,"'+searchCategory+'"); ><a>'+categoriesList[i].subcategoryDescription+'</a></li>';
	 }
	 $("."+searchCategory).html(op);
	 $("."+searchCategory).show();
}

function getId(element,type){
	var id= $(element).attr("id");
	if(type == "offersellproducts")
		getSkuDetails(id,"");
	else if(type == "offersellskus"){
		var pluCode = $(element).children("input").val();
		addOfferSkusToSellItem(id,pluCode);
	}
	else if(type == "editproductList")
		editaddOfferProductId(id);
	else if(type == "editOfferBuySkuList"){
		var pluCode = $(element).children("input").val();
		editaddOfferSkusToSellItem(id,pluCode);
	}
	else if(type == "saleGroup" || type == "dealGroup")
		addGroup(id,type);
	else if(type == "categoryMaster")
		addcategory(id,type);
	else if(type == "subcategoryMaster")
		addsubcategory(id,type);
	else if(type == "saleGroupSku" || type == "dealGroupSku"){
		var skuId = $("#"+id).children("input").val();
		getSkuDetails(skuId,"");
	}
	else if(type == "searchProduct"){
			var productName =  $("#"+id).children("a").text();
			$("#product").val(productName);
			$("#searchProduct").val(productName);
		}
	else if(type == "product"){
		var productName =  $("#"+id).children("a").text();
		$("#product").val(productName);
		$("#searchProduct").val(productName);
	}else if(type.indexOf("groupId") > -1){
		$("#"+type).val(id);
		$("#selected"+type).val(id);
	}
	else if(type.indexOf("itemId") > -1){
		$("#"+type).val(id);
		$("#selected"+type).val(id);
		var pluCode = $(element).children("input").val();
		$("#pluCode"+type).val(pluCode);
	}
	 $("."+type).hide();
	 $("."+type).html("");
}
function addGroup(id,type){
	$("#"+type).val("");
	 var contextPath = $("#contextPath").val();
	 var row = "<tr id='dynamicdiv"+type+"' style='margin-top:5px;'><td id='"+type+"Id'>"+id+"</td>" +
 		"<td id='Del"+type+"' ><img id='Img"+ type +"' src='"+contextPath+"/images/itemdelete.png' style='width:15%;cursor:pointer;' onclick='deleteItem(this);' title='Delete "+id+"'/>" +
 		"</td></tr>";
	 $("#"+type+"ProductsId tbody").html("");
	 $("#"+type+"ProductsId tbody").append(row);
}

function addcategory(id,type){
	$("#"+type).val("");
	 var contextPath = $("#contextPath").val();
	 var row = "<tr id='dynamicdiv"+type+"' style='margin-top:5px;'><td id='"+type+"Id'>"+id+"</td>" +
 		"<td id='Del"+type+"' ><img id='Img"+ type +"' src='"+contextPath+"/images/itemdelete.png' style='width:15%;cursor:pointer;' onclick='deleteItem(this);' title='Delete "+id+"'/>" +
 		"</td></tr>";
	 $("#"+type+"Ids tbody").html("");
	 $("#"+type+"Ids tbody").append(row);
}
function addsubcategory(id,type){
	$("#"+type).val("");
	 var contextPath = $("#contextPath").val();
	 var row = "<tr id='dynamicdiv"+type+"' style='margin-top:5px;'><td id='"+type+"Id'>"+id+"</td>" +
 		"<td id='Del"+type+"' ><img id='Img"+ type +"' src='"+contextPath+"/images/itemdelete.png' style='width:15%;cursor:pointer;' onclick='deleteItem(this);' title='Delete "+id+"'/>" +
 		"</td></tr>";
	 $("#"+type+"Ids tbody").html("");
	 $("#"+type+"Ids tbody").append(row);
}
function deleteItem(element){
	var id = $(element).attr("id").replace('Img','');
	$('#dynamicdiv'+id).remove();
}

function searchProducts(name, searchCategory){
	 var contextPath = $("#contextPath").val();
	 var categoryName="";
	 var subCategory="";
	 if(searchCategory == "offersellproducts" || searchCategory == "editproductList"){
		 categoryName=$("#categoryMasterId").val();
		 if(categoryName.trim() == "-- Select --")
			 categoryName = "";
		 subCategory=$("#subcategoryMasterId").val();
		 if(subCategory != null || subCategory.trim() == "")
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
			 op += '<li id="'+productsList[i].productId+'"  class="selected" onclick=getId(this,"'+searchCategory+'"); ><a>'+productsList[i].productId+'   (   '+productsList[i].productName+'   )</a></li>';
		 else
		     op += '<li id="'+productsList[i].productId+'" onclick=getId(this,"'+searchCategory+'"); ><a>'+productsList[i].productId+'   (   '+productsList[i].productName+'   )</a></li>';
	 }
	 $("."+searchCategory).html(op);
	 $("."+searchCategory).show();
}
var offerproductid = 0;
var offerSellPRoducts = [];
function addOfferProductId(materialName){
	 offerproductid = offerproductid+1;
	$('#searchItems').val('');
	var contextPath = $("#contextPath").val();
	var remove = contextPath+"/images/itemdelete1.png";
	
	for(var id=0;id<offerSellPRoducts.length;id++){
		 if(offerSellPRoducts[id]==materialName){
					 alert(offerSellPRoducts[id] +" product already added");
				 return;
			 }
			 }
	$('#offerSaleProductsIds').append(														
	'<tr class='+"'"+offerproductid+"buyProduct'"+'><td style="font-size: 100%;"><span style="color: rgb(81, 93, 107)" id="buyProductname">'+materialName+'</span></td>'
	+'<td class="price" style="font-size: 100%;"><center><img src='+remove+' style="cursor:pointer;" onclick="removeOfferSellProduct('+"'"+offerproductid+"buyProduct'"+','+"'"+materialName+"'"+')"></center></td></tr>');
	offerSellPRoducts.push(materialName);
}
function getSkuDetails(skuId,description){
	// var materialName = $('#searchCriteria').val();
	$("#desc").val(description);
	 var contextPath = $("#contextPath").val();
//	 var storeLocation = $("#outletLocation").val();
	 var storeLocation = "";
var WarehouseReturnflag=$("#whreturnflag").val();
		if(WarehouseReturnflag == "" || WarehouseReturnflag == undefined || WarehouseReturnflag == null){
			WarehouseReturnflag="";
   		}


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
  				$('#searchItems').val('');
  				$('#skuList').html('');
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
var skuList = null;
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
function getPrice(ele){
	var id = $(ele).attr("id");
	id = id.replace('price','');
	$(".modal-backdrop").trigger("click");
	addItem(skuList[id]);
}
function addItem(sku){
	debugger
	if($("#basedOnProduct").prop("checked") == true) 
	var iddiv = "offerSaleProductsIds tr";
	 var contextPath = $("#contextPath").val();
		if($("#basedOnProduct").prop("checked") == true) 
	 var len = parseInt($("#offerSaleProductsIds tr").length);
		else
			var len = parseInt($("#saleGroupSku tr").length);
		if (len != 1)
			if($("#basedOnProduct").prop("checked") == true) 
			len = parseInt($("#offerSaleProductsIds tr:last").attr("id").replace('dynamicdiv', '')) + 1;
			else
				len = parseInt($("#saleGroupSku tr:last").attr("id").replace('dynamicdiv', '')) + 1;	
		for (var i = 1; i <= len; i++) {
			if ($("#skuId" + i).val() == sku.skuId && $("#itemPrice"+i).text() == sku.price) {
				var pack =  parseInt($("#orderedQuantity"+i).text())+1;
  			 $("#orderedQuantity"+i).text(pack);
  			 var cost =  parseFloat($("#itemPrice"+i).text());
  			 $("#totalCost"+i).text(pack*cost);
  			 changeTotalQuantity();
  			 changeTotalCost();
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
		 var row = "<tr id='dynamicdiv"+len+"' style='margin-top:5px;'><td id='itemId"+len+"'>"+sku.skuId+"</td>" +
	 		"<input type='hidden' id='skuId"+len+"' value='"+sku.skuId+"'/>" +
	 		"<input type='hidden' id='pluCode"+len+"' value='"+sku.pluCode+"'/>" +
		"<td id='itemName"+len+"'>"+description+"</td>" +
		"<td id='orderedQuantity"+len+"' class='Pack' onkeypress='return (this.innerText.length < 10)' onBlur='changePack(this);'" +
		" contenteditable='true'>1</td>" +
		"<td id='Del"+ len +"' ><img id='Img"+ len +"' src='"+contextPath+"/images/itemdelete.png' style='width:15%;cursor:pointer;' onclick='deleteItem(this);' title='Delete "+sku.skuId+"'/>" +
		"</td></tr>";
		 if($("#basedOnProduct").prop("checked") == true) 
			 $("#offerSaleProductsIds tbody").append(row);
		else
			$("#saleGroupSku tbody").append(row);	
	
	changeTotalQuantity();
	changeTotalCost();
}

function changeTotalQuantity(){
	var totalQty=0;
	$('.Pack').each(function(){
	  var productName = $(this).attr("id").replace('orderedQuantity','');
	  var qty = $("#orderedQuantity"+productName).html();
	  	totalQty = parseInt(qty)+totalQty;
	 });
	if($("#totalQty").length){
		$('#totalQty').val(totalQty);
	}
}

function changeTotalCost(){
	var totalCost=0.0;
	var tax=0.0;
	$('.cost').each(function(){
	  var productName = $(this).attr("id").replace('totalCost','');
	  var cost = $("#totalCost"+productName).html();
	  totalCost = totalCost + parseFloat(cost);
	 });
	var i = 1;
	var totalTax = 0;
	// assuming tax as 10%, formula------
	// subtotal = total*100/(100+tax)
	//	var subtotal = (totalCost*100)/(100+10);
	//	tax = totalCost - subtotal;
	$('.taxRate').each(function(){
		  var taxRate = $(this).html();
		  var subtotal = (totalCost*100)/(100+parseInt(taxRate));
		  tax = totalCost - subtotal;
		  tax = tax.toFixed(2);
		  totalTax = totalTax + parseFloat(tax);
		  $("#orderTax"+i).val(tax);
		  i=i+1;
		 });
	$("#subtotal").val(totalCost);
	$("#totalTax").val(totalTax);
	
}

function updateTotalCost(){
	var totalCost=0.0;
	var tax=0.0;
	$('.cost').each(function(){
	  var productName = $(this).attr("id").replace('totalCost','');
	  var cost = $("#totalCost"+productName).html();
	  totalCost = totalCost + parseFloat(cost);
	 });
	var i = 1;
	var totalTax = 0;
	// assuming tax as 10%, formula------
	// subtotal = total*100/(100+tax)
	//	var subtotal = (totalCost*100)/(100+10);
	//	tax = totalCost - subtotal;
	$('.taxRate').each(function(){
		  var taxRate = $(this).html();
		  var subtotal = (totalCost*100)/(100+parseInt(taxRate));
		  tax = totalCost - subtotal;
		  tax = tax.toFixed(2);
		  totalTax = totalTax + parseFloat(tax);
		  $("#orderTax"+i).val(tax);
		  i=i+1;
		 });
	$("#subtotal").val(totalCost);
	$("#totalTax").val(0.0);
//	getShipmentCost();
}

function changePack(element){
	var id = $(element).attr("id");
	if (isNaN($("#"+id).html()) || $("#"+id).html() == "")
		$('#'+id).html("1");
	var rowNo = id.replace('orderedQuantity','');
	var packVal = parseInt($('#orderedQuantity'+rowNo).html());
	if(packVal<=0){
		alert("Quantity should not be empty");
		var priceVal = parseFloat($('#itemPrice'+rowNo).html());
		$('#orderedQuantity'+rowNo).html(1);
		$('#totalCost'+rowNo).html(priceVal);
	}else{
		var priceVal = parseFloat($('#itemPrice'+rowNo).html());
		$('#totalCost'+rowNo).html(packVal*priceVal);
		changeTotalQuantity();
		changeTotalCost();
	}
}
function searchProductGroupMaster(name,searchCategory){
	var contextPath = $("#contextPath").val();
	URL = contextPath + "/inventorymanager/searchProductGroupMaster.do";
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
			appendProductGroups(result,searchCategory);
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


function appendProductGroups(groupsList,searchCategory){
	 $("."+searchCategory).html('');
	 var op = '';
	 for(var i=0;i<groupsList.length;i++){
			 if (i == 0) {
				 op += '<li id="'+groupsList[i].groupId+'"  class="selected" onclick=getId(this,"'+searchCategory+'"); ><a>'+groupsList[i].groupDescription+'</a></li>';
			}else
			     op += '<li id="'+groupsList[i].groupId+'" onclick=getId(this,"'+searchCategory+'"); ><a>'+groupsList[i].groupDescription+'</a></li>';
	 }
	 $("."+searchCategory).html(op);
	 $("."+searchCategory).show();
}

function addGroup(id,type){
	$("#"+type).val("");
	 var contextPath = $("#contextPath").val();
	 var row = "<tr id='dynamicdiv"+type+"' style='margin-top:5px;'><td id='"+type+"Id'>"+id+"</td>" +
		"<td id='Del"+type+"' ><img id='Img"+ type +"' src='"+contextPath+"/images/itemdelete.png' style='width:15%;cursor:pointer;' onclick='deleteItem(this);' title='Delete "+id+"'/>" +
		"</td></tr>";
	 $("#"+type+"ProductsId tbody").html("");
	 $("#"+type+"ProductsId tbody").append(row);
}

function deleteItem(element){
	var id = $(element).attr("id").replace('Img','');
	$('#dynamicdiv'+id).remove();
}


function searchGroupSkus(name,searchCategory){
	 var groupId = "";
	 if(searchCategory == "saleGroupSku"){
		 if($("#saleGroupId").length > 0){
			 groupId = $("#saleGroupId").text();
		 }else{
			 alert("Please Select Sale Group Id");
			 return;
		 }
	 }else if(searchCategory == "dealGroupSku"){
		 if($("#dealGroupId").length > 0){
			 groupId = $("#dealGroupId").text();
		 }else{
			 alert("Please Select Deal Group Id");
			 return;
		 }
	 }
	var contextPath = $("#contextPath").val();
	URL = contextPath + "/inventorymanager/searchGroupSkus.do";
	 $.ajax({
			type: "GET",
			url : URL,
			data : {
				groupId : groupId,
				searchCriteria : name
			},
		beforeSend: function(xhr){                    
  				$("#loading").css("display","block");
  				$("#mainDiv").addClass("disabled");
       },
		success : function(result) {
   	appendGroupSkus(result,searchCategory);
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

function appendGroupSkus(groupChildList,searchCategory){
	 $("."+searchCategory).html('');
	 var op = '';
	 for(var i=0;i<groupChildList.length;i++){
			 if (i == 0) {
				 op += '<li id="'+groupChildList[i].pluCode+'"  class="selected" onclick=getId(this,"'+searchCategory+'"); ><a>'+groupChildList[i].pluCode+'</a><input type="hidden" value="'+groupChildList[i].skuId+'"/></li>';
			}else
			     op += '<li id="'+groupChildList[i].pluCode+'" onclick=getId(this,"'+searchCategory+'"); ><a>'+groupChildList[i].pluCode+'</a><input type="hidden" value="'+groupChildList[i].skuId+'"/></li>';
	 }
	 $("."+searchCategory).html(op);
	 $("."+searchCategory).show();
}

