<!--/*
 * Project Name 	        : OmniRetailerCustomer
 * Written By		        : Mythri.S
 * file name		        : Innventory Manager/Orders/ordersFlow.jsp
 * file type		        : JSP
 * description				: display warehouse flows information
 * */ -->


<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
   <%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
      <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    <!DOCTYPE html>
<!-- <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd"> -->
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Welcome | Omni Retailer</title>
        <meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>
    </head>
<body>
			<%-- 	<section class="content-header">
					 <h1><spring:message code="outlet.management.label" />
  						<small><spring:message code="inventory.management.label" /></small>
 				   </h1>
                   <ol class="breadcrumb">
                    <li><a href="#" onclick="return viewDashboard('inventorymanager');"><i class="fa fa-dashboard"></i><spring:message code="home.label" /></a></li>
                        <li class="active"><a style="cursor: pointer;" onclick="showOutletFlows();"><spring:message code="outlet.management.label"/></a></li>
                        <li class="active"><a style="cursor: pointer;" onclick="showInventoryManagementFlows();"><spring:message code="inventory.management.label"/></a></li>
                    </ol>
                </section> --%>
                
                          <%--   <div class="nav-tabs-custom">
                                <ul class="nav nav-tabs">
                             	 <li class=""><a href="#tab_1" data-toggle="tab"><spring:message code="warehouse_configuration.label"/></a></li>
                              	</ul>
                            </div> --%>
                            <br>
                          <c:if test="${sessionScope.role == 'super admin'}">
                          <div class="row">
                          	<div class="col-lg-2 form-group" style="text-align: right;">
                          		<div style="text-align: center;width: 120px;height: 120px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="showOutletStocksFlow();" title="<spring:message code="stocks.label" />">
                          			<img src="${pageContext.request.contextPath}/images/Stocks.png" style="margin-top: 10px;"><br><br>
                          			<span><spring:message code="stocks.label" /></span>
                          		</div>
                          	</div>
                          	<div class="col-lg-2 form-group">
                          		<div style="text-align: center;width: 120px;height: 120px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="showOutletGoodsTransferFlow();" title="<spring:message code="goods.transfer.label" />">
                          			<img src="${pageContext.request.contextPath}/images/GoodsTransfer.png" style="margin-top: 10px;"><br><br>
                          			<span><spring:message code="goods.transfer.label" /></span>
                          		</div>
                          	</div>
                          	<div class="col-lg-2 form-group" style="text-align: left;">
                          		<div style="text-align: center;width: 120px;height: 120px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="viewStockVerification('outletStockVerification','0','outlet','menu','');" title="<spring:message code="stock.verification.label" />">
                          			<img src="${pageContext.request.contextPath}/images/Outlet_Verification.png" style="margin-top: 10px;"><br><br>
                          			<span><spring:message code="stock.verification.label" /></span>
                          		</div>
                          	</div>
                          		<div class="col-lg-2 form-group" style="text-align: left;">
                          		<div style="text-align: center;width: 120px;height: 120px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="viewMaterialConsumption('outletMaterialConsumption','0','outlet','menu');" title="<spring:message code="material.consumption.label" />">
                          			<img src="${pageContext.request.contextPath}/images/materialconsumption.png" style="margin-top: 10px;"><br><br>
                          			<span><spring:message code="material.consumption.label" /></span>
                          		</div>
                          	</div>
                          		<div class="col-lg-2 form-group" style="text-align: left;">
                          		<div style="text-align: center;width: 120px;height: 120px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="viewoutletstockMovement('outletstockMovement','0','outlet','menu');" title="<spring:message code="stockmovement.label" />">
                          			<img src="${pageContext.request.contextPath}/images/stockmovement.png" style="margin-top: 10px;"><br><br>
                          			<span><spring:message code="stockmovement.label" /></span>
                          		</div>
                          	</div>
                          	</div>
                          	<br>
                          	<div class="row">
                          		<div class="col-lg-2 form-group" style="text-align: left;">
                          		<div style="text-align: center;width: 120px;height: 120px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="viewoutletSuppliersMovement('outletSuppliersMovement','0','outlet','menu');" title="<spring:message code="suppliers.movements.label" />">
                          			<img src="${pageContext.request.contextPath}/images/Outlet_Verification.png" style="margin-top: 10px;"><br><br>
                          			<span><spring:message code="suppliers.movements.label" /></span>
                          		</div>
                          	</div>
                          	
                          	
                          		<div class="col-lg-2 form-group" style="text-align: right;">
	                          		<div style="text-align: center;width: 120px;height: 120px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="viewWarehouseStockVerification('outletStockVerificationReport','0','outlet','menu','','');" title="stock verification report">
	                          			<img src="${pageContext.request.contextPath}/images/imagentavl.png" style="margin-top: -30px; padding: 34px 12px 0px 59px; margin-left: -33%;"><br><br>
	                          			<span>Stock verification report</span>
	                          		</div>
	                          	</div>
	                          	
	                          	<div class="col-lg-2 form-group" style="text-align: right;">
	                          		<div style="text-align: center;width: 120px;height: 120px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="ShowStockVerificationflows();" title="stock verification">
	                          			<img src="${pageContext.request.contextPath}/images/imagentavl.png" style="margin-top: -30px; padding: 34px 12px 0px 59px; margin-left: -33%;"><br><br>
	                          			<span>Stock verification</span>
	                          		</div>
	                          	</div>
	                          	</div>
                          </c:if>
                          
                        <c:if test="${sessionScope.role != 'super admin'}">
                         
                         <c:forEach var="accessControl" items="${sessionScope.outletStocks}" varStatus="thCount">
                        
	                         <c:if test="${thCount.count == 1}"> 
	                          <c:set var="counts" value="${counts+1}" />	
	                          	<div class="col-lg-2 form-group" style="text-align: right;">
	                          		<div style="text-align: center;width: 120px;height: 120px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="showOutletStocksFlow();" title="<spring:message code="stocks.label" />">
	                          			<img src="${pageContext.request.contextPath}/images/Stocks.png" style="margin-top: 10px;"><br><br>
	                          			<span><spring:message code="stocks.label" /></span>
	                          			
	                          		</div>
	                          	</div>
	                         </c:if>
	                     </c:forEach>
	                    <c:forEach var="accessControl" items="${sessionScope.outletGoodsTransfer}" varStatus="theCount">
	                   
                             <c:if test="${theCount.count == 1}">     
                              <c:set var="counts" value="${counts+1}" />	
                       				<div class="col-lg-2 form-group">
		                          		<div style="text-align: center;width: 120px;height: 120px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="showOutletGoodsTransferFlow();" title="<spring:message code="goods.transfer.label" />">
		                          			<img src="${pageContext.request.contextPath}/images/GoodsTransfer.png" style="margin-top: 10px;"><br><br>
		                          			<span><spring:message code="goods.transfer.label" /></span>
		                          		</div>
		                          	</div>
                       			</c:if>
                       		</c:forEach>  
                          <c:forEach var="accessControl" items="${sessionScope.outletStockVerification}" varStatus="theCount"> 
                        
	                            <c:if test="${accessControl.appDocument == 'OutletStockVerification' && accessControl.read == true}">
	                             <c:if test="${theCount.count == 1}">    
	                              <c:set var="counts" value="${counts+1}" />	
		                          	<div class="col-lg-2 form-group" style="text-align: left;">
		                          		<div style="text-align: center;width: 120px;height: 120px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="viewStockVerification('outletStockVerification','0','outlet','menu','');" title="<spring:message code="stock.verification.label" />">
		                          			<img src="${pageContext.request.contextPath}/images/Outlet_Verification.png" style="margin-top: 10px;"><br><br>
		                          			<span><spring:message code="stock.verification.label" /></span>
		                          		</div>
		                          	</div>
		                       </c:if>
		                       </c:if>
		                   </c:forEach>
		                    <c:forEach var="accessControl" items="${sessionScope.outletMaterialConsumption}" varStatus="thCount">
		                    <c:if test="${thCount.count == 1}">    
		                    <c:set var="counts" value="${counts+1}" />	
	                          	<div class="col-lg-2 form-group" style="text-align: right;">
	                          		<div style="text-align: center;width: 120px;height: 120px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="viewMaterialConsumption('outletMaterialConsumption','0','outlet','menu');" title="<spring:message code="material.consumption.label" />">
	                          			<img src="${pageContext.request.contextPath}/images/materialconsumption.png" style="margin-top: 10px;"><br>
	                          			<span><spring:message code="material.consumption.label" /></span>
	                          		</div>
	                          	</div>
	                          	</c:if>
	                     </c:forEach>
	                      <c:forEach var="accessControl" items="${sessionScope.outletStockMovement}" varStatus="thCount">
	                       <c:if test="${thCount.count == 1}">    
	                      <c:set var="counts" value="${counts+1}" />	
	                          	<div class="col-lg-2 form-group" style="text-align: right;">
	                          		<div style="text-align: center;width: 120px;height: 120px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="viewoutletstockMovement('outletstockMovement','0','outlet','menu');" title="<spring:message code="stockmovement.label" />">
	                          			<img src="${pageContext.request.contextPath}/images/stockmovement.png" style="margin-top: 10px;"><br><br>
	                          			<span><spring:message code="stockmovement.label" /></span>
	                          		</div>
	                          	</div>
	                          	</c:if>
	                     </c:forEach>
	                      <c:if test="${counts == 5}">
	                          		<div class="col-lg-2 form-group" style="text-align: right;"></div>
	                          		
	                          		<br><br>
	                          	<div class="row">
	                        </c:if>
	                      <c:forEach var="accessControl" items="${sessionScope.outletSuppliersMovements}" varStatus="thCount">
	                     <c:if test="${thCount.count == 1}">  
	                    
	                      <c:set var="counts" value="${counts+1}" />
	                        <input type="hidden" value="${counts}">  	
	                          	<div class="col-lg-2 form-group" style="text-align: right;">
	                          		<div style="text-align: center;width: 120px;height: 120px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="viewoutletSuppliersMovement('outletSuppliersMovement','0','outlet','menu');" title="<spring:message code="suppliers.movements.label" />">
	                          			<img src="${pageContext.request.contextPath}/images/suppliesreport.png" style="margin-top: 10px;"><br><br>
	                          			<span><spring:message code="suppliers.movements.label" /></span>
	                          		</div>
	                          	</div>
	                          	</c:if>
	                     </c:forEach>
	                      <input type="hidden"  id="fifthvalue" value="${counts}">  
	                    <c:if test="${counts == 5}">
	                          		<div class="col-lg-2 form-group" style="text-align: right;"></div>
	                          		</div>
	                          		<br>
	                          	<div class="row">
	                        </c:if>
	                     <%--  <c:forEach var="accessControl" items="${sessionScope.outletStockVerification}" varStatus="thCount">
	                     <c:if test="${thCount.count == 1}">
	                      <c:set var="counts" value="${counts+1}" />	
	                          	<div class="col-lg-2 form-group" style="text-align: right;">
	                          		<div style="text-align: center;width: 120px;height: 120px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="viewWarehouseStockVerification('outletStockVerificationReport','0','outlet','menu','','');" title="stock verification report">
	                          			<img src="${pageContext.request.contextPath}/images/imagentavl.png" style="margin-top: -30px; padding: 34px 12px 0px 59px; margin-left: -33%;"><br><br>
	                          			<span>Stock verification report</span>
	                          		</div>
	                          	</div>
	                          	</c:if>
	                     </c:forEach> --%>
	                     <c:if test="${counts == 5 || counts == 10}">
	                          		<div class="col-lg-2 form-group" style="text-align: right;"></div>
	                          		</div>
	                          		<br><br>
	                          	<div class="row">
	                        </c:if>
	                        <%--  <c:forEach var="accessControl" items="${sessionScope.outletStockVerification}" varStatus="thCount">
	                     <c:if test="${thCount.count == 1}">
	                      <c:set var="counts" value="${counts+1}" />	
	                          	<div class="col-lg-2 form-group" style="text-align: right;">
	                          		<div style="text-align: center;width: 120px;height: 120px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="ShowStockVerificationflows();" title="stock verification">
	                          			<img src="${pageContext.request.contextPath}/images/imagentavl.png" style="margin-top: -30px; padding: 34px 12px 0px 59px; margin-left: -33%;"><br><br>
	                          			<span>Stock verification</span>
	                          		</div>
	                          	</div>
	                          	</c:if>
	                     </c:forEach> --%>
	                     
                          	<!-- <div class="col-lg-2 form-group" style="text-align: left;"></div>
                          	<div class="col-lg-2 form-group" style="text-align: left;"></div>
                          	<div class="col-lg-2 form-group" style="text-align: left;"></div> -->
                          </div>
                        <div class="row">
                          <div class="col-lg-2 form-group" style="text-align: left; padding-left:3%;">
	                          		<div style="text-align: center;width: 120px;height: 120px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="viewWarehouseStockVerification('outletStockVerificationReport','0','outlet','menu','','');" title="stock verification report">
	                          			<img src="${pageContext.request.contextPath}/images/imagentavl.png" style="margin-top: -30px; padding: 34px 12px 0px 59px; margin-left: -33%;"><br><br>
	                          			<span>Stock verification report</span>
	                          		</div>
	                          	</div>
	                          	
	                          	<div class="col-lg-2 form-group" style="text-align: left; padding-left:2%;">
	                          		<div style="text-align: center;width: 120px;height: 120px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="ShowStockVerificationflows();" title="stock verification">
	                          			<img src="${pageContext.request.contextPath}/images/imagentavl.png" style="margin-top: -30px; padding: 34px 12px 0px 59px; margin-left: -33%;"><br><br>
	                          			<span>Stock verification</span>
	                          		</div>
	                          	</div>
	                          	
	                          	 <c:forEach var="accessControl" items="${sessionScope.outletKeyValueProducts}" varStatus="thCount">
	                         <c:if test="${thCount.count == 1}"> 
	                          <c:set var="counts" value="${counts+1}" />	
	                          	<div class="col-lg-2 form-group" style="text-align: right;">
	                          		<div style="text-align: center;width: 120px;height: 120px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="viewoutletKeyValue('outletKeyValueProducts','0');" title="Key Value">
	                          			<img src="${pageContext.request.contextPath}/images/imagentavl.png" style="margin-top: -30px; padding: 34px 12px 0px 59px; margin-left: -33%;"><br><br>
	                          			<span>Key Value</span>
	                          		</div>
	                          	</div>
	                         </c:if>
	                     </c:forEach>
	                     
	                     <c:forEach var="outletHealth" items="${sessionScope.outletHealth}" varStatus="theCount">
                            	<c:if test="${theCount.count == 1}">
	                          <c:set var="counts" value="${counts+1}" />	
	                          	<div class="col-lg-2 form-group" style="text-align: right;">
	                          		<div style="text-align: center;width: 120px;height: 120px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="showOutletHealthFlows();"  title="<spring:message code="outlet.health.label" />">
	                          			<img src="${pageContext.request.contextPath}/images/imagentavl.png" style="margin-top: -30px; padding: 34px 12px 0px 59px; margin-left: -33%;"><br><br>
	                          			<span><spring:message code="outlet.health.label" /></span>
	                          		</div>
	                          	</div>
	                         </c:if>
	                     </c:forEach>
                          
                          
                          </div>
                          </c:if>
                         <input type="hidden" value="tester">
</body>
</html>