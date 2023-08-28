$(document).ready(function(){
	
});
$('newFeaturedProductGroup').on('input',function(e){
	if($(this).val().trim()==""){
		viewFeaturedProductGroup('newFeaturedProduct','0');
	}
});


function searchFeaturedproducts(name,searchCategory,index){
	 var startDate = "";
	 var endDate = "";
	//modified  by manasa
		if($("#featurefrom").val() != "" && $("#featureto").val() != ""){
			var noOfDays = daydiff(parseDate($('#featurefrom').val()), parseDate($('#to').val()));
			 if(noOfDays < 0){
				 alert("Start Date can't be less than End Date");
				 return;
			 }
			 startDate = $("#featurefrom").val();
			 endDate = $("#featureto").val();
		}else if($("#featurefrom").val() != "")
			 startDate = $("#featurefrom").val();
		else if($("#featureto").val() != "")
			endDate = $("#featureto").val();
		
		var maxRecords = 10;
		 if($("#maxRecords").length>0)
			 maxRecords = $("#maxRecords").val();
		 var featuredType = $("#featuredType").val();
 		 var contextPath = $("#contextPath").val();
 		 URL = contextPath + "/b2c/searchFeaturedProductsGroup.do";
 		 $.ajax({
 				type: "GET",
 				url : URL,
 				data : {
 					searchName : name,
 					index : index,
 					maxRecords : maxRecords,
 					startDate : startDate,
					endDate : endDate,
					featuredType:featuredType,
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
function getProductsByCriteria(name, searchCategory, index) {
	var category=$("#category").val();
	if($("#category").val().trim() == ""){
		alert("Please select a category")
		return;
	}
	var brandcode=$("#brandcode").val();
	var contextPath = $("#contextPath").val();
	URL = contextPath + "/b2c/getProductsByCriteria.do";
	var pricerange= $("#pricerange").val();
	var maxRecords = $("#maxRecords").val();
	console.info(pricerange+""+pricerange);
	$.ajax({
		type : "GET",
		url : URL,
		data : {
			searchName : name,
			index : index,
			category : category,
			brand:brandcode,
			priceRange:pricerange,
			maxRecords:"-1",
		},
		beforeSend : function(xhr) {
			$("#loading").css("display", "block");
			$("#mainDiv").addClass("disabled");
		},
		success : function(result) {
			appendproductsbyfilter(result,searchCategory)
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

//soumya vatte
function searchFeaturedGroup(name,searchCategory,index){
	 var contextPath = $("#contextPath").val();
	 URL = contextPath + "/b2c/searchFeaturedProducts.do";
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
				$('#right-side').html(result);
				$("#loading").css("display","none");
				$("#mainDiv").removeClass('disabled')
			},
			error : function() {
				 alert("something went wrong");
				 $("#loading").css("display","none");
	 			 $("#mainDiv").removeClass('disabled');
			}
		});
}


//chaithanya
function viewEditFeaturedGroup(featuredId,operation){
	 var contextPath = $("#contextPath").val();
	 
	 
	//added by manasa
		var formData={}
		 formData.featuredType = $("#featuredType").val();
		formData.startDateStr = $("#from").val();
		 formData.endDateStr = $("#to").val();
		 var formData = JSON.stringify(formData);
	 
	 URL = contextPath + "/b2c/viewEditFeaturedProducts.do";
	$.ajax({
		type: "GET",
		url : URL,
		data : {
			featuredId : featuredId,
			operation : operation,
			formData : formData
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
	 //-------------------------------------------------------sreedhar----
	 function searchProducts(name, searchCategory){
		 var contextPath = $("#contextPath").val();
		 var categoryName = $("#category").val();
		 if(categoryName=="Select"){
			 categoryName = "";
		 }
		 
		 URL = contextPath + "/b2c/searchProductsOnCategoryBasis.do";
		 $.ajax({
				type: "GET",
				url : URL,
				data : {
					searchName : name,
					categoryName: categoryName,
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
	 /* display based on select in dropdown list--*/
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

	 function appendproductsbyfilter(productsList,searchCategory){
		 var contextPath = $("#contextPath").val();
		 var appendtype=$("#featurededit").val();
		 var len = parseInt($("#productsList tr").length);
			if (len != 1)
				len = parseInt($("#productsList tr:last").attr("id").replace('dynamicdiv', '')) + 1;
			len=len-2;
		/* if(appendtype == 'new'){
			 $("#productsList tbody").html('');
		 }*/
		 if(productsList.length =='0'){
			alert("no results found");
		 }
		 //$("#productsList tbody").html('');
		 for(var i=0;i<productsList.length;i++){
			 len=len+1;
			 var pic='picture'+len;
			 var sno=1+len;
			 var row ="<tr id='dynamicdiv"+len+"' style='margin-top:5px;'><td class='slno' id='sno"+len+"'>"+sno+
				 "<td id='skuId"+len+"'>"+productsList[i].skuId+"</td>"+
				"<td id='productDescription"+len+"'>"+productsList[i].skuDescription+"</td>" +
				"<td id='skuImage"+ len +"'>"+
				"<div id='picture"+len+"image'></div>" +
				"<input type='file'  id='picture"+len+"' onchange=loadImageFileAsURL('"+pic+"',this); style='' />"+
	                 "<input type='hidden' id='picture"+len+"_refId' name='picture' />"+
	                  "<input type='hidden' id='picture"+len+"_name' />" +
	                  
	                  		"</td>"+
				"<td><input id='featuredText"+len+"' type='textbox' value='' /></td>" +

				"<td id='Del"+ len +"' ><img id='Img"+ len +"' src='"+contextPath+"/images/itemdelete.png' style='width:25px;cursor:pointer;' onclick='deleteItem(this);' title='Delete "+productsList[i].skuDescription+"'/>" +
				"</td></tr>";
			 $("#productsList tbody").append(row);
		 }
	}
	 function getId(element,type){
		 $("#searchItems").val("")
		 var contextPath = $("#contextPath").val();
		var id= $(element).attr("id");
	var categoryName=$("#category").val();
//		 var subCategory=$("#sub_category").val();
			var len = parseInt($("#productsList tr").length);
			if (len != 1)
				len = parseInt($("#productsList tr:last").attr("id").replace('dynamicdiv', '')) + 1;
			for (var i = 1; i <= len; i++) {
				if ($("#productId" + i).val() == id) {
					return;
				}
			}
			description =  $("#"+id).children("a").text();
			description = description.split(' ( ');
			description = description[0];
			var label = $(element).children("a").text();
			var splittedString=label.split('   (   ');
			var productName=splittedString[0];
//			var description=splittedString[1].replace('   )','');
			var slNo = 1; 
			 $('.slno').each(function(){
				$(this).text(slNo);
				slNo = parseInt(slNo) + 1;
			});
			 var pic='picture'+len;
			 var row ="<tr id='dynamicdiv"+len+"' style='margin-top:5px;'><td class='slno' id='sno"+len+"'>"+len+
				 "<td id='skuId"+len+"'>"+id+"</td>"+
				"<input type='hidden' id='categoryName"+len+"' value='"+ categoryName+"'/>" +
				"<td id='productDescription"+len+"'>"+description+"</td>" +
				"<td id='skuImage"+ len +"'>"+
				"<div class='col-lg-3 col-sm-3 col-xs-3'><div id='picture"+len+"image'></div></div>" +
				"<div class='col-lg-9 col-sm-9 col-xs-9'><input type='file'  id='picture"+len+"' onchange=loadImageFileAsURL('"+pic+"',this); style='' />"+
	                 "<input type='hidden' id='picture"+len+"_refId' name='picture' />"+
	                  "<input type='hidden' id='picture"+len+"_name' /></div>" +
	                  
	                  		"</td>"+
				"<td><input id='featuredText"+len+"' type='textbox' value='' /></td>" +

				"<td id='Del"+ len +"' ><img id='Img"+ len +"' src='"+contextPath+"/images/itemdelete.png' style='width:25px;cursor:pointer;' onclick='deleteItem(this);' title='Delete "+productName+"'/>" +
				"</td></tr>";
			 $("#productsList tbody").append(row);

	}
	 
	 function loadImageFileAsURL(id,ele) {
			$("."+id+"Error").text("");
			$("#"+id+"Error").text("");
			var filesSelected = document.getElementById(id).files;
			if (filesSelected.length > 0) {
				var fileToLoad = filesSelected[0];
				 var fsize = fileToLoad.size;
				if (fileToLoad.type.match("image.*")) {
					var name = fileToLoad['name'];
					$("#"+id+"_name").val(name);
					var fileReader = new FileReader();
					fileReader.onload = function(fileLoadedEvent) {
						var byteVal = fileLoadedEvent.target.result;
						/*var index = byteVal.indexOf(',');*/
					/*	byteVal = byteVal.substring(index + 1);*/
						/*
						 * var imageLoaded = document.createElement("img");
						 * imageLoaded.src = fileLoadedEvent.target.result;
						 * alert(imageLoaded); document.body.appendChild(imageLoaded);
						 */
						/*$("#" + id + "byte").val(byteVal);*/
						$("#"+id+"image").html("");
						$("#" + id + "image").html(
								'<img style="width:65px;height:50px;float:left" src=' + fileLoadedEvent.target.result + '>');

					};
					fileReader.readAsDataURL(fileToLoad);
					var oMyForm = new FormData();
			        oMyForm.append("file",  ele.files[0]);
			        if($("#"+id+"_refId").val() != "")
			        	oMyForm.append("refId",  $("#"+id+"_refId").val().trim());
			        else
			        	oMyForm.append("refId", "");
			        var contextPath = $("#contextPath").val();
			        var URL = contextPath + "/b2c/addToAttachementList.do";
			        $.ajax({
//							dataType : 'json',
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
	 }

			function validateFeaturedProductGroupMasterForm(operation){
				var featuredproducts = {}, productList = [];
				if($("#featuredGroup").val().trim() == ""){
					$("#featuredGroup").focus();
						$("#groupNameError").html("Enter Featured Group Name");
						return;
					}
				if($("#featuredTitle").val().trim() == ""){
					$("#featuredTitle").focus();
					$("#featuredTitleError").html("Enter Featured Group title");
					return;
				}
				
				 if(parseInt($("#featuredTitle").val().length)>150){
					  $("#featuredTitle").focus();
					  $("#Error").html("Title can't exceeds 150 Characters");
						return;
				} else{
				 $("#Error").html(" ");
			    }
				
				 if(parseInt($("#approvedByFeatured").val().length)>25){
					  $("#approvedByFeatured").focus();
					  $("#Error").html("Approved By can't exceeds 25 Characters");
						return;
				} else{
				 $("#Error").html(" ");
			   }
				
				var re = /^[0-9/]+$/;
				 if($(".startDateFeatured").val().trim() == ""){
					 $("#startDateFeatured").focus();
						$("#startDateError").html("Enter a Date");
						return;
				 }
				 if(!re.test($(".startDateFeatured").val())){
					 $("#startDateFeatured").focus();
						$("#startDateError").html("Invalid Date");
						return;
				 }
				 if($(".toDateFeatured").val().trim() != ""){
					 if(!re.test($(".toDateFeatured").val())){
						 $("#toDateFeatured").focus();
							$("#endDateError").html("Invalid Date");
							return;
					 }
					 var noOfDays = daydiff(parseDate($('.startDateFeatured').val()), parseDate($('.toDateFeatured').val()));
					 if(noOfDays < 0){
						 $("#endDateError").html("End Date can't be less than Start Date");
						 return;
					 }
				 }
				 
				 if(parseInt($("#description").val().length)>200){
					  $("#description").focus();
					  $("#Error").html("Description can't exceeds 200 Characters");
						return;
				} else{
				 $("#Error").html(" ");
			    }
				 
				    var len = parseInt($("#productsList tr").length);
					if(len <= 1){
						alert("Add Atleast One Item");
						return false;
						}
					/* $(".update").each(function(){
							$(this).remove();
						 });*/
					 var len = parseInt($("#productsList tr").length);
					 featuredproducts.featureId = $("#featuredGroup").val();
					 featuredproducts.status = $("#status").val();
					 featuredproducts.description = $("#description").val();
					 featuredproducts.featuredTitle = $("#featuredTitle").val();
					 featuredproducts.startDateStr = $(".startDateFeatured").val()+ " 00:00:00";
					 featuredproducts.endDateStr = $(".toDateFeatured").val()+ " 00:00:00";
					 featuredproducts.approvedBy = $("#approvedByFeatured").val();
					 featuredproducts.featuredType = $("#featuredtype").val();
					 var category= $("#category").val();
					 featuredproducts.productCategory = $("#category").val();
					 if(category == "Select"){
						 featuredproducts.productCategory="Select";
					 }
					 
				/*	if($("#groupImageimage").length > 0)
						productGroupMaster.imageFlag = "true";
					else
						productGroupMaster.imageFlag = "false";*/
					for(var i=1;i<len;i++){
						var idAttr = $("#productsList tr:eq("+i+") td:last").attr("id");
						idAttr = idAttr.replace('Del','');
						var obj = {skuId:$("#skuId"+idAttr).text(),productDescription:$("#productDescription"+idAttr).text(),sno:$("#itemno"+idAttr).val(),skuImageRefId:$("#picture"+idAttr+"_refId").val(),skuImage:$("#picture"+idAttr+"_name").val(),skuImageFlag:true,featuredText:$("#featuredText"+idAttr).val()};
						productList.push(obj);
					}
					featuredproducts.productList = productList;
					var contextPath = $("#contextPath").val();
				   if(operation=="new"){
					   URL = contextPath + "/b2c/createFeatureProductGroupMaster.do";
				   }
				   else if(operation=="edit"){
					   URL = contextPath + "/b2c/updateFeatureProductGroupMaster.do";
					   featuredproducts.featureId = $("#featuredGroup").val();
				   }
					var formData = JSON.stringify(featuredproducts);
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
	
		
			$("#group_name").keydown(function(){
				   $("#groupNameError").html("");
				   $(".Error").html("");
			}); 

			var deletedPlus =[];
			function plusList(element) {
				var idAttr=$(element).attr("id").replace('textComments','');
				deletedPlus.push($("#skuId"+idAttr).text());
				$('#dynamicdiv'+idAttr).removeClass("update");
			}
			function deleteItem(element){
				var id = $(element).attr("id").replace('Img','');
				deletedPlus.push($("#skuId"+id).text());
				$('#dynamicdiv'+id).remove();
			}
		 function searchFeaturedGroup(name, searchCategory,index){
			 var contextPath = $("#contextPath").val();
			 URL = contextPath + "/b2c/searchFeaturedGroup.do";
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
		 
		 $('#searchDepartmentMaster').on('input',function(e){
				if($(this).val().trim()==""){
					viewDepartmentMaster('departmentMaster','0');
				}
			});

	
	 