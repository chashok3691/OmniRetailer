<!--/*
 * Project Name 	        : OmniRetailerCustomer
 * Written By		        : Mythri
 * file name		        : Inventory Manager/master/viewSku.jsp
 * file type		        : JSP
 * description				: The edit sku is displayed using this jsp
 * */ -->


<%-- <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%> --%>
	<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<!-- <meta charset="UTF-8"> -->
<title>Home | Omni Retailer</title>
<meta
	content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no'
	name='viewport'>
<script
	src="${pageContext.request.contextPath}/js/masterDataManagement/outletMasters/skuMaster.js"></script>
<script src="${pageContext.request.contextPath}/js/form_plugin.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/controller.js"></script>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/jquery.calendars.picker.css">
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/jquery.calendars.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/jquery.calendars.plus.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/jquery.calendars.picker.js"></script>
<%--  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/omniretailer.css"> --%>
<style type="text/css">
.row-fluid-5 {
	width: 100%;
	*zoom: 1;
}

.row-fluid-5:before, .row-fluid-5:after {
	display: table;
	line-height: 0;
	content: "";
}

.row-fluid-5:after {
	clear: both;
}

.row-fluid-5 [class*="span"] {
	display: block;
	float: left;
	width: 100%;
	min-height: 30px;
	margin-left: 1.875%;
	*margin-left: 1.875%;
	-webkit-box-sizing: border-box;
	-moz-box-sizing: border-box;
	box-sizing: border-box;
}

.row-fluid-5 .controls-row [class*="span"]+[class*="span"] {
	margin-left: 1.875%;
}

.row-fluid-5 [class*="span"]:first-child {
	margin-left: 0;
}

.row-fluid-5 .span2 {
	width: 15.5%;
	*width: 15.5%;
	padding:0px 0px 0px 0px;
}

/* responsive ONLY */
@media ( max-width : 600px) {
	/* spans reduce to 100px then go full width */
	.row-fluid-5 [class*="span"] {
		margin-left: 0;
		float: left;
		width: 100%;
		padding: 10px;
	}
}

img.thumbnail {
	background: none repeat scroll 0 0 #FFFFFF;
	margin-bottom: 5px !important;
	border: none !important;
}

.image:before {
	content: "";
	display: inline-block;
}

.image {
	-moz-box-sizing: border-box;
	float: left;
}

.delete {
	position: relative;
	vertical-align: middle;
	display: inline-block;
}

.delImage {
	/* content: ''; */
	position: absolute;
	top: 0;
	right: 0;
	height: 16px;
	width: 16px;
	cursor: pointer;
	/* background:rgba(0, 0, 0, 0) url("${pageContext.request.contextPath}/images/deny.png") no-repeat scroll 0 0; */
}
</style>
<script type="text/javascript">
	$(document).ready(function() {
		//callCalender('pluBestBeforeDateAllLocation1');
		debugger;
		$(".priceList").hide();
		setMarkUp();
		var selectedLocation = $("#selectedStoreLocation").val();
		$("#location").val(selectedLocation.split(','));
		var len = $(".pricelist").length;
		$("#currentPriceList").html("1 of " + len);
		/*   for(var i=1;i<=len;i++){
			  if($("#pluExpiryDate"+i).val() != "" && $("#pluExpiryDate"+i).val() != null)
			getDate('pluExpiryDate'+i);
		}  */
		if (len > 1)
			$("#nextImg").css("opacity", "1");
	});
	
	
	
	</script>
</head>
<body>

	<!-- Main content -->
	<section class="content">
		<div class="row">
			<div class="col-xs-12">
				<div class="box box-primary">
					<div class="box-header" style="text-align: center">
						<br />
						<h3>
							<spring:message code="view.sku.label" />
						</h3>
					</div>
					<!-- /.box-header -->
					<!-- form start -->
					<form id="editSku" method="post">
						<div class="box-body">
							<div class="row" style="text-align: right; margin-top: -27px;">
								<div id="Error"
									style="text-align: center; color: red; font-weight: bold;">${err}</div>
								<input type="button" class="btnCls" style="margin-right: 15px;position: relative"
									onclick="viewSkuMaster('skumaster','0');"
									value="<spring:message code="cancel.label" />" />
								<hr style="margin-top: 4px; width: 99%;" />
							</div>
							<c:choose>
								<c:when test="${fn:length(sku.ean)>12}">
								<div class="row">
									<div class="col-lg-11">
										<%-- 	<fmt:formatNumber var="totaltax" type="number" minIntegerDigits="6"  value="${sku.skuId}" /> --%>
										<input type="hidden" value="${fn:substring(sku.ean, 0, 12)}"
											id="mfid">
										<%-- <input type="hidden" value="${fn:substring(totaltax, 0, 6)}" id="pdid"> --%>
										<%@ include file="barcode.jsp"%>
										
									</div>
									<div class="col-lg-1" style="margin-top: 100px;">
									<input type="button" value="Print" class="btn bg-olive btn-inline  addBtn" onclick="PrintElem(this)"/>
									</div></div>
								</c:when>
							</c:choose>

							<div class="row">
								<div class="form-group col-lg-2">
									<label><spring:message code="skuid.label" /> <span
										style="color: red; font-size: 2">*</span></label> <input type="text"
										class="form-control allField" readonly="readonly" id="skuId"
										value="${sku.skuId}"
										placeholder="<spring:message code="enter.sku.id.label" />" />
									<span id="skuIdError"
										style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
								</div>
								<div class="form-group col-lg-2">
									<label><spring:message code="product.name.label" /> <span
										style="color: red; font-size: 2">*</span></label> <input type="text"
										value="${sku.description}" readonly="readonly"
										class="form-control allField searchItems searchBar"
										id="searchItems" /> <span id="productNameError"
										style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
									<input type="hidden" class="allField" id="productId"
										value="${sku.productId}">
								</div>
								<div class="form-group col-lg-2">
									<label><spring:message code="category.name.label" /></label> <input
										type="text" class="form-control allField" readonly="readonly"
										id="categoryName" name="categoryName"
										value="${sku.productCategory}" required
										placeholder="<spring:message code="category.name.label" />" />
									<span id="eanError"
										style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
								</div>
								<div class="form-group col-lg-2">
									<label><spring:message code="sub.category.name.label" /></label>
									<input type="text" class="form-control allField"
										readonly="readonly" id="subCategoryName"
										name="subCategoryName" value="${sku.subCategory}" required
										placeholder="<spring:message code="sub.category.name.label" />" />
									<span id="eanError"
										style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
								</div>
								<div class="form-group col-lg-2">
									<label><spring:message code="ean.label" /></label> <input
										type="text" class="form-control allField" readonly="readonly"
										id="ean" name="ean" value="${sku.ean}" required
										placeholder="<spring:message code="enter.ean.label" />" /> <span
										id="eanError"
										style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
								</div>
								<div class="form-group col-lg-2">
									<label><spring:message code="supplier.name.label" /> <span
										style="color: red; font-size: 2">*</span></label> <input type="text"
										value="${sku.supplierName}" readonly="readonly"
										class="form-control allField searchItems searchBar"
										name="supplier_name" id="searchSupplier" /> <span
										id="supplierNameError"
										style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
									<input type="hidden" class="allField" name="supplier_Id"
										id="supplier_Id" value="${sku.supplierName}" />
								</div>
							</div>
							<div class="row">
								<div class="form-group col-lg-2">
									<label><spring:message code="brand.code.label" /></label>
									<div class="col-lg-10" style="padding-left: 0px">
										<select class="form-control" disabled="disabled"
											id="brandCode">
											<c:forEach var="brandName" items="${brandsList}">
												<option value="${brandName}"
													${sku.brandCode == brandName ? 'selected' : ''}>${brandName}</option>
											</c:forEach>
										</select>
									</div>
								</div>
								<div class="form-group col-lg-2">
									<label><spring:message code="manufacturer.code.label" /></label>
									<input type="text" class="form-control allField"
										readonly="readonly" name="manufacturerCode"
										id="manufacturerCode" value="${sku.manufacturerCode}" required
										placeholder="<spring:message code="enter.manufacturer.code.label" />" />
									<span id="manufacturerCodeError"
										style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
								</div>
								<div class="form-group col-lg-2">
									<label><spring:message code="manufacturer.name.label" />
										<span style="color: red; font-size: 2">*</span></label> <input
										type="text" class="form-control allField" readonly="readonly"
										id="manufacturer" name="make" value="${sku.make}" required
										placeholder="<spring:message code="enter.manufacturer.name.label" />" />
									<span id="manufacturerError"
										style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
								</div>
								<div class="form-group col-lg-2">
									<label><spring:message code="uom.label" /> <span
										style="color: red; font-size: 2">*</span></label>
									<div class="col-lg-10" style="padding-left: 0px">
										<div class="col-lg-10" style="padding-left: 0px">
										<input type="text"  disabled id="uomList" value="${sku.uom}" list="uom"/>
                   <datalist id="uom">
											<option value="KG">KG</option>
											<option value="Grams">Grams</option>
											<option value="Litres">Litres</option>
											<option value="Millilitres">Millilitres</option>
											<option value="Meters">Meters</option>
											<option value="PCS">PCS</option>
											<option value="Cases">Cases</option>
											<option value="BOTTLE"${sku.uom == 'BOTTLE' ? 'selected' : ''}>BOTTLE</option>
											<option value="TAB"${sku.uom == 'TAB' ? 'selected' : ''}>TAB</option>
										</datalist>
									</div>
											
									</div>
								</div>
								<div class="form-group col-lg-2">
									<label><spring:message code="uom.label.label" /></label>
									<div class="col-lg-10" style="padding-left: 0px">
										<input type="text" class="form-control allField"
											readonly="readonly" name="uomLabel" id="uomLabel"
											value="${sku.uomLabel}"
											placeholder="<spring:message code="enter.uom.label.label" />" />
										<span id="weightError"
											style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
									</div>
								</div>
								<div class="form-group col-lg-2">
									<label><spring:message code="pack.size.label" /></label>
									<div class="col-lg-10" style="padding-left: 0px">
										<input type="text" class="form-control allField"
											readonly="readonly" name="packSize" id="packSize"
											value="${sku.packSize}" required
											placeholder="<spring:message code="enter.pack.size.label" />"
											oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');" />
										<span id="packSizeError"
											style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
									</div>
								</div>
							</div>
							<div class="row">
								<div class="form-group col-lg-2">
									<label><spring:message code="zero.stock.orders.label" /></label>
									<div class="col-lg-10" style="padding-left: 0px">
										<select class="form-control" disabled="disabled"
											name="zeroStock" id="zeroStock">
											<option value="true"
												${sku.zeroStock == true ? 'selected' : ''}>Yes</option>
											<option value="false"
												${sku.zeroStock == false ? 'selected' : ''}>No</option>
										</select>
									</div>
								</div>
								<div class="form-group col-lg-2">
									<label><spring:message code="just.in.time.orders.label" /></label>
									<div class="col-lg-10" style="padding-left: 0px">
										<select class="form-control" disabled="disabled"
											name="jitStock" id="jitStock">
											<option value="true"
												${sku.jitStock == true ? 'selected' : ''}>Yes</option>
											<option value="false"
												${sku.jitStock == false ? 'selected' : ''}>No</option>
										</select>
									</div>
								</div>
								<div class="form-group col-lg-2">
									<label><spring:message code="min.sales.quantity.label" />
										<span style="color: red; font-size: 2">*</span></label>
									<div class="col-lg-9" style="padding-left: 0px">
										<input type="text" class="form-control allField"
											readonly="readonly" id="minSaleQty" name="minSaleQty"
											value="${sku.minSaleQty}" required
											placeholder="<spring:message code="enter.min.sales.quantity.label" />"
											oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');" />
										<span id="minSaleQtyError"
											style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
									</div>
								</div>
								
								<div class="form-group col-lg-2">
									<label><spring:message code="max.sales.quantity.label" />
										<span style="color: red; font-size: 2"></span></label>
									<div class="col-lg-9" style="padding-left: 0px">

										<input type="text"  onblur="criteria(this)" class="form-control allField"
											readonly="readonly" id="maxSaleQty" name="maxSaleQty" value="${skuMaxSaleQty}" required
											placeholder="<spring:message code="max.sales.quantity.label" />"
											oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');" />
										<span id="maxSaleQtyError"
											style="text-align: right;display:block; color: red; font-size: 2; font-weight: bold;"></span>
									</div>
								</div>
								 
								<div class="form-group col-lg-2">
									<label><spring:message code="manufactureItem.label" />
										<!-- <span style="color:red; font-size:2">*</span> --></label>
									<div class="col-lg-10" style="padding-left: 0px">
										<select class="form-control" name="manufactureItem"
											id="manufactureItem" disabled="disabled">
											<option value="true"
												${sku.manufacturedItem == true ? 'selected' : ''}>Yes</option>
											<option value="false"
												${sku.manufacturedItem == false ? 'selected' : ''}>No</option>

										</select>
									</div>
								</div>
								<div class="form-group col-lg-2">
									<label><spring:message code="packagedItem.label" /> <!-- <span style="color:red; font-size:2">*</span> --></label>
									<div class="col-lg-10" style="padding-left: 0px">
										<select class="form-control" name="packagedItem"
											id="packagedItem" disabled="disabled">
											<option value="true" ${sku.packed == true ? 'selected' : ''}>Yes</option>
											<option value="false" ${sku.packed == false? 'selected' : ''}>No</option>
										</select>
									</div>
								</div>
								
							</div>


							<div class="row">
							
							<div class="form-group col-lg-2">
									<label><spring:message code="editable.label" /></label>
									<div class="col-lg-10" style="padding-left: 0px">
				                     <select class="form-control" name="editable" id="editable">
											<option value="true"
												${sku.editable == true ? 'selected' : ''}><spring:message
													code="yes.label" /></option>
											<option value="false"
												${sku.editable == false ? 'selected' : ''}><spring:message
													code="no.label" /></option>
										</select>
									</div>
								</div>
								
								<div class="form-group col-lg-2">
									<label><spring:message code="pattern.code.label" /></label>
									<div class="col-lg-10" style="padding-left: 0px">
										<input type="text" class="form-control allField"
											readonly="readonly" name="" id="patternCode"
											value="${sku.patternCode}" required
											placeholder="<spring:message code="enter.pattern.code.label" />" />
										<span id="patternCodeError"
											style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
									</div>
								</div>
								<div class="form-group col-lg-2">
									<label><spring:message code="reorder.point.label" /></label>
									<div class="col-lg-10" style="padding-left: 0px">
										<input type="text" class="form-control allField"
											readonly="readonly" name="reorderPoint" id="reorderPoint"
											value="${sku.reorderPoint}" required
											oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');"
											placeholder="<spring:message code="enter.reorder.point.label" />" />
										<span id="reorderPointError"
											style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
									</div>
								</div>
								<div class="form-group col-lg-2">
									<label><spring:message code="order.quantity.label" /></label>
									<div class="col-lg-9" style="padding-left: 0px">
										<input type="text" class="form-control allField"
											readonly="readonly" name="orderQuantity" id="orderQuantity"
											value="${sku.orderQuantity}" required
											oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');"
											placeholder="<spring:message code="enter.order.quantity.label" />" />
										<span id="orderQuantityError"
											style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
									</div>
								</div>
								<div class="form-group col-lg-2">
									<label><spring:message code="product.lead.time.label" /></label>
									<div class="col-lg-10" style="padding-left: 0px">
										<input type="text" class="form-control allField"
											readonly="readonly" name="leadTime" id="leadTime"
											value="${sku.leadTimeDays}" required
											placeholder="<spring:message code="enter.product.lead.time.label" />"
											oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');" />
										<span id="leadTimeError"
											style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
									</div>
								</div>
								<div class="form-group col-lg-2">
									<label><spring:message code="product.max.stock.label" /></label>
									<div class="col-lg-10" style="padding-left: 0px">
										<input type="text" class="form-control allField"
											readonly="readonly" name="maxStock" id="maxStock"
											value="${sku.maxStock}" required
											placeholder="<spring:message code="enter.product.max.stock.label" />"
											oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');" />
										<span id="maxStockError"
											style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
									</div>
								</div>
								
							</div>
							<div class="row">
							
							<div class="form-group col-lg-2">
									<label><spring:message code="stock.label" /> <span
										style="color: red; font-size: 2">*</span></label>
									<div class="col-lg-10" style="padding-left: 0px">
										<input type="text" class="form-control allField"
											readonly="readonly" name="stock" id="stock"
											value="${sku.stock}"
											oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');"
											required
											placeholder="<spring:message code="enter.stock.label" />" />
										<span id="stockError"
											style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
									</div>
								</div>
								
								<div class="form-group col-lg-2">
									<label><spring:message code="tax.code.label" /></label>
									<div class="col-lg-10" style="padding-left: 0px">
										<select class="form-control" disabled="disabled" id="taxCode">
											<c:forEach var="tax" items="${taxDetails}">
											
											<option value="${tax.taxName}"
													${tax.taxName.toUpperCase() == sku.taxCode.toUpperCase() ? 'selected' : ''}>${tax.taxId}
													- ${tax.taxName}</option>
												<%-- <option value="${tax.taxName}"
													${tax.taxName == sku.taxCode ? 'selected' : ''}>${tax.taxId}
													- ${tax.taxName}</option> --%>
												<%-- <option value="${tax.taxId == sku.taxCode ? 'selected' : ''}">${tax.taxId} - ${tax.taxName}</option> --%>
											</c:forEach>
										</select> <span id="taxCodeError"
											style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
									</div>
								</div>

								<div class="form-group col-lg-2">
									<label><spring:message code="fr.tax.code.label" /></label>
									<div class="col-lg-10" style="padding-left: 0px">
										<input type="text" class="form-control allField"
											readonly="readonly" name="frTaxCode" id="frTaxCode"
											value="${sku.frTaxCode}" required
											placeholder="<spring:message code="enter.fr.tax.code.label" />" />
									</div>
								</div>
								<div class="form-group col-lg-2">
									<label><spring:message code="mark.up.label" /></label>
									<div class="col-lg-9" style="padding-left: 0px">
										<input type="text" class="form-control allField"
											readonly="readonly" name="markUp" id="markUp"
											value="${sku.markUp}" required
											placeholder="<spring:message code="enter.mark.up.label" />" />
									</div>
								</div>
								<div class="form-group col-lg-2">
									<label><spring:message code="mark.down.label" /></label>
									<div class="col-lg-9" style="padding-left: 0px">
										<input type="text" class="form-control allField"
											readonly="readonly" name="markDown" id="markDown"
											value="${sku.markDown}" required
											placeholder="<spring:message code="enter.mark.down.label" />" />
									</div>
								</div>
								<div class="form-group col-lg-2">
									<label><spring:message code="running.plunumber.label" />
										<span style="color: red; font-size: 2">*</span></label>
									<div class="col-lg-11" style="padding-left: 0px">
										<select class="form-control" disabled="disabled"
											id="runningPlu">
											<c:forEach var="plu" items="${sku.skuPriceLists}">
												<option
													value="${plu.pluCode == sku.runningPluNumber ? 'selected' : ''}">${plu.pluCode}</option>
											</c:forEach>
										</select> <span id="runningPluError"
											style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
									</div>
								</div>
								
							</div>
							<div class="row">
							
							<div class="form-group col-lg-2">
									<label><spring:message code="model.label" /></label>
									<div class="col-lg-10" style="padding-left: 0px">
										<input type="text" readonly="readonly"
											class="form-control allField" name="model" id="model"
											value="${sku.model}" required
											placeholder="<spring:message code="enter.model.label" />" />
										<span id="modelError"
											style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
									</div>
								</div>
								
								<div class="form-group col-lg-2">
									<label><spring:message code="open.rate.label" /></label>
									<div class="col-lg-10" style="padding-left: 0px">
										<input type="text" readonly="readonly"
											class="form-control allField" name="openRate" id="openRate"
											value="${sku.openRate}"
											placeholder="<spring:message code="enter.open.rate.label" />"
											oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');" />
										<span id="colorError"
											style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
									</div>
								</div>
								<div class="form-group col-lg-2">
									<label><spring:message code="last.cost.label" /></label>
									<div class="col-lg-10" style="padding-left: 0px">
										<input type="text" readonly="readonly"
											class="form-control allField" name="lastCost" id="lastCost"
											value="${sku.lastCost}"
											placeholder="<spring:message code="enter.last.cost.label" />"
											oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');" />
										<span id="lastCostError"
											style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
									</div>
								</div>
								<div class="form-group col-lg-2">
									<label><spring:message code="average.cost.label" /></label>
									<div class="col-lg-9" style="padding-left: 0px">
										<input type="text" readonly="readonly"
											class="form-control allField" name="averageCost"
											id="averageCost" value="${sku.avgCost}" required
											placeholder="<spring:message code="enter.average.cost.label" />"
											oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');" />
										<span id="averageCostError"
											style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
									</div>
								</div>
								<div class="form-group col-lg-2">
									<label><spring:message code="minimum.price.label" /></label>
									<div class="col-lg-9" style="padding-left: 0px">
										<input type="text" readonly="readonly"
											class="form-control allField" name="minPrice" id="minPrice"
											value="${sku.minimumPrice}" required
											placeholder="<spring:message code="enter.minimum.price.label" />"
											oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');" />
										<span id="minPriceError"
											style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
									</div>
								</div>

								<div class="form-group col-lg-2">
									<label><spring:message code="color.label" /></label>
									<div class="col-lg-10" style="padding-left: 0px">
										<input type="text" class="form-control allField"
											readonly="readonly" name="color" id="color"
											value="${sku.color}"
											placeholder="<spring:message code="enter.color.label" />" />
										<span id="colorError"
											style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
									</div>
								</div>
								



							</div>

							<div class="row">
							
							<div class="form-group col-lg-2">
									<label><spring:message code="status.label" /></label>
									<div class="col-lg-10" style="padding-left: 0px">
										<select class="form-control" name="status" disabled="disabled"
											id="status">
											<option value="Active"
												${sku.status == 'Active' ? 'selected' : ''}>Active</option>
											<option value="InActive"
												${sku.status == 'InActive' ? 'selected' : ''}>InActive</option>
											<option value="Discontinued"
												${sku.status == 'Discontinued' ? 'selected' : ''}>Discontinued</option>
										</select>
									</div>
								</div>
							
							
								<div class="form-group col-lg-2">
									<label><spring:message code="primaryDepartment.label" />
										<!-- <span style="color:red; font-size:2">*</span> --></label> <input
										type="text"
										class="form-control allField searchItems searchBar"
										id="primaryDepartment" value="${sku.primaryDepartment}"
										readonly="readonly"
										placeholder="<spring:message code="search" />" style="" />
									<div class="services">
										<div class="items">
											<ul class="matchedStringUl primaryDepartment" style=""></ul>
										</div>
									</div>
									<span id="primaryDepartmentError"
										style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
									<input type="hidden" class="allField" id="primaryDepartment"
										value="">
								</div>
								<div class="form-group col-lg-2">
									<label><spring:message code="secondaryDepartment.label" />
										<!-- <span style="color:red; font-size:2">*</span> --></label> <input
										type="text"
										class="form-control allField searchItems searchBar"
										id="secondaryDepartment" value="${sku.secondaryDepartment}"
										readonly="readonly"
										placeholder="<spring:message code="search" />" style="" />
									<div class="services">
										<div class="items">
											<ul class="matchedStringUl secondaryDepartment" style=""></ul>
										</div>
									</div>
									<span id="secondaryDepartmentError"
										style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
									<input type="hidden" class="allField" id="secondaryDepartment"
										value="">
								</div>
							<div class="form-group col-lg-2">
									<label><spring:message code="section.label" />
										<!-- <span style="color:red; font-size:2">*</span> --></label> <input
										type="text"
										class="form-control allField searchItems "
										id="secondaryDepartment" value="${sku.section}"
										readonly="readonly"
										placeholder="<spring:message code="section.label" />" style="" />
								</div>
								<div class="form-group col-lg-2">
									<label><spring:message code="tax.exclusive.label" /></label>
									<div class="col-lg-10" style="padding-left: 0px">
										<select class="form-control" readonly="readonly" name="itemTaxExclusive" id="itemTaxExclusive">
											<option value="true"
												${sku.itemTaxExclusive == true ? 'selected' : ''}><spring:message
													code="yes.label" /></option>
											<option value="false"
												${sku.itemTaxExclusive == false ? 'selected' : ''}><spring:message
													code="no.label" /></option>
										</select>
									</div>
								</div>
								
								<div class="form-group col-lg-2"  style="">
                            
									<label><spring:message code="istaxon.discounted.price.label" />
										</label>
								<select class="form-control" readonly="readonly" name="packagedItem"
											id="packagedItem">
											<option value="true" ${sku.taxonDiscountedPrice == true ? 'selected' : ''}><spring:message
													code="yes.label" /></option>
											<option value="false" ${sku.taxonDiscountedPrice == false? 'selected' : ''}><spring:message
													code="no.label" /></option>

										</select>
									
								</div> 
								
								
								
								
								
							</div>

							<div class="row">
							
							<div class="form-group col-lg-2">
									<label><spring:message code="hsnCode.label" /></label> <input
										type="text" class="form-control allField" value="${sku.hsnCode}" name="hsnCode"
										id="hsnCode" value="" readonly="readonly"
										placeholder="<spring:message code="hsnCode.label" />" />
								</div>
								
								
								<div class="form-group col-lg-2">
									<label><spring:message code="trackingRequired.label" /></label>
									<div class="col-lg-10" style="padding-left: 0px">
										<select class="form-control" name="itemTrackRequired" id="itemTrackRequired">
											<option value="true"
												${sku.trackingRequired == true ? 'selected' : ''}><spring:message
													code="yes.label" /></option>
											<option value="false"
												${sku.trackingRequired == false ? 'selected' : ''}><spring:message
													code="no.label" /></option>
										</select>
									</div>
								</div>
								
								<div class="form-group col-lg-2">
									<label><spring:message code="alternate.sku.label" /></label> <input
										type="text" readonly="readonly" class="form-control allField"
										name="alternate_sku" id="alternate_sku"
										value="${sku.alternateSkuId}"
										placeholder="<spring:message code="alternate.sku.description.label" />" />
								</div>

								<div class="form-group col-lg-2">
									<label><spring:message code="season.code.label" /></label> <input
										type="text" readonly="readonly" class="form-control allField"
										name="season_code" id="season_code" value="${sku.seasonCode}"
										placeholder="<spring:message code="season.code.description.label" />" />
								</div>

								<div class="form-group col-lg-2">
									<label><spring:message code="alias.name.label" /></label> <input
										type="text" readonly="readonly" class="form-control allField"
										name="alias_name" id="alias_name" value="${sku.aliasName}"
										placeholder="<spring:message code="alias.name.description.label" />" />
								</div>

								<div class="form-group col-lg-2">
									<label><spring:message code="item.type.label" /></label> <input
										type="text" readonly="readonly" class="form-control allField"
										name="item_type" id="item_type" value="${sku.itemType}"
										placeholder="<spring:message code="item.type.description.label" />" />
								</div>

							



							</div>
							
							
							
							<div class="row">
							
								<div class="form-group col-lg-2">
									<label><spring:message code="item.design.label" /></label> <input
										type="text" readonly="readonly" class="form-control allField"
										name="item_design" id="item_design" value="${sku.itemDesign}"
										placeholder="<spring:message code="item.design.description.label" />" />
								</div>



 	                            <div class="form-group col-lg-2" style="">
<!-- 										<div class="form-group col-lg-9"> -->
									<label><spring:message code="comboQuick.label" />
										</label>
								<select  class="form-control allField"  id="comboDetail">
								<option value="true"
												${sku.is_combo == true ? 'selected' : ''}>Yes</option>
								<option value="false"
												${sku.is_combo == true ? 'selected' : ''}>No</option>
								</select>
<!--                              </div> -->
								</div>
							
								<div class="form-group col-lg-2"  style="">
                            
									<label><spring:message code="product.handing.label" />
										</label>
									<input type="text" id="productHandingDetail" disabled
										name="productHanding" style="resize: none;"
										class="form-control allField"  value="${sku.product_handing}"
										placeholder="<spring:message code="enter.product.handing.label" />">
									
								</div> 
							
							
							<div class="form-group col-lg-2"  style="">
                            
									<label><spring:message code="productUsage.label" />
										</label>
									<input type="text" id="productUsageDetail" 
										name="productUsageQuick" style="resize: none;" disabled
										class="form-control allField"  value="${sku.product_usage}"
										placeholder="<spring:message code="enter.product.handing.label" />">
									
								</div> 
							<div class="form-group col-lg-2"  style="">
                            
									<label><spring:message code="productInTake.label" />
										</label>
									<input type="text" id="productIntakeDetail"   disabled
										class="form-control allField"  value="${sku.product_consumption_interaction}"
										placeholder="<spring:message code="enter.product.handing.label" />">
									
								</div> 
								
								
								<div class="form-group col-lg-2"  style="">
                            
									<label><spring:message code="uom1.label" />
										</label>
									<input type="text" id="uom1Detail"  disabled
										class="form-control allField"  value="${sku.uom1}"
										placeholder="<spring:message code="enteruom1.label" />">
									
								</div> 
								
								
								
								
								
							
							</div>
							
							
							
							
							

							<div class="row">

								<div class="form-group col-lg-2" style="">

									<div class="row">
										<div class="col-lg-12">
											<label><spring:message code="uom2.label" /> </label> <input
												type="text" id="uom2Detail" disabled
												class="form-control allField" value="${sku.uom2}"
												placeholder="<spring:message code="enteruom2.label" />">

										</div>
									</div>
									<div class="row" style="padding-top: 20px;">
										<div class="col-lg-12">
											<label>Stock Status</label> 
											<select class="form-control allField req" style="width: 80%" id="stockStatus" disabled>
												<option value="true" ${'true' == sku.stockStatus ? 'selected' : ''}>Active</option>
												<option value="false" ${'false' == sku.stockStatus ? 'selected' : ''}>In-Active</option>
											</select>
										</div>
									</div>
								</div>


								<div class="form-group col-lg-2"  style="">
                            
									<label><spring:message code="batch.required.label" />
										</label>
									<select class="form-control" name="packagedItem"
											id="packagedItem">
											<option value="true" ${sku.batchRequired == true ? 'selected' : ''}><spring:message
													code="yes.label" /></option>
											<option value="false" ${sku.batchRequired == false? 'selected' : ''}><spring:message
													code="no.label" /></option>

										</select>
									
								</div> 
						
							<div class="form-group col-lg-1" style="text-align: center;width: 12.3%;">
									<div class="icon-remove blue delete" id="pictureIcon_image">
										<c:if test="${sku.pictureIcon != ''}">
											<%-- <img class="thumbnail" id="picture1_thumbnail" src="data:image/jpeg;base64,${sku.strPicture1}" style="width:100px;height:100px;"/> --%>
											<img class="thumbnail" id="pictureIcon_thumbnail"
												src="${sku.pictureIcon}" style="width: 100px; height: 100px;" />
										</c:if>
									</div>
									<c:if test="${sku.pictureIcon != ''}">
										<label>Icon</label>
									</c:if>
								</div>
								<div class="form-group col-lg-1" style="text-align: center;width: 12.3%;">
									<div class="icon-remove blue delete" id="picture1_image">
										<c:if test="${sku.picture1 != ''}">
											<%-- <img class="thumbnail" id="picture1_thumbnail" src="data:image/jpeg;base64,${sku.strPicture1}" style="width:100px;height:100px;"/> --%>
											<img class="thumbnail" id="picture1_thumbnail"
												src="${sku.picture1}" style="width: 100px; height: 100px;" />
										</c:if>
									</div>
									<c:if test="${sku.picture1 != ''}">
										<label>Picture 1</label>
									</c:if>
								</div>
								<div class="form-group col-lg-1" style="text-align: center;width: 12.3%;">
									<div class="icon-remove blue delete" id="picture2_image">
										<c:if test="${sku.picture2 != ''}">
											<%-- <img class="thumbnail" id="picture2_thumbnail" src="data:image/jpeg;base64,${sku.strPicture2}" style="width:100px;height:100px;"> --%>
											<img class="thumbnail" id="picture2_thumbnail"
												src="${sku.picture2}" style="width: 100px; height: 100px;" />
										</c:if>
									</div>
									<c:if test="${sku.picture2 != ''}">
										<label>Picture 2</label>
									</c:if>
								</div>
								<div class="form-group col-lg-1" style="text-align: center;width: 12.3%;">
									<div class="icon-remove blue delete" id="picture3_image"
										style="text-align: center;">
										<c:if test="${sku.picture3 != ''}">
											<%-- <img class="thumbnail" id="picture3_thumbnail" src="data:image/jpeg;base64,${sku.strPicture3}" style="width:100px;height:100px;" /> --%>
											<img class="thumbnail" id="picture3_thumbnail"
												src="${sku.picture3}" style="width: 100px; height: 100px;" />
										</c:if>
									</div>
									<c:if test="${sku.picture3 != ''}">
										<label>Picture 3</label>
									</c:if>
								</div>
								<div class="form-group col-lg-2">
									<div class="checkbox"
										style="padding-left: 20px; margin-top: 0px;">
										<c:if test="${sku.nonTaxable == true}">
											<input type="checkbox" disabled="disabled" id="nonTaxable"
												checked> Non Taxable
		                                    	</c:if>
										<c:if test="${sku.nonTaxable == false}">
											<input type="checkbox" disabled="disabled" id="nonTaxable"> Non Taxable
		                                    	</c:if>
									</div>
									<div class="checkbox"
										style="padding-left: 20px; margin-top: 20px;">
										<c:if test="${sku.discountable == true}">
											<input type="checkbox" disabled="disabled" id="discountable"
												checked> Discountable
		                                    	</c:if>
										<c:if test="${sku.discountable == false}">
											<input type="checkbox" disabled="disabled" id="discountable"> Discountable
		                                    	</c:if>
									</div>
									<div class="checkbox"
										style="padding-left: 20px; margin-top: 20px;">
										<c:if test="${sku.allowDecimals == true}">
											<input type="checkbox" disabled="disabled" id="allowDecimals"
												checked> Allow Decimals
		                                    	</c:if>
										<c:if test="${sku.allowDecimals == false}">
											<input type="checkbox" disabled="disabled" id="allowDecimals"> Allow Decimals
		                                    	</c:if>
									</div>
								</div>
							
							</div>
							
							<div class="row">
							
								<div class="form-group col-lg-2">
									<label><spring:message code="location.label" /> <span
										style="color: red; font-size: 2">*</span></label> <select
										class="form-control" disabled="disabled" id="location"
										multiple="multiple" style="height: 91px;">
										<c:forEach var="location" items="${workLocationsList}">
											<option value="${location}">${location}</option>
										</c:forEach>
									</select> <input type="hidden" id="selectedStoreLocation"
										value="${sku.storeLocation}"> <span id="locationError"
										style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
								</div>
								<div class="col-lg-2">
									<div class="row">
										<div class="form-group col-lg-12">
											<label><spring:message code="created.date.label" /></label>
											<div class="input-group">
												<div class="input-group-addon">
													<i class="fa fa-calendar"></i>
												</div>
												<input type="text" id="createdDate" readonly="readonly"
													value="${sku.created_date}" class="form-control dat"
													data-inputmask="'alias': 'dd/mm/yyyy'" data-mask />
											</div>
											<span id="createDateError"
												style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
										</div>
									</div>
									<div class="row">
										<div class="form-group col-lg-12">
											<label><spring:message code="last.updated.label" /></label>
											<div class="input-group">
												<div class="input-group-addon">
													<i class="fa fa-calendar"></i>
												</div>
												<input type="text" id="lastUpdated" readonly="readonly"
													value="${sku.updated_date}" class="form-control dat"
													data-inputmask="'alias': 'dd/mm/yyyy'" data-mask />
											</div>
											<span id="lastUpdatedError"
												style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
										</div>
									</div>
								
								</div>
										<div class="col-lg-2" style="padding-right: 10px;">
								<div class="row">
										<div class="form-group col-lg-12">
											<label>Theme</label>
											
												<input type="text" id="skutheme"  placeholder="Theme" class="form-control allField" value="${sku.theme}"/>
											
											<span id="skuThemeError"
												style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
										</div>
									</div>
								</div>
								
								<div class="col-lg-2" style="padding-right: 10px;">
								<div class="row">
										<div class="form-group col-lg-12">
											<label>Sub Theme</label>
											
												<input type="text" id="skuSubtheme"  placeholder="Sub Theme" class="form-control allField" value="${sku.subTheme}"/>
											
											<span id="skuSubthemeError"
												style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
										</div>
									</div>
								</div>
								
							
							
							
							</div>
							<div class="row">
								<div class="form-group col-lg-12">
									<label><spring:message code="short.description.label" />
										<span style="color: red; font-size: 2">*</span></label>
									<textarea rows="2" id="shortDescription" readonly="readonly"
										name="shortDescription" style="resize: none;"
										class="form-control allField"
										placeholder="<spring:message code="enter.short.description.label" />">${sku.description}</textarea>
									<span id="shortDescriptionError"
										style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
								</div>
							</div>
							<div class="row">
								<div class="form-group col-lg-12">
									<label><spring:message code="warranty.details.label" /></label>
									<textarea rows="2" class="form-control allField"
										readonly="readonly" name="warrantyDetails"
										style="resize: none;" id="warrantyDetails" required
										placeholder="<spring:message code="enter.warranty.details.label" />">${sku.warantyDetails}</textarea>
									<span id="warrantyDetailsError"
										style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
								</div>
							</div>
							<div class="row">
								<div class="col-lg-12">
									<div class="form-group col-lg-8"
										style="padding-left: 1px; padding-right: 1px; margin-top: 8px; cursor: pointer; margin-bottom: 0px;">
										<span
											style="font-weight: bold; font-size: 16px; color: #666; cursor: pointer; text-align: left;">
											<spring:message code="product.maanagement.label" />
										</span>
									</div>
									<div class="form-group col-lg-4" style="margin-bottom: 4px;">
										<img
											style="float: right; cursor: pointer; margin-right: -16px; margin-top: 0px; margin-bottom: -26px"
											onclick="activateHeader('priceList');" id="priceListImg"
											alt=""
											src="${pageContext.request.contextPath}/images/leftHeaderIconGreen.png">
									</div>
									<hr
										style="margin-top: 31px; width: 100%; border-top: 1px solid rgb(181, 230, 29);" />
									<hr
										style="margin-top: -18px; width: 100%; border-top: 1px solid rgb(181, 230, 29);" />
								</div>
							</div>
							<div class="priceList">
								<div class="row">
									
									<div class="col-lg-2  form-group" style="width:13.0%; padding: 0px 0px 0px 10px;">
										<div class="col-lg-2" style="background: #eee;width:110%;white-space:nowrap; border-top: 2px solid #ccc; padding-left: 0px;  padding-right: 0px;border-bottom: 2px solid #ccc; ">
										<label  class="white-space:nowrap;" ><spring:message code="specific.location.label" />
											</label></div>
										<div class="col-lg-12" style="padding-left:0px">
										<div class="row" style="">
										<br>
											<div class="col-lg-12 " style=" padding-right: 0px;"> 
											<select style="margin-top: -2px;" 
												class="form-control" id="selectedLocation"
												onchange="getPriceListForSelectedLocation(this);">
												<c:forEach var="selectedLocation"
													items="${sku.selectedLocationsList}">
													<option value="${selectedLocation}">${selectedLocation}</option>
												</c:forEach>
											</select> </div>
										</div>
									
										</div>
										</div>
									
									
								<div class="form-group col-lg-2" style="width:12.2%; padding: 0px 0px 0px 25px;margin-left:13px">
									<div class="col-lg-2" style="background: #eee;width:100%;white-space:nowrap; border-top: 2px solid #ccc; padding-left: 0px;  padding-right: 0px;border-bottom: 2px solid #ccc; ">
										<label  class="" ><spring:message code="product.range.label" />
											</label></div><br><br>
										<div class="col-lg-12" style="padding-left:0px">
										<div class="row" style="">
										
											<div class="col-lg-12 " style="    padding-right: 0px;"> <select style="" class="form-control" readonly="readonly"
												id="productRangeDropDown">
												<c:forEach var="productRange"
													items="${sku.productRangeList}">
													<option value="${productRange}">${productRange}</option>
												</c:forEach>
												</select></div> 
										</div>
									</div>
									</div>
									<div class="form-group col-lg-2" style="width:12.2%; padding: 0px 0px 0px 25px">
									<div class="col-lg-2" style="background: #eee;;width:100%;white-space:nowrap; border-top: 2px solid #ccc; padding-left: 0px;  padding-right: 0px;border-bottom: 2px solid #ccc; ">
											<label><spring:message code="measure.range.label" />
											</label></div><br><br>
										<div class="col-lg-12" style="padding-left:0px">
										<div class="row" style="">
											<div class="col-lg-12" style="    padding-right: 0px;"><select style="" class="form-control" readonly="readonly"
												id="measurementRangeDropDown">
												<c:forEach var="measurementRange"
													items="${sku.measurementRangeList}">
													<option value="${measurementRange}">${measurementRange}</option>
												</c:forEach>
											</select></div> 
										</div>
									</div>
									
									</div>
									
									
									
									
									
									<div class="form-group col-lg-2" style="width:12%; padding: 0px 0px 0px 25px">
									<div class="col-lg-2" style="background: #eee;width:100%;white-space:nowrap; border-top: 2px solid #ccc; padding-left: 0px;  padding-right: 0px;border-bottom: 2px solid #ccc; ">
										<label  class="" ><spring:message code="utility.label" />
											</label></div><br><br>
										<div class="col-lg-12" style="padding-left:0px">
										<div class="row" style="">
										
											<div class="col-lg-12" style="    padding-right: 0px;"> <select style="" class="form-control" readonly="readonly"
												id="utilityRangeDropDown">
												
												<c:forEach var="utilityRange"
													items="${sku.utilityRangeList}">
													<option value="${utilityRange}">${utilityRange}</option>
												</c:forEach>
												
												</select></div> 
										</div>
									</div>
									</div>
									
									
									
									
									<div class="col-lg-2" style="width:12%; padding: 0px 0px 0px 25px">
									<div class="col-lg-2" style="background: #eee;width:100%;white-space:nowrap; border-top: 2px solid #ccc; padding-left: 0px;  padding-right: 0px;border-bottom: 2px solid #ccc; ">
										<label  class="" ><spring:message code="colour.label" />
											</label></div><br><br>
										<div class="col-lg-12" style="padding-left:0px">
										<div class="row" style="">
										
											<div class="col-lg-12" style="    padding-right: 0px;"> <select style="" class="form-control" readonly="readonly"
												id="colourRangeDropDown">
												<c:forEach var="colourRange"
													items="${sku.colourRangeList}">
													<option value="${colourRange}">${colourRange}</option>
												</c:forEach>
												
												</select></div> 
										</div>
									</div>
									</div>
									
									
									
												
								 <div class="col-lg-2" style="width:12%; padding: 0px 0px 0px 25px">
									<div class="col-lg-2" style="background: #eee;width:100%;white-space:nowrap; border-top: 2px solid #ccc; padding-left: 0px;  padding-right: 0px;border-bottom: 2px solid #ccc; ">
										<label  class="" ><spring:message code="size.label" />
											</label></div><br><br>
										<div class="col-lg-12" style="padding-left:0px">
										<div class="row" style="">
										<div class="col-lg-12" style="padding-right: 0px;"> <select style="" class="form-control" readonly="readonly"
												id="sizeRangeDropDown">
												<c:forEach var="sizeRange"
													items="${sku.sizeRangeList}">
													<option value="${sizeRange}">${sizeRange}</option>
												</c:forEach>
												</select></div> 
										</div>
									</div>
									</div>
									
									
									
									     
                             <div class="col-lg-2" style="width:12%; padding: 0px 0px 0px 25px;">
                           
									<div class="col-lg-2" style="background: #eee;width:100%;white-space:nowrap; border-top: 2px solid #ccc; padding-left: 0px;  padding-right: 0px;border-bottom: 2px solid #ccc;">
										<label  class="" ><spring:message code="batch.label" />
											</label></div><br><br>
										<div class="col-lg-12" style="padding-left:0px">
										<div class="row" style="">
										
											<div class="col-lg-12" style="    padding-right: 0px;"> <select style="" class="form-control" readonly="readonly"
												id="batchRangeDropDown">
												<c:forEach var="batchRange"
													items="${sku.batchRangeList}">
													<option value="${batchRange}">${batchRange}</option>
												</c:forEach>
												
												</select></div> 
										</div>
					
									</div>
									</div>
									
									
									
									
									   <div class="col-lg-2" style="width:12%; padding: 0px 0px 0px 25px;">
                           
									<div class="col-lg-2" style="background: #eee;width:100%;white-space:nowrap; border-top: 2px solid #ccc; padding-left: 0px;  padding-right: 0px;border-bottom: 2px solid #ccc;">
										<label  class="" ><spring:message code="style.range.label" />
											</label></div><br><br>
										<div class="col-lg-12" style="padding-left:0px">
										<div class="row" style="">
										
											<div class="col-lg-12" style="padding-right: 0px;"> <select style="" class="form-control" readonly="readonly" id="styleRangeDropDown">
												<c:forEach var="style"
													items="${sku.skuPriceLists}">
													<option value="${style.styleRange}">${style.styleRange}</option>
												</c:forEach>
												
												</select></div> 
										</div>
					
									</div>
									</div>
									
									
									
									
									
									
									
									
									
								</div>
								<div class="row" style="">
									<div class="col-md-10 priceListForLocation">
										<div class="AllLocation priceListLocationDiv"></div>
										<c:forEach var="selectedLocationId"
											items="${sku.selectedLocationsIdList}"
											varStatus="locationCount">
											<div class="${selectedLocationId} priceListLocationDiv">
												<c:set var="priceListCount" value="1"></c:set>
												<c:forEach var="plu" items="${sku.skuPriceLists}"
													varStatus="theCount">
													<c:if test="${plu.storeLocationId == selectedLocationId}">
														<div class="pricelist"
															id="pricelist${selectedLocationId}${priceListCount}">
															<div class="row-fluid-5">
																<div class="form-group col-lg-2 " style="padding-left: 0px;">
																	<input type="hidden"
																		id="productRange${selectedLocationId}${priceListCount}"
																		value="${plu.productRange}" readonly="readonly">
																	<input type="hidden"
																		id="measurementRange${selectedLocationId}${priceListCount}"
																		value="${plu.measureRange}" readonly="readonly">
																		<input type="hidden"
																		id="utilityRange${selectedLocationId}${priceListCount}"
																		value="${plu.utility}">
																		<input type="hidden"
																		id="colourRange${selectedLocationId}${priceListCount}"
																		value="${plu.color}">
																		<input type="hidden"
																		id="sizeRange${selectedLocationId}${priceListCount}"
																		value="${plu.size}">
																		<input type="hidden"
																		id="batchRange${selectedLocationId}${priceListCount}"
																		value="${plu.productBatchNo}">
																		
																		
																	<label><spring:message code="cost.price.label" />
																		<span style="color: red; font-size: 2">*</span></label> <input
																		type="hidden" class="form-control allField req"
																		id="pluStoreLocation${selectedLocationId}${priceListCount}"
																		readonly="readonly" value="${plu.storeLocation}" /> <input
																		type="text" class="form-control allField req pluCost" style=""
																		onkeydown="clearError(this);"
																		onblur="calcMarkUp(this);" readonly="readonly"
																		id="pluCostPrice${selectedLocationId}${priceListCount}"
																		value="${plu.costPrice}"
																		oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');"
																		placeholder="<spring:message code="enter.cost.price.label" />" />
																	<span
																		id="pluCostPrice${selectedLocationId}${priceListCount}Error"
																		style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
																</div>
																<div class="form-group col-lg-2 " style="margin-left: 14px;">
																	<label><spring:message code="mrpprice.label" /> <span
																		style="color: red; font-size: 2">*</span></label> <input
																		type="text" class="form-control allField req" style=""
																		onkeydown="clearError(this);" readonly="readonly"
																		id="pluPrice${selectedLocationId}${priceListCount}"
																		value="${plu.price}"
																		oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');"
																		placeholder="<spring:message code="enter.price.label" />" />
																	<span
																		id="pluPrice${selectedLocationId}${priceListCount}Error"
																		style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
																</div>
																<div class="form-group col-lg-2 " style="margin-left: 1px;">
																	<label><spring:message code="sale.price.label" />
																		<span style="color: red; font-size: 2">*</span></label> <input
																		type="text" class="form-control allField req pluSale"
																		readonly="readonly" onkeydown="clearError(this);" style=""
																		onblur="calcMarkUp(this);"
																		id="pluSalePrice${selectedLocationId}${priceListCount}"
																		value="${plu.salePrice}"
																		oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');"
																		placeholder="<spring:message code="enter.sale.price.label" />" />
																	<span
																		id="pluSalePrice${selectedLocationId}${priceListCount}Error"
																		style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
																</div>

																<div class="form-group col-lg-2" style="white-space:nowrap;margin-left: 4px;">
																	<label><spring:message code="ws.price.label" />
																		<span style="color: red; font-size: 2">*</span></label> <input
																		type="text" class="form-control allField req "
																		readonly="readonly" onkeydown="clearError(this);" style=""
																		id="pluWsPrice${selectedLocationId}${priceListCount}"
																		value="${plu.wholesalePrice}"
																		oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');"
																		placeholder="<spring:message code="enter.ws.price.label" />" />
																	<span
																		id="pluWsPrice${selectedLocationId}${priceListCount}Error"
																		style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
																</div>
																
															
															<div class="form-group col-lg-2" style="padding-right:0px">
															
															
															<label><spring:message
																			code="sale.price.one.label" /> </label> <input
																		type="text" id="salePriceOne${selectedLocationId}${priceListCount}"
																		name="salePriceOne" style="resize: none; " disabled
																		class="form-control allField"
																		value="${plu.salePrice1}"
																		placeholder="Enter Sale Price 1"> <span
																		id="businessCategoryQuickError"
																		style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
															
															
															
                            
									<%-- <label><spring:message code="businessCategory.label" />
										</label>
									<input type="text" id="businessCategoryDetail${selectedLocationId}${priceListCount}" 
										name="productPrecautions" style="resize: none;width:80%" disabled
										class="form-control allField" value="${plu.businessCategory}">
									<span id="businessCategoryQuickError"
										style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span> --%>
							                    	</div>
															
																<%-- <div class="form-group col-lg-2" style="margin-left: 1px;">
																	<label><spring:message code="ean.label" /></label> <input
																		type="text" class="form-control allField"
																		readonly="readonly"
																		id="ean${selectedLocationId}${priceListCount}"
																		value="${plu.ean}"
																		placeholder="<spring:message code="enter.ean.label" />" />
																	<label><spring:message code="plu.code.label" /> <span style="color:red; font-size:2">*</span></label>
                                            <input type="text" class="form-control allField pluCode" readonly="readonly" id="pluCode${selectedLocationId}${priceListCount}" value="${plu.pluCode}"  />
																</div> --%>
																<%-- <div class="form-group span2">
																	<label><spring:message code="extra.price.label" /></label>
																	<input type="text" class="form-control allField"
																		onkeydown="clearError(this);" readonly="readonly"
																		id="pluExtraPrice${selectedLocationId}${priceListCount}"
																		value="${plu.extraPrice}"
																		oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');"
																		placeholder="<spring:message code="enter.extra.price.label" />" />
																	<span
																		id="pluExtraPrice${selectedLocationId}${priceListCount}Error"
																		style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
																</div> --%>
															</div>
															
																
																<%-- <div class="form-group span2">
																	<label><spring:message code="size.label" /></label> <input
																		type="text" class="form-control allField"
																		onkeydown="clearError(this);" readonly="readonly"
																		id="pluSize${selectedLocationId}${priceListCount}"
																		value="${plu.size}"
																		placeholder="<spring:message code="enter.size.label" />" />
																	<span
																		id="pluSize${selectedLocationId}${priceListCount}Error"
																		style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
																</div> --%>
															
															 <div class="row-fluid-5">
																<%-- <div class="form-group span2">
																	<label><spring:message code="color.label" /></label> <input
																		type="text" class="form-control allField"
																		onkeydown="clearError(this);" readonly="readonly"
																		id="pluColor${selectedLocationId}${priceListCount}"
																		value="${plu.color}"
																		placeholder="<spring:message code="enter.color.label" />" />
																	<span
																		id="pluColor${selectedLocationId}${priceListCount}Error"
																		style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
																</div> --%>
																<div class="form-group col-lg-2" style="padding-left:0px">
																	<label><spring:message code="color.shade.label" /></label>
																	<input type="text" class="form-control allField"
																		onkeydown="clearError(this);" readonly="readonly"
																		id="pluColorShade${selectedLocationId}${priceListCount}"
																		value="${plu.colorShade}"
																		placeholder="<spring:message code="enter.color.shade.label" />" />
																	<span
																		id="pluColorShade${selectedLocationId}${priceListCount}Error"
																		style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
																</div>
															<div class="form-group col-lg-2" style="margin-left: 14px;">
																	<label><spring:message code="mbq.label" /></label> <input
																		type="text" class="form-control allField"
																		onkeydown="clearError(this);" readonly="readonly"
																		id="pluMbq${selectedLocationId}${priceListCount}"
																		value="${plu.mbq}" style=""
																		placeholder="<spring:message code="enter.mbq.label" />" />
																	<span
																		id="pluMbq${selectedLocationId}${priceListCount}Error"
																		style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
																</div>

																<div class="form-group col-lg-2" style="white-space:nowrap;margin-left: 2px;">
																	<label><spring:message
																			code="quantity.in.hand.label" /> <span
																		style="color: red; font-size: 2">*</span></label> <input
																		type="text" class="form-control allField req"
																		onkeydown="clearError(this);" readonly="readonly"
																		id="pluQuantity${selectedLocationId}${priceListCount}"
																		value="${plu.quantityInHand}" style=""
																		oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');"
																		placeholder="<spring:message code="enter.quantity.in.hand.label" />" />
																	<span
																		id="pluQuantity${selectedLocationId}${priceListCount}Error"
																		style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
																</div>
																
																<div class="form-group col-lg-2" style="margin-left: 4px;">
																	<label><spring:message code="acp.label" /></label> <input
																		type="text" class="form-control allField"
																		onkeydown="clearError(this);" readonly="readonly"
																		id="pluAcp${selectedLocationId}${priceListCount}"
																		value="${plu.acp}" style=""
																		placeholder="<spring:message code="enter.acp.label" />" />
																	<span
																		id="pluAcp${selectedLocationId}${priceListCount}Error"
																		style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
																</div>
																<div class="form-group col-lg-2 " style="padding-right: 0px;"> 
																
																
																<label><spring:message code="businessCategory.label" />
										</label>
									<input type="text" id="businessCategoryDetail${selectedLocationId}${priceListCount}" 
										name="productPrecautions" style="resize: none;" disabled
										class="form-control allField" value="${plu.businessCategory}">
									<span id="businessCategoryQuickError"
										style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
																
																
																
																
									<%-- <label><spring:message code="businessSubcategory.label" />
										</label>
									<input type="text" id="businessSubcategoryDetail${selectedLocationId}${priceListCount}" 
										style="resize: none;width:80%" disabled
										class="form-control allField"  value="${plu.businessSubCategory}"
									">
									<span id="productSideEffectsError"
										style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span> --%>

								</div>		
																
																
																	<%-- <div class="form-group col-lg-2 " style="margin-left: 0px;padding-right:0px">
																	<label><spring:message
																			code="created.date.label" /></label>
																	<div class="input-group">
																		<div class="input-group-addon">
																			<i class="fa fa-calendar"></i>
																		</div>
																		<input type="text"
																			id="pluCreatedDate${selectedLocationId}${priceListCount}"
																			value="${plu.created_date}" readonly="readonly"
																			class="form-control dat"
																			data-inputmask="alias: dd/mm/yyyy" data-mask />
																	</div>
																	<span
																		id="pluCreatedDate${selectedLocationId}${priceListCount}Error"
																		style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
																</div> --%>
																
																
															</div> 
															
															
															
															
<input type="hidden" id="outletCategory" value="${skuObj.categoryName}">
   <input type="hidden" id="outletBrandId" value="${skuObj.brandCode}">
    
     <input type="hidden" id="outletLocation" value="${skuObj.storeLocation}">
      <input type="hidden" id="outletSubcategory" value="${skuObj.subCategoryName}">
       <input type="hidden" id="outletDepartmentId" value="${skuObj.department}">
        <input type="hidden" id="outletSupplierId" value="${skuObj.supplierName}">
          <input type="hidden" id="maxRecords" value="${skuObj.maxRecords}">
          <input type="hidden" id="SkuMaster" value="${skuObj.searchCriteria}">
																<%-- <div class="row-fluid-5">
													<div class="form-group span2">
														<label><spring:message code="discounttype.label" /></label> 
														<select class="form-control" id="pludiscounttype${selectedLocationId}${priceListCount}">
														<option value="flat_rate" ${plu.discountType == 'flat_rate' ? 'selected' : ''} >Cash Flat</option>
                                            			<option value="percentage" ${plu.discountType == 'percentage' ? 'selected' : ''} >Cash Discount</option>
														</select>
													</div>
													<div class="form-group span2">
														<label><spring:message
																code="discount.label" /> </label> <input
															type="text" class="form-control allField req"
															onkeydown="clearError(this);"
															value="${plu.discount}" id="pludiscount${selectedLocationId}${priceListCount}"
															oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');"
															placeholder="<spring:message code="discount.label" />" />
														
													</div>
												
												
												<div class="form-group span2">
														<label><spring:message
																code="cash.discpunt.label" /> </label> <input
															type="text" class="form-control allField req"
															onkeydown="clearError(this);" disabled="disabled"
															value="${plu.cashDiscount}" id="pludiscount${selectedLocationId}${priceListCount}"
															oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');"
															placeholder="<spring:message code="discount.label" />" />
														
													</div>
													
												
												
												<div class="form-group span2">
														<label><spring:message
																code="productBatchno.label" /> </label> <input
															type="text" class="form-control allField req" readonly="readonly" 
															onkeydown="clearError(this);"
															value="${plu.productBatchNo}" id="pludiscount${selectedLocationId}${priceListCount}"
															oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');"
															placeholder="<spring:message code="productBatchno.label" />" />
														
													</div>
												
												
													<div class="form-group span2">
														<label><spring:message
																code="productserialno.label" /> </label> <input
															type="text" class="form-control allField req" readonly="readonly" 
															onkeydown="clearError(this);"
															value="${plu.productSerNo}" id="pludProductSerialNo${selectedLocationId}${priceListCount}"
															oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');"
															placeholder="<spring:message code="productserialno.label" />" />
														
													</div>
												
												
											
												
												</div> --%>
												<%-- <div class="row-fluid-5">
												
												
												<div class="form-group span2">
																	<label><spring:message code="bestBeforeDate.label" /></label>
																	<div class="input-group">
																		<div class="input-group-addon">
																			<i class="fa fa-calendar"></i>
																		</div>
																		<input class="form-control allField req dat"
																			onchange="test()" 
																			style="background-color: white;" disabled
																			id="pluBestBeforeDate${selectedLocationId}${priceListCount}"
																			value="" size="20" type="text"
																			onfocus="callCalender('pluBestBeforeDate${selectedLocationId}${priceListCount}')"
																			onclick="callCalender('pluBestBeforeDate${selectedLocationId}${priceListCount}')"
																			placeholder="DD/MM/YYYY" />
																	</div>
																	<span
																		id="pluBestBeforeDate${selectedLocationId}${priceListCount}Error"
																		style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
																</div>
																<div class="form-group span2">
																	<label><spring:message
																			code="effectivefromDate.label" /></label>
																	<div class="input-group">
																		<div class="input-group-addon">
																			<i class="fa fa-calendar"></i>
																		</div>
																		<input type="text"
																			id="pluEffectivedDate${selectedLocationId}${priceListCount}"
																			value="${plu.effectiveFromDateStr}" readonly="readonly"
																			class="form-control dat"
																			placeholder="DD/MM/YYYY" />
																	</div>
																	<span
																		id="pluEffectivedDate${selectedLocationId}${priceListCount}Error"
																		style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
																</div>
												
												
												
												<div class="form-group span2">
																	<label><spring:message code="manufacturedDate.label" /></label>
																	<div class="input-group">
																		<div class="input-group-addon">
																			<i class="fa fa-calendar"></i>
																		</div>
																		<input class="form-control allField req dat"
																			style="background-color: white;" disabled
																			id="plumanufacturedDate${selectedLocationId}${priceListCount}"
																			value="" size="20" type="text"
																			onfocus="callCalender('plumanufacturedDate${selectedLocationId}${priceListCount}')"
																			onclick="callCalender('plumanufacturedDate${selectedLocationId}${priceListCount}')"
																			placeholder="DD/MM/YYYY" />
																	</div>
																	<span
																		id="plumanufacturedDate${selectedLocationId}${priceListCount}Error"
																		style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
																</div>
												
												
												<div class="form-group span2">
																	<label><spring:message code="warrantyperiad.label" /></label>
																	<input type="text" class="form-control allField"
																		onkeydown="clearError(this);" readonly="readonly"
																		id="pluWarrantyPeriod${selectedLocationId}${priceListCount}"
																		value="${plu.warrantyPeriod}"
																		placeholder="<spring:message code="enterwarrantyperiad.label" />" />
																	
																	<div class="input-group">
																		<div class="input-group-addon">
																			<i class="fa fa-calendar"></i>
																		</div>
																		<input class="form-control allField req dat"
																			readonly="readonly" style="background-color: white;" 
																			id="pluwarrantyDate${selectedLocationId}${priceListCount}"
																			 size="20" type="text" value="${plu.warrantyPeriod}"
																			onfocus="callCalender('pluwarrantyDate${selectedLocationId}${priceListCount}')"
																			onclick="callCalender('pluwarrantyDate${selectedLocationId}${priceListCount}')"
																			placeholder="DD/MM/YYYY" />
																	</div>
																	<span
																		id="pluWarrantyPeriod${selectedLocationId}${priceListCount}Error"
																		style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
																</div>
												
												
												
												
												<div class="form-group span2">
									<label><spring:message code="reorder.point.label" /></label>
									
										<input type="text" class="form-control allField"
											readonly="readonly" name="reorderPoint" id="plureorderPoint${selectedLocationId}${priceListCount}"
											 value=""  required
											oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');"
											placeholder="<spring:message code="enter.reorder.point.label" />" />
										<span id="plureorderPoint${selectedLocationId}${priceListCount}Error"
					style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
									
								</div>
										</div>
												 --%>
											
											
											
											
										<%-- 	<div class="row-fluid-5">
												<div class="form-group span2" style="padding-left:0px">
																	<label><spring:message code="blockdeQty.label" />
																		</label> <input
																		type="text" class="form-control allField req "
																		readonly="readonly" onkeydown="clearError(this);"
																		id="pluWsPrice${selectedLocationId}${priceListCount}"
																		value="${plu.blockedQuantity}"
																		oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');"
																		placeholder="<spring:message code="enterblockdeQty.label" />" />
																	<span
																		id="pluWsPrice${selectedLocationId}${priceListCount}Error"
																		style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
																</div>
																
																
													<div class="form-group  span2" style="padding-left:0px">
																	<label><spring:message code="scrapedQty.label" />
																		</label> <input
																		type="text" class="form-control allField req "
																		readonly="readonly" onkeydown="clearError(this);"
																		id="pluScrapedQty${selectedLocationId}${priceListCount}"
																		value="${plu.scrapedQuantity}"
																		oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');"
																		placeholder="<spring:message code="enterscrapedQty.label" />" />
																	<span
																		id="pluScrapedQty${selectedLocationId}${priceListCount}Error"
																		style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
																</div>			
																
												
												
												
													<div class="form-group span2">
																	<label><spring:message code="styleRange.label" /></label>
																	<input type="text" class="form-control allField"
																		onkeydown="clearError(this);" readonly="readonly" 
																		id="pluStyleRange${selectedLocationId}${priceListCount}"
																		value="${plu.styleRange}"
																		placeholder="<spring:message code="enterstyleRange.label" />" />
																	<span
																		id="pluStyleRange${selectedLocationId}${priceListCount}Error"
																		style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
																</div>	
												
												
												
												<div class="form-group span2">
																	<label><spring:message code="packageId.label" /></label>
																	<input type="text" class="form-control allField"
																		onkeydown="clearError(this);" readonly="readonly" 
																		id="pluPackageId${selectedLocationId}${priceListCount}"
																		value=""
																		placeholder="<spring:message code="enter.packageId.label" />" />
																	<span
																		id="pluPackageId${selectedLocationId}${priceListCount}Error"
																		style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
																</div>
												
												
												
												
											</div> --%><div class="row-fluid-5">
											
											<div class="form-group col-lg-2 " style="margin-left: 0px;padding-left:0px">
																	<label><spring:message
																			code="created.date.label" /></label>
																	<div class="input-group">
																		<div class="input-group-addon">
																			<i class="fa fa-calendar"></i>
																		</div>
																		<input type="text"
																			id="pluCreatedDate${selectedLocationId}${priceListCount}"
																			value="${plu.created_date}" readonly="readonly"
																			class="form-control dat" style="width:80%"
"																			data-inputmask="alias: dd/mm/yyyy" data-mask />
																	</div>
																	<span
																		id="pluCreatedDate${selectedLocationId}${priceListCount}Error"
																		style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
																</div>
																
																
																
															<div class="form-group col-lg-2 span2" style="margin-left:29px;padding-right:0px">
																	<label><spring:message code="expiry.date.label" /></label>
																	<div class="input-group">
																		<div class="input-group-addon">
																			<i class="fa fa-calendar"></i>
																		</div>
																		<input class="form-control allField req dat" 
																			onchange="test()" 
																			style="width:80%"
																			id="pluExpiryDate${selectedLocationId}${priceListCount}"
																			value="${plu.expiry_date}" size="20" type="text" readonly="readonly"
																			onfocus="callCalender('pluExpiryDate${selectedLocationId}${priceListCount}')"
																			onclick="callCalender('pluExpiryDate${selectedLocationId}${priceListCount}')"
																			placeholder="DD/MM/YYYY" />
																	</div>
																	<span
																		id="pluExpiryDate${selectedLocationId}${priceListCount}Error"
																		style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
																</div>
																
																
																  <div class="form-group col-lg-2 span2" style="margin-left:14px">
                                           	<label><spring:message code="min.sales.quantity.label" /><span style="color: red; font-size: 2">*</span></label></label> <input
													type="text" class="form-control allField" disabled
													id="priceMinSaleQty${selectedLocationId}${priceListCount}" value="${plu.min_sale_qty}"
													placeholder="<spring:message code="min.sales.quantity.label" />" style="width:88%"/>
                                        <span id="priceminSaleQtyError"
											style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
                                         </div>
																
																
												<div class="form-group col-lg-2 " style="white-space:nowrap;">
																	<label><spring:message
																			code="newarrival.product.status" /> </label>
																			<select class="form-control allField req" name="status" style="width:80%" id="skuStatus${selectedLocationId}${priceListCount}">
										                                      	<option value="true" ${'true' == plu.skuStatus ? 'selected' : ''} >Active</option>
		                                  		                                <option value="false" ${'false' == plu.skuStatus ? 'selected' : ''} >In-Active</option>
											
										                              </select> 
																</div>


																<div class="form-group col-lg-2" style="padding-right: 0px;">



																	<label><spring:message
																			code="businessSubcategory.label" /> </label> <input
																		type="text"
																		id="businessSubcategoryDetail${selectedLocationId}${priceListCount}"
																		style="resize: none;" disabled
																		class="form-control allField"
																		value="${plu.businessSubCategory}"">
																	<span id="productSideEffectsError"
																		style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>



																	<%-- 	<label>Material Type</label> <input
													type="text"   class="form-control allField"
													id="materailType${selectedLocationId}${priceListCount}" value="${plu.materialType}"
													placeholder="Material Type" style="width:70%" /> --%>
																</div>

																<%-- <div class="form-group col-lg-2" style="padding-right:0px">
                            
									<label><spring:message code="businessCategory.label" />
										</label>
									<input type="text" id="businessCategoryDetail${selectedLocationId}${priceListCount}" 
										name="productPrecautions" style="resize: none;" disabled
										class="form-control allField" value="${plu.businessCategory}"
										">
									<span id="businessCategoryQuickError"
										style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
								</div> --%>
																
																
																
																
											</div>
											
											
																									

<div class="row">
																
									
									<div class="form-group col-lg-2 " style="padding-right:0px">
																	<label><spring:message
																			code="updated.date.label" /></label>
																	<div class="input-group">
																		<div class="input-group-addon">
																			<i class="fa fa-calendar"></i>
																		</div>
																		<input type="text"
																			id="pluUpdatedDate${selectedLocationId}${priceListCount}"
																			value="${plu.updated_date}" readonly="readonly"
																			class="form-control dat" style="width:80%"
																			data-inputmask="alias: dd/mm/yyyy" data-mask />
																	</div>
																	<span
																		id="pluUpdatedDate${selectedLocationId}${priceListCount}Error"
																		style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
																</div>
																
																<div class="form-group col-lg-2 span2" style="margin-left:25px;padding-right:0px">
																	<label><spring:message code="packaged.date.label" /></label>
																	<div class="input-group">
																		<div class="input-group-addon">
																			<i class="fa fa-calendar"></i>
																		</div>
																		<input class="form-control allField req dat"
																			onchange="test()" readonly="readonly"
																			id="pluExpiryDate${selectedLocationId}${priceListCount}"
																			value="${plu.packagingDate}" size="20" type="text" style="width:80%"
																			onfocus="callCalender('pluPackagedDate${selectedLocationId}${priceListCount}')"
																			onclick="callCalender('pluPackagedDate${selectedLocationId}${priceListCount}')"
																			placeholder="DD/MM/YYYY" />
																	</div>
																	<span
																		id="pluExpiryDate${selectedLocationId}${priceListCount}Error"
																		style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
																</div>
									
							<div class="form-group col-lg-2 span2" style="padding-left:14px" >
                                           	<label><spring:message code="pack.size.label" /></label> <input
													type="text" class="form-control allField" disabled style=""
													id="pricePackSize${selectedLocationId}${priceListCount}" value="${plu.pack_size}"
													placeholder="<spring:message code="enter.pack.size.label" />" />
                                        </div>
                                        
                                
                                        
                                           
                                
									
									
								
								
												<%-- <div class="form-group col-lg-2 span2" style="padding-right: 0px;"> 
									<label><spring:message code="businessSubcategory.label" />
										</label>
									<input type="text" id="businessSubcategoryDetail${selectedLocationId}${priceListCount}" 
										style="resize: none;" disabled
										class="form-control allField"  value="${plu.businessSubCategory}"
									">
									<span id="productSideEffectsError"
										style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>

								</div>		 --%>
								
												<div class="form-group col-lg-2 span2" style="padding-left: 14px;"> 
									<label><spring:message code="stock.factory.label" />
										</label>
									<input type="text" id="stockfactor" 
										style="resize: none;width:94%" disabled
										class="form-control allField"  value="${plu.stockFactor}"
									">
									<span id="productSideEffectsError"
										style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>

								</div>		
								
								
								
								<div class="form-group col-lg-2" style="padding-left: 6px;">
								
									<label>Material Type</label> <input
													type="text"   class="form-control allField" disabled
													id="materailType${selectedLocationId}${priceListCount}" value="${plu.materialType}"
													placeholder="Material Type" style="" />
								
								
								
									<%-- <label>Zero Stock Billing</label>
									<div class="col-lg-10" style="padding-left: 0px">
										<select class="form-control" readonly="readonly" name="zeroStockbilling" id="zeroStockbilling">
											<option value="true" ${plu.zeroStockBilling == true ? 'selected' : ''}><spring:message
													code="yes.label" /></option>
							 				<option value="false" ${plu.zeroStockBilling == false ? 'selected' : ''}><spring:message
													code="no.label" /></option>
										</select>
									</div> --%>
								</div>
								
												
												</div>
														
											
											
											<div class="row-fluid-5">
										
										<div class="form-group col-lg-2 " style="padding: 0px;">
										
										<label>Zero Stock Billing</label>
									<div class="col-lg-10" style="padding-left: 0px">
										<select class="form-control" readonly="readonly" name="zeroStockbilling" id="zeroStockbilling">
											<option value="true" ${plu.zeroStockBilling == true ? 'selected' : ''}><spring:message
													code="yes.label" /></option>
							 				<option value="false" ${plu.zeroStockBilling == false ? 'selected' : ''}><spring:message
													code="no.label" /></option>
										</select>
									</div>
										
										</div>
							<div class="form-group col-lg-2 " style="margin-left: 15px;">
										<label>EAN</label>
									<div class="col-lg-12" style="padding: 0px;">
									<input type="text" onblur="criteria(this)" id="eanAllLocation0"  style="" class="form-control"  value="${plu.ean}" placeholder="Enter EAN number" readonly="readonly">
									<!-- <span id="eanError" style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span> -->
									</div>
							</div>				
									
								<div class="form-group col-lg-2 " style="padding-left: 19px;padding-right: 0px;">
										<label>Stock Status</label>
										<select class="form-control allField req"  style="width:80%" id="skuStockStatus${selectedLocationId}${priceListCount}" disabled >
									         <option value="true" ${'true' == plu.stockStatus ? 'selected' : ''} >Active</option> <%-- ${'true' == plu.skuStockStatus ? 'selected' : ''} --%>
		                                  	 <option value="false" ${'false' == plu.stockStatus ? 'selected' : ''} >In-Active</option><%--  --%>
											
										</select>				
								</div>													
					
								<div class="form-group col-lg-2">
                                           	
                                 </div>
                                        
                                <div class="form-group col-lg-2 "> 
									
								</div>
                                        
                               <div class="form-group col-lg-2">
									
								</div>						
							</div>
											
											
											
											
															<div class="row">
															
															
															
																	<div class="form-group col-lg-4" style="padding-right:0px">
								
									<label><spring:message code="technicalSpecification.label" />
										</label>
									<textarea rows="2" id="technicalSpecDetail${selectedLocationId}${priceListCount}"  style="height: 75px;width: 102%;resize:none"
										class="form-control allField" disabled
										">${plu.technical_specification}</textarea>
									<span id="productSideEffectsError"
										style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
							
								</div>
							
															
																<div class="form-group col-lg-4" style="padding-right: 0px;padding-left: 40px;">
																	<label><spring:message code="description.label" />
																		<span style="color: red; font-size: 2">*</span></label>
																	<textarea rows="2" class="form-control allField"
																		onkeydown="clearError(this);" readonly="readonly"
																		id="pluDesc${selectedLocationId}${priceListCount}"
																		style="height: 75px;resize: none;" required
																		placeholder="<spring:message code="enter.description.label" />">${plu.description}</textarea>
																	<span
																		id="pluDesc${selectedLocationId}${priceListCount}Error"
																		style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
																</div>
															</div>
														</div>
														<c:set var="priceListCount" value="${priceListCount + 1}" />
													</c:if>
												</c:forEach>
											</div>
										</c:forEach>
									</div>
									
									
									<div class="col-md-2 table-responsive" style="    border: 1px solid #ccc;
    padding: 0px;
    margin-left: -6.7%;
    width: 15.5%;">
									<table id="SKUMasterEAN" class="table table-bordered table-hover" style="margin-bottom:0px">
                                    <thead style="background-color: #ccc !important; color: #ffff">
                                      <tr>										
								<th>EAN</th>
								
								</tr>
								</thead>
								<tbody>
								 <c:forEach var="skuean" items="${multipleEanPriceList}" varStatus="theCount">
								
								<tr id="dynamicdiv${selectedLocationId}1${theCount.count}">
								<td id="tableean${selectedLocationId}${theCount.count}" style="width:57%"><input type="number" style="width:100%"   required="required" id="eantable${selectedLocationId}1${theCount.count}" value="${skuean.ean}"></td>
								</tr>
								
								</c:forEach>
								</tbody>
							
								</table>
								
							
								
								</div> 
							</div>



								<div class="row">
									<div class="row" style="margin-bottom: 15px;">

										<div class="col-md-2 col-sm-3 col-xs-4"
											style="padding-right: 0px; padding-left: 0px; float: right;">

											<div class="row">

												<div class="col-md-3 col-sm-3 col-xs-3"
													style="padding-left: 0px; padding-right: 0px;">

													<img
														style="float: right; cursor: pointer; /*margin-right: 95px;*/ /*margin-top: -5px;margin-bottom: -26px;*/ opacity: 0.5;"
														onclick="showPrevPriceList();" id="prevImg" alt=""
														src="${pageContext.request.contextPath}/images/leftIcon.png">

												</div>

												<div class="col-md-3 col-sm-3 col-xs-4"
													style="padding-left: 0px; padding-right: 0px;">

													<span id="currentPriceList"
														style="width: 100%; text-align: center /*margin-left: 53px;*/; font-size: 19px; margin-top: 10px; position: absolute;">1
														of 1</span>

												</div>

												<div class="col-md-3 col-sm-3 col-xs-3"
													style="padding-left: 0px; padding-right: 0px;">

													<img
														style="cursor: pointer; /*margin-right: 9px;*/ /*margin-top: -24px;margin-bottom: -26px;*/ opacity: 0.5;"
														onclick="showNextPriceList();" id="nextImg" alt=""
														src="${pageContext.request.contextPath}/images/rightIcon.png">

												</div>


											</div>
										</div>
									</div>
									<!-- /.box-body -->
								</div>
							</div>

							<div class="row" style="text-align: right;">
								<div class="col-md-12">
									<input type="button" class="btnCls"
										onclick="viewSkuMaster('skumaster','0');"
										value="<spring:message code="cancel.label" />" />
								</div>
							</div>
</div>
							<br />
							<!-- <div class="box-footer"></div> -->
					</form>
				</div>

			</div>
		</div>
	</section>
</body>
</html>