<!--/*
 * Project Name 	        : OmniRetailerCustomer
 * Written By		        : Sahitya
 * file name		        : onventorymanager/warehouse/goodsTransfer/goodstransfer.jsp
 * file type		        : JSP
 * description				: The edit profile and change password tabs are displayed using this jsp
 * */ -->


<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
    <!DOCTYPE html>
<!-- <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd"> -->
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Welcome | Omni Retailer</title>
        <meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>
       
    </head>
<body>
				<section class="content-header">
					<h1><spring:message code="warehouse.management.label" />
     					<small><p><spring:message code="goodstransfer.label" /></p></small>
   					</h1>
                    <ol class="breadcrumb">
                    <li><a style="cursor: pointer;" onclick="return viewDashboard('inventorymanager');"><i class="fa fa-dashboard"></i><spring:message code="home.label" /></a></li>
                        <li class="active"><spring:message code="warehouse.management.label"/></li>
                    </ol>
                </section>
                <section class="content" style="background: none !important;">
                            <div class="nav-tabs-custom">
                                <ul class="nav nav-tabs">
                                    <li class="active"><a href="#tab_1" data-toggle="tab" onclick="viewAllWarehouseStockReceipts('warehouseGoodstransfer','all');"><spring:message code="goodsreceipts.label" /></a></li>
                                    <li><a href="#tab_2" onclick="viewAllWarehouseStockIssues('warehouseGoodstransfer','all');" data-toggle="tab"><spring:message code="goodsindent.label" /></a></li>
                                    
                                    <!-- <li class="pull-right"><a style="cursor: pointer;" class="text-muted"><i class="fa fa-gear"></i></a></li> -->
                                </ul>
                                <div class="tab-content">
                                    <div class="tab-pane active" id="tab_1" >
                                    <div class="row">
                        <!-- left column -->
                        <div class="col-lg-12">
                                       <%@ include file="allstockreceipts.jsp" %>
                                       
                                        </div>
                                        </div>
                                    </div><!-- /.tab-pane -->
                                    <div class="tab-pane" id="tab_2">
                                    <div class="row">
                        <!-- left column -->
                        <div class="col-lg-12">
                        
                                        
                                      <%--    <%@ include file="allissuedstocks.jsp" %> --%>
                                        </div>
                                        </div>
                                    </div><!-- /.tab-pane -->
                                </div><!-- /.tab-content -->
                            </div><!-- nav-tabs-custom -->
                        </section>
                          
</body>
</html>