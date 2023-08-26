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
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/goodstransfer.js"></script>
<style>
  .odd{display:none!important;}
</style>
</head>
<body>
<!-- Content Header (Page header) -->
<%-- <section class="content-header">
		<h1><spring:message code="outlet.management.label" />
			<small><spring:message code="deliveries.label" /></small>
		</h1>
        <ol class="breadcrumb">
         	<li><a href="#" onclick="return viewDashboard('inventorymanager');"><i class="fa fa-dashboard"></i><spring:message code="home.label" /></a></li>
       		<li class="active"><a style="cursor: pointer;" onclick="showOutletFlows();"><spring:message code="outlet.management.label"/></a></li>
       		<li class="active"><a style="cursor: pointer;" onclick="showShipmentsFlows();"><spring:message code="deliveries.label"/></a></li>
      </ol>
  </section> --%>
<!-- Main content -->
<section class="content">
<div class="row">
  <div class="col-lg-12">
				<div class="box box-primary">
                                <div class="box-header" style="text-align: center">
                                <br/>
                                <h3>${orderDetails.orderReference}  <spring:message code="details.label" /></h3>
                                </div><!-- /.box-header -->
                                <!-- form start -->
                                <form role="form">
                                    <div class="box-body">
                                     <div id="Error" style="text-align:center;color:red;font-weight:bold;">${err}</div>
                                    
                                    <div class="row">
                                    <div class="form-group col-lg-4">
                                            <label><spring:message code="store_location.laber" /></label>
                                            <input type="text" class="form-control" readonly value="${orderDetails.store_location}" id="outletLocation"/>
                                     </div>
                                        
                                        
                                         <c:if test="${orderDetails.orderType == 'immediate'}">
                                        <div class="form-group col-lg-4">
                                            <label><spring:message code="order_type.label" /></label>
                                            <input type="text" class="form-control" readonly value="Dine in"/>
                                        </div>
                                        </c:if>
                                        
                                         <c:if test="${orderDetails.orderType == 'take_away'}">
                                        <div class="form-group col-lg-4">
                                            <label><spring:message code="order_type.label" /></label>
                                            <input type="text" class="form-control" readonly value="Take away "/>
                                        </div>
                                        </c:if>
                                        <c:if test="${orderDetails.orderType == 'home_delivery'}">
                                        <div class="form-group col-lg-4">
                                            <label><spring:message code="order_type.label" /></label>
                                            <input type="text" class="form-control" readonly value="Home Delivery"/>
                                        </div>
                                        </c:if>
                                        
                                        <div class="form-group col-lg-4">
                                            <label><spring:message code="table_number.label" /></label>
                                            <input type="text" class="form-control" readonly id="receipt_location" value="${orderDetails.salesLocation}"/>
                                        </div>
                                        </div>
                                        
                                          
                                    <div class="row">
                                        <div class="form-group col-lg-4">
                                            <label><spring:message code="total_bill.label" /></label>
                                            <input type="text" class="form-control" readonly value="${orderDetails.grandTotal}"/>
                                        </div>
                                        
                                        <div class="form-group col-lg-4">
                                            <label><spring:message code="customer_email.label" /></label>
                                            <input type="text" class="form-control" readonly value="${orderDetails.email}"/>
                                        </div>
                                        
                                        <div class="form-group col-lg-4">
                                            <label><spring:message code="customer_contact_num.label" /> </label>
                                            <input type="text" class="form-control" readonly value="${orderDetails.mobileNumber}"/>
                                        </div>
                                        
                                         <div class="form-group col-lg-4">
                                            <label><spring:message code="order_date.label" /> </label>
                                            <input type="text" class="form-control" readonly value="${orderDetails.date}"/>
                                        </div>
                                        
                                        <div class="form-group col-lg-4">
                                            <label><spring:message code="waiter_name.label" /> </label>
                                            <input type="text" class="form-control" readonly value="${orderDetails.salesExecutive}"/>
                                        </div>
                                        
                                        <div class="form-group col-lg-4">
                                            <label><spring:message code="status.label" /> </label>
                                            <input type="text" class="form-control" readonly value="${orderDetails.status}"/>
                                        </div>
                                        
                                      <%--   <c:if test="${orderDetails.orderType == 'take_away'}"> --%>
                                        	<div class="form-group col-lg-4">
                                            <label><spring:message code="shipment_address1.label" /> </label>
                                            <input type="text" class="form-control" readonly value="${orderDetails.shipmentAddress1}"/>
                                        </div>
                                        
                                        <div class="form-group col-lg-4">
                                            <label><spring:message code="shipment_address2.label" /> </label>
                                            <input type="text" class="form-control" readonly value="${orderDetails.shipmentAddress2}"/>
                                        </div>
                                        
                                        <div class="form-group col-lg-4">
                                            <label><spring:message code="shipment_contact.label" /> </label>
                                            <input type="text" class="form-control" readonly value="${orderDetails.shipmentContact}"/>
                                        </div>
                                        
                                       <%--  </c:if> --%>
                                        
                                     </div>
                                     
                                     
                                      <div class="box-body table-responsive">
                                        <table id="productsList" class="table table-bordered table-hover">
                                          <thead style="background-color: #3c8dbc; color: #ffffff">
                                            <tr>
                                            	<th><spring:message code="item_id.label"/></th>
                                                <th><spring:message code="item_description.label"/></th>
                                                <th><spring:message code="order_quantity.label"/></th>
                                                <th><spring:message code="item_price.label"/></th>
                                                <th><spring:message code="order_total_price.label"/></th>
                                                
                                           </tr>
                                          </thead>
                                          <tbody>
                                              <tbody>
                       <c:forEach var="items" items="${orderDetails.itemDetails}">
             		   <tr>
              			<td>${items.itemCode}</td>
                  		<td>${items.itemDescription}</td>
                  		<td>${items.quantity}</td>
                  		<td>${items.price}</td>
                  		<td>${items.total}</td>
                  		
                  	   </tr>
              		   </c:forEach> 
		 </tbody>
                                          </tbody>
                                       </table>
                                    </div>
                                   <!--  </div> -->
                                    <br/> <br/>
                                    
                                    <%--  <div class="row">
                                         <div class="form-group  col-lg-12">
                                         	<label><spring:message code="remarks.label" /></label>
                                            <textarea class="form-control" readonly>${stockReceiptDetails.remarks}</textarea>
 										 </div>
                                        <!--  <div class="col-lg-3"></div> -->
                                        </div> --%>
                                        <br/>



							<%-- <div class="row">
								<div class="col-lg-4"></div>
								<div class="col-lg-4">
									<div class="form-group col-lg-6">
										<label><spring:message code="totalquantity.label" />:
										</label> <label id="totalQty">${stockReceiptDetails.receipt_total_qty}</label>
									</div>
									<div class="form-group col-lg-6">
										<label><spring:message code="cost.label" />: </label> <label
											id="totalCost">${stockReceiptDetails.receipt_total}</label>
									</div>
								</div>
								<div class="col-lg-4"></div>
							</div>
 --%>



						</div><!-- /.box-body -->

						<div class="row" style="text-align: center;">
							<input type="button" class="btn bg-olive btn-inline"
								onclick="viewOrdersByPage('${orderType}');"
								value="<spring:message code="back.label" />" />
						</div>
						<br/>
                                    <div class="box-footer">
                                     <!--    <button type="submit" class="btn btn-primary">Submit</button> -->
                                    </div>
                                    
                                </form>
                            </div>

</div>
</div>
</section><!-- /.content -->

        <script type="text/javascript">
            $(function() {
            /*    $('#productsList').dataTable({
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
		    		 