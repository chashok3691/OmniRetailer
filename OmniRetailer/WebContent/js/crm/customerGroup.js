// akhil
$("#groupId").keydown(function(){
	   $("#groupIdError").html("");
	   $(".Error").html("");
});

function searchCustomers(searchName, searchCategory){
	 var contextPath = $("#contextPath").val();
	 var storeLocation = "";
	 URL = contextPath + "/crm/searchCustomers.do";
	 debugger;
		var online = window.navigator.onLine;
	 	if(!online)
	 	{
	 		alert("check your internet connection and Please try agian after some time");
	 		return;
	 	}
		
	 
	 $.ajax({
			type: "GET",
			url : URL,
			data : {
					searchName : searchName,
					},
			beforeSend: function(xhr){                    
   	   			$("#loading").css("display","block");
   	   			$("#mainDiv").addClass("disabled");
   	   		  },
			success : function(result) {
            appendcustomer(result, searchCategory);
       		
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



function appendcustomer(customerList, searchCategory){
	debugger;
	

	var online = window.navigator.onLine;
 	if(!online)
 	{
 		alert("check your internet connection and Please try agian after some time");
 		return;
 	}
	
	
	
		 $("."+searchCategory).html('');

		 var op = '';
		 for(var i=0;i<customerList.length;i++){
		
		//	 op += '<li id="'+customerList[i].phone+'" onclick=getId(this,"'+searchCategory+'");><a>'+customerList[i].phone+'   (EMAIL   -   '+customerList[i].email+')</a>"<input type="hidden" id="emailid" value="'+customerList[i].email+'" />" "<input type="hidden" id="phone" value="'+customerList[i].phone+'" />" "<input type="hidden" id="name" value="'+customerList[i].name+'" />" "<input type="hidden" id="status" value="'+customerList[i].status+'" />"</li>';
			 op += '<li id="'+customerList[i].phone+'" onclick=getId(this,"'+searchCategory+'"); ><a>'+customerList[i].phone+'   (EMAIL   -   '+customerList[i].email+')</a><input type="hidden" id="emailid" value="'+customerList[i].email+'" /><input type="hidden" id="name" value="'+customerList[i].name+'" /><input type="hidden" id="status" value="'+customerList[i].status+'" /></li>';
			 			
		
		 }
		 $("."+searchCategory).html(op);
		 $("."+searchCategory).show();
}


function getId(element,type){

	debugger;
	var searchCategory= type;
	 var phone= $(element).attr("id");
	 var mobile = $(element).children("#phone").val();
	 var email = $(element).children("#emailid").val();
	 var name = $(element).children("#name").val();
	 var status = $(element).children("#status").val();
	 
  //	if($("#operation").val() != "edit")
//	if($("#type").val() != "skuAdd")
		
	 searchCustomerBasedOnPhoneNumber(phone, searchCategory);
	 	

	 
}




function searchCustomerBasedOnPhoneNumber(phone, searchCategory){
	 var contextPath = $("#contextPath").val();
	 var storeLocation = "";
	 URL = contextPath + "/crm/searchCustomersByPhone.do";
	 
debugger
		var online = window.navigator.onLine;
	 	if(!online)
	 	{
	 		alert("check your internet connection and Please try agian after some time");
	 		return;
	 	}
		
	 
	 $.ajax({
			type: "GET",
			url : URL,
			data : {
					phone : phone,
					//storeLocation : storeLocation
					},
			beforeSend: function(xhr){                    
  	   			$("#loading").css("display","block");
  	   			$("#mainDiv").addClass("disabled");
  	   		  },
			success : function(result) {
//        alert(result)
				addCustomer(result, searchCategory);
      		
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



function addCustomer(customer, searchCategory){
	debugger

	var online = window.navigator.onLine;
 	if(!online)
 	{
 		alert("check your internet connection and Please try agian after some time");
 		return;
 	}
	
	var totalvalue = $("#totalValue").val(); 
	var contextPath = $("#contextPath").val();
		var len = parseInt($("#customersList tr").length);//cusList
		
		if (len != 1){
			len = parseInt($("#customersList tr:last").attr("id").replace('dynamicdiv', '')) + 1;
			
		}
		//console.log(customer.phone);
		//console.log($("#mobile" + i).val());
		for (var i = 1; i <= len; i++) {
			
			//var p =$("#mobile" + i).val();
			if ($("#phone" + i).val() == customer.phone) {
				alert("Item Already Added");
				return;
			} 
			
		}
		var slNo = 1; 
		 $( ".slno" ).first().each(function(){
			 //debugger;
			 slNo = $(this).text();
				
			});
		 
		
		
		 $('.slno').each(function(){
			$(this).text(slNo);
			slNo = parseInt(slNo) + 1;
		}); 
		
/*		 var phone = customer.phone
		 if(phone == "" || phone == null || phone == "null")
			 customer.phone = ""; */
		 var email = customer.email;
	 		if(email == "" || email == null)
	 			customer.email = "";
	 		
	 		  var name = customer.name;
	 		  if(name == "" || name == null)
	 			 customer.name = "";
	 		  
	 		  var category = customer.category;
	 		  if(category == "" || category == null)
	 			 customer.category = "";
	 		
	 		 var locality = customer.locality;
	 		  if(locality == "" || locality == null)
	 			 customer.locality = "";
	 		  
	 		 var lastname = customer.lastname;
	 		  if(lastname == "" || lastname == null)
	 			 customer.lastname = "";
		 	

	 		
	 		 var row = "<tr id='dynamicdiv"+len+"' style='margin-top:5px;'>" +
	 		    "<td class='slno'>"+slNo+"</td>" +
	 		   "<input type='hidden' id='phone"+len+"' value='"+customer.phone+"'/>"+
	 		    "<td id='mobile"+len+"'>"+customer.phone+"</td>"+
				"<td id='name"+len+"'>"+customer.name+"</td>" +
				"<td id='lastname"+len+"'>"+customer.lastname+"</td>"+
			    "<td id= 'email"+len+"'>"+customer.email+"</td>"+
			    "<td id='area"+len+"'>"+customer.locality+"</td>" + 
			    "<td id='category"+len+"'>"+customer.category+"</td>" +
		 		"<td id='status"+len+"'>Active</td>"+
		 		"<td id='Del"+ len +"' >" +
	    		"<img id='Img"+ len +"' src='"+$("#contextPath").val()+"/images/itemdelete.png' style='width:30px;cursor:pointer;' onclick='deleteItem(this);' title='Delete "+len+"'/>" +
		"</td>" +
		
		"</tr>";
		 $("#customersList tbody").append(row);
		 $(".services").hide();
		
		 $("#searchItems").val("");
		
		 
		 
		 
}







function deleteItem(element){
	//debugger;

	var online = window.navigator.onLine;
 	if(!online)
 	{
 		alert("check your internet connection and Please try agian after some time");
 		return;
 	}
	
	var id = $(element).attr("id").replace('Img','');
	var ids = $("#pluCode"+id).val();
	
	deletedPlus.push(ids);
	$('#dynamicdiv'+id).remove();
	var slNo = 1; 
	 $( ".slno" ).first().each(function(){
	
		 slNo = $(this).text();
			
		});
	 
	
	$('.slno').each(function(){
		$(this).text(slNo);
		slNo = parseInt(slNo) + 1;
	});
}

$("#group_name").keydown(function(){
	   $("#groupNameError").html("");
	   $(".Error").html("");
}); 


function deleteAll(){
	//debugger;
	$("#customersList tbody tr").remove(); 
}

var deletedPlus =[];
function plusList(element) {
	var idAttr=$(element).attr("id").replace('textComments','');
	var id =$("#pluCode"+idAttr).val();
	deletedPlus.push($("#pluCode"+idAttr).val());
	$('#dynamicdiv'+idAttr).removeClass("update");
}


$("#groupId").on('input',function(e){
	   $("#groupIdError").html("");
	   $(".Error").html("");
});







/**
 * 
 * @author Akhil M
 * Created On: 4th Nov,2018
 * 
 * This method is used to vadilate the group and to send it to the controller.
 *
 *
 **/
 
function validateCustomerGroupMasterForm(operation, index){
	 
	  debugger;
		var group_id = $("#groupId").val();
		var group_category = $("#groupCategory").val();
		var zone =  $("#outletZone").val();
		var start_date=  $("#startDate").val();
		var group_description=  $("#groupDescription").val();
		var status=  $("#status").val();
		var end_date=  $("#endDate").val();
		var location = $("#location").val();
	    var file = $("#fileUploadCSV").val();  

    

		/*	$(".Error").html("");
			if(customerFiles.length <= 0)
				{
				alert("To Import, Please Select Excel Sheet First.");
					return;
				}
			var oMyForm = new FormData();
		    oMyForm.append("file", customerFiles[0]); */
		 var filename = "";
		if(file != undefined)
	     filename = file.replace(/^.*[\\\/]/, '');
		
		
		
	    if($("#groupId").val().trim() == ""){
	    	$("#groupIdError").html("Enter Group Name");
	    	$("#groupId").focus();
	    	return;
	    }
	
	
	 if(start_date==""){
		$("#groupIdError").html("Please enter Start Date");
	$("#startDate").focus();
	return;
     }
     if(end_date==""){
	$("#groupIdError").html("Please enter End Date");
	$("#endDate").focus();
	return;
     }
	var customerGroupMaster = {}, groupChilds = [];
    
	
	
	customerGroupMaster.filePath= filename;
	
	
	
	
	customerGroupMaster.group_id  = group_id;
	customerGroupMaster.group_category = group_category;
	customerGroupMaster.zone = zone;
	customerGroupMaster.startDate = start_date;
	customerGroupMaster.group_description = group_description;
	customerGroupMaster.status = status;
	customerGroupMaster.endDate = end_date;
	customerGroupMaster.location = location;
	
	
		 var len = parseInt($("#customersList tr").length)-1;
		
		
  	
  	
  	var maxRecords=10;
  	if($("#maxRecords").length > 0)
  		maxRecords = $("#maxRecords").val();
  	
	var searchCriteria = "";
  	debugger
  	
	for(var i=1;i<=len;i++){
		var idAttr = $("#customersList tr:eq("+i+") td:last").attr("id");
		idAttr = idAttr.replace('Del','');
	 	var serialNo = "";
	 	serialNo=idAttr;
	 /*	if(("#slno"+idAttr).length > 0)
	   		serialNo = $("#sNo"+idAttr).val(); */
		
		 
		var obj = 
		{        
				mobile_no:$("#mobile"+idAttr).text(),
				first_name:$("#name"+idAttr).text(),
				last_name:$("#lastname"+idAttr).text(),
				email_id:$("#email"+idAttr).text(),
				area:$("#area"+idAttr).text(),
				customer_category:$("#category"+idAttr).text(),
				//sNo:$("#sNo"+idAttr).val()
				//itemStatus: $("#status"+idAttr).text()
		};
		groupChilds.push(obj);

	}
 
  	
 customerGroupMaster.customerGroupItems = groupChilds;
	var contextPath = $("#contextPath").val();
	if(operation == "new")
		var URL = contextPath + "/crm/createCustomersGroup.do";
	else
		var URL = contextPath + "/crm/updateCustomersGroup.do";
  
  customerGroupMaster.maxRecords = maxRecords;
  customerGroupMaster.searchCriteria= searchCriteria;
  
  	 var formData = JSON.stringify(customerGroupMaster);
  	$.ajax({
		type: "POST",
		url : URL,
		contentType: "application/json",
		fileName:"" ,
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


/**
 * @author Akhil M
 * date: 4th nov,2018
 * Verified By :
 * 
 * @param groupID,operation
 * 
 * This method is used to view thr group or edit the group
 * 
 * @return 
 */



function viewEditCustomerGroup(groupID,operation){
	debugger;
	var online = window.navigator.onLine;
 	if(!online)
 	{
 		alert("check your internet connection,please try agian after some time");
 		return;
 	}
	 var contextPath = $("#contextPath").val();
	 URL = contextPath + "/crm/editCustomerGroup.do";
	 var maxRecords="10";
	 if($("#maxRecords").length > 0 && $("#maxRecords").val != "")
		 maxRecords = $("#maxRecords").val();
		 
	var searchName="";
		 if($("#searchCustomerGroup").length > 0)
			 searchName = $("#searchCustomerGroup").val();
		 
	$.ajax({
		type: "GET",
		url : URL,
		data : {
			groupId : groupID,
			operation : operation,
			searchcriteria:'',
			index:'0',
			maxRecords : maxRecords,
			searchName : searchName
			
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
		error : function(status,code,message) {
			 $("#err").val(message);
			 $("#loading").css("display","none");
 			 $("#mainDiv").removeClass('disabled');
		}
	});
}


var	customerFiles = [];
function addFileToArray(id){
	//debugger;
	debugger
	   var ext = $("#"+id)[0].files[0]['name'].split('.').pop().toLowerCase();
	    
	   customerFiles=event.target.files;

}

function addNameToTextBox(id){
	debugger;
	try{
	addFileToArray(id);
	if($("#"+id)[0].files[0] != undefined){
//		$("#skuMasterFile").val($("#"+id)[0].files[0]['name']);
	}

	else
		$("#"+id+"File").val("");
}
	catch(e)
	{
		//alert("exception");
	}
}


/**
 * @author Akhil M
 * date: 4th nov,2018
 * Verified By :
 * 
 * @param groupID,operation
 * 
 * This method is used to import the excel file and save it to the DB
 * 
 * @return 
 */

function importCustomerGroupExcelData(){
	debugger;
	var group_id = $("#groupId").val();
	var group_category = $("#groupCategory").val();
	var zone =  $("#zone").val();
	var start_date=  $("#startDate").val();
	var group_description=  $("#groupDescription").val();
	var status=  $("#status").val();
	var end_date=  $("#endDate").val();
	var location = $("#location").val();


	var file = $("#fileUploadCSV").val();  
	$(".Error").html("");
	if(customerFiles.length <= 0)
	{
		alert("To Import, Please Select Excel Sheet First.");
		return;
	}
	var oMyForm = new FormData();
	oMyForm.append("file", customerFiles[0]);

	var contextPath = $("#contextPath").val();
	URL = contextPath + "/crm/importExcelData.do";
	$.ajax({
		url : URL,
		data : oMyForm,
		type : "POST",
		enctype: 'multipart/form-data',
		processData: false, 
		contentType:false,
		dataType: 'html',
		beforeSend: function(xhr)
		{                    
			$("#loading").css("display","block");
			$("#mainDiv").addClass("disabled");
		},
		success : function(result) {
			$("#right-side").html(result);
			$("#loading").css("display","none");
			$("#mainDiv").removeClass('disabled');


		},
		error : function(jqxhr,status,errorThrown) {


			$("#loading").css("display","none");
			$("#mainDiv").removeClass('disabled');
		}
	});
}



function searchCustomerGroupChilds(groupID,operation,index){
	debugger;
	var online = window.navigator.onLine;
 	if(!online)
 	{
 		alert("check your internet connection,please try agian after some time");
 		return;
 	}
 		
 	if($("#operation").length > 0 )
 		
 		operation = $("#operation").val();
 	else
 		operation = "view";
 		
 	
	 var contextPath = $("#contextPath").val();
	 URL = contextPath + "/crm/editCustomerGroup.do";
	 
	 var maxRecords="10";
	 if($("#maxRecords").length > 0)
		 maxRecords = $("#maxRecords").val();
		 
	var searchCriteria="";
		/* if($("#searchcriteriachilds").length > 0)
			 searchCriteria = $("#searchcriteriachilds").val().trim(); */
			var searchName="";
			/*	 if($("#searchProductGroup").length > 0)
				 searchName = $("#searchProductGroup").val(); */
	 
	 groupID = $("#groupID").val();
	 
	$.ajax({
		type: "GET",
		url : URL,
		data : {
			groupId : groupID,
			operation : operation,
			index:index,
			searchcriteria:searchCriteria,
			searchName:searchName,
			maxRecords:maxRecords
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


function newCustomerGroupMaster(id){
	try{

		var online = window.navigator.onLine;
		if(!online){
			alert("Check your internet connection,Please try agian after some time.");
			return;
		}


		var contextPath = $("#contextPath").val();
		URL = contextPath + "/crm/newCustomerGroupMaster.do";
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
				$("#type").val('skuAdd');
				if(id != undefined)
					activeMenu(id);
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
