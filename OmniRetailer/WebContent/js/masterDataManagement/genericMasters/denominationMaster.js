

/** Written By		        : RaviTeja.N*/

/*$('#searchShipmentRate').on('input',function(e){
	if($(this).val().trim()==""){
		viewShipmentRateMaster('shipmentRateMaster','0');
	}
});
*/
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


function newDenomination(id){
	 //purpose:for checking internet conection
	var online = window.navigator.onLine;
  	if(!online)
  	{
  	alert("check your internet connection,please try agian after some time");
  	return;
  	}
	/*var denominationMaster = {}*/
	 var contextPath = $('#contextPath').val();
		URL = contextPath + "/genericMaster/newDenominationMaster.do";
		
		 $.ajax({
			type : "POST",
			url : URL,
			data : {
				/*index : index*/
			},
			beforeSend: function(xhr){                    
   	   			$("#loading").css("display","block");
   	   			$("#mainDiv").addClass("disabled");
   	   		  },
   			success : function(result) {
   				if(id != undefined)
   					activeMenu(id);
  				$("#right-side").html(result);
  				$("#loading").css("display","none");
  				$("#mainDiv").removeClass('disabled');
  			},
  			error : function() {
  				 alert("something went wrong");
  				$("#loading").css("display","none");
 				$("#mainDiv").removeClass('disabled');
  			}
  		});		   		}



/*
function validateDenomination(id){
	 //purpose:for checking internet conection
	var online = window.navigator.onLine;
  	if(!online)
  	{
  	alert("check your internet connection,please try agian after some time");
  	return;
  	}
  	debugger;
	var denominationMaster = {};
	var denominations = {};
	 var contextPath = $('#contextPath').val();
	if($("#denominationName").val().trim() == ""){
		$("#denominationName").focus();
		$("#denominationNameError").html("Enter Denomination Name");
		return;
	}
	if($("#denominationValue").val().trim() == ""){
		$("#denominationValue").focus();
		$("#denominationValueError").html("Enter Denomination Value");
		return;
	}
	if($("#denominationType").val().trim() == ""){
		$("#denominationType").focus();
		$("#denominationTypeError").html("Enter Denomination Type");
		return;
	}
	if($("#denominationCode").val().trim() == ""){
		$("#denominationCode").focus();
		$("#denominationCodeError").html("Enter Denomination Code");
		return;
	}
	
	
	if(id == 'new')
		URL = contextPath + "/genericMaster/createDenominationMaster.do";
	else
		URL = contextPath + "/genericMaster/editDenominationMaster.do";
	
		denominationMaster.denominationName=$("#denominationName").val().trim();
		denominations.denominationValue=$("#denominationValue").val();
		denominations.denominationType=$("#denominationType").val();
		denominationMaster.denominations = denominations;
		denominationMaster.denominationValue=$("#denominationValue").val().trim();
		denominationMaster.denominationType=$("#denominationType").val();
		denominationMaster.currencyCode=$("#denominationCode").val();
		denominationMaster.denominationImage=$("#denominationFile").val();
		denominationMaster.denomImageId=$("#denomination_refId").val();
		denominationMaster.description=$("#denominationDescription").val().trim();
		denominationMaster.denominationStatus=$("#denominationStatus").val();
		
		var formData = JSON.stringify(denominationMaster);
		
		console.info(formData);
		
		 $.ajax({
			 type: "POST",
				url : URL,
				contentType: "application/json",
			data :formData 
				
			,
			beforeSend: function(xhr){                    
   	   			$("#loading").css("display","block");
   	   			$("#mainDiv").addClass("disabled");
   	   		  },
   			success : function(result) {
   				if(id != undefined)
   					activeMenu(id);
  				$("#right-side").html(result);
  				$("#loading").css("display","none");
  				$("#mainDiv").removeClass('disabled');
  			},
  			error : function() {
  				 alert("something went wrong");
  				$("#loading").css("display","none");
 				$("#mainDiv").removeClass('disabled');
  			}
  		});		   		}*/

function validateDenomination(id){
	 //purpose:for checking internet conection
	var online = window.navigator.onLine;
 	if(!online)
 	{
 	alert("check your internet connection,please try agian after some time");
 	return;
 	}
 	debugger;
	var denominationMaster = {};
	var denominations = {};
	 var contextPath = $('#contextPath').val();
	if($("#denominationName").val().trim() == ""){
		$("#denominationName").focus();
		$("#denominationNameError").html("Enter Denomination Name");
		return;
	}else if(parseInt($("#denominationName").val().length)>=50){
		 $("#denominationName").focus();
		 $("#denominationNameError").html("Denomination name can't exceeds 50 characters");
		 return;
		}
	if($("#denominationValue").val().trim() == ""){
		$("#denominationValue").focus();
		$("#denominationValueError").html("Enter Denomination Value");
		return;
	}else if(parseFloat($("#denominationValue").val().length)>=6){
		 $("#denominationValue").focus();
		 $("#denominationValueError").html("Denomination value can't exceeds 6 Characters");
		 return;
		}
	if($("#denominationType").val().trim() == "" || $("#denominationType").val().trim() == null || $("#denominationType").val().trim() == undefined){
		$("#denominationType").focus();
		$("#denominationTypeError").html("Enter Denomination Type");
		return;
	}
	if($("#denominationCode").val().trim() == ""){
		$("#denominationCode").focus();
		$("#denominationCodeError").html("Enter Denomination Code");
		return;
	}
	
	var denominationdesc = $("#denominationDescription").val().trim();
	if(denominationdesc.trim() != "" && parseInt($("#denominationDescription").val().length)>=250){
			$("#denominationDescription").focus();
			$("#denominationDescriptionError").html("Description can't exceeds 250 Characters");
			return false;
		}else{
			$("#denominationDescriptionError").html("");
		}
	
	
	if(id == 'new')
		URL = contextPath + "/genericMaster/createDenominationMaster.do";
	else
		URL = contextPath + "/genericMaster/editDenominationMaster.do";
	
		denominationMaster.denominationName=$("#denominationName").val().trim();
		denominations.denominationValue=$("#denominationValue").val();
		denominations.denominationType=$("#denominationType").val();
		denominationMaster.denominations = denominations;
		denominationMaster.denominationValue=$("#denominationValue").val().trim();
		denominationMaster.denominationType=$("#denominationType").val();
		denominationMaster.currencyCode=$("#denominationCode").val();
		denominationMaster.denominationImage=$("#denominationFile").val();
		denominationMaster.denomImageId=$("#denomination_refId").val();
		denominationMaster.description=$("#denominationDescription").val().trim();
		denominationMaster.denominationStatus=$("#denominationStatus").val();
		
		var formData = JSON.stringify(denominationMaster);
		
		console.info(formData);
		
		 $.ajax({
			 type: "POST",
				url : URL,
				contentType: "application/json",
			data :formData 
				
			,
			beforeSend: function(xhr){                    
  	   			$("#loading").css("display","block");
  	   			$("#mainDiv").addClass("disabled");
  	   		  },
  			success : function(result) {
  				if(id != undefined)
  					activeMenu(id);
 				$("#right-side").html(result);
 				$("#loading").css("display","none");
 				$("#mainDiv").removeClass('disabled');
 			},
 			error : function() {
 				 alert("something went wrong");
 				$("#loading").css("display","none");
				$("#mainDiv").removeClass('disabled');
 			}
 		});		   		}


function viewEditDenomination(denominationValue,denominationType,type){
	/*if($("#searchShipmentRate").length > 0 && $("#searchShipmentRate").val().trim() != ""){
		searchShipmentRate($("#searchShipmentRate").val(), 'shipmentRateMaster',index);
			return;
		}*/
	 //purpose:for checking internet conection
	var online = window.navigator.onLine;
  	if(!online)
  	{
  	alert("check your internet connection,please try agian after some time");
  	return;
  	}
		 var contextPath = $('#contextPath').val();
		URL = contextPath + "/genericMaster/viewEditDenomination.do";
		 $.ajax({
			type : "GET",
			url : URL,
			data : {
				denominationValue : denominationValue,
				denominationType : denominationType,
				index : '0',
				type:type
			},
			beforeSend: function(xhr){                    
  	   			$("#loading").css("display","block");
  	   			$("#mainDiv").addClass("disabled");
  	   		  },
  			success : function(result) {
  				
  					
  				/*if(id != undefined)
  					activeMenu(id);*/
 				$("#right-side").html(result);
 				$("#loading").css("display","none");
 				$("#mainDiv").removeClass('disabled');
 			},
 			error : function() {
 				 alert("something went wrong");
 				$("#loading").css("display","none");
				$("#mainDiv").removeClass('disabled');
 			}
 		});		   		}




	 
//Added by vijay to implement number/fractions validations on  denomination value

$("#denominationValue").change(function(){
	//debugger;
	var numberValue = $(this).val().trim();
	
	var isNumberOrFloat =$.isNumeric(numberValue);
	

    if(isNumberOrFloat)
    	{
    		return;
    	}
    else
    	{
    		$("#denominationValueError").html("Value Should be Number or Decimals");
    		$("#denominationValue").val("");
    		$("#denominationValue").focus();
    		return;
    	}
});


				