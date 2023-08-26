/*$(document).ready(function(){

	var expandValue = $("#expandValue").val();
	 var expandVisibilityValue = $("#expandVisibilityValue").val();
	 var expandAuthValue = $("#expandAuthValue").val();
	 if(expandValue == "dealConfiguration"){
	 activateHeader('dealConfiguration','')
	 $(".dealConfiguration").css("display","block");
	 }
	 else if(expandVisibilityValue == "offervisibility"){
		 $(".offervisibility").css("display","block");
		 activateHeader('offervisibility','')
   }
	 else  if(expandAuthValue == "authorise"){
		 $(".authorise").css("display","block");
		 activateHeader('authorise','')
    }
	  else
	 $(".customer").css("display","block");
});
*/

/*
function searchProducts(name, searchCategory) {
	debugger;
	var contextPath = $("#contextPath").val();
	var categoryName = "";
	var subCategory = "";
	var storeLocation = $("#offerLocation option:selected").text();
	if(storeLocation.indexOf(",")){
		storeLocation = $("#offerLocation").val().toString();
	
	if (searchCategory == "offersellproducts"
			|| searchCategory == "editproductList" || searchCategory == "offersellskus" || searchCategory == "offersellskusgroup") {
		categoryName = $("#saleCategory").val();
		if (categoryName.trim() == "-- Select --")
			categoryName = "";
		subCategory = $("#sale_sub_category").val();
		if (subCategory != null && subCategory.trim() == "-- Select --")
			subCategory = "";
	}
	URL = contextPath + "/inventorymanager/searchProductsOnCategoryBasis.do";
	$.ajax({
		type : "GET",
		url : URL,
		data : {
			searchName : name,
			categoryName : categoryName,
			subCategory : subCategory
		},
		beforeSend : function(xhr) {
			$("#loading").css("display", "block");
			$("#mainDiv").addClass("disabled");
		},
		success : function(result) {
			appendProductsBasedOnCategoryBasis(result, searchCategory);
			$("#loading").css("display", "none");
			$("#mainDiv").removeClass('disabled');
		},
		error : function() {
			alert("something went wrong");
			$("#loading").css("display", "none");
			$("#mainDiv").removeClass('disabled');
		}
	});
}

*/


function searchProducts(name, searchCategory){
	debugger;
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
 if(searchCategory == "dealProduct" || searchCategory == "editDealProduct"){
	 categoryName=$("#saleCategory").val();
	 if(categoryName.trim() == "-- Select --")
		 categoryName = "";
	 subCategory=$("#sale_sub_category").val();
	 if(subCategory != null && subCategory.trim() == "-- Select --")
		 subCategory = "";
 }
 if(searchCategory == "dealProductsList" || searchCategory == "editDealProductsList"){
	 categoryName=$("#dealCategory").val();
	 if(categoryName.trim() == "-- Select --")
		 categoryName = "";
	 subCategory=$("#deal_sub_category").val();
	 if(subCategory != null && subCategory.trim() == "-- Select --")
		 subCategory = "";
 }
 var location = $('#offerLocation').val();
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


function searchAllProducts(name, searchCategory) {
	//debugger
	var contextPath = $("#contextPath").val();
	var categoryName = "";
	var subCategory = "";
	if (searchCategory == "offersellproducts"
			|| searchCategory == "editproductList" || searchCategory == "offersellskus" || searchCategory == "offersellskusgroup" ||  searchCategory == "offersellskusAll") {
		categoryName = $("#saleCategory").val();
		if (categoryName.trim() == "-- Select --")
			categoryName = "";
		subCategory = $("#sale_sub_category").val();
		if (subCategory != null && subCategory.trim() == "-- Select --")
			subCategory = "";
	}
	URL = contextPath + "/inventorymanager/searchProductsOnCategoryBasis.do";
	$.ajax({
		type : "GET",
		url : URL,
		data : {
			searchName : name,
			categoryName : categoryName,
			subCategory : subCategory
		},
		beforeSend : function(xhr) {
			$("#loading").css("display", "block");
			$("#mainDiv").addClass("disabled");
		},
		success : function(result) {
			//debugger
			//appendAllCategoryBased(result, searchCategory);
			appendProductsBasedOnCategoryBasis(result, searchCategory);
			for(var i=0;i<result.length;i++){
			getAllBasedItemDetails(result[i].productId)
			}
			//searchAllBasedOfferBuySkus(name, 'offersellskusAll',result);
	
			$("#loading").css("display", "none");
			$("#mainDiv").removeClass('disabled');
		},
		error : function() {
			alert("something went wrong");
			$("#loading").css("display", "none");
			$("#mainDiv").removeClass('disabled');
		}
	});
}




function getProductsByCriteria(name, searchCategory, index) {
	var category=$("#saleCategory").val();
	var deptName=$("#sale_department").val();
	if($("#saleCategory").val().trim() == ""){
		alert("Please select a category")
		return;
	}
	var brandcode=$("#sale_brand").val();
	var contextPath = $("#contextPath").val();
	URL = contextPath + "/b2c/getProductsByCriteria.do";
	//URL = contextPath + "/dealsAndOffers/getProductsByCriteria.do";
	//URL = contextPath + "/inventorymanager/getallProductsByCriteria.do";
	//var pricerange= $("#pricerange").val();
	var maxRecords = $("#maxRecords").val();
	//console.info(pricerange+""+pricerange);
	$.ajax({
		type : "GET",
		url : URL,
		data : {
			searchName 	: name,
			index 		: index,
			category 	: category,
			brand		: brandcode,
		  //department  : deptName,
		  //subcategory : ""
			priceRange	: "",
			maxRecords	: "-1",
		},
		beforeSend : function(xhr) {
			$("#loading").css("display", "block");
			$("#mainDiv").addClass("disabled");
		},
		success : function(result) {
			appendproductsbyfilter(result,searchCategory)
			$("#loading").css("display", "none");
			$("#mainDiv").removeClass('disabled');
		},
		error : function() {
			alert("something went wrong");
			$("#loading").css("display", "none");
			$("#mainDiv").removeClass('disabled');
		}
	});
}

var skuList=null;
function appendproductsbyfilter(skuList,searchCategory){
	debugger
	
	/*var parsedJson = jQuery.parseJSON(list);
	$("#searchItems").val("");
	skuList = parsedJson.skuPriceLists;*/
	
	 var contextPath = $("#contextPath").val();
	// var appendtype=$("#featurededit").val();
	 var len = parseInt($("#offerSaleSkusProduct tr").length);
		if (len != 1)
			len = parseInt($("#offerSaleSkusProduct tr:last").attr("id").replace(
					'dynamicdiv', '')) + 1;
		len=len-2;
		var slNo = 1;
		$('.slno').each(function() {
			$(this).text(slNo);
			slNo = parseInt(slNo) + 1;
		});

		
		
	/* if(appendtype == 'new'){
		 $("#productsList tbody").html('');
	 }*/
	 if(skuList.length =='0'){
		alert("no results found");
	 }
	 var test = "this.value=this.value.replace(/[^0-9.]/g,'');";
		var test1 = "this.value=this.value.replace(/(\..*)\./g,'$1');";
	 
	 //$("#productsList tbody").html('');
	 for(var i=0;i<skuList.length;i++){
		 len=len+1;
		 var size=skuList[i].size;
		 if(size==null)
			 size="" 
		 var pic='picture'+len;
		 var sno=1+len;
		 $('#offerSaleSkusProduct tbody')
			.append(
					"<tr id='dynamicdiv" + len+ "' style='margin-top:5px;'><td class='slno' id='itemno"+ len+ "'>"+ sno+ "</td>"+
					        "<td id='itemCode"+ len+ "'>"+ skuList[i].skuId+ "</td>"+
							 "<td id='itemDesc"+ len+ "'>"+ skuList[i].skuDescription+ "</td>"+
							 "<td id='ean"+ len+ "'>"+ skuList[i].ean+ "</td><input type='hidden' class='buyPluCode' value='"+ skuList[i].ean+ "' />"+
							 "<td id='size"+ len+ "'>"+ size+ "</td>"+
							 "<td ><input style='width: 85%;text-align:center' type='text' id='minQty"+ len+"' class='minQty'></td>"+
							 "<td><select  style='height: 27px;width:128px;' name='dealStatus"+len+"' id='dealStatus"+len+"'><option value=''>--Select--</option><option value='fixed_rate'>Fixed Rate</option><option value='flat_rate'>Cash Flat</option><option value='percentage'>Cash Discount</option><option value='loyaltypoints'>Loyalty Points</option><option value='giftvouchers'>Gift Vouchers</option></select></td>"+
							 "<td ><input style='width: 85%;text-align:center' type='text' disabled='disabled'  id='rewardQtyProduct"+ len+"' class='rewardQtyProduct'></td>"+
								
							 "<td ><input style='width: 85%;' id='amount"+ len+"' type='text' class='amount' oninput="+ test+ " oninput="+ test1+ "></td>"+
							 "<td id='Del"+ len +"' ><img id='Img"+ len +"' src='"+contextPath+"/images/itemdelete.png' style='width:25px;cursor:pointer;' onclick='deleteItem1(this);' title='Delete "+skuList[i].skuDescription+"'/>"+"</td></tr>");
	 }
}


function appendProductsBasedOnCategoryBasis(productsList, searchCategory) {
	debugger;
	$("." + searchCategory).html('');
	if (productsList.length == 0) {
		$("."+searchCategory+"Error").html("There are no products for the given search");
		$("." + searchCategory).hide();
		$("." + searchCategory).html("");
		//focusDiv('Error');
		return;
	}
	var op = '';
	for (var i = 0; i < productsList.length; i++) {
		if (i == 0)
			op += '<li id="' + productsList[i].skuID
					+ '"  class="selected" onclick=getId(this,"'
					+ searchCategory + '"); ><a>' + productsList[i].skuID
					+'&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;'+productsList[i].pluCode
					+'&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;'+ productsList[i].price 
					+'&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;'+ productsList[i].productName+'</a></li>';
		else
			op += '<li id="' + productsList[i].skuID
					+ '" onclick=getId(this,"' + searchCategory + '"); ><a>'+ productsList[i].skuID 
					+'&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;'+productsList[i].pluCode
					+'&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;'+ productsList[i].price 
					+'&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;'+ productsList[i].productName+'</a></li>';
	}
	$("." + searchCategory).html(op);
	$("." + searchCategory).show();
	
}


function appendAllCategoryBased(productsList, searchCategory) {
	debugger
	$("." + searchCategory).html('');
	if (productsList.length == 0) {
		$("#Error").html("There is No Products for the given Search");
		$("." + searchCategory).hide();
		$("." + searchCategory).html("");
		focusDiv('Error');
		return;
	}
	var op = '';
	for (var i = 0; i < productsList.length; i++) {
		if (i == 0)
			op += '<li id="' + productsList[i].productId
					+ '"  class="selected" onclick=getId(this,"'
					+ searchCategory + '"); ><a>' + productsList[i].productId
					+ '   (   ' + productsList[i].productName + '   )</a></li>';
		else
			op += '<li id="' + productsList[i].productId
					+ '" onclick=getId(this,"' + searchCategory + '"); ><a>'
					+ productsList[i].productId + '   (   '
					+ productsList[i].productName + '   )</a></li>';
	}
	$("." + searchCategory).html(op);
	$("." + searchCategory).show();
	
}


/* for buy sku details */
function searchBuySkus(name, searchCategory) {
	//debugger
	/*var categoryName = $("#saleCategory").val();
	var brandName = $("#sale_brand").val();
	var deptName = $("#sale_department").val();
	if (categoryName.trim() == "" && brandName.trim() == "" && deptName.trim() == "" ) {
		$("#Error").html("Please Select Sale Product Category/Department/brand");
		// $("#saleCategory").focus();
		focusDiv('Error');
		return;
	}*/
	$("#Error").html("");
	var productsarray = [];
	var contextPath = $("#contextPath").val();
	if (searchCategory == "offersellskus")
		productsarray = offerSellPRoducts;
	if (searchCategory == "offersellskusgroup")
		productsarray = offerSellPRoducts;
	if (searchCategory == "editOfferBuySkuList")
		productsarray = offerEditProducts;
	if (productsarray.length == 0) {
		// URL = contextPath +
		// "/inventorymanager/searchProductsBasedOnCategory.do";
		URL = contextPath + "/b2c/getProductsByCriteria.do";
		$.ajax({
			type : "GET",
			url : URL,
			data : {
				searchName : name,
				index : "0",
				category : "",
				brand : "",
				// productCategory : categoryName,
				///brand : "",
				priceRange : "",
				maxRecords : "30",
			},

			beforeSend : function(xhr) {
				$("#loading").css("display", "block");
				$("#mainDiv").addClass("disabled");
			},
			success : function(result) {
				appendBuySkus(result, searchCategory);
				$("#loading").css("display", "none");
				$("#mainDiv").removeClass('disabled');

			},
			error : function() {
				alert("something went wrong");
				$("#loading").css("display", "none");
				$("#mainDiv").removeClass('disabled');
			}
		});
	} else {
		URL = contextPath + "/inventorymanager/searchskus.do";
		$.ajax({
			type : "GET",
			url : URL,
			data : {
				productsarray : productsarray.toString()
			},
			beforeSend : function(xhr) {
				$("#loading").css("display", "block");
				$("#mainDiv").addClass("disabled");
			},
			success : function(result) {
				appendBuySkus(result, searchCategory);
				$("#loading").css("display", "none");
				$("#mainDiv").removeClass('disabled');

			},
			error : function() {
				alert("something went wrong");
				$("#loading").css("display", "none");
				$("#mainDiv").removeClass('disabled');

			}
		});
	}

}

function appendBuySkus(skuList, searchCategory) {
	$("." + searchCategory).html('');
	if (skuList.length == 0) {
		$("#Error").html(
				"There is No SKU for the given Search and Product Category");
		$("." + searchCategory).hide();
		$("." + searchCategory).html("");
		focusDiv('Error');
		return;
	}
	var op = '';
	for (var i = 0; i < skuList.length; i++) {
		if (skuList[i].skuId == skuList[i].skuDescription) {
			if (i == 0) {
				op += '<li id="' + skuList[i].skuId
						+ '"  class="selected" onclick=getId(this,"'
						+ searchCategory + '"); ><a>'
						+ skuList[i].skuDescription + '   (PRICE   -   '
						+ skuList[i].salePrice
						+ ')</a><input type="hidden" value="'
						+ skuList[i].skuId + '" /></li>';
			} else
				op += '<li id="' + skuList[i].skuId + '" onclick=getId(this,"'
						+ searchCategory + '"); ><a>'
						+ skuList[i].skuDescription + '   (PRICE   -   '
						+ skuList[i].salePrice
						+ ')</a><input type="hidden" value="'
						+ skuList[i].skuId + '" /></li>';
		} else {
			if (i == 0) {
				op += '<li id="' + skuList[i].skuId
						+ '"  class="selected" onclick=getId(this,"'
						+ searchCategory + '"); ><a>'
						+ skuList[i].skuDescription + '   (SKU ID   -   '
						+ skuList[i].skuId + ',   PRICE   -   '
						+ skuList[i].salePrice
						+ ')</a><input type="hidden" value="'
						+ skuList[i].skuId + '" /></li>';
			} else
				op += '<li id="' + skuList[i].skuId + '" onclick=getId(this,"'
						+ searchCategory + '"); ><a>'
						+ skuList[i].skuDescription + '   (SKU ID   -   '
						+ skuList[i].skuId + ',   PRICE   -   '
						+ skuList[i].salePrice
						+ ')</a><input type="hidden" value="'
						+ skuList[i].skuId + '" /></li>';
		}
		/*
		 * if (i == 0) { op += '<li id="'+productsList[i].skuID+'"  class="selected" onclick=getId(this,"'+searchCategory+'"); ><a>'+productsList[i].skuID+'</a></li>';
		 * }else op += '<li id="'+productsList[i].skuID+'" onclick=getId(this,"'+searchCategory+'"); ><a>'+productsList[i].skuID+'</a></li>';
		 */
	}
	$("." + searchCategory).html(op);
	$("." + searchCategory).show();
}

/*
 * function appendBuySkus(productsList,searchCategory){
 * $("."+searchCategory).html(''); if(productsList.length == 0){
 * $("#Error").html("There is No SKU for the given Search and Product
 * Category"); $("."+searchCategory).hide(); $("."+searchCategory).html("");
 * focusDiv('Error'); return; } var op = ''; for(var i=0;i<productsList.length;i++){
 * if(productsList[i].skuID == productsList[i].description){ if (i == 0) { op += '<li id="'+productsList[i].skuID+'"  class="selected" onclick=getId(this,"'+searchCategory+'"); ><a>'+productsList[i].description+'
 * (PRICE - '+productsList[i].price+')</a><input type="hidden"
 * value="'+productsList[i].pluCode+'" /></li>'; }else op += '<li id="'+productsList[i].skuID+'" onclick=getId(this,"'+searchCategory+'"); ><a>'+productsList[i].description+'
 * (PRICE - '+productsList[i].price+')</a><input type="hidden"
 * value="'+productsList[i].pluCode+'" /></li>'; } else{ if (i == 0) { op += '<li id="'+productsList[i].skuID+'"  class="selected" onclick=getId(this,"'+searchCategory+'"); ><a>'+productsList[i].description+'
 * (SKU ID - '+productsList[i].skuID+', PRICE - '+productsList[i].price+')</a><input
 * type="hidden" value="'+productsList[i].pluCode+'" /></li>'; }else op += '<li id="'+productsList[i].skuID+'" onclick=getId(this,"'+searchCategory+'"); ><a>'+productsList[i].description+'
 * (SKU ID - '+productsList[i].skuID+', PRICE - '+productsList[i].price+')</a><input
 * type="hidden" value="'+productsList[i].pluCode+'" /></li>'; } if (i == 0) {
 * op += '<li id="'+productsList[i].skuID+'"  class="selected" onclick=getId(this,"'+searchCategory+'"); ><a>'+productsList[i].skuID+'</a></li>';
 * }else op += '<li id="'+productsList[i].skuID+'" onclick=getId(this,"'+searchCategory+'"); ><a>'+productsList[i].skuID+'</a></li>'; }
 * $("."+searchCategory).html(op); $("."+searchCategory).show(); }
 */

function activateHeader(id, open) {
	
	debugger
	$(".subBlock").each(function() {
		$(this).slideUp("fast");
	});
	var headerImg = $("#" + id + "Img").attr("src");
	var subBlockOpened = false;
	
	if (headerImg.indexOf('right') != -1) {
		
		subBlockOpened = true;
	}
	var contextPath = $("#contextPath").val();
	var img = contextPath + "/images/leftHeaderIconGreen.png";
	$(".headerImg").each(function() {
		$(this).attr("src", img);
	});
	if (subBlockOpened == true) {
		
		return;
		
	}

	if(subBlockOpened == false)
	{
	if(id == 'dealConfiguration')
	$("#expandValue").val("dealConfiguration");
	if(id == 'offervisibility')
	$("#expandVisibilityValue").val("offervisibility");
	if(id == 'authorise')
	$("#expandAuthValue").val("authorise");
	}
	
	$("#" + id + "Img").attr("src",
			contextPath + "/images/rightHeaderIconGreen.png");
	$("." + id).slideDown("fast");
}

function emptyProduct() {
	$("#searchProduct").val("");
	$("#product").val("");
}

function getFormData() {
	debugger;
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
	if ($('#fromDate').val() != "" && $('#endDate').val() != "") {
		var noOfDays = daydiff(parseDate($('#fromDate').val()), parseDate($(
				'#endDate').val()));
		if (noOfDays < 0) {
			$("#Error").html("End Date can't be less than Start Date");
			focusDiv('fromDateLabel');
			return false;
		}
	}
	var salesZone = $("#salesZone").val();
	var referrals = $("#referrals").val();
	var customerRating = $("#customerRating").val();
	// var otherDetails = $("#otherDetails").val();
	var purchaseChannel = $("#purchaseChannel").val();
	var startPrice = $("#startPrice").val();
	var endPrice = $("#endPrice").val();
	var noOfClaims = $("#noOfClaims").val();
	
	var filterAdded = false;
	//debugger
	var finalObj = {};
	if (country.trim() != "") {
		finalObj.country = country;
		filterAdded = true;
	}
	if (region.trim() != "Select State" && region.trim() != "") {
		finalObj.region = region;
		filterAdded = true;
	}
	if (city.trim() != "") {
		finalObj.city = city;
		filterAdded = true;
	}
	if (customerType.trim() != "-- Select --") {
		finalObj.customerType = customerType;
		filterAdded = true;
	}
	// console.log("|"+age.trim()+"|");
	if (age.trim() != "-- Select --") {
		finalObj.age = age;
		filterAdded = true;
	}
	if (gender.trim() != "-- Select --") {
		finalObj.gender = gender;
		filterAdded = true;
	}
	if (salesZone.trim() != "-- Select --") {
		filterAdded = true;
		finalObj.salesZone = salesZone;
	}
	if ($("#otherDetails").val() != "-- Select --") {
		filterAdded = true;
		finalObj.maritialStatus = $("#otherDetails").val();
	}
	if ($("#children").val() != "-- Select --") {
		filterAdded = true;
		finalObj.children = $("#children").val();
	}
	if ($("#occupation").val() != "-- Select --") {
		filterAdded = true;
		finalObj.occupation = $("#occupation").val();
	}
	if ($("#incomeGroup").val() != "-- Select --") {
		filterAdded = true;
		finalObj.incomeGroup = $("#incomeGroup").val();
	}
	if (fromDate != "") {
		finalObj.start_date = fromDate + " 00:00:00";
		filterAdded = true;
	}
	if (endDate != "") {
		finalObj.end_date = endDate + " 00:00:00";
		filterAdded = true;
	}
	if (purchaseChannel != "-- Select --") {
		finalObj.purchaseChannel = purchaseChannel;
		filterAdded = true;
	}
	/*if (productCategory.trim() != "-- Select --"
			&& productCategory.trim() != "") {
		finalObj.productCategory = productCategory;
		filterAdded = true;
	}*/
	if (startPrice != "" && startPrice != "0.0") {
		finalObj.startPrice = startPrice;
		filterAdded = true;
	}
	if (endPrice != "" && endPrice != "0.0") {
		finalObj.endPrice = endPrice;
		filterAdded = true;
	}
	/*if (product.trim() != "") {
		finalObj.product = product;
		filterAdded = true;
	}*/
	if (customerRating.trim() != "-- Select --") {
		finalObj.customerRating = customerRating;
		filterAdded = true;
	}
	if (referrals.trim() != "-- Select --") {
		finalObj.referrals = referrals;
		filterAdded = true;
	}
	if (noOfClaims != "" && noOfClaims!=undefined && noOfClaims!=null) {
		finalObj.noOfClaims = noOfClaims;
		filterAdded = true;
	}
	
	
	
	/*
	 * if(otherDetails.trim() != "-- Select --") finalObj.otherDetails =
	 * otherDetails;
	 */
	if ($("#applyExchanges").prop("checked") == true) {
		filterAdded = true;
	}
	
	
/*	if (filterAdded && ($("#noOfClaims").val() == "" || $("#noOfClaims").val() == undefined || $("#noOfClaims").val() == null)) {
                $("#Error").html("Enter Total Bills");
                $("#noOfClaims").focus();
             filterAdded = false;
return false;
        }else if(filterAdded && ($("#noOfClaims").val() == "0")){
                $("#Error").html("Total bills can't be 0");
                $("#noOfClaims").focus();
          filterAdded = false;
return false;
              
        }else{
                $("#Error").html("");
        }*/
	
	if (filterAdded == false) {
		return null;
	}else if(filterAdded == true){
		if(noOfClaims == "" || noOfClaims == undefined){
			$("#Error").html("Please enter no of Bills");
			focusDiv('Error');
			return false;
		}else if(noOfClaims==0){
			$("#Error").html("No of Bills can't be Zero");
			focusDiv('Error');
			return false;
		} else if(noOfClaims<0){
			$("#Error").html("Please enter no of Bills");
			focusDiv('Error');
			return false;
		}
	}
	
	
	finalObj.filterAdded = filterAdded;
	finalObj.applyRoolsEngine = $("#applyExchanges").prop("checked");
	return finalObj;
}

/*
 * function getFormData(){ var country = $("#country").val(); var region =
 * $("#states").val(); var city = $("#city").val(); var customerType =
 * $("#customerType").val(); var age = $("#age").val(); var gender =
 * $("#gender").val(); var productCategory = $("#productCategory").val(); var
 * fromDate = $("#fromDate").val(); var product = $("#product").val(); var
 * endDate = $("#endDate").val(); var salesZone = $("#salesZone").val(); var
 * referrals = $("#referrals").val(); var customerRating =
 * $("#customerRating").val(); // var otherDetails = $("#otherDetails").val();
 * var purchaseChannel = $("#purchaseChannel").val(); var startPrice =
 * $("#startPrice").val(); var endPrice = $("#endPrice").val(); var finalObj =
 * {}; if(country.trim() != "Select Country") finalObj.country = country;
 * if(region.trim() != "Select State") finalObj.region = region; if(city.trim() !=
 * "") finalObj.city = city; if(customerType.trim() != "-- Select --")
 * finalObj.customerType = customerType; if(age.trim() != "-- Select --")
 * finalObj.age = age; if(gender.trim() != "-- Select --") finalObj.gender =
 * gender; if(salesZone.trim() != "-- Select --") finalObj.salesZone =
 * salesZone; if($("#otherDetails").val() != "-- Select --")
 * finalObj.maritialStatus = $("#otherDetails").val(); if($("#children").val() !=
 * "-- Select --") finalObj.children = $("#children").val();
 * if($("#occupation").val() != "-- Select --") finalObj.occupation =
 * $("#occupation").val(); if($("#incomeGroup").val() != "-- Select --")
 * finalObj.incomeGroup = $("#incomeGroup").val(); if(fromDate != "")
 * finalObj.start_date = fromDate+" 00:00:00"; if(endDate != "")
 * finalObj.end_date = endDate+" 00:00:00"; if(purchaseChannel.trim() != "--
 * Select --") finalObj.purchaseChannel = purchaseChannel;
 * if(productCategory.trim() != "-- Select --") finalObj.productCategory =
 * productCategory; if(startPrice != "") finalObj.startPrice = startPrice;
 * if(endPrice != "") finalObj.endPrice = endPrice; if(product.trim() != "--
 * Select --") finalObj.product = product; if(customerRating.trim() != "--
 * Select --") finalObj.customerRating = customerRating; if(referrals.trim() !=
 * "-- Select --") finalObj.referrals = referrals;
 * 
 * if(otherDetails.trim() != "-- Select --") finalObj.otherDetails =
 * otherDetails;
 * 
 * 
 * 
 * finalObj.applyRoolsEngine = $("#applyRoolsEngine").prop("checked"); return
 * finalObj; }
 */

function searchProductsBasedOnCategory(name, searchCategory) {
	var contextPath = $("#contextPath").val();
	var productCategory = $("#productCategory").val();
	URL = contextPath + "/inventorymanager/searchProductsOnCategoryBasis.do";
	// URL = contextPath + "/inventorymanager/searchProductNames.do";
	$.ajax({
		type : "GET",
		url : URL,
		data : {
			searchName : name,
			categoryName : productCategory,
			subCategory : ""
		},
		beforeSend : function(xhr) {
			$("#loading").css("display", "block");
			$("#mainDiv").addClass("disabled");
		},
		success : function(result) {
			appendProductsBasedOnCategory(result, searchCategory);
			$("#loading").css("display", "none");
			$("#mainDiv").removeClass('disabled');
		},
		error : function() {
			alert("something went wrong");
			$("#loading").css("display", "none");
			$("#mainDiv").removeClass('disabled');
		}
	});
}

function appendProductsBasedOnCategory(productsList, searchCategory) {
	$("." + searchCategory).html('');
	var op = '';
	for (var i = 0; i < productsList.length; i++) {
		if (i == 0)
			op += '<li id="' + productsList[i].productId
					+ '"  class="selected" onclick=getId(this,"'
					+ searchCategory + '"); ><a>' + productsList[i].productName
					+ '</a></li>';
		else
			op += '<li id="' + productsList[i].productId
					+ '" onclick=getId(this,"' + searchCategory + '"); ><a>'
					+ productsList[i].productName + '</a></li>';
	}
	$("." + searchCategory).html(op);
	$("." + searchCategory).show();
}

/*
 * function appendProductsBasedOnCategory(productsList,searchCategory){
 * $("."+searchCategory).html(''); var op = ''; for(var i=0;i<productsList.length;i++){
 * if (i == 0) { op += '<li id="'+productsList[i].skuID+'"  class="selected" onclick=getId(this,"'+searchCategory+'"); ><a>'+productsList[i].description+'</a></li>';
 * }else op += '<li id="'+productsList[i].skuID+'" onclick=getId(this,"'+searchCategory+'"); ><a>'+productsList[i].description+'</a></li>'; }
 * $("."+searchCategory).html(op); $("."+searchCategory).show(); }
 */

/* offer code */
function viewOfferDetails(offerId) {
	var contextPath = $('#contextPath').val();
	//added by manasa
	var formData={}
	formData.storeLocation = $("#outletLocation").val();
	formData.offerStartDate = $("#from").val();
	formData.offerEndDate = $("#to").val();
	formData.searchCriteria = $("#searchOffers").val()
	var maxRecords = 10;
	if ($("#maxRecords").length > 0)
		maxRecords = $("#maxRecords").val();

	var offerStatusValue = "";
	if($("#offerStatusValue").length>0)
		offerStatusValue = $("#offerStatusValue").val();
	
	var zone = "";
	if($("#outletZone").length > 0)
		zone = $("#outletZone").val();


	var offerType = "";
	if($("#offerType").length > 0)
		offerType = $("#offerType").val();
	formData.maxRecords = maxRecords;
	var formData = JSON.stringify(formData);
	var URL = contextPath + "/dealsAndOffers/offerdetails.do";
	$.ajax({
		url : URL,
		data : {
			offerId : offerId,
			formData : formData,
			offerStatusValue :offerStatusValue,
			zone : zone,
			offerType : offerType
		},
		beforeSend : function(xhr) {
			$("#loading").css("display", "block");
			$("#mainDiv").addClass("disabled");
		},
		success : function(result) {
			// $("#right-side").html(result);
			$("#right-side").html(result);
			$("#offerStatusValue").val(offerStatusValue);
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

function editoffer(offerId) {
	var contextPath = $('#contextPath').val();
	debugger;
	var expandValue=$('#expandValue').val();
	var expandVisibilityValue=$('#expandVisibilityValue').val();
	var expandAuthValue=$('#expandAuthValue').val();
	
	if(expandValue==undefined)
		{
		expandValue="";
		}
	if(expandVisibilityValue==undefined)
	{
		expandVisibilityValue="";
	}
	if(expandAuthValue==undefined)
	{
		expandAuthValue="";
	}
	//added by manasa
	var formData={}
	 formData.offerLocation = $("#outletLocation").val();
	formData.startDateStr = $("#from").val();
	 formData.endDateStr = $("#to").val();
	 formData.searchCriteria = $("#searchOffers").val()
	 var maxRecords = 10;
   	if ($("#maxRecords").length > 0)
   		maxRecords = $("#maxRecords").val();
   	formData.maxRecords = maxRecords;
   	
   	var offerStatusValue = "";
	  if($("#offerStatusValue").length>0)
		  offerStatusValue = $("#offerStatusValue").val();
	  var zone = "";
	  if($("#outletZone").length > 0)
	  	zone = $("#outletZone").val();
	  
	
	  var offerType = "";
	  if($("#offerType").length > 0)
		  offerType = $("#offerType").val();
	  
	  
	 var formData = JSON.stringify(formData);
	
	
	var URL = contextPath + "/dealsAndOffers/editoffer.do";
	$.ajax({
		url : URL,
		data : {
			offerId : offerId,
			expandValue : expandValue,
			expandVisibilityValue : expandVisibilityValue,
			formData : formData,
			expandAuthValue : expandAuthValue,
			offerStatusValue : offerStatusValue,
			zone : zone,
			offerType : offerType
			
		},
		beforeSend : function(xhr) {
			$("#loading").css("display", "block");
			$("#mainDiv").addClass("disabled");
		},
		success : function(result) {
			// $("#right-side").html(result);
			$("#right-side").html(result);
			$("#offerStatusValue").val(offerStatusValue);
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

/*
 * var offercount = 0; function addOfferSlab(){ var contextPath =
 * $("#contextPath").val(); offercount = offercount+1; var value =
 * "range"+offercount; $("#slabsList") .append( '<tr id=' + value + '><td style="width: 10%;display:none;"><span
 * id ='+"'"+value+"rangename'"+'>' + value + '</span></td>' +'<td style="width: 15%"><input
 * class="form-control" onblur="textBoxColor(this)" type="text" value="0"
 * name="category_name" id ='+"'"+value+"minquantity'"+ 'oninput="this.value =
 * this.value.replace(/[^0-9]/g, \'\'); this.value =
 * this.value.replace(/(\..*)\/g, \'$1\');"' + '/></td>' +'<td style="width: 15%"><input
 * class="form-control" onblur="textBoxColor(this)" type="text" value="0"
 * name="category_name" id ='+"'"+value+"minamount'"+ 'oninput="this.value =
 * this.value.replace(/[^0-9]/g, \'\'); this.value =
 * this.value.replace(/(\..*)\/g, \'$1\');"' + ' /></td>' +'<th style="width: 15%"><input
 * class="form-control" onblur="textBoxColor(this)" type="text"
 * name="category_name" id ='+"'"+value+"offerqty'"+' onkeyUp
 * ="adddealquantity('+"'"+value+"dealquantity'"+','+"'"+value+"'"+')"/></th>' +'<td style="width: 15%"><input
 * class="form-control" onblur="textBoxColor(this)" type="text"
 * name="category_name" id ='+"'"+value+"rewardvalue'"+ 'oninput="this.value =
 * this.value.replace(/[^0-9.]/g, \'\'); this.value =
 * this.value.replace(/(\..*)\/g, \'$1\');"' + '/></td>' +'<td style="width: 15%"><input
 * class="form-control" onblur="textBoxColor(this)" type="text"
 * name="category_name" id ='+"'"+value+"description'"+'/></td>' +'<td style="width: 5%"><img
 * src='+contextPath+'/images/addslab.png style=" width: 33px;cursor: pointer;"
 * onclick="addOfferSlab()" > <img src='+contextPath+'/images/itemdelete1.png
 * style=" width: 24px;cursor: pointer;" onclick="removeSlab(' + "'range" +
 * offercount + "'" + ')"></td></tr>'); }
 */

var newcount = $("#slabsList tr").length - 1;
function addOfferSlab() {
	
	
	/*var slNo = 1; 
	 $('.slno').each(function(){
		$(this).text(slNo);
		slNo = parseInt(slNo) + 1;
	});*/
	
	debugger;
	var priceBased=$("#priceBasedConfigurationGroup").prop("checked");
	var applylitems=$("#applyForAllItemsGroup").prop("checked");
	newcount = newcount + 1;
	var currentDealSlabDivContent = dealSlabDivContent;
	currentDealSlabDivContent = currentDealSlabDivContent.replace('range1',
			'range' + newcount);
	currentDealSlabDivContent = currentDealSlabDivContent.replace(
			'selected1groupId', 'selected' + newcount + 'groupId');
	currentDealSlabDivContent = currentDealSlabDivContent.replace('1groupId',
			newcount + 'groupId');
	currentDealSlabDivContent = currentDealSlabDivContent.replace('1groupId',
			newcount + 'groupId');
	currentDealSlabDivContent = currentDealSlabDivContent.replace('1itemId',
			newcount + 'itemId');
	currentDealSlabDivContent = currentDealSlabDivContent.replace('1itemId',
			newcount + 'itemId');
	currentDealSlabDivContent = currentDealSlabDivContent.replace(
			'selected1itemId', 'selected' + newcount + 'itemId');
	currentDealSlabDivContent = currentDealSlabDivContent.replace(
			'pluCode1itemId', 'pluCode' + newcount + 'itemId');
	currentDealSlabDivContent = currentDealSlabDivContent.replace('1rangename',
			newcount + 'rangename');
	currentDealSlabDivContent = currentDealSlabDivContent.replace(
			'1minquantity', newcount + 'minquantity');
	currentDealSlabDivContent = currentDealSlabDivContent.replace('1minamount',
			newcount + 'minamount');
	currentDealSlabDivContent = currentDealSlabDivContent.replace(
			'1rangeRewardType', newcount + 'rangeRewardType');
	currentDealSlabDivContent = currentDealSlabDivContent.replace(
			'1rewardvalue', newcount + 'rewardvalue');
	currentDealSlabDivContent = currentDealSlabDivContent.replace(
			'1rewardQuantity', newcount + 'rewardQuantity');
	currentDealSlabDivContent = currentDealSlabDivContent.replace('1rangeMode',
			newcount + 'rangeMode');
	currentDealSlabDivContent = currentDealSlabDivContent.replace(
			'1description', newcount + 'description');
	
	currentDealSlabDivContent = currentDealSlabDivContent.replace(
			'1startPrice', newcount + 'startPrice');
	currentDealSlabDivContent = currentDealSlabDivContent.replace(
			'1endPrice', newcount + 'endPrice');
	
	
	currentDealSlabDivContent = currentDealSlabDivContent.replace('range1',
			'range' + newcount);
	
	
	
	
	
	
	/*var len = $("#slabsList tr").length - 1;
//	offerSlabs=[];
    for(var i=1;i<=len;i++){
	 var idAttr = $("#slabsList tr:eq("+i+")").attr("id").replace("range",'');
	$("#"+idAttr+"groupId").val(id);
    }*/
	
	//debugger
	$("#slabsList tbody").append(currentDealSlabDivContent);
	if (!$("#lowestPriceItem").prop("checked")
			&& !$("#isCombo").prop("checked")) {
		$("#" + newcount + "rewardQuantity").val('0');
		$("#" + newcount + "rewardQuantity").attr("readonly", "readonly");
		$("#" + newcount + "rangeMode").val("both");
		$("#" + newcount + "rangeMode").prop("disabled", "disabled");
		//$("#" + newcount + "startPrice").removeAttr("disabled");
		//$("#" + newcount + "endPrice").removeAttr("disabled");
		//$("#" + newcount + "itemIdgroup").attr("disabled","disabled");
		//$("#" + newcount + "minquantity").attr("disabled","disabled");
		//$("#" + newcount + "minamount").attr("disabled","disabled");
		
		var groupId = $("#selected1groupId").val();
		$("#"+newcount+"groupId").val(groupId);
		$("#selected"+newcount+"groupId").val(groupId);
		
	var rewardCriteriaGroup=$("#offerRewardCriteriaGroup").val();
	
			
		if(rewardCriteriaGroup=="false" && applylitems==true)
		{
		$("#" + newcount + "itemIdgroup").attr("disabled","disabled");
		$("#" + newcount + "minquantity").attr("disabled","disabled");
		$("#" + newcount + "minamount").attr("disabled","disabled");
		$("#" + newcount + "startPrice").removeAttr("disabled");
		$("#" + newcount + "endPrice").removeAttr("disabled");
		$("#" + newcount + "groupId").attr("disabled","disabled");
		}
		if(rewardCriteriaGroup=="true" && applylitems==false){
			$("#" + newcount + "itemIdgroup").attr("disabled","disabled");
			$("#" + newcount + "minquantity").attr("disabled","disabled");
			$("#" + newcount + "minamount").attr("disabled","disabled");
			$("#" + newcount + "groupId").removeAttr("disabled");
			$("#" + newcount + "startPrice").removeAttr("disabled");
			$("#" + newcount + "endPrice").removeAttr("disabled");
	}
		if(rewardCriteriaGroup=="false" && applylitems==false)
		{
			$("#" + newcount + "minquantity").removeAttr("disabled");
			$("#" + newcount + "minamount").removeAttr("readonly");
			$("#" + newcount + "startPrice").attr("disabled","disabled");
			$("#" + newcount + "endPrice").attr("disabled","disabled");
		}
		
		if(rewardCriteriaGroup=="true" && applylitems==true)
		{
			
		$("#" + newcount + "itemIdgroup").attr("disabled","disabled");
		$("#" + newcount + "minquantity").attr("disabled","disabled");
		$("#" + newcount + "minamount").attr("disabled","disabled");
		$("#" + newcount + "startPrice").removeAttr("disabled");
		$("#" + newcount + "endPrice").removeAttr("disabled");
		$("#" + newcount + "groupId").removeAttr("disabled");
		}
		
	} else if ($("#isCombo").prop("checked")) {
		$("#" + newcount + "rewardQuantity").val('0');
		$("#" + newcount + "rewardQuantity").attr("readonly", "readonly");
		$("#" + newcount + "rangeMode").removeAttr("disabled");
		var groupId = $("#selected1groupId").val();
		$("#"+newcount+"groupId").val(groupId);
		$("#selected"+newcount+"groupId").val(groupId);
	} else if ($("#lowestPriceItem").prop("checked")) {
		$("#" + newcount + "rangeMode").removeAttr("disabled");
		$("#" + newcount + "rewardQuantity").removeAttr("readonly");
		var groupId = $("#selected1groupId").val();
		$("#"+newcount+"groupId").val(groupId);
		$("#selected"+newcount+"groupId").val(groupId);
	}
	
	
	
}



//added by manasa

var newcountProduct = $("#slabLis tr").length - 1;
function addProductOfferSlab() {
	debugger;
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
	var rewardValue=$("#offerRewardCriteria").val();	
	if(rewardValue=="true")//if(applylitems==true)
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
	
	
	
		/*if (rewardValue == "false") {
			//$("#minQtyProduct").attr("disabled", "disabled");
			$(".startPrice").attr("disabled","disabled");;
			$(".endPrice").attr("disabled","disabled");
			$(".minQtyProduct").removeAttr("disabled");
			$(".minAmtProduct").removeAttr("disabled");
		} else {
			$(".startPricePro").removeAttr("disabled");
			$(".endPricePro").removeAttr("disabled","disabled");
			$(".minQtyProduct").attr("disabled","disabled");
			$(".minAmtProduct").attr("disabled","disabled");
		
	}*/
		appendingbardTotable();
	
	
		/*if(priceBased==false && applylitems==true)
		{
		$("#" + newcountProduct + "itemIdProduct").attr("disabled","disabled");
		$("#" + newcountProduct + "minquantityProduct").attr("disabled","disabled");
		$("#" + newcountProduct + "minamountProduct").attr("disabled","disabled");
		$("#" + newcountProduct + "startPriceProduct").removeAttr("disabled");
		$("#" + newcountProduct + "endPriceProduct").removeAttr("disabled");
		}
		if(priceBased==true && applylitems==false){
			$("#" + newcountProduct + "itemIdProduct").attr("disabled","disabled");
			$("#" + newcountProduct + "minquantityProduct").attr("disabled","disabled");
			$("#" + newcountProduct + "minamountProduct").attr("disabled","disabled");
			$("#" + newcountProduct + "startPriceProduct").removeAttr("disabled");
			$("#" + newcountProduct + "endPriceProduct").removeAttr("disabled");
	}
		if(priceBased==false && applylitems==false)
		{
			$("#" + newcountProduct + "minquantityProduct").removeAttr("disabled");
			$("#" + newcountProduct + "minamountProduct").removeAttr("readonly");
			$("#" + newcountProduct + "startPriceProduct").attr("disabled","disabled");
			$("#" + newcountProduct + "endPriceProduct").attr("disabled","disabled");
		}
		
		if(priceBased==true && applylitems==true)
		{
			
		$("#" + newcountProduct + "itemId").attr("disabled","disabled");
		$("#" + newcountProduct + "minquantityProduct").attr("disabled","disabled");
		$("#" + newcountProduct + "minamountProduct").attr("disabled","disabled");
		$("#" + newcountProduct + "startPriceProduct").removeAttr("disabled");
		$("#" + newcountProduct + "endPriceProduct").removeAttr("disabled");
		//$("#" + newcount + "groupId").removeAttr("disabled");
		}*/
		
		
}




var newcountedit = $("#slabLis tr").length - 2;
function addEditProductOfferSlab() {
	debugger;
	var priceBased = $("#priceBasedConfigurationProduct").prop("checked");
	var applylitems = $("#applyForAllItemsProduct").prop("checked");
	newcountedit = newcountedit + 1;
	var currentDealSlabDivContent = editProductDealSlabDivContent;
	
	/*currentDealSlabDivContent = currentDealSlabDivContent.replace(
			'style="display: none;"', '');*/
	currentDealSlabDivContent = currentDealSlabDivContent.replace('productrange1',
			'productrange' + newcountedit);
	
	currentDealSlabDivContent = currentDealSlabDivContent.replace('selected1itemIdProduct',
			'selected'+newcountedit + 'itemIdProduct');
	
	currentDealSlabDivContent = currentDealSlabDivContent.replace('1rangenameProduct',
			newcountedit + 'rangenameProduct');
	currentDealSlabDivContent = currentDealSlabDivContent.replace(
			'1minquantityProduct', newcountedit + 'minquantityProduct');
	currentDealSlabDivContent = currentDealSlabDivContent.replace('1minamountProduct',
			newcountedit + 'minamountProduct');
	currentDealSlabDivContent = currentDealSlabDivContent.replace(
			'1rangeRewardTypeProduct', newcountedit + 'rangeRewardType');
	currentDealSlabDivContent = currentDealSlabDivContent.replace(
			'1rewardvalueProduct', newcountedit + 'rewardvalueProduct');
	currentDealSlabDivContent = currentDealSlabDivContent.replace(
			'1rewardQuantityProduct', newcountedit + 'rewardQuantityProduct');
	currentDealSlabDivContent = currentDealSlabDivContent.replace('1rangeModeProduct',
			newcountedit + 'rangeMode');
	
	currentDealSlabDivContent = currentDealSlabDivContent.replace(
			'1startPriceProduct', newcountedit + 'startPriceProduct');
	currentDealSlabDivContent = currentDealSlabDivContent.replace(
			'1endPriceProduct', newcountedit + 'endPriceProduct');
	
	
	$("#slabLis tbody").append(currentDealSlabDivContent);
	
	appendingbardTotable();
	
	
	if(applylitems==true)
	{
	$("#" + newcountProduct + "itemIdProduct").attr("disabled","disabled");
	$("#" + newcountProduct + "minquantityProduct").attr("disabled","disabled");
	$("#" + newcountProduct + "minamountProduct").attr("disabled","disabled");
	$("#" + newcountProduct + "startPriceProduct").removeAttr("disabled");
	$("#" + newcountProduct + "endPriceProduct").removeAttr("disabled");
	$(".startPricePro").val('0');
	$(".endPricePro").val('0');
	
	}
else
	{
	
	$("#" + newcountProduct + "minquantityProduct").removeAttr("disabled");
	$("#" + newcountProduct + "minamountProduct").removeAttr("readonly");
	$("#" + newcountProduct + "startPriceProduct").attr("disabled","disabled");
	$("#" + newcountProduct + "endPriceProduct").attr("disabled","disabled");
	$(".startPricePro").val('0');
	$(".endPricePro").val('0');
	
	
	}

		//$("#" + newcount + "rewardQuantity").val('0');
		//$("#" + newcount + "rewardQuantity").attr("readonly", "readonly");
		//$("#" + newcount + "rangeMode").val("both");
		//$("#" + newcount + "rangeMode").prop("disabled", "disabled");
		
	/*	if(priceBased==false && applylitems==true)
		{
		$("#" + newcountedit + "itemIdProduct").attr("disabled","disabled");
		$("#" + newcountedit + "minquantityProduct").attr("disabled","disabled");
		$("#" + newcountedit + "minamountProduct").attr("disabled","disabled");
		$("#" + newcountedit + "startPriceProduct").removeAttr("disabled");
		$("#" + newcountedit + "endPriceProduct").removeAttr("disabled");
		}
		if(priceBased==true && applylitems==false){
			$("#" + newcountedit + "itemIdProduct").attr("disabled","disabled");
			$("#" + newcountedit + "minquantityProduct").attr("disabled","disabled");
			$("#" + newcountedit + "minamountProduct").attr("disabled","disabled");
			$("#" + newcountedit + "startPriceProduct").removeAttr("disabled");
			$("#" + newcountedit + "endPriceProduct").removeAttr("disabled");
	}
		if(priceBased==false && applylitems==false)
		{
			$("#" + newcountedit + "minquantityProduct").removeAttr("disabled");
			$("#" + newcountedit + "minamountProduct").removeAttr("readonly");
			$("#" + newcountedit + "startPriceProduct").attr("disabled","disabled");
			$("#" + newcountedit + "endPriceProduct").attr("disabled","disabled");
		}
		
		if(priceBased==true && applylitems==true)
		{
			
		$("#" + newcountedit + "itemId").attr("disabled","disabled");
		$("#" + newcountedit + "minquantityProduct").attr("disabled","disabled");
		$("#" + newcountedit + "minamountProduct").attr("disabled","disabled");
		$("#" + newcountedit + "startPriceProduct").removeAttr("disabled");
		$("#" + newcountedit + "endPriceProduct").removeAttr("disabled");
		//$("#" + newcount + "groupId").removeAttr("disabled");
		}*/
		
		
}


var offerproductid = 0;
var offerSellPRoducts = [];
function addOfferProductId(materialName) {
	offerproductid = offerproductid + 1;
	$('#searchItems').val('');
	var contextPath = $("#contextPath").val();
	var remove = contextPath + "/images/itemdelete1.png";

	for (var id = 0; id < offerSellPRoducts.length; id++) {
		if (offerSellPRoducts[id] == materialName) {
			alert(offerSellPRoducts[id] + " product already added");
			return;
		}
	}
	$('#offerSaleProductsIds')
			.append(
					'<tr class='
							+ "'"
							+ offerproductid
							+ "buyProduct'"
							+ '><td style="font-size: 100%;"><span style="color: rgb(81, 93, 107)" id="buyProductname">'
							+ materialName
							+ '</span></td>'
							+ '<td class="price" style="font-size: 100%;"><center><img src='
							+ remove
							+ ' style="cursor:pointer;" onclick="removeOfferSellProduct('
							+ "'" + offerproductid + "buyProduct'" + ',' + "'"
							+ materialName + "'" + ')"></center></td></tr>');
	offerSellPRoducts.push(materialName);
}
function removeOfferSellProduct(pid, productId) {
	remove(productId, offerSellPRoducts);
	$("." + pid).remove();
}
/* search product ids based on search */
function searchOfferSellProducts(name, searchCategory) {
	var contextPath = $("#contextPath").val();
	URL = contextPath + "/inventorymanager/searchdealProducts.do";
	$.ajax({
		type : "GET",
		url : URL,
		data : {
			searchName : name
		},
		beforeSend : function(xhr) {
			$("#loading").css("display", "block");
			$("#mainDiv").addClass("disabled");
		},
		success : function(result) {
			appendOfferProducts(result, searchCategory);
			$("#loading").css("display", "none");
			$("#mainDiv").removeClass('disabled');
		},
		error : function() {
			alert("something went wrong");
			$("#loading").css("display", "none");
			$("#mainDiv").removeClass('disabled');
		}
	});
}
/* append getting product detrails to datalist */
function appendOfferProducts(productsList, searchCategory) {

	$("." + searchCategory).html('');
	var op = '';
	for (var i = 0; i < productsList.length; i++) {

		if (i == 0) {
			op += '<li id="' + productsList[i].productId
					+ '"  class="selected" onclick=getId(this,"'
					+ searchCategory + '"); ><a>' + productsList[i].description
					+ '</a></li>';
		} else
			op += '<li id="' + productsList[i].productId
					+ '" onclick=getId(this,"' + searchCategory + '"); ><a>'
					+ productsList[i].description + '</a></li>';
	}
	$("." + searchCategory).html(op);
	$("." + searchCategory).show();
}

function getId(element, type) {
	debugger
	var id = $(element).attr("id");
	if (type == "offersellproducts"){
		addOfferProductId(id);
//	getAllBasedItemDetails(id);
	}
	else if (type == "offersellskus") {
		// var pluCode = $(element).children("input").val();
		// addOfferSkusToSellItem(id,pluCode);

		getItemDetails(id);
	} 
	else if (type == "offersellskusExclude") {
// for offers exclude items list
		getItemDetailsExclude(id);
	} 
	else if (type == "offersellskusAll") {
		//debugger
		// var pluCode = $(element).children("input").val();
		// addOfferSkusToSellItem(id,pluCode);
		addOfferProductId(id);
		//getAllBasedItemDetails(id);
	} 
	else if (type == "offersellskusgroup") {
		// var pluCode = $(element).children("input").val();
		// addOfferSkusToSellItem(id,pluCode);

		getGroupItemDetails(id);
	}
	else if (type == "editproductList")
		editaddOfferProductId(id);
	else if (type == "editOfferBuySkuList") {
		var pluCode = $(element).children("input").val();
		editaddOfferSkusToSellItem(id, pluCode);
	} else if (type == "saleGroup" || type == "dealGroup")
		addGroup(id, type);
	else if (type == "saleGroupSku" || type == "dealGroupSku" || type == "saleGroupSkuOffer") {
		var skuId = $("#" + id).children("input").val();
		//debugger
		addGroupSkuToTable(skuId, id, type);
	} else if (type == "searchProduct") {
		var productName = $("#" + id).children("a").text();
		$("#product").val(productName);
		$("#searchProduct").val(productName);
	} else if (type == "product") {
		var productName = $("#" + id).children("a").text();
		$("#product").val(productName);
		$("#searchProduct").val(productName);
	} else if (type.indexOf("groupId") > -1) {
		$("#" + type).val(id);
		$("#selected" + type).val(id);
	} else if (type.indexOf("itemId") > -1) {
		$("#" + type).val(id);
		$("#selected" + type).val(id);
		var pluCode = $(element).children("input").val();
		$("#pluCode" + type).val(pluCode);
	}
	$("." + type).hide();
	$("." + type).html("");
}

var offerSellSkus = [];
var offerskuid = 0;

function addOfferSkusToSellItem(materialName, pluCode) {
	/*
	 * offerskuid = offerskuid+1; $('#offersellskus').val(''); var contextPath =
	 * $("#contextPath").val(); var remove =
	 * contextPath+"/images/itemdelete1.png";
	 * 
	 * for(var id=0;id<offerSellSkus.length;id++){
	 * if(offerSellSkus[id]==materialName){ alert(offerSellSkus[id] +" product
	 * already added"); return; } }
	 * 
	 * $('#offerSaleSkus').append( '<tr class='+"'"+offerskuid+"offerSellSkus'"+'><td style="font-size: 100%;"><span
	 * style="color: rgb(81, 93, 107)">'+materialName+'</span></td>' +'<td class="price" style="font-size: 100%;"><center><img
	 * src='+remove+' style="cursor:pointer;"
	 * onclick="removeofferSaleSkus('+"'"+offerskuid+"offerSellSkus'"+','+"'"+materialName+"'"+')"></center></td></tr>');
	 * offerSellSkus.push(materialName);
	 */
	var flag = true;
	offerskuid = offerskuid + 1;
	$('#offersellskus').val('');
	var contextPath = $("#contextPath").val();
	var remove = contextPath + "/images/itemdelete1.png";
	$(".buyPluCode").each(function() {
		if ($(this).val() == pluCode) {
			alert(pluCode + " plu already added");
			flag = false;
			return;
		}
	});
	if (flag == true) {
		offerSellSkus.push(materialName);
		$('#offerSaleSkus')
				.append(
						'<tr class='
								+ "'"
								+ offerskuid
								+ "offerSellSkus'"
								+ '><td style="font-size: 100%;"><span style="color: rgb(81, 93, 107)">'
								+ materialName
								+ '</span></td>'
								+ '<td>'
								+ pluCode
								+ '</td><input type="hidden" class="buyPluCode" value="'
								+ pluCode
								+ '" />'
								+ '<td class="price" style="font-size: 100%;"><center><img src='
								+ remove
								+ ' style="cursor:pointer;" onclick="removeofferSaleSkus('
								+ "'" + offerskuid + "offerSellSkus'" + ','
								+ "'" + materialName + "'"
								+ ')"></center></td></tr>');
	}
}

function getItemDetails(skuId) {
	debugger
	var contextPath = $("#contextPath").val();
	var storeLocation =""
		if($("#offerLocation").val()!=null){
	    storeLocation = $("#offerLocation option:selected").text();
	if(storeLocation.indexOf(",")){
		storeLocation = $("#offerLocation").val().toString();
	}
		}
	
	
	
	/*
	 * 
	 * 
	 var allLocationsList = [];
	 var length = $('#offerLocation').children('option').length;
	 console.log(length)
      	$('#offerLocation option:selected').each(function() { 
      		allLocationsList.push( $(this).attr('value'));
      	   
      	});
		 var  storeLocation="";
	      	for(i=0;i<allLocationsList.length;i++)
	      		{
	      		storeLocation =storeLocation+ allLocationsList[i]+',';
	      		}*/
	
	URL = contextPath + "/inventorymanager/getSkuDetailsForOffeers.do";
	$.ajax({
		type : "GET",
		url : URL,
		data : {
			skuId : skuId,
			storeLocation : storeLocation
		},
		beforeSend : function(xhr) {
			$("#loading").css("display", "block");
			$("#mainDiv").addClass("disabled");
		},
		success : function(result) {
			debugger
//			if(result!=null)
//			alert(result)
			if(result == null || result == "")
				{
					//$("#Error").html("N");
					$("#Error").html("No Records Found");
				    $('html, body').animate({
				        scrollTop: $("#Error").offset().top
				    }, 10);
					
					
					$("#loading").css("display", "none");
					$("#mainDiv").removeClass('disabled');
					return;
				}
			else
			appendproductDetails(result);
			$("#loading").css("display", "none");
			$("#mainDiv").removeClass('disabled');
		},
		error : function() {
			alert("something went wrong");
			$("#loading").css("display", "none");
			$("#mainDiv").removeClass('disabled');
		}
	});
}

function getItemDetailsExclude(skuId) {
	debugger
	var contextPath = $("#contextPath").val();
	var storeLocation =""
		if($("#offerLocation").val()!=null){
	    storeLocation = $("#offerLocation option:selected").text();
	if(storeLocation.indexOf(",")){
		storeLocation = $("#offerLocation").val().toString();
	}
		}
	URL = contextPath + "/inventorymanager/getSkuDetailsForOffeers.do";
	$.ajax({
		type : "GET",
		url : URL,
		data : {
			skuId : skuId,
			storeLocation : storeLocation
		},
		beforeSend : function(xhr) {
			$("#loading").css("display", "block");
			$("#mainDiv").addClass("disabled");
		},
		success : function(result) {
			if(result == null || result == "")
				{
					//$("#Error").html("N");
					$("#Error").html("No Records Found");
				    $('html, body').animate({
				        scrollTop: $("#Error").offset().top
				    }, 10);
					
					
					$("#loading").css("display", "none");
					$("#mainDiv").removeClass('disabled');
					return;
				}
			else
			appendproductDetailsExclude(result);
			$("#loading").css("display", "none");
			$("#mainDiv").removeClass('disabled');
		},
		error : function() {
			alert("something went wrong");
			$("#loading").css("display", "none");
			$("#mainDiv").removeClass('disabled');
		}
	});
}



var warehouseskumaster = null;
function appendproductDetails(skuDetails){
	 debugger
	 
	 var parsedJson = jQuery.parseJSON(skuDetails);
		$("#searchItems").val("");
		skuList = parsedJson.skuDetails.skuPriceLists;
		//skuList = parsedJson.skuLists;
		
		
		
		//written by manasa
		//purpose:to get track item when we call warehouse location
		
		if(skuList.length >1){
			var priceLength = skuList.length;
			var priceArray = [];
			$("#itemsList tbody").html("");
			for(var i=0; i<priceLength; i++){
				
				var price = skuList[i].costPrice;
				if (! $.inArray(price, priceArray) > -1)
				{
				if(i==0)
					{
						priceArray.push(price);
						var row = '<tr id=price'+i+' style="margin-top:5px;cursor:pointer;white-space: nowrap;"  ><td><input type="checkbox" name="selectall" class="selectableCheckbox" id="selectall" value='+i+' /></td><td>'+skuList[i].description+'</td><td>'+skuList[i].costPrice+'</td><td>'+skuList[i].measureRange+'</td><td>'+skuList[i].productRange+'</td><td>'+skuList[i].color+'</td><td>'+skuList[i].size+'</td></tr>';
						//'<li id="'+productsList[i].skuID+'"  class="selected" onclick=getId(this,"'+searchCategory+'"); ><a>'+productsList[i].description+'   -   '+productsList[i].skuID+'</a></li>';
						$("#itemsList tbody").append(row);
					}
				else
					{
						if(skuList[0].pluCode!=skuList[i].pluCode)
							{
								priceArray.push(price);
								var row = '<tr id=price'+i+' style="margin-top:5px;cursor:pointer;white-space: nowrap;"  ><td><input type="checkbox" name="selectall" class="selectableCheckbox" id="selectall" value='+i+' /></td><td>'+skuList[i].description+'</td><td>'+skuList[i].costPrice+'</td><td>'+skuList[i].measureRange+'</td><td>'+skuList[i].productRange+'</td><td>'+skuList[i].color+'</td><td>'+skuList[i].size+'</td></tr>';
								//'<li id="'+productsList[i].skuID+'"  class="selected" onclick=getId(this,"'+searchCategory+'"); ><a>'+productsList[i].description+'   -   '+productsList[i].skuID+'</a></li>';
								$("#itemsList tbody").append(row);
							}
					}
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

function appendproductDetailsExclude(skuDetails){
	 debugger
	 
	 var parsedJson = jQuery.parseJSON(skuDetails);
		$("#searchItems").val("");
		skuList = parsedJson.skuDetails.skuPriceLists;
		
		
		//written by manasa
		//purpose:to get track item when we call warehouse location
		
		if(skuList.length >1){
			var priceLength = skuList.length;
			var priceArray = [];
			$("#itemsListExclude tbody").html("");
			for(var i=0; i<priceLength; i++){
				
				
				var price = skuList[i].costPrice;
				if (! $.inArray(price, priceArray) > -1)
				{
					if(i==0)
					{
						priceArray.push(price);
						var row = '<tr id=price'+i+' style="margin-top:5px;cursor:pointer;white-space: nowrap;"  ><td><input type="checkbox" name="selectall" class="selectableCheckbox" id="selectall" value='+i+' /></td><td>'+skuList[i].description+'</td><td>'+skuList[i].costPrice+'</td><td>'+skuList[i].measureRange+'</td><td>'+skuList[i].productRange+'</td><td>'+skuList[i].color+'</td><td>'+skuList[i].size+'</td></tr>';
						//'<li id="'+productsList[i].skuID+'"  class="selected" onclick=getId(this,"'+searchCategory+'"); ><a>'+productsList[i].description+'   -   '+productsList[i].skuID+'</a></li>';
						$("#itemsListExclude tbody").append(row);
					}
				else
					{
						if(skuList[0].pluCode!=skuList[i].pluCode)
							{
							priceArray.push(price);
							var row = '<tr id=price'+i+' style="margin-top:5px;cursor:pointer;white-space: nowrap;"  ><td><input type="checkbox" name="selectall" class="selectableCheckbox" id="selectall" value='+i+' /></td><td>'+skuList[i].description+'</td><td>'+skuList[i].costPrice+'</td><td>'+skuList[i].measureRange+'</td><td>'+skuList[i].productRange+'</td><td>'+skuList[i].color+'</td><td>'+skuList[i].size+'</td></tr>';
							//'<li id="'+productsList[i].skuID+'"  class="selected" onclick=getId(this,"'+searchCategory+'"); ><a>'+productsList[i].description+'   -   '+productsList[i].skuID+'</a></li>';
							$("#itemsListExclude tbody").append(row);
							}
					}
				}
			}
			var  op = '<a id="selectPriceExclude"  data-toggle="modal" data-target="#items-modal-exclude"></a>';
			 $("#triggerEventExclude").append(op);
			 $("#selectPriceExclude" ).trigger( "click" );
			 $("#triggerEventExclude").html("");
		}
		else{
			addSkuExclude(skuList[0]);
		}
		
}

function getItemPrice(ele){
	 debugger;
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
	addItem(skuList[id]);*/
}

function getItemPriceExclude(ele){
	 debugger;
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
	    		addSkuExclude(skuList[$(this).val()]);
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

/*function getAllBasedItemDetails(skuId) {
	var contextPath = $("#contextPath").val();
	var storeLocation = $("#warehouse_location option:selected").text();
	URL = contextPath + "/inventorymanager/getSkuDetails.do";
	$.ajax({
		type : "GET",
		url : URL,
		data : {
			skuId : skuId,
			storeLocation : storeLocation
		},
		beforeSend : function(xhr) {
			$("#loading").css("display", "block");
			$("#mainDiv").addClass("disabled");
		},
		success : function(result) {
			//for(var i=0;i<result.length;i++){
			appendAllBasedproductDetails(result);
		//	}
			$("#loading").css("display", "none");
			$("#mainDiv").removeClass('disabled');
		},
		error : function() {
			alert("something went wrong");
			$("#loading").css("display", "none");
			$("#mainDiv").removeClass('disabled');
		}
	});
}*/

function getGroupItemDetails(skuId) {
	var contextPath = $("#contextPath").val();
	//var storeLocation = $("#warehouse_location option:selected").text();
	
	var storeLocation =""
		if($("#offerLocation").val()!=null){
	    storeLocation = $("#offerLocation option:selected").text();
	if(storeLocation.indexOf(",")){
		storeLocation = $("#offerLocation").val().toString();
	}
		}
		
		 var WarehouseReturnflag=$("#whreturnflag").val();
		if(WarehouseReturnflag == "" || WarehouseReturnflag == undefined || WarehouseReturnflag == null){
			WarehouseReturnflag="";
   		}
	
	URL = contextPath + "/inventorymanager/getSkuDetails.do";
	$.ajax({
		type : "GET",
		url : URL,
		data : {
			skuId : skuId,
			storeLocation : storeLocation,
			WarehouseReturnflag:WarehouseReturnflag
		},
		beforeSend : function(xhr) {
			$("#loading").css("display", "block");
			$("#mainDiv").addClass("disabled");
		},
		success : function(result) {
			appendGroupproductDetails(result);
			$("#loading").css("display", "none");
			$("#mainDiv").removeClass('disabled');
		},
		error : function() {
			alert("something went wrong");
			$("#loading").css("display", "none");
			$("#mainDiv").removeClass('disabled');
		}
	});
}





function addSku(skuList) {
	debugger
	
	if(skuList=="" || skuList == null)
		{
		alert("there is no data")
	return;
		}
//	var parsedJson = jQuery.parseJSON(skuDetails);
	
	// $("#searchItems").val("");
	
//	skuList = parsedJson.skuLists;

	if(skuList.productCategory == null)
		skuList.productCategory = "";
	var model = skuList.model;
	if(skuList.model == "" || skuList.model == null)
		skuList.model = "_";
//	var department = skuList.department;
	if(skuList.department == null)
		skuList.department = "";
//	var subCategory = skuList.subCategory;
	if(skuList.subCategory == null)
		skuList.subCategory = "";
	
//	var section = skuList.section;
	if(skuList.section == null)
		skuList.section = "";
		//added by Manoj to get remove null
	if(skuList.ean == null || skuList.ean == undefined)
		skuList.ean = "";
	if(skuList.size == null || skuList.size == undefined)
		skuList.size = "";
	if(skuList.price == null || skuList.price == "")
		skuList.price = 0;
	
	var flag = true;
	// offerskuid = offerskuid + 1;
	$('#offersellskus').val('');
	var contextPath = $("#contextPath").val();
	var remove = contextPath + "/images/itemdelete1.png";
	
	

	/*
	$(".buyPluCode").each(function() {
		if ($(this).val() == skuList.pluCode) {
			alert(skuList.pluCode + " item already added");
			flag = false;
			return;
		}
	});*/

	var len = parseInt($("#offerSaleSkusProduct tr").length);
	if (len != 1)
		len = parseInt($("#offerSaleSkusProduct tr:last").attr("id").replace(
				'dynamicdiv', '')) + 1;

	
	for (var i = 1; i <= len; i++) {
		if ($("#pluCode" + i).val() == skuList.pluCode) {
			alert("Item Already Added");
			return;
		}
	}
	
	
	var slNo = 1;
	$('.slno').each(function() {
		$(this).text(slNo);
		slNo = parseInt(slNo) + 1;
	});

	var test = "this.value=this.value.replace(/[^0-9.]/g,'');";
	var test1 = "this.value=this.value.replace(/(\..*)\./g,'$1');";
	if (flag == true) {

		$('#offerSaleSkusProduct tbody')
				.append(
						"<tr id='dynamicdiv" + len+ "' style='margin-top:5px;'>" +
					    "<td class='slno' id='itemno"+ len+ "'>"+ slNo+ "</td>"+
						"<input type='hidden' id='pluCode"+len+"' value='"+skuList.pluCode+"'/>" +
				 		"<input type='hidden' id='category"+len+"' value='"+skuList.category+"'/>" +
				 		"<input type='hidden' id='subCategory"+len+"' value='"+skuList.subCategory+"'/>" +
				 		"<input type='hidden' id='department"+len+"' value='"+skuList.department+"'/>" +
						"<input type='hidden' id='brandCode"+len+"' value='"+skuList.brandCode+"'/>" +
						"<input type='hidden' id='modal"+len+"' value='"+skuList.model+"'/>" +
						"<input type='hidden' id='section"+len+"' value='"+skuList.section+"'/>" +
						 "<td id='itemCode"+ len+ "'>"+ skuList.skuId+ "</td>"+
						 "<td id='itemDesc"+ len+ "'>"+ skuList.description+ "</td>"+
						 "<td id='ean"+ len+ "'>"+ skuList.ean+ "</td><input type='hidden' class='buyPluCode' value='"+ skuList.pluCode+ "' />"+
						 "<td id='size"+ len+ "'>"+ skuList.size+ "</td>"+
						 "<td id='mrp"+ len+ "'>"+ skuList.price+ "</td>"+
						 "<td ><input style='width: 85%;text-align:center' type='text' id='minQty"+ len+"' class='minQty'></td>"+
						 "<td><select  style='height: 27px;width: 128px;' name='dealStatus' class='dealStatus'   onchange='changeRewardQty(this);' id='dealStatus"+len+"'><option value=''>--Select--</option><option value='fixed_rate'>Fixed Rate</option><option value='flat_rate'>Cash Flat</option><option value='percentage'>Cash Discount</option><option value='qty_specific_cash_discount'>Qty Specific Cash Discount</option><option value='loyaltypoints'>Loyalty Points</option><option value='giftvouchers'>Gift Vouchers</option><option value='quantity'>Quantity</option></select></td>"+
						 "<td ><input style='width: 85%;text-align:center' type='text' disabled='disabled'  id='rewardQtyProduct"+ len+"' class='rewardQtyProduct'></td>"+
						 "<td ><input style='width: 85%;text-align:center' type='text' id='amount"+ len+"' class='amount' oninput="+ test+ " oninput="+ test1+ "></td>"+
						 "<td id='Del"+ len+ "' style='width: 8%'><center><img id='Img"+ len+ "' src="+ remove+ " style='cursor:pointer; height: 18px;' onclick='deleteItem1(this);' title='Delete "+ skuList.pluCode + "'/></center></td></tr>");

		/*
		 * '<tr class=' + "'" + offerskuid + "offerSellSkus'" + '><td>' +
		 * offerSellSkus.length + '</td>' +'<td style="font-size: 100%;"><span
		 * style="color: rgb(81, 93, 107)">' + skuList[0].skuId + '</span></td>' + '<td>' +
		 * skuList[0].description + '</td>' +'<td>' + skuList[0].pluCode + '</td><input
		 * type="hidden" class="buyPluCode" value="' + skuList[0].pluCode + '"
		 * />' +'<td>' + skuList[0].size + '</td>' +'<td><select class=""
		 * style="height: 27px;" name="dealStatus" id="dealStatus" >' +'<option
		 * value="">--Select--</option>' +'<option value="fixed_rate">Fixed
		 * Rate</option>' +'<option value="flat_rate">Cash Flat</option>' +'<option
		 * value="percentage">Cash Discount</option>' +'<option
		 * value="loyaltypoints">Loyalty Points</option>' +'<option
		 * value="giftvouchers">Gift Vouchers</option>' +'</select></td>' +'<td><input
		 * style="width: 85%;" type="number" class="" value="" />' + '</td>' + '<td class="price" style="font-size: 100%;"><center><img
		 * src=' + remove + ' style="cursor:pointer; height: 26px;"
		 * onclick="removeofferSaleSkus(' + "'" + offerskuid + "offerSellSkus'" +
		 * ',' + "'" + skuList[0].pluCode + "'" + ')"></center></td></tr>');
		 */

	}
}

function addSkuExclude(skuList) {
	//debugger
	
	if(skuList=="" || skuList == null)
		{
		alert("there is no data")
	return;
		}
//	var parsedJson = jQuery.parseJSON(skuDetails);
	
	// $("#searchItems").val("");
	
//	skuList = parsedJson.skuLists;

	
	
	
	if(skuList.productCategory == null)
		skuList.productCategory = "";
	var model = skuList.model;
	if(skuList.model == "" || skuList.model == null)
		skuList.model = "_";
//	var department = skuList.department;
	if(skuList.department == null)
		skuList.department = "";
//	var subCategory = skuList.subCategory;
	if(skuList.subCategory == null)
		skuList.subCategory = "";
	
//	var section = skuList.section;
	if(skuList.section == null)
		skuList.section = "";
	
	//added by Manoj to get remove null
	if(skuList.ean == null || skuList.ean == undefined)
		skuList.ean = "";
	if(skuList.measureRange == null || skuList.measureRange == undefined)
		skuList.measureRange = "";
	if(skuList.description == null || skuList.description == undefined)
		skuList.description = "";
	if(skuList.size == null || skuList.size == undefined)
		skuList.size = "";
	if(skuList.color == null || skuList.color == undefined)
		skuList.color = "";
	
	var flag = true;
	// offerskuid = offerskuid + 1;
	$('#offersellskus').val('');
	var contextPath = $("#contextPath").val();
	var remove = contextPath + "/images/itemdelete1.png";

	var len = parseInt($("#offerSaleSkusProductExclude tr").length);
	if (len != 1)
		len = parseInt($("#offerSaleSkusProductExclude tr:last").attr("id").replace(
				'dynamicdiv', '')) + 1;

	
	for (var i = 1; i <= len; i++) {
		if ($("#pluCode" + i).val() == skuList.pluCode) {
			alert("Item Already Added");
			return;
		}
	}
	
	
	var slNo = 1;
	$('.slno').each(function() {
		$(this).text(slNo);
		slNo = parseInt(slNo) + 1;
	});

	var test = "this.value=this.value.replace(/[^0-9.]/g,'');";
	var test1 = "this.value=this.value.replace(/(\..*)\./g,'$1');";
	if (flag == true) {

		$('#offerSaleSkusProductExclude tbody')
				.append(
						"<tr id='dynamicdiv" + len+ "' style='margin-top:5px;'><td class='slno' id='itemno"+ len+ "'>"+ slNo+ "</td>"+
						"<input type='hidden' id='pluCode"+len+"' value='"+skuList.pluCode+"'/>" +
				 		"<input type='hidden' id='category"+len+"' value='"+skuList.category+"'/>" +
				 		"<input type='hidden' id='subCategory"+len+"' value='"+skuList.subCategory+"'/>" +
				 		"<input type='hidden' id='department"+len+"' value='"+skuList.department+"'/>" +
						"<input type='hidden' id='brandCode"+len+"' value='"+skuList.brandCode+"'/>" +
						"<input type='hidden' id='modal"+len+"' value='"+skuList.model+"'/>" +
						"<input type='hidden' id='section"+len+"' value='"+skuList.section+"'/>" +
						 "<td id='itemCode"+ len+ "'>"+ skuList.skuId+ "</td>"+
						 "<td id='itemDesc"+ len+ "'>"+ skuList.description+ "</td>"+
						 "<td id='ean"+ len+ "'>"+ skuList.ean+ "</td><input type='hidden' class='buyPluCode' value='"+ skuList.pluCode+ "' />"+
						 "<td id='measureRange"+ len+ "'>"+ skuList.measureRange+ "</td>"+
						 "<td id='size"+ len+ "'>"+ skuList.size+ "</td>"+
						 "<td id='color"+ len+ "'>"+ skuList.color+ "</td>"+
						 "<td ><input style='width: 85%;text-align:center' type='text' id='amount"+ len+"' class='amount' oninput="+ test+ " oninput="+ test1+ "></td>"+
						 "<td id='Del"+ len+ "' style='width: 8%'><center><img id='Img"+ len+ "' src="+ remove+ " style='cursor:pointer; height: 18px;' onclick='deleteItem1(this);' title='Delete "+ skuList.pluCode + "'/></center></td></tr>");
	}
}


var newcount = $("#slabLis tr").length - 1;
function changeRewardQty(ele) {
	var id = $(ele).attr("id");
	//debugger
	id = id.replace('dealStatus', '');
	var discountStatus = $("#dealStatus"+id).val();
	var rewardQtyProduct = $("#rewardQtyProduct"+id).val();
	
	if(discountStatus == 'quantity'){
//	$("input.rewardQtyProduct"+id).removeAttr("readonly");
		$("#" + "amount"+ id ).attr("disabled", "disabled");
	$("#" + "rewardQtyProduct" + id).removeAttr("disabled");
	}
	else
		{
		$("#" + "amount" + id).removeAttr("disabled");
		$("#" + "rewardQtyProduct"+ id ).attr("disabled", "disabled");
	
		}
}
/*function appendAllBasedproductDetails(skuDetails) {
	//debugger
	var parsedJson = jQuery.parseJSON(skuDetails);
	// $("#searchItems").val("");
	//debugger
	skuList = parsedJson.skuLists;

	var flag = true;
	// offerskuid = offerskuid + 1;
	$('#offersellskus').val('');
	var contextPath = $("#contextPath").val();
	var remove = contextPath + "/images/itemdelete1.png";
	
	
	
	$(".buyPluCode").each(function() {
		if ($(this).val() == skuList[0].pluCode) {
			alert(skuList[0].pluCode + " plu already added");
			flag = false;
			return;
		}
	});

	var len = parseInt($("#offerSaleSkusProduct tr").length);
	if (len != 1)
		len = parseInt($("#offerSaleSkusProduct tr:last").attr("id").replace(
				'dynamicdiv', '')) + 1;

	var slNo = 1;
	$('.slno').each(function() {
		$(this).text(slNo);
		slNo = parseInt(slNo) + 1;
	});

	var test = "this.value=this.value.replace(/[^0-9.]/g,'');";
	var test1 = "this.value=this.value.replace(/(\..*)\./g,'$1');";
	if (flag == true) {

		$('#offerSaleSkusProduct tbody')
				.append(
						"<tr id='dynamicdiv" 
								+ len
								+ "' style='margin-top:5px;'><td class='slno' id='itemno"
								+ len
								+ "'>"
								+ slNo
								+ "</td>"
								+ "<td id='itemCode"
								+ len
								+ "'>"
								+ skuList[0].skuId
								+ "</td>"
								+ "<td id='itemDesc"
								+ len
								+ "'>"
								+ skuList[0].description
								+ "</td>"
								+ "<td id='ean"
								+ len
								+ "'>"
								+ skuList[0].ean
								+ "</td><input type='hidden' class='buyPluCode' value='"
								+ skuList[0].ean
								+ "' />"
								+ "<td id='size"
								+ len
								+ "'>"
								+ skuList[0].size
								+ "</td>"
								+ "<td id='itemRange"
								+ len
								+ "'><input style='width: 85%;' type='text' class='' oninput="
								+ test
								+ " oninput="
								+ test1
								+ "></td>"
								+ "<td><select class='' style='height: 27px;' name='dealStatus' id='dealStatus'>"
								+ "<option value=''>--Select--</option>"
								+ "<option value='fixed_rate'>Fixed Rate</option>"
								+ "<option value='flat_rate'>Cash Flat</option>"
								+ "<option value='percentage'>Cash Discount</option>"
								+ "<option value='loyaltypoints'>Loyalty Points</option>"
								+ "<option value='giftvouchers'>Gift Vouchers</option>"
								+ "</select></td>"

								+ "<td id='amount"
								+ len
								+ "'><input style='width: 85%;' type='text' class='amount' oninput="
								+ test
								+ " oninput="
								+ test1
								+ "></td>"
								+ "<td id='Del"
								+ len
								+ "' style='width: 6%'><center><img id='Img"
								+ len
								+ "' src="
								+ remove
								+ " style='cursor:pointer; height: 18px;' onclick='deleteItem1(this);' title='Delete "
								+ skuList[0].pluCode + "'/></center></td></tr>");

		
		 * '<tr class=' + "'" + offerskuid + "offerSellSkus'" + '><td>' +
		 * offerSellSkus.length + '</td>' +'<td style="font-size: 100%;"><span
		 * style="color: rgb(81, 93, 107)">' + skuList[0].skuId + '</span></td>' + '<td>' +
		 * skuList[0].description + '</td>' +'<td>' + skuList[0].pluCode + '</td><input
		 * type="hidden" class="buyPluCode" value="' + skuList[0].pluCode + '"
		 * />' +'<td>' + skuList[0].size + '</td>' +'<td><select class=""
		 * style="height: 27px;" name="dealStatus" id="dealStatus" >' +'<option
		 * value="">--Select--</option>' +'<option value="fixed_rate">Fixed
		 * Rate</option>' +'<option value="flat_rate">Cash Flat</option>' +'<option
		 * value="percentage">Cash Discount</option>' +'<option
		 * value="loyaltypoints">Loyalty Points</option>' +'<option
		 * value="giftvouchers">Gift Vouchers</option>' +'</select></td>' +'<td><input
		 * style="width: 85%;" type="number" class="" value="" />' + '</td>' + '<td class="price" style="font-size: 100%;"><center><img
		 * src=' + remove + ' style="cursor:pointer; height: 26px;"
		 * onclick="removeofferSaleSkus(' + "'" + offerskuid + "offerSellSkus'" +
		 * ',' + "'" + skuList[0].pluCode + "'" + ')"></center></td></tr>');
		 

	}
}
*/
function appendGroupproductDetails(skuDetails) {
	
	
	if(skuDetails=="")
	{
	alert("there is no data")
return;
	}
	
	var parsedJson = jQuery.parseJSON(skuDetails);
	// $("#searchItems").val("");
	//debugger
	skuList = parsedJson.skuLists;

	
	var brandCode = skuList[0].brandCode;
	if(brandCode == null)
		skuList[0].brandCode = "";
	var category = skuList[0].category;
	if(category == null)
		skuList[0].category = "";
	var model = skuList[0].model;
	if(model == "" || model == null)
		skuList[0].model = "_";
	var department = skuList[0].department;
	if(department == null)
		skuList[0].department = "";
	var subCategory = skuList[0].subCategory;
	if(subCategory == null)
		skuList[0].subCategory = "";
		//added by Manoj to get remove null
    if(skuList[0].ean == null || skuList[0].ean == undefined)
            skuList[0].ean = "";
    if(skuList[0].size == null || skuList[0].size == undefined)
            skuList[0].size = "";
    if(skuList[0].description == null || skuList[0].description == undefined)
            skuList[0].description = "";
	
	var flag = true;
	// offerskuid = offerskuid + 1;
	$('#offerSalegroupSkus').val('');
	var contextPath = $("#contextPath").val();
	var remove = contextPath + "/images/itemdelete1.png";

	$(".buyPluCode").each(function() {
		if ($(this).val() == skuList[0].pluCode) {
			alert(skuList[0].pluCode + " item already added");
			flag = false;
			return;
		}
	});
//debugger
	var len = parseInt($("#offerSalegroupSkus tr").length);
	if (len != 1)
		len = parseInt($("#offerSalegroupSkus tr:last").attr("id").replace('dynamicdiv', '')) + 1;

	var slNo = 1;
	$('.slno').each(function() {
		$(this).text(slNo);
		slNo = parseInt(slNo) + 1;
	});

	var test = "this.value=this.value.replace(/[^0-9.]/g,'');";
	var test1 = "this.value=this.value.replace(/(\..*)\./g,'$1');";
	if (flag == true) {

		$('#offerSalegroupSkus tbody')
				.append(
						"<tr id='dynamicdiv" + len+ "' style='margin-top:5px;'><td class='slno' id='itemno"+ len+ "'>"+ slNo+ "</td>"+
						"<input type='hidden' id='pluCode"+len+"' value='"+skuList[0].pluCode+"'/>" +
				 		"<input type='hidden' id='category"+len+"' value='"+skuList[0].category+"'/>" +
				 		"<input type='hidden' id='subCategory"+len+"' value='"+skuList[0].subCategory+"'/>" +
				 		"<input type='hidden' id='department"+len+"' value='"+skuList[0].department+"'/>" +
						"<input type='hidden' id='brandCode"+len+"' value='"+skuList[0].brandCode+"'/>" +
						"<input type='hidden' id='modal"+len+"' value='"+skuList[0].model+"'/>" + 
						"<td id='itemCode"+ len+ "'>"+ skuList[0].skuId+ "</td>"+
						  "<td id='itemDesc"+ len+ "'>"+ skuList[0].description+ "</td>"+
						  "<td id='ean"+ len+ "'>"+ skuList[0].ean+ "</td><input type='hidden' class='buyPluCode' value='"+ skuList[0].ean+ "' />"+
						  "<td id='size"+ len+ "'>"+ skuList[0].size+ "</td>"+
						  "<td ><input style='width: 85%;text-align:center' type='text' id='minQty"+ len+"' oninput="+ test+ "   oninput="+ test1+ " class='minQty'></td>"+
						  "<td><select  style='height: 27px;width:128px;' name='dealStatus"+len+"' id='dealStatus"+len+"'><option value=''>--Select--</option><option value='fixed_rate'>Fixed Rate</option><option value='flat_rate'>Cash Flat</option><option value='percentage'>Cash Discount</option><option value='loyaltypoints'>Loyalty Points</option><option value='giftvouchers'>Gift Vouchers</option></select></td>"+
						  "<td ><input style='width: 85%;' id='amount"+ len+"' type='text' class='amount' oninput="+ test+ " oninput="+ test1+ "></td>"+
						  "<td  id='Del"+len+"' style='width: 6%'><center><img id='Img"+ len+ "' src="+ remove+ " style='cursor:pointer; height: 18px;' onclick='deleteItem1(this);' title='Delete "+ skuList[0].pluCode + "'/></center></td></tr>");

		/*
		 * '<tr class=' + "'" + offerskuid + "offerSellSkus'" + '><td>' +
		 * offerSellSkus.length + '</td>' +'<td style="font-size: 100%;"><span
		 * style="color: rgb(81, 93, 107)">' + skuList[0].skuId + '</span></td>' + '<td>' +
		 * skuList[0].description + '</td>' +'<td>' + skuList[0].pluCode + '</td><input
		 * type="hidden" class="buyPluCode" value="' + skuList[0].pluCode + '"
		 * />' +'<td>' + skuList[0].size + '</td>' +'<td><select class=""
		 * style="height: 27px;" name="dealStatus" id="dealStatus" >' +'<option
		 * value="">--Select--</option>' +'<option value="fixed_rate">Fixed
		 * Rate</option>' +'<option value="flat_rate">Cash Flat</option>' +'<option
		 * value="percentage">Cash Discount</option>' +'<option
		 * value="loyaltypoints">Loyalty Points</option>' +'<option
		 * value="giftvouchers">Gift Vouchers</option>' +'</select></td>' +'<td><input
		 * style="width: 85%;" type="number" class="" value="" />' + '</td>' + '<td class="price" style="font-size: 100%;"><center><img
		 * src=' + remove + ' style="cursor:pointer; height: 26px;"
		 * onclick="removeofferSaleSkus(' + "'" + offerskuid + "offerSellSkus'" +
		 * ',' + "'" + skuList[0].pluCode + "'" + ')"></center></td></tr>');
		 */

	}
}




function deleteItem1(element) {
//debugger
	$(".Error").html("");
	var id = $(element).attr("id").replace('Img', '');
	var sku = $("#pluCode" + id).val();
	$('#dynamicdiv' + id).remove();
	var slNo = 1;
	$('.slno').each(function() {
		$(this).text(slNo);
		slNo = parseInt(slNo) + 1;
	});
}

function removeofferSaleSkus(pid, productId) {
	remove(productId, offerSellSkus);
	$("." + pid).remove();
}

/* global remove method */
function remove(id, array) {
	for (var i = 0; i < array.length; i++) {
		if (array[i] === id) {
			array.splice(i, 1);
		}
	}
}

function searchOfferBuySkus(name, searchCategory) {
	//debugger
	var productsarray = [];
	var contextPath = $("#contextPath").val();

	/*
	 * if(offerSellPRoducts.length ==0){ alert("Add One Product to Offer Sell
	 * Items");return; }
	 */
	productsarray = offerSellPRoducts;
	URL = contextPath + "/inventorymanager/searchskus.do";
	$.ajax({
		type : "GET",
		url : URL,
		data : {
			productsarray : productsarray.toString()
		},
		beforeSend : function(xhr) {
			$("#loading").css("display", "block");
			$("#mainDiv").addClass("disabled");
		},
		success : function(result) {
			appendOfferBuySkus(result, searchCategory);
			$("#loading").css("display", "none");
			$("#mainDiv").removeClass('disabled');
		},
		error : function() {
			alert("something went wrong");
			$("#loading").css("display", "none");
			$("#mainDiv").removeClass('disabled');
		}
	});
}



function searchAllBasedOfferBuySkus(name, searchCategory,productList) {
	//debugger
	var productsarray = [];
	var contextPath = $("#contextPath").val();

	/*
	 * if(offerSellPRoducts.length ==0){ alert("Add One Product to Offer Sell
	 * Items");return; }
	 */
	productsarray = offerSellPRoducts;
	URL = contextPath + "/inventorymanager/searchskus.do";
	$.ajax({
		type : "GET",
		url : URL,
		data : {
			productsarray : productsarray.toString()
		},
		beforeSend : function(xhr) {
			$("#loading").css("display", "block");
			$("#mainDiv").addClass("disabled");
		},
		success : function(result) {
			appendAllBasedOfferBuySkus(result,searchCategory,productList);
			//for (var i = 0; i < result.length; i++) {
			//getAllBasedItemDetails(result[i].skuId);
			//}
			$("#loading").css("display", "none");
			$("#mainDiv").removeClass('disabled');
		},
		error : function() {
			alert("something went wrong");
			$("#loading").css("display", "none");
			$("#mainDiv").removeClass('disabled');
		}
	});
}

function appendOfferBuySkus(productsList, searchCategory) {
	$("." + searchCategory).html('');
	var op = '';
	for (var i = 0; i < productsList.length; i++) {

		if (i == 0) {
			op += '<li id="' + productsList[i].skuID
					+ '"  class="selected" onclick=getId(this,"'
					+ searchCategory + '"); ><a>' + productsList[i].skuID
					+ '</a></li>';
		} else
			op += '<li id="' + productsList[i].skuID + '" onclick=getId(this,"'
					+ searchCategory + '"); ><a>' + productsList[i].skuID
					+ '</a></li>';
	}
	$("." + searchCategory).html(op);
	$("." + searchCategory).show();
}



function appendAllBasedOfferBuySkus(productsList, searchCategory,productList) {
	$("." + searchCategory).html('');
	//debugger
	var op = '';
	for (var i = 0; i < productsList.length; i++) {

		getAllBasedItemDetails(productList[i].productId)
		//getId( productsList[i].skuID,"'+ searchCategory + '");
		/*if (i == 0) {
			op += '<li id="' + productsList[i].skuID
					+ '"  class="selected" onclick=getId(this,"'
					+ searchCategory + '"); ><a>' + productsList[i].skuID
					+ '</a></li>';
		} else
			op += '<li id="' + productsList[i].skuID + '" onclick=getId(this,"'
					+ searchCategory + '"); ><a>' + productsList[i].skuID
					+ '</a></li>';
	}
	$("." + searchCategory).html(op);
	$("." + searchCategory).show();*/
}

}

function searchOfferProducts(name) {
	var contextPath = $("#contextPath").val();
	URL = contextPath + "/inventorymanager/searchProducts.do";
	$.ajax({
		type : "GET",
		url : URL,
		data : {
			searchName : name
		},
		beforeSend : function(xhr) {
			$("#loading").css("display", "block");
			$("#mainDiv").addClass("disabled");
		},
		success : function(result) {
			appendOfferedProducts(result);
			$("#loading").css("display", "none");
			$("#mainDiv").removeClass('disabled');

		},
		error : function() {
			alert("something went wrong");
			$("#loading").css("display", "none");
			$("#mainDiv").removeClass('disabled');

		}
	});
}
function appendOfferedProducts(productsList) {
	$("#offerproducts").html('');
	var op = '';
	for (var i = 0; i < productsList.length; i++) {
		op += '<option value="' + productsList[i].productId + '">'
				+ productsList[i].description + '</option>';
	}
	$("#offerproducts").html(op);
	$("#offerproducts").show();
}
var offerProductId = 0;
var offerProduct = [];
function addProductToOfferItem() {
	offerProductId = offerProductId + 1;
	var materialName = $('#offerProductId').val();
	$('#offerProductId').val('');
	$('#offerproducts').html('');
	var contextPath = $("#contextPath").val();
	var remove = contextPath + "/images/itemdelete1.png";
	saleProductId = materialName;
	for (var id = 0; id < offerProduct.length; id++) {
		if (offerProduct[id] == materialName) {
			alert(offerProduct[id] + " product already added");
			return;
		}
	}
	offerProduct.push(materialName);

	$('#offerProductsTable')
			.append(
					'<tr class='
							+ "'"
							+ offerProductId
							+ "dealProductId'"
							+ '><td style="font-size: 100%;"><span style="color: rgb(81, 93, 107)">'
							+ materialName
							+ '</span></td>'
							+ '<td class="price" style="font-size: 100%;"><center><img src='
							+ remove
							+ ' style="cursor:pointer;" onclick="removeOfferProductId('
							+ "'" + offerProductId + "dealProductId'" + ','
							+ "'" + materialName + "'"
							+ ')"></center></td></tr>');
}
function removeOfferProductId(pid, productId) {
	remove(productId, offerProduct);
	$("." + pid).remove();
}

function searchOfferSkus(name) {
	//debugger
	var productsarray = [];
	var contextPath = $("#contextPath").val();
	/*
	 * if(offerProduct.length == 0){ alert("select one Offer product"); return; }
	 */
	productsarray = offerProduct;
	URL = contextPath + "/inventorymanager/searchskus.do";
	$.ajax({
		type : "GET",
		url : URL,
		data : {
			productsarray : productsarray.toString()
		},
		beforeSend : function(xhr) {
			$("#loading").css("display", "block");
			$("#mainDiv").addClass("disabled");
		},
		success : function(result) {
			appendOfferSkus(result);
			$("#loading").css("display", "none");
			$("#mainDiv").removeClass('disabled');

		},
		error : function() {
			alert("something went wrong");
			$("#loading").css("display", "none");
			$("#mainDiv").removeClass('disabled');

		}
	});
}
function appendOfferSkus(productsList) {
	$("#offerskus").html('');
	var op = '';
	for (var i = 0; i < productsList.length; i++) {
		op += '<option value="' + productsList[i].skuID + '">'
				+ productsList[i].skuID + '</option>';
	}
	$("#offerskus").html(op);
	$("#offerskus").show();
}

var offerSkuID = 0;
var offerSkus = [];
function addSkuToDealItem() {
	offerSkuID = offerSkuID + 1;
	var materialName = $('#offerSkuId').val();
	$('#offerSkuId').val('');
	$('#offerskus').html('');
	var contextPath = $("#contextPath").val();
	var remove = contextPath + "/images/itemdelete1.png";
	saleSkuId = materialName;
	for (var id = 0; id < offerSkus.length; id++) {
		if (offerSkus[id] == materialName) {
			alert(offerSkus[id] + " product already added");
			return;
		}
	}
	offerSkus.push(materialName);

	$('#dealSkuTable')
			.append(
					'<tr class='
							+ "'"
							+ offerSkuID
							+ "dealSkuid'"
							+ '><td style="font-size: 100%;"><span style="color: rgb(81, 93, 107)">'
							+ materialName
							+ '</span></td>'
							+ '<td class="price" style="font-size: 100%;"><center><img src='
							+ remove
							+ ' style="cursor:pointer;" onclick="removeOfferSkuId('
							+ "'" + offerSkuID + "dealSkuid'" + ',' + "'"
							+ materialName + "'" + ')"></center></td></tr>');

}

function removeOfferSkuId(pid, productId) {
	remove(productId, offerSkus);
	$("." + pid).remove();
}
function loadOfferImageFileAsURL() {
	var filesSelected = document.getElementById("offerBanner").files;
	if (filesSelected.length > 0) {
		var fileToLoad = filesSelected[0];

		/*
		 * var fsize = $('#dealBanner')[0].files[0].type; alert(fsize);
		 */

		if (fileToLoad.type.match("image.*")) {
			var fileReader = new FileReader();

			fileReader.onload = function(fileLoadedEvent) {
				/* file size validation */
				/*
				 * var fsize = $('#dealBanner')[0].files[0].type; alert(fsize);
				 */

				var byteVal = fileLoadedEvent.target.result;
				var index = byteVal.indexOf(',');
				byteVal = byteVal.substring(index + 1);
				$("#offerbannerByte").val(byteVal);
				$("#viewOfferbannerImage").attr("src",
						fileLoadedEvent.target.result);

			};
			fileReader.readAsDataURL(fileToLoad);
		}
	}
}

function deletePic(id) {
	var k = confirm("Are you sure you want to Delete");
	if (k == true) {
		var fileControl = '<input type="file" id="offerBanner" name="offerBanner" onchange="loadImageFileAsURL('
				+ "'" + 'offerBanner' + "'" + ',this);" />';
		var $fileInput = $("#" + id);
		var $fileCopy = $(fileControl);
		$fileInput.replaceWith($fileCopy);
		$("#offerBannerLabel").after("<br>");
		$("#" + id + "_thumbnail").remove();
		$("#" + id + "_delImage").remove();
		$("#" + id + "_label").css("display", "block");
		// $("#picture"+id+"_byte").val('');
	}
}

function loadImageFileAsURL(id, ele) {
	$("#offerBannerErr").html("");
	if (ele.files && ele.files[0]) {
		var fileToLoad = ele.files[0];
		/*
		 * var fsize = $('#dealBanner')[0].files[0].type; alert(fsize);
		 */
		if (fileToLoad.type.match("image.*")) {
			var name = fileToLoad['name'];
			$("#" + id + "_name").val(name);
			var contextPath = $("#contextPath").val();
			var reader = new FileReader();
			reader.onload = function(e) {
				$("#" + id + "_label").css("display", "none");
				var byteVal = e.target.result;
				var index = byteVal.indexOf(',');
				byteVal = byteVal.substring(index + 1);
				$("#offerbannerByte").val(byteVal);
				$("#" + id + "_image")
						.append(
								'<img class="thumbnail" id="'
										+ id
										+ '_thumbnail" src='
										+ e.target.result
										+ ' style="width:80px;height:80px;"><img class="delImage" id="'
										+ id
										+ '_delImage" src="'
										+ contextPath
										+ '/images/deny.png" onclick=deletePic("'
										+ id + '"); >');
				$("#offerBannerLabel").siblings("br").remove();
				$("#offerBannerLabel").after("<br>");
			};
			reader.readAsDataURL(ele.files[0]);
		} else {
			$("#offerBannerErr").html("Please Select Image");
			return;
		}
		var oMyForm = new FormData();
		oMyForm.append("file", ele.files[0]);
		if ($("#offerBannerRefId").val() != "")
			oMyForm.append("refId", $("#offerBannerRefId").val().trim());
		else
			oMyForm.append("refId", "");
		var contextPath = $("#contextPath").val();
		var URL = contextPath + "/inventorymanager/addToAttachementList.do";
		$.ajax({
			// dataType : 'json',
			url : URL,
			data : oMyForm,
			type : "POST",
			enctype : 'multipart/form-data',
			processData : false,
			contentType : false,
			beforeSend : function(xhr) {
			},
			success : function(result) {
				$("#offerBannerRefId").val(result);
			},
			error : function() {
				alert("something went wrong");
			}
		});
	}
};

function parseDate(str) {
	var mdy = str.split('/');
	return new Date(mdy[0], mdy[1] - 1, mdy[2]);
}
function daydiff(first, second) {
	return (second - first) / (1000 * 60 * 60 * 24);
}

$("#offerName").keydown(function() {
	$("#offerNameErr").html("");
});
$("#offerLocation").change(function() {
	$("#Error").html("");
});
$("#saleCategory").change(function() {
	$("#Error").html("");
});
$("#searchItems").keydown(function() {
	$("#Error").html("");
});
$("#offersellskus").keydown(function() {
	$("#Error").html("");
});
$("#editproductList").keydown(function() {
	$("#Error").html("");
});
$("#editbuySkuList").keydown(function() {
	$("#Error").html("");
});
$("#saleGroup").keydown(function() {
	$("#Error").html("");
});
$("#saleGroupSkuSearch").keydown(function() {
	$("#Error").html("");
});


//modified by manasa 
function createOffer(){
	debugger;
	 var offerRanges={},offerSlabs=[],offerRangeDetails={},items=[],locItems=[];
	$("#Error").html("");
	if($("#offerName").val() == null || $("#offerName").val() ==""){
		$("#offerNameErr").html("Enter Offer Name");
		$("#offerName").focus();
		return;
	}
	var location = $("#offerLocation").val();
	/*if(location == null || location == "" || location == undefined){
		$("#Error").html("Please Select atleast one location");
		$("#offerLocation").focus();
		return;
	}*/
	
	
	
	if($("#offerStartDate").val() == ""){
		$("#offerStartDateError").html("Start Date Required");
		$("#offerStartDate").focus();
		return;
	}
	if($("#offerEndDate").val() == ""){
		$("#offerEndDateError").html("End Date Required");
		$("#offerEndDateError").focus();
//		$("#offerEndDate").focus();
		return;
	}
	 var dateTime = getCurrentDate();
	  var date = dateTime.split(' ');
	  date = date[0].split('/');
	  var formatedDate = date[2]+"/"+date[0]+"/"+date[1];
	  var noOfDays = daydiff(parseDate(formatedDate),parseDate($('#offerStartDate').val()));
	 if(noOfDays < 0){
		 $("#Error").html("Start Date should be Future Date");
		 focusDiv('Error');
		 return;
	 }
	/* noOfDays = daydiff(parseDate(formatedDate),parseDate($('#offerEndDate').val()));
	 if(noOfDays < 0){
		 $("#Error").html("End Date should be Future Date");
		 focusDiv('Error');
		 return;
	 }*/
	noOfDays = daydiff(parseDate($('#offerStartDate').val()), parseDate($('#offerEndDate').val()));
	 if(noOfDays < 0){
		 $("#Error").html("End Date can't be less than Start Date");
		 focusDiv('Error');
		 return;
	 }
	
	 //written by manasa to send multiple locations
   var loclen=$("#offerLocation").length;
	 
	var finalObj = {};
	var locDetails=[];
	if($("#offerLocation").val() != null){
		var locations = $("#offerLocation").val().toString().split(',');
		for(var i=0; i<locations.length; i++){
		//	lc = locations[i];
			obj = {"storeLocation":locations[i]};
			locDetails.push(obj);
		}
	}
	/*
	$("#offerLocation").each(function(){
		var obj = {locationsAll:$(this).val()};
		locationsAll.push(obj);
	});*/
	
	//finalObj.storeLocation = location;
	/*var itemLoc=[],loc=[];
	
	for(var i=1;i<=loclen;i++){
	var locobj={"storeLocation" : $("#offerLocation"+i).val()};
	itemLoc.push(locobj);
	}*/
	finalObj.offerLocationsList=locDetails;
	
	finalObj.offerName = $("#offerName").val();
	finalObj.couponProgramId = $("#CouponCodeforOffer").val();
	var billsPerDay = $("#billsPerDay").val();
	if (billsPerDay != "" && billsPerDay!=undefined && billsPerDay!=null) {
			finalObj.numberBillsPerDay = parseInt(billsPerDay);
		}
	
	var maxPrice = $("#maxPrice").val();
	if (maxPrice != "" && maxPrice!=undefined && maxPrice!=null) {
			finalObj.maxPrice = parseInt(maxPrice);
		}
	var minPrice = $("#minPrice").val();
	if (minPrice != "" && minPrice!=undefined && minPrice!=null) {
			finalObj.minPrice = parseInt(minPrice);
		}

	
	finalObj.offerCategory = $("#offercategory").val();
	finalObj.priority = $("#offerPriority").val();
//	finalObj.offerImage = $("#offerbannerByte").val();
	if($("#offerBannerRefId").val().trim() != "" && $("#offerBannerRefId").val() != null){
		finalObj.offerImageRef = $("#offerBannerRefId").val();
		finalObj.offerImage = $("#offerBanner_name").val();
	}
	if($("#offerBanner_thumbnail").length > 0)
		finalObj.offerImageFlag = "true";
	else
		finalObj.offerImageFlag = "false";
	
	
	var dateandTime = getCurrentDate();
	  var dateValue = dateandTime.split(' ');
	  var time = dateValue[1];
	  dateValue = dateValue[0].split('/');
	  var dateFormat = dateValue[1]+"/"+dateValue[0]+"/"+dateValue[2];
	
	  var createddate = dateFormat+' ' + time;
	finalObj.createdOnStr = createddate;
	
	finalObj.offerStartDate = $("#offerStartDate").val();
	
	finalObj.offerEndDate = $("#offerEndDate").val();
	finalObj.rewardType = $("#offerReward").val();
	finalObj.offerStatus = $('input[name=offerStatus]:checked').val();
	/*finalObj.customerspecificflag = $('input[name=isCustomerSpecific]:checked').val();*/
	finalObj.claimCoupons = $('input[name=coupons]:checked').val();
	finalObj.claimLoyaltypoints = $('input[name=loyaltyPoints]:checked').val();
	finalObj.claimgiftvouchers = $('input[name=giftvouchers]:checked').val();
	finalObj.offerDescription = $("#offerDesc").val();
	if(getFormData() == false)
		return;
	finalObj.customerFilter = getFormData();
	finalObj.offerImageText = $("#dealImageText").val();
	finalObj.offerImageTextFont = $("#dealImageTextFontHidden").val();
	finalObj.offerImageSize = $("#dealImageTextSize").val();
	finalObj.offerImageColor = $("#dealImageTextColor").val();
	if($("#dealImageBold").prop('checked') == true)
		finalObj.offerImageBold = 1;
	else
		finalObj.offerImageBold = 0;
	if($("#dealImageItalic").prop('checked') == true)
		finalObj.offerImageItalic = 1;
	else	
		finalObj.offerImageItalic = 0;
	if($("#dealImageStrike").prop('checked') == true)
		finalObj.offerImageStrike = 1;
	else
		finalObj.offerImageStrike = 0;
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
	
	finalObj.offerPriceText = $("#dealText").val();
	finalObj.offerPriceFont = $("#dealTextFontHidden").val();
	finalObj.offerPriceSize = $("#dealTextSize").val();
	finalObj.offerPriceColor = $("#dealTextColor").val();
	
	
	if($("#dealTextBold").prop('checked') == true)
		finalObj.offerPriceBold = 1;
	else
		finalObj.offerPriceBold = 0;
	if($("#dealTextItalic").prop('checked') == true)
		finalObj.offerPriceItalic = 1;
	else
		finalObj.offerPriceItalic = 0;
	if($("#dealTextStrike").prop('checked') == true)
		finalObj.offerPriceStrike = 1;
	else
		finalObj.offerPriceStrike = 0;
	
	if($("#startTime").val() == ""){
		$("#startTimeError").html("Enter Start Time");
		return;
	}
	finalObj.offerStartTimeStr = $("#startTime").val();
	if($("#endTime").val() == ""){
		$("#endTimeError").html("Enter End Time");
		return;
	}
	finalObj.offerEndTimeStr = $("#endTime").val();
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
	
	//written by manasa
	finalObj.allowReturns = $("#applyReturns").prop("checked");
	finalObj.salePriceBased = $("#applysaleprice").prop("checked");
	finalObj.allowExchanges = $("#applyExchanges").prop("checked");
	//debugger
	finalObj.lowestPriceItem = $("#lowestPriceItem").prop("checked");
	finalObj.productSpecificFlag = $('input[name=configureBased]:checked').val();
	
	//written by manasa to store the value of group/product
	if($("#basedOnGroup").is(':checked')){
		finalObj.productSpecificFlag="false"
	}
	else
		{
		finalObj.productSpecificFlag="true"
		}
	
	if($("#saleCategory").val() != undefined)
		finalObj.productCategory = $("#saleCategory").val();
	
	if($("#offercategory").val() == "item_specific" || $("#offercategory").val() == "turn_over" || $("#offercategory").val()=="category_turnover"){
		if($("#basedOnProduct").prop("checked") == true){
			if(offerSellPRoducts.length == 0 && offerSellSkus.length == 0  && $("#saleCategory").val() == "-- Select --"){
				$("#Error").html("Please Select Atleast Sale Product Category Or Sale Product Or Sale Sku");
				 focusDiv('Error');
				return;
			}
			
			
		if($("#saleCategory").val() != undefined)
		finalObj.productCategory = $("#saleCategory").val();
		if($("#sale_sub_category").val() != undefined)
		finalObj.productSubCategory = $("#sale_sub_category").val();
		if($("#saleCategory").val() != undefined)
		finalObj.productDepartment = $("#sale_department").val();
		if($("#sale_brand").val().trim() != undefined)
		finalObj.brand = $("#sale_brand").val();
		if($("#sale_section").val().trim() != undefined)
		finalObj.productSection = $("#sale_section").val();
			
			
			finalObj.sellProducts = offerSellPRoducts.toString();
			finalObj.sellSkuids = offerSellSkus.toString();
			var salePluCode = [];
			$('.buyPluCode').each(function(){
				salePluCode.push($(this).val());
			});
			

			//written by manasa
			if($("#itemDisountBased").is(':checked')){
				var len = $("#offerSaleSkusProduct tr").length-1;
				
				if(len == 0){
					alert("Add Atleast One item");
					return false;
					}
				for(var i=1;i<=len;i++){
					var idAttr = $("#offerSaleSkusProduct tr:eq("+i+") td:last").attr("id");
					idAttr = idAttr.replace('Del','');
			debugger
						var obj = {
								 "sno" : $("#itemno"+idAttr).text(),
								 "skuId" : $("#itemCode"+idAttr).text(),
								 "itemDesc" : $("#itemDesc"+idAttr).text(),
								 "rewardValue" : $("#amount"+idAttr).val(),
								 "size" : $("#size"+idAttr).text(),
								 "ean" : $("#ean"+idAttr).text(),
								 "discountType" :$('option:selected', $('#dealStatus'+idAttr)).val(),
								 "category" : $("#category"+idAttr).val(),
								 "subCategory" : $("#subCategory"+idAttr).val(),
								 "brand" : $("#brandCode"+idAttr).val(),
								 "model" : $("#modal"+idAttr).val(),
								 "plucode" : $("#pluCode"+idAttr).val(),
								 "minPurchaseQty" : $("#minQty"+idAttr).val(),
								 "rewardQty" : $("#rewardQtyProduct"+idAttr).val(),
								 "section" : $("#section"+idAttr).val(),
								 "department" : $("#department"+idAttr).val(),
								 "exclusionItem":false
									
								 
						 };
						items.push(obj);
						
					}
				finalObj.offerProducts=items
			}
			
		if($("#complexDisountBased").is(':checked')){		
		
			var saleCategory=$("#saleCategory").val();
			var sale_department=$("#sale_department").val();
			var sale_brand=$("#sale_brand").val();
			var CheckFlag=false;
			var ApplyForAll=$("#offercategory").val();
			if(saleCategory!="" && saleCategory!=null && saleCategory!=undefined)
				{
					CheckFlag=true
				}
			if(sale_department!="" && sale_department!=null && sale_department!=undefined)
				{
					CheckFlag=true
				}
			if(sale_brand!="" && sale_brand!=null && sale_brand!=undefined)
				{
					CheckFlag=true
				}
			if(CheckFlag==false && ApplyForAll !="turn_over")
			{
			$("#Error").html("Please Select Category or Department or Brand");
			 focusDiv('Error');
			return;
			}
			//finalObj.priceBasedConfigurationFlag = $("#offerRewardCriteria").val();
			//finalObj.applyForAllItems = $("#applyForAllItemsProduct").prop("checked");
			
			var offerRewardCriteria= $("#offerRewardCriteria").val();
			
			if(offerRewardCriteria=="true" || offerRewardCriteria=="false")
				{
				finalObj.priceBasedConfigurationFlag=offerRewardCriteria;
				}
			else
				{
				 finalObj.priceBasedConfigurationFlag="false";
				}
			
			
				if(ApplyForAll=="category_turnover")
					{
					 finalObj.applyForAllItems=true;
					}
				else
					{
					 finalObj.applyForAllItems=false;
					}
				
			var ItemPriceRange =$("#offerRewardCriteria").val();
				if(ItemPriceRange=="item_price_range")
					{
					  finalObj.itemSpecificTurnover=true;
					}
				else
					{
					  finalObj.itemSpecificTurnover=false;
					}
			
			finalObj.allowMultipleDiscounts = $("#allownMulDiscProduct").prop("checked");
			finalObj.repeat = $("#isRepeatProduct").prop("checked");	
			var priceBasedProduct=finalObj.priceBasedConfigurationFlag;
			
			finalObj.rewardType = $("#offerRewardProduct").val();
			
			var len1 = $("#slabLis tr").length - 1;
//			offerSlabs=[];
			
		    var bothOrPromotionFlag = false;
		   for(var i=1;i<=len1;i++){
			 var idAttr = $("#slabLis tr:eq("+i+")").attr("id").replace("productrange",'');
			
			 var minPurQty="";
			 minPurQty = $("#"+idAttr+"minquantityProduct").val();
			 var minAmt="";
			 minAmt = $("#"+idAttr+"minamountProduct").val();
			 var rewardValue = $("#"+idAttr+"rewardvalueProduct").val();
			 var rewardQuantity = $("#"+idAttr+"rewardQuantityProduct").val();
			
			 
          /*if($("#applyForAllItemsProduct").prop("checked")){
				 
				 if(rewardValue < 0 || rewardValue == 0){
					 $("#Error").html("Reward Value should be > 0");
					 $("#"+idAttr+"rewardvalueProduct").focus();
					 return;
				 }
			 }*/
          
          if(ApplyForAll=="category_turnover"){
				 
				 if(rewardValue < 0 || rewardValue == 0){
					 $("#Error").html("Reward Value should be > 0");
					 $("#"+idAttr+"rewardvalueProduct").focus();
					 return;
				 }
			 }
          
			if(priceBasedProduct=="true"){
				 if(rewardValue < 0 || rewardValue == 0){
					 $("#Error").html("Reward Value should be > 0");
					 $("#"+idAttr+"rewardvalueProduct").focus();
					 return;
				 }
				 
			 }
			 
		/* if(priceBasedProduct=="true" && $("#applyForAllItemsProduct").prop("checked")){
				 
				 if(rewardValue < 0 || rewardValue == 0){
					 $("#Error").html("Reward Value should be > 0");
					 $("#"+idAttr+"rewardvalueProduct").focus();
					 return;
				 }
				
			 }*/
		 
		 if(priceBasedProduct=="true" && ApplyForAll=="category_turnover"){
			 
			 if(rewardValue < 0 || rewardValue == 0){
				 $("#Error").html("Reward Value should be > 0");
				 $("#"+idAttr+"rewardvalueProduct").focus();
				 return;
			 }
			
		 }
			 
				 offerRangeDetails = {
						 "range" : $("#"+idAttr+"rangename2").text(),
						 "minimumPurchaseQuantityString" : $("#"+idAttr+"minquantityProduct").val(),
						 "minimumPurchaseamountString" : $("#"+idAttr+"minamountProduct").val(),
						 "rewardValueString" : $("#"+idAttr+"rewardvalueProduct").val(),
						 "rewardQty" : rewardQuantity,
						 "startPrice" : $("#" + idAttr + "startPriceProduct").val(),
						 "endPrice" : $("#" + idAttr + "endPriceProduct").val(),
						 "itemId" : $("#selected"+idAttr+"itemId").val(),
				 		 "pluCode" :  $("#pluCode"+idAttr+"itemId").val()
				 };
				offerSlabs.push(offerRangeDetails);
				 
				 
		}
		   //for excuding offer items (send flag exclutionItem false)
		   var len = $("#offerSaleSkusProductExclude tr").length-1;
			
			if(len != 0){
			for(var i=1;i<=len;i++){
				var idAttr = $("#offerSaleSkusProductExclude tr:eq("+i+") td:last").attr("id");
				idAttr = idAttr.replace('Del','');
		
					var obj = {
							 "sno" : $("#itemno"+idAttr).text(),
							 "skuId" : $("#itemCode"+idAttr).text(),
							 "itemDesc" : $("#itemDesc"+idAttr).text(),
							 "rewardValue" : $("#amount"+idAttr).val(),
							 "size" : $("#size"+idAttr).text(),
							 "ean" : $("#ean"+idAttr).text(),
							 "discountType" :$('option:selected', $('#dealStatus'+idAttr)).val(),
							 "category" : $("#category"+idAttr).val(),
							 "subCategory" : $("#subCategory"+idAttr).val(),
							 "brand" : $("#brandCode"+idAttr).val(),
							 "model" : $("#modal"+idAttr).val(),
							 "plucode" : $("#pluCode"+idAttr).val(),
							 "minPurchaseQty" : $("#minQty"+idAttr).val(),
							 "rewardQty" : $("#rewardQtyProduct"+idAttr).val(),
							 "section" : $("#section"+idAttr).val(),
							 "department" : $("#department"+idAttr).val(),
							 "exclusionItem":true
								
							 
					 };
					items.push(obj);
					
				}
			finalObj.offerProducts=items
			}
			}	
			
		if (offerSlabs.length == 0) {
			
			 offerRangeDetails = {
					 "minimumPurchaseQuantityString" : "1",
					 "minimumPurchaseamountString" : "0",
					 "rangeRewardType" : "reward",
					 "rewardValueString" : 0,
					 "rewardQty" : 1,
					// "rangeMode" : $("#"+idAttr+"rangeMode").val(),
					// "description" : $("#"+idAttr+"description").val(),
					 //"groupId" : $("#selected"+idAttr+"groupId").val(),
					 "startPrice" : 0,
					 "endPrice" : 0
					
			 		
			 };
		
			 offerSlabs.push(offerRangeDetails);
		}
	
		
		offerRanges.offerSlabs = offerSlabs;
		
			console.log(finalObj);
			//finalObj.sellPluCode = salePluCode.toString();
		}
		
	}
		if($("#basedOnGroup").prop("checked") == true){
			//debugger
			
			//finalObj.priceBasedConfigurationFlag = $("#offerRewardCriteriaGroup").val();
			
			var ItemPriceRange =$("#offerRewardCriteriaGroup").val();
			
			if(ItemPriceRange=="true" || ItemPriceRange=="false")
			{
				finalObj.priceBasedConfigurationFlag=ItemPriceRange;
			}
			else
				{
				finalObj.priceBasedConfigurationFlag="true";
				}
			
			
			if(ItemPriceRange=="item_price_range")
				{
				  finalObj.itemSpecificTurnover=true;
				}
			else
				{
				  finalObj.itemSpecificTurnover=false;
				}
			
			finalObj.applyForAllItems = $("#applyForAllItemsGroup").prop("checked");
			finalObj.rewardType = $("#offerReward").val();
			finalObj.allowMultipleDiscounts = $("#allownMulDisc").prop("checked");
			finalObj.repeat = $("#isRepeat").prop("checked");
			
			var applyforItems=finalObj.applyForAllItems;
			var pricebasedConfig=finalObj.priceBasedConfigurationFlag;
			finalObj.sellGroupId = $("#saleGroupId").text();
			
			if(applyforItems==false && pricebasedConfig=="false"){
			if($("#saleGroupId").length > 0){
				finalObj.sellGroupId = $("#saleGroupId").text();
				var len = $("#saleGroupSkuOffer tr").length-1;
				var saleGroupSku = [];
				var saleGroupPlu = [];
				for(var i=1;i<=len;i++){
					var idAttr = $("#saleGroupSkuOffer tr:eq("+i+") td:last").attr("id");
					idAttr = idAttr.replace('DelsaleGroupSku','');
					var skuId = $("#skusaleGroupSku"+idAttr).text();
					var pluCode = $("#pluCodesaleGroupSku"+idAttr).text();
					saleGroupSku.push(skuId);
					saleGroupPlu.push(pluCode);
				}
				if(saleGroupSku.length > 0)
					finalObj.sellSkuids = saleGroupSku.toString();
				if(saleGroupPlu.length > 0)
					finalObj.sellPluCode = saleGroupPlu.toString();
			}else{
				$("#Error").html("Please Select Sale Group Id ");
				 focusDiv('Error');
				return;
			}
			}
		
			//debugger;
			if($("#itemDisountBasedGroup").is(':checked')){
				var len = $("#offerSalegroupSkus tr").length-1;
				
				if(len == 0){
					alert("Add Atleast One item");
					return false;
					}
			
				for(var i=1;i<=len;i++){
					var idAttr = $("#offerSalegroupSkus tr:eq("+i+") td:last").attr("id");
					idAttr = idAttr.replace('Del','');
			
						var obj = {
								 "sno" : $("#itemno"+idAttr).text(),
								 "skuId" : $("#itemCode"+idAttr).text(),
								 "itemDesc" : $("#itemDesc"+idAttr).text(),
								 "rewardValue" : $("#amount"+idAttr).val(),
								 "size" : $("#size"+idAttr).text(),
								 "ean" : $("#ean"+idAttr).text(),
								 "discountType" : $('option:selected', $('#dealStatus'+idAttr)).val(),
								 "category" : $("#category"+idAttr).val(),
								 "subCategory" : $("#subCategory"+idAttr).val(),
								 "brand" : $("#brandCode"+idAttr).val(),
								 "model" : $("#modal"+idAttr).val(),
								 "plucode" : $("#pluCode"+idAttr).val(),
								 "minPurchaseQty" : $("#minQty"+idAttr).val(),
								 "department" : $("#department"+idAttr).val()
								 
						 };
						items.push(obj);
						
					}
				finalObj.offerProducts=items
			}
			 offerRanges.offerSlabs = offerSlabs;
		if($("#complexbasedOnGroup").is(':checked')){
			
			var len = $("#slabsList tr").length - 1;
//			offerSlabs=[];
			
	     	var bothOrPromotionFlag = false;
		    for(var i=1;i<=len;i++){
			 var idAttr = $("#slabsList tr:eq("+i+")").attr("id").replace("range",'');
			
			 var minPurQty = $("#"+idAttr+"minquantity").val();
			 var minAmt = $("#"+idAttr+"minamount").val();
			 var rewardValue = $("#"+idAttr+"rewardvalue").val();
			 var rewardQuantity = $("#"+idAttr+"rewardQuantity").val();
			 var groupItems = $("#"+idAttr+"itemIdgroup").val();
			
			 if($("#applyForAllItemsGroup").prop("checked")){
			 
				 if(rewardValue < 0 || rewardValue == 0){
					 $("#Error").html("Reward Value should be > 0");
					 $("#"+idAttr+"rewardvalue").focus();
					 return;
				 }
			 }
			if(pricebasedConfig=="true"){
				 
				 if(rewardValue < 0 || rewardValue == 0){
					 $("#Error").html("Reward Value should be > 0");
					 $("#"+idAttr+"rewardvalue").focus();
					 return;
				 }
				 
			 if($("#selected"+idAttr+"groupId").val() == ""){
					 $("#Error").html("Group Id should not be empty");
					 $("#"+idAttr+"groupId").focus();
					 return;
				 } 
			 }
			 
		 if(pricebasedConfig=="true" && $("#applyForAllItemsGroup").prop("checked")){
				 
				 if(rewardValue < 0 || rewardValue == 0){
					 $("#Error").html("Reward Value should be > 0");
					 $("#"+idAttr+"rewardvalue").focus();
					 return;
				 }
				if($("#selected"+idAttr+"groupId").val() == ""){
					 $("#Error").html("Group Id should not be empty");
					 $("#"+idAttr+"groupId").focus();
					 return;
				 } 
			 }
			 
			//written by manasa upto here
		 
		 
		if(applyforItems==false && pricebasedConfig=="false"){
			 if($("#isCombo").prop("checked")){
				 
				 if($("#selected"+idAttr+"groupId").val() == ""){
					 $("#Error").html("Group Id should not be empty");
					 $("#"+idAttr+"groupId").focus();
					 return;
				 } 
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
					 if(rewardValue < 0 || rewardValue == 0){
						 $("#Error").html("Reward Value should be > 0");
						 $("#"+idAttr+"rewardvalue").focus();
						 return;
					 }
					 if(rewardQuantity != 0){
						 $("#Error").html("Reward Quantity should be equal to 0");
						 $("#"+idAttr+"rewardQuantity").focus();
						 return;
					 }
				 }
				 if( $("#"+idAttr+"rangeMode").val() == "promotion"){
					 if(minPurQty != 0 && minAmt != 0){
						 $("#Error").html("Minimum Purchase Quantity and Minimum Purchase Amount Should be 0");
						 $("#"+idAttr+"minquantity").focus();
						 return;
					 }
					 if(rewardValue < 0 || rewardValue == 0){
						 $("#Error").html("Reward Value should be > 0");
						 $("#"+idAttr+"rewardvalue").focus();
						 return;
					 }
					 if(rewardQuantity != 0){
						 $("#Error").html("Reward Quantity should be equal to 0");
						 $("#"+idAttr+"rewardQuantity").focus();
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
					 if(rewardValue != 0){
						 $("#Error").html("Reward Value should be equal to 0");
						 $("#"+idAttr+"rewardvalue").focus();
						 return;
					 }
					 if(rewardQuantity != 0){
						 $("#Error").html("Reward Quantity should be equal to 0");
						 $("#"+idAttr+"rewardQuantity").focus();
						 return;
					 }
					/* if($("#"+idAttr+"rangeRewardType").val() != "both"){
						 $("#Error").html("Reward Type Should be Both");
						 $("#"+idAttr+"rangeRewardType").focus();
						 return;
					 }*/
				 }
			 }else if($("#lowestPriceItem").prop("checked")){
				 
				 if($("#selected"+idAttr+"groupId").val() == ""){
					 $("#Error").html("Group Id should not be empty");
					 $("#"+idAttr+"groupId").focus();
					 return;
				 } 
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
					 if(rewardValue < 0 || rewardValue == 0){
						 $("#Error").html("Reward Value should be > 0");
						 $("#"+idAttr+"rewardvalue").focus();
						 return;
					 }
					/* if(rewardQuantity < 0 || rewardQuantity == 0){
						 $("#Error").html("Reward Quantity should be > 0");
						 $("#"+idAttr+"rewardQuantity").focus();
						 return;
					 }*/
				 }
				 if( $("#"+idAttr+"rangeMode").val() == "promotion"){
					 if(minPurQty != 0 && minAmt != 0){
						 $("#Error").html("Minimum Purchase Quantity and Minimum Purchase Amount Should be 0");
						 $("#"+idAttr+"minquantity").focus();
						 return;
					 }
					 if(rewardValue < 0 || rewardValue == 0){
						 $("#Error").html("Reward Value should be > 0");
						 $("#"+idAttr+"rewardvalue").focus();
						 return;
					 }
					/* if(rewardQuantity < 0 || rewardQuantity == 0){
						 $("#Error").html("Reward Quantity should be > 0");
						 $("#"+idAttr+"rewardQuantity").focus();
						 return;
					 }*/
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
					 if(rewardValue != 0){
						 $("#Error").html("Reward Value should be equal to 0");
						 $("#"+idAttr+"rewardvalue").focus();
						 return;
					 }
					/* if(rewardQuantity != 0){
						 $("#Error").html("Reward Quantity should be equal to 0");
						 $("#"+idAttr+"rewardQuantity").focus();
						 return;
					 }*/
					/* if($("#"+idAttr+"rangeRewardType").val() != "both"){
						 $("#Error").html("Reward Type Should be Both");
						 $("#"+idAttr+"rangeRewardType").focus();
						 return;
					 }*/
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
				 if(rewardValue <= 0){
					 if($("#offercategory").val() == "turn_over"&& idAttr>1)
						 {
						 
						 }
					 else{
						 $("#Error").html("Reward Value Should be > 0");
							$("#"+idAttr+"rewardvalue").focus();
							return;
					 }
					
				 }
				 if(rewardQuantity > 0){
					 $("#Error").html("Reward Quantity cann't be > 0");
					$("#"+idAttr+"rewardQuantity").focus();
					return;
				 }
			 }
			
				} 
		
		/* if($("#offercategory").val() == "group_turn_over" && $("#"+idAttr+"groupId").val() == "")
		 {
			$("#Error").html("GroupId is recquired for Group turnover offer");
			 focusDiv('Error');
			return;
		 }*/
		 
		
			 
				 offerRangeDetails = {
						 "range" : $("#"+idAttr+"rangename").text(),
						 "minimumPurchaseQuantityString" : $("#"+idAttr+"minquantity").val(),
						 "minimumPurchaseamountString" : $("#"+idAttr+"minamount").val(),
						 "rangeRewardType" : $("#"+idAttr+"rangeRewardType").val(),
						 "rewardValueString" : $("#"+idAttr+"rewardvalue").val(),
						 "rewardQty" : rewardQuantity,
						 "rangeMode" : $("#"+idAttr+"rangeMode").val(),
						 "description" : $("#"+idAttr+"description").val(),
						 "startPrice" : $("#" + idAttr + "startPrice").val(),
						 "endPrice" : $("#" + idAttr + "endPrice").val(),
						 "groupId" : $("#selected"+idAttr+"groupId").val(),
						 "itemId" : $("#selected"+idAttr+"itemIdgroup").val(),
				 		 "pluCode" :  $("#pluCode"+idAttr+"itemIdgroup").val()
				 };
				 offerRanges.offerSlabs.push(offerRangeDetails);
				 
		}	
		
		    
		}
			
			
			  if (offerRanges.offerSlabs.length == 0) {
					
					 offerRangeDetails = {
							 "minimumPurchaseQuantityString" : "1",
							 "minimumPurchaseamountString" : "0",
							 "rangeRewardType" : "All",
							 "rewardValueString" : 0,
							 "rewardQty" : 1,
							// "rangeMode" : $("#"+idAttr+"rangeMode").val(),
							// "description" : $("#"+idAttr+"description").val(),
							 //"groupId" : $("#selected"+idAttr+"groupId").val(),
							 "startPrice" : 0,
							 "endPrice" : 0
							
					 		
					 };
				
					 offerRanges.offerSlabs.push(offerRangeDetails);
				}
	}
	

		
	
	finalObj.offerRanges = JSON.stringify(offerRanges);
	finalObj.offerProducts = items;
	/*finalObj.authorisedBy = $("#autorisedBy").val();
	finalObj.closedBy = $("#closedBy").val();
	finalObj.closedOnStr = $("#closedOn").val();
	finalObj.closedReason = $("#closedReason").val();*/
	//console.log(finalObj);
	var formData = JSON.stringify(finalObj);
	//console.log(formData);
//	return;
	var contextPath = $("#contextPath").val();
	URL = contextPath + "/dealsAndOffers/createOffer.do";
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
				
				/*messageStatus= JSON.stringify(result);
				var parsed_json = JSON.parse(messageStatus);
				var code = parsed_json.code;*/
				
				/*//alert(parsed_json.code)
				if(code != 0)
					{
						$("#Error").html(parsed_json.error);
					    $('html, body').animate({
					        scrollTop: $("#Error").offset().top
					    }, 10);
					}
				else
					{
						$("#Success").html(parsed_json.success);
						 $('html, body').animate({
						        scrollTop: $("#Success").offset().top
						    }, 10);
					}*/
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




/*

function createOffer(){
	 var offerRanges={},offerSlabs=[],offerRangeDetails={};
	$("#Error").html("");
	if($("#offerName").val() == null || $("#offerName").val() ==""){
		$("#offerNameErr").html("Enter Offer Name");
		$("#offerName").focus();
		return;
	}
	var location = $("#offerLocation").val();
	if(location == null || location == "" || location == undefined){
		$("#Error").html("Please Select atleast one location");
		$("#offerLocation").focus();
		return;
	}
	if(location.indexOf(",")){
		location = $("#offerLocation").val().toString();
	}
	if($("#offerStartDate").val() == ""){
		$("#offerStartDateError").html("Start Date Required");
//		$("#offerStartDate").focus();
		return;
	}
	if($("#offerEndDate").val() == ""){
		$("#offerEndDateError").html("End Date Required");
//		$("#offerEndDate").focus();
		return;
	}
	 var dateTime = getCurrentDate();
	  var date = dateTime.split(' ');
	  date = date[0].split('/');
	  var formatedDate = date[2]+"/"+date[0]+"/"+date[1];
	  var noOfDays = daydiff(parseDate(formatedDate),parseDate($('#offerStartDate').val()));
	 if(noOfDays < 0){
		 $("#Error").html("Start Date should be Future Date");
		 focusDiv('Error');
		 return;
	 }
	 noOfDays = daydiff(parseDate(formatedDate),parseDate($('#offerEndDate').val()));
	 if(noOfDays < 0){
		 $("#Error").html("End Date should be Future Date");
		 focusDiv('Error');
		 return;
	 }
	noOfDays = daydiff(parseDate($('#offerStartDate').val()), parseDate($('#offerEndDate').val()));
	 if(noOfDays < 0){
		 $("#Error").html("End Date can't be less than Start Date");
		 focusDiv('Error');
		 return;
	 }
	
	var finalObj = {};
	finalObj.storeLocation = location;
	finalObj.offerName = $("#offerName").val();
	finalObj.offerCategory = $("#offercategory").val();
	finalObj.priority = $("#offerPriority").val();
//	finalObj.offerImage = $("#offerbannerByte").val();
	if($("#offerBannerRefId").val().trim() != "" && $("#offerBannerRefId").val() != null){
		finalObj.offerImageRef = $("#offerBannerRefId").val();
		finalObj.offerImage = $("#offerBanner_name").val();
	}
	if($("#offerBanner_thumbnail").length > 0)
		finalObj.offerImageFlag = "true";
	else
		finalObj.offerImageFlag = "false";
	finalObj.offerStartDate = $("#offerStartDate").val();
	finalObj.offerEndDate = $("#offerEndDate").val();
	finalObj.rewardType = $("#offerReward").val();
	finalObj.offerStatus = $('input[name=offerStatus]:checked').val();
	finalObj.customerspecificflag = $('input[name=isCustomerSpecific]:checked').val();
	finalObj.claimCoupons = $('input[name=coupons]:checked').val();
	finalObj.claimLoyaltypoints = $('input[name=loyaltyPoints]:checked').val();
	finalObj.claimgiftvouchers = $('input[name=giftvouchers]:checked').val();
	finalObj.offerDescription = $("#offerDesc").val();
	if(getFormData() == false)
		return;
	finalObj.customerFilter = getFormData();
	finalObj.offerImageText = $("#dealImageText").val();
	finalObj.offerImageTextFont = $("#dealImageTextFontHidden").val();
	finalObj.offerImageSize = $("#dealImageTextSize").val();
	finalObj.offerImageColor = $("#dealImageTextColor").val();
	if($("#dealImageBold").prop('checked') == true)
		finalObj.offerImageBold = 1;
	else
		finalObj.offerImageBold = 0;
	if($("#dealImageItalic").prop('checked') == true)
		finalObj.offerImageItalic = 1;
	else	
		finalObj.offerImageItalic = 0;
	if($("#dealImageStrike").prop('checked') == true)
		finalObj.offerImageStrike = 1;
	else
		finalObj.offerImageStrike = 0;
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
	
	finalObj.offerPriceText = $("#dealText").val();
	finalObj.offerPriceFont = $("#dealTextFontHidden").val();
	finalObj.offerPriceSize = $("#dealTextSize").val();
	finalObj.offerPriceColor = $("#dealTextColor").val();
	if($("#dealTextBold").prop('checked') == true)
		finalObj.offerPriceBold = 1;
	else
		finalObj.offerPriceBold = 0;
	if($("#dealTextItalic").prop('checked') == true)
		finalObj.offerPriceItalic = 1;
	else
		finalObj.offerPriceItalic = 0;
	if($("#dealTextStrike").prop('checked') == true)
		finalObj.offerPriceStrike = 1;
	else
		finalObj.offerPriceStrike = 0;
	
	if($("#startTime").val() == ""){
		$("#startTimeError").html("Enter Start Time");
		return;
	}
	finalObj.offerStartTimeStr = $("#startTime").val();
	if($("#endTime").val() == ""){
		$("#endTimeError").html("Enter End Time");
		return;
	}
	finalObj.offerEndTimeStr = $("#endTime").val();
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
	if($("#offercategory").val() == "item_specific"){
		if($("#basedOnProduct").prop("checked") == true){
			if(offerSellPRoducts.length == 0 && offerSellSkus.length == 0  && $("#saleCategory").val() == "-- Select --"){
				$("#Error").html("Please Select Atleast Sale Product Category Or Sale Product Or Sale Sku");
				 focusDiv('Error');
				return;
			}
			if($("#saleCategory").val() != "-- Select --")
				finalObj.productCategory = $("#saleCategory").val();
			if($("#sale_sub_category").val() != "-- Select --")
				finalObj.productSubCategory = $("#sale_sub_category").val();
			finalObj.sellProducts = offerSellPRoducts.toString();
			finalObj.sellSkuids = offerSellSkus.toString();
			var salePluCode = [];
			$('.buyPluCode').each(function(){
				salePluCode.push($(this).val());
			});
			finalObj.sellPluCode = salePluCode.toString();
		}else if($("#basedOnGroup").prop("checked") == true){
			if($("#saleGroupId").length > 0){
				finalObj.sellGroupId = $("#saleGroupId").text();
				var len = $("#saleGroupSku tr").length-1;
				var saleGroupSku = [];
				var saleGroupPlu = [];
				for(var i=1;i<=len;i++){
					var idAttr = $("#saleGroupSku tr:eq("+i+") td:last").attr("id");
					idAttr = idAttr.replace('DelsaleGroupSku','');
					var skuId = $("#skusaleGroupSku"+idAttr).text();
					var pluCode = $("#pluCodesaleGroupSku"+idAttr).text();
					saleGroupSku.push(skuId);
					saleGroupPlu.push(pluCode);
				}
				if(saleGroupSku.length > 0)
					finalObj.sellSkuids = saleGroupSku.toString();
				if(saleGroupPlu.length > 0)
					finalObj.sellPluCode = saleGroupPlu.toString();
			}else{
				$("#Error").html("Please Select Sale Group Id and Deal Group Id");
				 focusDiv('Error');
				return;
			}
		}
	}
	
	var len = $("#slabsList tr").length - 1;
//	offerSlabs=[];
	offerRanges.offerSlabs = offerSlabs;
	var bothOrPromotionFlag = false;
	for(var i=1;i<=len;i++){
		 var idAttr = $("#slabsList tr:eq("+i+")").attr("id").replace("range",'');
		 var minPurQty = $("#"+idAttr+"minquantity").val();
		 var minAmt = $("#"+idAttr+"minamount").val();
		 var rewardValue = $("#"+idAttr+"rewardvalue").val();
		 var rewardQuantity = $("#"+idAttr+"rewardQuantity").val();
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
				 if(rewardValue < 0 || rewardValue == 0){
					 $("#Error").html("Reward Value should be > 0");
					 $("#"+idAttr+"rewardvalue").focus();
					 return;
				 }
				 if(rewardQuantity != 0){
					 $("#Error").html("Reward Quantity should be equal to 0");
					 $("#"+idAttr+"rewardQuantity").focus();
					 return;
				 }
			 }
			 if( $("#"+idAttr+"rangeMode").val() == "promotion"){
				 if(minPurQty != 0 && minAmt != 0){
					 $("#Error").html("Minimum Purchase Quantity and Minimum Purchase Amount Should be 0");
					 $("#"+idAttr+"minquantity").focus();
					 return;
				 }
				 if(rewardValue < 0 || rewardValue == 0){
					 $("#Error").html("Reward Value should be > 0");
					 $("#"+idAttr+"rewardvalue").focus();
					 return;
				 }
				 if(rewardQuantity != 0){
					 $("#Error").html("Reward Quantity should be equal to 0");
					 $("#"+idAttr+"rewardQuantity").focus();
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
				 if(rewardValue != 0){
					 $("#Error").html("Reward Value should be equal to 0");
					 $("#"+idAttr+"rewardvalue").focus();
					 return;
				 }
				 if(rewardQuantity != 0){
					 $("#Error").html("Reward Quantity should be equal to 0");
					 $("#"+idAttr+"rewardQuantity").focus();
					 return;
				 }
				 if($("#"+idAttr+"rangeRewardType").val() != "both"){
					 $("#Error").html("Reward Type Should be Both");
					 $("#"+idAttr+"rangeRewardType").focus();
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
				 if(rewardValue < 0 || rewardValue == 0){
					 $("#Error").html("Reward Value should be > 0");
					 $("#"+idAttr+"rewardvalue").focus();
					 return;
				 }
				 if(rewardQuantity < 0 || rewardQuantity == 0){
					 $("#Error").html("Reward Quantity should be > 0");
					 $("#"+idAttr+"rewardQuantity").focus();
					 return;
				 }
			 }
			 if( $("#"+idAttr+"rangeMode").val() == "promotion"){
				 if(minPurQty != 0 && minAmt != 0){
					 $("#Error").html("Minimum Purchase Quantity and Minimum Purchase Amount Should be 0");
					 $("#"+idAttr+"minquantity").focus();
					 return;
				 }
				 if(rewardValue < 0 || rewardValue == 0){
					 $("#Error").html("Reward Value should be > 0");
					 $("#"+idAttr+"rewardvalue").focus();
					 return;
				 }
				 if(rewardQuantity < 0 || rewardQuantity == 0){
					 $("#Error").html("Reward Quantity should be > 0");
					 $("#"+idAttr+"rewardQuantity").focus();
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
				 if(rewardValue != 0){
					 $("#Error").html("Reward Value should be equal to 0");
					 $("#"+idAttr+"rewardvalue").focus();
					 return;
				 }
				 if(rewardQuantity != 0){
					 $("#Error").html("Reward Quantity should be equal to 0");
					 $("#"+idAttr+"rewardQuantity").focus();
					 return;
				 }
				 if($("#"+idAttr+"rangeRewardType").val() != "both"){
					 $("#Error").html("Reward Type Should be Both");
					 $("#"+idAttr+"rangeRewardType").focus();
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
			 if(rewardValue <= 0){
				 if($("#offercategory").val() == "turn_over"&& idAttr>1)
					 {
					 
					 }
				 else{
					 $("#Error").html("Reward Value Should be > 0");
						$("#"+idAttr+"rewardvalue").focus();
						return;
				 }
				
			 }
			 if(rewardQuantity > 0){
				 $("#Error").html("Reward Quantity cann't be > 0");
				$("#"+idAttr+"rewardQuantity").focus();
				return;
			 }
		 }
		 if($("#offercategory").val() == "group_turn_over" && $("#"+idAttr+"groupId").val() == "")
			 {
				$("#Error").html("GroupId is recquired for Group turnover offer");
				 focusDiv('Error');
				return;
			 }
		 if($("#"+idAttr+"groupId").val() == "")
			 $("#selected"+idAttr+"groupId").val("");
		 if($("#"+idAttr+"itemId").val() == ""){
			 $("#selected"+idAttr+"itemId").val("");
			 $("#pluCode"+idAttr+"itemId").val("");
		 }
//		 if($("#lowestPriceItem").prop("checked") || $("#isCombo").prop("checked") || $("#offercategory").val() != "item_specific"){
			 if($("#"+idAttr+"rangeMode").val() == "both" || $("#"+idAttr+"rangeMode").val() == "promotion")
				 bothOrPromotionFlag = true;
//		 }
		 offerRangeDetails = {
				 "range" : $("#"+idAttr+"rangename").text(),
				 "minimumPurchaseQuantityString" : $("#"+idAttr+"minquantity").val(),
				 "minimumPurchaseamountString" : $("#"+idAttr+"minamount").val(),
				 "rangeRewardType" : $("#"+idAttr+"rangeRewardType").val(),
				 "rewardValueString" : $("#"+idAttr+"rewardvalue").val(),
				 "rewardQty" : rewardQuantity,
				 "rangeMode" : $("#"+idAttr+"rangeMode").val(),
				 "description" : $("#"+idAttr+"description").val(),
				 "groupId" : $("#selected"+idAttr+"groupId").val(),
				 "itemId" : $("#selected"+idAttr+"itemId").val(),
		 		 "pluCode" :  $("#pluCode"+idAttr+"itemId").val()
		 };
		 offerRanges.offerSlabs.push(offerRangeDetails);	 
	}
	if(offerRanges.offerSlabs.length == 0){
		$("#Error").html("Add atleast one slab");
		 focusDiv('Error');
		return;
	}
	if(!bothOrPromotionFlag){
		$("#Error").html("Atleast one slab should have Range Mode as 'Both' or 'Promotion'");
		 focusDiv('Error');
		return;
	}
		
	finalObj.offerRanges = JSON.stringify(offerRanges);
	finalObj.authorisedBy = $("#autorisedBy").val();
	finalObj.closedBy = $("#closedBy").val();
	finalObj.closedOnStr = $("#closedOn").val();
	finalObj.closedReason = $("#closedReason").val();
	
	var formData = JSON.stringify(finalObj);
//	console.log(formData);
//	return;
	var contextPath = $("#contextPath").val();
	URL = contextPath + "/dealsAndOffers/createOffer.do";
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

*/
/*function createOffer() {
	var offerRanges = {}, offerSlabs = [], offerRangeDetails = {},items = [];;
	$("#Error").html("");
	if ($("#offerName").val() == null || $("#offerName").val() == "") {
		$("#offerNameErr").html("Enter Offer Name");
		$("#offerName").focus();
		return;
	}
	var location = $("#offerLocation").val();
	if (location == null || location == "" || location == undefined) {
		$("#Error").html("Please Select atleast one location");
		$("#offerLocation").focus();
		return;
	}
	if (location.indexOf(",")) {
		location = $("#offerLocation").val().toString();
	}
	if ($("#offerStartDate").val() == "") {
		$("#offerStartDateError").html("Start Date Required");
		// $("#offerStartDate").focus();
		return;
	}
	if ($("#offerEndDate").val() == "") {
		$("#offerEndDateError").html("End Date Required");
		// $("#offerEndDate").focus();
		return;
	}
	var dateTime = getCurrentDate();
	var date = dateTime.split(' ');
	date = date[0].split('/');
	var formatedDate = date[2] + "/" + date[0] + "/" + date[1];
	var noOfDays = daydiff(parseDate(formatedDate), parseDate($(
			'#offerStartDate').val()));
	if (noOfDays < 0) {
		$("#Error").html("Start Date should be Future Date");
		focusDiv('Error');
		return;
	}
	
	 * noOfDays =
	 * daydiff(parseDate(formatedDate),parseDate($('#offerEndDate').val()));
	 * if(noOfDays < 0){ $("#Error").html("End Date should be Future Date");
	 * focusDiv('Error'); return; }
	 
	noOfDays = daydiff(parseDate($('#offerStartDate').val()), parseDate($(
			'#offerEndDate').val()));
	if (noOfDays < 0) {
		$("#Error").html("End Date can't be less than Start Date");
		focusDiv('Error');
		return;
	}

	var finalObj = {};
	finalObj.storeLocation = location;
	finalObj.offerName = $("#offerName").val();
	finalObj.offerCategory = $("#offercategory").val();
	finalObj.priority = $("#offerPriority").val();
	
	finalObj.applyForAllItems = $('#applyForAllItems:checked').val();
	finalObj.applyForAllItems = $('#applyForAllItems:checked').val();
	
	// finalObj.offerImage = $("#offerbannerByte").val();
	if ($("#offerBannerRefId").val().trim() != ""
			&& $("#offerBannerRefId").val() != null) {
		finalObj.offerImageRef = $("#offerBannerRefId").val();
		finalObj.offerImage = $("#offerBanner_name").val();
	}
	if ($("#offerBanner_thumbnail").length > 0)
		finalObj.offerImageFlag = "true";
	else
		finalObj.offerImageFlag = "false";
	finalObj.offerStartDate = $("#offerStartDate").val();
	finalObj.offerEndDate = $("#offerEndDate").val();
	finalObj.rewardType = $("#offerReward").val();
	finalObj.offerStatus = $('input[name=offerStatus]:checked').val();
	finalObj.claimCoupons = $('input[name=coupons]:checked').val();
	finalObj.claimLoyaltypoints = $('input[name=loyaltyPoints]:checked').val();
	finalObj.claimgiftvouchers = $('input[name=giftvouchers]:checked').val();
	finalObj.offerDescription = $("#offerDesc").val();
	if (getFormData() == false)
		return;
	finalObj.customerFilter = getFormData();
	finalObj.offerImageText = $("#dealImageText").val();
	finalObj.offerImageTextFont = $("#dealImageTextFontHidden").val();
	finalObj.offerImageSize = $("#dealImageTextSize").val();
	finalObj.offerImageColor = $("#dealImageTextColor").val();
	if ($("#dealImageBold").prop('checked') == true)
		finalObj.offerImageBold = 1;
	else
		finalObj.offerImageBold = 0;
	if ($("#dealImageItalic").prop('checked') == true)
		finalObj.offerImageItalic = 1;
	else
		finalObj.offerImageItalic = 0;
	if ($("#dealImageStrike").prop('checked') == true)
		finalObj.offerImageStrike = 1;
	else
		finalObj.offerImageStrike = 0;
	finalObj.salePriceText = $("#saleText").val();
	finalObj.salePriceFont = $("#saleTextFontHidden").val();
	finalObj.salePriceSize = $("#saleTextSize").val();
	finalObj.salePriceColor = $("#saleTextColor").val();
	if ($("#saleTextBold").prop('checked') == true)
		finalObj.salePriceBold = 1;
	else
		finalObj.salePriceBold = 0;
	if ($("#saleTextItalic").prop('checked') == true)
		finalObj.salePriceItalic = 1;
	else
		finalObj.salePriceItalic = 0;
	if ($("#saleTextStrike").prop('checked') == true)
		finalObj.salePriceStrike = 1;
	else
		finalObj.salePriceStrike = 0;

	finalObj.offerPriceText = $("#dealText").val();
	finalObj.offerPriceFont = $("#dealTextFontHidden").val();
	finalObj.offerPriceSize = $("#dealTextSize").val();
	finalObj.offerPriceColor = $("#dealTextColor").val();
	if ($("#dealTextBold").prop('checked') == true)
		finalObj.offerPriceBold = 1;
	else
		finalObj.offerPriceBold = 0;
	if ($("#dealTextItalic").prop('checked') == true)
		finalObj.offerPriceItalic = 1;
	else
		finalObj.offerPriceItalic = 0;
	if ($("#dealTextStrike").prop('checked') == true)
		finalObj.offerPriceStrike = 1;
	else
		finalObj.offerPriceStrike = 0;

	if ($("#startTime").val() == "") {
		$("#startTimeError").html("Enter Start Time");
		return;
	}
	finalObj.offerStartTimeStr = $("#startTime").val();
	if ($("#endTime").val() == "") {
		$("#endTimeError").html("Enter End Time");
		return;
	}
	finalObj.offerEndTimeStr = $("#endTime").val();
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
	if ($("#offercategory").val() == "item_specific") {
		if ($("#basedOnProduct").prop("checked") == true) {
			if (offerSellPRoducts.length == 0 && offerSellSkus.length == 0
					&& $("#saleCategory").val() == "-- Select --") {
				$("#Error")
						.html(
								"Please Select Atleast Sale Product Category Or Sale Product Or Sale Sku");
				focusDiv('Error');
				return;
			}
			if ($("#saleCategory").val() != "-- Select --")
				finalObj.productCategory = $("#saleCategory").val();
			if ($("#sale_sub_category").val() != "-- Select --")
				finalObj.productSubCategory = $("#sale_sub_category").val();
			finalObj.sellProducts = offerSellPRoducts.toString();
			finalObj.sellSkuids = offerSellSkus.toString();
			var salePluCode = [];
			$('.buyPluCode').each(function() {
				salePluCode.push($(this).val());
			});
			
			//added by manaasa
			debugger
			
			if($("#itemDisountBased").is(':checked')){
			 var len = $("#offerSaleSkus tr").length-1;
				
				if(len == 0){
					alert("Add Atleast One item");
					return false;
					}
				for(var i=1;i<=len;i++){
					
					var idAttr = $("#offerSaleSkus tr:eq("+i+") td:last").attr("id");
					idAttr = idAttr.replace('Del','');
					
					var obj = {sno:$("#itemno"+idAttr).text(),skuId:$("#itemCode"+idAttr).text(),pluCode:$("#pluCode"+idAttr).val(),itemDesc:$("#itemDesc"+idAttr).text(),uom:$("#size"+idAttr).text(),itemPrice:$("#dealStatus"+idAttr).text(),quantity:$("#amount"+idAttr).val()};
					items.push(obj);
				}
			
				finalObj.OfferProducts=items;
			}
			if($("#complexDisountBased").is(':checked'))
				{
				
				var len = $("#slabLis tr").length - 1;
				// offerSlabs=[];
				offerRanges.offerSlabs = offerSlabs;
				var bothOrPromotionFlag = false;
				for (var i = 1; i <= len; i++) {
					var idAttr = $("#slabLis tr:eq(" + i + ")").attr("id").replace(
							"range", '');
					var minPurQty = $("#" + idAttr + "minquantity").val();
					var minAmt = $("#" + idAttr + "minamountProduct").val();
					var rewardValue = $("#" + idAttr + "rewardvalue").val();
					var rewardQuantity = $("#" + idAttr + "rewardQuantity").val();
				}
				
				
				if ($("#" + idAttr + "itemId").val() == "") {
					$("#selected" + idAttr + "itemId").val("");
					$("#pluCode" + idAttr + "itemId").val("");
				}
				offerRangeDetails = {
						//"range" : $("#" + idAttr + "rangename").text(),
						"minimumPurchaseQuantityString" : $("#" + idAttr + "minquantity")
								.text(),
						"minimumPurchaseamountString" : $("#" + idAttr + "minamount").text(),
						"rangeRewardType" : $("#" + idAttr + "rangeRewardType").text(),
						"rewardValueString" : $("#" + idAttr + "rewardvalue").val(),
						"rewardQty" : rewardQuantity,
						//"rangeMode" : $("#" + idAttr + "rangeMode").val(),
						//"description" : $("#" + idAttr + "description").val(),
						//"groupId" : $("#selected" + idAttr + "groupId").val(),
						"startPrice" : $("#" + idAttr + "startPriceuct").val(),
						"endPrice" : $("#" + idAttr + "endPrice").val(),
						"itemId" : $("#selected" + idAttr + "itemId").text(),
						"pluCode" : $("#pluCode" + idAttr + "itemId").val()
					};
					offerRanges.offerSlabs.push(offerRangeDetails);
				
				}
			
			
			
			finalObj.sellPluCode = salePluCode.toString();
		} else if ($("#basedOnGroup").prop("checked") == true) {
			if ($("#saleGroupId").length > 0) {
				finalObj.sellGroupId = $("#saleGroupId").text();
				var len = $("#saleGroupSku tr").length - 1;
				var saleGroupSku = [];
				var saleGroupPlu = [];
				for (var i = 1; i <= len; i++) {
					var idAttr = $("#saleGroupSku tr:eq(" + i + ") td:last")
							.attr("id");
					idAttr = idAttr.replace('DelsaleGroupSku', '');
					var skuId = $("#skusaleGroupSku" + idAttr).text();
					var pluCode = $("#pluCodesaleGroupSku" + idAttr).text();
					saleGroupSku.push(skuId);
					saleGroupPlu.push(pluCode);
				}
				if (saleGroupSku.length > 0)
					finalObj.sellSkuids = saleGroupSku.toString();
				if (saleGroupPlu.length > 0)
					finalObj.sellPluCode = saleGroupPlu.toString();
			} else {
				$("#Error").html(
						"Please Select Sale Group Id and Deal Group Id");
				focusDiv('Error');
				return;
			}
			
			debugger
			
			var len = $("#slabsList tr").length - 1;
			// offerSlabs=[];
			offerRanges.offerSlabs = offerSlabs;
			var bothOrPromotionFlag = false;
			for (var i = 1; i <= len; i++) {
				var idAttr = $("#slabsList tr:eq(" + i + ")").attr("id").replace(
						"range", '');
				var minPurQty = $("#" + idAttr + "minquantity").val();
				var minAmt = $("#" + idAttr + "minamount").val();
				var rewardValue = $("#" + idAttr + "rewardvalue").val();
				var rewardQuantity = $("#" + idAttr + "rewardQuantity").val();
				
				
				if($("#itemDisountBasedGroup").is(':checked')){
					 var len = $("#offerSalegroupSkus tr").length-1;
						
						if(len == 0){
							alert("Add Atleast One item");
							return false;
							}
						for(var i=1;i<=len;i++){
							var idAttr = $("#offerSalegroupSkus tr:eq("+i+") td:last").attr("id").replace('Del','');
							var idAttr = $("#offerSalegroupSkus tr:eq("+i+") td:last").attr("id");
							
							
							var obj = {sno:$("#itemno"+idAttr).text(),skuId:$("#itemCode"+idAttr).val(),pluCode:$("#pluCode"+idAttr).val(),itemDesc:$("#itemDesc"+idAttr).text(),uom:$("#size"+idAttr).text(),itemPrice:$("#dealStatus"+idAttr).text(),quantity:$("#amount"+idAttr).val()};
							items.push(obj);
						}
					
						finalObj.OfferProducts=items;
					}
				if ($("#" + idAttr + "groupId").val() == "")
					$("#selected" + idAttr + "groupId").val("");
				if ($("#" + idAttr + "itemId").val() == "") {
					$("#selected" + idAttr + "itemId").val("");
					$("#pluCode" + idAttr + "itemId").val("");
				}
				
				
				offerRangeDetails = {
						"range" : $("#" + idAttr + "rangename").text(),
						"minimumPurchaseQuantityString" : $("#" + idAttr + "minquantity")
								.val(),
						"minimumPurchaseamountString" : $("#" + idAttr + "minamount").val(),
						"rangeRewardType" : $("#" + idAttr + "rangeRewardType").val(),
						"rewardValueString" : $("#" + idAttr + "rewardvalue").val(),
						"rewardQty" : rewardQuantity,
						"rangeMode" : $("#" + idAttr + "rangeMode").val(),
						"groupId" : $("#selected" + idAttr + "groupId").val(),
						"itemId" : $("#selected" + idAttr + "itemId").val(),
						"pluCode" : $("#pluCode" + idAttr + "itemId").val()
					};
					offerRanges.offerSlabs.push(offerRangeDetails);
				if ($("#isCombo").prop("checked")) {
					
					if ($("#" + idAttr + "rangeMode").val() == "both") {
							if (minPurQty > 0 && minAmt > 0) {
								$("#Error")
										.html(
												"Enter Either Minimum Purchase Quantity Or Minimum Purchase Amount");
								$("#" + idAttr + "minquantity").focus();
								return;
							}
							if (minPurQty == 0 && minAmt == 0) {
								$("#Error")
										.html(
												"Either Minimum Purchase Quantity Or Minimum Purchase Amount Is Required");
								$("#" + idAttr + "minquantity").focus();
								return;
							}
							if (rewardValue < 0 || rewardValue == 0) {
								$("#Error").html("Reward Value should be > 0");
								$("#" + idAttr + "rewardvalue").focus();
								return;
							}
							if (rewardQuantity != 0) {
								$("#Error").html("Reward Quantity should be equal to 0");
								$("#" + idAttr + "rewardQuantity").focus();
								return;
							}
						}
						if ($("#" + idAttr + "rangeMode").val() == "promotion") {
							if (minPurQty != 0 && minAmt != 0) {
								$("#Error")
										.html(
												"Minimum Purchase Quantity and Minimum Purchase Amount Should be 0");
								$("#" + idAttr + "minquantity").focus();
								return;
							}
							if (rewardValue < 0 || rewardValue == 0) {
								$("#Error").html("Reward Value should be > 0");
								$("#" + idAttr + "rewardvalue").focus();
								return;
							}
							if (rewardQuantity != 0) {
								$("#Error").html("Reward Quantity should be equal to 0");
								$("#" + idAttr + "rewardQuantity").focus();
								return;
							}
						}
						if ($("#" + idAttr + "rangeMode").val() == "condition") {
							if (minPurQty > 0 && minAmt > 0) {
								$("#Error")
										.html(
												"Enter Either Minimum Purchase Quantity Or Minimum Purchase Amount");
								$("#" + idAttr + "minquantity").focus();
								return;
							}
							if (minPurQty == 0 && minAmt == 0) {
								$("#Error")
										.html(
												"Either Minimum Purchase Quantity Or Minimum Purchase Amount Is Required");
								$("#" + idAttr + "minquantity").focus();
								return;
							}
							if (rewardValue != 0) {
								$("#Error").html("Reward Value should be equal to 0");
								$("#" + idAttr + "rewardvalue").focus();
								return;
							}
							if (rewardQuantity != 0) {
								$("#Error").html("Reward Quantity should be equal to 0");
								$("#" + idAttr + "rewardQuantity").focus();
								return;
							}
							
						}
				
				if ($("#" + idAttr + "rangeMode").val() == "both"
						|| $("#" + idAttr + "rangeMode").val() == "promotion")
					bothOrPromotionFlag = true;
				
				
				
			}
			if (offerRanges.offerSlabs.length == 0) {
				$("#Error").html("Add atleast one slab");
				focusDiv('Error');
				return;
			}
			if (!bothOrPromotionFlag) {
				$("#Error")
						.html(
								"Atleast one slab should have Range Mode as 'Both' or 'Promotion'");
				focusDiv('Error');
				return;
			}

			
			
			
			
				
			}
		}
			
		
	}

	
		
		if ($("#isCombo").prop("checked")) {
			
		if ($("#" + idAttr + "rangeMode").val() == "both") {
				if (minPurQty > 0 && minAmt > 0) {
					$("#Error")
							.html(
									"Enter Either Minimum Purchase Quantity Or Minimum Purchase Amount");
					$("#" + idAttr + "minquantity").focus();
					return;
				}
				if (minPurQty == 0 && minAmt == 0) {
					$("#Error")
							.html(
									"Either Minimum Purchase Quantity Or Minimum Purchase Amount Is Required");
					$("#" + idAttr + "minquantity").focus();
					return;
				}
				if (rewardValue < 0 || rewardValue == 0) {
					$("#Error").html("Reward Value should be > 0");
					$("#" + idAttr + "rewardvalue").focus();
					return;
				}
				if (rewardQuantity != 0) {
					$("#Error").html("Reward Quantity should be equal to 0");
					$("#" + idAttr + "rewardQuantity").focus();
					return;
				}
			}
			if ($("#" + idAttr + "rangeMode").val() == "promotion") {
				if (minPurQty != 0 && minAmt != 0) {
					$("#Error")
							.html(
									"Minimum Purchase Quantity and Minimum Purchase Amount Should be 0");
					$("#" + idAttr + "minquantity").focus();
					return;
				}
				if (rewardValue < 0 || rewardValue == 0) {
					$("#Error").html("Reward Value should be > 0");
					$("#" + idAttr + "rewardvalue").focus();
					return;
				}
				if (rewardQuantity != 0) {
					$("#Error").html("Reward Quantity should be equal to 0");
					$("#" + idAttr + "rewardQuantity").focus();
					return;
				}
			}
			if ($("#" + idAttr + "rangeMode").val() == "condition") {
				if (minPurQty > 0 && minAmt > 0) {
					$("#Error")
							.html(
									"Enter Either Minimum Purchase Quantity Or Minimum Purchase Amount");
					$("#" + idAttr + "minquantity").focus();
					return;
				}
				if (minPurQty == 0 && minAmt == 0) {
					$("#Error")
							.html(
									"Either Minimum Purchase Quantity Or Minimum Purchase Amount Is Required");
					$("#" + idAttr + "minquantity").focus();
					return;
				}
				if (rewardValue != 0) {
					$("#Error").html("Reward Value should be equal to 0");
					$("#" + idAttr + "rewardvalue").focus();
					return;
				}
				if (rewardQuantity != 0) {
					$("#Error").html("Reward Quantity should be equal to 0");
					$("#" + idAttr + "rewardQuantity").focus();
					return;
				}
				
			}
		} else if ($("#lowestPriceItem").prop("checked")) {
			if ($("#" + idAttr + "rangeMode").val() == "both") {
				if (minPurQty > 0 && minAmt > 0) {
					$("#Error")
							.html(
									"Enter Either Minimum Purchase Quantity Or Minimum Purchase Amount");
					$("#" + idAttr + "minquantity").focus();
					return;
				}
				if (minPurQty == 0 && minAmt == 0) {
					$("#Error")
							.html(
									"Either Minimum Purchase Quantity Or Minimum Purchase Amount Is Required");
					$("#" + idAttr + "minquantity").focus();
					return;
				}
				if (rewardValue < 0 || rewardValue == 0) {
					$("#Error").html("Reward Value should be > 0");
					$("#" + idAttr + "rewardvalue").focus();
					return;
				}
				if (rewardQuantity < 0 || rewardQuantity == 0) {
					$("#Error").html("Reward Quantity should be > 0");
					$("#" + idAttr + "rewardQuantity").focus();
					return;
				}
			}
			if ($("#" + idAttr + "rangeMode").val() == "promotion") {
				if (minPurQty != 0 && minAmt != 0) {
					$("#Error")
							.html(
									"Minimum Purchase Quantity and Minimum Purchase Amount Should be 0");
					$("#" + idAttr + "minquantity").focus();
					return;
				}
				if (rewardValue < 0 || rewardValue == 0) {
					$("#Error").html("Reward Value should be > 0");
					$("#" + idAttr + "rewardvalue").focus();
					return;
				}
				if (rewardQuantity < 0 || rewardQuantity == 0) {
					$("#Error").html("Reward Quantity should be > 0");
					$("#" + idAttr + "rewardQuantity").focus();
					return;
				}
			}
			if ($("#" + idAttr + "rangeMode").val() == "condition") {
				if (minPurQty > 0 && minAmt > 0) {
					$("#Error")
							.html(
									"Enter Either Minimum Purchase Quantity Or Minimum Purchase Amount");
					$("#" + idAttr + "minquantity").focus();
					return;
				}
				if (minPurQty == 0 && minAmt == 0) {
					$("#Error")
							.html(
									"Either Minimum Purchase Quantity Or Minimum Purchase Amount Is Required");
					$("#" + idAttr + "minquantity").focus();
					return;
				}
				if (rewardValue != 0) {
					$("#Error").html("Reward Value should be equal to 0");
					$("#" + idAttr + "rewardvalue").focus();
					return;
				}
				if (rewardQuantity != 0) {
					$("#Error").html("Reward Quantity should be equal to 0");
					$("#" + idAttr + "rewardQuantity").focus();
					return;
				}
				
				 * if($("#"+idAttr+"rangeRewardType").val() != "both"){
				 * $("#Error").html("Reward Type Should be Both");
				 * $("#"+idAttr+"rangeRewardType").focus(); return; }
				 
			}
		} else {
			if (minPurQty > 0 && minAmt > 0) {
				$("#Error")
						.html(
								"Enter Either Minimum Purchase Quantity Or Minimum Purchase Amount");
				$("#" + idAttr + "minquantity").focus();
				return;
			}
			if (minPurQty == 0 && minAmt == 0) {
				$("#Error")
						.html(
								"Either Minimum Purchase Quantity Or Minimum Purchase Amount Is Required");
				$("#" + idAttr + "minquantity").focus();
				return;
			}
			if (rewardValue <= 0) {
				$("#Error").html("Reward Value Should be > 0");
				$("#" + idAttr + "rewardvalue").focus();
				return;
			}
			if (rewardQuantity > 0) {
				$("#Error").html("Reward Quantity cann't be > 0");
				$("#" + idAttr + "rewardQuantity").focus();
				return;
			}
		}
		
	finalObj.offerRanges = JSON.stringify(offerRanges);
	
	 * finalObj.authorisedBy = $("#autorisedBy").val(); finalObj.closedBy =
	 * $("#closedBy").val(); finalObj.closedOnStr = $("#closedOn").val();
	 * finalObj.closedReason = $("#closedReason").val();
	 

	var formData = JSON.stringify(finalObj);
	 console.log(formData);
	// return;
	var contextPath = $("#contextPath").val();
	URL = contextPath + "/dealsAndOffers/createOffer.do";
	$.ajax({
		type : "POST",
		url : URL,
		contentType : "application/json",
		data : formData,

		beforeSend : function(xhr) {
			$("#loading").css("display", "block");
			$("#mainDiv").addClass("disabled");
		},
		success : function(result) {
			$("#right-side").html(result);
			$("#loading").css("display", "none");
			$("#mainDiv").removeClass('disabled');

		},
		error : function() {
			alert("something went wrong");
			$("#loading").css("display", "none");
			$("#mainDiv").removeClass('disabled');

		}
	});

}*/
var offerEditProducts = [], offerEditSkus = [];
function prepareEditOfferData() {
	if ($("#offerEditSellProducts").val() != null
			&& $("#offerEditSellProducts").val() != "") {
		if ($("#offerEditSellProducts").val().indexOf(",") > -1) {
			var arr = $("#offerEditSellProducts").val().split(",");
			for (var i = 0; i < arr.length; i++) {
				offerEditProducts.push(arr[i]);
			}
		} else {
			offerEditProducts.push($("#offerEditSellProducts").val());
		}
	}

	if ($("#editOfferSkus").val() != null && $("#editOfferSkus").val() != "") {
		if ($("#editOfferSkus").val().indexOf(",") > -1) {
			var arr = $("#editOfferSkus").val().split(",");
			for (var i = 0; i < arr.length; i++) {
				offerEditSkus.push(arr[i]);
			}
		} else {
			offerEditSkus.push($("#editOfferSkus").val());
		}
	}
}

/*
 * function addEditOfferSlab(){ var offereditcount = 0; var len =
 * $("#editOfferSlabsTable tr").length - 1; offereditcount = len+1; var
 * contextPath = $("#contextPath").val(); var value =
 * "editrange"+offereditcount; $("#editOfferSlabsTable") .append( '<tr id=' +
 * value + '><th style="width: 10%;display:none;"><span id
 * ='+"'"+value+"rangename'"+'>' + value + '</span></th>' +'<th style="width: 15%"><input
 * class="form-control" onblur="textBoxColor(this)" type="text"
 * name="category_name" id ='+"'"+value+"minquantity'"+ 'oninput="this.value =
 * this.value.replace(/[^0-9]/g, \'\'); this.value =
 * this.value.replace(/(\..*)\/g, \'$1\');"' + ' /></th>' +'<th style="width: 15%"><input
 * class="form-control" onblur="textBoxColor(this)" type="text"
 * name="category_name" id ='+"'"+value+"minamount'"+ 'oninput="this.value =
 * this.value.replace(/[^0-9]/g, \'\'); this.value =
 * this.value.replace(/(\..*)\/g, \'$1\');"' + ' /></th>' +'<th style="width: 15%"><input
 * class="form-control" onblur="textBoxColor(this)" type="text"
 * name="category_name" id ='+"'"+value+"rewardvalue'"+ 'oninput="this.value =
 * this.value.replace(/[^0-9]/g, \'\'); this.value =
 * this.value.replace(/(\..*)\/g, \'$1\');"' + '/></th>' +'<th style="width: 15%"><input
 * class="form-control" onblur="textBoxColor(this)" type="text"
 * name="category_name" id ='+"'"+value+"description'"+'/></th>' +'<th style="width: 5%"><img
 * src='+contextPath+'/images/addslab.png style=" width: 33px;cursor: pointer;"
 * onclick="addEditOfferSlab()" > <img
 * src='+contextPath+'/images/itemdelete1.png style=" width: 24px;cursor:
 * pointer;" onclick="removeEditOfferSlab(' + "'editrange" + offereditcount +
 * "'" + ')"></th></tr>'); }
 */

var editcount1 = $("#editOfferSlabsTable tr").length - 1;
function addEditOfferSlab() {
	debugger
	var priceBased=$("#priceBasedConfigurationGroup").prop("checked");
	var applylitems=$("#applyForAllItemsGroup").prop("checked");
	if(applylitems==undefined)
		{
		applylitems=false;
		}
	
	editcount1 = editcount1 + 1;
	var currentDealSlabDivContent = editDealSlabDivContent;
	/*currentDealSlabDivContent = currentDealSlabDivContent.replace(
			'style="display: none;"', '');*/
	currentDealSlabDivContent = currentDealSlabDivContent.replace(
			/editrange1/g, 'editrange' + editcount1);
	currentDealSlabDivContent = currentDealSlabDivContent.replace(
			'selected1groupId', 'selected' + editcount1 + 'groupId');
	currentDealSlabDivContent = currentDealSlabDivContent.replace('1groupId',
			editcount1 + 'groupId');
	currentDealSlabDivContent = currentDealSlabDivContent.replace('1groupId',
			editcount1 + 'groupId');
	currentDealSlabDivContent = currentDealSlabDivContent.replace('1itemId',
			editcount1 + 'itemId');
	currentDealSlabDivContent = currentDealSlabDivContent.replace('1itemId',
			editcount1 + 'itemId');
	currentDealSlabDivContent = currentDealSlabDivContent.replace(
			'selected1itemId', 'selected' + editcount1 + 'itemId');
	currentDealSlabDivContent = currentDealSlabDivContent.replace(
			'pluCode1itemId', 'pluCode' + editcount1 + 'itemId');
	
	
	currentDealSlabDivContent = currentDealSlabDivContent.replace('editrange1rangename',
			'editrange'+editcount1 + 'rangename');
	currentDealSlabDivContent = currentDealSlabDivContent.replace(
			'editrange1minquantity', 'editrange'+editcount1 + 'minquantity');
	currentDealSlabDivContent = currentDealSlabDivContent.replace('editrange1minamount',
			'editrange'+editcount1 + 'minamount');
	currentDealSlabDivContent = currentDealSlabDivContent.replace(
			'editrange1rangeRewardType', 'editrange'+editcount1 + 'rangeRewardType');
	currentDealSlabDivContent = currentDealSlabDivContent.replace(
			'editrange1rewardvalue', 'editrange'+editcount1 + 'rewardvalue');
	currentDealSlabDivContent = currentDealSlabDivContent.replace(
			'editrange1rewardQuantity', 'editrange'+editcount1 + 'rewardQuantity');
	currentDealSlabDivContent = currentDealSlabDivContent.replace('editrange1rangeMode',
			'editrange'+editcount1 + 'rangeMode');
	currentDealSlabDivContent = currentDealSlabDivContent.replace(
			'editrange1description', 'editrange'+editcount1 + 'description');
	
	currentDealSlabDivContent = currentDealSlabDivContent.replace(
			'editrange1startPrice', 'editrange'+editcount1 + 'startPrice');
	currentDealSlabDivContent = currentDealSlabDivContent.replace(
			'editrange1endPrice', 'editrange'+editcount1 + 'endPrice');
	currentDealSlabDivContent = currentDealSlabDivContent.replace('editrange1',
			'editrange' + editcount1);
	
	
	
	
	
	
	
	$("#editOfferSlabsTable tbody").append(currentDealSlabDivContent);
	
	var groupId = $("#selected1groupId").val();
	$("#"+editcount1+"groupId").val(groupId);
	$("#selected"+editcount1+"groupId").val(groupId);
	
	if (!$("#lowestPriceItem").prop("checked")
			&& !$("#isCombo").prop("checked")) {
		$("#editrange" + editcount1 + "rewardQuantity").val('0');
		$("#" + editcount1 + "startPrice").val('0');
		$("#" + editcount1 + "endPrice").val('0');
		$("#editrange" + editcount1 + "rewardQuantity").attr("readonly",
				"readonly");
		$("#editrange" + editcount1 + "rangeMode").val("both");
		$("#editrange" + editcount1 + "rangeMode").prop("disabled", "disabled");
		
		//var applylitems=$("#applyForAllItemsProduct").prop("checked");
	
		var rewardCriteriaGroup=$("#offerRewardCriteriaGroup").val();
	
		if(rewardCriteriaGroup=="false" && applylitems==true)
				{
				$("#" + editcount1 + "itemIdgroup").attr("disabled","disabled");
				$("#editrange" + editcount1 + "minquantity").attr("disabled","disabled");
				$("#editrange" + editcount1 + "minamount").attr("disabled","disabled");
				$("#editrange" + editcount1 + "startPrice").removeAttr("disabled");
				$("#editrange" + editcount1 + "endPrice").removeAttr("disabled");
				$("#editrange" + editcount1 + "startPrice").val('0');
				$("#editrange" + editcount1 + "endPrice").val('0');
				}
	     if(rewardCriteriaGroup=="true" && applylitems==false){
					$("#" + editcount1 + "itemIdgroup").attr("disabled","disabled");
					$("#editrange" + editcount1 + "minquantity").attr("disabled","disabled");
					$("#editrange" + editcount1 + "minamount").attr("disabled","disabled");
					$("#editrange" + editcount1 + "startPrice").removeAttr("disabled");
					$("#editrange" + editcount1 + "endPrice").removeAttr("disabled");
					$("#editrange" + editcount1 + "startPrice").val('0');
					$("#editrange" + editcount1 + "endPrice").val('0');
			}
				if(rewardCriteriaGroup=="false" && applylitems==false)
				{
					$("#" + editcount1 + "minquantity").removeAttr("disabled");
					$("#editrange" + editcount1 + "minamount").removeAttr("readonly");
					$("#editrange" + editcount1 + "startPrice").attr("disabled","disabled");
					$("#editrange" + editcount1 + "endPrice").attr("disabled","disabled");
					$("#editrange" + editcount1 + "startPrice").val('0');
					$("#editrange" + editcount1 + "endPrice").val('0');
					$("#editrange" + editcount1 + "startPrice").val('0');
					$("#editrange" + editcount1 + "endPrice").val('0');
				}
				
				if(rewardCriteriaGroup=="true" && applylitems==true)
				{
					
				$("#" + editcount1 + "itemIdgroup").attr("disabled","disabled");
				$("#editrange" + editcount1 + "minquantity").attr("disabled","disabled");
				$("#editrange" + editcount1 + "minamount").attr("disabled","disabled");
				$("#editrange" + editcount1 + "startPrice").removeAttr("disabled");
				$("#editrange" + editcount1 + "endPrice").removeAttr("disabled");
				$("#editrange" + editcount1 + "groupId").removeAttr("disabled");
				$("#editrange" + editcount1 + "startPrice").val('0');
				$("#editrange" + editcount1 + "endPrice").val('0');
				}
		
		
	} else if ($("#isCombo").prop("checked")) {
		$("#editrange" + editcount1 + "rewardQuantity").val('0');
		$("#editrange" + editcount1 + "startPrice").val('0');
		$("#editrange" + editcount1 + "endPrice").val('0');
		$("#editrange" + editcount1 + "rewardQuantity").attr("readonly",
				"readonly");
		$("#editrange" + editcount1 + "rangeMode").removeAttr("disabled");
	} else if ($("#lowestPriceItem").prop("checked")) {
		$("#editrange" + editcount1 + "startPrice").val('0');
		$("#editrange" + editcount1 + "endPrice").val('0');
		$("#editrange" + editcount1 + "rangeMode").removeAttr("disabled");
		$("#editrange" + editcount1 + "rewardQuantity").removeAttr("readonly");
	}
}

function removeEditOfferSlab(slabId) {
	debugger;
	var len = $("#editOfferSlabsTable tr").length - 2;
	if (len < 1) {
		alert("Atleast One Range is Required");
		return;
	}
	$("#" + slabId).remove();
}

function removeProductEditOfferSlab(slabId) {
	var len = $("#slabLis tr").length - 1;
	if (len <= 1) {
		alert("Atleast One Range is Required");
		return;
	}
	$("#" + slabId).remove();
}

/* search product ids based on search */
function editsearchOfferSellProducts(name, searchCategory) {
	var contextPath = $("#contextPath").val();
	URL = contextPath + "/inventorymanager/searchdealProducts.do";
	$.ajax({
		type : "GET",
		url : URL,
		data : {
			searchName : name
		},
		beforeSend : function(xhr) {
			$("#loading").css("display", "block");
			$("#mainDiv").addClass("disabled");
		},
		success : function(result) {
			editappendOfferProducts(result, searchCategory);
			$("#loading").css("display", "none");
			$("#mainDiv").removeClass('disabled');
		},
		error : function() {
			alert("something went wrong");
			$("#loading").css("display", "none");
			$("#mainDiv").removeClass('disabled');
		}
	});
}
/* append getting product detrails to datalist */
function editappendOfferProducts(productsList, searchCategory) {
	$("." + searchCategory).html('');
	var op = '';
	for (var i = 0; i < productsList.length; i++) {

		if (i == 0) {
			op += '<li id="' + productsList[i].productId
					+ '"  class="selected" onclick=getId(this,"'
					+ searchCategory + '"); ><a>' + productsList[i].description
					+ '</a></li>';
		} else
			op += '<li id="' + productsList[i].productId
					+ '" onclick=getId(this,"' + searchCategory + '"); ><a>'
					+ productsList[i].description + '</a></li>';
	}
	$("." + searchCategory).html(op);
	$("." + searchCategory).show();
}
var offerproductid = 0;
function editaddOfferProductId(materialName) {
	offerproductid = offerproductid + 1;
	$('#editproductList').val('');
	var contextPath = $("#contextPath").val();
	var remove = contextPath + "/images/itemdelete1.png";

	for (var id = 0; id < offerEditProducts.length; id++) {
		if (offerEditProducts[id] == materialName) {
			alert(offerEditProducts[id] + " product already added");
			return;
		}
	}
	$('#editsaleProductsId')
			.append(
					'<tr class='
							+ "'"
							+ offerproductid
							+ "buyProduct'"
							+ '><td style="font-size: 100%;"><span style="color: rgb(81, 93, 107)" id="buyProductname">'
							+ materialName
							+ '</span></td>'
							+ '<td class="price" style="font-size: 100%;"><center><img src='
							+ remove
							+ ' style="cursor:pointer;" onclick="removeOfferEditSellingProduct('
							+ "'" + offerproductid + "buyProduct'" + ',' + "'"
							+ materialName + "'" + ')"></center></td></tr>');
	offerEditProducts.push(materialName);
}
function removeOfferEditSellingProduct(pid, productId) {
	remove(productId, offerEditProducts);
	$("." + pid).remove();
}

function editsearchOfferBuySkus(name, searchCategory) {
	var productsarray = [];
	var contextPath = $("#contextPath").val();
	productsarray = offerEditProducts;
	URL = contextPath + "/inventorymanager/searchskus.do";
	$.ajax({
		type : "GET",
		url : URL,
		data : {
			productsarray : productsarray.toString()
		},
		beforeSend : function(xhr) {
			$("#loading").css("display", "block");
			$("#mainDiv").addClass("disabled");
		},
		success : function(result) {
			editappendOfferBuySkus(result, searchCategory);
			$("#loading").css("display", "none");
			$("#mainDiv").removeClass('disabled');
		},
		error : function() {
			alert("something went wrong");
			$("#loading").css("display", "none");
			$("#mainDiv").removeClass('disabled');
		}
	});
}
function editappendOfferBuySkus(productsList, searchCategory) {
	$("." + searchCategory).html('');
	var op = '';
	for (var i = 0; i < productsList.length; i++) {

		if (i == 0) {
			op += '<li id="' + productsList[i].skuID
					+ '"  class="selected" onclick=getId(this,"'
					+ searchCategory + '"); ><a>' + productsList[i].skuID
					+ '</a></li>';
		} else
			op += '<li id="' + productsList[i].skuID + '" onclick=getId(this,"'
					+ searchCategory + '"); ><a>' + productsList[i].skuID
					+ '</a></li>';
	}
	$("." + searchCategory).html(op);
	$("." + searchCategory).show();

}
function editaddOfferSkusToSellItem(materialName, pluCode) {
	var flag = true;
	offerskuid = offerskuid + 1;
	$('#editbuySkuList').val('');
	var contextPath = $("#contextPath").val();
	var remove = contextPath + "/images/itemdelete1.png";
	$(".buyPluCode").each(function() {
		if ($(this).val() == pluCode) {
			alert(pluCode + " plu already added");
			flag = false;
			return;
		}
	});
	if (flag == true) {
		offerEditSkus.push(materialName);
		$('#editsaleSkuids')
				.append(
						'<tr class='
								+ "'"
								+ offerskuid
								+ "buyOfferSkuid'"
								+ '><td style="font-size: 100%;"><span style="color: rgb(81, 93, 107)">'
								+ materialName
								+ '</span></td>'
								+ '<td>'
								+ pluCode
								+ '</td><input type="hidden" class="buyPluCode" value="'
								+ pluCode
								+ '" />'
								+ '<td class="price" style="font-size: 100%;"><center><img src='
								+ remove
								+ ' style="cursor:pointer;" onclick="removeOfferEditSellingSkus('
								+ "'" + offerskuid + "buyOfferSkuid'" + ','
								+ "'" + materialName + "'"
								+ ')"></center></td></tr>');
	}

	/*
	 * offerskuid = offerskuid+1; $('#editbuySkuList').val(''); var contextPath =
	 * $("#contextPath").val(); var remove =
	 * contextPath+"/images/itemdelete1.png";
	 * 
	 * for(var id=0;id<offerEditSkus.length;id++){
	 * if(offerEditSkus[id]==materialName){ alert(offerEditSkus[id] +" product
	 * already added"); return; } }
	 * 
	 * $('#editsaleSkuids').append( '<tr class='+"'"+offerskuid+"buyOfferSkuid'"+'><td style="font-size: 100%;"><span
	 * style="color: rgb(81, 93, 107)">'+materialName+'</span></td>' +'<td class="price" style="font-size: 100%;"><center><img
	 * src='+remove+' style="cursor:pointer;"
	 * onclick="removeOfferEditSellingSkus('+"'"+offerskuid+"buyOfferSkuid'"+','+"'"+materialName+"'"+')"></center></td></tr>');
	 * offerEditSkus.push(materialName);
	 */
}
function removeOfferEditSellingSkus(pid, productId) {
	remove(productId, offerEditSkus);
	$("." + pid).remove();
	alert(offerEditSkus);
}

//modified by manasa
function updateOffer(offerId) {
	debugger;
	var editofferRanges = {}, editofferSlabs = [], editofferRangeDetails = {},items=[];
	$("#Error").html("");
	if ($("#offerName").val() == null || $("#offerName").val() == "") {
		$("#offerNameErr").html("Enter Offer Name");
		activateHeader('dealConfiguration');
		$("#offerName").focus();
		return;
	}
	
	var location = $("#offerLocation").val();
	/*if (location == null || location == "" || location == undefined) {
		$("#Error").html("Please Select atleast one location");
		activateHeader('dealConfiguration');
		$("#offerLocation").focus();
		return;
	}*/
	/*if (location.indexOf(",")) {
		location = $("#offerLocation").val().toString();
	}*/
	
	var offerStatusValue = "";
	  if($("#offerStatusValue").length>0)
		  offerStatusValue = $("#offerStatusValue").val();
	
	if ($("#offerStartDate").val() == "") {
		$("#offerStartDateError").html("Start Date Required");
		activateHeader('dealConfiguration');
		// $("#offerStartDate").focus();
		return;
	}
	if ($("#offerEndDate").val() == "") {
		$("#offerEndDateError").html("End Date Required");
		$("#offerEndDateError").focus();
		activateHeader('dealConfiguration');
		// $("#offerEndDate").focus();
		return;
	}
	var dateTime = getCurrentDate();
	var date = dateTime.split(' ');
	 var time = date[1];
	date = date[0].split('/');
	 
	
	var formatedDate = date[1] + "/" + date[0] + "/" + date[2];
	/*
	 * var noOfDays =
	 * daydiff(parseDate(formatedDate),parseDate($('#offerStartDate').val()));
	 * if(noOfDays < 0){ $("#Error").html("Start Date should be Future Date");
	 * focusDiv('Error'); return; }
	 */
	/*
	 * var noOfDays =
	 * daydiff(parseDate(formatedDate),parseDate($('#offerEndDate').val()));
	 * if(noOfDays < 0){ $("#Error").html("End Date should be Future Date");
	 * focusDiv('Error'); return; }
	 */
	var noOfDays = daydiff(parseDate($('#offerStartDate').val()), parseDate($(
			'#offerEndDate').val()));
	if (noOfDays < 0) {
		$("#Error").html("End Date can't be less than Start Date");
		focusDiv('Error');
		return;
	}

	
	var finalObj = {};
	
	 
	finalObj.createdOnStr = $("#createdDate").val();
	finalObj.couponProgramId = $("#CouponCodeforOffer").val();
	
	var fromDate = $("#from").val();
	var toDate = $("#to").val();
	
	
	
	
	var locDetails=[];
	if($("#offerLocation").val() != null){
		var locations = $("#offerLocation").val().toString().split(',');
		for(var i=0; i<locations.length; i++){
		//	lc = locations[i];
			obj = {"storeLocation":locations[i]};
			locDetails.push(obj);
		}
	}
	
	 var maxRecords = 10;
	   	if ($("#maxRecords").length > 0)
	   		maxRecords = $("#maxRecords").val();
	
	  finalObj.maxRecords=maxRecords;
	  finalObj.offerLocation= $("#outletLocation").val();
	finalObj.offerLocationsList=locDetails;
	finalObj.offerID = offerId;
	finalObj.allowReturns = $("#applyReturns").prop("checked");
	finalObj.salePriceBased =$("#applysaleprice").prop("checked");
	finalObj.allowExchanges = $("#applyExchanges").prop("checked");
	//finalObj.storeLocation = $("#offerLocation").val().toString();
	finalObj.offerName = $("#offerName").val();
	finalObj.offerCategory = $("#offercategory").val();
	var billsPerDay = $("#billsPerDay").val();
	if (billsPerDay != "" && billsPerDay!=undefined && billsPerDay!=null) {
			finalObj.numberBillsPerDay = parseInt(billsPerDay);
		}
	
	var maxPrice = $("#maxPrice").val();
	if (maxPrice != "" && maxPrice!=undefined && maxPrice!=null) {
			finalObj.maxPrice = parseInt(maxPrice);
		}
	var minPrice = $("#minPrice").val();
	if (minPrice != "" && minPrice!=undefined && minPrice!=null) {
			finalObj.minPrice = parseInt(minPrice);
		}

	
	finalObj.priority = $("#offerPriority").val();
	// finalObj.offerImage = $("#offerbannerByte").val();
	if ($("#offerBannerRefId").val().trim() != ""
			&& $("#offerBannerRefId").val() != null) {
		finalObj.offerImageRef = $("#offerBannerRefId").val();
		finalObj.offerImage = $("#offerBanner_name").val();
	}
	if ($("#offerBanner_thumbnail").length > 0)
		finalObj.offerImageFlag = "true";
	else
		finalObj.offerImageFlag = "false";
	finalObj.offerStartDate = $("#offerStartDate").val();
	finalObj.offerEndDate = $("#offerEndDate").val();
	finalObj.rewardType = $("#offerReward").val();
	finalObj.offerStatus = $('input[name=offerStatus]:checked').val();
	finalObj.claimCoupons = $('input[name=coupons]:checked').val();
	finalObj.claimLoyaltypoints = $('input[name=loyaltyPoints]:checked').val();
	finalObj.claimgiftvouchers = $('input[name=giftvouchers]:checked').val();
	finalObj.offerDescription = $("#offerDesc").val();
	if (getFormData() == false)
		return;
	finalObj.customerFilter = getFormData();
	finalObj.offerImageText = $("#dealImageText").val();
	finalObj.offerImageTextFont = $("#dealImageTextFontHidden").val();
	finalObj.offerImageSize = $("#dealImageTextSize").val();
	finalObj.offerImageColor = $("#dealImageTextColor").val();
	if ($("#dealImageBold").prop('checked') == true)
		finalObj.offerImageBold = 1;
	else
		finalObj.offerImageBold = 0;
	if ($("#dealImageItalic").prop('checked') == true)
		finalObj.offerImageItalic = 1;
	else
		finalObj.offerImageItalic = 0;
	if ($("#dealImageStrike").prop('checked') == true)
		finalObj.offerImageStrike = 1;
	else
		finalObj.offerImageStrike = 0;
	finalObj.salePriceText = $("#saleText").val();
	finalObj.salePriceFont = $("#saleTextFontHidden").val();
	finalObj.salePriceSize = $("#saleTextSize").val();
	finalObj.salePriceColor = $("#saleTextColor").val();
	if ($("#saleTextBold").prop('checked') == true)
		finalObj.salePriceBold = 1;
	else
		finalObj.salePriceBold = 0;
	if ($("#saleTextItalic").prop('checked') == true)
		finalObj.salePriceItalic = 1;
	else
		finalObj.salePriceItalic = 0;
	if ($("#saleTextStrike").prop('checked') == true)
		finalObj.salePriceStrike = 1;
	else
		finalObj.salePriceStrike = 0;

	finalObj.offerPriceText = $("#dealText").val();
	finalObj.offerPriceFont = $("#dealTextFontHidden").val();
	finalObj.offerPriceSize = $("#dealTextSize").val();
	finalObj.offerPriceColor = $("#dealTextColor").val();
	if ($("#dealTextBold").prop('checked') == true)
		finalObj.offerPriceBold = 1;
	else
		finalObj.offerPriceBold = 0;
	if ($("#dealTextItalic").prop('checked') == true)
		finalObj.offerPriceItalic = 1;
	else
		finalObj.offerPriceItalic = 0;
	if ($("#dealTextStrike").prop('checked') == true)
		finalObj.offerPriceStrike = 1;
	else
		finalObj.offerPriceStrike = 0;
	if ($("#startTime").val() == "") {
		$("#startTimeError").html("Enter Start Time");
		return;
	}
	finalObj.offerStartTimeStr = $("#startTime").val();
	if ($("#endTime").val() == "") {
		$("#endTimeError").html("Enter End Time");
		return;
	}
	finalObj.offerEndTimeStr = $("#endTime").val();
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
	
	//debugger;
	//written by manasa to store the value of group/product
	if($("#basedOnGroup").is(':checked')){
		finalObj.productSpecificFlag="false"
	}
	else
		{
		finalObj.productSpecificFlag="true"
		}
	
	if ($("#offercategory").val() == "item_specific"  ||  $("#offercategory").val() == "turn_over" || $("#offercategory").val()=="category_turnover") {
		if ($("#basedOnProduct").prop("checked") == true) {
			if (offerEditProducts.length == 0 && offerEditSkus.length == 0
					&& $("#saleCategory").val() == "-- Select --") {
				$("#Error")
						.html(
								"Please Select Atleast Sale Product Category Or Sale Product Or Sale Sku");
				focusDiv('Error');
				return;
			}
		
			if($("#saleCategory").val() != undefined)
				finalObj.productCategory = $("#saleCategory").val();
				if($("#sale_sub_category").val() != undefined)
				finalObj.productSubCategory = $("#sale_sub_category").val();
				if($("#saleCategory").val() != undefined)
				finalObj.productDepartment = $("#sale_department").val();
				if($("#sale_brand").val().trim() != undefined)
				finalObj.brand = $("#sale_brand").val();
				if($("#sale_section").val().trim() != undefined)
				finalObj.productSection = $("#sale_section").val();
			
			/*if($("#saleCategory").val().trim() == "-- Select --")
				finalObj.productCategory="";
		finalObj.productCategory = $("#saleCategory").val();
			if($("#sale_sub_category").val().trim() == "-- Select --")
				finalObj.productSubCategory="";
			finalObj.productSubCategory = $("#sale_sub_category").val();
			if($("#saleCategory").val().trim() == "-- Select --")
				finalObj.productDepartment="";
			finalObj.productDepartment = $("#sale_department").val();
			if($("#sale_brand").val().trim() == "-- Select --")
				finalObj.brand="";
			finalObj.brand = $("#sale_brand").val();
			if($("#sale_section").val().trim() == "-- Select --")
				finalObj.productSection="";
			finalObj.productSection = $("#sale_section").val();*/
			
			
			finalObj.sellProducts = offerEditProducts.toString();
			finalObj.sellSkuids = offerEditSkus.toString();

			var salePluCode = [];
			$('.buyPluCode').each(function() {
				salePluCode.push($(this).val());
			});
			
			
			//added by manasa
			if($("#itemDisountBased").is(':checked')){
				var len = $("#offerSaleSkusProduct tr").length-1;
				
				//alert(len)
				if(len == 0){
					alert("Add Atleast One item");
					return false;
					}
				
				for(var i=1;i<=len;i++){
					var idAttr = $("#offerSaleSkusProduct tr:eq("+i+") td:last").attr("id");
					idAttr = idAttr.replace('Del','');
			
						var obj = {
								 "sno" : $("#itemno"+idAttr).text(),
								 "skuId" : $("#itemCode"+idAttr).text(),
								 "itemDesc" : $("#itemDesc"+idAttr).text(),
								 "rewardValue" : $("#amount"+idAttr).val(),
								 "size" : $("#size"+idAttr).text(),
								 "ean" : $("#ean"+idAttr).text(),
								 "discountType" :$('option:selected', $('#dealStatus'+idAttr)).val(),
								 "category" : $("#category"+idAttr).val(),
								 "subCategory" : $("#subCategory"+idAttr).val(),
								 "brand" : $("#brandCode"+idAttr).val(),
								 "model" : $("#modal"+idAttr).val(),
								 "plucode" : $("#pluCode"+idAttr).val(),
								 "minPurchaseQty" : $("#minQty"+idAttr).val(),
								 "rewardQty" : $("#rewardQtyProduct"+idAttr).val(),
								 "department" : $("#department"+idAttr).val(),
								 "exclusionItem":false
								 
						 };
						items.push(obj);
						
					}
				finalObj.offerProducts=items
			}
			editofferRanges.editofferSlabs = editofferSlabs;
			/*if($("#complexDisountBased").is(':checked')){		
		
				finalObj.priceBasedConfigurationFlag = $("#offerRewardCriteria").val();
				finalObj.applyForAllItems = $("#applyForAllItemsProduct").prop("checked");
				finalObj.allowMultipleDiscounts = $("#allownMulDiscProduct").prop("checked");
				finalObj.repeat = $("#isRepeatProduct").prop("checked");
				
				finalObj.rewardType = $("#offerRewardProduct").val();
				//debugger
			var len1 = $("#slabLis tr").length - 1;
//			offerSlabs=[];
			
		var bothOrPromotionFlag = false;
		for(var i=2;i<=len1;i++){
			 var idAttr = $("#slabLis tr:eq("+i+")").attr("id").replace("productrange",'');
			 var minPurQty = $("#"+idAttr+"minquantityProduct").val();
			 var minAmt = $("#"+idAttr+"minamountProduct").val();
			 var rewardValue = $("#"+idAttr+"rewardvalueProduct").val();
			 var rewardQuantity = $("#"+idAttr+"rewardQuantityProduct").val();
			
			 editofferRangeDetails = {
						 "range" : $("#"+idAttr+"rangename2").text(),
						 "minimumPurchaseQuantityString" : $("#"+idAttr+"minquantityProduct").val(),
						 "minimumPurchaseamountString" : $("#"+idAttr+"minamountProduct").val(),
						 "rewardValueString" : $("#"+idAttr+"rewardvalueProduct").val(),
						 "rewardQty" : rewardQuantity,
						// "rangeMode" : $("#"+idAttr+"rangeMode").val(),
						// "description" : $("#"+idAttr+"description").val(),
						 //"groupId" : $("#selected"+idAttr+"groupId").val(),
						 "startPrice" : $("#" + idAttr + "startPriceProduct").val(),
						 "endPrice" : $("#" + idAttr + "endPriceProduct").val(),
						 "itemId" : $("#selected"+ idAttr +"itemId").val(),
				 		 "pluCode" :  $("#pluCode"+idAttr+"itemIdProduct").val()
				 };
				 editofferRanges.editofferSlabs.push(editofferRangeDetails);
				 
		}
			}	*/
			
			if($("#complexDisountBased").is(':checked')){		
				
				//finalObj.priceBasedConfigurationFlag = $("#offerRewardCriteria").val();
				//finalObj.applyForAllItems = $("#applyForAllItemsProduct").prop("checked");
				
				var offerRewardCriteria= $("#offerRewardCriteria").val();
				
				if(offerRewardCriteria=="true" || offerRewardCriteria=="false")
					{
					finalObj.priceBasedConfigurationFlag=offerRewardCriteria;
					}
				else
					{
					 finalObj.priceBasedConfigurationFlag="false";
					}
				
				
				var ApplyForAll=$("#offercategory").val();
				
				var saleCategory=$("#saleCategory").val();
				var sale_department=$("#sale_department").val();
				var sale_brand=$("#sale_brand").val();
				var CheckFlag=false;
				if(saleCategory!="" && saleCategory!=null && saleCategory!=undefined)
					{
						CheckFlag=true
					}
				if(sale_department!="" && sale_department!=null && sale_department!=undefined)
					{
						CheckFlag=true
					}
				if(sale_brand!="" && sale_brand!=null && sale_brand!=undefined)
					{
						CheckFlag=true
					}
				if(CheckFlag==false && ApplyForAll !="turn_over")
				{
				$("#Error").html("Please Select Category or Department or Brand");
				 focusDiv('Error');
				return;
				}
				
					if(ApplyForAll=="category_turnover")
						{
						 finalObj.applyForAllItems=true;
						}
					else
						{
						 finalObj.applyForAllItems=false;
						}
					
				var ItemPriceRange =$("#offerRewardCriteria").val();
					if(ItemPriceRange=="item_price_range")
						{
						  finalObj.itemSpecificTurnover=true;
						}
					else
						{
						  finalObj.itemSpecificTurnover=false;
						}
					
				finalObj.allowMultipleDiscounts = $("#allownMulDiscProduct").prop("checked");
				finalObj.repeat = $("#isRepeatProduct").prop("checked");	
				var priceBasedProduct=finalObj.priceBasedConfigurationFlag;
				
				finalObj.rewardType = $("#offerRewardProduct").val();
				
				var len1 = $("#slabLis tr").length - 1;
//				offerSlabs=[];
				
			    var bothOrPromotionFlag = false;
			   for(var i=1;i<=len1;i++){
				 var idAttr = $("#slabLis tr:eq("+i+")").attr("id").replace("productrange",'');
				
				 var minPurQty="";
			    minPurQty = $("#"+idAttr+"minquantityProduct").val();
			    var minAmt="";
				 minAmt = $("#"+idAttr+"minamountProduct").val();
				 var rewardValue = $("#"+idAttr+"rewardvalueProduct").val();
				 var rewardQuantity = $("#"+idAttr+"rewardQuantityProduct").val();
				
				 
	          /*if($("#applyForAllItemsProduct").prop("checked")){
					 
					 if(rewardValue < 0 || rewardValue == 0){
						 $("#Error").html("Reward Value should be > 0");
						 $("#"+idAttr+"rewardvalueProduct").focus();
						 return;
					 }
				 }*/
				 
				 if(ApplyForAll=="category_turnover"){
					 
					 if(rewardValue < 0 || rewardValue == 0){
						 $("#Error").html("Reward Value should be > 0");
						 $("#"+idAttr+"rewardvalueProduct").focus();
						 return;
					 }
				 }
				if(priceBasedProduct=="true"){
					 if(rewardValue < 0 || rewardValue == 0){
						 $("#Error").html("Reward Value should be > 0");
						 $("#"+idAttr+"rewardvalueProduct").focus();
						 return;
					 }
					 
				 }
				 
			/* if(priceBasedProduct=="true" && $("#applyForAllItemsProduct").prop("checked")){
					 
					 if(rewardValue < 0 || rewardValue == 0){
						 $("#Error").html("Reward Value should be > 0");
						 $("#"+idAttr+"rewardvalueProduct").focus();
						 return;
					 }
					
				 }*/
				
				if(priceBasedProduct=="true" && ApplyForAll=="category_turnover"){
					 
					 if(rewardValue < 0 || rewardValue == 0){
						 $("#Error").html("Reward Value should be > 0");
						 $("#"+idAttr+"rewardvalueProduct").focus();
						 return;
					 }
					
				 }
				 
					 offerRangeDetails = {
							 "range" : $("#"+idAttr+"rangename2").text(),
							 "minimumPurchaseQuantityString" : $("#"+idAttr+"minquantityProduct").val(),
							 "minimumPurchaseamountString" : $("#"+idAttr+"minamountProduct").val(),
							 "rewardValueString" : $("#"+idAttr+"rewardvalueProduct").val(),
							 "rewardQty" : rewardQuantity,
							 "startPrice" : $("#" + idAttr + "startPriceProduct").val(),
							 "endPrice" : $("#" + idAttr + "endPriceProduct").val(),
							 "itemId" : $("#selected"+idAttr+"itemId").val(),
					 		 "pluCode" :  $("#pluCode"+idAttr+"itemId").val()
					 };
					 editofferSlabs.push(offerRangeDetails);
					 
					 
			}
			   
			   var len = $("#offerSaleSkusProductExclude tr").length-1;
				
				if(len != 0){
				for(var i=1;i<=len;i++){
					var idAttr = $("#offerSaleSkusProductExclude tr:eq("+i+") td:last").attr("id");
					idAttr = idAttr.replace('Del','');
			
						var obj = {
								 "sno" : $("#itemno"+idAttr).text(),
								 "skuId" : $("#itemCode"+idAttr).text(),
								 "itemDesc" : $("#itemDesc"+idAttr).text(),
								 "rewardValue" : $("#amount"+idAttr).val(),
								 "size" : $("#size"+idAttr).text(),
								 "ean" : $("#ean"+idAttr).text(),
								 "discountType" :$('option:selected', $('#dealStatus'+idAttr)).val(),
								 "category" : $("#category"+idAttr).val(),
								 "subCategory" : $("#subCategory"+idAttr).val(),
								 "brand" : $("#brandCode"+idAttr).val(),
								 "model" : $("#modal"+idAttr).val(),
								 "plucode" : $("#pluCode"+idAttr).val(),
								 "minPurchaseQty" : $("#minQty"+idAttr).val(),
								 "rewardQty" : $("#rewardQtyProduct"+idAttr).val(),
								 "section" : $("#section"+idAttr).val(),
								 "department" : $("#department"+idAttr).val(),
								 "exclusionItem":true
						 };
						items.push(obj);
						
					}
				finalObj.offerProducts=items
				}
			   
				}	
			
			
			if (editofferRanges.editofferSlabs.length == 0) {
				
				editofferRangeDetails = {
						 "minimumPurchaseQuantityString" : "1",
						 "minimumPurchaseamountString" : "0",
						 "rangeRewardType" : "reward",
						 "rewardValueString" : 0,
						 "rewardQty" : 1,
						// "rangeMode" : $("#"+idAttr+"rangeMode").val(),
						// "description" : $("#"+idAttr+"description").val(),
						 //"groupId" : $("#selected"+idAttr+"groupId").val(),
						 "startPrice" : 0,
						 "endPrice" : 0
						
				 		
				 };
			
				editofferRanges.editofferSlabs.push(editofferRangeDetails);
			}
			
			//finalObj.sellPluCode = salePluCode.toString();
		} 
		
	}
		if ($("#basedOnGroup").prop("checked") == true) {
			debugger;
			//finalObj.priceBasedConfigurationFlag = $("#offerRewardCriteriaGroup").val();
			

			var ItemPriceRange =$("#offerRewardCriteriaGroup").val();
			
			if(ItemPriceRange=="true" || ItemPriceRange=="false")
			{
				finalObj.priceBasedConfigurationFlag=ItemPriceRange;
			}
			else
				{
				finalObj.priceBasedConfigurationFlag="true";
				}
			
			
			if(ItemPriceRange=="item_price_range")
				{
				  finalObj.itemSpecificTurnover=true;
				}
			else
				{
				  finalObj.itemSpecificTurnover=false;
				}
			
			finalObj.applyForAllItems = $("#applyForAllItemsGroup").prop("checked");
			finalObj.rewardType = $("#offerReward").val();
			finalObj.allowMultipleDiscounts = $("#allownMulDisc").prop("checked");
			finalObj.repeat = $("#isRepeat").prop("checked");
			
			
			var applyforItems=finalObj.applyForAllItems;
			var pricebasedConfig=finalObj.priceBasedConfigurationFlag;
			if(applyforItems=="" || applyforItems==undefined)
				{
				applyforItems=false;
				}
			debugger;
			if(applyforItems==false && pricebasedConfig=="false"){
			if ($("#saleGroupId").length > 0) {
				finalObj.sellGroupId = $("#saleGroupId").text();
				var len = $("#saleGroupSkuOffer tr").length - 1;
				var saleGroupSku = [];
				var saleGroupPlu = [];
				for (var i = 1; i <= len; i++) {
					var idAttr = $("#saleGroupSkuOffer tr:eq(" + i + ") td:last")
							.attr("id");
					idAttr = idAttr.replace('DelsaleGroupSku', '');
					var skuId = $("#skusaleGroupSku" + idAttr).text();
					var pluCode = $("#pluCodesaleGroupSku" + idAttr).text();
					saleGroupSku.push(skuId);
					saleGroupPlu.push(pluCode);
				}
				if (saleGroupSku.length > 0)
					finalObj.sellSkuids = saleGroupSku.toString();
				if (saleGroupPlu.length > 0)
					finalObj.sellPluCode = saleGroupPlu.toString();
			} else {
				$("#Error").html(
						"Please Select Sale Group Id and Deal Group Id");
				focusDiv('Error');
				return;
			}
			}
			
			if(ItemPriceRange=="item_price_range" || ItemPriceRange=="group_turn_over"){
				if ($("#saleGroupId").length > 0) {
					finalObj.sellGroupId = $("#saleGroupId").text();
					var len = $("#saleGroupSku tr").length - 1;
					var saleGroupSku = [];
					var saleGroupPlu = [];
					for (var i = 1; i <= len; i++) {
						var idAttr = $("#saleGroupSku tr:eq(" + i + ") td:last")
								.attr("id");
						idAttr = idAttr.replace('DelsaleGroupSku', '');
						var skuId = $("#skusaleGroupSku" + idAttr).text();
						var pluCode = $("#pluCodesaleGroupSku" + idAttr).text();
						saleGroupSku.push(skuId);
						saleGroupPlu.push(pluCode);
					}
					if (saleGroupSku.length > 0)
						finalObj.sellSkuids = saleGroupSku.toString();
					if (saleGroupPlu.length > 0)
						finalObj.sellPluCode = saleGroupPlu.toString();
				} else {
					$("#Error").html(
							"Please Select Sale Group Id");
					focusDiv('Error');
					return;
				}
				}
	debugger
		if($("#itemDisountBasedGroup").is(':checked')){
			var len = $("#offerSalegroupSkus tr").length-1;
			
			if(len == 0){
				alert("Add Atleast One item");
				return false;
				}
			
			for(var i=1;i<=len;i++){
				var idAttr = $("#offerSalegroupSkus tr:eq("+i+") td:last").attr("id");
				idAttr = idAttr.replace('Del','');
		
					var obj = {
							 "sno" : $("#itemno"+idAttr).text(),
							 "skuId" : $("#itemCode"+idAttr).text(),
							 "itemDesc" : $("#itemDesc"+idAttr).text(),
							 "rewardValue" : $("#amount"+idAttr).val(),
							 "size" : $("#size"+idAttr).text(),
							 "ean" : $("#ean"+idAttr).text(),
							 "discountType" :$('option:selected', $('#dealStatus'+idAttr)).val(),
							 "category" : $("#category"+idAttr).val(),
							 "subCategory" : $("#subCategory"+idAttr).val(),
							 "brand" : $("#brandCode"+idAttr).val(),
							 "model" : $("#modal"+idAttr).val(),
							 "plucode" : $("#pluCode"+idAttr).val(),
							 "minPurchaseQty" : $("#minQty"+idAttr).val(),
							 "department" : $("#department"+idAttr).val()
							 
					 };
					items.push(obj);
					
				}
			finalObj.offerProducts=items
		}
		
	editofferRanges.editofferSlabs = editofferSlabs;
		if($("#complexbasedOnGroup").is(':checked')){
			//debugger
	var len = $("#editOfferSlabsTable tr").length - 1;
		
	
	var bothOrPromotionFlag = false;
	for (var i = 1; i <= len; i++) {
		var idAttr = $("#editOfferSlabsTable tr:eq(" + i + ")").attr("id")
				.replace("editrange", '');
		
		 var minPurQty =	$("#editrange" + idAttr + "minquantity").val();
		 var minAmt =	$("#editrange" + idAttr + "minamount").val();
		var rewardValue = $("#editrange" + idAttr + "rewardvalue").val();
		var rewardQuantity = $("#editrange" + idAttr + "rewardQuantity").val();
		
		var  startPrice = $("#editrange" + idAttr + "startPrice").val();
		var endPrice = $("#editrange" + idAttr + "endPrice").val();
		
		if (rewardQuantity == "") {
			rewardQuantity = 0;
		}

		if (startPrice == "") {
			startPrice = 0;
		}
		if (endPrice == "") {
			endPrice = 0;
		}
		if($("#applyForAllItemsGroup").prop("checked")){
			 
			 if(rewardValue < 0 || rewardValue == 0){
				 $("#Error").html("Reward Value should be > 0");
				 $("#"+idAttr+"rewardvalue").focus();
				 return;
			 }
		 }
		if(pricebasedConfig=="true"){
			 
			 if(rewardValue == "" || rewardValue=="0"){
				 $("#Error").html("Reward Value should be > 0");
				 $("#"+idAttr+"rewardvalue").focus();
				 return;
			 }
			 
		 if($("#selected"+idAttr+"groupId").val() == ""){
				 $("#Error").html("Group Id should not be empty");
				 $("#"+idAttr+"groupId").focus();
				 return;
			 } 
		 }
		
		
		if(applyforItems==false && pricebasedConfig=="false"){
		if ($("#isCombo").prop("checked")) {
			if ($("#editrange" + idAttr + "rangeMode").val() == "both") {
				if (minPurQty > 0 && minAmt > 0) {
					$("#Error")
							.html(
									"Enter Either Minimum Purchase Quantity Or Minimum Purchase Amount");
					activateHeader('dealConfiguration');
					$("#editrange" + idAttr + "minquantity").focus();
					return;
				}
				if (minPurQty == 0 && minAmt == 0) {
					$("#Error")
							.html(
									"Either Minimum Purchase Quantity Or Minimum Purchase Amount Is Required");
					activateHeader('dealConfiguration');
					$("#editrange" + idAttr + "minquantity").focus();
					return;
				}
				/*if (rewardValue < 0 || rewardValue == 0) {
					$("#Error").html("Reward Value should be > 0");
					activateHeader('dealConfiguration');
					$("#editrange" + idAttr + "rewardvalue").focus();
					return;
				}*/
				/*if (rewardQuantity != 0) {
					$("#Error").html("Reward Quantity should be equal to 0");
					activateHeader('dealConfiguration');
					$("#editrange" + idAttr + "rewardQuantity").focus();
					return;
				}*/
			}
			if ($("#editrange" + idAttr + "rangeMode").val() == "promotion") {
				if (minPurQty != 0 && minAmt != 0) {
					$("#Error")
							.html(
									"Minimum Purchase Quantity and Minimum Purchase Amount Should be 0");
					activateHeader('dealConfiguration');
					$("#editrange" + idAttr + "minquantity").focus();
					return;
				}
				/*if (rewardValue < 0 || rewardValue == 0) {
					$("#Error").html("Reward Value should be > 0");
					activateHeader('dealConfiguration');
					$("#editrange" + idAttr + "rewardvalue").focus();
					return;
				}*/
				/*if (rewardQuantity != 0) {
					$("#Error").html("Reward Quantity should be equal to 0");
					activateHeader('dealConfiguration');
					$("#editrange" + idAttr + "rewardQuantity").focus();
					return;
				}*/
			}
			if ($("#editrange" + idAttr + "rangeMode").val() == "condition") {
				if (minPurQty > 0 && minAmt > 0) {
					$("#Error")
							.html(
									"Enter Either Minimum Purchase Quantity Or Minimum Purchase Amount");
					activateHeader('dealConfiguration');
					$("#editrange" + idAttr + "minquantity").focus();
					return;
				}
				if (minPurQty == 0 && minAmt == 0) {
					$("#Error")
							.html(
									"Either Minimum Purchase Quantity Or Minimum Purchase Amount Is Required");
					activateHeader('dealConfiguration');
					$("#editrange" + idAttr + "minquantity").focus();
					return;
				}
				/*if (rewardValue != 0) {
					$("#Error").html("Reward Value should be equal to 0");
					activateHeader('dealConfiguration');
					$("#editrange" + idAttr + "rewardvalue").focus();
					return;
				}*/
				/*if (rewardQuantity != 0) {
					$("#Error").html("Reward Quantity should be equal to 0");
					activateHeader('dealConfiguration');
					$("#editrange" + idAttr + "rewardQuantity").focus();
					return;
				}*/
				/*
				 * if($("#editrange"+idAttr+"rangeRewardType").val() != "both"){
				 * $("#Error").html("Reward Type Should be Both");
				 * $("#editrange"+idAttr+"rangeRewardType").focus(); return; }
				 */
			}
		} else if ($("#lowestPriceItem").prop("checked")) {
			if ($("#editrange" + idAttr + "rangeMode").val() == "both") {
				if (minPurQty > 0 && minAmt > 0) {
					$("#Error")
							.html(
									"Enter Either Minimum Purchase Quantity Or Minimum Purchase Amount");
					activateHeader('dealConfiguration');
					$("#editrange" + idAttr + "minquantity").focus();
					return;
				}
				if (minPurQty == 0 && minAmt == 0) {
					$("#Error")
							.html(
									"Either Minimum Purchase Quantity Or Minimum Purchase Amount Is Required");
					activateHeader('dealConfiguration');
					$("#editrange" + idAttr + "minquantity").focus();
					return;
				}
				/*if (rewardValue < 0 || rewardValue == 0) {
					$("#Error").html("Reward Value should be > 0");
					activateHeader('dealConfiguration');
					$("#editrange" + idAttr + "rewardvalue").focus();
					return;
				}*/
				/*if (rewardQuantity < 0 || rewardQuantity == 0) {
					$("#Error").html("Reward Quantity should be > 0");
					activateHeader('dealConfiguration');
					$("#editrange" + idAttr + "rewardQuantity").focus();
					return;
				}*/
			}
			if ($("#editrange" + idAttr + "rangeMode").val() == "promotion") {
				if (minPurQty != 0 && minAmt != 0) {
					$("#Error")
							.html(
									"Minimum Purchase Quantity and Minimum Purchase Amount Should be 0");
					activateHeader('dealConfiguration');
					$("#editrange" + idAttr + "minquantity").focus();
					return;
				}
				/*if (rewardValue < 0 || rewardValue == 0) {
					$("#Error").html("Reward Value should be > 0");
					activateHeader('dealConfiguration');
					$("#editrange" + idAttr + "rewardvalue").focus();
					return;
				}*/
				/*if (rewardQuantity < 0 || rewardQuantity == 0) {
					$("#Error").html("Reward Quantity should be > 0");
					activateHeader('dealConfiguration');
					$("#editrange" + idAttr + "rewardQuantity").focus();
					return;
				}*/
			}
			if ($("#editrange" + idAttr + "rangeMode").val() == "condition") {
				if (minPurQty > 0 && minAmt > 0) {
					$("#Error")
							.html(
									"Enter Either Minimum Purchase Quantity Or Minimum Purchase Amount");
					activateHeader('dealConfiguration');
					$("#editrange" + idAttr + "minquantity").focus();
					return;
				}
				if (minPurQty == 0 && minAmt == 0) {
					$("#Error")
							.html(
									"Either Minimum Purchase Quantity Or Minimum Purchase Amount Is Required");
					activateHeader('dealConfiguration');
					$("#editrange" + idAttr + "minquantity").focus();
					return;
				}
				/*if (rewardValue != 0) {
					$("#Error").html("Reward Value should be equal to 0");
					activateHeader('dealConfiguration');
					$("#editrange" + idAttr + "rewardvalue").focus();
					return;
				}*/
				/*if (rewardQuantity != 0) {
					$("#Error").html("Reward Quantity should be equal to 0");
					activateHeader('dealConfiguration');
					$("#editrange" + idAttr + "rewardQuantity").focus();
					return;
				}*/
				/*
				 * if($("#editrange"+idAttr+"rangeRewardType").val() != "both"){
				 * $("#Error").html("Reward Type Should be Both");
				 * $("#editrange"+idAttr+"rangeRewardType").focus(); return; }
				 */
			}
		} else {
			if (minPurQty > 0 && minAmt > 0) {
				$("#Error")
						.html(
								"Enter Either Minimum Purchase Quantity Or Minimum Purchase Amount");
				activateHeader('dealConfiguration');
				$("#editrange" + idAttr + "minquantity").focus();
				return;
			}
			if (minPurQty == 0 && minAmt == 0) {
				$("#Error")
						.html(
								"Either Minimum Purchase Quantity Or Minimum Purchase Amount Is Required");
				activateHeader('dealConfiguration');
				$("#editrange" + idAttr + "minquantity").focus();
				return;
			}
			/*if (rewardValue <= 0) {
				$("#Error").html("Reward Value Should be > 0");
				activateHeader('dealConfiguration');
				$("#editrange" + idAttr + "rewardvalue").focus();
				return;
			}
			if (rewardQuantity > 0) {
				$("#Error").html("Reward Quantity cann't be > 0");
				activateHeader('dealConfiguration');
				$("#editrange" + idAttr + "rewardQuantity").focus();
				return;
			}*/
		}
		
		
		 
		 
		}
		
		/* if($("#offercategory").val() == "group_turn_over" && $("#"+idAttr+"groupId").val() == "")
		 {
			$("#Error").html("GroupId is recquired for Group turnover offer");
			 focusDiv('Error');
			return;
		 }
		*/
		
		if ($("#" + idAttr + "groupId").val() == "")
			$("#selected" + idAttr + "groupId").val("");
		if ($("#" + idAttr + "itemIdgroup").val() == "") {
			$("#selected" + idAttr + "itemIdgroup").val("");
			$("#pluCode" + idAttr + "itemIdgroup").val("");
		}
		// if($("#lowestPriceItem").prop("checked") ||
		// $("#isCombo").prop("checked") || $("#offercategory").val() !=
		// "item_specific"){
		if ($("#editrange" + idAttr + "rangeMode").val() == "both"
				|| $("#editrange" + idAttr + "rangeMode").val() == "promotion")
			bothOrPromotionFlag = true;
		// }
		editofferRangeDetails = {
			"range" : $("#editrange" + idAttr + "rangename").text(),
			"minimumPurchaseQuantityString" : $(
					"#editrange" + idAttr + "minquantity").val(),
			"minimumPurchaseamountString" : $(
					"#editrange" + idAttr + "minamount").val(),
			"rangeRewardType" : $("#editrange" + idAttr + "rangeRewardType")
					.val(),
			"rewardValueString" : $("#editrange" + idAttr + "rewardvalue")
					.val(),
			"rewardQty" : rewardQuantity,
			"rangeMode" : $("#editrange" + idAttr + "rangeMode").val(),
			"description" : $("#editrange" + idAttr + "description").val(),
			"startPrice" : $("#editrange" + idAttr + "startPrice").val(),
			"endPrice" : $("#editrange" + idAttr + "endPrice").val(),
			"groupId" : $("#selected" + idAttr + "groupId").val(),
			"itemId" : $("#selected" + idAttr + "itemIdgroup").val(),
			"pluCode" : $("#pluCode" + idAttr + "itemIdgroup").val()
		};
		editofferRanges.editofferSlabs.push(editofferRangeDetails);
	}
	if (editofferRanges.editofferSlabs.length == 0) {
		$("#Error").html("Add atleast one slab");
		activateHeader('dealConfiguration');
		focusDiv('Error');
		return;
	}
	if (!bothOrPromotionFlag) {
		$("#Error")
				.html(
						"Atleast one slab should have Range Mode as 'Both' or 'Promotion'");
		activateHeader('dealConfiguration');
		focusDiv('Error');
		return;
	}
		}
		
		
		if (editofferRanges.editofferSlabs.length == 0) {
			
			editofferRangeDetails = {
					 "minimumPurchaseQuantityString" : "1",
					 "minimumPurchaseamountString" : "0",
					 "rangeRewardType" : "All",
					 "rewardValueString" : 0,
					 "rewardQty" : 1,
					// "rangeMode" : $("#"+idAttr+"rangeMode").val(),
					// "description" : $("#"+idAttr+"description").val(),
					 //"groupId" : $("#selected"+idAttr+"groupId").val(),
					 "startPrice" : 0,
					 "endPrice" : 0
					
			 		
			 };
		
			editofferRanges.editofferSlabs.push(editofferRangeDetails);
		}
		
		
		}
	
	finalObj.offerRanges = JSON.stringify(editofferRanges);
	finalObj.offerProducts = items;
	/*
	 * finalObj.authorisedBy = $("#autorisedBy").val(); finalObj.closedBy =
	 * $("#closedBy").val(); finalObj.closedOnStr = $("#closedOn").val();
	 * finalObj.closedReason = $("#closedReason").val();
	 */
	var formData = JSON.stringify(finalObj);
	 console.log(formData);
	var contextPath = $("#contextPath").val();
	URL = contextPath + "/dealsAndOffers/updateOffer.do";
	$.ajax({
		type : "POST",
		url : URL,
		contentType : "application/json",
		data : formData,

		beforeSend : function(xhr) {
			$("#loading").css("display", "block");
			$("#mainDiv").addClass("disabled");
		},
		success : function(result) {
			$("#right-side").html(result);
			$("#from").val(fromDate);
			$("#to").val(toDate);
			$("#offerStatusValue").val(offerStatusValue);
			$("#loading").css("display", "none");
			$("#mainDiv").removeClass('disabled');

		},
		error : function() {
			alert("something went wrong");
			$("#loading").css("display", "none");
			$("#mainDiv").removeClass('disabled');

		}
	});

}

function searchProductGroupMaster(name, searchCategory) {
	var contextPath = $("#contextPath").val();
	URL = contextPath + "/inventorymanager/searchProductGroupMaster.do";
	$.ajax({
		type : "GET",
		url : URL,
		data : {
			searchName : name
		},
		beforeSend : function(xhr) {
			$("#loading").css("display", "block");
			$("#mainDiv").addClass("disabled");
		},
		success : function(result) {
			appendProductGroups(result, searchCategory);
			$("#loading").css("display", "none");
			$("#mainDiv").removeClass('disabled');

		},
		error : function() {
			alert("something went wrong");
			$("#loading").css("display", "none");
			$("#mainDiv").removeClass('disabled');

		}
	});
}

function appendProductGroups(groupsList, searchCategory) {
	$("." + searchCategory).html('');
	var op = '';
	for (var i = 0; i < groupsList.length; i++) {
		if (i == 0) {
			op += '<li id="' + groupsList[i].groupId
					+ '"  class="selected" onclick=getId(this,"'
					+ searchCategory + '"); ><a>'
					+ groupsList[i].groupDescription + '</a></li>';
		} else
			op += '<li id="' + groupsList[i].groupId + '" onclick=getId(this,"'
					+ searchCategory + '"); ><a>'
					+ groupsList[i].groupDescription + '</a></li>';
	}
	$("." + searchCategory).html(op);
	$("." + searchCategory).show();
}

function addGroup(id, type) {
	//debugger
	$("#" + type).val("");
	
	
	var typeGroup =""
	typeGroup = $("#typeForGroup").val();
	
	if(typeGroup == 'new'){
	var len = $("#slabsList tr").length - 1;
	for(var i=1;i<=len;i++){
		 var idAttr = $("#slabsList tr:eq("+i+")").attr("id").replace("range",'');
		$("#"+idAttr+"groupId").val(id);
		$("#selected"+idAttr+"groupId").val(id);
	    }
	}
	else{
	var len = $("#editOfferSlabsTable tr").length - 1;
	for(var i=2;i<=len;i++){
		 var idAttr = $("#editOfferSlabsTable tr:eq("+i+")").attr("id").replace("editrange",'');
		$("#"+idAttr+"groupId").val(id);
		$("#selected"+idAttr+"groupId").val(id);
	    }
	
	}
    
	var contextPath = $("#contextPath").val();
	var row = "<tr id='dynamicdiv"
			+ type
			+ "' style='margin-top:5px;'><td id='"
			+ type
			+ "Id'>"
			+ id
			+ "</td>"
			+ "<td id='Del"
			+ type
			+ "' ><img id='Img"
			+ type
			+ "' src='"
			+ contextPath
			+ "/images/itemdelete.png' style='width:15%;cursor:pointer;' onclick='deleteItem(this);' title='Delete "
			+ id + "'/>" + "</td></tr>";
	$("#" + type + "ProductsId tbody").html("");
	$("#" + type + "ProductsId tbody").append(row);
}

function deleteItem(element) {
	//debugger
	var id = $(element).attr("id").replace('Img', '');
	$('#dynamicdiv' + id).remove();
	
	var len = $("#slabsList tr").length - 1;
//	offerSlabs=[];
	
 	var bothOrPromotionFlag = false;
    for(var i=1;i<=len;i++){
	 var idAttr = $("#slabsList tr:eq("+i+")").attr("id").replace("range",'');
	$("#"+idAttr+"groupId").val("");
    }
	
}

function searchGroupSkus(name, searchCategory) {
	debugger
	var groupId = "";
	if (searchCategory == "saleGroupSku") {
		if ($("#saleGroupId").length > 0) {
			groupId = $("#saleGroupId").text();
		} else {
			alert("Please Select Sale Group Id");
			return;
		}
	} else if (searchCategory == "dealGroupSku") {
		if ($("#dealGroupId").length > 0) {
			groupId = $("#dealGroupId").text();
		} else {
			alert("Please Select Deal Group Id");
			return;
		}
	}
	var contextPath = $("#contextPath").val();
	URL = contextPath + "/inventorymanager/searchGroupSkus.do";
	$.ajax({
		type : "GET",
		url : URL,
		data : {
			groupId : groupId,
			searchCriteria : name
		},
		beforeSend : function(xhr) {
			$("#loading").css("display", "block");
			$("#mainDiv").addClass("disabled");
		},
		success : function(result) {
			debugger
			appendGroupSkus(result, searchCategory);
			
			$("#loading").css("display", "none");
			$("#mainDiv").removeClass('disabled');

		},
		error : function() {
			alert("something went wrong");
			$("#loading").css("display", "none");
			$("#mainDiv").removeClass('disabled');

		}
	});
}

function appendGroupSkus(groupChildList, searchCategory) {
	debugger
	$("." + searchCategory).html('');
	var op = '';
	for (var i = 0; i < groupChildList.length; i++) {
		if (i == 0) {
			op += '<li id="' + groupChildList[i].pluCode
					+ '"  class="selected" onclick=getId(this,"'
					+ searchCategory + '"); ><a>' + groupChildList[i].skuId
					+ '</a><input type="hidden" value="'
					+ groupChildList[i].skuId + '"/></li>';
		} else
			op += '<li id="' + groupChildList[i].pluCode
					+ '" onclick=getId(this,"' + searchCategory + '"); ><a>'
					+ groupChildList[i].skuId
					+ '</a><input type="hidden" value="'
					+ groupChildList[i].skuId + '"/></li>';
	}
	$("." + searchCategory).html(op);
	$("." + searchCategory).show();
	
	/*
	op += '<li id="' + groupChildList[i].pluCode
	+ '" onclick=getId(this,"' + searchCategory + '"); ><a>'
	+ groupChildList[i].skuId
	+ '</a><input type="hidden" value="'
	+ groupChildList[i].pluCode + '"/></li>';*/
}

function addGroupSkuToTable(skuId, id, type) {
	//debugger
	$("#" + type + "Search").val("");
	//$("#groupId").val(skuId);
	
	
	var flag = true;
	var contextPath = $("#contextPath").val();
	var remove = contextPath + "/images/itemdelete1.png";
	$("." + type + "PluCode").each(function() {
		if ($(this).val() == id) {
			alert(id + " plu already added");
			flag = false;
			return;
		}
	});
	var len = parseInt($("#" + type + " tr").length);
	if (len != 1)
		len = parseInt($("#" + type + " tr:last").attr("id").replace('dynamicdiv', '')) + 1;
	if (flag == true) {
		$('#' + type)
				.append(
						'<tr id="dynamicdiv'
								+ type
								+ len
								+ '" style="margin-top:5px;"><td style="font-size: 100%;"><span id="sku'
								+ type
								+ len
								+ '" style="color: rgb(81, 93, 107)">'
								+ skuId
								+ '</span></td>'
								/*+ '<td id="pluCode'
								+ type
								+ len
								+ '">'
								+ id
								+ '</td><input type="hidden" class="'
								+ type
								+ 'PluCode" value="'
								+ id
								+ '" />'*/
								+ '<td id="Del'
								+ type
								+ len
								+ '" class="price" style="font-size: 100%;"><center><img id="Img'
								+ type
								+ len
								+ '" src='
								+ remove
								+ ' style="cursor:pointer;" onclick="deleteItem(this);"></center></td></tr>');
	}
}
$("#saleCategory").on('input',function(e){
	   $("#stockError").html("");
	   $(".Error").html("");
});
//written by manasa
function toggleItemComplexBased(id) {

	$(".minQtyProduct").removeAttr("disabled");
	$(".minAmtProduct").removeAttr("disabled");
	$(".itemSearch").removeAttr("disabled");
	$(".rewardQuantity").removeAttr("disabled");
	$(".startPricePro").attr("disabled","disabled");
	$(".endPricePro").attr("disabled","disabled");
	$('#offerSaleSkusProduct tbody > tr').show();
	$(".groupSearch").removeAttr("disabled","disabled");
	$(".minQty").removeAttr("disabled","disabled");
	$(".minAmt").removeAttr("disabled","disabled");
	
	if(id=="itemDisountBased" || id=="complexDisountBased"){
	if($("#itemDisountBased").prop("checked") || $("#complexDisountBased").prop("checked")){
		$("#basedOnProduct").prop("checked", true);
		$("#basedOnGroup").removeAttr("checked");
		$("#itemDisountBasedGroup").removeAttr("checked");
		$("#complexbasedOnGroup").removeAttr("checked");
		
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
		//debugger
	$("#categorySubDept1").text("");
	var selections = "";
	if($("#saleCategory").val()!=undefined && $("#saleCategory").val()!="")
		selections = $("#saleCategory").val();
	
	if($("#sale_department").val()!=undefined && $("#sale_department").val()!="")
		selections = selections+'/'+ $("#sale_department").val();
	
	if($("#sale_brand").val()!=undefined && $("#sale_brand").val()!="")
		selections = selections+'/'+ $("#sale_brand").val();
	
		$("#categorySubDept1").text(selections);
		
	}
	
}


function toggleBased(id) {
	
	$(".minQtyProduct").removeAttr("disabled");
	$(".minAmtProduct").removeAttr("disabled");
	$(".itemSearch").removeAttr("disabled");
	$(".rewardQuantity").removeAttr("disabled");
	$(".startPricePro").attr("disabled","disabled");
	$(".endPricePro").attr("disabled","disabled");
	$("#itemDisountBased").prop("checked", true);
	$('#offerSaleSkusProduct tbody > tr').show();
	$(".groupSearch").removeAttr("disabled","disabled");
	$(".minQty").removeAttr("disabled","disabled");
	$(".minAmt").removeAttr("disabled","disabled");
	
	if (id == "basedOnProduct") {
		if ($("#" + id).prop("checked") == true) {
			$("input.basedOnProduct").removeAttr("readonly");
			$("select.basedOnProduct").removeAttr("disabled");
			//$("input.basedOnGroup").attr("readonly", "readonly");
			$("#basedOnGroup").removeAttr("checked");
			//$("#basedOnGroup").prop("checked", false);
			
			
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
			$("basedOnGroup").prop("checked", true);
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
			$("input.basedOnGroup").attr("readonly", "readonly");
			$("select.basedOnProduct").removeAttr("disabled");
			$("input.basedOnProduct").removeAttr("readonly");
			$("#itemDisountBasedGroup").removeAttr("checked");
			$("#complexbasedOnGroup").removeAttr("checked")
			$("#basedOnProduct").prop("checked", true);
			// if($("#offercategory").length>0)
			// toggleItemSpecific('offercategory');
		}
	}

}



function toggleRewardCriteria(id) {
	debugger;
	
	var rewardValue=$("#offerRewardCriteria").val();
	if(id=="offerRewardCriteria"){
		if (rewardValue == "false") {
			//$("#minQtyProduct").attr("disabled", "disabled");
			$(".startPricePro").attr("disabled","disabled");;
			$(".endPricePro").attr("disabled","disabled");
			$(".minQtyProduct").removeAttr("disabled");
			$(".minAmtProduct").removeAttr("disabled");
		} else if(rewardValue == "true") {
			$(".startPricePro").removeAttr("disabled");
			$(".endPricePro").removeAttr("disabled","disabled");
			$(".minQtyProduct").attr("disabled","disabled");
			$(".minAmtProduct").attr("disabled","disabled");
			
		}else
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
			}
	}
	var rewardCriteriaGroup=$("#offerRewardCriteriaGroup").val();
	if(id=="offerRewardCriteriaGroup"){
		if (rewardCriteriaGroup == "true") {
		$(".minQty").attr("disabled","disabled");
		$(".minAmt").attr("disabled","disabled");
		$(".itemSearch").attr("disabled","disabled");
		$(".rewardQuantity").attr("disabled");
		$(".startPrice").removeAttr("disabled");
		$(".endPrice").removeAttr("disabled");
		$(".groupSearch").removeAttr("disabled");
	    $(".groupSearch").val('');
		$(".itemSearch").val('');
		}
	else
		{
		$(".minQty").removeAttr("disabled");
		$(".minAmt").removeAttr("disabled");
		$(".itemSearch").removeAttr("disabled");
		$(".rewardQuantity").removeAttr("disabled");
		$(".startPrice").attr("disabled","disabled");
		$(".endPrice").attr("disabled","disabled");
		$(".groupSearch").removeAttr("disabled");
		$(".groupSearch").val('');
		$(".itemSearch").val('');
		
		
		}
		
	}
	}
	
	

function toggleItemSpecificSaleprice(id) {
	debugger;
	var offerCategory=$("#" + id).val();
	
	if(offerCategory.includes("turn_over")){
		$("#applysaleprice").removeAttr("disabled");
	}else{
		$("#applysaleprice").prop("checked", false);
		$("#applysaleprice").attr("disabled", "disabled");
	
	}
	}


function toggleItemSpecific(id) {
	debugger;
	var offerCategory=$("#" + id).val();
	
	if ( offerCategory == "turn_over" || offerCategory == "group_turn_over") {
		$('#basedOnGroup').attr('checked')
		$("input.saleGroups").attr("readonly", "readonly");
		$("select.saleGroups").attr("disabled", "disabled");
		$("#basedOnProduct").removeAttr("disabled");
		$("#basedOnGroup").attr("disabled", "disabled");
		//$("#basedOnProduct").attr("disabled", "disabled");
		$("#isCombo").removeAttr("checked");
		$("#basedOnGroup").removeAttr("disabled");
		$("#lowestPriceItem").removeAttr("checked");
		$("#isCombo").attr("disabled", "disabled");
		$("#lowestPriceItem").attr("disabled", "disabled");
		//$(".minQty").val('0');
		//$(".minQty").attr("readonly", "readonly");
	} else {
		$('#basedOnProduct').attr('checked')
	
		$("#basedOnGroup").attr("disabled", "disabled");
		$("#basedOnProduct").removeAttr("disabled");
		$(".minQty").removeAttr("readonly");
		$("#isCombo").removeAttr("disabled");
		$("#lowestPriceItem").removeAttr("disabled");
		if ($("#basedOnProduct").prop("checked") == true) {
			$("input.saleGroups.basedOnProduct").removeAttr("readonly");
			$("select.saleGroups.basedOnProduct").removeAttr("disabled");
		}
		if ($("#basedOnGroup").prop("checked") == true) {
			$("input.saleGroups.basedOnGroup").removeAttr("readonly");
			$("select.saleGroups.basedOnGroup").removeAttr("disabled");
			$("input.saleGroups.basedOnProduct").removeAttr("readonly");
			$("select.saleGroups.basedOnProduct").removeAttr("disabled");
		}
	}
	
	
	if(offerCategory == "item_specific")
		{
		$(".startPricePro").val(0);
		$(".endPricePro").val(0);
			var dp;
			dp += '<option value="false" >Quantity Based</option>';
			 $("#offerRewardCriteria").html('');
			 $("#offerRewardCriteria").html(dp);
			 
			 var dp2;
				dp2 += '<option value="false" >Quantity Based</option>';
				//dp2 += '<option value="true" >TurnOver Based</option>';
				$("#offerRewardCriteriaGroup").html('');
				$("#offerRewardCriteriaGroup").html(dp2);
				
				$("#basedOnProduct").prop("checked", true);
				$("#itemDisountBased").prop("checked", true);
				
				toggleBased('basedOnProduct');
				toggleItemComplexBased('itemDisountBased');
		}
	else if(offerCategory == "category_turnover")
		{
		$(".minQtyProduct").val(0);
		$(".minAmtProduct").val(0);
			var dp;
			dp += '<option value="category_turnover" >Category TurnOver</option>';
			dp += '<option value="item_price_range" >Item Price Range</option>';
			 $("#offerRewardCriteria").html('');
			 $("#offerRewardCriteria").html(dp);
			 
			 var dp2;
				dp2 += '<option value="false" >Quantity Based</option>';
				//dp2 += '<option value="true" >TurnOver Based</option>';
				$("#offerRewardCriteriaGroup").html('');
				$("#offerRewardCriteriaGroup").html(dp2);
				
				$("#basedOnProduct").prop("checked", true);
				$("#complexDisountBased").prop("checked", true);
				toggleItemComplexBased('complexDisountBased');
				toggleRewardCriteria('offerRewardCriteria');
				
				$(".minQty").attr("readonly", "readonly");
				//toggleBased('basedOnProduct');
				
				
		}
	else if(offerCategory=="turn_over")
		{
		$(".minQtyProduct").val(0);
		$(".minAmtProduct").val(0);
			var dp;
			dp += '<option value="true" >Cart TurnOver</option>';
			$("#offerRewardCriteria").html('');
			$("#offerRewardCriteria").html(dp);
			
			var dp2;
			dp2 += '<option value="false" >Quantity Based</option>';
			//dp2 += '<option value="true" >TurnOver Based</option>';
			$("#offerRewardCriteriaGroup").html('');
			$("#offerRewardCriteriaGroup").html(dp2);
			
			$("#basedOnProduct").prop("checked", true);
			$("#complexDisountBased").prop("checked", true);
			toggleItemComplexBased('complexDisountBased');
			toggleRewardCriteria('offerRewardCriteria');
			
		}
	else if(offerCategory=="group_turn_over")
		{
		$(".startPricePro").val(0);
		$(".endPricePro").val(0);
			var dp2;
			dp2 += '<option value="group_turn_over" >Group Turnover</option>';
			dp2 += '<option value="item_price_range" >Item Price Range</option>';
			$("#offerRewardCriteriaGroup").html('');
			$("#offerRewardCriteriaGroup").html(dp2);
			
			$("#basedOnGroup").prop("checked", true);
			$("#complexbasedOnGroup").prop("checked", true);
			$("#itemDisountBased").removeAttr("checked");
			toggleBased('basedOnGroup');
			
			//$(".minQty").attr("disabled","disabled");
			//$(".minAmt").attr("disabled","disabled");
			$(".itemSearch").attr("disabled","disabled");
			//$(".rewardQuantity").attr("disabled","disabled");
			$(".startPrice").removeAttr("disabled");
			$(".endPrice").removeAttr("disabled","disabled");
			$(".groupSearch").removeAttr("disabled");
			$(".itemSearch").val('');
			$(".minQty").val('');
			$(".minAmt").val('');
			$('#offerSalegroupSkus tbody > tr').hide();
		}
	
}
function toggleRepeat(id, op) {
	debugger;
	if (op == 'edit') {
		if ($("#" + id).val() == "percentage" || $("#" + id).val() == "qty_specific_cash_discount") {
			$("#isRepeat").removeAttr("disabled");
			//$("#isRepeat").attr("disabled", "disabled");
		} else {
			$("#isRepeat").removeAttr("disabled");
		}
	} else {
		if ($("#" + id).val() == "percentage") {
			/*$("#isRepeat").attr("disabled", "disabled");
			$("#isRepeat").removeAttr("checked");*/
			$("#isRepeat").removeAttr("disabled");
			$("#isRepeat").prop("checked", true);
		} else {
			$("#isRepeat").removeAttr("disabled");
			$("#isRepeat").prop("checked", true);
		}
	}
	
    if($("#basedOnGroup").is(':checked')){
		if ($("#offerReward").val() == "gift_coupon") {
			
			$("#CouponCodeforOffer").removeClass("disabled");
		}else{
			$("#CouponCodeforOffer").addClass("disabled");
		}
	}else{
		
		if ($("#offerRewardProduct").val() == "gift_coupon") {
			
			$("#CouponCodeforOffer").removeClass("disabled");
		}else{
			$("#CouponCodeforOffer").addClass("disabled");
		}
	}
	
	
	
	
	
}





/*
 * var dealSlabDivContent = '<tr id=range'+1+'><td style=width:10%;display:none><span
 * id='+1+'rangename>range'+1+'</span><td style=width:15%><input
 * class="form-control searchItems groupSearch" id='+1+'groupId
 * placeholder="Enter Group Id"><div class=services><div class=items><ul class="matchedStringUl '+1+'groupId" style=width:138px;display:none></ul></div></div><input
 * type=hidden id=selected'+1+'groupId><td style=width:15%><input
 * class="form-control searchItems itemSearch" id='+1+'itemId placeholder="Enter
 * Item"><div class=services><div class=items><ul class="matchedStringUl '+1+'itemId" style=width:138px;display:none></ul></div></div><input
 * type=hidden id=selected'+1+'itemId> <input type=hidden id=pluCode'+1+'itemId><td style=width:15%><input
 * class=form-control id='+1+'minquantity
 * oninput=this.value=this.value.replace(/[^0-9.]/g,""),this.value=this.value.replace(/(\..*)\./g,"$1")><td style=width:15%><input
 * class=form-control id='+1+'minamount
 * oninput=this.value=this.value.replace(/[^0-9.]/g,""),this.value=this.value.replace(/(\..*)\./g,"$1")><td style=width:15%><input
 * class=form-control id='+1+'rewardvalue
 * oninput=this.value=this.value.replace(/[^0-9.]/g,""),this.value=this.value.replace(/(\..*)\./g,"$1")><td style=width:15%><input
 * class=form-control id='+1+'description><td style=width:8%><img
 * src=/OmniRetailerConsole-FMCG/images/addslab.png
 * style=width:33px;cursor:pointer onclick=addOfferSlab()> <img
 * src=/OmniRetailerConsole-FMCG/images/itemdelete1.png
 * style=width:24px;cursor:pointer onclick=deleteSlab("range'+1+'")>';
 */
var dealSlabDivContent = null;
function setDealSlabDivContent() {
	dealSlabDivContent = $('#range1').prop('outerHTML');
}


var dealProductSlabDivContent = null;
function setDealProductSlabDivContent() {
	//debugger
	dealProductSlabDivContent = $('#productrange1').prop('outerHTML');
}


var editDealSlabDivContent = null;
function setEditDealSlabDivContent() {
	editDealSlabDivContent = $('#editrange1').prop('outerHTML');
}


var editProductDealSlabDivContent = null;
function setEditProductDealSlabDivContent() {
	editProductDealSlabDivContent = $('#productrange1').prop('outerHTML');
}

function deleteSlab(id) {
	//debugger
	// var id = $(element).attr("id").replace('Img','');
	
	
	var len = $("#slabsList tr").length - 1;
	if (len <= 1) {
		alert("Atleast One Range is Required");
		return;
	}
	$('#' + id).remove();
}


function deleteProductSlab(id) {
	debugger;
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


$('#searchOffers').on('input', function(e) {
	if ($(this).val().trim() == "") {
		viewdealsandoffers('offers', 'dealsConfigurations', '0');
	}
});

function searchOffers(name, searchCategory, index) {
	debugger;
	var location = "";
	if ($("#outletLocation").length > 0)
		location = $("#outletLocation").val();

	name=""
		if($("#searchOffers").length>0)
			name = $("#searchOffers").val().trim();

	var maxRecords = 10;
	if ($("#maxRecords").length > 0)
		maxRecords = $("#maxRecords").val();

	
	var allLocationsList = [];
	var length = $('#outletLocation').children('option').length;
	$('#outletLocation option').each(function() { 
		allLocationsList.push( $(this).attr('value'));
	});

	var  locationList = "";
	if(location == "")
	for(i=1;i<allLocationsList.length;i++)
	{
		locationList = locationList + allLocationsList[i]+',';
	}

	var startDate = "";
	var endDate = "";
	if ($("#from").val() != "" && $("#to").val() != "") {
		var noOfDays = daydiff(parseDate($('#from').val()), parseDate($('#to')
				.val()));
		if (noOfDays < 0) {
			alert("Start Date can't be less than End Date");
			return;
		}
		startDate = $("#from").val();
		endDate = $("#to").val();
	} else if ($("#from").val() != "")
		startDate = $("#from").val();
	else if ($("#to").val() != "")
		endDate = $("#to").val();
	startDate = startDate.replace('/', '-').replace('/', '-');
	endDate = endDate.replace('/', '-').replace('/', '-');

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


	URL = contextPath + "/dealsAndOffers/searchOffers.do";
	$.ajax({
		type : "GET",
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
			locationsList : locationList,
//			offerStatusValue : offerStatusValue,
			zone : zone,
			saveFlag:saveFlag


		},
		beforeSend : function(xhr) {
			$("#loading").css("display", "block");
			$("#mainDiv").addClass("disabled");
		},
		success : function(result) {
			$("#right-side").html(result);
			/*
			 * if($("#searchProduct").val != "")
			 * $("#pagination").css("display","none"); else
			 * $("#pagination").css("display","block");
			 */
			
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
			
			$("#loading").css("display", "none");
			$("#mainDiv").removeClass('disabled');
		},
		error : function() {
			alert("something went wrong");
			$("#loading").css("display", "none");
			$("#mainDiv").removeClass('disabled');
		}
	});
}
/*
 * $(".itemSearch").keydown(function(e){ var id = $(this).attr("id");
 * if($(this).val().length<3){ $("#selected"+id).val("");
 * $("#pluCode"+type).val(""); } $("."+id).children("li").each(function(){ var
 * group = $(this).children("a").text().trim();
 * if($("#"+id).val().trim().toLowerCase() == group.toLowerCase()){
 * $("#"+id).val($("#"+id).val().trim());
 * $("#selected"+id).val($("#"+id).val().trim()); var pluCode =
 * $(this).children("input").val(); $("#pluCode"+type).val(pluCode);
 * $(".services").hide(); $(".matchedStringUl").html(""); return; } else{
 * $("#selected"+id).val(""); $("#pluCode"+type).val(""); } }); if(e.keyCode ==
 * 9){ if($("#"+id).val()!="" && $("#selected"+id).val() == ""){
 * $("#"+id).val(""); } $(".services").hide(); $(".matchedStringUl").html(""); }
 * });
 * 
 * $(".groupSearch").keydown(function(e){ var id = $(this).attr("id");
 * if($(this).val().length<3){ $("#selected"+id).val(""); }
 * $("."+id).children("li").each(function(){ var group =
 * $(this).children("a").text().trim(); if($("#"+id).val().trim().toLowerCase() ==
 * group.toLowerCase()){ $("#"+id).val($("#"+id).val().trim());
 * $("#selected"+id).val($("#"+id).val().trim()); $(".services").hide();
 * $(".matchedStringUl").html(""); return; } else{ $("#selected"+id).val(""); }
 * }); if(e.keyCode == 9){ if($("#"+id).val()!="" && $("#selected"+id).val() ==
 * ""){ $("#"+id).val(""); } $(".services").hide();
 * $(".matchedStringUl").html(""); } });
 */

function keyDownMethod(e, ele) {
	// console.log(e);
	if (e == 27) {
		var typeSearch = $(ele).siblings("div").children("div").children("ul")
				.attr("class").replace('matchedStringUl ', '');
		if (typeSearch.indexOf("groupId") > -1) {
			$("#" + typeSearch).val("");
			$("#selected" + typeSearch).val("");
		} else if (typeSearch.indexOf("itemId") > -1) {
			$("#" + typeSearch).val("");
			$("#selected" + typeSearch).val("");
			$("#pluCode" + typeSearch).val("");
		}
		$(ele).siblings("div .services").hide();
		$(ele).siblings("div").children("div").children(".matchedStringUl")
				.html(""); // need check
	} else if (e == 13) { // enter
		// console.log("inside 13 block");
		if ($(ele).siblings("div").is(":visible")) {
			// console.log("div is visible");
			$(ele).val(
					$(ele).siblings("div").children("div").children("ul")
							.children(".selected").children("a").text());
			if ($(ele).val().trim() != "") {
				var id = $(ele).siblings("div").children("div").children("ul")
						.children(".selected").children("a").parent()
						.attr("id");
				var typeSearch = $(ele).siblings("div").children("div")
						.children("ul").attr("class").replace(
								'matchedStringUl ', '');
				if (typeSearch.indexOf("groupId") > -1) {
					// var groupId = $("#"+id).children("a").text();
					$("#" + typeSearch).val(id);
					$("#selected" + typeSearch).val(id);
				} else if (typeSearch.indexOf("itemId") > -1) {
					// var groupId = $("#"+id).children("a").text();
					var pluCode = $(ele).siblings("div").children("div")
							.children("ul").children(".selected").children(
									"input").val();
					$("#" + typeSearch).val(id);
					$("#selected" + typeSearch).val(id);
					$("#pluCode" + typeSearch).val(pluCode);
				}
				$(ele).siblings("div .services").hide();
				$(ele).siblings("div").children("div").children(
						"." + typeSearch).html("");
			}
		} else
			$(ele).siblings("div").show();
	} else if (e == 38) { // up
		var selected = $(ele).siblings("div").children("div").children("ul")
				.children(".selected");
		if ($(ele).siblings("div").children("div").children("ul")
				.children("li").length != 1)
			$(ele).siblings("div").children("div").children("ul")
					.children("li").removeClass("selected");
		if (selected.prev().length == 0)
			selected.siblings().last().addClass("selected");
		else
			selected.prev().addClass("selected");
	} else if (e == 40) { // down
		var selected = $(ele).siblings("div").children("div").children("ul")
				.children(".selected");
		if ($(ele).siblings("div").children("div").children("ul")
				.children("li").length != 1)
			$(ele).siblings("div").children("div").children("ul")
					.children("li").removeClass("selected");
		if (selected.next().length == 0)
			selected.siblings().first().addClass("selected");
		else
			selected.next().addClass("selected");
	} else {
		var typeSearch = $(ele).siblings("div").children("div").children("ul")
				.attr("class").replace('matchedStringUl ', '');
		if (typeSearch.indexOf("groupId") > -1) {
			var id = $(ele).attr("id");
			if ($(ele).val().length < 3) {
				$("#selected" + id).val("");
			}
			$("." + id).children("li").each(
					function() {
						var group = $(ele).children("a").text().trim();
						if ($("#" + id).val().trim().toLowerCase() == group
								.toLowerCase()) {
							$("#" + id).val($("#" + id).val().trim());
							$("#selected" + id).val($("#" + id).val().trim());
							$(".services").hide();
							$(".matchedStringUl").html("");
							return;
						} else {
							$("#selected" + id).val("");
						}
					});
			if (e == 9) {
				if ($("#" + id).val() != "" && $("#selected" + id).val() == "") {
					$("#" + id).val("");
				}
				$(".services").hide();
				$(".matchedStringUl").html("");
			}
		} else if (typeSearch.indexOf("itemId") > -1) {
			var id = $(ele).attr("id");
			if ($(ele).val().length < 3) {
				$("#selected" + id).val("");
				$("#pluCode" + id).val("");
			}
			$("." + id).children("li").each(
					function() {
						var group = $(ele).children("a").text().trim();
						if ($("#" + id).val().trim().toLowerCase() == group
								.toLowerCase()) {
							$("#" + id).val($("#" + id).val().trim());
							$("#selected" + id).val($("#" + id).val().trim());
							var pluCode = $(ele).children("input").val();
							$("#pluCode" + type).val(pluCode);
							$(".services").hide();
							$(".matchedStringUl").html("");
							return;
						} else {
							$("#selected" + id).val("");
							$("#pluCode" + id).val("");
						}
					});
			if (e == 9) {
				if ($("#" + id).val() != "" && $("#selected" + id).val() == "") {
					$("#" + id).val("");
				}
				$(".services").hide();
				$(".matchedStringUl").html("");
			}
		}
	}
}

function getGroupIds(ele) {
	var searchName = $(ele).val();
	if (searchName != "" && searchName.length >= 3) {
		$(ele).siblings("div").show();
		var searchCategory = $(ele).siblings("div").children("div").children(
				"ul").attr("class").replace('matchedStringUl ', '');
		searchProductGroupMaster(searchName, searchCategory);
	}
}

function getItemIds(ele) {
	var searchName = $(ele).val();
	if (searchName != "" && searchName.length >= 3) {
		$(ele).siblings("div").show();
		var searchCategory = $(ele).siblings("div").children("div").children(
				"ul").attr("class").replace('matchedStringUl ', '');
		searchBuySkus(searchName, searchCategory);
	}
}


function appendingbardTotable()
{
	//debugger;
	if ($("#complexDisountBased").prop("checked"))
	{
	$("#categorySubDept1").text("");
	var selections = "";
	if($("#saleCategory").val()!=undefined && $("#saleCategory").val()!="")
		selections = $("#saleCategory").val();
	
	if($("#sale_department").val()!=undefined && $("#sale_department").val()!="")
		selections = selections+'/'+ $("#sale_department").val();
	
	if($("#sale_brand").val()!=undefined && $("#sale_brand").val()!="")
		selections = selections+'/'+ $("#sale_brand").val();
	
	$("#categorySubDept1").text(selections);
	}
	var complexbasedSelection=$("#complexDisountBased").prop("checked");
	if(complexbasedSelection==true){
	$("#categorySubDept").text("");
		$("#categorySubDept").text($("#saleCategory").val()+" / "+$("#sale_department").val()+" / "+$("#sale_brand").val());
		
	}
}

function searchSubCategoriesBasedOnCategory(id, subCategoryId) {
	debugger;
	var categoryName = $("#" + id).val();

	if (categoryName != "-- Select --") {
		var contextPath = $("#contextPath").val();
		URL = contextPath
				+ "/inventorymanager/searchSubCategoriesBasedOnCategory.do";
		$.ajax({
			type : "GET",
			url : URL,
			data : {
				categoryName : categoryName
			},
			beforeSend : function(xhr) {
				$("#loading").css("display", "block");
				$("#mainDiv").addClass("disabled");
			},
			success : function(result) {
				//debugger
				//$("#selectedCategoryId").text(categoryName);
				//var selectedcategoryId=$("#selectedCategoryId").text();
				//$("#selectedCategoryId").text("")
				//$("#categorySubDept").append(selectedcategoryId);
				appendSubCategories(result, subCategoryId);
				appendingbardTotable();
				
				if ($("#complexDisountBased").prop("checked"))
					{
				$("#categorySubDept1").text("");
				var selections = "";
				if($("#saleCategory").val()!=undefined && $("#saleCategory").val()!="")
					selections = $("#saleCategory").val();
				
				if($("#sale_department").val()!=undefined && $("#sale_department").val()!="")
					selections = selections+'/'+ $("#sale_department").val();
				
				if($("#sale_brand").val()!=undefined && $("#sale_brand").val()!="")
					selections = selections+'/'+ $("#sale_brand").val();
			   $("#categorySubDept1").text(selections);
					}
				
				$("#loading").css("display", "none");
				$("#mainDiv").removeClass('disabled');
			},
			error : function() {
				alert("something went wrong");
				$("#loading").css("display", "none");
				$("#mainDiv").removeClass('disabled');
			}
		});
	}
	$("#" + subCategoryId).html('');
}

function appendSubCategories(subCategoryList, subCategoryId) {
	var op = '<option value="" >-- Select --</option>';
	for (var i = 0; i < subCategoryList.length; i++) {
		op += '<option value="' + subCategoryList[i].subcategoryName + '" >'
				+ subCategoryList[i].subcategoryDescription + '</option>';

	}
	$("#" + subCategoryId).html('');
	$("#" + subCategoryId).html(op);
}

function searchSectionsBasedOnSubCategory(id, subCategoryId, sectionId) {
	var categoryName = $("#" + id).val();
	var subCategoryName = $("#" + subCategoryId).val();
	if (subCategoryName != "-- Select --") {
		var contextPath = $("#contextPath").val();
		URL = contextPath
				+ "/inventorymanager/searchSubCategoriesBasedOnCategory.do";
		$.ajax({
			type : "GET",
			url : URL,
			data : {
				categoryName : categoryName
			},
			beforeSend : function(xhr) {
				$("#loading").css("display", "block");
				$("#mainDiv").addClass("disabled");
			},
			success : function(result) {
				appendSections(result, subCategoryName, sectionId);
				$("#loading").css("display", "none");
				$("#mainDiv").removeClass('disabled');
			},
			error : function() {
				alert("something went wrong");
				$("#loading").css("display", "none");
				$("#mainDiv").removeClass('disabled');
			}
		});
	}
	$("#" + sectionId).html('');
}

function appendSections(subCategoryList, subCategoryName, sectionId) {
	var op = '<option value="" >-- Select --</option>';

	for (var i = 0; i < subCategoryList.length; i++) {
		if (subCategoryList[i].subcategoryName == subCategoryName) {
			for (var j = 0; j < subCategoryList[i].subcategorySections.length; j++) {
				op += '<option value="'
						+ subCategoryList[i].subcategorySections[j].sectionName
						+ '" >'
						+ subCategoryList[i].subcategorySections[j].sectionName
						+ '</option>';
			}
		}
	}
	$("#" + sectionId).html('');
	$("#" + sectionId).html(op);
}

function changeRangeMode(ele) {
	var id = $(ele).attr("id");
	id = id.replace('rangeMode', '');
	if ($("#lowestPriceItem").prop("checked")) {
		if ($(ele).val() == "both") {
			$("#" + id + "minquantity").removeAttr("readonly");
			$("#" + id + "minamount").removeAttr("readonly");
			$("#" + id + "rewardvalue").removeAttr("readonly");
			$("#" + id + "rewardQuantity").removeAttr("readonly");
			$("#" + id + "rangeRewardType").removeAttr("disabled");
		} else if ($(ele).val() == "promotion") {
			$("#" + id + "minquantity").val('0');
			$("#" + id + "minamount").val('0');
			$("#" + id + "minquantity").attr("readonly", "readonly");
			$("#" + id + "minamount").attr("readonly", "readonly");
			$("#" + id + "rewardvalue").removeAttr("readonly");
			$("#" + id + "rewardQuantity").removeAttr("readonly");
			$("#" + id + "rangeRewardType").removeAttr("disabled");
		} else if ($(ele).val() == "condition") {
			$("#" + id + "rewardvalue").val('0');
			$("#" + id + "rewardvalue").attr("readonly", "readonly");
			$("#" + id + "rewardQuantity").val('0');
			$("#" + id + "rewardQuantity").attr("readonly", "readonly");
			$("#" + id + "rangeRewardType").val('ALL');
			$("#" + id + "rangeRewardType").attr("disabled", "disabled");
			$("#" + id + "minquantity").removeAttr("readonly");
			$("#" + id + "minamount").removeAttr("readonly");
		}
	} else if ($("#isCombo").prop("checked")) {
		$("#" + id + "rewardQuantity").val('0');
		$("#" + id + "rewardQuantity").attr("readonly", "readonly");
		if ($(ele).val() == "both") {
			$("#" + id + "minquantity").removeAttr("readonly");
			$("#" + id + "minamount").removeAttr("readonly");
			$("#" + id + "rewardvalue").removeAttr("readonly");
			$("#" + id + "rangeRewardType").removeAttr("disabled");
		} else if ($(ele).val() == "promotion") {
			$("#" + id + "minquantity").val('0');
			$("#" + id + "minamount").val('0');
			$("#" + id + "minquantity").attr("readonly", "readonly");
			$("#" + id + "minamount").attr("readonly", "readonly");
			$("#" + id + "rewardvalue").removeAttr("readonly");
			$("#" + id + "rangeRewardType").removeAttr("disabled");
		} else if ($(ele).val() == "condition") {
			$("#" + id + "minquantity").removeAttr("readonly");
			$("#" + id + "minamount").removeAttr("readonly");
			$("#" + id + "rewardvalue").val('0');
			$("#" + id + "rewardvalue").attr("readonly", "readonly");
			$("#" + id + "rangeRewardType").val('ALL');
			$("#" + id + "rangeRewardType").attr("disabled", "disabled");
		}
	}
	if ($("#offercategory").val() != "item_specific") {
		$("#" + id + "minquantity").attr("readonly", "readonly");
	}
}



//added by manasa
function toggleComboLowestProduct(id) {
	
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
	
	//if(id=="priceBasedConfigurationProduct" || id == "applyForAllItemsProduct")
	//{
	//$("#isCombo").removeAttr("checked");
	//$("#lowestPriceItem").removeAttr("checked");
	/*if(priceBased==true && applylitems==true)
		{
		$(".minQtyProduct").attr("disabled","disabled");
		$(".minAmtProduct").attr("disabled","disabled");
		$(".itemSearch").attr("disabled","disabled");
		$(".rewardQuantity").attr("disabled");
		$(".startPricePro").removeAttr("disabled");
		$(".endPricePro").removeAttr("disabled","disabled");
		$(".groupSearch").val("");
		//$(".groupSearch").removeAttr("disabled");
		}
	else if(priceBased==false && applylitems==true)
		{
		$(".minQtyProduct").attr("disabled","disabled");
		$(".minAmtProduct").attr("disabled","disabled");
		//$(".groupSearch").attr("disabled","disabled");
		$(".startPricePro").removeAttr("disabled");
		$(".endPricePro").removeAttr("disabled","disabled");
		$(".itemSearch").attr("disabled","disabled");
		$(".groupSearch").val("");
		$(".itemSearch").val('');
		}
	else if(priceBased==true && applylitems==false)
		{
		$(".minQtyProduct").attr("disabled","disabled");
		$(".minAmtProduct").attr("disabled","disabled");
		$(".itemSearch").attr("disabled","disabled");
		$(".rewardQuantity").attr("disabled","disabled");
		$(".startPricePro").removeAttr("disabled");
		$(".endPricePro").removeAttr("disabled","disabled");
		//$(".groupSearch").removeAttr("disabled");
		}
	else if(priceBased==false && applylitems==false)
		{
		$(".minQtyProduct").removeAttr("disabled");
		$(".minAmtProduct").removeAttr("disabled");
		$(".itemSearch").removeAttr("disabled");
		$(".startPricePro").attr("disabled","disabled");;
		$(".endPricePro").attr("disabled","disabled");
		$(".startPrice").val('0');
		$(".endPrice").val('0');
		//$(".groupSearch").removeAttr("disabled");
		}
	}*/

}

//modified by manasa
function toggleComboLowest(id) {
	debugger;
	var priceBased=$("#priceBasedConfigurationGroup").prop("checked");
	var applylitems=$("#applyForAllItemsGroup").prop("checked");
	
	if (id == "lowestPriceItem") {
		if ($("#lowestPriceItem").prop("checked"))
			$("#isCombo").removeAttr("checked");
		$("#priceBasedConfigurationGroup").removeAttr("checked");
		$("#applyForAllItemsGroup").removeAttr("checked");
	}
	
	var rewardCriteriaGroup=$("#offerRewardCriteriaGroup").val();
	var len = $("#slabsList tr").length - 1;
	for(var i=1;i<=len;i++){
		 var idAttr = $("#slabsList tr:eq("+i+")").attr("id").replace("range",'');
			var groupId = $("#selected"+idAttr+"groupId").val();
		$("#"+idAttr+"groupId").val(groupId);
		$("#selected"+idAttr+"groupId").val(groupId);
	    }
	
	/*if(applylitems==true)
	{
	$("#lowestPriceItem").removeAttr("checked");
	$("#isCombo").removeAttr("checked");
	$(".minQty").attr("disabled","disabled");
	$(".minAmt").attr("disabled","disabled");
	$(".itemSearch").attr("disabled","disabled");
	$(".rewardQuantity").attr("disabled");
	$(".startPrice").removeAttr("disabled");
	$(".endPrice").removeAttr("disabled");
	$(".groupSearch").attr("disabled","disabled");
	$(".groupSearch").val('');
	$(".itemSearch").val('');
	$("#saleGroupProductsId > tbody").empty();
	}
	if(applylitems==false)
	{
	$(".minQty").removeAttr("disabled");
	$(".minAmt").removeAttr("disabled");
	$(".itemSearch").removeAttr("disabled");
	$(".rewardQuantity").removeAttr("disabled");
	$(".startPrice").attr("disabled","disabled");
	$(".endPrice").attr("disabled","disabled");
	$(".groupSearch").removeAttr("disabled");
	$(".groupSearch").val('');
	}*/
	
	//added by manasa
	if(id=="applyForAllItemsGroup" || id=="offerRewardCriteriaGroup")
		{
		$("#isCombo").removeAttr("checked");
		$("#lowestPriceItem").removeAttr("checked");
		if(rewardCriteriaGroup=="true" && applylitems==true)
			{
			$(".minQty").attr("disabled","disabled");
			$(".minAmt").attr("disabled","disabled");
			$(".itemSearch").attr("disabled","disabled");
			$(".rewardQuantity").attr("disabled");
			$(".startPrice").removeAttr("disabled");
			$(".endPrice").removeAttr("disabled");
			$(".groupSearch").removeAttr("disabled");
			$(".groupSearch").val('');
			$('#offerSalegroupSkus tbody > tr').hide();
			//$('#saleGroupProductsId tbody > tr').hide();
			
			}
		else if(rewardCriteriaGroup=="false" && applylitems==true)
			{
			$(".minQty").attr("disabled","disabled");
			$(".minAmt").attr("disabled","disabled");
			$(".groupSearch").attr("disabled","disabled");
			$(".startPrice").removeAttr("disabled");
			$(".endPrice").removeAttr("disabled","disabled");
			$(".itemSearch").attr("disabled","disabled");
			$(".groupSearch").val('');
			$(".itemSearch").val('');
			$(".minQty").val();
			$(".minAmt").val();
			$('#offerSalegroupSkus tbody > tr').hide();
			//$('#saleGroupProductsId tbody > tr').hide();
			
			}
		else if(rewardCriteriaGroup=="true" && applylitems==false)
			{
			$(".minQty").attr("disabled","disabled");
			$(".minAmt").attr("disabled","disabled");
			$(".itemSearch").attr("disabled","disabled");
			$(".rewardQuantity").attr("disabled","disabled");
			$(".startPrice").removeAttr("disabled");
			$(".endPrice").removeAttr("disabled","disabled");
			$(".groupSearch").removeAttr("disabled");
			$(".itemSearch").val('');
			$(".minQty").val('');
			$(".minAmt").val('');
			$('#offerSalegroupSkus tbody > tr').hide();
			//$('#saleGroupProductsId tbody > tr').hide();
			
			}
		else if(rewardCriteriaGroup=="false" && applylitems==false)
			{
			$(".minQty").removeAttr("disabled");
			$(".minAmt").removeAttr("disabled");
			$(".itemSearch").removeAttr("disabled");
			$(".startPrice").attr("disabled","disabled");;
			$(".endPrice").attr("disabled","disabled");
			$(".groupSearch").removeAttr("disabled");
			$(".startPrice").val('0');
			$(".endPrice").val('0');
			$('#offerSalegroupSkus tbody > tr').show();
			//$('#saleGroupProductsId tbody > tr').show();
			
			}
		else if(rewardCriteriaGroup=="group_turn_over" || rewardCriteriaGroup=="item_price_range")
			{
				$(".minQty").attr("disabled","disabled");
				$(".minAmt").attr("disabled","disabled");
				$(".itemSearch").attr("disabled","disabled");
				$(".rewardQuantity").attr("disabled","disabled");
				$(".startPrice").removeAttr("disabled");
				$(".endPrice").removeAttr("disabled","disabled");
				$(".groupSearch").removeAttr("disabled");
				$(".itemSearch").val('');
				$(".minQty").val('');
				$(".minAmt").val('');
				$('#offerSalegroupSkus tbody > tr').hide();
			}
		}
	/*else if (id == "applyForAllItemsGroup") {
		
		if ($("#applyForAllItemsGroup").prop("checked")){
			//$("#priceBasedConfigurationGroup").removeAttr("checked");
			$(".groupSearch").attr("disabled","disabled");
			$(".rewardvalue").removeAttr("disabled");
		$(".startPrice").removeAttr("disabled");
		$(".endPrice").removeAttr("disabled");
		$(".minQty").attr("disabled","disabled");
		$(".minAmt").attr("disabled","disabled");
		$(".itemSearch").attr("disabled","disabled");
		$(".rewardQuantity").attr("disabled","disabled");
		}
		else{
			$(".groupSearch").removeAttr("disabled");
			$(".startPrice").attr("disabled","disabled");
			$(".endPrice").attr("disabled","disabled");
			
			$(".minQty").removeAttr("disabled");
			$(".minAmt").removeAttr("disabled");
			$(".itemSearch").removeAttr("disabled");
		}
	}
	else if (id == "priceBasedConfigurationGroup" ) {
		//debugger
		if ($("#priceBasedConfigurationGroup").prop("checked")){
			//$("#applyForAllItemsGroup").removeAttr("checked");
		$(".rewardvalue").removeAttr("disabled");
		$(".startPrice").removeAttr("disabled");
		$(".endPrice").removeAttr("disabled");
		$(".groupSearch").removeAttr("disabled");
		$(".minQty").attr("disabled","disabled");
		$(".minAmt").attr("disabled","disabled");
		$(".itemSearch").attr("disabled","disabled");
		$(".rewardQuantity").attr("disabled","disabled");
		
		}
		else
			{
			$(".rewardvalue").attr("disabled","disabled");
			$(".startPrice").attr("disabled","disabled");
			$(".endPrice").attr("disabled","disabled");
			$(".groupSearch").removeAttr("disabled");
			$(".minQty").removeAttr("disabled");
			$(".minAmt").removeAttr("disabled");
			$(".itemSearch").removeAttr("disabled");
			}
	}*/
	else if (id == "isCombo") {
		if ($("#isCombo").prop("checked"))
			$("#lowestPriceItem").removeAttr("checked");
		$("#priceBasedConfigurationGroup").removeAttr("checked");
		$("#applyForAllItemsGroup").removeAttr("checked");
		$(".startPrice").val('0');
		$(".endPrice").val('0');
		$(".itemSearch").val('');
		
	}
	if (id == "id") {
		if (!$("#lowestPriceItem").prop("checked")
				&& !$("#isCombo").prop("checked")) {
			$("select[name='rangeMode']").prop("disabled", "disabled");
			$(".rewardQuantity").attr("readonly", "readonly");
		} else {
			$("select[name='rangeMode']").removeAttr("disabled");
		}
	} else {
		if (!$("#lowestPriceItem").prop("checked")
				&& !$("#isCombo").prop("checked")) {
			$(".rewardQuantity").val('0');
			$(".rewardQuantity").attr("readonly", "readonly");
			$("select[name='rangeMode']").val("both");
			
			$("select[name='rangeMode']").prop("disabled", "disabled");
		} else if ($("#isCombo").prop("checked")) {
			$("#applyForAllItemsGroup").removeAttr("checked");
			$("#lowestPriceItem").removeAttr("checked");
			$(".rewardQuantity").val('0');
			$(".rewardQuantity").attr("readonly", "readonly");
			$(".startPrice").attr("disabled","disabled");
			$(".endPrice").attr("disabled","disabled");
			$(".groupSearch").removeAttr("disabled");
			$(".minQty").removeAttr("disabled");
			$(".minAmt").removeAttr("disabled");
			$(".itemSearch").removeAttr("disabled");
			$(".startPrice").val('0');
			$(".endPrice").val('0');
			$("select[name='rangeMode']").removeAttr("disabled");
			$("select[name='rangeMode']").each(
					function() {
						if ($(this).val() == "condition") {
							var id = $(this).attr("id");
							id = id.replace("rangeMode", "");
							$("#" + id + "rewardvalue").val('0');
							$("#" + id + "rewardvalue").attr("readonly",
									"readonly");
							$("#" + id + "rangeRewardType").val('ALL');
							$("#" + id + "rangeRewardType").attr("disabled",
									"disabled");
						}
					});
		} else if ($("#lowestPriceItem").prop("checked")) {
			$("select[name='rangeMode']").removeAttr("disabled");
			$(".startPrice").attr("disabled","disabled");
			$(".endPrice").attr("disabled","disabled");
			$(".groupSearch").removeAttr("disabled");
			//$(".groupSearch").removeAttr("disabled");
			//$(".startPrice").removeAttr("disabled");
			//$(".endPrice").removeAttr("disabled");
			$(".minQty").removeAttr("disabled");
			$(".minAmt").removeAttr("disabled");
			$(".itemSearch").removeAttr("disabled");
			$(".startPrice").val('0');
			$(".endPrice").val('0');
			$(".rewardQuantity").removeAttr("readonly");
			$("select[name='rangeMode']").each(
					function() {
						if ($(this).val() == "condition") {
							var id = $(this).attr("id");
							id = id.replace("rangeMode", "");
							$("#" + id + "rewardvalue").val('0');
							$("#" + id + "rewardvalue").attr("readonly",
									"readonly");
							$("#" + id + "rewardQuantity").val('0');
							$("#" + id + "rewardQuantity").attr("readonly",
									"readonly");
							$("#" + id + "rangeRewardType").val('ALL');
							$("#" + id + "rangeRewardType").attr("disabled",
									"disabled");
						}
					});
		}
	}
}

function addFileToArray(id){
	   var ext = $("#"+id)[0].files[0]['name'].split('.').pop().toLowerCase();
	    	productFiles = [];
	    	productFiles=event.target.files;
	   
	   
}

function addNameToTextBox(id){
	addFileToArray(id);
	if($("#"+id)[0].files[0] != undefined){
		$("#skuMasterFile").val($("#"+id)[0].files[0]['name']);
	
	
	
/*
	 if($("#skuMasterFile").val() != ""){
				 var ext = $("#"+id)[0].files[0]['name'].split('.').pop().toLowerCase();
				if(ext!='xlsx')
					{
					alert("Upload Xls Files Only.");
					//$("#skuMasterFile").val("");
					//$("#fileUploadCSV").val("");
					return;
					}
	 }*/
	}
	
	else
		$("#"+id+"File").val("");
}



function checkForB2CLocation() 
{

	debugger;
	var location = $("#offerLocation").val();
	var isB2CExist = false;
	for ( var loc in location) {
		if (location[loc] == "B2C") {
			$(".b2cVisibility").show();
			isB2CExist = true;
		}
	}
	if (!isB2CExist)
		$(".b2cVisibility").hide();

}

function promotionPrint(offerId,printType) {
	var contextPath = $('#contextPath').val();
	
	var formData={}
	formData.storeLocation = $("#outletLocation").val();
	formData.offerStartDate = $("#from").val();
	formData.offerEndDate = $("#to").val();
	formData.searchCriteria = $("#searchOffers").val()
	var maxRecords = 10;
	if ($("#maxRecords").length > 0)
		maxRecords = $("#maxRecords").val();

	var offerStatusValue = "";
	if($("#offerStatusValue").length>0)
		offerStatusValue = $("#offerStatusValue").val();
	
	var zone = "";
	if($("#outletZone").length > 0)
		zone = $("#outletZone").val();


	var offerType = "";
	if($("#offerType").length > 0)
		offerType = $("#offerType").val();
	formData.maxRecords = maxRecords;
	var formData = JSON.stringify(formData);
	if(printType == "descriptionPrint"){
		var URL = contextPath + "/dealsAndOffers/descriptionPrint.do";
	} else {
		var URL = contextPath + "/dealsAndOffers/promotionPrint.do";
	}

	$.ajax({
		url : URL,
		data : {
			offerId : offerId,
			formData : formData,
			offerStatusValue :offerStatusValue,
			zone : zone,
			offerType : offerType
		},
		beforeSend : function(xhr) {
			$("#loading").css("display", "block");
			$("#mainDiv").addClass("disabled");
		},
		success : function(result) {
			
			$("#loading").css("display", "none");
			$("#mainDiv").removeClass('disabled');
			 data=JSON.parse(JSON.stringify(result));
			
				if(printType == "descriptionPrint"){
				 
				 var anchor = document.createElement('a');
					anchor.href = data.printURL;
					anchor.target = '_blank';
					anchor.download = '';
					if(result!=null && result!='')
						anchor.click();
					
			 }else{
				var anchor = document.createElement('a');
					anchor.href = data.printURL;
					anchor.target = '_blank';
					anchor.download = '';
					if(result!=null && result!='')
						anchor.click();
				
				
				var anchor = document.createElement('a');
				anchor.href = data.printURLA7;
				anchor.target = '_blank';
				anchor.download = '';
				if(result!=null && result!='')
					anchor.click();
			 }

			
		},
		error : function() {
			alert("Something went wrong");
			$("#loading").css("display", "none");
			$("#mainDiv").removeClass('disabled');
		}
	});
}


function deleteSkuProduct(){
	 debugger;
	
	 $('#offerSkusProduct').empty();
}


function addSkuFromExcelImport(skuList) {
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
	
	if(skuList[i].offerType == null || skuList[i].offerType==undefined || skuList[i].offerType=="")
		skuList[i].offerType = "fixed_rate";
	
	if(skuList[i].offerValue == null || skuList[i].offerValue==undefined || skuList[i].offerValue=="")
		skuList[i].offerValue = "1";
	
	if(skuList[i].size == null || skuList[i].size==undefined || skuList[i].size=="")
		skuList[i].size = "";
	
	var flag = true;
	$('#offersellskus').val('');
	var contextPath = $("#contextPath").val();
	var remove = contextPath + "/images/itemdelete1.png";
	
	var len = parseInt($("#offerSaleSkusProduct tr").length);
	if (len != 1)
		len = parseInt($("#offerSaleSkusProduct tr:last").attr("id").replace(
				'dynamicdiv', '')) + 1;

	
	for (var j = 1; j <= len; j++) {
		if ($("#pluCode" + j).val() == skuList[i].pluCode) {
			alert("Item Already Added");
			return;
		}
	}
	      
	if(skuList[i].offerType=="fixed_rate")
		{
		var option="<option value='fixed_rate'>Fixed Rate</option><option value='flat_rate'>Cash Flat</option><option value='percentage'>Cash Discount</option><option value='qty_specific_cash_discount'>Qty Specific Cash Discount</option><option value='loyaltypoints'>Loyalty Points</option><option value='giftvouchers'>Gift Vouchers</option><option value='quantity'>Quantity</option>";
		}
	else if(skuList[i].offerType=="flat_rate")
		{
		var option="<option value='flat_rate'>Cash Flat</option><option value='fixed_rate'>Fixed Rate</option><option value='percentage'>Cash Discount</option><option value='qty_specific_cash_discount'>Qty Specific Cash Discount</option><option value='loyaltypoints'>Loyalty Points</option><option value='giftvouchers'>Gift Vouchers</option><option value='quantity'>Quantity</option>";
		
		}
	else if(skuList[i].offerType=="percentage")
		{
		var option="<option value='percentage'>Cash Discount</option><option value='flat_rate'>Cash Flat</option><option value='fixed_rate'>Fixed Rate</option><option value='qty_specific_cash_discount'>Qty Specific Cash Discount</option><option value='loyaltypoints'>Loyalty Points</option><option value='giftvouchers'>Gift Vouchers</option><option value='quantity'>Quantity</option>";
		
		}
	else if(skuList[i].offerType=="qty_specific_cash_discount")
	{
	var option="<option value='qty_specific_cash_discount'>Qty Specific Cash Discount</option><option value='percentage'>Cash Discount</option><option value='flat_rate'>Cash Flat</option><option value='fixed_rate'>Fixed Rate</option><option value='loyaltypoints'>Loyalty Points</option><option value='giftvouchers'>Gift Vouchers</option><option value='quantity'>Quantity</option>";
	
	}
	else if(skuList[i].offerType=="loyaltypoints")
		{
		var option="<option value='loyaltypoints'>Loyalty Points</option><option value='flat_rate'>Cash Flat</option><option value='fixed_rate'>Fixed Rate</option><option value='percentage'>Cash Discount</option><option value='qty_specific_cash_discount'>Qty Specific Cash Discount</option><option value='giftvouchers'>Gift Vouchers</option><option value='quantity'>Quantity</option>";
		
		}
	else if(skuList[i].offerType=="giftvouchers")
		{
		var option="<option value='giftvouchers'>Gift Vouchers</option><option value='flat_rate'>Cash Flat</option><option value='fixed_rate'>Fixed Rate</option><option value='percentage'>Cash Discount</option><option value='qty_specific_cash_discount'>Qty Specific Cash Discount</option><option value='loyaltypoints'>Loyalty Points</option><option value='quantity'>Quantity</option>";
		
		}
	else if(skuList[i].offerType=="quantity")
		{
		var option="<option value='quantity'>Quantity</option><option value='loyaltypoints'>Loyalty Points</option><option value='flat_rate'>Cash Flat</option><option value='fixed_rate'>Fixed Rate</option><option value='percentage'>Cash Discount</option><option value='qty_specific_cash_discount'>Qty Specific Cash Discount</option><option value='giftvouchers'>Gift Vouchers</option>";
		
		}
	else 
		{
		var option="<option value='fixed_rate'>Fixed Rate</option><option value='flat_rate'>Cash Flat</option><option value='percentage'>Cash Discount</option><option value='qty_specific_cash_discount'>Qty Specific Cash Discount</option><option value='loyaltypoints'>Loyalty Points</option><option value='giftvouchers'>Gift Vouchers</option><option value='quantity'>Quantity</option>";
		
		}
	    
	
	
	var slNo = 1;
	$('.slno').each(function() {
		$(this).text(slNo);
		slNo = parseInt(slNo) + 1;
	});

	var test = "this.value=this.value.replace(/[^0-9.]/g,'');";
	var test1 = "this.value=this.value.replace(/(\..*)\./g,'$1');";
	if (flag == true) {
		$('#offerSaleSkusProduct tbody')
				.append(
						"<tr id='dynamicdiv" + len+ "' style='margin-top:5px;'><td class='slno' id='itemno"+ len+ "'>"+ slNo+ "</td>"+
						"<input type='hidden' id='pluCode"+len+"' value='"+skuList[i].pluCode+"'/>" +
				 		"<input type='hidden' id='category"+len+"' value='"+skuList[i].category+"'/>" +
				 		"<input type='hidden' id='subCategory"+len+"' value='"+skuList[i].subCategory+"'/>" +
				 		"<input type='hidden' id='department"+len+"' value='"+skuList[i].department+"'/>" +
						"<input type='hidden' id='brandCode"+len+"' value='"+skuList[i].brandCode+"'/>" +
						"<input type='hidden' id='modal"+len+"' value='"+skuList[i].model+"'/>" +
						"<input type='hidden' id='section"+len+"' value='"+skuList[i].section+"'/>" +
						 "<td id='itemCode"+ len+ "'>"+ skuList[i].skuId+ "</td>"+
						 "<td id='itemDesc"+ len+ "'>"+ skuList[i].description+ "</td>"+
						 "<td id='ean"+ len+ "'>"+ skuList[i].ean+ "</td><input type='hidden' class='buyPluCode' value='"+ skuList[i].pluCode+ "' />"+
						 "<td id='size"+ len+ "'>"+ skuList[i].size+ "</td>"+
						 "<td id='mrp"+ len+ "'>"+ skuList[i].price+ "</td>"+
						 "<td ><input style='width: 85%;text-align:center' type='text' id='minQty"+ len+"' class='minQty' value='"+ skuList[i].quantity+ "'></td>"+
						 "<td><select  style='height: 27px;width: 130px;' name='dealStatus' class='dealStatus'   onchange='changeRewardQty(this);' id='dealStatus"+len+"'>"+option+"</select></td>"+
						 "<td ><input style='width: 85%;text-align:center' type='text' disabled='disabled'  id='rewardQtyProduct"+ len+"' class='rewardQtyProduct'></td>"+
						 "<td ><input style='width: 85%;text-align:center' type='text' id='amount"+ len+"' class='amount' oninput="+ test+ " oninput="+ test1+ " value="+skuList[i].offerValue+ "></td>"+
						 "<td id='Del"+ len+ "' style='width: 8%'><center><img id='Img"+ len+ "' src="+ remove+ " style='cursor:pointer; height: 18px;' onclick='deleteItem1(this);' title='Delete "+ skuList[i].pluCode + "'/></center></td></tr>");


	}
	}
}


	


