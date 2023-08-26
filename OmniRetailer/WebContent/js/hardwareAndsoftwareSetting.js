/**
 * 
 */function validateIntegrationSettingsForm(operation){
	 debugger

	 var IpadSelected = [];
	 $('#iosMenu input:checked').each(function() {
		 IpadSelected.push($(this).attr('name'));
	 });

	 var androidSelected = [];
	 $('#androidTabMenu input:checked').each(function() {
		 androidSelected.push($(this).attr('name'));
	 });

	 var windowsSelected = [];
	 $('#windowsMenu input:checked').each(function() {
		 windowsSelected.push($(this).attr('name'));
	 });

	 var android = [];
	 android[0] = {name : androidSelected};
	 var ios = []; 
	 ios[0] = { name : IpadSelected};
	 var windows = [];
	 windows[0] = { name : windowsSelected};





	 var posDevice = {androidTab:android, ipad:ios,windows:windows}

	 var pos = JSON.stringify(posDevice);


	 var printers = printerSettings;
	 var printerManu=[];
	 var printer = [];
	 for(var i = 0, size = printers.length; i < size ; i++)
	 {
		 var PrinterManufacturer={};
		 var item = printers[i];
		 var type=[];
		 type.push( item.type);
		 printerManu = { printerType :type, printerId : item.id };
		 PrinterManufacturer[item.manufacturer] = printerManu;
		 printer.push(PrinterManufacturer);

	 }
	
	 var barcodes = barCodeSettings;
	 var barCodeManu=[];
	 var barcode=[];
	 for(var i = 0, size = barcodes.length; i < size ; i++){
		 var BarcodeManufacturer={}
		 var item = barcodes[i];
		 var type=[];
		 type.push( item.type);
		 barCodeManu = { BarcodeType : type, ScannerId : item.id}
		 BarcodeManufacturer[item.manufacturer] = barCodeManu;
		 barcode.push(BarcodeManufacturer);
	 }
	 var weighingMachines = weighingMachineSettings;
	 var weighingMachinesManu={};
	 var weighing=[];

	 for(var i = 0, size = weighingMachines.length; i < size ; i++){
		 var WeighingMachineManufacturer = {};
		 var item = weighingMachines[i];
		 var type=[];
		 type.push( item.type);
		 weighingMachinesManu = { WeighingMachineType : type, WeighingMachineId : item.id}
		 WeighingMachineManufacturer[item.manufacturer] =weighingMachinesManu;
		 weighing.push(WeighingMachineManufacturer);


	 }
	 var printers = [];
	 printers[0] = {PrinterManufacturer : printer}
	 var barcodeScanners = [];
	 barcodeScanners[0] ={BarcodeManufacturer : barcode}
	 var weighingMachines = []
	 weighingMachines[0] = {WeighingMachineManufacturer : weighing}


	 var softwareSettings = {};

	 softwareSettings.url = $("#url").val();
	 /*if($("#url").val() == "")
	 {
	 	$("#Error").html("URL is Required")
	 	$("#Error").focus() ;
	 	return;
	 }*/
	 softwareSettings.authorization = $("#authrization").val();
	 /*if($("#authrization").val() == "")
		 {
		 	$("#Error").html("Authorizaion is Required")
		 	$("#Error").focus(); 
		 	return;
		 }*/
	 softwareSettings.contentType = $("#contentType").val();
	 softwareSettings.authorizationType = $("#autheizationType").val();
	 softwareSettings.userName = $("#userName").val();
	/* if($("#userName").val() == "")
	 {
	 	$("#Error").html("User Name is Required")
	 	$("#Error").focus(); 
	 	return;

	 }*/
	 
	 var placesApiAccess = [],assetApiAccess = [];
	 var placesApi = {},  assetApi = {}, fireBaseApi={};
	 softwareSettings.password = $("#password").val();
	 softwareSettings.logisticsProvider =$("#logisticsProvider").val();
	 
	 placesApi.url =$("#placesApiURL").val();
	 placesApi.accessKey =$("#placesApiAccessKeys").val();
	 assetApi.url =$("#assetApiURL").val();
	 assetApi.accessKey =$("#assetApiAccessKeys").val(); 
	 fireBaseApi.url =$("#firebaseApiURL").val();
	 fireBaseApi.authenticationKey =$("#firebaseApiKey").val();
	 placesApiAccess.push(placesApi);
	 assetApiAccess.push(assetApi);
	// fireBaseSettings.push(fireBaseApi);
	 softwareSettings.placesApiAccess=placesApiAccess;
	 softwareSettings.assetApiAccess= assetApiAccess;
	 softwareSettings.fireBaseSettings= fireBaseApi;
	 
	/* if($("#password").val() == "")
	 {
	 	$("#Error").html("Password is Required")
	 	$("#Error").focus(); 
	 	return;
	 }*/
	 
	 
//	 console.log(JSON.stringify(softwareSettings));

	 var hardwareSettings = {};
	 hardwareSettings.posDevice =posDevice;
	// console.log("posdevice "+JSON.stringify(hardwareSettings));
	 hardwareSettings.Printers = printers;
	 hardwareSettings.barcodeScanners = barcodeScanners;
	 hardwareSettings.weighingMachines = weighingMachines;
	 var videoStreaming ="";
	 if($("#videoStreaming").val() != null )
		 videoStreaming = $("#videoStreaming").val();
	 hardwareSettings.videoStreaming = videoStreaming;
	 
	 
	 var FootFalls ="";
	 if($("#FootFalls").val() != null )
		 FootFalls = $("#FootFalls").val();
	 
	 hardwareSettings.FootFalls =  FootFalls;
	 
	 var WiFiCarts ="";
	 if($("#WiFiCarts").val() != null )
		 WiFiCarts = $("#WiFiCarts").val();
	 
	 hardwareSettings.WiFiCarts =  WiFiCarts;
	 
	 var RFIDTagging ="";
	 if($("#RFIDTagging").val() != null )
		 RFIDTagging = $("#RFIDTagging").val();

	 hardwareSettings.RFIDTagging =  RFIDTagging;
	 
	 var BarcodeLabelPrinter = "";
	 if($("#BarcodeLabelPrinter").val() != null  )
		 BarcodeLabelPrinter = $("#BarcodeLabelPrinter").val();
	 hardwareSettings.BarcodeLabelPrinter =  BarcodeLabelPrinter;
	 
	 
	 var barcode_Scanner_A ="";
	 if($("#barcode_Scanner_A").val() != null  )
		 barcode_Scanner_A = $("#barcode_Scanner_A").val();
	 
	 hardwareSettings.barcode_Scanner_A = barcode_Scanner_A;
	 
	 var SelfLabelling ="";
	 if($("#SelfLabelling").val() != null  )
		 SelfLabelling = $("#SelfLabelling").val();
	 
	 hardwareSettings.SelfLabelling =  SelfLabelling; 

	 hardwareSettings.androidTAb = $("#wandriodtab").val();
	 hardwareSettings.iPad = $("#wipad").val();
	 hardwareSettings.barcodeSCanners = $("#wbarcodescanners").val();
	 hardwareSettings.paymentPRovider = $("#wpaymentprovider").val();
	 hardwareSettings.wAllet = $("#wwallet").val();
	 hardwareSettings.weighingMAchine = $("#wweighingmachine").val();
	 hardwareSettings.paymentDevice = $("#paymentDevice").val();

	 var finalObj={};
	 finalObj.hardwareSettings = hardwareSettings;
	 finalObj.softwareSettings = softwareSettings;


	 var formData = JSON.stringify(finalObj);
	// console.log(formData);
	 var contextPath = $("#contextPath").val();
	 if(operation=="new"){
		 URL = contextPath + "/settings/createHardwareAndSoftwaresettings.do";
	 }
	 else if(operation=="edit"){

		 URL = contextPath + "/settings/updateHardwareAndSoftwareSettings.do";
	 }

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

 
 
 var printerSettings = [];
 var barCodeSettings = [];
 var weighingMachineSettings = []
 
 function addItemId(Id)
	{
	 ////debugger;
	   var container = $('#'+Id+"Add");
	   var inputs = container.find('input');
	   var idCount = inputs.length+1;
	   
	   var text = $("#"+Id+"Manufacturer").val();
	   if(text == null)
		{
		   alert(Id+" Manufacturer can't be empty");
		   return;
		}
	   
	   text = $("#"+Id+"Type").val();
	   if(text == null)
		{
		   alert(Id+" Type can't be empty");
		   return;
		}
	   
	   
	   text = $("#"+Id+"Id").val();
	   if(text == "")
		{
		   alert(Id+" Id can't be empty");
		   return;
		}
	   
	   
	   var attr= 'id';
	   var index =-1;
		var idValue = $("#"+Id+"Id").val();
	   
		switch(Id)
		{
			case 'printer' :
				{
				
				for(var i = 0; i < printerSettings.length; i++) {
					   for(var key in printerSettings[i] ) {
						   if(key === attr)
							   {
							   	var keyValue = printerSettings[i][attr];
							   	if(idValue === keyValue)
							   		index = i;
							   }
					   }
					}
				
				
				break;
				}
				
			case 'barcode' :
			{
				
				
				for(var i = 0; i < barCodeSettings.length; i++) {
					   for(var key in barCodeSettings[i] ) {
						   if(key === attr)
							   {
							   	var keyValue = barCodeSettings[i][attr];
							   	if(idValue === keyValue)
							   		index = i;
							   }
					   }
					}
		
			break;
			}
			
			
			
			case 'weighingMachine' :
			{
				
				for(var i = 0; i < weighingMachineSettings.length; i++) {
					   for(var key in weighingMachineSettings[i] ) {
						   if(key === attr)
							   {
							   	var keyValue = weighingMachineSettings[i][attr];
							   	if(idValue === keyValue)
							   		index = i;
							   }
					   }
					}
				
				
				
				}
		
		}
	   
	   
	   if(index >= 0)
		   {
		   		alert("Id already Exist, Please enter new Id for " +Id + " settings");
		   		return;
		   		
		   }
	   
	   
		var appendSettings = {manufacturer: $("#"+Id+"Manufacturer").val(), type:$("#"+Id+"Type").val(), id:$("#"+Id+"Id").val()};
		
		if(Id === "printer")
			printerSettings.push(appendSettings);
		else if(Id === "barcode")
			barCodeSettings.push(appendSettings);
		else
			weighingMachineSettings.push(appendSettings);
		
//	  	$(container).append('<div class="row" style="padding-left:5px;cursor: pointer;" id="child'+text+'" class="child'+Id+idCount+'" onmouseout="return changeIdsUndo(this,\''+Id+'\');"  onclick="return changeIds(this,\''+Id+'\');" > <div class="col-lg-1"><input type="checkbox"  class="'+Id+idCount+'" id="'+Id+idCount+'" value="'+text+'" /></div> <div class="col-lg-9"> '+ text + '</div></div>');
	  	$(container).append('<div class="row" style="padding-left:5px;cursor: pointer;" id="child'+text+'" class="child'+Id+idCount+'" onclick="return changeIds(this,\''+Id+'\');" > <div class="col-lg-1"><input type="checkbox" checked class="'+Id+idCount+'" id="'+Id+idCount+'" value="'+text+'" /></div> <div class="col-lg-9"> '+ text + '</div></div>');

	  	$("#"+Id+"Id").val("");
	  	$("#"+Id+"Manufacturer").val("");
	  	$("#"+Id+"Type").val("")
	  	
	  	
	}
	

 
	
	function RemoveItemId(Id)
	{
		debugger
		var removedItemCount = 0;
		$('input:checkbox[id^="'+Id+'"]:checked').each(function(){
			////debugger;
			var ArrayName = Id+"Settings";
			var value = $(this).val();
			debugger
			if(Id === "printer")
				{
				printerSettings = printerSettings.filter(function( obj ) {
						return obj.id !== value;
					});
				
				}

			
			else if(Id === "barcode")
			{
				barCodeSettings = barCodeSettings.filter(function( obj ) {
					return obj.id !== value;
				});
			
			}
				
			
			else
				
			{
				weighingMachineSettings = weighingMachineSettings.filter(function( obj ) {
					return obj.id !== value;
				});
			
			}
			
		//	var className= this.val;
			$('#child'+value).remove();
			removedItemCount++;
		});
		
		
		
		
		
		if(removedItemCount == 0 )
			{
			
				alert("To Remove, Please select checkbox for atleast one item in "+Id+"s");
				return;
			}
		
		
		$("#"+ Id +"Manufacturer").val(""); 
		$("#"+ Id +"Type").val("");
		$("#"+ Id +"Id").val(""); 
		
		return;
		
	}
	
	
	
	$(document).ready(function(){
		//debugger;
		var ios = new Array();
		var windows = new Array();
		var android = new Array();
		/*ios = $("#ios").val();
		windows = $("#windows").val();
		android = $("#android").val();*/
	
		var android = document.getElementsByClassName("android");
		
		for(var i = 0; i < android.length; i++)
		{
			var id =android.item(i);
			
			$("#"+ id.defaultValue).prop('checked', true);
			
		}
		
		var windows = document.getElementsByClassName("windows");
		
		for(var i = 0; i < windows.length; i++)
		{
			var id =windows.item(i);
			
			$("#"+ id.defaultValue).prop('checked', true);
			
		}
		
		
		var ios = document.getElementsByClassName("ios");
		
		for(var i = 0; i < ios.length; i++)
		{
			var id =ios.item(i);
			
			$("#"+ id.defaultValue).prop('checked', true);
			
		}
		
		 
		 $('#iosMenu input:not(:checked)').each(function() {
			var ids = $(this).attr("id");
			 var idv=$(ids).val();
			 //ios.push(idv);
			 for(var i=0;i<ios.length;i++)
				 {
				 	if(ios[i] === idv)
				 		$(this).prop('checked', true);

				 }
			
		 });
		
		 
		 $('#androidTabMenu input:not(:checked)').each(function() {
				var ids = $(this).attr("id");
				 var idv=$(ids).val();
				 
				 for(var i=0;i<android.length;i++)
					 {
					 	if(android[i] === idv)
					 		$(this).prop('checked', true);

					 }
				
			 });
		 
		 $('#windowsMenu input:not(:checked)').each(function() {
				var ids = $(this).attr("id");
				 var idValue=$(ids).val();
				 for(var i=0;i<windows.length;i++)
					 {
					 	if(windows[i] === idValue)
					 		$(this).prop('checked', true);

					 }
				
			 });
		 
		 
		
		 
		 
		
		
	});
	

	
	

	
	
	var objIndexArrayValue = {};
	
	function changeIds(ele,id)
	{
		//debugger;
		var idValue = ele.id;
		idValue = idValue.replace('child','');
		
		var attr= 'id';
		var index;
		
		
		switch(id)
		{
			case 'printer' :
				{
					
				
				
				for(var i = 0; i < printerSettings.length; i++) {
					   for(var key in printerSettings[i] ) {
						   if(key === attr)
							   {
							   	var keyValue = printerSettings[i][attr];
							   	if(idValue === keyValue)
							   		index = i;
							   }
					   }
					}
				
				objIndexArrayValue = printerSettings[index];
				break;
				}
				
			case 'barcode' :
			{
				
				
				for(var i = 0; i < barCodeSettings.length; i++) {
					   for(var key in barCodeSettings[i] ) {
						   if(key === attr)
							   {
							   	var keyValue = barCodeSettings[i][attr];
							   	if(idValue === keyValue)
							   		index = i;
							   }
					   }
					}
			
			objIndexArrayValue = barCodeSettings[index];
			break;
			}
			
			
			
			case 'weighingMachine' :
			{
				
				for(var i = 0; i < weighingMachineSettings.length; i++) {
					   for(var key in weighingMachineSettings[i] ) {
						   if(key === attr)
							   {
							   	var keyValue = weighingMachineSettings[i][attr];
							   	if(idValue === keyValue)
							   		index = i;
							   }
					   }
					}
				
				objIndexArrayValue = weighingMachineSettings[index];
				
				}
		
		}

		$("#"+ id +"Manufacturer").val(objIndexArrayValue.manufacturer); 
		$("#"+ id +"Type").val(objIndexArrayValue.type);
		$("#"+ id +"Id").val(objIndexArrayValue.id); 
		
	}
	
	
	function changeIdsUndo(ele,id)
	{
		//////debugger;
		var idValue = ele.id;
		idValue = idValue.replace('child','');
		$("#"+ id +"Manufacturer").val(""); 
		$("#"+ id +"Type").val("");
		$("#"+ id +"Id").val(""); 
		
	}
	
	
	
	
	////below code Works for get Integrations Settings
	
	
	$(document).ready(function(){
		 
		//debugger;
		var androidTab = [];
		var windowsTab = [];
		var ios = [];
		var printerDevices =[];
		
		
		/*if($("#androidSelected").length > 0)
			androidTab = $(".androidSelected").val();
		if($("#windowsSelected").length > 0)
			windowsTab = $("#windowsSelected").val();
		if($("#iosSelected").length > 0)
			ios = $("#iosSelected").val();
		*/
	$(".androidSelected").each(function() {
		androidTab.push($(this).val());
	});
	
	$(".windowsSelected").each(function() {
		windowsTab.push($(this).val());
	});
	$(".iosSelected").each(function() {
		ios.push($(this).val());
	});
	
	
	for(var i=0;i<=androidTab.length;i++)
		 {
		 $("#"+androidTab[i]).prop('checked', true);
	}
	/*for(var ids in androidTab)
		{
		 $("#"+ids).prop('checked', true);
		}*/
		/*androidTab.forEach(function(entry) {
			 $("#"+entry).prop('checked', true);
		});
		*/
		ios.forEach(function(entry) {
			 $("#"+entry).prop('checked', true);
		});
	
		windowsTab.forEach(function(entry) {
			 $("#"+entry).prop('checked', true);
		});
	
		$(".subBlock").hide();
		
		

		$("#videoStreamingStr select").val("val2");
		$("#footFalls select").val("val2");
		$("#wifiCharts select").val("val2");
		$("#rfidTagging select").val("val2");
		$("#barcode_Scanner_A select").val("val2");
		$("#BarcodeLabelPrinter select").val("val2");
		$("#selfLabeling select").val("val2");
		
 });

	
	
	
//	
//	 function printsettingsDevices(Id,printDeviceList)
//	 {
//		 var printDevicesSelectedIds =[]
//		 debugger
//		 var container = $('#'+"printer"+"Add");
//		 var inputs = container.find('input');
//		   var idCount = inputs.length+1;
//		 
//		   for(var i=0;i<=printDeviceList;i++)
//			   {
//			   		var appendSettings = {manufacturer: printDeviceList[i].manufacturer, type:printDeviceList[i].type, id:printDeviceList[i].id};
//			   }
//		   printerSettings.push(appendSettings);
//		   console.log(printerSettings)
//		   
//		   
//		   
//		 $(".printDevicesSelected").each(function() {
//			 printDevicesSelectedIds.push($(this).val());
//			});
//		   
//		  
//		 for(var i=0;i<=printDevicesSelectedIds.length;i++)
//		 {
//		 $(container).append('<div class="row" style="padding-left:5px;cursor: pointer;" id="child'+printDevicesSelectedIds[i]+'" class="child'+Id+idCount+'" onclick="return changeIds(this,\''+Id+'\');" > <div class="col-lg-1"><input type="checkbox" checked class="'+Id+idCount+'" id="'+Id+idCount+'" value="'+printDevicesSelectedIds[i]+'" /></div> <div class="col-lg-9"> '+ printDevicesSelectedIds[i] + '</div></div>');
//		 } 
//	 }
	 
	
	
	
	
	
	
