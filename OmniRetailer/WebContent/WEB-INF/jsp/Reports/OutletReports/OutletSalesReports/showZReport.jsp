<!--/*
 * Project Name 	        : OmniRetailerCustomer
 * Written By		        : Sahitya
 * file name		        : Inventory Manager/Reports/viewOutletXReadingReport.jsp
 * file type		        : JSP
 * description				: display outlet sales reports
 * */ -->


<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
     <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <!DOCTYPE html>
    <html>
    <head>
    <link href="${pageContext.request.contextPath}/css/datatables/dataTables.bootstrap.css" rel="stylesheet" type="text/css" />
    <style>
    .box-header.with-border {
      border:1px solid #e5e6e6;
    }
    .collapse{border:1px solid #e5e6e6;}
    .col-lg-3 {
    width: 25%;
    padding-left: 18px;
    }
    .bg-aqua,
.callout.callout-info,
.alert-info,
.label-info,
.modal-info .modal-body {
  background-color: #2e7ea7 !important;
}
    </style>
    </head>
    <body>
    <section class="content">
    <input type="hidden" id="stockdownloadurl" value="${downloadurl}">
    
   <%--  <div class="form-group col-lg-1" style=" float:right;padding-left: 2px;padding-right: 1px;margin-top: 0px;cursor: pointer;margin-bottom: 0px;">
      <input type="button" class="btn bg-olive btn-inline" onclick="viewOutletZReadingReport('outletZReadingReport','0');"  style="width: 90px;font-size: 16px;" value="<spring:message code="back.label" />" />
      <input type="button" class="btn bg-olive btn-inline" style="" onclick="viewOutletZReadingReport('outletZReadingReport','0');" value="<spring:message code="back.label" />" />
      </div>
     --%>
    <c:choose>
    <c:when test="${not empty zReportResponseObj}">
    <div class="row">
      <div class="form-group col-lg-12">
      
     <%--  <div class="form-group col-lg-1" style=" float:right;padding-left: 2px;padding-right: 1px;margin-top: 0px;cursor: pointer;margin-bottom: 0px;">
      <input type="button" class="btn bg-olive btn-inline" onclick="viewOutletZReadingReport('outletZReadingReport','0');"  style="width: 90px;font-size: 16px;" value="<spring:message code="back.label" />" />
      <input type="button" class="btn bg-olive btn-inline" style="" onclick="viewOutletZReadingReport('outletZReadingReport','0');" value="<spring:message code="back.label" />" />
      </div> --%>
         <div class="form-group col-lg-2" style="padding-left: 1px;padding-right: 1px;margin-top: 8px;cursor: pointer;margin-bottom: 0px;"><span style="font-weight: bold;font-size: 16px;color:#666;cursor: pointer;"><spring:message code="SALES.label"/></span></div>
          <div class="col-lg-10" style="text-align: right;padding-right: 0px;">
		   <input type="button" class="btn bg-olive btn-inline" data-toggle="modal" data-target="#myModalIos"  style="width: 90px;font-size: 16px;    margin-right: 15px;" value="<spring:message code="save.label" />" />
		       <input type="button" class="btn bg-olive btn-inline" onclick="viewOutletZReadingReport('outletZReadingReport','0','${flowLocation}');"  style="width: 90px;font-size: 16px;" value="<spring:message code="back.label" />" />
		 
		 </div>
         <hr style="margin-top: 44px;width: 100%;border-top: 1px solid rgb(181,230,29);">
         <hr style="margin-top: -18px;width: 100%;border-top: 1px solid rgb(181,230,29);">
       </div>
    </div>
    
    <input type="hidden" id="outletLocation" value="${selectedlocation}">
    
    <div class="row" style="">
      <div class="form-group col-lg-3">
         <div class="row row-inner">
             <div class="form-group col-lg-9">
               <label><spring:message code="sales.label"/></label>
             </div>
             <div class="form-group col-lg-1">
               <label><c:out value="${empty zReportResponseObj.sales ? 0.0 : zReportResponseObj.sales}" /></label>
             </div>
          </div>
      </div>
      <div style="border-right: 1px solid #e5e6e6;"></div>
      <div class="form-group col-lg-3">
        <div class="row row-inner" style="">
             <div class="form-group col-lg-9">
               <label><spring:message code="net_sales_exclusive_tax.label"/></label>
             </div>
             <div class="form-group col-lg-1">
               <label><c:out value="${empty zReportResponseObj.netSalesExclusiveTax ? 0.0 : zReportResponseObj.netSalesExclusiveTax}" /></label>
             </div>
          </div>
      </div>
      <div class="form-group col-lg-3">
         <div class="row row-inner" style="">
             <div class="form-group col-lg-9">
               <label><spring:message code="tax.label"/></label>
             </div>
             <div class="form-group col-lg-1">
               <label><c:out value="${empty zReportResponseObj.tax ? 0.0 : zReportResponseObj.tax}" /></label>
             </div>
          </div>
      </div>
       <div style="border-right: 1px solid #e5e6e6;"></div>
      <div class="form-group col-lg-3">
         <div class="row row-inner" style="">
             <div class="form-group col-lg-9">
               <label><spring:message code="deposit_refunded.label"/></label>
             </div>
             <div class="form-group col-lg-1">
               <label><c:out value="${empty zReportResponseObj.depositRefunded ? 0.0 : zReportResponseObj.depositRefunded}" /></label>
             </div>
          </div>
      </div>
    </div>
    
    
     <div class="row">
      <div class="form-group col-lg-3">
         <div class="row row-inner">
             <div class="form-group col-lg-9">
               <label><spring:message code="items.discount.label"/></label>
             </div>
             <div class="form-group col-lg-1">
               <label><c:out value="${empty zReportResponseObj.itemWiseDiscount ? 0.0 : zReportResponseObj.itemWiseDiscount}" /></label>
             </div>
          </div>
      </div>
      <div class="form-group col-lg-3">
         <div class="row row-inner" style="">
             <div class="form-group col-lg-9">
               <label><spring:message code="cess.label"/></label>
             </div>
             <div class="form-group col-lg-1">
               <label><c:out value="${empty zReportResponseObj.cess ? 0.0 : zReportResponseObj.cess}" /></label>
             </div>
          </div>
      </div>
      <div class="form-group col-lg-3">
          <div class="row row-inner" style="">
             <div class="form-group col-lg-9">
               <label><spring:message code="tax_exempted.label"/></label>
             </div>
             <div class="form-group col-lg-1">
               <label><c:out value="${empty zReportResponseObj.taxExempted ? 0.0 : zReportResponseObj.taxExempted}" /></label>
             </div>
          </div>
         
      </div>
      <div class="form-group col-lg-3">
         <div class="row row-inner" style="">
             <div class="form-group col-lg-9">
               <label><spring:message code="deposit_foredited.label"/></label>
             </div>
             <div class="form-group col-lg-1">
               <label><c:out value="${empty zReportResponseObj.depositForefeited ? 0.0 : zReportResponseObj.depositForefeited}" /></label>
             </div>
          </div>
      </div>
    </div>
    
    
    <div class="row">
      <div class="form-group col-lg-3">
          <div class="row row-inner" style="">
             <div class="form-group col-lg-9">
               <label><spring:message code="overall_discount.label"/></label>
             </div>
             <div class="form-group col-lg-1">
               <label><c:out value="${empty zReportResponseObj.overalDiscount ? 0.0 : zReportResponseObj.overalDiscount}" /></label>
             </div>
          </div>
      </div>
      <div class="form-group col-lg-3">
         <div class="row row-inner" style="">
             <div class="form-group col-lg-9">
               <label><spring:message code="service_charge.label"/></label>
             </div>
             <div class="form-group col-lg-1">
               <label><c:out value="${empty zReportResponseObj.serviceCharge ? 0.0 : zReportResponseObj.serviceCharge}" /></label>
             </div>
          </div>
      </div>
      <div class="form-group col-lg-3">
          <div class="row row-inner" style="">
             <div class="form-group col-lg-9">
               <label><spring:message code="total_sales_collection.label"/></label>
             </div>
             <div class="form-group col-lg-1">
               <label><c:out value="${empty zReportResponseObj.totalSalesCollection ? 0.0 : zReportResponseObj.totalSalesCollection}" /></label>
             </div>
          </div>
      </div>
      <div class="form-group col-lg-3">
         <div class="row row-inner" style="">
             <div class="form-group col-lg-9">
               <label><spring:message code="deposit_utilized.label"/></label>
             </div>
             <div class="form-group col-lg-1">
               <label><c:out value="${empty zReportResponseObj.depositesUtilized ? 0.0 : zReportResponseObj.depositesUtilized}" /></label>
             </div>
          </div>
      </div>
    </div>
    
     <div class="row">
      <div class="form-group col-lg-3">
         <div class="row row-inner" style="">
             <div class="form-group col-lg-9">
               <label><spring:message code="net_sales_inclusive_tax.label"/></label>
             </div>
             <div class="form-group col-lg-1">
               <label><c:out value="${empty zReportResponseObj.netSalesInclusiveTax ? 0.0 : zReportResponseObj.netSalesInclusiveTax}" /></label>
             </div>
          </div>
      </div>
      <div class="form-group col-lg-3">
          <div class="row row-inner" style="">
             <div class="form-group col-lg-9">
               <label><spring:message code="other_charge.label"/></label>
             </div>
             <div class="form-group col-lg-1">
               <label><c:out value="${empty zReportResponseObj.otherCharge ? 0.0 : zReportResponseObj.otherCharge}" /></label>
             </div>
          </div>
      </div>
      <div class="form-group col-lg-3">
         <div class="row row-inner" style="">
             <div class="form-group col-lg-9">
               <label><spring:message code="deposit_collected.label"/></label>
             </div>
             <div class="form-group col-lg-1">
               <label><c:out value="${empty zReportResponseObj.depositCollected ? 0.0 : zReportResponseObj.depositCollected}" /></label>
             </div>
          </div>
      </div>
      <div class="form-group col-lg-3">
         <div class="row row-inner" style="">
             <div class="form-group col-lg-9">
               <label><spring:message code="total_amount_collected.label"/></label>
             </div>
             <div class="form-group col-lg-1">
               <label><c:out value="${empty zReportResponseObj.totalAmmountCollected ? 0.0 : zReportResponseObj.totalAmmountCollected}" /></label>
             </div>
          </div>
      </div>
    </div>
    
     <div class="row">
      <div class="form-group col-lg-12">
         <div class="form-group col-lg-2" style="padding-left: 1px;padding-right: 1px;margin-top: 8px;cursor: pointer;margin-bottom: 0px;"><span style="font-weight: bold;font-size: 16px;color:#666;cursor: pointer;"><spring:message code="RECEIPTS.label"/></span></div>
         <hr style="margin-top: 44px;width: 100%;border-top: 1px solid rgb(181,230,29);">
         <hr style="margin-top: -18px;width: 100%;border-top: 1px solid rgb(181,230,29);">
       </div>
    </div>
    
    
    
     <div class="row">
      <div class="form-group col-lg-3">
         <div class="row row-inner" style="">
             <div class="form-group col-lg-9">
               <label><spring:message code="sales_receipts.label"/></label>
             </div>
             <div class="form-group col-lg-1">
               <label><c:out value="${empty zReportResponseObj.salesReports ? 0.0 : zReportResponseObj.salesReports}" /></label>
             </div>
          </div>
      </div>
      <div class="form-group col-lg-3">
          <div class="row row-inner" style="">
             <div class="form-group col-lg-9">
               <label><spring:message code="traning_receipts.label"/></label>
             </div>
             <div class="form-group col-lg-1">
               <label><c:out value="${empty zReportResponseObj.trainingReceipts ? 0.0 : zReportResponseObj.trainingReceipts}" /></label>
             </div>
          </div>
      </div>
      <div class="form-group col-lg-3">
         <div class="row row-inner" style="margin-top:-20px !important;">
             <div class="form-group col-lg-9">
               <label><spring:message code="manual_receipts.label"/></label>
             </div>
             <div class="form-group col-lg-1">
               <label><c:out value="${empty zReportResponseObj.manualReceipts ? 0.0 : zReportResponseObj.manualReceipts}" /></label>
             </div>
          </div>
      </div>
      <div class="form-group col-lg-3">
         <div class="row row-inner" style="">
             <div class="form-group col-lg-9">
               <label><spring:message code="deposit_receipts.label"/></label>
             </div>
             <div class="form-group col-lg-1">
               <label><c:out value="${empty zReportResponseObj.depositeReceipts ? 0.0 : zReportResponseObj.depositeReceipts}" /></label>
             </div>
          </div>
      </div>
       <div class="form-group col-lg-3">
         <div class="row row-inner" style="">
             <div class="form-group col-lg-9">
               <label><spring:message code="pendingBills.label"/></label>
             </div>
             <div class="form-group col-lg-1">
               <label><c:out value="${empty zReportResponseObj.pendingBills ? 0.0 : zReportResponseObj.pendingBills}" /></label>
             </div>
          </div>
      </div>
       <div class="form-group col-lg-3">
         <div class="row row-inner" style="">
             <div class="form-group col-lg-9">
               <label><spring:message code="creditbills.label"/></label>
             </div>
             <div class="form-group col-lg-1">
               <label><c:out value="${empty zReportResponseObj.noOfCreditBills ? 0.0 : zReportResponseObj.noOfCreditBills}" /></label>
             </div>
          </div>
      </div>
    </div>

    <div class="row">
      <div class="form-group col-lg-12">
         <div class="form-group col-lg-2" style="padding-left: 1px;padding-right: 1px;margin-top: 8px;cursor: pointer;margin-bottom: 0px;"><span style="font-weight: bold;font-size: 16px;color:#666;cursor: pointer;"><spring:message code="AGGREGATE.label"/></span></div>
         <hr style="margin-top: 44px;width: 100%;border-top: 1px solid rgb(181,230,29);">
         <hr style="margin-top: -18px;width: 100%;border-top: 1px solid rgb(181,230,29);">
       </div>
    </div>
    
    
    
    
     
      <div class="form-group col-lg-3">
         <div class="row row-inner" style="">
             <div class="form-group col-lg-9">
               <label><spring:message code="no_of_items_sold.label"/></label>
             </div>
             <div class="form-group col-lg-1">
               <label><c:out value="${empty zReportResponseObj.noOfItemsSold ? 0.0 : zReportResponseObj.noOfItemsSold}" /></label>
             </div>
          </div>
      </div>
       <div class="form-group col-lg-3">
         <div class="row row-inner" style="">
             <div class="form-group col-lg-9">
               <label><spring:message code="discountitems.label"/></label>
             </div>
             <div class="form-group col-lg-1">
               <label><c:out value="${empty zReportResponseObj.noOfDiscountedItems ? 0.0 : zReportResponseObj.noOfDiscountedItems}" /></label>
             </div>
          </div>
      </div>
      <div class="form-group col-lg-3">
         <div class="row row-inner" style="">
             <div class="form-group col-lg-9">
               <label><spring:message code="no_of_food_coupons.label"/></label>
             </div>
             <div class="form-group col-lg-1">
               <label><c:out value="${empty zReportResponseObj.foodCouponsTotal ? 0.0 : zReportResponseObj.foodCouponsTotal}" /></label>
             </div>
          </div>
      </div>
      <div class="form-group col-lg-3">
          <div class="row row-inner" style="">
             <div class="form-group col-lg-9">
               <label><spring:message code="no_of_price_overrides.label"/></label>
             </div>
             <div class="form-group col-lg-1">
               <label><c:out value="${empty zReportResponseObj.noOfPriceOverrides ? 0.0 : zReportResponseObj.noOfPriceOverrides}" /></label>
             </div>
          </div>
      </div>
      <div class="form-group col-lg-3">
         <div class="row row-inner" style="">
             <div class="form-group col-lg-9">
               <label><spring:message code="no_of_deposit_refunded.label"/></label>
             </div>
             <div class="form-group col-lg-1">
               <label><c:out value="${empty zReportResponseObj.noOfDepositRefunded ? 0.0 : zReportResponseObj.noOfDepositRefunded}" /></label>
             </div>
          </div>
      </div>
      <div class="form-group col-lg-3">
         <div class="row row-inner" style="">
             <div class="form-group col-lg-9">
               <label><spring:message code="no_of_void_items.label"/></label>
             </div>
             <div class="form-group col-lg-1">
               <label><c:out value="${empty zReportResponseObj.noOfVoidItems ? 0.0 : zReportResponseObj.noOfVoidItems}" /></label>
             </div>
          </div>
      </div>
      <div class="form-group col-lg-3">
         <div class="row row-inner" style="">
             <div class="form-group col-lg-9">
               <label><spring:message code="no_of_loyalty_points.label"/></label>
             </div>
             <div class="form-group col-lg-1">
               <label><c:out value="${empty zReportResponseObj.loyaltyPointsTotal ? 0.0 : zReportResponseObj.loyaltyPointsTotal}" /></label>
             </div>
          </div>
      </div>
      <div class="form-group col-lg-3">
          <div class="row row-inner" style="">
             <div class="form-group col-lg-9">
               <label><spring:message code="no_of_customer.label"/></label>
             </div>
             <div class="form-group col-lg-1">
               <label><c:out value="${empty zReportResponseObj.noOfCustomers ? 0.0 : zReportResponseObj.noOfCustomers}" /></label>
             </div>
          </div>
      </div>
      <div class="form-group col-lg-3">
         <div class="row row-inner" style="">
             <div class="form-group col-lg-9">
               <label><spring:message code="no_of_deposit_foredited.label"/></label>
             </div>
             <div class="form-group col-lg-1">
               <label><c:out value="${empty zReportResponseObj.depositForefeited ? 0.0 : zReportResponseObj.depositForefeited}" /></label>
             </div>
          </div>
      </div>
      <div class="form-group col-lg-3">
          <div class="row row-inner" style="">
             <div class="form-group col-lg-9">
               <label><spring:message code="no_of_sales_done.label"/></label>
             </div>
             <div class="form-group col-lg-1">
               <label><c:out value="${empty zReportResponseObj.noOfNoSaleDone ? 0.0 : zReportResponseObj.noOfNoSaleDone}" /></label>
             </div>
          </div>
      </div>
      <div class="form-group col-lg-3">
         <div class="row row-inner" style="">
             <div class="form-group col-lg-9">
               <label><spring:message code="no_of_line_discounts.label"/></label>
             </div>
             <div class="form-group col-lg-1">
               <label><c:out value="${empty zReportResponseObj.noOfLineDiscounts ? 0.0 : zReportResponseObj.noOfLineDiscounts}" /></label>
             </div>
          </div>
      </div>
      <div class="form-group col-lg-3">
          <div class="row row-inner" style="">
             <div class="form-group col-lg-9">
               <label><spring:message code="no_of_deposit_collected.label"/></label>
             </div>
             <div class="form-group col-lg-1">
               <label><c:out value="${empty zReportResponseObj.noOfDepositCollected ? 0.0 : zReportResponseObj.noOfDepositCollected}" /></label>
             </div>
          </div>
      </div>
      <div class="form-group col-lg-3">
         <div class="row row-inner" style="">
             <div class="form-group col-lg-9">
               <label><spring:message code="no_of_deposit_utilized.label"/></label>
             </div>
             <div class="form-group col-lg-1">
               <label><c:out value="${empty zReportResponseObj.noOfDepositesUtilized ? 0.0 : zReportResponseObj.noOfDepositesUtilized}" /></label>
             </div>
          </div>
      </div>
 
    
    <div class="row">
      <div class="form-group col-lg-12">
         <div class="form-group col-lg-2" style="padding-left: 1px;padding-right: 1px;margin-top: 8px;cursor: pointer;margin-bottom: 0px;"><span style="font-weight: bold;font-size: 16px;color:#666;cursor: pointer;"><spring:message code="PAYMENTS.label"/></span></div>
         <hr style="margin-top: 44px;width: 100%;border-top: 1px solid rgb(181,230,29);">
         <hr style="margin-top: -18px;width: 100%;border-top: 1px solid rgb(181,230,29);">
       </div>
    </div>
    
    
    
    <div class="row">
    <c:forEach var="tenders" items="${tenderDetails}" varStatus="theCount">
    <div class="form-group col-lg-3">
          <div class="row row-inner" style="">
             <div class="form-group col-lg-9">
               <label>${tenders.tenderName}</label>
             </div>
             <div class="form-group col-lg-1">
             
             <c:choose>
             <c:when test="${tenders.modeOfPayment == 'Card'}">
             <label><c:out value="${empty zReportResponseObj.cardTotal ? 0.0 : zReportResponseObj.cardTotal}" /></label>
			</c:when>
			
			 <c:when test="${tenders.modeOfPayment == 'Coupon'}">
             <label><c:out value="${empty zReportResponseObj.coupons? 0.0 : zReportResponseObj.coupons}" /></label>
			</c:when>
			
			 <c:when test="${tenders.modeOfPayment == 'Cheque'}">
             <label>0.0</label>
			</c:when>
			
			 <c:when test="${tenders.modeOfPayment == 'Credit Note'}">
             <label><c:out value="${empty zReportResponseObj.totalCreditNoteAmt? 0.0 : zReportResponseObj.totalCreditNoteAmt}" /></label>
			</c:when>
			
			 <c:when test="${tenders.modeOfPayment == 'Cash'}">
             <label><c:out value="${empty zReportResponseObj.cashTotal ? 0.0 : zReportResponseObj.cashTotal}" /></label>
			</c:when>
			
			<c:when test="${tenders.modeOfPayment == 'Travelers Restaurent'}">
             <label>0.0</label>
			</c:when>
			
			<c:when test="${tenders.modeOfPayment == 'Finance'}">
             <label>0.0</label>
			</c:when>
			
			<c:when test="${tenders.modeOfPayment == 'UPI'}">
             <label>0.0</label>
			</c:when>
			
			<c:when test="${tenders.modeOfPayment == 'Wallet'}">
             <label><c:out value="${empty zReportResponseObj.walletAmount ? 0.0 : zReportResponseObj.walletAmount}" /></label>
			</c:when>
			
			<c:when test="${tenders.modeOfPayment == 'Rewards'}">
             <label>0.0</label>
			</c:when>
			
			<c:when test="${tenders.modeOfPayment == 'Others'}">
             <label>0.0</label>
			</c:when>
			
			<c:when test="${tenders.modeOfPayment == 'NEFT'}">
             <label>0.0</label>
			</c:when>
			
			<c:when test="${tenders.tenderName == 'FreeCharge'}">
             <label>0.0</label>
			</c:when>
			<c:when test="${tenders.tenderName == 'PayTM'}">
             <label><c:out value="${empty zReportResponseObj.payTmAmt ? 0.0 : zReportResponseObj.payTmAmt}" /></label>
			</c:when>
			
			<c:when test="${tenders.tenderName == 'PhonePay'}">
             <label><c:out value="${empty zReportResponseObj.phonePayAmount ? 0.0 : zReportResponseObj.phonePayAmount}" /></label>
			</c:when>
			
			<c:when test="${tenders.modeOfPayment == 'Sodexo'}">
             <label><c:out value="${empty zReportResponseObj.sodexoTotal? 0.0 : zReportResponseObj.sodexoTotal}" /></label>
			</c:when>
			<c:otherwise>
            	<label>0.0</label>
			</c:otherwise>
			
			</c:choose>
             
             </div>
          </div>
      </div>
    </c:forEach>
   <%--  <c:forEach var="Alltenders" items="${allTenders}" varStatus="theCount">
    <c:if test="${Alltenders.modeOfPayment == 'Wallet'}">
       <div class="form-group col-lg-3">
          <div class="row row-inner" style="">
             <div class="form-group col-lg-9">
               <label>${Alltenders.tenderName}</label>
             </div>
             <div class="form-group col-lg-1">
             
             <c:choose>
			<c:when test="${Alltenders.tenderName == 'FreeCharge'}">
             <label>0.0</label>
			</c:when>
			<c:when test="${Alltenders.tenderName == 'PayTM'}">
             <label><c:out value="${empty zReportResponseObj.payTmAmt ? 0.0 : zReportResponseObj.payTmAmt}" /></label>
			</c:when>
			
			<c:when test="${Alltenders.tenderName == 'PhonePay'}">
             <label><c:out value="${empty zReportResponseObj.phonePayAmount ? 0.0 : zReportResponseObj.phonePayAmount}" /></label>
			</c:when>
			
			<c:otherwise>
            	<label>0.0</label>
			</c:otherwise>
			
			</c:choose>
             
             </div>
          </div>
      </div>
      </c:if>
    </c:forEach> --%>
     <%--  <div class="form-group col-lg-3">
          <div class="row row-inner" style="">
             <div class="form-group col-lg-9">
               <label><spring:message code="card_total.label"/></label>
             </div>
             <div class="form-group col-lg-1">
               <label><c:out value="${empty zReportResponseObj.cardTotal ? 0.0 : zReportResponseObj.cardTotal}" /></label>
             </div>
          </div>
      </div>
      <div class="form-group col-lg-3">
         <div class="row row-inner" style="">
            <div class="form-group col-lg-9">
               <label><spring:message code="cancellation.label"/></label>
             </div>
             <div class="form-group col-lg-1">
               <label><c:out value="${empty zReportResponseObj.cancellation ? 0.0 : zReportResponseObj.cancellation}" /></label>
             </div>
          </div>
      </div>
      <div class="form-group col-lg-3">
          <div class="row row-inner" style="">
             <div class="form-group col-lg-9">
               <label><spring:message code="open_balance.label"/></label>
             </div>
             <div class="form-group col-lg-1">
               <label><c:out value="${empty zReportResponseObj.openBalance ? 0.0 : zReportResponseObj.openBalance}" /></label>
             </div>
          </div>
      </div>
      <div class="form-group col-lg-3">
         <div class="row row-inner" style="">
             <div class="form-group col-lg-9">
               <label><spring:message code="system_sales.label"/></label>
             </div>
             <div class="form-group col-lg-1">
               <label><c:out value="${empty zReportResponseObj.totalSalesCollection ? 0.0 : zReportResponseObj.totalSalesCollection}" /></label>
             </div>
          </div>
      </div> --%>
    </div>
    
    
   <%--  <div class="row">
      <div class="form-group col-lg-3">
          <div class="row row-inner" style="">
             <div class="form-group col-lg-9">
               <label><spring:message code="cash_total.label"/></label>
             </div>
             <div class="form-group col-lg-1">
               <label><c:out value="${empty zReportResponseObj.cashTotal ? 0.0 : zReportResponseObj.cashTotal}" /></label>
             </div>
          </div>
      </div>
      <div class="form-group col-lg-3">
         <div class="row row-inner" style="">
             <div class="form-group col-lg-9">
               <label><spring:message code="refund_exchange.label"/></label>
                <label>Refund Amount</label>
             </div>
             <div class="form-group col-lg-1">
               <label><c:out value="${empty zReportResponseObj.returnTotal ? 0.0 : zReportResponseObj.returnTotal}" /></label>
             </div>
          </div>
      </div>
      <div class="form-group col-lg-3">
          <div class="row row-inner" style="">
             <div class="form-group col-lg-9">
               <label><spring:message code="loyalty_points_total.label"/></label>
             </div>
             <div class="form-group col-lg-1">
               <label><c:out value="${empty zReportResponseObj.loyaltyPointsTotal ? 0.0 : zReportResponseObj.loyaltyPointsTotal}" /></label>
             </div>
          </div>
      </div>
      <div class="form-group col-lg-3">
         <div class="row row-inner" style="">
             <div class="form-group col-lg-9">
               <label><spring:message code="total_inwards.label"/></label>
             </div>
             <div class="form-group col-lg-1">
               <label><c:out value="${empty zReportResponseObj.totalInwords? 0.0 : zReportResponseObj.totalInwords}" /></label>
             </div>
          </div>
      </div>
    </div> --%>
    
    
    <%-- <div class="row">
      <div class="form-group col-lg-3">
          <div class="row row-inner" style="">
             <div class="form-group col-lg-9">
               <label><spring:message code="food_coupons_transactions.label"/></label>
             </div>
             <div class="form-group col-lg-1">
               <label><c:out value="${empty zReportResponseObj.foodCouponsTransactions ? 0.0 : zReportResponseObj.foodCouponsTransactions}" /></label>
             </div>
          </div>
      </div>
      <div class="form-group col-lg-3">
         <div class="row row-inner" style="">
              <div class="form-group col-lg-9">
               <label><spring:message code="loyalty_points_transactions.label"/></label>
             </div>
             <div class="form-group col-lg-1">
               <label><c:out value="${empty zReportResponseObj.loyaltyPointsTransactions ? 0.0 : zReportResponseObj.loyaltyPointsTransactions}" /></label>
             </div>
          </div>
      </div>
      <div class="form-group col-lg-3">
          <div class="row row-inner" style="">
              <div class="form-group col-lg-9">
               <label><spring:message code="food_coupons_total.label"/></label>
             </div>
             <div class="form-group col-lg-1">
               <label><c:out value="${empty zReportResponseObj.foodCouponsTotal ? 0.0 : zReportResponseObj.foodCouponsTotal}" /></label>
             </div>
          </div>
      </div>
      <div class="form-group col-lg-3">
         <div class="row row-inner" style="">
             <div class="form-group col-lg-9">
               <label><spring:message code="total_outwards.label"/></label>
             </div>
             <div class="form-group col-lg-1">
               <label><c:out value="${empty zReportResponseObj.totalOutwords? 0.0 : zReportResponseObj.totalOutwords}" /></label>
             </div>
          </div>
      </div>
        <div class="form-group col-lg-3">
         <div class="row row-inner" style="">
             <div class="form-group col-lg-9">
               <label><spring:message code="creditnote.label"/></label>
             </div>
             <div class="form-group col-lg-1">
               <label><c:out value="${empty zReportResponseObj.totalCreditNoteAmt? 0.0 : zReportResponseObj.totalCreditNoteAmt}" /></label>
             </div>
          </div>
      </div>
              <div class="form-group col-lg-3">
         <div class="row row-inner" style="">
             <div class="form-group col-lg-9">
               <label><spring:message code="sodexo.amount.label"/></label>
             </div>
             <div class="form-group col-lg-1">
               <label><c:out value="${empty zReportResponseObj.sodexoTotal? 0.0 : zReportResponseObj.sodexoTotal}" /></label>
             </div>
          </div>
      </div>
         <div class="form-group col-lg-3">
         <div class="row row-inner" style="">
             <div class="form-group col-lg-9">
               <label><spring:message code="giftvouchers.label"/></label>
             </div>
             <div class="form-group col-lg-1">
               <label><c:out value="${empty zReportResponseObj.giftVouchers? 0.0 : zReportResponseObj.giftVouchers}" /></label>
             </div>
          </div>
      </div>
        <div class="form-group col-lg-3">
         <div class="row row-inner" style="">
             <div class="form-group col-lg-9">
               <label><spring:message code="giftCoupons.label"/></label>
             </div>
             <div class="form-group col-lg-1">
               <label><c:out value="${empty zReportResponseObj.coupons? 0.0 : zReportResponseObj.coupons}" /></label>
             </div>
          </div>
      </div>
      <div class="form-group col-lg-3">
         <div class="row row-inner" style="">
             <div class="form-group col-lg-9">
               <label><spring:message code="ticket.amount.label"/></label>
             </div>
             <div class="form-group col-lg-1">
               <label><c:out value="${empty zReportResponseObj.ticketTotal? 0.0 : zReportResponseObj.ticketTotal}" /></label>
             </div>
          </div>
      </div>
       <div class="form-group col-lg-3">
         <div class="row row-inner" style="">
             <div class="form-group col-lg-9">
               <label><spring:message code="credits.amount.label"/></label>
             </div>
             <div class="form-group col-lg-1">
               <label><c:out value="${empty zReportResponseObj.totalCreditsAmt? 0.0 : zReportResponseObj.totalCreditsAmt}" /></label>
             </div>
          </div>
      </div>
       <div class="form-group col-lg-3">
         <div class="row row-inner" style="">
             <div class="form-group col-lg-9">
               <label><spring:message code="pendingBillsAmt.label"/></label>
             </div>
             <div class="form-group col-lg-1">
               <label><c:out value="${empty zReportResponseObj.pendingBillsAmt? 0.0 : zReportResponseObj.pendingBillsAmt}" /></label>
             </div>
          </div>
      </div>
       <div class="form-group col-lg-3">
         <div class="row row-inner" style="">
             <div class="form-group col-lg-9">
               <label><spring:message code="creditBillsAmt.label"/></label>
             </div>
             <div class="form-group col-lg-1">
               <label><c:out value="${empty zReportResponseObj.totalCreditBillsAmt? 0.0 : zReportResponseObj.totalCreditBillsAmt}" /></label>
             </div>
          </div>
      </div>
      <div class="form-group col-lg-3">
         <div class="row row-inner" style="">
             <div class="form-group col-lg-9">
               <label><spring:message code="refund_exchange.label"/></label>
                <label>Exchange Amount</label>
             </div>
             <div class="form-group col-lg-1">
               <label><c:out value="${empty zReportResponseObj.exchangeTotal ? 0.0 : zReportResponseObj.exchangeTotal}" /></label>
             </div>
          </div>
      </div>
       <div class="form-group col-lg-3">
         <div class="row row-inner" style="">
             <div class="form-group col-lg-9">
               <label><spring:message code="refund_exchange.label"/></label>
                <label>Paytm Total</label>
             </div>
             <div class="form-group col-lg-1">
               <label><c:out value="${empty zReportResponseObj.payTmAmt ? 0.0 : zReportResponseObj.payTmAmt}" /></label>
             </div>
          </div>
      </div>
    </div> --%>
   <%--  <div class="row">
     <div class="form-group col-lg-3">
         <div class="row row-inner" style="">
             <div class="form-group col-lg-9">
               <label><spring:message code="refund_exchange.label"/></label>
                <label>Advance Amount</label>
             </div>
             <div class="form-group col-lg-1">
               <label><c:out value="${empty zReportResponseObj.totalAdvancePayment ? 0.0 : zReportResponseObj.totalAdvancePayment}" /></label>
             </div>
          </div>
      </div>
      <div class="form-group col-lg-3">
         <div class="row row-inner" style="">
             <div class="form-group col-lg-9">
               <label><spring:message code="refund_exchange.label"/></label>
                <label>Wallet Amount</label>
             </div>
             <div class="form-group col-lg-1">
               <label><c:out value="${empty zReportResponseObj.walletAmount ? 0.0 : zReportResponseObj.walletAmount}" /></label>
             </div>
          </div>
      </div>
    
    <div class="form-group col-lg-3">
         <div class="row row-inner" style="">
             <div class="form-group col-lg-9">
               <label><spring:message code="refund_exchange.label"/></label>
                <label>PhonePay Amount</label>
             </div>
             <div class="form-group col-lg-1">
               <label><c:out value="${empty zReportResponseObj.phonePayAmount ? 0.0 : zReportResponseObj.phonePayAmount}" /></label>
             </div>
          </div>
      </div>
    </div> --%>
     <div class="row">
      <div class="form-group col-lg-12">
         <div class="form-group col-lg-2" style="padding-left: 1px;padding-right: 1px;margin-top: 8px;cursor: pointer;margin-bottom: 0px;"><span style="font-weight: bold;font-size: 16px;color:#666;cursor: pointer;"><spring:message code="OTHER_INFO.label"/></span></div>
         <hr style="margin-top: 44px;width: 100%;border-top: 1px solid rgb(181,230,29);">
         <hr style="margin-top: -18px;width: 100%;border-top: 1px solid rgb(181,230,29);">
       </div>
    </div>
    
    <div class="row">
       <div class="box-body">
                  <div class="box-group" id="accordion">
                    <!-- we are adding the .panel class so bootstrap.js collapse plugin detects it -->
                    <div class="panel box box-primary" style="box-shadow:none;">
                      <div class="box-header with-border">
                        <h4 class="box-title">
                          <a data-toggle="collapse" data-parent="#accordion" href="#collapseOne"><spring:message code="VOID_ITEMS.label"/></a>
                        </h4>
                      </div>
                      <div id="collapseOne" class="panel-collapse collapse in">
                        <div class="box-body">
                          <div class="row">
                             <div class="form-group col-lg-2"></div>
                             <div class="form-group col-lg-8">
                               <table id="voidItems" class="table table-bordered table-striped">
                                    <thead style="background-color: #3c8dbc; color: #ffffff">
                                            <tr>
                                            	<th><spring:message code="billing_id.label" /></th>
                                                <th><spring:message code="time.label" /></th>
                                                <th><spring:message code="refund.label" /></th>
                                                <th><spring:message code="void_amount.label" /></th>
                                                <th><spring:message code="discount.label" /></th>
                                            </tr>
                                        </thead>
                                        <tbody style="text-align: center;">
                                        
                                         <c:forEach var="voidItemsInfo" items="${zReportResponseObj.voidItems}">
                                            <tr>
                                            	<td><c:out value="${empty voidItemsInfo.billId? 0 : voidItemsInfo.billId}" /></td>
                                                <td><c:out value="${empty voidItemsInfo.time? 0.0 : voidItemsInfo.time}" /></td>
                                                <td><c:out value="${empty voidItemsInfo.refund? 0.0 : voidItemsInfo.refund}" /></td> 
                                                <td><c:out value="${empty voidItemsInfo.voidAmount? 0.0 : voidItemsInfo.voidAmount}" /></td> 
                                                <td><c:out value="${empty voidItemsInfo.discount? 0.0 : voidItemsInfo.discount}" /></td> 
                							</tr>
                                            </c:forEach>
                                        </tbody>
                                    </table>
                             </div>
                             <div class="form-group col-lg-2"></div>
                          </div>
                        </div>
                      </div>
                    </div>
                    <br>
                   <div class="panel box box-primary" style="box-shadow:none;">
                      <div class="box-header with-border">
                        <h4 class="box-title">
                          <a data-toggle="collapse" data-parent="#accordion" href="#collapseTwo" >
                          <spring:message code="HOUR_WISE.label"/></a>
                        </h4>
                        <!-- <div class="box-tools pull-right">
                          <a data-toggle="collapse" data-parent="#accordion" href="#collapseOne" onclick="changeImage();">
                          <i class="fa fa-plus"></i></a>
                        </div> -->
                      </div>
                      <div id="collapseTwo" class="panel-collapse collapse in">
                        <div class="box-body">
                          <div class="row">
                             <div class="form-group col-lg-2"></div>
                             <div class="form-group col-lg-8">
                               <table id="hourInfo" class="table table-bordered table-striped">
                                    <thead style="background-color: #3c8dbc; color: #ffffff">
                                            <tr>
                                            	<th><spring:message code="hour.label" /></th>
                                            	<th><spring:message code="count.label" /></th>
                                                <th><spring:message code="sales.label" /></th>
                                                <th><spring:message code="sales_percentage.label" /></th>
                                            </tr>
                                        </thead>
                                        <tbody style="text-align: center;">
                                        
                                         <c:forEach var="hourWiseInfo" items="${zReportResponseObj.hourReports}">
                                            <tr>
                                            	<td><c:out value="${empty hourWiseInfo.hour? 0 : hourWiseInfo.hour}" /></td>
                                                <td><c:out value="${empty hourWiseInfo.count? 0.0 : hourWiseInfo.count}" /></td>
                                                <td><c:out value="${empty hourWiseInfo.sales? 0.0 : hourWiseInfo.sales}" /></td> 
                                                <td><c:out value="${empty hourWiseInfo.salesPercentage? 0.0 : hourWiseInfo.salesPercentage}" /></td>
                							</tr>
                                            </c:forEach>
                                        </tbody>
                                    </table>
                             </div>
                             <div class="form-group col-lg-2"></div>
                          </div>
                          
                          
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
    </div>
    
    
    
    
    
     <div class="row">
      <div class="form-group col-lg-12">
      
    
          <div class="col-lg-12" style="text-align: right;padding-right: 0px;">
		   <input type="button" class="btn bg-olive btn-inline" data-toggle="modal" data-target="#myModalIos"  style="width: 90px;font-size: 16px;    margin-right: 15px;" value="<spring:message code="save.label" />" />
		       <input type="button" class="btn bg-olive btn-inline" onclick="viewOutletZReadingReport('outletZReadingReport','0','${flowLocation}');"  style="width: 90px;font-size: 16px;" value="<spring:message code="back.label" />" />
		 
    
       </div>
    </div>
    </div>
    
     <input type="hidden" id="flowLocation" value="${flowLocation}">       
    
    </c:when>
    <c:otherwise>
      <div class="row">
         <div class="form-group col-lg-3">
         </div>
         <div class="form-group col-lg-6">
          <div class="alert alert-info alert-dismissable">
                    <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
                    <h4><i class="icon fa fa-info"></i><spring:message code="no_records_found.label" /></h4>
                  </div>
         </div>
         <div class="form-group col-lg-3">
         </div>
      </div>
       <div class="row">
      <div class="form-group col-lg-12">
      
    
          <div class="col-lg-12" style="text-align: right;padding-right: 0px;">
		       <input type="button" class="btn bg-olive btn-inline" onclick="viewOutletZReadingReport('outletZReadingReport','0','${flowLocation}');scrollToTop();"  style="width: 90px;font-size: 16px;" value="<spring:message code="back.label" />" />
		 
       </div>
    </div>
    </div>
      
    </c:otherwise>
    </c:choose>
    
    <input type="hidden" id="outletLocation" value="${outletLocation}">
    <input type="hidden" id="outletZone" value="${zone}">
    <input type="hidden" id="fromZRead" value="${startdate}">
    <input type="hidden" id="toZRead" value="${endDate}">
        <input type="hidden" id="maxRecords" value="${maxRecords}">
    
    
    
    </section>
     <script src="${pageContext.request.contextPath}/js/plugins/datatables/jquery.dataTables.js" type="text/javascript"></script>
        <script src="${pageContext.request.contextPath}/js/plugins/datatables/dataTables.bootstrap.js" type="text/javascript"></script>
     <script type="text/javascript">
            $(function() {
                 $('#voidItems').dataTable({
                    "bPaginate": true,
                    "bLengthChange": false,
                    "bFilter": false,
                    "bSort": true,
                    "bInfo": true,
                    "bAutoWidth": false
                });
                 $('#hourInfo').dataTable({
                     "bPaginate": true,
                     "bLengthChange": false,
                     "bFilter": false,
                     "bSort": true,
                     "bInfo": true,
                     "bAutoWidth": false
                 });
               });
        </script>
    </body>
    </html>