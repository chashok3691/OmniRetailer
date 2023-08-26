<!--/*
 * Project Name 	        : OmniRetailerCustomer
 * Written By		        : Sahitya
 * file name		        : Inventory Manager/Reports/showoutletReports.jsp
 * file type		        : JSP
 * description				: display outlet reports information
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
       
    </head>
<body>
                         <br/>
                          <c:if test="${sessionScope.role == 'super admin'}">
                          	<div class="row">
                          	<div class="col-lg-2 form-group" style="text-align: right;">
		                          	 <div style="text-align: center;width: 140px;height: 130px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="viewOutletCustomerConversionReport('outletCustomerConversationReport','0');" title="<spring:message code="dump.report.label" />">
		                          			<img src="" style="margin-top: 10px;"><br><br>
		                          			<span><spring:message code="customer.conversion.report.label" /></span>
		                              </div>
	                          	 </div>
							
	                          	
	                          </div>
	                          
	                      
	                         
                          </c:if>
                      <c:set var="counts" value="0" />
                     <c:if test="${sessionScope.role != 'super admin'}">
                     	<div class="row">
                          
                         <c:forEach var="accessControl" items="${sessionScope.warehouseReports}">
	                           <c:if test="${accessControl.appDocument == 'WarehouseSuppliesReports'}">
                          		<div class="col-lg-2 form-group" style="text-align: right;">
		                          	 <div style="text-align: center;width: 140px;height: 130px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="viewOutletCustomerConversionReport('outletCustomerConversationReport','0');" title="<spring:message code="dump.report.label" />">
		                          			<img src="" style="margin-top: 10px;"><br><br>
		                          			<span><spring:message code="customer.conversion.report.label" /></span>
		                              </div>
	                          	 </div>
	                          	 <c:set var="counts" value="${counts+1}" />
                          	 </c:if>
                          </c:forEach>
                        
                         </div>
                         </c:if>
                        
                       
                      
                        
                        
                         
                      
</body>
</html>