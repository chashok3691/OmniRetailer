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
	<script src="${pageContext.request.contextPath}/js/form_plugin.js"></script>
<style>
  /* .odd{display:none!important;} */
</style>
<script type="text/javascript">
$(document).ready(function(){
	changeTotalCost();
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
	 var status = $("#orderStatus").val();
	 if(status.toUpperCase() == "DRAFT" || status.toUpperCase() == "ORDERED" || status.toUpperCase() == "CONFIRMED" || status.toUpperCase() == "CANCELLED" || status.toUpperCase() == "PENDING" || status.toUpperCase() == "PACKED"){
		$("#edit").css("visibility", "visible");
		$("#edit1").css("visibility", "visible");
	} 
	
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
                               <!--  <br/> -->
                                <h3><spring:message code="details.label" /></h3>
                                <div class="buttons" style="float: right;margin-top: -30px;">
<%-- 	   							<a href="${pageContext.request.contextPath}/pdf/purchaseorder.pdf" target="_blank" class="button"><font size="2px">Download PDF Document</font></a> --%>
				   				</div>
                                </div><!-- /.box-header -->
                                <!-- form start -->
                                <form>
                                   <div class="box-body">
                                   <div class="row" style="text-align: right; margin-top: -27px;">
                                    <div id="Error" style="text-align:center;color:red;font-weight:bold;">${err}</div>
                                    <input type="hidden" id="type" value="${type}">
                                    <input type="hidden" id="flowUnder" name="flowUnder" value= "${flowUnder}">
                                    	<%-- <c:if test="${type == 'management' }">
											<input type="button" id="edit" style="visibility: hidden;width: 80px;position: relative;" class="btn bg-olive btn-inline" onclick="editOrder('outlet');" value="<spring:message code="edit.label" />" />
											<c:if test="${orderDetails.orderStatus != 'Draft' && orderDetails.orderStatus != 'draft'}">
												 <c:forEach var="activity" items="${orderDetails.nextActivities}">
												 	<input type="button" style="margin-left:1%;width: 80px;position: relative;" class="btn bg-olive btn-inline" onclick="updateOrder('${activity}','edit','outlet');" value="${activity}" />
												 </c:forEach>
											</c:if>
										</c:if> --%>
										
								  <c:if test="${sessionScope.role == 'super admin'}">
									  	<input type="button" id="edit" style="visibility: hidden;width: 80px;position: relative;" class="btn bg-olive btn-inline" onclick="editOrder('outlet');" value="<spring:message code="edit.label" />" />
										<c:if test="${orderDetails.orderStatus != 'Draft' && orderDetails.orderStatus != 'draft'}">
											 <c:forEach var="activity" items="${orderDetails.nextActivities}">
											 	<input type="button" style="margin-left:1%;width: 80px;position: relative;" class="btn bg-olive btn-inline" onclick="updateOrder('${activity}','edit','outlet');" value="${activity}" />
											 </c:forEach>
										</c:if>
								  </c:if>
								  <c:if test="${sessionScope.role != 'super admin'}">
									<c:if test="${flowUnder == 'outlet'}">
							           <c:forEach var="accessControl" items="${sessionScope.outletCustomerOrder}">
							                <c:if test="${accessControl.appDocument == 'outletCustomerOrders' && accessControl.write == true && accessControl.read == true}">
							                	<input type="button" id="edit" style="visibility: hidden;width: 80px;position: relative;" class="btn bg-olive btn-inline" onclick="editOrder('outlet');" value="<spring:message code="edit.label" />" /> 
							                </c:if>
							           </c:forEach>
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
						           		<c:forEach var="accessControl" items="${sessionScope.warehouseSalesOrder}">
			                				<c:if test="${accessControl.appDocument == 'WarehouseShipmentOrders' && accessControl.write == true && accessControl.read == true}">
			                					<input type="button" id="edit" style="visibility: hidden;width: 80px;position: relative;" class="btn bg-olive btn-inline" onclick="editOrder('outlet');" value="<spring:message code="edit.label" />" />
			                				</c:if>
			                			</c:forEach>
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
						           		<c:forEach var="accessControl" items="${sessionScope.orderManagemetSalesOrder}">
			                				<c:if test="${accessControl.appDocument == 'OrderManagementSalesOrder' && accessControl.write == true}">
			                					<input type="button" id="edit" style="visibility: hidden;width: 80px;position: relative;" class="btn bg-olive btn-inline" onclick="editOrder('outlet');" value="<spring:message code="edit.label" />" />
			                				</c:if>
			                			</c:forEach>
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
										<input type="button" class="btn bg-olive btn-inline" style="margin-left:1%; margin-right: 1%;position: relative;width: 80px;" onclick="viewOrders('${status}','','0','${type}');" value="<spring:message code="back.label" />" />
										<hr style="margin-top: 4px;width: 99%;" />
									</div>
                                    <div class="row">
                                     <div class="form-group col-lg-3"></div>
                                    	 <div class="form-group col-lg-3">
                                            <label><spring:message code="order_id.label" /></label>
                                            <input type="text" class="form-control" id="orderId" name="orderId" readonly value="${orderDetails.orderId}"/>
                                     </div>
                                      <div class="form-group col-lg-3">
                                            <label><spring:message code="sales_location.label" /></label>
                                           <select class="form-control" disabled="disabled" id="outletLocation" onchange="getTaxes();">
                                             <c:forEach var="location" items="${locationsList}">
												<option value="${location.businessActivity}" ${location.locationId == orderDetails.saleLocation ? 'selected' : ''}>${location.locationId}</option>
											 </c:forEach>
											 </select>
                                            <input type="hidden" name="saleLocation" id="saleLocation" readonly value="${orderDetails.saleLocation}"/>
                                            <input type="hidden" id="location">
                                     </div>
                                      <div class="form-group col-lg-3"></div>
                                     </div>
                                    
                                   <div class="row">
                                     <div class="form-group col-lg-3">
                                            <label><spring:message code="order_date.label" /></label>
                                            <input type="text" class="form-control" name="orderDate" id="orderDate" readonly value="${orderDetails.orderDate}"/>
                                            <span id="orderDateError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
                                     </div>
                                     <div class="form-group col-lg-3">
                                            <label><spring:message code="delivery_date.label" /></label>
                                            <input type="text" class="form-control" name="deliveryDate" id="deliveryDate" readonly value="${orderDetails.deliveryDate}"/>
                                             <span id="deliveryDateError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
                                     </div>
                                    <div class="form-group col-lg-3">
                                            <label><spring:message code="payment.mode.label" /></label>
                                            <input type="text" class="form-control" name="paymentMode" id="paymentMode" readonly value="${orderDetails.paymentMode}"/>
                                     </div>
                                     <div class="form-group col-lg-3">
                                            <label><spring:message code="payment.type.label" /></label>
                                            <input type="text" class="form-control" name="paymentType" id="paymentType" readonly value="${orderDetails.paymentType}"/>
                                     </div>   
                                   </div>
                                    
                                    
                                    <div class="row">
                                     <div class="form-group col-lg-3">
                                            <label><spring:message code="order_delivery_type.label" /></label>
                                            <input type="text" class="form-control" name="orderDeliveryType" id="orderDeliveryType" readonly value="${orderDetails.orderDeliveryType}"/>
                                     </div>
                                     <div class="form-group col-lg-3">
                                            <label><spring:message code="order_status.label" /></label>
                                            <input type="text" class="form-control" readonly="readonly" name="status" value="${orderDetails.status}"/>
                                            <input type="hidden" name="orderStatus" id="orderStatus" readonly value="${orderDetails.orderStatus}"/>
                                             <input type="hidden" readonly="readonly" name="selectedStatus" id="selectedStatus"  value="${status}"/>
                                     </div>
                                    <div class="form-group col-lg-3">
                                            <label><spring:message code="customer_email.label" /></label>
                                            <input type="text" class="form-control" name="email_id" id="email_id" readonly value="${orderDetails.email_id}"/>
                                            <span id="emailError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
                                     </div>
                                     <div class="form-group col-lg-3">
                                            <label><spring:message code="customer_contact_num.label" /> <span style="color:red; font-size:2">*</span></label>
                                           <%--  <input type="text" class="form-control" name="mobile_num" id="mobile_num" readonly value="${orderDetails.mobile_num}"/> --%>
                                            <div class="row">
				                                  <div class="col-lg-4 col-md-4 col-sm-4 col-xs-4">
				                                  	<select class="form-control" disabled="disabled" style="padding: 4px 6px;" id="defaultCountry" title="India - IN &#013;USA - US &#013;UK - GB &#013;Australia - AU">
				                                  	<option selected="selected">IN</option>
				                                  	<option>US</option>
				                                  	<option>GB</option>
				                                  	<option>AU</option>
				                                  	</select>
				                                  	<!-- <input type="text" onfocus="displayToolTip();" class="form-control" id="defaultCountry" maxlength="2" oninput="this.value = this.value.replace(/[^A-Za-z]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');"/> -->
				                                  </div>
				                                  <div class="col-lg-8 col-md-8 col-sm-8 col-xs-8" style="padding-left: 0px">
				                                  	<input type="text" class="form-control" readonly="readonly" id="phoneNumber" size="15" maxlength="15" oninput="this.value = this.value.replace(/[^0-9]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');"/>
				                                  </div>
				                                  <input type="hidden" class="form-control" name="mobile_num" id="mobile_num"  value="${orderDetails.mobile_num}"/>
				                                   <input type="hidden" id="output" />
				                             </div>
				                             <span id="error" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
                                     </div>   
                                   </div>
                                    <div class="row">
                                    <div class="form-group col-lg-3">
                                            <label style="text-decoration: underline; font-size: 16px;font-weight:bold;"><spring:message code="customerAddress.label" /></label>
                                    </div>
                                    </div>
                                     <div class="row">
                                     <div class="form-group col-lg-3" style="margin-top: -19px;">
                                            <label><spring:message code="doorNo.label" /></label>
                                            <input type="text" class="form-control" id="custDno" name="customer_address_doorNo" readonly value="${orderDetails.customer_address_doorNo}"/>
                                            <span id="custDnoError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
                                     </div>
                                      <div class="form-group col-lg-3" style="margin-top: -19px;">
                                            <label><spring:message code="customer_street.label" /></label>
                                            <input type="text" class="form-control" id="custStreet" name="customer_address_street" readonly value="${orderDetails.customer_address_street}"/>
                                            <span id="custStreetError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
                                     </div>
                                       <div class="form-group col-lg-3" style="margin-top: -19px;">
                                            <label><spring:message code="customer_location.label" /></label>
                                            <input type="text" class="form-control" id="custLoc" name="customer_address_location" readonly value="${orderDetails.customer_address_location}"/>
                                            <span id="custLocError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
                                     </div>
                                      <div class="form-group col-lg-3" style="margin-top: -19px;">
                                            <label><spring:message code="customer_city.label" /></label>
                                            <input type="text" class="form-control" id="custCity" name="customer_address_city" readonly value="${orderDetails.customer_address_city}"/>
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
                                            <label><spring:message code="doorNo.label" /></label>
                                            <input type="text" class="form-control" id="billDno" readonly name="billing_address_doorNo" value="${orderDetails.billing_address_doorNo}"/>
                                            <span id="billDnoError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
                                     </div>
                                      <div class="form-group col-lg-3" style="margin-top: -19px;">
                                            <label><spring:message code="billing_street.label" /></label>
                                            <input type="text" class="form-control" id="billStreet" readonly name="billing_address_street" value="${orderDetails.billing_address_street}"/>
                                            <span id="billStreetError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
                                     </div>
                                       <div class="form-group col-lg-3" style="margin-top: -19px;">
                                            <label><spring:message code="billing_location.label" /></label>
                                            <input type="text" class="form-control" id="billLoc" readonly name="billing_address_location" value="${orderDetails.billing_address_location}"/>
                                            <span id="billLocError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
                                     </div>
                                        <div class="form-group col-lg-3" style="margin-top: -19px;">
                                            <label><spring:message code="billing_city.label" /></label>
                                            <input type="text" class="form-control" id="billCity" readonly name="billing_address_city" value="${orderDetails.billing_address_city}"/>
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
                                            <input type="text" class="form-control" readonly="readonly" id="shipmentName" name="shipmentName" value="${orderDetails.shipmentName}"/>
                                            <span id="shipmentNameError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
                                    	</div>
                                    	<div class="form-group col-lg-3" style="margin-top: -19px;">
                                            <label><spring:message code="shipment.contact.number.label" /> <span style="color:red; font-size:2">*</span></label>
                                             <div class="row">
				                                  <div class="col-lg-4 col-md-4 col-sm-4 col-xs-4">
				                                  	<select class="form-control" disabled="disabled" style="padding: 4px 6px;" id="defaultCountry1" title="India - IN &#013;USA - US &#013;UK - GB &#013;Australia - AU">
				                                  	<option selected="selected">IN</option>
				                                  	<option>US</option>
				                                  	<option>GB</option>
				                                  	<option>AU</option>
				                                  	</select>
				                                  </div>
				                                  <div class="col-lg-8 col-md-8 col-sm-8 col-xs-8" style="padding-left: 0px">
				                                  	<input type="text" class="form-control" readonly="readonly" placeholder="<spring:message code="shipment.contact.number.label" />" id="phoneNumber1" size="15" maxlength="15" oninput="this.value = this.value.replace(/[^0-9]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');"/>
				                                  </div>
				                                  <input type="hidden" class="form-control" name="shipmentContact" id="shipmentContact"  value="${orderDetails.shipmentContact}"/>
				                                   <input type="hidden" id="output1" />
				                             </div>
				                        	<span id="error1" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
                                     	</div>
                                     	<div class="form-group col-lg-3" style="margin-top: -19px;">
                                            <label><spring:message code="doorNo.label" /> <span style="color:red; font-size:2">*</span></label>
                                            <input type="text" class="form-control" readonly="readonly" id="shipDno" name="shipement_address_doorNo" value="${orderDetails.shipement_address_doorNo}"/>
                                            <span id="shipDnoError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
                                    	</div>
                                    	<div class="form-group col-lg-3" style="margin-top: -19px;">
                                            <label><spring:message code="shipment_street.label" /> <span style="color:red; font-size:2">*</span></label>
                                            <input type="text" class="form-control" readonly="readonly" id="shipStreet" name="shipement_address_street" value="${orderDetails.shipement_address_street}"/>
                                            <span id="shipStreetError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
                                     	</div>
                                      </div>
                                      <div class="row">
                                      	<div class="form-group col-lg-3" style="">
                                            <label><spring:message code="shipment_location.label" /> <span style="color:red; font-size:2">*</span></label>
                                            <input type="text" class="form-control" readonly="readonly" id="shipLoc" name="shipement_address_location" value="${orderDetails.shipement_address_location}"/>
                                            <span id="shipLocError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
                                     	</div>
                                       	<div class="form-group col-lg-3" style="">
                                            <label><spring:message code="shipment_city.label" /> <span style="color:red; font-size:2">*</span></label>
                                            <input type="text" class="form-control" readonly="readonly" id="shipCity" name="shipement_address_city" value="${orderDetails.shipement_address_city}"/>
                                            <span id="shipCityError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
                                    	</div>
                                    	<div class="form-group col-lg-3" style="">
                                            <label><spring:message code="shipment.state.label" /> <span style="color:red; font-size:2">*</span></label>
                                            <input type="text" class="form-control" readonly="readonly" id="shipmentState" name="shipmentState" value="${orderDetails.shipmentState}"/>
                                            <span id="shipmentStateError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
                                     	</div>
                                       	<div class="form-group col-lg-3" style="">
                                            <label><spring:message code="shipment.country.label" /> <span style="color:red; font-size:2">*</span></label>
                                            <input type="text" class="form-control" readonly="readonly" id="shipmentCountry" name="shipmentCountry" value="${orderDetails.shipmentCountry}"/>
                                            <span id="shipmentCountryError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
                                            <input type="hidden" id = "cartId" name="cartId" value="${orderDetails.cartId}">
                                    	</div>
                                      </div>
                                     
                                      <%-- <div class="row">
                                      	<div class="form-group col-lg-3" style="margin-top: -19px;">
                                            <label><spring:message code="doorNo.label" /></label>
                                            <input type="text" class="form-control" id="shipDno" readonly name="shipement_address_doorNo" value="${orderDetails.shipement_address_doorNo}"/>
                                            <span id="shipDnoError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
                                    	</div>
                                    	<div class="form-group col-lg-3" style="margin-top: -19px;">
                                            <label><spring:message code="shipment_street.label" /></label>
                                            <input type="text" class="form-control" id="shipStreet" readonly name="shipement_address_street" value="${orderDetails.shipement_address_street}"/>
                                            <span id="shipStreetError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
                                     	</div>
                                      	<div class="form-group col-lg-3" style="margin-top: -19px;">
                                            <label><spring:message code="shipment_location.label" /></label>
                                            <input type="text" class="form-control" id="shipLoc" readonly name="shipement_address_location" value="${orderDetails.shipement_address_location}"/>
                                            <span id="shipLocError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
                                     	</div>
                                       	<div class="form-group col-lg-3" style="margin-top: -19px;">
                                            <label><spring:message code="shipment_city.label" /></label>
                                            <input type="text" class="form-control" id="shipCity" readonly name="shipement_address_city" value="${orderDetails.shipement_address_city}"/>
                                            <span id="shipCityError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
                                    	</div>
                                      </div> --%>
                                      
                                     <div class="row">
                                        <div class="form-group col-lg-3">
                                            <label><spring:message code="order_channel" /></label>
                                            <input type="text" class="form-control" name="orderChannel" id="orderChannel" readonly value="${orderDetails.orderChannel}"/>
                                    	</div>   
                                    	<div class="form-group col-lg-3">
                                            <label><spring:message code="sales_executive.name.label" /></label>
                                            <input type="text" class="form-control" readonly name="sales_executive_name" value="${orderDetails.sales_executive_name}"/>
                                    	</div>
                                     	<div class="form-group col-lg-3">
                                            <label><spring:message code="shipment_mode.label" /></label>
                                            <input type="text" class="form-control" id="shipmentMode" readonly name="shipmentMode" value="${orderDetails.shipmentMode}"/>
                                    	</div>
                                      	<div class="form-group col-lg-3">
                                            <label><spring:message code="shiper_id.label" /></label>
                                            <input type="text" class="form-control" readonly name="shipperId" value="${orderDetails.shipperId}"/>
                                     	</div> 
                                     </div>
                                   <div class="row">
                                    <div class="form-group col-lg-6">
                                            <label><spring:message code="order.remarks.label" /></label>
                                             <textarea class="form-control" readonly="readonly" name="remarks" rows="1" style="resize: none;">${orderDetails.remarks}</textarea>
                                     </div>
                                     <div class="form-group col-lg-6">
                                            <label><spring:message code="customerFeedback.label" /></label>
                                            <textarea class="form-control" readonly="readonly" name="customerFeedback" rows="1" style="resize: none;" >${orderDetails.customerFeedback}</textarea>
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
                                                <th style="display: none;"><spring:message code="action.label"/></th>
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
                                                <td id="orderedQuantity${theCount.count}"  class='Pack'>${item.ordered_quantity}</td>
                                              	<td id="totalCost${theCount.count}" class='cost'>${item.total_cost}</td>
                                                <td id="make${theCount.count}">${item.make}</td>
                                                <td id="model${theCount.count}">${item.model}</td>
                                                <td id="colour${theCount.count}">${item.colour}</td>
                                                <td id="size${theCount.count}">${item.size}</td>
                                                <td style="display: none;" id="Del${theCount.count}"><img id="Img${theCount.count}"alt=""  style='width:15%;cursor:pointer;'  onclick='deleteItem(this);' src="${pageContext.request.contextPath}/images/itemdelete.png"/></td>
                                            </tr>
                                           </c:forEach> 
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
                                            <input type="text" class="form-control" name="shipmentCharges" id="shipmentCharges" readonly value="${orderDetails.shipmentCharges}"/>
                                     </div>
                              </div> 
							<input type="hidden" name="items" id="itemDetails">
							 <div class="row">
								<div class="col-lg-3"></div>
								<div class="col-lg-3" style="text-align: center;"></div>
								<div class="col-lg-3" style="text-align: right;"><label><spring:message code="total.order.value.label" /> </label></div>
								<div class="col-lg-3">
								<input type="text" class="form-control" id="orderTotalCost" name="orderTotalCost" readonly value="${orderDetails.orderTotalCost}"/>
							</div>
						</div>
						<br/>
						<div class="row" style="text-align: right;">
						<c:if test="${sessionScope.role == 'super admin'}">
							  	<input type="button" id="edit1" style="visibility: hidden;width: 80px;" class="btn bg-olive btn-inline" onclick="editOrder('outlet');" value="<spring:message code="edit.label" />" />
								<c:if test="${orderDetails.orderStatus != 'Draft' && orderDetails.orderStatus != 'draft'}">
									 <c:forEach var="activity" items="${orderDetails.nextActivities}">
									 	<input type="button" style="margin-left:1%;width: 80px;" class="btn bg-olive btn-inline" onclick="updateOrder('${activity}','edit','outlet');" value="${activity}" />
									 </c:forEach>
								</c:if>
						  </c:if>
						  <c:if test="${sessionScope.role != 'super admin'}">
							<c:if test="${flowUnder == 'outlet'}">
					           <c:forEach var="accessControl" items="${sessionScope.outletCustomerOrder}">
					                <c:if test="${accessControl.appDocument == 'outletCustomerOrders' && accessControl.write == true && accessControl.read == true}">
					                	<input type="button" id="edit1" style="visibility: hidden;width: 80px;" class="btn bg-olive btn-inline" onclick="editOrder('outlet');" value="<spring:message code="edit.label" />" /> 
					                </c:if>
					           </c:forEach>
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
				           		<c:forEach var="accessControl" items="${sessionScope.warehouseSalesOrder}">
	                				<c:if test="${accessControl.appDocument == 'WarehouseShipmentOrders' && accessControl.write == true && accessControl.read == true}">
	                					<input type="button" id="edit1" style="visibility: hidden;width: 80px;" class="btn bg-olive btn-inline" onclick="editOrder('outlet');" value="<spring:message code="edit.label" />" />
	                				</c:if>
	                			</c:forEach>
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
				           		<c:forEach var="accessControl" items="${sessionScope.orderManagemetSalesOrder}">
	                				<c:if test="${accessControl.appDocument == 'OrderManagementSalesOrder' && accessControl.write == true}">
	                					<input type="button" id="edit1" style="visibility: hidden;width: 80px;" class="btn bg-olive btn-inline" onclick="editOrder('outlet');" value="<spring:message code="edit.label" />" />
	                				</c:if>
	                			</c:forEach>
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
						<%-- <c:if test="${type == 'management' }">
							<input type="button" id="edit1" style="visibility: hidden;width: 80px;" class="btn bg-olive btn-inline" onclick="editOrder('outlet');" value="<spring:message code="edit.label" />" />
							<c:if test="${orderDetails.orderStatus != 'Draft' && orderDetails.orderStatus != 'draft'}">
								 <c:forEach var="activity" items="${orderDetails.nextActivities}">
								 	<input type="button" style="margin-left:1%;width: 80px;" class="btn bg-olive btn-inline" onclick="updateOrder('${activity}','edit','outlet');" value="${activity}" />
								 </c:forEach>
						    </c:if>
						</c:if> --%>
							<input type="button" class="btn bg-olive btn-inline" style="margin-left:1%; margin-right: 1%;width: 80px;" onclick="viewOrders('${status}','','0','${type}');" value="<spring:message code="back.label" />" />
						</div>
						<br/>
                       <div class="box-footer"></div>
                            <input type="hidden" name="operation" value="orders">
                       </div>
              </form>
      </div>

</div>
</div>
</section><!-- /.content -->

        <script type="text/javascript">
            $(function() {
             /*   $('#productsList').dataTable({
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
		    		 