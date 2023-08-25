<!--/*
 * Project Name 	        : OmniRetailerCustomer
 * Written By		        : Vasudeva Reddy.G
 * file name		        : CRM/LoyaltyPrograms/Memberships/newMembership.jsp
 * file type		        : JSP
 * description				: The new membership page is displayed using this jsp.
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
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/crm/loyaltyPrograms/memberships.js"></script>
 
 <script type="text/javascript">
 $(document).ready(function(){
	callCalender('startDate');
	callCalender('expiryDate');
	print_country("country");
	 var date = getCurrentDate();
	 $("#country").val("India");

	//	multipleCheckValidation();
		/* $("#state").html(op); */ 
				debugger
				  var slectedLocations = $("#selectedLocation").val().replace('[','').replace(']','').replace(/, /g,',');
				$("#location").val(slectedLocations.split(','));  
			
}); 
$("#promoName").keydown(function(){
	   $("#errPromoName").html("");
	   $("#Error").html("");
});

var promoCode = $("#promoCode").val();
$("#promoCode").keydown(function(){
	 /* if(promoCode.length<5){
			$("#errpromoCode").html("Enter atleast 5 Characters/Numbers");
			return;
		}
	else{  */
	   $("#errpromoCode").html("");
	   $("#Error").html("");
// 	}
});
 
$("#startDate").keydown(function(){
	   $("#startDateError").html("");
	   $("#Error").html("");
});

// $("#state").change(function(){
// 	   $("#errStates").html("");
// 	   $("#Error").html("");
// });
 $("#location").change(function(){
	   $("#errLocation").html("");
	   $("#Error").html("");
});

$("#zones").change(function(){
	   $("#errStates").html("");
	   $("#Error").html("");
});

$("#expiryDate").keydown(function(){
	   $("#errExpiryDate").html("");
	   $("#Error").html("");
}); 

$("#validityPeriod").keyup(function(){
	   $("#errValidityPeriod").html("");
	   $("#Error").html("");
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
                                <br/>
                                <h3 style="width: 25%; margin: auto;border: 1px solid black"><spring:message code="membership.creation.label" /></h3>
                                </div><!-- /.box-header -->
                                <!-- form start -->
                                <form id="membership" method="POST" >
                                    <div class="box-body">
                                   	<div id="Error" style="text-align: center;color: red;font-size: 2;font-weight: bold;">${err}</div>
                                    <div id="Success" class="Error" style="text-align: center;color: blue;font-size: 2;font-weight: bold;">${success}</div>
                                    	
                                  <div class="row" style="background: #efefef;width: 100%;margin-left: 0px !important;" >
                                    	<div class="row" style="margin-top: 10px;">
                                   		<div class="form-group col-lg-2">
                                   		<div class="col-lg-12">
                                            <label><spring:message code="promo.code.label" /><span style="color:red; font-size:2">*</span>  </label>
                                            <input type="text" class="form-control" id="promoCode"  name="couponProgramCode" value="${giftCoupon.couponProgramCode}"/>
                                              <span style="color:red; font-size:2;white-space: nowrap;;font-weight: bold" id="errpromoCode"></span>
                                     	</div>
                                     	</div>
                                   		
									 	<div class="form-group col-lg-2" style=" ">
                                            <label><spring:message code="start.date.label" /> <span style="color:red; font-size:2">*</span></label>
                                             <div class="input-group">
                                            	<div class="input-group-addon">
                                                	<i class="fa fa-calendar"></i>
                                            	</div>
                                            	<input class="form-control"  style="background-color: white;" name="startDateStr" readonly="readonly" id="startDate" size="20" type="text" value="${membership.startDate}" onfocus="callCalender('startDate')" onclick="callCalender('startDate')" placeholder="DD/MM/YYYY"/>
                                            	<!-- <input type="text" name="createdOn" id="createdOn" required class="form-control" data-inputmask="'alias': 'dd/mm/yyyy'" data-mask/> -->
                                       		 </div> <!-- /.input group -->
                                       		 <span style="color:red; font-size:2;font-weight: bold" id="startDateError"></span>
                                        	</div> 
										 <div class="form-group col-lg-2" style=" " >
                                            <label  ><spring:message code="assigned.label" /> </label>
                                             <select class="form-control" name="assignedStatus" id="assignedStatus" >
	                                            <option value=1>Yes</option>
    	                                        <option value="0">No</option>
                                            </select>
										</div> 
										 <div class="form-group col-lg-2" style="">
                                            <label  >  <spring:message code="membership.type.label" /></label>
                                             <select class="form-control" name="membershipType"  id="membershipType">
	                                            <option value="SILVER" >MEMBERSHIP SILVER</option>
    	                                        <option value="GOLD" >MEMBERSHIP GOLD</option>
    	                                         <option value="PLATINUM" >MEMBERSHIP PLATINUM</option>
                                            </select>
										</div> 
										<div class="form-group col-lg-2" style="">
                                   		<div class="col-lg-12">
                                            <label>Grace Period</label>
                                            <input type="text" class="form-control" id="graceperiod"  name="graceperiod" oninput="this.value = this.value.replace(/[^0-9]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');" value="${giftCoupon.couponProgramCode}"/>
                                              <span style="color:red; font-size:2;white-space: nowrap;" id="graceperiodError"></span>
                                     	</div>
                                     	</div>
										<div class="form-group col-lg-2" style=" ">
                                   		<div class="col-lg-12">
                                            <label><spring:message code="membership.price.label" /></label>
                                            <input type="text" class="form-control" id="membershipFee"  name="membershipFee" oninput="this.value = this.value.replace(/[^0-9]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');" value="${giftCoupon.couponProgramCode}"/>
                                              <span style="color:red; font-size:2;white-space: nowrap;" id="membershipFeeError"></span>
                                     	</div>
                                     	</div>
                                   	</div>
                                    	
                                    <div class="row"  >
                                    		<div class="form-group col-lg-2" >
                                    		<div class="col-lg-12 ">
                                            <label><spring:message code="promo.name.label" /> <span style="color:red; font-size:2">*</span></label>
                                            <input type="text" class="form-control" id="promoName" name="promoName" value="${giftCoupon.promoName}"/>
                                             <span style="color:red; font-size:2;font-weight: bold" id="errPromoName"></span>
                                             </div>
                                     		</div> 
                                    	 <div class="form-group col-lg-2" style=" ">
                                            <label><spring:message code="expiry.date.label" /> <span style="color:red; font-size:2">*</span></label>
                                             <div class="input-group">
                                            	<div class="input-group-addon">
                                                	<i class="fa fa-calendar"></i>
                                            	</div>
                                            	<input class="form-control" style="background-color: white;" name="expiryDateStr" readonly="readonly" id="expiryDate" size="20" type="text" value="${giftCoupon.expiryDateStr}" onfocus="callCalender('expiryDate')" onclick="callCalender('expiryDate')" placeholder="DD/MM/YYYY"/>
                                            	<!-- <input type="text" name="expiryDate" id="expiryDate" required class="form-control" data-inputmask="'alias': 'dd/mm/yyyy'" data-mask/> -->
                                       		 </div><!-- /.input group -->
                                       		  <span style="color:red; font-size:2;font-weight: bold" id="expiryDateError"></span>
                                         </div> 
                                      <div class="form-group col-lg-2" style=" ">
                                            <label><spring:message code="validity.period.label" /> <span style="color:red; font-size:2">*</span></label>
                                            <input type="text" class="form-control"  name="validityPeriod" id="validityPeriod" value="${giftCoupon.validityPeriod}" oninput="this.value = this.value.replace(/[^0-9]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');" placeholder="<spring:message code="enter.no.of.days.label" />"/>
                                              <span style="color:red; font-size:2;font-weight: bold" id="errValidityPeriod"></span>
                                    	</div>
                                    	<div class="form-group col-lg-2" style=" ">
                                            <label><spring:message code="status.label" /><!--  <span style="color:red; font-size:2">*</span> --></label>
                                             <select class="form-control" name="status" id="status">
	                                            <option value="Active" ${'Active' == giftCoupon.status ? 'selected' : ''}>Active</option>
    	                                        <option value="Suspend" ${'Suspend' == giftCoupon.status ? 'selected' : ''}>Suspend</option>
                                            </select>
										</div> 
										<div class="form-group col-lg-2" style=" margin-top :22px; ">
										<div class="col-lg-2">
											<input type="checkbox" id="otpRequired" name="otpRequired" value="true">
										
									</div>
									 	<div class="from-group col-lg-8" style="white-space: nowrap">
									
										<label ><spring:message code="crm.otp.required" /></label>
										
								</div>  
                                   		
                                     	</div>
                                     	<div class="col-lg-2">
                                   <div class="col-lg-12">
                                     	
                                            <label>Renewal Price</label>
                                            <input type="text" class="form-control" id="renewalprice"  name="renewalprice" oninput="this.value = this.value.replace(/[^0-9]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');" value="${giftCoupon.couponProgramCode}"/>
                                              <span style="color:red; font-size:2;white-space: nowrap;" id="renewalpriceError"></span>
                                     	</div>
                                     	</div>
                                    </div>
                                    
                                     <div class="row"  >
                                     
                                     <div class="form-group col-lg-2" >
                                    	<div class="col-lg-12 ">
                                            <label>No.Of Memberships<span style="color:red; font-size:2">*</span></label>
                                            <input type="text" class="form-control" id="quantity" name="quantity" value="${giftCoupon.quantity}"/>
                                             <span style="color:red; font-size:2;font-weight: bold" id="errQuantity"></span>
                                         </div>
                                     </div> 
                                     
                                     </div>
                                    
									
								 	
								 	</div>
								<div class="row">
									 <div class="form-group col-lg-2">
										 <div class="row" style="margin-left: 1%">
										 <label style="text-decoration: underline; font-size: 16px;"><spring:message code="loyalty.locations.label" /></label>
										 </div>
										 <div class="col-lg-12">
                                            <label><spring:message code="loyalty.country.label" /></label>
                                           <!--  <select onchange="addSelectedState(this.selectedIndex);" id="country" name ="country" class="form-control" > -->
                                            <select onchange="print_state('state',this.selectedIndex);" id="country" name ="country" class="form-control" >
												<!-- <option >Select Country</option> -->
											</select>
											</div>
                                     	</div>
									</div> 
					 			<div class="row">
                                      	<div class="form-group col-lg-3">
                                      		<div class="col-lg-12">
                                            <label><spring:message code="zones.all" /> <span style="color:red; font-size:2">*</span></label>
                                            <select onchange="getLocationsBasedonZones();" id ="zones" multiple="multiple" class="form-control" >
    										 <c:forEach var="zoneList" items="${zoneList}">
    										    <c:set var="zs" value="false"/>
    										    <c:forEach var="zonestr" items="${giftCoupon.zones}">
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
							 					
						 					
						 					</c:forEach>	<!-- <option >Select State</option> -->
    										</select>
    										<span style="color:red; font-size:2;font-weight: bold" id="errStates"></span>
    										</div>
                                    	</div>
                                    	<div class="form-group col-lg-2" style=" margin-left: 0px;">
                                            <label><spring:message code="loyalty.locations.label" /> <span style="color:red; font-size:2">*</span></label>
                                            <select id ="location" multiple="multiple" class="form-control" >
    											<c:forEach var="locationDetails" items="${locationsbasedzone}">
												<option value="${locationDetails}">${locationDetails}</option>
											</c:forEach>
    										</select>
    										<span style="color:red; font-size:2;font-weight: bold" id="errLocation"></span>
                                    	</div>
    
	<div class="col-lg-7" style=" margin-left: 0px;margin-top: 1.8% !important;">
	<div class="col-lg-12" style="margin-left: 0px;margin-top: 0% !important;    padding: 0px;">
     <div class="form-group col-lg-7" style="padding-right: 0px;padding-left:0px;margin-bottom: 5px;">
                        <input type="text"  class="form-control searchItems" placeholder="Search"  style="height:30PX;background:url(${pageContext.request.contextPath}/images/search.png) no-repeat;background-position:right;" autocomplete="off" name="" id=""  value="" />
						<div class="services">
				    		<div class="items">
				     			<ul class="matchedStringUl supplier" style="width: 89%!important;padding: 0px!important;"></ul>
				   			</div>
						</div>
						<span id="supplierNameError" style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
   	</div>
        <div class="col-lg-3" style="padding-right: 0px;margin-bottom: 5px;">
										<input type="file" class="btn bg-olive btn-inline" accept=".xlsx" title="To import, Choose the valid Exel Sheet format" style="height: 30px;display: inline-block;padding: 3px !important;width: 100%;" id="memberships" name="uploadedfilePath" onchange="addNameToTextBox('memberships');" /> 
										<input type="hidden" id="coupons_refId" name="coupons" /> 
										<input type="hidden" id="coupons_name" />
                                    	</div>
                                    	<div class="col-lg-2" style="padding-right: 0px;">
                                    	<input type="button" class="btnCls" style="width: 100%;font-size: 15px;padding: 4px 4px;" onclick="importDataxls()" value="Import">
                                    	</div>
	</div>
  	<table class="table table-striped table-bordered">
                                    	<thead style="background-color: #eeee !important; border-left: hidden;border-right: hidden;" >
                                    	<tr>
				                        	<th class="col-sm-1" ><spring:message code="slno.label"/></th>
				                        	<th class="col-sm-3" style="text-align: left"><spring:message code="Membership.id.label"/></th>
				                            <th class="col-sm-3" style="text-align: left">Name</th>
				                            <th class="col-sm-3" style="text-align: left">Phone No</th>
				                        	<th class="col-sm-1"><spring:message code="start.date.label"/></th>
				                        	<th class="col-sm-1"><spring:message code="end.date.label"/></th>
                                            <th class="col-sm-1">Renewal Date</th>
				                        	<th class="col-sm-1">Assigned</th>
				                        	<th class="col-sm-1"><spring:message code="status.label"/></th>
				                              </tr>      	
				                             </thead>
                                    	</table>
                                    	</div>
									  </div> 
<%-- 									<input type="hidden" id="selectedStateList"   value="${statesList}">   --%>
									  
                                     <input type="hidden" id="selectedZone" name="selectdZones" value="${giftCoupon.zones}">
                                     <input type="hidden" id="selectedLocation" name="locations" value="${giftCoupon.zoneLocations}">
                                      <input type="hidden" id="selectedAllLocation" value="${locationList}"> 
                                    </div>
                                    <!-- /.box-body -->
									
						<div class="row" style="text-align: center;">
						 <input type="button" class="btnCls" style="" onclick="validateMemberships('new')" value="<spring:message code="submit.label" />" />
					 <c:if test="${sessionScope.role == 'super admin'}"> 
					 	<input type="button" class="btnCls buttonMargin" style="" onclick="viewMemberships('membership','Memberships','0','menu');" value="<spring:message code="cancel.label" />" />
					 </c:if>
					<c:forEach var="accessControl" items="${sessionScope.CustomerLoyality}">
                         <c:if test="${accessControl.appDocument == 'GiftCoupons' && accessControl.write == true && accessControl.read == true}">
						<input type="button" class="btnCls buttonMargin" style="" onclick="viewMemberships('membership','Memberships','0','menu');" value="<spring:message code="cancel.label" />" />
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
</section>
  
</body>
</html>