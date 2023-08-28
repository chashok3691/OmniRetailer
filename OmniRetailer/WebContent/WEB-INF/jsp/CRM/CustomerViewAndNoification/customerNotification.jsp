<!--/*
 * Project Name 	        : OmniRetailerCustomer
 * Written By		        : Mythri
 * file name		        : Inventory Manager/loyaltyPrograms/customerNotifications.jsp
 * file type		        : JSP
 * description				: The new employee form is displayed using this jsp
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
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/jquery.calendars.picker.css">
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.calendars.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.calendars.plus.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.calendars.picker.js"></script>
	<script type= "text/javascript" src = "${pageContext.request.contextPath}/js/controller.js"></script>
	<script type= "text/javascript" src = "${pageContext.request.contextPath}/js/countriesAndStates.js"></script>
	<script type= "text/javascript" src = "${pageContext.request.contextPath}/js/crm/customerNotification.js"></script>

<style type="text/css">
	
.calendar_icon{
	background-color: white;
    color: #666;
    padding: 8px 0px 8px 27px!important;
    background: url(http://soe.syr.edu/images/cal_icon_mini.gif) no-repeat left center #fff;
    width: 100%;
    background-position: 5px 5px;
    border: 1px solid #DFDFDF;
    border-radius: 4px;
    -webkit-transition: all .2s ease-out;
    -moz-transition: all .2s ease-out;
    -ms-transition: all .2s ease-out;
    transition: all .2s ease-out;
    box-shadow: none;
    -webkit-box-sizing: border-box;
    -moz-box-sizing: border-box;
    box-sizing: border-box;
}
.buttons {
	/* float: right; */
	padding-top: 0px;
	/* margin-right: 2%; */
	/* margin-top:1%; */
}
a.button, .list a.button {
position:relative;
	text-decoration: none;
	color: black;
	display: inline-block;
	padding: 5px 10px 5px 10px;
	background: rgb(195,195,195);
	border-radius: 5px;
	box-shadow:1px 0px 2px #000;
	cursor:pointer;
	behavior : url(css/PIE.htc); 
}	

</style>
<script type="text/javascript">
$(document).ready(function(){
	$(".subBlock").hide();
	$(".greetings").css("display","block");
	print_country("country");
	callCalender('fromDate');
	callCalender('endDate');
	callCalender('dealsStartDate');
	callCalender('dealsEndDate');
	callCalender('offersStartDate');
	callCalender('offersEndDate');
	callCalender('periodicStartDate');
	callCalender('periodicEndDate');
	callCalender('arrivalEndDate');
	callCalender('outletEndDate');
});
</script>
</head>
<body>
<section class="content">
<div class="row">
  <div class="col-xs-12">
	<div class="box box-primary">
		 <%-- <div class="box-header" style="text-align: center">
		   <h3><spring:message code="customer.view.label" /></h3>
		 </div> --%><!-- /.box-header -->
    <!-- form start -->
    <form id="customersInfo" method="post">
        <div class="box-body">
        <br>
        <div id="Error" style="text-align: center;color: red;font-size: 2;font-weight: bold;">${err}</div>
        <div class="row">
         <div class="col-lg-6">
           <div class="row">
        	 	<div class="form-group col-lg-6">
        	 		<label><spring:message code="country.label" /></label>
                	  <select onchange="print_state('states',this.selectedIndex);" id="country" name ="country" class="form-control" >
						<option value="Select Country" >Select Country</option>
					  </select>
        	 	</div>
        	 	<div class="form-group col-lg-6">
        	 		<label><spring:message code="customer.type.label" /></label>
                	  <select id="customerType" name ="customerType" class="form-control" >
                	  	<option value="-- Select --" >ALL</option>
                	  	<option value="PREMIUM" >PREMIUM</option>
                	  	<option value="PLUS" >PLUS</option>
                	  	<option value="BASIC" >BASIC</option>
                	  	<option value="GENERIC" >GENERIC</option>
						<!-- <option >Select Country</option> -->
					  </select>
        	 	</div>
        	 </div>
             <div class="row">
        	 	<div class="form-group col-lg-6">
        	 		 <label><spring:message code="region.label" /></label>
						 <select id ="states" class="form-control" >
						 	<option value="Select State" >Select State</option>
						</select>
        	 	</div>
        	 	<div class="form-group col-lg-6">
        	 		<label><spring:message code="age.label" /></label>
                	  <select id="age" name ="age" class="form-control" >
						<option value="-- Select --" >ALL</option>
						<option value="1-12" >1 to 12</option>
						<option value="13-19" >13 to 19</option>
						<option value="20-30" >20 to 30</option>
						<option value="31-40" >31 to 40</option>
						<option value="41-50" >41 to 50</option>
						<option value="51-60" >51 to 60</option>
						<option value="61-100" >61 and above</option>
					  </select>
        	 	</div>
        	 </div>
        	 <div class="row">
        	 	<div class="form-group col-lg-6">
        	 		 <label><spring:message code="city.label" /></label>
        	 		 <input type="text" id="city" class="form-control">
						<!--  <select id ="city" class="form-control" >
							<option >Select State</option>
						</select> -->
        	      <span id="cityError" style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
        	 	</div>
        	 	<div class="form-group col-lg-6">
        	 		<label><spring:message code="gender.label" /></label>
                	  <select id="gender" name ="gender" class="form-control" >
						<option value="-- Select --" >ALL</option>
						<option value="Male" >Male</option>
						<option value="Female" >Female</option>
					  </select>
        	 	</div>
        	 </div>
           </div>
		   <div class="col-lg-6" style="border-left-color: green;border-left-width: 1px;border-left-style: solid;">
	           <div class="row">
        	 	<div class="form-group col-lg-6">
        	 		<label><spring:message code="product.category.label" /></label>
                	  <select id="productCategory" onchange="emptyProduct();" name ="productCategory" class="form-control" >
                	  	<option value="-- Select --" >ALL</option>
                	  	 <c:forEach var="category" items="${categoryList}">
							<option value="${category.categoryName}">${category.categoryDescription}</option>
						 </c:forEach>
					  </select>
        	 	</div>
        	 	<div class="form-group col-lg-6">
        	 		<label><spring:message code="from.date.label" /></label>
                	<input class="form-control calendar_icon" readonly="readonly" style="background-color: white;" id="fromDate" onfocus="callCalender('fromDate')" onclick="callCalender('fromDate')" placeholder="DD/MM/YYYY"/>
        	 	</div>
        	 </div>
             <div class="row">
        	 	<div class="form-group col-lg-6">
        	 		 <label><spring:message code="product.label" /></label>
        	 		 <input type="text"  class="form-control searchItems" id="searchItems" placeholder="<spring:message code="search.product.label" />" style="height:30PX;border-radius: 6px !important;background:url(${pageContext.request.contextPath}/images/search.png) no-repeat;background-position:right;" />
						<div class="services">
			    			<div class="items">
			     				<ul class="matchedStringUl product" style=""></ul>
			   				</div>
						</div>
						<input type="hidden" id="product">
						 <!-- <select id ="product" class="form-control" >
							<option value="-- Select --" >-- Select --</option>
						</select> -->
        	 	</div>
        	 	<div class="form-group col-lg-6">
        	 		<label><spring:message code="to.date.label" /></label>
                	<input class="form-control calendar_icon" readonly="readonly" style="background-color: white;" id="endDate" onfocus="callCalender('endDate')" onclick="callCalender('endDate')" placeholder="DD/MM/YYYY"/>
        	 	</div>
        	 </div>
        	 <div class="row">
        	 	<div class="form-group col-lg-6">
        	 		 <label><spring:message code="price.range.label" /></label>
						 <select id ="priceRange" class="form-control" >
							<option value="-- Select --" >ALL</option>
						</select>
        	 	</div>
        	 	<div class="form-group col-lg-6">
        	 		<label><spring:message code="purchase.channel.label" /></label>
                	  <select id="purchaseChannel" class="form-control" >
                	  	 <option value="-- Select --" >ALL</option>
                	  	 <option value="Direct" >Direct</option>
                	  	 <option value="Telephone" >Telephone</option>
                	  	 <option value="Online" >Online</option>
                	  	  <option value="Mobile" >Mobile</option>
                	  	 <option value="Sales Personnel" >Sales Personnel</option>
					  </select>
        	 	</div>
        	 </div>                   
	       </div>
         </div>
       	  <div class="row" >
               <div class="col-lg-12"  >
               <div class="form-group col-lg-2" style="padding-left: 1px;padding-right: 1px;margin-top: 8px;cursor: pointer;margin-bottom: 0px;" onclick="activateHeader('greetings');" ><span style="font-weight: bold;font-size: 16px;color:#666;cursor: pointer;"><spring:message code="send.greetings.label" /></span></div>
                <div class="form-group col-lg-10" style="margin-bottom: 4px;">
               	<img class="headerImg" style="float: right;cursor: pointer;margin-right: -16px;margin-top: 0px;margin-bottom: -26px" onclick="activateHeader('greetings');" id="greetingsImg" alt="" src="${pageContext.request.contextPath}/images/rightHeaderIconGreen.png">
                </div> 
               <hr style="margin-top: 31px;width: 100%;border-top: 1px solid rgb(181,230,29);" />
               <hr style="margin-top: -18px;width: 100%;border-top: 1px solid rgb(181,230,29);" />
               </div>
           </div>
             <div class="greetings subBlock">
             	<div class="row">
             		<div class="col-lg-1"></div>
             		<div class="col-lg-3">
             			<input type="text" class="form-control searchItems" name="greetingsBatchName" id="greetingBatch" placeholder="<spring:message code="batch.name.label" />"  style="background:url(${pageContext.request.contextPath}/images/downIcon.png) no-repeat;background-position:right;background-size: 23px;" />
             			<input type="hidden" id="greetingFilterId">
						<div class=services>
					    		<div class="items">
					     			<ul class="matchedStringUl greeting" id="greetingBatchUl" style="width: 89%!important;padding: 0px!important;">
					     			 <c:forEach var="greetingsBatchName" items="${greetingsBatchNameList}" varStatus="theCount">
										<c:if test="${theCount.count == '1'}">
											<li id="${greetingsBatchName.filterId}"  class="selected" onclick="getCode(this,'greeting');" ><a class="greetingPackageName">${greetingsBatchName.batchName}</a></li>
										</c:if>
										<c:if test="${theCount.count != '1'}">
											<li id="${greetingsBatchName.filterId}"  onclick="getCode(this,'greeting');" ><a class="greetingPackageName">${greetingsBatchName.batchName}</a></li>
										</c:if>
									 </c:forEach>
					     			</ul>
					   			</div>
							</div>
						<span id="greetingBatchError" style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
             		</div>
             		<div class="col-lg-5" style="text-align: center;">
                      	<input type="radio" name="greetingsOption" onclick="displayMessageBox('all','greeting');" id="greetingall" style="vertical-align: -2px" value="all"><spring:message code="customer.notification.all.label" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
       					<input type="radio" name="greetingsOption" onclick="displayMessageBox('sms','greeting');" id="greetingsms" style="vertical-align: -2px" value="sms" checked="checked"><spring:message code="customer.notification.sms.label" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
       					<input type="radio" name="greetingsOption" onclick="displayMessageBox('mail','greeting');" id="greetingmail" style="vertical-align: -2px" value="mail"><spring:message code="customer.mail.id.label" />
             		</div>
             		<div class="col-lg-2" style="font-size: 15px;text-align: right;padding-top: 5px;">
             			<spring:message code="enabled.label" />&nbsp;&nbsp;&nbsp; <input type="checkbox" onclick="setBatchStatus(this);" checked="checked" style="vertical-align: -2px" id="greetingEnabled"/>
             		</div>
             		<div class="col-lg-1"></div>
             	</div>
             	<div class="row">
             		<div class="col-lg-1"></div>
             		<div class="form-group col-lg-3" style="font-size: 15px;">
             			<br>
             			<input type="checkbox" checked="checked" onclick="setSubCategoryStatus(this);" name="greetingEnabled" style="vertical-align: -2px" id="birthdayEnabled"/>&nbsp;&nbsp;&nbsp;<spring:message code="service.enablement.label" />
             		</div>
             		<div class="form-group col-lg-7 greetingSMS"  id="birthDaySms">
	           			<label><spring:message code="birth.day.label" /></label>
			            <textarea rows="1" id="birthdayMsg" style="resize: none;" class="form-control" placeholder="<spring:message code="enter.festivals.label" />" ></textarea>
             		    <span id="birthdayMsgError" style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
             		</div>
             	   <div class="form-group col-lg-2 greetingSub" style="display: none;">
             	   		<label><spring:message code="birth.day.label" /></label>
             	   		<textarea rows="1" id="birthdayMailSub" style="resize: none;" class="form-control" placeholder="<spring:message code="enter.sub.label" />" ></textarea>
             	     <span id="birthdayMailSubError" style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
             	   </div>
             	   <div class="form-group col-lg-5 greetingMail" style="display: none;">
             	   		<label> </label>
             	   		<textarea rows="1" id="birthdayMailMsg" style="resize: none;" class="form-control" placeholder="<spring:message code="enter.festivals.label" />" ></textarea>
             	       <span id="birthdayMailMsgError" style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
             	   </div>
             	</div>
             	<div class="row">
             		<div class="col-lg-1"></div>
             		<div class="form-group col-lg-3" style="font-size: 15px;">
             			<br>
             			<input type="checkbox" checked="checked" onclick="setSubCategoryStatus(this);" name="greetingEnabled" style="vertical-align: -2px" id="marriagedayEnabled"/>&nbsp;&nbsp;&nbsp;<spring:message code="service.enablement.label" />
             		</div>
             		<div class="form-group col-lg-7 greetingSMS">
             			<label><spring:message code="marriage.day.label" /></label>
		                <textarea rows="1" id="marriagedayMsg" style="resize: none;" class="form-control" placeholder="<spring:message code="enter.festivals.label" />" ></textarea>
             		    <span id="marriagedayMsgError" style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
             		</div>
             		 <div class="form-group col-lg-2 greetingSub" style="display: none;">
             	   		<label><spring:message code="marriage.day.label" /></label>
             	   		<textarea rows="1" id="marriagedayMailSub" style="resize: none;" class="form-control" placeholder="<spring:message code="enter.sub.label" />" ></textarea>
             	   <span id="marriagedayMailSubError" style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
             	   </div>
             	   <div class="form-group col-lg-5 greetingMail" style="display: none;">
             	   		<label> </label>
             	   		<textarea rows="1" id="marriagedayMailMsg" style="resize: none;" class="form-control" placeholder="<spring:message code="enter.festivals.label" />" ></textarea>
             	     <span id="marriagedayMailMsgError" style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
             	  
             	   </div>
             	</div>
             	<div class="row">
             		<div class="col-lg-1"></div>
             		<div class="form-group col-lg-3" style="font-size: 15px;">
             			<input type="checkbox" checked="checked" name="greetingEnabled" onclick="setSubCategoryStatus(this);" style="vertical-align: -2px" id="festivalEnabled"/>&nbsp;&nbsp;&nbsp;<spring:message code="service.enablement.label" />
             			<select id="calendarType" class="form-control" style="margin-top: 5px;" >
	                	  	<option value="region" >Regional Calendar</option>
	                	  	<option value="corporate" >Corporate Calendar</option>
						</select>
             		</div>
             		<div class="form-group col-lg-7 greetingSMS" style="margin-top: 5px;">
             			<label><spring:message code="festivals.label" /></label>
		                <textarea rows="1" id="festivalMsg" style="resize: none;" class="form-control" placeholder="<spring:message code="enter.festivals.label" />" ></textarea>
             		    <span id="festivalMsgError" style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
             		</div>
             		<div class="form-group col-lg-2 greetingSub" style="display: none;margin-top: 5px;">
             	   		<label><spring:message code="festivals.label" /></label>
             	   		<textarea rows="1" id="festivalMailSub" style="resize: none;" class="form-control" placeholder="<spring:message code="enter.sub.label" />" ></textarea>
             	        <span id="festivalMailSubError" style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
             	   </div>
             	   <div class="form-group col-lg-5 greetingMail" style="display: none;margin-top: 5px;">
						<label> </label>
             	   		<textarea rows="1" id="festivalMailMsg" style="resize: none;" class="form-control" placeholder="<spring:message code="enter.festivals.label" />" ></textarea>
             	       <span id="festivalMailMsgError" style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
             	   </div>
             	</div>
             	<div class="row">
             		<div class="col-lg-11" style="text-align: right;">
                 	<div class="buttons">
                 		 <a onclick="saveGreetingsNotification('notify');" class="button"><font size="2px">&nbsp;&nbsp;<spring:message code="send.notification.label" />&nbsp;&nbsp;</font></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		           		 <a onclick="saveGreetingsNotification();" class="button"><font size="2px">&nbsp;&nbsp;&nbsp;<spring:message code="save.label" />&nbsp;&nbsp;&nbsp;</font></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		           		 <a onclick="clearGreetings();" class="button"><font size="2px">&nbsp;&nbsp;<spring:message code="storage_systems_clear.label" />&nbsp;&nbsp;</font></a>
		             </div>
             		</div>
                 </div>
             </div>
               <div class="row" >
               <div class="col-lg-12"  >
               <div class="form-group col-lg-3" style="padding-left: 1px;padding-right: 1px;margin-top: 8px;cursor: pointer;margin-bottom: 0px;" onclick="activateHeader('campaigns');" ><span style="font-weight: bold;font-size: 16px;color:#666;cursor: pointer;"><spring:message code="send.campaign.messages.label" /></span></div>
                <div class="form-group col-lg-9" style="margin-bottom: 4px;">
               	<img class="headerImg" style="float: right;cursor: pointer;margin-right: -16px;margin-top: 0px;margin-bottom: -26px" onclick="activateHeader('campaigns');" id="campaignsImg" alt="" src="${pageContext.request.contextPath}/images/leftHeaderIconGreen.png">
                </div> 
               <hr style="margin-top: 31px;width: 100%;border-top: 1px solid rgb(181,230,29);" />
               <hr style="margin-top: -18px;width: 100%;border-top: 1px solid rgb(181,230,29);" />
               </div>
           </div>
             <div class="campaigns subBlock">
             	<div class="row">
             		<div class="col-lg-1"></div>
             		<div class="col-lg-3">
             			<input type="text" class="form-control searchItems" name="campaignBatchName" id="campaignBatch" placeholder="<spring:message code="batch.name.label" />"  style="background:url(${pageContext.request.contextPath}/images/downIcon.png) no-repeat;background-position:right;background-size: 23px;" />
						<div class=services>
					    		<div class="items">
					     			<ul class="matchedStringUl campaign" style="width: 89%!important;padding: 0px!important;">
					     				<c:forEach var="campaignBatchName" items="${campaignBatchNameList}" varStatus="theCount">
										<c:if test="${theCount.count == '1'}">
											<li id="${campaignBatchName.filterId}"  class="selected" onclick="getCode(this,'campaign');" ><a class="campaignPackageName">${campaignBatchName.batchName}</a></li>
										</c:if>
										<c:if test="${theCount.count != '1'}">
											<li id="${campaignBatchName.filterId}"  onclick="getCode(this,'campaign');" ><a class="campaignPackageName">${campaignBatchName.batchName}</a></li>
										</c:if>
									 </c:forEach>
					     			</ul>
					   			</div>
							</div>
						<span id="campaignBatchError" style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
             		</div>
             		<div class="col-lg-5" style="text-align: center;">
                      	<input type="radio" name="campaignOption" onclick="displayMessageBox('all','campaign');" id="campaignall" style="vertical-align: -2px" value="all"><spring:message code="customer.notification.all.label" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
       					<input type="radio" name="campaignOption" onclick="displayMessageBox('sms','campaign');" id="campaignsms" style="vertical-align: -2px" value="sms" checked="checked"><spring:message code="customer.notification.sms.label" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
       					<input type="radio" name="campaignOption" onclick="displayMessageBox('mail','campaign');" id="campaignmail" style="vertical-align: -2px" value="mail"><spring:message code="customer.mail.id.label" />
             		</div>
             		<div class="col-lg-2" style="font-size: 15px;text-align: right;padding-top: 5px;">
             			<spring:message code="enabled.label" />&nbsp;&nbsp;&nbsp;<input type="checkbox" checked="checked" onclick="setBatchStatus(this);" style="vertical-align: -2px" id="campaignEnabled"/>
             		</div>
             		<div class="col-lg-1"></div>
             	</div>
             	<div class="row">
             		<div class="col-lg-1"></div>
             		<div class="form-group col-lg-10">
	             		<div class="row">
        					<div class="col-lg-2">
        						 <label><spring:message code="deal_start_date.label" /></label>
                                 <input class="form-control calendar_icon" readonly="readonly" style="background-color: white;" id="dealsStartDate" size="20" type="text" onfocus="callCalender('dealsStartDate')" onclick="callCalender('dealsStartDate')" placeholder="DD/MM/YYYY"/>
        					</div>     	
        					<div class="col-lg-2">
        						 <label><spring:message code="deal_end_date.label" /></label>
                                 <input class="form-control calendar_icon" readonly="readonly" style="background-color: white;" id="dealsEndDate" size="20" type="text" onfocus="callCalender('dealsEndDate')" onclick="callCalender('dealsEndDate')" placeholder="DD/MM/YYYY"/>
        					<span id="dealsEndDateError" style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
        					</div>  
        					<div class="col-lg-3">
	        					<div class="row">
	        						<div class="col-lg-12" style="text-align: center;">
	        							<label><spring:message code="period.label" /></label>
	        						</div>
	        					</div>
	        					<div class="row">
	        						<div class="col-lg-6" style="padding-right: 5px;">
			                            <input type="text" class="form-control" id="dealsDays" required oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');" placeholder="<spring:message code="days.label" />" />
	        						</div>
	        						<div class="col-lg-6" style="padding-left: 5px;">
			                            <input type="text" class="form-control" id="dealsHours" required oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');" placeholder="<spring:message code="hours.label" />" />
	        						</div>
	        					</div>
                            </div> 	
                            <div class="col-lg-3">
                            	<br>
		             			<input type="text" class="form-control searchItems" name="dealNames" id="dealsNames" placeholder="<spring:message code="deal_name.label" />"  style="background:url(${pageContext.request.contextPath}/images/downIcon.png) no-repeat;background-position:right;background-size: 23px;margin-top: 5px;" />
								<div class=services>
							    		<div class="items">
							     			<ul class="matchedStringUl dealsNames" style="width: 89%!important;padding: 0px!important;"></ul>
							   			</div>
									</div>
								<span id="dealsNamesError" style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
		             		</div> 
		             		<div class="form-group col-lg-2" style="font-size: 15px;text-align: right;">
		             			<br>
		             			<spring:message code="enabled.label" />&nbsp;&nbsp;&nbsp;<input type="checkbox" checked="checked" onclick="setSubCategoryStatus(this);" name="campaignEnabled" style="vertical-align: -2px" id="dealsEnabled"/>
		             		</div>
    	         		</div>
		              <%--   <textarea rows="1" id="dealsMsg" style="resize: none;margin-top: 5px;" class="form-control" placeholder="<spring:message code="enter.festivals.label" />" ></textarea> --%>
		                
		                <div class="campaignSMS">
			                <textarea rows="2" id="dealsMsg" style="resize: none;margin-top: 5px;" class="form-control" placeholder="<spring:message code="enter.festivals.label" />" ></textarea>
	             		<span id="dealsMsgError" style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
	             		</div>
	             		<div class="row">
	             		   <div class="col-lg-4 campaignSub" style="display: none;">
		             	   		<textarea rows="2" id="dealsMailSub" style="resize: none;margin-top: 5px;" class="form-control" placeholder="<spring:message code="enter.sub.label" />" ></textarea>
		             	       <span id="dealsMailSubError" style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
		             	   </div>
		             	   <div class="col-lg-8 campaignMail" style="display: none;">
		             	   		<textarea rows="2" id="dealsMailMsg" style="resize: none;margin-top: 5px;" class="form-control" placeholder="<spring:message code="enter.festivals.label" />" ></textarea>
		             	    <span id="dealsMailMsgError" style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
		             	   </div>
	             		</div>
		                
             		</div>
             	</div>
             		<div class="row">
             		<div class="col-lg-1"></div>
             		<div class="form-group col-lg-10">
	             		<div class="row">
        					<div class="col-lg-2">
        						 <label><spring:message code="deal_start_date.label" /></label>
                                 <input class="form-control calendar_icon" readonly="readonly" style="background-color: white;" id="offersStartDate" size="20" type="text" onfocus="callCalender('offersStartDate')" onclick="callCalender('offersStartDate')" placeholder="DD/MM/YYYY"/>
        					</div>     	
        					<div class="col-lg-2">
        						 <label><spring:message code="deal_end_date.label" /></label>
                                 <input class="form-control calendar_icon" readonly="readonly" style="background-color: white;" id="offersEndDate" size="20" type="text" onfocus="callCalender('offersEndDate')" onclick="callCalender('offersEndDate')" placeholder="DD/MM/YYYY"/>
        					     <span id="offersEndDateError" style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
        					</div>  
        					<div class="col-lg-3">
	        					<div class="row">
	        						<div class="col-lg-12" style="text-align: center;">
	        							<label><spring:message code="period.label" /></label>
	        						</div>
	        					</div>
	        					<div class="row">
	        						<div class="col-lg-6" style="padding-right: 5px;">
			                            <input type="text" class="form-control" id="offersDays" required oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');" placeholder="<spring:message code="days.label" />" />
	        						</div>
	        						<div class="col-lg-6" style="padding-left: 5px;">
			                            <input type="text" class="form-control" id="offersHours" required oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');" placeholder="<spring:message code="hours.label" />" />
	        						</div>
	        					</div>
                            </div> 	
                            <div class="col-lg-3">
                            	<br>
		             			<input type="text" class="form-control searchItems" name="offersNames" id="offersNames" placeholder="<spring:message code="offer_name.label" />"  style="background:url(${pageContext.request.contextPath}/images/downIcon.png) no-repeat;background-position:right;background-size: 23px;margin-top: 5px;" />
								<div class=services>
							    		<div class="items">
							     			<ul class="matchedStringUl offersNames" style="width: 89%!important;padding: 0px!important;"></ul>
							   			</div>
									</div>
								<span id="offersNamesError" style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
		             		</div> 
		             		<div class="form-group col-lg-2" style="font-size: 15px;text-align: right;">
		             			<br>
		             			<spring:message code="enabled.label" />&nbsp;&nbsp;&nbsp;<input type="checkbox" checked="checked" onclick="setSubCategoryStatus(this);" name="campaignEnabled" style="vertical-align: -2px" id="offersEnabled"/>
		             		</div>	
    	         		</div>
		               <%--  <textarea rows="1" id="offersMsg" style="resize: none; margin-top: 5px;" class="form-control" placeholder="<spring:message code="enter.festivals.label" />" ></textarea> --%>
		                
		                <div class="campaignSMS">
			                <textarea rows="2" id="offersMsg" style="resize: none;margin-top: 5px;" class="form-control" placeholder="<spring:message code="enter.festivals.label" />" ></textarea>
	             		<span id="offersMsgError" style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
	             		</div>
	             		<div class="row">
	             		   <div class="col-lg-4 campaignSub" style="display: none;">
		             	   		<textarea rows="2" id="offersMailSub" style="resize: none;margin-top: 5px;" class="form-control" placeholder="<spring:message code="enter.sub.label" />" ></textarea>
		             	     <span id="offersMailSubError" style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
		             	   </div>
		             	   <div class="col-lg-8 campaignMail" style="display: none;">
		             	   		<textarea rows="2" id="offersMailMsg" style="resize: none;margin-top: 5px;" class="form-control" placeholder="<spring:message code="enter.festivals.label" />" ></textarea>
		             	   <span id="offersMailMsgError" style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
		             	   </div>
	             		</div>
             		</div>
             	</div>
             	<div class="row">
             		<div class="col-lg-1"></div>
             		<div class="form-group col-lg-10">
             		<label><spring:message code="periodic.messages.label" /></label>
	             		<div class="row">
        					<div class="col-lg-2">
        						 <label><spring:message code="deal_start_date.label" /></label>
                                 <input class="form-control calendar_icon" readonly="readonly" style="background-color: white;" id="periodicStartDate" size="20" type="text" onfocus="callCalender('periodicStartDate')" onclick="callCalender('periodicStartDate')" placeholder="DD/MM/YYYY"/>
        					</div>     	
        					<div class="col-lg-2">
        						 <label><spring:message code="deal_end_date.label" /></label>
                                 <input class="form-control calendar_icon" readonly="readonly" style="background-color: white;" id="periodicEndDate" size="20" type="text" onfocus="callCalender('periodicEndDate')" onclick="callCalender('periodicEndDate')" placeholder="DD/MM/YYYY"/>
        					     <span id="periodicEndDateError" style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
        					</div>  
        					<div class="col-lg-3">
	        					<div class="row">
	        						<div class="col-lg-12" style="text-align: center;">
	        							<label><spring:message code="period.label" /></label>
	        						</div>
	        					</div>
	        					<div class="row">
	        						<div class="col-lg-6" style="padding-right: 5px;">
			                            <input type="text" class="form-control" id="periodicDays" required oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');" placeholder="<spring:message code="days.label" />" />
	        						</div>
	        						<div class="col-lg-6" style="padding-left: 5px;">
			                            <input type="text" class="form-control" id="periodicHours" required oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');" placeholder="<spring:message code="hours.label" />" />
	        						</div>
	        					</div>
                            </div> 	
                            <div class="col-lg-3"></div>
                           <div class="form-group col-lg-2" style="font-size: 15px;text-align: right;">
		             			<br>
		             			<spring:message code="enabled.label" />&nbsp;&nbsp;&nbsp;<input type="checkbox" checked="checked" onclick="setSubCategoryStatus(this);" name="campaignEnabled" style="vertical-align: -2px" id="periodicEnabled"/>
		             		</div>	
    	         		</div>
		               <%--  <textarea rows="1" id="periodicMsg" style="resize: none; margin-top: 5px;" class="form-control" placeholder="<spring:message code="enter.festivals.label" />" ></textarea> --%>
		               
		               <div class="campaignSMS">
			                <textarea rows="2" id="periodicMsg" style="resize: none;margin-top: 5px;" class="form-control" placeholder="<spring:message code="enter.festivals.label" />" ></textarea>
	             		    <span id="periodicMsgError" style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
	             	  </div>
	             		<div class="row">
	             		   <div class="col-lg-4 campaignSub" style="display: none;">
		             	   		<textarea rows="2" id="periodicMailSub" style="resize: none;margin-top: 5px;" class="form-control" placeholder="<spring:message code="enter.sub.label" />" ></textarea>
		             	       <span id="periodicMailSubError" style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
		             	   </div>
		             	   <div class="col-lg-8 campaignMail" style="display: none;">
		             	   		<textarea rows="2" id="periodicMailMsg" style="resize: none;margin-top: 5px;" class="form-control" placeholder="<spring:message code="enter.festivals.label" />" ></textarea>
		             	        <span id="periodicMailMsgError" style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
		             	   </div>
	             		</div>
	             		
             		</div>
             	</div>
             	<div class="row">
             		<div class="col-lg-11" style="text-align: right;">
                 	<div class="buttons">
                 		 <a onclick="saveCampaignNotification('notify');" class="button"><font size="2px">&nbsp;&nbsp;&nbsp;<spring:message code="send.notification.label" />&nbsp;&nbsp;&nbsp;</font></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		           		 <a onclick="saveCampaignNotification();" class="button"><font size="2px">&nbsp;&nbsp;&nbsp;<spring:message code="save.label" />&nbsp;&nbsp;&nbsp;</font></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		           		 <a onclick="clearCampaigns();" class="button"><font size="2px">&nbsp;&nbsp;<spring:message code="storage_systems_clear.label" />&nbsp;&nbsp;</font></a>
		             </div>
             		</div>
                 </div>
             </div>
             
            <div class="row" >
               <div class="col-lg-12"  >
               <div class="form-group col-lg-2" style="padding-left: 1px;padding-right: 1px;margin-top: 8px;cursor: pointer;margin-bottom: 0px;" onclick="activateHeader('arrivals');" ><span style="font-weight: bold;font-size: 16px;color:#666;cursor: pointer;"><spring:message code="new.arrival.label" /></span></div>
                <div class="form-group col-lg-10" style="margin-bottom: 4px;">
               	<img class="headerImg" style="float: right;cursor: pointer;margin-right: -16px;margin-top: 0px;margin-bottom: -26px" onclick="activateHeader('arrivals');" id="arrivalsImg" alt="" src="${pageContext.request.contextPath}/images/leftHeaderIconGreen.png">
                </div> 
               <hr style="margin-top: 31px;width: 100%;border-top: 1px solid rgb(181,230,29);" />
               <hr style="margin-top: -18px;width: 100%;border-top: 1px solid rgb(181,230,29);" />
               </div>
           </div>
             <div class="arrivals subBlock">
             	<div class="row">
             		<div class="col-lg-1"></div>
             		<div class="form-group col-lg-10">
	             		<div class="row">
		             		<div class="col-lg-3">
		             			<br>
		             			<input type="text" class="form-control searchItems" name="arrivalBatchName" id="arrivalBatch" placeholder="<spring:message code="batch.name.label" />"  style="background:url(${pageContext.request.contextPath}/images/downIcon.png) no-repeat;background-position:right;background-size: 23px;margin-top:5px;" />
								<div class=services>
							    		<div class="items">
							     			<ul class="matchedStringUl arrival" style="width: 89%!important;padding: 0px!important;">
							     				<c:forEach var="arrivalBatchName" items="${arrivalBatchNameList}" varStatus="theCount">
												<c:if test="${theCount.count == '1'}">
													<li id="${arrivalBatchName.filterId}"  class="selected" onclick="getCode(this,'arrival');" ><a class="arrivalPackageName">${arrivalBatchName.batchName}</a></li>
												</c:if>
												<c:if test="${theCount.count != '1'}">
													<li id="${arrivalBatchName.filterId}"  onclick="getCode(this,'arrival');" ><a class="arrivalPackageName">${arrivalBatchName.batchName}</a></li>
												</c:if>
											 </c:forEach>
							     			</ul>
							   			</div>
									</div>
								<span id="arrivalBatchError" style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
		             		</div>
        					<div class="col-lg-2">
        						 <label><spring:message code="deal_end_date.label" /></label>
                                 <input class="form-control calendar_icon" readonly="readonly" style="background-color: white;" id="arrivalEndDate" size="20" type="text" onfocus="callCalender('arrivalEndDate')" onclick="callCalender('arrivalEndDate')" placeholder="DD/MM/YYYY"/>
        					</div>  
        					<div class="col-lg-4">
	        					<div class="row">
	        						<div class="col-lg-8" style="text-align: center;">
	        							<label><spring:message code="period.label" /></label>
	        						</div>
	        					</div>
	        					<div class="row">
	        						<div class="col-lg-4" style="padding-right: 5px;">
			                            <input type="text" class="form-control" id="arrivalDays" required oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');" placeholder="<spring:message code="days.label" />" />
	        						</div>
	        						<div class="col-lg-4" style="padding-left: 5px;">
			                            <input type="text" class="form-control" id="arrivalHours" required oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');" placeholder="<spring:message code="hours.label" />" />
	        						</div>
	        					</div>
                            </div> 	
                            <div class="col-lg-3" style="text-align: right;">
                            	<br>
                            	<input type="radio" name="arrivalOption" onclick="displayMessageBox('all','arrival');" id="arrivalall" style="vertical-align: -2px" value="all"><spring:message code="customer.notification.all.label" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		       					<input type="radio" name="arrivalOption" onclick="displayMessageBox('sms','arrival');" id="arrivalsms" style="vertical-align: -2px" value="sms" checked="checked"><spring:message code="customer.notification.sms.label" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		       					<input type="radio" name="arrivalOption" onclick="displayMessageBox('mail','arrival');" id="arrivalmail" style="vertical-align: -2px" value="mail"><spring:message code="customer.mail.id.label" />
		             		</div> 	
    	         		</div>
		                <div class="arrivalSMS">
			                <textarea rows="2" id="arrivalMsg" style="resize: none;margin-top: 5px;" class="form-control" placeholder="<spring:message code="enter.festivals.label" />" ></textarea>
	             		    <span id="arrivalMsgError" style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
	             		</div>
	             		<div class="row">
	             		   <div class="col-lg-4 arrivalSub" style="display: none;">
		             	   		<textarea rows="2" id="arrivalMailSub" style="resize: none;margin-top: 5px;" class="form-control" placeholder="<spring:message code="enter.sub.label" />" ></textarea>
		             	        <span id="arrivalMailSubError" style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
		             	   </div>
		             	   <div class="col-lg-8 arrivalMail" style="display: none;">
		             	   		<textarea rows="2" id="arrivalMailMsg" style="resize: none;margin-top: 5px;" class="form-control" placeholder="<spring:message code="enter.festivals.label" />" ></textarea>
		             	        <span id="arrivalMailMsgError" style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
		             	   </div>
	             		</div>
		                
             		</div>
             	</div>
             	<div class="row">
             		<div class="col-lg-11" style="text-align: right;">
                 	<div class="buttons">
                 		 <a onclick="saveNewArrival('notify');" class="button"><font size="2px">&nbsp;&nbsp;&nbsp;<spring:message code="send.notification.label" />&nbsp;&nbsp;&nbsp;</font></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		           		 <a onclick="saveNewArrival();" class="button"><font size="2px">&nbsp;&nbsp;&nbsp;<spring:message code="save.label" />&nbsp;&nbsp;&nbsp;</font></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		           		 <a onclick="clearArrivals();" class="button"><font size="2px">&nbsp;&nbsp;<spring:message code="storage_systems_clear.label" />&nbsp;&nbsp;</font></a>
		             </div>
             		</div>
                 </div>
             </div>
             <div class="row" >
               <div class="col-lg-12"  >
               <div class="form-group col-lg-3" style="padding-left: 1px;padding-right: 1px;margin-top: 8px;cursor: pointer;margin-bottom: 0px;" onclick="activateHeader('outlets');" ><span style="font-weight: bold;font-size: 16px;color:#666;cursor: pointer;"><spring:message code="new.store.label" /></span></div>
                <div class="form-group col-lg-9" style="margin-bottom: 4px;">
               	<img class="headerImg" style="float: right;cursor: pointer;margin-right: -16px;margin-top: 0px;margin-bottom: -26px" onclick="activateHeader('outlets');" id="outletsImg" alt="" src="${pageContext.request.contextPath}/images/leftHeaderIconGreen.png">
                </div> 
               <hr style="margin-top: 31px;width: 100%;border-top: 1px solid rgb(181,230,29);" />
               <hr style="margin-top: -18px;width: 100%;border-top: 1px solid rgb(181,230,29);" />
               </div>
           </div>
           <div class="outlets subBlock">
             <div class="row">
             		<div class="col-lg-1"></div>
             		<div class="form-group col-lg-10">
	             		<div class="row">
	             			<div class="col-lg-3">
		             			<br>
		             			<input type="text" class="form-control searchItems" name="outletBatchName" id="outletBatch" placeholder="<spring:message code="batch.name.label" />"  style="background:url(${pageContext.request.contextPath}/images/downIcon.png) no-repeat;background-position:right;background-size: 23px;" />
								<div class=services>
							    		<div class="items">
							     			<ul class="matchedStringUl outlet" style="width: 89%!important;padding: 0px!important;">
							     				<c:forEach var="outletBatchName" items="${outletBatchNameList}" varStatus="theCount">
												<c:if test="${theCount.count == '1'}">
													<li id="${outletBatchName.filterId}"  class="selected" onclick="getCode(this,'outlet');" ><a class="outletPackageName">${outletBatchName.batchName}</a></li>
												</c:if>
												<c:if test="${theCount.count != '1'}">
													<li id="${outletBatchName.filterId}"  onclick="getCode(this,'outlet');" ><a class="outletPackageName">${outletBatchName.batchName}</a></li>
												</c:if>
											 </c:forEach>
							     			</ul>
							   			</div>
									</div>
								<span id="outletBatchError" style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
		             		</div>
        					<div class="col-lg-2">
        						 <label><spring:message code="deal_end_date.label" /></label>
                                 <input class="form-control calendar_icon" readonly="readonly" style="background-color: white;" id="outletEndDate" size="20" type="text" onfocus="callCalender('outletEndDate')" onclick="callCalender('outletEndDate')" placeholder="DD/MM/YYYY"/>
        					</div>  
        					<div class="col-lg-4">
	        					<div class="row">
	        						<div class="col-lg-8" style="text-align: center;">
	        							<label><spring:message code="period.label" /></label>
	        						</div>
	        					</div>
	        					<div class="row">
	        						<div class="col-lg-4" style="padding-right: 5px;">
			                            <input type="text" class="form-control" id="outletDays" required oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');" placeholder="<spring:message code="days.label" />" />
	        						</div>
	        						<div class="col-lg-4" style="padding-left: 5px;">
			                            <input type="text" class="form-control" id="outletHours" required oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');" placeholder="<spring:message code="hours.label" />" />
	        						</div>
	        					</div>
                            </div> 	
                             <div class="col-lg-3" style="text-align: right;">
                            	<br>
                            	<input type="radio" name="outletOption" onclick="displayMessageBox('all','outlet');" id="outletall" style="vertical-align: -2px" value="all"><spring:message code="customer.notification.all.label" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		       					<input type="radio" name="outletOption" onclick="displayMessageBox('sms','outlet');" id="outletsms" style="vertical-align: -2px" value="sms" checked="checked"><spring:message code="customer.notification.sms.label" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		       					<input type="radio" name="outletOption" onclick="displayMessageBox('mail','outlet');" id="outletmail" style="vertical-align: -2px" value="mail"><spring:message code="customer.mail.id.label" />
		             		</div> 		
    	         		</div>
		                <div class="outletSMS">
			                <textarea rows="2" id="outletMsg" style="resize: none;margin-top: 5px;" class="form-control" placeholder="<spring:message code="enter.festivals.label" />" ></textarea>
	             		     <span id="outletMsgError" style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
	             		</div>
	             		<div class="row">
	             		   <div class="col-lg-4 outletSub" style="display: none;">
		             	   		<textarea rows="2" id="outletMailSub" style="resize: none;margin-top: 5px;" class="form-control" placeholder="<spring:message code="enter.sub.label" />" ></textarea>
		             	 <span id="outletMailSubError" style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
		             	   </div>
		             	   <div class="col-lg-8 outletMail" style="display: none;">
		             	   		<textarea rows="2" id="outletMailMsg" style="resize: none;margin-top: 5px;" class="form-control" placeholder="<spring:message code="enter.festivals.label" />" ></textarea>
		             	  <span id="outletMailMsgError" style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
		             	   </div>
	             		</div>
             		</div>
             	</div>
             	<div class="row">
             		<div class="col-lg-11" style="text-align: right;">
                 	<div class="buttons">
                 		 <a onclick="saveOutlet('notify');" class="button"><font size="2px">&nbsp;&nbsp;&nbsp;<spring:message code="send.notification.label" />&nbsp;&nbsp;&nbsp;</font></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		           		 <a onclick="saveOutlet();" class="button"><font size="2px">&nbsp;&nbsp;&nbsp;<spring:message code="save.label" />&nbsp;&nbsp;&nbsp;</font></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		           		 <a onclick="clearOutlets();" class="button"><font size="2px">&nbsp;&nbsp;<spring:message code="storage_systems_clear.label" />&nbsp;&nbsp;</font></a>
		             </div>
             		</div>
                 </div>
             </div>
             <br>
        </div>
    </form>
    </div>
   </div>
   </div>
 </section>
</body>
</html>