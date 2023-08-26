<!--/*
 * Project Name 	        : OmniRetailerCustomer
 * Written By		        : Sahitya
 * file name		        : Inventory Manager/Reports/showoutletSalesReports.jsp
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
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Welcome | Omni Retailer</title>
        <meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>
       
    </head>
<body>
                          <br>
                          <c:if test="${sessionScope.role == 'super admin'}">
                          <div class="row">
                          	<div class="col-lg-2 form-group">
                          	    <div style="text-align: center;width: 120px;height: 120px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="viewOutletXReadingReport('outletXReadingReport','0','${flowLocation}');" title="<spring:message code="xreading.reports.label" />">
                          			<img src="${pageContext.request.contextPath}/images/xreading.png" style="margin-top: 10px;"><br><br>
                          			<span><spring:message code="xreading.reports.label" /></span>
                          		</div>
                          	</div>
                          	<div class="col-lg-2 form-group">
                          	    <div style="text-align: center;width: 120px;height: 120px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="viewOutletZReadingReport('outletZReadingReport','0','${flowLocation}');" title="<spring:message code="zreading.reports.label" />">
                          			<img src="${pageContext.request.contextPath}/images/zreading.png" style="margin-top: 10px;"><br><br>
                          			<span><spring:message code="zreading.reports.label" /></span>
                          		</div>
                          	</div>
                          	 <div class="col-lg-2 form-group">
                          	    <div style="text-align: center;width: 120px;height: 120px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="viewXZReading('outletXZReadingReport');" title="<spring:message code="xzreading.reports.label" />">
                          			<img src="${pageContext.request.contextPath}/images/xzreading.png" style="margin-top: 10px;"><br><br>
                          			<span><spring:message code="xzreading.reports.label" /></span>
                          		</div>
                          	</div>
                          	<div class="col-lg-2 form-group">
                          	    <div style="text-align: center;width: 120px;height: 120px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="viewSalesReportsCriteriaWise('salesReportDateWise','date','${flowLocation}');" title="<spring:message code="date.wise.sales.label" />">
                          			<img src="${pageContext.request.contextPath}/images/DateWiseReport.png" style="margin-top: 10px;"><br><br>
                          			<span><spring:message code="date.wise.sales.label" /></span>
                          		</div>
                          	</div>
                          	<div class="col-lg-2 form-group">
                          	    <div style="text-align: center;width: 120px;height: 120px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="viewSalesReportsCriteriaWise('salesReportCounterWise','counter','${flowLocation}');" title="<spring:message code="counter.wise.label" />">
                          			<img src="${pageContext.request.contextPath}/images/CounterWiseReport.png" style="margin-top: 10px;"><br><br>
                          			<span><spring:message code="counter.wise.label" /></span>
                          		</div>
                          	</div>
                          
                          	</div>
                          	
                          	<div class="row">
                          	<div class="col-lg-2 form-group">
                          	    <div style="text-align: center;width: 120px;height: 120px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="viewSalesReportsCriteriaWise('salesReportCategoryWise','category','${flowLocation}');" title="<spring:message code="category.wise.label" />">
                          			<img src="${pageContext.request.contextPath}/images/CategoryWiseReport.png" style="margin-top: 10px;"><br><br>
                          			<span><spring:message code="category.wise.label" /></span>
                          		</div>
                          	</div>
                          	   <div class="col-lg-2 form-group">
                          	    <div style="text-align: center;width: 120px;height: 120px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="viewSalesReportsCriteriaWise('salesReportDepartmentWise','Department','${flowLocation}');" title="<spring:message code="department.wise" />">
                          			<img src="${pageContext.request.contextPath}/images/Departments.png" style="margin-top: 10px;"><br><br>
                          			<span><spring:message code="department.wise" /></span>
                          		</div>
                          	</div>

  								<div class="col-lg-2 form-group">
                          	    <div style="text-align: center;width: 120px;height: 120px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="viewSalesReportsCriteriaWise('salesReportSkuWise','skuSales','${flowLocation}');" title="<spring:message code="sku.wise.label" />">
                          			<img src="${pageContext.request.contextPath}/images/SkuMaster.png" style="margin-top: 10px;"><br><br>
                          			<span><spring:message code="sku.wise.label" /></span>
                          		</div>
                          	</div>

								<div class="col-lg-2 form-group">
                          	    <div style="text-align: center;width: 120px;height: 120px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="viewSalesReportsCriteriaWise('salesReportBrandWise','Brand','${flowLocation}');" title="<spring:message code="brandwise.reports.label" />">
                          			<img src="${pageContext.request.contextPath}/images/BrandMaster.png" style="margin-top: 10px;"><br><br>
                          			<span><spring:message code="brandwise.reports.label" /></span>
                          		</div>
                          	</div>
 							<div class="col-lg-2 form-group">
                          	    <div style="text-align: center;width: 120px;height: 120px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="viewSalesReportsCriteriaWise('salesReportSectionWise','Section','${flowLocation}');" title="<spring:message code="sectionwise.reports.label" />">
                          			<img src="${pageContext.request.contextPath}/images/SubCategoryMater.png" style="margin-top: 10px;"><br><br>
                          			<span><spring:message code="sectionwise.reports.label" /></span>
                          		</div>
                          	</div>
                          	
                          	</div>
                          	
                          	
                          	 	<div class="row">
                          	<div class="col-lg-2 form-group">
                          	    <div style="text-align: center;width: 120px;height: 120px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="viewSalesReportsCriteriaWise('salesReportSupplierWise','supplier','${flowLocation}');" title="<spring:message code="supplier.wise.label" />">
                          			<img src="${pageContext.request.contextPath}/images/SupplierWiseReport.png" style="margin-top: 10px;"><br><br>
                          			<span><spring:message code="supplier.wise.label" /></span>
                          		</div>
                          	</div>
                          	 <div class="col-lg-2 form-group">
                          	    <div style="text-align: center;width: 120px;height: 120px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="viewSalesReportsCriteriaWise('salesReportTaxWise','tax','${flowLocation}');" title="<spring:message code="tax.label" />">
                          			<img src="${pageContext.request.contextPath}/images/TaxReport.png" style="margin-top: 10px;"><br><br>
                          			<span><spring:message code="tax.label" /></span>
                          		</div>
                          	</div>
                          	<div class="col-lg-2 form-group">
                          	    <div style="text-align: center;width: 120px;height: 120px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="viewSalesReportsCriteriaWise('dueCollection','duecollection','${flowLocation}');" title="<spring:message code="due.collection.label" />">
                          			<img src="${pageContext.request.contextPath}/images/DueCollectionReport.png" style="margin-top: 10px;"><br><br>
                          			<span><spring:message code="due.collection.label" /></span>
                          		</div>
                          	</div>
                          	<div class="col-lg-2 form-group">
                          	    <div style="text-align: center;width: 120px;height: 120px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="viewSalesReportsCriteriaWise('creditsales','creditsales','${flowLocation}');" title="<spring:message code="credit.sales.label" />">
                          			<img src="${pageContext.request.contextPath}/images/CreditSalesReport.png" style="margin-top: 10px;"><br><br>
                          			<span><spring:message code="credit.sales.label" /></span>
                          		</div>
                          	</div>
                          	
                          	  <div class="col-lg-2 form-group">
                          	    <div style="text-align: center;width: 120px;height: 120px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="viewSalesHourWiseBillReport('salesReporthourWisebillwarehouse','0','','warehouse')" title="Hour-wise Bill Report">
                          			<img src="${pageContext.request.contextPath}/images/imagentavl.png" style="margin-top: -30px; padding: 34px 12px 0px 59px; margin-left: -33%;"><br><br>
                          			<span>Hour-wise Bill Report</span>
                          		</div>
                          	</div>
                          	
                          	 <div class="col-lg-2 form-group">
                          	    <div style="text-align: center;width: 120px;height: 120px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="viewSalesPriceVariationReport('salesReportPriceVariationwarehouse','0','','warehouse');" title="Sales Price Variation">
                          			<img src="${pageContext.request.contextPath}/images/imagentavl.png" style="margin-top: -30px; padding: 34px 12px 0px 59px; margin-left: -33%;"><br><br>
                          			<span>Sales Price Variation</span>
                          		</div>
                          	</div>
                          	
                          	 <div class="col-lg-2 form-group">
                          	    <div style="text-align: center;width: 120px;height: 120px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="viewOutletsuppliereport('salesReportSupplierSaleswarehouse','0','','warehouse');" title="Sales Vs Procurment">
                          			<img src="${pageContext.request.contextPath}/images/imagentavl.png" style="margin-top: -30px; padding: 34px 12px 0px 59px; margin-left: -33%;"><br><br>
                          			<span>Sales Vs Procurment</span>
                          		</div>
                          	</div>
                          	
                          	 <div class="col-lg-2 form-group">
                          	    <div style="text-align: center;width: 120px;height: 120px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="viewOutletVoidReport('outletVoidReportwarehouse','0','warehouse');" title="Void item Report">
                          			<img src="${pageContext.request.contextPath}/images/imagentavl.png" style="margin-top: -30px; padding: 34px 12px 0px 59px; margin-left: -33%;"><br><br>
                          			<span>Void item Report</span>
                          		</div>
                          	</div>
                          	
                          	 <div class="col-lg-2 form-group">
                          	    <div style="text-align: center;width: 120px;height: 120px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="viewItemWiseTaxGSTReport('ItemTaxGSTReportwarehouse','0','false','warehouse')" title="Item-wise Gst report">
                          			<img src="${pageContext.request.contextPath}/images/imagentavl.png" style="margin-top: -30px; padding: 34px 12px 0px 59px; margin-left: -33%;"><br><br>
                          			<span>Item-wise Gst report</span>
                          		</div>
                          	</div>
                          	
                          	 <div class="col-lg-2 form-group">
                          	    <div style="text-align: center;width: 120px;height: 120px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="viewOutletCreditNoteReport('outletCreditNoteReportwarehouse','0','false','warehouse')" title="Credit-Note Report">
                          			<img src="${pageContext.request.contextPath}/images/imagentavl.png" style="margin-top: -30px; padding: 34px 12px 0px 59px; margin-left: -33%;"><br><br>
                          			<span>Credit-Note Report</span>
                          		</div>
                          	</div>
                          	
                          	  <div class="col-lg-2 form-group">
                          	    <div style="text-align: center;width: 120px;height: 120px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="viewOutletCreditNoteRedemptionReport('outletCreditNoteRedeemReportwarehouse','0','false','warehouse')" title="Credit-Note Redeem">
                          			<img src="${pageContext.request.contextPath}/images/imagentavl.png" style="margin-top: -30px; padding: 34px 12px 0px 59px; margin-left: -33%;"><br><br>
                          			<span>Credit-Note Redeem</span>
                          		</div>
                          	</div>
                          	
                          	 <div class="col-lg-2 form-group">
                          	    <div style="text-align: center;width: 120px;height: 120px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="viewSalesReportsCriteriaWise('salesReportTaxWisewarehouse','tax','warehouse');" title="Tax">
                          			<img src="${pageContext.request.contextPath}/images/imagentavl.png" style="margin-top: -30px; padding: 34px 12px 0px 59px; margin-left: -33%;"><br><br>
                          			<span>Tax</span>
                          		</div>
                          	</div>
                          	
                          	 <div class="col-lg-2 form-group">
                          	    <div style="text-align: center;width: 120px;height: 120px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="viewTenderWiseSales('tenderWiseSaleswarehouse','0','warehouse');" title="Tender Wise Sales">
                          			<img src="${pageContext.request.contextPath}/images/imagentavl.png" style="margin-top: -30px; padding: 34px 12px 0px 59px; margin-left: -33%;"><br><br>
                          			<span>Tender Wise Sales</span>
                          		</div>
                          	</div>
                          	
                          	 <div class="col-lg-2 form-group">
                          	    <div style="text-align: center;width: 120px;height: 120px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="viewSalesmanCommission('outletSalesmanCommissionwarehouse','0','false','warehouse');" title="Salesmen Day Wise">
                          			<img src="${pageContext.request.contextPath}/images/imagentavl.png" style="margin-top: -30px; padding: 34px 12px 0px 59px; margin-left: -33%;"><br><br>
                          			<span>Salesmen Day Wise</span>
                          		</div>
                          	</div>
                          	
                          	<div class="col-lg-2 form-group">
                          	    <div style="text-align: center;width: 120px;height: 120px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="viewNewSalesmanCommission('outletSalesmenSalesCommissionwarehouse','0','false','warehouse');" title="Salesmen Item Wise">
                          			<img src="${pageContext.request.contextPath}/images/imagentavl.png" style="margin-top: -30px; padding: 34px 12px 0px 59px; margin-left: -33%;"><br><br>
                          			<span>Salesmen Item Wise</span>
                          		</div>
                          	</div>
                          	
                          	 <div class="col-lg-2 form-group">
                          	    <div style="text-align: center;width: 120px;height: 120px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="viewSalesCouponReports('salesCouponIssueIdwarehouse','0','','warehouse');" title="Coupon Report">
                          			<img src="${pageContext.request.contextPath}/images/imagentavl.png" style="margin-top: -30px; padding: 34px 12px 0px 59px; margin-left: -33%;"><br><br>
                          			<span>Coupon Report</span>
                          		</div>
                          	</div>
                          	
                          	   <div class="col-lg-2 form-group">
                          	    <div style="text-align: center;width: 120px;height: 120px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="viewSalesVoucherReports('salesVoucherIssueIdwarehouse','0','','warehouse');" title="Voucher Report">
                          			<img src="${pageContext.request.contextPath}/images/imagentavl.png" style="margin-top: -30px; padding: 34px 12px 0px 59px; margin-left: -33%;"><br><br>
                          			<span>Voucher Report</span>
                          		</div>
                          	</div>
                          	
                          	 <div class="col-lg-2 form-group">
                          	    <div style="text-align: center;width: 120px;height: 120px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="viewDeliveryPersonWiseReports('PersonWiseReportIdwarehouse','0','','warehouse');" title="Delivery Person Wise">
                          			<img src="${pageContext.request.contextPath}/images/imagentavl.png" style="margin-top: -30px; padding: 34px 12px 0px 59px; margin-left: -33%;"><br><br>
                          			<span>Delivery Person Wise</span>
                          		</div>
                          	</div>
                          	
                          	 <div class="col-lg-2 form-group">
                          	    <div style="text-align: center;width: 120px;height: 120px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="viewOutletCashierEfficiencyReport('outletCashierEfficiencyReportwarehouse','0','false','warehouse');" title="Cashier Effeciency">
                          			<img src="${pageContext.request.contextPath}/images/imagentavl.png" style="margin-top: -30px; padding: 34px 12px 0px 59px; margin-left: -33%;"><br><br>
                          			<span>Cashier Effeciency</span>
                          		</div>
                          	</div>
                          	
                          	  <div class="col-lg-2 form-group">
                          	    <div style="text-align: center;width: 120px;height: 120px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="viewOutletPriceChangeReport('outletPriceChangeReportwarehouse','0','','','clear','warehouse')" title="Price Change Report">
                          			<img src="${pageContext.request.contextPath}/images/imagentavl.png" style="margin-top: -30px; padding: 34px 12px 0px 59px; margin-left: -33%;"><br><br>
                          			<span>Price Change Report</span>
                          		</div>
                          	</div>
                          	
                          	<div class="col-lg-2 form-group">
                          	    <div style="text-align: center;width: 120px;height: 120px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="viewCashierShortageReport('cashierShortageReportwarehouse','0','','clear','warehouse')" title="Cashier Shortage Report">
                          			<img src="${pageContext.request.contextPath}/images/imagentavl.png" style="margin-top: -30px; padding: 34px 12px 0px 59px; margin-left: -33%;"><br><br>
                          			<span>Cashier Shortage Report</span>
                          		</div>
                          	</div>
                          		
                          		<div class="col-lg-2 form-group">
                          	    <div style="text-align: center;width: 120px;height: 120px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="viewStandardSalesReport('standardSalesReportwarehouse','0','','clear','warehouse')" title="Standard Sales Report">
                          			<img src="${pageContext.request.contextPath}/images/imagentavl.png" style="margin-top: -30px; padding: 34px 12px 0px 59px; margin-left: -33%;"><br><br>
                          			<span>Standard Sales Report</span>
                          		</div>
                          	</div>
                          	
                          	 <div class="col-lg-2 form-group">
                          	    <div style="text-align: center;width: 120px;height: 120px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="viewStandardSalesDetailedReport('standardSalesDetailedReportwarehouse','0','','clear','warehouse')" title="Standard Sales Detailed Report">
                          			<img src="${pageContext.request.contextPath}/images/imagentavl.png" style="margin-top: -30px; padding: 34px 12px 0px 59px; margin-left: -33%;"><br><br>
                          			<span>Standard Sales Detailed Report</span>
                          		</div>
                          	</div>
                          	
                          	 <div class="col-lg-2 form-group">
                          	    <div style="text-align: center;width: 120px;height: 120px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="viewWarehousesuppliereport('warehouseSuppliesReports','0','')" title="Supplies Report">
                          			<img src="${pageContext.request.contextPath}/images/imagentavl.png" style="margin-top: -30px; padding: 34px 12px 0px 59px; margin-left: -33%;"><br><br>
                          			<span>Supplies Report</span>
                          		</div>
                          	</div>
                          	
                          	  <div class="col-lg-2 form-group">
                          	    <div style="text-align: center;width: 120px;height: 120px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="viewWarehousesupplies('warehouseSupplies')" title="Supplies">
                          			<img src="${pageContext.request.contextPath}/images/imagentavl.png" style="margin-top: -30px; padding: 34px 12px 0px 59px; margin-left: -33%;"><br><br>
                          			<span>Supplies</span>
                          		</div>
                          	</div>
                          	
                          	 <div class="col-lg-2 form-group">
                          	    <div style="text-align: center;width: 120px;height: 120px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="viewPriceVariationreport('warehousePriceVariation','0','')" title="Price Variation">
                          			<img src="${pageContext.request.contextPath}/images/imagentavl.png" style="margin-top: -30px; padding: 34px 12px 0px 59px; margin-left: -33%;"><br><br>
                          			<span>Price Variation</span>
                          		</div>
                          	</div>
                          	
                          	  <div class="col-lg-2 form-group">
                          	    <div style="text-align: center;width: 120px;height: 120px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="viewProcurementConsumptionreport('warehouseProcurementVsConsumption','0','')" title="Procurment vs Consumption">
                          			<img src="${pageContext.request.contextPath}/images/imagentavl.png" style="margin-top: -30px; padding: 34px 12px 0px 59px; margin-left: -33%;"><br><br>
                          			<span>Procurment vs Consumption</span>
                          		</div>
                          	</div>
                          	
                          	<div class="col-lg-2 form-group">
                          	    <div style="text-align: center;width: 120px;height: 120px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="viewStockIssueReport('stockissueReports','0','','clear','warehouse')" title="Stock Issue Report">
                          			<img src="${pageContext.request.contextPath}/images/imagentavl.png" style="margin-top: -30px; padding: 34px 12px 0px 59px; margin-left: -33%;"><br><br>
                          			<span>Stock Issue Report</span>
                          		</div>
                          	</div>
                          	
                          	 <div class="col-lg-2 form-group">
                          	    <div style="text-align: center;width: 120px;height: 120px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="viewPurchaseReports('purchaseReports','0','','clear','warehouse')" title="Purchase Report">
                          			<img src="${pageContext.request.contextPath}/images/imagentavl.png" style="margin-top: -30px; padding: 34px 12px 0px 59px; margin-left: -33%;"><br><br>
                          			<span>Purchase Report</span>
                          		</div>
                          	</div>
                          
                          	</div>
                          	
                          	
                          	
                          	
                          	
                          	
                          		<div class="row">
                          	<div class="col-lg-2 form-group">
                          	    <div style="text-align: center;width: 120px;height: 120px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="viewSalesReportsCriteriaWise('salesReportCategoryWise','category','${flowLocation}');" title="<spring:message code="category.wise.label" />">
                          			<img src="${pageContext.request.contextPath}/images/CategoryWiseReport.png" style="margin-top: 10px;"><br><br>
                          			<span><spring:message code="category.wise.label" /></span>
                          		</div>
                          	</div>
                          	   <div class="col-lg-2 form-group">
                          	    <div style="text-align: center;width: 120px;height: 120px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="viewSalesReportsCriteriaWise('salesReportDepartmentWise','Department','${flowLocation}');" title="<spring:message code="department.wise" />">
                          			<img src="${pageContext.request.contextPath}/images/Departments.png" style="margin-top: 10px;"><br><br>
                          			<span><spring:message code="department.wise" /></span>
                          		</div>
                          	</div>

  								<div class="col-lg-2 form-group">
                          	    <div style="text-align: center;width: 120px;height: 120px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="viewSalesReportsCriteriaWise('salesReportSkuWise','skuSales','${flowLocation}');" title="<spring:message code="sku.wise.label" />">
                          			<img src="${pageContext.request.contextPath}/images/SkuMaster.png" style="margin-top: 10px;"><br><br>
                          			<span><spring:message code="sku.wise.label" /></span>
                          		</div>
                          	</div>

								<div class="col-lg-2 form-group">
                          	    <div style="text-align: center;width: 120px;height: 120px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="viewSalesReportsCriteriaWise('salesReportBrandWise','Brand','${flowLocation}');" title="<spring:message code="brandwise.reports.label" />">
                          			<img src="${pageContext.request.contextPath}/images/BrandMaster.png" style="margin-top: 10px;"><br><br>
                          			<span><spring:message code="brandwise.reports.label" /></span>
                          		</div>
                          	</div>
 							<div class="col-lg-2 form-group">
                          	    <div style="text-align: center;width: 120px;height: 120px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="viewSalesReportsCriteriaWise('salesReportSectionWise','Section','${flowLocation}');" title="<spring:message code="sectionwise.reports.label" />">
                          			<img src="${pageContext.request.contextPath}/images/SubCategoryMater.png" style="margin-top: 10px;"><br><br>
                          			<span><spring:message code="sectionwise.reports.label" /></span>
                          		</div>
                          	</div>
                          	
                          	</div>
                          	
                          	
                          	
                          	
                          	
                          	
                          </c:if>
                           <c:set var="counts" value="0" />
                         <c:if test="${sessionScope.role != 'super admin'}">
                         
                         
                          <div class="row">
                           <c:forEach var="accessControl" items="${sessionScope.warehouseReports}">
	                           <c:if test="${accessControl.appSubDocument == 'WarehouseSalesX'}">
                          	 	<div class="col-lg-2 form-group">
	                          	    <div style="text-align: center;width: 120px;height: 120px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="viewOutletXReadingReport('outletXReadingReport','0','${flowLocation}');" title="<spring:message code="xreading.reports.label" />">
	                          			<img src="${pageContext.request.contextPath}/images/xreading.png" style="margin-top: 10px;"><br><br>
	                          			<span><spring:message code="xreading.reports.label" /></span>
	                          		</div>
	                          	</div>
	                          	<c:set var="counts" value="${counts+1}" />
                          	</c:if>
                          </c:forEach>
                           <c:forEach var="accessControl" items="${sessionScope.warehouseReports}">
	                          <c:if test="${accessControl.appSubDocument == 'WarehouseSalesZ'}">
                          	<div class="col-lg-2 form-group">
                          	    <div style="text-align: center;width: 120px;height: 120px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="viewOutletZReadingReport('outletZReadingReport','0','${flowLocation}');" title="<spring:message code="zreading.reports.label" />">
                          			<img src="${pageContext.request.contextPath}/images/zreading.png" style="margin-top: 10px;"><br><br>
                          			<span><spring:message code="zreading.reports.label" /></span>
                          		</div>
                          	</div>
                          	<c:set var="counts" value="${counts+1}" />
                          	</c:if>
                          </c:forEach>
                           <c:forEach var="accessControl" items="${sessionScope.warehouseReports}">
	                          <c:if test="${accessControl.appSubDocument == 'WarehouseSalesXZ'}">
                            <div class="col-lg-2 form-group">
                          	    <div style="text-align: center;width: 120px;height: 120px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="viewXZReading('outletXZReadingReport');" title="<spring:message code="xzreading.reports.label" />">
                          			<img src="${pageContext.request.contextPath}/images/xzreading.png" style="margin-top: 10px;"><br><br>
                          			<span><spring:message code="xzreading.reports.label" /></span>
                          		</div>
                          	</div>
                          	<c:set var="counts" value="${counts+1}" />
                          	</c:if>
                          </c:forEach>
                          
                          
                          <c:forEach var="accessControl" items="${sessionScope.warehouseReports}">
	                           <c:if test="${accessControl.appSubDocument == 'WarehouseSalesDateWise'}">
                          	 	<div class="col-lg-2 form-group">
	                          	    <div style="text-align: center;width: 120px;height: 120px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="viewSalesReportsCriteriaWise('salesReportDateWise','date','${flowLocation}');" title="<spring:message code="date.wise.sales.label" />">
	                          			<img src="${pageContext.request.contextPath}/images/DateWiseReport.png" style="margin-top: 10px;"><br><br>
	                          			<span><spring:message code="date.wise.sales.label" /></span>
	                          		</div>
	                          	</div>
	                          	<c:set var="counts" value="${counts+1}" />
                          	</c:if>
                          </c:forEach>
                           <c:forEach var="accessControl" items="${sessionScope.warehouseReports}">
	                          <c:if test="${accessControl.appSubDocument == 'WarehouseSalesCounterWise'}">
                          	<div class="col-lg-2 form-group">
                          	    <div style="text-align: center;width: 120px;height: 120px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="viewSalesReportsCriteriaWise('salesReportCounterWise','counter','${flowLocation}');" title="<spring:message code="counter.wise.label" />">
                          			<img src="${pageContext.request.contextPath}/images/CounterWiseReport.png" style="margin-top: 10px;"><br><br>
                          			<span><spring:message code="counter.wise.label" /></span>
                          		</div>
                          	</div>
                          	<c:set var="counts" value="${counts+1}" />
                          	</c:if>
                          </c:forEach>
                          <c:if test="${counts == 5 || counts == 10}">
                          		<div class="col-lg-2 form-group" style="text-align: right;"></div>
                          		</div>
                          	<div class="row">
                         </c:if>
                         
                         
                         
                         
                         
                         
                         
                         
                           <c:forEach var="accessControl" items="${sessionScope.warehouseReports}">
	                          <c:if test="${accessControl.appSubDocument == 'WarehouseSalesCategoryWise'}">
                            <div class="col-lg-2 form-group">
                          	    <div style="text-align: center;width: 120px;height: 120px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="viewSalesReportsCriteriaWise('salesReportCategoryWise','category','${flowLocation}');" title="<spring:message code="category.wise.label" />">
                          			<img src="${pageContext.request.contextPath}/images/CategoryWiseReport.png" style="margin-top: 10px;"><br><br>
                          			<span><spring:message code="category.wise.label" /></span>
                          		</div>
                          	</div>
                          	<c:set var="counts" value="${counts+1}" />
                          	</c:if>
                          </c:forEach>
                       
                            <c:forEach var="accessControl" items="${sessionScope.warehouseReports}">
	                          <c:if test="${accessControl.appSubDocument == 'WarehouseSalesCategoryWise'}">
                            <div class="col-lg-2 form-group">
                          	    <div style="text-align: center;width: 120px;height: 120px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="viewSalesReportsCriteriaWise('salesReportSkuWise','skuSales','${flowLocation}');" title="<spring:message code="sku.wise.label" />">
                          			<img src="${pageContext.request.contextPath}/images/SkuMaster.png" style="margin-top: 10px;"><br><br>
                          			<span><spring:message code="sku.wise.label" /></span>
                          		</div>
                          	</div>
                          	<c:set var="counts" value="${counts+1}" />
                          	</c:if>
                          </c:forEach>
                           <c:forEach var="accessControl" items="${sessionScope.warehouseReports}">
	                          <c:if test="${accessControl.appSubDocument == 'WarehouseSalesCategoryWise'}">
                            <div class="col-lg-2 form-group">
                          	    <div style="text-align: center;width: 120px;height: 120px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="viewSalesReportsCriteriaWise('salesReportDepartmentWise','Department','${flowLocation}');" title="<spring:message code="department.wise" />">
                          			<img src="${pageContext.request.contextPath}/images/Departments.png" style="margin-top: 10px;"><br><br>
                          			<span><spring:message code="department.wise" /></span>
                          		</div>
                          	</div>
                          	<c:set var="counts" value="${counts+1}" />
                          	</c:if>
                          </c:forEach>
                           <c:forEach var="accessControl" items="${sessionScope.warehouseReports}">
	                           <c:if test="${accessControl.appSubDocument == 'WarehouseSalesCreditSales'}">
                          	 	<div class="col-lg-2 form-group">
	                          	    <div style="text-align: center;width: 120px;height: 120px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="viewSalesReportsCriteriaWise('salesReporthourWise','hour','${flowLocation}');" title="<spring:message code="hour.wise.sales.label" />">
	                          			<img src="${pageContext.request.contextPath}/images/CreditSalesReport.png" style="margin-top: 10px;"><br><br>
	                          			<span><spring:message code="hour.wise.sales.label" /></span>
	                          		</div>
	                          	</div>
	                          	<c:set var="counts" value="${counts+1}" />
                          	</c:if>
                          </c:forEach>
                         
 <c:forEach var="accessControl" items="${sessionScope.warehouseReports}">
	                          <c:if test="${accessControl.appSubDocument == 'WarehouseSalesSupplierWise'}">
                          	<div class="col-lg-2 form-group">
                          	    <div style="text-align: center;width: 120px;height: 120px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="viewSalesReportsCriteriaWise('salesReportBrandWise','Brand','${flowLocation}');" title="<spring:message code="brandwise.reports.label" />">
                          			<img src="${pageContext.request.contextPath}/images/BrandMaster.png" style="margin-top: 10px;"><br><br>
                          			<span><spring:message code="brandwise.reports.label" /></span>
                          		</div>
                          	</div>
                          	<c:set var="counts" value="${counts+1}" />
                          	</c:if>
                          	</c:forEach>
                         
                         
                          <c:if test="${counts == 5  || counts == 10}">
                          		<div class="col-lg-2 form-group" style="text-align: right;"></div>
                          		</div>
                          	<div class="row">
                         </c:if>
                         
                         
                        <c:forEach var="accessControl" items="${sessionScope.warehouseReports}">
	                          <c:if test="${accessControl.appSubDocument == 'WarehouseSalesSupplierWise'}">
                          	<div class="col-lg-2 form-group">
                          	    <div style="text-align: center;width: 120px;height: 120px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="viewSalesReportsCriteriaWise('salesReportSectionWise','Section','${flowLocation}');" title="<spring:message code="sectionwise.reports.label" />">
                          			<img src="${pageContext.request.contextPath}/images/SubCategoryMater.png" style="margin-top: 10px;"><br><br>
                          			<span><spring:message code="sectionwise.reports.label" /></span>
                          		</div>
                          	</div>
                          	<c:set var="counts" value="${counts+1}" />
                          
                          	</c:if>
                          </c:forEach>
                   		   <c:forEach var="accessControl" items="${sessionScope.warehouseReports}">
	                           <c:if test="${accessControl.appSubDocument == 'WarehouseSalesSupplierWise'}">
                          	 	<div class="col-lg-2 form-group">
	                          	    <div style="text-align: center;width: 120px;height: 120px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="viewSalesReportsCriteriaWise('salesReportSupplierWise','supplier','${flowLocation}');" title="<spring:message code="supplier.wise.label" />">
	                          			<img src="${pageContext.request.contextPath}/images/SupplierWiseReport.png" style="margin-top: 10px;"><br><br>
	                          			<span><spring:message code="supplier.wise.label" /></span>
	                          		</div>
	                          	</div>
	                          	<c:set var="counts" value="${counts+1}" />
                          	</c:if>
                          </c:forEach>
                            
                        
                                  
                     <c:forEach var="accessControl" items="${sessionScope.warehouseReports}">
	                           <c:if test="${accessControl.appSubDocument == 'WarehouseSalesPriceVariation'}">
                          	 	<div class="col-lg-2 form-group">
	                          	    <div style="text-align: center;width: 120px;height: 120px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="viewSalesPriceVariationReport('salesReportPriceVariation','0','','${flowLocation}');" title="<spring:message code="credit.sales.label" />">
	                          			<img src="${pageContext.request.contextPath}/images/" style="margin-top: 10px;"><br><br>
	                          			<span><spring:message code="sale.price.variation.label" /></span>
	                          		</div>
	                          	</div>
	                          	<c:set var="counts" value="${counts+1}" />
                          	</c:if>
                          </c:forEach>
                            <c:forEach var="accessControl" items="${sessionScope.warehouseReports}">
	                          <c:if test="${accessControl.appSubDocument == 'WarehouseSalesvsProcurement'}">
                            <div class="col-lg-2 form-group">
                          	    <div style="text-align: center;width: 120px;height: 120px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="viewOutletsuppliereport('salesReportSupplierSales','0','','${flowLocation}');" title="<spring:message code="salesvsprocurement" />">
                          			<img src="${pageContext.request.contextPath}/images/" style="margin-top: 10px;"><br><br>
                          			<span><spring:message code="salesvsprocurement" /></span>
                          		</div>
                          	</div>
                          	<c:set var="counts" value="${counts+1}" />
                          	</c:if>
                          </c:forEach>
                        
                          <c:forEach var="accessControl" items="${sessionScope.warehouseReports}">
	                           <c:if test="${accessControl.appSubDocument == 'WarehouseSalesVoidItem'}">
                          	 	<div class="col-lg-2 form-group">
	                          	    <div style="text-align: center;width: 120px;height: 120px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="viewOutletVoidReport('OutletVoidReport','0','${flowLocation}');" title="<spring:message code="void.item.report.label" />">
	                          			<img src="${pageContext.request.contextPath}/images/" style="margin-top: 10px;"><br><br>
	                          			<span><spring:message code="void.item.report.label" /></span>
	                          		</div>
	                          	</div>
	                          	<c:set var="counts" value="${counts+1}" />
                          	</c:if>
                          </c:forEach>
                         
                      
                          <c:if test="${ counts==5 || counts==10 || counts == 15}">
                          		<div class="col-lg-2 form-group" style="text-align: right;"></div>
                          		</div>
                          	<div class="row">
                         </c:if> 
                         
                        
                         
                         
                        
                         

         <c:forEach var="accessControl" items="${sessionScope.warehouseReports}">
	                          <c:if test="${accessControl.appSubDocument == 'WarehouseSalesPriceOverride'}">
                          	<div class="col-lg-2 form-group">
                          	    <div style="text-align: center;width: 120px;height: 120px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="viewOutletNewReport('outletNewReport','0','','','${flowLocation}')" title="<spring:message code="price.override.report.label" />">
                          			<img src="${pageContext.request.contextPath}/images/" style="margin-top: 10px;"><br><br>
                          			<span><spring:message code="price.override.report.label" /></span>
                          		</div>
                          	</div>
                          	<c:set var="counts" value="${counts+1}" />
                          	</c:if>
                          </c:forEach>
                           <c:forEach var="accessControl" items="${sessionScope.warehouseReports}">
	                          <c:if test="${accessControl.appSubDocument == 'WarehouseSalesItemWiseTax'}">
                            <div class="col-lg-2 form-group">
                          	    <div style="text-align: center;width: 120px;height: 120px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="viewItemWiseTaxReport('ItemTaxReport','0','${flowLocation}')" title="<spring:message code="xzreading.reports.label" />">
                          			<img src="${pageContext.request.contextPath}/images/.png" style="margin-top: 10px;"><br><br>
                          			<span><spring:message code="item.wise.tax.report.label" /></span>
                          		</div>
                          	</div>
                          	<c:set var="counts" value="${counts+1}" />
                          	</c:if>
                          </c:forEach>
                          
                          
                          <c:forEach var="accessControl" items="${sessionScope.warehouseReports}">
	                           <c:if test="${accessControl.appSubDocument == 'WarehouseSalesCreditNote'}">
                          	 	<div class="col-lg-2 form-group">
	                          	    <div style="text-align: center;width: 120px;height: 120px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="viewOutletCreditNoteReport('outletCreditNoteReport','0','${flowLocation}')" title="<spring:message code="credit.note.reports.label" />">
	                          			<img src="${pageContext.request.contextPath}/images/" style="margin-top: 10px;"><br><br>
	                          			<span><spring:message code="credit.note.reports.label" /></span>
	                          		</div>
	                          	</div>
	                          	<c:set var="counts" value="${counts+1}" />
                          	</c:if>
                          </c:forEach>
                            <c:forEach var="accessControl" items="${sessionScope.warehouseReports}">
	                          <c:if test="${accessControl.appSubDocument == 'WarehouseSalesTax'}">
                          	<div class="col-lg-2 form-group">
                          	    <div style="text-align: center;width: 120px;height: 120px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="viewSalesReportsCriteriaWise('salesReportTaxWise','tax','${flowLocation}');" title="<spring:message code="tax.label" />">
                          			<img src="${pageContext.request.contextPath}/images/TaxReport.png" style="margin-top: 10px;"><br><br>
                          			<span><spring:message code="tax.label" /></span>
                          		</div>
                          	</div>
                          	<c:set var="counts" value="${counts+1}" />
                          	</c:if>
                          </c:forEach>
                          
                            <c:if test="${ counts==5 || counts==10 || counts == 15}">
                          		<div class="col-lg-2 form-group" style="text-align: right;"></div>
                          		</div>
                          	<div class="row">
                         </c:if> 
                         
                      
                          
                         
 <c:forEach var="accessControl" items="${sessionScope.warehouseReports}">
	                           <c:if test="${accessControl.appSubDocument == 'WarehouseSalesCreditSales'}">
                          	 	<div class="col-lg-2 form-group">
	                          	    <div style="text-align: center;width: 120px;height: 120px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="viewSalesReportsCriteriaWise('creditsales','creditsales','${flowLocation}');" title="<spring:message code="credit.sales.label" />">
	                          			<img src="${pageContext.request.contextPath}/images/CreditSalesReport.png" style="margin-top: 10px;"><br><br>
	                          			<span><spring:message code="credit.sales.label" /></span>
	                          		</div>
	                          	</div>
	                          	<c:set var="counts" value="${counts+1}" />
                          	</c:if>
                          </c:forEach>
                          
                          
                     
                          
                         <c:if test="${ counts==5 || counts==10 || counts==20}">
	                          		<div class="col-lg-2 form-group" style="text-align: right;"></div>
	                          		</div>
	                          	<div class="row">
	                        </c:if>
                          
                               <c:forEach var="accessControl" items="${sessionScope.warehouseReports}">
	                          <c:if test="${accessControl.appSubDocument == 'WarehouseSalesDueCollection'}">
                            <div class="col-lg-2 form-group">
                          	    <div style="text-align: center;width: 120px;height: 120px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="viewSalesReportsCriteriaWise('dueCollection','duecollection','${flowLocation}');" title="<spring:message code="due.collection.label" />">
                          			<img src="${pageContext.request.contextPath}/images/DueCollectionReport.png" style="margin-top: 10px;"><br><br>
                          			<span><spring:message code="due.collection.label" /></span>
                          		</div>
                          	</div>
                          	<c:set var="counts" value="${counts+1}" />
                          	</c:if>
                          </c:forEach>
                          
                            <c:if test="${ counts==5 || counts==10 || counts == 15 || counts == 20}">
                          		<div class="col-lg-2 form-group" style="text-align: right;"></div>
                          		</div>
                          	<div class="row">
                         </c:if> 
	                        
	                          <c:forEach var="accessControl" items="${sessionScope.warehouseReports}">
	                          <c:if test="${accessControl.appSubDocument == 'WarehouseSalesHourWiseBill'}">
                            <div class="col-lg-2 form-group">
                          	    <div style="text-align: center;width: 120px;height: 120px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="viewSalesHourWiseBillReport('salesReporthourWisebillwarehouse','0','','warehouse')" title="Hour-wise Bill Report">
                          			<img src="${pageContext.request.contextPath}/images/imagentavl.png" style="margin-top: -30px; padding: 34px 12px 0px 59px; margin-left: -33%;"><br><br>
                          			<span>Hour-wise Bill Report</span>
                          		</div>
                          	</div>
                          	<c:set var="counts" value="${counts+1}" />
                          	</c:if>
                          </c:forEach>
                          
                             <c:if test="${ counts==5 || counts==10 || counts == 15 || counts == 20}">
                          		<div class="col-lg-2 form-group" style="text-align: right;"></div>
                          		</div>
                          	<div class="row">
                         </c:if> 
                          
                          <c:forEach var="accessControl" items="${sessionScope.warehouseReports}">
	                          <c:if test="${accessControl.appSubDocument == 'WarehouseSalesPriceVariationReport'}">
                            <div class="col-lg-2 form-group">
                          	    <div style="text-align: center;width: 120px;height: 120px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="viewSalesPriceVariationReport('salesReportPriceVariationwarehouse','0','','warehouse');" title="Sales Price Variation">
                          			<img src="${pageContext.request.contextPath}/images/imagentavl.png" style="margin-top: -30px; padding: 34px 12px 0px 59px; margin-left: -33%;"><br><br>
                          			<span>Sales Price Variation</span>
                          		</div>
                          	</div>
                          	<c:set var="counts" value="${counts+1}" />
                          	</c:if>
                          </c:forEach>
                          
                           <c:if test="${ counts==5 || counts==10 || counts == 15 || counts == 20}">
                          		<div class="col-lg-2 form-group" style="text-align: right;"></div>
                          		</div>
                          	<div class="row">
                         </c:if> 
                          
                           <c:forEach var="accessControl" items="${sessionScope.warehouseReports}">
	                          <c:if test="${accessControl.appSubDocument == 'WarehouseSalesSalesVsProcurementReport'}">
                            <div class="col-lg-2 form-group">
                          	    <div style="text-align: center;width: 120px;height: 120px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="viewOutletsuppliereport('salesReportSupplierSaleswarehouse','0','','warehouse');" title="Sales Vs Procurment">
                          			<img src="${pageContext.request.contextPath}/images/imagentavl.png" style="margin-top: -30px; padding: 34px 12px 0px 59px; margin-left: -33%;"><br><br>
                          			<span>Sales Vs Procurment</span>
                          		</div>
                          	</div>
                          	<c:set var="counts" value="${counts+1}" />
                          	</c:if>
                          </c:forEach>
                          
                           <c:if test="${ counts==5 || counts==10 || counts == 15 || counts == 20}">
                          		<div class="col-lg-2 form-group" style="text-align: right;"></div>
                          		</div>
                          	<div class="row">
                         </c:if> 
                          
                          
                            <c:forEach var="accessControl" items="${sessionScope.warehouseReports}">
	                          <c:if test="${accessControl.appSubDocument == 'WarehouseSalesVoidReport'}">
                            <div class="col-lg-2 form-group">
                          	    <div style="text-align: center;width: 120px;height: 120px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="viewOutletVoidReport('outletVoidReportwarehouse','0','warehouse');" title="Void item Report">
                          			<img src="${pageContext.request.contextPath}/images/imagentavl.png" style="margin-top: -30px; padding: 34px 12px 0px 59px; margin-left: -33%;"><br><br>
                          			<span>Void item Report</span>
                          		</div>
                          	</div>
                          	<c:set var="counts" value="${counts+1}" />
                          	</c:if>
                          </c:forEach>
                          
                           <c:if test="${ counts==5 || counts==10 || counts == 15 || counts == 20}">
                          		<div class="col-lg-2 form-group" style="text-align: right;"></div>
                          		</div>
                          	<div class="row">
                         </c:if>
                          
                            <c:forEach var="accessControl" items="${sessionScope.warehouseReports}">
	                          <c:if test="${accessControl.appSubDocument == 'WarehouseSalesItemWiseGST'}">
                            <div class="col-lg-2 form-group">
                          	    <div style="text-align: center;width: 120px;height: 120px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="viewItemWiseTaxGSTReport('ItemTaxGSTReportwarehouse','0','false','warehouse')" title="Item-wise Gst report">
                          			<img src="${pageContext.request.contextPath}/images/imagentavl.png" style="margin-top: -30px; padding: 34px 12px 0px 59px; margin-left: -33%;"><br><br>
                          			<span>Item-wise Gst report</span>
                          		</div>
                          	</div>
                          	<c:set var="counts" value="${counts+1}" />
                          	</c:if>
                          </c:forEach>
                          
                           <c:if test="${ counts==5 || counts==10 || counts == 15 || counts == 20}">
                          		<div class="col-lg-2 form-group" style="text-align: right;"></div>
                          		</div>
                          	<div class="row">
                         </c:if>
                          
                           <c:forEach var="accessControl" items="${sessionScope.warehouseReports}">
	                          <c:if test="${accessControl.appSubDocument == 'WarehouseSalesCreditNoteReport'}">
                            <div class="col-lg-2 form-group">
                          	    <div style="text-align: center;width: 120px;height: 120px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="viewOutletCreditNoteReport('outletCreditNoteReportwarehouse','0','false','warehouse')" title="Credit-Note Report">
                          			<img src="${pageContext.request.contextPath}/images/imagentavl.png" style="margin-top: -30px; padding: 34px 12px 0px 59px; margin-left: -33%;"><br><br>
                          			<span>Credit-Note Report</span>
                          		</div>
                          	</div>
                          	<c:set var="counts" value="${counts+1}" />
                          	</c:if>
                          </c:forEach>
                          
                           <c:if test="${ counts==5 || counts==10 || counts == 15 || counts == 20}">
                          		<div class="col-lg-2 form-group" style="text-align: right;"></div>
                          		</div>
                          	<div class="row">
                         </c:if>
                          
                           <c:forEach var="accessControl" items="${sessionScope.warehouseReports}">
	                          <c:if test="${accessControl.appSubDocument == 'WarehouseSalesCreditNoteRedeemReport'}">
                            <div class="col-lg-2 form-group">
                          	    <div style="text-align: center;width: 120px;height: 120px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="viewOutletCreditNoteRedemptionReport('outletCreditNoteRedeemReportwarehouse','0','false','warehouse')" title="Credit-Note Redeem">
                          			<img src="${pageContext.request.contextPath}/images/imagentavl.png" style="margin-top: -30px; padding: 34px 12px 0px 59px; margin-left: -33%;"><br><br>
                          			<span>Credit-Note Redeem</span>
                          		</div>
                          	</div>
                          	<c:set var="counts" value="${counts+1}" />
                          	</c:if>
                          </c:forEach>
                          
                          <c:if test="${ counts==5 || counts==10 || counts == 15 || counts == 20}">
                          		<div class="col-lg-2 form-group" style="text-align: right;"></div>
                          		</div>
                          	<div class="row">
                         </c:if>
                          
                           <c:forEach var="accessControl" items="${sessionScope.warehouseReports}">
	                          <c:if test="${accessControl.appSubDocument == 'WarehouseSalesTax'}">
                            <div class="col-lg-2 form-group">
                          	    <div style="text-align: center;width: 120px;height: 120px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="viewSalesReportsCriteriaWise('salesReportTaxWisewarehouse','tax','warehouse');" title="Tax">
                          			<img src="${pageContext.request.contextPath}/images/imagentavl.png" style="margin-top: -30px; padding: 34px 12px 0px 59px; margin-left: -33%;"><br><br>
                          			<span>Tax</span>
                          		</div>
                          	</div>
                          	<c:set var="counts" value="${counts+1}" />
                          	</c:if>
                          </c:forEach>
                          
                          <c:if test="${ counts==5 || counts==10 || counts == 15 || counts == 20 || counts == 25}">
                          		<div class="col-lg-2 form-group" style="text-align: right;"></div>
                          		</div>
                          	<div class="row">
                         </c:if>
                          
                            <c:forEach var="accessControl" items="${sessionScope.warehouseReports}">
	                          <c:if test="${accessControl.appSubDocument == 'WarehouseSalesTenderWiseSales'}">
                            <div class="col-lg-2 form-group">
                          	    <div style="text-align: center;width: 120px;height: 120px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="viewTenderWiseSales('tenderWiseSaleswarehouse','0','warehouse');" title="Tender Wise Sales">
                          			<img src="${pageContext.request.contextPath}/images/imagentavl.png" style="margin-top: -30px; padding: 34px 12px 0px 59px; margin-left: -33%;"><br><br>
                          			<span>Tender Wise Sales</span>
                          		</div>
                          	</div>
                          	<c:set var="counts" value="${counts+1}" />
                          	</c:if>
                          </c:forEach>
                          
                          <c:if test="${ counts==5 || counts==10 || counts == 15 || counts == 20 || counts == 25}">
                          		<div class="col-lg-2 form-group" style="text-align: right;"></div>
                          		</div>
                          	<div class="row">
                         </c:if>
                          
                           <c:forEach var="accessControl" items="${sessionScope.warehouseReports}">
	                          <c:if test="${accessControl.appSubDocument == 'WarehouseSalesManSales'}">
                            <div class="col-lg-2 form-group">
                          	    <div style="text-align: center;width: 120px;height: 120px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="viewSalesmanCommission('outletSalesmanCommissionwarehouse','0','false','warehouse');" title="Salesmen Day Wise">
                          			<img src="${pageContext.request.contextPath}/images/imagentavl.png" style="margin-top: -30px; padding: 34px 12px 0px 59px; margin-left: -33%;"><br><br>
                          			<span>Salesmen Day Wise</span>
                          		</div>
                          	</div>
                          	<c:set var="counts" value="${counts+1}" />
                          	</c:if>
                          </c:forEach>
                          
                          <c:if test="${ counts==5 || counts==10 || counts == 15 || counts == 20 || counts == 25}">
                          		<div class="col-lg-2 form-group" style="text-align: right;"></div>
                          		</div>
                          	<div class="row">
                         </c:if>
                          
                            <c:forEach var="accessControl" items="${sessionScope.warehouseReports}">
	                          <c:if test="${accessControl.appSubDocument == 'WarehouseSalesMenSales'}">
                            <div class="col-lg-2 form-group">
                          	    <div style="text-align: center;width: 120px;height: 120px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="viewNewSalesmanCommission('outletSalesmenSalesCommissionwarehouse','0','false','warehouse');" title="Salesmen Item Wise">
                          			<img src="${pageContext.request.contextPath}/images/imagentavl.png" style="margin-top: -30px; padding: 34px 12px 0px 59px; margin-left: -33%;"><br><br>
                          			<span>Salesmen Item Wise</span>
                          		</div>
                          	</div>
                          	<c:set var="counts" value="${counts+1}" />
                          	</c:if>
                          </c:forEach>
                          
                          <c:if test="${ counts==5 || counts==10 || counts == 15 || counts == 20 || counts == 25}">
                          		<div class="col-lg-2 form-group" style="text-align: right;"></div>
                          		</div>
                          	<div class="row">
                         </c:if>
                          
                          
                           <c:forEach var="accessControl" items="${sessionScope.warehouseReports}">
	                          <c:if test="${accessControl.appSubDocument == 'WarehouseSalesCouponReport'}">
                            <div class="col-lg-2 form-group">
                          	    <div style="text-align: center;width: 120px;height: 120px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="viewSalesCouponReports('salesCouponIssueIdwarehouse','0','','warehouse');" title="Coupon Report">
                          			<img src="${pageContext.request.contextPath}/images/imagentavl.png" style="margin-top: -30px; padding: 34px 12px 0px 59px; margin-left: -33%;"><br><br>
                          			<span>Coupon Report</span>
                          		</div>
                          	</div>
                          	<c:set var="counts" value="${counts+1}" />
                          	</c:if>
                          </c:forEach>
                          
                          <c:if test="${ counts==5 || counts==10 || counts == 15 || counts == 20 || counts == 25}">
                          		<div class="col-lg-2 form-group" style="text-align: right;"></div>
                          		</div>
                          	<div class="row">
                         </c:if>
                          
                          
                            <c:forEach var="accessControl" items="${sessionScope.warehouseReports}">
	                          <c:if test="${accessControl.appSubDocument == 'WarehouseSalesVoucherReport'}">
                            <div class="col-lg-2 form-group">
                          	    <div style="text-align: center;width: 120px;height: 120px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="viewSalesVoucherReports('salesVoucherIssueIdwarehouse','0','','warehouse');" title="Voucher Report">
                          			<img src="${pageContext.request.contextPath}/images/imagentavl.png" style="margin-top: -30px; padding: 34px 12px 0px 59px; margin-left: -33%;"><br><br>
                          			<span>Voucher Report</span>
                          		</div>
                          	</div>
                          	<c:set var="counts" value="${counts+1}" />
                          	</c:if>
                          </c:forEach>
                          
                          <c:if test="${ counts==5 || counts==10 || counts == 15 || counts == 20 || counts == 25 || counts == 30}">
                          		<div class="col-lg-2 form-group" style="text-align: right;"></div>
                          		</div>
                          	<div class="row">
                         </c:if>
                          
                             <c:forEach var="accessControl" items="${sessionScope.warehouseReports}">
	                          <c:if test="${accessControl.appSubDocument == 'WarehouseSalesPersonWiseReport'}">
                            <div class="col-lg-2 form-group">
                          	    <div style="text-align: center;width: 120px;height: 120px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="viewDeliveryPersonWiseReports('PersonWiseReportIdwarehouse','0','','warehouse');" title="Delivery Person Wise">
                          			<img src="${pageContext.request.contextPath}/images/imagentavl.png" style="margin-top: -30px; padding: 34px 12px 0px 59px; margin-left: -33%;"><br><br>
                          			<span>Delivery Person Wise</span>
                          		</div>
                          	</div>
                          	<c:set var="counts" value="${counts+1}" />
                          	</c:if>
                          </c:forEach>
                          
                          <c:if test="${ counts==5 || counts==10 || counts == 15 || counts == 20 || counts == 25 || counts == 30}">
                          		<div class="col-lg-2 form-group" style="text-align: right;"></div>
                          		</div>
                          	<div class="row">
                         </c:if>
                          
                           <c:forEach var="accessControl" items="${sessionScope.warehouseReports}">
	                          <c:if test="${accessControl.appSubDocument == 'WarehouseSalesCashierEfficiencyReport'}">
                            <div class="col-lg-2 form-group">
                          	    <div style="text-align: center;width: 120px;height: 120px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="viewOutletCashierEfficiencyReport('outletCashierEfficiencyReportwarehouse','0','false','warehouse');" title="Cashier Effeciency">
                          			<img src="${pageContext.request.contextPath}/images/imagentavl.png" style="margin-top: -30px; padding: 34px 12px 0px 59px; margin-left: -33%;"><br><br>
                          			<span>Cashier Effeciency</span>
                          		</div>
                          	</div>
                          	<c:set var="counts" value="${counts+1}" />
                          	</c:if>
                          </c:forEach>
                          
                          <c:if test="${ counts==5 || counts==10 || counts == 15 || counts == 20 || counts == 25 || counts == 30}">
                          		<div class="col-lg-2 form-group" style="text-align: right;"></div>
                          		</div>
                          	<div class="row">
                         </c:if>
                          
                            <c:forEach var="accessControl" items="${sessionScope.warehouseReports}">
	                          <c:if test="${accessControl.appSubDocument == 'WarehouseSalesPriceChangeReport'}">
                            <div class="col-lg-2 form-group">
                          	    <div style="text-align: center;width: 120px;height: 120px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="viewOutletPriceChangeReport('outletPriceChangeReportwarehouse','0','','','clear','warehouse')" title="Price Change Report">
                          			<img src="${pageContext.request.contextPath}/images/imagentavl.png" style="margin-top: -30px; padding: 34px 12px 0px 59px; margin-left: -33%;"><br><br>
                          			<span>Price Change Report</span>
                          		</div>
                          	</div>
                          	<c:set var="counts" value="${counts+1}" />
                          	</c:if>
                          </c:forEach>
                          
                          <c:if test="${ counts==5 || counts==10 || counts == 15 || counts == 20 || counts == 25 || counts == 30}">
                          		<div class="col-lg-2 form-group" style="text-align: right;"></div>
                          		</div>
                          	<div class="row">
                         </c:if>
                          
                          
                           <c:forEach var="accessControl" items="${sessionScope.warehouseReports}">
	                          <c:if test="${accessControl.appSubDocument == 'WarehouseSalesCashierShortageReport'}">
                            <div class="col-lg-2 form-group">
                          	    <div style="text-align: center;width: 120px;height: 120px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="viewCashierShortageReport('cashierShortageReportwarehouse','0','','clear','warehouse')" title="Cashier Shortage Report">
                          			<img src="${pageContext.request.contextPath}/images/imagentavl.png" style="margin-top: -30px; padding: 34px 12px 0px 59px; margin-left: -33%;"><br><br>
                          			<span>Cashier Shortage Report</span>
                          		</div>
                          	</div>
                          	<c:set var="counts" value="${counts+1}" />
                          	</c:if>
                          </c:forEach>
                          
                          <c:if test="${ counts==5 || counts==10 || counts == 15 || counts == 20 || counts == 25 || counts == 30 || counts == 35}">
                          		<div class="col-lg-2 form-group" style="text-align: right;"></div>
                          		</div>
                          	<div class="row">
                         </c:if>
                          
                            <c:forEach var="accessControl" items="${sessionScope.warehouseReports}">
	                          <c:if test="${accessControl.appSubDocument == 'WarehouseSalesStandardSalesReport'}">
                            <div class="col-lg-2 form-group">
                          	    <div style="text-align: center;width: 120px;height: 120px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="viewStandardSalesReport('standardSalesReportwarehouse','0','','clear','warehouse')" title="Standard Sales Report">
                          			<img src="${pageContext.request.contextPath}/images/imagentavl.png" style="margin-top: -30px; padding: 34px 12px 0px 59px; margin-left: -33%;"><br><br>
                          			<span>Standard Sales Report</span>
                          		</div>
                          	</div>
                          	<c:set var="counts" value="${counts+1}" />
                          	</c:if>
                          </c:forEach>
                          
                        <c:if test="${ counts==5 || counts==10 || counts == 15 || counts == 20 || counts == 25 || counts == 30 || counts == 35 || counts == 40}">
                          		<div class="col-lg-2 form-group" style="text-align: right;"></div>
                          		</div>
                          	<div class="row">
                         </c:if>
                          
                          
                            <c:forEach var="accessControl" items="${sessionScope.warehouseReports}">
	                          <c:if test="${accessControl.appSubDocument == 'WarehouseSalesStandardSalesDetailedReport'}">
                            <div class="col-lg-2 form-group">
                          	    <div style="text-align: center;width: 120px;height: 120px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="viewStandardSalesDetailedReport('standardSalesDetailedReportwarehouse','0','','clear','warehouse')" title="Standard Sales Detailed Report">
                          			<img src="${pageContext.request.contextPath}/images/imagentavl.png" style="margin-top: -30px; padding: 34px 12px 0px 59px; margin-left: -33%;"><br><br>
                          			<span>Standard Sales Detailed Report</span>
                          		</div>
                          	</div>
                          	<c:set var="counts" value="${counts+1}" />
                          	</c:if>
                          </c:forEach>
                          
                           <c:if test="${ counts==5 || counts==10 || counts == 15 || counts == 20 || counts == 25 || counts == 30 || counts == 35 || counts == 40}">
                          		<div class="col-lg-2 form-group" style="text-align: right;"></div>
                          		</div>
                          	<div class="row">
                         </c:if>
                          
                          
                           <c:forEach var="accessControl" items="${sessionScope.warehouseReports}">
	                          <c:if test="${accessControl.appDocument == 'WarehouseSuppliesReports'}">
                            <div class="col-lg-2 form-group">
                          	    <div style="text-align: center;width: 120px;height: 120px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="viewWarehousesuppliereport('warehouseSuppliesReports','0','')" title="Supplies Report">
                          			<img src="${pageContext.request.contextPath}/images/imagentavl.png" style="margin-top: -30px; padding: 34px 12px 0px 59px; margin-left: -33%;"><br><br>
                          			<span>Supplies Report</span>
                          		</div>
                          	</div>
                          	<c:set var="counts" value="${counts+1}" />
                          	</c:if>
                          </c:forEach>
                          
                            <c:if test="${ counts==5 || counts==10 || counts == 15 || counts == 20 || counts == 25 || counts == 30 || counts == 35 || counts == 40}">
                          		<div class="col-lg-2 form-group" style="text-align: right;"></div>
                          		</div>
                          	<div class="row">
                         </c:if>
                          
                           <c:forEach var="accessControl" items="${sessionScope.warehouseReports}">
	                          <c:if test="${accessControl.appDocument == 'WarehouseSupplies'}">
                            <div class="col-lg-2 form-group">
                          	    <div style="text-align: center;width: 120px;height: 120px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="viewWarehousesupplies('warehouseSupplies')" title="Supplies">
                          			<img src="${pageContext.request.contextPath}/images/imagentavl.png" style="margin-top: -30px; padding: 34px 12px 0px 59px; margin-left: -33%;"><br><br>
                          			<span>Supplies</span>
                          		</div>
                          	</div>
                          	<c:set var="counts" value="${counts+1}" />
                          	</c:if>
                          </c:forEach>
                          
                            <c:if test="${ counts==5 || counts==10 || counts == 15 || counts == 20 || counts == 25 || counts == 30 || counts == 35 || counts == 40}">
                          		<div class="col-lg-2 form-group" style="text-align: right;"></div>
                          		</div>
                          	<div class="row">
                         </c:if>
                          
                           
                          
                          
                           <c:forEach var="accessControl" items="${sessionScope.warehouseReports}">
	                          <c:if test="${accessControl.appDocument == 'WarehousePriceVariation'}">
                            <div class="col-lg-2 form-group">
                          	    <div style="text-align: center;width: 120px;height: 120px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="viewPriceVariationreport('warehousePriceVariation','0','')" title="Price Variation">
                          			<img src="${pageContext.request.contextPath}/images/imagentavl.png" style="margin-top: -30px; padding: 34px 12px 0px 59px; margin-left: -33%;"><br><br>
                          			<span>Price Variation</span>
                          		</div>
                          	</div>
                          	<c:set var="counts" value="${counts+1}" />
                          	</c:if>
                          </c:forEach>
                          
                           <c:if test="${ counts==5 || counts==10 || counts == 15 || counts == 20 || counts == 25 || counts == 30 || counts == 35 || counts == 40}">
                          		<div class="col-lg-2 form-group" style="text-align: right;"></div>
                          		</div>
                          	<div class="row">
                         </c:if>
                          
                            <c:forEach var="accessControl" items="${sessionScope.warehouseReports}">
	                          <c:if test="${accessControl.appDocument == 'WarehouseProcurementVsConsumption'}">
                            <div class="col-lg-2 form-group">
                          	    <div style="text-align: center;width: 120px;height: 120px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="viewProcurementConsumptionreport('warehouseProcurementVsConsumption','0','')" title="Procurment vs Consumption">
                          			<img src="${pageContext.request.contextPath}/images/imagentavl.png" style="margin-top: -30px; padding: 34px 12px 0px 59px; margin-left: -33%;"><br><br>
                          			<span>Procurment vs Consumption</span>
                          		</div>
                          	</div>
                          	<c:set var="counts" value="${counts+1}" />
                          	</c:if>
                          </c:forEach>
                          
                           <c:if test="${ counts==5 || counts==10 || counts == 15 || counts == 20 || counts == 25 || counts == 30 || counts == 35 || counts == 40}">
                          		<div class="col-lg-2 form-group" style="text-align: right;"></div>
                          		</div>
                          	<div class="row">
                         </c:if>
                          
                              <c:forEach var="accessControl" items="${sessionScope.warehouseReports}">
	                          <c:if test="${accessControl.appDocument == 'WarehouseStockIssueReport'}">
                            <div class="col-lg-2 form-group">
                          	    <div style="text-align: center;width: 120px;height: 120px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="viewStockIssueReport('stockissueReports','0','','clear','warehouse')" title="Stock Issue Report">
                          			<img src="${pageContext.request.contextPath}/images/imagentavl.png" style="margin-top: -30px; padding: 34px 12px 0px 59px; margin-left: -33%;"><br><br>
                          			<span>Stock Issue Report</span>
                          		</div>
                          	</div>
                          	<c:set var="counts" value="${counts+1}" />
                          	</c:if>
                          </c:forEach>
                          
                            <c:if test="${ counts==5 || counts==10 || counts == 15 || counts == 20 || counts == 25 || counts == 30 || counts == 35 || counts == 40}">
                          		<div class="col-lg-2 form-group" style="text-align: right;"></div>
                          		</div>
                          	<div class="row">
                         </c:if>
                          
                            <c:forEach var="accessControl" items="${sessionScope.warehouseReports}">
	                          <c:if test="${accessControl.appDocument == 'WarehousePurchaseReport'}">
                            <div class="col-lg-2 form-group">
                          	    <div style="text-align: center;width: 120px;height: 120px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="viewPurchaseReports('purchaseReports','0','','clear','warehouse')" title="Purchase Report">
                          			<img src="${pageContext.request.contextPath}/images/imagentavl.png" style="margin-top: -30px; padding: 34px 12px 0px 59px; margin-left: -33%;"><br><br>
                          			<span>Purchase Report</span>
                          		</div>
                          	</div>
                          	<c:set var="counts" value="${counts+1}" />
                          	</c:if>
                          </c:forEach>
                          
                 
                        
        </c:if>                
                          
</body>
</html>