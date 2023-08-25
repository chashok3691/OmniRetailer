<!--/*
 * Project Name 	        : OmniRetailerCustomer
 * Written By		        : Sahitya
 * file name		        : inventorymanager/warehouse/goodsTransfer/allstockreceipts.jsp
 * file type		        : JSP
 * description				: The new storage system form is displayed using this jsp
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

</style>  

</head>
<body>


 <!-- Content Header (Page header) -->

<!-- Main content -->
<section class="content">
<div class="row">
  <div class="col-lg-12">
  <div class="box box-primary">
                                <div class="box-header" >


						<c:if test="${operation == 'all'}">
							<h3 class="box-title">
								<spring:message code="allgoodsreceipt.label" />
							</h3>
						</c:if>
						<c:if test="${operation == 'draft'}">
							<h3 class="box-title">
								<spring:message code="draftstockreceipt.label" />
							</h3>
						</c:if>

					</div><!-- /.box-header -->
                                <div class="box-body table-responsive">
                                	
				                    <div class="row">
				                      <div class="col-lg-3"></div>
				                      <div class="col-lg-6">
				                      <div class="row">
				                         <div class="col-lg-5" style="text-align:center;top:5px;">
				                           <label><spring:message code="warehouselocation.label"/></label>
				                         </div>
				                         <div class="col-lg-6">
				                           <select class="form-control" id="receipt_location" onchange="getWarehouseStockReceiptsByLocation('all');">
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
				                    
                                    <table id="receipts" class="table table-bordered table-striped">
                                   
                                    <div class="row">
									 <div class="buttons" style="margin-bottom: 7px;">
		  				               <a onclick="return newWarehouseStockReceiptView();" class="button"><font size="2px"><spring:message code="addnew.label" /></font></a>&nbsp;&nbsp;&nbsp;
		  				               <a onclick="return getWarehouseStockReceiptsByLocation('draft');" class="button"><font size="2px"><spring:message code="drafts.label" /></font></a>&nbsp;&nbsp;&nbsp;
		  				               <a onclick="getWarehouseStockReceiptsByLocation('all');" class="button"><font size="2px"><spring:message code="all.receipts.label"/></font></a>
		   			                </div>
                                        <thead style="background-color: #3c8dbc; color: #ffffff">
                                            <tr>
                                            	<th><spring:message code="goodsreceiptref.label" /></th>
                                                <th><spring:message code="shipped.from.label" /></th>
                                                <th><spring:message code="receiptlocation.label" /></th>
                                                <th><spring:message code="receipt.label" /> <spring:message code="total.label" /></th>
                                                <th><spring:message code="receipt.label" /> <spring:message code="totalquantity.label" /></th>
                                                <th><spring:message code="status.label" /> </th>
                                                <th><spring:message code="action.label" /> </th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                           <c:forEach var="stockReceiptList" items="${stockReceiptDetailsList}">
                                        	 <tr>
                                            	<td>${stockReceiptList.goods_receipt_ref_num}</td>
                                                <td>${stockReceiptList.shipped_from}</td>
                                                <td>${stockReceiptList.receipt_location}</td>
                                                <td>${stockReceiptList.receipt_total}</td>
                                                <td>${stockReceiptList.receipt_total_qty}</td>
                                                <td>${stockReceiptList.status}</td>
                                                <c:choose>
                                                  <c:when test="${stockReceiptList.status=='draft'}">
                                                    <td><a style="color:#2e7ea7 !important;cursor: pointer;" onclick="editWarehouseStockReceipt('${stockReceiptList.goods_receipt_ref_num}');"><spring:message code="edit.label"/></a></td>
                                                  </c:when>
                                                  <c:otherwise>
                                                   <td><a style="color:#2e7ea7 !important;cursor: pointer;" onclick="viewWarehouseStockReceipt('${stockReceiptList.goods_receipt_ref_num}');"><spring:message code="view.label"/></a></td>
                                                  </c:otherwise>
                                                </c:choose>
                                             </tr>
                                           </c:forEach>
                                        </tbody>
                                       
                                    </table>
                                    
                                </div><!-- /.box-body -->
                            </div><!-- /.box -->
  
</div>
</div>
</section><!-- /.content -->
		<!-- DATA TABES SCRIPT -->
       <script src="${pageContext.request.contextPath}/js/plugins/datatables/jquery.dataTables.js" type="text/javascript"></script>
        <script src="${pageContext.request.contextPath}/js/plugins/datatables/dataTables.bootstrap.js" type="text/javascript"></script>
         <!-- page script -->
        <script type="text/javascript">
            $(function() {
                $("#receipts").dataTable();
                 });
        </script>
        <input type="hidden" id="deleteActionLabel" value="<spring:message code="receiptstock.label" />"/>
</body>
</html>