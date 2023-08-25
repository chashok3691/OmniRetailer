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
     <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
     <%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
    <!DOCTYPE html>
    <html>
    <head>
    <link href="${pageContext.request.contextPath}/css/datatables/dataTables.bootstrap.css" rel="stylesheet" type="text/css" />
    <style>
    .box-header.with-border {
      border:1px solid #e5e6e6;
    }
    .collapse{border:1px solid #e5e6e6;}
    .bg-aqua,
.callout.callout-info,
.alert-info,
.label-info,
.modal-info .modal-body {
  background-color: #2e7ea7 !important;
}



.btn {
margin-left: 10px;
}
    </style>
    </head>
    <body>
    <section class="content">
     
    <c:choose>
    <c:when test="${not empty xReportResponseObj}">
   
    <div class="row">
      <div class="form-group col-lg-12">
         <div class="form-group col-lg-2" style="padding-left: 1px;padding-right: 1px;margin-top: 8px;cursor: pointer;margin-bottom: 0px;"><span style="font-weight: bold;font-size: 16px;color:#666;cursor: pointer;"><spring:message code="SALES.label"/></span></div>
          <div class="col-lg-10" style="text-align: right;    padding-right: 0px;">
		   <input type="button" class="btn bg-olive btn-inline" data-toggle="modal" data-target="#myModalIos"  style="width:90px;font-size: 16px;" value="<spring:message code="save.label" />" />
		   <input type="button" class="btn bg-olive btn-inline" onclick="viewOutletXReadingReport('outletXReadingReport','0','${flowLocation}');scrollToTop();" style="width:90px;font-size: 16px;" value="<spring:message code="back.label" />" />
		
		 </div>
         <hr style="margin-top: 44px;width: 100%;border-top: 1px solid rgb(181,230,29);">
         <hr style="margin-top: -18px;width: 100%;border-top: 1px solid rgb(181,230,29);">
       </div>
    </div>
    
    <div class="row" style="">
      <div class="form-group col-lg-3">
         <div class="row row-inner">
             <div class="form-group col-lg-9">
               <label><spring:message code="sales.label"/></label>
             </div>
             <div class="form-group col-lg-1">
               <label><c:out value="${empty xReportResponseObj.sales ? 0.0 : xReportResponseObj.sales}" /></label>
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
               <label><c:out value="${empty xReportResponseObj.netSalesExclusiveTax ? 0.0 : xReportResponseObj.netSalesExclusiveTax}" /></label>
             </div>
          </div>
      </div>
      <div class="form-group col-lg-3">
         <div class="row row-inner" style="">
             <div class="form-group col-lg-9">
               <label><spring:message code="tax.label"/></label>
             </div>
             <div class="form-group col-lg-1">
               <label><c:out value="${empty xReportResponseObj.tax ? 0.0 : xReportResponseObj.tax}" /></label>
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
               <label><c:out value="${empty xReportResponseObj.depositRefunded ? 0.0 : xReportResponseObj.depositRefunded}" /></label>
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
               <label><c:out value="${empty xReportResponseObj.itemDiscount ? 0.0 : xReportResponseObj.itemWiseDiscount}" /></label>
             </div>
          </div>
      </div>
      <div class="form-group col-lg-3">
         <div class="row row-inner" style="">
             <div class="form-group col-lg-9">
               <label><spring:message code="cess.label"/></label>
             </div>
             <div class="form-group col-lg-1">
               <label><c:out value="${empty xReportResponseObj.cess ? 0.0 : xReportResponseObj.cess}" /></label>
             </div>
          </div>
      </div>
      <div class="form-group col-lg-3">
          <div class="row row-inner" style="">
             <div class="form-group col-lg-9">
               <label><spring:message code="tax_exempted.label"/></label>
             </div>
             <div class="form-group col-lg-1">
               <label><c:out value="${empty xReportResponseObj.taxExempted ? 0.0 : xReportResponseObj.taxExempted}" /></label>
             </div>
          </div>
         
      </div>
      <div class="form-group col-lg-3">
         <div class="row row-inner" style="">
             <div class="form-group col-lg-9">
               <label><spring:message code="deposit_foredited.label"/></label>
             </div>
             <div class="form-group col-lg-1">
               <label><c:out value="${empty xReportResponseObj.depositForefeited ? 0.0 : xReportResponseObj.depositForefeited}" /></label>
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
               <label><c:out value="${empty xReportResponseObj.overalDiscount ? 0.0 : xReportResponseObj.overalDiscount}" /></label>
             </div>
          </div>
      </div>
      <div class="form-group col-lg-3">
         <div class="row row-inner" style="">
             <div class="form-group col-lg-9">
               <label><spring:message code="service_charge.label"/></label>
             </div>
             <div class="form-group col-lg-1">
               <label><c:out value="${empty xReportResponseObj.serviceCharge ? 0.0 : xReportResponseObj.serviceCharge}" /></label>
             </div>
          </div>
      </div>
      <div class="form-group col-lg-3">
          <div class="row row-inner" style="">
             <div class="form-group col-lg-9">
               <label><spring:message code="total_sales_collection.label"/></label>
             </div>
             <div class="form-group col-lg-1">
               <label><c:out value="${empty xReportResponseObj.totalSalesCollection ? 0.0 : xReportResponseObj.totalSalesCollection}" /></label>
             </div>
          </div>
      </div>
      <div class="form-group col-lg-3">
         <div class="row row-inner" style="">
             <div class="form-group col-lg-9">
               <label><spring:message code="deposit_utilized.label"/></label>
             </div>
             <div class="form-group col-lg-1">
               <label><c:out value="${empty xReportResponseObj.depositesUtilized ? 0.0 : xReportResponseObj.depositesUtilized}" /></label>
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
               <label><c:out value="${empty xReportResponseObj.netSalesInclusiveTax ? 0.0 : xReportResponseObj.netSalesInclusiveTax}" /></label>
             </div>
          </div>
      </div>
      <div class="form-group col-lg-3">
          <div class="row row-inner" style="">
             <div class="form-group col-lg-9">
               <label><spring:message code="other_charge.label"/></label>
             </div>
             <div class="form-group col-lg-1">
               <label><c:out value="${empty xReportResponseObj.otherCharge ? 0.0 : xReportResponseObj.otherCharge}" /></label>
             </div>
          </div>
      </div>
      <div class="form-group col-lg-3">
         <div class="row row-inner" style="">
             <div class="form-group col-lg-9">
               <label><spring:message code="deposit_collected.label"/></label>
             </div>
             <div class="form-group col-lg-1">
               <label><c:out value="${empty xReportResponseObj.depositCollected ? 0.0 : xReportResponseObj.depositCollected}" /></label>
             </div>
          </div>
      </div>
      <div class="form-group col-lg-3">
         <div class="row row-inner" style="">
             <div class="form-group col-lg-9">
               <label><spring:message code="total_amount_collected.label"/></label>
             </div>
             <div class="form-group col-lg-1">
               <label><c:out value="${empty xReportResponseObj.totalAmmountCollected ? 0.0 : xReportResponseObj.totalAmmountCollected}" /></label>
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
               <label><c:out value="${empty xReportResponseObj.salesReports ? 0.0 : xReportResponseObj.salesReports}" /></label>
             </div>
          </div>
      </div>
      <div class="form-group col-lg-3">
          <div class="row row-inner" style="">
             <div class="form-group col-lg-9">
               <label><spring:message code="traning_receipts.label"/></label>
             </div>
             <div class="form-group col-lg-1">
               <label><c:out value="${empty xReportResponseObj.trainingReceipts ? 0.0 : xReportResponseObj.trainingReceipts}" /></label>
             </div>
          </div>
      </div>
      <div class="form-group col-lg-3">
         <div class="row row-inner" style="margin-top:-20px !important;">
             <div class="form-group col-lg-9">
               <label><spring:message code="manual_receipts.label"/></label>
             </div>
             <div class="form-group col-lg-1">
               <label><c:out value="${empty xReportResponseObj.manualReceipts ? 0.0 : xReportResponseObj.manualReceipts}" /></label>
             </div>
          </div>
      </div>
      <div class="form-group col-lg-3">
         <div class="row row-inner" style="">
             <div class="form-group col-lg-9">
               <label><spring:message code="deposit_receipts.label"/></label>
             </div>
             <div class="form-group col-lg-1">
               <label><c:out value="${empty xReportResponseObj.depositeReceipts ? 0.0 : xReportResponseObj.depositeReceipts}" /></label>
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
               <label><c:out value="${empty xReportResponseObj.noOfItemsSold ? 0.0 : xReportResponseObj.noOfItemsSold}" /></label>
             </div>
          </div>
      </div>
      <div class="form-group col-lg-3">
         <div class="row row-inner" style="">
             <div class="form-group col-lg-9">
               <label><spring:message code="discountitems.label"/></label>
             </div>
             <div class="form-group col-lg-1">
               <label><c:out value="${empty xReportResponseObj.noOfDiscountedItems ? 0.0 : xReportResponseObj.noOfDiscountedItems}" /></label>
             </div>
          </div>
      </div>
      <div class="form-group col-lg-3">
         <div class="row row-inner" style="">
             <div class="form-group col-lg-9">
               <label><spring:message code="no_of_food_coupons.label"/></label>
             </div>
             <div class="form-group col-lg-1">
               <label><c:out value="${empty xReportResponseObj.foodCouponsTotal ? 0.0 : xReportResponseObj.foodCouponsTotal}" /></label>
             </div>
          </div>
      </div>
      <div class="form-group col-lg-3">
          <div class="row row-inner" style="">
             <div class="form-group col-lg-9">
               <label><spring:message code="no_of_price_overrides.label"/></label>
             </div>
             <div class="form-group col-lg-1">
               <label><c:out value="${empty xReportResponseObj.noOfPriceOverrides ? 0.0 : xReportResponseObj.noOfPriceOverrides}" /></label>
             </div>
          </div>
      </div>
      <div class="form-group col-lg-3">
         <div class="row row-inner" style="">
             <div class="form-group col-lg-9">
               <label><spring:message code="no_of_deposit_refunded.label"/></label>
             </div>
             <div class="form-group col-lg-1">
               <label><c:out value="${empty xReportResponseObj.noOfDepositRefunded ? 0.0 : xReportResponseObj.noOfDepositRefunded}" /></label>
             </div>
          </div>
      </div>
 
      <div class="form-group col-lg-3">
         <div class="row row-inner" style="">
             <div class="form-group col-lg-9">
               <label><spring:message code="no_of_void_items.label"/></label>
             </div>
             <div class="form-group col-lg-1">
               <label><c:out value="${empty xReportResponseObj.noOfVoidItems ? 0.0 : xReportResponseObj.noOfVoidItems}" /></label>
             </div>
          </div>
      </div>
      <div class="form-group col-lg-3">
         <div class="row row-inner" style="">
             <div class="form-group col-lg-9">
               <label><spring:message code="no_of_loyalty_points.label"/></label>
             </div>
             <div class="form-group col-lg-1">
               <label><c:out value="${empty xReportResponseObj.loyaltyPointsTotal ? 0.0 : xReportResponseObj.loyaltyPointsTotal}" /></label>
             </div>
          </div>
      </div>
      <div class="form-group col-lg-3">
          <div class="row row-inner" style="">
             <div class="form-group col-lg-9">
               <label><spring:message code="no_of_customer.label"/></label>
             </div>
             <div class="form-group col-lg-1">
               <label><c:out value="${empty xReportResponseObj.noOfCustomers ? 0.0 : xReportResponseObj.noOfCustomers}" /></label>
             </div>
          </div>
      </div>
      <div class="form-group col-lg-3">
         <div class="row row-inner" style="">
             <div class="form-group col-lg-9">
               <label><spring:message code="no_of_deposit_foredited.label"/></label>
             </div>
             <div class="form-group col-lg-1">
               <label><c:out value="${empty xReportResponseObj.depositForefeited ? 0.0 : xReportResponseObj.depositForefeited}" /></label>
             </div>
          </div>
      </div>
   
      <div class="form-group col-lg-3">
          <div class="row row-inner" style="">
             <div class="form-group col-lg-9">
               <label><spring:message code="no_of_sales_done.label"/></label>
             </div>
             <div class="form-group col-lg-1">
               <label><c:out value="${empty xReportResponseObj.noOfNoSaleDone ? 0.0 : xReportResponseObj.noOfNoSaleDone}" /></label>
             </div>
          </div>
      </div>
      <div class="form-group col-lg-3">
         <div class="row row-inner" style="">
             <div class="form-group col-lg-9">
               <label><spring:message code="no_of_line_discounts.label"/></label>
             </div>
             <div class="form-group col-lg-1">
               <label><c:out value="${empty xReportResponseObj.noOfLineDiscounts ? 0.0 : xReportResponseObj.noOfLineDiscounts}" /></label>
             </div>
          </div>
      </div>
      <div class="form-group col-lg-3">
          <div class="row row-inner" style="">
             <div class="form-group col-lg-9">
               <label><spring:message code="no_of_deposit_collected.label"/></label>
             </div>
             <div class="form-group col-lg-1">
               <label><c:out value="${empty xReportResponseObj.noOfDepositCollected ? 0.0 : xReportResponseObj.noOfDepositCollected}" /></label>
             </div>
          </div>
      </div>
      <div class="form-group col-lg-3">
         <div class="row row-inner" style="">
             <div class="form-group col-lg-9">
               <label><spring:message code="no_of_deposit_utilized.label"/></label>
             </div>
             <div class="form-group col-lg-1">
               <label><c:out value="${empty xReportResponseObj.noOfDepositesUtilized ? 0.0 : xReportResponseObj.noOfDepositesUtilized}" /></label>
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
      <div class="form-group col-lg-3">
          <div class="row row-inner" style="">
             <div class="form-group col-lg-9">
               <label><spring:message code="card_total.label"/></label>
             </div>
             <div class="form-group col-lg-1">
               <label><c:out value="${empty xReportResponseObj.cardTotal ? 0.0 : xReportResponseObj.cardTotal}" /></label>
             </div>
          </div>
      </div>
      <div class="form-group col-lg-3">
         <div class="row row-inner" style="">
            <div class="form-group col-lg-9">
               <label><spring:message code="cancellation.label"/></label>
             </div>
             <div class="form-group col-lg-1">
               <label><c:out value="${empty xReportResponseObj.cancellation ? 0.0 : xReportResponseObj.cancellation}" /></label>
             </div>
          </div>
      </div>
      <div class="form-group col-lg-3">
          <div class="row row-inner" style="">
             <div class="form-group col-lg-9">
               <label><spring:message code="open_balance.label"/></label>
             </div>
             <div class="form-group col-lg-1">
               <label><c:out value="${empty xReportResponseObj.openBalance ? 0.0 : xReportResponseObj.openBalance}" /></label>
             </div>
          </div>
      </div>
      <div class="form-group col-lg-3">
         <div class="row row-inner" style="">
             <div class="form-group col-lg-9">
               <label><spring:message code="system_sales.label"/></label>
             </div>
             <div class="form-group col-lg-1">
               <label><c:out value="${empty xReportResponseObj.systemSales ? 0.0 : xReportResponseObj.systemSales}" /></label>
             </div>
          </div>
      </div>
    </div>
    
    
    <div class="row">
      <div class="form-group col-lg-3">
          <div class="row row-inner" style="">
             <div class="form-group col-lg-9">
               <label><spring:message code="cash_total.label"/></label>
             </div>
             <div class="form-group col-lg-1">
               <label><c:out value="${empty xReportResponseObj.cashTotal ? 0.0 : xReportResponseObj.cashTotal}" /></label>
             </div>
          </div>
      </div>
      <div class="form-group col-lg-3">
         <div class="row row-inner" style="">
             <div class="form-group col-lg-9">
               <label><spring:message code="refund_exchange.label"/></label>
             </div>
             <div class="form-group col-lg-1">
               <label><c:out value="${empty xReportResponseObj.refundExchange ? 0.0 : xReportResponseObj.refundExchange}" /></label>
             </div>
          </div>
      </div>
      <div class="form-group col-lg-3">
          <div class="row row-inner" style="">
             <div class="form-group col-lg-9">
               <label><spring:message code="loyalty_points_total.label"/></label>
             </div>
             <div class="form-group col-lg-1">
               <label><c:out value="${empty xReportResponseObj.loyaltyPointsTotal ? 0.0 : xReportResponseObj.loyaltyPointsTotal}" /></label>
             </div>
          </div>
      </div>
      <div class="form-group col-lg-3">
         <div class="row row-inner" style="">
             <div class="form-group col-lg-9">
               <label><spring:message code="total_inwards.label"/></label>
             </div>
             <div class="form-group col-lg-1">
               <label><c:out value="${empty xReportResponseObj.totalInwords? 0.0 : xReportResponseObj.totalInwords}" /></label>
             </div>
          </div>
      </div>
    </div>
    
    
    <div class="row">
      <div class="form-group col-lg-3">
          <div class="row row-inner" style="">
             <div class="form-group col-lg-9">
               <label><spring:message code="food_coupons_transactions.label"/></label>
             </div>
             <div class="form-group col-lg-1">
               <label><c:out value="${empty xReportResponseObj.foodCouponsTransactions ? 0.0 : xReportResponseObj.foodCouponsTransactions}" /></label>
             </div>
          </div>
      </div>
      <div class="form-group col-lg-3">
         <div class="row row-inner" style="">
              <div class="form-group col-lg-9">
               <label><spring:message code="loyalty_points_transactions.label"/></label>
             </div>
             <div class="form-group col-lg-1">
               <label><c:out value="${empty xReportResponseObj.loyaltyPointsTransactions ? 0.0 : xReportResponseObj.loyaltyPointsTransactions}" /></label>
             </div>
          </div>
      </div>
      <div class="form-group col-lg-3">
          <div class="row row-inner" style="">
              <div class="form-group col-lg-9">
               <label><spring:message code="food_coupons_total.label"/></label>
             </div>
             <div class="form-group col-lg-1">
               <label><c:out value="${empty xReportResponseObj.foodCouponsTotal ? 0.0 : xReportResponseObj.foodCouponsTotal}" /></label>
             </div>
          </div>
      </div>
      <div class="form-group col-lg-3">
         <div class="row row-inner" style="">
             <div class="form-group col-lg-9">
               <label><spring:message code="total_outwards.label"/></label>
             </div>
             <div class="form-group col-lg-1">
               <label><c:out value="${empty xReportResponseObj.totalOutwords? 0.0 : xReportResponseObj.totalOutwords}" /></label>
             </div>
          </div>
      </div>
       <div class="form-group col-lg-3">
         <div class="row row-inner" style="">
             <div class="form-group col-lg-9">
               <label><spring:message code="creditnote.label"/></label>
             </div>
             <div class="form-group col-lg-1">
               <label><c:out value="${empty xReportResponseObj.totalCreditNoteAmt? 0.0 : xReportResponseObj.totalCreditNoteAmt}" /></label>
             </div>
          </div>
      </div>
        <div class="form-group col-lg-3">
         <div class="row row-inner" style="">
             <div class="form-group col-lg-9">
               <label><spring:message code="sodexo.amount.label"/></label>
             </div>
             <div class="form-group col-lg-1">
               <label><c:out value="${empty xReportResponseObj.sodexoTotal? 0.0 : xReportResponseObj.sodexoTotal}" /></label>
             </div>
          </div>
      </div>
         <div class="form-group col-lg-3">
         <div class="row row-inner" style="">
             <div class="form-group col-lg-9">
               <label><spring:message code="giftvouchers.label"/></label>
             </div>
             <div class="form-group col-lg-1">
               <label><c:out value="${empty xReportResponseObj.giftVouchers? 0.0 : xReportResponseObj.giftVouchers}" /></label>
             </div>
          </div>
      </div>
       <div class="form-group col-lg-3">
         <div class="row row-inner" style="">
             <div class="form-group col-lg-9">
               <label><spring:message code="giftCoupons.label"/></label>
             </div>
             <div class="form-group col-lg-1">
               <label><c:out value="${empty xReportResponseObj.coupons? 0.0 : xReportResponseObj.coupons}" /></label>
             </div>
          </div>
      </div>
      <div class="form-group col-lg-3">
         <div class="row row-inner" style="">
             <div class="form-group col-lg-9">
               <label><spring:message code="ticket.amount.label"/></label>
             </div>
             <div class="form-group col-lg-1">
               <label><c:out value="${empty xReportResponseObj.ticketTotal? 0.0 : xReportResponseObj.ticketTotal}" /></label>
             </div>
          </div>
      </div>
        <div class="form-group col-lg-3">
         <div class="row row-inner" style="">
             <div class="form-group col-lg-9">
               <label><spring:message code="credits.amount.label"/></label>
             </div>
             <div class="form-group col-lg-1">
               <label><c:out value="${empty xReportResponseObj.totalCreditsAmt? 0.0 : xReportResponseObj.totalCreditsAmt}" /></label>
             </div>
          </div>
      </div>
    </div>
    
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
                          <a data-toggle="collapse" data-parent="#accordion" href="#collapseOne" onclick="changeImage();">
                          <spring:message code="TAXES.label"/></a>
                        </h4>
                        <!-- <div class="box-tools pull-right">
                          <a data-toggle="collapse" data-parent="#accordion" href="#collapseOne" onclick="changeImage();">
                          <i class="fa fa-plus"></i></a>
                        </div> -->
                      </div>
                      <div id="collapseOne" class="panel-collapse collapse in">
                        <div class="box-body">
                          <div class="row">
                             <div class="form-group col-lg-2"></div>
                             <div class="form-group col-lg-8">
                               <table id="taxes" class="table table-bordered table-striped">
                                    <thead style="background-color: #3c8dbc; color: #ffffff">
                                            <tr>
                                            	<th><spring:message code="tax_code.label" /></th>
                                                <th><spring:message code="tax_percentage.label" /></th>
                                                <th><spring:message code="tax_amount.label" /></th>
                                            </tr>
                                        </thead>
                                        <tbody style="text-align: center;">
                                        
                                         <c:forEach var="taxInfo" items="${xReportResponseObj.taxesInfo}">
                                            <tr>
                                            	<td><c:out value="${empty taxInfo.taxCode? 0 : taxInfo.taxCode}" /></td>
                                                <td><c:out value="${empty taxInfo.percentage? 0.0 : taxInfo.percentage}" /></td>
                                                <td><c:out value="${empty taxInfo.amount? 0.0 : taxInfo.amount}" /></td> 
                							</tr>
                                            </c:forEach>
                                        </tbody>
                                    </table>
                             </div>
                             <div class="form-group col-lg-2"></div>
                          </div>
                          
                          
                        </div>
                      </div>
              <br><br>
                      <div class="box-header with-border">
                        <h4 class="box-title">
                          <a data-toggle="collapse" data-parent="#accordion" href="#collapseTwo"><spring:message code="DENOMINATIONS.label"/></a>
                        </h4>
                      </div>
                      <div id="collapseTwo" class="panel-collapse collapse in">
                        <div class="box-body">
                          <div class="row">
                             <div class="form-group col-lg-2"></div>
                             <div class="form-group col-lg-8">
                               <table id="denominations" class="table table-bordered table-striped">
                                    <thead style="background-color: #3c8dbc; color: #ffffff">
                                            <tr>
                                            	<th><spring:message code="currency_code.label" /></th>
                                                <th><spring:message code="currency_name.label" /></th>
                                                <th><spring:message code="denomination.label" /></th>
                                                <th><spring:message code="collection.label" /></th>
                                                <th><spring:message code="denomination_amount.label" /></th>
                                            </tr>
                                        </thead>
                                        <tbody style="text-align: center;">
                                        
                                         <c:forEach var="denominationInfo" items="${xReportResponseObj.denominations}">
                                            <tr>
                                            	<td><c:out value="${empty denominationInfo.currCode? 0 : denominationInfo.currCode}" /></td>
                                                <td><c:out value="${empty denominationInfo.currencyName? 0.0 : denominationInfo.currencyName}" /></td>
                                                <td><c:out value="${empty denominationInfo.denomination? 0.0 : denominationInfo.denomination}" /></td> 
                                                <td><c:out value="${empty denominationInfo.collection? 0.0 : denominationInfo.collection}" /></td> 
                                                <td><c:out value="${empty denominationInfo.amount? 0.0 : denominationInfo.amount}" /></td> 
                							</tr>
                                            </c:forEach>
                                        </tbody>
                                    </table>
                             </div>
                             <div class="form-group col-lg-2"></div>
                          </div>
                        </div>
                      </div>
                      <br><br>
                      
                      <!--Cash Handover Denominations  -->
                      <div class="box-header with-border">
                        <h4 class="box-title">
                          <a data-toggle="collapse" data-parent="#accordion" href="#collapseThree"><spring:message code="cash.hand.over.denomination.label"/></a>
                        </h4>
                      </div>
                      <div id="collapseThree" class="panel-collapse collapse in">
                        <div class="box-body">
                          <div class="row">
                             <div class="form-group col-lg-2"></div>
                             <div class="form-group col-lg-8">
                               <table id="CashHandoverdenominations" class="table table-bordered table-striped">
                                    <thead style="background-color: #3c8dbc; color: #ffffff">
                                            <tr>
                                            	<th><spring:message code="s.No.Label" /></th>
                                                <th><spring:message code="denomination.cash.label" /></th>
                                                <th><spring:message code="denomination.value" /></th>
                                                <th><spring:message code="denomination.count" /></th>
                                                <th><spring:message code="denomination_amount.label" /></th>
                                            </tr>
                                        </thead>
                                        <tbody style="text-align: center;">
                                       <c:set var="TotalCount" value = "0"> </c:set>
                                         <c:forEach var="denominationHand" items="${xReportResponseObj.cashHandOverDenominations}" varStatus="TheCount">
                                            <tr id="dynamicdiv${TheCount.count}">
                                            	<td class="slno" id="denominationSno${TheCount.count}"><c:out value="${TheCount.count}" /></td>
                                                <td><c:out value="${empty denominationHand.cashDenomination? 0.0 : denominationHand.cashDenomination}" /></td>
                                                <td id="denominationVal${TheCount.count}"><c:out value="${empty denominationHand.cashDenomination? 0.0 : denominationHand.cashDenomination}" /></td> 
                                                <%-- <td><c:out value="${empty denominationHand.denominationCount? 0.0 : denominationHand.denominationCount}" /></td> --%>
                                                <td><input type="text" style="text-align: center;" id="denominationCount${TheCount.count}" value="${empty denominationHand.denominationCount? 0.0 : denominationHand.denominationCount}" onchange="ChangeDenominations(${TheCount.count})" oninput="this.value = this.value.replace(/[^0-9]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');"></td> 
                                                <td id="denominationAmt${TheCount.count}"><c:out value="${empty denominationHand.paidAmount? 0.0 : denominationHand.paidAmount}" /></td> 
                								<c:set var="TotalCount" value = "${ TotalCount + denominationHand.paidAmount}"></c:set>
                								<input type="hidden" id="denominationId${TheCount.count}" value="${denominationHand.reportId}">
                								<c:set var="dateParts" value="${fn:split(denominationHand.reportDate, ' ')}" />
                								<input type="hidden" id="denominationDate${TheCount.count}" value="${dateParts[0]}">
                								<input type="hidden" id="denominationSeriolNo${TheCount.count}" value="${denominationHand.sno}">
                							</tr>
                                        </c:forEach>
                                             <tr style="background: #f9f9f9;font-weight: bold;border: 1px solid lightgray;font-size: 16px;border-top: 3px solid lightgray;">
                                            	<td></td>
                                                <td>Total Cash Declared</td>
                                                <td></td> 
                                                <td></td> 
                                                <td id="TotalCashDeclaredId">${TotalCount}</td> 
                							</tr> 
                                        </tbody>
                                    </table>
                                    
                             </div>
                             <div class="form-group col-lg-2"></div>
                          </div>
                        </div>
                      </div>
                      <br><br>
                      
                      <!--end Cash handover Denominations  -->
                      
       <div class="row">
      <div class="form-group col-lg-12">
      <div id="SuccessDetail" class=" col-lg-12 Error" style="text-align: center;color: blue;font-size: 2;font-weight: bold;margin-bottom: 0px;"></div>
      <div id="FailedDetail" class=" col-lg-12 Error" style="text-align: center;color: red;font-size: 2;font-weight: bold;margin-bottom: 0px;"></div>
      
          <div class="col-lg-12" style="text-align: right;    padding-right: 0px;">
          <input type="button" class="btn bg-olive btn-inline" data-toggle="modal" data-target="#DenominationsModelID"  style="width:90px;font-size: 16px;" value="Update" />						
		   <input type="button" class="btn bg-olive btn-inline" data-toggle="modal" data-target="#myModalIos"  style="width:90px;font-size: 16px;" value="<spring:message code="save.label" />" />
		           <input type="button" class="btn bg-olive btn-inline" onclick="viewOutletXReadingReport('outletXReadingReport','0','${flowLocation}');scrollToTop();" style="width:90px;font-size: 16px;" value="<spring:message code="back.label" />" />
		 
		 </div>
       
       </div>
    </div>
            <input type="hidden" id="flowLocation" value="${flowLocation}">            
                      
                    </div>
                  </div>
     
    
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
          <div class="col-lg-12" style="text-align: right;    padding-right: 0px;">
<%-- 		   <input type="button" class="btn bg-olive btn-inline" data-toggle="modal" data-target="#myModalIos"  style="width:90px;font-size: 16px;" value="<spring:message code="save.label" />" /> --%>
		           <input type="button" class="btn bg-olive btn-inline" onclick="viewOutletXReadingReport('outletXReadingReport','0','${flowLocation}');scrollToTop();" style="width:90px;font-size: 16px;" value="<spring:message code="back.label" />" />
		 
		 </div>
       
       </div>
    </div>
    </c:otherwise>
    </c:choose>
    <input type="hidden" id="stockdownloadurl" value="${downloadurl}">
    <input type="hidden" id="outletLocation" value="${outletLocation}">
    <input type="hidden" id="outletZone" value="${zone}">
    <input type="hidden" id="fromXread" value="${startdate}">
    <input type="hidden" id="toXread" value="${endDate}">
    <input type="hidden" id="maxRecords" value="${maxRecords}">
    
    </section>
     <script src="${pageContext.request.contextPath}/js/plugins/datatables/jquery.dataTables.js" type="text/javascript"></script>
        <script src="${pageContext.request.contextPath}/js/plugins/datatables/dataTables.bootstrap.js" type="text/javascript"></script>
     <script type="text/javascript">
            $(function() {
                 $('#taxes').dataTable({
                    "bPaginate": true,
                    "bLengthChange": false,
                    "bFilter": false,
                    "bSort": true,
                    "bInfo": true,
                    "bAutoWidth": false
                });
                 $('#denominations').dataTable({
                     "bPaginate": true,
                     "bLengthChange": false,
                     "bFilter": false,
                     "bSort": true,
                     "bInfo": true,
                     "bAutoWidth": false
                 });
                 $('#voidItems').dataTable({
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