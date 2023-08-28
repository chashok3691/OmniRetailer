<!--/*
 * Project Name 	        : OmniRetailerCustomer
 * Written By		        : Sambaiah Y
 * file name		        : Inventory Manager/Billing/billing.jsp
 * file type		        : JSP
 * description				: display total billings
 * */ -->

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <!DOCTYPE html>
<html>
<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Welcome | Omni Retailer</title>
        <meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>
        <!-- <script type="text/javascript" src="${pageContext.request.contextPath}/js/validation.js"></script> -->
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
.blinking{-webkit-animation: blink 1s infinite;-moz-animation: blink 1s infinite;animation: blink 1s infinite;color:#3c8dbc;}
@-webkit-keyframes blink{
 0%{ opacity:0;}
 100%{opacity:1;}
}
@-moz-keyframes blink{
    0%{ opacity:0;}
    100%{opacity:1;}
}
@keyframes blink{
    0%{ opacity:0;}
    100%{opacity:1;}
}
</style>  

</head>
<body>
	<section class="content-header">
		<h1><spring:message code="warehouse.management.label" />
		<small><spring:message code="procurement.label" /></small>
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
				<c:if test="${operation == 'all'}">
				      <h3 class="box-title"><spring:message code="allPurchaseOrder.label" /></h3>
				  </c:if>
				  <c:if test="${operation == 'draft'}">
				  	 <h3 class="box-title"><spring:message code="draftPurchaseOrder.label" /></h3>
				  </c:if>
			</div><!-- /.box-header -->
                                <div class="box-body table-responsive" >
				                    <div class="row">
				                      <div class="col-lg-3"></div>
				                      <div class="col-lg-6">
				                       <div class="row">
				                         <div class="col-lg-4" style="text-align:center;top:5px;">
				                           <label><spring:message code="warehouselocation.label"/></label>
				                         </div>
				                         <div class="col-lg-7">
				                           <select class="form-control" id="warehouse_location" onchange="viewPurchaseOrder('all','purchaseOrder');">
 				                             <c:forEach var="location" items="${locationsList}">
												<option value="${location}" ${location == selectedLocation ? 'selected' : ''} id="${location}" >${location}</option>
											 </c:forEach>
                                         </select>
				                         </div>
				                      </div>
				                      </div>
				                      <div class="col-lg-3"></div>
				                    </div>
				                    
				                   <div class="row">
										<div class="buttons" style="margin-bottom: 7px;">
											<a onclick="return vewNewPurchaseOrder();" class="button"><font size="2px"><spring:message code="addnew.label" /></font></a>&nbsp;&nbsp;&nbsp;
											<a onclick="return viewPurchaseOrder('draft','purchaseOrder');" class="button"><font size="2px"><spring:message code="drafts.label" /></font></a>&nbsp;&nbsp;&nbsp;
											<a onclick="return viewPurchaseOrder('all','purchaseOrder');" class="button"><font size="2px"><spring:message code="orders.label" /></font></a>
										</div>
									 </div>
                                    <table id="productstocks" class="table table-bordered table-striped">
                                     	<thead style="background-color: #3c8dbc; color: #ffffff">
                                            <tr>
                                            	<th><spring:message code="purchase.order.receipt.ref.label" /></th>
			               						<th><spring:message code="order.date.label" /></th>
			                 					<th><spring:message code="supplier.name.label" /></th>
			                 					<th><spring:message code="total.purchase.order.value.label" /></th>
			                 					<th><spring:message code="procurement.view.label" /></th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                           <c:if test="${operation == 'all'}">
		               						<c:forEach var="po" items="${purchaseOrderBeansList}">
		             		 				<tr>
		                 						<td>${po.PO_Ref}</td>
		                  						<td>${po.order_date}</td>
						                 	 	<td>${po.supplier_name}</td>
						                  		<td>${po.total_po_value }</td>
						                  		<td><a style="color:#2e7ea7 !important;cursor: pointer;" onclick="return viewPurchaseOrderDetails('${po.PO_Ref}','view')">View</a></td> 
											</tr>
						             	   </c:forEach> 
						               </c:if>
						               <c:if test="${operation == 'draft'}">
						               		<c:forEach var="po" items="${purchaseOrderBeansList}">
						             		 <tr>
						                 		<td>${po.PO_Ref}</td>
						                  		<td>${po.order_date}</td>
						                 	 	<td>${po.supplier_name}</td>
						                  		<td>${po.total_po_value }</td>
						                 	 	<td><a style="color:#2e7ea7 !important;cursor: pointer;" onclick="return viewPurchaseOrderDetails('${po.PO_Ref}','edit')">Edit</a></td> 
											</tr>
						             	   </c:forEach> 
						               </c:if>
                                        </tbody>
                                       
                                    </table>
                                    
                                </div><!-- /.box-body -->
                            </div><!-- /.box -->
  
</div>
</div>
</section>
        <script type="text/javascript">
            $(function() {
                $("#productstocks").dataTable();
                 });
        </script>
        <input type="hidden" id="status" value="${status}">
        <input type="hidden" id="deleteActionLabel" value="<spring:message code="receiptstock.label" />"/>
</body>
</html>