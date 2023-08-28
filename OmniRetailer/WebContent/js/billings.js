$('#searchBills').on('input',function(e){
		if($(this).val().trim()==""){
			viewBills('','0');
		}
	});
	
function searchBills(name,searchCategory,index,flowLocation){
	debugger
	if (searchCategory == "save")
		var saveFlag = true;
	else
		var saveFlag =false;
	debugger
	
	if (flowLocation == undefined) {
  		flowLocation = $("#flowLocations").val();
  	}
	
	name=""
		if($("#searchBills").length>0)
		name = $("#searchBills").val().trim();
	 var maxRecords = 10;
	 if($("#maxRecords").length>0)
		 maxRecords = $("#maxRecords").val();
	 var startDate = "";
	 var endDate = "";
	 if($("#from").length > 0 && $("#from").val() !="") 
      	 startDate = $("#from").val();
      /*	else
      	startDate = getCurrentDate();*/
	 if($("#to").length>0)
		 endDate = $("#to").val();
	 if($("#outletZone").length>0)
		 zone = $("#outletZone").val();
		 if($("#outletCategory").length>0)
			 category = $("#outletCategory").val();
		 if($("#outletSubcategory").length > 0)
	    		subcategory = $("#outletSubcategory").val();
		 if($("#outletBrandId").length > 0)
	    		brand = $("#outletBrandId").val();
		 if($("#salesChannel").length > 0)
			 salesChannel = $("#salesChannel").val();
 	    if($("#counterId").length > 0)
 	    		counterId = $("#counterId").val();
 	    		
 	    		
	 if($("#from").val() != "" && $("#to").val() != ""){
 			var noOfDays = daydiff(parseDate($('#from').val()), parseDate($('#to').val()));
			 if(noOfDays < 0){
				 alert("Start Date can't be less than End Date");
				 return;
			 }
	 }
	
	 
	 
	 var status = $("#billStatus").val();
	 var forTA=$("#billType").val();
	 
	 if(forTA==undefined || forTA==null || forTA=="")
		 {
		 	forTA=status;
		 }
	 
	 var tester;
	 if($("#tester").val()!= null || $("#tester").val()!= undefined){
	  tester=$("#tester").val();
	 }
	 else{
		 tester="";
	 }
	
	 
	 var location = $("#outletLocation").val();
	 
	//written by manasa
	/* var billedLocationsList = [];
	 var length = $('#outletLocation').children('option').length;
      	$('#outletLocation option').each(function() { 
      		billedLocationsList.push( $(this).attr('value'));
      	});*/
	 var  locationList="";
   	/*for(i=1;i<billedLocationsList.length;i++)
   		{
   		locationList =locationList+ billedLocationsList[i]+',';
   		}
	 console.log(locationList)*/
	 //upto here
	 debugger;
	 var contextPath = $("#contextPath").val();
	 URL = contextPath + "/inventorymanager/searchBills.do";
	 
	 $.ajax({
			type: "GET",
			url : URL,
			cache: true,
			data : {
				searchName : name,
				index : index,
				location : location,
				maxRecords : maxRecords,
				startDate : startDate,
				endDate : endDate,
				zone:zone,
				category:category,
				subcategory:subcategory,
				brand:brand,
				tester:tester,
				counterId:counterId,
				status : forTA,
				saveFlag : saveFlag,
				locationList : locationList,
				salesChannel:salesChannel,
				flowLocation:flowLocation
				
			},
			beforeSend: function(xhr){  
				
	   	   		$("#loading").css("display","block");
	   	   		$("#mainDiv").addClass("disabled");
	   	   	},
			success : function(result) {
				debugger;
				$("#loading").css("display","none");
				$("#mainDiv").removeClass('disabled');
				$('#right-side').html(result);
				 var anchor = document.createElement('a');
  				  anchor.href = $("#stockdownloadurl").val();
  				  anchor.target = '_blank';
  				  anchor.download = '';
  				if($("#stockdownloadurl").val()!=null && $("#stockdownloadurl").val()!='')
  				  anchor.click();
      				
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
				
			},
			error : function(e) {
				debugger;
				console.log(JSON.stringify(e));
				 alert("something went wrong");
				 $("#loading").css("display","none");
	 			 $("#mainDiv").removeClass('disabled');
			}
		});
}

	
	
	function getBillSummary(){
		var startDate = "";
		 var endDate = "";
		 if($("#from").length>0)
			 startDate = $("#from").val();
		 if($("#to").length>0)
			 endDate = $("#to").val();
		 if(startDate == "" && endDate != ""){
			/* alert("Please Select Start Date");
			 return;*/
		 }
		 if($("#from").val() != "" && $("#to").val() != ""){
	 			var noOfDays = daydiff(parseDate($('#from').val()), parseDate($('#to').val()));
				 if(noOfDays < 0){
					 alert("Start Date can't be less than End Date");
					 return;
				 }
		 }
		 
		//written by manasa
		 var billedLocationsList = [];
		 var length = $('#outletLocation').children('option').length;
		 console.log(length)
	      	$('#outletLocation option').each(function() { 
	      		billedLocationsList.push( $(this).attr('value'));
	      	   
	      	});
		
		 console.log(billedLocationsList)
		// finalobj.billedLocations = billedLocationsList;
		 var status = $("#billStatus").val();
		 var location = $("#outletLocation").val();
		 var contextPath = $("#contextPath").val();
		 
		//written by manasa
			 var  locationList="";
		      	for(i=1;i<billedLocationsList.length;i++)
		      		{
		      		locationList =locationList+ billedLocationsList[i]+',';
		      		}
		      //	locationList = locationList.slice(0,-1);//remove last comma
		    
		      	console.log(locationList)
		     
		     /*var locationsList=""; 	
		 $("#outletLocation option").each( function(){
			 locationsList = locationsList+$(this).val()+',';  
	    			});
		 locationsList.slice(0,-1);
		console.log(locationsList)*/
		 
		 URL = contextPath + "/inventorymanager/getBillSummary.do";
		 $.ajax({
				type: "GET",
				url : URL,
				data : {
					location : location,
					startDate : startDate,
					endDate : endDate,
					status : status,
					locationList : locationList
				},
				beforeSend: function(xhr){                    
		   	   		$("#loading").css("display","block");
		   	   		$("#mainDiv").addClass("disabled");
		   	   	},
				success : function(result) {
					$('#summary').html(result); 
					var text = "Bill Summary - "
					if(location == "")
						text = text + "All Locations";
//					$("#locationLable").html(location);
					var dateLabel = "";
					if(startDate != "" && endDate != "")
//						$("#dateLable").html("  ("+startDate+" - "+endDate+")");
						dateLabel = "  ("+startDate+" -- "+endDate+")";
					 if(startDate != "" && endDate == ""){
						 var dateTime = getCurrentDate();
						  var date = dateTime.split(' ');
						  date = date[0].split('/');
						  endDate = date[1]+"/"+date[0]+"/"+date[2];
//						  $("#dateLable").html("  ("+startDate+" - "+endDate+")");
						  dateLabel = "  ("+startDate+" -- "+endDate+")";
					 }
					 text = text + dateLabel;
					/* if(startDate == "" && endDate == "")
						 $("#dateLable").html("");*/
					 $("#locationLable").html(text);
					var  op = '<a id="summaryTag"  data-toggle="modal" data-target="#items-modal"></a>';
					 $("#triggerEvent").append(op);
					 $("#summaryTag" ).trigger( "click" );
					 $("#triggerEvent").html("");
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
	
	
	
	function checkforTotals(){
		debugger;
		 		var count=$("#tableRowCount").val();
 	    		
 	    		var iteratedModeOfPayment = 0;
 	    		var netAmt=parseFloat($("#netAmt").val());
 	    		var prevBillPaymentMode  = "";
  		  	
 	    		 var paidAmountVal=0;
  		  	for(var i=1;i<=count;i++)
  		  	{
  		  	paidAmountVal = parseFloat(paidAmountVal) +parseFloat($("#paidAmount"+i).text());
  		  		
  		  	prevBillPaymentMode =  $('#modeOfPayment'+i).val();
  		
  			var modeofPayment = $("#paymentMode"+i).val();
  			if(modeofPayment == prevBillPaymentMode)
  				{
  					iteratedModeOfPayment++;
  				}
  		  	}
  		  	if(paidAmountVal<netAmt){
  		  		$('#Errortrans').html("The Paid Amt is not matching with the Net Bill Amount");
              $("#dueAmountVal").val(parseFloat(netAmt-paidAmountVal).toFixed(2));
       
  		  	}else{
	        $('#Errortrans').html("");
            $("#dueAmountVal").val(0);
            }
	}
	



  	      function updateBillTransaction(billId,flow,criteria,type,typePay){
	    			 debugger;
 	    	try{
	    			var contextPath = $("#contextPath").val();
// var modeofPayment = $("#modeOfPayment").val();
 	    		var startDate="";
 	    		var endDate="";
 	    		var modeofPayment ="";
 	    		 $('#myModalUpdateTransaction').modal('hide');
 	    	// purpose:for checking internet conection
 	    		var online = window.navigator.onLine;
 	    	  	if(!online){
 	    	  	alert("Check your internet connection,Please try agian after some time.");
 	    	  	return;
 	    	  	}
 	    		var status=$("#billStatus").val();
 	    		
 	    		var netAmt=$("#netAmt").val();
 	    		
 	    		var transactionList="";
 	    		var count=$("#tableRowCount").val();
 	    		/*
				 * $(".modeOfPayment").each( function(){ modeofPayment =
				 * modeofPayment +$(this).text()+','; });
				 */
 	    		var iteratedModeOfPayment = 0;
 	    		
 	    		var prevBillPaymentMode  = "";
  		  	
 	    		 var paidAmountVal=0;
  		  	for(var i=1;i<=count;i++)
  		  	{
  		  	paidAmountVal = parseFloat(paidAmountVal) +parseFloat($("#paidAmount"+i).text());
  		  		
  		  	prevBillPaymentMode =  $('#modeOfPayment'+i).val();
  		
  			var modeofPayment = $("#paymentMode"+i).val();
  			if(modeofPayment == prevBillPaymentMode)
  				{
  					iteratedModeOfPayment++;
  				}
  		  	}
  		  	if(paidAmountVal>netAmt){
  		  		 $('#Errortrans').html("The Paid Amt Should not exceed the Net Bill Amount");
  		  		return;
  		  	}
      	   if(paidAmountVal<netAmt){
  		  	 $('#Errortrans').html("The Paid Amt is not matching with the Net Bill Amount");
             $("#shipmentCharges").val(parseFloat(netAmt-paidAmountVal).toFixed(2));
          

            return;
       
  		  	}else{
	        $('#Errortrans').html("");
            $("#dueAmountVal").val(0);
          }
  		  	
  			/*if(iteratedModeOfPayment >= count)
  				{
  				 	$('#myModalUpdateTransaction').modal('toggle');
  				 	alert("Please update The Payment Mode and then try again.");
  				 	return;
  			
  				}*/
  			var location = "";
  			 var counterId ="";
  			var category=""
	    		var subCategory=""
   	    	 if($("#outletLocation").length > 0)
   	    		 location = $("#outletLocation").val();
   	    	 
   	    	if ($("#counterId").length > 0) 
   	      	 counterId=$("#counterId").val(); 
   	    	
   	    	if ($("#outletCategory").length > 0) 
   	      	 category = $("#outletCategory").val();
   	    	if ($("#outletSubcategory").length > 0) 
   	      	 subCategory = $("#outletSubcategory").val();
   	    	
   	    	
   	    	var searchName=""
   	 		if($("#searchBills").length>0)
   	 		searchName = $("#searchBills").val().trim();
   	    	
 	    		var maxRecords = 10;
  	      	if ($("#maxRecords").length > 0)
  	      		maxRecords = $("#maxRecords").val();
  	      	modeofPayment="";
  	      var paidAmount="";
  	      	for(var i=1;i<=count;i++)
	    			{
	    				modeofPayment = modeofPayment +$("#modeOfPayment"+i).val()+',';
	    				paidAmount = paidAmount +parseFloat($("#paidAmount"+i).text())+',';
	    			}
  	      	
  	      	
	    		$(".transaction").each( function(){
	    			transactionList = transactionList+$(this).text()+',';  
	    			});
 	    		
 	    		 if(flow == undefined || flow == "" || flow == null)
     	    		 flow = "billing";
     	    	 if(criteria == undefined || criteria == null || criteria == "")
     	    		criteria = "bill";
     	    	
     	   	 if($("#from").length>0)
     	   		 startDate = $("#from").val();
     	   	 if($("#to").length>0)
     	   		 endDate = $("#to").val();
     	    	 
 	    		 
 	    		 URL = contextPath + "/inventorymanager/updateBillTransaction.do";
 	    			 $.ajax({
 	    	       			type: "POST",
 	    	       			url : URL,
 	    	       			data : {
 	    	       					modeofPayment:modeofPayment,
 	    	       					transactionList: transactionList,
 	    	       					billId : billId	,
 	    	       					flow : flow,
 	    	       					criteria : criteria,
 	    	       					type:type,
 	    	       				    maxRecords : maxRecords,
 	    	       					status:status,
 	    	       				    typePay : typePay,
 	    	       				    paidAmount:paidAmount
 	    	       					},
 	    	       				beforeSend: function(xhr){                    
		            	   	   			$("#loading").css("display","block");
		            	   	   			$("#mainDiv").addClass("disabled");
		            	   	   		  },
		            	    		success : function(result){
		            	    		$("#right-side").html(result);
		            	    		$("#from").val(startDate);
		            	    		$("#to").val(endDate);
		            	    		$("#outletLocation").val(location);
		            	    		$("#counterId").val(counterId);
		            	    		$("#outletCategory").val(category);
		            	    		$("#outletSubcategory").val(subCategory);
		            	    		$("#searchBills").val(searchName);
		            	    		$("#loading").css("display","none");
		            	    		$("#mainDiv").removeClass('disabled');
		            	    		},
		            	    		error : function(jqXHR, textStatus, errorThrown) {
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


  	      
  	    function createBillTransaction(billId,flow,criteria,type,typePay){
			 debugger;
	try{
			var contextPath = $("#contextPath").val();
		// var modeofPayment = $("#modeOfPayment").val();
		var startDate="";
		var endDate="";
		var modeofPayment ="";
		var formObj = {};
		 $('#myModalUpdateTransaction').modal('hide');
	// purpose:for checking internet conection
		var online = window.navigator.onLine;
	  	if(!online){
	  	alert("Check your internet connection,Please try agian after some time.");
	  	return;
	  	}
		var status=$("#billStatus").val();
		
		var netAmt=$("#netAmt").val();
		
		var transactionList="";
		var count=$("#tableRowCount").val();
		/*
		 * $(".modeOfPayment").each( function(){ modeofPayment =
		 * modeofPayment +$(this).text()+','; });
		 */
		var iteratedModeOfPayment = 0;
		
		var prevBillPaymentMode  = "";
	  	
		 var paidAmountVal=0;
	  	for(var i=1;i<=count;i++)
	  	{
	  	paidAmountVal = parseFloat(paidAmountVal) +parseFloat($("#paidAmount"+i).text());
	  		
	  	prevBillPaymentMode =  $('#modeOfPayment'+i).val();
	
		var modeofPayment = $("#paymentMode"+i).val();
		if(modeofPayment == prevBillPaymentMode)
			{
				iteratedModeOfPayment++;
			}
	  	}
	  	if(paidAmountVal>netAmt){
	  		 $('#Errortrans').html("The Paid Amt Should not exceed the Net Bill Amount");
	  		return;
	  	}
	   if(paidAmountVal<netAmt){
	  	 $('#Errortrans').html("The Paid Amt is not matching with the Net Bill Amount");
    $("#shipmentCharges").val(parseFloat(netAmt-paidAmountVal).toFixed(2));
 

   return;

	  	}else{
   $('#Errortrans').html("");
   $("#dueAmountVal").val(0);
 }
	  	
		/*if(iteratedModeOfPayment >= count)
			{
			 	$('#myModalUpdateTransaction').modal('toggle');
			 	alert("Please update The Payment Mode and then try again.");
			 	return;
		
			}*/
		var location = "";
		 var counterId ="";
		var category=""
		var subCategory=""
  	 if($("#outletLocation").length > 0)
  		 location = $("#outletLocation").val();
  	 
  	if ($("#counterId").length > 0) 
    	 counterId=$("#counterId").val(); 
  	
  	if ($("#outletCategory").length > 0) 
    	 category = $("#outletCategory").val();
  	if ($("#outletSubcategory").length > 0) 
    	 subCategory = $("#outletSubcategory").val();
  	
  	
  	var searchName="";
		if($("#searchBills").length>0)
		searchName = $("#searchBills").val().trim();
  	
		var maxRecords = 10;
   	if ($("#maxRecords").length > 0)
   		maxRecords = $("#maxRecords").val();
   	
   var billingTransactions = [];
   
   var cardPayment="";
   var cardInfo="";
   var approvalCode="";
   var Paymentmode = "";
   var flag = true;
 
   $('.transaction').each(function() {
 	  debugger
	  var idAttr= $(this).attr("id").replace('transaction',''); 
 	idAttr = idAttr.replace('transaction','');
	  
	  Paymentmode = $("#modeOfPayment"+idAttr).val();
	  tendermode = $("#tenderMode"+idAttr).val();
	  
	   approvalCode = $("#approvalCode"+idAttr).val();
	  
	  if(Paymentmode == "Credit Note"){
	   cardPayment = $("#cardPayment"+idAttr).val();
	   if(cardPayment == ""){
		   $('#Errortrans').html("Please Enter Credit Note Number");
		   $('#cardPayment'+idAttr).focus();
		   flag = false;
		   return false;
	   }
	  } else if(Paymentmode == "Credits"){
		   cardPayment = $("#cardPayment"+idAttr).val();
		   
		   if(cardPayment == ""){
			   $('#Errortrans').html("Please Enter Gift Coupon Number");
			   $('#cardPayment'+idAttr).focus();
			   flag = false;
			   return false;
		   }
		   
	  }else if(Paymentmode == "Card"){
			cardInfo = $("#cardPayment"+idAttr).val();
			
			if(cardInfo == ""){
				   $('#Errortrans').html("Please Enter Card Number");
				   $('#cardPayment'+idAttr).focus();
				   flag = false;
				   return false;
			   }
			if(approvalCode == ""){
				   $('#Errortrans').html("Please Enter approval Code");
				   $('#approvalCode'+idAttr).focus();
				   flag = false;
				   return false;
			   }
			
	  }
		 
	  
		var obj = {transactionId:$("#transaction"+idAttr).text(),dateAndTimeStr:$("#dateTime"+idAttr).text(),modeOfPayment:Paymentmode,cardType:$("#cardType"+idAttr).text(),couponNumber:cardPayment,cardInfo:cardInfo,approvalCode:approvalCode,paidAmount:$("#paidAmount"+idAttr).text(),receivedAmountt:$("#paidAmount"+idAttr).text(),billId:billId,tenderMode:tendermode};
		billingTransactions.push(obj);
	
});
    
 formObj.billingTransactions = billingTransactions;
 
   if(!flag){
 	$('#Errortrans').focus();
 	  return false;
   }
		
		 if(flow == undefined || flow == "" || flow == null)
    		 flow = "billing";
    	 if(criteria == undefined || criteria == null || criteria == "")
    		criteria = "bill";
    	
   	 if($("#from").length>0)
   		 startDate = $("#from").val();
   	 if($("#to").length>0)
   		 endDate = $("#to").val();
    	 
   	formObj.billId = billId;
  	formObj.flow = flow;
  	formObj.criteria = criteria;
  	formObj.type = type;
  	formObj.maxRecords = maxRecords;
  	formObj.status = status;
  	formObj.typePay = typePay;
  	
  	formObj = JSON.stringify(formObj);
   console.log(formObj);
  	
		 URL = contextPath + "/inventorymanager/createBillTransaction.do";
			 $.ajax({
	       			type: "POST",
	       			url : URL,
	       		 contentType: "application/json",
	  			data : formObj,
	       				beforeSend: function(xhr){                    
           	   	   			$("#loading").css("display","block");
           	   	   			$("#mainDiv").addClass("disabled");
           	   	   		  },
           	    		success : function(result){
           	    		$("#right-side").html(result);
           	    		$("#from").val(startDate);
           	    		$("#to").val(endDate);
           	    		$("#outletLocation").val(location);
           	    		$("#counterId").val(counterId);
           	    		$("#outletCategory").val(category);
           	    		$("#outletSubcategory").val(subCategory);
           	    		$("#searchBills").val(searchName);
           	    		$("#loading").css("display","none");
           	    		$("#mainDiv").removeClass('disabled');
           	    		},
           	    		error : function(jqXHR, textStatus, errorThrown) {
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
  	      

function checkforTotals(){
	debugger;
	 		var count=$("#tableRowCount").val();
	    		
	    		var iteratedModeOfPayment = 0;
	    		var netAmt=parseFloat($("#netAmt").val());
	    		var prevBillPaymentMode  = "";
		  	
	    		 var paidAmountVal=0;
		  	for(var i=1;i<=count;i++)
		  	{
		  	paidAmountVal = parseFloat(paidAmountVal) +parseFloat($("#paidAmount"+i).text());
		  		
		  	prevBillPaymentMode =  $('#modeOfPayment'+i).val();
		
			var modeofPayment = $("#paymentMode"+i).val();
			if(modeofPayment == prevBillPaymentMode)
				{
					iteratedModeOfPayment++;
				}
		  	}
		  	if(paidAmountVal<netAmt){
		  		$('#Errortrans').html("The Paid Amt is not matching with the Net Bill Amount");
          $("#dueAmountVal").val(parseFloat(netAmt-paidAmountVal).toFixed(2));
   
		  	}else{
        $('#Errortrans').html("");
        $("#dueAmountVal").val(0);
        }
}



