<!--/*
 * Project Name 	        : OmniRetailerCustomer
 * Written By		        : Mythri.S
 * file name		        : Innventory Manager/loyaltyPrograms/loyaltyFlow.jsp
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
                          <div class="row">
                           <c:if test="${sessionScope.role == 'super admin'}"> 
                           		<div class="col-lg-2" style="text-align: right;">
	                          		<div style="text-align: center;width: 130px;height: 130px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="viewGiftVouchers('giftVouchers','GiftVoucher','0','menu');" title="<spring:message code="loyality.giftvouchers.label" />">
	                          			<img src="${pageContext.request.contextPath}/images/GiftVouchure.jpg" style="margin-top: 10px;"><br><br>
	                          			<span><spring:message code="loyality.giftvouchers.label" /></span>
	                          		</div>
	                          	</div>
	                          	<div class="col-lg-2">
	                          		<div style="text-align: center;width: 130px;height: 130px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="viewGiftCoupons('giftCoupons','GiftCoupons','0','menu');" title="<spring:message code="loyality.coupons.label" />">
	                          			<img src="${pageContext.request.contextPath}/images/Coupons.jpg" style="margin-top: 10px;"><br><br>
	                          			<span><spring:message code="loyality.coupons.label" /></span>
	                          		</div>
	                          	</div>
	                          	<div class="col-lg-2" style="text-align: left;">
	                          		<div style="text-align: center;width: 130px;height: 130px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="viewLoyaltyCards('loyaltyCards','LoyaltyCards','0','menu')" title="<spring:message code="loyaltycards.label" />">
	                          			<img src="${pageContext.request.contextPath}/images/LoyaltyCards.jpg" style="margin-top: 10px;"><br><br>
	                          			<span><spring:message code="loyaltycards.label" /></span>
	                          		</div>
                          		</div>
                          		<div class="col-lg-2" style="text-align: left;">
	                          		<div style="text-align: center;width: 130px;height: 130px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="viewcustomerRetention('customerRetention','CustomerRetention','0','menu')" title="<spring:message code="customer.retention.label" />">
	                          			<img src="${pageContext.request.contextPath}/images/CustomerRetention.jpg" style="margin-top: 10px;"><br><br>
	                          			<span><spring:message code="customer.retention.label" /></span>
	                          		</div>
                          		</div>
                          		<div class="col-lg-2" style="text-align: left;">
	                          		<div style="text-align: center;width: 130px;height: 130px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="viewcustomerPatterns('customerPatterns','CustomerPatterns','0','menu');" title="<spring:message code="customer.patterns.label" />">
	                          			<img src="${pageContext.request.contextPath}/images/LoyaltyCards.jpg" style="margin-top: 10px;"><br><br>
	                          			<span><spring:message code="customer.patterns.label" /></span>
	                          		</div>
                          		</div>
                          		</div>
                          		<br>
                          		<div class="row">
                          		<div class="col-lg-2" style="text-align: left;">
	                          		<div style="text-align: center;width: 130px;height: 130px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="viewloyalityRewards('loyalityrewards','LoyalityRewards','0','menu');" title="<spring:message code="loyality.rewards.label" />">
	                          			<img src="${pageContext.request.contextPath}/images/LoyaltyCards.jpg" style="margin-top: 10px;"><br><br>
	                          			<span><spring:message code="loyality.rewards.label" /></span>
	                          		</div>
                          		</div>
                          		
                          			<div class="col-lg-2" style="text-align: left;">
	                          		<div style="text-align: center;width: 130px;height: 130px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="viewMemberships('membership','Memberships','0','menu');" title="memberships">
	                          			<img src="${pageContext.request.contextPath}/images/imagentavl.png" style="margin-top: -30px; padding: 34px 12px 0px 59px; margin-left: -33%;"><br><br>
	                          			<span>memberships</span>
	                          		</div>
                          		</div>
                          		
                          		
                           </c:if>
                        <c:if test="${sessionScope.role != 'super admin'}"> 
                          	
                       	
                       <%-- 	<c:set var="customerRetention" value="false"/>
                       	<c:forEach var="accessControl" items="${sessionScope.CustomerLoyality}">
                       		<c:if test="${accessControl.appDocument == 'CustomerRetention' && accessControl.write == true && accessControl.read == false}"> 
                       		 <c:set var="giftVoucher" value="true"/>
                       			<div class="col-lg-2" style="text-align: right;">
	                          		<div style="text-align: center;width: 130px;height: 130px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="return viewNewGiftVoucher('CustomerRetention');" title="<spring:message code="customer.retention.label" />">
	                          			<img src="${pageContext.request.contextPath}/images/customerretention.png" style="margin-top: 10px;"><br><br>
	                          			<span><spring:message code="customer.retention.label" /></span>
	                          		</div>
	                          	</div>
                       		</c:if>
                        	<c:if test="${accessControl.appDocument == 'CustomerRetention' && customerRetention == false}"> 
	                          	<div class="col-lg-2" style="text-align: right;">
	                          		<div style="text-align: center;width: 130px;height: 130px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="viewcustomerRetention('customerretention','CustomerRetention','0','menu');" title="<spring:message code="customer.retention.label" />">
	                          			<img src="${pageContext.request.contextPath}/images/customerretention.png" style="margin-top: 10px;"><br><br>
	                          			<span><spring:message code="customer.retention.label" /></span>
	                          		</div>
	                          	</div>
                       		</c:if>
                       	</c:forEach>
                       	<c:set var="customerPatterns" value="false"/>
                       	<c:forEach var="accessControl" items="${sessionScope.CustomerLoyality}">
                       		<c:if test="${accessControl.appDocument == 'CustomerPatterns' && accessControl.write == true && accessControl.read == false}"> 
                       			<c:set var="customerPatterns" value="true"/>
                       			<div class="col-lg-2">
                          		<div style="text-align: center;width: 130px;height: 130px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="return viewNewGiftCoupons('CustomerPatterns');" title="<spring:message code="customer.patterns.label" />">
                          			<img src="${pageContext.request.contextPath}/images/customerpatterns.png" style="margin-top: 10px;"><br><br>
                          			<span><spring:message code="loyality.coupons.label" /></span>
                          		</div>
                          	</div>
                       		</c:if>
                        	<c:if test="${accessControl.appDocument == 'CustomerPatterns' && customerPatterns==false}"> 
                       			<div class="col-lg-2">
                          		<div style="text-align: center;width: 130px;height: 130px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="viewcustomerPatterns('customerPatterns','CustomerPatterns','0','menu');" title="<spring:message code="customer.patterns.label" />">
                          			<img src="${pageContext.request.contextPath}/images/customerpatterns.png" style="margin-top: 10px;"><br><br>
                          			<span><spring:message code="customer.patterns.label" /></span>
                          		</div>
                          	</div>
                       		</c:if>
                       	</c:forEach> --%>
                       	
                       	 <c:set var="loyaltyCard" value="false"/>
                       	<c:forEach var="accessControl" items="${sessionScope.CustomerLoyality}">
                       		<c:if test="${accessControl.appDocument == 'Loyaltycards' && accessControl.write == true && accessControl.read == false}">
                       			<c:set var="loyaltyCard" value="true"/> 
                       			<div class="col-lg-2" style="text-align: left;">
                          		<div style="text-align: center;width: 130px;height: 130px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="return viewNewLoyaltyCard('newLoyalty');" title="<spring:message code="loyaltycards.label" />">
                          			<img src="${pageContext.request.contextPath}/images/LoyaltyCards.jpg" style="margin-top: 10px;"><br><br>
                          			<span><spring:message code="loyaltycards.label" /></span>
                          		</div>
                          	</div>
                       		</c:if>
                        	<c:if test="${accessControl.appDocument == 'Loyaltycards' && loyaltyCard == false}"> 
                       			<div class="col-lg-2" style="text-align: left;">
	                          		<div style="text-align: center;width: 130px;height: 130px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="viewLoyaltyCards('loyaltyCards','Loyaltycards','0','menu')" title="<spring:message code="loyaltycards.label" />">
	                          			<img src="${pageContext.request.contextPath}/images/LoyaltyCards.jpg" style="margin-top: 10px;"><br><br>
	                          			<span><spring:message code="loyaltycards.label" /></span>
	                          		</div>
                          		</div>
                       		</c:if>
                       	</c:forEach>
                       	
                       		<c:set var="giftCoupon" value="false"/>
                       	<c:forEach var="accessControl" items="${sessionScope.CustomerLoyality}">
                       		<c:if test="${accessControl.appDocument == 'GiftCoupons' && accessControl.write == true && accessControl.read == false}"> 
                       			<c:set var="giftCoupon" value="true"/>
                       			<div class="col-lg-2">
                          		<div style="text-align: center;width: 130px;height: 130px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="return viewNewGiftCoupons('newCoupon');" title="<spring:message code="loyality.coupons.label" />">
                          			<img src="${pageContext.request.contextPath}/images/Coupons.jpg" style="margin-top: 10px;"><br><br>
                          			<span><spring:message code="loyality.coupons.label" /></span>
                          		</div>
                          	</div>
                       		</c:if>
                        	<c:if test="${accessControl.appDocument == 'GiftCoupons' && giftCoupon==false}"> 
                       			<div class="col-lg-2">
                          		<div style="text-align: center;width: 130px;height: 130px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="viewGiftCoupons('giftCoupons','GiftCoupons','0','menu');" title="<spring:message code="loyality.coupons.label" />">
                          			<img src="${pageContext.request.contextPath}/images/Coupons.jpg" style="margin-top: 10px;"><br><br>
                          			<span><spring:message code="loyality.coupons.label" /></span>
                          		</div>
                          	</div>
                       		</c:if>
                       	</c:forEach>
                       	 
                       	 <c:set var="giftVoucher" value="false"/>
                       	<c:forEach var="accessControl" items="${sessionScope.CustomerLoyality}">
                       		<c:if test="${accessControl.appDocument == 'GiftVoucher' && accessControl.write == true && accessControl.read == false}"> 
                       		 <c:set var="giftVoucher" value="true"/>
                       			<div class="col-lg-2" style="text-align: right;">
	                          		<div style="text-align: center;width: 130px;height: 130px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="return viewNewGiftVoucher('GiftVoucher');" title="<spring:message code="loyality.giftvouchers.label" />">
	                          			<img src="${pageContext.request.contextPath}/images/GiftVouchure.jpg" style="margin-top: 10px;"><br><br>
	                          			<span><spring:message code="loyality.giftvouchers.label" /></span>
	                          		</div>
	                          	</div>
                       		</c:if>
                        	<c:if test="${accessControl.appDocument == 'GiftVoucher' && giftVoucher == false}"> 
	                          	<div class="col-lg-2" style="text-align: right;">
	                          		<div style="text-align: center;width: 130px;height: 130px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="viewGiftVouchers('giftVouchers','GiftVoucher','0','menu');" title="<spring:message code="loyality.giftvouchers.label" />">
	                          			<img src="${pageContext.request.contextPath}/images/GiftVouchure.jpg" style="margin-top: 10px;"><br><br>
	                          			<span><spring:message code="loyality.giftvouchers.label" /></span>
	                          		</div>
	                          	</div>
                       		</c:if>
                       	</c:forEach>
                       
                       <c:set var="Memberships" value="false"/>
                           	<c:forEach var="accessControl" items="${sessionScope.CustomerLoyality}" >
                            	<c:if test="${accessControl.appDocument == 'Memberships' && Memberships==false}"> 
                       			<div class="col-lg-2" style="text-align: left;">
	                          		<div style="text-align: center;width: 130px;height: 130px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="viewMemberships('membership','Memberships','0','menu');" title="memberships">
	                          			<img src="${pageContext.request.contextPath}/images/imagentavl.png" style="margin-top: -30px; padding: 34px 12px 0px 59px; margin-left: -33%;"><br><br>
	                          			<span>Memberships</span>
	                          		</div>
                          		</div>
                       		</c:if>
                       	</c:forEach>
                       	
                       		
                       	<c:set var="wallets" value="false"/>
                            <c:forEach var="accessControl" items="${sessionScope.CustomerLoyality}" >
	                            		<c:if test="${accessControl.appDocument == 'Wallets' && wallets==false}"> 
								     	   <div class="col-lg-2" style="text-align: left;">
		                 		        <div style="text-align: center;width: 130px;height: 130px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="viewWallets('wallet','Wallet','0','menu');" title="Wallet">
	                          			<img src="${pageContext.request.contextPath}/images/imagentavl.png" style="margin-top: -30px; padding: 34px 12px 0px 59px; margin-left: -33%;"><br><br>
	                          			<span>Wallet</span>
	                          		</div>
		                          	</div>
								      	</c:if>
								     </c:forEach>
                       	
                       	</div>
                       	<br>
                       	<br>
                       	<div class="row" style="text-align: left;">
                       		
                       <%--  <c:set var="loyalityRewards" value="false"/>
                       	<c:forEach var="accessControl" items="${sessionScope.CustomerLoyality}">
                       		<c:if test="${accessControl.appDocument == 'LoyalityRewards' && accessControl.write == true && accessControl.read == false}">
                       			<c:set var="loyalityRewards" value="true"/> 
                       			<div class="col-lg-2" style="text-align: left;">
                          		<div style="text-align: center;width: 130px;height: 130px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="return viewNewLoyaltyCard('newLoyalty');" title="<spring:message code="loyality.rewards.label" />">
                          			<img src="${pageContext.request.contextPath}/images/loyalityreward.png" style="margin-top: 10px;"><br><br>
                          			<span><spring:message code="loyality.rewards.label" /></span>
                          		</div>
                          	</div>
                       		</c:if>
                        	<c:if test="${accessControl.appDocument == 'LoyalityRewards' && loyalityRewards == false}"> 
                       			<div class="col-lg-2" style="text-align: left;">
	                          		<div style="text-align: center;width: 130px;height: 130px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="viewloyalityRewards('loyalityRewards','LoyalityRewards','0','menu')" title="<spring:message code="loyality.rewards.label" />">
	                          			<img src="${pageContext.request.contextPath}/images/loyalityreward.png" style="margin-top: 10px;"><br><br>
	                          			<span><spring:message code="loyality.rewards.label" /></span>
	                          		</div>
                          		</div>
                       		</c:if>
                       	</c:forEach> --%>
                       		
                       		
                       	 
                        	
                       	
                           	<c:set var="subscriptions" value="false"/>
                           	<c:forEach var="accessControl" items="${sessionScope.CustomerLoyality}" >
                            	<c:if test="${accessControl.appDocument == 'Subscription' && subscriptions==false}">
                           				<div class="col-lg-2" style="text-align: left;">
	                          		<div style="text-align: center;width: 130px;height: 130px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="viewSubscriptions('subscriptions','subscription','0','menu');" title="Subscription">
	                          			<img src="${pageContext.request.contextPath}/images/imagentavl.png" style="margin-top: -30px; padding: 34px 12px 0px 59px; margin-left: -33%;"><br><br>
	                          			<span>Subscription</span>
	                          		</div>
                          		</div>
                          	</c:if>
                           	</c:forEach>
                           	
                          	<div class="col-lg-2" style="text-align: left;"></div>
                          	<div class="col-lg-2" style="text-align: left;"></div>
                          </c:if>
                          </div>
                         
</body>
</html>