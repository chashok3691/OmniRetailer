
function viewEditBrand(brandName,operation){
 		 var contextPath = $("#contextPath").val();
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
 		
 		var searchName = "";
 		if($("#searchBrand").length > 0 )
 			searchName = $("#searchBrand").val().trim();
 		
 		URL = contextPath + "/genericMaster/editBrand.do";
 		$.ajax({
 			type: "GET",
 			url : URL,
 			data : {
 				bName : brandName,
 				maxRecords:maxRecords,
 				searchName: searchName,
 				operation : operation
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


function searchSubCategoriesBasedOnCategory(id){
	 var categoryName = $("#"+id).val();
	 //purpose:for checking internet conection
		var online = window.navigator.onLine;
	  	if(!online)
	  	{
	  	alert("check your internet connection,please try agian after some time");
	  	return;
	  	}
	 
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
				appendSubCategories(result);
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


function appendSubCategories(subCategoryList){
	var op = '<option value="Select" >-- Select --</option>';
	 for(var i=0;i<subCategoryList.length;i++){
			 op += '<option value="'+subCategoryList[i].subcategoryName+'" >'+subCategoryList[i].subcategoryDescription+'</option>';
	 }
	 $("#sub_category").html('');
	 $("#sub_category").html(op);
}


function searchSuppliers(name, searchCategory){
	var contextPath = $("#contextPath").val();
	 //purpose:for checking internet conection
	var online = window.navigator.onLine;
  	if(!online){
  	alert("check your internet connection,please try agian after some time");
  	return;
  	}
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

function getCode(element,type){
	var id= $(element).attr("id");
	$("#supplier_Id").val(id);
	var label = $(element).children("a").text();
	$("#searchSupplier").val(label);
	$(".services").hide();
	$("."+type).html("");
}

$("#searchSupplier").keydown(function(e){
	$("#supplierNameError").html("");
	if($("#searchSupplier").val().length<2){
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

//viswanath
$("#searchBrand").keydown(function(e){
	$("#brandNameError").html("");
	if($("#searchBrand").val().length<3){
		$("#brand").val("");
	}
	$(".brandMaster").children("li").each(function(){
		var brandName = $(this).children("a").text().trim();
		if($("#searchBrand").val().trim().toLowerCase() == supplierName.toLowerCase()){
			$("#searchBrand").val($("#searchBrand").val().trim());
			$("#brand").val($(this).attr("id"));
			$(".services").hide();
			$(".matchedStringUl").html("");
			return;
		}
		else{
			$("#brand").val("");
		}
	});
	if(e.keyCode == 9){
		if($("#searchBrand").val()!="" && $("#brand").val() == ""){
			$("#brandNameError").html("Brand Name doesn't exist");
		}
		$(".services").hide();
		$(".matchedStringUl").html("");
	}
});
//viswanath
$('#searchBrand').on('input',function(e){
	if($(this).val().trim()==""){
		viewBrandMaster('brandMaster','0');
	}
});

function searchBrandMaster(name,searchCategory,index){
	 var contextPath = $("#contextPath").val();
	 URL = contextPath + "/genericMaster/searchBrandMaster.do";
	 //purpose:for checking internet conection
		var online = window.navigator.onLine;
	  	if(!online)
	  	{
	  	alert("check your internet connection,please try agian after some time");
	  	return;
	  	}
	 var maxRecords = 10;
		if ($("#maxRecords").length > 0)
			maxRecords = $("#maxRecords").val();
		
		var searchName = "";
 		if($("#searchBrand").length > 0 )
 			searchName = $("#searchBrand").val().trim();
 		
	 
	 $.ajax({
			type: "GET",
			url : URL,
			
			data : {
				searchName : name,
				index : index,
				maxRecords: maxRecords,
				searchName:searchName
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


function searchProducts(name, searchCategory){
	 //purpose:for checking internet conection
	var online = window.navigator.onLine;
  	if(!online)
  	{
  	alert("check your internet connection,please try agian after some time");
  	return;
  	}
	 var contextPath = $("#contextPath").val();
	 var categoryName = $("#category").val();
	 var subCategory = "";
	 if($("#sub_category").val() != "Select" && $("#sub_category").val() != "-- Select --")
		 subCategory = $("#sub_category").val();
	 /*alert("CN "+categoryName+" "+"SC "+subCategory);*/
	 
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
	//debugger;
	 $("."+searchCategory).html('');
	 var op = '';
	 for(var i=0;i<productsList.length;i++){
		 if (i == 0) 
			 op += '<li id="'+productsList[i].productId+'"  class="selected" onclick=getId(this,"'+searchCategory+'"); ><a>'+productsList[i].productName+'   (   '+productsList[i].product_description+'   )</a></li>';
		 else
		     op += '<li id="'+productsList[i].productId+'" onclick=getId(this,"'+searchCategory+'"); ><a>'+productsList[i].productName+'   (   '+productsList[i].product_description+'   )</a></li>';
	 }
	 $("."+searchCategory).html(op);
	 $("."+searchCategory).show();
}

function getId(element,type){
	 var contextPath = $("#contextPath").val();
	var id= $(element).attr("id");
	var categoryName=$("#category").val();
	 var subCategory=$("#sub_category").val();
		var len = parseInt($("#productsList tr").length);
		if (len != 1)
			len = parseInt($("#productsList tr:last").attr("id").replace('dynamicdiv', '')) + 1;
		for (var i = 1; i <= len; i++) {
			if ($("#productId" + i).val() == id) {
				return;
			}
		}
		var label = $(element).children("a").text();
		var splittedString=label.split('   (   ');
		var productName=splittedString[0];
		var description=splittedString[1].replace('   )','');
		 var row = "<tr id='dynamicdiv"+len+"' style='margin-top:5px;'><td id='productName"+len+"'>"+productName+
			"<input type='hidden' id='productId"+len+"' value='"+id+"'/>" +
			"<input type='hidden' id='categoryName"+len+"' value='"+ categoryName+"'/>" +
			"<input type='hidden' id='subCategory"+len+"' value='"+subCategory+"'/></td>" +
			"<td id='product_description"+len+"'>"+description+"</td>" +
			"<td id='Del"+ len +"' ><img id='Img"+ len +"' src='"+contextPath+"/images/itemdelete.png' style='width:25px;cursor:pointer;' onclick='deleteItem(this);' title='Delete "+productName+"'/>" +
			"</td></tr>";
		 $("#productsList tbody").append(row);
		 $(".services").hide();
		 $("."+type).html("");
		 $("#searchItems").val("");
}

function deleteItem(element){
	var id = $(element).attr("id").replace('Img','');
	$('#dynamicdiv'+id).remove();
}
$("#brand_name").keydown(function(){
	   $("#brandNameError").html("");
	   $(".Error").html("");
}); 
$("#manufacturer").keydown(function(){
	   $("#manufacturerError").html("");
	   $(".Error").html("");
}); 
$("#searchSupplier").keydown(function(){
	   $("#supplierNameError").html("");
	   $(".Error").html("");
}); 
$("#brandCategory").keydown(function(){
	   $("#brandCategoryError").html("");
	   $(".Error").html("");
}); 
$("#startPrice").keydown(function(){
	   $("#startPriceError").html("");
	   $(".Error").html("");
}); 
$("#endPrice").keydown(function(){
	   $("#endPriceError").html("");
	   $(".Error").html("");
}); 

/*function validateBrandMasterForm(operation){
	 //purpose:for checking internet conection
	var online = window.navigator.onLine;
  	if(!online)
  	{
  	alert("check your internet connection,please try agian after some time");
  	return;
  	}
  	debugger;
	var brandMaster = {}, brandproduct = [],brandprice = [];

	 var maxRecords = 10;
		if ($("#maxRecords").length > 0)
			maxRecords = $("#maxRecords").val();
		
		var searchName = "";
		if($("#searchBrand").length > 0 )
			searchName = $("#searchBrand").val();
		
	if($("#brand_name").val().trim() == ""){
		  $("#brand_name").focus();
			$("#brandNameError").html("Enter Brand Name");
			return;
		}
		if($("#manufacturer").val().trim() == ""){
			 $("#manufacturer").focus();
			$("#manufacturerError").html("Enter Manufacturer");
			return;
		}
		if($("#supplier_Id").val().trim() == "" && $("#searchSupplier").val().trim() == ""){
		    $("#searchSupplier").focus();
			$("#supplierNameError").html("Enter Supplier Name");
			return;
		}
		if($("#supplier_Id").val().trim() == "" && $("#searchSupplier").val().trim() != ""){
			$("#searchSupplier").focus();
			$("#supplierNameError").html("Supplier Name doesn't exist");
			return;
		}
		if($("#brandCategory").val().trim() == ""){
			$("#brandCategory").focus();
			$("#brandCategoryError").html("Enter Brand Category");
			return;
		}
		var len = parseInt($("#productsList tr").length);
		if(len <= 1){
			alert("Add Atleast One Item");
			return false;
			}
		var startPrice = $("#startPrice").val().trim();
		if(startPrice == ""){
			$("#startPrice").focus();
			$("#startPriceError").html("Enter Start Price");
			return;
		}
		var endPrice = $("#endPrice").val().trim();
		if(endPrice == ""){
			$("#endPrice").focus();
			$("#endPriceError").html("Enter End Price");
			return;
		}
		if(parseFloat(startPrice) > parseFloat(endPrice)){
			$("#endPriceError").html("Enter End Price greater than Start Price");
			return;
		}
		
		brandMaster.bName = $("#brand_name").val().trim();
		brandMaster.manufacturer = $("#manufacturer").val().trim();
		brandMaster.bDescription = $("#description1").val().trim();
		brandMaster.supplier = $("#supplier_Id").val();
		brandMaster.brandCategory = $("#brandCategory").val().trim();
		brandMaster.customerGroup = $("#customerGroup").val();
		brandMaster.b2cBrand = $("#b2cvisibility").val();
		brandMaster.searchCriteria = searchName;
		brandMaster.maxRecords = maxRecords;
		
		if(len >= 1){
		for(var i=1;i<len;i++){
			var idAttr = $("#productsList tr:eq("+i+") td:last").attr("id");
			idAttr = idAttr.replace('Del','');
			
			var obj = {productId:$("#productId"+idAttr).val(),productCategory:$("#categoryName"+idAttr).val(),subCategory:$("#subCategory"+idAttr).val(),productName:$("#productName"+idAttr).text(),productDescription:$("#product_description"+idAttr).text()};
			brandproduct.push(obj);
		}
		}
		var brandPriceObj = {startPrice:$("#startPrice").val(),endPrice:$("#endPrice").val(),country:$("#country").val(),location:$("#location").val(),description:$("#description2").val()};
		brandprice.push(brandPriceObj);
		
		brandMaster.brandproduct = brandproduct;
		brandMaster.brandprice= brandprice;
		
		var formData = JSON.stringify(brandMaster);
//		console.log(formData);
		var contextPath = $("#contextPath").val();
	   if(operation=="new"){
  	   URL = contextPath + "/genericMaster/createBrandMaster.do";
	   }
	   else if(operation=="edit"){
		   URL = contextPath + "/genericMaster/updateBrandMaster.do";
	   }
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

}*/

function validateBrandMasterForm(operation){
	 //purpose:for checking internet conection
	$("#brandNameError").html("");
	var online = window.navigator.onLine;
 	if(!online)
 	{
 	alert("check your internet connection,please try agian after some time");
 	return;
 	}
 	debugger;
	var brandMaster = {}, brandproduct = [],brandprice = [];

	 var maxRecords = 10;
		if ($("#maxRecords").length > 0)
			maxRecords = $("#maxRecords").val();
		
		var searchName = "";
		if($("#searchBrand").length > 0 )
			searchName = $("#searchBrand").val();
	
		if($("#brand_name").val().trim() == ""){
		  $("#brand_name").focus();
			$("#brandNameError").html("Enter Brand Name");
			return;
		}else if(parseInt($("#brand_name").val().length)>50){
			 $("#brand_name").focus();
			 $("#brandNameError").html("Brand name can't exceeds 50 characters");
			 return;
		} 
		
		var description1 = $("#description1").val().trim();
		 var description2 = $("#description2").val().trim();
		 if(description1.trim() != "" && parseInt($("#description1").val().length)>150){
				$("#description1").focus();
				$("#description1Error").html("Description can't exceeds 150 Characters");
				return false;
			}else{
				$("#description1Error").html("");
			}
		
		 if(description2.trim() != "" && parseInt($("#description2").val().length)>50){
				$("#description2").focus();
				$("#description2Error").html("Description can't exceeds 50 Characters");
				return false;
			}else{
				$("#description2Error").html("");
			}
		 
		/*if(parseInt($("#brand_name").val().length) > 10){
			$("#brand_name").focus();
			$("#brandNameError").html("length should be equal to 10");
			return;
		}*/
		if($("#manufacturer").val().trim() == ""){
			 $("#manufacturer").focus();
			$("#manufacturerError").html("Enter Manufacturer");
			return;
		}else if(parseInt($("#manufacturer").val().length)>20){
			 $("#manufacturer").focus();
			$("#manufacturerError").html("Manufacturer name can't exceeds 20 characters");
			return;
		}
		if($("#supplier_Id").val().trim() == "" && $("#searchSupplier").val().trim() == ""){
		    $("#searchSupplier").focus();
			$("#supplierNameError").html("Enter Supplier name");
			return;
		}
		if($("#supplier_Id").val().trim() == "" && $("#searchSupplier").val().trim() != ""){
			$("#searchSupplier").focus();
			$("#supplierNameError").html("Supplier name doesn't exist");
			return;
		}
		if($("#brandCategory").val().trim() == ""){
			$("#brandCategory").focus();
			$("#brandCategoryError").html("Enter Brand Category");
			return;
		}else if(parseInt($("#brandCategory").val().length)>30){
		 $("#brandCategory").focus();
		 $("#brandCategoryError").html("Brand Category can't exceeds 30 characters");
		 return;
		}
		var len = parseInt($("#productsList tr").length);
		/*if(len <= 1){
			alert("Add Atleast One Item");
			return false;
			}*/
		var startPrice = $("#startPrice").val().trim();
		if(startPrice == ""){
			$("#startPrice").focus();
			$("#startPriceError").html("Enter Start price");
			return;
		}else if(parseFloat($("#startPrice").val().length) >15){
			$("#startPrice").focus();
			$("#startPriceError").html("Start price can't exceeds 15 characters");
		}
		var endPrice = $("#endPrice").val().trim();
		if(endPrice == ""){
			$("#endPrice").focus();
			$("#endPriceError").html("Enter End price");
			return;
		}else if(parseFloat($("#endPrice").val().length) >15){
			$("#endPrice").focus();
			$("#endPriceError").html("End price can't exceeds 15 characters");
			return;
		}
		if(parseFloat(startPrice) > parseFloat(endPrice)){
			$("#endPriceError").html("Enter End Price greater than Start Price");
			return;
		}
		
		brandMaster.bName = $("#brand_name").val().trim();
		brandMaster.manufacturer = $("#manufacturer").val().trim();
		brandMaster.bDescription = $("#description1").val().trim();
		brandMaster.supplier = $("#supplier_Id").val();
		brandMaster.brandCategory = $("#brandCategory").val().trim();
		brandMaster.customerGroup = $("#customerGroup").val();
		brandMaster.b2cBrand = $("#b2cvisibility").val();
		brandMaster.searchCriteria = searchName;
		brandMaster.maxRecords = maxRecords;
		
		if(len >= 1){
		for(var i=1;i<len;i++){
			var idAttr = $("#productsList tr:eq("+i+") td:last").attr("id");
			idAttr = idAttr.replace('Del','');
			
			var obj = {productId:$("#productId"+idAttr).val(),productCategory:$("#categoryName"+idAttr).val(),subCategory:$("#subCategory"+idAttr).val(),productName:$("#productName"+idAttr).text(),productDescription:$("#product_description"+idAttr).text()};
			brandproduct.push(obj);
		}
		}
		var brandPriceObj = {startPrice:$("#startPrice").val(),endPrice:$("#endPrice").val(),country:$("#country").val(),location:$("#location").val(),description:$("#description2").val()};
		brandprice.push(brandPriceObj);
		
		brandMaster.brandproduct = brandproduct;
		brandMaster.brandprice= brandprice;
		
		var formData = JSON.stringify(brandMaster);
//		console.log(formData);
		var contextPath = $("#contextPath").val();
	   if(operation=="new"){
 	   URL = contextPath + "/genericMaster/createBrandMaster.do";
	   }
	   else if(operation=="edit"){
		   URL = contextPath + "/genericMaster/updateBrandMaster.do";
	   }
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

function searchSubCategoriesBasedOnCategory(id){
	 //purpose:for checking internet conection
	var online = window.navigator.onLine;
  	if(!online)
  	{
  	alert("check your internet connection,please try agian after some time");
  	return;
  	}
	 var categoryName = $("#"+id).val();
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
				appendSubCategories(result);
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

function appendSubCategories(subCategoryList){
	 var op = '<option value="-- Select --" >-- Select --</option>';
	 for(var i=0;i<subCategoryList.length;i++){
			 op += '<option value="'+subCategoryList[i].subcategoryName+'" >'+subCategoryList[i].subcategoryDescription+'</option>';
	 }
	 $("#sub_category").html('');
	 $("#sub_category").html(op);
}