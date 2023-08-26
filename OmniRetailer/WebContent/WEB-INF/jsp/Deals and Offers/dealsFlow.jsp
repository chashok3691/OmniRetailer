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
		                          		<div style="text-align: center;width: 140px;height: 130px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="viewsocialMediaCampaigns('socialmediacampaigns','socialMediaCampaign','0','menu')" title="<spring:message code="socialmediacampaigns.label" />">
		                          			<img src="${pageContext.request.contextPath}/images/promotions.png" style="margin-top: 10px;"><br><br>
		                          			<spring:message code="promotions.label" />
		                          		</div>
		                          	</div>
                            	
	                          	<div class="col-lg-2" style="text-align: right;">
		                          		<div style="text-align: center;width: 140px;height: 130px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="viewsocialMediaCampaigns('socialmediacampaigns','socialMediaCampaign','0','menu')" title="<spring:message code="socialmediacampaigns.label" />">
		                          			<img src="${pageContext.request.contextPath}/images/socialmediacampaigns.png" style="margin-top: 10px;"><br><br>
		                          			<spring:message code="socialmediacampaigns.label" />
		                          		</div>
		                          	</div>
									<div class="col-lg-2" style="text-align: right;">
		                          		<div style="text-align: center;width: 140px;height: 130px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="viewemailCampaigns('emailcampaigns','EmailCampaign','0','menu')" title="<spring:message code="emailcampaigns.label" />">
		                          			<img src="${pageContext.request.contextPath}/images/emailcampaigns.png" style="margin-top: 10px;"><br><br>
		                          			<spring:message code="emailcampaigns.label" />
		                          		</div>
		                          	</div>
									<div class="col-lg-2" style="text-align: right;">
		                          		<div style="text-align: center;width: 140px;height: 130px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="viewmobileCampaigns('mobilecampaigns','MobileCampaign','0','menu')" title="<spring:message code="mobilecampaigns.label" />">
		                          			<img src="${pageContext.request.contextPath}/images/mobilecampaigns.png" style="margin-top: 10px;"><br><br>
		                          			<spring:message code="mobilecampaigns.label" />
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
		                          	
		                          	<div class="col-lg-2" style="text-align: right;">
		                          		<div style="text-align: center;width: 140px;height: 130px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="viewCustomerNotifications('customerNotifications');" title="Customernotification">
		                          			<img src="${pageContext.request.contextPath}/images/imagentavl.png" style="margin-top: -30px; padding: 34px 12px 0px 59px; margin-left: -33%;"><br><br>
		                          			<span>Customer Notification</span>
		                          		</div>
		                          	</div>
										
	                          
                            </c:if>
                             <c:if test="${sessionScope.role != 'super admin'}">
                           <c:forEach var="accessControl" items="${sessionScope.dealsAndOffers}" varStatus="thCount" >
                         <c:if test="${thCount.count == 1}"> 
	                          	<div class="col-lg-2 form-group" style="text-align: right;">
	                          		<div style="text-align: center;width: 120px;height: 120px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="showPromotionsFlow();" title="<spring:message code="promotions.label" />">
	                          		<img src="${pageContext.request.contextPath}/images/promotions.png" style="margin-top: 10px;"><br><br>
	                          		<spring:message code="promotions.label" />
	                          			 <c:set var="counts" value="${counts+1}" />	
	                          		</div>
	                          	</div>
	                         </c:if>
                        </c:forEach>
                    
                        
	                      <%--  <c:set var="socialmediacampaigns" value="false"/>
                           <c:forEach var="accessControl" items="${sessionScope.dealsAndOffers}" >
                           		<c:if test="${accessControl.appDocument == 'socialMediaCampaign' && accessControl.write == true && accessControl.read == false}"> 
                           			<c:set var="socialmediacampaigns" value="true"/>
                           			<div class="col-lg-2" style="text-align: right;">
		                          		<div style="text-align: center;width: 140px;height: 130px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="createNewOffer('offersConfigurations');" title="<spring:message code="socialmediacampaigns.label" />">
		                          			<img src="${pageContext.request.contextPath}/images/socialmediacampaigns.png" style="margin-top: 10px;"><br><br>
		                          			<spring:message code="socialmediacampaigns.label" />
		                          		</div>
		                          	</div>
                           		</c:if>
                            	<c:if test="${accessControl.appDocument == 'socialMediaCampaign' && socialmediacampaigns==false}"> 
                           			<div class="col-lg-2" style="text-align: right;">
		                          		<div style="text-align: center;width: 140px;height: 130px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="viewsocialMediaCampaigns('socialmediacampaigns','socialMediaCampaign','0','menu')" title="<spring:message code="socialmediacampaigns.label" />">
		                          			<img src="${pageContext.request.contextPath}/images/socialmediacampaigns.png" style="margin-top: 10px;"><br><br>
		                          			<spring:message code="socialmediacampaigns.label" />
		                          		</div>
		                          	</div>
                           		</c:if>
	                      </c:forEach>
	                       <c:set var="emailcampaigns" value="false"/>
                           <c:forEach var="accessControl" items="${sessionScope.dealsAndOffers}" >
                           		<c:if test="${accessControl.appDocument == 'EmailCampaign' && accessControl.write == true && accessControl.read == false}"> 
                           			<c:set var="emailcampaigns" value="true"/>
                           			<div class="col-lg-2" style="text-align: right;">
		                          		<div style="text-align: center;width: 140px;height: 130px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="createNewOffer('EmailCampaign');" title="<spring:message code="emailcampaigns.label" />">
		                          			<img src="${pageContext.request.contextPath}/images/emailcampaigns.png" style="margin-top: 10px;"><br><br>
		                          			<spring:message code="emailcampaigns.label" />
		                          		</div>
		                          	</div>
                           		</c:if>
                            	<c:if test="${accessControl.appDocument == 'EmailCampaign' && emailcampaigns==false}"> 
                           			<div class="col-lg-2" style="text-align: right;">
		                          		<div style="text-align: center;width: 140px;height: 130px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="viewemailCampaigns('emailcampaigns','EmailCampaign','0','menu')" title="<spring:message code="emailcampaigns.label" />">
		                          			<img src="${pageContext.request.contextPath}/images/emailcampaigns.png" style="margin-top: 10px;"><br><br>
		                          			<spring:message code="emailcampaigns.label" />
		                          		</div>
		                          	</div>
                           		</c:if>
	                      </c:forEach>
	                       <c:set var="mobilecampaigns" value="false"/>
                           <c:forEach var="accessControl" items="${sessionScope.dealsAndOffers}" >
                           		<c:if test="${accessControl.appDocument == 'MobileCampaign' && accessControl.write == true && accessControl.read == false}"> 
                           			<c:set var="mobilecampaigns" value="true"/>
                           			<div class="col-lg-2" style="text-align: right;">
		                          		<div style="text-align: center;width: 140px;height: 130px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="createNewOffer('offersConfigurations');" title="<spring:message code="mobilecampaigns.label" />">
		                          			<img src="${pageContext.request.contextPath}/images/mobilecampaigns.png" style="margin-top: 10px;"><br><br>
		                          			<spring:message code="mobilecampaigns.label" />
		                          		</div>
		                          	</div>
                           		</c:if>
                            	<c:if test="${accessControl.appDocument == 'MobileCampaign' && mobilecampaigns==false}"> 
                           			<div class="col-lg-2" style="text-align: right;">
		                          		<div style="text-align: center;width: 140px;height: 130px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="viewmobileCampaigns('mobilecampaigns','MobileCampaign','0','menu')" title="<spring:message code="mobilecampaigns.label" />">
		                          			<img src="${pageContext.request.contextPath}/images/mobilecampaigns.png" style="margin-top: 10px;"><br><br>
		                          			<spring:message code="mobilecampaigns.label" />
		                          		</div>
		                          	</div>
                           		</c:if>
	                      </c:forEach> --%>
	                      <%--  <c:set var="Customernotification" value="false"/>
	                        <c:forEach var="accessControl" items="${sessionScope.dealsAndOffers}" >
	                        <c:if test="${accessControl.appDocument == 'CustomerNotification' && accessControl.write == true && accessControl.read == true}">
	                            
                           		<c:if test="${accessControl.appDocument == 'MobileCampaign' && accessControl.write == true && accessControl.read == false}"> 
                           			<c:set var="mobilecampaigns" value="true"/>
                           			<div class="col-lg-2" style="text-align: right;">
		                          		<div style="text-align: center;width: 140px;height: 130px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="createCustomerNotifications('CustomerNotifications');" title="<spring:message code="mobilecampaigns.label" />">
		                          			<img src="${pageContext.request.contextPath}/images/imagentavl.png" style="margin-top: -30px; padding: 34px 12px 0px 59px; margin-left: -33%;"><br><br>
		                          			<span>Customer Notification</span>
		                          		</div>
		                          	</div>
                           		</c:if>
                           			
                            	<c:if test="${accessControl.appDocument == 'CustomerNotification' && Customernotification==false}"> 
                           			<div class="col-lg-2" style="text-align: right;">
		                          		<div style="text-align: center;width: 140px;height: 130px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="viewCustomerNotifications('customerNotifications');" title="Customernotification">
		                          			<img src="${pageContext.request.contextPath}/images/imagentavl.png" style="margin-top: -30px; padding: 34px 12px 0px 59px; margin-left: -33%;"><br><br>
		                          			<span>Customer Notification</span>
		                          		</div>
		                          	</div>
                           		</c:if>
	                      </c:forEach> --%>
	                      
	                      <c:forEach var="accessControl" items="${sessionScope.crm}">
                             	  <c:if test="${accessControl.appDocument == 'CustomerNotification' && accessControl.write == true && accessControl.read == true}">
	                            <div class="col-lg-2" style="text-align: right;">
		                          		<div style="text-align: center;width: 140px;height: 130px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="viewCustomerNotifications('customerNotifications');" title="Customernotification">
		                          			<img src="${pageContext.request.contextPath}/images/imagentavl.png" style="margin-top: -30px; padding: 34px 12px 0px 59px; margin-left: -33%;"><br><br>
		                          			<span>Customer Notification</span>
		                          		</div>
		                          	</div>
	                              </c:if>
	                            </c:forEach>
	                      
	                      
	                      </div>
	                      <br>
	                      <div class="row">
	                      <%--  
	                       <c:set var="promotions" value="false"/>
                           <c:forEach var="accessControl" items="${sessionScope.dealsAndOffers}" >
                           		<c:if test="${accessControl.appDocument == 'Promotion' && accessControl.write == true && accessControl.read == false}"> 
                           			<c:set var="promotions" value="true"/>
                           			<div class="col-lg-2" style="text-align: right;">
		                          		<div style="text-align: center;width: 140px;height: 130px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="createNewOffer('offersConfigurations');" title="<spring:message code="promotions.label" />">
		                          			<img src="${pageContext.request.contextPath}/images/promotions.png" style="margin-top: 10px;"><br><br>
		                          			<spring:message code="promotions.label" />
		                          		</div>
		                          	</div>
                           		</c:if>
                            	<c:if test="${accessControl.appDocument == 'Promotion' && promotions==false}"> 
                           			<div class="col-lg-2" style="text-align: right;">
		                          		<div style="text-align: center;width: 140px;height: 130px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="viewpromotions('promotions','Promotion','0','menu')" title="<spring:message code="promotions.label" />">
		                          			<img src="${pageContext.request.contextPath}/images/promotions.png" style="margin-top: 10px;"><br><br>
		                          			<spring:message code="promotions.label" />
		                          		</div>
		                          	</div>
                           		</c:if>
	                      </c:forEach> --%>
	                     
	                      </c:if>
                          	</div>     
                        
                    
                          
</body>
</html>