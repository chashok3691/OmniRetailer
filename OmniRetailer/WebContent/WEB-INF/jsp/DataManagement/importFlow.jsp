<!--/*
 * Project Name 	        : OmniRetailerCustomer
 * Written By		        : Sambaiah Y
 * file name		        : onventorymanager/salesreports/salesreports.jsp
 * file type		        : JSP
 * description				: display sales reports information
 * */ -->


<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
     <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Welcome | Omni Retailer</title>
        <meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>
        <script type="text/javascript" src="${pageContext.request.contextPath}/js/controller.js"></script> 
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/dataManagement/import.js"></script>
       
    </head>
<body>
                            <br/>
                          <c:if test="${sessionScope.role == 'super admin'}">
                          <div class="row">
                          <div class="col-lg-2 form-group" style="text-align: right;">
	                          		<div style="text-align: center;width: 140px;height: 130px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="viewImportdetails('importWarehouse','warehouse');" title="<spring:message code="generics.data.label" />">
	                          			<img src="${pageContext.request.contextPath}/images/GenericMaster.png" style="margin-top: 10px;"><br><br>
	                          			<span>Master Data</span>
	                          		</div>
	                          	</div>
                                    <div class="col-lg-2 form-group" style="text-align: right;">
	                          		<div style="text-align: center;width: 140px;height: 130px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="viewImportdetails('importOutlet','outlet');" title="<spring:message code="outlet_management.reports.label" />">
	                          			<img src="${pageContext.request.contextPath}/images/Outlet.gif" style="margin-top: 10px;"><br><br>
	                          			<span><spring:message code="outlet_management.reports.label" /></span>
	                          		</div>
	                          	</div>
                          		<div class="col-lg-2 form-group" style="text-align: right;">
	                          		<div style="text-align: center;width: 140px;height: 130px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="viewImportdetails('importWarehouse','warehouse');" title="<spring:message code="warehouse_management.reports.label" />">
	                          			<img src="${pageContext.request.contextPath}/images/warehouse.gif" style="margin-top: 10px;"><br><br>
	                          			<span><spring:message code="warehouse_management.reports.label" /></span>
	                          		</div>
	                          	</div>
	            
                           </div>
                          </c:if>
                          <c:if test="${sessionScope.role != 'super admin'}">
                          <div class="row">
                          <c:forEach var="accessControl" items="${sessionScope.dataManagement}">
                             		<c:if test="${accessControl.appDocument == 'GenricImports' && accessControl.write == true && accessControl.appSubflow == 'Import'}"> 	
                             		 	<div class="col-lg-2 form-group" style="text-align: right;">
			                          		<div style="text-align: center;width: 140px;height: 130px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="viewImportdetails('importGenric','generic');" title="<spring:message code="generics.data.label" />">
			                          			<img src="${pageContext.request.contextPath}/images/GenericMaster.png" style="margin-top: 10px;"><br><br>
			                          			<span>Master Data</span>
			                          		</div>
			                          	</div>
                            		</c:if>
                            </c:forEach>
                             <c:forEach var="accessControl" items="${sessionScope.dataManagement}">
                             		<c:if test="${accessControl.appDocument == 'OuletImports'}"> 	
                             		 	<div class="col-lg-2 form-group" style="text-align: right;">
			                          		<div style="text-align: center;width: 140px;height: 130px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="viewImportdetails('importOutlet','outlet');" title="<spring:message code="outlet_management.reports.label" />">
			                          			<img src="${pageContext.request.contextPath}/images/Outlet.gif" style="margin-top: 10px;"><br><br>
			                          			<span><spring:message code="outlet_management.reports.label" /></span>
			                          		</div>
			                          	</div>
                            		</c:if>
                            </c:forEach>
                                <c:forEach var="accessControl" items="${sessionScope.dataManagement}">
                             		<c:if test="${accessControl.appDocument == 'WarehouseImports'}"> 	
                             		 	<div class="col-lg-2 form-group" style="text-align: right;">
			                          		<div style="text-align: center;width: 140px;height: 130px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="viewImportdetails('importWarehouse','warehouse');" title="<spring:message code="warehouse_management.reports.label" />">
			                          			<img src="${pageContext.request.contextPath}/images/warehouse.gif" style="margin-top: 10px;"><br><br>
			                          			<span><spring:message code="warehouse_management.reports.label" /></span>
			                          		</div>
			                          	</div>
                            		</c:if>
                            </c:forEach>
                             
                         
	                      
                    
                         </div>
		                </c:if>
                          
</body>
</html>