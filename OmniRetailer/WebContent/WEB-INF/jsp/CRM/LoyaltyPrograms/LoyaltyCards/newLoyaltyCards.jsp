<!--/*
 * Project Name 	        : OmniRetailerCustomer
 * Written By		        : Mythri
 * file name		        : Inventory Manager/loyaltyPrograms/createNewLoyaltyCards.jsp
 * file type		        : JSP
 * description				: The new product is displayed using this jsp
 * modifications			: Vijay
 * Decription				: design modifications, 
 * Date						: 20-12-17
 
 * */ -->


<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
	<title>Home | Omni Retailer</title>
	<meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>
	<script src="${pageContext.request.contextPath}/js/form_plugin.js"></script>
 	<script type= "text/javascript" src = "${pageContext.request.contextPath}/js/countries.js"></script>
 	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/jquery.calendars.picker.css">
 	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.calendars.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.calendars.plus.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.calendars.picker.js"></script>
	 <script type="text/javascript" src="${pageContext.request.contextPath}/js/crm/loyaltyPrograms/loyaltyCards.js"></script>
<style>
hr{ 
	margin-top: 0px;
    margin-bottom: 1px;
    border: 0;
    border-top: 1px solid #eee;
    }
    
th {
    border-right: 1px solid rgba(153, 153, 153, 0.37) !important;
    border-bottom: 1px solid rgba(153, 153, 153, 0.37) !important;
    border-top: 1px solid rgba(153, 153, 153, 0.37) !important;
    border-left: 1px solid rgba(153, 153, 153, 0.37) !important;
    position: relative;
    white-space: nowrap;
}
  td {
    border: 1px solid rgba(153, 153, 153, 0.37) !important;
  }
  
  .buttonMargin {
    margin-left: 25%;
}
.col-xs-6
{
width:10% ! important
}

.colWidth
{
width:100px;
}

.backgroundgray {
	background: #efefef !important;
}
</style>
<script type="text/javascript">
$(document).ready(function(){
	debugger;
	callCalender('validFrom');
	callCalender('validTo');
	callCalender('endDate');
	
	
	callCalender('startDate');
	print_country("country");
	$("#country").val("India");
	
	
	
	/*  $('#validTo').hange(function(){
	 var validdate = parseDate($('#validTo').val());
	 if(validdate!='')
		 var noOfDays = daydiff(parseDate($('#validFrom').val()), parseDate($('#validTo').val()));
		 $("#validityPeriod").val(noOfDays);
		 
	});  */
 /*  $('#validityPeriod').click(function(e){
		 var validdate = $('#validityPeriod').val();
		 var date = new Date($("#validFrom").val());
         
		var date = parseDate($('#validFrom').val())
       
      if(!isNaN(date.getTime())){
          date.setDate(date.getDate() + validdate);

          $("#validTo").val(date.toInputFormat());
      }
	 }); */
	 
	/* $("#validTo").calendarsPicker({
	    onSelect: function () {
	        myfunc();
	    }
	});
	
	function myfunc(){
		var noOfDays = daydiff(parseDate($('#validFrom').val()), parseDate($('#validTo').val()));
		 $("#validityPeriod").val(noOfDays);
	}*/
	
}); 




$("#loyaltyProgramName").keydown(function(){
	   $("#errLoyaltyProgramName").html("");
	   $("#Error").html("");
});

$("#validFrom").keydown(function(){
	   $("#errValidFrom").html("");
	   $("#Error").html("");
});

$("#validTo").keydown(function(){
	   $("#errValidTo").html("");
	   $("#Error").html("");
});

$("#states").change(function(){
	   $("#errStates").html("");
	   $("#Error").html("");
});

$("#quantity").keyup(function(){
	   $("#errQuantity").html("");
	   $("#Error").html("");
});

$("#validityPeriod").keyup(function(){
	   $("#errValidityPeriod").html("");
	   $("#Error").html("");
});
$("#rewardConversionRatio").keyup(function(){
	   $("#errRewardConversionRatio").html("");
	   $("#Error").html("");
});

$("#noOfCards").keyup(function(){
	   $("#errnoOfCards").html("");
	   $("#Error").html("");
});
$("#basePoints").keyup(function(){
	   $("#errbasePoints").html("");
	   $("#Error").html("");
});

$("#rewardLifeTime").keyup(function(){
});

function changeRequiredField(ele) {
	if($(ele).val() != "Points")
		$("#conversion").css("visibility","hidden");
	else
		$("#conversion").css("visibility","visible");
}







/* 
var selectedState = []; 
var statesList=[];
$("#states option").each(function()
		{
			
			statesList.push($(this).val())
		    
		});


try{
selectedState = $("#selectedStateList").val();
	if(selectedState != "" && selectedState != null)
		{
		debugger;
	selectedState = selectedState.replace(/[[\]]/g,'');
	selectedState = selectedState.split(','); 
	$("#states option").remove();

	for(var i=0;i< statesList.length;i++)
		{
			var selectedValue=false;
			for(var j=0;j< selectedState.length;j++)
				{
					if(statesList[i] === selectedState[j].trim())
						selectedValue=true;
					 						
				}
			if(selectedValue)
				{
				$("#states").append('<option selected value="'+statesList[i]+'">'+statesList[i]+'</option>');
				}
			else
				{
					$("#states").append('<option  value="'+statesList[i]+'">'+statesList[i]+'</option>');
				}

		}
		}
	}
	catch(e)
	{}
 */
		
</script>
</head>
<body>
<!-- Content Header (Page header) -->
<%-- <section class="content-header">
   <h1><spring:message code="loyaltyprogram.label" />
     <small><spring:message code="loyaltycards.label" /></small>
    </h1>
      <ol class="breadcrumb">
      	<li><a style="cursor: pointer;" onclick="return viewDashboard('inventorymanager');"><i class="fa fa-dashboard"></i><spring:message code="home.label" /></a></li>
        <li class="active"><a style="cursor: pointer;" onclick="showLoyaltyFlow();"><spring:message code="loyaltyprogram.label" /></a></li>
       </ol>
 </section> --%>

<!-- Main content -->
<section class="content">
<div class="row">
  <div class="col-xs-12">
				<div class="box box-primary">
				
				
                                <div class="box-header" style="text-align: center">
                                <br/>
                                <h3 class="box-title" style="padding :5px;  border:1px solid  #808080;"><spring:message code="generate.new.loyalty.cards.label" /></h3>
                                </div><!-- /.box-header -->
                                <!-- form start -->
                                
                                
                                
                                <form id="newLoyalty" method="post" >
                                 <%-- <div class="col-lg-10 col-xs-10" style="padding-left:0px;padding-right:0px">
                           <div class="wrapper">	 
                               <input type="text"  class="form-control" style="" value="${searchName}" id="searchCoupons" placeholder="<spring:message code="searchByCoupon.label" />" />
							   <button id="mySearch" class="searchbutton"></button>
							</div>
						 <input type="hidden" id="searchname" value="${searchName}">
                    </div> --%>
                                    <div class="box-body">
                                    	<div id="success" style="text-align: center;color: blue;font-size: 2;font-weight: bold;">${success}</div>
                                    
                                   	<div id="Error" style="text-align: center;color: red;font-size: 2;font-weight: bold;">${err}</div>
                                   
               <div style="padding: 4px 20px;">
                                   
                                   
                         <div class="row backgroundgray">
                                   	<div class="form-group col-lg-2">
                                            <label style="font-family: Calibri;color: gray;white-space: nowrap;"><spring:message code="loyalityPlanId.label" /> </label>
                                         <div class="col-lg-10" style="padding:0px;">
                                            <input type="text" class="form-control"  name="loyaltyProgramNumber" id="loyaltyPlanId" value="${loyaltyCards.loyaltyProgramNumber}"/>
                                            <span id="loyaltyPlanIderr" style="color:red; font-size:2"></span>
                                     	 </div>
                                    </div>
                                     	<!-- <div class="form-group col-lg-1"></div> -->
                                   		<div class="form-group col-lg-2">
                                            <label style="font-family: Calibri;color: gray;white-space: nowrap;"><spring:message code="card.type.label" /></label>
                                             <select class="form-control" name="loyaltyCardType" id="loyaltyCardType">
	                                            <option value="Bronze"${loyaltyCards.loyaltyCardType == 'Bronze' ? 'selected' : ''} >Bronze</option>
    	                                        <option value="Silver"${loyaltyCards.loyaltyCardType == 'Silver' ? 'selected' : ''}>Silver</option>
        	                                    <option value="Techno"${loyaltyCards.loyaltyCardType == 'Techno' ? 'selected' : ''}>Techno</option>
        	                                    <option value="Platinum"${loyaltyCards.loyaltyCardType == 'Platinum' ? 'selected' : ''}>Platinum</option>
        	                                    <option value="Gold"${loyaltyCards.loyaltyCardType == 'Gold' ? 'selected' : ''}>Gold</option>
        	                                     <option value="General"${loyaltyCards.loyaltyCardType == 'General' ? 'selected' : ''}>General</option>
                                            </select>
										</div>
										<!-- <div class="form-group col-lg-3"> -->
										<div class="form-group col-lg-2" Style="">
                                            <label style="font-family: Calibri;color: gray;white-space: nowrap;"><spring:message code="valid.from.label" /> <span style="color:red; font-size:2">*</span></label>
                                            <div class="input-group">
                                            	<div class="input-group-addon">
                                                	<i class="fa fa-calendar"></i>
                                            	</div>
                                            	<input class="form-control" readonly="readonly" style="background-color: white;" value="${loyaltyCards.validFrom}" name="validFrom" id="validFrom" size="20" type="text" onfocus="callCalender('validFrom')" onclick="callCalender('validFrom')" placeholder="DD/MM/YYYY"/>
                                            	<!-- <input type="text" name="validFrom" id="validFrom" required class="form-control date-type" data-inputmask="'alias': 'dd/mm/yyyy'" data-mask/> -->
                                       		 </div><!-- /.input group -->
                                           	<span style="color:red; font-size:2;;font-weight: bold" id="validFromError"></span>
                                        </div>
                                          <div class="form-group col-lg-2" style="">
                                            <label style="font-family: Calibri;color: gray;white-space: nowrap;"><spring:message code="valid.to.label" /> <span style="color:red; font-size:2">*</span></label>
                                             <div class="input-group">
                                            	<div class="input-group-addon">
                                                	<i class="fa fa-calendar"></i>
                                            	</div>
                                            	<input class="form-control" readonly="readonly" style="background-color: white;" name="validTo" id="validTo" size="20" type="text" value="${loyaltyCards.validTo}" onfocus="callCalender('validTo')"  placeholder="DD/MM/YYYY"/>
                                       		 </div>
                                           	<span style="color:red; font-size:2;font-weight: bold" id="validToError"></span>
                                         </div>
                                        
                                        
                                       <!--  </div> -->
                                       <div class="form-group col-lg-2">
                                       <div class="col-lg-9" >
                                            <label style="font-family: Calibri;color: gray;white-space: nowrap;" style= "white-space: nowrap;"><spring:message code="validity.period.label" /> <span style="color:red; font-size:2">*</span></label>
                                            <input type="text" class="form-control"  value="${loyaltyCards.validityPeriod}" name="validityPeriod" id="validityPeriod" value="" oninput="this.value = this.value.replace(/[^0-9]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');"/>
                                            <span style="color:red; font-size:2;font-weight: bold" id="errValidityPeriod"></span>
                                     	</div>
                                     	</div>
                                     	
                                     	
                                     	<div class="col-lg-2" >
                                     	  <div class="col-lg-10" style="padding: 0px; margin-left: -14px;">
                                            <label style="font-family: Calibri;color: gray;white-space: nowrap;"><spring:message code="loyalty.status.label" /><!--  <span style="color:red; font-size:2">*</span> --></label>
                                             <select class="form-control" name="status" id="status">
	                                            <option value="true"${loyaltyCards.status == 'true' ? 'selected' : ''}>Active</option>
    	                                        <option value="false"${loyaltyCards.status == 'false' ? 'selected' : ''}>Suspend</option>
                                            </select>
                                            
                                          <!--   <input type="text" class="form-control"  name="" id="basePoints" value=""/> -->
                                    	
                                    	
                                    	</div>
<!--                                     	 <input type="text" class="form-control"  name="" id="basePoints" value=""/> -->
                                    	
                                    	<!-- <div class="col-lg-4" >
                                    	 <input type="text" class="form-control"  name="" id="basePoints" value=""/>
                                    	</div> -->
                                    	
                                     </div>	
									</div>
									
									<div class="row backgroundgray">
                                   	  <div class="form-group col-lg-2">
                                     <label style="font-family: Calibri;color: gray;white-space: nowrap;"><spring:message code="loyalty.card.name.label" /> <span style="color:red; font-size:2">*</span></label>
                                   <div class="col-lg-12" style="padding:0px;">
                                            <input type="text" class="form-control"  name="loyaltyProgramName" id="loyaltyProgramName" value="${loyaltyCards.loyaltyProgramName}"/>
                                            <span style="color:red; font-size:2;font-weight: bold" id="errLoyaltyProgramName"></span>
                                     	</div>
                                   	 <%--  <div class="col-lg-12" style="padding:0px;">
                                            <label style="font-family: Calibri;color: gray;white-space: nowrap;"><spring:message code="loyalty.reward.type.label" /></label>
                                           
                                            <select class="form-control" onchange="changeRequiredField(this)" name="rewardType" id="rewardType">
	                                            <option value="Points"${loyaltyCards.rewardType == 'Points' ? 'selected' : ''}>Points</option>
    	                                        <option value="Cash"${loyaltyCards.rewardType == 'Cash' ? 'selected' : ''}>Cash</option>
        	                                    <option value="Gift Items"${loyaltyCards.rewardType == 'Gift Items' ? 'selected' : ''}>Gift Items</option>
                                            </select>
                                            </div> --%>
                                        </div>
                                    
                                    <div class="col-lg-2" style="padding:0px;">
                                      <div class="col-lg-8" style="">
                                            <label style="font-family: Calibri;color: gray;white-space: nowrap;" style="white-space: nowrap;"><spring:message code="loyalty.rewards.life.time.label" /></label>
                                            <input type="text" class="form-control"  name="rewardLifeTime" id="rewardLifeTime" value="${loyaltyCards.rewardLifeTime}" oninput="this.value = this.value.replace(/[^0-9]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');"/>
                                     <span id="rewardLifeTimeError" style="color:red; font-size:2;font-weight: bold"></span>
                                     </div>
                                     	</div>
                                   	
										
										<div class="form-group col-lg-4" style="padding:0px;">
										<div class="form-group col-lg-6" style="" >
                                            <label style="font-family: Calibri;color: gray;white-space: nowrap;"><spring:message code="crm.start.from.label" /> <span style="color:red; font-size:2">*</span></label>
                                            <div class="input-group">
                                            	<div class="input-group-addon">
                                                	<i class="fa fa-calendar"></i>
                                            	</div>
                                            	<input class="form-control" readonly="readonly" style="background-color: white;" value="${loyaltyCards.startDate}" name="startDate" id="startDate" size="20" type="text" onfocus="callCalender('startDate')" onclick="callCalender('startDate')" placeholder="DD/MM/YYYY"/>
                                            	<!-- <input type="text" name="validFrom" id="validFrom" required class="form-control date-type" data-inputmask="'alias': 'dd/mm/yyyy'" data-mask/> -->
                                       		 </div><!-- /.input group -->
                                           	<span style="color:red; font-size:2;font-weight: bold;" id="startDateError"></span>
                                        </div>
                                          <div class="form-group col-lg-6" style="">
                                            <label style="font-family: Calibri;color: gray;white-space: nowrap;"><spring:message code="crm.till.date.label" /> <span style="color:red; font-size:2">*</span></label>
                                             <div class="input-group">
                                            	<div class="input-group-addon">
                                                	<i class="fa fa-calendar"></i>
                                            	</div>
                                            	<input class="form-control" readonly="readonly" style="background-color: white;" name="endDate" id="endDate" size="20" value="${loyaltyCards.endDate}" type="text" onfocus="callCalender('endDate')" onclick="callCalender('endDate')" placeholder="DD/MM/YYYY"/>
                                       		 </div>
                                           	<span style="color:red; font-size:2;;font-weight: bold;" id="endDateError"></span>
                                         </div>
                                        </div>
                                      
                                    
                                      
                                      <div class="form-group col-lg-2" style="">
                                      	<div class="col-lg-9" style="white-space:nowrap">
                                            <label style="font-family: Calibri;color: gray;white-space: nowrap;" style="white-sapce:nowrap"><spring:message code="loyalty.no.cards.label" /></label><span style="color:red; font-size:2" id="conversion">*</span>
                                            <input type="text" class="form-control"  name="noOfCards" id="noOfCards" value="${loyaltyCards.noOfCards}" oninput="this.value = this.value.replace(/[^0-9]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');"/>
                                     	<span style="color:red; font-size:2;font-weight: bold;" id="errnoOfCards"></span>
                                     	</div>
                                      	</div>
                                      	
                                      	
                                      	<div class="col-lg-2" style="padding:0px;">
                                        <input type="checkBox"  id="requiredOTP" name="requiredOTP" value="0" />
                                    	<label style="font-family: Calibri;color: gray;"><spring:message code="crm.otp.required" /></label>
                                    	<br>
                                    	 <input type="checkBox"  id="autoIssue" name="autoIssueFlag"/>
                                    	  <label style="font-family: Calibri;color: gray;white-space: nowrap;"><spring:message code="autoIssue.label" /> </label>
									
                                    	</div>
                                      	 
                                      
									</div>
									
									
									
									
									<div class="row backgroundgray">
									
									<div class="form-group col-lg-2" style="margin-top: -15px;">
                                            <label style="font-family: Calibri;color: gray;white-space: nowrap;"  style="white-space: nowrap;"><spring:message code="conversion.ratio.label" /> <span style="color:red; font-size:2" id="conversion">*</span></label>
                                            <input type="text" class="form-control"  name="rewardConversionRatio" id="rewardConversionRatio" value="${loyaltyCards.rewardConversionRatio}" oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');"/>
                                            <span style="color:red; font-size:2;;font-weight: bold;" id="errRewardConversionRatio"></span>
                                    	</div>
                                       
									<div class="form-group col-lg-2" style="white-sapce:nowrap;margin-top: -15px;padding:0px" >
                                       <div class="col-lg-9" style="">
                                    	<label style="font-family: Calibri;color: gray;white-space: nowrap;" ><spring:message code="basePoints.label" /><span style="color:red; font-size:2" id="points">*</span></label>
                                    	 <input type="text" class="form-control"  name="basePoints" id="basePoints" value="${loyaltyCards.basePoints}" oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');"/>
                                    	  <span style="color:red; font-size:2;;font-weight: bold;" id="errbasePoints"></span>
                                    	</div>
                                     </div>
									
									
									<div class="form-group col-lg-2" style="white-sapce:nowrap;margin-top: -15px;padding:0px">
									 <div class="col-lg-9" style="">
                                            <label style="font-family: Calibri;color: gray;white-space: nowrap;"  ><spring:message code="minimumPoints.label" /><span style="color:red; font-size:2" id="points">*</span> </label>
                                            <input type="text" class="form-control"  name="minClaimPoints" id="minClaimPoints" value="${loyaltyCards.minClaimPoints}" oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');"/>
                                           <span style="color:red; font-size:2;font-weight: bold;" id="errminpoints"></span> 
                                    	</div>
                                    	</div>
                                       
									<div class="form-group col-lg-2" style="white-sapce:nowrap;margin-top: -15px;" >
                                      <div class="col-lg-12" style="">
                                    	<label style="font-family: Calibri;white-space: nowrap;" ><spring:message code="minimumRedeemPoints.label" /><span style="color:red; font-size:2" id="points">*</span></label>
                                    	 <input type="text" class="form-control"  name="minRedeemPoints" id="minRedeemPoints" value="${loyaltyCards.minRedeemPoints}" oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');"/>
                                    	  <span style="color:red; font-size:2;font-weight: bold;" id="errminredempoints"></span>
                  </div>
                                     </div>
                                     
                                    <div class="form-group col-lg-2" style="white-sapce:nowrap;margin-top: -15px;" >
                                      <div class="col-lg-12" style="">
                                    	<label style="font-family: Calibri;white-space: nowrap;" >Max Points/Day</label>
                                    	 <input type="text" class="form-control"  name="maxPointsPerDay" id="maxPointsPerDay" value="${loyaltyCards.minRedeemPoints}" oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');"/>
                                    	  <span style="color:red; font-size:2;font-weight: bold;" id="errmaxpointsDay"></span>
                  </div>
                                     </div>
                                     
                                     <div class="form-group col-lg-2" style="white-sapce:nowrap;margin-top: -15px;padding:0px" >
                                      <div class="col-lg-9" style="padding-left:0px">
                                    	<label style="font-family: Calibri;white-space: nowrap;" >Redeem Time</label>
                                    	 <input type="text" class="form-control"  name="redeemTime" id="redeemTime" value="${loyaltyCards.minRedeemPoints}" oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');"/>
                                    	  <span style="color:red; font-size:2;font-weight: bold;" id="errredeempoints"></span>
                  </div>
                                     </div>
									
									</div>
									
									
								
									<%-- 
									<div class="form-group col-lg-3">
									 <div class="col-lg-5" style="padding:0px;">
                                            <label style="font-family: Calibri;color: gray;white-space: nowrap;" style="white-space: nowrap;"><spring:message code="loyalty.rewards.life.time.label" /></label>
                                            <input type="text" class="form-control"  name="rewardLifeTime" id="rewardLifeTime" value="${loyaltyCards.rewardLifeTime}" oninput="this.value = this.value.replace(/[^0-9]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');"/>
                                     	</div>
                                     	</div>
                                      	
                                      	<div class="form-group col-lg-2">
                                      	<div class="col-lg-7" style="padding:0px;">
                                            <label style="font-family: Calibri;color: gray;white-space: nowrap;"><spring:message code="loyalty.no.cards.label" /></label><span style="color:red; font-size:2" id="conversion">*</span>
                                            <input type="text" class="form-control"  name="noOfCards" id="noOfCards" value="${loyaltyCards.noOfCards}" oninput="this.value = this.value.replace(/[^0-9]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');"/>
                                     	<span style="color:red; font-size:2" id="errnoOfCards"></span>
                                     	</div>
                                      	</div>
                                      	
                                      	<div class="form-group col-lg-4">
                                      	<div class="col-lg-6" style="padding-right:10px;">
                                            <label style="font-family: Calibri;color: gray;white-space: nowrap;"  style="white-space: nowrap;"><spring:message code="loyalty.rewards.conversion.ratio" /> <span style="color:red; font-size:2" id="conversion">*</span></label>
                                            <input type="text" class="form-control"  name="rewardConversionRatio" id="rewardConversionRatio" value="${loyaltyCards.rewardConversionRatio}" oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');"/>
                                            <span style="color:red; font-size:2" id="errRewardConversionRatio"></span>
                                    	</div> --%>
                                    	
                                    		<%-- <div class="col-lg-6" style="padding-left: 30px;">
                                           <br>
                                        
                                        	
                                        	  
                                            <input type="checkBox"  id="requiredOTP" name="requiredOTP" value="0" />
                                           

                                    	                                            <label style="font-family: Calibri;color: gray;white-space: nowrap;"><spring:message code="crm.otp.required" /> </label>
                                    	
                                    	</div> --%>
                                    	
                                    
                                    	
                                    	<div class="col-lg-12">
                                    	<br>
                                    	</div>
									
					<div class="row">	
						<div class="col-lg-12" style="">
							<div class="col-lg-6" style="padding: 0px;">
								<div class="col-lg-12" style="padding: 0px;">
							 <div class="col-lg-2 " style="padding:0px;">
                                         <div class="col-lg-12" style="padding:0px;">
                                            <label style="font-family: Calibri;color: gray;white-space: nowrap;" style="white-space: nowrap;"><spring:message code="crm.reward.criteria.label" /></label>
                                             <select class="form-control" name="rewardCriteria" id="rewardCriteria">
	                                            <option value="Turn Over"${loyaltyCards.rewardCriteria == 'Turn Over' ? 'selected' : ''}>Turn Over</option>
	                                            <option value="Others"${loyaltyCards.rewardCriteria == 'Others' ? 'selected' : ''}>Others</option>
                                          
                                            </select>
                                           
                                            </div>
										</div>
							
										<div class="col-lg-2 " style="padding-right:0px;">
                                            <label style="font-family: Calibri;color: gray;white-space: nowrap;"><spring:message code="crm.purchase.range.label"  /> <span style="color:red; font-size:2">*</span></label>
                                              <div class="col-lg-12" style="padding:0px;">
                                            	<input type="text" class="form-control"  name="purchaseRangeStart" placeholder="Start" id="purchaseRangeStart" oninput="this.value = this.value.replace(/[^0-9]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');" value="${loyaltyCards.purchaseRangeStart}"/>
                                        </div>
                                           <!--  <span style="color:red; font-size:2" id="errpriceRangeStart"></span> -->
                                      </div>
                                        <br>
                                        <div class="col-lg-2" style="padding-left:0px">
                                          <div class="col-lg-12" style="padding:0px;margin-left: 4px;">
                                               <input type="text" class="form-control"  name="purchaseRangeEnd" placeholder="End" id="purchaseRangeEnd" value="${loyaltyCards.purchaseRangeEnd}"oninput="this.value = this.value.replace(/[^0-9]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');"/>
                                            <span style="color:red; font-size:2;;font-weight: bold;" id="errpriceRangeEnd"></span>
                                         </div>
                                      </div> 
                                      <div class="col-lg-2 " style="padding:0px; margin-top: -19px;">
                                         <div class="col-lg-12" style="padding:0px;">
                                            <label style="font-family: Calibri;color: gray;white-space: nowrap;"><spring:message code="loyalty.reward.type.label" /></label>
                                            <select class="form-control" onchange="changeRequiredField(this)" name="rewardType" id="rewardType">
	                                            <option value="Fixed"${loyaltyCards.rewardType == 'Fixed' ? 'selected' : ''}>Fixed</option>
    	                                        <option value="Percentage"${loyaltyCards.rewardType == 'Percentage' ? 'selected' : ''}>Percentage</option>
        	                                  <%--   <option value="Gift Items"${loyaltyCards.rewardType == 'Gift Items' ? 'selected' : ''}>Gift Items</option> --%>
                                            </select>
                                            </div> 
                                       </div>
                                       
                                     	<div class="col-lg-3" style=" margin-top: -19px;">
                                            <label style="font-family: Calibri;color: gray;white-space: nowrap;"  style="white-space: nowrap;"><spring:message code="offer_reward_value.label" /> <span style="color:red; font-size:2" id="conversion">*</span></label>
                                         <div class="col-lg-12" style="padding:0px;">
                                            <input type="text" class="form-control"  name="" id="rewardValue" value="${loyaltyCards.rewardConversionRatio}" oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');"/>
                                         <!--    <span style="color:red; font-size:2" id="errRewardConversionRatio"></span> -->
                                    	</div>
                                      </div> 
                                       
                                        <input type="hidden" name="items" id="itemDetails">
                                       
                                       <div class=" col-lg-1" style="margin-top: -7px;margin-left:-15px">
                                         <a onclick="addRewardranges();" style="font-size: 28px;">
                                  <i class="fa fa-plus-circle" aria-hidden="true"></i>
                                      </a>
                                       </div>
                                       </div>
                                       
                                </div>       
                                        <div class="col-lg-6" style="margin-top: 1.5%;">
                                        
                                                    	<div class="form-group col-lg-12" style="text-align:center;  margin-bottom: 0.3%;padding:0px;">
										<input type="text"  class="form-control searchItems" value="${searchCriteria}" id="searchItems"  placeholder="Search Loyalty cards here.."   style="height:30PX;text-align:left;background:url(${pageContext.request.contextPath}/images/search.png) no-repeat;background-position:right;" />
											<div class="services">
						    					<div class="items">
						     						<ul class="matchedStringUl searchLoyaltyItems" style=""></ul>
						   						</div>
											</div>
									</div>
                                                    	
                                                    	
                                    	<!-- <div class="col-lg-3" style="padding-right: 0px;margin-bottom: 5px;">
										<input type="file" class="btn bg-olive btn-inline" accept=".xlsx" title="To import, Choose the valid Exel Sheet format" style="height: 30px;display: inline-block;padding: 3px !important;width: 100%;" id="loyaltycards" name="uploadedfilePath" onchange="addNameToTextBox('loyaltycards');" /> 
										<input type="hidden" id="coupons_refId"  /> 
										<input type="hidden" id="coupons_name" />
                                    	</div>
                                    	<div class="col-lg-2" style="padding-right: 0px;">
                                    	<input type="button" class="btnCls" style="width: 100%;font-size: 15px;padding: 4px 4px;" onclick="importDataxls()" value="Import">
                                    	</div> -->
									
									
									
										
									   <div id="example1_wrapper" class="dataTables_wrapper form-inline" role="grid" style="overflow-x: auto;width:100%;position: relative;white-space: nowrap;">
                     <table id="productstocks" class="table table-bordered table-striped">
                      <thead style="background-color: #eeeeee !important;border-top: hidden; border-left: hidden;border-right: hidden;">
                             <tr>
                                <th><div><spring:message code="sl.no.label" /></div></th>
                             	<th><spring:message code="loyalty.card.no.label" /></th>
                             	<th ><div style="width: 100px;">Number</div></th>
                             <th ><div style="width: 100px;">Name</div></th>
                             <th >Avail Pts</th>
                             	<th ><spring:message code="crm.start.date" /></th>
                             	<th ><spring:message code="crm.end.date" /></th>
                             	<th ><spring:message code="status.label" /></th>
                             	 <th><div style="width: 100px;">Action</div></th>
                             </tr>
                         </thead>
                         <tbody style="text-align: center;">
                         
                         
                         
                         </tbody>
                     </table>
                     </div>
								  </div>
                                       
                                       
                                       
                                       
                                       </div>
							</div>	
                                       
                                <div class="row">	
									
									<div class="col-lg-6" style="margin-top:-6.25%;width: 46%;">
                                    <div class="col-lg-12" style="padding: 0px;">   
                                        <table id="rewardranges" class="table table-bordered table-striped" style="overflow-y: auto;height:150px;display: block;">
                                        <thead style="background-color: #eeeeee !important;">
                                            <tr>
                                            	<%-- <th><spring:message code="s.no.label" /></th> --%>
                                            	<th><div style="width: 100px;">Criteria</div><%-- <spring:message code="crm.reward.criteria.label" /> --%></th>
                                                <th>Start Value</th>
                                                <th>End Value</th>
                                                <th><spring:message code="loyalty.reward.type.label" /></th>
                                               <th><spring:message code="offer_reward_value.label" /></th>
                                                <th><spring:message code="EmployeeForm.action" /></th>
                                            </tr>
                                        </thead>
                                         <tbody style="text-align: center;">
                                         <c:forEach var="purchaseRange" items="${loyaltyCards.loyaltyPurcahseRanges}" varStatus="theCount">
                                            <tr id="dynamicdiv${theCount.index+1}">
                                          	    <%-- <td class='slno'>${theCount.index+1}</td> --%>
                                          	     <input type="hidden" class="slno" value="${theCount.index+1}"/>
                                          	     <input type="hidden" id="autoNumber${theCount.index+1}" value="${purchaseRange.sno}"/>
                                                <td id="rewardCriteria${theCount.index+1}">${purchaseRange.rewardCriteria}</td>
                                                <td id="startvalue${theCount.index+1}">${purchaseRange.minPurchaseValue}</td>
                                                <td id="endvalue${theCount.index+1}">${purchaseRange.maxPurchaseValue}</td>
                                                <td id="rewardType${theCount.index+1}">${purchaseRange.rewardType}</td>
                                                <td id="rewardValue${theCount.index+1}">${purchaseRange.rewardValue}</td>
                                                <td id="Del${theCount.index+1}"><a id="Dele${theCount.index+1}" style=" text-decoration: underline;margin-left:3px;" onclick="deleteItem(this);" title="Delete">Delete</a></td>
                							</tr>
                                            </c:forEach> 
                                        </tbody>
                                      </table> 
									</div>
								</div>
							</div>	
										
									
									<div class="col-lg-12">
									<br>
									</div>
							<div class="row" >		
									<div class="col-lg-12" style="">
									<div class="col-lg-6" style="width: 44.5%;">
									
									<%-- <label style="font-family: Calibri;color: gray;white-space: nowrap;" style="font-size: 16px;"><spring:message code="loyalty.locations.label" /></label> --%>
									
									<div class="row" style="border-style:solid;border-color: #cccccc;    border-width: 1px">
										 <div class="form-group col-lg-6">
										 <div class="row" style="margin-left: 1%">
										 
										 </div>
                                            <label style="font-family: Calibri;color: gray;white-space: nowrap;"><spring:message code="loyalty.country.label" /></label>
                                            <select onchange="print_state('states',this.selectedIndex);" id="country" name ="country" class="form-control" >
											</select>
                                     	</div>
                                     	
                                   <div class="col-lg-6" style=""></div>
                                      <%-- 
                                    	<div class="form-group col-lg-6" style="">
                                    		<label style="font-family: Calibri;color: gray;"><spring:message code="zone.label" /> <span style="color:red; font-size:2">*</span></label>
                                           
                                           <select  name="zone" multiple="multiple" class="form-control" >
    										    <c:forEach var="zoneList" items="${zoneList}">
    										    <c:set var="zs" value="false"/>
    										    <c:forEach var="zonestr" items="${zones}">
    										    <c:if test="${zonestr == zoneList.zoneID}">
    										    	<c:set var="zs" value="true"/>
    										    </c:if>
    										    
    										    </c:forEach>
    										    <c:choose>
    										    <c:when test="${zs == 'true'}">
													<option selected value="${zoneList.zoneID}">${zoneList.zoneID}</option>
						 					</c:when>
						 					  <c:otherwise>
													<option  value="${zoneList.zoneID}">${zoneList.zoneID}</option>
						 					</c:otherwise>
						 					</c:choose>
							 					
						 					
						 					</c:forEach>
    										
    										</select>
    										
    										
                                     	</div> --%>
                                     	<div class="row">
                                     	<div class="col-lg-12">
                                     		<div class="form-group col-lg-6" style="">
                                           <%--  <label style="font-family: Calibri;color: gray;white-space: nowrap;"><spring:message code="loyalty.state.label" /> <span style="color:red; font-size:2">*</span></label>
                                            <select id ="states" name="states" multiple="multiple" class="form-control" >
    											
    										</select>
    										<span style="color:red; font-size:2" id="errStates"></span> --%>
                                    	
                                    	<label style="font-family: Calibri;color: gray;"><spring:message code="zone.label" /> <span style="color:red; font-size:2">*</span></label>
                                           
                                           <select  name="zone" id="zone" multiple="multiple" class="form-control" >
    										    <c:forEach var="zoneList" items="${zoneList}">
    										    <c:set var="zs" value="false"/>
    										    <c:forEach var="zonestr" items="${zones}">
    										    <c:if test="${zonestr == zoneList.zoneID}">
    										    	<c:set var="zs" value="true"/>
    										    </c:if>
    										    
    										    </c:forEach>
    										    <c:choose>
    										    <c:when test="${zs == 'true'}">
													<option selected value="${zoneList.zoneID}">${zoneList.zoneID}</option>
						 					</c:when>
						 					  <c:otherwise>
													<option  value="${zoneList.zoneID}">${zoneList.zoneID}</option>
						 					</c:otherwise>
						 					</c:choose>
							 					
						 					
						 					</c:forEach>
    										
    										</select>
    							    	  <span style="color:red; font-size:2;font-weight: bold;" id="errzone"></span>
    			
    										
                                    	</div>
                                     	<div class="form-group col-lg-6">
                                            <label style="font-family: Calibri;color: gray;white-space: nowrap;"><spring:message code="card.description.label" /></label>
                                            <textarea style="resize:none" class="form-control"  name="loyalityProgramDescription" id="loyalityProgramDescription" rows="4"></textarea>
                                     	</div>
									  </div>
									  </div>
									</div>  
									<%--   
									  <div class="col-lg-7" style="padding-left:33px;">
									
									<label style="font-family: Calibri;color: gray;" style="font-size: 16px;"><spring:message code="crm.loyality.cards.generated.label" /></label>
									
									   <div id="example1_wrapper" class="dataTables_wrapper form-inline" role="grid" style="overflow-x: auto;width:100%;position: relative;white-space: nowrap;">
                     <table id="productstocks" class="table table-bordered table-striped">
                      <thead style="background-color: #eeeeee !important;border-top: hidden; border-left: hidden;border-right: hidden;">
                             <tr>
                                <th><div><spring:message code="sl.no.label" /></div></th>
                             	<th><spring:message code="loyalty.card.no.label" /></th>
                             	<th ><spring:message code="crm.start.date" /></th>
                             	<th ><spring:message code="crm.end.date" /></th>
                             	<th ><spring:message code="status.label" /></th>
                             	
                             </tr>
                         </thead>
                         <tbody style="text-align: center;">
                         </tbody>
                     </table>
                     </div>
								  </div> --%>
									  
									  </div>
									  
                                   <!--   <input type="hidden" id="selectedState" name="states"> -->
                                    </div>
                          </div>          
									<div class="col-lg-12">
									
									<br>
									</div>
									
									<div class="col-lg-12">
									<br>
									</div>
						<div class="row" style="text-align: center;">
					 <c:if test="${sessionScope.role == 'super admin'}"> 
					 							 <input type="button" class="btnCls" style="" onclick="validateLoyaltyCards('new')" value="<spring:message code="submit.label" />" />
					 	
					 	<input type="button" class="btnCls" style="" onclick="viewLoyaltyCards('loyalitycards','Loyaltycards','0','menu');" value="<spring:message code="cancel.label" />" />
					 </c:if>
					<c:forEach var="accessControl" items="${sessionScope.CustomerLoyality}">
                         <c:if test="${accessControl.appDocument == 'Loyaltycards' && accessControl.write == true && accessControl.read == true}">	
						 <input type="button" class="btnCls" style="" onclick="validateLoyaltyCards('new')" value="<spring:message code="submit.label" />" />
							
							<input type="button" class="btnCls buttonMargin" style="" onclick="viewLoyaltyCards('loyalitycards','Loyaltycards','0','menu');" value="<spring:message code="cancel.label" />" />
						</c:if>
					</c:forEach>
						</div>
					<br/>
               </div>
               <div class="box-footer">
                
               </div>
                
                                     <input type="hidden" id="selectedStateList"  value="${statesList}">
               
           </form>
       	</div>
	</div>
</div>


</section><!-- /.content -->

</body>
</html>