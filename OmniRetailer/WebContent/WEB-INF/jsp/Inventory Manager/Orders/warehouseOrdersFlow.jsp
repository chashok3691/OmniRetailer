<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
     <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<br>
                   <c:if test="${sessionScope.role == 'super admin'}">
                    <div class="row">
                    	<div class="col-lg-2 form-group" style="text-align: right;">
                   		<div style="text-align: center;width: 140px;height: 130px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="viewOrders('ShipmentOrders','wshipmentOrders','0','','warehouse','menu');" title="<spring:message code="warehouse.shipmentirders.label" />">
                   			<img src="${pageContext.request.contextPath}/images/Orders.png" style="margin-top: 10px;"><br>
                   			<span><spring:message code="warehouse.shipmentirders.label" /></span><br>
                   		</div>
                		</div>
                		<div class="col-lg-2 form-group" style="text-align: right;">
                   		<div style="text-align: center;width: 140px;height: 130px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="viewShipmentGatePass('shipmentgatepass','0');" title="<spring:message code="warehouse.shipmentgatepass.label" />">
                   			<img src="${pageContext.request.contextPath}/images/GatePass.png" style="margin-top: 10px;"><br>
                   			<span><spring:message code="warehouse.shipmentgatepass.label" /></span><br>
                   		</div>
                		</div>
                		<div class="col-lg-2 form-group" style="text-align: right;">
                   		<div style="text-align: center;width: 140px;height: 130px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="viewOutletShipments('','wshipments','0','','warehouse','menu');" title="<spring:message code="warehouse.shipments.label" />">
                   			<img src="${pageContext.request.contextPath}/images/Shipments.gif" style="margin-top: 10px;"><br>
                   			<span><spring:message code="warehouse.shipments.label" /></span><br>
                   		</div>
                   		</div>
                   		<div class="col-lg-2 form-group" style="text-align: right;">
                   		<div style="text-align: center;width: 140px;height: 130px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="viewInvoicing('winvoice','0');" title="<spring:message code="warehouse.invoices.label" />">
                   			<img src="${pageContext.request.contextPath}/images/Invoicing.gif" style="margin-top: 10px;"><br>
                   			<span><spring:message code="warehouse.invoices.label" /></span><br>
                   		</div>
                		</div>
                		<div class="col-lg-2 form-group" style="text-align: right;">
                   		<div style="text-align: center;width: 140px;height: 130px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="viewPayments('wpayments');" title="<spring:message code="warehouse.payments.label" />">
                   			<img src="${pageContext.request.contextPath}/images/Payments.gif" style="margin-top: 10px;"><br>
                   			<span><spring:message code="warehouse.payments.label" /></span><br>
                   		</div>
                		</div>
                    </div>
                  </c:if>
                   <c:if test="${sessionScope.role != 'super admin'}">
                    <div class="row">
	                <c:forEach var="accessControl" items="${sessionScope.warehouseSalesOrder}">
		                <c:if test="${accessControl.appDocument == 'WarehouseShipmentOrders' && accessControl.read == true}">
	                		<div class="col-lg-2 form-group" style="text-align: right;">
		                   		<div style="text-align: center;width: 140px;height: 130px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="viewOrders('ShipmentOrders','wshipmentOrders','0','','warehouse','menu');" title="<spring:message code="warehouse.shipmentirders.label" />">
		                   			<img src="${pageContext.request.contextPath}/images/Orders.png" style="margin-top: 10px;"><br>
		                   			<span><spring:message code="warehouse.shipmentirders.label" /></span><br>
		                   		</div>
	                		</div>
	                    </c:if>
	              </c:forEach>
                <c:forEach var="accessControl" items="${sessionScope.warehouseSalesOrder}">
		            <c:if test="${accessControl.appDocument == 'WarehouseShipmentGatePass' && accessControl.read == true}">
                		<div class="col-lg-2 form-group" style="text-align: right;">
	                   		<div style="text-align: center;width: 140px;height: 130px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="viewShipmentGatePass('shipmentgatepass','0');" title="<spring:message code="warehouse.shipmentgatepass.label" />">
	                   			<img src="${pageContext.request.contextPath}/images/GatePass.png" style="margin-top: 10px;"><br>
	                   			<span><spring:message code="warehouse.shipmentgatepass.label" /></span><br>
	                   		</div>
                		</div>
                	</c:if>
                </c:forEach>
                <c:forEach var="accessControl" items="${sessionScope.warehouseSalesOrder}">
		            <c:if test="${accessControl.appDocument == 'WarehouseShipments' && accessControl.read == true}">
                		<div class="col-lg-2 form-group" style="text-align: right;">
	                   		<div style="text-align: center;width: 140px;height: 130px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="viewOutletShipments('','wshipments','0','','warehouse','menu');" title="<spring:message code="warehouse.shipments.label" />">
	                   			<img src="${pageContext.request.contextPath}/images/Shipments.gif" style="margin-top: 10px;"><br>
	                   			<span><spring:message code="warehouse.shipments.label" /></span><br>
	                   		</div>
                   		</div>
                	</c:if>
                </c:forEach>
              <c:forEach var="accessControl" items="${sessionScope.warehouseSalesOrder}">
		            <c:if test="${accessControl.appDocument == 'WarehouseInvoices' && accessControl.read == true}">
                		<div class="col-lg-2 form-group" style="text-align: right;">
	                   		<div style="text-align: center;width: 140px;height: 130px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="viewInvoicing('winvoice','0');" title="<spring:message code="warehouse.invoices.label" />">
	                   			<img src="${pageContext.request.contextPath}/images/Invoicing.gif" style="margin-top: 10px;"><br>
	                   			<span><spring:message code="warehouse.invoices.label" /></span><br>
	                   		</div>
                		</div>
                    </c:if>
             </c:forEach>
             <c:forEach var="accessControl" items="${sessionScope.warehouseSalesOrder}">
		         <c:if test="${accessControl.appDocument == 'WarehousePayments' && accessControl.read == true}">
                		<div class="col-lg-2 form-group" style="text-align: right;">
	                   		<div style="text-align: center;width: 140px;height: 130px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="viewPayments('wpayments');" title="<spring:message code="warehouse.payments.label" />">
	                   			<img src="${pageContext.request.contextPath}/images/Payments.gif" style="margin-top: 10px;"><br>
	                   			<span><spring:message code="warehouse.payments.label" /></span><br>
	                   		</div>
                		</div>
                    </c:if>
             </c:forEach>
                    </div>
                  </c:if>
</body>
</html>