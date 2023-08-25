function activateHeader(id){
	$(".subBlock").each(function() {
		$(this).slideUp("fast");
	});
	var headerImg = $("#"+id+"Img").attr("src");
	var subBlockOpened = false;
	 if(headerImg.indexOf('right')!= -1){
		 subBlockOpened = true; 
	 }
	 var contextPath = $("#contextPath").val();
	 var img = contextPath+"/images/leftHeaderIconGreen.png";
	 $(".headerImg").each(function() {
		$(this).attr("src",img); 
	 });
	 if(subBlockOpened == true){
		 return;
	 }
	 $("#"+id+"Img").attr("src",contextPath+"/images/rightHeaderIconGreen.png");
	 $("."+id).slideDown("fast");
}

function getFormData(){
	 //purpose:for checking internet conection
	var online = window.navigator.onLine;
  	if(!online)
  	{
  	alert("check your internet connection,please try agian after some time");
  	return;
  	}
	var country = $("#country").val();
	var region = $("#states").val();
	var city = $("#city").val();
	var customerType = $("#customerType").val();
	var age = $("#age").val();
	var gender = $("#gender").val();
	var productCategory = $("#productCategory").val();
	var fromDate = $("#fromDate").val();
	var product = $("#product").val();
	var endDate = $("#endDate").val();
	var department = $("#outletDepartmentId").val();
	var subDepartment = $("#outletSubDepartmentId").val();
	if($('#fromDate').val() != "" && $('#endDate').val() !=""){
		var noOfDays = daydiff(parseDate($('#fromDate').val()), parseDate($('#endDate').val()));
		if(noOfDays < 0){
			$("#Error").html("End Date can't be less than Start Date");
			focusDiv('fromDateLabel');
			return false;
		}
	}
	var salesZone = $("#salesZone").val();
	var referrals = $("#referrals").val();
	var customerRating = $("#customerRating").val();
//	var otherDetails = $("#otherDetails").val();
	var purchaseChannel = $("#purchaseChannel").val();
	var startPrice = $("#startPrice").val();
	var endPrice = $("#endPrice").val();
	var noOfClaims = $("#noOfClaims").val();
	var filterAdded = false;
	var finalObj = {};
	if(country.trim() != ""){
		finalObj.country = country;
		filterAdded = true;
	}
	if(region.trim() != "Select State" && region.trim() != ""){
		finalObj.region = region;
		filterAdded = true;
	}
	if(city.trim() != ""){
		finalObj.city = city;
		filterAdded = true;
	}
	if(customerType.trim() != "-- Select --"){
		finalObj.customerType = customerType;
		filterAdded = true;
	}
	if(department.trim() != ""){
		finalObj.department = department;
		filterAdded = true;
	}
	if(subDepartment.trim() != ""){
		finalObj.subDepartment = subDepartment;
		filterAdded = true;
	}
//	console.log("|"+age.trim()+"|");
	if(age.trim() != "-- Select --"){
		finalObj.age = age;
		filterAdded = true;
	}
	if(gender.trim() != "-- Select --"){
		finalObj.gender = gender;
		filterAdded = true;
	}
	if(salesZone.trim() != "-- Select --"){
		filterAdded = true;
		finalObj.salesZone = salesZone;
	}
	if($("#otherDetails").val() != "-- Select --"){
		filterAdded = true;
		finalObj.maritialStatus = $("#otherDetails").val();
	}
	if($("#children").val() != "-- Select --"){
		filterAdded = true;
		finalObj.children = $("#children").val();
	}
	if($("#occupation").val() != "-- Select --"){
		filterAdded = true;
		finalObj.occupation = $("#occupation").val();
	}
	if($("#incomeGroup").val() != "-- Select --"){
		filterAdded = true;
		finalObj.incomeGroup = $("#incomeGroup").val();
	}
	if(fromDate != ""){
		finalObj.start_date = fromDate+" 00:00:00";
		filterAdded = true;
	}
	if(endDate != ""){
		finalObj.end_date = endDate+" 00:00:00";
		filterAdded = true;
	}
	if(purchaseChannel.trim() != "-- Select --"){
		finalObj.purchaseChannel = purchaseChannel;
		filterAdded = true;
	}
	if(productCategory.trim() != "-- Select --" && productCategory.trim() != ""){
		finalObj.productCategory = productCategory;
		filterAdded = true;
	}
	if(startPrice != ""){
		finalObj.startPrice = startPrice;
		filterAdded = true;
	}
	if(endPrice != ""){
		finalObj.endPrice = endPrice;
		filterAdded = true;
	}
	if(product.trim() != ""){
		finalObj.product = product;
		filterAdded = true;
	}
	if(customerRating.trim() != "-- Select --"){
		finalObj.customerRating = customerRating;
		filterAdded = true;
	}
	if(referrals.trim() != "-- Select --"){
		finalObj.referrals = referrals;
		filterAdded = true;
	}
	if (noOfClaims != "" && noOfClaims!=undefined && noOfClaims!=null) {
		finalObj.noOfClaims = parseInt(noOfClaims);
		filterAdded = true;
	}
	
	/*if(otherDetails.trim() != "-- Select --")
		finalObj.otherDetails = otherDetails;*/
	if($("#applyExchanges").prop("checked") == true){
		filterAdded = true;
	}
	if(filterAdded == false){
		return null;
	}
	finalObj.applyRoolsEngine = $("#applyExchanges").prop("checked");
	finalObj.filterAdded = filterAdded;
	return finalObj;
}

function emptyProduct(){
	$("#searchProduct").val("");
	$("#product").val("");
}

function appendProducts(productsList,searchCategory){
	 $("."+searchCategory).html('');
	 var op = '';
	 for(var i=0;i<productsList.length;i++){
			 if (i == 0) {
				 op += '<li id="'+productsList[i].skuID+'"  class="selected" onclick=getId(this,"'+searchCategory+'"); ><a>'+productsList[i].productName+'</a></li>';
			}else
			     op += '<li id="'+productsList[i].skuID+'" onclick=getId(this,"'+searchCategory+'"); ><a>'+productsList[i].productName+'</a></li>';
	 }
	 $("."+searchCategory).html(op);
	 $("."+searchCategory).show();
}


/* search product ids based on search */
	/*function searchProducts(name,searchCategory){
	var contextPath = $("#contextPath").val();
	URL = contextPath + "/inventorymanager/searchdealProducts.do";
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
				appendDealProducts(result,searchCategory);
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
	function searchProducts(name, searchCategory){
		
		debugger;
		 //purpose:for checking internet conection  deals
 		var online = window.navigator.onLine;
 	  	if(!online)
 	  	{
 	  	alert("check your internet connection,please try agian after some time");
 	  	return;
 	  	}
	 var contextPath = $("#contextPath").val();
	 var categoryName="";
	 var subCategory="";
	 if(searchCategory == "dealProduct" || searchCategory == "editDealProduct"){
		 categoryName=$("#saleCategory").val();
		 if(categoryName.trim() == "-- Select --")
			 categoryName = "";
		 subCategory=$("#sale_sub_category").val();
		 if(subCategory != null && subCategory.trim() == "-- Select --")
			 subCategory = "";
	 }
	 if(searchCategory == "dealProductsList" || searchCategory == "editDealProductsList"){
		 categoryName=$("#saleCategory").val();
		 if(categoryName.trim() == "-- Select --")
			 categoryName = "";
		 subCategory=$("#deal_sub_category").val();
		 if(subCategory != null && subCategory.trim() == "-- Select --")
			 subCategory = "";
	 }
	 
	 if(searchCategory=="editDealProduct" || searchCategory=="editDealProductsList")
		 {
			 var location = $('#editdealLocation').val();
			 location = location[0];
		 }else{
			 var location = $('#dealLocation').val();
			 location = location[0];
		 }
	 
	 
	 if($("#applyForAllItemsProduct").prop("checked") == true)
		 {
		 	$("#saleCategory").val("").change();
		 }
	 else if($("#basedOnCategory").prop("checked") == true)
		 {
		 	if(categoryName=="" ||categoryName==null || categoryName==undefined){
		 		$("#Error").html("Please Select Category");
				 focusDiv('Error');
				 return;
		 	}
		 }
	
	 URL = contextPath + "/inventorymanager/searchProductsForCategory.do";
	 $.ajax({
			type: "GET",
			url : URL,
			data : {
				searchName : name,
				categoryName: categoryName,
				location:location,
//				subCategory: subCategory
			},
			beforeSend: function(xhr){                    
  	   			$("#loading").css("display","block");
  	   			$("#mainDiv").addClass("disabled");
  	   		  },
			success : function(result) {
				debugger;
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
		debugger;
		 $("."+searchCategory).html('');
		 if(productsList.length == 0){
			 $("#Error").html("There is No Products for the given Search");
			 $("."+searchCategory).hide();
			 $("."+searchCategory).html("");
			 focusDiv('Error');
			 return;
		 }
		// console.log(JSON.stringify(productsList));
		 var op = '';
		 for(var i=0;i<productsList.length;i++){
			 var jsonObj=productsList[i];
			 var discreption=encodeURIComponent(productsList[i].productName);
			 var qty=productsList[i].quantity;
			 var ean=productsList[i].ean;
			 var size=productsList[i].size;
			 if (i == 0) 
				 op += '<li id="'+productsList[i].skuID+'"  class="selected" onclick=getThisId(this,"'+searchCategory+'","'+discreption+'","'+qty+'","'+ean+'","'+size+'"); ><a>'+productsList[i].skuID+'   (   '+productsList[i].description+'   )&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  '+productsList[i].price+'&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;'+productsList[i].pluCode+' </a><input type="hidden" value="'+productsList[i].pluCode+'"/></li>';
			 else
			     op += '<li id="'+productsList[i].skuID+'" onclick=getThisId(this,"'+searchCategory+'","'+discreption+'","'+qty+'","'+ean+'","'+size+'"); ><a>'+productsList[i].skuID+'   (   '+productsList[i].description+'   )&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  '+productsList[i].price+'&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;'+productsList[i].pluCode+'</a><input type="hidden" value="'+productsList[i].pluCode+'"/></li>';
		 }
		 $("."+searchCategory).html(op);
		 $("."+searchCategory).show();
	}
	
	function editsearchProducts(name,searchCategory){
		var contextPath = $("#contextPath").val();
		URL = contextPath + "/inventorymanager/searchdealProducts.do";
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
					appendDealProducts(result,searchCategory);
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

    /* append getting product detrails to datalist */	 
	/*function appendProducts(productsList,searchCategory){
		 $("."+searchCategory).html('');
		 var op = '';
		 for(var i=0;i<productsList.length;i++){
			
				 if (i == 0) {
					 op += '<li id="'+productsList[i].productId+'"  class="selected" onclick=getId(this,"'+searchCategory+'"); ><a>'+productsList[i].description+'</a></li>';
				}else
				     op += '<li id="'+productsList[i].productId+'" onclick=getId(this,"'+searchCategory+'"); ><a>'+productsList[i].description+'</a></li>';
			 }
		 $("."+searchCategory).html(op);
		 $("."+searchCategory).show();
	 }*/
	
	function getId(element,type){
		debugger;
		var id= $(element).attr("id");
		if(type == "dealProduct")
			{
			var pluCode = $(element).children("input").val();
			addProductToSellItem(id,pluCode);
			}
		else if(type == "editDealProduct"){
			var pluCode = $(element).children("input").val();
			addeditProductToSellItem(id,pluCode);
		}
		else if(type == "buySkuList"){
			var pluCode = $(element).children("input").val();
			addSkusToSellItem(id,pluCode);
		}
		else if(type == "dealProductsList"){
			var pluCode = $(element).children("input").val();
			addProductToDealItem(id,pluCode);
		}
		else if(type == "dealSkudatalist"){
			var pluCode = $(element).children("input").val();
			addSkuToDealItem(id,pluCode);
		}
		else if(type == "editbuySkuList"){
			var pluCode = $(element).children("input").val();
			addeditSkusToSellItem(id,pluCode);
		}
		else if(type == "editDealProductsList"){
			var pluCode = $(element).children("input").val();
			addeditProductToDealItem(id,pluCode);
		}
		else if(type == "editDealSkudatalist"){
			var pluCode = $(element).children("input").val();
			addeditSkuToDealItem(id,pluCode);
		}
		else if(type == "saleGroup" || type == "dealGroup")
			addGroup(id,type);
		else if(type == "searchProduct"){
   			var productName =  $("#"+id).children("a").text();
   			$("#product").val(productName);
   			$("#searchProduct").val(productName);
   		}
		else if(type == "product"){
			var productName =  $("#"+id).children("a").text();
			$("#product").val(productName);
			$("#searchProduct").val(productName);
		}
		else if(type == "saleGroupSku" || type == "dealGroupSku"){
			var skuId = $("#"+id).children("input").val();
			addGroupSkuToTable(skuId,id,type);
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
	
	
	function getThisId(element,type,Disc,qty,ean,size){
		debugger;
		var id= $(element).attr("id");
		var Disc=decodeURIComponent(Disc);
		if(type == "dealProduct")
			{
			var pluCode = $(element).children("input").val();
			addThisProductToSellItem(id,pluCode,Disc,qty,ean,size);
			}
		else if(type == "editDealProduct"){
			var pluCode = $(element).children("input").val();
			addThiseditProductToSellItem(id,pluCode,Disc,qty,ean,size);
		}
		else if(type == "buySkuList"){
			var pluCode = $(element).children("input").val();
			addSkusToSellItem(id,pluCode);
		}
		else if(type == "dealProductsList"){
			var pluCode = $(element).children("input").val();
			addThisProductToDealItem(id,pluCode,Disc,qty,ean,size);
		}
		else if(type == "dealSkudatalist"){
			var pluCode = $(element).children("input").val();
			addSkuToDealItem(id,pluCode);
		}
		else if(type == "editbuySkuList"){
			var pluCode = $(element).children("input").val();
			addeditSkusToSellItem(id,pluCode);
		}
		else if(type == "editDealProductsList"){
			var pluCode = $(element).children("input").val();
			//addeditProductToDealItem(id,pluCode);
			addThiseditProductToDealItem(id,pluCode,Disc,qty,ean,size);
			
			
		}
		else if(type == "editDealSkudatalist"){
			var pluCode = $(element).children("input").val();
			addeditSkuToDealItem(id,pluCode);
		}
		else if(type == "saleGroup" || type == "dealGroup")
			addGroup(id,type);
		else if(type == "searchProduct"){
   			var productName =  $("#"+id).children("a").text();
   			$("#product").val(productName);
   			$("#searchProduct").val(productName);
   		}
		else if(type == "product"){
			var productName =  $("#"+id).children("a").text();
			$("#product").val(productName);
			$("#searchProduct").val(productName);
		}
		else if(type == "saleGroupSku" || type == "dealGroupSku"){
			var skuId = $("#"+id).children("input").val();
			addGroupSkuToTable(skuId,id,type);
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
	
	
	 var saleProductIds=[],saleProductId = null,saleSkuIds=[],saleSkuId = null,
	 dealProductIds=[],dealProductId = null,dealSkuIds=[],dealSkuId = null;
	 
	 
	 var buyProductId = 0;
	 /* add selected product to the buyproduct list */
	 function addProductToSellItem(materialName,pluCode){
		 debugger;
		 buyProductId = buyProductId+1;
		$('#searchItems').val('');
		var contextPath = $("#contextPath").val();
		var remove = contextPath+"/images/itemdelete1.png";
		saleProductId = materialName;
		for(var id=0;id<saleProductIds.length;id++){
			if(saleProductIds[id]==materialName){
				alert(saleProductIds[id] +" product already added");
				return;
			}
		}
		saleProductIds.push(materialName);
		$('#saleProductsId').append(														
		'<tr class='+"'"+buyProductId+"buyProduct'"+'><td style="font-size: 100%;"><span style="color: rgb(81, 93, 107)">'+materialName+'</span><input type="hidden" class="buyPluCode" value="'+pluCode+'" /></td>'
		+'<td class="price" style="font-size: 100%;"><center><img src='+remove+' style="cursor:pointer;" onclick="removeSaleProductId('+"'"+buyProductId+"buyProduct'"+','+"'"+materialName+"'"+')"></center></td></tr>');
		}
	 
	 function addThisProductToSellItem(materialName,pluCode,Disc,qty,ean,size){
		 debugger;
		 buyProductId = buyProductId+1;
		$('#searchItems').val('');
		var contextPath = $("#contextPath").val();
		var remove = contextPath+"/images/itemdelete1.png";
		saleProductId = materialName;
		for(var id=0;id<saleProductIds.length;id++){
			if(saleProductIds[id]==materialName){
				alert(saleProductIds[id] +" product already added");
				return;
			}
		}
		saleProductIds.push(materialName);
		$('#saleProductsId').append(														
		'<tr class='+"'"+buyProductId+"buyProduct'"+'>'
		+'<td style="font-size: 100%;"><span style="color: rgb(81, 93, 107)">'+buyProductId+'</span></td>'
		+'<td style="font-size: 100%;"><span style="color: rgb(81, 93, 107)">'+materialName+'</span><input type="hidden" class="buyPluCode" value="'+pluCode+'" /><input type="hidden" id="buyPluCode'+pluCode+'" class="" value="'+pluCode+'" /><input type="hidden" id="buySkuCode'+pluCode+'" class="" value="'+materialName+'" /></td>'
		+'<td style="font-size: 100%;"><span style="color: rgb(81, 93, 107)">'+Disc+'</span><input type="hidden" class="" id="buyDiscription'+pluCode+'"  value="'+Disc+'" /></td>'
		+'<td style="font-size: 100%;"><span style="color: rgb(81, 93, 107)"><input type="text" style="width: 40px;text-align: center;" class="buyPluCodeQty" id="buyPluCodeQty'+pluCode+'" value="" /></span></td>'
		+'<td style="font-size: 100%;"><span style="color: rgb(81, 93, 107)"><input type="text" style="width: 40px;text-align: center;" class="buyPluCodeTurnOver" id="buyPluCodeTurnOver'+pluCode+'" value="" /></span></td>'
		
		+'<td class="price" style="font-size: 100%;"><center><img src='+remove+' style="cursor:pointer;" onclick="removeSaleProductId('+"'"+buyProductId+"buyProduct'"+','+"'"+materialName+"'"+')"></center></td></tr>');
		}
	 
	 var editbuyProductId=0;
	 function addeditProductToSellItem(materialName,pluCode){
		 editbuyProductId = editbuyProductId+1;
		$('#searchItems').val('');
		var contextPath = $("#contextPath").val();
		var remove = contextPath+"/images/itemdelete1.png";
		saleProductId = materialName;
		for(var id=0;id<editsaleProductIds.length;id++){
			if(editsaleProductIds[id]==materialName){
				alert(editsaleProductIds[id] +" product already added");
				return;
			}
		}
		editsaleProductIds.push(materialName);
		$('#saleProductsId').append(														
		'<tr class='+"'"+editbuyProductId+"editbuyProduct'"+'><td style="font-size: 100%;"><span style="color: rgb(81, 93, 107)">'+materialName+'</span><input type="hidden" class="buyPluCode" value="'+pluCode+'" /></td>'
		+'<td class="price" style="font-size: 100%;"><center><img src='+remove+' style="cursor:pointer;" onclick="removeeditSaleProductId('+"'"+editbuyProductId+"editbuyProduct'"+','+"'"+materialName+"'"+')"></center></td></tr>');
		}
	 
	 function addThiseditProductToSellItem(materialName,pluCode,Disc,qty,ean,size){
		 editbuyProductId = editbuyProductId+1;
		$('#searchItems').val('');
		var contextPath = $("#contextPath").val();
		var remove = contextPath+"/images/itemdelete1.png";
		saleProductId = materialName;
		for(var id=0;id<editsaleProductIds.length;id++){
			if(editsaleProductIds[id]==materialName){
				alert(editsaleProductIds[id] +" product already added");
				return;
			}
		}
		editsaleProductIds.push(materialName);
		$('#saleProductsId').append(														
				'<tr class='+"'"+editbuyProductId+"buyProduct'"+'>'
				+'<td style="font-size: 100%;"><span style="color: rgb(81, 93, 107)">'+editbuyProductId+'</span></td>'
				+'<td style="font-size: 100%;"><span style="color: rgb(81, 93, 107)">'+materialName+'</span><input type="hidden" class="buyPluCode" value="'+pluCode+'" /><input type="hidden" id="buyPluCode'+pluCode+'" class="" value="'+pluCode+'" /><input type="hidden" id="buySkuCode'+pluCode+'" class="" value="'+materialName+'" /></td>'
				+'<td style="font-size: 100%;"><span style="color: rgb(81, 93, 107)">'+Disc+'</span><input type="hidden" class="" id="buyDiscription'+pluCode+'"  value="'+Disc+'" /></td>'
				+'<td style="font-size: 100%;"><span style="color: rgb(81, 93, 107)"><input type="text" style="width: 40px;text-align: center;" class="buyPluCodeQty" id="buyPluCodeQty'+pluCode+'" value="" /></span></td>'
				+'<td style="font-size: 100%;"><span style="color: rgb(81, 93, 107)"><input type="text" style="width: 40px;text-align: center;" class="buyPluCodeQty" id="buyPluCodeTurnOver'+pluCode+'" value="" /></span></td>'
				
				+'<td class="price" style="font-size: 100%;"><center><img src='+remove+' style="cursor:pointer;" onclick="removeSaleProductId('+"'"+editbuyProductId+"buyProduct'"+','+"'"+materialName+"'"+')"></center></td></tr>');
		}
	 
	 /* remove selected product id from sale product list */
	 function removeSaleProductId(pid,productId){
		remove(productId,saleProductIds);
		$("."+pid).remove();
		}
	 
	 function removeeditSaleProductId(pid,productId){
			remove(productId,editsaleProductIds);
			$("."+pid).remove();
			}
    	
	 /* global remove method */
	 function remove(id,array){
		for(var i=0;i<array.length;i++) {
			if(array[i] === id) {
	           array.splice(i, 1);
	        }
	    }
	}
	
	 function searchGroupSkus(name,searchCategory){
		 debugger;
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
	 
	 /* for buy sku details */
	 function searchBuySkus(name,searchCategory){
		 var productsarray = [];
		 var categoryName = "";
		var contextPath = $("#contextPath").val();
		if(searchCategory == "buySkuList"){
			productsarray = saleProductIds;
			categoryName=$("#saleCategory").val();
			 if(categoryName.trim() == ""){
				 $("#Error").html("Please Select Sale Product Category");
				 focusDiv('Error');
				 return;
			 }			
		}
		if(searchCategory == "dealSkudatalist"){
			//categoryName=$("#dealCategory").val();
			categoryName=$("#saleCategory").val();
			 if(categoryName.trim() == ""){
				 $("#Error").html("Please Select Deal Product Category");
				 focusDiv('Error');
				 return;
			 }	
			productsarray = dealProductIds;
		}
		if(searchCategory == "editbuySkuList"){
			categoryName=$("#saleCategory").val();
			 if(categoryName.trim() == "-- Select --"){
				 $("#Error").html("Please Select Sale Product Category");
				 focusDiv('Error');
				 return;
			 }	
			 productsarray = editsaleProductIds;
		}
		if(searchCategory == "editDealSkudatalist"){
			categoryName=$("#dealCategory").val();
			 if(categoryName.trim() == "-- Select --"){
				 $("#Error").html("Please Select Deal Product Category");
				 focusDiv('Error');
				 return;
			 }	
			 productsarray = editdealProductIds;
		}
		/*if(productsarray.length == 0){
			 $("#Error").html("Please Add Product Ids  ");
			 focusDiv('Error');
			 return;
		}*/
			/* commented by chaithanya to make product id as manditory*/
			/* URL = contextPath + "/inventorymanager/searchProductsBasedOnCategory.do";
			   $.ajax({
					type: "GET",
					url : URL,
					data : {
						searchName : name,
						productCategory : categoryName
					},
	   		beforeSend: function(xhr){                    
		   				$("#loading").css("display","block");
		   				$("#mainDiv").addClass("disabled");
		        },
	   		success : function(result) {
	   			appendBuySkus(result,searchCategory);
	   			$("#loading").css("display","none");
				$("#mainDiv").removeClass('disabled');

	   		},
	   		error : function() {
	   			 alert("something went wrong");
	   			 $("#loading").css("display","none");
	 			 $("#mainDiv").removeClass('disabled');
	   		}
	   	});*/
	
		else{
		URL = contextPath + "/inventorymanager/searchskus.do";
		 $.ajax({
				type: "GET",
				url : URL,
				data : {
    			productsarray : productsarray.toString()
				},
    		beforeSend: function(xhr){                    
	   				$("#loading").css("display","block");
	   				$("#mainDiv").addClass("disabled");
	        },
    		success : function(result) {
        	appendBuySkus(result,searchCategory);
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

	 function searcheditBuySkus(name,searchCategory){
		 var productsarray = [];
		var contextPath = $("#contextPath").val();
		/*if(editsaleProductIds.length == 0){
			 alert("select one Selling product");
			 return;
		}*/
		productsarray = editsaleProductIds;
		URL = contextPath + "/inventorymanager/searchskus.do";
		$.ajax({
    		type: "GET",
    		url : URL,
    		data : {
    			productsarray : productsarray.toString()
    		},
    		beforeSend: function(xhr){                    
	   				$("#loading").css("display","block");
	   				$("#mainDiv").addClass("disabled");
	        },
    		success : function(result) {
        	appendBuySkus(result,searchCategory);
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
    	 
	 function appendBuySkus(productsList,searchCategory){
		 $("."+searchCategory).html('');
		 if(productsList.length == 0){
			 $("#Error").html("There is No SKU for the given Search and Product Category");
			 $("."+searchCategory).hide();
			 $("."+searchCategory).html("");
			 focusDiv('Error');
			 return;
		 }
		 var op = '';
		 for(var i=0;i<productsList.length;i++){
			 if(productsList[i].skuID == productsList[i].description){
				 if (i == 0) {
					 op += '<li id="'+productsList[i].skuID+'"  class="selected" onclick=getId(this,"'+searchCategory+'"); ><a>'+productsList[i].description+'   (PRICE   -   '+productsList[i].price+')</a><input type="hidden" value="'+productsList[i].pluCode+'" /></li>';
				}else
				     op += '<li id="'+productsList[i].skuID+'" onclick=getId(this,"'+searchCategory+'"); ><a>'+productsList[i].description+'   (PRICE   -   '+productsList[i].price+')</a><input type="hidden" value="'+productsList[i].pluCode+'" /></li>';
		 	}
			 else{
				 if (i == 0) {
					 op += '<li id="'+productsList[i].skuID+'"  class="selected" onclick=getId(this,"'+searchCategory+'"); ><a>'+productsList[i].description+'   (SKU ID   -   '+productsList[i].skuID+',   PRICE   -   '+productsList[i].price+')</a><input type="hidden" value="'+productsList[i].pluCode+'" /></li>';
				}else
				     op += '<li id="'+productsList[i].skuID+'" onclick=getId(this,"'+searchCategory+'"); ><a>'+productsList[i].description+'   (SKU ID   -   '+productsList[i].skuID+',   PRICE   -   '+productsList[i].price+')</a><input type="hidden" value="'+productsList[i].pluCode+'" /></li>';
			 }
				/* if (i == 0) {
					 op += '<li id="'+productsList[i].skuID+'"  class="selected" onclick=getId(this,"'+searchCategory+'"); ><a>'+productsList[i].skuID+'</a></li>';
				}else
				     op += '<li id="'+productsList[i].skuID+'" onclick=getId(this,"'+searchCategory+'"); ><a>'+productsList[i].skuID+'</a></li>';*/
			 }
		 $("."+searchCategory).html(op);
		 $("."+searchCategory).show();
	 }
	 
	 var skuid = 0;
	 function addSkusToSellItem(materialName,pluCode){
		 var flag = true;
		 skuid = skuid+1;
		 $('#buySkuList').val('');
		 var contextPath = $("#contextPath").val();
			var remove = contextPath+"/images/itemdelete1.png";
			saleSkuId = materialName;
			$(".buyPluCode").each(function(){
				if($(this).val() == pluCode){
					alert(pluCode +" plu already added");
					flag = false;
					return;
				}
			});
			if(flag == true){
				saleSkuIds.push(materialName);
				$('#saleSkuids').append(														
						'<tr class='+"'"+skuid+"buySkuid'"+'><td style="font-size: 100%;"><span style="color: rgb(81, 93, 107)">'+materialName+'</span></td>'
						+'<td>'+pluCode+'</td><input type="hidden" class="buyPluCode" value="'+pluCode+'" />'
						+'<td class="price" style="font-size: 100%;"><center><img src='+remove+' style="cursor:pointer;" onclick="removeSaleSkuId('+"'"+skuid+"buySkuid'"+','+"'"+materialName+"'"+')"></center></td></tr>');
			}
			
	 }
	 
	 function addGroupSkuToTable(skuId,id,type){
		 $("#"+type+"Search").val("");
		 var flag = true;
		 var contextPath = $("#contextPath").val();
			var remove = contextPath+"/images/itemdelete1.png";
			$("."+type+"PluCode").each(function(){
				if($(this).val() == id){
					alert(id +" plu already added");
					flag = false;
					return;
				}
			});
			 var len = parseInt($("#"+type+" tr").length);
				if (len != 1)
					len = parseInt($("#"+type+" tr:last").attr("id").replace('dynamicdiv', '')) + 1;
			if(flag == true){
				$('#'+type).append(	
						'<tr id="dynamicdiv'+type+len+'" style="margin-top:5px;"><td style="font-size: 100%;"><span id="sku'+type+len+'" style="color: rgb(81, 93, 107)">'+skuId+'</span></td>'
						+'<td id="pluCode'+type+len+'">'+id+'</td><input type="hidden" class="'+type+'PluCode" value="'+id+'" />'
						+'<td id="Del'+type+len+'" class="price" style="font-size: 100%;"><center><img id="Img'+ type +len+'" src='+remove+' style="cursor:pointer;" onclick="deleteItem(this);"></center></td></tr>');
			}
	 }
	 
	 var editskuid=0;
	 function addeditSkusToSellItem(materialName,pluCode){
		 /*editskuid = editskuid+1;
		 $('#buySkuList').val('');
		 var contextPath = $("#contextPath").val();
			var remove = contextPath+"/images/itemdelete1.png";
			saleSkuId = materialName;
			 for(var id=0;id<editsaleSkuIds.length;id++){
			 if(editsaleSkuIds[id]==materialName){
						 alert(editsaleSkuIds[id] +" product already added");
					 return;
				 }
				 }
			 editsaleSkuIds.push(materialName);
		 
			$('#saleSkuids').append(														
	'<tr class='+"'"+editskuid+"editbuySkuid'"+'><td style="font-size: 100%;"><span style="color: rgb(81, 93, 107)">'+materialName+'</span></td>'
	+'<td class="price" style="font-size: 100%;"><center><img src='+remove+' style="cursor:pointer;" onclick="removeeditSaleSkuId('+"'"+editskuid+"editbuySkuid'"+','+"'"+materialName+"'"+')"></center></td></tr>');*/
			
			 var flag = true;
			 editskuid = editskuid+1;
			 $('#buySkuList').val('');
			 var contextPath = $("#contextPath").val();
				var remove = contextPath+"/images/itemdelete1.png";
				saleSkuId = materialName;
				$(".buyPluCode").each(function(){
					if($(this).val() == pluCode){
						alert(pluCode +" plu already added");
						flag = false;
						return;
					}
				});
				if(flag == true){
					editsaleSkuIds.push(materialName);
					$('#saleSkuids').append(														
							'<tr class='+"'"+editskuid+"editbuySkuid'"+'><td style="font-size: 100%;"><span style="color: rgb(81, 93, 107)">'+materialName+'</span></td>'
							+'<td>'+pluCode+'</td><input type="hidden" class="buyPluCode" value="'+pluCode+'" />'
							+'<td class="price" style="font-size: 100%;"><center><img src='+remove+' style="cursor:pointer;" onclick="removeeditSaleSkuId('+"'"+editskuid+"editbuySkuid'"+','+"'"+materialName+"'"+')"></center></td></tr>');
				}
			
	 }
	 
	 function removeSaleSkuId(product,productId){
			 remove(productId,saleSkuIds);
			 $('.'+product).remove();
		}
	 
	 function removeeditSaleSkuId(product,productId){
		 remove(productId,editsaleSkuIds);
		 $('.'+product).remove();
	}
	 

	 function searchDealProducts(name,searchCategory){
		 var contextPath = $("#contextPath").val();
		 URL = contextPath + "/inventorymanager/searchdealProducts.do";
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
            		appendDealProducts(result,searchCategory);
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

    	 
	 function appendDealProducts(productsList,searchCategory){
		 $("."+searchCategory).html('');
		 var op = '';
		 for(var i=0;i<productsList.length;i++){
			
				 if (i == 0) {
					 op += '<li id="'+productsList[i].productId+'"  class="selected" onclick=getId(this,"'+searchCategory+'"); ><a>'+productsList[i].description+'</a></li>';
				}else
				     op += '<li id="'+productsList[i].productId+'" onclick=getId(this,"'+searchCategory+'"); ><a>'+productsList[i].description+'</a></li>';
			 }
		 $("."+searchCategory).html(op);
		 $("."+searchCategory).show();
	 }
	 
	 var dealproductId = 0;
	 function addProductToDealItem(materialName,pluCode){
		 //debugger
		 dealproductId = dealproductId+1;
		 $('#dealProductsDataList').val('');
		 var contextPath = $("#contextPath").val();
			var remove = contextPath+"/images/itemdelete1.png";
			saleProductId = materialName;
			 for(var id=0;id<dealProductIds.length;id++){
			 if(dealProductIds[id]==materialName){
						 alert(dealProductIds[id] +" product already added");
					 return;
				 }
				 }
			 dealProductIds.push(materialName);
		 
			$('#dealProductsList').append(														
	'<tr class='+"'"+dealproductId+"dealProductId'"+'><td style="font-size: 100%;"><span style="color: rgb(81, 93, 107)">'+materialName+'</span><input type="hidden" class="dealPluCode" value="'+pluCode+'" /></td>'
	+'<td class="price" style="font-size: 100%;"><center><img src='+remove+' style="cursor:pointer;" onclick="removeDealProductId('+"'"+dealproductId+"dealProductId'"+','+"'"+materialName+"'"+')"></center></td></tr>');
			
	 }
	 
	 function addThisProductToDealItem(materialName,pluCode,Disc,qty,ean,size){
		 debugger;
		 dealproductId = dealproductId+1;
		 $('#dealProductsDataList').val('');
		 var contextPath = $("#contextPath").val();
			var remove = contextPath+"/images/itemdelete1.png";
			saleProductId = materialName;
			 for(var id=0;id<dealProductIds.length;id++){
			 if(dealProductIds[id]==materialName){
						 alert(dealProductIds[id] +" product already added");
					 return;
				 }
				 }
			 dealProductIds.push(materialName);
			 
			 if(size == null || size == undefined){
				 size = "";
			 }
		 
	$('#dealProductsList').append(														
	'<tr class='+"'"+dealproductId+"dealProductId'"+'>'
	+'<td style="font-size: 100%;"><span style="color: rgb(81, 93, 107)">'+materialName+'</span><input type="hidden" class="dealPluCode" value="'+pluCode+'" /><input type="hidden" class="" id="dealPluCode'+pluCode+'" value="'+pluCode+'" /><input type="hidden" class="" id="dealSkuCode'+pluCode+'" value="'+materialName+'" /></td>'
	+'<td style="font-size: 100%;"><span style="color: rgb(81, 93, 107)">'+Disc+'<input type="hidden" class="" id="dealDiscription'+pluCode+'" value="'+Disc+'" /></td>'
	+'<td style="font-size: 100%;"><span style="color: rgb(81, 93, 107)"><input type="text" style="width: 40px;text-align: center;" id="dealPluCodeQty'+pluCode+'" value="" /></td>'
	+'<td style="font-size: 100%;"><span style="color: rgb(81, 93, 107)">'+ean+'</td>'
	+'<td style="font-size: 100%;"><span style="color: rgb(81, 93, 107)">'+size+'</td>'
	+'<td class="price" style="font-size: 100%;"><center><img src='+remove+' style="cursor:pointer;" onclick="removeDealProductId('+"'"+dealproductId+"dealProductId'"+','+"'"+materialName+"'"+')"></center></td></tr>');
			
	 }
	 /*add edit ProductToDealItem*/
	 var editdealproductId = 0;
	 function addeditProductToDealItem(materialName,pluCode){
		 editdealproductId = editdealproductId+1;
		 $('#dealProductsDataList').val('');
		 var contextPath = $("#contextPath").val();
			var remove = contextPath+"/images/itemdelete1.png";
			saleProductId = materialName;
			 for(var id=0;id<editdealProductIds.length;id++){
			 if(editdealProductIds[id]==materialName){
						 alert(editdealProductIds[id] +" product already added");
					 return;
				 }
				 }
			 editdealProductIds.push(materialName);
		 
			$('#dealProductsList').append(														
	'<tr class='+"'"+editdealproductId+"editdealProductId'"+'><td style="font-size: 100%;"><span style="color: rgb(81, 93, 107)">'+materialName+'</span><input type="hidden" class="dealPluCode" value="'+pluCode+'" /></td>'
	+'<td class="price" style="font-size: 100%;"><center><img src='+remove+' style="cursor:pointer;" onclick="removeeditDealProductId('+"'"+editdealproductId+"editdealProductId'"+','+"'"+materialName+"'"+')"></center></td></tr>');
			
	 }
	 
	 function addThiseditProductToDealItem(materialName,pluCode,Disc,qty,ean,size){
		 editdealproductId = editdealproductId+1;
		 $('#dealProductsDataList').val('');
		 var contextPath = $("#contextPath").val();
			var remove = contextPath+"/images/itemdelete1.png";
			saleProductId = materialName;
			 for(var id=0;id<editdealProductIds.length;id++){
			 if(editdealProductIds[id]==materialName){
						 alert(editdealProductIds[id] +" product already added");
					 return;
				 }
				 }
			 editdealProductIds.push(materialName);
		 
			 $('#dealProductsList').append(														
						'<tr class='+"'"+editdealproductId+"dealProductId'"+'>'
						+'<td style="font-size: 100%;"><span style="color: rgb(81, 93, 107)">'+materialName+'</span><input type="hidden" class="dealPluCode" value="'+pluCode+'" /><input type="hidden" class="" id="dealPluCode'+pluCode+'" value="'+pluCode+'" /><input type="hidden" class="" id="dealSkuCode'+pluCode+'" value="'+materialName+'" /></td>'
						+'<td style="font-size: 100%;"><span style="color: rgb(81, 93, 107)">'+Disc+'<input type="hidden" class="" id="dealDiscription'+pluCode+'" value="'+Disc+'" /></td>'
						+'<td style="font-size: 100%;"><span style="color: rgb(81, 93, 107)"><input type="text" style="width: 40px;text-align: center;" id="dealPluCodeQty'+pluCode+'" value="" /></td>'
						+'<td style="font-size: 100%;"><span style="color: rgb(81, 93, 107)">'+ean+'</td>'
						+'<td style="font-size: 100%;"><span style="color: rgb(81, 93, 107)">'+size+'</td>'
						+'<td class="price" style="font-size: 100%;"><center><img src='+remove+' style="cursor:pointer;" onclick="removeDealProductId('+"'"+editdealproductId+"dealProductId'"+','+"'"+materialName+"'"+')"></center></td></tr>');
								
	 }
	 
	 
	 function removeDealProductId(name,productId){
		 remove(productId,dealProductIds);
		 $("."+name).remove();
	}
	 
	 function removeeditDealProductId(name,productId){
		 remove(productId,editdealProductIds);
		 $("."+name).remove();
	}
	 
	 function searchDealSkus(name,searchCategory){
		 var productsarray = [];
		 var contextPath = $("#contextPath").val();
		/* if(dealProductIds.length == 0){
			 alert("select one Deal product");
			 return;
		 }*/
		 productsarray = dealProductIds;
		 URL = contextPath + "/inventorymanager/searchskus.do";
		 $.ajax({
    			type: "GET",
    			url : URL,
    			data : {
    				productsarray : productsarray.toString()
    			},
    			beforeSend: function(xhr){                    
   	   				$("#loading").css("display","block");
   	   				$("#mainDiv").addClass("disabled");
    	        },
    			success : function(result) {
            		appendDealSkus(result,searchCategory);
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
	 
	 function searcheditDealSkus(name,searchCategory){
		 var productsarray = [];
		 var contextPath = $("#contextPath").val();
		 if(editdealProductIds.length == 0){
			 //saleProductIds = "all";
			 alert("select one Deal product");
			 return;
		 }
		 productsarray = editdealProductIds;
		 URL = contextPath + "/inventorymanager/searchskus.do";
		 $.ajax({
    			type: "GET",
    			url : URL,
    			data : {
    				productsarray : productsarray.toString()
    			},
    			beforeSend: function(xhr){                    
   	   				$("#loading").css("display","block");
   	   				$("#mainDiv").addClass("disabled");
    	        },
    			success : function(result) {
            		appendDealSkus(result,searchCategory);
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

    	 
	 function appendDealSkus(productsList,searchCategory){
		 $("."+searchCategory).html('');
		 var op = '';
		 for(var i=0;i<productsList.length;i++){
			 if(productsList[i].skuID == productsList[i].description){
				 if (i == 0) {
					 op += '<li id="'+productsList[i].skuID+'"  class="selected" onclick=getId(this,"'+searchCategory+'"); ><a>'+productsList[i].description+'   (PRICE   -   '+productsList[i].price+')</a><input type="hidden" value="'+productsList[i].pluCode+'" /></li>';
				}else
				     op += '<li id="'+productsList[i].skuID+'" onclick=getId(this,"'+searchCategory+'"); ><a>'+productsList[i].description+'   (PRICE   -   '+productsList[i].price+')</a><input type="hidden" value="'+productsList[i].pluCode+'" /></li>';
		 	}
			 else{
				 if (i == 0) {
					 op += '<li id="'+productsList[i].skuID+'"  class="selected" onclick=getId(this,"'+searchCategory+'"); ><a>'+productsList[i].description+'   (SKU ID   -   '+productsList[i].skuID+',   PRICE   -   '+productsList[i].price+')</a><input type="hidden" value="'+productsList[i].pluCode+'" /></li>';
				}else
				     op += '<li id="'+productsList[i].skuID+'" onclick=getId(this,"'+searchCategory+'"); ><a>'+productsList[i].description+'   (SKU ID   -   '+productsList[i].skuID+',   PRICE   -   '+productsList[i].price+')</a><input type="hidden" value="'+productsList[i].pluCode+'" /></li>';
			 }
				/* if (i == 0) {
					 op += '<li id="'+productsList[i].skuID+'"  class="selected" onclick=getId(this,"'+searchCategory+'"); ><a>'+productsList[i].skuID+'</a></li>';
				}else
				     op += '<li id="'+productsList[i].skuID+'" onclick=getId(this,"'+searchCategory+'"); ><a>'+productsList[i].skuID+'</a></li>';*/
			 }
		 $("."+searchCategory).html(op);
		 $("."+searchCategory).show();
	 }
	 
	 var dealskuid = 0;
	 function addSkuToDealItem(materialName,pluCode){
		 var flag = true;
		 dealskuid = dealskuid+1;
		 $('#dealSkudatalist').val('');
		 var contextPath = $("#contextPath").val();
			var remove = contextPath+"/images/itemdelete1.png";
			saleSkuId = materialName;
			$(".dealPluCode").each(function(){
				if($(this).val() == pluCode){
					alert(pluCode +" plu already added");
					flag = false;
					return;
				}
			});
			if(flag == true){
				dealSkuIds.push(materialName);
				$('#dealSkuTable').append(														
						'<tr class='+"'"+dealskuid+"dealSkuid'"+'><td style="font-size: 100%;"><span style="color: rgb(81, 93, 107)">'+materialName+'</span></td>'
						+'<td>'+pluCode+'</td><input type="hidden" class="dealPluCode" value="'+pluCode+'" />'
						+'<td class="price" style="font-size: 100%;"><center><img src='+remove+' style="cursor:pointer;" onclick="removeDelaSkuId('+"'"+dealskuid+"dealSkuid'"+','+"'"+materialName+"'"+')"></center></td></tr>');
			}
		
	 }
	 
	 var editdealskuid1 = 0;
	 function addeditSkuToDealItem(materialName,pluCode){
		/* editdealskuid1 = editdealskuid1+1;
		 $('#dealSkudatalist').val('');
		 var contextPath = $("#contextPath").val();
			var remove = contextPath+"/images/itemdelete1.png";
			saleSkuId = materialName;
			 for(var id=0;id<editdealSkuIds.length;id++){
			 if(editdealSkuIds[id]==materialName){
						 alert(editdealSkuIds[id] +" product already added");
					 return;
				 }
				 }
			 editdealSkuIds.push(materialName);
		 
			$('#dealSkuTable').append(														
	'<tr class='+"'"+editdealskuid1+"editdealSkuid'"+'><td style="font-size: 100%;"><span style="color: rgb(81, 93, 107)">'+materialName+'</span></td>'
	+'<td class="price" style="font-size: 100%;"><center><img src='+remove+' style="cursor:pointer;" onclick="removeeditDelaSkuId('+"'"+editdealskuid1+"editdealSkuid'"+','+"'"+materialName+"'"+')"></center></td></tr>');*/
			
			
			 var flag = true;
			 editdealskuid1 = editdealskuid1+1;
			 $('#dealSkudatalist').val('');
			 var contextPath = $("#contextPath").val();
				var remove = contextPath+"/images/itemdelete1.png";
				saleSkuId = materialName;
				$(".dealPluCode").each(function(){
					if($(this).val() == pluCode){
						alert(pluCode +" plu already added");
						flag = false;
						return;
					}
				});
				if(flag == true){
					editdealSkuIds.push(materialName);
					$('#dealSkuTable').append(														
							'<tr class='+"'"+editdealskuid1+"editdealSkuid'"+'><td style="font-size: 100%;"><span style="color: rgb(81, 93, 107)">'+materialName+'</span></td>'
							+'<td>'+pluCode+'</td><input type="hidden" class="dealPluCode" value="'+pluCode+'" />'
							+'<td class="price" style="font-size: 100%;"><center><img src='+remove+' style="cursor:pointer;" onclick="removeeditDelaSkuId('+"'"+editdealskuid1+"editdealSkuid'"+','+"'"+materialName+"'"+')"></center></td></tr>');
				}
			
	 }
	 
	 function removeDelaSkuId(product,productId){
		 remove(productId,dealSkuIds);
			 $('.'+product).remove();
		}
	 
	 function removeeditDelaSkuId(product,productId){
		 remove(productId,editdealSkuIds);
			 $('.'+product).remove();
		}

	 
	 var count = 0;
	 /*var totalranges = {},range = [], rangeitems = {};*/
	 /*function addSlab(){
		 var contextPath = $("#contextPath").val();
		 count = count+1;
		var value = "range"+count;
		 $("#slabsList")
			.append(
					'<tr id='
							+ value
							+ '><td style="width: 10%;display:none;"><span>'
							+ value
							+ '</span></td>'
							+'<td style="width: 15%"><input class="form-control minPurQty"' +
							'oninput="this.value = this.value.replace(/[^0-9.]/g, \'\'); this.value = this.value.replace(/(\..*)\./g, \'$1\');"'  +
							'onblur="textBoxColor(this)" type="text" name="category_name" id ='+"'"+value+"minquantity'"+' onkeyUp ="addminquantity('+"'"+value+"minquantity'"+','+"'"+value+"'"+')"/></td>'
							+'<td style="width: 15%"><input class="form-control minPurAmt"'+
							'oninput="this.value = this.value.replace(/[^0-9]/g, \'\'); this.value = this.value.replace(/(\..*)\/g, \'$1\');"'  +
							' onblur="textBoxColor(this)" type="text" name="category_name" id ='+"'"+value+"minamount'"+' onkeyUp ="addminamount('+"'"+value+"minamount'"+','+"'"+value+"'"+')"/></td>'
							+'<td style="width: 15%"><input class="form-control dealQty"'+
							'oninput="this.value = this.value.replace(/[^0-9]/g, \'\'); this.value = this.value.replace(/(\..*)\/g, \'$1\');"'  +
							' onblur="textBoxColor(this)" type="text" name="category_name" id ='+"'"+value+"dealquantity'"+' onkeyUp ="adddealquantity('+"'"+value+"dealquantity'"+','+"'"+value+"'"+')"/></td>'
							+'<td style="width: 15%"><input class="form-control dealDesc" onblur="textBoxColor(this)" type="text" name="category_name" id ='+"'"+value+"description'"+' onkeyUp ="addrangeDesc('+"'"+value+"description'"+','+"'"+value+"'"+')"/></td>'
							+'<th style="width: 15%"></th>'
							+'<td style="width: 5%"><img src='+contextPath+'/images/addslab.png style="  width: 33px;cursor: pointer;" onclick="addSlab()" > <img src='+contextPath+'/images/itemdelete1.png style="  width: 24px;cursor: pointer;" onclick="removeSlab('
							+ "'range" + count + "'" + ')"></td></tr>');
		 
		totalranges.range = range;
		rangeitems = {
			"range" : value,
			"minimumPurchaseQuantity" : " ",
			"minimumPurchaseamount" : " ",
			"dealQuantity" : " ",
			"description" : " "
		};
		totalranges.range.push(rangeitems);
		}*/
	 
	 var newcount=$("#slabsList tr").length - 1;
	 function addSlab(){
		 newcount = newcount+1;
		var currentDealSlabDivContent = dealSlabDivContent;
		currentDealSlabDivContent = currentDealSlabDivContent.replace('range1','range'+newcount);
		currentDealSlabDivContent = currentDealSlabDivContent.replace('selected1groupId','selected'+newcount+'groupId');
		currentDealSlabDivContent = currentDealSlabDivContent.replace('1groupId',newcount+'groupId');
		currentDealSlabDivContent = currentDealSlabDivContent.replace('1groupId',newcount+'groupId');
		currentDealSlabDivContent = currentDealSlabDivContent.replace('1itemId',newcount+'itemId');
		currentDealSlabDivContent = currentDealSlabDivContent.replace('1itemId',newcount+'itemId');
		currentDealSlabDivContent = currentDealSlabDivContent.replace('selected1itemId','selected'+newcount+'itemId');
		currentDealSlabDivContent = currentDealSlabDivContent.replace('pluCode1itemId','pluCode'+newcount+'itemId');
		currentDealSlabDivContent = currentDealSlabDivContent.replace('1minquantity',newcount+'minquantity');
		currentDealSlabDivContent = currentDealSlabDivContent.replace('1minamount',newcount+'minamount');
		currentDealSlabDivContent = currentDealSlabDivContent.replace('1dealquantity',newcount+'dealquantity');
		currentDealSlabDivContent = currentDealSlabDivContent.replace('1rangeMode',newcount+'rangeMode');
		currentDealSlabDivContent = currentDealSlabDivContent.replace('1description',newcount+'description');
		currentDealSlabDivContent = currentDealSlabDivContent.replace('range1','range'+newcount);
	
		 $("#slabsList tbody")
			.append(currentDealSlabDivContent);
		
		}
	 
	 
	 function addminquantity(id,value){
		for(var i = 0;i<range.length;i++){
			if(range[i].range == value){
			range[i].minimumPurchaseQuantity = $("#"+id).val();
			}
		}
	}
	 function addrangeDesc(id,value){
		 for(var i = 0;i<range.length;i++){
				if(range[i].range == value){
				range[i].description = $("#"+id).val();
				}
			}
	 }
	 function addminamount(id,value){
			for(var i = 0;i<range.length;i++){
				if(range[i].range == value){
				range[i].minimumPurchaseamount = $("#"+id).val();
				}
			}
		}
	 
	 function adddealquantity(id,value){
			for(var i = 0;i<range.length;i++){
				if(range[i].range == value){
				range[i].dealQuantity = $("#"+id).val();
				}
			}
		}
	 
	  function removeSlab(slabid){
		 $("#"+slabid).remove();
		 for(var i = 0;i<range.length;i++){
				if(range[i].range == slabid){
				//delete range[i];
					range.splice(i,1);
				}
			}
		 }
    
	  $("#dealLocation").change(function(){
			 $("#Error").html("");
		 });
	  $("#editdealLocation").change(function(){
			 $("#Error").html("");
		 });
	  $("#saleCategory").change(function(){
			 $("#Error").html("");
		 });
	  $("#dealCategory").change(function(){
			 $("#Error").html("");
		 });
	  $("#searchItems").keydown(function(){
			 $("#Error").html("");
		 });
	  $("#buySkuList").keydown(function(){
			 $("#Error").html("");
		 });
	  $("#dealProductsDataList").keydown(function(){
			 $("#Error").html("");
		 });
	  $("#dealSkudatalist").keydown(function(){
			 $("#Error").html("");
		 });
	  $("#saleGroup").keydown(function(){
			 $("#Error").html("");
		 });
	  $("#saleGroupSkuSearch").keydown(function(){
			 $("#Error").html("");
		 });
	  $("#dealGroup").keydown(function(){
			 $("#Error").html("");
		 });
	  $("#dealGroupSkuSearch").keydown(function(){
			 $("#Error").html("");
		 });
	  $("#dealName").keydown(function(){
			 $("#dealNameErr").html("");
		 });
	  $("#editdealName").keydown(function(){
			 $("#dealNameErr").html("");
		 });
	  
	  function parseDate(str) {
		    var mdy = str.split('/');
		    return new Date(mdy[0], mdy[1]-1, mdy[2]);
		}
		 function daydiff(first, second) {
		    return (second-first)/(1000*60*60*24);
		}
	  
	function createDeal(){
		$("#Error").html("");
		debugger;
		
		if($("#dealName").val() == null || $("#dealName").val() ==""){
			$("#dealNameErr").html("Enter Deal Name");
			$("#dealName").focus();
			return;
		}
		
		var str = $("#dealName").val();
		if(/^[a-zA-Z0-9#_ ]*$/.test(str) == false) {
		   // alert('Your search string contains illegal characters.');
		    $("#dealNameErr").html("Special charecters not allowed");
			$("#dealName").focus();
			return;
		}
		var location = $("#dealLocation").val();
		if(location == null || location ==""){
			$("#Error").html("select one location");
			$("#dealLocation").focus();
			return;
		}
		if(location.indexOf(",")){
			location = $("#dealLocation").val().toString();
		}
		if($("#dealStartDate").val() == ""){
			$("#dealStartDateError").html("Start Date Required");
			return;
		}
		if($("#dealEndDate").val() == ""){
			$("#dealEndDateError").html("End Date Required");
			return;
		}
		var dateTime = getCurrentDate();
		  var date = dateTime.split(' ');
		  date = date[0].split('/');
		  var formatedDate = date[2]+"/"+date[0]+"/"+date[1];
		  var noOfDays = daydiff(parseDate(formatedDate),parseDate($('#dealStartDate').val()));
		 if(noOfDays < 0){
			 $("#Error").html("Start Date should be Future Date");
			 focusDiv('Error');
			 return;
		 }
		/* noOfDays = daydiff(parseDate(formatedDate),parseDate($('#dealEndDate').val()));
		 if(noOfDays < 0){
			 $("#Error").html("End Date should be Future Date");
			 focusDiv('Error');
			 return;
		 }*/
		noOfDays = daydiff(parseDate($('#dealStartDate').val()), parseDate($('#dealEndDate').val()));
		 if(noOfDays < 0){
			 $("#Error").html("End Date can't be less than Start Date");
			 focusDiv('Error');
			 return;
		 }
			var finalObj = {};
			finalObj.dealName = $("#dealName").val();
			finalObj.dealDescription = $("#dealDesc").val();
			finalObj.dealCategory = $("#dealcategory").val();
			finalObj.storeLocation = location;
			finalObj.priority = $("#dealPriority").val();
			finalObj.dealStatus = $('input[name=dealStatus]:checked').val();
			finalObj.claimCoupons = $('input[name=coupons]:checked').val();
			finalObj.claimLoyaltypoints = $('input[name=loyaltyPoints]:checked').val();
			finalObj.claimgiftvouchers = $('input[name=giftvouchers]:checked').val();
			finalObj.dealStartDate = $("#dealStartDate").val();
			finalObj.dealEndDate = $("#dealEndDate").val();
			
			
			var locDetails=[];
			if($("#dealLocation").val() != null){
				var locations = $("#dealLocation").val().toString().split(',');
				for(var i=0; i<locations.length; i++){
				//	lc = locations[i];
				obj = {"storeLocation":locations[i]};
					locDetails.push(obj);
				}
			}
			
			finalObj.dealLocationsList = locDetails;
			/*var dateandTime = getCurrentDate();
			  var dateValue = dateandTime.split(' ');
			  var time = dateValue[1];
			  dateValue = dateValue[0].split('/');
			  var dateFormat = dateValue[1]+"/"+dateValue[0]+"/"+dateValue[2];
			
			  var createddate = dateFormat+' ' + time;
			finalObj.createdOnStr = createddate;*/
			
			
			if($("#dealBannerRefId").val().trim() != "" && $("#dealBannerRefId").val() != null){
				finalObj.imageRefId = $("#dealBannerRefId").val();
				finalObj.deal_image = $("#dealBanner_name").val();
			}
			if($("#dealBanner_thumbnail").length > 0)
				finalObj.imageFlag = "true";
			else
				finalObj.imageFlag = "false";
			if(getFormData() == false)
				return;
			finalObj.customerFilter = getFormData();
			finalObj.dealImageText = $("#dealImageText").val();
			finalObj.dealImageTextFont = $("#dealImageTextFontHidden").val();
			finalObj.dealImageSize = $("#dealImageTextSize").val();
			finalObj.dealImageColor = $("#dealImageTextColor").val();
			if($("#dealImageBold").prop('checked') == true)
				finalObj.dealImageBold = 1;
			else
				finalObj.dealImageBold = 0;
			if($("#dealImageItalic").prop('checked') == true)
				finalObj.dealImageItalic = 1;
			else	
				finalObj.dealImageItalic = 0;
			if($("#dealImageStrike").prop('checked') == true)
				finalObj.dealImageStrike = 1;
			else
				finalObj.dealImageStrike = 1;
			finalObj.salePriceText = $("#saleText").val();
			finalObj.salePriceFont = $("#saleTextFontHidden").val();
			finalObj.salePriceSize = $("#saleTextSize").val();
			finalObj.salePriceColor = $("#saleTextColor").val();
			if($("#saleTextBold").prop('checked') == true)
				finalObj.salePriceBold = 1;
			else
				finalObj.salePriceBold = 0;
			if($("#saleTextItalic").prop('checked') == true)
				finalObj.salePriceItalic = 1;
			else
				finalObj.salePriceItalic = 0;
			if($("#saleTextStrike").prop('checked') == true)
				finalObj.salePriceStrike = 1;
			else
				finalObj.salePriceStrike = 0;
			
			finalObj.dealPriceText = $("#dealText").val();
			finalObj.dealPriceFont = $("#dealTextFontHidden").val();
			finalObj.dealPriceSize = $("#dealTextSize").val();
			finalObj.dealPriceColor = $("#dealTextColor").val();
			if($("#dealTextBold").prop('checked') == true)
				finalObj.dealPriceBold = 1;
			else
				finalObj.dealPriceBold = 0;
			if($("#dealTextItalic").prop('checked') == true)
				finalObj.dealPriceItalic = 1;
			else
				finalObj.dealPriceItalic = 0;
			if($("#dealTextStrike").prop('checked') == true)
				finalObj.dealPriceStrike = 1;
			else
				finalObj.dealPriceStrike = 0;
			if($("#startTime").val() == ""){
				$("#startTimeError").html("Enter Start Time");
				return;
			}
			finalObj.dealStartTimeStr = $("#startTime").val();
			if($("#endTime").val() == ""){
				$("#endTimeError").html("Enter End Time");
				return;
			}
			finalObj.dealEndTimeStr = $("#endTime").val();
			finalObj.day1 = $("#day1").prop("checked");
			finalObj.day2 = $("#day2").prop("checked");
			finalObj.day3 = $("#day3").prop("checked");
			finalObj.day4 = $("#day4").prop("checked");
			finalObj.day5 = $("#day5").prop("checked");
			finalObj.day6 = $("#day6").prop("checked");
			finalObj.day7 = $("#day7").prop("checked");
			finalObj.allowMultipleDiscounts = $("#allownMulDisc").prop("checked");
			finalObj.repeat = $("#isRepeat").prop("checked");
			finalObj.bannerImg = $("#banner").prop("checked");
			//koti bommineni
			finalObj.allowExchanges = $("#applyExchanges").prop("checked");
			finalObj.allowReturns = $("#applyReturns").prop("checked");
			finalObj.salePriceBased = $("#applysaleprice").prop("checked");
			finalObj.combo = $("#isCombo").prop("checked");
			finalObj.lowestPriceItem = $("#lowestPriceItem").prop("checked");
			
			
			var totalranges = {},range = [], rangeitems = {};
			totalranges.range = range;
			
			//based on product
			debugger;
			if($("#basedOnProduct").prop("checked") == true){
				if($("#dealcategory").val() == "item_specific"){
					if(saleProductIds.length == 0 && saleSkuIds.length == 0 && $("#saleCategory").val() == "-- Select --"){
						$("#Error").html("Please Select Atleast Sale Product Category Or Sale Product Or Sale Sku");
						 focusDiv('Error');
						return;
					}
				}
				/*if(dealProductIds.length ==0 && dealSkuIds.length == 0 && $("#dealCategory").val() == "-- Select --"){
					$("#Error").html("Please Select Atleast Deal Product Category Or Deal Product Or Deal Sku");
					 focusDiv('Error');
					return;
				}*/
				if($("#dealcategory").val() == "item_specific"){
					if($("#saleCategory").val() != "-- Select --")
						{
						finalObj.saleProductCategory = $("#saleCategory").val();
						finalObj.dealProductCategory = $("#saleCategory").val();
						}
						
					if($("#sale_sub_category").val() != "-- Select --")
						{
						finalObj.saleProductSubCategory = $("#sale_sub_category").val();
						finalObj.dealProductSubCategory = $("#sale_sub_category").val();
						}
					
					if($("#sale_department").val() != "-- Select --")
						{
						finalObj.productDepartment = $("#sale_department").val();
						
						}
					if($("#sale_section").val() != "-- Select --")
						{
						finalObj.section = $("#sale_section").val();
						
						}
					
					if($("#sale_brand").val() != "-- Select --")
						{
						finalObj.brand = $("#sale_brand").val();
						
						}
					
						
				}

				if($("#dealcategory").val() == "item_specific"){
					finalObj.sellProducts = "";//saleProductIds.toString();
					finalObj.sellSkuids = "";//saleProductIds.toString();
				}
				var dealProductItem=""//$("#dealProductItem").val();
				if(dealProductItem==undefined || dealProductItem=="" ||dealProductItem==null)
					{
					dealProductItem="";
					}
				finalObj.dealProducts = dealProductItem;//dealProductIds.toString();
				finalObj.dealSkus = "";//dealProductIds.toString();
				var dealPluCode = [];
				$('.dealPluCode').each(function(){
					dealPluCode.push($(this).val());
				});
				//finalObj.dealPluCode = dealPluCode.toString();
				if($("#dealcategory").val() == "item_specific"){
					var salePluCode = [];
					var dealProductList=[];
					$('.buyPluCode').each(function(){
						salePluCode.push($(this).val());
					});
					//finalObj.sellPluCode = salePluCode.toString();
					
					
					if(salePluCode.length>0)
						{
						finalObj.repeat = $("#isRepeatItem").prop("checked");
						finalObj.lowestPriceItem = $("#lowestPriceItemItem").prop("checked");

							for(var i=0;i<=salePluCode.length-1;i++)
								{
								var dealqty=$("#dealPluCodeQty"+dealPluCode[i]).val();
								var saleqty=$("#buyPluCodeQty"+salePluCode[i]).val();
								var turnover=$("#buyPluCodeTurnOver"+salePluCode[i]).val();
								if(dealqty=="")
									{
									dealqty=0;
									}
								if(saleqty=="")
									{
									saleqty=0;
									}
								
								if(turnover=="")
									{
										turnover=0;
									}
								if(parseInt(dealqty)<=0)
									{
										$("#Error").html("Deal quantity should be greater than zero");
										 focusDiv('Error');
										return;
									}
								var rewardTyp=$("#itemSpecificTypeBox").val();
								finalObj.rewardType = rewardTyp;
								if(rewardTyp=="Quantity Based")
									{
										if(parseInt(saleqty)<=0)
											{
												$("#Error").html("Sale quantity should be greater than zero");
												 focusDiv('Error');
												return;
											}
										turnover=0;
									}
								else
									{
										if(parseInt(turnover)<=0)
										{
											$("#Error").html("Turnover amount should be greater than zero");
											 focusDiv('Error');
											return;
										}
										saleqty=0;
									}

								dealProductList.push({"saleSkuId":$("#buySkuCode"+salePluCode[i]).val(),
									 
									"salePluCode":$("#buyPluCode"+salePluCode[i]).val(),
									"dealSkuId":$("#dealSkuCode"+dealPluCode[i]).val(),
									"dealPluCode":$("#dealPluCode"+dealPluCode[i]).val(),
									"saleProductDescription":$("#buyDiscription"+salePluCode[i]).val(),
									"dealProductDescription":$("#dealDiscription"+dealPluCode[i]).val(),
									//"minPurchaseQtyStr":"0", 
									//"minPurchaseAmountStr":"0",
									"dealQuantity":parseInt(dealqty),
									"saleQuantity":parseInt(saleqty), 
									"dealTurnOver":parseFloat(turnover),
									"minPurchaseAmount":parseFloat(turnover),
									"rewardType":"",
									"saleCategory":"",
									"saleSubCategory":"", 
									"saleBrand":"",
									"saleSection":"",
									"saleDepartment":"", 
									"saleModel":"",
									"dealCategory":"",
									"dealSubCategory":"", 
									"dealBrand":"",
									"dealSection":"",
									"dealDepartment":"", 
									"dealModel":"",
									"saleEan":"", 
									"dealEan":"", 
									"dealSize":"",
									"saleSize":""
									});
								
								}
						}
					finalObj.dealProductList=dealProductList;
					
			if($("#itemDisountBased").is(':checked')){	
				
				if(salePluCode.length<=0)
				{
					$("#Error").html("Please add sale and deal products.");
					focusDiv('Error');
					return;
				}
				
					rangeitems = {
							"range" : "",
							"minimumPurchaseQuantity" : "1",
							"minimumPurchaseamount" : "0",
							"dealQuantity" : "0",
							"rangeMode" : "",
							"description" : "",
							"groupId" : "",
							"itemId" : "",
   				 		    "pluCode" :  "",
   				 		    "saleMinimumPurchaseQuantity" : "1",
   				 		    "saleMinimumPurchaseamount" : "0",
   				 		    "saleQuantity" : "0",
   				 		    "saleRangeMode" : "",
   				 		    "saleGroupId" : "",
   				 		    "saleItemId" : "",
						 };
				 totalranges.range.push(rangeitems);
				 
			}
				}
				
				//complex item based
				
				if($("#complexDisountBased").is(':checked')){		
					
					//finalObj.priceBasedConfigurationFlag = $("#offerRewardCriteria").val();
					//finalObj.applyForAllItems = $("#applyForAllItemsProduct").prop("checked");
					//finalObj.allowMultipleDiscounts = $("#allownMulDiscProduct").prop("checked");

					finalObj.repeat = $("#isRepeatProduct").prop("checked");
					finalObj.lowestPriceItem = $("#lowestPriceItemProduct").prop("checked");

					//var priceBasedProduct=finalObj.priceBasedConfigurationFlag;
					
					finalObj.rewardType = $("#offerRewardCriteria").val();
					//var len1 = $("#slabLis tr").length - 1;
					
				   // var bothOrPromotionFlag = false;
					var category=$("#saleCategory").val();
					var department=$("#sale_department").val();
					var brand=$("#sale_brand").val();
					if(category=="" || category==undefined || category==null)
						{
							category="";
						}
					if(department=="" || department==undefined || department==null)
						{
							department="";
						}
					if(brand=="" || brand==undefined || brand==null)
						{
							brand="";
						}
					
					
					if($("#applyForAllItemsProduct").prop("checked") == false)
						{
						if(category=="" && department=="" && brand=="" && $("#dealcategory").val()!="turn_over")
						{
							$("#Error").html("Please select category or department or brand");
							 focusDiv('Error');
							return;
						}
						}
					var minDealQty=$("#minQtyProductDeal").val();
					var minSaleQty=$("#minQtyProductSale").val();
					var minSaleAmt=$("#minAmtProductSale").val();
					if(minSaleAmt=="" || minSaleAmt==undefined)
						{
						minSaleAmt="0";
						}
					if(minDealQty=="" || minDealQty==undefined)
						{
						minDealQty="0";
						}
					if(minSaleQty=="" || minSaleQty==undefined)
						{
						minSaleQty="0";
						}
					
					if(parseInt(minDealQty)<=0)
						{
						$("#Error").html("deal quantity should be grather than 0.");
						 focusDiv('Error');
						return;
						}
					
					
					
					var rewardTyp=$("#offerRewardCriteria").val();
					
					if(rewardTyp=="Quantity Based")
					{
						if(parseInt(minSaleQty)<=0)
							{
								$("#Error").html("Minimum sale quantity should be greater than zero");
								 focusDiv('Error');
								return;
							}
						minSaleAmt="0";
					}
				else
					{
						if(parseInt(minSaleAmt)<=0)
						{
							$("#Error").html("Minimum sale amount should be greater than zero");
							 focusDiv('Error');
							return;
						}
						minSaleQty="0";
					}
					
					
					/*if(parseInt(minSaleQty)<=0 && parseInt(minSaleAmt)<=0) 
						{
							$("#Error").html("Minimum sale quantity or sale amount should be grather than 0.");
							focusDiv('Error');
							return;
						}
					*/
					
					rangeitems = {
							"range" : "",
							"minimumPurchaseQuantity" : minDealQty,
							"minimumPurchaseamount" : minSaleAmt,
							"dealQuantity" : minDealQty,
							"rangeMode" : "",
							"description" : "",
							"groupId" : "",
							"itemId" : $("#dealProductItemSku").val(),
   				 		    "pluCode" :  "",
   				 		    "saleMinimumPurchaseQuantity": minSaleQty,
   				 		    "saleMinimumPurchaseamount" : minSaleAmt,
   				 		    "saleQuantity" : minSaleQty,
   				 		    "saleRangeMode" : "",
   				 		    "saleGroupId" : "",
   				 		    "saleItemId" : "",

						 };
					totalranges.range.push(rangeitems);
				    
					}
			}
			//based on group
			else if($("#basedOnGroup").prop("checked") == true){
				if($("#dealcategory").val() == "item_specific"){
					if($("#saleGroupId").length > 0 && $("#dealGroupId").length > 0){
						finalObj.sellGroupId = $("#saleGroupId").text();
						finalObj.dealGroupId = $("#dealGroupId").text();
						var len = $("#saleGroupSku tr").length-1;
						var saleGroupSku = [];
						var saleGroupPlu = [];
						var i=0;
						var idAttr = "", skuId = "", pluCode = "";
						for(i=1;i<=len;i++){
							idAttr = $("#saleGroupSku tr:eq("+i+") td:last").attr("id");
							idAttr = idAttr.replace('DelsaleGroupSku','');
							skuId = $("#skusaleGroupSku"+idAttr).text();
							pluCode = $("#pluCodesaleGroupSku"+idAttr).text();
							saleGroupSku.push(skuId);
							saleGroupPlu.push(pluCode);
						}
						if(saleGroupSku.length > 0)
							finalObj.sellSkuids = saleGroupSku.toString();
						if(saleGroupPlu.length > 0)
							finalObj.sellPluCode = saleGroupPlu.toString();
						len = $("#dealGroupSku tr").length-1;
						var dealGroupSku = [];
						var dealGroupPlu = [];
						for(i=1;i<=len;i++){
							idAttr = $("#dealGroupSku tr:eq("+i+") td:last").attr("id");
							idAttr = idAttr.replace('DeldealGroupSku','');
							skuId = $("#skudealGroupSku"+idAttr).text();
							pluCode = $("#pluCodedealGroupSku"+idAttr).text();
							dealGroupSku.push(skuId);
							dealGroupPlu.push(pluCode);
						}
						if(dealGroupSku.length > 0)
							finalObj.dealSkus = dealGroupSku.toString();
						if(dealGroupPlu.length > 0)
							finalObj.dealPluCode = dealGroupPlu.toString();
				}else{
					$("#Error").html("Please Select Sale Group Id and Deal Group Id");
					 focusDiv('Error');
					return;
				}
				}else{
					if($("#dealGroupId").length > 0){
						finalObj.dealGroupId = $("#dealGroupId").text();
						var len = $("#dealGroupSku tr").length-1;
						var dealGroupSku = [];
						var dealGroupPlu = [];
						var idAttr = "", skuId = "", pluCode = "";
						for(var i=1;i<=len;i++){
							idAttr = $("#dealGroupSku tr:eq("+i+") td:last").attr("id");
							idAttr = idAttr.replace('DeldealGroupSku','');
							skuId = $("#skudealGroupSku"+idAttr).text();
							pluCode = $("#pluCodedealGroupSku"+idAttr).text();
							dealGroupSku.push(skuId);
							dealGroupPlu.push(pluCode);
						}
						if(dealGroupSku.length > 0)
							finalObj.dealSkus = dealGroupSku.toString();
						if(dealGroupPlu.length > 0)
							finalObj.dealPluCode = dealGroupPlu.toString();
						if($("#itemDisountBasedGroup").is(':checked')){	
							rangeitems = {
									"range" : "",
									"minimumPurchaseQuantity" : "1",
									"minimumPurchaseamount" : "0",
									"dealQuantity" : "0",
									"rangeMode" : "",
									"description" : "",
									"groupId" : "",
									"itemId" : "",
		   				 		    "pluCode" :  "",
		   				 		    "saleMinimumPurchaseQuantity" : "1",
		   				 		    "saleMinimumPurchaseamount" : "0",
		   				 		    "saleQuantity" : "0",
		   				 		    "saleRangeMode" : "",
		   				 		    "saleGroupId" : "",
		   				 		    "saleItemId" : "",
								 };
						 totalranges.range.push(rangeitems);
						 
					}
						
					}else{
						$("#Error").html("Please Select Deal Group Id");
						 focusDiv('Error');
						return;
					}
				}
				
				//complex group based
				
				if($("#complexbasedOnGroup").is(':checked')){
					finalObj.rewardType = $("#offerRewardCriteriaGroup").val();
					finalObj.repeat = $("#isRepeat").prop("checked");
					finalObj.lowestPriceItem = $("#lowestPriceItem").prop("checked");

					finalObj.sellGroupId = $("#saleGroupId").text();
					finalObj.dealGroupId = $("#dealGroupId").text();
					var minDealQty=$("#groupDealMinQty").val();
					var minSaleQty=$("#groupSaleMinQty").val();
					var maxSaleAmt=$("#groupSaleMaxAmt").val();
					var minSaleAmt=$("#groupSaleMinAmt").val();
					var group1=$("#1groupId").val();
					var group2=$("#2groupId").val();
					if(group1=="" || group1==undefined)
						{
							group1="";
						}
					if(group2=="" || group2==undefined)
						{
							group2="";
						}
					if(minDealQty=="" || minDealQty==undefined)
						{
						minDealQty="0";
						}
					if(minSaleQty=="" || minSaleQty==undefined)
						{
						minSaleQty="0";
						}
					if(maxSaleAmt=="" || maxSaleAmt==undefined)
						{
						maxSaleAmt="0";
						}
					if(minSaleAmt=="" || minSaleAmt==undefined)
						{
						minSaleAmt="0";
						}
					
					
					if(parseInt(minDealQty)<=0)
						{
						 $("#Error").html("Deal quantity should be grather than 0.");
						 focusDiv('Error');
						  return;
						}
					
					
					
					var rewardTyp=$("#offerRewardCriteriaGroup").val();
					finalObj.rewardType = rewardTyp;
					if(rewardTyp=="Quantity Based")
						{
							if(parseInt(minSaleQty)<=0)
								{
									$("#Error").html("Minimum Sale quantity should be greater than zero");
									 focusDiv('Error');
									return;
								}
							maxSaleAmt="0";
							minSaleAmt="0";
						}
					else
						{
							if(parseInt(minSaleAmt)<=0  && parseInt(maxSaleAmt)<=0)
							{
								$("#Error").html("Minimum sale amount and maximum sale amount should be grather than 0.");
								 focusDiv('Error');
								return;
							}
							
							if(parseInt(minSaleAmt)>=0 && parseInt(maxSaleAmt)>0)
							{
							if(parseInt(minSaleAmt)>parseInt(maxSaleAmt))
								{
								$("#Error").html("Maximum sale amount should be grather than Minimum sale amount.");
								 focusDiv('Error');
								 return;
								}
							}
							minSaleQty="0";
						}
					
					
					/*if(parseInt(minSaleAmt)<=0 && parseInt(maxSaleAmt)<=0 && parseInt(minSaleQty)<=0)
						{
						$("#Error").html("Minimum sale amount amd maximum sale amount should be grather than 0.");
						 focusDiv('Error');
						  return;
						}*/
					
					
					

					rangeitems = {
							"range" : "",
							"minimumPurchaseQuantity" : minDealQty,
							"minimumPurchaseamount" : minSaleAmt,
							"maximumPurchaseAmount":maxSaleAmt,
							"dealQuantity" : minDealQty,
							"rangeMode" : "",
							"description" : "",
							"groupId" : group2,
							"itemId" : $("#dealProductItemGroup").val(),
   				 		    "pluCode" :  "",
   				 		    "saleMinimumPurchaseQuantity" : minSaleQty,
   				 		    "saleMinimumPurchaseamount" : minSaleAmt,
   				 		    "saleMaximumPurchaseAmount":maxSaleAmt,
   				 		    "saleQuantity" : minSaleQty,
   				 		    "saleRangeMode" : "",
   				 		    "saleGroupId" : group1,
   				 		    "saleItemId" : "",

						 };
				 totalranges.range.push(rangeitems);   
				}
				
			}
			
/*			
if(totalranges.range.length==0)
	 {

			 var len = $("#slabsList tr").length - 1;
			 var bothOrPromotionFlag = false;
			 for(var i=1;i<=len;i++){
				 var idAttr = $("#slabsList tr:eq("+i+")").attr("id").replace("range",'');
				 var minPurQty = $("#"+idAttr+"minquantity").val();
				 var minAmt = $("#"+idAttr+"minamount").val();
				 var dealQty = $("#"+idAttr+"dealquantity").val();
				 
				 if($("#isCombo").prop("checked")){
					 if( $("#"+idAttr+"rangeMode").val() == "both"){
						 if(minPurQty > 0 && minAmt > 0){
							 $("#Error").html("Enter Either Minimum Purchase Quantity Or Minimum Purchase Amount");
							 $("#"+idAttr+"minquantity").focus();
							 return;
						 }
						 if(minPurQty == 0 && minAmt == 0){
							 $("#Error").html("Either Minimum Purchase Quantity Or Minimum Purchase Amount Is Required");
							 $("#"+idAttr+"minquantity").focus();
							 return;
						 }
						 if(dealQty < 0 || dealQty == 0){
							 $("#Error").html("Deal Quantity should be > 0");
							 $("#"+idAttr+"dealquantity").focus();
							 return;
						 }
					 }
					 if( $("#"+idAttr+"rangeMode").val() == "promotion"){
						 if(minPurQty != 0 && minAmt != 0){
							 $("#Error").html("Minimum Purchase Quantity and Minimum Purchase Amount Should be 0");
							 $("#"+idAttr+"minquantity").focus();
							 return;
						 }
						 if(dealQty < 0 || dealQty == 0){
							 $("#Error").html("Deal Quantity should be > 0");
							 $("#"+idAttr+"dealquantity").focus();
							 return;
						 }
					 }
					 if( $("#"+idAttr+"rangeMode").val() == "condition"){
						 if(minPurQty > 0 && minAmt > 0){
							 $("#Error").html("Enter Either Minimum Purchase Quantity Or Minimum Purchase Amount");
							 $("#"+idAttr+"minquantity").focus();
							 return;
						 }
						 if(minPurQty == 0 && minAmt == 0){
							 $("#Error").html("Either Minimum Purchase Quantity Or Minimum Purchase Amount Is Required");
							 $("#"+idAttr+"minquantity").focus();
							 return;
						 }
						 if(dealQty != 0){
							 $("#Error").html("Deal Quantity should be equal to 0");
							 $("#"+idAttr+"dealquantity").focus();
							 return;
						 }
					 }
				 }else if($("#lowestPriceItem").prop("checked")){
					 if( $("#"+idAttr+"rangeMode").val() == "both"){
						 if(minPurQty > 0 && minAmt > 0){
							 $("#Error").html("Enter Either Minimum Purchase Quantity Or Minimum Purchase Amount");
							 $("#"+idAttr+"minquantity").focus();
							 return;
						 }
						 if(minPurQty == 0 && minAmt == 0){
							 $("#Error").html("Either Minimum Purchase Quantity Or Minimum Purchase Amount Is Required");
							 $("#"+idAttr+"minquantity").focus();
							 return;
						 }
						 if(dealQty < 0 || dealQty == 0){
							 $("#Error").html("Deal Quantity should be > 0");
							 $("#"+idAttr+"dealquantity").focus();
							 return;
						 }
					 }
					 if( $("#"+idAttr+"rangeMode").val() == "promotion"){
						 if(minPurQty != 0 && minAmt != 0){
							 $("#Error").html("Minimum Purchase Quantity and Minimum Purchase Amount Should be 0");
							 $("#"+idAttr+"minquantity").focus();
							 return;
						 }
						 if(dealQty < 0 || dealQty == 0){
							 $("#Error").html("Deal Quantity should be > 0");
							 $("#"+idAttr+"dealquantity").focus();
							 return;
						 }
					 }
					 if( $("#"+idAttr+"rangeMode").val() == "condition"){
						 if(minPurQty > 0 && minAmt > 0){
							 $("#Error").html("Enter Either Minimum Purchase Quantity Or Minimum Purchase Amount");
							 $("#"+idAttr+"minquantity").focus();
							 return;
						 }
						 if(minPurQty == 0 && minAmt == 0){
							 $("#Error").html("Either Minimum Purchase Quantity Or Minimum Purchase Amount Is Required");
							 $("#"+idAttr+"minquantity").focus();
							 return;
						 }
						 if(dealQty != 0){
							 $("#Error").html("Deal Quantity should be equal to 0");
							 $("#"+idAttr+"dealquantity").focus();
							 return;
						 }
					 }
				 }else{
					 if(minPurQty > 0 && minAmt > 0){
						 $("#Error").html("Enter Either Minimum Purchase Quantity Or Minimum Purchase Amount");
						 $("#"+idAttr+"minquantity").focus();
						 return;
					 }
					 if(minPurQty == 0 && minAmt == 0){
						 $("#Error").html("Either Minimum Purchase Quantity Or Minimum Purchase Amount Is Required");
						 $("#"+idAttr+"minquantity").focus();
						 return;
					 }
					 if(dealQty <= 0){
						 $("#Error").html("Deal Quantity Should be > 0");
						 $("#"+idAttr+"dealquantity").focus();
						 return;
					 }
				 }
				 if($("#"+idAttr+"groupId").val() == "")
					 $("#selected"+idAttr+"groupId").val("");
				 if($("#"+idAttr+"itemId").val() == ""){
					 $("#selected"+idAttr+"itemId").val("");
					 $("#pluCode"+idAttr+"itemId").val("");
				 }
//				 if($("#lowestPriceItem").prop("checked") || $("#isCombo").prop("checked") || $("#offercategory").val() != "item_specific"){
					 if($("#"+idAttr+"rangeMode").val() == "both" || $("#"+idAttr+"rangeMode").val() == "promotion")
						 bothOrPromotionFlag = true;
//				 }
				 if($("#isCombo").prop("checked") || $("#lowestPriceItem").prop("checked")){
					 if($("#"+idAttr+"rangeMode").val() == "both"){
						 if(minPurQty <= 0){
							 $("#Error").html("Minimum Purchase Quantity Should be > 0");
							 $("#"+idAttr+"minquantity").focus();
							 return;
						 }
						 if(dealQty <= 0){
							 $("#Error").html("Deal Quantity Should be > 0");
							 $("#"+idAttr+"dealquantity").focus();
							 return;
						 }
					 }else if($("#"+idAttr+"rangeMode").val() == "condition"){
						 if(minPurQty <= 0){
							 $("#Error").html("Minimum Purchase Quantity Should be > 0");
							 $("#"+idAttr+"minquantity").focus();
							 return;
						 }
					 }else if($("#"+idAttr+"rangeMode").val() == "promotion"){
						 if(dealQty <= 0){
							 $("#Error").html("Deal Quantity Should be > 0");
							 $("#"+idAttr+"dealquantity").focus();
							 return;
						 }
					 }
				 }else{
					 if(minPurQty > 0 && minAmt > 0){
						 $("#Error").html("Enter Either Minimum Purchase Quantity Or Minimum Purchase Amount");
						 $("#"+idAttr+"minquantity").focus();
						 return;
					 }
					 if(minPurQty == 0 && minAmt == 0){
						 $("#Error").html("Either Minimum Purchase Quantity Or Minimum Purchase Amount Is Required");
						 $("#"+idAttr+"minquantity").focus();
						 return;
					 }
					 if(dealQty <= 0){
						 $("#Error").html("Deal Quantity Should be > 0");
						$("#"+idAttr+"dealquantity").focus();
						return;
					 }
				 }
				 if($("#"+idAttr+"groupId").val() == "")
					 $("#selected"+idAttr+"groupId").val("");
				 if($("#"+idAttr+"itemId").val() == ""){
					 $("#selected"+idAttr+"itemId").val("");
					 $("#pluCode"+idAttr+"itemId").val("");
				 }
				 rangeitems = {
							"range" : "",
							"minimumPurchaseQuantity" : $("#"+idAttr+"minquantity").val(),
							"minimumPurchaseamount" : $("#"+idAttr+"minamount").val(),
							"dealQuantity" : $("#"+idAttr+"dealquantity").val(),
							"rangeMode" : $("#"+idAttr+"rangeMode").val(),
							"description" : $("#"+idAttr+"description").val(),
							"groupId" : $("#selected"+idAttr+"groupId").val(),
							"itemId" : $("#selected"+idAttr+"itemId").val(),
   				 		    "pluCode" :  $("#pluCode"+idAttr+"itemId").val()
						 };
				 totalranges.range.push(rangeitems);
			 }
			 if(len<=0){
				$("#Error").html("please define one range ");
				 focusDiv('Error');
				return;
			}
			 if(!bothOrPromotionFlag){
					$("#Error").html("Atleast one slab should have Range Mode as 'Both' or 'Promotion'");
					 focusDiv('Error');
					return;
				}
			 
				}*/
			
			finalObj.dealRanges = JSON.stringify(totalranges);
			var formData = JSON.stringify(finalObj);
			console.log(formData);
//			return;
			var contextPath = $("#contextPath").val();
			URL = contextPath + "/dealsAndOffers/createDeal.do";
			 $.ajax({
	    			type: "POST",
	    			url : URL,
	    			contentType : "application/json",
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
	
	function searchProductsBasedOnCategory(name,searchCategory){
		 var contextPath = $("#contextPath").val();
		 var productCategory = $("#productCategory").val();
		 URL = contextPath + "/inventorymanager/searchProductsOnCategoryBasis.do";
//		 URL = contextPath + "/inventorymanager/searchProductNames.do";
		 $.ajax({
				type: "GET",
				url : URL,
				data : {
					searchName : name,
					categoryName : productCategory,
					subCategory : ""
				},
				beforeSend: function(xhr){                    
		   	   		$("#loading").css("display","block");
		   	   		$("#mainDiv").addClass("disabled");
		   	   	},
				success : function(result) {
					appendProductsBasedOnCategory(result,searchCategory);
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
	
	
	function appendProductsBasedOnCategory(productsList, searchCategory){
		 $("."+searchCategory).html('');
		 var op = '';
		 for(var i=0;i<productsList.length;i++){
			 if (i == 0) 
				 op += '<li id="'+productsList[i].productId+'"  class="selected" onclick=getId(this,"'+searchCategory+'"); ><a>'+productsList[i].productName+'</a></li>';
			 else
			     op += '<li id="'+productsList[i].productId+'" onclick=getId(this,"'+searchCategory+'"); ><a>'+productsList[i].productName+'</a></li>';
		 }
		 $("."+searchCategory).html(op);
		 $("."+searchCategory).show();
	}
	
	/*function loadImageFileAsURL()
	{
	    var filesSelected = document.getElementById("dealBanner").files;
	    if (filesSelected.length > 0)
	    {
	        var fileToLoad = filesSelected[0];

	        var fsize = $('#dealBanner')[0].files[0].type;
        	alert(fsize);
        	
	        if (fileToLoad.type.match("image.*"))
	        {
	            var fileReader = new FileReader();
	            
	            fileReader.onload = function(fileLoadedEvent) 
	            {
	            	 file size validation 
	            	  var fsize = $('#dealBanner')[0].files[0].type;
	            	alert(fsize);
	            	
	            	var byteVal = fileLoadedEvent.target.result;
	            	var index = byteVal.indexOf(',');
	            	byteVal = byteVal.substring(index+1);
	             	$("#bannerByte").val(byteVal);
	             	$("#viewbannerImage").attr("src",fileLoadedEvent.target.result);
	              
	            };
	            fileReader.readAsDataURL(fileToLoad);
	            
	        }else{
	        	$("#dealBannerErr").html("Please Select Image");
	        	return;
	        }
	        
	        var oMyForm = new FormData();
	    	oMyForm.append("file",  filesSelected[0]);
	    	if($("#dealBannerRefId").val() != "")
	    		oMyForm.append("refId",  $("#dealBannerRefId").val().trim());
	    	else
	    		oMyForm.append("refId", "");
	    	var contextPath = $("#contextPath").val();
	    	var URL = contextPath + "/inventorymanager/addToAttachementList.do";
	    	$.ajax({
//	    				dataType : 'json',
	    				url : URL,
	    				data : oMyForm,
	    				type : "POST",
	    				enctype : 'multipart/form-data',
	    				processData : false,
	    				contentType : false,
	    				beforeSend : function(xhr) {
	    				},
	    				success : function(result) {
	    					$("#dealBannerRefId").val(result);
	    				},
	    				error : function() {
	    					alert("something went wrong");
	    				}
	    			});
	        
	    }
	}*/
	
	 function deletePic(id){
			var k = confirm("Are you sure you want to Delete");     
			if(k == true){
				var fileControl = '<input type="file" id="dealBanner" name="dealBanner" onchange="loadImageFileAsURL('+"'"+'dealBanner'+"'"+',this);" />';
				var $fileInput=$("#"+id);
				var $fileCopy = $(fileControl);
				$fileInput.replaceWith($fileCopy);
				$("#dealBannerLabel").after("<br>");
				$("#"+id+"_thumbnail").remove();
				$("#"+id+"_delImage").remove();
				$("#"+id+"_label").css("display","block");
				//$("#picture"+id+"_byte").val('');
			}
		}
	
	function loadImageFileAsURL(id,ele) {
		$("#dealBannerErr").html("");
		if (ele.files && ele.files[0]) {
			var fileToLoad = ele.files[0];
//	        var fsize = $('#dealBanner')[0].files[0].size;
	        if (fileToLoad.type.match("image.*")){
//	        	if(fsize <= 100000){
	        	var name = fileToLoad['name'];
				$("#"+id+"_name").val(name);
	        		var reader = new FileReader();
	        		reader.onload = function (e) {
	        			$("#"+id+"_label").css("display","none");
	        			$("#" + id + "_image").append('<img class="thumbnail" id="'+id+'_thumbnail" src=' + e.target.result + ' style="width:80px;height:80px;"><img class="delImage" id="'+id+'_delImage" src="'+contextPath+'/images/deny.png" onclick=deletePic("'+id+'"); >');
	        			$("#dealBannerLabel").siblings("br").remove();
	        			$("#dealBannerLabel").after("<br>");
	        		};
	        		reader.readAsDataURL(ele.files[0]);
	        	/*}else{
	        		$("#dealBannerErr").html("Please Select Image < 100kb");
		        	return;
	        	}*/
	        }else{
	        	$("#dealBannerErr").html("Please Select Image");
	        	return;
	        }
	        var oMyForm = new FormData();
	        oMyForm.append("file",  ele.files[0]);
	        if($("#dealBannerRefId").val() != "")
	        	oMyForm.append("refId",  $("#dealBannerRefId").val().trim());
	        else
	        	oMyForm.append("refId", "");
	        var contextPath = $("#contextPath").val();
	        var URL = contextPath + "/inventorymanager/addToAttachementList.do";
	        $.ajax({
//					dataType : 'json',
	        	url : URL,
	        	data : oMyForm,
	        	type : "POST",
	        	enctype : 'multipart/form-data',
	        	processData : false,
	        	contentType : false,
	        	beforeSend : function(xhr) {
	        	},
	        	success : function(result) {
	        		$("#dealBannerRefId").val(result);
	        	},
	        	error : function() {
	        		alert("something went wrong");
	        	}
	        });
	    }
	};
	
	function viewDealDetails(dealId){
		var contextPath = $('#contextPath').val();
		
		 //added by manasa
		var formData={}
		 formData.storeLocation = $("#outletLocation").val();
		formData.dealStartDate = $("#from").val();
		 formData.dealEndDate = $("#to").val();
		 var formData = JSON.stringify(formData);
		
		   var URL = contextPath + "/dealsAndOffers/dealdetails.do";
	    $.ajax({
 		url : URL,
 		data : {
 			dealId : dealId,
 			formData : formData
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
	
	
	
	 function editDeal(dealId){
		 var contextPath = $('#contextPath').val();
		 
		 var formData={}
		 formData.storeLocation = $("#outletLocation").val();
		formData.dealStartDate = $("#from").val();
		 formData.dealEndDate = $("#to").val();
		 var formData = JSON.stringify(formData);
		 
		   var URL = contextPath + "/dealsAndOffers/editdeal.do";
	    $.ajax({
		url : URL,
		data : {
			dealId : dealId,
			formData : formData
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
	 
	 
	
	 var  editsaleProductIds=[],editsaleSkuIds=[],editdealProductIds=[],editdealSkuIds=[];
	 function prepareEditFormData(){
		 if($("#editSellProducts").val() != null && $("#editSellProducts").val() != "" && $("#editSellProducts").val() != "null"){
			if($("#editSellProducts").val().indexOf(",")>-1){
				var arr = $("#editSellProducts").val().split(",");
				for(var i=0;i<arr.length;i++){
					editsaleProductIds.push(arr[i]);
				}
			}
			else {
				editsaleProductIds.push($("#editSellProducts").val());
			}
		 }
		 if($("#editSellSkus").val() != null && $("#editSellSkus").val() != "" && $("#editSellSkus").val() != "null"){
			 if($("#editSellSkus").val().indexOf(",")>-1){
					var arr = $("#editSellSkus").val().split(",");
					for(var i=0;i<arr.length;i++){
						editsaleSkuIds.push(arr[i]);
					}
				}
				else {
					editsaleSkuIds.push($("#editSellSkus").val());
				}
		 }
		 
		 if($("#editDealProducts").val() != null && $("#editDealProducts").val() != "" && $("#editDealProducts").val() != "null"){
			 if($("#editDealProducts").val().indexOf(",")>-1){
					var arr = $("#editDealProducts").val().split(",");
					for(var i=0;i<arr.length;i++){
						editdealProductIds.push(arr[i]);
					}
				}
				else {
					editdealProductIds.push($("#editDealProducts").val());
				}
		 }
		 if($("#editDealSkus").val() != null && $("#editDealSkus").val() != "" && $("#editDealSkus").val() != "null"){
			 if($("#editDealSkus").val().indexOf(",")>-1){
					var arr = $("#editDealSkus").val().split(",");
					for(var i=0;i<arr.length;i++){
						editdealSkuIds.push(arr[i]);
					}
				}
				else {
					editdealSkuIds.push($("#editDealSkus").val());
				}
		 }
		 
		// edittotalranges.editrange = editrange;
		 
		// var len = $("#editRangesTable tr").length - 1;
		
		/* for(var i=1;i<=len;i++){
			editrangeitems = {
						"range" : $("#"+i+"rangeId").text(),
						"minimumPurchaseQuantity" : $("#"+i+"minpurchaseqty").val(),
						"minimumPurchaseamount" : $("#"+i+"minpurchaseamt").val(),
						"dealQuantity" : $("#"+i+"dealqty").val()
					 };
			 edittotalranges.editrange.push(editrangeitems);
			 
		 }*/
		// alert(JSON.stringify(edittotalranges));
		 }
	 /* var editcount1=$("#editRangesTable tr").length - 1;
	 function addeditSlab(){
		 var contextPath = $("#contextPath").val();
		 editcount1 = editcount1+1;
		var value = "editrange"+editcount1;
		 $("#editRangesTable")
			.append(
					'<tr  id='
							+ value
							+ '><th style="width: 10%;display:none;" id="'+"'"+editcount1+"range'"+'"><span>'
							+ value
							+ '</span></th>'
							+'<th style="width: 15%"><input class="form-control"'+
							'oninput="this.value = this.value.replace(/[^0-9]/g, \'\'); this.value = this.value.replace(/(\..*)\/g, \'$1\');"'  +
							' type="text" name="category_name" id ='+"'"+editcount1+"minpurchaseqty'"+' onkeyUp ="editaddminquantity('+"'"+value+"minquantity'"+','+"'"+value+"'"+')"/></th>'
							+'<th style="width: 15%"><input class="form-control"'+
							'oninput="this.value = this.value.replace(/[^0-9]/g, \'\'); this.value = this.value.replace(/(\..*)\/g, \'$1\');"'  +
							' type="text" name="category_name" id ='+"'"+editcount1+"minpurchaseamt'"+' onkeyUp ="editaddminamount('+"'"+value+"minamount'"+','+"'"+value+"'"+')"/></th>'
							+'<th style="width: 15%"><input class="form-control"'+
							'oninput="this.value = this.value.replace(/[^0-9]/g, \'\'); this.value = this.value.replace(/(\..*)\/g, \'$1\');"'  +
							' type="text" name="category_name" id ='+"'"+editcount1+"dealqty'"+' onkeyUp ="editadddealquantity('+"'"+value+"dealquantity'"+','+"'"+value+"'"+')"/></th>'
							+'<th style="width: 15%"><input class="form-control" type="text" name="category_name" id ='+"'"+editcount1+"description'"+' onkeyUp ="addrangeDesc('+"'"+value+"description'"+','+"'"+value+"'"+')"/></th>'
							+'<th style="width: 15%"></th>'
							+'<th style="width: 5%"><img src='+contextPath+'/images/addslab.png style="  width: 33px;cursor: pointer;" onclick="addeditSlab()" > <img src='+contextPath+'/images/itemdelete1.png style="  width: 24px;cursor: pointer;" onclick="removeeditSlab('
							+ "'editrange" + editcount1 + "'" + ')"></th></tr>');
		 
		
		 }*/
	 
	 var editcount1=$("#editRangesTable tr").length - 2;
	 function addeditSlab(){
		 editcount1 = editcount1+1;
		var currentDealSlabDivContent = editDealSlabDivContent;
		currentDealSlabDivContent = currentDealSlabDivContent.replace('style="display: none;"','');
		currentDealSlabDivContent = currentDealSlabDivContent.replace('editrange0','editrange'+editcount1);
		currentDealSlabDivContent = currentDealSlabDivContent.replace('0rangeId',editcount1+'rangeId');
		currentDealSlabDivContent = currentDealSlabDivContent.replace('0minpurchaseqty',editcount1+'minpurchaseqty');
		currentDealSlabDivContent = currentDealSlabDivContent.replace('0minpurchaseamt',editcount1+'minpurchaseamt');
		currentDealSlabDivContent = currentDealSlabDivContent.replace('0dealqty',editcount1+'dealqty');
		currentDealSlabDivContent = currentDealSlabDivContent.replace('0rangeMode',editcount1+'rangeMode');
		currentDealSlabDivContent = currentDealSlabDivContent.replace('0description',editcount1+'description');
		currentDealSlabDivContent = currentDealSlabDivContent.replace('editrange0','editrange'+editcount1);
		currentDealSlabDivContent = currentDealSlabDivContent.replace('selected0groupId','selected'+editcount1+'groupId');
		currentDealSlabDivContent = currentDealSlabDivContent.replace('0groupId',editcount1+'groupId');
		currentDealSlabDivContent = currentDealSlabDivContent.replace('0groupId',editcount1+'groupId');
		currentDealSlabDivContent = currentDealSlabDivContent.replace('0itemId',editcount1+'itemId');
		currentDealSlabDivContent = currentDealSlabDivContent.replace('0itemId',editcount1+'itemId');
		currentDealSlabDivContent = currentDealSlabDivContent.replace('selected0itemId','selected'+editcount1+'itemId');
		currentDealSlabDivContent = currentDealSlabDivContent.replace('pluCode0itemId','pluCode'+editcount1+'itemId');
	
		 $("#editRangesTable tbody")
			.append(currentDealSlabDivContent);
		
		}
	 
		 
		 function removeeditSlab(slabid){
			 var len = $("#editRangesTable tr").length - 2;
			 if(len<=1){
				alert("Atleast One Range is Required");
				return;
			 }
			 $("#"+slabid).remove();
			
			 }
		 function updateDeal(){
			 debugger;
			 var edittotalranges = {},editrange = [], editrangeitems = {};
			 edittotalranges.editrange = editrange;
			 $("#Error").html("");
				
				if($("#editdealName").val() == null || $("#editdealName").val() ==""){
					$("#dealNameErr").html("Enter Deal Name");
					$("#editdealName").focus();
					return;
				}
				
				var str = $("#editdealName").val();
				if(/^[a-zA-Z0-9#_ ]*$/.test(str) == false) {
				   // alert('Your search string contains illegal characters.');
				    $("#dealNameErr").html("Special charecters not allowed");
					$("#editdealName").focus();
					return;
				}
				
				var location = $("#editdealLocation").val();
				if(location == null || location ==""){
					$("#Error").html("select one location");
					$("#editdealLocation").focus();
					return;
				}
				if(location.indexOf(",")){
					location = $("#editdealLocation").val().toString();
				}
				 var dateTime = getCurrentDate();
				  var date = dateTime.split(' ');
				  date = date[0].split('/');
				  var formatedDate = date[2]+"/"+date[0]+"/"+date[1];
				 /*var noOfDays = daydiff(parseDate(formatedDate),parseDate($('#dealEndDate').val()));
				 if(noOfDays < 0){
					 $("#Error").html("End Date should be Future Date");
					 focusDiv('Error');
					 return;
				 }*/
				 var noOfDays = daydiff(parseDate($('#dealStartDate').val()), parseDate($('#dealEndDate').val()));
				 if(noOfDays < 0){
					 $("#Error").html("End Date can't be less than Start Date");
					 focusDiv('Error');
					 return;
				 }
			 	var imageAdded = false;
				var finalObj = {};
				finalObj.dealID = $("#dealId").val();
				finalObj.dealName = $("#editdealName").val();
				finalObj.dealDescription = $("#dealDesc").val();
				finalObj.dealCategory = $("#editdealcategory").val();
				finalObj.storeLocation = location;
				finalObj.priority = $("#editdealPriority").val();
				finalObj.dealStatus = $('input[name=dealStatus]:checked').val();
				finalObj.claimCoupons = $('input[name=coupons]:checked').val();
				finalObj.claimLoyaltypoints = $('input[name=loyaltyPoints]:checked').val();
				finalObj.claimgiftvouchers = $('input[name=giftvouchers]:checked').val();
				finalObj.dealStartDate = $("#dealStartDate").val();
				finalObj.dealEndDate = $("#dealEndDate").val();
				/*finalObj.createdOnStr = $("#createdDate").val();*/
				
				var fromDate = $("#from").val();
				var toDate = $("#to").val();
				var fromLocation = $("#outletLocation").val();
				
				var locDetails=[];
				if($("#editdealLocation").val() != null){
					var locations = $("#editdealLocation").val().toString().split(',');
					for(var i=0; i<locations.length; i++){
					//	lc = locations[i];
					obj = {"storeLocation":locations[i]};
						locDetails.push(obj);
					}
				}
				
				finalObj.dealLocationsList = locDetails;
				
				if($("#dealBannerRefId").val().trim() != "" && $("#dealBannerRefId").val() != null){
					finalObj.imageRefId = $("#dealBannerRefId").val();
					finalObj.deal_image = $("#dealBanner_name").val();
					imageAdded = true;
				}
				if($("#dealBanner_thumbnail").length > 0)
					finalObj.imageFlag = "true";
				else
					finalObj.imageFlag = "false";
				/*if($("#dealBannerRefId").val().trim() != "" && $("#dealBannerRefId").val() != null){
					imageAdded = true;
					finalObj.imageRefId = $("#dealBannerRefId").val();
				}
				if($("#dealBanner_thumbnail").length > 0 && imageAdded == false)
					finalObj.imageDeleted = false;
				else
					finalObj.imageDeleted = true;*/
				if(getFormData() == false)
					return;
				finalObj.customerFilter = getFormData();
				finalObj.dealImageText = $("#dealImageText").val();
				finalObj.dealImageTextFont = $("#dealImageTextFontHidden").val();
				finalObj.dealImageSize = $("#dealImageTextSize").val();
				finalObj.dealImageColor = $("#dealImageTextColor").val();
				if($("#dealImageBold").prop('checked') == true)
					finalObj.dealImageBold = 1;
				else
					finalObj.dealImageBold = 0;
				if($("#dealImageItalic").prop('checked') == true)
					finalObj.dealImageItalic = 1;
				else	
					finalObj.dealImageItalic = 0;
				if($("#dealImageStrike").prop('checked') == true)
					finalObj.dealImageStrike = 1;
				else
					finalObj.dealImageStrike = 1;
				finalObj.salePriceText = $("#saleText").val();
				finalObj.salePriceFont = $("#saleTextFontHidden").val();
				finalObj.salePriceSize = $("#saleTextSize").val();
				finalObj.salePriceColor = $("#saleTextColor").val();
				if($("#saleTextBold").prop('checked') == true)
					finalObj.salePriceBold = 1;
				else
					finalObj.salePriceBold = 0;
				if($("#saleTextItalic").prop('checked') == true)
					finalObj.salePriceItalic = 1;
				else
					finalObj.salePriceItalic = 0;
				if($("#saleTextStrike").prop('checked') == true)
					finalObj.salePriceStrike = 1;
				else
					finalObj.salePriceStrike = 0;
				
				finalObj.dealPriceText = $("#dealText").val();
				finalObj.dealPriceFont = $("#dealTextFontHidden").val();
				finalObj.dealPriceSize = $("#dealTextSize").val();
				finalObj.dealPriceColor = $("#dealTextColor").val();
				if($("#dealTextBold").prop('checked') == true)
					finalObj.dealPriceBold = 1;
				else
					finalObj.dealPriceBold = 0;
				if($("#dealTextItalic").prop('checked') == true)
					finalObj.dealPriceItalic = 1;
				else
					finalObj.dealPriceItalic = 0;
				if($("#dealTextStrike").prop('checked') == true)
					finalObj.dealPriceStrike = 1;
				else
					finalObj.dealPriceStrike = 0;
				if($("#startTime").val() == ""){
					$("#startTimeError").html("Enter Start Time");
					return;
				}
				finalObj.dealStartTimeStr = $("#startTime").val();
				if($("#endTime").val() == ""){
					$("#endTimeError").html("Enter End Time");
					return;
				}
				finalObj.dealEndTimeStr = $("#endTime").val();
				finalObj.day1 = $("#day1").prop("checked");
				finalObj.day2 = $("#day2").prop("checked");
				finalObj.day3 = $("#day3").prop("checked");
				finalObj.day4 = $("#day4").prop("checked");
				finalObj.day5 = $("#day5").prop("checked");
				finalObj.day6 = $("#day6").prop("checked");
				finalObj.day7 = $("#day7").prop("checked");
				finalObj.allowMultipleDiscounts = $("#allownMulDisc").prop("checked");
				finalObj.repeat = $("#isRepeat").prop("checked");
				finalObj.bannerImg = $("#banner").prop("checked");
				finalObj.combo = $("#isCombo").prop("checked");
				finalObj.lowestPriceItem = $("#lowestPriceItem").prop("checked");
				//koti bommineni
				finalObj.allowExchanges = $("#applyExchanges").prop("checked");
				finalObj.allowReturns = $("#applyReturns").prop("checked");
				finalObj.salePriceBased = $("#applysaleprice").prop("checked");
				if($("#basedOnProduct").prop("checked") == true){
					/*if($("#editdealcategory").val() == "item_specific"){
						if(editsaleProductIds.length == 0 && editsaleSkuIds.length == 0 && $("#saleCategory").val() == "-- Select --"){
							$("#Error").html("Please Select Atleast Sale Product Category Or Sale Product Or Sale Sku");
							 focusDiv('Error');
							return;
						}
					}
					if(editdealProductIds.length ==0 && editdealSkuIds.length == 0 && $("#dealCategory").val() == "-- Select --"){
						$("#Error").html("Please Select Atleast Deal Product Category Or Deal Product Or Deal Sku");
						 focusDiv('Error');
						return;
					}*/
					if($("#editdealcategory").val() == "item_specific"){
						if($("#saleCategory").val() != "-- Select --")
							{
							finalObj.saleProductCategory = $("#saleCategory").val();
							finalObj.dealProductCategory = $("#saleCategory").val();
							}
							
						if($("#sale_sub_category").val() != "-- Select --")
							{
							finalObj.saleProductSubCategory = $("#sale_sub_category").val();
							finalObj.dealProductSubCategory = $("#sale_sub_category").val();
							}
						
						if($("#sale_department").val() != "-- Select --")
							{
							finalObj.productDepartment = $("#sale_department").val();
							}
						if($("#sale_section").val() != "-- Select --")
							{
							finalObj.section = $("#sale_section").val();
							}
					
						if($("#sale_brand").val() != "-- Select --")
							{
							finalObj.brand = $("#sale_brand").val();
							}
					}
					
					if($("#editdealcategory").val() == "item_specific"){
						finalObj.sellProducts ="";// editsaleProductIds.toString();
						finalObj.sellSkuids = "";//editsaleProductIds.toString();
					}
					var dealProductItem=$("#dealProductItem").val();
					if(dealProductItem==undefined || dealProductItem=="" ||dealProductItem==null)
						{
						dealProductItem="";
						}
					finalObj.dealProducts = dealProductItem;//dealProductIds.toString();
					finalObj.dealSkus = "";//editdealProductIds.toString();
					
					/*finalObj.sellProducts = saleProductIds.toString();
					finalObj.sellSkuids = saleSkuIds.toString();
					finalObj.dealProducts = dealProductIds.toString();
					finalObj.dealSkus = dealSkuIds.toString();*/
					var dealPluCode = [];
					$('.dealPluCode').each(function(){
						dealPluCode.push($(this).val());
					});
					finalObj.dealPluCode = dealPluCode.toString();
					if($("#editdealcategory").val() == "item_specific"){
						var salePluCode = [];
						var dealProductList=[];
						$('.buyPluCode').each(function(){
							salePluCode.push($(this).val());
						});
						
						if(salePluCode.length>0)
						{
							finalObj.repeat = $("#isRepeatItem").prop("checked");
							finalObj.lowestPriceItem = $("#lowestPriceItemItem").prop("checked");
							for(var i=0;i<=salePluCode.length-1;i++)
								{
								
								var dealqty=$("#dealPluCodeQty"+dealPluCode[i]).val();
								var saleqty=$("#buyPluCodeQty"+salePluCode[i]).val();
								var turnover=$("#buyPluCodeTurnOver"+salePluCode[i]).val();
								if(dealqty=="")
									{
									  dealqty=0;
									}
								if(saleqty=="")
									{
									  saleqty=0;
									}
								if(turnover=="")
									{
									  turnover=0;
									}
								if(parseInt(dealqty)<=0)
									{
										if($("#dealSkuCode"+dealPluCode[i]).val()!=undefined && $("#dealSkuCode"+dealPluCode[i]).val()!=null && $("#dealSkuCode"+dealPluCode[i]).val()!="")
											{
											$("#Error").html("Deal quantity should be greater than zero");
											 focusDiv('Error');
											return;
											}
									}
								var rewardTyp=$("#itemSpecificTypeBox").val();
								finalObj.rewardType = rewardTyp;
								if(rewardTyp=="Quantity Based")
									{
										if(parseInt(saleqty)<=0)
											{
												$("#Error").html("Sale quantity should be greater than zero");
												 focusDiv('Error');
												return;
											}
										turnover=0;
									}
								else
									{
										if(parseInt(turnover)<=0)
										{
											$("#Error").html("Turnover amount should be greater than zero");
											 focusDiv('Error');
											return;
										}
										saleqty=0;
									}
								
								/*if(parseInt(saleqty)<=0 && parseInt(turnover)<=0)
									{
										$("#Error").html("Sale quantity or Turnover amount should be greater than zero");
										 focusDiv('Error');
										return;
									}*/
								
								dealProductList.push({"saleSkuId":$("#buySkuCode"+salePluCode[i]).val(),
									 
									"salePluCode":$("#buyPluCode"+salePluCode[i]).val(),
									"dealSkuId":$("#dealSkuCode"+dealPluCode[i]).val(),
									"dealPluCode":$("#dealPluCode"+dealPluCode[i]).val(),
									"saleProductDescription":$("#buyDiscription"+salePluCode[i]).val(),
									"dealProductDescription":$("#dealDiscription"+dealPluCode[i]).val(),
									"dealQuantity":parseInt(dealqty),
									"saleQuantity":parseInt(saleqty), 
									"dealTurnOver":parseFloat(turnover),
									"minPurchaseAmount":parseFloat(turnover),
									"rewardType":"",
									"saleCategory":"",
									"saleSubCategory":"", 
									"saleBrand":"",
									"saleSection":"",
									"saleDepartment":"", 
									"saleModel":"",
									"dealCategory":"",
									"dealSubCategory":"", 
									"dealBrand":"",
									"dealSection":"",
									"dealDepartment":"", 
									"dealModel":"",
									"saleEan":"", 
									"dealEan":"", 
									"dealSize":"",
									"saleSize":""
									});
								
								}
						}
						finalObj.dealProductList=dealProductList;
						if($("#itemDisountBased").is(':checked')){	
							rangeitems = {
									"range" : "",
									"minimumPurchaseQuantity" : "1",
									"minimumPurchaseamount" : "0",
									"dealQuantity" : "0",
									"rangeMode" : "",
									"description" : "",
									"groupId" : "",
									"itemId" : "",
		   				 		    "pluCode" :  "",
		   				 		    "saleMinimumPurchaseQuantity" : "1",
		   				 		    "saleMinimumPurchaseamount" : "0",
		   				 		    "saleQuantity" : "0",
		   				 		    "saleRangeMode" : "",
		   				 		    "saleGroupId" : "",
		   				 		    "saleItemId" : "",
								 };
						edittotalranges.editrange.push(rangeitems);
						 
					}
						//finalObj.sellPluCode = salePluCode.toString();
					}
					
						//complex item based
					
					if($("#complexDisountBased").is(':checked')){		
						
						//finalObj.priceBasedConfigurationFlag = $("#offerRewardCriteria").val();
						//finalObj.applyForAllItems = $("#applyForAllItemsProduct").prop("checked");
						//finalObj.allowMultipleDiscounts = $("#allownMulDiscProduct").prop("checked");
						finalObj.repeat = $("#isRepeatProduct").prop("checked");
						finalObj.lowestPriceItem = $("#lowestPriceItemProduct").prop("checked");
						//var priceBasedProduct=finalObj.priceBasedConfigurationFlag;
						finalObj.rewardType = $("#offerRewardCriteria").val();
						
						//finalObj.rewardType = $("#offerRewardProduct").val();
						//var len1 = $("#slabLis tr").length - 1;
						
					   // var bothOrPromotionFlag = false;
						
						
						var category=$("#saleCategory").val();
						var department=$("#sale_department").val();
						var brand=$("#sale_brand").val();
						if(category=="" || category==undefined || category==null)
							{
								category="";
							}
						if(department=="" || department==undefined || department==null)
							{
								department="";
							}
						if(brand=="" || brand==undefined || brand==null)
							{
								brand="";
							}
						
						if(category=="" && department=="" && brand=="" && $("#editdealcategory").val()!="turn_over")
						{
							$("#Error").html("Please select category or department or brand");
							 focusDiv('Error');
							return;
						}

						var minDealQty=$("#minQtyProductDeal").val();
						var minSaleQty=$("#minQtyProductSale").val();
						var minsaleAmt=$("#minAmtProductSale").val()
						if(minDealQty=="" || minDealQty==undefined)
							{
							minDealQty="0";
							}
						if(minSaleQty=="" || minSaleQty==undefined)
							{
							minSaleQty="0";
							}
						if(minsaleAmt=="" || minsaleAmt==undefined)
							{
							minsaleAmt="0";
							}
						
						
							if(parseInt(minDealQty)<=0)
							{
								$("#Error").html("deal quantity should be grather than 0.");
								 focusDiv('Error');
								 return;
							}
					

						var rewardTyp=$("#offerRewardCriteria").val();
							
							if(rewardTyp=="Quantity Based")
							{
								if(parseInt(minSaleQty)<=0)
									{
										$("#Error").html("Minimum sale quantity should be greater than zero");
										 focusDiv('Error');
										return;
									}
								minsaleAmt="0";
							}
						else
							{
								if(parseInt(minSaleAmt)<=0)
								{
									$("#Error").html("Minimum sale amount should be greater than zero");
									 focusDiv('Error');
									return;
								}
								minSaleQty="0";
							}
						
						rangeitems = {
								"range" : "",
								"minimumPurchaseQuantity" : minDealQty,
								"minimumPurchaseamount" : minsaleAmt,
								"dealQuantity" : minDealQty,
								"rangeMode" : "",
								"description" : "",
								"groupId" : "",
								"itemId" : $("#dealProductItemSku").val(),
	   				 		    "pluCode" :  "",
	   				 		    "saleMinimumPurchaseQuantity" : minSaleQty,
	   				 		    "saleMinimumPurchaseamount" :minsaleAmt ,
	   				 		    "saleQuantity" : minSaleQty,
	   				 		    "saleRangeMode" : "",
	   				 		    "saleGroupId" : "",
	   				 		    "saleItemId" : "",

							 };
						edittotalranges.editrange.push(rangeitems);
					    
						}
					
					
				}else if($("#basedOnGroup").prop("checked") == true){
					if($("#editdealcategory").val() == "item_specific"){
						if($("#saleGroupId").length > 0 && $("#dealGroupId").length > 0){
							finalObj.sellGroupId = $("#saleGroupId").text();
							finalObj.dealGroupId = $("#dealGroupId").text();
							var len = $("#saleGroupSku tr").length-1;
							var saleGroupSku = [];
							var saleGroupPlu = [];
							var i=0;
							var idAttr = "", skuId = "", pluCode = "";
							for(i=1;i<=len;i++){
								idAttr = $("#saleGroupSku tr:eq("+i+") td:last").attr("id");
								idAttr = idAttr.replace('DelsaleGroupSku','');
								skuId = $("#skusaleGroupSku"+idAttr).text();
								pluCode = $("#pluCodesaleGroupSku"+idAttr).text();
								saleGroupSku.push(skuId);
								saleGroupPlu.push(pluCode);
							}
							if(saleGroupSku.length > 0)
								finalObj.sellSkuids = saleGroupSku.toString();
							if(saleGroupPlu.length > 0)
								finalObj.sellPluCode = saleGroupPlu.toString();
							len = $("#dealGroupSku tr").length-1;
							var dealGroupSku = [];
							var dealGroupPlu = [];
							for(i=1;i<=len;i++){
								idAttr = $("#dealGroupSku tr:eq("+i+") td:last").attr("id");
								idAttr = idAttr.replace('DeldealGroupSku','');
								skuId = $("#skudealGroupSku"+idAttr).text();
								pluCode = $("#pluCodedealGroupSku"+idAttr).text();
								dealGroupSku.push(skuId);
								dealGroupPlu.push(pluCode);
							}
							if(dealGroupSku.length > 0)
								finalObj.dealSkus = dealGroupSku.toString();
							if(dealGroupPlu.length > 0)
								finalObj.dealPluCode = dealGroupPlu.toString();
						}else{
							$("#Error").html("Please Select Sale Group Id and Deal Group Id");
							 focusDiv('Error');
							return;
						}
					}else{
						if($("#dealGroupId").length > 0){
							finalObj.dealGroupId = $("#dealGroupId").text();
							var len = $("#dealGroupSku tr").length-1;
							var dealGroupSku = [];
							var dealGroupPlu = [];
							var i=0;
							var idAttr = "", skuId = "", pluCode = "";
							for(i=1;i<=len;i++){
								idAttr = $("#dealGroupSku tr:eq("+i+") td:last").attr("id");
								idAttr = idAttr.replace('DeldealGroupSku','');
								skuId = $("#skudealGroupSku"+idAttr).text();
								pluCode = $("#pluCodedealGroupSku"+idAttr).text();
								dealGroupSku.push(skuId);
								dealGroupPlu.push(pluCode);
							}
							if(dealGroupSku.length > 0)
								finalObj.dealSkus = dealGroupSku.toString();
							if(dealGroupPlu.length > 0)
								finalObj.dealPluCode = dealGroupPlu.toString();
							
							
							if($("#itemDisountBasedGroup").is(':checked')){	
								rangeitems = {
										"range" : "",
										"minimumPurchaseQuantity" : "1",
										"minimumPurchaseamount" : "0",
										"dealQuantity" : "0",
										"rangeMode" : "",
										"description" : "",
										"groupId" : "",
										"itemId" : "",
			   				 		    "pluCode" :  "",
			   				 		    "saleMinimumPurchaseQuantity" : "1",
			   				 		    "saleMinimumPurchaseamount" : "0",
			   				 		    "saleQuantity" : "0",
			   				 		    "saleRangeMode" : "",
			   				 		    "saleGroupId" : "",
			   				 		    "saleItemId" : "",
									 };
							edittotalranges.editrange.push(rangeitems);
							 
						}
							
						}else{
							$("#Error").html("Please Select Deal Group Id");
							 focusDiv('Error');
							return;
						}
					}
					
					//complex group based
					
					if($("#complexbasedOnGroup").is(':checked')){
						finalObj.rewardType = $("#offerRewardCriteriaGroup").val();
						finalObj.sellGroupId = $("#saleGroupId").text();
						finalObj.dealGroupId = $("#dealGroupId").text();
						finalObj.repeat = $("#isRepeat").prop("checked");
						finalObj.lowestPriceItem = $("#lowestPriceItem").prop("checked");
						var minDealQty=$("#groupDealMinQty").val();
						var minSaleQty=$("#groupSaleMinQty").val();
						var maxSaleAmt=$("#groupSaleMaxAmt").val();
						var minSaleAmt=$("#groupSaleMinAmt").val();
						var group1=$("#1groupId").val();
						var group2=$("#2groupId").val();
						if(group1=="" || group1==undefined)
							{
								group1="";
							}
						if(group2=="" || group2==undefined)
							{
								group2="";
							}
						if(minDealQty=="" || minDealQty==undefined)
							{
							minDealQty="0";
							}
						if(minSaleQty=="" || minSaleQty==undefined)
							{
							minSaleQty="0";
							}
						if(maxSaleAmt=="" || maxSaleAmt==undefined)
							{
							maxSaleAmt="0";
							}
						if(minSaleAmt=="" || minSaleAmt==undefined)
							{
							minSaleAmt="0";
							}
						
					if(parseInt(minDealQty)<=0)
						{
						  $("#Error").html("Deal quantity should be grather than 0.");
						  focusDiv('Error');
						  return;
						}

					var rewardTyp=$("#offerRewardCriteriaGroup").val();
					finalObj.rewardType = rewardTyp;
					if(rewardTyp=="Quantity Based")
						{
							if(parseInt(minSaleQty)<=0)
								{
									$("#Error").html("Minimum Sale quantity should be greater than zero");
									 focusDiv('Error');
									return;
								}
							maxSaleAmt="0";
							minSaleAmt="0";

						}
					else
						{
							if(parseInt(minSaleAmt)<=0  && parseInt(maxSaleAmt)<=0)
							{
								$("#Error").html("Minimum sale amount amd maximum sale amount should be grather than 0.");
								 focusDiv('Error');
								return;
							}
							
							if(parseInt(minSaleAmt)>=0 && parseInt(maxSaleAmt)>0)
							{
							if(parseInt(minSaleAmt)>parseInt(maxSaleAmt))
								{
								$("#Error").html("Maximum sale amount should be grather than Minimum sale amount.");
								 focusDiv('Error');
								 return;
								}
							}
							minSaleQty="0";
						}
					
						rangeitems = {
								"range" : "",
								"minimumPurchaseQuantity" : minDealQty,
								"minimumPurchaseamount" : minSaleAmt,
								"maximumPurchaseAmount":maxSaleAmt,
								"dealQuantity" : minDealQty,
								"rangeMode" : "",
								"description" : "",
								"groupId" :group2,
								"itemId" : $("#dealProductItemGroup").val(),
	   				 		    "pluCode" :  "",
	   				 		    "saleMinimumPurchaseQuantity" : minSaleQty,
	   				 		    "saleMinimumPurchaseamount" : minSaleAmt,
	   				 		    "saleMaximumPurchaseAmount":maxSaleAmt,
	   				 		    "saleQuantity" : minSaleQty,
	   				 		    "saleRangeMode" : "",
	   				 		    "saleGroupId" : group1,
	   				 		    "saleItemId" : "",
							 };
					edittotalranges.editrange.push(rangeitems);   
					}
					
				}
				
				// var len = $("#editRangesTable tr").length - 1;
				 //var bothOrPromotionFlag = false; 
				 
				 finalObj.dealRanges = JSON.stringify(edittotalranges);
				 
				/*finalObj.authorisedBy = $("#autorisedBy").val();
				finalObj.closedBy = $("#closedBy").val();
				finalObj.closedOnStr = $("#closedOn").val();
				finalObj.closedReason = $("#closedReason").val();*/
				
				var formData = JSON.stringify(finalObj);
				console.log(formData);
				var contextPath = $("#contextPath").val();
				URL = contextPath + "/dealsAndOffers/updatedeal.do";
				 $.ajax({
		    			type: "POST",
		    			contentType : "application/json",
		    			url : URL,
		    			data : formData,
		    			beforeSend: function(xhr){                    
	       	   				$("#loading").css("display","block");
	       	   				$("#mainDiv").addClass("disabled");
	        	        },
		    			success : function(result) {
		    				$("#right-side").html(result);
		    				$("#from").val(fromDate);
		    				$("#to").val(toDate);
		    				$("#outletLocation").val(fromLocation);
		            		editrange = [];
		            		 $("#loading").css("display","none");
		        			   $("#mainDiv").removeClass('disabled');

		    			},
		    			error : function() {
		    				 alert("something went wrong");
		    				 editrange = [];
		    				 $("#loading").css("display","none");
		        			   $("#mainDiv").removeClass('disabled');

		    			}
		    		});
				
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
			 		"<td id='Del"+type+"' ><img id='Img"+ type +"' src='"+contextPath+"/images/itemdelete.png' style='width:20px;cursor:pointer;' onclick='deleteItem(this);' title='Delete "+id+"'/>" +
			 		"</td></tr>";
				 $("#"+type+"ProductsId tbody").html("");
				 $("#"+type+"ProductsId tbody").append(row);
			}
			
			function deleteItem(element){
				var id = $(element).attr("id").replace('Img','');
				$('#dynamicdiv'+id).remove();
			}
			function deleteSlab(id){
				debugger;
//				var id = $(element).attr("id").replace('Img','');
				var len = $("#slabsList tr").length - 1;
				 if(len<=1){
					alert("Atleast One Range is Required");
					return;
				 }
				$('#'+id).remove();
			}
			
			var dealSlabDivContent = null;
			function setDealSlabDivContent(){
				dealSlabDivContent = $('#range1').prop('outerHTML');
			}
			
			var editDealSlabDivContent = null;
			function setEditDealSlabDivContent(){
				editDealSlabDivContent = $('#editrange0').prop('outerHTML');
			}
			
			 function toggleBased(id){
				 debugger;
					if (id == "basedOnProduct") {
						if ($("#" + id).prop("checked") == true) {
							$("input.basedOnProduct").removeAttr("readonly");
							$("select.basedOnProduct").removeAttr("disabled");
							//$("input.basedOnGroup").attr("readonly", "readonly");
							$("#basedOnGroup").removeAttr("checked");
							$("#complexbasedOnGroup").removeAttr("checked");
							$("#itemDisountBasedGroup").removeAttr("checked");
							
							$("#itemDisountBased").prop("checked", true);
							$("#RangesHide1").css("display","none");
							$("#RangesHide2").css("display","none");
							
							//$("#itemDiscount").prop("checked", true);
							//$(".itemDiscount").prop("checked", true);
							$("input[type=radio]").attr("readonly", "readonly");
							
							//if($("#itemDisountBased").prop("checked"))
								
							// if($("#offercategory").length>0)
							// toggleItemSpecific('offercategory');
						} else {
							$("input.basedOnProduct").attr("readonly", "readonly");
							$("select.basedOnProduct").attr("disabled", "disabled");
							$("input.basedOnGroup").removeAttr("readonly");
							$("#basedOnGroup").prop("checked", true);
							$("#itemDisountBased").removeAttr("checked");
							$("#complexDisountBased").removeAttr("checked");
							//$("#complexDisountBased").removeAttr("checked");
							//$("input[type=radio]").removeAttr("checked");
							// if($("#offercategory").length>0)
							// toggleItemSpecific('offercategory');
						}
					} else {
						if ($("#" + id).prop("checked") == true) {
							$("input.basedOnGroup").removeAttr("readonly");
							$("select.basedOnProduct").attr("disabled", "disabled");
							$("input.basedOnProduct").removeAttr("readonly");
							//$("input.basedOnProduct").attr("readonly", "readonly");
							$("#basedOnProduct").removeAttr("checked");
							$("#itemDisountBased").removeAttr("checked");
							$("#complexDisountBased").removeAttr("checked");
							$("#complexbasedOnGroup").prop("checked", true);
							$(".complexbasedOnGroupProduct").prop("checked", true);
							// if($("#offercategory").length>0)
							// toggleItemSpecific('offercategory');
						} else {
							$("input[type=radio]").attr('disabled', false); 
							$("input.basedOnGroup").removeAttr("readonly", "readonly");
							$("select.basedOnProduct").removeAttr("disabled");
							$("input.basedOnProduct").removeAttr("readonly");
							$("#itemDisountBasedGroup").removeAttr("checked");
							$("#complexbasedOnGroup").removeAttr("checked")
							//$("#basedOnProduct").prop("checked", true);
							
						}
					}

}
			 
	function toggleCategoryApplyAll()
	{
		 debugger;
		 if ($("#applyForAllItemsProduct").prop("checked") == true) {
			 $('#saleCategory').val("").change();
			 //$('#sale_sub_category').val("").change();
		 }
	}
			 
		 function toggleItemSpecificsalePrice(id){
				 debugger;
				 var value=$("#"+id).val();
			if(value.includes("turn_over")){
		$("#applysaleprice").removeAttr("disabled");
	    }else{
		$("#applysaleprice").prop("checked", false);
		$("#applysaleprice").attr("disabled", "disabled");
	
	    }

}
		
		
		
		
		
			 function toggleItemSpecific(id){
				 debugger;
				 var value=$("#"+id).val();
			
				 if($("#"+id).val() == "item_specific"){
					 $("#basedOnProduct").prop("checked", true);
					 $("#itemDisountBased").prop("checked", true);
					 toggleBased('basedOnProduct');
					 $("input.saleGroups").attr("readonly","readonly");
					 $("select.saleGroups").attr("disabled","disabled");
					 $("select.basedOnProductR").removeAttr("disabled");
					
					 //$("#basedOnGroup").attr("disabled","disabled");
					 $("#basedOnProduct").removeAttr("disabled");
					
					 
					 $("#basedOnGroup").removeAttr("checked");
					 $("#complexbasedOnGroup").removeAttr("checked");
					 
					 $("#isCombo").removeAttr("checked");
					 $("#lowestPriceItem").removeAttr("checked");
					 $("#isCombo").attr("disabled","disabled");
					 $("#lowestPriceItem").attr("disabled","disabled");
					 $(".minPurQty").val('0');
					 $(".minPurQty").attr("readonly","readonly");
					 
				 }
				 else{
					 $("#categorySubDept1").text("");
					 $("#categorySubDept2").text("");
					 $("#basedOnGroup").prop("checked", true);
					 $("#complexbasedOnGroup").prop("checked", true);
					 $("#basedOnProduct").removeAttr("checked");
					 $("#itemDisountBased").removeAttr("checked");
					
					 $("#basedOnGroup").removeAttr("disabled");
					 $("#basedOnProduct").attr("disabled","disabled");
					 
					 $(".minPurQty").removeAttr("readonly");
					 $("#isCombo").removeAttr("disabled");
					 $("#lowestPriceItem").removeAttr("disabled");
					$("input.saleGroups.basedOnProduct").removeAttr("readonly");
					 $("select.saleGroups.basedOnProduct").removeAttr("disabled");
					 toggleBased('basedOnGroup');
					 toggleItemComplexBased('complexbasedOnGroup');
					
					 $("#minQtyProductDeal").val("");
					 $("#minAmtProductSale").val("");
					 $("#minQtyProductSale").val("");
					 
				 }
			 }
			 
			 $('#searchDeals').on('input',function(e){
					if($(this).val().trim()==""){
						viewdealsandoffers('deals','dealsConfigurations','0');
					}
				});
			 
			 
			 
			 function searchDeals(name,searchCategory,index){
					 var location = "";
			 		 if($("#outletLocation").length>0 && $("#outletLocation").val != "-- Select --")
		    	 		location = $("#outletLocation").val();
			 		 
			 		 name=""
			 			if($("#searchDeals").length>0)
			 			name = $("#searchDeals").val().trim();
			 		
			 		 
					var maxRecords = 10;
			 		 if($("#maxRecords").length>0)
			 			 maxRecords = $("#maxRecords").val();
		   			var startDate = "";
			 		 var endDate = "";
			 		if($("#from").val() != "" && $("#to").val() != ""){
			 			var noOfDays = daydiff(parseDate($('#from').val()), parseDate($('#to').val()));
						 if(noOfDays < 0){
							 alert("Start Date can't be less than End Date");
							 return;
						 }
						 startDate = $("#from").val();
						 endDate = $("#to").val();
		 			}else if($("#from").val() != "")
						 startDate = $("#from").val();
		 			else if($("#to").val() != "")
		 				endDate = $("#to").val();
			 		 startDate = startDate.replace('/','-').replace('/','-');
			 		 endDate = endDate.replace('/','-').replace('/','-');
			 		 
			 		var offerStatusValue = "";
			 		if($("#offerStatusValue").length>0)
			 			offerStatusValue = $("#offerStatusValue").val();

			 		var zone = "";
			 		if($("#outletZone").length > 0)
			 			zone = $("#outletZone").val();


			 		var offerType = "";
			 		if($("#offerType").length > 0)
			 			offerType = $("#offerType").val();
			 		
			 		
			 		var saveFlag="false";
			 		if(searchCategory=="true")
			 			{
			 			saveFlag="true";
			 			}
			 		 
					 var contextPath = $("#contextPath").val();
					 URL = contextPath + "/dealsAndOffers/searchDeals.do";
					 $.ajax({
							type: "GET",
							url : URL,
							data : {
			  					searchName : name,
			  					location : location,
			  					index : index,
			  					maxRecords : maxRecords,
			 					startDate : startDate,
			 					endDate : endDate,
			 					offerStatusValue : offerStatusValue,
			 					offerType : offerType,
			 					zone : zone,
			 					saveFlag:saveFlag
			  				},
							beforeSend: function(xhr){                    
					   	   		$("#loading").css("display","block");
					   	   		$("#mainDiv").addClass("disabled");
					   	   	},
							success : function(result) {
								$("#right-side").html(result);
								/*if($("#searchProduct").val != "")
									$("#pagination").css("display","none");
								else
									$("#pagination").css("display","block");*/
								
								if(saveFlag=="true")
								{
								var anchor = document.createElement('a');
									anchor.href = $("#downloadUrl").val();
									anchor.target = '_blank';
									anchor.download = '';
									if($("#downloadUrl").val()!=null && $("#downloadUrl").val()!=''){
										anchor.click();
									}
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
			 
			 function keyDownMethod(e,ele){
//				 console.log(e);
				if (e == 27) {
		        	var typeSearch = $(ele).siblings("div").children("div").children("ul").attr("class").replace('matchedStringUl ','');
	   				if(typeSearch.indexOf("groupId") > -1){
		        			$("#"+typeSearch).val("");
		        			$("#selected"+typeSearch).val("");
		        	}
	   				else if(typeSearch.indexOf("itemId") > -1){
	   					$("#"+typeSearch).val("");
	        			$("#selected"+typeSearch).val("");
	        			$("#pluCode"+typeSearch).val("");
	   				}
	   				$(ele).siblings("div .services").hide();
	   				$(ele).siblings("div").children("div").children(".matchedStringUl").html(""); // need check
				}
				else if (e == 13) { // enter
//					console.log("inside 13 block");
   			        if ($(ele).siblings("div").is(":visible")) {
//   			        	console.log("div is visible");
   			        	$(ele).val($(ele).siblings("div").children("div").children("ul").children(".selected").children("a").text());
   			        	if($(ele).val().trim() != ""){
   			        		var id = $(ele).siblings("div").children("div").children("ul").children(".selected").children("a").parent().attr("id");
   			        		var typeSearch = $(ele).siblings("div").children("div").children("ul").attr("class").replace('matchedStringUl ','');
   			        		if(typeSearch.indexOf("groupId") > -1){
//   			        			var groupId =  $("#"+id).children("a").text();
   			        			$("#"+typeSearch).val(id);
   			        			$("#selected"+typeSearch).val(id);
   			        		}
   			        		else if(typeSearch.indexOf("itemId") > -1){
//   			        			var groupId =  $("#"+id).children("a").text();
   			        			var pluCode = $(ele).siblings("div").children("div").children("ul").children(".selected").children("input").val();
   			        			$("#"+typeSearch).val(id);
   			        			$("#selected"+typeSearch).val(id);
   			        			$("#pluCode"+typeSearch).val(pluCode);
   			        		}
   			        		$(ele).siblings("div .services").hide();
   			        		$(ele).siblings("div").children("div").children("."+typeSearch).html("");
   			        	}
   			        }else 
   			        	$(ele).siblings("div").show();
				}
				else if (e == 38) { // up
   			        var selected = $(ele).siblings("div").children("div").children("ul").children(".selected");
   			        if ($(ele).siblings("div").children("div").children("ul").children("li").length != 1 ) 
   			        	$(ele).siblings("div").children("div").children("ul").children("li").removeClass("selected");
   			        if (selected.prev().length == 0) 
   			            selected.siblings().last().addClass("selected");
   			        else 
   			            selected.prev().addClass("selected");
   			    }
				else if (e == 40) { // down
   			        var selected = $(ele).siblings("div").children("div").children("ul").children(".selected");
   			        if ($(ele).siblings("div").children("div").children("ul").children("li").length != 1 ) 
   			        	$(ele).siblings("div").children("div").children("ul").children("li").removeClass("selected");
   			        if (selected.next().length == 0) 
   			            selected.siblings().first().addClass("selected");
   			        else 
   			            selected.next().addClass("selected");
   			    }else{
   			    	var typeSearch = $(ele).siblings("div").children("div").children("ul").attr("class").replace('matchedStringUl ','');
	   				if(typeSearch.indexOf("groupId") > -1){
	   					var id = $(ele).attr("id"); 
						if($(ele).val().length<3){
							$("#selected"+id).val("");
						}
						$("."+id).children("li").each(function(){
							var group = $(ele).children("a").text().trim();
							if($("#"+id).val().trim().toLowerCase() == group.toLowerCase()){
								$("#"+id).val($("#"+id).val().trim());
								$("#selected"+id).val($("#"+id).val().trim());
								 $(".services").hide();
								 $(".matchedStringUl").html("");
								return;
							}
							else{
								$("#selected"+id).val("");
							}
						});
						if(e == 9){
							if($("#"+id).val()!="" && $("#selected"+id).val() == ""){
								 $("#"+id).val("");
							 }
							 $(".services").hide();
							 $(".matchedStringUl").html("");
						}
		        	}
	   				else if(typeSearch.indexOf("itemId") > -1){
						var id = $(ele).attr("id"); 
						if($(ele).val().length<3){
							$("#selected"+id).val("");
							$("#pluCode"+id).val("");
						}
						$("."+id).children("li").each(function(){
							var group = $(ele).children("a").text().trim();
							if($("#"+id).val().trim().toLowerCase() == group.toLowerCase()){
								$("#"+id).val($("#"+id).val().trim());
								$("#selected"+id).val($("#"+id).val().trim());
								var pluCode = $(ele).children("input").val();
								$("#pluCode"+type).val(pluCode);
								 $(".services").hide();
								 $(".matchedStringUl").html("");
								return;
							}
							else{
								$("#selected"+id).val("");
								$("#pluCode"+id).val("");
							}
						});
						if(e == 9){
							if($("#"+id).val()!="" && $("#selected"+id).val() == ""){
								 $("#"+id).val("");
							 }
							 $(".services").hide();
							 $(".matchedStringUl").html("");
						}
	   				}
   			    }
			 }
			 
			 function getGroupIds(ele){
				 debugger;
				 var searchName = $(ele).val();
   				 if(searchName!=""&&searchName.length>=3){
   					 $(ele).siblings("div").show();
   					 var searchCategory = $(ele).siblings("div").children("div").children("ul").attr("class").replace('matchedStringUl ','');
   					 searchProductGroupMaster(searchName, searchCategory);
   				 }
			 }
			 
			 
			 function getItemIds(ele){
				 var searchName = $(ele).val();
   				 if(searchName!=""&&searchName.length>=3){
   					 $(ele).siblings("div").show();
   					 var searchCategory = $(ele).siblings("div").children("div").children("ul").attr("class").replace('matchedStringUl ','');
   					 searchBuySkus(searchName, searchCategory);
   				 }
			 }
			 
			 function searchSubCategoriesBasedOnCategory(id,subCategoryId){
				 var categoryName = $("#"+id).val();
				 if(categoryName != "-- Select --"){
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
							 appendSubCategories(result,subCategoryId);
							 
							 if ($("#complexDisountBased").prop("checked"))
									{
										$("#categorySubDept1").text("");
										$("#categorySubDept2").text("");
										var selections = "";
										if($("#saleCategory").val()!=undefined && $("#saleCategory").val()!="")
											selections = $("#saleCategory").val();
										
										if($("#sale_department").val()!=undefined && $("#sale_department").val()!="")
											selections = selections+'/'+ $("#sale_department").val();
										
										if($("#sale_brand").val()!=undefined && $("#sale_brand").val()!="")
											selections = selections+'/'+ $("#sale_brand").val();
									   $("#categorySubDept1").text(selections);
									   $("#categorySubDept2").text(selections);
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
				 $("#"+subCategoryId).html('');
			}

			function appendSubCategories(subCategoryList,subCategoryId){
				 var op = '<option value="" >-- Select --</option>';
				 for(var i=0;i<subCategoryList.length;i++){
						 op += '<option value="'+subCategoryList[i].subcategoryName+'" >'+subCategoryList[i].subcategoryName+'</option>';
				 }
				 $("#"+subCategoryId).html('');
				 $("#"+subCategoryId).html(op);
			}
			
			
			/*function changeRangeMode(ele){
				var id = $(ele).attr("id");
				id = id.replace('rangeMode','');
				if($(ele).val() == "promotion"){
					if($("#"+id+"minquantity").length > 0){
						$("#"+id+"minquantity").val('0');
						$("#"+id+"minquantity").attr("readonly","readonly");
					}
					if($("#"+id+"minamount").length > 0){
						$("#"+id+"minamount").val('0');
						$("#"+id+"minamount").attr("readonly","readonly");
					}
					if($("#"+id+"minpurchaseqty").length > 0){
						$("#"+id+"minpurchaseqty").val('0');
						$("#"+id+"minpurchaseqty").attr("readonly","readonly");
					}
					if($("#"+id+"minpurchaseamt").length > 0){
						$("#"+id+"minpurchaseamt").val('0');
						$("#"+id+"minpurchaseamt").attr("readonly","readonly");
					}
				}else{
					if($("#"+id+"minquantity").length > 0)
						$("#"+id+"minquantity").removeAttr("readonly");
					if($("#"+id+"minamount").length > 0)
						$("#"+id+"minamount").removeAttr("readonly");
					if($("#"+id+"minpurchaseqty").length > 0)
						$("#"+id+"minpurchaseqty").removeAttr("readonly");
					if($("#"+id+"minpurchaseamt").length > 0)
						$("#"+id+"minpurchaseamt").removeAttr("readonly");
				}
				if($(ele).val() == "condition"){
					if($("#"+id+"dealquantity").length > 0){
						$("#"+id+"dealquantity").val('0');
						$("#"+id+"dealquantity").attr("readonly","readonly");
					}
					if($("#"+id+"dealqty").length > 0){
						$("#"+id+"dealqty").val('0');
						$("#"+id+"dealqty").attr("readonly","readonly");
					}
				}else{
					if($("#"+id+"dealquantity").length > 0)
						$("#"+id+"dealquantity").removeAttr("readonly");
					if($("#"+id+"dealqty").length > 0)
						$("#"+id+"dealqty").removeAttr("readonly");
				}
			}*/
			
			
			function toggleComboLowest(id){
				debugger;
				if(id == "lowestPriceItem"){
					if($("#lowestPriceItem").prop("checked"))
						$("#isCombo").removeAttr("checked");
				}else if(id == "isCombo"){
					if($("#isCombo").prop("checked"))
						$("#lowestPriceItem").removeAttr("checked");
				}
				if(id == "id"){
					if(!$("#lowestPriceItem").prop("checked") && !$("#isCombo").prop("checked")){
						$("select[name='rangeMode']").prop("disabled","disabled");
//						$(".dealQty").attr("readonly","readonly");
					}
					else{
						$("select[name='rangeMode']").removeAttr("disabled");
					}
				}else{
					if(!$("#lowestPriceItem").prop("checked") && !$("#isCombo").prop("checked")){
//						$(".dealQty").val('0');
//						$(".dealQty").attr("readonly","readonly");
						$("select[name='rangeMode']").val("both");
						$("select[name='rangeMode']").prop("disabled","disabled");
					}
					else{
						$("select[name='rangeMode']").removeAttr("disabled");
					}
				}
				
				
				
				
				
			}
			
			function changeRangeMode(ele,type){
				var id = $(ele).attr("id");
				id = id.replace('rangeMode','');
				if(type == 'new'){
					if($("#lowestPriceItem").prop("checked")){
						if($(ele).val() == "both"){
							$("#"+id+"minquantity").removeAttr("readonly");
							$("#"+id+"minamount").removeAttr("readonly");
							$("#"+id+"dealquantity").removeAttr("readonly");
						}
						else if($(ele).val() == "promotion"){
							$("#"+id+"minquantity").val('0');
							$("#"+id+"minamount").val('0');
							$("#"+id+"minquantity").attr("readonly","readonly");
							$("#"+id+"minamount").attr("readonly","readonly");
							$("#"+id+"dealquantity").removeAttr("readonly");
						}
						else if($(ele).val() == "condition"){
							$("#"+id+"dealquantity").val('0');
							$("#"+id+"dealquantity").attr("readonly","readonly");
							$("#"+id+"minquantity").removeAttr("readonly");
							$("#"+id+"minamount").removeAttr("readonly");
						}
					}else if($("#isCombo").prop("checked")){
						$("#"+id+"dealquantity").val('0');
						$("#"+id+"dealquantity").attr("readonly","readonly");
						if($(ele).val() == "both"){
							$("#"+id+"minquantity").removeAttr("readonly");
							$("#"+id+"minamount").removeAttr("readonly");
						}
						else if($(ele).val() == "promotion"){
							$("#"+id+"minquantity").val('0');
							$("#"+id+"minamount").val('0');
							$("#"+id+"minquantity").attr("readonly","readonly");
							$("#"+id+"minamount").attr("readonly","readonly");
						}
						else if($(ele).val() == "condition"){
							$("#"+id+"minquantity").removeAttr("readonly");
							$("#"+id+"minamount").removeAttr("readonly");
						}
					}
					if($("#offercategory").val() != "item_specific"){
						$("#"+id+"minquantity").attr("readonly","readonly");
					}
				}else if(type == 'edit'){
					if($("#lowestPriceItem").prop("checked")){
						if($(ele).val() == "both"){
							$("#"+id+"minpurchaseqty").removeAttr("readonly");
							$("#"+id+"minpurchaseamt").removeAttr("readonly");
							$("#"+id+"dealqty").removeAttr("readonly");
						}
						else if($(ele).val() == "promotion"){
							$("#"+id+"minpurchaseqty").val('0');
							$("#"+id+"minpurchaseamt").val('0');
							$("#"+id+"minpurchaseqty").attr("readonly","readonly");
							$("#"+id+"minpurchaseamt").attr("readonly","readonly");
							$("#"+id+"dealqty").removeAttr("readonly");
						}
						else if($(ele).val() == "condition"){
							$("#"+id+"dealqty").val('0');
							$("#"+id+"dealqty").attr("readonly","readonly");
							$("#"+id+"minpurchaseqty").removeAttr("readonly");
							$("#"+id+"minpurchaseamt").removeAttr("readonly");
						}
					}else if($("#isCombo").prop("checked")){
						$("#"+id+"dealqty").val('0');
						$("#"+id+"dealqty").attr("readonly","readonly");
						if($(ele).val() == "both"){
							$("#"+id+"minpurchaseqty").removeAttr("readonly");
							$("#"+id+"minpurchaseamt").removeAttr("readonly");
						}
						else if($(ele).val() == "promotion"){
							$("#"+id+"minpurchaseqty").val('0');
							$("#"+id+"minpurchaseamt").val('0');
							$("#"+id+"minpurchaseqty").attr("readonly","readonly");
							$("#"+id+"minpurchaseamt").attr("readonly","readonly");
						}
						else if($(ele).val() == "condition"){
							$("#"+id+"minpurchaseqty").removeAttr("readonly");
							$("#"+id+"minpurchaseamt").removeAttr("readonly");
						}
					}
					if($("#offercategory").val() != "item_specific"){
						$("#"+id+"minpurchaseqty").attr("readonly","readonly");
					}
				}
			}
			
			function toggleItemComplexBased(id) {
				debugger;
				if(id=="itemDisountBased" || id=="complexDisountBased"){
				if($("#itemDisountBased").prop("checked") || $("#complexDisountBased").prop("checked")){
					$("#basedOnProduct").prop("checked", true);
					$("#basedOnGroup").removeAttr("checked");
					$("#itemDisountBasedGroup").removeAttr("checked");
					$("#complexbasedOnGroup").removeAttr("checked");

					if($("#itemDisountBased").prop("checked"))
						{
							$("#RangesHide1").css("display","none");
							$("#RangesHide2").css("display","none");
						}
					if($("#complexDisountBased").prop("checked"))
						{
							$("#RangesHide1").css("display","table-row-group");
							$("#RangesHide2").css("display","table-row-group");
						}
					
				}
				}
				if(id=="itemDisountBasedGroup" || id=="complexbasedOnGroup"){
					if($("#itemDisountBasedGroup").prop("checked") || $("#complexbasedOnGroup").prop("checked")){
						$("#basedOnGroup").prop("checked", true);
						$("#basedOnProduct").removeAttr("checked");
						$("#itemDisountBased").removeAttr("checked");
						$("#complexDisountBased").removeAttr("checked");
						
					}
					
					}
				
				var complexBasedSelection=$("#complexDisountBased").prop("checked");
				if(complexBasedSelection){
					//debugger;
				$("#categorySubDept1").text("");
				$("#categorySubDept2").text("");
				var selections = "";
				if($("#saleCategory").val()!=undefined && $("#saleCategory").val()!="")
					selections = $("#saleCategory").val();
				
				if($("#sale_department").val()!=undefined && $("#sale_department").val()!="")
					selections = selections+'/'+ $("#sale_department").val();
				
				if($("#sale_brand").val()!=undefined && $("#sale_brand").val()!="")
					selections = selections+'/'+ $("#sale_brand").val();
				
					$("#categorySubDept1").text(selections);
					$("#categorySubDept2").text(selections);
					
				}
				
			}
			
			
function toggleComboLowestProduct(id) {
				debugger;
				var priceBased=$("#priceBasedConfigurationProduct").prop("checked");
				var applylitems=$("#applyForAllItemsProduct").prop("checked");
				
			if(applylitems==true)
				{
				$(".minQtyProduct").attr("disabled","disabled");
				$(".minAmtProduct").attr("disabled","disabled");
				$(".itemSearch").attr("disabled","disabled");
				$(".rewardQuantity").attr("disabled");
				$(".startPricePro").removeAttr("disabled");
				$(".endPricePro").removeAttr("disabled");
				$(".groupSearch").attr("disabled","disabled");
				$(".groupSearch").val("");
				$(".itemSearch").val("");
				$('#offerSaleSkusProduct tbody > tr').hide();
				$("#itemDisountBased").removeAttr("checked");
				//$(".groupSearch").removeAttr("disabled");
				}
				
				
				if(applylitems==false)
				{
				$(".minQtyProduct").removeAttr("disabled");
				$(".minAmtProduct").removeAttr("disabled");
				$(".itemSearch").removeAttr("disabled");
				$(".rewardQuantity").removeAttr("disabled");
				$(".startPricePro").attr("disabled","disabled");
				$(".endPricePro").attr("disabled","disabled");
				$("#itemDisountBased").prop("checked", true);
				$('#offerSaleSkusProduct tbody > tr').show();
				//$(".groupSearch").removeAttr("disabled");
				}

		}

function deleteProductSlab(id) {
	//debugger
	/*var newcountProduct = $("#slabLis tr").length - 1;
	newcountProduct = newcountProduct -1;*/
	// var id = $(element).attr("id").replace('Img','');
	
	var len = $("#slabLis tr").length - 1;
	
	if (len <= 1) {
		alert("Atleast One Range is Required");
		return;
	}
	
	$('#' + id).remove();
}


var newcountProduct = $("#slabLis tr").length - 1;
function addProductOfferSlab() {
	//debugger
	var priceBased = $("#priceBasedConfigurationProduct").prop("checked");
	var applylitems = $("#applyForAllItemsProduct").prop("checked");
	newcountProduct = newcountProduct + 1;
	var currentDealSlabDivContent = dealProductSlabDivContent;
	currentDealSlabDivContent = currentDealSlabDivContent.replace('productrange1',
			'productrange' + newcountProduct);
	
	currentDealSlabDivContent = currentDealSlabDivContent.replace('1itemId',
			newcountProduct + 'itemId');
	
	currentDealSlabDivContent = currentDealSlabDivContent.replace('productoffer1',
			'productoffer' + newcountProduct);
	
	currentDealSlabDivContent = currentDealSlabDivContent.replace('categorySubDept1',
			 'categorySubDept' + newcountProduct);
	
	
	currentDealSlabDivContent = currentDealSlabDivContent.replace('1itemId',
			newcountProduct + 'itemId');
	currentDealSlabDivContent = currentDealSlabDivContent.replace(
			'selected1itemId', 'selected' + newcountProduct + 'itemId');
	
	currentDealSlabDivContent = currentDealSlabDivContent.replace('1rangename',
			newcountProduct + 'rangename');
	currentDealSlabDivContent = currentDealSlabDivContent.replace(
			'1minquantityProduct', newcountProduct + 'minquantityProduct');
	currentDealSlabDivContent = currentDealSlabDivContent.replace('1minamountProduct',
			newcountProduct + 'minamountProduct');
	currentDealSlabDivContent = currentDealSlabDivContent.replace(
			'1rangeRewardType', newcountProduct + 'rangeRewardType');
	currentDealSlabDivContent = currentDealSlabDivContent.replace(
			'1rewardvalueProduct', newcountProduct + 'rewardvalueProduct');
	currentDealSlabDivContent = currentDealSlabDivContent.replace(
			'1rewardQuantityProduct', newcountProduct + 'rewardQuantityProduct');
	currentDealSlabDivContent = currentDealSlabDivContent.replace('1rangeMode',
			newcountProduct + 'rangeMode');
	
	
	currentDealSlabDivContent = currentDealSlabDivContent.replace(
			'1startPriceProduct', newcountProduct + 'startPriceProduct');
	currentDealSlabDivContent = currentDealSlabDivContent.replace(
			'1endPriceProduct', newcountProduct + 'endPriceProduct');
	
	currentDealSlabDivContent = currentDealSlabDivContent.replace('productrange1',
			'productrange' + newcountProduct);
	$("#slabLis tbody").append(currentDealSlabDivContent);
	
		//$("#" + newcount + "rewardQuantity").val('0');
		//$("#" + newcount + "rewardQuantity").attr("readonly", "readonly");
		//$("#" + newcount + "rangeMode").val("both");
		//$("#" + newcount + "rangeMode").prop("disabled", "disabled");
		
	if(applylitems==true)
		{
		$("#" + newcountProduct + "itemIdProduct").attr("disabled","disabled");
		$("#" + newcountProduct + "minquantityProduct").attr("disabled","disabled");
		$("#" + newcountProduct + "minamountProduct").attr("disabled","disabled");
		$("#" + newcountProduct + "startPriceProduct").removeAttr("disabled");
		$("#" + newcountProduct + "endPriceProduct").removeAttr("disabled");
		$("#productoffer"+newcountProduct).text(newcountProduct);
		$("#categorySubDept"+newcountProduct).text($("#categorySubDept1").text());
		
		}
	else
		{
		$("#productoffer"+newcountProduct).text(newcountProduct);
		$("#categorySubDept"+newcountProduct).text($("#categorySubDept1").text());
		$("#" + newcountProduct + "minquantityProduct").removeAttr("disabled");
		$("#" + newcountProduct + "minamountProduct").removeAttr("readonly");
		$("#" + newcountProduct + "startPriceProduct").attr("disabled","disabled");
		$("#" + newcountProduct + "endPriceProduct").attr("disabled","disabled");
		$(".startPricePro").val('0');
		$(".endPricePro").val('0');
		}
	
	var rewardValue=$("#offerRewardCriteria").val();
	
		
		appendingbardTotable();
	
}

function appendingbardTotable()
{
	debugger;
	
	if ($("#complexDisountBased").prop("checked"))
	{
		$("#categorySubDept1").text("");
		$("#categorySubDept2").text("");
		var selections = "";
		if($("#saleCategory").val()!=undefined && $("#saleCategory").val()!="")
			selections = $("#saleCategory").val();
		
		if($("#sale_department").val()!=undefined && $("#sale_department").val()!="")
			selections = selections+'/'+ $("#sale_department").val();
		
		if($("#sale_brand").val()!=undefined && $("#sale_brand").val()!="")
			selections = selections+'/'+ $("#sale_brand").val();
	   $("#categorySubDept1").text(selections);
	   $("#categorySubDept2").text(selections);
	}
	var complexbasedSelection=$("#complexDisountBased").prop("checked");
	if(complexbasedSelection==true){
	$("#categorySubDept").text("");
		$("#categorySubDept").text($("#saleCategory").val()+" / "+$("#sale_department").val()+" / "+$("#sale_brand").val());
		
	}
}


$(".searchDealItems").bind('input', function () {
    try{
   	 debugger;
				var online = window.navigator.onLine;
			  	if(!online){
			  	alert("Check your internet connection,Please try agian after some time.");
			  	return;
			  	} 
			$(".Error").html("");
			 var searchName = $(this).val().trim();
			 if(searchName!=""&&searchName.length>=3){
					 $(this).siblings("div").show();
					 var searchCategory = $(this).siblings("div").children("div").children("ul").attr("class").replace('matchedStringUl ','');
					 var location = $('#dealLocation').val();
						 if(location==undefined || location=="")
							 {
							 location=$('#editdealLocation').val();
							 }
						if(location==null){
							alert("Please Select location...");
	   	   				  	return;
						}
					searchDealProducts(searchName, searchCategory);	 
			 }	 		 
    }
    catch(e)
	{
	errorCode(e);
	}
});


function searchDealProducts(name, searchCategory){
	
	debugger;
	 //purpose:for checking internet conection  deals
		var online = window.navigator.onLine;
	  	if(!online)
	  	{
	  	alert("check your internet connection,please try agian after some time");
	  	return;
	  	}
 var contextPath = $("#contextPath").val();
 var categoryName="";
 var subCategory="";
 
	 categoryName=$("#saleCategory").val();
	 if(categoryName.trim() == "-- Select --")
		 categoryName = "";
	 subCategory=$("#sale_sub_category").val();
	 if(subCategory != null && subCategory.trim() == "-- Select --")
		 subCategory = "";

	 	var location = $('#dealLocation').val();
		 if(location=="" || location==undefined || location==null)
			 {
			  location = $('#editdealLocation').val();
			 }
		 location = location[0];

 URL = contextPath + "/inventorymanager/searchProductsForCategory.do";
 $.ajax({
		type: "GET",
		url : URL,
		data : {
			searchName : name,
			categoryName: categoryName,
			location:location,
//			subCategory: subCategory
		},
		beforeSend: function(xhr){                    
	   			$("#loading").css("display","block");
	   			$("#mainDiv").addClass("disabled");
	   		  },
		success : function(result) {
			debugger;
			appendDealProductsToDiv(result, searchCategory);
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

function appendDealProductsToDiv(productsList, searchCategory){
	debugger;
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
		 var jsonObj=productsList[i];
		 var discreption=encodeURIComponent(productsList[i].productName);
		 var qty=productsList[i].quantity;
		 var ean=productsList[i].ean;
		 var size=productsList[i].size;
		 if (i == 0) 
			 op += '<li id="'+productsList[i].skuID+'"  class="selected" onclick=getThisDealId(this,"'+searchCategory+'","'+discreption+'","'+qty+'","'+ean+'","'+size+'"); ><a>'+productsList[i].skuID+'   (   '+productsList[i].description+'   ) &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; '+productsList[i].price+'&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;'+productsList[i].pluCode+'</a><input type="hidden" value="'+productsList[i].pluCode+'"/></li>';
		 else
		     op += '<li id="'+productsList[i].skuID+'" onclick=getThisDealId(this,"'+searchCategory+'","'+discreption+'","'+qty+'","'+ean+'","'+size+'"); ><a>'+productsList[i].skuID+'   (   '+productsList[i].description+'   )&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; '+productsList[i].price+'&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;'+productsList[i].pluCode+'</a><input type="hidden" value="'+productsList[i].pluCode+'"/></li>';
	 }
	 $("."+searchCategory).html(op);
	 $("."+searchCategory).show();
}

function getThisDealId(element,type,Disc,qty,ean,size){
	debugger;
	var id= $(element).attr("id");
	var Disc=decodeURIComponent(Disc);
	var pluCode = $(element).children("input").val();
		
	$("#"+type).val(id);
}


function addSkuFromExcelDealsImport(skuList) {
	debugger
	
	if(skuList=="" || skuList == null || skuList.length<=0)
		{
		alert("there is no data")
		return;
		}

for(var i=0;i<=skuList.length-1;i++)
	{
	if(skuList[i].category == null || skuList[i].category==undefined || skuList[i].category=="")
		skuList[i].category = "";
	
	if(skuList[i].model == null || skuList[i].model==undefined || skuList[i].model=="")
		skuList[i].model = "";

	if(skuList[i].department == null || skuList[i].department==undefined || skuList[i].department=="")
		skuList[i].department = "";

	if(skuList[i].subCategory == null || skuList[i].subCategory==undefined || skuList[i].subCategory=="")
		skuList[i].subCategory = "";
	
	if(skuList[i].section == null || skuList[i].section==undefined || skuList[i].section=="")
		skuList[i].section = "";
	
	if(skuList[i].size == null || skuList[i].size==undefined || skuList[i].size=="")
		skuList[i].size = "";
	
	if(skuList[i].dealSize == null || skuList[i].dealSize==undefined || skuList[i].dealSize=="")
		skuList[i].dealSize = "";
	if(skuList[i].dealEAN == null || skuList[i].dealEAN==undefined || skuList[i].dealEAN=="")
		skuList[i].dealEAN = "";
	
	var flag = true;
	$('#searchItems').val('');
	$('#dealProductsDataList').val('');
	var contextPath = $("#contextPath").val();
	var remove = contextPath + "/images/itemdelete1.png";
	
	var len = parseInt($("#saleProductsId tr").length);
	if (len != 1)
		len = parseInt($("#saleProductsId tr:last").attr("id").replace('buyProduct', '')) + 1;

	/*for (var j = 1; j <= len; j++) {
		if ($("#pluCode" + j).val() == skuList[i].pluCode) {
			alert("Item Already Added");
			return;
		}
	}*/
	      
	var slNo = 1;
	$('.slno').each(function() {
		$(this).text(slNo);
		slNo = parseInt(slNo) + 1;
	});

	var test = "this.value=this.value.replace(/[^0-9.]/g,'');";
	var test1 = "this.value=this.value.replace(/(\..*)\./g,'$1');";
	if (flag == true) {
		
		$('#saleProductsId').append(														
				'<tr id='+"'"+len+"buyProduct'"+' class='+"'"+len+"buyProduct'"+'>'
				+'<td style="font-size: 100%;"><span style="color: rgb(81, 93, 107)">'+len+'</span></td>'
				+'<td style="font-size: 100%;"><span style="color: rgb(81, 93, 107)">'+skuList[i].skuId+'</span><input type="hidden" class="buyPluCode" value="'+skuList[i].pluCode+'" /><input type="hidden" id="buyPluCode'+skuList[i].pluCode+'" class="" value="'+skuList[i].pluCode+'" /><input type="hidden" id="buySkuCode'+skuList[i].pluCode+'" class="" value="'+skuList[i].skuId+'" /></td>'
				+'<td style="font-size: 100%;"><span style="color: rgb(81, 93, 107)">'+skuList[i].description+'</span><input type="hidden" class="" id="buyDiscription'+skuList[i].pluCode+'"  value="'+skuList[i].description+'" /></td>'
				+'<td style="font-size: 100%;"><span style="color: rgb(81, 93, 107)"><input type="text" style="width: 40px;text-align: center;" class="buyPluCodeQty" id="buyPluCodeQty'+skuList[i].pluCode+'" value="'+skuList[i].saleQty+'" /></span></td>'
				+'<td style="font-size: 100%;"><span style="color: rgb(81, 93, 107)"><input type="text" style="width: 40px;text-align: center;" class="buyPluCodeTurnOver" id="buyPluCodeTurnOver'+skuList[i].pluCode+'" value="" /></span></td>'
				
				+'<td class="price" style="font-size: 100%;"><center><img src='+remove+' style="cursor:pointer;" onclick="removeSaleProductId('+"'"+len+"buyProduct'"+','+"'"+skuList[i].skuId+"'"+')"></center></td></tr>');
		
		
		$('#dealProductsList').append(														
				'<tr id='+"'"+len+"buyProduct'"+' class='+"'"+len+"dealProductId'"+'>'
				+'<td style="font-size: 100%;"><span style="color: rgb(81, 93, 107)">'+skuList[i].dealSkuId+'</span><input type="hidden" class="dealPluCode" value="'+skuList[i].dealPluCode+'" /><input type="hidden" class="" id="dealPluCode'+skuList[i].dealPluCode+'" value="'+skuList[i].dealPluCode+'" /><input type="hidden" class="" id="dealSkuCode'+skuList[i].dealPluCode+'" value="'+skuList[i].dealSkuId+'" /></td>'
				+'<td style="font-size: 100%;"><span style="color: rgb(81, 93, 107)">'+skuList[i].dealDesc+'<input type="hidden" class="" id="dealDiscription'+skuList[i].dealPluCode+'" value="'+skuList[i].dealDesc+'" /></td>'
				+'<td style="font-size: 100%;"><span style="color: rgb(81, 93, 107)"><input type="text" style="width: 40px;text-align: center;" id="dealPluCodeQty'+skuList[i].dealPluCode+'" value="'+skuList[i].dealQty+'" /></td>'
				+'<td style="font-size: 100%;"><span style="color: rgb(81, 93, 107)">'+skuList[i].dealEAN+'</td>'
				+'<td style="font-size: 100%;"><span style="color: rgb(81, 93, 107)">'+skuList[i].dealSize+'</td>'
				
				+'<td class="price" style="font-size: 100%;"><center><img src='+remove+' style="cursor:pointer;" onclick="removeDealProductId('+"'"+len+"dealProductId'"+','+"'"+skuList[i].dealSkuId+"'"+')"></center></td></tr>');

	}
	}
}

