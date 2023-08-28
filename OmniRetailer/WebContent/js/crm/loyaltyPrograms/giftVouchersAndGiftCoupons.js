var couponsFiles;

function viewGiftVoucherDetails(id,operation){
        		 var contextPath = $("#contextPath").val();
       			URL = contextPath + "/crm/viewGiftVoucherDetails.do";
       	 		$.ajax({
       	 			type: "GET",
       	 			url : URL,
       	 			data : {
       	 				id:id,
       	 				operation:operation
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
		
		
		$('#promoCode').on('input', function() {
			  $(this).val($(this).val().replace(/[^a-z0-9]/gi, ''));
			});

		function validateGiftVouchers(operation,type){
					debugger;
					var re = /^[0-9/]+$/;
					
					if($("#voucherProgramCode").val().trim() == ""){
						$("#errVoucherProgramCode").html("Enter Promo Code");
						return;
					}
					
					if(parseInt($("#voucherProgramCode").val().length)>50){
						 $("#voucherProgramCode").focus();
							$("#errVoucherProgramCode").html("Program Code can't exceeds 50 Characters");
							return;
					}else{
					 $("#errVoucherProgramCode").html(" ");
				  } 
					
					if($("#promoName").val().trim() == ""){
						$("#errPromoName").html("Enter Promo Name");
						return;
					}
					if(parseInt($("#promoName").val().length)>45){
						 $("#promoName").focus();
							$("#errPromoName").html("Program Name can't exceeds 45 Characters");
							return;
					}else{
					 $("#errPromoName").html(" ");
				    }
					
					if($("#unitCashValue").val().trim() == ""){
						$("#errUnitCashValue").html("Enter Unit Cash Value");
						return;
					}
					
					/*if($("#totalCashValue").val().trim() == ""){
						$("#errTotalCashValue").html("Enter Total Cash Value");
						return;
					}*/
					if($("#quantity").val().trim() == ""){
						$("#errQuantity").html("Enter a Number");
						return;
					}
					/*if($("#tenderName").val().trim() == ""){
						$("#errTenderName").html("Select Tender Mode");
						return;
					}*/
					if($("#createdOn").val().trim() == ""){
						$("#createdOnError").html("Enter a Date");
						return;
					}
					if(!re.test($("#createdOn").val())){
						$("#createdOnError").html("Invalid Date");
						return;
					}
					if($("#expiryDate").val().trim() == ""){
						$("#expiryDateError").html("Enter a Date");
						return;
					}
					if(!re.test($("#expiryDate").val())){
						$("#expiryDateError").html("Invalid Date");
						return;
					}
					var daysToExpire = daydiff(new Date(), parseDate($('#expiryDate').val()));
					if(daysToExpire < 0){
						$("#expiryDateError").html("Expiry Date should be greater than today");
						return;
					}
					var noOfDays = daydiff(parseDate($('#createdOn').val()), parseDate($('#expiryDate').val()));
					if(noOfDays < 0){
						$("#expiryDateError").html("Expiry Date can't be less than Date");
						return;
					}
					
					if($("#validityPeriod").val().trim() == "" || parseInt($("#validityPeriod").val().trim())==0){
	 	     			$("#errValidityPeriod").html("Validity period should be atleast 1 day");
	 	     			return;
	 	     		}
	 	     		
	 	     		 var validityPeriod = parseInt($("#validityPeriod").val().trim());
	 	     			if(validityPeriod > noOfDays+1){
	 	     				
	 	     				if(noOfDays==0 && validityPeriod==1)
	 	     					{
	 	     					
	 	     					}
	 	     				else
	 	     					{
	 	     					$("#errValidityPeriod").html("Enter no of days properly");
	 	              			return;
	 	     					}
	 	     			 }
					
	 	     			if(parseInt($("#validityPeriod").val().length)>11){
							 $("#validityPeriod").focus();
								$("#errValidityPeriod").html("Validity period can't exceeds 11 Digits");
								return;
						}else{
						 $("#errValidityPeriod").html(" ");
					    }
	 	     			
					if($("#min_bill_amount").val().trim() == ""){
						$("#errmin_bill_amount").html("Enter Min Bill Amount");
						return;
					}else{
						$("#errmin_bill_amount").html("");
					}
					
					if(parseInt($("#description").val().length)>250){
						 $("#description").focus();
							$("#errdescription").html("Description can't exceeds 250 Characters");
							return;
					}else{
					 $("#errdescription").html(" ");
				  } 
					
					var zoneLocations = $("#location").val();
					var locations = "";
					var zone = "";
					var zones = $("#zones").val();
					
					if(zones == "" || zones == null){
						$("#errStates").html("Select Zones");
						return;
					}
					
					var locations = $("#location").val();
					if(locations == "" || locations == null){
						$("#errLocation").html("Select Location");
						return;
					}

					$("#selectedLocation").val(locations.toString());

					for(var locItem in zoneLocations ){
						locations += zoneLocations[locItem] +","; 
					}

					for(var zoneItem in zones ){
						zone += zones[zoneItem] +","; 
					}
					$("#zone").val(zone);
					$("#locations").val(locations);

		/*		Written by: Manideep
				Reason: To add the is paid flag */
					if ($('#isPaidFlag').is(':checked')) 
		    			$("#isPaidFlag").val("true");
		    		else
		    			$("#isPaidFlag").val("false");
		     		

					/*		Written by: Koti Bommineni
					Reason: To add the is OTP required flag */
						if ($('#isOTPFlag').is(':checked')) 
			    			$("#isOTPFlag").val("true");
			    		else
			    			$("#isOTPFlag").val("false");
		
		
		                if ($('#on_discounted_bill_price').is(':checked')) 
			    			$("#on_discounted_bill_price").val("true");
			    		else
			    			$("#on_discounted_bill_price").val("false");
					var formData  = $('form').serializeObject();
					
					formData.createdOnStr = $("#createdOn").val();
					formData.expiryDateStr = $("#expiryDate").val();
					formData.assignedStatusStr = $("#assignedStatus").val();
					
					if(formData.isPaidFlag==null || formData.isPaidFlag==undefined || formData.isPaidFlag=="")
						{
						 formData.isPaidFlag="false";
						}
					
					if(formData.isOTPFlag==null || formData.isOTPFlag==undefined || formData.isOTPFlag=="")
					{
					 formData.isOTPFlag="false";
					}
					if(formData.on_discounted_bill_price==null || formData.on_discounted_bill_price==undefined || formData.on_discounted_bill_price=="")
					{
					 formData.on_discounted_bill_price="false";
					}
					
			if(operation== "edit"){
					var len = $("#cardsDetails tr").length-1;
					var giftVouchers = [];
					var customerGiftVouchers = [];
					
					  $('.edited').each(function() {
						
						  var idAttr= $(this).attr("id").replace('customerName','');
						
						debugger;
						
							var obj = {voucherCode:$("#voucherCode"+idAttr).text(),voucherId:$("#voucherId"+idAttr).text(),assignedStatus:$("#assignedStatus"+idAttr).val(),voucherStatus:$("#voucherStatus"+idAttr).val(),voucherProgramCode:$("#voucherProgramCode").val()};
							var obj1 = {issuedAt:$("#issuedAt"+idAttr).val(),customerName:$("#customerName"+idAttr).val(),customerEmail:$("#customerEmail"+idAttr).val(),customerMobile:$("#customerMobile"+idAttr).val(),claimStatus:$("#claimStatus"+idAttr).val(),voucherId:$("#voucherId"+idAttr).val(),voucherCode:$("#voucherCode"+idAttr).text(),voucherProgramCode:$("#voucherProgramCode"+idAttr).text(),voucherValue:$("#voucherValue"+idAttr).text(),validityDateStr:$("#validityDate"+idAttr).text(),billRef:$("#billRef"+idAttr).text(),issuedAtStr:$("#issueDate"+idAttr).text(),claimedAt:$("#claimedAt"+idAttr).text()};
						
							giftVouchers.push(obj);
							customerGiftVouchers.push(obj1);

					});
					
					formData.giftVouchers=giftVouchers;
					
		                 formData.customerGiftVouchers=customerGiftVouchers;
		                 
		                 var editPlusVoucherss="";
		                 for(var editPlusVoucher in editPlusVouchers ){
		                	 editPlusVoucherss += editPlusVouchers[editPlusVoucher] +","; 
		 				}
		                formData.voucheridsStr=editPlusVoucherss;
					
					}
					
					formData  = JSON.stringify(formData);
		             console.log(formData);
					var contextPath = $("#contextPath").val();
					if(operation=="new" && type == "giftVouchers"){
						URL = contextPath + "/crm/createGiftVouchers.do";
					}

					else 
						URL = contextPath + "/crm/updateGiftVouchers.do";

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



		
		
		function multipleCheckValidation()
		{
			debugger;
			var multipleValue=$("#multiplesValue").val();
			if(multipleValue == "0"){
				$("#quantity").val("1");
				$("#quantity").attr("readonly", "readonly");
				$("#nofClaims").val("0");
				$("#nofClaims").removeAttr('readonly');
				$("#assignedStatus").val("1");
				//$("#assignedStatus").attr('disabled', 'disabled');
				$("#limitedUseCoupon").val("1");
				//$("#limitedUseCoupon").attr('disabled', 'disabled');
				$("#noOfClaimsLimited").val("0");
				//$("#noOfClaimsLimited").attr("readonly", "readonly");
			}
			else
				{
				$("#quantity").removeAttr("readonly");
				//$("#nofClaims").attr("readonly", "readonly");
				$("#nofClaims").val("1");
				$("#assignedStatus").removeAttr('disabled');
				$("#assignedStatus").val("0");
				$("#limitedUseCoupon").removeAttr('disabled');
				//$("#noOfClaimsLimited").attr("readonly", "readonly");
				
				}
		}

		function limitCheckValidation()
		{
			debugger
			var multipleValue=$("#limitedUseCoupon").val();
			if(multipleValue == "1"){
				$("#noOfClaimsLimited").val("0");
				$("#noOfClaimsLimited").attr("readonly", "readonly");
				//$("#nofClaims").attr("readonly", "readonly");
			}
			else
				{
				$("#noOfClaimsLimited").removeAttr("readonly");
				$("#noOfClaimsLimited").val("");
				
				}
		}

		
		function multipleeditCheckValidation()
		{
			debugger
			var multipleValue=$("#multiplesValue").val();
			if(multipleValue == "0"){
				$("#quantity").val("1");
				$("#quantity").attr("readonly", "readonly");
				$("#nofClaims").val("0");
			}
			else
				{
				$("#quantity").removeAttr("readonly");
				$("#quantity").val("");
				$("#nofClaims").val("");
				}
		}
		
		
		
		
		
		//added by koti bomminenni
		//purpose : to edit giftvoucher
		var editPlusVouchers =[];
		function voucherEdit(count)
		{

			debugger;
			var VoucherCode = $("#voucherCode"+count).text();
			
				$("#issuedAt"+count).removeAttr("readonly");
				$("#customerName"+count).removeAttr('readonly');
				$("#customerEmail"+count).removeAttr("readonly");
				$("#customerMobile"+count).removeAttr('readonly');
				$("#claimStatus"+count).removeAttr('disabled');
				$("#voucherStatus"+count).removeAttr('disabled');
				
				
				editPlusVouchers.push(VoucherCode);
				$("#customerName"+count).addClass("edited");

		}
		

		 function searchGiftVouchers(id,index,saveFlag)
				 {
					 var contextPath = $('#contextPath').val();
					 var maxRecords = 10;
					 
					 debugger
					 var voucherProgramCode = $("#voucherProgramCode").val();
					 var searchCriteria = $("#searchItems").val().trim();
						var actionTest = $("#actionTest").val();
			     		if(actionTest == null || actionTest == "" || actionTest == undefined){
			     			actionTest="";
			     		}
					 
					 var URL = contextPath + "/crm/searchGiftVouchers.do";
					 $.ajax({
						 type : "GET",
						 url : URL,
						 data : {
							 voucherProgramCode : voucherProgramCode,
							 maxRecords : maxRecords,
							 index:index,
							 searchCriteria : searchCriteria,
							 saveFlag:saveFlag,
							 actionTest:actionTest
							 
						 },
						 beforeSend: function(xhr){                     
							 $("#loading").css("display","block");
							 $("#mainDiv").addClass("disabled");
						 },
						 success : function(result){
//							 activeMenu('Loyaltycards');
							 $('#voucherDetails').html(result);
								var anchor = document.createElement('a');
								anchor.href = $("#fileDownloadurl").val();
								anchor.target = '_blank';
								anchor.download = '';
								if($("#fileDownloadurl").val()!=null && $("#fileDownloadurl").val()!='')
									anchor.click();
							
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



		 function validateGiftCoupons(operation,type,isRenewCoupon){
		 	     		var re = /^[0-9/]+$/;
		 	     	
		 	     		debugger;
		 	     		var filePath=$("#coupons").val()
//		 	     		alert($("#promoCode").length)
		 	     			$(".clearErrors").html("");
		 	     		var promoCode = $("#promoCode").val();
//		 	     		 var regex = /^[0-9a-zA-Z\_]+$/
//		 	     		alert(promoCode.length)
		 	     		if(promoCode.length<5){
		 	     			$("#errpromoCode").html("Enter atleast 5 Characters/Numbers");
		 	     			$("#promoCode").focus();
		 	     			return;
		 	     		}
		 	     		
		 	     		if(parseInt($("#promoCode").val().length)>50){
		 	  			 $("#promoCode").focus();
		 	  				$("#errpromoCode").html("Promo Code Id can't exceeds 50 Characters");
		 	  				return;
		 	  		   }else{
		 	  		        $("#errpromoCode").html(" ");
		 	  	       } 
		 	     		
		 	     		if($("#createdOn").val().trim() == ""){
		 	     			$("#createdOnError").html("Enter a Date");
		 	     			$("#createdOn").focus();
		 	     			return;
		 	     		}
		 	     		if(!re.test($("#createdOn").val())){
		 	     			$("#createdOnError").html("Invalid Date");
		 	     			$("#createdOn").focus();
		 	     			return;
		 	     		}
		 	     		
		 	     		if($("#promoName").val().trim() == ""){
		 	     			$("#errPromoName").html("Enter Promo Name");
		 	     			$("#promoName").focus()
		 	     			return;
		 	     		}
		 	     		
		 	     		if(parseInt($("#promoName").val().length)>45){
			 	  			 $("#promoName").focus();
			 	  				$("#errPromoName").html("Promo Name can't exceeds 45 Characters");
			 	  				return;
			 	  		   }else{
			 	  		        $("#errPromoName").html(" ");
			 	  	       } 
		 	     		
		 	     		if($("#expiryDate").val().trim() == ""){
		 	     			$("#expiryDateError").html("Enter a Date");
		 	     			$("#expiryDate").focus();
		 	     			return;
		 	     		}
		 	     		
		 	     		if(!re.test($("#expiryDate").val())){
		 	     			$("#expiryDateError").html("Invalid Date");
		 	     			$("#expiryDate").focus();
		 	     			return;
		 	     		}
		 	     		var expDate=parseDate($('#expiryDate').val());
		 	     		var newDate=new Date();
		 	     		newDate.setHours(0, 0, 0);
		 	     		expDate.setHours(0, 0, 0);
		 	     		var daysToExpire = daydiff(newDate, expDate);
		 	    		if(Math.round(daysToExpire) < 0){
		 	    			 $("#expiryDateError").html("Expiry Date should be greater than today");
		 	    			 return;
		 	    		 }
		 	     		 var noOfDays = daydiff(parseDate($('#createdOn').val()), parseDate($('#expiryDate').val()));
		 	     		 if(noOfDays < 0){
		 	     			 $("#expiryDateError").html("Expiry Date can't be less than Date");
		 	     			 return;
		 	     		 }
		 	     		 
		 	     		if(parseInt($("#nofClaims").val().length)>11){
			 	  			 $("#nofClaims").focus();
			 	  				$("#errnofClaims").html("No Of Claims can't exceeds 11 Digit");
			 	  				return;
			 	  		   }else{
			 	  		        $("#errnofClaims").html(" ");
			 	  	       } 
		 	     		
		 	     		if($("#validityPeriod").val().trim() == "" || parseInt($("#validityPeriod").val().trim())==0){
		 	     			$("#errValidityPeriod").html("Validity period should be atleast 1 day");
		 	     			return;
		 	     		}
		 	     		
		 	     		 var validityPeriod = parseInt($("#validityPeriod").val().trim());
		 	     			if(validityPeriod > noOfDays+1){
		 	     				
		 	     				if(noOfDays==0 && validityPeriod==1){
		 	     					
		 	     					}
		 	     				else{
		 	     					$("#errValidityPeriod").html("Enter no of days properly");
		 	              			  return;
		 	     				}
		 	     			 }
		 	     			
		 	     			if(parseInt($("#validityPeriod").val().length)>11){
				 	  			 $("#validityPeriod").focus();
				 	  				$("#errValidityPeriod").html("Validity Period can't exceeds 11 Digit");
				 	  				return;
				 	  		   } else{
				 	  		        $("#errValidityPeriod").html(" ");
				 	  	       } 
		 	     			
		 	     			if(parseInt($("#perUserClaims").val().length)>11){
				 	  			 $("#perUserClaims").focus();
				 	  				$("#errperUserClaims").html("Per User Claims can't exceeds 11 Digit");
				 	  				return;
				 	  		   } else{
				 	  		        $("#errperUserClaims").html(" ");
				 	  	       } 
		 	     			
		 	     			if(parseInt($("#splitPeriod").val().length)>20){
				 	  			 $("#splitPeriod").focus();
				 	  				$("#errsplitPeriod").html("Split Period can't exceeds 20 Characters");
				 	  				return;
				 	  		   } else{
				 	  		        $("#errsplitPeriod").html(" ");
				 	  	       } 
		 	     			
		 	     			if($("#quantity").val().trim() == ""){
		 	         			$("#errQuantity").html("Enter a Number");
		 	         			$("#quantity").focus()
		 	         			return;
		 	         		}
		 	         		/*if($("#nofClaims").val().trim() == ""){
		 	         			$("#errnofClaims").html("Enter No of Claims");
		 	         			return;
		 	         		}*/
		 	         		if($("#unitCashValue").val().trim() == ""){
		 	         			$("#errUnitCashValue").html("Enter Unit Cash Value");
		 	         			$("#unitCashValue").focus();
		 	         			return;
		 	         		}
		 	         		if($("#discountTotal").val().trim() == ""){
		 	         			$("#errTotalCashValue").html("Enter Total Cash Value");
		 	         			$("#discountTotal").focus();
		 	         			return;
		 	         		}
		 	     			
		 	      		var nofClaims = $("#nofClaims").val();
		 	     		if(nofClaims == null || nofClaims == "" || nofClaims == undefined)
		 	     			{
		 	     			nofClaims = "";
		 	     			}
		 	     		
		 	     		var unitCashValue = $("#unitCashValue").val();
		 	     		var discountType = $("#discountType").val();
		 	     		if(discountType == "percentage")
		 	     			{
		 	     			if(unitCashValue>100)
		 	     				{
		 	     				$("#errUnitCashValue").html("Coupon Value Should not be Greater than 100%");
		 	         			return;
		 	     				}
		 	     			}


		 	            var unitCashValue = $("#unitCashValue").val();
		 	     		var max_discount_amount = $("#max_discount_amount").val();

                    if(max_discount_amount == "" || max_discount_amount == null || max_discount_amount == undefined){
		 	     			
		 	     			$("#errMaxDiscValue").html("Enter Max Discount");
	                     return;
		 	     			
		 	     		}

                         if(parseFloat(max_discount_amount)==0)
		 	     			{
		 	     				$("#errMaxDiscValue").html("Max Discount Amount value Should not be 0");
		 	     				return;
		 	     			}

		 	     		if(parseFloat(max_discount_amount) < parseFloat(unitCashValue))
		 	     			{
		 	     			$("#errMaxDiscValue").html("Max Discount value Should be Greater than Coupon Value");
		 	     			return;
		 	     			}
		 	     		
		 	     		
		 	             var minsaleamount = $("#minsaleamount").val();
		 	             
		 	             if(minsaleamount == "" || minsaleamount == null || minsaleamount == undefined){
		 		     			
		 		     			$("#minBillError").html("Enter Min Bill");
		 		     			
		 		     		}
		 		     		
		 	     		var max_sale_amount = $("#max_sale_amount").val();
		 	     		
		 	     		if(max_sale_amount == "" || max_sale_amount == null || max_sale_amount == undefined){
		 	     			
		 	     			$("#maxBillError").html("Enter Max Bill");
		 	     			
		 	     		}

		 	     		
		 	     		if(parseFloat(max_sale_amount)==0)
		 	     			{
		 	     				$("#maxBillError").html("Max Bill Amount value Should not be 0");
		 	     				return;
		 	     			}
		 	     		else
		 	     			{
		 	     			if(parseFloat(max_sale_amount) < parseFloat(minsaleamount))
		 	     			{
		 	     			$("#maxBillError").html("Max Bill Amount value Should be Greater than Min Bill Amount");
		 	     			return;
		 	     			}
		 	     			}


		 	     	if(parseFloat(unitCashValue)==0)
		 	 			{
		 	     		$("#errUnitCashValue").html("Coupon Value Should be greater than 0");
		 	 				return;
		 	 			}
		 	 		else
		 	 			{
		 	 			if(discountType == "Flat")
		 	 			{
		 	 				if(parseFloat(unitCashValue) > parseFloat(max_sale_amount))
		 	 	 			{
		 	 				$("#errUnitCashValue").html("Coupon Value Should be less than Max Bill Amount");
		 	 	 			return;
		 	 	 			}
		 	 			}
		 	 			
		 	 			}
		 	     		
		 	     		
		 	     	var splitCoupon=$("#limitedUseCoupon").val();
		 	     		if(splitCoupon==0)
		 	     			{
		 	     				var splitClames=$("#noOfClaimsLimited").val();
		 	     				if(splitClames<=0)
		 	     					{
		 	     					$("#SplitClamesError").html("Split Clame value should be greater than 0");
		 	     					return
		 	     					}
		 	     			}
		 	     		
		 	     	
		 	     		var zones = $("#zones").val();
		 	     		if(zones == "" || zones == null){
		 	     			$("#errStates").html("Select zone");
		 	     			return;
		 	     		}
		 	     		var locations = $("#location").val();
		 	     		if(locations == "" || locations == null){
		 	     			$("#errLocation").html("Select Location");
		 	     			return;
		 	     		}
		 	     		
		 	     		$("#selectedZone").val(zones.toString());
		 	     		$("#selectedLocation").val(locations.toString());
		 	     		
		 	     		if ($('#otpRequired').is(':checked')) 
		 	    			$("#otpRequired").val("0");
		 	    		else
		 	    			$("#otpRequired").val("1");
		 	     		
		 	     		
		 	     		if ($('#autoCoupons').is(':checked')) 
		 	    			$("#autoCoupons").val("1");
		 	    		else
		 	    			$("#autoCoupons").val("0");
		 	     		
		 	     		
		 	     		
		 	     		var location = "";
		 		    	if($("#outletLocation").length > 0)
		 		    		location = $("#outletLocation").val();
		 		    	var zone = "";
		 		    	if($("#outletZone").length > 0)
		 		    		zone = $("#outletZone").val();
		 		    	var startdate = "";
		 		    	if($("#couponStartDate").length > 0)
		 		    		startdate = $("#couponStartDate").val();
		 		    	var enddate = "";
		 		    	if($("#couponEndDate").length > 0)
		 		    		enddate = $("#couponEndDate").val();
		 	    	  	
		 		    	var searchName = "";
		 			 		if($("#searchCoupons").length > 0 )
		 			 			searchName = $("#searchCoupons").val().trim();
		 			 		
		 			   var giftCouponsMasterObj = {};
		 			 		
		 			 		giftCouponsMasterObj.couponProgramCode = $("#promoCode").val();
		 			 		giftCouponsMasterObj.createdOnStr = $("#createdOn").val();
		 			 		giftCouponsMasterObj.assignedStatusStr = $("#assignedStatus").val();
		 			 		giftCouponsMasterObj.multiplesStr = $("#multiplesValue").val();
		 			 		giftCouponsMasterObj.quantity = $("#quantity").val();
		 			 		giftCouponsMasterObj.noOfCoupons = $("#quantity").val();
		 			 		giftCouponsMasterObj.noOfCliams = $("#nofClaims").val();
		 			 		giftCouponsMasterObj.promoName = $("#promoName").val();
		 			 		giftCouponsMasterObj.expiryDateStr = $("#expiryDate").val();
		 			 		giftCouponsMasterObj.validityPeriod = $("#validityPeriod").val();
		 			 		giftCouponsMasterObj.limitedUseCouponStr = $("#limitedUseCoupon").val();
		 			 		giftCouponsMasterObj.noOfClaimsLimited = $("#noOfClaimsLimited").val();
		 			 		giftCouponsMasterObj.max_discount_amount = $("#max_discount_amount").val();
		 			 		giftCouponsMasterObj.min_sale_amount = $("#minsaleamount").val();
		 			 		giftCouponsMasterObj.max_sale_amount = $("#max_sale_amount").val();
		 			 		giftCouponsMasterObj.totalCashValue = $("#discountTotal").val();
		 			 		giftCouponsMasterObj.discountType = $("#discountType").val();
		 			 		giftCouponsMasterObj.unitCashValue = $("#unitCashValue").val();
		 			 		giftCouponsMasterObj.status = $("#status").val();
		 			 		giftCouponsMasterObj.genareteCoupons = $("#autoCoupons").val();
		 			 		giftCouponsMasterObj.requiredOTP = $("#otpRequired").val();
		 			 		giftCouponsMasterObj.country = $("#country").val();
		 			 		giftCouponsMasterObj.status = $("#status").val();
		 			 		giftCouponsMasterObj.selectdZones = $("#selectedZone").val();
		 			 		giftCouponsMasterObj.locations = $("#selectedLocation").val();
		 			 		giftCouponsMasterObj.uploadedfilePath = $("#coupons_name").val();
		 			 		giftCouponsMasterObj.productGroupMaster=$("#productGroup").val();
						    giftCouponsMasterObj.customerGroup=$("#customerGroupval").val();
						    giftCouponsMasterObj.perUserClaims=$("#perUserClaims").val();
						    giftCouponsMasterObj.splitPeriod=$("#splitPeriod").val();
						    giftCouponsMasterObj.couponType=$("#isDiscountCoupon").val();
						    
		 			 		if(operation== "edit"){
		 						var len = $("#cardsDetails tr").length-1;
		 						var giftCoupons = [];
		 						var customerGiftCoupons = [];
		 						$('.edited').each(function() {
		 							  var idAttr= $(this).attr("id").replace('customerMobile','');
		 							
		 							debugger;
		 							var status=$("#couponState"+idAttr).val();
		 							if(status=="InActive")
		 								{
		 								status=false;
		 								}
		 							else
		 								{
		 								status=true;
		 								}
		 							
		 							var total_records= 0;
		 							total_records =parseInt($("#totalRecords"+idAttr).val());
		 							
		 							if(total_records == null || total_records == undefined || isNaN(coupon_value)){
		 								total_records = 0;
		 							}
		 							 
		 							var coupon_value =  parseFloat($("#couponValue"+idAttr).val());
		 							
		 							if(coupon_value == null || coupon_value == undefined || isNaN(coupon_value))  {
		 								coupon_value = 0;
		 							}
		 							
		                         var assigned_Status = $("#assignedStatus"+idAttr).val();
		 							
		 							if(assigned_Status == "true" )  {
		 								assigned_Status = true;
		 							}else{
		 								assigned_Status = false;
		 							}
		 							
		 							 var coupon_Status = $("#couponState"+idAttr).val();
		 								
		 								if(coupon_Status == "Active" )  {
		 									coupon_Status = true;
		 								}else{
		 									coupon_Status = false;
		 								}
		 								var obj = {couponStatus:status,noOfCliams:parseInt($("#noOfCliams"+idAttr).val()),couponProgramCode:$("#promoCode").val(),couponCode:$("#couponCodes"+idAttr).val(),couponId:$("#couponIDs"+idAttr).val(),assignedStatus:assigned_Status,startDateStr:$("#startDateStr"+idAttr).val(),endDateStr:$("#endDateStr"+idAttr).val()};
		 								var obj1 = {customerMobile:$("#customerMobile"+idAttr).val(),customerName:$("#customerName"+idAttr).val(),issuedAtStr:$("#issuedAtStr"+idAttr).val(),validityDateStr:$("#validityDateStr"+idAttr).val(),couponProgramCode:$("#promoCode").val(),couponCode:$("#couponCodes"+idAttr).val(),issuedAt:$("#issuedAt"+idAttr).val(),customerEmail:$("#customerEmail"+idAttr).val(),claimStatus:parseInt($("#claimStatus"+idAttr).val()),noOfClaims:parseInt($("#noOfCliams"+idAttr).val()),claimedAt:$("#claimedAt"+idAttr).val(),billRef:$("#billRef"+idAttr).val(),couponValue:coupon_value,couponId:$("#couponId"+idAttr).val(),totalRecords:total_records,sNo:$("#sNo"+idAttr).val()};
		 							
		 							giftCoupons.push(obj);
		 							customerGiftCoupons.push(obj1);

		 						});
		 						var List1=JSON.stringify(giftCoupons);
		 						var List2=JSON.stringify(customerGiftCoupons);
		 						giftCouponsMasterObj.giftCoupons=giftCoupons;
		 						
		 						giftCouponsMasterObj.customerGiftCoupons=customerGiftCoupons;
		 						
		 						var editPlusCouponsString="";
		 		                 
		 		                 
		 		                 for(var editPlusCoupon in editPlusCoupons )
		 		 				{
		 		                	 editPlusCouponsString += editPlusCoupons[editPlusCoupon] +","; 
		 		 				}
		 		                 
		 		                 
		 		                 giftCouponsMasterObj.customerCouponidsStr=editPlusCouponsString;
		 		                if(isRenewCoupon == "true")
			 			 			giftCouponsMasterObj.renewCoupon = true;
			 			 		else if(isRenewCoupon == undefined || isRenewCoupon == null || isRenewCoupon == "")
			 			 			giftCouponsMasterObj.renewCoupon = false;
		 						}
		 			 		 
		 			 		 var formData =JSON.stringify(giftCouponsMasterObj);
		 			 		 console.log(formData);
		 			 		
		 	     		 var contextPath = $("#contextPath").val();
		 	     	   	   if(operation=="new"){
		 	     	    	 URL = contextPath + "/crm/createGiftCoupons.do";
		 	     	   	   }
		 	     	   	   else if(operation == "edit")
		 	     	   		 URL = contextPath + "/crm/updateGiftCoupons.do";
		 	     	   	  
		 	     	   	  	 $.ajax({
		 	     	  			type: "POST",
		 	     	  			url : URL,
		 	     	  			contentType: "application/json",
		 	     	            data :formData,
		 	     	            beforeSend: function(xhr){                    
		 	     	            	$("#loading").css("display","block");
		 	     	            	$("#mainDiv").addClass("disabled");
		 	     	            },
		 	     	            success : function(result) {
		 	     	            	debugger
		 	     	            	
		 	     	            	$("#right-side").html(result);
		 	     	            	$("#outletLocation").val(location);
		 	     	            	$("#outletZone").val(zone);
		 	     	            	$("#couponStartDate").val(startdate);
		 	     	            	$("#couponEndDate").val(enddate);
		 	     	            	$("#searchCoupons").val(searchName);
		 	     	            	if(filePath!=null && filePath!=undefined && filePath!="")
		 	     	            	{
		 	     	            		importDataxls()
		 	     	            	}
		 	     	            	else
		 	     	            	{
		 	     	            		$("#Success").css("display","block");
		 	     						$("#Error").css("display","block");
		 	     	                    $("#loading").css("display","none");
		 	     	  	            	$("#mainDiv").removeClass('disabled');
		 	     	            	}
		 	     	            	/*$("#loading").css("display","none");
		 	     	            	$("#mainDiv").removeClass('disabled');*/
		 	     	            },
		 	     	  			error : function(e) {
		 	     	  				console.log(JSON.stringify(e));
		 	     	  				 alert("something went wrong");
		 	     	  				$("#loading").css("display","none");
		 	     	  			   /* $("#outletLocation").val(location);
		 		   			        $("#outletZone").val(zone);
		 		   			        $("#couponStartDate").val(startdate);
		 		   			        $("#couponEndDate").val(enddate);
		 		   				    $("#searchCoupons").val(searchName);*/
		 	     	 				$("#mainDiv").removeClass('disabled');
		 	     	  			}
		 	     	  		});
		 	     	}
		 			
		 

		 function vieweditGiftCouponDetailsForPagination(id,index){
		  	 var contextPath = $('#contextPath').val();
		  	var maxRecords = 10;
		  	if ($("#maxRecords").length > 0)
		  		maxRecords = $("#maxRecords").val();
		  	
		  	//
//		  	if(name == "")
 	 		var searchname = "";
 	 		searchname = $("#searchGiftCouponItems").val();
		  	
		  	 var URL = contextPath + "/crm/vieweditGiftCouponDetailsForPagination.do";
		  	 $.ajax({
		  		type : "GET",
		  		url : URL,
		  		data : {
		  		couponProgramCode : id,
   	 			  maxRecords : maxRecords,
   	  			index:index,
   	  		    searchname : searchname
		  		},
		  		beforeSend: function(xhr){                     
		 	   			$("#loading").css("display","block");
		 	   			$("#mainDiv").addClass("disabled");
		 	   		  },
		  		success : function(result){
//					activeMenu('Loyaltycards');
					//
		  			$('#generatedGiftCoupons').html(result);
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
		
		
		
		/*function viewGiftCouponDetails(id,type){
    		var contextPath = $("#contextPath").val();
   			URL = contextPath + "/crm/viewGiftCouponDetails.do";
   	 		 //
   			var location = "";
	    	if($("#outletLocation").length > 0)
	    		location = $("#outletLocation").val();
	    	var zone = "";
	    	if($("#outletZone").length > 0)
	    		zone = $("#outletZone").val();
	    	var startdate = "";
	    	if($("#couponStartDate").length > 0)
	    		startdate = $("#couponStartDate").val();
	    	var enddate = "";
	    	if($("#couponEndDate").length > 0)
	    		enddate = $("#couponEndDate").val();
	    	var searchName = "";
		 		if($("#searchCoupons").length > 0 )
		 			searchName = $("#searchCoupons").val().trim();
   			
   	 		$.ajax({
   	 			type: "GET",
   	 			url : URL,
   	 			data : {
   	 				id : id,
   	 				type : type
   	 			},
   	 			beforeSend: function(xhr){                    
   	   	   			$("#loading").css("display","block");
   	   	   			$("#mainDiv").addClass("disabled");
   	   	   		  },
   	   			success : function(result) {
   	   				//
   	 				$("#right-side").html(result);
   	   			    $("#outletLocation").val(location);
	   			    $("#outletZone").val(zone);
	   			    $("#couponStartDate").val(startdate);
	   			    $("#couponEndDate").val(enddate);
	   				$("#searchCoupons").val(searchName);
   	 				$("#loading").css("display","none");
   	 				$("#mainDiv").removeClass('disabled');
   	 			},
   	 			error : function() {
   	 				 alert("something went wrong");
   	 				$("#loading").css("display","none");
   	 				$("#mainDiv").removeClass('disabled');
   	 			}
   	 		});
    	}*/
		
		
		 function viewGiftCouponDetails(id,type){
				debugger;
	    		var contextPath = $("#contextPath").val();
	   			URL = contextPath + "/crm/viewGiftCouponDetails.do";
	   	 		 //
	   			var location = "";
		    	if($("#outletLocation").length > 0)
		    		location = $("#outletLocation").val();
		    	var zone = "";
		    	if($("#outletZone").length > 0)
		    		zone = $("#outletZone").val();
		    	var startdate = "";
		    	if($("#couponStartDate").length > 0)
		    		startdate = $("#couponStartDate").val();
		    	var enddate = "";
		    	if($("#couponEndDate").length > 0)
		    		enddate = $("#couponEndDate").val();
		    	var searchName = "";
			 		if($("#searchCoupons").length > 0 )
			 			searchName = $("#searchCoupons").val().trim();
	   			
	   	 		$.ajax({
	   	 			type: "GET",
	   	 			url : URL,
	   	 			data : {
	   	 				id : id,
	   	 				type : type
	   	 			},
	   	 			beforeSend: function(xhr){                    
	   	   	   			$("#loading").css("display","block");
	   	   	   			$("#mainDiv").addClass("disabled");
	   	   	   		  },
	   	   			success : function(result) {
	   	   				//
	   	 				$("#right-side").html(result);
	   	   			    $("#outletLocation").val(location);
		   			    $("#outletZone").val(zone);
		   			    $("#couponStartDate").val(startdate);
		   			    $("#couponEndDate").val(enddate);
		   				$("#searchCoupons").val(searchName);
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
		
		
		
		function addNameToTextBox(id){
			debugger;
			couponsFiles = [];
	    	couponsFiles = event.target.files;
			/*addFileToArray(id);
			if($("#"+id+"Btn")[0].files[0] != undefined)
				$("#"+id+"File").val($("#"+id+"Btn")[0].files[0]['name']);
			else
				$("#"+id+"File").val("");*/
	    	$("#importCoupouns").val("Import")
		}
	
		
		
		function importDataxls(){
			debugger;
			if(couponsFiles.length <= 0)
			{
			alert("Please Select Excel Sheet... ");
				return;
			}
			
			var oMyForm = new FormData();
			//var files = id+'Files';

				oMyForm.append("file", couponsFiles[0]);
//				var fileSize = couponsFiles[0].size;

			var contextPath = $("#contextPath").val();
			URL = contextPath + "/dataManagement/couponsData.do";
			$.ajax({
				dataType : 'json',
				url : URL,
				data :	oMyForm,
				type : "POST",
				enctype: 'multipart/form-data',
				processData: false, 
				contentType:false,
				beforeSend: function(xhr){                    
  	            	$("#loading").css("display","block");
  	            	$("#mainDiv").addClass("disabled");
  	            },
  	            
				success : function(result) {
					debugger;
					
					var error =result.msg
					var url=result.url
					$("#Success").css("display","block");
					$("#Error").css("display","block");
					if(url != undefined && url !="")
		  			{
						$("#errr").html(error+".");
		  				$("#htpUrl").attr("href", url); 
		  				$("#url").css("display","block");

		  			}
					else{
						if(error.trim() != "Successfully Uploaded" && error != "" && error != undefined && error != null)
						$("#Error").html(error);
					}
					$("#loading").css("display","none");
  	            	$("#mainDiv").removeClass('disabled');
  	            	
					/*messageStatus= JSON.stringify(result.responseText);
		  			var parsed_json = JSON.parse(messageStatus);
		  			var error = parsed_json.err;
		  			var errorUrl = parsed_json.errorUrl;
		  			alert(error);*/
					/*replaceWithNewFileType(id);
					$("#"+id+"File").val("");
					$("#"+id).prop('checked',false);
					enableFileBrowse('',id );
					if((error != undefined && error !="" ) || error == null){
						$("#"+id+"Img").attr("src",contextPath+"/images/error.jpg");
						$("#Error").html(error);
					}*/

					//errorUrl = parsed_json.errorUrl;
					/*if(errorUrl != undefined && errorUrl !="" && errorUrl != null && errorUrl != 'null')
					{
						//$("#errorUrl").attr("href", "http://"+errorUrl); 
						var pattern = /\\/;
						var err = errorUrl.split(pattern);
						errorUrl = err[0] + "//" + err[1];	
						$("#url").css("display","block");
					}
*/
					//var msg = parsed_json.msg;
					/*if(msg != undefined && msg !="")
						$("#"+id+"Img").attr("src",contextPath+"/images/tickMark.png");
					$("#"+id+"Img").closest('span').css("visibility","visible");*/
				},
				error : function(result){
					$("#Success").css("display","block");
					$("#Error").css("display","block");
		  			
					alert("Somthing Went Wrong, please contact Technolabs support.");
					/*debugger;
					messageStatus= JSON.stringify(result.responseText);
					var parsed_json = JSON.parse(messageStatus);
					var error = parsed_json.msg;
					var url = parsed_json.url;
					alert(error);*/
					
					/*
					debugger;
//					messageStatus= JSON.stringify(e.responseText);
		  			var parsed_json = JSON.parse(e.responseText);
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
				}
			});
		}
		
		
		
		function importVoucherDataxls(){
			//;
			debugger;
			
			
			if(couponsFiles.length <= 0)
			{
			alert("Please Select Excel Sheet... ");
				return;
			}
			var oMyForm = new FormData();
			oMyForm.append("file", couponsFiles[0]);
			var contextPath = $("#contextPath").val();
			URL = contextPath + "/dataManagement/giftVouchersData.do";
			$.ajax({
				dataType : 'json',
				url : URL,
				data :	oMyForm,
				type : "POST",
				enctype: 'multipart/form-data',
				processData: false, 
				contentType:false,
				success : function(result) {
					/*debugger;
					messageStatus= JSON.stringify(result);
					var parsed_json = JSON.parse(messageStatus);
					var error = parsed_json.err;
					alert(error);
					$("#coupons").val("")
					var msg = parsed_json.msg;
					*/
                    debugger;
					
					var error =result.msg
					var url=result.url
					$("#Success").css("display","block");
					$("#Error").css("display","block");
					if(url != undefined && url !="")
		  			{
						$("#errr").html(error+".");
		  				$("#htpUrl").attr("href", url); 
		  				$("#url").css("display","block");

		  			}
					else{
						if(error.trim() != "Successfully Uploaded" && error != "" && error != undefined && error != null)
						$("#Error").html(error);
					}
					$("#loading").css("display","none");
  	            	$("#mainDiv").removeClass('disabled');
				},
				error : function(e){
					debugger;
		  			var parsed_json = JSON.parse(e.responseText);
		  			var error = parsed_json.errorUrl;
		  			
		  			var errorUrl = parsed_json.errorUrl;
		  			if(errorUrl != undefined && errorUrl !="")
		  			{
		  				var pattern = /\\/;
						var err = errorUrl.split(pattern);
						errorUrl = err[0] + "//" + err[1];	
		  				$("#url").css("display","block");

		  			}

		  			var msg = parsed_json.msg;
				}
			});
		}

		function loadFileAsURL(id,ele) {
			if (ele.files && ele.files[0]) {
				
				var fileToLoad = ele.files[0];
					var name = fileToLoad['name'];
					$("#"+id+"_name").val(name);
			        var reader = new FileReader();
			       reader.readAsDataURL(ele.files[0]);
			        var oMyForm = new FormData();
			        oMyForm.append("file",  ele.files[0]);
			        if($("#"+id+"_refId").val() != "")
			        	oMyForm.append("refId",  $("#"+id+"_refId").val().trim());
			        else
			        	oMyForm.append("refId", "");
			        var contextPath = $("#contextPath").val();
			        var URL = contextPath + "/inventorymanager/addToAttachementList.do";
			        $.ajax({

			        	url : URL,
			        	data : oMyForm,
			        	type : "POST",
			        	enctype : 'multipart/form-data',
			        	processData : false,
			        	contentType : false,
			        	beforeSend : function(xhr) {
			        	},
			        	success : function(result) {
			        		$("#"+id+"_refId").val(result);
			        	},
			        	error : function() {
			        		alert("Internal error, please contact Technolabs support.");
			        	}
			        });
			    
			}
		};
        
		/*Added by : Swathi*/
		var newcountProduct = $("#cardsDetails tr").length -1;

		function addCoupon() {
		debugger;
	   
		newcountProduct = newcountProduct + 1;
		
		if(newcountProduct <= 0){
			
		
			var currentDealSlabDivContent = dealProductDivContent;
			/*currentDealSlabDivContent = currentDealSlabDivContent.replace('1rangename',
					newcountProduct + 'rangename');*/
			currentDealSlabDivContent = currentDealSlabDivContent.replace('productrange'+ newcountProduct-1,
					'productrange' + newcountProduct);
			currentDealSlabDivContent = currentDealSlabDivContent.replace('productcoupon'+ newcountProduct-1,
					'productcoupon' + newcountProduct);
			
			currentDealSlabDivContent = currentDealSlabDivContent.replace('1couponCode',newcountProduct+'couponCode');
			currentDealSlabDivContent = currentDealSlabDivContent.replace('1customerMobile',newcountProduct+'customerMobile');
			currentDealSlabDivContent = currentDealSlabDivContent.replace('1startDate',newcountProduct+'startDate');
			
			currentDealSlabDivContent = currentDealSlabDivContent.replace('1endDate',newcountProduct+'endDate');
			currentDealSlabDivContent = currentDealSlabDivContent.replace('1claimStatus',+newcountProduct+'claimStatus');
			
			
			
			currentDealSlabDivContent = currentDealSlabDivContent.replace('1noOfCliams',newcountProduct+'noOfCliams');
			currentDealSlabDivContent = currentDealSlabDivContent.replace('1couponState',newcountProduct+'couponState');
			currentDealSlabDivContent = currentDealSlabDivContent.replace('productrange1','productrange'+newcountProduct);
		
			 $("#cardsDetails tbody")
				.append(currentDealSlabDivContent);
			 $("#productcoupon"+newcountProduct).text(newcountProduct);
			 $(".couponCode").val("");
			 $(".couponCode"+couponCode).removeAttr("readonly");
		}
		  		if(newcountProduct <= $("#quantity").val()){

					var currentDealSlabDivContent = dealProductDivContent;
					/*currentDealSlabDivContent = currentDealSlabDivContent.replace('1rangename',
							newcountProduct + 'rangename');*/
					currentDealSlabDivContent = currentDealSlabDivContent.replace('productrange1',
							'productrange' + newcountProduct);
					currentDealSlabDivContent = currentDealSlabDivContent.replace('productcoupon1',
							'productcoupon' + newcountProduct);
					
					currentDealSlabDivContent = currentDealSlabDivContent.replace('1couponCode',newcountProduct+'couponCode');
					currentDealSlabDivContent = currentDealSlabDivContent.replace('1customerMobile',newcountProduct+'customerMobile');
					currentDealSlabDivContent = currentDealSlabDivContent.replace('1startDate',newcountProduct+'startDate');
					
					currentDealSlabDivContent = currentDealSlabDivContent.replace('1endDate',newcountProduct+'endDate');
					currentDealSlabDivContent = currentDealSlabDivContent.replace('1claimStatus',+newcountProduct+'claimStatus');
					
					currentDealSlabDivContent = currentDealSlabDivContent.replace('1noOfCliams',newcountProduct+'noOfCliams');
					currentDealSlabDivContent = currentDealSlabDivContent.replace('1couponState',newcountProduct+'couponState');
					currentDealSlabDivContent = currentDealSlabDivContent.replace('productrange1','productrange'+newcountProduct);
				
					 $("#cardsDetails tbody")
						.append(currentDealSlabDivContent);
					 $("#productcoupon"+newcountProduct).text(newcountProduct);
					 $("#"+newcountProduct+"couponCode").removeAttr("readonly");
					 $("#"+newcountProduct+"couponCode").val("");
					 $("#"+newcountProduct+"customerMobile").removeAttr("readonly");
					 $("#"+newcountProduct+"customerMobile").val("");
		  		}
		  		
		  		else{
		     			$("#errtable").html("Coupons limit exceeded");
		     			return;
		     		}
		  			
				
			}
		var dealSlabDivContent = null;
		function setDealSlabDivContent() {
			dealSlabDivContent = $('#range1').prop('outerHTML');
		}
	
	
		var dealProductDivContent = null;
		function setDealProductDivContent() {
			debugger
		dealProductDivContent = $('#productrange1').prop('outerHTML');
		}
		
var editPlusCoupons =[];
		
		function couponEdit(count)
		{
			debugger;
			
			var promoCodeedit = $("#couponCodes"+count).val();
				$(".customerMobile"+count).removeAttr("readonly");
				$(".claimStatus"+count).removeAttr('disabled');
				$(".noOfCliams"+count).removeAttr("readonly");
				$(".couponState"+count).removeAttr('disabled');
				
				editPlusCoupons.push(promoCodeedit);
				$("#customerMobile"+count).addClass("edited");
		}
		
		function saveForCoupon(loyaltyCouponNumber,index){
			debugger
		var	items=[];
			
        var len = $("#cardsDetails tr").length-1;
			
			if(len != 0){
				
			for(var i=1;i<=len;i++){
				
		
					var obj = {
							// "sno" : $(i+"#sno").text(),
							 "couponCode" : $("#"+i+"couponCode").val(),
							 "customerMobile" : $("#"+i+"customerMobile").val(),
							 "startDate" : $("#"+i+"startDate").val(),
							 "endDate" : $("#"+i+"endDate").val(),
							 "claimStatus" : $("#"+i+"claimStatus").val(),
							 "noOfCliams" : $("#"+i+"noOfCliams").val(),
						     "couponState" : $("#"+i+"couponState").val(),
						     	 
					 };
					var num1=$("#"+i+"noOfCliams").val();
					var num2=$("#nofClaims").val();
					if(num1>num2)
						{
						alert("Pending Claims should be less than No of Claims");
		     			return;
						}
					if($("#"+i+"couponCode").val()=="")
					{
					$("#errtable").html("Coupon Id is mandatory");
	     			return;
					}
					items.push(obj);
					
				}
			var zones = $("#zones").val();
			var locations = $("#location").val();
			$("#selectedZone").val(zones.toString());
     		$("#selectedLocation").val(locations.toString());
     		
     		
			var giftCouponsMasterObj = {};
	 		
	 		giftCouponsMasterObj.couponProgramCode = $("#promoCode").val();
	 		giftCouponsMasterObj.createdOnStr = $("#createdOn").val();
	 		giftCouponsMasterObj.assignedStatusStr = $("#assignedStatus").val();
	 		giftCouponsMasterObj.multiplesStr = $("#multiplesValue").val();
	 		giftCouponsMasterObj.quantity = $("#quantity").val();
	 		giftCouponsMasterObj.noOfCliams = $("#nofClaims").val();
	 		giftCouponsMasterObj.noOfCliams = $("#nofClaims").val();
	 		giftCouponsMasterObj.promoName = $("#promoName").val();
	 		giftCouponsMasterObj.expiryDateStr = $("#expiryDate").val();
	 		giftCouponsMasterObj.validityPeriod = $("#validityPeriod").val();
	 		giftCouponsMasterObj.limitedUseCouponStr = $("#limitedUseCoupon").val();
	 		giftCouponsMasterObj.noOfClaimsLimited = $("#noOfClaimsLimited").val();
	 		giftCouponsMasterObj.max_discount_amount = $("#max_discount_amount").val();
	 		giftCouponsMasterObj.min_sale_amount = $("#minsaleamount").val();
	 		giftCouponsMasterObj.max_sale_amount = $("#max_sale_amount").val();
	 		giftCouponsMasterObj.totalCashValue = $("#discountTotal").val();
	 		giftCouponsMasterObj.discountType = $("#discountType").val();
	 		giftCouponsMasterObj.unitCashValue = $("#unitCashValue").val();
	 		giftCouponsMasterObj.status = $("#status").val();
	 		//giftCouponsMasterObj.genareteCoupons = $("#autoCoupons").val();
	 		giftCouponsMasterObj.requiredOTP = $("#otpRequired").val();
	 		giftCouponsMasterObj.country = $("#country").val();
	 		//giftCouponsMasterObj.status = $("#status").val();
	 		giftCouponsMasterObj.selectdZones = $("#selectedZone").val();
	 		giftCouponsMasterObj.locations = $("#selectedLocation").val();
	 		
	 		
	 		giftCouponsMasterObj.giftCouponsMasters=items;
	 		
			var formData = JSON.stringify(giftCouponsMasterObj);
			console.log("formData ;;;;"+formData);
			//return;
			}
			else
				{
				alert("No coupons found");
				return;
				}
			
			var contextPath = $("#contextPath").val();
		    var	URL = contextPath + "/crm/createCustCoupon.do";
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
					
					$('#generatedGiftCoupons').html(result);
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