<!--/*
 * Project Name 	        : OmniRetailerCustomer
 * Written By		        : Mythri
 * file name		        : Inventory Manager/bookingRoom/restaurantBookingInfo.jsp
 * file type		        : JSP
 * description				: view booking info
 * */ -->


<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
	<title>View booking | Omni Retailer</title>
	<meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>
	<%--  <script src="${pageContext.request.contextPath}/js/jquery-1.6.4.min.js"></script> --%>
 
<%--  <script src="${pageContext.request.contextPath}/js/form_plugin.js"></script> --%>
	<%-- <script type= "text/javascript" src = "${pageContext.request.contextPath}/js/countries.js"></script> --%>
	<script type= "text/javascript" src = "${pageContext.request.contextPath}/js/controller.js"></script>
	<%-- <script src="${pageContext.request.contextPath}/js/demo-compiled.js"></script>	 --%>
</head>
<body>
<!-- Content Header (Page header) -->

<!-- Main content -->
<section class="content">
<div class="row">
  <div class="col-xs-12">
				<div class="box box-primary" style="height: 1050px;">
                              <div class="box-header" style="text-align: center">
                              <br/>                    <!-- orderReference.label -->
                              <h3><spring:message code="booking.info.header.label" />&nbsp; for- ${bookingInfo.orderReference }</h3>
                              </div><!-- /.box-header -->
                              <!-- form start -->
                              <form id="viewBooking" method="post">
                                  <div class="box-body">
                                  <div id="Error" style="text-align:center; color: red;font-size: 2;font-weight: bold;">${err}</div>
                                   <input type="hidden" class="form-control" name="orderReference" id="orderReference" value="${bookingInfo.orderReference}" />
                                      
                                      <div class="row" style="text-align: right;">
				<input type="button" class="btn bg-olive btn-inline" style="margin-left:1%;margin-right: 2%;" onclick="return  viewRestaurantBookings('restaurantBookingDetails');" value="Back" />
				</div>
                                      
                                      
                                      <div class="row">
									<div class="form-group col-lg-3">
                                          <label><spring:message code="customerId.label" /> <span style="color:red; font-size:2">*</span></label>
                                          <input type="text" class="form-control" readonly="readonly" name="customerId" id="customerId" required  value="${bookingInfo.customer_Id }" />
                                      <span id="plotNoError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
									</div>
                                  	 <div class="form-group col-lg-3">
                                          <label><spring:message code="dateStr.label" /> <span style="color:red; font-size:2">*</span></label>
                                          <input type="text" class="form-control" readonly="readonly" name="dateStr" id="dateStr" required placeholder="<spring:message code="dateStr.label" />" value="${bookingInfo.date}" /><!-- ${bookingInfo.dateStr } -->
                                       <span id="dateStrError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span></div>
                                      
                                      <div class="form-group col-lg-3">
                                          <label><spring:message code="email.label" /> <span style="color:red; font-size:2">*</span></label>
                                          <input type="text" class="form-control" name="email" readonly="readonly" id="email" required  value="${bookingInfo.email }" />
                                     <span id="streetNameError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
                                     </div>
                                     
                                       <div class="form-group col-lg-3">
                                          <label><spring:message code="granditem.description.lableTotal.label" /> <span style="color:red; font-size:2">*</span></label>
                                          <input type="text" class="form-control" name="grandTotal" id="grandTotal" readonly="readonly" required  value="${bookingInfo.grandTotal }" />
                                      <span id="grandTotalError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
                                      </div>
                                      </div>
                                      
                                      <div class="row">
                                      <div class="form-group col-lg-3">
                                          <label><spring:message code="mobileNumber.label" /> <span style="color:red; font-size:2">*</span></label>
                                          <input type="text" class="form-control" readonly="readonly" name="mobileNumber" id="mobileNumber" required  value="${bookingInfo.mobileNumber }" />
                                      <span id="mobileNumberError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
									</div>
                                      <div class="form-group col-lg-3">
                                          <label><spring:message code="orderType.label" /> <span style="color:red; font-size:2">*</span></label>
                                          <input type="text" class="form-control" name="orderType" readonly="readonly" id="orderType" required  value="${bookingInfo.orderType }" />
                                     <span id="orderTypeError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
                                     </div>
                                     
                                      <div class="form-group col-lg-3">
                                          <label><spring:message code="salesExecutive.label" /> <span style="color:red; font-size:2">*</span></label>
                                          <input type="text" class="form-control" name="salesExecutive" readonly="readonly" id="salesExecutive" required  value="${bookingInfo.salesExecutive }" />
                                     <span id="salesExecutiveError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
                                     </div>
                                     
                                     
                                     
                                       <div class="form-group col-lg-3">
                                          <label><spring:message code="salesLocation.label" /> <span style="color:red; font-size:2">*</span></label>
                                          <input type="text" class="form-control" name="salesLocation" id="salesLocation" readonly="readonly" required  value="${bookingInfo.salesLocation }" />
                                      <span id="salesLocationError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
                                      </div>
                                      </div>
                                      
                                      
                                      
                                      <div class="row">
                                  	 <div class="form-group col-lg-3">
                                          
                                          <label><spring:message code="shipmentAddress1.label" /> <span style="color:red; font-size:2">*</span></label>
                                          <input type="text" class="form-control" readonly="readonly" name="shipmentAddress1" id="shipmentAddress1" required placeholder="<spring:message code="shipmentAddress1.label" />" value="${bookingInfo.shipmentAddress1 }" />
                                       <span id="shipmentAddress1Error" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
                                       </div>
									<div class="form-group col-lg-3">
                                          
                                          <label><spring:message code="shipmentAddress2.label" /> <span style="color:red; font-size:2">*</span></label>
                                          <input type="text" class="form-control" readonly="readonly" name="shipmentAddress2" id="shipmentAddress2" required placeholder="<spring:message code="shipmentAddress2.label" />" value="${bookingInfo.shipmentAddress2}" />
                                       <span id="shipmentAddress2Error" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
                                       </div>
                                      <div class="form-group col-lg-3">
                                          <label><spring:message code="shipmentContact.label" /> <span style="color:red; font-size:2">*</span></label>
                                          <input type="text" class="form-control" name="shipmentContact" readonly="readonly" id="shipmentContact" required  value="${bookingInfo.shipmentContact }" />
                                     <span id="shipmentContactError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
                                     </div>
                                       <div class="form-group col-lg-3">
                                          <label><spring:message code="status.label" /> <span style="color:red; font-size:2">*</span></label>
                                          <input type="text" class="form-control" name="status" id="status" readonly="readonly" required  value="${bookingInfo.status }" />
                                      <span id="statusError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
                                      </div>
                                      </div>
                                      
                                      <div class="row">
									<div class="form-group col-lg-3">
                                          
                                          <label><spring:message code="storeLocation.label" /> <span style="color:red; font-size:2">*</span></label>
                                          <input type="text" class="form-control" readonly="readonly" name="storeLocation" id="storeLocation" required placeholder="<spring:message code="storeLocation.label" />" value="${bookingInfo.store_location }" /><!--${bookingInfo.storeLocation }  -->
                                       <span id="storeLocationError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
                                       </div>
                                      <div class="form-group col-lg-3">
                                          <label><spring:message code="subTotal.label" /> <span style="color:red; font-size:2">*</span></label>
                                          <input type="text" class="form-control" name="subTotal" readonly="readonly" id="subTotal" required  value="${bookingInfo.subTotal  }" />
                                     <span id="subTotalError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
                                     </div>
                                       <div class="form-group col-lg-3">
                                          <label><spring:message code="tax.label" /> <span style="color:red; font-size:2">*</span></label>
                                          <input type="text" class="form-control" name="tax " id="tax " readonly="readonly" required  value="${bookingInfo.tax  }" />
                                      <span id="tax Error" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
                                      </div>
                                      </div>
                                      
                                      
                                      <hr>
                                      
                                    <%--   
                                      
                                      
                                       <div class="row">
                                       <div class="form-group col-lg-3">
                                       
                                        	<div class="radio" style="padding-left: 20px;margin-top: 20px;">
                                       <c:choose>
                                        		<c:when test="${bookingInfo.gender == 'male' }">
		                                        	<input type="radio" id="gender" checked name="gender" disabled="disabled"> <label><spring:message code="booking.male.label" /> </label><br>
		                                        	<input type="radio" id="gender"  name="gender"  disabled="disabled"> <label><spring:message code="booking.female.label" /> </label>
                                        		</c:when>
                                        		<c:otherwise>
                                        			<input type="radio" id="gender"  name="gender"  disabled="disabled"> <label><spring:message code="booking.male.label" /> </label><br>
                                    	    		<input type="radio" id="gender" name="gender" checked  disabled="disabled"> <label><spring:message code="booking.female.label" /> </label>
                                        		</c:otherwise>
                                        	</c:choose>
                                        	</div> 
                                        	 <div class="checkbox" style="padding-left: 20px;margin-top: 10px;">
	                                        	<input type="checkbox" id="vegetarian"  disabled="disabled" checked="${bookingInfo.vegetarian}"> <label><spring:message code="booking.vegitarian.label" /> </label>
                                        	</div> 
                                         </div>
                                      
                                      <div class="form-group col-lg-3">
                                      
                                        	<div class="checkbox" style="padding-left: 75px;margin-top: 20px;">
	                                        	<input type="checkbox" id="vegetarian"  disabled="disabled" checked="${bookingInfo.vegetarian}"> <label><spring:message code="booking.vegitarian.label" /> </label>
                                        	</div> 
                                         </div>
                                      
                                      <div class="form-group col-lg-3">
                                      
                                        	<div class="checkbox" style="padding-left: 75px;margin-top: 20px;">
	                                        	<input type="checkbox" id="pickUpRequired"  disabled="disabled" checked="${bookingInfo.pickUpRequired}"><label><spring:message code="booking.pickup.label" /> </label>
                                        	</div> 
                                       
                                        	<div class="checkbox" style="padding-left: 75px;margin-top: 20px;">
	                                        	<input type="checkbox" id="dropRequired"  disabled="disabled" checked="${bookingInfo.dropRequired}"><label><spring:message code="booking.drop.label" /> </label>
                                        	</div> 
                                      	
                                        	<div class="checkbox" style="padding-left: 75px;margin-top: 20px;">
                                        	<c:choose>
                                        		<c:when test="${bookingInfo.vegetarian == true }">
	                                        		<input type="checkbox" id="dayCabRequired"  disabled="disabled" checked> <label><spring:message code="booking.daycab.label" /> </label>
                                        		</c:when>
                                        		<c:otherwise>
                                    	    		<input type="checkbox" id="dayCabRequired"  disabled="disabled"> <label><spring:message code="booking.daycab.label" /> </label>
                                        		</c:otherwise>
                                        	</c:choose>
                                        	</div> 
                                         </div>
                                      <div class="form-group col-lg-3">
                                          <label><spring:message code="booking.phone.no.label" /> <span style="color:red; font-size:2">*</span></label>
                                          <input type="text" class="form-control" readonly="readonly" name="phoneNumber" id="phoneNumber" required  value="${bookingInfo.phoneNumber}" />
                                      <span id="plotNoError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
									</div>
                                      <div class="form-group col-lg-3">
                                      <input type="checkbox" id="dayCabRequired" style=" margin: 0px 10px;"  disabled="disabled" checked> <label><spring:message code="booking.daycab.label" /> </label> |
                                          <label><spring:message code="booking.taxi.Type.label" /> <span style="color:red; font-size:2">*</span></label>
                                      	  <input type="text" class="form-control" style=";" name="taxyType" id="taxyType" readonly="readonly" required  value="${bookingInfo.taxyType}" />
                                     <span id="streetNameError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
                                     </div>
                                     
                                      <div class="form-group col-lg-3">
                                          <label><input type="checkbox" id="dropRequired"  style=" margin: 0px 10px;" disabled="disabled" checked="${bookingInfo.dropRequired}"><spring:message code="booking.drop.Time.Str.label" /> <span style="color:red; font-size:2">*</span></label>
                                         <input type="text" class="form-control" style=";" name="dropTimeStr" id="dropTimeStr" readonly="readonly" required  value="${bookingInfo.dropTimeStr}" />
                                     <span id="streetNameError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
                                     </div>
                                     
                                     
                                     
                                       <div class="form-group col-lg-3">
                                          <label><input type="checkbox" id="pickUpRequired"  style=" margin: 0px 10px;" disabled="disabled" checked="${bookingInfo.pickUpRequired}"><spring:message code="booking.pick.Up.Time.Str.label" /> <span style="color:red; font-size:2">*</span></label>
                                       	<input type="text" class="form-control" style=";" name="pickUpTimeStr" id="pickUpTimeStr" readonly="readonly" required  value="${bookingInfo.pickUpTimeStr}" />
                                      <span id="cityError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
                                      </div>
                                      </div>
                                      
                                       --%>
                                       
                                      <hr>
                                      
                                      
                                      <div class="row">
                                      	<div class="form-group col-lg-3">
                                          <label><spring:message code="booking.discounts.and.payment.label" /></label>
                                        </div>
                                       </div>
                                      
                                      <div class="row">
                                      <div class="form-group col-lg-3">
                                          <label><spring:message code="slotId.label" /> <span style="color:red; font-size:2">*</span></label>
                                          <input type="text" class="form-control" readonly="readonly" name="slotId" id="slotId" required  value="${bookingInfo.slotId }" />
                                      <span id="slotIdError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
									 </div>
                                      <div class="form-group col-lg-3">
                                          <label><spring:message code="adultPax.label" /> <span style="color:red; font-size:2">*</span></label>
                                      	  <input type="text" class="form-control" style=";" name="adultPax" id="adultPax" readonly="readonly" required  value="${bookingInfo.adultPax }" />
                                     <span id="adultPaxError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
                                     </div>
                                     
                                      <div class="form-group col-lg-3">
                                          <label><spring:message code="childPax.label" /> <span style="color:red; font-size:2">*</span></label>
                                         <input type="text" class="form-control" style=";" name="childPax" id="childPax" readonly="readonly" required  value="${bookingInfo.childPax }" />
                                     <span id="childPaxError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
                                     </div>
                                     
                                     
                                     
                                       <div class="form-group col-lg-3">
                                          <label><spring:message code="reservationStatusId.label" /> <span style="color:red; font-size:2">*</span></label>
                                       	<input type="text" class="form-control" style=";" name="reservationStatusId" id="reservationStatusId" readonly="readonly" required  value="${bookingInfo.reservationStatusId }" />
                                      <span id="reservationStatusIdError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
                                      </div>
                                      </div>
                                      
                                      
                                         
                                         
                                          <div class="row">
                                      <div class="form-group col-lg-3">
                                          <label><spring:message code="actualAdultPax.label" /> <span style="color:red; font-size:2">*</span></label>
                                          <input type="text" class="form-control" readonly="readonly" name="actualAdultPax" id="actualAdultPax" required  value="${bookingInfo.actualAdultPax }" />
                                      <span id="actualAdultPaxError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
									</div>
                                      <div class="form-group col-lg-3">
                                          <label><spring:message code="actualChildPax.label" /> <span style="color:red; font-size:2">*</span></label>
                                      	  <input type="text" class="form-control" style=";" name="actualChildPax" id="actualChildPax" readonly="readonly" required  value="${bookingInfo.actualChildPax }" />
                                     <span id="actualChildPaxError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
                                     </div>
                                     
                                      <div class="form-group col-lg-3">
                                          <label><spring:message code="arrivedTimeStr.label" /> <span style="color:red; font-size:2">*</span></label>
                                         <input type="text" class="form-control" style=";" name="arrivedTimeStr" id="arrivedTimeStr" readonly="readonly" required  value="${bookingInfo.arrivedTime }" />
                                     <span id="arrivedTimeStrError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
                                     </div>
                                     
                                     
                                     
                                       <div class="form-group col-lg-3">
                                          <label><spring:message code="specialInstructions.label" /> <span style="color:red; font-size:2">*</span></label>
                                       	<input type="text" class="form-control" style=";" name="specialInstructions" id="specialInstructions" readonly="readonly" required  value="${bookingInfo.specialInstructions }" />
                                      <span id="specialInstructionsError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
                                      </div>
                                      </div>
                                      
                                      
                                      <div class="row">
                                      <div class="form-group col-lg-3">
                                          <label><spring:message code="adultFoodTypeVeg.label" /> <span style="color:red; font-size:2">*</span></label>
                                          <input type="text" class="form-control" readonly="readonly" name="adultFoodTypeVeg" id="adultFoodTypeVeg" required  value="${bookingInfo.noOfVegAdults }" /><!-- ${bookingInfo.adultFoodTypeVeg } -->
                                      <span id="adultFoodTypeVegError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
									</div>
                                      <div class="form-group col-lg-3">
                                          <label><spring:message code="adultFoodTypeNonVeg.label" /> <span style="color:red; font-size:2">*</span></label>
                                      	  <input type="text" class="form-control" style=";" name="adultFoodTypeNonVeg" id="adultFoodTypeNonVeg" readonly="readonly" required  value="${bookingInfo.noOfNonVegAdult  }" /><!-- ${bookingInfo.adultFoodTypeNonVeg  } -->
                                     <span id="adultFoodTypeNonVegError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
                                     </div>
                                     
                                      <div class="form-group col-lg-3">
                                          <label><spring:message code="childFoodTypeVegNonVeg.label" /> <span style="color:red; font-size:2">*</span></label>
                                         <input type="text" class="form-control" style=";" name="childFoodTypeVegNonVeg" id="childFoodTypeVegNonVeg" readonly="readonly" required  value="${bookingInfo.noOfVegChildren }" /><!-- ${bookingInfo.childFoodTypeVegNonVeg } -->
                                     <span id="childFoodTypeVegNonVegError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
                                     </div>
                                     
                                     
                                     
                                       <div class="form-group col-lg-3">
                                          <label><spring:message code="childBelow6.label" /> <span style="color:red; font-size:2">*</span></label>
                                       	<input type="text" class="form-control" style=";" name="childBelow6" id="childBelow6" readonly="readonly" required  value="${bookingInfo.childBelow6 }" />
                                      <span id="childBelow6Error" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
                                      </div>
                                      </div>
                                      
                                      
                                      
                                      
                                      <div class="row">
                                      <div class="form-group col-lg-3">
                                          <label><spring:message code="adultVegPrice.label" /> <span style="color:red; font-size:2">*</span></label>
                                          <input type="text" class="form-control" readonly="readonly" name="adultVegPrice" id="adultVegPrice" required  value="${bookingInfo.adultVegPrice }" />
                                      <span id="adultVegPriceError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
									</div>
                                      <div class="form-group col-lg-3">
                                          <label><spring:message code="adultNonVegPrice.label" /> <span style="color:red; font-size:2">*</span></label>
                                      	  <input type="text" class="form-control" style=";" name="adultNonVegPrice" id="adultNonVegPrice" readonly="readonly" required  value="${bookingInfo.adultNonVegPrice }" />
                                     <span id="adultNonVegPriceError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
                                     </div>
                                     
                                    
                                      </div>
                                      
                                      
                                      
                                     <div class="row">
                                  	 <div class="form-group col-lg-3">
                                          
                                          <label><spring:message code="childPrice.label" /> <span style="color:red; font-size:2">*</span></label>
                                          <input type="text" class="form-control" readonly="readonly" name="childPrice" id="childPrice" required placeholder="<spring:message code="childPrice.label" />" value="${bookingInfo.childPrice }" />
                                       <span id="childPriceError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span></div>
									<div class="form-group col-lg-3">
                                          <label><spring:message code="swachTax.label" /> <span style="color:red; font-size:2">*</span></label>
                                          <input type="text" class="form-control" readonly="readonly" name="swachTax" id="swachTax" required  value="${bookingInfo.swachTax }" />
                                      <span id="swachTaxError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
									</div>
                                      <div class="form-group col-lg-3">
                                          <label><spring:message code="deviceId.label" /> <span style="color:red; font-size:2">*</span></label>
                                          <input type="text" class="form-control" name="deviceId" readonly="readonly" id="deviceId" required  value="${bookingInfo.deviceId }" />
                                     <span id="deviceIdError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
                                     </div>
                                       <div class="form-group col-lg-3">
                                          <label><spring:message code="booking.channel.label" /> <span style="color:red; font-size:2">*</span></label>
                                          <input type="text" class="form-control" name="outletName" id="outletName" readonly="readonly" required  value="${bookingInfo.outletName }" />
                                      <span id="outletNameError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
                                      </div>
                                      </div>
                                      
                                      <div class="row">
                                  	 <div class="form-group col-lg-3">
                                          
                                          <label><spring:message code="occasionDesc.label" /> <span style="color:red; font-size:2">*</span></label>
                                          <input type="text" class="form-control" readonly="readonly" name="occasionDesc" id="occasionDesc" required placeholder="<spring:message code="occasionDesc.label" />" value="${bookingInfo.occasionDesc }" />
                                       <span id="occasionDescError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span></div>
									<div class="form-group col-lg-3">
                                          <label><spring:message code="customerName.label" /> <span style="color:red; font-size:2">*</span></label>
                                          <input type="text" class="form-control" readonly="readonly" name="customerName" id="customerName" required  value="${bookingInfo.customerName }" />
                                      <span id="customerNameError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
									</div>
                                      <div class="form-group col-lg-3">
                                          <label><spring:message code="serviceCharges.label" /> <span style="color:red; font-size:2">*</span></label>
                                          <input type="text" class="form-control" name="serviceCharges" readonly="readonly" id="serviceCharges" required  value="${bookingInfo.serviceCharges }" />
                                     <span id="serviceChargesError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
                                     </div>
                                       <div class="form-group col-lg-3">
                                          <label><spring:message code="vat.label" /> <span style="color:red; font-size:2">*</span></label>
                                          <input type="text" class="form-control" name="vat" id="vat" readonly="readonly" required  value="${bookingInfo.vat }" />
                                      <span id="vatError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
                                      </div>
                                      </div>
                                      
                                      <div class="row">
                                  	 <div class="form-group col-lg-3">
                                          
                                          <label><spring:message code="reservationDateTimeStr.label" /> <span style="color:red; font-size:2">*</span></label>
                                          <input type="text" class="form-control" readonly="readonly" name="reservationDateTimeStr" id="reservationDateTimeStr" required placeholder="<spring:message code="reservationDateTimeStr.label" />" value="${bookingInfo.reservationDateTimeStr }" />
                                       <span id="reservationDateTimeStrError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span></div>
									<div class="form-group col-lg-3">
                                          <label><spring:message code="seatingDateTimeStr.label" /> <span style="color:red; font-size:2">*</span></label>
                                          <input type="text" class="form-control" readonly="readonly" name="seatingDateTimeStr" id="seatingDateTimeStr" required  value="${bookingInfo.seatingDateTime }" />
                                      <span id="seatingDateTimeStrError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
									</div>
                                      <div class="form-group col-lg-3">
                                          <label><spring:message code="settlementdateTimeStr.label" /> <span style="color:red; font-size:2">*</span></label>
                                          <input type="text" class="form-control" name="settlementdateTimeStr" readonly="readonly" id="settlementdateTimeStr" required  value="${bookingInfo.settlementdateTime }" />
                                     <span id="settlementdateTimeStrError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
                                     </div>
                                       <div class="form-group col-lg-3">
                                          <label><spring:message code="serviceTax.label" /> <span style="color:red; font-size:2">*</span></label>
                                          <input type="text" class="form-control" name="serviceTax" id="serviceTax" readonly="readonly" required  value="${bookingInfo.serviceTax }" />
                                      <span id="serviceTaxError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
                                      </div>
                                      </div>
                                      
                                      
                                      
                                      <%--
                                      <div class="row">
                                  	 <div class="form-group col-lg-3">
                                          
                                          <label><spring:message code="booking.id.label" /> <span style="color:red; font-size:2">*</span></label>
                                          <input type="text" class="form-control" readonly="readonly" name="customerName" id="customerName" required placeholder="<spring:message code="enter.booking.id.label" />" value="${bookingInfo.customerName}" />
                                       <span id="firmNameError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span></div>
									<div class="form-group col-lg-3">
                                          <label><spring:message code="booking.phone.no.label" /> <span style="color:red; font-size:2">*</span></label>
                                          <input type="text" class="form-control" readonly="readonly" name="phoneNumber" id="phoneNumber" required  value="${bookingInfo.phoneNumber}" />
                                      <span id="plotNoError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
									</div>
                                      <div class="form-group col-lg-3">
                                          <label><spring:message code="booking.email.label" /> <span style="color:red; font-size:2">*</span></label>
                                          <input type="text" class="form-control" name="email" readonly="readonly" id="email" required  value="${bookingInfo.email}" />
                                     <span id="streetNameError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
                                     </div>
                                       <div class="form-group col-lg-3">
                                          <label><spring:message code="booking.channel.label" /> <span style="color:red; font-size:2">*</span></label>
                                          <input type="text" class="form-control" name="bookingChannel" id="bookingChannel" readonly="readonly" required  value="${bookingInfo.bookingChannel}" />
                                      <span id="cityError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
                                      </div>
                                      </div>
                                      
                                      
                                      
                                      <div class="row">
                                  	 <div class="form-group col-lg-3">
                                          
                                          <label><spring:message code="booking.id.label" /> <span style="color:red; font-size:2">*</span></label>
                                          <input type="text" class="form-control" readonly="readonly" name="customerName" id="customerName" required placeholder="<spring:message code="enter.booking.id.label" />" value="${bookingInfo.customerName}" />
                                       <span id="firmNameError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span></div>
									<div class="form-group col-lg-3">
                                          <label><spring:message code="booking.phone.no.label" /> <span style="color:red; font-size:2">*</span></label>
                                          <input type="text" class="form-control" readonly="readonly" name="phoneNumber" id="phoneNumber" required  value="${bookingInfo.phoneNumber}" />
                                      <span id="plotNoError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
									</div>
                                      <div class="form-group col-lg-3">
                                          <label><spring:message code="booking.email.label" /> <span style="color:red; font-size:2">*</span></label>
                                          <input type="text" class="form-control" name="email" readonly="readonly" id="email" required  value="${bookingInfo.email}" />
                                     <span id="streetNameError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
                                     </div>
                                       <div class="form-group col-lg-3">
                                          <label><spring:message code="booking.channel.label" /> <span style="color:red; font-size:2">*</span></label>
                                          <input type="text" class="form-control" name="bookingChannel" id="bookingChannel" readonly="readonly" required  value="${bookingInfo.bookingChannel}" />
                                      <span id="cityError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
                                      </div>
                                      </div>
                                      
                                      
                                      
                                      <div class="row">
                                  	 <div class="form-group col-lg-3">
                                          
                                          <label><spring:message code="booking.id.label" /> <span style="color:red; font-size:2">*</span></label>
                                          <input type="text" class="form-control" readonly="readonly" name="customerName" id="customerName" required placeholder="<spring:message code="enter.booking.id.label" />" value="${bookingInfo.customerName}" />
                                       <span id="firmNameError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span></div>
									<div class="form-group col-lg-3">
                                          <label><spring:message code="booking.phone.no.label" /> <span style="color:red; font-size:2">*</span></label>
                                          <input type="text" class="form-control" readonly="readonly" name="phoneNumber" id="phoneNumber" required  value="${bookingInfo.phoneNumber}" />
                                      <span id="plotNoError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
									</div>
                                      <div class="form-group col-lg-3">
                                          <label><spring:message code="booking.email.label" /> <span style="color:red; font-size:2">*</span></label>
                                          <input type="text" class="form-control" name="email" readonly="readonly" id="email" required  value="${bookingInfo.email}" />
                                     <span id="streetNameError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
                                     </div>
                                       <div class="form-group col-lg-3">
                                          <label><spring:message code="booking.channel.label" /> <span style="color:red; font-size:2">*</span></label>
                                          <input type="text" class="form-control" name="bookingChannel" id="bookingChannel" readonly="readonly" required  value="${bookingInfo.bookingChannel}" />
                                      <span id="cityError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
                                      </div>
                                      </div>
                                      
                                      
                                      <div class="row">
                                  	 <div class="form-group col-lg-3">
                                          
                                          <label><spring:message code="booking.id.label" /> <span style="color:red; font-size:2">*</span></label>
                                          <input type="text" class="form-control" readonly="readonly" name="customerName" id="customerName" required placeholder="<spring:message code="enter.booking.id.label" />" value="${bookingInfo.customerName}" />
                                       <span id="firmNameError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span></div>
									<div class="form-group col-lg-3">
                                          <label><spring:message code="booking.phone.no.label" /> <span style="color:red; font-size:2">*</span></label>
                                          <input type="text" class="form-control" readonly="readonly" name="phoneNumber" id="phoneNumber" required  value="${bookingInfo.phoneNumber}" />
                                      <span id="plotNoError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
									</div>
                                      <div class="form-group col-lg-3">
                                          <label><spring:message code="booking.email.label" /> <span style="color:red; font-size:2">*</span></label>
                                          <input type="text" class="form-control" name="email" readonly="readonly" id="email" required  value="${bookingInfo.email}" />
                                     <span id="streetNameError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
                                     </div>
                                       <div class="form-group col-lg-3">
                                          <label><spring:message code="booking.channel.label" /> <span style="color:red; font-size:2">*</span></label>
                                          <input type="text" class="form-control" name="bookingChannel" id="bookingChannel" readonly="readonly" required  value="${bookingInfo.bookingChannel}" />
                                      <span id="cityError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
                                      </div>
                                      </div>
                                      
                                      
                                      <div class="row">
                                  	 <div class="form-group col-lg-3">
                                          
                                          <label><spring:message code="booking.id.label" /> <span style="color:red; font-size:2">*</span></label>
                                          <input type="text" class="form-control" readonly="readonly" name="customerName" id="customerName" required placeholder="<spring:message code="enter.booking.id.label" />" value="${bookingInfo.customerName}" />
                                       <span id="firmNameError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span></div>
									<div class="form-group col-lg-3">
                                          <label><spring:message code="booking.phone.no.label" /> <span style="color:red; font-size:2">*</span></label>
                                          <input type="text" class="form-control" readonly="readonly" name="phoneNumber" id="phoneNumber" required  value="${bookingInfo.phoneNumber}" />
                                      <span id="plotNoError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
									</div>
                                      <div class="form-group col-lg-3">
                                          <label><spring:message code="booking.email.label" /> <span style="color:red; font-size:2">*</span></label>
                                          <input type="text" class="form-control" name="email" readonly="readonly" id="email" required  value="${bookingInfo.email}" />
                                     <span id="streetNameError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
                                     </div>
                                       <div class="form-group col-lg-3">
                                          <label><spring:message code="booking.channel.label" /> <span style="color:red; font-size:2">*</span></label>
                                          <input type="text" class="form-control" name="bookingChannel" id="bookingChannel" readonly="readonly" required  value="${bookingInfo.bookingChannel}" />
                                      <span id="cityError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
                                      </div>
                                      </div> --%>
                                      
                                      
                                  </div><!-- /.box-body -->
							
				<div class="row" style="text-align: right;">
				<input type="button" class="btn bg-olive btn-inline" style="margin-left:1%;margin-right: 3%;" onclick="return  viewRestaurantBookings('restaurantBookingDetails');" value="Back" />
				</div>
                                  <div class="box-footer">
                                  
                               </div>
                              </form>
                          </div>
		
</div>
</div>
</section><!-- /.content -->

</body>
</html>