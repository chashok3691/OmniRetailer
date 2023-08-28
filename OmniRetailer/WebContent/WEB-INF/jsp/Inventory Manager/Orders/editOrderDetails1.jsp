<!--/*
 * Project Name 	        : OmniRetailerCustomer
 * Written By		        : Sambaiah
 * file name		        : inventorymanager/Orders/orderdetails.jsp
 * file type		        : JSP
 * description				: dispaly specific order details
 * */ -->


<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
    <!DOCTYPE html>
<html>
<head>
<!-- <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
 -->

<meta charset="UTF-8">
	<title>Home | Omni Retailer</title>
	<meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>

	 <!-- DATA TABLES -->
        <link href="${pageContext.request.contextPath}/css/datatables/dataTables.bootstrap.css" rel="stylesheet" type="text/css" />
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/validation.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/controller.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/order.js"></script>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/jquery.calendars.picker.css">
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.calendars.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.calendars.plus.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.calendars.picker.js"></script>
	<script src="${pageContext.request.contextPath}/js/form_plugin.js"></script>
	<script src="${pageContext.request.contextPath}/js/demo-compiled.js"></script>
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
	.col-xs-12 {
	 padding: 2% 10%;
	 }
</style>
<script type="text/javascript">
$(document).ready(function(){
	callCalender('orderDate');
	callCalender('deliveryDate');
	var phoneNo = $("#mobile_num").val();
	phoneNo = phoneNo.split('-');
	if(phoneNo.length == 1)
		$("#phoneNumber").val(phoneNo[0]);
	else{
		$("#defaultCountry").val(phoneNo[0]);
		$("#phoneNumber").val(phoneNo[1]);
	}
	phoneNo = $("#shipmentContact").val();
	phoneNo = phoneNo.split('-');
	if(phoneNo.length == 1)
		$("#phoneNumber1").val(phoneNo[0]);
	else{
		$("#defaultCountry1").val(phoneNo[0]);
		$("#phoneNumber1").val(phoneNo[1]);
	}
	changeTotalCost();
	$('#custDno').data("lastval",$('#custDno').val());
	 $('#custDno').on('input',function(e){
		 if($(this).data("lastval") == undefined){
			 $("#billDno").val($(this).val());
			 $("#shipDno").val($(this).val());
		 }
		 if($(this).data("lastval")== $("#billDno").val()){
			 $("#billDno").val($(this).val());
	 	 }
		 if($(this).data("lastval")== $("#shipDno").val()){
			 $("#shipDno").val($(this).val());
		 }
		 $(this).data("lastval",$(this).val());
 	});
	 $('#custStreet').data("lastval",$('#custStreet').val());
	$('#custStreet').on('input',function(e){
		 if($(this).data("lastval") == undefined){
			 $("#billStreet").val($(this).val());
			 $("#shipStreet").val($(this).val());
		 }
		 if($(this).data("lastval")== $("#billStreet").val()){
			 $("#billStreet").val($(this).val());
	 	 }
		 if($(this).data("lastval")== $("#shipStreet").val()){
			 $("#shipStreet").val($(this).val());
		 }
		 $(this).data("lastval",$(this).val());
 	});
	 $('#custLoc').data("lastval",$('#custLoc').val());
 	$('#custLoc').on('input',function(e){
		 if($(this).data("lastval") == undefined){
			 $("#billLoc").val($(this).val());
			 $("#shipLoc").val($(this).val());
		 }
		 if($(this).data("lastval")== $("#billLoc").val()){
			 $("#billLoc").val($(this).val());
	 	 }
		 if($(this).data("lastval")== $("#shipLoc").val()){
			 $("#shipLoc").val($(this).val());
		 }
		 $(this).data("lastval",$(this).val());
 	});
 	 $('#custCity').data("lastval",$('#custCity').val());
 	$('#custCity').on('input',function(e){
		 if($(this).data("lastval") == undefined){
			 $("#billCity").val($(this).val());
			 $("#shipCity").val($(this).val());
		 }
		 if($(this).data("lastval")== $("#billCity").val()){
			 $("#billCity").val($(this).val());
	 	 }
		 if($(this).data("lastval")== $("#shipCity").val()){
			 $("#shipCity").val($(this).val());
		 }
		 $(this).data("lastval",$(this).val());
	});
 }); 
</script>
</head>
<body>
<!-- Content Header (Page header) -->
<%-- <section class="content-header">
				<h1><spring:message code="outlet.management.label" />
     				<small><spring:message code="customer.label" /> <spring:message code="orders.label" /></small>
    			</h1>
                 <ol class="breadcrumb">
                    <li><a style="cursor: pointer;" onclick="return viewDashboard('inventorymanager');"><i class="fa fa-dashboard"></i><spring:message code="home.label" /></a></li>
                        <li class="active"><spring:message code="outlet.management.label"/></li>
                    </ol>
                </section> --%>
<!-- Main content -->
<section class="content">
<div class="row">
  <div class="col-lg-12">
				<div class="box box-primary">
                                <div class="box-header" style="text-align: center">
                                <br/>
                                <h3><spring:message code="details.label" /></h3>
                                </div><!-- /.box-header -->
                                <!-- form start -->
                                <form>
                                   <div class="box-body">
                                  <div class="row" style="text-align: right; margin-top: -27px;">
                                   <div id="Error" style="text-align:center;color:red;font-weight:bold;">${err}</div>
                                   <input type="hidden" id="type" value="${type}">
                                  	<input type="button" id="edit" style="position: relative;" class="btn bg-olive btn-inline" onclick="updateOrder('Ordered','edit','outlet');" value="<spring:message code="submit.label" />" />
								  	<%-- <input type="button" id="edit"  class="btn bg-olive btn-inline" style="margin-left:1%;width: 68px;position: relative;" onclick="updateOrder('Draft','edit','outlet');" value="<spring:message code="save.label" />" /> --%>
								  	<c:if test="${sessionScope.role == 'super admin'}">
										<c:if test="${orderDetails.orderStatus != 'Draft' && orderDetails.orderStatus != 'draft'}">
											 <c:forEach var="activity" items="${orderDetails.nextActivities}">
											 	<input type="button" style="margin-left:1%;width: 80px;position: relative;" class="btn bg-olive btn-inline" onclick="updateOrder('${activity}','edit','outlet');" value="${activity}" />
											 </c:forEach>
										</c:if>
								  </c:if>
								  <c:if test="${sessionScope.role != 'super admin'}">
									<c:if test="${flowUnder == 'outlet'}">
							           <c:if test="${orderDetails.orderStatus != 'Draft' && orderDetails.orderStatus != 'draft'}">
											 <c:forEach var="activity" items="${orderDetails.nextActivities}">
											 	<c:forEach var="accessControl" items="${sessionScope.outletCustomerOrderActivity}">
											 		<c:if test="${activity == accessControl.appDocumentActivity}">
													 	<input type="button" style="margin-left:1%;width: 80px;position: relative;" class="btn bg-olive btn-inline" onclick="updateOrder('${activity}','edit','outlet');" value="${activity}" />
											 		</c:if>
							     				</c:forEach> 
											 </c:forEach>
										</c:if>
							        </c:if>
						           <c:if test="${flowUnder == 'warehouse'}">
			                			<c:if test="${orderDetails.orderStatus != 'Draft' && orderDetails.orderStatus != 'draft'}">
											 <c:forEach var="activity" items="${orderDetails.nextActivities}">
											 	<c:forEach var="accessControl" items="${sessionScope.warehouseSalesOrderActivity}">
											 		<c:if test="${activity == accessControl.appDocumentActivity}">
													 	<input type="button" style="margin-left:1%;width: 80px;position: relative;" class="btn bg-olive btn-inline" onclick="updateOrder('${activity}','edit','outlet');" value="${activity}" />
											 		</c:if>
							     				</c:forEach> 
											 </c:forEach>
										</c:if>
						           </c:if>
						           <c:if test="${flowUnder == 'management'}">
			                			<c:if test="${orderDetails.orderStatus != 'Draft' && orderDetails.orderStatus != 'draft'}">
											 <c:forEach var="activity" items="${orderDetails.nextActivities}">
											 	<c:forEach var="accessControl" items="${sessionScope.orderManagemetSalesOrderActivity}">
											 		<c:if test="${activity == accessControl.appDocumentActivity}">
													 	<input type="button" style="margin-left:1%;width: 80px;position: relative;" class="btn bg-olive btn-inline" onclick="updateOrder('${activity}','edit','outlet');" value="${activity}" />
											 		</c:if>
							     				</c:forEach> 
											 </c:forEach>
										</c:if> 
						           </c:if>
							      </c:if>
								  	<%-- <c:if test="${orderDetails.orderStatus != 'Draft' && orderDetails.orderStatus != 'draft'}">
										 <c:forEach var="activity" items="${orderDetails.nextActivities}">
										 	<input type="button" style="margin-left:1%;width: 80px;position: relative;" class="btn bg-olive btn-inline" onclick="updateOrder('${activity}','edit','outlet');" value="${activity}" />
										 </c:forEach>
									</c:if> --%>
								  	<input type="button" class="btn bg-olive btn-inline" style="margin-left:1%; margin-right: 1%;width: 68px;position: relative;" onclick="viewOrders('${status}','','0','${type}');" value="<spring:message code="back.label" />" />
									<hr style="margin-top: 4px;width: 99%;" />
									</div>
                                    
                                    <div class="row">
                                     <div class="form-group col-lg-3"></div>
                                    	 <div class="form-group col-lg-3">
                                            <label><spring:message code="order_id.label" /></label>
                                            <input type="text" class="form-control" name="orderId" readonly value="${orderDetails.orderId}"/>
                                     </div>
                                      <div class="form-group col-lg-3">
                                            <label><spring:message code="sales_location.label" /></label>
                                     		 <select class="form-control" id="outletLocation" onchange="getTaxes();">
                                             <c:forEach var="location" items="${locationsList}">
												<option value="${location.businessActivity}" ${location.locationId == orderDetails.saleLocation ? 'selected' : ''}>${location.locationId}</option>
											 </c:forEach>
											 </select>
											 <input type="hidden" name="saleLocation" id="saleLocation">
											  <input type="hidden" id="location">
                                     </div>
                                      <div class="form-group col-lg-3"></div>
                                     </div>
                                     <input type="hidden" id="flowUnder" name="flowUnder" value= "${flowUnder}">
                                   <div class="row">
                                     <div class="form-group col-lg-3">
                                            <label><spring:message code="order_date.label" /> <span style="color:red; font-size:2">*</span></label>
                                           <%--  <div class="input-group">
                                            <div class="input-group-addon">
                                                <i class="fa fa-calendar"></i>
                                            </div>
                                             <input class="form-control" readonly="readonly" style="background-color: white;" name="orderDate" id="orderDate" value="${orderDetails.orderDate}" size="20" type="text" onfocus="callCalender('orderDate')" onclick="callCalender('orderDate')" placeholder="DD/MM/YYYY"/>
                                        </div> --%><!-- /.input group -->
                                        <input class="form-control calendar_icon" readonly="readonly" value="${orderDetails.orderDate}" style="background-color: white;" name="orderDate" id="orderDate" size="20" type="text" onfocus="callCalender('orderDate')" onclick="callCalender('orderDate')" placeholder="DD/MM/YYYY"/>
                                        <span id="orderDateError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
                                     </div>
                                     <div class="form-group col-lg-3">
                                            <label><spring:message code="delivery_date.label" /> <span style="color:red; font-size:2">*</span></label>
                                           <%--  <div class="input-group">
                                            <div class="input-group-addon">
                                                <i class="fa fa-calendar"></i>
                                            </div>
                                           	<input class="form-control" readonly="readonly" style="background-color: white;" name="deliveryDate" id="deliveryDate" value="${orderDetails.deliveryDate}" size="20" type="text" onfocus="callCalender('deliveryDate')" onclick="callCalender('deliveryDate')" placeholder="DD/MM/YYYY"/>
                                        </div> --%><!-- /.input group -->
                                         <input class="form-control calendar_icon" readonly="readonly" value="${orderDetails.deliveryDate}" style="background-color: white;" name="deliveryDate" id="deliveryDate" size="20" type="text" onfocus="callCalender('deliveryDate')" onclick="callCalender('deliveryDate')" placeholder="DD/MM/YYYY"/>
                                            <span id="deliveryDateError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
                                     </div>
                                    <div class="form-group col-lg-3">
                                            <label><spring:message code="payment.mode.label" /></label>
                                            <select class="form-control" name="paymentMode" id="paymentMode">
                                            <option value="Dedit Card" ${'Dedit Card' == orderDetails.paymentMode ? 'selected' : ''}>Dedit Card</option>
                                            <option value="Credit Card" ${'Credit Card' == orderDetails.paymentMode ? 'selected' : ''}>Credit Card</option>
                                            <option value="Net Banking" ${'Net Banking' == orderDetails.paymentMode ? 'selected' : ''}>Net Banking</option>
                                            <option value="Pay Cash" ${'Pay Cash' == orderDetails.paymentMode ? 'selected' : ''}>Pay Cash</option>
                                            </select>
                                     </div>
                                     <div class="form-group col-lg-3">
                                            <label><spring:message code="payment.type.label" /></label>
                                            <select class="form-control" name="paymentType" id="paymentType">
                                            <option value="On Delivery" ${'On Delivery' == orderDetails.paymentType ? 'selected' : ''}>On Delivery</option>
                                            <option value="Prepaid" ${'Prepaid' == orderDetails.paymentType ? 'selected' : ''}>Prepaid</option>
                                            </select>
                                     </div>   
                                   </div>
                                    
                                    
                                    <div class="row">
                                     <div class="form-group col-lg-3">
                                            <label><spring:message code="order_delivery_type.label" /></label>
                                             <select class="form-control" name="orderDeliveryType" id="orderDeliveryType">
                                            <option value="Pick Up" ${'Pick Up' == orderDetails.orderDeliveryType ? 'selected' : ''}>Pick Up</option>
                                            <option value="Door Delivery" ${'Door Delivery' == orderDetails.orderDeliveryType ? 'selected' : ''}>Door Delivery</option>
                                            </select>
                                     </div>
                                     <div class="form-group col-lg-3">
                                            <label><spring:message code="order_status.label" /></label>
                                            <input type="text" class="form-control" readonly="readonly" name="status" value="${orderDetails.status}"/>
                                            <input type="hidden" name="orderStatus" id="orderStatus"  value="${orderDetails.orderStatus}"/>
                                             <input type="hidden" readonly="readonly" name="selectedStatus" id="selectedStatus"  value="${status}"/>
                                     </div>
                                    <div class="form-group col-lg-3">
                                            <label><spring:message code="customer_email.label" /></label>
                                            <input type="text" class="form-control" name="email_id" id="email_id" onblur="validateEmail();" value="${orderDetails.email_id}"/>
                                            <span id="emailError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
                                     </div>
                                     <div class="form-group col-lg-3">
                                            <label><spring:message code="customer_contact_num.label" /> <span style="color:red; font-size:2">*</span></label>
                                            <div class="row">
				                                  <div class="col-lg-4 col-md-4 col-sm-4 col-xs-4">
				                                  	<select class="form-control" style="padding: 4px 6px;" id="defaultCountry" title="India - IN &#013;USA - US &#013;UK - GB &#013;Australia - AU">
				                                  	<option selected="selected">IN</option>
				                                  	<option>US</option>
				                                  	<option>GB</option>
				                                  	<option>AU</option>
				                                  	</select>
				                                  	<!-- <input type="text" onfocus="displayToolTip();" class="form-control" id="defaultCountry" maxlength="2" oninput="this.value = this.value.replace(/[^A-Za-z]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');"/> -->
				                                  </div>
				                                  <div class="col-lg-8 col-md-8 col-sm-8 col-xs-8" style="padding-left: 0px">
				                                  	<input type="text" class="form-control" placeholder="<spring:message code="enter.customer_contact_num.label" />" id="phoneNumber" size="15" maxlength="15" oninput="this.value = this.value.replace(/[^0-9]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');"/>
				                                  </div>
				                                  <input type="hidden" class="form-control" name="mobile_num" id="mobile_num"  value="${orderDetails.mobile_num}"/>
				                                   <input type="hidden" id="output" />
				                             </div>
				                        	<span id="error" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
                                            <%-- <input type="text" class="form-control" name="mobile_num" id="mobile_num"  value="${orderDetails.mobile_num}"/>
                                            <span id="mobile_numError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span> --%>
                                     </div>   
                                   </div>
                                    <div class="row">
                                    <div class="form-group col-lg-12">
                                            <label style="text-decoration: underline; font-size: 16px;font-weight:bold;"><spring:message code="customerAddress.label" /></label>
                                    </div>
                                    </div>
                                     <div class="row">
                                     <div class="form-group col-lg-3" style="margin-top: -19px;">
                                            <label><spring:message code="doorNo.label" /> <span style="color:red; font-size:2">*</span></label>
                                            <input type="text" class="form-control" id="custDno" name="customer_address_doorNo"  value="${orderDetails.customer_address_doorNo}"/>
                                            <span id="custDnoError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
                                     </div>
                                      <div class="form-group col-lg-3" style="margin-top: -19px;">
                                            <label><spring:message code="customer_street.label" /> <span style="color:red; font-size:2">*</span></label>
                                            <input type="text" class="form-control" id="custStreet" name="customer_address_street"  value="${orderDetails.customer_address_street}"/>
                                            <span id="custStreetError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
                                     </div>
                                       <div class="form-group col-lg-3" style="margin-top: -19px;">
                                            <label><spring:message code="customer_location.label" /> <span style="color:red; font-size:2">*</span></label>
                                            <input type="text" class="form-control" id="custLoc" name="customer_address_location"  value="${orderDetails.customer_address_location}"/>
                                            <span id="custLocError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
                                     </div>
                                      <div class="form-group col-lg-3" style="margin-top: -19px;">
                                            <label><spring:message code="customer_city.label" /> <span style="color:red; font-size:2">*</span></label>
                                            <input type="text" class="form-control" id="custCity" name="customer_address_city"  value="${orderDetails.customer_address_city}"/>
                                            <span id="custCityError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
                                     </div>
                                    </div>
                                    <div class="row">
                                     <div class="form-group col-lg-3">
                                            <label style="text-decoration: underline; font-size: 16px;font-weight:bold;"><spring:message code="billingAddress.label" /></label>
                                    </div>
                                    </div>
                                    <div class="row">
                                    <div class="form-group col-lg-3" style="margin-top: -19px;">
                                            <label><spring:message code="doorNo.label" /> <span style="color:red; font-size:2">*</span></label>
                                            <input type="text" class="form-control" id="billDno" name="billing_address_doorNo" value="${orderDetails.billing_address_doorNo}"/>
                                            <span id="billDnoError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
                                     </div>
                                      <div class="form-group col-lg-3" style="margin-top: -19px;">
                                            <label><spring:message code="billing_street.label" /> <span style="color:red; font-size:2">*</span></label>
                                            <input type="text" class="form-control" id="billStreet" name="billing_address_street" value="${orderDetails.billing_address_street}"/>
                                            <span id="billStreetError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
                                     </div>
                                       <div class="form-group col-lg-3" style="margin-top: -19px;">
                                            <label><spring:message code="billing_location.label" /> <span style="color:red; font-size:2">*</span></label>
                                            <input type="text" class="form-control" id="billLoc" name="billing_address_location" value="${orderDetails.billing_address_location}"/>
                                            <span id="billLocError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
                                     </div>
                                        <div class="form-group col-lg-3" style="margin-top: -19px;">
                                            <label><spring:message code="billing_city.label" /> <span style="color:red; font-size:2">*</span></label>
                                            <input type="text" class="form-control" id="billCity" name="billing_address_city" value="${orderDetails.billing_address_city}"/>
                                            <span id="billCityError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
                                     </div>
                                    </div>
                                     <div class="row">
                                    <div class="form-group col-lg-3">
                                            <label style="text-decoration: underline; font-size: 16px;font-weight:bold;"><spring:message code="shipmentAddress.label" /></label>
                                     </div>
                                     </div>
                                     <div class="row">
                                      	<div class="form-group col-lg-3" style="margin-top: -19px;">
                                            <label><spring:message code="shipment.name.label" /> <span style="color:red; font-size:2">*</span></label>
                                            <input type="text" class="form-control" id="shipmentName" name="shipmentName" value="${orderDetails.shipmentName}"/>
                                            <span id="shipmentNameError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
                                    	</div>
                                    	<div class="form-group col-lg-3" style="margin-top: -19px;">
                                            <label><spring:message code="shipment.contact.number.label" /> <span style="color:red; font-size:2">*</span></label>
                                             <div class="row">
				                                  <div class="col-lg-4 col-md-4 col-sm-4 col-xs-4">
				                                  	<select class="form-control" style="padding: 4px 6px;" id="defaultCountry1" title="India - IN &#013;USA - US &#013;UK - GB &#013;Australia - AU">
				                                  	<option selected="selected">IN</option>
				                                  	<option>US</option>
				                                  	<option>GB</option>
				                                  	<option>AU</option>
				                                  	</select>
				                                  </div>
				                                  <div class="col-lg-8 col-md-8 col-sm-8 col-xs-8" style="padding-left: 0px">
				                                  	<input type="text" class="form-control" placeholder="<spring:message code="shipment.contact.number.label" />" id="phoneNumber1" size="15" maxlength="15" oninput="this.value = this.value.replace(/[^0-9]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');"/>
				                                  </div>
				                                  <input type="hidden" class="form-control" name="shipmentContact" id="shipmentContact"  value="${orderDetails.shipmentContact}"/>
				                                   <input type="hidden" id="output1" />
				                             </div>
				                        	<span id="error1" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
                                     	</div>
                                     	<div class="form-group col-lg-3" style="margin-top: -19px;">
                                            <label><spring:message code="doorNo.label" /> <span style="color:red; font-size:2">*</span></label>
                                            <input type="text" class="form-control" id="shipDno" name="shipement_address_doorNo" value="${orderDetails.shipement_address_doorNo}"/>
                                            <span id="shipDnoError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
                                    	</div>
                                    	<div class="form-group col-lg-3" style="margin-top: -19px;">
                                            <label><spring:message code="shipment_street.label" /> <span style="color:red; font-size:2">*</span></label>
                                            <input type="text" class="form-control" id="shipStreet" name="shipement_address_street" value="${orderDetails.shipement_address_street}"/>
                                            <span id="shipStreetError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
                                     	</div>
                                      </div>
                                      <div class="row">
                                      	<div class="form-group col-lg-3" style="">
                                            <label><spring:message code="shipment_location.label" /> <span style="color:red; font-size:2">*</span></label>
                                            <input type="text" class="form-control" id="shipLoc" name="shipement_address_location" value="${orderDetails.shipement_address_location}"/>
                                            <span id="shipLocError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
                                     	</div>
                                       	<div class="form-group col-lg-3" style="">
                                            <label><spring:message code="shipment_city.label" /> <span style="color:red; font-size:2">*</span></label>
                                            <input type="text" class="form-control" id="shipCity" name="shipement_address_city" value="${orderDetails.shipement_address_city}"/>
                                            <span id="shipCityError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
                                    	</div>
                                    	<div class="form-group col-lg-3" style="">
                                            <label><spring:message code="shipment.state.label" /> <span style="color:red; font-size:2">*</span></label>
                                            <input type="text" class="form-control" id="shipmentState" name="shipmentState" value="${orderDetails.shipmentState}"/>
                                            <span id="shipmentStateError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
                                     	</div>
                                       	<div class="form-group col-lg-3" style="">
                                            <label><spring:message code="shipment.country.label" /> <span style="color:red; font-size:2">*</span></label>
                                            <input type="text" class="form-control" id="shipmentCountry" name="shipmentCountry" value="${orderDetails.shipmentCountry}"/>
                                            <span id="shipmentCountryError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
                                            <input type="hidden" id = "cartId" name="cartId" value="${orderDetails.cartId}">
                                    	</div>
                                      </div>
                                      <%-- <div class="row">
                                      <div class="form-group col-lg-3" style="margin-top: -19px;">
                                            <label><spring:message code="doorNo.label" /> <span style="color:red; font-size:2">*</span></label>
                                            <input type="text" class="form-control" id="shipDno" name="shipement_address_doorNo" value="${orderDetails.shipement_address_doorNo}"/>
                                            <span id="shipDnoError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
                                    	</div>
                                    	<div class="form-group col-lg-3" style="margin-top: -19px;">
                                            <label><spring:message code="shipment_street.label" /> <span style="color:red; font-size:2">*</span></label>
                                            <input type="text" class="form-control" id="shipStreet" name="shipement_address_street" value="${orderDetails.shipement_address_street}"/>
                                            <span id="shipStreetError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
                                     	</div>
                                      	<div class="form-group col-lg-3" style="margin-top: -19px;">
                                            <label><spring:message code="shipment_location.label" /> <span style="color:red; font-size:2">*</span></label>
                                            <input type="text" class="form-control" id="shipLoc" name="shipement_address_location" value="${orderDetails.shipement_address_location}"/>
                                            <span id="shipLocError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
                                     	</div>
                                       	<div class="form-group col-lg-3" style="margin-top: -19px;">
                                            <label><spring:message code="shipment_city.label" /> <span style="color:red; font-size:2">*</span></label>
                                            <input type="text" class="form-control" id="shipCity" name="shipement_address_city" value="${orderDetails.shipement_address_city}"/>
                                            <span id="shipCityError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
                                    	</div>
                                      </div> --%>
                                     <div class="row">
                                        <div class="form-group col-lg-3">
                                            <label><spring:message code="order_channel" /></label>
                                            <select class="form-control" name="orderChannel" id="orderChannel">
                                            <option value="Online" ${'Online' == orderDetails.orderChannel ? 'selected' : ''}>Online</option>
                                            <option value="Phone" ${'Phone' == orderDetails.orderChannel ? 'selected' : ''}>Phone</option>
                                            <option value="Sales Executive" ${'Sales Executive' == orderDetails.orderChannel ? 'selected' : ''}>Sales Executive</option>
                                            <option value="Direct" ${'Direct' == orderDetails.orderChannel ? 'selected' : ''}>Direct</option>
                                            </select>
                                    	</div>   
                                    	<div class="form-group col-lg-3">
                                            <label><spring:message code="sales_executive.name.label" /></label>
                                            <input type="text" class="form-control"  name="sales_executive_name" value="${orderDetails.sales_executive_name}"/>
                                    	</div>
                                     	<div class="form-group col-lg-3">
                                            <label><spring:message code="shipment_mode.label" /></label>
                                            <select class="form-control" name="shipmentMode" id="shipmentMode">
                                            	<option value="Road" ${'Road' == orderDetails.shipmentMode ? 'selected' : ''}>Road</option>
	                                            <option value="Rail" ${'Rail' == orderDetails.shipmentMode ? 'selected' : ''}>Rail</option>
												<option value="Courier" ${'Courier' == orderDetails.shipmentMode ? 'selected' : ''}>Courier</option>
												<option value="Direct Person" ${'Direct Person' == orderDetails.shipmentMode ? 'selected' : ''}>Direct Person</option>
                                            </select>
                                    	</div>
                                      	<div class="form-group col-lg-3">
                                            <label><spring:message code="shiper_id.label" /></label>
                                            <input type="text" class="form-control"  name="shipperId" value="${orderDetails.shipperId}"/>
                                     	</div> 
                                     </div>
                                   <div class="row">
                                    <div class="form-group col-lg-6">
                                            <label><spring:message code="order.remarks.label" /></label>
                                             <textarea class="form-control"  name="remarks" rows="1" style="resize: none;" >${orderDetails.remarks}</textarea>
                                     </div>
                                     <div class="form-group col-lg-6">
                                            <label><spring:message code="customerFeedback.label" /></label>
                                            <textarea class="form-control"  name="customerFeedback" rows="1" style="resize: none;">${orderDetails.customerFeedback}</textarea>
                                     </div>   
                                   </div> 
                                     
                                   <div class="row">
                                         <div class="col-lg-3"></div>
                                         <div class="form-group col-lg-6">
                                         <input type="hidden" id="desc"/>
                                         	<%-- <label><spring:message code="search.items.here.label" /></label> --%>
                                         	<br>
                                         	<input type="text"  class="form-control searchItems" id="searchItems" placeholder="<spring:message code="search.items.here.label" />"  style="height:30PX;border-radius: 6px !important;background:url(${pageContext.request.contextPath}/images/search.png) no-repeat;background-position:right;"  />
											<div class="services">
								    			<div class="items">
								     				<ul class="matchedStringUl receipt" style=""></ul>
								   				</div>
											</div>
                                         <!-- 	
                                         	
                                            <input type="text" list="skuList" class="form-control"  name="searchCriteria" id="searchCriteria" />
 												<datalist id="skuList">
													
												</datalist> -->
  										 </div>
                                         <div class="col-lg-3">
                                         	<div id="triggerEvent"></div>
                                         </div>
                                        </div>
                                   
                                    <div class="table-responsive">
                                        <table id="productsList" class="table table-bordered table-hover">
                                          <thead style="background-color: #3c8dbc; color: #ffffff">
                                            <tr>
                                            	<th><div style="width:45px;"><spring:message code="sl.no.label" /></div></th>
                                            	<th><spring:message code="item_id.label"/></th>
                                                <th><spring:message code="item_description.label"/></th>
                                                <th><spring:message code="item_price.label"/></th>
                                                <th><spring:message code="order_quantity.label"/></th>
                                                <th><spring:message code="item_cost.label"/></th>
                                                <th><spring:message code="make.label"/></th>
                                                <th><spring:message code="model.label"/></th>
                                                <th><spring:message code="colour.label"/></th>
                                                <th><spring:message code="size.label"/></th>
                                                <th><spring:message code="action.label"/></th>
                                           </tr>
                                          </thead>
                                          
                            			<tbody style="text-align: center;">
                                           <c:forEach var="item" items="${orderDetails.itemDetails}" varStatus="theCount">
                                        	 <tr id="dynamicdiv${theCount.count}" style='margin-top:5px;'>
                                        	 	<td class="slno">${theCount.count}</td>
                                            	<td id="itemId${theCount.count}">${item.item_id}</td>
                                            	<input type="hidden" id="orderItemId${theCount.count}" value="${item.order_item_id}" />
                                            	<input type="hidden" id="skuId${theCount.count}" value="${item.skuId}" />
                                            	<input type="hidden" id="pluCode${theCount.count}" value="${item.pluCode}"/>
                                                <td id="itemName${theCount.count}">${item.item_name}</td>
                                                <td id="itemPrice${theCount.count}">${item.item_price}</td>
                                                <td id="orderedQuantity${theCount.count}"  class='Pack' onBlur='changePack(this);' onkeypress='return (this.innerText.length < 10)' contenteditable='true'>${item.ordered_quantity}</td>
                                              	<td id="totalCost${theCount.count}" class='cost'>${item.total_cost}</td>
                                                <td id="make${theCount.count}">${item.make}</td>
                                                <td id="model${theCount.count}">${item.model}</td>
                                                <td id="colour${theCount.count}">${item.colour}</td>
                                                <td id="size${theCount.count}">${item.size}</td>
                                                <td id="Del${theCount.count}"><img id="Img${theCount.count}"alt=""  style='width:15%;cursor:pointer;'  onclick='deleteItem(this);' src="${pageContext.request.contextPath}/images/itemdelete.png"/></td>
                                            </tr>
                                           </c:forEach>
                                           </tbody>
                                        </table>
                                        <br/>
                                    </div>
                                   <br>
                                   <div id="tax">
                                   <c:forEach var="tax" items="${taxDetails}" varStatus="theCount">
                                    <div class="row">
                                    <div class="form-group col-lg-6"></div>
                                     <div class="form-group col-lg-3" style="text-align: right;"><label><span class="taxName">${tax.taxName}</span> - <span class="taxRate">${tax.taxRate}<c:if test="${tax.taxType == 'percentage'}">%</c:if></span></label></div>
                                     <div class="form-group col-lg-3">
                                            <input type="text" class="form-control" id="orderTax${theCount.count}" readonly value=""/>
                                     </div>   
                                     </div>
                                     </c:forEach>
                                     </div>
                                  
                                   <div class="row">
                                     <input type="hidden" name="orderTax" id="totalTax" value="${orderDetails.orderTax}">
                                     <div class="form-group col-lg-6"></div>   
                                      <div class="form-group col-lg-3" style="text-align: right;"> <label><spring:message code="shipment_charges.label" /></label></div>
                                    <div class="form-group col-lg-3">
                                            <input type="text" class="form-control" name="shipmentCharges" id="shipmentCharges" value="${orderDetails.shipmentCharges}"  oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');"/>
                                     </div>
                                   </div> 
                                   
                                  
							<input type="hidden" name="items" id="itemDetails">


							 <div class="row">
								<div class="col-lg-6"></div>
								<div class="col-lg-3" style="text-align: right;"><label><spring:message code="total.order.value.label" /> </label></div>
								<div class="col-lg-3">
								<input type="text" class="form-control" id="orderTotalCost" name="orderTotalCost" readonly value="${orderDetails.orderTotalCost}"/>
							</div>
 						</div>
						<br/>
  <!-- COMPOSE MESSAGE MODAL -->
         <div class="modal fade popup-display" id="items-modal" tabindex="-1" role="dialog" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        <h4 class="modal-title" style="text-align: center;"><spring:message code="select.products.label" /></h4>
                    </div>
             <form action="#" method="post">
                 <div class="modal-body">
                  <div class="box-body table-responsive">
                     <table id="itemsList" class="table table-bordered table-hover">
                       <thead style="background-color: #3c8dbc; color: #ffffff">
                         <tr>
                             <th><spring:message code="item.desc.label"/></th>
                             <th><spring:message code="price.label"/></th>
                         </tr>
                       </thead>
                       <tbody style="text-align: center;">
			 			</tbody>
                    </table>
                 </div>
              </div>
             </form> 
         </div><!-- /.modal-content -->
     </div><!-- /.modal-dialog -->
 </div><!-- /.modal -->
						<div class="row" style="text-align: right;">
							<input type="button" id="edit"  class="btn bg-olive btn-inline" onclick="updateOrder('Ordered','edit','outlet');" value="<spring:message code="submit.label" />" />
							<%-- <input type="button" id="edit"  class="btn bg-olive btn-inline" style="margin-left:1%;width: 68px;" onclick="updateOrder('Draft','edit','outlet');" value="<spring:message code="save.label" />" /> --%>
							<c:if test="${sessionScope.role == 'super admin'}">
								<c:if test="${orderDetails.orderStatus != 'Draft' && orderDetails.orderStatus != 'draft'}">
									 <c:forEach var="activity" items="${orderDetails.nextActivities}">
									 	<input type="button" style="margin-left:1%;width: 80px;" class="btn bg-olive btn-inline" onclick="updateOrder('${activity}','edit','outlet');" value="${activity}" />
									 </c:forEach>
								</c:if>
						  </c:if>
						  <c:if test="${sessionScope.role != 'super admin'}">
							<c:if test="${flowUnder == 'outlet'}">
					           <c:if test="${orderDetails.orderStatus != 'Draft' && orderDetails.orderStatus != 'draft'}">
									 <c:forEach var="activity" items="${orderDetails.nextActivities}">
									 	<c:forEach var="accessControl" items="${sessionScope.outletCustomerOrderActivity}">
									 		<c:if test="${activity == accessControl.appDocumentActivity}">
											 	<input type="button" style="margin-left:1%;width: 80px;" class="btn bg-olive btn-inline" onclick="updateOrder('${activity}','edit','outlet');" value="${activity}" />
									 		</c:if>
					     				</c:forEach> 
									 </c:forEach>
								</c:if>
					        </c:if>
				           <c:if test="${flowUnder == 'warehouse'}">
	                			<c:if test="${orderDetails.orderStatus != 'Draft' && orderDetails.orderStatus != 'draft'}">
									 <c:forEach var="activity" items="${orderDetails.nextActivities}">
									 	<c:forEach var="accessControl" items="${sessionScope.warehouseSalesOrderActivity}">
									 		<c:if test="${activity == accessControl.appDocumentActivity}">
											 	<input type="button" style="margin-left:1%;width: 80px;" class="btn bg-olive btn-inline" onclick="updateOrder('${activity}','edit','outlet');" value="${activity}" />
									 		</c:if>
					     				</c:forEach> 
									 </c:forEach>
								</c:if>
				           </c:if>
				           <c:if test="${flowUnder == 'management'}">
	                			<c:if test="${orderDetails.orderStatus != 'Draft' && orderDetails.orderStatus != 'draft'}">
									 <c:forEach var="activity" items="${orderDetails.nextActivities}">
									 	<c:forEach var="accessControl" items="${sessionScope.orderManagemetSalesOrderActivity}">
									 		<c:if test="${activity == accessControl.appDocumentActivity}">
											 	<input type="button" style="margin-left:1%;width: 80px;" class="btn bg-olive btn-inline" onclick="updateOrder('${activity}','edit','outlet');" value="${activity}" />
									 		</c:if>
					     				</c:forEach> 
									 </c:forEach>
								</c:if> 
				           </c:if>
					      </c:if>
							<%-- <c:if test="${orderDetails.orderStatus != 'Draft' && orderDetails.orderStatus != 'draft'}">
								 <c:forEach var="activity" items="${orderDetails.nextActivities}">
								 	<input type="button" style="margin-left:1%;width: 80px;position: relative;" class="btn bg-olive btn-inline" onclick="updateOrder('${activity}','edit','outlet');" value="${activity}" />
								 </c:forEach>
							</c:if> --%>
							<input type="button" class="btn bg-olive btn-inline" style="margin-left:1%;margin-right: 1%;" onclick="viewOrders('${status}','','0','${type}');" value="<spring:message code="back.label" />" />
						</div>
						<br/>
                                    <div class="box-footer">
                                     <!--    <button type="submit" class="btn btn-primary">Submit</button> -->
                                    </div>
                                    <input type="hidden" name="operation" value="orders">  
                                    </div>
                                </form>
                            </div>

</div>
</div>
</section><!-- /.content -->
		  <!-- InputMask -->
    <%--     <script src="${pageContext.request.contextPath}/js/plugins/input-mask/jquery.inputmask.js" type="text/javascript"></script>
        <script src="${pageContext.request.contextPath}/js/plugins/input-mask/jquery.inputmask.date.extensions.js" type="text/javascript"></script>
        <script src="${pageContext.request.contextPath}/js/plugins/input-mask/jquery.inputmask.extensions.js" type="text/javascript"></script>
		<script type="text/javascript">
            $(function() {
                //Datemask dd/mm/yyyy
                $("#orderDate").inputmask("dd/mm/yyyy", {"placeholder": "dd/mm/yyyy"});
                $("#deliveryDate").inputmask("dd/mm/yyyy", {"placeholder": "dd/mm/yyyy"});
            });
            </script> --%>

        <script type="text/javascript">
            $(function() {
              /*  $('#productsList').dataTable({
                    "bPaginate": false,
                    "bLengthChange": false,
                    "bFilter": false,
                    "bSort": false,
                    "bInfo": false,
                    "bAutoWidth": false
                }); */
             });
        </script>
</body>
</html>
		    		 