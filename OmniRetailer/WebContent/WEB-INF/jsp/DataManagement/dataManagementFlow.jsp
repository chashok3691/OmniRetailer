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
	                          		<div style="text-align: center;width: 140px;height: 130px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="return viewBatchOperationsFlow('BatchOperations');" title="<spring:message code="datamanagment.batch.operations" />">
	                          			<img src="${pageContext.request.contextPath}/images/Import.png" style="margin-top: 10px;"><br><br>
	                          			<span><spring:message code="datamanagment.batch.operations" /></span>
	                          		</div>
	                          	</div>
                          		<div class="col-lg-2 form-group" style="text-align: right;">
	                          		<div style="text-align: center;width: 140px;height: 130px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="return viewImportFlow('import');" title="<spring:message code="import.label" />">
	                          			<img src="${pageContext.request.contextPath}/images/Import.png" style="margin-top: 10px;"><br><br>
	                          			<span><spring:message code="import.label" /></span>
	                          		</div>
	                          	</div>
	                          	<div class="col-lg-2 form-group" style="text-align: right;">
                          			<div style="text-align: center;width: 140px;height: 130px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="return viewExports('export');" title="<spring:message code="export.label" />">
	                          			<img src="${pageContext.request.contextPath}/images/Export.png" style="margin-top: 10px;"><br><br>
	                          			<span><spring:message code="export.label" /></span>
	                          		</div>
                          		</div>
                          		<div class="col-lg-2 form-group" style="text-align: right;">
                          			<div style="text-align: center;width: 140px;height: 130px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="return viewBackUP('backup','0');" title="<spring:message code="backup.label" />">
	                          			<img src="${pageContext.request.contextPath}/images/Backup.png" style="margin-top: 10px;"><br><br>
	                          			<span><spring:message code="backup.label" /></span>
	                          		</div>
                          		</div>
                          		<div class="col-lg-2 form-group" style="text-align: right;">
                          			<div style="text-align: center;width: 140px;height: 130px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="return viewRecovery('recovery');" title="<spring:message code="recovery.label" />">
	                          			<img src="${pageContext.request.contextPath}/images/Recovery.png" style="margin-top: 10px;"><br><br>
	                          			<span><spring:message code="recovery.label" /></span>
	                          		</div>
                          		</div>
                           </div>
                          </c:if>
                          <c:if test="${sessionScope.role != 'super admin'}">
                          <div class="row">
                             <c:forEach var="accessControl" items="${sessionScope.dataManagement}">
                             		<c:if test="${accessControl.appDocument == 'BatchOperations'}"> 	
                             		 	<div class="col-lg-2 form-group" style="text-align: right;">
			                          		<div style="text-align: center;width: 140px;height: 130px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="return viewBatchOperationsFlow('BatchOperations');" title="<spring:message code="datamanagment.batch.operations" />">
			                          			<img src="${pageContext.request.contextPath}/images/Import.png" style="margin-top: 10px;"><br><br>
			                          			<span><spring:message code="datamanagment.batch.operations" /></span>
			                          		</div>
			                          	</div>
                            		</c:if>
                            </c:forEach>
                            <c:set var="count" value="0" />
                                <c:forEach var="accessControl" items="${sessionScope.dataManagement}">
                             		<c:if test="${accessControl.appSubflow == 'Import' &&count<1}"> 
                             			<c:set var="count" value="${count + 1}" />
                             		 	<div class="col-lg-2 form-group" style="text-align: right;">
			                          		<div style="text-align: center;width: 140px;height: 130px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="return viewImportFlow('import');" title="<spring:message code="import.label" />">
			                          			<img src="${pageContext.request.contextPath}/images/Import.png" style="margin-top: 10px;"><br><br>
			                          			<span><spring:message code="import.label" /></span>
			                          		</div>
			                          	</div>
                            		</c:if>
                            </c:forEach>
                            <c:set var="count" value="0" />
                          <c:forEach var="accessControl" items="${sessionScope.dataManagement}">
                             <c:if test="${accessControl.appSubflow == 'Export'  &&count<1}"> 	
                             <c:set var="count" value="${count + 1}" />
                          		<div class="col-lg-2 form-group" style="text-align: right;">
                          			<div style="text-align: center;width: 140px;height: 130px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="return viewExports('export');" title="<spring:message code="export.label" />">
	                          			<img src="${pageContext.request.contextPath}/images/Export.png" style="margin-top: 10px;"><br><br>
	                          			<span><spring:message code="export.label" /></span>
	                          		</div>
                          		</div>
	                          </c:if>
	                      </c:forEach>
	                      <c:forEach var="accessControl" items="${sessionScope.dataManagement}">
                             <c:if test="${accessControl.appDocument == 'BackupOperations'}"> 	    	
                          		<div class="col-lg-2 form-group" style="text-align: right;">
                          			<div style="text-align: center;width: 140px;height: 130px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="return viewBackUP('backup','0');" title="<spring:message code="backup.label" />">
	                          			<img src="${pageContext.request.contextPath}/images/Backup.png" style="margin-top: 10px;"><br><br>
	                          			<span><spring:message code="backup.label" /></span>
	                          		</div>
                          		</div>
                          	</c:if>
                         </c:forEach>
                         <c:forEach var="accessControl" items="${sessionScope.dataManagement}">
                             <c:if test="${accessControl.appDocument == 'RecoveryOperations'}"> 	   
                          		<div class="col-lg-2 form-group" style="text-align: right;">
                          			<div style="text-align: center;width: 140px;height: 130px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="return viewRecovery('recovery');" title="<spring:message code="recovery.label" />">
	                          			<img src="${pageContext.request.contextPath}/images/Recovery.png" style="margin-top: 10px;"><br><br>
	                          			<span><spring:message code="recovery.label" /></span>
	                          		</div>
                          		</div>
                          	</c:if>
                         </c:forEach>
                         
                          <div class="row"></div>
                          
                          <c:set var="integrationMonitoring" value="false"/>
                           <c:forEach var="accessControl" items="${sessionScope.dataManagement}">
                           <c:if test="${accessControl.appDocument == 'IntegrationMonitoring'&& integrationMonitoring==false}">
                          		<div class="col-lg-2 form-group" style="text-align: right;">
                          			<div style="text-align: center;width: 140px;height: 130px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="viewIntegrationDashboard('integrationMonitoring','0');" title="Integration Dashboard">
	                          			<img src="${pageContext.request.contextPath}/images/imagentavl.png" style="margin-top: -30px; padding: 34px 12px 0px 59px; margin-left: -33%;"><br><br>
	                     	           <span>Integration Dashboard</span>
	                          		</div>
                          		</div>
                          	</c:if>
                         </c:forEach>
                         
                         <c:forEach var="accessControl" items="${sessionScope.dataManagement}">
                             		<c:if test="${accessControl.appSubflow == 'Export' &&count<1}"> 
                             			<c:set var="count" value="${count + 1}" />
                          		<div class="col-lg-2 form-group" style="text-align: right;">
                          			<div style="text-align: center;width: 140px;height: 130px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onClick="return view('replicationmain');" title="Replication">
	                          		<img src="${pageContext.request.contextPath}/images/imagentavl.png" style="margin-top: -30px; padding: 34px 12px 0px 59px; margin-left: -33%;"><br><br>
	                        			<span>Replication</span>
	                          		</div>
                          		</div>
                          	</c:if>
                     </c:forEach> 
                         
                     <%--  <c:forEach var="accessControl" items="${sessionScope.systemLog}" varStatus="theCount">
		                     <c:if test="${theCount.count == 1}"> 	   
                          		<div class="col-lg-2 form-group" style="text-align: right;">
                          			<div style="text-align: center;width: 140px;height: 130px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="showSystemLogs();" title="System Log">
	                          		<img src="${pageContext.request.contextPath}/images/imagentavl.png" style="margin-top: -30px; padding: 34px 12px 0px 59px; margin-left: -33%;"><br><br>
	                        			<span>System Log</span>
	                          		</div>
                          		</div>
                          	</c:if>
                         </c:forEach> --%>
                         
                         </div>
		                </c:if>
                          
</body>
</html>