<!--/*
 * Project Name 	        : OmniRetailerCustomer
 * Written By		        : Sahitya
 * file name		        : Inventory Manager/Reports/showoutletReports.jsp
 * file type		        : JSP
 * description				: display outlet reports information
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
                         <br/>
                          <c:if test="${sessionScope.role == 'super admin'}">
                          	<div class="row">
                          		<div class="col-lg-2 form-group" style="text-align: right;">
	                          		<div style="text-align: center;width: 140px;height: 130px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="showOutletSalesReportsFlows('outletSalesReports');" title="<spring:message code="sales.reports.label" />">
	                          			<img src="${pageContext.request.contextPath}/images/sales-counter.png" style="margin-top: 10px;"><br><br>
	                          			<span><spring:message code="sales.reports.label" /></span>
	                          		</div>
	                          	</div>
	                          	<div class="col-lg-2 form-group" style="text-align: right;">
	                          	 <div style="text-align: center;width: 140px;height: 130px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="viewOMOrders('outletOrdersReport');" title="<spring:message code="orders.reports.label" />">
	                          			<img src="${pageContext.request.contextPath}/images/order-reports.png" style="margin-top: 10px;"><br><br>
	                          			<span><spring:message code="orders.reports.label" /></span>
	                              </div>
	                          	 </div>
	                          	<div class="col-lg-2 form-group" style="text-align: right;">
	                          	 <div style="text-align: center;width: 140px;height: 130px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="viewOMStockReports('outletStocksReport');" title="<spring:message code="stocks.reports.label" />">
	                          			<img src="${pageContext.request.contextPath}/images/stock-reports.png" style="margin-top: 10px;"><br><br>
	                          			<span><spring:message code="stocks.reports.label" /></span>
	                              </div>
	                          	</div>
	                          	<div class="col-lg-2 form-group" style="text-align: right;">
	                          	 <div style="text-align: center;width: 140px;height: 130px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="viewOMPurchases('outletPurchasesReport')" title="<spring:message code="purchases.reports.label" />">
	                          			<img src="${pageContext.request.contextPath}/images/purchase-reports.png" style="margin-top: 10px;"><br><br>
	                          			<span><spring:message code="purchases.reports.label" /></span>
	                              </div>
	                          	 </div>
	                          	 <div class="col-lg-2 form-group" style="text-align: right;">
	                          	 <div style="text-align: center;width: 140px;height: 130px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="viewOMShipments('outletShipmentsReport','0','','false');" title="<spring:message code="shipments.reports.label" />">
	                          			<img src="${pageContext.request.contextPath}/images/shipment-reports.png" style="margin-top: 10px;"><br><br>
	                          			<span><spring:message code="shipments.reports.label" /></span>
	                              </div>
	                          	 </div>
	                          	  <div class="col-lg-2 form-group" style="text-align: right;"></div>
	                          </div>
	                          
	                          <div class="row">
                          		<div class="col-lg-2 form-group" style="text-align: right;">
	                          		<div style="text-align: center;width: 140px;height: 130px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="viewWasteManagement('outletWasteManagementReport')" title="<spring:message code="waste_management.reports.label" />">
	                          			<img src="${pageContext.request.contextPath}/images/waste-management.png" style="margin-top: 10px;"><br><br>
	                          			<span><spring:message code="waste_management.reports.label" /></span>
	                          		</div>
	                          	</div>
	                          	<div class="col-lg-2 form-group" style="text-align: right;">
	                          	 <div style="text-align: center;width: 140px;height: 130px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="viewExpiryManagement('outletExpiryManagementReport')" title="<spring:message code="expiry_management.reports.label" />">
	                          			<img src="${pageContext.request.contextPath}/images/expiry-management.png" style="margin-top: 10px;"><br><br>
	                          			<span><spring:message code="expiry_management.reports.label" /></span>
	                              </div>
	                          	 </div>
	                          	<div class="col-lg-2 form-group" style="text-align: right;">
	                          	 <div style="text-align: center;width: 140px;height: 130px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="viewFinancial('outletFinancialReport')" title="<spring:message code="financial.reports.label" />">
	                          			<img src="${pageContext.request.contextPath}/images/financial-reports.png" style="margin-top: 10px;"><br><br>
	                          			<span><spring:message code="financial.reports.label" /></span>
	                              </div>
	                          	</div>
	                          	<div class="col-lg-2 form-group" style="text-align: right;">
	                          	 <div style="text-align: center;width: 140px;height: 130px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="vviewOutletStockVerificationReport('outletStockVerificationReport','0');" title="<spring:message code="stock.verification.label" />">
	                          			<img src="${pageContext.request.contextPath}/images/StockVerificationReport.png" style="margin-top: 10px;"><br><br>
	                          			<span><spring:message code="stock.verification.label" /></span>
	                              </div>
	                          	 </div>
	                          	 <div class="col-lg-2 form-group" style="text-align: right;">
	                          	 <div style="text-align: center;width: 140px;height: 130px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="viewOMDealsAndOffers('dealsReports')" title="<spring:message code="deals.label" /> <spring:message code="and.label" /> <spring:message code="offers.label" />">
	                          			<img src="${pageContext.request.contextPath}/images/DealsReports.png" style="margin-top: 10px;"><br><br>
	                          			<span><spring:message code="deals.label" /> <spring:message code="and.label" /> <spring:message code="offers.label" /></span>
	                              </div>
	                          	 </div>
	                          	  <div class="col-lg-2 form-group" style="text-align: right;"></div>
	                          </div>
	                          
	                          <div class="row">
                          		<div class="col-lg-2 form-group" style="text-align: right;">
	                          		<div style="text-align: center;width: 140px;height: 130px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="viewOMCRM('loyaltyProgramReports')" title="<spring:message code="loyaltyprogram.label" />">
	                          			<img src="${pageContext.request.contextPath}/images/Loyalty Reports.png" style="margin-top: 10px;"><br><br>
	                          			<span><spring:message code="loyaltyprogram.label" /></span>
	                          		</div>
	                          	</div>
	                         </div>
	                         
	                          <div class="col-lg-2 form-group" style="text-align: right;">
	                          		<div style="text-align: center;width: 140px;height: 130px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="viewprofitabilityReports('salesReportProfitabilityReport','0','');" title="Profitablity Report">
	                          			<img src="${pageContext.request.contextPath}/images/imagentavl.png" style="margin-top: -30px; padding: 34px 12px 0px 59px; margin-left: -33%;"><br><br>
	                          			<span>Profitablity Report</span>
	                          		</div>
	                          	</div>
	                          	
	                          	<div class="col-lg-2 form-group" style="text-align: right;">
	                          		<div style="text-align: center;width: 140px;height: 130px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="viewdsrReports('salesDsrReport','0','DAILY','false');" title="DSR REPORT">
	                          			<img src="${pageContext.request.contextPath}/images/imagentavl.png" style="margin-top: -30px; padding: 34px 12px 0px 59px; margin-left: -33%;"><br><br>
	                          			<span>DSR REPORT</span>
	                          		</div>
	                          	</div>
	                          	
	                          	<div class="col-lg-2 form-group" style="text-align: right;">
	                          		<div style="text-align: center;width: 140px;height: 130px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="viewNewProfitabilityReports('salesReportnewProfitabilityReport','0','');" title="Product Dissection Report">
	                          			<img src="${pageContext.request.contextPath}/images/imagentavl.png" style="margin-top: -30px; padding: 34px 12px 0px 59px; margin-left: -33%;"><br><br>
	                          			<span>Product Dissection Report</span>
	                          		</div>
	                          	</div>
	                          	
	                          	<div class="col-lg-2 form-group" style="text-align: right;">
	                          		<div style="text-align: center;width: 140px;height: 130px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="showStockReportsFlow('outletStockReprts');" title="Stock Report">
	                          			<img src="${pageContext.request.contextPath}/images/imagentavl.png" style="margin-top: -30px; padding: 34px 12px 0px 59px; margin-left: -33%;"><br><br>
	                          			<span>Stock Report</span>
	                          		</div>
	                          	</div>
                          </c:if>
                      <c:set var="counts" value="0" />
                     <c:if test="${sessionScope.role != 'super admin'}">
                     	<div class="row">
                           <c:forEach var="accessControl" items="${sessionScope.outletSalesReports}" varStatus="theCount">
	                            <c:if test="${theCount.count == 1}">
	                            	<c:set var="salesReport" value="true"/>
		                          	<div class="col-lg-2 form-group" style="text-align: right;">
		                          		<div style="text-align: center;width: 140px;height: 130px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="showOutletSalesReportsFlows('outletSalesReports','');" title="<spring:message code="sales.reports.label" />">
		                          			<img src="${pageContext.request.contextPath}/images/sales-counter.png" style="margin-top: 10px;"><br><br>
		                          			<span><spring:message code="sales.reports.label" /></span>
		                          		</div>
		                          	</div>
		                          	<c:set var="counts" value="${counts+1}" />
                          		</c:if>
                          	</c:forEach>
                         <c:forEach var="accessControl" items="${sessionScope.outletOtherReports}">
	                           <c:if test="${accessControl.appDocument == 'OutletOrdersReports'}">
                          		<div class="col-lg-2 form-group" style="text-align: right;">
		                          	 <div style="text-align: center;width: 140px;height: 130px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="viewOMOrders('outletOrdersReport');" title="<spring:message code="orders.reports.label" />">
		                          			<img src="${pageContext.request.contextPath}/images/order-reports.png" style="margin-top: 10px;"><br><br>
		                          			<span><spring:message code="orders.reports.label" /></span>
		                              </div>
	                          	 </div>
	                          	 <c:set var="counts" value="${counts+1}" />
                          	 </c:if>
                          </c:forEach>
                           <c:forEach var="accessControl" items="${sessionScope.outletOtherReports}">
	                          <c:if test="${accessControl.appDocument == 'OutletStockReports'}">
                          	 <div class="col-lg-2 form-group" style="text-align: right;">
	                          	 <div style="text-align: center;width: 140px;height: 130px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="viewOMStockReports('outletStocksReport');" title="<spring:message code="stocks.reports.label" />">
	                          			<img src="${pageContext.request.contextPath}/images/stock-reports.png" style="margin-top: 10px;"><br><br>
	                          			<span><spring:message code="stocks.reports.label" /></span>
	                              </div>
	                          	</div>
	                          	<c:set var="counts" value="${counts+1}" />
                          	 </c:if>
                          </c:forEach>
                           <c:forEach var="accessControl" items="${sessionScope.outletOtherReports}">
	                          <c:if test="${accessControl.appDocument == 'OutletPurchaseReports'}">
                          	 <div class="col-lg-2 form-group" style="text-align: right;">
	                          	 <div style="text-align: center;width: 140px;height: 130px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="viewOMPurchases('outletPurchasesReport')" title="<spring:message code="purchases.reports.label" />">
	                          			<img src="${pageContext.request.contextPath}/images/purchase-reports.png" style="margin-top: 10px;"><br><br>
	                          			<span><spring:message code="purchases.reports.label" /></span>
	                              </div>
	                         </div>
	                         <c:set var="counts" value="${counts+1}" />
                          </c:if>
                         </c:forEach>
                         <c:forEach var="accessControl" items="${sessionScope.outletGRNReports}">
	                         <c:if test="${accessControl.appSubDocument == 'OutletShipmentReports'}">
                          		<div class="col-lg-2 form-group" style="text-align: right;">
	                          	 <div style="text-align: center;width: 140px;height: 130px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="showShipmentsFlow('outletGRNReports');" title="<spring:message code="shipments.reports.label" />">
	                          			<img src="${pageContext.request.contextPath}/images/shipment-reports.png" style="margin-top: 10px;"><br><br>
	                          			<span><spring:message code="shipments.reports.label" /></span>
	                              </div>
	                          	 </div>
	                          	 <c:set var="counts" value="${counts+1}" />
                          	</c:if>
                         </c:forEach>
                         
                         <div class="row"></div>
                         
                         
                         <c:forEach var="accessControl" items="${sessionScope.outletOtherReports}">
	                        <c:if test="${accessControl.appDocument == 'OutletWasteReports'}">
                          	<div class="col-lg-2 form-group" style="text-align: right;">
	                          		<div style="text-align: center;width: 140px;height: 130px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="viewWasteManagement('outletWasteManagementReport')" title="<spring:message code="waste_management.reports.label" />">
	                          			<img src="${pageContext.request.contextPath}/images/waste-management.png" style="margin-top: 10px;"><br><br>
	                          			<span><spring:message code="waste_management.reports.label" /></span>
	                          		</div>
	                          	</div>
	                          	 <c:set var="counts" value="${counts+1}" />
                          </c:if>
                        </c:forEach>
                        
                       
                        
                          <c:forEach var="accessControl" items="${sessionScope.outletOtherReports}">
	                         <c:if test="${accessControl.appDocument == 'OutletExpiryReports'}">
                          	 <div class="col-lg-2 form-group" style="text-align: right;">
	                          	 <div style="text-align: center;width: 140px;height: 130px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="viewExpiryManagement('outletExpiryManagementReport')" title="<spring:message code="expiry_management.reports.label" />">
	                          			<img src="${pageContext.request.contextPath}/images/expiry-management.png" style="margin-top: 10px;"><br><br>
	                          			<span><spring:message code="expiry_management.reports.label" /></span>
	                              </div>
	                          	 </div>
	                          	  <c:set var="counts" value="${counts+1}" />
                          	 </c:if>
                         </c:forEach>
                         
                        <%--  <c:if test="${counts == 5}">
                          		<div class="col-lg-2 form-group" style="text-align: right;"></div>
                          		</div>
                          	<div class="row">
                         </c:if> --%>
                         
                          <c:forEach var="accessControl" items="${sessionScope.outletOtherReports}">
	                         <c:if test="${accessControl.appDocument == 'OutletFinancialReports'}">
                          	 <div class="col-lg-2 form-group" style="text-align: right;">
	                          	 <div style="text-align: center;width: 140px;height: 130px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="viewFinancial('outletFinancialReport');" title="<spring:message code="financial.reports.label" />">
	                          			<img src="${pageContext.request.contextPath}/images/financial-reports.png" style="margin-top: 10px;"><br><br>
	                          			<span><spring:message code="financial.reports.label" /></span>
	                              </div>
	                          	</div>
	                          	 <c:set var="counts" value="${counts+1}" />
                          </c:if>
                        </c:forEach>
                        
                       
                        
                        <c:forEach var="accessControl" items="${sessionScope.outletOtherReports}">
	                         <c:if test="${accessControl.appDocument == 'OutletStockVerificationReports'}">
                          	 <div class="col-lg-2 form-group" style="text-align: right;">
	                          	 <div style="text-align: center;width: 140px;height: 130px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="viewOutletStockVerificationReport('outletStockVerificationReport','0');" title="<spring:message code="stock.verification.label" />">
	                          			<img src="${pageContext.request.contextPath}/images/StockVerificationReport.png" style="margin-top: 10px;"><br><br>
	                          			<span><spring:message code="stock.verification.label" /></span>
	                              </div>
	                          	 </div>
	                          	  <c:set var="counts" value="${counts+1}" />
                          </c:if>
                        </c:forEach>
                        
                       
                        
                        <c:forEach var="accessControl" items="${sessionScope.outletOtherReports}">
	                         <c:if test="${accessControl.appDocument == 'OutletDealsAndOffersReports'}">
                          	 <div class="col-lg-2 form-group" style="text-align: right;">
	                          	 <div style="text-align: center;width: 140px;height: 130px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="viewOMDealsAndOffers('dealsReports')" title="<spring:message code="deals.label" /> <spring:message code="and.label" /> <spring:message code="offers.label" />">
	                          			<img src="${pageContext.request.contextPath}/images/DealsReports.png" style="margin-top: 10px;"><br><br>
	                          			<span><spring:message code="deals.label" /> <spring:message code="and.label" /> <spring:message code="offers.label" /></span>
	                              </div>
	                          	 </div>
	                          	  <c:set var="counts" value="${counts+1}" />
                          </c:if>
                        </c:forEach>
                        
                       
                         
                          <div class="row"></div>
                         
                         
                        
                        <c:forEach var="accessControl" items="${sessionScope.outletOtherReports}">
	                         <c:if test="${accessControl.appDocument == 'OutletCRMReports'}">
                          	 <div class="col-lg-2 form-group" style="text-align: right;">
	                          		<div style="text-align: center;width: 140px;height: 130px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="viewOMCRM('loyaltyProgramReports')" title="<spring:message code="loyaltyprogram.label" />">
	                          			<img src="${pageContext.request.contextPath}/images/Loyalty Reports.png" style="margin-top: 10px;"><br><br>
	                          			<span><spring:message code="loyaltyprogram.label" /></span>
	                          		</div>
	                          	</div>
                          </c:if>
                        </c:forEach>
                     
                          
                           <c:forEach var="accessControl" items="${sessionScope.outletOtherReports}">
	                         <c:if test="${accessControl.appDocument == 'OutletProfitabilityReports'}">
                          	 <div class="col-lg-2 form-group" style="text-align: right;">
	                          		<div style="text-align: center;width: 140px;height: 130px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="viewprofitabilityReports('salesReportProfitabilityReport','0','');" title="Profitablity Report">
	                          			<img src="${pageContext.request.contextPath}/images/imagentavl.png" style="margin-top: -30px; padding: 34px 12px 0px 59px; margin-left: -33%;"><br><br>
	                          			<span>Profitablity Report</span>
	                          		</div>
	                          	</div>
                          </c:if>
                        </c:forEach>
                        
                          
                           <c:forEach var="accessControl" items="${sessionScope.outletOtherReports}">
	                         <c:if test="${accessControl.appDocument == 'OutletDSRReports'}">
                          	 <div class="col-lg-2 form-group" style="text-align: right;">
	                          		<div style="text-align: center;width: 140px;height: 130px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="viewdsrReports('salesDsrReport','0','DAILY','false');" title="DSR REPORT">
	                          			<img src="${pageContext.request.contextPath}/images/imagentavl.png" style="margin-top: -30px; padding: 34px 12px 0px 59px; margin-left: -33%;"><br><br>
	                          			<span>DSR REPORT</span>
	                          		</div>
	                          	</div>
                          </c:if>
                        </c:forEach>
                        
                         
                           <c:forEach var="accessControl" items="${sessionScope.outletOtherReports}">
	                         <c:if test="${accessControl.appDocument == 'OutletProfitabilityReports'}">
                          	 <div class="col-lg-2 form-group" style="text-align: right;">
	                          		<div style="text-align: center;width: 140px;height: 130px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="viewNewProfitabilityReports('salesReportnewProfitabilityReport','0','');" title="Product Dissection Report">
	                          			<img src="${pageContext.request.contextPath}/images/imagentavl.png" style="margin-top: -30px; padding: 34px 12px 0px 59px; margin-left: -33%;"><br><br>
	                          			<span>Product Dissection Report</span>
	                          		</div>
	                          	</div>
                          </c:if>
                        </c:forEach>
                         <c:set var="outletStockExpReprtsAdded" value="false"/> 
                         <c:forEach var="accessControl" items="${sessionScope.outletOtherReports}">
	                         <c:if test="${accessControl.appDocument == 'OutletProfitabilityReports'}">
                          	 <div class="col-lg-2 form-group" style="text-align: right;">
	                          		<div style="text-align: center;width: 140px;height: 130px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="showStockReportsFlow('outletStockReprts');" title="Stock Report">
	                          			<img src="${pageContext.request.contextPath}/images/imagentavl.png" style="margin-top: -30px; padding: 34px 12px 0px 59px; margin-left: -33%;"><br><br>
	                          			<span>Stock Report</span>
	                          		</div>
	                          	</div>
                          </c:if>
                        </c:forEach>
                         <div class="row"></div>
                    </div></c:if>    
                     
</body>
</html>