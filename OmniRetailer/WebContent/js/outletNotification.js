function toggleUsersList(ele){
	$("#Error").html("");
	if($(ele).prop("checked") == true){
		if ($('#usersList option').length == 0)
			alert("Please select Location to see Users");
		$("#usersList").removeAttr("disabled");
	}else{
		$("#usersList").attr("disabled","disabled");
	}
}

function toggleRolesList(ele){
	$("#Error").html("");
	if($(ele).prop("checked") == true){
		$("#rolesList").removeAttr("disabled");
	}else{
		$("#rolesList").attr("disabled","disabled");
	}
}

function addNameToTextBox(id){
	if($("#"+id+"Btn")[0].files[0] != undefined)
		$("#"+id+"File").val($("#"+id+"Btn")[0].files[0]['name']);
	else
		$("#"+id+"File").val("");
}

function getUsersList(ele){
	 //purpose:for checking internet conection
	var online = window.navigator.onLine;
  	if(!online)
  	{
  	alert("check your internet connection,please try agian after some time");
  	return;
  	}
	$("#Error").html("");
	var location = $(ele).val().toString();
	 var contextPath = $("#contextPath").val();
	 URL = contextPath + "/inventorymanager/getUsersList.do";
	 $.ajax({
			type: "GET",
			url : URL,
			data : {
				locations : location
			},
			beforeSend: function(xhr){                    
  	   			$("#loading").css("display","block");
  	   			$("#mainDiv").addClass("disabled");
  	   		  },
			success : function(result) {
				appendUsers(result);
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

function appendUsers(usersList){
	 $("#usersList").html('');
	 var op = '';
	 if(usersList.length == 0){
		 alert("There are no users in this Location");
		 return;
	 }
	 for(var i=0;i<usersList.length;i++){
		 op += '<option value='+usersList[i]+'>'+usersList[i]+'</option>';
	 }
	 $("#usersList").html(op);
}

$("#notificationType").change(function(){
	$("#notificationTypeError").html("");
	//$("#Error").html("");
});

$("#notificationMessage").keydown(function(){
	$("#notificationMessageError").html("");
	$("#Error").html("");
});

$("#notificationSubject").keydown(function(){
	$("#notificationSubjectError").html("");
	$("#Error").html("");
});


function validateOutletNotification(operation){
	 //purpose:for checking internet conection
	var online = window.navigator.onLine;
  	if(!online)
  	{
  	alert("check your internet connection,please try agian after some time");
  	return;
  	}
	$("#Error").html("");
	var finalObj = {}, messageLocations = [],messageRoles = [];
	if($("#notificationType").val() == "Notification Type"){
		$("#notificationTypeError").html("Please Select Notification Type");
		return;
	}
	
	if(parseInt($("#notificationSubject").val().length)>50){
		 $("#notificationSubject").focus();
		 $("#notificationSubjectError").html("Subject can't exceeds 50 Characters");
			return;
	}else{
  	 $("#notificationSubjectError").html(" ");
  }
	
	finalObj.messageType = $("#notificationType").val();
	if($("#notificationSubject").val().trim() == ""){
		$("#notificationSubjectError").html("Please Enter Notification Subject");
		return;
	}
	finalObj.messageSubject = $("#notificationSubject").val();
	if($("#notificationMessage").val().trim() == ""){
		$("#notificationMessageError").html("Please Enter Notification Message");
		return;
	}
	finalObj.messageBody = $("#notificationMessage").val();
	if($("#workLocation").val() == null){
		alert("Please Select Location");
		return;
	}
	if($("#rolesList").val() == null){
		alert("Please Select Role");
		return;
	}
	
	
	
	if(parseInt($("#notificationMessage").val().length)>200){
		 $("#notificationMessage").focus();
		 $("#notificationMessageError").html("Notification Message can't exceeds 200 Characters");
			return;
	}else{
  	 $("#notificationMessageError").html(" ");
  }
	
	var obj = null,i=0;
	if($("#workLocation").val() != null){
		var locations = $("#workLocation").val().toString().split(',');
		for(i=0; i<locations.length; i++){
			obj = {"location":locations[i]};
			messageLocations.push(obj);
		}
	}
	if($("#rolesList").val() != null){
		var roles = $("#rolesList").val().toString().split(',');
		for(i=0; i<roles.length; i++){
			obj = {"role":roles[i],"receiverType":"role"};
			messageRoles.push(obj);
		}
	}
	if($("#usersList").val() != null){
		var users = $("#usersList").val().toString().split(',');
		for(i=0; i<users.length; i++){
			obj = {"role":users[i],"receiverType":"user"};
			messageRoles.push(obj);
		}
	}
	finalObj.messageLocations = messageLocations;
	finalObj.messageRoles = messageRoles;
	var formData = JSON.stringify(finalObj);
//	console.log(formData);
	var contextPath = $("#contextPath").val();
	   if(operation=="new"){
		   URL = contextPath + "/inventorymanager/createOutletNotification.do";
	   }
	   else if(operation=="edit"){
		   URL = contextPath + "/inventorymanager/updateOutletNotification.do";
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
	   			messageStatus= JSON.stringify(result);
				var parsed_json = JSON.parse(messageStatus);
				var code = parsed_json.code;
				//alert(parsed_json.code)
				if(code != 0)
					$("#Error").html(parsed_json.error);
				else
					$("#Success").html(parsed_json.success);
	   			
			//	$("#right-side").html(result);
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



function viewEditNotification(messageId,operation){
	 //purpose:for checking internet conection
	var online = window.navigator.onLine;
  	if(!online)
  	{
  	alert("check your internet connection,please try agian after some time");
  	return;
  	}
	var contextPath = $("#contextPath").val();
   URL = contextPath + "/inventorymanager/editNotification.do";
		$.ajax({
			type: "GET",
			url : URL,
			data : {
				messageId : messageId,
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
			error : function() {
				 alert("something went wrong");
				$("#loading").css("display","none");
				$("#mainDiv").removeClass('disabled');
			}
		});
	}