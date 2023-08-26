<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<%-- <link href="${pageContext.request.contextPath}/css/datatables/dataTables.bootstrap.css" rel="stylesheet" type="text/css" /> --%>
</head>
<body>
<%-- <div class="row">
	<div class="col-lg-12" style="text-align: center;">
		<label>${warehouseStockVerificationObj.store_location}  (${warehouseStockVerificationObj.startDate} - ${warehouseStockVerificationObj.endDate})</label>
	</div>
</div> --%>
<div class="row" style="padding-bottom: 7px;">
	<div class="col-lg-6 col-sm-6 col-xs-6" style="">
		<div class="col-lg-8 col-sm-8 col-xs-8" style="padding-left: 10%;">
			<label><spring:message code="total.items.label" /> </label>
		</div>
		<div class="col-lg-1 col-sm-1 col-xs-1"><label>:</label></div>
		<div class="col-lg-2 col-sm-2 col-xs-2" style="">
			<label>${verificationObj.totalRecords}</label>
		</div>
	</div>
	<div class="col-lg-6 col-sm-6 col-xs-6" style="">
		<div class="col-lg-8 col-sm-8 col-xs-8" style="padding-left: 10%;">
			<label><spring:message code="total.items.variance.quantity.label" /> </label>
		</div>
		<div class="col-lg-1 col-sm-1 col-xs-1"><label>:</label></div>
		<div class="col-lg-2 col-sm-2 col-xs-2" style="">
			<label>${verificationObj.totalItemsVarienceQty}</label>
		</div>
	</div>
</div>
<div class="row" style="padding-bottom: 7px;">
	<div class="col-lg-6 col-sm-6 col-xs-6" style="">
		<div class="col-lg-8 col-sm-8 col-xs-8" style="padding-left: 10%;">
			<label><spring:message code="total.items.cost.price.value.label" /> </label>
		</div>
		<div class="col-lg-1 col-sm-1 col-xs-1"><label>:</label></div>
		<div class="col-lg-2 col-sm-2 col-xs-2" style="">
			<label>${verificationObj.totalItemCostPriceValue}</label>
		</div>
	</div>
	<div class="col-lg-6 col-sm-6 col-xs-6" style="">
		<div class="col-lg-8 col-sm-8 col-xs-8" style="padding-left: 10%;">
			<label><spring:message code="total.items.cost.price.variance.value.label" /> </label>
		</div>
		<div class="col-lg-1 col-sm-1 col-xs-1"><label>:</label></div>
		<div class="col-lg-2 col-sm-2 col-xs-2" style="">
			<label>${verificationObj.totalItemCostPriceVarienceValue}</label>
		</div>
	</div>
</div>
<div class="row" style="padding-bottom: 7px;">
	<div class="col-lg-6 col-sm-6 col-xs-6" style="">
		<div class="col-lg-8 col-sm-8 col-xs-8" style="padding-left: 10%;">
			<label><spring:message code="total.items.sale.price.value.label" /> </label>
		</div>
		<div class="col-lg-1 col-sm-1 col-xs-1"><label>:</label></div>
		<div class="col-lg-2 col-sm-2 col-xs-2" style="">
			<label>${verificationObj.totalItemsSalePriceValue}</label>
		</div>
	</div>
	<div class="col-lg-6 col-sm-6 col-xs-6" style="">
		<div class="col-lg-8 col-sm-8 col-xs-8" style="padding-left: 10%;">
			<label><spring:message code="total.items.sale.price.variance.value.label" /> </label>
		</div>
		<div class="col-lg-1 col-sm-1 col-xs-1"><label>:</label></div>
		<div class="col-lg-2 col-sm-2 col-xs-2" style="">
			<label>${verificationObj.totalItemsSalePriceVarienceValue}</label>
		</div>
	</div>
</div>
<div class="row" style="padding-bottom: 7px;">
	<div class="col-lg-6 col-sm-6 col-xs-6" style="">
		<div class="col-lg-8 col-sm-8 col-xs-8" style="padding-left: 10%;">
			<label><spring:message code="total.items.mrp.price.value.label" /> </label>
		</div>
		<div class="col-lg-1 col-sm-1 col-xs-1"><label>:</label></div>
		<div class="col-lg-2 col-sm-2 col-xs-2" style="">
			<label>${verificationObj.totalItemsMrpPriceValue}</label>
		</div>
	</div>
	<div class="col-lg-6 col-sm-6 col-xs-6" style="">
		<div class="col-lg-8 col-sm-8 col-xs-8" style="padding-left: 10%;">
			<label><spring:message code="total.items.mrp.price.variance.value.label" /> </label>
		</div>
		<div class="col-lg-1 col-sm-1 col-xs-1"><label>:</label></div>
		<div class="col-lg-2 col-sm-2 col-xs-2" style="">
			<label>${verificationObj.totalItemsMrpPriceVarienceValue}</label>
		</div>
	</div>
</div>
</body>
</html>