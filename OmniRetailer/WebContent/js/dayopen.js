
$(document).ready(function(){
	
	// Setup the "Up" links
	$(".up").click(function () {
	    var row = $(this).closest("tr");
	 
	    // Get the previous element in the DOM
	    var previous = row.prev();
	 
	    // Check to see if it is a row
	    if (previous.is("tr")) {
	        // Move row above previous
	        row.detach();
	        previous.before(row);
	 
	        // draw the user's attention to it
	        row.fadeOut();
	        row.fadeIn();
	    }
	    // else - already at the top
	});
	    
/*
	$('table').on('click', '.up', function () {
	    var thisRow = $(this).closest('tr');
	    var prevRow = thisRow.prev();
	    if (prevRow.length) {
	        prevRow.before(thisRow);
	    }
	});

	$('table').on('click', '.down', function () {
	    var thisRow = $(this).closest('tr');
	    var nextRow = thisRow.next();
	    if (nextRow.length) {
	        nextRow.after(thisRow);
	    }
	});
*/
	
	
	
	
	
	
	
	
});
function searchDaysOpen(name,searchCategory,index){
	 //purpose:for checking internet conection
	var online = window.navigator.onLine;
  	if(!online)
  	{
  	alert("check your internet connection,please try agian after some time");
  	return;
  	} 
	
	name=""
		if($("#searchDepartmentMaster").length>0)
		name = $("#searchDepartmentMaster").val().trim();

			var maxRecords =$("#maxRecords").val();
			 if($("#maxRecords").length>0)
				 maxRecords = $("#maxRecords").val();
			 
			 var contextPath = $("#contextPath").val();
			 var URL = contextPath + "/inventorymanager/searchDaysOpen.do";
			 $.ajax({
					type: "GET",
					url : URL,
					data : {
						searchName : name,
						index : index,
						//maxRecords : maxRecords
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





function addBusinessDetails(){
	
		  debugger
	  var contextPath = $("#contextPath").val();
			 var len = parseInt($("#businessTable tr").length);
			if (len != 1)
				//len = parseInt($("#businessTable tr:last").attr("id"));
			//len = parseInt($("#businessTable tr:last").index() + 1);
			len = parseInt($("#businessTable tr:last").attr("id").replace('dynamicdiv', '')) + 1;
			var businessTask = $("#businessDetails").val();
			var businessCounter = $("#businessCounter").val();
			for (var i = 1; i <= len; i++) {
				if ($("#businessDetails"+i).val() == businessTask) {
				 $("#Error").html("This Task Is Already Added");
      		 return;
			}
			}
			/*var sNo = 1; 
			if(businessTask == 'Counting')
				sNo =2;
			else if(businessTask == 'ReceiptList')
				sNo =1; 
			else
				sNo =3; */
			
			if(businessCounter == "" || businessCounter == undefined || businessCounter == null){
                $("#Error").html(" Business Counter is required");
                return false;
        }
			
			var slNo = 1; 
  			 $('.slno').each(function(){
  				$(this).text(slNo);
  				slNo = parseInt(slNo) + 1;
  			});
  			/*var sNo = 1; 
 			 $('.sno').each(function(){
 				$(this).text(sNo);
 				sNo = parseInt(sNo) + 1;
 			});*/
			
			 var row = "<tr id='dynamicdiv"+len+"' class='MoveableRow' style='margin-top:5px;'><td class='slno'>"+slNo+"</td>" +
				"<td id='businessCounter"+len+"'>"+businessCounter+"</td>" +
				"<td><textarea id='businessTask"+len+"' rows=1 style='resize:none;width: 100px;'></textarea></td>" +
			"<td style='text-align:center'><select  style='width:100px;height:25px;text-align:center' id='sequenceorder"+len+"'><option value='1'>1</option><option value='2'>2</option><option value='3'>3</option></select> </td>"+
			"<td><textarea id='description"+len+"' rows=1 style='resize:none;width: 300px;'></textarea></td>" +
			"<td><input type='checkbox' style='vertical-align: -3px;width: 25px;height: 15px;' value='false' id='printcopyChkbox"+len+"'></td>" +
			"<td><input type='checkbox' style='vertical-align: -3px;width: 25px;height: 15px;' value='false' id='skipbusinesstaskChkbox"+len+"'></td>" +
			"<td  id='Del"+len+"'><a href='#' id='Dele" +len+ "'  style=' text-decoration: underline;margin-left:3px;' onclick='deleteItem(this);' title='Delete'>Delete</a>"
			"</td></tr>";
		$("#businessTable tbody").append(row);
		$("#data").css("display","block");
}
/*function deleteRow(obj) {
    $(obj).closest("tr").remove();
 }*/

/*$(function(){
    $('table').on('click','tr a',function(e){
       e.preventDefault();
      // $(this).attr('class','deleteRowButton');
      $(this).parents('tr').remove();
    });
});*/

/*$("a.up").click(function() {
	  var row = $(this).closest("tr");
	  if (row.prev().length > 0) {
	    row.insertBefore(row.prev());
	  }
	  return false;
	});
	$("a.down").click(function() {
	  var row = $(this).closest("tr");
	  if (row.next().length > 0) {
	    row.insertAfter(row.next());
	  }
	  return false;
	});*/
	

	
		$("a.up").click(function() {
			  var row = $(this).closest("tr");
			  if (row.prev().length > 0) {
			    row.insertBefore(row.prev());
			  }
			  return false;
			});
			$("a.down").click(function() {
			  var row = $(this).closest("tr");
			  if (row.next().length > 0) {
			    row.insertAfter(row.next());
			  }
			  return false;
			});

	
	
			
			

function deleteItem(element){
	debugger
	var id = $(element).attr("id").replace('Dele','');
	$('#dynamicdiv'+id).remove();
	
	var slNo = 1; 
	 $('.slno').each(function(){
		$(this).text(slNo);
		slNo = parseInt(slNo) + 1;
	});
	 /*var sNo = 1; 
		 $('.sno').each(function(){
			$(this).text(sNo);
			sNo = parseInt(sNo) + 1;
		});*/
}

/*function deleteRow() {
    $(this).parents('tr').remove();
} */

/*$(document).on("click", "table.businessTable a.remove", function() { 
	$(this).parents("tr").remove(); });*/

function validateDayOpenForm(operation){
	
	
	 //purpose:for checking internet conection
	var online = window.navigator.onLine;
  	if(!online)
  	{
  	alert("check your internet connection,please try agian after some time");
  	return;
  	}
		$("#Error").html("");
		var printcopy = null;
		var finaldata={},items = [];
		
		var contextPath = $("#contextPath").val();
		
		//finaldata.dayopens = $("input[type='checkbox']").val();
		finaldata.outletLocation = $("#outletLocation").val();
		finaldata.businessCounter =$("#businessCounter").val();
		
	    
		
		if($("#mondayChkbox").is(':checked')){
			finaldata.monStartTimeStr = $("#mondayStartTime").val();
			finaldata.monEndTimeStr  = $("#mondayEndTime").val();
			//finaldata.dayopens = $("#mondayChkbox").val();
		}
			
		
		if($("#tuesdayChkbox").is(':checked')){
			finaldata.tueStartTimeStr  = $("#tuesdayStartTime").val();
			finaldata.tueEndTimeStr  = $("#tuesdayEndTime").val();
			//finaldata.dayopens = $("#mondayChkbox").val();
			//var tuesdayExtendTime = $('input[name=tuesdayExtendTime]:checked').val();
		}
		
		if($("#wednesdayChkbox").is(':checked')){
			finaldata.wedStartTimeStr  = $("#wednesdayStartTime").val();
			finaldata.wedEndTimeStr  = $("#wednesdayEndTime").val();
			//var wednesdayExtendTime = $('input[name=wednesdayExtendTime]:checked').val();
		}
		debugger
		if($("#thursdayChkbox").is(':checked')){
			finaldata.thuStartTimeStr  = $("#thuStartTime").val();
			finaldata.thuEndTimeStr  = $("#thursdayEndTime").val();
			//var wednesdayExtendTime = $('input[name=wednesdayExtendTime]:checked').val();
		}
		
		if($("#fridayChkbox").is(':checked')){
			finaldata.friStartTimeStr  = $("#fridayStartTime").val();
			finaldata.friEndTimeStr  = $("#fridayEndTime").val();
			//var fridayExtendTime = $('input[name=fridayExtendTime]:checked').val();
		}
		if($("#saturdayChkbox").is(':checked')){
			finaldata.satStartTimeStr  = $("#saturdayStartTime").val();
			finaldata.satEndTimeStr  = $("#saturdayEndTime").val();
			//var saturdayExtendTime = $('input[name=saturdayExtendTime]:checked').val();
		}
		debugger
	
		 var len = $("#businessTable tr").length-1;
			
			if(len == 0){
				alert("Add Atleast One item");
				return false;
				}
			for(var i=1;i<=len;i++){
				
				var idAttr = $("#businessTable tr:eq("+i+") td:last").attr("id");
				idAttr = idAttr.replace('Del','');
				
				obj = {sNo:$("#slno"+idAttr).text(),businessCounter:$("#businessCounter"+idAttr).text(),businessTask:$("#businessTask"+idAttr).val(),printCopy:$("#printcopyChkbox"+idAttr).is(":checked") ? "true" : "false",skipBusinessTask:$("#skipbusinesstaskChkbox"+idAttr).is(":checked") ? "true" : "false",sequenceOrder:$('option:selected', $('#sequenceorder'+idAttr)).val(),description:$("#description"+idAttr).val()};
				items.push(obj);
			}
		
			finaldata.dayOpenChilds=items;
		if(operation=="new"){
			 var URL = contextPath + "/inventorymanager/createOutletDayopen.do";
  }else{
  
  	URL =  contextPath + "/inventorymanager/updateOutletDayOpen.do";
  }
  console.log("JSon Format:::"+JSON.stringify(finaldata));
  finaldata = JSON.stringify(finaldata);
		$.ajax({
			type: "POST",
			url : URL,
		    contentType: "application/json",
			data : finaldata,
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





function viewEditDayOpen(businessCounter,outletLocation,startIndex,operation){
	
	
	 //purpose:for checking internet conection
	var online = window.navigator.onLine;
  	if(!online)
  	{
  	alert("check your internet connection,please try agian after some time");
  	return;
  	}
	var contextPath = $('#contextPath').val();
	
	 var URL = contextPath + "/inventorymanager/viewOutletDayOenDetails.do";
	
	 console.log(businessCounter);
	 console.log(outletLocation);
	 console.log(startIndex);
	$.ajax({
	
		type : "GET",
			url : URL,
			data : {
				businessCounter: businessCounter,
				outletLocation : outletLocation,
				startIndex : startIndex,
				operation :  operation	
			},
			beforeSend: function(xhr){                    
		   		$("#loading").css("display","block");
		   		$("#mainDiv").addClass("disabled");
		   	},
			success : function(result){
				$('#right-side').html(result);
				//if(id != undefined)
				//	activeMenu(id);
			/*openMenu("lib2cConfig","ulb2cConfig",0);*/
			$('#right-side').html(result);
			$("#loading").css("display","none");
			$("#mainDiv").removeClass('disabled')
			},
			error : function(){
				alert("Something went wrong");
				$("#loading").css("display","none");
				$("#mainDiv").removeClass('disabled');
			}
	});
	
}



var re = /^[0-9/]+$/;
function changeInfoBasedOnLocation(location){
	//alert("Location>>>"+location);
	getCountersByLocation(location);
	//getShiftsByLocation(location);
}

function changeImage(){
	
}

function getCountersByLocation(location){
	debugger
	
	 //purpose:for checking internet conection
	var online = window.navigator.onLine;
  	if(!online)
  	{
  	alert("check your internet connection,please try agian after some time");
  	return;
  	}
	var contextPath = $('#contextPath').val();
	  var URL = contextPath + "/reports/getCountersByLocation.do";
	  $.ajax({
		url : URL,
		data : {
			location : location
		},
		success : function(counters){
			//alert("Result:::"+counters);
			if(counters.length>0){
				var op='';
				$("#businessCounter").html("");
				$("#counterError").html("");
				for(var i=0;i<counters.length;i++){
					op += '<option value="'+counters[i]+'">'+counters[i]+'</option>';
				}
				$("#businessCounter").html(op);
			}else{
				$("#businessCounter").html("");
				//alert("Counters are not found in "+location+" location");
				$("#counterError").html("Counters are not found in "+location+" location");
			}
		},
		error : function(){
			//alert("Counters are not found in "+location+" location");
			$("#counterError").html("Counters are not found in "+location+" location");
		}
	 });
}





function deleteDayOpen(businessCounter,outletLocation){
	
	
	debugger
	 //purpose:for checking internet conection
	var online = window.navigator.onLine;
  	if(!online)
  	{
  	alert("check your internet connection,please try agian after some time");
  	return;
  	}
	
	var contextPath = $('#contextPath').val();
	
	 var URL = contextPath + "/inventorymanager/deleteDayOpens.do";
	
	$.ajax({
	
		type : "GET",
			url : URL,
			data : {
				businessCounter : businessCounter,
				outletLocation : outletLocation
				//startIndex:startIndex,
				//operation:operation	
			},
			beforeSend: function(xhr){                    
		   		$("#loading").css("display","block");
		   		$("#mainDiv").addClass("disabled");
		   	},
			success : function(result){
				$('#right-side').html(result);
				//if(id != undefined)
				//	activeMenu(id);
			
			$('#right-side').html(result);
			$("#loading").css("display","none");
			$("#mainDiv").removeClass('disabled')
			},
			error : function(){
				alert("Something went wrong");
				$("#loading").css("display","none");
				$("#mainDiv").removeClass('disabled');
			}
	});
	
}










