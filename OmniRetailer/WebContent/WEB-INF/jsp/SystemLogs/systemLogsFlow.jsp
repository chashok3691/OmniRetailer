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
                          <c:if test="${sessionScope.role == 'super admin'}">
                          <div class="row">
                          		<div class="col-lg-2 form-group" style="text-align: right;">
	                          		<div style="text-align: center;width: 140px;height: 130px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="return viewApplicationLog('applicationLog','0');" title="<spring:message code="application.log.label" />">
	                          			<img src="${pageContext.request.contextPath}/images/ApplicationLog.png" style="margin-top: 10px;"><br><br>
	                          			<span><spring:message code="application.log.label" /></span>
	                          			<%-- <span><spring:message code="masters_label" /></span> --%>
	                          		</div>
	                          	</div>
	                          	
	                          	<div class="col-lg-2 form-group" style="text-align: right;">
                          			<div style="text-align: center;width: 140px;height: 130px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="return viewExportLog('exportLog','0');" title="<spring:message code="export.log.label" />">
	                          			<img src="${pageContext.request.contextPath}/images/SecurityLog.png" style="margin-top: 10px;"><br><br>
	                          			<span><spring:message code="export.log.label" /></span>
	                          			<%-- <span><spring:message code="masters_label" /></span> --%>
	                          		</div>
                          		</div>
	                          	
	                          	<div class="col-lg-2 form-group" style="text-align: right;">
                          			<div style="text-align: center;width: 140px;height: 130px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="return viewSecurityLog('securityLog');" title="<spring:message code="security.log.label" />">
	                          			<img src="${pageContext.request.contextPath}/images/SecurityLog.png" style="margin-top: 10px;"><br><br>
	                          			<span><spring:message code="security.log.label" /></span>
	                          			<%-- <span><spring:message code="masters_label" /></span> --%>
	                          		</div>
                          		</div>
                          		<div class="col-lg-2 form-group" style="text-align: right;">
                          			<div style="text-align: center;width: 140px;height: 130px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="return viewUserLog('userLog');" title="<spring:message code="user.log.label" />">
	                          			<img src="${pageContext.request.contextPath}/images/UserLog.png" style="margin-top: 10px;"><br><br>
	                          			<span><spring:message code="user.log.label" /></span>
	                          			<%-- <span><spring:message code="masters_label" /></span> --%>
	                          		</div>
                          		</div>
                          		<div class="col-lg-2 form-group" style="text-align: right;">
                          			<div style="text-align: center;width: 140px;height: 130px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="return viewAdminstrationLog('administrationLog');" title="<spring:message code="administration.log.label" />">
	                          			<img src="${pageContext.request.contextPath}/images/AdministrationLog.png" style="margin-top: 10px;"><br><br>
	                          			<span><spring:message code="administration.log.label" /></span>
	                          		</div>
                          		</div>
                          		
                          			<div class="col-lg-2 form-group" style="text-align: right;">
                          			<div style="text-align: center;width: 140px;height: 130px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="return viewExportLog('exportLog','0');" title="Export Log">
	                          			<img src="${pageContext.request.contextPath}/images/imagentavl.png" style="margin-top: -30px; padding: 34px 12px 0px 59px; margin-left: -33%;"><br><br>
	                          			<span>Export Log</span>
	                          		</div>
                          		</div>
                           </div>
                          </c:if>
                          <c:if test="${sessionScope.role != 'super admin'}">
                          <div class="row">
                             <c:forEach var="accessControl" items="${sessionScope.systemLog}">
                             		<c:if test="${accessControl.appDocument == 'ApplicationLog'}"> 	
                             		 	<div class="col-lg-2 form-group" style="text-align: right;">
			                          		<div style="text-align: center;width: 140px;height: 130px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="return viewApplicationLog('applicationLog','0');" title="<spring:message code="application.log.label" />">
			                          			<img src="${pageContext.request.contextPath}/images/ApplicationLog.png" style="margin-top: 10px;"><br><br>
			                          			<span><spring:message code="application.log.label" /></span>
			                          		</div>
			                          	</div>
                            		</c:if>
                            </c:forEach>
                          <c:forEach var="accessControl" items="${sessionScope.systemLog}">
                             <c:if test="${accessControl.appDocument == 'SystemLog'}"> 	
                          		<div class="col-lg-2 form-group" style="text-align: right;">
                          			<div style="text-align: center;width: 140px;height: 130px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="return viewSecurityLog('securityLog');" title="<spring:message code="security.log.label" />">
	                          			<img src="${pageContext.request.contextPath}/images/SecurityLog.png" style="margin-top: 10px;"><br><br>
	                          			<span><spring:message code="security.log.label" /></span>
	                          		</div>
                          		</div>
	                          </c:if>
	                      </c:forEach>
	                      <c:forEach var="accessControl" items="${sessionScope.systemLog}">
                             <c:if test="${accessControl.appDocument == 'UserLog'}"> 	    	
                          		<div class="col-lg-2 form-group" style="text-align: right;">
                          			<div style="text-align: center;width: 140px;height: 130px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="return viewUserLog('userLog');" title="<spring:message code="user.log.label" />">
	                          			<img src="${pageContext.request.contextPath}/images/UserLog.png" style="margin-top: 10px;"><br><br>
	                          			<span><spring:message code="user.log.label" /></span>
	                          		</div>
                          		</div>
                          	</c:if>
                         </c:forEach>
                         <c:forEach var="accessControl" items="${sessionScope.systemLog}">
                             <c:if test="${accessControl.appDocument == 'AdministrationLog'}"> 	   
                          		<div class="col-lg-2 form-group" style="text-align: right;">
                          			<div style="text-align: center;width: 140px;height: 130px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="return viewAdminstrationLog('administrationLog');" title="<spring:message code="administration.log.label" />">
	                          			<img src="${pageContext.request.contextPath}/images/AdministrationLog.png" style="margin-top: 10px;"><br><br>
	                          			<span><spring:message code="administration.log.label" /></span>
	                          		</div>
                          		</div>
                          	</c:if>
                         </c:forEach>
                             <c:forEach var="accessControl" items="${sessionScope.systemLog}">
                             <c:if test="${accessControl.appDocument == 'ExportLog'}"> 	   
                          		<div class="col-lg-2 form-group" style="text-align: right;">
                          			<div style="text-align: center;width: 140px;height: 130px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="return viewExportLog('exportLog','0');" title="Export Log">
	                          			<img src="${pageContext.request.contextPath}/images/imagentavl.png" style="margin-top: -30px; padding: 34px 12px 0px 59px; margin-left: -33%;"><br><br>
	                          			<span>Export Log</span>
	                          		</div>
                          		</div>
                          	</c:if>
                         </c:forEach>
                         </div>
		                </c:if>
                          
</body>
</html>