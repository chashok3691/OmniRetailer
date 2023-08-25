<!--/*
 * Project Name 	        : OmniRetailerCustomer
 * Written By		        : Sahitya
 * file name		        : Inventory Manager/warehouse/stockVerification/allverifiedstockitems.jsp
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
.modal-dialog {
    width: auto;
    margin: 30px auto;
}
.modal-dialog
{
 margin-top: 14.5%;
 }
.billsPopUp
{
	position: relative;
    border: 2px solid gray;
    border-radius: 10px;
    background: #eee;
    min-height: 400px;
    max-height: 500px;
  /*   margin-right:2%; */
}
.billsPopUpUpArrow
{
	float: right;
    margin-right: 1%;
    font-size: 35px;
    color: gray;
    position: relative;
    margin-top: -2.3%;
    border-bottom: 3px solid lightgrey;
    height: 25px;
    border-bottom-width: 2px;
}
@media (min-width:1400px) and (max-width:1600px)
{
.billsPopUp {
    	margin-left: -20px !important;
      /*   margin-right:2% !important; */
}
.modal-dialog
{
 margin-top: 13%;
 }
.billsPopUpUpArrow {
  margin-top: -2% !important;
  border-bottom-width: 3px !important;
 }
   
 }

@media only screen and (max-width:479px)
{
.billsPopUp {
    margin-right: -30px;
    margin-left: -30px;
}
.summaryImg{
		width: auto;
    float: left;
	}
}
@media (min-width: 1200px){
	.summaryBtn{
		margin-top: 3px;
	}
}
@media (min-width: 1200px){
	.summaryImg{
	     width: 49%;
    float: right;
	}
}
.billsPopUp::after {
    content: "";
    position: absolute;
    bottom: 100%;
    /* left: 50%; */
    right: 1.5%;
    /* margin-left: 9px; */
    border-width: 14px;
    border-style: solid;
    border-color: transparent transparent #eee transparent;
}
</style>  
</head>
<body>


 <!-- Content Header (Page header) -->
<%-- <section class="content-header">
   <h1><spring:message code="warehouse.management.label" />
     <small><spring:message code="stock.verification.label" /></small>
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
                     <h3 class="box-title" >
						<spring:message code="verified.label"/> <spring:message code="product.label"/> <spring:message code="stock.label"/> <spring:message code="items.label"/> - ${verificationCode}
					 </h3>
                     </div><!-- /.box-header -->
                       <input type="hidden" id="flowUnder" >  
                       <input type="hidden" id="location" >  
                     <div class="box-body table-responsive" >
                     <div class="row">
					      <div class="col-lg-1" style="margin-top: 10px;">
				                <select class="form-control" id="maxRecords" style="padding: 3px 4px;" onchange="viewSpecificStockVerification('${verificationCode}','0');">
				               		<option value="10" ${maxRecords == '10' ? 'selected' : ''}>10</option>
				               		<option value="25" ${maxRecords == '25' ? 'selected' : ''}>25</option>
				               		<option value="50" ${maxRecords == '50' ? 'selected' : ''}>50</option>
				              		<option value="100" ${maxRecords == '100' ? 'selected' : ''}>100</option>
				               	</select>
				           </div>
				           <div class="col-lg-10"></div>
				           <div class="col-lg-1" style="margin-top: 10px;">
				           		<input type="button" style="padding: 4px 13px;float:right;" class="btn bg-olive btn-inline" onclick="viewWarehouseStockVerification('${flowUnder}StockVerification','0','${flowUnder}','','${masterverificationCode}','','')" value="<spring:message code="back.label" />" />
					           <%-- <div class="buttons" style="">
				                	<a onclick="viewWarehouseProductStockVerification();" class="button"><font size="2px"><spring:message code="back.label" /></font></a>&nbsp;&nbsp;&nbsp;
				                </div> --%>
				           </div>
				       </div>
                     <%-- <div class="row">
                     	<div class="buttons" style="margin-bottom: 7px;">
		                	<a onclick="viewWarehouseProductStockVerification();" class="button"><font size="2px"><spring:message code="back.label" /></font></a>&nbsp;&nbsp;&nbsp;
		                </div>
		             </div> --%>
		              <div class="row">
			                <div class="col-lg-11"></div>
			                <div class="col-lg-1 summaryBtn">
			                <a id="summaryTag"  data-toggle="modal" data-target="#items-modal">
			                	<img class="summaryImg" src="${pageContext.request.contextPath}/images/summary.png" style="cursor: pointer;" >
			                </a>
			                </div>
			          </div>
			          <div style="overflow: auto;">
                           <table id="verifiedProductStockItems" class="table table-bordered table-striped" >
                               <thead style="background-color: #3c8dbc; color: #ffffff">
                                      <tr>
                                      	  <th><div style="width: 45px;"><spring:message code="sl.no.label" /></div></th>
                                          <th><div style="width: 45px;"><spring:message code="skuid.label" /></div></th>
                                          <th><div style="width: 65px;"><spring:message code="plu.code.label" /></div></th>
                                      	  <th><div style="width: 150px;"><spring:message code="sku.desc.label" /></div></th>
                                      	  <%-- <th><div style="width: 50px;"><spring:message code="category.label" /></div></th> --%>
                                      	  <th><div style="width: 65px;"><spring:message code="cost.price.label" /></div></th>
                                          <th><div style="width: 45px;"><spring:message code="mrp.label" /></div></th>
                                          <th><div style="width: 65px;"><spring:message code="sale.price.label" /></div></th>
                                           <th><div style="width: 65px;"><spring:message code="book.qty.label" /></div></th>
                                           <th><div style="width: 80px;"><spring:message code="physical.qty.label" /></div></th>
                                           <th><div style="width: 90px;"><spring:message code="cost.price.val.label" /></div></th>
                                           <th><div style="width: 55px;"><spring:message code="mrp.val.label" /></div></th>
                                            <th><div style="width: 65px;"><spring:message code="sale.price.val.label" /></div></th>
                                            <th><div style="width: 95px;"><spring:message code="stock.loss.qty.label" /></div></th>
                                            <th><div style="width: 140px;"><spring:message code="cost.price.varience.label" /></div></th>
                                            <th><div style="width: 85px;"><spring:message code="mrp.varience.label" /></div></th>
                                            <th><div style="width: 135px;"><spring:message code="sale.price.varience.label" /></div></th>
                                            <%-- <th><div style="width: 45px;"><spring:message code="sl.no.label" /></div></th>
                                            <th><spring:message code="product.code.label" /></th>
                                            <th><spring:message code="skuid.label" /></th>
                                            <th><spring:message code="description.label" /></th>
                                           	<th><spring:message code="book.qty.label" /></th>
                                           	<th><spring:message code="physical.qty.label" /></th>
                                           	<th><spring:message code="stockloss.label" /></th>
                                           	 <th><spring:message code="losstype.label" /> </th>
                                           	<th><spring:message code="skuallocated.label" /></th> --%>
                                      </tr>
                                  </thead>
                                  <tbody style="text-align: center;">
                                     <c:forEach var="productStockVerificationItemDetails" items="${productStockVerificationItemDetailsList}">
                                      <tr>
                                      	<td>${productStockVerificationItemDetails.slNo}</td>
                                      	<td>${productStockVerificationItemDetails.sku_id}</td>
                                      	<td>${productStockVerificationItemDetails.pluCode}</td>
                                      	<td>${productStockVerificationItemDetails.skuDescription}</td>
                                      	<%-- <td>${productStockVerificationItemDetails.category}</td> --%>
                                      	<td>${productStockVerificationItemDetails.skuCostPrice}</td>
                                      	<td>${productStockVerificationItemDetails.skuMrp}</td>	
                                      	<td>${productStockVerificationItemDetails.skuSalePrice}</td>
                                      	<td>${productStockVerificationItemDetails.sku_book_stock}</td>
                                      	<td>${productStockVerificationItemDetails.sku_physical_stock}</td>
                                      	<td>${productStockVerificationItemDetails.costPriceValue}</td>
                                      	<td>${productStockVerificationItemDetails.mrpValue}</td>
                                      	<td>${productStockVerificationItemDetails.salePriceValue}</td>
                                      	<td>${productStockVerificationItemDetails.stock_loss}</td>
                                      	<td>${productStockVerificationItemDetails.costPriceVariance}</td>
                                      	<td>${productStockVerificationItemDetails.mrpVariance}</td>
                                      	<td>${productStockVerificationItemDetails.salePriceVariance}</td>
                                      	<%-- <td>${productStockVerificationItemDetails.slNo}</td>
                                       	<td>${productStockVerificationItemDetails.product_id}</td>
                                       	<td>${productStockVerificationItemDetails.sku_id}</td>
                                       	<td>${productStockVerificationItemDetails.description}</td>
                                       <td>${productStockVerificationItemDetails.sku_book_stock}</td>
                                       <td>${productStockVerificationItemDetails.sku_physical_stock}</td>
                                       	<td>${productStockVerificationItemDetails.stock_loss}</td>
                                       	<td>${productStockVerificationItemDetails.loss_type}</td>
                                       	<td>${productStockVerificationItemDetails.sku_allocated}</td> --%>
                                      </tr>
                                    </c:forEach>
                                  </tbody>
                              </table>
                              </div>
                              
             <div class="row">
              	<c:if test="${index-1 == 0 && totalRecords >10}">
              		<div class="form-group col-lg-12" style="text-align: right;">
              		<input type="button" class='paginationButton' value="&#60;" onclick=""> ${index} - ${totalValue} of ${totalRecords} 
              		<input type="button" class='paginationButton' value="&#62;" onclick="viewSpecificStockVerification('${verificationCode}','${totalValue}')">
              	</div>
              	</c:if>
              	
              	<c:if test="${totalValue == totalRecords}">
              			<c:if test="${totalValue-10 >0}">
              				<div class="form-group col-lg-12" style="text-align: right;">
              		<input type="button" class='paginationButton' value="&#60;" onclick="return viewSpecificStockVerification('${verificationCode}','${index - 11}');"> ${index} - ${totalValue} of ${totalRecords} 
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
              		<input type="button" class='paginationButton' value="&#60;" onclick="return viewSpecificStockVerification('${verificationCode}','${index - 11}');"> ${index} - ${totalValue} of ${totalRecords} .
              		<input type="button" class='paginationButton' value="&#62;" onclick="viewSpecificStockVerification('${verificationCode}','${totalValue}')">
              	</div> 
              	</c:if>
              </div>  
                          </div><!-- /.box-body -->
                  </div><!-- /.box -->
      <div id="triggerEvent"></div>
    <!-- COMPOSE MESSAGE MODAL -->
    
    <div class="col-sm-12 col-lg-12 col-xs-12">
            
         <div class="modal fade popup-display" id="items-modal" tabindex="-1" role="dialog" aria-hidden="true">
            <div class="modal-dialog">
             <div class="col-sm-2 col-lg-2 col-xs-0">
    		</div>
           <div class="col-sm-10 col-lg-10 col-xs-12">
             <div class="modal-content billsPopUp" style="">
          
                 <div class="modal-header">
                        <button type="button" class="close" style="font-size: 30px" data-dismiss="modal" aria-hidden="true">&times;</button>
                        <h4 class="modal-title" style="text-align: center;"><div id="locationLable">${verificationCode}</div><div id="dateLable"></div></h4>
                    </div>
             <form action="#" method="post">
                 <div class="modal-body">
                  <div class="box-body table-responsive" id="summary">
                  	<%@ include file="verificationItemsReport.jsp" %>
                 </div>
              </div>
             </form> 
             </div><!-- /.modal-content -->
         </div><!-- /.modal-dialog -->
     </div><!-- /.modal -->
 	</div>
  </div>
			</div>
	</div>
</section>
        <script type="text/javascript">
            $(function() {
                $("#verifiedProductStockItems").dataTable({
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