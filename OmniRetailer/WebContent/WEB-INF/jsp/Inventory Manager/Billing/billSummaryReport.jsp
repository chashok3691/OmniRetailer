<%-- <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%> --%>
    <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    <%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<div class="row" style="padding-bottom: 7px;font-size: 16px;">
	<div class="col-lg-6 col-sm-6 col-xs-6" style="">
		<div class="col-lg-8 col-sm-8 col-xs-8" style="padding-left: 10%;">
			<label style="font-weight: bold;"><spring:message code="total.bills.label" /> </label>
		</div>
		<div class="col-lg-1 col-sm-1 col-xs-1"><label style="font-weight: bold;">:</label></div>
		<div class="col-lg-2 col-sm-2 col-xs-2" style="">
			<label style="font-weight: bold;">${billSummaryReport.salesReports}</label>
		</div>
		<hr style="margin-top: 25px;width: 82%;margin-bottom: 7px;border-top: 1px solid rgb(127,127,127);" />
	</div>
	<div class="col-lg-6 col-sm-6 col-xs-6" style="">
		<div class="col-lg-8 col-sm-8 col-xs-8" style="padding-left: 10%;">
			<label style="font-weight: bold;"><spring:message code="total.bills.amount.label" /> </label>
		</div>
		<div class="col-lg-1 col-sm-1 col-xs-1"><label style="font-weight: bold;">:</label></div>
		<div class="col-lg-2 col-sm-2 col-xs-2" style="">
		<c:choose>
            <c:when test="${not empty billSummaryReport.sales}">
				<label style="font-weight: bold;">${billSummaryReport.sales}</label>
			</c:when>
            <c:otherwise>
				<label style="font-weight: bold;">0.0</label>
			</c:otherwise>
		</c:choose>
		</div>
		<hr style="margin-top: 25px;width: 82%;margin-bottom: 7px;border-top: 1px solid rgb(127,127,127);" />
	</div>
</div>
<div class="row" style="padding-bottom: 7px;">
	<div class="col-lg-6 col-sm-6 col-xs-6" style="">
		<div class="col-lg-8 col-sm-8 col-xs-8" style="padding-left: 10%;">
			1)&nbsp;&nbsp;<label><spring:message code="direct.point.of.sale.label" /> </label>
		</div>
		<div class="col-lg-1 col-sm-1 col-xs-1"><label>:</label></div>
		<div class="col-lg-2 col-sm-2 col-xs-2" style="">
			<label>${billSummaryReport.totalDirectOrders}</label>
		</div>
	</div>
	<div class="col-lg-6 col-sm-6 col-xs-6" style="">
		<div class="col-lg-8 col-sm-8 col-xs-8" style="padding-left: 10%;">
			<label><spring:message code="total.cash.payments.label" /> </label>
		</div>
		<div class="col-lg-1 col-sm-1 col-xs-1"><label>:</label></div>
		<div class="col-lg-2 col-sm-2 col-xs-2" style="">
		<c:choose>
            <c:when test="${not empty billSummaryReport.cashTotal}">
				<label style="font-weight: bold;">${billSummaryReport.cashTotal}</label>
			</c:when>
            <c:otherwise>
				<label style="font-weight: bold;">0.0</label>
			</c:otherwise>
		</c:choose>
		</div>
	</div>
</div>
<div class="row" style="padding-bottom: 7px;">
	<div class="col-lg-6 col-sm-6 col-xs-6" style="">
		<div class="col-lg-8 col-sm-8 col-xs-8" style="padding-left: 10%;">
			2)&nbsp;&nbsp;<label><spring:message code="telephonic.orders.label" /> </label>
		</div>
		<div class="col-lg-1 col-sm-1 col-xs-1"><label>:</label></div>
		<div class="col-lg-2 col-sm-2 col-xs-2" style="">
			<label>${billSummaryReport.totalTelephonicOrders}</label>
		</div>
	</div>
	<div class="col-lg-6 col-sm-6 col-xs-6" style="">
		<div class="col-lg-8 col-sm-8 col-xs-8" style="padding-left: 10%;">
			<label><spring:message code="total.online.payments.label" /> </label>
		</div>
		<div class="col-lg-1 col-sm-1 col-xs-1"><label>:</label></div>
		<div class="col-lg-2 col-sm-2 col-xs-2" style="">
		<c:choose>
            <c:when test="${not empty billSummaryReport.totalOnlineOrderAmt}">
				<label >${billSummaryReport.totalOnlineOrderAmt}</label>
			</c:when>
            <c:otherwise>
				<label >0.0</label>
			</c:otherwise>
		</c:choose>
			<%-- <label>${billSummaryReport.totalOnlineOrderAmt}</label> --%>
		</div>
	</div>
</div>
<div class="row" style="padding-bottom: 7px;">
	<div class="col-lg-6 col-sm-6 col-xs-6" style="">
		<div class="col-lg-8 col-sm-8 col-xs-8" style="padding-left: 10%;">
			3)&nbsp;&nbsp;<label><spring:message code="online.label" /> </label>
		</div>
		<div class="col-lg-1 col-sm-1 col-xs-1"><label>:</label></div>
		<div class="col-lg-2 col-sm-2 col-xs-2" style="">
			<label>${billSummaryReport.totalOnlineOrders}</label>
		</div>
	</div>
	<div class="col-lg-6 col-sm-6 col-xs-6" style="">
		<div class="col-lg-8 col-sm-8 col-xs-8" style="padding-left: 10%;">
			<label><spring:message code="total.card.payments.label" /> </label>
		</div>
		<div class="col-lg-1 col-sm-1 col-xs-1"><label>:</label></div>
		<div class="col-lg-2 col-sm-2 col-xs-2" style="">
		<c:choose>
            <c:when test="${not empty billSummaryReport.cardTotal}">
				<label >${billSummaryReport.cardTotal}</label>
			</c:when>
            <c:otherwise>
				<label >0.0</label>
			</c:otherwise>
		</c:choose>
			<%-- <label>${billSummaryReport.cardTotal}</label> --%>
		</div>
	</div> 
</div>
<div class="row" style="padding-bottom: 7px;">
	<div class="col-lg-6 col-sm-6 col-xs-6" style="">
		<div class="col-lg-8 col-sm-8 col-xs-8" style="padding-left: 10%;">
			4)&nbsp;&nbsp;<label><spring:message code="mobile.orders.label" /> </label>
		</div>
		<div class="col-lg-1 col-sm-1 col-xs-1"><label>:</label></div>
		<div class="col-lg-2 col-sm-2 col-xs-2" style="">
			<label>${billSummaryReport.totalPhoneOrders}</label>
		</div>
	</div>
	<div class="col-lg-6 col-sm-6 col-xs-6" style="">
		<div class="col-lg-8 col-sm-8 col-xs-8" style="padding-left: 10%;">
			<label><spring:message code="due.amount.label" /> </label>
		</div>
		<div class="col-lg-1 col-sm-1 col-xs-1"><label>:</label></div>
		<div class="col-lg-2 col-sm-2 col-xs-2" style="">
			<c:choose>
            <c:when test="${not empty billSummaryReport.totalDueAmt}">
				<label >${billSummaryReport.totalDueAmt}</label>
			</c:when>
            <c:otherwise>
				<label >0.0</label>
			</c:otherwise>
		</c:choose>
			<%-- <label>${billSummaryReport.totalDueAmt}</label> --%>
		</div>
	</div>
	<%-- <div class="col-lg-6 col-sm-6 col-xs-6" style="">
		<div class="col-lg-8 col-sm-8 col-xs-8" style="padding-left: 10%;">
			<label><spring:message code="total.returns.label" /> </label>
		</div>
		<div class="col-lg-1 col-sm-1 col-xs-1"><label>:</label></div>
		<div class="col-lg-2 col-sm-2 col-xs-2" style="">
			<label>${billSummaryReport.noOfReturns}</label>
		</div>
	</div> --%>
</div>
<div class="row" style="padding-bottom: 7px;">
	<div class="col-lg-6 col-sm-6 col-xs-6" style="">
		<div class="col-lg-8 col-sm-8 col-xs-8" style="padding-left: 10%;">
			<label>5)&nbsp;&nbsp;<spring:message code="sales.agent.label" /> </label>
		</div>
		<div class="col-lg-1 col-sm-1 col-xs-1"><label>:</label></div>
		<div class="col-lg-2 col-sm-2 col-xs-2" style="">
			<label>${billSummaryReport.totalSalesExecutiveOrders}</label>
		</div>
	</div>
	<div class="col-lg-6 col-sm-6 col-xs-6" style="">
		<div class="col-lg-8 col-sm-8 col-xs-8" style="padding-left: 10%;">
			<label style="font-weight: bold;"><spring:message code="total.tax.amount.label" /> </label>
		</div>
		<div class="col-lg-1 col-sm-1 col-xs-1"><label style="font-weight: bold;">:</label></div>
		<div class="col-lg-2 col-sm-2 col-xs-2" style="">
		<c:choose>
            <c:when test="${not empty billSummaryReport.tax}">
				<label style="font-weight: bold;">${billSummaryReport.tax}</label>
			</c:when>
            <c:otherwise>
				<label style="font-weight: bold;">0.0</label>
			</c:otherwise>
		</c:choose>
			<%-- <label style="font-weight: bold;">${billSummaryReport.tax}</label> --%>
		</div>
	</div>
	<%-- <div class="col-lg-6 col-sm-6 col-xs-6" style="">
		<div class="col-lg-8 col-sm-8 col-xs-8" style="padding-left: 10%;">
			<label><spring:message code="total.exchanges.label" /> </label>
		</div>
		<div class="col-lg-1 col-sm-1 col-xs-1"><label>:</label></div>
		<div class="col-lg-2 col-sm-2 col-xs-2" style="">
			<label>${billSummaryReport.noOfExchanges}</label>
		</div>
	</div> --%>
	<%--  --%>
</div>
<div class="row" style="padding-bottom: 7px;">
	<div class="col-lg-6 col-sm-6 col-xs-6" style=""></div>
	<div class="col-lg-6 col-sm-6 col-xs-6" style="">
		<div class="col-lg-8 col-sm-8 col-xs-8" style="padding-left: 10%;">
			<label><spring:message code="total.return.amount.label" /> </label>
		</div>
		<div class="col-lg-1 col-sm-1 col-xs-1"><label>:</label></div>
		<div class="col-lg-2 col-sm-2 col-xs-2" style="">
		<c:choose>
            <c:when test="${not empty billSummaryReport.returnTotal}">
				<label >${billSummaryReport.returnTotal}</label>
			</c:when>
            <c:otherwise>
				<label >0.0</label>
			</c:otherwise>
		</c:choose>
			<%-- <label>${billSummaryReport.returnTotal}</label> --%>
		</div>
	</div>
</div>
<div class="row" style="padding-bottom: 7px;">
	<div class="col-lg-6 col-sm-6 col-xs-6" style=""></div>
	<div class="col-lg-6 col-sm-6 col-xs-6" style="">
		<div class="col-lg-8 col-sm-8 col-xs-8" style="padding-left: 10%;">
			<label><spring:message code="total.exchange.bills.amount.label" /> </label>
		</div>
		<div class="col-lg-1 col-sm-1 col-xs-1"><label>:</label></div>
		<div class="col-lg-2 col-sm-2 col-xs-2" style="">
		<c:choose>
            <c:when test="${not empty billSummaryReport.exchangeTotal}">
				<label >${billSummaryReport.exchangeTotal}</label>
			</c:when>
            <c:otherwise>
				<label >0.0</label>
			</c:otherwise>
		</c:choose>
			<%-- <label>${billSummaryReport.exchangeTotal}</label> --%>
		</div>
	</div>
</div>
<br>
<div class="row" style="padding-bottom: 7px;">
	<div class="col-lg-6 col-sm-6 col-xs-6" style=""></div>
	<div class="col-lg-6 col-sm-6 col-xs-6" style="">
		<div class="col-lg-8 col-sm-8 col-xs-8" style="padding-left: 10%;">
			<label><spring:message code="total.coupon.payments.label" /> </label>
		</div>
		<div class="col-lg-1 col-sm-1 col-xs-1"><label>:</label></div>
		<div class="col-lg-2 col-sm-2 col-xs-2" style="">
		<c:choose>
            <c:when test="${not empty billSummaryReport.coupons}">
				<label >${billSummaryReport.coupons}</label>
			</c:when>
            <c:otherwise>
				<label >0.0</label>
			</c:otherwise>
		</c:choose>
			<%-- <label>${billSummaryReport.coupons}</label> --%>
		</div>
	</div>
</div>
<div class="row" style="padding-bottom: 7px;">
	<div class="col-lg-6 col-sm-6 col-xs-6" style=""></div>
	<div class="col-lg-6 col-sm-6 col-xs-6" style="">
		<div class="col-lg-8 col-sm-8 col-xs-8" style="padding-left: 10%;">
			<label><spring:message code="total.loyalty.claims.label" /> </label>
		</div>
		<div class="col-lg-1 col-sm-1 col-xs-1"><label>:</label></div>
		<div class="col-lg-2 col-sm-2 col-xs-2" style="">
			<%-- <label>${billSummaryReport.loyaltyPointsTotal}</label> --%>
		<c:choose>
            <c:when test="${not empty billSummaryReport.loyaltyPointsTotal}">
				<label >${billSummaryReport.loyaltyPointsTotal}</label>
			</c:when>
            <c:otherwise>
				<label >0.0</label>
			</c:otherwise>
		</c:choose>
		</div>
	</div>
</div>
<div class="row" style="padding-bottom: 7px;">
	<div class="col-lg-6 col-sm-6 col-xs-6" style=""></div>
	<div class="col-lg-6 col-sm-6 col-xs-6" style="">
		<div class="col-lg-8 col-sm-8 col-xs-8" style="padding-left: 10%;">
			<label><spring:message code="total.gift.voucher.payments.label" /> </label>
		</div>
		<div class="col-lg-1 col-sm-1 col-xs-1"><label>:</label></div>
		<div class="col-lg-2 col-sm-2 col-xs-2" style="">
			<%-- <label>${billSummaryReport.giftVouchers}</label> --%>
			<c:choose>
            <c:when test="${not empty billSummaryReport.giftVouchers}">
				<label >${billSummaryReport.giftVouchers}</label>
			</c:when>
            <c:otherwise>
				<label >0.0</label>
			</c:otherwise>
		</c:choose>
		</div>
	</div>
</div>
<div class="row" style="padding-bottom: 7px;">
	<div class="col-lg-6 col-sm-6 col-xs-6" style=""></div>
	<div class="col-lg-6 col-sm-6 col-xs-6" style="">
		<div class="col-lg-8 col-sm-8 col-xs-8" style="padding-left: 10%;">
			<label style="font-weight: bold;"><spring:message code="total.discounts.label" /> </label>
		</div>
		<div class="col-lg-1 col-sm-1 col-xs-1"><label style="font-weight: bold;">:</label></div>
		<div class="col-lg-2 col-sm-2 col-xs-2" style="">
		<c:choose>
            <c:when test="${not empty billSummaryReport.overalDiscount}">
				<label style="font-weight: bold;">${billSummaryReport.overalDiscount}</label>
			</c:when>
            <c:otherwise>
				<label style="font-weight: bold;">0.0</label>
			</c:otherwise>
		</c:choose>
			<%-- <label style="font-weight: bold;">${billSummaryReport.overalDiscount}</label> --%>
		</div>
	</div>
</div>
</body>
</html>