/*
 * Project Name 	        : OmniRetailerCustomer
 * Written By		        : Mythri
 * file name		        : validation.js
 * file type		        : Javascript
 * description				: All validations to different fields of this project are done here
 * */ 



/*function DisableBackButton() {
	window.history.forward();
}
DisableBackButton();
window.onload = DisableBackButton;
window.onpageshow = function(evt) {
	if (evt.persisted)
		DisableBackButton();
};
window.onunload = function() {
	void (0);
};
window.onload = DisableBackButton;
window.onpageshow = function(evt) {
	if (evt.persisted)
		DisableBackButton();
};
window.onunload = function() {
	void (0);
};*/


/*var limit = 10;
$('td[contenteditable]').keypress(function() {
  return this.innerHTML.length < limit;
}).on({
  'paste': function(e) {
    var len = this.innerHTML.length,
      cp = e.originalEvent.clipboardData.getData('text');
    if (len < limit)
      this.innerHTML += cp.substring(0, limit - len);
    return false;
  },
  'drop': function(e) {
    e.preventDefault();
    e.stopPropagation();
  }
});*/

 		function isAlphabet(element){
        	var $th = $(element);
       	 $th.val( $th.val().replace(/[^a-zA-Z]+( [A-Z]+)*$/g, function(str) 
       	 {  
       		return '';
       	 } 
       	 ));
        }
 		
        
        function getCurrentDate(){
        	var date = new Date();
        	var dd = date.getDate();
    		var mm = date.getMonth()+1; //January is 0!
    		var yyyy = date.getFullYear();
    		var hrs = date.getHours();
    		var mints = date.getMinutes();
    		var sec = date.getSeconds();
    		 if(dd<10) {
    		     dd='0'+dd;
    		 } 
    		 if(mm<10) {
    		     mm='0'+mm;
    		 } 
    		 today = mm+'/'+dd+'/'+yyyy+' '+hrs+':'+mints+':'+sec;
    		 return today;
        }

        
        
       

        var specialKeys = new Array();
        specialKeys.push(8); //Backspace
        function isNumeric(e) {
        //	alert("hi");
            var keyCode = e.which ? e.which : e.keyCode;
            var ret = ((keyCode >= 48 && keyCode <= 57) || specialKeys.indexOf(keyCode) != -1);
            document.getElementById("error").style.display = ret ? "none" : "inline";
            return ret;
        }
        
        function isNumber(evt) {
            evt = (evt) ? evt : window.event;
            var charCode = (evt.which) ? evt.which : evt.keyCode;
            if (charCode > 31 && (charCode < 48 || charCode > 57)) {
                return false;
            }
            return true;
        }
                
        function isNumeric(element){
        	 var $th = $(element);
        	 $th.val( $th.val().replace(/[^0-9]+( [0-9]+)*$/g, function(str) 
        	 {  
        		return '';
        	 } 
        	 ));
        	
        }
        
          
        function getCurrentDate(){
        	var date = new Date();
        	var dd = date.getDate();
    		var mm = date.getMonth()+1; //January is 0!
    		var yyyy = date.getFullYear();
    		var hrs = date.getHours();
    		var mints = date.getMinutes();
    		var sec = date.getSeconds();

    		 if(dd<10) {
    		     dd='0'+dd;
    		 } 

    		 if(mm<10) {
    		     mm='0'+mm;
    		 } 

    		 today = mm+'/'+dd+'/'+yyyy+' '+hrs+':'+mints+':'+sec;
    		 return today;
        }
        
        
     function validateLoginForm() {  
	debugger;
	
    	 var emailId = $("#emailId").val();
    	 var password = $("#password").val();
    	// var captchaPassword = $("#captchaPassword").val();
    	 $("#captchaErr").html("");
    	 emailId = emailId.trim();
    	 password = password.trim();
    	 //captchaPassword=captchaPassword.trim();
    	 
    	 /*if(captchaPassword.trim() == "")
    		 {
    		 $("#captchaPassword").focus();
   			 $("#captchaClientError").html("Enter Captcha");
   			 $("#loginError").html("");
   		     $("#captchaError").html("");
   			return false;
    		 }*/
    	 if (emailId.trim() == "") {
    		$("#emailId").focus();
  			$("#emailError").html("Email Id is Required");
  			$("#passError").html("");
  			
  			return false;
     	 }
    	 if(!emailValidation(emailId)){
     		$("#emailError").html("Invalid EmailId (Ex:abc@gmail.com)");
     		$("#emailId").focus();
     		$("#passError").html("");
     		return false;
     	 }
    	 if (password.trim() == "") {
    		 $("#password").focus();
    		$("#emailError").html("");
    		$("#passError").html("Password is Required");
    		return false;
    	 }
    	
    	 if(!passwordValidation(password)){
    		 $("#password").focus();
    		 $("#emailError").html("");
    		 $("#passError").html("Invalid Password (Ex:Tech123@)");
    		return false;
    	 }

    	 var captchaPassword = $("#cpatchaTextBox").val();
    	 var checkcaptcha = $("#captchaStr").val();
         


         if(captchaPassword.trim() == "")
		 {
		 $("#cpatchaTextBox").focus();
			 $("#captchaErr").html("Enter Captcha");
			return false;
		 }else{
			 if(captchaPassword!=checkcaptcha){
				 $("#cpatchaTextBox").focus();
	   			 $("#captchaErr").html("Invalid Captcha");
	   			/*createCaptcha()*/
	   			return false;
			 }
		 }
   
    	
    	 	/*var contextPath = $("#contextPath").val();
    		URL = contextPath + "/login/authenticateUser.do";
    		//alert(URL);
    		$.ajax({
    			type: "POST",
    			url : URL,
    			data : {
    				emailId : emailId,
    				password : password
    			},
    			success : function(result) {
    				//alert("success");
    			},
    			error : function() {
    				 alert("something went wrong");
    			}
    		});*/
    	 return true;
     } 
     
     
     function emailValidation(email) {
    	 email = email.trim();
    	var mailformat = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
    	if(!mailformat.test(email)){
    		return false;
    	} else
    		return true;
    }
    
     
     function passwordValidation(password){
    	 var passwordFormat = /^((?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[@#$%]).{6,20})$/;
	     if(!passwordFormat.test(password))
	        return false;
	     else
	    	 return true;
     }
     
     function validateEmail(){
    	 var emailId = $("#emailId").val();
    	 emailId = emailId.trim();
    	 if (emailId == "") {
     		$("#emailId").focus();
   			$("#emailError").html("Email Id is Required");
   			return false;
     	 }
    	 if(!emailValidation(emailId)){
     		$("#emailError").html("Invalid Email Id");
     		$("#emailId").focus();
     		return false;
     	 }
    	 return true;
     }
     
     function getParamValue(name){
         var results = new RegExp('[\?&]' + name + '=([^&#]*)').exec(window.location.href);
         if (results==null){
            return null;
         }
         else{
            return results[1] || 0;
         }
     }
      function setValues(){
     	var u = getParamValue('u');
     	var e = getParamValue('e');
     //	alert(u+"****"+e);
     	if(u==null||e==null)
     		return true;
     	$("#uid").val(u);
     	$("#eid").val(e);
     	
     } 
      
      
      
      function validateOffers(master) {
       	debugger;
     	    var selected = "";
     	    var selectedStr="";
     	    var statusStr="";
     	    var selectedArr=new Array();
     	    var statusArr=new Array();
     	 var checkArr=new Array();
      		var selectedLabel = $('#selectlabel').val();
      		var name=$('#deleteActionLabel').val();
      		var atLeastOneIsChecked = $('input[name="selectall"]:checked').length > 0;
      		var selectedLength = $('input[name="selectall"]:checked').length;
      		var selectedID = $("#selectall").length;
      		if(selectedLength == 1 && selectedID == 0)
      			atLeastOneIsChecked = false;
      		var yes = false;
      		if(!atLeastOneIsChecked){
      			alert(selectedLabel+" "+name);
      			return false;
      		  }
      		else{
      			var length = $('input[name="selectall"]:checked');
      		    $(length).each(function(){
      		    	if($(this).attr("onClick") != "selectAll(this)"){
      		    		selectedStr=$(this).val();
      		    	    selectedArr=(selectedStr.split("$"));	
      		    	    statusStr += selectedArr[0]+",";
      		    		selected += selectedArr[1]+",";
      		          }
      			});
      			selected = selected.slice(0,-1);// Remove last comma
      			yes = confirm("Are you sure, you want to delete "+selected);
      		}
      		if(yes){
      			var contextPath = $("#contextPath").val();
      			if(master == "offers"){
      				statusArr=(statusStr.split(","));
      				for(i=0;i<selectedLength;i++){
         				if(statusArr[i] == "ACTIVE"){
         					alert("Active Offers Cannot Be Deleted");
         					
         					$('input:checkbox[name=selectall]').attr('checked',false);
         		   			return false;
         				}
         				}
         				URL = contextPath + "/inventorymanager/deleteoffers.do";	
                      $.ajax({
          				type: "POST",
          				url : URL,
          				data : {
          					ids:selected,
          					location : $("#outletLocation").val(),
          					type : master,
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
       }
      
      
      
      function AssigendOrdersToLocation(master) {
         	debugger;
       	    var selected = "";
       	    var selectedStr="";
       	    var statusStr="";
       	    var selectedArr=new Array();
       	    var statusArr=new Array();
       	 var checkArr=new Array();
        		var selectedLabel = $('#selectlabel').val();
        		var name=$('#deleteActionLabel').val();
        		var atLeastOneIsChecked = $('input[name="selectall"]:checked').length > 0;
        		var selectedLength = $('input[name="selectall"]:checked').length;
        		var selectedID = $("#selectall").length;
        		if(selectedLength == 1 && selectedID == 0)
        			atLeastOneIsChecked = false;
        		var yes = false;
        		if(!atLeastOneIsChecked){
        			alert(selectedLabel+" "+name);
        			return false;
        		  }
        		else{
        			var length = $('input[name="selectall"]:checked');
        		    $(length).each(function(){
        		    	if($(this).attr("onClick") != "selectAll(this)"){
        		    		selected += $(this).val()+",";
        		          }
        			});
        			selected = selected.slice(0,-1);// Remove last comma
        			yes = confirm("Are you sure, you want to Assign a  Selected Location To  "+selected);
        		}
        		if(yes){
        			var contextPath = $("#contextPath").val();
        			if(master == "order"){
        				statusArr=(statusStr.split(","));
        				URL = contextPath + "/orderManagement/AssigendOrdersToLocation.do";		
                        $.ajax({
            				type: "POST",
            				url : URL,
            				data : {
            					ids:selected,
            					location : $("#modaloutletlocation").val(),
            					type : master,
            					status:$("#orderworkflow").val(),
            					flowUnder :"management"
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
         }
        
      
      
      
      //written by : manasa
      //purpose:to delete deals
      //created date : 19/02/2012
      function validateDeals(master) {
         	debugger;
       	    var selected = "";
       	    var selectedStr="";
       	    var statusStr="";
       	    var selectedArr=new Array();
       	    var statusArr=new Array();
       	 var checkArr=new Array();
        		var selectedLabel = $('#selectlabel').val();
        		var name=$('#deleteActionLabel').val();
        		var atLeastOneIsChecked = $('input[name="selectall"]:checked').length > 0;
        		var selectedLength = $('input[name="selectall"]:checked').length;
        		var selectedID = $("#selectall").length;
        		if(selectedLength == 1 && selectedID == 0)
        			atLeastOneIsChecked = false;
        		var yes = false;
        		if(!atLeastOneIsChecked){
        			alert(selectedLabel+" "+name);
        			return false;
        		  }
        		else{
        			var length = $('input[name="selectall"]:checked');
        		    $(length).each(function(){
        		    	if($(this).attr("onClick") != "selectAll(this)"){
        		    		selectedStr=$(this).val();
        		    	    selectedArr=(selectedStr.split("$"));	
        		    	    statusStr += selectedArr[0]+",";
        		    		selected += selectedArr[1]+",";
        		          }
        			});
        			selected = selected.slice(0,-1);// Remove last comma
        			yes = confirm("Are you sure, you want to delete "+selected);
        		}
        		if(yes){
        			var contextPath = $("#contextPath").val();
        			
        				statusArr=(statusStr.split(","));
        				
           				for(i=0;i<selectedLength;i++){
           				if(statusArr[i] == "ACTIVE"){
           					alert("Active Deals Cannot Be Deleted");
           					
           					$('input:checkbox[name=selectall]').attr('checked',false);
           		   			return false;
           				}
           				}
           			 var maxRecords = 10;
           		  	if($("#maxRecords").length>0)
           		  	maxRecords = $("#maxRecords").val();
           				
           				URL = contextPath + "/dealsAndOffers/deleteDeals.do";	
                        $.ajax({
            				type: "POST",
            				url : URL,
            				data : {
            					ids:selected,
            					location : $("#outletLocation").val(),
            					type : master,
            					maxRecords : maxRecords
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
       
      
      function validate(master) {
    	  debugger;
    	  //purpose:for checking internet conection
  		var online = window.navigator.onLine;
  	  	if(!online)
  	  	{
  	  	alert("check your internet connection,please try agian after some time");
  	  	return;
  	  	}
    	  
    	 
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
	  	  
	  	
	  	
		  var	searchName = $("#searchName").val();
		  
		  
		  	if(searchName == undefined || searchName == "" || searchName == null){
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
   			if(master == "supplier"){
   			 URL = contextPath + "/outletMaster/deleteSupplier.do";
   			}
   			else if(master == "employee"){
   				
      		 URL = contextPath + "/genericMaster/deleteEmployee.do";
           	 var location = $("#employeelocation").val();
             $.ajax({
 				type: "POST",
 				url : URL,
 				data : {
 					ids:selected,
 					location : location,
 					maxRecords : maxRecords,
 					searchName : searchName
 				},
 				beforeSend: function(xhr){                    
  	   	   			$("#loading").css("display","block");
  	   	   			$("#mainDiv").addClass("disabled");
  	   	   		  },
 				success : function(result) {
 					$("#right-side").html(result);
 					$("#type").val(type);
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
   			else if(master == "product"){
         	 URL = contextPath + "/outletMaster/deleteProduct.do";
         	}
   			else if(master == "currency"){
        	 URL = contextPath + "/genericMaster/deleteCurrency.do";
        	}
   			else if(master == "menu"){
   				debugger
   				var outletLocation = ""
   				if($("#outletname").length>0)
   					outletLocation=	$("#outletname").val();
   				
   				
   				var selectedLocationsList = [];
   				if($("#outlet_name").val() == "all" || $("#outletname").val() == "")
   					{
   					$("#outlet_name option").each(function(){
   						selectedLocationsList.push($(this).val());
   					});
   				selectedLocationsList.shift();
   			
   				var  locationList="";
   			   	for(i=1;i<selectedLocationsList.length;i++)
   			   		{
   			   		locationList =locationList+ selectedLocationsList[i]+',';
   			   		}
   					}
   				else
   				locationsList = outletLocation;
   			/*else if(master == "menu"){
   				debugger
   				var outletLocation = ""
   				if($("#outletname").length>0)
   					outletLocation=	$("#outletname").val();*/
           	 URL = contextPath + "/inventorymanager/deleteMenu.do";
           	$.ajax({
				type: "POST",
				url : URL,
				data : {
					ids:selected,
					outlet_name : outletLocation
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
   			else if(master == "brand"){
         	 URL = contextPath + "/genericMaster/deleteBrand.do";
         	}
   			
   			else if(master == "loyaltyCard"){
   	   			debugger;
   	   				if(searchName == undefined || searchName == null){
   	   					searchName ="";
   	   				}
   	   				
   	            	 URL = contextPath + "/crm/deleteLoyaltyCards.do";
   	            	}
   			
   			else if(master == "b2bPartners"){
   	   			debugger;
   	   				if(searchName == undefined || searchName == null){
   	   					searchName ="";
   	   				}
   	            	 URL = contextPath + "/genericMaster/deleteB2BPartners.do";
   	          		}
   	   		
   			else if(master == "offer"){
   	   			debugger;
   	   				if(searchName == undefined || searchName == null){
   	   					searchName ="";
   	   				}
   	            	 URL = contextPath + "/dealsAndOffers/deleteOfferProduct.do";
   	            	}
   			
   			
   			else if(master == "tax"){
           	 URL = contextPath + "/genericMaster/deleteTax.do";
           	}
   			else if(master == "warehouseSkumaster")
				{
			 URL = contextPath + "/warehouseMaster/deleteSku.do";
				}
   			else if(master == "category"){
             URL = contextPath + "/outletMaster/deleteCategory.do";
            }
   			else if(master == "subcategory"){
             URL = contextPath + "/outletMaster/deleteSubCategory.do";
            }
   			else if(master == "role"){
                URL = contextPath + "/userAccessControl/deleteRole.do";
            }
   			else if (master=="priceRange") {
   				URL = contextPath + "/outletMaster/deletePriceRange.do";
			}

   			else if(master == "sku"){
                URL = contextPath + "/outletMaster/deleteSku.do";
            }
   			else if(master == "counter"){
                URL = contextPath + "/admin/deleteCounter.do";
            }
   			else if(master == "BomMaster"){
   				
   				var flowUnder =  $("#flowUnder").val();	
   				if(flowUnder == undefined || flowUnder == null){
   					flowUnder ="";
   				}
   				
   				if(flowUnder == "")
                URL = contextPath + "/outletMaster/deleteBom.do";
   				else
   			    URL = contextPath + "/warehouseMaster/deleteBom.do";
            }
   			else if(master == "Whcounter"){
                URL = contextPath + "/admin/deleteWhCounter.do";
            }
   			
   			else if(master == "featuredRetailer"){
                debugger;
                URL = contextPath + "/b2c/deleteFeaturedRetailer.do";
                $.ajax({
                	
    				type: "POST",
    				url : URL,
    				data : {
    					
    					ids:selected
    					
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
   			
   			else if(master == "shiftAllocation"){
                URL = contextPath + "/admin/deleteShiftAllocation.do";
                $.ajax({
    				type: "POST",
    				url : URL,
    				data : {
    					ids:selected,
    					flowUnder : $("#flowUnder").val()
    					
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
   			else if(master == "zone"){
                URL = contextPath + "/genericMaster/deleteZone.do";
            }
   			else if(master == "routeMaster"){
                URL = contextPath + "/genericMaster/deleteRouteMaster.do";
            }
   			else if(master == "serviceAreaMaster"){
              	 URL = contextPath + "/genericMaster/deleteserviceAreaMaster.do";
              	}
   			else if(master == "tenderMaster"){
            	 URL = contextPath + "/genericMaster/deleteTenderMaster.do";
            	}
   			else if(master == "productGroup"){
              	 URL = contextPath + "/outletMaster/deleteProductGroup.do";
              	}
   			else if(master == "denomination"){
           	 URL = contextPath + "/genericMaster/deleteDenomination.do";
           	}
   			else if(master == "asset"){
            	 URL = contextPath + "/genericMaster/deleteAsset.do";
            	}
   			else if(master == "events"){
           	 URL = contextPath + "/b2c/deleteEvents.do";
           	}
   			else if(master == "banner"){
           	 URL = contextPath + "/b2c/deleteBanner.do";
           	 var type = $("#type").val();
             $.ajax({
 				type: "POST",
 				url : URL,
 				data : {
 					ids:selected,
 					type : type
 				},
 				beforeSend: function(xhr){                    
  	   	   			$("#loading").css("display","block");
  	   	   			$("#mainDiv").addClass("disabled");
  	   	   		  },
 				success : function(result) {
 					$("#right-side").html(result);
 					$("#type").val(type);
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
   			else if(master == "FeaturedproductGroup"){
            	 URL = contextPath + "/b2c/deleteFeaturedproductGroup.do";
         	}
   			else if(master == "ShoppingLists"){
           	 URL = contextPath + "/b2c/deleteShoppingList.do";
        	}
   			else if(master == "location"){
              	 URL = contextPath + "/genericMaster/deleteLocation.do";
              	}
			else if(master == "BatchOperations"){
   				debugger
             	 URL = contextPath + "/dataManagement/deleteBatchOperation.do";
             	}
   			else if(master == "shipmentRate"){
              	 URL = contextPath + "/outletMaster/deleteShipmentRate.do";
              	}
   			else if(master == "homePageDeals"){
   				URL = contextPath + "/b2c/deleteHotDeal.do";	
            }
   			else if(master == "NewArrivals"){
             	 URL = contextPath + "/b2c/deleteNewArrivals.do";
             }
   			else if(master == "user"){
                URL = contextPath + "/userAccessControl/deleteUser.do";
                var type = $("#type").val();
                $.ajax({
    				type: "POST",
    				url : URL,
    				data : {
    					ids:selected,
    					type : type
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
   			else if(master == "deals"){
   				//alert($("#outletLocation").val());
   				URL = contextPath + "/inventorymanager/deletedeals.do";	
               // var type = $("#type").val();
                $.ajax({
    				type: "POST",
    				url : URL,
    				data : {
    					ids:selected,
    					location : $("#outletLocation").val(),
    					type : master
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
   			else if(master == "offers"){
   				//alert($("#outletLocation").val());
   				URL = contextPath + "/inventorymanager/deleteoffers.do";	
               // var type = $("#type").val();
                $.ajax({
    				type: "POST",
    				url : URL,
    				data : {
    					ids:selected,
    					location : $("#outletLocation").val(),
    					type : master
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
   			else if(master == "warehouse"){
                URL = contextPath + "/inventorymanager/deleteWarehouse.do";
                $.ajax({
    				type: "POST",
    				url : URL,
    				data : {
    					ids:selected,
    					location : $("#workLocation").val()
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
   			else if(master == "shift"){
   				var   flowUnder = $("#flowUnder").val();
                URL = contextPath + "/admin/deleteShifts.do";
                $.ajax({
    				type: "POST",
    				url : URL,
    				data : {
    					ids:selected,
    					location : $("#shift_location").val(),
    					flowUnder : flowUnder
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
   			$.ajax({
				type: "POST",
				url : URL,
				data : {
					ids:selected,
					maxRecords : maxRecords,
					searchName : searchName
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
   	}
     function validateChangePasswordForm(isLink) {  
    	 var password = $("#password").val();
    	 var newPassword = $("#newPassword").val();
    	 var confirmPassword = $("#confirmPassword").val();
    	 password = password.trim();
    	 newPassword = newPassword.trim();
    	 confirmPassword = confirmPassword.trim();
    	 if (password == "") {
    		$("#password").focus();
    		$("#passError").html("Password is Required");
    		return false;
    	 }
    	 if(!passwordValidation(password)){
    		 $("#password").focus();
    		 $("#passError").html("Invalid Password (Ex:Tech123@)");
    		return false;
    	 }
    	 if (newPassword == "") {
     		$("#newPassword").focus();
     		$("#newPassError").html("Password is Required");
     		return false;
     	 }
     	 if(!passwordValidation(newPassword)){
     		 $("#newPassword").focus();
     		 $("#newPassError").html("Invalid Password (Ex:Tech123@)");
     		return false;
     	 }
     	if (confirmPassword == "") {
    		$("#confirmPassword").focus();
    		$("#confPassError").html("Confirm Password is Required");
    		return false;
    	 }
     	if(newPassword != confirmPassword){
     			$("#confirmPassword").val("");
     			$("#confirmPassword").focus();
     			$("#confPassError").html("Password did not match");
     			return false;
     	}
     	if(isLink == "Link"){
     	//	alert("Link");
     		return true;
     	}
     	var contextPath = $("#contextPath").val();
	    URL = contextPath + "/login/changePassword.do";
		$.ajax({
			type: "POST",
			url : URL,
			async : false,
			dataType : 'json',
			data : {
				password:password,
				newPassword:newPassword,
				confirmPassword:confirmPassword
			},
			beforeSend: function(xhr){                    
	   	   			$("#loading").css("display","block");
	   	   			$("#mainDiv").addClass("disabled");
	   	   		  },
			success : function(result) {
				//$("#error").html("");
				messageStatus= JSON.stringify(result);
				var parsed_json = JSON.parse(messageStatus);
				var error = parsed_json.err;
				//alert(error);
				$("#error").html(error);
				var msg = parsed_json.msg;
				//alert(msg);
				$("#Msg").html(msg);
				$("#password").val("");
				$("#newPassword").val("");
				$("#confirmPassword").val("");
				$("#loading").css("display","none");
				$("#mainDiv").removeClass('disabled');
			},
			error : function() {
				 alert("something went wrong");
				 $("#loading").css("display","none");
	 			 $("#mainDiv").removeClass('disabled');
			}
		});
     	//return true;
     } 
     
     function resetChangePasswordForm(){
    	 $("#password").val("");
    	 $("#newPassword").val("");
    	 $("#confirmPassword").val("");
     }
     
     function phoneNoValidation(phNo){
    	// var noFormat = /^([0-9]{10})|(\([0-9]{3}\)\s+[0-9]{3}\-[0-9]{4})$/;
    	 var noFormat = /^\+?(\d[\d-. ]+)?(\([\d-. ]+\))?[\d-. ]+\d$/;
    	 if(!noFormat.test(phNo)){
    		 return false;
    	 }else
    		 return true;
     }
     
     function updateProfile(e){
    	 var firstName = $("#firstName").val();
    	 var lastName = $("#lastName").val();
    	 if($("#error").text() != ""){
    		 $("#phoneNumber").focus();
    		 return false;
    	 }
    	 var defaultCountry = $("#defaultCountry").val().trim();
    	 var phoneNumber = $("#phoneNumber").val().trim();
		 if(defaultCountry != "" && phoneNumber != ""){
			 $("#contactOffice").val(defaultCountry+"-"+phoneNumber);
		 }
    	 var contactOffice = $("#contactOffice").val();
    	 if($("#error1").text() != ""){
    		 $("#phoneNumber1").focus();
    		 return false;
    	 }
    	 defaultCountry = $("#defaultCountry1").val().trim();
    	 phoneNumber = $("#phoneNumber1").val().trim();
		 if(defaultCountry != "" && phoneNumber != ""){
			 $("#contactPersonnel").val(defaultCountry+"-"+phoneNumber);
		 }
    	 var contactPersonnel = $("#contactPersonnel").val();
    	 if(firstName.trim() == ""){
         	$("#firstNameError").html("First Name is required");
         	$("#firstName").focus();
  	  		return false;
  	  	 }
         if(lastName.trim() == ""){
         	$("#lastNameError").html("Last Name is required");
         	$("#lastName").focus();
  	  		return false;
  	  	 }
         if(contactOffice.trim() == ""){
         	 $("#error").html("Contact Office is required");
         	 $("#phoneNumber").focus();
         	 return false;
           }
    	  if(contactPersonnel.trim() == ""){
         	 $("#error1").html("Contact Personnal is required");
         	 $("#phoneNumber1").focus();
         	 return false;
           }
    	  var formData  = JSON.stringify($('form').serializeObject());
//    	     alert(formData);
    	     var contextPath = $("#contextPath").val();
    		 URL = contextPath + "/login/updateProfile.do";
//    	   	alert(URL+"  url");
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
    	
     
     
    
     
     
     function validateForgotPassword(){
			 var emailId = $("#emailId").val();
			 var customerId = $('#userId').val();
	    	 emailId = emailId.trim();
	    	 customerId = customerId.trim();
	    	 if (emailId == "") {
	     		$("#emailId").focus();
	   			$("#emailError").html("Email Id is Required");
	   			return false;
	     	 }else if(!emailValidation(emailId)){
	     		$("#emailError").html("Invalid Email Id");
	     		$("#emailId").focus();
	     		return false;
	     	 }else if(customerId==""){
	     		$("#clientError").html("Customer Id is Required");
	     		$("#userId").focus();
	     		return false;
	     	 }else{
	     		 var contextPath = $('#contextPath').val();
	     		 var URL = contextPath+"/login/forgotPassword.do";
	     		 var formData = JSON.stringify($('form').serializeObject());
	     		 $.ajax({
	     			type:"POST",
	     			url:URL,
	     			contentType: "application/json",
	     			data: formData,
                  beforeSend: function(xhr){                    
     	   	   		 $("#Errortext").html("Please Wait while Processing request.!");

     	   	   		  },
	     			success : function(result){
	     				var parsed_json = JSON.parse(JSON.stringify(result));
	    				var msg = parsed_json.msg;
	     				if(msg!=""){
		                     $("#Errortext").html("");
	     					 $("#Error").html(msg);
//	     					setTimeout(function() { $("#Error").fadeOut(1500); }, 3500);
	     				}
	     			},
	     			error : function(){
		          $("#Errortext").html("");
	     				alert("failure");
	     			}
	     		 });
	     	 }
	    	
		}

     function validateResetPassword (){
    	 var contextPath = $('#contextPath').val();
    	 var newpwd = $('#newPassword').val();
    	 var confirmPassword = $('#confirmPassword').val();
    	 if(newpwd.trim()==""){
    		$("#newPassError").html("Invalid Password (Ex:Tech123@)");
  	  		$("#newPassword").focus();
  	  		return false;
    	 }else if(confirmPassword.trim()==""){
    		$("#confPassError").html("Confirm Password is Required");
    		$('#confirmPassword').focus();
  			return false;
    	 }else if(newpwd.trim()!=confirmPassword.trim()){
    		 $("#confPassError").html("Password did not match");
      		$("#confirmPassword").val("");
  			$("#confirmPassword").focus();
  			return false;
    	 }else{
    		 $("#newPassError").html("");
	         $("#confPassError").html("");
	         var formData = JSON.stringify($('form').serializeObject());
	         var URL = contextPath + "/login/resetPassword.do";
	         $.ajax({
	        	type : "POST",
	        	url : URL,
	        	data : formData,
	        	contentType: "application/json",
            
	            success:function(result){
	            	var parsed_json = JSON.parse(JSON.stringify(result));
    				var msg = parsed_json.msg;
     				if(msg!=""){
     					 $("#Error").html(msg);
     					setTimeout(function() { 
     						$("#Error").fadeOut(1500); 
     						openHomePage();
     					}, 3500);
     				}
	        	},
	        	error : function(){
	        		alert("Something Went Wrong");
	        	}
	         });
    	 }
     }
     
     function openHomePage(){
    	 var contextPath = $("#contextPath").val();
    	 window.location.href  = contextPath + "/login/home.do";
     }
     function validatehomepagegroup(master) {
      	  
      	  //purpose:for checking internet conection
    		var online = window.navigator.onLine;
    	  	if(!online)
    	  	{
    	  	alert("check your internet connection,please try agian after some time");
    	  	return;
    	  	}
      	  
      	 
    	    var selected = "";
    	   var selectedGroup = "";
     		var selectedLabel = $('#selectlabel').val();
     		var name=$('#deleteActionLabel').val();
     		var atLeastOneIsChecked = $('input[name="selectall"]:checked').length > 0;
     		var selectedLength = $('input[name="selectall"]:checked').length;
     		var selectedID = $("#selectall").length;
     		
     		
     		debugger
     		
     		
     	 var maxRecords = 10;
   	  	if($("#maxRecords").length>0)
   	  	maxRecords = $("#maxRecords").val();
   	  	  
   	  	
   	  	 

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
     		    	var value=$(this).val();
     		    	selectedGroup+= $("#group"+value).text()+",";
     		    	//selected += $(this).val().replace(/\//g, '')+",";
     			});
     			selected = selected.slice(0,-1);// Remove last comma
     			selectedGroup=selectedGroup.slice(0,-1);
     			yes = confirm("Are you sure, you want to delete "+selectedGroup);
     		}
     		if(yes){
     			var contextPath = $("#contextPath").val();
     			
     				
        		 URL = contextPath + "/genericMaster/deletehomepagegroup.do";
             	 var location = $("#employeelocation").val();
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
        
     function validateStoreTaxation(master) {
     	  
     	  //purpose:for checking internet conection
   		var online = window.navigator.onLine;
   	  	if(!online)
   	  	{
   	  	alert("check your internet connection,please try agian after some time");
   	  	return;
   	  	}
     	  
     	 
   	    var selected = "";
   	   var selectedGroup = "";
    		var selectedLabel = $('#selectlabel').val();
    		var name=$('#deleteActionLabel').val();
    		var atLeastOneIsChecked = $('input[name="selectall"]:checked').length > 0;
    		var selectedLength = $('input[name="selectall"]:checked').length;
    		var selectedID = $("#selectall").length;
    		
    		
    		debugger
    		
    		
    	 var maxRecords = 10;
  	  	if($("#maxRecords").length>0)
  	  	maxRecords = $("#maxRecords").val();
  	  	  
  	  	
  	  	 

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
    		    	var value=$(this).val();
    		    	selectedGroup+= $("#storeTaxation"+value).text()+",";
    		    	//selected += $(this).val().replace(/\//g, '')+",";
    			});
    			selected = selected.slice(0,-1);// Remove last comma
    			selectedGroup=selectedGroup.slice(0,-1);
    			yes = confirm("Are you sure, you want to delete "+selected);
    		}
    		if(yes){
    			var contextPath = $("#contextPath").val();
    			
    				
       		 URL = contextPath + "/genericMaster/deleteStoreTaxation.do";
            	 var location = $("#employeelocation").val();
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
     
     function validateWarehouseTaxation(master) {
    	  
    	  //purpose:for checking internet conection
  		var online = window.navigator.onLine;
  	  	if(!online)
  	  	{
  	  	alert("check your internet connection,please try agian after some time");
  	  	return;
  	  	}
    	  
    	 
  	    var selected = "";
  	   var selectedGroup = "";
   		var selectedLabel = $('#selectlabel').val();
   		var name=$('#deleteActionLabel').val();
   		var atLeastOneIsChecked = $('input[name="selectall"]:checked').length > 0;
   		var selectedLength = $('input[name="selectall"]:checked').length;
   		var selectedID = $("#selectall").length;
   		
   		
   		debugger
   		
   		
   	 var maxRecords = 10;
 	  	if($("#maxRecords").length>0)
 	  	maxRecords = $("#maxRecords").val();
 	  	  
 	  	
 	  	 

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
   		    	var value=$(this).val();
   		    	selectedGroup+= $("#storeTaxation"+value).text()+",";
   		    	//selected += $(this).val().replace(/\//g, '')+",";
   			});
   			selected = selected.slice(0,-1);// Remove last comma
   			selectedGroup=selectedGroup.slice(0,-1);
   			yes = confirm("Are you sure, you want to delete "+selected);
   		}
   		if(yes){
   			var contextPath = $("#contextPath").val();
   			
   				
      		 URL = contextPath + "/genericMaster/deleteWarehouseTaxation.do";
           	 var location = $("#employeelocation").val();
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
    

  
 	 