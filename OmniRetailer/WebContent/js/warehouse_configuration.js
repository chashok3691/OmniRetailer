var count = 0,count_value = 0;
var positiontop=null;
var categories = null;
$(function() {
	
	var contextPath = $("#contextPath").val();
	$( "#warehouse_racks" ).draggable({helper:"clone"});	
	$( "#warehouse_palettes" ).draggable({helper:"clone"});
	$( "#warehouse_bins" ).draggable({helper:"clone"});
	$( "#warehouse_bayarea" ).draggable({helper:"clone"});
	/* invoke when we drop the element */
	$( "#droppable" ).droppable({
	drop: function(event, ui ) {
			var $newPosY = 0;
		var $newPosX = ui.offset.left - $("#droppable").offset().left;
		if(positiontop==null){
			$newPosY = ui.offset.top - $("#droppable").offset().top;
		positiontop = ui.offset.top - $("#droppable").offset().top;
		}
		else{
			if(count_value>=2){
				$newPosY = ui.offset.top - $("#droppable").offset().top;
			$newPosY =$newPosY -64*(count_value);
			}
			else{
				$newPosY = ui.offset.top - $("#droppable").offset().top;
				$newPosY = $newPosY-64;
			}
			}
		var draggingElement=ui.draggable.attr("id"); //for storing the current dragging element id
		var currentSelection="storageSystem"+count;    //for storing the element id locally
			if(draggingElement == "warehouse_racks"){
			$( this ).find("ul")
			.before('<div style="left:'+Math.ceil($newPosX)+'px;top:'+$newPosY+'px;width:64px;" id='+"'"+currentSelection+"id'"+' class='+"'"+currentSelection+"class'"+' title="">'
						+'<img src='+"'"+contextPath+"/images/warehouse-racks.png'"+'  style="cursor:pointer;" id='+"'"+currentSelection+"imageid'"+' class='+"'"+currentSelection+"imageclass'"+' onclick="showStorageSystemDetails('+"'"+currentSelection+"'"+')">'
						+'<div style="border:1px solid #CCCCCC;width:210px;margin-top:-15px;display:none;position:absolute;background:#CCCCCC;z-index: 999;" id="'+currentSelection+"Details"+'">'
						+'<br><center style="margin-top: -15px;"><span id='+currentSelection+"span"+'>Storage System Details</span></center><hr style="margin-top: 1px;border: 1px solid #CCCCCC;margin-bottom: 5px;">'
						+'<span>Storage System Name : </span><input type="text" name = '+currentSelection+"name"+' class="form-control" id="'+currentSelection+"name"+'">'
						+'<span>Product Category : </span><select name = '+currentSelection+"producttype"+' class="form-control" id="'+currentSelection+"producttype"+'">'
						+'</select>'
						+'<div><div style="width:50%;"><span>No of Rows</span><input type="number" name = '+currentSelection+"rows"+' value="5" class="form-control" id="'+currentSelection+"rows"+'"></div>'
						+'<div style="width:50%;margin-top: -26%;margin-left:50%;"><span>No of Columns</span><input type="number" name = '+currentSelection+"columns"+' value="5" class="form-control" id="'+currentSelection+"columns"+'"></div></div>'
						+'<div><div style="width:50%;"><span>Row Location</span><input type="text" name = '+currentSelection+"rowNotation"+' value="" class="form-control" placeholder = "Row Notation" id="'+currentSelection+"rowNotation"+'"></div>'
						+'<div style="width:50%;margin-top: -25.7%;margin-left:50%;"><span>Column Location</span><input type="text" name = '+currentSelection+"columnNotation"+' value="" placeholder = "Column Notation"  class="form-control" id="'+currentSelection+"columnNotation"+'"></div></div>'
						+'<span>Actions : </span><hr style="margin-top: 1px;border: 1px solid #CCCCCC;margin-bottom: 5px;"><img src="'+contextPath+'/images/view.png" id='+"'"+currentSelection+"viewStorageSystem'"+' style="display:;cursor:pointer;height:33px;margin-left:19px;margin-top:-7px;" onclick="viewStorageSystem('+"'"+currentSelection+"'"+')" title="View Storage System" title="View Storage System"><img src="'+contextPath+'/images/remove.png" id='+"'"+currentSelection+"removeStorageSystem'"+' style="display:;cursor:pointer;height:29px;margin-left:17px;margin-top:-6px;" onclick="removeStorageSystem('+"'"+currentSelection+"'"+')" title="Remove Storage System">'
						+'<img src="'+contextPath+'/images/ok.png" id='+"'"+currentSelection+"saveStorageSystemDetails'"+' style="display:;cursor:pointer;height:23px;margin-left:17px;margin-top:-4px;" onclick="saveStorageSystemDetails('+"'"+currentSelection+"'"+')" title="Save Storage System Details"><img src="'+contextPath+'/images/cancel.png" id='+"'"+currentSelection+"closeStorageSystemDetails'"+' style="display:;cursor:pointer;height:26px;margin-left:18px;margin-top:-4px;" onclick="closeStorageSystemDetails('+"'"+currentSelection+"'"+')" title="Close Storage System Details">'
					+'<center><label id="'+currentSelection+"message"+'" style="color:#666666;text-decoration:blink;"></label></center></div></div>');
						
					prepareJsonforStorageSystems(draggingElement,currentSelection);
					count=count+1;
					count_value = count_value+1;
		}
			else if(draggingElement == "warehouse_palettes"){
				$( this ).find("ul")
				.before('<div style="left:'+Math.ceil($newPosX)+'px;top:'+$newPosY+'px;width:64px;" id='+"'"+currentSelection+"id'"+' class='+"'"+currentSelection+"class'"+' title="">'
						+'<img src='+"'"+contextPath+"/images/warehouse-shelves.png'"+'  style="cursor:pointer;" id='+"'"+currentSelection+"imageid'"+' class='+"'"+currentSelection+"imageclass'"+' onclick="showStorageSystemDetails('+"'"+currentSelection+"'"+')">'
						+'<div style="border:1px solid #CCCCCC;width:210px;display:none;position:absolute;margin-top:-15px;background:#CCCCCC;z-index: 999;" id="'+currentSelection+"Details"+'">'
						+'<br><center style="margin-top: -15px;"><span id='+currentSelection+"span"+'>Storage System Details</span></center><hr style="margin-top: 1px;border: 1px solid #CCCCCC;margin-bottom: 5px;">'
						+'<span>Storage System Name : </span><input type="text" name = '+currentSelection+"name"+' class="form-control" id="'+currentSelection+"name"+'">'
						+'<span>Product Category : </span><select name = '+currentSelection+"producttype"+' class="form-control" id="'+currentSelection+"producttype"+'">'
						+'</select>'
						+'<div><div style="width:50%;"><span>No of Rows</span><input type="number" name = '+currentSelection+"rows"+' value="5" class="form-control" id="'+currentSelection+"rows"+'"></div>'
						+'<div style="width:50%;margin-top: -26%;margin-left:50%;"><span>No of Columns</span><input type="number" name = '+currentSelection+"columns"+' value="5" class="form-control" id="'+currentSelection+"columns"+'"></div></div>'
						+'<div><div style="width:50%;"><span>Row Location</span><input type="text" name = '+currentSelection+"rowNotation"+' value="" class="form-control" placeholder = "Row Notation" id="'+currentSelection+"rowNotation"+'"></div>'
						+'<div style="width:50%;margin-top: -25.7%;margin-left:50%;"><span>Column Location</span><input type="text" name = '+currentSelection+"columnNotation"+' value="" placeholder = "Column Notation"  class="form-control" id="'+currentSelection+"columnNotation"+'"></div></div>'
						+'<span>Actions : </span><hr style="margin-top: 1px;border: 1px solid #CCCCCC;margin-bottom: 5px;"><img src="'+contextPath+'/images/view.png" id='+"'"+currentSelection+"viewStorageSystem'"+' style="display:;cursor:pointer;height:33px;margin-left:19px;margin-top:-7px;" onclick="viewStorageSystem('+"'"+currentSelection+"'"+')" title="View Storage System" title="View Storage System"><img src="'+contextPath+'/images/remove.png" id='+"'"+currentSelection+"removeStorageSystem'"+' style="display:;cursor:pointer;height:29px;margin-left:17px;margin-top:-6px;" onclick="removeStorageSystem('+"'"+currentSelection+"'"+')" title="Remove Storage System">'
						+'<img src="'+contextPath+'/images/ok.png" id='+"'"+currentSelection+"saveStorageSystemDetails'"+' style="display:;cursor:pointer;height:23px;margin-left:17px;margin-top:-4px;" onclick="saveStorageSystemDetails('+"'"+currentSelection+"'"+')" title="Save Storage System Details"><img src="'+contextPath+'/images/cancel.png" id='+"'"+currentSelection+"closeStorageSystemDetails'"+' style="display:;cursor:pointer;height:26px;margin-left:18px;margin-top:-4px;" onclick="closeStorageSystemDetails('+"'"+currentSelection+"'"+')" title="Close Storage System Details">'
					+'<center><label id="'+currentSelection+"message"+'" style="color:#666666;text-decoration:blink;"></label></center></div></div>');
						
					prepareJsonforStorageSystems(draggingElement,currentSelection);
						count=count+1;
						count_value = count_value+1;
				}
			else if(draggingElement == "warehouse_bins"){
				$( this ).find("ul")
				.before('<div style="left:'+Math.ceil($newPosX)+'px;top:'+$newPosY+'px;width:64px;" id='+"'"+currentSelection+"id'"+' class='+"'"+currentSelection+"class'"+' title="">'
						+'<img src='+"'"+contextPath+"/images/warehouse-bin.png'"+'  style="cursor:pointer;" id='+"'"+currentSelection+"imageid'"+' class='+"'"+currentSelection+"imageclass'"+' onclick="showStorageSystemDetails('+"'"+currentSelection+"'"+')">'
						+'<div style="border:1px solid #CCCCCC;width:210px;display:none;position:absolute;margin-top:-15px;background:#CCCCCC;z-index: 999;" id="'+currentSelection+"Details"+'">'
						+'<br><center style="margin-top: -15px;"><span id='+currentSelection+"span"+'>Storage System Details</span></center><hr style="margin-top: 1px;border: 1px solid #CCCCCC;margin-bottom: 5px;">'
						+'<span>Storage System Name : </span><input type="text" name = '+currentSelection+"name"+' class="form-control" id="'+currentSelection+"name"+'">'
						+'<span>Product Category : </span><select name = '+currentSelection+"producttype"+' class="form-control" id="'+currentSelection+"producttype"+'">'
						+'</select>'
						+'<div><div style="width:50%;"><span>Height</span><input type="number" name = '+currentSelection+"rows"+' value="" class="form-control" id="'+currentSelection+"rows"+'"></div>'
						+'<div style="width:50%;margin-top: -26%;margin-left:50%;"><span>Width</span><input type="number" name = '+currentSelection+"columns"+' value="" class="form-control" id="'+currentSelection+"columns"+'"></div></div>'
						+'<div><div style="width:50%;"><span>Row Location</span><input type="text" name = '+currentSelection+"rowNotation"+' value="" class="form-control" placeholder = "Row Notation" id="'+currentSelection+"rowNotation"+'"></div>'
						+'<div style="width:50%;margin-top: -25.7%;margin-left:50%;"><span>Column Location</span><input type="text" name = '+currentSelection+"columnNotation"+' value="" placeholder = "Column Notation"  class="form-control" id="'+currentSelection+"columnNotation"+'"></div></div>'
						+'<span>Actions : </span><hr style="margin-top: 1px;border: 1px solid #CCCCCC;margin-bottom: 5px;"><img src="'+contextPath+'/images/view.png" id='+"'"+currentSelection+"viewStorageSystem'"+' style="display:;cursor:pointer;height:33px;margin-left:19px;margin-top:-7px;" onclick="viewStorageSystem('+"'"+currentSelection+"'"+')" title="View Storage System" title="View Storage System"><img src="'+contextPath+'/images/remove.png" id='+"'"+currentSelection+"removeStorageSystem'"+' style="display:;cursor:pointer;height:29px;margin-left:17px;margin-top:-6px;" onclick="removeStorageSystem('+"'"+currentSelection+"'"+')" title="Remove Storage System">'
						+'<img src="'+contextPath+'/images/ok.png" id='+"'"+currentSelection+"saveStorageSystemDetails'"+' style="display:;cursor:pointer;height:23px;margin-left:17px;margin-top:-4px;" onclick="saveStorageSystemDetails('+"'"+currentSelection+"'"+')" title="Save Storage System Details"><img src="'+contextPath+'/images/cancel.png" id='+"'"+currentSelection+"closeStorageSystemDetails'"+' style="display:;cursor:pointer;height:26px;margin-left:18px;margin-top:-4px;" onclick="closeStorageSystemDetails('+"'"+currentSelection+"'"+')" title="Close Storage System Details">'
					+'<center><label id="'+currentSelection+"message"+'" style="color:#666666;text-decoration:blink;"></label></center></div></div>');
						
					prepareJsonforStorageSystems(draggingElement,currentSelection);
						count=count+1;
						count_value = count_value+1;
				}
			else if(draggingElement == "warehouse_bayarea"){
				$( this ).find("ul")
				.before('<div style="left:'+Math.ceil($newPosX)+'px;top:'+$newPosY+'px;width:64px;" id='+"'"+currentSelection+"id'"+' class='+"'"+currentSelection+"class'"+' title="">'
						+'<img src='+"'"+contextPath+"/images/warehouse-bayarea.png'"+'  style="cursor:pointer;" id='+"'"+currentSelection+"imageid'"+' class='+"'"+currentSelection+"imageclass'"+' onclick="showStorageSystemDetails('+"'"+currentSelection+"'"+')">'
						+'<div style="border:1px solid #CCCCCC;width:210px;display:none;position:absolute;margin-top:-15px;background:#CCCCCC;z-index: 999;" id="'+currentSelection+"Details"+'">'
						+'<br><center style="margin-top: -15px;"><span id='+currentSelection+"span"+'>Storage System Details</span></center><hr style="margin-top: 1px;border: 1px solid #CCCCCC;margin-bottom: 5px;">'
						+'<span>Storage System Name : </span><input type="text" name = '+currentSelection+"name"+' class="form-control" id="'+currentSelection+"name"+'">'
						+'<span>Product Category : </span><select name = '+currentSelection+"producttype"+' class="form-control" id="'+currentSelection+"producttype"+'">'
						+'</select>'
						+'<div><div style="width:50%;"><span>Height</span><input type="number" name = '+currentSelection+"rows"+' value="" class="form-control" id="'+currentSelection+"rows"+'"></div>'
						+'<div style="width:50%;margin-top: -26%;margin-left:50%;"><span>Width</span><input type="number" name = '+currentSelection+"columns"+' value="" class="form-control" id="'+currentSelection+"columns"+'"></div></div>'
						+'<div><div style="width:50%;"><span>Row Location</span><input type="text" name = '+currentSelection+"rowNotation"+' value="" class="form-control" placeholder = "Row Notation" id="'+currentSelection+"rowNotation"+'"></div>'
						+'<div style="width:50%;margin-top: -25.7%;margin-left:50%;"><span>Column Location</span><input type="text" name = '+currentSelection+"columnNotation"+' value="" placeholder = "Column Notation"  class="form-control" id="'+currentSelection+"columnNotation"+'"></div></div>'
						+'<span>Actions : </span><hr style="margin-top: 1px;border: 1px solid #CCCCCC;margin-bottom: 5px;"><img src="'+contextPath+'/images/view.png" id='+"'"+currentSelection+"viewStorageSystem'"+' style="display:;cursor:pointer;height:33px;margin-left:19px;margin-top:-7px;" onclick="viewStorageSystem('+"'"+currentSelection+"'"+')" title="View Storage System" title="View Storage System"><img src="'+contextPath+'/images/remove.png" id='+"'"+currentSelection+"removeStorageSystem'"+' style="display:;cursor:pointer;height:29px;margin-left:17px;margin-top:-6px;" onclick="removeStorageSystem('+"'"+currentSelection+"'"+')" title="Remove Storage System">'
						+'<img src="'+contextPath+'/images/ok.png" id='+"'"+currentSelection+"saveStorageSystemDetails'"+' style="display:;cursor:pointer;height:23px;margin-left:17px;margin-top:-4px;" onclick="saveStorageSystemDetails('+"'"+currentSelection+"'"+')" title="Save Storage System Details"><img src="'+contextPath+'/images/cancel.png" id='+"'"+currentSelection+"closeStorageSystemDetails'"+' style="display:;cursor:pointer;height:26px;margin-left:18px;margin-top:-4px;" onclick="closeStorageSystemDetails('+"'"+currentSelection+"'"+')" title="Close Storage System Details">'
					+'<center><label id="'+currentSelection+"message"+'" style="color:#666666;text-decoration:blink;"></label></center></div></div>');
						
					prepareJsonforStorageSystems(draggingElement,currentSelection);
						count=count+1;
						count_value = count_value+1;
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
/* for removing the selected storage system */

function removeStorageSystem(selectedId){
	$("#"+selectedId+"id").css("visibility","hidden");
	
	/* add empty details to selected id */
	for(var i=0;i<storagesArray.length;i++){
		if(storagesArray[i].storageSystemId == selectedId+"id"){
			storagesArray[i].storageSystemName = "NO Store";
			storagesArray[i].productId = "No Category";
			storagesArray[i].rows = 5;
			storagesArray[i].columns = 5;
			storagesArray[i].rowNotation = "NON";
			storagesArray[i].columnNotation = "NON";
			storagesArray[i].storageSystemNotation = "NON";
			storagesArray[i].storageSystemCapacity = 0;
			storagesArray[i].display = "hidden";
		}
}
}
/* for disply and hide the storagesystem details  */
var detailsvisible = false,selectedStorageLocation = null;
function showStorageSystemDetails(selectedId){
	
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



function closeStorageSystemDetails(selectedId){
	selectedStorageLocation = null;
	$("#"+selectedId+"Details").fadeOut();
	$("#"+selectedId+"message").html("");
	detailsvisible = false;
}
/* save storage system details */
function saveStorageSystemDetails(selectedId){

	
	
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
	
	/* update storage systems array information */
	for(var i=0;i<storagesArray.length;i++){
		
		if(storagesArray[i].storageSystemNotation == rowNotation+columnNotation){
			if(storagesArray[i].storageSystemId == selectedId+"id"){}
			else{
				$("#"+selectedId+"span").html("Duplicate Location").css("color","red");
				$("#"+selectedId+"rowNotation").attr("value","");
				$("#"+selectedId+"columnNotation").attr("value","");
			return;
			}}
		
		if(storagesArray[i].storageSystemName == name){
			if(storagesArray[i].storageSystemId == selectedId+"id"){}
			else{
				$("#"+selectedId+"span").html("Duplicate Storage System Name").css("color","red");
			return;
			}}
		
		debugger;
		if(storagesArray[i].storageSystemId == selectedId+"id"){
			
			storagesArray[i].storageSystemName = name;
			storagesArray[i].productId = category;
			storagesArray[i].rows = rows;
			storagesArray[i].columns = columns;
			storagesArray[i].rowNotation = rowNotation;
			storagesArray[i].columnNotation = columnNotation;
			storagesArray[i].storageSystemNotation = rowNotation+columnNotation;
			storagesArray[i].storageSystemCapacity = rows*columns;
		}
	}
	
	$("#"+selectedId+"name").attr("value",name);
	$("#"+selectedId+"rows").attr("value",rows);
	$("#"+selectedId+"columns").attr("value",columns);
	$("#"+selectedId+"producttype").attr("value",category);
	$("#"+selectedId+"rowNotation").attr("value",rowNotation);
	$("#"+selectedId+"columnNotation").attr("value",columnNotation);
	
	
	$("#"+selectedId+"message").html("Success");
		/* 24-05-2015 Sambaiah Y
		 * added to hide the storage systems details popup */
		selectedStorageLocation = null;
		$("#"+selectedId+"Details").fadeOut();
		$("#"+selectedId+"message").html("");
		detailsvisible = false;
}
/* prepare json for selected element  */
var wareHouseStorages = {},storagesArray = [],storagesObj = {};
function prepareJsonforStorageSystems(storageType,storageId){
	wareHouseStorages.storageArray = storagesArray;
	var type = null;
	if(storageType == "warehouse_bayarea"){type="Empty Area";}
	else if(storageType == "warehouse_bins"){type="Bins";}
	else if(storageType == "warehouse_palettes"){type="Palette";}
	else if(storageType == "warehouse_racks"){type="Racks";}
	
	storagesObj = {
			"storageSystemId" : storageId+"id", 
			"currentStock" : 0,
			"storageSystemCapacity" : " ",
			"storageSystemName" : storageType,
			"productId" : "",
			"rows" : "",
			"columns" : "",
			"rowNotation" : "",
			"columnNotation" : "",
			"storageSystemNotation" :"",
			"storageLocation" : " ",
			"storageSystemType" : type,
			"display" : "visible",
			
	};
	wareHouseStorages.storageArray.push(storagesObj);
}




//koti








/* 19-06-2015 Sambaiah Y
 *   for move the warehouse details to configuration page
 *  */
function showWarehouseConfiguration(id){
	debugger;
	if($("#workLocation").val()==null || $("#workLocation").val()==""){
		$("#workLocation").focus();
		$("#locationErr").html("Please select Location");return;}
	else {$("#locationErr").html("");}
	
	if($("#warehouseName").val()==null || $("#warehouseName").val()==""){
		$("#warehouseName").focus();
		$("#warehouseNameErr").html("Enter Warehouse Name");return;}
	else{$("#warehouseNameErr").html("");}
	if($("#warehouseType").val()==null || $("#warehouseType").val()==""){
		$("#warehouseType").focus();
		$("#warehouseTypeErr").html("Enter Warehouse Type");return;}
	else {$("#warehouseTypeErr").html("");}
	 if($("#error").text() != ""){
		 $("#phoneNumber").focus();
		 return false;
	 }
	 var defaultCountry = $("#defaultCountry").val().trim();
	 var phoneNumber = $("#phoneNumber").val().trim();
	 if(defaultCountry != "" && phoneNumber != ""){
		 $("#mobileNumber").val(defaultCountry+"-"+phoneNumber);
	 }
	if($("#mobileNumber").val()==null || $("#mobileNumber").val()==""){
		$("#error").html("Enter Mobile Number");return;}
	else {$("#error").html("");}
	
	if($("#warehouseStatus").val()==null || $("#warehouseStatus").val()==""){
	$("#warehouseStatus").focus();
		$("#statusErr").html("Select Warehouse Status");return;}
	else {$("#statusErr").html("");}
	if($("#houseNo").val()==null || $("#houseNo").val()==""){
		$("#houseNo").focus();
		$("#houseNoErr").html("Enter House Number");return;}
	else {$("#houseNoErr").html("");}
	if($("#street").val()==null || $("#street").val()==""){
	$("#street").focus();
		$("#streetErr").html("Enter Street");return;}
	else {$("#streetErr").html("");}
	if($("#locality").val()==null || $("#locality").val()==""){
		$("#locality").focus();
		$("#localityErr").html("Enter Locality");return;}
	else {$("#localityErr").html("");}
	if($("#city").val()==null || $("#city").val()==""){
		$("#city").focus();
		$("#cityErr").html("Enter City");return;}
	else {$("#cityErr").html("");}
	if($("#state").val()==null || $("#state").val()==""){
		$("#state").focus();
		$("#stateErr").html("Enter State");return;}
	else {$("#stateErr").html("");}
	if($("#zip").val()==null || $("#zip").val()==""){
		$("#zip").focus();
		$("#zipErr").html("Enter Zip Code");return;}
	else {$("#zipErr").html("");}
	if($("#country").val()==null || $("#country").val()==""){
		$("#country").focus();
		$("#countryErr").html("Enter Country");return;}
	else {$("#countryErr").html("");}

	if($("#gpsLongitude").val()==null || $("#gpsLongitude").val()==""){
		$("#gpsLongitude").focus();
		$("#gpsLongitudeError").html("Enter Longitude");return;}
	else {$("#gpsLongitudeError").html("");}
	
	if($("#gpsLatitude").val()==null || $("#gpsLatitude").val()==""){
		$("#gpsLatitude").focus();
		$("#gpsLatitudeError").html("Enter Latitude");return;}
	else {$("#gpsLatitudeError").html("");}
	
	
	
	
	debugger;
	var isItDistributionCenterStr = $('#isitdistribution').val();
	
	if(isItDistributionCenterStr == "true"){
		
		var mainWarehouse = $("#mainwarehouse").val();
	
	}else{
	var	mainWarehouse = "";
	}
	
	
	
	
	
	 var finalObj = {};
	
	 finalObj.warehouse_name = $("#warehouseName").val();
	 finalObj.warehouse_type = $("#warehouseType").val();
	 finalObj.phone_number = $("#mobileNumber").val();
	 finalObj.warehouse_statusStr = $("#warehouseStatus").val();
	 
	 
	 finalObj.address_1 = $("#houseNo").val();
	 finalObj.address_2 = $("#street").val();
	 finalObj.city = $("#city").val();
	 finalObj.state = $("#state").val();
	 finalObj.zip = $("#zip").val();
	 finalObj.country = $("#country").val();
	 finalObj.warehouseLocation = $("#workLocation").val();
	 finalObj.mainWarehouse = mainWarehouse;
	 finalObj.warehouseId = $("#whid").val();
	 
	
	
	 finalObj.gpsLongitude = $('#gpsLongitude').val();
	 finalObj.gpsLatitude = $('#gpsLatitude').val();
	 finalObj.category = $('#category').val();
	 finalObj.locality = $('#locality').val();
	 finalObj.createdDateStr = $('#CreateDate').val();
	 finalObj.updatedDateStr = $('#UpdateDate').val();
     finalObj.testWarehouseStr = $('#isittestwarehouse').val(); 
	 finalObj.posEnabledStr = $('#posenabled').val();
	 finalObj.remoteMonitoringStr = $('#remoteMonitoring').val();
	 finalObj.authorizedPicklistStr = $('#Pickedlist').val();
	 finalObj.isItFranchiseStr = $('#isitfranchise').val();
	 finalObj.securedStr = $('#devicessecured').val(); 
	 finalObj.radius = $('#radius').val();
	 finalObj.storageSystemEnabledStr = $('#Storagesystemsenabled').val();
	 finalObj.isItDistributionCenterStr = isItDistributionCenterStr;
	// finalObj.isWarehouseStr = "true";
	 finalObj.gstin = $('#gstin').val();
	 finalObj.startTimeStr = $('#starttime').val(); 
	 finalObj.endTimeStr = $('#endtime').val();
	 finalObj.email = $('#emailid').val();
	 
    finalObj.purchaseOrder = $('input:radio[name=purchaseOrder]:checked').val();
	 finalObj.warehouseGrn = $('input:radio[name=GRN]:checked').val();
	 finalObj.shipmentReturn = $('input:radio[name=shipmentReturn]:checked').val();
	 finalObj.stockIssue = $('input:radio[name=stockIssue]:checked').val();
	 finalObj.stockReturn = $('input:radio[name=stockReturn]:checked').val();
	 finalObj.stockRequest = $('input:radio[name=stockRequest]:checked').val();
	 finalObj.stockVerificationType = $('input:radio[name=stockVerificationType]:checked').val();
	 finalObj.stockAlerts = $('input:radio[name=stockAlerts]:checked').val();
	 finalObj.onlineOrder = $('input:radio[name=onlineOrders]:checked').val();
	 finalObj.telephonicOrder = $('input:radio[name=telephonicOrders]:checked').val();
	 finalObj.billingAndDelivery = $('input:radio[name=billingDelivery]:checked').val();
	 finalObj.operation = id;
	
	 
	 var formData = JSON.stringify(finalObj);
		console.log(formData);
	 
	var contextPath = $("#contextPath").val();
	URL = contextPath + "/inventorymanager/newwarehouseconfiguration.do";
	$.ajax({
	type: "POST",
	url : URL,
	contentType: "application/json",
	data : formData,
		
		
		/* {
		warehouse_name : warehouse_name,
		warehouse_type : warehouse_type,
		phone_number : phone_number,
		
		warehouse_status :warehouse_status,
		address_1 : address_1,
		address_2 :address_2,
		city : city,
		state :	state,
		zip : zip,
		country : country,
		warehouseLocation :warehouseLocation,
		gpsLongitude : gpsLongitude,
		gpsLatitude : gpsLatitude,
		category : category,
		//added by koti
		locality:locality,
		createdDateStr:createdDateStr,
		updatedDateStr:updatedDateStr,
		testWarehouse:testWarehouse,
		posEnabled:posEnabled,
		remoteMonitoring:remoteMonitoring,
		authorizedPicklist:authorizedPicklist,
		isItFranchise:isItFranchise,
		secured:secured,
		radius:radius,
		storageSystemEnabled:storageSystemEnabled,
		isItDistributionCenter:isItDistributionCenter,
		gstin:gstin,
		startTimeStr:startTimeStr,
		endTimeStr:endTimeStr,
		purchaseOrder:purchaseOrder,
		warehouseGrn:warehouseGrn,
		shipmentReturn:shipmentReturn,
		stockIssue:stockIssue,
		stockReturn:stockReturn,
		stockRequest:stockRequest,
		stockVerificationType:stockVerificationType,
		stockAlerts:stockAlerts,
		onlineOrder:onlineOrder,
		telephonicOrder:telephonicOrder,
		billingAndDelivery:billingAndDelivery,
		email:email

	}*/
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



function saveWarehouse(){
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
		if(storagesArray[i].rowNotation==null || storagesArray[i].rowNotation==""){
			$("#Error").html("Row Location Required for all storages").css("color","red");
			$("#"+storagesArray[i].storageSystemId).css("background","red");
			return;
		}
		if(storagesArray[i].columnNotation==null || storagesArray[i].columnNotation==""){
			$("#Error").html("Column Location Required for all storages").css("color","red");
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
		
	
	//alert(JSON.stringify(wareHouseStorages));
//	console.log(JSON.stringify(wareHouseStorages));
//	console.log($("#warehouseCreateDetails").val());
	var contextPath = $("#contextPath").val();
	URL = contextPath + "/inventorymanager/savewarehouse.do";
	$.ajax({
	type: "POST",
	url : URL,
	data : {
		warehouseDetails : $("#warehouseCreateDetails").val(),
		storageStstemDetails :  JSON.stringify(wareHouseStorages)
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

/* 23-06-2015  Sambaiah Y
 * 
 *  This function is used to view the warehouse details */
function viewWarehouseStorageSystems(warehouseId,purpose){
	debugger;
	var contextPath = $("#contextPath").val();
	URL = contextPath + "/inventorymanager/viewwarehousestoragesystems.do";
	$.ajax({
	type: "POST",
	url : URL,
	data : {
		warehouseId : warehouseId,
		purpose : purpose,
		},
			beforeSend: function(xhr){                    
	   				$("#loading").css("display","block");
	   				$("#mainDiv").addClass("disabled");
	        },
			success : function(result) {
				 $("#loading").css("display","none");
  			   $("#mainDiv").removeClass('disabled');
  				$('#right-side').html(result);

			},
			error : function() {
				alert("something went wrong");
				 $("#loading").css("display","none");
  			   $("#mainDiv").removeClass('disabled');

			}
		});
}

/*  25-06-2015  Sambaiah Y
 * 
 *  This method is used to get the warehouse data from database */
function viewWarehouseData(warehouseId,purpose,id){
	var contextPath = $("#contextPath").val();
	URL = contextPath + "/inventorymanager/viewwarehouse.do";
	$.ajax({
	type: "POST",
	url : URL,
	data : {
		warehouseId : warehouseId,
		purpose : purpose,
		id : id
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


function viewWarehouseposData(warehouseId,warehouselocation,purpose,id){
	var contextPath = $("#contextPath").val();
	URL = contextPath + "/inventorymanager/viewwarehousepos.do";
	$.ajax({
	type: "POST",
	url : URL,
	data : {
		warehouseId : warehouseId,
		warehouselocation : warehouselocation,
		purpose : purpose,
		id : id
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

/* 25-06-2015  Sambaiah Y
 * This function is used to update the warehouse detils in database */
function editWarehouse(details){
	if($("#warehouseName").val()==null || $("#warehouseName").val()==""){
		$("#warehouseNameErr").html("Enter Warehouse Name");return;}
	else{$("#warehouseNameErr").html("");}
	if($("#warehouseType").val()==null || $("#warehouseType").val()==""){
		$("#warehouseTypeErr").html("Enter Warehouse Type");return;}
	else {$("#warehouseTypeErr").html("");}
	 if($("#error").text() != ""){
		 $("#phoneNumber").focus();
		 return false;
	 }
	 var defaultCountry = $("#defaultCountry").val().trim();
	 var phoneNumber = $("#phoneNumber").val().trim();
	 if(defaultCountry != "" && phoneNumber != ""){
		 $("#mobileNumber").val(defaultCountry+"-"+phoneNumber);
	 }
	
	if($("#mobileNumber").val()==null || $("#mobileNumber").val()==""){
		$("#error").html("Enter Mobile Number");return;}
	else {$("#error").html("");}
	if($("#warehouseStatus").val()==null || $("#warehouseStatus").val()==""){
		$("#statusErr").html("Select Warehouse Status");return;}
	else {$("#statusErr").html("");}
	if($("#houseNo").val()==null || $("#houseNo").val()==""){
		$("#houseNoErr").html("Enter House Number");return;}
	else {$("#houseNoErr").html("");}
	if($("#street").val()==null || $("#street").val()==""){
		$("#streetErr").html("Enter Street Number");return;}
	else {$("#streetErr").html("");}
	if($("#city").val()==null || $("#city").val()==""){
		$("#cityErr").html("Enter City");return;}
	else {$("#cityErr").html("");}
	if($("#state").val()==null || $("#state").val()==""){
		$("#stateErr").html("Enter State");return;}
	else {$("#stateErr").html("");}
	if($("#zip").val()==null || $("#zip").val()==""){
		$("#zipErr").html("Enter Zip Code");return;}
	else {$("#zipErr").html("");}
	if($("#country").val()==null || $("#country").val()==""){
		$("#countryErr").html("Enter Country");return;}
	else {$("#countryErr").html("");}
	var gpsLongitude = $('#gpsLongitude').val();
	 var gpsLatitude = $('#gpsLatitude').val();
	 var category = $('#category').val();
	 if(gpsLongitude.trim()=="")
		 $('#gpsLongitudeError').html('GPS Longitude is required');
	 if(gpsLatitude.trim()=="")
		$('#gpsLatitudeError').html('GPS Latitude is required');
	var contextPath = $("#contextPath").val();
	URL = contextPath + "/inventorymanager/editwarehousedetails.do";
	$.ajax({
	type: "POST",
	url : URL,
	data : {
		warehouseId : $("#whid").val(),
		warehouse_name : $("#warehouseName").val(),
		warehouse_type : $("#warehouseType").val(),
		phone_number : $("#mobileNumber").val(),
		fax : $("#fax").val(),
		warehouse_status : $("#warehouseStatus").val(),
		address_1 : $("#houseNo").val(),
		address_2 : $("#street").val(),
		city : $("#city").val(),
		state : $("#state").val(),
		zip : $("#zip").val(),
		country : $("#country").val(),
		warehouseLocation : $("#workLocation").val(),
		gpsLongitude : gpsLongitude,
		gpsLatitude : gpsLatitude,
		category : category
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
/* fires when u change the location in new warehouse flow */
function changeLocation(){
	$("#Error").html("");
}


function mainwarehousefn(str){
	 debugger;


		var x = $(str).val();
if(x == "true") {
	 document.getElementById("mainwarehouse").disabled = false;
}

else {
	 document.getElementById("mainwarehouse").disabled = true;
   
}
}

/*25-06-2015   Sambaiah Y
 * 
 * This function is used to clear the all storage systems in selected store house
 * 
 * */
function cleareStorageSystems(id){
	$("#droppable").remove();
	$("#warehouse_innerview").append('<div id="droppable" style="height: 500px;"><ul>  </ul></div>');
	$("#droppable").droppable();
}

/*  26-06-2015   Sambaiah Y
 * This function is used to display the storage systemdetails for editable purpose*/
function editWarehouseStorageSystems(warehouseId){
	var contextPath = $("#contextPath").val();
	URL = contextPath + "/inventorymanager/viewwarehouse.do";
	$.ajax({
	type: "POST",
	url : URL,
	data : {
		warehouseId : warehouseId,
		purpose : purpose
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

$('#houseNo').on('input',function(e)
		{
		if($(this).val().trim()=="")
		{
		$('#houseNoErr').val("");
		
		}
});



$('#gpsLongitude').on('input',function(e)
		{
		if($(this).val().trim()=="")
		{
		$('#gpsLongitudeError').val("");
		
		}
});


$('#gpsLatitude').on('input',function(e)
		{
		if($(this).val().trim()=="")
		{
		$('#gpsLatitudeError').val("");
		
		}
});

/* 29-06-2015  Sambaiah Y
 * This function is used to get the warehouses based on location
 */
function gerWarehousesByLocation(){
	var contextPath = $("#contextPath").val();
	URL = contextPath + "/inventorymanager/getWareHousesByLocation.do";
	$.ajax({
	type: "POST",
	url : URL,
	data : {
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

function initAutocomplete() {
	debugger;
	 var input = document.getElementById('locality');
var searchBox = new google.maps.places.SearchBox(input);
searchBox.addListener('places_changed', function() {
var places = searchBox.getPlaces();
if (places.length == 0) {
  return;
}
places.forEach(function(place) {
	  var data=JSON.parse(JSON.stringify(place));
$("#gpsLatitude").val(JSON.stringify(data.geometry.location.lat));
$("#gpsLongitude").val(JSON.stringify(data.geometry.location.lng));
});
});
}
function getwarehousedata(){
	var warehouseId = $("#workLocation").val();
	var contextPath = $("#contextPath").val();
	URL = contextPath + "/inventorymanager/viewwarehouseIddata.do";
	$.ajax({
	type: "POST",
	url : URL,
	data : {
		warehouseId : warehouseId,
		
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

 function warehouseidset(){
	 debugger;
	 
	 var location = $('#workLocation').val();
	 
	 $('#warehouseId').val(location.split("-")[1]);
     $('#storename').val(location.split("-")[0]);
	 
 }


