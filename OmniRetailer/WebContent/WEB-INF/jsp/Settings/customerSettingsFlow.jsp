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
<div class="row">
                            <br/>
                          <c:if test="${sessionScope.role == 'super admin'}">
                          <div class="row">
                          		<div class="col-lg-2 form-group" style="text-align: right;">
	                          		<div style="text-align: center;width: 140px;height: 130px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="return viewEditCustomerSettings('profile','edit');" title="<spring:message code="profile.settings.label" />">
	                          			<img src="${pageContext.request.contextPath}/images/CompanyProfile.png" style="margin-top: 10px;"><br><br>
	                          			<span><spring:message code="profile.settings.label" /></span>
	                          			<%-- <span><spring:message code="masters_label" /></span> --%>
	                          		</div>
	                          	</div>
	                          	<div class="col-lg-2 form-group" style="text-align: right;">
                          			<div style="text-align: center;width: 140px;height: 130px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="return viewEditMailSettings('email','edit');" title="<spring:message code="email.settings.label" />">
	                          			<img src="${pageContext.request.contextPath}/images/eMailSetting.png" style="margin-top: 10px;"><br><br>
	                          			<span><spring:message code="email.settings.label" /></span>
	                          			<%-- <span><spring:message code="masters_label" /></span> --%>
	                          		</div>
                          		</div>
                          		<div class="col-lg-2 form-group" style="text-align: right;">
                          			<div style="text-align: center;width: 140px;height: 130px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="return viewEditSMSSettings('sms','edit');" title="<spring:message code="sms.settings.label" />">
	                          			<img src="${pageContext.request.contextPath}/images/SMSSettings.png" style="margin-top: 10px;"><br><br>
	                          			<span><spring:message code="sms.settings.label" /></span>
	                          			<%-- <span><spring:message code="masters_label" /></span> --%>
	                          		</div>
                          		</div>
                          		<div class="col-lg-2 form-group" style="text-align: right;">
                          			<div style="text-align: center;width: 140px;height: 130px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="return viewEditPrintSettings('print','edit');" title="<spring:message code="header.and.footer.label" />">
	                          			<img src="${pageContext.request.contextPath}/images/PrintSettings.png" style="margin-top: 10px;"><br><br>
	                          			<span><spring:message code="header.and.footer.label" /></span>
	                          		</div>
                          		</div>
                          		<div class="col-lg-2 form-group" style="text-align: right;">
                          			<div style="text-align: center;width: 140px;height: 130px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="return viewEditUserSecurity('userSecurity','edit')" title="<spring:message code="system.and.security.label" />">
	                          			<img src="${pageContext.request.contextPath}/images/UserSecurity.png" style="margin-top: 10px;"><br><br>
	                          			<span><spring:message code="system.and.security.label" /></span>
	                          		</div>
                          		</div>
                          		<div class="col-lg-2" style="text-align: right;"></div>
                          		</div>
                          		<br><br>
                          	<div class="row">
                          		<div class="col-lg-2 form-group" style="text-align: right;">
                          			<div style="text-align: center;width: 140px;height: 130px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="return viewEditRegionalSettings('regional','edit')" title="<spring:message code="regional.settings.label" />">
	                          			<img src="${pageContext.request.contextPath}/images/RegionalSettings.png" style="margin-top: 10px;"><br><br>
	                          			<span><spring:message code="regional.settings.label" /></span>
	                          		</div>
                          		</div>
                          		<div class="col-lg-2 form-group" style="text-align: right;">
                          			<div style="text-align: center;width: 140px;height: 130px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="return viewEditIntegrationSettings('integration','edit')" title="<spring:message code="integration.settings.label" />">
	                          			<img src="${pageContext.request.contextPath}/images/IntegrationSettings.png" style="margin-top: 10px;"><br><br>
	                          			<span><spring:message code="integration.settings.label" /></span>
	                          		</div>
                          		</div>
                          		<div class="col-lg-2 form-group" style="text-align: right;">
                          			<div style="text-align: center;width: 140px;height: 130px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="return viewEditFTPSettings('ftp','edit')" title="<spring:message code="integration.settings.label" />">
	                          			<img src="${pageContext.request.contextPath}/images/IntegrationSettings.png" style="margin-top: 10px;"><br><br>
	                          			<span><spring:message code="integration.settings.label" /></span>
	                          		</div>
                          		</div>
                          		
                          	</div>
                          </c:if>
                          <c:if test="${sessionScope.role != 'super admin'}">
                          <div class="row">
                          <c:set var="counts" value="0"/>
                             <c:forEach var="accessControl" items="${sessionScope.settings}">
                             		<c:if test="${accessControl.appDocument == 'ProfileSettings'}"> 	
                             		 	<div class="col-lg-2 form-group" style="text-align: right;">
			                          		<div style="text-align: center;width: 140px;height: 130px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="return viewEditCustomerSettings('profile','edit');" title="<spring:message code="profile.settings.label" />">
			                          			<img src="${pageContext.request.contextPath}/images/CompanyProfile.png" style="margin-top: 10px;"><br><br>
			                          			<span><spring:message code="profile.settings.label" /></span>
			                          			<span><spring:message code="masters_label" /></span>
			                          		</div>
			                          	</div>
			                          	<c:set var="counts" value="${counts+1}"/>
                            		</c:if>
                            </c:forEach>
                          <c:forEach var="accessControl" items="${sessionScope.settings}">
                             <c:if test="${accessControl.appDocument == 'EmailSettings'}"> 	
                          		<div class="col-lg-2 form-group" style="text-align: right;">
                          			<div style="text-align: center;width: 140px;height: 130px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="return viewEditMailSettings('email','edit');" title="<spring:message code="email.settings.label" />">
	                          			<img src="${pageContext.request.contextPath}/images/eMailSetting.png" style="margin-top: 10px;"><br><br>
	                          			<span><spring:message code="email.settings.label" /></span>
	                          			<%-- <span><spring:message code="masters_label" /></span> --%>
	                          		</div>
                          		</div>
                          		<c:set var="counts" value="${counts+1}"/>
	                          </c:if>
	                      </c:forEach>
	                      <c:forEach var="accessControl" items="${sessionScope.settings}">
                             <c:if test="${accessControl.appDocument == 'SmsSettings'}"> 	    	
                          		<div class="col-lg-2 form-group" style="text-align: right;">
                          			<div style="text-align: center;width: 140px;height: 130px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="return viewEditSMSSettings('sms','edit');" title="<spring:message code="sms.settings.label" />">
	                          			<img src="${pageContext.request.contextPath}/images/SMSSettings.png" style="margin-top: 10px;"><br><br>
	                          			<span><spring:message code="sms.settings.label" /></span>
	                          			<%-- <span><spring:message code="masters_label" /></span> --%>
	                          		</div>
                          		</div>
                          		<c:set var="counts" value="${counts+1}"/>
                          	</c:if>
                         </c:forEach>
                         
                         
                         
                         
                          <c:forEach var="accessControl" items="${sessionScope.settings}">
                             <c:if test="${accessControl.appDocument == 'WhatsAppSettings'}"> 	    	
                          		<div class="col-lg-2 form-group" style="text-align: right;">
                          			<div style="text-align: center;width: 140px;height: 130px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onClick="viewEditWhatsAppSettings('whatsapp','edit');" title="<spring:message code="whatsapp.settings.label" />">                                                                 
	                          			<img src="${pageContext.request.contextPath}/images/imagentavl.png" style="margin-top: 10px;margin-top: -30px; padding: 34px 12px 0px 59px; margin-left: -33%;"><br><br>
	                          			<span><spring:message code="whatsapp.settings.label" /></span>
	                          		</div>
                          		</div>
                          		<c:set var="counts" value="${counts+1}"/>
                          	</c:if>
                         </c:forEach>
                         
                         
                         <c:forEach var="accessControl" items="${sessionScope.settings}">
                             <c:if test="${accessControl.appDocument == 'PrintSettings'}"> 	   
                          		<div class="col-lg-2 form-group" style="text-align: right;">
                          			<div style="text-align: center;width: 140px;height: 130px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="return viewEditPrintSettings('print','edit');" title="<spring:message code="header.and.footer.label" />">
	                          			<img src="${pageContext.request.contextPath}/images/PrintSettings.png" style="margin-top: 10px;"><br><br>
	                          			<span><spring:message code="header.and.footer.label" /></span>
	                          		</div>
                          		</div>
                          		<c:set var="counts" value="${counts+1}"/>
                          	</c:if>
                         </c:forEach>
                
                  <div class="row"></div>
                         
                         <c:if test="${counts == 5}">
                          		<div class="col-lg-2" style="text-align: right;"></div>
                          		</div>
                          		<div class="row">
                         </c:if>
                         
                          <c:forEach var="accessControl" items="${sessionScope.settings}">
                             <c:if test="${accessControl.appDocument == 'UserSecuritySettings'}"> 	 
                          		<div class="col-lg-2 form-group" style="text-align: right;">
                          			<div style="text-align: center;width: 140px;height: 130px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="return viewEditUserSecurity('userSecurity','edit')" title="<spring:message code="system.and.security.label" />">
	                          			<img src="${pageContext.request.contextPath}/images/UserSecurity.png" style="margin-top: 10px;"><br><br>
	                          			<span><spring:message code="system.and.security.label" /></span>
	                          		</div>
                          		</div>
                          		<c:set var="counts" value="${counts+1}"/>
                          	</c:if>
                         </c:forEach>
                         
                         
                         <c:forEach var="accessControl" items="${sessionScope.settings}">
                             <c:if test="${accessControl.appDocument == 'RegionalSettings'}"> 	
                          		<div class="col-lg-2 form-group" style="text-align: right;">
                          			<div style="text-align: center;width: 140px;height: 130px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="return viewEditRegionalSettings('regional','edit')" title="<spring:message code="regional.settings.label" />">
	                          			<img src="${pageContext.request.contextPath}/images/RegionalSettings.png" style="margin-top: 10px;"><br><br>
	                          			<span><spring:message code="regional.settings.label" /></span>
	                          		</div>
                          		</div>
                          	</c:if>
                        </c:forEach>
                          <c:forEach var="accessControl" items="${sessionScope.settings}">
                             <c:if test="${accessControl.appDocument == 'IntegrationSettings'}"> 	
                          		<div class="col-lg-2 form-group" style="text-align: right;">
                          			<div style="text-align: center;width: 140px;height: 130px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="return viewEditIntegrationSettings('integration','edit')" title="<spring:message code="integration.settings.label" />">
	                          			<img src="${pageContext.request.contextPath}/images/IntegrationSettings.png" style="margin-top: 10px;"><br><br>
	                          			<span><spring:message code="integration.settings.label" /></span>
	                          		</div>
                          		</div>
                          	</c:if>
                        </c:forEach>
                         <%-- <c:forEach var="accessControl" items="${sessionScope.settings}">
                             <c:if test="${accessControl.appDocument == 'FtpSettings'}"> 	
                          		<div class="col-lg-2 form-group" style="text-align: right;">
                          			<div style="text-align: center;width: 140px;height: 130px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="return viewEditFTPSettings('ftp','edit')" title="<spring:message code="integration.settings.label" />">
	                          			<img src="${pageContext.request.contextPath}/images/IntegrationSettings.png" style="margin-top: 10px;"><br><br>
	                          			<span><spring:message code="ftp.settings.label" /></span>
	                          		</div>
                          		</div>
                          	</c:if>
                        </c:forEach> --%>
                        <c:forEach var="accessControl" items="${sessionScope.settings}">
                             <c:if test="${accessControl.appDocument == 'FtpSettings'}"> 	    	
                          		<div class="col-lg-2 form-group" style="text-align: right;">
                          			<div style="text-align: center;width: 140px;height: 130px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onClick="viewEditFTPSettings('ftp','edit');" title="<spring:message code="integration.settings.label" />">                                                                 
	                          			<img src="${pageContext.request.contextPath}/images/imagentavl.png" style="margin-top: 10px;margin-top: -30px; padding: 34px 12px 0px 59px; margin-left: -33%;"><br><br>
	                          			<span><spring:message code="ftp.settings.label" /></span>
	                          		</div>
                          		</div>
                          		<c:set var="counts" value="${counts+1}"/>
                          	</c:if>
                         </c:forEach>
		                </c:if>	
		                </div>	
		                <div class="row"> 		                              
								<div style="margin-left: 70px;border: 1px;margin-right: 50px;margin-top: 20px;margin-bottom: 50px;border-style: solid;border-width: 1px;border-color: lightgray;padding-top: 20px;padding-bottom: 25px;padding-left: 25px;padding-right: 20px;border-radius: 15px;height: 435px;overflow:scroll;overflow-x:hidden;overflow-y:scroll;width: 930px;">	
								<div style="height:450px;"> 							
								<p>Customer Settings allows the Customer to setup Customer Organizational details, Email, SMS, Print, Regional and Integration Settings. This enables the Customer to 
								configure the changes from time-to-time. Omni Retailer platform is designed in a way that the Retailer can run the business with minimum support from TechnoLabs.</p>
								
								<div class="row">
								<div class="col-lg-2">
								<p><u>Profile Settings:</u></p>
								</div>
								<div class="col-lg-10">
								<p>You can configure Logo, Address, Phone and Email ID. These details will be used for further communication between TechnoLabs and the Customer.
								For example, Company Logo image you upload here will be used in every document including POS print. So is the case with address and other details.</p>								
								</div>
								</div>
								
								<div class="row">
								<div class="col-lg-2">
								<p><u>Email Settings:</u></p>
								</div>
								<div class="col-lg-10">
								<p>You can setup SMTP so that emails can be sent both with in and outside. You can also configure Email Templates for each Business Document.
								For example, you can configure Purchase Order Format(PO). All POs to Vendors can be sent in specific format.</p>							
								</div>
								</div>
								
								<div class="row">
								<div class="col-lg-2">
								<p><u>SMS Settings:</u></p>
								</div>
								<div class="col-lg-10">
								<p>Using this flow you can setup your Bulk SMS gateway, dynamically. You can also setup Text and Format for SMS messages you send for various business transactions.</p>							
								</div>
								</div>
									
								<div class="row">
								<div class="col-lg-2">
								<p><u>Print Settings:</u></p>
								</div>
								<div class="col-lg-10">
								<p>Retailer can setup Print Settings for transactional documents. For example, you can setup POS print out format.</p>							
								</div>
								</div>	
								
								<div class="row">
								<div class="col-lg-2">
								<p><u>Regional Settings:</u></p>
								</div>
								<div class="col-lg-10">
								<p>Using this flow, one can setup Regional Settings like Currency, Date, and Number formats.</p>							
								</div>
								</div>	
								
								<div class="row">
								<div class="col-lg-2">
								<p><u>Integration Settings:</u></p>
								</div>
								<div class="col-lg-10">
								<p>Omni Retailer platform offers the ability to setup both Hardware and Software. You can setup POS and other Hasrdware used at Outlet and Warehouse levels. So is
								the case with third party Softwares like SAP, Navision, and other softwares. TechnoLabs will keep adding more connectors</p>							
								</div>
								</div>	
																								
								</div>	
								</div>	
								
								</div>																               		                                        
</body>
</html>