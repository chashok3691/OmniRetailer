<!--/*
 * Project Name 	        : OmniRetailerCustomer
 * Written By		        : Mythri
 * file name		        : Inventory Manager/warehouse/procurement/viewProcurementReceipt.jsp
 * file type		        : JSP
 * description				: The new product is displayed using this jsp
 * */ -->


<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
	<title>Home | Omni Retailer</title>
	<meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>
<%-- 	<script src="${pageContext.request.contextPath}/js/jquery-1.6.4.min.js"></script>  --%>

 <script src="${pageContext.request.contextPath}/js/form_plugin.js"></script>
 	<script type="text/javascript" src="${pageContext.request.contextPath}/js/validation.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/controller.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/procurement.js"></script>


<script type="text/javascript">

</script>
</head>
<body>
<!-- Content Header (Page header) -->
<%-- <section class="content-header">
	<h1><spring:message code="warehouse.management.label" />
		<small><spring:message code="procurement.label" /></small>
	</h1>
    <ol class="breadcrumb">
        <li><a style="cursor: pointer;" onclick="return viewDashboard('inventorymanager');"><i class="fa fa-dashboard"></i><spring:message code="home.label" /></a></li>
		<li class="active"><spring:message code="warehouse.management.label" /></li>
    </ol>
</section> --%>

<!-- Main content -->
<section class="content">
 <div class="row">
  <div class="col-lg-12">
				<div class="box box-primary">
            <div class="box-header" style="text-align: center">
            <br/>
            <h3><spring:message code="procurement.view.receipt.label" /></h3>
            </div><!-- /.box-header -->
            <!-- form start -->
            <form id="viewProcurementReceipt" method="post" >
                <div class="box-body">
               	<div id="Error" style="text-align: center;color: red;font-size: 2;font-weight: bold;">${err}</div>
               	<div class="row">
               		<div class="form-group col-lg-4">
                        <label><spring:message code="supplier.code.label" /></label>
                         <input type="text" class="form-control" readonly="readonly" name="supplier_id" id="supplier_id" value="${procurementReceipt.supplier_id}" required />
                    </div>
                 	<div class="form-group col-lg-4">
                        <label><spring:message code="supplier.name.label" /></label>
                        <input type="text" class="form-control" readonly="readonly" name="supplier_name" id="supplier_name" value="${procurementReceipt.supplier_name}" required />
                    </div>
                    <div class="form-group col-lg-4">
                        <label><spring:message code="procurement.location.label" /></label>
                                    <input type="text" class="form-control" readonly="readonly" name="location" id="warehouse_location" value="${procurementReceipt.location}" required />
                             </div>
				</div>
                           <div class="row">
                             <div class="form-group col-lg-4">
                                 <label><spring:message code="delivered.by.label" /></label>
                        <input type="text" class="form-control" readonly="readonly" name="delivered_by" id="delivered_by" value="${procurementReceipt.delivered_by}" required />
                     </div>
                     <div class="form-group col-lg-4">
                        <label><spring:message code="inspected.by.label" /></label>
                        <input type="text" class="form-control" readonly="readonly" name="inspected_by" id="inspected_by" value="${procurementReceipt.inspected_by}" required />
                       
                     </div>
                     <div class="form-group col-lg-4">
                        <label><spring:message code="shipment.note.label" /></label>
                        <input type="text" class="form-control" readonly="readonly" name="shipment_note" id="shipment_note" value="${procurementReceipt.shipment_note}" required />
                     </div>
                     
                    </div>
                     <div class="row">
                     <div class="form-group col-lg-4">
                        <label><spring:message code="po.reference.label" /></label>
                        <input type="text" class="form-control" readonly="readonly" name="po_reference" id="po_reference" value="${procurementReceipt.po_reference}" required />
                    </div>
                     <div class="form-group col-lg-4">
                        <label><spring:message code="procurement.status.label" /></label>
                         <input type="text" class="form-control" readonly="readonly" name="status" id="status" value="${procurementReceipt.status}" required />
                     </div>
                     <div class="form-group col-lg-4">
                        <label><spring:message code="date.label" /></label>
                        <input type="text" readonly="readonly" readonly="readonly" class="form-control" name="date" value="${procurementReceipt.date}" id="date" />
                    </div>
                     </div>
                    
                    <div class="table-responsive">
                    <table id="productsList" class="table table-bordered table-hover">
                      <thead style="background-color: #3c8dbc; color: #ffffff">
                        <tr>
                        	<th><spring:message code="item.name.label"/></th>
                            <th><spring:message code="item.desc.label"/></th>
                            <th><spring:message code="price.label"/></th>
                            <th><spring:message code="pack.label"/></th>
                            <th><spring:message code="cost"/></th>
                            <th><spring:message code="make.label"/></th>
                            <th><spring:message code="supplied.label"/></th>
                            <th><spring:message code="received.label"/></th>
                            <th><spring:message code="rejected.label"/></th>
                            <%-- <th><spring:message code="action.label"/></th> --%>
                        </tr>
                      </thead>
                      <tbody>
                       <c:forEach var="item" items="${procurementReceipt.items}">
             		   <tr>
              			<td>${item.item_code}</td>
                  		<td>${item.item_description}</td>
                  		<td>${item.price}</td>
                  		<td>${item.pack }</td>
                  		<td>${item.cost}</td>
                  		<td>${item.make}</td>
                  		<td>${item.supplied }</td>
                  		<td>${item.received}</td>
                  		<td>${item.reject}</td>
                  	   </tr>
              		   </c:forEach> 
		 </tbody>
                   </table>
                </div>
                 <div class="row">
                     <!-- <div class="col-lg-3"></div> -->
                     <div class="form-group  col-lg-12">
                     	<label><spring:message code="remarks.label" /></label>
                        <textarea class="form-control" readonly="readonly" style="resize: none;" name="remarks" id="remarks" rows="2" >${procurementReceipt.remarks}</textarea>
					</div>
                            <!--  <div class="col-lg-3"></div> -->
                    </div>
                    
                      <div class="row">
                       <div class="col-lg-4"></div>
                        <div class="col-lg-4">
                        <div class="form-group col-lg-6" >
                           <label><spring:message code="totalquantity.label"/>: </label>
                           <label id="totalQty">${procurementReceipt.receipt_total_qty}</label>
                        </div>
                         <div class="form-group col-lg-6">
                             <label><spring:message code="cost.label"/>: </label>
                             <label id="totalCost">${procurementReceipt.grand_total}</label>
                         </div>
                         </div>
                         <div class="col-lg-4"></div>
                     </div>
                </div><!-- /.box-body -->
			  <div class="row" style="text-align: center;">
			<input type="button" class="btn bg-olive btn-inline" onclick="return viewProcurement('all','goodsReceipts');" value="<spring:message code="cancel.label" />" />
			</div>  
		<br/>
        <div class="box-footer">
                             
        </div>
     </form>
   </div>
     
</div>
</div>
</section><!-- /.content -->

</body>
</html>