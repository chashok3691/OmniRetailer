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
                          		<div style="text-align: center;width: 120px;height: 120px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="viewHomePageDeals('newPaymentsOrders');" title="<spring:message code="bills.label" />">
                          			<img src="${pageContext.request.contextPath}/images/Bill.png" style="margin-top: 10px;"><br>
                          			<span><spring:message code="bills.label" /></span>
                          		</div>
                          	</div>
                          	<div class="col-lg-2 form-group">
                          		<div style="text-align: center;width: 120px;height: 120px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="viewHomePageDeals('pendingPaymentsOrders');" title="<spring:message code="warehouse.payments.label" />">
                          			<img src="${pageContext.request.contextPath}/images/Payment.png" style="margin-top: 10px;"><br>
                          			<span><spring:message code="warehouse.payments.label" /></span>
                          		</div>
                          	</div>
                          	<div class="col-lg-2 form-group" style="text-align: left;">
                          		<div style="text-align: center;width: 120px;height: 120px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="viewHomePageDeals('fulfilledPaymentsOrders');" title="<spring:message code="pending.payments.label" />">
                          			<img src="${pageContext.request.contextPath}/images/PendingPayment.png" style="margin-top: 10px;"><br>
                          			<span><spring:message code="pending.payments.label" /></span>
                          		</div>
                          	</div>
                          </div>
                        </c:if>
                        <c:if test="${sessionScope.role != 'super admin'}">                            
                          <div class="row">
                          <c:forEach var="accessControl" items="${sessionScope.orderManagemetSalesOrderPayments}" varStatus="theCount">
       						<c:if test="${accessControl.appDocument == 'OrderManagementBills'}"> 
		                          	<div class="col-lg-2 form-group" style="text-align: right;">
		                          		<div style="text-align: center;width: 120px;height: 120px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="viewHomePageDeals('newPaymentsOrders');" title="<spring:message code="bills.label" />">
		                          			<img src="${pageContext.request.contextPath}/images/Bill.png" style="margin-top: 10px;"><br>
		                          			<span><spring:message code="bills.label" /></span>
		                          		</div>
		                          	</div>
		                         </c:if>
		                    </c:forEach>
		                   <c:forEach var="accessControl" items="${sessionScope.orderManagemetSalesOrderPayments}" varStatus="theCount">
       						<c:if test="${accessControl.appDocument == 'OrderManagementBillsPayments'}"> 
		                          	<div class="col-lg-2 form-group">
		                          		<div style="text-align: center;width: 120px;height: 120px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="viewHomePageDeals('pendingPaymentsOrders');" title="<spring:message code="warehouse.payments.label" />">
		                          			<img src="${pageContext.request.contextPath}/images/Payment.png" style="margin-top: 10px;"><br>
		                          			<span><spring:message code="warehouse.payments.label" /></span>
		                          		</div>
		                          	</div>
                          		</c:if>
                          </c:forEach>
                       <c:forEach var="accessControl" items="${sessionScope.orderManagemetSalesOrderPayments}" varStatus="theCount">
       						<c:if test="${accessControl.appDocument == 'OrderManagementPendingPayments'}"> 
	                          	<div class="col-lg-2 form-group" style="text-align: left;">
	                          		<div style="text-align: center;width: 120px;height: 120px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="viewHomePageDeals('fulfilledPaymentsOrders');" title="<spring:message code="pending.payments.label" />">
	                          			<img src="${pageContext.request.contextPath}/images/PendingPayment.png" style="margin-top: 10px;"><br>
	                          			<span><spring:message code="pending.payments.label" /></span>
	                          		</div>
	                          	</div>
	                          </c:if>
                          </c:forEach>
                          </div>
                        </c:if>
                         
</body>
</html>