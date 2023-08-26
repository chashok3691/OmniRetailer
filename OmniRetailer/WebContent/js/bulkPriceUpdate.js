/**
 * 
 */
var productFiles;
function uploadPriceExcelData(){
	try{
		var oMyForm = new FormData();
		if(productFiles.length <= 0)
		{
			alert("Please Select Excel Sheet... ");
			return;
		}
debugger
		var maxRecords = 10;

		if($("#maxRecords").length>0)
			maxRecords = $("#maxRecords").val();
		var   name=""
			if($("#searchBulkPriceUpdate").length>0)
				name = $("#searchBulkPriceUpdate").val().trim();
		
		oMyForm.append("file", productFiles[0]);
		var contextPath = $("#contextPath").val();
		URL = contextPath + "/outletMaster/uploadPriceExcelData.do";
		$.ajax({

			url : URL,
			data : oMyForm,
			type : "POST",
			enctype: 'multipart/form-data',
			processData: false, 
			contentType:false,
			dataType: 'html',
			beforeSend: function(xhr){                    
				$("#loading").css("display","block");
				$("#mainDiv").addClass("disabled");
			},
			success : function(result){
				$('#right-side').html(result);
				$("#maxRecords").val(maxRecords);
				$("#searchBulkPriceUpdate").val(name);
				//if(id != undefined && id != "")
				activeMenu("BulkPriceUpdate");
				$("#loading").css("display","none");
				$("#mainDiv").removeClass('disabled');
			},
			error : function(jqXHR, textStatus, errorThrown) {

				$("#loading").css("display","none");
				$("#mainDiv").removeClass('disabled');
				$("#maxRecords").val(maxRecords);
				$("#searchBulkPriceUpdate").val(name);
			}
		});
	}
	catch(e)
	{
//		console.log(e);
	}
}


productFiles = [];
function addFileToArray(id){
	debugger
	   var ext = $("#"+id)[0].files[0]['name'].split('.').pop().toLowerCase();
	    
	    	productFiles=event.target.files;
	   
	   
}

function addNameToTextBox(id){
	debugger
	addFileToArray(id);
	if($("#"+id)[0].files[0] != undefined){
		$("#filePath").val($("#"+id)[0].files[0]['name']);
	
	
	}
	
	else
		$("#"+id+"File").val("");
}



function viewBulkPriceDetails(date)
{	
	debugger
	var contextPath = $("#contextPath").val();
	URL = contextPath + "/outletMaster/viewPriceUploadData.do";
	$.ajax({

		url : URL,
		data : oMyForm,
		type : "POST",
		enctype: 'multipart/form-data',
		processData: false, 
		contentType:false,
		dataType: 'html',
		beforeSend: function(xhr){                    
			$("#loading").css("display","block");
			$("#mainDiv").addClass("disabled");
		},
		success : function(result){
			$('#right-side').html(result);
			$("#maxRecords").val(maxRecords);
			$("#searchBulkPriceUpdate").val(name);
			//if(id != undefined && id != "")
			activeMenu("BulkPriceUpdate");
			$("#loading").css("display","none");
			$("#mainDiv").removeClass('disabled');
		},
		error : function(jqXHR, textStatus, errorThrown) {

			$("#loading").css("display","none");
			$("#mainDiv").removeClass('disabled');
			$("#maxRecords").val(maxRecords);
			$("#searchBulkPriceUpdate").val(name);
		}
	});
	

}