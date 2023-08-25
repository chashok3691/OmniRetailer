function updateMcnDetails(){
	
	var WarehouseReport = {};
	var noOfDays = daydiff(parseDate($('#billDate').val()), parseDate($('#expiryDate').val()));
	if(noOfDays < 0){
		$("#Error").html("");
		$("#Error").html("Expiry Date can't be less than Bill Date");
		return;
	}
	var maxRecords = 10;
	  if($("#maxRecords").length > 0)
		  maxRecords = $("#maxRecords").val();
    WarehouseReport.maxRecords=maxRecords;
	WarehouseReport.statusFlag=$("#statusFlag").val();
	WarehouseReport.expiryDate=$("#expiryDate").val();
	WarehouseReport.creditNoteReason=$("#comments").val();
	WarehouseReport.creditNoteRef=$("#location").val();
	//var creditNoteRef=$("#creditNoteRef").val();
	var formdata = JSON.stringify(WarehouseReport);
	var contextPath = $("#contextPath").val();
	
	URL = contextPath + "/reports/updateMcnDetails.do";
	
	$.ajax({
		type: "POST",
		url : URL,
		contentType: "application/json",
		data :formdata, 
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