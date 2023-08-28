//var properFormat = true;
var noOfFiles = 0;
//var savedFiles = 0;
var productFiles;
var skuFiles;
var warehouseskuFiles;
var skuRequestFiles;
var priceListFiles;
var suppliersFiles;
var taxMasterImportFiles;
var importbrandMasterFiles;
var loaltyCardsFiles;
var giftVouchersFiles;
var couponsFiles;
var customerImportFiles;
var importgroupMasterFiles;


$("body").on("change", function () {
	//;
	noOfFiles =10;
	$("input:file").each(function(e){
		noOfFiles = noOfFiles + $(this)[0].files.length;
	});
	if(noOfFiles == 1)
		$("#Error").html('');
});



/*$('input[type=file]').change(function () {
    var id = $(this).attr("id");
    var ext = $("#"+id)[0].files[0]['name'].split('.').pop().toLowerCase();
    if ($.inArray(ext, ['xls', 'xlsx', 'csv']) == -1) {
        alert('Select files of type .xls or.xlsx or .csv');
        var replaceFileName = id.replace('Btn','');
        replaceWithNewFileType(replaceFileName);
        $("#"+replaceFileName+"File").val("");
        $("#"+replaceFileName+"Btn").removeAttr("disabled");
        return;
    }
    if (id == "productMasterBtn"){
    	productFiles = [];
    	productFiles=event.target.files;
    	alert("hi");
    }
    else if (id == "skuMasterBtn"){
    	skuFiles = [];
    	skuFiles=event.target.files;
    	
    }
    else if(id == "stockReceiptBtn"){
    	skuRequestFiles = [];
    	skuRequestFiles = event.target.files;
    }
    else if(id == "priceListBtn"){
    	priceListFiles = [];
    	priceListFiles = event.target.files;
    }
    });*/

function addFileToArray(id){
//	 var id = $(this).attr("id");
	debugger;
	var id = id+"Btn";
	
	   var ext = $("#"+id)[0].files[0]['name'].split('.').pop().toLowerCase();
	    /*if ($.inArray(ext, ['xls', 'xlsx', 'csv']) == -1) {
	        alert('Select files of type .xls or.xlsx or .csv');
	        var replaceFileName = id.replace('Btn','');
	        replaceWithNewFileType(replaceFileName);
	        $("#"+replaceFileName+"File").val("");
	        $("#"+replaceFileName+"Btn").removeAttr("disabled");
	        return;
	    }*/
	    if (id == "productMasterBtn"){
	    	productFiles = [];
	    	productFiles=event.target.files;
	    }
	    else if (id == "skuMasterBtn"){
	    	skuFiles = [];
	    	skuFiles=event.target.files;
	    }
	    else if (id == "billsBtn"){
	    	billsFiles = [];
	    	billsFiles=event.target.files;
	    	
	    }
	    else if (id == "warehouseskuMasterBtn"){
	    
	    	warehouseskuFiles = [];
	    	warehouseskuFiles=event.target.files;
	    	
	    }
	    else if(id == "stockReceiptBtn"){
	    	skuRequestFiles = [];
	    	skuRequestFiles = event.target.files;
	    }
	    else if(id == "goodsReceiptsBtn"){
	    	skuRequestFiles = [];
	    	skuRequestFiles = event.target.files;
	    }
	    else if(id == "priceListBtn"){
	    	priceListFiles = [];
	    	priceListFiles = event.target.files;
	    }
	    else if(id == "skuEansBtn"){
	    	skuEansFiles = [];
	    	skuEansFiles = event.target.files;
	    }
	    else if(id == "suppliersBtn"){
	    	suppliersFiles = [];
	    	suppliersFiles = event.target.files;
	    }
	    else if(id == "taxMasterImportBtn"){
	    	taxMasterImportFiles = [];
	    	taxMasterImportFiles = event.target.files;
	    }
	    else if(id == "importbrandMasterBtn"){
	    	importbrandMasterFiles = [];
	    	importbrandMasterFiles = event.target.files;
	    }
	    else if(id == "employeeMasterImportBtn"){
	    	importemployeeMasterFiles = [];
	    	importemployeeMasterFiles = event.target.files;
	    }
	    else if(id == "groupMasterBtn"){
	    	importgroupMasterFiles = [];
	    	importgroupMasterFiles = event.target.files;
	    }
	    
	    else if(id == "customerImportBtn"){
	    	 customerImportFiles = [];
	    	customerImportFiles = event.target.files;
	    }
	    else if(id == "couponsBtn"){
	    	couponsFiles = [];
	    	couponsFiles = event.target.files;
	    }
	    
	    else if(id == "giftVouchersBtn"){
	    	giftVouchersFiles = [];
	    	giftVouchersFiles = event.target.files;
	    }
	    else if(id == "loaltyCardsBtn"){
	    	loaltyCardsFiles = [];
	    	loaltyCardsFiles = event.target.files;
	    }
	    
	   
}

function addNameToTextBox(id){
	debugger;
	addFileToArray(id);
	if($("#"+id+"Btn")[0].files[0] != undefined)
		$("#"+id+"File").val($("#"+id+"Btn")[0].files[0]['name']);
	else
		$("#"+id+"File").val("");
}

function enableFileBrowse(ele,id){
	debugger;
//	$("#Error").html('');
	 var contextPath = $("#contextPath").val();
	if (ele != '')
	   id = $(ele).attr("id");
	
	if($("#"+id).prop('checked')){
		$("#"+id+"Btn").closest('div').removeClass('btn-primar');
		$("#"+id+"Btn").closest('div').addClass('btn-primary');
		$("#"+id+"Btn").removeAttr("disabled");
		$("#"+id+"FileType").removeAttr("disabled");
		//$("#"+id+"File").val("");
	}
	else{
		replaceWithNewFileType(id);
		$("#"+id+"Btn").closest('div').removeClass('btn-primary');
		$("#"+id+"Btn").closest('div').addClass('btn-primar');
		$("#"+id+"Btn").attr("disabled","disabled");
		$("#"+id+"FileType").prop('disabled', "disabled");
	}
	$("#"+id+"Img").closest('span').css("visibility","hidden");
	$("#"+id+"Img").attr("src",contextPath+"/images/circleWait.gif");
	$("#"+id+"File").val("");
}

/*$(document).on("change","#productMasterBtn",function(event){
	 var ext = $("#productMasterBtn")[0].files[0]['name'].split('.').pop().toLowerCase();
     if ($.inArray(ext, ['xls', 'xlsx', 'csv']) == -1) {
         alert('Select files of type .xls or.xlsx or .csv');
         replaceWithNewFileType('productMaster');
         $("#productMasterFile").val("");
         $("#productMasterBtn").removeAttr("disabled");
         return;
     }
	productFiles=event.target.files;
 });*/

function importProductData(){
	var oMyForm = new FormData();
//	for(var i = 0; i<productFiles.length; i++)
//		alert(productFiles[i].size);
    oMyForm.append("file", productFiles[0]);
    var contextPath = $("#contextPath").val();
	 URL = contextPath + "/dataManagement/importProductData.do";
	 $.ajax({
		  dataType : 'json',
          url : URL,
          data : oMyForm,
          type : "POST",
          enctype: 'multipart/form-data',
          processData: false, 
          contentType:false,
          beforeSend: function(xhr){
  	   		$("#productMasterImg").closest('span').css("visibility","visible");
  	   	},
          success : function(result) {
        	  messageStatus= JSON.stringify(result);
				var parsed_json = JSON.parse(messageStatus);
				var error = parsed_json.err;
				replaceWithNewFileType('productMaster');
				$("#productMasterFile").val("");
				$("#productMaster").prop('checked',false);
				enableFileBrowse('','productMaster');
				if(error != undefined && error !=""){
					$("#productMasterImg").attr("src",contextPath+"/images/error.jpg");
					 $("#Error").html("Data is not in required format. Please download corresponding format and check");
				}
				var msg = parsed_json.msg;
				if(msg != undefined && msg !="")
					$("#productMasterImg").attr("src",contextPath+"/images/tickMark.png");
				$("#productMasterImg").closest('span').css("visibility","visible");
  		},
  		error : function(){
  			replaceWithNewFileType('productMaster');
  			$("#productMasterFile").val("");
  			$("#productMaster").prop('checked',false);
  			enableFileBrowse('','productMaster');
 			$("#productMasterImg").attr("src",contextPath+"/images/error.jpg");
 			$("#productMasterImg").closest('span').css("visibility","visible");
 			//savedFiles = savedFiles + 1;
 		}
 	 });
 }



/*$(document).on("change","#skuMasterBtn",function(event){
	 var ext = $("#skuMasterBtn")[0].files[0]['name'].split('.').pop().toLowerCase();
     if ($.inArray(ext, ['xls', 'xlsx', 'csv']) == -1) {
         alert('Select files of type .xls or.xlsx or .csv');
         replaceWithNewFileType('skuMaster');
         $("#skuMasterFile").val("");
         $("#skuMasterBtn").removeAttr("disabled");
         return;
     }
	skuFiles = event.target.files;
});*/

/*$(document).on("change","#productMasterBtn",function(event){
	 var ext = $("#productMasterBtn")[0].files[0]['name'].split('.').pop().toLowerCase();
    if ($.inArray(ext, ['xls', 'xlsx', 'csv']) == -1) {
        alert('Select files of type .xls or.xlsx or .csv');
        replaceWithNewFileType('productMaster');
        $("#productMasterFile").val("");
        $("#productMasterBtn").removeAttr("disabled");
        return;
    }
	productFiles=event.target.files;
});*/

var errorUrl = "";
function importSkuData(){
	//;
	debugger;
	if($("#skuMasterFileType").val()==""){
		$("#Error").html('Choose File Type');
		return;
	}
	if($("#skuMasterFileType").val() == "1" && $("#skuMasterFile").val().toLowerCase().indexOf('.dwn') == -1){
		$("#Error").html('Not a JDA File');
		return;
	}
	if($("#skuMasterFileType").val() == "0" && $("#skuMasterFile").val().toLowerCase().indexOf('.xlsx') == -1){
		$("#Error").html('Not a XLSX File');
		return;
	}
	var oMyForm = new FormData();
    oMyForm.append("file", skuFiles[0]);
    var contextPath = $("#contextPath").val();
    URL = contextPath + "/dataManagement/importSkuData.do";	
	 $.ajax({
		  dataType : 'json',
          url : URL,
          data : oMyForm,
          type : "POST",
          enctype: 'multipart/form-data',
          processData: false, 
          contentType:false,
          beforeSend: function(xhr){                    
        	  $("#skuMasterImg").closest('span').css("visibility","visible");
  	   	},
          success : function(result) {
        	  //;
        	  messageStatus= JSON.stringify(result);
				var parsed_json = JSON.parse(messageStatus);
				
				var error = parsed_json.err;
				replaceWithNewFileType('skuMaster');
				$("#skuMasterFile").val("");
				$("#skuMaster").prop('checked',false);
				enableFileBrowse('','skuMaster');
				if(error != undefined && error !=""){
					$("#skuMasterImg").attr("src",contextPath+"/images/error.jpg");
					 $("#Error").html(error+".");
				}
				
				errorUrl = parsed_json.errorUrl;
				
				if(errorUrl != undefined && errorUrl !="" &&  errorUrl != null && errorUrl != "null")
				{
					$("#errorUrl").attr("href", errorUrl); 
					$("#url").css("display","block");

				}
				
				var msg = parsed_json.msg;
				if(msg != undefined && msg !="")
					{
					$("#skuMasterImg").attr("src",contextPath+"/images/tickMark.png");
					}$("#skuMasterImg").closest('span').css("visibility","visible");
  		},
  		error : function(e){
  			messageStatus= JSON.stringify(e.responseText);
  			var parsed_json = JSON.parse(messageStatus);
  			var error = parsed_json.err;
  			replaceWithNewFileType('skuMaster');
  			$("#skuMasterFile").val("");
  			$("#skuMaster").prop('checked',false);
  			enableFileBrowse('','skuMaster');
  			if(error != undefined && error !=""){
  				$("#skuMasterImg").attr("src",contextPath+"/images/error.jpg");
  				$("#Error").html(error+".");
  			}

  			var errorUrl = parsed_json.errorUrl;
  			if(errorUrl != undefined && errorUrl !="")
  			{
  				$("#errorUrl").attr("href", errorUrl); 
  				$("#url").css("display","block");

  			}

  			var msg = parsed_json.msg;
  			if(msg != undefined && msg !="")
  			{
  				$("#skuMasterImg").attr("src",contextPath+"/images/tickMark.png");
  			}$("#skuMasterImg").closest('span').css("visibility","visible");
  		}
 	 });
 }


function downloadErrorLog()
{
	$('a#errorUrl').attr({target: '_blank',  href  : errorUrl});
}


function importWarehouseSkuData(){
	debugger
	if($("#warehouseskuMasterFileType").val()==""){
		$("#Error").html('Choose File Type');
		return;
	}
	if($("#warehouseskuMasterFileType").val() == "1" && $("#warehouseskuMasterFile").val().toLowerCase().indexOf('.dwn') == -1){
		$("#Error").html('Not a JDA File');
		return;
	}

	if($("#warehouseskuMasterFileType").val() == "0" && $("#warehouseskuMasterFile").val().toLowerCase().indexOf('.xlsx') == -1){
		$("#Error").html('Not a XLSX File');
		return;
	}
	var oMyForm = new FormData();
    oMyForm.append("file", warehouseskuFiles[0]);
    console.log(oMyForm);
    var contextPath = $("#contextPath").val();
    URL = contextPath + "/dataManagement/importWarehouseSkuData.do";	
	 $.ajax({
		  dataType : 'json',
          url : URL,
          data : oMyForm,
          type : "POST",
          enctype: 'multipart/form-data',
          processData: false, 
          contentType:false,
          beforeSend: function(xhr){                    
        	  $("#warehouseskuMasterImg").closest('span').css("visibility","visible");
  	   	},
          success : function(result) {
        	  messageStatus= JSON.stringify(result);
				var parsed_json = JSON.parse(messageStatus);
				var error = parsed_json.err;
				replaceWithNewFileType('WarehouseskuMaster');
				$("#warehouseskuMasterFile").val("");
				$("#warehouseskuMaster").prop('checked',false);
				enableFileBrowse('','warehouseskuMaster');
				if(error != undefined && error !=""){
					$("#warehouseskuMasterImg").attr("src",contextPath+"/images/error.jpg");
					 $("#Error").html(error);
				}
				/*var errorURL = parsed_json.errorUrl;
	  			if(errorURL != undefined && errorURL !="")
	  			{
	  				$("#errorUrl").attr("href", errorURL); 
	  				$("#url").css("display","block");

	  			}*/
	  			debugger;
	  			var errorUrl = parsed_json.errorUrl;
	  			if(errorUrl != undefined && errorUrl !="")
	  			{
	  				$("#errorUrl").attr("href", errorUrl); 
	  				$("#url").css("display","block");
	  			}
				
				var msg = parsed_json.msg;
				if(msg != undefined && msg !="")
					$("#warehouseskuMasterImg").attr("src",contextPath+"/images/tickMark.png");
				$("#warehouseskuMasterImg").closest('span').css("visibility","visible");
  		},
  		error : function(){
  			replaceWithNewFileType('warehouseskuMaster');
  			$("#warehouseskuMasterFile").val("");
  			$("#warehouseskuMaster").prop('checked',false);
  			enableFileBrowse('','warehouseskuMaster');
 			$("#warehouseskuMasterImg").attr("src",contextPath+"/images/error.jpg");
 			$("#warehouseskuMasterImg").closest('span').css("visibility","visible");
 		}
 	 });
 }


function importtaxMasterData(){
	debugger
	if($("#taxMasterImportFileType").val()==""){
		$("#Error").html('Choose File Type');
		return;
	}
	if($("#taxMasterImportFileType").val() == "1" && $("#taxMasterImportFileType").val().toLowerCase().indexOf('.dwn') == -1){
		$("#Error").html('Not a JDA File');
		return;
	}
	/*if($("#suppliersFileType").val() == "0"){
		$("#Error").html('Not a XLSX File');
		return;
	}*/
	var oMyForm = new FormData();
    oMyForm.append("file", taxMasterImportFiles[0]);
    console.log(oMyForm);
    var contextPath = $("#contextPath").val();
    URL = contextPath + "/dataManagement/importtaxMasterData.do";	
	 $.ajax({
		  dataType : 'json',
          url : URL,
          data : oMyForm,
          type : "POST",
          enctype: 'multipart/form-data',
          processData: false, 
          contentType:false,
          beforeSend: function(xhr){                    
        	  $("#taxMasterImportImg").closest('span').css("visibility","visible");
  	   	},
  	   	
          success : function(result) {
        	  debugger
        	  messageStatus= JSON.stringify(result);
				var parsed_json = JSON.parse(messageStatus);
				var error = parsed_json.err;
				var url =parsed_json.errorUrl;
				replaceWithNewFileType('taxMasterImport');
				$("#taxMasterImportFile").val("");
				$("#taxMasterImport").prop('checked',false);
				enableFileBrowse('','taxMasterImport');
				if(error != undefined && error !=""){
					 $("#taxMasterImportImg").attr("src",contextPath+"/images/error.jpg");
					 $("#Error").html(error);
					 if(url != undefined && url !=""){
						 $("#url").css("display","block");
						 $("#errorUrl").attr("href" ,url)
					 }
				}
				debugger;
	  			var errorUrl = parsed_json.errorUrl;
	  			if(errorUrl != undefined && errorUrl !="")
	  			{
	  				$("#errorUrl").attr("href", errorUrl); 
	  				$("#url").css("display","block");
	  			}
				
				var msg = parsed_json.msg;
				if(msg != undefined && msg !="")
					$("#taxMasterImportImg").attr("src",contextPath+"/images/tickMark.png");
				$("#taxMasterImportImg").closest('span').css("visibility","visible");
  		},
  		
  		error : function(){
  			debugger
  			replaceWithNewFileType('taxMasterImportFileType');
  			$("#skuMasterFile").val("");
  			$("#taxMasterImport").prop('checked',false);
  			enableFileBrowse('','taxMasterImport');
 			$("#taxMasterImportImg").attr("src",contextPath+"/images/error.jpg");
 			$("#taxMasterImportFileTypeImg").closest('span').css("visibility","visible");
 		}
 	 });
 }









function importsupplerData(){
	if($("#suppliersFileType").val()==""){
		$("#Error").html('Choose File Type');
		return;
	}
	if($("#suppliersFileType").val() == "1" && $("#suppliersFileType").val().toLowerCase().indexOf('.dwn') == -1){
		$("#Error").html('Not a JDA File');
		return;
	}
	/*if($("#suppliersFileType").val() == "0"){
		$("#Error").html('Not a XLSX File');
		return;
	}*/
	debugger;
	var oMyForm = new FormData();
    oMyForm.append("file", suppliersFiles[0]);
    var contextPath = $("#contextPath").val();
    URL = contextPath + "/dataManagement/importsuppliersData.do";	
	 $.ajax({
		  dataType : 'json',
          url : URL,
          data : oMyForm,
          type : "POST",
          enctype: 'multipart/form-data',
          processData: false, 
          contentType:false,
          beforeSend: function(xhr){                    
        	  $("#suppliersImg").closest('span').css("visibility","visible");
  	   	},
          success : function(result) {
        	  debugger
        	  messageStatus= JSON.stringify(result);
				var parsed_json = JSON.parse(messageStatus);
				var error = parsed_json.err;
				var url=parsed_json.errorUrl;
				replaceWithNewFileType('suppliers');
				$("#suppliersFile").val("");
				$("#suppliers").prop('checked',false);
				enableFileBrowse('','suppliers');
				if(error != undefined && error !=""){
					 $("#suppliersImg").attr("src",contextPath+"/images/error.jpg");
					 $("#Error").html(error);
					 if(url != undefined && url !=""){
						 $("#url").css("display","block");
						 $("#errorUrl").attr("href" ,url)
					 }
				}
				var msg = parsed_json.msg;
				if(msg != undefined && msg !="")
					$("#suppliersImg").attr("src",contextPath+"/images/tickMark.png");
				$("#suppliersImg").closest('span').css("visibility","visible");
  		},
  		error : function(){
  			replaceWithNewFileType('suppliersFileType');
  			$("#skuMasterFile").val("");
  			$("#suppliers").prop('checked',false);
  			enableFileBrowse('','suppliers');
 			$("#suppliersImg").attr("src",contextPath+"/images/error.jpg");
 			$("#suppliersFileTypeImg").closest('span').css("visibility","visible");
 		}
 	 });
 }


function importbrandMasterData(){
	debugger
	if($("#importbrandMasterFileType").val()==""){
		$("#Error").html('Choose File Type');
		return;
	}
	if($("#importbrandMasterFileType").val() == "1" && $("#importbrandMasterFileType").val().toLowerCase().indexOf('.dwn') == -1){
		$("#Error").html('Not a JDA File');
		return;
	}
	/*if($("#suppliersFileType").val() == "0"){
		$("#Error").html('Not a XLSX File');
		return;
	}*/
	var oMyForm = new FormData();
    oMyForm.append("file", importbrandMasterFiles[0]);
    var contextPath = $("#contextPath").val();
    URL = contextPath + "/dataManagement/importbrandMasterData.do";	
	 $.ajax({
		  dataType : 'json',
          url : URL,
          data : oMyForm,
          type : "POST",
          enctype: 'multipart/form-data',
          processData: false, 
          contentType:false,
          beforeSend: function(xhr){                    
        	  $("#importbrandMasterImg").closest('span').css("visibility","visible");
  	   	},
          success : function(result) {
        	  messageStatus= JSON.stringify(result);
				var parsed_json = JSON.parse(messageStatus);
				var error = parsed_json.err;
				var url = parsed_json.errorUrl;
				replaceWithNewFileType('importbrandMaster');
				$("#importbrandMasterFile").val("");
				$("#importbrandMaster").prop('checked',false);
				enableFileBrowse('','importbrandMaster');
				if(error != undefined && error !=""){
					 $("#importbrandMasterImg").attr("src",contextPath+"/images/error.jpg");
					 $("#Error").html(error);
					 if(url != undefined && url !=""){
						 $("#url").css("display","block");
						 $("#errorUrl").attr("href" ,url);
					 }
				}
				var msg = parsed_json.msg;
				if(msg != undefined && msg !="")
					$("#importbrandMasterImg").attr("src",contextPath+"/images/tickMark.png");
				$("#importbrandMasterImg").closest('span').css("visibility","visible");
  		},
  		error : function(){
  			replaceWithNewFileType('importbrandMasterFileType');
  			$("#skuMasterFile").val("");
  			$("#importbrandMaster").prop('checked',false);
  			enableFileBrowse('','importbrandMaster');
 			$("#importbrandMasterImg").attr("src",contextPath+"/images/error.jpg");
 			$("#importbrandMasterFileTypeImg").closest('span').css("visibility","visible");
 		}
 	 });
 }

function importemployeeMasterData(){
	if($("#employeeMasterImportFileType").val()==""){
		$("#Error").html('Choose File Type');
		return;
	}
	if($("#employeeMasterImportFileType").val() == "1" && $("#employeeMasterImportFileType").val().toLowerCase().indexOf('.dwn') == -1){
		$("#Error").html('Not a JDA File');
		return;
	}
	/*if($("#suppliersFileType").val() == "0"){
		$("#Error").html('Not a XLSX File');
		return;
	}*/
	var oMyForm = new FormData();
    oMyForm.append("file", importemployeeMasterFiles[0]);
    var contextPath = $("#contextPath").val();
    URL = contextPath + "/dataManagement/importemployeeMasterData.do";	
	 $.ajax({
		  dataType : 'json',
          url : URL,
          data : oMyForm,
          type : "POST",
          enctype: 'multipart/form-data',
          processData: false, 
          contentType:false,
          beforeSend: function(xhr){                    
        	  $("#employeeMasterImportImg").closest('span').css("visibility","visible");
  	   	},
          success : function(result) {
        	  messageStatus= JSON.stringify(result);
				var parsed_json = JSON.parse(messageStatus);
				var error = parsed_json.err;
				var url=parsed_json.errorUrl;
				replaceWithNewFileType('employeeMasterImport');
				$("#employeeMasterImportFile").val("");
				$("#employeeMasterImport").prop('checked',false);
				enableFileBrowse('','employeeMasterImport');
				if(error != undefined && error !=""){
					$("#employeeMasterImportImg").attr("src",contextPath+"/images/error.jpg");
					 $("#Error").html(error)
					 $("#Error").focus();
					 if(url != undefined && url !=""){
						 $("#url").css("display","block");
						 $("#errorUrl").attr("href" ,url)
					 }
				}
				var msg = parsed_json.msg;
				if(msg != undefined && msg !="")
					$("#employeeMasterImportImg").attr("src",contextPath+"/images/tickMark.png");
				$("#employeeMasterImportImg").closest('span').css("visibility","visible");
  		},
  		error : function(){
  			replaceWithNewFileType('employeeMasterImportFileType');
  			$("#skuMasterFile").val("");
  			$("#employeeMasterImport").prop('checked',false);
  			enableFileBrowse('','employeeMasterImport');
 			$("#employeeMasterImportImg").attr("src",contextPath+"/images/error.jpg");
 			$("#employeeMasterImportFileTypeImg").closest('span').css("visibility","visible");
 		}
 	 });
 }

function importgroupMasterData(id){
	debugger;
//;
	
	if(id== undefined){
		id="";
	}
	if(id="outlet"){
	if($("#groupMasterImportFileType").val()==""){
		$("#Error").html('Choose File Type');
		return;
	}
	if($("#groupMasterImportFileType").val() == "1" && $("#groupMasterImportFileType").val().toLowerCase().indexOf('.dwn') == -1){
		$("#Error").html('Not a JDA File');
		return;
	}
	}else{
		
		if($("#WhgroupMasterImportFileType").val()==""){
			$("#Error").html('Choose File Type');
			return;
		}
		if($("#WhgroupMasterImportFileType").val() == "1" && $("#groupMasterImportFileType").val().toLowerCase().indexOf('.dwn') == -1){
			$("#Error").html('Not a JDA File');
			return;
		}
	}
	/*if($("#suppliersFileType").val() == "0"){
		$("#Error").html('Not a XLSX File');
		return;
	}*/
	var oMyForm = new FormData();
    oMyForm.append("file", importgroupMasterFiles[0]);
    var contextPath = $("#contextPath").val();
    URL = contextPath + "/dataManagement/importgroupMasterData.do";	
	 $.ajax({
		  dataType : 'json',
          url : URL,
          data : oMyForm,
          type : "POST",
          enctype: 'multipart/form-data',
          processData: false, 
          contentType:false,
          beforeSend: function(xhr){ 
        	  if(id == 'outlet')
        		  $("#WhgroupMasterImg").closest('span').css("visibility","visible");
        	      $("#groupMasterImg").closest('span').css("visibility","visible");
  	   	},
          success : function(result) {
        	  messageStatus= JSON.stringify(result);
				var parsed_json = JSON.parse(messageStatus);
				var error = parsed_json.err;
				 var url=parsed_json.errorUrl;

				replaceWithNewFileType('grMasterImport');
				$("#groupMasterImportFileType").val("");
				$("#groupMaster").prop('checked',false);
				enableFileBrowse('','groupMaster');
				if(error != undefined && error !=""){
					$("#groupMasterImg").attr("src",contextPath+"/images/error.jpg");
					 $("#Error").html(error)
					 $("#Error").focus();
					 if(id == 'outlet'){
						 $("#WhgroupMasterImg").attr("src",contextPath+"/images/error.jpg");
						 $("#Error").html(error)
						 $("#Error").focus();
					 }
					 if(url != undefined && url !=""){
						 $("#url").css("display","block");
						 $("#errorUrl").attr("href" ,url)
					 }
				}
				var msg = parsed_json.msg;
				if(msg != undefined && msg !=""){
					$("#groupMasterImg").attr("src",contextPath+"/images/tickMark.png");
				    $("#WhgroupMasterImg").attr("src",contextPath+"/images/tickMark.png");
				}
				$("#groupMasterImg").closest('span').css("visibility","visible");
				$("#WhgroupMasterImg").closest('span').css("visibility","visible");
  		},
  		error : function(){
  			replaceWithNewFileType('groupMasterImportFileType');
  			$("#skuMasterFile").val("");
  			$("#groupMaster").prop('checked',false);
  			enableFileBrowse('','employeeMasterImport');
 			$("#groupMasterImg").attr("src",contextPath+"/images/error.jpg");
 			$("#groupMasterImportFileTypeImg").closest('span').css("visibility","visible");
 		}
 	 });
 }


function deleteItem(element, batchId){
	
	
		var contextPath = $("#contextPath").val();
		URL = contextPath + "/dataManagement/deletePackage.do";
		//URL = contextPath + "/crm/createNotificationPackage.do";
	  $.ajax({
			type: "POST",
			url : URL,
			       data :
			    	   {
			    	   batchId : batchId,
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
	
	
	
	
	
	
	
//	//
//	var id = $(element).attr("id").replace('Img','');
//	$('#dynamicdiv'+id).remove();
//	
//	var slNo = 1; 
//	 $('.slno').each(function(){
//		$(this).text(slNo);
//		slNo = parseInt(slNo) + 1;
//	});
	
}



function validateImportPackage(operation){
	var finalObj = {};
	//
	
	if($("#packageName").val().trim() == ""){
		$("#packageError").html("Package Name is Required");
		return;
	}
	var currentDate=getCurrentDate();
	//alert(currentDate)
	finalObj.batch_title = $("#packageName").val();
	//finalObj.batchTitle = $("#packageTittle").val();
	finalObj.batch_timeStr = $("#startTime").val();
	finalObj.batch_dayStr = $("#date").val();
	finalObj.batch_start_dayStr = $("#date").val() + " 00:00:00";
	finalObj.batch_end_dayStr = $("#edate").val() + " 00:00:00";
	//finalobj.dateStr = $("#startTime").val();
	finalObj.updated_onStr = $("#edate").val() + " 00:00:00";
	
    var formData = JSON.stringify(finalObj);
	console.log(formData);
		var contextPath = $("#contextPath").val();
	  
	URL = contextPath + "/dataManagement/createImportPackage.do";
		//URL = contextPath + "/crm/createNotificationPackage.do";
	  $.ajax({
			type: "POST",
			url : URL,
			contentType: "application/json",
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



function importStockReceiptData(){
	debugger
	var oMyForm = new FormData();
    oMyForm.append("file", skuRequestFiles[0]);
    var contextPath = $("#contextPath").val();
	 URL = contextPath + "/dataManagement/importStockReceiptData.do";
	 $.ajax({
		  dataType : 'json',
          url : URL,
          data : oMyForm,
          type : "POST",
          enctype: 'multipart/form-data',
          processData: false, 
          contentType:false,
          beforeSend: function(xhr){  
        	  $("#stockReceiptImg").closest('span').css("visibility","visible");
  	   	},
          success : function(result) {
        	  messageStatus= JSON.stringify(result);
				var parsed_json = JSON.parse(messageStatus);
				var error = parsed_json.err;
				replaceWithNewFileType('stockReceipt');
				$("#stockReceiptFile").val("");
				$("#stockReceipt").prop('checked',false);
				enableFileBrowse('','stockReceipt');
				if(error != undefined && error !=""){
					$("#stockReceiptImg").attr("src",contextPath+"/images/error.jpg");
					 $("#Error").html("Data is not in required format. Please download corresponding format and check");
				}
				var msg = parsed_json.msg;
				if(msg != undefined && msg !="")
					$("#stockReceiptImg").attr("src",contextPath+"/images/tickMark.png");
				 $("#stockReceiptImg").closest('span').css("visibility","visible");
  		},
  		error : function(){
  			replaceWithNewFileType('stockReceipt');
  			$("#stockReceiptFile").val("");
  			$("#stockReceipt").prop('checked',false);
  			enableFileBrowse('','stockReceipt');
 			$("#stockReceiptImg").attr("src",contextPath+"/images/error.jpg");
 			$("#stockReceiptImg").closest('span').css("visibility","visible");
 		}
 	 });
 }

function importPriceListData(){
	if($("#PriceListFileType").val()==""){
		$("#Error").html('Choose File Type');
		return;
	}
	if($("#PriceListFileType").val() == "1" && $("#priceListFile").val().toLowerCase().indexOf('.dwn') == -1){
		$("#Error").html('Not a JDA File');
		return;
	}
	if($("#PriceListFileType").val() == "0" && $("#priceListFile").val().toLowerCase().indexOf('.xlsx') == -1){
		$("#Error").html('Not a XLSX File');
		return;
	}
	var oMyForm = new FormData();
    oMyForm.append("file", priceListFiles[0]);
    var contextPath = $("#contextPath").val();
	 URL = contextPath + "/dataManagement/importPriceListData.do";
	 $.ajax({
		  dataType : 'json',
          url : URL,
          data : oMyForm,
          type : "POST",
          enctype: 'multipart/form-data',
          processData: false, 
          contentType:false,
          beforeSend: function(xhr){  
        	  $("#priceListImg").closest('span').css("visibility","visible");
  	   	},
          success : function(result) {
        	  messageStatus= JSON.stringify(result);
				var parsed_json = JSON.parse(messageStatus);
				var error = parsed_json.err;
				replaceWithNewFileType('priceList');
				$("#priceListFile").val("");
				$("#priceList").prop('checked',false);
				enableFileBrowse('','priceList');
				if(error != undefined && error !=""){
					$("#priceListImg").attr("src",contextPath+"/images/error.jpg");
					 $("#Error").html(error);
				}
				var msg = parsed_json.msg;
				if(msg != undefined && msg !="")
					$("#priceListImg").attr("src",contextPath+"/images/tickMark.png");
				$("#priceListImg").closest('span').css("visibility","visible");
  		},
  		error : function(){
  			replaceWithNewFileType('priceList');
  			$("#priceListFile").val("");
  			$("#priceList").prop('checked',false);
  			enableFileBrowse('','priceList');
 			$("#priceListImg").attr("src",contextPath+"/images/error.jpg");
 			$("#priceListImg").closest('span').css("visibility","visible");
 		}
 	 });
 }
function importskuEansData(id){
	debugger
	if(id== undefined){
		id="";
	}
	if(id="outlet"){
	if($("#skuEansFileType").val()==""){
		$("#Error").html('Choose File Type');
		return;
	}
	if($("#skuEansFileType").val() == "1" && $("#skuEansFile").val().toLowerCase().indexOf('.dwn') == -1){
		$("#Error").html('Not a JDA File');
		return;
	}
	if($("#skuEansFileType").val() == "0" && $("#skuEansFile").val().toLowerCase().indexOf('.xlsx') == -1){
		$("#Error").html('Not a XLSX File');
		return;
	}
	}else{
		if($("#WhskuEansFileType").val()==""){
			$("#Error").html('Choose File Type');
			return;
		}
		if($("#WhskuEansFileType").val() == "1" && $("#WhskuEansFile").val().toLowerCase().indexOf('.dwn') == -1){
			$("#Error").html('Not a JDA File');
			return;
		}
		if($("#WhskuEansFileType").val() == "0" && $("#WhskuEansFile").val().toLowerCase().indexOf('.xlsx') == -1){
			$("#Error").html('Not a XLSX File');
			return;
		}
		
		
	}
	var oMyForm = new FormData();
    oMyForm.append("file", skuEansFiles[0]);
    var contextPath = $("#contextPath").val();
	 URL = contextPath + "/dataManagement/importskuEansData.do";
	 $.ajax({
		  dataType : 'json',
          url : URL,
          data : oMyForm,
          type : "POST",
          enctype: 'multipart/form-data',
          processData: false, 
          contentType:false,
          beforeSend: function(xhr){  
        	  $("#skuEansImg").closest('span').css("visibility","visible");
  	   	},
          success : function(result) {
        	  messageStatus= JSON.stringify(result);
				var parsed_json = JSON.parse(messageStatus);
				var error = parsed_json.err;
				replaceWithNewFileType('skuEans');
				$("#skuEansFile").val("");
				$("#skuEans").prop('checked',false);
				enableFileBrowse('','skuEans');
				if(error != undefined && error !=""){
					$("#skuEansImg").attr("src",contextPath+"/images/error.jpg");
					 $("#Error").html(error);
				}
				var msg = parsed_json.msg;
				if(msg != undefined && msg !="")
					$("#skuEansImg").attr("src",contextPath+"/images/tickMark.png");
				$("#skuEansImg").closest('span').css("visibility","visible");
  		},
  		error : function(){
  			replaceWithNewFileType('skuEans');
  			$("#skuEansFile").val("");
  			$("#skuEans").prop('checked',false);
  			enableFileBrowse('','skuEans');
 			$("#skuEansImg").attr("src",contextPath+"/images/error.jpg");
 			$("#skuEansImg").closest('span').css("visibility","visible");
 		}
 	 });
 }

//koti


//added by vijay
function importDatapromotion(id){
	debugger;
	if(id== "currentDeals" || id=="currentOffers"){
		manid="promotion"
	}
	
	if($("#"+id+"FileType").val()==""){
		$("#Error").html('Choose File Type');
		return;
	}
	if($("#"+id+"FileType").val() == "1" ){
		$("#Error").html('Not a FTP File, We Are Accepting Only FTP mode fro Now.');
		return;
	}
	
	var contextPath = $("#contextPath").val();
	var URL = contextPath + "/dataManagement/"+manid+"Data.do";
	$.ajax({
		
		url : URL,
		data :	{},
		type : "POST",
		
		contentType:false,
		beforeSend: function(xhr){  
			$("#"+id+"Img").closest('span').css("visibility","visible");
		},
		success : function(result) {
			$("#SuccessMsg").html("Loading Data From FTP server. Please Sit Back, We will Process your Data");
			$("#"+id+"Img").closest('span').css("visibility","hidden");
		},
		error : function(e){
				$("#SuccessMsg").html("Loading Data From FTP server.");
			$("#"+id+"Img").closest('span').css("visibility","hidden");
			
		}
	});
}


//added by vijay
function importData(id){
	//;
	debugger;
	
	
	if($("#"+id+"FileType").val()==""){
		$("#Error").html('Choose File Type');
		return;
	}
	else{
		$("#Error").html('');
	}
	if($("#"+id+"FileType").val() == "1" && $("#"+id+"File").val().toLowerCase().indexOf('.dwn') == -1){
		$("#Error").html('Not a JDA File');
		return;
	}
	var val =$("#"+id+"FileType").val();
	if($("#"+id+"FileType").val() == "0" && $("#"+id+"File").val().toLowerCase().indexOf('.xlsx') == -1){
		$("#Error").html('Not a XLSX File');
		return;
	}
	var oMyForm = new FormData();
	//var files = id+'Files';


	if(id == 'customerImport')	
		oMyForm.append("file", customerImportFiles[0]);
	
	else if(id == 'coupons')
		oMyForm.append("file", couponsFiles[0]);
//		var fileSize = couponsFiles[0].size;

	else if(id == 'loaltyCards')
		oMyForm.append("file", loaltyCardsFiles[0]);

//		var fileSize = loyaltyCardsFiles[0].size;
	
	else if(id == 'giftVouchers')
		oMyForm.append("file", giftVouchersFiles[0]);

//		var fileSize = giftVouchersFiles[0].size;
	else
		return;
	

	var contextPath = $("#contextPath").val();
	URL = contextPath + "/dataManagement/"+id+"Data.do";
	$.ajax({
		dataType : 'json',
		url : URL,
		data :	oMyForm,
		type : "POST",
		enctype: 'multipart/form-data',
		processData: false, 
		contentType:false,
		beforeSend: function(xhr){  
			$("#"+id+"Img").closest('span').css("visibility","visible");
			$("#url").css("display","none");
		},
		success : function(result) {
			debugger;
			messageStatus= JSON.stringify(result);
			var parsed_json = JSON.parse(messageStatus);
			var error = parsed_json.msg;
			 if(error == null || error == "" || error == undefined)
				 error=parsed_json.err;
			replaceWithNewFileType(id);
			$("#SuccessMsg").html("")
			$("#Error").html("")
			$("#errorUrl").removeAttr("href", url);
			$("#"+id+"File").val("");
			$("#"+id).prop('checked',false);
			enableFileBrowse('',id );
			if((error != undefined && error !="" ) || error == null){
				$("#"+id+"Img").attr("src",contextPath+"/images/error.jpg");
				if(error.trim() == "Successfully Uploaded")
					$("#SuccessMsg").html(error);
				else
					$("#Error").html(error);
			}

			errorUrl = parsed_json.url;
			if(errorUrl == null || errorUrl == "" || errorUrl == undefined)
				errorUrl=parsed_json.errorUrl;
			
			if(errorUrl != undefined && errorUrl !="" && errorUrl != null && errorUrl != 'null')
			{
				//$("#errorUrl").attr("href", "http://"+errorUrl); 
				if(id == 'coupons')
					$("#errorUrl").attr("href", errorUrl);
				else{
					var pattern = /\\/;
					var err = errorUrl.split(pattern);
					errorUrl = err[0] + "//" + err[1];	
					$("#errorUrl").attr("href", errorUrl);
					
				}
				$("#url").css("display","block");
			}

			var msg = parsed_json.msg;
			/*if(msg != undefined && msg !="")*/
			if(error.trim() == "Successfully Uploaded")
				$("#"+id+"Img").attr("src",contextPath+"/images/tickMark.png");
			else
				$("#"+id+"Img").attr("src",contextPath+"/images/error.jpg");
			$("#"+id+"Img").closest('span').css("visibility","visible");
		},
		error : function(e){/*
			debugger;
			messageStatus= JSON.stringify(e.responseText);
  			var parsed_json = JSON.parse(messageStatus);
  			
  			
  			const inputString = '{"err":" 0 Records are imported Sucessfully,2 Records are failed to import" ,"errorUrl":"http:\\101.53.158.27:80\\Configurations\\CID8995448\\Import_Logs\\06Jul2023.log"}';

  			
  			const matches = inputString.match("\"err\"","\"errorUrl\"");

  			if (matches && matches.length >= 2) {
  			  const extractedString = matches[1];
  			  console.log(extractedString);
  			} else {
  			  console.log("Match not found");
  			}
  			
  			
  			var error = parsed_json.errorUrl;
  			replaceWithNewFileType(id);
  			$("#"+id+"File").val("");
  			$("#"+id+"").prop('checked',false);
  			enableFileBrowse('',id);
  			if((error != undefined && error !="")|| error == null){
  				$("#"+id+"Img").attr("src",contextPath+"/images/error.jpg");
  				$("#Error").html(error+".");
  			}

  			var errorUrl = parsed_json.errorUrl;
  			if(errorUrl != undefined && errorUrl !="")
  			{
  				var pattern = /\\/;
				var err = errorUrl.split(pattern);
				errorUrl = err[0] + "//" + err[1];	
  				//$("#errorUrl").attr("href", errorUrl); 
  				$("#url").css("display","block");

  			}

  			var msg = parsed_json.msg;
  			if(msg != undefined && msg !="")
  			{
  				$("#"+id+"Img").attr("src",contextPath+"/images/tickMark.png");
  			}
  			$("#"+id+"Img").closest('span').css("visibility","visible");
  		
			
		*/

			debugger;
			var json=JSON.stringify(e.responseText);
			
			var matchResult = json.match(/http([^]*)log/);
			var extractedString=""
			if (matchResult && matchResult.length > 1) {
				 extractedString +="http";
			     extractedString += matchResult[1];
				 extractedString +="log";
			  
			}
			//var matchResult = json.match(/msg":"([^]*)" ,"errorUrl"/);
				var matchResult = json.match(/msg([^]*)errorUrl/);
				var msg=""
			if (matchResult && matchResult.length > 1) {
				 
			  var  tmsg= matchResult[1];
			  

			  for (var i = 0; i < tmsg.length; i++) {
			    const character = tmsg[i];
			    if(/^[a-zA-Z0-9\s,]+$/.test(character))
			         msg+=character
			  }

				
			  
			}
			var url=extractedString;
			
  			var parsed_json = JSON.parse(json);
  			//var error = parsed_json.errorUrl;
  			
  			/*var errorUrl = parsed_json.errorUrl;*/
  			$("#Error").html(msg)
  			var errorUrl = url.replace(/\\\\/g, "\\").replace(/\\/g, "/");
  			if(errorUrl != undefined && errorUrl !="")
  			{
  		/*	var pattern = /\\/;
				var err = errorUrl.split(pattern);
				errorUrl = err[0] + "//" + err[1];*/
  				$("#url").css("display","block");
  				$("#errorUrl").attr("href", errorUrl); 

  			}
  			if(msg.trim() == "Successfully Uploaded")
				$("#"+id+"Img").attr("src",contextPath+"/images/tickMark.png");
			else
				$("#"+id+"Img").attr("src",contextPath+"/images/error.jpg");
			$("#"+id+"Img").closest('span').css("visibility","visible");
  			//var msg = parsed_json.msg;
  			
			
		
		
		}
	});
}



function importbillsData(){
	debugger
	if($("#billsFileType").val()==""){
		$("#Error").html('Choose File Type');
		return;
	}
	if($("#billsFileType").val() == "1" && $("#billsFile").val().toLowerCase().indexOf('.dwn') == -1){
		$("#Error").html('Not a JDA File');
		return;
	}
	if($("#billsFileType").val() == "0" && $("#billsFile").val().toLowerCase().indexOf('.xlsx') == -1){
		$("#Error").html('Not a XLSX File');
		return;
	}
	var oMyForm = new FormData();
	oMyForm.append("file", billsFiles[0]);
	var contextPath = $("#contextPath").val();
	URL = contextPath + "/dataManagement/importbillsData.do";
	$.ajax({
		dataType : 'json',
		url : URL,
		data : oMyForm,
		type : "POST",
		enctype: 'multipart/form-data',
		processData: false, 
		contentType:false,
		beforeSend: function(xhr){  
			$("#billsImg").closest('span').css("visibility","visible");
		},
		success : function(result) {
			debugger;
			messageStatus= JSON.stringify(result);
			var parsed_json = JSON.parse(messageStatus);
			var error = parsed_json.err;
			replaceWithNewFileType('bills');
			$("#billsFile").val("");
			$("#bills").prop('checked',false);
			enableFileBrowse('','bills');
			if(error != undefined && error !=""){
				$("#billsImg").attr("src",contextPath+"/images/error.jpg");
				$("#Error").html(error);
			}
			var msg = parsed_json.msg;
			if(msg != undefined && msg !="")
				$("#billsImg").attr("src",contextPath+"/images/tickMark.png");
			$("#billsImg").closest('span').css("visibility","visible");
		},
		error : function(){
			replaceWithNewFileType('bills');
			$("#billsFile").val("");
			$("#bills").prop('checked',false);
			enableFileBrowse('','bills');
			$("#billsImg").attr("src",contextPath+"/images/error.jpg");
			$("#billsImg").closest('span').css("visibility","visible");
		}
	});
}


function importFiles(){
	debugger;
	//;
	$("#loading").css("display","none");
	//$("#mainDiv").addClass("disabled");
	$("#Error").html('');
	if(noOfFiles == 0){
		$("#Error").html("Please Select Atleast One File To Submit");
		$("#loading").css("display","none");
		$("#mainDiv").removeClass('disabled');
		return;
	}

	var st1=$('#skuMasterBtn').is(':checked'); //$("#skuMasterBtn").val();
	if($("#skuMasterBtn").val() != '' && $("#skuMasterBtn").val() != undefined)
		importSkuData();
	//EXISTS
	var st=$("#groupMasterBtn").val();
	if($("#groupMasterBtn").val() != '' && $("#groupMasterBtn").val() != undefined)
		importgroupMasterData('outlet');
	if($("#WhgroupMasterBtn").val() != '' && $("#WhgroupMasterBtn").val() != undefined)
		importgroupMasterData('warehouse');
	//EXISTS
	if($("#priceListBtn").val() != '' && $("#priceListBtn").val() != undefined)
		importPriceListData();
	//EXISTS
	if($("#skuEansBtn").val() != '' && $("#skuEansBtn").val() != undefined)
		importskuEansData('outlet');
	if($("#WhskuEansBtn").val() != '' && $("#WhskuEansBtn").val() != undefined)
		importskuEansData('warehouse');

	//EXISTS
	if($("#billsBtn").val() != '' && $("#billsBtn").val() != undefined)
		importbillsData();
	
	if($("#warehouseskuMasterBtn").val() != '' && $("#warehouseskuMasterBtn").val() != undefined)
		importWarehouseSkuData();
	
	if($("#stockReceiptBtn").val() != '' && $("#stockReceiptBtn").val() != undefined )
		importStockReceiptData();
	
	if($("#goodsReceiptsBtn").val() != '' && $("#goodsReceiptsBtn").val() != undefined )
		importStockReceiptData();

	if($("#suppliersBtn").val() != '' && $("#suppliersBtn").val() != undefined)
		importsupplerData();
	
	if($("#taxMasterImportBtn").val() != '' && $("#taxMasterImportBtn").val() != undefined)
		importtaxMasterData();
	
	if($("#importbrandMasterBtn").val() != '' && $("#importbrandMasterBtn").val() != undefined)
		importbrandMasterData();
	
	if($("#employeeMasterImportBtn").val() != '' && $("#employeeMasterImportBtn").val() != undefined)
		importemployeeMasterData();

	if($("#customerImportBtn").val() != '' && $("#customerImportBtn").val() != undefined)
		importData("customerImport");

	if($("#couponsBtn").val() != '' && $("#couponsBtn").val() != undefined)
		importData("coupons");
	
	if($("#giftVouchersBtn").val() != '' && $("#giftVouchersBtn").val() != undefined)
		importData("giftVouchers");
	
	if($("#loaltyCardsBtn").val() != '' && $("#loaltyCardsBtn").val() != undefined)
		importData("loaltyCards");
		
		
		
		
		var str1=$('#currentDeals').is(':checked'); 
		var str2  = $('#currentOffers').is(':checked'); 
		
		if(str1 || str2){
			if(str1){
					importDatapromotion("currentDeals");
			}else{
					importDatapromotion("currentOffers");
			}
			
			
			
		}

	/*if(!properFormat)
 				  $("#Error").html("Data is not in required format. Please download corresponding format and check");*/
	//	}, 500);
	/*	while(savedFiles < noOfFiles){
 			alert("sav   "+savedFiles);
			setTimeout(function(){},500);
 		}*/
	$("#loading").css("display","none");
	$("#mainDiv").removeClass('disabled');
}

function replaceWithNewFileType(id){
	var newFile = "<input id='"+id+"Btn' disabled='disabled' type='file' onchange=addNameToTextBox('"+id+"'); class='upload' />";
	var $fileInput=$("#"+id+"Btn");
	var $fileCopy = $(newFile);
	$fileInput.replaceWith($fileCopy);
}

function resetFiles(){
	//;
	$("#Error").html('');
	 var contextPath = $("#contextPath").val();
	 $("input:file").each(function(e){
		var id = $(this).attr("id");
		//alert(id);
		id = id.replace('Btn','');
		/*replaceWithNewFileType(id);
		$("#"+id+"Img").closest('span').css("visibility","hidden");
		$("#"+id+"Img").attr("src",contextPath+"/images/circleWait.gif");
		$("#"+id+"File").val("");*/
		//alert($(this).prop('checked'));
		$("#"+id).prop('checked',false);
		//alert($(this).prop('checked'));
		enableFileBrowse('',id);
	 });
	 	
}

function resetOnId(className){
	debugger;
	$("."+className).each(function(e){
		//;
		var id = $(this).attr("id");
		$("#"+id).prop('selectedIndex',0);
		$("#"+id).prop('checked',false);
		
		enableFileBrowse('',id);
	 });
	
}



