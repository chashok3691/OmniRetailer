<!--/*
 * Project Name 	        : OmniRetailerCustomer
 * Written By		        : Mythri.S
 * file name		        : Inventory Manager/shipments/shipmentsFlow.jsp
 * file type		        : JSP
 * description				: display warehouse flows information
 * */ -->


<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
     <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <!DOCTYPE html>
<!-- <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd"> -->
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Welcome | Omni Retailer</title>
        <meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>
    </head>
<body>
                            <br>
						<c:if test="${sessionScope.role == 'super admin'}">                            
                          <div class="row">
                          	<div class="col-lg-2 form-group" style="text-align: right;">
                          		<div style="text-align: center;width: 120px;height: 120px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="viewOrders('pending','pendingOutletShipment','0','')" title="<spring:message code="pending.bills.label" /> <spring:message code="deliveries.label" />">
                          			<img src="${pageContext.request.contextPath}/images/Shipments_Pending.png" style="margin-top: 10px;"><br>
                          			<span><spring:message code="pending.bills.label" /> <spring:message code="deliveries.label" /></span>
                          		</div>
                          	</div>
                          	<div class="col-lg-2 form-group">
                          		<div style="text-align: center;width: 120px;height: 120px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="viewOrders('all','shippedOutletShipment','0','')" title="<spring:message code="shipped.orders.label" /> <spring:message code="deliveries.label" />">
                          			<img src="${pageContext.request.contextPath}/images/Shipments_Tracking.png" style="margin-top: 10px;"><br>
                          			<span><spring:message code="shipped.orders.label" /> <spring:message code="deliveries.label" /></span>
                          		</div>
                          	</div>
                          	<div class="col-lg-2 form-group" style="text-align: left;">
                          		<div style="text-align: center;width: 120px;height: 120px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="viewOrders('all','DeliveredOutletShipment','0','')" title="<spring:message code="delivered.order.label" /> <spring:message code="deliveries.label" />">
                          			<img src="${pageContext.request.contextPath}/images/Shipments_Delivered.png" style="margin-top: 10px;"><br>
                          			<span><spring:message code="delivered.order.label" /> <spring:message code="deliveries.label" /></span>
                          		</div>
                          	</div>
                          	<div class="col-lg-2 form-group" style="text-align: left;"></div>
                          	<div class="col-lg-2 form-group" style="text-align: left;"></div>
                          	<div class="col-lg-2 form-group" style="text-align: left;"></div>
                          
                          </div>
                        </c:if>
                        <c:if test="${sessionScope.role != 'super admin'}">                            
                          <div class="row">
                          <c:forEach var="accessControl" items="${sessionScope.outletShipment}">
	                           <c:if test="${accessControl.appDocument == 'OutletPendingShipments' && accessControl.read == true}"> 
		                          	<div class="col-lg-2 form-group" style="text-align: right;">
		                          		<div style="text-align: center;width: 120px;height: 120px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="viewOrders('pending','pendingOutletShipment','0','')" title="<spring:message code="pending.bills.label" /> <spring:message code="deliveries.label" />">
		                          			<img src="${pageContext.request.contextPath}/images/Shipments_Pending.png" style="margin-top: 10px;"><br>
		                          			<span><spring:message code="pending.bills.label" /> <spring:message code="deliveries.label" /></span>
		                          		</div>
		                          	</div>
		                         </c:if>
		                    </c:forEach>
		                    <c:forEach var="accessControl" items="${sessionScope.outletShipment}">
	                            <c:if test="${accessControl.appDocument == 'OutletShippedShipments' && accessControl.read == true}">
		                          	<div class="col-lg-2 form-group">
		                          		<div style="text-align: center;width: 120px;height: 120px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="viewOrders('all','shippedOutletShipment','0','')" title="<spring:message code="shipped.orders.label" /> <spring:message code="deliveries.label" />">
		                          			<img src="${pageContext.request.contextPath}/images/Shipments_Tracking.png" style="margin-top: 10px;"><br>
		                          			<span><spring:message code="shipped.orders.label" /> <spring:message code="deliveries.label" /></span>
		                          		</div>
		                          	</div>
                          		</c:if>
                          </c:forEach>
                          <c:forEach var="accessControl" items="${sessionScope.outletShipment}">
	                           <c:if test="${accessControl.appDocument == 'OutletDeliveredShipments' && accessControl.read == true}">
	                          	<div class="col-lg-2 form-group" style="text-align: left;">
	                          		<div style="text-align: center;width: 120px;height: 120px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="viewOrders('all','DeliveredOutletShipment','0','')" title="<spring:message code="delivered.order.label" /> <spring:message code="deliveries.label" />">
	                          			<img src="${pageContext.request.contextPath}/images/Shipments_Delivered.png" style="margin-top: 10px;"><br>
	                          			<span><spring:message code="delivered.order.label" /> <spring:message code="deliveries.label" /></span>
	                          		</div>
	                          	</div>
	                          	</c:if>
                          </c:forEach>
                          	<div class="col-lg-2 form-group" style="text-align: left;"></div>
                          	<div class="col-lg-2 form-group" style="text-align: left;"></div>
                          	<div class="col-lg-2 form-group" style="text-align: left;"></div>
                          
                          </div>
                        </c:if>
                         
</body>
</html>