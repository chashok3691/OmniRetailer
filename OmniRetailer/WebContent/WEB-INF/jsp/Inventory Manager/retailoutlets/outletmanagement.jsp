<!--/*
 * Project Name 	        : OmniRetailerCustomer
 * Written By		        : Mythri.S
 * file name		        : onventorymanager/retailoutlets/outletmanagement.jsp
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

<div class="row">
<div class="col-lg-6">
                       <br>
                          <c:if test="${sessionScope.role == 'super admin'}">
                           <div class="row">
                          	<div class="col-lg-4 form-group" style="text-align: right;">
                          		<div style="text-align: center;width: 140px;height: 130px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="viewConfigurations('outletConfigurations','0')" title="<spring:message code="outlet_configuration.label" />">
                          			<img src="${pageContext.request.contextPath}/images/Outlet.gif" style="margin-top: 10px;"><br>
                          			<span><spring:message code="outlet.label" /></span><br>
                          			<span><spring:message code="outlet_configuration.label" /></span>
                          		</div>
                       		</div>
                       		<div class="col-lg-4 form-group" style="text-align: right;">
                          		<div style="text-align: center;width: 140px;height: 130px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="viewCounterMaster('counterMaster','0');" title="<spring:message code="counter_master.label" />">
                          			<img src="${pageContext.request.contextPath}/images/BillingCounter.png" style="margin-top: 10px;"><br>
                          			<span><spring:message code="counter_master.label" /></span><br>
                          		</div>
                       		</div>
                       		<div class="col-lg-4 form-group" style="text-align: right;">
                          		<div style="text-align: center;width: 140px;height: 130px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="viewStoreTaxation('taxation','0','');" title="<spring:message code="taxation.label" />">
                          			<img src="${pageContext.request.contextPath}/images/StoreTaxation.png" style="margin-top: 10px;"><br>
                          			<span><spring:message code="taxation.label" /></span><br>
                          		</div>
                       		</div>
                       		<div class="col-lg-4 form-group" style="text-align: right;">
                          		<div style="text-align: center;width: 140px;height: 130px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="viewDepartmentMaster('departmentMaster','0');" title="<spring:message code="department.master.label" />">
                          			<img src="${pageContext.request.contextPath}/images/Departments.png" style="margin-top: 10px;"><br>
                          			<span><spring:message code="department.master.label" /></span><br>
                          		</div>
                       		</div>
                       		<div class="col-lg-4 form-group" style="text-align: right;">
                          		<div style="text-align: center;width: 140px;height: 130px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="showShiftManagementFlows();" title="<spring:message code="shift.management.label" />">
                          			<img src="${pageContext.request.contextPath}/images/ShiftManagement.png" style="margin-top: 10px;"><br>
                          			<span><spring:message code="shift.management.label" /></span><br>
                          		</div>
                       		</div>
                       		
                       
                       	
                       		<div class="col-lg-4 form-group">
                          		<div style="text-align: center;width: 140px;height: 130px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="showBillsFlows();" title="<spring:message code="outlet_billingandpayment.label" />">
                          			<img src="${pageContext.request.contextPath}/images/Payments.gif" style="margin-top: 10px;"><br>
                          			<span><spring:message code="outlet.label" /></span><br>
                          			<span><spring:message code="outlet_billingandpayment.label" /></span>
                          		</div>
                          	</div>
                          	<div class="col-lg-4 form-group" style="text-align: left;">
                          		<div style="text-align: center;width: 140px;height: 130px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="showOutletOrdersFlows()" title="<spring:message code="outlet_customerorders.label" />">
                          			<img src="${pageContext.request.contextPath}/images/CustomerOrder.gif" style="margin-top: 10px;"><br>
                          			<span><spring:message code="outlet.label" /></span><br>
                          			<span><spring:message code="outlet_customerorders.label" /></span>
                          		</div>
                          	</div>
                       		<div class="col-lg-4 form-group" style="text-align: right;">
                          		<div style="text-align: center;width: 140px;height: 130px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="showShipmentsFlows()" title="<spring:message code="outlet_shipments.label" />">
                          			<img src="${pageContext.request.contextPath}/images/Delivery.gif" style="margin-top: 10px;"><br>
                          			<span><spring:message code="outlet.label" /></span><br>
                          			<span><spring:message code="outlet_shipments.label" /></span>
                          		</div>
                          	</div>
                          	<div class="col-lg-4 form-group" style="text-align: right;">
                          		<div style="text-align: center;width: 140px;height: 130px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="showInventoryManagementFlows();" title="<spring:message code="outlet_stockverification.label" />">
                          			<img src="${pageContext.request.contextPath}/images/Verification.gif" style="margin-top: 10px;"><br>
                          			<span><spring:message code="outlet.label" /></span><br>
                          			<span><spring:message code="outlet_inventoryManagement.label" /></span>
                          		</div>
                          	</div>
                          	<div class="col-lg-4 form-group">
                         		<div style="text-align: center;width: 140px;height: 130px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="showOutletHealthFlows()" title="<spring:message code="outlet.health.label" />">
                         			<img src="${pageContext.request.contextPath}/images/OutletHealth.png" style="margin-top: 10px;"><br>
                         			<span><spring:message code="outlet.health.label" /></span><br>
                         		</div>
                         	</div>
                         
                         	<div class="col-lg-4 form-group">
                         		<div style="text-align: center;width: 140px;height: 130px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="viewOutletNotifications('outletNotifications','0')" title="<spring:message code="notifications.label" />">
                         			<img src="${pageContext.request.contextPath}/images/OutletNotifications.png" style="margin-top: 10px;"><br>
                         			<span><spring:message code="notifications.label" /></span><br>
                         		</div>
                         	</div>
                         	</div>
                          </c:if>
                       <c:if test="${sessionScope.role != 'super admin'}">
                        <div class="row">
                          <c:set var="noOfCols" value="0"/>
                           <c:set var="outletConfig" value="false"/>
                            <c:forEach var="accessControl" items="${sessionScope.outletManagement}">
                            		<c:if test="${accessControl.appDocument == 'Configuration' && accessControl.write == true && accessControl.read == false}"> 
                            			<c:set var="noOfCols" value="${noOfCols + 1}" />
                            			<c:set var="outletConfig" value="true"/>
                          				<div class="col-lg-4 form-group" style="text-align: right;">
			                          		<div style="text-align: center;width: 140px;height: 130px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="return newOutlet('newOutlet');" title="<spring:message code="outlet_configuration.label" />">
			                          			<img src="${pageContext.request.contextPath}/images/Outlet.gif" style="margin-top: 10px;"><br>
			                          			<span><spring:message code="outlet.label" /></span><br>
			                          			<span><spring:message code="outlet_configuration.label" /></span>
			                          		</div>
                          				</div>
                          			</c:if>
	                            	<c:if test="${accessControl.appDocument == 'Configuration' && outletConfig == false}"> 
	                            	<c:set var="noOfCols" value="${noOfCols + 1}" />
                          				<div class="col-lg-4 form-group" style="text-align: right;">
			                          		<div style="text-align: center;width: 140px;height: 130px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="viewConfigurations('outletConfigurations','0')" title="<spring:message code="outlet_configuration.label" />">
			                          			<img src="${pageContext.request.contextPath}/images/Outlet.gif" style="margin-top: 10px;"><br>
			                          			<span><spring:message code="outlet.label" /></span><br>
			                          			<span><spring:message code="outlet_configuration.label" /></span>
			                          		</div>
                          				</div>
                          			</c:if>
                          	</c:forEach>
                          	
                          	
                          	 <c:set var="outletEvent" value="false"/>
	                            <c:forEach var="accessControl" items="${sessionScope.outletManagement}">
	                            	<c:if test="${accessControl.appSubflow == 'Event' && accessControl.write == true && accessControl.read == false}">
	                            	<c:set var="outletEvent" value="true"/> 
	                            	<div class="col-lg-4 form-group">
		                         		<div style="text-align: center;width: 140px;height: 130px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="viewoutletdaysOpen('daysOpen','daysOpen','0','menu')" title="Event Management">
		                         			<img src="${pageContext.request.contextPath}/images/imagentavl.png" style="margin-top: -30px; padding: 34px 12px 0px 59px; margin-left: -33%;"><br><br>
		  		                         			<span>Event Management</span><br>
		                         		</div>
		                         	</div>
	                            	</c:if>
	                            	
	                            	<c:if test="${accessControl.appSubflow == 'Event' && outletEvent == false}"> 
	                  				<c:set var="viewcounthome" value='${viewcounthome+1}'></c:set>
	                                <c:if test="${viewcounthome == 1}">
                          			<div class="col-lg-4 form-group">
		                         		<div style="text-align: center;width: 140px;height: 130px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="viewEventsManagement('outletEvents','0')" title="Event Management">
		                         			<img src="${pageContext.request.contextPath}/images/imagentavl.png" style="margin-top: -30px; padding: 34px 12px 0px 59px; margin-left: -33%;"><br><br>
		                           			<span>Event Management</span><br>
		                         		</div>
		                         	</div> 
                          			</c:if>
	                  				</c:if>
		                  	</c:forEach>
                          	
                          	
                          	<c:set var="counterMaster" value="false"/>
                            <c:forEach var="accessControl" items="${sessionScope.outletManagement}">
                            		<c:if test="${accessControl.appDocument == 'CounterMaster' && accessControl.write == true && accessControl.read == false}"> 
                            			<c:set var="noOfCols" value="${noOfCols + 1}" />
                            			<c:set var="counterMaster" value="true"/>
                          				<div class="col-lg-4 form-group" style="text-align: right;">
			                          		<div style="text-align: center;width: 140px;height: 130px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="viewNewCounter('newCounter');" title="<spring:message code="counter_master.label" />">
			                          			<img src="${pageContext.request.contextPath}/images/BillingCounter.png" style="margin-top: 10px;"><br>
			                          			<span><spring:message code="counter_master.label" /></span><br>
			                          		</div>
			                       		</div>
                          			</c:if>
	                            	<c:if test="${accessControl.appDocument == 'CounterMaster' && counterMaster == false}"> 
	                            	<c:set var="noOfCols" value="${noOfCols + 1}" />
                          				<div class="col-lg-4 form-group" style="text-align: right;">
			                          		<div style="text-align: center;width: 140px;height: 130px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="viewCounterMaster('counterMaster','0');" title="<spring:message code="counter_master.label" />">
			                          			<img src="${pageContext.request.contextPath}/images/BillingCounter.png" style="margin-top: 10px;"><br>
			                          			<span><spring:message code="counter_master.label" /></span><br>
			                          		</div>
			                       		</div>
                          			</c:if>
                          	</c:forEach>
                          	<c:set var="storeTaxation" value="false"/>
                            <c:forEach var="accessControl" items="${sessionScope.outletManagement}">
                            		<c:if test="${accessControl.appDocument == 'Taxation' && accessControl.write == true && accessControl.read == false}"> 
                            			<c:set var="noOfCols" value="${noOfCols + 1}" />
                            			<c:set var="storeTaxation" value="true"/>
                          				<div class="col-lg-4 form-group" style="text-align: right;">
			                          		<div style="text-align: center;width: 140px;height: 130px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="newStoreTax('taxation');" title="<spring:message code="taxation.label" />">
			                          			<img src="${pageContext.request.contextPath}/images/StoreTaxation.png" style="margin-top: 10px;"><br>
			                          			<span><spring:message code="taxation.label" /></span><br>
			                          		</div>
			                       		</div>
                          			</c:if>
	                            	<c:if test="${accessControl.appDocument == 'Taxation' && storeTaxation == false}"> 
	                            	<c:set var="noOfCols" value="${noOfCols + 1}" />
                          				<div class="col-lg-4 form-group" style="text-align: right;">
			                          		<div style="text-align: center;width: 140px;height: 130px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="viewStoreTaxation('taxation','0','');" title="<spring:message code="taxation.label" />">
			                          			<img src="${pageContext.request.contextPath}/images/StoreTaxation.png" style="margin-top: 10px;"><br>
			                          			<span><spring:message code="taxation.label" /></span><br>
			                          		</div>
			                       		</div>
                          			</c:if>
                          	</c:forEach>
                          	<c:set var="departmentMaster" value="false"/>
                            <c:forEach var="accessControl" items="${sessionScope.outletManagement}">
                            		<c:if test="${accessControl.appDocument == 'Departments' && accessControl.write == true && accessControl.read == false}"> 
                            			<c:set var="noOfCols" value="${noOfCols + 1}" />
                            			<c:set var="departmentMaster" value="true"/>
                          				<div class="col-lg-4 form-group" style="text-align: right;">
			                          		<div style="text-align: center;width: 140px;height: 130px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="viewNewDepartmentMaster('departmentMaster');" title="<spring:message code="department.master.label" />">
			                          			<img src="${pageContext.request.contextPath}/images/Departments.png" style="margin-top: 10px;"><br>
			                          			<span><spring:message code="department.master.label" /></span><br>
			                          		</div>
			                       		</div>
                          			</c:if>
	                            	<c:if test="${accessControl.appDocument == 'Departments' && departmentMaster == false}"> 
	                            	<c:set var="noOfCols" value="${noOfCols + 1}" />
                          					<div class="col-lg-4 form-group" style="text-align: right;">
				                          		<div style="text-align: center;width: 140px;height: 130px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="viewDepartmentMaster('departmentMaster','0');" title="<spring:message code="department.master.label" />">
				                          			<img src="${pageContext.request.contextPath}/images/Departments.png" style="margin-top: 10px;"><br>
				                          			<span><spring:message code="department.master.label" /></span><br>
				                          		</div>
				                       		</div>
                          			</c:if>
                          	</c:forEach>
                          	<c:forEach var="accessControl" items="${sessionScope.shiftManagement}" varStatus="theCount">
	                         <c:if test="${theCount.count == 1}">
	                         <c:set var="noOfCols" value="${noOfCols + 1}" />
                          			<div class="col-lg-4 form-group" style="text-align: right;">
		                          		<div style="text-align: center;width: 140px;height: 130px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="showShiftManagementFlows('outlet');" title="<spring:message code="shift.management.label" />">
		                          			<img src="${pageContext.request.contextPath}/images/ShiftManagement.png" style="margin-top: 10px;"><br>
		                          			<span><spring:message code="shift.management.label" /></span><br>
		                          		</div>
		                       		</div>
                          			</c:if>
                          	</c:forEach>
                          	
                          	<c:if test="${accessControl.appDocument == 'OutletNotifications' && outletNotifications==false}"> 
                            		<c:set var="noOfCols" value="${noOfCols + 1}" />
	                            	<div class="col-lg-4 form-group">
		                         		<div style="text-align: center;width: 140px;height: 130px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="viewOutletNotifications('outletNotifications','0')" title="<spring:message code="notifications.label" />">
		                         			<img src="${pageContext.request.contextPath}/images/OutletNotifications.png" style="margin-top: 10px;"><br>
		                         			<span><spring:message code="notifications.label" /></span><br>
		                         		</div>
		                         	</div> 
	                  			</c:if>
                          	
                          	<c:forEach var="accessControl" items="${sessionScope.outletManagement}">
	                            <c:if test="${accessControl.appDocument == 'BillingAndPayments' && accessControl.read == true}"> 
	                            <c:set var="noOfCols" value="${noOfCols + 1}" />
		                          	<div class="col-lg-4 form-group">
		                          		<div style="text-align: center;width: 140px;height: 130px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="showBillsFlows()" title="<spring:message code="outlet_billingandpayment.label" />">
		                          			<img src="${pageContext.request.contextPath}/images/Payments.gif" style="margin-top: 10px;"><br>
		                          			<span><spring:message code="outlet.label" /></span><br>
		                          			<span><spring:message code="outlet_billingandpayment.label" /></span>
		                          		</div>
		                          	</div>
		                         </c:if>
		                    </c:forEach>
		                   
		                    <c:set var="outletCustOrders" value="false"/>
		                	 <c:forEach var="accessControl" items="${sessionScope.outletCustomerOrder}">
		                	 		<c:if test="${accessControl.appDocument == 'outletCustomerOrders' && accessControl.write == true && accessControl.read == false}">
		                	 			<c:set var="noOfCols" value="${noOfCols + 1}" />
		                	 			<c:set var="outletCustOrders" value="true"/> 
		                            	<div class="col-lg-4 form-group" style="text-align: left;">
			                          		<div style="text-align: center;width: 140px;height: 130px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="return  viewNewOrder('newOutletOrder','','outlet');" title="<spring:message code="outlet_customerorders.label" />">
			                          			<img src="${pageContext.request.contextPath}/images/CustomerOrder.gif" style="margin-top: 10px;"><br>
			                          			<span><spring:message code="outlet.label" /></span><br>
			                          			<span><spring:message code="outlet_customerorders.label" /></span>
			                          		</div>
			                          	</div>
		                            	</c:if>
	                            	<c:if test="${accessControl.appDocument == 'outletCustomerOrders' && outletCustOrders==false}"> 
	                            		<c:set var="noOfCols" value="${noOfCols + 1}" />
		                            	<div class="col-lg-4 form-group" style="text-align: left;">
			                          		<div style="text-align: center;width: 140px;height: 130px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="showOutletOrdersFlows()" title="<spring:message code="outlet_customerorders.label" />">
			                          			<img src="${pageContext.request.contextPath}/images/CustomerOrder.gif" style="margin-top: 10px;"><br>
			                          			<span><spring:message code="outlet.label" /></span><br>
			                          			<span><spring:message code="outlet_customerorders.label" /></span>
			                          		</div>
			                          	</div> 
		                  			</c:if>
		                  	</c:forEach>
		                  	<%-- <c:if test="${noOfCols == 5}">
                          			<div class="col-lg-2 form-group" style="text-align: left;"></div>
                          		</div>
	                        	<div class="row">
		                    </c:if>
		                     <c:forEach var="accessControl" items="${sessionScope.outletShipment}" varStatus="theCount" >
	                            	<c:if test="${theCount.count == 1}"> 
	                            		<c:set var="noOfCols" value="${noOfCols + 1}" />
			                          	<div class="col-lg-2 form-group" style="text-align: right;">
			                          		<div style="text-align: center;width: 140px;height: 130px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="showOutletShipmentsFlows()" title="<spring:message code="outlet_shipments.label" />">
			                          			<img src="${pageContext.request.contextPath}/images/Delivery.gif" style="margin-top: 10px;"><br>
			                          			<span><spring:message code="outlet.label" /></span><br>
			                          			<span><spring:message code="outlet_shipments.label" /></span>
			                          		</div>
			                          	</div>
			                        </c:if>
			                 </c:forEach> --%>
			                 
			        <%-- <c:set var="outletShipmentAdded" value="false"/> 			
	                 <c:forEach var="accessControl" items="${sessionScope.outletShipment}" varStatus="theCount">
                  		<c:if test="${accessControl.appDocument == 'outletShipment' && accessControl.read == false && accessControl.write == true && outletShipmentAdded == false}"> 
       							<li><a id="newOutletShipmentManagement" onclick="return viewNewShipment('newOutletShipmentManagement','outlet');"><i class="fa fa-angle-double-right"></i><spring:message code="deliveries.label" /></a>
		                  		<c:set var="outletShipmentAdded" value="true"/> 
		                  		<div class="col-lg-2 form-group" style="text-align: right;">
	                          		<div style="text-align: center;width: 140px;height: 130px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="viewNewShipment('newOutletShipmentManagement','outlet');" title="<spring:message code="outlet_shipments.label" />">
	                          			<img src="${pageContext.request.contextPath}/images/Delivery.gif" style="margin-top: 10px;"><br>
	                          			<span><spring:message code="outlet.label" /></span><br>
	                          			<span><spring:message code="outlet_shipments.label" /></span>
	                          		</div>
	                          	</div>
       					</c:if>
	       				<c:if test="${outletShipmentAdded == 'false'}">
	       					<c:set var="outletShipmentFlowAdded" value="false"/> 		
		       				<c:forEach var="accessControl" items="${sessionScope.outletShipment}" varStatus="theCount">
	                  			<c:if test="${accessControl.appDocument == 'outletShipment' && accessControl.read == true && outletShipmentFlowAdded == false}">
	                  				<c:set var="outletShipmentFlowAdded" value="true"/>
			       					<li id="liShipments"><a onclick="showOutletShipmentsFlows()"><i class="fa fa-angle-double-right"></i><spring:message code="deliveries.label" /><i class="fa fa-angle-left pull-right"></i></a>
					                  <ul id="ulShipments" class="treeview-menu">
			       				</c:if>
			       			</c:forEach>
			       			<c:if test="${outletShipmentFlowAdded == 'true'}">
			       				<c:forEach var="accessControl" items="${sessionScope.outletShipmentActivity}">
			       						<li><a id="${accessControl.appDocumentActivity}OutletShipmentManagement" onclick="viewOutletShipments('${accessControl.appDocumentActivity}','${accessControl.appDocumentActivity}OutletShipmentManagement','0','','outlet','menu');"><i class="fa fa-angle-double-right"></i> ${accessControl.appDocumentActivity}</a> </li>
			     				</c:forEach>
			     			  </ul>
			     			</li>
			     			</c:if>
		     			</c:if>
		            </c:forEach> --%> 

			                 <c:set var="inventoryManagementAdded" value="false"/>
			                 <c:forEach var="accessControl" items="${sessionScope.outletStocks}" varStatus="theCount">
	                            <c:if test="${theCount.count == 1}">
	                             	<c:set var="inventoryManagementAdded" value="true"/>
	                            	<c:set var="noOfCols" value="${noOfCols + 1}" />
		                          	<div class="col-lg-4 form-group" style="text-align: right;">
		                          		<div style="text-align: center;width: 140px;height: 130px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="showInventoryManagementFlows();" title="<spring:message code="outlet_stockverification.label" />">
		                          			<img src="${pageContext.request.contextPath}/images/Verification.gif" style="margin-top: 10px;"><br>
		                          			<span><spring:message code="outlet.label" /></span><br>
		                          			<span><spring:message code="outlet_inventoryManagement.label" /></span>
		                          		</div>
		                          	</div>
		                         </c:if>
		                    </c:forEach>
		                    
		                    <c:forEach var="accessControl" items="${sessionScope.outletGoodsTransfer}" varStatus="theCount">
	                            <c:if test="${theCount.count == 1 && inventoryManagementAdded == false }">
	                             	<c:set var="inventoryManagementAdded" value="true"/>
	                            	<c:set var="noOfCols" value="${noOfCols + 1}" />
		                          	<div class="col-lg-4 form-group" style="text-align: right;">
		                          		<div style="text-align: center;width: 140px;height: 130px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="showInventoryManagementFlows();" title="<spring:message code="outlet_stockverification.label" />">
		                          			<img src="${pageContext.request.contextPath}/images/Verification.gif" style="margin-top: 10px;"><br>
		                          			<span><spring:message code="outlet.label" /></span><br>
		                          			<span><spring:message code="outlet_inventoryManagement.label" /></span>
		                          		</div>
		                          	</div>
		                         </c:if>
		                    </c:forEach>
		                  
		                   
		                    <c:forEach var="accessControl" items="${sessionScope.outletStockVerification}" varStatus="theCount">
	                            <c:if test="${theCount.count == 1 && inventoryManagementAdded == false }">
	                             	<c:set var="inventoryManagementAdded" value="true"/>
	                            	<c:set var="noOfCols" value="${noOfCols + 1}" />
		                          	<div class="col-lg-4 form-group" style="text-align: right;">
		                          		<div style="text-align: center;width: 140px;height: 130px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="showInventoryManagementFlows();" title="<spring:message code="outlet_stockverification.label" />">
		                          			<img src="${pageContext.request.contextPath}/images/Verification.gif" style="margin-top: 10px;"><br>
		                          			<span><spring:message code="outlet.label" /></span><br>
		                          			<span><spring:message code="outlet_inventoryManagement.label" /></span>
		                          		</div>
		                          	</div>
		                         </c:if>
		                    </c:forEach>
		                   
		                  
                         <c:forEach var="accessControl" items="${sessionScope.outletHealth}" varStatus="theCount">
	                          <c:if test="${theCount.count == 1}"> 
	                          <c:set var="noOfCols" value="${noOfCols + 1}" /> 
	                          	<div class="col-lg-4 form-group">
	                         		<div style="text-align: center;width: 140px;height: 130px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="showOutletHealthFlows()" title="<spring:message code="outlet.health.label" />">
	                         			<img src="${pageContext.request.contextPath}/images/OutletHealth.png" style="margin-top: 10px;"><br>
	                         			<span><spring:message code="outlet.health.label" /></span><br>
	                         		</div>
	                         	</div>
	                          </c:if>
	                     </c:forEach>   
	                    
		                   
	                     <c:set var="outletNotifications" value="false"/>
	                	 <c:forEach var="accessControl" items="${sessionScope.outletManagement}">
	                	 		<c:if test="${accessControl.appDocument == 'OutletNotifications' && accessControl.write == true && accessControl.read == false}">
	                	 			<c:set var="noOfCols" value="${noOfCols + 1}" />
	                	 			<c:set var="outletNotifications" value="true"/> 
	                            	<div class="col-lg-4 form-group">
		                         		<div style="text-align: center;width: 140px;height: 130px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="newOutletNotification('outletNotifications')" title="<spring:message code="notifications.label" />">
		                         			<img src="${pageContext.request.contextPath}/images/OutletNotifications.png" style="margin-top: 10px;"><br>
		                         			<span><spring:message code="notifications.label" /></span><br>
		                         		</div>
		                         	</div>
	                            	</c:if>
                            	 <c:if test="${accessControl.appDocument == 'OutletNotifications' && outletNotifications==false}"> 
                            		<c:set var="noOfCols" value="${noOfCols + 1}" />
	                            	<div class="col-lg-4 form-group">
		                         		<div style="text-align: center;width: 140px;height: 130px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="viewOutletNotifications('outletNotifications','0')" title="<spring:message code="notifications.label" />">
		                         			<img src="${pageContext.request.contextPath}/images/OutletNotifications.png" style="margin-top: 10px;"><br>
		                         			<span><spring:message code="notifications.label" /></span><br>
		                         		</div>
		                         	</div> 
	                  			</c:if> 
		                  	</c:forEach>
		                  	
		                  	
		                  	 <c:set var="OutletMonitoring" value="false"/>
	                      <c:forEach var="accessControl" items="${sessionScope.outletMonitoring}" varStatus="theCount">
                            <c:if test="${theCount.count == 1}">
	                            	<div class="col-lg-4 form-group">
		                         		<div style="text-align: center;width: 140px;height: 130px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="showoutletmonitoringflows('outlet')" title="Outlet monitoring">
		                         			<img src="${pageContext.request.contextPath}/images/imagentavl.png" style="margin-top: -30px; padding: 34px 12px 0px 59px; margin-left: -33%;"><br><br>
		                           			<span>Outlet Monitoring</span><br>
		                         		</div>
		                         	</div> 
	                  			</c:if> 
		                  	</c:forEach>
		                  	
		                  	
		                  	
		                  	
		                  	 <c:set var="daysOpen" value="false"/>
	                            <c:forEach var="accessControl" items="${sessionScope.outletManagement}">
	                            	<c:if test="${accessControl.appDocument == 'DaysOpen' && accessControl.write == true && accessControl.read == false}">
	                            	<c:set var="daysOpen" value="true"/> 
	                            	<div class="col-lg-4 form-group">
		                         		<div style="text-align: center;width: 140px;height: 130px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="viewoutletdaysOpen('daysOpen','daysOpen','0','menu')" title="Day Open">
		                         			<img src="${pageContext.request.contextPath}/images/imagentavl.png" style="margin-top: -30px; padding: 34px 12px 0px 59px; margin-left: -33%;"><br><br>
		  		                         			<span>Day Open</span><br>
		                         		</div>
		                         	</div>
	                            	</c:if>
	                            	<c:if test="${accessControl.appDocument == 'DaysOpen' && daysOpen == false}"> 
	                            	<div class="col-lg-4 form-group">
		                         		<div style="text-align: center;width: 140px;height: 130px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="viewoutletdaysOpen('daysOpen','daysOpen','0','menu')" title="Day Open">
		                         			<img src="${pageContext.request.contextPath}/images/imagentavl.png" style="margin-top: -30px; padding: 34px 12px 0px 59px; margin-left: -33%;"><br><br>
		                           			<span>Day Open</span><br>
		                         		</div>
		                         	</div> 
	                  			</c:if> 
		                  	</c:forEach>
		                  	
		              <c:set var="daysClose" value="false"/>
	                            <c:forEach var="accessControl" items="${sessionScope.outletManagement}">
	                            	<c:if test="${accessControl.appDocument == 'DaysClose' && accessControl.write == true && accessControl.read == false}">
	                            		<c:set var="daysClose" value="true"/>  
	                            	<div class="col-lg-4 form-group">
		                         		<div style="text-align: center;width: 140px;height: 130px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="newOutletNotification('daysClose');" title="Day Close">
		                         			<img src="${pageContext.request.contextPath}/images/imagentavl.png" style="margin-top: -30px; padding: 34px 12px 0px 59px; margin-left: -33%;"><br><br>
		  		                         			<span>Day Close</span><br>
		                         		</div>
		                         	</div>
	                            	</c:if>
                            	<c:if test="${accessControl.appDocument == 'DaysClose' && daysClose == false}"> 
	                            	<div class="col-lg-4 form-group">
		                         		<div style="text-align: center;width: 140px;height: 130px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="viewoutletdaysClose('daysClose','daysClose','0','menu');" title="Day Close">
		                         			<img src="${pageContext.request.contextPath}/images/imagentavl.png" style="margin-top: -30px; padding: 34px 12px 0px 59px; margin-left: -33%;"><br><br>
		                           			<span>Day Close</span><br>
		                         		</div>
		                         	</div> 
	                  			</c:if> 
		                  	</c:forEach>
		                  	
		                  	<c:set var="menuConfigurations" value="false"/> 
                            <c:forEach var="accessControl" items="${sessionScope.outletManagement}">
	                            	<c:if test="${accessControl.appDocument == 'MenuConfigurations' && menuConfigurations == false}"> 
	                            	<div class="col-lg-4 form-group">
		                         		<div style="text-align: center;width: 140px;height: 130px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="return viewMenuConfigurations('menuConfigurations');" title="<spring:message code="menu.label" />">
		                         			<img src="${pageContext.request.contextPath}/images/imagentavl.png" style="margin-top: -30px; padding: 34px 12px 0px 59px; margin-left: -33%;"><br><br>
		                           			<span><spring:message code="menu.label" /></span><br>
		                         		</div>
		                         	</div> 
	                            	</c:if>
                             </c:forEach> 
		                  	
		                  	
	                     </div>
                 </c:if>     
                 </div>
<div class="col-lg-6">
<div style="margin-left: 57px;border: 1px;  width: 470px;overflow-x: hidden;height: 420px;overflow-y: scroll;margin-right: auto;margin-top: 20px;margin-bottom: 50px;border-style: solid;border-width: 1px;border-color: gray;">
<div style="border:1px;border-style: solid;background-color:lightgray;width: 200px;border-color: gray;margin: 0px;border-top: 1px solid lightgray;border-left: 1px solid lightgray;">
<h4>Outlet Management</h4>
</div>
<div style="padding-top: 5px;padding-bottom: 10px;padding-left: 20px;">
<p>You can configure, monitor, control, and visualize the Outlets without any hassle. You just need
an hour to set a new store or a counter. TechnoLabs Retail Cloud supports more than one Retail Vertical.
FMCG, APPAREL, F & V, F & B, SUPER/HYPER MARKETS, WHITE GOODS are the major retail verticals that are accessing
our Cloud Services.</p>
<p>Using Outlet Management flows, you can do the below activities.</p>
<p>Configuration:</p>
<ul style="list-style-type:none">
<li>1) Outlet Creation/Update</li>
<li>2) Business/Billing Counters</li>
<li>3) Store-wise Taxation</li>
<li>4) Shift Management</li>
</ul>
<p>Monitoring:</p>
<ul style="list-style-type:none">
<li>1) Outlet Monitoring</li>
<li>2) Outlet wise - Billing/Payments</li>
<li>3) Inventory Management</li>
<li>4) Outlet Health</li>
<li>5) Outlet Notifcations</li>
</ul>
<p>Controlling:</p>
<ul style="list-style-type:none">
<li>1) Can start/stop an outlet or counter.</li>
<li>2) Can read foot falls.</li>
<li>3) View Video stream of one or more outlets.</li>
<li>4) Control every operation of Outlet.</li>
</ul>
<p>Visualization:</p>
<ul style="list-style-type:none">
<li>1) Access to real-time data of Billing.</li>
<li>2) Inventory of each store.</li>
<li>3) Health of each store.</li>
</ul>
</div>


</div>
</div>                                     
   </div>             	             
</body>
</html>