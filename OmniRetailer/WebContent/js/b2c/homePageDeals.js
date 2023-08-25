
$(document).ready(function(){
	
});


$('#searchHotDeals').on('input',function(e){
	if($(this).val().trim()==""){
		viewHomePageDeals('homePageDeals','0');
	}
});
function searchHotDeals(name,searchCategory,index){
	 var contextPath = $("#contextPath").val();
	 URL = contextPath + "/b2c/searchHotDeals.do";
	 var maxRecords = $("#maxRecords").val();
	 
	 //modified by manasa
	 var startdate = $("#dealfrom").val();
	 var enddate = $("#dealto").val();
	 
	/* var startdate = $("#from").val();
	 var enddate = $("#to").val();*/
	 $.ajax({
			type: "GET",
			url : URL,
			data : {
				searchName : name,
				index : index,
				maxRecords:maxRecords,
				startDate:startdate,
				endDate:enddate,
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

function searchOffersBasedOnCategory(id,ref){
	 var categoryName = $("#"+id).val();
	 if(categoryName != "-- Select --" || categoryName !=""){
	 if(ref == 'add'){
		var a = categoryName.split(' ');
		categoryName=a[0];
	 }
	 var groupid = $("#offerGroups").val();
		 var contextPath = $("#contextPath").val();
		 URL = contextPath + "/b2c/searchOffersBasedOnCategory.do";
		 $.ajax({
			 type: "GET",
			 url : URL,
			 data : {
				 categoryName : $("#offerProductCategory").val(),
				 ref : ref,
				 groupid:groupid,
				 offerId:categoryName,
			 },
			 beforeSend: function(xhr){                    
				 $("#loading").css("display","block");
				 $("#mainDiv").addClass("disabled");
			 },
			 success : function(result) {
				 if(ref == 'dontAdd')
					 appendOffersBasedOnCategoryBasis(result);
				 else
					 appendOffersToTable(result);
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

/*function viewEditHotDeal(ref,type){
	
		 var contextPath = $("#contextPath").val();
		 URL = contextPath + "/inventorymanager/searchOffersDealsBasedOnGroup.do";
		 $.ajax({
			 type: "GET",
			 url : URL,
			 data : {
				 hotdealref : ref
			 },
			 beforeSend: function(xhr){                    
				 $("#loading").css("display","block");
				 $("#mainDiv").addClass("disabled");
			 },
			 success : function(result) {
					 appendOffersToTable(result);
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
}*/
function appendOffersBasedOnCategoryBasis(offersList){
	// $("."+searchCategory).html('');
	 if(offersList.length == 0){
		 $("#Error").html("No Offer(s) available for the given Category");
		 $("#offerProductCategory").val("");
		 $("#offerGroups").val("");
		// $("#offerIds").html('');
		 focusDiv('Error');
		 return;
	 }
	 var op = '';
	 for(var i=0;i<offersList.length;i++){
		 if (i == 0) 
			 op += '<option id="'+offersList[i].offerID+'"  class="selected" onclick="" ><a>'+offersList[i].offerID+'   (   '+offersList[i].offerDescription+'   )</a></option>';
		 else
		     op += '<option id="'+offersList[i].offerID+'" onclick="" ><a>'+offersList[i].offerID+'   (   '+offersList[i].offerDescription+'   )</a></option>';
	 }
	 $("#Error").html('');
	 $("#offerIds").html(op);
	// $("#offerIds").show();
}

function appendOffersToTable(OffersList){
	debugger;
	 var contextPath = $("#contextPath").val();

		var len = parseInt($("#offersList tr").length);
		if (len != 1)
			len = parseInt($("#offersList tr:last").attr("id").replace('dynamicdiv', '')) + 1;
		var slNo = 1; 
		 $('.slno').each(function(){
			$(this).text(slNo);
			slNo = parseInt(slNo) + 1;
		});
		 if(!jQuery.isEmptyObject(OffersList)){
		 var row = "<tr id='dynamicdiv"+len+"' style='margin-top:5px;'><td class='slno'"+len+"'>"+slNo+
			"<td id='offerId"+len+"'>"+OffersList[0].offerID+"</td>" +"<td id='offerName"+len+"'>"+OffersList[0].offerName+"</td>" +
			 "<input type='hidden' id='offerPicture"+len+"' value='"+OffersList[0].offerPicture+"'/>" +
			"<td id='startDate"+len+"'>"+OffersList[0].offerStartDate+"</td>" +"<td id='endDate"+len+"'>"+OffersList[0].offerEndDate+"</td>" +
			"<td id='group"+len+"'>"+"-"+"</td>" +"<td id='category"+len+"'>"+OffersList[0].productCategory+"</td>" +"<td id='offerStatus"+len+"'>"+OffersList[0].offerStatus+"</td>" +
			"<td id='Del"+ len +"' ><img id='Img"+ len +"' src='"+contextPath+"/images/itemdelete.png' style='width:25px;cursor:pointer;' onclick='deleteItem(this);' title='Delete "+OffersList[0].offerID+"'/>" +
			"</td></tr>";
		 $("#offersList tbody").append(row);
		 }
}


//deals

function searchDealsBasedOnCategory(id,ref){
	 var categoryName = $("#"+id).val();
	 if(categoryName != "-- Select --" || categoryName !=""){
		 var groupid = $("#dealGroup").val();
	 if(ref == 'add'){
		var a = categoryName.split(' ');
		categoryName=a[0];
	 }
		 var contextPath = $("#contextPath").val();
		 URL = contextPath + "/b2c/searchDealsBasedOnCategory.do";
		 $.ajax({
			 type: "GET",
			 url : URL,
			 data : {
				 categoryName : categoryName,
				 ref : ref,
				 groupid:groupid,
			 },
			 beforeSend: function(xhr){                    
				 $("#loading").css("display","block");
				 $("#mainDiv").addClass("disabled");
			 },
			 success : function(result) {
				 if(ref == 'dontAdd')
					 appendDealsBasedOnCategoryBasis(result);
				 else
					 appendDealsToTable(result);
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

function appendDealsBasedOnCategoryBasis(dealsList){
	// $("."+searchCategory).html('');
	 if(dealsList.length == 0){
		 $("#Error").html("No Deal(s) available for the given Category");
 $("#dealProductCategory").val("");
		 
		 $("#dealGroup").val("");
		// $("#dealIds").html('');
		 focusDiv('Error');
		 return;
	 }
	 var op = '';
	 for(var i=0;i<dealsList.length;i++){
		 if (i == 0) 
			 op += '<option id="'+dealsList[i].dealID+'"  class="selected" onclick="" ><a>'+dealsList[i].dealID+'   (   '+dealsList[i].dealDescription+'   )</a></option>';
		 else
		     op += '<option id="'+dealsList[i].dealID+'" onclick="" ><a>'+dealsList[i].dealID+'   (   '+dealsList[i].dealDescription+'   )</a></option>';
	 }
	 $("#Error").html('');
	 $("#dealIds").html(op);
	// $("#offerIds").show();
}

function appendDealsToTable(DealsList){
	debugger;
	 var contextPath = $("#contextPath").val();
//	 console.log(jQuery.isEmptyObject(DealsList));

		var len = parseInt($("#dealsList tr").length);
		if (len != 1)
			len = parseInt($("#dealsList tr:last").attr("id").replace('dynamicdiv', '')) + 1;
		var slNo = 1; 
		 $('.slno').each(function(){
			$(this).text(slNo);
			slNo = parseInt(slNo) + 1;
		});
		 if(!jQuery.isEmptyObject(DealsList)){
		 var row = "<tr id='dynamicdiv"+len+"' style='margin-top:5px;'><td class='slno'"+len+"'>"+slNo+
			"<td id='dealId"+len+"'>"+DealsList[0].dealID+"</td>" +"<td id='dealName"+len+"'>"+DealsList[0].dealName+"</td>" +
			 "<input type='hidden' id='dealPicture"+len+"' value='"+DealsList[0].dealPicture+"'/>" +
			"<td id='dealStartDate"+len+"'>"+DealsList[0].dealStartDate+"</td>" +"<td id='dealEndDate"+len+"'>"+DealsList[0].dealEndDate+"</td>" +
			"<td id='dealGroup"+len+"'>"+DealsList[0].dealGroupId+"</td>" +"<td id='dealCategory"+len+"'>"+DealsList[0].dealProductCategory+"</td>" +"<td id='dealStatus"+len+"'>"+DealsList[0].dealStatus+"</td>" +
			"<td id='Del"+ len +"' ><img id='Img"+ len +"' src='"+contextPath+"/images/itemdelete.png' style='width:25px;cursor:pointer;' onclick='deleteItem(this);' title='Delete "+DealsList[0].dealID+"'/>" +
			"</td></tr>";
		 $("#dealsList tbody").append(row);
		 }
}


/*if (album_text.length === 0) {
    $('#error_message').html("Error");
}*/

function deleteItem(element){
	var id = $(element).attr("id").replace('Img','');
	$('#dynamicdiv'+id).remove();
	var slNo = 1; 
	 $('.slno').each(function(){
		$(this).text(slNo);
		slNo = parseInt(slNo) + 1;
	});
}

/*function searchDealsBasedOnCategory(id,ref){
	 var categoryName = $("#"+id).val();
	 if(categoryName != "-- Select --" || categoryName !=""){
		 var contextPath = $("#contextPath").val();
		 URL = contextPath + "/inventorymanager/searchDealsBasedOnCategory.do";
		 $.ajax({
			 type: "GET",
			 url : URL,
			 data : {
				 categoryName : categoryName,
				 ref : ref
			 },
			 beforeSend: function(xhr){                    
				 $("#loading").css("display","block");
				 $("#mainDiv").addClass("disabled");
			 },
			 success : function(result) {
			//	 appendDealsBasedOnCategoryBasis(result);
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
}*/

/*$("#locationId").change(function(){
	if($("#locationId").val().trim() == ""){
		$("#locationIdError").html("Select any Location");
		return;
	} else{
		$("#locationIdError").html("");
	}

});

$("#shipmentMode").change(function(){
	if($("#shipmentMode").val().trim() == ""){
		$("#shipmentModeError").html("Select Shipment Mode");
		return;
	} else{
		$("#shipmentModeError").html("");
	}

});

$("#shipmentType").change(function(){
	if($("#shipmentType").val().trim() == ""){
		$("#shipmentTypeError").html("Select Shipment Type");
		return;
	} else{
		$("#shipmentTypeError").html("");
	}

});

$("#shipmentCost").keydown(function(){
	   $("#shipmentCostError").html("");
	   $(".Error").html("");
}); */









function validateHotDealForm(id,operation){
	debugger;
	var hotdealRef =$("#hotdealRef").val();
	var finalObj = {};
	var hotDealsList = [];
	//offer
	if($("#title").val().trim() == ""){
		$("#title").focus();
		$("#titleError").html("Enter Hot Deal  Name");
		return;
	}
	if($("#preparedBy").val().trim() == ""){
		$("#preparedBy").focus();
		$("#preparedByError").html("Prepared By Is Required");
		return;
	}
	var re = /^[0-9/]+$/;
	if($(".startDateHotdeal").val().trim() == ""){
		$(".startDateHotdeal").focus();
		$("#dealStartDateError").html("Enter a Date");
		return;
	}
	if(!re.test($(".startDateHotdeal").val())){
		$(".startDateHotdeal").focus();
		$("#dealStartDateError").html("Invalid Date");
		return;
	}
	if($(".endDateHotdeal").val().trim() != ""){
	 if(!re.test($(".endDateHotdeal").val())){
		 $(".endDateHotdeal").focus();
			$("#dealEndDateError").html("Invalid Date");
			return;
	 }
	 var noOfDays = daydiff(parseDate($('.startDateHotdeal').val()), parseDate($('.endDateHotdeal').val()));
	 if(noOfDays < 0){
		 $("#dealEndDateError").html("End Date can't be less than Start Date");
		 return;
	 }
 }
	var Offerlen = $("#offersList tr").length-1;
	var len = $("#dealsList tr").length-1;
	if(Offerlen == 0 && len == 0){
		alert("Add Atleast One Offer/Deal");
		return;
		}
	
	for(var i=1;i<=Offerlen;i++){
		var idAttr = $("#offersList tr:eq("+i+") td:last").attr("id").replace('Del','');
		var offerObj = {campaignId:$("#offerId"+idAttr).text(),campaignName:$("#offerName"+idAttr).text(),startDateStr:$("#startDate"+idAttr).text(),endDateStr:$("#endDate"+idAttr).text(),productGroup:$("#group"+idAttr).text(),productCategory:$("#category"+idAttr).text(),statusStr:$("#offerStatus"+idAttr).text(),campaignImage:$("#offerPicture"+idAttr).val(),type:"offer"};
		//finalObj.offersList.push(obj);
		hotDealsList.push(offerObj);
	}
	//deal
	
		//var len = $("#dealsList tr").length-1;
			/*if(len == 0){
			alert("Add Atleast One Deal");
			return;
			}*/
		
		for(var i=1;i<=len;i++){
			var idAttrD = $("#dealsList tr:eq("+i+") td:last").attr("id").replace('Del','');
			var dealObj = {campaignId:$("#dealId"+idAttrD).text(),campaignName:$("#dealName"+idAttrD).text(),startDateStr:$("#dealStartDate"+idAttrD).text(),endDateStr:$("#dealEndDate"+idAttrD).text(),productGroup:$("#dealGroup"+idAttrD).text(),productCategory:$("#dealCategory"+idAttrD).text(),statusStr:$("#dealStatus"+idAttrD).text(),campaignImage:$("#dealPicture"+idAttrD).val(),type:"deal"};
			//finalObj.offersList.push(obj);
			hotDealsList.push(dealObj);
		}
	finalObj.hotDealsList=hotDealsList;
	finalObj.hotDealRef = $("#hotdealRef").val();
	finalObj.dealsDisplayTitle = $("#title").val();
	finalObj.preparedBy = $("#preparedBy").val();
	finalObj.effectiveFromDateStr = $("#from").val();
	finalObj.endDateStr = $("#to").val();
	finalObj.statusStr = $("#dealStatus").val();
	finalObj.dealPriorityStr = $("#dealPriority").val();
	finalObj.dealDescription = $("#description").val();
	finalObj.offerDisplayPage = $("#displaypage").val();
	
	var formData = JSON.stringify(finalObj);
	//var formData  = JSON.stringify($('form').serializeObject());
//	console.log(formData);
	var contextPath = $("#contextPath").val();
	if(operation=="new"){
		URL = contextPath + "/b2c/createNewHomepageDeal.do";
	   }
	   else if(operation=="edit"){
		   URL = contextPath + "/b2c/updateHotDeal.do";
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
}


