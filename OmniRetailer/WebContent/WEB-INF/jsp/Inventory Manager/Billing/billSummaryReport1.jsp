<%-- <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%> --%>
    <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    <%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <!DOCTYPE html>
<html>
<head>
<!-- <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1"> -->
<title>Insert title here</title>
<%-- <link href="${pageContext.request.contextPath}/css/datatables/dataTables.bootstrap.css" rel="stylesheet" type="text/css" /> --%>
</head>
<body>
<%-- <div class="row">
	<div class="col-lg-12" style="text-align: center;">
		<label>${billSummaryReport.store_location}  (${billSummaryReport.startDate} - ${billSummaryReport.endDate})</label>
	</div>
</div> --%>
<div class="row" style="padding-bottom: 7px;">
	<div class="col-lg-6 col-sm-6 col-xs-6" style="">
		<div class="col-lg-8 col-sm-8 col-xs-8" style="padding-left: 10%;">
			<label><spring:message code="total.bills.label" /> </label>
		</div>
		<div class="col-lg-1 col-sm-1 col-xs-1"><label>:</label></div>
		<div class="col-lg-2 col-sm-2 col-xs-2" style="">
			<label>${billSummaryReport.salesReports}</label>
		</div>
	</div>
	<div class="col-lg-6 col-sm-6 col-xs-6" style="">
		<div class="col-lg-8 col-sm-8 col-xs-8" style="padding-left: 10%;">
			<label><spring:message code="total.bills.amount.label" /> </label>
		</div>
		<div class="col-lg-1 col-sm-1 col-xs-1"><label>:</label></div>
		<div class="col-lg-2 col-sm-2 col-xs-2" style="">
			<label>${billSummaryReport.sales}</label>
		</div>
	</div>
</div>
<div class="row" style="padding-bottom: 7px;">
	<div class="col-lg-6 col-sm-6 col-xs-6" style="">
		<div class="col-lg-8 col-sm-8 col-xs-8" style="padding-left: 10%;">
			<label><spring:message code="total.tax.amount.label" /> </label>
		</div>
		<div class="col-lg-1 col-sm-1 col-xs-1"><label>:</label></div>
		<div class="col-lg-2 col-sm-2 col-xs-2" style="">
			<label>${billSummaryReport.tax}</label>
		</div>
	</div>
	<div class="col-lg-6 col-sm-6 col-xs-6" style="">
		<div class="col-lg-8 col-sm-8 col-xs-8" style="padding-left: 10%;">
			<label><spring:message code="total.cash.payments.label" /> </label>
		</div>
		<div class="col-lg-1 col-sm-1 col-xs-1"><label>:</label></div>
		<div class="col-lg-2 col-sm-2 col-xs-2" style="">
			<label>${billSummaryReport.cashTotal}</label>
		</div>
	</div>
</div>
<div class="row" style="padding-bottom: 7px;">
	<div class="col-lg-6 col-sm-6 col-xs-6" style="">
		<div class="col-lg-8 col-sm-8 col-xs-8" style="padding-left: 10%;">
			<label><spring:message code="total.card.payments.label" /> </label>
		</div>
		<div class="col-lg-1 col-sm-1 col-xs-1"><label>:</label></div>
		<div class="col-lg-2 col-sm-2 col-xs-2" style="">
			<label>${billSummaryReport.cardTotal}</label>
		</div>
	</div>
	<div class="col-lg-6 col-sm-6 col-xs-6" style="">
		<div class="col-lg-8 col-sm-8 col-xs-8" style="padding-left: 10%;">
			<label><spring:message code="total.coupon.payments.label" /> </label>
		</div>
		<div class="col-lg-1 col-sm-1 col-xs-1"><label>:</label></div>
		<div class="col-lg-2 col-sm-2 col-xs-2" style="">
			<label>${billSummaryReport.coupons}</label>
		</div>
	</div>
</div>
<div class="row" style="padding-bottom: 7px;">
	<div class="col-lg-6 col-sm-6 col-xs-6" style="">
		<div class="col-lg-8 col-sm-8 col-xs-8" style="padding-left: 10%;">
			<label><spring:message code="total.gift.voucher.payments.label" /> </label>
		</div>
		<div class="col-lg-1 col-sm-1 col-xs-1"><label>:</label></div>
		<div class="col-lg-2 col-sm-2 col-xs-2" style="">
			<label>${billSummaryReport.giftVouchers}</label>
		</div>
	</div>
	<div class="col-lg-6 col-sm-6 col-xs-6" style="">
		<div class="col-lg-8 col-sm-8 col-xs-8" style="padding-left: 10%;">
			<label><spring:message code="total.loyalty.claims.label" /> </label>
		</div>
		<div class="col-lg-1 col-sm-1 col-xs-1"><label>:</label></div>
		<div class="col-lg-2 col-sm-2 col-xs-2" style="">
			<label>${billSummaryReport.loyaltyPointsTotal}</label>
		</div>
	</div>
</div>
<div class="row" style="padding-bottom: 7px;">
	<div class="col-lg-6 col-sm-6 col-xs-6" style="">
		<div class="col-lg-8 col-sm-8 col-xs-8" style="padding-left: 10%;">
			<label><spring:message code="total.returns.label" /> </label>
		</div>
		<div class="col-lg-1 col-sm-1 col-xs-1"><label>:</label></div>
		<div class="col-lg-2 col-sm-2 col-xs-2" style="">
			<label>${billSummaryReport.noOfReturns}</label>
		</div>
	</div>
	<div class="col-lg-6 col-sm-6 col-xs-6" style="">
		<div class="col-lg-8 col-sm-8 col-xs-8" style="padding-left: 10%;">
			<label><spring:message code="total.return.amount.label" /> </label>
		</div>
		<div class="col-lg-1 col-sm-1 col-xs-1"><label>:</label></div>
		<div class="col-lg-2 col-sm-2 col-xs-2" style="">
			<label>${billSummaryReport.returnTotal}</label>
		</div>
	</div>
</div>
<div class="row" style="padding-bottom: 7px;">
	<div class="col-lg-6 col-sm-6 col-xs-6" style="">
		<div class="col-lg-8 col-sm-8 col-xs-8" style="padding-left: 10%;">
			<label><spring:message code="total.exchanges.label" /> </label>
		</div>
		<div class="col-lg-1 col-sm-1 col-xs-1"><label>:</label></div>
		<div class="col-lg-2 col-sm-2 col-xs-2" style="">
			<label>${billSummaryReport.noOfExchanges}</label>
		</div>
	</div>
	<div class="col-lg-6 col-sm-6 col-xs-6" style="">
		<div class="col-lg-8 col-sm-8 col-xs-8" style="padding-left: 10%;">
			<label><spring:message code="total.exchange.bills.amount.label" /> </label>
		</div>
		<div class="col-lg-1 col-sm-1 col-xs-1"><label>:</label></div>
		<div class="col-lg-2 col-sm-2 col-xs-2" style="">
			<label>${billSummaryReport.exchangeTotal}</label>
		</div>
	</div>
</div>
</body>
</html>