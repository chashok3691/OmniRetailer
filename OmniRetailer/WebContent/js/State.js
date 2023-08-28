function validateStateMaster(id,operation){
	try{
   			
   			var online = window.navigator.onLine;
   		  	if(!online){
   		  	alert("Check your internet connection,Please try agian after some time.");
   		  	return;
   		  	}
   		debugger;
         $("#statecodeError").html("");
   		 $("#countrycodeError").html("");
   		 $("#stateNameError").html("");
   		 $("#GSTCodeError").html("");
   		 
   		var formData={};
   		
   		 var stateCode = $("#statecode").val();
 	    	 if(stateCode == ""){
 	    		$("#statecode").focus();
 	    		 $("#statecodeError").html("Please Enter State Code");
 	    		 return;
 	    	 }else if(parseInt($("#statecode").val().length)>20){
 				 $("#statecode").focus();
 				$("#statecodeError").html("State Code can't exceeds 20 characters");
 				return;
 			}
 	    	 var countryCode = $("#countryCode").val();
  	    	 if(countryCode == ""){
  	    		$("#countryCode").focus();
  	    		 $("#countrycodeError").html("Please Enter Country Code");
  	    		 return;
  	    	 }else if(parseInt($("#countryCode").val().length)>20){
 				 $("#countryCode").focus();
  				$("#countrycodeError").html("Country Code can't exceeds 20 characters");
  				return;
  			}
  	    	 var stateName = $("#stateName").val();
  	    	 if(stateName == ""){
  	    		 $("#stateName").focus();
  	    		 $("#stateNameError").html("Please Enter stateName");
  	    		 return;
  	    	 }
  	    	 
  	    	 var GSTCode = $("#GSTCode").val();
  	    	 if(GSTCode == ""){
  	    		 $("#GSTCode").focus();
  	    		 $("#GSTCodeError").html("Please Enter GST State Code");
  	    		 return;
  	    	 }else if(parseInt($("#GSTCode").val().length)>20){
  	    		 	$("#GSTCode").focus();
    				$("#GSTCodeError").html("GST State Code can't exceeds 20 characters");
    				return;
    			}
  	    	
  		formData.stateCode = stateCode;
  		formData.countryCode= countryCode;
  		formData.stateName= stateName;
  		formData.operation = operation;
  		formData.gststatecode = GSTCode;
  		
  		formData = JSON.stringify(formData);

   	 		 var contextPath = $("#contextPath").val();
   	 		 
   	 		 URL = contextPath + "/genericMaster/createStateMaster.do";
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
   	 					if(id != undefined)
   	 						activeMenu(id);
   	 					$("#loading").css("display","none");
   	 					$("#mainDiv").removeClass('disabled');
   	 				},
   	 				error : function(jqxhr) {
   	 					if(jqxhr.status == 0)
   	 						{
   	 						alert("server has stoped")
   	 						}
   	 					else if(jqxhr.status == 401)
   	 							{
   	 						alert("bad request")
   	 							}
   	 					else
   	 						{
   	 						alert("bad request")
   	 						}
   	 					 // errorCode(jqXHR.status);
   	 					// $("#mainDiv").removeClass('loading');
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



	function EditStateDetails(stateCode,countryCode,stateName,gststatecode){
		debugger;
	
  		$("#statecode").val(stateCode);
  		$("#countryCode").val(countryCode);
  		$("#stateName").val(stateName);
  		$("#GSTCode").val(gststatecode);
  		$("#createState").css("display","none");
  		 $("#updateState").css("display","block");
  		//$("#updatebtn").val("update");
  		}
	
	/*function clearAll(){
		$("#subheading").val("");
  		$("#taxcode").val("");
  		$("#section").val("");
  		$("#Description").val("");
  		$("#taxrate").val("");
  		$("#hsncode").val("");
  		$("#countryCode").val("");
  		$("#heading").val("");
		
	}*/
	
	
	 function deleteStateMaster(stateMaster) {
     	  
     	  //purpose:for checking internet conection
   		var online = window.navigator.onLine;
   	  	if(!online)
   	  	{
   	  	alert("check your internet connection,please try agian after some time");
   	  	return;
   	  	}
   	    var selected = "";
   	    var selected = "";
      		var selectedLabel = $('#selectlabel').val();
      		var name=$('#deleteActionLabel').val();
      		var atLeastOneIsChecked = $('input[name="selectall"]:checked').length > 0;
      		var selectedLength = $('input[name="selectall"]:checked').length;
      		var selectedID = $("#selectall").length;
      		debugger
      	 var maxRecords = 10;
   	  	if($("#maxRecords").length>0)
   	  	maxRecords = $("#maxRecords").val();
   	  	  var searchName ="";
   		  searchName = $("#searchName").val();
   		if(searchName==null || searchName== undefined )
   			{
   			searchName ="";
   			}
      		if(selectedLength == 1 && selectedID == 0)
      			atLeastOneIsChecked = false;
      		var yes = false;
      		if(!atLeastOneIsChecked){
      			alert(selectedLabel+" "+name);
      			return false;
      		}
      		else{
      			var selectedLength = $('input[name="selectall"]:checked');
      		    $(selectedLength).each(function(){
      		    	if($(this).attr("onClick") != "selectAll(this)")
      		    		selected += $(this).val()+",";
      		    	//selected += $(this).val().replace(/\//g, '')+",";
      			});
      			selected = selected.slice(0,-1);// Remove last comma
      			yes = confirm("Are you sure, you want to delete "+selected);
    		}
    		if(yes){
    			var contextPath = $("#contextPath").val();
       		 URL = contextPath + "/genericMaster/deleteStateMaster.do";
              $.ajax({
  				type: "POST",
  				url : URL,
  				data : {
  					ids:selected,
  					maxRecords : maxRecords,
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
              return;
       		}
       }
       
      
	