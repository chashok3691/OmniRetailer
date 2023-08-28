<!--/*
 * Project Name 	        : OmniRetailerCustomer
 * Written By		        : Sahitya
 * file name		        : inventorymanager/retailoutlets/allverifiedstockitems.jsp
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
	padding: 5px 10px 5px 10px;
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
<%-- <section class="content-header">
   <h1><spring:message code="outlet.management.label" />
     <small><p id="heading"><spring:message code="stock.verification.label" /></p></small>
    </h1>
      <ol class="breadcrumb">
      	<li><a style="cursor: pointer;" onclick="return viewDashboard('inventorymanager');"><i class="fa fa-dashboard"></i><spring:message code="home.label" /></a></li>
        <li class="active"><spring:message code="outlet.management.label" /></li>
     </ol>
 </section> --%>
                
<!-- Main content -->
<section class="content">
<div class="row">
  <div class="col-lg-12">
  <div class="box box-primary">
                  <div class="box-header">
                     <h3 class="box-title">
						<spring:message code="verified.label"/> <spring:message code="product.label"/> <spring:message code="stock.label"/> <spring:message code="items.label"/> - ${verificationCode}
					 </h3>
                     </div><!-- /.box-header -->
                                <div class="box-body table-responsive">
                                	
				                    <div class="row">
				                       <div class="buttons" style="margin-bottom: 7px;">
		  				                <%-- <a onclick="viewOutletProductStockVerification();" class="button"><font size="2px"><spring:message code="back.label" /></font></a>&nbsp;&nbsp;&nbsp; --%>
		  				                <a onclick="viewOutletStockVerification('outletStockVerification','0');" class="button"><font size="2px"><spring:message code="back.label" /></font></a>&nbsp;&nbsp;&nbsp;
		   			                  </div>
		   			                </div>
                                    <table id="verifiedProductStockItems" class="table table-bordered table-striped">
                                     <thead style="background-color: #3c8dbc; color: #ffffff">
                                            <tr>
                                                <th><spring:message code="verificationcode.label" /></th>
                                                <th><spring:message code="product.code.label" /></th>
                                                <th><spring:message code="skuid.label" /></th>
                                            	<th><spring:message code="storageunit.label" /></th>
                                            	<th><spring:message code="stockloss.label" /></th>
                                            	<th><spring:message code="skuallocated.label" /></th>
                                                <th><spring:message code="action.label" /> </th>
                                            </tr>
                                        </thead>
                                        <tbody style="text-align: center;">
                                           <c:forEach var="productStockVerificationItemDetails" items="${productStockVerificationItemDetailsList}">
                                            <tr>
                                            	<td>${productStockVerificationItemDetails.verification_code}</td>
                                            	<td>${productStockVerificationItemDetails.product_id}</td>
                                            	<td>${productStockVerificationItemDetails.sku_id}</td>
                                            	<td>${productStockVerificationItemDetails.storage_unit}</td>
                                            	<td>${productStockVerificationItemDetails.stock_loss}</td>
                                            	<td>${productStockVerificationItemDetails.sku_allocated}</td>
                                            	<td>
                                            	  <a style="color:#2e7ea7 !important;cursor: pointer;" onclick="viewOutletProductStockVerificationItems({'verification_code':'${productStockVerificationItemDetails.verification_code}','product_id':'${productStockVerificationItemDetails.product_id}','sku_id':'${productStockVerificationItemDetails.sku_id}','product_physical_stock':'${productStockVerificationItemDetails.product_physical_stock}','product_book_stock':'${productStockVerificationItemDetails.product_book_stock}','sku_physical_stock':'${productStockVerificationItemDetails.sku_physical_stock}','sku_book_stock':'${productStockVerificationItemDetails.sku_book_stock}','loss_type':'${productStockVerificationItemDetails.loss_type}','stock_loss':'${productStockVerificationItemDetails.stock_loss}','sku_replenishment_date':'${productStockVerificationItemDetails.sku_replenishment_date}','storage_unit':'${productStockVerificationItemDetails.storage_unit}','sku_reordered_qty':'${productStockVerificationItemDetails.sku_reordered_qty}','sku_reordered_date':'${productStockVerificationItemDetails.sku_reordered_date}','sku_allocated':'${productStockVerificationItemDetails.sku_allocated}','remarks':'${productStockVerificationItemDetails.remarks}'})">
                                            	     <spring:message code="view.label"/> <spring:message code="more.label"/>
                                            	  </a>
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
 		<script src="${pageContext.request.contextPath}/js/plugins/datatables/jquery.dataTables.js" type="text/javascript"></script>
        <script src="${pageContext.request.contextPath}/js/plugins/datatables/dataTables.bootstrap.js" type="text/javascript"></script>
        <script type="text/javascript">
            $(function() {
                $("#verifiedProductStockItems").dataTable();
                 });
        </script>
        
</body>
</html>