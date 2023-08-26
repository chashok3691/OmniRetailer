$('#searchSubCategory').on('input',function(e){
	if($(this).val().trim()==""){
		viewSubCategoryMaster('subCategoryMaster','0');
	}
});

function searchSubCategoryMaster(name,searchCategory,index){
	 //purpose:for checking internet conection
	var online = window.navigator.onLine;
  	if(!online)
  	{
  	alert("check your internet connection,please try agian after some time");
  	return;
  	}
	 var contextPath = $("#contextPath").val();
	 URL = contextPath + "/outletMaster/searchSubCategoryMaster.do";
	 var maxRecords = 10;
	  if($("#maxRecords").length>0)
		  maxRecords = $("#maxRecords").val();
	  
	  
	  name ="";
	  if($("#searchSubCategory").length>0)
		  name = $("#searchSubCategory").val().trim();
	  
	  var searchName ="";
	  if($("#searchSupplier").length>0)
		  searchName = $("#searchSupplier").val().trim();

	 
	 $.ajax({
			type: "GET",
			url : URL,
			data : {
				searchName : name,
				index : index,
				maxRecords : maxRecords,
 				

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

/*function saveSubCategory(operation){
	 //purpose:for checking internet conection
	var online = window.navigator.onLine;
  	if(!online)
  	{
  	alert("check your internet connection,please try agian after some time");
  	return;
  	}
  	debugger;
	var contextPath = $("#contextPath").val();
    var categoryName = $("#categoryName :selected").val();
    var subcategoryName = $("#subCategoryName").val().trim();
    var subcategoryDescription = $("#subCategoryDescription").val().trim();
    var imageId="";
    var  image=$("#subCategoryFile").val();
    
    if(subcategoryName.trim() == ""){
    	 $("#subCategoryName").focus();
    	$("#subCategoryNameError").html("Sub Category Name Required");
    	return false;
    }
    if(subcategoryDescription.trim() == ""){
    	$("#subCategoryDescription").focus();
    	$("#subCategoryDescriptionError").html("Sub Category Description Required");
    	return false;
    }
    if(operation=="new"){
      imageId=$("#subCategory_refId").val();
	  URL = contextPath + "/outletMaster/saveSubCategory.do";
	}
   	else if(operation=="edit"){
    imageId=$("#subCategory_refId").val();
   	 URL = contextPath + "/outletMaster/updateSubCategory.do";
   	}

	

   
   var subcategorySections =[]; var finalObj = {},obj = {};
    
    $("#sectionsList > option").each(function(){
    
    	obj={sectionName:$(this).val()}
    	subcategorySections.push(obj);
    });
    if($("#maxRecords").length>0)
		  maxRecords = $("#maxRecords").val();
    var searchName ="";
    if($("#searchSubCategory").length>0)
    	searchName = $("#searchSubCategory").val();


    
    
    finalObj.categoryName=categoryName;
    finalObj.subcategoryName=subcategoryName;
    finalObj.subcategoryDescription=subcategoryDescription.trim();
    finalObj.subcategorySections=subcategorySections;
    finalObj.image=image;
    finalObj.imageId=imageId;
    
    finalObj.maxRecords = maxRecords;
    finalObj.searchCriteria = searchName;
   finalObj.image = $("#bannerImageFile").val();
	finalObj.thumbnail_name = $("#bannerThumbnailFile").val();
	finalObj.imageId = $("#bannerImage_refId").val();
	finalObj.bannerThumbnailRefId = $("#bannerThumbnail_refId").val();
    
    var formData = JSON.stringify(finalObj);
     console.info(formData);
		$.ajax({
			type: "POST",
			url : URL,
			contentType: "application/json",
		
			data :formData,
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

function saveSubCategory(operation){
	 //purpose:for checking internet conection
	var online = window.navigator.onLine;
 	if(!online)
 	{
 	alert("check your internet connection,please try agian after some time");
 	return;
 	}
 	debugger;
	var contextPath = $("#contextPath").val();
   var categoryName = $("#categoryName :selected").val();
   var subcategoryName = $("#subCategoryName").val().trim();
   var subcategoryDescription = $("#subCategoryDescription").val().trim();
   var imageId="";
   var  image=$("#subCategoryFile").val();
   
   if(subcategoryName.trim() == ""){
   	 $("#subCategoryName").focus();
   	$("#subCategoryNameError").html("Sub Category Name Required");
   	return false;
   }else if(parseInt($("#subCategoryName").val().length)>=100){
		 $("#subCategoryName").focus();
			$("#subCategoryNameError").html("subcategory can't exceeds 100 Characters");
			return;
		}
   if(subcategoryDescription.trim() == ""){
   	$("#subCategoryDescription").focus();
   	$("#subCategoryDescriptionError").html("Sub Category Description Required");
   	return false;
   }else if(parseInt($("#subCategoryDescription").val().length)>=250){
		 $("#subCategoryDescription").focus();
			$("#subCategoryDescriptionError").html("Subcategory can't exceeds 250 Characters");
			return;
		}
   if(operation=="new"){
     imageId=$("#subCategory_refId").val();
	  URL = contextPath + "/outletMaster/saveSubCategory.do";
	}
  	else if(operation=="edit"){
   imageId=$("#subCategory_refId").val();
  	 URL = contextPath + "/outletMaster/updateSubCategory.do";
  	}

	

  
  var subcategorySections =[]; var finalObj = {},obj = {};
   
   $("#sectionsList > option").each(function(){
   
   	obj={sectionName:$(this).val()}
   	subcategorySections.push(obj);
   });
   if($("#maxRecords").length>0)
		  maxRecords = $("#maxRecords").val();
   var searchName ="";
   if($("#searchSubCategory").length>0)
   	searchName = $("#searchSubCategory").val();


   
   
   finalObj.categoryName=categoryName;
   finalObj.subcategoryName=subcategoryName;
   finalObj.subcategoryDescription=subcategoryDescription.trim();
   finalObj.subcategorySections=subcategorySections;
   finalObj.image=image;
   finalObj.imageId=imageId;
   
   finalObj.maxRecords = maxRecords;
   finalObj.searchCriteria = searchName;
  /*finalObj.image = $("#bannerImageFile").val();*/
	/*finalObj.thumbnail_name = $("#bannerThumbnailFile").val();*/
/*	finalObj.imageId = $("#bannerImage_refId").val();*/
	/*finalObj.bannerThumbnailRefId = $("#bannerThumbnail_refId").val();*/
   
   var formData = JSON.stringify(finalObj);
    console.info(formData);
		$.ajax({
			type: "POST",
			url : URL,
			contentType: "application/json",
		
			data :formData,
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


function viewEditSubCategory(subcategoryName,operation){
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
if($("#searchSubCategory").length>0)
 searchName = $("#searchSubCategory").val();

	 URL = contextPath + "/outletMaster/editSubCategory.do";
	 
	 
	 
	$.ajax({
		type: "GET",
		url : URL,
		data : {
			subcategoryName : subcategoryName,
			operation : operation,
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

}


function addNameToTextBox(id,ele){
	
	if($("#"+id+"Btn")[0].files[0] != undefined){
		$("#"+id+"File").val($("#"+id+"Btn")[0].files[0]['name']);
		loadImageFileAsURL(id,ele);
	}
		
	else
		$("#"+id+"File").val("");

}


/*function loadImageFileAsURL(id,ele) {
	$("."+id+"Error").text("");
	$("#"+id+"Error").text("");
	var filesSelected = document.getElementById(id).files;
	if (filesSelected.length > 0) {
		var fileToLoad = filesSelected[0];
		 var fsize = fileToLoad.size;
		if (fileToLoad.type.match("image.*")) {
			if((fsize <= 70000 && id == "bannerThumbnail") || id == "bannerImage" ){
			var name = fileToLoad['name'];
			$("#"+id+"File").val(name);
			var fileReader = new FileReader();
			fileReader.onload = function(fileLoadedEvent) {
				var byteVal = fileLoadedEvent.target.result;
				var index = byteVal.indexOf(',');
				byteVal = byteVal.substring(index + 1);
				
				 * var imageLoaded = document.createElement("img");
				 * imageLoaded.src = fileLoadedEvent.target.result;
				 * alert(imageLoaded); document.body.appendChild(imageLoaded);
				 
				$("#" + id + "byte").val(byteVal);
				$("#" + id + "image").html(
						'<img style="width:65px;height:50px;" src=' + fileLoadedEvent.target.result + '>');

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
			 }else{
        		$("#"+id+"Error").text("Select Image < 70kb");
	        	return;
        	} 
		}
	}
}*/

function loadImageFileAsURL(id,ele) {
	if (ele.files && ele.files[0]) {
        var reader = new FileReader();

        reader.onload = function (e) {
        	$("#"+id+"_label").css("display","none");
        	$("#" + id + "_image").html("");//added
        	$("#" + id + "_image").append('<img class="thumbnail companyimage" id="'+id+'_thumbnail" src=' + e.target.result + ' style="">');
        };

        reader.readAsDataURL(ele.files[0]);
       
        var oMyForm = new FormData();
        oMyForm.append("file",  ele.files[0]);

        if($("#"+id+"_refId").val() != "")
        	oMyForm.append("refId",  $("#"+id+"_refId").val());
       
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
};
