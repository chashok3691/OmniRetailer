<!--/*
 * Project Name 	        : OmniRetailerCustomer
 * Written By		        : Mythri
 * file name		        : Inventory Manager/menu/menu.jsp
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
        <title>Menu Configurations | Omni Retailer</title>
        
        <meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>
	 <script src="${pageContext.request.contextPath}/js/form_plugin.js"></script>
 	<script src="${pageContext.request.contextPath}/js/menu.js"></script>
 	
    </head>
<body>
	<%-- <section class="content-header">
   <h1><spring:message code="outlet.management.label" />
     <small><spring:message code="menu.label" /></small>
    </h1>
      <ol class="breadcrumb">
      	<li><a href="#" onclick="return viewDashboard('inventorymanager');"><i class="fa fa-dashboard"></i><spring:message code="home.label" /></a></li>
        <li class="active"><spring:message code="outlet.management.label" /></li>
       </ol>
 	</section> --%>
                <section class="content">
                            <div class="nav-tabs-custom">
                                <ul class="nav nav-tabs">
                                    <li class="active" onclick="getMenuCategories();"><a href="#tab_1" data-toggle="tab"><spring:message code="menu.label" /></a></li>
                                    <li id="viewEditMenuItems" onclick="getMenuItems();"><a href="#tab_2" data-toggle="tab"><spring:message code="menu.items.label" /></a></li>
                                </ul><!-- getMenuItems(); -->
                                <div class="tab-content">
                                    <div class="tab-pane active" id="tab_1">
                                    <div class="row">
                        <!-- left column -->
                        <div class="col-md-12">
                                        <%@ include file="menuCategories.jsp" %>
                                        </div>
                                        </div>
                                    </div><!-- /.tab-pane -->
                                    <div class="tab-pane" id="tab_2"></div>
                                                                      <!-- /.tab-pane -->
                                </div><!-- /.tab-content -->
                            </div><!-- nav-tabs-custom -->
                        </section>  
</body>
</html>