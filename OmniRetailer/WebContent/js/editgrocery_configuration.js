/* Sambaiah Y
 * prepare json string for existing storagesystems */
var editcount = 0;
function prepareJsonForExistingOutletStorageSystems(){
	
	
	var child = $("#editoutletdroppable").children("div");
	
	for(var j=0;j<child.length;j++){
		var id = child[j].id;
		id = id.replace("id","");
		id=id.trim();
		prepareJsonforeditExiOutletStorageSystems($("#"+id+"type").val(),id);
		editcount = editcount+1;
	}
	
	$(".editcurrentSelectionclass").draggable();
	
}
var count = 0;
$(function() {
	var available = "new";
	var contextPath = $("#contextPath").val();
	$( "#grocery_shelfs" ).draggable({helper:"clone"});	
	$( "#grocery_racks" ).draggable({helper:"clone"});
	$( "#grocery_bin" ).draggable({helper:"clone"});
	$( "#grocery_bayarea" ).draggable({helper:"clone"});
	$( "#grocery_fridge" ).draggable({helper:"clone"});
	$( "#grocery_binarray" ).draggable({helper:"clone"});
	/* invoke when we drop the element */
	$( "#editoutletdroppable" ).droppable({
	drop: function(event, ui ) {
			var $newPosY = 0;
		var $newPosX = ui.offset.left - $("#editoutletdroppable").offset().left;
		
	if(count == 0){editcount = editcount+1;count = count+1;}
	if(editcount==null || editcount == 0){
		$newPosY = ui.offset.top - $("#editoutletdroppable").offset().top;
	}
	else{
			if(editcount>=2){
				$newPosY = ui.offset.top - $("#editoutletdroppable").offset().top;
			$newPosY =$newPosY -64*(editcount-1);
			}
			else{
				$newPosY = ui.offset.top - $("#editoutletdroppable").offset().top;
				$newPosY = $newPosY-64;
			}
	}
		var draggingElement=ui.draggable.attr("id"); //for storing the current dragging element id
		var type = null;
		if(draggingElement == "grocery_binarray"){type="Bin Array";}
		else if(draggingElement == "grocery_fridge"){type="Fridge";}
		else if(draggingElement == "grocery_bayarea"){type="Empty Area";}
		else if(draggingElement == "grocery_racks"){type="Rack";}
		else if(draggingElement == "grocery_bin"){type="Bin";}
		else if(draggingElement == "grocery_shelfs"){type="Shelf";}
		
		var currentSelection="editOutletStorageSystem"+editcount;    //for storing the element id locally
			if(draggingElement == "grocery_racks"){
			$( this ).find("ul")
			.before('<div style="left:'+Math.ceil($newPosX)+'px;top:'+$newPosY+'px;width:64px;" id='+"'"+currentSelection+"id'"+' class='+"'"+currentSelection+"class'"+' title="">'
						+'<img src='+"'"+contextPath+"/images/grocery_display_rack.png'"+'  style="cursor:pointer;" id='+"'"+currentSelection+"imageid'"+' class='+"'"+currentSelection+"imageclass'"+' onclick="showeditOutletStorageSystemDetails('+"'"+currentSelection+"'"+')">'
						+'<div style="border:1px solid #CCCCCC;width:185px;margin-top:-15px;display:none;position:absolute;background:#CCCCCC;z-index: 999;" id="'+currentSelection+"Details"+'">'
						+'<br><center style="margin-top: -15px;"><span id='+currentSelection+"span"+'>Storage System Details</span></center><hr style="margin-top: 1px;border: 1px solid #CCCCCC;margin-bottom: 5px;">'
						+'<span>Storage System Name : </span><input type="text" name = '+currentSelection+"name"+' class="form-control" id="'+currentSelection+"name"+'">'
						+'<div><div style="width:48%;"><span>No of Rows</span><input type="number" name = '+currentSelection+"rows"+' value="5" class="form-control" id="'+currentSelection+"rows"+'"></div>'
						+'<div style="width:49%;margin-top: -26.3%;margin-left:50%;"><span>No of Columns</span><input type="number" name = '+currentSelection+"columns"+' value="5" class="form-control" id="'+currentSelection+"columns"+'"></div></div>'
						+'<div><div style="width:48%;"><span>Length</span><input type="number" name = '+currentSelection+"rows"+' value="5" class="form-control" id="'+currentSelection+"rows"+'"></div>'
						+'<div style="width:49%;margin-top: -26.3%;margin-left:50%;"><span>Width</span><input type="number" name = '+currentSelection+"columns"+' value="5" class="form-control" id="'+currentSelection+"columns"+'"></div></div>'
						+'<span>Actions : </span><hr style="margin-top: 1px;border: 1px solid #CCCCCC;margin-bottom: 5px;"><img src="'+contextPath+'/images/view.png" id='+"'"+currentSelection+"viewStorageSystem'"+' style="display:;cursor:pointer;height:33px;margin-left:7px;margin-top:-7px;" data-toggle="modal" data-target="#myModalEdit" onclick="viewEditStorageSystems('+"'"+currentSelection+"'"+','+"'"+type+"'"+','+"'"+type+"'"+','+"'"+available+"'"+')" title="View Storage System" title="View Storage System"><img src="'+contextPath+'/images/remove.png" id='+"'"+currentSelection+"removeStorageSystem'"+' style="display:;cursor:pointer;height:29px;margin-left:17px;margin-top:-6px;" onclick="removeeditOutletStorageSystem('+"'"+currentSelection+"'"+')" title="Remove Storage System">'
						+'<img src="'+contextPath+'/images/ok.png" id='+"'"+currentSelection+"saveStorageSystemDetails'"+' style="display:;cursor:pointer;height:23px;margin-left:17px;margin-top:-4px;" onclick="saveeditOutletStorageSystemDetails('+"'"+currentSelection+"'"+')" title="Save Storage System Details"><img src="'+contextPath+'/images/cancel.png" id='+"'"+currentSelection+"closeStorageSystemDetails'"+' style="display:;cursor:pointer;height:26px;margin-left:18px;margin-top:-4px;" onclick="closeeditOutletStorageSystemDetails('+"'"+currentSelection+"'"+')" title="Close Storage System Details">'
					+'<center><label id="'+currentSelection+"message"+'" style="color:#666666;text-decoration:blink;"></label></center></div></div>');
						
			prepareJsonforeditOutletStorageSystems(draggingElement,currentSelection);
					editcount=editcount+1;
		}
			else if(draggingElement == "grocery_shelfs"){
				$( this ).find("ul")
				.before('<div style="left:'+Math.ceil($newPosX)+'px;top:'+$newPosY+'px;width:64px;" id='+"'"+currentSelection+"id'"+' class='+"'"+currentSelection+"class'"+' title="">'
						+'<img src='+"'"+contextPath+"/images/grocery_display_shelfs.png'"+'  style="cursor:pointer;" id='+"'"+currentSelection+"imageid'"+' class='+"'"+currentSelection+"imageclass'"+' onclick="showeditOutletStorageSystemDetails('+"'"+currentSelection+"'"+')">'
						+'<div style="border:1px solid #CCCCCC;width:185px;display:none;position:absolute;margin-top:-15px;background:#CCCCCC;z-index: 999;" id="'+currentSelection+"Details"+'">'
						+'<br><center style="margin-top: -15px;"><span id='+currentSelection+"span"+'>Storage System Details</span></center><hr style="margin-top: 1px;border: 1px solid #CCCCCC;margin-bottom: 5px;">'
						+'<span>Storage System Name : </span><input type="text" name = '+currentSelection+"name"+' class="form-control" id="'+currentSelection+"name"+'">'
						+'<div><div style="width:48%;"><span>No of Rows</span><input type="number" name = '+currentSelection+"rows"+' value="5" class="form-control" id="'+currentSelection+"rows"+'"></div>'
						+'<div style="width:49%;margin-top: -26.3%;margin-left:50%;"><span>No of Columns</span><input type="number" name = '+currentSelection+"columns"+' value="5" class="form-control" id="'+currentSelection+"columns"+'"></div></div>'
						+'<div><div style="width:48%;"><span>Length</span><input type="number" name = '+currentSelection+"rows"+' value="5" class="form-control" id="'+currentSelection+"rows"+'"></div>'
						+'<div style="width:49%;margin-top: -26.3%;margin-left:50%;"><span>Width</span><input type="number" name = '+currentSelection+"columns"+' value="5" class="form-control" id="'+currentSelection+"columns"+'"></div></div>'
						+'<span>Actions : </span><hr style="margin-top: 1px;border: 1px solid #CCCCCC;margin-bottom: 5px;"><img src="'+contextPath+'/images/view.png" id='+"'"+currentSelection+"viewStorageSystem'"+' style="display:;cursor:pointer;height:33px;margin-left:7px;margin-top:-7px;" data-toggle="modal" data-target="#myModalEdit" onclick="viewEditStorageSystems('+"'"+currentSelection+"'"+','+"'"+type+"'"+','+"'"+type+"'"+','+"'"+available+"'"+')" title="View Storage System" title="View Storage System"><img src="'+contextPath+'/images/remove.png" id='+"'"+currentSelection+"removeStorageSystem'"+' style="display:;cursor:pointer;height:29px;margin-left:17px;margin-top:-6px;" onclick="removeeditOutletStorageSystem('+"'"+currentSelection+"'"+')" title="Remove Storage System">'
						+'<img src="'+contextPath+'/images/ok.png" id='+"'"+currentSelection+"saveStorageSystemDetails'"+' style="display:;cursor:pointer;height:23px;margin-left:17px;margin-top:-4px;" onclick="saveeditOutletStorageSystemDetails('+"'"+currentSelection+"'"+')" title="Save Storage System Details"><img src="'+contextPath+'/images/cancel.png" id='+"'"+currentSelection+"closeStorageSystemDetails'"+' style="display:;cursor:pointer;height:26px;margin-left:18px;margin-top:-4px;" onclick="closeeditOutletStorageSystemDetails('+"'"+currentSelection+"'"+')" title="Close Storage System Details">'
					+'<center><label id="'+currentSelection+"message"+'" style="color:#666666;text-decoration:blink;"></label></center></div></div>');
						
				prepareJsonforeditOutletStorageSystems(draggingElement,currentSelection);
						editcount=editcount+1;
				}
			else if(draggingElement == "grocery_bin"){
				$( this ).find("ul")
				.before('<div style="left:'+Math.ceil($newPosX)+'px;top:'+$newPosY+'px;width:64px;" id='+"'"+currentSelection+"id'"+' class='+"'"+currentSelection+"class'"+' title="">'
						+'<img src='+"'"+contextPath+"/images/warehouse-bin.png'"+'  style="cursor:pointer;" id='+"'"+currentSelection+"imageid'"+' class='+"'"+currentSelection+"imageclass'"+' onclick="showeditOutletStorageSystemDetails('+"'"+currentSelection+"'"+')">'
						+'<div style="border:1px solid #CCCCCC;width:185px;display:none;position:absolute;margin-top:-15px;background:#CCCCCC;z-index: 999;" id="'+currentSelection+"Details"+'">'
						+'<br><center style="margin-top: -15px;"><span id='+currentSelection+"span"+'>Storage System Details</span></center><hr style="margin-top: 1px;border: 1px solid #CCCCCC;margin-bottom: 5px;">'
						+'<span>Storage System Name : </span><input type="text" name = '+currentSelection+"name"+' class="form-control" id="'+currentSelection+"name"+'">'
						+'<div><div style="width:48%;"><span>Height</span><input type="number" name = '+currentSelection+"rows"+' value="" class="form-control" id="'+currentSelection+"rows"+'"></div>'
						+'<div style="width:49%;margin-top: -26.3%;margin-left:50%;"><span>Width</span><input type="number" name = '+currentSelection+"columns"+' value="" class="form-control" id="'+currentSelection+"columns"+'"></div></div>'
						+'<span>Actions : </span><hr style="margin-top: 1px;border: 1px solid #CCCCCC;margin-bottom: 5px;"><img src="'+contextPath+'/images/view.png" id='+"'"+currentSelection+"viewStorageSystem'"+' style="display:;cursor:pointer;height:33px;margin-left:7px;margin-top:-7px;" data-toggle="modal" data-target="#myModalEdit" onclick="viewEditStorageSystems('+"'"+currentSelection+"'"+','+"'"+type+"'"+','+"'"+type+"'"+','+"'"+available+"'"+')" title="View Storage System" title="View Storage System"><img src="'+contextPath+'/images/remove.png" id='+"'"+currentSelection+"removeStorageSystem'"+' style="display:;cursor:pointer;height:29px;margin-left:17px;margin-top:-6px;" onclick="removeeditOutletStorageSystem('+"'"+currentSelection+"'"+')" title="Remove Storage System">'
						+'<img src="'+contextPath+'/images/ok.png" id='+"'"+currentSelection+"saveStorageSystemDetails'"+' style="display:;cursor:pointer;height:23px;margin-left:17px;margin-top:-4px;" onclick="saveeditOutletStorageSystemDetails('+"'"+currentSelection+"'"+')" title="Save Storage System Details"><img src="'+contextPath+'/images/cancel.png" id='+"'"+currentSelection+"closeStorageSystemDetails'"+' style="display:;cursor:pointer;height:26px;margin-left:18px;margin-top:-4px;" onclick="closeeditOutletStorageSystemDetails('+"'"+currentSelection+"'"+')" title="Close Storage System Details">'
					+'<center><label id="'+currentSelection+"message"+'" style="color:#666666;text-decoration:blink;"></label></center></div></div>');
						
				prepareJsonforeditOutletStorageSystems(draggingElement,currentSelection);
						editcount=editcount+1;
				}
			else if(draggingElement == "grocery_bayarea"){
				$( this ).find("ul")
				.before('<div style="left:'+Math.ceil($newPosX)+'px;top:'+$newPosY+'px;width:64px;" id='+"'"+currentSelection+"id'"+' class='+"'"+currentSelection+"class'"+' title="">'
						+'<img src='+"'"+contextPath+"/images/warehouse-bayarea.png'"+'  style="cursor:pointer;" id='+"'"+currentSelection+"imageid'"+' class='+"'"+currentSelection+"imageclass'"+' onclick="showeditOutletStorageSystemDetails('+"'"+currentSelection+"'"+')">'
						+'<div style="border:1px solid #CCCCCC;width:185px;display:none;position:absolute;margin-top:-15px;background:#CCCCCC;z-index: 999;" id="'+currentSelection+"Details"+'">'
						+'<br><center style="margin-top: -15px;"><span id='+currentSelection+"span"+'>Storage System Details</span></center><hr style="margin-top: 1px;border: 1px solid #CCCCCC;margin-bottom: 5px;">'
						+'<span>Storage System Name : </span><input type="text" name = '+currentSelection+"name"+' class="form-control" id="'+currentSelection+"name"+'">'
						+'<div><div style="width:48%;"><span>Height</span><input type="number" name = '+currentSelection+"rows"+' value="200" class="form-control" id="'+currentSelection+"rows"+'"></div>'
						+'<div style="width:49%;margin-top: -26.3%;margin-left:50%;"><span>Width</span><input type="number" name = '+currentSelection+"columns"+' value="200" class="form-control" id="'+currentSelection+"columns"+'"></div></div>'
						+'<span>Actions : </span><hr style="margin-top: 1px;border: 1px solid #CCCCCC;margin-bottom: 5px;"><img src="'+contextPath+'/images/view.png" id='+"'"+currentSelection+"viewStorageSystem'"+' style="display:;cursor:pointer;height:33px;margin-left:7px;margin-top:-7px;" data-toggle="modal" data-target="#myModalEdit" onclick="viewEditStorageSystems('+"'"+currentSelection+"'"+','+"'"+type+"'"+','+"'"+type+"'"+','+"'"+available+"'"+')" title="View Storage System" title="View Storage System"><img src="'+contextPath+'/images/remove.png" id='+"'"+currentSelection+"removeStorageSystem'"+' style="display:;cursor:pointer;height:29px;margin-left:17px;margin-top:-6px;" onclick="removeeditOutletStorageSystem('+"'"+currentSelection+"'"+')" title="Remove Storage System">'
						+'<img src="'+contextPath+'/images/ok.png" id='+"'"+currentSelection+"saveStorageSystemDetails'"+' style="display:;cursor:pointer;height:23px;margin-left:17px;margin-top:-4px;" onclick="saveeditOutletStorageSystemDetails('+"'"+currentSelection+"'"+')" title="Save Storage System Details"><img src="'+contextPath+'/images/cancel.png" id='+"'"+currentSelection+"closeStorageSystemDetails'"+' style="display:;cursor:pointer;height:26px;margin-left:18px;margin-top:-4px;" onclick="closeeditOutletStorageSystemDetails('+"'"+currentSelection+"'"+')" title="Close Storage System Details">'
					+'<center><label id="'+currentSelection+"message"+'" style="color:#666666;text-decoration:blink;"></label></center></div></div>');
						
				prepareJsonforeditOutletStorageSystems(draggingElement,currentSelection);
						editcount=editcount+1;
				}
			
			else if(draggingElement == "grocery_fridge"){
				$( this ).find("ul")
				.before('<div style="left:'+Math.ceil($newPosX)+'px;top:'+$newPosY+'px;width:64px;" id='+"'"+currentSelection+"id'"+' class='+"'"+currentSelection+"class'"+' title="">'
						+'<img src='+"'"+contextPath+"/images/grocery_display_fridge.png'"+'  style="cursor:pointer;" id='+"'"+currentSelection+"imageid'"+' class='+"'"+currentSelection+"imageclass'"+' onclick="showeditOutletStorageSystemDetails('+"'"+currentSelection+"'"+')">'
						+'<div style="border:1px solid #CCCCCC;width:185px;display:none;position:absolute;margin-top:-15px;background:#CCCCCC;z-index: 999;" id="'+currentSelection+"Details"+'">'
						+'<br><center style="margin-top: -15px;"><span id='+currentSelection+"span"+'>Storage System Details</span></center><hr style="margin-top: 1px;border: 1px solid #CCCCCC;margin-bottom: 5px;">'
						+'<span>Storage System Name : </span><input type="text" name = '+currentSelection+"name"+' class="form-control" id="'+currentSelection+"name"+'">'
						+'<div><div style="width:48%;"><span>Height</span><input type="number" name = '+currentSelection+"rows"+' value="5" class="form-control" id="'+currentSelection+"rows"+'"></div>'
						+'<div style="width:49%;margin-top: -26.3%;margin-left:50%;"><span>Width</span><input type="number" name = '+currentSelection+"columns"+' value="5" class="form-control" id="'+currentSelection+"columns"+'"></div></div>'
						+'<span>Actions : </span><hr style="margin-top: 1px;border: 1px solid #CCCCCC;margin-bottom: 5px;"><img src="'+contextPath+'/images/view.png" id='+"'"+currentSelection+"viewStorageSystem'"+' style="display:;cursor:pointer;height:33px;margin-left:7px;margin-top:-7px;" data-toggle="modal" data-target="#myModalEdit" onclick="viewEditStorageSystems('+"'"+currentSelection+"'"+','+"'"+type+"'"+','+"'"+type+"'"+','+"'"+available+"'"+')" title="View Storage System" title="View Storage System"><img src="'+contextPath+'/images/remove.png" id='+"'"+currentSelection+"removeStorageSystem'"+' style="display:;cursor:pointer;height:29px;margin-left:17px;margin-top:-6px;" onclick="removeeditOutletStorageSystem('+"'"+currentSelection+"'"+')" title="Remove Storage System">'
						+'<img src="'+contextPath+'/images/ok.png" id='+"'"+currentSelection+"saveStorageSystemDetails'"+' style="display:;cursor:pointer;height:23px;margin-left:17px;margin-top:-4px;" onclick="saveeditOutletStorageSystemDetails('+"'"+currentSelection+"'"+')" title="Save Storage System Details"><img src="'+contextPath+'/images/cancel.png" id='+"'"+currentSelection+"closeStorageSystemDetails'"+' style="display:;cursor:pointer;height:26px;margin-left:18px;margin-top:-4px;" onclick="closeeditOutletStorageSystemDetails('+"'"+currentSelection+"'"+')" title="Close Storage System Details">'
					+'<center><label id="'+currentSelection+"message"+'" style="color:#666666;text-decoration:blink;"></label></center></div></div>');
						
				prepareJsonforeditOutletStorageSystems(draggingElement,currentSelection);
						editcount=editcount+1;
				}
			
			else if(draggingElement == "grocery_binarray"){
				$( this ).find("ul")
				.before('<div style="left:'+Math.ceil($newPosX)+'px;top:'+$newPosY+'px;width:64px;" id='+"'"+currentSelection+"id'"+' class='+"'"+currentSelection+"class'"+' title="">'
						+'<img src='+"'"+contextPath+"/images/grocery_display_binarray.png'"+'  style="cursor:pointer;" id='+"'"+currentSelection+"imageid'"+' class='+"'"+currentSelection+"imageclass'"+' onclick="showeditOutletStorageSystemDetails('+"'"+currentSelection+"'"+')">'
						+'<div style="border:1px solid #CCCCCC;width:185px;display:none;position:absolute;margin-top:-15px;background:#CCCCCC;z-index: 999;" id="'+currentSelection+"Details"+'">'
						+'<br><center style="margin-top: -15px;"><span id='+currentSelection+"span"+'>Storage System Details</span></center><hr style="margin-top: 1px;border: 1px solid #CCCCCC;margin-bottom: 5px;">'
						+'<span>Storage System Name : </span><input type="text" name = '+currentSelection+"name"+' class="form-control" id="'+currentSelection+"name"+'">'
						+'<div><div style="width:48%;"><span>Height</span><input type="number" name = '+currentSelection+"rows"+' value="5" class="form-control" id="'+currentSelection+"rows"+'"></div>'
						+'<div style="width:49%;margin-top: -26.3%;margin-left:50%;"><span>Width</span><input type="number" name = '+currentSelection+"columns"+' value="5" class="form-control" id="'+currentSelection+"columns"+'"></div></div>'
						+'<span>Actions : </span><hr style="margin-top: 1px;border: 1px solid #CCCCCC;margin-bottom: 5px;"><img src="'+contextPath+'/images/view.png" id='+"'"+currentSelection+"viewStorageSystem'"+' style="display:;cursor:pointer;height:33px;margin-left:7px;margin-top:-7px;" data-toggle="modal" data-target="#myModalEdit" onclick="viewEditStorageSystems('+"'"+currentSelection+"'"+','+"'"+type+"'"+','+"'"+type+"'"+','+"'"+available+"'"+')" title="View Storage System" title="View Storage System"><img src="'+contextPath+'/images/remove.png" id='+"'"+currentSelection+"removeStorageSystem'"+' style="display:;cursor:pointer;height:29px;margin-left:17px;margin-top:-6px;" onclick="removeeditOutletStorageSystem('+"'"+currentSelection+"'"+')" title="Remove Storage System">'
						+'<img src="'+contextPath+'/images/ok.png" id='+"'"+currentSelection+"saveStorageSystemDetails'"+' style="display:;cursor:pointer;height:23px;margin-left:17px;margin-top:-4px;" onclick="saveeditOutletStorageSystemDetails('+"'"+currentSelection+"'"+')" title="Save Storage System Details"><img src="'+contextPath+'/images/cancel.png" id='+"'"+currentSelection+"closeStorageSystemDetails'"+' style="display:;cursor:pointer;height:26px;margin-left:18px;margin-top:-4px;" onclick="closeeditOutletStorageSystemDetails('+"'"+currentSelection+"'"+')" title="Close Storage System Details">'
					+'<center><label id="'+currentSelection+"message"+'" style="color:#666666;text-decoration:blink;"></label></center></div></div>');
						
				prepareJsonforeditOutletStorageSystems(draggingElement,currentSelection);
						editcount=editcount+1;
				}
			//$("."+currentSelection+"selected").resizable();
			$("."+currentSelection+"class").draggable();
			/*if(detailsvisible == false){
				//alert("Hello");
				detailsvisible = true;
			}*/
		}

	});
	
});

/* 29-06-2015   Sambaiah Y
 * 
 *  This function is used to prepare the json for the dragged element 
 *  */
var editOutlerStorages = {},editstorageArray = [],editstoragesObj={};
function prepareJsonforeditOutletStorageSystems(storageType,storageId){
	editOutlerStorages.editstorageArray = editstorageArray;
	var type = null;
	if(storageType == "grocery_binarray"){type="Bin Array";}
	else if(storageType == "grocery_fridge"){type="Fridge";}
	else if(storageType == "grocery_bayarea"){type="Empty Area";}
	else if(storageType == "grocery_racks"){type="Rack";}
	else if(storageType == "grocery_bin"){type="Bin";}
	else if(storageType == "grocery_shelfs"){type="Shelf";}
	
	
	editstoragesObj = {
			"editSystemId" : "", 
			"storageSystemId" : storageId+"id", 
			"storageSystemName" : storageType,
			"rows" : "",
			"columns" : "",
			"length" : "",
			"width" : "",
			"storageLocation" : " ",
			"storageSystemType" : type,
			"display" : "visible",
			"serialNumber" : parseInt(editcount)-1,
			
	};
	editOutlerStorages.editstorageArray.push(editstoragesObj);
}
/* 29-06-2015   Sambaiah Y
 * 
 *  This function is used to prepare the json for the Existing element 
 *  */
function prepareJsonforeditExiOutletStorageSystems(storageType,storageId){
//	alert(storageType);
	editOutlerStorages.editstorageArray = editstorageArray;
	editstoragesObj = {
			"editSystemId" : $("#"+storageId+"systemId").val(), 
			"storageSystemId" : storageId+"id", 
			"storageSystemName" : $("#"+storageId+"name").val(), 
			"rows" : $("#"+storageId+"rows").val(),
			"columns" : $("#"+storageId+"rows").val(),
			"length" : $("#"+storageId+"length").val(),
			"width" : $("#"+storageId+"width").val(),
			"storageLocation" : " ",
			"storageSystemType" : storageType,
			"display" : $("#"+storageId+"visibility").val(),
			"serialNumber" : $("#"+storageId+"serialNum").val()
	};
	editOutlerStorages.editstorageArray.push(editstoragesObj);
}
/* 29-06-2015   Sambaiah Y
 * 
 *  This function is used to display the selected storage system details
 *  */
function showeditOutletStorageSystemDetails(selectedId){
	debugger;
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
//	console.log('top: '+offset.top+'; left: '+offset.left);
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
/* unhide opened popup if we click out side of storage systems */
var selectedEleGlobEdit = null;
$("#editoutletdroppable").click(function() {/*
	if(selectedStorageLocation != null && selectedEleGlobEdit == selectedStorageLocation){
		$("#"+selectedStorageLocation+"Details").fadeOut();
		$("#"+selectedStorageLocation+"message").html("");
		selectedStorageLocation = null;
		detailsvisible = false;
		selectedEleGlobEdit = null;return;
	}
	selectedEleGlobEdit = selectedStorageLocation;
*/});

/* 29-06-2015   Sambaiah Y
 * 
 *  This function is used to save selected storage system deatails
 *  */
function saveeditOutletStorageSystemDetails(selectedId){
	var name = $("#"+selectedId+"name").val();
	var rows = $("#"+selectedId+"rows").val();
	var columns = $("#"+selectedId+"columns").val(); 
	var length = $("#"+selectedId+"length").val();
	var width = $("#"+selectedId+"width").val();
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
	for(var i=0;i<editstorageArray.length;i++){
		if(editstorageArray[i].storageSystemName == name){
			if(editstorageArray[i].storageSystemId == selectedId+"id"){}
			else{
				$("#"+selectedId+"span").html("Duplicate Storage System Name").css("color","red");
			return;
			}}
		if(editstorageArray[i].storageSystemId == selectedId+"id"){
			editstorageArray[i].storageSystemName = name;
			editstorageArray[i].rows = rows;
			editstorageArray[i].columns = columns;
			editstorageArray[i].length = length;
			editstorageArray[i].width = width;
		}
	}
	$("#"+selectedId+"name").attr("value",name);
	$("#"+selectedId+"rows").attr("value",rows);
	$("#"+selectedId+"columns").attr("value",columns);
	$("#"+selectedId+"length").attr("value",length);
	$("#"+selectedId+"width").attr("value",width);
	$("#"+selectedId+"message").html("Success");
		/* 24-05-2015 Sambaiah Y
		 * added to hide the storage systems details popup */
		selectedStorageLocation = null;
		$("#"+selectedId+"Details").fadeOut();
		$("#"+selectedId+"message").html("");
		detailsvisible = false;
		
		//alert(JSON.stringify(editOutlerStorages));
}

/* 29-06-2015   Sambaiah Y
 * 
 *  This function is used to remove selected system from store
 *  */
function removeeditOutletStorageSystem(selectedId){
	$("#"+selectedId+"id").css("visibility","hidden");
	
	/* add empty details to selected id */
	for(var i=0;i<editstorageArray.length;i++){
		if(editstorageArray[i].storageSystemId == selectedId+"id"){
			editstorageArray[i].storageSystemName = "NO Store";
			editstorageArray[i].rows = 5;
			editstorageArray[i].columns = 5;
			editstorageArray[i].length = 5;
			editstorageArray[i].width = 5;
			editstorageArray[i].display = "hidden";
		}
}
}
/* 29-06-2015   Sambaiah Y
 * 
 *  This function is used to hide the storage system details popup
 *  */
function closeeditOutletStorageSystemDetails(selectedId){
	selectedStorageLocation = null;
	$("#"+selectedId+"Details").fadeOut();
	$("#"+selectedId+"message").html("");
	detailsvisible = false;
}
/* 29-06-2015   Sambaiah Y
 * 
 *  This function is used to save modified changes in database
 *  */
function updateOutletStorageSystems(){
	debugger
//	alert($("#hiddenStore").val());
	var left = 0,top=0;
	for(var si=0;si<=editstorageArray.length-1;si++){
		var style = $("#"+editstorageArray[si].storageSystemId).attr("style");
		var splitval = style.split(";");
		for(var i=0;i<splitval.length;i++){
			if(splitval[i].indexOf("left")>-1){
				var leftspl = splitval[i].split(":");
				leftspl[1] = leftspl[1].replace("px","");
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
		if(editstorageArray[si].display=="hidden"){
		editstorageArray[si].storageLocation = top+"#"+left+"#hidden";
		}
		else{
			editstorageArray[si].storageLocation = top+"#"+left+"#visible";
		}
		
	}
	
	/* validat eany unfilld values is there or not */
	for(var i=0;i<editstorageArray.length;i++){
		if(editstorageArray[i].storageSystemName==null || editstorageArray[i].storageSystemName==""){
			$("#Error").html("Name Required for all storages").css("color","red");
			$("#"+editstorageArray[i].storageSystemId).css("background","red");
			return;
		}
		if(editstorageArray[i].rows==null || editstorageArray[i].rows==""){
			$("#Error").html("No Of Rows/Height Required for all storages").css("color","red");
			$("#"+editstorageArray[i].storageSystemId).css("background","red");
			return;
		}
		if(editstorageArray[i].columns==null || editstorageArray[i].columns==""){
			$("#Error").html("No Of Columns/Width Required for all storages").css("color","red");
			$("#"+editstorageArray[i].storageSystemId).css("background","red");
			return;
		}
	}
	var storeCode=$("#hiddenStore").val();
	var json_str = JSON.stringify(editOutlerStorages);
	var contextPath = $("#contextPath").val();
	URL = contextPath + "/outletconfigurations/updateOutletStorageSystems.do";
	$.ajax({
	type: "POST",
	url : URL,
	data : {
		storeCode : $("#hiddenStore").val(),
		storages : json_str,
		location : $("#workLocation").val()
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
/* 05-10-2015  Sambaiah Y
 * This function is used to get the selected storage system details from database*/
var globalStorageSysId = null;
var detailsEditArray = [],systemDetailsEditObj = {};
function viewEditStorageSystems(selectedId,type,storageSystemId,available){
	globalStorageSysId = storageSystemId;
	var outletId = $("#storeCode").val();
	var contextPath = $("#contextPath").val();
	if(available == "exist"){
	URL = contextPath + "/outletconfigurations/getStorageSystemDetails.do";
	$.ajax({
	url : URL,
	data : {
		storageSystemId : storageSystemId,
		outletId:outletId
		},
			beforeSend: function(xhr){                    
	   				$("#loading").css("display","block");
	   				$("#mainDiv").addClass("disabled");
	        },
			success : function(result) {
				appendToView(result,selectedId,type,available);
				 $("#loading").css("display","none");
  			   $("#mainDiv").removeClass('disabled');

			},
			error : function() {
				alert("something went wrong");
				 $("#loading").css("display","none");
  			   $("#mainDiv").removeClass('disabled');

			}
		});
	}else if(available == "new"){
		appendToView(detailsEditArray,selectedId,type,available);
	}
	}
/* 05-10-2015  Sambaiah Y
 * This function is used to prepare json for selected storage*/
var parsedJson = [],systemDetailsObjEdit = {};
var storageTypeGlobalEdit = null,storageSystemIdGlobalEdit = null,availableGlobal = null;
function appendToView(list,selectedId,type,available){
	//alert(list);
	$("#systemsTableEdit").html('');
	$("#systemNameEdit").html("");
	$("#selectedLabelValEdit").html("");
	$("#productSpanValueEdit").html("");
	$("#productSpanDescValueEdit").html("");
	$("#selectedItemQtyVal").html("");
	selectedLocation = null;
	availableGlobal = available;
	$("#addSearchProductEdit").val("");
	$("#productSpanEdit").html("Product :  ");
	$("#productSpan1Edit").html("Description :  ");
	$("#selectedLabelEdit").html("Storage Location : ");
	$("#selectedItemQty").html("Quantity : ");
	if(available == "exist"){
	parsedJson = [];
	parsedJson = jQuery.parseJSON(list);
	}
	storageTypeGlobalEdit = type;
	var rows = $("#"+selectedId+"rows").val();
	var cols = $("#"+selectedId+"columns").val();
	var contextPath = $("#contextPath").val();

	var storageSystemsId = selectedId.replace("editOutletStorageSystem","");
	var finalStorage = storageSystemsId-1;
	var storageSystemId = "S"+finalStorage;
	storageSystemIdGlobalEdit = storageSystemId;
	if(type == "Shelf" || type == "Fridge" || type == "Bin Array" || type == "Rack"){
		for(var i=1;i<=rows;i++){
			$("#systemNameEdit").html(storageSystemId.replace("S","Storage System ")).css("color","#666666");
			$("#systemsTableEdit").append("<tr id='tr"+i+"' style='height:30px;color:#666666;' ></tr>");
			$("#tr"+i).prepend("<td align='center' style='width:80px;background:#666662;color:#FFFFFF;' title='Level "+i+" Details'>Level 	"+i+"</td>");
				for(var j = 1;j<=cols;j++){
					$("#tr"+i).append("<td align='center' style='cursor:pointer;height : 45px;width:150px;' id="+storageSystemId+"L"+i+"C"+j+" title='Select to Add Product' class='storageTd' onclick='addProductToCellEdit(this)'> <img src='"+contextPath+"/images/add_product.png' title='Select to Add Product'>  </td>");
					systemDetailsObjEdit = {
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
					if(available == "exist"){
					var flag = false;
					for(var k=0;k<=parsedJson.length-1;k++){
						parsedJson[k].storageSystemId = storageSystemId;
						if(parsedJson[k].notation == storageSystemId+"L"+i+"C"+j){
							flag = true;
							if(parsedJson[k].skuId != null && parsedJson[k].skuId != ""){
								//$("#tr"+i).append("<td align='center' style='cursor:pointer;height : 45px;width:150px;' id="+storageSystemId+"L"+i+"C"+j+" title='Select to Add Product' class='storageTd' onclick='addProductToCell(this)'> <img src='"+contextPath+"/images/add_product.png' title='Select to Add Product'>  </td>");
								$("#"+parsedJson[k].notation).children().remove();
								$("#"+parsedJson[k].notation).append("<label id="+parsedJson[k].notation+""+parsedJson[k].skuId+">"+parsedJson[k].skuId+"</label><img src='"+contextPath+"/images/product_remove.png' title='Remove " + parsedJson[k].skuId+" from "+parsedJson[k].notation+" ' style='height:14px;margin-left:12px;vertical_align:-2px;' onclick=removeProductFromStorageEdit('"+parsedJson[k].skuId+"','"+parsedJson[k].notation+"','"+contextPath+"','"+available+"')>");
								$("#"+parsedJson[k].notation).attr("title","\n Sku Id : "+ parsedJson[k].skuId +"\n\n" +
										"Description : "+ parsedJson[k].description +"\n");
							}
						}
					}
					if(flag == false){parsedJson.push(systemDetailsObjEdit);}
				}else if(available == "new"){
					var flag = false;
					for(var k=0;k<=detailsEditArray.length-1;k++){
						if(detailsEditArray[k].notation == storageSystemId+"L"+i+"C"+j){
							flag = true;
							if(detailsEditArray[k].skuId != null && detailsEditArray[k].skuId != ""){
								$("#"+detailsEditArray[k].notation).children().remove();
								$("#"+detailsEditArray[k].notation).append("<label id="+detailsEditArray[k].notation+""+detailsEditArray[k].skuId+">"+detailsEditArray[k].skuId+"</label><img src='"+contextPath+"/images/product_remove.png' title='Remove " + detailsEditArray[k].skuId+" from "+detailsEditArray[k].notation+" ' style='height:14px;margin-left:12px;vertical_align:-2px;' onclick=removeProductFromStorageEdit('"+detailsEditArray[k].skuId+"','"+detailsEditArray[k].notation+"','"+contextPath+"','"+available+"')>");
								$("#"+detailsEditArray[k].notation).attr("title","\n Sku Id : "+ detailsEditArray[k].skuId +"\n\n" +
										"Description : "+ detailsEditArray[k].description +"\n");}
						}
					}
					if(flag == false){detailsEditArray.push(systemDetailsObjEdit);}
					}
				}
		}
	}else if(type == "Bin" || type == "Empty Area"){
		var rowVal = rows/2;
		var colVal = cols/2;
		var valPer = rowVal+colVal;
			if(type == "Empty Area"){
			$("#systemsTableEdit").append("<tr id='tr' style='height:30px;color:#666666;' ><td><center><div style='margin-top: 15px;margin-bottom: 15px;border: 1px solid #CCCCCC;height:"+cols+"px;width:"+rows+"px;background:#CCCCCC;' id="+storageSystemId+""+storageTypeGlobalEdit.replace(" ","")+"><ul style='margin-top: 0px '></ul></div></center></td></tr>");
			}
			if(type == "Bin"){
				$("#systemsTableEdit").append("<tr id='tr' style='height:30px;color:#666666;' ><td><center><div style='margin-top: 15px;margin-bottom: 15px;height:"+cols+"px;width:"+rows+"px;border-top: "+valPer+"px solid #CCCCCC;border-left: 50px solid transparent;border-right: 50px solid transparent;' id="+storageSystemId+""+storageTypeGlobalEdit+"><ul style='margin-top: -"+valPer+"px '></ul></div></center></td></tr>");	
			}
			systemDetailsObjEdit = {
							storageSystemId : storageSystemId,
							level : "L",
							column : "C",
							product : "",
							quantity : "",
							description : "",
							category : "",
							skuId : "",
							notation : storageSystemId+storageTypeGlobalEdit.replace(" ","")
					};
			if(available == "exist"){
				var flag = false;
				for(var k=0;k<=parsedJson.length-1;k++){
					if(parsedJson[k].notation == storageSystemId+storageTypeGlobalEdit.replace(" ","")){
						flag = true;
						if(parsedJson[k].skuId != null && parsedJson[k].skuId != ""){
							$("#"+parsedJson[k].notation).find("ul").append("<div id='"+parsedJson[k].notation.replace(" ","")+"val' style='margin-left:-45px;'><label>"+parsedJson[k].skuId+"</label><img src='"+contextPath+"/images/product_remove.png' title='Remove " + parsedJson[k].skuId+" from "+parsedJson[k].notation.replace(" ","")+" Storage System' style='height:14px;margin-left:12px;vertical_align:-2px;cursor:pointer;' onclick=removeProductFromBinStorageEdit('"+parsedJson[k].skuId+"','"+parsedJson[k].notation.replace(" ","")+"','"+contextPath+"','"+available+"')> </div>");
							$("#selectedLabelVal").html(parsedJson[k].notation);
						}
					}
				}
				if(flag == false){parsedJson.push(systemDetailsObjEdit);}
			}else if(available == "new"){
				var flag = false;
				for(var k=0;k<=detailsEditArray.length-1;k++){
					if(detailsEditArray[k].notation == storageSystemId+storageTypeGlobalEdit.replace(" ","")){
						flag = true;
						if(detailsEditArray[k].skuId != null && detailsEditArray[k].skuId != ""){
							$("#"+detailsEditArray[k].notation).find("ul").append("<div id='"+detailsEditArray[k].notation.replace(" ","")+"val' style='margin-left:-45px;'><label>"+detailsEditArray[k].skuId+"</label><img src='"+contextPath+"/images/product_remove.png' title='Remove " + detailsEditArray[k].skuId+" from "+detailsEditArray[k].notation.replace(" ","")+" Storage System' style='height:14px;margin-left:12px;vertical_align:-2px;cursor:pointer;' onclick=removeProductFromBinStorageEdit('"+detailsEditArray[k].skuId+"','"+detailsEditArray[k].notation.replace(" ","")+"','"+contextPath+"','"+available+"')> </div>");
							$("#selectedLabelVal").html(detailsEditArray[k].notation);
						}
					}
				}
				if(flag == false){detailsEditArray.push(systemDetailsObjEdit);}
			}
			
	}
	//alert(JSON.stringify(parsedJson));
}

/* 05-10-2015  Sambaiah Y
 * This function is used to display selected location details right side of system*/

function addProductToCellEdit(id){
	$("#selectedLabelVal").html("");
	var location = $(id).attr("id");
	$("#"+selectedLocation).css("background","#FFFFFF");
	$("#"+location).css("background","#CCCCCC");
	
	$("#selectedLabelValEdit").html("&nbsp;&nbsp;"+$(id).attr("id"));
//	alert(availableGlobal);alert(JSON.stringify(parsedJson));
	if(availableGlobal == "exist"){
	for(var i =0;i<parsedJson.length;i++){
		if(location == parsedJson[i].notation){
			selectedLocation = location;
			if(parsedJson[i].skuId == "" || parsedJson[i].skuId == null ){
				$("#productSpanValueEdit").html("&nbsp;&nbsp;Product Not Added");
				$("#productSpanDescValueEdit").html("&nbsp;&nbsp;Product Not Added");
				$("#selectedItemQtyVal").html("&nbsp;&nbsp;0");
			break;}
			else{
				$("#productSpanValueEdit").html(parsedJson[i].skuId);
				$("#productSpanDescValueEdit").html(parsedJson[i].description);
				$("#selectedItemQtyVal").html(parsedJson[i].quantity);
				break;}
		}
	}
	}else if(availableGlobal == "new"){
		for(var i =0;i<detailsEditArray.length;i++){
			if(location == detailsEditArray[i].notation){
				selectedLocation = location;
				if(detailsEditArray[i].skuId == "" || detailsEditArray[i].skuId == null ){
					$("#productSpanValueEdit").html("&nbsp;&nbsp;Product Not Added");
					$("#productSpanDescValueEdit").html("&nbsp;&nbsp;Product Not Added");
					$("#selectedItemQtyVal").html("&nbsp;&nbsp;0");
				break;}
				else{
					$("#productSpanValueEdit").html(detailsEditArray[i].skuId);
					$("#productSpanDescValueEdit").html(detailsEditArray[i].description);
					$("#selectedItemQtyVal").html(parsedJson[i].quantity);
					break;}
			}
		}
		
		
	}
}

/* ADD PRODUCT TO THE SELECTED LOCATION  */
function appendSkuDetailsToCell(list){
	var contextPath = $("#contextPath").val();

	var selectedProduct = null,quantity = 0,description = null;
	var parsedJson1 = jQuery.parseJSON(list);
	$("#addSearchProduct").val("");
	skuList = parsedJson1.skuLists;
	for(var i=0;i<=skuList.length-1;i++){
		selectedProduct = skuList[i].skuId;
		quantity = quantity+skuList[i].quantity;
		description = skuList[i].description;
		$("#productSpanValueEdit").html(skuList[i].skuId);
		$("#productSpanDescValueEdit").html(skuList[i].description);
		$("#selectedItemQtyVal").html(quantity);
	}
	
	
	if(storageTypeGlobalEdit == "Rack" || storageTypeGlobalEdit == "Shelf" || storageTypeGlobalEdit == "Fridge" || storageTypeGlobalEdit == "Bin Array"){
	//remove existing one add new one
	if($("#"+selectedLocation).children().attr("id") == undefined){
		$("#"+selectedLocation).children().remove();
		$("#"+selectedLocation).append("<label id="+selectedLocation+""+selectedProduct+">"+selectedProduct+"</label><img src='"+contextPath+"/images/product_remove.png' title='Remove " + selectedProduct+" from "+selectedLocation+" ' style='height:14px;margin-left:12px;vertical_align:-2px;' onclick=removeProductFromStorageEdit('"+selectedProduct+"','"+selectedLocation+"','"+contextPath+"')>");
		if(availableGlobal == "exist"){
		for(var i = 0;i<parsedJson.length;i++){
			if(selectedLocation == parsedJson[i].notation){
				parsedJson[i].product = "";
				parsedJson[i].quantity = quantity;
				parsedJson[i].description = description;
				parsedJson[i].category = "";
				parsedJson[i].skuId = selectedProduct;
		}
	}
		}else if(availableGlobal == "new"){
			for(var i = 0;i<detailsEditArray.length;i++){
				if(selectedLocation == detailsEditArray[i].notation){
					detailsEditArray[i].product = "";
					detailsEditArray[i].quantity = quantity;
					detailsEditArray[i].description = description;
					detailsEditArray[i].category = "";
					detailsEditArray[i].skuId = selectedProduct;
			}
		}
		}
		$("#"+selectedLocation).attr("title","\n Sku Id : "+ selectedProduct +"\n\n" +
				"Description : "+ description +"\n");
	}
	else{
		alert("Product already there in selected column");
	}
	}else if(storageTypeGlobalEdit == "Bin" || storageTypeGlobalEdit == "Empty Area"){
		var notationIn = storageSystemIdGlobalEdit+storageTypeGlobalEdit.replace(" ","");
		if(availableGlobal == "exist"){
		for(var i = 0;i<parsedJson.length;i++){
			if(notationIn == parsedJson[i].notation){
				
				if(parsedJson[i].skuId == null || parsedJson[i].skuId == ""){
					parsedJson[i].product = "";
					parsedJson[i].quantity = quantity;
					parsedJson[i].description = description;
					parsedJson[i].category = "";
					parsedJson[i].skuId = selectedProduct;
				}else{
					systemDetailsObj = {
							storageSystemId : parsedJson[i].storageSystemId,
							level : parsedJson[i].level,
							column : parsedJson[i].column,
							product : "",
							quantity : quantity,
							description : description,
							category : "",
							skuId : selectedProduct,
							notation : parsedJson[i].notation
					};
					parsedJson.push(systemDetailsObj);
					break;
				}
	}
		}}else if(availableGlobal == "new"){
			for(var i = 0;i<detailsEditArray.length;i++){
				if(notationIn == detailsEditArray[i].notation){
					
					if(detailsEditArray[i].skuId == null || detailsEditArray[i].skuId == ""){
						detailsEditArray[i].product = "";
						detailsEditArray[i].quantity = quantity;
						detailsEditArray[i].description = description;
						detailsEditArray[i].category = "";
						detailsEditArray[i].skuId = selectedProduct;
					}else{
						systemDetailsObj = {
								storageSystemId : parsedJson[i].storageSystemId,
								level : parsedJson[i].level,
								column : parsedJson[i].column,
								product : "",
								quantity : quantity,
								description : description,
								category : "",
								skuId : selectedProduct,
								notation : parsedJson[i].notation
						};
						detailsEditArray.push(systemDetailsObj);
						break;
					}
		}
			}
			
		}
		$("#"+storageSystemIdGlobalEdit+""+storageTypeGlobalEdit.replace(" ","")).find("ul").append("<div id='"+storageSystemIdGlobalEdit+""+storageTypeGlobalEdit.replace(" ","")+"val' style='margin-left:-45px;'><label>"+selectedProduct+"</label><img src='"+contextPath+"/images/product_remove.png' title='Remove " + selectedProduct+" from "+notationIn+" Storage System' style='height:14px;margin-left:12px;vertical_align:-2px;cursor:pointer;' onclick=removeProductFromBinStorageEdit('"+selectedProduct+"','"+notationIn+"','"+contextPath+"')> </div>");
		$("#selectedLabelVal").html(storageSystemIdGlobalEdit+""+storageTypeGlobalEdit.replace(" ",""));
		
		//alert(JSON.stringify(detailsArray));
	}
}
/* 06-10-20154 Sambaiah Y
 * This method is used to remove the selected product from selected cell */

function removeProductFromStorageEdit(product,location,contextPath,available){
	//alert(product);alert(location);
	$("#"+location).children().remove();
	$("#"+location).append("<img src='"+contextPath+"/images/add_product.png' title='Select to Add Product'>");
	if(available == "exist"){
	for(var i = 0;i<parsedJson.length;i++){
		if(location == parsedJson[i].notation){
						parsedJson[i].product = "";
						parsedJson[i].quantity = "";
						parsedJson[i].category = "";
						parsedJson[i].skuId = "";
			
	}
}
	}else if(available == "new"){
		for(var i = 0;i<detailsEditArray.length;i++){
			if(location == detailsEditArray[i].notation){
				detailsEditArray[i].product = "";
				detailsEditArray[i].quantity = "";
				detailsEditArray[i].category = "";
				detailsEditArray[i].skuId = "";
			}
	}
	}
	$("#"+selectedLocation).attr("title","Select to Add Product");
}

function removeProductFromBinStorageEdit(product,location,contextPath,available){
	if(available == "exist"){
	for(var i = 0;i<parsedJson.length;i++){
		if(location == parsedJson[i].notation){
			if(parsedJson[i].skuId == product){
				parsedJson.splice(i,1);
				$("#"+location+"val").remove();
			}
	}
}
	}else if(available == "new"){
		for(var i = 0;i<detailsEditArray.length;i++){
			if(location == detailsEditArray[i].notation){
				if(detailsEditArray[i].skuId == product){
					parsedJson.splice(i,1);
					$("#"+location+"val").remove();
				}
		}
	}
	}
	
}
/* 06-10-2015  Sambaiah Y
 * This function is used to update the selected storage system details on database */
function updateStorageSystemDetails(){
	if(availableGlobal == "exist"){
	var contextPath = $("#contextPath").val();
	URL = contextPath + "/outletconfigurations/updateStorageSystemDetails.do";
	$.ajax({
	type: "POST",
	url : URL,
	data : {
		storageSystemId : globalStorageSysId,
		storagesInfo : JSON.stringify(parsedJson)
		},
			beforeSend: function(xhr){                    
	   				$("#loading").css("display","block");
	   				$("#mainDiv").addClass("disabled");
	        },
			success : function(result) {
				debugger
				//appendToView(result,selectedId,type);
				if(result.includes("Successfully"))
					$("#systemNameEdit").html(result).css("color","blue");
				else
				  $("#systemNameEdit").html(result).css("color","red");
				 $("#loading").css("display","none");
  			   $("#mainDiv").removeClass('disabled');

			},
			error : function() {
				alert("something went wrong");
				 $("#loading").css("display","none");
  			   $("#mainDiv").removeClass('disabled');

			}
		});
}else if(availableGlobal == "new"){
	var det = [];
	var deta = {};
	var currentSys = "";
			for(var i=0;i<editstorageArray.length;i++){
				for(var j = 0;j<=detailsEditArray.length-1;j++){
					/*alert(detailsEditArray[j].storageSystemId);
					var storageSystemsId = detailsEditArray[j].storageSystemId.replace("S","");
					alert(storageSystemsId);
					var finalStorage = parseInt(storageSystemsId)+1;
					alert(finalStorage);
					var storageSystemId = "editOutletStorageSystem"+finalStorage;
					alert(storageSystemId);*/
					
					var storageSystemsId = detailsEditArray[j].storageSystemId.replace("S","");
					//var storageSystemsId = selectedId.replace("editOutletStorageSystem","");
					var finalStorage = parseInt(storageSystemsId)+1;
					var locationIDD = "editOutletStorageSystem"+finalStorage;
					if(editstorageArray[i].storageSystemId == locationIDD+"id" && storageSystemIdGlobalEdit == detailsEditArray[j].storageSystemId){
						currentSys = detailsEditArray[j].storageSystemId;
						deta = {
								storageSystemId : detailsEditArray[j].storageSystemId,
								level : detailsEditArray[j].level,
								column : detailsEditArray[j].column,
								product : detailsEditArray[j].product,
								quantity : detailsEditArray[j].quantity,
								description : detailsEditArray[j].description,
								category : detailsEditArray[j].category,
								skuId : detailsEditArray[j].skuId,
								notation : detailsEditArray[j].notation
						};
						
						det.push(deta);
					}
					
				}//alert(currentSys);
				//alert(storageSystemIdGlobalEdit);
				//alert(currentSys);
				if(storageSystemIdGlobalEdit == currentSys)
					editstorageArray[i].storagesInformation = det;
			}

}
//	console.log(JSON.stringify(editstorageArray));
	//alert(JSON.stringify(detailsEditArray))
}
