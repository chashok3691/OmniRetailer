<!--/*
 * Project Name 	        : OmniRetailerCustomer
 * Written By		        : Sahitya
 * file name		        : inventorymanager/retailoutlets/viewoutletproductstockverification.jsp
 * file type		        : JSP
 * description				: The new store form is displayed using this jsp
 * */ -->


<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
    <!DOCTYPE html>
<html>
<head>
<!-- <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
 -->

<meta charset="UTF-8">
	<title>Home | Omni Retailer</title>
	<meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>

	 <!-- DATA TABLES -->
        <link href="${pageContext.request.contextPath}/css/datatables/dataTables.bootstrap.css" rel="stylesheet" type="text/css" />
	
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/controller.js"></script>
	
<style>
  .odd{display:none!important;}
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
                                <div class="box-header" style="text-align: center">
                                <br/>
                                <h3><spring:message code="product.label"/> <spring:message code="items.label"/></h3>
                                </div><!-- /.box-header -->
                                <!-- form start -->
                               
                                  <div class="box-body">
                                  
                                   
                                   <div class="row">
                                        <div class="form-group col-lg-4">
                                            <label><spring:message code="verificationcode.label" /></label>
                                            <input type="text" class="form-control" readonly value="${specificProductData.verification_code}"/>
                                        </div>
                                        <div class="form-group col-lg-4">
                                            <label><spring:message code="product.code.label" /></label>
                                            <input type="text" class="form-control" readonly value="${specificProductData.product_id}"/>
                                        </div>
                                        <div class="form-group col-lg-4">
                                            <label><spring:message code="skuid.label" /></label>
                                            <input type="text" class="form-control" readonly value="${specificProductData.sku_id}"/>
                                        </div>
                                   </div>
                                        
                                          
                                    <div class="row">
                                        <div class="form-group col-lg-3">
                                            <label><spring:message code="product.physicalstock.label" /></label>
                                            <input type="text" class="form-control" readonly value="${specificProductData.product_physical_stock}"/>
                                        </div>
                                        
                                        <div class="form-group col-lg-3">
                                            <label><spring:message code="product.bookstock.label" /></label>
                                            <input type="text" class="form-control" readonly value="${specificProductData.product_book_stock}"/>
                                        </div>
                                        
                                        <div class="form-group col-lg-3">
                                            <label><spring:message code="sku.physicalstock.label" /> </label>
                                            <input type="text" class="form-control" readonly value="${specificProductData.sku_physical_stock}"/>
                                        </div>
                                        
                                        <div class="form-group col-lg-3">
                                            <label><spring:message code="sku.bookstock.label" /> </label>
                                            <input type="text" class="form-control" readonly value="${specificProductData.sku_book_stock}"/>
                                        </div>
                                      </div>
                                     
                                      <div class="row">
                                        <div class="form-group col-lg-3">
                                            <label><spring:message code="losstype.label" /></label>
                                            <input type="text" class="form-control" readonly value="${specificProductData.loss_type}"/>
                                        </div>
                                        
                                        <div class="form-group col-lg-3">
                                            <label><spring:message code="stockloss.label" /></label>
                                            <input type="text" class="form-control" readonly value="${specificProductData.stock_loss}"/>
                                        </div>
                                        
                                        <div class="form-group col-lg-3">
                                            <label><spring:message code="sku_replenishment_date.label" /></label>
                                            <input type="text" class="form-control" readonly value="${fn:replace(specificProductData.sku_replenishment_date,'.0','')}"/>
                                        </div>
                                        <div class="form-group col-lg-3">
                                            <label><spring:message code="storageunit.label" /></label>
                                            <input type="text" class="form-control" readonly value="${specificProductData.storage_unit}"/>
                                        </div>
                                     </div>
                                     
                                      <div class="row">
                                        <div class="form-group col-lg-4">
                                            <label><spring:message code="sku_reordered_qty.label" /></label>
                                            <input type="text" class="form-control" readonly value="${specificProductData.sku_reordered_qty}"/>
                                        </div>
                                        
                                        <div class="form-group col-lg-4">
                                            <label><spring:message code="sku_reordered_date.label" /></label>
                                            <input type="text" class="form-control" readonly value="${fn:replace(specificProductData.sku_reordered_date,'.0','')}"/>
                                        </div>
                                        
                                        <div class="form-group col-lg-4">
                                            <label><spring:message code="skuallocated.label" /> </label>
                                            <input type="text" class="form-control" readonly value="${specificProductData.sku_allocated}"/>
                                        </div>
                                     </div>
                                
                                      <div class="row">
                                         <div class="form-group  col-lg-12">
                                         	<label><spring:message code="remarks.label" /></label>
                                             <textarea class="form-control" style="resize: none;" readonly>${specificProductData.remarks}</textarea>
                                         </div>
                                      </div>

						</div><!-- /.box-body -->

						<div class="row" style="text-align: center;">
							<input type="button" class="btn bg-olive btn-inline"
								onclick="viewSpecificOutletProductStockVerification('${specificProductData.verification_code}');"
								value="<spring:message code="cancel.label" />" />
						</div>
						<br/>
                                    <div class="box-footer">
                                     <!--    <button type="submit" class="btn btn-primary">Submit</button> -->
                                    </div>
                                    
                              
                            </div>

</div>
</div>
</section><!-- /.content -->

      
</body>
</html>
		    		 