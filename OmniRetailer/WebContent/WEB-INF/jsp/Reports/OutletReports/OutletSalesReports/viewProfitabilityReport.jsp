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
        
        <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.calendars.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.calendars.plus.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.calendars.picker.js"></script>
        
<style type="text/css">
.buttons {
	float: right;
	padding-top: 0px;
	margin-right: 2%;
	margin-top:1%;
}



.searchbutton{
/* background-image: url(../images/search.png); */
    background-position: right;
    text-align: left;
    height: 30PX;
    background-repeat: no-repeat;
    margin-bottom: 2px;
    background-origin: content-box;
    width: 41px;
    padding: 4px 10px;
    border-left: 1px solid #ccc;
    /* background: #3c8dbc; */
    z-index: 999;
    position: absolute;
    background-color: #3c8dbc;
        right: 0;
    top: 0;
}

a.button, .list a.button {
/* position:relative;
	text-decoration: none;
	color: #FFF;
	display: inline-block;
	padding: 5px 10px 5px 10px;
	background: #3c8dbc;

	border-radius: 5px;
	box-shadow:1px 0px 2px #000;
	cursor:pointer;
	behavior : url(css/PIE.htc);  */
}
.col-lg1-2{
    width: 20% !important;
}
a.run{
    margin-top: 0px;
    margin-bottom: 0px;
    height: 30px;
    padding-top: 5px;
    padding-bottom: 5px;
    background: #3c8dbc;
    position: relative;
    text-decoration: none;
    color: white;
    display: inline-block;
    cursor: pointer;
    text-align: center;
    width: 100%;
}
a.download{
    display: inline-block;
    /* padding-left: 15px; */
    float: right;
    padding-right: 5px;
    font-size: 22px;
    font-weight: bold;
    cursor: pointer;
    color: grey;
}
.allignment{
  /*    width: 13.3%; */
    padding-right: 0px;
    padding-left: 0px;
}
.col-lg1-2{
    width: 20% !important;
}
a.button{
  position: relative;
    text-decoration: none;
    color: white;
    display: inline-block;
    padding: 4px 10px 28px 10px;
    background: #3c8dbc;
    /* border-radius: 5px; */
    /* box-shadow: 1px 0px 2px #000; */
    cursor: pointer;
    margin-top: 19.5px;
    height: 25px;
    text-align: center;
    margin-bottom: 19px;
    width: 100%;
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
<script type="text/javascript">
$(document).ready(function(){
	//$("#billDate").trigger("click");
	
	$('#profitReportSearch').click(function(){
        var search = $('#profitsearch').val();
        return viewprofitabilityReports('salesReportProfitabilityReport','0',search);
    })
    $('#profitsearch').keypress(function(e){
        if(e.which == 13){//Enter key pressed
            $('#profitReportSearch').click();//Trigger search button click event
        }
    });
});


</script>
</head>
<body>

<!-- Main content -->
<section class="">
<div class="row">
  <div class="col-lg-12">
  
                                <div class="box-body table-responsive">
				                      <div class="row">
				                     <input type="hidden" id="stockdownloadurl" value="${downloadurl}">
				                   <!--    <input type="hidden" id="skuSales" value=""> -->
				                       <div class="col-lg-1">
				                       <label>Show</label> 
				                      	<select class="form-control" id="maxRecords" style="padding: 3px 4px;" onchange="viewprofitabilityReports('salesReportProfitabilityReport','0','');">
				                      		<option value="10" ${maxRecords == '10' ? 'selected' : ''}>10</option>
				                      		<option value="25" ${maxRecords == '25' ? 'selected' : ''}>25</option>
				                      		<option value="50" ${maxRecords == '50' ? 'selected' : ''}>50</option>
				                     		<option value="100" ${maxRecords == '100' ? 'selected' : ''}>100</option>
				                      	</select>
				                      </div>
				                      <div class="col-lg-10" style="margin-top: 19px;    padding-left: 0px;">
				                       <div class="wrapper">
	        	 		 <input type="text"  class="form-control"  value="${searchName}" id="profitsearch" placeholder="<spring:message code="search.sku.label" />" />
						<button id="profitReportSearch" class="searchbutton" style=" margin-right: 17px;"></button>
						
							<input type="hidden" id="pricewise" value="${searchName}"></div>
	        	 		</div>
					              <div class="col-lg-1" style="margin-top: 19px;">
                     <input type="button"  class="btn bg-olive btn-inline  addBtn" onclick="viewprofitabilityReports('salesReportProfitabilityReport','0','true');" value="SAVE"/>
                         <input type="hidden" id="stockdownloadurl" value="${downloadurl}">
                  </div>
				            </div>   
				                  
				                    <div style="overflow: auto;white-space: nowrap;">
                                     <table border="1" id="productstocks" class="table table-bordered table-striped">
                                     <thead style="background-color: #3c8dbc; color: #ffffff">
                                            <tr>
                                            	 <th><spring:message code="sl.no.label" /></th>
                                                <th><spring:message code="category.label" /></th>
                                            	<th><spring:message code="subcategory.label" /></th>
                                            	<th><spring:message code="section.label" /></th>
                                            	<th><spring:message code="supplier.vendor.name" /></th>
                                            	<th><spring:message code="productid.label" /></th>
                                            	<th><spring:message code="ean.code.label" /></th>
                                            	<th><spring:message code="product.name.label" /></th>
                                            	<%-- <th><spring:message code="description.label" />/<spring:message code="technical.specification.label" /></th> --%>
                                            	<th><spring:message code="brand.label" /></th>
                                            	<th><spring:message code="style.label" /></th>
                                            	<th><spring:message code="size.label" /></th>
                                                <th><spring:message code="colour.label" /></th>
                                                <th><spring:message code="measurement.range.label" /></th>
                                                   <th><spring:message code="product.range.label" /></th>
											<th><spring:message code="cp.label" />&nbsp;<spring:message code="with.label" />&nbsp;<spring:message code="gst.label" /></th>
											<th><spring:message code="cp.label" />&nbsp;with&nbsp;<spring:message code="disc.label" /></th>	
                                            	<%-- <th><spring:message code="vat.label" />&nbsp;<spring:message code="rate.label" /></th>
                                                <th><spring:message code="input.label" />&nbsp;<spring:message code="vat.label" /></th> --%>
                                            <%--    <th><spring:message code="cp.label" />&nbsp;with&nbsp;<spring:message code="vat.label" /></th> --%>
                                           <%--      <th><spring:message code="frieght.label" />&nbsp;%</th> --%>
                                                <th><spring:message code="frieght.label" />&nbsp;value</th>
                                                 <th><spring:message code="frieght.qty.label" /></th>
                                                   <th><spring:message code="cp.label" /></th>
                                                    <th><spring:message code="mrp.label" />(with GST)</th>
                                                       <th><spring:message code="saleprice.label" />(w/o GST)(Avg)</th>
                                                   <th><spring:message code="sale.qty.label" /></th>
                                                   <th><spring:message code="sale.value.label" />(w/o GST)</th>
                                                <th ><spring:message code="report.procqty.label" /></th>
                                       			 <th ><spring:message code="report.proccost.label" /></th> 
                                       			  <th><spring:message code="stock.loss.qty.label" /></th> 
                                       			<th><spring:message code="losscost.label" /></th>
                                                    <th><spring:message code="margin.value.label" /></th>
                                                   <th><spring:message code="margin.per.label" />&nbsp;%</th>
                                                   <%--  <th><spring:message code="sales.label" />&nbsp;<spring:message code="w/o.label" />&nbsp;<spring:message code="tax.label" /></th>
                                                   <th><spring:message code="output.label" />&nbsp;<spring:message code="vat.label" /></th>
                                        --%>     </tr>
                                         
                                            
                                        </thead>
                                        <tbody style="text-align: center;">
                                        <c:set var="dataExists" value="false"></c:set>
                                         <c:set var="margin" value="0.0"></c:set>
                                         <c:set var="proQty" value="0.0"></c:set>
                                         <c:set var="proCost" value="0.0"></c:set>
                                         <c:set var="saleQty" value="0.0"></c:set>
                                           <c:set var="saleCost" value="0.0"></c:set>
                                           <c:forEach var="warehousereport" items="${warehousereport.reportsList}" varStatus="theCount">


										<tr style="border-bottom: 2px solid #ccc;">
											<td>${theCount.index+index}</td>
											<td style="text-align: left;">${warehousereport.category}</td>
											<td style="text-align: left;">${warehousereport.subCategory}</td>
											<td style="text-align: left;">${warehousereport.section}</td>
											<td style="text-align: left;">${warehousereport.supplierName}</td>
											<td style="text-align: left;">${warehousereport.skuId}</td>
											<td>${warehousereport.ean}</td>
											<td style="text-align: left;">${warehousereport.itemDesc}</td>
											<td style="text-align: left;">${warehousereport.brandName}</td>
											<td>${warehousereport.style}</td>
											<td>${warehousereport.size}</td>
											<td>${warehousereport.color}</td>
											<td>${warehousereport.measureRange}</td>
											<td>${warehousereport.productRange}</td>
											<td>${warehousereport.costPriceWithTax}</td>
											<td>${warehousereport.costPricewithDiscount}</td>
											<td>${warehousereport.shipmentcharges}</td>
											<td>${warehousereport.shipmentChargesperQty}</td>
											<td>${warehousereport.costPrice}</td>
											<td>${warehousereport.mrp}</td>
											<td>${warehousereport.salePrice}</td>
												<td>${warehousereport.quantity}</td>
											<td>${warehousereport.price}</td>
												 <td>${warehousereport.grnQty}</td> 
                                       <td>${warehousereport.grnValue}</td> 
                                       	 <td>${warehousereport.lossQty}</td> 
                                       <td>${warehousereport.lossValue}</td> 
											<td>${warehousereport.marginvalue}
											       <c:set var="proQty" value="${proQty+warehousereport.grnQty}"></c:set>
                                         <c:set var="proCost" value="${proCost+warehousereport.grnValue}"></c:set>
                                         <c:set var="saleQty" value="${saleQty+warehousereport.quantity}"></c:set>
                                           <c:set var="saleCost" value="${saleCost+warehousereport.price}"></c:set>
											  <c:set var="margin" value="${margin+warehousereport.marginvalue}"></c:set>
											</td>
											<td>${warehousereport.marginPercentage}%</td>
										</tr>


									</c:forEach>
                            
                                    <tr>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                      <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                     <td></td>
                                    <td style="font-weight:bold;font-size:16px;padding-top:5px">Totals</td>
                                    
                                        <td>
                                         ${saleQty}
                           </td>
                                    <td> ${saleCost}</td>
                                    <td> ${proQty}</td>
                                    <td> ${proCost}</td>
                                     <td></td>
                                    <td></td>
                                
                                    <td>  ${margin}</td>
                                        <td></td>
                                  
                                    </tr>
                                    
                       </tbody>
                                    </table>
                                   <div>
                                
                                   </div>
                    
                                   
                                    
            
  
         
             
        </div>
   <div class="col-lg-12 col-xs-12">
                  <br>
                  </div>
  
  
  
      
          <div class="row">
               <input type="hidden" id="flowUnder" value="${flowUnder}">
               <input type="hidden" id="totalnum" value="${totalRecords}">
              	<c:if test="${index-1 == 0 && totalRecords >10}">
              		<div class="form-group col-lg-6" style="text-align: left;">
              		<input type="button" class='paginationButton' value="&#60;" onclick=""> ${index} - ${totalValue} of ${totalRecords} 
              		<input type="button" class='paginationButton' value="&#62;" onclick="viewprofitabilityReports('salesReportProfitabilityReport','${totalValue}','')">
              	</div>                                                                   
              	</c:if>
              	
              	<c:if test="${totalValue == totalRecords}">
              			<c:if test="${totalValue-10 >0}">
              				<div class="form-group col-lg-6" style="text-align: left;">
              		<input type="button" class='paginationButton' value="&#60;" onclick="return viewprofitabilityReports('salesReportProfitabilityReport','${index - 11}','');"> ${index} - ${totalValue} of ${totalRecords} 
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
              		<input type="button" class='paginationButton' value="&#60;" onclick="return viewprofitabilityReports('salesReportProfitabilityReport','${index - 11}','');"> ${index} - ${totalValue} of ${totalRecords} .
              		<input type="button" class='paginationButton' value="&#62;" onclick="viewprofitabilityReports('salesReportProfitabilityReport','${totalValue}','')">
              	</div> 
              	</c:if>
               
                     
                   	<div class="col-lg-6" style="float:right;">
              	<div class="col-lg-8" style="text-align: right;padding-right: 0px;margin-top: 2px;font-size: 16px;"><spring:message code="pages.label" /></div>
              	<div class="col-lg-2" style="padding-right: 0px;">
              		<select class="form-control" id="pagination">
              		<c:set var="totalRecords" value="${totalRecords+1}"></c:set>
              	<c:forEach var="i" begin="0" end="${totalRecords}">
              	<c:if test="${(totalRecords)>0}">
              		<option value="${(i*maxRecords)}" ${index-1 == i*maxRecords ? 'selected' : ''}> ${i+1}</option>
              		<c:set var="totalRecords" value="${totalRecords-maxRecords}"></c:set>
              	</c:if>
				</c:forEach>
					</select>
              	
              	</div>
              		<div class="col-lg-2" style="padding-right: 0px;">
              		  <input type="button" onclick="viewprofitabilityReports('salesReportProfitabilityReport',document.getElementById('pagination').value,'')" class="btn bg-olive btn-inline  addBtn" value="GO">
              		</div>
            
				</div>
				
              </div>      
                
             
  
  </div></div>
  
  
</div>


</section>
 <script src="${pageContext.request.contextPath}/js/plugins/datatables/jquery.dataTables.js" type="text/javascript"></script>
        <script src="${pageContext.request.contextPath}/js/plugins/datatables/dataTables.bootstrap.js" type="text/javascript"></script>
        <script type="text/javascript">
            $(function() {
                $("#productstocks").dataTable(
             		{
             			  "bPaginate": false,
                           "bLengthChange": false,
                           "bFilter": false,
                           "bSort": false,
                           "bInfo": false,
                           "bAutoWidth": false
             		});
                 });
        </script>
        <input type="hidden" id="billStatus" value="${status}">
        <input type="hidden" id="deleteActionLabel" value="<spring:message code="receiptstock.label" />"/>
</body>
</html>