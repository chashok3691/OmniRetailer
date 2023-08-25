<!--/*
 * Project Name 	        : OmniRetailerCustomer
 * Written By		        : Sahitya
 * file name		        : inventorymanager/retailoutlets/stockVerificationReport.jsp
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
						<spring:message code="stock.verification.report.label"/>
					 </h3>
                     </div><!-- /.box-header -->
                                <div class="box-body table-responsive">
                                	<div class="row">
				                      <div class="col-lg-3"></div>
				                      <div class="col-lg-6">
				                       <div class="row">
				                         <div class="col-lg-4" style="text-align:center;top:5px;">
				                           <label><spring:message code="outletlocation.label"/></label>
				                         </div>
				                         <div class="col-lg-7">
				                            <select class="form-control" id="outletLocation" onchange="viewOutletStockVerificationReport('outletStockVerificationReport','0');">
 				                             <c:forEach var="location" items="${locationsList}">
<%-- 												<option value="${location}" ${location == selectedLocation ? 'selected' : ''} id="${location}">${location}</option> --%>
											<c:choose>
							   <c:when test="${location.description == ''}">
							    <option value="${location.locationId}" ${location.locationId == loc ? 'selected' : ''}>${location.locationId}</option>
							   </c:when>
							  <c:otherwise>
							   <option value="${location.locationId}" ${location.locationId == loc ? 'selected' : ''}>${location.locationId}-${location.description}</option>
							  </c:otherwise>
							 </c:choose>
											 </c:forEach>
                                         </select>
				                         </div>
				                      </div>
				                      </div>
				                     <div class="col-lg-3"></div>
				                    </div>
				                    
				                    
                                    <table id="verifiedProductStocks" class="table table-bordered table-striped">
                                     <thead style="background-color: #3c8dbc; color: #ffffff">
                                            <tr>
                                                <th><spring:message code="s.no.label" /></th>
                                            	<th><spring:message code="skuid.label" /></th>
                                                <th><spring:message code="category.label" /></th>
                                                <th><spring:message code="date.label" /></th>
                                                <th><spring:message code="book.qty.label" /></th>
                                                <th><spring:message code="verified.qty.label" /> </th>
                                                <th><spring:message code="stock.loss.qty.label" /> </th>
                                                <th><spring:message code="losstype.label" /> </th>
                                                <th><spring:message code="EmployeeForm.action" /></th>
                                            </tr>
                                        </thead>
                                        <tbody style="text-align: center;">
                                           <c:forEach var="verificationDetails" items="${verificationDetailsList}">
                                            <tr>
                                            	<td>${verificationDetails.serialNumber}</td>
                                            	<%-- <td><a style="color:#2e7ea7 !important;cursor: pointer;" onclick="return stockLedger('${verificationDetails.skuId}','0','','verify')">${verificationDetails.skuId}</a></td> --%>
                                            	<td>${verificationDetails.skuId}</td>
                                            	<td>${verificationDetails.category}</td>
                                            	<td>${verificationDetails.verifiedDate}</td>
                                            	<td>${verificationDetails.bookQuantity}</td>
                                            	<td>${verificationDetails.verifiedQuantity}</td>
                                            	<td>${verificationDetails.stockLoss}</td>
                                            	<td>${verificationDetails.lossType}</td>
                                            	<%-- <td><a style="color:#2e7ea7 !important;cursor: pointer;" onclick="return stockLedger('${verificationDetails.skuId}','0','','verify')">View Ledger</a></td> --%>
                                            <td><a style="color:#2e7ea7 !important;cursor: pointer;" onclick="return stockLedger('${verificationDetails.skuId}','0','','verify','','','','','','','','','','','');">View Ledger</a></td>
                                            </tr>
                                          </c:forEach>
                                        </tbody>
                                    </table>
               <div class="row">
              	<c:if test="${index-1 == 0 && totalRecords >10}">
              		<div class="form-group col-lg-6" style="text-align: left;">
              		<input type="button" class='paginationButton' value="&#60;" onclick=""> ${index} - ${totalValue} of ${totalRecords} 
              		<input type="button" class='paginationButton' value="&#62;" onclick="viewOutletStockVerificationReport('outletStockVerificationReport','${totalValue}')">
              	</div>
              	</c:if>
              	
              	<c:if test="${totalValue == totalRecords}">
              			<c:if test="${totalValue-10 >0}">
              				<div class="form-group col-lg-6" style="text-align: left;">
              		<input type="button" class='paginationButton' value="&#60;" onclick="return viewOutletStockVerificationReport('outletStockVerificationReport','${index - 11}');"> ${index} - ${totalValue} of ${totalRecords} 
              		<input type="button" class='paginationButton' value="&#62;" >
              		</div>
              			</c:if>
              			<c:if test="${totalValue-10 <= 0}">
              		<div class="form-group col-lg-6" style="text-align: left;">
              		<input type="button" class='paginationButton' value="&#60;"> ${index} - ${totalValue} of ${totalRecords} 
              		<input type="button" class='paginationButton' value="&#62;" >
              	</div>
              	</c:if>
              	</c:if>
              	<c:if test="${index-1 != 0 &&  totalValue != totalRecords}">
              		<div class="form-group col-lg-6" style="text-align: left;">
              		<input type="button" class='paginationButton' value="&#60;" onclick="return viewOutletStockVerificationReport('outletStockVerificationReport','${index - 11}');"> ${index} - ${totalValue} of ${totalRecords} .
              		<input type="button" class='paginationButton' value="&#62;" onclick="viewOutletStockVerificationReport('outletStockVerificationReport','${totalValue}')">
              	</div> 
              	</c:if>
              	
              	
              	
              		<div class="col-lg-6" style="text-align: right;"> 
              	<div class="col-lg-8" style="text-align: right;padding-right: 0px;margin-top: 2px;font-size: 16px;"><spring:message code="pages.label" /></div>
              	<div class="col-lg-2" style="padding-right: 0px;">
              		<select class="form-control" id="pagination">
              		<c:set var="totalRecords" value="${totalRecords+1}"></c:set>
              	<c:forEach var="i" begin="0" end="${totalRecords}">
              	<c:if test="${(totalRecords-maxRecords)>0}">
              		<option value="${(i*maxRecords)}" ${index-1 == i*maxRecords ? 'selected' : ''}> ${i+1}</option>
              		<c:set var="totalRecords" value="${totalRecords-maxRecords}"></c:set>
              	</c:if>
				</c:forEach>
					</select>
              	
              	</div>
              		<div class="col-lg-2" style="padding-right: 0px;">
              		  <input type="button" onclick="viewOutletStockVerificationReport('outletStockVerificationReport',document.getElementById('pagination').value)" class="btn bg-olive btn-inline  addBtn" value="GO">
              		</div>
              		</div>
              	
              	
              	
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
                $("#verifiedProductStocks").dataTable({
       			  "bPaginate": false,
                  "bLengthChange": false,
                  "bFilter": false,
                  "bSort": false,
                  "bInfo": false,
                  "bAutoWidth": false
    		});
          });
        </script>
        
</body>
</html>