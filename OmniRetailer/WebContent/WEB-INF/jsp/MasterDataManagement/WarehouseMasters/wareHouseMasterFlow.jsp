
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
		                          			<div style="text-align: center;width: 140px;height: 130px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="return viewWarehouseSkuMaster('warehouseskumaster','0','');" title="<spring:message code="masters_label" />">
			                          			<img src="${pageContext.request.contextPath}/images/SkuMaster.png" style="margin-top: 10px;"><br><br>
			                          			<span>&nbsp;&nbsp;<spring:message code="sku.label" /></span>
			                          			<span><spring:message code="masters_label" /></span>
			                          		</div>
		                          		</div>
										<div class="col-lg-2 form-group" style="text-align: right;">
		                          			<div style="text-align: center;width: 140px;height: 130px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="return viewWarehouseStorageSystemsMaster('WarehouseStorageSystemsMaster','0','');" title="<spring:message code="storagesystemsmaster.label" />">
			                          			<img src="${pageContext.request.contextPath}/images/storagesystems.png" style="margin-top: 10px;"><br><br>
			                          			<span>&nbsp;&nbsp;<spring:message code="storagesystemsmaster.label" /></span>
			                          			
			                          		</div>
		                          		</div>
											<div class="col-lg-2 form-group" style="text-align: right;">
		                          			<div style="text-align: center;width: 140px;height: 130px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="return viewWarehouseFleetMaster('WarehouseFleetMaster','0','');" title="<spring:message code="fleetmaster.label" />">
			                          			<img src="${pageContext.request.contextPath}/images/fleetmanagment.png" style="margin-top: 10px;"><br><br>
			                          			<span>&nbsp;&nbsp;<spring:message code="fleetmaster.label" /></span>
			                          		</div>
		                          		</div>
											<div class="col-lg-2 form-group" style="text-align: right;">
		                          			<div style="text-align: center;width: 140px;height: 130px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="return viewWarehouseLogisticsPartners('WarehouseLogisticsPartners','0','');" title="<spring:message code="logisticspartner.label" />">
			                          			<img src="${pageContext.request.contextPath}/images/logistics.png" style="margin-top: 10px;"><br><br>
			                          			<span>&nbsp;&nbsp;<spring:message code="logisticspartner.label" /></span>
			                          		</div>
		                          		</div>
		                          		
		                          		<div class="col-lg-2 form-group" style="text-align: right;">
		                          			<div style="text-align: center;width: 140px;height: 130px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="return viewBomMasterWarehouse('BomMasterWH','0');" title="BOM Masters">
			                          			<img src="${pageContext.request.contextPath}/images/imagentavl.png" style="margin-top: -30px; padding: 34px 12px 0px 59px; margin-left: -33%;"><br><br>
			                          			<span>&nbsp;&nbsp;BOM Masters</span>
			                          		</div>
		                          		</div>
		                          		
		                          		<div class="col-lg-2 form-group" style="text-align: right;">
		                          			<div style="text-align: center;width: 140px;height: 130px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="showarehousemasterspricemgmtflows('warehouse')" title="Price Management">
			                          			<img src="${pageContext.request.contextPath}/images/imagentavl.png" style="margin-top: -30px; padding: 34px 12px 0px 59px; margin-left: -33%;"><br><br>
			                          			<span>Price Management</span>
			                          		</div>
		                          		</div>
		                          		
		                          		<div style="text-align: center;width: 140px;height: 130px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="return viewStockUpdateDetails('WarehouseStockUpdate','0','');" title="Stock Update">
			                          			<img src="${pageContext.request.contextPath}/images/imagentavl.png" style="margin-top: -30px; padding: 34px 12px 0px 59px; margin-left: -33%;"><br><br>
			                          			<span>&nbsp;&nbsp;Stock Update</span>
			                          		</div>

                          		
                          		</div>
                          		
                          		<br><br>
                          		
                          </c:if>
                          <c:if test="${sessionScope.role != 'super admin'}">
                          <c:set var="counts" value="0" />
                          <div class="row">
                         
                          	<c:set var="WarehouseskuMaster" value="false"/>
                            <c:forEach var="accessControl" items="${sessionScope.warehouseMasterSettings}">
                            		<c:if test="${accessControl.appDocument == 'WarehouseSkuMaster' && accessControl.write == true && accessControl.read == false}"> 
                            			<c:set var="WarehouseskuMaster" value="true"/>
                            			<div class="col-lg-2 form-group" style="text-align: right;">
		                          			<div style="text-align: center;width: 140px;height: 130px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="return newSku('newSku');" title="<spring:message code="masters_label" />">
			                          			<img src="${pageContext.request.contextPath}/images/SkuMaster.png" style="margin-top: 10px;"><br><br>
			                          			<span><spring:message code="sku.label" /></span>
			                          			
			                          		</div>
		                          		</div>
		                          		<c:set var="counts" value="${counts+1}" />		
                            		</c:if>
	                            	<c:if test="${accessControl.appDocument == 'WarehouseSkuMaster' && WarehouseskuMaster == false}"> 		
                            			<div class="col-lg-2 form-group" style="text-align: right;">
		                          			<div style="text-align: center;width: 140px;height: 130px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="return viewWarehouseSkuMaster('warehouseskumaster','0','');" title="<spring:message code="masters_label" />">
			                          			<img src="${pageContext.request.contextPath}/images/SkuMaster.png" style="margin-top: 10px;"><br><br>
			                          			<span>&nbsp;&nbsp;<spring:message code="sku.label" /></span>
			                          			
			                          		</div>
		                          		</div>
		                          		<c:set var="counts" value="${counts+1}" />	
                            		</c:if>
                            </c:forEach>
                            
                             	<c:set var="WarehouseStorageSystemsMaster" value="false"/>
                            <c:forEach var="accessControl" items="${sessionScope.warehouseMasterSettings}">
                            		<c:if test="${accessControl.appDocument == 'WarehouseStorageSystemsMaster' && accessControl.write == true && accessControl.read == false}"> 
                            			<c:set var="WarehouseStorageSystemsMaster" value="true"/>
                            			<div class="col-lg-2 form-group" style="text-align: right;">
		                          			<div style="text-align: center;width: 140px;height: 130px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="return newSku('newSku');" title="<spring:message code="storagesystemsmaster.label" />">
			                          			<img src="${pageContext.request.contextPath}/images/storagesystems.png" style="margin-top: 10px;"><br><br>
			                          		<span>&nbsp;&nbsp;<spring:message code="storagesystemsmaster.label" /></span>
			                          		</div>
		                          		</div>
		                          		<c:set var="counts" value="${counts+1}" />		
                            		</c:if>
	                            	<c:if test="${accessControl.appDocument == 'WarehouseStorageSystemsMaster' && WarehouseStorageSystemsMaster == false}"> 		
                            			<div class="col-lg-2 form-group" style="text-align: right;">
		                          			<div style="text-align: center;width: 140px;height: 130px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="return viewWarehouseStorageSystemsMaster('WarehouseStorageSystemsMaster','0','');" title="<spring:message code="storagesystemsmaster.label" />">
			                          			<img src="${pageContext.request.contextPath}/images/storagesystems.png" style="margin-top: 10px;"><br><br>
			                          			<span>&nbsp;&nbsp;<spring:message code="storagesystemsmaster.label" /></span>
			                          			
			                          		</div>
		                          		</div>
		                          		<c:set var="counts" value="${counts+1}" />	
                            		</c:if>
                            </c:forEach>
                             <c:if test="${counts == 5}">
	                          		<div class="col-lg-2 form-group" style="text-align: right;"></div>
	                          		</div>
	                          		<br><br>
	                          	<div class="row">
	                        </c:if>
                             	<c:set var="WarehouseFleetMaster" value="false"/>
                            <c:forEach var="accessControl" items="${sessionScope.warehouseMasterSettings}">
                            		<c:if test="${accessControl.appDocument == 'WarehouseFleetMaster' && accessControl.write == true && accessControl.read == false}"> 
                            			<c:set var="WarehouseFleetMaster" value="true"/>
                            			<div class="col-lg-2 form-group" style="text-align: right;">
		                          			<div style="text-align: center;width: 140px;height: 130px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="return newSku('newSku');" title="<spring:message code="fleetmaster.label" />">
			                          			<img src="${pageContext.request.contextPath}/images/fleetmanagment.png" style="margin-top: 10px;"><br><br>
			                          			<span>&nbsp;&nbsp;<spring:message code="fleetmaster.label" /></span>
			                          		</div>
		                          		</div>
		                          		<c:set var="counts" value="${counts+1}" />		
                            		</c:if>
	                            	<c:if test="${accessControl.appDocument == 'WarehouseFleetMaster' && WarehouseFleetMaster == false}"> 		
                            			<div class="col-lg-2 form-group" style="text-align: right;">
		                          			<div style="text-align: center;width: 140px;height: 130px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="return viewWarehouseFleetMaster('WarehouseFleetMaster','0','');" title="<spring:message code="fleetmaster.label" />">
			                          			<img src="${pageContext.request.contextPath}/images/fleetmanagment.png" style="margin-top: 10px;"><br><br>
			                          			<span>&nbsp;&nbsp;<spring:message code="fleetmaster.label" /></span>
			                          		</div>
		                          		</div>
		                          		<c:set var="counts" value="${counts+1}" />	
                            		</c:if>
                            </c:forEach>
                             <c:if test="${counts == 5}">
	                          		<div class="col-lg-2 form-group" style="text-align: right;"></div>
	                          		</div>
	                          		<br><br>
	                          	<div class="row">
	                        </c:if>
                             	<c:set var="WarehouseLogisticsPartners" value="false"/>
                            <c:forEach var="accessControl" items="${sessionScope.warehouseMasterSettings}">
                            		<c:if test="${accessControl.appDocument == 'WarehouseLogisticsPartners' && accessControl.write == true && accessControl.read == false}"> 
                            			<c:set var="WarehouseLogisticsPartners" value="true"/>
                            			<div class="col-lg-2 form-group" style="text-align: right;">
		                          			<div style="text-align: center;width: 140px;height: 130px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="return newSku('newSku');" title="<spring:message code="logisticspartner.label" />">
			                          			<img src="${pageContext.request.contextPath}/images/logistics.png" style="margin-top: 10px;"><br><br>
			                          			<span>&nbsp;&nbsp;<spring:message code="logisticspartner.label" /></span>
			                          		</div>
		                          		</div>
		                          		<c:set var="counts" value="${counts+1}" />		
                            		</c:if>
	                            	<c:if test="${accessControl.appDocument == 'WarehouseLogisticsPartners' && WarehouseLogisticsPartners == false}"> 		
                            			<div class="col-lg-2 form-group" style="text-align: right;">
		                          			<div style="text-align: center;width: 140px;height: 130px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="return viewWarehouseLogisticsPartners('WarehouseLogisticsPartners','0','');" title="<spring:message code="logisticspartner.label" />">
			                          			<img src="${pageContext.request.contextPath}/images/logistics.png" style="margin-top: 10px;"><br><br>
			                          			<span>&nbsp;&nbsp;<spring:message code="logisticspartner.label" /></span>
			                          		</div>
		                          		</div>
		                          		<c:set var="counts" value="${counts+1}" />	
                            		</c:if>
                            </c:forEach>
                             <c:if test="${counts == 5}">
	                          		<div class="col-lg-2 form-group" style="text-align: right;"></div>
	                          		</div>
	                          		<br><br>
	                          	<div class="row">
	                        </c:if>
                            	  <c:set var="WarehouseBOMMaster" value="false"/>
                              <c:forEach var="accessControl" items="${sessionScope.warehouseMasterSettings}">
                            		<c:if test="${accessControl.appDocument == 'WarehouseBomMaster' && accessControl.write == true && accessControl.read == false}"> 
                            			<c:set var="WarehouseBOMMaster" value="true"/>
                            			<div class="col-lg-2 form-group" style="text-align: right;">
		                          			<div style="text-align: center;width: 140px;height: 130px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="return newBOMMasters('newBOMMasters');" title="Bom Masters">
			                          			<img src="${pageContext.request.contextPath}/images/imagentavl.png" style="margin-top: -30px; padding: 34px 12px 0px 59px; margin-left: -33%;"><br><br>
			                          			<span>&nbsp;&nbsp;BOM Masters</span>
			                          		</div>
		                          		</div>
		                          		<c:set var="counts" value="${counts+1}" />		
                            		</c:if>
	                            	<c:if test="${accessControl.appDocument == 'WarehouseBomMaster' && WarehouseBOMMaster == false}"> 		
                            			<div class="col-lg-2 form-group" style="text-align: right;">
		                          			<div style="text-align: center;width: 140px;height: 130px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="return viewBomMasterWarehouse('BomMasterWH','0');" title="BOM Masters">
			                          			<img src="${pageContext.request.contextPath}/images/imagentavl.png" style="margin-top: -30px; padding: 34px 12px 0px 59px; margin-left: -33%;"><br><br>
			                          			<span>&nbsp;&nbsp;BOM Masters</span>
			                          		</div>
		                          		</div>
		                          		<c:set var="counts" value="${counts+1}" />	
                            		</c:if>
                            </c:forEach>
                            
                             <c:if test="${counts == 5}">
	                          		<div class="col-lg-2 form-group" style="text-align: right;"></div>
	                          		</div>
	                          		<br><br>
	                          	<div class="row">
	                        </c:if>
                             <c:forEach var="accessControl" items="${sessionScope.priceManagement}" varStatus="theCount">
                            		<c:if test="${theCount.count == 1}"> 
                            			<c:set var="Stockupdate" value="true"/> 
                            			<div class="col-lg-2 form-group" style="text-align: right;">
		                          			<div style="text-align: center;width: 140px;height: 130px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="showarehousemasterspricemgmtflows('warehouse')" title="Price Management">
			                          			<img src="${pageContext.request.contextPath}/images/imagentavl.png" style="margin-top: -30px; padding: 34px 12px 0px 59px; margin-left: -33%;"><br><br>
			                          			<span>Price Management</span>
			                          		</div>
		                          		</div>
		                          		<c:set var="counts" value="${counts+1}" />	
                            		</c:if>
                            </c:forEach>
                            
                              <c:set var="WarehouseStockUpdate" value="false"/>
                              <c:forEach var="accessControl" items="${sessionScope.warehouseMasterSettings}">
	                            	<c:if test="${accessControl.appDocument == 'WarehouseStockUpdate' && WarehouseStockUpdate == false}"> 		
                            			<div class="col-lg-2 form-group" style="text-align: right;">
                            			 <c:set var="WarehouseStockUpdate" value="true"/>
		                          			<div style="text-align: center;width: 140px;height: 130px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="return viewStockUpdateDetails('WarehouseStockUpdate','0','');" title="Stock Update">
			                          			<img src="${pageContext.request.contextPath}/images/imagentavl.png" style="margin-top: -30px; padding: 34px 12px 0px 59px; margin-left: -33%;"><br><br>
			                          			<span>&nbsp;&nbsp;Stock Update</span>
			                          		</div>
		                          		</div>
		                          		<c:set var="counts" value="${counts+1}" />	
                            		</c:if>
                            </c:forEach>
                          </div>
                         </c:if>
                         
                         
</body>
</html>