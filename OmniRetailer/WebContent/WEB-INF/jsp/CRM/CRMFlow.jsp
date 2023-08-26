<!--/*
 * Project Name 	        : OmniRetailerCustomer
 * Written By		        : Sambaiah Y
 * file name		        : onventorymanager/salesreports/salesreports.jsp
 * file type		        : JSP
 * description				: display sales reports information
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
                             <c:set var="noOfCols" value="0"/>
                          
                          <c:if test="${sessionScope.role == 'super admin'}">
                          <div class="row">
                          		<div class="col-lg-2" style="text-align: right;">
	                          		<div style="text-align: center;width: 140px;height: 130px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="viewCustomers('customerViews');" title="<spring:message code="customer.view.label" />">
	                          			<img src="${pageContext.request.contextPath}/images/CustomerView.png" style="margin-top: 10px;"><br><br>
	                          			<span><spring:message code="customer.view.label" /></span>
	                          			<%-- <span><spring:message code="masters_label" /></span> --%>
	                          		</div>
	                          	</div>
	                          	
	                          	<div class="col-lg-2" style="text-align: right;">
	                          		<div style="text-align: center;width: 140px;height: 130px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="viewCustomerGroupMaster('CustomerGroup',0);" title="Customer Group">
	                          			<img src="${pageContext.request.contextPath}/images/CustomerView.png" style="margin-top: 10px;"><br><br>
	                          			<span>Customer Group</span>
	                          			<%-- <span><spring:message code="masters_label" /></span> --%>
	                          		</div>
	                          	</div>
	                          	
	                          	<div class="col-lg-2" style="text-align: right;">
                          			<div style="text-align: center;width: 140px;height: 130px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="viewCustomerVisits('customerVisits');" title="<spring:message code="email.settings.label" />">
	                          			<img src="${pageContext.request.contextPath}/images/CustomerVisit.png" style="margin-top: 10px;"><br><br>
	                          			<span><spring:message code="customer.visits.label" /></span>
	                          			<%-- <span><spring:message code="masters_label" /></span> --%>
	                          		</div>
                          		</div>
                          		<div class="col-lg-2" style="text-align: right;">
                          			<div style="text-align: center;width: 140px;height: 130px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="viewCustomerPurchases('customerPurchases','0');" title="<spring:message code="sms.settings.label" />">
	                          			<img src="${pageContext.request.contextPath}/images/Customer_Purchases.png" style="margin-top: 10px;"><br><br>
	                          			<span><spring:message code="customer.purchases.label" /></span>
	                          			<%-- <span><spring:message code="masters_label" /></span> --%>
	                          		</div>
                          		</div>
	                          	<%-- <div class="col-lg-2" style="text-align: right;">
                          			<div style="text-align: center;width: 140px;height: 130px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="viewCustomerNotifications('customerNotifications');" title="<spring:message code="customer.notifications.label" />">
	                          			<img src="${pageContext.request.contextPath}/images/Customer_Notifications.png" style="margin-top: 10px;"><br><br>
	                          			<span><spring:message code="customer.notifications.label" /></span>
	                          			<span><spring:message code="masters_label" /></span>
	                          		</div> 
                          		</div>--%>
                          			<div class="col-lg-2" style="text-align: right;">
                          			<div style="text-align: center;width: 140px;height: 130px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="viewCustomerWarrants('customerWarrants','0','menu')" title="<spring:message code="customer.warrants.label" />">
	                          			<img src="${pageContext.request.contextPath}/images/Customer_Warranties.png" style="margin-top: 10px;"><br><br>
	                          			<span><spring:message code="customer.warrants.label" /></span>
	                          			<%-- <span><spring:message code="masters_label" /></span> --%>
	                          		</div>
                          		</div>
                          		</div>
                          		<br>
                          		<div class="row">
                          	
                          		<div class="col-lg-2" style="text-align: right;">
                          			<div style="text-align: center;width: 140px;height: 130px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="viewCustomerFeedback('customerFeedback','0','menu')" title="<spring:message code="customer.feedback.label" />">
	                          			<img src="${pageContext.request.contextPath}/images/Feedback.png" style="margin-top: 10px;"><br><br>
	                          			<span><spring:message code="customer.feedback.label" /></span>
	                          			<%-- <span><spring:message code="masters_label" /></span> --%>
	                          		</div>
                          		</div>
                          		<div class="col-lg-2" style="text-align: right;">
                          			<div style="text-align: center;width: 140px;height: 130px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="viewCustomerComplaints('customerComplaints','0')" title="<spring:message code="customer.complaints.label" />">
	                          			<img src="${pageContext.request.contextPath}/images/CustomerComplaints.png" style="margin-top: 10px;"><br><br>
	                          			<span><spring:message code="customer.complaints.label" /></span>
	                          			<%-- <span><spring:message code="masters_label" /></span> --%>
	                          		</div>
                          		</div>
                          		<div class="col-lg-2" style="text-align: right;">
		                          			<div style="text-align: center;width: 140px;height: 130px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="viewBusinessEnquiry('businessEnquiry','0','menu')" title="<spring:message code="business.enquiry.label" />">
			                          			<img src="${pageContext.request.contextPath}/images/BusinessEnquiry.png" style="margin-top: 10px;"><br><br>
			                          			<span><spring:message code="business.enquiry.label" /></span>
			                          			<%-- <span><spring:message code="masters_label" /></span> --%>
			                          		</div>
		                          		</div>
                          		</div>
                          </c:if>
                           <c:if test="${sessionScope.role != 'super admin'}">
                           <div class="row" >
                           <c:set var="customerView" value="false"/> 
                             <c:forEach var="accessControl" items="${sessionScope.crm}">
                             		<c:if test="${accessControl.appDocument == 'CustomerView' && accessControl.write == true && accessControl.read == false}"> 	
                             		 <c:set var="customerView" value="true"/> 
                             		 <c:set var="noOfCols" value="${noOfCols + 1}" />
                             		 	<div class="col-lg-2" style="text-align: right;">
			                          		<div style="text-align: center;width: 140px;height: 130px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="viewCustomers('customerViews');" title="<spring:message code="customer.view.label" />">
			                          			<img src="${pageContext.request.contextPath}/images/CustomerView.png" style="margin-top: 10px;"><br><br>
			                          			<span><spring:message code="customer.view.label" /></span>
			                          			<%-- <span><spring:message code="masters_label" /></span> --%>
			                          		</div>
			                          	</div>
                            		</c:if>
	                            	<c:if test="${accessControl.appDocument == 'CustomerView' && customerView == false}"> 	
	                            	<c:set var="noOfCols" value="${noOfCols + 1}" />		
                            			<div class="col-lg-2" style="text-align: right;">
			                          		<div style="text-align: center;width: 140px;height: 130px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="viewCustomers('customerViews');" title="<spring:message code="customer.view.label" />">
			                          			<img src="${pageContext.request.contextPath}/images/CustomerView.png" style="margin-top: 10px;"><br><br>
			                          			<span><spring:message code="customer.view.label" /></span>
			                          			<%-- <span><spring:message code="masters_label" /></span> --%>
			                          		</div>
			                          	</div>
                            		</c:if>
                            </c:forEach>
                            
                            
                            
                            
                            
                            
                          <c:set var="customerVisits" value="false"/> 			
                             <c:forEach var="accessControl" items="${sessionScope.crm}">
                             		<c:if test="${accessControl.appDocument == 'CustomerVisits' && accessControl.write == true && accessControl.read == false}">
                             		<c:set var="noOfCols" value="${noOfCols + 1}" />
                             			<c:set var="customerVisits" value="true"/>  		
                             			<div class="col-lg-2" style="text-align: right;">
		                          			<div style="text-align: center;width: 140px;height: 130px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="viewCustomerVisits('customerVisits');" title="<spring:message code="customer.visits.label" />">
			                          			<img src="${pageContext.request.contextPath}/images/CustomerVisit.png" style="margin-top: 10px;"><br><br>
			                          			<span><spring:message code="customer.visits.label" /></span>
			                          			<%-- <span><spring:message code="masters_label" /></span> --%>
			                          		</div>
		                          		</div>
                            		</c:if>
	                            	<c:if test="${accessControl.appDocument == 'CustomerVisits' && customerVisits == false}"> 	
	                            	<c:set var="noOfCols" value="${noOfCols + 1}" />	
                            			<div class="col-lg-2" style="text-align: right;">
		                          			<div style="text-align: center;width: 140px;height: 130px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="viewCustomerVisits('customerVisits');" title="<spring:message code="customer.visits.label" />">
			                          			<img src="${pageContext.request.contextPath}/images/CustomerVisit.png" style="margin-top: 10px;"><br><br>
			                          			<span><spring:message code="customer.visits.label" /></span>
			                          			<%-- <span><spring:message code="masters_label" /></span> --%>
			                          		</div>
		                          		</div>
                            		</c:if>
                            </c:forEach>	
                            <c:set var="customerPurchases" value="false"/>	
                            <c:forEach var="accessControl" items="${sessionScope.crm}">
                            		<c:if test="${accessControl.appDocument == 'CustomerPurchases' && accessControl.write == true && accessControl.read == false}"> 
                            			<c:set var="noOfCols" value="${noOfCols + 1}" />
                            			<c:set var="customerPurchases" value="true"/>
                            			<div class="col-lg-2" style="text-align: right;">
		                          			<div style="text-align: center;width: 140px;height: 130px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="viewCustomerPurchases('customerPurchases','0');" title="<spring:message code="customer.purchases.label" />">
			                          			<img src="${pageContext.request.contextPath}/images/Customer_Purchases.png" style="margin-top: 10px;"><br><br>
			                          			<span><spring:message code="customer.purchases.label" /></span>
			                          			<%-- <span><spring:message code="masters_label" /></span> --%>
			                          		</div>
		                          		</div>	
                            		</c:if>
	                            	<c:if test="${accessControl.appDocument == 'CustomerPurchases' && customerPurchases == false}"> 
	                            	<c:set var="noOfCols" value="${noOfCols + 1}" />		
                            			<div class="col-lg-2" style="text-align: right;">
		                          			<div style="text-align: center;width: 140px;height: 130px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="viewCustomerPurchases('customerPurchases','0');" title="<spring:message code="customer.purchases.label" />">
			                          			<img src="${pageContext.request.contextPath}/images/Customer_Purchases.png" style="margin-top: 10px;"><br><br>
			                          			<span><spring:message code="customer.purchases.label" /></span>
			                          			<%-- <span><spring:message code="masters_label" /></span> --%>
			                          		</div>
		                          		</div>
                            		</c:if>
                            </c:forEach>
                           <c:forEach var="accessControl" items="${sessionScope.loyaltyProgram}" varStatus="theCount">
	                           	<c:if test="${theCount.count == 1}">
                            	<c:set var="noOfCols" value="${noOfCols + 1}" />	
                           			<div class="col-lg-2" style="text-align: right;">
	                          			<div style="text-align: center;width: 140px;height: 130px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="showLoyaltyFlow();" title="<spring:message code="loyalty.program.label" />">
		                          			<img src="${pageContext.request.contextPath}/images/CustomerLoyalty.png" style="margin-top: 10px;"><br><br>
		                          			<span><spring:message code="loyalty.program.label" /></span>
		                          			<%-- <span><spring:message code="masters_label" /></span> --%>
		                          		</div>
	                          		</div>
                           		</c:if>
                           </c:forEach>
                           <%--  <c:set var="customerNotification" value="false"/>	
                            <c:forEach var="accessControl" items="${sessionScope.crm}">
                            		<c:if test="${accessControl.appDocument == 'CustomerNotification' && accessControl.write == true && accessControl.read == false}">
                            			<c:set var="noOfCols" value="${noOfCols + 1}" /> 
                            			<c:set var="customerNotification" value="true"/>
                            			<div class="col-lg-2" style="text-align: right;">
		                          			<div style="text-align: center;width: 140px;height: 130px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="viewCustomerNotifications('customerNotifications');" title="<spring:message code="customer.notifications.label" />">
			                          			<img src="${pageContext.request.contextPath}/images/Customer_Notifications.png" style="margin-top: 10px;"><br><br>
			                          			<span><spring:message code="customer.notifications.label" /></span>
			                          			<span><spring:message code="masters_label" /></span>
			                          		</div>
		                          		</div>
                            		</c:if>
	                            	<c:if test="${accessControl.appDocument == 'CustomerNotification' && customerNotification == false}"> 	
	                            		<c:set var="noOfCols" value="${noOfCols + 1}" />	
                            			<div class="col-lg-2" style="text-align: right;">
		                          			<div style="text-align: center;width: 140px;height: 130px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="viewCustomerNotifications('customerNotifications');" title="<spring:message code="customer.notifications.label" />">
			                          			<img src="${pageContext.request.contextPath}/images/Customer_Notifications.png" style="margin-top: 10px;"><br><br>
			                          			<span><spring:message code="customer.notifications.label" /></span>
			                          			<span><spring:message code="masters_label" /></span>
			                          		</div>
		                          		</div>
                            		</c:if>
                            </c:forEach> --%>
                             <c:if test="${noOfCols == 5}">
                          		<div class="col-lg-2" style="text-align: left;"></div>
                          </div>
                          <br>
                          <br>
	                        	<div class="row">
		                    </c:if>
                            <c:set var="customerWarrants" value="false"/>	
                            <c:forEach var="accessControl" items="${sessionScope.crm}">
                            		<c:if test="${accessControl.appDocument == 'CustomerWarrants' && accessControl.write == true && accessControl.read == false}">
                            			<c:set var="noOfCols" value="${noOfCols + 1}" /> 
                            			<c:set var="customerWarrants" value="true"/>
                            			<div class="col-lg-2" style="text-align: right;">
		                          			<div style="text-align: center;width: 140px;height: 130px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="viewCustomerWarrants('customerWarrants','0','menu')" title="<spring:message code="customer.warrants.label" />">
			                          			<img src="${pageContext.request.contextPath}/images/Customer_Warranties.png" style="margin-top: 10px;"><br><br>
			                          			<span><spring:message code="customer.warrants.label" /></span>
			                          			<%-- <span><spring:message code="masters_label" /></span> --%>
			                          		</div>
                          				</div>
                            		</c:if>
	                            	<c:if test="${accessControl.appDocument == 'CustomerWarrants' && customerWarrants == false}"> 	
	                            		<c:set var="noOfCols" value="${noOfCols + 1}" />	
                            			<div class="col-lg-2" style="text-align: right;">
		                          			<div style="text-align: center;width: 140px;height: 130px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="viewCustomerWarrants('customerWarrants','0','menu')" title="<spring:message code="customer.warrants.label" />">
			                          			<img src="${pageContext.request.contextPath}/images/Customer_Warranties.png" style="margin-top: 10px;"><br><br>
			                          			<span><spring:message code="customer.warrants.label" /></span>
			                          			<%-- <span><spring:message code="masters_label" /></span> --%>
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
                            <c:set var="customerFeedback" value="false"/>	
                            <c:forEach var="accessControl" items="${sessionScope.crm}">
                            		<c:if test="${accessControl.appDocument == 'CustomerFeedback' && accessControl.write == true && accessControl.read == false}">
                            			<c:set var="noOfCols" value="${noOfCols + 1}" /> 
                            			<c:set var="customerFeedback" value="true"/>
                            			<div class="col-lg-2" style="text-align: right;">
		                          			<div style="text-align: center;width: 140px;height: 130px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="viewCustomerFeedback('customerFeedback','0','menu')" title="<spring:message code="customer.feedback.label" />">
			                          			<img src="${pageContext.request.contextPath}/images/Feedback.png" style="margin-top: 10px;"><br><br>
			                          			<span><spring:message code="customer.feedback.label" /></span>
			                          			<%-- <span><spring:message code="masters_label" /></span> --%>
			                          		</div>
		                          		</div>	
                            		</c:if>
	                            	<c:if test="${accessControl.appDocument == 'CustomerFeedback' && customerFeedback == false}"> 	
	                            		<c:set var="noOfCols" value="${noOfCols + 1}" />	
                            			<div class="col-lg-2" style="text-align: right;">
		                          			<div style="text-align: center;width: 140px;height: 130px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="viewCustomerFeedback('customerFeedback','0','menu')" title="<spring:message code="customer.feedback.label" />">
			                          			<img src="${pageContext.request.contextPath}/images/Feedback.png" style="margin-top: 10px;"><br><br>
			                          			<span><spring:message code="customer.feedback.label" /></span>
			                          			<%-- <span><spring:message code="masters_label" /></span> --%>
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
                            <c:set var="customerComplaints" value="false"/>	
                            <c:forEach var="accessControl" items="${sessionScope.crm}">
                            		<c:if test="${accessControl.appDocument == 'CustomerComplaints' && accessControl.write == true && accessControl.read == false}">
                            			<c:set var="noOfCols" value="${noOfCols + 1}" /> 
                            			<c:set var="customerComplaints" value="true"/>
                            			<div class="col-lg-2" style="text-align: right;">
		                          			<div style="text-align: center;width: 140px;height: 130px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="newCustomerComplaints('customerComplaints')" title="<spring:message code="customer.complaints.label" />">
			                          			<img src="${pageContext.request.contextPath}/images/CustomerComplaints.png" style="margin-top: 10px;"><br><br>
			                          			<span><spring:message code="customer.complaints.label" /></span>
			                          			<%-- <span><spring:message code="masters_label" /></span> --%>
			                          		</div>
		                          		</div>
                            		</c:if>
	                            	<c:if test="${accessControl.appDocument == 'CustomerComplaints' && customerComplaints == false}">
	                            		<c:set var="noOfCols" value="${noOfCols + 1}" /> 		
                            			<div class="col-lg-2" style="text-align: right;">
		                          			<div style="text-align: center;width: 140px;height: 130px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="viewCustomerComplaints('customerComplaints','0')" title="<spring:message code="customer.complaints.label" />">
			                          			<img src="${pageContext.request.contextPath}/images/CustomerComplaints.png" style="margin-top: 10px;"><br><br>
			                          			<span><spring:message code="customer.complaints.label" /></span>
			                          			<%-- <span><spring:message code="masters_label" /></span> --%>
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
		                    <c:set var="businessEnquiry" value="false"/>	
                            <c:forEach var="accessControl" items="${sessionScope.crm}">
                            		<c:if test="${accessControl.appDocument == 'BusinessEnquiry' && accessControl.write == true && accessControl.read == false}">
                            			<c:set var="noOfCols" value="${noOfCols + 1}" /> 
                            			<c:set var="businessEnquiry" value="true"/>
                            			<div class="col-lg-2" style="text-align: right;">
		                          			<div style="text-align: center;width: 140px;height: 130px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="newBusinessEnquiry('businessEnquiry')" title="<spring:message code="business.enquiry.label" />">
			                          			<img src="" style="margin-top: 10px;"><br><br>
			                          			<span><spring:message code="business.enquiry.label" /></span>
			                          			<%-- <span><spring:message code="masters_label" /></span> --%>
			                          		</div>
		                          		</div>
                            		</c:if>
	                            	<c:if test="${accessControl.appDocument == 'BusinessEnquiry' && businessEnquiry == false}">
	                            		<c:set var="noOfCols" value="${noOfCols + 1}" /> 		
                            			<div class="col-lg-2" style="text-align: right;">
		                          			<div style="text-align: center;width: 140px;height: 130px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="viewBusinessEnquiry('businessEnquiry','0','menu')" title="<spring:message code="business.enquiry.label" />">
			                          			<img src="${pageContext.request.contextPath}/images/BusinessEnquiry.png" style="margin-top: 10px;"><br><br>
			                          			<span><spring:message code="business.enquiry.label" /></span>
			                          			<%-- <span><spring:message code="masters_label" /></span> --%>
			                          		</div>
		                          		</div>
                            		</c:if>
                            </c:forEach>
                            
                            <c:forEach var="accessControl" items="${sessionScope.crm}">
                             	<c:if test="${accessControl.appDocument == 'CustomerGroup' && accessControl.write == true && accessControl.read == true}">
                     		      <div class="col-lg-2" style="text-align: right;">
	                          		<div style="text-align: center;width: 140px;height: 130px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="viewCustomerGroupMaster('CustomerGroup',0);" title="Customer Group">
	                          			<img src="${pageContext.request.contextPath}/images/CustomerView.png" style="margin-top: 10px;"><br><br>
	                          			<span>Customer Group</span>
	                          		</div>
	                          	</div>
	                       	</c:if>
                     		 </c:forEach> 
                     		 
                     		<%--  
                     		 <c:forEach var="accessControl" items="${sessionScope.crm}">
                             	<c:if test="${accessControl.appDocument == 'CustomerOTP' && accessControl.write == true && accessControl.read == true}">
                     		      <div class="col-lg-2" style="text-align: right;">
	                          		<div style="text-align: center;width: 140px;height: 130px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="viewCustomerGroupMaster('CustomerGroup',0);" title="Customer Group">
	                          			<img src="${pageContext.request.contextPath}/images/imagentavl.png" style="margin-top: -30px; padding: 34px 12px 0px 59px; margin-left: -33%;"><br><br>
	                          			<span>Customer Group</span>
	                          		</div>
	                          	</div>
	                       	</c:if>
                     		 </c:forEach> 
                     		  --%>
                     		 
                     		
                     		 
                     	 
                     		  <c:set var="customerOTP" value="false"/>
	                           <c:forEach var="accessControl" items="${sessionScope.crm}">
                             	  <c:if test="${accessControl.appDocument == 'customerOTP' && accessControl.write == true && accessControl.read == false}">
                             	  	<c:set var="customerOTP" value="true"/> 
	                             <div class="col-lg-2" style="text-align: right;">
	                          		<div style="text-align: center;width: 140px;height: 130px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="newCustomerOTP('customerOTP');" title="Customer OTP">
	                          			<img src="${pageContext.request.contextPath}/images/imagentavl.png" style="margin-top: -30px; padding: 34px 12px 0px 59px; margin-left: -33%;"><br><br>
	                          			<span>Customer OTP</span>
	                          		</div>
	                          	</div>
	                              </c:if>
	                              <c:if test="${accessControl.appDocument == 'CustomerOTP' && customerOTP == false}">
	                            <div class="col-lg-2" style="text-align: right;">
	                          		<div style="text-align: center;width: 140px;height: 130px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="viewCustomerOTP('customerOTP','0','menu');" title="Customer OTP">
	                          			<img src="${pageContext.request.contextPath}/images/imagentavl.png" style="margin-top: -30px; padding: 34px 12px 0px 59px; margin-left: -33%;"><br><br>
	                          			<span>Customer OTP</span>
	                          		</div>
	                          	</div>
	                              </c:if>
	                           </c:forEach> 
                            
                          </div>
                          </c:if>
</body>
</html>