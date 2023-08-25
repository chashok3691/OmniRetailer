<!--/*
 * Project Name 	        : OmniRetailerCustomer
 * Written By		        : Sahitya
 * file name		        : Inventory Manager/warehouse/stockVerification/allverifiedstocks.jsp
 * file type		        : JSP
 * description				: All verified stocks details are displayed using this jsp
 * */ -->

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
    <!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Welcome | Omni Retailer</title>
        <meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>
        
        <!-- DATA TABLES -->
        <link href="${pageContext.request.contextPath}/css/datatables/dataTables.bootstrap.css" rel="stylesheet" type="text/css" />
        <script type="text/javascript" src="${pageContext.request.contextPath}/js/controller.js"></script>
        
<style type="text/css">
.buttons {
	float: right;
	padding-top: 0px;
	margin-right: 2%;
	margin-top:1%;
}
a.button, .list a.button {
position:relative;
	text-decoration: none;
	color: #FFF;
	display: inline-block;
	padding: 5px 15px 5px 15px;
	background: #3c8dbc;

	border-radius: 5px;
	box-shadow:1px 0px 2px #000;
	cursor:pointer;
	behavior : url(css/PIE.htc); 
}

</style>  
</head>
<body>


 <!-- Content Header (Page header) -->
<section class="content-header">
   <h1><spring:message code="warehouse.management.label" />
     <small><spring:message code="stock.verification.label" /></small>
    </h1>
      <ol class="breadcrumb">
      	<li><a style="cursor: pointer;" onclick="return viewDashboard('inventorymanager');"><i class="fa fa-dashboard"></i><spring:message code="home.label" /></a></li>
        <li class="active"><spring:message code="warehouse.management.label" /></li>
     </ol>
 </section>
                
<!-- Main content -->
<section class="content">
<div class="row">
  <div class="col-lg-12">
  <div class="box box-primary">
                  <div class="box-header">
                     <h3 class="box-title">
						<spring:message code="product.label"/> <spring:message code="stockverification.label"/>
					 </h3>
                     </div><!-- /.box-header -->
                                <div class="box-body table-responsive">
                                  <div class="row">
				                      <div class="col-lg-3"></div>
				                      <div class="col-lg-6">
				                      <div class="row">
				                         <div class="col-lg-5" style="text-align:center;top: 5px;">
				                           <label><spring:message code="warehouselocation.label"/></label>
				                         </div>
				                         <div class="col-lg-6">
				                           <select class="form-control" onchange="getProductStockVerificationByWarehouseWise(this);">
 				                             <c:forEach var="location" items="${locationsList}">
												<option value="${location}" ${location == selectedLocation ? 'selected' : ''} id="${location}">${location}</option>
											 </c:forEach>
                                         </select>
				                         </div>
				                      </div>
				                      </div>
				                      <div class="col-lg-3" style="text-align: left;">
				                        
				                      </div>
				                    </div>
                                	
				                    
                                    <table id="verifiedProductStocks" class="table table-bordered table-striped">
                                     <thead style="background-color: #3c8dbc; color: #ffffff">
                                            <tr>
                                                <th><spring:message code="verificationcode.label" /></th>
                                            	<th><spring:message code="location.label" /></th>
                                                <th><spring:message code="verified.label" /> <spring:message code="date.label" /></th>
                                                <th><spring:message code="verified.label" /> <spring:message code="by.label" /></th>
                                                <th><spring:message code="remarks.label" /></th>
                                                <th><spring:message code="action.label" /> </th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                           <c:forEach var="productStockVerificationDetails" items="${productStockVerificationDetailsList}">
                                            <tr>
                                            	<td>${productStockVerificationDetails.verification_code}</td>
                                            	<td>${productStockVerificationDetails.wh_location}</td>
                                            	<td>${fn:replace(productStockVerificationDetails.verified_on,'.0','')}</td>
                                            	<td>${productStockVerificationDetails.verified_by}</td>
                                            	<td>${productStockVerificationDetails.remarks}</td>
                                            	<td><a style="color:#2e7ea7 !important;cursor: pointer;" onclick="viewSpecificWarehouseProductStockVerification('${productStockVerificationDetails.verification_code}');"><spring:message code="view.label"/> <spring:message code="items.label"/></a>
                                            	</td>	
                                            </tr>
                                            
                                          </c:forEach>
                                           
                                        </tbody>
                                       
                                    </table>
                                    
                                </div><!-- /.box-body -->
                            </div><!-- /.box -->
  
</div>
</div>
</section>
        <script type="text/javascript">
            $(function() {
                $("#verifiedProductStocks").dataTable();
                 });
        </script>
        
</body>
</html>