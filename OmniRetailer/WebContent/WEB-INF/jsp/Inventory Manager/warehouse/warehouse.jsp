<!--/*
 * Project Name 	        : OmniRetailerCustomer
 * Written By		        : Sambaiah Y
 * file name		        : onventorymanager/warehouse/warehouse.jsp
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
				<section class="content-header">
                    <h1>
                       <spring:message code="warehouse.management.label"/>
                    </h1>
                    <ol class="breadcrumb">
                    <li><a href="#" onclick="return showOutletDashboard('all','all','month','all');"><i class="fa fa-dashboard"></i><spring:message code="home.label" /></a></li>
                        <li class="active"><spring:message code="warehouse.management.label"/></li>
                    </ol>
                </section>
                
                          <%--   <div class="nav-tabs-custom">
                                <ul class="nav nav-tabs">
                             	 <li class=""><a href="#tab_1" data-toggle="tab"><spring:message code="warehouse_configuration.label"/></a></li>
                              	</ul>
                            </div> --%>
                            <br>
                          <div class="row">
                          <c:if test="${sessionScope.role == 'super admin'}">
                          	<div class="col-lg-2">
                          		<div style="text-align: center;width: 140px;height: 130px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="getWareHouses('WarehouseConfigurations','0')" title="<spring:message code="warehouse_configuration.label" />">
                          			<img src="${pageContext.request.contextPath}/images/warehouse.gif" style="margin-top: 10px;"><br>
                          			<span><spring:message code="warehouse_configuration.label" /></span>
                          		</div>
                          	</div>
                          		<div class="col-lg-2 form-group" style="text-align: right;">
                          		<div style="text-align: center;width: 140px;height: 130px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="viewWhCounterMaster('WhcounterMaster','0');" title="<spring:message code="operation.counters.label" />">
                          			<img src="${pageContext.request.contextPath}/images/BillingCounter.png" style="margin-top: 10px;"><br>
                          			<span><spring:message code="operation.counters.label" /></span><br>
                          		</div>
                       		</div>
                          	<div class="col-lg-2">
                         		<div style="text-align: center;width: 140px;height: 130px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="showWarehouseStockManagementFlows()" title="<spring:message code="stockmanagement.label" />">
                         			<img src="${pageContext.request.contextPath}/images/Verification.gif" style="margin-top: 10px;"><br>
                         			<span><spring:message code="stockmanagement.label" /></span>
                         		</div>
                         	</div>
                       		<%-- <div class="col-lg-2">
                         		<div style="text-align: center;width: 140px;height: 130px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="showWarehouseProcurementFlows()" title="<spring:message code="procurement.shipment.label" />">
                         			<img src="${pageContext.request.contextPath}/images/Procurement.gif" style="margin-top: 10px;"><br>
                         			<span><spring:message code="procurement.shipment.label" /></span>
                         		</div>
                         	</div>
                         	<div class="col-lg-2 form-group">
                          		<div style="text-align: center;width: 140px;height: 130px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="showWarehouseGoodsTrasferFlow();" title="<spring:message code="warehouse.stocktransfer.label" />">
                          			<img src="${pageContext.request.contextPath}/images/GoodsTransfer.png" style="margin-top: 10px;"><br><br>
                          			<span><spring:message code="warehouse.stocktransfer.label" /></span>
                          		</div>
                          	</div> --%>
                         	
                          	<div class="col-lg-2 form-group"></div>
                      	</div>
                      	<div class="row">
                      	<div class="col-lg-2 form-group" style="text-align: left;">
                          		<div style="text-align: center;width: 140px;height: 130px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="showWarehouseOrders()" title="<spring:message code="order.fulfillment.label" />">
                          			<img src="${pageContext.request.contextPath}/images/CustomerOrder.gif" style="margin-top: 10px;"><br>
                          			<span><spring:message code="order.fulfillment.label" /></span>
                          		</div>
                          	</div>
                          	<div class="col-lg-2 form-group">
                          		<div style="text-align: center;width: 140px;height: 130px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="viewHomePageDeals('warehouseHealth');" title="<spring:message code="warehouse.health.label" />">
                          			<img src="${pageContext.request.contextPath}/images/WarehouseHealth.png" style="margin-top: 10px;"><br><br>
                          			<span><spring:message code="warehouse.health.label" /></span>
                          		</div>
                          	</div>
                         	<div class="col-lg-2 form-group" style="text-align: left;">
                          		<div style="text-align: center;width: 140px;height: 130px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="viewHomePageDeals('warehouseNotation')" title="<spring:message code="warehouse.notification.label" />">
                          			<img src="${pageContext.request.contextPath}/images/WarehouseNotification.png" style="margin-top: 10px;"><br>
                          			<span><spring:message code="warehouse.notification.label" /></span>
                          		</div>
                          	</div>
                          	
                          		<div class="col-lg-2 form-group" style="text-align: left;">
		                          		<div style="text-align: center;width: 140px;height: 130px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="viewWarehouseTaxation('Whtaxation','0','');" title="Taxation">
		                          			<img src="${pageContext.request.contextPath}/images/imagentavl.png" style="margin-top: -30px; padding: 34px 12px 0px 59px; margin-left: -33%;"><br>
		                          			<span>Taxation</span>
		                          		</div>
		                          	</div>
		                          	
		                        <div class="col-lg-2 form-group" style="text-align: left;">
		                          		<div style="text-align: center;width: 140px;height: 130px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="viewMenuConfigurationsWH('menuConfigurationsWH');" title="Menu">
		                          			<img src="${pageContext.request.contextPath}/images/imagentavl.png" style="margin-top: -30px; padding: 34px 12px 0px 59px; margin-left: -33%;"><br>
		                          			<span>Menu</span>
		                          		</div>
		                          	</div>  
		                          	
		                          	<div class="col-lg-2 form-group" style="text-align: left;">
		                          		<div style="text-align: center;width: 140px;height: 130px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="getWareHousespos('WarehousePOSs','0')" title="WarehousePOS">
		                          			<img src="${pageContext.request.contextPath}/images/imagentavl.png" style="margin-top: -30px; padding: 34px 12px 0px 59px; margin-left: -33%;"><br>
		                          			<span>WarehousePos</span>
		                          		</div>
		                          	</div>	
		                          	
		                          		<div class="col-lg-2 form-group" style="text-align: left;">
		                          		<div style="text-align: center;width: 140px;height: 130px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="showShiftManagementFlows('warehouse');" title="ShiftManagement">
		                          			<img src="${pageContext.request.contextPath}/images/imagentavl.png" style="margin-top: -30px; padding: 34px 12px 0px 59px; margin-left: -33%;"><br>
		                          			<span>ShiftManagement</span>
		                          		</div>
		                          	</div>
		                          	
		                          		<div class="col-lg-2 form-group" style="text-align: left;">
		                          		<div style="text-align: center;width: 140px;height: 130px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="showBillsFlowsWareHouse();" title="Billing&Payment">
		                          			<img src="${pageContext.request.contextPath}/images/imagentavl.png" style="margin-top: -30px; padding: 34px 12px 0px 59px; margin-left: -33%;"><br>
		                          			<span>Billing&Payment</span>
		                          		</div>
		                          	</div>
                          </c:if>
                           <c:set var="noOfCols" value="0"/>
                         <c:if test="${sessionScope.role != 'super admin'}">
                          <c:set var="warehouseConfig" value="false"/>
                            <c:forEach var="accessControl" items="${sessionScope.warehouseManagement}">
                            		<c:if test="${accessControl.appDocument == 'WarehouseConfigurations' && accessControl.write == true && accessControl.read == false}"> 
                            		 <c:set var="warehouseConfig" value="true"/>
                            		 <c:set var="noOfCols" value="${noOfCols + 1}" />
                            			<div class="col-lg-2">
			                          		<div style="text-align: center;width: 140px;height: 130px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="return newWarehouse('newWarehouseConfig');" title="<spring:message code="warehouse_configuration.label" />">
			                          			<img src="${pageContext.request.contextPath}/images/warehouse.gif" style="margin-top: 10px;"><br>
			                          			<span><spring:message code="warehouse_configuration.label" /></span>
			                          		</div>
			                          	</div>
                            		</c:if>
	                            	<c:if test="${accessControl.appDocument == 'WarehouseConfigurations' && warehouseConfig == false}">
	                            	<c:set var="noOfCols" value="${noOfCols + 1}" /> 
			                          	<div class="col-lg-2">
			                          		<div style="text-align: center;width: 140px;height: 130px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="getWareHouses('WarehouseConfigurations','0')" title="<spring:message code="warehouse_configuration.label" />">
			                          			<img src="${pageContext.request.contextPath}/images/warehouse.gif" style="margin-top: 10px;"><br>
			                          			<span><spring:message code="warehouse_configuration.label" /></span>
			                          		</div>
			                          	</div>
                            		</c:if>
                            </c:forEach>
                            	<c:set var="WhcounterMaster" value="false"/>
                            <c:forEach var="accessControl" items="${sessionScope.warehouseManagement}">
                            		<c:if test="${accessControl.appDocument == 'WhCounterMaster' && accessControl.write == true && accessControl.read == false}"> 
                            			<c:set var="noOfCols" value="${noOfCols + 1}" />
                            			<c:set var="WhcounterMaster" value="true"/>
                          				<div class="col-lg-2 form-group" style="text-align: right;">
			                          		<div style="text-align: center;width: 140px;height: 130px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="viewWhNewCounter('WhnewCounter');" title="<spring:message code="operation.counters.label" />">
			                          			<img src="${pageContext.request.contextPath}/images/BillingCounter.png" style="margin-top: 10px;"><br>
			                          			<span><spring:message code="operation.counters.label" /></span><br>
			                          		</div>
			                       		</div>
                          			</c:if>
	                            	<c:if test="${accessControl.appDocument == 'WhCounterMaster' && WhcounterMaster == false}"> 
	                            	<c:set var="noOfCols" value="${noOfCols + 1}" />
                          				<div class="col-lg-2 form-group" style="text-align: right;">
			                          		<div style="text-align: center;width: 140px;height: 130px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="viewWhCounterMaster('WhcounterMaster','0');" title="<spring:message code="operation.counters.label" />">
			                          			<img src="${pageContext.request.contextPath}/images/BillingCounter.png" style="margin-top: 10px;"><br>
			                          			<span><spring:message code="operation.counters.label" /></span><br>
			                          		</div>
			                       		</div>
                          			</c:if>
                          	</c:forEach>
                            <c:forEach var="accessControl" items="${sessionScope.warehouseStockmanagement}" varStatus="theCount">
			                    	<c:if test="${theCount.count == 1}">
			                    	<c:set var="noOfCols" value="${noOfCols + 1}" />
			                    		 <div class="col-lg-2">
			                         		<div style="text-align: center;width: 140px;height: 130px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="showWarehouseStockManagementFlows()" title="<spring:message code="stockmanagement.label" />">
			                         			<img src="${pageContext.request.contextPath}/images/Verification.gif" style="margin-top: 10px;"><br>
			                         			<span><spring:message code="stockmanagement.label" /></span>
			                         		</div>
			                         	</div>
			                    	</c:if>
			                    </c:forEach>
                       <%--     <c:forEach var="accessControl" items="${sessionScope.warehouseProcurement}" varStatus="theCount">
			                    <c:if test="${theCount.count == 1}">
			                    <c:set var="noOfCols" value="${noOfCols + 1}" />
		                          	<div class="col-lg-2">
		                         		<div style="text-align: center;width: 140px;height: 130px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="showWarehouseProcurementFlows()" title="<spring:message code="procurement.shipment.label" />">
		                         			<img src="${pageContext.request.contextPath}/images/Procurement.gif" style="margin-top: 10px;"><br>
		                         			<span><spring:message code="procurement.shipment.label" /></span>
		                         		</div>
		                         	</div>
		                         </c:if>
		                     </c:forEach>
		                    <c:forEach var="accessControl" items="${sessionScope.warehouseGoodsTransfer}" varStatus="theCount">
			                    <c:if test="${theCount.count == 1}">   
			                    <c:set var="noOfCols" value="${noOfCols + 1}" />  
									<div class="col-lg-2 form-group">
		                          		<div style="text-align: center;width: 140px;height: 130px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="showWarehouseGoodsTrasferFlow();" title="<spring:message code="warehouse.stocktransfer.label" />">
		                          			<img src="${pageContext.request.contextPath}/images/GoodsTransfer.png" style="margin-top: 10px;"><br><br>
		                          			<span><spring:message code="warehouse.stocktransfer.label" /></span>
		                          		</div>
		                          	</div>
                       			</c:if>
                       		</c:forEach> --%>
                       		 <c:if test="${noOfCols == 5}">
                          			<div class="col-lg-2 form-group" style="text-align: left;"></div>
                          		</div>
                          		<br><br>
	                        	<div class="row">
		                    </c:if>
                          	 <c:forEach var="accessControl" items="${sessionScope.warehouseSalesOrder}" varStatus="theCount">
			                    <c:if test="${theCount.count == 1}">
			                    <c:set var="noOfCols" value="${noOfCols + 1}" />
			                    	<div class="col-lg-2 form-group" style="text-align: left;">
		                          		<div style="text-align: center;width: 140px;height: 130px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="showWarehouseOrders()" title="<spring:message code="order.fulfillment.label" />">
		                          			<img src="${pageContext.request.contextPath}/images/CustomerOrder.gif" style="margin-top: 10px;"><br>
		                          			<span><spring:message code="order.fulfillment.label" /></span>
		                          		</div>
		                          	</div>
			                    </c:if>
			                 </c:forEach>
			                
		                    
			                <c:forEach var="accessControl" items="${sessionScope.warehouseManagement}">
                           		<c:if test="${accessControl.appDocument == 'WarehouseHealth' && accessControl.read == true}"> 
                           		<c:set var="noOfCols" value="${noOfCols + 1}" />
                           			<div class="col-lg-2 form-group">
		                          		<div style="text-align: center;width: 140px;height: 130px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="viewHomePageDeals('warehouseHealth');" title="<spring:message code="warehouse.health.label" />">
		                          			<img src="${pageContext.request.contextPath}/images/WarehouseHealth.png" style="margin-top: 10px;"><br><br>
		                          			<span><spring:message code="warehouse.health.label" /></span>
		                          		</div>
		                          	</div>
                           		</c:if>
                           	</c:forEach>
                           
	                        	<div class="row"></div>
		                   
                           	<c:forEach var="accessControl" items="${sessionScope.warehouseManagement}">
                           		<c:if test="${accessControl.appDocument == 'WarehouseNotifications' && accessControl.read == true}"> 
                           		<c:set var="noOfCols" value="${noOfCols + 1}" />
                           			<div class="col-lg-2 form-group" style="text-align: left;">
		                          		<div style="text-align: center;width: 140px;height: 130px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="viewHomePageDeals('warehouseNotation')" title="<spring:message code="warehouse.notification.label" />">
		                          			<img src="${pageContext.request.contextPath}/images/WarehouseNotification.png" style="margin-top: 10px;"><br>
		                          			<span><spring:message code="warehouse.notification.label" /></span>
		                          		</div>
		                          	</div>
                           		</c:if>
                           	</c:forEach>
                           	
                           	
                           		<%-- <c:if test="${noOfCols == 5}">
                          			<div class="col-lg-2 form-group" style="text-align: left;"></div>
                          		</div>
                          		<br><br>
	                        	<div class="row">
		                    </c:if> --%>
		                     <c:set var="whTaxation" value="false"/> 
                           	<c:forEach var="accessControl" items="${sessionScope.warehouseManagement}">
                           		<c:if test="${accessControl.appDocument == 'WhTaxation' && whTaxation == false}"> 
                           		<c:set var="noOfCols" value="${noOfCols + 1}" />
                           			<div class="col-lg-2 form-group" style="text-align: left;">
		                          		<div style="text-align: center;width: 140px;height: 130px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="viewWarehouseTaxation('Whtaxation','0','');" title="Taxation">
		                          			<img src="${pageContext.request.contextPath}/images/imagentavl.png" style="margin-top: -30px; padding: 34px 12px 0px 59px; margin-left: -33%;"><br>
		                          			<span>Taxation</span>
		                          		</div>
		                          	</div>
                           		</c:if>
                           	</c:forEach>
                           	
                           	
                           		<%-- <c:if test="${noOfCols == 5}">
                          			<div class="col-lg-2 form-group" style="text-align: left;"></div>
                          		</div>
                          		<br><br>
	                        	<div class="row">
		                    </c:if> --%>
                           		 <c:set var="warehouseMenu" value="false"/>
                           	 	<c:forEach var="accessControl" items="${sessionScope.warehouseManagement}">
                           		<c:if test="${accessControl.appDocument == 'WarehouseMenu' && warehouseMenu == false}"> 
                           		<c:set var="noOfCols" value="${noOfCols + 1}" />
                           			<div class="col-lg-2 form-group" style="text-align: left;">
		                          		<div style="text-align: center;width: 140px;height: 130px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="viewMenuConfigurationsWH('menuConfigurationsWH');" title="Menu">
		                          			<img src="${pageContext.request.contextPath}/images/imagentavl.png" style="margin-top: -30px; padding: 34px 12px 0px 59px; margin-left: -33%;"><br>
		                          			<span>Menu</span>
		                          		</div>
		                          	</div>
                           		</c:if>
                           	</c:forEach>
                           	
                          <%--  	<c:if test="${noOfCols == 5}">
                          			<div class="col-lg-2 form-group" style="text-align: left;"></div>
                          		</div>
                          		<br><br>
	                        	<div class="row">
		                    </c:if> --%>
		                     <c:set var="warehousepos" value="false"/>
                           	<c:forEach var="accessControl" items="${sessionScope.warehouseManagement}">
                           		<c:if test="${accessControl.appDocument == 'WarehousePOS' && warehousepos == false}"> 
                           		<c:set var="noOfCols" value="${noOfCols + 1}" />
                           			<div class="col-lg-2 form-group" style="text-align: left;">
		                          		<div style="text-align: center;width: 140px;height: 130px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="getWareHousespos('WarehousePOSs','0')" title="WarehousePOS">
		                          			<img src="${pageContext.request.contextPath}/images/imagentavl.png" style="margin-top: -30px; padding: 34px 12px 0px 59px; margin-left: -33%;"><br>
		                          			<span>WarehousePos</span>
		                          		</div>
		                          	</div>
                           		</c:if>
                           	</c:forEach>
                           	
                           <c:if test="${noOfCols == 5 || noOfCols == 10}">
                           <div class="col-lg-2 form-group" style="text-align: left;"></div>
                          	</div>
                          		<br><br>
	                        	<div class="row">
		                    </c:if>
                           <c:forEach var="accessControl" items="${sessionScope.warehouseshiftManagement}" varStatus="theCount">
	                         <c:if test="${theCount.count == 1}">
	                         <c:set var="noOfCols" value="${noOfCols + 1}" />
                           			<div class="col-lg-2 form-group" style="text-align: left;">
		                          		<div style="text-align: center;width: 140px;height: 130px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="showShiftManagementFlows('warehouse');" title="ShiftManagement">
		                          			<img src="${pageContext.request.contextPath}/images/imagentavl.png" style="margin-top: -30px; padding: 34px 12px 0px 59px; margin-left: -33%;"><br>
		                          			<span>ShiftManagement</span>
		                          		</div>
		                          	</div>
                           		</c:if>
                           	</c:forEach>
                           
	                        	<div class="row"></div>
		                   
		                   
                           	<c:forEach var="accessControl" items="${sessionScope.warehouseManagement}" varStatus="theCount">
	                        <c:if test="${accessControl.appDocument == 'WarehouseBillingAndPayments' && accessControl.read == true}"> 

                           			<div class="col-lg-2 form-group" style="text-align: left;">
		                          		<div style="text-align: center;width: 140px;height: 130px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="showBillsFlowsWareHouse();" title="Billing&Payment">
		                          			<img src="${pageContext.request.contextPath}/images/imagentavl.png" style="margin-top: -30px; padding: 34px 12px 0px 59px; margin-left: -33%;"><br>
		                          			<span>Billing&Payment</span>
		                          		</div>
		                          	</div>
                           		</c:if>
                           	</c:forEach>
                      </c:if>    	
              </div>
</body>
</html>