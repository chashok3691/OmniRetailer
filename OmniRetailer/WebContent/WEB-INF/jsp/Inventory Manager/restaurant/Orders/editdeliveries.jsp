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
	<script src="${pageContext.request.contextPath}/js/form_plugin.js"></script>
	

</head>
<body>
<!-- Content Header (Page header) -->

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
                                <form role="form" name="form">
                                    <div class="box-body">
                                     <div id="Error" style="text-align:center;color:red;font-weight:bold;">${err}</div>
                                    
                                    <div class="row">
                                    <div class="form-group col-lg-4">
                                            <label><spring:message code="store_location.laber" /></label>
                                            <input type="text" class="form-control" readonly value="${orderDetails.store_location}" id="outletLocation" name ="storeLocation"/>
                                    		<input type = "hidden" name="orderReference" value = "${orderDetails.orderReference}">
                                    		<input type = "hidden" name="store_location" value = "${orderDetails.store_location}">
                                     </div>
                                        
                                        
                                         <c:if test="${orderDetails.orderType == 'immediate'}">
                                        <div class="form-group col-lg-4">
                                            <label><spring:message code="order_type.label" /></label>
                                            <input type="text" class="form-control" readonly value="Dine in"/>
                                            <input type="hidden" class="form-control" readonly value="immediate" name = "orderType"/>
                                        </div>
                                        </c:if>
                                        
                                         <c:if test="${orderDetails.orderType == 'take_away'}">
                                        <div class="form-group col-lg-4">
                                            <label><spring:message code="order_type.label" /></label>
                                            <input type="text" class="form-control" readonly value="Take away "/>
                                            <input type="hidden" class="form-control" readonly value="take_away" name = "orderType"/>
                                        </div>
                                        </c:if>
                                        
                                        <c:if test="${orderDetails.orderType == 'home_delivery'}">
                                        <div class="form-group col-lg-4">
                                            <label><spring:message code="order_type.label" /></label>
                                            <input type="text" class="form-control" readonly value="Home Delivery"/>
                                            <input type="hidden" class="form-control" readonly value="home_delivery" name = "orderType"/>
                                        </div>
                                        </c:if>
                                        
                                        <div class="form-group col-lg-4">
                                            <label><spring:message code="table_number.label" /></label>
                                            <input type="text" class="form-control" id="orderlocation" value="${orderDetails.salesLocation}" name="salesLocation"/>
                                        </div>
                                        </div>
                                        
                                          
                                    <div class="row">
                                        <div class="form-group col-lg-4">
                                            <label><spring:message code="total_bill.label" /></label>
                                            <input type="text" class="form-control"  value="${orderDetails.grandTotal}" name="grandTotal"/>
                                        </div>
                                        
                                        <div class="form-group col-lg-4">
                                            <label><spring:message code="customer_email.label" /></label>
                                            <input type="text" class="form-control"  value="${orderDetails.email}" name="email"/>
                                        </div>
                                        
                                        <div class="form-group col-lg-4">
                                            <label><spring:message code="customer_contact_num.label" /> </label>
                                            <input type="text" class="form-control"  value="${orderDetails.mobileNumber}" name="mobileNumber"/>
                                        </div>
                                        
                                         <div class="form-group col-lg-4">
                                            <label><spring:message code="order_date.label" /> </label>
                                            <input type="text" class="form-control"  value="${orderDetails.date}" name="orderDate"/>
                                        </div>
                                        
                                        <div class="form-group col-lg-4">
                                            <label><spring:message code="waiter_name.label" /> </label>
                                            <input type="text" class="form-control"  value="${orderDetails.salesExecutive}" name="salesExecutive"/>
                                        </div>
                                        
                                        <div class="form-group col-lg-4">
                                            <label><spring:message code="status.label" /> </label>
                                            <input type="text" class="form-control"  value="${orderDetails.status}" name="status"/>
                                        </div>
                                        
                                        <%-- <c:if test="${orderDetails.orderType == 'take_away'}"> --%>
                                        	<div class="form-group col-lg-4">
                                            <label><spring:message code="shipment_address1.label" /> </label>
                                            <input type="text" class="form-control"  value="${orderDetails.shipmentAddress1}" name="shipmentAddress1"/>
                                        </div>
                                        
                                        <div class="form-group col-lg-4">
                                            <label><spring:message code="shipment_address2.label" /> </label>
                                            <input type="text" class="form-control"  value="${orderDetails.shipmentAddress2}" name="shipmentAddress2"/>
                                        </div>
                                        
                                        <div class="form-group col-lg-4">
                                            <label><spring:message code="shipment_contact.label" /> </label>
                                            <input type="text" class="form-control"  value="${orderDetails.shipmentContact}" name="shipmentContact"/>
                                        </div>
                                        
                                       <%--  </c:if> --%>
                                        
                                     </div>
                                     
                                  <div class="row">
                                         <div class="col-lg-3"></div>
                                         <div class="form-group col-lg-6">
                                         	<label><spring:message code="search.items.here.label" /></label>
                                            <input type="text" list="skuList" class="form-control"  name="searchCriteria" id="searchCriteria" />
 												<datalist id="skuList">
													
												</datalist>
  										 </div>
                                         <div class="col-lg-3"></div>
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
                                                 <th style="width: 50px;"><spring:message code="action.label"/></th>
                                           </tr>
                                          </thead>
                                          <tbody>
                                              
                       <c:forEach var="items" items="${orderDetails.itemDetails}">
             		   <tr id="dynamicdiv${fn:replace(items.itemCode,' ','')}">
              			<td id="itemId${fn:replace(items.itemCode,' ','')}">${items.itemCode}</td>
                  		<td id="itemName${fn:replace(items.itemCode,' ','')}">${items.itemDescription}</td>
                  		<td id="orderedQuantity${fn:replace(items.itemCode,' ','')}" class='Pack' onBlur='changePack(this);' contenteditable='true'>${items.quantity}</td>
                  		<td id="itemPrice${fn:replace(items.itemCode,' ','')}">${items.price}</td>
                  		<td id="totalCost${fn:replace(items.itemCode,' ','')}">${items.total}</td>
                  		 <td id="${fn:replace(items.itemCode,' ','')}"><img id="${fn:replace(items.itemCode,' ','')}"alt=""  style='width:35px;cursor:pointer;'  onclick='deleteItem(this);' src="${pageContext.request.contextPath}/images/itemdelete.png"/></td>
                                      
                  	   </tr>
              		   </c:forEach> 
		 </tbody>
                                         
                                       </table>
                                    </div>
                                   <!--  </div> -->
                                    <br/> <br/>
                                    
                                    

						</div><!-- /.box-body -->

						<div class="row" style="text-align: center;">
							<input type="button" class="btn bg-olive btn-inline"
								onclick="updateOrder('${orderDetails.status}');"
								value="&nbsp;&nbsp;<spring:message code="save.label" />&nbsp;&nbsp;" />
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								<input type="button" class="btn bg-olive btn-inline"
								onclick="viewOrdersByPage('${orderDetails.orderType}');"
								value="<spring:message code="cancel.label" />" />
						</div>
						<br/>
                                    <div class="box-footer">
                                     <!--    <button type="submit" class="btn btn-primary">Submit</button> -->
                                    </div>
                                    <input type="hidden" id="itemDetails" name="items">
                                    
                                </form>
                            </div>

</div>
</div>
</section><!-- /.content -->
<script src="${pageContext.request.contextPath}/js/plugins/datatables/jquery.dataTables.js" type="text/javascript"></script>
        <script src="${pageContext.request.contextPath}/js/plugins/datatables/dataTables.bootstrap.js" type="text/javascript"></script>
        <script type="text/javascript">
            $(function() {
               $('#productsList').dataTable({
                    "bPaginate": false,
                    "bLengthChange": false,
                    "bFilter": false,
                    "bSort": false,
                    "bInfo": false,
                    "bAutoWidth": false
                });
             });
        </script>
</body>
</html>
		    		 