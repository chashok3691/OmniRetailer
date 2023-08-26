<!--/*
 * Project Name 	        : OmniRetailerCustomer
 * Written By		        : Sahitya
 * file name		        : inventorymanager/retailoutlets/stockLedger.jsp
 * file type		        : JSP
 * description				: The new storage system form is displayed using this jsp
 * */ -->

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    <!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Welcome | Omni Retailer</title>
        <meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>
        <!-- <script type="text/javascript" src="${pageContext.request.contextPath}/js/validation.js"></script> -->
        <!-- DATA TABLES -->
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/omniretailer.css">
        <link href="${pageContext.request.contextPath}/css/datatables/dataTables.bootstrap.css" rel="stylesheet" type="text/css" />
        <script type="text/javascript" src="${pageContext.request.contextPath}/js/controller.js"></script>
        
<style type="text/css">
.buttons {
	float: right;
	padding-top: 0px;
	margin-right: 25px;
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
.table-bordered>tbody>tr>td, .table-bordered>tbody>tr>th, .table-bordered>tfoot>tr>td, .table-bordered>tfoot>tr>th, .table-bordered>thead>tr>td, .table-bordered>thead>tr>th{
 border: 0px !important;
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
          <div class="box-header" align="center">
				<h3 class="box-title" >
				<spring:message code="supplies.label" />
				</h3>			
				</div><!-- /.box-header -->
				<div class="row">
					<div class="buttons">
						
					</div>
				</div>
                    <div class="box-body table-responsive">
				         <table id="stockLedger" class="table table-bordered table-striped">
                            <thead style="background-color: #3c8dbc; color: #ffffff">
                               <tr>
                                	<th><spring:message code="s.no.label" /></th>
                                	  <th><spring:message code="supplier.id.label" /></th>
                                    <th><spring:message code="skuMaster.supplier.name.label" /></th>
                                    <th><spring:message code="deal_start_date.label" /></th>
                                    <th><spring:message code="newarrival.enddate" /></th>
                                    <th><spring:message code="sku.label" /></th>
                                      <th><spring:message code="sku.name.label" /></th>
                                        <th><spring:message code="uom.label" /></th>
                                        <th><spring:message code="price.label" /></th>
                                        <th><spring:message code="Cost.label" /></th>
                                </tr>
                            </thead>
                            <%-- <tbody style="text-align: center;">
                             <c:forEach var="stockLedgerDetails" items="${stockLedgerDetailsList}">
                          	 <tr>
                                  <td>${stockLedgerDetails.serialNum}</td>
                                  <td>${stockLedgerDetails.strDate}</td>
                                  <fmt:formatNumber var="soldQuantity" type="number" minFractionDigits="2" maxFractionDigits="2" value="${stockLedgerDetails.soldQuantity}" />
                                  <td>${soldQuantity}</td>
                                  <fmt:formatNumber var="transferedQuantity" type="number" minFractionDigits="2" maxFractionDigits="2" value="${stockLedgerDetails.transferedQuantity}" />
                                  <td>${transferedQuantity}</td>
                                  <fmt:formatNumber var="stockReceipts" type="number" minFractionDigits="2" maxFractionDigits="2" value="${stockLedgerDetails.stockReceipts}" />
                                  <td>${stockReceipts}</td>
                                  <fmt:formatNumber var="netStock" type="number" minFractionDigits="2" maxFractionDigits="2" value="${stockLedgerDetails.netStock}" />
                                  <td>${netStock}</td>
                              </tr>
                             </c:forEach>
                          </tbody> --%>
                      </table>
                      <br>
                      
                       <div class="col-lg-8"></div>
                        
                       
                       <div class="col-lg-4" style="padding-right: 0px; text-align: right;" >
             <!-- <div class="col-lg-12" style="border-top: 2px solid #ccc;padding-left: 0px;padding-right: 0px;    border-radius: 5px; background: #ccc;"> -->
                 <div class="col-lg-6 col-sm-6" style="text-align: right;font-size: 16px">Total Quantity</div>
					<div class="col-lg-6 col-sm-6" style="text-align: left;">: ${totalquantity} </div>
				
					 <div class="col-lg-12" style="padding-left: 0px;padding-right: 0px;"></div>
             <div class="col-lg-6 col-sm-6" style="text-align: right;font-size: 16px">Total Value</div>
					<div class="col-lg-6 col-sm-6" style="text-align: left;">: ${totalcost} </div>
					</div>
           
                       
					 <div class="col-lg-4" style="padding-left: 0px;padding-right: 0px;"></div>
             <div class="col-lg-6 col-sm-6" style="text-align: right;font-size: 16px">Total Shipments</div>
					<div class="col-lg-6 col-sm-6" style="text-align: left;">: </div>
					</div>
                      
              <div class="row">
               <input type="hidden" id="flowUnder" value="${flowUnder}">
              	<c:if test="${index-1 == 0 && totalRecords >10}">
              		<div class="form-group col-lg-12" style="text-align: right;">
              		<input type="button" class='paginationButton' value="&#60;" onclick=""> ${index} - ${totalValue} of ${totalRecords} 
              		<input type="button" class='paginationButton' value="&#62;" onclick="stockLedger('${skuId}','${totalValue}','${stockType}')">
              	</div>
              	</c:if>
              	
              	<c:if test="${totalValue == totalRecords}">
              			<c:if test="${totalValue-10 >0}">
              				<div class="form-group col-lg-12" style="text-align: right;">
              		<input type="button" class='paginationButton' value="&#60;" onclick="return stockLedger('${skuId}','${index - 11}','${stockType}');"> ${index} - ${totalValue} of ${totalRecords} 
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
              		<input type="button" class='paginationButton' value="&#60;" onclick="return stockLedger('${skuId}','${index - 11}','${stockType}');"> ${index} - ${totalValue} of ${totalRecords} .
              		<input type="button" class='paginationButton' value="&#62;" onclick="stockLedger('${skuId}','${totalValue}','${stockType}')">
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
                $("#stockLedger").dataTable({
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