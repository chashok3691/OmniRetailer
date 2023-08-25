<!--/*
 * Project Name 	        : OmniRetailerCustomer
 * Written By		        : Sahitya
 * file name		        : Admin/genericdata/shiftManagementFlows
 * file type		        : JSP
 * description				: display shift management flows information
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
				<%-- <section class="content-header">
                   <h1><spring:message code="masters.label" />
                    <small><spring:message code="shift.master.label" /></small>
                   </h1>
                   <ol class="breadcrumb">
                    <li><a style="cursor: pointer;" onclick="return viewDashboard('inventorymanager');"><i class="fa fa-dashboard"></i><spring:message code="home.label" /></a></li>
                        <li class="active"><spring:message code="shift.management.label"/></li>
                   </ol>
                </section> --%>
                
                          <br>
                          <div class="row">
                           <c:if test="${sessionScope.role == 'super admin'}"> 
                           		<div class="col-lg-2" style="text-align: right;">
		                          		<div style="text-align: center;width: 120px;height: 120px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="return viewoutletVedeioMonitoring('OutletMonitoringVedio','0');" title="OutletvideoStream">
		                          			<img src="${pageContext.request.contextPath}/images/imagentavl.png" style="margin-top: -30px; padding: 34px 12px 0px 59px; margin-left: -33%;"><br><br>
		                          			<span>OutletVideoStream</span>
		                          		</div>
                          			</div>
                         			<div class="col-lg-2" style="text-align: right;">
		                          		<div style="text-align: center;width: 120px;height: 120px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="return viewoutletMonitoring('OutletMonitoring','0');" title="outlet tracking">
		                          			<img src="${pageContext.request.contextPath}/images/imagentavl.png" style="margin-top: -30px; padding: 34px 12px 0px 59px; margin-left: -33%;"><br><br>
		                          			<span>Outlet Tracking</span>
		                          		</div>
                          			</div>
                          			
                          			<div class="col-lg-2" style="text-align: right;">
		                          		<div style="text-align: center;width: 120px;height: 120px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="return viewoutletNewSynchStatus('OutletNewSynchStatus','0');" title="outlet synch status">
		                          			<img src="${pageContext.request.contextPath}/images/imagentavl.png" style="margin-top: -30px; padding: 34px 12px 0px 59px; margin-left: -33%;"><br><br>
		                          			<span>Outlet synch status</span>
		                          		</div>
                          			</div>
                          			
                          			<div class="col-lg-2" style="text-align: right;">
		                          		<div style="text-align: center;width: 120px;height: 120px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="return viewoutletUserLog('OutletMonitoringUserLog','0');" title="Usage Log">
		                          			<img src="${pageContext.request.contextPath}/images/imagentavl.png" style="margin-top: -30px; padding: 34px 12px 0px 59px; margin-left: -33%;"><br><br>
		                          			<span>Usage Log</span>
		                          		</div>
                          			</div>
                          			
                          			<div class="col-lg-2" style="text-align: right;">
		                          		<div style="text-align: center;width: 120px;height: 120px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="return viewoutletSynchStatus('outletSynchStatus','0');" title="Outlet Log">
		                          			<img src="${pageContext.request.contextPath}/images/imagentavl.png" style="margin-top: -30px; padding: 34px 12px 0px 59px; margin-left: -33%;"><br><br>
		                          			<span>Outlet Log</span>
		                          		</div>
                          			</div>
                           </c:if>
                           
                               <c:if test="${flowunder == 'outlet'}">
                          <c:set var="OutletMonitoringVedio" value="false"/>
                             <c:forEach var="accessControl" items="${sessionScope.outletMonitoring}">
                            	
                            	<c:if test="${accessControl.appDocument == 'OutletVedioStatus' && OutletMonitoringVedio == false}"> 
                            	 <c:set var="OutletMonitoringVedio" value="false"/>		
                           			<div class="col-lg-2" style="text-align: right;">
		                          		<div style="text-align: center;width: 120px;height: 120px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="return viewoutletVedeioMonitoring('OutletMonitoringVedio','0');" title="OutletvideoStream">
		                          			<img src="${pageContext.request.contextPath}/images/imagentavl.png" style="margin-top: -30px; padding: 34px 12px 0px 59px; margin-left: -33%;"><br><br>
		                          			<span>OutletVideoStream</span>
		                          		</div>
                          			</div>
                           		</c:if>
                            </c:forEach> 		
                             <c:set var="OutletMonitoringVedio" value="false"/>
                             <c:forEach var="accessControl" items="${sessionScope.outletMonitoring}">
                             	<c:if test="${accessControl.appDocument == 'OutletTracking' && OutletMonitoringVedio == false}">
                            		<c:set var="OutletMonitoringVedio" value="false"/>
                           			<div class="col-lg-2" style="text-align: right;">
		                          		<div style="text-align: center;width: 120px;height: 120px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="return viewoutletMonitoring('OutletMonitoring','0');" title="outlet tracking">
		                          			<img src="${pageContext.request.contextPath}/images/imagentavl.png" style="margin-top: -30px; padding: 34px 12px 0px 59px; margin-left: -33%;"><br><br>
		                          			<span>Outlet Tracking</span>
		                          		</div>
                          			</div>
                            	</c:if>
                            </c:forEach>
                              <c:set var="OutletMonitoringVedio" value="false"/>
                              <c:forEach var="accessControl" items="${sessionScope.outletMonitoring}">
                             	<c:if test="${accessControl.appDocument == 'OutletSynchStatusMonitoring' && OutletMonitoringVedio == false}">
                            		<c:set var="OutletMonitoringVedio" value="false"/>
                           			<div class="col-lg-2" style="text-align: right;">
		                          		<div style="text-align: center;width: 120px;height: 120px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="return viewoutletNewSynchStatus('OutletNewSynchStatus','0');" title="outlet synch status">
		                          			<img src="${pageContext.request.contextPath}/images/imagentavl.png" style="margin-top: -30px; padding: 34px 12px 0px 59px; margin-left: -33%;"><br><br>
		                          			<span>Outlet synch status</span>
		                          		</div>
                          			</div>
                            	</c:if>
                            </c:forEach>
                             <c:set var="OutletMonitoringVedio" value="false"/>
                             <c:forEach var="accessControl" items="${sessionScope.outletMonitoring}">
                             	<c:if test="${accessControl.appDocument == 'OutletMonitoringUserLog' && OutletMonitoringVedio == false}">
                            		<c:set var="OutletMonitoringVedio" value="false"/>
                           			<div class="col-lg-2" style="text-align: right;">
		                          		<div style="text-align: center;width: 120px;height: 120px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="return viewoutletUserLog('OutletMonitoringUserLog','0');" title="Usage Log">
		                          			<img src="${pageContext.request.contextPath}/images/imagentavl.png" style="margin-top: -30px; padding: 34px 12px 0px 59px; margin-left: -33%;"><br><br>
		                          			<span>Usage Log</span>
		                          		</div>
                          			</div>
                            	</c:if>
                            </c:forEach>
                            	
                               <c:set var="OutletMonitoringVedio" value="false"/>
                               <c:forEach var="accessControl" items="${sessionScope.outletMonitoring}">
                             	<c:if test="${accessControl.appDocument == 'OutletMonitoringUserLog' && OutletMonitoringVedio == false}">
                            		<c:set var="OutletMonitoringVedio" value="false"/>
                           			<div class="col-lg-2" style="text-align: right;">
		                          		<div style="text-align: center;width: 120px;height: 120px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="return viewoutletSynchStatus('outletSynchStatus','0');" title="Outlet Log">
		                          			<img src="${pageContext.request.contextPath}/images/imagentavl.png" style="margin-top: -30px; padding: 34px 12px 0px 59px; margin-left: -33%;"><br><br>
		                          			<span>Outlet Log</span>
		                          		</div>
                          			</div>
                            	</c:if>
                            </c:forEach>
                          </c:if>  
                          
                          </div>
</body>
</html>