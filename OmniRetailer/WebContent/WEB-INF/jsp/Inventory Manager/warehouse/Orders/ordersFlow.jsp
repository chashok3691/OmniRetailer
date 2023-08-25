<!--/*
 * Project Name 	        : OmniRetailerCustomer
 * Written By		        : Mythri.S
 * file name		        : Innventory Manager/Orders/ordersFlow.jsp
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
			<%-- 	<section class="content-header">
					 <h1><spring:message code="outlet.management.label" />
  						<small><spring:message code="customer.label" /> <spring:message code="orders.label" /></small>
 				   </h1>
                   <ol class="breadcrumb">
                    <li><a href="#" onclick="return viewDashboard('inventorymanager');"><i class="fa fa-dashboard"></i><spring:message code="home.label" /></a></li>
                        <li class="active"><a style="cursor: pointer;" onclick="showOutletFlows();"><spring:message code="outlet.management.label"/></a></li>
                        <li class="active"><a style="cursor: pointer;" onclick="showOrdersFlows();"><spring:message code="customer.label"/> <spring:message code="orders.label" /></a></li>
                    </ol>
                </section> --%>
                
                          <%--   <div class="nav-tabs-custom">
                                <ul class="nav nav-tabs">
                             	 <li class=""><a href="#tab_1" data-toggle="tab"><spring:message code="warehouse_configuration.label"/></a></li>
                              	</ul>
                            </div> --%>
                            <br>
                          <div class="row">
                          	<div class="col-lg-2" style="text-align: right;">
                          		<div style="text-align: center;width: 120px;height: 120px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="viewOrders('all','submittedOrders','')" title="<spring:message code="submitted.orders.label" /> <spring:message code="orders.label" />">
                          			<img src="${pageContext.request.contextPath}/images/NewOrders.png" style="margin-top: 10px;"><br><br>
                          			<span><spring:message code="submitted.orders.label" /> <spring:message code="orders.label" /></span>
                          		</div>
                          	</div>
                          	<div class="col-lg-2">
                          		<div style="text-align: center;width: 120px;height: 120px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="viewOrders('pending','pendingOrders','')" title="<spring:message code="pending.bills.label" /> <spring:message code="orders.label" />">
                          			<img src="${pageContext.request.contextPath}/images/PendingOrders.png" style="margin-top: 10px;"><br><br>
                          			<span><spring:message code="pending.bills.label" /> <spring:message code="orders.label" /></span>
                          		</div>
                          	</div>
                          	<div class="col-lg-2" style="text-align: left;">
                          		<div style="text-align: center;width: 120px;height: 120px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="viewOrders('fullfilled','fullfilledOrders','')" title="<spring:message code="fullfilled.orders.label" /> <spring:message code="orders.label" />">
                          			<img src="${pageContext.request.contextPath}/images/FullfilledOrders.png" style="margin-top: 10px;"><br><br>
                          			<span><spring:message code="fullfilled.orders.label" /> <spring:message code="orders.label" /></span>
                          		</div>
                          	</div>
                          	<div class="col-lg-2" style="text-align: left;"></div>
                          	<div class="col-lg-2" style="text-align: left;"></div>
                          	<div class="col-lg-2" style="text-align: left;"></div>
                          
                          </div>
                          <br>
                          <br>
                         
</body>
</html>