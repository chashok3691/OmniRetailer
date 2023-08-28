	$("#skuId").on('input',function(e){
		   $("#skuIdError").html("");
		   $(".Error").html("");
	});
	$("#skuIdW").on('input',function(e){
		   $("#skuIdWError").html("");
		   $(".Error").html("");
	});
	
	 $("#searchItems").on('input',function(e){
		   $("#productNameError").html("");
		   $(".Error").html("");
	});
	 $("#stock").on('input',function(e){
		   $("#stockError").html("");
		   $(".Error").html("");
	});
	 
	 $("#uomListW").on('input',function(e){
		   $("#uomListWError").html("");
		   $(".Error").html("");
	});
	 $("#searchSupplier").on('input',function(e){
		   $("#supplierNameError").html("");
		   $(".Error").html("");
	});
	 
	 $("#manufacturer").on('input',function(e){
		   $("#manufacturerError").html("");
		   $(".Error").html("");
	});
	 
	 $("#salePrice").on('input',function(e){
		   $("#salePriceError").html("");
		   $(".Error").html("");
	});
	 
	 $("#uomList").on('input',function(e){
		   $("#uomListError").html("");
		   $(".Error").html("");
	});
	 
	 $("#minSaleQty").on('input',function(e){
		   $("#minSaleQtyError").html("");
		   $(".Error").html("");
	});
	 
	 $("#shortDescription").on('input',function(e){
		   $("#shortDescriptionError").html("");
		   $(".Error").html("");
	});
	 
	 $("#shortDescriptionW").on('input',function(e){
		   $("#shortDescriptionErrorW").html("");
		   $(".Error").html("");
	});
	 
	 
	 $("#shortDescriptionQuick").on('input',function(e){
		   $("#shortDescriptionQuickError").html("");
		   $(".Error").html("");
	});
	 
	 $("#minSaleQtyW").on('input',function(e){
		   $("#minSaleQtyWError").html("");
		   $(".Error").html("");
	});
	 $("#productNameW").on('input',function(e){
		   $("#productNameWError").html("");
		   $(".Error").html("");
	});
	 
	 $("#location").change(function(){
		   $("#locationError").html("");
		   $(".Error").html("");
	}); 
	  
	 $(".allField .req").change(function(){
		 var id = $(this).attr("id");
		 $("#"+id+"Error").html("");
	 });

	 $(".dat").change(function(){
		 var id = $(this).attr("id");
		 $("#"+id+"Error").html("");
	 });
	 function test(){
		 var id = $(ele).attr("id");
		 $("#"+id+"Error").html("");
	 }
	 
	 function deletePic(id){
		 var control = $("#"+id);
		 var k = confirm("Are you sure you want to Delete");
		 if(k == true){
			 control.replaceWith( control = control.clone( true ) );
			 $("#"+id+"_thumbnail").remove();
			 $("#"+id+"_delImage").remove();
			 $("#"+id+"_label").css("display","block");
			 //$("#picture"+id+"_byte").val('');
		 }
	 }
	 function removemsg(ele){
		 $("#Errorid").text("");
	 }
	 function searchSuppliers(name, searchCategory){
		 //debugger;
		 //purpose:for checking internet conection
		 var online = window.navigator.onLine;
		 if(!online)
		 {
			 alert("check your internet connection,please try agian after some time");
			 return;
		 }
		 var contextPath = $("#contextPath").val();
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
	//debugger;
	var id= $(element).attr("id");
	$("#supplier_Id").val(label);
	var label = $(element).children("a").text();
	$("#searchSupplier").val(label);
	$("#searchSupplierW").val(label);
	 $(".services").hide();
	 $("."+type).html("");
}



$("#searchSupplier").on('input',function(e){
	$("#supplierNameError").html("");
	if($("#searchSupplier").val().length<3){
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


$("#searchItems").on('input',function(e){
	$("#productNameError").html("");
	if($("#searchItems").val().length<3){
		$("#productId").val("");
	}
	$(".productName").children("li").each(function(){
		var productName = $(this).children("a").text().trim();
		if($("#searchItems").val().trim().toLowerCase() == productName.toLowerCase()){
			$("#searchItems").val($("#searchItems").val().trim());
			$("#productId").val($(this).attr("id"));
			 $(".services").hide();
			 $(".matchedStringUl").html("");
			return;
		}
		else{
			$("#productId").val("");
		}
	});
	if(e.keyCode == 9){
		if($("#searchItems").val()!="" && $("#productId").val() == ""){
			 $("#productNameError").html("Product Name doesn't exist");
		 }
		 $(".services").hide();
		 $(".matchedStringUl").html("");
	}
});

function searchProducts(name, searchCategory){
	 //purpose:for checking internet conection
	var online = window.navigator.onLine;
  	if(!online)
  	{
  	alert("check your internet connection,please try agian after some time");
  	return;
  	}
	 var contextPath = $("#contextPath").val();
	 URL = contextPath + "/inventorymanager/searchProductNames.do";
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
	 $("."+searchCategory).html('');
	 var op = '';
	 for(var i=0;i<productsList.length;i++){
		 if (i == 0) 
			 op += '<li id="'+productsList[i].productId+'"  class="selected" onclick=getId(this,"'+searchCategory+'"); ><a>'+productsList[i].productName+'</a>'+
			 '<input type="hidden" id="prodCategory" value="'+productsList[i].categoryDescription+'"><input type="hidden" id="prodCategoryId" value="'+productsList[i].category+'"><input type="hidden" id="prodSubCategory" value="'+productsList[i].subCategoryDescription+'"></li>';
		 else
		     op += '<li id="'+productsList[i].productId+'" onclick=getId(this,"'+searchCategory+'"); ><a>'+productsList[i].productName+'</a>'+
		     '<input type="hidden" id="prodCategory" value="'+productsList[i].categoryDescription+'"><input type="hidden" id="prodCategoryId" value="'+productsList[i].category+'"><input type="hidden" id="prodSubCategory" value="'+productsList[i].subCategoryDescription+'"></li>';
	 }
	 $("."+searchCategory).html(op);
	 $("."+searchCategory).show();
}

function getId(element,type){
	////debugger
	var id= $(element).attr("id");
	$("#productId").val(id);
	var label = $(element).children("a").text();
	var categoryName = $(element).children("input#prodCategory").val();
	var categoryId = $(element).children("input#prodCategoryId").val();
	var subCategoryName = $(element).children("input#prodSubCategory").val();
	
	if(categoryName != null && categoryName != "null")
		$("#categoryName").val(categoryName);
	if(categoryId != null && categoryId != "null")
		$("#categoryId").val(categoryId);
	if(subCategoryName != null && subCategoryName != "null")
		$("#subCategoryName").val(subCategoryName);
	$("#searchItems").val(label);
	 $(".services").hide();
	 $("."+type).html("");
}


function loadImageFileAsURL(id,ele) {
	
	debugger;
	
	if (ele.files && ele.files[0]) {
		
		var fileToLoad = ele.files[0];
//		 var fsize = fileToLoad.size;
		if (fileToLoad.type.match("image.*")) {
			var name = fileToLoad['name'];
			debugger;
			if(name.length > 50){
				$("#pictureIconError").html("length of name should be in 50 characters only.");
				return;
			}
			else{
				$("#pictureIconError").html("");
				}
			
			
			$("#"+id+"_name").val(name);
	        var reader = new FileReader();
	
	        reader.onload = function (e) {
	        	$("#"+id+"_label").css("display","none");
	        	$("#" + id + "_image").append('<img class="thumbnail" id="'+id+'_thumbnail" src=' + e.target.result + ' style="width:100px;height:100px;"><img class="delImage" id="'+id+'_delImage" src="'+contextPath+'/images/deny.png" onclick=deletePic("'+id+'"); >');
	        };
	
	        reader.readAsDataURL(ele.files[0]);
	        var oMyForm = new FormData();
	        oMyForm.append("file",  ele.files[0]);
	        if($("#"+id+"_refId").val() != "")
	        	oMyForm.append("refId",  $("#"+id+"_refId").val().trim());
	        else
	        	oMyForm.append("refId", "");
	        var contextPath = $("#contextPath").val();
	        var URL = contextPath + "/inventorymanager/addToAttachementList.do";
	        $.ajax({
	//				dataType : 'json',
	        	url : URL,
	        	data : oMyForm,
	        	type : "POST",
	        	enctype : 'multipart/form-data',
	        	processData : false,
	        	contentType : false,
	        	beforeSend : function(xhr) {
	        	},
	        	success : function(result) {
	        		$("#"+id+"_refId").val(result);
	        	},
	        	error : function() {
	        		alert("something went wrong");
	        	}
	        });
	    }
	}
};
	
	
	/*
	var newFile = "<input type='file' id='picture1' multiple='multiple' onchange=loadImageFileAsURL('picture1');></input>";
	if(filesSelected.length >3){
		alert("You can upload maximum 3 files");
		var $fileInput=$("#"+id);
		var $fileCopy = $(newFile);
		$fileInput.replaceWith($fileCopy);
		return false;
	}
	if (filesSelected.length > 0) {
		if($("#picture1_byte").val() != "" && $("#picture2_byte").val() != "" && $("#picture3_byte").val() != ""){
			alert("You can upload maximum 3 files");
			return false;
		}
		if($("#picture1_byte").val() != ""){
			count = count+1;
		}
		if($("#picture2_byte").val() != ""){
			count = count+1;
		}
		if($("#picture3_byte").val() != ""){
			count = count+1;
		}
		count = count + filesSelected.length;
		if(count > 3){
			alert("You can upload maximum 3 files");
			return false;
		}
		for(var i=0;i<filesSelected.length;i++){
		var fileToLoad = filesSelected[i];
		if (fileToLoad.type.match("image.*")) {
			k=1;
			var fileReader = new FileReader();
		//	alert("outside::::"+i);
			fileReader.onload = function(fileLoadedEvent) {
				//alert("inside::::"+i);
				var byteVal = fileLoadedEvent.target.result;
				var index = byteVal.indexOf(',');
				byteVal = byteVal.substring(index + 1);
				while(k<=3){
					if($("#picture" + k + "_byte").val() == "")
						break;
					else
						k++;
				}
				var contextPath= $("#contextPath").val();
				
				//$("#picture" + k + "_byte").val(byteVal);
				$("#picture" + k + "_image").html('<img class="thumbnail" src=' + fileLoadedEvent.target.result + ' style="width:65px;height:68px;"><img class="delImage" src="'+contextPath+'/images/deny.png" onclick="deletePic('+k+');">');
				var oMyForm = new FormData();
				oMyForm.append("file", filesSelected[i]);
//				oMyForm.append("number", k);
				var contextPath = $("#contextPath").val();
				var URL = contextPath + "/inventorymanager/addToAttachementList.do";
				alert(URL);
				console.log(oMyForm);
				$.ajax({
							dataType : 'json',
							url : URL,
							data : oMyForm,
							type : "POST",
							enctype : 'multipart/form-data',
							processData : false,
							contentType : false,
							beforeSend : function(xhr) {
							},
							success : function(result) {
								alert(result);
							},
							error : function() {
								alert("something went wrong");
							}
						});

				k = k+1;
			};
			fileReader.readAsDataURL(fileToLoad);
		}
	}
 }
}*/

var priceListDivContent = null;
function setPriceListDivContent(){
	priceListDivContent = $('#pricelistAllLocation0').prop('innerHTML');
}

function setPriceListDivContentforEdit(){
	priceListDivContent = $('#pricelistAllLocation0').prop('innerHTML');
}




var priceListWDivContent = null;
function setPriceListWDivContent(){
	priceListWDivContent = $('#pricelistWAllLocation0').prop('innerHTML');
}

function setPriceListWDivContentforEdit(){
	priceListWDivContent = $('#pricelistWAllLocation0').prop('innerHTML');
//	priceListDivContent = $('#pricelist0').prop('innerHTML');
}


function showPrevPriceList(){
	addSelectedProductAndMeasurementRange();
	var locationId = "";
	$(".priceListLocationDiv").each(function(){
		if($(this).css("display") == "block"){
			locationId = $(this).attr("class").replace(" priceListLocationDiv","");
		}
	});
	locationId = locationId.replace(/\s/g, '');
	var id = null;
	var flag = false;
	var firstId = parseInt($("div ."+locationId+" .pricelist:first").attr("id").replace('pricelist'+locationId,''));
	$("div ."+locationId+" .pricelist").each(function(){
		 var disp = $(this).css("display");
		 if(disp == 'block'){
			 id = parseInt($(this).attr("id").replace('pricelist'+locationId,''));
				if(id == firstId){
					flag = true;
					return;
				}
			 $(this).css("display","none");
		 }
	 });
	if(flag == true)
		return false;
	id = id - 1;
	var idExist = true;
	while(idExist == true){
		if(id == firstId){
			idExist = false;
			$("#prevImg").css("opacity","0.5");
		}
		if($("#pricelist"+locationId+id).length){
			 $("#pricelist"+locationId+id).css("display","block");
			 idExist = false;
		 }
		else
			id = id - 1;
	}
	displayCurrentPageNo();
}



function showPrevPriceListWellness(){
	addSelectedProductAndMeasurementRangeWellness();
	var locationId = "";
	$(".priceListWLocationDiv").each(function(){
		if($(this).css("display") == "block"){
			locationId = $(this).attr("class").replace(" priceListWLocationDiv","");
		}
	});
	var id = null;
	var flag = false;
	var firstId = parseInt($("div ."+locationId+" .pricelistW:first").attr("id").replace('pricelist'+locationId,''));
	$("div ."+locationId+" .pricelistW").each(function(){
		 var disp = $(this).css("display");
		 if(disp == 'block'){
			 id = parseInt($(this).attr("id").replace('pricelist'+locationId,''));
				if(id == firstId){
					flag = true;
					return;
				}
			 $(this).css("display","none");
		 }
	 });
	if(flag == true)
		return false;
	id = id - 1;
	var idExist = true;
	while(idExist == true){
		if(id == firstId){
			idExist = false;
			$("#prevImgW").css("opacity","0.5");
		}
		if($("#pricelist"+locationId+id).length){
			 $("#pricelist"+locationId+id).css("display","block");
			 idExist = false;
		 }
		else
			id = id - 1;
	}
	displayCurrentWellnessPageNo();
}



function showNextPriceList(){
	////debugger
	addSelectedProductAndMeasurementRange();
	var locationId = "";
	$(".priceListLocationDiv").each(function(){
		if($(this).css("display") == "block"){
			locationId = $(this).attr("class").replace(" priceListLocationDiv","");
		}
	});
	locationId = locationId.replace(/\s/g, '');
	var id = null;
	var flag = false;
	var lastId = parseInt($("div ."+locationId+" .pricelist:last").attr("id").replace('pricelist'+locationId,''));
	$("div ."+locationId+" .pricelist").each(function(){
		 var disp = $(this).css("display");
		 if(disp == 'block'){
			 id = parseInt($(this).attr("id").replace('pricelist'+locationId,''));
				if(id == lastId){
					flag = true;
					return;
				}
			 $(this).css("display","none");
		 }
	 });
	if(flag == true)
		return false;
	id = id + 1;
	var idExist = true;
	while(idExist == true){
		if(id == lastId){
			idExist = false;
			$("#nextImg").css("opacity","0.5");
		}
		if($("#pricelist"+locationId+id).length){
			 $("#pricelist"+locationId+id).css("display","block");
			 idExist = false;
		 }
		else
			id = id + 1;
	}
	displayCurrentPageNo();
}



function showNextPriceListWellness(){
	////debugger
	addSelectedProductAndMeasurementRangeWellness();
	var locationId = "";
	$(".priceListLocationWDiv").each(function(){
		if($(this).css("display") == "block"){
			locationId = $(this).attr("class").replace(" priceListLocationWDiv","");
		}
	});
	var id = null;
	var flag = false;
	var lastId = parseInt($("div ."+locationId+" .pricelistW:last").attr("id").replace('pricelistW'+locationId,''));
	$("div ."+locationId+" .pricelistW").each(function(){
		 var disp = $(this).css("display");
		 if(disp == 'block'){
			 id = parseInt($(this).attr("id").replace('pricelistW'+locationId,''));
				if(id == lastId){
					flag = true;
					return;
				}
			 $(this).css("display","none");
		 }
	 });
	if(flag == true)
		return false;
	id = id + 1;
	var idExist = true;
	while(idExist == true){
		if(id == lastId){
			idExist = false;
			$("#nextImgW").css("opacity","0.5");
		}
		if($("#pricelistW"+locationId+id).length){
			 $("#pricelistW"+locationId+id).css("display","block");
			 idExist = false;
		 }
		else
			id = id + 1;
	}
	displayCurrentWellnessPageNo();
}


/*$('#skuId').blur(function(){
	if($("#skuId").val().trim() == ""){
		$("#skuId").val("");
		 $("#runningPlu").html('');
		return;
	}
	var op = '';
	 $(".pricelist").each(function(){
		var id = $(this).attr("id").replace('pricelist','');
		var value = "";
		var skuId = $("#skuId").val();
		if(id.length == 1)
			value = skuId + "0" +id;
		else
			value = skuId + id;
		$("#pluCode"+id).val(value);
		op = op + '<option value='+value+'>'+value+'</option>';
	 });
	 $("#runningPlu").html(op);
});
*/
function appendPriceList(locationId){
	
	debugger;
	
	
	addSelectedProductAndMeasurementRange();
	if(locationId == undefined || locationId == "")
		$(".priceListLocationDiv").each(function(){
			if($(this).css("display") == "block"){
				locationId = $(this).attr("class").replace(" priceListLocationDiv","");
			}
		});
		locationId = locationId.replace(/\s/g, '');
	var dateTime = getCurrentDate();
	var date = dateTime.split(' ');
	date = date[0].split('/');
	var formatedDate = date[1]+"/"+date[0]+"/"+date[2];
	$('#pluCreatedDateAllLocation0').val(formatedDate);
	$('#pluUpdatedDateAllLocation0').val(formatedDate);
	var	id = parseInt($("div ."+locationId+" .pricelist:last").attr("id").replace('pricelist'+locationId,''))+1;
	 $(".pricelist").each(function(){
		 $(this).css("display","none");
	 });
	 var priceListDiv = '<div class=pricelist id=pricelist'+locationId+id+'></div>';
	 var currentPriceListDivContent = $('#pricelistAllLocation0').html();
	 currentPriceListDivContent = currentPriceListDivContent.replace('hasCalendarsPicker','');
	 currentPriceListDivContent = currentPriceListDivContent.replace(/AllLocation0/g,locationId+id);
	 
	 
	currentPriceListDivContent = currentPriceListDivContent.replace(/AllLocatio0/g,locationId+id+"1");
	 currentPriceListDivContent = currentPriceListDivContent.replace(/AllLoc00/g,locationId);
	 currentPriceListDivContent = currentPriceListDivContent.replace(/AllLocat000/g,id+"1");
	 
	 
	 
	 $("div ."+locationId).append(priceListDiv);
	 $("#pricelist"+locationId+id).html(currentPriceListDivContent);
	 callCalender("pluExpiryDate"+locationId+id);
	 /*var value = null;
	 if($("#skuId").val() != ""){
		value = $("#skuId").val();
		id = id.toString();
		if(id.length == 1)
			value = value + "0" +id;
		else
			value = value + id;
		$("#pluCode"+locationId+id).val(value);
		var op = '<option value='+value+'>'+value+'</option>';
		$("#runningPlu").append(op);
	 }*/
	 $('#pluCreatedDate'+locationId+id).val(formatedDate);
	 $('#pluUpdatedDate'+locationId+id).val(formatedDate);
	 $("#prevImg").css("opacity","1");
	 $("#nextImg").css("opacity","0.5");
	 $("#currentPriceList").html($("div ."+locationId+" .pricelist").length+" of "+$("div ."+locationId+" .pricelist").length);
	 $(".req").keydown(function(){
		 var id = $(this).attr("id");
		 $("#"+id+"Error").html("");
	 });
}




function appendPriceListWellness(locationId){
	//debugger;
	locationId = addSelectedProductAndMeasurementRangeWellness();
	if(locationId == undefined || locationId == "")
		$(".priceListWLocationDiv").each(function(){
			if($(this).css("display") == "block"){
				locationId = $(this).attr("class").replace(" priceListWLocationDiv","");
			}
		});

	
	var dateTime = getCurrentDate();
	var date = dateTime.split(' ');
	date = date[0].split('/');
	var formatedDate = date[1]+"/"+date[0]+"/"+date[2];
	$('#pluCreatedDateWAllLocation0').val(formatedDate);
	$('#pluUpdatedDateWAllLocation0').val(formatedDate);
	var	id = parseInt($("div ."+locationId+" .pricelistW:last").attr("id").replace('pricelist'+locationId,''))+1;
	 $(".pricelistW").each(function(){
		 $(this).css("display","none");
	 });
	 var priceListDiv = '<div class=pricelistW id=pricelist'+locationId+id+'></div>';
	 var currentPriceListDivContent = priceListWDivContent;
	 currentPriceListDivContent = currentPriceListDivContent.replace('hasCalendarsPicker','');
	 currentPriceListDivContent = currentPriceListDivContent.replace(/WAllLocation0/g,locationId+id);
	 $("div ."+locationId).append(priceListDiv);
	 $("#pricelist"+locationId+id).html(currentPriceListDivContent);
	 callCalender("pluExpiryDate"+locationId+id);
	 /*var value = null;
	 if($("#skuId").val() != ""){
		value = $("#skuId").val();
		id = id.toString();
		if(id.length == 1)
			value = value + "0" +id;
		else
			value = value + id;
		$("#pluCode"+locationId+id).val(value);
		var op = '<option value='+value+'>'+value+'</option>';
		$("#runningPlu").append(op);
	 }*/
	 $('#pluCreatedDate'+locationId+id).val(formatedDate);
	 $('#pluUpdatedDate'+locationId+id).val(formatedDate);
	 $("#prevImgW").css("opacity","1");
	 $("#nextImgW").css("opacity","0.5");
	 $("#currentPriceListW").html($("div ."+locationId+" .pricelistW").length+" of "+$("div ."+locationId+" .pricelistW").length);
	 $(".req").keydown(function(){
		 var id = $(this).attr("id");
		 $("#"+id+"Error").html("");
	 });
}



function appendPriceListToEmptyDiv(locationId){
	addSelectedProductAndMeasurementRange();
	 var priceListDiv = '<div class=pricelist id=pricelist'+locationId+'1></div>';
	 var currentPriceListDivContent = priceListDivContent;
	 currentPriceListDivContent = currentPriceListDivContent.replace('hasCalendarsPicker','');
	 currentPriceListDivContent = currentPriceListDivContent.replace(/AllLocation0/g,locationId+"1");
	 currentPriceListDivContent = currentPriceListDivContent.replace(/AllLocatio0/g,locationId+id+"1");
	 currentPriceListDivContent = currentPriceListDivContent.replace(/AllLoc00/g,locationId);
	 currentPriceListDivContent = currentPriceListDivContent.replace(/AllLocat000/g,id+"1");
	 $("div ."+locationId).append(priceListDiv);
	 $("#pricelist"+locationId+"1").html(currentPriceListDivContent);
	 callCalender("pluExpiryDate"+locationId+"1");
	/* var value = null;
	 if($("#skuId").val() != ""){
		value = $("#skuId").val();
		value = value + "01";
		$("#pluCode"+locationId+"1").val(value);
		var op = '<option value='+value+'>'+value+'</option>';
		$("#runningPlu").append(op);
	 }*/
	 var dateTime = getCurrentDate();
	 var date = dateTime.split(' ');
	 date = date[0].split('/');
	 var formatedDate = date[1]+"/"+date[0]+"/"+date[2];
	 $('#pluCreatedDate'+locationId+"1").val(formatedDate);
	 $('#pluUpdatedDate'+locationId+"1").val(formatedDate);
	/* $("#prevImg").css("opacity","0.5");
	 $("#nextImg").css("opacity","0.5");
	 $("#currentPriceList").html($("div ."+locationId+" .pricelist").length+" of "+$("div ."+locationId+" .pricelist").length);*/
}

function deletePriceList(){
	////debugger
	var locationId = "";
	$(".priceListLocationDiv").each(function(){
		if($(this).css("display") == "block"){
			locationId = $(this).attr("class").replace(" priceListLocationDiv","");
		}
	});
	locationId = locationId.replace(/\s/g, '');
	var firstId = parseInt($("div ."+locationId+" .pricelist:first").attr("id").replace('pricelist'+locationId,''));
	var lastId = parseInt($("div ."+locationId+" .pricelist:last").attr("id").replace('pricelist'+locationId,''));
	if(firstId == lastId){
		/*$('#pricelist'+locationId+firstId).remove();
		 var priceListDiv = '<div class=pricelist id=pricelist'+locationId+'1></div>';
		 
		 $("div ."+locationId).append(priceListDiv);
		 $("#pricelist"+locationId+"1").html(priceListDivContent);
		 
		 var dateTime = getCurrentDate();
		 var date = dateTime.split(' ');
		 date = date[0].split('/');
		 var formatedDate = date[1]+"/"+date[0]+"/"+date[2];
		 $('#pluCreatedDate'+locationId+'1').val(formatedDate);
		 $('#pluUpdatedDate'+locationId+'1').val(formatedDate);
		 $("#prevImg").css("opacity","0.5");
		 $("#nextImg").css("opacity","0.5");
		 $("#currentPriceList").html("1 of 1");
		 callCalender("pluExpiryDate"+locationId+"1");*/
		/* var value = null;
		 if($("#skuId").val() != ""){
			value = $("#skuId").val();
			value = value + "0" +id;
			$("#pluCode"+locationId+"1").val(value);
			var op = '<option value='+value+'>'+value+'</option>';
			$("#runningPlu").html(op);
		 }*/
		alert("Add Atleast One price List")
		return;
	}
	var id = null;
	$("div ."+locationId+" .pricelist").each(function(){
		 var disp = $(this).css("display");
		 if(disp == 'block'){
			 id = parseInt($(this).attr("id").replace('pricelist'+locationId,''));
			 $('#pricelist'+locationId+id).remove();
			/* var value = null;
			 if($("#skuId").val() != ""){
				value = $("#skuId").val();
				curid = id.toString();
				if(curid.length == 1)
					value = value + "0" +curid;
				else
					value = value + curid;
				 $("#runningPlu option[value='"+value+"']").remove();
			 }*/
		 }
	 });
	if(id == lastId){
		id = id - 1;
		$("#pricelist"+locationId+id).css("display","block");
	}
	else {
		id = id + 1;
		$("#pricelist"+locationId+id).css("display","block");
	}
	displayCurrentPageNo();
	
}



function deletePriceListWellness(){
	//debugger;
	var locationId = "";
	$(".priceListWLocationDiv").each(function(){
		if($(this).css("display") == "block"){
			locationId = $(this).attr("class").replace(" priceListWLocationDiv","");
		}
	});
	var firstId = parseInt($("div ."+locationId+" .pricelistW:first").attr("id").replace('pricelist'+locationId,''));
	var lastId = parseInt($("div ."+locationId+" .pricelistW:last").attr("id").replace('pricelist'+locationId,''));
	if(firstId == lastId){
		/*$('#pricelist'+locationId+firstId).remove();
		 var priceListDiv = '<div class=pricelistW id=pricelist'+locationId+'1></div>';
		 
		 $("div ."+locationId).append(priceListDiv);
		 $("#pricelist"+locationId+"1").html(priceListWDivContent);
		 
		 var dateTime = getCurrentDate();
		 var date = dateTime.split(' ');
		 date = date[0].split('/');
		 var formatedDate = date[1]+"/"+date[0]+"/"+date[2];
		 $('#pluCreatedDate'+locationId+'1').val(formatedDate);
		 $('#pluUpdatedDate'+locationId+'1').val(formatedDate);
		 $("#prevImgW").css("opacity","0.5");
		 $("#nextImgW").css("opacity","0.5");
		 $("#currentPriceListW").html("1 of 1");
		 callCalender("pluExpiryDate"+locationId+"1");*/
		
		alert("Please provide atleast one Price List")
		/* var value = null;
		 if($("#skuId").val() != ""){
			value = $("#skuId").val();
			value = value + "0" +id;
			$("#pluCode"+locationId+"1").val(value);
			var op = '<option value='+value+'>'+value+'</option>';
			$("#runningPlu").html(op);
		 }*/
		 return;
	}
	var id = null;
	$("div ."+locationId+" .pricelistW").each(function(){
		 var disp = $(this).css("display");
		 if(disp == 'block'){
			 id = parseInt($(this).attr("id").replace('pricelist'+locationId,''));
			 $('#pricelist'+locationId+id).remove();
			/* var value = null;
			 if($("#skuId").val() != ""){
				value = $("#skuId").val();
				curid = id.toString();
				if(curid.length == 1)
					value = value + "0" +curid;
				else
					value = value + curid;
				 $("#runningPlu option[value='"+value+"']").remove();
			 }*/
		 }
	 });
	if(id == lastId){
		id = id - 1;
		$("#pricelist"+locationId+id).css("display","block");
	}
	else {
		id = id + 1;
		$("#pricelist"+locationId+id).css("display","block");
	}
	displayCurrentWellnessPageNo();
	
}


function displayCurrentWellnessPageNo(){
//	addSelectedProductAndMeasurementRange();
	debugger
	var locationId = "";
	$(".priceListWLocationDiv").each(function(){
		if($(this).css("display") == "block"){
			locationId = $(this).attr("class").replace(" priceListWLocationDiv","");
		}
	});
	var currentId = 0;
	var currentDisplayedId = "";
	$("div ."+locationId+" .pricelistW").each(function(){
		 currentId = currentId + 1;
		 var disp = $(this).css("display");
		 if(disp == 'block'){
			 currentDisplayedId = $(this).attr("id").replace('pricelist'+locationId,'');
			return false;
		 }
	 });
	$("#currentPriceListW").html(currentId+" of "+$("div ."+locationId+" .pricelistW").length);
	var firstId = parseInt($("div ."+locationId+" .pricelistW:first").attr("id").replace('pricelist'+locationId,''));
	var lastId = parseInt($("div ."+locationId+" .pricelistW:last").attr("id").replace('pricelist'+locationId,''));
	/*if(firstId == lastId){
		$("#nextImg").css("opacity","0.5");
		
	}*/
	if(currentDisplayedId == lastId)
		$("#nextImgW").css("opacity","0.5");
	else
		$("#nextImgW").css("opacity","1");
	if(currentDisplayedId == firstId)
		 $("#prevImgW").css("opacity","0.5");
	else
		$("#prevImgW").css("opacity","1");
	displayProductAndMeasurementRangeForWellness();
}


function displayCurrentPageNo(){
	//debugger;
//	addSelectedProductAndMeasurementRange();
	var locationId = "";
	$(".priceListLocationDiv").each(function(){
		if($(this).css("display") == "block"){
			locationId = $(this).attr("class").replace(" priceListLocationDiv","");
		}
	});
	locationId = locationId.replace(/\s/g, '');
	var currentId = 0;
	var currentDisplayedId = "";
	$("div ."+locationId+" .pricelist").each(function(){
		 currentId = currentId + 1;
		 var disp = $(this).css("display");
		 if(disp == 'block'){
			 currentDisplayedId = $(this).attr("id").replace('pricelist'+locationId,'');
			return false;
		 }
	 });
	$("#currentPriceList").html(currentId+" of "+$("div ."+locationId+" .pricelist").length);
	var firstId = parseInt($("div ."+locationId+" .pricelist:first").attr("id").replace('pricelist'+locationId,''));
	var lastId = parseInt($("div ."+locationId+" .pricelist:last").attr("id").replace('pricelist'+locationId,''));
	/*if(firstId == lastId){
		$("#nextImg").css("opacity","0.5");
		
	}*/
	if(currentDisplayedId == lastId)
		$("#nextImg").css("opacity","0.5");
	else
		$("#nextImg").css("opacity","1");
	if(currentDisplayedId == firstId)
		 $("#prevImg").css("opacity","0.5");
	else
		$("#prevImg").css("opacity","1");
	displayProductAndMeasurementRange();
}

function activateHeader(id){
	debugger
	if(id == 'priceList'){
		/*var bomImg = $("#bomImg").attr("src");
		 if(bomImg.indexOf('right')!= -1){
			 bomImg = bomImg.replace('right','left');
			 $("#bomImg").attr("src",bomImg);
		 }*/ 
		 var priceListImg = $("#priceListImg").attr("src");
		 if(priceListImg.indexOf('right')!= -1){
			 priceListImg = priceListImg.replace('right','left');
			 $("#priceListImg").attr("src",priceListImg);
			 $(".priceList").slideUp("slow");
		 }
		 else{
			 priceListImg = priceListImg.replace('left','right');
			 $("#priceListImg").attr("src",priceListImg);
			 $(".priceList").slideDown("slow");
			 
			 /*$(".pricelist").each(function(){
				 $(this).css("display","none");
			 });
			 var id = $(".pricelist:first").attr("id");
			 $("#"+id).css("display","block");*/
			 
			 
			 changePriceListType();
		 }
	}
	if(id == 'priceListW'){
		/*var bomImg = $("#bomImg").attr("src");
		 if(bomImg.indexOf('right')!= -1){
			 bomImg = bomImg.replace('right','left');
			 $("#bomImg").attr("src",bomImg);
		 }*/ 
		 var priceListImg = $("#priceListImgW").attr("src");
		 if(priceListImg.indexOf('right')!= -1){
			 priceListImg = priceListImg.replace('right','left');
			 $("#priceListImgW").attr("src",priceListImg);
			 $(".priceListW").slideUp("slow");
		 }
		 else{
			 priceListImg = priceListImg.replace('left','right');
			 $("#priceListImgW").attr("src",priceListImg);
			 $(".priceListW").slideDown("slow");
			 
			 /*$(".pricelist").each(function(){
				 $(this).css("display","none");
			 });
			 var id = $(".pricelist:first").attr("id");
			 $("#"+id).css("display","block");*/
			 
			 
			 changePriceListType();
		 }
	}
}


function resetAllQuick()
{
	$("Error").html("");
	$(".allField").val("");
}

function resetAll(){
	//debugger;
	////debugger
	$("Error").html("");
	$(".allField").val("");
	$('option').attr('selected', false);
	$("input[type='checkbox']").attr("checked",false);
	var id = null;
	$(".pricelist").each(function(){
	  id = parseInt($(this).attr("id").replace('pricelist',''));
	  $('#pricelist'+id).remove();
	});
	 var priceListDiv = '<div class=pricelist id=pricelist1></div>';
	 $(".col-md-10").append(priceListDiv);
	 $("#pricelist1").html(priceListDivContent);
	 
	 callCalender("pluExpiryDate1");
	 var dateTime = getCurrentDate();
	 var date = dateTime.split(' ');
	 date = date[0].split('/');
	 var formatedDate = date[1]+"/"+date[0]+"/"+date[2];
	 $('#pluCreatedDate1').val(formatedDate);
	 $('#pluUpdatedDate1').val(formatedDate);
	 $("#prevImg").css("opacity","0.5");
	 $("#nextImg").css("opacity","0.5");
	 $("#currentPriceList").html("1 of 1");
	// $(".dat").inputmask("dd/mm/yyyy", {"placeholder": "dd/mm/yyyy"});
	/* var value = null;
	 if($("#skuId").val() != ""){
		value = $("#skuId").val();
		value = value + "0" +id;
		$("#pluCode1").val(value);
		var op = '<option value='+value+'>'+value+'</option>';
		$("#runningPlu").html(op);
	 }
	 else
		 $("#runningPlu").html("");*/
	 var newFile = "<input type='file' id='picture1' multiple='multiple' onchange=loadImageFileAsURL('picture1');></input>";
	 var $fileInput=$("#picture1");
	 var $fileCopy = $(newFile);
	 $fileInput.replaceWith($fileCopy);
	 $("#picture1_image").html('');
	 $("#picture1_byte").val('');
	 $("#picture2_image").html('');
	 $("#picture2_byte").val('');
	 $("#picture3_image").html('');
	 $("#picture3_byte").val('');
}


function parseDate(str) {
    var mdy = str.split('/');
    return new Date(mdy[2], mdy[1]-1, mdy[0]);
}

function daydiff(first, second) {
    return (second-first)/(1000*60*60*24);
}


function activateQuickHeader(id,open){
	//debugger
	
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


function validateQuickSkuMaster(operation){
	debugger;
	//purpose:for checking internet conection
	var online = window.navigator.onLine;
	if(!online)
	{
	alert("check your internet connection,please try agian after some time");
	return;
	}
	debugger;
	$("#salePriceError").html("");
	$("#skuIdQuickError").html("");
	$("#uomQuickListError").html("");
	$("#hsnCodeQuickError").html("");
	$("#mrpPriceError").html("");

	var searchName = "";
	if($("#SkuMaster").length > 0 )
		searchName = $("#SkuMaster").val().trim();
	var location = "";
	if($("#outletLocation").length > 0)
		location = $("#outletLocation").val();
	var productCategory = "";
	if($("#outletCategory").length > 0)
		productCategory = $("#outletCategory").val();
	var subcategory = "";
	if($("#outletSubcategory").length > 0)
		subcategory = $("#outletSubcategory").val();
	var brand = "";
	if($("#outletBrandId").length > 0)
		brand = $("#outletBrandId").val();
	var department = "";
	if($("#outletDepartmentId").length > 0)
		department = $("#outletDepartmentId").val();
	var supplierid = "";
	if($("#outletSupplierId").length > 0)
		supplierid = $("#outletSupplierId").val();
	var finalObj = {}, skuPriceLists = [];
	finalObj.skuId = $("#skuIdQuick").val().trim();
	finalObj.productCategory = $("#categoryName").val();
	finalObj.category = $("#categoryName").val();
	finalObj.businessCategory = $("#categoryName").val();
	
	finalObj.productId = $("#skuIdQuick").val();
	//finalObj.subCategoryName = $("#subCategoryName").val();
	finalObj.subCategory = $("#subCategoryName").val();
	finalObj.businessSubCategory=$("#subCategoryName").val();
	finalObj.productName = $("#searchItems").val().trim();
	finalObj.ean = $("#eanQuick").val().trim();
	finalObj.uom = document.getElementById("uomQuickList").value;
//	$("#uomQuick").val();
	finalObj.taxCode = $("#taxCodeQuick").val();
	finalObj.uomLabel = $("#uomLabelQuick").val().trim();
	finalObj.packSize = $("#packSizeQuick").val().trim();
	finalObj.hsnCode = $("#hsnCodeQuick").val().trim();
	finalObj.model = $("#modelQuick").val().trim();
	//finalObj.color = $("#color").val();
	finalObj.storeLocation = "ALL";
	finalObj.minSaleQty = $("#minSaleQtyForQuick").val().trim();
	/*finalObj.salePriceValue = $("#salePrice").val();
	finalObj.mrpPrice = $("#mrp").val();
	 */
	finalObj.status = $("#status").val();
	finalObj.section = $("#sectionQuick").val().trim();
	finalObj.description = $("#shortDescriptionQuick").val().trim();
	finalObj.primaryDepartment = $("#primaryDepartmentQuick").val();
	finalObj.secondaryDepartment = $("#secondaryDepartmentQuick").val();

	if($("#skuIdQuick").val().trim() == ""){
		$("#skuIdQuickError").html("Enter Sku Id");
		focusDiv('skuIdQuickError');
		return;
	}else if(parseInt($("#skuIdQuick").val().length)>20){
		 $("#skuIdQuick").focus();
		 $("#skuIdQuickError").html("SKU Id can't exceeds 20 Characters");
			return;
		}
	if(parseInt($("#searchItems").val().length)>100){
		 $("#searchItems").focus();
		 $("#productNameError").html("Product Name can't exceeds 100 Characters");
			return;
	}
	
	if(parseInt($("#eanQuick").val().length)>20){
		 $("#eanQuick").focus();
			$("#eanError").html("EAN can't exceeds 20 Characters");
			return;
	}
	else {
		$("#eanError").html("");
	}
	
	if(parseInt($("#modelQuick").val().length)>30){
		 $("#modelQuick").focus();
			$("#modelError").html("Model can't exceeds 30 Characters");
			return;
	}
	else {
		$("#modelError").html("");
	}
	
	if($("#hsnCodeQuick").val().trim() == ""){
		$("#hsnCodeQuickError").html("Enter HSN Code");
		focusDiv('hsnCodeQuick');
		return;
	}else if(parseInt($("#hsnCodeQuick").val().length)>20){
		 $("#hsnCodeQuick").focus();
			$("#hsnCodeQuickError").html("Hsn code can't exceeds 20 Characters");
			return;
	}
	
	
	if($("#uomQuickList").val().trim() == ""){
		$("#uomQuickListError").html("Enter UOM");
		focusDiv('uomQuickListError');
		return;
	}
	

	if($("#hsnCodeQuick").val().trim() == ""){
		$("#hsnCodeQuickError").html("Enter HSN Code");
		focusDiv('hsnCodeQuick');
		return;
	}else if(parseInt($("#hsnCodeQuick").val().length)>20){
		 $("#hsnCodeQuick").focus();
			$("#hsnCodeQuickError").html("hsncode can't exceeds 20 Characters");
			return;
		}
	
	if($("#uomQuickList").val().trim() == ""){
		$("#uomQuickListError").html("Enter UOM");
		focusDiv('uomQuickListError');
		return;
	}
	
	if(parseInt($("#uomLabelQuick").val().length)>30){
		 $("#uomLabelQuick").focus();
			$("#weightError").html("UOM Label can't exceeds 30 Characters");
			return;
	}
	else {
		$("#weightError").html("");
	}
	
	if(parseInt($("#packSizeQuick").val().length)>11){
		 $("#packSizeQuick").focus();
			$("#packSizeError").html("Pack Size can't exceeds 11 digit");
			return;
	}
	else {
		$("#packSizeError").html("");
	}
	
	if($("#costPrice").val().trim() == ""){
		$("#costPriceError").html("Enter Cost Price");
		focusDiv('costPriceError');
		return;
	}
	
	if($("#mrp").val().trim() == ""){
		$("#mrpPriceError").html("Enter MRP");
		focusDiv('mrpPriceError');
		return;
	}
	
	if($("#salePrice").val().trim() == ""){
		$("#salePriceError").html("Enter Sale Price");
		focusDiv('salePriceError');
		return;
	}
	
	if(parseInt($("#sectionQuick").val().length)>100) {
		 $("#sectionQuick").focus();
			$("#sectionQuickError").html("Section can't exceeds 100 Characters");
			return;
	}
	else {
		$("#sectionQuickError").html("");
	}
	
	if(parseInt($("#businessCategoryQuick").val().length)>100) {
		 $("#businessCategoryQuick").focus();
			$("#businessCategoryQuickError").html("Business Category can't exceeds 100 Characters");
			return;
	}
	else {
		$("#businessCategoryQuickError").html("");
	}
	
	if(parseInt($("#businessSubcategoryQuick").val().length)>100) {
		 $("#businessSubcategoryQuick").focus();
			$("#businessSubcategoryQuickError").html("Business Subcategory can't exceeds 100 Characters");
			return;
	}
	else {
		$("#businessSubcategoryQuickError").html("");
	}
	
	if(parseInt($("#productHandingQuick").val().length)>50){
		 $("#productHandingQuick").focus();
			$("#productHandingQuickError").html("Product Handling can't exceeds 50 Characters");
			return;
	}
	else {
		$("#productHandingQuickError").html("");
	}
	
	if(parseInt($("#productUsageQuick").val().length)>250){
		 $("#productUsageQuick").focus();
			$("#productUsageQuickError").html("Product usage can't exceeds 250 Characters");
			return;
	}
	else {
		$("#productUsageQuickError").html("");
	}
	
	if(parseInt($("#productIntakeDetail").val().length)>50){
		 $("#productIntakeDetail").focus();
			$("#productIntakeQuickError").html("Product Intake can't exceeds 50 Characters");
			return;
	}
	else {
		$("#productIntakeQuickError").html("");
	}
	
	
	if(operation="edit"){
		
		if(parseInt($("#productIntakeQuick").val().length)>50){
			 $("#productIntakeQuick").focus();
				$("#productIntakeQuickError").html("Product Intake can't exceeds 50 Characters");
				return;
		}
		else {
			$("#productIntakeQuickError").html("");
		}
}	
	
	
	if(parseInt($("#uom1Quick").val().length)>20) {
		 $("#uom1Quick").focus();
			$("#uom1QuickError").html("UOM1 length can't exceeds 20 Characters");
			return;
	}
	else {
		$("#uom1QuickError").html("");
	}
	
	if(parseInt($("#uom2Quick").val().length)>20) {
		 $("#uom2Quick").focus();
			$("#uom2QuickError").html("UOM2 length can't exceeds 20 Characters");
			return;
	}
	else {
		$("#uom2QuickError").html("");
	}
	
	if(parseInt($("#shortDescriptionQuick").val().length)>250) {
		 $("#shortDescriptionQuick").focus();
			$("#shortDescriptionQuickError").html("Product Precaution length can't exceeds 250 Characters");
			return;
	}
	else {
		$("#shortDescriptionQuickError").html("");
	}
	
	if(parseInt($("#productPrecautionsQuick").val().length)>250) {
		 $("#productPrecautionsQuick").focus();
			$("#productPrecautionsQuickError").html("Product Precaution length can't exceeds 250 Characters");
			return;
	}
	else {
		$("#productPrecautionsQuickError").html("");
	}
	
	if(parseInt($("#productSideEffectsQuick").val().length)>250) {
		 $("#productSideEffectsQuick").focus();
			$("#productSideEffectsError").html("Product Side effects can't exceeds 250 Characters");
			return;
	}
	else {
		$("#productSideEffectsError").html("");
	}
	
	if($("#packSizeQuick").val().trim()=="")
		finalObj.packSize=1;

	var dateTime = getCurrentDate();
	var date = dateTime.split(' ');
	date = date[0].split('/');
	var formatedDate = date[1]+"/"+date[0]+"/"+date[2];

	//beolw are default values for additional values
	finalObj.quantity = 0.0;
	finalObj.editable = true;
	finalObj.reorderPoint = 0.0;
	finalObj.itemTaxExclusive = false;
	finalObj.trackingRequired = false;
	finalObj.zeroStock = $("#zeroStock").val();
	finalObj.toCreatWHSku = $("#toCreatWHSkuQuick").val();
	finalObj.jitStock = true;
//	quantityInHand : $("#pluQuantity"+locationId+id).val(),
	finalObj.orderQuantity = 0.0;
	finalObj.leadTimeDays = 0;
	finalObj.manufacturedItem = true;
	finalObj.packed = true;
	finalObj.frTaxCode = 0;
	finalObj.markUp = 0;
	finalObj.markDown = 0;
	
	finalObj.pictureIconflag="true";
	finalObj.picture1flag ="true";
	finalObj.picture2flag ="true";
	finalObj.picture3flag ="true";
	finalObj.stock = 0.0;

	finalObj.nonTaxable = true;
	finalObj.discountable = false;
	finalObj.allowDecimals = false;
	finalObj.costPriceEditable = true;

	var updatedDate=""
	var createdDate = ""
		if(operation=="edit"){
			updatedDate = $("#updatedDateStr").val();
			createdDate = $("#createdDateStr").val();
		} else{
			updatedDate =   formatedDate;
			createdDate =   formatedDate;
		}
	finalObj.updated_date =  updatedDate;
	finalObj.created_date =  createdDate;

	finalObj. product_side_effects = $("#productSideEffectsQuick").val().trim();
	finalObj. product_precautions = $("#productPrecautionsQuick").val().trim();
	finalObj. product_handing = $("#productHandingQuick").val().trim();
	finalObj.product_usage = $("#productUsageQuick").val().trim();
	finalObj.product_consumption_interaction = $("#productIntakeQuick").val();
	finalObj.uom1 = $("#uom1Quick").val().trim();
	finalObj.uom2 = $("#uom2Quick").val().trim();
	finalObj.is_combo = $("#comboQuick").val();
	finalObj.description = $("#searchItems").val();
	finalObj.productClass = $("#classNameQuick").val();
	finalObj.strProductUrl=$("#skuDescription_refId").val();
	finalObj.productUrl=$("#skuDescription_name").val();
	if(operation=="edit"){
		finalObj.supplierName = $("#supplierNameQuick").val();
		finalObj.supplier = $("#supplierNameQuick").val();
		finalObj.brandCode = $("#brandQuick").val();
		finalObj.manufacturerCode = $("#manufactureCodeQuick").val();
		finalObj.make = $("#manufactureNameQuick").val();
		finalObj.jitStock = $("#jitStockQuick").val();
		finalObj.minSaleQty = $("#minSaleQtyQuick").val();
		finalObj.manufacturedItem = $("#manufactureItemQuick").val();
		finalObj.packed = $("#packagedItemQuick").val();
		finalObj.editable = $("#editableQuick").val();
		finalObj.patternCode = $("#patternCodeQuick").val();
		finalObj.reorderPoint = $("#reorderPointQuick").val();
		
		finalObj.orderQuantity = $("#orderQuantityQuick").val();
		finalObj.leadTimeDays = $("#leadTimeQuick").val();
		finalObj.maxStock = $("#maxStockQuick").val();
		finalObj.stock = $("#stockQuick").val();
		finalObj.frTaxCode = $("#frTaxCodeQuick").val();
		finalObj.markUp = $("#markUpQuick").val();
		finalObj.markDown = $("#markDownQuick").val();
		finalObj.runningPluNumber = $("#runningPluQuick").val();
		finalObj.openRate = $("#openRateQuick").val();
		finalObj.lastCost = $("#lastCostQuick").val();
		finalObj.avgCost = $("#averageCostQuick").val();
		finalObj.minimumPrice = $("#minPriceQuick").val();
		
		finalObj.color = $("#colorQuick").val();
		finalObj.itemTaxExclusive = $("#itemTaxExclusiveQuick").val();
		finalObj.trackingRequired = $("#itemTrackRequiredQuick").val();
		finalObj.alternateSkuId = $("#alternate_skuQuick").val();
		finalObj.seasonCode = $("#season_codeQuick").val();
		finalObj.aliasName = $("#alias_nameQuick").val();
		finalObj.itemType = $("#item_typeQuick").val();
		finalObj.itemDesign = $("#item_designQuick").val();
		finalObj.is_combo = $("#comboDetailQuick").val();
		finalObj.product_handing = $("#productHandingDetailQuick").val();
		finalObj.product_usage = $("#productUsageDetailQuick").val();
		finalObj.product_consumption_interaction = $("#productIntakeDetailQuick").val().trim();
		finalObj.uom1 = $("#uom1DetailQuick").val().trim();
		finalObj.uom2 = $("#uom2DetailQuick").val().trim();
		finalObj.product_precautions = $("#productPrecautionsQuick").val().trim();
		finalObj.product_side_effects = $("#productSideEffectsQuick").val().trim();
		finalObj.warantyDetails = $("#warrantyDetailsQuick").val();
		finalObj.costPrice = $("#costPrice").val().trim();
		finalObj.wholesalePrice = $("#salePrice").val();
		finalObj.price = $("#mrp").val().trim();
		finalObj.salePrice = $("#salePrice").val().trim();
		finalObj.ean = $("#eanQuick").val();
		//finalObj.businessCategory=$("#businessCategoryQuick").val();
		//finalObj.businessSubCategory=$("#businessSubcategoryQuick").val();
		finalObj.technical_specification = $("#technicalSpecQuick").val().trim();
		finalObj.productSubClass = $("#subclassNameQuick").val();

	}
	
	var priceDetails=[];
	/*if($("#locationslist").val() != null){
		var locations = $("#locationslist").val().replace(/[[\]]/g,'');
		locations =	locations.toString().split(',');*/
//	for(var i=0; i<locations.length; i++){
	//	lc = locations[i];
	var packSize =$("#packSizeQuick").val();
	if(packSize =="")
		packSize =1;
	var	quickobj = { 
			costPrice : $("#costPrice").val(),
			wholesalePrice : $("#salePrice").val(),
			price : $("#mrp").val(),
			salePrice : $("#salePrice").val(),
			ean : $("#eanQuick").val(),
			description: $("#searchItems").val(),
			skuStatus : true,
//			packagingDate : $("#pluPackagedDateForQuick").val(),
			created_date : createdDate,
			updated_date :updatedDate,
			pack_size : packSize,
			businessCategory:$("#businessCategoryQuick").val(),
			businessSubCategory:$("#businessSubcategoryQuick").val(),
			technical_specification : $("#technicalSpecQuick").val(),
			productSubClass : $("#subclassNameQuick").val(),
			quantityInHand : 0.0,
			storeLocation:""
	};
	priceDetails.push(quickobj);
//	}
//	}

	finalObj.skuPriceLists = priceDetails;
	/*var obj={salePrice:$("#salePrice").val(),price:$("#mrp").val()};
	 finalObj.skuPriceLists.push(obj);*/
	var maxRecords = 10;
	if ($("#maxRecords").length > 0)
		maxRecords= $("#maxRecords").val();
	finalObj.maxRecords = maxRecords;
	console.log(priceDetails)
	var contextPath = $("#contextPath").val();
	if(operation=="new"){
		URL = contextPath + "/outletMaster/createQuickSku.do";
	}
	else if(operation=="edit"){
		URL = contextPath + "/outletMaster/quickEditSku.do";
	}
	var formData = JSON.stringify(finalObj);

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
			//debugger
			messageStatus= JSON.stringify(result);
			var parsed_json = JSON.parse(messageStatus);
			var code = parsed_json.code;

			//alert(parsed_json.code)
			if(code != 0){
				$("#ErrorQuick").html(parsed_json.error);
				$("#SuccessQuick").html("");
			}else{
				$("#SuccessQuick").html(parsed_json.success);
				$("#ErrorQuick").html("");
			}
				

			/*else{
   			    $("#right-side").html(result);
				$("#outletLocation").val(location);
				$("#outletCategory").val(productCategory);
				$("#outletSubcategory").val(subcategory);
				$("#outletSupplierId").val(supplierid);
				$("#SkuMaster").val(searchName);
				$("#outletBrandId").val(brand);
				$("#outletDepartmentId").val(department);
				$("#maxRecords").val();
  				}*/
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
function validateQuickSkuMaster(operation){
	//purpose:for checking internet conection
	var online = window.navigator.onLine;
	if(!online)
	{
		alert("check your internet connection,please try agian after some time");
		return;
	}
	debugger;

	$("#salePriceError").html("");
	$("#skuIdQuickError").html("");
	$("#uomQuickListError").html("");
	$("#hsnCodeQuickError").html("");
	$("#mrpPriceError").html("");

	var searchName = "";
	if($("#SkuMaster").length > 0 )
		searchName = $("#SkuMaster").val().trim();
	var location = "";
	if($("#outletLocation").length > 0)
		location = $("#outletLocation").val();
	var productCategory = "";
	if($("#outletCategory").length > 0)
		productCategory = $("#outletCategory").val();
	var subcategory = "";
	if($("#outletSubcategory").length > 0)
		subcategory = $("#outletSubcategory").val();
	var brand = "";
	if($("#outletBrandId").length > 0)
		brand = $("#outletBrandId").val();
	var department = "";
	if($("#outletDepartmentId").length > 0)
		department = $("#outletDepartmentId").val();
	var supplierid = "";
	if($("#outletSupplierId").length > 0)
		supplierid = $("#outletSupplierId").val();
	var finalObj = {}, skuPriceLists = [];
	finalObj.skuId = $("#skuIdQuick").val().trim();
	finalObj.productCategory = $("#categoryName").val();
	finalObj.category = $("#categoryName").val();
	finalObj.businessCategory = $("#categoryName").val();
	
	finalObj.productId = $("#skuIdQuick").val();
	//finalObj.subCategoryName = $("#subCategoryName").val();
	finalObj.subCategory = $("#subCategoryName").val();
	finalObj.businessSubCategory=$("#subCategoryName").val();
	finalObj.productName = $("#searchItems").val().trim();
	finalObj.ean = $("#eanQuick").val().trim();
	finalObj.uom = document.getElementById("uomQuickList").value;
//	$("#uomQuick").val();
	finalObj.taxCode = $("#taxCodeQuick").val();
	finalObj.uomLabel = $("#uomLabelQuick").val().trim();
	finalObj.packSize = $("#packSizeQuick").val().trim();
	finalObj.hsnCode = $("#hsnCodeQuick").val().trim();
	finalObj.model = $("#modelQuick").val().trim();
	//finalObj.color = $("#color").val();
	finalObj.storeLocation = "ALL";
	finalObj.minSaleQty = $("#minSaleQtyForQuick").val().trim();
	finalObj.salePriceValue = $("#salePrice").val();
	finalObj.mrpPrice = $("#mrp").val();
	 
	finalObj.status = $("#status").val();
	finalObj.section = $("#sectionQuick").val().trim();
	finalObj.description = $("#shortDescriptionQuick").val().trim();
	finalObj.primaryDepartment = $("#primaryDepartmentQuick").val();
	finalObj.secondaryDepartment = $("#secondaryDepartmentQuick").val();

	if($("#skuIdQuick").val().trim() == ""){
		$("#skuIdQuickError").html("Enter Sku Id");
		focusDiv('skuIdQuickError');
		return;
	}

	
	
	if($("#uomQuickList").val().trim() == ""){
		$("#uomQuickListError").html("Enter UOM");
		focusDiv('uomQuickListError');
		return;
	}
	

	if($("#hsnCodeQuick").val().trim() == ""){
		$("#hsnCodeQuickError").html("Enter HSN Code");
		focusDiv('hsnCodeQuick');
		return;
	}
	
	if($("#costPrice").val().trim() == ""){
		$("#costPriceError").html("Enter Cost Price");
		focusDiv('costPriceError');
		return;
	}
	
	if($("#mrp").val().trim() == ""){
		$("#mrpPriceError").html("Enter MRP");
		focusDiv('mrpPriceError');
		return;
	}
	
	if($("#salePrice").val().trim() == ""){
		$("#salePriceError").html("Enter Sale Price");
		focusDiv('salePriceError');
		return;
	}
	
	
	
	if($("#packSizeQuick").val().trim()=="")
		finalObj.packSize=1;

	var dateTime = getCurrentDate();
	var date = dateTime.split(' ');
	date = date[0].split('/');
	var formatedDate = date[1]+"/"+date[0]+"/"+date[2];



	//beolw are default values for additional values
	finalObj.quantity = 0.0;
	finalObj.editable = true;
	finalObj.reorderPoint = 0.0;
	finalObj.itemTaxExclusive = false;
	finalObj.trackingRequired = false;
	finalObj.zeroStock = $("#zeroStock").val();
	finalObj.toCreatWHSku = $("#toCreatWHSkuQuick").val();
	finalObj.jitStock = true;
//	quantityInHand : $("#pluQuantity"+locationId+id).val(),
	finalObj.orderQuantity = 0.0;
	finalObj.leadTimeDays = 0;
	finalObj.manufacturedItem = true;
	finalObj.packed = true;
	finalObj.frTaxCode = 0;
	finalObj.markUp = 0;
	finalObj.markDown = 0;
	
	finalObj.pictureIconflag="true";
	finalObj.picture1flag ="true";
	finalObj.picture2flag ="true";
	finalObj.picture3flag ="true";
	finalObj.stock = 0.0;

	finalObj.nonTaxable = true;
	finalObj.discountable = false;
	finalObj.allowDecimals = false;
	finalObj.costPriceEditable = true;

	var updatedDate=""
	var createdDate = ""
		if(operation=="edit"){
			updatedDate = $("#updatedDateStr").val();
			createdDate = $("#createdDateStr").val();
		} else{
			updatedDate =   formatedDate;
			createdDate =   formatedDate;
		}
	finalObj.updated_date =  updatedDate;
	finalObj.created_date =  createdDate;

	finalObj. product_side_effects = $("#productSideEffectsQuick").val().trim();
	finalObj. product_precautions = $("#productPrecautionsQuick").val().trim();
	finalObj. product_handing = $("#productHandingQuick").val().trim();
	finalObj.product_usage = $("#productUsageQuick").val().trim();
	finalObj.product_consumption_interaction = $("#productIntakeQuick").val();
	finalObj.uom1 = $("#uom1Quick").val().trim();
	finalObj.uom2 = $("#uom2Quick").val().trim();
	finalObj.is_combo = $("#comboQuick").val();
	finalObj.description = $("#searchItems").val();
	finalObj.productClass = $("#classNameQuick").val();
	finalObj.strProductUrl=$("#skuDescription_refId").val();
	finalObj.productUrl=$("#skuDescription_name").val();
	if(operation=="edit"){
		finalObj.supplierName = $("#supplierNameQuick").val();
		finalObj.supplier = $("#supplierNameQuick").val();
		finalObj.brandCode = $("#brandQuick").val();
		finalObj.manufacturerCode = $("#manufactureCodeQuick").val();
		finalObj.make = $("#manufactureNameQuick").val();
		finalObj.jitStock = $("#jitStockQuick").val();
		finalObj.minSaleQty = $("#minSaleQtyQuick").val();
		finalObj.manufacturedItem = $("#manufactureItemQuick").val();
		finalObj.packed = $("#packagedItemQuick").val();
		finalObj.editable = $("#editableQuick").val();
		finalObj.patternCode = $("#patternCodeQuick").val();
		finalObj.reorderPoint = $("#reorderPointQuick").val();
		
		finalObj.orderQuantity = $("#orderQuantityQuick").val();
		finalObj.leadTimeDays = $("#leadTimeQuick").val();
		finalObj.maxStock = $("#maxStockQuick").val();
		finalObj.stock = $("#stockQuick").val();
		finalObj.frTaxCode = $("#frTaxCodeQuick").val();
		finalObj.markUp = $("#markUpQuick").val();
		finalObj.markDown = $("#markDownQuick").val();
		finalObj.runningPluNumber = $("#runningPluQuick").val();
		finalObj.openRate = $("#openRateQuick").val();
		finalObj.lastCost = $("#lastCostQuick").val();
		finalObj.avgCost = $("#averageCostQuick").val();
		finalObj.minimumPrice = $("#minPriceQuick").val();
		
		finalObj.color = $("#colorQuick").val();
		finalObj.itemTaxExclusive = $("#itemTaxExclusiveQuick").val();
		finalObj.trackingRequired = $("#itemTrackRequiredQuick").val();
		finalObj.alternateSkuId = $("#alternate_skuQuick").val();
		finalObj.seasonCode = $("#season_codeQuick").val();
		finalObj.aliasName = $("#alias_nameQuick").val();
		finalObj.itemType = $("#item_typeQuick").val();
		finalObj.itemDesign = $("#item_designQuick").val();
		finalObj.is_combo = $("#comboDetailQuick").val();
		finalObj.product_handing = $("#productHandingDetailQuick").val();
		finalObj.product_usage = $("#productUsageDetailQuick").val();
		finalObj.product_consumption_interaction = $("#productIntakeDetailQuick").val().trim();
		finalObj.uom1 = $("#uom1DetailQuick").val().trim();
		finalObj.uom2 = $("#uom2DetailQuick").val().trim();
		finalObj.product_precautions = $("#productPrecautionsQuick").val().trim();
		finalObj.product_side_effects = $("#productSideEffectsQuick").val().trim();
		finalObj.warantyDetails = $("#warrantyDetailsQuick").val();
		finalObj.costPrice = $("#costPrice").val().trim();
		finalObj.wholesalePrice = $("#salePrice").val();
		finalObj.price = $("#mrp").val().trim();
		finalObj.salePrice = $("#salePrice").val().trim();
		finalObj.ean = $("#eanQuick").val();
		//finalObj.businessCategory=$("#businessCategoryQuick").val();
		//finalObj.businessSubCategory=$("#businessSubcategoryQuick").val();
		finalObj.technical_specification = $("#technicalSpecQuick").val().trim();
		finalObj.productSubClass = $("#subclassNameQuick").val();

	}
	
	var priceDetails=[];
	if($("#locationslist").val() != null){
		var locations = $("#locationslist").val().replace(/[[\]]/g,'');
		locations =	locations.toString().split(',');
//	for(var i=0; i<locations.length; i++){
	//	lc = locations[i];
	var packSize =$("#packSizeQuick").val();
	if(packSize =="")
		packSize =1;
	var	quickobj = { 
			costPrice : $("#costPrice").val(),
			wholesalePrice : $("#salePrice").val(),
			price : $("#mrp").val(),
			salePrice : $("#salePrice").val(),
			ean : $("#eanQuick").val(),
			description: $("#searchItems").val(),
			skuStatus : true,
//			packagingDate : $("#pluPackagedDateForQuick").val(),
			created_date : createdDate,
			updated_date :updatedDate,
			pack_size : packSize,
			businessCategory:$("#businessCategoryQuick").val(),
			businessSubCategory:$("#businessSubcategoryQuick").val(),
			technical_specification : $("#technicalSpecQuick").val(),
			productSubClass : $("#subclassNameQuick").val(),
			quantityInHand : 0.0,
			storeLocation:""
	};
	priceDetails.push(quickobj);
//	}
//	}

	finalObj.skuPriceLists = priceDetails;
	var obj={salePrice:$("#salePrice").val(),price:$("#mrp").val()};
	 finalObj.skuPriceLists.push(obj);
	var maxRecords = 10;
	if ($("#maxRecords").length > 0)
		maxRecords= $("#maxRecords").val();
	finalObj.maxRecords = maxRecords;
	console.log(priceDetails)
	var contextPath = $("#contextPath").val();
	if(operation=="new"){
		URL = contextPath + "/outletMaster/createQuickSku.do";
	}
	else if(operation=="edit"){
		URL = contextPath + "/outletMaster/quickEditSku.do";
	}
	var formData = JSON.stringify(finalObj);

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

			//debugger

			messageStatus= JSON.stringify(result);
			var parsed_json = JSON.parse(messageStatus);
			var code = parsed_json.code;

			//alert(parsed_json.code)
			if(code != 0){
				$("#ErrorQuick").html(parsed_json.error);
				$("#SuccessQuick").html("");
			}else{
				$("#SuccessQuick").html(parsed_json.success);
				$("#ErrorQuick").html("");
			}
				

			else{
   			    $("#right-side").html(result);
				$("#outletLocation").val(location);
				$("#outletCategory").val(productCategory);
				$("#outletSubcategory").val(subcategory);
				$("#outletSupplierId").val(supplierid);
				$("#SkuMaster").val(searchName);
				$("#outletBrandId").val(brand);
				$("#outletDepartmentId").val(department);
				$("#maxRecords").val();
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
}*/

/*
function validateSkuForm(operation){
	 //purpose:for checking internet conection
	//debugger;
	var online = window.navigator.onLine;
  	if(!online)
  	{
  		alert("check your internet connection,please try agian after some time");
  		return;
  	}
	addSelectedProductAndMeasurementRange();
	var finalObj = {}, skuPriceLists = [];
	if($("#skuId").val().trim() == ""){
		$("#skuIdError").html("Enter Sku Id");
		focusDiv('skuIdError');
		return;
	}
	
	if($("#shortDescription").val().trim() == ""){
		$("#shortDescriptionError").html("Enter Product Name");
		focusDiv('shortDescriptionError');
		return;
	}
	if($("#minSaleQty").val().trim() == ""){
		$("#minSaleQtyError").html("Enter Minimum Sales Quantity");
		focusDiv('minSaleQtyError');
		return;
	}
	if($("#manufacturer").val().trim() == ""){
		$("#manufacturerError").html("Enter Manufacturer");
		focusDiv('manufacturerError');
		return;
	}
	
	
	if($("#uomList").val().trim() == ""){
		$("#uomListError").html("Enter UOM");
		focusDiv('uomListError');
		return;
	}
	
	
	stock
	if($("#stock").val().trim() == ""){
		$("#stockError").html("Enter Stock");
		focusDiv('stockError');
		return;
	}
	
	if($("#hsnCode").val().trim() == ""){
		$("#hsnCodeError").html("Enter HSN Code");
		focusDiv('hsnCodeError');
		return;
	}

	if($("#searchItems").val().trim() == ""){
	  $("#productNameError").html("Enter Product Name");
	  $("#searchItems").focus();
	  return;
	}
	if($("#productId").val() == ""){
	  $("#productNameError").html("Product Name doesn't exist");
	  $("#searchItems").focus();
	  return;
	}
	if(operation == "new"){
		finalObj.status = $("#status").val();
	}
	if(operation == "edit"){
		finalObj.status = $("#editstatus").val();
	}
	
	
	
	var searchName = "";
		if($("#SkuMaster").length > 0 )
			searchName = $("#SkuMaster").val().trim();
		var location = "";
	if($("#outletLocation").length > 0)
		location = $("#outletLocation").val();
	var productCategory = "";
	if($("#outletCategory").length > 0)
		productCategory = $("#outletCategory").val();
	var subcategory = "";
	if($("#outletSubcategory").length > 0)
		subcategory = $("#outletSubcategory").val();
	var brand = "";
	if($("#outletBrandId").length > 0)
		brand = $("#outletBrandId").val();
	var department = "";
	if($("#outletDepartmentId").length > 0)
		department = $("#outletDepartmentId").val();
	var supplierid = "";
	if($("#outletSupplierId").length > 0)
		supplierid = $("#outletSupplierId").val();
	
	if($("#location").val() == null){
		$("#locationError").html("Select Atleast one Location");
		focusDiv('locationError');
		return;
	}
	
	//debugger;
	finalObj.skuId = $("#skuId").val();
	finalObj.productId = $("#skuId").val();
	//finalObj.categoryName = $("#categoryName").val();
	finalObj.productCategory = $("#categoryNameID").val();
	finalObj.categoryId= $("#categoryId").val();
	//finalObj.subCategoryName = $("#subCategoryName").val();
	finalObj.subCategory = $("#subCategoryNameID").val();
	
	finalObj.category = $("#categoryNameID").val();
	finalObj.businessCategory = $("#categoryNameID").val();
	
	finalObj.productId = $("#skuIdQuick").val();
	//finalObj.subCategoryName = $("#subCategoryName").val();
	finalObj.subCategory = $("#subCategoryNameID").val();
	finalObj.businessSubCategory=$("#subCategoryNameID").val();
	
	
	
	
	finalObj.productName = $("#searchItems").val();
	finalObj.supplierName = $("#supplier_Id").val();
	finalObj.supplier = $("#searchSupplier").val();
	finalObj.ean = $("#ean").val();
	finalObj.manufacturedItem = $("#manufactureItem").val();
	finalObj.packed = $("#packagedItem").val();
	finalObj.brandCode = $("#brandCode").val();
	finalObj.taxonDiscountedPrice = $("#istaxon").val();

	finalObj.batchRequired = $("#batchrequired").val();
	finalObj.costPriceEditable = $("#costPriceEditable").val();
	//debugger
	finalObj.manufacturerCode = $("#manufacturerCode").val();
	finalObj.make = $("#manufacturer").val();
	finalObj.uom = document.getElementById("uomList").value;
//		$("#uom").val();
	finalObj.quantity = $("#stock").val();
	finalObj.uomLabel = $("#uomLabel").val();
	finalObj.packSize = $("#packSize").val();
	finalObj.jitStock = $("#jitStock").val();
	finalObj.zeroStock = $("#zeroStock").val();
	finalObj.itemTaxExclusive = $("#itemTaxExclusive").val();
	finalObj.minSaleQty = $("#minSaleQty").val();
	finalObj.color = $("#color").val();
	finalObj.patternCode = $("#patternCode").val();
	finalObj.reorderPoint = $("#reorderPoint").val();
	finalObj.orderQuantity = $("#orderQuantity").val();
	finalObj.leadTimeDays = $("#leadTime").val();
    finalObj.editable = $("#editable").val();
	finalObj.primaryDepartment = $("#primaryDepartment").val();
	finalObj.secondaryDepartment = $("#secondaryDepartment").val();
	finalObj.maxStock = $("#maxStock").val();
	finalObj.stock = $("#stock").val();
	finalObj.section = $("#section").val();
	finalObj.taxCode = $("#taxCode").val();
	finalObj.trackingRequired = $("#itemTrackRequired").val();
	finalObj.created_date = $("#createdDate").val();
	
	finalObj.strProductUrl=$("#skuDescription_refId").val();
	finalObj.productUrl=$("#skuDescription_name").val();
	
	//finalObj.costPriceEditable = true;
	
	 finalObj.product_side_effects = $("#productSideEffects").val();
     finalObj.product_precautions = $("#productPrecautions").val();
     finalObj.product_handing = $("#productHandingDetail").val();
     finalObj.product_usage = $("#productUsageDetail").val();
     finalObj.product_consumption_interaction = $("#productIntakeDetail").val();
     finalObj.uom1 = $("#uom1Detail").val();
     finalObj.uom2 = $("#uom2Detail").val();
     finalObj.is_combo = $("#comboDetail").val();
     
	 var maxRecords = 10;
		if ($("#maxRecords").length > 0)
			maxRecords= $("#maxRecords").val();
	finalObj.maxRecords = maxRecords;
	
	var searchName = "";
	if($("#searchName").length > 0 )
		searchName = $("#searchName").val().trim();
	finalObj.searchCriteria = searchName;
	
	
	if($("#frTaxCode").val() == "")
		finalObj.frTaxCode = 0;
	else
		finalObj.frTaxCode = $("#frTaxCode").val();
	finalObj.markUp = $("#markUp").val();
	finalObj.markDown = $("#markDown").val();
	finalObj.hsnCode = $("#hsnCode").val();
	finalObj.runningPluNumber = $("#runningPlu").val();
	finalObj.model = $("#model").val();
	finalObj.openRate = $("#openRate").val();
	finalObj.lastCost = $("#lastCost").val();
	finalObj.avgCost = $("#averageCost").val();
	finalObj.minimumPrice = $("#minPrice").val();
	finalObj.created_date = $("#createdDate").val();
	finalObj.updated_date = $("#lastUpdated").val();
	finalObj.strPicture1 = $("#picture1_refId").val();
	finalObj.picture1 = $("#picture1_name").val();
	finalObj.theme = $("#skutheme").val();
	finalObj.subTheme = $("#skuSubtheme").val();
	finalObj.itemDesign = $("#skuitemDesign").val();
	
	
	
//	finalObj.styleRange = $("#styleRangeDropDown").val();
	
	if($("#picture1_thumbnail").length > 0)
		finalObj.picture1flag = "true";
	else
		finalObj.picture1flag = "false";
	finalObj.strPicture2 = $("#picture2_refId").val();
	finalObj.picture2 = $("#picture2_name").val();
	if($("#picture2_thumbnail").length > 0)
		finalObj.picture2flag = "true";
	else
		finalObj.picture2flag = "false";
	finalObj.strPicture3 = $("#picture3_refId").val();
	finalObj.picture3 = $("#picture3_name").val();
	if($("#picture3_thumbnail").length > 0)
		finalObj.picture3flag = "true";
	else
		finalObj.picture3flag = "false";
	
	Added by manideep
	Date:04/09/2019
	Reason:To set the picture icon.
	
	finalObj.strPictureIcon = $("#pictureIcon_refId").val();
	finalObj.pictureIcon = $("#pictureIcon_name").val();
	
	if($("#pictureIcon_thumbnail").length > 0)
		finalObj.pictureIconflag = "true";
	else
		finalObj.pictureIconflag = "false";
	
	//end picture icon code.
	
	finalObj.nonTaxable = $("#nonTaxable").prop("checked");
	finalObj.discountable = $("#discountable").prop("checked");
	finalObj.allowDecimals = $("#allowDecimals").prop("checked");
	
	if($("input:radio[name='priceListType']:checked").val() == "all")
		finalObj.storeLocation = "ALL";
	else
	finalObj.storeLocation = "";
	finalObj.description = $("#shortDescription").val();
	finalObj.warantyDetails = $("#warrantyDetails").val();
	finalObj.alternateSkuId = $("#alternate_sku").val();
	finalObj.aliasName = $("#alias_name").val();
	finalObj.itemType = $("#item_type").val();
	finalObj.itemDesign = $("#item_design").val();
	finalObj.seasonCode = $("#season_code").val();
	finalObj.skuPriceLists = skuPriceLists;
//	var quantityInPriceList = 0;
	var flag = true; 
	
	var locationIdArray = [];
	if($("input:radio[name='priceListType']:checked").val() == "all"){
		locationIdArray.push("AllLocation");
	}else{
		$("#selectedLocation option").each(function(){
			var location = $(this).val();
			location = location.replace(/ /g,'_');
			locationIdArray.push(location);
		});
	}
	
	for(var i = 0; i < locationIdArray.length ; i++){
		var priceList = [];
		var locationId = locationIdArray[i];
		 var storeLocation = "";
		 if(locationId != "AllLocation"){
			 storeLocation = locationId.replace(/_/g,' ');
		 }
		 
			
		$("div ."+locationId+" .pricelist").each(function(){
			 id = parseInt($(this).attr("id").replace('pricelist'+locationId,''));
		debugger;
			 //koti
		var eanarraylist=[];
                        if(locationId == $("#selectedLocation option:selected").val()){
                                var len = $("#SKUMasterEAN"+locationId+id+"1 tr").length-1;
                                var  eanLocation = $("#selectedLocation option:selected").val();
                                 idean = parseInt($(this).attr("id").replace('pricelist'+eanLocation,''));
                                 for(var i=1;i<=len;i++){
                                                var idAttrEan = $("#SKUMasterEAN"+eanLocation+idean+1+" tr:eq("+i+") td:last").attr("id");
                                                idAttrEan = idAttrEan.replace('action','');
                                                var test = $("#eantable"+idAttrEan).val();
                                                if(i<len){
                                                eanarraylist +=$("#eantable"+idAttrEan).val() +","; 
                                                }else{
                                                eanarraylist +=$("#eantable"+idAttrEan).val();
                                                }
                                        }
                        }
                                        $("#ean"+locationId+id).val(eanarraylist);
		
		
			
				var len = $("#SKUMasterEAN"+locationId+id+"1 tr").length-1;
				
				 idean = parseInt($(this).attr("id").replace('pricelist'+locationId,''));
				 for(var i=1;i<=len;i++){
						var idAttrEan = $("#SKUMasterEAN"+locationId+idean+1+" tr:eq("+i+") td:last").attr("id");
						idAttrEan = idAttrEan.replace('action','');
						var test = $("#eantable"+idAttrEan).val();
						if(i<len){
						eanarraylist +=$("#eantable"+idAttrEan).val() +","; 
						}else{
						eanarraylist +=$("#eantable"+idAttrEan).val();
						}
					}
			
			
					$("#eanduplicate"+locationId+id).val(eanarraylist);
					
				//koti	
					if(locationId == "AllLocation" && $("#pluCostPrice"+locationId+id).val() == "" && $("#pluPrice"+locationId+id).val() == ""){
						 
					 }else{
					
					
			 if($("#pluCostPrice"+locationId+id).val() == ""){
				 debugger;
				 $("#pluCostPrice"+locationId+id+"Error").html("Enter Cost Price");
				 $(".pricelist").each(function(){
					 $(this).css("display","none");
				 });
				 $(this).css("display","block");
				 $(".priceList").css("display","block");
				 $(".priceListLocationDiv").each(function(){
					 $(this).css("display","none");
				});
				 $("."+locationId).css("display","block");
				 $("div ."+locationId+" .priceList").css("display","block");
				 displayCurrentPageNo();
				 flag = false;
//				 alert("pluCostPrice"+locationId+id+"Error");
				 if(storeLocation != "")
					 $("#selectedLocation").val(storeLocation);
				 	 $("#pluCostPrice"+locationId+id).focus();
				 return false;
			 }
			 if($("#pluPrice"+locationId+id).val() == ""){
				 $("#pluPrice"+locationId+id+"Error").html("Enter Price");
				 $(".pricelist").each(function(){
					 $(this).css("display","none");
				 });
				 $(this).css("display","block");
				 $(".priceList").css("display","block");
				 $(".priceListLocationDiv").each(function(){
					 $(this).css("display","none");
				});
				 $("."+locationId).css("display","block");
				 $("div ."+locationId+" .priceList").css("display","block");
				 displayCurrentPageNo();
				 flag = false;
				 if(storeLocation != "")
					 $("#selectedLocation").val(storeLocation);
				 $("#pluPrice"+locationId+id).focus();
				 return false;
			 }
			 if($("#pluSalePrice"+locationId+id).val() == ""){
				 $("#pluSalePrice"+locationId+id+"Error").html("Enter Sale Price");
				 $(".pricelist").each(function(){
					 $(this).css("display","none");
				 });
				 $(this).css("display","block");
				 $(".priceList").css("display","block");
				 $(".priceListLocationDiv").each(function(){
					 $(this).css("display","none");
				});
				 $("."+locationId).css("display","block");
				 $("div ."+locationId+" .priceList").css("display","block");
				 displayCurrentPageNo();
				 flag = false;
				 if(storeLocation != "")
					 $("#selectedLocation").val(storeLocation);
				 $("#pluSalePrice"+locationId+id).focus();
				 return false;
			 }
			 if(parseFloat($("#pluCostPrice"+locationId+id).val()) > parseFloat($("#pluSalePrice"+locationId+id).val())){
				$("#pluSalePrice"+locationId+id+"Error").html("Sale Price Should be > Cost Price");
				 $(".pricelist").each(function(){
					 $(this).css("display","none");
				 });
				 $(this).css("display","block");
				 $(".priceList").css("display","block");
				 $(".priceListLocationDiv").each(function(){
					 $(this).css("display","none");
				});
				 $("."+locationId).css("display","block");
				 $("div ."+locationId+" .priceList").css("display","block");
				 displayCurrentPageNo();
				 flag = false;
				 if(storeLocation != "")
					 $("#selectedLocation").val(storeLocation);
				 $("#pluSalePrice"+locationId+id).focus();
				 return false;
			 }
			 if($("#pluWsPrice"+locationId+id).val() == ""){
				 $("#pluWsPrice"+locationId+id+"Error").html("Enter Whole Sale Price");
				 $(".pricelist").each(function(){
					 $(this).css("display","none");
				 });
				 $(this).css("display","block");
				 $(".priceList").css("display","block");
				 $(".priceListLocationDiv").each(function(){
					 $(this).css("display","none");
				});
				 $("."+locationId).css("display","block");
				 $("div ."+locationId+" .priceList").css("display","block");
				 displayCurrentPageNo();
				 flag = false;
				 if(storeLocation != "")
					 $("#selectedLocation").val(storeLocation);
				 $("#pluWsPrice"+locationId+id).focus();
				 return false;
			 }
			 if($("#pluQuantity"+locationId+id).val() == ""){
				 $("#pluQuantity"+locationId+id+"Error").html("Enter Quantity");
				 $(".pricelist").each(function(){
					 $(this).css("display","none");
				 });
				 $(this).css("display","block");
				 $(".priceList").css("display","block");
				 $(".priceListLocationDiv").each(function(){
					 $(this).css("display","none");
				});
				 $("."+locationId).css("display","block");
				 $("div ."+locationId+" .priceList").css("display","block");
				 displayCurrentPageNo();
				 flag = false;
				 if(storeLocation != "")
					 $("#selectedLocation").val(storeLocation);
				 $("#pluQuantity"+locationId+id).focus();
				 return false;
			 }
			 if($("#pluExpiryDate"+locationId+id).val() != ""){
				 var re = /^[0-9/]+$/;
				 if(!re.test($("#pluExpiryDate"+locationId+id).val())){
						$("#pluExpiryDate"+locationId+id+"Error").html("Invalid Date");
						$(".pricelist").each(function(){
						 $(this).css("display","none");
					    });
						$(this).css("display","block");
						$(".priceList").css("display","block");
						 $(".priceListLocationDiv").each(function(){
							 $(this).css("display","none");
						});
						 $("."+locationId).css("display","block");
						$("div ."+locationId+" .priceList").css("display","block");
						displayCurrentPageNo();
						flag = false;
						if(storeLocation != "")
							 $("#selectedLocation").val(storeLocation);
						$("#pluExpiryDate"+locationId+id).focus();
						return false;
				 }
			 }
			 if($("#pluDesc"+locationId+id).val() == ""){
				 $("#pluDesc"+locationId+id+"Error").html("Enter Description");
				 $(".pricelist").each(function(){
					 $(this).css("display","none");
				 });
				 $(this).css("display","block");
				 $(".priceList").css("display","block");
				 $(".priceListLocationDiv").each(function(){
					 $(this).css("display","none");
				});
				 $("."+locationId).css("display","block");
				 $("div ."+locationId+" .priceList").css("display","block");
				 displayCurrentPageNo();
				 flag = false;
				 if(storeLocation != "")
					 $("#selectedLocation").val(storeLocation);
				 $("#pluDesc"+locationId+id).focus();
				 return false;
			 }
//			 
			 var price = $("#pluPrice"+locationId+id).val();
		
			
				 priceList.push(price);
//				 //debugger
			 var obj = {
					
					 costPrice : $("#pluCostPrice"+locationId+id).val(),
					 price : $("#pluPrice"+locationId+id).val(),
					 salePrice : $("#pluSalePrice"+locationId+id).val(),
					 wholesalePrice : $("#pluWsPrice"+locationId+id).val(),
					 extraPrice : $("#pluExtraPrice"+locationId+id).val(),
					 pluCode : $("#pluCode"+locationId+id).val(),
					 skuStatus : $("#skuStatus"+locationId+id).val(),
					 created_date : $("#pluCreatedDate"+locationId+id).val(),
					 updated_date : $("#pluUpdatedDate"+locationId+id).val(),
					 expiry_date : $("#pluExpiryDate"+locationId+id).val(),
					 packagingDate : $("#pluPackagedDateAllLocation"+locationId+id).val(),
					// size : $("#pluSize"+locationId+id).val(),
					// color : $("#pluColor"+locationId+id).val(),
					 colorShade : $("#pluColorShade"+locationId+id).val(),
					 mbq : $("#pluMbq"+locationId+id).val(),
					 quantityInHand : $("#pluQuantity"+locationId+id).val(),
					 acp : $("#pluAcp"+locationId+id).val(),
					 description : $("#pluDesc"+locationId+id).val(),
					 storeLocation : storeLocation,
					 productRange : $("#productRange"+locationId+id).val(),
					 measureRange : $("#measurementRange"+locationId+id).val(),
					 utility : $("#utilityRange"+locationId+id).val(),
					 color : $("#colourRange"+locationId+id).val(),
					 size : $("#sizeRange"+locationId+id).val(),
					 productBatchNo : $("#batchRange"+locationId+id).val(),
				     ean : $("#ean"+locationId+id).val(),
                     eanduplicate : $("#eanduplicate"+locationId+id).val(),
				     pack_size : $("#pricePackSize"+locationId+id).val(),
				     min_sale_qty : $("#priceMinSaleQty"+locationId+id).val(),
				     businessCategory :$("#businessCategoryDetail"+locationId+id).val(),
				     businessSubCategory:$("#businessSubcategoryDetail"+locationId+id).val(),
				     technical_specification:$("#technicalSpecDetail"+locationId+id).val(),
				     styleRange : $("#styleRange"+locationId+id).val(),
				     blockedQuantity:$("#blockedQty"+locationId+id).val(),
				     scrapedQuantity:$("#scrapedQty"+locationId+id).val(),
				     max_sale_qty : $("#maxSaleQty").val(),
				     stockFactor : $("#stockfactor").val(),
				     materialType : $("#materailType"+locationId+id).val(),
				     zeroStockBilling : $("#zeroStockbilling"+locationId+id).val(),
 					
				     //styleRange : $("#styleRangeDropDown").val()
				     
			 };
			 finalObj.skuPriceLists.push(obj);
			 
					 }
					});
	}
	
	
	if(flag == false)
		return;

	 var contextPath = $("#contextPath").val();
   	   if(operation=="new"){
    	 URL = contextPath + "/outletMaster/createSku.do";
   	   }
   	   else if(operation=="edit"){
   		 URL = contextPath + "/outletMaster/updateSku.do";
   	   }
   	 var formData = JSON.stringify(finalObj);
 	 console.log(formData);
//   	 return;
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
  				
	   			//debugger
//  				if(operation=="edit"){
  				messageStatus= JSON.stringify(result);
				var parsed_json = JSON.parse(messageStatus);
				var code = parsed_json.code;
				
				//alert(parsed_json.code)
				if(code != 0)
				{
					$("#ErrorDetail").html(parsed_json.error);
					$("#SuccessDetail").html("");
					focusDiv('ErrorDetail');
				}
				else
				{
					$("#SuccessDetail").html(parsed_json.success);
					$("#ErrorDetail").html("");
					focusDiv('SuccessDetail');
  				}
  				else{
  				$("#right-side").html(result);
  				$("#outletLocation").val(location);
  				$("#outletCategory").val(productCategory);
  				$("#outletSubcategory").val(subcategory);
  				$("#outletSupplierId").val(supplierid);
  				$("#SkuMaster").val(searchName);
  				$("#outletBrandId").val(brand);
  				$("#outletDepartmentId").val(department);
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
}*/

function validateSkuForm(operation){
	 //purpose:for checking internet conection
	//debugger;
	var online = window.navigator.onLine;
 	if(!online)
 	{
 		alert("check your internet connection,please try agian after some time");
 		return;
 	}
 	$("#hsnCodeError").html("");
	addSelectedProductAndMeasurementRange();
	var finalObj = {}, skuPriceLists = [];
	if($("#skuId").val().trim() == ""){
		$("#skuIdError").html("Enter Sku Id");
		focusDiv('skuIdError');
		return;
	}else if(parseInt($("#skuId").val().length)>20){
		 $("#skuId").focus();
		 $("#skuIdError").html("SKU Id can't exceeds 20 Characters");
		 return;
	} 
	
	if($("#shortDescription").val().trim() == ""){
		$("#shortDescriptionError").html("Enter Product Name");
		focusDiv('shortDescriptionError');
		return;
	}else if(parseInt($("#shortDescription").val().length)>100){
		 $("#shortDescription").focus();
		 $("#shortDescriptionError").html("Product Name can't exceeds 100 Characters");
		 return;
	}
	/*if($("#minSaleQty").val().trim() == ""){
		$("#minSaleQtyError").html("Enter Minimum Sales Quantity");
		focusDiv('minSaleQtyError');
		return;
	}*/
	
	if(parseInt($("#ean").val().length)>20) {
		 $("#ean").focus();
		 $("#eanerr").html("EAN can't exceeds 20 Characters");
		 return false;
	}else{
		 $("#eanerr").html(" ");
	}
	
	
	if(parseInt($("#manufacturerCode").val().length)>100) {
		 $("#manufacturerCode").focus();
		 $("#manufacturerCodeError").html("Manufacturer Code can't exceeds 100 Characters");
		 return;
	}else {
		 $("#manufacturerCodeError").html(" ");
	}
	
	if($("#manufacturer").val().trim() == ""){
		$("#manufacturerError").html("Enter Manufacturer");
		focusDiv('manufacturerError');
		return;
	}else if(parseInt($("#manufacturer").val().length)>100){
		 $("#manufacturer").focus();
		 $("#manufacturerError").html("Manufacturer can't exceeds 100 Characters");
		 return;
	} 
	
	if($("#uomList").val().trim() == ""){
		$("#uomListError").html("Enter UOM");
		focusDiv('uomListError');
		return;
	}
	
	if(parseInt($("#uomLabel").val().length)>30) {
		 $("#uomLabel").focus();
		 $("#newWeightError").html("UOM Label can't exceeds 30 Characters");
		 return;
	}else {
		 $("#newWeightError").html(" ");
	}
	
	if(parseInt($("#packSize").val().length)>11) {
		 $("#packSize").focus();
		 $("#packSizedeatilError").html("Package Size can't exceeds 11 Digits");
		 return;
	}else {
		 $("#packSizedeatilError").html(" ");
	}
	
	if(parseInt($("#patternCode").val().length)>100) {
		 $("#patternCode").focus();
		 $("#patternCodeError").html("Pattern Code can't exceeds 100 Characters");
		 return;
	}else {
		 $("#patternCodeError").html(" ");
	}
	
	if(parseInt($("#leadTime").val().length)>15) {
		 $("#leadTime").focus();
		 $("#leadTimeError").html("Lead Time can't exceeds 15 digit");
		 return;
	} else {
		 $("#leadTimeError").html(" ");
	}
	
	stock
	if($("#stock").val().trim() == ""){
		$("#stockError").html("Enter Stock");
		focusDiv('stockError');
		return;
	}
	
	if(parseInt($("#frTaxCode").val().length)>11) {
		 $("#frTaxCode").focus();
		 $("#frTaxCodeError").html("Fr Tax Code can't exceeds 11 digit");
		 return;
	} else {
		 $("#frTaxCodeError").html(" ");
	} 
	
	
	debugger
	if(parseInt($("#markDown").val().length)>100) {
		 $("#markDown").focus();
		 $("#markDownError").html("MarkDown can't exceeds 100 Character");
		 return;
	} else {
		 $("#markDownError").html("");
	} 
	
	if(parseInt($("#runningPlu").val().length)>100) {
		 $("#runningPlu").focus();
		 $("#runningPluError").html("Running Plu can't exceeds 100 Character");
		 return;
	} else {
		 $("#runningPluError").html("");
	} 
	
	if(parseInt($("#model").val().length)>30) {
		 $("#model").focus();
		 $("#newmodelError").html("Model can't exceeds 30 Character");
		 return;
	} else {
		 $("#newmodelError").html("");
	} 
	
	
	if(parseInt($("#color").val().length)>30) {
		 $("#color").focus();
		 $("#skucolorError").html("Color can't exceeds 30 Character");
		 return;
	} else {
		 $("#skucolorError").html("");
	} 
	
	if(parseInt($("#section").val().length)>100) {
		 $("#section").focus();
		 $("#skuSectionError").html("Section can't exceeds 100 Character");
		 return;
	} else {
		 $("#skuSectionError").html("");
	} 
	
	if($("#hsnCode").val().trim() == ""){
		$("#hsnCodeError").html("Enter HSN Code");
		focusDiv('hsnCodeError');
		return;
	}else if(parseInt($("#hsnCode").val().length)>50){
		 $("#hsnCode").focus();
		 $("#hsnCodeError").html("HSN Code can't exceeds 50 Characters");
		 return;
	} 
	
	if(parseInt($("#alternate_sku").val().length)>30) {
		 $("#alternate_sku").focus();
		 $("#alternate_skuerr").html("Alternate SKU can't exceeds 30 Character");
		 return;
	} else {
		 $("#alternate_skuerr").html("");
	} 
	
	if(parseInt($("#season_code").val().length)>25) {
		 $("#season_code").focus();
		 $("#seasonCodeErr").html("SeasonCode can't exceeds 25 Character");
		 return;
	} else {
		 $("#seasonCodeErr").html("");
	} 

	if(parseInt($("#alias_name").val().length)> 200) {
		 $("#alias_name").focus();
		 $("#aliasNameErr").html("Alias Name can't exceeds 200 Character");
		 return;
	} else {
		 $("#aliasNameErr").html("");
	} 
	
	
	
	if(parseInt($("#item_type").val().length)> 50) {
		 $("#item_type").focus();
		 $("#skuItemTypeErr").html("Item Type can't exceeds 50 Character");
		 return;
	} else {
		 $("#skuItemTypeErr").html("");
	} 
	
	if(parseInt($("#item_design").val().length)> 50) {
		 $("#item_design").focus();
		 $("#skuItemDesignErr").html("Item Design can't exceeds 50 Character");
		 return;
	} else {
		 $("#skuItemDesignErr").html("");
	} 
	
	if(parseInt($("#productHandingDetail").val().length)> 50) {
		 $("#productHandingDetail").focus();
		 $("#ProductHandingDetailErr").html("Product Handing can't exceeds 50 Character");
		 return;
	} else {
		 $("#ProductHandingDetailErr").html("");
	} 
	
	if(parseInt($("#productUsageDetail").val().length)>250) {
		 $("#productUsageDetail").focus();
		 $("#productUsageDetailErr").html("Product Usage can't exceeds 250 Character");
		 return;
	} else {
		 $("#productUsageDetailErr").html("");
	} 
	
	debugger
	/*if(parseInt($("#productIntakeDetail").val().length)>= 5) {
		 $("#productIntakeDetail").focus();
		 $("#productUsageDetailErr").html("Product Intake can't exceeds 50 Character");
		 return;
	} else {
		 $("#productUsageDetailErr").html("");
	} */
	
	if(parseInt($("#uom1Detail").val().length)> 20) {
		 $("#uom1Detail").focus();
		 $("#uom1DetailErr").html("UOM1 can't exceeds 20 Character");
		 return;
	} else {
		 $("#uom1DetailErr").html("");
	} 
	
	if(parseInt($("#uom2Detail").val().length)> 20) {
		 $("#uom2Detail").focus();
		 $("#uom2DetailErr").html("UOM2 can't exceeds 20 Character");
		 return;
	} else {
		 $("#uom2DetailErr").html("");
	} 
	
	if(parseInt($("#skutheme").val().length)> 100) {
		 $("#skutheme").focus();
		 $("#skuThemeError").html("Theme can't exceeds 100 Character");
		 return;
	} else {
		 $("#skuThemeError").html("");
	} 
	
	if(parseInt($("#skuSubtheme").val().length)> 100) {
		 $("#skuSubtheme").focus();
		 $("#skuSubthemeError").html("Sub Theme can't exceeds 100 Character");
		 return;
	} else {
		 $("#skuSubthemeError").html("");
	} 
	
	
	if(parseInt($("#productPrecautions").val().length)> 250) {
		 $("#productPrecautions").focus();
		 $("#productPrecautionsDetailError").html("Product Precautions can't exceeds 250 Character");
		 return;
	} else {
		 $("#productPrecautionsDetailError").html("");
	} 
	
	if(parseInt($("#productSideEffects").val().length)> 250) {
		 $("#productSideEffects").focus();
		 $("#productSideEffectsDetailError").html("Product Side Effects can't exceeds 250 Character");
		 return;
	} else {
		 $("#productSideEffectsDetailError").html("");
	} 
	
	
	if(parseInt($("#warrantyDetails").val().length)> 250) {
		 $("#warrantyDetails").focus();
		 $("#warrantyDetailsError").html("Warrenty can't exceeds 250 Character");
		 return;
	} else {
		 $("#warrantyDetailsError").html("");
	} 
	
	
	
	/*if(parseInt($("#pluColorShadeAllLocation1").val().length)>= 25) {
		 $("#pluColorShadeAllLocation1").focus();
		 $("#pluColorShadeAllLocation1Error").html("Color Shade can't exceeds 25 Character");
		 return;
	} else {
		 $("#pluColorShadeAllLocation1Error").html("");
	} */
	
	if(operation="new"){
	if(parseInt($("#pluColorShadeAllLocation1").val().length)> 25) {
		 $("#pluColorShadeAllLocation1").focus();
		 $("#pluColorShadeAllLocation1Error").html("Color Shade can't exceeds 25 Character");
		 return;
	} else {
		 $("#pluColorShadeAllLocation1Error").html("");
	} 
	}
	
	if(operation="edit"){
		if(parseInt($("#pluColorShadeAllLocation0").val().length)> 25) {
			 $("#pluColorShadeAllLocation0").focus();
			 $("#pluColorShadeAllLocation0Error").html("Color Shade can't exceeds 25 Character");
			 return;
		} else {
			 $("#pluColorShadeAllLocation0Error").html("");
		} 
		
		if(parseInt($("#materailTypeAllLocation0").val().length)> 50) {
			 $("#materailTypeAllLocation0").focus();
			 $("#pluColorShadeAllLocation0Error").html("Material Type can't exceeds 50 Character");
			 return;
		} else {
			 $("#pluColorShadeAllLocation0Error").html("");
		} 
		
	}
	
	if(parseInt($("#pluMbqAllLocation1").val().length)> 100) {
		 $("#pluMbqAllLocation1").focus();
		 $("#pluMbqAllLocation1Error").html("MBQ can't exceeds 100 Character");
		 return;
	} else {
		 $("#pluMbqAllLocation1Error").html("");
	} 
	
	if(parseInt($("#pluAcpAllLocation1").val().length)> 100) {
		 $("#pluAcpAllLocation1").focus();
		 $("#pluAcpAllLocation1Error").html("ACP can't exceeds 100 Character");
		 return;
	} else {
		 $("#pluAcpAllLocation1Error").html("");
	} 
	
	
	if(operation == "new"){
	if(parseInt($("#materailTypeAllLocation1").val().length)> 50) {
		 $("#materailTypeAllLocation1").focus();
		 $("#materailTypeAllLocation1Error").html("Material Type can't exceeds 50 Character");
		 return;
	} else {
		 $("#materailTypeAllLocation1Error").html("");
	} 
	
	if(parseInt($("#eanAllLocation1").val().length)>20) {
		 $("#eanAllLocation1").focus();
		 $("#skueanAllLocationDetailError").html("EAN can't exceeds 20 Character");
		 return;
	} else {
		 $("#skueanAllLocationDetailError").html("");
	} 
	
	
	}
	
	 var noOfDays = daydiff(parseDate($('#pluCreatedDateAllLocation1').val()), parseDate($('#pluExpiryDateAllLocation1').val()));
	 if(noOfDays < 0){
		 $("#pluExpiryDateAllLocation1Error").focus();
		 $("#pluExpiryDateAllLocation1Error").html("Expiry Date can't be less than Created Date");
		 return;
	 }
	
	
	
	/*if($("#searchItems").val().trim() == ""){
	  $("#productNameError").html("Enter Product Name");
	  $("#searchItems").focus();
	  return;
	}*/
	/*if($("#productId").val() == ""){
	  $("#productNameError").html("Product Name doesn't exist");
	  $("#searchItems").focus();
	  return;
	}*/
	if(operation == "new"){
		finalObj.status = $("#status").val();
	}
	if(operation == "edit"){
		finalObj.status = $("#editstatus").val();
	}
	
	
	
	var searchName = "";
		if($("#SkuMaster").length > 0 )
			searchName = $("#SkuMaster").val().trim();
		var location = "";
	if($("#outletLocation").length > 0)
		location = $("#outletLocation").val();
	var productCategory = "";
	if($("#outletCategory").length > 0)
		productCategory = $("#outletCategory").val();
	var subcategory = "";
	if($("#outletSubcategory").length > 0)
		subcategory = $("#outletSubcategory").val();
	var brand = "";
	if($("#outletBrandId").length > 0)
		brand = $("#outletBrandId").val();
	var department = "";
	if($("#outletDepartmentId").length > 0)
		department = $("#outletDepartmentId").val();
	var supplierid = "";
	if($("#outletSupplierId").length > 0)
		supplierid = $("#outletSupplierId").val();
	
	if($("#location").val() == null){
		$("#locationError").html("Select Atleast one Location");
		focusDiv('locationError');
		return;
	}
	
		
		
	//debugger;
	finalObj.stockStatus=$("#stockStatus").val();
	finalObj.skuId = $("#skuId").val();
	finalObj.productId = $("#skuId").val();
	//finalObj.categoryName = $("#categoryName").val();
	finalObj.productCategory = $("#categoryNameID").val();
	finalObj.categoryId= $("#categoryId").val();
	//finalObj.subCategoryName = $("#subCategoryName").val();
	finalObj.subCategory = $("#subCategoryNameID").val();
	
	finalObj.category = $("#categoryNameID").val();
	finalObj.businessCategory = $("#categoryNameID").val();
	
	finalObj.productId = $("#skuIdQuick").val();
	//finalObj.subCategoryName = $("#subCategoryName").val();
	finalObj.subCategory = $("#subCategoryNameID").val();
	finalObj.businessSubCategory=$("#subCategoryNameID").val();
	
	finalObj.productName = $("#searchItems").val();
	finalObj.supplierName = $("#supplier_Id").val();
	finalObj.supplier = $("#searchSupplier").val();
	finalObj.ean = $("#ean").val();
	finalObj.manufacturedItem = $("#manufactureItem").val();
	finalObj.packed = $("#packagedItem").val();
	finalObj.brandCode = $("#brandCode").val();
	finalObj.taxonDiscountedPrice = $("#istaxon").val();

	finalObj.batchRequired = $("#batchrequired").val();
	finalObj.costPriceEditable = $("#costPriceEditable").val();
	//debugger
	finalObj.manufacturerCode = $("#manufacturerCode").val();
	finalObj.make = $("#manufacturer").val();
	finalObj.uom = document.getElementById("uomList").value;
//		$("#uom").val();
	finalObj.quantity = $("#stock").val();
	finalObj.uomLabel = $("#uomLabel").val();
	finalObj.packSize = $("#packSize").val();
	finalObj.jitStock = $("#jitStock").val();
	finalObj.zeroStock = $("#zeroStockdetail").val();
//	finalObj.zeroStock = $("#zeroStock").val();
	finalObj.itemTaxExclusive = $("#itemTaxExclusive").val();
	finalObj.minSaleQty = $("#minSaleQty").val();
	finalObj.color = $("#color").val();
	finalObj.patternCode = $("#patternCode").val();
	finalObj.reorderPoint = $("#reorderPoint").val();
	finalObj.orderQuantity = $("#orderQuantity").val();
	finalObj.leadTimeDays = $("#leadTime").val();
   finalObj.editable = $("#editable").val();
	finalObj.primaryDepartment = $("#primaryDepartment").val();
	finalObj.secondaryDepartment = $("#secondaryDepartment").val();
	finalObj.maxStock = $("#maxStock").val();
	finalObj.stock = $("#stock").val();
	finalObj.section = $("#section").val();
	finalObj.taxCode = $("#taxCode").val();
	finalObj.trackingRequired = $("#itemTrackRequired").val();
	finalObj.created_date = $("#createdDate").val();
	
	finalObj.strProductUrl=$("#skuDescription_refId").val();
	finalObj.productUrl=$("#skuDescription_name").val();
	
	//finalObj.costPriceEditable = true;
	
	 finalObj.product_side_effects = $("#productSideEffects").val();
    finalObj.product_precautions = $("#productPrecautions").val();
    finalObj.product_handing = $("#productHandingDetail").val();
    finalObj.product_usage = $("#productUsageDetail").val();
    finalObj.product_consumption_interaction = $("#productIntakeDetail").val();
    finalObj.uom1 = $("#uom1Detail").val();
    finalObj.uom2 = $("#uom2Detail").val();
    finalObj.is_combo = $("#comboDetail").val();
    
	 var maxRecords = 10;
		if ($("#maxRecords").length > 0)
			maxRecords= $("#maxRecords").val();
	finalObj.maxRecords = maxRecords;
	
	/*var searchName = "";
	if($("#searchName").length > 0 )
		searchName = $("#searchName").val().trim();
	finalObj.searchCriteria = searchName;
	*/
	
	if($("#frTaxCode").val() == "")
		finalObj.frTaxCode = 0;
	else
		finalObj.frTaxCode = $("#frTaxCode").val();
	finalObj.markUp = $("#markUp").val();
	finalObj.markDown = $("#markDown").val();
	finalObj.hsnCode = $("#hsnCode").val();
	finalObj.runningPluNumber = $("#runningPlu").val();
	finalObj.model = $("#model").val();
	finalObj.openRate = $("#openRate").val();
	finalObj.lastCost = $("#lastCost").val();
	finalObj.avgCost = $("#averageCost").val();
	finalObj.minimumPrice = $("#minPrice").val();
	finalObj.created_date = $("#createdDate").val();
	finalObj.updated_date = $("#lastUpdated").val();
	finalObj.strPicture1 = $("#picture1_refId").val();
	finalObj.picture1 = $("#picture1_name").val();
	finalObj.theme = $("#skutheme").val();
	finalObj.subTheme = $("#skuSubtheme").val();
	finalObj.itemDesign = $("#skuitemDesign").val();
	
	
	
//	finalObj.styleRange = $("#styleRangeDropDown").val();
	
	if($("#picture1_thumbnail").length > 0)
		finalObj.picture1flag = "true";
	else
		finalObj.picture1flag = "false";
	finalObj.strPicture2 = $("#picture2_refId").val();
	finalObj.picture2 = $("#picture2_name").val();
	if($("#picture2_thumbnail").length > 0)
		finalObj.picture2flag = "true";
	else
		finalObj.picture2flag = "false";
	finalObj.strPicture3 = $("#picture3_refId").val();
	finalObj.picture3 = $("#picture3_name").val();
	if($("#picture3_thumbnail").length > 0)
		finalObj.picture3flag = "true";
	else
		finalObj.picture3flag = "false";
	
	/*Added by manideep
	Date:04/09/2019
	Reason:To set the picture icon.*/
	
	finalObj.strPictureIcon = $("#pictureIcon_refId").val();
	finalObj.pictureIcon = $("#pictureIcon_name").val();
	
	if($("#pictureIcon_thumbnail").length > 0)
		finalObj.pictureIconflag = "true";
	else
		finalObj.pictureIconflag = "false";
	
	//end picture icon code.
	
	finalObj.nonTaxable = $("#nonTaxable").prop("checked");
	finalObj.discountable = $("#discountable").prop("checked");
	finalObj.allowDecimals = $("#allowDecimals").prop("checked");
	
	if($("input:radio[name='priceListType']:checked").val() == "all")
		finalObj.storeLocation = "ALL";
	else
	finalObj.storeLocation = "";
	finalObj.description = $("#shortDescription").val();
	finalObj.warantyDetails = $("#warrantyDetails").val();
	finalObj.alternateSkuId = $("#alternate_sku").val();
	finalObj.aliasName = $("#alias_name").val();
	finalObj.itemType = $("#item_type").val();
	finalObj.itemDesign = $("#item_design").val();
	finalObj.seasonCode = $("#season_code").val();
	finalObj.skuPriceLists = skuPriceLists;
//	var quantityInPriceList = 0;
	var flag = true; 
	
	var locationIdArray = [];
	if($("input:radio[name='priceListType']:checked").val() == "all"){
		locationIdArray.push("AllLocation");
	}else{
		$("#selectedLocation option").each(function(){
			var location = $(this).val();
			location = location.replace(/ /g,'_');
			locationIdArray.push(location);
		});
	}
	
	for(var i = 0; i < locationIdArray.length ; i++){
		var priceList = [];
		var locationId = locationIdArray[i];
		 var storeLocation = "";
		 if(locationId != "AllLocation"){
			 storeLocation = locationId.replace(/_/g,' ');
		 }
		 
			if(locationId == null || locationId == undefined || locationId == ""){
				$("#ErrorDetail").html("hjhjhjhjh");
				return false;
			}
			else	
		$("div ."+locationId+" .pricelist").each(function(){
			 id = parseInt($(this).attr("id").replace('pricelist'+locationId,''));
			 
		debugger;
			 //koti
		var eanarraylist=[];
                      /* if(locationId == $("#selectedLocation option:selected").val()){
                               var len = $("#SKUMasterEAN"+locationId+id+"1 tr").length-1;
                               var  eanLocation = $("#selectedLocation option:selected").val();
                                idean = parseInt($(this).attr("id").replace('pricelist'+eanLocation,''));
                                for(var i=1;i<=len;i++){
                                               var idAttrEan = $("#SKUMasterEAN"+eanLocation+idean+1+" tr:eq("+i+") td:last").attr("id");
                                               idAttrEan = idAttrEan.replace('action','');
                                               var test = $("#eantable"+idAttrEan).val();
                                               if(i<len){
                                               eanarraylist +=$("#eantable"+idAttrEan).val() +","; 
                                               }else{
                                               eanarraylist +=$("#eantable"+idAttrEan).val();
                                               }
                                       }
                       }
                                       $("#ean"+locationId+id).val(eanarraylist);*/
		
		
			
				var len = $("#SKUMasterEAN"+locationId+id+"1 tr").length-1;
				
				 idean = parseInt($(this).attr("id").replace('pricelist'+locationId,''));
				 for(var i=1;i<=len;i++){
						var idAttrEan = $("#SKUMasterEAN"+locationId+idean+1+" tr:eq("+i+") td:last").attr("id");
						idAttrEan = idAttrEan.replace('action','');
						var test = $("#eantable"+idAttrEan).val();
						if(i<len){
						eanarraylist +=$("#eantable"+idAttrEan).val() +","; 
						}else{
						eanarraylist +=$("#eantable"+idAttrEan).val();
						}
					}
			
			
					$("#eanduplicate"+locationId+id).val(eanarraylist);
					
				//koti	
					if(locationId == "AllLocation" && $("#pluCostPrice"+locationId+id).val() == "" && $("#pluPrice"+locationId+id).val() == ""){
						 
					 }else{
					
					
			 if($("#pluCostPrice"+locationId+id).val() == ""){
				 debugger;
				 $("#pluCostPrice"+locationId+id+"Error").html("Enter Cost Price");
				 $(".pricelist").each(function(){
					 $(this).css("display","none");
				 });
				 $(this).css("display","block");
				 $(".priceList").css("display","block");
				 $(".priceListLocationDiv").each(function(){
					 $(this).css("display","none");
				});
				 $("."+locationId).css("display","block");
				 $("div ."+locationId+" .priceList").css("display","block");
				 displayCurrentPageNo();
				 flag = false;
//				 alert("pluCostPrice"+locationId+id+"Error");
				 if(storeLocation != "")
					 $("#selectedLocation").val(storeLocation);
				 	 $("#pluCostPrice"+locationId+id).focus();
				 return false;
			 }
			 if($("#pluPrice"+locationId+id).val() == ""){
				 $("#pluPrice"+locationId+id+"Error").html("Enter Price");
				 $(".pricelist").each(function(){
					 $(this).css("display","none");
				 });
				 $(this).css("display","block");
				 $(".priceList").css("display","block");
				 $(".priceListLocationDiv").each(function(){
					 $(this).css("display","none");
				});
				 $("."+locationId).css("display","block");
				 $("div ."+locationId+" .priceList").css("display","block");
				 displayCurrentPageNo();
				 flag = false;
				 if(storeLocation != "")
					 $("#selectedLocation").val(storeLocation);
				 $("#pluPrice"+locationId+id).focus();
				 return false;
			 }
			 if($("#pluSalePrice"+locationId+id).val() == ""){
				 $("#pluSalePrice"+locationId+id+"Error").html("Enter Sale Price");
				 $(".pricelist").each(function(){
					 $(this).css("display","none");
				 });
				 $(this).css("display","block");
				 $(".priceList").css("display","block");
				 $(".priceListLocationDiv").each(function(){
					 $(this).css("display","none");
				});
				 $("."+locationId).css("display","block");
				 $("div ."+locationId+" .priceList").css("display","block");
				 displayCurrentPageNo();
				 flag = false;
				 if(storeLocation != "")
					 $("#selectedLocation").val(storeLocation);
				 $("#pluSalePrice"+locationId+id).focus();
				 return false;
			 }
			 if(parseFloat($("#pluCostPrice"+locationId+id).val()) > parseFloat($("#pluSalePrice"+locationId+id).val())){
				$("#pluSalePrice"+locationId+id+"Error").html("Sale Price Should be > Cost Price");
				 $(".pricelist").each(function(){
					 $(this).css("display","none");
				 });
				 $(this).css("display","block");
				 $(".priceList").css("display","block");
				 $(".priceListLocationDiv").each(function(){
					 $(this).css("display","none");
				});
				 $("."+locationId).css("display","block");
				 $("div ."+locationId+" .priceList").css("display","block");
				 displayCurrentPageNo();
				 flag = false;
				 if(storeLocation != "")
					 $("#selectedLocation").val(storeLocation);
				 $("#pluSalePrice"+locationId+id).focus();
				 return false;
			 }
			 if($("#pluWsPrice"+locationId+id).val() == ""){
				 $("#pluWsPrice"+locationId+id+"Error").html("Enter Whole Sale Price");
				 $(".pricelist").each(function(){
					 $(this).css("display","none");
				 });
				 $(this).css("display","block");
				 $(".priceList").css("display","block");
				 $(".priceListLocationDiv").each(function(){
					 $(this).css("display","none");
				});
				 $("."+locationId).css("display","block");
				 $("div ."+locationId+" .priceList").css("display","block");
				 displayCurrentPageNo();
				 flag = false;
				 if(storeLocation != "")
					 $("#selectedLocation").val(storeLocation);
				 $("#pluWsPrice"+locationId+id).focus();
				 return false;
			 }
			 if($("#pluQuantity"+locationId+id).val() == ""){
				 $("#pluQuantity"+locationId+id+"Error").html("Enter Quantity");
				 $(".pricelist").each(function(){
					 $(this).css("display","none");
				 });
				 $(this).css("display","block");
				 $(".priceList").css("display","block");
				 $(".priceListLocationDiv").each(function(){
					 $(this).css("display","none");
				});
				 $("."+locationId).css("display","block");
				 $("div ."+locationId+" .priceList").css("display","block");
				 displayCurrentPageNo();
				 flag = false;
				 if(storeLocation != "")
					 $("#selectedLocation").val(storeLocation);
				 $("#pluQuantity"+locationId+id).focus();
				 return false;
			 }
			 if($("#pluExpiryDate"+locationId+id).val() != ""){
				 var re = /^[0-9/]+$/;
				 if(!re.test($("#pluExpiryDate"+locationId+id).val())){
						$("#pluExpiryDate"+locationId+id+"Error").html("Invalid Date");
						$(".pricelist").each(function(){
						 $(this).css("display","none");
					    });
						$(this).css("display","block");
						$(".priceList").css("display","block");
						 $(".priceListLocationDiv").each(function(){
							 $(this).css("display","none");
						});
						 $("."+locationId).css("display","block");
						$("div ."+locationId+" .priceList").css("display","block");
						displayCurrentPageNo();
						flag = false;
						if(storeLocation != "")
							 $("#selectedLocation").val(storeLocation);
						$("#pluExpiryDate"+locationId+id).focus();
						return false;
				 }
			 }
			 
			 if($("#pluCostPrice"+locationId+id).val() == ""){
				 debugger;
				 $("#pluCostPrice"+locationId+id+"Error").html("Enter Cost Price");
				 $(".pricelist").each(function(){
					 $(this).css("display","none");
				 });
				 $(this).css("display","block");
				 $(".priceList").css("display","block");
				 $(".priceListLocationDiv").each(function(){
					 $(this).css("display","none");
				});
				 $("."+locationId).css("display","block");
				 $("div ."+locationId+" .priceList").css("display","block");
				 displayCurrentPageNo();
				 flag = false;
//				 alert("pluCostPrice"+locationId+id+"Error");
				 if(storeLocation != "")
					 $("#selectedLocation").val(storeLocation);
				 	 $("#pluCostPrice"+locationId+id).focus();
				 return false;
			 }

			/* if(parseInt($("#ean"+locationId+id).val().length)>=30){
				 $("#ean"+locationId+id).focus();
				 $("#skuean"+locationId+id+"Error").html("EAN can't exceeds 30 Character");
				 $(".pricelist").each(function(){
					 $(this).css("display","none");
				 });
				 $(this).css("display","block");
				 $(".priceList").css("display","block");
				 $(".priceListLocationDiv").each(function(){
					 $(this).css("display","none");
				});
				 $("."+locationId).css("display","block");
				 $("div ."+locationId+" .priceList").css("display","block");
				 displayCurrentPageNo();
				 flag = false;
				 if(storeLocation != "")
					 $("#selectedLocation").val(storeLocation);
				 $("#ean"+locationId+id).focus();
				 return false;
			 }else{
			$("#ean"+locationId+id+"Error").html("");
		  }*/
			 debugger
			 if(parseInt($("#materailType"+locationId+id).val().length)>30){
				 $("#materailType"+locationId+id).focus();
				 $("#materailType"+locationId+id+"Error").html("Material type can't exceeds 30 Character");
				 $(".pricelist").each(function(){
					 $(this).css("display","none");
				 });
				 $(this).css("display","block");
				 $(".priceList").css("display","block");
				 $(".priceListLocationDiv").each(function(){
					 $(this).css("display","none");
				});
				 $("."+locationId).css("display","block");
				 $("div ."+locationId+" .priceList").css("display","block");
				 displayCurrentPageNo();
				 flag = false;
				 if(storeLocation != "")
					 $("#selectedLocation").val(storeLocation);
				 $("#materailType"+locationId+id).focus();
				 return false;
			 }else{
			$("#materailType"+locationId+id+"Error").html("");
		  }
			 
			 if($("#pluDesc"+locationId+id).val() == ""){
				 $("#pluDesc"+locationId+id+"Error").html("Enter Description");
				 $(".pricelist").each(function(){
					 $(this).css("display","none");
				 });
				 $(this).css("display","block");
				 $(".priceList").css("display","block");
				 $(".priceListLocationDiv").each(function(){
					 $(this).css("display","none");
				});
				 $("."+locationId).css("display","block");
				 $("div ."+locationId+" .priceList").css("display","block");
				 displayCurrentPageNo();
				 flag = false;
				 if(storeLocation != "")
					 $("#selectedLocation").val(storeLocation);
				 $("#pluDesc"+locationId+id).focus();
				 return false;
			 }
//			 
			 var price = $("#pluPrice"+locationId+id).val();
		
			
				 priceList.push(price);
//				 //debugger
			 var obj = {
					
					 costPrice : $("#pluCostPrice"+locationId+id).val(),
					 price : $("#pluPrice"+locationId+id).val(),
					 salePrice : $("#pluSalePrice"+locationId+id).val(),
					 wholesalePrice : $("#pluWsPrice"+locationId+id).val(),
					 extraPrice : $("#pluExtraPrice"+locationId+id).val(),
					 pluCode : $("#pluCode"+locationId+id).val(),
					 skuStatus : $("#skuStatus"+locationId+id).val(),
					 created_date : $("#pluCreatedDate"+locationId+id).val(),
					 updated_date : $("#pluUpdatedDate"+locationId+id).val(),
					 expiry_date : $("#pluExpiryDate"+locationId+id).val(),
					 packagingDate : $("#pluPackagedDateAllLocation"+locationId+id).val(),
					// size : $("#pluSize"+locationId+id).val(),
					// color : $("#pluColor"+locationId+id).val(),
					 colorShade : $("#pluColorShade"+locationId+id).val(),
					 mbq : $("#pluMbq"+locationId+id).val(),
					 quantityInHand : $("#pluQuantity"+locationId+id).val(),
					 acp : $("#pluAcp"+locationId+id).val(),
					 description : $("#pluDesc"+locationId+id).val(),
					 storeLocation : storeLocation,
					 productRange : $("#productRange"+locationId+id).val(),
					 measureRange : $("#measurementRange"+locationId+id).val(),
					 utility : $("#utilityRange"+locationId+id).val(),
					 color : $("#colourRange"+locationId+id).val(),
					 size : $("#sizeRange"+locationId+id).val(),
					 productBatchNo : $("#batchRange"+locationId+id).val(),
				     ean : $("#ean"+locationId+id).val(),
                    eanduplicate : $("#eanduplicate"+locationId+id).val(),
				     pack_size : $("#pricePackSize"+locationId+id).val(),
				     min_sale_qty : $("#priceMinSaleQty"+locationId+id).val(),
				     businessCategory :$("#businessCategoryDetail"+locationId+id).val(),
				     businessSubCategory:$("#businessSubcategoryDetail"+locationId+id).val(),
				     technical_specification:$("#technicalSpecDetail"+locationId+id).val(),
				     styleRange : $("#styleRange"+locationId+id).val(),
				     blockedQuantity:$("#blockedQty"+locationId+id).val(),
				     scrapedQuantity:$("#scrapedQty"+locationId+id).val(),
				     max_sale_qty : $("#maxSaleQty").val(),
				     stockFactor : $("#stockfactor").val(),
				     materialType : $("#materailType"+locationId+id).val(),
				     zeroStockBilling : $("#zeroStockbilling"+locationId+id).val(),
				     stockStatus:$("#skuStockStatus"+locationId+id).val(),
				     //styleRange : $("#styleRangeDropDown").val()
				     
			 };
			 finalObj.skuPriceLists.push(obj);
			 
					 }
					});
	}
	
	
	if(flag == false)
		return;

	 var contextPath = $("#contextPath").val();
  	   if(operation=="new"){
   	 URL = contextPath + "/outletMaster/createSku.do";
  	   }
  	   else if(operation=="edit"){
  		 URL = contextPath + "/outletMaster/updateSku.do";
  	   }
  	 var formData = JSON.stringify(finalObj);
	 console.log(formData);
//  	 return;
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
 				
	   			//debugger
// 				if(operation=="edit"){
 				messageStatus= JSON.stringify(result);
				var parsed_json = JSON.parse(messageStatus);
				var code = parsed_json.code;
				
				//alert(parsed_json.code)
				if(code != 0)
				{
					$("#ErrorDetail").html(parsed_json.error);
					$("#SuccessDetail").html("");
					focusDiv('ErrorDetail');
				}
				else
				{
					$("#SuccessDetail").html(parsed_json.success);
					$("#ErrorDetail").html("");
					focusDiv('SuccessDetail');
 				}
 				/*else{
 				$("#right-side").html(result);
 				$("#outletLocation").val(location);
 				$("#outletCategory").val(productCategory);
 				$("#outletSubcategory").val(subcategory);
 				$("#outletSupplierId").val(supplierid);
 				$("#SkuMaster").val(searchName);
 				$("#outletBrandId").val(brand);
 				$("#outletDepartmentId").val(department);
 				}*/
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

function selectAllSkus(source){	
		checkboxes = document.getElementsByName(source);		
		  /*for each( var checkbox in checkboxes) {
			   checkbox.checked = source.checked;				
		}	*/
		
		for ( var i = 0; i < checkboxes.length; i++) {
		
			 checkboxes[i].checked= source.checked;	
		}
		
 }

function getDate(id){
	var givenDate = $('#'+id).val();
	var date = givenDate.split(' ');
	date = date[0].split('-');
	givenDate  = date[2]+"/"+date[1]+"/"+date[0];
	$('#'+id).val(givenDate);
}


function searchSkuMaster(name,searchCategory,index){
	 var contextPath = $("#contextPath").val();
	// var storeLocation = $("#outletLocation").val();
	 
	 //purpose:for checking internet conection
		var online = window.navigator.onLine;
	  	if(!online)
	  	{
	  	alert("check your internet connection,please try agian after some time");
	  	return;
	  	}
	 name=""
			if($("#SkuMaster").length>0)
			name = $("#SkuMaster").val().trim();
	 
	 URL = contextPath + "/outletMaster/searchSkuMaster.do";
	 var maxRecords = 10;
		 if($("#maxRecords").length>0)
			 maxRecords = $("#maxRecords").val();
		var location = "";
	if($("#outletLocation").length > 0)
		location = $("#outletLocation").val();
	var productCategory = "";
	if($("#outletCategory").length > 0)
		productCategory = $("#outletCategory").val();
	var subcategory = "";
	if($("#outletSubcategory").length > 0)
		subcategory = $("#outletSubcategory").val();
	var brand = "";
	if($("#outletBrandId").length > 0)
		brand = $("#outletBrandId").val();
	var department = "";
	if($("#outletDepartmentId").length > 0)
		department = $("#outletDepartmentId").val();
	var supplierid = "";
	if($("#outletSupplierId").length > 0)
		supplierid = $("#outletSupplierId").val();
	var status = "";
	if($("#status").length > 0)
		status = $("#status").val();
		$.ajax({
			type: "GET",
			url : URL,
			/*async : false,*/
			data : {
				index : index,
				maxRecords :maxRecords,
				location : location,
				productCategory : productCategory,
				subcategory : subcategory,
				brand : brand,
				department : department,
				supplierid : supplierid,
				status : status,
				searchName : name,
			},
			beforeSend: function(xhr){                    
	   	   		$("#loading").css("display","block");
	   	   		$("#mainDiv").addClass("disabled");
	   	   	},
			success : function(result) {
				$('#right-side').html(result);
				/*if($("#searchSKU").val != "")
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

$('#searchSKU').on('input',function(e){
	if($(this).val().trim()==""){
		viewSkuMaster('skumaster','0');
	}
});
function viewEditSKU(skuID,operation){
	 //purpose:for checking internet conection
	var online = window.navigator.onLine;
  	if(!online)
  	{
  	alert("check your internet connection,please try agian after some time");
  	return;
  	}
  	//debugger
		 var contextPath = $("#contextPath").val();
  	 URL = contextPath + "/outletMaster/editSku.do";
  	 //added by manasa
	 var formData={}
	 var productCategory = "";
	 if($("#outletCategory").length > 0)
		 productCategory = $("#outletCategory").val();
	
	 
	 var location = "";
	 if($("#toLocation").length>0)
		 location = $("#outletLocation").val();
	
	 
	 var subcategory = "";
	 if($("#outletSubcategory").length > 0)
		 subcategory = $("#outletSubcategory").val(); 
	 
	 var brand = "";
	 if($("#outletBrandId").length > 0)
		 brand= $("#outletBrandId").val();
	
	// formData.department = $("#outletDepartmentId").val();
	 var supplierIdName=""
		 if($("#outletSupplierId").length>0)
			 supplierIdName = $("#outletSupplierId").val();
	 var maxRecords = 10;
		if ($("#maxRecords").length > 0)
			maxRecords= $("#maxRecords").val();
	
	 
	 var searchName = "";
		if($("#SkuMaster").length > 0 )
			searchName = $("#SkuMaster").val().trim();
		
		 formData.storeLocation = location;
		 formData.productCategory = productCategory;
		 formData.subCategory = subcategory
		 formData.brandName= brand;
		// formData.department = $("#outletDepartmentId").val();
		 formData.supplierIdName = supplierIdName;
		 formData.maxRecords = maxRecords;
		 formData.searchCriteria = searchName;
		 
	// var formData  = JSON.stringify($('form').serializeObject());
	 var formData = JSON.stringify(formData);
		$.ajax({
 		type: "GET",
 		url : URL,
 		data : {
 			skuID : skuID,
 			formData : formData,
 			operation : operation
 		},
 		beforeSend: function(xhr){                    
  	   		$("#loading").css("display","block");
  	   		$("#mainDiv").addClass("disabled");
  	   	},
  		success : function(result) {
 			$("#right-side").html(result);
 			/*$("#outletCategory").val(productCategory);
 			$("#outletLocation").val(location);
 			$("#outletSubcategory").val(subcategory);
 			$("#outletBrandId").val(location);
 			$("#outletSupplierId").val(supplierIdName);
 			$("#maxRecords").val(maxRecords);
 			$("#SkuMaster").val(searchName);*/
 			$("#maxRecords").val(maxRecords);
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

function calcMarkUp(ele){
	if($(ele).val() == ""){
		return;
	}
	else{
		var id = $(ele).attr("id");
		var len = "";
		if(id.indexOf('pluCostPrice') != -1)
			len = id.replace('pluCostPrice','');
		else if(id.indexOf('pluSalePrice') != -1)
			len = id.replace('pluSalePrice','');
		if($("#pluCostPrice"+len).val() == "" ||$("#pluSalePrice"+len).val() == "")
			return;
		else{
			if(parseFloat($("#pluCostPrice"+len).val()) > parseFloat($("#pluSalePrice"+len).val())){
				$("#pluSalePrice"+len+"Error").html("Sale Price Should be > Cost Price");
				return;
			}
		}
	}
	setMarkUp();
}


function calcMarkUpWellness(ele){
	if($(ele).val() == ""){
		return;
	}
	else{
		var id = $(ele).attr("id");
		var len = "";
		if(id.indexOf('pluCostPriceW') != -1)
			len = id.replace('pluCostPriceW','');
		else if(id.indexOf('pluSalePriceW') != -1)
			len = id.replace('pluSalePriceW','');
		if($("#pluCostPriceW"+len).val() == "" ||$("#pluSalePriceW"+len).val() == "")
			return;
		else{
			if(parseFloat($("#pluCostPriceW"+len).val()) > parseFloat($("#pluSalePriceW"+len).val())){
				$("#pluSalePriceW"+len+"Error").html("Sale Price Should be > Cost Price");
				return;
			}
		}
	}
	setMarkUpWellness();
}


function setMarkUp(){
	debugger
	var locationIdArray = [];
	if($("input:radio[name='priceListType']:checked").val() == "all"){
		locationIdArray.push("AllLocation");
	}else{
		$("#selectedLocation option").each(function(){
			var location = $(this).val();
			location = location.replace(/ /g,'_');
			locationIdArray.push(location);
		});
	}
	var costPrice = 0;
	for(var i = 0; i < locationIdArray.length ; i++){
		var locationId = locationIdArray[i];
		if(locationId != ""){
		$("div ."+locationId+" .pluCost").each(function(){
			if(!isNaN($(this).val()) && $(this).val() != "")
				costPrice = costPrice + parseFloat($(this).val());
		});
		}
	}
	var salePrice = 0;
	for(var i = 0; i < locationIdArray.length ; i++){
		var locationId = locationIdArray[i];
		if(locationId != ""){
		$("div ."+locationId+" .pluSale").each(function(){
			if(!isNaN($(this).val()) && $(this).val() != "")
				salePrice = salePrice + parseFloat($(this).val());
		});
		}
	}
	/*var costPrice = 0;
	$(".pluCost").each(function(){
		if(!isNaN($(this).val()) && $(this).val() != "")
			costPrice = costPrice + parseFloat($(this).val());
	});
	var salePrice = 0;
	$(".pluSale").each(function(){
		if(!isNaN($(this).val()) && $(this).val() != "")
			salePrice = salePrice + parseFloat($(this).val());
	});*/
	var markUp = 0;
	if(salePrice != 0 && costPrice != 0)
		markUp = (((parseFloat(salePrice) - parseFloat(costPrice)) / parseFloat(costPrice)) * 100).toFixed(2);
	$("#markUp").val(markUp);
}



function setMarkUpWellness(){
	//debugger
	var locationIdArray = [];
	if($("input:radio[name='priceListTypeW']:checked").val() == "all"){
		locationIdArray.push("AllLocationW");
	}else{
		$("#selectedLocationW option").each(function(){
			var location = $(this).val();
			location = location.replace(/ /g,'_');
			locationIdArray.push(location);
		});
	}
	var costPrice = 0;
	for(var i = 0; i < locationIdArray.length ; i++){
		var locationId = locationIdArray[i];
		$("div ."+locationId+" .pluCostW").each(function(){
			if(!isNaN($(this).val()) && $(this).val() != "")
				costPrice = costPrice + parseFloat($(this).val());
		});
	}
	var salePrice = 0;
	for(var i = 0; i < locationIdArray.length ; i++){
		var locationId = locationIdArray[i];
		$("div ."+locationId+" .pluSaleW").each(function(){
			if(!isNaN($(this).val()) && $(this).val() != "")
				salePrice = salePrice + parseFloat($(this).val());
		});
	}
	/*var costPrice = 0;
	$(".pluCost").each(function(){
		if(!isNaN($(this).val()) && $(this).val() != "")
			costPrice = costPrice + parseFloat($(this).val());
	});
	var salePrice = 0;
	$(".pluSale").each(function(){
		if(!isNaN($(this).val()) && $(this).val() != "")
			salePrice = salePrice + parseFloat($(this).val());
	});*/
	var markUp = 0;
	if(salePrice != 0 && costPrice != 0)
		markUp = (((parseFloat(salePrice) - parseFloat(costPrice)) / parseFloat(costPrice)) * 100).toFixed(2);
	$("#markUpW").val(markUp);
}




function clearError(ele){
	var id = $(ele).attr("id");
	if($("#"+id+"Error").length > 0)
		$("#"+id+"Error").html('');
}

function addSelectedLocation(){
	var selectedLocationsList = [];
	$("#selectedLocation option").each(function(){
		selectedLocationsList.push($(this).val());
	});
	$("#selectedLocation").html('');
	var op = '';
	var selectedLength = $("select[multiple] option:selected").length;
	if(selectedLength == 0 || $("select[multiple] option").length == selectedLength){
		if(selectedLength == 0)
			$("select[multiple] option").prop("selected", "selected");
		$("select[multiple] option").each(function(){
			op = op + '<option value="'+$(this).val()+'">'+$(this).val()+'</option>';
			for(var j=0 ; j< selectedLocationsList.length; j++){
				if(selectedLocationsList[j] == $(this).val())
					selectedLocationsList.splice(j, 1);
			}
		});
		for(var j=0 ; j< selectedLocationsList.length; j++)
			op = op + '<option value="'+selectedLocationsList[j]+'">'+selectedLocationsList[j]+'</option>';
		$("#selectedLocation").html(op);
		getPriceListForSelectedLocation();
		return;
	}
	var selectedLocation = $("#location").val();
	if (selectedLocation != null || selectedLocation != ""){
		selectedLocation = $("#location").val().toString();
		selectedLocation = selectedLocation.split(',');
		for(var i = 0; i<selectedLocation.length; i++){
			op = op + '<option value="'+selectedLocation[i]+'">'+selectedLocation[i]+'</option>';
		}
		$("select[multiple] option").each(function(){
			for(var j=0 ; j< selectedLocationsList.length; j++){
				if(selectedLocationsList[j] == $(this).val())
					selectedLocationsList.splice(j, 1);
			}
		});
		for(var j=0 ; j< selectedLocationsList.length; j++)
			op = op + '<option value="'+selectedLocationsList[j]+'">'+selectedLocationsList[j]+'</option>';
		$("#selectedLocation").html(op);
		getPriceListForSelectedLocation();
	}
}

function appendProductRange(){
	var productRange = $("#productRangeTextBox").val().trim();
	if(productRange != ""){
		var op = '<option value="'+productRange+'">'+productRange+'</option>';
		$("#productRangeDropDown").append(op);
		$("#productRangeTextBox").val("");
	}
		
}

function appendProductRangeWellness(){
	var productRange = $("#productRangeTextBoxW").val().trim();
	if(productRange != ""){
		var op = '<option value="'+productRange+'">'+productRange+'</option>';
		$("#productRangeDropDownW").append(op);
		$("#productRangeTextBoxW").val("");
	}
		
}


function appendUtility(){
	var utility = $("#utilityRangeTextBox").val().trim();
	if(utility != ""){
		var op = '<option value="'+utility+'">'+utility+'</option>';
		$("#utilityRangeDropDown").append(op);
		$("#utilityRangeTextBox").val("");
	}
		
}

function appendUtilityWellness(){
	var utility = $("#utilityRangeTextBoxW").val().trim();
	if(utility != ""){
		var op = '<option value="'+utility+'">'+utility+'</option>';
		$("#utilityRangeDropDownW").append(op);
		$("#utilityRangeTextBoxW").val("");
	}
		
}

//added by manasa
function appendStyleRange(){
	var styleRange = $("#styleRangeTextBox").val().trim();
	if(styleRange != ""){
		var op = '<option value="'+styleRange+'">'+styleRange+'</option>';
		$("#styleRangeDropDown").append(op);
		$("#styleRangeTextBox").val("");
	}
		
}

function appendStyleRangeWellness(){
	var styleRange = $("#styleRangeTextBoxW").val().trim();
	if(styleRange != ""){
		var op = '<option value="'+styleRange+'">'+styleRange+'</option>';
		$("#styleRangeDropDownW").append(op);
		$("#styleRangeTextBoxW").val("");
	}
		
}


function appendColours(){
	var colour = $("#colourRangeTextBox").val().trim();
	if(colour != ""){
		var op = '<option value="'+colour+'">'+colour+'</option>';
		$("#colourRangeDropDown").append(op);
		$("#colourRangeTextBox").val("");
	}
		
}

function appendColoursWellness(){
	var colour = $("#colourRangeTextBoxW").val().trim();
	if(colour != ""){
		var op = '<option value="'+colour+'">'+colour+'</option>';
		$("#colourRangeDropDownW").append(op);
		$("#colourRangeTextBoxW").val("");
	}
		
}


function appendSize(){
	var size = $("#sizeRangeTextBox").val().trim();
	if(size != ""){
		var op = '<option value="'+size+'">'+size+'</option>';
		$("#sizeRangeDropDown").append(op);
		$("#sizeRangeTextBox").val("");
	}
		
}
function appendSizeWellness(){
	var size = $("#sizeRangeTextBoxW").val().trim();
	if(size != ""){
		var op = '<option value="'+size+'">'+size+'</option>';
		$("#sizeRangeDropDownW").append(op);
		$("#sizeRangeTextBoxW").val("");
	}
		
}
function appendBatch(){
	var batch = $("#batchRangeTextBox").val().trim();
	if(batch != ""){
		var op = '<option value="'+batch+'">'+batch+'</option>';
		$("#batchRangeDropDown").append(op);
		$("#batchRangeTextBox").val("");
	}
		
}

function appendBatchWellness(){
	var batch = $("#batchRangeTextBoxW").val().trim();
	if(batch != ""){
		var op = '<option value="'+batch+'">'+batch+'</option>';
		$("#batchRangeDropDownW").append(op);
		$("#batchRangeTextBoxW").val("");
	}
		
}

function addSelectedProductAndMeasurementRange(){
	debugger
	var locationId = "";
	$(".priceListLocationDiv").each(function(){
		if($(this).css("display") == "block"){
			locationId = $(this).attr("class").replace(" priceListLocationDiv","");
		}
	});
	locationId = locationId.replace(/\s/g, '');
	if(locationId.replace(/\s/g, '') != "")
	$("div ."+locationId+" .pricelist").each(function(){
		 var disp = $(this).css("display");
		 //debugger;
		 if(disp == 'block'){
			 id = parseInt($(this).attr("id").replace('pricelist'+locationId,''));
			 $("#productRange"+locationId+id).val($("#productRangeDropDown").val());
			 $("#measurementRange"+locationId+id).val($("#measurementRangeDropDown").val());
			 $("#utilityRange"+locationId+id).val($("#utilityRangeDropDown").val());
			 $("#colourRange"+locationId+id).val($("#colourRangeDropDown").val());
			 $("#sizeRange"+locationId+id).val($("#sizeRangeDropDown").val());
			 $("#batchRange"+locationId+id).val($("#batchRangeDropDown").val());
			 $("#styleRange"+locationId+id).val($("#styleRangeDropDown").val());
			
			 $("#productRangeDropDown").val($("#productRange"+locationId+id).val());
			 $("#measurementRangeDropDown").val($("#measurementRange"+locationId+id).val())
			 $("#utilityRangeDropDown").val($("#utilityRange"+locationId+id).val())
			 $("#colourRangeDropDown").val($("#colourRange"+locationId+id).val())
			 $("#sizeRangeDropDown").val($("#sizeRange"+locationId+id).val())
			 $("#batchRangeDropDown").val($("#batchRange"+locationId+id).val())
			 $("#styleRangeDropDown").val($("#styleRange"+locationId+id).val())
			 
			 
		 }
	 });
}



function addSelectedProductAndMeasurementRangeWellness(){
	debugger
	var locationId = "";
	$(".priceListWLocationDiv").each(function(){
		if($(this).css("display") == "block"){
			locationId = $(this).attr("class").replace(" priceListWLocationDiv","");
		}
	});
	if(locationId != "")
	$("div ."+locationId+" .pricelistW").each(function(){
		 var disp = $(this).css("display");
		 if(disp == 'block'){
			 id = parseInt($(this).attr("id").replace('pricelistW'+locationId,''));
			 $("#productRange"+locationId+id).val($("#productRangeDropDownW").val());
			// alert($("productRangeDropDown").val());
			 $("#measurementRange"+locationId+id).val($("#measurementRangeDropDownW").val());
			 $("#utilityRange"+locationId+id).val($("#utilityRangeDropDownW").val());
			// alert($("utilityRangeDropDown").val());
			 $("#colourRange"+locationId+id).val($("#colourRangeDropDownW").val());
			 $("#sizeRange"+locationId+id).val($("#sizeRangeDropDownW").val());
			 $("#batchRange"+locationId+id).val($("#batchRangeDropDownW").val());
			 $("#styleRange"+locationId+id).val($("#styleRangeDropDownW").val());
		 }
	 });
}


function displayProductAndMeasurementRange(){
	//debugger
	
	
	 
	 $("#productRangeDropDown").val("");
	 $("#measurementRangeDropDown").val("");
	 $("#utilityRangeDropDown").val("");
	 $("#colourRangeDropDown").val("");
	 $("#sizeRangeDropDown").val("");
	 $("#batchRangeDropDown").val("");
	 $("#styleRangeDropDown").val("");
	
	
	var locationId = "";
	$(".priceListLocationDiv").each(function(){
		if($(this).css("display") == "block"){
			locationId = $(this).attr("class").replace(" priceListLocationDiv","");
		}
	});
	locationId = locationId.replace(/\s/g, '');
	if(locationId != "")
	$("div ."+locationId+" .pricelist").each(function(){
		 var disp = $(this).css("display");
		 
		
		 
		 
		 if(disp == 'block'){
			 id = parseInt($(this).attr("id").replace('pricelist'+locationId,''));
			 if($("#productRange"+locationId+id).val() != "")
				 $("#productRangeDropDown").val($("#productRange"+locationId+id).val());
			 if($("#measurementRange"+locationId+id).val() != "")
				 $("#measurementRangeDropDown").val($("#measurementRange"+locationId+id).val());
			 if($("#utilityRange"+locationId+id).val() != "")
				 $("#utilityRangeDropDown").val($("#utilityRange"+locationId+id).val());
			 if($("#colourRange"+locationId+id).val() != "")
				 $("#colourRangeDropDown").val($("#colourRange"+locationId+id).val());
			 if($("#sizeRange"+locationId+id).val() != "")
				 $("#sizeRangeDropDown").val($("#sizeRange"+locationId+id).val());
			 if($("#batchRange"+locationId+id).val() != "")
				 $("#batchRangeDropDown").val($("#batchRange"+locationId+id).val());
			 if($("#styleRange"+locationId+id).val() != "")
				 $("#styleRangeDropDown").val($("#styleRange"+locationId+id).val());
		 }
		 
	 });
}

function displayProductAndMeasurementRangeForWellness(){
	//debugger
	var locationId = "";
	$(".priceListLocationWDiv").each(function(){
		if($(this).css("display") == "block"){
			locationId = $(this).attr("class").replace(" priceListLocationWDiv","");
		}
	});
	if(locationId != "")
	$("div ."+locationId+" .pricelistW").each(function(){
		 var disp = $(this).css("display");
		 if(disp == 'block'){
			 id = parseInt($(this).attr("id").replace('pricelist'+locationId,''));
			 if($("#productRange"+locationId+id).val() != "")
				 $("#productRangeDropDown").val($("#productRange"+locationId+id).val());
			 if($("#measurementRange"+locationId+id).val() != "")
				 $("#measurementRangeDropDownW").val($("#measurementRange"+locationId+id).val());
			 if($("#utilityRange"+locationId+id).val() != "")
				 $("#utilityRangeDropDownW").val($("#utilityRange"+locationId+id).val());
			 if($("#colourRange"+locationId+id).val() != "")
				 $("#colourRangeDropDownW").val($("#colourRange"+locationId+id).val());
			 if($("#sizeRange"+locationId+id).val() != "")
				 $("#sizeRangeDropDownW").val($("#sizeRange"+locationId+id).val());
			 if($("#batchRange"+locationId+id).val() != "")
				 $("#batchRangeDropDownW").val($("#batchRange"+locationId+id).val());
			 if($("#styleRange"+locationId+id).val() != "")
				 $("#styleRangeDropDownW").val($("#styleRange"+locationId+id).val());
		 }
		 
	 });
}

function appendMeasurementRange(){
	var measurementRange = $("#measurementRangeTextBox").val().trim();
	if(measurementRange != ""){
		var op = '<option value="'+measurementRange+'">'+measurementRange+'</option>';
		$("#measurementRangeDropDown").append(op);
		$("#measurementRangeTextBox").val("");
	}
		
}


function appendMeasurementRangeWellness(){
	var measurementRange = $("#measurementRangeTextBoxW").val().trim();
	if(measurementRange != ""){
		var op = '<option value="'+measurementRange+'">'+measurementRange+'</option>';
		$("#measurementRangeDropDownW").append(op);
		$("#measurementRangeTextBoxW").val("");
	}
		
}



function appendStyleRang(){
	var styleRange = $("#styleRangeTextBox").val().trim();
	if(styleRange != ""){
		var op = '<option value="'+styleRange+'">'+styleRange+'</option>';
		$("#styleRangeDropDown").append(op);
		$("#styleRangeTextBox").val("");
	}
		
}

function changePriceListType(ele){
	debugger
	if(ele != undefined && ele != ""){
		var priceListType = $(ele).prop("checked");
		if(priceListType){
			$("input[name='priceListType'][value='specific']").prop('checked', true);
		}
		else{
			$("input[name='priceListType'][value='all']").prop('checked', true);
		}
	}
	var selectedLocation = "";
	var priceListCheck =$("input:radio[name='priceListType']:checked").val();
	if(priceListCheck == "all"){
		$("select[multiple] option").prop("selected", "selected");
		//$("#selectedLocation").attr("disabled","disabled");
		/*$(".priceListLocationDiv").each(function(){
			 $(this).css("display","none");
		});*/
		selectedLocation = "AllLocation";
	}else{
		//$("#selectedLocation").removeAttr("disabled");
		var location = $("#selectedLocation").val();
		location = location.replace(/ /g,'_');
		/*$(".priceListLocationDiv").each(function(){
			 $(this).css("display","none");
		});*/
		/*if($("."+location).html() == ""){
			appendPriceListToEmptyDiv(location);
		}*/
		selectedLocation = location;
	}
	$(".priceListLocationDiv").each(function(){
		 $(this).css("display","none");
	});
	if($("."+selectedLocation).html() == ""){
		appendPriceListToEmptyDiv(selectedLocation);
	}
	$(".pricelist").each(function(){
		 $(this).css("display","none");
	});
	$("."+selectedLocation).css("display","block");
	$("div ."+selectedLocation+" .pricelist:first").css("display","block");
	$("#prevImg").css("opacity","0.5");
	if($("div ."+selectedLocation+" .pricelist").length == 1)
		$("#nextImg").css("opacity","0.5");
	else
		$("#nextImg").css("opacity","1");
	$("#currentPriceList").html("1 of "+$("div ."+selectedLocation+" .pricelist").length);
	displayProductAndMeasurementRange();
	calculateStock();
}


function changePriceListWellnessType(ele){
	if(ele != undefined && ele != ""){
		var priceListType = $(ele).prop("checked");
		if(priceListType){
			$("input[name='priceListType'][value='specific']").prop('checked', true);
		}
		else{
			$("input[name='priceListType'][value='all']").prop('checked', true);
		}
	}
	var selectedLocation = "";
	if($("input:radio[name='priceListType']:checked").val() == "all"){
		$("select[multiple] option").prop("selected", "selected");
		//$("#selectedLocation").attr("disabled","disabled");
		/*$(".priceListLocationDiv").each(function(){
			 $(this).css("display","none");
		});*/
		selectedLocation = "AllLocation";
	}else{
		//$("#selectedLocation").removeAttr("disabled");
		var location = $("#selectedLocation").val();
		location = location.replace(/ /g,'_');
		/*$(".priceListLocationDiv").each(function(){
			 $(this).css("display","none");
		});*/
		/*if($("."+location).html() == ""){
			appendPriceListToEmptyDiv(location);
		}*/
		selectedLocation = location;
	}
	$(".priceListLocationDiv").each(function(){
		 $(this).css("display","none");
	});
	if($("."+selectedLocation).html() == ""){
		appendPriceListToEmptyDiv(selectedLocation);
	}
	$(".pricelist").each(function(){
		 $(this).css("display","none");
	});
	$("."+selectedLocation).css("display","block");
	$("div ."+selectedLocation+" .pricelist:first").css("display","block");
	$("#prevImg").css("opacity","0.5");
	if($("div ."+selectedLocation+" .pricelist").length == 1)
		$("#nextImg").css("opacity","0.5");
	else
		$("#nextImg").css("opacity","1");
	$("#currentPriceList").html("1 of "+$("div ."+selectedLocation+" .pricelist").length);
	displayProductAndMeasurementRange();
	calculateStock();
}


function calculateStock(){
	var numberOfLocation = 1;
	var locationIdArray = [];
	if($("input:radio[name='priceListType']:checked").val() == "all"){
		numberOfLocation = $("select[multiple] option").length;
		locationIdArray.push("AllLocation");
	}else{
		$("#selectedLocation option").each(function(){
			var location = $(this).val();
			location = location.replace(/ /g,'_');
			locationIdArray.push(location);
		});
	}
	var totalStock = 0;
	for(var i = 0; i < locationIdArray.length ; i++){
		var locationId = locationIdArray[i];
		$("div ."+locationId+" .pricelist").each(function(){
			var id = parseInt($(this).attr("id").replace('pricelist'+locationId,''));
			var quantity = $("#pluQuantity"+locationId+id).val();
			if(quantity == "")
				quantity = 0;
			totalStock = parseFloat(totalStock) + parseFloat(quantity); 
		});
	}
	totalStock = totalStock * numberOfLocation;
	$("#stock").val(totalStock);
}

function getPriceListForSelectedLocation(ele){
	debugger
	
	
		  
		
	addSelectedProductAndMeasurementRange();
	var location = $("#selectedLocation").val();
	
	location = location.replace(/ /g,'_');
	$(".priceListLocationDiv").each(function(){
		 $(this).css("display","none");
	});
	if($("."+location).html().trim() == ""){
		appendPriceListToEmptyDiv(location);
	}
	$(".pricelist").each(function(){
		 $(this).css("display","none");
	});
	$("."+location).css("display","block");
	$("div ."+location+" .pricelist:first").css("display","block");
	$("#prevImg").css("opacity","0.5");
	if($("div ."+location+" .pricelist").length == 1)
		$("#nextImg").css("opacity","0.5");
	else
		$("#nextImg").css("opacity","1");
	$("#currentPriceList").html("1 of "+$("div ."+location+" .pricelist").length);
	displayProductAndMeasurementRange();
		  } 







function setExpiryDateAndUpdatedDate(){
	var dateTime = getCurrentDate();
	 var date = dateTime.split(' ');
	date = date[0].split('/');
	var formatedDate = date[1]+"/"+date[0]+"/"+date[2];
	$("#selectedLocation option").each(function(){
		var location = $(this).val();
		location = location.replace(/ /g,'_');
		if(location != ""){
		$("div ."+location+" .pricelist").each(function(){
			var id = $(this).attr("id").replace('pricelist'+location,'');
			callCalender('pluExpiryDate'+location+id);
			$('#pluUpdatedDate'+location+id).val(formatedDate);
//			$('#pluCreatedDate'+location+id).val(formatedDate);
		});
		}
	});
}

/*warehouse master*/


function validateWarehouseSkuForm(operation){
	debugger;
	 //purpose:for checking internet conection
	var online = window.navigator.onLine;
  	if(!online)
  	{
  	alert("check your internet connection,please try agian after some time");
  	return;
  	}
	addSelectedProductAndMeasurementRange();
	var finalObj = {}, warehouseSkuPriceLists = [];
	if($("#skuId").val().trim() == ""){
		$("#skuIdError").html("Enter Sku Id");
		focusDiv('skuIdError');
		return;
	}
	if(parseInt($("#skuId").val().length)>100) {
		 $("#skuId").focus();
		 $("#skuIdError").html("Sku Id can't exceeds 100 characters");
		 return;
	}else {
	$("#skuIdError").html("");
  }
	
	
	/*if($("#productNameDetailError").text() != ""){
		$("#productNameDetailError").html("Product Name doesn't exist");
		focusDiv('productNameDetailError');
		return false;
	}*/
	
	if($("#searchItems").val().trim() == ""){
	  $("#productNameDetailError").html("Enter Product Name");
	  $("#searchItems").focus();
	  return;
	}
	
	if(parseInt($("#searchItems").val().length)>100) {
		 $("#searchItems").focus();
		 $("#productNameDetailError").html("Product Name can't exceeds 100 characters");
		 return;
	}else {
	$("#productNameDetailError").html("");
   }
	
	if(parseInt($("#ean").val().length)>25) {
		 $("#ean").focus();
		 $("#eanwarehouseError").html("EAN length can't exceeds 25 characters");
		 return;
	}else {
	$("#eanwarehouseError").html("");
}
	
	/*if($("#productId").val() == ""){
	  $("#productNameError").html("Product Name doesn't exist");
	  $("#searchItems").focus();
	  return;
	}*/
	if(operation == "new"){
	if($("#searchSupplier").val().trim() == ""){
		$("#supplierNameError").html("Enter Supplier Name");
		$("#searchSupplier").focus();
		return;
	}
 }
	
	if($("#manufacturer").val().trim() == ""){
		$("#manufacturerError").html("Enter Manufacturer Name");
		focusDiv('manufacturerError');
		return;
	}
	
	if(parseInt($("#manufacturerCode").val().length)>100) {
		 $("#manufacturerCode").focus();
		 $("#manufacturerCodeError").html("Manufacturer Code can't exceeds 100 characters");
		 return;
	}else {
	$("#manufacturerCodeError").html("");
 }
	
	if(parseInt($("#manufacturer").val().length)>100) {
		 $("#manufacturer").focus();
		 $("#manufacturerError").html("Manufacturer Name can't exceeds 100 characters");
		 return;
	}else {
	$("#manufacturerError").html("");
}
	
	if(parseInt($("#uomLabel").val().length)>50) {
		 $("#uomLabel").focus();
		 $("#weightwarehouseError").html("UOM Label can't exceeds 50 characters");
		 return;
	}else {
	$("#weightwarehouseError").html("");
 }
	if(parseInt($("#packSize").val().length)>11) {
		 $("#packSize").focus();
		 $("#packSizewarehouseError").html("Pack Size can't exceeds 11 digits");
		 return;
	} else{
	$("#packSizewarehouseError").html("");
 }
	if(parseInt($("#retailunits").val().length)>11) {
		 $("#retailunits").focus();
		 $("#retailunitsError").html("Retail Units can't exceeds 11 digits");
		 return;
	} else{
	$("#retailunitsError").html("");
}
	
	if(parseInt($("#model").val().length)>100) {
		 $("#model").focus();
		 $("#modelwarehouseError").html("Model can't exceeds 100 Characters");
		 return;
	} else{
	$("#modelwarehouseError").html("");
 }
	if(parseInt($("#color").val().length)>30) {
		 $("#color").focus();
		 $("#colorError").html("Color can't exceeds 30 Character");
		 return;
	} else{
	$("#colorError").html("");
}
	
	if($("#hsnCode").val().trim() == ""){
		$("#hsnCodeError").html("Enter HSN code");
		$("#hsnCode").focus();
		return;
	}
	
	if(parseInt($("#hsnCode").val().length)>50){
		 $("#hsnCode").focus();
		 $("#hsnCodeError").html("HSN Code can't exceeds 50 Character");
		 return;
	} else{
	$("#hsnCodeError").html("");
}
	
	if(parseInt($("#leadTime").val().length)>50){
		 $("#leadTime").focus();
		 $("#leadTimeError").html("Lead Time length can't exceeds 50 digits");
		 return;
	} else{
	$("#leadTimeError").html("");
}
	if(parseInt($("#frTaxCode").val().length)>11){
		 $("#frTaxCode").focus();
		 $("#frTaxCodewarehouseError").html("Fr Tax Code length can't exceeds 11 digits");
		 return;
	} else{
	$("#frTaxCodewarehouseError").html("");
}
	
	/*if(parseInt($("#markUp").val().length)>11){
		 $("#markUp").focus();
		 $("#markUpError").html("MarkUp length can't exceeds 100 Character");
		 return;
	} else{
	$("#markUpError").html("");
}*/
	
	if(parseInt($("#markDown").val().length)>100){
		 $("#markDown").focus();
		 $("#markDownError").html("MarkDown length can't exceeds 100 Character");
		 return;
	} else {
	$("#markDownError").html("");
}
	if(parseInt($("#runningPlu").val().length)>100){
		 $("#runningPlu").focus();
		 $("#runningPluError").html("Running PLU length can't exceeds 100 Character");
		 return;
	} else {
	$("#runningPluError").html("");
}
	
	if(parseInt($("#skutheme").val().length)>100){
		 $("#skutheme").focus();
		 $("#skuThemewarehouseError").html("Theme length can't exceeds 100 Character");
		 return;
	} else {
	$("#skuThemewarehouseError").html("");
}
	
	if(parseInt($("#skuSubtheme").val().length)>100){
		 $("#skuSubtheme").focus();
		 $("#skuSubthemewarehouseError").html("Sub Theme length can't exceeds 100 Character");
		 return;
	} else {
	$("#skuSubthemewarehouseError").html("");
}
	
	if(parseInt($("#alternate_sku").val().length)>100){
		 $("#alternate_sku").focus();
		 $("#alternate_skuwarehouseError").html("Alternate SKU length can't exceeds 100 Character");
		 return;
	} else {
	$("#alternate_skuwarehouseError").html("");
}
	if(parseInt($("#season_code").val().length)>50){
		 $("#season_code").focus();
		 $("#season_codeError").html("Season Code length can't exceeds 50 Character");
		 return;
	} else {
	$("#season_codeError").html("");
 }
	if(parseInt($("#alias_name").val().length)>100){
		 $("#alias_name").focus();
		 $("#alias_namewarehouseError").html("Alias Name can't exceeds 100 Character");
		 return;
	} else {
	$("#alias_namewarehouseError").html("");
}
	if(parseInt($("#item_type").val().length)>100){
		 $("#item_type").focus();
		 $("#item_typeWarehouseError").html("Item type can't exceeds 100 Character");
		 return;
	} else {
	$("#item_typeWarehouseError").html("");
}
	if(parseInt($("#item_design").val().length)>100){
		 $("#item_design").focus();
		 $("#item_designWarehouseError").html("Item Design can't exceeds 100 Character");
		 return;
	}else{
	$("#item_designWarehouseError").html("");
 }
	
	if(parseInt($("#productHandingDetail").val().length)>250){
		 $("#productHandingDetail").focus();
		 $("#productHandingDetailwarehouseError").html("Product Handling can't exceeds 250 Character");
		 return;
	}else{
	$("#productHandingDetailwarehouseError").html("");
}
	
	if(parseInt($("#shortDescription").val().length)>250){
		 $("#shortDescription").focus();
		 $("#shortDescriptionError").html("Short Description can't exceeds 250 Character");
		 return;
	}else{
	$("#shortDescriptionError").html("");
 }
	
	if(parseInt($("#warrantyDetails").val().length)>250){
		 $("#warrantyDetails").focus();
		 $("#warrantyDetailsError").html("Warranty Details can't exceeds 250 Character");
		 return;
	}else{
	$("#warrantyDetailsError").html("");
}
	
	/*if($("#minSaleQty").val().trim() == ""){
		$("#minSaleQtyError").html("Enter Minimum Sale Qty");
		focusDiv('minSaleQtyError');
		return;
	}*/
	
	if(operation == "new"){
		if($("#minSaleQty").val().trim() == ""){
			$("#minSaleQtyError").html("Enter Minimum Sale Qty");
			focusDiv('minSaleQtyError');
			return;
	   }
		}
	
	if(operation == "new"){
/*		if($("#supplierNameError").text() != ""){
			$("#supplierNameError").html("Supplier Name doesn't exist");
			focusDiv('supplierNameError');
			return false;
		}
		if($("#searchSupplier").val().trim() == ""){
		  $("#supplierNameError").html("Enter Supplier Name");
		  $("#searchSupplier").focus();
		  return;
		}
		if($("#supplier_Id").val() == ""){
		  $("#supplierNameError").html("Supplier Name doesn't exist");
		  $("#searchSupplier").focus();
		  return;
		}*/
	}
	if(operation == "edit"){
		/*if($("#supplier_Id").val() == "" || $("#supplier_Id").val() == null){
			  $("#supplierNameError").html("Select Supplier Name");
			  focusDiv('supplierNameError');
			  return;
			}*/
	}
	
//	if($("#manufacturer").val().trim() == ""){
//		$("#manufacturerError").html("Enter Manufacturer Name");
//		focusDiv('manufacturerError');
//		return;
//	}
	/*if($("#stock").val().trim() == ""){
		$("#stockError").html("Enter Stock");
		focusDiv('stockError');
		return;
	}*/
	/*if($("#location").val() == null){
		$("#locationError").html("Select Atleast one Location");
		focusDiv('locationError');
		return;
	}*/
	
	if($("#shortDescription").val().trim() == ""){
		$("#shortDescriptionError").html("Enter Description");
		focusDiv('shortDescriptionError');
		return;
	}
	
	//debugger;
	finalObj.skuId = $("#skuId").val();
	finalObj.productId = $("#productId").val();
	finalObj.category = $("#categoryName").val();
	finalObj.categoryId= $("#categoryName").val();
	finalObj.subCategoryName = $("#subCategoryName").val();
	finalObj.subCategory = $("#subCategoryName").val();
	finalObj.productCategory = $("#categoryName").val();
	finalObj.supplierName =  $("#searchSupplier").val()
	//finalObj.supplier = $("#searchSupplier").val();
	finalObj.ean = $("#ean").val();
	finalObj.brandCode = $("#brandCode").val();
	finalObj.status = $("#status").val();
	finalObj.manufacturerCode = $("#manufacturerCode").val();
	finalObj.make = $("#manufacturer").val();
	finalObj.uom = $("#uom").val();
	finalObj.retailUnits = $("#retailunits").val();
	
	finalObj.theme = $("#skutheme").val();
	finalObj.subTheme = $("#skuSubtheme").val();
	//finalObj.retailUom=$("#retailuom").val();
	//finalObj.retailUnits=$("#retailunits").val();
	
	finalObj.stock = $("#stock").val();
	finalObj.uomLabel = $("#uomLabel").val();
	finalObj.packSize = $("#packSize").val();
	finalObj.jitStock = $("#jitStock").val();
	finalObj.manufacturedItem = $("#manufactureItem").val();
	finalObj.zeroStock = $("#zeroStock").val();
	finalObj.minSaleQty = $("#minSaleQty").val();
	finalObj.color =  $("#color").val();
	finalObj.patternCode = $("#patternCode").val();
	finalObj.hsnCode = $("#hsnCode").val();
	finalObj.reorderPoint = $("#reorderPoint").val();
	finalObj.orderQuantity = $("#orderQuantity").val();
	finalObj.leadTimeDays = $("#leadTime").val();
	finalObj.maxStock = $("#maxStock").val();
	//finalObj.stock = $("#stock").val();
	finalObj.primaryDepartment = $("#primaryDepartment").val();
	finalObj.secondaryDepartment = $("#secondaryDepartment").val();

	finalObj.productHandlng = $("#productHandingDetail").val();
	finalObj.batchRequired = $("#batchrequired").val();
	if($("#batchrequired").val() == "true" &&  $("#expirytolerance").val() == ""){
		$("#expirytolerance").focus();
		$("#expirytoleranceError").html("Enter Expiry tolerance");
		return;
	}else{
		$("#expirytoleranceError").html("");
	}
	if( $("#expirytolerance").val() == ""){
		$("#expirytolerance").val("0");
	}
	
	finalObj.dispatchExpiryTolerance = $("#expirytolerance").val();
	finalObj.alternateSkuId = $("#alternate_sku").val();
	finalObj.aliasName = $("#alias_name").val();
	finalObj.itemType = $("#item_type").val();
	finalObj.itemDesign = $("#item_design").val();
	if($("#frTaxCode").val() == "")
		finalObj.frTaxCode = 0;
	else
		finalObj.frTaxCode = $("#frTaxCode").val();
	
	finalObj.taxCode = $("#taxCode").val();
	finalObj.markUp = $("#markUp").val();
	finalObj.markDown = $("#markDown").val();
	finalObj.runningPluNumber = $("#runningPlu").val();
	finalObj.model = $("#model").val();
	finalObj.openRate = $("#openRate").val();
	finalObj.lastCost = $("#lastCost").val();
	finalObj.avgCost = $("#averageCost").val();
	finalObj.minimumPrice = $("#minPrice").val();
	finalObj.created_date = $("#createdDate").val();
	finalObj.updated_date = $("#lastUpdated").val();
	finalObj.strPicture1 = $("#picture1_refId").val();
	finalObj.picture1 = $("#picture1_name").val();
	if($("#picture1_thumbnail").length > 0)
		finalObj.picture1flag = "true";
	else
		finalObj.picture1flag = "false";
	finalObj.strPicture2 = $("#picture2_refId").val();
	finalObj.picture2 = $("#picture2_name").val();
	if($("#picture2_thumbnail").length > 0)
		finalObj.picture2flag = "true";
	else
		finalObj.picture2flag = "false";
	finalObj.strPicture3 = $("#picture3_refId").val();
	finalObj.picture3 = $("#picture3_name").val();
	if($("#picture3_thumbnail").length > 0)
		finalObj.picture3flag = "true";
	else
		finalObj.picture3flag = "false";
	finalObj.nonTaxable = $("#nonTaxable").prop("checked");
	finalObj.discountable = $("#discountable").prop("checked");
	finalObj.allowDecimals = $("#allowDecimals").prop("checked");
	if($("input:radio[name='priceListType']:checked").val() == "all")
		finalObj.storeLocation = "ALL";
	else
		finalObj.storeLocation = "";
	finalObj.description = $("#shortDescription").val();
	finalObj.warantyDetails = $("#warrantyDetails").val();
	finalObj.category = $("#categoryName").val();
	finalObj.trackingRequired = $("#itemTrackRequired").val();
	
	finalObj.picklistItem = $("#itemPickListRequired").val();
	//finalObj.subCategoryName = $("#subCategoryName").val();
	finalObj.warehouseSkuPriceLists = warehouseSkuPriceLists;
//	var quantityInPriceList = 0;
	var flag = true; 
	//debugger;
	var locationIdArray = [];
	if($("input:radio[name='priceListType']:checked").val() == "all"){
		locationIdArray.push("AllLocation");
	}else{
		$("#selectedLocation option").each(function(){
			var location = $(this).val();
			location = location.replace(/ /g,'_');
			locationIdArray.push(location);
		});
	}
	//debugger;
	for(var i = 0; i < locationIdArray.length ; i++){
		//debugger;
		var priceList = [];
		var locationId = locationIdArray[i];
		 var storeLocation = "";
		 if(locationId != "AllLocation"){
			 storeLocation = locationId.replace(/_/g,' ');
		 }
		$("div ."+locationId+" .pricelist").each(function(){
			 id = parseInt($(this).attr("id").replace('pricelist'+locationId,''));
			 debugger;
			 
if(locationId == "AllLocation" && $("#pluCostPrice"+locationId+id).val() == "" && $("#pluPrice"+locationId+id).val() == ""){
				 
			 }else{
			 
			 
			 if($("#pluCostPrice"+locationId+id).val() == ""){
				 $("#pluCostPrice"+locationId+id+"Error").html("Enter Cost Price");
				 $(".pricelist").each(function(){
					 $(this).css("display","none");
				 });
				 $(this).css("display","block");
				 $(".priceList").css("display","block");
				 $(".priceListLocationDiv").each(function(){
					 $(this).css("display","none");
				});
				 $("."+locationId).css("display","block");
				 $("div ."+locationId+" .priceList").css("display","block");
				 displayCurrentPageNo();
				 flag = false;
//				 alert("pluCostPrice"+locationId+id+"Error");
				 if(storeLocation != "")
					 $("#selectedLocation").val(storeLocation);
				 $("#pluCostPrice"+locationId+id).focus();
				 return false;
			 }
			 if($("#pluPrice"+locationId+id).val() == ""){
				 $("#pluPrice"+locationId+id+"Error").html("Enter Price");
				 $(".pricelist").each(function(){
					 $(this).css("display","none");
				 });
				 $(this).css("display","block");
				 $(".priceList").css("display","block");
				 $(".priceListLocationDiv").each(function(){
					 $(this).css("display","none");
				});
				 $("."+locationId).css("display","block");
				 $("div ."+locationId+" .priceList").css("display","block");
				 displayCurrentPageNo();
				 flag = false;
				 if(storeLocation != "")
					 $("#selectedLocation").val(storeLocation);
				 $("#pluPrice"+locationId+id).focus();
				 return false;
			 }
			 if($("#pluSalePrice"+locationId+id).val() == ""){
				 $("#pluSalePrice"+locationId+id+"Error").html("Enter Sale Price");
				 $(".pricelist").each(function(){
					 $(this).css("display","none");
				 });
				 $(this).css("display","block");
				 $(".priceList").css("display","block");
				 $(".priceListLocationDiv").each(function(){
					 $(this).css("display","none");
				});
				 $("."+locationId).css("display","block");
				 $("div ."+locationId+" .priceList").css("display","block");
				 displayCurrentPageNo();
				 flag = false;
				 if(storeLocation != "")
					 $("#selectedLocation").val(storeLocation);
				 $("#pluSalePrice"+locationId+id).focus();
				 return false;
			 }
			 if(parseFloat($("#pluCostPrice"+locationId+id).val()) > parseFloat($("#pluSalePrice"+locationId+id).val())){
				$("#pluSalePrice"+locationId+id+"Error").html("Sale Price Should be > Cost Price");
				 $(".pricelist").each(function(){
					 $(this).css("display","none");
				 });
				 $(this).css("display","block");
				 $(".priceList").css("display","block");
				 $(".priceListLocationDiv").each(function(){
					 $(this).css("display","none");
				});
				 $("."+locationId).css("display","block");
				 $("div ."+locationId+" .priceList").css("display","block");
				 displayCurrentPageNo();
				 flag = false;
				 if(storeLocation != "")
					 $("#selectedLocation").val(storeLocation);
				 $("#pluSalePrice"+locationId+id).focus();
				 return false;
			 }
			 if($("#pluWsPrice"+locationId+id).val() == ""){
				 $("#pluWsPrice"+locationId+id+"Error").html("Enter Whole Sale Price");
				 $(".pricelist").each(function(){
					 $(this).css("display","none");
				 });
				 $(this).css("display","block");
				 $(".priceList").css("display","block");
				 $(".priceListLocationDiv").each(function(){
					 $(this).css("display","none");
				});
				 $("."+locationId).css("display","block");
				 $("div ."+locationId+" .priceList").css("display","block");
				 displayCurrentPageNo();
				 flag = false;
				 if(storeLocation != "")
					 $("#selectedLocation").val(storeLocation);
				 $("#pluWsPrice"+locationId+id).focus();
				 return false;
			 }
			 
			 debugger
			 if(parseInt($("#ean"+locationId+id).val().length)>30){
				 $("#ean"+locationId+id).focus();
				 $("#ean"+locationId+id+"Error").html("EAN can't exceeds 30 Character");
				 $(".pricelist").each(function(){
					 $(this).css("display","none");
				 });
				 $(this).css("display","block");
				 $(".priceList").css("display","block");
				 $(".priceListLocationDiv").each(function(){
					 $(this).css("display","none");
				});
				 $("."+locationId).css("display","block");
				 $("div ."+locationId+" .priceList").css("display","block");
				 displayCurrentPageNo();
				 flag = false;
				 if(storeLocation != "")
					 $("#selectedLocation").val(storeLocation);
				 $("#ean"+locationId+id).focus();
				 return false;
			 }else{
			$("#ean"+locationId+id+"Error").html("");
		  }
			 
			 if(parseInt($("#pluColor"+locationId+id).val().length)>25){
				 $("#pluColor"+locationId+id).focus();
				 $("#pluColor"+locationId+id+"Error").html("Color can't exceeds 25 Character");
				 $(".pricelist").each(function(){
					 $(this).css("display","none");
				 });
				 $(this).css("display","block");
				 $(".priceList").css("display","block");
				 $(".priceListLocationDiv").each(function(){
					 $(this).css("display","none");
				});
				 $("."+locationId).css("display","block");
				 $("div ."+locationId+" .priceList").css("display","block");
				 displayCurrentPageNo();
				 flag = false;
				 if(storeLocation != "")
					 $("#selectedLocation").val(storeLocation);
				 $("#pluColor"+locationId+id).focus();
				 return false;
			 }else{
			$("#pluColor"+locationId+id+"Error").html("");
		  }
			 
			 if(parseInt($("#pluColorShade"+locationId+id).val().length)>25){
				 $("#pluColorShade"+locationId+id).focus();
				 $("#pluColorShade"+locationId+id+"Error").html("Color Shade can't exceeds 25 Character");
				 $(".pricelist").each(function(){
					 $(this).css("display","none");
				 });
				 $(this).css("display","block");
				 $(".priceList").css("display","block");
				 $(".priceListLocationDiv").each(function(){
					 $(this).css("display","none");
				});
				 $("."+locationId).css("display","block");
				 $("div ."+locationId+" .priceList").css("display","block");
				 displayCurrentPageNo();
				 flag = false;
				 if(storeLocation != "")
					 $("#selectedLocation").val(storeLocation);
				 $("#pluColorShade"+locationId+id).focus();
				 return false;
			 }else{
			$("#pluColorShade"+locationId+id+"Error").html("");
		  }
			 
			 if(parseInt($("#pluMbq"+locationId+id).val().length)>100){
				 $("#pluMbq"+locationId+id).focus();
				 $("#pluMbq"+locationId+id+"Error").html("MBQ can't exceeds 100 Character");
				 $(".pricelist").each(function(){
					 $(this).css("display","none");
				 });
				 $(this).css("display","block");
				 $(".priceList").css("display","block");
				 $(".priceListLocationDiv").each(function(){
					 $(this).css("display","none");
				});
				 $("."+locationId).css("display","block");
				 $("div ."+locationId+" .priceList").css("display","block");
				 displayCurrentPageNo();
				 flag = false;
				 if(storeLocation != "")
					 $("#selectedLocation").val(storeLocation);
				 $("#pluMbq"+locationId+id).focus();
				 return false;
			 }else{
			$("#pluMbq"+locationId+id+"Error").html("");
		  }
			 
			 if($("#pluQuantity"+locationId+id).val() == ""){
				 $("#pluQuantity"+locationId+id+"Error").html("Enter Quantity");
				 $(".pricelist").each(function(){
					 $(this).css("display","none");
				 });
				 $(this).css("display","block");
				 $(".priceList").css("display","block");
				 $(".priceListLocationDiv").each(function(){
					 $(this).css("display","none");
				});
				 $("."+locationId).css("display","block");
				 $("div ."+locationId+" .priceList").css("display","block");
				 displayCurrentPageNo();
				 flag = false;
				 if(storeLocation != "")
					 $("#selectedLocation").val(storeLocation);
				 $("#pluQuantity"+locationId+id).focus();
				 return false;
			 }
			 if($("#pluExpiryDate"+locationId+id).val() != ""){
				 var re = /^[0-9/]+$/;
				 if(!re.test($("#pluExpiryDate"+locationId+id).val())){
						$("#pluExpiryDate"+locationId+id+"Error").html("Invalid Date");
						$(".pricelist").each(function(){
						 $(this).css("display","none");
					    });
						$(this).css("display","block");
						$(".priceList").css("display","block");
						 $(".priceListLocationDiv").each(function(){
							 $(this).css("display","none");
						});
						 $("."+locationId).css("display","block");
						$("div ."+locationId+" .priceList").css("display","block");
						displayCurrentPageNo();
						flag = false;
						if(storeLocation != "")
							 $("#selectedLocation").val(storeLocation);
						$("#pluExpiryDate"+locationId+id).focus();
						return false;
				 }
				 
				 //debugger
				/* var noOfDays = daydiff(parseDate($('#pluUpdatedDate'+locationId+id).val()), parseDate($('#pluExpiryDate'+locationId+id).val()));
				 if(noOfDays < 0){
					 $("#pluExpiryDate"+locationId+id+"Error").html("Expiry Date can't be less than Today");
					 $(".pricelist").each(function(){
						 $(this).css("display","none");
					    });
						$(this).css("display","block");
						$(".priceList").css("display","block");
						 $(".priceListLocationDiv").each(function(){
							 $(this).css("display","none");
						});
						 $("."+locationId).css("display","block");
						$("div ."+locationId+" .priceList").css("display","block");
						displayCurrentPageNo();
						flag = false;
						if(storeLocation != "")
							 $("#selectedLocation").val(storeLocation);
						$("#pluExpiryDate"+locationId+id).focus();
						return false;
				 }*/
			 }
			 
			 if(parseInt($("#pluAcp"+locationId+id).val().length)>100){
				 $("#pluAcp"+locationId+id).focus();
				 $("#pluAcp"+locationId+id+"Error").html("ACP can't exceeds 100 Character");
				 $(".pricelist").each(function(){
					 $(this).css("display","none");
				 });
				 $(this).css("display","block");
				 $(".priceList").css("display","block");
				 $(".priceListLocationDiv").each(function(){
					 $(this).css("display","none");
				});
				 $("."+locationId).css("display","block");
				 $("div ."+locationId+" .priceList").css("display","block");
				 displayCurrentPageNo();
				 flag = false;
				 if(storeLocation != "")
					 $("#selectedLocation").val(storeLocation);
				 $("#pluAcp"+locationId+id).focus();
				 return false;
			 }else{
			$("#pluAcp"+locationId+id+"Error").html("");
		  }
			 
			 if(parseInt($("#pluMaterialtype"+locationId+id).val().length)>50){
				 $("#pluMaterialtype"+locationId+id).focus();
				 $("#pluMaterialtype"+locationId+id+"Error").html("Material Type can't exceeds 50 Character");
				 $(".pricelist").each(function(){
					 $(this).css("display","none");
				 });
				 $(this).css("display","block");
				 $(".priceList").css("display","block");
				 $(".priceListLocationDiv").each(function(){
					 $(this).css("display","none");
				});
				 $("."+locationId).css("display","block");
				 $("div ."+locationId+" .priceList").css("display","block");
				 displayCurrentPageNo();
				 flag = false;
				 if(storeLocation != "")
					 $("#selectedLocation").val(storeLocation);
				 $("#pluMaterialtype"+locationId+id).focus();
				 return false;
			 }else{
			$("#pluMaterialtype"+locationId+id+"Error").html("");
		  }
			 
			 if($("#pluDesc"+locationId+id).val() == ""){
				 $("#pluDesc"+locationId+id+"Error").html("Enter Description");
				 $(".pricelist").each(function(){
					 $(this).css("display","none");
				 });
				 $(this).css("display","block");
				 $(".priceList").css("display","block");
				 $(".priceListLocationDiv").each(function(){
					 $(this).css("display","none");
				});
				 $("."+locationId).css("display","block");
				 $("div ."+locationId+" .priceList").css("display","block");
				 displayCurrentPageNo();
				 flag = false;
				 if(storeLocation != "")
					 $("#selectedLocation").val(storeLocation);
				 $("#pluDesc"+locationId+id).focus();
				 return false;
			 }
			 
			 if(parseInt($("#pluDesc"+locationId+id).val().length)>250){
				 $("#pluDesc"+locationId+id).focus();
				 $("#pluDesc"+locationId+id+"Error").html("Description can't exceeds 250 Character");
				 $(".pricelist").each(function(){
					 $(this).css("display","none");
				 });
				 $(this).css("display","block");
				 $(".priceList").css("display","block");
				 $(".priceListLocationDiv").each(function(){
					 $(this).css("display","none");
				});
				 $("."+locationId).css("display","block");
				 $("div ."+locationId+" .priceList").css("display","block");
				 displayCurrentPageNo();
				 flag = false;
				 if(storeLocation != "")
					 $("#selectedLocation").val(storeLocation);
				 $("#pluDesc"+locationId+id).focus();
				 return false;
			 }else{
			$("#pluDesc"+locationId+id+"Error").html("");
		  }
			 
//			 quantityInPriceList = quantityInPriceList + parseInt($("#pluQuantity"+locationId+id).val());
			 var price = $("#pluPrice"+locationId+id).val();
			 // validating price there or not with the list
			 /*if ($.inArray(price, priceList) > -1)
			 {
			  alert("This Price already exist");
			  $(".pricelist").each(function(){
				 $(this).css("display","none");
			  });
			  $(this).css("display","block");
			  $(".priceList").css("display","block");
				 $(".priceListLocationDiv").each(function(){
					 $(this).css("display","none");
				});
			  $("."+locationId).css("display","block");
			  $("div ."+locationId+" .priceList").css("display","block");
			  flag = false;
			  if(storeLocation != "")
					 $("#selectedLocation").val(storeLocation);
			  $("#pluPrice"+locationId+id).focus();
			  return false;
			 }
			 else*/
				 priceList.push(price);
			 var obj = {
					 costPrice : $("#pluCostPrice"+locationId+id).val(),
					 price : $("#pluPrice"+locationId+id).val(),
					 salePrice : $("#pluSalePrice"+locationId+id).val(),
					 wholesalePrice : $("#pluWsPrice"+locationId+id).val(),
					 extraPrice : $("#pluExtraPrice"+locationId+id).val(),
					 pluCode : $("#pluCode"+locationId+id).val(),
					 created_date : $("#pluCreatedDate"+locationId+id).val(),
					 updated_date : $("#pluUpdatedDate"+locationId+id).val(),
					 expiry_date : $("#pluExpiryDate"+locationId+id).val(),
					 size : $("#pluSize"+locationId+id).val(),
					 color : $("#pluColor"+locationId+id).val(),
					 colorShade : $("#pluColorShade"+locationId+id).val(),
					 mbq : $("#pluMbq"+locationId+id).val(),
					 quantityInHand : $("#pluQuantity"+locationId+id).val(),
					 acp : $("#pluAcp"+locationId+id).val(),
					 description : $("#pluDesc"+locationId+id).val(),
					 storeLocation : storeLocation,
					 productRange : $("#productRange"+locationId+id).val(),
					 measureRange : $("#measurementRange"+locationId+id).val(),
					 productBatchNo : $("#batchRange"+locationId+id).val(),
					 ean : $("#ean"+locationId+id).val(),
					 materialType : $("#pluMaterialtype"+locationId+id).val(),
					 zeroStockBilling : $("#zeroStockbilling"+locationId+id).val(),
				      sku_status : $("#skuStatus"+locationId+id).val(),

			 };
			 finalObj.warehouseSkuPriceLists.push(obj);
	
			 }
});
	}
	
	
	/*$(".pricelist").each(function(){
			 id = parseInt($(this).attr("id").replace('pricelist',''));
			 if($("#pluCostPrice"+id).val() == ""){
				 $("#pluCostPrice"+id+"Error").html("Enter Cost Price");
				 $(".pricelist").each(function(){
					 $(this).css("display","none");
				 });
				 $(this).css("display","block");
				 $(".priceList").css("display","block");
				 displayCurrentPageNo();
				 flag = false;
				 return false;
			 }
			 if($("#pluPrice"+id).val() == ""){
				 $("#pluPrice"+id+"Error").html("Enter Price");
				 $(".pricelist").each(function(){
					 $(this).css("display","none");
				 });
				 $(this).css("display","block");
				 $(".priceList").css("display","block");
				 displayCurrentPageNo();
				 flag = false;
				 return false;
			 }
			 if($("#pluSalePrice"+id).val() == ""){
				 $("#pluSalePrice"+id+"Error").html("Enter Sale Price");
				 $(".pricelist").each(function(){
					 $(this).css("display","none");
				 });
				 $(this).css("display","block");
				 $(".priceList").css("display","block");
				 displayCurrentPageNo();
				 flag = false;
				 return false;
			 }
			 if(parseFloat($("#pluCostPrice"+id).val()) > parseFloat($("#pluSalePrice"+id).val())){
					$("#pluSalePrice"+id+"Error").html("Sale Price Should be > Cost Price");
					return;
				}
			 if($("#pluWsPrice"+id).val() == ""){
				 $("#pluWsPrice"+id+"Error").html("Enter Whole Sale Price");
				 $(".pricelist").each(function(){
					 $(this).css("display","none");
				 });
				 $(this).css("display","block");
				 $(".priceList").css("display","block");
				 displayCurrentPageNo();
				 flag = false;
				 return false;
			 }
			 if($("#pluQuantity"+id).val() == ""){
				 $("#pluQuantity"+id+"Error").html("Enter Quantity");
				 $(".pricelist").each(function(){
					 $(this).css("display","none");
				 });
				 $(this).css("display","block");
				 $(".priceList").css("display","block");
				 displayCurrentPageNo();
				 flag = false;
				 return false;
			 }
			 if($("#pluExpiryDate"+id).val() != ""){
				 var re = /^[0-9/]+$/;
				 if(!re.test($("#pluExpiryDate"+id).val())){
						$("#pluExpiryDate"+id+"Error").html("Invalid Date");
						$("#pluExpiryDate"+id).focus();
						$(".pricelist").each(function(){
						 $(this).css("display","none");
					    });
						$(this).css("display","block");
						$(".priceList").css("display","block");
						displayCurrentPageNo();
						flag = false;
						return false;
				 }
				 var noOfDays = daydiff(parseDate($('#pluUpdatedDate'+id).val()), parseDate($('#pluExpiryDate'+id).val()));
				 if(noOfDays < 0){
					 $("#pluExpiryDate"+id+"Error").html("Expiry Date can't be less than Today");
					 $(".pricelist").each(function(){
						 $(this).css("display","none");
					    });
						$(this).css("display","block");
						$(".priceList").css("display","block");
						displayCurrentPageNo();
						flag = false;
					 return false;
				 }
			 }
			 if($("#pluDesc"+id).val() == ""){
				 $("#pluDesc"+id+"Error").html("Enter Description");
				 $(".pricelist").each(function(){
					 $(this).css("display","none");
				 });
				 $(this).css("display","block");
				 $(".priceList").css("display","block");
				 displayCurrentPageNo();
				 flag = false;
				 return false;
			 }
			 quantityInPriceList = quantityInPriceList + parseInt($("#pluQuantity"+id).val());
			 var price = $("#pluPrice"+id).val();
			 if ($.inArray(price, priceList) > -1)
			 {
			  alert("This Price already exist");
			  $(".pricelist").each(function(){
				 $(this).css("display","none");
			  });
			  $(this).css("display","block");
			  $(".priceList").css("display","block");
			  $("#pluPrice"+id).focus();
			  flag = false;
			  return false;
			 }
			 else
				 priceList.push(price);
			 var storeLocation = "";
			 if($("#pluStoreLocation"+id).length > 0)
				 storeLocation = $("#pluStoreLocation"+id).val();
			 var obj = {
					 costPrice : $("#pluCostPrice"+id).val(),
					 price : $("#pluPrice"+id).val(),
					 salePrice : $("#pluSalePrice"+id).val(),
					 wholesalePrice : $("#pluWsPrice"+id).val(),
					 extraPrice : $("#pluExtraPrice"+id).val(),
					 pluCode : $("#pluCode"+id).val(),
					 created_date : $("#pluCreatedDate"+id).val(),
					 updated_date : $("#pluUpdatedDate"+id).val(),
					 expiry_date : $("#pluExpiryDate"+id).val(),
					 size : $("#pluSize"+id).val(),
					 color : $("#pluColor"+id).val(),
					 colorShade : $("#pluColorShade"+id).val(),
					 mbq : $("#pluMbq"+id).val(),
					 quantityInHand : $("#pluQuantity"+id).val(),
					 acp : $("#pluAcp"+id).val(),
					 description : $("#pluDesc"+id).val(),
					 storeLocation : storeLocation
			 };
			 finalObj.skuPriceLists.push(obj);
	});*/
	if(flag == false)
		return;
	/*if(quantityInPriceList != parseInt($("#stock").val())){
		$("#Error").html("Sum of Quantity In Hand in Price List should be equal to Stock");
		return false;
	}*/
//	 var formData = JSON.stringify(finalObj);
//	 console.log(formData);
	 var contextPath = $("#contextPath").val();
   	   if(operation=="new"){
    	 URL = contextPath + "/warehouseMaster/createSku.do";
   	   }
   	   else if(operation=="edit"){
   		 URL = contextPath + "/warehouseMaster/updateSku.do";
   	   }
   	 var formData = JSON.stringify(finalObj);
 	 console.log(formData);
//   	 return;
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
		
			  $('#tab_2_detailedEdit').trigger('click');
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









function searchWarehouseSkuProducts(name,searchCategory,index){
	 //purpose:for checking internet conection
	var online = window.navigator.onLine;
  	if(!online)
  	{
  	alert("check your internet connection,please try agian after some time");
  	return;
  	}
	 var contextPath = $("#contextPath").val();
	// var storeLocation = $("#outletLocation").val();
var location = "";
	//var contextPath = $("#contextPath").val();
	if($("#outletLocation").length > 0)
	location = $("#outletLocation").val();
	
	
	var subcategory = "";
	if($("#outletSubcategory").length > 0)
		subcategory = $("#outletSubcategory").val();
	var brand = "";
	if($("#outletBrandId").length > 0)
		brand = $("#outletBrandId").val();
	var department = "";
	if($("#outletDepartmentId").length > 0)
		department = $("#outletDepartmentId").val();
	var supplierid = "";
	if($("#outletSupplierId").length > 0)
		supplierid = $("#outletSupplierId").val();
	
	 URL = contextPath + "/warehouseMaster/searchWarehouseProducts.do";
	 $.ajax({
			type: "GET",
			url : URL,
			data : {
				searchName : name,
				index : index,
				subcategory : subcategory,
 				brand : brand,
 				department : department,
 				supplierid : supplierid,
				location : location
			},
			beforeSend: function(xhr){                    
	   	   		$("#loading").css("display","block");
	   	   		$("#mainDiv").addClass("disabled");
	   	   	},
			success : function(result) {
				$("#right-side").html(result);
	 				//activeMenu(id);
	 				openMenu("warehousemaster-details","ulWarehouseMasterDetails",0);
		    		openMenu("liMasterDataManagement","ulMasterDataManagement",1);
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

$('#searchwarehouseSKU').on('input',function(e){
	if($(this).val().trim()==""){
		viewWarehouseSkuMaster('warehouseskuMaster','0','');
	}
});











function viewEditWarehouseSKU(skuID,operation){
	 var contextPath = $("#contextPath").val();
	 //purpose:for checking internet conection
		var online = window.navigator.onLine;
	  	if(!online)
	  	{
	  	alert("check your internet connection,please try agian after some time");
	  	return;
	  	}
	 
	//added by manasa 
	 var formData={}
	 var productCategory = "";
	 if($("#outletCategory").length > 0)
		 productCategory = $("#outletCategory").val();
	 formData.storeLocation = $("#outletLocation").val();
	 formData.productCategory = productCategory;
	 formData.subCategory = $("#outletSubcategory").val();
	 formData.brandCode= $("#outletBrandId").val();
	// formData.department = $("#outletDepartmentId").val();
	 formData.supplierName = $("#outletSupplierId").val();
	
	// var formData  = JSON.stringify($('form').serializeObject());
	 var formData = JSON.stringify(formData);
	 
	 URL = contextPath + "/warehouseMaster/editSku.do";
	$.ajax({
	type: "GET",
	url : URL,
	data : {
		skuID : skuID,
     	operation : operation,
     	formData : formData,
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



$("#businessCategoryDetailAllLocation1").on("input",function(e){generateDynamicSkuId();});
$("#categoryName").on("input",function(e){generateDynamicSkuId();});
$("#brandCode").on("input",function(e){generateDynamicSkuId();});
$("#packSize").on("input",function(e){generateDynamicSkuId();});
$("#uomList").on("input",function(e){generateDynamicSkuId();});


// Added by vijay for cherla to support skuid generation
var sku = "";
sku +=  Math.floor(1000 + Math.random() * 9000);
function generateDynamicSkuId()
{
	//debugger;
	try{
		var skuid = "";
		var bussinessCategory = $("#businessCategoryW").val();
		if( bussinessCategory != "")
		{
			skuid += bussinessCategory;
		}
		else
			skuid += "0";
		var productCategory = $("#categoryNameW").val();
		if( productCategory!= "")
		{
			skuid += productCategory.charAt(0).toUpperCase();
		}
		else
			skuid += "0";
		
		skuid += sku;

		var schedule = $("#schedule").val();
		if( schedule!= "")
		{
			skuid += schedule;
		}
		else
			skuid += "0";
		
		var formOfTab = $("#formOfItem").val();
		if( formOfTab!= "")
		{
			skuid += formOfTab;
		}
		else
			skuid += "0";
		
		var dose = $("#dose").val();
		if( dose!= "")
		{
			//skuid += dose;
			skuid += dose;
		}
		else
			skuid += "00";

		var brandName =$("#brandCodeW").val();
		if( brandName != "" && brandName != null)
		{
			skuid += brandName;
		}
		else
			skuid += "0000";
		var flavour = $("#flavour").val();
		
		if( flavour != "" && flavour != null)
		{
			skuid += flavour;
		}
		else
			skuid += "0";
		
		var packSize = $("#packSizeW").val();
		if( packSize != "")
		{

			if(packSize > 1 && packSize <= 8)
				packSize = "D";
			else if (packSize > 8 && packSize <= 12)
				packSize = "V";
			else if (packSize > 12)
				packSize = "I";
			skuid += packSize;
		}
		else
			skuid += "0";
		$("#skuIdW").val(skuid);
	}
	catch(e)
	{

	}
}


function getSerialId(id, noOfDigits)
{	
	URL = contextPath + "/outletMaster/getSerialId.do";
	$.ajax({
		type: "GET",
		url : URL,
		data : { 
			id : id,
			noOfDigits: noOfDigits
			},
		beforeSend: function(xhr){                    

		},
		success : function(result) {

		},
		error : function() {
			alert("something went wrong");
			$("#loading").css("display","none");
			$("#mainDiv").removeClass('disabled');
		}
	});


}


function validateWellnessSkuForm(operation){
	 //purpose:for checking internet conection
	//debugger;
	var online = window.navigator.onLine;
  	if(!online)
  	{
  	alert("check your internet connection,please try agian after some time");
  	return;
  	}
	addSelectedProductAndMeasurementRangeWellness();
	var finalObj = {}, skuPriceLists = [];
	if($("#skuIdW").val().trim() == ""){
		$("#skuIdWError").html("Enter Sku Id");
		focusDiv('skuIdWError');
		return;
	}
	if($("#productNameW").val().trim() == ""){
		$("#productNameWError").html("Enter Product Name");
		focusDiv('productNameWError');
		return;
	}
	if($("#searchSupplierW").val().trim() == ""){
		$("#supplierNameWError").html("Enter Supplier");
		focusDiv('supplierNameWError');
		return;
	}
	if($("#uomListW").val().trim() == ""){
		$("#uomListWError").html("Enter UOM");
		focusDiv('uomListWError');
		return;
	}
	
	if($("#minSaleQtyW").val().trim() == ""){
		$("#minSaleQtyWError").html("Enter Minimum Sales Quantity");
		focusDiv('minSaleQtyWError');
		return;
	}
	

	

	

	/*if($("#searchItems").val().trim() == ""){
	  $("#productNameError").html("Enter Product Name");
	  $("#searchItems").focus();
	  return;
	}*/
	/*if($("#productId").val() == ""){
	  $("#productNameError").html("Product Name doesn't exist");
	  $("#searchItems").focus();
	  return;
	}*/

	var searchName = "";
		if($("#SkuMasterW").length > 0 )
			searchName = $("#SkuMasterW").val().trim();
		var location = "";
	if($("#outletLocationW").length > 0)
		location = $("#outletLocationW").val();
	var productCategory = "";
	if($("#outletCategoryW").length > 0)
		productCategory = $("#outletCategoryW").val();
	var subcategory = "";
	if($("#outletSubcategoryW").length > 0)
		subcategory = $("#outletSubcategoryW").val();
	var brand = "";
	if($("#outletBrandIdW").length > 0)
		brand = $("#outletBrandIdW").val();
	var department = "";
	if($("#outletDepartmentIdW").length > 0)
		department = $("#outletDepartmentIdW").val();
	var supplierid = "";
	if($("#searchSupplierW").length > 0)
		supplierid = $("#searchSupplierW").val();
	
	if($("#LocationW").val() == null){
		$("#locationErrorW").html("Select Atleast one Location");
		focusDiv('locationErrorW');
		return;
	}
	if($("#shortDescriptionW").val().trim() == ""){
		$("#shortDescriptionWError").html("Enter Description");
		focusDiv('shortDescriptionWError');
		return;
	}
	finalObj.skuId = $("#skuIdW").val();
	finalObj.productId = $("#skuIdW").val();
	//finalObj.categoryName = $("#categoryName").val();
	finalObj.productCategory = $("#categoryNameW").val();
	finalObj.categoryId= $("#categoryIdW").val();
	//finalObj.subCategoryName = $("#subCategoryName").val();
	finalObj.subCategory = $("#subCategoryNameW").val();
	finalObj.productName = $("#searchItemsW").val();
	finalObj.supplierName = $("#supplier_IdW").val();
	finalObj.supplier = $("#searchSupplierW").val();
	finalObj.ean = $("#eanW").val();
	finalObj.manufacturedItem = $("#manufactureItemW").val();
	finalObj.packed = $("#packagedItemW").val();
	finalObj.brandCode = $("#brandCodeW").val();
	finalObj.status = $("#statusW").val();
	//debugger
	finalObj.manufacturerCode = $("#manufacturerCodeW").val();
	finalObj.make = $("#manufacturerW").val();
	finalObj.uom = document.getElementById("uomListW").value;
//		$("#uom").val();
	finalObj.quantity = $("#stockW").val();
	finalObj.uomLabel = $("#uomLabelW").val();
	finalObj.packSize = $("#packSizeW").val();
	finalObj.jitStock = $("#jitStockW").val();
	finalObj.zeroStock = $("#zeroStockW").val();
	finalObj.itemTaxExclusive = $("#itemTaxExclusiveW").val();
	finalObj.minSaleQty = $("#minSaleQtyW").val();
	finalObj.color = $("#colorW").val();
	finalObj.patternCode = $("#patternCodeW").val();
	finalObj.reorderPoint = $("#reorderPointW").val();
	finalObj.orderQuantity = $("#orderQuantityW").val();
	finalObj.leadTimeDays = $("#leadTimeW").val();
    finalObj.editable = $("#editableW").val();
	finalObj.primaryDepartment = $("#primaryDepartmentW").val();
	finalObj.secondaryDepartment = $("#secondaryDepartmentW").val();
	finalObj.maxStock = $("#maxStockW").val();
	if($("#stockW").val() == null || $("#stockW").val() =="")
		finalObj.stock = 0;
	else
		finalObj.stock = $("#stockW").val();
	finalObj.section = $("#sectionW").val();
	finalObj.taxCode = $("#taxCodeW").val();
	finalObj.trackingRequired = $("#itemTrackRequiredW").val();
	finalObj.created_date = $("#createdDateW").val();
	
	finalObj.costPriceEditable = true;
	
	 finalObj.product_side_effects = $("#productSideEffectsW").val();
     finalObj.product_precautions = $("#productPrecautionsW").val();
     finalObj.product_handing = $("#productHandingDetailW").val();
     finalObj.product_usage = $("#productUsageDetailW").val();
     finalObj.product_consumption_interaction = $("#productIntakeDetailW").val();
     finalObj.uom1 = $("#uom1DetailW").val();
     finalObj.uom2 = $("#uom2DetailW").val();
     finalObj.is_combo = $("#comboDetailW").val();
     

	
	/*var searchName = "";
	if($("#searchName").length > 0 )
		searchName = $("#searchName").val().trim();
	finalObj.searchCriteria = searchName;
	*/
	
	if($("#frTaxCodeW").val() == "")
		finalObj.frTaxCode = 0;
	else
		finalObj.frTaxCode = $("#frTaxCodeW").val();
	finalObj.markUp = $("#markUpW").val();
	finalObj.markDown = $("#markDownW").val();
	finalObj.hsnCode = $("#hsnCodeW").val();
	finalObj.runningPluNumber = $("#runningPluW").val();
	finalObj.model = $("#modelW").val();
	finalObj.openRate = $("#openRateW").val();
	finalObj.lastCost = $("#lastCostW").val();
	finalObj.avgCost = $("#averageCostW").val();
	finalObj.minimumPrice = $("#minPriceW").val();
	finalObj.created_date = $("#createdDateW").val();
	finalObj.updated_date = $("#lastUpdatedW").val();
	finalObj.strPicture1 = $("#picture1_refIdW").val();
	finalObj.picture1 = $("#picture1_nameW").val();
//	finalObj.styleRange = $("#styleRangeDropDown").val();
	
	if($("#picture1_thumbnailW").length > 0)
		finalObj.picture1flag = "true";
	else
		finalObj.picture1flag = "false";
	finalObj.strPicture2 = $("#picture2_refIdW").val();
	finalObj.picture2 = $("#picture2_nameW").val();
	if($("#picture2_thumbnailW").length > 0)
		finalObj.picture2flag = "true";
	else
		finalObj.picture2flag = "false";
	finalObj.strPicture3 = $("#picture3_refIdW").val();
	finalObj.picture3 = $("#picture3_nameW").val();
	if($("#picture3_thumbnailW").length > 0)
		finalObj.picture3flag = "true";
	else
		finalObj.picture3flag = "false";
	finalObj.nonTaxable = $("#nonTaxableW").prop("checked");
	finalObj.discountable = $("#discountableW").prop("checked");
	finalObj.allowDecimals = $("#allowDecimalsW").prop("checked");
	if($("input:radio[name='priceListTypeW']:checked").val() == "all")
		finalObj.storeLocation = "ALL";
	else
		finalObj.storeLocation = "";
	finalObj.description = $("#shortDescriptionW").val();
	finalObj.warantyDetails = $("#warrantyDetailsW").val();
	finalObj.productCategory = $("#categoryNameW").val();
	finalObj.subCategory = $("#subCategoryNameW").val();
	finalObj.skuPriceLists = skuPriceLists;
//	var quantityInPriceList = 0;
	var flag = true; 
	
	var locationIdArray = [];
	if($("input:radio[name='priceListTypeW']:checked").val() == "all"){
		locationIdArray.push("WAllLocation");
	}else{
		$("#selectedLocationW option").each(function(){
			var location = $(this).val();
			location = location.replace(/ /g,'_');
			locationIdArray.push(location);
		});
	}
	
	for(var i = 0; i < locationIdArray.length ; i++){
		var priceList = [];
		var locationId = locationIdArray[i];
		 var storeLocation = "";
		 if(locationId != "WAllLocation"){
			 storeLocation = locationId.replace(/_/g,' ');
		 }
		$("div ."+locationId+" .pricelistW").each(function(){
			debugger;
			 id = parseInt($(this).attr("id").replace('pricelist'+locationId,''));
			 
			 if(locationId == "AllLocation" && $("#pluCostPrice"+locationId+id).val() == "" && $("#pluPrice"+locationId+id).val() == ""){
				 
			 }else{
			 debugger;
			 if($("#pluCostPrice"+locationId+id).val() == ""){
				 $("#pluCostPrice"+locationId+id+"Error").html("Enter Cost Price");
				 $(".pricelistW").each(function(){
					 $(this).css("display","none");
				 });
				 $(this).css("display","block");
				 $(".priceListW").css("display","block");
				 $(".priceListWLocationDiv").each(function(){
					 $(this).css("display","none");
				});
				 $("."+locationId).css("display","block");
				 $("div ."+locationId+" .priceListW").css("display","block");
				 displayCurrentPageNo();
				 flag = false;
//				 alert("pluCostPrice"+locationId+id+"Error");
				 if(storeLocation != "")
					 $("#selectedLocationW").val(storeLocation);
				 $("#pluCostPrice"+locationId+id).focus();
				 return false;
			 }
			 if($("#pluPrice"+locationId+id).val() == ""){
				 $("#pluPrice"+locationId+id+"Error").html("Enter Price");
				 $(".pricelistW").each(function(){
					 $(this).css("display","none");
				 });
				 $(this).css("display","block");
				 $(".priceListW").css("display","block");
				 $(".priceListWLocationDiv").each(function(){
					 $(this).css("display","none");
				});
				 $("."+locationId).css("display","block");
				 $("div ."+locationId+" .priceListW").css("display","block");
				 displayCurrentWellnessPageNo();
				 flag = false;
				 if(storeLocation != "")
					 $("#selectedLocationW").val(storeLocation);
				 $("#pluPrice"+locationId+id).focus();
				 return false;
			 }
			 if($("#pluSalePrice"+locationId+id).val() == ""){
				 $("#pluSalePrice"+locationId+id+"Error").html("Enter Sale Price");
				 $(".pricelistW").each(function(){
					 $(this).css("display","none");
				 });
				 $(this).css("display","block");
				 $(".priceListW").css("display","block");
				 $(".priceListWLocationDiv").each(function(){
					 $(this).css("display","none");
				});
				 $("."+locationId).css("display","block");
				 $("div ."+locationId+" .priceListW").css("display","block");
				 displayCurrentWellnessPageNo();
				 flag = false;
				 if(storeLocation != "")
					 $("#selectedLocationW").val(storeLocation);
				 $("#pluSalePrice"+locationId+id).focus();
				 return false;
			 }
			 if(parseFloat($("#pluCostPrice"+locationId+id).val()) > parseFloat($("#pluSalePrice"+locationId+id).val())){
				$("#pluSalePrice"+locationId+id+"Error").html("Sale Price Should be > Cost Price");
				 $(".pricelistW").each(function(){
					 $(this).css("display","none");
				 });
				 $(this).css("display","block");
				 $(".priceListW").css("display","block");
				 $(".priceListWLocationDiv").each(function(){
					 $(this).css("display","none");
				});
				 $("."+locationId).css("display","block");
				 $("div ."+locationId+" .priceListW").css("display","block");
				 displayCurrentWellnessPageNo();
				 flag = false;
				 if(storeLocation != "")
					 $("#selectedLocationW").val(storeLocation);
				 $("#pluSalePrice"+locationId+id).focus();
				 return false;
			 }
			 if($("#pluWsPrice"+locationId+id).val() == ""){
				 $("#pluWsPrice"+locationId+id+"Error").html("Enter Whole Sale Price");
				 $(".pricelist").each(function(){
					 $(this).css("display","none");
				 });
				 $(this).css("display","block");
				 $(".priceListW").css("display","block");
				 $(".priceListWLocationDiv").each(function(){
					 $(this).css("display","none");
				});
				 $("."+locationId).css("display","block");
				 $("div ."+locationId+" .priceListW").css("display","block");
				 displayCurrentWellnessPageNo();
				 flag = false;
				 if(storeLocation != "")
					 $("#selectedLocationW").val(storeLocation);
				 $("#pluWsPrice"+locationId+id).focus();
				 return false;
			 }
			 if($("#pluQuantity"+locationId+id).val() == ""){
				 $("#pluQuantity"+locationId+id+"Error").html("Enter Quantity");
				 $(".pricelistW").each(function(){
					 $(this).css("display","none");
				 });
				 $(this).css("display","block");
				 $(".priceListW").css("display","block");
				 $(".priceListWLocationDiv").each(function(){
					 $(this).css("display","none");
				});
				 $("."+locationId).css("display","block");
				 $("div ."+locationId+" .priceListW").css("display","block");
				 displayCurrentWellnessPageNo();
				 flag = false;
				 if(storeLocation != "")
					 $("#selectedLocationW").val(storeLocation);
				 $("#pluQuantity"+locationId+id).focus();
				 return false;
			 }
			 if($("#pluExpiryDate"+locationId+id).val() != ""){
				 var re = /^[0-9/]+$/;
				 if(!re.test($("#pluExpiryDate"+locationId+id).val())){
						$("#pluExpiryDate"+locationId+id+"Error").html("Invalid Date");
						$(".pricelistW").each(function(){
						 $(this).css("display","none");
					    });
						$(this).css("display","block");
						$(".priceListW").css("display","block");
						 $(".priceListWLocationDiv").each(function(){
							 $(this).css("display","none");
						});
						 $("."+locationId).css("display","block");
						$("div ."+locationId+" .priceListW").css("display","block");
						displayCurrentWellnessPageNo();
						flag = false;
						if(storeLocation != "")
							 $("#selectedLocationW").val(storeLocation);
						$("#pluExpiryDate"+locationId+id).focus();
						return false;
				 }
			
			 }
			 if($("#pluDesc"+locationId+id).val() == ""){
				 $("#pluDesc"+locationId+id+"Error").html("Enter Description");
				 $(".pricelistW").each(function(){
					 $(this).css("display","none");
				 });
				 $(this).css("display","block");
				 $(".priceListW").css("display","block");
				 $(".priceListWLocationDiv").each(function(){
					 $(this).css("display","none");
				});
				 $("."+locationId).css("display","block");
				 $("div ."+locationId+" .priceListW").css("display","block");
				 displayCurrentWellnessPageNo();
				 flag = false;
				 if(storeLocation != "")
					 $("#selectedLocationW").val(storeLocation);
				 $("#pluDesc"+locationId+id).focus();
				 return false;
			 }
//			 
			 var price = $("#pluPrice"+locationId+id).val();
		
			
				 priceList.push(price);
//				 //debugger
			 var obj = {
					
					 costPrice : $("#pluCostPrice"+locationId+id).val(),
					 price : $("#pluPrice"+locationId+id).val(),
					 salePrice : $("#pluSalePrice"+locationId+id).val(),
					 wholesalePrice : $("#pluWsPrice"+locationId+id).val(),
					 extraPrice : $("#pluExtraPrice"+locationId+id).val(),
					 pluCode : $("#pluCode"+locationId+id).val(),
					 skuStatus : $("#skuStatus"+locationId+id).val(),
					 created_date : $("#pluCreatedDate"+locationId+id).val(),
					 updated_date : $("#pluUpdatedDate"+locationId+id).val(),
					 expiry_date : $("#pluExpiryDate"+locationId+id).val(),
					// size : $("#pluSize"+locationId+id).val(),
					// color : $("#pluColor"+locationId+id).val(),
					 colorShade : $("#pluColorShade"+locationId+id).val(),
					 mbq : $("#pluMbq"+locationId+id).val(),
					 quantityInHand : $("#pluQuantity"+locationId+id).val(),
					 acp : $("#pluAcp"+locationId+id).val(),
					 description : $("#pluDesc"+locationId+id).val(),
					 storeLocation : storeLocation,
					 productRange : $("#productRange"+locationId+id).val(),
					 measureRange : $("#measurementRange"+locationId+id).val(),
					 utility : $("#utilityRange"+locationId+id).val(),
					 color : $("#colourRange"+locationId+id).val(),
					 size : $("#sizeRange"+locationId+id).val(),
					 productBatchNo : $("#batchRange"+locationId+id).val(),
				     ean : $("#ean"+locationId+id).val(),
				     pack_size : $("#pricePackSize"+locationId+id).val(),
				     min_sale_qty : $("#priceMinSaleQty"+locationId+id).val(),
				     businessCategory :$("#businessCategoryDetail"+locationId+id).val(),
				     businessSubCategory:$("#businessSubcategoryDetail"+locationId+id).val(),
				     technical_specification:$("#technicalSpecDetail"+locationId+id).val(),
				     styleRange : $("#styleRange"+locationId+id).val()
				     //styleRange : $("#styleRangeDropDown").val()
				     
			 };
			 finalObj.skuPriceLists.push(obj);
			 }
			 });
	}
	
	
	if(flag == false)
		return;

	 var contextPath = $("#contextPath").val();
   	   if(operation=="new"){
    	 URL = contextPath + "/outletMaster/createSku.do";
   	   }
   	   else if(operation=="edit"){
   		 URL = contextPath + "/outletMaster/updateSku.do";
   	   }
   	 var formData = JSON.stringify(finalObj);
 	 console.log(formData);
//   	 return;
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
  				
	   			//debugger
//  				if(operation=="edit"){
  				messageStatus= JSON.stringify(result);
				var parsed_json = JSON.parse(messageStatus);
				var code = parsed_json.code;
				
				//alert(parsed_json.code)
				if(code != 0)
					{
						$("#ErrorDetailW").html(parsed_json.error);
						focusDiv('ErrorDetailW');
					}
				else{
					$("#SuccessDetailW").html(parsed_json.success);
					focusDiv('SuccessDetailW');
				}
//  				}
  				/*else{
  				$("#right-side").html(result);
  				$("#outletLocation").val(location);
  				$("#outletCategory").val(productCategory);
  				$("#outletSubcategory").val(subcategory);
  				$("#outletSupplierId").val(supplierid);
  				$("#SkuMaster").val(searchName);
  				$("#outletBrandId").val(brand);
  				$("#outletDepartmentId").val(department);
  				}*/
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

function loadFileAsURL(id,ele) {
	if (ele.files && ele.files[0]) {
		
		var fileToLoad = ele.files[0];
//		 var fsize = fileToLoad.size;
			var name = fileToLoad['name'];
			$("#"+id+"_name").val(name);
	        var reader = new FileReader();
	       reader.readAsDataURL(ele.files[0]);
	        var oMyForm = new FormData();
	        oMyForm.append("file",  ele.files[0]);
	        if($("#"+id+"_refId").val() != "")
	        	oMyForm.append("refId",  $("#"+id+"_refId").val().trim());
	        else
	        	oMyForm.append("refId", "");
	        var contextPath = $("#contextPath").val();
	        var URL = contextPath + "/inventorymanager/addToAttachementList.do";
	        $.ajax({
	//				dataType : 'json',
	        	url : URL,
	        	data : oMyForm,
	        	type : "POST",
	        	enctype : 'multipart/form-data',
	        	processData : false,
	        	contentType : false,
	        	beforeSend : function(xhr) {
	        	},
	        	success : function(result) {
	        		$("#"+id+"_refId").val(result);
	        	},
	        	error : function() {
	        		alert("Internal error, please contact Technolabs support.");
	        	}
	        });
	    
	}
};

function blockspecialchar(element){

	
	//debugger;

	//var regex = /^[A-Za-z0-9 ]+$/
	var regex = /^[0-9 ]+$/

		var x = $(element).val();
	
var isValid = regex.test(x);
if (!isValid) {
    alert("Only Numbers allowed!");
    x=$(element).val("");
}
$(element).val(x.trim());

}

function appendSKUEAN(location,count){
 
debugger;
 var contextPath = $("#contextPath").val();
count =count.substring(0,1);
 var len = parseInt($("#SKUMasterEAN"+location+count+1+" "+"tr").length);
	if (len != 1)
		len = parseInt($("#SKUMasterEAN"+location+count+1+" "+"tr:last").attr("id").replace('dynamicdiv'+location, '')) + 1;
 var row = "<tr id='dynamicdiv"+location+len+"'><td id='tableean"+len+"' style='width:58%'><input class='eantable"+len+"' style='width:100%' id='eantable"+location+len+"'  type='number'/></td>" +
"<td style='width: 35%;' id='action"+location+len+"'><a onclick=appendSKUEAN('"+ location +"','"+len+"');  style='border-bottom: 1px solid blue;color: blue;cursor: pointer;'><font size='2px'>add</font></a>&nbsp&nbsp&nbsp&nbsp<a onclick=deleteSKUEAN('"+ location +"','"+len+"'); id='delete"+count+ len +"' style='border-bottom: 1px solid blue;color: blue;cursor: pointer;' id='delete"+len+"'><font size='2px'>delete</font></a>" +
"</td></tr>";
 $("#SKUMasterEAN"+location+count+1+" "+"tbody").append(row);
 
 
 
}

function deleteSKUEAN(location,count){
//debugger;
var countlen =count.substring(0,1);
var len = parseInt($("#SKUMasterEAN"+location+countlen+1+" "+"tr").length);

	//var id = $(element).attr("id").replace('delete','');

if(len > 2){
	$('#dynamicdiv'+location+count).remove();
}else{
alert("SKU must have atleast one EAN!");
}
}




function validateWarehouseQuickSkuMaster(operation){
	//purpose:for checking internet conection
	var online = window.navigator.onLine;
	if(!online)
	{
		alert("check your internet connection,please try agian after some time");
		return;
	}
	debugger;

	$("#salePriceErrorforWarehouseQuick").html("");
	$("#skuIdWarehouseQuickError").html("");
	$("#uomWarehouseQuickListError").html("");
	$("#hsnCodeWarehouseQuickError").html("");

	
	var finalObj = {};
	finalObj.skuId = $("#skuIdWarehouseQuick").val().trim();
	finalObj.productCategory = $("#categoryNameQuick").val();
	finalObj.category = $("#categoryNameQuick").val();
	finalObj.business_category = $("#categoryNameQuick").val();
	
	finalObj.productId = $("#skuIdWarehouseQuick").val();
	finalObj.subCategoryName = $("#subCategoryNameQuick").val();
	finalObj.subCategory = $("#subCategoryNameQuick").val();
	finalObj.business_sub_category=$("#subCategoryNameQuick").val();
	finalObj.description = $("#searchItemsQuick").val().trim();
	finalObj.ean = $("#eanWarehouseQuick").val().trim();
	finalObj.uom = document.getElementById("uomWarehouseQuickList").value;
	finalObj.taxCode = $("#taxCodeWarehouseQuick").val();
	finalObj.uomLabel = $("#uomLabelWarehouseQuick").val().trim();
	finalObj.packSize = $("#packSizeWarehouseQuick").val().trim();
	finalObj.hsnCode = $("#hsnCodeWarehouseQuick").val().trim();
	finalObj.model = $("#modelWarehouseQuick").val().trim();
	//finalObj.color = $("#color").val();
	finalObj.productClass = $("#classNameWarehouseQuick").val();
	finalObj.productSubClass = $("#subclassNameWarehouseQuick").val();
	finalObj.storeLocation = "ALL";
	finalObj.retailUnits = "1";
	
	finalObj.costPrice = $("#costPriceWarehouseQuick").val();
	finalObj.price = $("#mrpWarehouseQuick").val();
	finalObj.salePrice = $("#salePriceWarehouseQuick").val();
	finalObj.zeroStock = $("#zeroStock").val();
	finalObj.status = $("#status").val();
	finalObj.section = $("#sectionWarehouseQuick").val().trim();
	finalObj.primaryDepartment = $("#primaryDepartmentQuick").val();
	finalObj.secondaryDepartment = $("#secondaryDepartmentQuick").val();

	if($("#skuIdWarehouseQuick").val().trim() == ""){
		$("#skuIdWarehouseQuickError").html("Enter Sku Id");
		focusDiv('skuIdWarehouseQuick');
		return;
	}else if(parseInt($("#skuIdWarehouseQuick").val().length)>20){
		 $("#skuIdWarehouseQuick").focus();
		 $("#skuIdWarehouseQuickError").html("SKU Id Length should be within 20 character");
		 return;
	}

	if(parseInt($("#searchItemsQuick").val().length)>100){
		 $("#searchItemsQuick").focus();
		 $("#productNameError").html("Product Name can't exceeds 100 characters.");
		 return;
	}else{
		 $("#productNameError").html(" ");
	}
	
	if(parseInt($("#eanWarehouseQuick").val().length)>25){
		 $("#eanWarehouseQuick").focus();
		 $("#eanError").html("EAN can't exceeds 25 characters.");
		 return;
	}else {
		 $("#eanError").html(" ");
	}
	
	if(parseInt($("#modelWarehouseQuick").val().length)>100){
		 $("#modelWarehouseQuick").focus();
		 $("#modelError").html("Model can't exceeds 100 characters.");
		 return;
	}else {
		 $("#modelError").html(" ");
	}
	if($("#hsnCodeWarehouseQuick").val().trim() == ""){
		$("#hsnCodeWarehouseQuickError").html("Enter HSN Code");
		focusDiv('hsnCodeWarehouseQuick');
		return;
	}
	if(parseInt($("#hsnCodeWarehouseQuick").val().length)>50){
		 $("#hsnCodeWarehouseQuick").focus();
		 $("#hsnCodeWarehouseQuickError").html("HSN Code can't exceeds 50 characters.");
		 return;
	}else {
		 $("#hsnCodeWarehouseQuickError").html(" ");
	}
	
	if($("#uomWarehouseQuickList").val().trim() == ""){
		$("#uomWarehouseQuickListError").html("Enter UOM");
		focusDiv('uomWarehouseQuickList');
		return;
	}
	
	if(parseInt($("#uomLabelWarehouseQuick").val().length)>50){
		 $("#uomLabelWarehouseQuick").focus();
		 $("#weightError").html("UOM Label can't exceeds 50 characters.");
		 return;
	}else{
		 $("#weightError").html(" ");
	}
	
	if(parseInt($("#packSizeWarehouseQuick").val().length)>11){
		 $("#packSizeWarehouseQuick").focus();
		 $("#packSizeError").html("Pack Size can't exceeds 11 Digits.");
		 return;
	}else{
		 $("#packSizeError").html(" ");
	}
	
	if(parseInt($("#sectionWarehouseQuick").val().length)>60){
		 $("#sectionWarehouseQuick").focus();
		 $("#sectionWarehouseQuickError").html("Section can't exceeds 60 Characters");
		 return;
	}else{
		 $("#sectionWarehouseQuickError").html(" ");
	}
	
	
	if($("#costPriceWarehouseQuick").val().trim() == ""){
		$("#costPriceErrorforWarehouseQuick").html("Enter Cost Price");
		focusDiv('costPriceWarehouseQuick');
		return;
	}else{
		$("#costPriceErrorforWarehouseQuick").html("");
	}
	
	
	if($("#mrpWarehouseQuick").val().trim() == ""){
		$("#mrpPriceErrorforWarehouseQuick").html("Enter Mrp ");
		focusDiv('mrpWarehouseQuick');
		return;
	}
	else{
	$("#mrpPriceErrorforWarehouseQuick").html("");
	}
	
	if($("#salePriceWarehouseQuick").val().trim() == ""){
		$("#salePriceErrorforWarehouseQuick").html("Enter Sale Price");
		focusDiv('salePriceWarehouseQuick');
		return;
	}
	else{
	$("#salePriceErrorforWarehouseQuick").html("");
	}
	
	if(parseInt($("#productHandingWarehouseQuick").val().length)>250){
		$("#productHandingWarehouseQuick").focus();
		$("#productHandleingWarehouseQuickError").html("Product Handling can't exceeds 250 Characters");
		return;
	}else {
	       $("#productHandleingWarehouseQuickError").html("");
    }
	
	 if(parseInt($("#productUsageWarehouseQuick").val().length)>250){
		$("#productUsageWarehouseQuick").focus();
		$("#productUsageWarehouseQuickError").html("Product Usage can't exceeds 250 Characters");
		return;
	}else {
	       $("#productUsageWarehouseQuickError").html("");
    }
	
	if(parseInt($("#productIntakeDetailforWarehouseQuick").val().length)>50){
		$("#productIntakeDetailforWarehouseQuick").focus();
		$("#productIntakeWarehouseQuickError").html("Product Intake can't exceeds 50 Characters");
		return;
	}else{
	$("#productIntakeWarehouseQuickError").html("");
  }
	
	if(parseInt($("#uom1WarehouseQuick").val().length)>20){
		$("#uom1WarehouseQuick").focus();
		$("#uom1WarehouseQuickError").html("UOM1 can't exceeds 20 Characters");
		return;
	}else{
	$("#uom1WarehouseQuickError").html("");
  }
	
	if(parseInt($("#uom2WarehouseQuick").val().length)>20){
		$("#uom2WarehouseQuick").focus();
		$("#uom2WarehouseQuickError").html("UOM2 can't exceeds 20 Characters");
		return;
	 }else {
	       $("#uom2WarehouseQuickError").html("");
   }
	
	if(parseInt($("#shortDescriptionWarehouseQuick").val().length)>250){
		$("#shortDescriptionWarehouseQuick").focus();
		$("#shortDescriptionQuickError").html("Detailed Description can't exceeds 250 Characters");
		return;
	}else{
	       $("#shortDescriptionQuickError").html("");
  }
	
	if(parseInt($("#productPrecautionsWarehouseQuick").val().length)>250){
		$("#productPrecautionsWarehouseQuick").focus();
		$("#productPrecautionsWarehouseQuickError").html("Product Precaution can't exceeds 250 Characters");
		return;
	}else{
	       $("#productPrecautionsWarehouseQuickError").html("");
  }
	
	if(parseInt($("#productSideEffectsWarehouseQuick").val().length)>250){
		$("#productSideEffectsWarehouseQuick").focus();
		$("#productSideEffectsError").html("Product Side Effects can't exceeds 250 Characters");
		return;
	}else{
	       $("#productSideEffectsError").html("");
  }
	
	
	if($("#packSizeWarehouseQuick").val().trim()=="")
		finalObj.packSize=1;

	var dateTime = getCurrentDate();
	var date = dateTime.split(' ');
	date = date[0].split('/');
	var formatedDate = date[1]+"/"+date[0]+"/"+date[2];

	//beolw are default values for additional values
	finalObj.quantity = 0.0;
	finalObj.editable = true;
	finalObj.reorderPoint = 0.0;
	finalObj.itemTaxExclusive = false;
	finalObj.trackingRequired = false;
	///finalObj.toCreatWHSku = $("#toCreatWHSkuQuick").val();
	finalObj.jitStock = true;
	finalObj.orderQuantity = 0.0;
	finalObj.leadTimeDays = 0;
	finalObj.manufacturedItem = true;
	finalObj.packed = true;
	finalObj.frTaxCode = 0;
	finalObj.markUp = 0;
	finalObj.markDown = 0;
	
	finalObj.picture_icon="true";
	finalObj.picture1flag ="true";
	finalObj.picture2flag ="true";
	finalObj.picture3flag ="true";
	finalObj.stock = 0.0;

	finalObj.nonTaxable = true;
	finalObj.discountable = false;
	finalObj.allowDecimals = false;
	//finalObj.costPriceEditable = true;

	var updatedDate=""
	var createdDate = ""
		if(operation=="edit"){
			updatedDate = $("#updatedDateStrQuick").val();
			createdDate = $("#createdDateStrQuick").val();
		} else{
			updatedDate =   formatedDate;
			createdDate =   formatedDate;
		}
	finalObj.updated_date =  updatedDate;
	finalObj.created_date =  createdDate;

	finalObj.minSaleQty = $("#minSaleQtyForWarehouseQuick").val().trim();
	finalObj.product_side_effect = $("#productSideEffectsWarehouseQuick").val().trim();
	finalObj.product_precaution = $("#productPrecautionsWarehouseQuick").val().trim();
	finalObj.productHandlng = $("#productHandingWarehouseQuick").val().trim();
	finalObj.product_usage = $("#productUsageWarehouseQuick").val().trim();
	finalObj.product_consumption_interaction = $("#productIntakeDetailforWarehouseQuick").val();
	finalObj.uom1 = $("#uom1WarehouseQuick").val().trim();
	finalObj.uom2 = $("#uom2WarehouseQuick").val().trim();
	finalObj.is_combo = $("#comboWarehouseQuick").val();
	finalObj.description = $("#shortDescriptionWarehouseQuick").val().trim();
	finalObj.technical_specification = $("#technicalSpecWarehouseQuick").val().trim();
	finalObj.description = $("#searchItemsQuick").val();
	finalObj.productUrl=$("#skuDescription_name").val();
	
	
	if(operation=="edit"){
		finalObj.supplierName = $("#supplierNameQuick").val();
		finalObj.brandCode = $("#brandQuick").val();
		finalObj.manufacturerCode = $("#manufactureCodeQuick").val();
		finalObj.jitStock = $("#jitStockQuick").val();
		finalObj.minSaleQty = $("#minSaleQtyQuick").val();
		finalObj.manufacturedItem = $("#manufactureItemQuick").val();
		finalObj.packed = $("#packagedItemQuick").val();
		finalObj.editable = $("#editableQuick").val();
		finalObj.patternCode = $("#patternCodeQuick").val();
		finalObj.reorderPoint = $("#reorderPointQuick").val();
		
		finalObj.orderQuantity = $("#orderQuantityQuick").val();
		finalObj.leadTimeDays = $("#leadTimeQuick").val();
		finalObj.maxStock = $("#maxStockQuick").val();
		finalObj.stock = $("#stockQuick").val();
		finalObj.frTaxCode = $("#frTaxCodeQuick").val();
		finalObj.markUp = $("#markUpQuick").val();
		finalObj.markDown = $("#markDownQuick").val();
		finalObj.runningPluNumber = $("#runningPluQuick").val();
		finalObj.openRate = $("#openRateQuick").val();
		finalObj.lastCost = $("#lastCostQuick").val();
		finalObj.avgCost = $("#averageCostQuick").val();
		finalObj.minimumPrice = $("#minPriceQuick").val();
		finalObj.color = $("#colorQuick").val();
		finalObj.itemTaxExclusive = $("#itemTaxExclusiveQuick").val();
		finalObj.trackingRequired = $("#itemTrackRequiredQuick").val();
		finalObj.alternateSkuId = $("#alternate_skuQuick").val();
		finalObj.seasonCode = $("#season_codeQuick").val();
		finalObj.aliasName = $("#alias_nameQuick").val();
		finalObj.itemType = $("#item_typeQuick").val();
		finalObj.itemDesign = $("#item_designQuick").val();
		finalObj.is_combo = $("#comboWarehouseQuick").val();
		finalObj.productHandlng = $("#productHandingDetailQuick").val();
		finalObj.product_usage = $("#productUsageDetailQuick").val();
		finalObj.product_consumption_interaction = $("#productIntakeDetailQuick").val();
		finalObj.uom1 = $("#uom1DetailQuick").val();
		finalObj.uom2 = $("#uom2DetailQuick").val();
		finalObj.product_precaution = $("#productPrecautionsQuick").val();
		finalObj.product_side_effect = $("#productSideEffectsQuick").val();
		finalObj.warantyDetails = $("#warrantyDetailsQuick").val();
		finalObj.costPrice = $("#costPriceWarehouseQuick").val().trim();
		finalObj.wholesalePrice = $("#salePriceWarehouseQuick").val();
		finalObj.price = $("#mrpWarehouseQuick").val().trim();
		finalObj.salePrice = $("#salePriceWarehouseQuick").val().trim();
		finalObj.ean = $("#eanWarehouseQuick").val();
		finalObj.technical_specification = $("#technicalSpecWarehouseQuick").val().trim();
		finalObj.productSubClass = $("#subclassNameWarehouseQuick").val();

	}
	
	
	var warehouseSkuPriceLists=[];
	
	debugger;
			 var obj = {
					 skuId : $("#skuIdWarehouseQuick").val(),
					 costPrice : $("#costPriceWarehouseQuick").val(),
					 price : $("#mrpWarehouseQuick").val(),
					 salePrice : $("#salePriceWarehouseQuick").val(),
					 wholesalePrice : $("#salePriceWarehouseQuick").val(),
					 description: $("#searchItemsQuick").val(),
					 pluCode : $("#pluCodeWarehouseQuick").val(),
					 created_date : formatedDate,
					 updated_date : formatedDate,
					 ean : $("#eanWarehouseQuick").val(),
					 business_category : $("#categoryNameQuick").val(),
					 business_sub_category : $("#subCategoryNameQuick").val(),
					 technical_specification : $("#technicalSpecWarehouseQuick").val(),
					 quantityInHand : 0.0,
					 storeLocation : $("#storeLocationWarehouseQuick").val(),
					 editable : true,
					 confirmPromptPrice : $("#confirmPromptPriceWarehouseQuick").val(),
					 productBatchNo : $("#batchnoWarehouseQuick").val(),
					 color : $("#colorQuick").val(),
					 measureRange : $("#measureRangeWarehouseQuick").val(),
					 zeroStockBilling : $("#zeroStockBillingWarehouseQuick").val(),
			         sku_status : true,
			 };
			 warehouseSkuPriceLists.push(obj);
			 
			 
	finalObj.warehouseSkuPriceLists = warehouseSkuPriceLists;
	
	
	var contextPath = $("#contextPath").val();
	   if(operation=="new"){
 	 URL = contextPath + "/warehouseMaster/createWarehouseQuickSku.do";
	   }
	   else if(operation=="edit"){
		 URL = contextPath + "/warehouseMaster/updateWarehouseQuickSku.do";
	   }
	 var formData = JSON.stringify(finalObj);
	 console.log(formData);

	$.ajax({
		type : "POST",
		url : URL,
		contentType : "application/json",
		data : formData,
		beforeSend: function(xhr){  
			$("#loading").css("display","block");
			$("#mainDiv").addClass("disabled");
		},
		success : function(result) {
			messageStatus = JSON.stringify(result);
			var parsed_json = JSON.parse(messageStatus);
			var code = parsed_json.code;
			debugger;
			////alert(parsed_json.code)
			if(code != 0){
				$("#ErrorWarehouseQuick").html(parsed_json.error);
				$("#SuccessWarehouseQuick").html("");
			}else{
				$("#SuccessWarehouseQuick").html(parsed_json.success);
				$("#ErrorWarehouseQuick").html("");
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


function printBarcodes(id){
       		debugger;
     	    var selected = "";
     	    var selectedStr="";
     	    var statusStr="";
     	    var selectedSkuList=new Array();
     	    var finalObj = {};
      		var selectedLabel = $('#selectlabel').val();
      		var name=$('#deleteActionLabel').val();
      		var atLeastOneIsChecked = $('input[name="selectall"]:checked').length > 0;
      		var selectedLength = $('input[name="selectall"]:checked').length;
      		var selectedID = $("#selectall").length;
      		if(selectedLength == 1 && selectedID == 0)
      			atLeastOneIsChecked = false;
      		var yes = false;
      		if(!atLeastOneIsChecked){
      			alert(selectedLabel+" "+name);
      			return false;
      		  } else {
      			var length = $('input[name="selectall"]:checked');
      		    $(length).each(function(){
      		    	if($(this).attr("onClick") != "selectAll(this)"){
      		    		selectedStr=$(this).val();
      		    	    selectedArr=(selectedStr.split("$"));	
      		    		selected += selectedArr[0]+",";
      		          }
      			});
      			selected = selected.slice(0,-1);// Remove last comma
      		  }
      			var contextPath = $("#contextPath").val();
      				var skuIdsArray = [];
      				selected = selected.split(",");
      				selected = selected.filter( function( item, index, inputArray ) {
      		           return inputArray.indexOf(item) == index;
      				});
      				//console.log(selected);
      				for(var i=0;i<selected.length;i++){
      					skuIdsArray.push(selected[i]);
      					var obj = {
		    				skuId : $("#sltdSkuId"+selected[i]).val(),
		    				eanCode : $("#sltdSkuEan"+selected[i]).val(),
		    				pluCode : $("#sltdSkuPlu"+selected[i]).val(),
		    				itemName : $("#sltdSkuDesc"+selected[i]).val(),
		    				mrp : $("#sltdSkuMrp"+selected[i]).val(),
		    				salePrice : $("#sltdSkuSaleprice"+selected[i]).val(),
		    				printCount : $("#"+selected[i]+"no").val()
		    		};
		    		selectedSkuList.push(obj);
      				}
      				finalObj.skuDetails = selectedSkuList;
      				 
      				var formData = JSON.stringify(finalObj);
      				 //console.log(formData);
      				 
         			URL = contextPath + "/inventorymanager/printBarcodesforSkuData.do";	
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
          				debugger
      					if(result != null && result != "" && result.includes("Configurations")){
      	                  var anchor = document.createElement('a');
      	 				  anchor.href = result;
      	 				  anchor.target = '_blank';
      	 				  anchor.download = '';
      	 				  anchor.click();
      		              }else {
      		            	$("#Errorid").html(result);
      		              }
          				
          	 			$("#loading").css("display","none");
          	 			$("#mainDiv").removeClass('disabled')
          	 			},
          	 			
          			error : function(jqXHR, textStatus, errorThrown)  {
          				 errorCode(jqXHR.status);
          				$("#loading").css("display","none");
          				$("#mainDiv").removeClass('disabled');
          			}
             		});
         				
       }

