<!--/*
 * Project Name 	        : OmniRetailerCustomer
 * Written By		        : Mythri.S
 * file name		        : Inventory Manager/Deals and Offers/dealsFlow.jsp.jsp
 * file type		        : JSP
 * description				: display deals and offers flows information
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
                          <div class="row">
                            <c:if test="${sessionScope.role == 'super admin'}">
                            	<div class="col-lg-2" style="text-align: right;">
	                          		<div style="text-align: center;width: 140px;height: 130px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="viewdealsandoffers('deals','dealsConfigurations','0')" title="<spring:message code="deals.label" />">
	                          			<img src="${pageContext.request.contextPath}/images/Deals.png" style="margin-top: 10px;"><br><br>
	                          			<spring:message code="deals.label" />
	                          		</div>
	                          	</div>
	                          	<div class="col-lg-2" style="text-align: right;">
	                          		<div style="text-align: center;width: 140px;height: 130px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="viewdealsandoffers('offers','offersConfigurations','0','menu')" title="<spring:message code="offers.label" />">
	                          			<img src="${pageContext.request.contextPath}/images/Offers.png" style="margin-top: 10px;"><br><br>
	                          			<spring:message code="offers.label" />
	                          		</div>
	                          	</div>
	                          
									
		                          	<div class="col-lg-2" style="text-align: right;"></div>
		                          		</div><br>
		                          		<div class="row" >
									<div class="col-lg-2" style="text-align: right;">
		                          		<div style="text-align: center;width: 140px;height: 130px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="viewCustomerReferrals('CustomerReferal','0','false');" title="<spring:message code="customerreferals.label" />">
		                          			<img src="${pageContext.request.contextPath}/images/customerreferals.png" style="margin-top: 10px;"><br><br>
		                          			<spring:message code="customerreferals.label" />
		                          		</div>
		                          	</div>
										
	                          
                            </c:if>
                             <c:if test="${sessionScope.role != 'super admin'}">
                          <c:set var="deals" value="false"/>
                          <c:forEach var="accessControl" items="${sessionScope.campaignPromotions}" >
                          		<c:if test="${accessControl.appDocument == 'DealsConfiguration' && accessControl.write == true && accessControl.read == false}"> 
                           		<c:set var="deals" value="true"/>
                           		<div class="col-lg-2" style="text-align: right;">
	                          		<div style="text-align: center;width: 140px;height: 130px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="createNewDeal('dealsConfigurations');" title="<spring:message code="deals.label" />">
	                          			<img src="${pageContext.request.contextPath}/images/Deals.png" style="margin-top: 10px;"><br><br>
	                          			<spring:message code="deals.label" />
	                          		</div>
	                          	</div>
                           		</c:if>
                            	<c:if test="${accessControl.appDocument == 'DealsConfiguration' && deals==false}"> 
                           		<div class="col-lg-2" style="text-align: right;">
	                          		<div style="text-align: center;width: 140px;height: 130px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="viewdealsandoffers('deals','dealsConfigurations','0')" title="<spring:message code="deals.label" />">
	                          			<img src="${pageContext.request.contextPath}/images/Deals.png" style="margin-top: 10px;"><br><br>
	                          			<spring:message code="deals.label" />
	                          		</div>
	                          	</div>
                           		</c:if>
                           	</c:forEach>
                          
                          <c:set var="offers" value="false"/>
                           <c:forEach var="accessControl" items="${sessionScope.campaignPromotions}" >
                           		<c:if test="${accessControl.appDocument == 'OffersConfiguration' && accessControl.write == true && accessControl.read == false}"> 
                           			<c:set var="offers" value="true"/>
                           			<div class="col-lg-2" style="text-align: right;">
		                          		<div style="text-align: center;width: 140px;height: 130px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="createNewOffer('offersConfigurations');" title="<spring:message code="offers.label" />">
		                          			<img src="${pageContext.request.contextPath}/images/Offers.png" style="margin-top: 10px;"><br><br>
		                          			<spring:message code="offers.label" />
		                          		</div>
		                          	</div>
                           		</c:if>
                            	<c:if test="${accessControl.appDocument == 'OffersConfiguration' && offers==false}"> 
                           			<div class="col-lg-2" style="text-align: right;">
		                          		<div style="text-align: center;width: 140px;height: 130px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="viewdealsandoffers('offers','offersConfigurations','0','menu')" title="<spring:message code="offers.label" />">
		                          			<img src="${pageContext.request.contextPath}/images/Offers.png" style="margin-top: 10px;"><br><br>
		                          			<spring:message code="offers.label" />
		                          		</div>
		                          	</div>
                           		</c:if>
	                      </c:forEach>
	                     
	                     <c:set var="customerreferals" value="false"/>
                           <c:forEach var="accessControl" items="${sessionScope.campaignPromotions}" >
                           		<c:if test="${accessControl.appDocument == 'CustomerReferal' && accessControl.write == true && accessControl.read == false}"> 
                           			<c:set var="customerreferals" value="true"/>
                           			<div class="col-lg-2" style="text-align: right;">
		                          		<div style="text-align: center;width: 140px;height: 130px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="createNewOffer('offersConfigurations');" title="<spring:message code="customerreferals.label" />">
		                          			<img src="${pageContext.request.contextPath}/images/customerreferals.png" style="margin-top: 10px;"><br><br>
		                          			<spring:message code="customerreferals.label" />
		                          		</div>
		                          	</div>
                           		</c:if>
                            	<c:if test="${accessControl.appDocument == 'CustomerReferal' && customerreferals==false}"> 
                           			<div class="col-lg-2" style="text-align: right;">
		                          		<div style="text-align: center;width: 140px;height: 130px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="viewCustomerReferrals('CustomerReferal','0','false');" title="<spring:message code="customerreferals.label" />">
		                          			<img src="${pageContext.request.contextPath}/images/customerreferals.png" style="margin-top: 10px;"><br><br>
		                          			<spring:message code="customerreferals.label" />
		                          		</div>
		                          	</div>
                           		</c:if>
	                      </c:forEach>
	                      
	                      
	                      
	                      
	                      
	                      
	                     <c:set var="customersignup" value="false"/>
                           <c:forEach var="accessControl" items="${sessionScope.campaignPromotions}" >
                           		<c:if test="${accessControl.appDocument == 'CustomerSignUp' && accessControl.write == true && accessControl.read == false}"> 
                           			<c:set var="customersignup" value="true"/>
                           			<div class="col-lg-2" style="text-align: right;">
		                          		<div style="text-align: center;width: 140px;height: 130px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="viewCustomerSignUp('CustomerSignUp','0','false');" title="<spring:message code="customerreferals.label" />">
		                          			<img src="${pageContext.request.contextPath}/images/" style="margin-top: 10px;"><br><br>
		                          			<spring:message code="signUp.label" /> 
		                          		</div>
		                          	</div>
                           		</c:if>
                            	<c:if test="${accessControl.appDocument == 'CustomerSignUp' && customersignup==false}"> 
                           			<div class="col-lg-2" style="text-align: right;">
		                          		<div style="text-align: center;width: 140px;height: 130px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="viewCustomerSignUp('CustomerSignUp','0','false');" title="<spring:message code="customerreferals.label" />">
		                          			<img src="${pageContext.request.contextPath}/images/imagentavl.png" style="margin-top: -30px; padding: 34px 12px 0px 59px; margin-left: -33%;"><br><br>
		                          			<spring:message code="signUp.label" /> 
		                          		</div>
		                          	</div>
                           		</c:if>
	                      </c:forEach>
	                       <%-- <div class="col-lg-2" style="text-align: right;">
                          			<div style="text-align: center;width: 140px;height: 130px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="viewCustomerNotifications('customerNotifications');" title="<spring:message code="customer.notifications.label" />">
	                          			<img src="${pageContext.request.contextPath}/images/Customer_Notifications.png" style="margin-top: 10px;"><br><br>
	                          			<span><spring:message code="customer.notifications.label" /></span>
	                          			<span><spring:message code="masters_label" /></span>
	                          		</div> 
                          		</div> --%>
	                      
	                       <c:set var="promotions" value="false"/>
	                      
	                      </div>
	                      <br>
	                      <div class="row">
	                       
                          
	                     
	                      </c:if>
                          	</div>     
                        
                    
                          
</body>
</html>