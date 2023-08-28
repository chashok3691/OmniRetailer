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
</style>  
<script type="text/javascript">
$(document).ready(function(){
	//$("#billDate").trigger("click");
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
				                       <div class="col-lg-1" style="text-align: center;margin-top: 17px;">
		   <input type="button" class="addBtn btn bg-olive btn-inline" onclick="generateSalesReportCriteriaWise('${criteria}','save','0','','${flowLocation}');"  style="font-size: 16px;" value="<spring:message code="save.label" />" />
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
                                            	<th><spring:message code="business.enquiry.time.label" /></th>
                                            	<th><spring:message code="totalTurnover.label" /></th>
                                            	
                                            	<th><spring:message code="salesBills.label" /></th>
                                            	<th><spring:message code="returnBills.label" /></th>
                                            	<th><spring:message code="sold.qty.label" /></th>
                                            	<th><spring:message code="return.qty.label" /></th>
                                            	
                                            	
                                                <th><spring:message code="cash_total.label" /></th>
                                                <th><spring:message code="card_total.label" /></th>
                                               
                                                    <th><spring:message code="exchange.amount.label" /></th>
                                                <th><spring:message code="sodexo.total.label" /></th>
                                                <th><spring:message code="ticket.total.label" /></th>
                                                <th><spring:message code="loyalty.total.label" /></th>
                                               
                                                <th><spring:message code="creditNoteRedim.label" /></th>
                                                   <th><spring:message code="creditNoteIssue.label" /></th>
                                                <th><spring:message code="giftvouchers.label" /></th>
                                                <th><spring:message code="giftCoupons.label" /></th>
                                                <th><spring:message code="othersaleQty.label" /></th>
                                                
                                                 <th><spring:message code="otherReturnQty.label" /></th>
                                                
                                                <th><spring:message code="credits.amount.label" /></th>
                                              <%--   <th><spring:message code="total.price.label" /></th> --%>
                                                <th><spring:message code="avg.saleQty.label" /></th>
                                                <th><spring:message code="avg.saleValue.label" /></th>
                                            </tr>
                                        </thead>
                                        <tbody style="text-align: center;">
                                        <c:set var="dataExists" value="false"></c:set>
                                           <c:forEach var="salesReport" items="${salesReportList}" varStatus="theCount">
                                            <c:if test="${theCount.last}">
                                        	 <tr style="border-bottom: 2px solid #ccc;">
                                        	  <td>${theCount.count+index-1}</td>
                                        	 	<td>${salesReport.dateStr}</td>
                                            	<td style="white-space: nowrap;">${salesReport.hour} - ${salesReport.hour+1}</td>
                                                  
                                                   <td>${salesReport.overallCashTotal}</td>
                                                   
                                                   <td>${salesReport.billCount}</td>
                                                  <td>${salesReport.returnbills}</td>
                                                  <td>${salesReport.saleQty}</td>
                                                  <td>${salesReport.returnQty}</td>
                                                      
                                                  
                                                <td>${salesReport.cashTotal}</td>
                                                <td>${salesReport.cardTotal}</td>
                                                
                                                  <td>${salesReport.exchangeAmount}</td>
                                                <td>${salesReport.sodexoTotal}</td>
                                                <td>${salesReport.ticketTotal}</td>
                                                <td>${salesReport.loyalityTotal}</td>
                                                 <td>${salesReport.creditNoteTotal}</td>
                                                  <td>${salesReport.returnAmount}</td>
                                                <td>${salesReport.giftVoucherTotal}</td>
                                                <td>${salesReport.couponsTotal}</td>
                                                 <td>${salesReport.othersAmt}</td>
                                                 
                                                 <td>${salesReport.otherReturnAmt}</td>
                                                 
                                                 <td>${salesReport.creditsAmount}</td>
                                               <%--  <td>${salesReport.overallCashTotal}</td> --%>
                                                 <td>${salesReport.avgBilQty}</td>
                                                <td>${salesReport.avgBilValue}</td>
                                                
                                        	 </tr>
                                        	</c:if>
                                        	<c:if test="${!theCount.last}">
                                        	 <tr>
                                        	  <td>${theCount.count+index-1}</td>
                                                <td>${salesReport.dateStr}</td>
                                            	<td style="white-space: nowrap;">${salesReport.hour}  - ${salesReport.hour+1}</td>
                                             
                                                
                                                
                                                 <td>${salesReport.overallCashTotal}</td>
                                                 
                                                 <td>${salesReport.billCount}</td>
                                                 <td>${salesReport.returnbills}</td>
                                                 <td>${salesReport.saleQty}</td>
                                                 <td>${salesReport.returnQty}</td>
                                                
                                                <td>${salesReport.cashTotal}</td>
                                                <td>${salesReport.cardTotal}</td>
                                                
                                                 <td>${salesReport.exchangeAmount}</td>
                                                <td>${salesReport.sodexoTotal}</td>
                                                <td>${salesReport.ticketTotal}</td>
                                                <td>${salesReport.loyalityTotal}</td>
                                                 <td>${salesReport.creditNoteTotal}</td>
                                                   <td>${salesReport.returnAmount}</td>
                                                <td>${salesReport.giftVoucherTotal}</td>
                                                <td>${salesReport.couponsTotal}</td>
                                                 <td>${salesReport.othersAmt}</td>
                                                 
                                                 <td>${salesReport.otherReturnAmt}</td>
                                                 
                                                 <td>${salesReport.creditsAmount}</td>
                                               <%--  <td>${salesReport.overallCashTotal}</td> --%>
                                                <td>${salesReport.avgBilQty}</td>
                                                <td>${salesReport.avgBilValue}</td>
                                            </tr>
                                           </c:if>
                                            <c:set var="dataExists" value="true"></c:set>
                                           </c:forEach>
                                           <c:if test="${dataExists == 'true'}">
                                           <tr>
                                           		 <td></td>
                                           		 <td></td>
                                           	 <td style="font-weight:bold;font-size:16px;padding-top:5px">Totals</td>
                                           		   <td>${reportSummary.finalTotal}</td>
                                           		 
                                           		 <td>${reportSummary.totalsalesbills}</td>
                                                 <td>${reportSummary.totalreturnbills}</td>
                                                 <td>${reportSummary.totalSaleQty}</td>
                                                 <td>${reportSummary.totalReturnQty}</td>
                                           		 
                                                <td>${reportSummary.finalCash}</td>
                                                <td>${reportSummary.finalCard}</td>
                                               <td>${reportSummary.finalExchangedAmt}</td>
                                                <td>${reportSummary.finalSodexo}</td>
                                                <td>${reportSummary.finalTicket}</td>
                                                <td>${reportSummary.finalLoyalty}</td>
                                                
                                                <td>${reportSummary.finalCreditNoteAmt}</td>
                                                 <td>${reportSummary.finalReturnedAmt}</td>
                                                 
                                                <td>${reportSummary.finalVouchersAmt}</td>
                                                 <td>${reportSummary.finalCouponsAmt}</td>
                                                 <td>${reportSummary.totalOthersAmt}</td>
                                                 
                                                  <td>${reportSummary.totalOtherReturnAmt}</td>
                                                 
                                                 <td>${reportSummary.finalCreditAmt}</td>
                                              <%--   <td>${reportSummary.finalTotal}</td> --%>
                                               <td>${reportSummary.totAvgQty}</td>
                                           	 <td>${reportSummary.totAvgAmt}</td>
                                           </tr>
                                          </c:if>
                                        </tbody>
                                    </table></div>
                                    <input type="hidden" id="stockdownloadurl" value="${downloadurl}">
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