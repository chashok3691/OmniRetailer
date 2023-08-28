function userRating(userRated) {
	$("#userRating1").val(userRated);
}

$('#searchSupplier').on('input',function(e){
	if($(this).val().trim()==""){
		viewSupplierMaster('supplierMaster','0');
	}
});

function searchSupplierMaster(name, searchCategory,index){
	//debugger;
	 //purpose:for checking internet conection
	console.log(name)
	var online = window.navigator.onLine;
  	if(!online){
  	alert("check your internet connection,please try agian after some time");
  	return;
  	}
	 var contextPath = $("#contextPath").val();
	 var maxRecords = 10;
	  if($("#maxRecords").length>0)
		  maxRecords = $("#maxRecords").val();

	      name=""
	   if($("#searchSupplier").length>0)
	   			name = $("#searchSupplier").val().trim();
	 URL = contextPath + "/outletMaster/searchSupplierMater.do";
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


function searchProducts(name,searchCategory){
	debugger;
	 var contextPath = $("#contextPath").val();
	 //purpose:for checking internet conection
		var online = window.navigator.onLine;
	  	if(!online)
	  	{
	  	alert("check your internet connection,please try agian after some time");
	  	return;
	  	}
	 var storeLocation = $("#wareHouseLocation").val();;
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
  				appendProducts(result,searchCategory);
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
function appendProducts(productsList,searchCategory){
	 $("."+searchCategory).html('');
	 var op = '';
	 for(var i=0;i<productsList.length;i++){
		
		if(productsList[i].productName==null || productsList[i].productName=="" || productsList[i].productName==undefined)
				productsList[i].productName="";
			 
			if(productsList[i].measurementRange==null)
				 productsList[i].measurementRange="";
			if(productsList[i].color==null)
				 productsList[i].color="";		 
			if(productsList[i].size==null)
				 productsList[i].size="";
				if(productsList[i].model==null)
				 productsList[i].model="";
			
			if(productsList[i].buy_price==null || productsList[i].buy_price=="" || productsList[i].buy_price==undefined)
				productsList[i].buy_price=0;
			if(productsList[i].category==null)
				productsList[i].category="";
				
			if(productsList[i].quantity=="" || productsList[i].quantity==undefined || productsList[i].quantity== null)
				productsList[i].quantity=0;
			if(productsList[i].reorderPoint=="" || productsList[i].reorderPoint==undefined || productsList[i].reorderPoint== null)
				productsList[i].reorderPoint=0;
			if(productsList[i].mbq=="" || productsList[i].mbq==undefined || productsList[i].mbq== null)
				productsList[i].mbq=0;
			
			if(productsList[i].mrp=="" || productsList[i].mrp==undefined || productsList[i].mrp== null)
				productsList[i].mrp=0;
			
		
		
		debugger;
		
		
		 if(productsList[i].skuID == productsList[i].description){
				 if (i == 0) {
					 op += '<li id="'+productsList[i].skuID+'"  class="selected" onclick=getId(this,"'+searchCategory+'"); ><a><label style="width: 15%;text-align: initial;">'+productsList[i].skuID+'</label><label style="width: 45%;text-align: initial;">'+productsList[i].productName+'</label><label style="width: 10%;text-align: initial;">'+productsList[i].measurementRange+'</label><label style="width: 10%;text-align: initial;">'+productsList[i].price+' </label><label style="width: 10%;">'+productsList[i].size+'</label><label style="width: 10%;text-align: initial;"> '+productsList[i].color+'</label></a></li>';
				}else
				     op += '<li id="'+productsList[i].skuID+'" onclick=getId(this,"'+searchCategory+'"); ><a><label style="width: 15%;text-align: initial;">'+productsList[i].skuID+'</label><label style="width: 45%;text-align: initial;">'+productsList[i].productName+'</label><label style="width: 10%;text-align: initial;">'+productsList[i].measurementRange+'</label><label style="width: 10%;text-align: initial;">'+productsList[i].price+' </label><label style="width: 10%;">'+productsList[i].size+'</label><label style="width: 10%;text-align: initial;"> '+productsList[i].color+'</label></a></li>';
	 	}
		 else{
			 if (i == 0) {
				 op += '<li id="'+productsList[i].skuID+'"  class="selected" onclick=getId(this,"'+searchCategory+'"); ><a><label style="width: 15%;text-align: initial;">'+productsList[i].skuID+'</label><label style="width: 45%;text-align: initial;">'+productsList[i].productName+'</label><label style="width: 10%;text-align: initial;">'+productsList[i].measurementRange+'</label><label style="width: 10%;text-align: initial;">'+productsList[i].price+' </label><label style="width: 10%;">'+productsList[i].size+'</label><label style="width: 10%;text-align: initial;"> '+productsList[i].color+'</label></a></li>';
			}else
			     op += '<li id="'+productsList[i].skuID+'" onclick=getId(this,"'+searchCategory+'"); ><a><label style="width: 15%;text-align: initial;">'+productsList[i].skuID+'</label><label style="width: 45%;text-align: initial;">'+productsList[i].productName+'</label><label style="width: 10%;text-align: initial;">'+productsList[i].measurementRange+'</label><label style="width: 10%;text-align: initial;">'+productsList[i].price+' </label><label style="width: 10%;">'+productsList[i].size+'</label><label style="width: 10%;text-align: initial;"> '+productsList[i].color+'</label></a></li>';
		 }
	 }
	 $("."+searchCategory).html(op);
	 $("."+searchCategory).show();
}

function getId(element,type){
	var description = null;
	var id= $(element).attr("id");
	description =  $("#"+id).children("a").text();
	description = description.split(' ( ');
	description = description[0];
	$("#desc").val(description);
	if(type == "apparel")
		getItemDetails(id);
	else if(type == "request")
		getSkuDetails(id,description);
	 $(".services").hide();
	 $("."+type).html("");
}

function getSkuDetails(skuId,description){
	debugger;
	//purpose:for checking internet conection
	var online = window.navigator.onLine;
	if(!online)
	{
		alert("check your internet connection,please try agian after some time");
		return;
	}
	$("#desc").val(description);
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
			appendSkuDetails(result);
			//$('#searchCriteria').val('');
			//$('#skuList').html('');
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
	 /**
	  * @author Sahitya 
	  * Prepare table rows dynamically with the provided details, then append to table
	  * @param List of Raw Material Details
	  */
	 function appendSkuDetails(list) {
		 debugger;
		 
		 if(list == "" || list == null){
			 alert("Data not found");
		 return;
		 }
	 	var parsedJson = jQuery.parseJSON(list);
	 	$("#searchItems").val("");
	 	skuList = parsedJson.skuLists;
	 	if(skuList.length >1){
	 		addItem(skuList[0]);
	 		/*var priceLength = skuList.length;
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
	 		 $("#triggerEvent").html("");*/
	 	}
	 	else{
	 		addItem(skuList[0]);
	 	}
	 	
	 	
	 
	 	
	 }

	 function addItem(sku){
		 
	 	 var contextPath = $("#contextPath").val();
	 	 var len = parseInt($("#productsList tr").length);
	 		if (len != 1)
	 			{
	 			len = parseInt($("#productsList tr:last").attr("id").replace('dynamicdiv', '')) + 1;
	 }
	 		for (var i = 1; i <= len; i++) {
	 			if ($("#skuId" + i).val() == sku.skuId && $("#Price"+i).text() == sku.price) {
	 				var pack =  parseInt($("#Pack"+i).text())+1;
	   			 $("#Pack"+i).text(pack);
	   			 $("#Supplied"+i).text(pack);
	 			 $("#Received"+i).text(pack);
	 			 $("#Rejected"+i).text(0);
	   			 var cost =  parseFloat($("#Price"+i).text());
	   			 $("#Cost"+i).text(pack*cost);
	   			 changeTotalCost();
	   			 changeTotalQuantity();
	       		 return;
	 			}
	 		}
	 		var description = null;
	 		if (sku.description != "" && sku.description != null)
	 			description = sku.description;
	 		else
	 			description = $("#desc").val();
	 		var sell_UOM = sku.sell_UOM;
	 		if(sell_UOM == "" || sell_UOM == null)                      
	 			sell_UOM = "_";
	 		var color = sku.color;
	 		if(color == "" || color == null)
	 			color = "_";
	 		var size = sku.size;
	 		if(size == "" || size == null)
	 			size = "_";
			
			if (sku.supplierCode == undefined || sku.supplierCode == null)
	 			 sku.supplierCode = "_";
	 		if (sku.supplierSkuId == undefined || sku.supplierSkuId == null)
	 			 sku.supplierSkuId = "";


			
	 		var slNo = 1; 
	 		 $('.slno').each(function(){
	 			$(this).text(slNo);
	 			slNo = parseInt(slNo) + 1;
	 		});
	 		var row = "<tr id='dynamicdiv"+len+"' style='margin-top:5px;'><td class='slno'>"+slNo+"</td>" +"<td id='Name"+len+"'>"+sku.skuId+"</td>" +
	 		"<input type='hidden' id='skuId"+len+"' value='"+sku.skuId+"'/>" +
	 		"<input type='hidden' id='pluCode"+len+"' value='"+sku.pluCode+"'/>" +
	 		"<td id='Desc"+len+"' style='text-align: left;'>"+description+"</td>" +
			"<td id='supplierCode"+len+"' >"+sku.supplierCode+"</td>" +
	 		"<td id='supplierSkuId"+len+"' onkeypress='return (this.innerText.length < 10)' contenteditable='true' >"+sku.supplierSkuId+"</td>" +

			"<td id='UOM"+len+"'>"+ sell_UOM + "</td>" +
	 		"<td class='Price' id='Price"+len+"'>-</td>" +
	 		"<td id='size"+len+"'>"+size+"</td>"+
	 		"<td id='Cost"+len+"'>"+sku.price+"</td>" +
	 		"<td id='colour"+len+"'>"+color+"</td>" +
	 		"<td id='Pack"+len+"'  onkeypress='return (this.innerText.length < 10)' contenteditable='true'>1</td>" +
	 		"<td id='lead"+len+"'  onkeypress='return (this.innerText.length < 10)' contenteditable='true'>1</td>" +
	 		"<td id='Del"+len+"'><img id='Img"+len+"' src='"+contextPath+"/images/itemdelete.png' style='width:15%;cursor:pointer;' onclick='deleteItemImg(this);' title='Delete "+sku.skuId+"'/></td></tr>";
	 		$("#productsList tbody").append(row);
	 }
function viewEditSupplier(supplier,operation){
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
if($("#searchSupplier").length>0)
	  searchName = $("#searchSupplier").val();
	 
	 
	 URL = contextPath + "/outletMaster/editSupplier.do";
	/* supplier = supplier.trim();*/
		$.ajax({
			type: "GET",
			url : URL,
			data : {
				firmName : supplier,
				operation : operation,
				searchName : searchName,
				maxRecords : maxRecords 
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



function validateSupplierForm(operation){
	 //purpose:for checking internet conection
	var online = window.navigator.onLine;
  	if(!online)
  	{
  	alert("check your internet connection,please try agian after some time");
  	return;
  	}
  	debugger;
  	 var firmName = $("#firmName").val().trim();
	 var plotNo = $("#plotNo").val().trim();
	 var streetName = $("#streetName").val().trim();
	 var city = $("#city").val().trim();
	 var state = $("#state").val().trim();
	 var zipCode = $("#zipCode").val().trim();
	 var countryCode = $("#countryCode").val().trim();
//	 var currencyCode = $("#currencyCode").val();
	 
//	 var countryCode = $("#countryCode option:selected").text();
var currencyCode = $("#currencyCode").val().trim();
	 
	 var emailId = $("#emailId").val().trim();
	 if($("#emailIdError").text() != ""){
		 $("#emailId").focus();
		 return false;
	 }
	 if($("#error").text() != ""){
	 $("#phoneNumber").focus();
	 return false;
}
	 var defaultCountry = $("#defaultCountry").val().trim();
var phoneNumber = $("#phoneNumber").val().trim();
if(defaultCountry != "" && phoneNumber != ""){
	 $("#phone").val(defaultCountry+"-"+phoneNumber);
}
var phone = $("#phone").val();
/*if($("#error1").text() != ""){
	$("#phoneNumber1").focus();
	 return false;
}*/

defaultCountry = $("#defaultCountry1").val().trim();
phoneNumber = $("#phoneNumber1").val().trim();
if(defaultCountry != "" && phoneNumber != ""){
	 $("#mobile").val(defaultCountry+"-"+phoneNumber);
}
	 var shipmentMode = $("#shipmentMode").val();
	 var minOrderCost = $("#minOrderCost").val();
	 var minQuantity = $("#minQuantity").val();
	 var leadTime = $("#leadTime").val();
	 var uom = $("#uom").val();
	 
	 if(firmName.trim() == ""){
   	$("#firmNameError").html("Firm Name is required");
   	$("#firmName").focus();
  		return false;
  }else if(parseInt($("#firmName").val().length)>100){
		 $("#firmName").focus();
		 $("#firmNameError").html("Firm Name can't exceeds 100 Characters");
		 return;
	} 
   
	 if(parseInt($("#emailId").val().length)>100){
	 		 $("#emailId").focus();
	 			$("#emailIdError").html("Email ID can't exceeds 100 Character");
	 			return;
	 	}else{
	 	 $("#emailIdError").html(" ");
	   }
	 
if(plotNo.trim() == ""){
   	$("#plotNoError").html("Plot No is required");
   	$("#plotNo").focus();
  		return false;
  }else if(parseInt($("#plotNo").val().length)>50){
		 $("#plotNo").focus();
		 $("#plotNoError").html("Plot No can't exceeds 50 Characters");
		 return;
	} 
   
if(streetName.trim() == ""){
		$("#streetNameError").html("Street Name is required");
		$("#streetName").focus();
		  return false;
}else if(parseInt($("#streetName").val().length)>50){
	 $("#streetName").focus();
	 $("#streetNameError").html("Street Name can't exceeds 50 Characters");
	 return;
} 
	 
if(city.trim() == ""){
 		 $("#cityError").html("City is required");
 		 $("#city").focus();
 		  return false;
}else if(parseInt($("#city").val().length)>30){
	 $("#city").focus();
	 $("#cityError").html("City  can't exceeds 30 Characters");
	 return;
} 
	  
	  if(state.trim() == ""){
	 		 $("#shipmentStateError").html("Select State");
	 		 $("#state").focus();
	 		  return false;
	 }else{
		 $("#shipmentStateError").html("");
	 }
	if(zipCode.trim() == ""){
	$("#zipCodeError").html("Zip Code is required");
	$("#zipCode").focus();
 	return false;
 }

	if(parseInt($("#zipCode").val().length)>10){
		 $("#zipCode").focus();
		 $("#zipCodeError").html("Zip Code can't exceeds 10 Characters");
		 return;
	} else{
		$("#zipCodeError").html("");
	}
	
	 if(countryCode == "-1"){
	$("#countryCodeError").html("Country Code is required");
	$("#countryCode").focus();
 		return false;
 }else{
	$("#selectedCountry").val($("#countryCode option:selected").text());
 }

	 if(currencyCode == "" || currencyCode == null){
		$("#currencyCodeError").html("Currency Code is required");
		$("#currencyCode").focus();
		  return false;
	 }else{
		 currencyCode = currencyCode.split('-');
	     currencyCode = currencyCode[0];
	     $("#selectedCurrency").val(currencyCode);
	 }

 if(emailId.trim() == ""){
		 $("#emailIdError").html("Email ID is required");
		 $("#emailId").focus();
		  return false;
}

 if(phone.trim() == ""){
    	$("#error").html("Phone is required");
    	$("#phoneNumber").focus();
	  		return false;
}
/* if($("#phoneNumber1").val() == ""){
		$("#error1").text("Mobile is Required");
		$("#phoneNumber1").focus();
		return false;
}*/
if(shipmentMode.trim() == ""){
 		$("#shipmentModeError").html("Shipment Mode is required");
 		$("#shipmentMode").focus();
 		  return false;
}
	 
if(minOrderCost.trim() == ""){
  		 $("#minOrderCostError").html("Min Order Cost is required");
  		 $("#minOrderCost").focus();
  		  return false;
}else if(parseInt($("#minOrderCost").val().length)>20){
	 $("#minOrderCost").focus();
	 $("#minOrderCostError").html("Min Order Cost can't exceeds 20 Characters");
	 return;
} 

if(minQuantity.trim() == ""){
		 $("#minQuantityError").html("Min Quantity is required");
		 $("#minQuantity").focus();
		  return false;
		  
}else if(parseInt($("#minQuantity").val().length)>11){
	 $("#minQuantity").focus();
	 $("#minQuantityError").html("Min Quantity can't exceeds 11 Characters");
	 return;
} 


 if(leadTime.trim() == ""){
    	$("#leadTimeError").html("Lead Time is required");
    	$("#leadTime").focus();
	  		return false;
 	}else if(parseInt($("#leadTime").val().length)>10){
 		 $("#leadTime").focus();
 		 $("#leadTimeError").html("Lead Time can't exceeds 10 Characters");
 		 return;
 	} 
    
 var pan = $("#pan").val();
 if(pan.trim() != ""){
	 $("#PANNumberError").html("");
	 
 	var txtPANCard = document.getElementById("pan");
    var regex = /([A-Z]){5}([0-9]){4}([A-Z]){1}$/;
    if (regex.test(txtPANCard.value.toUpperCase())) {
        
    }else{
    	$("#PANNumberError").html("Please Check PAN Number.");
    	$("#PANNumber").focus();
        return false;
    }
	}
 
 if(parseInt($("#gstIn").val().length)>25){
		 $("#gstIn").focus();
		 $("#gstInError").html("GSTIN No can't exceeds 25 Characters");
		 return;
	} else{
		$("#gstInError").html("");
	}
 
 if(parseInt($("#targetOrderValue").val().length)>45){
	 $("#targetOrderValue").focus();
	 $("#targetOrderValueError").html("Target Order Value can't exceeds 45 Characters");
	 return;
} else{
	$("#targetOrderValueError").html("");
}
 
 if(parseInt($("#paymentTerms").val().length)>250){
	 $("#paymentTerms").focus();
	 $("#paymentTermsError").html("Payment Terms can't exceeds 250 Characters");
	 return;
} else{
	$("#paymentTermsError").html("");
}
 
 if(parseInt($("#shipmentTerms").val().length)>250){
	 $("#shipmentTerms").focus();
	 $("#shipmentTermsError").html("Shipment Terms length can't exceeds 250 Characters");
	 return;
} else{
	$("#shipmentTermsError").html("");
}
 
 if(parseInt($("#returnTerms").val().length)>250){
	 $("#returnTerms").focus();
	 $("#returnTermsError").html("Return Terms length can't exceeds 250 Characters");
	 return;
} else{
	$("#returnTermsError").html("");
}
 
 
 
	var returnTerms = $("#returnTerms").val();
 	var returnDays = $("#returnDays").val();
 	if($("#returnDays").val() == "" || $("#returnDays").val() == null)
 		$("#returnDays").val(0.0);
 	
 	var markdown = $("#markdown").val();
 	if($("#markdown").val() == "" || $("#markdown").val() == null)
 		$("#markdown").val(0.0);
 	
 	if($("#markdown").val()>100){
 		$("#markdownError").html("For Markdown, Percentage Can't exceed morethan 100%");
    	$("#markdown").focus();
	  	return false;
 	}
/*if(uom.trim() == ""){
 		$("#uomError").html("UOM is required");
 		$("#uom").focus();
 		  return false;
}*/
 	var suppliercode = $("#supplierCode").val();
 	
 	var length = $("#supplierAddresses tr").length-1;
 	var finalObj = {},addresslist = [],items = [];;

 	/*if(length == 0){
 		alert("Add Atleast One Item to Receipt");
 		return;
 		}*/
 	for(var i=1;i<=length;i++){
 		var idAttr = $("#supplierAddresses tr:eq("+i+") td:last").attr("id").replace('Del','');
 			
 		var adType = $("#addressTypeAdd"+idAttr).text();
 		if(adType == "Billing Address"){
 			adType = "BA";
 		}else if(adType == "Shipping Address"){
 			adType = "SA";
 		}
 		
 		var supplierCodeforAdd = $("#supplierCodeAdd"+idAttr).val();
 		
 		if(operation == "edit"){
 			if($("#supplierCodeAdd"+idAttr).val() == "" || $("#supplierCodeAdd"+idAttr).val() == undefined || $("#supplierCodeAdd"+idAttr).val() == null){
 				supplierCodeforAdd = suppliercode;
 			}
 		}
 		
 			var Objdata = {addressType:adType,plotNo:$("#buildingNoAdd"+idAttr).text(),streetName:$("#streetNameAdd"+idAttr).text(),location:$("#locationAdd"+idAttr).text(),phone:$("#phoneAdd"+idAttr).val(),emailId:$("#emailAdd"+idAttr).val(),city:$("#cityAdd"+idAttr).text(),stateCode:$("#stateAdd"+idAttr).text(),countryCode:$("#countryCodeAdd"+idAttr).val(),pincode:$("#pincodeAdd"+idAttr).val(),supplierCode:supplierCodeforAdd};

 			addresslist.push(Objdata);
 		
 	}
 	finalObj.supplierAddresses = addresslist;

 	var len = $("#productsList tr").length-1;

/*if(len == 0){
	alert("Add Atleast One Item to Receipt");
	return;
	}*/
for(var i=1;i<=len;i++){
	var idAttr = $("#productsList tr:eq("+i+") td:last").attr("id").replace('Del','');

		var obj = {sNo:$("#slno"+idAttr).val(),skuId:$("#skuId"+idAttr).val(),pluCode:$("#pluCode"+idAttr).val(),skuDescription:$("#Desc"+idAttr).text(),grade:$("#Price"+idAttr).val(),supplierCode:$("#supplierCode"+idAttr).text(),supplierSkuId:$("#supplierSkuId"+idAttr).text(),uom:$("#UOM"+idAttr).text(),productRange:$("#size"+idAttr).text(),price:$("#Cost"+idAttr).text(),colour:$("#colour"+idAttr).text(),minQuantity:$("#Pack"+idAttr).text(),maxQuantity:$("#lead"+idAttr).text()};

	items.push(obj);
	
}
finalObj.itemDetails = items;
/*var statusOrder="";
if(operation=="edit")
	statusOrder= $("#statusissue").val();*/
var maxRecords = 10;
	  if($("#maxRecords").length>0)
		  maxRecords = $("#maxRecords").val();
var searchName ="";
if($("#searchSupplier").length>0)
searchName = $("#searchSupplier").val();

var itemDetails = JSON.stringify(finalObj);
console.info(JSON.stringify(finalObj))
//$("#itemDetails").val(JSON.stringify(items))

var supplierAddresses = JSON.stringify(finalObj);
console.info(JSON.stringify(finalObj))

debugger;
var formData  = JSON.stringify($('form').serializeObject());
//formData.itemDetails = items;
console.info(JSON.stringify(formData))
var contextPath = $("#contextPath").val();
	   if(operation=="new"){
	 URL = contextPath + "/outletMaster/createSupplier.do";
	   }
	   else if(operation=="edit"){
		 URL = contextPath + "/outletMaster/updateSupplier.do";
	   }
	  	 $.ajax({
			type: "POST",
			url : URL,
			data :{ 
	           	formData : formData,
	           	itemDetails : itemDetails,
	           	supplierAddresses : supplierAddresses,
	           	maxRecords : maxRecords,
	           	searchName : searchName,
	           	
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


/*
function validateSupplierForm(operation){
	 //purpose:for checking internet conection
	var online = window.navigator.onLine;
  	if(!online)
  	{
  	alert("check your internet connection,please try agian after some time");
  	return;
  	}
  	debugger;
  	 var firmName = $("#firmName").val().trim();
	 var plotNo = $("#plotNo").val().trim();
	 var streetName = $("#streetName").val().trim();
	 var city = $("#city").val().trim();
	 var state = $("#state").val().trim();
	 var zipCode = $("#zipCode").val().trim();
	 var countryCode = $("#countryCode").val().trim();
//	 var currencyCode = $("#currencyCode").val();
	 
//	 var countryCode = $("#countryCode option:selected").text();
var currencyCode = $("#currencyCode").val().trim();
	 
	 var emailId = $("#emailId").val().trim();
	 if($("#emailIdError").text() != ""){
		 $("#emailId").focus();
		 return false;
	 }
	 if($("#error").text() != ""){
	 $("#phoneNumber").focus();
	 return false;
}
	 var defaultCountry = $("#defaultCountry").val().trim();
var phoneNumber = $("#phoneNumber").val().trim();
if(defaultCountry != "" && phoneNumber != ""){
	 $("#phone").val(defaultCountry+"-"+phoneNumber);
}
var phone = $("#phone").val();
if($("#error1").text() != ""){
	$("#phoneNumber1").focus();
	 return false;
}

defaultCountry = $("#defaultCountry1").val().trim();
phoneNumber = $("#phoneNumber1").val().trim();
if(defaultCountry != "" && phoneNumber != ""){
	 $("#mobile").val(defaultCountry+"-"+phoneNumber);
}
	 var shipmentMode = $("#shipmentMode").val();
	 var minOrderCost = $("#minOrderCost").val();
	 var minQuantity = $("#minQuantity").val();
	 var leadTime = $("#leadTime").val();
	 var uom = $("#uom").val();
	 
	 if(firmName.trim() == ""){
   	$("#firmNameError").html("Firm Name is required");
   	$("#firmName").focus();
  		return false;
  }
   
if(plotNo.trim() == ""){
   	$("#plotNoError").html("Plot No is required");
   	$("#plotNo").focus();
  		return false;
  }
   
if(streetName.trim() == ""){
		$("#streetNameError").html("Street Name is required");
		$("#streetName").focus();
		  return false;
}
	 
	  if(city.trim() == ""){
 		 $("#cityError").html("City is required");
 		 $("#city").focus();
 		  return false;
 }
	  
	  if(state.trim() == ""){
	 		 $("#shipmentStateError").html("Select State");
	 		 $("#state").focus();
	 		  return false;
	 }else{
		 $("#shipmentStateError").html("");
	 }
	  
	 if(zipCode.trim() == ""){
	$("#zipCodeError").html("Zip Code is required");
	$("#zipCode").focus();
 		return false;
 }

	 if(countryCode == "-1"){
	$("#countryCodeError").html("Country Code is required");
	$("#countryCode").focus();
 		return false;
 }else{
	  $("#selectedCountry").val($("#countryCode option:selected").text());
 }

	 if(currencyCode == "" || currencyCode == null){
		$("#currencyCodeError").html("Currency Code is required");
		$("#currencyCode").focus();
		  return false;
	 }else{
		 currencyCode = currencyCode.split('-');
	     currencyCode = currencyCode[0];
	     $("#selectedCurrency").val(currencyCode);
	 }

 if(emailId.trim() == ""){
		 $("#emailIdError").html("Email ID is required");
		 $("#emailId").focus();
		  return false;
}

 if(phone.trim() == ""){
    	$("#error").html("Phone is required");
    	$("#phoneNumber").focus();
	  		return false;
}
 if($("#phoneNumber1").val() == ""){
		$("#error1").text("Mobile is Required");
		$("#phoneNumber1").focus();
		return false;
	}
if(shipmentMode.trim() == ""){
 		$("#shipmentModeError").html("Shipment Mode is required");
 		$("#shipmentMode").focus();
 		  return false;
}
	 
if(minOrderCost.trim() == ""){
  		 $("#minOrderCostError").html("Min Order Cost is required");
  		 $("#minOrderCost").focus();
  		  return false;
}

if(minQuantity.trim() == ""){
		 $("#minQuantityError").html("Min Quantity is required");
		 $("#minQuantity").focus();
		  return false;
}

 if(leadTime.trim() == ""){
    	$("#leadTimeError").html("Lead Time is required");
    	$("#leadTime").focus();
	  		return false;
 	}
    
 var pan = $("#pan").val();
 if(pan.trim() != ""){
	 $("#PANNumberError").html("");
	 
 	var txtPANCard = document.getElementById("pan");
    var regex = /([A-Z]){5}([0-9]){4}([A-Z]){1}$/;
    if (regex.test(txtPANCard.value.toUpperCase())) {
        
    } else {
    	 $("#PANNumberError").html("Please Check PAN Number.");
    	 $("#PANNumber").focus();
        return false;
    }
    
	}
 
	var returnTerms = $("#returnTerms").val();
 	var returnDays = $("#returnDays").val();
 	if($("#returnDays").val() == "" || $("#returnDays").val() == null)
 		$("#returnDays").val(0.0);
 	
 	var markdown = $("#markdown").val();
 	if($("#markdown").val() == "" || $("#markdown").val() == null)
 		$("#markdown").val(0.0);
 	
 	if($("#markdown").val()>100){
 		$("#markdownError").html("For Markdown, Percentage Can't exceed morethan 100%");
    	$("#markdown").focus();
	  	return false;
 	}
if(uom.trim() == ""){
 		$("#uomError").html("UOM is required");
 		$("#uom").focus();
 		  return false;
}
 	var suppliercode = $("#supplierCode").val();
 	
 	var length = $("#supplierAddresses tr").length-1;
 	var finalObj = {},addresslist = [],items = [];;

 	if(length == 0){
 		alert("Add Atleast One Item to Receipt");
 		return;
 		}
 	for(var i=1;i<=length;i++){
 		var idAttr = $("#supplierAddresses tr:eq("+i+") td:last").attr("id").replace('Del','');
 			
 		var adType = $("#addressTypeAdd"+idAttr).text();
 		if(adType == "Billing Address"){
 			adType = "BA";
 		}else if(adType == "Shipping Address"){
 			adType = "SA";
 		}
 		
 		var supplierCodeforAdd = $("#supplierCodeAdd"+idAttr).val();
 		
 		if(operation == "edit"){
 			if($("#supplierCodeAdd"+idAttr).val() == "" || $("#supplierCodeAdd"+idAttr).val() == undefined || $("#supplierCodeAdd"+idAttr).val() == null){
 				supplierCodeforAdd = suppliercode;
 			}
 		}
 		
 			var Objdata = {addressType:adType,plotNo:$("#buildingNoAdd"+idAttr).text(),streetName:$("#streetNameAdd"+idAttr).text(),location:$("#locationAdd"+idAttr).text(),phone:$("#phoneAdd"+idAttr).val(),emailId:$("#emailAdd"+idAttr).val(),city:$("#cityAdd"+idAttr).text(),stateCode:$("#stateAdd"+idAttr).text(),countryCode:$("#countryCodeAdd"+idAttr).val(),pincode:$("#pincodeAdd"+idAttr).val(),supplierCode:supplierCodeforAdd};

 			addresslist.push(Objdata);
 		
 	}
 	finalObj.supplierAddresses = addresslist;

var len = $("#productsList tr").length-1;

if(len == 0){
	alert("Add Atleast One Item to Receipt");
	return;
	}
for(var i=1;i<=len;i++){
	var idAttr = $("#productsList tr:eq("+i+") td:last").attr("id").replace('Del','');

		var obj = {sNo:$("#slno"+idAttr).val(),skuId:$("#skuId"+idAttr).val(),pluCode:$("#pluCode"+idAttr).val(),skuDescription:$("#Desc"+idAttr).text(),grade:$("#Price"+idAttr).val(),supplierCode:$("#supplierCode"+idAttr).text(),supplierSkuId:$("#supplierSkuId"+idAttr).text(),uom:$("#UOM"+idAttr).text(),productRange:$("#size"+idAttr).text(),price:$("#Cost"+idAttr).text(),colour:$("#colour"+idAttr).text(),minQuantity:$("#Pack"+idAttr).text(),maxQuantity:$("#lead"+idAttr).text()};

	items.push(obj);
	
}
finalObj.itemDetails = items;

	 
var maxRecords = 10;
	  if($("#maxRecords").length>0)
		  maxRecords = $("#maxRecords").val();
var searchName ="";
if($("#searchSupplier").length>0)
searchName = $("#searchSupplier").val();

var itemDetails = JSON.stringify(finalObj);
console.info(JSON.stringify(finalObj))
//$("#itemDetails").val(JSON.stringify(items))

var supplierAddresses = JSON.stringify(finalObj);
console.info(JSON.stringify(finalObj))

debugger;
var formData  = JSON.stringify($('form').serializeObject());
//formData.itemDetails = items;
console.info(JSON.stringify(formData))
var contextPath = $("#contextPath").val();
	   if(operation=="new"){
	 URL = contextPath + "/outletMaster/createSupplier.do";
	   }
	   else if(operation=="edit"){
		 URL = contextPath + "/outletMaster/updateSupplier.do";
	   }
	  	 $.ajax({
			type: "POST",
			url : URL,
			data :{ 
	           	formData : formData,
	           	itemDetails : itemDetails,
	           	supplierAddresses : supplierAddresses,
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
}*/

function deleteItemImg(element){
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


var billingflag = 0;
function addAddresses(){
	debugger
	$("#countryCodeforAddresError").html("");
	$("#flagError").html("");
	 //purpose:for checking internet conection
	var online = window.navigator.onLine;
  	if(!online){
  	alert("check your internet connection,please try agian after some time");
  	return;
  	}
	
		 var len = parseInt($("#supplierAddresses tr").length);
		if (len != 1)
		len = parseInt($("#supplierAddresses tr:last").attr("id").replace('dynamicdiv', '')) + 1;
		 
		var Atype = $("#addessType").val();
		 
		 if(Atype == "" || Atype == null || Atype == undefined){
		 		$("#addessType").html("Please Select Address Type");
		    	$("#addessType").focus();
			  	return false;
		}
		 
		var slNo = 1; 
			 $('.slnoAdd').each(function(){
				$(this).text(slNo);
				slNo = parseInt(slNo) + 1;
			});
			 
			 var buildingNo = $("#buildingNo").val();
			 if(buildingNo == "" || buildingNo == null || buildingNo == undefined){
			 		$("#buildingNoError").html("Enter Plot No");
			    	$("#buildingNo").focus();
				  	return false;
			 	}else{
			 		$("#buildingNoError").html("");
			 	}
			 
			 if(parseInt($("#buildingNo").val().length) > 20){
				 $("#buildingNo").focus();
				 $("#buildingNoError").html("Building No can't exceeds 20 characters");
				 return false;
		}
			 
			 var streetName = $("#streetNameforAddress").val();
				 if(streetName == "" || streetName == null || streetName == undefined){
				 		$("#streetNameforAddressError").html("Enter Street Name");
				    	$("#streetNameforAddress").focus();
					  	return false;
				 	}else{
				 		$("#streetNameforAddressError").html("");
				 	}
				 
				 if(parseInt($("#streetNameforAddress").val().length) > 100) {
					 $("#streetNameforAddress").focus();
					 $("#streetNameforAddressError").html("street Name can't exceeds 100 characters");
					 return false;
			       }
				 
			 var phone = $("#phonenoforAddress").val();
			 if(phone == "" || phone == null || phone == undefined){
			 		$("#phonenoforAddressError").html("Enter Phone No");
			    	$("#phonenoforAddress").focus();
				  	return false;
			 	}else if(phone.length !=10){
	    	$("#phonenoforAddressError").html("enter 10 digits Phone No.");
	    	$("#phonenoforAddress").focus();
			return false;
	   		 }else{
			 		$("#phonenoforAddressError").html("");
			 	}
			 
			 var country = $("#countryCodeforAddress").val();
			 if(country == "-1"){
					$("#countryCodeforAddresError").html("Country Code is required");
					$("#countryCodeforAddress").focus();
				 		return false;
				 }else{
					  $("#selectedCountry").val($("#countryCode option:selected").text());
				 }
			 
			 var location = $("#locationforAddress").val();
			 if(location == "" || location == null || location == undefined){
			 		$("#locationforAddressError").html("Please Enter Location");
			    	$("#locationforAddress").focus();
				  	return false;
			 	}else{
			 		$("#locationforAddressError").html("");
			 	}
			 if(parseInt($("#locationforAddress").val().length) > 100) {
				 $("#locationforAddress").focus();
				 $("#locationforAddressError").html("Location can't exceeds 100 characters");
				 return false;
		       }
			 
			 var city = $("#cityforAddress").val();
			 if(city == "" || city == null || city == undefined){
			 		$("#cityforAddressError").html("Please Enter City");
			    	$("#cityforAddress").focus();
				  	return false;
			 	}else{
			 		$("#cityforAddressError").html("");
			 	}
			 
			 if(parseInt($("#cityforAddress").val().length) > 50) {
				 $("#cityforAddress").focus();
				 $("#cityforAddressError").html("City can't exceeds 50 characters");
				 return false;
		       }
			 
			 var state = $("#stateforAddress").val();
			 if(state == "" || state == null || state == undefined){
			 		$("#stateforAddressError").html("Please Select State");
			    	$("#stateforAddress").focus();
				  	return false;
			 	}else{
			 		$("#stateforAddressError").html("");
			 	}
			 
			 var email = $("#emailIDforAddress").val();
			 if(email == "" || email == null || email == undefined){
			 		$("#emailIDforAddressError").html("Please Enter Email ID");
			    	$("#emailIDforAddress").focus();
				  	return false;
			 	}else{
			 		$("#emailIDforAddressError").html("");
			 	}
			 
			 var pincode = $("#pincodeforAddress").val();
			 if(pincode == "" || pincode == null || pincode == undefined){
			 		$("#pincodeforAddressError").html("Please Enter PIN");
			    	$("#pincodeforAddress").focus();
				  	return false;
			 	}else{
			 		$("#pincodeforAddressError").html("");
			 	}
			 
			 if(parseInt($("#pincodeforAddress").val().length)!= 6){
				 $("#pincodeforAddress").focus();
				 $("#pincodeforAddressError").html("Pin should be in 6 digits");
				 return;
			}
			 
			 if(billingflag >0 && Atype == "Billing Address"){
				 $("#flagError").html("Please change address type, Only one billing address is allowed");
				 $("#addessType").focus();
				  	return false;
			 }
			 
			 if(Atype == "Billing Address"){
				 billingflag = billingflag+1;
			 }
			 
		 var row = "<tr id='dynamicdiv"+len+"' class='MoveableRow' style='margin-top:5px;'><td class='slnoAdd'>"+slNo+"</td>" +
		 "<td id='addressTypeAdd"+len+"'>"+Atype+"</td>" +	
		 "<td id='buildingNoAdd"+len+"'>"+buildingNo+"</td>" +
		 "<td id='streetNameAdd"+len+"'>"+streetName+"</td>" +
		 "<td id='locationAdd"+len+"'>"+location+"</td>" +
		 "<input type='hidden' id='phoneAdd"+len+"' value='"+phone+"'/>" +
		 "<input type='hidden' id='emailAdd"+len+"' value='"+email+"'/>" +
		 "<input type='hidden' id='countryCodeAdd"+len+"' value='"+country+"'/>" +
		 "<input type='hidden' id='pincodeAdd"+len+"' value='"+pincode+"'/>" +
		 "<td id='cityAdd"+len+"'>"+city+"</td>" +
		 "<td id='stateAdd"+len+"'>"+state+"</td>" +
		"<td  id='Del"+len+"'><a  id='Dele" +len+ "'  style='color: #3c8dbc;text-decoration: underline;margin-left:3px;' onclick='deleteItem(this);' title='Delete'>Delete</a>"
		"</td></tr>";
			
	$("#supplierAddresses tbody").append(row);
	$("#data").css("display","block");
}



function deleteItem(element){
	debugger
	var id = $(element).attr("id").replace('Dele','');
	$('#dynamicdiv'+id).remove();
	
	var slNo = 1; 
	 $('.slnoAdd').each(function(){
		$(this).text(slNo);
		slNo = parseInt(slNo) + 1;
	});

}

function ValidatePAN() {
	$("#PANNumberError").html("");
	debugger
   var txtPANCard = document.getElementById("pan");
   var regex = /([A-Z]){5}([0-9]){4}([A-Z]){1}$/;
   if (regex.test(txtPANCard.value.toUpperCase())) {
       return true;
   } else {
   	 $("#PANNumberError").html("Please Check PAN Number.");
   	$("#pan").focus();
       return false;
   }
}

