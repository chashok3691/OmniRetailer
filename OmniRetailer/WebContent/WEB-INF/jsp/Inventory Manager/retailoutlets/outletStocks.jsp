<!--/*
 * Project Name 	        : OmniRetailerCustomer
 * Written By		        : Sahitya
 * file name		        : inventorymanager/warehouse/procurement/procurementDetails.jsp
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
        <!-- DATA TABLES -->
        <link href="${pageContext.request.contextPath}/css/datatables/dataTables.bootstrap.css" rel="stylesheet" type="text/css" />
    </head>
<body>
			<%-- <section class="content-header">
  			 <h1><spring:message code="outlet.management.label" />
    		 	<small><spring:message code="stocks.label" /></small>
    		 </h1>
      		 <ol class="breadcrumb">
      			<li><a style="cursor: pointer;" onclick="return viewDashboard('inventorymanager');"><i class="fa fa-dashboard"></i><spring:message code="home.label" /></a></li>
        		<li class="active"><spring:message code="outlet.management.label" /></li>
     		 </ol>
 			</section> --%>
                <section class="content" style="background: none !important;">
                            <div class="nav-tabs-custom">
                                <ul class="nav nav-tabs">
                                    <li class="active tab" id="tab1"><a href="#tab_1" data-toggle="tab" onclick="getProductStocksByCriteria('Normal Stock');"><spring:message code="availablestock.label" /></a></li>
                                    <li class="tab" id="tab2"><a href="#tab_1" onclick="getProductStocksByCriteria('Ordered');" data-toggle="tab"><spring:message code="orderedstock.label" /></a></li>
                                    <li class="tab" id="tab3"><a href="#tab_1" onclick="getProductStocksByCriteria('Critical Stock');" data-toggle="tab"><spring:message code="criticalstock.label" /></a></li>
                                    <li class="tab" id="tab4"><a href="#tab_1" onclick="getProductStocksByCriteria('Blocked');" data-toggle="tab"><spring:message code="blockedstock.label" /></a></li>
                                    <li class="tab" id="tab5"><a href="#tab_1" onclick="getProductStocksByCriteria('Returned');" data-toggle="tab"><spring:message code="returnedstock.label" /></a></li>
                                    <li class="tab" id="tab6"><a href="#tab_1" onclick="getProductStocksByCriteria('Boneyard');" data-toggle="tab"><spring:message code="boneyard.label" /></a></li>
                                </ul>
                                <div class="tab-content">
                                    <div class="tab-pane active" id="tab_1" >
                                    <div class="row">
				                        <div class="col-lg-12">
                                         <%@ include file="productstocks.jsp" %>
                                        </div>
                                     </div>
                                    </div><!-- /.tab-pane -->
                                    <div class="tab-pane" id="tab_2">
                                    <div class="row">
                        				<div class="col-lg-12">
                                        </div>
                                    </div>
                                    </div><!-- /.tab-pane -->
                                    <div class="tab-pane" id="tab_3">
                                    <div class="row">
                        				<div class="col-lg-12">
                                        </div>
                                    </div>
                                    </div><!-- /.tab-pane -->
                                    <div class="tab-pane" id="tab_4">
                                    <div class="row">
                        				<div class="col-lg-12">
                                        </div>
                                    </div>
                                    </div><!-- /.tab-pane -->
                                    <div class="tab-pane" id="tab_5">
                                    <div class="row">
                        				<div class="col-lg-12">
                                        </div>
                                    </div>
                                    </div><!-- /.tab-pane -->
                                    <div class="tab-pane" id="tab_6">
                                    <div class="row">
                        				<div class="col-lg-12">
                                        </div>
                                    </div>
                                    </div><!-- /.tab-pane -->
                                </div><!-- /.tab-content -->
                            </div><!-- nav-tabs-custom -->
                        </section>
                          
</body>
</html>