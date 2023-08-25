$('#searchCategory').on('input',function(e){
	if($(this).val().trim()==""){
		viewCategoryMaster('categoryMaster','0');
	}
});


function searchCategoryMaster(name, searchCategory,index){
	 var contextPath = $("#contextPath").val();
	 //purpose:for checking internet conection
		var online = window.navigator.onLine;
	  	if(!online)
	  	{
	  	alert("check your internet connection,please try agian after some time");
	  	return;
	  	}
	 var maxRecords = 10;
	 if($("#maxRecords").length>0)
		  maxRecords = $("#maxRecords").val();

	 URL = contextPath + "/outletMaster/searchCategoryMaster.do";
	 $.ajax({
			type: "GET",
			url : URL,
			data : {
				searchName : name,
				index : index,
				maxRecords : maxRecords
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


/*function saveCategory(operation){
	 //purpose:for checking internet conection
	var online = window.navigator.onLine;
  	if(!online)
  	{
  	alert("check your internet connection,please try agian after some time");
  	return;
  	}
  	debugger;
	var contextPath = $("#contextPath").val();
    var categoryName = $("#categoryName").val();
    var categoryDescription = $("#categoryDescription").val();
    var b2cCategory = $("#b2cvisibility").val();
    var image=$("#categoryFile").val();
    var banner=$("#categorybannerFile").val() ;
    
    var maxRecords = 10;
 	  if($("#maxRecords").length>0)
 		  maxRecords = $("#maxRecords").val();
 		 var searchName = "";
 	   	  if($("#searchCategory").length>0)
 	   	searchName = $("#searchCategory").val();
    
    var priority="";
    if($("#categoryPriority").length>0)
    	priority = $("#categoryPriority").val().trim();
    var imageId=""
    if(categoryName.trim() == ""){
    	 $("#categoryName").focus();
    	$("#categoryNameError").html("Category Name is Required");
    	
    	return false;
    }
    if(categoryDescription.trim() == ""){
    	$("#categoryDescription").focus();
    	$("#categoryDescriptionError").html("Category Description is Required");
    	
    	return false;
    }
    if(operation=="new"){
    	imageId=$("#category_refId").val();
    	bannerId=$("#categorybanner_refId").val();
     URL = contextPath + "/outletMaster/saveCategory.do";
   	}
   	else if(operation=="edit"){
//   		imageId=$("#category_url").val();
   		imageId=$("#category_refId").val();
   		bannerId=$("#categorybanner_refId").val();
   	 URL = contextPath + "/outletMaster/updateCategory.do";
   	}
    image:$("#categoryFile").val();
	
   	
    var finalObj={}
   
    finalObj.categoryName = categoryName.trim();
    finalObj.categoryDescription = categoryDescription.trim();
    finalObj.image=image;
    finalObj.imageId=imageId;
    finalObj.banner =banner;
    finalObj.bannerId =bannerId;
    finalObj.sortOrder = priority;
    finalObj.maxRecords = maxRecords;
    finalObj.b2cCategory = b2cCategory;
    
    finalObj.searchCriteria = searchName;
     var  formData=JSON.stringify(finalObj);
	
	$.ajax({
			type: "POST",
			url : URL,
			data:formData,
			contentType: "application/json",
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

function saveCategory(operation){
	 //purpose:for checking internet conection
	var online = window.navigator.onLine;
 	if(!online)
 	{
 	alert("check your internet connection,please try agian after some time");
 	return;
 	}
 	debugger;
	var contextPath = $("#contextPath").val();
   var categoryName = $("#categoryName").val();
   var categoryDescription = $("#categoryDescription").val();
   var b2cCategory = $("#b2cvisibility").val();
   var image=$("#categoryFile").val();
   var banner=$("#categorybannerFile").val() ;
   var businessActivity=$("#businessActivity").val() ;

     
   
   var maxRecords = 10;
	  if($("#maxRecords").length>0)
		  maxRecords = $("#maxRecords").val();
		 var searchName = "";
	   	  if($("#searchCategory").length>0)
	   	searchName = $("#searchCategory").val();
   
   var priority="";
   if($("#categoryPriority").length>0)
   	priority = $("#categoryPriority").val().trim();
   var imageId=""
   if(categoryName.trim() == ""){
   	 $("#categoryName").focus();
   	$("#categoryNameError").html("Category Name is Required");
   	return false;
   }else if(parseInt($("#categoryName").val().length)>=100){
   	 $("#categoryName").focus();
   	 $("#categoryNameError").html("Category Name can't exceeds 100 Characters");
    	return false;
   }
   if(categoryDescription.trim() == ""){
   	$("#categoryDescription").focus();
   	$("#categoryDescriptionError").html("Category Description is Required");
   	return false;
   }else if(parseInt($("#categoryDescription").val().length)>=250){
  	 $("#categoryDescription").focus();
	 $("#categoryDescriptionError").html("Description can't exceeds 250 Characters");
	return false;
}
   if(operation=="new"){
   	imageId=$("#category_refId").val();
   	bannerId=$("#categorybanner_refId").val();
    URL = contextPath + "/outletMaster/saveCategory.do";
  	}
  	else if(operation=="edit"){
//  		imageId=$("#category_url").val();
  		imageId=$("#category_refId").val();
  		bannerId=$("#categorybanner_refId").val();
  	 URL = contextPath + "/outletMaster/updateCategory.do";
  	}
   image:$("#categoryFile").val();
	
  	
   var finalObj={}
  
   finalObj.categoryName = categoryName.trim();
   finalObj.categoryDescription = categoryDescription.trim();
   finalObj.image=image;
   finalObj.imageId=imageId;
   finalObj.banner =banner;
   finalObj.bannerId =bannerId;
   finalObj.sortOrder = priority;
   finalObj.maxRecords = maxRecords;
   finalObj.b2cCategory = b2cCategory;
   finalObj.businessActivity = businessActivity; 
   
   
   finalObj.searchCriteria = searchName;
    var  formData=JSON.stringify(finalObj);
	
	$.ajax({
			type: "POST",
			url : URL,
			data:formData,
			contentType: "application/json",
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

function viewEditCategory(categoryName,operation){
	 var contextPath = $("#contextPath").val();
	 //purpose:for checking internet conection
		var online = window.navigator.onLine;
	  	if(!online)
	  	{
	  	alert("check your internet connection,please try agian after some time");
	  	return;
	  	}
	 var maxRecords = 10;
	  if($("#maxRecords").length>0)
		  maxRecords = $("#maxRecords").val();
	  
		 var searchCategory = 10;
		  if($("#searchCategory ").length>0)
			  searchCategory = $("#searchCategory ").val();
	  
	 URL = contextPath + "/outletMaster/editCategory.do";
	$.ajax({
		type: "GET",
		url : URL,
		data : {
			categoryName : categoryName,
			operation : operation,
			maxRecords : maxRecords,
			searchName: searchCategory 
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
