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
                    <li><a href="#" onclick="return viewDashboard('inventorymanager');"><i class="fa fa-dashboard"></i><spring:message code="home.label" /></a></li>
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
                          	<div class="col-lg-2">
                          		<div style="text-align: center;width: 120px;height: 120px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="getWareHouses('WarehouseConfigurations')" title="<spring:message code="warehouse_configuration.label" />">
                          			<img src="${pageContext.request.contextPath}/images/warehouse.png" style="margin-top: 10px;"><br>
                          			<span><spring:message code="warehouse_configuration.label" /></span>
                          		</div>
                          	</div>
                          	<div class="col-lg-2">
                          		<div style="text-align: center;width: 120px;height: 120px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="showProcurementFlow()" title="<spring:message code="warehouse_procurement.label" />">
                          			<img src="${pageContext.request.contextPath}/images/Procurement.gif" style="margin-top: 10px;"><br>
                          			<span><spring:message code="warehouse.label" /></span><br>
                          			<span><spring:message code="warehouse_procurement.label" /></span>
                          		</div>
                          	</div>
                          	<div class="col-lg-2">
                          		<div style="text-align: center;width: 120px;height: 120px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="viewWarehouseGoodsTransfers('warehouseGoodstransfer','all')" title="<spring:message code="warehouse_goodstransfer.label" />">
                          			<img src="${pageContext.request.contextPath}/images/MaterialTransfer.gif" style="margin-top: 10px;"><br>
                          			<span><spring:message code="warehouse.label" /></span><br>
                          			<span><spring:message code="warehouse_goodstransfer.label" /></span>
                          		</div>
                          	</div>
                          	<div class="col-lg-2" style="text-align: right;">
                          		<div style="text-align: center;width: 120px;height: 120px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="viewShipments('warehouseShipment')" title="<spring:message code="warehouse_shipments.label" />">
                          			<img src="${pageContext.request.contextPath}/images/Shipments.gif" style="margin-top: 10px;"><br>
                          			<span><spring:message code="warehouse.label" /></span><br>
                          			<span><spring:message code="warehouse_shipments.label" /></span>
                          		</div>
                          	</div>
                          	<div class="col-lg-2" style="text-align: right;">
                          		<div style="text-align: center;width: 120px;height: 120px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="viewWarehouseStockVerification('warehouseStockVerification')" title="<spring:message code="warehouse_stockverification.label" />">
                          			<img src="${pageContext.request.contextPath}/images/Verification.gif" style="margin-top: 10px;"><br>
                          			<span><spring:message code="warehouse.label" /></span><br>
                          			<span><spring:message code="warehouse_stockverification.label" /></span>
                          		</div>
                          	</div>
                          	<div class="col-lg-2" style="text-align: left;"></div>
                          </div>
                          <br>
                          <br>
                        <div class="row">
                          	<div class="col-lg-2" style="text-align: right;">
                          		<div style="text-align: center;width: 120px;height: 120px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="" title="<spring:message code="warehouse_reports.label" />">
                          			<img src="${pageContext.request.contextPath}/images/Reports.gif" style="margin-top: 10px;"><br>
                          			<span><spring:message code="warehouse.label" /></span><br>
                          			<span><spring:message code="warehouse_reports.label" /></span>
                          		</div>
                          	</div>
                          	</div>       
</body>
</html>