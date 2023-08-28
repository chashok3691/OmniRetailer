<!--/*
 * Project Name 	        : OmniRetailerCustomer
 * Written By		        : Sahitya
 * file name		        : inventorymanager/retailoutlets/productstocks.jsp
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
	padding: 5px 10px 5px 10px;
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
   <h1><spring:message code="outlet.management.label" />
     <small><p id="heading"><spring:message code="stocks.label" /></p></small>
    </h1>
      <ol class="breadcrumb">
      	<li><a style="cursor: pointer;" onclick="return viewDashboard('inventorymanager');"><i class="fa fa-dashboard"></i><spring:message code="home.label" /></a></li>
        <li class="active"><spring:message code="outlet.management.label" /></li>
     </ol>
 </section> --%>
 <!-- Content Header (Page header) -->

<!-- Main content -->
<section class="content">
<div class="row">
  <div class="col-lg-12">
  <div class="box box-primary">
      <div class="box-header">
		<h3 class="box-title">
			<c:if test="${stockType == 'Normal Stock'}">
				<spring:message code="availablestock.label" />
			</c:if>
			<c:if test="${stockType == 'Ordered'}">
				<spring:message code="orderedstock.label" />
			</c:if>
			<c:if test="${stockType == 'Critical Stock'}">
				<spring:message code="criticalstock.label" />
			</c:if>
			<c:if test="${stockType == 'Blocked'}">
				<spring:message code="blockedstock.label" />
			</c:if>
			<c:if test="${stockType == 'Returned'}">
				<spring:message code="returnedstock.label" />
			</c:if>
			<c:if test="${stockType == 'Boneyard'}">
				<spring:message code="boneyard.label" />
			</c:if>
		</h3>
		</div><!-- /.box-header -->
             <div class="box-body table-responsive">
                  <div class="row">
                     <div class="col-lg-4"></div>
                      <div class="col-lg-4">
                      	<label><spring:message code="outletlocation.label"/></label>
                     	<select class="form-control" id="outletLocation" onchange="getProductStocksByCriteria('${stockType}');">
                            <c:forEach var="location" items="${locationsList}">
								<option value="${location}" ${location == selectedLocation ? 'selected' : ''} id="${location}" >${location}</option>
					 		</c:forEach>
                        </select>
                    </div>
                    <div class="col-lg-4"></div>
                  </div>
                     <table id="productstocks" class="table table-bordered table-striped">
                      <thead style="background-color: #3c8dbc; color: #ffffff">
                             <tr>
                             	 <c:if test="${stockType == 'Returned'}">
                                  <th><spring:message code="billing_id.label" /> </th>
                                 </c:if>
                             	<th><spring:message code="skuid.label" /></th>
                             	<th><spring:message code="description.label" /></th>
                             	<c:if test="${stockType != 'Returned' && stockType != 'Ordered'}">
                                  <th><spring:message code="product.code.label" /></th>
                                  <th><spring:message code="category.label" /></th>
                                 </c:if>
                                  <c:if test="${stockType == 'Critical Stock' || stockType == 'Normal Stock' || stockType == 'Ordered'}">
                                  <th><spring:message code="reorderpoint.label" /> </th>
                                 </c:if>
                                  <c:if test="${stockType != 'Boneyard'}">
                                  <th><spring:message code="quantity.label" /></th>
                                  </c:if>
                                 <c:if test="${stockType == 'Boneyard'}">
                                  <th><spring:message code="available.qty.label" /></th>
                                  	<th><spring:message code="scarp.qty.label" /></th>
                                 </c:if>
                                 <c:if test="${stockType != 'Boneyard'}">
                                 	<th><spring:message code="price.label" /></th>
                                 </c:if>
                                 <c:if test="${stockType == 'Ordered' || stockType == 'Returned'}">
                                 	<th><spring:message code="total.price.label" /></th>
                                 </c:if>
                                 <th><spring:message code="EmployeeForm.action" /></th>
                             </tr>
                         </thead>
                         <tbody style="text-align: center;">
                            <c:forEach var="stockDetails" items="${skuDetailsList}">
                         	 <tr>
                         	 	 <c:if test="${stockType == 'Returned'}">
                                  <td>${stockDetails.billID}</td>
                                 </c:if>
                             	<td>${stockDetails.skuID}</td>
                             	 <c:if test="${stockType == 'Ordered'}">
                             	 	<td>${stockDetails.itemDesc}</td>
                             	 </c:if>
                             	 <c:if test="${stockType == 'Returned'}">
                             	 	<td>${stockDetails.productName}</td>
                             	 </c:if>
                             	  <c:if test="${stockType != 'Returned' && stockType != 'Ordered'}">
                                  <td>${stockDetails.description}</td>
                                  <td>${stockDetails.productId}</td>
                                  <td>${stockDetails.category}</td>
                             	 </c:if>
                             	 <c:if test="${stockType == 'Critical Stock' || stockType == 'Normal Stock' || stockType == 'Ordered'}">
                                 	<td>${stockDetails.reorderPoint}</td>
                                 </c:if>
                                 <c:if test="${stockType == 'Critical Stock' || stockType == 'Normal Stock'}">
                                  <td>${stockDetails.quantity}</td>
                                 </c:if>
                                 <c:if test="${stockType == 'Ordered'}">
                                  <td>${stockDetails.quantity}</td>
                                 </c:if>
                                 <c:if test="${stockType == 'Blocked'}">
                                  <td>${stockDetails.blockedQty}</td>
                                 </c:if>
                                  <c:if test="${stockType == 'Returned'}">
                                  <td>${stockDetails.quantity}</td>
                                 </c:if>
                                  <c:if test="${stockType == 'Boneyard'}">
                                  	<td>${stockDetails.quantity}</td>
                                  	<td>${stockDetails.scrapedQty}</td>
                                  </c:if>
                                
                                 <c:if test="${stockType != 'Boneyard' && stockType != 'Ordered'}">
                                 	<td>${stockDetails.price}</td>
                                 </c:if>
                                 <c:if test="${stockType == 'Ordered'}">
                                 	<td>${stockDetails.itemPrice}</td>
                                 </c:if>
                                  <c:if test="${stockType == 'Ordered'}">
                                 	<td>${stockDetails.totalCost}</td>
                                 </c:if>
                                  <c:if test="${stockType == 'Returned'}">
                                  	<td>${stockDetails.cost}</td>
                                  </c:if>
                                  <td><a style="color:#2e7ea7 !important;cursor: pointer;" onclick="return stockLedger('${stockDetails.skuID}','0','${stockType}','stock')">View Ledger</a></td>
                             </tr>
                            </c:forEach>
                         </tbody>
                     </table>
              <div class="row">
              	<c:if test="${index-1 == 0 && totalRecords >10}">
              		<div class="form-group col-lg-12" style="text-align: right;">
              		<input type="button" class='paginationButton' value="&#60;" onclick=""> ${index} - ${totalValue} of ${totalRecords} 
              		<input type="button" class='paginationButton' value="&#62;" onclick="viewOutletStocks('outletStocks','${stockType}','${totalValue}')">
              	</div>
              	</c:if>
              	
              	<c:if test="${totalValue == totalRecords}">
              			<c:if test="${totalValue-10 >0}">
              				<div class="form-group col-lg-12" style="text-align: right;">
              		<input type="button" class='paginationButton' value="&#60;" onclick="return viewOutletStocks('outletStocks','${stockType}','${index - 11}');"> ${index} - ${totalValue} of ${totalRecords} 
              		<input type="button" class='paginationButton' value="&#62;" >
              		</div>
              			</c:if>
              			<c:if test="${totalValue-10 <= 0}">
              		<div class="form-group col-lg-12" style="text-align: right;">
              		<input type="button" class='paginationButton' value="&#60;"> ${index} - ${totalValue} of ${totalRecords} 
              		<input type="button" class='paginationButton' value="&#62;" >
              	</div>
              	</c:if>
              	</c:if>
              	<c:if test="${index-1 != 0 &&  totalValue != totalRecords}">
              		<div class="form-group col-lg-12" style="text-align: right;">
              		<input type="button" class='paginationButton' value="&#60;" onclick="return viewOutletStocks('outletStocks','${stockType}','${index - 11}');"> ${index} - ${totalValue} of ${totalRecords} .
              		<input type="button" class='paginationButton' value="&#62;" onclick="viewOutletStocks('outletStocks','${stockType}','${totalValue}')">
              	</div> 
              	</c:if>
              </div>    
                                </div><!-- /.box-body -->
                            </div><!-- /.box -->
  
</div>
</div>
</section>
 <script src="${pageContext.request.contextPath}/js/plugins/datatables/jquery.dataTables.js" type="text/javascript"></script>
        <script src="${pageContext.request.contextPath}/js/plugins/datatables/dataTables.bootstrap.js" type="text/javascript"></script>
        <script type="text/javascript">
            $(function() {
                $("#productstocks").dataTable({
       			  "bPaginate": false,
                  "bLengthChange": false,
                  "bFilter": false,
                  "bSort": false,
                  "bInfo": false,
                  "bAutoWidth": false
    			});
            });
        </script>
        <input type="hidden" id="deleteActionLabel" value="<spring:message code="receiptstock.label" />"/>
</body>
</html>