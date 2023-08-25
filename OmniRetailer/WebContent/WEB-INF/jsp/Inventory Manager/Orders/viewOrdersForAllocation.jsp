<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
 <div id="Error" class="Error" style="margin-top:-40px;text-align:center;color:red;font-weight:bold;">${err}</div>
  <div id="Success" class="Error" style="margin-top:-40px;text-align:center;color:blue;font-weight:bold;">${success}</div>
  <div style="overflow:auto">    
         <table id="productstocks" class="table table-bordered table-striped" style="margin-top:0%;">
          <thead style="background-color: #3c8dbc; color: #ffffff">
                 <tr>
                  <c:if test="${sessionScope.role == 'super admin'}"> 
                                             	<th style="width: 60px" align="center" ><input type='checkbox' name='selectall' onClick='selectAll(this)'></th>
                                             </c:if>
                                         	<c:if test="${flowUnder == 'management'}">
			           <c:forEach var="accessControl" items="${sessionScope.orderManagemetSalesOrder}">
    										   <c:if test="${accessControl.appDocument == 'OrderManagementSalesOrder' && accessControl.write == true}"> 
                                            		<th style="width: 60px" align="center" ><input type='checkbox' name='selectall' onClick='selectAll(this)'></th>
                                            	</c:if>
                                            </c:forEach>
                 </c:if>
                 
                 
                 	 <th><div style=""><spring:message code="sl.no.label" /></div></th>
                 	 <th><spring:message code="location.label" /></th>
                 	 <th><spring:message code="order_id.label" /></th>
                     <th><spring:message code="order_on.label" /></th>
                     <th><spring:message code="mobileNumber.label" /></th>
                      <th><spring:message code="customerName.label" /></th>
                     <th><spring:message code="landmark.label" /></th>
                     <th><spring:message code="area.label" /></th>
                     <th><spring:message code="deliverySlot.label" /></th>
                     <th><spring:message code="delivery_date.label" /></th>
                     <th><spring:message code="order_channel" /></th>
<%--                  	 <th><spring:message code="order_status.label" /></th> --%>
                     <th><spring:message code="order_amount.label" /></th>
                     <th><spring:message code="action.label" /></th>
                 </tr>
             </thead>
             <tbody style="text-align: center;white-space: nowrap;">
                <c:forEach var="orderDetails" items="${orderDetails}">
             	 <tr>
             	 
             	   <c:if test="${sessionScope.role == 'super admin'}"> 
                                             	<td><input type="checkbox" name="selectall" class="selectableCheckbox" id="selectall"  value="${orderDetails.orderId}" /></td>
                                             </c:if>
                                         <c:if test="${flowUnder == 'management'}">
			           <c:forEach var="accessControl" items="${sessionScope.orderManagemetSalesOrder}">
    										   <c:if test="${accessControl.appDocument == 'OrderManagementSalesOrder' && accessControl.write == true}"> 
                                            		<td><input type="checkbox" name="selectall" class="selectableCheckbox" id="selectall" value="${orderDetails.orderId}"  /></td>
                                            	</c:if>
                                            </c:forEach>
                                            </c:if>
             	 
             	 	 <td>${orderDetails.slNo}</td>
             	 	 <td>${orderDetails.saleLocation}</td>
                 	 <td>${orderDetails.orderId}</td>
                     <td>${orderDetails.orderDate}</td>
                     <td>${orderDetails.mobile_num}</td>
                     <td>${orderDetails.shipmentName}</td>
                     <td><div>${orderDetails.shipement_address_location}</div></td>
                     <td>${orderDetails.shipement_address_city}</td>
                     <td>${orderDetails.delivery_slot}</td>
                     <td>${orderDetails.deliveryDate}</td>
                     <td>${orderDetails.orderChannel}</td>
<%--                      <td>${orderDetails.orderStatus}</td> --%>
                     <td>${orderDetails.totalOrderAmount}</td>
                   <td>
                   	<a style="color:#2e7ea7 !important;cursor: pointer;" onclick="viewOrderDetails('${orderDetails.orderId}','orders','${status}','view');"><spring:message code="view.label"/></a>
                   	<c:if test="${sessionScope.role == 'super admin'}">
                   		&nbsp;&nbsp;&nbsp;<a style="color:#2e7ea7 !important;cursor: pointer;" onclick="viewOrderDetails('${orderDetails.orderId}','orders','${status}','edit');"><spring:message code="edit.label"/></a>
                   </c:if>
                   <c:if test="${sessionScope.role != 'super admin'}">
						<c:if test="${flowUnder == 'outlet'}">
				           <c:forEach var="accessControl" items="${sessionScope.outletCustomerOrder}">
				                <c:if test="${accessControl.appDocument == 'outletCustomerOrders' && accessControl.write == true && accessControl.read == true}">
				                	&nbsp;&nbsp;&nbsp;<a style="color:#2e7ea7 !important;cursor: pointer;" onclick="viewOrderDetails('${orderDetails.orderId}','orders','${status}','edit');"><spring:message code="edit.label"/></a> 
				                </c:if>
				           </c:forEach>
				        </c:if>
			           <c:if test="${flowUnder == 'warehouse'}">
			           		<c:forEach var="accessControl" items="${sessionScope.warehouseSalesOrder}">
                				<c:if test="${accessControl.appDocument == 'WarehouseShipmentOrders' && accessControl.write == true && accessControl.read == true}">
                					&nbsp;&nbsp;&nbsp;<a style="color:#2e7ea7 !important;cursor: pointer;" onclick="viewOrderDetails('${orderDetails.orderId}','orders','${status}','edit');"><spring:message code="edit.label"/></a>
                				</c:if>
                			</c:forEach>
			           </c:if>
			           <c:if test="${flowUnder == 'management'}">
			           		<c:forEach var="accessControl" items="${sessionScope.orderManagemetSalesOrder}">
                				<c:if test="${accessControl.appDocument == 'OrderManagementSalesOrder' && accessControl.write == true}">
                					&nbsp;&nbsp;&nbsp;<a style="color:#2e7ea7 !important;cursor: pointer;" onclick="viewOrderDetails('${orderDetails.orderId}','orders','${status}','edit');"><spring:message code="edit.label"/></a>
                				</c:if>
                			</c:forEach>
			           </c:if>
			           
			           
			           
			           
				      </c:if>
                   
                   
                   
                   
                   </td>
                 </tr>
                </c:forEach>
             </tbody>
         </table>
         </div>





</body>
</html>