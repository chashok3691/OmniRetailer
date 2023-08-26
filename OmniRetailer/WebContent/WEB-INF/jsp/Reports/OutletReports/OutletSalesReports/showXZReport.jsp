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
    <c:choose>
    <c:when test="${not empty xzReportResponseObj}">
    <div class="row">
      <div class="form-group col-lg-12">
         <div class="form-group col-lg-2" style="padding-left: 1px;padding-right: 1px;margin-top: 8px;cursor: pointer;margin-bottom: 0px;"><span style="font-weight: bold;font-size: 16px;color:#666;cursor: pointer;"><spring:message code="SALES.label"/></span></div>
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
               <label><c:out value="${empty xzReportResponseObj.sales ? 0.0 : xzReportResponseObj.sales}" /></label>
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
               <label><c:out value="${empty xzReportResponseObj.netSalesExclusiveTax ? 0.0 : xzReportResponseObj.netSalesExclusiveTax}" /></label>
             </div>
          </div>
      </div>
      <div class="form-group col-lg-3">
         <div class="row row-inner" style="">
             <div class="form-group col-lg-9">
               <label><spring:message code="tax.label"/></label>
             </div>
             <div class="form-group col-lg-1">
               <label><c:out value="${empty xzReportResponseObj.tax ? 0.0 : xzReportResponseObj.tax}" /></label>
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
               <label><c:out value="${empty xzReportResponseObj.depositRefunded ? 0.0 : xzReportResponseObj.depositRefunded}" /></label>
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
               <label><c:out value="${empty xzReportResponseObj.itemDiscount ? 0.0 : xzReportResponseObj.itemDiscount}" /></label>
             </div>
          </div>
      </div>
      <div class="form-group col-lg-3">
         <div class="row row-inner" style="">
             <div class="form-group col-lg-9">
               <label><spring:message code="cess.label"/></label>
             </div>
             <div class="form-group col-lg-1">
               <label><c:out value="${empty xzReportResponseObj.cess ? 0.0 : xzReportResponseObj.cess}" /></label>
             </div>
          </div>
      </div>
      <div class="form-group col-lg-3">
          <div class="row row-inner" style="">
             <div class="form-group col-lg-9">
               <label><spring:message code="tax_exempted.label"/></label>
             </div>
             <div class="form-group col-lg-1">
               <label><c:out value="${empty xzReportResponseObj.taxExempted ? 0.0 : xzReportResponseObj.taxExempted}" /></label>
             </div>
          </div>
         
      </div>
      <div class="form-group col-lg-3">
         <div class="row row-inner" style="">
             <div class="form-group col-lg-9">
               <label><spring:message code="deposit_foredited.label"/></label>
             </div>
             <div class="form-group col-lg-1">
               <label><c:out value="${empty xzReportResponseObj.depositForefeited ? 0.0 : xzReportResponseObj.depositForefeited}" /></label>
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
               <label><c:out value="${empty xzReportResponseObj.overalDiscount ? 0.0 : xzReportResponseObj.overalDiscount}" /></label>
             </div>
          </div>
      </div>
      <div class="form-group col-lg-3">
         <div class="row row-inner" style="">
             <div class="form-group col-lg-9">
               <label><spring:message code="service_charge.label"/></label>
             </div>
             <div class="form-group col-lg-1">
               <label><c:out value="${empty xzReportResponseObj.serviceCharge ? 0.0 : xzReportResponseObj.serviceCharge}" /></label>
             </div>
          </div>
      </div>
      <div class="form-group col-lg-3">
          <div class="row row-inner" style="">
             <div class="form-group col-lg-9">
               <label><spring:message code="total_sales_collection.label"/></label>
             </div>
             <div class="form-group col-lg-1">
               <label><c:out value="${empty xzReportResponseObj.totalSalesCollection ? 0.0 : xzReportResponseObj.totalSalesCollection}" /></label>
             </div>
          </div>
      </div>
      <div class="form-group col-lg-3">
         <div class="row row-inner" style="">
             <div class="form-group col-lg-9">
               <label><spring:message code="deposit_utilized.label"/></label>
             </div>
             <div class="form-group col-lg-1">
               <label><c:out value="${empty xzReportResponseObj.depositesUtilized ? 0.0 : xzReportResponseObj.depositesUtilized}" /></label>
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
               <label><c:out value="${empty xzReportResponseObj.netSalesInclusiveTax ? 0.0 : xzReportResponseObj.netSalesInclusiveTax}" /></label>
             </div>
          </div>
      </div>
      <div class="form-group col-lg-3">
          <div class="row row-inner" style="">
             <div class="form-group col-lg-9">
               <label><spring:message code="other_charge.label"/></label>
             </div>
             <div class="form-group col-lg-1">
               <label><c:out value="${empty xzReportResponseObj.otherCharge ? 0.0 : xzReportResponseObj.otherCharge}" /></label>
             </div>
          </div>
      </div>
      <div class="form-group col-lg-3">
         <div class="row row-inner" style="">
             <div class="form-group col-lg-9">
               <label><spring:message code="deposit_collected.label"/></label>
             </div>
             <div class="form-group col-lg-1">
               <label><c:out value="${empty xzReportResponseObj.depositCollected ? 0.0 : xzReportResponseObj.depositCollected}" /></label>
             </div>
          </div>
      </div>
      <div class="form-group col-lg-3">
         <div class="row row-inner" style="">
             <div class="form-group col-lg-9">
               <label><spring:message code="total_amount_collected.label"/></label>
             </div>
             <div class="form-group col-lg-1">
               <label><c:out value="${empty xzReportResponseObj.totalAmmountCollected ? 0.0 : xzReportResponseObj.totalAmmountCollected}" /></label>
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
               <label><c:out value="${empty xzReportResponseObj.salesReports ? 0.0 : xzReportResponseObj.salesReports}" /></label>
             </div>
          </div>
      </div>
      <div class="form-group col-lg-3">
          <div class="row row-inner" style="">
             <div class="form-group col-lg-9">
               <label><spring:message code="traning_receipts.label"/></label>
             </div>
             <div class="form-group col-lg-1">
               <label><c:out value="${empty xzReportResponseObj.trainingReceipts ? 0.0 : xzReportResponseObj.trainingReceipts}" /></label>
             </div>
          </div>
      </div>
      <div class="form-group col-lg-3">
         <div class="row row-inner" style="margin-top:-20px !important;">
             <div class="form-group col-lg-9">
               <label><spring:message code="manual_receipts.label"/></label>
             </div>
             <div class="form-group col-lg-1">
               <label><c:out value="${empty xzReportResponseObj.manualReceipts ? 0.0 : xzReportResponseObj.manualReceipts}" /></label>
             </div>
          </div>
      </div>
      <div class="form-group col-lg-3">
         <div class="row row-inner" style="">
             <div class="form-group col-lg-9">
               <label><spring:message code="deposit_receipts.label"/></label>
             </div>
             <div class="form-group col-lg-1">
               <label><c:out value="${empty xzReportResponseObj.depositeReceipts ? 0.0 : xzReportResponseObj.depositeReceipts}" /></label>
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
    
    
    
    
     <div class="row" style="">
      <div class="form-group col-lg-3">
         <div class="row row-inner" style="">
             <div class="form-group col-lg-9">
               <label><spring:message code="no_of_items_sold.label"/></label>
             </div>
             <div class="form-group col-lg-1">
               <label><c:out value="${empty xzReportResponseObj.noOfItemsSold ? 0.0 : xzReportResponseObj.noOfItemsSold}" /></label>
             </div>
          </div>
      </div>
      <div class="form-group col-lg-3">
         <div class="row row-inner" style="">
             <div class="form-group col-lg-9">
               <label><spring:message code="no_of_food_coupons.label"/></label>
             </div>
             <div class="form-group col-lg-1">
               <label><c:out value="${empty xzReportResponseObj.foodCouponsTotal ? 0.0 : xzReportResponseObj.foodCouponsTotal}" /></label>
             </div>
          </div>
      </div>
      <div class="form-group col-lg-3">
          <div class="row row-inner" style="">
             <div class="form-group col-lg-9">
               <label><spring:message code="no_of_price_overrides.label"/></label>
             </div>
             <div class="form-group col-lg-1">
               <label><c:out value="${empty xzReportResponseObj.noOfPriceOverrides ? 0.0 : xzReportResponseObj.noOfPriceOverrides}" /></label>
             </div>
          </div>
      </div>
      <div class="form-group col-lg-3">
         <div class="row row-inner" style="">
             <div class="form-group col-lg-9">
               <label><spring:message code="no_of_deposit_refunded.label"/></label>
             </div>
             <div class="form-group col-lg-1">
               <label><c:out value="${empty xzReportResponseObj.noOfDepositRefunded ? 0.0 : xzReportResponseObj.noOfDepositRefunded}" /></label>
             </div>
          </div>
      </div>
    </div>
    
    
     <div class="row">
      <div class="form-group col-lg-3">
         <div class="row row-inner" style="">
             <div class="form-group col-lg-9">
               <label><spring:message code="no_of_void_items.label"/></label>
             </div>
             <div class="form-group col-lg-1">
               <label><c:out value="${empty xzReportResponseObj.noOfVoidItems ? 0.0 : xzReportResponseObj.noOfVoidItems}" /></label>
             </div>
          </div>
      </div>
      <div class="form-group col-lg-3">
         <div class="row row-inner" style="">
             <div class="form-group col-lg-9">
               <label><spring:message code="no_of_loyalty_points.label"/></label>
             </div>
             <div class="form-group col-lg-1">
               <label><c:out value="${empty xzReportResponseObj.loyaltyPointsTotal ? 0.0 : xzReportResponseObj.loyaltyPointsTotal}" /></label>
             </div>
          </div>
      </div>
      <div class="form-group col-lg-3">
          <div class="row row-inner" style="">
             <div class="form-group col-lg-9">
               <label><spring:message code="no_of_customer.label"/></label>
             </div>
             <div class="form-group col-lg-1">
               <label><c:out value="${empty xzReportResponseObj.noOfCustomers ? 0.0 : xzReportResponseObj.noOfCustomers}" /></label>
             </div>
          </div>
      </div>
      <div class="form-group col-lg-3">
         <div class="row row-inner" style="">
             <div class="form-group col-lg-9">
               <label><spring:message code="no_of_deposit_foredited.label"/></label>
             </div>
             <div class="form-group col-lg-1">
               <label><c:out value="${empty xzReportResponseObj.depositForefeited ? 0.0 : xzReportResponseObj.depositForefeited}" /></label>
             </div>
          </div>
      </div>
    </div>
    
    
    <div class="row">
      <div class="form-group col-lg-3">
          <div class="row row-inner" style="">
             <div class="form-group col-lg-9">
               <label><spring:message code="no_of_sales_done.label"/></label>
             </div>
             <div class="form-group col-lg-1">
               <label><c:out value="${empty xzReportResponseObj.noOfNoSaleDone ? 0.0 : xzReportResponseObj.noOfNoSaleDone}" /></label>
             </div>
          </div>
      </div>
      <div class="form-group col-lg-3">
         <div class="row row-inner" style="">
             <div class="form-group col-lg-9">
               <label><spring:message code="no_of_line_discounts.label"/></label>
             </div>
             <div class="form-group col-lg-1">
               <label><c:out value="${empty xzReportResponseObj.noOfLineDiscounts ? 0.0 : xzReportResponseObj.noOfLineDiscounts}" /></label>
             </div>
          </div>
      </div>
      <div class="form-group col-lg-3">
          <div class="row row-inner" style="">
             <div class="form-group col-lg-9">
               <label><spring:message code="no_of_deposit_collected.label"/></label>
             </div>
             <div class="form-group col-lg-1">
               <label><c:out value="${empty xzReportResponseObj.noOfDepositCollected ? 0.0 : xzReportResponseObj.noOfDepositCollected}" /></label>
             </div>
          </div>
      </div>
      <div class="form-group col-lg-3">
         <div class="row row-inner" style="">
             <div class="form-group col-lg-9">
               <label><spring:message code="no_of_deposit_utilized.label"/></label>
             </div>
             <div class="form-group col-lg-1">
               <label><c:out value="${empty xzReportResponseObj.noOfDepositesUtilized ? 0.0 : xzReportResponseObj.noOfDepositesUtilized}" /></label>
             </div>
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
               <label><c:out value="${empty xzReportResponseObj.cardTotal ? 0.0 : xzReportResponseObj.cardTotal}" /></label>
             </div>
          </div>
      </div>
      <div class="form-group col-lg-3">
         <div class="row row-inner" style="">
            <div class="form-group col-lg-9">
               <label><spring:message code="cancellation.label"/></label>
             </div>
             <div class="form-group col-lg-1">
               <label><c:out value="${empty xzReportResponseObj.cancellation ? 0.0 : xzReportResponseObj.cancellation}" /></label>
             </div>
          </div>
      </div>
      <div class="form-group col-lg-3">
          <div class="row row-inner" style="">
             <div class="form-group col-lg-9">
               <label><spring:message code="open_balance.label"/></label>
             </div>
             <div class="form-group col-lg-1">
               <label><c:out value="${empty xzReportResponseObj.openBalance ? 0.0 : xzReportResponseObj.openBalance}" /></label>
             </div>
          </div>
      </div>
      <div class="form-group col-lg-3">
         <div class="row row-inner" style="">
             <div class="form-group col-lg-9">
               <label><spring:message code="system_sales.label"/></label>
             </div>
             <div class="form-group col-lg-1">
               <label><c:out value="${empty xzReportResponseObj.systemSales ? 0.0 : xzReportResponseObj.systemSales}" /></label>
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
               <label><c:out value="${empty xzReportResponseObj.cashTotal ? 0.0 : xzReportResponseObj.cashTotal}" /></label>
             </div>
          </div>
      </div>
      <div class="form-group col-lg-3">
         <div class="row row-inner" style="">
             <div class="form-group col-lg-9">
               <label><spring:message code="refund_exchange.label"/></label>
             </div>
             <div class="form-group col-lg-1">
               <label><c:out value="${empty xzReportResponseObj.refundExchange ? 0.0 : xzReportResponseObj.refundExchange}" /></label>
             </div>
          </div>
      </div>
      <div class="form-group col-lg-3">
          <div class="row row-inner" style="">
             <div class="form-group col-lg-9">
               <label><spring:message code="loyalty_points_total.label"/></label>
             </div>
             <div class="form-group col-lg-1">
               <label><c:out value="${empty xzReportResponseObj.loyaltyPointsTotal ? 0.0 : xzReportResponseObj.loyaltyPointsTotal}" /></label>
             </div>
          </div>
      </div>
      <div class="form-group col-lg-3">
         <div class="row row-inner" style="">
             <div class="form-group col-lg-9">
               <label><spring:message code="total_inwards.label"/></label>
             </div>
             <div class="form-group col-lg-1">
               <label><c:out value="${empty xzReportResponseObj.totalInwords? 0.0 : xzReportResponseObj.totalInwords}" /></label>
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
               <label><c:out value="${empty xzReportResponseObj.foodCouponsTransactions ? 0.0 : xzReportResponseObj.foodCouponsTransactions}" /></label>
             </div>
          </div>
      </div>
      <div class="form-group col-lg-3">
         <div class="row row-inner" style="">
              <div class="form-group col-lg-9">
               <label><spring:message code="loyalty_points_transactions.label"/></label>
             </div>
             <div class="form-group col-lg-1">
               <label><c:out value="${empty xzReportResponseObj.loyaltyPointsTransactions ? 0.0 : xzReportResponseObj.loyaltyPointsTransactions}" /></label>
             </div>
          </div>
      </div>
      <div class="form-group col-lg-3">
          <div class="row row-inner" style="">
              <div class="form-group col-lg-9">
               <label><spring:message code="food_coupons_total.label"/></label>
             </div>
             <div class="form-group col-lg-1">
               <label><c:out value="${empty xzReportResponseObj.foodCouponsTotal ? 0.0 : xzReportResponseObj.foodCouponsTotal}" /></label>
             </div>
          </div>
      </div>
      <div class="form-group col-lg-3">
         <div class="row row-inner" style="">
             <div class="form-group col-lg-9">
               <label><spring:message code="total_outwards.label"/></label>
             </div>
             <div class="form-group col-lg-1">
               <label><c:out value="${empty xzReportResponseObj.totalOutwords? 0.0 : xzReportResponseObj.totalOutwords}" /></label>
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
                                        
                                         <c:forEach var="taxInfo" items="${xzReportResponseObj.taxesInfo}">
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
                    </div>
                  </div>
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
    </c:otherwise>
    </c:choose>
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
                
               });
        </script>
    </body>
    </html>