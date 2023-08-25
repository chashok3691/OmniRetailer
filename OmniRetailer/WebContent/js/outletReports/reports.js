$(document).ready(function(){
	
	$('.box.box-primary').css('min-height','650px');
/*	$("#date").blur(function(){
		 if(!re.test($("#date").val())){
				$("#dateError").html("Invalid Date");
				$("#date").focus();
				return;
		 }else{
			 $("#dateError").html("");
		 }
	});*/
	
	searchCategorybasedonlocation('location','productCategory','outletBrandId');
	//searchSubCategories('productCategory','outletSubcategory')generateSalesReportCriteriaWise

});
var re = /^[0-9/]+$/;
function changeInfoBasedOnLocation(location,flow){
	debugger;
	//alert("Location>>>"+location);
	getCountersByLocation(location,flow);
	getShiftsByLocation(location);
	getemployeesByLocation(location);
	
}

function changeImage(){
	
}
/*@author Raviteja
 *@returns viewOutletXReadingReport */
function viewOutletXReport(id,location,counter,shiftId,date,saveFlag){
	//debugger;
	 //purpose:for checking internet conection
	var online = window.navigator.onLine;
	
	
	
  	if(!online)
  	{
  	alert("check your internet connection,please try agian after some time");
  	return;
  	}
  	
  	
  	var maxRecords = "10";
	if($('#maxRecords').length > 0)
		maxRecords = $('#maxRecords').val();
	
	var zone="";
	if($('#outletZone').length > 0)
		zone = $('#outletZone').val();
	
	var outletLocation="";
	if($('#outletLocation').length > 0)
		outletLocation= $('#outletLocation').val();
	
	
	var startDate="";
	if($('#fromXread').length > 0)
		startDate= $('#fromXread').val();
	
	var endDate="";
	if($('#toXread').length > 0)
		endDate = $('#toXread').val();
	
	var flowLocation = $('#flowLocation').val();
	
	if(flowLocation != undefined){
		flowLocation = "";
	}
	
		var contextPath = $('#contextPath').val();
		date = date+" 00:00:00";
		var URL = contextPath + "/reports/generateOutletXReport.do";
		$.ajax({
			url : URL,
			data : {
				location : location,
				counter : counter,
				shiftId : shiftId,
				date : date,
				saveFlag:saveFlag,
				startDate:startDate,
				endDate:endDate,
				zone : zone,
				maxRecords : maxRecords,
				outletLocation : outletLocation,
				flowLocation : flowLocation
				
				
		},
		beforeSend: function(xhr){                    
				$("#loading").css("display","block");
				$("#mainDiv").addClass("disabled");
	        },

		success : function(result){
			$(".active-menu").removeClass("active-menu");
//			$("#outletLocation").val(outletLocation);
			openMenu("liOutletSalesReports","ulOutletSalesReports",0);
			openMenu("liOutletReports","ulOutletReports",1);
			openMenu("reports", "ulReports",1);
			activeMenu(id);
			$('#right-side').html(result);
			$("#loading").css("display","none");
			$("#mainDiv").removeClass('disabled');
		},
		error : function(){
			alert("Something went wrong");
			$("#loading").css("display","none");
			   $("#mainDiv").removeClass('disabled');
		}
	 });
	}




function searchOutletXReport(id,location,counter,shiftId,date,saveFlag){
	//debugger;
	 //purpose:for checking internet conection
	var online = window.navigator.onLine;
	
	
	
  	if(!online)
  	{
  	alert("check your internet connection,please try agian after some time");
  	return;
  	}
  	
  	
  	var maxRecords = "10";
	if($('#maxRecords').length > 0)
		maxRecords = $('#maxRecords').val();
	
	var zone="";
	if($('#outletZone').length > 0)
		zone = $('#outletZone').val();
	
	var outletLocation="";
	if($('#outletLocation').length > 0)
		outletLocation= $('#outletLocation').val();
	
	
	var startDate="";
	if($('#fromXread').length > 0)
		startDate= $('#fromXread').val();
	
	var endDate="";
	if($('#toXread').length > 0)
		endDate = $('#toXread').val();
	
	
	
		var contextPath = $('#contextPath').val();
		date = date+" 00:00:00";
		var URL = contextPath + "/reports/generateOutletXReport.do";
		$.ajax({
			url : URL,
			data : {
				location : location,
				counter : counter,
				shiftId : shiftId,
				date : date,
				saveFlag:saveFlag,
				startDate:startDate,
				endDate:endDate,
				zone : zone,
				maxRecords : maxRecords,
				outletLocation : outletLocation
				
				
		},
		beforeSend: function(xhr){                    
				$("#loading").css("display","block");
				$("#mainDiv").addClass("disabled");
	        },

		success : function(result){
			$(".active-menu").removeClass("active-menu");
//			$("#outletLocation").val(outletLocation);
			openMenu("liOutletSalesReports","ulOutletSalesReports",0);
			openMenu("liOutletReports","ulOutletReports",1);
			openMenu("reports", "ulReports",1);
			activeMenu(id);
			$('#right-side').html(result);
			$("#loading").css("display","none");
			$("#mainDiv").removeClass('disabled');
		},
		error : function(){
			alert("Something went wrong");
			$("#loading").css("display","none");
			   $("#mainDiv").removeClass('disabled');
		}
	 });
	}










/*@author Raviteja
 *@returns viewOutletZReadingReport */
	function viewOutletZReport(id,location,counter,date,endDate,saveFlag){
		 //purpose:for checking internet conection
		var online = window.navigator.onLine;
	  	if(!online)
	  	{
	  	alert("check your internet connection,please try agian after some time");
	  	return;
	  	}
	  	
	  	var maxRecords = "10";
		if($('#maxRecords').length > 0)
			maxRecords = $('#maxRecords').val();
		
		var zone="";
		if($('#outletZone').length > 0)
			zone = $('#outletZone').val();
		
		var outletLocation="";
		if($('#outletLocation').length > 0)
			outletLocation= $('#outletLocation').val();
		
		
		var startDate="";
		if($('#fromZRead').length > 0)
			startDate= $('#fromZRead').val();
		
		var endDate="";
		if($('#toZRead').length > 0)
			endDate = $('#toZRead').val();
	  	
		var contextPath = $('#contextPath').val();
		date = date+" 00:00:00";
		
		
		var flowLocation = $('#flowLocation').val();
		
		if(flowLocation != undefined){
			flowLocation = "";
		}
	//	var endDate = $("#endDate").val();
		var URL = contextPath + "/reports/generateOutletZReport.do";
		$.ajax({
			url : URL,
			data : {
				location : location,
				counter : counter,
				date : date,
				saveFlag:saveFlag,
				startDate:startDate,
				endDate:endDate,
				zone : zone,
				maxRecords : maxRecords,
				outletLocation : outletLocation,
				flowLocation : flowLocation
				
		},
		beforeSend: function(xhr){                    
				$("#loading").css("display","block");
				$("#mainDiv").addClass("disabled");
	        },

		success : function(result){
			$(".active-menu").removeClass("active-menu");
			openMenu("liOutletSalesReports","ulOutletSalesReports",0);
			openMenu("liOutletReports","ulOutletReports",1);
			openMenu("reports", "ulReports",1);
			activeMenu(id);
			$('#right-side').html(result);
			$("#loading").css("display","none");
			$("#mainDiv").removeClass('disabled');
		},
		error : function(){
			alert("Something went wrong");
			$("#loading").css("display","none");
			   $("#mainDiv").removeClass('disabled');
		}
	 });
	}
	
	//addedd by manasa
	function getemployeesByLocation(location){
		 //purpose:for checking internet conection
		var online = window.navigator.onLine;
	  	if(!online)
	  	{
	  	alert("check your internet connection,please try agian after some time");
	  	return;
	  	}
		var contextPath = $('#contextPath').val();
		if(location=="all")
			location="";
		  var URL = contextPath + "/reports/getemployeesByRole.do";
		  $.ajax({
			url : URL,
			data : {
				location : location
			},
			success : function(counters){
				//debugger
				//alert("Result:::"+counters);
				if(counters.length>0){
					 var op = '<option value="" >ALL </option>';
					$("#cashierName").html("");
					$("#cashierError").html("");
					for(var i=0;i<counters.length;i++){
						op += '<option value="'+counters[i].employeeCode+'">'+counters[i].firstName+'</option>';
					}
					$("#cashierName").html(op);
				}else{
					$("#cashierName").html("");
					//alert("Counters are not found in "+location+" location");
					$("#cashierError").html("Cashiers are not found in "+location+" location");
				}
			},
			error : function(){
				//alert("Counters are not found in "+location+" location");
				$("#cashierError").html("Cashiers are not found in "+location+" location");
			}
		 });
	}
	
	
	
	
	
function getCountersByLocation(location,flow){
	debugger
	 //purpose:for checking internet conection
	var online = window.navigator.onLine;
  	if(!online)
  	{
  	alert("check your internet connection,please try agian after some time");
  	return;
  	}
	var contextPath = $('#contextPath').val();
	if(location=="all")
		location="";
	if(flow == undefined || flow == null){
		flow ="";
	}
	
	  var URL = contextPath + "/reports/getCountersByLocation.do";
	  $.ajax({
		url : URL,
		data : {
			location : location,
			flow : flow
		},
		success : function(counters){
			//alert("Result:::"+counters);
			if(counters.length>0){
				 var op = '<option value="" >ALL </option>';
				$("#counter").html("");
				$("#counterError").html("");
				for(var i=0;i<counters.length;i++){
					op += '<option value="'+counters[i]+'">'+counters[i]+'</option>';
				}
				$("#counter").html(op);
			}else{
				$("#counter").html("");
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
	  
function viewVariationGraph(name,classname,horizontal,vertical,labelid){
	//debugger
	var label = [], sale = [] ,CQty = [];
	$('.'+classname).each(function(){
			var id= $(this).attr("id").replace(labelid,'');
			label.push($("#date"+id).text());
			sale.push($("#sale"+id).text());
		});
	
	
	var stocksLineChartData = {
			labels : label,
			datasets : [
				
				{
					fillColor : "#0cd22d",
					fill: true,
					strokeColor : "#337ab7",
					pointColor : "#ccc",
					pointStrokeColor : "#fff",
					/*data : [0.65,0.59,0.90,0.81,0.56,0.55,0.40],*/
					data : sale,
		            title : "Total Sale",
		            label : "Quantity"
				}
			]

		}
	new Chart(document.getElementById("pricevar").getContext("2d")).Line(stocksLineChartData,newopts);
	$("#productNmae").text(name);
	var  op = '<a id="summaryTag"  data-toggle="modal" data-target="#GraphPopup"></a>';
	 $("#triggerEvent").append(op);
	 $("#summaryTag" ).trigger( "click" );
	 $("#triggerEvent").html("");
}


	  function getShiftsByLocation(location){
		  //purpose:for checking internet conection
			var online = window.navigator.onLine;
		  	if(!online)
		  	{
		  	alert("check your internet connection,please try agian after some time");
		  	return;
		  	}
			var contextPath = $('#contextPath').val();
			  var URL = contextPath + "/reports/getShiftsByLocation.do";
			  $.ajax({
				url : URL,
				data : {
					location : location
				},
				success : function(shifts){
					//alert("Result:::"+result);
					if(shifts.length>0){
						var op='';
						$("#shiftId").html("");
						$("#shiftError").html("");
						for(var i=0;i<shifts.length;i++){
							op += '<option value="'+shifts[i]+'">'+shifts[i]+'</option>';
						}
						$("#shiftId").html(op);
					}else{
						$("#shiftId").html("");
						//alert("Shifts are not found in "+location+" location");
						$("#shiftError").html("Shifts are not found in "+location+" location");
					}
				},
				error : function(){
					//alert("Shifts are not found in "+location+" location");
					$("#shiftError").html("Shifts are not found in "+location+" location");
				}
			 });
}
	  
function generateReport(reportType,searchCategory){
	debugger;
	var location = $("#location").val();
	var counter = $("#counter").val();
	var shiftId = $("#shiftId").val();
	var contextPath = $('#contextPath').val();
	var date = $("#date").val();
	if (searchCategory == "save")
		var saveFlag = true;
	else
		var saveFlag =false;

	 
	 
 	//debugger
  	var maxRecords = "10";
	if($('#maxRecords').length > 0)
		maxRecords = $('#maxRecords').val();
	
	var zone="";
	if($('#outletZone').length > 0)
		zone = $('#outletZone').val();
	
	var outletLocation="";
	if($('#outletLocation').length > 0)
		outletLocation= $('#outletLocation').val();
	
	
	var startDate="";
	if($('#fromXread').length > 0)
		startDate= $('#fromXread').val();
	
	var endDate="";
	if($('#toXread').length > 0)
		endDate = $('#toXread').val();
	 $('#myModalIos').modal('hide');
	
	 var flowLocation = $('#flowLocation').val();
	 if(flowLocation == null && flowLocation == undefined){
		 flowLocation = ""; 
	 }
	 
	
	/*if(!re.test($("#date").val())){
		$("#dateError").html("Invalid Date");
		$("#date").focus();
		return;
   }else{
	 $("#dateError").html("");
   }*/
	if(reportType=="X"||reportType=="x"){
		if(counter==""||counter==null){
			$("#counterError").html("Counter is required for generating report");
			return;
		}if(shiftId==""||shiftId==null){
			$("#shiftError").html("Shift is required for generating report");
			return;
		}if(date==""){
			$("#dateError").html("Date is required for generating report");
			return;
		}
		date = date+" 00:00:00";
		var URL = contextPath + "/reports/generateOutletXReport.do";
		$.ajax({
			url : URL,
			data : {
				location : location,
				counter : counter,
				shiftId : shiftId,
				date : date,
				saveFlag : saveFlag,
				maxRecords : maxRecords,
				zone : zone,
				outletLocation : outletLocation,
				startDate : startDate,
				endDate : endDate,
				flowLocation : flowLocation
					
					
			},
			beforeSend: function(xhr){                    
		   			$("#loadingreport").css("display","block");
		   			$("#mainDiv").addClass("disabled");
		   		  },
			success : function(result){
				//$("#xReportsDisplay").html(result);
				$('#right-side').html(result);
				 var anchor = document.createElement('a');
				 
				  anchor.href = $("#stockdownloadurl").val();
				  anchor.target = '_blank';
				  anchor.download = '';
				if($("#stockdownloadurl").val()!=null && $("#stockdownloadurl").val()!='')
				  anchor.click();

				$("#loadingreport").css("display","none");
				$("#mainDiv").removeClass('disabled');
			},
			error : function(){
				alert("Something went wrong");
				$("#loading").css("display","none");
				$("#mainDiv").removeClass('disabled');
			}
		 });
	}
	if(reportType=="Z"||reportType=="z"){
		if(counter==""||counter==null){
			$("#counterError").html("Counter is required for generating report");
			return;
		}if(date==""){
			$("#dateError").html("Date is required for generating report");
			return;
		}
		date = date+" 00:00:00";
		var endDate = "";
		if($("#endDate").length > 0)
		endDate = $("#endDate").val();
		var URL = contextPath + "/reports/generateOutletZReport.do";
		$.ajax({
			url : URL,
			data : {
				location : location,
				counter : counter,
				date : date,
				endDate : endDate,
				saveFlag:saveFlag,
				maxRecords : maxRecords,
				zone : zone,
				outletLocation : outletLocation,
				startDate : startDate,
				flowLocation : flowLocation
				
			},
			beforeSend: function(xhr){                    
		   			$("#loading").css("display","block");
		   			$("#mainDiv").addClass("disabled");
		   		  },
			success : function(result){
				//$("#zReportsDisplay").html(result);
				$('#right-side').html(result);
				 var anchor = document.createElement('a');
				 
				  anchor.href = $("#stockdownloadurl").val();
				  anchor.target = '_blank';
				  anchor.download = '';
				if($("#stockdownloadurl").val()!=null && $("#stockdownloadurl").val()!='')
				  anchor.click();

				$("#loading").css("display","none");
				$("#mainDiv").removeClass('disabled');
			},
			error : function(){
				alert("Something went wrong");
				$("#loadingreport").css("display","none");
				$("#mainDiv").removeClass('disabled');
			}
		 });
	}
	if(reportType=="XZ"||reportType=="xz"){
		if(date==""){
			$("#dateError").html("Date is required for generating report");
			return;
		}
		date = date+" 00:00:00";
		var URL = contextPath + "/reports/generateOutletXZReport.do";
		$.ajax({
			url : URL,
			data : {
				location : location,
				date : date
			},
			beforeSend: function(xhr){                    
		   			$("#loading").css("display","block");
		   			$("#mainDiv").addClass("disabled");
		   		  },
			success : function(result){
				$("#xzReportsDisplay").html(result);
				 var anchor = document.createElement('a');
				 
				  anchor.href = $("#stockdownloadurl").val();
				  anchor.target = '_blank';
				  anchor.download = '';
				if($("#stockdownloadurl").val()!=null && $("#stockdownloadurl").val()!='')
				  anchor.click();

				$("#loading").css("display","none");
				$("#mainDiv").removeClass('disabled');
			},
			error : function(){
				alert("Something went wrong");
				$("#loading").css("display","none");
				$("#mainDiv").removeClass('disabled');
			}
		 });
	}
	}
	

function getreportsummary(criteria){
	var order = null;
 	var orderBy = null;
	var location = null;
	 //purpose:for checking internet conection
	var online = window.navigator.onLine;
  	if(!online)
  	{
  	alert("check your internet connection,please try agian after some time");
  	return;
  	}
	
	var saveFlag =false;
	
	 $('#myModalIos').modal('hide');
	
	if($("#location").length > 0)
		location = $("#location").val();
	var contextPath = $('#contextPath').val();
	var startDate = $("#startDate").val();
	var endDate = $("#endDate").val();
	var maxRecords = 10;
	var counterId = null;
	if($("#counter").length > 0)
		counterId = $("#counter").val();
	var category = null;
	if($("#productCategory").length > 0)
		category = $("#productCategory").val();
	var brand = null;
	if($("#outletBrandId").length > 0)
		brand = $("#outletBrandId").val();
	var section = null;
	if($("#section").length > 0)
		section = $("#section").val();
	var subcategory = null;
	if($("#outletSubcategory").length > 0)
		subcategory = $("#outletSubcategory").val();
	var zone = null;
	if($("#outletZone").length > 0)
		zone = $("#outletZone").val();
	var department = null;
	if($("#outletDepartmentId").length > 0)
		department = $("#outletDepartmentId").val();
	if($("#maxRecords").length > 0)
		maxRecords = $("#maxRecords").val();
	var supplier="";
	if($("#supplier_Id").length > 0)
		supplier = $("#supplier_Id").val();
	if(endDate !="" && startDate == ""){
		$("#startDateError").html("Date is required for generating report");
		return;
	}

		$(".columnSort").each(function(){
    		background = $(this).css("background");
    		if(background.indexOf('asc') != -1){
    			order = "ASC";
    			orderBy = $(this).attr("id");
    		}
    		if(background.indexOf('desc') != -1){
    			order = "DESC";
    			orderBy = $(this).attr("id");
    		}
    	});
		//debugger
		var URL = contextPath + "/reports/generateReportCriteriaWise.do";
		$.ajax({
			url : URL,
			data : {
				location : location,
				startDate : startDate,
				endDate : endDate,
				maxRecords : maxRecords,
				criteria : criteria,
				index : '-1',
				order : order,
	       		orderBy : orderBy,
	       		counterId : counterId,
	       		category : category,
	       		saveFlag:saveFlag,
	       		zone : zone,
	       		subcategory : subcategory,
	       		department : department,
	       		section: section,
	       		brand :brand,
	       		supplier : supplier,
			},
			beforeSend: function(xhr){                    
		   			$("#loading").css("display","block");
		   			$("#mainDiv").addClass("disabled");
		   		  },
			success : function(result){
				$('#summary').html('');
				$('#summary').html(result);
				new d3pie("OrdersPieChart", {
					data: {
						content: getOrderPieChartData()
					},
			    	tooltips: {
				        enabled: true,
				        type: "placeholder",
				        string: "{label}: {percentage}% ({value})",
				        placeholderParser: function(index, data) {
				          data.label = data.label + "!";
				          data.percentage = data.percentage.toFixed(2);
				          data.value = data.value.toFixed(5);
				        }
				    }
				});
			
				if(location == "")
					location = "ALL";
				$("#locationLable").html(location);
				if(startDate != "" && endDate != "")
					$("#dateLable").html("  ("+startDate+" - "+endDate+")");
				 if(startDate != "" && endDate == ""){
					 var dateTime = getCurrentDate();
					  var date = dateTime.split(' ');
					  date = date[0].split('/');
					  endDate = date[1]+"/"+date[0]+"/"+date[2];
					  $("#dateLable").html("  ("+startDate+" - "+endDate+")");
				 }
				var  op = '<a id="summaryTag"  data-toggle="modal" data-target="#myModalIos"></a>';
				 $("#triggerEvent").append(op);
				 $("#summaryTag" ).trigger( "click" );
				 $("#triggerEvent").html("");
				$("#loading").css("display","none");
				$("#mainDiv").removeClass('disabled');
     				
				$("#loading").css("display","none");
				$("#mainDiv").removeClass('disabled');
			},
			error : function(){
				alert("Something went wrong");
				$("#loading").css("display","none");
				$("#mainDiv").removeClass('disabled');
			}
		 });
	
}
function getOrderPieChartData(){
		var salesExecutiveCount = $("#ordersummary").val();
		var orderPieChartData = [];
		     for(var i = 0; i<salesExecutiveCount;i++){
		    	var obj = {label:$("#workflowId"+i).val(),value:parseInt($("#workflowOrders"+i).val())};
		    	orderPieChartData.push(obj);
		     }    
		return orderPieChartData;
		}

function generateDueCollectionReport(criteria,searchCategory,index,popup,flow){
	var order = null;
	 $('#myModalIos').modal('hide');
	 $('#myModalIoss').modal('hide');
	 //purpose:for checking internet conection
	var online = window.navigator.onLine;
  	if(!online)
  	{
  	alert("check your internet connection,please try agian after some time");
  	return;
  	}
 	var orderBy = null;
	var location = null;
	if($("#location").length > 0)
		location = $("#location").val();
	var contextPath = $('#contextPath').val();
	var startDate = $("#startDate").val();
	var endDate = $("#endDate").val();
	
	
	if ($("#startDateTax").val() != "" && $("#endDateTax").val() != "") {
   		var noOfDays = daydiff(parseDate(startDate), parseDate(endDate));
   		if (noOfDays < 0) {
   			alert("Start Date can't be less than End Date");
   			return;
   		}
   	}
		
		
  	 if(endDate!="" || endDate!=null)
//  		 if(criteria == 'date'){
  		 {
  			 var  allownoOfDays = daydiff(parseDate(startDate), parseDate(endDate));
  			 if(allownoOfDays > 31){
  				 alert("Date Range should not exceed a Month");
  				 return false;
  			 }
  		 }


  	if(popup == "" || popup == undefined || popup == null){
			popup="";
		}
	
	
	
		if(popup=="NOPOP"){
			 if(allownoOfDays>15 ){
				 
				 $('#myModalIoss').modal('show');

				 
					/*var returnValue = getConfirmation();
					if(returnValue == false)*/
						return;
					}
		     }
		
	
	
	var maxRecords = 10;
	if (searchCategory == "save")
		var saveFlag = true;
	else
		var saveFlag =false;
	
	 $('#myModalIos').modal('hide');
	
	
	if($("#maxRecords").length > 0)
		maxRecords = $("#maxRecords").val();
	if(endDate !="" && startDate == ""){
		$("#startDateError").html("Date is required for generating report");
		return;
	}
		$(".columnSort").each(function(){
    		background = $(this).css("background");
    		if(background.indexOf('asc') != -1){
    			order = "ASC";
    			orderBy = $(this).attr("id");
    		}
    		if(background.indexOf('desc') != -1){
    			order = "DESC";
    			orderBy = $(this).attr("id");
    		}
    	});
		var URL = "";
		if(criteria == "creditsales")
			URL = contextPath + "/reports/generateCreditSalesReport.do";
		else
			URL = contextPath + "/reports/generateDueCollectionReport.do";
		$.ajax({
			url : URL,
			data : {
				location : location,
				startDate : startDate,
				endDate : endDate,
				customer : $("#customer").val(),
				maxRecords : maxRecords,
				criteria : criteria,
				index : index,
				order : order,
	       		orderBy : orderBy,
	       		saveFlag:saveFlag,
	       		flow : flow
			},
			beforeSend: function(xhr){                    
				$("#loadingreport").css("display","block");
				$("#mainDiv").addClass('disabled');
		   		  },
			success : function(result){
				$("#xReportsDisplay").html(result);
				/*columnReset();
    			var backgroundCss = $("#"+orderBy).css("background");
    			if(order == "ASC"){
    				backgroundCss = backgroundCss.replace('both','asc');
    				$("#"+orderBy).css("background",backgroundCss);
    			}
    			else if(order == "DESC"){
    				backgroundCss = backgroundCss.replace('both','desc');
    				$("#"+orderBy).css("background",backgroundCss);
    			}else{
    				var backgroundCss = $("#businessDate").css("background");
    				backgroundCss = backgroundCss.replace('both','desc');
    				$("#businessDate").css("background",backgroundCss);
    			}*/
				 var anchor = document.createElement('a');
				 
				  anchor.href = $("#stockdownloadurl").val();
				  anchor.target = '_blank';
				  anchor.download = '';
				if($("#stockdownloadurl").val()!=null && $("#stockdownloadurl").val()!='')
				  anchor.click();
				$("#mainDiv").removeClass('disabled');
				$("#loadingreport").css("display","none");
			},
			error : function(){
				alert("Something went wrong");
				$("#loadingreport").css("display","none");
				$("#mainDiv").removeClass('disabled');
			}
		 });
}


function generateSalesReportCriteriaWise(criteria,searchCategory,index,popup,flow){
	debugger;
	var order = null;
 	var orderBy = null;
	var location = "";
	$("#errorMsg").html("");
	//debugger
	 //purpose:for checking internet conection
	var online = window.navigator.onLine;
  	if(!online)
  	{
  	alert("check your internet connection,please try agian after some time");
  	return;
  	}
	if (searchCategory == "save")
		var saveFlag = true;
	else
		var saveFlag =false;
	
	 $('#myModalIos').modal('hide');
	 $('#myModalIoss').modal('hide');
	

	 
	 var name="";
	 if(criteria == "skuSales")
	  name = $('#skuSales').val().trim();
	 else
	  name="";
	 
	 var mytime ="";
	 var mytime1 ="";
	 var  hourfilter=""
	var isHourWiseReport="false"; 
		 
		 if(criteria=="hour"){
	  hourfilter = $('#hourselection').val();
	Arr_hourfilter = new Array()
	Arr_hourfilter = hourfilter.split("-");
	Arr_hourfilter1=Arr_hourfilter[0];
	Arr_hourfilter2=Arr_hourfilter[1];
		if(hourfilter!=""){
			
			isHourWiseReport="true";
			
			  var h = Arr_hourfilter1;
			  var e = Arr_hourfilter2;
			  var m = "00"
			  var x ="00"
			
			  mytime= h + ':' + m + ':' + x;
			  mytime1= e + ':' + m + ':' + x;
			  
		}else{
			isHourWiseReport="false";
			
			
			
		}
	}
	
	
	
	 
	 
	if($("#location").length > 0)
		location = $("#location").val();
	var contextPath = $('#contextPath').val();
	var startDate = "";
	
	
		if($("#startDate").length > 0 && $("#startDate").val() !=""){
			startDate =  $("#startDate").val();
	
	}
	
	var endDate = $("#endDate").val();
	
	if(popup == "" || popup == undefined || popup == null){
		popup="";
	}
	
	
	
	if(endDate == "" || endDate == undefined || endDate == null){
			
			
		  var dateTime = getCurrentDate();
  	  var date = dateTime.split(' ');
  	  date = date[0].split('/');
  	  var formatedDate = date[1]+"/"+date[0]+"/"+date[2];
  	  var endDate = formatedDate;	
  	  endDate = endDate

		}
	 if(searchCategory != "NOPOP"){
	
	 if (startDate != "" && endDate != "") {
	   		var noOfDays = daydiff(parseDate(startDate), parseDate(endDate));
	   		if (noOfDays < 0) {
	   			alert("Start Date can't be less than End Date");
	   			return;
	   		}
	   	}
	
	 if(endDate!="" || endDate!=null)
			if(criteria == 'hour'){
		  	   var  allownoOfDays = daydiff(parseDate(startDate), parseDate(endDate));
				if(allownoOfDays > 1){
					alert("No.of Days between start and end date should not  be morethan 1 day");
					return false;
				}
				}
	 
	 if(endDate!="" || endDate!=null)
//		 if(criteria == 'date'){
		 {
			 var  allownoOfDays = daydiff(parseDate(startDate), parseDate(endDate));
			 if(allownoOfDays > 31){
				 alert("Date Range should not exceed a Month");
				 return false;
			 }
		 }
	
	 
	
	
     if(popup=="NOPOP"){
	 if(allownoOfDays>15 ){
		 
		 $('#myModalIoss').modal('show');

		 
			/*var returnValue = getConfirmation();
			if(returnValue == false)*/
				return;
			}
     }
   }
	 
	
			
	 
	var maxRecords = 10;
	var counterId = null;
	if($("#counter").length > 0)
		counterId = $("#counter").val();
	
	var cashierId=null;
	if($("#cashierName").length > 0)
		cashierId = $("#cashierName").val();
	
	var category = null;
	if($("#productCategory").length > 0)
		category = $("#productCategory").val();
	var brand = null;
	if($("#outletBrandId").length > 0)
		brand = $("#outletBrandId").val();
	var section = null;
	if($("#section").length > 0)
		section = $("#section").val();
	var subcategory = null;
	if($("#outletSubcategory").length > 0)
		subcategory = $("#outletSubcategory").val();
	var zone = null;
	if($("#outletZone").length > 0)
		zone = $("#outletZone").val();
	var department = null;
	if($("#outletDepartmentId").length > 0)
		department = $("#outletDepartmentId").val();
	if($("#maxRecords").length > 0)
		maxRecords = $("#maxRecords").val();
	
	var salesChannel = null;
    if($("#salesChannel").length > 0)
            salesChannel = $("#salesChannel").val();


	
	if($("#supplier_Id").length > 0)
		name = $("#supplier_Id").val();
	if(endDate !="" && startDate == ""){
		$("#startDateError").html("Date is required for generating report");
		return;
	}
	
	
	var billedLocationsList = [];
	 var length = $('#location').children('option').length;
      	$('#location option').each(function() { 
      		billedLocationsList.push( $(this).attr('value'));
      	});
	 var  locationList="";
   	for(i=1;i<billedLocationsList.length;i++)
   		{
   		locationList =locationList+ billedLocationsList[i]+',';
   		}
	
		$(".columnSort").each(function(){
    		background = $(this).css("background");
    		if(background.indexOf('asc') != -1){
    			order = "ASC";
    			orderBy = $(this).attr("id");
    		}
    		if(background.indexOf('desc') != -1){
    			order = "DESC";
    			orderBy = $(this).attr("id");
    		}
    	});
		
		
		var URL = contextPath + "/reports/generateSalesReportCriteriaWise.do";
		$.ajax({
			url : URL,
			data : {
				location : location,
				startDate : startDate,
				endDate : endDate,
				maxRecords : maxRecords,
				criteria : criteria,
				index : index,
				order : order,
	       		orderBy : orderBy,
	       		counterId : counterId,
	       		category : category,
	       		saveFlag:saveFlag,
	       		zone : zone,
	       		subcategory : subcategory,
	       		department : department,
	       		section: section,
	       		brand :brand,
	       		cashierId : cashierId,
	       		searchName : name,
	       		locationList : locationList,
	       		salesChannel:salesChannel,
	       		isHourWiseReport:isHourWiseReport,
	       		mytime:mytime,
	       		mytime1:mytime1,
	       		flow : flow

			},
			beforeSend: function(xhr){     
				
	        	
	   			$("#loadingreport").css("display","block");
	   			
	   			$("#mainDiv").addClass("disabled");
	   		  },
		success : function(result){
			$("#xReportsDisplay").html(result);
			 $("#startDate").val(startDate);
			 $("#endDate").val(endDate);
		
			 var anchor = document.createElement('a');
			 
				  anchor.href = $("#stockdownloadurl").val();
				  anchor.target = '_blank';
				  anchor.download = '';
				if($("#stockdownloadurl").val()!=null && $("#stockdownloadurl").val()!='')
				  anchor.click();
				$("#loading").css("display","none");
			$("#loadingreport").css("display","none");
			$("#mainDiv").removeClass('disabled');
		
		},
		error : function(){
			alert("Something went wrong");
			$("#loadingreport").css("display","none");
			$("#mainDiv").removeClass('disabled');
		}
	 });
				

}


function viewBillSummary(date,index,criteria,flag){
	debugger
	 //purpose:for checking internet conection
	var online = window.navigator.onLine;
  	if(!online)
  	{
  	alert("check your internet connection,please try agian after some time");
  	return;
  	}
	var location = $("#location").val();
	var contextPath = $('#contextPath').val();
	var ymd = date.split('-');
	var dmy = ymd[2]+"/"+ymd[1]+"/"+ymd[0];
//	var maxRecords = "10";
	var counterid = "";
	if($("#counter").length >0 && criteria !='date')
	counterid = $('#counter').val();
	
	var maxRecords = "10";
	if($('#maxRecords').length > 0)
		maxRecords = $('#maxRecords').val();
	
	var zone="";
	if($('#outletZone').length > 0)
		zone = $('#outletZone').val();
	
	var outletLocation="";
	if($('#outletLocation').length > 0)
		outletLocation= $('#outletLocation').val();
	
	
	var startDate = "";
	if($("#startDate").length > 0)
    startDate = $("#startDate").val();
	var endDate = "";
	if($("#endDate").length > 0)
	endDate = $("#endDate").val();
	
	var zone = "";
	if($("#outletZone").length > 0)
    zone =$("#outletZone").val();
	
	
	var flowLocation = $('#flowLocation').val();
	
	if(flowLocation == undefined){
		flowLocation = "";
	}
	
		var URL = contextPath + "/reports/viewBillSummary.do";
		$.ajax({
			url : URL,
			data : {
				location : location,
				date : date,
				maxRecords : maxRecords,
				index : index,
				criteria : criteria,
				counterid :counterid,
				flag : flag,
				startDate : startDate,
				endDate : endDate,
				zone :zone,
				flowLocation: flowLocation
			},
			beforeSend: function(xhr){                    
				$("#loading").css("display","block");
				$("#mainDiv").addClass("disabled");
			},
			success : function(result){
				$("#right-side").html(result);
				var anchor = document.createElement('a');
				anchor.href = $("#stockdownloadurl").val();
				anchor.target = '_blank';
				anchor.download = '';
				if($("#stockdownloadurl").val()!=null && $("#stockdownloadurl").val()!='')
					anchor.click();
				$("#loading").css("display","none");
				$("#mainDiv").removeClass('disabled');
			},
			error : function(){
				alert("Something went wrong");
				$("#loading").css("display","none");
				$("#mainDiv").removeClass('disabled');
			}
		});
}

function parseDate(str) {
    var mdy = str.split('/');
    return new Date(mdy[2], mdy[1]-1, mdy[0]);
}


function searchSuppliers(name, searchCategory){
	 //purpose:for checking internet conection
	var online = window.navigator.onLine;
  	if(!online)
  	{
  	alert("check your internet connection,please try agian after some time");
  	return;
  	}
	 var contextPath = $("#contextPath").val();
	 URL = contextPath + "/inventorymanager/searchSuppliers.do";
	 $.ajax({
			type: "GET",
			url : URL,
			data : {
				searchName : name
			},
			beforeSend: function(xhr){                    
 	   			$("#loading").css("display","block");
 	   			$("#mainDiv").addClass("disabled");
 	   		  },
			success : function(result) {
				appendSuppliers(result, searchCategory);
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

function appendSuppliers(suppliersList, searchCategory){
	 $("."+searchCategory).html('');
	 var op = '';
	 for(var i=0;i<suppliersList.length;i++){
		 if (i == 0) {
			 op += '<li id="'+suppliersList[i].firmName+'"  class="selected" onclick=getCode(this,"'+searchCategory+'"); ><a>'+suppliersList[i].firmName+'</a></li>';
		}else
			 op += '<li id="'+suppliersList[i].firmName+'" onclick=getCode(this,"'+searchCategory+'"); ><a>'+suppliersList[i].firmName+'</a></li>';
	 }
	 $("."+searchCategory).html(op);
	 $("."+searchCategory).show();
}

function getCode(element,type){
	var id= $(element).attr("id");
	$("#supplier_Id").val(id);
	var label = $(element).children("a").text();
	$("#searchSupplier").val(label);
	 $(".services").hide();
	 $("."+type).html("");
}



$("#searchSupplier").on('input',function(e){
	$("#supplierNameError").html("");
	if($("#searchSupplier").val().length<3){
		$("#supplier_Id").val("");
	}
	$(".supplier").children("li").each(function(){
		var supplierName = $(this).children("a").text().trim();
		if($("#searchSupplier").val().trim().toLowerCase() == supplierName.toLowerCase()){
			$("#searchSupplier").val($("#searchSupplier").val().trim());
			$("#supplier_Id").val($(this).attr("id"));
			 $(".services").hide();
			 $(".matchedStringUl").html("");
			return;
		}
		else{
			$("#supplier_Id").val("");
		}
	});
	if(e.keyCode == 9){
		if($("#searchSupplier").val()!="" && $("#supplier_Id").val() == ""){
			 $("#supplierNameError").html("Supplier Name doesn't exist");
		 }
		 $(".services").hide();
		 $(".matchedStringUl").html("");
	}
});


function getdatewisegraph(){
	var stocksObj = $("#stocksObj").val();
	/*stocksObj = stocksObj.replace(/ /g,'').replace('[','').replace(']','');
	stocksObj = stocksObj.split(',');*/
	var dates = [], sale = [] ,CQty = [];
	$('.date').each(function(){
			var id= $(this).attr("id").replace('businessdate','');
			dates.push($("#businessdate"+id).text());
			sale.push($("#totalsale"+id).text());
		});

	stocksObj = dates;
	//stocksObj = JSON.parse(stocksObj);
	var label = [];
	var searchCriteria = $("#searchCriteria").val();
	if(searchCriteria == "month"){
		for(var i=1;i<=stocksObj.length;i++){
			label.push('');
		}
	}
	else
		label = dates;

	var stocksLineChartData = {
			labels : label,
			datasets : [
				
				{
					/*fillColor : "#337ab7",*/
					fill: true,
					strokeColor : "#337ab7",
					pointColor : "#ccc",
					pointStrokeColor : "#fff",
					/*data : [0.65,0.59,0.90,0.81,0.56,0.55,0.40],*/
					data : sale,
		            title : "Total Sale",
		            label : "Quantity"
				}
			]

		}
	 return stocksLineChartData;
	}





function generateTaxPdf(){
	/*var specialElementHandlers = {
	    '#editor': function (element, renderer) {
	        return true;
	    }
	};
		var doc = new jsPDF();

	    doc.fromHTML($('#productstocksDiv').html(), 15, 15, {
	        'width': 170,
	            'elementHandlers': specialElementHandlers
	    });
	    doc.save('sample-file.pdf');*/
	 //purpose:for checking internet conection
	var online = window.navigator.onLine;
  	if(!online)
  	{
  	alert("check your internet connection,please try agian after some time");
  	return;
  	}
	var taxReport = $("#taxReport").val();
	var contextPath = $('#contextPath').val();
	var finalObj = {};
	finalObj.reportsList = jQuery.parseJSON(taxReport);
	 var formData = JSON.stringify(finalObj);
//	var formData = finalObj;
//	 console.log(formData);
	var URL = contextPath + "/pdf/taxReport.pdf";
	$.ajax({
		type: "POST",
		url : URL,
//		dataType: "application/json",
		contentType: "application/json",
        data : formData,
		beforeSend: function(xhr){                    
	   			$("#loading").css("display","block");
	   			$("#mainDiv").addClass("disabled");
	   		  },
		success : function(result){
			/*var blob=new Blob([result]);
            var link=document.createElement('a');
            link.href=window.URL.createObjectURL(blob);
            link.download="TaxReport_"+new Date()+".pdf";
            link.click();*/
			var urlValue1 = contextPath + '/taxReport';
			var win = window.open(urlValue1, '_blank');
			if(win){
			    //Browser has allowed it to be opened
			    win.focus();
			}else{
			    //Broswer has blocked it
			    alert('Please allow popups for this site');
			} 
//			$("#right-side").html(result);
			$("#loading").css("display","none");
			$("#mainDiv").removeClass('disabled');
		},
		error : function(){
			alert("Something went wrong");
			$("#loading").css("display","none");
			$("#mainDiv").removeClass('disabled');
		}
	 });
}



function getCurrentDateReports()
{
	var d = new Date();

	var month = d.getMonth()+1;
	var day = d.getDate();

	var output = d.getFullYear() + '/' +
	    (month<10 ? '0' : '') + month + '/' +
	    (day<10 ? '0' : '') + day;
	var output =(day<10 ? '0' : '') + day + '/' +
    (month<10 ? '0' : '') + month + '/' + d.getFullYear()  ;
	
	return output;


}

function ChangeDenominations(count){
	debugger;
	
	var count=parseInt(count);
	var changeAmt=parseInt($("#denominationVal"+count).text())*parseInt($("#denominationCount"+count).val());
	$("#denominationAmt"+count).text("");
	$("#denominationAmt"+count).text(changeAmt);
	/* var len = parseInt($("#CashHandoverdenominations tr").length);
		if (len != 1)
			len = parseInt($("#CashHandoverdenominations tr:last").attr("id").replace(
					'dynamicdiv', '')) + 1;*/
		
	var Total=0;
		
		$('.slno').each(function() {
			var Len=parseInt($(this).text());
			Total=Total+parseFloat($("#denominationAmt"+Len).text());
		});
		$("#TotalCashDeclaredId").text("");
		$("#TotalCashDeclaredId").text(Total);
}


function UpdateDenominations(){
	debugger;
	finalObj={};
	cashHandOverDenominations=[];
	$("#SuccessDetail").text("");
	$("#FailedDetail").text("");
	$('.slno').each(function() {
		var Len=parseInt($(this).text());
		
		cashHandOverDenominations.push({
			"reportId":$("#denominationId"+Len).val(),
			"cashDenomination":parseInt($("#denominationVal"+Len).text()),
			"denominationCount":parseInt($("#denominationCount"+Len).val()),
			"paidAmount":parseFloat($("#denominationAmt"+Len).text()),
			"reportDateStr":$("#denominationDate"+Len).val(),	
			"sno":parseInt($("#denominationSeriolNo"+Len).val()),
		});
	});
	finalObj.reportId=cashHandOverDenominations[0].reportId;
	finalObj.cashHandOverDenominations=cashHandOverDenominations;
	var formData = JSON.stringify(finalObj);
	 $('#DenominationsModelID').modal('hide');
	 var contextPath = $("#contextPath").val();
	 URL = contextPath + "/reports/updateCashDenominations.do";
	$.ajax({
		type: "POST",
		url : URL,
		contentType: "application/json",
        data : formData,
		beforeSend: function(xhr){                    
	   			$("#loading").css("display","block");
	   			$("#mainDiv").addClass("disabled");
	   		  },
		success : function(result){
				debugger;
			messageStatus= JSON.stringify(result);
			var parsed_json = JSON.parse(messageStatus);
			var code = parsed_json.code;
			
			//alert(parsed_json.code)
			if(code != 0)
				{
				$("#FailedDetail").text("Failed To Update Denominations.");
				}
			else
				{
				$("#SuccessDetail").text("Denominations Updated Successfully.");
				}
			
			$("#loading").css("display","none");
			$("#mainDiv").removeClass('disabled');
		},
		error : function(){
			alert("Something went wrong");
			$("#loading").css("display","none");
			$("#mainDiv").removeClass('disabled');
		}
	 });
}
