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
		                          	 <div style="text-align: center;width: 140px;height: 130px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="viewoutletstockAging('outletstockAging','0','outlet','menu');" title="<spring:message code="stockaging.label" />">
		                          			<img src="${pageContext.request.contextPath}/images/ShipmentReceipt.png" style="margin-top: 10px;"><br><br>
		                          			<span><spring:message code="stockaging.label" /></span>
		                              </div>
	                          	 </div>
							
							
							<div class="col-lg-2 form-group" style="text-align: right;">
		                          	 <div style="text-align: center;width: 140px;height: 130px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="viewoutletstockExpiry('outletstockExpiry','0','outlet','menu');" title="<spring:message code="stock.expiry.label" />">
		                          		<img src="${pageContext.request.contextPath}/images/ShipmentReceipt.png" style="margin-top: 10px;"><br><br>
		                          			<span><spring:message code="stock.expiry.label" /></span>
		                              </div>
	                          	 </div>
							
	                          	
	                          	  <div class="col-lg-2 form-group" style="text-align: right;"></div>
	                          </div>
	                          
	                      
	                         
                          </c:if>
                      <c:set var="counts" value="0" />
                     <c:if test="${sessionScope.role != 'super admin'}">
                     	<div class="row">
                          
                         <c:forEach var="accessControl" items="${sessionScope.outletOtherReports}">
	                           <c:if test="${accessControl.appDocument == 'OutletStockReports'}">
                          		<div class="col-lg-2 form-group" style="text-align: right;">
		                          	 <div style="text-align: center;width: 140px;height: 130px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="viewoutletstockAging('outletstockAging','0','outlet','menu');" title="<spring:message code="stockaging.label" />">
		                          			<img src="${pageContext.request.contextPath}/images/garbage.png" style="margin-top: 10px;"><br><br>
		                          			<span><spring:message code="stockaging.label" /></span>
		                              </div>
	                          	 </div>
	                          	 <c:set var="counts" value="${counts+1}" />
                          	 </c:if>
                          	 
                          	 
                          	  <c:if test="${accessControl.appDocument == 'OutletStockReports'}">
                          		<div class="col-lg-2 form-group" style="text-align: right;">
		                          	 <div style="text-align: center;width: 140px;height: 130px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="viewoutletstockExpiry('outletstockExpiry','0','outlet','menu');" title="<spring:message code="stock.expiry.label" />">
		                          			<img src="${pageContext.request.contextPath}/images/garbage.png" style="margin-top: 10px;"><br><br>
		                          			<span><spring:message code="stock.expiry.label" /></span>
		                              </div>
	                          	 </div>
	                          	 <c:set var="counts" value="${counts+1}" />
                          	 </c:if>
                          	 
                          	 
                          	  <c:if test="${accessControl.appDocument == 'OutletStockReports'}">
                          		<div class="col-lg-2 form-group" style="text-align: right;">
		                          	 <div style="text-align: center;width: 140px;height: 130px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="viewEventInventory('eventInventory','0','outlet','menu');" title="Events Inventory">
		                          			<img src="${pageContext.request.contextPath}/images/imagentavl.png"  style="margin-top: -30px; padding: 34px 12px 0px 59px; margin-left: -33%;"><br><br>
		                          			<span>Events Inventory</span>
		                              </div>
	                          	 </div>
	                          	 <c:set var="counts" value="${counts+1}" />
                          	 </c:if>
                          	 
                          </c:forEach>
                        
                        <c:if test="${counts == 5}">
                          		<div class="col-lg-2 form-group" style="text-align: right;"></div>
                          		</div>
                          	<div class="row">
                         </c:if>
                        
                       
                      
                        
                        
                          </div>
                      </c:if>
</body>
</html>