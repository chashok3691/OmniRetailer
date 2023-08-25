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

$(document).ready(function(){
	 $("#storeError").html("");
    $("#phoneError").html("");
    $("#faxError").html("");
    $("#currencyError").html("");
    $("#lanaguageError").html("");
    $("#amountError").html("");
    $("#startTimeError").html("");
    $("#endTimeError").html("");
    
    $("#storename").keydown(function(){
		   $("#storeError").html("");
		   $(".Error").html("");
	 });
    
    $("#phone").keydown(function(){
		   $("#phoneError").html("");
		   $(".Error").html("");
	 });
 
    $("#fax").keydown(function(){
		   $("#faxError").html("");
		   $(".Error").html("");
	 });
    
    $("#currency").keydown(function(){
		   $("#currencyError").html("");
		   $(".Error").html("");
	 });
 
     $("#language").keydown(function(){
		   $("#lanaguageError").html("");
		   $(".Error").html("");
	 });

     $("#amount").keydown(function(){
		   $("#amountError").html("");
		   $(".Error").html("");
	 });
 
     $("#startTime").keydown(function(){
		   $("#startTimeError").html("");
		   $(".Error").html("");
	 });
 
     $("#endTime").keydown(function(){
		   $("#endTimeError").html("");
		   $(".Error").html("");
	 });
     $("#noOfLevels").keydown(function(){
		   $("#noOfLevelsError").html("");
		   $(".Error").html("");
	 });
 
     $('.number').keyup(function() {
        
        var $th = $(this);
        
        $th.val( $th.val().replace(/[^0-9-+ ]+( [0-9-+ ]+)*$/g, function(str) 
        {  
            return ''; 
         } 
        ));
    });
    
    $('#amount').keyup(function() {
        var $th = $(this);
        $th.val( $th.val().replace(/[^0-9]+( [0-9]+)*$/g, function(str) 
        {  
            return ''; 
         } 
        ));
    });
    
   
});
var array=[];

/**
 * @author Sahitya 
 * Get List of selected taxes from GUI whenever onclick event raises
 */
 function getSelectedTaxes(){
	 var selectedTaxes = new Array();
	  $("input:checkbox[name='allTaxes']:checked").each(function() {
	    	selectedTaxes.push($(this).val());
	   });
	  addDynamicDiv(selectedTaxes);
 }
 
 

 function addNameToTextBox(id,ele){
	 debugger;
		
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
//					dataType : 'json',
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




 /**
  * @author Sahitya 
  * Prepare table rows dynamically with the provided details, then append to table and prepare global array with list of json objects
  * which it contains the provided info
  * @param List of selected taxes
  */
function addDynamicDiv(tax){
	$('#taxes').val('');
	var finaldata={},arr=[],data={};
	finaldata.arr = arr;
	var str='';
	for (var i=0;i<tax.length;i++) {
		var type='',rate=0,row='';
		var genId = tax[i].replace(/ /g,'');
		var taxDiv = $('#dynamicdiv'+genId);
	    if (taxDiv.length){
	    	/* type = $('#'+tax[i]+'taxType').val();
	    	 rate = $('#'+tax[i]+'taxRate').val();*/
	    	 type = $('.'+genId+'taxType').val();
	    	 rate = $('.'+genId+'taxRate').val();
	    	 data = {
	 				taxName : tax[i],
	 				id : genId+"id",
	 				taxRate : rate,
	 				taxType : type
	 		};
	   }else{
		   data = {
					taxName : tax[i],
					id : genId+"id",
					taxRate : "0",
					taxType : "Fixed"
			};
	   }
	   
	    /*if(type=='Percentage'){
	    	row = "<tr id='dynamicdiv"+tax[i]+"' style='margin-top:5px;'><td><span id='"+tax[i]+"id'>"+tax[i]+"</span> </td><td> <select id='"+tax[i]+"id' class='"+tax[i]+"taxType' value='"+type+"' style='width:75%;margin-left:12%;' onchange='changeType(this)'> <option value='Fixed' >Fixed</option><option value='Percentage' selected>Percentage</option></select> </td><td> <input type='text' value='"+rate+"' id='"+tax[i]+"id' class='"+tax[i]+"taxRate' placeholder='Enter Tax Rate' onblur='changeRate(this)'> </td></tr>";
	    }else{
	    	row = "<tr id='dynamicdiv"+tax[i]+"' style='margin-top:5px;'><td><span id='"+tax[i]+"id'>"+tax[i]+"</span> </td><td> <select id='"+tax[i]+"id' class='"+tax[i]+"taxType' value='"+type+"' style='width:75%;margin-left:12%;' onchange='changeType(this)'> <option value='Fixed' selected>Fixed</option><option value='Percentage'>Percentage</option></select> </td><td> <input type='text' value='"+rate+"' id='"+tax[i]+"id' class='"+tax[i]+"taxRate' placeholder='Enter Tax Rate' onblur='changeRate(this)'> </td></tr>";
	    }*/
	    if(type=='Percentage'){
	    	row = "<tr id='dynamicdiv"+genId+"' style='margin-top:5px;'><td><span id='"+tax[i]+"id'>"+tax[i]+"</span> </td><td> <select id='"+genId+"id' class='"+genId+"taxType' value='"+type+"' style='width:75%;margin-left:12%;' onchange='changeType(this)'> <option value='Fixed' >Fixed</option><option value='Percentage' selected>Percentage</option></select> </td><td> <input type='text' value='"+rate+"' id='"+genId+"id' class='"+genId+"taxRate' placeholder='Enter Tax Rate' onblur='changeRate(this)'> </td></tr>";
	    }else{
	    	row = "<tr id='dynamicdiv"+genId+"' style='margin-top:5px;'><td><span id='"+tax[i]+"id'>"+tax[i]+"</span> </td><td> <select id='"+genId+"id' class='"+genId+"taxType' value='"+type+"' style='width:75%;margin-left:12%;' onchange='changeType(this)'> <option value='Fixed' selected>Fixed</option><option value='Percentage'>Percentage</option></select> </td><td> <input type='text' value='"+rate+"' id='"+genId+"id' class='"+genId+"taxRate' placeholder='Enter Tax Rate' onblur='changeRate(this)'> </td></tr>";
	    }
	     str = str+row;
		
		  $('#data').show();
		  finaldata.arr.push(data);
		  array = arr;
	} 
	$("#taxestable tbody").html("");
	$("#taxestable tbody").append(str);
	$('#taxes').val(JSON.stringify(array));
	//alert(JSON.stringify(array));
	return true;
}


/**
 * @author Sahitya 
 * change global array of objects whenever type value is changing
 * @param html element
 */
 function changeType(element){
	var value = $(element).val();
	var id=$(element).attr("id");
//	var cls = $(element).attr("class");
	if(value == ""){
		 alert("Please Enter value for "+cls);
	 }else{
		 for(var i=0;i<array.length;i++){
				if(array[i].id==id){
				// array[i].taxType=$("."+cls).val();
					array[i].taxType=value;
				}
			}
		 $('#taxes').val(JSON.stringify(array));  
	 }
	return false;
 		
 }

 /**
  * @author Sahitya 
  * change global array of objects whenever rate value is changing
  * @param html element
  */
 function changeRate(element){

	 var value = $(element).val();
	 var id=$(element).attr("id");
	 var cls = $(element).attr("class");
	 if(value == ""){
		 alert("Please Enter value for "+cls);
	 }else{
		 isNumeric(element);
		 var val = $(element).val();
		 if(val == ""){
			 alert("Enter only numbers");
		 }else{
			 for(var i=0;i<array.length;i++){
					if(array[i].id==id){
					//  array[i].taxRate=$("."+cls).val();
						 array[i].taxRate=value;
					}
				}
				$('#taxes').val(JSON.stringify(array));
		  }
		 }
	return false;
 }
 
 /**
  * @author Sahitya 
  * check whether the element value is number or not 
  * @param html element
  */
 function isNumeric(element){
	 var $th = $(element);
	 $th.val( $th.val().replace(/[^0-9]+( [0-9]+)*$/g, function(str) 
	 {  
		return '';
	 } 
	 ));
	
}
 
 /**
  * @author Sahitya 
  * Prepare table rows dynamically with the provided details, then append to table and prepare global array with list of json objects
  * which it contains the provided info
  */
 function displayTablesForEdit(){
		var layoutDetails =$('#taxList').val();
		$('#taxes').val(layoutDetails);
		if(layoutDetails.length>0){
			
			var finaldata={},arr=[],data={};
			finaldata.arr = arr;
			$.each($.parseJSON(layoutDetails), function(idx, obj) {
				var row='';
				var genId = obj.taxName.replace(/ /g,'');
				data = {
						taxName : obj.taxName,
						id :genId+"id",
						taxRate : obj.taxRate,
						taxType : obj.taxType
				};
				if(obj.taxType=='Percentage'){
					 row = "<tr id='dynamicdiv"+genId+"' style='margin-top:5px;'><td><span id='"+obj.taxName+"id'>"+obj.taxName+"</span> </td><td> <select id='"+genId+"id' class='"+genId+"taxType' style='width:75%;margin-left:12%;' onchange='changeType(this)'> <option value='Fixed'>Fixed</option><option value='Percentage' selected>Percentage</option></select> </td><td> <input type='text' id='"+genId+"id' class='"+genId+"taxRate' placeholder='Enter Tax Rate' onblur='changeRate(this)' value='"+obj.taxRate+"'> </td></tr>";
				    }else{
				     row = "<tr id='dynamicdiv"+genId+"' style='margin-top:5px;'><td><span id='"+obj.taxName+"id'>"+obj.taxName+"</span> </td><td> <select id='"+genId+"id' class='"+genId+"taxType' style='width:75%;margin-left:12%;' onchange='changeType(this)'> <option value='Fixed' selected>Fixed</option><option value='Percentage'>Percentage</option></select> </td><td> <input type='text' id='"+genId+"id' class='"+genId+"taxRate' placeholder='Enter Tax Rate' onblur='changeRate(this)' value='"+obj.taxRate+"'> </td></tr>";
				    } 
				$("#taxestable tbody").append(row);
				 $('#data').show();
				$("#" +genId).prop('checked', true); 
				 finaldata.arr.push(data);
				 
		    });
			
			 array = arr;
			 $('#taxes').val(JSON.stringify(array));
				
		}
		
 }
 
 /**
  * @author Sahitya 
  * Prepare table rows dynamically with the provided details, then append to table 
  */
 function displayTablesForView(){
		var layoutDetails =$('#taxList').val();
		if(layoutDetails.length>0){
			$.each($.parseJSON(layoutDetails), function(idx, obj) {
				var row='';
				var genId = obj.taxName.replace(/ /g,'');
				data = {
						taxName : obj.taxName,
						id : obj.taxName+"id",
						taxRate : obj.taxRate,
						taxType : obj.taxType
				};
				if(obj.taxType=='Percentage'){
					 row = "<tr id='dynamicdiv"+obj.taxName+"' style='margin-top:5px;'><td><span id='"+obj.taxName+"id'>"+obj.taxName+"</span> </td><td> <select id='"+obj.taxName+"id' class='"+obj.taxName+"taxType' style='width:75%;margin-left:12%;' onchange='changeType(this)' readonly> <option value='Fixed' disabled>Fixed</option><option value='Percentage' disabled selected>Percentage</option></select> </td><td> <input type='text' id='"+obj.taxName+"id' class='"+obj.taxName+"taxRate' readonly placeholder='Enter Tax Rate' onblur='changeRate(this)' value='"+obj.taxRate+"'> </td></tr>";
				    }else{
				     row = "<tr id='dynamicdiv"+obj.taxName+"' style='margin-top:5px;'><td><span id='"+obj.taxName+"id'>"+obj.taxName+"</span> </td><td> <select id='"+obj.taxName+"id' class='"+obj.taxName+"taxType' style='width:75%;margin-left:12%;' onchange='changeType(this)' readonly> <option value='Fixed' selected disabled>Fixed</option><option value='Percentage' disabled>Percentage</option></select> </td><td> <input type='text' id='"+obj.taxName+"id' class='"+obj.taxName+"taxRate' readonly placeholder='Enter Tax Rate' onblur='changeRate(this)' value='"+obj.taxRate+"'> </td></tr>";
				    } 
				$("#taxestable tbody").append(row);
				 $('#data').show();
				$("#" +genId).prop('checked', true); 
		    });
			/*finaldata.arr.push(data);
			  array = arr;
			   $('#taxes').val(JSON.stringify(array));  */
		}
 }
 
 function addBuildingDetails(){
	  $(".Error").html("");
	  if($("#buildingName").val().trim() == ""){
		  $("#buildingNameError").html("Please Enter Building Name");
		  return;
	  }
	  if($("#noOfLevels").val().trim() == ""){
		  $("#noOfLevelsError").html("Please Enter No Of Levels");
		  return;
	  }
		  
	  var contextPath = $("#contextPath").val();
		 var len = parseInt($("#buildingtable tr").length);
			if (len != 1)
				len = parseInt($("#buildingtable tr:last").attr("id").replace('dynamicdiv', '')) + 1;
			var buildingName = $("#buildingName").val();
			var facilityCategory = $("#facilityCategory").val();
			var noOfLevels = $("#noOfLevels").val();
			for (var i = 1; i <= len; i++) {
				if($("#buildingName" + i).length > 0 && buildingName != $("#buildingName" + i).text()){
					$("#Error").html("Only one Building Name can be added to Location");
//					 $(window).scrollTop(0);
					 $('html, body').animate({scrollTop:0}, 'slow');
		       		 return;
				}
				if ($("#buildingName" + i).text() == buildingName && $("#facilityCategory"+i).text() == facilityCategory) {
					 $("#Error").html("This Facility Is Already Added");
//					 $(window).scrollTop(0);
					 $('html, body').animate({scrollTop:0}, 'slow');
	       		 return;
				}
			}
			 var row = "<tr id='dynamicdiv"+len+"' style='margin-top:5px;'><td id='buildingName"+len+"'>"+buildingName+"</td>" +
			"<td id='facilityCategory"+len+"'>"+facilityCategory+"</td><td id='noOfLevels"+len+"' onBlur='changeLevel(this);' onkeypress='return (this.innerText.length < 3)' contenteditable='true'>"+noOfLevels+"</td>" +
			"<td><textarea id='remarks"+len+"' rows=1 style='resize:none;width: 300px;'></textarea></td>" +
			"<td id='Del"+ len +"' ><img id='Img"+ len +"' src='"+contextPath+"/images/itemdelete.png' style='width:25px;cursor:pointer;' onclick='deleteItem(this);' title='Delete'/>" +
			"</td></tr>";
		$("#buildingtable tbody").append(row);
		$("#data").css("display","block");
 }


function deleteItem(element){
		var id = $(element).attr("id").replace('Img','');
		$('#dynamicdiv'+id).remove();
	}

function initAutocomplete() {
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