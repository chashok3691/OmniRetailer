$(document).ready(function(){
	var re = /^[0-9/]+$/;
	$("input:checkbox").on("change",function(){
		$(".Error").html("");
		var id = $(this).attr("id");
		id=id.replace("Chkbox","");
		if ($(this).prop('checked')) {
			$("#"+id+"StartTime").attr('disabled', false); 
			$("#"+id+"EndTime").attr('disabled', false);
			$("."+id+"ExtendTime").attr('disabled', false);
		}else{
			$("#"+id+"StartTime").attr('disabled', true);     
			$("#"+id+"EndTime").attr('disabled', true);
			$("."+id+"ExtendTime").attr('disabled', true);
		}
	});
	
	$("#startDate").blur(function(){
	  $("#startDateError").html("");
	  if($("#startDate").val()){
		if(!re.test($("#startDate").val())){
			$("#startDateError").html("Invalid Date");
			$("#startDate").focus();
			return;
	    }else{
	    	var noOfDays = daydiff(parseDate($('#endDate').val()), parseDate($('#startDate').val()));
			 if(noOfDays > 0){
				 $("#startDateError").html("Start Date can't be more than End Date");
				 $("#startDate").val("");
				 return;
			 }else{
				 $("#startDateError").html("");
			 }
	    }
	  }
	});
	
	$("#endDate").blur(function(){
	  $("#endDateError").html("");
	  if($("#endDate").val() != ""){
		 if(!re.test($("#endDate").val())){
				$("#endDateError").html("Invalid Date");
				$("#endDate").focus();
				return;
		 }else{
			 var noOfDays = daydiff(parseDate($('#startDate').val()), parseDate($('#endDate').val()));
			 if(noOfDays < 0){
				 $("#endDateError").html("End Date can't be less than Start Date");
				 $("#endDate").val("");
				 return;
			 }else{
				 $("#endDateError").html("");
			 }
		 }
		}
	});
	
	$("#shiftName").keydown(function(){
		   $("#shiftNameError").html("");
		   $(".Error").html("");
	 });
	
	$("#mondayStartTime").change(function(){
		   $("#mondayStartTimeError").html("");
		   //$(".Error").html("");
	 });
	
	$("#mondayEndTime").change(function(){
		   $("#mondayEndTimeError").html("");
		   //$(".Error").html("");
	 });
	
	$("#tuesdayStartTime").change(function(){
		   $("#tuesdayStartTimeError").html("");
		  // $(".Error").html("");
	 });
	
	$("#tuesdayEndTime").change(function(){
		   $("#tuesdayEndTimeError").html("");
		  // $(".Error").html("");
	 });
	
	$("#wednesdayStartTime").change(function(){
		   $("#mondayStartTimeError").html("");
		  // $(".Error").html("");
	 });
	
	$("#wednesdayEndTime").change(function(){
		   $("#mondayEndTimeError").html("");
		   //$(".Error").html("");
	 });
	
	$("#thursdayStartTime").change(function(){
		   $("#thursdayStartTimeError").html("");
		   //$(".Error").html("");
	 });
	
	$("#thursdayEndTime").change(function(){
		   $("#thursdayEndTimeError").html("");
		   //$(".Error").html("");
	 });
	
	$("#fridayStartTime").change(function(){
		   $("#fridayStartTimeError").html("");
		   //$(".Error").html("");
	 });
	
	$("#fridayEndTime").change(function(){
		   $("#fridayEndTimeError").html("");
		  // $(".Error").html("");
	 });
	
	$("#saturdayStartTime").change(function(){
		   $("#saturdayStartTimeError").html("");
		   //$(".Error").html("");
	 });
	
	$("#saturdayEndTime").change(function(){
		   $("#saturdayEndTimeError").html("");
		  // $(".Error").html("");
	 });
	
	$("#sundayStartTime").change(function(){
		   $("#sundayStartTimeError").html("");
		  // $(".Error").html("");
	 });
	
	$("#sundayEndTime").change(function(){
		
		   $("#sundayEndTimeError").html("");
		  // $(".Error").html("");
	 });
	
});

function displayShiftTimings(){
	
	 //purpose:for checking internet conection
	var online = window.navigator.onLine;
  	if(!online){
  	alert("check your internet connection,please try agian after some time");
  	return;
  	}
	var ShiftTimings =$('#shiftTimings').val();
//	console.log("Length>>>>>"+ShiftTimings.length);
	 if(ShiftTimings.length>0){
		var list = jQuery.parseJSON(ShiftTimings);
		for(var i=0;i<list.length;i++){
//			console.log("Week Day:::::"+list[i].weekDay);
			if(list[i].weekDay=="Monday"){
				$("#mondayStartTime").val(list[i].start_time);
				$("#mondayEndTime").val(list[i].end_time);
				//$('input[name=mondayExtendTime]:checked').val(list[i].extendedTime);
				$('input[name=mondayExtendTime][value=' + list[i].extendedTime + ']').attr('checked', true);
				$("#mondayChkbox").prop( "checked", true );
			}
            if(list[i].weekDay=="Tuesday"){
            	$("#tuesdayStartTime").val(list[i].start_time);
				$("#tuesdayEndTime").val(list[i].end_time);
				$('input[name=tuesdayExtendTime][value=' + list[i].extendedTime + ']').attr('checked', true);
				$("#tuesdayChkbox").prop( "checked", true );
			}
            if(list[i].weekDay=="Wednesday"){
            	$("#wednesdayStartTime").val(list[i].start_time);
				$("#wednesdayEndTime").val(list[i].end_time);
				$('input[name=wednesdayExtendTime][value=' + list[i].extendedTime + ']').attr('checked', true);
				$("#wednesdayChkbox").prop( "checked", true );
			}
            if(list[i].weekDay=="Thursday"){
            	$("#thursdayStartTime").val(list[i].start_time);
				$("#thursdayEndTime").val(list[i].end_time);
				$('input[name=thursdayExtendTime][value=' + list[i].extendedTime + ']').attr('checked', true);
				$("#thursdayChkbox").prop( "checked", true );
			}
            if(list[i].weekDay=="Friday"){
            	$("#fridayStartTime").val(list[i].start_time);
				$("#fridayEndTime").val(list[i].end_time);
				$('input[name=fridayExtendTime][value=' + list[i].extendedTime + ']').attr('checked', true);
				$("#fridayChkbox").prop( "checked", true );
			}
            if(list[i].weekDay=="Saturday"){
            	$("#saturdayStartTime").val(list[i].start_time);
				$("#saturdayEndTime").val(list[i].end_time);
				$('input[name=saturdayExtendTime][value=' + list[i].extendedTime + ']').attr('checked', true);
				$("#saturdayChkbox").prop( "checked", true );
			}
            if(list[i].weekDay=="Sunday"){
            	$("#sundayStartTime").val(list[i].start_time);
				$("#sundayEndTime").val(list[i].end_time);
				$('input[name=sundayExtendTime][value=' + list[i].extendedTime + ']').attr('checked', true);
				$("#sundayChkbox").prop( "checked", true );
			}
		}
	 }
	
}

function daydiff(first, second) {
    return (second-first)/(1000*60*60*24);
}

function parseDate(str) {
    var mdy = str.split('/');
    return new Date(mdy[2], mdy[1]-1, mdy[0]);
}

	
	