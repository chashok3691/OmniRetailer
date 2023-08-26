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
	
	

});
var re = /^[0-9/]+$/;
function changeInfoBasedOnLocation(location){
	//alert("Location>>>"+location);
	getCountersByLocation(location);
	getShiftsByLocation(location);
}

function changeImage(){
	
}

function getCountersByLocation(location){
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
	  
	  function getShiftsByLocation(location){
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
	var location = $("#location").val();
	var counter = $("#counter").val();
	var shiftId = $("#shiftId").val();
	var contextPath = $('#contextPath').val();
	var date = $("#date").val();
	if (searchCategory == "save")
		var saveFlag = true;
	else
		var saveFlag =false;

	
	
	 $('#myModalIos').modal('hide');
	

	
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
				saveFlag:saveFlag
			},
			beforeSend: function(xhr){                    
		   			$("#loading").css("display","block");
		   			$("#mainDiv").addClass("disabled");
		   		  },
			success : function(result){
				$("#xReportsDisplay").html(result);
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
	if(reportType=="Z"||reportType=="z"){
		if(counter==""||counter==null){
			$("#counterError").html("Counter is required for generating report");
			return;
		}if(date==""){
			$("#dateError").html("Date is required for generating report");
			return;
		}
		date = date+" 00:00:00";
		var endDate = $("#endDate").val();
		var URL = contextPath + "/reports/generateOutletZReport.do";
		$.ajax({
			url : URL,
			data : {
				location : location,
				counter : counter,
				date : date,
				endDate : endDate,
				saveFlag:saveFlag
			},
			beforeSend: function(xhr){                    
		   			$("#loading").css("display","block");
		   			$("#mainDiv").addClass("disabled");
		   		  },
			success : function(result){
				$("#zReportsDisplay").html(result);
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
	




function generateDueCollectionReport(criteria,searchCategory,index){
	var order = null;
 	var orderBy = null;
	var location = null;
	if($("#location").length > 0)
		location = $("#location").val();
	var contextPath = $('#contextPath').val();
	var startDate = $("#startDate").val();
	var endDate = $("#endDate").val();
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
	       		saveFlag:saveFlag
			},
			beforeSend: function(xhr){                    
		   			$("#loading").css("display","block");
		   			$("#mainDiv").addClass("disabled");
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
function generateSalesReportCriteriaWise(criteria,searchCategory,index){
	var order = null;
 	var orderBy = null;
	var location = null;
	
	if (searchCategory == "save")
		var saveFlag = true;
	else
		var saveFlag =false;
	
	 $('#myModalIos').modal('hide');
	
	
	
	if($("#location").length > 0)
		location = $("#location").val();
	var contextPath = $('#contextPath').val();
	var startDate = $("#startDate").val();
	var endDate = $("#endDate").val();
	var maxRecords = 10;
	var counterId = null;
	if($("#counterId").length > 0)
		counterId = $("#counterId").val();
	var category = null;
	if($("#productCategory").length > 0)
		category = $("#productCategory").val();
	if($("#maxRecords").length > 0)
		maxRecords = $("#maxRecords").val();
	if($("#supplier_Id").length > 0)
		category = $("#supplier_Id").val();
	if(endDate !="" && startDate == ""){
		$("#startDateError").html("Date is required for generating report");
		return;
	}
	/*	if(startDate==""){
			$("#startDateError").html("Date is required for generating report");
			return;
		}
		if(endDate==""){
			$("#endDateError").html("Date is required for generating report");
			return;
		}*/
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
	       		saveFlag:saveFlag
			},
			beforeSend: function(xhr){                    
		   			$("#loading").css("display","block");
		   			$("#mainDiv").addClass("disabled");
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

function viewBillSummary(date,index,criteria){
	var location = $("#location").val();
	var contextPath = $('#contextPath').val();
	var ymd = date.split('-');
	var dmy = ymd[2]+"/"+ymd[1]+"/"+ymd[0];
	var maxRecords = 10;
	var counterid = "";
	if($("#counterId").length >0)
	counterid = $('#counterId').val();
	if($("#billMaxRecords").length > 0)
		maxRecords = $("#billMaxRecords").val();
		var URL = contextPath + "/reports/viewBillSummary.do";
		$.ajax({
			url : URL,
			data : {
				location : location,
				date : date,
				maxRecords : maxRecords,
				index : index,
				criteria : criteria,
				counterid :counterid
			},
			beforeSend: function(xhr){                    
		   			$("#loading").css("display","block");
		   			$("#mainDiv").addClass("disabled");
		   		  },
			success : function(result){
				$("#right-side").html(result);
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
			 op += '<li id="'+suppliersList[i].supplierCode+'"  class="selected" onclick=getCode(this,"'+searchCategory+'"); ><a>'+suppliersList[i].firmName+'</a></li>';
		}else
			 op += '<li id="'+suppliersList[i].supplierCode+'" onclick=getCode(this,"'+searchCategory+'"); ><a>'+suppliersList[i].firmName+'</a></li>';
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
