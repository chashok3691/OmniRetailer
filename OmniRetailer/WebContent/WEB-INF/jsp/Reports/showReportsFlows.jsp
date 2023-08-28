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
				<%-- <section class="content-header">
                    <h1>
                       <spring:message code="reports.label"/>
                    </h1>
                    <ol class="breadcrumb">
                    <li><a href="#" onclick="return viewDashboard('inventorymanager');"><i class="fa fa-dashboard"></i><spring:message code="home.label" /></a></li>
                        <li class="active"><spring:message code="reports.label"/></li>
                    </ol>
                </section> --%>
                
                           <%--  <div class="nav-tabs-custom">
                                <ul class="nav nav-tabs">
                             	 <li class=""><a href="#tab_1" data-toggle="tab" onclick=""><spring:message code="sales_reports.label"/></a></li>
                              	</ul>
                            </div> --%>
                            <br/>
                          <div class="row">
                          <c:if test="${sessionScope.role == 'super admin'}">
                          		<div class="col-lg-2" style="text-align: right;">
	                          		<div style="text-align: center;width: 140px;height: 130px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="showOutletReportsFlows('outletReports');" title="<spring:message code="outlet.label" />&nbsp;&nbsp;<spring:message code="reports.label" />">
	                          			<img src="${pageContext.request.contextPath}/images/OutletReport.png" style="margin-top: 10px;"><br><br>
	                          			<span><spring:message code="outlet.label" /></span>
	                          			<span><spring:message code="reports.label" /></span>
	                          		</div>
	                          	</div>
							<c:if test="${sessionScope.warehouseLicense == true}">
	                          	<div class="col-lg-2" style="text-align: right;">
                          			<div style="text-align: center;width: 140px;height: 130px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="viewWarehouseReports('warehousesReports')" title="<spring:message code="warehouse.label" />&nbsp;&nbsp;<spring:message code="warehouse_reports.label" />">
	                          			<img src="${pageContext.request.contextPath}/images/WarehouseReport.png" style="margin-top: 10px;"><br><br>
	                          			<span><spring:message code="warehouse.label" /></span>
	                          			<span><spring:message code="reports.label" /></span>
	                          		</div>
                          		</div>
                          	</c:if>
                          </c:if>
                           <c:if test="${sessionScope.role != 'super admin'}">
                          <c:set var="outletReport" value="false"/>
                           <c:forEach var="accessControl" items="${sessionScope.outletSalesReports}" varStatus="theCount">
	                           <c:if test="${theCount.count == 1}">
	                           <c:set var="outletReport" value="true"/>
	                          	<div class="col-lg-2" style="text-align: right;">
	                          		<div style="text-align: center;width: 140px;height: 130px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="showOutletReportsFlows('outletReports');" title="<spring:message code="outlet.label" />&nbsp;&nbsp;<spring:message code="reports.label" />">
	                          			<img src="${pageContext.request.contextPath}/images/OutletReport.png" style="margin-top: 10px;"><br><br>
	                          			<span><spring:message code="outlet.label" /></span>
	                          			<span><spring:message code="reports.label" /></span>
	                          		</div>
	                          	</div>
                          	</c:if>
                          	</c:forEach>
                          	 <c:forEach var="accessControl" items="${sessionScope.outletOtherReports}" varStatus="theCount">
	                           <c:if test="${theCount.count == 1 && outletReport == 'false'}">
	                          	<div class="col-lg-2" style="text-align: right;">
	                          		<div style="text-align: center;width: 140px;height: 130px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="showOutletReportsFlows('outletReports');" title="<spring:message code="outlet.label" />&nbsp;&nbsp;<spring:message code="reports.label" />">
	                          			<img src="${pageContext.request.contextPath}/images/OutletReport.png" style="margin-top: 10px;"><br><br>
	                          			<span><spring:message code="outlet.label" /></span>
	                          			<span><spring:message code="reports.label" /></span>
	                          		</div>
	                          	</div>
                          	</c:if>
                          	</c:forEach>
                          	  <c:set var="count" value="0" />
                          	<c:forEach var="accessControl" items="${sessionScope.warehouseReports}">
	                           <c:if test="${accessControl.appSubflow == 'WarehouseReports' &&count<1}">
								   <c:if test="${sessionScope.warehouseLicense == true}">
								   <c:set var="count" value="${count + 1}" />
	                          		<div class="col-lg-2" style="text-align: right;">
	                          			<div style="text-align: center;width: 140px;height: 130px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="showWarehouseReportsFlows('warehousesReports')" title="<spring:message code="warehouse.label" />&nbsp;&nbsp;<spring:message code="warehouse_reports.label" />">
		                          			<img src="${pageContext.request.contextPath}/images/WarehouseReport.png" style="margin-top: 10px;"><br><br>
		                          			<span><spring:message code="warehouse.label" /></span>
		                          			<span><spring:message code="reports.label" /></span>
	                          			</div>
	                          		</div>
	                          		</c:if>
                          		</c:if>
                          		</c:forEach>
                          		
                          		<c:forEach var="accessControl" items="${sessionScope.CampaignReports}" varStatus="theCount">
		                <c:if test="${theCount.count == 1}">   
		                		<div class="col-lg-2" style="text-align: left;">
	                          		<div style="text-align: center;width: 130px;height: 130px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="showCampaignManagementReportsFlows('campaignsReports');" title="Campaign Management">
	                          			<img src="${pageContext.request.contextPath}/images/imagentavl.png" style="margin-top: -30px; padding: 34px 12px 0px 59px; margin-left: -33%;"><br><br>
	                          			<span>Campaign Management</span>
	                          		</div>
                          		</div>
                          	</c:if>
                           	</c:forEach>
                          </c:if>
                          </div>
                               
                        
                    
                          
</body>
</html>