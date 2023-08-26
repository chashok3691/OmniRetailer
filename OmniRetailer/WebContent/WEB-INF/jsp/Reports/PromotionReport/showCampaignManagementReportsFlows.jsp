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
		                          	 <div style="text-align: center;width: 140px;height: 130px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="" title="<spring:message code="promotion.wise.sales.label" />">
		                          			<img src="${pageContext.request.contextPath}/images/supplier-report.png" style="margin-top: 10px;"><br><br>
		                          			<span><spring:message code="supplies.report.label" /></span>
		                              </div>
	                          	 </div>
								 <div class="col-lg-2 form-group" style="text-align: right;">
	                          	 <div style="text-align: center;width: 140px;height: 130px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="" title="<spring:message code="promotion.wise.orders.label" />">
	                          			<img src="${pageContext.request.contextPath}/images/price-variation.png" style="margin-top: 10px;"><br><br>
	                          			<span><spring:message code="price.variation.label" /></span>
	                              </div>
	                          	</div>
 									<div class="col-lg-2 form-group" style="text-align: right;">
	                          	 <div style="text-align: center;width: 140px;height: 130px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="viewItemWisePromotionSales()" title="<spring:message code="item.wise.promotion.sales.label" />">
	                          			<img src="${pageContext.request.contextPath}/images/PvC.png" style="margin-top: 10px;"><br><br>
	                          			<span>Item wise promotion sales</span>
	                              </div>
	                         </div>
	                          	
	                          	  <div class="col-lg-2 form-group" style="text-align: right;"></div>
	                          </div>
	                          
	                      
	                         
                          </c:if>
                      <c:set var="counts" value="0" />
                     <c:if test="${sessionScope.role != 'super admin'}">
                     	<div class="row">
                          
                         <%-- <c:forEach var="accessControl" items="${sessionScope.warehouseReports}">
	                           <c:if test="${accessControl.appDocument == 'WarehouseSuppliesReports'}">
                          		<div class="col-lg-2 form-group" style="text-align: right;">
		                          	 <div style="text-align: center;width: 140px;height: 130px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="" title="<spring:message code="promotion.wise.sales.label" />">
		                          			<img src="${pageContext.request.contextPath}/images/supplier-report.png" style="margin-top: 10px;"><br><br>
		                          			<span><spring:message code="supplies.report.label" /></span>
		                              </div>
	                          	 </div>
	                          	 <c:set var="counts" value="${counts+1}" />
                          	 </c:if>
                          </c:forEach> --%>
                          
                           <%-- <c:forEach var="accessControl" items="${sessionScope.warehouseReports}">
	                          <c:if test="${accessControl.appDocument == 'WarehousePriceVariation'}">
                          	 <div class="col-lg-2 form-group" style="text-align: right;">
	                          	 <div style="text-align: center;width: 140px;height: 130px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="" title="<spring:message code="promotion.wise.orders.label" />">
	                          			<img src="${pageContext.request.contextPath}/images/price-variation.png" style="margin-top: 10px;"><br><br>
	                          			<span><spring:message code="price.variation.label" /></span>
	                              </div>
	                          	</div>
	                          	<c:set var="counts" value="${counts+1}" />
                          	 </c:if>
                          </c:forEach> --%>
                           <c:forEach var="accessControl" items="${sessionScope.warehouseReports}">
	                          <c:if test="${accessControl.appDocument == 'WarehouseProcurementVsConsumption'}">
                          	 <div class="col-lg-2 form-group" style="text-align: right;">
	                          	 <div style="text-align: center;width: 140px;height: 130px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="viewItemWisePromotionSales('0','')" title="Item wise promotion sales">
	                          			<img src="${pageContext.request.contextPath}/images/PvC.png" style="margin-top: 10px;"><br><br>
	                          			<span>Item wise promotion sales</span>
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