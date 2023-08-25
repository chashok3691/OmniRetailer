  
$(document).ready(function(){
	
	 $("#shipmentCharges").on('input',function(e){
		   $("#shipmentCharges").html("");
		   $("#shipmentChargesError").html("");
		   $(".Error").html("");
		  
	 });
	 $("#email_id").on('input',function(e){
		   $("#emailError").html("");
		   $(".Error").html("");
	});
	 $("#deliveryDate").on('input',function(e){
		   $("#deliveryDateError").html("");
		   $(".Error").html("");
	});
	 $("#orderDate").on('input',function(e){
		   $("#orderDateError").html("");
		   $(".Error").html("");
	});
	 $("#custDno").on('input',function(e){
		   $("#custDnoError").html("");
		   $(".Error").html("");
	});
	 $("#custStreet").on('input',function(e){
		   $("#custStreetError").html("");
		   $(".Error").html("");
	});
	 $("#custLoc").on('input',function(e){
		   $("#custLocError").html("");
		   $(".Error").html("");
	});
	 $("#custCity").on('input',function(e){
		   $("#custCityError").html("");
		   $(".Error").html("");
	});
	 $("#billDno").on('input',function(e){
		   $("#billDnoError").html("");
		   $(".Error").html("");
	});
	 $("#billStreet").on('input',function(e){
		   $("#billStreetError").html("");
		   $(".Error").html("");
	});
	 $("#billLoc").on('input',function(e){
		   $("#billLocError").html("");
		   $(".Error").html("");
	});
	 $("#billCity").on('input',function(e){
		   $("#billCityError").html("");
		   $(".Error").html("");
	});
	 $("#shipDno").on('input',function(e){
		   $("#shipDnoError").html("");
		   $(".Error").html("");
	});
	 $("#shipStreet").on('input',function(e){
		   $("#shipStreetError").html("");
		   $(".Error").html("");
	});
	 $("#shipLoc").on('input',function(e){
		   $("#shipLocError").html("");
		   $(".Error").html("");
	});
	 $("#shipCity").on('input',function(e){
		   $("#shipCityError").html("");
		   $(".Error").html("");
	});
	 $("#phoneNumber1").on('input',function(e){
		   $("#error1").html("");
		   $(".Error").html("");
//		   alert($("#defaultCountry1 option:selected").attr("text"));
	});
	 $("#phoneNumber2").on('input',function(e){
		   $("#error2").html("");
		   $(".Error").html("");
//		   alert($("#defaultCountry1 option:selected").attr("text"));
	});
	 $("#phoneNumber3").on('input',function(e){
		   $("#error3").html("");
		   $(".Error").html("");
//		   alert($("#defaultCountry1 option:selected").attr("text"));
	});
	 
	 
	 $("#phoneNumber").on('input',function(e){
		   $("#error").html("");
		   $(".Error").html("");
	});
});

function parseDate(str) {
    var mdy = str.split('/');
    return new Date(mdy[2], mdy[1]-1, mdy[0]);
}

function parseDateMMDDYYYY(str) {
    var mdy = str.split('/');
    var yr = mdy[2].split(' ');
    return new Date(yr[0], mdy[0]-1, mdy[1]);
}

function parseDateYYYYMMDD(str) {
    var mdy = str.split('-');
    var yr = mdy[2].split(' ');
    return new Date(mdy[0], mdy[1]-1, yr[0]);
}


function daydiff(first, second) {
    return (second-first)/(1000*60*60*24);
}




function validateEmail(){
	 var emailId = $("#email_id").val();
	 emailId = emailId.trim();
	 if(emailId == "")
		 return true;
	 if(!emailValidation(emailId)){
		$("#emailError").html("Invalid Email Id");
		return false;
	 }
	 return true;
}

function deleteItem(element){
	debugger
	var id = $(element).attr("id").replace('Img','');
	  var plucode = $('#pluCode'+id).val();
	
	
//	id=parseInt(id);
	var selected =""
	  var taxeslen = $("#taxationlist tr").length;
		for(var j=0;j<taxeslen;j++){
			var taxidAttr = $("#taxationlist tbody  tr:eq("+j+") td:last").attr("id");
			taxidAttr = taxidAttr.replace('DelTax','');
			var idattr = taxidAttr.replace('Img','');
			var plucodeTax = $('#pluCodeTax'+taxidAttr).val();
			
			if(plucode == plucodeTax)
				{
				selected = selected+taxidAttr+",";
				}
		}
		selected = selected.slice(0,-1);// Remove last comma
		selected.split(',');
		for(var  i=0;i<selected.length;i++)
			{
			var rowCout =selected[i].replace(/\,/g,"");
			$('#taxdynamicdiv'+rowCout).remove();
			}
		
	
		
		var selectedDisc =""
			  var disclen = $("#dicountlist tr").length;
				for(var j=0;j<disclen;j++){
					var discidAttr = $("#dicountlist tbody  tr:eq("+j+") td:last").attr("id");
					discidAttr = discidAttr.replace('DelDisc','');
//					var idattr = discidAttr.replace('Img','');
					var plucodeDisc = $('#pluCodeDisc'+discidAttr).val();
					
					if(plucode == plucodeDisc)
						{
						selectedDisc = selectedDisc+discidAttr+",";
						}
				}
				selectedDisc = selectedDisc.slice(0,-1);// Remove last comma
				selectedDisc.split(',');
				for(var  i=0;i<selectedDisc.length;i++)
					{
					var rowCount =selectedDisc[i].replace(/\,/g,"");
					$('#discdynamicdiv'+rowCount).remove();
					}
			
		
		
		
		$('#dynamicdiv'+id).remove();
		
		
/*	var id = $(element).attr("id");
	$('#dynamicdiv'+id).remove();*/
	var slNo = 1; 
	 $('.slno').each(function(){
		$(this).text(slNo);
		slNo = parseInt(slNo) + 1;
	});
	 
	/* var sNo = 1; 
	 $('.sno').each(function(){
		$(this).text(sNo);
		sNo = parseInt(sNo) + 1;
	});*/
	 changeTotalQuantity();
	 changeTotalCost();
	 changeorderTotal();
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
	// var materialName = $('#searchCriteria').val();
	$("#desc").val(description);
	 var contextPath = $("#contextPath").val();
//	 var storeLocation = $("#outletLocation").val();
	 var storeLocation = $("#outletLocation option:selected").text();
	 var type = $("#outletLocation").val();



               var WarehouseReturnflag=$("#whreturnflag").val();
                if(WarehouseReturnflag == "" || WarehouseReturnflag == undefined || WarehouseReturnflag == null){
                        WarehouseReturnflag="";
                   }

	 if(type == "Warehouse")
		 URL = contextPath + "/inventorymanager/getWarehouseSkuDetails.do";
	 else if(type == "Retail Outlet" || type == "Restaurant")
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

function getPrice(ele){
	var id = $(ele).attr("id");
	id = id.replace('price','');
	$(".modal-backdrop").trigger("click");
	addItem(skuList[id]);
}



var taxationitems =[];
var objTaxes=null;
var sgsttaxItems =[];
var objSgstTax = null;
var objGstTaxes =null;
function addItem(sku){
	debugger;
	 var contextPath = $("#contextPath").val();
	 var len = parseInt($("#productsList tr").length);
		
		 
	 debugger;
	 		if (len != 1)
			len = parseInt($("#productsList tr:last").attr("id").replace('dynamicdiv', '')) + 1;
		for (var i = 1; i <= len; i++) {
			
			
		
		/*var	skuIdsList = [],itemStatusList = [],pluCodesList = [],pricesList = [],qtysList = [],totalCostsList = [];
		skuIdsList.push(sku.skuId);  
		console.log(skuIdsList)*/
			
			if ($("#skuId" + i).val() == sku.skuId && $("#itemPrice"+i).text() == sku.price) {
				var pack =  parseInt($("#orderedQuantity"+i).text())+1;
				debugger;
				//written by manasa
				//purpose:to caluclate taxrates and taxamount
		/*	var cgstTaxRate = parseFloat($("#cgsttax"+i).val());
			var sgstTaxRate = parseFloat($("#sgsttax"+i).val());*/
   			 $("#orderedQuantity"+i).text(pack);
   			 var cost =  parseFloat($("#itemPrice"+i).text());
   			 var plucode =  $("#pluCode"+i).val();
   			 var taxRate = parseFloat($("#tax"+i).text());
   			 var itemWiseDiscount =0.0;
   			itemWiseDiscount = parseFloat($("#itemDiscountPrice"+i).html());
   			 
   			var taxAmtFixed=(taxRate*pack);
   			var taxExclusive = $("#taxExclusive"+i).val();
   			var totalCostValue = cost*pack;
   			 var taxAmt = (pack*cost*taxRate)/100;
   			 
   			if(taxExclusive == 'false' || taxExclusive == 'true')
   				var taxAmt = parseFloat(totalCostValue - (totalCostValue * ( 100 / ( 100 + parseFloat(taxRate))))).toFixed(2);
   				else
   					var taxAmt=(taxRate*pack*cost)/100;	
//   			 $("#taxAmt"+i).text((pack*cost*taxRate)/100);
   			 $("#totalCost"+i).text(pack*cost-parseFloat(itemWiseDiscount));
   			 
   			 
   			 var taxeslen = $("#taxationlist tr").length;
 			for(var j=0;j<taxeslen;j++){
 				var taxidAttr = $("#taxationlist tr:eq("+j+") td:last").attr("id");
// 				alert(j)
 				taxidAttr = taxidAttr.replace('DelTax','');
 				var plucodeTax = $('#pluCodeTax'+taxidAttr).val();
 				var cgstTaxRate = $('#taxTax'+taxidAttr).val();
 				var taxCode = $('#taxTaxcode'+taxidAttr).val();
 				var taxType = $('#taxTaxType'+taxidAttr).val();
 				
 				if(taxExclusive == false || taxExclusive == true){
					if(taxType == 'Percentage')
					$('#taxTaxAmt'+taxidAttr).val(parseFloat((cgstTaxRate*pack*cost)/100).toFixed(2));
					}	
					else
					$('#taxTaxAmt'+taxidAttr).val(parseFloat(taxAmt/2).toFixed(2));
 				

 				
 				
				if(taxType == 'Percentage')
				$('#taxAmt'+i).html(taxAmt);
				else
				$('#taxAmt'+i).html(taxAmtFixed);	
 			}
   			 
   		    /* $("#cgsgstAmt"+i).val((pack*cost*cgstTaxRate)/100);
   		     $("#sgsgstAmt"+i).val((pack*cost*sgstTaxRate)/100);
   		     $("#cgstAmt"+i).val((pack*cost*cgstTaxRate)/100);
   		     $("#sgstAmt"+i).val((pack*cost*cgstTaxRate)/100);*/
   			 changeTotalQuantity();
   			 changeTotalCost();
   			changeorderTotal();
       		 return;
			}
		}
		
		
		
		
		if(sku.zeroStock==false)
        {
        if((sku.quantity) <= 0){        
                $("#Error").html("Item is out of Stock");
                focusDiv('Error');
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
		
		var brand = sku.brand;
		if(brand == null)
			sku.brand = "";
		
		//written by manasa
		//purpose:to caluclate taxrates and taxamount
		
		
		var category = sku.category;
		if(category == null)
			sku.category = "";
		var subCategory = sku.subCategory;
		if(subCategory == null)
			sku.subCategory = "";
		var productRange = sku.productRange;
		if(productRange == null)
			sku.productRange = "";
		var measureRange = sku.measureRange;
		if(measureRange == null)
			sku.measureRange = "";
		var hsnCode = sku.hsnCode;
		if(hsnCode == null)
			sku.hsnCode = "";
		var ean = sku.ean;
		if(ean == null)
			sku.ean = "";
		var utility = sku.utility;
		if(utility == null)
			sku.utility = "";
		var department = sku.department;
		if(department == null)
			sku.department = "";
		var subDepartment = sku.subDepartment;
		if(subDepartment == null)
			sku.subDepartment = "";
		
		var section = sku.section;
		if(section == null)
			sku.section = "";
		
		var tax = sku.tax;
		var taxRate=0.0;
		if(tax!=null)
			if(tax.length>0){
//				var alltaxCode = taxRate[0].taxCode;
				
				if(tax[0].taxType != "Percentage")
			 taxRate=tax[0].taxRate;
				else
			 taxRate=tax[0].taxRate*2;
			}
		
		
		
		
		 var  taxamount=0.0;
		 
		 if(sku.itemTaxExclusive == false || sku.itemTaxExclusive == true){
			 
			 if(tax!=null)
					if(tax.length>0){
						if(tax[0].taxType == "Percentage")
						taxamount = parseFloat(sku.salePrice - (sku.salePrice * ( 100 / ( 100 + parseFloat(taxRate))))).toFixed(2);
//						taxamount = parseFloat(((sku.salePrice)*taxRate)/100).toFixed(2);
						 if(tax[0].taxType == "Fixed")
							 taxamount = tax[0].taxRate;
					}
				}
			 
			/*if(tax!=null)
				if(tax.length>0){
					if(tax[0].taxType == "Percentage")
					taxamount = parseFloat(((sku.salePrice)*taxRate)/100).toFixed(2);
					 if(tax[0].taxType == "Fixed")
						 taxamount = tax[0].taxRate;
				}*/
		 else
			{
			 if(tax!=null)
					if(tax.length>0){
						if(tax[0].taxType == "Percentage")
						taxamount = parseFloat(((sku.salePrice)*taxRate)/100).toFixed(2);
						 if(tax[0].taxType == "Fixed")
							 taxamount = tax[0].taxRate;
					}
			}

				
			 
	
		var slNo = 1; 
		 $('.slno').each(function(){
			$(this).text(slNo);
			slNo = parseInt(slNo) + 1;
		});
		 
		 
		
		 debugger
		 if(tax.length>0){
			 var sNo = 1;
			
		 for (var i=0;i<tax.length;i++) {
			 
			 if(sku.itemTaxExclusive == false || sku.itemTaxExclusive == true){
				 
				 if(tax[i].taxCode == 'CGST'){
						if(tax[i].taxType == 'Percentage')
						var cgstTaxamount = parseFloat(taxamount/2).toFixed(2);
						 else
				          var cgstTaxamount = tax[i].taxRate;		
					}
					else{
						if(tax[i].taxType == 'Percentage')
							var cgstTaxamount = parseFloat(taxamount/2).toFixed(2);
//				           var cgstTaxamount = parseFloat(((sku.salePrice)*tax[i].taxRate)/100).toFixed(2);
						 else
						   var cgstTaxamount = tax[i].taxRate;	
					}
				/*if(tax[i].taxCode == 'CGST'){
					if(tax[i].taxType == 'Percentage')
			           var cgstTaxamount = parseFloat(((sku.salePrice)*tax[i].taxRate)/100).toFixed(2);
					 else
			          var cgstTaxamount = tax[i].taxRate;		
				}
				else{
					if(tax[i].taxType == 'Percentage')
			           var cgstTaxamount = parseFloat(((sku.salePrice)*tax[i].taxRate)/100).toFixed(2);
					 else
					   var cgstTaxamount = tax[i].taxRate;	
				}*/
			 }
			 else
				 {
				 if(tax[i].taxCode == 'CGST'){
						if(tax[i].taxType == 'Percentage')
				           var cgstTaxamount = parseFloat(((sku.salePrice)*tax[i].taxRate)/100).toFixed(2);
						 else
				          var cgstTaxamount = tax[i].taxRate;		
					}
					else{
						if(tax[i].taxType == 'Percentage')
				           var cgstTaxamount = parseFloat(((sku.salePrice)*tax[i].taxRate)/100).toFixed(2);
						 else
						   var cgstTaxamount = tax[i].taxRate;	
					}
				 
				 }
		/*if(tax[i].taxCode == "CGST"){
			var	 cgsttaxRate = tax[i].taxRate;
						cgstTaxamount = parseFloat(((sku.salePrice)*cgsttaxRate)/100).toFixed(2);
						}
					else
						{
						var	 sgsttaxRate = tax[i].taxRate;
								cgstTaxamount = parseFloat(((sku.salePrice)*sgsttaxRate)/100).toFixed(2);
						}*/
			 
//			 var	rowTax="";
//			 var rowDisc ="";
			 
			/* $('.sno').each(function(){
				$(this).text(sNo);
				sNo = parseInt(sNo) + 1;
			});*/
			 var taxLen = parseInt($("#taxationlist tr").length)+1;
			 if (taxLen != 1)
				 taxLen = parseInt($("#taxationlist tr:last").attr("id").replace('taxdynamicdiv', '')) + 1;
			
			var rowTax = "<tr id='taxdynamicdiv"+taxLen+"' style='margin-top:5px;'><td class='sno' id='snoTax"+taxLen+"'>"+
		"<input type='hidden'  id='snoTax"+taxLen+"'/>" +
		"<input type='hidden' id='orderIdTax"+taxLen+"'/>" +
		"<input type='hidden' id='taxTaxcode"+taxLen+"' value='"+tax[i].taxCode+"'/>" +
		"<input type='hidden' id='taxTax"+taxLen+"' value='"+tax[i].taxRate+"'/>" +
		"<input type='hidden' id='skuIdTax"+taxLen+"' value='"+sku.skuId+"'/>"+
		"<input type='hidden' id='pluCodeTax"+taxLen+"' value='"+sku.pluCode+"'/>"+
		"<input type='hidden' id='taxTaxType"+taxLen+"' value='"+tax[i].taxType+"'/>" +
		"<input type='hidden' id='taxTaxCategory"+taxLen+"' value='"+tax[i].taxCategory+"'/>" +
		"<input type='hidden' id='taxTaxAmt"+taxLen+"' value='"+cgstTaxamount+"'/>" +
		"</td>" +
		"<td id='DelTax"+taxLen+"' ><img id='Img"+ taxLen +"' src='"+contextPath+"/images/itemdelete.png' style='width:15%;cursor:pointer;' onclick='deleteItem(this);'/>" +
		  "</td></tr>";
		 $("#taxationlist tbody").append(rowTax);
		 }
		 }	
			
		 
		 
		/* var discLen = parseInt($("#dicountlist tr").length)+1;
		 if (discLen != 1)
			 discLen = parseInt($("#dicountlist tr:last").attr("id").replace('discdynamicdiv', '')) + 1;
		var	 rowDisc	 = "<tr id='discdynamicdiv"+discLen+"' style='margin-top:5px;'><td  id='serialNumDisc"+discLen+"'>"+
	"<input type='hidden' id='serialNumDisc"+discLen+"'>"+
	"<input type='hidden' id='skuIdDisc"+discLen+"' value='"+sku.skuId+"'>"+
	"<input type='hidden' id='pluCodeDisc"+discLen+"' value='"+sku.pluCode+"'/>"+
	"<input type='hidden' id='discountTypeDisc"+discLen+"' />" +
	"<input type='hidden' id='discountIdDisc"+discLen+"' />" +
	"<input type='hidden' id='discountPriceDisc"+discLen+"'/>" +
	"<input type='hidden' id='itemPriceDisc"+discLen+"' value='"+sku.salePrice+"'/>" +
	"</td>" +
	"<td id='DelDisc"+discLen+"' ><img id='Img"+ discLen +"' src='"+contextPath+"/images/itemdelete.png' style='width:15%;cursor:pointer;' onclick='deleteItem(this);'/>" +
	  "</td></tr>";
	 $("#dicountlist tbody").append(rowDisc);
	*/
		 
		 
		 var row = "<tr id='dynamicdiv"+len+"' style='margin-top:5px;'><td class='slno'>"+slNo+"</td>" +
		 	"<td class='itemId' id='itemId"+len+"'>"+sku.skuId+"</td>" +
	 		"<input type='hidden' id='skuId"+len+"' value='"+sku.skuId+"'/>" +
	 		"<input type='hidden' class='pluCode' id='pluCode"+len+"' value='"+sku.pluCode+"'/>" +
	 		 "<input type='hidden' id='discountType"+len+"' />" +
	 		/*"<input type='hidden' id='cgsttax"+len+"' value='"+cgstTaxRate+"'/>" +
	 		"<input type='hidden' id='sgsttax"+len+"' value='"+sgstTaxRate+"'/>" +
	 		  "<input type='hidden' id='taxTaxcode"+i+"' value='"+tax[i].taxCode+"'/>" +
	 		"<input type='hidden' id='taxsgstTaxcode"+len+"' value='"+sgstTaxCode+"'/>" +*/
	 		/*"<input type='hidden' id='igsttax"+len+"' value='0.0'/>" +
	 		"<input type='hidden' id='cgsgstAmt"+len+"' value='"+cgsttaxamount+"'/>" +
	 		"<input type='hidden' id='sgsgstAmt"+len+"' value='"+sgsttaxamount+"'/>" +
	 		"<input type='hidden' id='igstAmt"+len+"' value='0.0'/>" +*/
	 		"<input type='hidden' id='discount"+len+"' value='0.0'/>" +
	 		"<input type='hidden' id='manualDiscount"+len+"' value='0.0'/>" +
	 		/*"<input type='hidden' id='othertaxRate"+len+"' value='0.0'/>" +
	 		"<input type='hidden' id='otherTaxValue"+len+"' value='0.0'/>" +*/
	 		"<input type='hidden' id='taxExclusive"+len+"' value='"+sku.itemTaxExclusive+"'/>" +
			"<input type='hidden' id='productRange"+len+"' value='"+sku.productRange+"'/>" +
			"<input type='hidden' id='measureRange"+len+"' value='"+sku.measureRange+"'/>" +
			"<input type='hidden' id='utility"+len+"' value='"+sku.utility+"'/>" +
			"<input type='hidden' id='trackingRequired"+len+"' value='"+sku.trackingRequired+"'/>"+
	 		"<input type='hidden' id='department"+len+"' value='"+sku.department+"'/>" +
	 		"<input type='hidden' id='subDept"+len+"' value='"+sku.secondaryDepartment+"'/>" +
	 		"<input type='hidden' id='manufacturedItem"+len+"' value='"+sku.manufacturedItem+"'/>" +
	 		"<input type='hidden' id='category"+len+"' value='"+sku.category+"'/>" +
	 		"<input type='hidden' id='subCategory"+len+"' value='"+sku.subCategory+"'/>" +
	 		"<input type='hidden' id='section"+len+"' value='"+sku.section+"'/>" +
	 		"<input type='hidden' id='zeroStock"+len+"' value='"+sku.zeroStock+"'/>" +
	 		"<input type='hidden' id='packed"+len+"' value='"+sku.packed+"'/>" +
	 		"<input type='hidden' id='editable"+len+"' value='"+sku.editable+"'/>" +
	 		"<input type='hidden' id='itemScancode"+len+"' value='"+sku.itemScanCode+"'/>" +
	 		"<input type='hidden' id='itemtaxCode"+len+"' value='"+sku.taxCode+"'/>" +
	 		"<input type='hidden' id='ean"+len+"' value='"+sku.ean+"'/>" +
	 		"<input type='hidden' id='styleRange"+len+"' value='"+sku.styleRange+"'/>" +
	 		"<input type='hidden' id='brand"+len+"' value='"+sku.brandCode+"'/>" +
	 		"<input type='hidden' id='uom"+len+"' value='"+sku.uom+"'/>" +
	 		"<input type='hidden' id='priceVale"+len+"' value='"+sku.price+"'/>" +
	 		"<input type='hidden' id='classProduct"+len+"' value=''/>" +
	 		"<input type='hidden' id='subclassProduct"+len+"' value=''/>" +
	 		"<input type='hidden' id='discountPrice"+len+"' value=''/>" +
	 		/*"<input type='hidden' id='itemtaxCode"+len+"' value='"+sku.taxCode+"'/>" +*/
	 		"<input type='hidden' class='itemStatus' id='itemStatus"+len+"' value=''/>" +
	         	"<td id='itemName"+len+"'><div id='overflowtext'><a href='#' data-toggle='tooltip'  title='"+description+"'>"+description+"</a></div></td>"+

/*	 		"<td id='itemName"+len+"'>"+description+"</td>" +
*/	 		 "<td id='model"+len+"'>"+model+"</td><td id='colour"+len+"'>"+color+"</td>" +
		    "<td id='size"+len+"'>"+size+"</td>"+
		    "<td class='discountIds' style='color:blue' id='discountIds"+len+"'></td>" +
	 		"<td class='price' id='price"+len+"'>"+sku.price+"</td>" +
	 	    "<td  class='Price' id='itemPrice"+len+"' >"+sku.salePrice+"</td>" +
	 	   "<td  class='itemDiscountPrice' id='itemDiscountPrice"+len+"' ></td>" +
		    "<td id='orderedQuantity"+len+"' class='Pack' onkeypress='return (this.innerText.length < 10)'  onchange='PreventEnter(this);' onBlur='changePack(this);'>1</td>" +
		    "<td id='confirmQuantity"+len+"' class='Pack' onkeypress='return (this.innerText.length < 10)' onchange='PreventEnter(this);'  onBlur='changePack(this);' contenteditable='true'>1</td>" +
		    "<td class='cost' id='totalCost"+len+"'>"+sku.price+"</td>" +
		    "<td  id='tax"+len+"' >"+parseFloat(taxRate).toFixed(2)+"</td>" +
		    "<td  id='taxAmt"+len+"' >"+parseFloat(taxamount).toFixed(2)+"</td>" +
		    "<td id='Del"+ len +"' ><img id='Img"+ len +"' src='"+contextPath+"/images/itemdelete.png' style='width:15%;cursor:pointer;' onclick='deleteItem(this);' title='Delete "+sku.skuId+"'/>" +
		    "</td></tr>";
			
	$("#productsList tbody").append(row);
	getApplyCampignDetails(sku.skuId,sku.pluCode,sku.salePrice,"1",len);
	

	
}



var skuList = null;
function appendSkuDetails(skuDetails){
	 var parsedJson = jQuery.parseJSON(skuDetails);  
	 $("#searchItems").val("");
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


function changeTotalQuantity(){
	debugger;
	var totalQty=0;
	var rowCount = $('#productsList tr').length-1;
	for(var i=1;i<rowCount+1;i++){
		 var qty = $("#confirmQuantity"+i).html();
		  	totalQty = parseInt(qty)+totalQty;
	}
	/*$('.Pack').each(function(){
	  var productName = $(this).attr("id").replace('confirmQuantity','');
	  var qty = $("#confirmQuantity"+productName).html();
	  	totalQty = parseInt(qty)+totalQty;
	  	
	 });*/
	
	
	
	if($("#totalQty").length){
		$('#totalQty').val(totalQty);
//		$('')
//		$()
	}
	$("#noOfItems").val(rowCount);
}



function changeorderTotal(countValue)
{
	
	var totaltaxAmount =0.0;
	var dueAmount =0.0;
	debugger;
//	var otherTax = parseFloat($("#otherTaxAmt").val());
	var discount = parseFloat($("#otherDiscount").val()).toFixed(2);
	var grandTotal =parseFloat($("#orderTotalCost").val()).toFixed(2);
	var total = parseFloat(grandTotal).toFixed(2) -parseFloat(discount).toFixed(2); 
//	$('#orderTotalCost').val(parseFloat(total+0.00).toFixed(2));
	
	$('.cost').each(function(){
		debugger;
		  var productName = $(this).attr("id").replace('totalCost','');
			var taxExclusive = $("#taxExclusive"+productName).val();
			var taxAmount =  parseFloat($("#taxAmt"+productName).html()).toFixed(2);
			
			
			if(taxExclusive == 'true' || taxExclusive == 'false'){
				totaltaxAmount =totaltaxAmount+parseFloat(taxAmount);
//				dueAmount = parseFloat(total+totaltaxAmount).toFixed(2);
				dueAmount = parseFloat(total).toFixed(2);
//					parseFloat(total+taxAmount).toFixed(2);
			}
			else
				{
			   dueAmount = parseFloat(total+totaltaxAmount).toFixed(2);
				}
					//written by manasa
		  //purpose:to caluclate total cgst and sgst amounts
//		  var taxvalue =  parseFloat($("#taxAmt"+productName).html());
//		  totaltax = totaltax + parseFloat(taxvalue);
	});
	
//	var taxExclusive = $("#taxExclusive"+countValue).val();

	
	 
	
	$('#dueAmount').val(parseFloat(dueAmount).toFixed(2));
	$('#totalOrderAmt').val(parseFloat(dueAmount).toFixed(2));
	

}


function changeTotalCost(){
	var totalCost=0.0;
	var totalAmt =0.0;
	var tax=0.0;
	debugger;
	 var cgstAmt=0.0;
	 var sgstAmt=0.0;
	 var totaltax = 0.0;
     var totalqty = 0.0;
	 var taxRate=0.0;
	 var totalDiscoiuntPrice=0.0;
	 var rowCount = $('#productsList tr').length-1;
	 var discount = $("#otherDiscount").val();
     var couponDiscount = $("#couponDiscounts").val();
     var grandTotalvalidation =parseFloat($("#orderTotalCost").val()).toFixed(2);

if(grandTotalvalidation < (parseFloat(discount)+parseFloat(couponDiscount))){
	$("#searchItemsErrorIDdiscounts").html("Discounts can't be greater than order total value.");
	
	var otherDiscountval = $("#otherDiscountbackup").val();
	var couponDiscountval = $("#couponDiscountsbackup").val();
	
	$("#otherDiscount").val(otherDiscountval);
	$("#couponDiscounts").val(couponDiscountval);
	
}



	 for(var i=1;i<rowCount+1;i++){
		 
		 var qty = $("#confirmQuantity"+i).html();
		 var salePrice = $("#itemPrice"+i).html();
		 var itemPrice = $("#price"+i).html();
		 cost =parseFloat(salePrice)*parseFloat(qty);
		 totalqty +=parseFloat(qty);
		  totalAmt = totalAmt + parseFloat(cost);
	 }
	 
	 debugger;
	 for(var i=1;i<rowCount+1;i++){
		 var cost = $("#totalCost"+i).html();
		  var qty = $("#confirmQuantity"+i).html();
		  
		  var skuID = $("#itemId"+i).html();
		  var plucode = $("#pluCode"+i).html();
		  var itemPrice = $("#price"+i).html();
		  var salePrice = $("#itemPrice"+i).html();
		
		  cost =parseFloat(salePrice)*parseFloat(qty);
		  
		  totalDiscoiuntPrice = $("#itemDiscountPrice"+i).html();
		  
		
		
		  
		  var percentDis = (discount *100)/totalAmt;
          var percentcouponDis = (couponDiscount *100)/totalAmt;
		  var dis = (parseFloat(cost)*parseFloat(percentDis))/100;
          var coupondis = (parseFloat(cost)*parseFloat(percentcouponDis))/100;
		  $("#itemDiscountPrice"+i).html((dis+coupondis).toFixed(2));
		  $("#totalCost"+i).html(parseFloat(cost-(dis+coupondis)).toFixed(2));
		  $("#itemPricemod"+i).html(parseFloat(parseFloat(cost-(dis+coupondis))/parseFloat(qty)).toFixed(2));
		  
		  cost = $("#totalCost"+i).html();
		  totalCost = totalCost + parseFloat(cost);
			//written by manasa
		  //purpose:to caluclate total cgst and sgst amounts
		  
		  var taxvalue =  parseFloat($("#taxAmt"+i).html());
		  taxRate  =  parseFloat($("#tax"+i).html());
		  totaltax = totaltax + parseFloat(taxvalue);
	 }
	/*$('.cost').each(function(){
	  var productName = $(this).attr("id").replace('totalCost','');
	  var cost = $("#totalCost"+productName).html();
	  var qty = $("#confirmQuantity"+productName).html();
	  
	  var skuID = $("#itemId"+productName).html();
	  var plucode = $("#pluCode"+productName).html();
	  var itemPrice = $("#price"+productName).html();
	  totalDiscoiuntPrice = $("#itemDiscountPrice"+productName).html();
	  
	  totalCost = totalCost + parseFloat(cost);
	  
	  
		//written by manasa
	  //purpose:to caluclate total cgst and sgst amounts
	  
	  var taxvalue =  parseFloat($("#taxAmt"+productName).html());
	  taxRate  =  parseFloat($("#tax"+productName).html());
	  totaltax = totaltax + parseFloat(taxvalue);
	  
	  
	  
		var taxcgst=$("#cgsgstAmt"+productName).val();
		var taxsgst=$("#sgsgstAmt"+productName).val();
		
		
		var taxCsgstValue = (taxcgst*cost*qty)/100;
		var taxSgstValue =  (taxsgst*cost*qty)/100;
		 cgstAmt = cgstAmt + parseFloat(taxcgst);
		 sgstAmt = sgstAmt + parseFloat(taxsgst);
	  
	 });*/
	/* $("#cgstAmt").val(parseFloat(cgstAmt).toFixed(2));
	 $("#sgstAmt").val(parseFloat(sgstAmt).toFixed(2));
	*/
	getShipmentCost();
	var i = 1;
	var totalTax = 0;
	var shipmentCharges = $("#shipmentCharges").val();
	
	
	//commented because by defualt tax is inclusive we should add tax to total tax
//	$("#totalTax").val(parseFloat(totaltax).toFixed(2));
	$("#totalTax").val(totaltax.toFixed(2));
	/*var totalInvoice=0;
	totalInvoice=totalCost;//+parseFloat($("#tax").val())+parseFloat($("#shipmentCharges").val())
	totalInvoice =parseFloat(totalCost)+parseFloat(totaltax);*/
	
//	$("#orderTotalCost").val("");
	
	
	//written by manasa

//var totalDiscounts = totalCost-parseFloat();
//$('#totalDiscoiuntPrice').val(totalDiscoiuntPrice);

/*if($('#totalDiscoiuntPrice').val()!="")
	totalCost = parseFloat(totalCost)-parseFloat(totalDiscoiuntPrice);*/


	
//	var total = $("#totalDiscoiuntPrice").val();
	//if($('#otherDiscount').val()!="")
		//totalCost = totalCost - parseFloat(discount);
	
	
	
	/*var othertax = $("#otherTaxAmt").val();
	if($('#otherTaxAmt').val()!="")
		totalCost = totalCost + parseFloat(othertax);*/
	
	var specialDiscount = $("#special_Discount").val();
	if($('#special_Discount').val()!="")
		totalCost = totalCost - parseFloat(specialDiscount);
	
	
//	getApplyCampignDetails(skuID,plucode,itemPrice);
	
	//comented for taxexclusive
	/*if($('#totaltax').val()!="")
			totalCost = parseFloat(totalCost) + parseFloat(totaltax);*/
	$("#subtotal").val((totalCost-totaltax).toFixed(2));
	$('#orderTotalCost').val(parseFloat(parseFloat(totalCost)+parseFloat(discount)+parseFloat(couponDiscount)).toFixed(2));
	$('#totalOrderAmount').val(parseFloat(totalCost));
	$('#totalQnty').val(totalqty);
	var paidamount = $("#paidAmount").val();
	$('#dueAmount').val(parseFloat(parseFloat(totalCost)-parseFloat(paidamount)).toFixed(2));
	
}


$('#otherDiscount').on('input',function(e){
	debugger
	
	changeTotalCost();
	$('.cost').each(function(){
		
		  var ind = $(this).attr("id").replace('totalCost','');
	      $("#confirmQuantity"+ind).blur();
		
		
		 });
	
 });


$('#otherDiscount').on('blur',function(e){
	$("#searchItemsErrorIDdiscounts").html("");	
	debugger
	if($('#otherDiscount').val() ==""){
	$('#otherDiscount').val("0.0");
	}
	changeTotalCost();
	$('.cost').each(function(){
		
		  var ind = $(this).attr("id").replace('totalCost','');
	      $("#confirmQuantity"+ind).blur();
		
		
		 });
	
 });


$('#couponDiscounts').on('input',function(e){
	debugger

	changeTotalCost();
	
	$('.cost').each(function(){
		
		  var ind = $(this).attr("id").replace('totalCost','');
	      $("#confirmQuantity"+ind).blur();
		
		
		 });
	
 });





$('#couponDiscounts').on('blur',function(e){
	debugger

$("#searchItemsErrorIDdiscounts").html("");	

if($('#couponDiscounts').val() ==""){
	$('#couponDiscounts').val("0.0");
	}
	changeTotalCost();
	
	$('.cost').each(function(){
		
		  var ind = $(this).attr("id").replace('totalCost','');
	      $("#confirmQuantity"+ind).blur();
		
		
		 });
	
 });

/*written by manasa
purpose:to append due amount
created date :08-03-18
*/$('#paidAmount').on('input',function(e){
	debugger
//	changeTotalCost();
	var totalOrderAmt = parseFloat($("#totalOrderAmt").val());
	var amountPaid = parseFloat($("#paidAmount").val());
	var totalCost = parseFloat($("#orderTotalCost").val());
	
	if(amountPaid>totalCost){
	$('#paidAmount').val(parseFloat(totalCost).toFixed(2));
	$('#dueAmount').val(parseFloat(0.0).toFixed(2));
	return;
	}
	var	amountPaidTotal =0.0;
	if($('#paidAmount').val()!="")
//	amountPaidTotal = totalOrderAmt - parseFloat(amountPaid);
	amountPaidTotal =  parseFloat(amountPaid);
	$('#dueAmount').val(parseFloat(totalCost-amountPaidTotal).toFixed(2));
	
	
	
 });


$('#otherTaxAmt').on('input',function(e){
	debugger
	// if($('#shipping_cost').val()!="")
	changeTotalCost();
 });

$('#special_Discount').on('input',function(e){
	debugger
	// if($('#shipping_cost').val()!="")
	changeTotalCost();
 });

function updateTotalCost(){
	
	debugger;
	var totalCost=0.0;
	var tax=0.0;
	var cgstAmt=0.0;
	 var sgstAmt=0.0;
	 var totaltax = 0.0;
	 var taxRate=0.0;
	$('.cost').each(function(){
	  var productName = $(this).attr("id").replace('totalCost','');
	  var cost = $("#totalCost"+productName).html();
	  totalCost = totalCost + parseFloat(cost);
	  
	//written by manasa
	  //purpose:to caluclate total cgst and sgst amounts
	  var taxvalue =  parseFloat($("#taxAmt"+productName).html());
	  taxRate  =  parseFloat($("#tax"+productName).html());
	  totaltax = totaltax + parseFloat(taxvalue);
	  
	  
		var taxcgst=$("#cgsgstAmt"+productName).val();
		var taxsgst=$("#sgsgstAmt"+productName).val();
		
		
		/*var taxCsgstValue = (taxcgst*cost*qty)/100;
		var taxSgstValue =  (taxsgst*cost*qty)/100;*/
		 cgstAmt = cgstAmt + parseFloat(taxcgst);
		 sgstAmt = sgstAmt + parseFloat(taxsgst);
	  
	  
	 });
	var i = 1;
	var totalTax = 0;
	// assuming tax as 10%, formula------
	// subtotal = total*100/(100+tax)
	//	var subtotal = (totalCost*100)/(100+10);
	//	tax = totalCost - subtotal;
	/*$('.taxRate').each(function(){
		  var taxRate = $(this).html();
		  var subtotal = (totalCost*100)/(100+parseInt(taxRate));
		  tax = totalCost - subtotal;
		  tax = tax.toFixed(2);
		  totalTax = totalTax + parseFloat(tax);
		  $("#orderTax"+i).val(tax);
		  i=i+1;
		 });*/
	
	var subTotalAfterDeductions = parseFloat(totalCost)-parseFloat(totaltax);
//	$("#subtotal").val(subTotalAfterDeductions);
	$("#totalTax").val(totaltax.toFixed(2));
//	getShipmentCost();
}
function updateTotalCostOnLoad(){
	
	debugger;
	var totalCost=0.0;
	var tax=0.0;
	var cgstAmt=0.0;
	 var sgstAmt=0.0;
	 var totaltax = 0.0;
	 var taxRate=0.0;
      var totalqty = 0.0;
	$('.cost').each(function(){
	  var productName = $(this).attr("id").replace('totalCost','');
	  var cost = $("#totalCost"+productName).html();
	  totalCost = totalCost + parseFloat(cost);
		 var qty = $("#confirmQuantity"+productName).html();
	      var discount = $("#itemDiscountPrice"+productName).html();
           var itemprice = $("#itemPrice"+productName).html();
	        var modprice = parseFloat(itemprice)-(parseFloat(discount)/parseFloat(qty));
	        $("#itemPricemod"+productName).html(parseFloat(modprice).toFixed(2));
	
		 totalqty +=parseFloat(qty);	  

	  var taxvalue =  parseFloat($("#taxAmt"+productName).html());
	  taxRate  =  parseFloat($("#tax"+productName).html());
	  totaltax = totaltax + parseFloat(taxvalue);
	  
	  
		var taxcgst=$("#cgsgstAmt"+productName).val();
		var taxsgst=$("#sgsgstAmt"+productName).val();
		
		
		
		 cgstAmt = cgstAmt + parseFloat(taxcgst);
		 sgstAmt = sgstAmt + parseFloat(taxsgst);
	  
	  
	 });
	var i = 1;
	var totalTax = 0;
	
	
	var subTotalAfterDeductions = parseFloat(totalCost)-parseFloat(totaltax);
	$("#subtotal").val(subTotalAfterDeductions);
	
	debugger;
	var paidamount = $("#paidAmount").val();
	var totalCost = $("#totalOrderAmount").val();
    $('#dueAmount').val(parseFloat(parseFloat(totalCost)-parseFloat(paidamount)).toFixed(2));
		$('#totalQnty').val(totalqty);
	if(totaltax != 0.0)
	$("#totalTax").val(totaltax.toFixed(2));
	
   

}


$('#shipmentCharges').on('input',function(e){
//	 if($('#shipmentCharges').val()!="")
	debugger;
	    var shipmentCost = $("#shipmentCharges").val();
		var totalCost = $("#subtotal").val();
		 var taxvalue =  parseFloat($("#totalTax").val());
		if($('#shipmentCharges').val()!="")
			{
			totalCost = parseFloat(totalCost) + parseFloat(shipmentCost)+parseFloat(taxvalue);
			$('#orderTotalCost').val(totalCost);
			}
		else
			{
			totalCost = parseFloat(totalCost) +parseFloat(taxvalue);
			$('#orderTotalCost').val(totalCost);
			}
			
		
		
		var amountPaid = $("#paidAmount").val();
		var totalCostAmt = $("#totalOrderAmount").val();
		
		if($('#paidAmount').val()!="")
		var	amountPaidTotal = totalCostAmt - parseFloat(amountPaid);
		
		
		$('#dueAmount').val(parseFloat(amountPaidTotal).toFixed(2));
		
//		 changeTotalCost();
});

/*$('#otherTaxAmt').on('input',function(e){
//	 if($('#shipmentCharges').val()!="")
	    var shipmentCost = $("#otherTaxAmt").val();
		var totalCost = $("#orderTotalCost").val();
		if($('#otherTaxAmt').val()!="")
			totalCost = parseFloat(totalCost) + parseFloat(shipmentCost);
		$('#orderTotalCost').val(totalCost);
//		 changeTotalCost();
});*/
function PreventEnter(element){
	debugger;
	if (event.keyCode === 13) {
		event.preventDefault();
    }
}

function changePack(element){
	debugger
	var id = $(element).attr("id");
	if (isNaN($("#"+id).html()) || $("#"+id).html() == "")
		$('#'+id).html("1");
	var rowNo = id.replace('confirmQuantity','');
	var packVal = parseFloat($('#confirmQuantity'+rowNo).html());
	//$('#orderedQuantity'+rowNo).html(packVal);
	var plucode = $('#pluCode'+rowNo).val();
	var taxExclusive = $("#taxExclusive"+rowNo).val();
	var itemDiscount=0.0;
	itemDiscount = $("#itemDiscountPrice"+rowNo).html();
	if(packVal<=0){
		alert("Quantity should not be empty");
		var priceVal = parseFloat($('#itemPrice'+rowNo).html());
		$('#confirmQuantity'+rowNo).html(1);
		$('#totalCost'+rowNo).html(priceVal-parseFloat(itemDiscount));
	}else{
		
		var priceVal = parseFloat($('#itemPrice'+rowNo).html());
		var priceValmod = parseFloat($('#itemPricemod'+rowNo).html());
		$('#totalCost'+rowNo).html((packVal*priceVal)-parseFloat(itemDiscount));
		var taxRate=$("#tax"+rowNo).html();
		
		
		var alltaxCode = $("#itemtaxCode"+rowNo).val();
		var totalCostValue=priceValmod*packVal;
		/*if(alltaxCode!='CGST' || alltaxCode!='SGST')
			var taxAmt=taxRate;
		else*/
		if(taxExclusive == 'false' || taxExclusive == 'true')
			var taxAmt = totalCostValue - (totalCostValue * ( 100 / ( 100 + parseFloat(taxRate))));
		else
			var taxAmt=(taxRate*priceValmod*packVal)/100;
			
		
		var taxAmtFixed=(taxRate*packVal);
		
		 var taxeslen = $("#taxationlist tr").length;
			for(var j=0;j<taxeslen;j++){
				var taxidAttr = $("#taxationlist tr:eq("+j+") td:last").attr("id");
//				alert(j)
				taxidAttr = taxidAttr.replace('DelTax','');
				var plucodeTax = $('#pluCodeTax'+taxidAttr).val();
				var cgstTaxRate = $('#taxTax'+taxidAttr).val();
				var taxCode = $('#taxTaxcode'+taxidAttr).val();
				var taxType = $('#taxTaxType'+taxidAttr).val();
				var itemwiseTaxAmtForTaxEx = totalCostValue - (totalCostValue * ( 100 / ( 100 + parseFloat(cgstTaxRate))));
				if(plucode == plucodeTax)
					{
					if(taxExclusive == 'false' || taxExclusive == 'true' ){
					if(taxType == 'Percentage')
					$('#taxTaxAmt'+taxidAttr).val(parseFloat(taxAmt/2).toFixed(2));
//					$('#taxTaxAmt'+taxidAttr).val(parseFloat((cgstTaxRate*priceVal*packVal)/100).toFixed(2));
					}	
					else
						$('#taxTaxAmt'+taxidAttr).val(parseFloat((cgstTaxRate*priceVal*packVal)/100).toFixed(2));
					}
				
				if(taxType == 'Percentage')
				$('#taxAmt'+rowNo).html(parseFloat(taxAmt).toFixed(2));
				else
				$('#taxAmt'+rowNo).html(taxAmtFixed);	
				
			}

			
	
	/*	var cgstTaxRate = parseFloat($('#cgsttax'+rowNo).val());
		var sgstTaxRate = parseFloat($('#sgsttax'+rowNo).val());
		
		
		var cgstAmt = parseFloat((cgstTaxRate*priceVal*packVal)/100).toFixed(2);
		var sgstAmt = parseFloat((sgstTaxRate*priceVal*packVal)/100).toFixed(2);
		var taxAmt=(taxRate*priceVal*packVal)/100;
		 
		$('#cgsgstAmt'+rowNo).val(cgstAmt);
		$('#sgsgstAmt'+rowNo).val(sgstAmt);*/
		
		/*var taxRate=$("#tax"+rowNo).html();
		var taxcgst=$("#cgsttax"+rowNo).val();
		var taxsgst=$("#sgsttax"+rowNo).val();
		var taxCsgstValue = (taxcgst*priceVal*packVal)/100;
		var taxSgstValue =  (taxsgst*priceVal*packVal)/100;
		var taxAmt=(taxRate*priceVal*packVal)/100;
		$('#cgsgstAmt'+rowNo).html(taxCsgstValue);
		$('#sgsgstAmt'+rowNo).html(taxSgstValue);
		$('#taxAmt'+rowNo).html(taxAmt);*/
		changeTotalQuantity();
		changeTotalCost();
		changeorderTotal();
	}
}

function changeSaleprice(element){
	debugger
	var id = $(element).attr("id");
	if (isNaN($("#"+id).html()) || $("#"+id).html() == "")
		$('#'+id).html("1");
	var rowNo = id.replace('itemPrice','');
	var packVal = parseFloat($('#confirmQuantity'+rowNo).html());
	var plucode = $('#pluCode'+rowNo).val();
	var taxExclusive = $("#taxExclusive"+rowNo).val();
	var itemDiscount=0.0;
	itemDiscount = $("#itemDiscountPrice"+rowNo).html();
	if(packVal<=0){
		alert("Quantity should not be empty");
		var priceVal = parseFloat($('#itemPrice'+rowNo).html());
		$('#confirmQuantity'+rowNo).html(1);
		$('#totalCost'+rowNo).html(priceVal-parseFloat(itemDiscount));
	}else{
		
		var priceVal = parseFloat($('#itemPrice'+rowNo).html());
		$('#totalCost'+rowNo).html((packVal*priceVal)-parseFloat(itemDiscount));
		var taxRate=$("#tax"+rowNo).html();
		
		
		var alltaxCode = $("#itemtaxCode"+rowNo).val();
		var totalCostValue=priceVal*packVal;
		if(taxExclusive == 'false' || taxExclusive == 'true')
			var taxAmt = totalCostValue - (totalCostValue * ( 100 / ( 100 + parseFloat(taxRate))));
		else
			var taxAmt=(taxRate*priceVal*packVal)/100;
			
		
		var taxAmtFixed=(taxRate*packVal);
		
		 var taxeslen = $("#taxationlist tr").length;
			for(var j=0;j<taxeslen;j++){
				var taxidAttr = $("#taxationlist tr:eq("+j+") td:last").attr("id");

				taxidAttr = taxidAttr.replace('DelTax','');
				var plucodeTax = $('#pluCodeTax'+taxidAttr).val();
				var cgstTaxRate = $('#taxTax'+taxidAttr).val();
				var taxCode = $('#taxTaxcode'+taxidAttr).val();
				var taxType = $('#taxTaxType'+taxidAttr).val();
				var itemwiseTaxAmtForTaxEx = totalCostValue - (totalCostValue * ( 100 / ( 100 + parseFloat(cgstTaxRate))));
				if(plucode == plucodeTax)
					{
					if(taxExclusive == 'false' || taxExclusive == 'true' ){
					if(taxType == 'Percentage')
					$('#taxTaxAmt'+taxidAttr).val(parseFloat(taxAmt/2).toFixed(2));
					}	
					else
						$('#taxTaxAmt'+taxidAttr).val(parseFloat((cgstTaxRate*priceVal*packVal)/100).toFixed(2));
					}
				
				if(taxType == 'Percentage')
				$('#taxAmt'+rowNo).html(parseFloat(taxAmt).toFixed(2));
				else
				$('#taxAmt'+rowNo).html(taxAmtFixed);	
				
			}
		changeTotalQuantity();
		changeTotalCost();
		changeorderTotal();
	}
}

function changeCostprice(element){
	debugger
	var id = $(element).attr("id");
	if (isNaN($("#"+id).html()) || $("#"+id).html() == "")
		$('#'+id).html("1");
	var rowNo = id.replace('totalCost','');
	//modification
	var quantityReq=parseFloat($('#totalCost'+rowNo).html())/parseFloat($('#itemPrice'+rowNo).html());
	
	var packVal = parseFloat(quantityReq.toFixed(3));
	$('#confirmQuantity'+rowNo).html(packVal)
	var plucode = $('#pluCode'+rowNo).val();
	var taxExclusive = $("#taxExclusive"+rowNo).val();
	var itemDiscount=0.0;
	itemDiscount = $("#itemDiscountPrice"+rowNo).html();
	if(packVal<0){
		alert("Quantity should not be empty");
		var priceVal = parseFloat($('#itemPrice'+rowNo).html());
		$('#confirmQuantity'+rowNo).html(1);
		$('#totalCost'+rowNo).html(priceVal-parseFloat(itemDiscount));
	}else{
		
		var priceVal = parseFloat($('#itemPrice'+rowNo).html());
		$('#totalCost'+rowNo).html((packVal*priceVal)-parseFloat(itemDiscount));
		var taxRate=$("#tax"+rowNo).html();
		
		
		var alltaxCode = $("#itemtaxCode"+rowNo).val();
		var totalCostValue=priceVal*packVal;
		if(taxExclusive == 'false' || taxExclusive == 'true')
			var taxAmt = totalCostValue - (totalCostValue * ( 100 / ( 100 + parseFloat(taxRate))));
		else
			var taxAmt=(taxRate*priceVal*packVal)/100;
			
		
		var taxAmtFixed=(taxRate*packVal);
		
		 var taxeslen = $("#taxationlist tr").length;
			for(var j=0;j<taxeslen;j++){
				var taxidAttr = $("#taxationlist tr:eq("+j+") td:last").attr("id");

				taxidAttr = taxidAttr.replace('DelTax','');
				var plucodeTax = $('#pluCodeTax'+taxidAttr).val();
				var cgstTaxRate = $('#taxTax'+taxidAttr).val();
				var taxCode = $('#taxTaxcode'+taxidAttr).val();
				var taxType = $('#taxTaxType'+taxidAttr).val();
				var itemwiseTaxAmtForTaxEx = totalCostValue - (totalCostValue * ( 100 / ( 100 + parseFloat(cgstTaxRate))));
				if(plucode == plucodeTax)
					{
					if(taxExclusive == 'false' || taxExclusive == 'true' ){
					if(taxType == 'Percentage')
					$('#taxTaxAmt'+taxidAttr).val(parseFloat(taxAmt/2).toFixed(2));
					}	
					else
						$('#taxTaxAmt'+taxidAttr).val(parseFloat((cgstTaxRate*priceVal*packVal)/100).toFixed(2));
					}
				
				if(taxType == 'Percentage')
				$('#taxAmt'+rowNo).html(parseFloat(taxAmt).toFixed(2));
				else
				$('#taxAmt'+rowNo).html(taxAmtFixed);	
				
			}
		changeTotalQuantity();
		changeTotalCost();
		changeorderTotal();
	}
}


function searchProducts(name,searchCategory){
	debugger;
	 //purpose:for checking internet conection
	var online = window.navigator.onLine;
  	if(!online)
  	{
  	alert("check your internet connection,please try agian after some time");
  	return;
  	}
	 var contextPath = $("#contextPath").val();
	 var storeLocation = $("#outletLocation option:selected").text();
	 var type = $("#outletLocation").val();
	 if(type == "Warehouse")
		 URL = contextPath + "/inventorymanager/searchWarehouseProducts.do";
	 else if(type == "Retail Outlet" || type == "Restaurant")
		 URL = contextPath + "/inventorymanager/searchProducts.do";
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

function getId(element,type){
	var description = null;
	var id= $(element).attr("id");
	//$(".popup-display").css("display","none");
	//alert($("#"+id).children("a").text());
	description =  $("#"+id).children("a").text();
	description = description.split(' ( ');
	description = description[0];
	$("#desc").val(description);
	if(type == "receipt")
		getSkuDetails(id,description);
	else
		addProductToColumn(id);
/*	else if(type == "receipt")
		getSkuDetails(id);*/
	 $(".services").hide();
	 $("."+type).html("");
}

function appendProducts(productsList,searchCategory){
	debugger;
	/* $("#skuList").html('');
	 var op = '';
	 for(var i=0;i<productsList.length;i++){
		 op += '<option value="'+productsList[i].skuID+'">'+productsList[i].description+'</option>';
	 }
	 $("#skuList").html(op);
	 $("#skuList").show();*/
	/*<a data-toggle="modal" data-target="#items-modal">*/
		 $("."+searchCategory).html('');
  		 var op = '';
  		 for(var i=0;i<productsList.length;i++){
  			
  			 if(productsList[i].color==null)
				 productsList[i].color="";	 
			if(productsList[i].size==null)
				 productsList[i].size="";
  			 
  			if(productsList[i].price==null || productsList[i].price=="" || productsList[i].price==undefined)
				productsList[i].price=0;
			if(productsList[i].category==null)
				productsList[i].category="";
				
			if(productsList[i].quantityInHand=="" || productsList[i].quantityInHand==undefined || productsList[i].quantityInHand== null)
				productsList[i].quantityInHand=0;
			if(productsList[i].reorderPoint=="" || productsList[i].reorderPoint==undefined || productsList[i].reorderPoint== null)
				productsList[i].reorderPoint=0;
			
			
			if(productsList[i].mrp=="" || productsList[i].mrp==undefined || productsList[i].mrp== null)
				productsList[i].mrp=0;
  			 
  			 
  			 
  			 if(productsList[i].skuID == productsList[i].description){
  				 if (i == 0) {
  					 op += '<li id="'+productsList[i].pluCode+'"  class="selected" onclick=getIdNewOrder(this,"'+searchCategory+'"); ><a><label style="width: 5%;">'+productsList[i].skuID+'</label> &nbsp &nbsp &nbsp &nbsp   <label style="width: 30%;">'+productsList[i].productName+' </label> &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp   <label style="width: 5%;">  '+productsList[i].quantityInHand+'</label> &nbsp &nbsp &nbsp &nbsp   <label style="width: 5%;">'+productsList[i].mrp+' </label> &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp   <label style="width: 5%;">  '+productsList[i].price+'</label>&nbsp &nbsp &nbsp &nbsp  <label style="width: 5%;"> '+productsList[i].reorderPoint+'</label> &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp   <label style="width: 5%;"> '+productsList[i].color+'</label>  &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp     '+productsList[i].size+'</a></li>';
  				}else
  					 op += '<li id="'+productsList[i].pluCode+'"   onclick=getIdNewOrder(this,"'+searchCategory+'"); ><a><label style="width: 5%;">'+productsList[i].skuID+'</label> &nbsp &nbsp &nbsp &nbsp   <label style="width: 30%;">'+productsList[i].productName+' </label> &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp   <label style="width: 5%;">  '+productsList[i].quantityInHand+'</label> &nbsp &nbsp &nbsp &nbsp   <label style="width: 5%;">'+productsList[i].mrp+' </label> &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp   <label style="width: 5%;">  '+productsList[i].price+'</label>&nbsp &nbsp &nbsp &nbsp  <label style="width: 5%;"> '+productsList[i].reorderPoint+'</label> &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp   <label style="width: 5%;"> '+productsList[i].color+'</label>  &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp     '+productsList[i].size+'</a></li>';
  		 	}
  			 else{
  				 if (i == 0) {
  					 op += '<li id="'+productsList[i].pluCode+'"  class="selected" onclick=getIdNewOrder(this,"'+searchCategory+'"); ><a><label style="width: 5%;">'+productsList[i].skuID+'</label> &nbsp &nbsp &nbsp &nbsp   <label style="width: 30%;">'+productsList[i].productName+' </label> &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp   <label style="width: 5%;">  '+productsList[i].quantityInHand+'</label> &nbsp &nbsp &nbsp &nbsp   <label style="width: 5%;">'+productsList[i].mrp+' </label> &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp   <label style="width: 5%;">  '+productsList[i].price+'</label>&nbsp &nbsp &nbsp &nbsp  <label style="width: 5%;"> '+productsList[i].reorderPoint+'</label> &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp   <label style="width: 5%;"> '+productsList[i].color+'</label>  &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp     '+productsList[i].size+'</a></li>';
  				}else
  					 op += '<li id="'+productsList[i].pluCode+'"   onclick=getIdNewOrder(this,"'+searchCategory+'"); ><a><label style="width: 5%;">'+productsList[i].skuID+'</label> &nbsp &nbsp &nbsp &nbsp   <label style="width: 30%;">'+productsList[i].productName+' </label> &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp   <label style="width: 5%;">  '+productsList[i].quantityInHand+'</label> &nbsp &nbsp &nbsp &nbsp   <label style="width: 5%;">'+productsList[i].mrp+' </label> &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp   <label style="width: 5%;">  '+productsList[i].price+'</label>&nbsp &nbsp &nbsp &nbsp  <label style="width: 5%;"> '+productsList[i].reorderPoint+'</label> &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp   <label style="width: 5%;"> '+productsList[i].color+'</label>  &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp     '+productsList[i].size+'</a></li>';
  			 }
  		 }
  		 $("."+searchCategory).html(op);
  		 $("."+searchCategory).show();
}

function appendDataToOutlet(productsList,searchCategory){

	debugger;
	/* $("#skuList").html('');
	 var op = '';
	 for(var i=0;i<productsList.length;i++){
		 op += '<option value="'+productsList[i].skuID+'">'+productsList[i].description+'</option>';
	 }
	 $("#skuList").html(op);
	 $("#skuList").show();*/
	/*<a data-toggle="modal" data-target="#items-modal">*/
		 $("."+searchCategory).html('');
  		 var op = '';
  		 for(var i=0;i<productsList.length;i++){
  			
  			 if(productsList[i].color==null)
				 productsList[i].color="";	 
			if(productsList[i].size==null)
				 productsList[i].size="";
  			 
  			if(productsList[i].price==null || productsList[i].price=="" || productsList[i].price==undefined)
				productsList[i].price=0;
			if(productsList[i].category==null)
				productsList[i].category="";
				
			if(productsList[i].quantityInHand=="" || productsList[i].quantityInHand==undefined || productsList[i].quantityInHand== null)
				productsList[i].quantityInHand=0;
			if(productsList[i].reorderPoint=="" || productsList[i].reorderPoint==undefined || productsList[i].reorderPoint== null)
				productsList[i].reorderPoint=0;
			
			
			if(productsList[i].mrp=="" || productsList[i].mrp==undefined || productsList[i].mrp== null)
				productsList[i].mrp=0;
  			 
  			 
  			 
  			 if(productsList[i].skuID == productsList[i].description){
  				 if (i == 0) {
  					 op += '<li id="'+productsList[i].skuID+'"  class="selected" onclick=getIdNewOrder(this,"'+searchCategory+'"); ><a><label style="width: 10%;">'+productsList[i].skuID+'</label> &nbsp &nbsp &nbsp &nbsp   <label style="width: 20%;">'+productsList[i].productName+' </label> &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp   <label style="width: 5%;">  '+productsList[i].quantityInHand+'</label> &nbsp &nbsp &nbsp &nbsp   <label style="width: 5%;">'+productsList[i].mrp+' </label> &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp   <label style="width: 5%;">  '+productsList[i].price+'</label>&nbsp &nbsp &nbsp &nbsp  <label style="width: 5%;"> '+productsList[i].reorderPoint+'</label> &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp   <label style="width: 5%;"> '+productsList[i].color+'</label>  &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp     '+productsList[i].size+'</a></li>';
  				}else
  					 op += '<li id="'+productsList[i].skuID+'"   onclick=getIdNewOrder(this,"'+searchCategory+'"); ><a><label style="width: 5%;">'+productsList[i].skuID+'</label> &nbsp &nbsp &nbsp &nbsp   <label style="width: 30%;">'+productsList[i].productName+' </label> &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp   <label style="width: 5%;">  '+productsList[i].quantityInHand+'</label> &nbsp &nbsp &nbsp &nbsp   <label style="width: 5%;">'+productsList[i].mrp+' </label> &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp   <label style="width: 5%;">  '+productsList[i].price+'</label>&nbsp &nbsp &nbsp &nbsp  <label style="width: 5%;"> '+productsList[i].reorderPoint+'</label> &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp   <label style="width: 5%;"> '+productsList[i].color+'</label>  &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp     '+productsList[i].size+'</a></li>';
  		 	}
  			 else{
  				 if (i == 0) {
  					 op += '<li id="'+productsList[i].skuID+'"  class="selected" onclick=getIdNewOrder(this,"'+searchCategory+'"); ><a><label style="width: 5%;">'+productsList[i].skuID+'</label> &nbsp &nbsp &nbsp &nbsp   <label style="width: 30%;">'+productsList[i].productName+' </label> &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp   <label style="width: 5%;">  '+productsList[i].quantityInHand+'</label> &nbsp &nbsp &nbsp &nbsp   <label style="width: 5%;">'+productsList[i].mrp+' </label> &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp   <label style="width: 5%;">  '+productsList[i].price+'</label>&nbsp &nbsp &nbsp &nbsp  <label style="width: 5%;"> '+productsList[i].reorderPoint+'</label> &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp   <label style="width: 5%;"> '+productsList[i].color+'</label>  &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp     '+productsList[i].size+'</a></li>';
  				}else
  					 op += '<li id="'+productsList[i].skuID+'"   onclick=getIdNewOrder(this,"'+searchCategory+'"); ><a><label style="width: 5%;">'+productsList[i].skuID+'</label> &nbsp &nbsp &nbsp &nbsp   <label style="width: 30%;">'+productsList[i].productName+' </label> &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp   <label style="width: 5%;">  '+productsList[i].quantityInHand+'</label> &nbsp &nbsp &nbsp &nbsp   <label style="width: 5%;">'+productsList[i].mrp+' </label> &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp   <label style="width: 5%;">  '+productsList[i].price+'</label>&nbsp &nbsp &nbsp &nbsp  <label style="width: 5%;"> '+productsList[i].reorderPoint+'</label> &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp   <label style="width: 5%;"> '+productsList[i].color+'</label>  &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp     '+productsList[i].size+'</a></li>';
  			 }
  		 }
  		 $("."+searchCategory).html(op);
  		 $("."+searchCategory).show();

}
function editOrder(flowName){
	 //purpose:for checking internet conection
	var online = window.navigator.onLine;
  	if(!online)
  	{
  	alert("check your internet connection,please try agian after some time");
  	return;
  	}
	var orderId = $("#orderId").val();
	 /* var len = $("#productsList tr").length-1;
	  var itemDetails = [];
		for(var i=1;i<=len;i++){
			var obj = {skuId:$("#skuId"+i).val(),pluCode:$("#pluCode"+i).val(),item_id:$("#itemId"+i).text(),item_name:$("#itemName"+i).text(),item_price:$("#itemPrice"+i).text(),ordered_quantity:$("#orderedQuantity"+i).text(),total_cost:$("#totalCost"+i).text(),make:$("#make"+i).text(),model:$("#model"+i).text(),colour:$("#colour"+i).text(),size:$("#size"+i).text()};
			itemDetails.push(obj);
		}
		var items = JSON.stringify(itemDetails);
		$("#itemDetails").val(items);
		var formData  = JSON.stringify($('form').serializeObject());*/
		var flowUnder = $("#flowUnder").val();
		var contextPath = $("#contextPath").val();
		var status = $("#selectedStatus").val();
		var location = "";
		if($("#location").length > 0)
			location = $("#location").val();
//		if(flowName == 'outlet')
			URL = contextPath + "/inventorymanager/editOrder.do";
		/*else
			URL = contextPath + "/inventorymanager/editWarehouseOrder.do";*/
	  	 	 $.ajax({
	 			type: "POST",
	 			url : URL,
//	 			contentType: "application/json",
	 			data : {
	 				orderId : orderId,
	 				flowUnder : flowUnder,
	 				status : status
	 			},
	 			beforeSend: function(xhr){                    
 	   	   			$("#loading").css("display","block");
 	   	   			$("#mainDiv").addClass("disabled");
 	   	   		  },
	 			success : function(result){
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
	  
$("#billingMobileNo").on('input',function(e){
	 $("#error2").html("");
	$("#Error").html("");
	$(".Error").html("");
});

$("#billingMobileNo").blur(function(){
	debugger
	var phoneNumber4 = $("#billingMobileNo").val().trim();
	
	if(phoneNumber4 != ""){
		validatePhoneNumber2() ;
	}
});

  
function validatePhoneNumber2(){
	 phoneNumberParser4();
	 var output = $("#output4").val();
	 if(output.indexOf(":")<0){
		 $("#error2").html(output);
		 return false;
	 }
	 var result = output.split(",");
	 for(var i=0;i<result.length; i++){
		 var val=result[i].split(":");
		 if(val[1] != "true"){
			 $("#error2").html("Invalid Phone Number");
			 return false;
		 }
	 }
	 return true;
}	



$("#customerContactNum").on('input',function(e){
	 $("#error3").html("");
	$("#Error").html("");
	$(".Error").html("");
});

$("#customerContactNum").blur(function(){
	debugger
	var phoneNumber5 = $("#customerContactNum").val().trim();
	
	if(phoneNumber5 != ""){
		validatePhoneNumber5();
	}
});

  
function validatePhoneNumber5(){
	 phoneNumberParser5();
	 var output = $("#output5").val();
	 if(output.indexOf(":")<0){
		 $("#error3").html(output);
		 return false;
	 }
	 var result = output.split(",");
	 for(var i=0;i<result.length; i++){
		 var val=result[i].split(":");
		 if(val[1] != "true"){
			 $("#error3").html("Invalid Phone Number");
			 return false;
		 }
	 }
	 return true;
}	

function tConv24(time24) {
	  var ts = time24;
	  var H = +ts.substr(0, 2);
	  var h = (H % 12) || 12;
	  h = (h < 10)?("0"+h):h;  // leading 0 at the left for 1 digit hours
	  var ampm = H < 12 ? " AM" : " PM";
	  ts = h + ts.substr(2, 3) + ampm;
	  return ts;
	};

 function updateOrder(operation,type,flowName){
	 //purpose:for checking internet conection
	 debugger;
		var online = window.navigator.onLine;
	  	if(!online)
	  	{
	  	alert("check your internet connection,please try agian after some time");
	  	return;
	  	}
	 var re = /^[0-9/]+$/;
	
	 if($("#orderDate").val().trim() == ""){
			$("#orderDateError").html("Enter a Date");
			 $("#orderDate").focus();
			return;
	 }
	/* if(!re.test($("#orderDate").val())){
			$("#orderDateError").html("Invalid Date");
			 $("#orderDate").focus();
			return;
	 }*/
	 if($("#deliveryDate").val().trim() == ""){
			$("#deliveryDateError").html("Enter a Date");
			 $("#deliveryDate").focus();
			return;
	 }
	
	 if(!re.test($("#deliveryDate").val())){
			$("#deliveryDateError").html("Invalid Date");
			return;
	 }
	 var noOfDays = daydiff(parseDate($('#orderDate').val()), parseDate($('#deliveryDate').val()));
	 if(noOfDays < 0){
		 $("#deliveryDateError").html("Delivery Date can't be less than Order Date");
		 return;
	 }
	 
	 if(operation!="Cancelled")
	 {
	 if(type != "new"){
		 
		 if($("#confirmDate").val().trim() == ""){
				$("#confirmDateError").html("Enter a Confirm Date");
				 $("#confirmDate").focus();
				return;
		 }
		 
		 var noOfdays = daydiff(parseDate($('#deliveryDate').val()), parseDate($('#confirmDate').val()));
		 if(noOfdays < 0){
			 $("#confirmDateError").html("Confirm Date can't be less than Delivery Date");
			 return;
		 }
		 var delStartTime = $("#del_starttime").val();
		 var confirmStartTime = $("#confirmedSlotEndTime").val();
			if (confirmStartTime == null || confirmStartTime == undefined){
			 confirmStartTime = "";
		 }

		 var deliveryDate = $("#deliveryDate").val();
		 var confirmDate = $("#confirmDate").val();
		 if(deliveryDate == confirmDate){
			 
			 var d = new Date(),
	    	    h = (d.getHours()<10?'0':'') + d.getHours(),
	    	    m = (d.getMinutes()<10?'0':'') + d.getMinutes();
	    	 var starttime= h + ':' + m;
	    	 starttime=tConv24(starttime);
			 
			 var start_time = starttime;
			    var end_time = confirmStartTime;
			    if (start_time != '' && end_time != ''){ 
			    start_time = start_time.split(" ");
			    var time = start_time[0].split(":");
			    var stime = time[0];
			    if(start_time[1] == "PM" && stime<12) stime = parseInt(stime) + 12;{
			    	if(stime.length==1)
			    		stime ="0"+stime;
			    	start_time = stime + ":" + time[1] + ":00";
			    }
			    	
			    	

			    end_time = end_time.split(" ");
			    var time1 = end_time[0].split(":");
			    var etime = time1[0];
			    if(end_time[1] == "PM" && etime<12) etime = parseInt(etime) + 12;{
			    	if(etime.length==1)
			    		etime ="0"+etime;
			    }
			    end_time = etime + ":" + time1[1] + ":00";

			    if (start_time != '' && end_time != ''&& delStartTime != '' ) { 
			       
			        if (end_time < start_time) {
			        	 $("#confirmStartTimeError").html("Confirm  Time can't be less than Current Time");
						 return;
			        }
			    }
			    }else{
			    	debugger;
			    	 var d = new Date(),
			    	    h = (d.getHours()<10?'0':'') + d.getHours(),
			    	    m = (d.getMinutes()<10?'0':'') + d.getMinutes();
			    	 var start_time= h + ':' + m;
			    	 start_time=tConv24(start_time);
					 var end_time = $("#confirmedSlotEndTime").val();
						if (end_time == null || end_time == undefined){
						 end_time = "";
							 }

			    	  
					 //time validation;
					 
					    start_time = start_time.split(" ");
					    var time = start_time[0].split(":");
					    var stime = time[0];
					    if(start_time[1] == "PM" && stime<12) stime = parseInt(stime) + 12;{
					    	if(stime.length==1)
					    		stime ="0"+stime;
					    	start_time = stime + ":" + time[1] + ":00";
					    }
					    
					    end_time = end_time.split(" ");
					    var time1 = end_time[0].split(":");
					    var etime = time1[0];
					    if(end_time[1] == "PM" && etime<12) etime = parseInt(etime) + 12;{
					    	if(etime.length==1)
					    		etime ="0"+etime;
					    }
					    end_time = etime + ":" + time1[1] + ":00";

					    if (start_time != '' && end_time != '') { 
					       
					        if (end_time < start_time) {
					        	 $("#confirmStartTimeError").html("Please select valid time slot.");
								 return;
					        }
					    }		
			    }
		 }
	 }
	 
 }
	 if($("#error").text() != ""){
		 $("#phoneNumber").focus();
		 return false;
	 }
	 
//	  if(operation != "Draft" && operation != "draft"){
	 if($("#phoneNumber").val() == ""){
    	 $("#phoneNumberError").html("Mobile Number Required"); 	 
		 $("#phoneNumber").focus();
		 return false;
	 }
//	  }
	  
//	 var tax = $("#totalTax").val();
	 
//	  if(operation != "Draft" && operation != "draft"){
	 if($("#phoneNumber1").val() == ""){
    	 $("#phoneNumber1Error").html("Enter Phone Number"); 	 
		 $("#phoneNumber1").focus();
		 return false;
	 }
//	 }
	 debugger
	 var selectedEmployeeName = $("#salesexecutivename option:selected").text();
	 $("#salesmanName").val(selectedEmployeeName);
	 
	  	var orderShipmentType = $("#orderDeliveryType").val();
	  	var orderShipmentCharges = parseFloat($("#orderTotalCost").val());
	 var shipmentError = $("#ErrorForShipment").html();
	 
	/*if(type == "new"){
	 if(orderShipmentType == "Door Delivery" && orderShipmentCharges!=0)
		 {
		 $("#ErrorForShipment").html("");
			focusDiv('ErrorForShipment');
		var shipmentResult =  getShipmentCost();
		$("#loading").css("display","none");
		$("#mainDiv").removeClass('disabled');
		  return false ;
		 }
	}
	else
		{*/
		if(orderShipmentType == "Door Delivery" && orderShipmentCharges!=0)
		 {
			var errorShipment = $("#ErrorForShipment").html().trim();
		if(errorShipment != ""){
			focusDiv('ErrorForShipment');
			return false;
		}
	/*	var shipmentResult =  getShipmentCost();
		var shipmentError = $("#ErrorForShipment").html();
		var returnStatus = $("#returnStatus").val();
		
		$("#loading").css("display","none");
		$("#mainDiv").removeClass('disabled');
		if(returnStatus == "false"){
			focusDiv('ErrorForShipment');
			  return  ;*/
		}
//		 }
//		}
 
	  
//	  if(operation != "Draft" && operation != "draft"){
	 var mobileNumber = validateMobileNumberForOrders();
	 	 if(mobileNumber == false){
	 		$("#phoneNumber").focus();
	 		$("#phoneNumberError").html("Enter 10 digits Mobile Number"); 
	 		return;
	 	 }
//	  }
	 	   
	 	/*if($("#custpin").val() == ""){
	    	 $("#custpinError").html("Enter PIN Number"); 	 
			 $("#custpin").focus();
			 return false;
		 }
	 	
	 	 
	 	if($("#billpinNum").val() == ""){
	    	 $("#billpinNumError").html("Enter PIN Number"); 	 
			 $("#billpinNum").focus();
			 return false;
		 }*/
	 	 
	 	
//	 	 if(operation != "Draft" && operation != "draft"){
	 	 var personalmobileNumber = validatePersonalMobileNumber();
  	 	 if(personalmobileNumber == false){
  	 		$("#phoneNumber1").focus();
  	 		$("#phoneNumber1Error").html("Enter 10 digits Mobile Number"); 
  	 		return;
  	 	 }
//	 	  }
	 	 
	 var defaultCountry = $("#defaultCountry").val().trim();
	 var phoneNumber = $("#phoneNumber").val().trim();
	 if(defaultCountry != "" && phoneNumber != ""){
		 $("#mobile_num_code").val($("#defaultCountry option:selected").attr("text"));
		 $("#mobile_num").val(phoneNumber);
	 }
	
	
	 
	/* var defaultCountry2 = $("#defaultCountry2").val().trim();
	 var phoneNumber2 = $("#billingMobileNo").val().trim();
	 if(defaultCountry2 != "" && phoneNumber2 != ""){
		 $("#billphoneNumberCode").val($("#defaultCountry2 option:selected").attr("text"));
		 $("#billingMobileNo").val(phoneNumber2);
	 }
	 
	 var defaultCountry3 = $("#defaultCountry3").val().trim();
	 var phoneNumber3 = $("#customerContactNum").val().trim();
	 if(defaultCountry3 != "" && phoneNumber3 != ""){
		 $("#custphoneNumberCode").val($("#defaultCountry3 option:selected").attr("text"));
		 $("#customerContactNum").val(phoneNumber1);
	 }
*/	 
	 var maxRecords = 10;
 	  if($("#maxRecords").length>0)
 		  maxRecords = $("#maxRecords").val();
	 
	  var len = $("#productsList tr").length-1;
	  var itemDetails = [];
	  var transactionDetails = [];
	  var taxationDetails  = [];
	  var discDetails = [];

	  var email = $("#email_id").val();
	  if(operation != "Draft" && operation != "draft"){
		  if(email!="" && email!=null && email!=undefined && !emailValidation(email)){
			  $("#emailError").html("Invalid Email Id");
			  $("#email_id").focus();
			  return false;
		  }
		  
		  
		  
		  
		  var mobileNo = $("#mobile_num").val();
		  if(mobileNo.trim() == ""){
			  $("#error").html("Mobile Number required");
			  $("#phoneNumber").focus();
			  return false;
		  }
		  if($("#custDno").val().trim() == ""){
			  $("#custDnoError").html("Door No. is required");
			  $("#custDno").focus();
			  return false;
		  }
		  if($("#custStreet").val().trim() == ""){
			  $("#custStreetError").html("Street is required");
			  $("#custStreet").focus();
			  return false;
		  }
		  if($("#custLoc").val().trim() == ""){
			  $("#custLocError").html("Location is required");
			  $("#custLoc").focus();
			  return false;
		  }
		  if($("#custCity").val().trim() == ""){
			  $("#custCityError").html("City is required");
			  $("#custCity").focus();
			  return false;
		  }
		  
		  if($("#shipmentState").val() == "" || $("#shipmentState").val() == undefined ){
			  $("#shipmentStateError").html("Please Select State");
			  $("#shipmentState").focus();
			  return false;
		  }
		  
		  /*if($("#billDno").val().trim() == ""){
			  $("#billDnoError").html("Door No. is required");
			  $("#billDno").focus();
			  return false;
		  }
		  if($("#billStreet").val().trim() == ""){
			  $("#billStreetError").html("Street is required");
			  $("#custStreet").focus();
			  return false;
		  }
		  if($("#billLoc").val().trim() == ""){
			  $("#billLocError").html("Location is required");
			  $("#billLoc").focus();
			  return false;
		  }
		  if($("#billCity").val().trim() == ""){
			  $("#billCityError").html("City is required");
			  $("#billCity").focus();
			  return false;
		  }*/
		  
		  
		/*  var orderStatus = $("#orderworkflow").val();*/
		  
		  if($("#shipDno").val().trim() == ""){
			  $("#shipDnoError").html("Door No. is required");
			  $("#shipDno").focus();
			  return false;
		  }
		  if($("#shipStreet").val().trim() == ""){
			  $("#shipStreetError").html("Street is required");
			  $("#shipStreet").focus();
			  return false;
		  }
		  if($("#shipLoc").val().trim() == ""){
			  $("#shipLocError").html("Location is required");
			  $("#shipLoc").focus();
			  return false;
		  }
		  if($("#shipCity").val().trim() == ""){
			  $("#shipCityError").html("City is required");
			  $("#shipCity").focus();
			  return false;
		  }
		  if($("#shipmentName").val().trim() == ""){
			  $("#shipmentNameError").html("Name is required");
			  $("#shipmentName").focus();
			  return false;
		  }
	  }
	  
		if(len == 0){
			alert("Add Atleast One Item to Order");
			return false;
			}
		
	/*	
		var minTotalCost =$("#orderTotalCost").val();
		var orderDeliveryType = $("#orderDeliveryType").val();
		if(minTotalCost<500 && orderDeliveryType == "Door Delivery")
			{
			alert("minimum order amount should be 500 ");
			return false;

			}*/
		
		var objBillTransactions = null;
		var objDiscount = null;
		for(var i=1;i<=len;i++){
			var idAttr = $("#productsList tr:eq("+i+") td:last").attr("id");
			idAttr = idAttr.replace('Del','');
			var obj = null;
			var objTaxes = null;
			
			if($("#orderItemId"+idAttr).length > 0){
				obj = {productClass:$("#classProduct"+idAttr).val(),subClass:$("#subclassProduct"+idAttr).val(),uOM:$("#uom"+idAttr).val(),brand:$("#brand"+idAttr).val(),
						style:$("#styleRange"+idAttr).val(),ean:$("#ean"+idAttr).val(),item_price:$("#itemPrice"+idAttr).text(),hsnCode:$("#hsnCode"+idAttr).val(),
						offerId:$("#discountIds"+idAttr).text(),discount:$("#itemDiscountPrice"+idAttr).text(),taxCode:$("#itemtaxCode"+idAttr).val(),itemScanCode:$("#itemScancode"+idAttr).val(),productRange:$("#productRange"+idAttr).val(),measureRange:$("#measureRange"+idAttr).val(),utility:$("#utility"+idAttr).val(),trackingRequired:$("#trackingRequired"+idAttr).val(),department:$("#department"+idAttr).val(),subDepartment:$("#subDept"+idAttr).val(),manufacturedItem:$("#manufacturedItem"+idAttr).val(),category:$("#category"+idAttr).val(),subCategory:$("#subCategory"+idAttr).val(),section:$("#section"+idAttr).val(),zeroStockFlag:$("#zeroStock"+idAttr).val(),packed:$("#packed"+idAttr).val(),editPriceFlag:$("#editable"+idAttr).val(),mrp:$("#price"+idAttr).text(),manualDiscount:$("#manualDiscount"+idAttr).val(),taxRate:$("#tax"+idAttr).text(),taxValue:$("#taxAmt"+idAttr).text(),order_item_id:$("#orderItemId"+idAttr).val(),skuId:$("#skuId"+idAttr).val(),pluCode:$("#pluCode"+idAttr).val(),item_name:$("#itemName"+idAttr).text(),salePrice:$("#itemPrice"+idAttr).text(),ordered_quantity:$("#orderedQuantity"+idAttr).text(),confirmQuantity:$("#confirmQuantity"+idAttr).text(),total_cost:$("#totalCost"+idAttr).text(),model:$("#model"+idAttr).text(),colour:$("#colour"+idAttr).text(),size:$("#size"+idAttr).text()};
			
			
			}else
				obj = {productClass:$("#classProduct"+idAttr).val(),subClass:$("#subclassProduct"+idAttr).val(),uOM:$("#uom"+idAttr).val(),brand:$("#brand"+idAttr).val(),style:$("#styleRange"+idAttr).val(),ean:$("#ean"+idAttr).val(),item_price:$("#itemPrice"+idAttr).text(),hsnCode:$("#hsnCode"+idAttr).val(),
					taxCode:$("#itemtaxCode"+idAttr).val(),itemScanCode:$("#itemScancode"+idAttr).val(),productRange:$("#productRange"+idAttr).val(),measureRange:$("#measureRange"+idAttr).val(),utility:$("#utility"+idAttr).val(),trackingRequired:$("#trackingRequired"+idAttr).val(),department:$("#department"+idAttr).val(),
					subDepartment:$("#subDept"+idAttr).val(),manufacturedItem:$("#manufacturedItem"+idAttr).val(),category:$("#category"+idAttr).val(),subCategory:$("#subCategory"+idAttr).val(),section:$("#section"+idAttr).val(),zeroStockFlag:$("#zeroStock"+idAttr).val(),packed:$("#packed"+idAttr).val(),
					offerId:$("#discountIds"+idAttr).text(),discount:$("#itemDiscountPrice"+idAttr).text(),editPriceFlag:$("#editable"+idAttr).val(),mrp:$("#price"+idAttr).text(),manualDiscount:$("#manualDiscount"+idAttr).val(),taxRate:$("#tax"+idAttr).text(),taxValue:$("#taxAmt"+idAttr).text(),skuId:$("#skuId"+idAttr).val(),pluCode:$("#pluCode"+idAttr).val(),skuid:$("#itemId"+idAttr).text(),item_name:$("#itemName"+idAttr).text(),salePrice:$("#itemPrice"+idAttr).text(),ordered_quantity:$("#orderedQuantity"+idAttr).text(),confirmQuantity:$("#confirmQuantity"+idAttr).text(),total_cost:$("#totalCost"+idAttr).text(),model:$("#model"+idAttr).text(),colour:$("#colour"+idAttr).text(),size:$("#size"+idAttr).text()};
			itemDetails.push(obj);
//			transactionDetails.poush(objBillTransactions);
			
			
			
			
		}
//		var sizeofTaxes = parseInt($("#sizeOfTaxes").val());
		
		var slno=null;
		  var taxeslen = $("#taxationlist tr").length;
		for(var i=0;i<taxeslen;i++){
			var taxidAttr = $("#taxationlist tr:eq("+i+") td:last").attr("id");
			taxidAttr = taxidAttr.replace('DelTax','');
			
			if($("#snoTax"+taxidAttr).val() == "")
				slno=null;
			else
				slno=$("#snoTax"+taxidAttr).val();
			objTaxes ={sno:slno,orderId:$("#orderIdTax"+taxidAttr).val(),sku_id:$("#skuIdTax"+taxidAttr).val(),plu_code:$("#pluCodeTax"+taxidAttr).val(),tax_type:$("#taxTaxType"+taxidAttr).val(),
					tax_code:$("#taxTaxcode"+taxidAttr).val(),tax_category:$("#taxTaxCategory"+taxidAttr).val(),tax_rate:$("#taxTax"+taxidAttr).val(),
					tax_value:$("#taxTaxAmt"+taxidAttr).val()};
			taxationDetails.push(objTaxes);
		}
		
		var slnoDisc =null;
		  var discountlen = $("#dicountlist tr").length;
			for(var i=0;i<discountlen;i++){
				var discidAttr = $("#dicountlist tr:eq("+i+") td:last").attr("id");
				discidAttr = discidAttr.replace('DelDisc','');
				if($("#serialNumDisc"+discidAttr).val() == "")
					slnoDisc=null;
				else
					slnoDisc=$("#serialNumDisc"+discidAttr).val();
				
				objDiscount ={serialNum:slnoDisc,skuId:$("#skuIdDisc"+discidAttr).val(),pluCode:$("#pluCodeDisc"+discidAttr).val(),discountType:$("#discountTypeDisc"+discidAttr).val(),
						discountId:$("#discountIdDisc"+discidAttr).val(),discountPrice:0,itemPrice:$("#itemPriceDisc"+discidAttr).val()};
				discDetails.push(objDiscount);
			}
			
		
		
		var items = JSON.stringify(itemDetails);
		console.log(items);
		
		
		
		var trabsactionId =null;	
for(var i=1;i<=1;i++){
	if($("#transactionID").val() !="" && $("#transactionID").length>0)
		trabsactionId = $("#transactionID").val();
		else
			trabsactionId =null;	
			objBillTransactions ={transactionId:trabsactionId,orderId:$("#orderID").val(),modeOfPayment:$("#paymentMode").val(),cardType:$("#cardType").val(),
					couponNumber:$("#couponNumber").val(),paidAmount:$("#paidAmount").val(),bankName:$("#bankName").val(),approvalCode:$("#approvalCode").val(),receivedAmount:$("#receivedAmount").val(),
					changeReturn:$("#changeReturn").val(),cardInfo:$("#cardInfo").val(),paymentStatus:$("#paymentStatus").val(),dateTime:$("#dateTime").val()}
			transactionDetails.push(objBillTransactions);
			
		}
//transactionDetails.push()
		console.log(transactionDetails)

		var addressList = []
		for(var i=1;i<=4;i++){
		//	if($("#shipmentNameaddress"+i).val() != "" && $("#shipmentContactaddress"+i).val() != "" && $("#shipDnoaddress"+i).val() != "" && $("#shipStreetaddress"+i).val() != "" && $("#shipLocaddress"+i).val() != "" && $("#shipCityaddress"+i).val() != "" && $("#shipmentStateaddress"+i).val() != "" && $("#shipmentCountryaddress"+i).val() != "" && $("#longitudeaddress"+i).val() != "" && $("#latitudeaddress"+i).val() != "")
			if($("#shipmentCountryaddress"+i).val().trim() == "")
				$("#shipmentCountryaddress"+i).val($("#shipmentCountryNameaddress"+i).val());
			var obj = {addressType:$("#addressType"+i).val(),
					house_type:$("#houseType"+i).val(),
					shipmentName:$("#shipmentNameaddress"+i).val(),shipmentApartmentName:$("#shipmentApartmentName"+i).val(),customerGstin:$("#customertaxid").val(),
					shipmentContact:$("#shipmentContactaddress"+i).val(),doorNumber:$("#shipDnoaddress"+i).val(),streetName:$("#shipStreetaddress"+i).val(),locality:$("#shipLocaddress"+i).val(),city:$("#shipCityaddress"+i).val(),state:$("#shipmentStateaddress"+i).val(),country:$("#shipmentCountryaddress"+i).val(),longitude:$("#longitudeaddress"+i).val(),latitude:$("#latitudeaddress"+i).val(),custAddressId:$("#custAddressIdaddress"+i).val()};
			addressList.push(obj);
		}
		var address = JSON.stringify(addressList);
		
		var taxationItems = JSON.stringify(taxationDetails);
		var transactionItems = JSON.stringify(transactionDetails);
		var discountItems = JSON.stringify(discDetails);
		
		$("#taxationItemsList").val(taxationItems);
		$("#discountItemsList").val(discountItems);
		$("#transactionItemsList").val(transactionItems);
		$("#addressList").val(address);
		$("#itemDetails").val(items);
		 $("#orderStatus").val(operation);
		 var deliveryType = $("#orderDeliveryType").val();
		 $("#deliveryType").val(deliveryType);
		 var storeLocation = $("#outletLocation option:selected").text();
		 $("#saleLocation").val(storeLocation);
		var formData  = JSON.stringify($('form').serializeObject());
		console.log(formData);
		var contextPath = $("#contextPath").val();
		var	location = $("#location").val();
//		if(type == "new" && flowName == "outlet")
		if(type == "new")
			URL = contextPath + "/inventorymanager/createOrder.do";
		/*else if(type == "new" && flowName == "warehouse")
			URL = contextPath + "/inventorymanager/createWarehouseOrder.do";
		else if(type == "edit" && flowName == "warehouse")
			URL = contextPath + "/inventorymanager/updateWarehouseOrder.do";*/
		else
			URL = contextPath + "/inventorymanager/updateOrder.do";
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
 	    			$("#location").val(location);
 	    			$("#maxRecords").val(maxRecords);
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

 
 

 function checkTimeSlots(dateStr,timeStr){
 	debugger;
 	var idTimeSlot;
 	var idDaySlot=dateStr.toString();
 	idTimeSlot=timeStr;
 	var today = new Date();
 	today = today.toString();
 	var res = idDaySlot.split(" ");
 	var today1 = today.toString().split(" ");
 	if(today1[2].length==1)
 		today1[2]= "0"+today1[2];
 	var currentDate =  today1[2]+" "+today1[1]+" "+today1[1];
 	if(res[2].length==1)
 		 res[2]= "0"+res[2];
 	var selDate =   res[2]+" "+res[1]+" "+res[1];
 	
 	
 	var selTime = getTwentyFourHourTime(timeStr);
 	var currentTime = today1[4];
 	
 	if(idDaySlot != undefined && idTimeSlot != undefined && idTimeSlot != '')
 	{
 		
 		if(currentDate==selDate){
 			if(currentTime<selTime){
 				return true;
 			}else{
 				alert("Please select valid Time Slots")
 				return false;
 			}
 		}else{
 			
 			return true;
 		}
 	
 	}
 	else
 	{
 		alert("Please select Time in Delivery Time Slots")
 		return false;
 	}
 	
 }

 
 function checkTimeSlot(startStr,timeStr){
	 	debugger;
	 	var idStartSlot;
	 	var idTimeSlot;
	 //	var idDaySlot=dateStr.toString();
	 	idStartSlot=startStr;
	 	idTimeSlot=timeStr;
	 	
	 	var startTime = getTwentyFourHourTime(startStr);
	 	var selTime = getTwentyFourHourTime(timeStr);
	 	if(idStartSlot != undefined && idTimeSlot != '' && idTimeSlot != undefined && idTimeSlot != '')
	 	{
	 	
	 			if(startTime<selTime){
	 				return true;
	 			}else{
	 				alert("Please select valid Time Slots")
	 				return false;
	 			}
	 		}
	 	else
	 		return true;
 }
 function getTwentyFourHourTime(amPmString) { 
     var d = new Date("1/1/2013 " + amPmString); 
     var hour=d.getHours();
     var min =d.getMinutes();
     if(hour.toString().length==1)
     	hour = "0"+hour;
     if(min.toString().length==1)
     	min = "0"+min;
     return hour + ':' + d.getMinutes()+ ':00'; 
 }
 
 
 function createOrder(operation,flowName){
	
	 debugger;
	 $("#searchItemsErrorIDdiscounts").html("");
	 
		var online = window.navigator.onLine;
	  	if(!online)
	  	{
	  	alert("check your internet connection,please try agian after some time");
	  	return;
	  	}
	 var re = /^[0-9/]+$/;
	
	 if($("#orderDate").val().trim() == ""){
			$("#orderDateError").html("Enter a Date");
			 $("#orderDate").focus();
			return;
	 }

	 if($("#deliveryDate").val().trim() == ""){
			$("#deliveryDateError").html("Enter a Date");
			 $("#deliveryDate").focus();
			return;
	 }
	
	 if(!re.test($("#deliveryDate").val())){
			$("#deliveryDateError").html("Invalid Date");
			return;
	 }
	 var noOfDays = daydiff(parseDate($('#orderDate').val()), parseDate($('#deliveryDate').val()));
	 if(noOfDays < 0){
		 $("#deliveryDateError").html("Delivery Date can't be less than Order Date");
		 return;
	 }
	
	// var time = checkTimeSlots(parseDate($('#deliveryDate').val()),$('#deliverySlotEndTime').val());
	 if($("#error").text() != ""){
		 $("#phoneNumber").focus();
		 return false;
	 }
	 
	 if($("#phoneNumber").val().trim() == ""){
    	 $("#phoneNumberError").html("Mobile Number Required"); 	 
		 $("#phoneNumber").focus();
		 return false;
	 }
	 if($("#phoneNumber1").val().trim() == ""){
    	 $("#phoneNumber1Error").html("Enter Phone Number"); 	 
		 $("#phoneNumber1").focus();
		 return false;
	 }
	 debugger
	 var selectedEmployeeName = $("#salesexecutivename option:selected").text();
	 $("#salesmanName").val(selectedEmployeeName);
	 
	  	var orderShipmentType = $("#orderDeliveryType").val();
	  	var orderShipmentCharges = parseFloat($("#orderTotalCost").val());
	 var shipmentError = $("#ErrorForShipment").html();
	 
		if(orderShipmentType == "Door Delivery" && orderShipmentCharges!=0)
		 {
			var errorShipment = $("#ErrorForShipment").html().trim();
		if(errorShipment != ""){
			focusDiv('ErrorForShipment');
			return false;
		}
		}
	 var mobileNumber = validateMobileNumberForOrders();
	 	 if(mobileNumber == false){
	 		$("#phoneNumber").focus();
	 		$("#phoneNumberError").html("Enter 10 digits Mobile Number"); 
	 		return;
	 	 }
	 	 var personalmobileNumber = validatePersonalMobileNumber();
  	 	 if(personalmobileNumber == false){
  	 		$("#phoneNumber1").focus();
  	 		$("#phoneNumber1Error").html("Enter 10 digits Mobile Number"); 
  	 		return;
  	 	 }
	 	 
	 var defaultCountry = $("#defaultCountry").val().trim();
	 var phoneNumber = $("#phoneNumber").val().trim();
	 if(defaultCountry != "" && phoneNumber != ""){
		 $("#mobile_num_code").val($("#defaultCountry option:selected").attr("text"));
		 $("#mobile_num").val(phoneNumber);
	 }
	
	
	 
	 var maxRecords = 10;
 	  if($("#maxRecords").length>0)
 		  maxRecords = $("#maxRecords").val();
	 
	  var len = $("#productsList tr").length-1;
	  var itemDetails = [];
	  var transactionDetails = [];
	  var taxationDetails  = [];
	  var discDetails = [];

	  var email = $("#email_id").val().trim();
	  if(operation != "Draft" && operation != "draft"){
		  if(email!="" && email!=null && email!=undefined && !emailValidation(email)){
			  $("#emailError").html("Invalid Email Id");
			  $("#email_id").focus();
			  return false;
		  }
		  
		  var mobileNo = $("#mobile_num").val();
		  if(mobileNo.trim() == ""){
			  $("#error").html("Mobile Number required");
			  $("#phoneNumber").focus();
			  return false;
		  }
		  if($("#shipDno").val().trim() == ""){
			  $("#shipDnoError").html("Door No. is required");
			  $("#shipDno").focus();
			  return false;
		  }
		  if($("#shipappartmentname").val().trim() == ""){
			  $("#shipappartmentnameError").html("Building name is Required");
			  $("#shipappartmentname").focus();
			  return false;
		  }
		  if($("#shipStreet").val().trim() == ""){
			  $("#shipStreetError").html("Street is required");
			  $("#shipStreet").focus();
			  return false;
		  }
		  if($("#shipLoc").val().trim() == ""){
			  $("#shipLocError").html("Location is required");
			  $("#shipLoc").focus();
			  return false;
		  }
		  if($("#shipCity").val().trim() == ""){
			  $("#shipCityError").html("City is required");
			  $("#shipCity").focus();
			  return false;
		  }
		  
		  
		  if($("#shipmentState").val() == "" || $("#shipmentState").val() == undefined ){
			  $("#shipmentStateError").html("Please Select State");
			  $("#shipmentState").focus();
			  return false;
		  }
		  
		  
		  
		  if($("#shipmentName").val().trim() == ""){
			  $("#shipmentNameError").html("Name is required");
			  $("#shipmentName").focus();
			  return false;
		  }
		  if($("#custDno").val().trim() == ""){
			  $("#custDnoError").html("Door No. is required");
			  $("#custDno").focus();
			  return false;
		  }
		  
		  if($("#cusappartmentname").val().trim() == ""){
			  $("#cusappartmentnameError").html("Building name is Required");
			  $("#cusappartmentname").focus();
			  return false;
		  }
		  
		  
		  if($("#custStreet").val().trim() == ""){
			  $("#custStreetError").html("Street is required");
			  $("#custStreet").focus();
			  return false;
		  }
		  if($("#custLoc").val().trim() == ""){
			  $("#custLocError").html("Location is required");
			  $("#custLoc").focus();
			  return false;
		  }
		  if($("#custCity").val().trim() == ""){
			  $("#custCityError").html("City is required");
			  $("#custCity").focus();
			  return false;
		  }
		  
		 
	  }
	  
		if(len == 0){
			alert("Add Atleast One Item to Order");
			return false;
			}
		
		var objBillTransactions = null;
		var objDiscount = null;
		for(var i=1;i<=len;i++){
			var idAttr = $("#productsList tr:eq("+i+") td:last").attr("id");
			idAttr = idAttr.replace('Del','');
			var obj = null;
			var objTaxes = null;
			
			if($("#orderItemId"+idAttr).length > 0){
				obj = {productClass:$("#classProduct"+idAttr).val(),subClass:$("#subclassProduct"+idAttr).val(),uOM:$("#uom"+idAttr).val(),brand:$("#brand"+idAttr).val(),
						style:"",ean:$("#ean"+idAttr).val(),item_price:$("#itemPrice"+idAttr).text(),hsnCode:$("#hsnCode"+idAttr).val(),
						offerId:$("#discountIds"+idAttr).text(),discount:$("#itemDiscountPrice"+idAttr).text(),taxCode:$("#itemtaxCode"+idAttr).val(),itemScanCode:$("#itemScancode"+idAttr).val(),
						productRange:$("#productRange"+idAttr).val(),measureRange:$("#measureRange"+idAttr).val(),utility:$("#utility"+idAttr).val(),trackingRequired:$("#trackingRequired"+idAttr).val(),
						department:$("#department"+idAttr).val(),subDepartment:$("#subDept"+idAttr).val(),manufacturedItem:$("#manufacturedItem"+idAttr).val(),category:$("#category"+idAttr).val(),subCategory:$("#subCategory"+idAttr).val(),
						section:$("#section"+idAttr).val(),zeroStockFlag:$("#zeroStock"+idAttr).val(),packed:$("#packed"+idAttr).val(),editPriceFlag:$("#editable"+idAttr).val(),mrp:$("#price"+idAttr).text(),manualDiscount:$("#manualDiscount"+idAttr).val(),taxRate:$("#tax"+idAttr).text(),taxValue:$("#taxAmt"+idAttr).text(),order_item_id:$("#orderItemId"+idAttr).val(),skuId:$("#skuId"+idAttr).val(),pluCode:$("#pluCode"+idAttr).val(),item_name:$("#itemName"+idAttr).text(),salePrice:$("#itemPrice"+idAttr).text(),ordered_quantity:$("#confirmQuantity"+idAttr).text(),confirmQuantity:$("#confirmQuantity"+idAttr).text(),total_cost:$("#totalCost"+idAttr).text(),model:$("#model"+idAttr).text(),colour:$("#colour"+idAttr).text(),size:$("#size"+idAttr).text()};
			
			
			}else
				obj = {productClass:$("#classProduct"+idAttr).val(),subClass:$("#subclassProduct"+idAttr).val(),uOM:$("#uom"+idAttr).val(),brand:$("#brand"+idAttr).val(),style:"",ean:$("#ean"+idAttr).val(),item_price:$("#itemPrice"+idAttr).text(),hsnCode:$("#hsnCode"+idAttr).val(),
					taxCode:$("#itemtaxCode"+idAttr).val(),itemScanCode:$("#itemScancode"+idAttr).val(),productRange:$("#productRange"+idAttr).val(),measureRange:$("#measureRange"+idAttr).val(),utility:$("#utility"+idAttr).val(),trackingRequired:$("#trackingRequired"+idAttr).val(),department:$("#department"+idAttr).val(),
					subDepartment:$("#subDept"+idAttr).val(),manufacturedItem:$("#manufacturedItem"+idAttr).val(),category:$("#category"+idAttr).val(),subCategory:$("#subCategory"+idAttr).val(),section:$("#section"+idAttr).val(),zeroStockFlag:$("#zeroStock"+idAttr).val(),packed:$("#packed"+idAttr).val(),
					offerId:$("#discountIds"+idAttr).text(),discount:$("#itemDiscountPrice"+idAttr).text(),editPriceFlag:$("#editable"+idAttr).val(),mrp:$("#price"+idAttr).text(),manualDiscount:$("#manualDiscount"+idAttr).val(),taxRate:$("#tax"+idAttr).text(),taxValue:$("#taxAmt"+idAttr).text(),skuId:$("#skuId"+idAttr).val(),pluCode:$("#pluCode"+idAttr).val(),skuid:$("#itemId"+idAttr).text(),item_name:$("#itemName"+idAttr).text(),salePrice:$("#itemPrice"+idAttr).text(),ordered_quantity:$("#confirmQuantity"+idAttr).text(),confirmQuantity:$("#confirmQuantity"+idAttr).text(),total_cost:$("#totalCost"+idAttr).text(),model:$("#model"+idAttr).text(),colour:$("#colour"+idAttr).text(),size:$("#size"+idAttr).text()};
			itemDetails.push(obj);

		}
		
		var slno=null;
		  var taxeslen = $("#taxationlist tr").length;
		for(var i=0;i<taxeslen;i++){
			var taxidAttr = $("#taxationlist tr:eq("+i+") td:last").attr("id");
			taxidAttr = taxidAttr.replace('DelTax','');
			
			if($("#snoTax"+taxidAttr).val() == "")
				slno=null;
			else
				slno=$("#snoTax"+taxidAttr).val();
			objTaxes ={sno:slno,orderId:$("#orderIdTax"+taxidAttr).val(),sku_id:$("#skuIdTax"+taxidAttr).val(),plu_code:$("#pluCodeTax"+taxidAttr).val(),tax_type:$("#taxTaxType"+taxidAttr).val(),
					tax_code:$("#taxTaxcode"+taxidAttr).val(),tax_category:$("#taxTaxCategory"+taxidAttr).val(),tax_rate:$("#taxTax"+taxidAttr).val(),
					tax_value:$("#taxTaxAmt"+taxidAttr).val()};
			taxationDetails.push(objTaxes);
		}
		
		var slnoDisc =null;
		  var discountlen = $("#dicountlist tr").length;
			for(var i=0;i<discountlen;i++){
				var discidAttr = $("#dicountlist tr:eq("+i+") td:last").attr("id");
				discidAttr = discidAttr.replace('DelDisc','');
				if($("#serialNumDisc"+discidAttr).val() == "")
					slnoDisc=null;
				else
					slnoDisc=$("#serialNumDisc"+discidAttr).val();
				
				objDiscount ={serialNum:slnoDisc,skuId:$("#skuIdDisc"+discidAttr).val(),pluCode:$("#pluCodeDisc"+discidAttr).val(),discountType:$("#discountTypeDisc"+discidAttr).val(),
						discountId:$("#discountIdDisc"+discidAttr).val(),discountPrice:0,itemPrice:$("#itemPriceDisc"+discidAttr).val()};
				discDetails.push(objDiscount);
			}
			
		
		
		var items = JSON.stringify(itemDetails);
		console.log(itemDetails);
		
		
		
		var trabsactionId =null;	
for(var i=1;i<=1;i++){
	if($("#transactionID").val() !="" && $("#transactionID").length>0)
		trabsactionId = $("#transactionID").val();
		else
			trabsactionId =null;	
			objBillTransactions ={transactionId:trabsactionId,orderId:$("#orderID").val(),modeOfPayment:$("#paymentMode").val(),cardType:$("#cardType").val(),
					couponNumber:$("#couponNumber").val(),paidAmount:$("#paidAmount").val(),bankName:$("#bankName").val(),approvalCode:$("#approvalCode").val(),receivedAmount:$("#receivedAmount").val(),
					changeReturn:$("#changeReturn").val(),cardInfo:$("#cardInfo").val(),paymentStatus:$("#paymentStatus").val(),dateTime:$("#dateTime").val()}
			transactionDetails.push(objBillTransactions);
			
		}
		console.log(transactionDetails)

		var addressList = []
		for(var i=1;i<=4;i++){
			if($("#address"+i).hasClass("highlightaddress"))
				{
				if($("#shipmentCountryaddress"+i).val().trim() == "")
					$("#shipmentCountryaddress"+i).val($("#shipmentCountryNameaddress"+i).val());
				var obj = {addressType:$("#addressTypeddress"+i).val(),
						house_type:$("#houseTypeaddress"+i).val(),
						shipmentName:$("#shipmentName").val(),customerGstin:$("#customertaxid").val(),
						shipmentContact:$("#phoneNumber1").val(),doorNumber:$("#shipDno").val(),shipmentApartmentName:$("#shipappartmentname").val(),customerApartmentName:$("#cusappartmentname").val(),billingApartmentName:$("#billappartmentname").val(),streetName:$("#shipStreet").val(),locality:$("#shipLoc").val(),city:$("#shipCity").val(),state:$("#shipmentState").val(),country:$("#shipmentCountryaddress"+i).val(),longitude:$("#longitude").val(),latitude:$("#latitude").val(),custAddressId:$("#custAddressIdaddress"+i).val()};
				addressList.push(obj);
				}
			else
				{
				if($("#shipmentCountryaddress"+i).val().trim() == "")
					$("#shipmentCountryaddress"+i).val($("#shipmentCountryNameaddress"+i).val());
				var obj = {addressType:$("#addressTypeddress"+i).val(),
						house_type:$("#houseTypeaddress"+i).val(),
						shipmentName:$("#shipmentNameaddress"+i).val(),
						shipmentContact:$("#shipmentContactaddress"+i).val(),doorNumber:$("#shipDnoaddress"+i).val(),shipmentApartmentName:$("#shipmentApartmentName"+i).val(),streetName:$("#shipStreetaddress"+i).val(),locality:$("#shipLocaddress"+i).val(),city:$("#shipCityaddress"+i).val(),state:$("#shipmentStateaddress"+i).val(),country:$("#shipmentCountryaddress"+i).val(),longitude:$("#longitudeaddress"+i).val(),latitude:$("#latitudeaddress"+i).val(),custAddressId:$("#custAddressIdaddress"+i).val()};
				addressList.push(obj);
				}
			
		}
		var address = JSON.stringify(addressList);
		
		var taxationItems = JSON.stringify(taxationDetails);
		var transactionItems = JSON.stringify(transactionDetails);
		var discountItems = JSON.stringify(discDetails);
		
		$("#taxationItemsList").val(taxationItems);
		$("#discountItemsList").val(discountItems);
		$("#transactionItemsList").val(transactionItems);
		$("#addressList").val(address);
		$("#itemDetails").val(items);
		 $("#orderStatus").val(operation);
		 $('#totalQty').val(1);
		 var deliveryType = $("#orderDeliveryType").val();
		 $("#deliveryType").val(deliveryType);
		 var storeLocation = $("#outletLocation option:selected").text();
		 $("#saleLocation").val(storeLocation);
		var formData  = JSON.stringify($('form').serializeObject());
		console.log(formData);
		var contextPath = $("#contextPath").val();
		var	location = $("#location").val();
		
			URL = contextPath + "/inventorymanager/createOrder.do";
		
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
 	    			$("#location").val(location);
 	    			$("#maxRecords").val(maxRecords);
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

 
 
 function getTaxes(){
	  		 //purpose:for checking internet conection
			var online = window.navigator.onLine;
		  	if(!online)
		  	{
		  	alert("check your internet connection,please try agian after some time");
		  	return;
		  	}
	  	//	var countryName = $("#countryName option:selected").text();
	  		var location = $("#outletLocation option:selected").text();
	  		 var contextPath = $("#contextPath").val();
	  		 URL = contextPath + "/inventorymanager/getTaxesForLocation.do";
	  		 $.ajax({
	  				type: "GET",
	  				url : URL,
	  				data : {
	  					location : location
	  				},
	  				beforeSend: function(xhr){                    
	  		   	   		$("#loading").css("display","block");
	  		   	   		$("#mainDiv").addClass("disabled");
	  		   	   	},
	  				success : function(result) {
	  					appendTax(result);
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
	  	 	 
	  	 	 
	  	function appendTax(taxDetails){
	  		 $("#tax").html('');
	  		 var divDetails = '';
	  		for(var i=0;i<taxDetails.length;i++){
	  			var k=i+1;
	  			 divDetails = divDetails + '<div class="row"> <div class="form-group col-lg-6"></div> <div class="form-group col-lg-3" style="text-align: right;"><label><span class="taxName">'+taxDetails[i].taxName+'</span> - <span class="taxRate">'+taxDetails[i].taxRate;
	  			 if(taxDetails[i].taxType == 'percentage')
	  				 divDetails = divDetails+'%';
	  			 divDetails = divDetails+'</span></label></div> <div class="form-group col-lg-3"> <input type="text" class="form-control" id="orderTax'+k+'" readonly value=""/></div></div>';
	  		}
	  		 $("#tax").html(divDetails);
	  		 changeTotalQuantity();
	  		 changeTotalCost();
	  	} 	 
	  	$('#searchStores').on('input',function(e){
	  		var status1 =$("#status").val();
	  		var type = $("#type").val();
	  		if($(this).val().trim()==""){
	  			$("#status").val(status1);
	  			viewOrders('all','','0',type);
	  		}
	  	});
	  	
	  /*	function searchOrders(name,searchCategory,index){
	  		var loc=$("#outletLocation").val();

   			var status=$("#status").val();
   			
   			if(status == "all")
				{
				status="";
				}
   			var type = $("#type").val();
   			var contextPath = $("#contextPath").val();
	  		 URL = contextPath + "/inventorymanager/searchOrders.do";
	  		 $.ajax({
	  				type: "GET",
	  				url : URL,
	  				data : {
	  					searchName : name,
	  					location : loc,
	  					index : index,
	  					status : status,
	  					type : type
	  				},
	  				beforeSend: function(xhr){                    
	  		   	   		$("#loading").css("display","block");
	  		   	   		$("#mainDiv").addClass("disabled");
	  		   	   	},
	  				success : function(result) {
	  					$('#right-side').html(result);
	  					if($("#searchProduct").val != "")
	  						$("#pagination").css("display","none");
	  					else
	  						$("#pagination").css("display","block");
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

	  	function searchOrders(name,searchCategory,index,file){
   			//var status=$("#status").val();
   			var status=$("#orderStatus").val();
   			
   			debugger
   		 //purpose:for checking internet conection
   			var online = window.navigator.onLine;
   		  	if(!online)
   		  	{
   		  	alert("check your internet connection,please try agian after some time");
   		  	return;
   		  	}
   			
   			name=""
   	   		 if($("#searchOrders").length>0)
   	   			name = $("#searchOrders").val().trim();
   			
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
	 		 if($("#location1").length>0 && $("#location1").val != "select" && $("#location1").val != "-- Select --")
    	 		location = $("#location1").val();
	 		 startDate = $("#from").val();
	 		var currentDate = getSystemDate();
				if ($('#from').val() != "" && currentDate != "") {
 	   	   		var noOfDays = daydiff(parseDate(startDate), parseDate(currentDate));
 	   	   		if (noOfDays < 0) {
 	   	   			alert("Start Date can't be grater than Current Date");
 	   	   			$("#startDate").val("");
 	   	   			return;
 	   	   		}
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
			
				
			var orderChannel = $("#orderChannelId").val();
			var orderStartValue = $("#orderStartValue").val();
			var orderEndValue = $("#orderEndValue").val();
			var zoneId = $("#outletZone").val();
			
			var TimeSlot=$("#deliverySlotStartTime").val();
			
			if(TimeSlot!="" && TimeSlot!=null && TimeSlot!=undefined)
				{
				var times=TimeSlot.split(",");
				
				var deliverySlotStartTime = times[0];
				var deliverySlotEndTime = times[1];
				}
			else
				{
				var deliverySlotStartTime = "";
				var deliverySlotEndTime = "";
				}
			
		if(file=="" || file==null || file==undefined)
			{
				file="false";
			}
	 		 
	 		/*var time = checkTimeSlot($('#deliverySlotStartTime').val(),$('#deliverySlotEndTime').val());
	 		
	 		if(time == false){
	 			
	 		return;
	 		}*/
	 		
   			var contextPath = $("#contextPath").val();
	  		 URL = contextPath + "/inventorymanager/searchOrders.do";
	  		 $.ajax({
	  				type: "GET",
	  				url : URL,
	  				data : {
	  					searchName : name,
	  					location : location,
	  					maxRecords : maxRecords,
	 					startDate : startDate,
	 					endDate : endDate,
	  					index : index,
	  					status:status,
	  					type:type,
	  					orderChannel : orderChannel,
	  				  	orderStartValue : orderStartValue,
	  				  	orderEndValue : orderEndValue,
	  				    deliverySlotStartTime : deliverySlotStartTime,
	  				    deliverySlotEndTime : deliverySlotEndTime,
	  					flowUnder : flowUnder,
	  					zoneId:zoneId,
	  					file : file
	  				},
	  				beforeSend: function(xhr){                    
	  		   	   		$("#loading").css("display","block");
	  		   	   		$("#mainDiv").addClass("disabled");
	  		   	   	},
	  				success : function(result) {
	  					$('#right-side').html(result);
	  					if(file=="true"){
	  						var anchor = document.createElement('a');
							anchor.href = $("#fileDownloadurl").val();
							anchor.target = '_blank';
							anchor.download = '';
							if($("#fileDownloadurl").val()!=null && $("#fileDownloadurl").val()!='')
								anchor.click();
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
	  	
	  	function getOrderSummary(){
	  		 //purpose:for checking internet conection
			var online = window.navigator.onLine;
		  	if(!online)
		  	{
		  	alert("check your internet connection,please try agian after some time");
		  	return;
		  	}
			var startDate = "";
			 var endDate = "";
			 if($("#from").length>0)
				 startDate = $("#from").val();
			 if($("#to").length>0)
				 endDate = $("#to").val();
			 if(startDate == "" && endDate != ""){
				 alert("Please Select Start Date");
				 return;
			 }
			 if($("#from").val() != "" && $("#to").val() != ""){
		 			var noOfDays = daydiff(parseDate($('#from').val()), parseDate($('#to').val()));
					 if(noOfDays < 0){
						 alert("Start Date can't be less than End Date");
						 return;
					 }
			 }
			 var status ='';
			 debugger;
			 /*var status = $("#status").val();*/
			 var location = $("#location1").val();
			 var contextPath = $("#contextPath").val();
			 URL = contextPath + "/inventorymanager/getOrderSummary.do";
			 $.ajax({
					type: "GET",
					url : URL,
					data : {
						location : location,
						startDate : startDate,
						endDate : endDate,
						status : status
					},
					beforeSend: function(xhr){                    
			   	   		$("#loading").css("display","block");
			   	   		$("#mainDiv").addClass("disabled");
			   	   	},
					success : function(result) {
						$('#summary').html(result);
						new d3pie("OrdersPieChart", {
							data: {
								content: getOrderPieChartData()
							},
					    	tooltips: {
						        enabled: true,
						        type: "placeholder",
						        string: "{label}: {percentage}% ({value})",
						        placeholderParser: function(index, data) {
						          data.label = data.label + "!";
						          data.percentage = data.percentage.toFixed(2);
						          data.value = data.value.toFixed(5);
						        }
						    }
						});
					
						if(location == "")
							location = "ALL";
						$("#locationLable").html(location);
						if(startDate != "" && endDate != "")
							$("#dateLable").html("  ("+startDate+" - "+endDate+")");
						 if(startDate != "" && endDate == ""){
							 var dateTime = getCurrentDate();
							  var date = dateTime.split(' ');
							  date = date[0].split('/');
							  endDate = date[1]+"/"+date[0]+"/"+date[2];
							  $("#dateLable").html("  ("+startDate+" - "+endDate+")");
						 }
						var  op = '<a id="summaryTag"  data-toggle="modal" data-target="#items-modal"></a>';
						 $("#triggerEvent").append(op);
						 $("#summaryTag" ).trigger( "click" );
						 $("#triggerEvent").html("");
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
	  	
	  	function phoneNumberBlur(){
	  		
	  		debugger
	  		var defaultCountry = $("#defaultCountry").val().trim();
	  		var phoneNumber = $("#phoneNumber").val().trim();
	  		
	  		if(phoneNumber.length==10)
	  			{
	  			validateMobileNumberForOrders();
		  		if(phoneNumber != ""){
		  			validateCustomerNumber() ;
		  		}
	  			}
	  		
	  		
	  		
	  	}
	  	
	  	$('#phoneNumber').on('input', function() {
	  		debugger
	  		var defaultCountry = $("#defaultCountry").val().trim();
	  		var phoneNumber = $("#phoneNumber").val().trim();
	  		
	  		if(phoneNumber.length==10)
	  			{
	  			validateMobileNumberForOrders();
		  		if(phoneNumber != ""){
		  			validateCustomerNumber() ;
		  		}
	  			}
	  		});
  	
	  	
	  	function validateCustomerNumber(){
	  		debugger
	  		 //purpose:for checking internet conection
			var online = window.navigator.onLine;
		  	if(!online)
		  	{
		  	alert("check your internet connection,please try agian after some time");
		  	return;
		  	}
			 phoneNumberParser();
			 var output = $("#output").val();
			 if(output.indexOf(":")<0){
				 $("#error").html(output);
				 return false;
			 }
			 var result = output.split(",");
			 for(var i=0;i<result.length; i++){
				 var val=result[i].split(":");
				 if(val[1] != "true"){
					 $("#error").html("Invalid Phone Number");
					 return false;
				 }
			 }
			var MobileNo= $("#phoneNumber").val();
			var contextPath = $("#contextPath").val();
		   URL = contextPath + "/orderManagement/getCustomerInfo.do";
		$.ajax({
			type: "GET",
  			url : URL,
		       data : {
		    	   mobileNum : MobileNo
		       },
		       beforeSend: function(xhr){                    
			   			$("#loading").css("display","block");
			   			$("#mainDiv").addClass("disabled");
		  	   	},
		  		success : function(result) {
		  				appendCustomerDetails(result);
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
	  	
	  	function appendCustomerDetails(custDetails){
	  		debugger
	  		 $("#ServiceAreaFlag").val("false");
	  		 var parsedJson = jQuery.parseJSON(custDetails);  
	  		 if($("#email_id").val().trim() == "" && parsedJson.email != undefined)
	  			$("#email_id").val(parsedJson.email);
	  		 if(parsedJson.houseNo != undefined)
	  			 $("#custDno").val(parsedJson.houseNo);
	  		 if(parsedJson.houseNo != undefined)
	  		 $("#billDno").val(parsedJson.houseNo);
	  		 if(parsedJson.houseNo != undefined)
		  		 $("#shipDno").val(parsedJson.houseNo);
	  		
	  		 if(parsedJson.name != undefined)
	  			 {
	  			$("#shipmentName").val(parsedJson.name);
	  			$("#billshipmentName").val(parsedJson.name);
	  			$("#CusshipmentName").val(parsedJson.name);
	  			 }
	  		 
	  		 if(parsedJson.state != undefined)
  			 {
  			$("#shipmentState").val(parsedJson.state);
  			$("#billState").val(parsedJson.state);
  			$("#cusState").val(parsedJson.state);
  			
  			 }else{
  				$("#shipmentState").val("Select State");
  				$("#billState").val("Select State");
  				$("#cusState").val("Select State");
  			 }
	  		
	  		 
	  		 if(parsedJson.name != undefined)
		  		 $("#firstName").val(parsedJson.name);
	  		 if(parsedJson.lastName != undefined)
		  		 $("#lastName").val(parsedJson.lastName);
	  		 
                if(parsedJson.pin_no != undefined){
	
	 $("#shipPin").val(parsedJson.pin_no);
    $("#billpinNum").val(parsedJson.pin_no);
    $("#custpin").val(parsedJson.pin_no);
}
		  		
	
	
	  		 
	  		 
	  		 if(parsedJson.customerGstin != undefined)
		  		 $("#customertaxid").val(parsedJson.customerGstin);
	  		 
	  		 if(parsedJson.street != undefined)
	  		 $("#custStreet").val(parsedJson.street);
	  		 if(parsedJson.street != undefined)
	  		 $("#billStreet").val(parsedJson.street);
	  		 if(parsedJson.street != undefined)
	  		 $("#shipStreet").val(parsedJson.street);
	  		 if(parsedJson.locality != undefined)
	  		 $("#custLoc").val(parsedJson.locality);
	  		 if(parsedJson.locality != undefined)
	  		 $("#billLoc").val(parsedJson.locality);
	  		 if(parsedJson.locality != undefined)
	  		 $("#shipLoc").val(parsedJson.locality);
	  		 if(parsedJson.city != undefined)
	  		 $("#custCity").val(parsedJson.city);
	  		 if(parsedJson.city != undefined)
	  		 $("#billCity").val(parsedJson.city);
	  		 if(parsedJson.mobileNumber != undefined){
		  	$("#customerContactNum").val(parsedJson.mobileNumber);
		  	$("#billingMobileNo").val(parsedJson.mobileNumber);
	  		 $("#phoneNumber1").val(parsedJson.mobileNumber);
	  		 }
	  		if(parsedJson.phone != undefined){
			  	$("#customerContactNum").val(parsedJson.phone);
			  	$("#billingMobileNo").val(parsedJson.phone);
		  		 $("#phoneNumber1").val(parsedJson.phone);
		  		 }
	  		 if(parsedJson.city != undefined)
	  		 $("#shipCity").val(parsedJson.city);
	  		 else
	  		 $("#shipCity").val(parsedJson.city); 
	  			 
	  		if(parsedJson.addressList != undefined){
	  			var j = 1;
	  			for(var i = 0; i < parsedJson.addressList.length; i++){
	  				if(parsedJson.addressList[i].doorNumber != undefined && $("#shipDnoaddress"+j).val().trim() == "")
	  					$("#shipDnoaddress"+j).val(parsedJson.addressList[i].doorNumber);
	  				if(parsedJson.addressList[i].streetName != undefined && $("#shipStreetaddress"+j).val().trim() == "")
	  					$("#shipStreetaddress"+j).val(parsedJson.addressList[i].streetName);
	  				if(parsedJson.addressList[i].locality != undefined && $("#shipLocaddress"+j).val().trim() == "")
	  			  		 $("#shipLocaddress"+j).val(parsedJson.addressList[i].locality);
	  				if(parsedJson.addressList[i].city != undefined && $("#shipCityaddress"+j).val().trim() == "")
	  			  		 $("#shipCityaddress"+j).val(parsedJson.addressList[i].city);
	  				if(parsedJson.addressList[i].state != undefined && $("#shipmentStateaddress"+j).val().trim() == "")
	  			  		 $("#shipmentStateaddress"+j).val(parsedJson.addressList[i].state);
	  				if(parsedJson.addressList[i].country != undefined && $("#shipmentCountryaddress"+j).val().trim() == "")
	  			  		 $("#shipmentCountryaddress"+j).val(parsedJson.addressList[i].country);
	  				if(parsedJson.addressList[i].shipmentName != undefined && $("#shipmentNameaddress"+j).val().trim() == "")
	  			  		 $("#shipmentNameaddress"+j).val(parsedJson.addressList[i].shipmentName);
	  				if(parsedJson.addressList[i].shipmentContact != undefined && parsedJson.addressList[i].shipmentContact != "")
	  					 $("#shipmentContactaddress"+j).val(parsedJson.addressList[i].shipmentContact);
  					else if(parsedJson.addressList[i].landLine != undefined && parsedJson.addressList[i].landLine != "")
  						 $("#shipmentContactaddress"+j).val(parsedJson.addressList[i].landLine);
	  				if(parsedJson.addressList[i].longitude != undefined && $("#longitudeaddress"+j).val().trim() == "")
	  			  		 $("#longitudeaddress"+j).val(parsedJson.addressList[i].longitude);
	  				if(parsedJson.addressList[i].latitude != undefined && $("#latitudeaddress"+j).val().trim() == "")
	  			  		 $("#latitudeaddress"+j).val(parsedJson.addressList[i].latitude);
	  				if(parsedJson.addressList[i].custAddressId != undefined && $("#custAddressIdaddress"+j).val().trim() == "")
	  			  		 $("#custAddressIdaddress"+j).val(parsedJson.addressList[i].custAddressId);
	  				if(parsedJson.addressList[i].addressType != undefined && $("#addressTypeddress"+j).val().trim() == "")
	  			  		 $("#addressTypeddress"+j).val(parsedJson.addressList[i].addressType);
	  				if(parsedJson.addressList[i].house_type != undefined && $("#houseTypeaddress"+j).val().trim() == "")
	  			  		 $("#houseTypeaddress"+j).val(parsedJson.addressList[i].house_type);
	  				j++;
	  			}
	  			shipmentAddress('address1',true);
	  		}
	  		else
	  			{
	  				$("#latitude").val("");
	  				$("#longitude").val("");
	  				 $("#phoneNumber1").val(parsedJson.phone);
	  				 $("#ServiceAreaFlag").val("false");
	  				
	  				
	  			}
	  	}
	  	
	  	function shipmentAddress(id,appendToHidden){
	  		debugger;
	  		$(".Error").html("");
//	  		var id = $(ele).attr("id");
	  		var previousId = $(".highlightaddress").attr("id");
	  		if(appendToHidden){
	  			$('#shipmentName'+previousId).val($("#shipmentName").val());
	  			if($("#phoneNumber1").val() != ""){
	  				$('#shipmentContactCode'+previousId).val($("#defaultCountry1").val());
	  				$('#shipmentCountryName'+previousId).val($("#defaultCountry1 option:selected").attr("text"));
	  				$('#shipmentContact'+previousId).val($("#phoneNumber1").val());
	  			}
	  			$('#shipDno'+previousId).val($("#shipDno").val());
	  			$('#shipmentApartmentName'+previousId).val($("#shipmentApartmentName").val());
	  			$('#shipStreet'+previousId).val($("#shipStreet").val());
	  			$('#shipLoc'+previousId).val($("#shipLoc").val());
	  			$('#shipCity'+previousId).val($("#shipCity").val());
	  			$('#shipmentState'+previousId).val($("#shipmentState").val());
	  			$('#shipmentCountry'+previousId).val($("#shipmentCountry").val());
	  			$('#latitude'+previousId).val($("#latitude").val());
	  			$('#longitude'+previousId).val($("#longitude").val());
	  			$('#custAddressId'+previousId).val($("#custAddressId").val());
	  		}
	  		$(".highlightaddress").removeClass("highlightaddress");
	  		$("#"+id).addClass("highlightaddress");
	  		$('#shipmentName').val($("#shipmentName"+id).val());
	  		var shipmentName=$("#shipmentName"+id).val();
	  		
	  		if(shipmentName!=null && shipmentName!=undefined && shipmentName!="")
	  			{
	  				$("#billshipmentName").val(shipmentName);
	  				$("#CusshipmentName").val(shipmentName);
	  				var firstName=$("#firstName").val();
	  				if(firstName ==null || firstName ==undefined || firstName =="")
	  					{
	  					 $("#firstName").val(shipmentName);
	  					}
	  			}
	  			 	
	  			 
	  		/*var phoneNo = $("#shipmentContact"+id).val();
				phoneNo = phoneNo.split('-');
				if(phoneNo.length == 1)
					$("#phoneNumber1").val(phoneNo[0]);
				else{
					$("#defaultCountry1").val(phoneNo[0]);
					$("#phoneNumber1").val(phoneNo[1]);
				}*/
	  		var shipmentContact=$("#shipmentContact"+id).val();
	  		var shipDno=$("#shipDno"+id).val();
	  		var shipDno=$("#shipDno"+id).val();
	  		var shipLoc=$("#shipLoc"+id).val();
	  		var shipCity=$("#shipCity"+id).val();
	  		var shipmentState=$("#shipmentState"+id).val();
	  		var shipmentCountry=$("#shipmentCountry"+id).val();
	  		var latitude=$("#latitude"+id).val();
	  		var longitude=$("#longitude"+id).val();
	  		var custAddressId=$("#custAddressId"+id).val();
	  		var shipmentContactCode=$("#shipmentCountry"+id).val();
	  		
	  		$("#phoneNumber1").val($("#shipmentContact"+id).val());
			if($("#shipmentContactCode"+id).val() != "")
				{
				if($("#shipmentContactCode"+id).val() == "india")
				$("#defaultCountry1").val("India");
				}
				
	  		$('#shipDno').val($("#shipDno"+id).val());
	  		$('#shipmentApartmentName').val($("#shipmentApartmentName"+id).val());
	  		$('#shipStreet').val($("#shipStreet"+id).val());
	  		$('#shipLoc').val($("#shipLoc"+id).val());
	  		$('#shipCity').val($("#shipCity"+id).val());
	  		$('#shipmentState').val($("#shipmentState"+id).val());
	  		$('#billState').val($("#shipmentState"+id).val());
	  		$('#cusState').val($("#shipmentState"+id).val());
	  		$('#shipmentCountry').val($("#shipmentCountry"+id).val());
	  		$('#latitude').val($("#latitude"+id).val());
	  		$('#longitude').val($("#longitude"+id).val());
	  		$('#custAddressId').val($("#custAddressId"+id).val());
	  		if($("#phoneNumber1").val().trim()!='')
	  		getShipmentCost();
	  	}
	  	function initAutocomplete() {
	  		debugger;
	  		 var input = document.getElementById('custLoc');
	          var searchBox = new google.maps.places.SearchBox(input);
	          searchBox.addListener('places_changed', function() {
	          var places = searchBox.getPlaces();
	          if (places.length == 0) {
	            return;
	          }
	          debugger;
	          places.forEach(function(place) {
	        	  var data=JSON.parse(JSON.stringify(place));
	        	  $('#mapid').html("");
	              $('#mapid').append(data.adr_address);  
	              	//$("#custStreet").val($("#mapid .street-address").text());
	              	//$("#custLoc").val($("#mapid .extended-address").text());
	              	$("#latitude").val(JSON.stringify(data.geometry.location.lat));
          			$("#longitude").val(JSON.stringify(data.geometry.location.lng));
          			$("#shipLoc").val($("#custLoc").val());
        			$("#billLoc").val($("#custLoc").val());
          			getShipmentCost();
          			//getNearestStore();
	              	//$("#custCity").val($("#mapid .locality").text());
	              	if($("#custLoc").val().trim() == "" && $("#custStreet").val().trim() == "" && $("#custCity").val().trim() == ""){
	              		$("#custLoc").val(data.name);
	              	}	              	
	              	if($("#billLoc").val().trim() == "" && $("#billStreet").val().trim() == "" && $("#billCity").val().trim() == ""){
	              		//$("#billLoc").val(data.name);
	              		$("#billLoc").val($("#custLoc").val());
	              		//$("#billLoc").val($("#mapid .extended-address").text());
	              		//$("#billCity").val($("#mapid .locality").text());
	              	}
	              	if($("#shipLoc").val().trim() == "" && $("#shipStreet").val().trim() == "" && $("#shipCity").val().trim() == ""){
	              		$("#shipLoc").val(data.name);
              			$("#shipLoc").val($("#mapid .extended-address").text());
              			//$("#shipCity").val($("#mapid .locality").text());
              			$("#shipmentState").val($("#mapid .region").text());
              			$("#shipmentCountry").val($("#mapid .country-name").text());
              			$("#latitude").val(JSON.stringify(data.geometry.location.lat));
              			$("#longitude").val(JSON.stringify(data.geometry.location.lng));
              			getShipmentCost();
	              	}
	          });
	        });
	  		/* $city = $("#custCity");
	  		  var input1 = document.getElementById('custCity');
	  		  var options = {
//	  		          componentRestrictions: {country: 'in'},
	  		          types: ['(cities)']
	  		   };
	  		   autocomplete = new google.maps.places.Autocomplete($city.get(0), options);    
	  		   google.maps.event.addListener(autocomplete, 'place_changed', function() {
	  			   var selectedCity = $("#custCity").val().split(",");
	  		       $("#custCity").val(selectedCity[0]);
	  		   });*/
	          var input1 = document.getElementById('billLoc');
	          var searchBox1 = new google.maps.places.SearchBox(input1);
	          searchBox1.addListener('places_changed', function() {
	          var places1 = searchBox1.getPlaces();
	          if (places1.length == 0) {
	            return;
	          }
	          debugger;
	          places1.forEach(function(place1) {
	        	  var data1=JSON.parse(JSON.stringify(place1));
	        	  $('#mapid1').html("");
	              $('#mapid1').append(data1.adr_address);  
	            /*  	$("#custStreet").val($(".street-address").text());
	              	$("#custLoc").val($(".extended-address").text());
	              	$("#custCity").val($(".locality").text());*/
	              $("#latitude").val(JSON.stringify(data1.geometry.location.lat));
        			$("#longitude").val(JSON.stringify(data1.geometry.location.lng));
        			$("#shipLoc").val($("#billLoc").val());
        			$("#custLoc").val($("#billLoc").val());
        			getShipmentCost();
        			//getNearestStore();
	              	if($("#custLoc").val().trim() == "" && $("#custStreet").val().trim() == "" && $("#custCity").val().trim() == ""){
	              		//$("#custLoc").val(data1.name);
	              		$("#custLoc").val($("#billLoc").val());
	              	}		              
	              	if($("#billLoc").val().trim() == "" && $("#billStreet").val().trim() == "" && $("#billCity").val().trim() == ""){
	              		$("#billLoc").val(data1.name);
	              		$("#billLoc").val($("#mapid1 .extended-address").text());}
	              		//$("#billCity").val($("#mapid1 .locality").text());
	              
	              	if($("#shipLoc").val().trim() == "" && $("#shipStreet").val().trim() == "" && $("#shipCity").val().trim() == ""){
	              		$("#shipLoc").val(data1.name);
	              		//$("#shipStreet").val($(".street-address").text());
              			$("#shipLoc").val($(".extended-address").text());
              			//$("#shipCity").val($(".locality").text());
              			$("#shipmentState").val($(".region").text());
              			$("#shipmentCountry").val($(".country-name").text());
              			$("#latitude").val(JSON.stringify(data1.geometry.location.lat));
              			$("#longitude").val(JSON.stringify(data1.geometry.location.lng));
              			getShipmentCost();
	              	}
	          });
	        });
	          var input2 = document.getElementById('shipLoc');
	          var searchBox2 = new google.maps.places.SearchBox(input2);
	          searchBox2.addListener('places_changed', function() {
	          var places2 = searchBox2.getPlaces();
	          if (places2.length == 0) {
	            return;
	          }
	          debugger;
	          places2.forEach(function(place2) {
	        	  var data2=JSON.parse(JSON.stringify(place2));
	        	  $('#mapid2').html("");
	              $('#mapid2').append(data2.adr_address);  
	            /*  	$("#custStreet").val($(".street-address").text());
	              	$("#custLoc").val($(".extended-address").text());
	              	$("#custCity").val($(".locality").text());
	              	if($("#billStreet").val().trim() == "" && $("#billLoc").val().trim() == "" && $("#billCity").val().trim() == ""){
	              		$("#billStreet").val($(".street-address").text());
	              		$("#billLoc").val($(".extended-address").text());
	              		$("#billCity").val($(".locality").text());
	              /*	}*/
	              $("#latitude").val(JSON.stringify(data2.geometry.location.lat));
        			$("#longitude").val(JSON.stringify(data2.geometry.location.lng));
        			$("#custLoc").val($("#shipLoc").val());
        			$("#billLoc").val($("#shipLoc").val());
        			getShipmentCost();
        			//getNearestStore();
	              	if($("#custLoc").val().trim() == "" && $("#custStreet").val().trim() == "" && $("#custCity").val().trim() == ""){
	              		//$("#custLoc").val(data2.name);
	              		$("#custLoc").val($("#shipLoc").val());
	              	}	              	
	              	if($("#billLoc").val().trim() == "" && $("#billStreet").val().trim() == "" && $("#billCity").val().trim() == ""){
	              		//$("#billLoc").val(data2.name);
	              		$("#billLoc").val($("#shipLoc").val());
	              		//$("#billLoc").val($("#mapid .extended-address").text());
	              		//$("#billCity").val($("#mapid .locality").text());
	              	}	              
	              	if($("#shipLoc").val().trim() == "" && $("#shipStreet").val().trim() == "" && $("#shipCity").val().trim() == ""){
	              		$("#shipLoc").val(data2.name);
              			$("#shipLoc").val($("#mapid2 .extended-address").text());
              			//$("#shipCity").val($("#mapid2 .locality").text());
              			$("#shipmentState").val($("#mapid2 .region").text());
              			$("#shipmentCountry").val($("#mapid2 .country-name").text());
              			$("#latitude").val(JSON.stringify(data2.geometry.location.lat));
              			$("#longitude").val(JSON.stringify(data2.geometry.location.lng));
              			getShipmentCost();
	              	}
	          });
	        });
	    	 
	      } 
	  	 //written By: manasa 
	  	 //purpose:to call campaign details.
	  	 
		 function getApplyCampignDetails(skuID,plucode,itemPrice,qty,len){
			 
			 //purpose:for checking internet conection
				var online = window.navigator.onLine;
			  	if(!online)
			  	{
			  	alert("check your internet connection,please try agian after some time");
			  	return;
			  	}
			 var finalObj = {},skuIdsList = [],itemStatusList = [],pluCodesList = [],pricesList = [],qtysList = [],totalCostsList = [];
			
			 debugger
			 var contextPath = $("#contextPath").val();
			 
//			 $('.itemId').each(function() {
				  skuIdsList.push(skuID);  
//				});
			  
//			  $('.pluCode').each(function() {
				  pluCodesList.push(plucode);  
//				});  
			  
//			  $('.Pack').each(function() {
				  qtysList.push(qty);  
//				});
			  
//			  $('.price').each(function() {
				  pricesList.push(itemPrice);  
//				});
//			  $('.cost').each(function() {
				  totalCostsList.push(itemPrice);  
//				});
			  
//			  $('.itemStatus').each(function() {
				  itemStatusList.push("");  
//				});
			  
			var storeLocation = $("#outletLocation option:selected").text();
			
			var ApiKey=$("#b2cRequired").val();
			 
			 if(ApiKey=="Yes")
				 {
				 storeLocation="B2C";
				 }
			 else
				 {
				 storeLocation=storeLocation;
				 }
			
			var totalOrderCost = itemPrice;
			finalObj.qtyArrList=qtysList;
			finalObj.skuIdArrList=skuIdsList;
			finalObj.unitPriceArrList=pricesList;
			finalObj.totalPriceArrList=totalCostsList;
			finalObj.pluCodeArrList=pluCodesList;
			finalObj.storeLocation = storeLocation;
			finalObj.itemStatusArrList = itemStatusList;
			finalObj.totalBillAmount = totalOrderCost;
			finalObj.sku_id = skuID;
			var formData = JSON.stringify(finalObj);
			 URL = contextPath + "/orderManagement/getApplyCampaignDetails.do";
			 
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
		   				/*debugger
		   				alert(result)*/
		   				
		   				/* added by        :  koti bomminei
			   	 	      description     :  to display minimun sale quantity and related calculations added qty */
		   				
		   			appendDiscountsToItems(result,skuID,plucode,itemPrice,qty,len);
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
		
		 /* added by        :  koti bomminei
	 	      description     :  to display minimun sale quantity and related calculations added qty */
		 
		 function appendDiscountsToItems(discountList,skuID,plucode,itemPrice,qty,count)
		 {
			 debugger
//			 data=JSON.parse(JSON.stringify(discountList));
			 var parsedJson = jQuery.parseJSON(discountList);
			 var dealsDiscount =parsedJson.dealDiscount;
			 var discountIdList = parsedJson.discountIdArrayList;
			 var dealDiscountType = parsedJson.discountTypeArrayList;
			 var dealDescription = parsedJson.mProductDealDescription;
			 var availableOffers = parsedJson.availableOffers;
			 
			 var turnOverOffersDiscount = parsedJson.turnOverOfferDsiscount;
			 
//			 var offersList = parsedJson.offersList;
			 var offerDiscount = parsedJson.mProductOfferPrice;
			 var offerDiscountId = parsedJson.discountIdArrayList;
			 var offerDiscountType = parsedJson.mProductOfferType;
			 var offerDescription = parsedJson.mProductOfferDescription;
			/* var discountid = "01000,21215";
			 discountid.split(',');*/
			 if(discountIdList!="" && discountIdList!=null ){
			 for (i=0;i<discountIdList.length;i++){
				 var discountIds =discountIdList[i].toString().replace(/\"/g, "");
			 $("#discountIds"+count).append(discountIds);
//			 $("#discountIds"+count).attr("color:blue");
			 }
			 }
			 
			 if(dealDiscountType!=null)
				 for (i=0;i<dealDiscountType.length;i++){
			 $("#discountType"+count).val(dealDiscountType[i]);
				 }
			 
			 
			 var finaldealDiscount =0.0;
			 //caluclating Total item Discountss
			 if(dealsDiscount!="" && dealsDiscount!=null){
			for(var j=0;j<dealsDiscount.length;j++)
              {
				finaldealDiscount = finaldealDiscount+dealsDiscount[j];
//				dealsDiscount[j]+offerDiscount[j];
				
				   /*modified by koti bomineni
                 purpose to display minimum sal quantity and change on blur fnctn */
			debugger;
				
				$("#totalCost"+count).html((parseFloat(itemPrice)*parseFloat(qty))-parseFloat(dealsDiscount[j]));
              }
			 }
			 
			 var finalOfferDiscount =0.0;
			 if(offerDiscount!="" && offerDiscount!=null){
			for(var l=0;l<offerDiscount.length;l++)
              {
				finalOfferDiscount = finalOfferDiscount+offerDiscount[l];
//				dealsDiscount[j]+offerDiscount[j];
				
				
				
				
				$("#totalCost"+count).html((parseFloat(itemPrice)*parseFloat(qty))-parseFloat(offerDiscount[l]));
              }
			 }
			 var finalDiscount=finaldealDiscount+finalOfferDiscount;
			 
			 if(turnOverOffersDiscount>0.0)
				 {
				 var finalDiscount=finaldealDiscount+finalOfferDiscount+turnOverOffersDiscount;
				 }
			
			 
			 //for turnover offers
			 
			 
			 
			 
			 
		     var turnOverDisc = 0.0; 

             var fraction = 0; 
             var itemwiseDiscount =0.0;

//             $("#itemDiscountPrice"+count).text(finalDiscount);
			 if(turnOverOffersDiscount > 0.0)
			 {			
//			 if(count!=1){
//				 var calcTotalTurnover = turnOverOffersDiscount/count;
				 
				 var price =0.0;
				 var totalCost =0.0;
				 $('.price').each(function(){
					 debugger
					 var productName = $(this).attr("id").replace('totalCost','');
//					 var calitemPriceAfterDisc = $("#totalCost"+q).val();
					 var cost = $("#price"+productName).html();
					 price = price + parseFloat(cost);
				 });
				 
				 $('.cost').each(function(){
					 debugger
					 var productName = $(this).attr("id").replace('totalCost','');
//					 var calitemPriceAfterDisc = $("#totalCost"+q).val();
					 var cost = $("#totalCost"+productName).html();
					 totalCost = totalCost + parseFloat(cost);
				 });
				 
				     
				 for(var q=count;q>=1;q--)
					 {
					 
					 var calitemPriceAfterDisc = 0.0;
//					 $("#itemDiscountPrice"+count).text(finalDiscount);
					 calitemPriceAfterDisc = $("#totalCost"+q).html()-parseFloat(turnOverOffersDiscount);
					 
					 fraction = (parseFloat(calitemPriceAfterDisc) / parseFloat(totalCost)) * 100;  
	                 turnOverDisc = (parseFloat(turnOverOffersDiscount) * parseFloat(fraction).toFixed(2)) / 100;
	               
//					 var calitemPriceBeforeDisc = $("#itemPrice"+q).val();
//	                  itemwiseDiscount = $("#itemDiscountPrice"+q).val()+turnOverOffersDiscount;
					 $("#itemDiscountPrice"+q).text(turnOverDisc);

					 $("#totalCost"+q).html(parseFloat(totalCost)-parseFloat(turnOverOffersDiscount));
					 }
//			 }
			 
//			 $("#itemDiscountPrice"+count).text(calcTotalTurnover);
			 }
			 else
				 {
				 $("#itemDiscountPrice"+count).text(finalDiscount);
//				 $("#totalCost"+count).html(parseFloat(finalDiscount));
//				 $("#totalCost"+count).html(parseFloat(itemPrice)-parseFloat(finalDiscount));
				 }
//			 $("#totalCost"+count).val(itemPrice-finalDiscount);
			
			 
			 
			 //discount list for offers and deals
			 
			 if(discountIdList!=null)
			 for(var i=0;i<discountIdList.length;i++)
				 {
				 var discLen = parseInt($("#dicountlist tr").length)+1;
				 if (discLen != 1)
					 discLen = parseInt($("#dicountlist tr:last").attr("id").replace('discdynamicdiv', '')) + 1;
				 
				 
				 if(turnOverOffersDiscount>0.0)
				 {
					 var itemDiscountListPrice=0.0;
					 var itemTurnOverDiscount =0.0;
				 if(discountIdList[i].indexOf("OI")!=-1)
					 {
					 for(var s=count,t=i;s>=1,t>=1;s--,t--)
					 {
					 var calitemPriceAfterTurnoverDisc = 0.0;
//					 $("#itemDiscountPrice"+count).text(finalDiscount);
					 var itemWisePriceForCalDisc =0.0;
					 itemWisePriceForCalDisc = parseFloat($("#itemPrice"+count).html())-parseFloat(offerDiscount[t]);
					 calitemPriceAfterTurnoverDisc = itemWisePriceForCalDisc-turnOverOffersDiscount;
					 var calitemPriceBeforeTurnover = itemWisePriceForCalDisc;
//					 var calcTotalTurnover = turnOverOffersDiscount/count;
					 itemDiscountListPrice = (parseFloat(calitemPriceAfterTurnoverDisc) / parseFloat(calitemPriceBeforeTurnover)) * 100;  
					 itemTurnOverDiscount = (parseFloat(turnOverOffersDiscount) * parseFloat(itemDiscountListPrice).toFixed(2)) / 100;
//					 $("#discountPriceDisc"+5).val(itemTurnOverDiscount);
					 }
					 //					 if(r!=1)
					for(var r=discLen;r>=1;r--)
					 {
//						 var discountPriceDiscount = $("#discountPriceDisc"+r).val();
						 $("#discountPriceDisc"+r).val(itemTurnOverDiscount);
					 }
					 
					 var	 rowDisc	 = "<tr id='discdynamicdiv"+discLen+"' style='margin-top:5px;'><td  id='serialNumDisc"+discLen+"'>"+
							"<input type='hidden' id='serialNumDisc"+discLen+"'>"+
							"<input type='hidden' id='skuIdDisc"+discLen+"' value='"+skuID+"'>"+
							"<input type='hidden' id='pluCodeDisc"+discLen+"' value='"+plucode+"'/>"+
							"<input type='hidden' id='discountTypeDisc"+discLen+"'  value='"+dealDiscountType[i]+"' />" +
							"<input type='hidden' id='discountIdDisc"+discLen+"' value='"+offerDiscountId[i]+"'/>" +
							"<input type='hidden' id='discountPriceDisc"+discLen+"' value='"+itemTurnOverDiscount+"'/>" +
							"<input type='hidden' id='itemPriceDisc"+discLen+"' value='"+itemPrice+"'/>" +
							"</td>" +
							"<td id='DelDisc"+discLen+"' ><img id='Img"+ discLen +"' src='"+contextPath+"/images/itemdelete.png' style='width:15%;cursor:pointer;' onclick='deleteItem(this);'/>" +
							  "</td></tr>";
							 $("#dicountlist tbody").append(rowDisc);
						 
						 }
					 
					
	 		
				 if(discountIdList[i].indexOf("DI")!=-1)
				 {
					 var itemdealDiscountListPrice=0.0;
					 var itemdealTurnOverDiscount =0.0;
					 for(var s=count,t=i;s>=1,t>=1;s--,t--)
					 {
					 var calitemPriceAfterTurnoverDisc = 0.0;
//					 $("#itemDiscountPrice"+count).text(finalDiscount);
					 var itemWisePriceForCalDisc =0.0;
					 itemWisePriceForCalDisc = parseFloat($("#itemPrice"+count).html())-parseFloat(offerDiscount[t]);
					 calitemPriceAfterTurnoverDisc = itemWisePriceForCalDisc-turnOverOffersDiscount;
					 var calitemPriceBeforeTurnover = itemWisePriceForCalDisc;
//					 var calcTotalTurnover = turnOverOffersDiscount/count;
					 itemdealDiscountListPrice = (parseFloat(calitemPriceAfterTurnoverDisc) / parseFloat(calitemPriceBeforeTurnover)) * 100;  
					 itemdealTurnOverDiscount = (parseFloat(turnOverOffersDiscount) * parseFloat(itemDiscountListPrice).toFixed(2)) / 100;
//					 $("#discountPriceDisc"+5).val(itemTurnOverDiscount);
					 }
					 //					 if(r!=1)
					for(var r=discLen;r>=1;r--)
					 {
//						 var discountPriceDiscount = $("#discountPriceDisc"+r).val();
						 $("#discountPriceDisc"+r).val(itemdealTurnOverDiscount);
					 }
					 
					 
				var	 rowDisc	 = "<tr id='discdynamicdiv"+discLen+"' style='margin-top:5px;'><td  id='serialNumDisc"+discLen+"'>"+
			"<input type='hidden' id='serialNumDisc"+discLen+"'>"+
			"<input type='hidden' id='skuIdDisc"+discLen+"' value='"+skuID+"'>"+
			"<input type='hidden' id='pluCodeDisc"+discLen+"' value='"+plucode+"'/>"+
			"<input type='hidden' id='discountTypeDisc"+discLen+"'  value='"+dealDiscountType[i]+"' />" +
			"<input type='hidden' id='discountIdDisc"+discLen+"' value='"+offerDiscountId[i]+"'/>" +
			"<input type='hidden' id='discountPriceDisc"+discLen+"' value='"+itemdealTurnOverDiscount+"'/>" +
			"<input type='hidden' id='itemPriceDisc"+discLen+"' value='"+itemPrice+"'/>" +
			"</td>" +
			"<td id='DelDisc"+discLen+"' ><img id='Img"+ discLen +"' src='"+contextPath+"/images/itemdelete.png' style='width:15%;cursor:pointer;' onclick='deleteItem(this);'/>" +
			  "</td></tr>";
			 $("#dicountlist tbody").append(rowDisc);
				 
				 }
				 }
				 
				 else
					 {
					 
					 if(discountIdList[i].indexOf("OI")!=-1)
					 {
						
						 var	 rowDisc	 = "<tr id='discdynamicdiv"+discLen+"' style='margin-top:5px;'><td  id='serialNumDisc"+discLen+"'>"+
							"<input type='hidden' id='serialNumDisc"+discLen+"'>"+
							"<input type='hidden' id='skuIdDisc"+discLen+"' value='"+skuID+"'>"+
							"<input type='hidden' id='pluCodeDisc"+discLen+"' value='"+plucode+"'/>"+
							"<input type='hidden' id='discountTypeDisc"+discLen+"'  value='"+dealDiscountType[i]+"' />" +
							"<input type='hidden' id='discountIdDisc"+discLen+"' value='"+offerDiscountId[i]+"'/>" +
							"<input type='hidden' id='discountPriceDisc"+discLen+"' value='"+offerDiscount[i]+"'/>" +
							"<input type='hidden' id='itemPriceDisc"+discLen+"' value='"+itemPrice+"'/>" +
							"</td>" +
							"<td id='DelDisc"+discLen+"' ><img id='Img"+ discLen +"' src='"+contextPath+"/images/itemdelete.png' style='width:15%;cursor:pointer;' onclick='deleteItem(this);'/>" +
							  "</td></tr>";
							 $("#dicountlist tbody").append(rowDisc);
						 
						 }
					 
					
	 		
				 if(discountIdList[i].indexOf("DI")!=-1)
				 {
				var	 rowDisc	 = "<tr id='discdynamicdiv"+discLen+"' style='margin-top:5px;'><td  id='serialNumDisc"+discLen+"'>"+
			"<input type='hidden' id='serialNumDisc"+discLen+"'>"+
			"<input type='hidden' id='skuIdDisc"+discLen+"' value='"+skuID+"'>"+
			"<input type='hidden' id='pluCodeDisc"+discLen+"' value='"+plucode+"'/>"+
			"<input type='hidden' id='discountTypeDisc"+discLen+"'  value='"+dealDiscountType[i]+"' />" +
			"<input type='hidden' id='discountIdDisc"+discLen+"' value='"+offerDiscountId[i]+"'/>" +
			"<input type='hidden' id='discountPriceDisc"+discLen+"' value='"+dealsDiscount[i]+"'/>" +
			"<input type='hidden' id='itemPriceDisc"+discLen+"' value='"+itemPrice+"'/>" +
			"</td>" +
			"<td id='DelDisc"+discLen+"' ><img id='Img"+ discLen +"' src='"+contextPath+"/images/itemdelete.png' style='width:15%;cursor:pointer;' onclick='deleteItem(this);'/>" +
			  "</td></tr>";
			 $("#dicountlist tbody").append(rowDisc);
				 
				 }
			
					 
					 
					 
					 
					 
					 }
				 
				 
				 
				 
			 
				 }

//				getApplyCampignDetails(sku.skuId,sku.pluCode,sku.salePrice,"1",len);
				changeTotalQuantity();
				changeTotalCost();
//				getApplyCampignDetails(sku.skuId,sku.pluCode,sku.salePrice,len);
				changeorderTotal();
		 }	 
	  	 
		 
		 
		function getemployeeIdByName()
		 {
			 var selectedEmployeeId = $("#salesexecutivename option:selected").val();
			 $("#salesexecutiveid").val(selectedEmployeeId);
		 }
		
		function getNearestStore(){
			 debugger;
	  		 //purpose:for checking internet conection
	 		var online = window.navigator.onLine;
	 	  	if(!online)
	 	  	{
	 	  	alert("check your internet connection,please try agian after some time");
	 	  	return;
	 	  	}
	 	  	
	 	   if($("#latitude").val() != "" || $("#longitude").val() != ""){
	 		   var latitude=$("#latitude").val();
	 		   var longitude= $("#longitude").val();
	 		  var totalCost = $("#subtotal").val();
	 		 var finalObj = {};
	  			 finalObj.gpsLatitude = latitude;
	  			 finalObj.gpsLongitude = longitude;
	  			var formData = JSON.stringify(finalObj);
	 		 var contextPath = $("#contextPath").val();
			   URL = contextPath + "/orderManagement/getNearestLocation.do";
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
			  			debugger
			  			$("#loading").css("display","none");
						$("#mainDiv").removeClass('disabled');
						$("#ServiceAreaFlag").val("false");
			  			 var parsedJson = jQuery.parseJSON(result);  
			  			var responseHeader = parsedJson.responseHeader;
			  			if(responseHeader.responseCode=="0")
			  				{
			  			var data=parsedJson;
			  			var isHub=data.isHubLocation;
			  			var StoreLocation="";
			  			
			                if(isHub==false)
			                 	{
			                	if(data.nearestLocation!=undefined && data.nearestLocation!=null && data.nearestLocation!="")
			                		{
			                		StoreLocation=data.nearestLocation.locationId;
			                		}
			                 	  
			                 	 if(StoreLocation==""||StoreLocation==undefined||StoreLocation==null)
			                 		 {
			                 		 StoreLocation=data.storesList[0].locationId;
			                 		 }
			                 	 else
			                 		 {
			                 		 var isDefaultL=data.isDefaultLocation;
				                 	  if(isDefaultL==true)
				                 		  {
				                 		  	StoreLocation=StoreLocation;
				                 		  }
				                 	  else
				                 		  {
				                 		  	StoreLocation=data.nearestHubLocation.zoneID;
				                 		  }
			                 		 }
			                 	 
			                 	  
			                 	}
			                else if(isHub==true)
			                 	{
			                 		StoreLocation=data.nearestHubLocation.zoneID;
			                 	}
			                else
			                	{
			                	 
			                	}
			                //StoreLocation="SC03";
			                if(StoreLocation!=null && StoreLocation!=undefined && StoreLocation!="")
			                	{	
			                		$("#ServiceAreaFlag").val("true");
			                		//$("#outletLocation option:contains(" + StoreLocation + ")").attr('selected', 'selected').change();
			                		$("#outletLocation option:contains(" + StoreLocation + ")").prop('selected', true).change();
			                		$("#outletLocation option:contains(" + StoreLocation + ")").attr('selected', true).change();
			                		
			                	}
			                

			  				}
			  			else
			  				{
			  					$("#ServiceAreaFlag").val("false");
			  					$("#ServiceAreaError").html("We don't serve this area, Please choose another area");	
			  				}

					},
					error : function() {
						$("#ServiceAreaFlag").val("false");
						alert("something went wrong");
						$("#loading").css("display","none");
						$("#mainDiv").removeClass('disabled');
					}
			}); 
	 		  
	 	   }
 				
 				
 				
			
		}
		 
	  	 function getShipmentCost(){
	  		
	  		 debugger;
	  		 //purpose:for checking internet conection
	 		var online = window.navigator.onLine;
	 	  	if(!online)
	 	  	{
	 	  	alert("check your internet connection,please try agian after some time");
	 	  	return;
	 	  	}
	 	  	$("#ServiceAreaError").html("");
	 	  	
	 	   var serviceAreaRequired=$("#GoogleKeyId").val();
	 	   
	 	   if(serviceAreaRequired=="Yes")
	 		   {
	 		   getNearestStore();   //to get the nearest store;
	 		   }
	 	  	
	 	  
	 	  	var orderShipmentType = $("#orderDeliveryType").val();
	  		// $(".Error").html("");
	 	  	$("#ErrorForShipment").html("");
	 	  	$("#ErrorForShipment").val("");
	  		$("#shipmentChargesError").html("");
	  		 if($("#orderDeliveryType").val() == "Pick Up"){
	  			
	  			 $("#shipmentCharges").val(0);
//	  			var shipmentCost = $("#shipmentCharges").val();
	  			var totalCost = $("#subtotal").val();
//	  			if($('#shipmentCharges').val()!="")
//	  				totalCost = parseFloat(totalCost) + parseFloat(shipmentCost);
	  			$('#orderTotalCost').val(totalCost);
	  		 }else{
	  			 var finalObj = {};
	  			/* finalObj.shipmentMode = $("#shipmentMode").val();
	  			 finalObj.shipmentType = $("#shipmentType").val();*/
	  			 finalObj.shipmentLatitude = $("#latitude").val();
	  			 finalObj.shipmentLongitude = $("#longitude").val();
	  			 var totalCost = $("#subtotal").val();
	  			 var taxvalue =  parseFloat($("#totalTax").val());
	  			 
	  			 
	  			 if(taxvalue == "")
	  				 	taxvalue = 0;
		  			 else
		  				taxvalue = parseFloat(taxvalue);
		  			 
	  			 
	  			 if(totalCost == "")
	  				totalCost = 0;
	  			 else
	  				totalCost = parseFloat(totalCost);
	  			 
	  			 
	  			 
//	  			 if($("#shipmentCharges").val() != "")
//	  				totalCost = totalCost - parseFloat($("#shipmentCharges").val());
	  			 if(totalCost <= 0){
	  				 $("#shipmentCharges").val(0);
	  				var totalCost = parseFloat($("#subtotal").val());
	  				totalCost=totalCost+taxvalue;
	  				$('#orderTotalCost').val(totalCost);
	  				 return;
	  			 }
	  			/* var orderTax = $("#totalTax").val(); 
	  			$('#orderTotalCost').val(orderTax);*/
	  			if(serviceAreaRequired=="Yes")
		 		   {
	  				 if($("#latitude").val() == "" || $("#longitude").val() == ""){
	 	  				$("#shipmentCharges").val("");
	 	  				
	 	  				var totalCost = $("#subtotal").val();
	 	  				$('#orderTotalCost').val(totalCost);
	 	  				$("#returnStatus").val("false");
	 	  				 $("#Error").html("Could not find Latitude and Longitude of Shipment Address");
	 	  				 focusDiv('Error');
	 	  				 return;
	 	  			 }
		 		   }
	  			else
	  				{
	  				 var totalCost = parseFloat($("#subtotal").val());
	  				totalCost=totalCost+taxvalue;
 	  				 $('#orderTotalCost').val(totalCost);
 	  				 $("#returnStatus").val("false");
 	  				 return;
	  				}
	  			
	  			 finalObj.orderValue = totalCost;
//	  			 finalObj.toLocationCountry = $("#shipmentCountry").val();
//	  			 finalObj.toLocationState = $("#shipmentState").val();
//	  			 finalObj.storeLocation = $("#outletLocation option:selected").text();
	  			 /*if($("#totalQty").val() != "")
	  				finalObj.orderQtyValue = $("#totalQty").val()*/
	  			var formData = JSON.stringify(finalObj);
//	  			console.log(formData);
				var contextPath = $("#contextPath").val();
			   URL = contextPath + "/orderManagement/getShipmentPrice.do";
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
			  			debugger
			  			 var parsedJson = jQuery.parseJSON(result);  
			  			var responseHeader = parsedJson.responseHeader;
//			  			alert(responseHeader.responseCode)
			  			if(responseHeader.responseCode == -1 && orderShipmentType == "Door Delivery")
			  				{
//			  				alert(responseHeader.responseMessage)
			  				$("#ErrorForShipment").html(responseHeader.responseMessage);
			  				$("#returnStatus").val("false");
			  				focusDiv('ErrorForShipment');
			  				$("#loading").css("display","none");
							$("#mainDiv").removeClass('disabled');
			  				return false ;
			  				}
			  			else
			  				{
			  				$("#returnStatus").val("true");
			  				}
			  			
			  			
			  			/* removed  by        :  koti bomminei
				  	      description     :  to display minimun sale quantity and related calculations added qty and not to display the data from database*/ 
			  			
			  	
		  				/* if(parsedJson.shipmentCost != undefined && parsedJson.shipmentCost != null)
		  					$("#shipmentCharges").val(parsedJson.shipmentCost);
		  				 else
		  					$("#shipmentCharges").val("");
		  				if(parsedJson.errorMessage != undefined && parsedJson.errorMessage != null && parsedJson.errorMessage != ""){
		  					$("#shipmentChargesError").html(parsedJson.errorMessage);
		  					focusDiv('shipmentChargesError');
		  				}*/
			  			var shipmentCost = $("#shipmentCharges").val();
			  			
			  			
			  			//written by manasa to caluclate taxes amount
			  			var totalTax = $("#totalTax").val();
			  			
//			  			var cgstAmt = $("#cgstAmt").val();
//			  			var sgstAmt = $("#sgstAmt").val();
//			  			
			  			var totalCost = $("#subtotal").val();
			  			if($('#shipmentCharges').val()!="")
			  				totalCost = parseFloat(totalCost) + parseFloat(shipmentCost)+ parseFloat(totalTax);
			  			
			  			dueAmount
			  			//commented becasuse by defalut tax is inclusive 
			  			/*if($('#totalTax').val()!="")
			  				totalCost = parseFloat(totalCost) + parseFloat(totalTax);*/
			  			
			  			/*if($('#cgstAmt').val()!="")
			  				totalCost = parseFloat(totalCost) + parseFloat(cgstAmt);
			  			
			  			if($('#sgstAmt').val()!="")
			  				totalCost = parseFloat(totalCost) + parseFloat(sgstAmt);*/
			  			
			  			$('#orderTotalCost').val(totalCost);
			  			$('#dueAmount').val(totalCost);
//			  				appendCustomerDetails(result);
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
	  	 
	  	function validateMobileNumberForOrders()
	    	{
	    		var phoneNumber = $("#phoneNumber").val();
	    		
	    		if(phoneNumber == "")
	    			{
	    			$("#customerContactNum").val("");
	    			$("#billingMobileNo").val("");
	    			}
	    		if(phoneNumber!=""){
	    		if(phoneNumber.length == 10){
//	     			$("#phoneNumberError").html("Enter 10 digits Numbers");
	    			$("#customerContactNum").val(phoneNumber);
	    			$("#billingMobileNo").val(phoneNumber);
	     			return true;
	     		}
	    		else
	    			{
	    			$("#phoneNumberError").html("Enter 10 digits Mobile Number");
	    			return false;
	    			}
	    		
	    	}
	    	}
	  	 
	  	 
$('#deliveryDate').calendarsPicker({ 
	        onClose: function(dates) {
	        	debugger;
	        	var today = new Date();
				var dd = String(today.getDate()).padStart(2, '0');
				var mm = String(today.getMonth() + 1).padStart(2, '0'); //January is 0!
				var yyyy = today.getFullYear();

				today = dd + '/' + mm + '/' + yyyy;
				today=today.toString();
				
				var deliveryDate=$("#deliveryDate").val();
				deliveryDate=deliveryDate.toString();
				if(deliveryDate==today)
					{
					//alert('same date');
					$("#deliverySlotStartTime").css("display","block");
					$("#deliverySlotStartTime").prop('disabled', false);
					$("#deliverySlotEndTime").css("display","block");
					$("#deliverySlotEndTime").prop('disabled', false);
					$("#deliverySlotStartTime2").css("display","none");
					$("#deliverySlotStartTime2").prop('disabled', true);
					$("#deliverySlotEndTime2").css("display","none");
					$("#deliverySlotEndTime2").prop('disabled', true);
					}	
				else
					{
					//alert('not same date');
					$("#deliverySlotStartTime").css("display","none");
					$("#deliverySlotStartTime").prop('disabled', true);
					$("#deliverySlotEndTime").prop('disabled', true);
					$("#deliverySlotEndTime").css("display","none");
					$("#deliverySlotStartTime2").css("display","block");
					$("#deliverySlotEndTime2").css("display","block");
					$("#deliverySlotStartTime2").prop('disabled', false);
					$("#deliverySlotEndTime2").prop('disabled', false);
					}
	        	//alert('Closed with date(s): ' + dates);
	        	
	        },dateFormat: 'dd/mm/yyyy' ,yearRange: 'any',showTrigger: '#calImg'});
	  	
$('#confirmDate1').calendarsPicker({ 
    onClose: function(dates) {
    	debugger;
    	var today = new Date();
		var dd = String(today.getDate()).padStart(2, '0');
		var mm = String(today.getMonth() + 1).padStart(2, '0'); //January is 0!
		var yyyy = today.getFullYear();

		today = dd + '/' + mm + '/' + yyyy;
		today=today.toString();
		
		var confirmDate=$("#confirmDate1").val();
		confirmDate=confirmDate.toString();
		if(confirmDate==today)
			{
			$("#confirmedSlotStartTime").css("display","block");
			$("#confirmedSlotStartTime").prop('disabled', false);
			$("#confirmedSlotEndTime").css("display","block");
			$("#confirmedSlotEndTime").prop('disabled', false);
			$("#confirmedSlotStartTime2").css("display","none");
			$("#confirmedSlotStartTime2").prop('disabled', true);
			$("#confirmedSlotEndTime2").css("display","none");
			$("#confirmedSlotEndTime2").prop('disabled', true);
			}	
		else
			{
			$("#confirmedSlotStartTime").css("display","none");
			$("#confirmedSlotStartTime").prop('disabled', true);
			$("#confirmedSlotEndTime").css("display","none");
			$("#confirmedSlotEndTime").prop('disabled', true);
			$("#confirmedSlotStartTime2").css("display","block");
			$("#confirmedSlotStartTime2").prop('disabled', false);
			$("#confirmedSlotEndTime2").css("display","block");
			$("#confirmedSlotEndTime2").prop('disabled', false);
			}
    	//alert('Closed with date(s): ' + dates);
    	
    },dateFormat: 'dd/mm/yyyy' ,yearRange: 'any',showTrigger: '#calImg'});
	
		  	
	  	 function changeShipmentCharges(){
	  		if($("#orderDeliveryType").val() == "Pick Up"){
	  			 $("#shipmentCharges").attr("readonly","readonly");
	  		 }else{
	  			 $("#shipmentCharges").removeAttr("readonly")
	  			 getShipmentCost();	  			 
	  		 }
	  	 }
	  	function getOrderPieChartData(){
	  		var salesExecutiveCount = $("#ordersummary").val();
	  		var orderPieChartData = [];
	  		     for(var i = 0; i<salesExecutiveCount;i++){
	  		    	var obj = {label:$("#workflowId"+i).val(),value:parseInt($("#workflowOrders"+i).val())};
	  		    	orderPieChartData.push(obj);
	  		     }    
	  		return orderPieChartData;
	  		}
	  	
	  	function startTimeChange(count,id){
	  		debugger;
	  		var i = count+1;
	  		$('#'+id+' :nth-child('+i+')').prop('selected', true);
	  	
	  		
	  		}
	  	$(".searchItemsNewOrder").bind('input', function () {
	  		 try{
	  			 debugger;
	  			var online = window.navigator.onLine;
				  	if(!online){
				  	alert("Check your internet connection,Please try agian after some time.");
				  	return;
				  	} 
				  	
				  	$(".Error").html("");
				  	$("#searchItemsErrorID").html("");
				  	$("#searchItemsErrorIDdiscounts").html("");
	   				 var searchName = $(this).val().trim();
	   				 if(searchName!=""){ 
	   					 
	   				if($("#searchScan").is(':checked'))
	   					 {
	   						var searchName = $(this).val().trim();
	   						if(searchName.length>=13 || searchName.length>=7)
	   							{
	   							getSkuDetailsNewOrder(searchName,"");
	   							}
	   						else
	   							{
	   							
	   							}
							
	   					 }
		   			else
		   				 {
		   			 if(searchName!=""&&searchName.length>=3){
		   					$(this).siblings("div").show();
		   					 var searchCategory = $(this).siblings("div").children("div").children("ul").attr("class").replace('matchedStringUl ','');
		   					 if(searchCategory=="offersellskus" || searchCategory=="offersellskusgroup" || searchCategory == "offersellskusExclude"){   	
		   						var location = $('#offerLocation').val();
		   						if(location==null){
		   							alert("Please Select location...");
		   	   	   				  	return;
		   						}  			
		   					 }
		   					 
		   					 var latitude=$("#latitude").val();
		   					 var longitude=$("#longitude").val();
		   					  var serviceAreaFlag=$("#ServiceAreaFlag").val();
		   					  var serviceAreaRequired=$("#GoogleKeyId").val();
		   					  
		   					  if(serviceAreaRequired=="No")
		   						  {
			   						if (searchCategory == "apparel" || searchCategory == "brandMasterProduct" || searchCategory == "receipt" || searchCategory == "dealProduct" || searchCategory == "dealProductsList" || searchCategory == "editDealProduct" || searchCategory == "editDealProductsList" || searchCategory == "productName" || searchCategory == "offersellproducts" || searchCategory == "editproductList" || searchCategory == "productNameSku" || searchCategory == "itemname" || searchCategory == "request" || searchCategory == "offersellskus" || searchCategory == "offersellskusExclude" || searchCategory == "offersellskusgroup" || searchCategory == "payments" || searchCategory == "salespayments"  || searchCategory == "debitNoteItems"  ) 
			   							searchProductsNewOrder(searchName, searchCategory);
			   						 
		   						  }
		   					  else
		   						  {
		   					 if(latitude!=null && latitude!="" && latitude!=undefined && longitude!=null && longitude!="" && longitude!=undefined && serviceAreaFlag!="" && serviceAreaFlag!="false")
		   						 {
		   							if (searchCategory == "apparel" || searchCategory == "brandMasterProduct" || searchCategory == "receipt" || searchCategory == "dealProduct" || searchCategory == "dealProductsList" || searchCategory == "editDealProduct" || searchCategory == "editDealProductsList" || searchCategory == "productName" || searchCategory == "offersellproducts" || searchCategory == "editproductList" || searchCategory == "productNameSku" || searchCategory == "itemname" || searchCategory == "request" || searchCategory == "offersellskus" || searchCategory == "offersellskusExclude" || searchCategory == "offersellskusgroup" || searchCategory == "payments" || searchCategory == "salespayments"  || searchCategory == "debitNoteItems"  ) 
		   							searchProductsNewOrder(searchName, searchCategory);
		   						 }
		   					 else
		   						 {
		   						 	$("#searchItemsErrorID").html("Please choose or enter shipment address");
		   						 } 
		   					 }
		   				 }
		   				 }
	   				
	   				 }
	  		 	}
		 		catch(e)
		 		{
		 			errorCode(e);
		 		}
	  	});
	  	
	  	
	  	
	  /*	$(".menuItemsBarClick").bind('input', function () {
	  		 try{
	  			 debugger;
	  			var online = window.navigator.onLine;
				  	if(!online){
				  	alert("Check your internet connection,Please try agian after some time.");
				  	return;
				  	} 
				  	
				  	$(".Error").html("");
				  	$("#searchItemsErrorID").html("");
		   					 
		   					 var latitude=$("#latitude").val();
		   					 var longitude=$("#longitude").val();
		   					  var serviceAreaFlag=$("#ServiceAreaFlag").val();
		   					  var serviceAreaRequired=$("#GoogleKeyId").val();
		   					  
		   					  if(serviceAreaRequired=="No")
		   						  {
		   						getOrdersMenuDetails("");
		   						  }
		   					  else
		   						  {
		   					 if(latitude!=null && latitude!="" && latitude!=undefined && longitude!=null && longitude!="" && longitude!=undefined && serviceAreaFlag!="" && serviceAreaFlag!="false")
		   						 {
		   						getOrdersMenuDetails("");
		   						 }
		   					 else
		   						 {
		   						 	$("#searchItemsErrorID").html("Please choose or enter shipment address");
		   						 } 
		   					 }
	   				
	  		 	}
		 		catch(e)
		 		{
		 			errorCode(e);
		 		}
	  	});*/
	  	
	  	
	  	function searchProductsNewOrder(name,searchCategory){
	  		debugger;
	  		 //purpose:for checking internet conection
	  		var online = window.navigator.onLine;
	  	  	if(!online)
	  	  	{
	  	  	alert("check your internet connection,please try agian after some time");
	  	  	return;
	  	  	}
	  		 var contextPath = $("#contextPath").val();
	  		 var storeLocation = $("#outletLocation option:selected").text();
	  		 
	  		 var type = $("#outletLocation").val();
	  		var ApiKey=$("#b2cRequired").val();
			 
			 if(ApiKey=="Yes")
				 {
			    type = "Retail Outlet";
				 }
			 else
				 {
				 storeLocation=storeLocation;
				 }
	  		 
	  		 
	  		 if(type == "Warehouse")
	  			 URL = contextPath + "/inventorymanager/searchWarehouseProducts.do";
	  		 else if(type == "Retail Outlet" || type == "Restaurant")
	  			 URL = contextPath + "/inventorymanager/searchProducts.do";
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
	  					appendProductsNewOrder(result,searchCategory);
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
	  	
	  	
	  	function appendProductsNewOrder(productsList,searchCategory){
	  		debugger;
	  		/* $("#skuList").html('');
	  		 var op = '';
	  		 for(var i=0;i<productsList.length;i++){
	  			 op += '<option value="'+productsList[i].skuID+'">'+productsList[i].description+'</option>';
	  		 }
	  		 $("#skuList").html(op);
	  		 $("#skuList").show();*/
	  		/*<a data-toggle="modal" data-target="#items-modal">*/
	  		
	  		
	  		 $("."+searchCategory).html('');
	  		 var op = '';
	  		 for(var i=0;i<productsList.length;i++){
	  			
	  			 if(productsList[i].color==null)
					 productsList[i].color="";	 
				if(productsList[i].size==null)
					 productsList[i].size="";
	  			 
	  			if(productsList[i].price==null || productsList[i].price=="" || productsList[i].price==undefined)
					productsList[i].price=0;
				if(productsList[i].category==null)
					productsList[i].category="";
					
				if(productsList[i].quantityInHand=="" || productsList[i].quantityInHand==undefined || productsList[i].quantityInHand== null)
					productsList[i].quantityInHand=0;
				if(productsList[i].reorderPoint=="" || productsList[i].reorderPoint==undefined || productsList[i].reorderPoint== null)
					productsList[i].reorderPoint=0;
				
				
				if(productsList[i].mrp=="" || productsList[i].mrp==undefined || productsList[i].mrp== null)
					productsList[i].mrp=0;
	  			 
	  			 
	  			 
	  			 if(productsList[i].skuID == productsList[i].description){
	  				 if (i == 0) {
	  					 op += '<li id="'+productsList[i].pluCode+'"  class="selected" onclick=getIdNewOrder(this,"'+searchCategory+'"); ><a><label style="width: 5%;">'+productsList[i].skuID+'</label> &nbsp &nbsp &nbsp &nbsp   <label style="width: 30%;">'+productsList[i].productName+' </label> &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp   <label style="width: 5%;">  '+productsList[i].quantityInHand+'</label> &nbsp &nbsp &nbsp &nbsp   <label style="width: 5%;">'+productsList[i].mrp+' </label> &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp   <label style="width: 5%;">  '+productsList[i].price+'</label>&nbsp &nbsp &nbsp &nbsp  <label style="width: 5%;"> '+productsList[i].reorderPoint+'</label> &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp   <label style="width: 5%;"> '+productsList[i].color+'</label>  &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp     '+productsList[i].size+'</a></li>';
	  				}else
	  					 op += '<li id="'+productsList[i].pluCode+'"   onclick=getIdNewOrder(this,"'+searchCategory+'"); ><a><label style="width: 5%;">'+productsList[i].skuID+'</label> &nbsp &nbsp &nbsp &nbsp   <label style="width: 30%;">'+productsList[i].productName+' </label> &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp   <label style="width: 5%;">  '+productsList[i].quantityInHand+'</label> &nbsp &nbsp &nbsp &nbsp   <label style="width: 5%;">'+productsList[i].mrp+' </label> &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp   <label style="width: 5%;">  '+productsList[i].price+'</label>&nbsp &nbsp &nbsp &nbsp  <label style="width: 5%;"> '+productsList[i].reorderPoint+'</label> &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp   <label style="width: 5%;"> '+productsList[i].color+'</label>  &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp     '+productsList[i].size+'</a></li>';
	  		 	}
	  			 else{
	  				 if (i == 0) {
	  					 op += '<li id="'+productsList[i].pluCode+'"  class="selected" onclick=getIdNewOrder(this,"'+searchCategory+'"); ><a><label style="width: 5%;">'+productsList[i].skuID+'</label> &nbsp &nbsp &nbsp &nbsp   <label style="width: 30%;">'+productsList[i].productName+' </label> &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp   <label style="width: 5%;">  '+productsList[i].quantityInHand+'</label> &nbsp &nbsp &nbsp &nbsp   <label style="width: 5%;">'+productsList[i].mrp+' </label> &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp   <label style="width: 5%;">  '+productsList[i].price+'</label>&nbsp &nbsp &nbsp &nbsp  <label style="width: 5%;"> '+productsList[i].reorderPoint+'</label> &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp   <label style="width: 5%;"> '+productsList[i].color+'</label>  &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp     '+productsList[i].size+'</a></li>';
	  				}else
	  					 op += '<li id="'+productsList[i].pluCode+'"   onclick=getIdNewOrder(this,"'+searchCategory+'"); ><a><label style="width: 5%;">'+productsList[i].skuID+'</label> &nbsp &nbsp &nbsp &nbsp   <label style="width: 30%;">'+productsList[i].productName+' </label> &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp   <label style="width: 5%;">  '+productsList[i].quantityInHand+'</label> &nbsp &nbsp &nbsp &nbsp   <label style="width: 5%;">'+productsList[i].mrp+' </label> &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp   <label style="width: 5%;">  '+productsList[i].price+'</label>&nbsp &nbsp &nbsp &nbsp  <label style="width: 5%;"> '+productsList[i].reorderPoint+'</label> &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp   <label style="width: 5%;"> '+productsList[i].color+'</label>  &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp     '+productsList[i].size+'</a></li>';
	  			 }
	  		 }
	  		 $("."+searchCategory).html(op);
	  		 $("."+searchCategory).show();
	  	}
	  	
	  	function getIdNewOrder(element,type){
	  		var description = null;
	  		var id= $(element).attr("id");
	  		//$(".popup-display").css("display","none");
	  		//alert($("#"+id).children("a").text());
	  		description =  $("#"+id).children("a").text();
	  		description = description.split(' ( ');
	  		description = description[0];
	  		$("#desc").val(description);
	  		if(type == "receipt")
	  			getSkuDetailsNewOrder(id,description);
	  		else
	  			addProductToColumn(id);
	  	/*	else if(type == "receipt")
	  			getSkuDetails(id);*/
	  		 $(".services").hide();
	  		 $("."+type).html("");
	  	}

	  	function getSkuDetailsNewOrder(skuId,description){
	  		debugger;
	  		 //purpose:for checking internet conection
	  		var online = window.navigator.onLine;
	  	  	if(!online)
	  	  	{
	  	  	alert("check your internet connection,please try agian after some time");
	  	  	return;
	  	  	}
	  	  	
	  	  $('#Error').html("");
          $("#ErrorforMenu").html("");
          $("#SuccessforMenu").html("");

	  		// var materialName = $('#searchCriteria').val();
	  		$("#desc").val(description);
	  		 var contextPath = $("#contextPath").val();
//	  		 var storeLocation = $("#outletLocation").val();
	  		 var storeLocation = $("#outletLocation option:selected").text();
	  		 
	  		var ApiKey=$("#b2cRequired").val();
			 var type = $("#outletLocation").val();
			 if(ApiKey=="Yes")
				 {
				type = "Retail Outlet";
				 }
			 else
				 {
				 storeLocation=storeLocation;
				 }
	  		 
              var WarehouseReturnflag=$("#whreturnflag").val();
                if(WarehouseReturnflag == "" || WarehouseReturnflag == undefined || WarehouseReturnflag == null){
                        WarehouseReturnflag="";
                   }

	  		 
	  		
	  		 if(type == "Warehouse")
	  			 URL = contextPath + "/inventorymanager/getWarehouseSkuDetails.do";
	  		 else if(type == "Retail Outlet" || type == "Restaurant")
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
		             if(result != ""){
	  	  			appendSkuDetailsNewOrder(result,storeLocation);
	}else{
		$('#Error').html("SKU is not available in the given Location");
    $("#ErrorforMenu").html("SKU is not available in the given Location");
}
		             	//$('#menuItemsModal').modal('hide');
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
	  	function appendSkuDetailsNewOrder(skuDetails,storeLocation){
	  		debugger;
	  		 var parsedJson = jQuery.parseJSON(skuDetails);  
	  		 $("#searchItems").val("");
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
	  						var row = '<tr id=price'+i+' style="margin-top:5px;cursor:pointer" onclick=getPriceNewOrder(this) ><td>'+skuList[i].description+'</td><td>'+price+'</td></tr>';
	  						$("#itemsList tbody").append(row);
	  					}
	  				}
	  				var  op = '<a id="selectPrice"  data-toggle="modal" data-target="#items-modal"></a>';
	  				 $("#triggerEvent").append(op);
	  				 $("#selectPrice" ).trigger( "click" );
	  				 $("#triggerEvent").html("");
	  			}
	  			else{
	  				addItemNewOrder(skuList[0],storeLocation);
	  			}
	  	}

	  	function getPriceNewOrder(ele){
	  		var id = $(ele).attr("id");
	  		id = id.replace('price','');
	  		$(".modal-backdrop").trigger("click");
	  		var storeLocation = $("#outletLocation option:selected").text();
	  		 
	  		var ApiKey=$("#b2cRequired").val();
			 
			 if(ApiKey=="Yes")
				 {
				 storeLocation="B2C";
				 }
			 else
				 {
				 storeLocation=storeLocation;
				 }
	  		addItemNewOrder(skuList[id],storeLocation);
	  	}
	  	
	  	
	  	var taxationitems =[];
	  	var objTaxes=null;
	  	var sgsttaxItems =[];
	  	var objSgstTax = null;
	  	var objGstTaxes =null;
	function addItemNewOrder(sku,storeLocation){
		debugger;
		
	if(sku.zeroStock==false)
		{
		if((sku.quantity-sku.blockedQuantity) <= 0){	
			$("#Error").html("Item is out of Stock in    "+storeLocation);
			
			$("#ErrorforMenu").html("Item is out of Stock in    "+storeLocation);
			
			focusDiv('Error');
			return;
			}
		}
		
		
	  		 var contextPath = $("#contextPath").val();
	  		 var len = parseInt($("#productsList tr").length);
	  		 
	  		$("#searchItemsErrorID").html("");
	  		 debugger;
	  		 		if (len != 1)
	  				len = parseInt($("#productsList tr:last").attr("id").replace('dynamicdiv', '')) + 1;
	  			for (var i = 1; i <= len; i++) {
	  				
	  				
	  			
	  			/*var	skuIdsList = [],itemStatusList = [],pluCodesList = [],pricesList = [],qtysList = [],totalCostsList = [];
	  			skuIdsList.push(sku.skuId);  
	  			console.log(skuIdsList)*/
	  				debugger;
	  				if ($("#skuId" + i).val() == sku.skuId && $("#itemPrice"+i).text() == sku.price) {
	  					var CurQty=parseInt($("#confirmQuantity"+i).text());
	  					var CurQty2=parseInt($("#orderedQuantity"+i).text());

	  					
	  					if(sku.zeroStock==false)
	  						{
	  							if(CurQty<=(sku.quantity).toFixed(2))
	  								{
	  								if((CurQty+1)>(sku.quantity).toFixed(2))
										{
	  									$("#searchItemsErrorID").html("Item is out of Stock");
											return;
										}
									else
										{
										
										}
	  								}
	  							else{
	  									$("#searchItemsErrorID").html("Item is out of Stock");
	  									return;
	  								}
	  						}
	  					
	  					var pack =  parseInt($("#confirmQuantity"+i).text())+1;
	  					var pack2 =  parseInt($("#orderedQuantity"+i).text())+1;

	  					debugger;
	  					//written by manasa
	  					//purpose:to caluclate taxrates and taxamount

	  	   			 $("#confirmQuantity"+i).text(pack);
	  	   			 $("#orderedQuantity"+i).text(pack2);

	  	   			 var cost =  parseFloat($("#itemPrice"+i).text());
	  	   			 var plucode =  $("#pluCode"+i).val();
	  	   			 var taxRate = parseFloat($("#tax"+i).text());
	  	   			 var itemWiseDiscount =0.0;
	  	   			itemWiseDiscount = parseFloat($("#itemDiscountPrice"+i).html());
	  	   			 
	  	   			var taxAmtFixed=(taxRate*pack);
	  	   			var taxExclusive = $("#taxExclusive"+i).val();
	  	   			var totalCostValue = cost*pack;
	  	   			var taxAmt = (pack*cost*taxRate)/100;
	  	   			 
	  	   			if(taxExclusive == 'false' || taxExclusive == 'true')
	  	   				var taxAmt = parseFloat(totalCostValue - (totalCostValue * ( 100 / ( 100 + parseFloat(taxRate))))).toFixed(2);
	  	   				else
	  	   				var taxAmt=(taxRate*pack*cost)/100;	

	  	   			 $("#totalCost"+i).text(pack*cost-parseFloat(itemWiseDiscount));
	  	   			 
	  	   			 
	  	   			 var taxeslen = $("#taxationlist tr").length;
	  	 			for(var j=0;j<taxeslen;j++){
	  	 				var taxidAttr = $("#taxationlist tr:eq("+j+") td:last").attr("id");
	  	 				taxidAttr = taxidAttr.replace('DelTax','');
	  	 				var plucodeTax = $('#pluCodeTax'+taxidAttr).val();
	  	 				var cgstTaxRate = $('#taxTax'+taxidAttr).val();
	  	 				var taxCode = $('#taxTaxcode'+taxidAttr).val();
	  	 				var taxType = $('#taxTaxType'+taxidAttr).val();
	  	 				
	  	 				if(taxExclusive == false || taxExclusive == true){
	  						if(taxType == 'Percentage')
	  						$('#taxTaxAmt'+taxidAttr).val(parseFloat((cgstTaxRate*pack*cost)/100).toFixed(2));
	  						}	
	  						else
	  						$('#taxTaxAmt'+taxidAttr).val(parseFloat(taxAmt/2).toFixed(2));
	  	 				

	  	 				
	  	 				
	  					if(taxType == 'Percentage')
	  					$('#taxAmt'+i).html(taxAmt);
	  					else
	  					$('#taxAmt'+i).html(taxAmtFixed);	
	  	 			}

	  	   			 changeTotalQuantity();
	  	   			 changeTotalCost();
	  	   			 changeorderTotal();
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
	  			
	  			
	  			var measureRange = sku.measureRange;
	  			if(measureRange == "" || measureRange == null)
	  				measureRange = "";
	  			
	  			
	  			var brand = sku.brandCode;
	  			if(brand == null)
	  				sku.brandCode = "";
	  			
	  			var hsnCode = sku.hsnCode;
	  			if(hsnCode == null ||hsnCode=="")
	  				sku.hsnCode = "";
	  			
	  			//written by manasa
	  			//purpose:to caluclate taxrates and taxamount
	  			
	  			
	  			var category = sku.category;
	  			if(category == null)
	  				sku.category = "";
	  			var subCategory = sku.subCategory;
	  			if(subCategory == null)
	  				sku.subCategory = "";
	  			var productRange = sku.productRange;
	  			if(productRange == null)
	  				sku.productRange = "";
	  			var measureRange = sku.measureRange;
	  			if(measureRange == null || measureRange =="")
	  				measureRange = "";
	  			else
	  				measureRange = sku.measureRange+sku.uom;
	  			
	  			var hsnCode = sku.hsnCode;
	  			if(hsnCode == null)
	  				sku.hsnCode = "";
	  			var ean = sku.ean;
	  			if(ean == null)
	  				sku.ean = "";
	  			var utility = sku.utility;
	  			if(utility == null)
	  				sku.utility = "";
	  			var department = sku.department;
	  			if(department == null)
	  				sku.department = "";
	  			var subDepartment = sku.subDepartment;
	  			if(subDepartment == null)
	  				sku.subDepartment = "";
	  			
	  			var section = sku.section;
	  			if(section == null)
	  				sku.section = "";
	  			
	  			
	  			if(sku.min_sale_qty == null || sku.min_sale_qty == "" || sku.min_sale_qty == undefined){
	  				sku.min_sale_qty =1;
	  			}
	  			
	  			var tax = sku.tax;
	  			var taxRate=0.0;
	  			if(tax!=null)
	  				if(tax.length>0){
//	  					var alltaxCode = taxRate[0].taxCode;
	  					
	  					if(tax[0].taxType != "Percentage")
	  				 taxRate=tax[0].taxRate;
	  					else
	  				 taxRate=tax[0].taxRate*2;
	  				}
	  			
	  			
	  			
	  			
	  			 var  taxamount=0.0;
	  			 
	  			 if(sku.itemTaxExclusive == false || sku.itemTaxExclusive == true){
	  				 
	  				 if(tax!=null)
	  						if(tax.length>0){
	  							if(tax[0].taxType == "Percentage")
	  							taxamount = parseFloat(sku.salePrice - (sku.salePrice * ( 100 / ( 100 + parseFloat(taxRate))))).toFixed(2);
//	  							taxamount = parseFloat(((sku.salePrice)*taxRate)/100).toFixed(2);
	  							 if(tax[0].taxType == "Fixed")
	  								 taxamount = tax[0].taxRate;
	  						}
	  					}
	  				 
	  				/*if(tax!=null)
	  					if(tax.length>0){
	  						if(tax[0].taxType == "Percentage")
	  						taxamount = parseFloat(((sku.salePrice)*taxRate)/100).toFixed(2);
	  						 if(tax[0].taxType == "Fixed")
	  							 taxamount = tax[0].taxRate;
	  					}*/
	  			 else
	  				{
	  				 if(tax!=null)
	  						if(tax.length>0){
	  							if(tax[0].taxType == "Percentage")
	  							taxamount = parseFloat(((sku.salePrice)*taxRate)/100).toFixed(2);
	  							 if(tax[0].taxType == "Fixed")
	  								 taxamount = tax[0].taxRate;
	  						}
	  				}

	  					
	  				 
	  		
	  			var slNo = 1; 
	  			 $('.slno').each(function(){
	  				$(this).text(slNo);
	  				slNo = parseInt(slNo) + 1;
	  			});
	  			 
	  			 
	  			
	  			 debugger
	  			 if(tax.length>0){
	  				 var sNo = 1;
	  				
	  			 for (var i=0;i<tax.length;i++) {
	  				 
	  				 if(sku.itemTaxExclusive == false || sku.itemTaxExclusive == true){
	  					 
	  					 if(tax[i].taxCode == 'CGST'){
	  							if(tax[i].taxType == 'Percentage')
	  							var cgstTaxamount = parseFloat(taxamount/2).toFixed(2);
	  							 else
	  					          var cgstTaxamount = tax[i].taxRate;		
	  						}
	  						else{
	  							if(tax[i].taxType == 'Percentage')
	  								var cgstTaxamount = parseFloat(taxamount/2).toFixed(2);
//	  					           var cgstTaxamount = parseFloat(((sku.salePrice)*tax[i].taxRate)/100).toFixed(2);
	  							 else
	  							   var cgstTaxamount = tax[i].taxRate;	
	  						}
	  					/*if(tax[i].taxCode == 'CGST'){
	  						if(tax[i].taxType == 'Percentage')
	  				           var cgstTaxamount = parseFloat(((sku.salePrice)*tax[i].taxRate)/100).toFixed(2);
	  						 else
	  				          var cgstTaxamount = tax[i].taxRate;		
	  					}
	  					else{
	  						if(tax[i].taxType == 'Percentage')
	  				           var cgstTaxamount = parseFloat(((sku.salePrice)*tax[i].taxRate)/100).toFixed(2);
	  						 else
	  						   var cgstTaxamount = tax[i].taxRate;	
	  					}*/
	  				 }
	  				 else
	  					 {
	  					 if(tax[i].taxCode == 'CGST'){
	  							if(tax[i].taxType == 'Percentage')
	  					           var cgstTaxamount = parseFloat(((sku.salePrice)*tax[i].taxRate)/100).toFixed(2);
	  							 else
	  					          var cgstTaxamount = tax[i].taxRate;		
	  						}
	  						else{
	  							if(tax[i].taxType == 'Percentage')
	  					           var cgstTaxamount = parseFloat(((sku.salePrice)*tax[i].taxRate)/100).toFixed(2);
	  							 else
	  							   var cgstTaxamount = tax[i].taxRate;	
	  						}
	  					 
	  					 }
	  			/*if(tax[i].taxCode == "CGST"){
	  				var	 cgsttaxRate = tax[i].taxRate;
	  							cgstTaxamount = parseFloat(((sku.salePrice)*cgsttaxRate)/100).toFixed(2);
	  							}
	  						else
	  							{
	  							var	 sgsttaxRate = tax[i].taxRate;
	  									cgstTaxamount = parseFloat(((sku.salePrice)*sgsttaxRate)/100).toFixed(2);
	  							}*/
	  				 
//	  				 var	rowTax="";
//	  				 var rowDisc ="";
	  				 
	  				/* $('.sno').each(function(){
	  					$(this).text(sNo);
	  					sNo = parseInt(sNo) + 1;
	  				});*/
	  				 var taxLen = parseInt($("#taxationlist tr").length)+1;
	  				 if (taxLen != 1)
	  					 taxLen = parseInt($("#taxationlist tr:last").attr("id").replace('taxdynamicdiv', '')) + 1;
	  				
	  				var rowTax = "<tr id='taxdynamicdiv"+taxLen+"' style='margin-top:5px;'><td class='sno' id='snoTax"+taxLen+"'>"+
	  			"<input type='hidden'  id='snoTax"+taxLen+"'/>" +
	  			"<input type='hidden' id='orderIdTax"+taxLen+"'/>" +
	  			"<input type='hidden' id='taxTaxcode"+taxLen+"' value='"+tax[i].taxCode+"'/>" +
	  			"<input type='hidden' id='taxTax"+taxLen+"' value='"+tax[i].taxRate+"'/>" +
	  			"<input type='hidden' id='skuIdTax"+taxLen+"' value='"+sku.skuId+"'/>"+
	  			"<input type='hidden' id='pluCodeTax"+taxLen+"' value='"+sku.pluCode+"'/>"+
	  			"<input type='hidden' id='taxTaxType"+taxLen+"' value='"+tax[i].taxType+"'/>" +
	  			"<input type='hidden' id='taxTaxCategory"+taxLen+"' value='"+tax[i].taxCategory+"'/>" +
	  			"<input type='hidden' id='taxTaxAmt"+taxLen+"' value='"+cgstTaxamount+"'/>" +
	  			"</td>" +
	  			"<td id='DelTax"+taxLen+"' ><img id='Img"+ taxLen +"' src='"+contextPath+"/images/itemdelete.png' style='width:20%;cursor:pointer;' onclick='deleteItem(this);'/>" +
	  			  "</td></tr>";
	  			 $("#taxationlist tbody").append(rowTax);
	  			 }
	  			 }	
	  				
	  			 
	  			 
	  			/* var discLen = parseInt($("#dicountlist tr").length)+1;
	  			 if (discLen != 1)
	  				 discLen = parseInt($("#dicountlist tr:last").attr("id").replace('discdynamicdiv', '')) + 1;
	  			var	 rowDisc	 = "<tr id='discdynamicdiv"+discLen+"' style='margin-top:5px;'><td  id='serialNumDisc"+discLen+"'>"+
	  		"<input type='hidden' id='serialNumDisc"+discLen+"'>"+
	  		"<input type='hidden' id='skuIdDisc"+discLen+"' value='"+sku.skuId+"'>"+
	  		"<input type='hidden' id='pluCodeDisc"+discLen+"' value='"+sku.pluCode+"'/>"+
	  		"<input type='hidden' id='discountTypeDisc"+discLen+"' />" +
	  		"<input type='hidden' id='discountIdDisc"+discLen+"' />" +
	  		"<input type='hidden' id='discountPriceDisc"+discLen+"'/>" +
	  		"<input type='hidden' id='itemPriceDisc"+discLen+"' value='"+sku.salePrice+"'/>" +
	  		"</td>" +
	  		"<td id='DelDisc"+discLen+"' ><img id='Img"+ discLen +"' src='"+contextPath+"/images/itemdelete.png' style='width:15%;cursor:pointer;' onclick='deleteItem(this);'/>" +
	  		  "</td></tr>";
	  		 $("#dicountlist tbody").append(rowDisc);
	  		*/
	  			 var priceEdit=$('#editPrice').val();
	  			 
	  			 if(priceEdit==null || priceEdit==undefined || priceEdit=="")
	  				 {
	  				 	priceEdit="false";
	  				 }
	  			 
	  			 if(sku.packed==false)
	  				 {
	  				 var CostTd= "<td class='cost' id='totalCost"+len+"'onchange='PreventEnter(this);' onBlur='changeCostprice(this);' contenteditable='true' oninput='this.value = this.value.replace(/[^0-9]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');'>"+(sku.salePrice*sku.min_sale_qty)+"</td>" ;
	  				 }
	  			 else
	  				 {
	  				//var CostTd= "<td class='cost' id='totalCost"+len+"'onchange='PreventEnter(this);' onBlur='changeCostprice(this);' contenteditable='true' oninput='this.value = this.value.replace(/[^0-9]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');'>"+(sku.price*sku.min_sale_qty)+"</td>" ;
	  				 var CostTd= "<td class='cost' id='totalCost"+len+"'>"+(sku.salePrice*sku.min_sale_qty)+"</td>" ;
	  				 }
	  			 
	  			 
	  			 if(priceEdit=="true")
	  				 {
	  			 var row = "<tr id='dynamicdiv"+len+"' style='margin-top:5px;'><td class='slno'>"+slNo+"</td>" +
	  			 	"<td class='itemId' id='itemId"+len+"'>"+sku.skuId+"</td>" +
	  		 		"<input type='hidden' id='skuId"+len+"' value='"+sku.skuId+"'/>" +
	  		 		"<input type='hidden' class='pluCode' id='pluCode"+len+"' value='"+sku.pluCode+"'/>" +
	  		 		 "<input type='hidden' id='discountType"+len+"' />" +
	  		 		/*"<input type='hidden' id='cgsttax"+len+"' value='"+cgstTaxRate+"'/>" +
	  		 		"<input type='hidden' id='sgsttax"+len+"' value='"+sgstTaxRate+"'/>" +
	  		 		  "<input type='hidden' id='taxTaxcode"+i+"' value='"+tax[i].taxCode+"'/>" +
	  		 		"<input type='hidden' id='taxsgstTaxcode"+len+"' value='"+sgstTaxCode+"'/>" +*/
	  		 		/*"<input type='hidden' id='igsttax"+len+"' value='0.0'/>" +
	  		 		"<input type='hidden' id='cgsgstAmt"+len+"' value='"+cgsttaxamount+"'/>" +
	  		 		"<input type='hidden' id='sgsgstAmt"+len+"' value='"+sgsttaxamount+"'/>" +
	  		 		"<input type='hidden' id='igstAmt"+len+"' value='0.0'/>" +*/
	  		 		"<input type='hidden' id='discount"+len+"' value='0.0'/>" +
	  		 		"<input type='hidden' id='manualDiscount"+len+"' value='0.0'/>" +
	  		 		/*"<input type='hidden' id='othertaxRate"+len+"' value='0.0'/>" +
	  		 		"<input type='hidden' id='otherTaxValue"+len+"' value='0.0'/>" +*/
	  		 		"<input type='hidden' id='taxExclusive"+len+"' value='"+sku.itemTaxExclusive+"'/>" +
	  				"<input type='hidden' id='productRange"+len+"' value='"+sku.productRange+"'/>" +
	  				"<input type='hidden' id='measureRange"+len+"' value='"+sku.measureRange+"'/>" +
	  				"<input type='hidden' id='utility"+len+"' value='"+sku.utility+"'/>" +
	  				"<input type='hidden' id='trackingRequired"+len+"' value='"+sku.trackingRequired+"'/>"+
	  		 		"<input type='hidden' id='department"+len+"' value='"+sku.primaryDepartment+"'/>" +
	  		 		"<input type='hidden' id='subDept"+len+"' value='"+sku.secondaryDepartment+"'/>" +
	  		 		"<input type='hidden' id='manufacturedItem"+len+"' value='"+sku.manufacturedItem+"'/>" +
	  		 		"<input type='hidden' id='category"+len+"' value='"+sku.category+"'/>" +
	  		 		"<input type='hidden' id='subCategory"+len+"' value='"+sku.subCategory+"'/>" +
	  		 		"<input type='hidden' id='section"+len+"' value='"+sku.section+"'/>" +
	  		 		"<input type='hidden' id='zeroStock"+len+"' value='"+sku.zeroStock+"'/>" +
	  		 		"<input type='hidden' id='packed"+len+"' value='"+sku.packed+"'/>" +
	  		 		"<input type='hidden' id='editable"+len+"' value='"+sku.editable+"'/>" +
	  		 		"<input type='hidden' id='itemScancode"+len+"' value='"+sku.itemScanCode+"'/>" +
	  		 		"<input type='hidden' id='itemtaxCode"+len+"' value='"+sku.taxCode+"'/>" +
	  		 		"<input type='hidden' id='ean"+len+"' value='"+sku.ean+"'/>" +
	  		 		"<input type='hidden' id='styleRange"+len+"' value='"+sku.styleRange+"'/>" +
	  		 		"<input type='hidden' id='brand"+len+"' value='"+sku.brandCode+"'/>" +
	  		 		"<input type='hidden' id='uom"+len+"' value='"+sku.uom+"'/>" +
	  		 		"<input type='hidden' id='priceVale"+len+"' value='"+sku.price+"'/>" +
	  		 		"<input type='hidden' id='classProduct"+len+"' value=''/>" +
	  		 		"<input type='hidden' id='subclassProduct"+len+"' value=''/>" +
	  		 		"<input type='hidden' id='discountPrice"+len+"' value=''/>" +
	  		 		/*"<input type='hidden' id='itemtaxCode"+len+"' value='"+sku.taxCode+"'/>" +*/
	  		 		"<input type='hidden' class='itemStatus' id='itemStatus"+len+"' value=''/>" +
	  		 		"<input type='hidden' class='hsnCode' id='hsnCode"+len+"' value='"+sku.hsnCode+"'/>" +
	  	         	"<td id='itemName"+len+"'><div id='overflowtext'><a href='#' data-toggle='tooltip'  title='"+description+"'>"+description+"</a></div></td>"+

/*	  		 		"<td id='itemName"+len+"'>"+description+"</td>" +
*/	  		 		 "<td id='model"+len+"'>"+model+"</td><td id='colour"+len+"'>"+color+"</td>" +
	  			    "<td id='size"+len+"'>"+measureRange+"</td>"+
	  			    "<td class='discountIds' style='color:blue' id='discountIds"+len+"'></td>" +
	  		 		"<td class='price' id='price"+len+"'>"+sku.mrp+"</td>" +
	  		 	    "<td  class='Price' id='itemPrice"+len+"'onchange='PreventEnter(this);' onBlur='changeSaleprice(this);' contenteditable='true' oninput='this.value = this.value.replace(/[^0-9]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');'>"+sku.salePrice+"</td>" +
	  		 	     "<td class='itemPricemod' id='itemPricemod"+len+"'>"+sku.salePrice+"</td>" +
                     "<td  class='itemDiscountPrice' id='itemDiscountPrice"+len+"' ></td>" +
	  		 	   
	  		 	
	  		 	   /* modified: by koti bomineni
	  		 	   reason: to display the minimum sal quantity which is editable*/
	  		 	   
	  		 	   
	  		 	  
	  			    "<td id='orderedQuantity"+len+"' class='Pack' onkeypress='return (this.innerText.length < 10)'  onchange='PreventEnter(this);' onBlur='changePack(this);'>"+sku.min_sale_qty+"</td>" +
	  			    "<td id='confirmQuantity"+len+"' class='Pack' onkeypress='return (this.innerText.length < 10)' onchange='PreventEnter(this);'  onBlur='changePack(this);' contenteditable='true'>"+sku.min_sale_qty+"</td>" +
	  			    /*"<td class='cost' id='totalCost"+len+"'>"+(sku.price*sku.min_sale_qty)+"</td>" +*/
	  			    CostTd+
	  			    "<td  id='tax"+len+"' >"+parseFloat(taxRate).toFixed(2)+"</td>" +
	  			    "<td  id='taxAmt"+len+"' >"+parseFloat(taxamount).toFixed(2)+"</td>" +
	  			    "<td id='Del"+ len +"' ><img id='Img"+ len +"' src='"+contextPath+"/images/itemdelete.png' style='width:20%;cursor:pointer;' onclick='deleteItem(this);' title='Delete "+sku.skuId+"'/>" +
	  			    "</td></tr>";
	  			 
	  			 /* added by        :  koti bomminei
		  	      description     :  to display minimun sale quantity and related calculations added qty*/  
  				 
	  				 }
	  			 else
	  				 {

		  			 var row = "<tr id='dynamicdiv"+len+"' style='margin-top:5px;'><td class='slno'>"+slNo+"</td>" +
		  			 	"<td class='itemId' id='itemId"+len+"'>"+sku.skuId+"</td>" +
		  		 		"<input type='hidden' id='skuId"+len+"' value='"+sku.skuId+"'/>" +
		  		 		"<input type='hidden' class='pluCode' id='pluCode"+len+"' value='"+sku.pluCode+"'/>" +
		  		 		 "<input type='hidden' id='discountType"+len+"' />" +
		  		 		
		  		 		"<input type='hidden' id='discount"+len+"' value='0.0'/>" +
		  		 		"<input type='hidden' id='manualDiscount"+len+"' value='0.0'/>" +
		  		 		
		  		 		"<input type='hidden' id='taxExclusive"+len+"' value='"+sku.itemTaxExclusive+"'/>" +
		  				"<input type='hidden' id='productRange"+len+"' value='"+sku.productRange+"'/>" +
		  				"<input type='hidden' id='measureRange"+len+"' value='"+sku.measureRange+"'/>" +
		  				"<input type='hidden' id='utility"+len+"' value='"+sku.utility+"'/>" +
		  				"<input type='hidden' id='trackingRequired"+len+"' value='"+sku.trackingRequired+"'/>"+
		  		 		"<input type='hidden' id='department"+len+"' value='"+sku.department+"'/>" +
		  		 		"<input type='hidden' id='subDept"+len+"' value='"+sku.secondaryDepartment+"'/>" +
		  		 		"<input type='hidden' id='manufacturedItem"+len+"' value='"+sku.manufacturedItem+"'/>" +
		  		 		"<input type='hidden' id='category"+len+"' value='"+sku.category+"'/>" +
		  		 		"<input type='hidden' id='subCategory"+len+"' value='"+sku.subCategory+"'/>" +
		  		 		"<input type='hidden' id='section"+len+"' value='"+sku.section+"'/>" +
		  		 		"<input type='hidden' id='zeroStock"+len+"' value='"+sku.zeroStock+"'/>" +
		  		 		"<input type='hidden' id='packed"+len+"' value='"+sku.packed+"'/>" +
		  		 		"<input type='hidden' id='editable"+len+"' value='"+sku.editable+"'/>" +
		  		 		"<input type='hidden' id='itemScancode"+len+"' value='"+sku.itemScanCode+"'/>" +
		  		 		"<input type='hidden' id='itemtaxCode"+len+"' value='"+sku.taxCode+"'/>" +
		  		 		"<input type='hidden' id='ean"+len+"' value='"+sku.ean+"'/>" +
		  		 		"<input type='hidden' id='styleRange"+len+"' value='"+sku.styleRange+"'/>" +
		  		 		"<input type='hidden' id='brand"+len+"' value='"+sku.brand+"'/>" +
		  		 		"<input type='hidden' id='uom"+len+"' value='"+sku.uom+"'/>" +
		  		 		"<input type='hidden' id='priceVale"+len+"' value='"+sku.price+"'/>" +
		  		 		"<input type='hidden' id='classProduct"+len+"' value=''/>" +
		  		 		"<input type='hidden' id='subclassProduct"+len+"' value=''/>" +
		  		 		"<input type='hidden' id='discountPrice"+len+"' value=''/>" +
		  		 		
		  		 		"<input type='hidden' class='itemStatus' id='itemStatus"+len+"' value=''/>" +
		  		 		"<input type='hidden' class='hsnCode' id='hsnCode"+len+"' value='"+sku.hsnCode+"'/>" +
		  	         	"<td id='itemName"+len+"'><div id='overflowtext'><a href='#' data-toggle='tooltip'  title='"+description+"'>"+description+"</a></div></td>"+

		  		 		 "<td id='model"+len+"'>"+model+"</td><td id='colour"+len+"'>"+color+"</td>" +
		  			    "<td id='size"+len+"'>"+measureRange+"</td>"+
		  			    "<td class='discountIds' style='color:blue' id='discountIds"+len+"'></td>" +
		  		 		"<td class='price' id='price"+len+"'>"+sku.mrp+"</td>" +
		  		 	    "<td  class='Price' id='itemPrice"+len+"'onchange='PreventEnter(this);' onBlur='changeSaleprice(this);' oninput='this.value = this.value.replace(/[^0-9]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');'>"+sku.salePrice+"</td>" +
						  "<td class='itemPricemod' id='itemPricemod"+len+"'>"+sku.salePrice+"</td>" +		  		 	  
						 "<td  class='itemDiscountPrice' id='itemDiscountPrice"+len+"' ></td>" +
		  		 	   
		  		 	
		  		 	  
		  			    "<td id='orderedQuantity"+len+"' class='Pack' onkeypress='return (this.innerText.length < 10)'  onchange='PreventEnter(this);' onBlur='changePack(this);'>"+sku.min_sale_qty+"</td>" +
		  			    "<td id='confirmQuantity"+len+"' class='Pack' onkeypress='return (this.innerText.length < 10)' onchange='PreventEnter(this);'  onBlur='changePack(this);' contenteditable='true'>"+sku.min_sale_qty+"</td>" +
		  			    /*"<td class='cost' id='totalCost"+len+"'>"+(sku.price*sku.min_sale_qty)+"</td>" +*/
		  			    CostTd+
		  			    "<td  id='tax"+len+"' >"+parseFloat(taxRate).toFixed(2)+"</td>" +
		  			    "<td  id='taxAmt"+len+"' >"+parseFloat(taxamount).toFixed(2)+"</td>" +
		  			    "<td id='Del"+ len +"' ><img id='Img"+ len +"' src='"+contextPath+"/images/itemdelete.png' style='width:20%;cursor:pointer;' onclick='deleteItem(this);' title='Delete "+sku.skuId+"'/>" +
		  			    "</td></tr>";	 
	  				 }
	  		$("#productsList tbody").append(row);
	  		getApplyCampignDetails(sku.skuId,sku.pluCode,sku.salePrice,sku.min_sale_qty,len);
	  	//	$("#SuccessforMenu").html("Item added successfully.");
	  		$("#SuccessforMenu").html("Item "+sku.skuId+" added to the cart successfully.");
	  		
	  	}
	
	
	
	/*function GetStoreSettings(){
		debugger;
		 //purpose:for checking internet conection
		var online = window.navigator.onLine;
	  	if(!online)
	  	{
	  	alert("check your internet connection,please try agian after some time");
	  	return;
	  	}
	  	
	  	 var location = $("#outletLocation option:selected").text();
		 
		 if(location=="" || location==null || location==undefined)
			 {
			 location="";
			 return;
			 }
		 
		 var ApiKey=$("#b2cRequired").val();
		 
		 if(ApiKey=="Yes")
			 {
			 location="B2C";
			 }
		 else
			 {
			 location=location;
			 }
		 
		 var contextPath = $("#contextPath").val();
		
		 URL = contextPath + "/inventorymanager/getStorelistByLocationOrders.do";
		 $.ajax({
				type: "GET",
				url : URL,
				data : {
					location:location,
				},
				beforeSend: function(xhr){                    
		   	   		$("#loading").css("display","block");
		   	   		$("#mainDiv").addClass("disabled");
		   	   	},
				success : function(result) {
					debugger;
					//console.log(JSON.stringify(result));
					if(result!=null && result!=undefined && result!="")
						{
							var manualDiscount=result[0].manualDiscounts;
							var priceEdit=result[0].editPrice;
							
							if(manualDiscount==true)
								{
									$("#otherDiscount").removeAttr("disabled");
								}
							else
								{
								    $("#otherDiscount"). attr("disabled", "disabled");
								}
							
							if(priceEdit==true)
								{
									$("#editPrice").val("true");
								}
							else
								{
									$("#editPrice").val("false");
								}
							
						}
					else
						{
						$("#otherDiscount"). attr("disabled", "disabled");
						$("#editPrice").val("false");
						}
					
					$("#loading").css("display","none");
					$("#mainDiv").removeClass('disabled');
				},
				error : function(e) {
					console.log(JSON.stringify(e));
					 alert("something went wrong");
					 $("#loading").css("display","none");
		 			 $("#mainDiv").removeClass('disabled');
				}
			});
	}*/

	function GetStoreSettings(){
		debugger;
		 //purpose:for checking internet conection
		$("#searchItemsErrorIDdiscounts").html("");
		
		var online = window.navigator.onLine;
	  	if(!online)
	  	{
	  	alert("check your internet connection,please try agian after some time");
	  	return;
	  	}
	  	
	  	 var location = $("#outletLocation option:selected").text();
		 
	  	 
		 if(location=="" || location==null || location==undefined)
			 {
			 location="";
			
			 }
		 
		 var ApiKey=$("#b2cRequired").val();
		 
		 if(ApiKey=="Yes")
			 {
			 location="B2C";
			 }
		 else
			 {
			 location=location;
			 }
		 
		 var contextPath = $("#contextPath").val();
		
		 URL = contextPath + "/inventorymanager/getStorelistByLocationOrders.do";
		 $.ajax({
				type: "GET",
				url : URL,
				data : {
					location:location,
				},
				beforeSend: function(xhr){                    
		   	   		$("#loading").css("display","block");
		   	   		$("#mainDiv").addClass("disabled");
		   	   	},
				success : function(result) {
					debugger;
					//console.log(JSON.stringify(result));
					if(result!=null && result!=undefined && result!="")
						{
							/*if(result.includes("wareHouseErrCase")){
								 var resultMsg =  result.split("wareHouseErrCase");
								$("#ErrorForShipment").html(resultMsg);
								$("#loading").css("display","none");
								$("#mainDiv").removeClass('disabled');
								
								$("#otherDiscount"). attr("disabled", "disabled");
								$("#productsMenuFlag").val(false);
								$("#editPrice").val("false");
								return false;
								
							}else {*/
								
							var manualDiscount=result[0].manualDiscounts;
							var priceEdit=result[0].editPrice;
							
							if(result[0].productsMenu == "true" || result[0].productsMenu == true){
								$("#productsMenuFlag").val(true);
								}else{
								$("#productsMenuFlag").val(false);	
								}
							
							if(manualDiscount==true)
								{
									$("#otherDiscount").removeAttr("disabled");
								}
							else
								{
								    $("#otherDiscount"). attr("disabled", "disabled");
								}
							
							if(priceEdit==true)
								{
									$("#editPrice").val("true");
								}
							else
								{
									$("#editPrice").val("false");
								}
					
							/*}*/
						}
					else
						{
						$("#otherDiscount"). attr("disabled", "disabled");
						$("#productsMenuFlag").val(false);
						$("#editPrice").val("false");
						
						}
					
					$("#loading").css("display","none");
					$("#mainDiv").removeClass('disabled');
				},
				error : function(e) {
					//console.log(JSON.stringify(e));
					 alert("something went wrong");
					 $("#loading").css("display","none");
		 			 $("#mainDiv").removeClass('disabled');
				}
			});
	}
	
	
	
function copyAllData(){
		 debugger
		 
		 var shipPhone =  $("#phoneNumber1").val().trim();
		  if(shipApartment != ""){
			  $("#billingMobileNo").val(shipPhone);
			  $("#customerContactNum").val(shipPhone);
		  }
		 var Dno =  $("#shipDno").val().trim();
		 if(Dno != ""){
			 $("#billDno").val(Dno);
			 $("#custDno").val(Dno);
		  }
		 var shipApartment =  $("#shipappartmentname").val().trim();
		  if(shipApartment != ""){
			  $("#billappartmentname").val(shipApartment);
			  $("#cusappartmentname").val(shipApartment);
		  }
		  var shipStreet =  $("#shipStreet").val().trim();
		  if(shipStreet != ""){
			  $("#billStreet").val(shipStreet);
			  $("#custStreet").val(shipStreet);
		  }
		  var shipName =  $("#shipmentName").val().trim();
		  if(shipName != ""){
			  $("#billshipmentName").val(shipName);
			  $("#CusshipmentName").val(shipName);
		  }
		  var shipLoc =  $("#shipLoc").val().trim();
		  if(shipLoc != ""){
			  $("#billLoc").val(shipLoc);
			  $("#custLoc").val(shipLoc);
		  }
		  var shipPin =  $("#shipPin").val().trim();
		  if(shipPin != ""){
			  $("#billpinNum").val(shipPin);
			  $("#custpin").val(shipPin);
		  }
		  var shipCity =  $("#shipCity").val().trim();
		  if(shipCity != ""){
			  $("#billCity").val(shipCity);
			  $("#custCity").val(shipCity);
		  }
		  var shipLandmark =  $("#shipLandmark").val().trim();
		  if(shipCity != ""){
			  $("#billLandmark").val(shipLandmark);
			  $("#cusLandmark").val(shipLandmark);
		  }
		  var shipState =  $("#shipmentState").val().trim();
		  if(shipState != ""){
			  $("#billState").val(shipState);
			  $("#cusState").val(shipState);
		  }
		  
	 }


function getOrdersMenuDetails(menuName,categoryName,count) {
	 debugger
	 
	 $("#searchItemsErrorIDdiscounts").html("");
	 
	 var latitude=$("#latitude").val();
	 var longitude=$("#longitude").val();
	 var serviceAreaFlag=$("#ServiceAreaFlag").val();
	 var serviceAreaRequired=$("#GoogleKeyId").val();
	 
	 if(serviceAreaFlag=="" || serviceAreaFlag==null || serviceAreaFlag==undefined) {
		 serviceAreaFlag="";
	 }
	 
	 var productsMenu=$("#productsMenuFlag").val();
	 if(productsMenu=="" || productsMenu==null || productsMenu==undefined) {
		 productsMenu=false;
	 }
	 
	if(productsMenu=="true" || productsMenu == true) {
		
	 var outletName = "";
	if ($('#outletLocation').length>0)
		outletName = $("#outletLocation option:selected").text();
	
	if(outletName == undefined || outletName == null){
		outletName = "";
	}
	var contextPath = $("#contextPath").val();
	URL = contextPath + "/inventorymanager/getOrdersMenuDetails.do";
	$.ajax({
		type : "GET",
		url : URL,
		data : {
			outletName : outletName,
			menuName : menuName,
			categoryName : categoryName
		},
		beforeSend: function(xhr){                    
  				$("#loading").css("display","block");
  				$("#mainDiv").addClass("disabled");
        },

		success : function(result) {
			debugger
			$('#menuItemsReplacediv').html('');
	    	$('#menuItemsReplacediv').html(result);
	    	$(".MClist").removeClass('liMenuActive');
	    	var lnmenu = $("#menuAllCats").val();
	    	if(lnmenu >0){
	    	for(var i=0;i<lnmenu;i++){
	    		$(".MClist"+i).removeClass('liMenuActive');
	    	}
	    	}
	    	
	    	if(count == "" || count == null || count == undefined){
	    		$(".MClist").addClass('liMenuActive');
	    	}else{
	    		$(".MClist"+count).addClass('liMenuActive');
	    	}
			$('#menuItemsModal').modal('show');
			$("#loading").css("display","none");
			$("#mainDiv").removeClass('disabled');
		},
		error : function() {
			alert("something went wrong");
			 $("#loading").css("display","none");
			   $("#mainDiv").removeClass('disabled');
		}
		});
	
		} else {
		/*$("#searchItemsErrorID").html("Please choose or enter shipment address");*/
		$("#searchItemsErrorIDdiscounts").html("Products menu not enabled.");
		return false;
		} 
}


function getOrdersMenuDetailspagination(categoryName,count) {
	 debugger

	    	$(".MClist").removeClass('liMenuActive');
	    	var lnmenu = $("#menuAllCats").val();
	    	if(lnmenu >0){
	    	for(var i=1;i<=lnmenu;i++){
	    		$(".MClist"+i).removeClass('liMenuActive');
	    	}
	    	}
	    	
	    	if(count == "" || count == null || count == undefined){
	    		$(".MClist").addClass('liMenuActive');
               $("#ALL").css("display","contents");
              for(var i=1;i<=lnmenu;i++){
                $("#cat"+i).css("display","none");
               }

	    	}else{
	    		$(".MClist"+count).addClass('liMenuActive');
               $("#ALL").css("display","none");
              for(var i=1;i<=lnmenu;i++){
	             if(i == parseInt(count)){
		          $("#cat"+i).css("display","contents");
	              }else{
                 $("#cat"+i).css("display","none");
                 }
               }
	    	}
			
		
}
