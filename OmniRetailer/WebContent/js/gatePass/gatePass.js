/**
 * 
 *Project Name 	        : OmniRetailerCustomer
 * Written By		        : Vamsi V
 * description				: The new storage system form is displayed using this controller
 */
function viewNewShipmentGatePass(id,status,flowUnder){
	 //purpose:for checking internet conection
	var online = window.navigator.onLine;
  	if(!online)
  	{
  	alert("check your internet connection,please try agian after some time");
  	return;
  	}
	var contextPath = $("#contextPath").val();
	var location = "";
	if($("#location").length > 0)
		location = $("#location").val();
//    var flowUnder = "";
//	if($("#flowUnder").length > 0)
	if(flowUnder == undefined || flowUnder == "")
    	flowUnder = $("#flowUnder").val();
	URL = contextPath + "/inventorymanager/viewNewShipmentGatePass.do";
		$.ajax({
			type: "GET",
			url : URL,
			data : {
				},
			beforeSend: function(xhr){                    
		   		$("#loading").css("display","block");
		   		$("#mainDiv").addClass("disabled");
		   	},
			success : function(result){
				$('#right-side').html(result);
				if(id != "" && id != null && id != undefined)
	    				activeMenu(id);
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
function searchShipmentGatepass(searchName, searchCategory,index)
{
	 //purpose:for checking internet conection
	var online = window.navigator.onLine;
  	if(!online)
  	{
  	alert("check your internet connection,please try agian after some time");
  	return;
  	}
  	//debugger
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
            		appendGatepass(result, searchCategory,searchName);
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
function appendGatepass(productsList, searchCategory,searchName){
	 //purpose:for checking internet conection
	var online = window.navigator.onLine;
  	if(!online)
  	{
  	alert("check your internet connection,please try agian after some time");
  	return;
  	}
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
	 //purpose:for checking internet conection
	var online = window.navigator.onLine;
  	if(!online)
  	{
  	alert("check your internet connection,please try agian after some time");
  	return;
  	}
	var id= $(element).attr("id");
	var description = null;
	description =  $("#"+id).children("a").text();
	description = description.split(' ( ');
	description = description[0];
	
	//$("#desc").val(description);
	if(type == "shipmentgatepass")
		getGatepassDetails(id,type);
	
		 $(".services").hide();
		 $("."+type).html("");
	
}
function getGatepassDetails(skuId,type){
	 //purpose:for checking internet conection
	var online = window.navigator.onLine;
  	if(!online)
  	{
  	alert("check your internet connection,please try agian after some time");
  	return;
  	}
	var status ="false";
	 var contextPath = $("#contextPath").val();
	 var storeLocation = $("#warehouse_location option:selected").text();

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
 				gatepassDetails(result);
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
function gatepassDetails(skuDetails)
{
	var parsedJson = jQuery.parseJSON(skuDetails);
	skuList = parsedJson.skuLists;
	appendgatepassDetails(skuList[0]);
	}

function appendgatepassDetails(sku){
	 //purpose:for checking internet conection
	var online = window.navigator.onLine;
  	if(!online)
  	{
  	alert("check your internet connection,please try agian after some time");
  	return;
  	}
	var contextPath = $("#contextPath").val();
	 var len = parseInt($("#productsList tr").length);
		if (len != 1)
			len = parseInt($("#productsList tr:last").attr("id").replace('dynamicdiv', '')) + 1;
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
			"<input type='hidden' id='skuId"+len+"' value='"+sku.skuId+"'/>" +
			"<input type='hidden' id='pluCode"+len+"' value='"+sku.pluCode+"'/>" +
			"<input type='hidden' id='itemprice"+len+"' value='"+sku.price+"'/>" +
			"<td id='itemDesc"+len+"'>"+description+"</td>"+
			"<td id='uom"+len+"'>"+sku.uom+"</td>" +
			"<td id='qty"+len+"' ><input style='text-align: center;width:75px;' type='number' id='Received"+len+"' class='Received'  name='Received'  onBlur='changePack(this);' value='1' /></td>" +
			"<td ><input type='text' id='shipOrder"+len+"' style='  width: 100px;' name='shipOrder'></td><td contenteditable='true' ><input type='number' onblur='phoneNumberBlur(this);' placeholder='Phone Number' name='custMobile' id='custMobile"+len+"' style='  width: 100px;' name='custMobile' size='15' maxlength='15' oninput='this.value = this.value.replace(/[^0-9]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');'></td>" +
			
			
			"<td   contenteditable='true'><input type='text' id='Address"+len+"' style='  width: 100px;' name='Address'></td><td id='Del"+len+"'>" +
			"<img id='Img"+len+"' src='"+contextPath+"/images/itemdelete.png' style='width:12%;cursor:pointer;' onclick='deleteItem(this);' title='Delete "+sku.skuId+"'/></td></tr>";
			$("#productsList tbody").append(row);
			
			changeQuantity();

	
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
function changePack(element){
	 
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
}

function changeQuantity()
{
	
	/*var packVal = $('#Received'+rowNo).text();
	if(packVal<=0){
		alert("Pack should not be empty");
	}*/
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
	 changeQuantity();
}
function searchGatepass(searchName, searchCategory,index)
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
 		location = $("#location").val();
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
			URL = contextPath + "/inventorymanager/searchGatepass.do";
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
	
	
	 //purpose:for checking internet conection
	var online = window.navigator.onLine;
  	if(!online)
  	{
  	alert("check your internet connection,please try agian after some time");
  	return;
  	}
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
function createShipmentGatePass(id,status,flowUnder){
	
	$(document).ready(function(){
		
		 $("#carreircompany").on('input',function(e){
			   $("#carreircompany").html("");
			   $("#carreirCompanyError").html("");
			   $(".Error").html("");
			  
		 });	
		
	});
	
	var loc = $('#from').val();
	var finalLocation =loc.split(":");
	var locationId=finalLocation[0];
	 var carreirCompany=$('#carreircompany').val();
	 var personName=$('#personName').val();
	 var startDateStr=$('#returnDateStr').val();
	 var contactTime=$('#contactTime').val();
	 var vehicleNumber=$('#vehicleNumber').val();
	 var loadedBy=$('#loadedBy').val();
	 var gateNo=$('#gateNo').val();
	 var returnable= $('input:radio[name=returnable]:checked').val();
	 var nonreturnable= $('input:radio[name=nonReturnable]:checked').val();
	 var personalbelonging= $('input:radio[name=personalBelonging]:checked').val();
	 var waste = $('input:radio[name=waste]:checked').val();
	 var len = parseInt($("#productsList tr").length);
	 var warehouseGatepassobj = {},gatePassItems = [];
	if(carreirCompany.trim()==""){
		 $('#carreirCompanyError').html('Please enter carreir company');
		 $('#carreircompany').focus();
		 return false;
}
	 //purpose:for checking internet conection
	var online = window.navigator.onLine;
  	if(!online)
  	{
  	alert("check your internet connection,please try agian after some time");
  	return;
  	}
/*if(personName.trim()==""){
	 $('#returnByPersonName').html('Please enter person name');
	 return false;
}*/
	
var CurrentDate=getCurrentDate().split(" ");
var  finalstr=CurrentDate[0];
var dobDiff = daydiff(parseDateMMDDYYYY(finalstr), parseDate($('#returnDateStr').val()));
if(dobDiff > 0){
	$('#returnDateStrError').html('Date cannot be future Date');
	return false;
}
var timestr=CurrentDate[1].split(":");
var contacttimestr=contactTime.split(":");
if(contacttimestr[0]>timestr[0])
	{
	$('#returnTimeStrError').html('Time cannot be future Time');
	return false;
	}
if(contacttimestr[0]==timestr[0] && contacttimestr[1]>timestr[1])
{
$('#returnTimeStrError').html('Time cannot be future Time');
return false;
}
if(startDateStr.trim()==""){
	 $('#returnDateStrError').html('Please enter Date');
	 return false;
}
if(contactTime.trim()==""){
	 $('#returnTimeStrError').html('Please enter time');
	 return false;
}
/*if(vehicleNumber.trim()==""){
	 $('#vehicleNoError').html('Please enter vehicle number');
	 return false;
}
if(loadedBy.trim()==""){
	 $('#loadedByError').html('Please enter loaded by');
	 return false;
}
if(gateNo.trim()==""){
	 $('#gateNoError').html('Please enter gate no');
	 return false;
}*/

	 if(len <= 1){
			alert("Add Atleast One Item");
	 		return false;
		}
	 var obj = [];
	//debugger;
	warehouseGatepassobj.gatePassRef=id;
	 for(var i=1;i<len;i++){
	 		var idAttr = $("#productsList tr:eq("+i+") td:last").attr("id").replace('Del','');  
		//var obj = {approvedQty:$("#approvedQty"+idAttr).val(),pluCode:$("#pluCode"+idAttr).val(),skuId:$("#Name"+idAttr).text(),itemDesc:$("#Desc"+idAttr).text(),uom:$("#UOM"+idAttr).text(),itemPrice:$("#Price"+idAttr).text(),quantity:$("#Pack"+idAttr).val(),totalCost:$("#Cost"+idAttr).text(),color:$("#colour"+idAttr).text(),size:$("#size"+idAttr).text()};
	 	//,totalPacks:$("#totalPacks"+idAttr).text(),totalQuantity:$("#totalQuantity"+idAttr).text()
	 		if(id == "")
	 			{
	 			obj = {itemCode:$("#itemCode"+idAttr).text(),itemDesc:$("#itemDesc"+idAttr).text(),uom:$("#uom"+idAttr).text(),salesOrderRef:$("#shipOrder"+idAttr).val(),shipmentOrderRef:$("#shipOrder"+idAttr).val(),quantity:$("#Received"+idAttr).val(),remarks:$("#Address"+idAttr).val()};	
	 			} else
	 				{
	 				var order=$("#shipOrder"+idAttr).text();
	 				if(order=="")
	 					{
	 					obj = {itemCode:$("#itemCode"+idAttr).text(),itemDesc:$("#itemDesc"+idAttr).text(),uom:$("#uom"+idAttr).text(),salesOrderRef:$("#shipOrder"+idAttr).val(),shipmentOrderRef:$("#shipOrder"+idAttr).val(),quantity:$("#Received"+idAttr).val(),remarks:$("#Address"+idAttr).val()};
	 					} else
	 						{
		 			obj = {itemCode:$("#itemCode"+idAttr).text(),itemDesc:$("#itemDesc"+idAttr).text(),uom:$("#uom"+idAttr).text(),salesOrderRef:$("#shipOrder"+idAttr).text(),shipmentOrderRef:$("#shipOrder"+idAttr).text(),quantity:$("#Received"+idAttr).text(),remarks:$("#Address"+idAttr).text()};
	 						}
	 				}
	 	//if($("#Received"+idAttr).text()>0)
			gatePassItems.push(obj);
	 	}
	
//debugger;	 
	/*if($("#location").length > 0)
		locationId = $("#location").val();*/
//    var flowUnder = "";
//	if($("#flowUnder").length > 0)
	//if(flowUnder == undefined || flowUnder == "")
    	//flowUnder = $("#flowUnder").val();
	 
		warehouseGatepassobj.locationId = locationId;
		warehouseGatepassobj.salesOrderRef = "SHIO3146";
		warehouseGatepassobj.shipmentOrderRef = "SHIO3146";
		warehouseGatepassobj.submittedBy = personName;
		warehouseGatepassobj.destination = carreirCompany;
		warehouseGatepassobj.checkedBy = personName;
		warehouseGatepassobj.issuedBy = personName;
		warehouseGatepassobj.pickedBy = personName;
		warehouseGatepassobj.description = carreirCompany;
		warehouseGatepassobj.gatePassItems=gatePassItems;
		warehouseGatepassobj.startDateStr=startDateStr;
		//finalObj.carreirCompany = carreirCompany;
		//finalObj.personName = personName;
		//finalObj.startDateStr = startDateStr;
		//finalObj.contactTime = contactTime;
		//finalObj.vehicleNumber = vehicleNumber;
		//finalObj.loadedBy = loadedBy;
		//finalObj.gateNo = gateNo;
		//finalObj.returnable = returnable;
		//finalObj.nonreturnable = nonreturnable;
		//finalObj.personalbelonging = personalbelonging;
		//finalObj.waste = waste;
		//finalObj.locationId = "123";
		
		//finalObj.userName = "admin";
		//finalObj.userRole="admin";
		
		
		//finalObj.gatePassRef="1";
		//finalObj.createdDate=startDateStr;
		//finalObj.updatedDate=startDateStr;
		
		//finalObj.startIndex="0";
		//finalObj.maxRecords="10";
		//finalObj.searchCriteria="";
		//finalObj.endDateStr="";
		//finalObj.createdDateStr="";
		//finalObj.updatedDateStr="";
		//finalObj.zoneId="2";
		//finalObj.warehouseGatepassIds="";
		//debugger;
		var contextPath = $("#contextPath").val();
		if(id != "" || id != null)
			{
			URL = contextPath + "/inventorymanager/updateGatePass.do";
			} else
				{
		URL = contextPath + "/inventorymanager/createGatePass.do";
				}
		//debugger;
		var formData = JSON.stringify(warehouseGatepassobj);
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


function viewEditGatepass(id,operation){
	 //purpose:for checking internet conection
	var online = window.navigator.onLine;
  	if(!online)
  	{
  	alert("check your internet connection,please try agian after some time");
  	return;
  	}
	//console.log(maxRecords+"..."+index);
	  var contextPath = $('#contextPath').val();
	 var URL = contextPath + "/inventorymanager/viewEditGatepass.do";
	 
	  $.ajax({
		 type : "GET",
		url : URL,
		data : { 
			id : id,
			operation : operation,
			},
			beforeSend: function(xhr){                    
	   	   			$("#loading").css("display","block");
	   	   			$("#mainDiv").addClass("disabled");
	   	   		  },
	    		success : function(result){
	    			changeQuantity();
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

