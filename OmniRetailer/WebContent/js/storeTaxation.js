$('#searchStoreTaxation').on('input',function(e){
	if($(this).val().trim()==""){
		viewStoreTaxation('taxation','0','');
	}
});

function searchWHTaxationMaster(name,searchCategory,index){
	 //purpose:for checking internet conection
	var online = window.navigator.onLine;
  	if(!online)
  	{
  	alert("check your internet connection,please try agian after some time");
  	return;
  	}
	var location = $("#location").val();
	 var contextPath = $("#contextPath").val();
	  name=""
   		 if($("#searchWHTaxation").length>0)
   			name = $("#searchWHTaxation").val().trim();
	//added by manasa
		var maxRecords = 10;
  	  if($("#maxRecords").length>0)
  		  maxRecords = $("#maxRecords").val();
	  
  	//written by manasa
		 var billedLocationsList = [];
		 var length = $('#toLocation').children('option').length;
		 console.log(length)
	      	$('#toLocation option').each(function() { 
	      		billedLocationsList.push( $(this).attr('value'));
	      	   
	      	});
		
//		 console.log(billedLocationsList)
		// finalobj.billedLocations = billedLocationsList;
	
		//written by manasa
			 var  locationList="";
		      	for(i=1;i<billedLocationsList.length;i++)
		      		{
		      		locationList =locationList+ billedLocationsList[i]+',';
		      		}
		      //	locationList = locationList.slice(0,-1);//remove last comma
		    
		      	console.log(locationList)
  	  
	 URL = contextPath + "/inventorymanager/searchWHTaxationMaster.do";
	 $.ajax({
			type: "GET",
			url : URL,
			data : {
				searchName : name,
				index : index,
				location : location,
				maxRecords : maxRecords,
				locationList : locationList
			},
			beforeSend: function(xhr){                    
	   	   		$("#loading").css("display","block");
	   	   		$("#mainDiv").addClass("disabled");
	   	   	},
			success : function(result) {
				$('#right-side').html(result);
				/*if($("#searchProduct").val != "")
					$("#pagination").css("display","none");
				else
					$("#pagination").css("display","block");*/
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


function searchStoreTaxationMaster(name,searchCategory,index){
	 //purpose:for checking internet conection
	var online = window.navigator.onLine;
 	if(!online)
 	{
 	alert("check your internet connection,please try agian after some time");
 	return;
 	}
	var location = $("#location").val();
	 var contextPath = $("#contextPath").val();
	  name=""
  		 if($("#searchStoreTaxation").length>0)
  			name = $("#searchStoreTaxation").val().trim();
	//added by manasa
		var maxRecords = 10;
 	  if($("#maxRecords").length>0)
 		  maxRecords = $("#maxRecords").val();
	  
 	//written by manasa
		 var billedLocationsList = [];
		 var length = $('#toLocation').children('option').length;
		 console.log(length)
	      	$('#toLocation option').each(function() { 
	      		billedLocationsList.push( $(this).attr('value'));
	      	   
	      	});
		
//		 console.log(billedLocationsList)
		// finalobj.billedLocations = billedLocationsList;
	
		//written by manasa
			 var  locationList="";
		      	for(i=1;i<billedLocationsList.length;i++)
		      		{
		      		locationList =locationList+ billedLocationsList[i]+',';
		      		}
		      //	locationList = locationList.slice(0,-1);//remove last comma
		    
		      	console.log(locationList)
 	  
	 URL = contextPath + "/inventorymanager/searchStoreTaxationMaster.do";
	 $.ajax({
			type: "GET",
			url : URL,
			data : {
				searchName : name,
				index : index,
				location : location,
				maxRecords : maxRecords,
				locationList : locationList
			},
			beforeSend: function(xhr){                    
	   	   		$("#loading").css("display","block");
	   	   		$("#mainDiv").addClass("disabled");
	   	   	},
			success : function(result) {
				$('#right-side').html(result);
				/*if($("#searchProduct").val != "")
					$("#pagination").css("display","none");
				else
					$("#pagination").css("display","block");*/
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