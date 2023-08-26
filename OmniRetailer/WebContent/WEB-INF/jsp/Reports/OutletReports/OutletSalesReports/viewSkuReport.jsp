<!--/*
 * Project Name 	        : OmniRetailerCustomer
 * Written By		        : Sambaiah Y
 * file name		        : Inventory Manager/Billing/viewSkuReport.jsp
 * file type		        : JSP
 * description				: display total billings
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
        <link href="${pageContext.request.contextPath}/css/datatables/dataTables.bootstrap.css" rel="stylesheet" type="text/css" />
        <script type="text/javascript" src="${pageContext.request.contextPath}/js/controller.js"></script>
                        	<script type="text/javascript" src="${pageContext.request.contextPath}/js/lineGraphs.js"></script>
        
<style type="text/css">
.buttons {
	float: right;
	padding-top: 0px;
	margin-right: 2%;
	margin-top:1%;
}
.wrapper {
    /* border:1px solid #000;
    display:inline-block; */
    position:relative;
}

/* 
.searchbutton{
background-image: url(../images/search.png);
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
} */

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
.iospopup {
    width: 70%!important;
    margin-left: 45%;
    margin-top: 0%;
    border-radius: 0;
}
.iospopupp {
   	width: 60%!important;
    margin-left: 45%;
    margin-top: 0%;
    border-radius: 2;
    border-radius: 12px;
	
}

body.modal-open {
/* margin-left: auto;
margin-right: auto; */
padding-right: 0px !important;
}


</style>  
<script type="text/javascript">
$(document).ready(function(){
	//$("#billDate").trigger("click");
	
	 $('#mySearch').click(function(){
	        var search = $('#skuSales').val();
	        return generateSalesReportCriteriaWise('${criteria}','validationCheck','0','NOPOP','${flowLocation}');
	    })
	    $('#skuSales').keypress(function(e){
	        if(e.which == 13){//Enter key pressed
	            $('#mySearch').click();//Trigger search button click event
	        }
	    });
	
});


</script>
</head>
<body>
<div class="skuuu">

<!-- Main content -->
<section class="">
<div class="row">
  <div class="col-lg-12">
  <div class="">
                                <div class="box-body table-responsive">
				                       <div class="nav-tabs-custom">
										 <ul class="nav nav-tabs">
  											<li class="active"><a data-toggle="tab" href="#home" style="text-transform: capitalize;">SKU Wise Report</a></li>
  											<li><a data-toggle="tab" onclick="" href="#menu1">Graphical Report</a></li>
										</ul>
								<div class="tab-content">
  								<div id="home" class="tab-pane fade in active">
  								<div id="errorMsg" class="errorMsg" style="text-align: center;color: red;font-size: 2;font-weight: bold;margin-bottom: 2px; margin-top: -10px">${errorMsg}</div>
  				                    <div class="row">
				                       <div class="col-lg-1">
				                       <label>Show</label> 
				                      	<select class="form-control" id="maxRecords" style="padding: 3px 4px;" onchange="generateSalesReportCriteriaWise('skuSales','validationCheck','0','','${flowLocation}');">
				                      		<option value="10" ${maxRecords == '10' ? 'selected' : ''}>10</option>
				                      		<option value="25" ${maxRecords == '25' ? 'selected' : ''}>25</option>
				                      		<option value="50" ${maxRecords == '50' ? 'selected' : ''}>50</option>
				                     		<option value="100" ${maxRecords == '100' ? 'selected' : ''}>100</option>
				                      	</select>
				                      </div>
				                      <div class="col-lg-10" style="    margin-top: 19px;
    padding-left: 0px;">
				                    <div class="wrapper">
	        	 		 <input type="text"  class="form-control"  value="${searchName}" id="skuSales" placeholder="<spring:message code="search.sku.label" />" />
						<!-- 	<input type="button" value="Search" id="mySearch"> -->
						<button id="mySearch" class="searchbutton"></button>
						
							<input type="hidden" id="skuwise" value="${searchName}"></div>
	        	 		</div>
				          <div class="col-lg-1" style="text-align: right;margin-top: 17px;padding-left: 0px;">
		   <input type="button" class="addBtn btn bg-olive btn-inline" data-toggle="modal" data-target="#myModalIos" style="font-size: 16px;" value="<spring:message code="save.label" />" />
		 </div>
				                    </div>
				                  
				                    <div style="overflow: auto;white-space: nowrap;">
                                    <table id="productstocks" class="table table-bordered table-striped">
                                     <thead style="background-color: #3c8dbc; color: #ffffff">
                                            <tr>
                                            	<th><spring:message code="sl.no.label" /></th>
                                            	 <c:if test="${sessionScope.customerId == 'CID8995427'}"> 
                                                <th>Event ID</th>
                                                <th>Event Name</th>
                                            	 <th>Zone</th>
                                            	 </c:if>
                                            	 <th><spring:message code="location.label" /></th>
                                                <th><spring:message code="skuid.label" /></th>
                                            	<th><spring:message code="itemdesc.label" /></th>
                                            	<th><spring:message code="ean.label" /></th>
                                            	<th><spring:message code="colour.label" /></th>
                                            	<th><spring:message code="size.label" /></th>
                                            	<th><spring:message code="grade.label" /></th>
                                            	<th><spring:message code="model.label" /></th>
                                            	<th><spring:message code="category.label" /></th>
                                            	<th><spring:message code="subcategory.label" /></th>
                                            	<th><spring:message code="section.label" /></th>
												<th><spring:message code="brand.label" /></th>
												<th><spring:message code="mrp.label" /></th>
                                            	<th><spring:message code="unit.price.label" /></th>
                                            	<th><spring:message code="costprice.label" /></th>
                                                <th><spring:message code="sold.qty.label" />(PCS)</th>
                                                    <th><spring:message code="sold.qty.label" />(UOM)</th>
                                                <th><spring:message code="return.qty.label" /></th>
                                                <th><spring:message code="exchange.qty.label" /></th>
                                                  <th><spring:message code="discount.label" /></th>
                                                    <th><spring:message code="manual.discount.label" /></th>
                                                      <th><spring:message code="tax_amount.label" /></th>
                                                <th><spring:message code="totalsale.label" /></th>
                                            </tr>
                                        </thead>
                                        <tbody style="text-align: center;">
                                        <c:set var="dataExists" value="false"></c:set>
                                           <c:forEach var="salesReport" items="${salesReportList}" varStatus="theCount">
                                           <c:if test="${theCount.last}">
                                           
                                        	 <tr style="border-bottom: 2px solid #ccc;">
                                        	 <td>${theCount.count+index-1}</td>
                                        	  <c:if test="${sessionScope.customerId == 'CID8995427'}"> 
                                                <td>${salesReport.eventId}</td>
                                                <td>${salesReport.eventName}</td> 
                                                <td>${salesReport.zoneId}</td>
                                                </c:if>
                                                <td>${salesReport.storeLocation}</td>
                                                <td>${salesReport.skuId}</td>
                                                <td>${salesReport.itemDescription}</td>
                                                 <td>${salesReport.ean}</td>
                                                <td>${salesReport.color}</td>
                                                <td>${salesReport.size}</td>
                                                <td>${salesReport.productRange}</td>
                                                <td>${salesReport.model}</td>
                                                <td>${salesReport.category}</td>
                                                <td>${salesReport.subCategory}</td>
                                                <td>${salesReport.section}</td>
                                                <td>${salesReport.brand}</td>
                                                  <td>${salesReport.mrp}</td>
                                            	<td>${salesReport.itemUnitPrice}</td>
                                            	<td>${salesReport.costPrice}</td>
                                                <td>${salesReport.soldQty}</td>
                                                 <td>${salesReport.weighedSaleQty}</td>
                                                <td>${salesReport.returnedQty}</td>
                                                <td>${salesReport.exchangedQty}</td>
                                                  <td>${salesReport.discount}</td>
                                                <td>${salesReport.manualdiscount}</td>
                                                <td>${salesReport.tax}</td>
                                                <td>${salesReport.totalCost}</td>
                                            </tr>
                                            </c:if>
                                              <c:if test="${!theCount.last}">
                                              	<tr>
                                              	<td>${theCount.count+index-1}</td>
                                              	 <c:if test="${sessionScope.customerId == 'CID8995427'}"> 
                                                <td>${salesReport.eventId}</td>
                                                <td>${salesReport.eventName}</td> 
                                              	<td>${salesReport.zoneId}</td>
                                              	</c:if>
                                                <td>${salesReport.storeLocation}</td>
                                                <td>${salesReport.skuId}</td>
                                                <td>${salesReport.itemDescription}</td>
                                                  <td>${salesReport.ean}</td>
                                                <td>${salesReport.color}</td>
                                                <td>${salesReport.size}</td>
                                                <td>${salesReport.productRange}</td>
                                                <td>${salesReport.model}</td>
                                                <td>${salesReport.category}</td>
                                                <td>${salesReport.subCategory}</td>
                                                <td>${salesReport.section}</td>
                                                <td>${salesReport.brand}</td>
                                                <td>${salesReport.mrp}</td>
                                            	<td>${salesReport.itemUnitPrice}</td>
                                            		<td>${salesReport.costPrice}</td>
                                                <td>${salesReport.soldQty}</td>
                                                 <td>${salesReport.weighedSaleQty}</td>
                                                <td>${salesReport.returnedQty}</td>
                                                <td>${salesReport.exchangedQty}</td>
                                                   <td>${salesReport.discount}</td>
                                                <td>${salesReport.manualdiscount}</td>
                                                <td>${salesReport.tax}</td>
                                                <td>${salesReport.totalCost}</td>
                                            </tr>
                                              </c:if>
                                          <c:set var="dataExists" value="true"></c:set>
                                           </c:forEach>
                                             <c:if test="${dataExists == 'true'}">
                                           	<tr>
                                           	        <c:set var="soldQty" value="0"  />
                                           	        <c:set var="whQty" value="0"  />
                                           	         <c:set var="returnedQty" value="0"  />
                                           	         <c:set var="exchangedQty" value="0"  />
                                           	      <c:set var="totalCost" value="0"  />
                                           	       <c:set var="itemUnitPrice" value="0"  />
                                           	         <c:set var="discountPrice" value="0"  />
                                           	           <c:set var="campaignPrice" value="0"  />
                                           	             <c:set var="taxAmount" value="0"  />
                                           	      
                                           	 <c:forEach var="salesReport" items="${salesReportList}" >
                                           	 <c:set var="itemUnitPrice" value="${itemUnitPrice+((salesReport.itemUnitPrice))}" scope="page" />
                                           	 <c:set var="soldQty" value="${soldQty+((salesReport.soldQty))}" scope="page" />
                                           	 <c:set var="returnedQty" value="${returnedQty+((salesReport.returnedQty))}" scope="page" />
                                           	 <c:set var="exchangedQty" value="${exchangedQty+((salesReport.exchangedQty))}" scope="page" />
                                           	 <c:set var="totalCost" value="${totalCost+((salesReport.totalCost))}" scope="page" />
                                           	  <c:set var="discountPrice" value="${discountPrice+((salesReport.discount))}" scope="page" />
                                           	   <c:set var="campaignPrice" value="${campaignPrice+((salesReport.manualdiscount))}" scope="page" />
                                           	    <c:set var="taxAmount" value="${taxAmount+((salesReport.tax))}" scope="page" />
                                           	      <c:set var="whQty" value="${whQty+((salesReport.weighedSaleQty))}" scope="page" />
                                           	 </c:forEach>
                                              	<td></td>
                                              	 <c:if test="${sessionScope.customerId == 'CID8995427'}"> 	
                                              	<td></td>
                                              	<td></td>
                                              	<td></td>
                                              	</c:if>
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
                             <td style="padding:3px;width: 160px;"><div style="white-space: nowrap;padding: 5px;background: #727272;"><font color="white"><spring:message code="totals.label" /></font></div></td>
                                            	<fmt:formatNumber var="soldQty" type="number" minFractionDigits="2" maxFractionDigits="2" value="${soldQty}" />
                                            	<fmt:formatNumber var="whQty" type="number" minFractionDigits="2" maxFractionDigits="2" value="${whQty}" />
                                            	<fmt:formatNumber var="returnedQty" type="number" minFractionDigits="2" maxFractionDigits="2" value="${returnedQty}" />
                                            	<fmt:formatNumber var="exchangedQty" type="number" minFractionDigits="2" maxFractionDigits="2" value="${exchangedQty}" />
                                            	<fmt:formatNumber var="discountPrice" type="number" minFractionDigits="2" maxFractionDigits="2" value="${discountPrice}" />
                                            	<fmt:formatNumber var="campaignPrice" type="number" minFractionDigits="2" maxFractionDigits="2" value="${campaignPrice}" />
                                            	<fmt:formatNumber var="taxAmount" type="number" minFractionDigits="2" maxFractionDigits="2" value="${taxAmount}" />
                                            	<fmt:formatNumber var="totalCost" type="number" minFractionDigits="2" maxFractionDigits="2" value="${totalCost}" />
                                                <td style="padding:3px;width: 160px;"><div  style="white-space: nowrap;padding: 5px;background: #c1c1c1;">${soldQty}</div></td>
                                                <td style="padding:3px;width: 160px;"><div  style="white-space: nowrap;padding: 5px;background: #c1c1c1;">${whQty}</div></td>
                                                <td style="padding:3px;width: 160px;"><div  style="white-space: nowrap;padding: 5px;background: #c1c1c1;">${returnedQty}</div></td>
                                                <td style="padding:3px;width: 160px;"><div  style="white-space: nowrap;padding: 5px;background: #c1c1c1;">${exchangedQty}</div></td>
                                                <td style="padding:3px;width: 160px;"><div  style="white-space: nowrap;padding: 5px;background: #c1c1c1;">${discountPrice}</div></td>
                                                <td style="padding:3px;width: 160px;"><div  style="white-space: nowrap;padding: 5px;background: #c1c1c1;">${campaignPrice}</div></td>
                                            	<td style="padding:3px;width: 160px;"><div  style="white-space: nowrap;padding: 5px;background: #c1c1c1;">${taxAmount}</div></td>
                                                <td style="padding:3px;width: 160px;"><div  style="white-space: nowrap;padding: 5px;background: #c1c1c1;">${totalCost}</div></td>
                                            </tr>
                                          </c:if> 
                                        </tbody>
                                    </table>
                                    </div>
                                    
                                    
                      
                      <br>
                      
                           <div class="panel-group" id="accordion">
             <div class="col-lg-12" style="padding-right: 0px;">
               <div class="col-lg-3" >
              </div>
              
              
            <div class="col-lg-3" >
              </div>
                <div class="col-lg-9" >
              </div>
               <div class="col-lg-3" style="padding-right: 0px;" >
               <div class="col-lg-12" style="padding-left: 0px;padding-right: 0px;    border-radius: 5px; background: #ccc;">
               
					
					 <div class="col-lg-12" style="border-top: 2px solid #eee;padding-left: 0px;padding-right: 0px;"></div>
					 <div class="col-lg-7 col-sm-8" style="text-align: right;font-size: 16px"><spring:message code="totalsold.label" /></div>
					<div class="col-lg-5 col-sm-4">: ${totalSoldQty} </div>
					 <div class="col-lg-12" style="border-top: 2px solid #eee;padding-left: 0px;padding-right: 0px;"></div>
             <div class="col-lg-7 col-sm-8" style="text-align: right;font-size: 16px"><spring:message code="totalsold.value.label" /></div>
					<div class="col-lg-5 col-sm-4">: ${totalSoldValue} </div>
				</div>
              </div>
            
            <div class="col-lg-6" style="">
                  
           </div>
              </div></div> 
            
                      
                                    
                                    
             <div class="row">
              	<c:if test="${index-1 == 0 && totalRecords > maxRecords}">
              		<div class="form-group col-lg-6" style="text-align: left;">
	              		<input type="button" class='paginationButton' value="&#60;" onclick=""> ${index} - ${totalValue} of ${totalRecords} 
	              		<input type="button" class='paginationButton' value="&#62;" onclick="generateSalesReportCriteriaWise('${criteria}','','${totalValue}','','${flowLocation}')">
	              	</div>
              	</c:if>
              	
              	<c:if test="${totalValue == totalRecords}">
              			<c:if test="${totalValue-maxRecords >0}">
              				<div class="form-group col-lg-6" style="text-align: left;">
			              		<input type="button" class='paginationButton' value="&#60;" onclick="return generateSalesReportCriteriaWise('${criteria}','','${index - (maxRecords + 1)}','','${flowLocation}');"> ${index} - ${totalValue} of ${totalRecords} 
			              		<input type="button" class='paginationButton' value="&#62;" >
			              	</div>
              			</c:if>
              			<c:if test="${totalValue-maxRecords <= 0}">
		              		<div class="form-group col-lg-6" style="text-align: left;">
			              		<input type="button" class='paginationButton' value="&#60;"> ${index} - ${totalValue} of ${totalRecords} 
			              		<input type="button" class='paginationButton' value="&#62;" >
			              	</div>
		              	</c:if>
              	</c:if>
              	<c:if test="${index-1 != 0 &&  totalValue != totalRecords}">
              		<div class="form-group col-lg-6" style="text-align: left;">
	              		<input type="button" class='paginationButton' value="&#60;" onclick="return generateSalesReportCriteriaWise('${criteria}','','${index - (maxRecords + 1)}','','${flowLocation}');"> ${index} - ${totalValue} of ${totalRecords} .
	              		<input type="button" class='paginationButton' value="&#62;" onclick="generateSalesReportCriteriaWise('${criteria}','','${totalValue}','','${flowLocation}')">
	              	</div> 
              	</c:if>
              	
              	
              	<div class="col-lg-6" style="text-align: right;"> 
              	<div class="col-lg-8" style="text-align: right;padding-right: 0px;margin-top: 2px;font-size: 16px;"><spring:message code="pages.label" /></div>
              	<div class="col-lg-2" style="padding-right: 0px;">
              		<select class="form-control" id="pagination">
              		<c:set var="totalRecords" value="${totalRecords}"></c:set>
              	<c:forEach var="i" begin="0" end="${totalRecords}">
              	<c:if test="${(totalRecords)>0}">
              		<option value="${(i*maxRecords)}" ${index-1 == i*maxRecords ? 'selected' : ''}> ${i+1}</option>
              		<c:set var="totalRecords" value="${totalRecords-maxRecords}"></c:set>
              	</c:if>
				</c:forEach>
					</select>
              	
              	</div>
              		<div class="col-lg-2" style="padding-right: 0px;">
              		  <input type="button" onclick="generateSalesReportCriteriaWise('${criteria}','validationCheck',document.getElementById('pagination').value,'','${flowLocation}')" class="btn bg-olive btn-inline  addBtn" value="GO">
              		</div>
              		</div>
              	
              	
              </div>    <input type="hidden" id="stockdownloadurl" value="${downloadurl}">
                               
                                 </div>
                                    <div id="menu1" class="tab-pane fade in ">
                              <h3 style="text-transform: capitalize;">SKU Wise Graphical Report</h3>
                        <div class="row">
                        <div class="col-lg-12">
                               <canvas id="pricevar" height="450 !important;" width="1020  !important;"></canvas>
                             </div>
                             </div>
                              </div>
                
                <c:if test="${totalValue > 0}">
                 <input type="hidden" id="graphRecords" value="${(totalValue+1)-index}"/>
             </c:if>
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
        debugger;
        if($("#graphRecords").length > 0)
    	{
		var graphRecords = $("#graphRecords").val();
		var count=0;
	 	var labels = [], values = [];

		$('#productstocks tbody tr td:nth-child(2)').each( function(){
			count++;
		 if(count<=graphRecords)
			 {
 				labels.push( $(this).text() );
			 }
		});
		
		count=0;
		$('#productstocks tbody tr td:nth-child(22)').each( function(){
			count++;
			if(count<=graphRecords)
	   		values.push( $(this).text());       
			});
		     	 new Chart(document.getElementById("pricevar").getContext("2d")).Line(getLineGraph("",labels,values),newOpts('','Total Sale'));
    	}
        
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
        </div>
</body>
</html>