 function viewLoyaltyCardDetails(loyaltyProgramNumber){
      	    	 var contextPath = $('#contextPath').val();
      	    	 
      	    	var maxRecords = 10;
      	    	if ($("#maxRecords").length > 0)
      	    		maxRecords = $("#maxRecords").val();
      	    	
      	    	 var URL = contextPath + "/crm/viewLoyaltyCardDetails.do";
      	    	 $.ajax({
      	    		type : "GET",
      	    		url : URL,
      	    		
      	    		data : {
      	    			loyaltyProgramNumber : loyaltyProgramNumber,
      	    			maxRecords:maxRecords
      	    		},
      	    		beforeSend: function(xhr){                    
      	   	   			$("#loading").css("display","block");
      	   	   			$("#mainDiv").addClass("disabled");
      	   	   		  },
      	    		success : function(result){
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
 

 
//added by koti bomminenni
	//purpose : to edit LOyaltycards
	
 var editPlusLoyalty =[];
 
	function editLoyaltyCard(count)
	{

		debugger;
		
		var  programNumber = $("#loyaltyPlanId").val();
		var CardNumber = $("#loyaltyCardNumber"+count).text();
		
		
			$("#Name"+count).removeAttr("readonly");
		$("#Number"+count).removeAttr("readonly");
			$("#AvailPoints"+count).removeAttr('readonly');
			$("#assignedStatus"+count).removeAttr("disabled");

			$("#statusofCard"+count).removeAttr("disabled");
			
			
			editPlusLoyalty.push(CardNumber);
			$("#Name"+count).addClass("edited");
			
			
			
			

	}

	
 function searchLoyaltyCards(loyaltyProgramNumber,index,saveFlag)
 {
	 debugger;
	 var contextPath = $('#contextPath').val();
	 var maxRecords = 10;
	 if ($("#maxRecords").length > 0)
		 maxRecords = $("#maxRecords").val();
	 //
	 loyaltyProgramNumber = $("#loyaltyPlanId").val();
	 var searchCriteria = $("#searchItems").val();
	 
	 
	 
	 var URL =contextPath + "/crm/searchLoyaltyCards.do";
	 $.ajax({
		 type : "GET",
		 url : URL,
		 data : {
			 loyaltyProgramNumber : loyaltyProgramNumber,
			 maxRecords : maxRecords,
			 index:index,
			 searchCriteria : searchCriteria,
			 saveFlag:saveFlag
		 },
		 beforeSend: function(xhr){                     
			 $("#loading").css("display","block");
			 $("#mainDiv").addClass("disabled");
		 },
		 success : function(result){
//			 activeMenu('Loyaltycards');
			 $('#generatedLoyaltyCards').html(result);
				var anchor = document.createElement('a');
				anchor.href = $("#loyaltydownloadurl").val();
				anchor.target = '_blank';
				anchor.download = '';
				if($("#loyaltydownloadurl").val()!=null && $("#loyaltydownloadurl").val()!='')
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

 
 

 function validateLoyaltyCards(operation){
	 //;
	 debugger;
		var re = /^[0-9/]+$/;
		if($("#loyaltyProgramName").val().trim() == ""){
			$("#loyaltyProgramName").focus();
			$("#errLoyaltyProgramName").html("Enter a Plan Name");
			return;
		}
		if($("#validFrom").val().trim() == ""){
			$("#validFrom").focus();
//			$("#validFromError").html("Enter a Date");
			return;
		}
		var str = $("#validFrom").val();
		if(!re.test($("#validFrom").val().trim())){
			$("#validFromError").html("Invalid Date");
			return;
		}
		if($("#validTo").val().trim() == ""){
			$("#validTo").focus();
//			$("#validToError").html("Enter a Date");
			return;
		}
		if(!re.test($("#validTo").val().trim())){
			$("#validToError").html("Invalid Date");
			return;
		}
			
		var daysToExpire = daydiff(parseDate(getCurrentDate()), parseDate($('#validTo').val()));
		if(daysToExpire < 0){
			 $("#validToError").html("Valid To should be greater than today");
			 return;
		 }
		 var noOfDays = daydiff(parseDate($('#validFrom').val()), parseDate($('#validTo').val()));
		 if(noOfDays < 0){
			 $("#validToError").html("Valid To can't be less than Valid From");
			 
			 return;
		 }
		// alert(noOfDays)
		 
		 
		 if($("#validityPeriod").val().trim() == "" || parseInt($("#validityPeriod").val().trim())==0){
   			$("#errValidityPeriod").html("Validity period should be atleast 1 day");
   			return;
   		}
   		
   		 var validityPeriod = parseInt($("#validityPeriod").val().trim());
   			if(validityPeriod >noOfDays+1){
   				
   				if(noOfDays==0 && validityPeriod==1)
   					{
   					
   					}
   				else
   					{
   					$("#errValidityPeriod").html("Enter no of days properly");
            			return;
   					}
   				
        			
   			 }
			
		 
		 
		 

		 
		 if($("#startDate").val().trim() == ""){
			 $("#startDate").focus();
//				$("#startDateError").html("Enter a Date");
				return;
			}
			var str = $("#startDate").val();
			if(!re.test($("#startDate").val().trim())){
				$("#startDateError").html("Invalid Date");
				return;
			}
			if($("#endDate").val().trim() == ""){
				$("#endDate").focus();
//				$("#endDateError").html("Enter a Date");
				return;
			}
			if(!re.test($("#endDate").val().trim())){
				$("#endDateError").html("Invalid Date");
				return;
			}
			var daysToExpire = daydiff(parseDate(getCurrentDate()), parseDate($('#endDate').val()));
			if(daysToExpire < 0){
				 $("#endDateError").html("Valid To should be greater than today");
				 return;
			 }
			 var noOfDays = daydiff(parseDate($('#startDate').val()), parseDate($('#endDate').val()));
			 if(noOfDays < 0){
				 $("#endDateError").html("Till date can't be less than Start From");
				 return;
			 }
		 
		/*var states = $("#states").val();
		if(states == "" || states == null){
			$("#errStates").html("Select state");
			return;
		}*/
		if($("#noOfCards").val()== ""){
			 $("#noOfCards").focus();
			$("#errnoOfCards").html("Enter No. of Cards");
			return;
		}
		
		
		if($("#rewardConversionRatio").val() == ""){
			$("#rewardConversionRatio").focus();
			$("#errRewardConversionRatio").html("Enter Rewards Conversion Ratio");
			return;
		}
		if($("#basePoints").val() == ""){
		 $("#basePoints").focus();
			$("#errbasePoints").html("Enter Base Points");
			return;
		}
		if($("#minClaimPoints").val() == ""){
			 $("#minClaimPoints").focus();
				$("#errminpoints").html("Enter Min Points");
				return;
			}
		if($("#minRedeemPoints").val() == ""){
			 $("#minRedeemPoints").focus();
				$("#errminredempoints").html("Enter Min Redeem Points");
				return;
			}
		
		if(operation == "new"){
			
			if(countRewardranges==0){
				alert("add atleast one Reward Criteria");
				return;
			}
			}
		
		
		
		if($("#zone").val() == "" || $("#zone").val() == null){
			 $("#zone").focus();
				$("#errzone").html("Select Zone");
				return;
			}
			
		
		/*if($("#rewardType").val() == "Points"){
			if($("#rewardConversionRatio").val().trim() == ""){
				$("#errRewardConversionRatio").html("Enter Rewards Conversion Ratio");
 			return;
			}
		}
		if($("#rewardConversionRatio").val().split('.').length - 1 > 1){
			$("#errRewardConversionRatio").html("Invalid Amount");
			return;
		}*/
	/*	$("#selectedState").val(states.toString());*/
		//
		if ($('#autoIssue').is(':checked')) 
			$("#autoIssue").val("0");
		else
			$("#autoIssue").val("1");
	
		
		/*var zoneDetails=[];
		if($("#zone").val() != null){
			var zones = $("#zone").val().toString().split(',');
			for(var i=0; i<locations.length; i++){
			//	lc = locations[i];
				obj = {"storeLocation":locations[i],"country":$("#country").val()};
				locDetails.push(obj);
			}
		}
		*/
		
		var autoFlag = $("#autoIssue").val();
	
		
		
		  var loyaltyPurcahseRanges = [];
		  var len = parseInt($("#rewardranges tr").length);
		  
//		  if(len == 0)
//			  {
//			  alert("Please select atleast one range");
//			  return;
//			  }
		  
			for(var i=1;i<len;i++){
		 		var idAttr = $("#rewardranges tr:eq("+i+") td:last").attr("id").replace('Del','');
			var obj = {sno:$("#autoNumber"+idAttr).val(),rewardCriteria:$("#rewardCriteria"+idAttr).text(),minPurchaseValue:$("#startvalue"+idAttr).text(),maxPurchaseValue:$("#endvalue"+idAttr).text(),rewardValue:$("#rewardValue"+idAttr).text(),rewardType:$("#rewardType"+idAttr).text(),loyalty_program_number:$("#loyaltyPlanId").val()}; 
			loyaltyPurcahseRanges.push(obj);
		 	}
			var items = JSON.stringify(loyaltyPurcahseRanges);
			$("#itemDetails").val(items);
			console.log(items)
			
			
			
			if(operation=="edit")
			{
				
				
			
				  var customerLoyaltyCards = [];
				  var len2 = parseInt($("#cardDetails tr").length);
				  

				  $('.edited').each(function() {
					  debugger;
					  var idAttr= $(this).attr("id").replace('Name','');
						//var idAttr=parseInt($(this).text());
				 		var pointear = $("#pointsEarned"+idAttr).val();
				 		if(pointear==null || pointear == ""){
				 			pointear = "0"
				 		}
				 		var pointremain = $("#AvailPoints"+idAttr).val();
				 		if(pointremain==null || pointremain == ""){
				 			pointremain = "0"
				 		}
				 		var pointsuse =  $("#pointsUsed"+idAttr).val();
				 		if(pointsuse==null || pointsuse == ""){
				 			pointsuse = "0"
				 		}
				 		var cashcust = $("#cash"+idAttr).val();
				 		if(cashcust==null || cashcust == ""){
				 			cashcust = "0"
				 		}
				 		
	
				 		
					var obj2 = {loyaltyCardNumber:$("#loyaltyCardNumber"+idAttr).text(),phoneNum:$("#Number"+idAttr).val(),customerName:$("#Name"+idAttr).val(),pointsRemaining:pointremain,createdDate:$("#loyaltyCreatedDate"+idAttr).val(),updatedDate:$("#loyaltyUpdatedDate"+idAttr).val(),status:$("#statuscustomer"+idAttr).val(),email:$("#email"+idAttr).val(),idCardNumber:$("#idCardNumber"+idAttr).val(),idCardType:$("#idCardType"+idAttr).val(),cash:cashcust,pointsUsed:pointsuse,pointsEarned:pointear,loyaltyProgramNumber:$("#loyaltyPlanId").val(),issuedOnStr:$("#issuedOnStr"+idAttr).val(),issueToStr:$("#issuedToStr"+idAttr).val(),cardId:$("#cardId"+idAttr).val()}; 
					customerLoyaltyCards.push(obj2);
				 	});
					var items2 = JSON.stringify(customerLoyaltyCards);
					$("#customerLoyaltyCardsDetails").val(items2);
					console.log(items2)
				
				
				var loyaltyCards = [];
				  var len3 = parseInt($("#cardDetails tr").length);
				  

				  
				  $('.edited').each(function() {
						//var idAttr=parseInt($(this).text());
				 		
					  var idAttr= $(this).attr("id").replace('Name','');

				 		
/*					  ,assignedCustId:$("#assignedCustId"+idAttr).val()
*/					var obj3 = {loyaltyCardNumber:$("#loyaltyCardNumber"+idAttr).text(),cardStatus:$("#statusofCard"+idAttr).val(),loyaltyProgramNumber:$("#loyaltyPlanId").val(),cardId:$("#loyaltyPlanId").val(),assignedStatus:$("#assignedStatus"+idAttr).val(),otpRequired:$("#requiredOTP").val(),startDateStr:$("#loyaltyCreatedDate"+idAttr).text(),endDateStr:$("#loyaltyUpdatedDate"+idAttr).text()}; 
					loyaltyCards.push(obj3);
				 		});
					var items3 = JSON.stringify(loyaltyCards);
					$("#loyaltyCardsdetails").val(items3);
					console.log(items3);
				
					
					
					
					
					var loyaltyZones = [];
					var len4 = parseInt($("#lengthofzone").val());
					
					 var zoneLst=$("#zone").val();
					 var zoneStr="";
					 for(var i = 0 ; i < zoneLst.length;i++)
						 zoneStr =zoneStr+zoneLst[i]+",";
					 
					for(var i=1;i<len4;i++){
				 		var idAttr =i;
					var obj4 = {loyaltyProgId:$("#loyaltyPlanId").val(),states:$("#states"+idAttr).val(),country:$("#country").val(),loyaltyZoneDescription:$("#loyaltyZoneDescription"+idAttr).val(),zone:zoneStr}; 
					loyaltyZones.push(obj4);
					
				 	}
					var items4 = JSON.stringify(loyaltyZones);
					$("#loyaltyZoneDetails").val(items4);
					console.log(items4);
				
				
				
					
				
					$("#loyaltyCardsIds").val(editPlusLoyalty);	
					
					var programids=$("#loyaltyPlanId").val()
					
					$("#customerLoyaltyCardsIds").val(programids);
					
			$("#deleteditemDetails").val(deletedPlus);
			}
			
			
		var formData  = JSON.stringify($('form').serializeObject());
		 
	
		var data = JSON.parse(formData);
		
		//below code converts the list to Respecive Strings
		/*var states = [];
		 states.push(data.states);
		 var state="";
		 for(var i = 0 ; i < states.length;i++)
		 state = state +states[i]+",";
		 
		 data.states = state;*/
		 var zones = [];
		
		 zones.push(data.zone);
		 var zone="";
		 for(var i = 0 ; i < zones.length;i++)
		 zone =zone+zones[i]+",";
		data.zone = zone;
		
		var deleteRanges = [];
		var deleteRangeItems="";
		
		var formData  = JSON.stringify(data);
		
		
		
		
		 console.log(formData);
		 var contextPath = $("#contextPath").val();
	   	   if(operation=="new")
	   	   {
	    	 URL = contextPath + "/crm/createLoyaltyCards.do";
	   	   }
	   	   
	   	   else if(operation=="edit")
	   	   {
	   		 URL = contextPath + "/crm/updateLoyaltyCards.do";
	   	   }
	   	   
	   	  	 $.ajax({
	  			type: "POST",
	  			url : URL,
	  			contentType: "application/json",
	            data :formData,
	            
	            beforeSend: function(xhr){                    
    	   			$("#loading").css("display","block");
    	   			setTimeout(function(){ $('#loading').css('z-index','2'); },20)
    	   			$("#mainDiv").addClass("disabled");
    	   		  },
    	   		  
    	   		  
    	   		success : function(result) {
//	    				activeMenu('Loyaltycards');
	    				$('#right-side').html(result);
	    				
	    				$("#loading").css("display", "none");
	    				$("#mainDiv").removeClass('disabled');
	    			},
	    			error : function() {
	    				alert("Something went wrong");
	    				$("#loading").css("display", "none");
	    				$("#mainDiv").removeClass('disabled');
	    			}
    	   		  
    			
	  		});
	}
 
 
 
 function appendNoOfDays()
 {
	 var validdate = parseDate($('#validTo').val());
	 if(validdate!='')
		 var noOfDays = daydiff(parseDate($('#validFrom').val()), parseDate($('#validTo').val()));
		 $("#validityPeriod").val(noOfDays);
 }
 
 
 var countRewardranges = 0;
 function addRewardranges(){
		//
		 var contextPath = $("#contextPath").val();
		 //purpose:for checking internet conection
		var online = window.navigator.onLine;
	  	if(!online){
	  	alert("check your internet connection,please try agian after some time");
	  	return;
	  	}
		
			 var len = parseInt($("#rewardranges tr").length);
			if (len != 1)
			len = parseInt($("#rewardranges tr:last").attr("id").replace('dynamicdiv', '')) + 1;
			 var type = $("#type").val();
			var slNo = 1; 
				 $('.slno').each(function(){
					$(this).text(slNo);
					slNo = parseInt(slNo) + 1;
				});
				 var startvalue = 0;
				 var endvalue = 0;
				 var rewardValue = 0;
				 
				 
				 
				 if($("#purchaseRangeStart").length>0 &&$("#purchaseRangeStart").val()!="")
					startvalue = $("#purchaseRangeStart").val();
				 if($("#purchaseRangeEnd").length>0)
					endvalue = $("#purchaseRangeEnd").val();
				 if($("#rewardValue").length>0)
					 rewardValue = $("#rewardValue").val();
				 if($("#rewardType").length>0)
					var rewardType = $("#rewardType").val();
				 var rewardCriteria = $("#rewardCriteria").val();
				 
				 if(startvalue=="")
				 {
				 alert("Please select start value");
				 return;
				 }
				 if(endvalue=="")
				 {
				 alert("Please select end value");
				 return;
				 }
				 if(rewardValue=="")
				 {
				 alert("Please select reward value");
				 return;
				 }
				 
				 if(len!=0){
                for (var i = 1; i <= len; i++) {
					 if(startvalue==$("#startvalue"+i).text().trim() && endvalue==$("#endvalue"+i).text().trim() && rewardValue==$("#rewardValue"+i).text().trim() ){
					 alert("Purchase Rnage already added");
					 return;
					 }
					/*if(parseFloat(startvalue)<=parseFloat($("#endvalue"+i).text().trim()) || parseFloat(endvalue)<=parseFloat($("#endvalue"+i).text().trim())) 
					 {
						alert("start end end value should be greater than previous range");
						return;
					 }*/
				 }
				 } 
			 var row = "<tr id='dynamicdiv"+len+"' class='MoveableRow' style='margin-top:5px;'>" +
			 "<td id='rewardCriteria"+len+"'>"+rewardCriteria+"</td>" +	
			 "<td id='startvalue"+len+"'>"+startvalue+"</td>" +
			 "<td id='endvalue"+len+"'>"+endvalue+"</td>" +
			 "<td id='rewardType"+len+"'>"+rewardType+"</td>" +
			 "<td id='rewardValue"+len+"'>"+rewardValue+"</td>" +
			"<td  id='Del"+len+"'><img id='Dele"+len+"' src='"+contextPath+"/images/itemdelete.png' style='width:45%;cursor:pointer;' onclick='deleteItem(this);' title='Delete'/>"+
			"</td></tr>";
				
		$("#rewardranges tbody").append(row);
		$("#data").css("display","block");
		countRewardranges = countRewardranges+1;
	}
 var deletedPlus =[];
 function deleteItem(element){
	 debugger;
		//
		var id = $(element).attr("id").replace('Dele','');
		var ids = $("#autoNumber"+id).val();
		deletedPlus.push(ids);
		
		$('#dynamicdiv'+id).remove();
		
		
		
		var slNo = 1; 
		 $('.slno').each(function(){
			$(this).text(slNo);
			slNo = parseInt(slNo) + 1;
		});

	}
 function editLoyaltyCardDetails(loyaltyProgramNumber){
  	 var contextPath = $('#contextPath').val();
  	 
 	var maxRecords = 10;
  	if ($("#maxRecords").length > 0)
  		maxRecords = $("#maxRecords").val();
  	 
  	 var URL = contextPath + "/crm/editLoyaltyCardDetails.do";
  	 $.ajax({
  		type : "GET",
  		url : URL,
  		data : {
  			loyaltyProgramNumber : loyaltyProgramNumber,
  			maxRecords : maxRecords
  		},
  		beforeSend: function(xhr){                     
 	   			$("#loading").css("display","block");
 	   			$("#mainDiv").addClass("disabled");
 	   		  },
  		success : function(result){
			activeMenu('Loyaltycards');

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
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 function editLoyaltyCardDetailsForPagination(loyaltyProgramNumber,index){
  	 var contextPath = $('#contextPath').val();
  	var maxRecords = 10;
  	if ($("#maxRecords").length > 0)
  		maxRecords = $("#maxRecords").val();
  	 
  	 var URL = contextPath + "/crm/editLoyaltyCardDetailsForPagination.do";
  	 $.ajax({
  		type : "GET",
  		url : URL,
  		data : {
  			loyaltyProgramNumber : loyaltyProgramNumber,
  			maxRecords : maxRecords,
  			index:index
  		},
  		beforeSend: function(xhr){                     
 	   			$("#loading").css("display","block");
 	   			$("#mainDiv").addClass("disabled");
 	   		  },
  		success : function(result){
			activeMenu('Loyaltycards');
  			$('#generatedCoupons').html(result);
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
 
 
 
 
 
 
 /*function generateConvertedpoints(){
	 debugger;
	 var contextPath = $('#contextPath').val();
	 var online = window.navigator.onLine;
	  	if(!online){
	  	alert("check your internet connection,please try agian after some time");
	  	return;
	  	}
	  	var maxRecords = 10;
	  	if ($("#maxRecords").length > 0)
	  		maxRecords = $("#maxRecords").val();
	  	
	  	var loyaltyPlanId=$("#loyaltyPlanId").val();
	  	var rewardConversionRatio=$("#rewardConversionRatio").val();
	  	
	  	
	  	var minClaimPointsGenerate = 	$("#minClaimPointsGenerate").val();
		if(minClaimPointsGenerate == "" || minClaimPointsGenerate == undefined || minClaimPointsGenerate == null ){
			minClaimPointsGenerate ="0";
			//$("#Error").html("Enter a Plan Name");
		}

	  
	  	var maxClaimPoints = 	$("#maxClaimPoints").val();
	  	if(maxClaimPoints == "" || maxClaimPoints == undefined || maxClaimPoints == null ){
	  		maxClaimPoints="0";
		}
	  	
	  	

	  	var basePointsGenerate = 	$("#basePointsGenerate").val();
	  	if(basePointsGenerate == "" || basePointsGenerate == undefined || basePointsGenerate == null ){
	  		basePointsGenerate="0";
		}

	  	var enroledate = 	$("#enroledate").val();
	  	if(enroledate == "" || enroledate == undefined || enroledate == null ){
	  		enroledate="";
		}

	  	
	  	 var URL = contextPath + "/crm/generateConvertedpoints.do";
	  	 $.ajax({
	  		type : "GET",
	  		url : URL,
	  		data : {
	  			minClaimPointsGenerate : minClaimPointsGenerate,
	  			enroledate : enroledate,
	  			basePointsGenerate:basePointsGenerate,
	  			maxClaimPoints:maxClaimPoints,
	  			maxRecords:maxRecords,
	  			loyaltyPlanId:loyaltyPlanId,
	  			rewardConversionRatio:rewardConversionRatio
	  		},
	  		beforeSend: function(xhr){                     
	 	   			$("#loading").css("display","block");
	 	   			$("#mainDiv").addClass("disabled");
	 	   		  },
	  		success : function(result){
				activeMenu('Loyaltycards');
	  			$('#right-side').html(result);
	  			$("#loading").css("display","none");
	  			$("#mainDiv").removeClass('disabled');
	  			$("#basePointsGenerate").val("");
	  			$("#enroledate").val("");
	  			$("#minClaimPointsGenerate").val("");
	  			$("#maxClaimPoints").val("");
	  		},
	  		error : function(){
	  			alert("Something went wrong");
	  			$("#loading").css("display","none");
					$("#mainDiv").removeClass('disabled');
	  		}
	  	 });
	  	
	  	
	  	
	 
 }*/
 

 
 function upgradeLoyaltyCards(){
	 debugger;
	 var contextPath = $('#contextPath').val();
	 var online = window.navigator.onLine;
	  	if(!online){
	  	alert("check your internet connection,please try agian after some time");
	  	return;
	  	}
	  	var maxRecords = 10;
	  	if ($("#maxRecords").length > 0)
	  		maxRecords = $("#maxRecords").val();
	  	
	  	var loyaltyPlanId=$("#loyaltyPlanId").val();
	  	var rewardConversionRatio=$("#rewardConversionRatio").val();
	  	
	  	
	  	var minClaimPointsUpgrade = 	$("#minClaimPointsUpgrade").val();
		if(minClaimPointsUpgrade == "" || minClaimPointsUpgrade == undefined || minClaimPointsUpgrade == null ){
			minClaimPointsUpgrade ="0";
		}

	  
	  	var maxClaimPointsUpgrade = 	$("#maxClaimPointsUpgrade").val();
	  	if(maxClaimPointsUpgrade == "" || maxClaimPointsUpgrade == undefined || maxClaimPointsUpgrade == null ){
	  		maxClaimPointsUpgrade="0";
		}

	  	var startdateUpgrade = 	$("#startdateUpgrade").val();
	  	if(startdateUpgrade == "" || startdateUpgrade == undefined || startdateUpgrade == null ){
	  		startdateUpgrade="";
		}

	  	var enddateUpgrade = 	$("#enddateUpgrade").val();
	  	if(enddateUpgrade == "" || enddateUpgrade == undefined || enddateUpgrade == null ){
	  		enddateUpgrade="";
		}
	  	var pricerangeUpgrade = 	$("#pricerangeUpgrade").val();
	  	if(pricerangeUpgrade == "" || pricerangeUpgrade == undefined || pricerangeUpgrade == null ){
	  		pricerangeUpgrade="";
		}
	  	
		var loyaltyCardTypeUpgrade = 	$("#loyaltyCardTypeUpgrade").val();
	  	if(loyaltyCardTypeUpgrade == "" || loyaltyCardTypeUpgrade == undefined || loyaltyCardTypeUpgrade == null ){
	  		pricerangeUpgrade= "0";
		}
	  	
	  	
	  	
	  	 var URL = contextPath + "/crm/upgradeLoyaltyCards.do";
	  	 $.ajax({
	  		type : "GET",
	  		url : URL,
	  		data : {
	  			minClaimPointsUpgrade : minClaimPointsUpgrade,
	  			maxClaimPointsUpgrade : maxClaimPointsUpgrade,
	  			startdateUpgrade:startdateUpgrade,
	  			enddateUpgrade:enddateUpgrade,
	  			maxRecords:maxRecords,
	  			pricerangeUpgrade:pricerangeUpgrade,
	  			loyaltyPlanId:loyaltyPlanId,
	  			rewardConversionRatio:rewardConversionRatio,
	  			loyaltyCardTypeUpgrade:loyaltyCardTypeUpgrade,
	  			
	  		},
	  		beforeSend: function(xhr){                     
	 	   			$("#loading").css("display","block");
	 	   			$("#mainDiv").addClass("disabled");
	 	   		  },
	  		success : function(result){
				activeMenu('Loyaltycards');
	  			$('#right-side').html(result);
	  			$("#loading").css("display","none");
	  			$("#mainDiv").removeClass('disabled');
	  			$("#minClaimPointsUpgrade").val("");
	  			$("#maxClaimPointsUpgrade").val("");
	  			$("#startdateUpgrade").val("");
	  			$("#enddateUpgrade").val("");
	  			$("#pricerangeUpgrade").val("");
	  			
	  		},
	  		error : function(){
	  			alert("Something went wrong");
	  			$("#loading").css("display","none");
					$("#mainDiv").removeClass('disabled');
	  		}
	  	 });
	  	
	  	
	  	
	 
 }
 
 
 
 
 /*function addNameToTextBox(id){
		debugger;
		loyaltycardsFiles = [];
		loyaltycardsFiles = event.target.files;
		addFileToArray(id);
		if($("#"+id+"Btn")[0].files[0] != undefined)
			$("#"+id+"File").val($("#"+id+"Btn")[0].files[0]['name']);
		else
			$("#"+id+"File").val("");
	}

	
	
	function importDataxls(){
		//;
		debugger;
		
		
		if(loyaltycardsFiles.length <= 0)
		{
		alert("Please Select Excel Sheet... ");
			return;
		}
		
		var oMyForm = new FormData();
		//var files = id+'Files';

			oMyForm.append("file", loyaltycardsFiles[0]);
//			var fileSize = couponsFiles[0].size;

		var contextPath = $("#contextPath").val();
		URL = contextPath + "/dataManagement/loaltyCardsData.do";
		$.ajax({
			dataType : 'json',
			url : URL,
			data :	oMyForm,
			type : "POST",
			enctype: 'multipart/form-data',
			processData: false, 
			contentType:false,
			success : function(result) {
				debugger;
				messageStatus= JSON.stringify(result);
				var parsed_json = JSON.parse(messageStatus);
				var error = parsed_json.err;
				alert(error);
				replaceWithNewFileType(id);
				$("#"+id+"File").val("");
				$("#"+id).prop('checked',false);
				enableFileBrowse('',id );
				if((error != undefined && error !="" ) || error == null){
					$("#"+id+"Img").attr("src",contextPath+"/images/error.jpg");
					$("#Error").html(error);
				}

				//errorUrl = parsed_json.errorUrl;
				if(errorUrl != undefined && errorUrl !="" && errorUrl != null && errorUrl != 'null')
				{
					//$("#errorUrl").attr("href", "http://"+errorUrl); 
					var pattern = /\\/;
					var err = errorUrl.split(pattern);
					errorUrl = err[0] + "//" + err[1];	
					$("#url").css("display","block");
				}

				var msg = parsed_json.msg;
				if(msg != undefined && msg !="")
					$("#"+id+"Img").attr("src",contextPath+"/images/tickMark.png");
				$("#"+id+"Img").closest('span').css("visibility","visible");
			},
			error : function(e){
				debugger;
//				messageStatus= JSON.stringify(e.responseText);
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
	  		
				
			}
		});
	}
 */
 
 
 
	
	
	
	
	
	
	
	
	
 
 /*function validateLoyaltyCards(operation){
		var re = /^[0-9/]+$/;
		if($("#loyaltyProgramName").val().trim() == ""){
			$("#errLoyaltyProgramName").html("Enter a Plan Name");
			return;
		}
		if($("#validFrom").val().trim() == ""){
			$("#validFromError").html("Enter a Date");
			return;
		}
		if(!re.test($("#validFrom").val())){
			$("#validFromError").html("Invalid Date");
			return;
		}
		if($("#validTo").val().trim() == ""){
			$("#validToError").html("Enter a Date");
			return;
		}
		if(!re.test($("#validTo").val())){
			$("#validToError").html("Invalid Date");
			return;
		}
		var daysToExpire = daydiff(new Date(), parseDate($('#validTo').val()));
		if(daysToExpire < 0){
			 $("#validToError").html("Valid To should be greater than today");
			 return;
		 }
		 var noOfDays = daydiff(parseDate($('#validFrom').val()), parseDate($('#validTo').val()));
		 if(noOfDays < 0){
			 $("#validToError").html("Valid To can't be less than Valid From");
			 return;
		 }
		var states = $("#states").val();
		if(states == "" || states == null){
			$("#errStates").html("Select state");
			return;
		}
		if($("#quantity").val().trim() == ""){
			$("#errQuantity").html("Enter No. of Cards");
			return;
		}
		if($("#validityPeriod").val().trim() == ""){
			$("#errValidityPeriod").html("Enter Validity Period");
			return;
		}
		if($("#rewardType").val() == "Points"){
			if($("#rewardConversionRatio").val().trim() == ""){
				$("#errRewardConversionRatio").html("Enter Rewards Conversion Ratio");
 			return;
			}
		}
		if($("#rewardConversionRatio").val().split('.').length - 1 > 1){
			$("#errRewardConversionRatio").html("Invalid Amount");
			return;
		}
		$("#selectedState").val(states.toString());
		 var formData  = JSON.stringify($('form').serializeObject());
		 var contextPath = $("#contextPath").val();
	   	   if(operation=="new"){
	    	 URL = contextPath + "/crm/createLoyaltyCards.do";
	   	   }
	   	   else if(operation=="edit"){
	   		 URL = contextPath + "/inventorymanager/updateProduct.do";
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
	}*/
	
	
	
	
	
	function generateConvertedpoints(){
		 debugger;
		 $("#Error").html("");
		 
		 
		 var contextPath = $('#contextPath').val();
		 var online = window.navigator.onLine;
		  	if(!online){
		  	alert("check your internet connection,please try agian after some time");
		  	return;
		  	}
		  	var maxRecords = 10;
		  	if ($("#maxRecords").length > 0)
		  		maxRecords = $("#maxRecords").val();
		  	
		  	var loyaltyPlanId=$("#loyaltyPlanId").val();
		  	var rewardConversionRatio=$("#rewardConversionRatio").val();
		  	
		  	
		  	var minClaimPointsGenerate = 	$("#minClaimPointsGenerate").val();
			if(minClaimPointsGenerate == "" || minClaimPointsGenerate == undefined || minClaimPointsGenerate == null ){
				minClaimPointsGenerate ="0";
				//$("#Error").html("Enter a Plan Name");
			}
			
			if($("#minClaimPointsGenerate").val().trim() == ""){
				$("#minClaimPointsGenerate").focus();
			$("#Error").html("Please select Minimum Points");
				return;
			}else
		  		$("#Error").html("");
			
			 
		  
		  	var maxClaimPoints = 	$("#maxClaimPoints").val();
		  	if(maxClaimPoints == "" || maxClaimPoints == undefined || maxClaimPoints == null ){
		  		maxClaimPoints="0";
			}
		  	
		  	if($("#maxClaimPoints").val().trim() == ""){
				$("#maxClaimPoints").focus();
			$("#Error").html("Please select Max Points");
				return;
			}else
		  		$("#Error").html("");
		  	
		  	debugger;
		  	if(parseFloat(maxClaimPoints) < parseFloat(minClaimPointsGenerate))
			{
	  		$("#maxClaimPoints").focus();
			$("#Error").html("Max Points Should be Greater than Min Points");
			return;
			}
	  	else
	  		$("#Error").html("");
		  	
		  	
		  	
		  	if($("#basePointsGenerate").val().trim() == ""){
				$("#basePointsGenerate").focus();
			$("#Error").html("Please select Base Points");
				return;
			}else
		  		$("#Error").html("");
		  	
		  	
		  	
		  	if($("#enroledate").val().trim() == ""){
				$("#enroledate").focus();
			$("#Error").html("Please select Enrole Date");
				return;
			}else
		  		$("#Error").html("");
		  	
		  	
		  	
		  	var basePointsGenerate = 	$("#basePointsGenerate").val();
		  	if(basePointsGenerate == "" || basePointsGenerate == undefined || basePointsGenerate == null ){
		  		basePointsGenerate="0";
			}

		  	var enroledate = 	$("#enroledate").val();
		  	if(enroledate == "" || enroledate == undefined || enroledate == null ){
		  		enroledate="";
			}
		 
		  	
		  	 var URL = contextPath + "/crm/generateConvertedpoints.do";
		  	 $.ajax({
		  		type : "GET",
		  		url : URL,
		  		data : {
		  			minClaimPointsGenerate : minClaimPointsGenerate,
		  			enroledate : enroledate,
		  			basePointsGenerate:basePointsGenerate,
		  			maxClaimPoints:maxClaimPoints,
		  			maxRecords:maxRecords,
		  			loyaltyPlanId:loyaltyPlanId,
		  			rewardConversionRatio:rewardConversionRatio
		  		},
		  		beforeSend: function(xhr){                     
		 	   			$("#loading").css("display","block");
		 	   			$("#mainDiv").addClass("disabled");
		 	   		  },
		  		success : function(result){
					activeMenu('Loyaltycards');
		  			$('#right-side').html(result);
		  			$("#loading").css("display","none");
		  			$("#mainDiv").removeClass('disabled');
		  			$("#basePointsGenerate").val("");
		  			$("#enroledate").val("");
		  			$("#minClaimPointsGenerate").val("");
		  			$("#maxClaimPoints").val("");
		  		},
		  		error : function(){
		  			alert("Something went wrong");
		  			$("#loading").css("display","none");
						$("#mainDiv").removeClass('disabled');
		  		}
		  	 });
		 
	 }
	
	var loyaltycardsFiles = [];
	 function addNameToTextBox(id){
			debugger;
			 
			     loyaltycardsFiles = event.target.files;
			/*addFileToArray(id);
			if($("#"+id+"Btn")[0].files[0] != undefined)
				$("#"+id+"File").val($("#"+id+"Btn")[0].files[0]['name']);
			else
				$("#"+id+"File").val("");*/
		}

		
		
		function importDataxls(){
			debugger;
			if( loyaltycardsFiles.length <= 0)
			{
				$("#Error").html("Please Select Excel Sheet... ");
				return;
			}
			else{	
				$("#Error").html("");
			}
			
			var oMyForm = new FormData();
				oMyForm.append("file", loyaltycardsFiles[0]);
//				var fileSize = couponsFiles[0].size;

			var contextPath = $("#contextPath").val();
			URL = contextPath + "/dataManagement/loaltyCardsData.do";
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
					messageStatus= JSON.stringify(result);
					var parsed_json = JSON.parse(messageStatus);
					var err = parsed_json.err;
					var msg = parsed_json.msg;
				
					if(msg != null && msg != "") {
						$("#success").html("Successfully Uploded");
						} else 
					if(err != null && err != ""){
						$("#Error").html(err);
					}
					
					
					$("#loading").css("display","none");
					$("#mainDiv").removeClass('disabled');
				},
				error : function(e){
					debugger;
//					messageStatus= JSON.stringify(e.responseText);
		  			var parsed_json = JSON.parse(e.responseText);
		  			var error = parsed_json.errorUrl;
		  			$("#Error").html(error);
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
		  			$("#loading").css("display","none");
					$("#mainDiv").removeClass('disabled');
				}
			});
		}
	 
	
	
	
	