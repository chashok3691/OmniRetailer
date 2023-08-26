<!--/*
 * Project Name 	        : OmniRetailerCustomer
 * Written By		        : Mythri
 * file name		        : Inventory Manager/master/newSku.jsp
 * file type		        : JSP
 * description				: The new Sku is displayed using this jsp
 * */ -->


<%-- <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%> --%>
	<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<!DOCTYPE html>
<html>
<head>

<!-- <meta charset="UTF-8"> -->
<title>Home | Omni Retailer</title>
<meta
	content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no'
	name='viewport'>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/controller.js"></script>
<script
	src="${pageContext.request.contextPath}/js/masterDataManagement/outletMasters/skuMaster.js"></script>
<script src="${pageContext.request.contextPath}/js/form_plugin.js"></script>
<%-- <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/omniretailer.css"> --%>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/jquery.calendars.picker.css">
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/jquery.calendars.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/jquery.calendars.plus.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/jquery.calendars.picker.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/masterDataManagement/genericMasters/employeeMaster.js"></script>


<style type="text/css">
.colpadding {
	width: 14.5%;
}

.col-lg9-9 {
	width: 81%;
}

.row-fluid-5 {
	width: 100%;
	*zoom: 1;
}

.dropdownwidth {
	width: 135px;
}

.imgtextbox {
	width: 92px;
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

.row-padding {
	
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
	padding: 0px 0px 0px 0px;
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
	.col-padding {
		padding: 10px;
	}
}

}
img.thumbnail {
	background: none repeat scroll 0 0 #FFFFFF;
	margin-bottom: 0px !important;
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
}

.myFile {
	position: relative;
	overflow: hidden;
	float: left;
	clear: left;
}

.myFile input[type="file"] {
	display: block;
	position: absolute;
	top: 0;
	right: 0;
	opacity: 0;
	font-size: 100px;
	filter: alpha(opacity = 0);
	cursor: pointer;
}
</style>
<script type="text/javascript">
	$(document)
			.ready(
					function() {
	$(this).scrollTop(0);
						callCalender('pluExpiryDateWAllLocation1');
						callCalender('pluPackagedDateWAllLocation');

						$(".priceListW").hide();
						var dateTime = getCurrentDate();
						var date = dateTime.split(' ');
						date = date[0].split('/');
						var formatedDate = date[1] + "/" + date[0] + "/"
								+ date[2];
						$('#createdDateW').val(formatedDate);
						$('#lastUpdatedW').val(formatedDate);
						$('#pluCreatedDateWAllLocation1').val(formatedDate);
						$('#pluUpdatedDateWAllLocation1').val(formatedDate);
						setPriceListWDivContent();
						$("select[multiple] option").prop("selected",
								"selected");
						var op = '';
						$("select[multiple] option")
								.each(
										function() {
											op = op + '<option value="'
													+ $(this).val() + '">'
													+ $(this).val()
													+ '</option>';
											var loc = $(this).val();
											loc = loc.replace(/ /g, '_');
											if ($("div ." + loc).length == 0) {
												$(".priceListWForLocation")
														.append(
																"<div class='"+loc+" priceListWLocationDiv' style='display:none;'></div>");
											}
										});
						$("#selectedLocationW").html(op);
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
							<spring:message code="new.sku.header.label" />
						</h3>
					</div>
					<!-- /.box-header -->
					<!-- form start -->
					<form id="newSku" method="post">
						<div class="box-body">
							<div class="row" style="text-align: right; margin-top: -27px;">
								<div id="ErrorDetailW" class="Error"  style="text-align: center; color: red; font-size: 2; font-weight: bold;">${err}</div>
								<div id="SuccessDetailW" class="Error" style="text-align: center; color: blue; font-size: 2; font-weight: bold;">${success}</div>
								<input type="button" id="edit"
									style="position: relative; margin-right: 25px" class="btnCls"
									onclick="validateWellnessSkuForm('new')"
									value="<spring:message code="submit.label" />" /> <input
									type="button" id="edit" class="btnCls"
									style="margin-right: 25px; position: relative"
									onclick="resetAllWellnessSku();"
									value="<spring:message code="reset.label" />" />
								<c:if test="${sessionScope.role == 'super admin'}">
									<input type="button" class="btnCls"
										style="position: relative; margin-right: 15px;"
										onclick="viewSkuMaster('skumaster','0');"
										value="<spring:message code="cancel.label" />" />
								</c:if>
								<c:forEach var="accessControl"
									items="${sessionScope.outletMasterSettings}">
									<c:if
										test="${accessControl.appDocument == 'SkuMaster' && accessControl.write == true && accessControl.read == true}">
										<input type="button" class="btnCls"
											style="margin-right: 15px; position: relative"
											onclick="viewSkuMaster('skumaster','0');"
											value="<spring:message code="cancel.label" />" />
									</c:if>
								</c:forEach>
								<hr style="margin-top: 4px; width: 99%;" />
							</div>



							<div class="row">

								<div class="form-group col-lg-3" style="padding-right: 0px">
									<div class="col-lg-10" style="padding-left: 0px">
										<label><spring:message code="businessCategory.label" />
										</label> <select class="form-control " id="businessCategoryW"
											name="businessCategoryW"  onchange="return generateDynamicSkuId();">
											<option value="">--Select--</option>
											<option value="L">L - Lab</option>
											<option value="P">P - Pharma</option>
											<option value="C">C - Clinic</option>
										</select>
									</div>
								</div>


								<div class="form-group col-lg-3">
									<div class="col-lg-10" style="padding-left: 0px">
										<label><spring:message code="category.name.label" /></label>
										<select class="form-control allField" id="categoryNameW"
											name="categoryNameW"
											onchange="searchSubCategories('categoryNameW','subCategoryNameW') ;generateDynamicSkuId();">
											<option value="">--Select--</option>
											<c:forEach var="categoryList" items="${categoryList}">
												<option value="${categoryList.categoryName}"
													${categoryList.categoryName == sku.productCategory ? 'selected' : ''}
													id="${categoryList.categoryName}">${fn:toUpperCase(fn:substring(categoryList.categoryName, 0, 1))} - ${categoryList.categoryName}</option>
											</c:forEach>
										</select>
									</div>

								</div>



								<div class="form-group col-lg-3">
									<div class="col-lg-10" style="padding-left: 0px">
										<label><spring:message code="shedule.label" /></label> <select
											class="form-control" id="schedule" name="schedule"
											 onchange="return generateDynamicSkuId();">
											<option value="">--Select--</option>
											<option value="H">H - Schedule</option>
<!-- 											<option value="H1">H1 - Schedule</option> -->
											<option value="X">X - Schedule</option>
											<option value="G">G - Schedule</option>
<!-- 											<option value="NRX">NRX - Schedule</option> -->

										</select>

									</div>
								</div>

								<div class="form-group col-lg-3">
									<div class="col-lg-10" style="padding-left: 0px">

										<label><spring:message code="formOfItem.label" /></label> <select
											class="form-control" id="formOfItem" name="formOfItem"
											 onchange="return generateDynamicSkuId();">
											<option value="">--Select--</option>
											<option value="T">T - Tablet</option>
											<option value="C">C - Capsule</option>
											<option value="P">P - Powder</option>
											<option value="A">A - Soap</option>
											<option value="D">D - Drops</option>
											<option value="I">I - Injection</option>
											<option value="R">R - Rub</option>
											<option value="Y">Y - Syrub</option>
											<option value="S">S - Suspen</option>
											<option value="L">L - Liquid</option>
											<option value="U">U - Suppos</option>

										</select>
									</div>
								</div>


						<div class="form-group col-lg-3">
									<div class="col-lg-10" style="padding-left: 0px">
										<label><spring:message code="dose.label" /></label> <select
											class="form-control" id="dose" name="dose"
											 onchange="return generateDynamicSkuId();">
											<option value="">--Select--</option>
											<option value="0M">0M - 0.05mg</option>
											<option value="1M">1M -1.25mg</option>
											<option value="1A">1A - 10 U</option>
											<option value="3M">3M - 3mcg</option>
											<option value="4L">4L - 4 lac U</option>
											<option value="5P">5P - 5 %</option>
										</select>
									</div>
								</div>


<%-- 
								<div class="form-group col-lg-3">
									<div class="col-lg-10" style="padding-left: 0px">

										<label><spring:message code="dose.label" /></label> <br>

												<input type="text" class="form-group" id="dose"  list="doseL"  onchange="return generateDynamicSkuId();" />
										<datalist id="doseL" >
											<option value="0.001percent">0.001percent</option>
											<option value="0.004percent">0.004percent</option>
											<option value="0.005percent">0.005percent</option>
											<option value="0.01percent">0.01percent</option>
											<option value="0.025percent">0.025percent</option>
											<option value="0.02mg">0.02mg</option>
											<option value="0.02percent">0.02percent</option>
										</datalist>


									</div>
								</div> --%>


								<div class="form-group col-lg-3">
									<div class="col-lg-10" style="padding-left: 0px">

										<label><spring:message code="brand.code.label" /></label>
										<div class="col-lg-10" style="padding-left: 0px">
											<select class="form-control" id="brandCodeW"  onchange="return generateDynamicSkuId();">
												<option value="">--Select--</option>
												<c:forEach var="brandName" items="${brandsList}">
												<c:if test ="${not empty brandName && brandName !=''}">
													<option value="${fn:toUpperCase(fn:substring(brandName, 0, 4))}">${fn:toUpperCase(fn:substring(brandName, 0, 4))} - ${brandName}</option>
												</c:if>
												</c:forEach>
											</select>
										</div>
									</div>
								</div>

								<div class="form-group col-lg-3">
									<div class="col-lg-10" style="padding-left: 0px">

										<label><spring:message code="flavour.label" /></label> <select
											class="form-control" id="flavour" name="flavour"  onchange="return generateDynamicSkuId();">
											<option value="">--Select--</option>
											<option value="O">O - Orange</option>
											<option value="S">S - Strawberry</option>
											<option value="M">M - Mint</option>
											<option value="C">C - Chocolate</option>
											<option value="L">L - Lemon</option>

										</select>
									</div>
								</div>


								<div class="form-group col-lg-3">
									<div class="col-lg-10" style="padding-left: 0px">

										<label><spring:message code="pack.size.label" /></label>
										<div class="col-lg-10" style="padding-left: 0px">

											<input type="text" class="form-control allField"
												name="packSizeW" id="packSizeW" value="" required
												placeholder="<spring:message code="enter.pack.size.label" />"  onchange="return generateDynamicSkuId();"
												oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');" />
											<span id="packSizeError"
												style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
										</div>
									</div>
								</div>

							</div>





							<hr style="margin-top: 4px; width: 99%;" />

							<div class="row">
								<div class="form-group col-lg-2">
									<label><spring:message code="skuid.label" /> <span
										style="color: red; font-size: 2">*</span></label> <input type="text"
										class="form-control allField" id="skuIdW" value=""
										oninput="this.value = this.value.replace(/[^a-zA-Z0-9 -]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');"
										placeholder="<spring:message code="enter.sku.id.label" />" />
									<span id="skuIdWError"
										style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
								</div>
								<div class="form-group col-lg-2">
									<label><spring:message code="product.name.label" /> <span
										style="color: red; font-size: 2">*</span></label> <input type="text" id="productNameW"
										class="form-control allField  "
										placeholder="<spring:message code="enter.product.name.label" />"
										style="" /> <span id="productNameWError"
										style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
									<input type="hidden" class="allField" id="productIdW" value="">
								</div>

								<div class="form-group col-lg-2">
									<label><spring:message code="sub.category.name.label" /></label>
									<select class="form-control" id="subCategoryNameW"
										name="subCategoryNameW">
										<option value=""><spring:message code="ALL.label" /></option>
										<c:forEach var="subCategoryDetailsList"
											items="${subCategoryDetailsList}">
											<option value="${subCategoryDetailsList.subcategoryName}"
												${subCategoryDetailsList.subcategoryName == sku.subCategory ? 'selected' : ''}
												id="${subCategoryDetailsList.subcategoryName}">${subCategoryDetailsList.subcategoryName}</option>
										</c:forEach>
									</select>
								</div>
								<div class="form-group col-lg-2">
									<label><spring:message code="ean.label" /></label> <input
										type="text" class="form-control allField" id="eanW" name="eanW"
										value="" required
										placeholder="<spring:message code="enter.ean.label" />" /> <span
										id="eanWError"
										style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
								</div>
								<div class="form-group col-lg-2">
									<label><spring:message code="supplier.name.label" /> <span
										style="color: red; font-size: 2">*</span></label> <input type="text"
										class="form-control allField searchItems searchBar"
										name="supplier_nameW" id="searchSupplierW"
										autocomplete="off"
										placeholder="<spring:message code="search.supplier.label" />"
										style="" />
									<div class=services>
										<div class="items">
											<ul class="matchedStringUl supplier"
												style="width: 89% !important; padding: 0px !important;"></ul>
										</div>
									</div>
									<span id="supplierNameWError"
										style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
									<input type="hidden" class="allField" name="supplier_IdW"
										id="supplier_IdW" value="" />
								</div>
							</div>
							<div class="row">

								<div class="form-group col-lg-2">
									<label><spring:message code="manufacturer.code.label" /></label>
									<input type="text" class="form-control allField"
										name="manufacturerCodeW" id="manufacturerCodeW" value=""
										required
										placeholder="<spring:message code="enter.manufacturer.code.label" />" />
									<span id="manufacturerCodeWError"
										style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
								</div>
								<div class="form-group col-lg-2">
									<label><spring:message code="manufacturer.name.label" />
										<span style="color: red; font-size: 2"></span></label> <input
										type="text" class="form-control allField" id="manufacturerW"
										name="makeW" value="" required
										placeholder="<spring:message code="enter.manufacturer.name.label" />" />
									<span id="manufacturerError"
										style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
								</div>
								<div class="form-group col-lg-2">
									<label><spring:message code="uom.label" /> <span
										style="color: red; font-size: 2">*</span></label>
									<div class="col-lg-10" style="padding-left: 0px">
										<input type="text" id="uomListW" value="${sku.uom}" list="uomW" />
										<datalist id="uomW">
											<option value="KG">KG</option>
											<option value="Grams">Grams</option>
											<option value="Litres">Litres</option>
											<option value="Millilitres">Millilitres</option>
											<option value="Meters">Meters</option>
											<option value="PCS">PCS</option>
											<option value="Cases">Cases</option>
											<option value="BOTTLE"	${sku.uom == 'BOTTLE' ? 'selected' : ''}>BOTTLE</option>
											<option value="TAB" ${sku.uom == 'TAB' ? 'selected' : ''}>TAB</option>
										</datalist>
										<span id="uomListWError"
											style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>

									</div>
								</div>
								<div class="form-group col-lg-2">
									<label><spring:message code="uom.label.label" /></label>

									<div class="col-lg-10" style="padding-left: 0px">
										<input type="text" class="form-control allField"
											name="uomLabelW" id="uomLabelW" value=""
											placeholder="<spring:message code="enter.uom.label.label" />" />
										<span id="weightError"
											style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
									</div>
								</div>

								<div class="form-group col-lg-2" style="">

									<label><spring:message code="uom1.label" /> </label> <input
										type="text" id="uom1DetailW" class="form-control allField"
										value="${sku.product_handing}"
										placeholder="<spring:message code="enteruom1.label" />">

								</div>

								<div class="form-group col-lg-2" style="">
									<label><spring:message code="uom2.label" /> </label> <input
										type="text" id="uom2DetailW" class="form-control allField"
										value="${sku.product_handing}"
										placeholder="<spring:message code="enteruom2.label" />">
								</div>

							</div>

							<div class="row">
								<div class="form-group col-lg-2">
									<label><spring:message code="zero.stock.orders.label" /></label>
									<div class="col-lg-10" style="padding-left: 0px">
										<select class="form-control" name="zeroStockW" id="zeroStockW">
											<option value="true"><spring:message
													code="yes.label" /></option>
											<option value="false"><spring:message
													code="no.label" /></option>
										</select>
									</div>
								</div>
								<div class="form-group col-lg-2">
									<label><spring:message code="just.in.time.orders.label" /></label>
									<div class="col-lg-10" style="padding-left: 0px">

										<select class="form-control" name="jitStockW" id="jitStockW">
											<option value="true"><spring:message
													code="yes.label" /></option>
											<option value="false"><spring:message
													code="no.label" /></option>
										</select>
									</div>
								</div>
								<div class="form-group col-lg-2">
									<label><spring:message code="min.sales.quantity.label" />
										<span style="color: red; font-size: 2">*</span></label>
									<div class="col-lg-9" style="padding-left: 0px">

										<input type="text" class="form-control allField"
											id="minSaleQtyW" name="minSaleQtyW" value="" required
											placeholder="<spring:message code="enter.min.sales.quantity.label" />"
											oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');" />
										<span id="minSaleQtyWError"
											style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
									</div>
								</div>
								<div class="form-group col-lg-2">
									<label><spring:message code="manufactureItem.label" />
										<!-- <span style="color:red; font-size:2">*</span> --></label>
									<div class="col-lg-10" style="padding-left: 0px">
										<select class="form-control" name="manufactureItemW"
											id="manufactureItemW">
											<option value="true"><spring:message
													code="yes.label" /></option>
											<option value="false"><spring:message
													code="no.label" /></option>

										</select>
									</div>
								</div>
								<div class="form-group col-lg-2">
									<label><spring:message code="packagedItem.label" /> <!-- <span style="color:red; font-size:2">*</span> --></label>
									<div class="col-lg-10" style="padding-left: 0px">
										<select class="form-control" name="packagedItemW"
											id="packagedItemW">
											<option value="true"><spring:message
													code="yes.label" /></option>
											<option value="false"><spring:message
													code="no.label" /></option>
										</select>
									</div>
								</div>
								<div class="form-group col-lg-2">
									<label><spring:message code="editable.label" /></label>
									<div class="col-lg-10" style="padding-left: 0px">
										<select class="form-control" name="editableW" id="editableW">
											<option value="true"><spring:message
													code="yes.label" /></option>
											<option value="false"><spring:message
													code="no.label" /></option>
										</select>
									</div>
								</div>
							</div>

							<div class="row">
								<div class="form-group col-lg-2">

									<label><spring:message code="pattern.code.label" /></label>
									<div class="col-lg-10" style="padding-left: 0px">
										<input type="text" class="form-control allField" name=""
											id="patternCodeW" value="" required
											placeholder="<spring:message code="enter.pattern.code.label" />" />
										<span id="patternCodeError"
											style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
									</div>
								</div>
								<div class="form-group col-lg-2">

									<label><spring:message code="reorder.point.label" /></label>
									<div class="col-lg-10" style="padding-left: 0px">
										<input type="text" class="form-control allField"
											name="reorderPointW" id="reorderPointW" value="" required
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
											name="orderQuantityW" id="orderQuantityW" value="" required
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
											name="leadTimeW" id="leadTimeW" value="" required
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
											name="maxStockW" id="maxStockW" value="" required
											placeholder="<spring:message code="enter.product.max.stock.label" />"
											oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');" />
										<span id="maxStockError"
											style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
									</div>
								</div>
								<div class="form-group col-lg-2">
									<label><spring:message code="stock.label" /> <span
										style="color: red; font-size: 2">*</span></label>
									<div class="col-lg-10" style="padding-left: 0px">

										<input type="text" class="form-control allField"
											readonly="readonly" name="stockW" id="stockW" value=""
											oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');"
											required
											placeholder="<spring:message code="enter.stock.label" />" />
										<span id="stockWError"
											style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
									</div>
								</div>
							</div>
							<div class="row">
								<div class="form-group col-lg-2">
									<label><spring:message code="tax.code.label" /></label>
									<div class="col-lg-10" style="padding-left: 0px">
										<select class="form-control" id="taxCodeW">
											<c:forEach var="tax" items="${taxDetails}">
												<option value="${tax.taxName}">${tax.taxId}-
													${tax.taxName}</option>
											</c:forEach>
										</select> <span id="taxCodeWError"
											style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
									</div>
								</div>

								<div class="form-group col-lg-2">
									<label><spring:message code="fr.tax.code.label" /></label>
									<div class="col-lg-10" style="padding-left: 0px">
										<input type="text" class="form-control allField"
											name="frTaxCodeW" id="frTaxCodeW" value=""
											oninput="this.value = this.value.replace(/[^0-9]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');"
											required
											placeholder="<spring:message code="enter.fr.tax.code.label" />" />
									</div>
								</div>
								<div class="form-group col-lg-2">
									<label><spring:message code="mark.up.label" /></label>
									<div class="col-lg-9" style="padding-left: 0px">
										<input type="text" class="form-control allField"
											readonly="readonly" name="markUpW" id="markUpW" value=""
											required
											placeholder="<spring:message code="enter.mark.up.label" />" />
									</div>
								</div>
								
								<div class="form-group col-lg-2">
									<label><spring:message code="mark.down.label" /></label>
									<div class="col-lg-9" style="padding-left: 0px">
										<input type="text" class="form-control allField"
											name="markDownW" id="markDownW" value="" required
											placeholder="<spring:message code="enter.mark.down.label" />" />
									</div>
								</div>
								
								
								<div class="form-group col-lg-2">
									<label><spring:message code="running.plunumber.label" /></label>
									<div class="col-lg-11" style="padding-left: 0px">
										<!-- <select class="form-control" id="runningPlu"></select> -->
										<input type="text" class="form-control" id="runningPluW">
										<span id="runningPluError"
											style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
									</div>
								</div>
								<div class="form-group col-lg-2">
									<label><spring:message code="model.label" /></label>
									<div class="col-lg-10" style="padding-left: 0px">
										<input type="text" class="form-control allField" name="modelW"
											id="modelW" value="" required
											placeholder="<spring:message code="enter.model.label" />" />
										<span id="modelError"
											style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
									</div>
								</div>
							</div>
							<div class="row">
								<div class="form-group col-lg-2">
									<label><spring:message code="open.rate.label" /></label>
									<div class="col-lg-10" style="padding-left: 0px">
										<input type="text" class="form-control allField"
											name="openRateW" id="openRateW" value=""
											placeholder="<spring:message code="enter.open.rate.label" />"
											oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');" />
										<span id="colorError"
											style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
									</div>
								</div>
								<div class="form-group col-lg-2">
									<label><spring:message code="last.cost.label" /></label>
									<div class="col-lg-10" style="padding-left: 0px">
										<input type="text" class="form-control allField"
											name="lastCostW" id="lastCostW" value=""
											placeholder="<spring:message code="enter.last.cost.label" />"
											oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');" />
										<span id="lastCostError"
											style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
									</div>
								</div>
								<div class="form-group col-lg-2">
									<label><spring:message code="average.cost.label" /></label>
									<div class="col-lg-9" style="padding-left: 0px">
										<input type="text" class="form-control allField"
											name="averageCostW" id="averageCostW" value="" required
											placeholder="<spring:message code="enter.average.cost.label" />"
											oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');" />
										<span id="averageCostError"
											style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
									</div>
								</div>
								<div class="form-group col-lg-2">
									<label><spring:message code="minimum.price.label" /></label>
									<div class="col-lg-9" style="padding-left: 0px">
										<input type="text" class="form-control allField"
											name="minPriceW" id="minPriceW" value="" required
											placeholder="<spring:message code="enter.minimum.price.label" />"
											oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');" />
										<span id="minPriceError"
											style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
									</div>
								</div>
								<div class="form-group col-lg-2">
									<label><spring:message code="color.label" /></label>
									<div class="col-lg-10" style="padding-left: 0px">
										<input type="text" class="form-control allField" name="colorW"
											id="colorW" value=""
											placeholder="<spring:message code="enter.color.label" />" />
										<span id="colorError"
											style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
									</div>
								</div>
								<div class="form-group col-lg-2">
									<label><spring:message code="status.label" /></label>
									<div class="col-lg-10" style="padding-left: 0px">
										<select class="form-control" name="statusW" id="statusW">
											<option value="Active">Active</option>
											<option value="Disabled">Disabled</option>
											<option value="Discontinued">Discontinued</option>
										</select>
									</div>
								</div>
							</div>

							<div class="row">
								<div class="form-group col-lg-2">
									<label><spring:message code="primaryDepartment.label" />
										<!-- <span style="color:red; font-size:2">*</span> --></label> <input
										type="text"
										class="form-control allField searchItems searchBar"
										id="primaryDepartmentW"
										placeholder="<spring:message code="search" />" style="" />
									<div class="services">
										<div class="items">
											<ul class="matchedStringUl primaryDepartmentW" style=""></ul>
										</div>
									</div>
									<span id="primaryDepartmentError"
										style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
									<input type="hidden" class="allField" id="primaryDepartmentW"
										value="">
								</div>
								<div class="form-group col-lg-2">
									<label><spring:message code="secondaryDepartment.label" />
										<!-- <span style="color:red; font-size:2">*</span> --></label> <input
										type="text"
										class="form-control allField searchItems searchBar"
										id="secondaryDepartmentW"
										placeholder="<spring:message code="search" />" style="" />
									<div class="services">
										<div class="items">
											<ul class="matchedStringUl secondaryDepartmentW" style=""></ul>
										</div>
									</div>
									<span id="secondaryDepartmentWError"
										style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
									<input type="hidden" class="allField" id="secondaryDepartmentW"
										value="">
								</div>
								<div class="form-group col-lg-2">
									<label><spring:message code="section.label" /> <!-- <span style="color:red; font-size:2">*</span> --></label>
									<input type="text" class="form-control allField searchItems "
										id="sectionW" value="${sku.section}"
										placeholder="<spring:message code="section.label" />" style="" />
								</div>
								<div class="form-group col-lg-2">
									<label><spring:message code="tax.exclusive.label" /></label>
									<div class="col-lg-10" style="padding-left: 0px">
										<select class="form-control" name="itemTaxExclusiveW"
											id="itemTaxExclusiveW">
											<option value="true"
												${sku.itemTaxExclusive == true ? 'selected' : ''}><spring:message
													code="yes.label" /></option>
											<option value="false"
												${sku.itemTaxExclusive == false ? 'selected' : ''}><spring:message
													code="no.label" /></option>
										</select>
									</div>
								</div>
								<div class="form-group col-lg-2">
									<label><spring:message code="hsnCode.label" /></label> <input
										type="text" class="form-control allField"
										value="${sku.itemTaxExclusive}" name="hsnCodeW" id="hsnCodeW"
										value="" placeholder="<spring:message code="hsnCode.label" />" />
								</div>

								<div class="form-group col-lg-2">
									<label><spring:message code="trackingRequired.label" /></label>
									<div class="col-lg-10" style="padding-left: 0px">
										<select class="form-control" name="itemTrackRequiredW"
											id="itemTrackRequiredW">
											<option value="true"
												${sku.trackingRequired == true ? 'selected' : ''}><spring:message
													code="yes.label" /></option>
											<option value="false"
												${sku.trackingRequired == false ? 'selected' : ''}><spring:message
													code="no.label" /></option>
										</select>
									</div>
								</div>


							</div>

							<div class="row">
								<div class="form-group col-lg-2">
									<label><spring:message code="alternate.sku.label" /></label> <input
										type="text" class="form-control allField" name="alternate_skuW"
										id="alternate_skuW" value=""
										placeholder="<spring:message code="alternate.sku.description.label" />" />
								</div>

								<div class="form-group col-lg-2">
									<label><spring:message code="season.code.label" /></label> <input
										type="text" class="form-control allField" name="season_code"
										id="season_code" value=""
										placeholder="<spring:message code="season.code.description.label" />" />
								</div>

								<div class="form-group col-lg-2">
									<label><spring:message code="alias.name.label" /></label> <input
										type="text" class="form-control allField" name="alias_nameW"
										id="alias_nameW" value=""
										placeholder="<spring:message code="alias.name.description.label" />" />
								</div>

								<div class="form-group col-lg-2">
									<label><spring:message code="item.type.label" /></label> <input
										type="text" class="form-control allField" name="item_typeW"
										id="item_typeW" value=""
										placeholder="<spring:message code="item.type.description.label" />" />
								</div>

								<div class="form-group col-lg-2">
									<label><spring:message code="item.design.label" /></label> <input
										type="text" class="form-control allField" name="item_designW"
										id="item_designW" value=""
										placeholder="<spring:message code="item.design.description.label" />" />
								</div>


								<div class="form-group col-lg-2" style="">
									<!-- 										<div class="form-group col-lg-9"> -->
									<label><spring:message code="comboQuick.label" /> </label> <select
										class="form-control allField" id="comboDetailW">
										<option value="true" ${sku.is_combo == true ? 'selected' : ''}>Yes</option>
										<option value="false"
											${sku.is_combo == true ? 'selected' : ''}>No</option>
									</select>
									<!--                              </div> -->
								</div>

							</div>


							<div class="row">

								<div class="form-group col-lg-2" style="">

									<label><spring:message code="product.handing.label" />
									</label> <input type="text" id="productHandingDetailW"
										name="productHandingW" style="resize: none;"
										class="form-control allField" value="${sku.product_handing}"
										placeholder="<spring:message code="enter.product.handing.label" />">

								</div>


								<div class="form-group col-lg-2" style="">

									<label><spring:message code="productUsage.label" /> </label> <input
										type="text" id="productUsageDetailW" name="productUsageQuickW"
										style="resize: none;" class="form-control allField"
										value="${sku.product_handing}"
										placeholder="<spring:message code="enter.product.handing.label" />">

								</div>
								<div class="form-group col-lg-2" style="">
									<label><spring:message code="productInTake.label" /> </label>
									<input type="text" id="productIntakeDetailW"
										style="resize: none;" class="form-control allField"
										value="${sku.product_consumption_interaction}"
										placeholder="<spring:message code="enterproductInTake.label" />">
								</div>
							</div>
							<div class="row">
								<div class="form-group col-lg-2" style="text-align: center;">
									<div class="icon-remove blue delete" id="picture1_imageW">
										<label class="myFile" id="picture1_labelW"> <img
											src="${pageContext.request.contextPath}/images/Add_image.png"
											alt="" style="width: 100px;" /> <input type="file"
											id="picture1W" name="picture1W"
											onchange="loadImageFileAsURL('picture1W',this);" /> <input
											type="hidden" id="picture1_refIdW" name="picture1W" /> <input
											type="hidden" id="picture1_nameW" />
										</label>
									</div>
								</div>
								<div class="form-group col-lg-2" style="text-align: center;">
									<div class="icon-remove blue delete" id="picture2_imageW">
										<label class="myFile" id="picture2_labelW"> <img
											src="${pageContext.request.contextPath}/images/Add_image.png"
											alt="" style="width: 100px;" /> <input type="file"
											id="picture2W" name="picture2W"
											onchange="loadImageFileAsURL('picture2W',this);" /> <input
											type="hidden" id="picture2_refIdW" name="picture2W" /> <input
											type="hidden" id="picture2_nameW" />
										</label>
									</div>
								</div>
								<div class="form-group col-lg-2" style="text-align: center;">
									<div class="icon-remove blue delete" id="picture3_imageW">
										<label class="myFile" id="picture3_labelW"> <img
											src="${pageContext.request.contextPath}/images/Add_image.png"
											alt="" style="width: 100px;" /> <input type="file"
											id="picture3" name="picture3W"
											onchange="loadImageFileAsURL('picture3W',this);" /> <input
											type="hidden" id="picture3_refIdW" name="picture3W" /> <input
											type="hidden" id="picture3_nameW" />
										</label>
									</div>
								</div>
								<div class="form-group col-lg-2">
									<div class="checkbox"
										style="padding-left: 20px; margin-top: 0px;">
										<input type="checkbox" id="nonTaxableW"> Non Taxable
									</div>
									<div class="checkbox"
										style="padding-left: 20px; margin-top: 20px;">
										<input type="checkbox" id="discountableW"> Discountable
									</div>
									<div class="checkbox"
										style="padding-left: 20px; margin-top: 20px;">
										<input type="checkbox" id="allowDecimalsW"> Allow
										Decimals
									</div>
								</div>
								<div class="form-group col-lg-2">
									<label><spring:message code="location.label" /> <span
										style="color: red; font-size: 2">*</span></label> <select
										class="form-control" onchange="addSelectedLocation();"
										id="LocationW" multiple="multiple" style="height: 91px;">
										<c:forEach var="location" items="${workLocationsList}">
											<option value="${location}">${location}</option>
										</c:forEach>
									</select> <span id="locationErrorW"
										style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
								</div>
								<div class="col-lg-2">
									<div class="row">
										<div class="form-group col-lg-10">
											<label><spring:message code="created.date.label" /></label>
											<div class="input-group">
												<div class="input-group-addon">
													<i class="fa fa-calendar"></i>
												</div>
												<input type="text" id="createdDateW" readonly="readonly"
													class="form-control dat"
													data-inputmask="'alias': 'dd/mm/yyyy'" data-mask />
											</div>
											<span id="createDateWError"
												style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
										</div>
									</div>
									<div class="row">
										<div class="form-group col-lg-10">
											<label><spring:message code="last.updated.label" /></label>
											<div class="input-group">
												<div class="input-group-addon">
													<i class="fa fa-calendar"></i>
												</div>
												<input type="text" id="lastUpdatedW" readonly="readonly"
													class="form-control dat"
													data-inputmask="'alias': 'dd/mm/yyyy'" data-mask />
											</div>
											<span id="lastUpdatedWError"
												style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
										</div>
									</div>
								</div>
							</div>

							<div class="row">
								<div class="form-group col-lg-6" style="">


									<label><spring:message code="product.precautions.label" />
									</label>
									<textarea rows="2" id="productPrecautionsW"
										name="productPrecautionsW" style="resize: none;"
										class="form-control allField"
										placeholder="<spring:message code="enter.product.precautions.label" />">${sku.product_precautions}</textarea>
									<span id="productPrecautionsWError"
										style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
								</div>




								<div class="form-group col-lg-6" style="">

									<label><spring:message code="product.sideEffects.label" />
									</label>
									<textarea rows="2" id="productSideEffectsW"
										name="productSideEffectsW" style="resize: none;"
										class="form-control allField"
										placeholder="<spring:message code="enter.product.sideEffects.label" />">${sku.product_precautions}</textarea>
									<span id="productSideEffectsWError"
										style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>

								</div>


							</div>





							<div class="row">
								<div class="form-group col-lg-12">
									<label><spring:message code="short.description.label" />
										<span style="color: red; font-size: 2">*</span></label>
									<textarea rows="2" id="shortDescriptionW"
										name="shortDescription" style="resize: none;"
										class="form-control allField"
										placeholder="<spring:message code="enter.short.description.label" />"></textarea>
									<span id="shortDescriptionWError"
										style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
								</div>
							</div>
							<div class="row">
								<div class="form-group col-lg-12">
									<label><spring:message code="warranty.details.label" /></label>
									<textarea rows="2" class="form-control allField"
										name="warrantyDetails" style="resize: none;"
										id="warrantyDetailsW" required
										placeholder="<spring:message code="enter.warranty.details.label" />"></textarea>
									<span id="warrantyDetailsWError"
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
											onclick="activateHeader('priceListW');" id="priceListImgW"
											alt=""
											src="${pageContext.request.contextPath}/images/leftHeaderIconGreen.png">
									</div>
									<hr
										style="margin-top: 31px; width: 100%; border-top: 1px solid rgb(181, 230, 29);" />
									<hr
										style="margin-top: -18px; width: 100%; border-top: 1px solid rgb(181, 230, 29);" />
								</div>
							</div>

							<div class="priceListW">
								<div class="row " style="padding-left: 0px">



									<div class="col-lg-2  form-group"
										style="width: 12.2%; padding: 0px 0px 0px 15px;">
										<div class="col-lg-2"
											style="background: #eee; width: 110%; white-space: nowrap; border-top: 2px solid #ccc; padding-left: 0px; padding-right: 0px; border-bottom: 2px solid #ccc;">
											<label class="white-space:nowrap;"><spring:message
													code="specific.location.label" /> </label>
										</div>
										<!-- <div class="col-lg-12" style="border: 1px solid #CCC;"> -->
										<div class="col-lg-12" style="padding-left: 0px">
											<div class="row" style="">

												<div class="col-lg-9"
													style="padding-top: 14px; margin-left: -16px;; padding-left: 0px; padding-bottom: 14px; padding-right: 0px; white-space: nowrap;">
													<input type="radio" style="visibility: hidden;"
														name="priceListTypeW" checked="checked" value="all">
													<input type="radio" style="visibility: hidden;"
														name="priceListTypeW" value="specific">
													<spring:message code="specific.location.label" />
													<input type="checkbox" style="vertical-align: -3px;"
														id="specificW" onchange="changePriceListType(this);">
												</div>
												<div class="col-lg-12 " style="padding-right: 0px;">
													<select style="margin-top: -2px;" class="form-control"
														disabled="disabled" id="selectedLocationW"
														onchange="getPriceListForSelectedLocation(this);"></select>
													<br>
												</div>
											</div>
										</div>
									</div>
									<!-- </div> -->
									



									<div class="form-group col-lg-2"
										style="width: 12%; padding: 0px 0px 0px 25px; margin-left: 13px">
										<div class="col-lg-2"
											style="background: #eee;; width: 100%; white-space: nowrap; border-top: 2px solid #ccc; padding-left: 0px; padding-right: 0px; border-bottom: 2px solid #ccc;">
											<label class=""><spring:message
													code="product.range.label" /> </label>
										</div>
										<br>
										<br>
										<div class="col-lg-12" style="padding-left: 0px">
											<div class="row" style="">

												<div class="col-lg-12" style="padding-right: 0px;">
													<input type="text" class="form-control" value=""
														id="productRangeDropDownW" />
												</div>
											<%-- 	<img
													style="cursor: pointer; width: 28px; padding-right: 0px;"
													onclick="appendProductRangeWellness();"
													src="${pageContext.request.contextPath}/images/RedPlus.png">
												<br>
												<div class="col-lg-12"
													style="padding-top: 3px; padding-right: 0px;">
													<select style="" class="form-control"
														id="productRangeDropDownW"></select>
												</div> --%>
											</div>
										</div>
									</div>




									<div class="form-group col-lg-2"
										style="width: 12%; padding: 0px 0px 0px 25px">
										<div class="col-lg-2"
											style="background: #eee;; width: 100%; white-space: nowrap; border-top: 2px solid #ccc; padding-left: 0px; padding-right: 0px; border-bottom: 2px solid #ccc;">
											<label><spring:message code="measure.range.label" />
											</label>
										</div>
										<br>
										<br>
										<div class="col-lg-12" style="padding-left: 0px">
											<div class="row" style="">

												<div class="col-lg-9" style="padding-right: 0px;">
													<input type="text" class="form-control" value=""
														id="measurementRangeDropDownW" />
												</div>
												<%-- <img
													style="cursor: pointer; width: 28px; padding-right: 0px;"
													onclick="appendMeasurementRangeWellness();"
													src="${pageContext.request.contextPath}/images/RedPlus.png">
												<br>
												<div class="col-lg-12"
													style="padding-top: 3px; padding-right: 0px;">
													<select style="" class="form-control"
														id="measurementRangeDropDownW"></select>
												</div> --%>
											</div>
										</div>
									</div>

									<div class="form-group col-lg-2"
										style="width: 12%; padding: 0px 0px 0px 25px">
										<div class="col-lg-2"
											style="background: #eee; width: 100%; white-space: nowrap; border-top: 2px solid #ccc; padding-left: 0px; padding-right: 0px; border-bottom: 2px solid #ccc;">
											<label class=""><spring:message code="utility.label" />
											</label>
										</div>
										<br>
										<br>
										<div class="col-lg-12" style="padding-left: 0px">
											<div class="row" style="">

												<div class="col-lg-9" style="padding-right: 0px;">
													<input type="text" class="form-control" value=""
														id="utilityRangeDropDownW" />
												</div>
												<%-- <img
													style="cursor: pointer; width: 28px; padding-right: 0px;"
													onclick="appendUtilityWellness();"
													src="${pageContext.request.contextPath}/images/RedPlus.png">
												<br>
												<div class="col-lg-12"
													style="padding-top: 3px; padding-right: 0px;">
													<select style="" class="form-control"
														id="utilityRangeDropDownW"></select>
												</div> --%>
											</div>
										</div>
									</div>




									<div class="col-lg-2"
										style="width: 12%; padding: 0px 0px 0px 25px">
										<div class="col-lg-2"
											style="background: #eee; width: 100%; white-space: nowrap; border-top: 2px solid #ccc; padding-left: 0px; padding-right: 0px; border-bottom: 2px solid #ccc;">
											<label class=""><spring:message code="colour.label" />
											</label>
										</div>
										<br>
										<br>
										<div class="col-lg-12" style="padding-left: 0px">
											<div class="row" style="">

												<div class="col-lg-12" style="padding-right: 0px;">
													<input type="text" class="form-control" value=""
														id="colourRangeDropDownW" />
												</div>
												<%-- <img
													style="cursor: pointer; width: 28px; padding-right: 0px;"
													onclick="appendColoursWellness();"
													src="${pageContext.request.contextPath}/images/RedPlus.png">
												<br>
												<div class="col-lg-12"
													style="padding-top: 3px; padding-right: 0px;">
													<select style="" class="form-control"
														id="colourRangeDropDownW"></select>
												</div> --%>
											</div>
										</div>
									</div>




									<div class="col-lg-2"
										style="width: 12%; padding: 0px 0px 0px 25px">
										<div class="col-lg-2"
											style="background: #eee; width: 100%; white-space: nowrap; border-top: 2px solid #ccc; padding-left: 0px; padding-right: 0px; border-bottom: 2px solid #ccc;">
											<label class=""><spring:message code="size.label" />
											</label>
										</div>
										<br>
										<br>
										<div class="col-lg-12" style="padding-left: 0px">
											<div class="row" style="">

												<div class="col-lg-12" style="padding-right: 0px;">
													<input type="text" class="form-control" value=""
														id="sizeRangeDropDownW" />
												</div>
										<%-- 		<img
													style="cursor: pointer; width: 28px; padding-right: 0px;"
													onclick="appendSizeWellness();"
													src="${pageContext.request.contextPath}/images/RedPlus.png">
												<br>
												<div class="col-lg-12"
													style="padding-right: 0px; padding-top: 3px">
													<select style="" class="form-control"
														id="sizeRangeDropDownW"></select>
												</div> --%>
											</div>
										</div>
									</div>




									<div class="col-lg-2"
										style="width: 12%; padding: 0px 0px 0px 25px">

										<div class="col-lg-2"
											style="background: #eee; width: 100%; white-space: nowrap; border-top: 2px solid #ccc; padding-left: 0px; padding-right: 0px; border-bottom: 2px solid #ccc;">
											<label class=""><spring:message code="batch.label" />
											</label>
										</div>
										<br>
										<br>
										<div class="col-lg-12" style="padding-left: 0px">
											<div class="row" style="">

												<div class="col-lg-12" style="padding-right: 0px;">
													<input type="text" class="form-control" value=""
														id="batchRangeDropDownW" />
												</div>
												<%-- <img
													style="cursor: pointer; width: 28px; padding-right: 0px;"
													onclick="appendBatchWellness();"
													src="${pageContext.request.contextPath}/images/RedPlus.png">
												<br>
												<div class="col-lg-12"
													style="padding-top: 3px; padding-right: 0px;">
													<select style="" class="form-control"
														id="batchRangeDropDownW"></select>
												</div> --%>
											</div>

										</div>
									</div>
									<div class="col-lg-2"
										style="width: 12.2%; padding: 0px 0px 0px 25px">
										<div class="col-lg-2"
											style="background: #eee; width: 100%; white-space: nowrap; border-top: 2px solid #ccc; padding-left: 0px; padding-right: 0px; border-bottom: 2px solid #ccc;">
											<label class=""><spring:message
													code="style.range.label" /> </label>
										</div>
										<br>
										<br>
										<div class="col-lg-12" style="padding-left: 0px">
											<div class="row" style="">

												<div class="col-lg-12" style="padding-right: 0px;">
													<input type="text" class="form-control" value=""
														id="styleRangeDropDownW" />
												</div>
												<%-- <img
													style="cursor: pointer; width: 29px; padding-right: 0px;"
													onclick="appendStyleRangeWellness();"
													src="${pageContext.request.contextPath}/images/RedPlus.png">
												<br>
												<div class="col-lg-12"
													style="padding-right: 0px; padding-top: 3px">
													<select style="" class="form-control"
														id="styleRangeDropDownW">
														<c:forEach var="style" items="${sku.styleRangeList}">
															<option value="${style}">${style}</option>
														</c:forEach>
													</select>
												</div> --%>
											</div>
										</div>
									</div>

								</div>

								<div class="row">
									<div class="col-lg-12" style="margin-top: -21px;">
										<div class="col-lg-9" style=""></div>



										<div class="col-lg-2"
											style="margin-top: 0px;    margin-left: 2%; border-top: 2px solid #ccc; padding-left: 0px; padding-right: 0px; border-radius: 1px; background: #ccc; width: 100px;">
											<img
												style="float: right; cursor: pointer; margin-right: 5px; width: 30px;"
												onclick="appendPriceListWellness();" alt=""
												src="${pageContext.request.contextPath}/images/addIcon.PNG">
										</div>

										<div class="col-lg-2"
											style="margin-top: 0px; border-top: 2px solid #ccc; padding-left: 0px; padding-right: 0px; border-radius: 1px; background: #ccc; width: 100px; margin-left: 4px;">
											<img
												style="float: right; cursor: pointer; margin-right: 5px; width: 30px;"
												onclick="deletePriceListWellness();" alt=""
												src="${pageContext.request.contextPath}/images/deleteIcon.png">
										</div>
									</div>
								</div>
								<!-- <div class="row" style="margin-top: -22px;"> -->
								<div class="row" style="">
									<div class="col-md-10 priceListWForLocation">
										<div class="WAllLocation priceListWLocationDiv">
											<div class="pricelistW" id="pricelistWAllLocation1">
												<div class="row-fluid-5">
													<div class="form-group col-lg-2 "
														style="padding-left: 0px;">
														<input type="hidden" id="productRangeWAllLocation1">
														<input type="hidden" id="measurementRangeWAllLocation1">
														<input type="hidden" id="utilityRangeWAllLocation1">
														<input type="hidden" id="colourRangeWAllLocation1">
														<input type="hidden" id="sizeRangeWAllLocation1"> <input
															type="hidden" id="batchRangeWAllLocation1"> <input
															type="hidden" id="styleRangeWAllLocation1"> <label><spring:message
																code="cost.price.label" /> <span
															style="color: red; font-size: 2">*</span></label> <input
															type="text" class="form-control allField req pluCost"
															onkeydown="clearError(this);" onblur="calcMarkUpWellness(this);"
															value="" id="pluCostPriceWAllLocation1"
															oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');"
															placeholder="<spring:message code="enter.cost.price.label" />" />
														<span id="pluCostPriceWAllLocation1Error"
															style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
													</div>

													<div class="form-group col-lg-2 "
														style="margin-left: 14px;">
														<label><spring:message code="price.label" /> <span
															style="color: red; font-size: 2">*</span></label> <input
															type="text" class="form-control allField req"
															onkeydown="clearError(this);" value=""
															id="pluPriceWAllLocation1"
															oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');"
															placeholder="<spring:message code="enter.price.label" />" />
														<span id="pluPriceWAllLocation1Error"
															style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
													</div>
													<div class="form-group col-lg-2 " style="margin-left: 1px;">
														<label><spring:message code="sale.price.label" />
															<span style="color: red; font-size: 2">*</span></label> <input
															type="text" class="form-control allField req pluSale"
															onkeydown="clearError(this);" onblur="calcMarkUpWellness(this);"
															value="" id="pluSalePriceWAllLocation1"
															oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');"
															placeholder="<spring:message code="enter.sale.price.label" />" />
														<span id="pluSalePriceWAllLocation1Error"
															style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
													</div>

													<div class="form-group col-lg-2"
														style="white-space: nowrap; margin-left: 1px;">

														<label><spring:message code="ws.price.label" /> <span
															style="color: red; font-size: 2">*</span></label> <input
															type="text" class="form-control allField req" value=""
															onkeydown="clearError(this);" id="pluWsPriceWAllLocation1"
															oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');"
															placeholder="<spring:message code="enter.ws.price.label" />" />
														<span id="pluWsPriceWAllLocation1Error"
															style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
													</div>

													<div class="form-group col-lg-2" style="margin-left: 1px;">
														<label><spring:message code="ean.label" /></label> <input
															type="text" class="form-control allField"
															id="eanWAllLocation1" value=""
															placeholder="<spring:message code="enter.ean.label" />" />
													</div>

												</div>

												<div class="row-fluid-5">
													<div class="form-group col-lg-2" style="padding-left: 0px">
														<label><spring:message code="color.shade.label" /></label>
														<input type="text" class="form-control allField"
															onkeydown="clearError(this);"
															id="pluColorShadeWAllLocation1"
															placeholder="<spring:message code="enter.color.shade.label" />" />
														<span id="pluColorShadeWAllLocation1Error"
															style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
													</div>
													<div class="form-group col-lg-2" style="margin-left: 14px;">
														<label><spring:message code="mbq.label" /></label> <input
															type="text" class="form-control allField"
															onkeydown="clearError(this);" id="pluMbqWAllLocation1"
															placeholder="<spring:message code="enter.mbq.label" />" />
														<span id="pluMbqWAllLocation1Error"
															style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
													</div>

													<div class="form-group col-lg-2"
														style="white-space: nowrap; margin-left: 1px;">
														<label><spring:message
																code="quantity.in.hand.label" /> <span
															style="color: red; font-size: 2">*</span></label> <input
															type="text" class="form-control allField req"
															onblur="calculateStock();" onkeydown="clearError(this);"
															value="" id="pluQuantityWAllLocation1"
															oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');"
															placeholder="<spring:message code="enter.quantity.in.hand.label" />" />
														<span id="pluQuantityWAllLocation1Error"
															style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
													</div>
													<div class="form-group col-lg-2" style="margin-left: 1px;">
														<label><spring:message code="acp.label" /></label> <input
															type="text" class="form-control allField"
															onkeydown="clearError(this);" id="pluAcpWAllLocation1"
															placeholder="<spring:message code="enter.acp.label" />" />
														<span id="pluAcpWAllLocation1Error"
															style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
													</div>



													<div class="form-group col-lg-2 "
														style="margin-left: 1px; padding-right: 0px">
														<label><spring:message code="created.date.label" /></label>
														<div class="input-group">
															<div class="input-group-addon">
																<i class="fa fa-calendar"></i>
															</div>
															<input type="text" id="pluCreatedDateWAllLocation1"
																readonly="readonly" class="form-control dat"
																data-inputmask="alias: dd/mm/yyyy" data-mask />
														</div>
														<span id="pluCreatedDateWAllLocation1Error"
															style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
													</div>
												</div>

											<div class="row-fluid-5">

													<div class="form-group col-lg-2 "
														style="padding-left: 0px; padding-right: 0px">
														<label><spring:message code="updated.date.label" /></label>
														<div class="input-group">
															<div class="input-group-addon">
																<i class="fa fa-calendar"></i>
															</div>
															<input type="text" id="pluUpdatedDateWAllLocation1"
																readonly="readonly" class="form-control dat"
																data-inputmask="alias: dd/mm/yyyy" data-mask />
														</div>
														<span id="pluUpdatedDateWAllLocation1Error"
															style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
													</div>
													<div class="form-group col-lg-2 span2"
														style="margin-left: 26px; padding-right: 0px">
														<label><spring:message code="expiry.date.label" /></label>
														<div class="input-group">
															<div class="input-group-addon">
																<i class="fa fa-calendar"></i>
															</div>
															<input class="form-control allField req dat"
																readonly="readonly" style="background-color: white;"
																id="pluExpiryDateWAllLocation1" size="20" type="text"
																onfocus="callCalender('pluExpiryDateWAllLocation1')"
																onclick="callCalender('pluExpiryDateWAllLocation1')"
																placeholder="DD/MM/YYYY" />
														</div>
														<span id="pluExpiryDateWAllLocation1Error"
															style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
													</div>

													<div class="form-group col-lg-2 span2"
														style="margin-left: 15px; padding-right: 0px">
														<label><spring:message code="packaged.date.label" /></label>
														<div class="input-group">
															<div class="input-group-addon">
																<i class="fa fa-calendar"></i>
															</div>
															<input class="form-control allField req dat"
																readonly="readonly" style="background-color: white;"
																id="pluPackagedDateWAllLocation" size="20" type="text"
																onfocus="callCalender('pluPackagedDateWAllLocation')"
																onclick="callCalender('pluPackagedDateWAllLocation')"
																placeholder="DD/MM/YYYY" />
														</div>
														<span id="pluPackagedDateWAllLocationError"
															style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
													</div>

													<div class="form-group col-lg-2 "
														style="white-space: nowrap;">
														<label><spring:message
																code="newarrival.product.status" /> </label> <select
															class="form-control allField req" name="status"
															id="skuStatusWAllLocation1">
															<option value="true"
																${'true' == plu.skuStatus ? 'selected' : ''}>Active</option>
															<option value="false"
																${'false' == plu.skuStatus ? 'selected' : ''}>In-Active</option>

														</select>
													</div>


													<div class="form-group col-lg-2" style="padding-right: 0px">
														<label><spring:message
																code="businessCategory.label" /> </label> <input type="text"
															id="businessCategoryDetailWAllLocation1"
															name="productPrecautionsW" style="resize: none;"
															class="form-control allField"
															value="${plu.businessCategory}"
															placeholder="<spring:message code="enterbusinescategory.label" />">
														<span id="businessCategoryWError"
															style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
													</div>

												</div>


												<div class="row">

													<div class="form-group col-lg-2" style="">
														<label><spring:message code="pack.size.label" /></label>
														<input type="text" class="form-control allField"
															id="pricePackSizeWAllLocation1" value="${plu.pack_size}"
															placeholder="<spring:message code="enter.pack.size.label" />" />
													</div>



													<div class="form-group col-lg-2" style="">
														<label><spring:message
																code="min.sales.quantity.label" /></label> <input type="text"
															class="form-control allField"
															id="priceMinSaleQtyWAllLocation1"
															value="${plu.min_sale_qty}"
															placeholder="<spring:message code="min.sales.quantity.label" />" />
													</div>



													<div class="form-group col-lg-2 span2"
														style="padding-right: 0px; margin-left: 17px">
														<label><spring:message
																code="businessSubcategory.label" /> </label> <input type="text"
															id="businessSubcategoryDetailWAllLocation1"
															name="productHandingW" style="resize: none;"
															id="businessSubcategoryW"
															class="form-control allField"
															value="${plu.businessSubCategory}"
															placeholder="<spring:message code="enter.businessSubcategory.label" />">
														<span id="productSideEffectsWError"
															style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>

													</div>


												</div>


												<div class="row">
													<div class="form-group col-lg-5" style="padding-right: 0px">

														<label><spring:message
																code="technicalSpecification.label" /> </label>
														<textarea rows="2" id="technicalSpecDetailWAllLocation1"
															style="resize: none" class="form-control allField"
															placeholder="<spring:message code="entertechnicalSpecification.label" />">${plu.technical_specification}</textarea>
														<span id="productSideEffectsWError"
															style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>

													</div>


													<div class="form-group col-lg-5" style="padding-right: 0px">
														<label><spring:message code="description.label" />
															<span style="color: red; font-size: 2">*</span></label>
														<textarea rows="2" class="form-control allField"
															onkeydown="clearError(this);" id="pluDescWAllLocation1"
															style="resize: none;" required
															placeholder="<spring:message code="enter.description.label" />"></textarea>
														<span id="pluDescWAllLocation1Error"
															style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
													</div>
												</div>
											</div>
										</div>
									</div>

									<div class="pricelistW" id="pricelistWAllLocation0"
										style="display: none;">
										<div class="row-fluid-5">
											<div class="form-group col-lg-2 " style="padding-left: 0px;">
												<input type="hidden" id="productRangeWAllLocation0">
												<input type="hidden" id="measurementRangeWAllLocation0">
												<input type="hidden" id="utilityRangeWAllLocation0">
												<input type="hidden" id="colourRangeWAllLocation0"> <input
													type="hidden" id="sizeRangeWAllLocation0"> <input
													type="hidden" id="batchRangeWAllLocation0"> <input
													type="hidden" id="styleRangeWAllLocation0"> <label><spring:message
														code="cost.price.label" /> <span
													style="color: red; font-size: 2">*</span></label> <input
													type="text" class="form-control allField req pluCost"
													onkeydown="clearError(this);" onblur="calcMarkUpWellness(this);"
													value="" id="pluCostPriceWAllLocation0"
													oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');"
													placeholder="<spring:message code="enter.cost.price.label" />" />
												<span id="pluCostPriceWAllLocation0Error"
													style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
											</div>
											<div class="form-group col-lg-2 " style="margin-left: 14px;">
												<label><spring:message code="price.label" /> <span
													style="color: red; font-size: 2">*</span></label> <input
													type="text" class="form-control allField req"
													onkeydown="clearError(this);" value=""
													id="pluPriceWAllLocation0"
													oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');"
													placeholder="<spring:message code="enter.price.label" />" />
												<span id="pluPriceWAllLocation0Error"
													style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
											</div>
											<div class="form-group col-lg-2 " style="margin-left: 1px;">
												<label><spring:message code="sale.price.label" /> <span
													style="color: red; font-size: 2">*</span></label> <input
													type="text" class="form-control allField req pluSale"
													onkeydown="clearError(this);" onblur="calcMarkUpWellness(this);"
													value="" id="pluSalePriceWAllLocation0"
													oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');"
													placeholder="<spring:message code="enter.sale.price.label" />" />
												<span id="pluSalePriceWAllLocation0Error"
													style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
											</div>

											<div class="form-group col-lg-2">
												<label><spring:message code="ws.price.label" /> <span
													style="color: red; font-size: 2">*</span></label> <input
													type="text" class="form-control allField req" value=""
													onkeydown="clearError(this);" id="pluWsPriceWAllLocation0"
													oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');"
													placeholder="<spring:message code="enter.ws.price.label" />" />
												<span id="pluWsPriceWAllLocation0Error"
													style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
											</div>

											<div class="form-group col-lg-2" style="margin-left: 1px;">
												<label><spring:message code="ean.label" /></label> <input
													type="text" class="form-control allField"
													id="eanWAllLocation0" value=""
													placeholder="<spring:message code="enter.ean.label" />" />
											</div>
										</div>

										<div class="row-fluid-5">

											<div class="form-group col-lg-2" style="padding-left: 0px">
												<label><spring:message code="color.shade.label" /></label>
												<input type="text" class="form-control allField"
													onkeydown="clearError(this);"
													id="pluColorShadeWAllLocation0"
													placeholder="<spring:message code="enter.color.shade.label" />" />
												<span id="pluColorShadeWAllLocation0Error"
													style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
											</div>
											<div class="form-group col-lg-2" style="margin-left: 14px;">
												<label><spring:message code="mbq.label" /></label> <input
													type="text" class="form-control allField"
													onkeydown="clearError(this);" id="pluMbqWAllLocation0"
													placeholder="<spring:message code="enter.mbq.label" />" />
												<span id="pluMbqWAllLocation0Error"
													style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
											</div>

											<div class="form-group col-lg-2"
												style="white-space: nowrap; margin-left: 1px;">
												<label><spring:message code="quantity.in.hand.label" />
													<span style="color: red; font-size: 2">*</span></label> <input
													type="text" class="form-control allField req"
													onblur="calculateStock();" onkeydown="clearError(this);"
													value="" id="pluQuantityWAllLocation0"
													oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');"
													placeholder="<spring:message code="enter.quantity.in.hand.label" />" />
												<span id="pluQuantityWAllLocation0Error"
													style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
											</div>
											<div class="form-group col-lg-2" style="margin-left: 1px;">
												<label><spring:message code="acp.label" /></label> <input
													type="text" class="form-control allField"
													onkeydown="clearError(this);" id="pluAcpWAllLocation0"
													placeholder="<spring:message code="enter.acp.label" />" />
												<span id="pluAcpWAllLocation0Error"
													style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
											</div>


											<div class="form-group col-lg-2 "
												style="margin-left: 1px; padding-right: 0px">
												<label><spring:message code="created.date.label" /></label>
												<div class="input-group">
													<div class="input-group-addon">
														<i class="fa fa-calendar"></i>
													</div>
													<input type="text" id="pluCreatedDateWAllLocation0"
														readonly="readonly" class="form-control dat"
														data-inputmask="alias: dd/mm/yyyy" data-mask />
												</div>
												<span id="pluCreatedDateWAllLocation0Error"
													style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
											</div>

										</div>



										<div class="row-fluid-5">


											<div class="form-group col-lg-2"
												style="padding-left: 0px; padding-right: 0px">
												<label><spring:message code="updated.date.label" /></label>
												<div class="input-group">
													<div class="input-group-addon">
														<i class="fa fa-calendar"></i>
													</div>
													<input type="text" id="pluUpdatedDateWAllLocation0"
														readonly="readonly" class="form-control dat"
														data-inputmask="alias: dd/mm/yyyy" data-mask />
												</div>
												<span id="pluUpdatedDateWAllLocation0Error"
													style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
											</div>
											<div class="form-group col-lg-2 span2"
												style="margin-left: 26px; padding-right: 0px">
												<label><spring:message code="expiry.date.label" /></label>
												<div class="input-group">
													<div class="input-group-addon">
														<i class="fa fa-calendar"></i>
													</div>
													<input class="form-control allField req dat"
														readonly="readonly" style="background-color: white;"
														id="pluExpiryDateWAllLocation0" size="20" type="text"
														onfocus="callCalender('pluExpiryDateWAllLocation0')"
														onclick="callCalender('pluExpiryDateWAllLocation0')"
														placeholder="DD/MM/YYYY" />
												</div>
												<span id="pluExpiryDateWAllLocation0Error"
													style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
											</div>



											<div class="form-group col-lg-2 "
												style="white-space: nowrap;">
												<label><spring:message
														code="newarrival.product.status" /> </label> <select
													class="form-control allField req"
													id="skuStatusWAllLocation0">
													<option value="true">Active</option>
													<option value="false">In-Active</option>

												</select>
											</div>
											<div class="form-group col-lg-2" style="padding-right: 0px">

												<label><spring:message code="businessCategory.label" />
												</label> <input type="text" id="businessCategoryDetailWAllLocation0"
													name="productPrecautionsW" style="resize: none;"
													class="form-control allField"
													value="${sku.product_precautions}"
													placeholder="<spring:message code="enterbusinescategory.label" />">
												<span id="businessCategoryQuickError"
													style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
											</div>
										</div>

										<div class="row">
											<div class="form-group col-lg-2" style="">
												<label><spring:message code="pack.size.label" /></label> <input
													type="text" class="form-control allField"
													id="pricePackSizeWAllLocation0" value="${plu.pack_size}"
													placeholder="<spring:message code="enter.pack.size.label" />" />
											</div>



											<div class="form-group col-lg-2 span2"
												style="margin-left: 20px">
												<label><spring:message
														code="min.sales.quantity.label" /></label> <input type="text"
													class="form-control allField"
													id="priceMinSaleQtyWAllLocation0" value=""
													placeholder="<spring:message code="min.sales.quantity.label" />" />
											</div>




											<div class="form-group col-lg-2 span2"
												style="padding-right: 0px">
												<label><spring:message
														code="businessSubcategory.label" /> </label> <input type="text"
													id="businessSubcategoryDetailWAllLocation0"
													name="productHandingW" style="resize: none;"
													id="businessSubcategoryW" class="form-control allField"
													value="${sku.product_side_effects}"
													placeholder="<spring:message code="enter.businessSubcategory.label" />">
												<span id="productSideEffectsWError"
													style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>

											</div>
										</div>


										<div class="row">



											<div class="form-group col-lg-5 " style="padding-right: 0px">
												<label><spring:message
														code="technicalSpecification.label" /> </label>
												<textarea rows="2" id="technicalSpecDetailWAllLocation0"
													style="resize: none" class="form-control allField"
													placeholder="<spring:message code="entertechnicalSpecification.label" />">${sku.product_precautions}</textarea>
												<span id="productSideEffectsWError"
													style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
											</div>

											<div class="form-group col-lg-5" style="padding-right: 0px">
												<label><spring:message code="description.label" />
													<span style="color: red; font-size: 2">*</span></label>
												<textarea rows="2" class="form-control allField"
													onkeydown="clearError(this);" id="pluDescWAllLocation0"
													style="resize: none;" required
													placeholder="<spring:message code="enter.description.label" />"></textarea>
												<span id="pluDescWAllLocation0Error"
													style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
											</div>
										</div>
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
														onclick="showPrevPriceListWellness();" id="prevImgW" alt=""
														src="${pageContext.request.contextPath}/images/leftIcon.png">

												</div>

												<div class="col-md-3 col-sm-3 col-xs-4"	style="padding-left: 0px; padding-right: 0px;">

													<span id="currentPriceListW"
														style="width: 100%; text-align: center /*margin-left: 53px;*/; font-size: 19px; margin-top: 10px; position: absolute;">1
														of 1</span>

												</div>

												<div class="col-md-3 col-sm-3 col-xs-3"
													style="padding-left: 0px; padding-right: 0px;">

													<img
														style="cursor: pointer; /*margin-right: 9px;*/ /*margin-top: -24px;margin-bottom: -26px;*/ opacity: 0.5;"
														onclick="showNextPriceListWellness();" id="nextImgW" alt=""
														src="${pageContext.request.contextPath}/images/rightIcon.png">

												</div>


											</div>
										</div>
									</div>
								</div>
							</div>
							<!-- /.box-body -->
							<div class="row" style="text-align: right;">
								<div class="col-md-12">
									<input type="button" id="edit" style="margin-right: 25px"
										class="btnCls" onclick="validateWellnessSkuForm('new')"
										value="<spring:message code="submit.label" />" /> <input
										type="button" id="edit" class="btnCls"
										style="margin-right: 25px" onclick="resetAll();"
										value="<spring:message code="reset.label" />" />
									<c:if test="${sessionScope.role == 'super admin'}">
										<input type="button" class="btnCls" style="margin-right: 2%;"
											onclick="viewWellnessSkuMaster('skumaster','0');"
											value="<spring:message code="cancel.label" />" />
									</c:if>

									<c:forEach var="accessControl"
										items="${sessionScope.outletMasterSettings}">
										<c:if
											test="${accessControl.appDocument == 'SkuMaster' && accessControl.write == true && accessControl.read == true}">
											<input type="button" class="btnCls"
												onclick="viewSkuMaster('skumaster','0');"
												value="<spring:message code="cancel.label" />" />
										</c:if>
									</c:forEach>
								</div>
							</div>

							<br />
					</form>
				</div>

			</div>
		</div>
	</section>
	<!-- /.content -->
</body>
</html>