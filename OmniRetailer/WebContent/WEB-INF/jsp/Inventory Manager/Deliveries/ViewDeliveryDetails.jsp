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
	
	 var status = $("#orderStatus").val();
	 if(status == "pending" || status == "Pending"){
		$("#edit").css("visibility", "visible");
		$("#edit1").css("visibility", "visible");
	} 
	else
		$("#edit").css("visibility", "hidden"); 
	
});
</script>
</head>
<body>
<!-- Content Header (Page header) -->
<%-- <section class="content-header">
				<h1><spring:message code="outlet.management.label" />
     				<small><spring:message code="deliveries.label" /></small>
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
                                   	<c:if test="${type == 'management' }">
									 	<input type="button" id="edit" style="visibility: hidden;width: 54px;position: relative;" class="btn bg-olive btn-inline" onclick="editOrder();" value=" <spring:message code="edit.label" /> " />
                                   	</c:if>
										<input type="button" class="btn bg-olive btn-inline" style="margin-left:2%; margin-right: 1%;position: relative;" onclick="viewOrders('${orderDetails.orderStatus}','OutletShipment','0',${type});" value="<spring:message code="back.label" />" />
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
                                            <input type="text" class="form-control" name="saleLocation" id="outletLocation" readonly value="${orderDetails.saleLocation}"/>
                                     </div>
                                      <div class="form-group col-lg-3"></div>
                                     </div>
                                    
                                   <div class="row">
                                     <div class="form-group col-lg-3">
                                            <label><spring:message code="order_date.label" /></label>
                                            <input type="text" class="form-control" name="orderDate" readonly value="${orderDetails.orderDate}"/>
                                     </div>
                                     <div class="form-group col-lg-3">
                                            <label><spring:message code="delivery_date.label" /></label>
                                            <input type="text" class="form-control" name="deliveryDate" readonly value="${orderDetails.deliveryDate}"/>
                                     </div>
                                    <div class="form-group col-lg-3">
                                            <label><spring:message code="payment.mode.label" /></label>
                                            <input type="text" class="form-control" name="paymentMode" readonly value="${orderDetails.paymentMode}"/>
                                     </div>
                                     <div class="form-group col-lg-3">
                                            <label><spring:message code="payment.type.label" /></label>
                                            <input type="text" class="form-control" name="paymentType" readonly value="${orderDetails.paymentType}"/>
                                     </div>   
                                   </div>
                                    
                                    
                                    <div class="row">
                                     <div class="form-group col-lg-3">
                                            <label><spring:message code="order_delivery_type.label" /></label>
                                            <input type="text" class="form-control" name="orderDeliveryType" readonly value="${orderDetails.orderDeliveryType}"/>
                                     </div>
                                     <div class="form-group col-lg-3">
                                            <label><spring:message code="order_status.label" /></label>
                                            <input type="text" class="form-control" name="orderStatus" id="orderStatus" readonly value="${orderDetails.orderStatus}"/>
                                     </div>
                                    <div class="form-group col-lg-3">
                                            <label><spring:message code="customer_email.label" /></label>
                                            <input type="text" class="form-control" name="email_id" readonly value="${orderDetails.email_id}"/>
                                     </div>
                                     <div class="form-group col-lg-3">
                                            <label><spring:message code="customer_contact_num.label" /></label>
                                            <input type="text" class="form-control" name="mobile_num" readonly value="${orderDetails.mobile_num}"/>
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
                                            <input type="text" class="form-control" name="customer_address_doorNo" readonly value="${orderDetails.customer_address_doorNo}"/>
                                     </div>
                                      <div class="form-group col-lg-3" style="margin-top: -19px;">
                                            <label><spring:message code="customer_street.label" /></label>
                                            <input type="text" class="form-control" name="customer_address_street" readonly value="${orderDetails.customer_address_street}"/>
                                     </div>
                                       <div class="form-group col-lg-3" style="margin-top: -19px;">
                                            <label><spring:message code="customer_location.label" /></label>
                                            <input type="text" class="form-control" name="customer_address_location" readonly value="${orderDetails.customer_address_location}"/>
                                     </div>
                                      <div class="form-group col-lg-3" style="margin-top: -19px;">
                                            <label><spring:message code="customer_city.label" /></label>
                                            <input type="text" class="form-control" name="customer_address_city" readonly value="${orderDetails.customer_address_city}"/>
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
                                            <input type="text" class="form-control" readonly name="billing_address_doorNo" value="${orderDetails.billing_address_doorNo}"/>
                                     </div>
                                      <div class="form-group col-lg-3" style="margin-top: -19px;">
                                            <label><spring:message code="billing_street.label" /></label>
                                            <input type="text" class="form-control" readonly name="billing_address_street" value="${orderDetails.billing_address_street}"/>
                                     </div>
                                       <div class="form-group col-lg-3" style="margin-top: -19px;">
                                            <label><spring:message code="billing_location.label" /></label>
                                            <input type="text" class="form-control" readonly name="billing_address_location" value="${orderDetails.billing_address_location}"/>
                                     </div>
                                        <div class="form-group col-lg-3" style="margin-top: -19px;">
                                            <label><spring:message code="billing_city.label" /></label>
                                            <input type="text" class="form-control" readonly name="billing_address_city" value="${orderDetails.billing_address_city}"/>
                                     </div>
                                    </div>
                                     <div class="row">
                                    <div class="form-group col-lg-3">
                                            <label style="text-decoration: underline; font-size: 16px;font-weight:bold;"><spring:message code="shipmentAddress.label" /></label>
                                     </div>
                                     </div>
                                      <div class="row">
                                      	<div class="form-group col-lg-3" style="margin-top: -19px;">
                                            <label><spring:message code="doorNo.label" /></label>
                                            <input type="text" class="form-control" readonly name="shipement_address_doorNo" value="${orderDetails.shipement_address_doorNo}"/>
                                    	</div>
                                    	<div class="form-group col-lg-3" style="margin-top: -19px;">
                                            <label><spring:message code="shipment_street.label" /></label>
                                            <input type="text" class="form-control" readonly name="shipement_address_street" value="${orderDetails.shipement_address_street}"/>
                                     	</div>
                                      	<div class="form-group col-lg-3" style="margin-top: -19px;">
                                            <label><spring:message code="shipment_location.label" /></label>
                                            <input type="text" class="form-control" readonly name="shipement_address_location" value="${orderDetails.shipement_address_location}"/>
                                     	</div>
                                       	<div class="form-group col-lg-3" style="margin-top: -19px;">
                                            <label><spring:message code="shipment_city.label" /></label>
                                            <input type="text" class="form-control" readonly name="shipement_address_city" value="${orderDetails.shipement_address_city}"/>
                                    	</div>
                                      </div>
                                      
                                     <div class="row">
                                        <div class="form-group col-lg-3">
                                            <label><spring:message code="order_channel" /></label>
                                            <input type="text" class="form-control" name="orderChannel" readonly value="${orderDetails.orderChannel}"/>
                                    	</div>   
                                    	<div class="form-group col-lg-3">
                                            <label><spring:message code="sales_executive.name.label" /></label>
                                            <input type="text" class="form-control" readonly name="sales_executive_name" value="${orderDetails.sales_executive_name}"/>
                                    	</div>
                                     	<div class="form-group col-lg-3">
                                            <label><spring:message code="shipment_mode.label" /></label>
                                            <input type="text" class="form-control" readonly name="shipmentMode" value="${orderDetails.shipmentMode}"/>
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
                                            	<th><spring:message code="item_id.label"/></th>
                                                <th><spring:message code="item_description.label"/></th>
                                                <th><spring:message code="item_price.label"/></th>
                                                <th><spring:message code="order_quantity.label"/></th>
                                                <th><spring:message code="item_cost.label"/></th>
                                                <th><spring:message code="make.label"/></th>
                                                <th><spring:message code="model.label"/></th>
                                                <th><spring:message code="colour.label"/></th>
                                                <th><spring:message code="size.label"/></th>
                                           </tr>
                                          </thead>
                            			<tbody style="text-align: center;">
                                           <c:forEach var="item" items="${orderDetails.itemDetails}" varStatus="theCount">
                                        	 <tr id="dynamicdiv${theCount.count}" style='margin-top:5px;'>
                                            	<td id="itemId${theCount.count}">${item.item_id}<input type="hidden" id="skuId${theCount.count}" value="${item.skuId}" /></td>
                                                <td id="itemName${theCount.count}">${item.item_name}</td>
                                                <td id="itemPrice${theCount.count}">${item.item_price}</td>
                                                <td id="orderedQuantity${theCount.count}"  class='Pack'>${item.ordered_quantity}</td>
                                              	<td id="totalCost${theCount.count}" class='cost'>${item.total_cost}</td>
                                                <td id="make${theCount.count}">${item.make}</td>
                                                <td id="model${theCount.count}">${item.model}</td>
                                                <td id="colour${theCount.count}">${item.colour}</td>
                                                <td id="size${theCount.count}">${item.size}</td>
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
                                            <input type="text" class="form-control" name="shipmentCharges" readonly value="${orderDetails.shipmentCharges}"/>
                                     </div>
                              </div> 
							<input type="hidden" name="items" id="itemDetails">
							 <div class="row">
								<div class="col-lg-3"></div>
								<div class="col-lg-3" style="text-align: center;"></div>
								<div class="col-lg-3" style="text-align: right;"><label><spring:message code="total.order.value.label" /> </label></div>
								<div class="col-lg-3">
								<input type="text" class="form-control" name="orderTotalCost" readonly value="${orderDetails.orderTotalCost}"/>
							</div>
 						</div>
						<br/>
						<div class="row" style="text-align: right;">
							<input type="button" id="edit1" style="visibility: hidden;width: 54px;" class="btn bg-olive btn-inline" onclick="editOrder();" value="<spring:message code="edit.label" />" />
							<input type="button" class="btn bg-olive btn-inline" style="margin-left:2%; margin-right: 1%;" onclick="viewOrders('${orderDetails.orderStatus}','OutletShipment','0',${type});" value="<spring:message code="back.label" />" />
						</div>
						<br/>
                                    <div class="box-footer"></div>
                                     	<input type="hidden" name="operation" value="Door Delivery">
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
		    		 