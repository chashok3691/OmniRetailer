/*******************************************************************************
 * Copyright  2015 Omni Retailer Customer Console, All rights reserved.
 * Author : Sahitya P
 * Created On : 1-4-2015
 * 
 * Licensed under the Technolabs Software License, Version 1.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 * 
 *   http://www.technolabssoftware.com/pages/privacy-policy/
 * 
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 ******************************************************************************/

var id=0;var selectedEle =null;
var tablesList=[];
var outlet={};var tableInfo={};
outlet.tablesList=tablesList;
var contextPath = $('#contextPath').val();

/**
 * @author Sahitya 
 * Prepare images dynamically with the table number,no of chairs,level details, then append to div and prepare global array with the same info
 */
function addNewTable(){
	$("#result").hide();
	$('#layoutError').hide();
	id=id+1;
	$("#startArea").append("<img src='"+contextPath+"/images/chair.png' id='table"+id+"' style='margin-left: 15px;cursor:pointer;margin-top:10px;' title='Table Id : table"+id+"  /  Chairs : 4' class='selectedTable'  onclick='selectTable(event,this)'></div>");
	tableInfo = {
			tableNumber : "table"+id,
			noOfChairs : "4",
			level : "1"
	},
	outlet.tablesList.push(tableInfo);
	$('#layoutInfo').val(JSON.stringify(outlet));
}

/**
 * @author Sahitya 
 * Display dine table info in pop-up whenever table is selected 
 * @param html element
 */
function selectTable(e,element){
	$("#result").hide();$('#layoutError').hide();
	$("#tableId").val("");
	$("#seatsNumber").val("");
	
	
	 var top = $(element).offset().top - $(window).scrollTop();
	    var left = $(element).offset().left - $(window).scrollLeft();

	   // var left = Math.round( (e.clientX - offset_l) );
	   // var top = Math.round( (e.clientY - offset_t) );

	  //  alert("Left: " + left + " Top: " + top);
	  $("#"+selectedEle).css("background","#FFFFFF");
	$("#"+$(element).attr("id")).css("background","#CCCCCC");
	selectedEle=$(element).attr("id");
	    $("#popUp").show();
		$("#popUp").css("top",top-90).css("left",left-550);
		for(var i=0;i<tablesList.length;i++){
			//alert(JSON.stringify(outlet));
			if(tablesList[i].tableNumber==$(element).attr("id")){
				//alert("same");
				$("#tableId").val(tablesList[i].tableNumber);
				$("#seatsNumber").val(tablesList[i].noOfChairs);
			}
		}
}

/**
 * @author Sahitya 
 * Delete specific table from GUI then delete same dine table info from global array
 * @param html element
 */
function deleteTable(){
	var tablesLength = tablesList.length;
	if(tablesLength>0){
		$("#result").hide();$('#layoutError').hide();
		$("#"+selectedEle).remove();
		$("#popUp").hide();
		for(var i=0;i<tablesLength;i++){
			if(tablesList[i].tableNumber==selectedEle){
				/*tablesList[i].pop();*/
				tablesList.splice(i,1);// remove specific table info in "outlet" array
				//delete tablesList[i];
				outlet.tablesList=tablesList;
				$('#layoutInfo').val(JSON.stringify(outlet));
			}
		}
	}
}
/**
 * @author Sahitya 
 * close popup
 */
function closePopUp(){
	$("#popUp").hide();
}

/**
 * @author Sahitya 
 * update global array with the updated dine table info
 * @param html element
 */
function addSeatsInfo(){
	//alert(selectedEle);
	$("#popUp").hide();
	$('#layoutError').hide();
	//'Table Id : table"+i+"/Chairs : 4'
	$("#"+selectedEle).attr("title","Table Id : "+$("#tableId").val()+"  /  Chairs : "+$("#seatsNumber").val());
	$("#"+selectedEle).attr("id",$("#tableId").val());
	$("#result").text("Table Information Updated Successfully.");
	$("#result").show();
	for(var i=0;i<tablesList.length;i++){
		if(tablesList[i].tableNumber==selectedEle){
			tablesList[i].tableNumber=$("#tableId").val();
			tablesList[i].noOfChairs=$("#seatsNumber").val();
			//outlet.tablesList.push(tableInfo);
		}
	}
	$('#layoutInfo').val(JSON.stringify(outlet));
	//alert(JSON.stringify(outlet));
}

/**
 * @author Sahitya 
 * Add New Level
 * @param html element
 */
function addNewLevel(){
	$("#result").hide();
	$('#layoutError').hide();
	//alert(tablesList.length);
	for(var i=tablesList.length;i>0;i--){
	//	alert(i);
		$("#"+tablesList[i-1].tableNumber).remove();
		tablesList.pop();
		tableNumber=0;
	}
	$("#startArea").empty();
	$('#layoutInfo').val('');
	i=0;
}


function SaveOutlet(){
	$("#result").hide();$('#layoutError').hide();
	//alert(JSON.stringify(outlet));
	$('#layoutInfo').val(JSON.stringify(outlet));
}

/**
 * @author Sahitya 
 * Delete all layout
 * @param html element
 */
function deleteOutLet(){
	$('#layoutError').hide();
	for(var i=tablesList.length;i>0;i--){
	//	alert(i);
		$("#"+tablesList[i-1].tableNumber).remove();
		tablesList.pop();
		tableNumber=0;id=0;
	}
	$("#startArea").empty();
	id=0;
	$('#layoutInfo').val('');
	//alert(JSON.stringify(outlet));
	//i=0;
}

/**
 * @author Sahitya 
 * Prepare images dynamically with the table number,no of chairs,level details, then append to div and prepare global array with the same info
 * @param html element
 */
function viewTablesForEdit(layoutId,tableNumber,level,chairs){
	$("#result").hide();
	$('#layoutError').hide();
	id=id+1;
	$("#startArea").append("<img src='"+contextPath+"/images/chair.png' id='"+tableNumber+"' style='margin-left: 15px;cursor:pointer;margin-top:10px;' title='Table Id :"+tableNumber+"  /  Chairs :"+chairs+"' class='selectedTable'  onclick='selectTable(event,this)'></div>");
	tableInfo = {
			tableNumber : tableNumber,
			noOfChairs : chairs,
			level : level
	}
	outlet.tablesList.push(tableInfo);
	$('#layoutInfo').val(JSON.stringify(outlet));
	//alert(JSON.stringify(outlet));
}

/**
 * @author Sahitya 
 * Prepare images dynamically with the table number,no of chairs,level details, then append to div
 * @param html element
 */
function viewTables(layoutId,tableNumber,level,chairs){
	$("#result").hide();
	$('#layoutError').hide();
	id=id+1;
	$("#startArea").append("<img src='"+contextPath+"/images/chair.png' id='"+tableNumber+"' style='margin-left: 15px;cursor:pointer;margin-top:10px;' title='Table Id :"+tableNumber+"  /  Chairs :"+chairs+"' class='selectedTable'></div>");
}


/*
function validateStorageSystemMaster(operation){
	debugger;
		 try{
			 var contextPath = $("#contextPath").val();
			 
			
			 
			// purpose:for checking internet conection
			var online = window.navigator.onLine;
		  	if(!online){
		  	alert("Check your internet connection,Please try agian after some time.");
		  	return;
		  	}
			 
	    	
	    	if($("#storagename").val() == ""){
	 	   		 $("#storagename").focus();
	 	   		$("#StorageidError").html("Storage System Name Can not be empty"); 
	 	   		 return false;
	 	   	 }
	    	if($("#storagetype").val() == ""){
	 	   		 $("#storagetype").focus();
	 	   		$("#StorageidError").html("Please select Storage type"); 
	 	   		 return false;
	 	   	 }
	    	
	 	   	
	    	
	    	 
	    
				 var finalObj = {}, warehouseStorageSystemDetails = [], obj = {};
				 
				
				var storageSystemId = $("#Storageid").val();
				
				if(storageSystemId == undefined || storageSystemId == null){
					storageSystemId ="";
				}
				finalObj.storageSystemId = storageSystemId;
				
				var location = $("#location").val();
				var loc = location.split('-');
				
				finalObj.warehouseId = loc[1];
				finalObj.storageLocation = loc[0];
				finalObj.storageSystemName = $("#storagename").val();
				finalObj.materialType = $("#materialtype").val();
				finalObj.storageSystemType = $("#storagetype").val();
				
				finalObj.height = $("#height").val();
				finalObj.length = $("#length").val();
				finalObj.width = $("#width").val();
				finalObj.manufacturer = $("#manufacturer").val();
				finalObj.noOfLevels = parseInt($("#nooflevels").val());
				finalObj.levelPartition = parseInt($("#levelofPartions").val());
				finalObj.currentStock = $("#currentStockr").val();
				finalObj.rows = parseInt($("#rowsr").val());
				finalObj.columns = parseInt($("#columnss").val());
				
				if($("#sscapacity").val() == ""){
		 	   		 $("#sscapacity").focus();
		 	   		$("#StorageidError").html("Enter Storgae Capacity."); 
		 	   		 return false;
		 	   	 }
				
				
				finalObj.storageSystemCapacity = $("#sscapacity").val();
				
				var storageIcon = $("#signatureFile").val();
				if(storageIcon == "" || storageIcon == null || storageIcon == ""){
					storageIcon = $("#storageIconr").val();
				}
				finalObj.storageIcon = storageIcon;
				finalObj.iconId = $("#signature_refId").val();
				finalObj.iconFlag = true;
			
				
			
			
				 var len = $("#packagingList tr").length;
				if(len == 0){
					alert("Add Atleast One SKU");
					return false;
					}
				 var len = $("#packagingList tr").length-1;
					var PackagingDetails = [];
					
					  $('.slno').each(function() {
						
						  var idAttr= $(this).attr("id").replace('itemno','');
						
						debugger;
						obj = {serialNum:$("#itemno"+idAttr).text(),skuId:$("#skuID"+idAttr).text(),description:$("#Desc"+idAttr).text(),level:$("#level"+idAttr).text(),quantityFl:$("#capacity"+idAttr).text(),remarks:$("#comments"+idAttr).text(),storageSystemId:$("#Storageid").val()};
						warehouseStorageSystemDetails.push(obj);
				   	
					  });
				
				
				
				
				finalObj.warehouseStorageSystemDetails = warehouseStorageSystemDetails;
				var formData = JSON.stringify(finalObj);
				console.log(formData);
				
					URL = contextPath + "/inventorymanager/createWarehouseStorageSystemMaster.do";
				
				$.ajax({
				  type: "POST",
	  			  url : URL,
	  			 
	              data : {
	            	  formData : formData,
	            	  operation : operation
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

	    	
	     }*/

function validateStorageSystemMaster(operation){
	debugger;
		 try{
			 var contextPath = $("#contextPath").val();
			 
			// purpose:for checking internet conection
			var online = window.navigator.onLine;
		  	if(!online){
		  	alert("Check your internet connection,Please try agian after some time.");
		  	return;
		  	}
			 
	    	
	    	/*if($("#storagename").val() == ""){
	 	   		 $("#storagename").focus();
	 	   		$("#StorageidError").html("Storage System Name Can not be empty"); 
	 	   		 return false;
	 	   	 }
	    	if($("#storagetype").val() == ""){
	 	   		 $("#storagetype").focus();
	 	   		$("#StorageidError").html("Please select Storage type"); 
	 	   		 return false;
	 	   	 }*/
	    	
	 	   	if($("#storagename").val().trim() == ""){
		$("#StorageidError").html("storage id can't be empty");
		focusDiv('storagename');
		$("#storagename").focus();
		return;
	}
	else if($("#storagename").val().length>45){
		$("#StorageidError").html("storage Id can't exceeds 45 characters");
		$("#storagename").focus();
		return false;
	}
	    	
	    		if($("#storagetype").val().trim() == ""){
		$("#StorageidError").html("Enter storage type ");
		focusDiv('storagetype');
		$("#storagetype").focus();
		return;
	}
	else if($("#storagetype").val().length>45){
		$("#StorageidError").html("storage type can't exceeds 45 characters");
		$("#storagetype").focus();
		return false;
	}
	    	 
	    
				var finalObj = {}, warehouseStorageSystemDetails = [], obj = {};
				
				var storageSystemId = $("#Storageid").val();
				
				if(storageSystemId == undefined || storageSystemId == null){
					storageSystemId ="";
				}
				finalObj.storageSystemId = storageSystemId;
				
				var location = $("#location").val();
				var loc = location.split('-');
				
				finalObj.warehouseId = loc[1];
				finalObj.storageLocation = loc[0];
				finalObj.storageSystemName = $("#storagename").val();
				finalObj.materialType = $("#materialtype").val();
				finalObj.storageSystemType = $("#storagetype").val();
				
				finalObj.height = $("#height").val();
				finalObj.length = $("#length").val();
				finalObj.width = $("#width").val();
				finalObj.manufacturer = $("#manufacturer").val();
				finalObj.noOfLevels = parseInt($("#nooflevels").val());
				finalObj.levelPartition = parseInt($("#levelofPartions").val());
				finalObj.currentStock = $("#currentStockr").val();
				finalObj.rows = parseInt($("#rowsr").val());
				finalObj.columns = parseInt($("#columnss").val());
				
				if($("#sscapacity").val() == ""){
		 	   		 $("#sscapacity").focus();
		 	   		$("#StorageidError").html("Enter Storgae Capacity."); 
		 	   		 return false;
		 	   	 }
				
				finalObj.storageSystemCapacity = $("#sscapacity").val();
				
				var storageIcon = $("#signatureFile").val();
				if(storageIcon == "" || storageIcon == null || storageIcon == ""){
					storageIcon = $("#storageIconr").val();
				}
				finalObj.storageIcon = storageIcon;
				finalObj.iconId = $("#signature_refId").val();
				finalObj.iconFlag = true;
				 var len = $("#packagingList tr").length;
				if(len == 0){
					alert("Add Atleast One SKU");
					return false;
					}
				 var len = $("#packagingList tr").length-1;
					var PackagingDetails = [];
					  $('.slno').each(function() {
						  var idAttr= $(this).attr("id").replace('itemno','');
						debugger;
						obj = {serialNum:$("#itemno"+idAttr).text(),skuId:$("#skuID"+idAttr).text(),description:$("#Desc"+idAttr).text(),level:$("#level"+idAttr).text(),quantityFl:$("#capacity"+idAttr).text(),remarks:$("#comments"+idAttr).text(),storageSystemId:$("#Storageid").val()};
						warehouseStorageSystemDetails.push(obj);
					  });
				
				finalObj.warehouseStorageSystemDetails = warehouseStorageSystemDetails;
				var formData = JSON.stringify(finalObj);
				console.log(formData);
					URL = contextPath + "/inventorymanager/createWarehouseStorageSystemMaster.do";
				$.ajax({
				  type: "POST",
	  			  url : URL,
	  			 
	              data : {
	            	  formData : formData,
	            	  operation : operation
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

function viewEditStorageMaster(id,operation){
	debugger;
	 try{
		 var contextPath = $("#contextPath").val();
		// purpose:for checking internet conection
		var online = window.navigator.onLine;
	  	if(!online){
	  	alert("Check your internet connection,Please try agian after some time.");
	  	return;
	  	}
		 
				URL = contextPath + "/inventorymanager/viewWarehouseStorageSystemMaster.do";
			
			$.ajax({
			  type: "POST",
 			  url : URL,
 			 
             data : {
           	  id : id,
           	operation : operation
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
		

function addStorageMasterNew(){
			debugger;
			 try{
				 var contextPath = $("#contextPath").val();
				 
				// purpose:for checking internet conection
				var online = window.navigator.onLine;
			  	if(!online){
			  	alert("Check your internet connection,Please try agian after some time.");
			  	return;
			  	}
				 
						URL = contextPath + "/inventorymanager/newWarehouseStorageSystemMaster.do";
					
					$.ajax({
					  type: "POST",
		 			  url : URL,
		 			 
		             data : {
		           	  
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
		 

