/**
 * 
 *Project Name 	        : OmniRetailerCustomer
 * Written By		        : Vamsi V
 * description				: The new storage system form is displayed using this controller
 */

function searchInvoicesdetails(searchName, searchCategory,index)
{
	 //purpose:for checking internet conection
	var online = window.navigator.onLine;
  	if(!online)
  	{
  	alert("check your internet connection,please try agian after some time");
  	return;
  	}
	var finalLocation =($("#from").val()).split(":");
	var storeLocation=finalLocation[0];
	var buissnessActivity=finalLocation[1];
	var status="true";
	var supplier_Id = $("#supplier_Id").val();
		var contextPath = $("#contextPath").val(); 
		 if(buissnessActivity == "Warehouse")
			 URL = contextPath + "/inventorymanager/searchWarehouseProducts.do";
		 else if(buissnessActivity == "Retail Outlet" || buissnessActivity == "Restaurant")
			URL = contextPath + "/inventorymanager/searchProducts.do";
		 $.ajax({
    			type: "GET",
    			url : URL,
    			data : {
    				searchName : searchName,
    				storeLocation : storeLocation
    				
    			},
    			beforeSend: function(xhr){                    
 	   	   			$("#loading").css("display","block");
 	   	   			$("#mainDiv").addClass("disabled");
 	   	   		  },
    			success : function(result) {
            		appendInvoicedetails(result, searchCategory,searchName);
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
function appendInvoicedetails(productsList, searchCategory,searchName){
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
	 else{
		 for(var i=0;i<productsList.length;i++){
			 if(productsList[i].skuID == productsList[i].description){
					 if (i == 0) {
						 op += '<li id="'+productsList[i].pluCode+'"  class="selected" onclick=getIds(this,"'+searchCategory+'"); ><a>'+productsList[i].description+'   (PRICE   -   '+productsList[i].price+')</a></li>';
					}else
					     op += '<li id="'+productsList[i].pluCode+'" onclick=getIds(this,"'+searchCategory+'"); ><a>'+productsList[i].description+'   (PRICE   -   '+productsList[i].price+')</a></li>';
		 	}
			 else{
				 if (i == 0) {
					 op += '<li id="'+productsList[i].pluCode+'"  class="selected" onclick=getIds(this,"'+searchCategory+'"); ><a>'+productsList[i].description+'   (SKU ID   -   '+productsList[i].skuID+',   PRICE   -   '+productsList[i].price+')</a></li>';
				}else
				     op += '<li id="'+productsList[i].pluCode+'" onclick=getIds(this,"'+searchCategory+'"); ><a>'+productsList[i].description+'   (SKU ID   -   '+productsList[i].skuID+',   PRICE   -   '+productsList[i].price+')</a></li>';
			 }
		 } 
		 
	 }
		/* for(var i=0;i<productsList.length;i++){
			 
				 if (i == 0) {
					 
					 op += '<li id="'+productsList[i].warehouseGatepassRef+'"  class="selected" onclick=getIds(this,"'+searchCategory+'","'+productsList[i].itemCode+'"); ><a>Item Code  -'+productsList[i].itemCode+'   (Item Desc  -   '+productsList[i].itemDesc+')</a></li>';
				}else
					
				     op += '<li id="'+productsList[i].warehouseGatepassRef+'" onclick=getIds(this,"'+searchCategory+'","'+productsList[i].itemCode+'"); ><a>Item Code  -'+productsList[i].itemCode+'   (Item Desc  -   '+productsList[i].itemDesc+')</a></li>';
			 }*/
	 
	 $("."+searchCategory).html(op);
	 $("."+searchCategory).show();
	 
}
function getIds(element,type){
	
	var id= $(element).attr("id");
	var description = null;
	description =  $("#"+id).children("a").text();
	description = description.split(' ( ');
	description = description[0];
	
	//$("#desc").val(description);
	if(type == "invoicesdetails")
		getInvoicedetails(id,type);
	
		 $(".services").hide();
		 $("."+type).html("");
	
}
function getInvoicedetails(skuId,type){
	 //purpose:for checking internet conection
	var online = window.navigator.onLine;
  	if(!online)
  	{
  	alert("check your internet connection,please try agian after some time");
  	return;
  	}
	var status ="false";
	 var contextPath = $("#contextPath").val();
	 var WarehouseReturnflag=$("#whreturnflag").val();
		if(WarehouseReturnflag == "" || WarehouseReturnflag == undefined || WarehouseReturnflag == null){
			WarehouseReturnflag="";
   		}
	 var storeLocation = $("#warehouse_location option:selected").text();
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
 				Invoicesdetails(result);
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
function Invoicesdetails(skuDetails)
{
	var parsedJson = jQuery.parseJSON(skuDetails);
	skuList = parsedJson.skuLists;
	appendingInvoicesdetails(skuList[0]);
	}

function appendingInvoicesdetails(sku){
	
	var contextPath = $("#contextPath").val();
	 var len = parseInt($("#invoiceproductsList tr").length);
		if (len != 1)
			len = parseInt($("#invoiceproductsList tr:last").attr("id").replace('dynamicdiv', '')) + 1;
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
				var row = "<tr id='dynamicdiv"+len+"' style='margin-top:5px;'><td class='slno' id='itemno"+len+"'>"+slNo+"</td><td id='itemCode"+len+"'>"+sku.skuId+"</td>" +
			"<td id='itemDesc"+len+"'>"+description+"</td>"+
			"<input type='hidden' id='taxvalue' value='"+sku.taxValue+"' />" +
			"<td id='uom"+len+"'>"+sku.uom+"</td>" +
			"<td id='qty"+len+"' ><input style='text-align: center;width:75px;' type='number' id='Received"+len+"' class='Received'  name='Received'  onBlur='changePack(this);' value='1' /></td>" +
			"<td id='packets"+len+"' ><input type='text' id='packets"+len+"' style='  width: 75px;' name='packets'></td><td id='price"+len+"'>"+sku.price+"</td>" +
			"<td class='amount' id='amount"+len+"' >"+sku.price+"</td><td id='Del"+len+"'>" +
			"<img id='Img"+len+"' src='"+contextPath+"/images/itemdelete.png' style='width:12%;cursor:pointer;' onclick='deleteItem(this);' title='Delete "+sku.skuId+"'/></td></tr>";
			$("#invoiceproductsList tbody").append(row);
			changeTotalCost();

	
}
function phoneNumberBlur(element){
	var id = $(element).attr("id");
	var rowNo = id.replace('custMobile','');
	
	
	var phoneNumber = $('#custMobile'+rowNo).val().trim();
	/*if(phoneNumber == ""){
		alert("enter customer mobile number");
		return false;
	}*/
	
	if(phoneNumber != ""){
		if(phoneNumber.length !=10){
		alert("invalid phone number");
		return;
		}
		/*if(phoneNumber.startsWith("91")){
			alert("invalid phone number");
			return;
			}*/
	}
}
/*function changePack(element){
	 
	var id = $(element).attr("id");
	var rowNo = id.replace('Received','');
	
	//var packVal = $('#Received'+rowNo).text();
	var packVal = parseFloat($('#Received'+rowNo).val());
	if(isNaN(packVal)){
		alert("Quantity should not be empty");
		return;
	}
	if(packVal<=0){
		alert("Quantity should be greater than zero");
		return;
	}
	
	changeQuantity();
	//changeTotalQuantity();
}*/


/*function changeQuantity()
{
	
	var packVal = $('#Received'+rowNo).text();
	if(packVal<=0){
		alert("Pack should not be empty");
	}
	var totalQty=0.0;
	var rows=0;
	$('.Received').each(function(){
	  var rowNo = $(this).attr("id").replace('Received','');
	  var qty = parseFloat($("#Received"+rowNo).val());
	  var qty1=parseFloat($("#Received"+rowNo).text())
	  if(isNaN(qty))
		  qty=0.0;
	  if(isNaN(qty1))
		  qty1=0.0;
	  totalQty = qty+qty1+totalQty;
	  rows=rows+1;
	 });
	$('#totalQuantity').val(totalQty);
	$('#totalPacks').val(rows);
	
	
}*/
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
	 changeTotalCost();
}
function searchinvoices(searchName, searchCategory,index)
{
	 //purpose:for checking internet conection
	var online = window.navigator.onLine;
  	if(!online)
  	{
  	alert("check your internet connection,please try agian after some time");
  	return;
  	}	
	var status=$("#status").val();
		if(status == "all")
		{
		status="";
		}
		var maxRecords = 10;
		 if($("#maxRecords").length>0)
			 maxRecords = $("#maxRecords").val();
		var startDate = "";
		 var endDate = "";
	 var location = "";
		 if($("#location").length>0 && $("#location").val != "select" && $("#location").val != "ALL")
 		loc = $("#location").val().split(":");
		 location=loc[0];
		 var CurrentDate=getCurrentDate().split(" ");
			var  finalstr=CurrentDate[0];
			var dobDiff = daydiff(parseDateMMDDYYYY(finalstr), parseDate($('#from').val()));
			var dobDiff1 = daydiff(parseDateMMDDYYYY(finalstr), parseDate($('#to').val()));
			if(dobDiff > 0){
				alert("Start Date  can't be Future Date");
				return false;
			}
			if(dobDiff1 > 0){
				alert("End Date  can't be Future Date");
				return false;
			}
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
	var type = $("#type").val();
	var flowUnder = "";
	if($("#flowUnder").length > 0)
		flowUnder = $("#flowUnder").val();
	var storeLocation =$("#location").val();
	var status="true";
	var supplier_Id = $("#supplier_Id").val();
		var contextPath = $("#contextPath").val();
			URL = contextPath + "/inventorymanager/searchInvoice.do";
		 $.ajax({
    			type: "GET",
    			url : URL,
    			data : {
    				searchName : searchName,
    				location : location,
  					maxRecords : maxRecords,
 					startDate : startDate,
 					endDate : endDate,
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

function addgatepassitems(gatepassitem){
	
	 var contextPath = $("#contextPath").val();
	 var len = parseInt($("#gatepassList tr").length);
		if (len != 1)
			len = parseInt($("#gatepassList tr:last").attr("id").replace('dynamicdiv', '')) + 1;
	
		
		
		
		
		var slNo = 1; 
			 $('.slno').each(function(){
				$(this).text(slNo);
				slNo = parseInt(slNo) + 1;
			});
		
				var row = "<tr id='dynamicdiv"+len+"' style='margin-top:5px;'><td class='slno' id='itemno"+len+"'>"+slNo+"</td><td id='itemCode"+len+"'>"+gatepassitem.itemCode+"</td>" +
			
			"<td id='itemDesc"+len+"'>"+gatepassitem.itemDesc+"</td>"+
			"<td id='uom"+len+"'>"+gatepassitem.uom+"</td>" +
			"<td id='quantity"+len+"'>"+gatepassitem.quantity+"</td>" +
			"<td id='shiporder"+len+"'>"+gatepassitem.shipmentOrderRef+"</td>" +
			"<td id='quantity"+len+"' >"+gatepassitem.mobileNo+"</td><td id='address"+len+"'>"+gatepassitem.locationId+"</td></tr>"; 
			$("#gatepassList tbody").append(row);
			/*if (len == 1){
				alert("time")
				$(".timepicker").timepicker({
				     showInputs: false,
				     showMeridian:false,
				     showSeconds:true,
				     
				  });
			}*/
		
	 //changeTotalCost();
	 //changeTotalQuantity();
}
function numerics(event) {
	 
    if(event.which == 8 || event.which == 0){
        return true;
    }
    if(event.which < 47 || event.which > 59) {
        return false;
        //event.preventDefault();
    } // prevent if not number/dot
    
    if(event.which == 46 && $(this).val().indexOf('.') != -1) {
        return false;
        //event.preventDefault();
    }
}
function createInvoices(id,status,invoiceid){
	 //purpose:for checking internet conection
	var online = window.navigator.onLine;
  	if(!online)
  	{
  	alert("check your internet connection,please try agian after some time");
  	return;
  	}
	/*$(document).ready(function(){
		
		 $("#carreircompany").on('input',function(e){
			   $("#carreircompany").html("");
			   $("#carreirCompanyError").html("");
			   $(".Error").html("");
			  
		 });	
		
	});*/
	//debugger;
	var loc = $('#from').val();
	var finalLocation =loc.split(":");
	var locationId=finalLocation[0];
	 //var gateNo=$('#gateNo').val();
	 var len = parseInt($("#invoiceproductsList tr").length);
	 var invoiceobj = {},invoiceItems = [];
	/*if(carreirCompany.trim()==""){
		 $('#carreirCompanyError').html('Please enter carreir company');
		 $('#carreircompany').focus();
		 return false;*/	
var CurrentDate=getCurrentDate().split(" ");
var  finalstr=CurrentDate[0];
var dobDiff = daydiff(parseDateMMDDYYYY(finalstr), parseDate($('#orderDate').val()));
if(dobDiff > 0){
	$('#orderDateError').html('Date cannot be future Date');
	return false;
}

	 if(len <= 1){
			alert("Add Atleast One Item");
	 		return false;
		}
	 var obj = [];
	 for(var i=1;i<len;i++){
	 		var idAttr = $("#invoiceproductsList tr:eq("+i+") td:last").attr("id").replace('Del','');  
		//var obj = {approvedQty:$("#approvedQty"+idAttr).val(),pluCode:$("#pluCode"+idAttr).val(),skuId:$("#Name"+idAttr).text(),itemDesc:$("#Desc"+idAttr).text(),uom:$("#UOM"+idAttr).text(),itemPrice:$("#Price"+idAttr).text(),quantity:$("#Pack"+idAttr).val(),totalCost:$("#Cost"+idAttr).text(),color:$("#colour"+idAttr).text(),size:$("#size"+idAttr).text()};
	 	//,totalPacks:$("#totalPacks"+idAttr).text(),totalQuantity:$("#totalQuantity"+idAttr).text()
	 		var obj = {itemId:$("#itemCode"+idAttr).text(),itemDescription:$("#itemDesc"+idAttr).text(),unitOfMeasurement:$("#uom"+idAttr).text(),price:parseFloat($("#price"+idAttr).text()),quantity:parseInt($("#Received"+idAttr).val()),total:parseFloat($("#amount"+idAttr).text()),skuId:$("#itemCode"+idAttr).text()};
	 	//if($("#Received"+idAttr).text()>0)
	 		invoiceItems.push(obj);
	 	}
	  var dnoStreet=($('#billTo').val()).split(",");
	  var dno=dnoStreet[0];
	  var street=dnoStreet[1];
	  invoiceobj.orderId=$('#orderRef').val();
	  if(invoiceid != "" || invoiceid != null)
		{
		  invoiceobj.invoiceId=invoiceid;
		}
	 //invoiceobj.orderId="SOID12546";
	  invoiceobj.invoiceStatus="Submitted";
	 invoiceobj.buildingNo=dno;
	 invoiceobj.streetName=street;
	 invoiceobj.city=$('#billTo1').val();
	 invoiceobj.country=$('#billTo2').val();
	 invoiceobj.invoiceDate=$('#orderDate').val();
	 invoiceobj.zip_code=$('#billTo3').val();
	 invoiceobj.totalItemCost=parseFloat($('#total').val());
	 invoiceobj.shipmentCost=parseFloat($('#shipmentCharges').val());
	 invoiceobj.tax=parseFloat($('#tax').val());
	 invoiceobj.warehouse_location=locationId;
	 invoiceobj.invoiceItems=invoiceItems;
	
		var contextPath = $("#contextPath").val();
		URL = contextPath + "/inventorymanager/createInvoice.do";
		
		var formData = JSON.stringify(invoiceobj);
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

function invoicedetailsviewedit(id,operation){
	//console.log(maxRecords+"..."+index);
	 //purpose:for checking internet conection
	var online = window.navigator.onLine;
  	if(!online)
  	{
  	alert("check your internet connection,please try agian after some time");
  	return;
  	}
	  var contextPath = $('#contextPath').val();
	 var URL = contextPath + "/inventorymanager/viewEditinvoice.do";
	 
	  $.ajax({
		 type : "GET",
		url : URL,
		data : { 
			id : id,
			operation : operation
			},
			beforeSend: function(xhr){                    
	   	   			$("#loading").css("display","block");
	   	   			$("#mainDiv").addClass("disabled");
	   	   		  },
	    		success : function(result){
	    			//changeQuantity();
	    			$("#right-side").html(result);
	    			$("#location").val(location);
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
$(".clearError").on('input',function(e){
	$(".Error").html("");
	var id = $(this).attr("id");
	if($("#"+id+"Error").length > 0)
		$("#"+id+"Error").html("");
});

function searchorderref(searchName, searchCategory)
{
	 //purpose:for checking internet conection
	var online = window.navigator.onLine;
  	if(!online)
  	{
  	alert("check your internet connection,please try agian after some time");
  	return;
  	}
	var contextPath = $("#contextPath").val();
	 URL = contextPath + "/inventorymanager/searchOrderRef.do";
	 $.ajax({
			type: "GET",
			url : URL,
			data : {
				searchName : searchName
			},
			beforeSend: function(xhr){                    
 	   			$("#loading").css("display","block");
 	   			$("#mainDiv").addClass("disabled");
 	   		  },
			success : function(result) {
				appendOrderRef(result, searchCategory);
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
function appendOrderRef(suppliersList, searchCategory){
	 $("."+searchCategory).html('');
	 var op = '';
	 for(var i=0;i<suppliersList.length;i++){
		 if (i == 0) {
			 op += '<li id="'+suppliersList[i].orderId+'"  class="selected" onclick=getCode(this,"'+searchCategory+'"); ><a>'+suppliersList[i].orderId+'</a></li>';
		}else
			 op += '<li id="'+suppliersList[i].orderId+'" onclick=getCode(this,"'+searchCategory+'"); ><a>'+suppliersList[i].orderId+'</a></li>';
	 }
	 $("."+searchCategory).html(op);
	 $("."+searchCategory).show();
}
function getCode(element,type){
	 //purpose:for checking internet conection
	var online = window.navigator.onLine;
  	if(!online)
  	{
  	alert("check your internet connection,please try agian after some time");
  	return;
  	}
	var id= $(element).attr("id");
	//$("#supplier_Id").val(id);
	var label = $(element).children("a").text();
	$("#orderRef").val(label);
	 $(".services").hide();
	 $("."+type).html("");
	 var contextPath = $("#contextPath").val();
	 URL = contextPath + "/inventorymanager/searchOrderRefItems.do";
	 $.ajax({
			type: "GET",
			url : URL,
			data : {
				searchName : label
			},
			beforeSend: function(xhr){                    
 	   			$("#loading").css("display","block");
 	   			$("#mainDiv").addClass("disabled");
 	   		  },
			success : function(result) {
				appendInvoices(result);
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
function appendInvoices(invoice)
{ 
	var location=invoice.saleLocation;
	$("#from option:selected").text(invoice.saleLocation);	
	$("#orderDate").val(invoice.order_date);	
	var billto=invoice.billing_address_doorNo+","+invoice.billing_address_street;
	$("#billTo").val(billto);
	$("#billTo1").val(invoice.billing_address_city);
	$("#subTotal").val(invoice.totalOrderAmount);
	$("#tax").val(invoice.orderTax);
	$("#shipmentCharges").val(invoice.shipmentCharges);
	
	var contextPath = $("#contextPath").val();
	 var len = parseInt($("#invoiceproductsList tr").length);
		if (len != 1)
			len = parseInt($("#invoiceproductsList tr:last").attr("id").replace('dynamicdiv', '')) + 1;
		var description = null;
		if (invoice.description != "" && invoice.description != null)
			description = invoice.description;
		else
			description = $("#desc").val();
		
		var make = invoice.make;
		if(make == "" || make == null)
			make = "_";
		var slNo = 1; 
			 $('.slno').each(function(){
				$(this).text(slNo);
				slNo = parseInt(slNo) + 1;
			});
			 
			 for(var i=0;i<invoice.itemDetails.length;i++)
				 {
				var row = "<tr id='dynamicdiv"+len+"' style='margin-top:5px;'><td class='slno' id='itemno"+len+"'>"+len+"</td><td id='itemCode"+len+"'>"+invoice.itemDetails[i].skuId+"</td>" +
			"<td id='itemDesc"+len+"'>"+invoice.itemDetails[i].item_name+"</td>"+
			"<td id='uom"+len+"'>-</td>" +
			"<td id='qty"+len+"' ><input style='text-align: center;width:75px;' type='number' id='Received"+len+"' class='Received'  name='Received'  onBlur='changePack(this);' value='1' /></td>" +
			"<td id='packets"+len+"' ><input type='text' id='packets"+len+"' style='  width: 75px;' name='packets'></td><td id='price"+len+"'>"+invoice.itemDetails[i].item_price+"</td>" +
			"<td class='amount' id='amount"+len+"' >"+invoice.itemDetails[i].total_cost+"</td><td id='Del"+len+"'>" +
			"<img id='Img"+len+"' src='"+contextPath+"/images/itemdelete.png' style='width:12%;cursor:pointer;' onclick='deleteItem(this);' title='Delete "+invoice.itemDetails[i].skuId+"'/></td></tr>";
			$("#invoiceproductsList tbody").append(row);
			len=len+1;
				 }
			
			changeTotalCost();
	
	
	appendreflocations(location);
}
function changePack(element){
	var id = $(element).attr("id");
	if (isNaN($("#"+id).html()) || $("#"+id).html() == "")
		$('#'+id).html("1");
	var rowNo = id.replace('Received','');
	var packVal = parseFloat($('#Received'+rowNo).val());
	if(packVal<=0){
		alert("Quantity should not be empty");
		var priceVal = parseFloat($('#price'+rowNo).html());
		$('#Received'+rowNo).val(1);
		$('#amount'+rowNo).html(priceVal);
	}else{
		var priceVal = parseFloat($('#price'+rowNo).html());
		$('#amount'+rowNo).html(packVal*priceVal);
		//changeTotalQuantity();
		changeTotalCost();
	}
}
function changeTotalCost(){
	var totalCost=0.0;
	$('.amount').each(function(){
	  var productName = $(this).attr("id").replace('amount','');
	  var cost = $("#amount"+productName).html();
	  totalCost = totalCost + parseFloat(cost);
	 });
	var taxval=parseFloat($("#taxvalue").val());
	if(isNaN(taxval))
		{
		
		} else
			{
			var tax=parseFloat($("#tax").val())+taxval;
			$("#tax").val(tax);
			}
	$("#subTotal").val(totalCost);
	var totalInvoice=0.0;
	totalInvoice=totalCost+parseFloat($("#tax").val())+parseFloat($("#shipmentCharges").val())
	$("#total").val(totalInvoice);
}


function appendreflocations(location)
{
	//$("#billTo2").val(invoice[0].billing_address_street);
	 var contextPath = $("#contextPath").val();
	 URL = contextPath + "/inventorymanager/orderRefLocations.do";
	 $.ajax({
			type: "GET",
			url : URL,
			data : {
				locationId : location
			},
			beforeSend: function(xhr){                    
 	   			$("#loading").css("display","block");
 	   			$("#mainDiv").addClass("disabled");
 	   		  },
			success : function(result) {
				appendLocations(result);
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
function appendLocations(loc)
{
	$("#address_streetname").val(loc[0].address);	
	$("#address_city").val(loc[0].city);	
	$("#address_countryname").val(loc[0].country);
	$("#from option:selected").text(loc[0].locationId);
	
	}

$("#orderRef").on('input',function(e){
	
	$("#orderRefError").html("");
	if($("#orderRef").val().length<3){
		$("#supplier_Id").val("");
	}
	$(".orderRef").children("li").each(function(){
		var supplierName = $(this).children("a").text().trim();
		if($("#orderRef").val().trim().toLowerCase() == supplierName.toLowerCase()){
			$("#orderRef").val($("#orderRef").val().trim());
			//$("#supplier_Id").val($(this).attr("id"));
			 $(".services").hide();
			 $(".matchedStringUl").html("");
			return;
		}
		else{
			$("#supplier_Id").val("");
		}
	});
	if(e.keyCode == 9){
		
		if($("#orderRef").val()!=""){
			 $("#orderRefError").html("Supplier Name doesn't exist");
		 }
		 $(".services").hide();
		 $(".matchedStringUl").html("");
	}
});

