<!--/*
 * Project Name 	        : OmniRetailerCustomer
 * Written By		        : Sambaiah Y
 * file name		        : onventorymanager/Orders/orders.jsp
 * file type		        : JSP
 * description				: display order information
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
        <title>Restaurant orders Page| Omni Retailer</title>
        <meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>
       
    </head>
<body>
				<%-- <section class="content-header">
                    <h1>
                       <spring:message code="orders.label"/>
                    </h1>
                    <ol class="breadcrumb">
                    <li><a href="#" onclick="return viewDashboard('inventorymanager');"><i class="fa fa-dashboard"></i><spring:message code="home.label" /></a></li>
                        <li class="active"><spring:message code="orders.label"/></li>
                    </ol>
                </section> --%>
                <section class="content" style="background: none !important;">
                            <div class="nav-tabs-custom">
                                <ul class="nav nav-tabs">
                                <c:if test="${orderType == 'immediate'}">
							 <li class="active"><a href="#tab_1" data-toggle="tab" onclick="viewOrdersByPage('immediate');"><spring:message code="immediate_orders.label"/></a></li>
                                    <li><a href="#tab_2" onclick="viewOrdersByPage('take_away')" data-toggle="tab"><spring:message code="take_away_orders.label"  /></a></li>
                               
						</c:if>
						<c:if test="${orderType == 'take_away'}">
							<li><a href="#tab_1" data-toggle="tab" onclick="viewOrdersByPage('immediate');"><spring:message code="immediate_orders.label"/></a></li>
                                    <li class="active"><a href="#tab_2" onclick="viewOrdersByPage('take_away')" data-toggle="tab"><spring:message code="take_away_orders.label"  /></a></li>
                               
						</c:if>
                                
                                  </ul>
                                <div class="tab-content">
                                    <div class="tab-pane active" id="tab_1" >
                                    <div class="row">
                        <!-- left column -->
                        <div class="col-lg-12">
                                       <%@ include file="immediateorders.jsp" %> 
                                       
                                        </div>
                                        </div>
                                    </div><!-- /.tab-pane -->
                                    <div class="tab-pane" id="tab_2">
                                    <div class="row">
                        <!-- left column -->
                        <div class="col-lg-12">
                        
                                        
                                       <%--   <%@ include file="rawmaterialstocks.jsp" %> --%>
                                        </div>
                                        </div>
                                    </div><!-- /.tab-pane -->
                                </div><!-- /.tab-content -->
                            </div><!-- nav-tabs-custom -->
                        </section>
                          
</body>
</html>