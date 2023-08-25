/**
 * created by : Koti Bommineni 
 * Created Date : 08/03/2021
 */
 

function generatePickList(){
    	 debugger;
 		try{
 			var online = window.navigator.onLine;
 			if(!online){
 				alert("Check your internet connection,Please try agian after some time.");
 				return;
 			}
 			
 			var outletLocation = "";
			if($("#outletLocation").length > 0)
				outletLocation = $("#outletLocation").val();
			
			var startDate = "";
			if($("#from").length > 0)
				startDate = $("#from").val();
			 if(startDate == ""){
 	    		 $("#Error").html("Please Select Start Date");
 	    		$("#from").focus();
 	    		 return;
 	    	 }
			 else{
				 $("#Error").html("");
			 }
			
				var StockReqType = "";
				if($("#stockReqtype").length > 0)
					StockReqType = $("#stockReqtype").val();
				 if(StockReqType == ""){
	 	    		 $("#Error").html("Please Select Stock Req Type");
	 	    		
	 	    		 return;
	 	    	 }
			
 			var contextPath = $("#contextPath").val();
 			URL = contextPath + "/inventorymanager/generatePickList.do";
 			$.ajax({
 				type: "GET",
 				url : URL,
 				data : {
 					startDate : startDate,
 					outletLocation : outletLocation,
 					StockReqType : StockReqType
 					
 				},
 				beforeSend: function(xhr){                    
 					$("#loading").css("display","block");
 					$("#mainDiv").addClass("disabled");
 				},
 				success : function(result) {
 					$("#picklistPage").html(result);
 					
 					$("#loading").css("display","none");
 					$("#mainDiv").removeClass('disabled');
 				},
 				error : function(jqXHR, textStatus, errorThrown)  {
 					errorCode(jqXHR.status);
 					$("#loading").css("display","none");
 					$("#mainDiv").removeClass('disabled');
 				}
 			});
 		}
 		catch(e)
 		{
 			errorCode(e);
 		}
    	 
     
    
}


function assignquantity(count){
	debugger;
	var sQty = $("#storageRef"+count).val();
	sQty = sQty.split("-");
	$("select#storageRefQty"+count+"").val(sQty[1]).change();
	
}



function productStoragestocks(){
	$("#productStoragestocks tbody tr").remove();
}


function deleteItem(element){
	 debugger;
		var id = $(element).attr("id").replace('Img','');
		$('#dynamicdiv'+id).remove();
		var slNo = 1; 
		 $('.slNo').each(function(){
			$(this).text(slNo);
			slNo = parseInt(slNo) + 1;
		});
	}

function changeQuantities(count){
	debugger;
	var openQty = parseInt($("#storageRefQty"+count).val());
	var test = isNaN(openQty)
	
   if(test == true)
	openQty = 0;

	var picklistQty = parseInt($("#picklistQty"+count).text());
	var damagedQty = parseInt($("#damagedQty"+count).text());
	
	
	if(picklistQty+damagedQty >openQty){
		$("#Error").html("Picklist Qty can not be greater than open qty");
		return;
	}
	
	$("#diffQty"+count).text(openQty-picklistQty);
	$("#closedQty"+count).text(openQty-picklistQty);
	
}

function changeQuantities(count){
	debugger;
	$("#Error").html("");
	var reqQty = parseInt($("#storageRefQty"+count).val());
	var test = isNaN(reqQty)
	
   if(test == true)
	   reqQty = 0;

	var picklistQty = parseInt($("#picklistQty"+count).text());
	var damagedQty = parseInt($("#damagedQty"+count).text());
	
	
	if(picklistQty+damagedQty >reqQty){
		$("#Error").html("Picked Qty and Damaged Qty Together can not be greater than Required Qty");
		$("#picklistQty"+count).text($("#requiredQty"+count).text());
		$("#damagedQty"+count).text("0");
		return;
	}
	
	$("#diffQty"+count).text(reqQty-picklistQty);
	$("#closedQty"+count).text(reqQty-picklistQty);
}



function validatePickList(operation){
	 debugger;
	 try{
 		   var online = window.navigator.onLine;
 		   	if(!online)
 		           {
 		   	 alert("Check your internet connection,Please try agian after some time.");
 		     	 return;
 		          }
 		   $("#Error").html("");
 		   $("#Success").html("");
 		  $("#SuccessGenerate").html("");
 		  
 		   
 	   debugger;
		 var contextPath = $("#contextPath").val();
		 
		 var formData={};
		 var warehousePickListItems = [];
		 
			var outletLocation = "";
			if($("#outletLocation").length > 0)
				outletLocation = $("#outletLocation").val();
			
			var startDate = "";
			if($("#from").length > 0)
				startDate = $("#from").val();
			 if(startDate == ""){
 	    		 $("#Error").html("Please Select Start Date");
 	    		$("#from").focus();
 	    		 return;
 	    	 }
			
				var StockReqType = "";
				if($("#stockReqtype").length > 0)
					StockReqType = $("#stockReqtype").val();
				 if(StockReqType == ""){
	 	    		 $("#Error").html("Please Select Stock Req Type");
	 	    		
	 	    		 return;
	 	    	 }

					var pickListBy = "";
					if($("#picklistby").length > 0)
						pickListBy = $("#picklistby").val();
					 if(pickListBy == ""){
		 	    		 $("#Error").html("Picklist By is Required");
		 	    		
		 	    		 return;
		 	    	 }

						var pickListName = "";
						if($("#picklistName").length > 0)
							pickListName = $("#picklistName").val();
						 if(pickListName == ""){
			 	    		 $("#Error").html(" Picklist Name is Required");
			 	    		
			 	    		 return;
			 	    	 }
		 
						 var starttime = "";
							if($("#starttimeOutStr").length > 0)
								starttime = $("#starttimeOutStr").val();
							 if(starttime == ""){
				 	    		 $("#Error").html("Select Start time");
				 	    		 return;
				 	    	 }
			 
							 var endtime = "";
								if($("#endttimeOutStr").length > 0)
									endtime = $("#endttimeOutStr").val();
								 if(endtime == ""){
					 	    		 $("#Error").html("Select End time");
					 	    		
					 	    		 return;
					 	    	 }
						 
		 formData.startTimeStr = starttime ;
		 formData.endTimeStr = endtime;
		
		 formData.operation = operation;
		 /*formData.operation = pickListName;
		 formData.operation = pickListBy;*/
		 formData.pickListType = StockReqType;
		 formData.startDateStr = startDate;
		 
		if( operation == "new")
		 formData.status = "Submitted";
		 else if( operation == "draft")
		formData.status = "Draft";
		 else
	     formData.status = "Update";	 
		

		 
		 $('.slNo').each(function() {
				
			  var idAttr= $(this).attr("id").replace('itemno','');
			  
			  var storagerefid= $("#storageRef"+idAttr).val()
			  if(storagerefid != null && storagerefid != undefined && storagerefid !=""){
			  storagerefid = storagerefid.split("-");
			  storagerefid = storagerefid[0];
			  }else{
				  storagerefid = "";  
			  }
			
				var obj = {skuId:$("#skuID"+idAttr).text(),skuDescription:$("#itemName"+idAttr).text(),storageSystemId:storagerefid,openQty:$("#storageRefQty"+idAttr).val(),pickListQty:$("#requiredQty"+idAttr).text(),pickedQty:$("#closedQty"+idAttr).text(),ean:$("#scanCode"+idAttr).text(),pluCode:$("#plucode"+idAttr).val(),damagedQty:$("#damagedQty"+idAttr).text()};
				warehousePickListItems.push(obj);
			
		 });
		 formData.warehousePickListItems = warehousePickListItems;
		
		 
		 formData = JSON.stringify(formData);
         console.log(formData);
			 
		if(operation == "new" || operation == "draft") 
   	 URL = contextPath + "/warehouseMaster/createPickList.do";	
		else
	URL = contextPath + "/warehouseMaster/updatePickList.do";		
		$.ajax({
   	  type: "POST",
		  url : URL,
		 //contentType: "application/json",
  			data : {
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
  			error : function(jqXHR, textStatus, errorThrown)  {
  				 errorCode(jqXHR.status);
  				$("#loading").css("display","none");
			   $("#mainDiv").removeClass('disabled');
  			}
  		});

 	   }
 	   catch(e)
 	   	{
 	   	        errorCode(e);
 	   }
}