<!--/*
 * Project Name 	        : OmniRetailerCustomer
 * Written By		        : Sambaiah Y
 * file name		        : onventorymanager/warehouse/procurement/procurementflow.jsp
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
                          		<div style="text-align: center;width: 120px;height: 120px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="viewRequestForQuotation('rqstForQutation','0','menu');" title="<spring:message code="rqst.for.quotation.label" />">
                          			<img src="${pageContext.request.contextPath}/images/RequestForQuotation.png" style="margin-top: 10px;"><br>
                          			<span><spring:message code="rqst.for.quotation.label" /></span>
                          		</div>
                          	</div>
                          	<div class="col-lg-2">
			                          		<div style="text-align: center;width: 120px;height: 120px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="viewqutation('all','Qutation','0','menu');" title="<spring:message code="qutation.label" />">
			                          			<img src="${pageContext.request.contextPath}/images/qutation.png" style="margin-top: 10px;"><br>
			                          			<span><spring:message code="qutation.label" /></span>
			                          		</div>
			                          	</div>
                          	<div class="col-lg-2">
                          		<div style="text-align: center;width: 120px;height: 120px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="viewPurchaseOrder('all','outletPurchaseOrder','0','menu');" title="<spring:message code="purchase.order.label" />">
                          			<img src="${pageContext.request.contextPath}/images/PO.gif" style="margin-top: 10px;"><br><br>
                          			<span><spring:message code="purchase.order.label" /></span>
                          		</div>
                          	</div>
                          	<div class="col-lg-2">
                          		<div style="text-align: center;width: 120px;height: 120px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="viewShipmentNotes('shipmentNotes','0','menu','procurement');" title="<spring:message code="shipment.notes.label" />">
                          			<img src="${pageContext.request.contextPath}/images/ShipmentNote.png" style="margin-top: 10px;"><br><br>
                          			<%-- <span><spring:message code="warehouse.label" /></span><br> --%>
                          			<span><spring:message code="shipment.notes.label" /></span>
                          		</div>
                          	</div>
                          	<div class="col-lg-2">
                          		<div style="text-align: center;width: 120px;height: 120px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="viewShipmentReceipts('all','outletgoodsReceipts','0','procurement','menu');" title="<spring:message code="goods.receipts.label" />">
                          			<img src="${pageContext.request.contextPath}/images/ShipmentReceipt.png" style="margin-top: 10px;"><br><br>
                          			<span><spring:message code="goods.receipts.label" /></span>
                          		</div>
                          	</div>
                          	
                          	<div class="col-lg-2"></div>
                          	</div>
                          	<br>
                          	 <div class="row">
                          	 <div class="col-lg-2">
                          		<div style="text-align: center;width: 120px;height: 120px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="viewShipmentReturn('shipmentReturn','0','menu','procurement');" title="<spring:message code="shipment.return.label" />">
                          			<img src="${pageContext.request.contextPath}/images/ShipmentReturn.png" style="margin-top: 10px;"><br><br>
                          			<span><spring:message code="shipment.return.label" /></span>
                          		</div>
                          	</div>
                          	<div class="col-lg-2" style="text-align: right;">
                          		<div style="text-align: center;width: 120px;height: 120px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="viewShipmentInspection('shipmentInspection');" title="<spring:message code="shipment.inspection.label" />">
                          			<img src="${pageContext.request.contextPath}/images/ShipmentInspection.png" style="margin-top: 10px;"><br>
                          			<%-- <span><spring:message code="warehouse.label" /></span><br> --%>
                          			<span><spring:message code="shipment.inspection.label" /></span>
                          		</div>
                          	</div>
                          	<div class="col-lg-2" style="text-align: right;">
                          		<div style="text-align: center;width: 120px;height: 120px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="viewHomePageDeals('invoicing');" title="<spring:message code="invoicing.label" />">
                          			<img src="${pageContext.request.contextPath}/images/Invoicing.gif" style="margin-top: 10px;"><br><br>
                          			<%-- <span><spring:message code="warehouse.label" /></span><br> --%>
                          			<span><spring:message code="invoicing.label" /></span>
                          		</div>
                          	</div>
                          		<div class="col-lg-2" style="text-align: right;">
                          		<div style="text-align: center;width: 120px;height: 120px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="viewHomePageDeals('payments');" title="<spring:message code="payments.label" />">
                          			<img src="${pageContext.request.contextPath}/images/Payments1.gif" style="margin-top: 10px;"><br><br>
                          			<%-- <span><spring:message code="warehouse.label" /></span><br> --%>
                          			<span><spring:message code="payments.label" /></span>
                          		</div>
                          	</div>
                          	</div>
                          </c:if>
                          <c:set var="noOfCols" value="0"/>
                        <c:if test="${sessionScope.role != 'super admin'}">
                        <div class="row">
		                    <c:set var="rqstForQutation" value="false"/>
                 			<c:forEach var="accessControl" items="${sessionScope.procurement}">
              						<c:if test="${accessControl.appDocument == 'RequestForQuotation' && accessControl.write == true && accessControl.read == false}">
             							<c:set var="rqstForQutation" value="true"/> 
               							 <c:set var="noOfCols" value="${noOfCols + 1}" />
			                          	<div class="col-lg-2">
			                          		<div style="text-align: center;width: 120px;height: 120px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="newRFQ('rqstForQutation');" title="<spring:message code="rqst.for.quotation.label" />">
			                          			<img src="${pageContext.request.contextPath}/images/RequestForQuotation.png" style="margin-top: 10px;"><br>
			                          			<span><spring:message code="rqst.for.quotation.label" /></span>
			                          		</div>
			                          	</div>
                					</c:if>
                         			<c:if test="${accessControl.appDocument == 'RequestForQuotation' && rqstForQutation == false}"> 
                         			 <c:set var="noOfCols" value="${noOfCols + 1}" />
                         				<div class="col-lg-2">
			                          		<div style="text-align: center;width: 120px;height: 120px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="viewRequestForQuotation('rqstForQutation','0');" title="<spring:message code="rqst.for.quotation.label" />">
			                          			<img src="${pageContext.request.contextPath}/images/RequestForQuotation.png" style="margin-top: 10px;"><br>
			                          			<span><spring:message code="rqst.for.quotation.label" /></span>
			                          		</div>
			                          	</div>
                					</c:if>
                   			</c:forEach>
                   			
                   			<c:set var="qutation" value="false"/>
                 			<c:forEach var="accessControl" items="${sessionScope.procurement}">
              						<c:if test="${accessControl.appDocument == 'Quotation' && accessControl.write == true && accessControl.read == false}">
             							<c:set var="qutation" value="true"/> 
               							 <c:set var="noOfCols" value="${noOfCols + 1}" />
			                          	<div class="col-lg-2">
			                          		<div style="text-align: center;width: 120px;height: 120px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="newRFQ('rqstForQutation');" title="<spring:message code="quotation.label" />">
			                          			<img src="${pageContext.request.contextPath}/images/qutation.png" style="margin-top: 10px;"><br>
			                          			<span><spring:message code="quotation.label" /></span>
			                          		</div>
			                          	</div>
                					</c:if>
                         			<c:if test="${accessControl.appDocument == 'Quotation' && qutation == false}"> 
                         			 <c:set var="noOfCols" value="${noOfCols + 1}" />
                         				<div class="col-lg-2">
			                          		<div style="text-align: center;width: 120px;height: 120px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="viewqutation('all','Qutation','0','menu');" title="<spring:message code="quotation.label" />">
			                          			<img src="${pageContext.request.contextPath}/images/qutation.png" style="margin-top: 10px;"><br>
			                          			<span><spring:message code="qutation.label" /></span>
			                          		</div>
			                          	</div>
                					</c:if>
                   			</c:forEach>
                          <c:set var="purchaseOrder" value="false"/>
	 					<c:forEach var="accessControl" items="${sessionScope.procurement}">
	 						<c:if test="${accessControl.appDocument == 'PurchaseOrder' && accessControl.write == true && accessControl.read == false}">
	 							<c:set var="noOfCols" value="${noOfCols + 1}" />
	 							<c:set var="purchaseOrder" value="true"/> 
	   							<div class="col-lg-2">
	                          		<div style="text-align: center;width: 120px;height: 120px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="return vewNewPurchaseOrder('newOutletPurchaseOrder');" title="<spring:message code="purchase.order.label" />">
	                          			<img src="${pageContext.request.contextPath}/images/PO.gif" style="margin-top: 10px;"><br><br>
	                          			<span><spring:message code="purchase.order.label" /></span>
	                          		</div>
	                          	</div>
	   						</c:if>
	            			<c:if test="${accessControl.appDocument == 'PurchaseOrder' && purchaseOrder == false}"> 
	            				<c:set var="noOfCols" value="${noOfCols + 1}" />
								<div class="col-lg-2">
                          		<div style="text-align: center;width: 120px;height: 120px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="viewPurchaseOrder('all','outletPurchaseOrder','0','menu');" title="<spring:message code="purchase.order.label" />">
                          			<img src="${pageContext.request.contextPath}/images/PO.gif" style="margin-top: 10px;"><br><br>
                          			<span><spring:message code="purchase.order.label" /></span>
                          		</div>
                          	</div>
	   						</c:if>
	   					</c:forEach>
	   					<c:set var="shipmentNotes" value="false"/>
           				<c:forEach var="accessControl" items="${sessionScope.procurement}">
                    			<c:if test="${accessControl.appDocument == 'ShipmentNotes' && accessControl.write == true && accessControl.read == false}">
                    				<c:set var="shipmentNotes" value="true"/>  
                    				 <c:set var="noOfCols" value="${noOfCols + 1}" />	
                    				 <div class="col-lg-2">
		                          		<div style="text-align: center;width: 120px;height: 120px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="newShipmentNote('shipmentNotes','procurement');" title="<spring:message code="shipment.notes.label" />">
		                          			<img src="${pageContext.request.contextPath}/images/ShipmentNote.png" style="margin-top: 10px;"><br><br>
		                          			<span><spring:message code="shipment.notes.label" /></span>
		                          		</div>
		                          	</div>	
           						</c:if>
           						<c:if test="${accessControl.appDocument == 'ShipmentNotes' && shipmentNotes == false}">
           						 	<c:set var="noOfCols" value="${noOfCols + 1}" />		
           							<div class="col-lg-2">
		                          		<div style="text-align: center;width: 120px;height: 120px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="viewShipmentNotes('shipmentNotes','0','menu','procurement');" title="<spring:message code="shipment.notes.label" />">
		                          			<img src="${pageContext.request.contextPath}/images/ShipmentNote.png" style="margin-top: 10px;"><br><br>
		                          			<span><spring:message code="shipment.notes.label" /></span>
		                          		</div>
		                          	</div>
           						</c:if>
           				</c:forEach>
	   					<c:set var="shipmentReceipts" value="false"/>
           				<c:forEach var="accessControl" items="${sessionScope.procurement}">
           						<c:if test="${accessControl.appDocument == 'ShipmentReceipts' && accessControl.write == true && accessControl.read == false}">
           							<c:set var="shipmentReceipts" value="true"/> 
           							<c:set var="noOfCols" value="${noOfCols + 1}" />
           							<div class="col-lg-2">
		                          		<div style="text-align: center;width: 120px;height: 120px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="return viewNewShipmentReceipt('newOutletProcurementReceipts','procurement');" title="<spring:message code="goods.receipts.label" />">
		                          			<img src="${pageContext.request.contextPath}/images/ShipmentReceipt.png" style="margin-top: 10px;"><br><br>
		                          			<span><spring:message code="goods.receipts.label" /></span>
		                          		</div>
		                          	</div>
           						</c:if>
                    			<c:if test="${accessControl.appDocument == 'ShipmentReceipts' && shipmentReceipts == false}">
                    			<c:set var="noOfCols" value="${noOfCols + 1}" />
           							<div class="col-lg-2">
		                          		<div style="text-align: center;width: 120px;height: 120px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="viewShipmentReceipts('all','outletgoodsReceipts','0','procurement','menu');" title="<spring:message code="goods.receipts.label" />">
		                          			<img src="${pageContext.request.contextPath}/images/ShipmentReceipt.png" style="margin-top: 10px;"><br><br>
		                          			<span><spring:message code="goods.receipts.label" /></span>
		                          		</div>
		                          	</div>
           						</c:if>
           				</c:forEach>
           				<c:set var="shipmentReturn" value="false"/>
           				<c:forEach var="accessControl" items="${sessionScope.procurement}">
           						<c:if test="${accessControl.appDocument == 'ShipmentReturn' && accessControl.write == true && accessControl.read == false}">
           							<c:set var="shipmentReturn" value="true"/> 
           							<c:set var="noOfCols" value="${noOfCols + 1}" />  
           							<div class="col-lg-2" style="text-align: right;">
		                          		<div style="text-align: center;width: 120px;height: 120px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="newShipmentReturn('shipmentReturn','procurement');" title="<spring:message code="shipment.return.label" />">
		                          			<img src="${pageContext.request.contextPath}/images/ShipmentReturn.png" style="margin-top: 10px;"><br>
		                          			<span><spring:message code="shipment.return.label" /></span>
		                          		</div>
		                          	</div>
           						</c:if>
                    			<c:if test="${accessControl.appDocument == 'ShipmentReturn' && shipmentReturn == false}">
                    				<c:set var="noOfCols" value="${noOfCols + 1}" />  
                    				<div class="col-lg-2" style="text-align: right;">
		                          		<div style="text-align: center;width: 120px;height: 120px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="viewShipmentReturn('shipmentReturn','0','menu','procurement');" title="<spring:message code="shipment.return.label" />">
		                          			<img src="${pageContext.request.contextPath}/images/ShipmentReturn.png" style="margin-top: 10px;"><br>
		                          			<span><spring:message code="shipment.return.label" /></span>
		                          		</div>
		                          	</div>
           						</c:if>
           				</c:forEach>
           				 <c:if test="${noOfCols == 5}">
                          	<div class="col-lg-2" style="text-align: left;"></div>
                          </div>
                          <br>
                          <br>
                        <div class="row">
                        </c:if>
	   					<c:forEach var="accessControl" items="${sessionScope.procurement}">
                			<c:if test="${accessControl.appDocument == 'ShipmentInspection'}"> 
          						<c:set var="noOfCols" value="${noOfCols + 1}" />   	
	                          	<div class="col-lg-2" style="text-align: right;">
	                          		<div style="text-align: center;width: 120px;height: 120px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="viewShipmentInspection('shipmentInspection');" title="<spring:message code="shipment.inspection.label" />">
	                          			<img src="${pageContext.request.contextPath}/images/ShipmentInspection.png" style="margin-top: 10px;"><br>
	                          			<span><spring:message code="shipment.inspection.label" /></span>
	                          		</div>
	                          	</div>
       						</c:if>
       					</c:forEach>
                         <c:if test="${noOfCols == 5}">
                          	<div class="col-lg-2" style="text-align: left;"></div>
                          </div>
                          <br>
                          <br>
                        <div class="row">
                        </c:if>
                        
                        <c:forEach var="accessControl" items="${sessionScope.procurement}">
                			<c:if test="${accessControl.appDocument == 'Invoicing'}"> 
                			<c:set var="noOfCols" value="${noOfCols + 1}" />
                          	<div class="col-lg-2" style="text-align: right;">
                          		<div style="text-align: center;width: 120px;height: 120px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="viewHomePageDeals('invoicing');" title="<spring:message code="invoicing.label" />">
                          			<img src="${pageContext.request.contextPath}/images/Invoicing.gif" style="margin-top: 10px;"><br><br>
                          			<span><spring:message code="invoicing.label" /></span>
                          		</div>
                          	</div>
       						</c:if>
           				</c:forEach>
           				
                        <c:forEach var="accessControl" items="${sessionScope.procurement}">
                			<c:if test="${accessControl.appDocument == 'Payments'}"> 
                			<div class="col-lg-2" style="text-align: right;">
                          		<div style="text-align: center;width: 120px;height: 120px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="viewHomePageDeals('payments');" title="<spring:message code="payments.label" />">
                          			<img src="${pageContext.request.contextPath}/images/Payments1.gif" style="margin-top: 10px;"><br><br>
                          			<span><spring:message code="payments.label" /></span>
                          		</div>
                          	</div>
       						</c:if>
       					</c:forEach> 
       					
       					
       					<c:set var="autoIndent" value="false"/>
                  		<c:forEach var="accessControl" items="${sessionScope.procurement}">
	                     <c:if test="${accessControl.appDocument == 'AutoIndent' && autoIndent == false}"> 
                    		<div class="col-lg-2" style="text-align: right;">
                          		<div style="text-align: center;width: 120px;height: 120px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="viewAutoPurchaseOrder('all','outletGeneratePurchaseOrder','0','menu');" title="<spring:message code="generate.purchase.order.label" />">
                          			<img src="${pageContext.request.contextPath}/images/imagentavl.png" style="margin-top: -30px; padding: 34px 12px 0px 59px; margin-left: -33%;"><br><br>
	               		<span><spring:message code="generate.purchase.order.label" /></span>
                          		</div>
                          	</div>
                    	</c:if>
                      </c:forEach>
       					
       					 
       					
       					
                         </div>   
                       </c:if>
</body>
</html>