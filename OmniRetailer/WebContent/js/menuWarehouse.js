$(document).ready(function() {
	$("#menuNameError").html("");
	$("#menu_name").keydown(function() {
		$("#menuNameError").html("");
		$("#Error").html("");
	});
});

function getMenuCategories() {
	$("#viewEditMenuItems").attr("onclick","getMenuItems();");
	var outlet_name = null;
	if ($('#outletname').length)
		outlet_name = $('#outletname').val();
	var contextPath = $("#contextPath").val();
	URL = contextPath + "/warehouseMaster/getMenuCategories.do";
	$.ajax({
		type : "GET",
		url : URL,
		data : {
			outlet_name : outlet_name
		},
		beforeSend: function(xhr){                    
  				$("#loading").css("display","block");
  				$("#mainDiv").addClass("disabled");
        },

		success : function(result) {
			$("#tab_2").html("");
			$("#tab_1").html(result);
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

function getMenuNames() {
	var outlet_name = $('#outlet_name').val();
	var contextPath = $("#contextPath").val();
	debugger
	var selectedLocationsList=[];
	$("#outlet_name option:selected").each(function(){
		selectedLocationsList.push($(this).val());
	});
	 var  locationList="";
	   	for(i=0;i<selectedLocationsList.length;i++)
	   		{
	   		locationList =locationList+ selectedLocationsList[i]+',';
	   		}
	
	URL = contextPath + "/warehouseMaster/getMenuNames.do";
	$.ajax({
		type : "GET",
		url : URL,
		data : {
			outlet_name : locationList,
		},
		beforeSend: function(xhr){                    
  				$("#loading").css("display","block");
  				$("#mainDiv").addClass("disabled");
        },

		success : function(result) {
			appendMenuNames(result);
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

function appendMenuNames(menuNamesList) {
	debugger
	$("#menuName").html('');
	var op = '';
	for (var i = 0; i < menuNamesList.length; i++) {
		op += '<option value="' + menuNamesList[i].menu_name
				+ '"  onclick="getMenuCategoryNames();" >'
				+ menuNamesList[i].menu_name + '</option>';
	}
	$("#menuName").html(op);
	$("#menuName").show();
	getMenuCategoryNames();
}

function getMenuCategoryNames() {
//	var outlet_name = $('#outlet_name').val();
	
	
	var selectedLocationsList=[];
	$("#outlet_name option:selected").each(function(){
		selectedLocationsList.push($(this).val());
	});
	 var  locationList="";
	   	for(i=0;i<selectedLocationsList.length;i++)
	   		{
	   		locationList =locationList+ selectedLocationsList[i]+',';
	   		}
	
	
	var menu_name = $("#menuName").val();
	var contextPath = $("#contextPath").val();
	URL = contextPath + "/warehouseMaster/getMenuCategoryNames.do";
	$.ajax({
		type : "GET",
		url : URL,
		data : {
			menu_name : menu_name,
			outlet_name : locationList
		},
		beforeSend: function(xhr){                    
  				$("#loading").css("display","block");
  				$("#mainDiv").addClass("disabled");
        },

		success : function(result) {
			appendMenuCategoryNames(result);
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

function appendMenuCategoryNames(menuCategoryNamesList) {
	$("#category_name").html('');
	var op = '';
	for (var i = 0; i < menuCategoryNamesList.length; i++) {
		op += '<option value="' + menuCategoryNamesList[i] + '">'
				+ menuCategoryNamesList[i] + '</option>';
	}
	$("#category_name").html(op);
	$("#category_name").show();
}

function getMenuItems(test) {

	var outlet_name = null;
	//alert($("#tab_2").html().trim());
	/*if(test == "cancel"){

	}*/
	debugger
	if($("#tab_2").html().trim() == "" || test == "cancel"){
		$("#viewEditMenuItems").attr("onclick","getMenuItems();");
		if ($('#outletname').length)
			outlet_name = $('#outletname').val();


		var contextPath = $("#contextPath").val();
		URL = contextPath + "/warehouseMaster/getMenuItems.do";
		$.ajax({
			type : "GET",
			url : URL,
			data : {
				outlet_name : outlet_name
			},
			beforeSend: function(xhr){                    
				$("#loading").css("display","block");
				$("#mainDiv").addClass("disabled");
			},

			success : function(result) {
				$("#tab_1").html("");
				$("#tab_2").html(result);
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

function newMenuCategory() {
	var outlet_name = $("#outletname").val();
	var contextPath = $("#contextPath").val();
	URL = contextPath + "/warehouseMaster/newMenuCategory.do";
	$.ajax({
		type : "GET",
		url : URL,
		data : {
			outlet_name : outlet_name
		},
		beforeSend: function(xhr){                    
  				$("#loading").css("display","block");
  				$("#mainDiv").addClass("disabled");
        },

		success : function(result) {
			$("#tab_1").html(result);
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

function newMenuItems() {
	var outlet_name = $("#outletname").val();
	var contextPath = $("#contextPath").val();
	URL = contextPath + "/warehouseMaster/newMenuItems.do";
	$.ajax({
		type : "GET",
		url : URL,
		data : {
			outlet_name : outlet_name
		},
		beforeSend: function(xhr){                    
  				$("#loading").css("display","block");
  				$("#mainDiv").addClass("disabled");
        },

		success : function(result) {
			$("#tab_2").html(result);
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

function viewEditMenuCategory(menu_name) {
	$("#viewEditMenuItems").attr("onclick","viewEditMenuItems('"+menu_name+"');");
	var outlet_name = $('#outletname').val();
	var contextPath = $("#contextPath").val();
	URL = contextPath + "/warehouseMaster/editMenuCategory.do";
	$.ajax({
		type : "GET",
		url : URL,
		data : {
			menu_name : menu_name,
			outlet_name : outlet_name
		},
		beforeSend: function(xhr){                    
  				$("#loading").css("display","block");
  				$("#mainDiv").addClass("disabled");
        },

		success : function(result) {
			$("#tab_1").html(result);
			 $("#loading").css("display","none");
			   $("#mainDiv").removeClass('disabled');
			  // viewEditMenuItems(menu_name);
		},
		error : function() {
			alert("something went wrong");
			 $("#loading").css("display","none");
			   $("#mainDiv").removeClass('disabled');
		}
	});

}
function viewMenuItems(menu_name) {
	var outlet_name = $('#outletname').val();
	var contextPath = $("#contextPath").val();
	
	
	//alert(menu_name+" "+outlet_name+" ");
	URL = contextPath + "/warehouseMaster/viewMenuItems.do";
	$.ajax({
		type : "GET",
		url : URL,
		data : {
			menu_name : menu_name,
			outlet_name : outlet_name
		},
		beforeSend: function(xhr){                    
  				$("#loading").css("display","block");
  				$("#mainDiv").addClass("disabled");
        },

		success : function(result) {
			$("#tab_1").html("");
			$("#tab_2").html(result);
			//$("#tab_1").html("");
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

function viewEditMenuItems(menu_name) {
	var outlet_name = $('#outletname').val();
	/*if(outlet_name == undefined || outlet_name == ""){
		outlet_name = outletname;
	}*/
	var contextPath = $("#contextPath").val();
	URL = contextPath + "/warehouseMaster/editMenuItems.do";
	$.ajax({
		type : "GET",
		url : URL,
		data : {
			menu_name : menu_name,
			outlet_name : outlet_name
		},
		beforeSend: function(xhr){                    
  				$("#loading").css("display","block");
  				$("#mainDiv").addClass("disabled");
        },

		success : function(result) {
			$("#tab_1").html("");
			$("#tab_2").html(result);
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

function viewMenuCategory(menu_name) {
	$("#viewEditMenuItems").attr("onclick","viewMenuItems('"+menu_name+"');");
	var outlet_name = $('#outletname').val();
	var contextPath = $("#contextPath").val();
	
	URL = contextPath + "/warehouseMaster/viewMenuCategory.do";
	$.ajax({
		type : "GET",
		url : URL,
		data : {
			menu_name : menu_name,
			outlet_name : outlet_name
		},
		beforeSend: function(xhr){                    
  				$("#loading").css("display","block");
  				$("#mainDiv").addClass("disabled");
        },

		success : function(result) {
			$("#tab_1").html(result);
			//$("#tab_2").html("");
			 $("#loading").css("display","none");
			   $("#mainDiv").removeClass('disabled');
			//   viewMenuItems(menu_name);
		},
		error : function() {
			alert("something went wrong");
			 $("#loading").css("display","none");
			   $("#mainDiv").removeClass('disabled');
		}
	});
//	
}

function addCategory() {
	var category_icon = "category_icon";
	var contextPath = $("#contextPath").val();
	var len = parseInt($("#categoriesList tr").length);
	if (len != 1)
		len = parseInt($("#categoriesList tr:last").attr("id").replace(
				'dynamicdiv', '')) + 1;
	//////
	var slNo = 1; 
	 $('.slno').each(function(){
		$(this).text(slNo);
		slNo = parseInt(slNo) + 1;
	});
	 //////
	var row = "<tr id='dynamicdiv"
			+ len
			+ "' style='margin-top:5px;text-align:center;'><td class='slno' style='width:75px;' "+len+"'>"+slNo+"<td  style='width:248px;'><input type='hidden' id='category_name_hidden"
			+ len
			+ "' value=''><input class='form-control' onblur='textBoxColor(this)' type='text' name='category_name' id='category_name"
			+ len
			+ "' /></td>"
			+ "<td style='width:250px;'><textarea class='form-control' name='category_desc' id='category_desc"
			+ len
			+ "' rows='1' ></textarea></td>"
			+ "<td  style='width:325px;'><div class='row'><div class='form-group col-lg-9'>"
			+
			// "<input id='category_icon"+len+"' type='file'
			// onchange='loadImageFileAsURL('"+len+"','"+category_icon+"')'></div><div
			// id='category_icon_image"+len+"' class='form-group col-lg-3'
			// style='width:65px;height:20px;'></div></div><input type='hidden'
			// id='category_icon_byte"+len+"'></td>" +
			'<input id="category_icon'
			+ len
			+ '" type="file" onchange="loadImageFileAsURL('+ "'"+ 'category_icon1'+ "'"+ ", this"
			+ ')"><span id="category_iconError'+len+'" style="color: red;"></span></div><div id="category_icon1_image'
			+ len
			+ '" class="form-group col-lg-3" style="width:65px;height:20px;"></div></div><input type="hidden" id="category_icon_byte'
			+ len
			+ '"><input type="hidden" id="category_icon1_refId'+len+'"><input type="hidden" id="category_icon1_name'+len+'"></td>'
			+ "<td  style='width:102px;' id='Del"+len+"'><img id='action"
			+ len
			+ "' src='"
			+ contextPath
			+ "/images/itemdelete.png' style='width:24px;height:24px;cursor:pointer;' onclick='deleteItem(this);' title='Delete'/></td></tr>";
	$("#categoriesList tbody").append(row);
	$("#category_name" + len).focus();
}

/*
*/

function deleteItem(element) {
	var id = $(element).attr("id").replace('action', '');
	$('#dynamicdiv' + id).remove();
	var slNo = 1; 
	 $('.slno').each(function(){
		$(this).text(slNo);
		slNo = parseInt(slNo) + 1;
	});

}

var deletedPlus =[];
/*function deleteItem(element) {
	var id = $(element).attr("id").replace('action', '');
	debugger
	var id = $(element).attr("id").replace('Img','');
	
	
	$('#dynamicdiv' + id).remove();
	var slNo = 1; 
	 $('.slno').each(function(){
		$(this).text(slNo);
		slNo = parseInt(slNo) + 1;
	});

}*/
function deleteProduct(element) {
	var id = $(element).attr("id").replace('action', '');
	debugger
/*var ids = $("#menu_item_id"+id).val();
	deletedPlus.push(ids);*/
	
	$('#div' + id).remove();
	var id = $(element).attr("id").replace('action', '');
	$('#dynamicdiv' + id).remove();
	var slNo = 1; 
	 $('.slno').each(function(){
		$(this).text(slNo);
		slNo = parseInt(slNo) + 1;
	});

}

function textBoxColor(element) {
	var id = $(element).attr("id");
	$("#" + id).css("border", "1px solid #ccc");

}

/*function loadImageFileAsURL(id,ele) {
	
	
	
	if (ele.files && ele.files[0]) {
        var reader = new FileReader();


        reader.readAsDataURL(ele.files[0]);
       
        var oMyForm = new FormData();
        oMyForm.append("file",  ele.files[0]);
       
       
        if($("#"+id+"_refId").val() != "")
        	oMyForm.append("refId",  $("#"+id+"_refId").val());
        else
        	oMyForm.append("refId", "");
      
        var contextPath = $("#contextPath").val();
        var URL = contextPath + "/warehouseMaster/addToAttachementList.do";
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
};*/
//function addNameToTextBox(id,ele){
	
function loadImageFileAsURL(id,ele) {
	var eleId= $(ele).attr("id");
	if(eleId.indexOf('category_icon')>=0){
		var num=eleId.split('category_icon');
		var len=num[1];
		}else if(eleId.indexOf('item_icon')>=0){
			var num=eleId.split('item_icon');
			var len=num[1];
		}else if(eleId.indexOf('item_pic1')>=0){
			var num=eleId.split('item_pic1');
			var len=num[1];
		}else if(eleId.indexOf('item_pic2')>=0){
			var num=eleId.split('item_pic2');
			var len=num[1];
		}
	
	if (ele.files && ele.files[0]) {
		
		/*var len = parseInt($("#categoriesList tr").length);
		if (len != 1)
			len = parseInt($("#categoriesList tr:last").attr("id").replace(
					'dynamicdiv', ''));*/
		
		var fileToLoad = ele.files[0];
//		 var fsize = fileToLoad.size;
		if (fileToLoad.type.match("image.*")) {
			var name = fileToLoad['name'];
			$("#"+id+"_name"+len).val(name);
	        var reader = new FileReader();
	
	        reader.onload = function (e) {
	        //	$("#"+id+"_label").css("display","none");
	        	//$("#" + id + "_image1").append('<img class="thumbnail" id="'+id+'_thumbnail" src=' + e.target.result + ' style="width:35px;height:35px;">');
	        	$("#"+id+"_image"+len).html(
						'<img src=' + e.target.result + '>');
	        
	        };
	
	        reader.readAsDataURL(ele.files[0]);
	        var oMyForm = new FormData();
	        oMyForm.append("file",  ele.files[0]);
	        if($("#"+id+"_refId"+len).val() != "")
	        	oMyForm.append("refId",  $("#"+id+"_refId"+len).val().trim());
	        else
	        	oMyForm.append("refId", "");
	        var contextPath = $("#contextPath").val();
	        var URL = contextPath + "/warehouseMaster/addToAttachementList.do";
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
	        		$("#"+id+"_refId"+len).val(result);
	        	},
	        	error : function() {
	        		alert("something went wrong");
	        	}
	        });
	    }
	}
};
	

/*function loadImageFileAsURL(len, id) {
	
	if($("#category_icon1")[0].files[0] != undefined){
		$("#imageName").val($("#category_icon1")[0].files[0]['name']);
		//loadImageFileAsURL(id,ele);
	}
	
	
	$("#"+id+"Error"+len).text("");
	var filesSelected = document.getElementById(id + len).files;
	if (filesSelected.length > 0) {
		var fileToLoad = filesSelected[0];
		 var fsize = fileToLoad.size;
		if (fileToLoad.type.match("image.*")) {
			if(fsize <= 100000){
			var fileReader = new FileReader();
			fileReader.onload = function(fileLoadedEvent) {
				var byteVal = fileLoadedEvent.target.result;
				var index = byteVal.indexOf(',');
				byteVal = byteVal.substring(index + 1);
				
				 * var imageLoaded = document.createElement("img");
				 * imageLoaded.src = fileLoadedEvent.target.result;
				 * alert(imageLoaded); document.body.appendChild(imageLoaded);
				 
				$("#" + id + "_byte" + len).val(byteVal);
				$("#" + id + "_image" + len).html(
						'<img src=' + fileLoadedEvent.target.result + '>');

			};
			fileReader.readAsDataURL(fileToLoad);
			}else{
        		$("#"+id+"Error"+len).text("Select Image < 100kb");
	        	return;
        	}
		}
	}
}*/

function getProductName(name,searchCategory) {
	debugger;
	var contextPath = $("#contextPath").val();
	var storeLocation = $("#outlet_name").val();
	
	var selectedLocationsList = [];
//	if($("#outlet_name").val() == "all")
//	{
		$("#outlet_name option:selected").each(function(){
			selectedLocationsList.push($(this).val());
		});
		 var  locationList="";
		   	for(i=0;i<selectedLocationsList.length;i++)
		   		{
		   		locationList =locationList+ selectedLocationsList[i]+',';
		   		}
		   	console.log(locationList)
     storeLocation = locationList.replace(",","");
	/*if(storeLocation == "all")
		storeLocation=""*/
	URL = contextPath + "/warehouseMaster/searchProductsForMenu.do";
	$.ajax({
		type : "GET",
		url : URL,
		data : {
			searchName : name,
			storeLocation : storeLocation,
			selectedLocationsList : locationList
			
		},
		beforeSend: function(xhr){                    
  				$("#loading").css("display","block");
  				$("#mainDiv").addClass("disabled");
        },

		success : function(result) {
			
			appendProductNames(result,searchCategory);
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


function clearTableData(){
	 $("#itemsList tbody").html('');
	 $("#Error").html("");
	
}

function getId(element,type){
	debugger
	var id= $(element).attr("id");
	description =  $("#"+id).children("a").text();
	description = description.split(' ( ');
	description = description[0];
	$("#desc").val(description);
	if(type == "menuItems")
		getProductDetails(id);
}

function appendProductNames(productsList,searchCategory) {
	/*$("."+searchCategory).html('');
	 var op = '';
	 for(var i=0;i<productsList.length;i++){
		
			 if (i == 0) {
				 op += '<li id="'+productsList[i].productId+'"  class="selected" onclick=getId(this,"'+searchCategory+'"); ><a>'+productsList[i].productName+'</a></li>';
			}else
			     op += '<li id="'+productsList[i].productId+'" onclick=getId(this,"'+searchCategory+'"); ><a>'+productsList[i].productName+'</a></li>';
		 }
	 $("."+searchCategory).html(op);
	 $("."+searchCategory).show();*/
	
	debugger;
	var pro = productsList;
	var p = productsList.length;
	
	 $("."+searchCategory).html('');
	 var op = '';
	 var sessionlogin = true;
	 for(var i=0;(i<productsList.length) && (productsList[i].pluCode != undefined);i++){
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
		 sessionlogin = false;
	 }
	 
	 /*if(sessionlogin)
		 showOutletDashboard("","","","");*/
	 
	 $("."+searchCategory).html(op);
	 $("."+searchCategory).show();
}

function getProductDetails(skuId) {
	//var productId = $('#searchCriteria').val();
	/*var contextPath = $("#contextPath").val();
	URL = contextPath + "/warehouseMaster/getProductDetails.do";
	$.ajax({
		type : "GET",
		url : URL,
		data : {
			productId : productId
		},
		beforeSend: function(xhr){                    
  				$("#loading").css("display","block");
  				$("#mainDiv").addClass("disabled");
        },

		success : function(result) {
			appendProductDetails(result);
			 $("#loading").css("display","none");
			   $("#mainDiv").removeClass('disabled');


		},
		error : function() {
			alert("something went wrong");
			 $("#loading").css("display","none");
			   $("#mainDiv").removeClass('disabled');

		}
	});*/
//	$("#desc").val(description);
	debugger
	var storeLocation = $("#outlet_name").val();
	 var WarehouseReturnflag=$("#whreturnflag").val();
		if(WarehouseReturnflag == "" || WarehouseReturnflag == undefined || WarehouseReturnflag == null){
			WarehouseReturnflag="";
   		}
	 var contextPath = $("#contextPath").val();
//	 var storeLocation = $("#outletLocation").val();
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
	            if(result != "")
 				appendSkuDetails(result);
// 				appendSkuDetails(result);
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
function appendSkuDetails(skuDetails){
	debugger
	 var parsedJson = jQuery.parseJSON(skuDetails);  
	 $("#searchItems").val("");
		skuList = parsedJson.skuLists;
		if(skuList.length >1){
			addItem(skuList[0]);
//			var priceLength = skuList.length;
//			var priceArray = [];
//			$("#itemsList tbody").html("");
//			for(var i=0; i<priceLength; i++){
//				var price = skuList[i].price;
//				if (! $.inArray(price, priceArray) > -1)
//				{
//					priceArray.push(price);
//					var row = '<tr id=price'+i+' style="margin-top:5px;cursor:pointer" onclick=getPrice(this) ><td>'+skuList[i].description+'</td><td>'+price+'</td></tr>';
//					//'<li id="'+productsList[i].skuID+'"  class="selected" onclick=getId(this,"'+searchCategory+'"); ><a>'+productsList[i].description+'   -   '+productsList[i].skuID+'</a></li>';
//					$("#itemsList tbody").append(row);
//				}
//			}
//			var  op = '<a id="selectPrice"  data-toggle="modal" data-target="#items-modal"></a>';
//			 $("#triggerEvent").append(op);
//			 $("#selectPrice" ).trigger( "click" );
//			 $("#triggerEvent").html("");
		}
		else{
			addItem(skuList[0]);
		}
}

function addItem(sku) {
	debugger
	var slNo = 1; 
	 $('.slno').each(function(){
		$(this).text(slNo);
		slNo = parseInt(slNo) + 1;
	});
	
	$("#menuItems").val("");
//	$("#items").html('');
//	var parsedJson = jQuery.parseJSON(product);
	var contextPath = $("#contextPath").val();
	var categoryName = $("#category_name").val();
	var item_icon = "item_icon";
	var item_pic1 = "item_pic1";
	var item_pic2 = "item_pic2";
	var len = parseInt($("#itemsList tr").length);
	if (len != 1)
		len = parseInt($("#itemsList tr:last").attr("id").replace('div', '')) + 1;
	var itemType = "<select class='form-control' style='width: 100px' name='item_type' id='item_type"
			+ len
			+ "'><option value='Normal'>Normal</option><option value='Radiology'>Radiology</option><option value='Specility'>Specility</option><option value='Package'>Package</option></select>";
	var uom = "<select class='form-control' style='width: 100px' name='item_type' id='uom"
			+ len
			/* + "'><option value='pcs'>pcs</option><option value='pack'>pack</option><option value='plate'>plate</option><option value='ml'>ml</option><option value='kg'>kg</option></select>";*/
			+ "'><option value='PAX'>PAX</option><option value='NOS'>NOS</option><option value='GLASS'>GLASS</option><option value='PEG'>PEG</option><option value='BOTTLE'>BOTTLE</option>" +
			"<option value='ML'>ML</option><option value='BTL ML'>BTL ML</option><option value='GLS ML'>GLS ML</option><option value='PITCHER'>PITCHER</option></select>";
	var itemAvailability = "<select class='form-control' style='width: 100px' name='item_available' id='item_available"
			+ len
			+ "'><option value='true'>Active</option><option value='false'>Inactive</option></select>";
	for (var i = 1; i <= len; i++) {
		if ( $("#itemName" + i).text() == sku.skuId && $("#pluCode"+i).val() == sku.pluCode) {
			alert("This Item Name already present in the Category");
			return false;
		}
	}
	var description = null;
	if (sku.description != "" && sku.description != null)
		description = sku.description;
	else
		description = $("#desc").val();
	var row = "<tr id='div"
			+ len
			+ "' style='margin-top:5px;'><td class='slno' style='width:75px;' "+len+"'>"+slNo+"<td id='categoryName"
			+ len
			+ "'>"
			+ categoryName
			+ "</td><td id='itemName"+ len+ "'>"+ sku.skuId+ 
			"</td><td id='itemDesc"+ len+ "'>"+ description+ "</td><td>"+ itemType+ "</td><td id='uom"+len+"'>"
			+ sku.uom
			+ "<input type='hidden' id='pluCode"+len+"' value='"+sku.pluCode+"'/>" +
			"</td><td><input style='width: 50px' class='form-control' type='text' onblur='textBoxColor(this)'" +
			'oninput="this.value = this.value.replace(/[^0-9]/g, \'\'); this.value = this.value.replace(/(\..*)\/g, \'$1\');"'  +
			" name='qty' id='qty"
			+ len
			+ "' /></td>"
			+ "<td><input class='form-control' style='width: 50px' " +
			'oninput="this.value = this.value.replace(/[^0-9]/g, \'\'); this.value = this.value.replace(/(\..*)\/g, \'$1\');"'  +
			"type='text' onblur='textBoxColor(this)' name='unitPrice' id='unitPrice"
			+ len
			+ "' value='"+sku.price+"' /></td><td>"
			+ itemAvailability
			+ "</td>"
			+ "<td><div class='row'><div class='form-group col-lg-9'>"
			+ '<input id="item_icon'
			+ len
			+ '" type="file" style="width:232px;" onchange="loadImageFileAsURL('+ "'"+ 'item_icon'+ "'"+ ", this"
			+ ')"><span id="item_iconError'+len+'" style="color: red;"></span></div><div id="item_icon_image'
			+ len
			+ '" class="form-group col-lg-3" style="width:65px;height:20px;"></div></div><input type="hidden" id="item_icon_byte'
			+ len
			+ '"><input type="hidden" id="item_icon_refId'+len+'"/><input type="hidden" id="item_icon_name'+len+'"></td>'
			+ "<td><div class='row'><div class='form-group col-lg-9'>"
			+ '<input id="item_pic1'
			+ len
			+ '" type="file" style="width:232px;" onchange="loadImageFileAsURL('+ "'"+ 'item_pic1'+ "'"+ ", this"
			+ ')"><span id="item_pic1Error'+len+'" style="color: red;"></span></div><div id="item_pic1_image'
			+ len
			+ '" class="form-group col-lg-3" style="width:65px;height:20px;"></div></div><input type="hidden" id="item_pic1_byte'
			+ len
			+ '"><input type="hidden" id="item_pic1_refId'+len+'"/><input type="hidden" id="item_pic1_name'+len+'"></td>'
			+ "<td><div class='row'><div class='form-group col-lg-9'>"
			+ '<input id="item_pic2'
			+ len
			+ '" type="file" style="width:232px;" onchange="loadImageFileAsURL('+ "'"+ 'item_pic2'+ "'"+ ", this"
			+ ')"><span id="item_pic2Error'+len+'" style="color: red;"></span></div><div id="item_pic2_image'
			+ len
			+ '" class="form-group col-lg-3" style="width:65px;height:20px;"></div></div><input type="hidden" id="item_pic2_byte'
			+ len
			+ '"><input type="hidden" id="item_pic2_refId'+len+'"/><input type="hidden" id="item_pic2_name'+len+'"></td>'
			+ "<td id='Del"+ len +"'><img id='action"
			+ len
			+ "' src='"
			+ contextPath
			+ "/images/itemdelete.png' style='width:24px;cursor:pointer;' onclick='deleteProduct(this);' title='Delete'/></td></tr>";
	$("#itemsList tbody").append(row);
}

function validateMenuCategory(operation) {
	debugger;
	var menu_name = $("#menu_name").val();
	if (menu_name == "") {
		$("#menuNameError").html("Menu Name is required");
		return false;
	}
	/*var status = "true";
	if ($("#status").length) {
		status = $("#status").val();
	}*/
	var categoryName = [];
	var outlet_name = $("#outlet_name").val();
	
	
	
	if(outlet_name == null || outlet_name == "" || outlet_name == undefined){
	$("#outletNameError").html("Please Select atleast one location");
	$("#outlet_name").focus();
	return;
}

	
	var remarks = $("#remarks").val();
	var len = $("#categoriesList tr").length - 1;
	if(len == 0){
		alert("Add atleast one Category");
		return;
	}
	var finalObj = {}, menu_category_details = [], menu_item_details = [];
	/*if (operation != "new") {
		finalObj.status = status;
	}*/
	
	finalObj.menu_status = $("#status").val();
	finalObj.status = $("#status").val();
	finalObj.menu_name = menu_name;
	//finalObj.outlet_name = outlet_name;
	finalObj.remarks = remarks;
	finalObj.menu_category_details = menu_category_details;
	finalObj.menu_item_details = menu_item_details;
	
	
	var selectedLocationsList = [];
//	if($("#outlet_name").val() == "all")
//	{
		$("#outlet_name option:selected").each(function(){
			selectedLocationsList.push($(this).val());
		});
		
	//	finalObj.locationsList = selectedLocationsList;
//	}
//	else
//		selectedLocationsList.push(outlet_name);
	
//	selectedLocationsList.shift();
		
	finalObj.locationsList = selectedLocationsList;
	
	
	for (var i = 1; i <= len; i++) {
		var idAttr = $("#categoriesList tr:eq("+i+") td:last").attr("id").replace('Del','');
		if ($("#category_name" + idAttr).val().trim() == "") {
			alert("Enter the Category Name");
			$("#category_name" + idAttr).css("border-color", "red");
			$("#category_name" + idAttr).focus();
			return false;
		}
		var categoryPresent = jQuery.inArray($("#category_name" + idAttr).val()
				.toLowerCase(), categoryName);
		if (categoryPresent != "-1") {
			alert("This Category Name already there");
			$("#category_name" + idAttr).css("border-color", "red");
			return false;
		}
				

		
		categoryName[i] = $("#category_name" + idAttr).val().toLowerCase();
	
		var del=null;
		if($("#category_icon1_refId" + idAttr).val()== ""){
			del=false;
		}else{
			del=true;
		}
		/*if($("#locationslist").val() != null){
			var locations = $("#locationslist").val().replace(/[[\]]/g,'');
			locations =	locations.toString().split(',');
		}
		for(var i=0; i<locations.length; i++){	*/
		var obj = {
			sno : $("#category_icon1_id"+idAttr).val(),
			old_category_name : $("#category_name_hidden" + idAttr).val(),
			category_name : $("#category_name" + idAttr).val(),
			category_desc : $("#category_desc" + idAttr).val(),
			///.category_icon : $("#category_icon_byte" + i).val()
			category_icon : $("#category_icon1_name" + idAttr).val(),///.
			categoryIconRef : $("#category_icon1_refId" + idAttr).val(),///.
			categroyIconFlag : "true",
				deleteImage : del
		};
			
		finalObj.menu_category_details.push(obj);
}
//	}	
		/*if($("#category_icon1_image1").length > 0)
		categroyIconFlag : "true";
	else
		categroyIconFlag : "false";*/
	// console.log(JSON.stringify(finalObj));
	// alert(JSON.stringify(finalObj));
	var formData = JSON.stringify(finalObj);
//	console.log("OBJ "+formData);
	var contextPath = $("#contextPath").val();
	if (operation == "new")
		URL = contextPath + "/warehouseMaster/createMenu.do";
	else
		URL = contextPath + "/warehouseMaster/updateMenu.do";
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
			$("#tab_1").html(result);
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

function validateMenuItems(operation) {
	var menu_name = $("#menuName").val();
	var category_name = $("#category_name").val();
	var outlet_name = $("#outlet_name").val();
	var remarks = "";
	var len = $("#itemsList tr").length - 1;
	if (len == 0) {
		alert("Add Atleast One Item to Category");
		return;
	}
	debugger
	var finalObj = {}, menu_item_details = [], menu_category_details = [],items = [];;
	finalObj.menu_name = menu_name;
//	finalObj.outlet_name = outlet_name;
	finalObj.category_name = category_name;
	var selectedLocationsList = [];
	$("#outlet_name option:selected").each(function(){
		selectedLocationsList.push($(this).val());
	});
		
	finalObj.locationsList = selectedLocationsList;
	
	finalObj.remarks = remarks;
	finalObj.menu_category_details = menu_category_details;
	finalObj.menu_item_details = menu_item_details;
	for (var i = 1; i <= len; i++) {
		
		var idAttr = $("#itemsList tr:eq("+i+") td:last").attr("id").replace('Del','');
		
		if ($("#qty" + idAttr).val() == "") {
			alert("Enter the Quantity");
			$("#qty" + idAttr).css("border-color", "red");
			$("#qty" + idAttr).focus();
			return false;
		}
		if ($("#unitPrice" + idAttr).val() == "") {
			alert("Enter the Unit Price");
			$("#unitPrice" + idAttr).css("border-color", "red");
			$("#unitPrice" + idAttr).focus();
			return false;
		}
		
		var delIcon=null;
		if($("#item_icon_refId" + idAttr).val()== ""){
			delIcon=false;
		}else{
			delIcon=true;
		}
		var delPic1=null;
		if($("#item_pic1_refId" + idAttr).val()== ""){
			delPic1=false;
		}else{
			delPic1=true;
		}
		var delPic2=null;
		if($("#item_pic2_refId" + idAttr).val()== ""){
			delPic2=false;
		}else{
			delPic2=true;
		}
		
		
		
		var obj = {
				menu_item_id : $("#menu_item_id" + idAttr).val(),
				sno : $("#menu_item_id" + idAttr).val(),
			category_name : $("#categoryName" + idAttr).text(),
			item_name : $("#itemName" + idAttr).text(),
			sku_id : $("#itemName" + idAttr).text(),
			item_desc : $("#itemDesc" + idAttr).text(),
			item_type : $("#item_type" + idAttr).val(),
			unit_of_measurement : $("#uom" + idAttr).text().trim(),
			qty : $("#qty" + idAttr).val(),
			pluCode : $("#pluCode" + idAttr).val(),
			unit_price : $("#unitPrice" + idAttr).val(),
			item_availability : $("#item_available" + idAttr).val(),
			/*item_icon : $("#item_icon_byte" + i).val(),
			item_picture1 : $("#item_pic1_byte" + i).val(),
			item_picture2 : $("#item_pic2_byte" + i).val()*/
			item_icon : $("#item_icon_name" + idAttr).val(),
			item_picture1 : $("#item_pic1_name" + idAttr).val(),
			item_picture2 : $("#item_pic2_name" + idAttr).val(),
			
			itemIconRef : $("#item_icon_refId" + idAttr).val(),
			itemPicture1Ref : $("#item_pic1_refId" + idAttr).val(),
			itemPicture2Ref : $("#item_pic2_refId" + idAttr).val(),
			
			itemIconFlag : "true",
			itemPicture1Flag : "true",
			itemPicture2Flag : "true",
			
			deleteImageIcon : delIcon,
			deletePic1 : delPic1,
			deletePic2 : delPic2
			
		};
		//var deletedMenuItems = $("menu_item_id"+).val();
		items.push(obj);
//		finalObj.menu_item_details.push(obj);
		
		/*if(operation == 'edit')
		finalObj.deleteMenuItems = deletedPlus;*/
		
	}
	
	finalObj.menu_item_details = items;
	
	
	var formData = JSON.stringify(finalObj);
	console.log(formData);
	var contextPath = $("#contextPath").val();
	if (operation == "new")
		URL = contextPath + "/warehouseMaster/addItemsToMenu.do";
	else
		URL = contextPath + "/warehouseMaster/updateMenuItems.do";
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
			$("#tab_2").html(result);
			 $("#category_name").val(category_name);
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

$('#searchMenus').on('input',function(e){
	if($(this).val().trim()==""){
		viewMenuConfigurations('menuConfigurations');
	}
});


function searchMenuCategories(name,searchCategory,index){
	debugger
	var outlet_name = $("#outletname").val();
	 var contextPath = $("#contextPath").val();
	 URL = contextPath + "/warehouseMaster/searchMenuCategories.do";
	 $.ajax({
			type: "GET",
			url : URL,
			data : {
				searchName : name,
				outlet_name : outlet_name
			},
			beforeSend: function(xhr){                    
	   	   		$("#loading").css("display","block");
	   	   		$("#mainDiv").addClass("disabled");
	   	   	},
			success : function(result) {
				//$('#right-side').html(result);
				$('#tab_1').html(result);
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






function getCategoryDetailsBasedOnCategory(categoryName,menu_name){
	debugger
	var categoryName = $("#category_name").val();
	var menu_name = $("#menuName").val();
	 var contextPath = $("#contextPath").val();
	 $("#Error").html("");
	 $("#Success").html("");
	 URL = contextPath + "/warehouseMaster/getCategoryDetailsBasedOnCategory.do";
	 $.ajax({
			type: "GET",
			url : URL,
			data : {
				categoryName : categoryName,
				menu_name : menu_name
			},
			beforeSend: function(xhr){                    
	   	   		$("#loading").css("display","block");
	   	   		$("#mainDiv").addClass("disabled");
	   	   	},
			success : function(result) {
				//$('#right-side').html(result);
				appendCategoryDetails(result);
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





function appendCategoryDetails(skuList) {
	debugger
	
	 $("#itemsList tbody").html('');
	 $("#itemsList").val("");
	$("#menuItems").val("");
//	$("#items").html('');
//	var parsedJson = jQuery.parseJSON(product);
	
	
	var contextPath = $("#contextPath").val();
	var categoryName = $("#category_name").val();
	var item_icon = "item_icon";
	var item_pic1 = "item_pic1";
	var item_pic2 = "item_pic2";
	
	
	for(var j = 0; j < skuList.length ; j++){
		var slNo = 1; 
		 $('.slno').each(function(){
			$(this).text(slNo);
			slNo = parseInt(slNo) + 1;
		});
		var sku = skuList[j];
	var len = parseInt($("#itemsList tr").length);
	if (len != 1)
		len = parseInt($("#itemsList tr:last").attr("id").replace('div', '')) + 1;
	if(sku.item_type == 'Normal'){
	var itemType = "<select class='form-control' style='width: 100px' name='item_type' id='item_type"
			+ len
			+ "'><option value='Normal' selected>Normal</option><option value='Radiology'>Radiology</option><option value='Specility'>Specility</option><option value='Package'>Package</option></select>";
	}
	else if(sku.item_type == 'Radiology')
		{
		var itemType = "<select class='form-control' style='width: 100px' name='item_type' id='item_type"
			+ len
			+ "'><option value='Normal' >Normal</option><option value='Radiology' selected>Radiology</option><option value='Specility'>Specility</option><option value='Package'>Package</option></select>";
		}
	else if(sku.item_type == 'Specility')
	{
	var itemType = "<select class='form-control' style='width: 100px' name='item_type' id='item_type"
		+ len
		+ "'><option value='Normal' >Normal</option><option value='Radiology' >Radiology</option><option value='Specility' selected>Specility</option><option value='Package'>Package</option></select>";
	}
	else
		{
		var itemType = "<select class='form-control' style='width: 100px' name='item_type' id='item_type"
			+ len
			+ "'><option value='Normal' >Normal</option><option value='Radiology' >Radiology</option><option value='Specility' >Specility</option><option value='Package' selected>Package</option></select>";
		}
	var uom = "<select class='form-control' style='width: 100px' name='item_type' id='uom"
			+ len
			/* + "'><option value='pcs'>pcs</option><option value='pack'>pack</option><option value='plate'>plate</option><option value='ml'>ml</option><option value='kg'>kg</option></select>";*/
			+ "'><option value='PAX'>PAX</option><option value='NOS'>NOS</option><option value='GLASS'>GLASS</option><option value='PEG'>PEG</option><option value='BOTTLE'>BOTTLE</option>" +
			"<option value='ML'>ML</option><option value='BTL ML'>BTL ML</option><option value='GLS ML'>GLS ML</option><option value='PITCHER'>PITCHER</option></select>";

	if(sku.item_availability == 'true'){
	var itemAvailability = "<select class='form-control' style='width: 100px' name='item_available' id='item_available"
			+ len
			+ "'><option value='true' selected>Active</option><option value='false'>Inactive</option></select>";
	}
	else
		{
		var itemAvailability = "<select class='form-control' style='width: 100px' name='item_available' id='item_available"
			+ len
			+ "'><option value='true' >Active</option><option value='false' selected>Inactive</option></select>";
		}
	var description = null;
	
	var iconImage = sku.item_icon;
	if (sku.item_desc != "" && sku.item_desc != null)
		description = sku.item_desc;
	else
		description = $("#desc").val();
	var row = "<tr id='div"
			+ len
			+ "' style='margin-top:5px;'><td class='slno' style='width:75px;' "+len+"'>"+slNo+"<td id='categoryName"
			+ len
			+ "'>"
			+ sku.category_name
			+ "</td><td id='itemName"+ len+ "'>"+ sku.sku_id+ 
			"</td><td id='itemDesc"+ len+ "'>"+ sku.item_desc+ "</td><td>"+itemType+ "</td><td id='uom"+len+"'>"
			+ sku.unit_of_measurement
			+ "<input type='hidden' id='menu_item_id"+len+"' value='"+sku.sno+"'/><input type='hidden' id='item_icon_name"+len+"' value='"+sku.item_icon+"'><input type='hidden' id='pluCode"+len+"' value='"+sku.pluCode+"'/>" +
			"</td><td><input style='width: 50px' class='form-control' type='text' onblur='textBoxColor(this)'" +
			'oninput="this.value = this.value.replace(/[^0-9]/g, \'\'); this.value = this.value.replace(/(\..*)\/g, \'$1\');"'  +
			" name='qty' value="+sku.qty+" id='qty"
			+ len
			+ "' /></td>"
			+ "<td><input class='form-control' style='width: 50px' " +
			'oninput="this.value = this.value.replace(/[^0-9]/g, \'\'); this.value = this.value.replace(/(\..*)\/g, \'$1\');"'  +
			"type='text' onblur='textBoxColor(this)' name='unitPrice' id='unitPrice"
			+ len
			+ "' value='"+sku.unit_price+"' /></td><td>"
			+ itemAvailability
			+ "</td>"
			+ "<td><div class='row'><div class='form-group col-lg-9'>"
			+ '<input id="item_icon'
			+ len
			+ '" type="file" style="width:232px;" onchange="loadImageFileAsURL('+ "'"+ 'item_icon'+ "'"+ ", this"
			+ ')"><span id="item_iconError'+len+'" style="color: red;"></span></div><div id="item_icon_image'
			+ len
			+ '" class="form-group col-lg-3" style="width:65px;height:20px;"><img src="'+iconImage+'" alt="No Image" /></div></div><input type="hidden"   id="item_icon_byte'
			+ len+'"><input type="hidden" id="item_icon_refId'+len+'"/></td>'
			+ "<td><div class='row'><div class='form-group col-lg-9'>"
			+ '<input id="item_pic1'
			+ len
			+ '" type="file" style="width:232px;" onchange="loadImageFileAsURL('+ "'"+ 'item_pic1'+ "'"+ ", this"
			+ ')"><span id="item_pic1Error'+len+'" style="color: red;"></span></div><div id="item_pic1_image'
			+ len
			+ '" class="form-group col-lg-3" style="width:65px;height:20px;"><img src="'+sku.item_picture1+'" alt="No Image"/></div></div><input type="hidden" value="'+sku.item_picture1+'" id="item_pic1_byte'
			+ len
			+ '"><input type="hidden" id="item_pic1_refId'+len+'"/><input type="hidden" id="item_pic1_name'+len+'"></td>'
			+ "<td><div class='row'><div class='form-group col-lg-9'>"
			+ '<input id="item_pic2'
			+ len
			+ '" type="file" style="width:232px;" onchange="loadImageFileAsURL('+ "'"+ 'item_pic2'+ "'"+ ", this"
			+ ')"><span id="item_pic2Error'+len+'" style="color: red;"></span></div><div id="item_pic2_image'
			+ len
			+ '" class="form-group col-lg-3" style="width:65px;height:20px;"><img src="'+sku.item_picture2+'" alt="No Image"/></div></div><input type="hidden" value="'+sku.item_picture2+'" id="item_pic2_byte'
			+ len
			+ '"><input type="hidden" id="item_pic2_refId'+len+'"/><input type="hidden" id="item_pic2_name'+len+'"></td>'
			+ "<td id='Del"+ len +"'><img id='action"
			+ len
			+ "' src='"
			+ contextPath
			+ "/images/itemdelete.png' style='width:24px;cursor:pointer;' onclick='deleteProduct(this);' title='Delete'/></td></tr>";
	$("#itemsList tbody").append(row);
}
}

$('#menuSearch').on('input',function(e){
	if($(this).val().trim()==""){
		viewMenuConfigurations('menuConfigurations');
	}
});

function searchMenuItems(name,searchCategory,index){
	var outlet_name = $("#outletname").val();
	 var contextPath = $("#contextPath").val();
	 
	 URL = contextPath + "/warehouseMaster/searchMenuCategoriesinMenuItem.do";
	 $.ajax({
			type: "GET",
			url : URL,
			data : {
				searchName : name,
				outlet_name : outlet_name
			},
			beforeSend: function(xhr){                    
	   	   		$("#loading").css("display","block");
	   	   		$("#mainDiv").addClass("disabled");
	   	   	},
			success : function(result) {
				//$('#right-side').html(result);
				$('#tab_2').html(result);
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

