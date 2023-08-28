
//assetmaster
$("#searchAsset").keydown(function(e){
	$("#assetNameError").html("");
	if($("#searchAsset").val().length<3){
		$("#asset").val("");
	}
	$(".assetMaster").children("li").each(function(){
		var assetName = $(this).children("a").text().trim();
		if($("#searchAsset").val().trim().toLowerCase() == supplierName.toLowerCase()){
			$("#searchAsset").val($("#searchAsset").val().trim());
			$("#asset").val($(this).attr("id"));
			$(".services").hide();
			$(".matchedStringUl").html("");
			return;
		}
		else{
			$("#asset").val("");
		}
	});
	if(e.keyCode == 9){
		if($("#searchAsset").val()!="" && $("#asset").val() == ""){
			$("#assetNameError").html("Asset Name doesn't exist");
		}
		$(".services").hide();
		$(".matchedStringUl").html("");
	}
});
//viswanath
$('#searchAsset').on('input',function(e){
	if($(this).val().trim()==""){
		viewAssetMaster('assetMaster','0');
	}
});

function searchAssetMaster(name,searchCategory,index){
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
 		  maxRecords = $("#maxRecords").val().trim();;
	 
	 URL = contextPath + "/genericMaster/searchAssetMaster.do";
	 $.ajax({
			type: "GET",
			url : URL,
			data : {
				searchName : name,
				index : index,
				maxRecords: maxRecords
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

$("#assert_name").keydown(function(){
	   $("#assetNameError").html("");
	   $(".Error").html("");
}); 

$("#category").keydown(function(){
	   $("#assetCategoryError").html("");
	   $(".Error").html("");
}); 
 
$("#serialNo").keydown(function(){
	   $("#serialNumberError").html("");
	   $(".Error").html("");
}); 
$("#manufacturer").keydown(function(){
	   $("#manufacturerError").html("");
	   $(".Error").html("");
});
$("#aquiredDate").keydown(function(){
	   $("#aquiredDateError").html("");
	   $(".Error").html("");
}); 

function validateAssetMasterForm(operation){
	
	 //purpose:for checking internet conection
	var online = window.navigator.onLine;
  	if(!online)
  	{
  	alert("check your internet connection,please try agian after some time");
  	return;
  	}
	var assetMaster = {};
	if($("#assert_name").val().trim() == ""){
		$("#assert_name").focus();
		$("#assetNameError").html("Enter Asset Name");
		return;
	}
	if($("#category").val().trim() == ""){
		$("#category").focus();
		$("#assetCategoryError").html("Enter Asset Category");
		return;
	}
	if($("#serialNo").val().trim() == ""){
		$("#serialNo").focus();
		$("#serialNumberError").html("Enter Serial Number");
		return;
	}
	if($("#manufacturer").val().trim() == ""){
		$("#manufacturer").focus();
		$("#manufacturerError").html("Enter Manufacturer");
		return;
	}

	if($("#aquiredDate").val().trim() == ""){
		$("#aquiredDate").focus();
		$("#aquiredDateError").html("Select Date");
		return;
	}
	
	
	  var maxRecords = 10;
  	  if($("#maxRecords").length>0)
  		  maxRecords = $("#maxRecords").val();
  	  
  	  var searchName ="";
  	  if($("#searchAsset").length>0)
	  searchName = $("#searchAsset").val();	 

	
	assetMaster.assetName = $("#assert_name").val();
	assetMaster.assetCategory = $("#category").val();
	assetMaster.serialNum = $("#serialNo").val();
	assetMaster.manufacturer = $("#manufacturer").val();
	assetMaster.dateStr = $("#aquiredDate").val();
	if($("#cost").val() != "")
		assetMaster.cost = $("#cost").val();
	assetMaster.assetStatus = $("#assetStatus").val();
	assetMaster.quantity = $("#quantity").val();
	assetMaster.assetRefNum = $("#assetRefNumber").val();
	assetMaster.costCenter = $("#costCenter").val();
	assetMaster.model = $("#model").val();
	assetMaster.status = $("#status").val();
	assetMaster.location = $("#location").val();
	assetMaster.maintainedBy = $("#maintainedBy").val();
	assetMaster.assetDetails = $("#assetDetails").val();
	assetMaster.maxRecords = maxRecords;
	assetMaster.searchCriteria = searchName;
	
		var formData = JSON.stringify(assetMaster);
//		console.log(formData);
		var contextPath = $("#contextPath").val();
	   if(operation=="new"){
		   URL = contextPath + "/genericMaster/createAssetMaster.do";
	   }
	   else if(operation=="edit"){
		   
		   URL = contextPath + "/genericMaster/updateAssetMaster.do";
	   }
	   
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

//viswanath
	function viewEditAsset(assetName,operation){
		 //purpose:for checking internet conection
		var online = window.navigator.onLine;
	  	if(!online)
	  	{
	  	alert("check your internet connection,please try agian after some time");
	  	return;
	  	}
		 var contextPath = $("#contextPath").val();
			var maxRecords = 10;
	 		if ($("#maxRecords").length > 0)
	 			maxRecords= $("#maxRecords").val();
	 		  var searchName ="";
	 	  	  if($("#searchAsset").length>0)
	 		  searchName = $("#searchAsset").val();	 

		 URL = contextPath + "/genericMaster/editAsset.do";
		$.ajax({
			type: "GET",
			url : URL,
			data : {
				AssetName: assetName,
				operation : operation,
				maxRecords: maxRecords,
				searchName: searchName
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



