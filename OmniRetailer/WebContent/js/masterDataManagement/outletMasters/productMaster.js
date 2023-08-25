
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
	 var op = '<option value="Select" >-- Select --</option>';
	 for(var i=0;i<subCategoryList.length;i++){
			 op += '<option value="'+subCategoryList[i].subcategoryName+'" >'+subCategoryList[i].subcategoryDescription+'</option>';
	 }
	 $("#sub_category").html('');
	 $("#sub_category").html(op);
}











$('#searchProduct').on('input',function(e){
	if($(this).val().trim()==""){
		viewProductMaster('productmaster','0');
	}
});

function searchProductMaster(name,searchCategory,index){
	 //debugger;
	 //purpose:for checking internet conection
		var online = window.navigator.onLine;
	  	if(!online)
	  	{
	  	alert("check your internet connection,please try agian after some time");
	  	return;
	  	}
	var contextPath = $("#contextPath").val();
	 
	 var maxRecords = 10;
	  if($("#maxRecords").length>0)
		  maxRecords = $("#maxRecords").val();

	  name=""
	   		 if($("#searchProduct").length>0)
	   			name = $("#searchProduct").val().trim();
	  
	  
	 URL = contextPath + "/outletMaster/searchProductMaster.do";
	 $.ajax({
			type: "GET",
			url : URL,
			data : {
				searchName : name,
				index : index,
				maxRecords : maxRecords
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

function validateProductForm(operation){
	 //purpose:for checking internet conection
	var online = window.navigator.onLine;
  	if(!online)
  	{
  	alert("check your internet connection,please try agian after some time");
  	return;
  	}
	var productName = $("#product_name").val();
	var productDescription = $("#product_description").val();
	var leadTimeDays = $("#lead_time_days").val();
	var buyUnitPrice = $("#buy_unit_price").val();
	var sellUnitPrice = $("#sell_unit_price").val();
	var stockInHand = $("#stock_in_hand").val();
	var minStock = $("#min_stock").val();
	var maxStock = $("#max_stock").val();
	var reOrderPoint = $("#re_order_point").val();
	var productSupplier = $("#productSupplier").val();
	var productStore = $("#productStore").val();
	
	if(productName == ""){
		$("#product_name").focus();
		$("#productNameError").html("Product Name is Required");
		return false;
	}
	if(productDescription == ""){
		$("#product_description").focus();
		$("#productDescriptionError").html("Product Description is Required");
		return false;
	}
	if(leadTimeDays == ""){
		$("#lead_time_days").focus();
		$("#leadTimeError").html("Lead Time Days is Required");
		//focusDiv("leadTimeError");
		return false;
	}
	if(buyUnitPrice == ""){
		$("#buyUnitPriceError").focus();
		$("#buyUnitPriceError").html("Buy Unit Price is Required");
		//focusDiv("buyUnitPriceError");
		return false;
	}
	if(sellUnitPrice == ""){
		$("#sellUnitPriceError").html("Sell Unit Price is Required");
		//focusDiv("sellUnitPriceError");
		return false;
	}
	if(stockInHand == ""){
		$("#stockInHandError").focus();
		$("#stockInHandError").html("Stock In Hand is Required");
		//focusDiv("stockInHandError");
		return false;
	}
	if(minStock == ""){
		$("#minStockError").html("Min Stock is Required");
		//focusDiv("minStockError");
		return false;
	}
	if(maxStock == ""){
		$("#maxStockError").html("Max Stock is Required");
		focusDiv("maxStockError");
		return false;
	}
	if(reOrderPoint == ""){
		$("#reOrderPointError").html("Re-Order Point is Required");
		//focusDiv("reOrderPointError");
		return false;
	}
	if(productSupplier == null){
		$("#productSupplierError").html("Select Atleast One");
		//focusDiv("productSupplierError");
		return false;
	}
	if(productStore == null){
		$("#productStoreError").html("Select Atleast One");
		//focusDiv("productStoreError");
		return false;
	}
	
	
	 var maxRecords = 10;
	  if($("#maxRecords").length>0)
		  maxRecords = $("#maxRecords").val();
	  
	  var searchName ="";
	 	 if($("#searchProduct").length>0)
	 		searchName = $("#searchProduct").val();

	
	 var formData  = JSON.stringify($('form').serializeObject());
	 var contextPath = $("#contextPath").val();
	 var productSupplier = JSON.stringify($("#productSupplier").serializeObject());
	 var productStore = JSON.stringify($("#productStore").serializeObject());
	 
	 //alert(productSupplier+"  "+productStore);
   	   if(operation=="new"){
    	 URL = contextPath + "/outletMaster/createProduct.do";
   	   }
   	   else if(operation=="edit"){
   		 URL = contextPath + "/outletMaster/updateProduct.do";
   	   }
   	  	 $.ajax({
  			type: "POST",
  			url : URL,
  			data :{ 
            	formData : formData,
            	productSupplier : productSupplier,
            	productStore : productStore,
            	maxRecords : maxRecords,
            	searchName : searchName
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
function viewEditProduct(productId,operation)
{
	 //purpose:for checking internet conection
	var online = window.navigator.onLine;
  	if(!online)
  	{
  	alert("check your internet connection,please try agian after some time");
  	return;
  	}
	 var contextPath = $("#contextPath").val();
	 var maxRecords = 10;
 	  if($("#maxRecords").length>0)
 		  maxRecords = $("#maxRecords").val();
 	  var searchName ="";
 	 if($("#searchProduct").length>0)
 		searchName = $("#searchProduct").val();
 	 
 	 
	 URL = contextPath + "/outletMaster/editProduct.do";
		$.ajax({
			type: "GET",
			url : URL,
			data : {
				productId : productId,
				maxRecords : maxRecords,
				searchName : searchName,
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
