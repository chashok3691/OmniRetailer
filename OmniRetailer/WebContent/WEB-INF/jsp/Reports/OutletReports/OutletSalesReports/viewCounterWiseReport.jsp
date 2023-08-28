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
.col-lg1-2{
    width: 25% !important;
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
.iospopupp {
   	width: 29%!important;
    margin-left: 45%;
    margin-top: 0%;
    border-radius: 2;
    border-radius: 12px;
</style>  
<script type="text/javascript">
$(document).ready(function(){
	//$("#billDate").trigger("click");
	debugger;
	 var amount = [];
	   var totalAmount=0.0;
	   $('.returnedAmount').each( function(){
		   	amount.push( $(this).text() );  
	   	     });
		
		for (var i = 0; i < amount.length; i++) {
			totalAmount=parseFloat(totalAmount) + parseFloat(amount[i]);
		}
		if(totalAmount < 0)
			totalAmount = totalAmount * (-1);
			
		$('#returned').text(parseFloat(totalAmount+0.00).toFixed(2));
		
		totalAmount=0.0;
		
		var eAmount=[];
		 $('.exchangedAmount').each( function(){
			   	eAmount.push( $(this).text() );  
		   	     });
		 
		 for (var i = 0; i < eAmount.length; i++) {
				totalAmount=parseFloat(totalAmount) + parseFloat(eAmount[i]);
			}
			if(totalAmount < 0)
				totalAmount = totalAmount * (-1);
				
			$('#exchanged').text(parseFloat(totalAmount+0.00).toFixed(2));
			
			
			totalAmount=0.0;
			var tAmount=[];
			 $('.totalTax').each( function(){
				   	tAmount.push( $(this).text() );  
			   	     });
			 
			 for (var i = 0; i < tAmount.length; i++) {
					totalAmount=parseFloat(totalAmount) + parseFloat(tAmount[i]);
				}
				if(totalAmount < 0)
					totalAmount = totalAmount * (-1);
				$('#tTax').text(parseFloat(totalAmount+0.00).toFixed(2));
				
				   if($("#totalnum").val()>0)
				        new Chart(document.getElementById("pricevar").getContext("2d")).Line(getdatewisegraph(),newOpts('','Day Turn Over'));
	
});

function sortColumn(ele){
	var backgroundCss = $(ele).css("background");
	var order = null;
	var orderBy = null;
	if(backgroundCss.indexOf('both') != -1){
		backgroundCss = backgroundCss.replace('both','asc');
		order = "ASC";
		orderBy = $(ele).attr("id");
	}
	else if(backgroundCss.indexOf('asc') != -1){
		backgroundCss = backgroundCss.replace('asc','desc');
		order = "DESC";
		orderBy = $(ele).attr("id");
	}
	else if(backgroundCss.indexOf('desc') != -1){
		backgroundCss = backgroundCss.replace('desc','asc');
		order = "ASC";
		orderBy = $(ele).attr("id");
	}
	var location = $("#location").val();
	var contextPath = $('#contextPath').val();
	var startDate = $("#startDate").val();
	var endDate = $("#endDate").val();
	var maxRecords = 10;
	if($("#maxRecords").length > 0)
		maxRecords = $("#maxRecords").val();
	var index = "0";
	if(endDate !="" && startDate == ""){
		$("#startDateError").html("Date is required for generating report");
		return;
	}
		var criteria = $("#criteria").val();
		var URL = contextPath + "/reports/generateSalesReportCriteriaWise.do";
		$.ajax({
			url : URL,
			data : {
				location : location,
				startDate : startDate,
				endDate : endDate,
				maxRecords : maxRecords,
				criteria : criteria,
				index : index,
				order : order,
		   		orderBy : orderBy
			},
   	beforeSend: function(xhr){                    
	   			$("#loading").css("display","block");
	   			$("#mainDiv").addClass("disabled");
	   		  },
   	success : function(result){
   		$("#xReportsDisplay").html(result);
   		columnReset();
		$("#"+orderBy).css("background",backgroundCss);
   		$("#loading").css("display","none");
   		$("#mainDiv").removeClass('disabled');
   	},
   	error : function(){
   		alert("Something went wrong");
   		$("#loading").css("display","none");
			$("#mainDiv").removeClass('disabled');
   	}
    });
}
</script>
</head>
<body>
<%-- 	<section class="content-header">
		<h1><spring:message code="outlet.management.label" />
  			<small><spring:message code="billing.payment.label" /></small>
 		</h1>
	<ol class="breadcrumb">
        <li><a style="cursor: pointer;" onclick="return viewDashboard('inventorymanager');"><i class="fa fa-dashboard"></i><spring:message code="home.label" /></a></li>
        <li class="active"><a style="cursor: pointer;" onclick="showOutletFlows();"><spring:message code="outlet.management.label"/></a></li>
        <li class="active"><a style="cursor: pointer;" onclick="showBillsFlows();"><spring:message code="billing.payment.label"/></a></li>
    </ol>
   </section> --%>
<!-- Main content -->
<section class="">
<div class="row">
  <div class="col-lg-12">
  <div class="">
                                <div class="box-body table-responsive">
                                <div class="nav-tabs-custom">
 <ul class="nav nav-tabs">
  <li class="active"><a data-toggle="tab" href="#home" style="text-transform: capitalize;">${criteria} Wise Report</a></li>
  <li><a data-toggle="tab" onclick="" href="#menu1">Graphical Report</a></li>
</ul>
<div class="tab-content">
  <div id="home" class="tab-pane fade in active">
				                    <div class="row">
				                      
				                       <div class="col-lg-1">
				                       	<label>Show</label> 
				                      	<select class="form-control" id="maxRecords" style="padding: 3px 4px;" onchange="generateSalesReportCriteriaWise('${criteria}','validationCheck','0','','${flowLocation}');">
				                      		<option value="10" ${maxRecords == '10' ? 'selected' : ''}>10</option>
				                      		<option value="25" ${maxRecords == '25' ? 'selected' : ''}>25</option>
				                      		<option value="50" ${maxRecords == '50' ? 'selected' : ''}>50</option>
				                     		<option value="100" ${maxRecords == '100' ? 'selected' : ''}>100</option>
				                      	</select>
				                      </div>
				                      <div class="col-lg-6">
				                       <%-- <div class="row">
				                         <div class="col-lg-4" style="text-align:right;top:5px;">
				                           <label><spring:message code="outletlocation.label"/></label>
				                         </div>
				                         <div class="col-lg-7">
				                           <select class="form-control" id="outletLocation" onchange="viewBills('','0');">
 				                             <c:forEach var="location" items="${locationsList}">
												<option value="${location}" ${location == selectedLocation ? 'selected' : ''} id="${location}" >${location}</option>
											 </c:forEach>
                                         </select>
				                         </div>
				                      </div> --%>
				                      </div>
				                      <div class="col-lg-4"></div>
				                       <div class="col-lg-1" style="text-align: center;margin-top: 17px;padding-left: 0px;">
		   <input type="button" class="addBtn btn bg-olive btn-inline" data-toggle="modal" data-target="#myModalIos"  style="font-size: 16px;" value="<spring:message code="save.label" />" />
		 </div>
				                    </div>
				                  
				                    <div style="overflow: auto;">
                                    <table id="productstocks" class="table table-bordered table-striped">
                                     <thead style="background-color: #3c8dbc; color: #ffffff">
                                            <tr>
                                            	<%-- <th id="businessDate" class="columnSort" onclick="sortColumn(this);" style="background: url('${pageContext.request.contextPath}/images/sort_desc.png') no-repeat center right;cursor: pointer;"><spring:message code="counter_date.label" /></th>
                                            	<th id="totalBills" class="columnSort" onclick="sortColumn(this);" style="background: url('${pageContext.request.contextPath}/images/sort_both.png') no-repeat center right;cursor: pointer;"><spring:message code="total.bills.label" /></th>
                                                <th id="cashTotal" class="columnSort" onclick="sortColumn(this);" style="background: url('${pageContext.request.contextPath}/images/sort_both.png') no-repeat center right;cursor: pointer;"><spring:message code="cash_total.label" /></th>
                                                <th id="cardTotal" class="columnSort" onclick="sortColumn(this);" style="background: url('${pageContext.request.contextPath}/images/sort_both.png') no-repeat center right;cursor: pointer;"><spring:message code="card_total.label" /></th>
                                                <th id="sodexoTotal" class="columnSort" onclick="sortColumn(this);" style="background: url('${pageContext.request.contextPath}/images/sort_both.png') no-repeat center right;cursor: pointer;"><spring:message code="sodexo.total.label" /></th>
                                                <th id="ticketTotal" class="columnSort" onclick="sortColumn(this);" style="background: url('${pageContext.request.contextPath}/images/sort_both.png') no-repeat center right;cursor: pointer;"><spring:message code="ticket.total.label" /></th>
                                                <th id="loyaltyTotal" class="columnSort" onclick="sortColumn(this);" style="background: url('${pageContext.request.contextPath}/images/sort_both.png') no-repeat center right;cursor: pointer;"><spring:message code="loyalty.total.label" /></th>
                                                <th id="discount" class="columnSort" onclick="sortColumn(this);" style="background: url('${pageContext.request.contextPath}/images/sort_both.png') no-repeat center right;cursor: pointer;"><spring:message code="discount.label" /></th>
                                                <th id="totalAmount" class="columnSort" onclick="sortColumn(this);" style="background: url('${pageContext.request.contextPath}/images/sort_both.png') no-repeat center right;cursor: pointer;"><spring:message code="total.price.label" /></th> --%>
                                                <th><spring:message code="sl.no.label" /></th>
                                                <th><spring:message code="counter_date.label" /></th>
                                                 <th><spring:message code="location.label" /></th> 
                                                 <th>Counter</th>
                                                 <th>Cashier ID</th> 
                                            	<th><spring:message code="total.bills.label" /></th>
                                            	<th><spring:message code="sold.qty.label" /></th>
                                                <th><spring:message code="cash_total.label" /></th>
                                                <th>Day Open</th>
                                                <th>Day Close</th>
                                                <th><spring:message code="card_total.label" /></th>
                                                 <th>Credit Note/Cash</th>
                                                  <th><spring:message code="exchange.amount.label" /></th>
                                                <th><spring:message code="sodexo.total.label" /></th>
                                                <th><spring:message code="ticket.total.label" /></th>
                                                <%-- <th><spring:message code="loyalty.total.label" /></th> --%>
                                                 <th><spring:message code="loyalty.claim.label" /></th>
                                                <th><spring:message code="creditNoteRedim.label" /></th>
                                                <th><spring:message code="discount.label" /></th>
                                                <th><spring:message code="total.tax.label" /></th>
                                                <th><spring:message code="giftvouchers.label" /></th>
                                                <th><spring:message code="giftCoupons.label" /></th>
                                                 <th><spring:message code="otherAmt.label" /></th>
                                                <th><spring:message code="credits.amount.label" /></th>
                                               <%--   <th><spring:message code="creditBillsAmt.label" /></th> --%>
                                                   <th><spring:message code="credit.sale.label" /></th>
                                               <%--  <th><spring:message code="total.tax.label" /></th> --%>
                                                <th><spring:message code="day.turnover.label" /></th>
                                                
                                                <th><spring:message code="action.label" /></th>
                                            </tr>
                                        </thead>
                                        <tbody style="text-align: center;">
                                        <c:set var="dataExists" value="false"></c:set>
                                           <c:forEach var="salesReport" items="${salesReportList}" varStatus="theCount">
                                          
                                        	 <tr style="border-bottom: 2px solid #ccc;">
                                        	  <td>${theCount.count+index-1}</td>
                                        	 	<td class="date" id="businessdate${theCount.index}">${salesReport.date}</td>
                                        	 	<td>${salesReport.storeLocation}</td>
                                        	 	<td>${salesReport.counterId}</td>
                                        	 	<td>${salesReport.cashierId}</td>
                                            	<td>${salesReport.totalBills}</td>
                                            	<td>${salesReport.soldQty}</td>
                                                <td>${salesReport.cashTotal}</td>
                                                <td>${salesReport.openCash}</td>
                                                <td>${salesReport.declareCash}</td>
                                                <td>${salesReport.cardTotal}</td>
                                                 <td class="returnedAmount">${salesReport.returnedAmt}</td>
                                                  <td class="exchangedAmount">${salesReport.exchangedAmt}</td>
                                                <td>${salesReport.sodexTotal}</td>
                                                <td>${salesReport.ticketTotal}</td>
                                                <td>${salesReport.loyaltyTotal}</td>
                                                 <td>${salesReport.creditTotal}</td>
                                                <fmt:formatNumber type="number" minFractionDigits="2" maxFractionDigits="2" value="${salesReport.discount}" var="discountVal" /> 
                                                <td>${discountVal}</td>
                                                  <fmt:formatNumber type="number" minFractionDigits="2" maxFractionDigits="2" value="${salesReport.taxAmt}" var="taxVal" />
                                                <td class="totalTax">${taxVal}</td>
                                                <td>${salesReport.vouchersTotal}</td>
                                                <td>${salesReport.couponsTotal}</td>
                                                <td>${salesReport.othersAmt}</td>
                                                <td>${salesReport.creditsAmt}</td>
                                                 <td>${salesReport.creditBillsAmt}</td>
                                                <td id="totalsale${theCount.index}">${salesReport.totalPrice}</td>
                                                
                                                <td><a style="color:#2e7ea7 !important;cursor: pointer;" onclick="return viewBillSummary('${salesReport.date}','0','${criteria}','false')">View</a></td>
                                        	 </tr>
                                        
                                         <c:set var="dataExists" value="true"></c:set>
                                           </c:forEach>
                                           <c:if test="${dataExists == 'true'}">
                                           <tr>
                                           		 <td></td><td></td><td></td><td></td><td></td>
                                           		  <td style="padding:3px;width: 160px;"><div style="white-space: nowrap;padding: 5px;background: #727272;"><font color="white"><spring:message code="totals.label" /></font></div></td>
                                           		   <fmt:formatNumber  var="soldQty"   type="number" minFractionDigits="2" maxFractionDigits="2"  value = "${reportSummary.finalSoldQty}"  />
                                           		 <td style="padding:3px;width: 160px;"><div  style="white-space: nowrap;padding: 5px;background: #c1c1c1;">${reportSummary.finalSoldQty}</td>
                                                <td style="padding:3px;width: 160px;"><div style="white-space: nowrap;padding: 5px;background: #c1c1c1;">${reportSummary.finalCash}</td>
                                                <td></td>
                                                <td></td>
                                                <td style="padding:3px;width: 160px;"><div style="white-space: nowrap;padding: 5px;background: #c1c1c1;">${reportSummary.finalCard}</td>
                                               <td style="padding:3px;width: 160px;"><div id="returned" style="white-space: nowrap;padding: 5px;background: #c1c1c1;">${reportSummary.finalReturnedAmt}</td>
                                               <td style="padding:3px;width: 160px;"><div id="exchanged" style="white-space: nowrap;padding: 5px;background: #c1c1c1;">${reportSummary.finalExchangedAmt}</td>
                                                <td style="padding:3px;width: 160px;"><div style="white-space: nowrap;padding: 5px;background: #c1c1c1;">${reportSummary.finalSodexo}</td>
                                                <td style="padding:3px;width: 160px;"><div style="white-space: nowrap;padding: 5px;background: #c1c1c1;">${reportSummary.finalTicket}</td>
                                                <td style="padding:3px;width: 160px;"><div style="white-space: nowrap;padding: 5px;background: #c1c1c1;">${reportSummary.finalLoyalty}</td>
                                                <td style="padding:3px;width: 160px;"><div style="white-space: nowrap;padding: 5px;background: #c1c1c1;">${reportSummary.finalCreditAmt}</td>
                                                 <fmt:formatNumber type="number" minFractionDigits="2" maxFractionDigits="2" value="${reportSummary.finalDiscount}" var="discounTotal" />
                                                <td style="padding:3px;width: 160px;"><div style="white-space: nowrap;padding: 5px;background: #c1c1c1;">${discounTotal}</td>
                                                 <fmt:formatNumber type="number" minFractionDigits="2" maxFractionDigits="2" value="${reportSummary.finalTaxAmt}" var="taxTotal" />
                                                <td style="padding:3px;width: 160px;"><div id="" style="white-space: nowrap;padding: 5px;background: #c1c1c1;">${taxTotal}</td>
                                                <%--    <td>${reportSummary.finalTaxAmt}</td> --%>
                                                <td style="padding:3px;width: 160px;"><div style="white-space: nowrap;padding: 5px;background: #c1c1c1;">${reportSummary.finalVouchersAmt}</td>
                                                 <td style="padding:3px;width: 160px;"><div style="white-space: nowrap;padding: 5px;background: #c1c1c1;">${reportSummary.finalCouponsAmt}</td>
                                                  <td style="padding:3px;width: 160px;"><div style="white-space: nowrap;padding: 5px;background: #c1c1c1;">${reportSummary.totalOthersAmt}</td>
                                                  <td style="padding:3px;width: 160px;"><div style="white-space: nowrap;padding: 5px;background: #c1c1c1;">${reportSummary.finalCreditsAmt}</td>
                                                   <td style="padding:3px;width: 160px;"><div style="white-space: nowrap;padding: 5px;background: #c1c1c1;">${reportSummary.finalCreditBillsAmt}</td>
                                                <td style="padding:3px;width: 160px;"><div style="white-space: nowrap;padding: 5px;background: #c1c1c1;">${reportSummary.finalTotal}</td>
                                                
                                                <td></td>
                                           </tr>
                                          </c:if>
                                        </tbody>
                                    </table></div>
                                    
                                    
                                    
                                    
                                     <%@ include file="savePopUp.jsp"%>
                                    <input type="hidden" id="stockdownloadurl" value="${downloadurl}">
                                    <input type="hidden" id="totalnum" value="${totalRecords}">
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
	              		<input type="button" class='paginationButton' value="&#60;" onclick="return generateSalesReportCriteriaWise('${criteria}','','${index - (maxRecords + 1)}');"> ${index} - ${totalValue} of ${totalRecords} .
	              		<input type="button" class='paginationButton' value="&#62;" onclick="generateSalesReportCriteriaWise('${criteria}','','${totalValue}')">
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
              	
              	
              </div>  </div>  <div id="menu1" class="tab-pane fade in ">
                              <h3 style="text-transform: capitalize;">${criteria} Wise Graphical Report</h3>
                               <canvas id="pricevar" height="400 !important;" width="1020  !important;"></canvas>
                              
                              </div>
  </div></div>
                                </div><!-- /.box-body -->
                            </div><!-- /.box -->
  

</div></div>
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