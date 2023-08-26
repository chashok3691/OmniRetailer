<!--/*
 * Project Name 	        : OmniRetailerCustomer
 * Written By		        : Mythri
 * file name		        : Inventory Manager/loyaltyPrograms/viewLoyaltyCards.jsp
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
    	<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
    	<%@ taglib prefix="ln" uri="http://java.sun.com/jsp/jstl/functions" %>
    
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
 	<script type= "text/javascript" src = "${pageContext.request.contextPath}/js/controller.js"></script>

<style type="text/css">
	/* .col-xs-12 {
	 padding: 2% 20%;
	 } */
	/*  .error{
	 border-color:red !important;
	 } */
 .col-xs-6
{
width:82%! important
}
	 
</style>
<script type="text/javascript">

focusDiv("Error")
	$(document).ready(function(){
		
		focusDiv("Error");
		//callCalender('validFrom');
		callCalender('validTo');
		callCalender('endDate');
		callCalender('startDate');
		callCalender('enroledate');
		callCalender('enddateUpgrade');
		callCalender('startdateUpgrade');
		print_country("country");
		$("#country").val("India");
		//print_state('states',104);
		
		
		/* $('#validTo').click(function(){
			 var validdate = parseDate($('#validTo').val());
			 if(validdate!='')
				 var noOfDays = daydiff(parseDate($('#validFrom').val()), parseDate($('#validTo').val()));
				
				 $("#validityPeriod").val(noOfDays);
				 
		
				 
			}); */
			
		
	
	
	var selectedCountry = $("#selectedCountry").val();
	selectedCountry = selectedCountry.replace(/[[\]]/g,'');
	
	var id = getCountryIndex(selectedCountry);
	print_country("country");
	if(selectedCountry != null && selectedCountry != "")
		$("#country").val(selectedCountry);
	
	if(id == null || id == "" || id == undefined){
		id = getCountryIndex($("#country").val());
	}
	
 	    
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
	
	$("#basePoints").keyup(function(){
		   $("#errbasePoints").html("");
		   $("#Error").html("");
	});
	$("#noOfCards").keyup(function(){
		   $("#errnoOfCards").html("");
		   $("#Error").html("");
	});
	/* $("#basePoints").keyup(function(){
		   $("#errbasePoints").html("");
		   $("#Error").html("");
	});
 */
	$("#rewardLifeTime").keyup(function(){
	});

	function changeRequiredField(ele) {
		if($(ele).val() != "Points")
			$("#conversion").css("visibility","hidden");
		else
			$("#conversion").css("visibility","visible");
	}
	
	
	
	

/* 	var statesList=[];
	$("#states option").each(function()
			{
				
				statesList.push($(this).val())
			    
			}); */
	
	
	
	/* 
	var selectedState = []; 
	
	selectedState = $("#selectedStateList").val();
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

 		} */
 	
 	
	$("#searchItems").focus();
	
	$('#searchItems').on('input',function(e){
		debugger;
		if($(this).val().trim()==""){
			searchLoyaltyCards('','0',false);
		}
	});
});

	
	
	
</script>
</head>
<body>


<!-- Main content -->
<section class="content">
<div class="row">
  <div class="col-xs-12">
				<div class="box box-primary">
                                <div class="box-header" style="text-align: center">
                                <h3 class="box-title" style="padding :5px;  border:1px solid  #808080;">${loyaltyCard.loyaltyProgramNumber} - <spring:message code="po.details.label" /></h3>
                                </div><!-- /.box-header -->
                                <!-- form start -->
                                <form id="loyalityFromView" method="post" >
                                
						 <input type="hidden" value="${loyaltyCard.loyaltyProgramNumber}" name="loyaltyProgramNumber" id="loyaltyProgramNumber"/>
						  
						  <div class="box-body">
                                   	<div id="Error" class="Error" style="text-align: center;color: red;font-size: 2;font-weight: bold;">${err}</div>
                                   
                                   <div id="success"  class="Error" style="text-align: center;color: blue;font-size: 2;font-weight: bold;">${success}</div>
                                   	<input type="hidden" value="${err}">
                                   	
                                   	 <div style="background: #efefef;padding: 4px 20px;">
                                   	<div class="row">
                                   	
                                   	<div class="form-group col-lg-2">
                                            <label style="font-family: Calibri;color: gray;white-space: nowrap;"><spring:message code="loyalityPlanId.label" /></label>
                                            <div class="col-lg-10" style="padding:0px;">
                                            <input type="text" class="form-control"  name="" id="loyaltyPlanId" value="${loyaltyCard.loyaltyProgramNumber}"/>
                                     	</div>
                                     	</div>
                                   	
                                   		<div class="form-group col-lg-2">
                                            <label style="font-family: Calibri;color: gray;white-space: nowrap;"><spring:message code="card.type.label" /></label><%-- "${loyaltyCard.loyaltyCardType" --%>
                                            <select class="form-control" name="loyaltyCardType" id="loyaltyCardType">
	                                            <option value="Bronze" ${'Bronze' == loyaltyCard.loyaltyCardType ? 'selected' : ''}>Bronze</option>
	                                            <option value="Silver" ${'Silver' == loyaltyCard.loyaltyCardType ? 'selected' : ''}>Silver</option>
	                                            <option value="Techno" ${'Techno' == loyaltyCard.loyaltyCardType ? 'selected' : ''}>Techno</option>
	                                            <option value="Platinum" ${'Platinum' == loyaltyCard.loyaltyCardType ? 'selected' : ''}>Platinum</option>
	                                            <option value="Gold" ${'Gold' == loyaltyCard.loyaltyCardType? 'selected' : ''}>Gold</option>
	                                            <option value="General" ${'General' == loyaltyCard.loyaltyCardType? 'selected' : ''}>General</option>

                                            </select>
										</div>
										
										
									<%-- 	<fmt:parseDate  value="${loyaltyCard.validFrom}" pattern="yyyy-MM-dd HH:mm:ss"  var="validityFrom" />
										<fmt:formatDate var="validFrom" value="${validityFrom}" pattern="dd/MM/yyyy"/> --%>
										
										<!-- <div class="form-group col-lg-4"> -->
										<div class="form-group col-lg-2" Style="padding-right:10px;">
                                            <label style="font-family: Calibri;color: gray;white-space: nowrap;"><spring:message code="valid.from.label" /> <span style="color:red; font-size:2">*</span></label>
                                            <div class="input-group">
                                            	<div class="input-group-addon">
                                                	<i class="fa fa-calendar"></i>
                                            	</div>
                                           	<!-- <input type="text" name="validFrom" id="validFrom" required class="form-control date-type" data-inputmask="'alias': 'dd/mm/yyyy'" data-mask/> -->
<%--                                               	<input class="form-control" readonly="readonly" style="background-color: white;" name="validFrom" id="validFrom" size="20" type="text" value="${loyaltyCard.validFrom}" onfocus="callCalender('validFrom')" onclick="callCalender('validFrom')" placeholder="DD/MM/YYYY"/> --%>
                                              	<input class="form-control" readonly="readonly" style="" name="validFrom" id="validFrom" size="20" type="text" value="${loyaltyCard.validFromStr}"  placeholder="DD/MM/YYYY"/>
  
                                       		 </div><!-- /.input group -->
<!--                                            	<span style="color:red; font-size:2" id="validFromError"></span> -->
                                        </div>
                                         
                                         <%-- <fmt:parseDate  value="${loyaltyCard.validTo}" pattern="yyyy-MM-dd HH:mm:ss" var="validityTo" />
										<fmt:formatDate var="validTo" value="${validityTo}" pattern="dd/MM/yyyy"/> --%>
                                         
                                      <!--    <div class="col-lg-1"></div> -->
                                          <div class="form-group col-lg-2" style="padding-left:10px;">
                                            <label style="font-family: Calibri;color: gray;white-space: nowrap;"><spring:message code="valid.to.label" /> <span style="color:red; font-size:2">*</span></label>
                                             <div class="input-group">
                                            	<div class="input-group-addon">
                                                	<i class="fa fa-calendar"></i>
                                            	</div>
                                            	<input class="form-control"  readonly style="background-color:white" name="validTo"  id="validTo"  value="${loyaltyCard.validToStr}" size="20" type="text" onfocus="callCalender('validTo')" onclick="callCalender('validTo')" placeholder="DD/MM/YYYY"/>
                                       		 </div>
                                           	<span style="color:red; font-size:2" id="validToError"></span>
                                         </div>
                                        
                                        
                                       
                                       <div class="form-group col-lg-2">
                                       <div class="col-lg-9" >
                                            <label style="font-family: Calibri;color: gray;white-space: nowrap;" style= "white-space: nowrap;"><spring:message code="validity.period.label" /> <span style="color:red; font-size:2">*</span></label>
                                            <input type="text" class="form-control"  name="validityPeriod" id="validityPeriod" value="${loyaltyCard.validityPeriod}"/>
                                            <span style="color:red; font-size:2" id="errValidityPeriod"></span>
                                     	</div>
                                     	</div>
                                     	
                                     	
                                     	<div class="form-group col-lg-2" style="">
                                    	<div class="col-lg-10" style="padding: 0px; margin-left: -14px;">
                                            <label style="font-family: Calibri;color: gray;white-space: nowrap;"><spring:message code="loyalty.status.label" /><!--  <span style="color:red; font-size:2">*</span> --></label>
                                             <select class="form-control" name="status" id="status">
	                                            <option value="true" ${'true' == loyaltyCard.status? 'selected' : ''}>Active</option>
	                                            <option value="false" ${'false' == loyaltyCard.status? 'selected' : ''}>InActive</option>
                                            </select>
                                    	</div>
                                    
									</div>
                                     	
									</div>
									
									
									
									
									
									
										<div class="row">
										
										 <div class="form-group col-lg-2">
                                            <label style="font-family: Calibri;color: gray;white-space: nowrap;"><spring:message code="loyalty.card.name.label" /> <span style="color:red; font-size:2">*</span></label>
                                            <div class="col-lg-12" style="padding:0px;">
                                            <input type="text" class="form-control"  name="loyaltyProgramName" readonly id="loyaltyProgramName" value="${loyaltyCard.loyaltyProgramName}"/>
                                            <span style="color:red; font-size:2" id="errLoyaltyProgramName"></span>
                                     	</div>
                                     	</div> 
										
                                   	  <%-- <div class="form-group col-lg-3">
                                   	  <div class="col-lg-6" style="padding:0px;">
                                            <label style="font-family: Calibri;color: gray;white-space: nowrap;"><spring:message code="loyalty.reward.type.label" /></label>
                                           ${loyaltyCard.rewardType} 
                                            <select class="form-control" onchange="changeRequiredField(this)" name="rewardType"  id="rewardType" style="opacity: 1.5; pointer-events: none;" readonly>
	                                            <option value="Points" ${'Points' == loyaltyCard.rewardType? 'selected' : ''}>Points</option>
	                                            <option value="Cash" ${'Cash' == loyaltyCard.rewardType? 'selected' : ''}>Cash</option>
	                                            <option value="GiftItems" ${'GiftItems' == loyaltyCard.rewardType? 'selected' : ''}>Gift Items</option>
                                            </select>
                                            </div>
                                        </div> --%>
                                        
                                       <div class="form-group col-lg-2">
									 <div class="col-lg-8" style="padding:0px;">
                                            <label style="font-family: Calibri;color: gray;white-space: nowrap;" style="white-space: nowrap;"><spring:message code="loyalty.rewards.life.time.label" /></label>
                                            <input type="text" class="form-control"  name="rewardLifeTime" id="rewardLifeTime" value="${loyaltyCard.rewardLifeTime}" oninput="this.value = this.value.replace(/[^0-9]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');"/>
                                     	</div>
                                     	</div>
                                        
                                        
                                        
                                        
                                   		<%-- <div class="form-group col-lg-2">
                                   		  
                                            <label style="font-family: Calibri;color: gray;white-space: nowrap;" style="white-space: nowrap;"><spring:message code="crm.reward.criteria.label" /></label>
                                            <div class="col-lg-9" style="padding:0px;">
                                            ${loyaltyCard.rewardCriteria}
                                             <select class="form-control" name="rewardCriteria" id="rewardCriteria" style="opacity: 1.5; pointer-events: none;" readonly>
	                                            <option value="Turn Over" ${'Turn Over' == loyaltyCard.rewardCriteria? 'selected' : ''}>Turn Over</option>
	                                            <option value="Others" ${'Others' == loyaltyCard.rewardCriteria? 'selected' : ''}>Others</option>
                                            </select>
                                            </div>
										</div> --%>
										
										<%-- <fmt:parseDate  value="${loyaltyCard.startDate}" pattern="yyyy-MM-dd HH:mm:ss" var="startedDate" />
										<fmt:formatDate var="startDate" value="${startedDate}" pattern="dd/MM/yyyy"/> --%>
										
										<div class="form-group col-lg-4" style="padding:0px;">
										<div class="form-group col-lg-6" style="" >
                                            <label style="font-family: Calibri;color: gray;white-space: nowrap;"><spring:message code="crm.start.from.label" /> <span style="color:red; font-size:2">*</span></label>
                                            <div class="input-group">
                                            	<div class="input-group-addon">
                                                	<i class="fa fa-calendar"></i>
                                            	</div>
                                            	<input class="form-control" readonly="readonly" style="background-color: white;" name="startDate" id="startDate" size="20" type="text" value="${startdateloyaltycard}"  placeholder="DD/MM/YYYY"/>
                                       		 </div>
                                           	<span style="color:red; font-size:2" id="startDateError"></span>
                                        </div>
                                        
                                        
                                       <%--  <fmt:parseDate  value="${loyaltyCard.endDate}" pattern="yyyy-MM-dd HH:mm:ss" var="dateTill" />
										<fmt:formatDate var="tillDate" value="${dateTill}" pattern="dd/MM/yyyy"/> --%>
                                        
                                          <div class="form-group col-lg-6" style="">
                                            <label style="font-family: Calibri;color: gray;white-space: nowrap;"><spring:message code="crm.till.date.label" /> <span style="color:red; font-size:2">*</span></label>
                                             <div class="input-group">
                                            	<div class="input-group-addon">
                                                	<i class="fa fa-calendar"></i>
                                            	</div>
                                            	<input class="form-control" readonly="readonly" style="background-color: white;" name="endDate" id="endDate" size="20" type="text" value="${enddateloyaltyCard}"  placeholder="DD/MM/YYYY"/>
                                       		 </div>
                                           	<span style="color:red; font-size:2" id="endDateError"></span>
                                         </div>
                                        
                                        
                                        </div>
                                      
                                      
                                      <div class="form-group col-lg-2">
                                      	<div class="col-lg-9" style="">
                                            <label style="font-family: Calibri;color: gray;white-space: nowrap;" ><spring:message code="loyalty.no.cards.label" /><span style="color:red; font-size:2" id="conversion">*</span></label>
                                            <input type="text" class="form-control" style="opacity: 1.5; pointer-events: none;" readOnly name="noOfCards" id="noOfCards" value="${loyaltyCard.noOfCards}" oninput="this.value = this.value.replace(/[^0-9]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');"/>
                                     	
                                     	</div>
                                      	</div>
                                      
                                      <div class="col-lg-2" style="padding:0px; margin-top: -15px;">
                                           <br>
                                           <c:choose>
                                           <c:when test="${loyaltyCard.OTPRequirement =='true'}">
                                            <input type="checkBox" checked id="requiredOTP" name="requiredOTP" value="0" />
                                           </c:when>
                                           <c:otherwise>
                                            <input type="checkBox" id="requiredOTP" name="requiredOTP" value="1" />
                                           
                                           </c:otherwise>
                                           </c:choose>
                                           
                                           
                                            <label style="font-family: Calibri;color: gray;white-space: nowrap;"><spring:message code="crm.otp.required" /> </label>
<!--                                             <span style="color:red; font-size:2" id="errRewardConversionRatio"></span> -->
                                    	</div>
                                      
                                       <c:choose>
                                     
                                       <c:when test="${loyaltyCard.autoIssue ==true}">
                                      <input type="checkBox"  checked id="autoIssue" name="autoIssueFlag" value="0" />
                                       </c:when>
                                       <c:otherwise>
                                        <input type="checkBox"   id="autoIssue" name="autoIssueFlag" value="1" />
                                       </c:otherwise>
                                    	</c:choose>
                                    	  <label style="font-family: Calibri;color: gray;white-space: nowrap;"><spring:message code="autoIssue.label" /> </label>
                                      
                                     <%--  <div class="form-group col-lg-3">
										<div class="form-group col-lg-5" style="padding-right:10px;">
                                            <label style="font-family: Calibri;color: gray;white-space: nowrap;" style="white-space: nowrap;"><spring:message code="crm.purchase.range.label"  /> <span style="color:red; font-size:2">*</span></label>
                                            
                                            <input type="text" class="form-control"  name="purchaseRangeStart" placeholder="Start" id="purchaseRangeStart" value="${loyaltyCard.purchaseRangeStart}"/>
                                            <span style="color:red; font-size:2" id="errpriceRangeStart"></span>
                                        </div>
                                        <br>
                                          <div class="form-group col-lg-5" style="padding-left:10px;">
                                               <input type="text" class="form-control"  name="purchaseRangeEnd" placeholder="End" id=">purchaseRangeEnd" value="${loyaltyCard.purchaseRangeEnd}"/>
                                            <span style="color:red; font-size:2" id="errpriceRangeEnd"></span>
                                         </div>
                                       
                                        </div> --%>
                                      
									</div>
									
									
									<div class="row">
									<div class="form-group col-lg-4" style="margin-bottom: 0px;">
									
										<div class="form-group col-lg-12" style="padding:0px">
									<div class="form-group col-lg-4" style="margin-top: -15px;padding:0px">
                                            <label style="font-family: Calibri;color: gray;white-space: nowrap;"  style="white-space: nowrap;"><spring:message code="conversion.ratio.label" /> <span style="color:red; font-size:2" id="conversion">*</span></label>
                                            <input type="text" class="form-control"  name="rewardConversionRatio" id="rewardConversionRatio" value="${loyaltyCard.rewardConversionRatio}" oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');"/>
                                            <span style="color:red; font-size:2" id="errRewardConversionRatio"></span>
                                    	</div>
                                       
                                     <div class="form-group col-lg-2"></div>
                                     
                                     
									<div class="form-group col-lg-3" style="margin-top: -15px;padding-right:0px">
                                            <label style="font-family: Calibri;color: gray;white-space: nowrap;"  style="white-space: nowrap;"><spring:message code="minimumPoints.label" /><span style="color:red; font-size:2" id="points">*</span></label>
                                            <input type="text" class="form-control" name="minClaimPoints" id="minClaimPoints" value="${loyaltyCard.minClaimPoints}" oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');"/>
<!--                                             <span style="color:red; font-size:2" id="errRewardConversionRatio"></span> -->
                                    	</div>
                                    	 <div class="form-group col-lg-3"></div>
                                    	 </div>
                                    			<div class="form-group col-lg-12" style="padding:0px;margin-bottom: 0px;">
                                    	 
									<div class="form-group col-lg-3" style="white-sapce:nowrap;margin-top: -15px;padding:0px" >
                                    
                                    	<label style="font-family: Calibri;color: gray;white-space: nowrap;"><spring:message code="basePoints.label" /><span style="color:red; font-size:2" id="points">*</span></label>
                                    	 <input type="text" class="form-control"  name="basePoints" id="basePoints" value="${loyaltyCard.basePoints}" oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');"/>
                                    	  <span style="color:red; font-size:2" id="errbasePoints"></span>
                                    
                                     </div>
                                                                         	 <div class="form-group col-lg-3"></div>
                                     
                                       
									<div class="form-group col-lg-5" style="white-sapce:nowrap;margin-top: -15px;padding-right:0px" >
                                      
                                    	<label style="font-family: Calibri;color: gray;white-space: nowrap;"><spring:message code="minimumRedeemPoints.label" /><span style="color:red; font-size:2" id="points">*</span></label>
                                    	 <input type="text" class="form-control"  name="minRedeemPoints" id="minRedeemPoints" value="${loyaltyCard.minRedeemPoints}" oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');"/>
<!--                                     	  <span style="color:red; font-size:2" id="errbasePoints"></span> -->
                                    	
                                     </div>
                                                                         	 <div class="form-group col-lg-1"></div>
                                     
                                     </div>
                                     
                                     </div>
                                     
                                     
                                     
                                     
                                     
                                     
                                     
                                     
                                     
                                     
                                     
                                     <div class="form-group col-lg-4" style="margin-top: -1.25%;
    background: #c1c1c1;
    padding: 0px 1px;
    width: 30%;
    margin-left: 1.5%;" >
                                     	
                                     		<div class=" col-lg-12">
                                     		
                                     			<div class=" col-lg-3">
                                     			
                                     			 <label style="font-family: Calibri;white-space: nowrap;" ><spring:message code="minimumPoints.label" /></label>
                                            <input type="text" class="form-control"  id="minClaimPointsUpgrade" value="" oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');"/>
                                           <span style="color:red; font-size:2;font-weight: bold;" id="minClaimPointsUpgradepoints"></span> 
                                     			
                                     			</div>
                                     				<div class="col-lg-3">
                                     				
                                     				 <label style="font-family: Calibri;white-space: nowrap;"><spring:message code="maximumPoints.label" /></label>
                                            <input type="text" class="form-control"   id="maxClaimPointsUpgrade" value="" oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');"/>
                                           <span style="color:red; font-size:2;font-weight: bold;" id="errmaxClaimPointsUpgrade"></span> 
                                           
                                     				</div>
                                     			<div class=" col-lg-3" style="padding:0px">
                                            <label style="font-family: Calibri;white-space: nowrap;"><spring:message code="card.type.label" /></label><%-- "${loyaltyCard.loyaltyCardType" --%>
                                             <select class="form-control"  id="loyaltyCardTypeUpgrade">
	                                            <option value="Bronze" ${'Bronze' == loyaltyCard.loyaltyCardType ? 'selected' : ''}>Bronze</option>
	                                            <option value="Silver" ${'Silver' == loyaltyCard.loyaltyCardType ? 'selected' : ''}>Silver</option>
	                                            <option value="Techno" ${'Techno' == loyaltyCard.loyaltyCardType ? 'selected' : ''}>Techno</option>
	                                            <option value="Platinum" ${'Platinum' == loyaltyCard.loyaltyCardType ? 'selected' : ''}>Platinum</option>
	                                            <option value="Gold" ${'Gold' == loyaltyCard.loyaltyCardType? 'selected' : ''}>Gold</option>
	                                            <option value="General" ${'General' == loyaltyCard.loyaltyCardType? 'selected' : ''}>General</option>

                                            </select>
										</div>
                                     				
                                     				
                                     					<div class="col-lg-3" >
                                     					
                                     				 <label style="font-family: Calibri;white-space: nowrap;" ><spring:message code="customer.newfeedback.emptyspace" /> </label>
                                     					
                                     						 <input type="button" style="padding: 2px;width:160%" class="btnCls" style="" onclick="upgradeLoyaltyCards();" value="Upgrade" />
                                     					
                                     					
                                     					
                                     			
                                     					</div>
                                     		
                                     		
                                     		
                                     		</div>
                                     		<div class="form-group col-lg-12">
                                     		
                                     			<div class=" col-lg-3">
                                     			
                                     			<label style="font-family: Calibri;white-space: nowrap;" ><spring:message code="start.date.label" /></label>
                                    	  <input class="form-control" readonly="readonly" style="background-color: white;" value="" id="startdateUpgrade" size="20" type="text" onfocus="callCalender('startdateUpgrade')" onclick="callCalender('startdateUpgrade')" placeholder="DD/MM/YYYY"/>
                                    	
                                    	  <span style="color:red; font-size:2;;font-weight: bold;" id="errstartdateUpgrade"></span>
                                     			
                                     			</div>
                                     				<div class=" col-lg-3">
                                     				 <label style="font-family: Calibri;white-space: nowrap;"><spring:message code="end.date.label" /></label>
                                            	<input class="form-control" readonly="readonly" style="background-color: white;" value="" id="enddateUpgrade" size="20" type="text" onfocus="callCalender('enddateUpgrade')" onclick="callCalender('enddateUpgrade')" placeholder="DD/MM/YYYY"/>
                                           	<span style="color:red; font-size:2;;font-weight: bold" id="enddateUpgradeError"></span>
                                     				</div>
                                     				<div class=" col-lg-3" style="padding-left:0px">
                                     	                                     				 <label style="font-family: Calibri;white-space: nowrap;" >Price Range</label>
                                     			
                                    	 <input type="text" class="form-control"   id="pricerangeUpgrade" value="" oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');"/>
                                    	  <span style="color:red; font-size:2;;font-weight: bold;" id="pricerangeUpgradeerr"></span>
                                     			</div>
                                     		</div>
                                     </div>
                                     	
                                     	<div class="form-group col-lg-4" style="margin-top: -1.25%;
    background: #c1c1c1;
    padding: 0px 1px;
    width: 26%;
    margin-left: 4.5%;" >
                                     	
                                     		<div class=" col-lg-12">
                                     		 
                                                 <span id="errmaxpoints" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
                                                                               
                                     			<div class=" col-lg-4">
                                     			
                                     			 <label style="font-family: Calibri;white-space: nowrap;" ><spring:message code="minimumPoints.label" /></label>
                                            <input type="text" class="form-control"  id="minClaimPointsGenerate" value="" oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');"/>
                                           <span style="color:red; font-size:2;font-weight: bold;" id="errmin2points"></span> 
                                     			</div>
                                     				<div class="col-lg-4">
                                     				 <label style="font-family: Calibri;white-space: nowrap;"><spring:message code="maximumPoints.label" /></label>
                                            <input type="text" class="form-control"   id="maxClaimPoints" value="" oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');"/>
                                     				</div>
                                     				
                                     				 	<input type ="hidden" id="minClaimPoints" value="${minClaimPoints}">
                                     						
                                               <c:if test="${(minClaimPointsGenerate).val() == '' && (maxClaimPoints).val() == ''&& (enroledate).val() == ''&& (basePointsGenerate).val() == ''} ">
                                                      <div class="col-lg-4" >
                                     				 <label style="font-family: Calibri;white-space: nowrap;" ><spring:message code="customer.newfeedback.emptyspace" /> </label>
                                     						 <input type="button" style="padding: 2px;width:140%" readonly="readonly" class="btnCls" style="" onclick="generateConvertedpoints();" value="<spring:message code="generate.label" />" />
                                     					</div> 
                                                        </c:if>   
                            			
                                     					
                                     					
                                     					 <div class="col-lg-4" >
                                     				 <label style="font-family: Calibri;white-space: nowrap;" ><spring:message code="customer.newfeedback.emptyspace" /> </label>
                                     						 <input type="button" style="padding: 2px;width:140%" class="btnCls" style="" onclick="generateConvertedpoints();" value="<spring:message code="generate.label" />" />
                                     					</div> 
                                     		
                                     		
                                     		
                                     		</div>
                                     		<div class="form-group col-lg-12">
                                     		
                                     			<div class=" col-lg-4">
                                     			
                                     			<label style="font-family: Calibri;white-space: nowrap;" ><spring:message code="basePoints.label" /></label>
                                    	 <input type="text" class="form-control"   id="basePointsGenerate" value="" oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');"/>
                                    	  <span style="color:red; font-size:2;;font-weight: bold;" id="errbase2Points"></span>
                                     			
                                     			</div>
                                     				<div class=" col-lg-4">
                                     				
                                     				
                                     				 <label style="font-family: Calibri;white-space: nowrap;"><spring:message code="enrole.date" /></label>
                                          
                                            	<input class="form-control" readonly="readonly" style="background-color: white;" value="" id="enroledate" size="20" type="text" onfocus="callCalender('enroledate')" onclick="callCalender('enroledate')" placeholder="DD/MM/YYYY"/>
                                            
                                           	<span style="color:red; font-size:2;;font-weight: bold" id="enroledateError"></span>
                                     				
                                     				
                                     				</div>
                                     		
                                     		
                                     		</div>
                                     	
                                     </div>
                                     
                                     
                                    
                                     
                                     
                                     
									
									</div>
									
									
									</div>
									
									
									
								<div class="col-lg-12">
                                    	<br>
                                    	</div>	
									
									
					<div class="row">	
						<div class="col-lg-12" style="">
							<div class="col-lg-6" style="padding: 0px;">
								<div class="col-lg-12" style="padding: 0px;">
								 <div class="form-group col-lg-2" style="padding:0px;">
                                            <label style="font-family: Calibri;color: gray;white-space: nowrap;" style="white-space: nowrap;"><spring:message code="crm.reward.criteria.label" /></label>
                                            <div class="form-group col-lg-12" style="padding:0px;">
                                          <%--   ${loyaltyCard.rewardCriteria} --%>
                                             <select class="form-control" name="rewardCriteria" id="rewardCriteria" style="opacity: 1.5; pointer-events: none;" readonly>
	                                            <option value="Turn Over" ${'Turn Over' == loyaltyCard.rewardCriteria? 'selected' : ''}>Turn Over</option>
	                                            <option value="Others" ${'Others' == loyaltyCard.rewardCriteria? 'selected' : ''}>Others</option>
                                            </select>
                                            </div>
										</div> 
								
								 <div class="form-group col-lg-2" style="padding-right:0px;">
										<div class="form-group col-lg-12" style="padding:0px;">
                                            <label style="font-family: Calibri;color: gray;white-space: nowrap;" ><spring:message code="crm.purchase.range.label"  /> <span style="color:red; font-size:2">*</span></label>
                                            
                                            <input type="text" class="form-control"  name="purchaseRangeStart" placeholder="Start" id="purchaseRangeStart" value=""/>
                                            <span style="color:red; font-size:2" id="errpriceRangeStart"></span>
                                        </div>
                                        </div>
                                        
                                        <br>
                                        <div class="form-group col-lg-2" style="padding-left:0px">
                                          <div class="form-group col-lg-12" style="padding:0px;margin-left: 4px;">
                                               <input type="text" class="form-control"  name="purchaseRangeEnd" placeholder="End" id="purchaseRangeEnd" value=""/>
                                            <span style="color:red; font-size:2" id="errpriceRangeEnd"></span>
                                         </div>
                                       
                                        </div>
								
								<div class="form-group col-lg-2" style="padding:0px; margin-top: -19px;">
                                   	  <div class="col-lg-12" style="padding:0px;">
                                            <label style="font-family: Calibri;color: gray;white-space: nowrap;"><spring:message code="loyalty.reward.type.label" /></label>
                                       <%--     ${loyaltyCard.rewardType}  --%>
                                            <select class="form-control" onchange="changeRequiredField(this)" name="rewardType"  id="rewardType" style="" >
	                                            <option value="Fixed" ${'Fixed' == loyaltyCard.rewardType? 'selected' : ''}>Fixed</option>
	                                            <option value="Percentage" ${'Percentage' == loyaltyCard.rewardType? 'selected' : ''}>Percentage</option>
	                                            <%-- <option value="GiftItems" ${'GiftItems' == loyaltyCard.rewardType? 'selected' : ''}>Gift Items</option> --%>
                                            </select>
                                            </div>
                                        </div> 
								
								
								<div class="form-group col-lg-3" style=" margin-top: -19px;">
                                      	<div class="col-lg-12" style="padding:0px;">
                                            <label style="font-family: Calibri;color: gray;white-space: nowrap;"  style="white-space: nowrap;"><spring:message code="offer_reward_value.label" /> <span style="color:red; font-size:2" id="conversion">*</span></label>
                                            <input type="text" class="form-control"  name="" id="rewardValue" value="" oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');"/>
                                           <!--  <span style="color:red; font-size:2" id="errRewardConversionRatio"></span> -->
                                    	</div>
								
								</div>
								
								 <div class=" col-lg-1" style="margin-top: -7px;margin-left:-15px">
                                 <a onclick="addRewardranges();" style="font-size: 28px;">
                                  <i class="fa fa-plus-circle" aria-hidden="true"></i>
                                      </a>
                                       </div>
								
							</div>
							
							
							
						<div class="row">	
									
									<div class="col-lg-12" style="margin-top: -26px;">
                                   <!--  <div class="col-lg-6" style="padding: 0px;">   --> 
                                        <table id="rewardranges" class="table table-bordered table-striped" style="overflow-x: auto; table-layout: fixed;">
                                        <thead style="text-align:ceneter;background-color: #eeeeee !important;position: relative;display:block; table-layout: fixed;">
                                           <%--  <tr>
                                             
                                            	<th><spring:message code="s.no.label" /></th>
                                                <th><spring:message code="startvalue.label" /></th>
                                                <th><spring:message code="endvalue.label" /></th>
                                                 <th><spring:message code="loyalty.reward.type.label" /></th>
                                                 <th><spring:message code="offer_reward_value.label" /></th>
                                                <th><spring:message code="EmployeeForm.action" /></th>
                                            </tr> --%>
                                             <tr>
                                             
                                            	<%-- <th><spring:message code="s.no.label" /></th> --%>
                                            	<th style="width:19%">Criteria<%-- <spring:message code="crm.reward.criteria.label" /> --%></th>
                                                <th style="width:19%">Start Value</th>
                                                <th style="width:19%">End Value</th>
                                                <th style="width:19%"><spring:message code="loyalty.reward.type.label" /></th>
                                               <th style="width:19%"><spring:message code="offer_reward_value.label" /></th>
                                                <th style="width:19%"><spring:message code="EmployeeForm.action" /></th>
                                            </tr>
                                        </thead>
                                      <tbody style="text-align:ceneter;height: 100px;overflow-y: auto;overflow-x: auto;display:block; table-layout: fixed;">
                                        <c:forEach var="purchaseRange" items="${loyaltyCard.loyaltyPurcahseRanges}" varStatus="theCount">
                                           <tr id="dynamicdiv${theCount.index+1}">
                                          	   <%--  <td class='slno'>${theCount.index+1}</td> --%>
                                          	     <input type="hidden" class="slno" value="${theCount.index+1}"/>
                                          	     <input type="hidden" id="autoNumber${theCount.index+1}" value="${purchaseRange.sno}"/>
                                                <td style="width:19%" id="rewardCriteria${theCount.index+1}">${purchaseRange.rewardCriteria}</td>
                                                <td  style="width:19%" id="startvalue${theCount.index+1}">${purchaseRange.minPurchaseValue}</td>
                                                <td style="width:19%" id="endvalue${theCount.index+1}">${purchaseRange.maxPurchaseValue}</td>
                                                <td  style="width:19%" id="rewardType${theCount.index+1}">${purchaseRange.rewardType}</td>
                                                <td  style="width:19%" id="rewardValue${theCount.index+1}">${purchaseRange.rewardValue}</td>
                                                <td style="padding:5px;" id="Del${theCount.index+1}"><img id="Dele${theCount.count}" src="${pageContext.request.contextPath}/images/itemdelete.png" style="width:100%;cursor:pointer;" onclick="deleteItem(this);" title="Delete"/>
                                                <%-- <a id="Dele${theCount.index+1}" style=" text-decoration: underline;margin-left:3px;" onclick="deleteItem(this);" title="Delete">Delete</a> --%></td>
                							</tr>
                                            </c:forEach> 
                                       </tbody>
                                       
                                       
                                      </table> 
									</div>
								
							</div>	
							
							<div class="row">	
								<div class="col-lg-11" style=" margin-top: 19px;margin-left: 16px;">
									
									
									<%-- <label style="font-family: Calibri;color: gray;white-space: nowrap;" style="font-size: 16px;"><spring:message code="loyalty.locations.label" /></label>
									<hr style="margin-bottom: 2px;margin-top: 2px;"> --%>
										<div class="row" style="border-style:solid;border-color: #cccccc;    border-width: 1px">
										 <div class="form-group col-lg-6">
										
                                          <label style="font-family: Calibri;color: gray;white-space: nowrap;"><spring:message code="loyalty.country.label" /></label>
                                            	<select onchange="print_state('states',this.selectedIndex);" id="country" name = "country" class="form-control" >
											
												</select>
													
												
                                     	</div>
                                     		<input type="hidden" id="selectedCountry" value="${countries}"></input>
                                     	
                                        <div class="col-lg-6" style=""></div>
                                        
                                        
                                        
                                      <div class="row">
                                     	<div class="col-lg-12">  
                                    	<div class="form-group col-lg-5" style="">
                                    		<label style="font-family: Calibri;color: gray;"><spring:message code="zone.label" /> <span style="color:red; font-size:2">*</span></label>
                                           
                                           <select id ="zone" name="zone" multiple="multiple" class="form-control" >
    										    
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
    										
                                     	</div>
                                     	<div class="form-group col-lg-5">
                                            <label style="font-family: Calibri;color: gray;white-space: nowrap;"><spring:message code="card.description.label" /></label>
                                            <textarea style="resize:none" class="form-control"  name="loyalityProgramDescription" id="loyalityProgramDescription" rows="4" >${loyaltyCard.loyaltyProgramDescription}</textarea>
                                     	</div>
									  </div>
								
								
								
								  </div>
									  
									  
							</div>		  
								</div>	  
									</div>  
									  </div>
							
							
						<input type="hidden" name="items" id="itemDetails">	
						<input type="hidden" name="deletePlusItem" id="deleteditemDetails">	
						<input type="hidden" name="loyaltyCardsIdsstr" id="loyaltyCardsIds">	
						<input type="hidden" name="customerLoyaltyCardsIdsstr" id="customerLoyaltyCardsIds">	
						<input type="hidden" name="loyaltyZonesdetails" id="loyaltyZoneDetails">	
						<input type="hidden" name="customerLoyaltyCardsitems" id="customerLoyaltyCardsDetails">	
					    <input type="hidden" name="loyaltyCardsdetails" id="loyaltyCardsdetails">	
					
						
						
					
					
						<div class="col-lg-6" style="">
									<div class="col-lg-12" style="padding-left:0px;">
										<label style="font-family: Calibri;color: gray;" style="font-size: 16px;"><spring:message code="crm.loyality.cards.generated.label" /></label>
									</div>
									<div class="col-lg-12" style="padding-left:0px;">
									
										<div class="row" style="margin-top: 1.5%"> 
								 			
								 
								   <div class="form-group col-lg-6" style="text-align:center;  margin-bottom: 0.3%;    ;">
										<input type="text"  class="form-control searchItems" id="searchItems"  placeholder="Search Loyalty cards here.."   style="height:30PX;text-align:left;background:url(${pageContext.request.contextPath}/images/search.png) no-repeat;background-position:right;" />
											<div class="services">
						    					<div class="items">
						     						<ul class="matchedStringUl searchLoyaltyItems" style=""></ul>
						   						</div>
											</div>
									</div>
									<div class="form-group col-lg-1" style="padding: 0px;text-align:center;  margin-bottom: 0.3%;">
									 <input type="button" onclick="searchLoyaltyCards('',0,true)" class="btn bg-olive btn-inline  addBtn" value="SAVE">
									</div>
									
									<div class="col-lg-3" style="padding-right: 0px;margin-bottom: 5px;">
										<input type="file" class="btn bg-olive btn-inline" accept=".xlsx" title="To import, Choose the valid Exel Sheet format" style="height: 30px;display: inline-block;padding: 3px !important;width: 100%;" id="loyaltycards" name="uploadedfilePath" onchange="addNameToTextBox('loyaltycards');" /> 
										<input type="hidden" id="coupons_refId"  /> 
										<input type="hidden" id="coupons_name" />
                                    	</div>
                                    	<div class="col-lg-2" style="padding-right: 0px;">
                                    	<input type="button" class="btnCls" style="width: 100%;font-size: 15px;padding: 4px 4px;" onclick="importDataxls()" value="Import">
                                    	</div>
									
									
									
									
									</div>
									</div>
									
									
									<c:set var="TotalCount" value="0"></c:set>
									
									
									
									
									
									<c:forEach var="loyaltyZonesInfo" items="${loyaltyCard.loyaltyZones}" varStatus="theCount">
							              		<input type="hidden"  id="states${theCount.count}" value="${loyaltyZonesInfo.states}">	
                         						<input type="hidden"  id="loyaltyZoneDescription${theCount.count}" value="${loyaltyZonesInfo.loyaltyZoneDescription}">	
                         				<c:set var="TotalCount" value="${TotalCount+1}"></c:set>		
									</c:forEach>
									
									
									<input type="hidden" id="lengthofzone" value="${TotalCount}" >
									
									
							<div id="generatedLoyaltyCards">
									
									
					 <div id="example1_wrapper" class="dataTables_wrapper form-inline" role="grid" style="overflow-x: auto;width:100%;position: relative;white-space: nowrap;">
                     <table id="cardDetails" class="table table-bordered table-striped">
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
                             	<th><spring:message code="claim.status.label" /></th>
                             	
                             	  <th><div style="width: 100px;">Action</div></th>
                             	
                         
                              
                             </tr>
                         </thead>
                         <tbody style="text-align: center;">
                         <c:forEach var="loyalityCardInfo" items="${loyaltyCard.loyaltyCards}" varStatus="theCount">
                         <tr>
                         <td>${theCount.count}</td>
                         <td id="loyaltyCardNumber${theCount.count}">${loyalityCardInfo.loyaltyCardNumber}</td>
                         
                          <c:set var="inside4" value="0"></c:set> 
                                                  <c:forEach var="customerLoyaltyCardsInfo" items="${loyaltyCard.customerLoyaltyCards}" >
                                                  
                                 <c:if test="${loyalityCardInfo.loyaltyCardNumber==customerLoyaltyCardsInfo.loyaltyCardNumber}">
                                         
                         						<input type="hidden"  id="email${theCount.count}" value="${loyaltyCard.customerLoyaltyCards[theCount.count].email}">	
                         						<input type="hidden"  id="idCardNumber${theCount.count}" value="${loyaltyCard.customerLoyaltyCards[theCount.count].idCardNumber}">	
                         						<input type="hidden" id="idCardType${theCount.count}" value="${loyaltyCard.customerLoyaltyCards[theCount.count].idCardType}">	
                         						<input type="hidden"  id="cash${theCount.count}" value="${loyaltyCard.customerLoyaltyCards[theCount.count].cash}">	
                         						<input type="hidden"  id="pointsUsed${theCount.count}" value="${loyaltyCard.customerLoyaltyCards[theCount.count].pointsUsed}">	
                         						<input type="hidden"  id="pointsEarned${theCount.count}" value="${loyaltyCard.customerLoyaltyCards[theCount.count].pointsEarned}">	
                         						<input type="hidden"  id="statuscustomer${theCount.count}" value="${loyaltyCard.customerLoyaltyCards[theCount.count].status}">	
                         						<input type="hidden"  id="issuedOnStr${theCount.count}" value="${loyaltyCard.customerLoyaltyCards[theCount.count].issuedOnStr}">
                         						<input type="hidden"  id="issuedToStr${theCount.count}" value="${loyaltyCard.customerLoyaltyCards[theCount.count].issueToStr}">	
                         						 <input type="hidden"  id="cardId${theCount.count}" value="${loyaltyCard.customerLoyaltyCards[theCount.count].cardId}">	
                         							
                         					                          <c:set var="inside4" value="1"></c:set> 
                         						
                         						
                         						  </c:if>      										
								</c:forEach>
								
								<c:if test="${inside4 == 0}">
                                         
                         						<input type="hidden"  id="email${theCount.count}" value="">	
                         						<input type="hidden"  id="idCardNumber${theCount.count}" value="">	
                         						<input type="hidden" id="idCardType${theCount.count}" value="">	
                         						<input type="hidden"  id="cash${theCount.count}" value="">	
                         						<input type="hidden"  id="pointsUsed${theCount.count}" value="">	
                         						<input type="hidden"  id="pointsEarned${theCount.count}" value="">	
                         						<input type="hidden"  id="statuscustomer${theCount.count}" value="">	
                         						<input type="hidden"  id="issuedOnStr${theCount.count}" value="">
                         						<input type="hidden"  id="issuedToStr${theCount.count}" value="">	
                         						 <input type="hidden"  id="cardId${theCount.count}" value="">	
                         							
                         					                       
                         						
                         						
                         						  </c:if>   
								
								
								
								
								
								
									
                         <c:set var="inside3" value="0"></c:set> 
                         <c:forEach var="customerLoyaltyCardsInfo" items="${loyaltyCard.customerLoyaltyCards}" >
                                                  
                                 <c:if test="${loyalityCardInfo.loyaltyCardNumber==customerLoyaltyCardsInfo.loyaltyCardNumber}">
                          <td ><input class="form-control Number${theCount.count}"
																		type="text" value="${customerLoyaltyCardsInfo.phoneNum}"
																		readonly="readonly" id="Number${theCount.count}" /></td>
																		 <c:set var="inside3" value="1"></c:set> 
																		 </c:if>    
																		     										
								</c:forEach>	
							<c:if test="${inside3==0}">
                          <td ><input class="form-control Number${theCount.count}"
																		type="text" value=""
																		readonly="readonly" id="Number${theCount.count}" /></td>
																		
									</c:if> 
								
							<input type="hidden" id="assignedCustId${theCount.count}" value="${loyalityCardInfo.assignedCustId}">	
																		
														
						<c:set var="inside" value="0"></c:set>    						
						<c:forEach var="customerLoyaltyCardsInfo" items="${loyaltyCard.customerLoyaltyCards}" >
                                            
                                 <c:if test="${loyalityCardInfo.loyaltyCardNumber==customerLoyaltyCardsInfo.loyaltyCardNumber}">						
																		
                          				<td><input class="form-control Name${theCount.count}"
																		type="text" value="${customerLoyaltyCardsInfo.customerName}"
																		readonly="readonly" id="Name${theCount.count}" /></td>
																		
									<c:set var="inside" value="1"></c:set>  							
								</c:if>    
									
							</c:forEach>
								<c:if test="${inside==0}">
                 					<td><input class="form-control Name${theCount.count}" type="text" value=""
																		readonly="readonly" id="Name${theCount.count}" /></td>
								</c:if>							
																		
																		
								<c:set var="inside2" value="0"></c:set> 										
					  <c:forEach var="customerLoyaltyCardsInfo" items="${loyaltyCard.customerLoyaltyCards}" >
                                                  
                                 <c:if test="${loyalityCardInfo.loyaltyCardNumber==customerLoyaltyCardsInfo.loyaltyCardNumber}">																			
																		
																		
																		
                          <td><input class="form-control AvailPoints${theCount.count}"
																		type="text" value="${customerLoyaltyCardsInfo.pointsRemaining}"
								
																		readonly="readonly" id="AvailPoints${theCount.count}" /></td>
							<c:set var="inside2" value="1"></c:set> 
							</c:if>
																	 
							
								</c:forEach>
								<c:if test="${inside2==0}">
                 									
								  <td><input class="form-control AvailPoints${theCount.count}"
																		type="text" value="" readonly="readonly" id="AvailPoints${theCount.count}" /></td>
								
								</c:if>
																		
                         <td  id="loyaltyCreatedDate${theCount.count}">${loyalityCardInfo.startDateStr}</td>
                         <td  id="loyaltyUpdatedDate${theCount.count}">${loyalityCardInfo.endDateStr}</td>
                       
                             <td >  
                                     <select class="form-control"  id="assignedStatus${theCount.count}" disabled="disabled" >
	                                            <option value="false" ${'false' == loyalityCardInfo.assignedStatus? 'selected' : ''}>InActive</option>
	                                            <option value="true" ${'true' == loyalityCardInfo.assignedStatus? 'selected' : ''}>Active</option>
                                            </select>
                           
                            </td>
                            <td>
                             <select class="form-control"  id="statusofCard${theCount.count}" disabled="disabled" >
	                                            <option value="false" ${'false' == loyalityCardInfo.cardStatus? 'selected' : ''}>InActive</option>
	                                            <option value="true" ${'true' == loyalityCardInfo.cardStatus? 'selected' : ''}>Active</option>
                                            </select>
                            
                            
                            
                            
                            </td>
                       
                       
                  							                   <td id="Edit${theCount.count}"><a
																	style="color: #2e7ea7 !important; cursor: pointer;"
																	onclick="return editLoyaltyCard('${theCount.count}')">Edit</a>

                                                                 <%-- <a style="color: #2e7ea7 !important; cursor: pointer;margin-left :15px"
																	onclick="return editLoyaltyCard('${theCount.count}')">Convert</a> --%>

																</td>

															</tr>
                         </c:forEach>
                         </tbody>
                     </table>
                     </div>
									
									
									
									
									 <div class="col-lg-12">
                  
                  
                  <c:if test="${index-1 == 0 && totalRecords >maxRecords}">
              		<div class="form-group col-lg-6" style="text-align: left;">
              		<input type="button" class='paginationButton' value="&#60;" onclick=""> ${index} - ${totalValue} of ${totalRecords} 
              		<input type="button" class='paginationButton' value="&#62;" onclick="searchLoyaltyCards('','${totalValue}',false)">
              	</div>
              	</c:if>
              	
              	<c:if test="${totalValue == totalRecords}">
              			<c:if test="${totalValue-maxRecords >0}">
              				<div class="form-group col-lg-6" style="text-align: left;">
              		<input type="button" class='paginationButton' value="&#60;" onclick="return searchLoyaltyCards('','${index - (maxRecords + 1)}',false)"> ${index} - ${totalValue} of ${totalRecords} 
              		<input type="button" class='paginationButton' value="&#62;" >
              		</div>
              			</c:if>
              			<c:if test="${totalValue-maxRecords <= 0}">
              		<div class="form-group col-lg-6" style="text-align: left;">
              		<input type="button" class='paginationButton' value="&#60;"> ${index} - ${totalValue} of ${totalRecords} 
              		<input type="button" class='paginationButton' value="&#62;" >
              	</div>
              	</c:if>
              	</c:if>
              	<c:if test="${index-1 != 0 &&  totalValue != totalRecords}">
              		<div class="form-group col-lg-6" style="text-align: left;">
              		<input type="button" class='paginationButton' value="&#60;" onclick="return searchLoyaltyCards('','${index - (maxRecords + 1)}',false) ;"> ${index} - ${totalValue} of ${totalRecords} .
              		<input type="button" class='paginationButton' value="&#62;" onclick="searchLoyaltyCards('','${totalValue}',false)">
              	</div> 
              	</c:if>
              	
              	
                  
                  
                  <div class="col-lg-6" style="float:right;">
              	<div class="col-lg-4" style="text-align: right;padding-right: 0px;margin-top: 2px;font-size: 16px;"><spring:message code="pages.label" /></div>
              	<div class="col-lg-4" style="padding-right: 0px;">
              		<select class="form-control" id="pagination">
              		<c:set var="totalRecords" value="${totalRecords}"></c:set>
              	<c:forEach var="i" begin="0" end="${totalRecords}">
              	<c:if test="${(totalRecords)>0}">
              		<option value="${(i*maxRecords)}" ${index-1 == i*maxRecords ? 'selected' : ''}> ${i+1}</option>
              		<c:set var="totalRecords" value="${totalRecords-maxRecords}"></c:set>
              	</c:if>
				</c:forEach>
					</select>
              	
              	</div>
              		<div class="col-lg-4" style="padding-right: 0px;">
              		  <input type="button" onclick="searchLoyaltyCards('',document.getElementById('pagination').value,false);" class="btn bg-olive btn-inline  addBtn" value="GO">
              		</div>
             
				</div>
                  </div> 
									
									
									
									  </div>
									  
									  
									  
									  
									   
                 
									  
									  
									  
									  
									  
									  
									  
									  
									  
									  
					</div>	
						
						
				</div>
									
									
									
									
									
									
									<div class="row">
									
									<%-- <div class="form-group col-lg-3">
									 <div class="col-lg-5" style="padding:0px;">
                                            <label style="font-family: Calibri;color: gray;white-space: nowrap;" style="white-space: nowrap;"><spring:message code="loyalty.rewards.life.time.label" /></label>
                                            <input type="text" class="form-control"  name="rewardLifeTime" id="rewardLifeTime" value="${loyaltyCard.rewardLifeTime}" oninput="this.value = this.value.replace(/[^0-9]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');"/>
                                     	</div>
                                     	</div> --%>
                                      	
                                      	<%-- <div class="form-group col-lg-2">
                                      	<div class="col-lg-7" style="padding:0px;">
                                            <label style="font-family: Calibri;color: gray;white-space: nowrap;"><spring:message code="loyalty.no.cards.label" /></label><span style="color:red; font-size:2" id="conversion">*</span>
                                            <input type="text" class="form-control" style="opacity: 1.5; pointer-events: none;" readOnly name="noOfCards" id="noOfCards" value="${loyaltyCard.noOfCards}" oninput="this.value = this.value.replace(/[^0-9]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');"/>
                                     	
                                     	</div>
                                      	</div> --%>
                                      	
                                      	<%-- <div class="form-group col-lg-4">
                                      	<div class="col-lg-6" style="padding-right:10px;">
                                            <label style="font-family: Calibri;color: gray;white-space: nowrap;"  style="white-space: nowrap;"><spring:message code="loyalty.rewards.conversion.ratio" /> <span style="color:red; font-size:2" id="conversion">*</span></label>
                                            <input type="text" class="form-control"  name="rewardConversionRatio" id="rewardConversionRatio" value="${loyaltyCard.rewardConversionRatio}" oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');"/>
                                            <span style="color:red; font-size:2" id="errRewardConversionRatio"></span>
                                    	</div> --%>
                                    	
                                    		<%-- <div class="col-lg-6" style="padding-left: 30px;">
                                           <br>
                                           <c:choose>
                                           <c:when test="${loyaltyCard.OTPRequirement =='true'}">
                                            <input type="checkBox" checked id="requiredOTP" name="requiredOTP" value="0" />
                                           </c:when>
                                           <c:otherwise>
                                            <input type="checkBox" id="requiredOTP" name="requiredOTP" value="0" />
                                           
                                           </c:otherwise>
                                           </c:choose>
                                           
                                           
                                            <label style="font-family: Calibri;color: gray;white-space: nowrap;"><spring:message code="crm.otp.required" /> </label>
<!--                                             <span style="color:red; font-size:2" id="errRewardConversionRatio"></span> -->
                                    	</div> --%>
                                    	
                                    	
<%--                                     	${loyaltyCard.status} --%>
                                    	<%-- <div class="form-group col-lg-3" style="">
                                    	<div class="col-lg-7" >
                                            <label style="font-family: Calibri;color: gray;white-space: nowrap;"><spring:message code="loyalty.status.label" /><!--  <span style="color:red; font-size:2">*</span> --></label>
                                             <select class="form-control" name="status" id="status">
	                                            <option value="true" ${'true' == loyaltyCard.status? 'selected' : ''}>Active</option>
	                                            <option value="false" ${'false' == loyaltyCard.status? 'selected' : ''}>InActive</option>
                                            </select>
                                    	</div>
                                    
									</div> --%>
									
										<div class="col-lg-12">
									
									<br>
									</div>
									
									<div class="col-lg-12">
									<br>
									</div>
								
							
									  
                                    <%--  <input type="hidden" id="selectedStateList"  value="${statesList}"> --%>
                                    </div>
                                    
									<div class="col-lg-12">
									
									<br>
									</div>
									
									<div class="col-lg-12">
									<br>
									</div>
				
					<br/>
               </div>
               
					
						 
						 <%-- <div class="row" style="text-align: right;">
							<input type="button" class="btn bg-olive btn-inline" style="margin-right: 2%;" onclick="viewLoyaltyCards('loyaltyCards','Loyaltycards','0','menu');" value="<spring:message code="back.label" />" />
						</div>	 --%>
						
						<div class="row" style="text-align: center;">
					 <c:if test="${sessionScope.role == 'super admin'}"> 
					 							 <input type="button" class="btnCls" style="" onclick="validateLoyaltyCards('edit')" value="<spring:message code="submit.label" />" />
					 	
					 	<input type="button" class="btnCls" style="" onclick="viewLoyaltyCards('loyalitycards','Loyaltycards','0','menu');" value="<spring:message code="cancel.label" />" />
					 </c:if>
					<c:forEach var="accessControl" items="${sessionScope.CustomerLoyality}">
                         <c:if test="${accessControl.appDocument == 'Loyaltycards' && accessControl.write == true && accessControl.read == true}">	
						 <input type="button" class="btnCls" style="" onclick="validateLoyaltyCards('edit')" value="<spring:message code="submit.label" />" />
							
							<input type="button" class="btnCls buttonMargin" style="" onclick="viewLoyaltyCards('loyalitycards','Loyaltycards','0','menu');" value="<spring:message code="cancel.label" />" />
						</c:if>
					</c:forEach>
						</div>
								
						
									<br/>
                                    <div class="box-footer">
                                     
                                    </div>
                                </form>
                            </div>
                            
</div>
</div>
</section><!-- /.content -->
  <!-- InputMask -->
        <script src="${pageContext.request.contextPath}/js/plugins/input-mask/jquery.inputmask.js" type="text/javascript"></script>
        <script src="${pageContext.request.contextPath}/js/plugins/input-mask/jquery.inputmask.date.extensions.js" type="text/javascript"></script>
      <%--   <script src="${pageContext.request.contextPath}/js/plugins/input-mask/jquery.inputmask.extensions.js" type="text/javascript"></script>
         <script src="${pageContext.request.contextPath}/js/plugins/datatables/jquery.dataTables.js" type="text/javascript"></script>
        <script src="${pageContext.request.contextPath}/js/plugins/datatables/dataTables.bootstrap.js" type="text/javascript"></script>
         --%>
            <script type="text/javascript">
          
         
           
            </script>
</body>
</html>