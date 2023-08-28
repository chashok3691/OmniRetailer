function searchGoodsIssue(name, searchCategory){
	var fromLocation = $("#formLocation").val();
	var contextPath = $("#contextPath").val();
	URL = contextPath + "/inventorymanager/searchGoodsIssue.do";
	$.ajax({
		type: "GET",
		url : URL,
		data : {
			searchName : name,
			fromLocation : fromLocation
		},
		beforeSend: function(xhr){                    
			$("#loading").css("display","block");
			$("#mainDiv").addClass("disabled");
		},
		success : function(result) {
			appendGoodsIssueRefs(result, searchCategory);
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


function appendGoodsIssueRefs(issueRefList, searchCategory){
	 $("."+searchCategory).html('');
	 var op = '';
	 for(var i=0;i<issueRefList.length;i++){
		 if (i == 0) {
			 op += '<li id="'+issueRefList[i]+'"  class="selected" onclick=getCode(this,"'+searchCategory+'"); ><a>'+issueRefList[i]+'</a></li>';
		}else
			 op += '<li id="'+issueRefList[i]+'" onclick=getCode(this,"'+searchCategory+'"); ><a>'+issueRefList[i]+'</a></li>';
	 }
	 $("."+searchCategory).html(op);
	 $("."+searchCategory).show();
}


function getCode(element,type){
	var id= $(element).attr("id");
	var label = $(element).children("a").text();
	 if(type == 'searchIssue'){
		 $("#searchIssue").val(label);
		 $("#issueRef").val(id);
		 getGoodsIssues(id);
	 }
	 else{
		 $("#searchReceipt").val(label);
		 $("#receiptRef").val(id);
		 getGoodsReceipts(id);
	 }
	 $(".services").hide();
	 $("."+type).html("");
}

function getGoodsIssues(issueRef){
	var contextPath = $("#contextPath").val();
	URL = contextPath + "/inventorymanager/getGoodsIssues.do";
	$.ajax({
		type: "GET",
		url : URL,
		data : {
			issueRef : issueRef
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


function getGoodsReceipts(receiptRef){
	var contextPath = $("#contextPath").val();
	URL = contextPath + "/inventorymanager/getGoodsReceipts.do";
	$.ajax({
		type: "GET",
		url : URL,
		data : {
			receiptRef : receiptRef
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

$("#searchIssue").keydown(function(e){
	$("#searchIssueError").html("");
	if($("#searchIssue").val().length<3){
		$("#issueRef").val("");
	}
	$(".searchIssue").children("li").each(function(){
		var issueRef = $(this).children("a").text().trim();
		if($("#searchIssue").val().trim().toLowerCase() == issueRef.toLowerCase()){
			$("#searchIssue").val($("#searchIssue").val().trim());
			$("#issueRef").val($(this).attr("id"));
			 $(".services").hide();
			 $(".matchedStringUl").html("");
			return;
		}
		else{
			$("#issueRef").val("");
		}
	});
	if(e.keyCode == 9){
		if($("#searchIssue").val()!="" && $("#issueRef").val() == ""){
			 $("#searchIssueError").html("Issue Ref. doesn't exist");
		 }
		 $(".services").hide();
		 $(".matchedStringUl").html("");
	}
});

$("#searchReceipt").keydown(function(e){
	$("#searchReceiptError").html("");
	if($("#searchReceipt").val().length<3){
		$("#receiptRef").val("");
	}
	$(".searchReceipt").children("li").each(function(){
		var receiptRef = $(this).children("a").text().trim();
		if($("#searchReceipt").val().trim().toLowerCase() == receiptRef.toLowerCase()){
			$("#searchReceipt").val($("#searchReceipt").val().trim());
			$("#receiptRef").val($(this).attr("id"));
			 $(".services").hide();
			 $(".matchedStringUl").html("");
			return;
		}
		else{
			$("#receiptRef").val("");
		}
	});
	if(e.keyCode == 9){
		if($("#searchReceipt").val()!="" && $("#receiptRef").val() == ""){
			 $("#searchReceiptError").html("Receipt Ref. doesn't exist");
		 }
		 $(".services").hide();
		 $(".matchedStringUl").html("");
	}
});


function searchGoodsReceipt(name, searchCategory){
	var fromLocation = $("#formLocation").val();
	var contextPath = $("#contextPath").val();
	URL = contextPath + "/inventorymanager/searchGoodsReceipt.do";
	$.ajax({
		type: "GET",
		url : URL,
		data : {
			searchName : name,
			fromLocation : fromLocation
		},
		beforeSend: function(xhr){                    
			$("#loading").css("display","block");
			$("#mainDiv").addClass("disabled");
		},
		success : function(result) {
			appendGoodsIssueRefs(result, searchCategory);
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
	 var storeLocation = $("#formLocation").val();
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

function appendProducts(productsList,searchCategory){
	 $("."+searchCategory).html('');
	 var op = '';
	 for(var i=0;i<productsList.length;i++){
		 if(productsList[i].skuID == productsList[i].description){
				 if (i == 0) {
					 op += '<li id="'+productsList[i].pluCode+'"  class="selected" onclick=getId(this,"'+searchCategory+'"); ><a>'+productsList[i].description+'   (PRICE   -   '+productsList[i].price+')</a></li>';
				}else
				     op += '<li id="'+productsList[i].pluCode+'" onclick=getId(this,"'+searchCategory+'"); ><a>'+productsList[i].description+'   (PRICE   -   '+productsList[i].price+')</a></li>';
	 	}
		 else{
			 if (i == 0) {
				 op += '<li id="'+productsList[i].pluCode+'"  class="selected" onclick=getId(this,"'+searchCategory+'"); ><a>'+productsList[i].description+'   (SKU ID   -   '+productsList[i].skuID+',   PRICE   -   '+productsList[i].price+')</a></li>';
			}else
			     op += '<li id="'+productsList[i].pluCode+'" onclick=getId(this,"'+searchCategory+'"); ><a>'+productsList[i].description+'   (SKU ID   -   '+productsList[i].skuID+',   PRICE   -   '+productsList[i].price+')</a></li>';
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
	getSkuDetails(id,description);
	 $(".services").hide();
	 $("."+type).html("");
}

function getSkuDetails(skuId,description){
	 $("#desc").val(description);
	 var contextPath = $("#contextPath").val();
	 var storeLocation = $("#formLocation").val();

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
	         	WarehouseReturnflag : WarehouseReturnflag
  			},
  			beforeSend: function(xhr){                    
  	   			$("#loading").css("display","block");
  	   			$("#mainDiv").addClass("disabled");
  	   		  },
  			success : function(result) {
  				appendSkuDetails(result);
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

var skuList = null;
/**
 * @author Sahitya 
 * Prepare table rows dynamically with the provided details, then append to table
 * @param List of Raw Material Details
 */
function appendSkuDetails(list) {
	var parsedJson = jQuery.parseJSON(list);
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
				
					
				if(skuList[i].productBatchNo ==  null){
						skuList[i].productBatchNo = "";
					}
					if(skuList[i].expiry_date ==  null){
						skuList[i].expiry_date = "";
					}
				
				var row = '<tr id=price'+i+' style="margin-top:5px;cursor:pointer" onclick=getPrice(this) ><td>'+skuList[i].description+'</td><td>'+skuList[i].productBatchNo+'</td><td>'+skuList[i].expiry_date+'</td><td>'+price+'</td></tr>';
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


function addItem(sku){
	 var contextPath = $("#contextPath").val();
	 var len = parseInt($("#productsList tr").length);
		if (len != 1)
			len = parseInt($("#productsList tr:last").attr("id").replace('dynamicdiv', '')) + 1;
		for (var i = 1; i <= len; i++) {
			if ($("#skuId" + i).val() == sku.skuId && $("#Price"+i).text() == sku.price) {
				var pack =  parseInt($("#Pack"+i).text())+1;
 			 $("#Pack"+i).text(pack);
 			 var cost =  parseFloat($("#Price"+i).text());
 			 $("#Cost"+i).text(pack*cost);
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
		
		var row = "<tr id='dynamicdiv"+len+"' style='margin-top:5px;'>" +
		"<td id='sno"+len+"'>"+len+"</td>"+
		"<td id='Name"+len+"'>"+sku.skuId+"" +
		"<input type='hidden' id='skuId"+len+"' value='"+sku.skuId+"'/>" +
		"<input type='hidden' id='pluCode"+len+"' value='"+sku.pluCode+"'/></td>" +
		"<td id='Desc"+len+"'>"+description+"</td>" +
		"<td id='Reason"+len+"'><textarea rows='1' style='resize: none;' id='ReturnReason"+len+"'></textarea></td>"+
		"<td id='UOM"+len+"'>"+sell_UOM+ "</td>" +
		"<td id='Pack"+len+"' class='Pack' onBlur='changePack(this);' onkeypress='return (this.innerText.length < 10)' contenteditable='true'>1</td>" +
		"<td class='Price' id='Price"+len+"'>"+sku.price+"</td>" +
		"<td id='Cost"+len+"'>"+sku.price+"</td>" +
		"<td id='Comments"+len+"'><textarea rows='1' style='resize: none;' id='CommentsText"+len+"'></textarea></td>"+
		"<td id='Del"+len+"'><img id='Img"+len+"' src='"+contextPath+"/images/itemdelete.png' style='width:15%;cursor:pointer;' onclick='deleteItem(this);' title='Delete "+sku.skuId+"'/></td></tr>";
		$("#productsList tbody").append(row);
}
function deleteItem(element){
	var id = $(element).attr("id").replace('Img','');
	$('#dynamicdiv'+id).remove();
	changeTotalCost();
	changeTotalQuantity();
}
function changePack(element){
	var id = $(element).attr("id");
	var rowNo = id.replace('Pack','');
	if (isNaN($("#"+id).html()) || $("#"+id).html() == ""){
		$('#'+id).html("1");
	}
	var packVal = parseInt($('#Pack'+rowNo).html());
	if(packVal<=0){
		alert("Pack should not be empty");
		var priceVal = parseFloat($('#Price'+rowNo).html());
		$('#Pack'+rowNo).html("1");
		$('#Cost'+rowNo).html(priceVal);
	}else{
		var priceVal = parseFloat($('#Price'+rowNo).html());
			$('#Cost'+rowNo).html(packVal*priceVal);
	}
}

function appendItemDetails(skuList) {
	var contextPath = $("#contextPath").val();
	for(var j=0;j<skuList.length;j++){
		 var len = parseInt($("#productsList tr").length);
			if (len != 1)
				len = parseInt($("#productsList tr:last").attr("id").replace('dynamicdiv', '')) + 1;
			var sell_UOM = skuList[j].uOM;
			if(sell_UOM == "" || sell_UOM == null)
				sell_UOM = "_";
			var row = "<tr id='dynamicdiv"+len+"' style='margin-top:5px;'>" +
			"<td id='sno"+len+"'>"+len+"</td>"+
			"<td id='Name"+len+"'>"+skuList[j].item+"" +
			"<input type='hidden' id='skuId"+len+"' value='"+skuList[j].skuId+"'/>" +
			"<input type='hidden' id='pluCode"+len+"' value='"+skuList[j].pluCode+"'/></td>" +
			"<td id='Desc"+len+"'>"+skuList[j].description+"</td>" +
			"<td id='Reason"+len+"'><textarea rows='1' style='resize: none;' id='ReturnReason"+len+"'></textarea></td>"+
			"<td id='UOM"+len+"'>"+sell_UOM+ "</td>" +
			"<td id='Pack"+len+"' class='Pack' onBlur='changePack(this);' onkeypress='return (this.innerText.length < 10)' contenteditable='true'>"+skuList[j].recieved+"</td>" +
			"<td class='Price' id='Price"+len+"'>"+skuList[j].price+"</td>" +
			"<td id='Cost"+len+"'>"+skuList[j].cost+"</td>" +
			"<td id='Comments"+len+"'><textarea rows='1' style='resize: none;' id='CommentsText"+len+"'></textarea></td>"+
			"<td id='Del"+len+"'><img id='Img"+len+"' src='"+contextPath+"/images/itemdelete.png' style='width:15%;cursor:pointer;' onclick='deleteItem(this);' title='Delete "+skuList[j].skuId+"'/></td></tr>";
			$("#productsList tbody").append(row);
	}
}

$('#timeOfReturn').on('input',function(e){
	 $("#timeOfReturnError").html("");
	   $("#Error").html("");
});


$("#formLocation").change(function(){
	$("#Error").html("");
});

$("#toLocation").change(function(){
	$("#Error").html("");
});

function validateStockReturn(status,operation){
	$("#Error").html("");
	var finalObj = {}, stockList = [];
	if($("#formLocation").val() == $("#toLocation").val()){
		$("#Error").html("From Location should be different from To Location");
		return;
	}
	if($("#dateOfReturn").val().trim() == ""){
		$("#dateOfReturnError").html("Enter Date");
		return;
	}
	if($("#timeOfReturn").val().trim() == ""){
		$("#timeOfReturnError").html("Enter Time");
		return;
	}
	if($("#shippedOn").val().trim() == ""){
		$("#shippedOnError").html("Enter Shipped On");
		return;
	}
	finalObj.fromLocation = $("#formLocation").val();
	finalObj.toLocation = $("#toLocation").val();
	finalObj.dateOfReturnStr = $("#dateOfReturn").val();
	finalObj.timeOfReturnStr = $("#timeOfReturn").val();
	finalObj.issueRef = $("#issueRef").val();
	finalObj.receiptRef = $("#receiptRef").val();
	finalObj.returnBy = $("#returnBy").val();
	finalObj.shippedBy = $("#shippedBy").val();
	finalObj.shipmentMode = $("#shipmentMode").val();
	finalObj.shippedOnStr = $("#shippedOn").val();
	finalObj.shipmentCarrier = $("#shipmentCarrier").val();
	
	
	
	if($("#statusissue").val() == ""){
	finalObj.status = $("#status").val();
	}else{
	finalObj.status = $("#statusissue").val();
	}
	finalObj.remarks = $("#remarks").val();
	var len = $("#productsList tr").length-1;
	if(len == 0){
		$("#Error").html("Please Add Atleast 1 Item to Return");
		return;
	}
	finalObj.stockList = stockList;
  	for(var i=1;i<=len;i++){
  			var obj;
  	  		var idAttr = $("#productsList tr:eq("+i+") td:last").attr("id").replace('Del','');
  	  		obj = {itemId:$("#skuId"+idAttr).val(),pluCode:$("#pluCode"+idAttr).val(),description:$("#Desc"+idAttr).text(),reasonForReturn:$("#ReturnReason"+idAttr).val(),uOM:$("#UOM"+idAttr).text(),quantity:$("#Pack"+idAttr).text(),price:$("#Price"+idAttr).text(),value:$("#Cost"+idAttr).text(),comments:$("#CommentsText"+idAttr).val()};
  	  		finalObj.stockList.push(obj);
  	}
	 var contextPath = $("#contextPath").val();
   	   if(operation=="new"){
    	 URL = contextPath + "/inventorymanager/createStockReturn.do";
   	   }
   	   else if(operation=="edit"){
   		 URL = contextPath + "/inventorymanager/updateStockReturn.do";
   		finalObj.returnNoteRef  = $("#retrunNoteRef").val();
   	   }
	   	var flowUnder = "";
		if($("#flowUnder").length > 0)
			flowUnder = $("#flowUnder").val();
		finalObj.flowUnder = flowUnder;
		var formData = JSON.stringify(finalObj);
//   	   console.log(formData);
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

$('#searchStocksReturn').on('input',function(e){
	if($(this).val().trim()==""){
		viewGoodsReturn('','0','');
	}
});


function searchOutletStockReturn(name,searchCategory,index){
	var startDate = "";
	 var endDate = "";
	   name=""
			if($("#searchStocksReturn").length>0)
			name = $("#searchStocksReturn").val().trim();
	 
	var fromLocation = $("#formLocation").val();
	var zone = $("#outletLocation").val();
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
	 var maxRecords = 10;
		 if($("#maxRecords").length>0)
			 maxRecords = $("#maxRecords").val();
	 var flowUnder = "";
		if($("#flowUnder").length > 0)
			flowUnder = $("#flowUnder").val();
	 var contextPath = $("#contextPath").val();
	 URL = contextPath + "/inventorymanager/searchOutletStockReturn.do";
	 $.ajax({
			type: "GET",
			url : URL,
			data : {
				searchName : name,
				index : index,
				maxRecords : maxRecords,
				startDate : startDate,
				endDate : endDate,
				fromLocation : fromLocation,
				zone:zone,
				flowUnder : flowUnder
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


function viewEditStockReturn(retrunNoteRef,operation){
	 var contextPath = $("#contextPath").val();
	 var flowUnder = "";
		if($("#flowUnder").length > 0)
			flowUnder = $("#flowUnder").val();
		var location = $("#formLocation").val();
		
		//added by manasa
		 var formData={}
		 formData.zone = $("#outletZone").val();
		 formData.fromLocation = $("#outletLocation").val();
		 formData.startDate = $("#from").val();
		 formData.endDate = $("#to").val();
		 var formData = JSON.stringify(formData);
		
	 URL = contextPath + "/inventorymanager/editStockReturn.do";
		$.ajax({
			type: "GET",
			url : URL,
			data : {
				retrunNoteRef : retrunNoteRef,
				operation : operation,
				flowUnder : flowUnder,
				formData : formData
			},
			beforeSend: function(xhr){                    
	   			$("#loading").css("display","block");
	   			$("#mainDiv").addClass("disabled");
	   		  },
			success : function(result) {
				$("#right-side").html(result);
				//$("#formLocation").val(location);
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





