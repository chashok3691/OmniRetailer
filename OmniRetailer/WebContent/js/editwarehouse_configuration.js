var count = 0;
$(function() {

	var contextPath = $("#contextPath").val();
	$( "#editwarehouse_racks" ).draggable({helper:"clone"});	
	$( "#editwarehouse_palettes" ).draggable({helper:"clone"});
	$( "#editwarehouse_bins" ).draggable({helper:"clone"});
	$( "#editwarehouse_bayarea" ).draggable({helper:"clone"});
	/* invoke when we drop the element */
	$( "#editdroppable" ).droppable({
	drop: function(event, ui ) {
			var $newPosY = 0;
		var $newPosX = ui.offset.left - $("#editdroppable").offset().left;
		if(count == 0){editcount = editcount+1;count = count+1;}
		if(editcount==null || editcount == 0){
			$newPosY = ui.offset.top - $("#editdroppable").offset().top;
		//positiontop = ui.offset.top - $("#editdroppable").offset().top;
		}
		else{
			if(editcount>=2){
				$newPosY = ui.offset.top - $("#editdroppable").offset().top;
			$newPosY =$newPosY -64*(editcount-1);
			}
			else{
				$newPosY = ui.offset.top - $("#editdroppable").offset().top;
				$newPosY = $newPosY-64;
			}
			}
		var draggingElement=ui.draggable.attr("id"); //for storing the current dragging element id
		
		var currentSelection="editStorageSystem"+editcount;    //for storing the element id locally
			if(draggingElement == "editwarehouse_racks"){
			$( this ).find("ul")
			.before('<div style="left:'+Math.ceil($newPosX)+'px;top:'+$newPosY+'px;width:64px;" id='+"'"+currentSelection+"id'"+' class='+"'"+currentSelection+"class'"+' title="">'
						+'<img src='+"'"+contextPath+"/images/warehouse-racks.png'"+'  style="cursor:pointer;" id='+"'"+currentSelection+"imageid'"+' class='+"'"+currentSelection+"imageclass'"+' onclick="showEditStorageSystemDetails('+"'"+currentSelection+"'"+')">'
						+'<div style="border:1px solid #CCCCCC;width:210px;margin-top:-15px;display:none;position:absolute;background:#CCCCCC;z-index: 999;" id="'+currentSelection+"Details"+'">'
						+'<br><center style="margin-top: -15px;"><span id='+currentSelection+"span"+'>Storage System Details</span></center><hr style="margin-top: 1px;border: 1px solid #CCCCCC;margin-bottom: 5px;">'
						+'<span>Storage System Name : </span><input type="text" name = '+currentSelection+"name"+'  class="form-control" id="'+currentSelection+"name"+'">'
						+'<span>Product Category : </span><select name = '+currentSelection+"producttype"+' class="form-control" id="'+currentSelection+"producttype"+'">'
						+'</select>'
						+'<div><div style="width:50%;"><span>No of Rows</span><input type="number" name = '+currentSelection+"rows"+' value="5" class="form-control" id="'+currentSelection+"rows"+'"></div>'
						+'<div style="width:50%;margin-top: -26%;margin-left:50%;"><span>No of Columns</span><input type="number" name = '+currentSelection+"columns"+' value="5" class="form-control" id="'+currentSelection+"columns"+'"></div></div>'
						+'<div><div style="width:50%;"><span>Row Location</span><input type="text" name = '+currentSelection+"rowNotation"+' value="" class="form-control" placeholder = "Row Notation" id="'+currentSelection+"rowNotation"+'"></div>'
						+'<div style="width:50%;margin-top: -25.7%;margin-left:50%;"><span>Column Location</span><input type="text" name = '+currentSelection+"columnNotation"+' value="" placeholder = "Column Notation"  class="form-control" id="'+currentSelection+"columnNotation"+'"></div></div>'
						+'<span>Actions : </span><hr style="margin-top: 1px;border: 1px solid #CCCCCC;margin-bottom: 5px;"><img src="'+contextPath+'/images/view.png" id='+"'"+currentSelection+"viewStorageSystem'"+' style="display:;cursor:pointer;height:33px;margin-left:19px;margin-top:-7px;" onclick="viewStorageSystem('+"'"+currentSelection+"'"+')" title="View Storage System" title="View Storage System"><img src="'+contextPath+'/images/remove.png" id='+"'"+currentSelection+"removeStorageSystem'"+' style="display:;cursor:pointer;height:29px;margin-left:17px;margin-top:-6px;" onclick="removeEditStorageSystem('+"'"+currentSelection+"'"+')" title="Remove Storage System">'
						+'<img src="'+contextPath+'/images/ok.png" id='+"'"+currentSelection+"saveStorageSystemDetails'"+' style="display:;cursor:pointer;height:23px;margin-left:17px;margin-top:-4px;" onclick="saveEditStorageSystemDetails('+"'"+currentSelection+"'"+')" title="Save Storage System Details"><img src="'+contextPath+'/images/cancel.png" id='+"'"+currentSelection+"closeStorageSystemDetails'"+' style="display:;cursor:pointer;height:26px;margin-left:18px;margin-top:-4px;" onclick="closeEditStorageSystemDetails('+"'"+currentSelection+"'"+')" title="Close Storage System Details">'
					+'<center><label id="'+currentSelection+"message"+'" style="color:#666666;text-decoration:blink;"></label></center></div></div>');
						
			prepareJsonforEditStorageSystems(draggingElement,currentSelection);
					editcount=editcount+1;
		}
			else if(draggingElement == "editwarehouse_palettes"){
				$( this ).find("ul")
				.before('<div style="left:'+Math.ceil($newPosX)+'px;top:'+$newPosY+'px;width:64px;" id='+"'"+currentSelection+"id'"+' class='+"'"+currentSelection+"class'"+' title="">'
						+'<img src='+"'"+contextPath+"/images/warehouse-shelves.png'"+'  style="cursor:pointer;" id='+"'"+currentSelection+"imageid'"+' class='+"'"+currentSelection+"imageclass'"+' onclick="showEditStorageSystemDetails('+"'"+currentSelection+"'"+')">'
						+'<div style="border:1px solid #CCCCCC;width:210px;display:none;position:absolute;margin-top:-15px;background:#CCCCCC;z-index: 999;" id="'+currentSelection+"Details"+'">'
						+'<br><center style="margin-top: -15px;"><span id='+currentSelection+"span"+'>Storage System Details</span></center><hr style="margin-top: 1px;border: 1px solid #CCCCCC;margin-bottom: 5px;">'
						+'<span>Storage System Name : </span><input type="text" name = '+currentSelection+"name"+' class="form-control" id="'+currentSelection+"name"+'">'
						+'<span>Product Category : </span><select name = '+currentSelection+"producttype"+' class="form-control" id="'+currentSelection+"producttype"+'">'
						+'</select>'
						+'<div><div style="width:50%;"><span>No of Rows</span><input type="number" name = '+currentSelection+"rows"+' value="5" class="form-control" id="'+currentSelection+"rows"+'"></div>'
						+'<div style="width:50%;margin-top: -26%;margin-left:50%;"><span>No of Columns</span><input type="number" name = '+currentSelection+"columns"+' value="5" class="form-control" id="'+currentSelection+"columns"+'"></div></div>'
						+'<div><div style="width:50%;"><span>Row Location</span><input type="text" name = '+currentSelection+"rowNotation"+' value="" class="form-control" placeholder = "Row Notation" id="'+currentSelection+"rowNotation"+'"></div>'
						+'<div style="width:50%;margin-top: -25.7%;margin-left:50%;"><span>Column Location</span><input type="text" name = '+currentSelection+"columnNotation"+' value="" placeholder = "Column Notation"  class="form-control" id="'+currentSelection+"columnNotation"+'"></div></div>'
						+'<span>Actions : </span><hr style="margin-top: 1px;border: 1px solid #CCCCCC;margin-bottom: 5px;"><img src="'+contextPath+'/images/view.png" id='+"'"+currentSelection+"viewStorageSystem'"+' style="display:;cursor:pointer;height:33px;margin-left:19px;margin-top:-7px;" onclick="viewStorageSystem('+"'"+currentSelection+"'"+')" title="View Storage System" title="View Storage System"><img src="'+contextPath+'/images/remove.png" id='+"'"+currentSelection+"removeStorageSystem'"+' style="display:;cursor:pointer;height:29px;margin-left:17px;margin-top:-6px;" onclick="removeEditStorageSystem('+"'"+currentSelection+"'"+')" title="Remove Storage System">'
						+'<img src="'+contextPath+'/images/ok.png" id='+"'"+currentSelection+"saveStorageSystemDetails'"+' style="display:;cursor:pointer;height:23px;margin-left:17px;margin-top:-4px;" onclick="saveEditStorageSystemDetails('+"'"+currentSelection+"'"+')" title="Save Storage System Details"><img src="'+contextPath+'/images/cancel.png" id='+"'"+currentSelection+"closeStorageSystemDetails'"+' style="display:;cursor:pointer;height:26px;margin-left:18px;margin-top:-4px;" onclick="closeEditStorageSystemDetails('+"'"+currentSelection+"'"+')" title="Close Storage System Details">'
					+'<center><label id="'+currentSelection+"message"+'" style="color:#666666;text-decoration:blink;"></label></center></div></div>');
						
				prepareJsonforEditStorageSystems(draggingElement,currentSelection);
					editcount=editcount+1;
				}
			else if(draggingElement == "editwarehouse_bins"){
				$( this ).find("ul")
				.before('<div style="left:'+Math.ceil($newPosX)+'px;top:'+$newPosY+'px;width:64px;" id='+"'"+currentSelection+"id'"+' class='+"'"+currentSelection+"class'"+' title="">'
						+'<img src='+"'"+contextPath+"/images/warehouse-bin.png'"+'  style="cursor:pointer;" id='+"'"+currentSelection+"imageid'"+' class='+"'"+currentSelection+"imageclass'"+' onclick="showEditStorageSystemDetails('+"'"+currentSelection+"'"+')">'
						+'<div style="border:1px solid #CCCCCC;width:210px;display:none;position:absolute;margin-top:-15px;background:#CCCCCC;z-index: 999;" id="'+currentSelection+"Details"+'">'
						+'<br><center style="margin-top: -15px;"><span id='+currentSelection+"span"+'>Storage System Details</span></center><hr style="margin-top: 1px;border: 1px solid #CCCCCC;margin-bottom: 5px;">'
						+'<span>Storage System Name : </span><input type="text" name = '+currentSelection+"name"+' class="form-control" id="'+currentSelection+"name"+'">'
						+'<span>Product Category : </span><select name = '+currentSelection+"producttype"+' class="form-control" id="'+currentSelection+"producttype"+'">'
						+'</select>'
						+'<div><div style="width:50%;"><span>Height</span><input type="number" name = '+currentSelection+"rows"+' value="" class="form-control" id="'+currentSelection+"rows"+'"></div>'
						+'<div style="width:50%;margin-top: -26%;margin-left:50%;"><span>Width</span><input type="number" name = '+currentSelection+"columns"+' value="" class="form-control" id="'+currentSelection+"columns"+'"></div></div>'
						+'<div><div style="width:50%;"><span>Row Location</span><input type="text" name = '+currentSelection+"rowNotation"+' value="" class="form-control" placeholder = "Row Notation" id="'+currentSelection+"rowNotation"+'"></div>'
						+'<div style="width:50%;margin-top: -25.7%;margin-left:50%;"><span>Column Location</span><input type="text" name = '+currentSelection+"columnNotation"+' value="" placeholder = "Column Notation"  class="form-control" id="'+currentSelection+"columnNotation"+'"></div></div>'
						+'<span>Actions : </span><hr style="margin-top: 1px;border: 1px solid #CCCCCC;margin-bottom: 5px;"><img src="'+contextPath+'/images/view.png" id='+"'"+currentSelection+"viewStorageSystem'"+' style="display:;cursor:pointer;height:33px;margin-left:19px;margin-top:-7px;" onclick="viewStorageSystem('+"'"+currentSelection+"'"+')" title="View Storage System" title="View Storage System"><img src="'+contextPath+'/images/remove.png" id='+"'"+currentSelection+"removeStorageSystem'"+' style="display:;cursor:pointer;height:29px;margin-left:17px;margin-top:-6px;" onclick="removeEditStorageSystem('+"'"+currentSelection+"'"+')" title="Remove Storage System">'
						+'<img src="'+contextPath+'/images/ok.png" id='+"'"+currentSelection+"saveStorageSystemDetails'"+' style="display:;cursor:pointer;height:23px;margin-left:17px;margin-top:-4px;" onclick="saveEditStorageSystemDetails('+"'"+currentSelection+"'"+')" title="Save Storage System Details"><img src="'+contextPath+'/images/cancel.png" id='+"'"+currentSelection+"closeStorageSystemDetails'"+' style="display:;cursor:pointer;height:26px;margin-left:18px;margin-top:-4px;" onclick="closeEditStorageSystemDetails('+"'"+currentSelection+"'"+')" title="Close Storage System Details">'
					+'<center><label id="'+currentSelection+"message"+'" style="color:#666666;text-decoration:blink;"></label></center></div></div>');
						
				prepareJsonforEditStorageSystems(draggingElement,currentSelection);
					editcount=editcount+1;
				}
			else if(draggingElement == "editwarehouse_bayarea"){
				$( this ).find("ul")
				.before('<div style="left:'+Math.ceil($newPosX)+'px;top:'+$newPosY+'px;width:64px;" id='+"'"+currentSelection+"id'"+' class='+"'"+currentSelection+"class'"+' title="">'
						+'<img src='+"'"+contextPath+"/images/warehouse-bayarea.png'"+'  style="cursor:pointer;" id='+"'"+currentSelection+"imageid'"+' class='+"'"+currentSelection+"imageclass'"+' onclick="showEditStorageSystemDetails('+"'"+currentSelection+"'"+')">'
						+'<div style="border:1px solid #CCCCCC;width:210px;display:none;position:absolute;margin-top:-15px;background:#CCCCCC;z-index: 999;" id="'+currentSelection+"Details"+'">'
						+'<br><center style="margin-top: -15px;"><span id='+currentSelection+"span"+'>Storage System Details</span></center><hr style="margin-top: 1px;border: 1px solid #CCCCCC;margin-bottom: 5px;">'
						+'<span>Storage System Name : </span><input type="text" name = '+currentSelection+"name"+' class="form-control" id="'+currentSelection+"name"+'">'
						+'<span>Product Category : </span><select name = '+currentSelection+"producttype"+' class="form-control" id="'+currentSelection+"producttype"+'">'
						+'</select>'
						+'<div><div style="width:50%;"><span>Height</span><input type="number" name = '+currentSelection+"rows"+' value="" class="form-control" id="'+currentSelection+"rows"+'"></div>'
						+'<div style="width:50%;margin-top: -26%;margin-left:50%;"><span>Width</span><input type="number" name = '+currentSelection+"columns"+' value="" class="form-control" id="'+currentSelection+"columns"+'"></div></div>'
						+'<div><div style="width:50%;"><span>Row Location</span><input type="text" name = '+currentSelection+"rowNotation"+' value="" class="form-control" placeholder = "Row Notation" id="'+currentSelection+"rowNotation"+'"></div>'
						+'<div style="width:50%;margin-top: -25.7%;margin-left:50%;"><span>Column Location</span><input type="text" name = '+currentSelection+"columnNotation"+' value="" placeholder = "Column Notation"  class="form-control" id="'+currentSelection+"columnNotation"+'"></div></div>'
						+'<span>Actions : </span><hr style="margin-top: 1px;border: 1px solid #CCCCCC;margin-bottom: 5px;"><img src="'+contextPath+'/images/view.png" id='+"'"+currentSelection+"viewStorageSystem'"+' style="display:;cursor:pointer;height:33px;margin-left:19px;margin-top:-7px;" onclick="viewStorageSystem('+"'"+currentSelection+"'"+')" title="View Storage System" title="View Storage System"><img src="'+contextPath+'/images/remove.png" id='+"'"+currentSelection+"removeStorageSystem'"+' style="display:;cursor:pointer;height:29px;margin-left:17px;margin-top:-6px;" onclick="removeEditStorageSystem('+"'"+currentSelection+"'"+')" title="Remove Storage System">'
						+'<img src="'+contextPath+'/images/ok.png" id='+"'"+currentSelection+"saveStorageSystemDetails'"+' style="display:;cursor:pointer;height:23px;margin-left:17px;margin-top:-4px;" onclick="saveEditStorageSystemDetails('+"'"+currentSelection+"'"+')" title="Save Storage System Details"><img src="'+contextPath+'/images/cancel.png" id='+"'"+currentSelection+"closeStorageSystemDetails'"+' style="display:;cursor:pointer;height:26px;margin-left:18px;margin-top:-4px;" onclick="closeEditStorageSystemDetails('+"'"+currentSelection+"'"+')" title="Close Storage System Details">'
					+'</div></div>');
						
				prepareJsonforEditStorageSystems(draggingElement,currentSelection);
					editcount=editcount+1;
				}
			
			//$("."+currentSelection+"selected").resizable();
			$("."+currentSelection+"class").draggable();
			if(detailsvisible == false){
				//alert("Hello");
				detailsvisible = true;
			}
		}

	});
	
});


/* 29-06-2015   Sambaiah Y
 * 
 *  This function is used to prepare the json for the dragged element 
 *  */

function prepareJsonforEditStorageSystems(storageType,storageId){
	debugger;
	var type = null;
	if(storageType == "editwarehouse_bayarea"){type="Empty Area";}
	else if(storageType == "editwarehouse_bins"){type="Bin";}
	else if(storageType == "editwarehouse_palettes"){type="Palette";}
	else if(storageType == "editwarehouse_racks"){type="Racks";}
	
	editstoragesObj = {
			"editSystemId" : "", 
			"storageSystemId" : storageId+"id", 
			"currentStock" : 0,
			"storageSystemCapacity" : " ",
			"storageSystemName" : storageType,
			"productId" :"",
			"rows" : "",
			"columns" : "",
			"rowNotation" : "",
			"columnNotation" : "",
			"storageSystemNotation" :"",
			"storageLocation" : " ",
			"storageSystemType" : type,
			"display" : "visible",
			
	};
	editwareHouseStorages.editstorageArray.push(editstoragesObj);
	//alert(JSON.stringify(editwareHouseStorages));
}

/* 29-06-2015  Sambaiah Y 
 * /* for disply and hide the storagesystem details  */
var detailsvisible = false,selectedStorageLocation = null;
function showEditStorageSystemDetails(selectedId){
	
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
 
/*  29-06-2015  Sambaiah Y
 * for removing the selected storage system */
function removeEditStorageSystem(selectedId){
	$("#"+selectedId+"id").css("visibility","hidden");
	
	/* add empty details to selected id */
	for(var i=0;i<editstorageArray.length;i++){
		//"editSystemId" : $("#"+storageId+"systemId").val(), 
		if(editstorageArray[i].storageSystemId == selectedId+"id"){
			//editstorageArray[i].storageSystemId = "NO Id";
			//editstorageArray[i].storageSystemName = "NO Store";
			editstorageArray[i].storageSystemName = "NO Store";
			editstorageArray[i].productId = "No Category";
			editstorageArray[i].rows = 5;
			editstorageArray[i].columns = 5;
			editstorageArray[i].rowNotation = "NON";
			editstorageArray[i].columnNotation = "NON";
			editstorageArray[i].storageSystemNotation = "NON";
			editstorageArray[i].StorageSystemCapacity = 0;
			editstorageArray[i].display = "hidden";
		}
}	//alert(JSON.stringify(editwareHouseStorages));

	
}

/* 29-06-2015  Sambaiah Y 
 * This function is used save the selected storage system details */
function saveEditStorageSystemDetails(selectedId){
	var name = $("#"+selectedId+"name").val();
	var rows = $("#"+selectedId+"rows").val();
	var columns = $("#"+selectedId+"columns").val();
	var category = $("#"+selectedId+"producttype").val();
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
	if(category ==null || category =="" || category ==undefined){
		$("#"+selectedId+"span").html("Category Required").css("color","red");
		return;
	}
	if(rowNotation ==null || rowNotation =="" || rowNotation ==undefined){
		$("#"+selectedId+"span").html("Row Location Required").css("color","red");
		return;
	}
	if(columnNotation ==null || columnNotation =="" || columnNotation ==undefined){
		$("#"+selectedId+"span").html("Column Location Required").css("color","red");
		return;
	}
	
	for(var i=0;i<editstorageArray.length;i++){
		
		/* for finding the storage system location is already there or not */
			if(editstorageArray[i].storageSystemNotation == rowNotation+columnNotation){
			if(editstorageArray[i].storageSystemId == selectedId+"id"){
			}
			else{
				$("#"+selectedId+"span").html("Duplicate Location").css("color","red");
				$("#"+selectedId+"rowNotation").attr("value","");
				$("#"+selectedId+"columnNotation").attr("value","");
			return;
			}
		}
			
			/* for finding the storage system name is already there or not */
			if(editstorageArray[i].storageSystemName == name){
			if(editstorageArray[i].storageSystemId == selectedId+"id"){
			}
			else{
				$("#"+selectedId+"span").html("Duplicate Storage System Name").css("color","red");
				
			return;
			}
		}
			if(editstorageArray[i].storageSystemId == selectedId+"id"){
			editstorageArray[i].storageSystemName = name;
			editstorageArray[i].productId = category;
			editstorageArray[i].rows = rows;
			editstorageArray[i].columns = columns;
			editstorageArray[i].rowNotation = rowNotation;
			editstorageArray[i].columnNotation = columnNotation;
			editstorageArray[i].storageSystemNotation = rowNotation+columnNotation;
			editstorageArray[i].storageSystemCapacity = rows*columns;
		}
	}
	$("#"+selectedId+"name").attr("value",name);
	$("#"+selectedId+"rows").attr("value",rows);
	$("#"+selectedId+"columns").attr("value",columns);
	$("#"+selectedId+"producttype").attr("value",category);
	$("#"+selectedId+"rowNotation").attr("value",rowNotation);
	$("#"+selectedId+"columnNotation").attr("value",columnNotation);
	
	
		/* 24-05-2015 Sambaiah Y
		 * added to hide the storage systems details popup */
		selectedStorageLocation = null;
		$("#"+selectedId+"Details").fadeOut();
		$("#"+selectedId+"message").html("");
		detailsvisible = false;
}
/* close the storage system details */
function closeEditStorageSystemDetails(selectedId){
	selectedStorageLocation = null;
	$("#"+selectedId+"Details").fadeOut();
	$("#"+selectedId+"message").html("");
	detailsvisible = false;
}
/* 29-06-2015   Sambaiah Y
 * for preparing the json data for already existing storage systems  */
var editcount = 0;
function prepareJsonForExistingStorageSystems(){
	
	var child = $("#editdroppable").children("div");
	
	for(var j=0;j<child.length;j++){
		var id = child[j].id;
		id = id.replace("id","");
		id=id.trim();
		prepareJsonforeditStorageSystems($("#"+id+"type").val(),id);
		editcount = editcount+1;
	}
	
	$(".editcurrentSelectionclass").draggable();
}

/* 27-06-2015   Sambaiah Y
 * prepare json for the existing storage systems and
 * newly added storage systems
 */ 
var editwareHouseStorages = {},editstorageArray = [],editstoragesObj={};
function prepareJsonforeditStorageSystems(storageType,storageId){
	editwareHouseStorages.editstorageArray = editstorageArray;
	
	editstoragesObj = {
			"editSystemId" : $("#"+storageId+"systemId").val(), 
			"storageSystemId" : storageId+"id", 
			"currentStock" : $("#"+storageId+"currentStock").val(),
			"StorageSystemCapacity" :$("#"+storageId+"capacity").val(),
			"storageSystemName" : $("#"+storageId+"name").val(), 
			"productId" : $("#"+storageId+"productType").val(),
			"rows" : $("#"+storageId+"rows").val(),
			"columns" : $("#"+storageId+"rows").val(),
			"rowNotation" : $("#"+storageId+"rowNotation").val(),
			"columnNotation" : $("#"+storageId+"columnNotation").val(),
			"storageSystemNotation" :$("#"+storageId+"rowNotation").val()+$("#"+storageId+"columnNotation").val(),
			"storageLocation" : " ",
			"storageSystemType" : storageType,
			"display" : $("#"+storageId+"visibility").val()
			
	};
	editwareHouseStorages.editstorageArray.push(editstoragesObj);
	//alert(JSON.stringify(editwareHouseStorages));
}
/* 29-06-2015  Sambaiah Y 
 * This function is used to update the storage system detilas 
 */
function updateWarehouseStorageSystems(warehouseId){
	debugger;
	var left = 0,top=0;
	for(var si=0;si<=editstorageArray.length-1;si++){
		var style = $("#"+editstorageArray[si].storageSystemId).attr("style");
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
		if(editstorageArray[i].rowNotation==null || editstorageArray[i].rowNotation==""){
			$("#Error").html("Row Location Required for all storages").css("color","red");
			$("#"+editstorageArray[i].storageSystemId).css("background","red");
			return;
		}
		if(editstorageArray[i].columnNotation==null || editstorageArray[i].columnNotation==""){
			$("#Error").html("Column Location Required for all storages").css("color","red");
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
	
	var contextPath = $("#contextPath").val();
	URL = contextPath + "/inventorymanager/updatewarehousestoragesystems.do";
	$.ajax({
	type: "POST",
	url : URL,
	data : {
		warehouseId : warehouseId,
		storageStstemDetails :  JSON.stringify(editwareHouseStorages)
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
