<!--/*
 * Project Name 	        : OmniRetailerCustomer
 * Written By		        : Sambaiah Y
 * file name		        : Inventory Manager/Billing/bills.jsp
 * file type		        : JSP
 * description				: display order information
 * */ -->


<%-- <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%> --%>
    <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
     <%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
     <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <!DOCTYPE html>
<!-- <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd"> -->
<html>
<head>
<!-- <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"> -->
        <title>Welcome | Omni Retailer</title>
        <meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>
       
    </head>
<body>
				<%-- <section class="content-header">
					<h1><spring:message code="outlet.management.label" />
     				<small><spring:message code="billing.payment.label" /></small>
    			</h1>
				<ol class="breadcrumb">
                    <li><a style="cursor: pointer;" onclick="return viewDashboard('inventorymanager');"><i class="fa fa-dashboard"></i><spring:message code="home.label" /></a></li>
                        <li class="active"><spring:message code="outlet.management.label"/></li>
                    </ol>
                </section> --%>
                <section class="content" style="background: none !important;">
                            <div class="nav-tabs-custom">
                            
                                <div class="tab-content">
                                    <div class="tab-pane active" id="tab_1" >
                                    <div class="row">
                        <!-- left column -->
                        <div class="col-lg-12">
                                       <%@ include file="billings.jsp" %> 
                                       
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