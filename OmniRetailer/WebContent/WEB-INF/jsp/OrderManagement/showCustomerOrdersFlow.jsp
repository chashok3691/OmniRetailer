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
                          	<c:forEach var="accessControl" items="${sessionScope.orderManagemetSalesOrderActivity}">
			       					<div class="col-lg-2 form-group" style="text-align: right;">
		                          		<div style="text-align: center;width: 120px;height: 120px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="viewOrders('${accessControl.appDocumentActivity}','${accessControl.appDocumentActivity}SalesOrderManagement','0','management','management','menu');" title="${accessControl.appDocumentActivity}">
		                          			<img src="${pageContext.request.contextPath}/images/${accessControl.appDocumentActivity}.png" style="margin-top: 10px;"><br>
		                          			<span>${accessControl.appDocumentActivity}</span>
		                          		</div>
		                          	</div>
		                          	<c:set var="noOfCols" value="${noOfCols + 1}" />
		                          	<c:if test="${noOfCols == 5 || noOfCols == 10}">
		                          			<div class="col-lg-2 form-group" style="text-align: left;"></div>
		                          		</div>
			                        	<div class="row">
				                    </c:if>
			     				</c:forEach> 
                          </div>
                        </c:if>
                        <c:if test="${sessionScope.role != 'super admin'}">                            
                          <div class="row">
                          <c:set var="noOfCols" value="0" />
			       				<c:forEach var="accessControl" items="${sessionScope.outletCustomerOrderActivity}">
			       					<div class="col-lg-2 form-group" style="text-align: right;">
		                          		<div style="text-align: center;width: 120px;height: 120px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="viewOrders('${accessControl.appDocumentActivity}','${accessControl.appDocumentActivity}OutletOrderManagement','0','','outlet','menu');" title="${accessControl.appDocumentActivity}">
		                          			<img src="${pageContext.request.contextPath}/images/${accessControl.appDocumentActivity}.png" style="margin-top: 10px;"><br>
		                          			<span>${accessControl.appDocumentActivity}</span>
		                          		</div>
		                          	</div>
		                          	<c:set var="noOfCols" value="${noOfCols + 1}" />
		                          	<c:if test="${noOfCols == 5 || noOfCols == 10}">
		                          			<div class="col-lg-2 form-group" style="text-align: left;"></div>
		                          		</div>
			                        	<div class="row">
				                    </c:if>
			     				</c:forEach> 
                          </div>
                        </c:if>
                         
</body>
</html>