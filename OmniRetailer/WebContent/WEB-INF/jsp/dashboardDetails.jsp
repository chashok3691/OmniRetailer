<!--/*
 * Project Name 	        : OmniRetailerCustomer
 * Written By		        : Mythri
 * file name		        : dashboardDetails.jsp
 * file type		        : JSP
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
                <section class="content" style="background: none !important;">
                            <div class="nav-tabs-custom">
                                <ul class="nav nav-tabs">
                                <c:set var="outletDashboard" value="false"/>
                                 <c:if test="${sessionScope.role == 'super admin'}">
                                 	<li class="active"><a href="#tab_1" data-toggle="tab" onclick="showOutletDashboard('all','all','month','all');"><spring:message code="outlet_management.reports.label" /></a></li>
                                 	<li><a href="#tab_2" onclick="" data-toggle="tab"><spring:message code="warehouse_management.reports.label" /></a></li>
                                 </c:if>
                                <c:forEach var="accessControl" items="${sessionScope.dashboard}">
	                     			<c:if test="${accessControl.appDocument == 'outletDashboard' && outletDashboard == false}"> 
		                            	<c:set var="outletDashboard" value="true"/> 
		                            	<li id="tab1" class="active"><a href="#tab_1" style="font-size: 18px;" data-toggle="tab" onclick="showOutletDashboard('all','all','month','all');"><spring:message code="outlet_management.reports.label" /></a></li>
		                            </c:if>
		                        </c:forEach>
		                        <c:forEach var="accessControl" items="${sessionScope.dashboard}">
		                             <c:if test="${sessionScope.warehouseLicense == true && outletDashboard == true && accessControl.appDocument == 'warehouseDashboard'}">
		                             	<li id="tab2"><a href="#tab_2" style="font-size: 18px;" onclick="" data-toggle="tab"><spring:message code="warehouse_management.reports.label" /></a></li>
		                             </c:if>
		                             <c:if test="${sessionScope.warehouseLicense == true && outletDashboard != true && accessControl.appDocument == 'warehouseDashboard'}">
		                             	<li id="tab2" class="active"><a href="#tab_2" style="font-size: 18px;" onclick="" data-toggle="tab"><spring:message code="warehouse_management.reports.label" /></a></li>
		                             </c:if>
                            	</c:forEach>
                                </ul>
                                <div class="tab-content">
                                 <c:if test="${sessionScope.role == 'super admin'}">
                                 	<div class="tab-pane active" id="tab_1" >
	                                  	<div class="row">
	                        				<!-- left column -->
				                        	<div class="col-lg-12">
                                   			  <%@ include file="outletDashboard.jsp" %>
                                   			 </div>
                                   		  </div>
                                   	</div>
                                   	<div class="tab-pane" id="tab_2">
	                                    <div class="row">
					                        <!-- left column -->
					                        <div class="col-lg-12">
	                                    	</div>
	                                    </div>
	                                   </div>
                                 </c:if>
                                 <c:set var="outletDashboard" value="false"/>
	                          		<c:forEach var="accessControl" items="${sessionScope.dashboard}">
	                     			<c:if test="${accessControl.appDocument == 'outletDashboard' && outletDashboard == false}"> 
		                            	<c:set var="outletDashboard" value="true"/> 
	                                       <div class="tab-pane active" id="tab_1" >
			                                  <div class="row">
			                        				<!-- left column -->
						                        <div class="col-lg-12">
	                                       			<%@ include file="outletDashboard.jsp" %>
	                                       		</div>
	                                       	  </div>
	                                       	</div>
	                                    </c:if>
	                                  </c:forEach>
	                                  <c:forEach var="accessControl" items="${sessionScope.dashboard}">
	                                  	 <c:if test="${sessionScope.warehouseLicense == true && outletDashboard != true && accessControl.appDocument == 'warehouseDashboard'}">
	                                      		<div class="tab-pane active" id="tab_1" >
				                                  <div class="row">
				                        				<!-- left column -->
							                        <div class="col-lg-12">
	                                     			  <%@ include file="warehouseDashboard.jsp" %>
	                                     			 </div>
	                                     		  </div>
	                                     		</div>
		                            	</c:if>
	                                 </c:forEach>
                                </div><!-- /.tab-content -->
                            </div><!-- nav-tabs-custom -->
                        </section>
                          
</body>
</html>