<!--/*
 * Project Name 	        : OmniRetailerCustomer
 * Written By		        : Sambaiah Y
 * file name		        : Inventory Manager/warehouse/procurement/procurement.jsp
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
	<%-- <section class="content-header">
		<h1><spring:message code="inventory.management.label" />
		<small><spring:message code="procurement.receipts.label" /></small>
	</h1>
    <ol class="breadcrumb">
        <li><a style="cursor: pointer;" onclick="return viewDashboard('inventorymanager');"><i class="fa fa-dashboard"></i><spring:message code="home.label" /></a></li>
		<li class="active"><a style="cursor: pointer;" onclick="showOutletFlows();"><spring:message code="restaurant_management.label" /></a></li>
		<li class="active"><a style="cursor: pointer;" onclick="showInventoryManagementFlows();"><spring:message code="inventory.management.label"/></a></li>
    </ol>
   </section> --%>
<!-- Main content -->
<section class="content">
<div class="row">
  <div class="col-lg-12">
  <div class="box box-primary">
           <div class="box-header">
				 <c:if test="${operation == 'all'}">
				      <h3 class="box-title"><spring:message code="allProcurement.label" /></h3>
				  </c:if>
				  <c:if test="${operation == 'draft'}">
				  	 <h3 class="box-title"><spring:message code="draftProcurement.label" /></h3>
				  </c:if>
			</div><!-- /.box-header -->
                                <div class="box-body table-responsive" >
				                    <div class="row">
				                      <div class="col-lg-3"></div>
				                      <div class="col-lg-6">
				                       <div class="row">
				                         <div class="col-lg-4" style="text-align:center;top:5px;">
				                           <label><spring:message code="outletlocation.label"/></label>
				                         </div>
				                         <div class="col-lg-7">
				                           <select class="form-control" id="outlet_location" onchange="viewProcurement('all','procurementReceipts');">
 				                             <c:forEach var="location" items="${locationsList}">
												<option value="${location}" ${location == selectedLocation ? 'selected' : ''} id="${location}" >${location}</option>
											 </c:forEach>
                                         </select>
				                         </div>
				                      </div>
				                      </div>
				                      <div class="col-lg-3"></div>
				                    </div>
				                  
				                    
                                    <table id="productstocks" class="table table-bordered table-striped">
                                    <div class="row">
										<div class="buttons" style="margin-bottom: 7px;">
											<a onclick="return viewNewProcurement();" class="button"><font size="2px"><spring:message code="addnew.label" /></font></a>&nbsp;&nbsp;&nbsp;
											<a onclick="return viewProcurement('draft','procurementReceipts');" class="button"><font size="2px"><spring:message code="drafts.label" /></font></a>&nbsp;&nbsp;&nbsp;
											<a onclick="return viewProcurement('all','procurementReceipts');" class="button"><font size="2px"><spring:message code="all.receipts.label" /></font></a>
										</div>
									 </div>
                                     	<thead style="background-color: #3c8dbc; color: #ffffff">
                                            <tr>
                                            	<th><spring:message code="procurement.receipt.ref.label" /></th>
					               				<th><spring:message code="supplier.name.label" /></th>
					                 			<th><spring:message code="po.reference.label" /></th>
					                 			<th><spring:message code="cost.label" /></th>
					                 			<th><spring:message code="totalquantity.label" /></th>
					                 			<th><spring:message code="procurement.status.label" /></th>
					                 			<th><spring:message code="procurement.view.label" /></th>
                                            </tr>
                                        </thead>
                                        <tbody style="text-align: center;">
                                           <c:if test="${operation == 'all'}">
							               		<c:forEach var="procurement" items="${procurementReceiptList}">
							             		 <tr>
							              			<td>${procurement.receipt_ref_num}</td>
							                  		<td>${procurement.supplier_name}</td>
							                 	 	<td>${procurement.po_reference}</td>
							                  		<td>${procurement.grand_total }</td>
							                  		<td>${procurement.receipt_total_qty}</td>
							                  		<td>${procurement.status}</td>
							                 	 	<td><a style="color:#2e7ea7 !important;cursor: pointer;" onclick="return viewProcurementDetails('${procurement.receipt_ref_num}')">View</a></td> 
												</tr>
							             	   </c:forEach> 
							               </c:if>
							               <c:if test="${operation == 'draft'}">
							               		<c:forEach var="procurement" items="${procurementReceiptList}">
							             		 <tr>
							              			<td>${procurement.receipt_ref_num}</td>
							                  		<td>${procurement.supplier_name}</td>
							                 	 	<td>${procurement.po_reference}</td>
							                  		<td>${procurement.grand_total }</td>
							                  		<td>${procurement.receipt_total_qty}</td>
							                  		<td>${procurement.status}</td>
							                 	 	<td><a style="color:#2e7ea7 !important;cursor: pointer;" onclick="return editProcurementDetails('${procurement.receipt_ref_num}')">Edit</a></td> 
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
<script src="${pageContext.request.contextPath}/js/plugins/datatables/jquery.dataTables.js" type="text/javascript"></script>
        <script src="${pageContext.request.contextPath}/js/plugins/datatables/dataTables.bootstrap.js" type="text/javascript"></script>
        <script type="text/javascript">
            $(function() {
            	 $('#productstocks').dataTable({
                     "bPaginate": true,
                     "bLengthChange": false,
                     "bFilter": false,
                     "bSort": false,
                     "bInfo": true,
                     "bAutoWidth": false
                 });
                 });
        </script>
        <input type="hidden" id="status" value="${status}">
        <input type="hidden" id="deleteActionLabel" value="<spring:message code="receiptstock.label" />"/>
</body>
</html>