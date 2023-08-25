<!--/*
 * Project Name 	        : OmniRetailerCustomer
 * Written By		        : Mythri.S
 * file name		        : inventorymanager/Orders/newOrder.jsp
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

<script type="text/javascript">
 $(document).ready(function(){
	/*  var date = getCurrentDate();
		$("#orderDate").val(date); 
	  */
	  var dateTime = getCurrentDate();
	  var date = dateTime.split(' ');
	  date = date[0].split('/');
	  var formatedDate = date[1]+"/"+date[0]+"/"+date[2];
	  $('#orderDate').val(formatedDate);
	  callCalender('orderDate');
	  callCalender('deliveryDate');
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
				<h1><spring:message code="sales.label" />
     				<small><spring:message code="orders.label" /></small>
    			</h1>
                 <ol class="breadcrumb">
                    <li><a style="cursor: pointer;" onclick="return viewDashboard('inventorymanager');"><i class="fa fa-dashboard"></i><spring:message code="home.label" /></a></li>
                        <li class="active"><spring:message code="warehouse.management.label"/></li>
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
                                  	<input type="button" id="edit" style="position: relative;" class="btn bg-olive btn-inline" onclick="updateOrder('submitted','new','warehouse');" value="<spring:message code="submit.label" />" />
								  	<input type="button" id="edit"  class="btn bg-olive btn-inline" style="margin-left:1%;margin-right:1%;width: 68px;position: relative;" onclick="updateOrder('draft','new','warehouse');" value="<spring:message code="save.label" />" />
								  <c:if test="${sessionScope.role == 'super admin'}"> 
								  	<input type="button" class="btn bg-olive btn-inline" style="margin-right: 1%;width: 68px;position: relative;" onclick="viewWarehouseOrders('${orderDetails.orderStatus}','wshipmentOrders','0');" value="<spring:message code="cancel.label" />" />
								  </c:if>
								<c:forEach var="accessControl" items="${sessionScope.warehouseSales}">
                  					<c:if test="${accessControl.appDocument == 'WarehouseOrders' && accessControl.write == true && accessControl.read == true}">	  	
								  	<input type="button" class="btn bg-olive btn-inline" style="margin-right: 1%;width: 68px;position: relative;" onclick="viewWarehouseOrders('${orderDetails.orderStatus}','wshipmentOrders','0');" value="<spring:message code="cancel.label" />" />
								  	</c:if>
								</c:forEach>
									<hr style="margin-top: 4px;width: 99%;" />
									</div>
                                   <div class="row">
                                     <div class="form-group col-lg-3">
                                            <label><spring:message code="order_date.label" /> <span style="color:red; font-size:2">*</span></label>
                                          <!--   <input type="text" id="orderDate" readonly="readonly" class="form-control"> -->
                                            <div class="input-group">
                                            <div class="input-group-addon">
                                                <i class="fa fa-calendar"></i>
                                            </div>
                                            <input class="form-control" readonly="readonly" style="background-color: white;" name="orderDate" id="orderDate" size="20" type="text" onfocus="callCalender('orderDate')" onclick="callCalender('orderDate')" placeholder="DD/MM/YYYY"/>
                                           <!--  <input type="text" name="orderDate" id="orderDate" required value="" class="form-control" data-inputmask="'alias': 'dd/mm/yyyy'" data-mask/> -->
                                        </div> <!-- /.input group -->
                                        <span id="orderDateError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
                                     </div>
                                     <div class="form-group col-lg-3">
                                            <label><spring:message code="delivery_date.label" /> <span style="color:red; font-size:2">*</span></label>
                                            <div class="input-group">
                                            <div class="input-group-addon">
                                                <i class="fa fa-calendar"></i>
                                            </div>
                                             <input class="form-control" readonly="readonly" style="background-color: white;" name="deliveryDate" id="deliveryDate" size="20" type="text" onfocus="callCalender('deliveryDate')" onclick="callCalender('deliveryDate')" placeholder="DD/MM/YYYY"/>
                                           <!--  <input type="text" name="deliveryDate" id="deliveryDate" required value="" class="form-control" data-inputmask="'alias': 'dd/mm/yyyy'" data-mask/> -->
                                        </div><!-- /.input group -->
                                           <span id="deliveryDateError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
                                     </div>
                                    <div class="form-group col-lg-3">
                                            <label><spring:message code="payment.mode.label" /></label>
                                            <select class="form-control" name="paymentMode" id="paymentMode">
                                            <option value="Dedit Card">Dedit Card</option>
                                            <option value="Credit Card">Credit Card</option>
                                            <option value="Pay Cash">Pay Cash</option>
                                            </select>
                                     </div>
                                     <div class="form-group col-lg-3">
                                            <label><spring:message code="payment.type.label" /></label>
                                            <select class="form-control" name="paymentType" id="paymentType">
                                            <option value="On Delivery">On Delivery</option>
                                            <option value="Prepaid">Prepaid</option>
                                            </select>
                                     </div>   
                                   </div>
                                    <div class="row">
                                     <div class="form-group col-lg-3">
                                      	<label><spring:message code="sales_location.label" /></label>
                                            <select class="form-control" id="outletLocation" name="saleLocation">
                                             <c:forEach var="location" items="${locationsList}">
												<option value="${location}">${location}</option>
											 </c:forEach>
											 </select>
                                     </div>
                                     <div class="form-group col-lg-3">
                                     <label><spring:message code="order_delivery_type.label" /></label>
                                       <select class="form-control" name="orderDeliveryType" id="orderDeliveryType">
                                            <option value="Pick Up">Pick Up</option>
                                            <option value="Door Delivery">Door Delivery</option>
                                            </select>
                                           <%--  <label><spring:message code="order_status.label" /></label>--%>
                                            <input type="hidden" class="form-control" readonly="readonly" name="orderStatus" id="orderStatus"  value=""/> 
                                     </div>
                                    <div class="form-group col-lg-3">
                                            <label><spring:message code="customer_email.label" /></label>
                                            <input type="text" class="form-control" name="email_id" id="email_id" onblur="validateEmail();" value=""/>
                                            <span id="emailError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
                                     </div>
                                     <div class="form-group col-lg-3">
                                            <label><spring:message code="customer_contact_num.label" /> <span style="color:red; font-size:2">*</span></label>
                                             <div class="row">
				                                  <div class="col-lg-4 col-md-4 col-sm-4 col-xs-4">
				                                  	<select class="form-control" style="padding: 6px 6px;" id="defaultCountry" title="India - IN &#013;USA - US &#013;UK - GB &#013;Australia - AU">
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
				                                  <input type="hidden" class="form-control" name="mobile_num" id="mobile_num"  value=""/>
				                                   <input type="hidden" id="output" />
				                             </div>
				                        	<span id="error" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
                                            
                                            
                                           <!--  <div class="row">
                                            <div class="form-group col-lg-3">
                                            <input type="text" class="form-control" id="defaultCountry" size="2" maxlength="2" oninput="this.value = this.value.replace(/[^A-Za-z]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');"/>
                                            </div>
                                            <div class="form-group col-lg-9">
                                            <input type="text" class="form-control" id="phoneNumber" size="25" maxlength="25" oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');"/>
                                            </div>
                                            <input type="hidden" class="form-control" name="mobile_num" id="mobile_num"  value=""/>
                                             <input type="hidden" name="output" id="output" />
                                            <span id="error" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
                                            
                                            </div> -->
                                           <!--  <span id="mobile_numError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span> -->
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
                                            <input type="text" class="form-control" id="custDno" name="customer_address_doorNo"  value=""/>
                                            <span id="custDnoError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
                                     </div>
                                      <div class="form-group col-lg-3" style="margin-top: -19px;">
                                            <label><spring:message code="customer_street.label" /> <span style="color:red; font-size:2">*</span></label>
                                            <input type="text" class="form-control" id="custStreet" name="customer_address_street"  value=""/>
                                            <span id="custStreetError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
                                     </div>
                                       <div class="form-group col-lg-3" style="margin-top: -19px;">
                                            <label><spring:message code="customer_location.label" /> <span style="color:red; font-size:2">*</span></label>
                                            <input type="text" class="form-control" id="custLoc" name="customer_address_location"  value=""/>
                                            <span id="custLocError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
                                     </div>
                                      <div class="form-group col-lg-3" style="margin-top: -19px;">
                                            <label><spring:message code="customer_city.label" /> <span style="color:red; font-size:2">*</span></label>
                                            <input type="text" class="form-control" id="custCity" name="customer_address_city"  value=""/>
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
                                            <input type="text" class="form-control"  id="billDno" name="billing_address_doorNo" value=""/>
                                            <span id="billDnoError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
                                     </div>
                                      <div class="form-group col-lg-3" style="margin-top: -19px;">
                                            <label><spring:message code="billing_street.label" /> <span style="color:red; font-size:2">*</span></label>
                                            <input type="text" class="form-control" id="billStreet" name="billing_address_street" value=""/>
                                            <span id="billStreetError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
                                     </div>
                                       <div class="form-group col-lg-3" style="margin-top: -19px;">
                                            <label><spring:message code="billing_location.label" /> <span style="color:red; font-size:2">*</span></label>
                                            <input type="text" class="form-control"  id="billLoc" name="billing_address_location" value=""/>
                                            <span id="billLocError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
                                     </div>
                                        <div class="form-group col-lg-3" style="margin-top: -19px;">
                                            <label><spring:message code="billing_city.label" /> <span style="color:red; font-size:2">*</span></label>
                                            <input type="text" class="form-control" id="billCity" name="billing_address_city" value=""/>
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
                                            <label><spring:message code="doorNo.label" /> <span style="color:red; font-size:2">*</span></label>
                                            <input type="text" class="form-control" id="shipDno" name="shipement_address_doorNo" value=""/>
                                            <span id="shipDnoError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
                                    	</div>
                                    	<div class="form-group col-lg-3" style="margin-top: -19px;">
                                            <label><spring:message code="shipment_street.label" /> <span style="color:red; font-size:2">*</span></label>
                                            <input type="text" class="form-control" id="shipStreet" name="shipement_address_street" value=""/>
                                            <span id="shipStreetError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
                                     	</div>
                                      	<div class="form-group col-lg-3" style="margin-top: -19px;">
                                            <label><spring:message code="shipment_location.label" /> <span style="color:red; font-size:2">*</span></label>
                                            <input type="text" class="form-control" id="shipLoc" name="shipement_address_location" value=""/>
                                            <span id="shipLocError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
                                     	</div>
                                       	<div class="form-group col-lg-3" style="margin-top: -19px;">
                                            <label><spring:message code="shipment_city.label" /> <span style="color:red; font-size:2">*</span></label>
                                            <input type="text" class="form-control" id="shipCity" name="shipement_address_city" value=""/>
                                            <span id="shipCityError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
                                    	</div>
                                      </div>
                                      
                                     <div class="row">
                                        <div class="form-group col-lg-3">
                                            <label><spring:message code="order_channel" /></label>
                                           <%--  <input type="text" class="form-control" name="orderChannel"  value="${orderDetails.orderChannel}"/> --%>
                                            <select class="form-control" name="orderChannel" id="orderChannel">
                                            <option value="Online">Online</option>
                                            <option value="Phone">Phone</option>
                                            <option value="Sales Executive">Sales Executive</option>
                                            <option value="Direct">Direct</option>
                                            </select>
                                    	</div>   
                                    	<div class="form-group col-lg-3">
                                            <label><spring:message code="sales_executive.name.label" /></label>
                                            <input type="text" class="form-control"  name="sales_executive_name" value=""/>
                                    	</div>
                                     	<div class="form-group col-lg-3">
                                            <label><spring:message code="shipment_mode.label" /></label>
                                            <select class="form-control" name="shipmentMode" id="shipmentMode">
                                            <option value="Rail">Rail</option>
                                            <option value="Flight">Flight</option>
                                            <option value="Express">Express</option>
                                            <option value="Ordinary">Ordinary</option>
                                            </select>
                                    	</div>
                                      	<div class="form-group col-lg-3">
                                            <label><spring:message code="shiper_id.label" /></label>
                                            <input type="text" class="form-control"  name="shipperId" value=""/>
                                     	</div> 
                                     </div>
                                   <div class="row">
                                    <div class="form-group col-lg-6">
                                            <label><spring:message code="order.remarks.label" /></label>
                                             <textarea class="form-control"  name="remarks" rows="1" style="resize: none;"></textarea>
                                           <%--  <input type="text" class="form-control" readonly value="${orderDetails.remarks}"/> --%>
                                     </div>
                                     <div class="form-group col-lg-6">
                                            <label><spring:message code="customerFeedback.label" /></label>
                                            <textarea class="form-control"  name="customerFeedback" rows="1" style="resize: none;"></textarea>
                                          <%--   <input type="text" class="form-control" readonly value="${orderDetails.customerFeedback}"/> --%>
                                     </div>   
                                   </div> 
                                   <div class="row">
                                         <div class="col-lg-3"></div>
                                         <div class="form-group col-lg-6">
                                         	<label><spring:message code="search.items.here.label" /></label>
                                         	<input type="text"  class="form-control searchItems" id="searchItems"  placeholder="<spring:message code="search.items.here.label" />"  style="height:30PX;border-radius: 6px !important;background:url(${pageContext.request.contextPath}/images/search.png) no-repeat;background-position:right;" />
											<div class="services">
								    			<div class="items">
								     				<ul class="matchedStringUl receipt" style=""></ul>
								   				</div>
											</div>
                                           <!--  <input type="text" list="skuList" class="form-control" id="searchCriteria" />
 												<datalist id="skuList"></datalist> -->
  										 </div>
                                         <div class="col-lg-3"></div>
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
                            			<tbody style="text-align: center;"></tbody>
                                      </table>
                                      <br/>
                                    </div>
                                   <br>
                                   <%-- <div id="tax">
                                   <c:forEach var="tax" items="${taxDetails}" varStatus="theCount">
                                    <div class="row">
                                    <div class="form-group col-lg-6"></div>
                                     <div class="form-group col-lg-3" style="text-align: right;"><label><span class="taxName">${tax.taxName}</span> - <span class="taxRate">${tax.taxRate}<c:if test="${tax.taxType == 'percentage'}">%</c:if></span></label></div>
                                     <div class="form-group col-lg-3">
                                            <input type="text" class="form-control" id="orderTax${theCount.count}" readonly value="" oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');"/>
                                     </div>   
                                     </div>
                                     </c:forEach>
                                     
                                     </div> --%>
                                  <div class="row">
                                     <div class="form-group col-lg-6"></div>   
                                     <div class="form-group col-lg-3" style="text-align: right;"> <label><spring:message code="total.tax.label" /></label></div>
                                     <div class="form-group col-lg-3">
                                            <input type="text" class="form-control" name="orderTax" id="totalTax" value="" oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');"/>
                                     </div>
                                   </div> 
                                     
                                   <div class="row">
                                     <div class="form-group col-lg-6"></div>   
                                     <div class="form-group col-lg-3" style="text-align: right;"> <label><spring:message code="shipment_charges.label" /></label></div>
                                     <div class="form-group col-lg-3">
                                            <input type="text" class="form-control" name="shipmentCharges" id="shipmentCharges" value="" oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');"/>
                                     </div>
                                   </div> 
                                   
                                  
							<input type="hidden" name="items" id="itemDetails">


							 <div class="row">
								<div class="col-lg-6"></div>
								<div class="col-lg-3" style="text-align: right;"><label><spring:message code="total.order.value.label" /> </label></div>
								<div class="col-lg-3">
								<input type="text" class="form-control" id="orderTotalCost" name="orderTotalCost" readonly value=""/>
							</div>
 						</div>
						<br/>

						<div class="row" style="text-align: right;">
							<input type="button" id="edit"  class="btn bg-olive btn-inline" onclick="updateOrder('submitted','new','warehouse');" value="<spring:message code="submit.label" />" />
							<input type="button" id="edit"  class="btn bg-olive btn-inline" style="margin-right:1%;margin-left:1%;width: 68px;" onclick="updateOrder('draft','new','warehouse');" value="<spring:message code="save.label" />" />
						<c:if test="${sessionScope.role == 'super admin'}">
							<input type="button" class="btn bg-olive btn-inline" style="margin-right: 1%;" onclick="viewWarehouseOrders('${orderDetails.orderStatus}','wshipmentOrders','0');" value="<spring:message code="cancel.label" />" />
						</c:if>
						<c:forEach var="accessControl" items="${sessionScope.warehouseSales}">
                  			<c:if test="${accessControl.appDocument == 'WarehouseOrders' && accessControl.write == true && accessControl.read == true}">	  	
							<input type="button" class="btn bg-olive btn-inline" style="margin-right: 1%;" onclick="viewWarehouseOrders('${orderDetails.orderStatus}','wshipmentOrders','0');" value="<spring:message code="cancel.label" />" />
							</c:if>
						</c:forEach>
						</div>
						<br/>
                     <div class="box-footer">
                     </div>
                     <input type="hidden" name="operation" value="orders">  
                     </div>
                 </form>
             </div>
</div>
</div>
</section><!-- /.content -->
	<%-- 	  <!-- InputMask -->
        <script src="${pageContext.request.contextPath}/js/plugins/input-mask/jquery.inputmask.js" type="text/javascript"></script>
        <script src="${pageContext.request.contextPath}/js/plugins/input-mask/jquery.inputmask.date.extensions.js" type="text/javascript"></script>
        <script src="${pageContext.request.contextPath}/js/plugins/input-mask/jquery.inputmask.extensions.js" type="text/javascript"></script>
		<script type="text/javascript">
            $(function() {
                //Datemask dd/mm/yyyy
                 $("#orderDate").inputmask("dd/mm/yyyy", {"placeholder": "dd/mm/yyyy"}); 
                $("#deliveryDate").inputmask("dd/mm/yyyy", {"placeholder": "dd/mm/yyyy"});
            });
            </script>
 --%>
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
		    		 