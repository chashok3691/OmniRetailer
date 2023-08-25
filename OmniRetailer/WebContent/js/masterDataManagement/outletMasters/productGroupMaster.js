
$(document).ready(function(){
	
});
//viswanath
	function viewEditProductGroup(groupID,operation){
		//debugger;
		var online = window.navigator.onLine;
	 	if(!online)
	 	{
	 		alert("check your internet connection,please try agian after some time");
	 		return;
	 	}
		 var contextPath = $("#contextPath").val();
		 URL = contextPath + "/outletMaster/editProductGroup.do";
		 var maxRecords="10";
		 if($("#maxRecords").length > 0 && $("#maxRecords").val != "")
			 maxRecords = $("#maxRecords").val();
			 
		var searchName="";
			 if($("#searchProductGroup").length > 0)
				 searchName = $("#searchProductGroup").val();
			 
		$.ajax({
			type: "GET",
			url : URL,
			data : {
				groupId : groupID,
				operation : operation,
				searchcriteria:'',
				index:'0',
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
			error : function(status,code,message) {
				 $("#err").val(message);
				 $("#loading").css("display","none");
	 			 $("#mainDiv").removeClass('disabled');
			}
		});
	}

	 function searchGroupChilds(groupID,operation,index){
                debugger;
                var online = window.navigator.onLine;
                 if(!online)
                 {
                         alert("check your internet connection,please try agian after some time");
                         return;
                 }
                         
                 if($("#operation").length > 0 )
                         
                         operation = $("#operation").val();
                 else
                         operation = "view";
                         
                 
                 var contextPath = $("#contextPath").val();
                 URL = contextPath + "/outletMaster/editProductGroup.do";
                 
                 var maxRecords="10";
                 if($("#maxRecords").length > 0)
                         maxRecords = $("#maxRecords").val();
                         
                var searchCriteria="";
                         if($("#searchcriteriachilds").length > 0)
                                 searchCriteria = $("#searchcriteriachilds").val().trim();
                                var searchName="";
                                 if($("#searchProductGroup").length > 0)
                                         searchName = $("#searchProductGroup").val();
                 
                 groupID = $("#groupId").val();
                //index=$("#index").val();
                // index = "";
                $.ajax({
                        type: "GET",
                        url : URL,
                        data : {
                                groupId : groupID,
                                operation : operation,
                                index:index,
                                searchcriteria:searchCriteria,
                                searchName:searchName,
                                maxRecords:maxRecords
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


	
//viswanath
$("#searchProductGroup").keydown(function(e){
	$("#productGroupNameError").html("");
	if($("#searchProductGroup").val().length<3){
		$("#productGroup").val("");
	}
	$(".productGroupMaster").children("li").each(function(){
		var brandName = $(this).children("a").text().trim();
		if($("#searchProductGroup").val().trim().toLowerCase() == supplierName.toLowerCase()){
			$("#searchProductGroup").val($("#searchProductGroup").val().trim());
			$("#productGroup").val($(this).attr("id"));
			$(".services").hide();
			$(".matchedStringUl").html("");
			return;
		}
		else{
			$("#productGroup").val("");
		}
	});
	if(e.keyCode == 9){
		if($("#searchProductGroup").val()!="" && $("#productGroup").val() == ""){
			$("#productGroupNameError").html("Product Group doesn't exist");
		}
		$(".services").hide();
		$(".matchedStringUl").html("");
	}
});
//viswanath
$('#searchProductGroup').on('input',function(e){
	if($(this).val().trim()==""){
		viewProductGroupMaster('productGroupMaster','0');
	}
});

function standardfilteritems(index){

		////debugger;
		var online = window.navigator.onLine;
	 	if(!online)
	 	{
	 		alert("check your internet connection,please try agian after some time");
	 		return;
	 	}
		
		var location = "";
		
    	if($("#outletLocation").length > 0)
    		
    			location = $("#outletLocation").val();
    			
    		
    	var supplier = "";
    	if($("#outletSupplierId").length > 0)
    		supplier = $("#outletSupplierId").val();
    	var category = "";
    	if($("#productCategory").length > 0)
    		category = $("#productCategory").val();
    	var subcategory = "";
    	if($("#outletSubcategory").length > 0)
    		subcategory = $("#outletSubcategory").val();
    	var brand = "";
    	if($("#outletBrandId").length > 0)
    		brand = $("#outletBrandId").val();
    	var department = "";
    	if($("#outletDepartmentId").length > 0)
    		department = $("#outletDepartmentId").val();
    	var section = "";
    	if($("#section").length > 0)
    		section = $("#section").val();
    	var subdepartment = "";
    	if($("#outletSubDepartmentId").length > 0)
    		subdepartment = $("#outletSubDepartmentId").val();
    	var className="";
    	if($("classId").length > 0)
    		className = $("#classId").val();
    	var subClass="";
    	if($("subClassId").length > 0)
    		subClass = $("#subClassId").val();
    	var styleOrModel="";
    	if($("#styleOrModel").length > 0)
    		styleOrModel = $("#styleOrModel").val();
    	
    	var maxRecords=10;
    	if($("#maxRecords").length > 0)
    		maxRecords = $("#maxRecords").val();
    	

		var contextPath = $("#contextPath").val();
		URL = contextPath + "/inventorymanager/filteritems.do";
		$.ajax({
			type : "GET",
			url : URL,
			data : {
				index : index,
				maxRecords:maxRecords,
				location : location,
				supplier : supplier,
				subcategory : subcategory,
				department : department,
				category : category,
				brand:brand,
				section:section,
				subdepartment:subdepartment,
				className : className,
				subClass : subClass,
				styleOrModel : styleOrModel,
			},
			beforeSend : function(xhr) {
				$("#loading").css("display", "block");
				$("#mainDiv").addClass("disabled");
			},
			success : function(result) {
				appendproductsbyfilter(result,"")
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



function searchProductGroupMaster(name,searchCategory,index){
	
	var online = window.navigator.onLine;
 	if(!online)
 	{
 		alert("check your internet connection and Please try agian after some time");
 		return;
 	}
	
	 var contextPath = $("#contextPath").val();
	 URL = contextPath + "/outletMaster/searchProductGroupMaster.do";
	 $.ajax({
			type: "GET",
			url : URL,
			data : {
				searchName : name,
				index : index
			},
			beforeSend: function(xhr){                    
	   	   		$("#loading").css("display","block");
	   	   		$("#mainDiv").addClass("disabled");
	   	   	},
			success : function(result) {
				$('#right-side').html(result);
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



function searchSku(name, searchCategory){
	 var contextPath = $("#contextPath").val();
	 var storeLocation = "";
	 URL = contextPath + "/inventorymanager/searchProducts.do";
	 //URL = contextPath + "/inventorymanager/searchProductsBasedOnCategory.do";

		var online = window.navigator.onLine;
	 	if(!online)
	 	{
	 		alert("check your internet connection and Please try agian after some time");
	 		return;
	 	}
		
	 
	 
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
       		appendSkus(result, searchCategory);
       		
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
 


function appendSkus(skusList, searchCategory){
	//debugger;
	

	var online = window.navigator.onLine;
 	if(!online)
 	{
 		alert("check your internet connection and Please try agian after some time");
 		return;
 	}
	
	
	
		 $("."+searchCategory).html('');

		 var op = '';
		 for(var i=0;i<skusList.length;i++){
		
			 if(skusList[i].skuID == skusList[i].description){
				
				 if (i == 0) {
					 op += '<li id="'+skusList[i].pluCode+'"  class="selected" onclick=getId(this,"'+searchCategory+'"); ><a><label style="width: 10%;">'+skusList[i].skuID+'</label>&nbsp &nbsp&nbsp &nbsp<label style="width: 10%;">'+skusList[i].pluCode+'</label>&nbsp &nbsp <label style="width: 30%;">'+skusList[i].productName+' </label>  <label style="width: 5%;">'+skusList[i].quantity+'</label>&nbsp &nbsp &nbsp <label style="width: 5%;">'+skusList[i].mrp+'</label> &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp      <label style="width: 5%;">'+skusList[i].price+'</a><input type="hidden" id="skuid" value="'+skusList[i].skuID+'" /><input type="hidden" id="desc" value="'+skusList[i].productName+'" /><input type="hidden" id="ean" value="'+skusList[i].ean+'" /><input type="hidden" id="color" value="'+skusList[i].color+'" /><input type="hidden" id="sizeId" value="'+skusList[i].size+'" /><input type="hidden" id="rangeId" value="'+skusList[i].measurementRange+'" /></li>';
				}else
				     op += '<li id="'+skusList[i].pluCode+'" onclick=getId(this,"'+searchCategory+'"); ><a><label style="width: 10%;">'+skusList[i].skuID+'</label>&nbsp &nbsp&nbsp &nbsp<label style="width: 10%;">'+skusList[i].pluCode+'</label>&nbsp &nbsp <label style="width: 30%;">'+skusList[i].productName+' </label>  <label style="width: 5%;">'+skusList[i].quantity+'</label>&nbsp &nbsp &nbsp <label style="width: 5%;">'+skusList[i].mrp+'</label> &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp      <label style="width: 5%;">'+skusList[i].price+'</a><input type="hidden" id="skuid" value="'+skusList[i].skuID+'" /><input type="hidden" id="desc" value="'+skusList[i].productName+'" /><input type="hidden" id="ean" value="'+skusList[i].ean+'" /><input type="hidden" id="color" value="'+skusList[i].color+'" /><input type="hidden" id="sizeId" value="'+skusList[i].size+'" /><input type="hidden" id="rangeId" value="'+skusList[i].measurementRange+'" /></li>';
		 	}
			 else{
				 if (i == 0) {
					 op += '<li id="'+skusList[i].pluCode+'"  class="selected" onclick=getId(this,"'+searchCategory+'"); ><a><label style="width: 10%;">'+skusList[i].skuID+'</label>&nbsp &nbsp&nbsp &nbsp<label style="width: 10%;">'+skusList[i].pluCode+'</label>&nbsp &nbsp <label style="width: 30%;">'+skusList[i].productName+' </label>  <label style="width: 5%;">'+skusList[i].quantity+'</label>&nbsp &nbsp &nbsp <label style="width: 5%;">'+skusList[i].mrp+'</label> &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp      <label style="width: 5%;">'+skusList[i].price+'</a><input type="hidden" id="skuid" value="'+skusList[i].skuID+'" /><input type="hidden" id="desc" value="'+skusList[i].productName+'" /><input type="hidden" id="ean" value="'+skusList[i].ean+'" /><input type="hidden" id="color" value="'+skusList[i].color+'" /><input type="hidden" id="sizeId" value="'+skusList[i].size+'" /><input type="hidden" id="rangeId" value="'+skusList[i].measurementRange+'" /></li>';
				}else
				     op += '<li id="'+skusList[i].pluCode+'" onclick=getId(this,"'+searchCategory+'"); ><a><label style="width: 10%;">'+skusList[i].skuID+'</label>&nbsp &nbsp&nbsp &nbsp<label style="width: 10%;">'+skusList[i].pluCode+'</label>&nbsp &nbsp <label style="width: 30%;">'+skusList[i].productName+' </label>  <label style="width: 5%;">'+skusList[i].quantity+'</label>&nbsp &nbsp &nbsp <label style="width: 5%;">'+skusList[i].mrp+'</label> &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp      <label style="width: 5%;">'+skusList[i].price+'</a><input type="hidden" id="skuid" value="'+skusList[i].skuID+'" /><input type="hidden" id="desc" value="'+skusList[i].productName+'" /><input type="hidden" id="ean" value="'+skusList[i].ean+'" /><input type="hidden" id="color" value="'+skusList[i].color+'" /><input type="hidden" id="sizeId" value="'+skusList[i].size+'" /><input type="hidden" id="rangeId" value="'+skusList[i].measurementRange+'" /></li>';
			 }
			 
		 }
		 $("."+searchCategory).html(op);
		 $("."+searchCategory).show();

	}
function getId(element,type){

	//debugger;
	var temnp= $("#type").val();
	if($("#operation").val() != "edit")
	if($("#type").val() != "skuAdd")
		{

			
			$("#skusList").find("tr:gt(0)").remove();
	
	
		}
	
	 var pluCode= $(element).attr("id");
	 var skuId = $(element).children("#skuid").val();
	 var desc = $(element).children("#desc").val();
	 var ean = $(element).children("#ean").val();
	 var color = $(element).children("#color").val();
	 var size = $(element).children("#sizeId").val();
	 var range = $(element).children("#rangeId").val();
	 addSku(pluCode,skuId,type,desc,ean,color,size,range);
}





function appendproductsbyfilter(productsList,searchCategory){
	////debugger;
	/*var productsList =sku.skuIdList;
	totalRecords = sku.totalRecords;*/

	var online = window.navigator.onLine;
 	if(!online)
 	{
 		alert("check your internet connection and Please try agian after some time");
 		return;
 	}
	
	
	
	var length=productsList.length;
	 var contextPath = $("#contextPath").val();
	 var appendtype=$("#featurededit").val();
	 var len = parseInt($("#skusList tr").length);
		if (len != 1)
			len = parseInt($("#skusList tr:last").attr("id").replace('dynamicdiv', '')) + 1;
		len=len-2;
	 if(productsList.length =='0'){
		alert("no results found");
	 }
	 
	 for(var i=0;i<productsList.length;i++){
		 len=len+1;
		 
		 var slNo = 1; 
	
		 $('.slno').each(function(){
			$(this).text(slNo);
			slNo = parseInt(slNo) + 1;
		});
		 var ean = productsList[i].ean;
		 if(ean == "" || ean == null)
			 ean = "_";
		 var description = null;
	 		if (productsList[i].skuDescription != "" && productsList[i].skuDescription != null)
	 			description = productsList[i].skuDescription;
	 		else
	 			description = $("#desc").val();
	 		
	 		
	 		var color = productsList[i].color;
	 		if(color == "" || color == null)
	 			color = "_";
	 		var size = productsList[i].size;
	 		if(size == "" || size == null)
	 			size = "_";
	 		var range = "_";
		 var pic='picture'+len;
		 var sno=1+len;
		 var row ="<tr id='dynamicdiv"+len+"' style='margin-top:5px;'><td class='slno'>"+slNo+"</td><td id='skuId"+len+"'>"+productsList[i].skuId+"</td>" +
	 		"<input type='hidden' id='skuId"+len+"' value='"+productsList[i].skuId+"'/>" +
	 		"<input type='hidden' id='pluCode"+len+"' value='"+productsList[i].pluCode+"'/>" +
	 		"<input type='hidden' id='length' value='"+productsList.length+"'/>" +
	 		"<td id='desc"+len+"'>"+description+"</td>" +
	 		"<td id='ean"+len+"'>"+ean+"</td>" +
	 		"<td id='color"+len+"'>"+color+"</td>" +
	 		"<td id='size"+len+"'>"+size+"</td>"+
	 		"<td id='range"+len+"'>"+range+"</td>"+
	 		"<td id='status"+len+"'>'Active'</td>"+
//	 		"<td ><select class='form-control' style='resize:none;' id='status"+len+"'><option value="+true+">Active</option><option value="+false+">In Active</option></select></td>" +
	 		"<td id='Del"+len+"'><img id='Img"+len+"' src='"+contextPath+"/images/itemdelete.png' style='width:15%;cursor:pointer;' onclick='deleteItem(this);' title='Delete "+productsList[i].skuId+"'/></td></tr>";
	 		$("#skusList tbody").append(row);
	 }
	/*$(function() {
         $("#skusList").dataTable({
			  "bPaginate": true,
           "bLengthChange": true,
           "bFilter": true,
           "bSort": true,
           "bInfo": true,
           "bAutoWidth": true,
			});
     });*/
}

function addSku(pluCode,skuId,type,desc,ean,color,size,range){
	//debugger

	var online = window.navigator.onLine;
 	if(!online)
 	{
 		alert("check your internet connection and Please try agian after some time");
 		return;
 	}
	
	var totalvalue = $("#totalValue").val(); 
	
	 var contextPath = $("#contextPath").val();
		var len = parseInt($("#skusList tr").length);
		$('#paginationForList').hide();
	
		if (len != 1)
			len = parseInt($("#skusList tr:last").attr("id").replace('dynamicdiv', '')) + 1;
		for (var i = 1; i <= len; i++) {
			if ($("#pluCode" + i).val() == pluCode) {
				alert("Item Already Added");
				return;
			}
		}
		var slNo = 1; 
		 $( ".slno" ).first().each(function(){
			 //debugger;
			 slNo = $(this).text();
				
			});
		 
		
		
		 $('.slno').each(function(){
			$(this).text(slNo);
			slNo = parseInt(slNo) + 1;
		});
		 var range = range
		 if(range == "" || range == null || range == "null")
			 range = "_"; 
		 var color = color;
	 		if(color == "" || color == null)
	 			color = "_";
	 		var size = size;
	 		if(size == "" || size == null)
	 			size = "_";
	 		if(ean === "" || ean === undefined || ean === null)
	 			ean ="_";
	 		if(desc === "" || desc === undefined || desc === null)
	 			desc ="_";
	 		
	 		
		 var row = "<tr id='dynamicdiv"+len+"' style='margin-top:5px;'><td class='slno'>"+slNo+"</td><td id='skuId"+len+"'>"+skuId+"</td>"+
			"<td id='desc"+len+"'>"+desc+"</td>" +
			"<input type='hidden' id='pluCode"+len+"' value='"+pluCode+"'/>" +
		    "<td id='ean"+len+"'>"+ean+"</td><td id= 'color"+len+"'>"+color+"</td><td id='size"+len+"'>"+size+"</td><td id='range"+len+"'>"+range+"</td>" +
//		    "<td ><select class='form-control' style='resize:none;' id='status"+len+"'><option value="+true+">Active</option><option value="+false+">In Active</option></select></td>" +
	 		"<td id='status"+len+"'>Active</td>"+

		    "<td id='Del"+ len +"' ><img id='Img"+ len +"' src='"+contextPath+"/images/itemdelete.png' style='width:25px;cursor:pointer;' onclick='deleteItem(this);' title='Delete "+skuId+"'/>" +
			"</td></tr>";
		 $("#skusList tbody").append(row);
		 $(".services").hide();
			$("#type").val('skuAdd');
		 $("#searchItems").val("");
		 $("#skuAdd").show();
		 resetForm();
		 $("#outletLocation").val("");
		 
		 
		 
		 
}

function deleteItem(element){
	//debugger;

	var online = window.navigator.onLine;
 	if(!online)
 	{
 		alert("check your internet connection and Please try agian after some time");
 		return;
 	}
	
	var id = $(element).attr("id").replace('Img','');
	var ids = $("#pluCode"+id).val();
	
	deletedPlus.push(ids);
	$('#dynamicdiv'+id).remove();
	var slNo = 1; 
	 $( ".slno" ).first().each(function(){
	
		 slNo = $(this).text();
			
		});
	 
	
	$('.slno').each(function(){
		$(this).text(slNo);
		slNo = parseInt(slNo) + 1;
	});
}

$("#group_name").keydown(function(){
	   $("#groupNameError").html("");
	   $(".Error").html("");
}); 

// vinay
function deleteAll(){
	//debugger;
	$("#skusList tbody tr").remove(); 
}

var deletedPlus =[];
function plusList(element) {
	var idAttr=$(element).attr("id").replace('textComments','');
	var id =$("#pluCode"+idAttr).val();
	deletedPlus.push($("#pluCode"+idAttr).val());
	$('#dynamicdiv'+idAttr).removeClass("update");
}


$("#groupId").on('input',function(e){
	   $("#groupIdError").html("");
	   $(".Error").html("");
});


/*var patt = /^[a-zA-Z0-9\.\_]*$/;
var ele = document.getElementById("groupId");
//$('#groupId').on('input', function() {
function validGroupId(){
    var value = ele.value;
    if(!patt.test(value)){
    	$("#groupIdError").html("Special Characters are not allowed");
    	$("#groupId").focus();
    	return false;
    }
}*/
//});


function validateProductGroupMasterForm(operation, index){
	 //purpose:for checking internet conection
//debugger;
	var online = window.navigator.onLine;
	if(!online)
	{
		alert("check your internet connection,please try agian after some time");
		return;
	}
	debugger;
	$(".Error").html("");
	var productGroupMaster = {}, groupChilds = [];
//	validGroup();
	if(operation === 'new')
	if($("#groupId").val().trim() == ""){
		$("#groupIdError").html("Enter Group Id");
	//	alertify.alert('Enter Group Id');
		$("#groupId").focus();
		return;
	}else if(parseInt($("#groupId").val().length)>=50){
		 $("#groupId").focus();
		 $("#groupIdError").html("Group Id can't exceed 50 characters");
		 return;
	} 
	/*else
		{
		var patt = /^[a-zA-Z0-9\.\_]*$/;
		var ele = document.getElementById("groupId");
		  var value = ele.value;
		    if(!patt.test(value)){
		    	$("#groupIdError").html("Special Characters are not allowed");
		    	return false;
		    }
		}*/
	
	
	
	
	
	if($("#group_name").val().trim() == ""){
			$("#groupNameError").html("Enter Group Name");
			$("#group_name").focus();
			return;
		}else if(parseInt($("#group_name").val().length)>=50){
			 $("#group_name").focus();
			 $("#groupNameError").html("Group name can't exceed 50 characters");
			 return;
		} 
	
	var comment = $("#comments").val().trim();
	var commentslength = $("#comments").val().length;
	if(comment.trim() != "" && parseInt($("#comments").val().length)>=1000){
		$("#comments").focus();
		$("#commentsError").html("Comments can't exceeds 1000 Characters");
		return false;
	}else{
		$("#commentsError").html("");
	}
	
		var len = parseInt($("#skusList tr").length);
		if(len <= 1){
			//debugger
			alert("Add Atleast One Item");
			return;
			}
		/* $(".update").each(function(){
				$(this).remove();
			 });*/
		 var len = parseInt($("#skusList tr").length);
		productGroupMaster.groupDescription = $("#group_name").val();

		if($("#groupId").val().trim() != "" & $("#groupId").length > 0){
			productGroupMaster.groupId = $("#groupId").val(); 
		}
		//debugger
		productGroupMaster.groupStatus = $("#status").val();
		productGroupMaster.groupComments = $("#comments").val().trim();
		productGroupMaster.imageRef = $("#groupImage_refId").val();
		productGroupMaster.image = $("#groupImageFile").val();
		var batchCreationRequired = false;
  
		if($("#outletLocation").length > 0 && $("#outletLocation").val()!="")
  		{
  		productGroupMaster.storeLocation = $("#outletLocation").val();
  		batchCreationRequired= true;
  		}
		if($("#outletSupplierId").length > 0 && $("#outletSupplierId").val()!="")
  		{
  		productGroupMaster.supplier = $("#outletSupplierId").val();
  		batchCreationRequired= true;
  		}
		
	if($("#productCategory").length > 0 && $("#productCategory").val()!="")
  		{
  		productGroupMaster.groupProductCategory = $("#productCategory").val();
  		batchCreationRequired= true;
  		}
  	if($("#outletSubcategory").length > 0 && $("#outletSubcategory").val()!="")
  		{
  		productGroupMaster.groupProductSubCategory = $("#outletSubcategory").val();
  		batchCreationRequired= true;
  		}
  		
  	if($("#outletBrandId").length > 0 && $("#outletBrandId").val()!=""){
  		productGroupMaster.productBrand = $("#outletBrandId").val();
  		batchCreationRequired= true;
  	}
  	if($("#outletDepartmentId").length > 0 && $("#outletDepartmentId").val()!="")
  		{
  		productGroupMaster.productDepartment = $("#outletDepartmentId").val();
  		batchCreationRequired= true;
  		}
  		
  	if($("#section").length > 0 && $("#section").val()!=""){
  		productGroupMaster.section = $("#section").val();
  		batchCreationRequired= true;
  	}
  	if($("#outletSubDepartmentId").length > 0 && $("#outletSubDepartmentId").val()!="")
  		{
  		productGroupMaster.productSubDepartment = $("#outletSubDepartmentId").val();
  		batchCreationRequired= true;
  		}
	if($("#classId").length > 0 && $("#classId").val()!="")
		{
		productGroupMaster.productClass = $("#classId").val();
		batchCreationRequired= true;
		}
  	
	if($("#subClassId").length > 0 && $("#subClassId").val()!="")
	{
	productGroupMaster.productSubClass = $("#subClassId").val();
	batchCreationRequired= true;
	}
	
  	 
	if($("#styleId").length > 0 && $("#styleId").val()!="")
	{
		productGroupMaster.modal = $("#styleId").val();
		batchCreationRequired= true;
	}
  	
  	 
  	
  	var tempAvailable = false;
  	if($("#type").val() === "excelImport")
  		tempAvailable = true;
  		
  	if($("#groupImageimage").length > 0)
		productGroupMaster.imageFlag = "true";
	else
		productGroupMaster.imageFlag = "false";
  	
  	var maxRecords=10;
  	if($("#maxRecords").length > 0)
  		maxRecords = $("#maxRecords").val();
  	
	var searchCriteria = "";
  	if($("#searchProductGroup").length > 0)
  		searchCriteria = $("#searchProductGroup").val();
  	
 
  	
  	
 
  	if(batchCreationRequired == false && tempAvailable == false)
	for(var i=1;i<len;i++){
		var idAttr = $("#skusList tr:eq("+i+") td:last").attr("id");
		idAttr = idAttr.replace('Del','');
	 	var serialNo = "";
	 	
		if(("#sNo"+idAttr).length > 0)
	   		serialNo = $("#sNo"+idAttr).val();
		
		 var itemStatus=false;
		
		if($("#status"+idAttr).text() == 'Active')
          itemStatus = true;
		   else
			itemStatus = false;		
		var obj = 
		{
				skuId:$("#skuId"+idAttr).text(),
				ean:$("#ean"+idAttr).text(),
				pluCode:$("#pluCode"+idAttr).val(),
				measureRange:$("#range"+idAttr).text(),
				color:$("#color"+idAttr).text(),
				size:$("#size"+idAttr).text(),
				description:$("#desc"+idAttr).text(),
				sNo: serialNo,
//				itemStatus:$("#status"+idAttr).val()};
				itemStatus: itemStatus
		};
		groupChilds.push(obj);
//		var ids = $("#pluCode"+idAttr).val();
//		deletedPlus.push(ids);
	}
  	productGroupMaster.batchCreationRequired = batchCreationRequired;
  	
  	productGroupMaster.tempAvailable = tempAvailable;
  	
	productGroupMaster.groupChilds = groupChilds;
	var contextPath = $("#contextPath").val();
  if(operation=="new"){
	   URL = contextPath + "/outletMaster/createProductGroupMaster.do";
  }
  else if(operation=="edit"){
	   URL = contextPath + "/outletMaster/updateProductGroupMaster.do";
	   productGroupMaster.groupId = $("#groupId").val();
	   productGroupMaster.deletedPlus = deletedPlus;
	   productGroupMaster.startIndex = index;
  }
  productGroupMaster.maxRecords = maxRecords;
  productGroupMaster.searchCriteria= searchCriteria;
  
  	 var formData = JSON.stringify(productGroupMaster);
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
			//debugger;
			$("#right-side").html(result);
			$("#type").val('skuAdd');
			$("#loading").css("display","none");
			$("#mainDiv").removeClass('disabled');
		},
		error : function(jqXHR,status,errorthrown) {
			//debugger;
			alert("something went wrong");
			$("#loading").css("display","none");
			$("#mainDiv").removeClass('disabled');
	}
});

}


/*function validateProductGroupMasterForm(operation, index){
	 //purpose:for checking internet conection
//debugger;
	var online = window.navigator.onLine;
 	if(!online)
 	{
 		alert("check your internet connection,please try agian after some time");
 		return;
 	}
 	debugger;
 	$(".Error").html("");
	var productGroupMaster = {}, groupChilds = [];
//	validGroup();
	if(operation === 'new')
	if($("#groupId").val().trim() == ""){
		$("#groupIdError").html("Enter Group Id");
	//	alertify.alert('Enter Group Id');
		$("#groupId").focus();
		return;
	}
	else
		{
		var patt = /^[a-zA-Z0-9\.\_]*$/;
		var ele = document.getElementById("groupId");
		  var value = ele.value;
		    if(!patt.test(value)){
		    	$("#groupIdError").html("Special Characters are not allowed");
		    	return false;
		    }
		}
	
	
	
	
	
	if($("#group_name").val().trim() == ""){
			$("#groupNameError").html("Enter Group Name");
			$("#group_name").focus();
			return;
		}
		var len = parseInt($("#skusList tr").length);
		if(len <= 1){
			//debugger
			alert("Add Atleast One Item");
			return;
			}
		 $(".update").each(function(){
				$(this).remove();
			 });
		 var len = parseInt($("#skusList tr").length);
		productGroupMaster.groupDescription = $("#group_name").val();

		if($("#groupId").val().trim() != "" & $("#groupId").length > 0){
			productGroupMaster.groupId = $("#groupId").val(); 
		}
		//debugger
		productGroupMaster.groupStatus = $("#status").val();
		productGroupMaster.groupComments = $("#comments").val().trim();
		productGroupMaster.imageRef = $("#groupImage_refId").val();
		productGroupMaster.image = $("#groupImageFile").val();
		var batchCreationRequired = false;
   
		if($("#outletLocation").length > 0 && $("#outletLocation").val()!="")
   		{
   		productGroupMaster.storeLocation = $("#outletLocation").val();
   		batchCreationRequired= true;
   		}
		if($("#outletSupplierId").length > 0 && $("#outletSupplierId").val()!="")
   		{
   		productGroupMaster.supplier = $("#outletSupplierId").val();
   		batchCreationRequired= true;
   		}
		
	if($("#productCategory").length > 0 && $("#productCategory").val()!="")
   		{
   		productGroupMaster.groupProductCategory = $("#productCategory").val();
   		batchCreationRequired= true;
   		}
   	if($("#outletSubcategory").length > 0 && $("#outletSubcategory").val()!="")
   		{
   		productGroupMaster.groupProductSubCategory = $("#outletSubcategory").val();
   		batchCreationRequired= true;
   		}
   		
   	if($("#outletBrandId").length > 0 && $("#outletBrandId").val()!=""){
   		productGroupMaster.productBrand = $("#outletBrandId").val();
   		batchCreationRequired= true;
   	}
   	if($("#outletDepartmentId").length > 0 && $("#outletDepartmentId").val()!="")
   		{
   		productGroupMaster.productDepartment = $("#outletDepartmentId").val();
   		batchCreationRequired= true;
   		}
   		
   	if($("#section").length > 0 && $("#section").val()!=""){
   		productGroupMaster.section = $("#section").val();
   		batchCreationRequired= true;
   	}
   	if($("#outletSubDepartmentId").length > 0 && $("#outletSubDepartmentId").val()!="")
   		{
   		productGroupMaster.productSubDepartment = $("#outletSubDepartmentId").val();
   		batchCreationRequired= true;
   		}
 	if($("#classId").length > 0 && $("#classId").val()!="")
		{
		productGroupMaster.productClass = $("#classId").val();
		batchCreationRequired= true;
		}
   	
 	if($("#subClassId").length > 0 && $("#subClassId").val()!="")
	{
	productGroupMaster.productSubClass = $("#subClassId").val();
	batchCreationRequired= true;
	}
	
   	 
 	if($("#styleId").length > 0 && $("#styleId").val()!="")
	{
 		productGroupMaster.modal = $("#styleId").val();
 		batchCreationRequired= true;
	}
   	
   	 
   	
   	var tempAvailable = false;
   	if($("#type").val() === "excelImport")
   		tempAvailable = true;
   		
   	if($("#groupImageimage").length > 0)
		productGroupMaster.imageFlag = "true";
	else
		productGroupMaster.imageFlag = "false";
   	
   	var maxRecords=10;
   	if($("#maxRecords").length > 0)
   		maxRecords = $("#maxRecords").val();
   	
 	var searchCriteria = "";
   	if($("#searchProductGroup").length > 0)
   		searchCriteria = $("#searchProductGroup").val();
   	
  
   	
   	
  
   	if(batchCreationRequired == false && tempAvailable == false)
	for(var i=1;i<len;i++){
		var idAttr = $("#skusList tr:eq("+i+") td:last").attr("id");
		idAttr = idAttr.replace('Del','');
	 	var serialNo = "";
	 	
		if(("#sNo"+idAttr).length > 0)
	   		serialNo = $("#sNo"+idAttr).val();
		
		 var itemStatus=false;
		
		if($("#status"+idAttr).text() == 'Active')
           itemStatus = true;
		   else
			itemStatus = false;		
		var obj = 
		{
				skuId:$("#skuId"+idAttr).text(),
				ean:$("#ean"+idAttr).text(),
				pluCode:$("#pluCode"+idAttr).val(),
				measureRange:$("#range"+idAttr).text(),
				color:$("#color"+idAttr).text(),
				size:$("#size"+idAttr).text(),
				description:$("#desc"+idAttr).text(),
				sNo: serialNo,
//				itemStatus:$("#status"+idAttr).val()};
				itemStatus: itemStatus
		};
		groupChilds.push(obj);
//		var ids = $("#pluCode"+idAttr).val();
//		deletedPlus.push(ids);
	}
   	productGroupMaster.batchCreationRequired = batchCreationRequired;
   	
   	productGroupMaster.tempAvailable = tempAvailable;
   	
	productGroupMaster.groupChilds = groupChilds;
	var contextPath = $("#contextPath").val();
   if(operation=="new"){
	   URL = contextPath + "/outletMaster/createProductGroupMaster.do";
   }
   else if(operation=="edit"){
	   URL = contextPath + "/outletMaster/updateProductGroupMaster.do";
	   productGroupMaster.groupId = $("#groupID").val();
	   productGroupMaster.deletedPlus = deletedPlus;
	   productGroupMaster.startIndex = index;
   }
   productGroupMaster.maxRecords = maxRecords;
   productGroupMaster.searchCriteria= searchCriteria;
   
   	 var formData = JSON.stringify(productGroupMaster);
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
			//debugger;
			$("#right-side").html(result);
			$("#type").val('skuAdd');
			$("#loading").css("display","none");
			$("#mainDiv").removeClass('disabled');
		},
		error : function(jqXHR,status,errorthrown) {
			//debugger;
			alert("something went wrong");
			$("#loading").css("display","none");
			$("#mainDiv").removeClass('disabled');
	}
});

}
*/
function deletePic(id){
	var control = $("#"+id);
	var k = confirm("Are you sure you want to Delete");
	if(k == true){
		control.replaceWith( control = control.clone( true ) );
		$("#"+id+"_thumbnail").remove();
		$("#"+id+"_delImage").remove();
		$("#"+id+"_label").css("display","block");
	}
}


function loadImageFileAsURL(id,ele) {
	//debugger;
	$("."+id+"Error").text("");
	$("#"+id+"Error").text("");
	var filesSelected = document.getElementById(id).files;
	if (filesSelected.length > 0) {
		var fileToLoad = filesSelected[0];
		 var fsize = fileToLoad.size;
		if (fileToLoad.type.match("image.*")) {
//			if(fsize <= 70000){
			var name = fileToLoad['name'];
			$("#"+id+"File").val(name);
			var fileReader = new FileReader();
			fileReader.onload = function(fileLoadedEvent) {

				$("#"+id+"image").html("");
				$("#" + id + "image").html(
						'<img style="width:65px;height:60px;" id='+id+'_thumbnail src=' + fileLoadedEvent.target.result + '>');

			};
			fileReader.readAsDataURL(fileToLoad);
			var oMyForm = new FormData();
	        oMyForm.append("file",  ele.files[0]);
	        if($("#"+id+"_refId").val() != "")
	        	oMyForm.append("refId",  $("#"+id+"_refId").val().trim());
	        else
	        	oMyForm.append("refId", "");
	        var contextPath = $("#contextPath").val();
	        var URL = contextPath + "/inventorymanager/addToAttachementList.do";
	        $.ajax({
//					dataType : 'json',
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
			/* }else{
        		$("#"+id+"Error").text("Select Image < 70kb");
	        	return;
        	} */
		}
	}
}



function standardProductGroupFilter(index,type,mode)
{
	//debugger;

	var online = window.navigator.onLine;
 	if(!online)
 	{
 		alert("check your internet connection and Please try agian after some time");
 		return;
 	}
	
	
	
	var isFilterGroup =false;
	var maxRecords = 10;
	if($("#maxRecords").length > 0 && $("#maxRecords").val() !="")
		maxRecords = $("#maxRecords").val();
	var location = "";
	if(($("#outletLocation").length > 0)&& ($("#outletLocation").val() !=""))
		{
			location = $("#outletLocation").val();
			isFilterGroup = true;
		}
	var supplier = "";
	if(($("#outletSupplierId").length > 0)&& ($("#outletSupplierId").val() !=""))
		{
			supplier = $("#outletSupplierId").val();
			isFilterGroup = true;
		}
	var category = "";
	if(($("#productCategory").length > 0)&& ($("#productCategory").val() !=""))
		{
			category = $("#productCategory").val();
			isFilterGroup = true;
		}
	var subcategory = "";
	if(($("#outletSubcategory").length > 0) && ($("#outletSubcategory").val() !=""))
		{
			subcategory = $("#outletSubcategory").val();
			isFilterGroup = true;
		}
	var brand = "";
	if(($("#outletBrandId").length > 0) && ($("#outletBrandId").val() !=""))
		{
			brand = $("#outletBrandId").val();
			isFilterGroup = true;
		}
	var department = "";
	if(($("#outletDepartmentId").length > 0)&& ($("#outletDepartmentId").val() !=""))
		{
			department = $("#outletDepartmentId").val();
			isFilterGroup = true;
		}
	var section = "";
	if(($("#section").length > 0)&& ($("#section").val() !=""))
		{
			section = $("#section").val();
			isFilterGroup = true;
		}
	var subdepartment = "";
	if(($("#outletSubDepartmentId").length > 0)&& ($("#outletSubDepartmentId").val() !=""))
		{
			subdepartment = $("#outletSubDepartmentId").val();
			isFilterGroup = true;
		}
	var className="";
	if(($("classId").length > 0)&& ($("#classId").val() !=""))
		{
			className = $("#classId").val();
			isFilterGroup = true;
		}
	var subClass="";
	if(($("subClassId").length > 0)&& ($("#subClassId").val() !=""))
		{
			subClass = $("#subClassId").val();
			isFilterGroup = true;
		}
	var styleOrModel="";
	if(($("#styleOrModel").length > 0)&& ($("#styleOrModel").val() !=""))
		{
			styleOrModel = $("#styleOrModel").val();
			isFilterGroup = true;
		}
	if(mode != "excelImport")
	if(!isFilterGroup)
		{
			alert("To add items to the group, Please select atleast one filter.");
			return;
		}
	
	var contextPath = $("#contextPath").val();
	var groupId = "";
	if(type == "edit")
	groupId = $("#groupId").val();
	
	if(mode == "excelImport")
		URL = contextPath + "/outletMaster/getProductGroupExelItems.do";
	else
		URL = contextPath + "/outletMaster/getFilterItems.do";
	var groupId =$("#groupId").val();
	var groupDescription = $("#group_name").val();
	var groupStatus = $("#status").val();
	var groupComments = $("#comments").val();
	var imageRef = $("#groupImage_refId").val();
	var image = $("#groupImageFile").val();
	var imageGroup =$("#groupImage").text();
	$.ajax({
		type : "GET",
		url : URL,
		data : 
		{
			location : location,
			supplier : supplier,
			subcategory : subcategory,
			department : department,
			category : category,
			brand:brand,
			section:section,
			subdepartment:subdepartment,
			className : className,
			subClass : subClass,
			styleOrModel : styleOrModel,
			index : index,
			maxRecords : maxRecords,
			type : type,
		},
		beforeSend: function(xhr){                    
   			$("#loading").css("display","block");
   			$("#mainDiv").addClass("disabled");
   		},
		success : function(result) {
			//debugger;
			$("#fileUploadCSV").val("");
			$("#childs").html(result);
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


var	productFiles = [];
function addFileToArray(id){
	//debugger;
	
	   var ext = $("#"+id)[0].files[0]['name'].split('.').pop().toLowerCase();
	    
	    	productFiles=event.target.files;

}

function addNameToTextBox(id){
	debugger;
	try{
	addFileToArray(id);
	if($("#"+id)[0].files[0] != undefined){
		$("#skuMasterFile").val($("#"+id)[0].files[0]['name']);
	}

	else
		$("#"+id+"File").val("");
}
	catch(e)
	{
		//alert("exception");
	}
}

//author vijay
function importProductGroupExcelData(){
	debugger;
	var groupId =$("#groupId").val();
	var groupDescription = $("#group_name").val();
	var groupStatus = $("#status").val();
	var groupComments = $("#comments").val();
	var imageRef = $("#groupImage_refId").val();
	var image = $("#groupImageFile").val();
	var file = $("#fileUploadCSV").val();  
	$(".Error").html("");
	if(productFiles.length <= 0)
		{
		alert("To Import, Please Select Excel Sheet First.");
			return;
		}
	var oMyForm = new FormData();

    oMyForm.append("file", productFiles[0]);
    var contextPath = $("#contextPath").val();
	 URL = contextPath + "/outletMaster/importExcelData.do";
	 $.ajax({
		  url : URL,
          data : oMyForm,
          processData: false, 
          contentType: false,
          type : "POST",
          enctype: 'multipart/form-data',
          beforeSend: function(xhr)
          {                    
   				$("#loading").css("display","block");
   				$("#mainDiv").addClass("disabled");
   		  },
		success : function(result) {
			resetForm();
			$("#childs").html(result);
			//$("#right-side").html(result);
			$("#loading").css("display","none");
			$("#mainDiv").removeClass('disabled');
			

		},
		error : function(jqxhr,status,errorThrown) {
			
			
			$("#loading").css("display","none");
			$("#mainDiv").removeClass('disabled');
		}
 	 });
 }



//author vijay
function importProductGroupExcelDataEditPage(){
	debugger;
	var groupId =$("#groupId").val();
	var groupDescription = $("#group_name").val();
	var groupStatus = $("#status").val();
	var groupComments = $("#comments").val();
	var imageRef = $("#groupImage_refId").val();
	var image = $("#groupImageFile").val();
	var file = $("#fileUploadCSV").val();  
	$(".Error").html("");
	if(productFiles.length <= 0)
		{
		alert("To Import, Please Select Excel Sheet First.");
			return;
		}
	var oMyForm = new FormData();

    oMyForm.append("file", productFiles[0]);
    var contextPath = $("#contextPath").val();
	 URL = contextPath + "/outletMaster/importExcelDataforEdit.do";
	 $.ajax({
		  url : URL,
          data : oMyForm,
          processData: false, 
          contentType: false,
          type : "POST",
          enctype: 'multipart/form-data',
          beforeSend: function(xhr)
          {                    
   				$("#loading").css("display","block");
   				$("#mainDiv").addClass("disabled");
   		  },
		success : function(productsList) {
			resetForm();
			if(productsList != null && productsList.length > 0) {
			for (var i = 0; i <productsList.length; i++){
				addItemstoProducts(productsList[i]);
         		 }
			}
			/*$("#childs").html(result);*/
			//$("#right-side").html(result);
			$("#loading").css("display","none");
			$("#mainDiv").removeClass('disabled');
			

		},
		error : function(jqxhr,status,errorThrown) {
			
			
			$("#loading").css("display","none");
			$("#mainDiv").removeClass('disabled');
		}
 	 });
 }



function addItemstoProducts(productsList){
	//debugger

	var online = window.navigator.onLine;
 	if(!online)
 	{
 		alert("check your internet connection and Please try agian after some time");
 		return;
 	}
	
	 var contextPath = $("#contextPath").val();
		var len = parseInt($("#skusList tr").length);
	
		if (len != 1)
			len = parseInt($("#skusList tr:last").attr("id").replace('dynamicdiv', '')) + 1;
		
		/*for (var i = 1; i <= len; i++) {
			if ($("#pluCode" + i).val() == pluCode) {
				alert("Item Already Added");
				return;
			}
		}*/
		var slNo = 1; 
		 $( ".slno" ).first().each(function(){
			 //debugger;
			 slNo = $(this).text();
				
			});
		 
		
		 $('.slno').each(function(){
			$(this).text(slNo);
			slNo = parseInt(slNo) + 1;
		});
		 
		 var skuId = productsList.skuId;
			if(skuId == null || skuId == undefined)
				sku.skuId = "";
			
			var desc = productsList.description;
			if(desc === "" || desc === undefined || desc === null)
				desc ="";
			
			var pluCode = productsList.pluCode;
			if(pluCode === "" || pluCode === undefined || pluCode === null)
				pluCode ="";
			
			var ean = productsList.ean;
	 		if(ean === "" || ean === undefined || ean === null)
	 			ean ="";
	 		
		 var range = productsList.range;
		 if(range == "" || range == null || range == "null")
			 range = ""; 
		 
		 var color = productsList.color;
	 		if(color == "" || color == null)
	 			color = "";
	 		
	 	var size = productsList.size;
	 		if(size == "" || size == null)
	 			size = "";
	 		
	 	var status = productsList.status;
	 		if(status == "" || status == null)
	 			status = "";
	 		
	 		if(status == "true")
	 			status ="Active"
	 			else
	 			status ="Inactive"
	 				
		 var row = "<tr id='dynamicdiv"+len+"' style='margin-top:5px;'><td class='slno'>"+slNo+"</td><td id='skuId"+len+"'>"+skuId+"</td>"+
			"<td id='desc"+len+"'>"+desc+"</td>" +
			"<input type='hidden' id='pluCode"+len+"' value='"+pluCode+"'/>" +
		    "<td id='ean"+len+"'>"+ean+"</td><td id= 'color"+len+"'>"+color+"</td><td id='size"+len+"'>"+size+"</td><td id='range"+len+"'>"+range+"</td>" +
//		    "<td ><select class='form-control' style='resize:none;' id='status"+len+"'><option value="+true+">Active</option><option value="+false+">In Active</option></select></td>" +
	 		"<td id='status"+len+"'>"+status+"</td>"+

		    "<td id='Del"+ len +"' ><img id='Img"+ len +"' src='"+contextPath+"/images/itemdelete.png' style='width:25px;cursor:pointer;' onclick='deleteItem(this);' title='Delete "+skuId+"'/>" +
			"</td></tr>";
		 $("#skusList tbody").append(row);
		 $(".services").hide();
			$("#type").val('skuAdd');
		 $("#searchItems").val("");
		 $("#skuAdd").show();
		 resetForm();
		 $("#outletLocation").val("");
		 
		 
		 
		 
}

