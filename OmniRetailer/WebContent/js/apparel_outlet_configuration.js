function viewOutletConfigurations(id){
	 var contextPath = $("#contextPath").val();
	 URL = contextPath + "/outletconfigurations/viewApparelConfigurations.do";
	 $.ajax({
			type: "GET",
			url : URL,
			data : {
			},
			beforeSend: function(xhr){                    
	   			$("#loading").css("display","block");
	   			$("#mainDiv").addClass("disabled");
	   		  },
			success : function(result) {
            $("#right-side").html(result);
            activeMenu(id);
            openMenu("storedetails", "ulstoredetails",0);
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
function newApparelConfiguration(){
	var contextPath = $("#contextPath").val();
	 URL = contextPath + "/outletconfigurations/newApparelConfigurations.do";
	 $.ajax({
			type: "GET",
			url : URL,
			data : {
			},
			beforeSend: function(xhr){                    
	   			$("#loading").css("display","block");
	   			$("#mainDiv").addClass("disabled");
	   		  },
			success : function(result) {
           $("#right-side").html(result);
           //activeMenu(id);
           openMenu("storedetails", "ulstoredetails",0);
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