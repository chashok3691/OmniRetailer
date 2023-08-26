/**
 * 
 */

	/*function validateHSNmaster(id,operation){
   		try{
   			
   			var online = window.navigator.onLine;
   		  	if(!online){
   		  	alert("Check your internet connection,Please try agian after some time.");
   		  	return;
   		  	}
   		
   	
   		debugger;
          $("#hsncodeError").html("");
   		 $("#chapterError").html("");
   		 $("#headingError").html("");
   		 $("#taxrateError").html("");
   		 $("#DescriptionError").html("");
   		 $("#sectionError").html("");
   		 $("#taxcodeError").html("");
   		 $("#subheadingError").html("");
   		var formData={};
   		
   		

   		
   		 var hsncode = $("#hsncode").val();
 	    	 if(hsncode == ""){
 	    		 $("#hsncodeError").html("Please Enter HSN Code");
 	    		 return;
 	    	 }
 	    	 var chapter = $("#chapter").val();
  	    	 if(chapter == ""){
  	    		 $("#chapterError").html("Please Enter Chapter Name");
  	    		 return;
  	    	 }
  	    	 var heading = $("#heading").val();
  	    	 if(heading == ""){
  	    		 $("#headingError").html("Please Enter Heading");
  	    		 return;
  	    	 }
  	    	 
  	    	 var taxrate = $("#taxrate").val();
  	    	 if(taxrate == ""){
  	    		 $("#taxrateError").html("Please Enter Tax Rate");
  	    		 return;
  	    	 }
  	    	
  	    	 
  	    	 var Description = $("#Description").val();
 	    	 if(Description == ""){
 	    		 $("#DescriptionError").html("Please Enter Description");
 	    		 return;
 	    	 }
 	    	 var section = $("#section").val();
  	    	 if(section == ""){
  	    		 $("#sectionError").html("Please Enter Section");
  	    		 return;
  	    	 }
  	    	 var taxcode = $("#taxcode").val();
  	    	 if(taxcode == ""){
  	    		 $("#taxcodeError").html("Please Enter Tax Code");
  	    		 return;
  	    	 }
  	    	 
  	    	 var subheading = $("#subheading").val();
  	    	 if(subheading == ""){
  	    		 $("#subheadingError").html("Please Enter Sub Heading");
  	    		 return;
  	    	 }

   		formData.subHeadingsName = subheading;
  		formData.taxCode = taxcode;
  		formData.sectionName = section;
  		formData.comments = Description;
  		formData.taxRate = taxrate;
  		
  		formData.hsnCode = hsncode;
  		formData.chapterName= chapter;
  		formData.headingsName= heading;
  		formData.operation = operation;
  		
  		   formData = JSON.stringify(formData);

   	 		 var contextPath = $("#contextPath").val();
   	 		 
   	 		 URL = contextPath + "/genericMaster/createHsnMaster.do";
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

   	 	}*/


function validateHSNmaster(id,operation){
   		try{
   			
   			var online = window.navigator.onLine;
   		  	if(!online){
   		  	alert("Check your internet connection,Please try agian after some time.");
   		  	return;
   		  	}
   		
   	
   		debugger;
         $("#hsncodeError").html("");
   		 $("#chapterError").html("");
   		 $("#headingError").html("");
   		 $("#taxrateError").html("");
   		 $("#DescriptionError").html("");
   		 $("#sectionError").html("");
   		 $("#taxcodeError").html("");
   		 $("#subheadingError").html("");
   		 $("#Error").html("");
   		 $("#Success").html("");
   		var formData={};
   		
   		

   		
   		 var hsncode = $("#hsncode").val();
 	    	 if(hsncode == ""){
 	    		$("#hsncode").focus();
 	    		 $("#hsncodeError").html("Please Enter HSN Code");
 	    		 return;
 	    	 }else if(parseInt($("#hsncode").val().length)>=20){
 				 $("#hsncode").focus();
 				$("#hsncodeError").html("HSN Code can't exceeds 20 characters");
 				return;
 			}
 	    	 var chapter = $("#chapter").val();
  	    	 if(chapter == ""){
  	    		$("#chapter").focus();
  	    		 $("#chapterError").html("Please Enter Chapter Name");
  	    		 return;
  	    	 }else if(parseInt($("#chapter").val().length)>=20){
 				 $("#chapter").focus();
  				$("#chapterError").html("Chapter can't exceeds 20 characters");
  				return;
  			}
  	    	 var heading = $("#heading").val();
  	    	 if(heading == ""){
  	    		 $("#heading").focus();
  	    		 $("#headingError").html("Please Enter Heading");
  	    		 return;
  	    	 }else if(parseInt($("#heading").val().length)>=20){
 				 $("#heading").focus();
   				$("#headingError").html("Heading can't exceeds 20 characters");
   				return;
   			}
  	    	 
  	    	 var taxrate = $("#taxrate").val();
  	    	 if(taxrate == ""){
  	    		 $("#taxrate").focus();
  	    		 $("#taxrateError").html("Please Enter Tax Rate");
  	    		 return;
  	    	 }else if(parseInt($("#taxrate").val().length)>=20){
  	    		 	$("#taxrate").focus();
    				$("#taxrateError").html("Tax rate can't exceeds 20 characters");
    				return;
    			}
  	    	
  	    	 
  	    	 var Description = $("#Description").val();
 	    	 if(Description == ""){
 	    		 $("#Description").focus();
 	    		 $("#DescriptionError").html("Please Enter Description");
 	    		 return;
 	    	 }else if(parseInt($("#Description").val().length)>=250){
  	    		 	$("#Description").focus();
    				$("#DescriptionError").html("Description can't exceeds 250 characters");
    				return;
    			}
 	    	 var section = $("#section").val();
  	    	 if(section == ""){
  	    		 $("#section").focus();
  	    		 $("#sectionError").html("Please Enter Section");
  	    		 return;
  	    	 }else if(parseInt($("#section").val().length)>=20){
  	    		 	$("#section").focus();
    				$("#sectionError").html("Section can't exceeds 20 characters");
    				return;
    			}
  	    	 /*var taxcode = $("#taxcode").val();
  	    	 if(taxcode == ""){
  	    		 $("#taxcodeError").html("Please Enter Tax Code");
  	    		 return;
  	    	 }
  	    	 */
  	    	 var subheading = $("#subheading").val();
  	    	 if(subheading == ""){
  	    		 $("#subheading").focus();
  	    		 $("#subheadingError").html("Please Enter Sub Heading");
  	    		 return;
  	    	 }else if(parseInt($("#subheading").val().length)>=20){
  	    		 	$("#subheading").focus();
    				$("#subheadingError").html("Sub Heading can't exceeds 20 characters");
    				return;
    			}
  	    	 
  	    	 var taxcode = $("#taxcode").val();
  	    	 if(taxcode == "" || taxcode == null || taxcode == undefined){
  	    		 $("#taxcode").focus();
  	    		 $("#taxcodeError").html("Please Enter Tax Code");
  	    		 return;
  	    	 }else if(parseInt($("#taxcode").val().length)>=20){
  	    		 	$("#taxcode").focus();
    				$("#taxcodeError").html("Tax Code can't exceeds 20 characters");
    				return;
    			}

   		formData.subHeadingsName = subheading;
  		formData.taxCode = taxcode;
  		formData.sectionName = section;
  		formData.comments = Description;
  		formData.taxRate = taxrate;
  		
  		formData.hsnCode = hsncode;
  		formData.chapterName= chapter;
  		formData.headingsName= heading;
  		formData.operation = operation;
  		
  		   formData = JSON.stringify(formData);

   	 		 var contextPath = $("#contextPath").val();
   	 		 
   	 		 URL = contextPath + "/genericMaster/createHsnMaster.do";
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



	function EditHsnDetails(hsncode,sectionname,chaptername,headingname,subheading,taxcode,taxrate,comments){
		debugger;
	
		$("#Error").html("");
   		$("#Success").html("");
  		$("#subheading").val(subheading);
  		$("#taxcode").val(taxcode);
  		$("#section").val(sectionname);
  		$("#Description").val(comments);
  		$("#taxrate").val(taxrate);
  		$("#hsncode").val(hsncode);
  		$("#chapter").val(chaptername);
  		$("#heading").val(headingname);
  		$("#createHSN").css("display","none");
  		 $("#updateHSN").css("display","block");
  		$("#updatebtn").val("update");
  		
		}
	
	function clearAll(){
		$("#subheading").val("");
  		$("#taxcode").val("");
  		$("#section").val("");
  		$("#Description").val("");
  		$("#taxrate").val("");
  		$("#hsncode").val("");
  		$("#chapter").val("");
  		$("#heading").val("");
		
	}
	
	 function validateHSN(master) {
     	  
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
    			
    				
       		 URL = contextPath + "/genericMaster/deleteHSN.do";
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
       
       
	