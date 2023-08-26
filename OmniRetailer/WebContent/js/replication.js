/**
 * 
 */
function viewReplication(id,index){
	debugger;
try{
		
		var online = window.navigator.onLine;
	  	if(!online){
	  	alert("Check your internet connection,Please try agian after some time.");
	  	return;
	  	}
	 var contextPath = $('#contextPath').val();
	 var URL = contextPath + "/dataManagement/viewReplication.do";
	 $.ajax({
		type : "GET",
		url : URL,
		data : {
			id :id,
			index : index
		},
		beforeSend: function(xhr){                    
	   		$("#loading").css("display","block");
	   		$("#mainDiv").addClass("disabled");
	   	},
		success : function(result){
			if(id != undefined)
					activeMenu(id);
			openMenu("replicationmain", "ulreplicationmain",0);
			openMenu("liDataManagement", "ulDataManagement",1);
			$('#right-side').html(result);
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


function createManualReplication(){
	debugger;
	try{
			var online = window.navigator.onLine;
		  	if(!online){
		  	alert("Check your internet connection,Please try agian after some time.");
		  	return;
		  	}
		  	
		 var contextPath = $('#contextPath').val();
		 var URL = contextPath + "/dataManagement/createManualReplication.do";
		 $.ajax({
			type : "GET",
			url : URL,
			data : {
				
			},
			beforeSend: function(xhr){                    
		   		$("#loading").css("display","block");
		   		$("#mainDiv").addClass("disabled");
		   	},
			success : function(result){
				
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
