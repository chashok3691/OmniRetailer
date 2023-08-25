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
                          	    <div style="text-align: center;width: 120px;height: 120px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="viewOutletXZReadingReportDifference('outletXZReadingReport','0','${flowLocation}')" title="<spring:message code="xzreading.reports.label" />">
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
                          	    <div style="text-align: center;width: 120px;height: 120px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="viewSalesHourWiseBillReport('salesReporthourWisebill','0','','');" title="Hour-wise Bill report">
                          			<img src="${pageContext.request.contextPath}/images/imagentavl.png" style="margin-top: -30px; padding: 34px 12px 0px 59px; margin-left: -33%;"><br><br>
                          			<span>Hour-wise Bill report</span>
                          		</div>
                          	</div>
                          	
                          	  <div class="col-lg-2 form-group">
                          	    <div style="text-align: center;width: 120px;height: 120px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="viewSalesPriceVariationReport('salesReportPriceVariation','0','','');" title="Sales Price Variation">
                          			<img src="${pageContext.request.contextPath}/images/imagentavl.png" style="margin-top: -30px; padding: 34px 12px 0px 59px; margin-left: -33%;"><br><br>
                          			<span>Sales Price Variation</span>
                          		</div>
                          	</div>
                          	
                          	 <div class="col-lg-2 form-group">
                          	    <div style="text-align: center;width: 120px;height: 120px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="viewOutletsuppliereport('salesReportSupplierSales','0','','');" title="Sales Vs Procurment">
                          			<img src="${pageContext.request.contextPath}/images/imagentavl.png" style="margin-top: -30px; padding: 34px 12px 0px 59px; margin-left: -33%;"><br><br>
                          			<span>Sales Vs Procurment</span>
                          		</div>
                          	</div>
                          	
                          	  <div class="col-lg-2 form-group">
                          	    <div style="text-align: center;width: 120px;height: 120px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="viewOutletVoidReport('outletVoidReport','0','');" title="Void Item Report">
                          			<img src="${pageContext.request.contextPath}/images/imagentavl.png" style="margin-top: -30px; padding: 34px 12px 0px 59px; margin-left: -33%;"><br><br>
                          			<span>Void Item Report</span>
                          		</div>
                          	</div>
                          	
                          	 <div class="col-lg-2 form-group">
                          	    <div style="text-align: center;width: 120px;height: 120px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="viewItemWiseTaxGSTReport('ItemTaxGSTReport','0','false','')" title="Item Wise Gst Report">
                          			<img src="${pageContext.request.contextPath}/images/imagentavl.png" style="margin-top: -30px; padding: 34px 12px 0px 59px; margin-left: -33%;"><br><br>
                          			<span>Item Wise Gst Report</span>
                          		</div>
                          	</div>
                          	
                          	   <div class="col-lg-2 form-group">
                          	    <div style="text-align: center;width: 120px;height: 120px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="viewOutletCreditNoteReport('outletCreditNoteReport','0','false','')" title="Credit Note Report">
                          			<img src="${pageContext.request.contextPath}/images/imagentavl.png" style="margin-top: -30px; padding: 34px 12px 0px 59px; margin-left: -33%;"><br><br>
                          			<span>Credit Note Report</span>
                          		</div>
                          	</div>
                          	
                          	   <div class="col-lg-2 form-group">
                          	    <div style="text-align: center;width: 120px;height: 120px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="viewOutletCreditNoteRedemptionReport('outletCreditNoteRedeemReport','0','false','')" title="Credit Note Redeem">
                          			<img src="${pageContext.request.contextPath}/images/imagentavl.png" style="margin-top: -30px; padding: 34px 12px 0px 59px; margin-left: -33%;"><br><br>
                          			<span>Credit Note Redeem</span>
                          		</div>
                          	</div>
                          	
                          	  <div class="col-lg-2 form-group">
                          	    <div style="text-align: center;width: 120px;height: 120px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="viewSalesReportsCriteriaWise('salesReportTaxWise','tax','');" title="Tax">
                          			<img src="${pageContext.request.contextPath}/images/imagentavl.png" style="margin-top: -30px; padding: 34px 12px 0px 59px; margin-left: -33%;"><br><br>
                          			<span>Tax</span>
                          		</div>
                          	</div>
                          	
                          	  <div class="col-lg-2 form-group">
                          	    <div style="text-align: center;width: 120px;height: 120px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="viewTenderWiseSales('tenderWiseSales','0','');" title="Tenderwise Sales">
                          			<img src="${pageContext.request.contextPath}/images/imagentavl.png" style="margin-top: -30px; padding: 34px 12px 0px 59px; margin-left: -33%;"><br><br>
                          			<span>Tenderwise Sales</span>
                          		</div>
                          	</div>
                          	
                          	 <div class="col-lg-2 form-group">
                          	    <div style="text-align: center;width: 120px;height: 120px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="viewSalesmanCommission('outletSalesmanCommission','0','false','');" title="Sales Man Daywise">
                          			<img src="${pageContext.request.contextPath}/images/imagentavl.png" style="margin-top: -30px; padding: 34px 12px 0px 59px; margin-left: -33%;"><br><br>
                          			<span>Sales Man Daywise</span>
                          		</div>
                          	</div>
                          	
                          	   <div class="col-lg-2 form-group">
                          	    <div style="text-align: center;width: 120px;height: 120px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="viewNewSalesmanCommission('outletSalesmenSalesCommission','0','false','');" title="Sales Man Itemwise">
                          			<img src="${pageContext.request.contextPath}/images/imagentavl.png" style="margin-top: -30px; padding: 34px 12px 0px 59px; margin-left: -33%;"><br><br>
                          			<span>Sales Man Itemwise</span>
                          		</div>
                          	</div>
                          	
                          	  <div class="col-lg-2 form-group">
                          	    <div style="text-align: center;width: 120px;height: 120px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="viewSerialBillSalesReports('serialBillSales','0','','');" title="Bill Report">
                          			<img src="${pageContext.request.contextPath}/images/imagentavl.png" style="margin-top: -30px; padding: 34px 12px 0px 59px; margin-left: -33%;"><br><br>
                          			<span>Bill Report</span>
                          		</div>
                          	</div>
                          	
                          	<div class="col-lg-2 form-group">
                          	    <div style="text-align: center;width: 120px;height: 120px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="viewSalesCouponReports('salesCouponIssueId','0','','');" title="Coupon Report">
                          			<img src="${pageContext.request.contextPath}/images/imagentavl.png" style="margin-top: -30px; padding: 34px 12px 0px 59px; margin-left: -33%;"><br><br>
                          			<span>Coupon Report</span>
                          		</div>
                          	</div>
                          	
                          	   <div class="col-lg-2 form-group">
                          	    <div style="text-align: center;width: 120px;height: 120px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="viewSalesVoucherReports('salesVoucherIssueId','0','','');" title="Voucher Report">
                          			<img src="${pageContext.request.contextPath}/images/imagentavl.png" style="margin-top: -30px; padding: 34px 12px 0px 59px; margin-left: -33%;"><br><br>
                          			<span>Voucher Report</span>
                          		</div>
                          	</div>
                          	
                          	  <div class="col-lg-2 form-group">
                          	    <div style="text-align: center;width: 120px;height: 120px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="viewDeliveryPersonWiseReports('PersonWiseReportId','0','','');" title="Delivery PersonWise Report">
                          			<img src="${pageContext.request.contextPath}/images/imagentavl.png" style="margin-top: -30px; padding: 34px 12px 0px 59px; margin-left: -33%;"><br><br>
                          			<span>Delivery PersonWise Report</span>
                          		</div>
                          	</div>
                          	
                          	 <div class="col-lg-2 form-group">
                          	    <div style="text-align: center;width: 120px;height: 120px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="viewOutletCashierEfficiencyReport('outletCashierEfficiencyReport','0','false','')" title="Cashier Effeciency">
                          			<img src="${pageContext.request.contextPath}/images/imagentavl.png" style="margin-top: -30px; padding: 34px 12px 0px 59px; margin-left: -33%;"><br><br>
                          			<span>Cashier Effeciency</span>
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
                           <c:forEach var="accessControl" items="${sessionScope.outletSalesReports}">
	                           <c:if test="${accessControl.appSubDocument == 'OutletSalesX'}">
                          	 	<div class="col-lg-2 form-group">
	                          	    <div style="text-align: center;width: 120px;height: 120px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="viewOutletXReadingReport('outletXReadingReport','0','${flowLocation}');" title="<spring:message code="xreading.reports.label" />">
	                          			<img src="${pageContext.request.contextPath}/images/xreading.png" style="margin-top: 10px;"><br><br>
	                          			<span><spring:message code="xreading.reports.label" /></span>
	                          		</div>
	                          	</div>
	                          	<c:set var="counts" value="${counts+1}" />
                          	</c:if>
                          </c:forEach>
                           <c:forEach var="accessControl" items="${sessionScope.outletSalesReports}">
	                          <c:if test="${accessControl.appSubDocument == 'OutletSalesZ'}">
                          	<div class="col-lg-2 form-group">
                          	    <div style="text-align: center;width: 120px;height: 120px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="viewOutletZReadingReport('outletZReadingReport','0','${flowLocation}');" title="<spring:message code="zreading.reports.label" />">
                          			<img src="${pageContext.request.contextPath}/images/zreading.png" style="margin-top: 10px;"><br><br>
                          			<span><spring:message code="zreading.reports.label" /></span>
                          		</div>
                          	</div>
                          	<c:set var="counts" value="${counts+1}" />
                          	</c:if>
                          </c:forEach>
                           <c:forEach var="accessControl" items="${sessionScope.outletSalesReports}">
	                          <c:if test="${accessControl.appSubDocument == 'OutletSalesXZ'}">
                            <div class="col-lg-2 form-group">
                          	    <div style="text-align: center;width: 120px;height: 120px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="viewOutletXZReadingReportDifference('outletXZReadingReport','0','${flowLocation}')" title="<spring:message code="xzreading.reports.label" />">
                          			<img src="${pageContext.request.contextPath}/images/xzreading.png" style="margin-top: 10px;"><br><br>
                          			<span><spring:message code="xzreading.reports.label" /></span>
                          		</div>
                          	</div>
                          	<c:set var="counts" value="${counts+1}" />
                          	</c:if>
                          </c:forEach>
                          
                          
                          <c:forEach var="accessControl" items="${sessionScope.outletSalesReports}">
	                           <c:if test="${accessControl.appSubDocument == 'OutletSalesDateWise'}">
                          	 	<div class="col-lg-2 form-group">
	                          	    <div style="text-align: center;width: 120px;height: 120px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="viewSalesReportsCriteriaWise('salesReportDateWise','date','${flowLocation}');" title="<spring:message code="date.wise.sales.label" />">
	                          			<img src="${pageContext.request.contextPath}/images/DateWiseReport.png" style="margin-top: 10px;"><br><br>
	                          			<span><spring:message code="date.wise.sales.label" /></span>
	                          		</div>
	                          	</div>
	                          	<c:set var="counts" value="${counts+1}" />
                          	</c:if>
                          </c:forEach>
                           <c:forEach var="accessControl" items="${sessionScope.outletSalesReports}">
	                          <c:if test="${accessControl.appSubDocument == 'OutletSalesCounterWise'}">
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
                         
                         
                         
                         
                         
                         
                         
                         
                           <c:forEach var="accessControl" items="${sessionScope.outletSalesReports}">
	                          <c:if test="${accessControl.appSubDocument == 'OutletSalesCategoryWise'}">
                            <div class="col-lg-2 form-group">
                          	    <div style="text-align: center;width: 120px;height: 120px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="viewSalesReportsCriteriaWise('salesReportCategoryWise','category','${flowLocation}');" title="<spring:message code="category.wise.label" />">
                          			<img src="${pageContext.request.contextPath}/images/CategoryWiseReport.png" style="margin-top: 10px;"><br><br>
                          			<span><spring:message code="category.wise.label" /></span>
                          		</div>
                          	</div>
                          	<c:set var="counts" value="${counts+1}" />
                          	</c:if>
                          </c:forEach>
                       
                            <c:forEach var="accessControl" items="${sessionScope.outletSalesReports}">
	                          <c:if test="${accessControl.appSubDocument == 'OutletSalesCategoryWise'}">
                            <div class="col-lg-2 form-group">
                          	    <div style="text-align: center;width: 120px;height: 120px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="viewSalesReportsCriteriaWise('salesReportSkuWise','skuSales','${flowLocation}');" title="<spring:message code="sku.wise.label" />">
                          			<img src="${pageContext.request.contextPath}/images/SkuMaster.png" style="margin-top: 10px;"><br><br>
                          			<span><spring:message code="sku.wise.label" /></span>
                          		</div>
                          	</div>
                          	<c:set var="counts" value="${counts+1}" />
                          	</c:if>
                          </c:forEach>
                           <c:forEach var="accessControl" items="${sessionScope.outletSalesReports}">
	                          <c:if test="${accessControl.appSubDocument == 'OutletSalesCategoryWise'}">
                            <div class="col-lg-2 form-group">
                          	    <div style="text-align: center;width: 120px;height: 120px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="viewSalesReportsCriteriaWise('salesReportDepartmentWise','Department','${flowLocation}');" title="<spring:message code="department.wise" />">
                          			<img src="${pageContext.request.contextPath}/images/Departments.png" style="margin-top: 10px;"><br><br>
                          			<span><spring:message code="department.wise" /></span>
                          		</div>
                          	</div>
                          	<c:set var="counts" value="${counts+1}" />
                          	</c:if>
                          </c:forEach>
                           <c:forEach var="accessControl" items="${sessionScope.outletSalesReports}">
	                           <c:if test="${accessControl.appSubDocument == 'OutletSalesCreditSales'}">
                          	 	<div class="col-lg-2 form-group">
	                          	    <div style="text-align: center;width: 120px;height: 120px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="viewSalesReportsCriteriaWise('salesReporthourWise','hour','${flowLocation}');" title="<spring:message code="hour.wise.sales.label" />">
	                          			<img src="${pageContext.request.contextPath}/images/CreditSalesReport.png" style="margin-top: 10px;"><br><br>
	                          			<span><spring:message code="hour.wise.sales.label" /></span>
	                          		</div>
	                          	</div>
	                          	<c:set var="counts" value="${counts+1}" />
                          	</c:if>
                          </c:forEach>
                         
 <c:forEach var="accessControl" items="${sessionScope.outletSalesReports}">
	                          <c:if test="${accessControl.appSubDocument == 'OutletSalesSupplierWise'}">
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
                         
                         
                        <c:forEach var="accessControl" items="${sessionScope.outletSalesReports}">
	                          <c:if test="${accessControl.appSubDocument == 'OutletSalesSupplierWise'}">
                          	<div class="col-lg-2 form-group">
                          	    <div style="text-align: center;width: 120px;height: 120px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="viewSalesReportsCriteriaWise('salesReportSectionWise','Section','${flowLocation}');" title="<spring:message code="sectionwise.reports.label" />">
                          			<img src="${pageContext.request.contextPath}/images/SubCategoryMater.png" style="margin-top: 10px;"><br><br>
                          			<span><spring:message code="sectionwise.reports.label" /></span>
                          		</div>
                          	</div>
                          	<c:set var="counts" value="${counts+1}" />
                          
                          	</c:if>
                          </c:forEach>
                   		   <c:forEach var="accessControl" items="${sessionScope.outletSalesReports}">
	                           <c:if test="${accessControl.appSubDocument == 'OutletSalesSupplierWise'}">
                          	 	<div class="col-lg-2 form-group">
	                          	    <div style="text-align: center;width: 120px;height: 120px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="viewSalesReportsCriteriaWise('salesReportSupplierWise','supplier','${flowLocation}');" title="<spring:message code="supplier.wise.label" />">
	                          			<img src="${pageContext.request.contextPath}/images/SupplierWiseReport.png" style="margin-top: 10px;"><br><br>
	                          			<span><spring:message code="supplier.wise.label" /></span>
	                          		</div>
	                          	</div>
	                          	<c:set var="counts" value="${counts+1}" />
                          	</c:if>
                          </c:forEach>
                            
                        
                                  
                     <c:forEach var="accessControl" items="${sessionScope.outletSalesReports}">
	                           <c:if test="${accessControl.appSubDocument == 'OutletSalesPriceVariation'}">
                          	 	<div class="col-lg-2 form-group">
	                          	    <div style="text-align: center;width: 120px;height: 120px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="viewSalesPriceVariationReport('salesReportPriceVariation','0','','${flowLocation}');" title="<spring:message code="credit.sales.label" />">
	                          			<img src="${pageContext.request.contextPath}/images/" style="margin-top: 10px;"><br><br>
	                          			<span><spring:message code="sale.price.variation.label" /></span>
	                          		</div>
	                          	</div>
	                          	<c:set var="counts" value="${counts+1}" />
                          	</c:if>
                          </c:forEach>
                            <c:forEach var="accessControl" items="${sessionScope.outletSalesReports}">
	                          <c:if test="${accessControl.appSubDocument == 'OutletSalesvsProcurement'}">
                            <div class="col-lg-2 form-group">
                          	    <div style="text-align: center;width: 120px;height: 120px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="viewOutletsuppliereport('salesReportSupplierSales','0','','${flowLocation}');" title="<spring:message code="salesvsprocurement" />">
                          			<img src="${pageContext.request.contextPath}/images/" style="margin-top: 10px;"><br><br>
                          			<span><spring:message code="salesvsprocurement" /></span>
                          		</div>
                          	</div>
                          	<c:set var="counts" value="${counts+1}" />
                          	</c:if>
                          </c:forEach>
                        
                          <c:forEach var="accessControl" items="${sessionScope.outletSalesReports}">
	                           <c:if test="${accessControl.appSubDocument == 'OutletSalesVoidItem'}">
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
                         
                        
                         
                         
                        
                         

         <c:forEach var="accessControl" items="${sessionScope.outletSalesReports}">
	                          <c:if test="${accessControl.appSubDocument == 'OutletSalesPriceOverride'}">
                          	<div class="col-lg-2 form-group">
                          	    <div style="text-align: center;width: 120px;height: 120px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="viewOutletNewReport('outletNewReport','0','','','${flowLocation}')" title="<spring:message code="price.override.report.label" />">
                          			<img src="${pageContext.request.contextPath}/images/" style="margin-top: 10px;"><br><br>
                          			<span><spring:message code="price.override.report.label" /></span>
                          		</div>
                          	</div>
                          	<c:set var="counts" value="${counts+1}" />
                          	</c:if>
                          </c:forEach>
                           <c:forEach var="accessControl" items="${sessionScope.outletSalesReports}">
	                          <c:if test="${accessControl.appSubDocument == 'OutletSalesItemWiseTax'}">
                            <div class="col-lg-2 form-group">
                          	    <div style="text-align: center;width: 120px;height: 120px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="viewItemWiseTaxReport('ItemTaxReport','0','${flowLocation}')" title="<spring:message code="xzreading.reports.label" />">
                          			<img src="${pageContext.request.contextPath}/images/.png" style="margin-top: 10px;"><br><br>
                          			<span><spring:message code="item.wise.tax.report.label" /></span>
                          		</div>
                          	</div>
                          	<c:set var="counts" value="${counts+1}" />
                          	</c:if>
                          </c:forEach>
                          
                          
                          <c:forEach var="accessControl" items="${sessionScope.outletSalesReports}">
	                           <c:if test="${accessControl.appSubDocument == 'OutletSalesCreditNote'}">
                          	 	<div class="col-lg-2 form-group">
	                          	    <div style="text-align: center;width: 120px;height: 120px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="viewOutletCreditNoteReport('outletCreditNoteReport','0','${flowLocation}')" title="<spring:message code="credit.note.reports.label" />">
	                          			<img src="${pageContext.request.contextPath}/images/" style="margin-top: 10px;"><br><br>
	                          			<span><spring:message code="credit.note.reports.label" /></span>
	                          		</div>
	                          	</div>
	                          	<c:set var="counts" value="${counts+1}" />
                          	</c:if>
                          </c:forEach>
                            <c:forEach var="accessControl" items="${sessionScope.outletSalesReports}">
	                          <c:if test="${accessControl.appSubDocument == 'OutletSalesTax'}">
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
                          
                         
 								<c:forEach var="accessControl" items="${sessionScope.outletSalesReports}">
	                           <c:if test="${accessControl.appSubDocument == 'OutletSalesCreditSales'}">
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
							
                          
                               <c:forEach var="accessControl" items="${sessionScope.outletSalesReports}">
	                          <c:if test="${accessControl.appSubDocument == 'OutletSalesDueCollection'}">
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
                          
                              <c:forEach var="accessControl" items="${sessionScope.outletSalesReports}">
	                          <c:if test="${accessControl.appSubDocument == 'OutletSalesHourWiseBill'}">
                            <div class="col-lg-2 form-group">
                          	    <div style="text-align: center;width: 120px;height: 120px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="viewSalesHourWiseBillReport('salesReporthourWisebill','0','','');" title="Hour-wise Bill report">
                          			<img src="${pageContext.request.contextPath}/images/imagentavl.png" style="margin-top: -30px; padding: 34px 12px 0px 59px; margin-left: -33%;"><br><br>
                          			<span>Hour-wise Bill report</span>
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
                          
                          <c:forEach var="accessControl" items="${sessionScope.outletSalesReports}">
	                          <c:if test="${accessControl.appSubDocument == 'OutletSalesPriceVariationReport'}">
                            <div class="col-lg-2 form-group">
                          	    <div style="text-align: center;width: 120px;height: 120px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="viewSalesPriceVariationReport('salesReportPriceVariation','0','','');" title="Sales Price Variation">
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
                              <c:forEach var="accessControl" items="${sessionScope.outletSalesReports}">
	                          <c:if test="${accessControl.appSubDocument == 'OutletSalesSalesVsProcurementReport'}">
                            <div class="col-lg-2 form-group">
                          	    <div style="text-align: center;width: 120px;height: 120px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="viewOutletsuppliereport('salesReportSupplierSales','0','','');" title="Sales Vs Procurment">
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
                          

                          
                              <c:forEach var="accessControl" items="${sessionScope.outletSalesReports}">
	                          <c:if test="${accessControl.appSubDocument == 'OutletSalesVoidReport'}">
                            <div class="col-lg-2 form-group">
                          	    <div style="text-align: center;width: 120px;height: 120px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="viewOutletVoidReport('outletVoidReport','0','');" title="Void Item Report">
                          			<img src="${pageContext.request.contextPath}/images/imagentavl.png" style="margin-top: -30px; padding: 34px 12px 0px 59px; margin-left: -33%;"><br><br>
                          			<span>Void Item Report</span>
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
                          
	                        
	                         <c:forEach var="accessControl" items="${sessionScope.outletSalesReports}">
	                          <c:if test="${accessControl.appSubDocument == 'OutletSalesItemWiseGST'}">
                            <div class="col-lg-2 form-group">
                          	    <div style="text-align: center;width: 120px;height: 120px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="viewItemWiseTaxGSTReport('ItemTaxGSTReport','0','false','')" title="Item Wise Gst Report">
                          			<img src="${pageContext.request.contextPath}/images/imagentavl.png" style="margin-top: -30px; padding: 34px 12px 0px 59px; margin-left: -33%;"><br><br>
                          			<span>Item Wise Gst Report</span>
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
                          
                          
                              <c:forEach var="accessControl" items="${sessionScope.outletSalesReports}">
	                          <c:if test="${accessControl.appSubDocument == 'OutletSalesCreditNoteReport'}">
                            <div class="col-lg-2 form-group">
                          	    <div style="text-align: center;width: 120px;height: 120px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="viewOutletCreditNoteReport('outletCreditNoteReport','0','false','')" title="Credit Note Report">
                          			<img src="${pageContext.request.contextPath}/images/imagentavl.png" style="margin-top: -30px; padding: 34px 12px 0px 59px; margin-left: -33%;"><br><br>
                          			<span>Credit Note Report</span>
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
                          
                          
                           <c:forEach var="accessControl" items="${sessionScope.outletSalesReports}">
	                          <c:if test="${accessControl.appSubDocument == 'OutletSalesCreditNoteRedeemReport'}">
                            <div class="col-lg-2 form-group">
                          	    <div style="text-align: center;width: 120px;height: 120px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="viewOutletCreditNoteRedemptionReport('outletCreditNoteRedeemReport','0','false','')" title="Credit Note Redeem">
                          			<img src="${pageContext.request.contextPath}/images/imagentavl.png" style="margin-top: -30px; padding: 34px 12px 0px 59px; margin-left: -33%;"><br><br>
                          			<span>Credit Note Redeem</span>
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
                          
                          
                              
                           <c:forEach var="accessControl" items="${sessionScope.outletSalesReports}">
	                          <c:if test="${accessControl.appSubDocument == 'OutletSalesTax'}">
                            <div class="col-lg-2 form-group">
                          	    <div style="text-align: center;width: 120px;height: 120px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="viewSalesReportsCriteriaWise('salesReportTaxWise','tax','');" title="Tax">
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
                          
                          
                            <c:forEach var="accessControl" items="${sessionScope.outletSalesReports}">
	                          <c:if test="${accessControl.appSubDocument == 'OutletSalesTenderWiseSales'}">
                            <div class="col-lg-2 form-group">
                          	    <div style="text-align: center;width: 120px;height: 120px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="viewTenderWiseSales('tenderWiseSales','0','');" title="Tenderwise Sales">
                          			<img src="${pageContext.request.contextPath}/images/imagentavl.png" style="margin-top: -30px; padding: 34px 12px 0px 59px; margin-left: -33%;"><br><br>
                          			<span>Tenderwise Sales</span>
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
                          
                          
                           <c:forEach var="accessControl" items="${sessionScope.outletSalesReports}">
	                          <c:if test="${accessControl.appSubDocument == 'OutletSalesManSales'}">
                            <div class="col-lg-2 form-group">
                          	    <div style="text-align: center;width: 120px;height: 120px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="viewSalesmanCommission('outletSalesmanCommission','0','false','');" title="Sales Man Daywise">
                          			<img src="${pageContext.request.contextPath}/images/imagentavl.png" style="margin-top: -30px; padding: 34px 12px 0px 59px; margin-left: -33%;"><br><br>
                          			<span>Sales Man Daywise</span>
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
	                          
                           <c:forEach var="accessControl" items="${sessionScope.outletSalesReports}">
	                          <c:if test="${accessControl.appSubDocument == 'OutletSalesMenSales'}">
                            <div class="col-lg-2 form-group">
                          	    <div style="text-align: center;width: 120px;height: 120px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="viewNewSalesmanCommission('outletSalesmenSalesCommission','0','false','');" title="Sales Man Itemwise">
                          			<img src="${pageContext.request.contextPath}/images/imagentavl.png" style="margin-top: -30px; padding: 34px 12px 0px 59px; margin-left: -33%;"><br><br>
                          			<span>Sales Man Itemwise</span>
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
                          
                             <c:forEach var="accessControl" items="${sessionScope.outletSalesReports}">
	                          <c:if test="${accessControl.appSubDocument == 'OutletSalesMenSales'}">
                            <div class="col-lg-2 form-group">
                          	    <div style="text-align: center;width: 120px;height: 120px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="viewSerialBillSalesReports('serialBillSales','0','','');" title="Bill Report">
                          			<img src="${pageContext.request.contextPath}/images/imagentavl.png" style="margin-top: -30px; padding: 34px 12px 0px 59px; margin-left: -33%;"><br><br>
                          			<span>Bill Report</span>
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
                          
                            <c:forEach var="accessControl" items="${sessionScope.outletSalesReports}">
	                          <c:if test="${accessControl.appSubDocument == 'OutletSalesCouponReport'}">
                            <div class="col-lg-2 form-group">
                          	    <div style="text-align: center;width: 120px;height: 120px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="viewSalesCouponReports('salesCouponIssueId','0','','');" title="Coupon Report">
                          			<img src="${pageContext.request.contextPath}/images/imagentavl.png" style="margin-top: -30px; padding: 34px 12px 0px 59px; margin-left: -33%;"><br><br>
                          			<span>Coupon Report</span>
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
                          
                             <c:forEach var="accessControl" items="${sessionScope.outletSalesReports}">
	                          <c:if test="${accessControl.appSubDocument == 'OutletSalesVoucherReport'}">
                            <div class="col-lg-2 form-group">
                          	    <div style="text-align: center;width: 120px;height: 120px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="viewSalesVoucherReports('salesVoucherIssueId','0','','');" title="Voucher Report">
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
                          
                            <c:forEach var="accessControl" items="${sessionScope.outletSalesReports}">
	                          <c:if test="${accessControl.appSubDocument == 'OutletSalesPersonWiseReport'}">
                            <div class="col-lg-2 form-group">
                          	    <div style="text-align: center;width: 120px;height: 120px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="viewDeliveryPersonWiseReports('PersonWiseReportId','0','','');" title="Delivery PersonWise Report">
                          			<img src="${pageContext.request.contextPath}/images/imagentavl.png" style="margin-top: -30px; padding: 34px 12px 0px 59px; margin-left: -33%;"><br><br>
                          			<span>Delivery PersonWise Report</span>
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
                          
                             <c:forEach var="accessControl" items="${sessionScope.outletSalesReports}">
	                          <c:if test="${accessControl.appSubDocument == 'OutletSalesCashierEfficiencyReport'}">
                            <div class="col-lg-2 form-group">
                          	    <div style="text-align: center;width: 120px;height: 120px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="viewOutletCashierEfficiencyReport('outletCashierEfficiencyReport','0','false','')" title="Cashier Effeciency">
                          			<img src="${pageContext.request.contextPath}/images/imagentavl.png" style="margin-top: -30px; padding: 34px 12px 0px 59px; margin-left: -33%;"><br><br>
                          			<span>Cashier Effeciency</span>
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
                          
                            <c:forEach var="accessControl" items="${sessionScope.outletSalesReports}">
	                        <c:if test="${accessControl.appSubDocument == 'OutletSalesPriceChangeReport'}">
                            <div class="col-lg-2 form-group">
                          	    <div style="text-align: center;width: 120px;height: 120px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="viewOutletPriceChangeReport('outletPriceChangeReport','0','','','clear','')" title="<spring:message code="price.change.report.label" />">
                          			<img src="${pageContext.request.contextPath}/images/imagentavl.png" style="margin-top: -30px; padding: 34px 12px 0px 59px; margin-left: -33%;"><br><br>
                          			<span><spring:message code="price.change.report.label" /></span>
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
                          
                         <c:forEach var="accessControl" items="${sessionScope.outletSalesReports}">
	                       <c:if test="${accessControl.appSubDocument == 'OutletSalesCashierShortageReport'}">
                            <div class="col-lg-2 form-group">
                          	    <div style="text-align: center;width: 120px;height: 120px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="viewCashierShortageReport('cashierShortageReport','0','','clear','')" title="<spring:message code="cashier.shortage.report.label" />">
                          			<img src="${pageContext.request.contextPath}/images/imagentavl.png" style="margin-top: -30px; padding: 34px 12px 0px 59px; margin-left: -33%;"><br><br>
                          			<span><spring:message code="cashier.shortage.report.label" /></span>
                          		</div>
                          	</div>
                          	<c:set var="counts" value="${counts+1}" />
                          	</c:if>
                          </c:forEach>
                          
                         <c:if test="${ counts==5 || counts==10 || counts == 35 || counts == 20 || counts == 25}">
                          		<div class="col-lg-2 form-group" style="text-align: right;">
                          		</div>
                          	<div class="row"></div>
                         </c:if> 
                          
                          <c:forEach var="accessControl" items="${sessionScope.outletSalesReports}">
	                      <c:if test="${accessControl.appSubDocument == 'OutletSalesStandardSalesReport'}">
                            <div class="col-lg-2 form-group">
                          	    <div style="text-align: center;width: 120px;height: 120px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="viewStandardSalesReport('standardSalesReport','0','','clear','')" title="Standard Sales">
                          			<img src="${pageContext.request.contextPath}/images/imagentavl.png" style="margin-top: -30px; padding: 34px 12px 0px 59px; margin-left: -33%;"><br><br>
                          			<span>Standard Sales</span>
                          		</div>
                          	</div>
                          	<c:set var="counts" value="${counts+1}" />
                          	</c:if>
                          </c:forEach>
                          
                          
                         <c:forEach var="accessControl" items="${sessionScope.outletSalesReports}">
	                       <c:if test="${accessControl.appSubDocument == 'OutletSalesStandardSalesDetailedReport'}">
                            <div class="col-lg-2 form-group">
                          	    <div style="text-align: center;width: 120px;height: 120px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="viewStandardSalesDetailedReport('standardSalesDetailedReport','0','','clear','')" title="Standard Sales Detailed">
                          			<img src="${pageContext.request.contextPath}/images/imagentavl.png" style="margin-top: -30px; padding: 34px 12px 0px 59px; margin-left: -33%;"><br><br>
                          			<span>Standard Sales Detailed</span>
                          		</div>
                          	</div>
                          	<c:set var="counts" value="${counts+1}" />
                          	</c:if>
                          </c:forEach>
                          
                          <c:forEach var="accessControl" items="${sessionScope.outletSalesReports}">
	                      <c:if test="${accessControl.appSubDocument == 'EventsDashboardReport'}">
                            <div class="col-lg-2 form-group">
                          	    <div style="text-align: center;width: 120px;height: 120px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="viewEventsSummaryReport('eventsSummaryReport','0','outlet');" title=" Events Dashboard">
                          			<img src="${pageContext.request.contextPath}/images/imagentavl.png" style="margin-top: -30px; padding: 34px 12px 0px 59px; margin-left: -33%;"><br><br>
                          			<span> Events Dashboard</span>
                          		</div>
                          	</div>
                          	<c:set var="counts" value="${counts+1}" />
                          	</c:if>
                          </c:forEach>
                          
                          <c:forEach var="accessControl" items="${sessionScope.outletSalesReports}">
	                         <c:if test="${accessControl.appSubDocument == 'EventsSummaryReport'}">
                            <div class="col-lg-2 form-group">
                          	    <div style="text-align: center;width: 120px;height: 120px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="viewEventsReport('eventsReport','0','outlet');" title="Events Summary">
                          			<img src="${pageContext.request.contextPath}/images/imagentavl.png" style="margin-top: -30px; padding: 34px 12px 0px 59px; margin-left: -33%;"><br><br>
                          			<span> Events Summary</span>
                          		</div>
                          	</div>
                          	<c:set var="counts" value="${counts+1}" />
                          	</c:if>
                          </c:forEach>
                          
                         	<c:forEach var="accessControl" items="${sessionScope.outletSalesReports}">
	                        <c:if test="${accessControl.appSubDocument == 'BillWiseReport'}">
                            <div class="col-lg-2 form-group">
                          	    <div style="text-align: center;width: 120px;height: 120px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="viewBillWiseReport('billWiseReport','0','outlet');" title="Bill Wise">
                          			<img src="${pageContext.request.contextPath}/images/imagentavl.png" style="margin-top: -30px; padding: 34px 12px 0px 59px; margin-left: -33%;"><br><br>
                          			<span>Bill Wise</span>
                          		</div>
                          	</div>
                          	<c:set var="counts" value="${counts+1}" />
                          	</c:if>
                          </c:forEach>
                 
                        
        </c:if>                
                          
</body>
</html>