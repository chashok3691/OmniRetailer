/* Sambaiah Y 23-06-2015
 *  addd droppable item to the empty area*/

var count = 0,count_value = 0;
var positiontop=null;
var categories = null;
$(function() {
	
	var contextPath = $("#contextPath").val();
	$( "#grocery_shelfs" ).draggable({helper:"clone"});	
	$( "#grocery_racks" ).draggable({helper:"clone"});
	$( "#grocery_bin" ).draggable({helper:"clone"});
	$( "#grocery_bayarea" ).draggable({helper:"clone"});
	$( "#grocery_fridge" ).draggable({helper:"clone"});
	$( "#grocery_binarray" ).draggable({helper:"clone"});
	/* invoke when we drop the element */
	$( "#GroceryDroppable" ).droppable({
	drop: function(event, ui ) {
			var $newPosY = 0;
		var $newPosX = ui.offset.left - $("#GroceryDroppable").offset().left;
		if(positiontop==null){
			$newPosY = ui.offset.top - $("#GroceryDroppable").offset().top;
		positiontop = ui.offset.top - $("#GroceryDroppable").offset().top;
		}
		else{
			if(count>=2){
				$newPosY = ui.offset.top - $("#GroceryDroppable").offset().top;
			$newPosY =$newPosY -64*(count);
			}
			else{
				$newPosY = ui.offset.top - $("#GroceryDroppable").offset().top;
				$newPosY = $newPosY-64;
			}
			}
		var draggingElement=ui.draggable.attr("id"); //for storing the current dragging element id
		var currentSelection="storageSystem"+count;    //for storing the element id locally
			if(draggingElement == "grocery_racks"){
			$( this ).find("ul")
			.before('<div style="left:'+Math.ceil($newPosX)+'px;top:'+$newPosY+'px;width:64px;" id='+"'"+currentSelection+"id'"+' class='+"'"+currentSelection+"class'"+' title="">'
						+'<img src='+"'"+contextPath+"/images/grocery_display_rack.png'"+'  style="cursor:pointer;" id='+"'"+currentSelection+"imageid'"+' class='+"'"+currentSelection+"imageclass dragging'"+' onclick="showGroceryStorageSystemDetails('+"'"+currentSelection+"'"+')">'
						+'<div style="border:1px solid #CCCCCC;width:185px;margin-top:-15px;display:none;position:absolute;background:#CCCCCC;z-index: 999;" id="'+currentSelection+"Details"+'">'
						+'<br><center style="margin-top: -15px;"><span id='+currentSelection+"span"+'>Storage System Details</span></center><hr style="margin-top: 1px;border: 1px solid #CCCCCC;margin-bottom: 5px;">'
						+'<span>Storage System Name : </span><input type="text" name = '+currentSelection+"name"+' class="form-control" id="'+currentSelection+"name"+'">'
						+'<div><div style="width:48%;"><span>No of Rows</span><input type="number" name = '+currentSelection+"rows"+' value="5" class="form-control" id="'+currentSelection+"rows"+'"></div>'
						+'<div style="width:49%;margin-top: -29.3%;margin-left:50%;"><span>No of Columns</span><input type="number" name = '+currentSelection+"columns"+' value="5" class="form-control" id="'+currentSelection+"columns"+'"></div></div>'
						+'<span>Actions : </span><hr style="margin-top: 1px;border: 1px solid #CCCCCC;margin-bottom: 5px;"><img src="'+contextPath+'/images/view.png" id='+"'"+currentSelection+"viewStorageSystem'"+' style="display:;cursor:pointer;height:33px;margin-left:7px;margin-top:-7px;" data-toggle="modal" data-target="#myModal" title="View Storage System" title="View Storage System" onclick="viewStorageSystem('+"'"+currentSelection+"'"+','+"'"+draggingElement+"'"+')"><img src="'+contextPath+'/images/remove.png" id='+"'"+currentSelection+"removeStorageSystem'"+' style="display:;cursor:pointer;height:29px;margin-left:17px;margin-top:-6px;" onclick="removeGroceryStorageSystem('+"'"+currentSelection+"'"+')" title="Remove Storage System">'
						+'<img src="'+contextPath+'/images/ok.png" id='+"'"+currentSelection+"saveStorageSystemDetails'"+' style="display:;cursor:pointer;height:23px;margin-left:17px;margin-top:-4px;" onclick="saveGroceryStorageSystemDetails('+"'"+currentSelection+"'"+')" title="Save Storage System Details"><img src="'+contextPath+'/images/cancel.png" id='+"'"+currentSelection+"closeStorageSystemDetails'"+' style="display:;cursor:pointer;height:26px;margin-left:18px;margin-top:-4px;" onclick="closeGroceryStorageSystemDetails('+"'"+currentSelection+"'"+')" title="Close Storage System Details">'
					+'<center><label id="'+currentSelection+"message"+'" style="color:#666666;text-decoration:blink;"></label></center></div></div>');
						
				prepareJsonforGroceryStorageSystems(draggingElement,currentSelection);
				count=count+1;
		}
			else if(draggingElement == "grocery_shelfs"){
				$( this ).find("ul")
				.before('<div style="left:'+Math.ceil($newPosX)+'px;top:'+$newPosY+'px;width:64px;" id='+"'"+currentSelection+"id'"+' class='+"'"+currentSelection+"class'"+' title="">'
						+'<img src='+"'"+contextPath+"/images/grocery_display_shelfs.png'"+'  style="cursor:pointer;" id='+"'"+currentSelection+"imageid'"+' class='+"'"+currentSelection+"imageclass'"+' onclick="showGroceryStorageSystemDetails('+"'"+currentSelection+"'"+')">'
						+'<div style="border:1px solid #CCCCCC;width:185px;display:none;position:absolute;margin-top:-15px;background:#CCCCCC;z-index: 999;" id="'+currentSelection+"Details"+'">'
						+'<br><center style="margin-top: -15px;"><span id='+currentSelection+"span"+'>Storage System Details</span></center><hr style="margin-top: 1px;border: 1px solid #CCCCCC;margin-bottom: 5px;">'
						+'<span>Storage System Name : </span><input type="text" name = '+currentSelection+"name"+' class="form-control" id="'+currentSelection+"name"+'">'
						+'<div><div style="width:48%;"><span>No of Rows</span><input type="number" name = '+currentSelection+"rows"+' value="5" class="form-control" id="'+currentSelection+"rows"+'"></div>'
						+'<div style="width:49%;margin-top: -29.3%;margin-left:50%;"><span>No of Columns</span><input type="number" name = '+currentSelection+"columns"+' value="5" class="form-control" id="'+currentSelection+"columns"+'"></div></div>'
						+'<span>Actions : </span><hr style="margin-top: 1px;border: 1px solid #CCCCCC;margin-bottom: 5px;"><img src="'+contextPath+'/images/view.png" id='+"'"+currentSelection+"viewStorageSystem'"+' style="display:;cursor:pointer;height:33px;margin-left:7px;margin-top:-7px;" data-toggle="modal" data-target="#myModal" title="View Storage System" title="View Storage System" onclick="viewStorageSystem('+"'"+currentSelection+"'"+','+"'"+draggingElement+"'"+')"><img src="'+contextPath+'/images/remove.png" id='+"'"+currentSelection+"removeStorageSystem'"+' style="display:;cursor:pointer;height:29px;margin-left:17px;margin-top:-6px;" onclick="removeGroceryStorageSystem('+"'"+currentSelection+"'"+')" title="Remove Storage System">'
						+'<img src="'+contextPath+'/images/ok.png" id='+"'"+currentSelection+"saveStorageSystemDetails'"+' style="display:;cursor:pointer;height:23px;margin-left:17px;margin-top:-4px;" onclick="saveGroceryStorageSystemDetails('+"'"+currentSelection+"'"+')" title="Save Storage System Details"><img src="'+contextPath+'/images/cancel.png" id='+"'"+currentSelection+"closeStorageSystemDetails'"+' style="display:;cursor:pointer;height:26px;margin-left:18px;margin-top:-4px;" onclick="closeGroceryStorageSystemDetails('+"'"+currentSelection+"'"+')" title="Close Storage System Details">'
					+'<center><label id="'+currentSelection+"message"+'" style="color:#666666;text-decoration:blink;"></label></center></div></div>');
						
					prepareJsonforGroceryStorageSystems(draggingElement,currentSelection);
					count=count+1;
				}
			else if(draggingElement == "grocery_bin"){
				$( this ).find("ul")
				.before('<div style="left:'+Math.ceil($newPosX)+'px;top:'+$newPosY+'px;width:64px;" id='+"'"+currentSelection+"id'"+' class='+"'"+currentSelection+"class'"+' title="">'
						+'<img src='+"'"+contextPath+"/images/warehouse-bin.png'"+'  style="cursor:pointer;" id='+"'"+currentSelection+"imageid'"+' class='+"'"+currentSelection+"imageclass'"+' onclick="showGroceryStorageSystemDetails('+"'"+currentSelection+"'"+')">'
						+'<div style="border:1px solid #CCCCCC;width:185px;display:none;position:absolute;margin-top:-15px;background:#CCCCCC;z-index: 999;" id="'+currentSelection+"Details"+'">'
						+'<br><center style="margin-top: -15px;"><span id='+currentSelection+"span"+'>Storage System Details</span></center><hr style="margin-top: 1px;border: 1px solid #CCCCCC;margin-bottom: 5px;">'
						+'<span>Storage System Name : </span><input type="text" name = '+currentSelection+"name"+' class="form-control" id="'+currentSelection+"name"+'">'
						+'<div><div style="width:48%;"><span>Height </span><input type="number" name = '+currentSelection+"rows"+' value ="200" class="form-control" id="'+currentSelection+"rows"+'"></div>'
						+'<div style="width:49%;margin-top: -29.3%;margin-left:50%;"><span>Width </span><input type="number" value ="200" name = '+currentSelection+"columns"+' class="form-control" id="'+currentSelection+"columns"+'"></div></div>'
						+'<span>Actions : </span><hr style="margin-top: 1px;border: 1px solid #CCCCCC;margin-bottom: 5px;"><img src="'+contextPath+'/images/view.png" id='+"'"+currentSelection+"viewStorageSystem'"+' style="display:;cursor:pointer;height:33px;margin-left:7px;margin-top:-7px;" data-toggle="modal" data-target="#myModal" title="View Storage System" title="View Storage System" onclick="viewStorageSystem('+"'"+currentSelection+"'"+','+"'"+draggingElement+"'"+')"><img src="'+contextPath+'/images/remove.png" id='+"'"+currentSelection+"removeStorageSystem'"+' style="display:;cursor:pointer;height:29px;margin-left:17px;margin-top:-6px;" onclick="removeGroceryStorageSystem('+"'"+currentSelection+"'"+')" title="Remove Storage System">'
						+'<img src="'+contextPath+'/images/ok.png" id='+"'"+currentSelection+"saveStorageSystemDetails'"+' style="display:;cursor:pointer;height:23px;margin-left:17px;margin-top:-4px;" onclick="saveGroceryStorageSystemDetails('+"'"+currentSelection+"'"+')" title="Save Storage System Details"><img src="'+contextPath+'/images/cancel.png" id='+"'"+currentSelection+"closeStorageSystemDetails'"+' style="display:;cursor:pointer;height:26px;margin-left:18px;margin-top:-4px;" onclick="closeGroceryStorageSystemDetails('+"'"+currentSelection+"'"+')" title="Close Storage System Details">'
					+'<center><label id="'+currentSelection+"message"+'" style="color:#666666;text-decoration:blink;"></label></center></div></div>');
						
				prepareJsonforGroceryStorageSystems(draggingElement,currentSelection);
				count=count+1;
				}
			else if(draggingElement == "grocery_bayarea"){
				$( this ).find("ul")
				.before('<div style="left:'+Math.ceil($newPosX)+'px;top:'+$newPosY+'px;width:64px;" id='+"'"+currentSelection+"id'"+' class='+"'"+currentSelection+"class'"+' title="">'
						+'<img src='+"'"+contextPath+"/images/warehouse-bayarea.png'"+'  style="cursor:pointer;" id='+"'"+currentSelection+"imageid'"+' class='+"'"+currentSelection+"imageclass'"+' onclick="showGroceryStorageSystemDetails('+"'"+currentSelection+"'"+')">'
						+'<div style="border:1px solid #CCCCCC;width:185px;display:none;position:absolute;margin-top:-15px;background:#CCCCCC;z-index: 999;" id="'+currentSelection+"Details"+'">'
						+'<br><center style="margin-top: -15px;"><span id='+currentSelection+"span"+'>Storage System Details</span></center><hr style="margin-top: 1px;border: 1px solid #CCCCCC;margin-bottom: 5px;">'
						+'<span>Storage System Name : </span><input type="text" name = '+currentSelection+"name"+' class="form-control" id="'+currentSelection+"name"+'">'
						+'<div><div style="width:48%;"><span>Height </span><input type="number" name = '+currentSelection+"rows"+' class="form-control" value ="200" id="'+currentSelection+"rows"+'"></div>'
						+'<div style="width:49%;margin-top: -29.3%;margin-left:50%;"><span>Width </span><input type="number" name = '+currentSelection+"columns"+' value ="200" class="form-control" id="'+currentSelection+"columns"+'"></div></div>'
						+'<span>Actions : </span><hr style="margin-top: 1px;border: 1px solid #CCCCCC;margin-bottom: 5px;"><img src="'+contextPath+'/images/view.png" id='+"'"+currentSelection+"viewStorageSystem'"+' style="display:;cursor:pointer;height:33px;margin-left:7px;margin-top:-7px;" data-toggle="modal" data-target="#myModal" title="View Storage System" title="View Storage System" onclick="viewStorageSystem('+"'"+currentSelection+"'"+','+"'"+draggingElement+"'"+')"><img src="'+contextPath+'/images/remove.png" id='+"'"+currentSelection+"removeStorageSystem'"+' style="display:;cursor:pointer;height:29px;margin-left:17px;margin-top:-6px;" onclick="removeGroceryStorageSystem('+"'"+currentSelection+"'"+')" title="Remove Storage System">'
						+'<img src="'+contextPath+'/images/ok.png" id='+"'"+currentSelection+"saveStorageSystemDetails'"+' style="display:;cursor:pointer;height:23px;margin-left:17px;margin-top:-4px;" onclick="saveGroceryStorageSystemDetails('+"'"+currentSelection+"'"+')" title="Save Storage System Details"><img src="'+contextPath+'/images/cancel.png" id='+"'"+currentSelection+"closeStorageSystemDetails'"+' style="display:;cursor:pointer;height:26px;margin-left:18px;margin-top:-4px;" onclick="closeGroceryStorageSystemDetails('+"'"+currentSelection+"'"+')" title="Close Storage System Details">'
					+'<center><label id="'+currentSelection+"message"+'" style="color:#666666;text-decoration:blink;"></label></center></div></div>');
						
					prepareJsonforGroceryStorageSystems(draggingElement,currentSelection);
					count=count+1;
				}
			
			else if(draggingElement == "grocery_fridge"){
				$( this ).find("ul")
				.before('<div style="left:'+Math.ceil($newPosX)+'px;top:'+$newPosY+'px;width:64px;" id='+"'"+currentSelection+"id'"+' class='+"'"+currentSelection+"class'"+' title="">'
						+'<img src='+"'"+contextPath+"/images/grocery_display_fridge.png'"+'  style="cursor:pointer;" id='+"'"+currentSelection+"imageid'"+' class='+"'"+currentSelection+"imageclass'"+' onclick="showGroceryStorageSystemDetails('+"'"+currentSelection+"'"+')">'
						+'<div style="border:1px solid #CCCCCC;width:185px;display:none;position:absolute;margin-top:-15px;background:#CCCCCC;z-index: 999;" id="'+currentSelection+"Details"+'">'
						+'<br><center style="margin-top: -15px;"><span id='+currentSelection+"span"+'>Storage System Details</span></center><hr style="margin-top: 1px;border: 1px solid #CCCCCC;margin-bottom: 5px;">'
						+'<span>Storage System Name : </span><input type="text" name = '+currentSelection+"name"+' class="form-control" id="'+currentSelection+"name"+'">'
						+'<div><div style="width:48%;"><span>No of Rows</span><input type="number" name = '+currentSelection+"rows"+' class="form-control" value="5" id="'+currentSelection+"rows"+'"></div>'
						+'<div style="width:49%;margin-top: -29.3%;margin-left:50%;"><span>No of Columns</span><input type="number" name = '+currentSelection+"columns"+' value="5" class="form-control" id="'+currentSelection+"columns"+'"></div></div>'
						+'<span>Actions : </span><hr style="margin-top: 1px;border: 1px solid #CCCCCC;margin-bottom: 5px;"><img src="'+contextPath+'/images/view.png" id='+"'"+currentSelection+"viewStorageSystem'"+' style="display:;cursor:pointer;height:33px;margin-left:7px;margin-top:-7px;" data-toggle="modal" data-target="#myModal" title="View Storage System" title="View Storage System" onclick="viewStorageSystem('+"'"+currentSelection+"'"+','+"'"+draggingElement+"'"+')"><img src="'+contextPath+'/images/remove.png" id='+"'"+currentSelection+"removeStorageSystem'"+' style="display:;cursor:pointer;height:29px;margin-left:17px;margin-top:-6px;" onclick="removeGroceryStorageSystem('+"'"+currentSelection+"'"+')" title="Remove Storage System">'
						+'<img src="'+contextPath+'/images/ok.png" id='+"'"+currentSelection+"saveStorageSystemDetails'"+' style="display:;cursor:pointer;height:23px;margin-left:17px;margin-top:-4px;" onclick="saveGroceryStorageSystemDetails('+"'"+currentSelection+"'"+')" title="Save Storage System Details"><img src="'+contextPath+'/images/cancel.png" id='+"'"+currentSelection+"closeStorageSystemDetails'"+' style="display:;cursor:pointer;height:26px;margin-left:18px;margin-top:-4px;" onclick="closeGroceryStorageSystemDetails('+"'"+currentSelection+"'"+')" title="Close Storage System Details">'
					+'<center><label id="'+currentSelection+"message"+'" style="color:#666666;text-decoration:blink;"></label></center></div></div>');
						
					prepareJsonforGroceryStorageSystems(draggingElement,currentSelection);
					count=count+1;
				}
			else if(draggingElement == "grocery_binarray"){
				$( this ).find("ul")
				.before('<div style="left:'+Math.ceil($newPosX)+'px;top:'+$newPosY+'px;width:64px;" id='+"'"+currentSelection+"id'"+' class='+"'"+currentSelection+"class'"+' title="">'
						+'<img src='+"'"+contextPath+"/images/grocery_display_binarray.png'"+'  style="cursor:pointer;" id='+"'"+currentSelection+"imageid'"+' class='+"'"+currentSelection+"imageclass'"+' onclick="showGroceryStorageSystemDetails('+"'"+currentSelection+"'"+')">'
						+'<div style="border:1px solid #CCCCCC;width:185px;display:none;position:absolute;margin-top:-15px;background:#CCCCCC;z-index: 999;" id="'+currentSelection+"Details"+'">'
						+'<br><center style="margin-top: -15px;"><span id='+currentSelection+"span"+'>Storage System Details</span></center><hr style="margin-top: 1px;border: 1px solid #CCCCCC;margin-bottom: 5px;">'
						+'<span>Storage System Name : </span><input type="text" name = '+currentSelection+"name"+' class="form-control" id="'+currentSelection+"name"+'">'
						+'<div><div style="width:48%;"><span>No of Rows</span><input type="number" name = '+currentSelection+"rows"+' value="5" class="form-control" id="'+currentSelection+"rows"+'"></div>'
						+'<div style="width:49%;margin-top: -29.3%;margin-left:50%;"><span>No of Columns</span><input type="number" value="5" name = '+currentSelection+"columns"+' class="form-control" id="'+currentSelection+"columns"+'"></div></div>'
						+'<span>Actions : </span><hr style="margin-top: 1px;border: 1px solid #CCCCCC;margin-bottom: 5px;"><img src="'+contextPath+'/images/view.png" id='+"'"+currentSelection+"viewStorageSystem'"+' style="display:;cursor:pointer;height:33px;margin-left:7px;margin-top:-7px;" data-toggle="modal" data-target="#myModal" title="View Storage System" title="View Storage System" onclick="viewStorageSystem('+"'"+currentSelection+"'"+','+"'"+draggingElement+"'"+')"><img src="'+contextPath+'/images/remove.png" id='+"'"+currentSelection+"removeStorageSystem'"+' style="display:;cursor:pointer;height:29px;margin-left:17px;margin-top:-6px;" onclick="removeGroceryStorageSystem('+"'"+currentSelection+"'"+')" title="Remove Storage System">'
						+'<img src="'+contextPath+'/images/ok.png" id='+"'"+currentSelection+"saveStorageSystemDetails'"+' style="display:;cursor:pointer;height:23px;margin-left:17px;margin-top:-4px;" onclick="saveGroceryStorageSystemDetails('+"'"+currentSelection+"'"+')" title="Save Storage System Details"><img src="'+contextPath+'/images/cancel.png" id='+"'"+currentSelection+"closeStorageSystemDetails'"+' style="display:;cursor:pointer;height:26px;margin-left:18px;margin-top:-4px;" onclick="closeGroceryStorageSystemDetails('+"'"+currentSelection+"'"+')" title="Close Storage System Details">'
					+'<center><label id="'+currentSelection+"message"+'" style="color:#666666;text-decoration:blink;"></label></center></div></div>');
					prepareJsonforGroceryStorageSystems(draggingElement,currentSelection);
					count=count+1;
				}
			$("."+currentSelection+"class").draggable();
		}
	});
});

/* prepare json for selected element  */
var groceryStorages = {},storagesArray = [],storagesObj = {};
function prepareJsonforGroceryStorageSystems(storageType,storageId){
	groceryStorages.storageArray = storagesArray;
	var type = null;
	if(storageType == "grocery_binarray"){type="Bin Array";}
	else if(storageType == "grocery_fridge"){type="Fridge";}
	else if(storageType == "grocery_bayarea"){type="Empty Area";}
	else if(storageType == "grocery_racks"){type="Rack";}
	else if(storageType == "grocery_bin"){type="Bin";}
	else if(storageType == "grocery_shelfs"){type="Shelf";}
	
	storagesObj = {
			"storageSystemId" : storageId+"id", 
			"storageSystemName" : storageType,
			"rows" : "",
			"columns" : "",
			"storageLocation" : " ",
			"storageSystemType" : type,
			"display" : "visible",
			"serialNumber" : count,
			
	};
	groceryStorages.storageArray.push(storagesObj);
	//alert(JSON.stringify(groceryStorages));
}

/* unhide opened popup if we click out side of storage systems */
var selectedEleGlob = null;
$("#GroceryDroppable").click(function() {/*
	if((selectedStorageLocation != null && selectedEleGlob == selectedStorageLocation)){
		$("#"+selectedStorageLocation+"Details").fadeOut();
		$("#"+selectedStorageLocation+"message").html("");
		selectedStorageLocation = null;
		detailsvisible = false;
		selectedEleGlob = null;
		dispCount = dispCount+1;
		return;
	}
	selectedEleGlob = selectedStorageLocation;
*/});

/* for disply and hide the storagesystem details  */
var detailsvisible = false,selectedStorageLocation = null;
function showGroceryStorageSystemDetails(selectedId){
	$("#"+selectedId+"id").css("background","white");
	var categories = $("#productCategories").val();
	categories = categories.replace('[','').replace(']','');
	var productCategories = categories.split(",");
	var option = '';
	for(var i=0;i<productCategories.length;i++){
		option = option+'<option>'+productCategories[i]+'</option>'; 		
	}
	$("#"+selectedId+"producttype").html(option);
	
	var offset = $("#"+selectedId+"id").offset();
	
	/* for coordinates end */
	if(selectedStorageLocation!=null && selectedStorageLocation!=selectedId){
	$("#"+selectedStorageLocation+"Details").fadeOut();
	$("#"+selectedId+"Details").fadeIn();
	$("#"+selectedId+"message").html("");
	selectedStorageLocation = selectedId;
	detailsvisible = true;
	return;
	}
	if(detailsvisible==false){
		selectedStorageLocation = selectedId;
	$("#"+selectedId+"Details").fadeIn();
	$("#"+selectedId+"message").html("");
	detailsvisible = true;return;
	}
	if(detailsvisible == true){
		selectedStorageLocation = null;
		$("#"+selectedId+"Details").fadeOut();
		$("#"+selectedId+"message").html("");
		detailsvisible = false;return;
	}

}

/* for hiding the storage system details */
function closeGroceryStorageSystemDetails(selectedId){
	selectedStorageLocation = null;
	$("#"+selectedId+"Details").fadeOut();
	$("#"+selectedId+"message").html("");
	detailsvisible = false;
}
/* remove selected storage system */
function removeGroceryStorageSystem(selectedId){
	$("#"+selectedId+"id").css("visibility","hidden");
	
	/* add empty details to selected id */
	for(var i=0;i<storagesArray.length;i++){
		if(storagesArray[i].storageSystemId == selectedId+"id"){
			storagesArray[i].storageSystemName = "NO Store";
			storagesArray[i].rows = 5;
			storagesArray[i].columns = 5;
			storagesArray[i].display = "hidden";
		}
}
}
/* Sambaiah Y  
 * To store the storage system details in database */
function saveGroceryStorageSystemDetails(selectedId){
	var name = $("#"+selectedId+"name").val();
	var rows = $("#"+selectedId+"rows").val();
	var columns = $("#"+selectedId+"columns").val();
	var rowNotation = $("#"+selectedId+"rowNotation").val();
	var columnNotation = $("#"+selectedId+"columnNotation").val();
	
	if(name==null || name =="" || name==undefined){
		$("#"+selectedId+"span").html("Name Required").css("color","red");
		return;
	}
	if(rows==null || rows =="" || rows==undefined){
		$("#"+selectedId+"span").html("No Of Rows/Height Required").css("color","red");
		return;
	}
	if(columns==null || columns =="" || columns ==undefined){
		$("#"+selectedId+"span").html("No Of Columns/Width Required").css("color","red");
		return;
	}
	
	
	/* update storage systems array information */
	for(var i=0;i<storagesArray.length;i++){
		if(storagesArray[i].storageSystemName == name){
			if(storagesArray[i].storageSystemId == selectedId+"id"){}
			else{
				$("#"+selectedId+"span").html("Duplicate Storage System Name").css("color","red");
			return;
			}}
		if(storagesArray[i].storageSystemId == selectedId+"id"){
			
			storagesArray[i].storageSystemName = name;
			storagesArray[i].rows = rows;
			storagesArray[i].columns = columns;
		}
	}
	$("#"+selectedId+"name").attr("value",name);
	$("#"+selectedId+"rows").attr("value",rows);
	$("#"+selectedId+"columns").attr("value",columns);
	$("#"+selectedId+"rowNotation").attr("value",rowNotation);
	$("#"+selectedId+"columnNotation").attr("value",columnNotation);
	$("#"+selectedId+"message").html("Success");
		/* 24-05-2015 Sambaiah Y
		 * added to hide the storage systems details popup */
		selectedStorageLocation = null;
		$("#"+selectedId+"Details").fadeOut();
		$("#"+selectedId+"message").html("");
		detailsvisible = false;
		
		//alert(JSON.stringify(groceryStorages));
}

function viewOutletConfigurations(id,type){
	var contextPath = $("#contextPath").val();
	 URL = contextPath + "/inventorymanager/configurations.do";
	 $.ajax({
			type: "GET",
			url : URL,
			data : {
			},
			beforeSend: function(xhr){                    
	   			$("#loading").css("display","block");
	   			$("#mainDiv").addClass("disabled");
	   		  },
			success : function(result) {
           $("#right-side").html(result);
           activeMenu(id);
           openMenu("storedetails", "ulstoredetails",0);
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
/* TO OPEN NEW GROCERY CONFIGURATION LAYOUT */
function newGroceryConfiguration(){
	var contextPath = $("#contextPath").val();
	 //URL = contextPath + "/outletconfigurations/newGroceryConfigurations.do";
	URL = contextPath + "/outletconfigurations/newoutletdetails.do";
	 $.ajax({
			type: "GET",
			url : URL,
			data : {
			},
			beforeSend: function(xhr){                    
	   			$("#loading").css("display","block");
	   			$("#mainDiv").addClass("disabled");
	   		  },
			success : function(result) {
          $("#right-side").html(result);
          openMenu("storedetails", "ulstoredetails",0);
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
/* for saving the grocery outlet details on database */
function saveGroceryOutlet(){
	var left = 0,top=0;
	for(var si=0;si<=storagesArray.length-1;si++){
		var style = $("#"+storagesArray[si].storageSystemId).attr("style");
		var splitval = style.split(";");
		for(var i=0;i<splitval.length;i++){
			if(splitval[i].indexOf("left")>-1){
				var leftspl = splitval[i].split(":");
				leftspl[1] = leftspl[1].replace("px","");
				//leftspl[1] = leftspl[1].replace("-","");
				left = leftspl[1];
			}
		}
		for(var i=0;i<splitval.length;i++){
			if(splitval[i].indexOf("top")>-1){
				var leftspl = splitval[i].split(":");
				leftspl[1] = leftspl[1].replace("px","");
				//leftspl[1] = leftspl[1].replace("-","");
				top = leftspl[1];
			}
		}
		if(storagesArray[si].display=="hidden"){
		storagesArray[si].storageLocation = top+"#"+left+"#hidden";
		}
		else{
			storagesArray[si].storageLocation = top+"#"+left+"#visible";
		}
	}
	
	/* validat eany unfilld values is there or not */
	for(var i=0;i<storagesArray.length;i++){
		if(storagesArray[i].storageSystemName==null || storagesArray[i].storageSystemName==""){
			$("#Error").html("Name Required for all storages").css("color","red");
			$("#"+storagesArray[i].storageSystemId).css("background","red");
			return;
		}
		if(storagesArray[i].rows==null || storagesArray[i].rows==""){
			$("#Error").html("No Of Rows/Height Required for all storages").css("color","red");
			$("#"+storagesArray[i].storageSystemId).css("background","red");
			return;
		}
		if(storagesArray[i].columns==null || storagesArray[i].columns==""){
			$("#Error").html("No Of Columns/Width Required for all storages").css("color","red");
			$("#"+storagesArray[i].storageSystemId).css("background","red");
			return;
		}
	}
	var json_str = JSON.stringify(groceryStorages);
	var contextPath = $("#contextPath").val();
	URL = contextPath + "/outletconfigurations/savestoragesystems.do";
	$.ajax({
	type: "POST",
	url : URL,
	data : {
		storeCode : $("#storeCodeHidden").val(),
		storages : json_str
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
/* get all storage system details from database and display in browser */
function viewOutletStorageSystems(operation){
	var contextPath = $("#contextPath").val();
	 URL = contextPath + "/outletconfigurations/viewOutletStorageSystems.do";
		 $.ajax({
			 type: "POST",
       			url : URL,
       			data : {
       				storeCode : $("#hiddenStore").val(),
       				location : $("#workLocation").val()
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
/* configuration popup */
/* Sambaiah Y 20-09-2015
 * This method is used to display the selected storage system details
 *  display storage system details popup */
var storageTypeGlobal=null,storageSystemIdGlobal = 0;
var storageSystemDetailsObj = {},detailsArray = [],systemDetailsObj = {};
function viewStorageSystem(selectedId,type){
	storageSystemDetailsObj.detailsArray = detailsArray;
	var storageSystemId = selectedId.replace("storageSystem","S");
	storageSystemIdGlobal = storageSystemId;
	$("#systemsTable").html('');
	$("#systemName").html("");
	$("#selectedLabelVal").html("");
	$("#productSpanValue").html("");
	$("#productSpanDescValue").html("");
	selectedLocation = null;
	$("#addSearchProduct").val("");
	$("#productSpan").html("Product :  ");
	$("#productSpan1").html("Description :  ");
	$("#selectedLabel").html("Storage Location : ");
	
	
	var contextPath = $("#contextPath").val();
	
	var rows = $("#"+selectedId+"rows").val();
	var cols = $("#"+selectedId+"columns").val();
	
	if(type == "grocery_racks")
		storageTypeGlobal = "Rack";
	else if(type == "grocery_shelfs")
		storageTypeGlobal = "Shelf";
	else if(type == "grocery_fridge")
		storageTypeGlobal = "Fridge";
	else if(type == "grocery_binarray")
		storageTypeGlobal = "BinArray";
	else if(type == "grocery_bin")
		storageTypeGlobal = "Bin";
	else if(type == "grocery_bayarea")
		storageTypeGlobal = "Empty Area";
	
		
	if(type == "grocery_racks" || type == "grocery_shelfs" || type == "grocery_fridge" || type == "grocery_binarray"){
		for(var i=1;i<=rows;i++){
			$("#systemName").html(selectedId.replace("storageSystem","Storage System "));
			$("#systemsTable").append("<tr id='tr"+i+"' style='height:30px;color:#666666;' ></tr>");
			$("#tr"+i).prepend("<td align='center' style='width:80px;background:#666662;color:#FFFFFF;' title='Level "+i+" Details'>Level 	"+i+"</td>");
				for(var j = 1;j<=cols;j++){
					$("#tr"+i).append("<td align='center' style='cursor:pointer;height : 45px;width:150px;' id="+storageSystemId+"L"+i+"C"+j+" title='Select to Add Product' class='storageTd' onclick='addProductToCell(this)'> <img src='"+contextPath+"/images/add_product.png' title='Select to Add Product'>  </td>");
					systemDetailsObj = {
							storageSystemId : storageSystemId,
							level : "L"+i,
							column : "C"+j,
							product : "",
							quantity : "",
							description : "",
							category : "",
							skuId : "",
							notation : storageSystemId+"L"+i+"C"+j
					};
					
					var flag = false;
					for(var k=0;k<=detailsArray.length-1;k++){
						if(detailsArray[k].notation == storageSystemId+"L"+i+"C"+j){
							flag = true;
							if(detailsArray[k].skuId != null && detailsArray[k].skuId != ""){
								$("#"+detailsArray[k].notation).children().remove();
								$("#"+detailsArray[k].notation).append("<label id="+detailsArray[k].notation+""+detailsArray[k].skuId+">"+detailsArray[k].skuId+"</label><img src='"+contextPath+"/images/product_remove.png' title='Remove " + detailsArray[k].skuId+" from "+detailsArray[k].notation+" ' style='height:14px;margin-left:12px;vertical_align:-2px;' onclick=removeProductFromStorage('"+detailsArray[k].skuId+"','"+detailsArray[k].notation+"','"+contextPath+"')>");
							}
						}
					}
					if(flag == false){storageSystemDetailsObj.detailsArray.push(systemDetailsObj);}
				}
		}
	}else if(type == "grocery_bin" || type == "grocery_bayarea"){
		var rowVal = rows/2;
		var colVal = cols/2;
		var valPer = rowVal+colVal;
		
			$("#systemName").html(selectedId.replace("storageSystem","Storage System "));
			
			if(type == "grocery_bayarea"){
			
			$("#systemsTable").append("<tr id='tr' style='height:30px;color:#666666;' ><td><center><div style='margin-top: 15px;margin-bottom: 15px;border: 1px solid #CCCCCC;height:"+cols+"px;width:"+rows+"px;background:#CCCCCC;' id="+storageSystemIdGlobal+""+storageTypeGlobal.replace(" ","")+"><ul style='margin-top: 0px '></ul></div></center></td></tr>");
			}
			if(type == "grocery_bin"){
				$("#systemsTable").append("<tr id='tr' style='height:30px;color:#666666;' ><td><center><div style='margin-top: 15px;margin-bottom: 15px;height:"+cols+"px;width:"+rows+"px;border-top: "+valPer+"px solid #CCCCCC;border-left: 50px solid transparent;border-right: 50px solid transparent;' id="+storageSystemIdGlobal+""+storageTypeGlobal+"><ul style='margin-top: -"+valPer+"px '></ul></div></center></td></tr>");	
			}
				systemDetailsObj = {
							storageSystemId : storageSystemId,
							level : "L",
							column : "C",
							product : "",
							quantity : "",
							description : "",
							category : "",
							skuId : "",
							notation : storageSystemId+storageTypeGlobal.replace(" ","")
					};
				var flag = false;
				for(var k=0;k<=detailsArray.length-1;k++){
					if(detailsArray[k].notation == storageSystemId+storageTypeGlobal.replace(" ","")){
						flag = true;
						if(detailsArray[k].skuId != null && detailsArray[k].skuId != ""){
							$("#"+detailsArray[k].notation).find("ul").append("<div id='"+detailsArray[k].notation+"val' style='margin-left:-45px;'><label>"+detailsArray[k].skuId+"</label><img src='"+contextPath+"/images/product_remove.png' title='Remove " + detailsArray[k].skuId+" from "+detailsArray[k].notation+" Storage System' style='height:14px;margin-left:12px;vertical_align:-2px;cursor:pointer;' onclick=removeProductFromBinStorage('"+detailsArray[k].skuId+"','"+detailsArray[k].notation+"','"+contextPath+"')> </div>");
							$("#selectedLabelVal").html(detailsArray[k].notation);
						}
					}
				}
				if(flag == false){storageSystemDetailsObj.detailsArray.push(systemDetailsObj);}				
	}
	
}
/* display selected row location details right side */
var selectedLocation = null;
function addProductToCell(id){
	$("#selectedLabelVal").html("");
	var location = $(id).attr("id");
	
	$("#"+selectedLocation).css("background","#FFFFFF");
	$("#"+location).css("background","#CCCCCC");
	
	$("#selectedLabelVal").html("&nbsp;&nbsp;"+$(id).attr("id"));
	for(var i =0;i<detailsArray.length;i++){
		if(location == detailsArray[i].notation){
			selectedLocation = location;
			if(detailsArray[i].skuId == "" || detailsArray[i].skuId == null ){
				$("#productSpanValue").html("&nbsp;&nbsp;Product Not Added");
				$("#productSpanDescValue").html("&nbsp;&nbsp;Product Not Added");
			break;}
			else{
				$("#productSpanValue").html(detailsArray[i].skuId);
				$("#productSpanDescValue").html(detailsArray[i].description);
				break;}
		}
	}
}
/* search product to add selected location */
function searchProductForStorage(name,searchCategory){
	if(storageTypeGlobal == "Rack" || storageTypeGlobal == "Shelf" || storageTypeGlobal == "Fridge" || storageTypeGlobal == "Bin Array"){
	if(selectedLocation == null || selectedLocation == "" || selectedLocation == undefined){
		$("#addSearchProduct").val("");
		alert("Select one cell before selecting the item");return;
	}
	}
	 var contextPath = $("#contextPath").val();
	 var storeLocation = $("#workLocation").val();
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
				debugger
				//appendProducts(result,searchCategory);
				appendDataToOutlet(result,searchCategory);
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
function searchProductForWarehouseStorage(name,searchCategory){
	if(storageTypeGlobal == "Rack" || storageTypeGlobal == "Shelf" || storageTypeGlobal == "Fridge" || storageTypeGlobal == "Bin Array"){
	if(selectedLocation == null || selectedLocation == "" || selectedLocation == undefined){
		$("#addSearchProduct").val("");
		alert("Select one cell before selecting the item");return;
	}
	}
	 var contextPath = $("#contextPath").val();
	 var storeLocation = $("#workLocation").val();
	 URL = contextPath + "/inventorymanager/searchProductsWarehouse.do";
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
				debugger;
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
/* append selected product to selected location */
function appendProductsToStorage(productsList,searchCategory){
	$("."+searchCategory).html('');
	var op = '';
	for(var i=0;i<productsList.length;i++){
			 if (i == 0) {
				 op += '<li id="'+productsList[i].productId+'"  class="selected" onclick=getIds(this,"'+searchCategory+'"); ><a>'+productsList[i].description+'</a></li>';
			}else
			     op += '<li id="'+productsList[i].productId+'" onclick=getIds(this,"'+searchCategory+'"); ><a>'+productsList[i].description+'</a></li>';
		 }
	$("."+searchCategory).html(op);
	$("."+searchCategory).show();
	
}
function getIds(element,type){
	var description = null;
	var id= $(element).attr("id");
	//$(".popup-display").css("display","none");
	//alert($("#"+id).children("a").text());
	description =  $("#"+id).children("a").text();
	description = description.split(' - ');
	description = description[0];
	$("#desc").val(description);
//	if(type == "receipt")
	addProductToColumn(id);
	
/*	else if(type == "receipt")
		getSkuDetails(id);*/
	 $(".services").hide();
	 $("."+type).html("");
}
/* add selected product to selected storage system location */
function addProductToColumn(skuId){
	var contextPath = $("#contextPath").val();
	var WarehouseReturnflag=$("#whreturnflag").val();
		if(WarehouseReturnflag == "" || WarehouseReturnflag == undefined || WarehouseReturnflag == null){
			WarehouseReturnflag="";
   		}
	URL = contextPath + "/inventorymanager/getSkuDetails.do";
	$.ajax({
		type: "GET",
		url : URL,
		data : {
			skuId : skuId,
			storeLocation : "",
			WarehouseReturnflag:WarehouseReturnflag
		},
		beforeSend: function(xhr){                    
			$("#loading").css("display","block");
			$("#mainDiv").addClass("disabled");
	    },
		success : function(result) {
			appendSkuDetailsToCell(result);
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
/* ADD PRODUCT TO THE SELECTED LOCATION  */
function appendSkuDetailsToCell(list){
	var contextPath = $("#contextPath").val();

	var selectedProduct = null,quantity = 0,description = null;
	var parsedJson = jQuery.parseJSON(list);
	$("#addSearchProduct").val("");
	skuList = parsedJson.skuLists;
	for(var i=0;i<=skuList.length-1;i++){
		selectedProduct = skuList[i].skuId;
		quantity = quantity+skuList[i].quantity;
		description = skuList[i].description;
		$("#productSpanValue").html(skuList[i].skuId);
		$("#productSpanDescValue").html(skuList[i].description);
	}
	if(storageTypeGlobal == "Rack" || storageTypeGlobal == "Shelf" || storageTypeGlobal == "Fridge" || storageTypeGlobal == "Bin Array"){
	//remove existing one add new one
	if($("#"+selectedLocation).children().attr("id") == undefined){
		$("#"+selectedLocation).children().remove();
		$("#"+selectedLocation).append("<label id="+selectedLocation+""+selectedProduct+">"+selectedProduct+"</label><img src='"+contextPath+"/images/product_remove.png' title='Remove " + selectedProduct+" from "+selectedLocation+" ' style='height:14px;margin-left:12px;vertical_align:-2px;' onclick=removeProductFromStorage('"+selectedProduct+"','"+selectedLocation+"','"+contextPath+"')>");
		for(var i = 0;i<detailsArray.length;i++){
			if(selectedLocation == detailsArray[i].notation){
				detailsArray[i].product = "";
				detailsArray[i].quantity = quantity;
				detailsArray[i].description = description;
				detailsArray[i].category = "";
				detailsArray[i].skuId = selectedProduct;
		}
	}
		$("#"+selectedLocation).attr("title","\n Sku Id : "+ selectedProduct +"\n\n" +
				"Description : "+ description +"\n");
	}
	else{
		alert("Product already there in selected column");
	}
	}else if(storageTypeGlobal == "Bin" || storageTypeGlobal == "Empty Area"){
		var notationIn = storageSystemIdGlobal+storageTypeGlobal;
		for(var i = 0;i<detailsArray.length;i++){
			if(notationIn.replace(" ","") == detailsArray[i].notation){
				if(detailsArray[i].skuId == null || detailsArray[i].skuId == ""){
					detailsArray[i].product = "";
					detailsArray[i].quantity = quantity;
					detailsArray[i].description = description;
					detailsArray[i].category = "";
					detailsArray[i].skuId = selectedProduct;
				}else{
					systemDetailsObj = {
							storageSystemId : detailsArray[i].storageSystemId,
							level : detailsArray[i].level,
							column : detailsArray[i].column,
							product : "",
							quantity : quantity,
							description : description,
							category : "",
							skuId : selectedProduct,
							notation : detailsArray[i].notation
					};
					//alert("added")
					detailsArray.push(systemDetailsObj);
					break;
				}
	}
		}
		$("#"+storageSystemIdGlobal+""+storageTypeGlobal.replace(" ","")).find("ul").append("<div id='"+storageSystemIdGlobal+""+storageTypeGlobal.replace(" ","")+"val' style='margin-left:-45px;'><label>"+selectedProduct+"</label><img src='"+contextPath+"/images/product_remove.png' title='Remove " + selectedProduct+" from "+notationIn.replace(" ","")+" Storage System' style='height:14px;margin-left:12px;vertical_align:-2px;cursor:pointer;' onclick=removeProductFromBinStorage('"+selectedProduct+"','"+notationIn.replace(" ","")+"','"+contextPath+"')> </div>");
		$("#selectedLabelVal").html(storageSystemIdGlobal+""+storageTypeGlobal);
		
		//alert(JSON.stringify(detailsArray));
	}
}
/* remove selected product from selected row */
function removeProductFromStorage(product,location,contextPath){
	$("#"+location).children().remove();
	$("#"+location).append("<img src='"+contextPath+"/images/add_product.png' title='Select to Add Product'>");
	for(var i = 0;i<detailsArray.length;i++){
		if(location == detailsArray[i].notation){
			detailsArray[i].product = "";
			detailsArray[i].quantity = "";
			detailsArray[i].category = "";
			detailsArray[i].skuId = "";
			
	}
}
	$("#"+selectedLocation).attr("title","Select to Add Product");
}
/* remove selected product from bins or empty area */
function removeProductFromBinStorage(product,location,contextPath){
	for(var i = 0;i<detailsArray.length;i++){
		if(location == detailsArray[i].notation){
			if(detailsArray[i].skuId == product){
				detailsArray.splice(i,1);
				$("#"+location+"val").remove();
			}
	}
}
	
}
/* add item details to  */
function closeDialougeBox(action){
	var det = [];
	var deta = {};
	var currentSys = "";
	if(action == "save"){
			for(var i=0;i<storagesArray.length;i++){
				for(var j = 0;j<=detailsArray.length-1;j++){
					var locationIDD = detailsArray[j].storageSystemId.replace("S","storageSystem");
					if(storagesArray[i].storageSystemId == locationIDD+"id" && storageSystemIdGlobal == detailsArray[j].storageSystemId){
						currentSys = detailsArray[j].storageSystemId;
						deta = {
								storageSystemId : detailsArray[j].storageSystemId,
								level : detailsArray[j].level,
								column : detailsArray[j].column,
								product : detailsArray[j].product,
								quantity : detailsArray[j].quantity,
								description : detailsArray[j].description,
								category : detailsArray[j].category,
								skuId : detailsArray[j].skuId,
								notation : detailsArray[j].notation
						};
						
						det.push(deta);
					}
					
				}//alert(currentSys);
				if(storageSystemIdGlobal == currentSys)
					storagesArray[i].storagesInformation = det;
			}
		}
}

function saveGroceryWarehouse(){
	var left = 0,top=0;
	for(var si=0;si<=storagesArray.length-1;si++){
		var style = $("#"+storagesArray[si].storageSystemId).attr("style");
		var splitval = style.split(";");
		for(var i=0;i<splitval.length;i++){
			if(splitval[i].indexOf("left")>-1){
				var leftspl = splitval[i].split(":");
				leftspl[1] = leftspl[1].replace("px","");
				//leftspl[1] = leftspl[1].replace("-","");
				left = leftspl[1];
			}
		}
		for(var i=0;i<splitval.length;i++){
			if(splitval[i].indexOf("top")>-1){
				var leftspl = splitval[i].split(":");
				leftspl[1] = leftspl[1].replace("px","");
				//leftspl[1] = leftspl[1].replace("-","");
				top = leftspl[1];
			}
		}
		if(storagesArray[si].display=="hidden"){
		storagesArray[si].storageLocation = top+"#"+left+"#hidden";
		}
		else{
			storagesArray[si].storageLocation = top+"#"+left+"#visible";
		}
	}
	
	/* validat eany unfilld values is there or not */
	for(var i=0;i<storagesArray.length;i++){
		if(storagesArray[i].storageSystemName==null || storagesArray[i].storageSystemName==""){
			$("#Error").html("Name Required for all storages").css("color","red");
			$("#"+storagesArray[i].storageSystemId).css("background","red");
			return;
		}
		if(storagesArray[i].rows==null || storagesArray[i].rows==""){
			$("#Error").html("No Of Rows/Height Required for all storages").css("color","red");
			$("#"+storagesArray[i].storageSystemId).css("background","red");
			return;
		}
		if(storagesArray[i].columns==null || storagesArray[i].columns==""){
			$("#Error").html("No Of Columns/Width Required for all storages").css("color","red");
			$("#"+storagesArray[i].storageSystemId).css("background","red");
			return;
		}
	}
	debugger;
	
	 
	var json_str = JSON.stringify(groceryStorages);
	var contextPath = $("#contextPath").val();
	URL = contextPath + "/outletconfigurations/savestoragesystemsWareHouse.do";
	$.ajax({
	type: "POST",
	url : URL,
	data : {
		storeCode : $("#storeCodeHidden").val(),
		warehouseidcreated :$("#warehouseidcreated").val(),
		storages : json_str
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
