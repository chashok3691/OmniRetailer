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
                          		<div style="text-align: center;width: 120px;height: 120px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="showSalesOrderFlows()" title="<spring:message code="sales.orders.label" />">
                          			<img src="${pageContext.request.contextPath}/images/NewOrders.png" style="margin-top: 10px;"><br>
                          			<span><spring:message code="sales.orders.label" /></span>
                          		</div>
                          	</div>
                          	<div class="col-lg-2 form-group">
                          		<div style="text-align: center;width: 120px;height: 120px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="showFulfilmentOrders()" title="<spring:message code="fulfillment.label" />">
                          			<img src="${pageContext.request.contextPath}/images/Shipments_Pending.png" style="margin-top: 10px;"><br>
                          			<span><spring:message code="fulfillment.label" /></span>
                          		</div>
                          	</div>
                          	<div class="col-lg-2 form-group" style="text-align: left;">
                          		<div style="text-align: center;width: 120px;height: 120px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="showOrderPayments()" title="<spring:message code="warehouse.payments.label" />">
                          			<img src="${pageContext.request.contextPath}/images/Payments.gif" style="margin-top: 10px;"><br>
                          			<span><spring:message code="warehouse.payments.label" /></span>
                          		</div>
                          	</div>
                          </div>
                        </c:if>
                        <c:if test="${sessionScope.role != 'super admin'}">                            
                          <div class="row">
                          <c:forEach var="accessControl" items="${sessionScope.orderManagemetSalesOrderFulfilment}" varStatus="theCount">
       						<c:if test="${theCount.count == 1}"> 
		                          	<div class="col-lg-2 form-group" style="text-align: right;">
		                          		<div style="text-align: center;width: 120px;height: 120px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="showSalesOrderFlows()" title="<spring:message code="sales.orders.label" />">
		                          			<img src="${pageContext.request.contextPath}/images/NewOrders.png" style="margin-top: 10px;"><br>
		                          			<span><spring:message code="sales.orders.label" /></span>
		                          		</div>
		                          	</div>
		                         </c:if>
		                    </c:forEach>
		                   <c:forEach var="accessControl" items="${sessionScope.orderManagemetSalesOrderFulfilment}" varStatus="theCount">
       						<c:if test="${theCount.count == 1}">
		                          	<div class="col-lg-2 form-group">
		                          		<div style="text-align: center;width: 120px;height: 120px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="showFulfilmentOrders()" title="<spring:message code="fulfillment.label" />">
		                          			<img src="${pageContext.request.contextPath}/images/Shipments_Pending.png" style="margin-top: 10px;"><br>
		                          			<span><spring:message code="fulfillment.label" /></span>
		                          		</div>
		                          	</div>
                          		</c:if>
                          </c:forEach>
                       <c:forEach var="accessControl" items="${sessionScope.orderManagemetSalesOrderPayments}" varStatus="theCount">
       						<c:if test="${theCount.count == 1}">
	                          	<div class="col-lg-2 form-group" style="text-align: left;">
	                          		<div style="text-align: center;width: 120px;height: 120px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="showOrderPayments()" title="<spring:message code="warehouse.payments.label" />">
	                          			<img src="${pageContext.request.contextPath}/images/Payments.gif" style="margin-top: 10px;"><br>
	                          			<span><spring:message code="warehouse.payments.label" /></span>
	                          		</div>
	                          	</div>
	                          </c:if>
                          </c:forEach>
                          
                          
                           
                          <c:set var="ordervsstock" value="false"/>
       				<c:forEach var="accessControl" items="${sessionScope.orderManagementSalesOrderVsStock}">
                      	<c:if test="${accessControl.appDocument == 'OrderManagementSalesOrderVsStock' && accessControl.read == true}">
       				               <div class="col-lg-2 form-group">
		                          		<div style="text-align: center;width: 120px;height: 120px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="viewOrdervsStock('ordervsstock','0','false');" title="Order vs Stock">
		                          			<img src="${pageContext.request.contextPath}/images/imagentavl.png" style="margin-top: -30px; padding: 34px 12px 0px 59px; margin-left: -33%;"><br><br>
		                 		                          			<span>Order vs Stock</span>
		                          		</div>
		                          	</div>
                        		</c:if>		
                        		</c:forEach>
                          
                          
                          <c:forEach var="accessControl" items="${sessionScope.outletOtherReports}">
	                            		<c:if test="${accessControl.appDocument == 'OutletOrdersReports'}">
								     	   <div class="col-lg-2 form-group">
		                          		<div style="text-align: center;width: 120px;height: 120px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="showB2BSaleOrdersFlow()" title="<spring:message code="b2bsale.orders.label" />">
		                          		<img src="${pageContext.request.contextPath}/images/imagentavl.png" style="margin-top: -30px; padding: 34px 12px 0px 59px; margin-left: -33%;"><br><br>
		                 		        <span><spring:message code="b2bsale.orders.label" /></span>
		                          		</div>
		                          	</div>
								      	</c:if>
								     </c:forEach>
								     
								     <div class="row"></div>
								     
								     
                           
                          <c:forEach var="accessControl" items="${sessionScope.outletOtherReports}">
	                            		<c:if test="${accessControl.appDocument == 'OutletOrdersReports'}">
		                  			<div class="col-lg-2 form-group">
		                          		<div style="text-align: center;width: 120px;height: 120px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="showOrderReportsFlow()" title="<spring:message code="orders.reports.label" />">
		                          		   <img src="${pageContext.request.contextPath}/images/imagentavl.png" style="margin-top: -30px; padding: 34px 12px 0px 59px; margin-left: -33%;"><br><br>
		                 		           <span><spring:message code="orders.reports.label" /></span>
		                          		</div>
		                          	</div>
								      	</c:if>
					      </c:forEach>
                          
                          
                           
                          </div>
                        </c:if>
                         
</body>
</html>