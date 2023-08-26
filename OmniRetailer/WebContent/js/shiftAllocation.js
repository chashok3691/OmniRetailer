$(document).ready(function(){
 	  $("#shiftDepartment").keydown(function(){
 		   $("#shiftDepartmentError").html("");
		   $(".Error").html("");
 	 });
});



function getShiftIds(flag){
	var location = $("#shiftLocation").val();
	var shiftId = '';
	if(flag == "shiftId")
		shiftId = $("#shiftId").val();
	 var contextPath = $("#contextPath").val();
	 URL = contextPath + "/admin/getShiftIds.do";
	 $.ajax({
			type: "GET",
			url : URL,
			data : {
				location : location,
				shiftId : shiftId
			},
			beforeSend: function(xhr){                    
   	   			$("#loading").css("display","block");
   	   			$("#mainDiv").addClass("disabled");
   	   		  },
			success : function(result) {
				appendShiftIds(result);
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

function appendShiftIds(shiftResponse){
	if(shiftResponse.length == 4){
		$("#shiftId").html('');
		$("#productsList tbody").html("");
		$("#shiftName").val("");
		$("#shiftStartDate").val("");
		$("#shiftEndDate").val("");
		$("#shiftWeekDays").val("");
		return ;
	}
	 var parsedJson = jQuery.parseJSON(shiftResponse);  
	 var shifts = parsedJson.shifts;
	 var shiftMaster = parsedJson.shiftMaster;
	 if(shifts != null){
		 var op = '';
		 for(var i=0; i<shifts.length; i++){
			 op = op + '<option value='+shifts[i].shiftId+'>'+shifts[i].shiftId+'</option>';
		 }
		 $("#shiftId").html('');
		 $("#shiftId").html(op);
		 $("#productsList tbody").html("");
	 }
	 if(shiftMaster != null){
		 $("#shiftName").val(shiftMaster.shiftName);
		 $("#shiftStartDate").val(shiftMaster.start_date);
		 $("#shiftEndDate").val(shiftMaster.end_date);
		 $("#shiftWeekDays").val(shiftMaster.weekDays);
		 $(".startDate").val(shiftMaster.start_date);
		 $(".endDate").val(shiftMaster.end_date);
		 selectDays();
	 }
}

function searchEmployee(name, searchCategory){
	var location = $("#shiftLocation").val();
	 var contextPath = $("#contextPath").val();
	 URL = contextPath + "/admin/searchEmployee.do";
	 $.ajax({
			type: "GET",
			url : URL,
			data : {
				empName : name,
				location : location
			},
			beforeSend: function(xhr){                    
   	   			$("#loading").css("display","block");
   	   			$("#mainDiv").addClass("disabled");
   	   		  },
			success : function(result) {
				appendEmployee(result, searchCategory);
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

function appendEmployee(empList, searchCategory){
	 $("."+searchCategory).html('');
	 var op = '';
	 for(var i=0;i<empList.length;i++){
		 if (i == 0) {
			 op += '<li id="'+empList[i].employeeCode+'"  class="selected" onclick=getCode(this,"'+searchCategory+'"); ><a>'+empList[i].firstName+' '+empList[i].lastName+' - '+empList[i].employeeCode+'</a>';
		}else
			 op += '<li id="'+empList[i].employeeCode+'" onclick=getCode(this,"'+searchCategory+'"); ><a>'+empList[i].firstName+' '+empList[i].lastName+' - '+empList[i].employeeCode+'</a>';
	 }
	 $("."+searchCategory).html(op);
	 $("."+searchCategory).show();
}

function getCode(element,type){
	var id= $(element).attr("id");
	selectEmployee(id);
	$(".services").hide();
	$("."+type).html("");
}

function selectEmployee(id){
	$("#searchEmployee").val("");
	 var location = $("#shiftLocation").val();
	 var contextPath = $("#contextPath").val();
	 URL = contextPath + "/admin/searchEmployee.do";
	 $.ajax({
			type: "GET",
			url : URL,
			data : {
				empName : id,
				location : location
			},
			beforeSend: function(xhr){                    
   	   			$("#loading").css("display","block");
   	   			$("#mainDiv").addClass("disabled");
   	   		  },
			success : function(result) {
				appendEmployeeDetails(result);
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


function appendEmployeeDetails(empList){
	$('.odd').remove();
	 var shiftStartDate =  $("#shiftStartDate").val();
	 var shiftEndDate = $("#shiftEndDate").val();
	 var weekDays = $("#shiftWeekDays").val();
		weekDays = weekDays.replace(/ /g,'').replace('[','').replace(']','');
		weekDays = weekDays.split(',');
		var sun='',mon='',tue='',wed='',thu='',fri='',sat='';
		for(var i=0;i<weekDays.length;i++){
			if(weekDays[i] == "Sunday")
				sun = 'checked="checked"';
			if(weekDays[i] == "Monday")
				mon = 'checked="checked"';
			if(weekDays[i] == "Tuesday")
				tue = 'checked="checked"';
			if(weekDays[i] == "Wednesday")
				wed = 'checked="checked"';
			if(weekDays[i] == "Thursday")
				thu = 'checked="checked"';
			if(weekDays[i] == "Friday")
				fri = 'checked="checked"';
			if(weekDays[i] == "Saturday")
				sat = 'checked="checked"';
		}
     var contextPath = $("#contextPath").val();
	 var len = parseInt($("#productsList tr").length);
		if (len != 1)
			len = parseInt($("#productsList tr:last").attr("id").replace('dynamicdiv', '')) + 1;
	 var row = "<tr id='dynamicdiv"+len+"' style='margin-top:5px;'><td id='empId"+len+"'>"+empList[0].employeeCode+"</td>" +
	"<td id='empName"+len+"'>"+empList[0].firstName+' '+empList[0].lastName+"</td><td id='empDesg"+len+"'>"+empList[0].designation+"</td>" +
	"<td id='empDept"+len+"'>"+empList[0].department+"</td>" +
	"<td><input class='form-control calendar_icon startDate' value="+shiftStartDate+" readonly='readonly' style='width:100px;background-color: white;' id='empStartDate"+len+"' type='text' onfocus=callCalender('empStartDate"+len+"') onclick=callCalender('empStartDate"+len+"') placeholder='DD/MM/YYYY' /></td>" +
	"<td><input class='form-control calendar_icon endDate' value="+shiftEndDate+" readonly='readonly' style='width:100px;background-color: white;' id='empEndDate"+len+"' type='text' onfocus=callCalender('empEndDate"+len+"') onclick=callCalender('empEndDate"+len+"') placeholder='DD/MM/YYYY' /></td>" +
	"<td><div style='width: 340px;'><input type='checkbox' id='sun"+len+"' "+sun+" style='vertical-align: -2px' class='sun'>Sun&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type='checkbox' id='mon"+len+"' "+mon+" style='vertical-align: -2px' class='mon'>Mon&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type='checkbox'  "+tue+" id='tue"+len+"' style='vertical-align: -2px' class='tue'>Tue&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type='checkbox' id='wed"+len+"' "+wed+" style='vertical-align: -2px' class='wed'>Wed&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type='checkbox' id='thu"+len+"' "+thu+" style='vertical-align: -2px' class='thu'>Thu&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type='checkbox' "+fri+" id='fri"+len+"' style='vertical-align: -2px' class='fri'>Fri&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type='checkbox' "+sat+" id='sat"+len+"' style='vertical-align: -2px' class='sat'>Sat</div></td>"+
	"<td id='Del"+ len +"' ><img id='Img"+ len +"' src='"+contextPath+"/images/itemdelete.png' style='width:30px;cursor:pointer;' onclick='deleteItem(this);' title='Delete "+empList[0].employeeCode+"'/>" +
	"</td></tr>";
	$("#productsList tbody").append(row);
	callCalender("empStartDate"+len);
	callCalender("empEndDate"+len);
}

function deleteItem(element){
	var id = $(element).attr("id").replace('Img','');
	$('#dynamicdiv'+id).remove();
}

function selectDays(){
	var weekDays = $("#shiftWeekDays").val();
	weekDays = weekDays.replace(/ /g,'').replace('[','').replace(']','');
	weekDays = weekDays.split(',');
	$(".sun").removeAttr("checked");
	$(".mon").removeAttr("checked");
	$(".tue").removeAttr("checked");
	$(".wed").removeAttr("checked");
	$(".thu").removeAttr("checked");
	$(".fri").removeAttr("checked");
	$(".sat").removeAttr("checked");
	for(var i=0;i<weekDays.length;i++){
		if(weekDays[i] == "Sunday")
			$(".sun").prop("checked",true);
		if(weekDays[i] == "Monday")
			$(".mon").prop("checked",true);
		if(weekDays[i] == "Tuesday")
			$(".tue").prop("checked",true);
		if(weekDays[i] == "Wednesday")
			$(".wed").prop("checked",true);
		if(weekDays[i] == "Thursday")
			$(".thu").prop("checked",true);
		if(weekDays[i] == "Friday")
			$(".fri").prop("checked",true);
		if(weekDays[i] == "Saturday")
			$(".sat").prop("checked",true);
	}
}

	function validateShiftAllocation(type){
		$('.odd').remove();
		 var len = $("#productsList tr").length-1;
		 if(len == 0){
			alert("Add Atleast One Employee to Shift");
			return false;
		 }
		 var finalObj = {}, shiftAllocationList = [];
		 if($("#shiftId").val().trim() == ""){
			 $("#shiftIdError").html("Shift Id is required");
			 return false;
		 }
		 if($("#shiftLocation").val().trim() == ""){
			 $("#shiftLocationError").html("Shift Location is required");
			 return false;
		 }
		 if($("#shiftDepartment").val().trim() == ""){
			 $("#shiftDepartmentError").html("Shift Department is required");
			 return false;
		 }
		 finalObj.shiftId = $("#shiftId").val();
		 finalObj.shiftLocation = $("#shiftLocation").val();
		 finalObj.shiftDepartment = $("#shiftDepartment").val();
		 var   flowUnder = $("#flowUnder").val();
		 finalObj.flowUnder = flowUnder;
		 finalObj.shiftAllocationList = shiftAllocationList;
		 for(var i=1;i<=len;i++){
			var idAttr = $("#productsList tr:eq("+i+") td:last").attr("id");
			idAttr = idAttr.replace('Del','');
			if($("#empStartDate"+idAttr).val().trim() == ""){
				alert("Start Date is Required");
				$("#empStartDate"+idAttr).focus();
				return;
		   }
			if($("#empEndDate"+idAttr).val().trim() != ""){
				var noOfDays = daydiff(parseDate($("#empStartDate"+idAttr).val()), parseDate($("#empEndDate"+idAttr).val()));
				 if(noOfDays < 0){
					alert("End Date can't be less than Start Date");
					$("#empEndDate"+idAttr).focus();
					return;
				 }
			}
			var obj = {empId:$("#empId"+idAttr).text(),empName:$("#empName"+idAttr).text(),empDesignation:$("#empDesg"+idAttr).text(),empDepartment:$("#empDept"+idAttr).text(),start_Date:$("#empStartDate"+idAttr).val(),end_Date:$("#empEndDate"+idAttr).val(),day1Flag:$("#sun"+idAttr).prop("checked"),day2Flag:$("#mon"+idAttr).prop("checked"),day3Flag:$("#tue"+idAttr).prop("checked"),day4Flag:$("#wed"+idAttr).prop("checked"),day5Flag:$("#thu"+idAttr).prop("checked"),day6Flag:$("#fri"+idAttr).prop("checked"),day7Flag:$("#sat"+idAttr).prop("checked")};
			finalObj.shiftAllocationList.push(obj);
		}
		 var formData = JSON.stringify(finalObj);
//		 console.log(formData);
			var contextPath = $("#contextPath").val();
			if (type == "new")
				URL = contextPath + "/admin/createShiftAllocation.do";
			else
				URL = contextPath + "/admin/updateShiftAllocation.do";
			$.ajax({
				type : "POST",
				url : URL,
				contentType : "application/json",
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
	
	
	function viewSpecificShiftAllocation(shiftId,type){
		 var contextPath = $("#contextPath").val();
		 debugger
		 //added by manasa
		 var location=$("#shiftlocation").val();
		 var   flowUnder = $("#flowUnder").val();
		 
	   	 URL = contextPath + "/admin/viewSpecificShiftAllocation.do";
	 		$.ajax({
	 			type: "GET",
	 			url : URL,
	 			data : {
	 				shiftId : shiftId,
	 				type : type,
	 				location : location,
	 				flowUnder : flowUnder
	 			},
	 			beforeSend: function(xhr){                    
      	   			$("#loading").css("display","block");
      	   			$("#mainDiv").addClass("disabled");
      	   		  },
      			success : function(result) {
	 				//$("#tab_2").html(result);
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
	
	function searchShiftAllocationMaster(name,searchCategory,index){
		var location = "";
		 if($("#shiftLocation").length>0 && $("#shiftLocation").val != "select" && $("#shiftLocation").val != "-- Select --"){
 		location = $("#shiftLocation").val();
		 }
		 
		 var flowUnder = $("#flowUnder").val();
		//written by manasa
			 var allLocationsList = [];
			 var length = $('#shiftLocation').children('option').length;
			 console.log(length)
		      	$('#shiftLocation option').each(function() { 
		      		allLocationsList.push( $(this).attr('value'));
		      	   
		      	});
			
			 console.log(allLocationsList)
			// finalobj.billedLocations = billedLocationsList;
			
			//written by manasa
				 var  locationList="";
			      	for(i=1;i<allLocationsList.length;i++)
			      		{
			      		locationList =locationList+ allLocationsList[i]+',';
			      		}
			      //	locationList = locationList.slice(0,-1);//remove last comma
			    
			      	console.log(locationList)
		 
		 var contextPath = $("#contextPath").val();
		 URL = contextPath + "/admin/searchShiftAllocationMaster.do";
		 $.ajax({
				type: "GET",
				url : URL,
				data : {
					searchName : name,
					index : index,
					location : location,
					locationList : locationList,
					flowUnder : flowUnder
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

	