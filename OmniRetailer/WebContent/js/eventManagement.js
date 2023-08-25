
var countpayment = 1;
function validateEventManagement(operation,update){
	debugger;
	 try{
 		   var online = window.navigator.onLine;
 		   	if(!online){
 		   	 alert("Check your internet connection,Please try agian after some time.");
 		     	 return;
 		}

 		   $("#Error").html("");
 		   $("#Success").html("");
 		   $("#ErrorInventoryClosure").html("");
		   $("#ErrorEquipmentClosure").html("");
		   $("#SuccessEquipmentClosure").html("");
 		   $("#SuccessInventoryClosure").html("");
 	   debugger;
 	   if(update == "" || update == undefined || update == null){
 		  update = "";
 	   }
 	   
 	  if($("#dpid").val() == ""){
			 $("#Error").html("Select  DPID");
			 $("#dpid").focus();
			 return;
	}
 	  
 	  var dateTime = getCurrentDate();
   	  var date = dateTime.split(' ');
   	  date = date[0].split('/');
   	  var formatedDate = date[1]+"/"+date[0]+"/"+date[2];
 	   
 	  if(operation == "Closed"){
 		 var eventinvCount = parseInt($("#lengthofInv").val());
 		 var eventequCount =  parseInt($("#lengthofEqu").val());
 		 var noOfDaysstarts = daydiff(parseDate($('#Eventstart').val()), parseDate(formatedDate));
		 
    	 if(noOfDaysstarts < 0){
   		  $("#Error").html("Event not yet started. Not allowed to Close."); 
   		  $("#ErrorInventoryClosure").html("Event not yet started. Not allowed to Close.");
		  $("#ErrorEquipmentClosure").html("Event not yet started. Not allowed to Close.");
   		 return false;
   	  }
 		
 		 
 		 var eventinvCloseCount = parseInt($("#lengthofInvClosure").val());
 		 var eventequCloseCount =  parseInt($("#lengthofEquClosure").val());
 		 
 		 
 		if(eventinvCount == undefined || eventinvCount == null || eventinvCount == ""){
 			eventinvCount = 0;
 		}
 		if(eventequCount == undefined || eventequCount == null || eventequCount == ""){
 			eventequCount = 0;
 		}
 		 
 		if(eventequCloseCount == undefined || eventequCloseCount == null || eventequCloseCount == ""){
 			eventequCloseCount = 0;
 		}
 		if(eventinvCloseCount == undefined || eventinvCloseCount == null || eventinvCloseCount == ""){
 			eventinvCloseCount = 0;
 		}
 		
 		if(eventinvCloseCount != eventinvCount  ){
 			 $("#ErrorInventoryClosure").html("Update Event Inventory Closure to Close Event");
 			$("#tab_6_Inventory_Closure").trigger('click');
 			 return false;
 		}
 		if( eventequCloseCount != eventequCount){
			 $("#ErrorEquipmentClosure").html("Update Event Equipment Closure to Close Event");
				$("#tab_7_Eqipment_Closure").trigger('click');
			 return false;
		}
 	  }
 	   
		 var contextPath = $("#contextPath").val();
		 var formData={};
		 var eventPaymentTransactions = [];
		 
		 if($("#eventName").val() == ""){
			 $("#Error").html("Enter Event Name");
			 $("#eventName").focus();
			 return;
		 }
		 
		 
		
		 if($("#Eventstart").val() == ""){
			 $("#Error").html("Enter Event Start Date");
			 $("#Eventstart").focus();
			 return;
		 }
		
		 
		 if($("#EventEnd").val() == ""){
			 $("#Error").html("Enter Event End Date");
			 $("#EventEnd").focus();
			 return;
		 }
		
   	
    if(operation == "new" || operation =="draft" || operation =="Approved"){
	
	var next =parseDate($('#Eventstart').val());

     var next2 = parseDate(formatedDate);
	
    	 var noOfDaysstart = daydiff(parseDate($('#Eventstart').val()), parseDate(formatedDate));
		 
    	 if(noOfDaysstart > 0){
   		  $("#Error").html("For Start Date, Past Dates Not allowed"); 
   		 return false;
   	  }
   	}
		 
		 var noOfDays = daydiff(parseDate($('#Eventstart').val()), parseDate($('#EventEnd').val()));
			 if(noOfDays < 0){
				 $("#Error").html("Event End Date can't be less than Start Date");
				 $("#EventEnd").focus();
				 return;
			 }
		
		 if(operation !="draft"){
		 
		 var plotOdc = $("#plotNoODC").val();
			if(plotOdc!=""){
	    		if(plotOdc.length > 30){
	    			$("#Error").html("ODC plot number can't have morethan 30 characters");
	    			 $("#plotNoODC").focus();
	    			return false;
	    			}
	    	}
		 
		 if($("#plotNoODC").val() == ""  ){
			 $("#Error").html("Enter ODC Plot Number"); 
			 $("#plotNoODC").focus();
			 return;
		 }
		 if($("#locationODC").val() == ""  ){
			 $("#Error").html("Enter ODC Location"); 
			 $("#locationODC").focus();
			 return;
		 }
		 if($("#cityODC").val() == "" ){
			 $("#Error").html("Enter ODC City");
			 $("#cityODC").focus();
			 return;
		 }
		 if($("#pinCodeODC").val() == "" ){
			 $("#Error").html("Enter ODC Pincode");
			 $("#pinCodeODC").focus();
			 return;
		 }
		 
		 
		 if (parseInt($("#pinCodeODC").val().length) != 6) {
			  $("#Error").html("Please Check ODC PIN code.");
	  			return false;

  		}
		 
		 
		 if( $("#phoneODC").val() == ""  ){
			 $("#Error").html("Enter ODC Phone Number"); 
			 $("#phoneODC").focus();
			 return;
		 }
		 
		 
		var tester =parseInt($("#phoneODC").val().length)
		 
		  if (parseInt($("#phoneODC").val().length) != 10) {
			  $("#Error").html("Sorry, ODC Phone No. is not valid, Please Enter Your Working 10 Digit Phone No.");
	  			return false;

   		}
  		
		 
		 if($("#firmName").val() == "" ){
			 $("#Error").html("Enter Customer First Name"); 
			 $("#firmName").focus();
			 return;
		 }
		 if($("#location").val() == "" ){
			 $("#Error").html("Enter Customer Location"); 
			 $("#location").focus();
			 return;
		 }
		 if($("#city").val() == "" ){
			 $("#Error").html("Enter Customer City"); 
			 $("#city").focus();
			 return;
		 }
		 if($("#pincode").val() == "" ){
			 $("#Error").html("Enter Customer Pincode"); 
			 $("#pincode").focus();
			 return;
		 }
		 
		 if (parseInt($("#pincode").val().length) != 6) {
			  $("#Error").html("Please Check Customer PIN code.");
	  			return false;
 		}
		 
		 if($("#contactPerson").val() == "" ){
			 $("#Error").html("Enter Contact Person Name."); 
			 $("#contactPerson").focus();
			 return;
		 }
		 if($("#phone").val() == "" ){
			 $("#Error").html("Enter Contact Person Phone Number"); 
			 $("#phone").focus();
			 return;
		 }
		 
		 if(operation == "new" || operation =="draft" ){
		 var txtPANCard = document.getElementById("PANnumber");
		 if(txtPANCard.value != ""){
		 
	        var regex = /([A-Z]){5}([0-9]){4}([A-Z]){1}$/;
	        if (regex.test(txtPANCard.value.toUpperCase())) {
	        
	        } else {
	        	 $("#Error").html("Please Check PAN Number.");
	            return false;
	        }
		 }
		 
		 
		 var GSTnumber = document.getElementById("GSTnumber");
		 if(GSTnumber.value != ""){
		   var gstinformat = /^([0][1-9]|[1-2][0-9]|[3][0-7])([a-zA-Z]{5}[0-9]{4}[a-zA-Z]{1}[1-9a-zA-Z]{1}[zZ]{1}[0-9a-zA-Z]{1})+$/;
	        if (gstinformat.test(GSTnumber.value.toUpperCase())) {
	           
	        } else {
	        	 $("#Error").html("Please Check GST Number.");
	            return false;
	        }
		 }
		 }
		 
		 if (parseInt($("#phone").val().length) != 10) {
			 $("#Error").html("Sorry, Customer Phone No. is not valid, Please Enter Your Working 10 Digit Phone No.");
	  			return false;
	   		}
	  		
		 
		 if (document.querySelector('#aggrement').checked) {
		 }else{
			 $("#Error").html("Please Upload Agreement Document"); 
			 return;
		 }
		 if($("#signatureFile").val() == ""){
			 $("#Error").html("Please Upload Agreement Document"); 
			 $("#signatureFile").focus();
			 return;
		 }
		 if($("#eventType").val() == ""){
			 $("#Error").html("Please Select Event Type"); 
			 $("#eventType").focus();
			 return;
		 }}
		 if($("#DiscountType").val() == ""){
			 $("#Error").html("Please Select Discount Type"); 
			 $("#DiscountType").focus();
			 return;
		 }
		 
		 if($("#DiscountType").val() == "Fixed Rental"){
			 if($("#discountValue1").val() == ""){
				 $("#Error").html("Enter Discount value"); 
				 $("#discountValue1").focus();
				 return;
			 }
		
			var paymentModeDiscount =  $("#paymentModeDiscount").val();
			paymentModeDiscount = paymentModeDiscount.split("-");
			var amountDiscount = parseFloat($("#discountValue1").val());
			 
			 if(paymentModeDiscount[1] == "Cheque" || paymentModeDiscount[1] == "cheque"){
		     if($("#discontreferncebank").val() == ""){
			 $("#Error").html("Please Enter Bank Name"); 
			 $("#discontreferncebank").focus();
			 return;
		 }
		 
		 if($("#discontrefernceref").val() == ""){
			 $("#Error").html("Please Enter Bank Reference Number"); 
			 $("#discontrefernceref").focus();
			 return;
		 }
			 }else if(paymentModeDiscount[1] == "Cash"){
					if(amountDiscount > 8000){
						
					$("#Error").html("for cash only 8000 Accepting");
					$("#discountValue1").focus();
					return false;
					} 
				 }else if(paymentModeDiscount[1] == "Card"){
					 if(amountDiscount > 32000){
							$("#Error").html("for card only 32000 Accepting")
							$("#discountValue1").focus();
							}  
				 }
		 
		formData.paymentMode = paymentModeDiscount[0];
		 
		 formData.discountAmount =$("#discountValue1").val(); 
		 }else if($("#DiscountType").val() == "Revenue Sharing"){
                         
                                var DiscountValue= $("#discountValue").val();
                                if(DiscountValue>100){
                                 $("#Error").html("For Revenue Sharing  Can't exceed morethan 100%");
                                 $("#discountValue").focus();
                                 return;
                                } 
        formData.discountAmount =$("#discountValue").val(); 
                        }else{
		 
		 if($("#discountValue").val() == ""){
			 $("#Error").html("Enter Discount value"); 
			 $("#discountValue").focus();
			 return;
		 }
		 formData.discountAmount =$("#discountValue").val(); 
		 }
		 
		 if($("#saleType").val() == ""){
			 $("#Error").html("Please Select Sale Type"); 
			 $("#saleType").focus();
			 return;
		 }
		
		 var limitcashamount = 0;
		 
		 if($("#saleType").val() != "Total Credit"){
		 
		 var priclistCountvalue = 0;
		
		 $('.paymentList').each(function() {
				
			 priclistCountvalue = priclistCountvalue+1;
			  var idAttr= $(this).attr("id").replace('paymentList','');
			  
			  var amountLimit = parseFloat($("#amounts"+idAttr).val());
			  var paymentModeLimit =  $("#cardTypes"+idAttr).val();
			  var modePayment = $("#paymentModesAdded"+idAttr).val();
			 
			  if(paymentModeLimit == "cheque" ||  paymentModeLimit == "Cheque"){
			  if($("#BankName"+idAttr).val() == ""){
				  $("#Error").html("Please Enter Bank name"); 
				  $("#BankName"+idAttr).focus();
				  limitcashamount = limitcashamount +1;
				  return false;
			  }
			  if($("#Bankrefernceref"+idAttr).val() == ""){
				  $("#Error").html("Please  Enter Bank Ref"); 
				  $("#Bankrefernceref"+idAttr).focus();
				  limitcashamount = limitcashamount +1;
				  return false;
			  }
			  }
			  
			  if($("#BankName"+idAttr).val() == null || $("#BankName"+idAttr).val() ==undefined){
				  $("#BankName"+idAttr).val() == "";
			  }
			  
             if($("#Bankrefernceref"+idAttr).val() == null || $("#Bankrefernceref"+idAttr).val() ==undefined){
            	 $("#Bankrefernceref"+idAttr).val() == "";
			  }
			  
			  if(paymentModeLimit == "Cash"){
					if(amountLimit > 8000){
					
					$("#Error").html("Cash payment can not exceed more than 8,000.");
					$("#amount").focus();
					limitcashamount = limitcashamount +1;
					} 
				 }else if(paymentModeLimit == "Card"){
					 if(amountLimit > 16000){
							$("#Error").html("Card payment can not exceed more than 32,000.")
							$("#amount").focus();
							limitcashamount = limitcashamount +1;
							}  
				 }

				var obj = {modeOfPayment:$("#paymentModesAdded"+idAttr).val(),cardType:$("#cardTypes"+idAttr).val(),paidAmount:$("#amounts"+idAttr).val(),receivedAmount:$("#amounts"+idAttr).val(),tenderKey:$("#tenderKeys"+idAttr).val(),tenderMode:$("#tenderCodes"+idAttr).val(),bankReference:$("#Bankrefernceref"+idAttr).val(),bankName:$("#BankName"+idAttr).val()};
				eventPaymentTransactions.push(obj);
				
		 });
		 
		 if(priclistCountvalue == 0){
			 $("#Error").html("Please Select Payment mode"); 
			 $("#paymentMode").focus();
			 return;
		 }
		 }else{
			  if($("#Eventdue").val() == ""){
				  $("#Error").html("Please  Select Credit Due Date"); 
				  $("#Eventdue").focus();
				  limitcashamount = limitcashamount +1;
			  }
		 }
		 
	if(operation !="draft" ){
	
		 if($("#saleType").val() != "Total Advance"){
			 if($("#signature1File").val() == ""){
				 $("#Error").html("Please Upload Approval Document"); 
				 $("#signature1File").focus();
				 return;
			 }
			 }
		 if($("#salespersonID").val() == ""){
			 $("#Error").html("Please Select Sales Employee"); 
			 $("#salespersonID").focus();
			 return;
		 }
	}
		 if($("#Date").val() == ""){
			 $("#Error").html("Enter Event Created Date"); 
			 $("#Date").focus();
			 return;
		 }
		
		 if(operation == "new" || operation =="draft" || operation =="Approved"){
			 if( $("#saleType").val() == "Total Credit"){
      var noOfDaysdue = daydiff(parseDate(formatedDate), parseDate($('#Eventdue').val()));
			 if(noOfDaysdue < 0){
		   		  $("#Error").html("Due date must be future date"); 
		   		 return false;
		   	  }	 
			 }
		 }
		 if(operation !="draft" ){
		
		 if($("#taxpersentage").val() == ""){
			 $("#Error").html("Select Tax  Percentage"); 
			 $("#taxpersentage").focus();
			 return;
		 }
		 
		 if($("#manpower").val() == ""){
			 $("#Error").html("Enter Man Power Required"); 
			 $("#manpower").focus();
			 return;
		 }
		 
		 
		 if($("#expectedsales").val() == ""){
			 $("#Error").html("Enter Expected sale"); 
			 $("#expectedsales").focus();
			 return;
		 }
		 
		 if($("#proft").val() == ""){
			 $("#Error").html("Enter Profit"); 
			 $("#proft").focus();
			 return;
		 }
		 
		 if($("#signature2File").val() == ""){
			 $("#Error").html("Please Upload P&L Document"); 
			 $("#signature2File").focus();
			 return;
		 }
		  }
		 
		 if(limitcashamount > 0){
			 return false;
		 }
		 
		 var expectedsales = parseFloat($("#expectedsales").val());
      	 var profit = parseFloat($("#proft").val());
      	 if(expectedsales<profit){
      		 $("#Error").html("Profit can't be morethan Saless");
      		return false;
      	 }
	
		  formData.eventName = $("#eventName").val();
		  formData.eventDescription = $("#eventDescription").val();
		  var eventStatus = true;
		 
		 formData.eventStatus = eventStatus;
		 formData.startDateStr = $("#Eventstart").val();
		 formData.endDateStr = $("#EventEnd").val();
		 formData.odcPlotNumber = $("#plotNoODC").val();
		 formData.outDoorCateringLocation = $("#locationODC").val();
		 formData.odcCity = $("#cityODC").val();
		 formData.odcPinCode = $("#pinCodeODC").val();
		 formData.odcContactPersoneMobileNumber = $("#phoneODC").val();
		 formData.odcContactPersoneEmail = $("#emailODC").val();
		 formData.odcLocality = $("#googlemapODC").val();
		 formData.customerName = $("#firmName").val();
		 formData.customerLocation = $("#location").val();
		 formData.customerLocationCity = $("#city").val();
		 formData.customerPinCode = $("#pincode").val();
		 formData.customerMobileNumber = $("#phone").val();
		 formData.customerEmail = $("#Custemail").val();
		 formData.customerPanNumber = $("#PANnumber").val();
		 formData.customerGstNumber = $("#GSTnumber").val();
		 formData.eventType = $("#eventType").val();
		 formData.discountType = $("#DiscountType").val();
		 formData.dueDateStr = $("#Eventdue").val();
		 
		 var bankName = $("#discontreferncebank").val();
		 var paymentbankRef = $("#discontrefernceref").val();
		 
		 if(bankName == "" || bankName == undefined || bankName == null ){
			 bankName = "";
		 }
		 if(paymentbankRef == "" || paymentbankRef == undefined || paymentbankRef == null ){
			 paymentbankRef = "";
		 }
		 
		if($("#countersRequired").val() == ""){
			 $("#Error").html("Enter No of Counters Required"); 
			 return;
		 }
	
	      if(operation == "Rejected"  && $("#remarks").val() == ""){
			 $("#Error").html("Please Enter Reason For Rejection."); 
		     $("#remarks").focus();
			 return;
		 }
	
	expectedsales
		
		 formData.bankName = bankName;
		 formData.paymentReference = paymentbankRef;
		 formData.salePerson = $("#salespersonID").val();
		 formData.leadChannel = $("#leadChannel").val();
	
		 formData.taxPercentage = $("#taxpersentage").val();
		 formData.countersRequired = $("#countersRequired").val();
		 formData.manPower = $("#manpower").val();
		 formData.expectedSales = $("#expectedsales").val();
		 formData.saleType = $("#saleType").val();
		 formData.outletStoreLocation = $("#dpid").val();
		 formData.createdDateStr = $("#Date").val();
		 formData.termsAndConditions = $("#remarks").val();
		 formData.agreementDoc = $("#signatureFile").val();
		 formData.agreementDoc2 = $("#signature1File").val();
		 formData.agreementDoc3 = $("#signature2File").val();
		 formData.agreementDocId = $("#signature_refId").val();
		 formData.agreementDoc2Id = $("#signature1_refId").val();
		 formData.agreementDoc3Id = $("#signature2_refId").val();
		 
		 formData.profit = $("#proft").val();
		 formData.eventReference = $("#eventrefnumber").val();
		 
		 
		 if(operation == "new"){
			 formData.workflowStatus ="Submitted";
		 }else if(operation == "draft"){
			 formData.workflowStatus ="Draft";
		 }else{
			 formData.workflowStatus =operation;
		 }
		
		/*if(operation =="Approved"){
			 var approvedBy = $("#eventApprovedBy").val();
			 if(approvedBy == ""){
				 approvedBy = $("#approvefname").val();
			 }
		formData.approvedBy = approvedBy;
		}*/
			 
		 formData.leadChannel = $("#leadChannel").val();
		 formData.operation = operation;
		 formData.eventPaymentTransactions = eventPaymentTransactions;
		  formData = JSON.stringify(formData);
		 console.log(formData);
		 
     if(update == "")	{	 
		 if(operation == "new" || operation =="draft"){
   	 URL = contextPath + "/outletMaster/createEventManagement.do";
		 }else{
    URL = contextPath + "/outletMaster/updateEventManagement.do";
		 }
     }else{
			 URL = contextPath + "/outletMaster/updateEventManagement.do";
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
   			if($("#Error").html() != ""){
   			
   				$("#tab_1_Event").trigger('click');
   			
   			}
   			    // $("#tab_2").addClass("active");
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


function addNameToTextBox(id,ele){
	 debugger;
	 $("#Error").html("");

        if(($("#"+id+"Btn")[0].files[0] != undefined) && $("#"+id+"Btn")[0].files[0].size < 5000000){

		if($("#"+id+"Btn")[0].files[0] != undefined){
			$("#"+id+"File").val($("#"+id+"Btn")[0].files[0]['name']);
			var fullPath = $("#"+id+"Btn")[0].files[0]['name'];
			loadImageFileAsURL(id,ele);
		}else{
			$("#"+id+"File").val("");
			}
			
		}else{
	 $("#Error").html("File too Big, please select a file less than 5MB");
		
		}

	}

	function loadImageFileAsURL(id,ele) {
		debugger;
		if (ele.files && ele.files[0]) {
	        var reader = new FileReader();

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
	    		idAttr = id.replace('signature','');
	    		if(idAttr == ""){
	    			
	    		 $("#skuMasterImgDownload").css("display","none");
	    	     $("#skuMasterImg").css("display","block");
	    		}else if(idAttr == "1"){
	    			 $("#skuMasterImg1Download").css("display","none");
	          	$("#skuMasterImg1").css("display","block");
	    		}else{
	    			 $("#skuMasterImg2Download").css("display","none");
	    			 $("#pandltestexcel").css("display","none");
	    		$("#skuMasterImg2").css("display","block");
	    		}
	        	
	        	 // $("#skuMasterImg").closest('span').css("visibility","visible");
	  	   	},
	          success : function(result) {
	        	  
					idAttr = id.replace('signature','');
					
						$("#"+id+"_refId").val(result);
						
						if(idAttr == ""){
							$("#skuMasterImg").attr("src",contextPath+"/images/tickMark.png");
							
							$("#skuMasterImg").css("display","block");
				    		}else if(idAttr == "1"){
				    			$("#skuMasterImg1").attr("src",contextPath+"/images/tickMark.png");
								
								$("#skuMasterImg1").css("display","block");
				    		}else{
				    			$("#skuMasterImg2").attr("src",contextPath+"/images/tickMark.png");
				    			 $("#pandltestexcel").css("display","none");
								$("#skuMasterImg2").css("display","block");
				    		}
						
						
	  		},
	        
	        	error : function() {
	        		$("#Error").html("Something Went Wrong, please Check Document Size");
	        		
	        		idAttr = id.replace('signature','');
		    		if(idAttr == ""){
		    	     $("#skuMasterImg").css("display","none");
		    	     $("#skuMasterImgDownload").css("display","block");
		    		}else if(idAttr == "1"){
		          	$("#skuMasterImg1").css("display","none");
		          	 $("#skuMasterImg1Download").css("display","block");
		    		}else{
		    		$("#skuMasterImg2").css("display","none");
		    		 $("#skuMasterImg2Download").css("display","block");
		    		}
	        	
	        	}
	        });
	    }
	};
	function aggrementUpload(){

		
		 if (document.querySelector('#aggrement').checked) {
			 $(".signatureBtn").css("pointer-events","all");
				$(".signatureBtn").css("background","#3c8dbc");
		    } else {
		    	$(".signatureBtn").css("pointer-events","none");
				$(".signatureBtn").css("background","#757879");
				$("#skuMasterImg").css("display","none");
				
		    }
		
	}


	function increaseAmount(){
		var amount = parseFloat($("#amount").val());
		if(isNaN(amount)){
			amount = 0.0;
		}
		amount =amount+100;
		$("#amount").val(amount);
	}
	function LimitAmount(){
		$("#Error").html("");
				var amount = parseFloat($("#amount").val());
				
				var paymentMode =  $("#paymentMode").val();
				 paymentMode = paymentMode.split("-");
				 var paymentMode = paymentMode[1];
				 
				 if(paymentMode == "Cash"){
					if(amount > 8000){
					
					$("#Error").html("for cash only 8000 Accepting");
					$("#amount").focus();
					} 
				 }else if(paymentMode == "Card"){
					 if(amount > 32000){
							$("#Error").html("for card only 32000 Accepting")
							$("#amount").focus();
							}  
				 }
				 
				
			}

function LimitAmountDiscount(){
		debugger;
		$("#Error").html("");
		$("#Success").html("");
		
				var amountDiscount = parseFloat($("#discountValue1").val());
				
				var paymentModeDiscount =  $("#paymentModeDiscount").val();
				paymentModeDiscount = paymentModeDiscount.split("-");
				 var paymentModeDiscount = paymentModeDiscount[1];
				 
				 if(paymentModeDiscount == "Cash"){
					if(amountDiscount > 8000){
						
					$("#Error").html("for cash only 8000 Accepting");
					$("#discountValue1").focus();
					return false;
					} 
				 }else if(paymentModeDiscount == "Card"){
					 if(amountDiscount > 32000){
							$("#Error").html("for card only 32000 Accepting")
							$("#discountValue1").focus();
							}  
				 }
				 
				
			}
			

	
	function searchProducts(name, searchCategory){
		debugger;
		 //purpose:for checking internet conection
		var online = window.navigator.onLine;
	  	if(!online)
	  	{
	  	alert("check your internet connection,please try agian after some time");
	  	return;
	  	}
		var storeLocation = $("#outletLocation").val();
		var supplier_Id = $("#supplier_Id").val();
		var category = $("#outletCategory").val();
		var flowUnder =  $("#flowUnder").val();	
		if(flowUnder == undefined || flowUnder == null){
			flowUnder ="";
		}
		
			var contextPath = $("#contextPath").val();
			
				URL = contextPath + "/inventorymanager/searchProductsforEventManagement.do";
			
			 $.ajax({
	    			type: "GET",
	    			url : URL,
	    			data : {
	    				searchName : name,
	    				storeLocation : storeLocation,
	    				category : category,
	    				searchCategory : searchCategory
	    			},
	    			beforeSend: function(xhr){                    
	 	   	   			$("#loading").css("display","block");
	 	   	   			$("#mainDiv").addClass("disabled");
	 	   	   		  },
	    			success : function(result) {
	            		appendProducts(result, searchCategory);
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



	function appendProducts(productsList, searchCategory){
		debugger;
		 $("."+searchCategory).html('');
		 var op = '';
		
			
			 for(var i=0;i<productsList.length;i++){
				 
				 if(productsList[i].uomLabel == null || productsList[i].uomLabel == undefined){
					 productsList[i].uomLabel = "";
				 }
				 if(productsList[i].utility == null || productsList[i].utility == undefined){
					 productsList[i].utility = "";
				 }
				 if(productsList[i].department == null || productsList[i].department == undefined){
					 productsList[i].department = "";
				 }
				 if(productsList[i].productName == null || productsList[i].productName == undefined){
					 if(productsList[i].description == null || productsList[i].description == undefined){

					 productsList[i].productName = "";
					 }else{
						 productsList[i].productName =  productsList[i].description;
					 }
				 }
				 if(productsList[i].price == null || productsList[i].price == undefined){
					 productsList[i].price = "";
				 }
				 if(productsList[i].measureRange == null || productsList[i].measureRange == undefined){
					 
					 if(productsList[i].measurementRange == null || productsList[i].measurementRange == undefined){
						 productsList[i].measureRange = "";
					 }else{
						 productsList[i].measureRange = productsList[i].measurementRange;
					 }
					 
					
				 }
				 
				 
				 
				 if(productsList[i].skuID == productsList[i].description){
						 if (i == 0) {
							 op += '<li id="'+productsList[i].skuID+'"  class="selected" onclick=getId(this,"'+searchCategory+'","'+productsList[i].mrp+'","'+productsList[i].pluCode+'"); ><a><label style="width: 10%;">'+productsList[i].skuID+'</label> &nbsp &nbsp &nbsp &nbsp   <label style="width: 30%;">'+productsList[i].productName+' </label>  &nbsp &nbsp<label style="width: 15%;">'+productsList[i].department+'</label>&nbsp &nbsp <label style="width: 10%;">'+productsList[i].measureRange+'</label>   &nbsp &nbsp<label style="width: 15%;">'+productsList[i].utility+'</label>   &nbsp &nbsp  <label style="width: 5%;">'+productsList[i].price+'</label> </a></li>';
						}else
							 op += '<li id="'+productsList[i].skuID+'"   onclick=getId(this,"'+searchCategory+'","'+productsList[i].mrp+'","'+productsList[i].pluCode+'"); ><a><label style="width: 10%;">'+productsList[i].skuID+'</label> &nbsp &nbsp &nbsp &nbsp   <label style="width: 30%;">'+productsList[i].productName+' </label>  &nbsp &nbsp<label style="width: 15%;">'+productsList[i].department+'</label>&nbsp &nbsp <label style="width: 10%;">'+productsList[i].measureRange+'</label>   &nbsp &nbsp<label style="width: 15%;">'+productsList[i].utility+'</label>   &nbsp &nbsp  <label style="width: 5%;">'+productsList[i].price+'</label> </a></li>';
			 	}
				 else{
					 if (i == 0) {
						 op += '<li id="'+productsList[i].skuID+'"  class="selected" onclick=getId(this,"'+searchCategory+'","'+productsList[i].mrp+'","'+productsList[i].pluCode+'"); ><a><label style="width: 10%;">'+productsList[i].skuID+'</label> &nbsp &nbsp &nbsp &nbsp   <label style="width: 30%;">'+productsList[i].productName+' </label>  &nbsp &nbsp<label style="width: 15%;">'+productsList[i].department+'</label>&nbsp &nbsp <label style="width: 10%;">'+productsList[i].measureRange+'</label>   &nbsp &nbsp<label style="width: 15%;">'+productsList[i].utility+'</label>   &nbsp &nbsp  <label style="width: 5%;">'+productsList[i].price+'</label> </a></li>';
					}else
						 op += '<li id="'+productsList[i].skuID+'"   onclick=getId(this,"'+searchCategory+'","'+productsList[i].mrp+'","'+productsList[i].pluCode+'"); ><a><label style="width: 10%;">'+productsList[i].skuID+'</label> &nbsp &nbsp &nbsp &nbsp   <label style="width: 30%;">'+productsList[i].productName+' </label>  &nbsp &nbsp<label style="width: 15%;">'+productsList[i].department+'</label>&nbsp &nbsp <label style="width: 10%;">'+productsList[i].measureRange+'</label>   &nbsp &nbsp<label style="width: 15%;">'+productsList[i].utility+'</label>   &nbsp &nbsp  <label style="width: 5%;">'+productsList[i].price+'</label> </a></li>';
				 }
			 } 
		
		 
		 $("."+searchCategory).html(op);
		 $("."+searchCategory).show();
		 
	}

	function getId(element,type,mrp,plucode){
		debugger;
		var id= $(element).attr("id");
		var description = null;
		description =  $("#"+id).children("a").text();
		description = description.split(' ( ');
		description = description[0];
		$("#desc").val(description);
		
		if(mrp == undefined || mrp == null || mrp ==""){
			mrp="";
		}
		
		if(plucode == undefined || plucode == null || plucode ==""){
			plucode="";
		}
		
		
			getSkuDetails(id,type,mrp,plucode);
			 $(".services").hide();
			 $("."+type).html("");
		
	}
	function getSkuDetails(skuId,type,mrp,plucode){
		debugger;
		 //purpose:for checking internet conection
		var online = window.navigator.onLine;
	  	if(!online)
	  	{
	  	alert("check your internet connection,please try agian after some time");
	  	return;
	  	}
		 var contextPath = $("#contextPath").val();
		 var storeLocation = $("#outletInventory option:selected").text();
		 var flowUnder =  $("#flowUnder").val();	
			if(flowUnder == undefined || flowUnder == null){
				flowUnder ="";
			}
		 if(type.includes("eventInventory"))
		 URL = contextPath + "/inventorymanager/getSkuDetailsForEventInventory.do"; 
		 else
			 URL = contextPath + "/inventorymanager/getSkuDetailsForEvents.do";
		 $.ajax({
	  			type: "GET",
	  			url : URL,
	  			data : {
	  				skuId : skuId,
	  				storeLocation : storeLocation,
	  				mrp : mrp,
	  				plucode : plucode
	  				
	  			},
	  			beforeSend: function(xhr){                    
	   	   			$("#loading").css("display","block");
	   	   			$("#mainDiv").addClass("disabled");
	   	   		  },
	  			success : function(result) {
		if(result != ""){
	  				if(type.includes("eventInventory"))
	  				appendSkuDetailsForInventory(result,type);
	  				else
	  					appendSkuDetails(result,type);
	  				$("#loading").css("display","none");
	  				$("#mainDiv").removeClass('disabled');
			}else{
				 alert("Internal error, please contact Technolabs support.");
			$("#loading").css("display","none");
	  		$("#mainDiv").removeClass('disabled');
			}
	  			},
	  			error : function() {
	  				 alert("something went wrong");
	  				$("#loading").css("display","none");
					$("#mainDiv").removeClass('disabled');
	  			}
	  		});
	}


	function appendSkuDetails(skuDetails,type){
		debugger;
		 var parsedJson = jQuery.parseJSON(skuDetails);
			
			skuList = parsedJson.skuLists;
			
			
			
			/*if(skuList.length >1){
				var priceLength = skuList.length;
				var priceArray = [];
				$("#itemsList tbody").html("");
				for(var i=0; i<priceLength; i++){
					var price = skuList[i].price;
					if (! $.inArray(price, priceArray) > -1)
					{
						priceArray.push(price);
						var row = '<tr id=price'+i+' style="margin-top:5px;cursor:pointer" onclick=getPrice(this) ><td>'+skuList[i].description+'</td><td>'+price+'</td></tr>';
						//'<li id="'+productsList[i].skuID+'"  class="selected" onclick=getId(this,"'+searchCategory+'"); ><a>'+productsList[i].description+'   -   '+productsList[i].skuID+'</a></li>';
						$("#itemsList tbody").append(row);
					}
				}
				var  op = '<a id="selectPrice"  data-toggle="modal" data-target="#items-modal"></a>';
				 $("#triggerEvent").append(op);
				 $("#selectPrice" ).trigger( "click" );
				 $("#triggerEvent").html("");
			}
			else{*/
				addSku(skuList[0],type);
			/*}*/
	}
	
	

	 function addSku(sku,type){
		 debugger;
		 var contextPath = $("#contextPath").val();
		 $("#ErrorMenu").html("");
		 $("#SuccessMenu").html("");
		 
		 if(type == "eventManagement"){
		 var len = parseInt($("#eventMenu tr").length);
			if (len != 1)
				len = parseInt($("#eventMenu tr:last").attr("id").replace('dynamicdiv', '')) + 1;
			


			
			for(var j = 1; j<=len;j++){
				
				var addedSkuid = $("#skuID"+j).text();
				if(addedSkuid == undefined || addedSkuid == null ){
					addedSkuid = "";
				}
				var addedPluid = $("#pluceodemenus"+j).text();
				if(addedPluid == undefined || addedPluid == null ){
					addedPluid = "";
				}
				var addedmrpid = $("#posPrice"+j).text();
				if(addedmrpid == undefined || addedmrpid == null ){
					addedmrpid = "";
				}
				
				if(addedSkuid == sku.skuId && addedPluid == sku.pluCode && addedmrpid == sku.mrp){
					
					$("#ErrorMenu").html("SKU Already Added.");
					return false;
				}
				
			}
			
			var description = null;
			if (sku.description != "" && sku.description != null)
				description = sku.description;
			else
				description = $("#desc").val();
			
			var make = sku.make;
			if(make == "" || make == null)
				make = "_";
			var slNo = 1; 
				 $('.slno').each(function(){
					$(this).text(slNo);
					slNo = parseInt(slNo) + 1;
				});
			
             if(sku.measureRange == null || sku.measureRange == undefined){
					 
					 if(sku.measurementRange == null || sku.measurementRange == undefined){
						 sku.measureRange = "";
					 }else{
						 sku.measureRange = sku.measurementRange;
					 } 
             }
				 
             
             if(sku.primaryDepartment == null || sku.primaryDepartment == undefined)
				 sku.primaryDepartment = "";
             
				var row = "<tr id='dynamicdiv"+len+"' style='margin-top:5px;'><td class='slno' id='itemno"+len+"'>"+slNo+"</td><td id='skuID"+len+"'>"+sku.skuId+"</td>" +
				 "<input type='hidden' id='pluCodeMenu"+len+"' value='"+sku.pluCode+"'/>" +
	 				"<input type='hidden' id='categoryMenu"+len+"' value='"+sku.category+"'/>" +
	 				"<input type='hidden' id='avlqtyMenu"+len+"' value='"+sku.availableQty+"'/>" +
	 				"<input type='hidden' id='qtyMenu"+len+"' value='"+sku.quantity+"'/>" +
	 				"<input type='hidden' id='uomMenu"+len+"' value='"+sku.uomLabel+"'/>" +
	 				"<input type='hidden' id='imgMenu"+len+"' value='"+sku.skuImage+"'/>" +
	 				"<input type='hidden' id='pic1Menu"+len+"' value='"+sku.picture1+"'/>" +
	 				"<input type='hidden' id='pic2Menu"+len+"' value='"+sku.picture2+"'/>" +
				
				"<td id='description"+len+"'>"+description+"</td>" +
				"<td id='measuremrntRange"+len+"'>"+sku.measureRange+"</td>" +
				"<td id='utility"+len+"'>"+sku.utility+"</td>" +
				"<td id='department"+len+"'>"+sku.primaryDepartment+"</td>" +
				"<td id='posPrice"+len+"'>"+sku.mrp+"</td>" +
				"<td id='salePrice"+len+"'>"+sku.price+"</td>" +
				"<td id='Del"+len+"'>" +
				"<img id='Img"+len+"' src='"+contextPath+"/images/itemdelete.png' style='width:20%;cursor:pointer;' onclick='deleteItem(this);' title='Delete "+sku.skuId+"'/></td></tr>";
				$("#eventMenu tbody").append(row);
		 }else if(type.includes("eventInventory")){
			
			var SubmittionCount =$("#SubmittionCount").val();
			 
			 idAttr = parseInt(type.replace('eventInventory',''));
			 
			 $("#ErrorInventory"+SubmittionCount).html("");
			 $("#SuccessInventory"+SubmittionCount).html("");
			 
			 
			 var len = parseInt($("#EventInventory"+idAttr+" tr").length);
				if (len != 1)
					len = parseInt($("#EventInventory"+idAttr+" tr:last").attr("id").replace('dynamicdiv', '')) + 1;
			
				
				debugger;
				
				
				for(var j = 1; j<=len;j++){
					
					var addedSkuid = $("#skuIDInventory"+idAttr+j).text();
					if(addedSkuid == undefined || addedSkuid == null ){
						addedSkuid = "";
					}
					
					if(addedSkuid == sku.skuId){
						
						$("#ErrorInventory"+SubmittionCount).html("SKU Already Added.");
						return false;
					}
					
					
					 if($("#DateInventory"+idAttr).val() ==""){
						 $("#ErrorInventory"+SubmittionCount).html("Please Select Date."); 
						 return false;
					 }
					 
			    	 
			     var noOfDaysInv = daydiff(parseDate($("#DateInventory"+idAttr).val()), parseDate($("#Eventstart").val()));
			    	  if(noOfDaysInv > 1){
			    		  
			    		  $("#ErrorInventory"+SubmittionCount).html("Inventory can be issued  One Day only Before Event Start Date."); 
			    		
			    		  return false;
			    	  }
			    	  
					     var noOfDaysInvEnd = daydiff(parseDate($("#DateInventory"+idAttr).val()), parseDate($("#EventEnd").val()));
  
                         if(noOfDaysInvEnd < 0){
			    		  
			    		  $("#ErrorInventory"+SubmittionCount).html("Inventory can not issued After Event End Date."); 
			    		
			    		  return false;
			    	  }
			    	  
				/*var noOfDaysInvafterapproved = daydiff(parseDate($("#updateddtaeStr").val()), parseDate($("#Eventstart").val()));
				
				 if(noOfDaysInv > noOfDaysInvafterapproved || noOfDaysInv == 0){
		    		  
		    		  $("#ErrorInventory").html("Inventory can be issued between Event Approved Date And Start Date."); 
		    		
		    		  return false;
		    	  }*/
			    	  
					
				} 
				
				
		    	 
				
				
				
				
				
				var description = null;
				if (sku.description != "" && sku.description != null)
					description = sku.description;
				else
					description = $("#desc").val();
				
				var uom = sku.uom;
				if(uom == "" || uom == null)
					uom = "";
				var size = sku.packSize;
				if(size == "" || size == null)
					size = "";
					
					
				var salePrice = sku.salePrice;
				if(salePrice == null || salePrice == undefined )
					salePrice = 0;
					
					
					
					var tax = sku.tax;
			
			
			/*added by Koti Bommineni
			purpose:for cgst sgst caluclation*/
			//var taxRate=tax[0].taxRate;
			
			var taxRate=0.0;
			var taxCategory = "";
			
			if(tax!=null)
				if(tax.length>0){
					if(tax[0].saleRangesList.length != null  && tax[0].saleRangesList.length > 0){
					taxCategory = tax[0].taxCategory
					
					for(var t=0;t<tax[0].saleRangesList.length;t++)
					{
					if(parseFloat(tax[0].saleRangesList[t].saleValueTo) >= sku.salePrice && parseFloat(tax[0].saleRangesList[t].saleValueFrom) <= sku.salePrice ){
						taxRate = tax[0].saleRangesList[t].taxRate;
						
					break;
					}
					}
					}else{
						taxRate = tax[0].taxRate;
					    taxCategory = tax[0].taxCategory
					}
				}
				var taxamount = parseFloat(((salePrice)*(taxRate))/100).toFixed(2);	
				
				var slNo = 1; 
					 $('.slnoInventory'+idAttr).each(function(){
						$(this).text(slNo);
						slNo = parseInt(slNo) + 1;
					});
				
					var row = "<tr id='dynamicdiv"+len+"' class='dynamicdiv"+len+idAttr+"' style='margin-top:5px;'><td class='slnoInventory"+idAttr+"' id='itemno"+len+"'>"+slNo+"</td><td id='skuIDInventory"+idAttr+len+"'>"+sku.skuId+"</td>" +
					"<td id='skuNameInventory"+idAttr+len+"'>"+description+"</td>" +
					"<td  id='saleprice"+idAttr+len+"'>"+salePrice+"</td>" +
					"<td  id='taxCategory"+idAttr+len+"'>"+taxCategory+"</td>" +
					"<td  id='taxvalue"+idAttr+len+"'>"+parseFloat(taxRate*2).toFixed(2)+"</td>" +
					"<td  id='sgsttaxvalue"+idAttr+len+"'>"+taxamount+"</td>" +
		 	     	"<td id='cgsttaxvalue"+idAttr+len+"'>"+taxamount+"</td>"+
					"<td id='uomInventory"+idAttr+len+"'>"+uom+"</td>" +
					"<td id='sizeInventory"+idAttr+len+"'>"+size+"</td>" +
					"<td id='transferqtyInventory"+idAttr+len+"' contenteditable='true'>1</td>" +
					"<td id='Del"+idAttr+len+"'>" +
					"<img id='Img"+len+"' src='"+contextPath+"/images/itemdelete.png' style='width:20%;cursor:pointer;' onclick='deleteItemInventory(this,"+idAttr+");' title='Delete "+sku.skuId+"'/></td></tr>";
					$("#EventInventory"+idAttr+" tbody").append(row);
		 
		 }
				
		
	}
	 

	 function deleteAll(flow){
			debugger;
			if(flow == "menu")
			$("#eventMenu tbody tr").remove();
			else if(flow == "inventory")
			$("#EventInventory tbody tr").remove();
			else if(flow == "Manpower")
			$("#eventManpower tbody tr").remove();
			else
			$("#EventEquipment tbody tr").remove();
			
		}
	 
	 
	 
	 
	 function deleteAllEquipment(flow){
			debugger;
			if(flow == "1")
			$("#EventEquipment1 tbody tr").remove();
			else if(flow == "2")
			$("#EventEquipment2 tbody tr").remove();
			else if(flow == "3")
			$("#EventEquipment3 tbody tr").remove();
			else
			$("#EventEquipment4 tbody tr").remove();
			
		}
	 
	 
	 function deleteAllManpower(flow){
			debugger;
			if(flow == "1")
			$("#eventManpower1 tbody tr").remove();
			else if(flow == "2")
			$("#eventManpower2 tbody tr").remove();
			else if(flow == "3")
			$("#eventManpower3 tbody tr").remove();
			else
			$("#eventManpower4 tbody tr").remove();
			
		}
	 
	 
	 
	 function deleteAllInventory(flow){
			debugger;
			if(flow == "1")
			$("#EventInventory1 tbody tr").remove();
			else if(flow == "2")
			$("#EventInventory2 tbody tr").remove();
			else if(flow == "3")
			$("#EventInventory3 tbody tr").remove();
			else
			$("#EventInventory4 tbody tr").remove();
			
		}
	 
	 
	 
	
	 
	 
	 
	 function deleteItem(element){
		 debugger;
			var id = $(element).attr("id").replace('Img','');
			$('#dynamicdiv'+id).remove();
			var slNo = 1; 
			 $('.slno').each(function(){
				$(this).text(slNo);
				slNo = parseInt(slNo) + 1;
			});
		}
	 
	 function deleteItemInventory(element,idtr){
		 debugger;
			var id = $(element).attr("id").replace('Img','');
			$('.dynamicdiv'+id+idtr).remove();
			
			var slNo = 1; 
			 $('.slnoInventory'+idtr).each(function(){
				$(this).text(slNo);
				slNo = parseInt(slNo) + 1;
			});
		}
	 
	 
	 
	 function selectloadType()
		{
			debugger;
			var loadType = $("#loadBtnType").val();
			debugger;
			 if ($("#loadBtnType").val() == "Menu"){
			    	$("#loadMenu").css("display","block");
			    	$("#loadInventory").css("display","none");
			    
			 } else{
				 $("#loadMenu").css("display","none");
			     $("#loadInventory").css("display","block");
			 }
		}
	 
		function loadMenu(){
			
			debugger; //purpose:for checking internet conection
	 	var online = window.navigator.onLine;
	   	if(!online)
	   	{
	   	alert("check your internet connection,please try agian after some time");
	   	return;
	   	}
	   	var location = "";
    	if($("#outletLocation").length > 0)
    		location = $("#outletLocation").val();
    
    	if($("#outletLocation").val() == ""){
			$("#Error").html("Please select menu location");	
	         	return false;
		}
    	else{
    		$("#Error").html("");	
    	}
    	
	 		//var location = null;
	 		 var contextPath = $("#contextPath").val();
	 		 URL = contextPath + "/outletMaster/loadMenu.do";
	 		 $.ajax({
	 				type: "POST",
	 				url : URL,
	 				data : {
	 					location : location
	 				},
	 				beforeSend: function(xhr){                    
	 	   	   			$("#loadingmenu").css("display","block");
	 	   	   			$("#mainDiv").addClass("disabled");
	 	   	   		  },
	 				success : function(result) {
	 					 $("#right-side").html(result);
	 					$("#loadingmenu").css("display","none");
	 					$("#mainDiv").removeClass('disabled');
	 				},
	 				error : function() {
	 					 alert("something went wrong");
	 					 $("#loading").css("display","none");
	 		 			 $("#mainDiv").removeClass('disabled');
	 				}
	 			});
	 	}
		
		function loadInventory(){
			debugger; //purpose:for checking internet conection
	 	var online = window.navigator.onLine;
	   	if(!online)
	   	{
	   	alert("check your internet connection,please try agian after some time");
	   	return;
	   	}
	   	var location = "";
    	if($("#outletLocation").length > 0)
    		location = $("#outletLocation").val();
    	if($("#outletLocation").val() == ""){
			$("#Error").html("Please select Inventory location");	
	         	return false;
		}
    	else{
    		$("#Error").html("");	
    	}
	 		//var location = null;
	 		 var contextPath = $("#contextPath").val();
	 		 URL = contextPath + "/outletMaster/loadInventory.do";
	 		 $.ajax({
	 				type: "POST",
	 				url : URL,
	 				data : {
	 					location : location
	 				},
	 				beforeSend: function(xhr){                    
	 	   	   			$("#loadingInventory").css("display","block");
	 	   	   			$("#mainDiv").addClass("disabled");
	 	   	   		  },
	 				success : function(result) {
	 					 $("#right-side").html(result);
	 					$("#loadingInventory").css("display","none");
	 					$("#mainDiv").removeClass('disabled');
	 				},
	 				error : function() {
	 					 alert("something went wrong");
	 					 $("#loading").css("display","none");
	 		 			 $("#mainDiv").removeClass('disabled');
	 				}
	 			});
	 	}
	 
	 
	 function deleteItemManpower(element,idtr){
		 debugger;
			var id = $(element).attr("id").replace('Img','');
			$('.dynamicdiv'+id+idtr).remove();
			var slNo = 1; 
			 $('.slnomanPower').each(function(){
				$(this).text(slNo);
				slNo = parseInt(slNo) + 1;
			});
		}
	 
	 function deleteItemEquipment(element,idtr){
		 debugger;
			var id = $(element).attr("id").replace('Img','');
			$('.dynamicdiv'+id+idtr).remove();
			var slNo = 1; 
			 $('.slnoEquipment'+idtr).each(function(){
				$(this).text(slNo);
				slNo = parseInt(slNo) + 1;
			});
		}
	 
	 
	 function deletePayments(element){
			var id = $(element).attr("id").replace('Img','');
			$('#paymentList'+id).remove();
			
		}
	 
	 
	 
	 function createEventMenu(operation){
		 debugger;
		 try{
	 		   var online = window.navigator.onLine;
	 		   	if(!online)
	 		           {
	 		   	 alert("Check your internet connection,Please try agian after some time.");
	 		     	 return;
	 		          }
	 		   $("#ErrorMenu").html("");
	 		   $("#SuccessMenu").html("");
	 		   
	 	   debugger;
			 var contextPath = $("#contextPath").val();
			 
			 var formData={};
			 var menu_item_details = [],menuDetailsList = [], menuLocations = [],menu_category_details = [];
			 
			 
			 
			 if($("#eventMenuName").val() == ""){
				 $("#ErrorMenu").html("Enter Event Menu Name");
				 return;
			 }
			 
			 formData.menu_name= $("#eventMenuName").val();
			 formData.outlet_name= $("#outletLocation").val();
			
	         formData.menu_status = true;	
            
			 
			 if($("#eventreference").val()  == ""){
				 $("#ErrorMenu").html("Event Reference Id Required");
				 return;
			 }
			 
			 formData.eventReference= $("#eventreference").val();
			 formData.remarks= $("#eventremarks").val();
			 formData.operation = operation;
			 
            var locationobj = {store_location:$("#outletLocation").val(),menu_name:$("#eventMenuName").val()}
			 menuLocations.push(locationobj);       

			 var Addmenu =0;
			 $('.slno').each(function() {
				 Addmenu = Addmenu+1;
				  var idAttr= $(this).attr("id").replace('itemno','');
				  
				  var categoryName = $("#categoryMenu"+idAttr).val();
					if(categoryName == undefined || categoryName == null || categoryName == ""){
						categoryName = "All";
					}
				
					var obj = {unit_of_measurement:$("#uomMenu"+idAttr).val(),item_availability:$("#avlqtyMenu"+idAttr).val(),qty:$("#qtyMenu"+idAttr).val(),sku_id:$("#skuID"+idAttr).text(),pluCode:$("#pluCodeMenu"+idAttr).val(),pluCode:$("#pluCodeMenu"+idAttr).val(),item_icon:$("#imgMenu"+idAttr).val(),item_picture1:$("#pic1Menu"+idAttr).val(),item_picture2:$("#pic2Menu"+idAttr).val(),item_desc:$("#description"+idAttr).text(),menu_item_id:parseInt($("#skuID"+idAttr).text()),menu_name:$("#eventMenuName").val(),mrp:parseFloat($("#posPrice"+idAttr).text()),unit_price:parseFloat($("#salePrice"+idAttr).text()),category_name:categoryName,measureRange:$("#measuremrntRange"+idAttr).text(),utility: $("#utility"+idAttr).text(),department: $("#department"+idAttr).text()};
					menu_item_details.push(obj);
					
					
					var categoryobj  = {category_name:categoryName,menu_name:$("#eventMenuName").val(),category_desc:categoryName}	
					menu_category_details.push(categoryobj);
			 
			 });
			 
			 if(Addmenu == 0 ){
				 $("#ErrorMenu").html("Add Atleast One Menu Item."); 
				 return false;
			 }
			// menuDetailsList.push({"menu_item_details":menu_item_details});
			 formData.menu_item_details = menu_item_details;
			 formData.menuLocations = menuLocations;
			 formData.menu_category_details = menu_category_details;
			 
			 formData = JSON.stringify(formData);
             console.log(formData);
				 
			if(operation == "new") 
	   	 URL = contextPath + "/outletMaster/createEventManagementMenu.do";	
			else
		URL = contextPath + "/outletMaster/updateEventManagementMenu.do";		
			$.ajax({
	   	  type: "POST",
			  url : URL,
			 //contentType: "application/json",
	  			data : {
	  				formData : formData,
	  			},
	  			beforeSend: function(xhr){                    
		   				$("#loading").css("display","block");
		   				$("#mainDiv").addClass("disabled");
		        },

	  			success : function(result) {
	   			 $("#right-side").html(result);
	   			 
	   			
	   			 
	   				$('#tab_2_Menu').trigger('click');
	   			
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
	 
		function validatePersonalMobileNumber()
	    	{
			debugger;
			    $("#Error").html("");
	 		   $("#Success").html("");
	    		var phoneNumber1 = $("#phone").val();
	    		var phoneNumber2 = $("#phoneODC").val();
	    		if(phoneNumber1!=""){
	      if (phoneNumber1.length != 10) {
	     		
	    			$("#Error").html("Sorry, Customer Phone No. is not valid, Please Enter Your Working 10 Digit Phone No.");
	    			return false;
	    			}
	    		
	    	}
	    		
	    		if(phoneNumber2!=""){}
	    		if(phoneNumber2.length != 10){
		    		
		    			$("#Error").html("Sorry, ODC Phone No. is not valid, Please Enter Your Working 10 Digit Phone No.");
		    			return false;
		    		
		    		
		    	
	    	}
	    	}
		
		$("#emailODC").blur(function(){
			$("#Error").html("");
	 		   $("#Success").html("");
			 var email = $("#emailId").val();
		  	  if(email==""){
		  		 return false;
		  	  }
			  if(!emailValidation(email)){
			   	$("#Error").html("Invalid EmailId (Ex:abc@gmail.com)");
			   	return false;
			  }
			  else{
				$("#Error").html("");
			    return true;
			  }
		});
		$("#Custemail").blur(function(){
			 var email = $("#Custemail").val();
		  	  if(email==""){
		  		 return false;
		  	  }
			  if(!emailValidation(email)){
			   	$("#Error").html("Invalid EmailId (Ex:abc@gmail.com)");
			   	return false;
			  }
			  else{
				$("#Error").html("");
			    return true;
			  }
		});
		
		
	 	function initAutocomplete() {
	 		debugger;
	  		 var input = document.getElementById('googlemapODC');
	          var searchBox = new google.maps.places.SearchBox(input);
	          searchBox.addListener('places_changed', function() {
	          var places = searchBox.getPlaces();
	          if (places.length == 0) {
	            return;
	          }
	          })
	 	}
	 	
	 	
	 	$("#plotNoODC").blur(function(){
	 		$("#Error").html("");
	 		   $("#Success").html("");
			 var ODCPlot = $("#plotNoODC").val();
		  	  if(ODCPlot==""){
		  		 return false;
		  	  }
			  if(ODCPlot.length > 30){
			   	$("#Error").html("ODC plot number can't be more than 30 Char");
			   	return false;
			  }
			  else{
				$("#Error").html("");
			    return true;
			  }
		});
	 	
	 	

	 	
	 	function viewEditEventManagement(eventid,operation){
	 		
	 		 debugger;
			 try{
		 		   var online = window.navigator.onLine;
		 		   	if(!online)
		 		           {
		 		   	 alert("Check your internet connection,Please try agian after some time.");
		 		     	 return;
		 		          }

		 	   debugger;
				 var contextPath = $("#contextPath").val();
				
				 
		   	 URL = contextPath + "/outletMaster/editViewEventManagement.do";
		   	 $.ajax({
		   	  type: "POST",
				  url : URL,
		  			data : {
		  				eventid : eventid,
		  				operation : operation
		  				
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
	  	
	 	
	 	function openDoc(id){
	 		debugger;
	 		
	 		var anchor = document.createElement('a');
	 		if(id=="1"){
				anchor.href = $("#signature_refIdLoad").val();
	 		}else if(id=="2"){
	 			anchor.href = $("#signature1_refIdLoad").val();
	 		}else{
	 			anchor.href = $("#signature2_refIdLoad").val();
	 		}
				anchor.target = '_blank';
				anchor.download = '';
				anchor.click();
	 		
	 		
	 		
	 	}
	 	
	 	
	 	var countTest = 0;
	 	var paymentListtypesList=[];
	 	
	 	var len = 0;
	 	
	 	function appendPayments(paymentMode){
	 		
	 		debugger;
	 		
	 		var saleType = $("#saleType").val();
	 		
	 		if(saleType == "Total Credit"){
	 			 $("#Error").html("Sale Type is Total Credit,So no payments Needed");
	 		}else{
		
		if($("#paymentMode").val() == ""){
			$("#Error").html("Please select Payment Mode");	
	 			$("#paymentMode").focus();
			return false;
		}
	 			
	 		var paymrntamount = parseFloat($("#amount").val());
	 	if( paymrntamount > 0.0){
	 			
			 $('.paymentMode').each(function() {
				var lenList = len+1;
				var editpayments =  $("#paymentModesAdded"+lenList).val();
				 paymentListtypesList[len] = editpayments;
				 len=len+1;

			 });
	 		debugger;
	 		countTest = countTest + 1;
	 		var paymentMode = $("#paymentMode").val();
	 		
	 		paymentMode = paymentMode.split("-");
	 		var paymentModeUsed = paymentMode[2];
	 		var paymentModetype = paymentMode[0];
	 		var cardType = paymentMode[1];
	 		var tenderKey = paymentMode[3];
	 		
	 		var duplicateCount = 0;
	 		
	 		 $('.paymentList').each(function() {
					
				  var idAttr= $(this).attr("id").replace('paymentList','');
				  
				  var modePaymentDuplicate = $("#paymentModesAdded"+idAttr).val();
				  
				  if(modePaymentDuplicate == paymentModetype){
					  $("#Error").html("Payment Mode already Added.");
		 				duplicateCount = duplicateCount+1;
		 			
		 			}
				  
				 
			 });
	 		
	 		
	 		 
	 		 if(duplicateCount > 0){
	 			return false; 
	 		 }
	 		
	 		
	 		var amount = parseFloat($("#amount").val());
	 		len = len + 1;
	 		countpayment = len;
	 		
	 		 var priceListDiv = '<div class=paymentList id=paymentList'+countpayment+' style=height:35px></div>';
	 		 var currentPriceListDivContent = $('#paymentListPaymentModeNone').html();
	 		 currentPriceListDivContent = currentPriceListDivContent.replace(/PaymentModeNone/g,countpayment);
	 		 $("div ."+'paymentListsData').append(priceListDiv);
	 		 $("#paymentList"+countpayment).html(currentPriceListDivContent);
	 		 
	 		if(cardType == "cheque" || cardType =="Cheque"){
	 		 $("#chequeBased"+countpayment).css("display","block");
	 		 $("#chequeBasedbank"+countpayment).css("display","block");
	 		
	 		}else{
	 		 $("#chequeBased"+countpayment).css("display","none");
	 		 $("#chequeBasedbank"+countpayment).css("display","none");
	 		}
	 		
	 		 $("#paymentModesAdded"+countpayment).val(paymentModetype);
	 		$("#amounts"+countpayment).val(amount);
	 		$("#cardTypes"+countpayment).val(cardType);
	 		$("#tenderKeys"+countpayment).val(tenderKey);
	 		$("#tenderCodes"+countpayment).val(paymentModeUsed);
	 		$("#amount").val("0.0");
	 		$("#paymentMode").val("")
	 		
	 		
	 		paymentListtypesList[countTest] = paymentModetype;
	 		}else{
	 			$("#Error").html("Please  Enter Amount");	
	 			$("#amount").focus();
			return false;
	 			
	 		}	
	 		}
	 	}
	 	
	 	
	 	
	 	
	 	
	 	function appendSkuDetailsForInventory(skuDetails,type){
			debugger;
			 var parsedJson = jQuery.parseJSON(skuDetails);
			 
				skuList = parsedJson.priceList;
				skuList[0].uom = parsedJson.UOM;
				skuList[0].packSize = parsedJson.packSize;
				skuList[0].description = parsedJson.description;
				
				if(parsedJson.tax != null )
			skuList[0].tax = parsedJson.tax;
				
					addSku(skuList[0],type);
				
		}
	 	
		 
		 function createEventInventory(operation){
			 debugger;
			 try{
		 		   var online = window.navigator.onLine;
		 		   	if(!online)
		 		           {
		 		   	 alert("Check your internet connection,Please try agian after some time.");
		 		     	 return;
		 		          }
		 		   	
		 		   $("#ErrorInventory").html("");
		 		   $("#SuccessInventory").html("");

		 	   debugger;
				 var contextPath = $("#contextPath").val();
				 
				 var formData={};
				 var eventInventoryIssueDetails = [];
				 
				var SubmittionCount =$("#SubmittionCount").val();
				
				 
				 if($("#eventrefInventory").val()  == ""){
					 $("#ErrorInventory").html("Event Reference Id Required");
					 return;
				 }
			     formData.submissionCount= SubmittionCount;
				 formData.eventReference= $("#eventrefInventory").val();
				 formData.outletStoreLocation= $("#outletInventory").val();
				 formData.operation = operation;
				 
				 var duplicateCount = 0;
				 var AddInventory = 0;
			
			var countsub = 0
			
			 $('.slnoInventory'+SubmittionCount).each(function() {
				countsub = countsub+1;
				 });
			if(countsub ==0){
				  $("#ErrorInventory"+SubmittionCount).html("Please Add atleast One Item."); 
		return;
		}
				
				
				 for(var  i = 1;i<11;i++){
	           
				 $('.slnoInventory'+i).each(function() {
					 AddInventory = AddInventory+1;
					 
					 if($("#DateInventory"+SubmittionCount).val() == ""){
						 $("#ErrorInventory"+SubmittionCount).html("Select Date");
						
						 duplicateCount = duplicateCount+1
						 return false;
					 }
					 
					 var dateTime = getCurrentDate();
			    	  var date = dateTime.split(' ');
			    	  date = date[0].split('/');
			    	  var formatedDate = date[1]+"/"+date[0]+"/"+date[2];
					 
					 if(SubmittionCount == i ){
				
			    	  if($("#DateInventory"+SubmittionCount).val() == ""){
				         $("#ErrorInventory"+SubmittionCount).html("Select Date");
			    		  
			    	  }else{
			           var noOfDaysInv = daydiff(parseDate(formatedDate), parseDate($("#DateInventory"+i).val()));
			    	  if(noOfDaysInv < -1){
			    		  
			    		  $("#ErrorInventory"+SubmittionCount).html("Past date is not allowed. Inventory can not issued on past date."); 
			    		  duplicateCount = duplicateCount+1;
			    		  return false;
			    	  }
			    	  }
                      }
					 
					 
					  var idAttr= $(this).attr("id").replace('itemno','');
					  
					  if($("#transferqtyInventory"+i+idAttr).text() == "" || $("#transferqtyInventory"+i+idAttr).text() == "0"){
			               $("#ErrorInventory"+SubmittionCount).html("Please Enter Valid Quantity aganist Inventory"); 
			               $("#transferqtyInventory"+i+idAttr).focus();
			               duplicateCount = duplicateCount+1;
			               return false;
					  }
			
			
			
			var price = $("#saleprice"+i+idAttr).text();
			var tax_value = $("#taxvalue"+i+idAttr).text();
			var cgst = $("#cgsttaxvalue"+i+idAttr).text();
			var sgst = $("#sgsttaxvalue"+i+idAttr).text();
			
			if(price == "0" || price == ""){
				price = 0;
			}
			if(tax_value == "0" || tax_value == ""){
				tax_value = 0;
			}
			if(cgst == "0" || cgst == ""){
				cgst = 0;
			}
			if(sgst == "0" || sgst == ""){
				sgst = 0;
			}
			
			
			
					  
						var obj = {eventReference:$("#eventrefInventory").val(),itemCode:$("#skuIDInventory"+i+idAttr).text(),item_description:$("#skuNameInventory"+i+idAttr).text(),uom:$("#uomInventory"+i+idAttr).text(),size:$("#sizeInventory"+i+idAttr).text(),quantity:$("#transferqtyInventory"+i+idAttr).text(),location :$("#outletInventory").val(),submissionCount:i,createdDateStr:$("#DateInventory"+i).val(),taxCode:$("#taxCategory"+i+idAttr).text(),price:price,tax_value:tax_value,cgst:cgst,sgst:sgst};
						eventInventoryIssueDetails.push(obj);
					
				 });
				 }
				 
				 
				 if(duplicateCount > 0 ){
					 return false;
				 }
				 
				 if(AddInventory == 0 ){
					 $("#ErrorInventory"+SubmittionCount).html("Add Atleast One Item."); 
					 return false;
				 }
				 
				 
				
				 formData.eventInventoryIssueDetails = eventInventoryIssueDetails;
				 
				 formData = JSON.stringify(formData);
	             console.log(formData);
					 
				if(operation == "new") 
		   	 URL = contextPath + "/outletMaster/createEventManagementInventory.do";	
				else
			URL = contextPath + "/outletMaster/updateEventManagementInventory.do";		
				$.ajax({
		   	  type: "POST",
				  url : URL,
				 //contentType: "application/json",
		  			data : {
		  				formData : formData,
		  			},
		  			beforeSend: function(xhr){                    
			   				$("#loading").css("display","block");
			   				$("#mainDiv").addClass("disabled");
			        },

		  			success : function(result) {
		   			 $("#right-side").html(result);
		   			 
		   				$('#tab_3_Iventory').trigger('click');
		   			
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
		 
		 

		 function searchEmployee(name, searchCategory){
		 	 //purpose:for checking internet conection
		 	var online = window.navigator.onLine;
		   	if(!online)
		   	{
		   	alert("check your internet connection,please try agian after some time");
		   	return;
		   	}
		 		var location = null;
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
				debugger
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
				 debugger;
			    var id= $(element).attr("id");
				viewEmployee(id, type);				
			 }
			 
			 	 
			

			 function viewEmployee(name, searchCategory){
			 	 //purpose:for checking internet conection
			 	var online = window.navigator.onLine;
			   	if(!online)
			   	{
			   	alert("check your internet connection,please try agian after some time");
			   	return;
			   	}
			 		var location = null;
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
			 					appendEmployeedata(result, searchCategory);
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
			 
			 
			 
			 
			 
			
			 

				function appendEmployeedata(empDetails,type){
					console.log(empDetails);
					debugger;
					 
							addEmp(empDetails[0],type);
				}
			 
			 
			 

			 function addEmp(emp,type){
				 debugger;
				 var contextPath = $("#contextPath").val();
			 var SubmittionCountEmp = $("#SubmittionCountEmp").val();
			
			
			
				 $("#ErrorEmp"+SubmittionCountEmp).html("");
				 $("#SuccessEmp"+SubmittionCountEmp).html("Employee Already Added.");
				 
				 
				 idAttr = parseInt(type.replace('eventmanPower',''));
				
				 var len = parseInt($("#eventManpower"+idAttr+" tr").length);
					if (len != 1)
						len = parseInt($("#eventManpower"+idAttr+" tr:last").attr("id").replace('dynamicdiv', '')) + 1;
				
						debugger;
						
						
						for(var j = 1; j<=len;j++){
							
							var addedEmpid = $("#empID"+idAttr+j).text();
							if(addedEmpid == undefined || addedEmpid == null ){
								addedEmpid = "";
							}
							$("#ErrorEmp"+SubmittionCountEmp).html("");
							$("#SuccessEmp"+SubmittionCountEmp).html("");
							
							if(addedEmpid == emp.employeeCode){
								
								$("#ErrorEmp"+SubmittionCountEmp).html("Employee Already Added.");
								return false;
							}
							
							 if($("#DateEmp"+idAttr).val() ==""){
								 $("#ErrorEmp"+SubmittionCountEmp).html("Please Select Date."); 
								 return false;
							 }
							 
							
							var noOfDaysInv = daydiff(parseDate($("#DateEmp"+idAttr).val()), parseDate($("#Eventstart").val()));
					    	  if(noOfDaysInv > 1){
					    		  
					    		  $("#ErrorEmp"+SubmittionCountEmp).html("Man power can be issued One Day only Before  Event Start Date."); 
					    		
					    		  return false;
					    	  }
					    	  
					    	  var noOfDaysEmpEnd = daydiff(parseDate($("#DateEmp"+idAttr).val()), parseDate($("#EventEnd").val()));
					    	  if(noOfDaysEmpEnd < 0){
					    		  
					    		  $("#ErrorEmp"+SubmittionCountEmp).html("Man power can not issued After Event End Date."); 
					    		
					    		  return false;
					    	  }
					    	  
					    	  
					    	  
					    	 /* var noOfDaysInvafterapproved = daydiff(parseDate($("#updateddtaeStr").val()), parseDate($("#Eventstart").val()));
								
								 if(noOfDaysInv > noOfDaysInvafterapproved || noOfDaysInv == 0){
						    		  
						    		  $("#ErrorEmp").html("Employee can be Assigned between Event Approved Date And Start Date."); 
						    		
						    		  return false;
						    	  }*/
							
						}
					
					
					var slNo = 1; 
						 $('.slnomanPower'+idAttr).each(function(){
							$(this).text(slNo);
							slNo = parseInt(slNo) + 1;
						});
					
						var row = "<tr id='dynamicdiv"+len+"' class='dynamicdiv"+len+idAttr+"' style='margin-top:5px;'><td class='slnomanPower"+idAttr+"' id='itemno"+len+"'>"+slNo+"</td><td id='empID"+idAttr+len+"'>"+emp.employeeCode+"</td>" +
						"<td id='empName"+idAttr+len+"'>"+emp.firstName+"</td>" +
						"<input type='hidden' id='empEmail"+idAttr+len+"' value='"+emp.email+"'/>" +
						"<td id='empRole"+idAttr+len+"'>"+emp.roleName+"</td>" +
						"<td id='empDOJ"+idAttr+len+"'>"+emp.dateOfJoingingStr+"</td>" +
						"<td id='empLocation"+idAttr+len+"'>"+emp.location+"</td>" +
						"<td id='empphone"+idAttr+len+"'>"+emp.phonuNum+"</td>" +
						"<td id='Del"+idAttr+len+"'>" +
						"<img id='Img"+len+"' src='"+contextPath+"/images/itemdelete.png' style='width:20%;cursor:pointer;' onclick='deleteItemManpower(this,"+idAttr+");' title='Delete "+emp.employeeCode+"'/></td></tr>";
									$("#eventManpower"+idAttr+" tbody").append(row);
				
				
			}
			 
			 
			 function createEventManpower(operation){
				 debugger;
				 try{
			 		   var online = window.navigator.onLine;
			 		   	if(!online)
			 		           {
			 		   	 alert("Check your internet connection,Please try agian after some time.");
			 		     	 return;
			 		          }
			 		   	 var SubmittionCountEmp = $("#SubmittionCountEmp").val();
		
			 		   $("#ErrorEmp"+SubmittionCountEmp).html("");
			 		   $("#SuccessEmp"+SubmittionCountEmp).html("");

			 	   debugger;
					 var contextPath = $("#contextPath").val();
					 
					 var formData={};
					 var EventManPowerDetails = [];
					 
					 
					 if($("#eventrefEmp").val()  == ""){
						 $("#ErrorEmp"+SubmittionCountEmp).html("Event Reference Id Required");
						 return;
					 }
				
				     formData.submissionCount =SubmittionCountEmp;
					 formData.eventReference= $("#eventrefEmp").val();
					 formData.outletStoreLocation= $("#outletEmp").val();
					 formData.operation = operation;
					 
					 var duplicateCount = 0;
					 var AddManpower = 0;
				
				
				
				
				var countsub = 0
			
			 $('.slnomanPower'+SubmittionCountEmp).each(function() {
				countsub = countsub+1;
				 });
			if(countsub ==0){
				  $("#ErrorEmp"+SubmittionCountEmp).html("Please Add atleast One Item."); 
		return;
		}
				
					 
					 for(var  i = 1;i<11;i++){

					 $('.slnomanPower'+i).each(function() {
						 
						 AddManpower = AddManpower+1;
						 
						 if($("#DateEmp"+i).val() == ""){
							 $("#ErrorEmp"+SubmittionCountEmp).html("Select Date");
							 
							 duplicateCount = duplicateCount+1;
							 return false;
						 }
						 
						 var dateTime = getCurrentDate();
				    	  var date = dateTime.split(' ');
				    	  date = date[0].split('/');
				    	  var formatedDate = date[1]+"/"+date[0]+"/"+date[2];


                                if(SubmittionCountEmp == i ){
				    	  if($("#DateEmp"+SubmittionCountEmp).val() == ""){
				    		   $("#ErrorEmp"+SubmittionCountEmp).html("Select Date");
				    	  }else{
						     var noOfDaysEmpl = daydiff(parseDate(formatedDate), parseDate($("#DateEmp"+i).val()));
 
				    	  if(noOfDaysEmpl < -1){
				    		  $("#ErrorEmp"+SubmittionCountEmp).html("Past date is not allowed. Employee can not issued on past date."); 
				    		  duplicateCount = duplicateCount+1;
				    		  return false;
				    	  }
				    	  }
}
						 
						 
						  var idAttr= $(this).attr("id").replace('itemno','');
						
						  var obj = {eventReference:$("#eventrefEmp").val(),employeeId:$("#empID"+i+idAttr).text(),employeeName:$("#empName"+i+idAttr).text(),employeeRole:$("#empRole"+idAttr).text(),employerContactNumber:$("#empphone"+i+idAttr).text(),employerEmail:$("#empEmail"+i+idAttr).text(),storeLocation :$("#empLocation"+i+idAttr).text(),dateOfJoiningStr :$("#empDOJ"+i+idAttr).text(),createdDateStr :$("#DateEmp"+i).val(),submissionCount:i};
							EventManPowerDetails.push(obj);
						
					 });
					 }
					 if(duplicateCount > 0 ){
						 return false;
					 }
					 if(AddManpower == 0 ){
						 $("#ErrorEmp"+SubmittionCountEmp).html("Add Atleast One Employee."); 
						 return false;
					 }

					 formData.EventManPowerDetails = EventManPowerDetails;
					 
					 formData = JSON.stringify(formData);
		             console.log(formData);
						 
					if(operation == "new") 
			   	 URL = contextPath + "/outletMaster/createEventManagementManpower.do";	
					else
				URL = contextPath + "/outletMaster/updateEventManagementManpower.do";		
					$.ajax({
			   	  type: "POST",
					  url : URL,
					 //contentType: "application/json",
			  			data : {
			  				formData : formData,
			  			},
			  			beforeSend: function(xhr){                    
				   				$("#loading").css("display","block");
				   				$("#mainDiv").addClass("disabled");
				        },

			  			success : function(result) {
			   			 $("#right-side").html(result);
			   			 
			   			
			   				$('#tab_5_Manpower').trigger('click');
			   			
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
			 
			 
			 

				function searchEventEquipment(name, searchCategory){
					debugger;
					 //purpose:for checking internet conection
					var online = window.navigator.onLine;
				  	if(!online)
				  	{
				  	alert("check your internet connection,please try agian after some time");
				  	return;
				  	}
					var storeLocation = $("#outletLocation").val();
					
					
						var contextPath = $("#contextPath").val();
						
							URL = contextPath + "/outletMaster/searchEquipment.do";
						
						 $.ajax({
				    			type: "GET",
				    			url : URL,
				    			data : {
				    				searchName : name,
				    				storeLocation : storeLocation,
				    				searchCategory : searchCategory
				    			},
				    			beforeSend: function(xhr){                    
				 	   	   			$("#loading").css("display","block");
				 	   	   			$("#mainDiv").addClass("disabled");
				 	   	   		  },
				    			success : function(result) {
				            		appendEquipment(result, searchCategory);
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


				function appendEquipment(productsList, searchCategory){
					debugger;
					 $("."+searchCategory).html('');
					 var op = '';
					
						 for(var i=0;i<productsList.length;i++){
							
								 if (i == 0) {
									 op += '<li id="'+productsList[i].machineEquipmentId+'"   onclick=getIdEquipment(this,"'+searchCategory+'"); ><a><label style="width: 10%;">'+productsList[i].machineEquipmentId+'</label> &nbsp &nbsp &nbsp &nbsp   <label style="width: 30%;">'+productsList[i].machineEquipmentName+' </label>  &nbsp &nbsp </a></li>';
								}else
									 op += '<li id="'+productsList[i].machineEquipmentId+'"   onclick=getIdEquipment(this,"'+searchCategory+'"); ><a><label style="width: 10%;">'+productsList[i].machineEquipmentId+'</label> &nbsp &nbsp &nbsp &nbsp   <label style="width: 30%;">'+productsList[i].machineEquipmentName+' </label>  &nbsp &nbsp </a></li>';
							
						 } 
					
					
					 
					 $("."+searchCategory).html(op);
					 $("."+searchCategory).show();
					 
				}

				function getIdEquipment(element,type){
					var id= $(element).attr("id");
					
					
					getEquipmentDetails(id,type);
					
						 $(".services").hide();
						 $("."+type).html("");
					
				}
				function getEquipmentDetails(equipmentID,type){
					debugger;
					 //purpose:for checking internet conection
					var online = window.navigator.onLine;
				  	if(!online)
				  	{
				  	alert("check your internet connection,please try agian after some time");
				  	return;
				  	}
					var storeLocation = $("#outletLocation").val();
					
					
						var contextPath = $("#contextPath").val();
						
							URL = contextPath + "/outletMaster/searchEquipment.do";
						
						 $.ajax({
				    			type: "GET",
				    			url : URL,
				    			data : {
				    				searchName : equipmentID,
				    				storeLocation : storeLocation,
				    				searchCategory : type
				    			},
				    			beforeSend: function(xhr){                    
				 	   	   			$("#loading").css("display","block");
				 	   	   			$("#mainDiv").addClass("disabled");
				 	   	   		  },
				    			success : function(result) {
				            		appendEquipmentDetails(result, type);
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


				function appendEquipmentDetails(EqipmentDetails,type){
					debugger;
					
							addEquipment(EqipmentDetails[0],type);
						
				}
				
				 function addEquipment(equipment,type){
					 debugger;
					 var contextPath = $("#contextPath").val();
				 var SubmittionCountEquip = $("#SubmittionCountEquip").val();
				
				
					 
					 $("#ErrorEquipment"+SubmittionCountEquip).html("");
					 $("#SuccessEquipment"+SubmittionCountEquip).html("");
					 
					 idAttr = parseInt(type.replace('eventEquipment',''));
					 var len = parseInt($("#EventEquipment"+idAttr+" tr").length);
						if (len != 1)
							len = parseInt($("#EventEquipment"+idAttr+" tr:last").attr("id").replace('dynamicdiv', '')) + 1;
						
						
						debugger;
						
						
						for(var j = 1; j<=len;j++){
							
							var addedSkuid = $("#EqipID"+idAttr+j).text();
							if(addedSkuid == undefined || addedSkuid == null ){
								addedSkuid = "";
							}
							
							if(addedSkuid == equipment.machineEquipmentId){
								
								$("#ErrorEquipment"+SubmittionCountEquip).html("Equipment Already Added.");
								return false;
							}
							
							

							 if($("#EventstartEquipment"+idAttr).val() ==""){
								 $("#ErrorEquipment"+SubmittionCountEquip).html("Please Select Date.");
								 return false;
							 }
							 
							
							 var noOfDaysInv = daydiff(parseDate($("#EventstartEquipment"+idAttr).val()), parseDate($("#Eventstart").val()));
					    	   if(noOfDaysInv > 1){
					    		  
					    		  $("#ErrorEquipment"+SubmittionCountEquip).html("Equipment can be issued One Day only Before Event Start Date."); 
					    		
					    		  return false;
					    	  }
					    	  
					    	  var noOfDaysInvEnd = daydiff(parseDate($("#EventstartEquipment"+idAttr).val()), parseDate($("#EventEnd").val()));
					    	  if(noOfDaysInvEnd < 0){
					    		  
					    		  $("#ErrorEquipment"+SubmittionCountEquip).html("Equipment can not issued After Event End Date."); 
					    		
					    		  return false;
					    	  }
					    	  
					    	  
					    	  
					    	  
					    	 /* var noOfDaysInvafterapproved = daydiff(parseDate($("#updateddtaeStr").val()), parseDate($("#Eventstart").val()));
								
								 if(noOfDaysInv > noOfDaysInvafterapproved || noOfDaysInv == 0){
						    		  
						    		  $("#ErrorEquipment").html("Equipment can be issued between Event Approved Date And Start Date."); 
						    		
						    		  return false;
						    	  }*/
							
						}
						
						
						var slNo = 1; 
							 $('.slnoEquipment'+idAttr).each(function(){
								$(this).text(slNo);
								slNo = parseInt(slNo) + 1;
							});
						
							var row = "<tr id='dynamicdiv"+len+"' class='dynamicdiv"+len+idAttr+"' style='margin-top:5px;'><td class='slnoEquipment"+idAttr+"' id='itemno"+len+"'>"+slNo+"</td><td id='EqipID"+idAttr+len+"'>"+equipment.machineEquipmentId+"</td>" +
							"<td id='descEqip"+idAttr+len+"'>"+equipment.description+"</td>" +
							"<td id='qtyEqip"+idAttr+len+"' contenteditable='true'>1</td>" +
							"<td id='Del"+idAttr+len+"'>" +
							"<img id='Img"+len+"' src='"+contextPath+"/images/itemdelete.png' style='width:15%;cursor:pointer;' onclick='deleteItemEquipment(this,"+idAttr+");' title='Delete "+equipment.skuId+"'/></td></tr>";
										$("#EventEquipment"+idAttr+" tbody").append(row);
					
					
				}
				 

				
				 function deleteItem(element){
					 debugger;
						var id = $(element).attr("id").replace('Img','');
						$('#dynamicdiv'+id).remove();
						var slNo = 1; 
						 $('.slno').each(function(){
							$(this).text(slNo);
							slNo = parseInt(slNo) + 1;
						});
					}
				 
				 
				 

				 function createEventEquipment(operation){
					 debugger;
					 try{
				 		   var online = window.navigator.onLine;
				 		   	if(!online)
				 		           {
				 		   	 alert("Check your internet connection,Please try agian after some time.");
				 		     	 return;
				 		          }
				 		   	
				 		   $("#ErrorEquipment").html("");
				 		   $("#SuccessEquipment").html("");

				 	   debugger;
						 var contextPath = $("#contextPath").val();
					 var SubmittionCountEquip = $("#SubmittionCountEquip").val();
					
					
						 
						 var formData={};
						 var eventEquipmentDetails = [];
						 
						 if($("#EventstartEquipment").val() == ""){
							 $("#ErrorEquipment"+SubmittionCountEquip).html("Select Date");
							 return;
						 }
					
					     formData.submissionCount =SubmittionCountEquip;
						 formData.createdDateStr= $("#EventstartEquipment").val();
						 
						 if($("#eventrefEquipment").val()  == ""){
							 $("#ErrorEquipment"+SubmittionCountEquip).html("Event Reference Id Required");
							 return;
						 }
						 formData.outletStoreLocation= $("#outletEquipment").val();
						 formData.operation = operation;
						 
						 formData.eventReference= $("#eventrefEquipment").val();
						 
						 var duplicateCount = 0;
						 var AddEquipment = 0;
					
					var countsub = 0;
					
					 $('.slnoEquipment'+SubmittionCountEquip).each(function() {
				countsub = countsub+1;
				 });
			if(countsub ==0){
				  $("#ErrorEquipment"+SubmittionCountEquip).html("Please Add atleast One Item."); 
		return;
		}
					
						 
						 for(var  i = 1;i<11;i++){
						 $('.slnoEquipment'+i).each(function() {
							 
							 AddEquipment = AddEquipment+1;
						
						 if(SubmittionCountEquip == i){
						
							 if($("#EventstartEquipment"+i).val() == ""){
								 
							$("#ErrorEquipment"+SubmittionCountEquip).html("Select Date");
							
							AddEquipment = AddEquipment+1;
							return false;
												 }
												 
												 var dateTime = getCurrentDate();
										    	  var date = dateTime.split(' ');
										    	  date = date[0].split('/');
										    	  var formatedDate = date[1]+"/"+date[0]+"/"+date[2];
												 
										    	 										    	  
										    	  if($("#EventstartEquipment"+i).val() == ""){
											
											$("#ErrorEquipment"+SubmittionCountEquip).html("Select Date");
										    		  
										    	  }else{
												     var noOfDaysEqu = daydiff(parseDate(formatedDate), parseDate($("#EventstartEquipment"+i).val()));
 
										    	  if(noOfDaysEqu < -1){
								
										    		  $("#ErrorEquipment"+SubmittionCountEquip).html("Past date is not allowed. Equipment can not issued on past date."); 
										    		  duplicateCount = duplicateCount+1;
										    		  return false;
										    	  }
										    	  }
					}
												 

							  var idAttr= $(this).attr("id").replace('itemno','');
							  
							  if($("#qtyEqip"+i+idAttr).text() == "" || $("#qtyEqip"+i+idAttr).text() == "0"){
					               $("#ErrorEquipment"+SubmittionCountEquip).html("Please Enter Valid Quantity aganist Equipment"); 
					               $("#qtyEqip"+i+idAttr).focus();
					               duplicateCount = duplicateCount+1;
					               return false;
							  }
							  
							  
							
								var obj = {equipmentId:$("#EqipID"+i+idAttr).text(),equipmentName:$("#descEqip"+i+idAttr).text(),eventReference:$("#eventrefEquipment").val(),equipmentQuantity :$("#qtyEqip"+i+idAttr).text(),createDateStr :$("#EventstartEquipment"+i).val(),submissionCount:i};
								eventEquipmentDetails.push(obj);
							
						 });
						 }
						 if(duplicateCount > 0 ){
							 return false;
						 }
						 if(AddEquipment == 0 ){
							 $("#ErrorEquipment"+SubmittionCountEquip).html("Add Atleast One Equipment."); 
							 return false;
						 }
						 

						
						 formData.eventEquipmentDetails = eventEquipmentDetails;
						 
						 formData = JSON.stringify(formData);
			             console.log(formData);
							 
						if(operation == "new") 
				   	 URL = contextPath + "/outletMaster/createEventManagementEquipment.do";	
						else
					URL = contextPath + "/outletMaster/updateEventManagementEquipment.do";		
						$.ajax({
				   	  type: "POST",
						  url : URL,
						 //contentType: "application/json",
				  			data : {
				  				formData : formData,
				  			},
				  			beforeSend: function(xhr){                    
					   				$("#loading").css("display","block");
					   				$("#mainDiv").addClass("disabled");
					        },

				  			success : function(result) {
				   			 $("#right-side").html(result);
				   			 
				   			
				   			
				   				$('#tab_4_Eqipment').trigger('click');
				   			
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
				 
				 var listInventory = [];
				 var limitation;
				 
				 listInventory.push("1")
				  var listEquipment = [];
				 
				 listEquipment.push("1")
				   var listManPower = [];
				 
				 listManPower.push("1")
				 
				 
				 function appendEventManpower(id,date){
						
						debugger;
						
						for(var i = 1; i<11;i++){
						     $("#"+id+"Emp").addClass("activeBlock");
							if(id != i){
							 $("#"+i+"Emp").removeClass('activeBlock');
		                     $("#ErrorEmp"+i).html("");
					         $("#SuccessEmp"+i).html("");
		                     $("#ErrorEmp"+i).html("");
					         $("#SuccessEmp"+i).html("");
		                     $("#ErrorEmp"+i).html("");
					         $("#SuccessEmp"+i).html("");
		                       }
		                    
							$("#SubmittionCountEmp").val(id);
							
								
								 
								}
								
								 $(".eventManpowerList").each(function(){
									 $(this).css("display","none");
								 });
								
								 $("#manPowermulSubmition"+id).css("display","block");
								 
							
								
							}	
							
							
							
					 function loadmoreEmp(){
							debugger;
							for(var i = 5; i<11;i++){
							 $("#"+i+"Emp").css("display","block");
						     $("#loadmores").css("display","none");
		                      $("#loadlesss").css("display","block");
						
							} 
							}
					 
					 function loadlessEmp(){
							debugger;
							for(var i = 5; i<11;i++){
							 $("#"+i+"Emp").css("display","none");
						     $("#loadmores").css("display","block");
		                     $("#loadlesss").css("display","none");
						
							} 
							}
					
				 
				 
				 function appendEventEquipment(id,date){
						
					debugger;
						
						for(var i = 1; i<11;i++){
						     $("#"+id+"Eqip").addClass("activeBlock");
							if(id != i){
							 $("#"+i+"Eqip").removeClass('activeBlock');
							 $("#ErrorEquipment"+i).html("");
					         $("#SuccessEquipment"+i).html("");
		                     $("#ErrorEquipment"+i).html("");
					         $("#SuccessEquipment"+i).html("");
		                     $("#ErrorEquipment"+i).html("");
					         $("#SuccessEquipment"+i).html("");
		                     }
		                    
							    $("#SubmittionCountEquip").val(id);
							
								}
						
						 $(".eventEquipmentList").each(function(){
							 $(this).css("display","none");
						 });
						 $("#EquipmentmulSubmition"+id).css("display","block");
					

					
						
					}	
				 
				 
				 function loadmore(){
					debugger;
					for(var i = 5; i<11;i++){
					 $("#"+i+"Inv").css("display","block");
				     $("#loadmore").css("display","none");
                      $("#loadless").css("display","block");
				
					} 
					}
					
					 function loadless(){
					debugger;
					for(var i = 5; i<11;i++){
					 $("#"+i+"Inv").css("display","none");
				     $("#loadmore").css("display","block");
                     $("#loadless").css("display","none");
				
					} 
					}
			
			
			
				 
				 
				 function appendEventInventory(id,date){
					
						debugger;
						
					for(var i = 1; i<11;i++){
				     $("#"+id+"Inv").addClass("activeBlock");
					if(id != i){
					 $("#"+i+"Inv").removeClass('activeBlock');
                     $("#ErrorInventory"+i).html("");
			         $("#SuccessInventory"+i).html("");
                     $("#ErrorInventory"+i).html("");
			         $("#SuccessInventory"+i).html("");
                     $("#ErrorInventory"+i).html("");
			         $("#SuccessInventory"+i).html("");
                       }
                    
					    $("#SubmittionCount").val(id);
					
						
						 
						}
						
						 $(".eventInventoryList").each(function(){
							 $(this).css("display","none");
						 });
						
						 $("#InventorymulSubmition"+id).css("display","block");
						 
					
						
					}	

				 
				 function InventoryMulSearch(id){
			    	 try{
			        	 debugger;
			    				var online = window.navigator.onLine;
			    			  	if(!online){
			    			  	alert("Check your internet connection,Please try agian after some time.");
			    			  	return;
			    			  	} 
			    			$(".Error").html("");
			    			 $(".services").show();
			    			
			    			idAttr = parseInt(id);
			    			var searchName = $("#searchPackage"+idAttr).val();
			    			var searchCategory = "eventInventory"+idAttr;
			    			 if(searchName!=""&&searchName.length>=3){
			    				 searchProducts(searchName, searchCategory);
			    			 } }catch(e)
			    				{
			    				errorCode(e);
			    				}
			    }

				 
				 
				 
				 function EquipmentMulSearch(id){ 
			    	 try{
			        	 debugger;
			    				var online = window.navigator.onLine;
			    			  	if(!online){
			    			  	alert("Check your internet connection,Please try agian after some time.");
			    			  	return;
			    			  	} 
			    			$(".Error").html("");
			    			 $(".services").show();
			    			
			    			idAttr = parseInt(id);
			    			var searchName = $("#searchEquipment"+idAttr).val();
			    			var searchCategory = "eventEquipment"+idAttr;
			    			 if(searchName!=""&&searchName.length>=3){
			    			searchEventEquipment(searchName, searchCategory);
			    			 } }catch(e)
			    				{
			    				errorCode(e);
			    				}
			    }

				 
				
				 
				 function ManpowerMulSearch(id){ 
			    	 try{
			        	 debugger;
			    				var online = window.navigator.onLine;
			    			  	if(!online){
			    			  	alert("Check your internet connection,Please try agian after some time.");
			    			  	return;
			    			  	} 
			    			$(".Error").html("");
			    			 $(".services").show();
			    			
			    			idAttr = parseInt(id);
			    			var searchName = $("#searchManpower"+idAttr).val();
			    			var searchCategory = "eventmanPower"+idAttr;
			    			 if(searchName!=""&&searchName.length>=3){
			    				 searchEmployee(searchName, searchCategory);
			    			 } }catch(e)
			    				{
			    				errorCode(e);
			    				}
			    }

				 
				
				 
				 
				 function inventoryClosureCal(id){
						debugger;
						$("#ErrorInventoryClosure").html("");
						var issue= parseFloat($("#invClosureIssue"+id).val());
						var Cons= parseFloat($("#invClosureCons"+id).val());
						var wastage= parseFloat($("#invClosureWastage"+id).val());
						var RtnVal=issue-(Cons+wastage);
						if(issue<Cons){
							$("#ErrorInventoryClosure").html("Consumed Qty can't be greater than issue Qty.");
							$("#invClosureCons"+id).val(0);
							return;
						}
						
						if(issue<(wastage+Cons)){
							$("#ErrorInventoryClosure").html("Wastage Qty can't be greater than issue Qty.");
							$("#invClosureWastage"+id).val(0);
							return;
						}
						$("#invClosureReturn"+id).val(RtnVal);
						if(issue<(wastage+Cons+RtnVal)){
							$("#ErrorInventoryClosure").html("Return Qty can't be greater than issue Qty.");
							$("#invClosureReturn"+id).val(0);
							return;
						}
					}
				 var closeInventory = 0;
					function InventoryClosure(){
						
						 try{
						debugger;
						$("#ErrorInventoryClosure").html("");
						$("#SuccessInventoryClosure").html("");
						
						 var contextPath = $("#contextPath").val();
						 
						 var formData={};
						 var eventInventoryReturnDetails = [];
						 
						 var dateTime = getCurrentDate();
					   	  var date = dateTime.split(' ');
					   	  date = date[0].split('/');
					   	  var formatedDate = date[1]+"/"+date[0]+"/"+date[2];
						 
					   	  
					   	 
						 if($("#EventEnd").val()> formatedDate){
							 closeInventory = closeInventory+1;
							 }
						 
					    
					    	 var noOfDaysstart = daydiff(parseDate($('#Eventstart').val()), parseDate(formatedDate));
							 
					    	 if(noOfDaysstart < 0){
					   		  $("#ErrorInventoryClosure").html("Event not yet started. Not allowed to Close"); 
					   		 return false;
					   	  }
					   	  
					   	  
					   
						 
						 if(closeInventory < 2 && closeInventory != 0 ){
							 $("#ErrorInventoryClosure").html("You are trying to close Event Inventory before End date, If you are ready to close Event before End date click the button Again.");
						
						 return false
						 }
						 /* if($("#DateInventory").val() == ""){
							 $("#ErrorInventory").html("Select Date");
							 return;
						 }*/
						 //formData.createdDateStr= $("#DateInventory").val();
						 formData.eventReference= $("#eventrefInventoryClosure").val();
						 formData.outletStoreLocation= $("#outletInventoryClosure").val();
						 //formData.operation = operation;
						 
						 SubCount = 1;
					
					var errorcount = 0;
						 $('.slnoInventoryClosure').each(function() {
							  var idAttr= $(this).attr("id").replace('InvClosureSno',''); 
								/*var obj = {eventReference:$("#eventrefInventoryClosure").val(),eventLocation:$("#outletInventoryClosure").val(),skuId:$("#InvClosureItemCode"+idAttr).text(),item_description:$("#InvClosureDesc"+idAttr).text(),skuDescription:$("#InvClosureDesc"+idAttr).text(),uom:$("#InvClosureUom"+idAttr).text(),size:$("#InvClosureSize"+idAttr).text(),issueQuantity:$("#invClosureIssue"+idAttr).val(),consQuantity:$("#invClosureCons"+idAttr).val(),wastageQuantity:$("#invClosureWastage"+idAttr).val(),returnQuantity:$("#invClosureReturn"+idAttr).val(),submissionCount:SubCount};
								eventInventoryReturnDetails.push(obj);*/
								
								  var price = $("#InvClosuresaleprice"+idAttr).text();
								var tax_value = $("#InvClosuretaxvalue"+idAttr).text();
								var cgst = $("#InvClosurecgsttaxvalue"+idAttr).text();
								var sgst = $("#InvClosuresgsttaxvalue"+idAttr).text();
								
								
				              var wastage= $("#invClosureWastage"+idAttr).val();
						      var Rtn= $("#invClosureReturn"+idAttr).val();


                       if(wastage == "" ){ 
             	        $("#ErrorInventoryClosure").html("Please enter the required Values");	
                        $("#invClosureWastage"+idAttr).focus();
                       errorcount = errorcount+1;
                       return false;
						}
						if(Rtn == "" ){
							$("#ErrorInventoryClosure").html("Please enter the required Values");	
                            $("#invClosureReturn"+idAttr).focus();
                      errorcount = errorcount+1;
                          return false;
						}

								
								if(price == "0" || price == ""){
									price = 0;
								}
								if(tax_value == "0" || tax_value == ""){
									tax_value = 0;
								}
								if(cgst == "0" || cgst == ""){
									cgst = 0;
								}
								if(sgst == "0" || sgst == ""){
									sgst = 0;
								}
								
								var obj = {eventReference:$("#eventrefInventoryClosure").val(),eventLocation:$("#outletInventoryClosure").val(),skuId:$("#InvClosureItemCode"+idAttr).text(),item_description:$("#InvClosureDesc"+idAttr).text(),skuDescription:$("#InvClosureDesc"+idAttr).text(),price:price,tax_value:tax_value,cgst:cgst,sgst:sgst,taxCode:$("#InvClosuretaxCategory"+idAttr).text(),uom:$("#InvClosureUom"+idAttr).text(),size:$("#InvClosureSize"+idAttr).text(),issueQuantity:$("#invClosureIssue"+idAttr).val(),consQuantity:$("#invClosureCons"+idAttr).val(),wastageQuantity:wastage,returnQuantity:Rtn,submissionCount:SubCount};
								eventInventoryReturnDetails.push(obj);
							
						 });
						 
					
					if(errorcount > 0){
                          return false;
						}

					
					
					
						 formData.eventInventoryReturnDetails = eventInventoryReturnDetails;
						 formData = JSON.stringify(formData);
					     console.log(formData);
							 
					    // return; 
						 URL = contextPath + "/outletMaster/createEventInventoryReturnDetails.do";		
						$.ajax({
						  type: "POST",
						  url : URL,
						 //contentType: "application/json",
								data : {
									formData : formData,
								},
								beforeSend: function(xhr){                    
					   				$("#loading").css("display","block");
					   				$("#mainDiv").addClass("disabled");
					        },

							success : function(result) {
									debugger;
								$("#right-side").html(result);
								 
								
									$('#tab_6_Inventory_Closure').trigger('click');
								
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
 
					function replacePlaceHolder(){
						debugger;
						var discountValue =  $("#DiscountType").val();
						
						if(discountValue == "Fixed Rental"){
							document.getElementById("discountValue").placeholder = "Rental value"; 

							
							$("#paymentModeDiscount").css("display","block");
							$("#discountValue").css("display","none");
							$("#discontamountrefernce").css("display","block");
							$("#discontbankrefernce").css("display","block");
							
						}else if(discountValue == "Revenue Sharing"){
							document.getElementById("discountValue").placeholder = " % of sharing";
							
							
							$("#paymentModeDiscount").css("display","none");
							$("#discountValue").css("display","block");
							$("#discontamountrefernce").css("display","none");
							$("#discontbankrefernce").css("display","none");
						
							
						}else if(discountValue == "Pizza Free"){
							document.getElementById("discountValue").placeholder = "Enter No of Pizzas";
							
							$("#paymentModeDiscount").css("display","none");
							$("#discountValue").css("display","block");
							$("#discontamountrefernce").css("display","none");
							$("#discontbankrefernce").css("display","none");
						}else{
							document.getElementById("discountValue").placeholder = "Discount value"; 
							
							$("#paymentModeDiscount").css("display","none");
							$("#discountValue").css("display","block");
							$("#discontamountrefernce").css("display","none");
							$("#discontbankrefernce").css("display","none");
						}
				 
					 
					}
					
					function appendbankdata(){
						
						debugger;
						var paymentdiscountValue =  $("#paymentModeDiscount").val();
						paymentdiscountValue = paymentdiscountValue.split("-");
						
						
						if(paymentdiscountValue[1] == "Cheque" || paymentdiscountValue[1] == "cheque"){
							$("#discountValue").val("0.0");
							$("#discontreferncebank").val("");
							$("#discontrefernceref").val("");
							$("#discontamountrefernce").css("display","block");
							$("#discontbankrefernce").css("display","block");

						
							
						}	else{
							$("#discontamountrefernce").css("display","block");
							$("#discontbankrefernce").css("display","none");
							
						}
						
						
						
						
					}


					function saletyperestriction(){
						
						debugger;
						var saleType =  $("#saleType").val();
						
						if(saleType =="Total Advance"){
							$("#Approvalfilebutton").css("display","none");
							$("#maxsize").css("display","none");
							
							
						}else{
							$("#Approvalfilebutton").css("display","block");
							$("#maxsize").css("display","block");
							
						}
						
						if(saleType == "Total Credit"){
							$("#paymentDiv").css("display","none");
							$(".paymentListsData").css("display","none");
							$("#Eventduedate").css("display","block");
							
						}else{
							$("#paymentDiv").css("display","block");
							$(".paymentListsData").css("display","block");
							$("#Eventduedate").css("display","none");
						}
						
						
					}
					
					
					 function PrintEventDetails(eventref,status,flow,printflow){
						 debugger;
						 try{
					 		   var online = window.navigator.onLine;
					 		   	if(!online)
					 		           {
					 		   	 alert("Check your internet connection,Please try agian after some time.");
					 		     	 return;
					 		          }
					 		   	
					 		   $("#ErrorEmp").html("");
					 		   $("#SuccessEmp").html("");

					 	   debugger;
							 var contextPath = $("#contextPath").val();
						
						var subCount;
						
						if(printflow == "Inventory"){
							subCount = $("#SubmittionCount").val();
						}else if(printflow == "Equipmemt"){
						subCount = $("#SubmittionCountEquip").val();
						}
						
						 
						
						
						if(subCount == null || subCount == undefined || subCount == ""){
							subCount = 1;
						}
							 
							
					   
						URL = contextPath + "/outletMaster/printEventDetails.do";		
							$.ajax({
					   	  type: "POST",
							  url : URL,
							 //contentType: "application/json",
					  			data : {
					  				eventref : eventref,
					  				status : status,
					  				flow : flow,
					  				printflow : printflow,
							        subCount :subCount
					  			},
					  			beforeSend: function(xhr){                    
						   				$("#loading").css("display","block");
						   				$("#mainDiv").addClass("disabled");
						        },

					  			success : function(result) {
					   			 $("#right-side").html(result);
					   			 
				if(printflow != 'Inventory' && printflow != "printinventoryReturn"){
					   			 var anchor = document.createElement('a');
					   		  anchor.href = $("#printrdURLevents").val();
					   		  anchor.target = '_blank';
					   		  anchor.download = '';
					   		if($("#printrdURLevents").val()!=null && $("#printrdURLevents").val()!='')
					   		  anchor.click();
		
		}else{
			 var anchor = document.createElement('a');
					   		  anchor.href = $("#printrdURLeventsinvori").val();
					   		  anchor.target = '_blank';
					   		  anchor.download = '';
					   		if($("#printrdURLeventsinvori").val()!=null && $("#printrdURLeventsinvori").val()!='')
					   		  anchor.click();
		
		 var anchor = document.createElement('a');
					   		  anchor.href = $("#printrdURLeventsinvdup").val();
					   		  anchor.target = '_blank';
					   		  anchor.download = '';
					   		if($("#printrdURLeventsinvdup").val()!=null && $("#printrdURLeventsinvdup").val()!='')
					   		  anchor.click();
		
		 var anchor = document.createElement('a');
					   		  anchor.href = $("#printrdURLeventsinvtri").val();
					   		  anchor.target = '_blank';
					   		  anchor.download = '';
					   		if($("#printrdURLeventsinvtri").val()!=null && $("#printrdURLeventsinvtri").val()!='')
					   		  anchor.click();
			
			
		}
					   		if(printflow == "")
					   		$('#tab_2_Menu').trigger('click');
					   		else if(printflow == "Inventory")
					   		$('#tab_3_Iventory').trigger('click');
				            else if(printflow == "printinventoryReturn")
						   	$('#tab_6_Inventory_Closure').trigger('click');
				             else
				            $('#tab_4_Eqipment').trigger('click');
					   		
					   		
					   		
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
					 
					 function validateEquReturnQty(id){
						 $("#ErrorEquipmentClosure").html("");
							var issue= parseFloat($("#EquClosureIssue"+id).val());
							var Return= parseFloat($("#EquClosureReturn"+id).val());
							if(issue<Return){
								$("#ErrorEquipmentClosure").html("Return Qty can't be greater than issue Qty.");
								$("#EquClosureReturn"+id).val(0);
								return;
							}
							
					}
					 
					 
					 var closeEquipment = 0;
						function EquipmentClosure(){
							 try{
							  debugger;
							  $("#ErrorEquipmentClosure").html("");
								$("#SuccessEquipmentClosure").html("");
							  
							 var contextPath = $("#contextPath").val();
							 var formData={};
							 var eventEquipmentReturnDetails = [];
							 formData.eventReference= $("#eventrefEquipmentClosure").val();
							 formData.outletStoreLocation= $("#outletEquipmentClosure").val();
							 
							 var dateTime = getCurrentDate();
						   	  var date = dateTime.split(' ');
						   	  date = date[0].split('/');
						   	  var formatedDate = date[1]+"/"+date[0]+"/"+date[2];
							 
						   	  
						   	 
							 if($("#EventEnd").val()> formatedDate){
								 closeEquipment = closeEquipment+1;
								 }
							 
							
						   	
						    
						    	 var noOfDaysstart = daydiff(parseDate($('#Eventstart').val()), parseDate(formatedDate));
								 
						    	 if(noOfDaysstart < 0){
						   		  $("#ErrorEquipmentClosure").html("Event not yet started. Not allowed to Close"); 
						   		 return false;
						   	  }
						   	  
							 
							 if(closeEquipment < 2 && closeEquipment != 0 ){
								 $("#ErrorEquipmentClosure").html("You are trying to close Event Equipmenmt before End date, If you are ready to close Event before End date click the button Again.");
							
							 return false
							 }
							 
							 
							 SubCount = 1;
							 $('.slnoEquipmentClosure').each(function() {
								  var idAttr= $(this).attr("id").replace('EquClosureSno',''); 
									var obj = {eventReference:$("#eventrefEquipmentClosure").val(),eventLocation:$("#outletEquipmentClosure").val(),machineEquipmentId:$("#EquClosureItemCode"+idAttr).text(),description:$("#EquClosureDesc"+idAttr).text(),issueQuantity:$("#EquClosureIssue"+idAttr).val(),returnQuantity:$("#EquClosureReturn"+idAttr).val(),submissionCount:SubCount};
									eventEquipmentReturnDetails.push(obj);
								
							 });
							 
							 formData.eventEquipmentReturnDetails = eventEquipmentReturnDetails;
							 formData = JSON.stringify(formData);
						    console.log(formData);
								 
						   //return; 
							 URL = contextPath + "/outletMaster/createEventEquipmentReturnDetails.do";		
							$.ajax({
							  type: "POST",
							  url : URL,
									data : {
										formData : formData,
									},
									beforeSend: function(xhr){                    
						  				$("#loading").css("display","block");
						  				$("#mainDiv").addClass("disabled");
						       },

								success : function(result) {
										debugger;
									$("#right-side").html(result);
									$('#tab_7_Eqipment_Closure').trigger('click');
									
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
										 
				function paymentmodeRestriction(){
					 $("#Error").html("");
					var paymentMode= $("#paymentModeDiscount").val();
					
					if(paymentMode == "" || paymentMode == null || paymentMode == undefined){
						 $("#Error").html("Please Select Payment mode.");
						 $("#paymentModeDiscount").focus();
						 
						 $("#discountValue1").val("");
						 
						 
					}
					
				}	
				
				
				function ValidatePAN() {
					 $("#Error").html("");
					
			        var txtPANCard = document.getElementById("PANnumber");
			        var regex = /([A-Z]){5}([0-9]){4}([A-Z]){1}$/;
			        if (regex.test(txtPANCard.value.toUpperCase())) {
			            return true;
			        } else {
			        	 $("#Error").html("Please Check PAN Number.");
			            return false;
			        }
			    }
				
				function validateGSTIN(){
					debugger;
                    $("#Error").html("");
					
			        var GSTnumber = document.getElementById("GSTnumber");
			        var gstinformat = /^([0][1-9]|[1-2][0-9]|[3][0-7])([a-zA-Z]{5}[0-9]{4}[a-zA-Z]{1}[1-9a-zA-Z]{1}[zZ]{1}[0-9a-zA-Z]{1})+$/;
			        if (gstinformat.test(GSTnumber.value.toUpperCase())) {
			            return true;
			        } else {
			        	 $("#Error").html("Please Check GST Number.");
			            return false;
			        }
				}
				
				function validatePINcode(){
					debugger;
                    $("#Error").html("");
					
			        var pinCodeODC = document.getElementById("pinCodeODC");
			        var regex = /^\d{6}$/;   
			        
			       
			        
			        
			        if(pincode != ""){
				        if (regex.test(pincode.value)) {
				           
				        } else {
				        	 $("#Error").html("Please Check PIN code.");
				            return false;
				        }
				        }
				}
				
				
				
				function validatePINcode1(){
					debugger;
                    $("#Error").html("");
					
			        var pinCodeODC = document.getElementById("pinCodeODC");
			        var regex = /^\d{6}$/;   
			        
			        if(pinCodeODC != ""){
			        if (regex.test(pinCodeODC.value)) {
			           
			        } else {
			        	 $("#Error").html("Please Check PIN code.");
			            return false;
			        }
			        }
			        
			        
			       
				}
				
				 
				function searchLocation(str) {
					debugger;
				    var selEl = document.getElementById('dpid');
				    if(selEl) {
				        var options = selEl.options;
				        for(var i = 0; i < option.length; i++) {
				            if(options[i].value == str) return i;
				        }
				        return -1;
				    }
				    return -1;
				}	
				
				
				

			 	  function downloadPandLtemplate(customerId){
			 		  debugger;
			 		  try{
			      	 var contextPath = $("#contextPath").val();
			      	 var path = window.location.protocol + '//' + window.location.hostname + ':' + window.location.port+ '/Configurations/'+customerId+'/Import_Templates/';
			      	path  = path+'GGN FT YTD P&L.xlsx';
			      	var online = window.navigator.onLine;
			        	if(!online){
			        	alert("Check your internet connection,Please try agian after some time.");
			        	return;
			        	}
			        	
			        	var anchor = document.createElement('a');
						  anchor.href = path;
						  anchor.target = '_blank';
						  anchor.download = '';
						if(path!=null && path!='')
						  anchor.click();
			      	 
			 		  }catch(e)
			   		{
			   			errorCode(e);
			   		}

			       }
			 	  
			 	  
			 	  
			 	  function profitrestrict(){
			 		 $("#Error").html("");
				      	 var expectedsales = parseFloat($("#expectedsales").val());
				      	 var profit = parseFloat($("#proft").val());
				      	 if(expectedsales<profit){
				      		 $("#Error").html("Profit can't be morethan Sales");
				      	 }

			 		 
			 		  
			 	  }
			 	  
			 	  
			 	 function validatetext(text){
			 		 var textlength =  $("#"+text).val();
			 		var subtext= textlength.substring(0, 50);
			 		 if(textlength.length >50){
			   $("#Error").html("Only 50 characters are allowed"); 
			   $("#"+text).val(subtext);
			 	 }
			 	  }
	
	function getSelectionStart(o) {
	if (o.createTextRange) {
		var r = document.selection.createRange().duplicate()
		r.moveEnd('character', o.value.length)
		if (r.text == '') return o.value.length
		return o.value.lastIndexOf(r.text)
	} else return o.selectionStart
}
			 	  
	
	function setTwoNumberDecimal(id) {
	debugger;
    var value = $(id).val();    
    $(id).val(parseFloat(value).toFixed(2));
    
}


function percentageRestriction(){
                debugger;
                 $("#Error").html("");
                 $("#Success").html("");
 		  $("#ErrorInventoryClosure").html("");
		   $("#ErrorEquipmentClosure").html("");
		   $("#SuccessEquipmentClosure").html("");
 		   $("#SuccessInventoryClosure").html("");
                var DiscountType= $("#DiscountType").val();
                
                if(DiscountType == "Revenue Sharing"){
                        var DiscountValue= $("#discountValue").val();
                        if(DiscountValue>100){
                         $("#Error").html("For Revenue Sharing  Can't exceed morethan 100%");
                         $("#discountValue").focus();
                         return;
                        } 
                         
                }
                
        }     




 function inventoryClosureCal2(id){
						debugger;
						$("#ErrorInventoryClosure").html("");
						var issue= parseFloat($("#invClosureIssue"+id).val());
						var wastage= parseFloat($("#invClosureWastage"+id).val());
						var Rtn= parseFloat($("#invClosureReturn"+id).val());
						
						if(wastage == "" || isNaN(wastage) ){
							wastage = 0;	
						}
						if(Rtn == "" || isNaN(Rtn)){
							Rtn = 0;	
						}
						
						var ConsVal=issue-(Rtn+wastage);
						
						
						if(issue<ConsVal){
							$("#ErrorInventoryClosure").html("Consumed Qty can't be greater than issue Qty.");
							$("#invClosureReturn"+id).val(0);
							return;
						}
						
						if(issue<(wastage+Rtn)){
							$("#ErrorInventoryClosure").html("Sum of Wastage and Return Qty can't be greater than issue Qty.");
							$("#invClosureWastage"+id).val(0);
							$("#invClosureReturn"+id).val(0);
							return;
						}
						$("#invClosureCons"+id).val(ConsVal);
						
						if(issue<(wastage+ConsVal+Rtn)){
							$("#ErrorInventoryClosure").html("Sum of Wastage and Return Qty can't be greater than issue Qty.");
							$("#invClosureReturn"+id).val(0);
							return;
						}
					}
					
					
					function loadmoreEqip(){
						debugger;
						for(var i = 5; i<11;i++){
						 $("#"+i+"Eqip").css("display","block");
					     $("#loadmoreEqu").css("display","none");
	                      $("#loadlessEqu").css("display","block");
					
						} 
					}
						
				function loadlessEqip(){
						debugger;
						for(var i = 5; i<11;i++){
						 $("#"+i+"Eqip").css("display","none");
					     $("#loadmoreEqu").css("display","block");
	                     $("#loadlessEqu").css("display","none");
					
						} 
					}

                   function displaytaxDesc(){
						debugger;
						
					
					
						if($("#taxpersentage").val() != ""){
						var tax = $("#taxpersentage").val();
						if(tax[0] == "5"){
						 $("#taxdesc5").css("display","block");
						 $("#taxdesc18").css("display","none");
					     $("#taxdescempty").css("display","none");
						}else{
						 $("#taxdesc5").css("display","none");
						 $("#taxdesc18").css("display","block");
					     $("#taxdescempty").css("display","none");
						}
						
					}else{
						 $("#taxdesc5").css("display","none");
						 $("#taxdesc18").css("display","none");
					     $("#taxdescempty").css("display","block");
					  
					}
					
				
					}





/*function initAutocomplete() {
	  		debugger;
	  		 var input = document.getElementById('googlemapODC');
	          var searchBox = new google.maps.places.SearchBox(input);
	          searchBox.addListener('places_changed', function() {
	          var places = searchBox.getPlaces();
	          if (places.length == 0) {
	            return;
	          }
	          debugger;
	          places.forEach(function(place) {
	        	  var data=JSON.parse(JSON.stringify(place));
	        	  $('#mapid').html("");
	              $('#mapid').append(data.adr_address);  
	            
	          });
	        });
	  		
	      } 
			 	*/  