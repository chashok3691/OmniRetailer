<!--/*
 * Project Name 	        : OmniRetailerCustomer
 * Written By		        : Sambaiah Y
 * file name		        : onventorymanager/warehouse/warehouseProcurement/warehouseProcurementflow.jsp
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
                          	<div class="col-lg-2">
                          		<div style="text-align: center;width: 120px;height: 120px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="viewShipmentNotes('wshipmentNote','0','menu','warehouse');" title="<spring:message code="shipment.notes.label" />">
                          			<img src="${pageContext.request.contextPath}/images/ShipmentNote.png" style="margin-top: 10px;"><br><br>
                          			<%-- <span><spring:message code="warehouse.label" /></span><br> --%>
                          			<span><spring:message code="shipment.notes.label" /></span>
                          		</div>
                          	</div>
                          	<div class="col-lg-2" style="text-align: right;">
                          		<div style="text-align: center;width: 120px;height: 120px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="viewShipmentInspection('wshipmentInspection');" title="<spring:message code="shipment.inspection.label" />">
                          			<img src="${pageContext.request.contextPath}/images/ShipmentInspection.png" style="margin-top: 10px;"><br>
                          			<%-- <span><spring:message code="warehouse.label" /></span><br> --%>
                          			<span><spring:message code="shipment.inspection.label" /></span>
                          		</div>
                          	</div>
                          	<div class="col-lg-2">
                          		<div style="text-align: center;width: 120px;height: 120px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="viewShipmentReceipts('all','warehouseStockReciept','0','warehouse','menu');" title="<spring:message code="goods.receipts.label" />">
                          			<img src="${pageContext.request.contextPath}/images/ShipmentReceipt.png" style="margin-top: 10px;"><br><br>
                          			<span><spring:message code="goods.receipts.label" /></span>
                          		</div>
                          	</div>
                          	<div class="col-lg-2" style="text-align: right;">
                          		<div style="text-align: center;width: 120px;height: 120px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="viewShipmentRejection('wshipmentRejection');" title="<spring:message code="warehouse.shipmentrejection.label" />">
                          			<img src="${pageContext.request.contextPath}/images/ShipmentRejection.png" style="margin-top: 10px;"><br><br>
                          			<span><spring:message code="warehouse.shipmentrejection.label" /></span>
                          		</div>
                          	</div>
                          	<div class="col-lg-2">
                          		<div style="text-align: center;width: 120px;height: 120px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="viewShipmentReturn('wShipmentReturn','0','menu','warehouse');" title="<spring:message code="shipment.return.label" />">
                          			<img src="${pageContext.request.contextPath}/images/ShipmentReturn.png" style="margin-top: 10px;"><br><br>
                          			<span><spring:message code="shipment.return.label" /></span>
                          		</div>
                          	</div>
                          	<div class="col-lg-2">
		                          		<div style="text-align: center;width: 120px;height: 120px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="viewShipmentInvoice('wShipmentInvoice','0','warehouse');" title="Invoice">
		                          			<img src="${pageContext.request.contextPath}/images/imagentavl.png" style="margin-top: 10px;"><br><br>
		                          			<span>Invoice</span>
		                          		</div>
		                          	</div>
                          </div>
                          </c:if>
                          <c:set var="noOfCols" value="0"/>
                        <c:if test="${sessionScope.role != 'super admin'}">
                        <div class="row">
		                     <c:set var="warehouseShipmentNote" value="false"/>
		                  <c:forEach var="accessControl" items="${sessionScope.warehouseStockmanagement}">
		                   		<c:if test="${accessControl.appSubDocument == 'WarehouseShipmentNotes' && accessControl.write == true && accessControl.read == false}">
                          			 <c:set var="warehouseShipmentNote" value="true"/>
               							 <c:set var="noOfCols" value="${noOfCols + 1}" />
			                          	<div class="col-lg-2">
			                          		<div style="text-align: center;width: 120px;height: 120px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="newShipmentNote('wshipmentNote','warehouse');" title="<spring:message code="shipment.notes.label" />">
			                          			<img src="${pageContext.request.contextPath}/images/ShipmentNote.png" style="margin-top: 10px;"><br><br>
			                          			<%-- <span><spring:message code="warehouse.label" /></span><br> --%>
			                          			<span><spring:message code="shipment.notes.label" /></span>
			                          		</div>
			                          	</div>
                					</c:if>
                         			<c:if test="${accessControl.appSubDocument == 'WarehouseShipmentNotes' && warehouseShipmentNote == false}"> 
                         			 <c:set var="noOfCols" value="${noOfCols + 1}" />
                         				<div class="col-lg-2">
			                          		<div style="text-align: center;width: 120px;height: 120px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="viewShipmentNotes('wshipmentNote','0','menu','warehouse');" title="<spring:message code="shipment.notes.label" />">
			                          			<img src="${pageContext.request.contextPath}/images/ShipmentNote.png" style="margin-top: 10px;"><br><br>
			                          			<%-- <span><spring:message code="warehouse.label" /></span><br> --%>
			                          			<span><spring:message code="shipment.notes.label" /></span>
			                          		</div>
			                          	</div>
                					</c:if>
                   			</c:forEach>
                          <c:set var="wshipmentInspection" value="false"/>
		                 <c:forEach var="accessControl" items="${sessionScope.warehouseStockmanagement}">
		                   	<c:if test="${accessControl.appSubDocument == 'WarehouseInspectionReceipt' && accessControl.write == true && accessControl.read == false}">
                          		<c:set var="wshipmentInspection" value="true"/>
	 							<c:set var="noOfCols" value="${noOfCols + 1}" />
	   							<div class="col-lg-2" style="text-align: right;">
	                          		<div style="text-align: center;width: 120px;height: 120px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="viewShipmentInspection('wshipmentInspection');" title="<spring:message code="shipment.inspection.label" />">
	                          			<img src="${pageContext.request.contextPath}/images/ShipmentInspection.png" style="margin-top: 10px;"><br>
	                          			<%-- <span><spring:message code="warehouse.label" /></span><br> --%>
	                          			<span><spring:message code="shipment.inspection.label" /></span>
	                          		</div>
	                          	</div>
	   						</c:if>
	            			<c:if test="${accessControl.appSubDocument == 'WarehouseInspectionReceipt' && wshipmentInspection == false}">
	            				<c:set var="noOfCols" value="${noOfCols + 1}" />
								<div class="col-lg-2" style="text-align: right;">
	                          		<div style="text-align: center;width: 120px;height: 120px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="viewShipmentInspection('wshipmentInspection');" title="<spring:message code="shipment.inspection.label" />">
	                          			<img src="${pageContext.request.contextPath}/images/ShipmentInspection.png" style="margin-top: 10px;"><br>
	                          			<%-- <span><spring:message code="warehouse.label" /></span><br> --%>
	                          			<span><spring:message code="shipment.inspection.label" /></span>
	                          		</div>
	                          	</div>
	   						</c:if>
	   					</c:forEach>
	   					<c:set var="warehouseStockReciept" value="false"/>
		                  <c:forEach var="accessControl" items="${sessionScope.warehouseStockmanagement}">
		                   		<c:if test="${accessControl.appSubDocument == 'WarehouseGRN' && accessControl.write == true && accessControl.read == false}">
                          			 <c:set var="warehouseStockReciept" value="true"/>
                    				 <c:set var="noOfCols" value="${noOfCols + 1}" />	
                    				 <div class="col-lg-2">
		                          		<div style="text-align: center;width: 120px;height: 120px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="viewNewShipmentReceipt('warehouseStockReciept','warehouse');" title="<spring:message code="goods.receipts.label" />">
		                          			<img src="${pageContext.request.contextPath}/images/ShipmentReceipt.png" style="margin-top: 10px;"><br><br>
		                          			<span><spring:message code="goods.receipts.label" /></span>
		                          		</div>
		                          	</div>
           						</c:if>
           						<c:if test="${accessControl.appSubDocument == 'WarehouseGRN' && warehouseStockReciept == false}">
           						 	<c:set var="noOfCols" value="${noOfCols + 1}" />		
           							<div class="col-lg-2">
		                          		<div style="text-align: center;width: 120px;height: 120px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="viewShipmentReceipts('all','warehouseStockReciept','0','warehouse','menu');" title="<spring:message code="goods.receipts.label" />">
		                          			<img src="${pageContext.request.contextPath}/images/ShipmentReceipt.png" style="margin-top: 10px;"><br><br>
		                          			<span><spring:message code="goods.receipts.label" /></span>
		                          		</div>
		                          	</div>
           						</c:if>
           				</c:forEach>
	   					<c:set var="wshipmentRejection" value="false"/>
		                 <c:forEach var="accessControl" items="${sessionScope.warehouseStockmanagement}">
		                   		<c:if test="${accessControl.appSubDocument == 'WarehouseShipmentRejection' && accessControl.write == true && accessControl.read == false}">
		                   		 <c:set var="wshipmentRejection" value="true"/>
           							<c:set var="noOfCols" value="${noOfCols + 1}" />
           							<div class="col-lg-2" style="text-align: right;">
		                          		<div style="text-align: center;width: 120px;height: 120px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="viewShipmentRejection('wshipmentRejection');" title="<spring:message code="warehouse.shipmentrejection.label" />">
		                          			<img src="${pageContext.request.contextPath}/images/ShipmentRejection.png" style="margin-top: 10px;"><br><br>
		                          			<span><spring:message code="warehouse.shipmentrejection.label" /></span>
		                          		</div>
		                          	</div>
           						</c:if>
                    			<c:if test="${accessControl.appSubDocument == 'WarehouseShipmentRejection' && wshipmentRejection == false}">
                    			<c:set var="noOfCols" value="${noOfCols + 1}" />
           							<div class="col-lg-2" style="text-align: right;">
		                          		<div style="text-align: center;width: 120px;height: 120px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="viewShipmentRejection('wshipmentRejection');" title="<spring:message code="warehouse.shipmentrejection.label" />">
		                          			<img src="${pageContext.request.contextPath}/images/ShipmentRejection.png" style="margin-top: 10px;"><br><br>
		                          			<span><spring:message code="warehouse.shipmentrejection.label" /></span>
		                          		</div>
		                          	</div>
           						</c:if>
           				</c:forEach>
           				 <c:set var="wStockReturn" value="false"/>
		                  <c:forEach var="accessControl" items="${sessionScope.warehouseStockmanagement}">
		                   		<c:if test="${accessControl.appSubDocument == 'WarehouseShipmentReturn' && accessControl.write == true && accessControl.read == false}">
                          			 <c:set var="wStockReturn" value="true"/>
           							<c:set var="noOfCols" value="${noOfCols + 1}" />  
           							<div class="col-lg-2">
		                          		<div style="text-align: center;width: 120px;height: 120px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="newShipmentReturn('wShipmentReturn','warehouse');" title="<spring:message code="shipment.return.label" />">
		                          			<img src="${pageContext.request.contextPath}/images/ShipmentReturn.png" style="margin-top: 10px;"><br><br>
		                          			<span><spring:message code="shipment.return.label" /></span>
		                          		</div>
		                          	</div>
           						</c:if>
                    			<c:if test="${accessControl.appSubDocument == 'WarehouseShipmentReturn' && wStockReturn == false}">
                    				<c:set var="noOfCols" value="${noOfCols + 1}" />  
                    				<div class="col-lg-2">
		                          		<div style="text-align: center;width: 120px;height: 120px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="viewShipmentReturn('wShipmentReturn','0','menu','warehouse');" title="<spring:message code="shipment.return.label" />">
		                          			<img src="${pageContext.request.contextPath}/images/ShipmentReturn.png" style="margin-top: 10px;"><br><br>
		                          			<span><spring:message code="shipment.return.label" /></span>
		                          		</div>
		                          	</div>
           						</c:if>
           				</c:forEach>
                         </div>   
                         <br><br>
                         <div class="row">
                         <c:set var="wStockIssue" value="false"/>
           				 <c:forEach var="accessControl" items="${sessionScope.warehouseStockmanagement}">
		                   		<c:if test="${accessControl.appSubDocument == 'WarehouseShipmentInvoice' && accessControl.write == true && accessControl.read == false}">
                          			 <c:set var="wStockIssue" value="true"/>
           							<c:set var="noOfCols" value="${noOfCols + 1}" />  
           							<div class="col-lg-2">
		                          		<div style="text-align: center;width: 120px;height: 120px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="viewShipmentInvoice('wShipmentInvoice','0','warehouse');" title="Invoice">
		                          			<img src="${pageContext.request.contextPath}/images/imagentavl.png" style="margin-top: 10px;"><br><br>
		                          			<span>Invoice</span>
		                          		</div>
		                          	</div>
           						</c:if>
                    			<c:if test="${accessControl.appSubDocument == 'WarehouseShipmentInvoice' && wStockReturn == false}">
                    				<c:set var="noOfCols" value="${noOfCols + 1}" />  
                    				<div class="col-lg-2">
		                          		<div style="text-align: center;width: 120px;height: 120px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="viewShipmentInvoice('wShipmentInvoice','0','warehouse');" title="Invoice">
		                          			<img src="${pageContext.request.contextPath}/images/imagentavl.png" style="margin-top: -30px; padding: 34px 12px 0px 59px; margin-left: -33%;"><br><br>
		                          			<span>Invoice</span>
		                          		</div>
		                          	</div>
           						</c:if>
           				</c:forEach>
                         
                         
                         </div>
                       </c:if>
</body>
</html>