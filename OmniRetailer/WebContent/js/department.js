var subDepartmentDivContent = null;
function setSubDepartmentDivContent(){
	subDepartmentDivContent = $('.subDeptList').prop('outerHTML');
}

$("#subDeptName1").keydown(function(){
	$("#subDeptName1Error").text("");
	$(".Error").html("");
});

$("#deptName").keydown(function(){
	$("#deptNameError").text("");
	$(".Error").html("");
});
$("#deptDesc").keydown(function(){
	$(".Error").html("");
});
$("#subDeptDesc1").keydown(function(){
	$(".Error").html("");
});

function appendSubDepartment() {
	if($("#subDeptName1").val().trim() == ""){
		$("#subDeptName1Error").text("Please Enter Sub Department");
		return;
	}
	
	if(parseInt($("#subDeptName1").val().length)>25){
		 $("#subDeptName1").focus();
			$("#subDeptName1Error").html("Sub Department Name can't exceeds 25 Characters");
			return;
	}else{
   	 $("#subDeptName1Error").html(" ");
    }
	
	if(parseInt($("#subDeptDesc1").val().length)>150){
        $("#subDeptDesc1").focus();
        $("#subDeptDesc1Error").html("Sub Department description can't exceeds 150 Characters");
          return;
     }else{
    	 $("#subDeptDesc1Error").html(" ");
     }
	
	var id = 1;
	if($(".subDepartmentTR:last").attr("id") != undefined){
		id = parseInt($(".subDepartmentTR:last").attr("id").replace('subDepartmentTR',''))+1;
	}
	var flag = false;
	$(".subDepartmentTR").each(function(){
		var currentId = $(this).attr("id");
		currentId = currentId.replace('subDepartmentTR','');
		if($("#subDeptName1").val().trim() == $("#subDepartmentTD"+currentId).val()){
			$("#subDepartmentDescTD"+currentId).text($("#subDeptDesc1").val());
			flag = true;
			return;
		}
	});
	if(flag == true){
//		$("#subDeptName1Error").text("This Sub Department Already Exists");
		return;
	}
	var tr = '<tr class="subDepartmentTR" id="subDepartmentTR'+id+'"><td class="col-md-4"  style="padding-left: 20px;"><input type="radio" style="vertical-align: -2px;" onclick="toggleRadio();" name="subDepartments" id="subDepartmentTD'+id+'" value="'+$("#subDeptName1").val().trim()+'">     '+$("#subDeptName1").val()+'</td><td class="col-md-7" style="padding-left: 15px;" id="subDepartmentDescTD'+id+'" >'+$("#subDeptDesc1").val()+'</td></tr>';
	$("#subDepartmentsList tbody").append(tr);
	$("#subDeptName1").val("");
	$("#subDeptDesc1").val("");
	$('input[type="radio"][name="subDepartments"]:checked').removeAttr('checked');
}

function toggleRadio(operation,op){
	var subDept = $('input[type="radio"][name="subDepartments"]:checked').val();
	var id = $('input[type="radio"][name="subDepartments"]:checked').attr("id").replace('subDepartmentTD','');
	$("#subDeptName1").val(subDept);
	$("#subDeptDesc1").val($("#subDepartmentDescTD"+id).text());
	$(".update").each(function(){
		$(this).remove();
	});
	if(operation != undefined){
		var primaryDepartment = $("#deptName").val();
		var contextPath = $("#contextPath").val();
	    URL = contextPath + "/inventorymanager/getSkuDepartments.do";
			$.ajax({
				type: "GET",
				url : URL,
				data : {
					primaryDepartment : primaryDepartment,
					secondaryDepartment : subDept
				},
				beforeSend: function(xhr){                    
		   			$("#loading").css("display","block");
		   			$("#mainDiv").addClass("disabled");
		   		  },
				success : function(result) {
//					$("#right-side").html(result);
					appendSkus(result,op);
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
	 var len = $("#productsList tr").length-1;
	 if(len == 0){
		return false;
	}
	for(var i=1;i<=len;i++){
		var idAttr = $("#productsList tr:eq("+i+") td:last").attr("id");
		idAttr = idAttr.replace('Del','');
		if($("#subDept"+idAttr).val() != subDept){
			$("#dynamicdiv"+idAttr).css("display","none");
		}
		else{
			$("#dynamicdiv"+idAttr).css({display:''});
		}
	}
}

function deleteSubDepartment(ele) {
	var subDept = $("#subDeptName1").val().trim();
	if(subDept == ""){
		alert("Please Select A Sub Department To Delete");
		return;
	}
	var id = $('input[type=radio][value="'+subDept+'"]').attr('id');
	id = id.replace('subDepartmentTD','');
	var len = $("#productsList tr").length-1;
	/* if(len == 0){
		return false;
	}*/
	for(var i=1;i<=len;i++){
		var idAttr = $("#productsList tr:eq("+i+") td:last").attr("id");
		idAttr = idAttr.replace('Del','');
		if($("#subDept"+idAttr).val() == subDept){
			alert("Please Remove Sku Under This Sub Department");
			return;
		}
	}
	$("#subDepartmentTR"+id).remove();
	$("#subDeptName1").val("");
	$("#subDeptDesc1").val("");
}

function searchProducts(name,searchCategory){
	 var contextPath = $("#contextPath").val();
	 var storeLocation = "";
	 if($('input[type="radio"][name="subDepartments"]:checked').val() == undefined){
		 alert("Please Select A Sub Department");
		 return;
	 }
	 
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
	if(type == "apparel")
		getItemDetails(id);
	else if(type == "receipt")
		getSkuDetails(id,description);
	 $(".services").hide();
	 $("."+type).html("");
}

 function getSkuDetails(skuId,description){
	 $("#desc").val(description);
	 var contextPath = $("#contextPath").val();
	 var WarehouseReturnflag=$("#whreturnflag").val();
		if(WarehouseReturnflag == "" || WarehouseReturnflag == undefined || WarehouseReturnflag == null){
			WarehouseReturnflag="";
   		}
	 var storeLocation = "";
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
  				addItem(result);
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

 
 function addItem(list){
	 var parsedJson = jQuery.parseJSON(list);
	 $("#searchItems").val("");
	 var skuList = parsedJson.skuLists;
	 var sku = skuList[0];
	 var contextPath = $("#contextPath").val();
	 var len = parseInt($("#productsList tr").length);
		if (len != 1)
			len = parseInt($("#productsList tr:last").attr("id").replace('dynamicdiv', '')) + 1;
		for (var i = 1; i <= len; i++) {
			if ($("#skuId" + i).val() == sku.skuId && $("#Price"+i).text() == sku.price) {
				alert("SKU ID Already Added");
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
			
			
		var costPrice = sku.costPrice;
		if(costPrice == undefined || costPrice == null)
			sku.costPrice = "";
		
		var size = sku.pack_size;
		if(size == undefined || size == null)
			sku.pack_size = "";
		
		var color = sku.color;
		if(color == undefined || color == null)
			sku.color = "";
		

		var utility = sku.utility;
		if(utility == undefined || utility == null)
			sku.utility = "";
		
		var sell_UOM = sku.sell_UOM;
		if(sell_UOM == "" || sell_UOM == null)
			sell_UOM = "_";
			
			
		var row = "<tr id='dynamicdiv"+len+"' style='margin-top:5px;'>" +
                "<td id='slNo"+len+"'>"+len+"</td>"+        
                //"<input type='hidden' id='skuId"+len+"' value='"+sku.skuId+"'/>" +
                "<input type='hidden' id='subDept"+len+"' value='"+$('input[type="radio"][name="subDepartments"]:checked').val()+"'/>"+
                "<td id='skuId"+len+"'>"+sku.skuId+"</td>" +
                "<td id='Desc"+len+"'>"+description+"</td>" +
                "<td id='UOM"+len+"'>"+sku.uom+ "</td>" +
                "<td id='color"+len+"'>"+sku.color+"</td>" +
                "<td id='size"+len+"'>"+ sku.pack_size + "</td>" +                
                "<td id='utility"+len+"'>"+sku.utility+"</td>" +
                "<td class='costprice' id='costprice"+len+"'>"+sku.costPrice+"</td>" +
                "<td class='Price' id='Price"+len+"'>"+sku.price+"</td>" +
                "<td id='Del"+len+"'>" +
                "<img id='Img"+len+"' src='"+contextPath+"/images/itemdelete.png' style='width:25px;cursor:pointer;' onclick='deleteItem(this);' title='Delete "+sku.skuId+"'/></td></tr>";
                $("#productsList tbody").append(row);
}
 
 function deleteItem(element){
		var id = $(element).attr("id").replace('Img','');
		$('#dynamicdiv'+id).remove();
	}
 
 var deletedSkuList = [];
 function deleteUpdateItem(element){
		var idAttr = $(element).attr("id").replace('Img','');
		deletedSkuList.push($("#skuId"+idAttr).val());
		$('#dynamicdiv'+idAttr).remove();
	}
 
/* 
 function validateDepartment(operation){
	 debugger;
	 var finalObj = {}, secondaryDepartments = [],skuDepartments = [];
	 if($("#deptName").val().trim() == ""){
		 $("#deptName").focus();
		 $("#deptNameError").html("Please Enter Department Name");
		 return;
	 }
	 var maxRecords = 10;
	  if($("#maxRecords").length>0)
		  maxRecords = $("#maxRecords").val();
	  var searchName= "";
	  if($("#searchDepartment").length>0)
		  searchName = $("#searchDepartment").val();
	  
	 finalObj.primaryDepartment = $("#deptName").val().trim();
	 finalObj.departmentDescription = $("#deptDesc").val().trim();
	 var subDepLen = $("#subDepartmentsList tr").length;
	 if(subDepLen == 0){
		alert("Add Atleast One Sub Department");
		return false;
	 }
	 for(var i=0;i<subDepLen;i++){
			var idAttr = $("#subDepartmentsList tr:eq("+i+")").attr("id");
			idAttr = idAttr.replace('subDepartmentTR','');
			var obj = {secondaryDepartment:$("#subDepartmentTD"+idAttr).val().trim(),departmentDescription:$("#subDepartmentDescTD"+idAttr).text()};
			secondaryDepartments.push(obj);
		}
	 finalObj.secondaryDepartments = secondaryDepartments;
	 $(".update").each(function(){
		$(this).remove();
	 });
	 var len = $("#productsList tr").length-1;
	 for(i=1;i<=len;i++){
		idAttr = $("#productsList tr:eq("+i+") td:last").attr("id");
		idAttr = idAttr.replace('Del','');
		obj = {skuId:$("#skuId"+idAttr).val().trim(),primaryDepartment:$("#deptName").val().trim(),subDepartment:$("#subDept"+idAttr).val().trim()};
		skuDepartments.push(obj);
	 }
	 finalObj.skuDepartments = skuDepartments;
	 var contextPath = $("#contextPath").val();
 	   if(operation=="new"){
 		   URL = contextPath + "/inventorymanager/createDepartment.do";
 	   }
 	   else if(operation=="edit"){
 		   URL = contextPath + "/inventorymanager/updateDepartment.do";
 		  finalObj.deletedSkuList = deletedSkuList;
 	   }
 	   finalObj.maxRecords = maxRecords;
 	   finalObj.searchCriteria = searchName;
 	   
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
 
 
 function validateDepartment(operation){
	 debugger;
	 var finalObj = {}, secondaryDepartments = [],skuDepartments = [];
	 if($("#deptName").val().trim() == ""){
		 $("#deptName").focus();
		 $("#deptNameError").html("Please Enter Department Name");
		 return;
	 }else if(parseInt($("#deptName").val().length)>15){
		 $("#deptName").focus();
			$("#deptNameError").html("Department Name can't exceeds 15 Characters");
			return;
		}
	 
	 var deptdescription = $("#deptDesc").val().trim();
	 var subdeptdescription = $("#subDeptDesc1").val().trim();
	 
	 if(deptdescription.trim() != "" && parseInt($("#deptDesc").val().length)>250){
			$("#deptDesc").focus();
			$("#deptDescError").html("Department Description can't exceeds 250 Characters");
			return false;
		}else{
			$("#deptDescError").html("");
		}
	  
	 var maxRecords = 10;
	  if($("#maxRecords").length>0)
		  maxRecords = $("#maxRecords").val();
	  var searchName= "";
	  if($("#searchDepartment").length>0)
		  searchName = $("#searchDepartment").val();
	  
	 finalObj.primaryDepartment = $("#deptName").val().trim();
	 finalObj.departmentDescription = $("#deptDesc").val().trim();
	 var subDepLen = $("#subDepartmentsList tr").length;
	 if(subDepLen == 0){
		$("#subDeptName1").focus();
		$("#subDeptName1Error").html("Add Atleast One Sub Department");
		return false;
	 }
	 if(subdeptdescription.trim() != "" && parseInt($("#subDeptDesc1").val().length)>250){
			$("#subDeptDesc1").focus();
			$("#subDeptDesc1Error").html("Sub-department Description can't exceeds 250 Characters");
			return false;
		}
	 for(var i=0;i<subDepLen;i++){
			var idAttr = $("#subDepartmentsList tr:eq("+i+")").attr("id");
			idAttr = idAttr.replace('subDepartmentTR','');
			var obj = {secondaryDepartment:$("#subDepartmentTD"+idAttr).val().trim(),departmentDescription:$("#subDepartmentDescTD"+idAttr).text()};
			secondaryDepartments.push(obj);
		}
	 finalObj.secondaryDepartments = secondaryDepartments;
	 $(".update").each(function(){
		$(this).remove();
	 });
	 var len = $("#productsList tr").length-1;
	 for(i=1;i<=len;i++){
		idAttr = $("#productsList tr:eq("+i+") td:last").attr("id");
		idAttr = idAttr.replace('Del','');
		obj = {skuId:$("#skuId"+idAttr).val().trim(),primaryDepartment:$("#deptName").val().trim(),subDepartment:$("#subDept"+idAttr).val().trim()};
		skuDepartments.push(obj);
	 }
	 finalObj.skuDepartments = skuDepartments;
	 var contextPath = $("#contextPath").val();
 	   if(operation=="new"){
 		   URL = contextPath + "/inventorymanager/createDepartment.do";
 	   }
 	   else if(operation=="edit"){
 		   URL = contextPath + "/inventorymanager/updateDepartment.do";
 		  finalObj.deletedSkuList = deletedSkuList;
 	   }
 	   finalObj.maxRecords = maxRecords;
 	   finalObj.searchCriteria = searchName;
 	   
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
 
 
 
 function viewEditDepartment(primaryDepartment,operation){
	var contextPath = $("#contextPath").val();
	
	
	 var maxRecords = 10;
	  if($("#maxRecords").length>0)
		  maxRecords = $("#maxRecords").val();
	  var searchName = "";
	  if($("#searchDepartment").length>0)
		  searchName = $("#searchDepartment").val();

    URL = contextPath + "/inventorymanager/editDepartment.do";
		$.ajax({
			type: "GET",
			url : URL,
			data : {
				primaryDepartment : primaryDepartment,
				operation : operation,
				maxRecords :maxRecords,
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
 
 function appendSkus(list,op){
	 var contextPath = $("#contextPath").val();
	 var len = parseInt($("#productsList tr").length);
	 if (len != 1)
			len = parseInt($("#productsList tr:last").attr("id").replace('dynamicdiv', '')) + 1;
	 for(var i=0;i<list.length;i++){
		 var sell_UOM = list[i].uom;
			if(sell_UOM == "" || sell_UOM == null)
				sell_UOM = "_";
			var row = "<tr id='dynamicdiv"+len+"' class='update' style='margin-top:5px;'>" +
			//"<td id='slNo"+len+"'>"+len+"</td>"+
			"<td id='Name"+len+"'>"+list[i].skuId+"" +
			"<input type='hidden' id='skuId"+len+"' value='"+list[i].skuId+"'/></td>" +
			"<input type='hidden' id='subDept"+len+"' value='"+list[i].subDepartment+"'/>"+
			"<td id='Desc"+len+"'>"+list[i].description+"</td><td id='UOM"+len+"'>"+ sell_UOM + "</td>" +
			"<td class='Price' id='Price"+len+"'>"+list[i].price+"</td>" ;
			if(op == "edit"){
				row = row + "<td id='Del"+len+"'>" +
				"<img id='Img"+len+"' src='"+contextPath+"/images/itemdelete.png' style='width:25px;cursor:pointer;' onclick='deleteUpdateItem(this);' title='Delete "+list[i].skuId+"'/></td>" ;
			}
			row = row + "</tr>";
			$("#productsList tbody").append(row);
	 }
}
 
 function searchDepartmentMaster(name, searchCategory,index){
	 debugger;
	 var contextPath = $("#contextPath").val();
	 
	 var maxRecords = 10;
	  if($("#maxRecords").length>0)
		  maxRecords = $("#maxRecords").val();
	  
	  var searchName = "";
	  if($("#searchDepartment").length>0)
		  searchName = $("#searchDepartment").val();

	 URL = contextPath + "/inventorymanager/searchDepartmentMaster.do";
	 $.ajax({
			type: "GET",
			url : URL,
			data : {
				searchName : name,
				maxRecords : maxRecords, 
				index : index,
				
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
 
 $('#searchDepartmentMaster').on('input',function(e){
		if($(this).val().trim()==""){
			viewDepartmentMaster('departmentMaster','0');
		}
	});