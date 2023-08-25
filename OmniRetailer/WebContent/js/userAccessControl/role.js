		/*$("body").on("click", function () {
			var result = $("#right-side").height();
			$("#main-menu").css("height",result+"px");
		});
*/
	/*	$(document).ready(function(){
			var result = $("#right-side").height();
			$("#main-menu").css("height",result+"px");
		});*/


function viewRole(roleName){
	 var contextPath = $("#contextPath").val();
	 URL = contextPath +"/userAccessControl/viewRole.do";
	 debugger
	 var maxRecords = "10";
		if($("#maxRecords").length>0)
			maxRecords= $("#maxRecords").val();
	 
		$.ajax({
			type: "GET",
			url : URL,
			data : {
				roleName : roleName
			},
			beforeSend: function(xhr){                    
	   			$("#loading").css("display","block");
	   			$("#mainDiv").addClass("disabled");
	   		  },
			success : function(result) {
				//$(".active-menu").removeClass("active-menu");
				//$(".menu-open").css("display","none");
				//$(".menu-open").removeClass("menu-open");
				//$(".active").removeClass("active");
				debugger
				$("#right-side").html(result);
				//$('.left-side').css('height','600px');
				$("#maxRecords").val(maxRecords);
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


function selectAllroles(source){	
		checkboxes = document.getElementsByName('selectall');		
		  /*for each( var checkbox in checkboxes) {
			   checkbox.checked = source.checked;				
		}	*/
		
		for ( var i = 0; i < checkboxes.length; i++) {
		
			 checkboxes[i].checked= source.checked;	
		}
		
 }
function viewEditRole(roleName){
	debugger
	 var contextPath = $("#contextPath").val();
	 URL = contextPath +"/userAccessControl/editRole.do";
	 var maxRecords = "10";
		if($("#maxRecords").length>0)
			maxRecords= $("#maxRecords").val();
		
	var searchName=""
			if($("#searchRoles").length>0)
				searchName = $("#searchRoles").val().trim();
		
		$.ajax({
			type: "GET",
			url : URL,
			data : {
				roleName : roleName
			},
			beforeSend: function(xhr){                    
	   			$("#loading").css("display","block");
	   			$("#mainDiv").addClass("disabled");
	   		  },
			success : function(result) {
				//$(".active-menu").removeClass("active-menu");
				//$(".menu-open").css("display","none");
				//$(".menu-open").removeClass("menu-open");
				//$(".active").removeClass("active");
				$("#right-side").html(result);
				$("#maxRecords").val(maxRecords);
				$("#searchRoles").val(searchName);
				//$('.left-side').css('height','500px');
				$("#loading").css("display","none");
				$("#mainDiv").removeClass('disabled');
			},
			error : function(e) {
				//alert(e);
				//console.log(JSON.stringify(e));
				 alert("something went wrong");
				$("#loading").css("display","none");
			$("#mainDiv").removeClass('disabled');
			}
		});
}


 $("#roleName").keydown(function(){
		   $("#roleNameError").html("");
		   $(".Error").html("");
	});
 $("#roleDescription").keydown(function(){
	   $("#roleDescriptionError").html("");
	   $(".Error").html("");
});
 
		function changeImgOfPrevBlock(cls){
			var prevId = $("."+cls).attr("id");
			 if(prevId != undefined){
				 prevId = prevId.replace('Flow','');
			 }
			 if($("#"+prevId+"Img").length){
				 var prevSrc =$("#"+prevId+"Img").attr("src");
				 if(prevSrc.indexOf('down')!= -1){
					 prevSrc = prevSrc.replace('down','left');
					 $("#"+prevId+"Img").attr("src",prevSrc);
				 }
			 }
		}
		function inActivateBlock(id){
			 $(".activeDiv").removeClass("activeDiv");
			 $(".activeBlock").addClass("inactiveBlock");
			 $(".activeBlock").removeClass("activeBlock");
			 $(".activeSubDiv").removeClass("activeSubDiv");
	    	 $(".activeSubBlock").addClass("inactiveSubBlock");
	    	 changeImgOfPrevBlock('activeSubBlock');
	    	 inActivateSubChildBlock('');
			 $(".activeSubBlock").removeClass("activeSubBlock");
			/*  $("#"+id+"Read").prop('checked', true);
			 $("#"+id+"Write").prop('checked', true);
			 $("input:checkbox[name='"+id+"Read']").prop('checked', true);
			 $("input:checkbox[name='"+id+"Write']").prop('checked', true); */
		}
		function inActivateSubBlock(id){
			$(".activeSubDiv").removeClass("activeSubDiv");
			 $(".activeSubBlock").addClass("inactiveSubBlock");
			 changeImgOfPrevBlock('activeSubBlock');
			 $(".activeSubBlock").removeClass("activeSubBlock");
			 inActivateSubChildBlock('');
	    	/*  $("input:checkbox[name='"+id+"Read']").prop('checked', true);
			 $("input:checkbox[name='"+id+"Write']").prop('checked', true); */
		}
		
		function inActivateSubChildBlock(id){
			 $(".activeSubChildDiv").removeClass("activeSubChildDiv");
			 $(".activeSubChildBlock").addClass("inactiveSubChildBlock");
			 changeImgOfPrevBlock('activeSubChildBlock');
			 $(".activeSubChildBlock").removeClass("activeSubChildBlock");
			 inActivateSubChildActivities('');
	    	/*  $("input:checkbox[name='"+id+"Read']").prop('checked', true);
			 $("input:checkbox[name='"+id+"Write']").prop('checked', true); */
		}
		
		function inActivateSubChildActivities(id){
			 $(".activeSubChildActivitiesDiv").removeClass("activeSubChildActivitiesDiv");
			 $(".activSubChildActivities").addClass("inactiveSubChildActivities");
			 changeImgOfPrevBlock('activSubChildActivities');
			 $(".activSubChildActivities").removeClass("activSubChildActivities");
	    	/*  $("input:checkbox[name='"+id+"Read']").prop('checked', true);
			 $("input:checkbox[name='"+id+"Write']").prop('checked', true); */
		}
		
		function selectAll(id){
			debugger;
			
			if($("#"+id).prop('checked') == true){
				$("input:checkbox[name='"+id+"']").each(function(){
					var childId = $(this).attr('id');
					$("input:checkbox[name='"+childId+"']").each(function(){
						var subChildId = $(this).attr('id');
						if($("input:checkbox[name='"+subChildId+"']").length){
							$("input:checkbox[name='"+subChildId+"']").prop('checked', true);
						}
						$(this).prop('checked',true);
					});
					$(this).prop('checked',true);
				});
			}else{
				$("input:checkbox[name='"+id+"']").each(function(){
					var childId = $(this).attr('id');
					if($("input:checkbox[name='"+childId+"']").length){
						$("input:checkbox[name='"+childId+"']").prop('checked', false);
					}
					$("input:checkbox[name='"+childId+"']").each(function(){
						var subChildId = $(this).attr('id');
						if($("input:checkbox[name='"+subChildId+"']").length){
							$("input:checkbox[name='"+subChildId+"']").prop('checked', false);
						}
						$(this).prop('checked',false);
					});
					$(this).prop('checked',false);
				});
					var parentId = $("#"+id).attr('name');
					$("#"+parentId).prop('checked',false);
			}
		}
		function toggleCheckBox(ele){
			debugger;
			var id = $(ele).attr("id");
			var name= $(ele).attr("name");
			if($("#"+id).prop('checked') == false){
				$("#"+name).prop('checked', false);
				var parentId = $("#"+name).attr('name');
				$("#"+parentId).prop('checked',false);
				var grandParent = $("#"+parentId).attr('name');
				$("#"+grandParent).prop('checked',false);
			}
			else if($("#"+id).prop('checked') == true){
				var noOfChildren = $("input:checkbox[name='"+name+"']").length;
				var noOfChecked = $("input:checkbox[name='"+name+"']:checked").length;
				if(noOfChildren == noOfChecked)
					$("#"+name).prop('checked', true);
			}
		}
		function activateHeader(id){
			changeImgOfPrevBlock('activeHeader');
			//$(".activeHeader").slideUp("slow");
			$(".activeHeader").css("display","none");
			var prevId = $(".activeHeader").attr("id");
			if(prevId != undefined){
				if(prevId.indexOf(id) != -1){
					$(".activeHeader").removeClass("activeHeader");
					$(".activeBlock").addClass("inactiveBlock");
					 changeImgOfPrevBlock('activeBlock');
					 $(".activeDiv").removeClass("activeDiv");
					 $(".activeBlock").removeClass("activeBlock");
			    	 $(".activeSubBlock").addClass("inactiveSubBlock");
			    	 changeImgOfPrevBlock('activeSubBlock');
			    	 $(".activeSubDiv").removeClass("activeSubDiv");
					 $(".activeSubBlock").removeClass("activeSubBlock");
					return;
				}
			}
			$(".activeHeader").removeClass("activeHeader");
			$(".activeBlock").addClass("inactiveBlock");
			 changeImgOfPrevBlock('activeBlock');
			 $(".activeDiv").removeClass("activeDiv");
			 $(".activeBlock").removeClass("activeBlock");
	    	 $(".activeSubBlock").addClass("inactiveSubBlock");
	    	 changeImgOfPrevBlock('activeSubBlock');
	    	 $(".activeSubDiv").removeClass("activeSubDiv");
			 $(".activeSubBlock").removeClass("activeSubBlock");
			$("#"+id+"Flow").addClass("activeHeader");
			//$(".activeHeader").slideDown("slow");
			$(".activeHeader").css("display","block");
			var src =$("#"+id+"Img").attr("src");
			src = src.replace('left','down');
			$("#"+id+"Img").attr("src",src);
		}
		function activate(id){
			debugger;
			 if($("#"+id+"Img").length){
				 var src =$("#"+id+"Img").attr("src");
				 if(src.indexOf('left')!= -1){
					 src = src.replace('left','down');
					 changeImgOfPrevBlock('activeBlock');
					 inActivateBlock(id);
			    	 $("#"+id+"Flow").addClass("activeBlock");
			    	 $("#"+id+"Flow").removeClass("inactiveBlock");
					 $("#"+id+"Img").attr("src",src);
					 $("#"+id+"Id").addClass("activeDiv");
					 
				 }
				 else{
					 src = src.replace('down','left');
					 inActivateBlock(id);
					 $("#"+id+"Img").attr("src",src);
				 }
					 
			 }
			 else{
				 changeImgOfPrevBlock('activeBlock');
				 inActivateBlock(id);
		    	 $("#"+id+"Flow").addClass("activeBlock");
		    	 $("#"+id+"Flow").removeClass("inactiveBlock");
			 }
		}
		
		
		function activateSubFlow(id){
			debugger;
			if($("#"+id+"Img").length){
				 var src =$("#"+id+"Img").attr("src");
				 if(src.indexOf('left')!= -1){
					 src = src.replace('left','down');
					 changeImgOfPrevBlock('activeSubBlock');
					 inActivateSubBlock(id);
					 $("#"+id+"Id").addClass("activeSubDiv");
			    	 $("#"+id+"Flow").addClass("activeSubBlock");
			    	 $("#"+id+"Flow").removeClass("inactiveSubBlock");
					 $("#"+id+"Img").attr("src",src);
				 }
				 else{
					 src = src.replace('down','left');
					 inActivateSubBlock(id);
					 $("#"+id+"Img").attr("src",src);
				 }
			 }
			 else{
				 inActivateSubBlock(id);
		    	 $("#"+id+"Flow").addClass("activeSubBlock");
		    	 $("#"+id+"Flow").removeClass("inactiveSubBlock");
			 }
		}
		
		function activateSubChildFlow(id){
			debugger;
			if($("#"+id+"Img").length){
				 var src =$("#"+id+"Img").attr("src");
				 if(src.indexOf('left')!= -1){
					 src = src.replace('left','down');
					 changeImgOfPrevBlock('activeSubChildBlock');
					 inActivateSubChildBlock(id);
					 $("#"+id+"Id").addClass("activeSubChildDiv");
			    	 $("#"+id+"Flow").addClass("activeSubChildBlock");
			    	 $("#"+id+"Flow").removeClass("inactiveSubChildBlock");
					 $("#"+id+"Img").attr("src",src);
				 }
				 else{
					 src = src.replace('down','left');
					 inActivateSubChildBlock(id);
					 $("#"+id+"Img").attr("src",src);
				 }
			 }
			 else{
				 inActivateSubChildBlock(id);
		    	 $("#"+id+"Flow").addClass("activeSubChildBlock");
		    	 $("#"+id+"Flow").removeClass("inactiveSubChildBlock");
			 }
		}
		
		function activateSubChildActivities(id){
			debugger;
			if($("#"+id+"Img").length){
				 var src =$("#"+id+"Img").attr("src");
				 if(src.indexOf('left')!= -1){
					 src = src.replace('left','down');
					 changeImgOfPrevBlock('activSubChildActivities');
					 inActivateSubChildActivities(id);
					 $("#"+id+"Id").addClass("activeSubChildActivitiesDiv");
			    	 $("#"+id+"Flow").addClass("activSubChildActivities");
			    	 $("#"+id+"Flow").removeClass("inactiveSubChildActivities");
					 $("#"+id+"Img").attr("src",src);
				 }
				 else{
					 src = src.replace('down','left');
					 inActivateSubChildActivities(id);
					 $("#"+id+"Img").attr("src",src);
				 }
			 }
			 else{
				 inActivateSubChildActivities(id);
		    	 $("#"+id+"Flow").addClass("activSubChildActivities");
		    	 $("#"+id+"Flow").removeClass("inactiveSubChildActivities");
			 }
		}
		
		function checkSelected(accessControlList){
			
			debugger;
	
			var list = jQuery.parseJSON(accessControlList);
			var nameRead='',nameWrite='',nameCCTo='';
			for(var i=0;i<list.length;i++){
				if(list[i].appName == 'Console'){
					if(list[i].read == true){
						if(list[i].appSubDocument != null && list[i].appSubDocument != "")
							$("#"+list[i].appSubDocument+"Read").prop('checked',true);
						else if(list[i].appDocument != null && list[i].appDocument != "")
							$("#"+list[i].appDocument+"Read").prop('checked',true);
					}
					if(list[i].write == true){
						if(list[i].appSubDocument != null && list[i].appSubDocument != "")
							$("#"+list[i].appSubDocument+"Write").prop('checked',true);
						else if(list[i].appDocument != null && list[i].appDocument != "")
							$("#"+list[i].appDocument+"Write").prop('checked',true);
					}
					if(list[i].notification == true){
					
						console.log("notitifcation is true:");
						if(list[i].appSubDocument != null && list[i].appSubDocument != "")
							$("#"+list[i].appSubDocument+"CCTo").prop('checked',true);
						else if(list[i].appDocument != null && list[i].appDocument != "")
							$("#"+list[i].appDocument+"CCTo").prop('checked',true);
					}
//					nameRead = $("#"+list[i].appDocument+"Read").attr('name');
//					nameWrite = $("#"+list[i].appDocument+"Write").attr('name');
					if(list[i].appSubDocument != null && list[i].appSubDocument != "")
						nameRead = $("#"+list[i].appSubDocument+"Read").attr('name');
					else if(list[i].appDocument != null && list[i].appDocument != "")
						nameRead = $("#"+list[i].appDocument+"Read").attr('name');
					if(list[i].appSubDocument != null && list[i].appSubDocument != "")
						nameWrite = $("#"+list[i].appSubDocument+"Write").attr('name');
					else if(list[i].appDocument != null && list[i].appDocument != "")
						nameWrite = $("#"+list[i].appDocument+"Write").attr('name');
					if(list[i].appSubDocument != null && list[i].appSubDocument != "")
						nameCCTo = $("#"+list[i].appSubDocument+"CCTo").attr('name');
					else if(list[i].appDocument != null && list[i].appDocument != "")
						nameCCTo = $("#"+list[i].appDocument+"CCTo").attr('name');
					
				}
				if(list[i].appName == 'Warehouse'){
					if(list[i].read == true)
						$("#warehouseApp"+list[i].appDocument+"Read").prop('checked',true);
					if(list[i].write == true)
						$("#warehouseApp"+list[i].appDocument+"Write").prop('checked',true);
					if(list[i].notification == true)
						$("#warehouseApp"+list[i].appDocument+"CCTo").prop('checked',true);
					nameRead = $("#warehouseApp"+list[i].appDocument+"Read").attr('name');
					nameWrite = $("#warehouseApp"+list[i].appDocument+"Write").attr('name');
					nameCCTo = $("#warehouseApp"+list[i].appDocument+"CCTo").attr('name');

//					$("#warehouseLocation").val(list[i].location.split(','));
				}
				
				//modified by manasa
				//created date:7/3/18
				
				if(list[i].appName == 'Outlet'){
//					debugger
					if(list[i].read == true){
						if(list[i].appFlow == list[i].appDocument || list[i].appSubflow == list[i].appDocument){
							$("#store"+list[i].appDocument+"Read").prop('checked',true);
							nameRead = $("#store"+list[i].appDocument+"Read").attr('name');
						}
						else{
							if(list[i].appSubDocument != null && list[i].appSubDocument != ""){
								$("#"+list[i].appSubflow+list[i].appSubDocument+"Read").prop('checked',true);
								nameRead = $("#"+list[i].appSubflow+list[i].appSubDocument+"Read").attr('name');
							}
							else{
							$("#"+list[i].appSubflow+list[i].appDocument+"Read").prop('checked',true);
							nameRead = $("#"+list[i].appSubflow+list[i].appDocument+"Read").attr('name');
							}
							}
					}
					if(list[i].write == true){
						if(list[i].appFlow == list[i].appDocument || list[i].appSubflow == list[i].appDocument){
							$("#store"+list[i].appDocument+"Write").prop('checked',true);
							nameWrite = $("#store"+list[i].appDocument+"Write").attr('name');
						}
						else{
							if(list[i].appSubDocument != null && list[i].appSubDocument != ""){
								$("#"+list[i].appSubflow+list[i].appSubDocument+"Write").prop('checked',true);
								nameWrite = $("#"+list[i].appSubflow+list[i].appSubDocument+"Write").attr('name');
							}
							else
							{
							$("#"+list[i].appSubflow+list[i].appDocument+"Write").prop('checked',true);
							nameWrite = $("#"+list[i].appSubflow+list[i].appDocument+"Write").attr('name');
						    }
						}
					}
					
					if(list[i].notification == true){
						
						if(list[i].appFlow == list[i].appDocument || list[i].appSubflow == list[i].appDocument){
							$("#store"+list[i].appDocument+"CCTo").prop('checked',true);
							nameCCTo = $("#store"+list[i].appDocument+"CCTo").attr('name');
						}
						else{
							if(list[i].appSubDocument != null && list[i].appSubDocument != ""){
								$("#"+list[i].appSubflow+list[i].appSubDocument+"CCTo").prop('checked',true);
								nameCCTo = $("#"+list[i].appSubflow+list[i].appSubDocument+"CCTo").attr('name');
							}
							else
							{
							$("#"+list[i].appSubflow+list[i].appDocument+"CCTo").prop('checked',true);
							nameCCTo = $("#"+list[i].appSubflow+list[i].appDocument+"CCTo").attr('name');
						   }
					     }
					}
//					$("#storeLocation").val(list[i].location.split(','));
				}
				
				var noOfChildren = $("input:checkbox[name='"+nameRead+"']").length;
				var noOfChecked = $("input:checkbox[name='"+nameRead+"']:checked").length;
				
				if(noOfChildren == noOfChecked)
					$("#"+nameRead).prop('checked', true);
				
				
				noOfChildren = $("input:checkbox[name='"+nameWrite+"']").length;
				noOfChecked = $("invalidateRoleput:checkbox[name='"+nameWrite+"']:checked").length;
				
				if(noOfChildren == noOfChecked)
					$("#"+nameWrite).prop('checked', true);
			
				noOfChildren = $("input:checkbox[name='"+nameCCTo+"']").length;
				noOfChecked = $("input:checkbox[name='"+nameCCTo+"']:checked").length;
				
				if(noOfChildren == noOfChecked)
					$("#"+nameCCTo).prop('checked', true); 
				
				var parentId = $("input:checkbox[id='"+nameRead+"']").attr('name');
//				if(parentId==="storeStockManagementRead")
					
				noOfChildren = $("input:checkbox[name='"+parentId+"']").length;
				noOfChecked = $("input:checkbox[name='"+parentId+"']:checked").length;
			// this is modified by me	
				if(noOfChildren == noOfChecked)
					$("#"+parentId).prop('checked', true);
				//$("#"+nameCCTo).prop('checked', true);
			//this is end of modification	
				var parentId = $("input:checkbox[id='"+nameCCTo+"']").attr('name');
				noOfChildren = $("input:checkbox[name='"+nameCCTo+"']").length;
				noOfChecked = $("input:checkbox[name='"+nameCCTo+"']:checked").length;
				
				debugger;
				if(noOfChildren == noOfChecked)
					$("#"+parentId).prop('checked', true);
				parentId = $("input:checkbox[id='"+nameWrite+"']").attr('name');
				noOfChildren = $("input:checkbox[name='"+parentId+"']").length;
				noOfChecked = $("input:checkbox[name='"+parentId+"']:checked").length;
				if(noOfChildren == noOfChecked)
					$("#"+parentId).prop('checked', true);
			}
			/*if($('#Edit').val() === "true")
			 if(document.getElementById("WarehouseStocksRead").checked && document.getElementById("WarehouseStockVerificationRead").checked
					 && document.getElementById("WarehouseProcurementShipmentRead").checked && document.getElementById("WarehouseProcurementRead").checked
					 && document.getElementById("WarehouseGoodsTransferRead").checked)
				 
				 
					$("#WarehouseStockmanagementRead").prop('checked', true);
			 if(document.getElementById("WarehouseConfigurationsRead").checked && document.getElementById("WhCounterMasterRead").checked
					 && document.getElementById("WarehouseStockmanagementRead").checked && document.getElementById("WarehouseSalesOrderRead").checked
					 && document.getElementById("WarehouseHealthRead").checked  && document.getElementById("WarehouseNotificationsRead").checked)
				 
				 
					$("#WarehouseManagementRead").prop('checked', true);
			 
			 if(document.getElementById("storeStockmanagementViewStocksRead").checked && document.getElementById("storeGoodsProcurementRead").checked
					 && document.getElementById("storeGoodsTransferRead").checked && document.getElementById("storeStoreStockVerificationRead").checked
					 && document.getElementById("storeDeliveriesRead").checked)
				 
				 
					$("#storeStockManagementRead").prop('checked', true);
			 
			 if(document.getElementById("GenericBusinessSettingsRead").checked && document.getElementById("OutletMasterSettingsRead").checked
					 && document.getElementById("WarehouseMasterSettingsRead").checked)
				 
				 
					$("#MasterDataManagementRead").prop('checked', true);
			 
			 if(document.getElementById("OrderManagementSalesOrderRead").checked && document.getElementById("OrderManagementFulFillmentRead").checked
					 && document.getElementById("OrderManagementPaymentsRead").checked)
				 
				 
					$("#OrderManagementRead").prop('checked', true);*/
			 
			 
			//console.log(accessControlList);
		}
		
		function selectActivities(accessControlActivity){
			debugger
			var parsedJson = jQuery.parseJSON(accessControlActivity);
			$("select.activities").each(function(){
				debugger
				var id = $(this).attr("id");
				var activities = parsedJson[id];
				if(activities != undefined){
					$("#"+id).val(activities.split(','));
				}
			});
		}
		
		
		
		
		function validateRole(operation){
			debugger;
			var finalObj = {}, accessControl = [], accessControlActivity = [];
			var roleName = $("#roleName").val();
			if(roleName == ""){
				$("#roleNameError").html("Role Name is Required");
				return;
			}
			
			
			var maxRecords = "10";
	  		if($("#maxRecords").length>0)
	  			maxRecords= $("#maxRecords").val();
	  		var searchName=""
				if($("#searchRoles").length>0)
					searchName = $("#searchRoles").val().trim();
			
			var roleDescription = $("#roleDescription").val();
			var validDate = $("#validDate").val();
			finalObj.roleName = roleName;
			finalObj.roleDescription = roleDescription;
			finalObj.accessControl = accessControl;
			finalObj.validDate = validDate;
			finalObj.maxRecords = maxRecords;
			
			finalObj.accessControlActivity = accessControlActivity;
			var location = []; 
			$("#storeLocation option:selected").each(function(){
				var obj = {location:$(this).val(), remarks:"outlet"};
				location.push(obj);
			});
			$("#warehouseLocation option:selected").each(function(){
				var obj = {location:$(this).val(),remarks:"wareHouse"};
				location.push(obj);
			});
			$("#consoleLocation option:selected").each(function(){
				var obj = {location:$(this).val(),remarks:"console"};
				location.push(obj);
			});
			
			finalObj.roleLocations = location;
			
			//------ For CLOUD PERMISSIONS ---------
			// main  flows iterating. flows are like User Access Control, Data Management etc...
			$("input:checkbox[name='consoleRead']").each(function(){
				var currentId = $(this).attr('id');
//				alert(currentId+"  Inside main If");
				if($("input:checkbox[name='"+currentId+"']").length){
//					alert("Main Flow having subflow");
					
					// child of main  flows if exists, then iterating. 
					// Flows are like Roles Management, User Management for User Access Control Menu
					$("input:checkbox[name='"+currentId+"']").each(function(){
						var childId = $(this).attr('id');
//						alert("Subflow Id "+childId);
						
						if($("input:checkbox[name='"+childId+"']").length){
							
//							alert("Subflow having more Subflow");
							// sub child of main  flows if exists, then iterating. 
							// Flows are like Shift Master, Shift Configuration for Shift Management which is under Outlet Management
							$("input:checkbox[name='"+childId+"']").each(function(){
						//		alert("Iterating sub subflow");
								var subChildId = $(this).attr('id');
								
								if($("input:checkbox[name='"+subChildId+"']").length){
									$("input:checkbox[name='"+subChildId+"']").each(function(){
										var grandSubChildId = $(this).attr('id');
										
										
										
										var grandSubChildIdWrite = grandSubChildId.replace('Read','Write');
										var grandSubChildIdCCTo = grandSubChildId.replace('Read','CCTo');
										
										
										if($("#"+grandSubChildId).prop('checked') == true || $("#"+grandSubChildIdWrite).prop('checked') == true || $("#"+grandSubChildIdCCTo).prop('checked') == true ){
											var obj = {
													appName : "Console",
													appFlow : currentId.replace('Read',''),
													appSubflow : childId.replace('Read',''),
													appDocument : subChildId.replace('Read',''),
													appSubDocument : grandSubChildId.replace('Read',''),
													read : $("#"+grandSubChildId).prop('checked'),
													write : $("#"+grandSubChildIdWrite).prop('checked'),
													notification: $("#"+grandSubChildIdCCTo).prop('checked'),
												};
											finalObj.accessControl.push(obj);
										}
										
										// if there is any activities, with the child of sub main flow like view Stocks, verify stocks etc
										var grandSubChildActivity = grandSubChildId.replace('Read','');
										var grandSubChildIdActivities = $('select[name="' + grandSubChildActivity + '"]').val();
										if(grandSubChildIdActivities != null && grandSubChildIdActivities != undefined){
											
											var grandSubChildIdWrite = grandSubChildId.replace('Read','Write');
											var grandSubChildIdCCTo = grandSubChildId.replace('Read','CCTo');
											if(grandSubChildIdActivities.toString().indexOf(',') > -1){
												var grandSubChildIdActivitiesArray = grandSubChildIdActivities.toString().split(',');
											
											//	debugger;
												
												for(var i = 0; i < grandSubChildIdActivitiesArray.length; i++){
													var obj = {
															appName : "Console",
															appFlow : currentId.replace('Read',''),
															appSubFlow : childId.replace('Read',''),
															appDocument : subChildId.replace('Read',''),
															appSubDocument : grandSubChildId.replace('Read',''),
															activityRead : $("#"+grandSubChildId).prop('checked'),
															activityWrite : $("#"+grandSubChildIdWrite).prop('checked'),
															notification : $("#"+grandSubChildIdCCTo).prop('checked'),
															appDocumentActivity : grandSubChildIdActivitiesArray[i]
//															storeLocation : location
													};
													finalObj.accessControlActivity.push(obj);

													/*if(childId.replace('Read','') == "WarehouseGoodsTransfer" ){
														alert("tester");
													}*/
				/*									debugger;
													var grandSubChildIdActivitiesFeilds = $('select[name="' + grandSubChildActivity + '1"]').val();
													if(grandSubChildIdActivitiesFeilds != null && grandSubChildIdActivitiesFeilds != undefined){
														
														var grandSubChildIdWrite = grandSubChildId.replace('Read','Write');
														var grandSubChildIdCCTo = grandSubChildId.replace('Read','CCTo');
														if(grandSubChildIdActivitiesFeilds.toString().indexOf(',') > -1){
															var grandSubChildIdActivitiesFeildsArray = grandSubChildIdActivitiesFeilds.toString().split(',');
														
															
															
															for(var j = 0; j < grandSubChildIdActivitiesFeildsArray.length; j++){
																var obj = {
																		appName : "Console",
																		appFlow : currentId.replace('Read',''),
																		appSubFlow : childId.replace('Read',''),
																		appDocument : subChildId.replace('Read',''),
																		appSubDocument : grandSubChildId.replace('Read',''),
																		activityRead : $("#"+grandSubChildId).prop('checked'),
																		activityWrite : $("#"+grandSubChildIdWrite).prop('checked'),
																		notification : $("#"+grandSubChildIdCCTo).prop('checked'),
																		appDocumentActivity : grandSubChildIdActivitiesArray[i],
																		appDocumentFieldName : grandSubChildIdActivitiesFeildsArray[j]

//																		storeLocation : location
																};
																finalObj.accessControlActivity.push(obj);
																
															}
														}else{
															
															
															grandSubChildIdActivities = grandSubChildIdActivities.toString().replace('[','').replace(']','');
															var obj = {
																	appName : "Console",
																	appFlow : currentId.replace('Read',''),
																	appSubFlow : childId.replace('Read',''),
																	appDocument : subChildId.replace('Read',''),
																	appSubDocument : grandSubChildId.replace('Read',''),
																	activityRead : $("#"+grandSubChildId).prop('checked'),
																	activityWrite : $("#"+grandSubChildIdWrite).prop('checked'),
																	notification : $("#"+grandSubChildIdCCTo).prop('checked'),
																	appDocumentActivity : grandSubChildIdActivities,
																	
//																	storeLocation : location
															};
															finalObj.accessControlActivity.push(obj);
														}
													}*/
													
												}
											}else{
												
												
												grandSubChildIdActivities = grandSubChildIdActivities.toString().replace('[','').replace(']','');
												var obj = {
														appName : "Console",
														appFlow : currentId.replace('Read',''),
														appSubFlow : childId.replace('Read',''),
														appDocument : subChildId.replace('Read',''),
														appSubDocument : grandSubChildId.replace('Read',''),
														activityRead : $("#"+grandSubChildId).prop('checked'),
														activityWrite : $("#"+grandSubChildIdWrite).prop('checked'),
														notification : $("#"+grandSubChildIdCCTo).prop('checked'),
														appDocumentActivity : grandSubChildIdActivities
//														storeLocation : location
												};
												finalObj.accessControlActivity.push(obj);
											}
										}
										
									});
								}
								else{
									var subChildIdWrite = subChildId.replace('Read','Write');
									var subChildIdCCTo = subChildId.replace('Read','CCTo');
									
									if($("#"+subChildId).prop('checked') == true || $("#"+subChildIdWrite).prop('checked') == true || $("#"+subChildIdCCTo).prop('checked') == true){
										var obj = {
												appName : "Console",
												appFlow : currentId.replace('Read',''),
												appSubflow : childId.replace('Read',''),
												appDocument : subChildId.replace('Read',''),
												read : $("#"+subChildId).prop('checked'),
												write : $("#"+subChildIdWrite).prop('checked'),
												notification : $("#"+subChildIdCCTo).prop('checked')
											};
										finalObj.accessControl.push(obj);
									}
								}
								// if there is any activities, with the child of sub main flow like view Stocks, verify stocks etc
								var subChildActivity = subChildId.replace('Read','');
								var subChildIdActivities = $('select[name="' + subChildActivity + '"]').val();
//								alert(subChildId);
//								alert(subChildIdActivities);
								if(subChildIdActivities != null && subChildIdActivities != undefined){
									
									var subChildIdWrite = subChildId.replace('Read','Write');
									var subChildIdCCTo = subChildId.replace('Read','CCTo');
									
									if(subChildIdActivities.toString().indexOf(',') > -1){
										var subChildIdActivitiesArray = subChildIdActivities.toString().split(',');
										for(var i = 0; i < subChildIdActivitiesArray.length; i++){
											var obj = {
													appName : "Console",
													appFlow : currentId.replace('Read',''),
													appSubFlow : childId.replace('Read',''),
													appDocument : subChildId.replace('Read',''),
													activityRead : $("#"+subChildId).prop('checked'),
													activityWrite : $("#"+subChildIdWrite).prop('checked'),
													notification : $("#"+subChildIdCCTo).prop('checked'),
													appDocumentActivity : subChildIdActivitiesArray[i]
//													storeLocation : location
											};
											finalObj.accessControlActivity.push(obj);
											/*if(childId.replace('Read','') == "WarehouseGoodsTransfer" ){
												alert("tester");
											}*/
									/*		debugger;
											var subChildIdActivitiesFeilds = $('select[name="' + subChildActivity + '1"]').val();
											if(subChildIdActivitiesFeilds != null && subChildIdActivitiesFeilds != undefined){
												
												var subChildIdWrite = subChildId.replace('Read','Write');
												var subChildIdCCTo = subChildId.replace('Read','CCTo');
												if(subChildIdActivitiesFeilds.toString().indexOf(',') > -1){
													var subChildIdActivitiesFeildsArray = subChildIdActivitiesFeilds.toString().split(',');
												
													
													
													for(var j = 0; j < subChildIdActivitiesFeildsArray.length; j++){
														var obj = {
																appName : "Console",
																appFlow : currentId.replace('Read',''),
																appSubFlow : childId.replace('Read',''),
																appDocument : subChildId.replace('Read',''),
																activityRead : $("#"+subChildId).prop('checked'),
																activityWrite : $("#"+subChildIdWrite).prop('checked'),
																notification : $("#"+subChildIdCCTo).prop('checked'),
																appDocumentActivity : subChildIdActivitiesArray[i],
																appDocumentFieldName : subChildIdActivitiesFeildsArray[j]

//																storeLocation : location
														};
														finalObj.accessControlActivity.push(obj);
														
													}
												}else{
													
													
													grandSubChildIdActivities = grandSubChildIdActivities.toString().replace('[','').replace(']','');
													var obj = {
															appName : "Console",
															appFlow : currentId.replace('Read',''),
															appSubFlow : childId.replace('Read',''),
															appDocument : subChildId.replace('Read',''),
															activityRead : $("#"+subChildId).prop('checked'),
															activityWrite : $("#"+subChildIdWrite).prop('checked'),
															notification : $("#"+subChildIdCCTo).prop('checked'),
															appDocumentActivity : grandSubChildIdActivities,
															
//															storeLocation : location
													};
													finalObj.accessControlActivity.push(obj);
												}
											}*/
											
											
										}
									}else{
										
									//	debugger;
										subChildIdActivities = subChildIdActivities.toString().replace('[','').replace(']','');
										var obj = {
												appName : "Console",
												appFlow : currentId.replace('Read',''),
												appSubFlow : childId.replace('Read',''),
												appDocument : subChildId.replace('Read',''),
												activityRead : $("#"+subChildId).prop('checked'),
												activityWrite : $("#"+subChildIdWrite).prop('checked'),
												notification : $("#"+subChildIdCCTo).prop('checked'),
												appDocumentActivity : subChildIdActivities
//												storeLocation : location
										};
										finalObj.accessControlActivity.push(obj);
									}
								}
								
								
								
							});
						}
						else{
						//	alert("subflow with no child");
							
							
							//koti
							var childIdWrite = childId.replace('Read','Write');
							var childIdCCTo= childId.replace('Read','CCTo');
							
							//debugger;
							if($("#"+childId).prop('checked') == true || $("#"+childIdWrite).prop('checked') == true || $("#"+childIdCCTo).prop('checked') == true){
								var obj = {
										appName : "Console",
										appFlow : currentId.replace('Read',''),
										appSubflow : childId.replace('Read',''),
										appDocument : childId.replace('Read',''),
										read : $("#"+childId).prop('checked'),
										write : $("#"+childIdWrite).prop('checked'),
										notification : $("#"+childIdCCTo).prop('checked')
									};
								finalObj.accessControl.push(obj);
							}
						}
							// if there is any activities, with the sub main flow like Stock Managemnt, Goods Transfer, Goods Procurement etc
							var childActivity = childId.replace('Read','');
							
//							alert(childId);
//							alert($('select[name="'+childActivity+'"]').val());
							var childIdActivities = $('select[name="' + childActivity + '"]').val();
							if(childIdActivities != null && childIdActivities != undefined){
						
								var childIdWrite = childId.replace('Read','Write');
								var childIdCCTo = childId.replace('Read','CCTo');
								
								
								if(childIdActivities.toString().indexOf(',') > -1){
									var childIdActivitiesArray = childIdActivities.toString().split(',');
									for(var i = 0; i < childIdActivitiesArray.length; i++){
										var obj = {
												appName : "Console",
												appFlow : currentId.replace('Read',''),
												appSubFlow : childId.replace('Read',''),
												appDocument : childId.replace('Read',''),
												activityRead : $("#"+childId).prop('checked'),
												activityWrite : $("#"+childIdWrite).prop('checked'),
												notification : $("#"+childIdCCTo).prop('checked'),
												appDocumentActivity : childIdActivitiesArray[i]
//												storeLocation : location
										};
										finalObj.accessControlActivity.push(obj);
										
									/*	if(childId.replace('Read','') == "WarehouseGoodsTransfer" ){
											alert("tester");
										}*/
							/*			debugger;
										var childIdActivitiesFeilds = $('select[name="' + childActivity + '1"]').val();
										if(childIdActivitiesFeilds != null && childIdActivitiesFeilds != undefined){
											
											var grandSubChildIdWrite = childId.replace('Read','Write');
											var grandSubChildIdCCTo = childId.replace('Read','CCTo');
											if(grandSubChildIdActivitiesFeilds.toString().indexOf(',') > -1){
												var childIdActivitiesFeildsArray = childIdActivitiesFeilds.toString().split(',');
											
												
												
												for(var j = 0; j < childIdActivitiesFeildsArray.length; j++){
													var obj = {
															appName : "Console",
															appFlow : currentId.replace('Read',''),
															appSubFlow : childId.replace('Read',''),
															appDocument : childId.replace('Read',''),
															activityRead : $("#"+childId).prop('checked'),
															activityWrite : $("#"+childIdWrite).prop('checked'),
															notification : $("#"+childIdCCTo).prop('checked'),
															appDocumentActivity : childIdActivitiesArray[i],
															appDocumentFieldName : childIdActivitiesFeildsArray[j]

//															storeLocation : location
													};
													finalObj.accessControlActivity.push(obj);
													
												}
											}else{
												
												
												grandSubChildIdActivities = grandSubChildIdActivities.toString().replace('[','').replace(']','');
												var obj = {
														appName : "Console",
														appFlow : currentId.replace('Read',''),
														appSubFlow : childId.replace('Read',''),
														appDocument : subChildId.replace('Read',''),
														appSubDocument : grandSubChildId.replace('Read',''),
														activityRead : $("#"+grandSubChildId).prop('checked'),
														activityWrite : $("#"+grandSubChildIdWrite).prop('checked'),
														notification : $("#"+grandSubChildIdCCTo).prop('checked'),
														appDocumentActivity : grandSubChildIdActivities,
														
//														storeLocation : location
												};
												finalObj.accessControlActivity.push(obj);
											}
										}*/
										
								
										
									}
								}else{
									
									childIdActivities = childIdActivities.toString().replace('[','').replace(']','');
									var obj = {
											appName : "Console",
											appFlow : currentId.replace('Read',''),
											appSubFlow : childId.replace('Read',''),
											appDocument : childId.replace('Read',''),
											activityRead : $("#"+childId).prop('checked'),
											activityWrite : $("#"+childIdWrite).prop('checked'),
											notification : $("#"+childIdCCTo).prop('checked'),
											appDocumentActivity : childIdActivities
//											storeLocation : location
									};
									finalObj.accessControlActivity.push(obj);
								}
							}
							
							
							
							
						
					});
				}
				else{

					
				//	debugger;
					var currentIdWrite = currentId.replace('Read','Write');
					if($("#"+currentId).prop('checked') == true || $("#"+currentIdWrite).prop('checked') == true || $("#"+childIdCCTo).prop('checked') == true){
						var obj = {
								appName : "Console",
								appFlow : currentId.replace('Read',''),
								appDocument : currentId.replace('Read',''),
								read : $("#"+currentId).prop('checked'),
								write : $("#"+currentIdWrite).prop('checked'),
								notification : $("#"+childIdCCTo).prop('checked'),
							};
						finalObj.accessControl.push(obj);
					}
				}
					// if there is any activities, with the main flow like Billing, Store Management etc
					var currenActivity = currentId.replace('Read','');
					var currentIdActivities = $('select[name="' + currenActivity + '"]').val();
					if(currentIdActivities != null && currentIdActivities != undefined){
						var currentIdWrite = currentId.replace('Read','Write');
						var currentIdCCTo= currentId.replace('Read','CCTo');
						
						
						if(currentIdActivities.toString().indexOf(',') > -1){
							var currentIdActivitiesArray = currentIdActivities.toString().split(',');
							for(var i = 0; i < currentIdActivitiesArray.length; i++){
								var obj = {
										appName : "Console",
										appFlow : currentId.replace('Read',''),
										appDocument : currentId.replace('Read',''),
										activityRead : $("#"+currentId).prop('checked'),
										activityWrite : $("#"+currentIdWrite).prop('checked'),
										notification : $("#"+currentIdCCTo).prop('checked'),
										appDocumentActivity : currentIdActivitiesArray[i]
//										storeLocation : location
								};
								finalObj.accessControlActivity.push(obj);
								/*if(childId.replace('Read','') == "WarehouseGoodsTransfer" ){
									alert("tester");
								}*/
					/*			debugger;
								var currentIdActivitiesFeilds = $('select[name="' + currenActivity + '1"]').val();
								if(currentIdActivitiesFeilds != null && currentIdActivitiesFeilds != undefined){
									
									var grandSubChildIdWrite = currentId.replace('Read','Write');
									var grandSubChildIdCCTo = currentId.replace('Read','CCTo');
									if(grandSubChildIdActivitiesFeilds.toString().indexOf(',') > -1){
										var currentIdActivitiesFeildsArray = currentIdActivitiesFeilds.toString().split(',');
									
										
										
										for(var j = 0; j < currentIdActivitiesFeildsArray.length; j++){
											var obj = {
													appName : "Console",
													appFlow : currentId.replace('Read',''),
													appDocument : currentId.replace('Read',''),
													activityRead : $("#"+currentId).prop('checked'),
													activityWrite : $("#"+currentIdWrite).prop('checked'),
													notification : $("#"+currentIdCCTo).prop('checked'),
													appDocumentActivity : currentIdActivitiesArray[i],
													appDocumentFieldName : currentIdActivitiesFeildsArray[j]

//													storeLocation : location
											};
											finalObj.accessControlActivity.push(obj);
											
										}
									}else{
										
										
										grandSubChildIdActivities = grandSubChildIdActivities.toString().replace('[','').replace(']','');
										var obj = {
												appName : "Console",
												appFlow : currentId.replace('Read',''),
												appSubFlow : childId.replace('Read',''),
												appDocument : subChildId.replace('Read',''),
												appSubDocument : grandSubChildId.replace('Read',''),
												activityRead : $("#"+grandSubChildId).prop('checked'),
												activityWrite : $("#"+grandSubChildIdWrite).prop('checked'),
												notification : $("#"+grandSubChildIdCCTo).prop('checked'),
												appDocumentActivity : grandSubChildIdActivities,
												
//												storeLocation : location
										};
										finalObj.accessControlActivity.push(obj);
									}
								}*/
								
								
							}
						}else{
							
							
							currentIdActivities = currentIdActivities.toString().replace('[','').replace(']','');
							var obj = {
									appName : "Console",
									appFlow : currentId.replace('Read',''),
									appDocument : currentId.replace('Read',''),
									activityRead : $("#"+currentId).prop('checked'),
									activityWrite : $("#"+currentIdWrite).prop('checked'),
									notification : $("#"+currentIdCCTo).prop('checked'),
									appDocumentActivity : currentIdActivities
//									storeLocation : location
							};
							finalObj.accessControlActivity.push(obj);
						}
					}
					
				
			});
			
			
			//----- FOR OUTLET PERMISSIONS
			// main  flows iterating. flows are like Billing, Store Management
			$("input:checkbox[name='storeAppRead']").each(function(){
				var currentId = $(this).attr('id');
				/*var location = '';
				if($("#storeLocation").val() != null)
					location = $("#storeLocation").val().toString();*/
				if($("input:checkbox[name='"+currentId+"']").length){
					// child of main  flows if exists, then iterating. 
					// Flows are like Stock Management, Goods Transfer, Goods Procurement, Deliveries for Store Management Menu
					$("input:checkbox[name='"+currentId+"']").each(function(){
						var childId = $(this).attr('id');
						if($("input:checkbox[name='"+childId+"']").length){
							// sub child of main  flows if exists, then iterating. 
							// Flows are like view stocks, verify stocks for Stock Management which is under Store Management
							$("input:checkbox[name='"+childId+"']").each(function(){
								var subChildId = $(this).attr('id');
							
								
								if($("input:checkbox[name='"+subChildId+"']").length){	
								$("input:checkbox[name='"+subChildId+"']").each(function(){
									
									
									//written by manasa
									//purpose:to store sub flows for cherla health
									//created date:7/3/18
									
									var grandSubChildId = $(this).attr('id');
									var grandSubChildIdWrite = grandSubChildId.replace('Read','Write');
									var grandSubChildIdCCTo = grandSubChildId.replace('Read','CCTo');
									if($("#"+grandSubChildId).prop('checked') == true || $("#"+grandSubChildIdWrite).prop('checked') == true || $("#"+grandSubChildIdCCTo).prop('checked') == true){
										var obj = {
												appName : "Outlet",
												appFlow : currentId.replace('Read','').replace('store',''),
												appSubflow : childId.replace('Read','').replace('store',''),
												appDocument : $("#"+subChildId).val(),
												appSubDocument : $("#"+grandSubChildId).val(),
												read : $("#"+grandSubChildId).prop('checked'),
												write : $("#"+grandSubChildIdWrite).prop('checked'),
												notification: $("#"+grandSubChildIdCCTo).prop('checked'),
											};
										finalObj.accessControl.push(obj);
									}
									
								});	
								}
								
								else
									{
									var subChildIdWrite = subChildId.replace('Read','Write');
									var subChildIdCCTo= subChildId.replace('Read','CCTo');
									if($("#"+subChildId).prop('checked') == true || $("#"+subChildIdWrite).prop('checked') == true ||  $("#"+subChildIdCCTo).prop('checked') == true){
										console.log("1");
										var obj = {
												appName : "Outlet",
												appFlow : currentId.replace('Read','').replace('store',''),
												appSubflow : childId.replace('Read','').replace('store',''),
												appDocument : $("#"+subChildId).val(),
												read : $("#"+subChildId).prop('checked'),
												write : $("#"+subChildIdWrite).prop('checked'),
												notification : $("#"+subChildIdCCTo).prop('checked'),
//												location : location
										};
										finalObj.accessControl.push(obj);
									}
								}
								
								
								/*if($("input:checkbox[name='"+subChildId+"']").length){
									$("input:checkbox[name='"+subChildId+"']").each(function(){
										var grandSubChildId = $(this).attr('id');
										
										var grandSubChildIdWrite = grandSubChildId.replace('Read','Write');
										var grandSubChildIdCCTo = grandSubChildId.replace('Read','CCTo');
										if($("#"+grandSubChildId).prop('checked') == true || $("#"+grandSubChildIdWrite).prop('checked') == true){
											var obj = {
													appName : "Outlet",
													appFlow : currentId.replace('Read','').replace('store',''),
													appSubFlow : childId.replace('Read','').replace('store',''),
													appDocument : $("#"+subChildId).val(),
													appSubDocument : grandSubChildId.replace('Read',''),
													read : $("#"+grandSubChildId).prop('checked'),
													write : $("#"+grandSubChildIdWrite).prop('checked'),
													notification: $("#"+grandSubChildIdCCTo).prop('checked'),
												};
											finalObj.accessControl.push(obj);
										}*/
								
								// if there is any activities, with the child of sub main flow like view Stocks, verify stocks etc
								subChildActivity = subChildId.replace('Read','');
								var subChildIdActivities = $('select[name="' + subChildActivity + '"]').val();
								if(subChildIdActivities != null && subChildIdActivities != undefined){
									var subChildIdWrite = subChildId.replace('Read','Write');
									var subChildIdCCTo= subChildId.replace('Read','CCTo');
									if(subChildIdActivities.toString().indexOf(',') > -1){
										var subChildIdActivitiesArray = subChildIdActivities.toString().split(',');
										for(var i = 0; i < subChildIdActivitiesArray.length; i++){
											console.log("2");
											var obj = {
													appName : "Outlet",
													appFlow : currentId.replace('Read','').replace('store',''),
													appSubFlow : childId.replace('Read','').replace('store',''),
													appDocument : $("#"+subChildId).val(),
													activityRead : $("#"+subChildId).prop('checked'),
													activityWrite : $("#"+subChildIdWrite).prop('checked'),
													notification: $("#"+subChildIdCCTo).prop('checked'),
													appDocumentActivity : subChildIdActivitiesArray[i]
//													storeLocation : location
											};
											finalObj.accessControlActivity.push(obj);
										}
									}else{
										subChildIdActivities = subChildIdActivities.toString().replace('[','').replace(']','');
										console.log("3");
										var obj = {
												
												appName : "Outlet",
												appFlow : currentId.replace('Read','').replace('store',''),
												appSubFlow : childId.replace('Read','').replace('store',''),
												appDocument : $("#"+subChildId).val(),
												activityRead : $("#"+subChildId).prop('checked'),
												activityWrite : $("#"+subChildIdWrite).prop('checked'),
												notification: $("#"+subChildIdCCTo).prop('checked'),
												appDocumentActivity : subChildIdActivities
//												storeLocation : location
										};
										finalObj.accessControlActivity.push(obj);
									}
								}
								
								
							});
						}
						else{
							var childIdWrite = childId.replace('Read','Write');
							var childIdCCTo = childId.replace('Read','CCTo');
							
							if($("#"+childId).prop('checked') == true || $("#"+childIdWrite).prop('checked') == true || $("#"+childIdCCTo).prop('checked') == true){
								console.log("4");
//								console.log(childId);
								var obj = {
										appName : "Outlet",
										appFlow : currentId.replace('Read','').replace('store',''),
										appSubflow : childId.replace('Read','').replace('store',''),
										appDocument : childId.replace('Read','').replace('store',''),
										read : $("#"+childId).prop('checked'),
										write : $("#"+childIdWrite).prop('checked'),
										notification : $("#"+childIdCCTo).prop('checked'),
//										location : location
									};
								finalObj.accessControl.push(obj);
							}
						}
						
						// if there is any activities, with the sub main flow like Stock Managemnt, Goods Transfer, Goods Procurement etc
						childActivity = childId.replace('Read','');
						var childIdActivities = $('select[name="' + childActivity + '"]').val();
						if(childIdActivities != null && childIdActivities != undefined){
							var childIdWrite = childId.replace('Read','Write');
							var childIdCCTo = childId.replace('Read','CCTo');
							debugger
							if(childIdActivities.toString().indexOf(',') > -1){
								var childIdActivitiesArray = childIdActivities.toString().split(',');
								for(var i = 0; i < childIdActivitiesArray.length; i++){
									console.log("5");
									var obj = {
											appName : "Outlet",
											appFlow : currentId.replace('Read','').replace('store',''),
											appSubFlow : childId.replace('Read','').replace('store',''),
											appDocument : childId.replace('Read','').replace('store',''),
											activityRead : $("#"+childId).prop('checked'),
											activityWrite : $("#"+childIdWrite).prop('checked'),
											notification : $("#"+childIdCCTo).prop('checked'),
											appDocumentActivity : childIdActivitiesArray[i]
//											storeLocation : location
									};
									finalObj.accessControlActivity.push(obj);
								}
							}else{
								childIdActivities = childIdActivities.toString().replace('[','').replace(']','');
								console.log("6");
								var obj = {
										appName : "Outlet",
										appFlow : currentId.replace('Read','').replace('store',''),
										appSubFlow : childId.replace('Read','').replace('store',''),
										appDocument : childId.replace('Read','').replace('store',''),
										activityRead : $("#"+childId).prop('checked'),
										activityWrite : $("#"+childIdWrite).prop('checked'),
										notification : $("#"+childIdCCTo).prop('checked'),

										appDocumentActivity : childIdActivities
//										storeLocation : location
								};
								finalObj.accessControlActivity.push(obj);
							}
						}
					});
				}
				else{
					debugger
					var currentIdWrite = currentId.replace('Read','Write');
					var currentIdCCTo = currentId.replace('Read','CCTo');
					if($("#"+currentId).prop('checked') == true || $("#"+currentIdWrite).prop('checked') == true || $("#"+currentIdCCTo).prop('checked') == true){
						console.log("7");
						var obj = {
								appName : "Outlet",
								appFlow : currentId.replace('Read','').replace('store',''),
								appDocument : currentId.replace('Read','').replace('store',''),
								read : $("#"+currentId).prop('checked'),
								write : $("#"+currentIdWrite).prop('checked'),
								notification : $("#"+currentIdCCTo).prop('checked'),
//								location : location
							};
						finalObj.accessControl.push(obj);
					}
				}
				
				// if there is any activities, with the main flow like Billing, Store Management etc
				currenActivity = currentId.replace('Read','');
				var currentIdActivities = $('select[name="' + currenActivity + '"]').val();
				if(currentIdActivities != null && currentIdActivities != undefined){
					var currentIdWrite = currentId.replace('Read','Write');
					var currentIdCCTo = currentId.replace('Read','CCTo');
					if(currentIdActivities.toString().indexOf(',') > -1){
						var currentIdActivitiesArray = currentIdActivities.toString().split(',');
						for(var i = 0; i < currentIdActivitiesArray.length; i++){
							console.log("8");
							var obj = {
									appName : "Outlet",
									appFlow : currentId.replace('Read','').replace('store',''),
									appDocument : currentId.replace('Read','').replace('store',''),
									activityRead : $("#"+currentId).prop('checked'),
									activityWrite : $("#"+currentIdWrite).prop('checked'),
									notification : $("#"+currentIdCCTo).prop('checked'),

									appDocumentActivity : currentIdActivitiesArray[i]
//									storeLocation : location
							};
							finalObj.accessControlActivity.push(obj);
						}
					}else{
						currentIdActivities = currentIdActivities.toString().replace('[','').replace(']','');
						console.log("9");var obj = {
								
								appName : "Outlet",
								appFlow : currentId.replace('Read','').replace('store',''),
								appDocument : currentId.replace('Read','').replace('store',''),
								activityRead : $("#"+currentId).prop('checked'),
								activityWrite : $("#"+currentIdWrite).prop('checked'),
								notification : $("#"+currentIdCCTo).prop('checked'),
								appDocumentActivity : currentIdActivities
//								storeLocation : location
						};
						finalObj.accessControlActivity.push(obj);
					}
				}
			});
			//---------- FOR WAREHOUSE PERMISSIONS ---------
			$("input:checkbox[name='warehouseAppRead']").each(function(){
				debugger;
				var currentId = $(this).attr('id');
				var location = '';
				if($("#warehouseLocation").val() != null)
					location = $("#warehouseLocation").val().toString();
				if($("input:checkbox[name='"+currentId+"']").length){
					$("input:checkbox[name='"+currentId+"']").each(function(){
						var childId = $(this).attr('id');
							var childIdWrite = childId.replace('Read','Write');
							var childIdCCTo = childId.replace('Read','CCTo');
							if($("#"+childId).prop('checked') == true || $("#"+childIdWrite).prop('checked') == true || $("#"+childIdCCTo).prop('checked') == true){
								var obj = {
										appName : "Warehouse",
										appFlow : currentId.replace('Read','').replace('warehouseApp',''),
										appSubflow : childId.replace('Read','').replace('warehouseApp',''),
										appDocument : childId.replace('Read','').replace('warehouseApp',''),
										
										read : $("#"+childId).prop('checked'),
										write : $("#"+childIdWrite).prop('checked'),
										notification : $("#"+childIdCCTo).prop('checked'),
//										location : location
									};
								finalObj.accessControl.push(obj);
								
								// if there is any activities, with the sub main flow like Stock Managemnt, Goods Transfer, Goods Procurement etc
								childActivity = childId.replace('Read','');
								var childIdActivities = $('select[name="' + childActivity + '"]').val();
								if(childIdActivities != null && childIdActivities != undefined){
									var childIdWrite = childId.replace('Read','Write');
									var childIdCCTo= childId.replace('Read','CCTo');
									if(childIdActivities.toString().indexOf(',') > -1){
										var childIdActivitiesArray = childIdActivities.toString().split(',');
										for(var i = 0; i < childIdActivitiesArray.length; i++){
											var obj = {
													appName : "Warehouse",
													appFlow : currentId.replace('Read','').replace('warehouseApp',''),
													appSubFlow : childId.replace('Read','').replace('warehouseApp',''),
													appDocument : childId.replace('Read','').replace('warehouseApp',''),
													activityRead : $("#"+childId).prop('checked'),
													activityWrite : $("#"+childIdWrite).prop('checked'),
													notification : $("#"+childIdCCTo).prop('checked'),
													appDocumentActivity : childIdActivitiesArray[i]
//													storeLocation : location
											};
											finalObj.accessControlActivity.push(obj);
										}
									}else{
										childIdActivities = childIdActivities.toString().replace('[','').replace(']','');
										var obj = {
												appName : "Warehouse",
												appFlow : currentId.replace('Read','').replace('warehouseApp',''),
												appSubFlow : childId.replace('Read','').replace('warehouseApp',''),
												appDocument : childId.replace('Read','').replace('warehouseApp',''),
												activityRead : $("#"+childId).prop('checked'),
												activityWrite : $("#"+childIdWrite).prop('checked'),
												notification : $("#"+childIdCCTo).prop('checked'),
												appDocumentActivity : childIdActivities
//												storeLocation : location
										};
										finalObj.accessControlActivity.push(obj);
									}
								}
							}
					});
				}
				else{
					
					
					//var currentIdActivities = currentIdActivities.toString().replace('[','').replace(']','');

					var currentIdWrite = currentId.replace('Read','Write');
					var currentIdCCTo = currentId.replace('Read','CCTo');
					
					if($("#"+currentId).prop('checked') == true || $("#"+currentIdWrite).prop('checked') == true || $("#"+currentIdCCTo).prop('checked') == true){
						var obj = {
								appName : "Warehouse",
								appFlow : currentId.replace('Read','').replace('warehouseApp',''),
								appDocument : currentId.replace('Read','').replace('warehouseApp',''),
								read : $("#"+currentId).prop('checked'),
								write : $("#"+currentIdWrite).prop('checked'),
								notification : $("#"+currentIdCCTo).prop('checked'),
//								appDocumentActivity :  currentIdActivities
//								location : location
							};
						finalObj.accessControl.push(obj);
					}
					var currenActivity = currentId.replace('Read','');
					var currentIdActivities = $('select[name="' + currenActivity + '"]').val();
					
					if(currentIdActivities != null && currentIdActivities != undefined){
						var currentIdWrite = currentId.replace('Read','Write');
						var currentIdCCTo= currentId.replace('Read','CCTo');
						if(currentIdActivities.toString().indexOf(',') > -1){
							var currentIdActivitiesArray = currentIdActivities.toString().split(',');
							for(var i = 0; i < currentIdActivitiesArray.length; i++){
								var obj = {
										appName : "Warehouse",
										appFlow : currentId.replace('Read','').replace('warehouseApp',''),
										appSubFlow : currentId.replace('Read','').replace('warehouseApp',''),
										appDocument : currentId.replace('Read','').replace('warehouseApp',''),
										activityRead : $("#"+currentId).prop('checked'),
										activityWrite : $("#"+currentIdWrite).prop('checked'),
										notification : $("#"+currentIdCCTo).prop('checked'),
										appDocumentActivity : currentIdActivitiesArray[i]
//										storeLocation : location
								};
								finalObj.accessControlActivity.push(obj);
							}
						}
					}
					
					
				/*	else				
					if($("#"+currentId).prop('checked') == true || $("#"+currentIdWrite).prop('checked') == true){
						var obj = {
								appName : "Warehouse",
								appFlow : currentId.replace('Read','').replace('warehouseApp',''),
								appDocument : currentId.replace('Read','').replace('warehouseApp',''),
								read : $("#"+currentId).prop('checked'),
								write : $("#"+currentIdWrite).prop('checked'),
								notification : $("#"+currentIdCCTo).prop('checked'),
								appDocumentActivity :  currentIdActivities
//								location : location
							};
						finalObj.accessControl.push(obj);
					}
					*/
					
					
					
					
				}
			});
			
			/*//---------- FOR WAREHOUSE PERMISSIONS ---------
			$("input:checkbox[name='warehouseAppRead']").each(function(){
				var currentId = $(this).attr('id');
				var location = '';
				if($("#warehouseLocation").val() != null)
					location = $("#warehouseLocation").val().toString();
				if($("input:checkbox[name='"+currentId+"']").length){
					$("input:checkbox[name='"+currentId+"']").each(function(){
						var childId = $(this).attr('id');
							var childIdWrite = childId.replace('Read','Write');
							var childIdCCTo = childId.replace('Read','CCTo');
							if($("#"+childId).prop('checked') == true || $("#"+childIdWrite).prop('checked') == true){
								var obj = {
										appName : "Warehouse",
										appFlow : currentId.replace('Read','').replace('warehouseApp',''),
										appSubflow : childId.replace('Read','').replace('warehouseApp',''),
										appDocument : childId.replace('Read','').replace('warehouseApp',''),
										
										read : $("#"+childId).prop('checked'),
										write : $("#"+childIdWrite).prop('checked'),
										notification : $("#"+childIdCCTo).prop('checked'),
//										location : location
									};
								finalObj.accessControl.push(obj);
								
								// if there is any activities, with the sub main flow like Stock Managemnt, Goods Transfer, Goods Procurement etc
								childActivity = childId.replace('Read','');
								var childIdActivities = $('select[name="' + childActivity + '"]').val();
								if(childIdActivities != null && childIdActivities != undefined){
									var childIdWrite = childId.replace('Read','Write');
									var childIdCCTo= childId.replace('Read','CCTo');
									if(childIdActivities.toString().indexOf(',') > -1){
										var childIdActivitiesArray = childIdActivities.toString().split(',');
										for(var i = 0; i < childIdActivitiesArray.length; i++){
											var obj = {
													appName : "Warehouse",
													appFlow : currentId.replace('Read','').replace('warehouseApp',''),
													appSubFlow : childId.replace('Read','').replace('warehouseApp',''),
													appDocument : childId.replace('Read','').replace('warehouseApp',''),
													activityRead : $("#"+childId).prop('checked'),
													activityWrite : $("#"+childIdWrite).prop('checked'),
													notification : $("#"+childIdCCTo).prop('checked'),
													appDocumentActivity : childIdActivitiesArray[i]
//													storeLocation : location
											};
											finalObj.accessControlActivity.push(obj);
										}
									}else{
										childIdActivities = childIdActivities.toString().replace('[','').replace(']','');
										var obj = {
												appName : "Warehouse",
												appFlow : currentId.replace('Read','').replace('warehouseApp',''),
												appSubFlow : childId.replace('Read','').replace('warehouseApp',''),
												appDocument : childId.replace('Read','').replace('warehouseApp',''),
												activityRead : $("#"+childId).prop('checked'),
												activityWrite : $("#"+childIdWrite).prop('checked'),
												notification : $("#"+childIdCCTo).prop('checked'),
												appDocumentActivity : childIdActivities
//												storeLocation : location
										};
										finalObj.accessControlActivity.push(obj);
									}
								}
							}
					});
				}
				else{
					
					var currentIdWrite = currentId.replace('Read','Write');
					var childIdCCTo = currentId.replace('Read','CCTo');
					if($("#"+currentId).prop('checked') == true || $("#"+currentIdWrite).prop('checked') == true){
						var obj = {
								appName : "Warehouse",
								appFlow : currentId.replace('Read','').replace('warehouseApp',''),
								appDocument : currentId.replace('Read','').replace('warehouseApp',''),
								read : $("#"+currentId).prop('checked'),
								write : $("#"+currentIdWrite).prop('checked'),
								notification : $("#"+childIdCCTo).prop('checked'),
//								location : location
							};
						finalObj.accessControl.push(obj);
					}
				}
			});
			*/
			
			 var formData = JSON.stringify(finalObj);
    		 console.log(formData);
			
			var contextPath = $("#contextPath").val();
			if (operation == "new")
				URL = contextPath + "/userAccessControl/createRole.do";
			else{
				URL = contextPath + "/userAccessControl/updateRole.do";
				var roleStatus = $("#roleStatus").val();
				finalObj.roleStatus = roleStatus;
			}
//			console.log(JSON.stringify(finalObj));
//			return;
			var formData = JSON.stringify(finalObj);
			$.ajax({
				type : "POST",
				url : URL,
				contentType : "application/json",
				data : formData,
				beforeSend: function(xhr){                    
		  				$("#loading").css("display","block");
		  				$("#mainDiv").addClass("disabled");
		        },
				success : function(result) {
					  $("#right-side").html(result);
					  $("#searchRoles").val(searchName);
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