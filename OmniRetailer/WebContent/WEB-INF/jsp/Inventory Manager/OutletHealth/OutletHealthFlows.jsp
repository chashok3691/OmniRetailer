<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
     <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	 <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/omniretailer.css">
<title>Insert title here</title>
</head>
<body>
<br>
                   <c:if test="${sessionScope.role == 'super admin'}">
                    <div class="row">
                   	<div class="col-lg-2 form-group" style="text-align: right;">
                   		<div style="text-align: center;width: 140px;height: 130px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="viewAverageInventory('avgInventory');" title="<spring:message code="avg.inventory.label" />">
                   			<img src="${pageContext.request.contextPath}/images/AverageInventory.png" style="margin-top: 10px;"><br>
                   			<span><spring:message code="avg.inventory.label" /></span>
                   		</div>
                	</div>
                	<div class="col-lg-2 form-group" style="text-align: right;">
                   		<div style="text-align: center;width: 140px;height: 130px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="viewAverageInventory('avgInventory');" title="<spring:message code="avg.inventory.label" />">
                   			<img src="${pageContext.request.contextPath}/images/AverageInventory.png" style="margin-top: 10px;"><br>
                   			<span><spring:message code="avg.inventory.label" /></span>
                   		</div>
                	</div>
                	<div class="col-lg-2 form-group" style="text-align: right;">
                   		<div style="text-align: center;width: 140px;height: 130px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="viewAverageInventory('avgInventory');" title="<spring:message code="avg.inventory.label" />">
                   			<img src="${pageContext.request.contextPath}/images/AverageInventory.png" style="margin-top: 10px;"><br>
                   			<span><spring:message code="avg.inventory.label" /></span>
                   		</div>
                	</div>
                	<div class="col-lg-2 form-group" style="text-align: right;">
                   		<div style="text-align: center;width: 140px;height: 130px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="viewAverageInventory('avgInventory');" title="<spring:message code="avg.inventory.label" />">
                   			<img src="${pageContext.request.contextPath}/images/AverageInventory.png" style="margin-top: 10px;"><br>
                   			<span><spring:message code="avg.inventory.label" /></span>
                   		</div>
                	</div>
                	<div class="col-lg-2 form-group" style="text-align: right;">
                   		<div style="text-align: center;width: 140px;height: 130px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="viewAverageInventory('avgInventory');" title="<spring:message code="avg.inventory.label" />">
                   			<img src="${pageContext.request.contextPath}/images/AverageInventory.png" style="margin-top: 10px;"><br>
                   			<span><spring:message code="avg.inventory.label" /></span>
                   		</div>
                	</div>
                    </div>
                  </c:if>
                   <c:if test="${sessionScope.role != 'super admin'}">
                    <div class="row">
                    <c:forEach var="accessControl" items="${sessionScope.outletHealth}">
                        <c:if test="${accessControl.appDocument == 'AverageInventory' && accessControl.read == true}">
                   		<div class="col-lg-2 form-group" style="text-align: right;">
	                   		<div style="text-align: center;width: 140px;height: 130px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="viewAverageInventory('avgInventory');" title="<spring:message code="avg.inventory.label" />">
	                   			<img src="${pageContext.request.contextPath}/images/AverageInventory.png" style="margin-top: 10px;"><br>
	                   			<span><spring:message code="avg.inventory.label" /></span>
	                   		</div>
                		</div>
                	   </c:if>
                   </c:forEach>	
                     <c:forEach var="accessControl" items="${sessionScope.outletHealth}">
                        <c:if test="${accessControl.appDocument == 'CustomerWalkIns' && accessControl.read == true}">
                   		<div class="col-lg-2 form-group" style="text-align: right;">
	                   		<div style="text-align: center;width: 140px;height: 130px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="viewCustomerWalkIns('CustomerWalkIns');" title="<spring:message code="customer.walkins.label" />">
	                   			<img src="${pageContext.request.contextPath}/images/AverageInventory.png" style="margin-top: 10px;"><br>
	                   			<span><spring:message code="customer.walkins.label" /></span>
	                   		</div>
                		</div>
                	   </c:if>
                   </c:forEach>	
                    <c:forEach var="accessControl" items="${sessionScope.outletHealth}">
                        <c:if test="${accessControl.appDocument == 'CustomerConversion' && accessControl.read == true}">
                   		<div class="col-lg-2 form-group" style="text-align: right;">
	                   		<div style="text-align: center;width: 140px;height: 130px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="viewCustomerConversion('CustomerConversion');" title="<spring:message code="customer.conversion.label" />">
	                   			<img src="${pageContext.request.contextPath}/images/AverageInventory.png" style="margin-top: 10px;"><br>
	                   			<span><spring:message code="customer.conversion.label" /></span>
	                   		</div>
                		</div>
                	   </c:if>
                   </c:forEach>	
                     <c:forEach var="accessControl" items="${sessionScope.outletHealth}">
                        <c:if test="${accessControl.appDocument == 'BillingAverages' && accessControl.read == true}">
                   		<div class="col-lg-2 form-group" style="text-align: right;">
	                   		<div style="text-align: center;width: 140px;height: 130px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="viewBillingAverages('BillingAverages');" title="<spring:message code="billing.avg.label" />">
	                   			<img src="${pageContext.request.contextPath}/images/AverageInventory.png" style="margin-top: 10px;"><br>
	                   			<span><spring:message code="billing.avg.label" /></span>
	                   		</div>
                		</div>
                	   </c:if>
                   </c:forEach>	
                     <c:forEach var="accessControl" items="${sessionScope.outletHealth}">
                        <c:if test="${accessControl.appDocument == 'HealthSales' && accessControl.read == true}">
                   		<div class="col-lg-2 form-group" style="text-align: right;">
	                   		<div style="text-align: center;width: 140px;height: 130px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="viewHealthSales('HealthSales');" title="<spring:message code="health.sales.label" />">
	                   			<img src="${pageContext.request.contextPath}/images/AverageInventory.png" style="margin-top: 10px;"><br>
	                   			<span><spring:message code="health.sales.label" /></span>
	                   		</div>
                		</div>
                	   </c:if>
                   </c:forEach>	
                    </div>
                  </c:if>
</body>
</html>