<!--/*
 * Project Name 	        : OmniRetailerCustomer
 * Written By		        : Mythri.S
 * file name		        : Innventory Manager/Orders/ordersFlow.jsp
 * file type		        : JSP
 * description				: display warehouse flows information
 * */ -->
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
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
                          <div class="row">
                          <c:if test="${sessionScope.role == 'super admin'}">
                          	<div class="col-lg-2 form-group" style="text-align: right;">
                          		<div style="text-align: center;width: 120px;height: 120px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="showWarehouseStocksFlow();" title="<spring:message code="stocks.label" />">
                          			<img src="${pageContext.request.contextPath}/images/Stocks.png" style="margin-top: 10px;"><br><br>
                          			<span><spring:message code="stocks.label" /></span>
                          		</div>
                          	</div>
                          	
                          		<div class="col-lg-2 form-group" style="text-align: left;">
                          		<div style="text-align: center;width: 120px;height: 120px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="viewStockVerification('warehouseStockVerification','0','warehouse','menu','');" title="<spring:message code="stock.verification.label" />">
                          			<img src="${pageContext.request.contextPath}/images/Outlet_Verification.png" style="margin-top: 10px;"><br><br>
                          				<span><spring:message  code="procurement.label" /></span>
                          		</div>
                          	</div>
                          	
                          		<div class="col-lg-2 form-group" style="text-align: left;">
                          		<div style="text-align: center;width: 120px;height: 120px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="viewStockVerification('warehouseStockVerification','0','warehouse','menu','');" title="<spring:message code="stock.verification.label" />">
                          			<img src="${pageContext.request.contextPath}/images/Outlet_Verification.png" style="margin-top: 10px;"><br><br>
                          			<span><spring:message code="warehouse.shipments.label" /></span>
                          		</div>
                          	</div>
                          	
                          	
                          	
                          			<div class="col-lg-2 form-group" style="text-align: left;">
		                          		<div style="text-align: center;width: 120px;height: 120px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="showWarehouseGoodsTrasferFlow();" title="<spring:message code="stock.verification.label" />">
		                          			<img src="${pageContext.request.contextPath}/images/GoodsTransfer.png" style="margin-top: 10px;"><br><br>
		                          			<span><spring:message code="warehouse.stocktransfer.label" /></span>
		                          		</div>
		                          	</div>
                          	
                          	
                          	<div class="col-lg-2 form-group" style="text-align: left;">
		                          		<div style="text-align: center;width: 120px;height: 120px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="showWarehouseStorageFlow();" title="Storage">
		                          			<img src="${pageContext.request.contextPath}/images/imagentavl.png" style="margin-top: -30px; padding: 34px 12px 0px 59px; margin-left: -33%;"><br><br>
		                          			<span>Storage</span>
		                          		</div>
		                          	</div>
                          	
                          		<div class="col-lg-2 form-group" style="text-align: left;">
		                          		<div style="text-align: center;width: 120px;height: 120px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="viewPackagingandProcessing('warehouseProcessingAndpackaging','0','warehouse','menu','');" title="Processing and Packaging">
		                          			<img src="${pageContext.request.contextPath}/images/imagentavl.png" style="margin-top: -30px; padding: 34px 12px 0px 59px; margin-left: -33%;"><br><br>
		                          			<span>Processing and Packaging</span>
		                          		</div>
		                          	</div>
		                          	<div class="col-lg-2 form-group" style="text-align: left;">
		                          		<div style="text-align: center;width: 120px;height: 120px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="showWarehouseStocksVerificationflow()" title="Processing and Packaging">
		                          			<img src="${pageContext.request.contextPath}/images/imagentavl.png" style="margin-top: -30px; padding: 34px 12px 0px 59px; margin-left: -33%;"><br><br>
		                          			<span>Stock Verification</span>
		                          		</div>
		                          	</div>
                          	
                          </c:if>
                        <c:if test="${sessionScope.role != 'super admin'}">
                         <c:set var="warehouseStock" value="false"/>
	                      <c:forEach var="accessControl" items="${sessionScope.warehouseStockmanagement}">
                         	<c:if test="${accessControl.appDocument == 'WarehouseStocks' && warehouseStock == 'false'}">  
                         		<c:set var="warehouseStock" value="true"/>
	                          	<div class="col-lg-2 form-group" style="text-align: right;">
	                          		<div style="text-align: center;width: 120px;height: 120px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="showWarehouseStocksFlow();" title="<spring:message code="stocks.label" />">
	                          			<img src="${pageContext.request.contextPath}/images/Stocks.png" style="margin-top: 10px;"><br><br>
	                          			<span><spring:message code="stocks.label" /></span>
	                          		</div>
	                          	</div>
	                         </c:if>
	                     </c:forEach>
                        
		                 
		                    <c:set var="warehouseProcurementShipments" value="false"/>
		                   <c:forEach var="accessControl" items="${sessionScope.warehouseStockmanagement}">
	                            <c:if test="${accessControl.appDocument == 'WarehouseProcurementShipment' && warehouseProcurementShipments == 'false'}">
		                          	<c:set var="warehouseProcurementShipments" value="true"/>
		                          	<div class="col-lg-2 form-group" style="text-align: left;">
		                          		<div style="text-align: center;width: 120px;height: 120px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="showWarehouseProcurementShipmentsFlow();" title="<spring:message code="stock.verification.label" />">
		                          			<img src="${pageContext.request.contextPath}/images/Procurement.gif" style="margin-top: 10px;"><br><br>
		                          			<span><spring:message code="procurement.label" /></span>
		                          		</div>
		                          	</div>
		                       </c:if>
		                   </c:forEach>
		                   
                     
                          
                          <c:set var="warehouseProcurement" value="false"/>
		                   <c:forEach var="accessControl" items="${sessionScope.warehouseStockmanagement}">
	                            <c:if test="${accessControl.appDocument == 'WarehouseProcurement' && warehouseProcurement == 'false'}">
		                          	<c:set var="warehouseProcurement" value="true"/>
		                          	<div class="col-lg-2 form-group" style="text-align: left;">
		                          		<div style="text-align: center;width: 120px;height: 120px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="showWarehouseProcurementFlows();" title="<spring:message code="stock.verification.label" />">
		                          			<img src="${pageContext.request.contextPath}/images/logistics.png" style="margin-top: 10px;"><br><br>
		                          			<span><spring:message code="warehouse.shipments.label" /></span>
		                          		</div>
		                          	</div>
		                       </c:if>
		                   </c:forEach>
		                   
                          
                          
                          
                          <c:set var="warehouseGoodsTransfer" value="false"/>
		                   <c:forEach var="accessControl" items="${sessionScope.warehouseStockmanagement}">
	                            <c:if test="${accessControl.appDocument == 'WarehouseGoodsTransfer' && warehouseGoodsTransfer == 'false'}">
		                          	<c:set var="warehouseGoodsTransfer" value="true"/>
		                          	<div class="col-lg-2 form-group" style="text-align: left;">
		                          		<div style="text-align: center;width: 120px;height: 120px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="showWarehouseGoodsTrasferFlow();" title="<spring:message code="stock.verification.label" />">
		                          			<img src="${pageContext.request.contextPath}/images/GoodsTransfer.png" style="margin-top: 10px;"><br><br>
		                          			<span><spring:message code="warehouse.stocktransfer.label" /></span>
		                          		</div>
		                          	</div>
		                       </c:if>
		                   </c:forEach>
		                   
                          
                          
		                   
		                    <c:set var="warehouseStorageStock" value="false"/>
		                   <c:forEach var="accessControl" items="${sessionScope.warehouseStockmanagement}">
	                            <c:if test="${accessControl.appDocument == 'WarehouseStorageStocks' && warehouseStorageStock == 'false'}">
		                          	<c:set var="warehouseStorageStock" value="true"/>
		                          	<div class="col-lg-2 form-group" style="text-align: left;">
		                          		<div style="text-align: center;width: 120px;height: 120px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="showWarehouseStorageFlow();" title="Storage">
		                          			<img src="${pageContext.request.contextPath}/images/imagentavl.png" style="margin-top: -30px; padding: 34px 12px 0px 59px; margin-left: -33%;"><br><br>
		                          			<span>Storage</span>
		                          		</div>
		                          	</div>
		                       </c:if>
		                   </c:forEach>
		                   </div>
		                   <div class="row">
		                   	<c:set var="warehouseprocessandpackage" value="false"/>
		                     <c:forEach var="accessControl" items="${sessionScope.warehouseStockmanagement}">
	                            <c:if test="${accessControl.appDocument == 'WarehousePackaging' && accessControl.read == true}">
		                          	<c:set var="warehouseprocessandpackage" value="true"/>
		                          	<div class="col-lg-2 form-group" style="text-align: left;">
		                          		<div style="text-align: center;width: 120px;height: 120px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="viewPackagingandProcessing('warehouseProcessingAndpackaging','0','warehouse','menu','');" title="Processing and Packaging">
		                          			<img src="${pageContext.request.contextPath}/images/imagentavl.png" style="margin-top: -30px; padding: 34px 12px 0px 59px; margin-left: -33%;"><br><br>
		                          			<span>Processing and Packaging</span>
		                          		</div>
		                          	</div>
		                       </c:if>
		                   </c:forEach>
		                
		                  <%--  <c:set var="StockVerification" value="false"/>
		                     <c:forEach var="accessControl" items="${sessionScope.warehouseStockmanagement}">
	                            <c:if test="${accessControl.appDocument == 'WarehouseStockVerifications' && accessControl.read == true &&  warehouseStockverificationsFlow == 'false'}">
		                          	<c:set var="warehouseprocessandpackage" value="true"/>
		                          	<div class="col-lg-2 form-group" style="text-align: left;">
		                          		<div style="text-align: center;width: 120px;height: 120px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="showWarehouseStockManagementFlows();" title="Stock Verification">
		                          			<img src="${pageContext.request.contextPath}/images/imagentavl.png" style="margin-top: -30px; padding: 34px 12px 0px 59px; margin-left: -33%;"><br><br>
		                          			<span>Stock Verification</span>
		                          		</div>
		                          		 <c:set var="StockVerification" value="true"/>
		                          	</div>
		                       </c:if>
		                   </c:forEach> --%>
		                   
		                   	<c:set var="warehouseStockverificationsFlow" value="false"/>
	                  		<c:forEach var="accessControl" items="${sessionScope.warehouseStockmanagement}">
	                          <c:if test="${accessControl.appDocument == 'WarehouseStockVerifications' && warehouseStockverificationsFlow == 'false'}"> 
		                          	<c:set var="warehouseStockverificationsFlow" value="true"/>
		                          	<div class="col-lg-2 form-group" style="text-align: left;">
		                          		<div style="text-align: center;width: 120px;height: 120px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="showWarehouseStocksVerificationflow()" title="Stock-Verification">
		                          			<img src="${pageContext.request.contextPath}/images/imagentavl.png" style="margin-top: -30px; padding: 34px 12px 0px 59px; margin-left: -33%;"><br><br>
		                          			<span>Stock-Verification</span>
		                          		</div>
		                          	</div>
		                       </c:if>
		                   </c:forEach>
		                   
		                   
		                   
                          <!-- 	<div class="col-lg-2 form-group" style="text-align: left;"></div> -->
                          	<div class="col-lg-2 form-group" style="text-align: left;"></div>
                          	<div class="col-lg-2 form-group" style="text-align: left;"></div>
                          </c:if>
                          </div>
                         
</body>
</html>