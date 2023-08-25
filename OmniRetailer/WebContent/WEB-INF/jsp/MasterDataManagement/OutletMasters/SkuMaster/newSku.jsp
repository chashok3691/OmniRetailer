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



<!--  added by        :  koti bomminei
      description     :  to ristrict the user from entering special characters     -->


	
	
	
	


<style type="text/css">
.thumbnail
{
    margin-bottom: 5px !important;
}
.colpadding
{
width:14.5%;
}
.col-lg9-9
{
width:81%;
}
.row-fluid-5 {
	width: 100%;
	*zoom: 1;
}
.dropdownwidth
{
    width: 135px;
}
.imgtextbox
{
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

.row-padding
{
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
	.col-padding{
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
						callCalender('pluExpiryDateAllLocation1');
						
						callCalender('pluPackagedDateAllLocation1');
						//callCalender('plumanufacturedDateAllLocation1');
						//callCalender('pluBestBeforeDateAllLocation1');
						//callCalender('pluEffectivedDateAllLocation1');
						//callCalender('pluwarrantyDateAllLocation1');
						$(".priceList").hide();
						var dateTime = getCurrentDate();
						var date = dateTime.split(' ');
						date = date[0].split('/');
						var formatedDate = date[1] + "/" + date[0] + "/"
								+ date[2];
						$('#createdDate').val(formatedDate);
						$('#lastUpdated').val(formatedDate);
						$('#pluCreatedDateAllLocation1').val(formatedDate);
						$('#pluUpdatedDateAllLocation1').val(formatedDate);
						setPriceListDivContent();
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
												$(".priceListForLocation")
														.append(
																"<div class='"+loc+" priceListLocationDiv' style='display:none;'></div>");
											}
										});
						$("#selectedLocation").html(op);
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
								<div id="ErrorDetail" class="Error"
									style="text-align: center; color: red; font-size: 2; font-weight: bold;">${err}</div>
								<div id="SuccessDetail" class="Error"
									style="text-align: center; color: blue; font-size: 2; font-weight: bold;">${success}</div>
								<input type="button" id="edit" style="position: relative;margin-right: 25px" class="btnCls" onclick="validateSkuForm('new')" value="<spring:message code="submit.label" />" /> 
								<input type="button" id="edit" class="btnCls"
									style="margin-right: 25px;position: relative" onclick="resetAll();"
									value="<spring:message code="reset.label" />" />
								<c:if test="${sessionScope.role == 'super admin'}">
									<input type="button" class="btnCls" style="position: relative;margin-right: 15px;"
										onclick="viewSkuMaster('skumaster','0');"
										value="<spring:message code="cancel.label" />" />
								</c:if>
								<c:forEach var="accessControl"
									items="${sessionScope.outletMasterSettings}">
									<c:if
										test="${accessControl.appDocument == 'SkuMaster' && accessControl.write == true && accessControl.read == true}">
										<input type="button" class="btnCls" style="margin-right: 15px;position: relative"
											onclick="viewSkuMaster('skumaster','0');"
											value="<spring:message code="cancel.label" />" />
									</c:if>
								</c:forEach>
								<hr style="margin-top: 4px; width: 99%;" />
							</div>
							<div class="row">
								<div class="form-group col-lg-2">
									<label><spring:message code="skuid.label" /> <span
										style="color: red; font-size: 2">*</span></label> <input type="text" onblur="criteria(this)"
										class="form-control allField" id="skuId" value=""
										oninput="this.value = this.value.replace(/[^a-zA-Z0-9 -]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');"
										placeholder="<spring:message code="enter.sku.id.label" />" />
									<span id="skuIdError"
										style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
								</div>
								<div class="form-group col-lg-2">
									<label><spring:message code="product.name.label" /> <span
										style="color: red; font-size: 2">*</span></label> <input type="text"
										 onblur="criteria(this)"class="form-control allField" id="shortDescription" name="shortDescription"
										placeholder="<spring:message code="enter.product.name.label" />"
										style="" />
									<!-- <div class="services">
										<div class="items">
											<ul class="matchedStringUl productNameSku" style=""></ul>
										</div>
									</div> -->
									<!-- <span id="productNameError"
										style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span> -->
										<span id="shortDescriptionError"
										style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
									<input  onblur="criteria(this)" type="hidden" class="allField" id="productId" value="">
								</div>
								<div class="form-group col-lg-2">
									<label><spring:message code="category.name.label" /></label>
								<select class="form-control allField"  id="categoryNameID" name="categoryNameID"  onchange="searchSubCategories('categoryNameID','subCategoryName')">
	                             <c:forEach var="categoryList" items="${categoryList}">
									<option value="${categoryList.categoryName}" ${categoryList.categoryName == sku.productCategory ? 'selected' : ''} id="${categoryList.categoryName}" >${categoryList.categoryName}</option>
						 		</c:forEach>
	                        </select>
	                        <input type="hidden" id="categoryId" name="categoryId"
										value="${sku.productCategory}" />
									<%-- <input
										type="text" class="form-control allField" readonly="readonly"
										id="categoryName" name="categoryName" value="" required
										placeholder="<spring:message code="category.name.label" />" />
									<input type="hidden" id="categoryId" name="categoryId" value="" />
									<span id="eanError"
										style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span> --%>
								</div>
								<div class="form-group col-lg-2">
									<label><spring:message code="sub.category.name.label" /></label>
									 <select class="form-control" id="subCategoryNameID" name="subCategoryNameID" >
	                          <c:forEach var="subCategoryDetailsList" items="${subCategoryDetailsList}">
									<option value="${subCategoryDetailsList.subcategoryName}" ${subCategoryDetailsList.subcategoryName == sku.subCategory ? 'selected' : ''} id="${subCategoryDetailsList.subcategoryName}" >${subCategoryDetailsList.subcategoryName}</option>
						 		</c:forEach>
	                        </select>
									<%-- <input type="text" class="form-control allField"
										readonly="readonly" id="subCategoryName"
										name="subCategoryName" value="" required
										placeholder="<spring:message code="sub.category.name.label" />" />
									<span id="eanError"
										style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span> --%>
								</div>
								<div class="form-group col-lg-2">
									<label><spring:message code="ean.label" /></label> <input
										type="text" class="form-control allField" id="ean"  onblur="criteria(this)" name="ean"
										value="" required
										placeholder="<spring:message code="enter.ean.label" />" /> <span
										id="eanError"
										style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
								</div>
								<div class="form-group col-lg-2">
									<label><spring:message code="supplier.name.label" /> <span
										style="color: red; font-size: 2"></span></label> <input type="text" onblur="criteria(this)"
										autocomplete="off" class="form-control allField searchItems searchBar"
										name="supplier_name" id="searchSupplier"
										placeholder="<spring:message code="search.supplier.label" />"
										style="" />
									<div class=services>
										<div class="items">
											<ul class="matchedStringUl supplier"
												style="width: 89% !important; padding: 0px !important;"></ul>
										</div>
									</div>
									<span id="supplierNameError"
										style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
									<input type="hidden"  onblur="criteria(this)" class="allField" name="supplier_Id"
										id="supplier_Id" value="" />
								</div>
							</div>
							<div class="row">
								<div class="form-group col-lg-2">
									<label><spring:message code="brand.code.label" /></label>
									<div class="col-lg-10" style="padding-left: 0px">
										<select class="form-control" id="brandCode">
											<c:forEach var="brandName" items="${brandsList}">
												<option value="${brandName}">${brandName}</option>
											</c:forEach>
										</select>
									</div>
								</div>
								<div class="form-group col-lg-2">
									<label><spring:message code="manufacturer.code.label" /></label>
									<input type="text"  onblur="criteria(this)" class="form-control allField"
										name="manufacturerCode" id="manufacturerCode" value=""
										required
										placeholder="<spring:message code="enter.manufacturer.code.label" />" />
							<span id="manufacturerCodeError"
										style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
								</div>
								<div class="form-group col-lg-2">
									<label><spring:message code="manufacturer.name.label" />
										 <span style="color: red; font-size: 2">*</span> </label> <input
										type="text"  onblur="criteria(this)" class="form-control allField" id="manufacturer"
										name="make" value="" required
										placeholder="<spring:message code="enter.manufacturer.name.label" />" />
									<span id="manufacturerError"
										style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span> 
								</div>
								<div class="form-group col-lg-2">
									<label><spring:message code="uom.label" /> <span
										style="color: red; font-size: 2">*</span></label>
									<div class="col-lg-10" style="padding-left: 0px">
										<input type="text"   onblur="criteria(this)"  id="uomList" value="${sku.uom}" list="uom"/>
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
											<span id="uomListError"
										style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
									</div>
								</div>
								<div class="form-group col-lg-2">
									<label><spring:message code="uom.label.label" /></label>

									<div class="col-lg-10" style="padding-left: 0px">
										<input type="text"  onblur="criteria(this)" class="form-control allField"
											name="uomLabel" id="uomLabel" value=""
											placeholder="<spring:message code="enter.uom.label.label" />" />
										<span id="weightError"
											style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
									</div>
								</div>
								<div class="form-group col-lg-2">
									<label><spring:message code="pack.size.label" /></label>
									<div class="col-lg-10" style="padding-left: 0px">

										<input type="text"  onblur="criteria(this)" class="form-control allField"
											name="packSize" id="packSize" value="1" required
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
										<select class="form-control" name="zeroStock" id="zeroStock">
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

										<select class="form-control" name="jitStock" id="jitStock">
											<option value="false"><spring:message
													code="no.label" /></option>
											<option value="true"><spring:message
													code="yes.label" /></option>
										</select>
									</div>
								</div>
								<div class="form-group col-lg-2">
									<label><spring:message code="min.sales.quantity.label" />
										<span style="color: red; font-size: 2"></span></label>
									<div class="col-lg-9" style="padding-left: 0px">

										<input type="text"  onblur="criteria(this)" class="form-control allField"
											id="minSaleQty" name="minSaleQty" value="" required
											placeholder="<spring:message code="enter.min.sales.quantity.label" />"
											oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');" />
										<span id="minSaleQtyError"
											style="text-align: right;display:block; color: red; font-size: 2; font-weight: bold;"></span>
									</div>
								</div>
								
								
									<div class="form-group col-lg-2">
									<label><spring:message code="max.sales.quantity.label" />
										<span style="color: red; font-size: 2"></span></label>
									<div class="col-lg-9" style="padding-left: 0px">

										<input type="text"  onblur="criteria(this)" class="form-control allField"
											id="maxSaleQty" name="maxSaleQty" value="" required
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
											id="manufactureItem">
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
										<select class="form-control" name="packagedItem"
											id="packagedItem">
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
									<label><spring:message code="editable.label" /></label>
									<div class="col-lg-10" style="padding-left: 0px">
										<select class="form-control" name="editable" id="editable">
											<option value="false"><spring:message
													code="no.label" /></option>
											<option value="true"><spring:message
													code="yes.label" /></option>
										</select>
									</div>
								</div>
								
								<div class="form-group col-lg-2">

									<label><spring:message code="pattern.code.label" /></label>
									<div class="col-lg-10" style="padding-left: 0px">
										<input type="text"  onblur="criteria(this)" class="form-control allField" name=""
											id="patternCode" value="" required
											placeholder="<spring:message code="enter.pattern.code.label" />" />
										<span id="patternCodeError"
											style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
									</div>
								</div>
								<div class="form-group col-lg-2">

									<label><spring:message code="reorder.point.label" /></label>
									<div class="col-lg-10" style="padding-left: 0px">
										<input type="text"  onblur="criteria(this)" class="form-control allField"
											name="reorderPoint" id="reorderPoint" value="" required
											oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');"
											placeholder="<spring:message code="enter.reorder.point.label" />" />
										<span id="reorderPointError"
											style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
									</div>
								</div>
								<div class="form-group col-lg-2">

									<label><spring:message code="order.quantity.label" /></label>
									<div class="col-lg-9" style="padding-left: 0px">
										<input type="text"  onblur="criteria(this)" class="form-control allField"
											name="orderQuantity" id="orderQuantity" value="" required
											oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');"
											placeholder="<spring:message code="enter.order.quantity.label" />" />
										<span id="orderQuantityError"
											style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
									</div>
								</div>
								<div class="form-group col-lg-2">

									<label><spring:message code="product.lead.time.label" /></label>
									<div class="col-lg-10" style="padding-left: 0px">
										<input type="text"  onblur="criteria(this)" class="form-control allField"
											name="leadTime" id="leadTime" value="" required
											placeholder="<spring:message code="enter.product.lead.time.label" />"
											oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');" />
										<span id="leadTimeError"
											style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
									</div>
								</div>
								<div class="form-group col-lg-2">

									<label><spring:message code="product.max.stock.label" /></label>
									<div class="col-lg-10" style="padding-left: 0px">
										<input type="text" class="form-control allField" onblur="criteria(this)" 
											name="maxStock" id="maxStock" value="" required
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
											 name="stock" id="stock" value=""  onblur="criteria(this)"
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
										<select class="form-control" id="taxCode">
											<c:forEach var="tax" items="${taxDetails}">
												<option value="${tax.taxName}">${tax.taxId}-
													${tax.taxName}</option>
											</c:forEach>
										</select> <span id="taxCodeError"
											style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
									</div>
								</div>

								<div class="form-group col-lg-2">
									<label><spring:message code="fr.tax.code.label" /></label>
									<div class="col-lg-10" style="padding-left: 0px">
										<input type="text" class="form-control allField"   onblur="criteria(this)"
											name="frTaxCode" id="frTaxCode" value=""
											oninput="this.value = this.value.replace(/[^0-9]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');"
											required
											placeholder="<spring:message code="enter.fr.tax.code.label" />" />
									</div>
								</div>
								<div class="form-group col-lg-2">
									<label><spring:message code="mark.up.label" /></label>
									<div class="col-lg-9" style="padding-left: 0px">
										<input type="text"  onblur="criteria(this)" class="form-control allField"
											readonly="readonly" name="markUp" id="markUp" value=""
											required
											placeholder="<spring:message code="enter.mark.up.label" />" />
									</div>
								</div>
								<div class="form-group col-lg-2">
									<label><spring:message code="mark.down.label" /></label>
									<div class="col-lg-9" style="padding-left: 0px">
										<input type="text"  onblur="criteria(this)" class="form-control allField"
											name="markDown" id="markDown" value="" required
											placeholder="<spring:message code="enter.mark.down.label" />" />
									</div>
								</div>
								<div class="form-group col-lg-2">
									<label><spring:message code="running.plunumber.label" /></label>
									<div class="col-lg-11" style="padding-left: 0px">
										<!-- <select class="form-control" id="runningPlu"></select> -->
										<input type="text"  onblur="criteria(this)" class="form-control" id="runningPlu">
										<span id="runningPluError"
											style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
									</div>
								</div>
							
							</div>
							<div class="row">
							
								<div class="form-group col-lg-2">
									
									<div class="col-lg-10" style="padding-left: 0px">
									<label><spring:message code="model.label" /></label>
										<input type="text"  onblur="criteria(this)" class="form-control allField" name="model"
											id="model" value="" required
											placeholder="<spring:message code="enter.model.label" />" />
										<span id="modelError"
											style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
									</div>
								</div>
								
								<div class="form-group col-lg-2">
									<label><spring:message code="open.rate.label" /></label>
									<div class="col-lg-10" style="padding-left: 0px">
										<input type="text"  onblur="criteria(this)" class="form-control allField"
											name="openRate" id="openRate" value=""
											placeholder="<spring:message code="enter.open.rate.label" />"
											oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');" />
										<span id="colorError"
											style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
									</div>
								</div>
								<div class="form-group col-lg-2">
									<label><spring:message code="last.cost.label" /></label>
									<div class="col-lg-10" style="padding-left: 0px">
										<input type="text"  onblur="criteria(this)" class="form-control allField"
											name="lastCost" id="lastCost" value=""
											placeholder="<spring:message code="enter.last.cost.label" />"
											oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');" />
										<span id="lastCostError"
											style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
									</div>
								</div>
								<div class="form-group col-lg-2">
									<label><spring:message code="average.cost.label" /></label>
									<div class="col-lg-9" style="padding-left: 0px">
										<input type="text"  onblur="criteria(this)" class="form-control allField"
											name="averageCost" id="averageCost" value="" required
											placeholder="<spring:message code="enter.average.cost.label" />"
											oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');" />
										<span id="averageCostError"
											style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
									</div>
								</div>
								<div class="form-group col-lg-2">
									<label><spring:message code="minimum.price.label" /></label>
									<div class="col-lg-9" style="padding-left: 0px">
										<input type="text"  onblur="criteria(this)" class="form-control allField"
											name="minPrice" id="minPrice" value="" required
											placeholder="<spring:message code="enter.minimum.price.label" />"
											oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');" />
										<span id="minPriceError"
											style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
									</div>
								</div>
								<div class="form-group col-lg-2">
									<label><spring:message code="color.label" /></label>
									<div class="col-lg-10" style="padding-left: 0px">
										<input type="text"  onblur="criteria(this)" class="form-control allField" name="color"
											id="color" value=""
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
										<select class="form-control" name="status" id="status">
											<option value="Active">Active</option>
											<option value="InActive">InActive</option>
											<option value="Discontinued">Discontinued</option>
										</select>
									</div>
								</div>
								
								<div class="form-group col-lg-2">
									<label><spring:message code="primaryDepartment.label" />
										<!-- <span style="color:red; font-size:2">*</span> --></label> <input
										type="text"  onblur="criteria(this)"
										class="form-control allField searchItems searchBar"
										id="primaryDepartment"
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
										type="text"  onblur="criteria(this)" 
										class="form-control allField searchItems searchBar"
										id="secondaryDepartment"
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
										type="text"  onblur="criteria(this)"
										class="form-control"
										id="section" value="${sku.section}"
										placeholder="<spring:message code="section.label" />" style="" />
										<!-- <div class="services">
										<div class="items">
											<ul class="matchedStringUl sectionMaster" style=""></ul>
										</div>
									</div> -->
								</div>
									<div class="form-group col-lg-2">
									<label><spring:message code="tax.exclusive.label" /></label>
									<div class="col-lg-10" style="padding-left: 0px">
										<select class="form-control" name="itemTaxExclusive" id="itemTaxExclusive">
											<option value="false"
												${sku.itemTaxExclusive == false ? 'selected' : ''}><spring:message
													code="no.label" /></option>
											<option value="true"
												${sku.itemTaxExclusive == true ? 'selected' : ''}><spring:message
													code="yes.label" /></option>
										</select>
									</div>
								</div>
								
								<div class="form-group col-lg-2"  style="">
                            
									<label><spring:message code="istaxon.discounted.price.label" />
										</label>
								<select class="form-control" name="istaxon" id="istaxon">
											<option value="true"><spring:message
													code="yes.label" /></option>
											<option value="false"><spring:message
													code="no.label" /></option>
										</select>
									
								</div> 
								
								
								
								
							</div>

							<div class="row">
							
							<div class="form-group col-lg-2">
									<label><spring:message code="hsnCode.label" /> <span
										style="color: red; font-size: 2">*</span></label>
										<input type="text"  onblur="criteria(this)" class="form-control allField" value="${sku.itemTaxExclusive}" name="hsnCode"
										id="hsnCode" value=""
										placeholder="<spring:message code="hsnCode.label" />" />
										<span id="hsnCodeError" style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
										
								</div>
								
									<div class="form-group col-lg-2">
									<label><spring:message code="trackingRequired.label" /></label>
									<div class="col-lg-10" style="padding-left: 0px">
										<select class="form-control" name="itemTrackRequired" id="itemTrackRequired">
											<option value="false"
												${sku.trackingRequired == false ? 'selected' : ''}><spring:message
													code="no.label" /></option>
											<option value="true"
												${sku.trackingRequired == true ? 'selected' : ''}><spring:message
													code="yes.label" /></option>
										</select>
									</div>
								</div>
								
								<div class="form-group col-lg-2">
									<label><spring:message code="alternate.sku.label" /></label> <input
										type="text" class="form-control allField" name="alternate_sku"
										id="alternate_sku" value="" onblur="criteria(this)"
										placeholder="<spring:message code="alternate.sku.description.label" />" />
								</div>

								<div class="form-group col-lg-2">
									<label><spring:message code="season.code.label" /></label> <input
										type="text" class="form-control allField" name="season_code"
										id="season_code" value="" onblur="criteria(this)"
										placeholder="<spring:message code="season.code.description.label" />" />
								</div>

								<div class="form-group col-lg-2">
									<label><spring:message code="alias.name.label" /></label> <input
										type="text" class="form-control allField" name="alias_name" onblur="criteria(this)"
										id="alias_name" value=""
										placeholder="<spring:message code="alias.name.description.label" />" />
								</div>

								<div class="form-group col-lg-2">
									<label><spring:message code="item.type.label" /></label> <input
										type="text" class="form-control allField" name="item_type" onblur="criteria(this)"
										id="item_type" value=""
										placeholder="<spring:message code="item.type.description.label" />" />
								</div>

								

							</div>
							
							
							<div class="row">
							
							<div class="form-group col-lg-2">
									<label><spring:message code="item.design.label" /></label> <input
										type="text" class="form-control allField" name="item_design" onblur="criteria(this)"
										id="item_design" value=""
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
									<input type="text" id="productHandingDetail"  onblur="criteria(this)" 
										name="productHanding" style="resize: none;"
										class="form-control allField"  value="${sku.product_handing}"
										placeholder="<spring:message code="enter.product.handing.label" />">
									
								</div> 
							
							
							<div class="form-group col-lg-2"  style="">
                            
									<label><spring:message code="productUsage.label" />
										</label>
									<input type="text" id="productUsageDetail"  onblur="criteria(this)"
										name="productUsageQuick" style="resize: none;"
										class="form-control allField"  value="${sku.product_handing}"
										placeholder="<spring:message code="enter.product.handing.label" />">
									
								</div> 
							<div class="form-group col-lg-2"  style="">
                            
									<label><spring:message code="productInTake.label" />
										</label>
									<input type="text" id="productIntakeDetail" style="resize: none;" onblur="criteria(this)"
										class="form-control allField"  value="${sku.product_consumption_interaction}"
										placeholder="<spring:message code="enterproductInTake.label" />">
									
								</div> 
							
							
							
							<div class="form-group col-lg-2"  style="">
                            
                            <div class="form-group col-lg-6"  style="padding-left: 0px;padding-right: 5px;">
									<label><spring:message code="uom1.label" />
										</label>
									<input type="text" id="uom1Detail"  onblur="criteria(this)"
										class="form-control allField"  value="${sku.product_handing}"
										placeholder="<spring:message code="enteruom1.label" />">
							</div>	
								<div class="form-group col-lg-6"  style="padding-right: 0px;padding-left: 0;">		
								<label><spring:message code="uom2.label" />
									</label>
									<input type="text" id="uom2Detail"  onblur="criteria(this)"
										class="form-control allField"  value="${sku.product_handing}"
										placeholder="<spring:message code="enteruom2.label" />">
								</div>	
							</div> 
								
								
								
						
							
							</div>
							


							<div class="row">
								<%-- <div class="form-group col-lg-3">
                                            <label><spring:message code="picture1.label" /></label>
                                            <input type="file" id="picture1" name="picture[]" multiple="multiple" onchange="loadImageFileAsURL('picture1',this);" />
                                            <input type="file" name="images[]" id="images" multiple  onchange="loadImageFileAsURL('','${attachments.elementId}',this)" >
                                         </div> --%>
                                
                                
               <!--Added By Manideep
                 Reason :To add the picture icon and their labels -->    
                 
                 <div class="form-group col-lg-2"  style="">
                 <div class="row"><div class="col-lg-12">
									<label>Cost Price Editable_GRN
										</label>
									<select class="form-control" name="costPriceEditable" id="costPriceEditable">
											<option value="false"><spring:message
													code="no.label" /></option>
											<option value="true"><spring:message
													code="yes.label" /></option>
										</select></div></div>
										<div class="row" style="padding-top:20px;">
										<div class="col-lg-12">
									<label>Stock Status</label>
										<select class="form-control allField req" style="width:80%" id="stockStatus">
									         <!-- <option value="true"  >Active</option>
		                                  	 <option value="false" >In-Active</option> -->
		                                  	 <option value="true" ${'true' == sku.stockStatus ? 'selected' : ''} >Active</option>
		                                  	 <option value="false" ${'false' == sku.stockStatus ? 'selected' : ''}>In-Active</option>
											
										</select> </div>
								</div> 
								</div>
								
								<div class="form-group col-lg-2"  >
                            
									<label><spring:message code="batch.required.label" />
										</label>
									<select class="form-control" name="batchrequired" id="batchrequired">
											<option value="false"><spring:message
													code="no.label" /></option>
											<option value="true"><spring:message
													code="yes.label" /></option>
										</select>
									
								</div> 
								
						<!-- 		added by: vasudev
								created on: 21-08-2019 -->
								<div class="form-group col-lg-2" style=""> 
								<label><spring:message code="SKU.description.label" /></label> 
 									<input type="file" class="btn bg-olive btn-inline" accept=".xml" title="To import, Choose the valid xml Sheet format" style="height: 30px;  width: 150px;     padding: 3px !important;" id="skuDescription" name="skuDescription" onchange="loadFileAsURL('skuDescription',this);" /> 
									<input type="hidden" id="skuDescription_refId" name="skuDescription" /> 
									<input type="hidden" id="skuDescription_name" />
									<span id="searchFilesError" style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span> 
								</div> 
								       
                                <div class="form-group col-lg-1" style="text-align: center;width: 12.3%;">
									<div class="icon-remove blue delete" id="pictureIcon_image">
										<label class="myFile" id="pictureIcon_label"> <img
											src="${pageContext.request.contextPath}/images/Add_image.png"
											alt="" style="width: 100px;margin-bottom: 5px;" /> <input type="file"
											id="pictureIcon" name="pictureIcon"
											onchange="loadImageFileAsURL('pictureIcon',this);" /> <input
											type="hidden" id="pictureIcon_refId" name="pictureIcon" /> <input
											type="hidden" id="pictureIcon_name" />
										</label>
									</div>
									<label><spring:message code="sku.picture.icon" /></label>
								</div>
								
								<div class="form-group col-lg-1" style="text-align: center;width: 12.3%;">
									<div class="icon-remove blue delete" id="picture1_image">
										<label class="myFile" id="picture1_label"> <img
											src="${pageContext.request.contextPath}/images/Add_image.png"
											alt="" style="width: 100px;margin-bottom: 5px;" /> <input type="file"
											id="picture1" name="picture1"
											onchange="loadImageFileAsURL('picture1',this);" /> <input
											type="hidden" id="picture1_refId" name="picture1"/> <input
											type="hidden" id="picture1_name" />
										</label>
									</div>
									<label><spring:message code="sku.picture1" /></label>
								</div>
								<div class="form-group col-lg-1" style="text-align: center;width: 12.3%;">
									<div class="icon-remove blue delete" id="picture2_image">
										<label class="myFile" id="picture2_label"> <img
											src="${pageContext.request.contextPath}/images/Add_image.png"
											alt="" style="width: 100px;margin-bottom: 5px;" /> <input type="file"
											id="picture2" name="picture2"
											onchange="loadImageFileAsURL('picture2',this);" /> <input
											type="hidden" id="picture2_refId" name="picture2" /> <input
											type="hidden" id="picture2_name" />
										</label>
									</div>
									<label><spring:message code="sku.picture2" /></label>
								</div>
								<div class="form-group col-lg-1" style="text-align: center;width: 12.3%;">
									<div class="icon-remove blue delete" id="picture3_image">
										<label class="myFile" id="picture3_label"> <img
											src="${pageContext.request.contextPath}/images/Add_image.png"
											alt="" style="width: 100px;margin-bottom: 5px;" /> <input type="file"
											id="picture3" name="picture3"
											onchange="loadImageFileAsURL('picture3',this);" /> <input
											type="hidden" id="picture3_refId" name="picture3" /> <input
											type="hidden" id="picture3_name" />
										</label>
									</div>
									<label><spring:message code="sku.picture3"/></label>
								</div>
								
								

								<div class="form-group col-lg-2">
									<div class="checkbox"
										style="padding-left: 20px; margin-top: 0px;">
										<input type="checkbox" id="nonTaxable"> Non Taxable
									</div>
									<div class="checkbox"
										style="padding-left: 20px; margin-top: 20px;">
										<input type="checkbox" id="discountable"> Discountable
									</div>
									<div class="checkbox"
										style="padding-left: 20px; margin-top: 20px;">
										<input type="checkbox" id="allowDecimals"> Allow
										Decimals
									</div>
								</div>
								
								
									<div class="form-group col-lg-2">
									<label><spring:message code="location.label" /> <span
										style="color: red; font-size: 2">*</span></label> <select
										class="form-control" onchange="addSelectedLocation();"
										id="location" multiple="multiple" style="height: 91px;">
										<c:forEach var="location" items="${workLocationsList}">
											<option value="${location}">${location}</option>
										</c:forEach>
									</select> <span id="locationError"
										style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
								</div>
								
													<div class="col-lg-2" style="padding-right: 10px;">
								
								
									<div class="row">
								
										<div class="form-group col-lg-12">
											<label><spring:message code="created.date.label" /></label>
											<div class="input-group">
												<div class="input-group-addon">
													<i class="fa fa-calendar"></i>
												</div>
												<input type="text"   id="createdDate" readonly="readonly"
													class="form-control dat"
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
													class="form-control dat"
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
											
												<input type="text" id="skuSubtheme"  placeholder="Sub Theme" class="form-control allField" ${sku.subTheme}/>
											
											<span id="skuSubthemeError"
												style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
										</div>
									</div>
								</div>
								
								
								
								</div>
								
			
							</div>
							
							<div class="row">
								<div class="form-group col-lg-6" style="padding:23px;margin-top:-26px">
								
							
									<label><spring:message code="product.precautions.label" />
										</label>
									<textarea rows="2" id="productPrecautions"   onblur="criteria(this)" 
										name="productPrecautions" style="resize: none;"
										class="form-control allField"
										placeholder="<spring:message code="enter.product.precautions.label" />">${sku.product_precautions}</textarea>
									<span id="productPrecautionsQuickError"
										style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
								</div>
								
						
								
								
								<div class="form-group col-lg-6" style="padding:23px;margin-top:-26px">
								
									<label><spring:message code="product.sideEffects.label" />
										</label>
									<textarea rows="2" id="productSideEffects"   onblur="criteria(this)" 
										name="productSideEffects" style="resize: none;"
										class="form-control allField"
										placeholder="<spring:message code="enter.product.sideEffects.label" />">${sku.product_precautions}</textarea>
									<span id="productSideEffectsError"
										style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
							
								</div>
								
								
								</div>
							
							
							
							
							
							<%-- <div class="row">
								<div class="form-group col-lg-12">
									<label><spring:message code="short.description.label" />
										<span style="color: red; font-size: 2">*</span></label>
									<textarea rows="2" id="shortDescription"
										name="shortDescription" style="resize: none;"
										class="form-control allField"
										placeholder="<spring:message code="enter.short.description.label" />"></textarea>
									<span id="shortDescriptionError"
										style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
								</div>
							</div> --%>
							<div class="row">
								<div class="form-group col-lg-12" style="padding:26px;margin-top:-60px">
									<label><spring:message code="warranty.details.label" /></label>
									<textarea rows="2" class="form-control allField"  onblur="criteria(this)" 
										name="warrantyDetails" style="resize: none;"
										id="warrantyDetails" required
										placeholder="<spring:message code="enter.warranty.details.label" />"></textarea>
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
							
							<div class="priceList"  style="padding-left:24px">
								<div class="row " style="padding-left:0px" >
								
								
								
									<div class="col-lg-2  form-group" style="width:12.2%; padding: 0px 0px 0px 15px;">
										<%-- <div class="col-lg-2" style="background: #eee;width:110%;white-space:nowrap; border-top: 2px solid #ccc; padding-left: 0px;  padding-right: 0px;border-bottom: 2px solid #ccc; ">
									<label  class="white-space:nowrap;" ><spring:message code="specific.location.label" />
											</label></div> --%>
										<!-- <div class="col-lg-12" style="border: 1px solid #CCC;"> -->
											<div class="col-lg-12" style="padding-left:0px">
										<div class="row" style="">
												
									<div class="col-lg-9" style="padding-top: 0px;    margin-left: -15px;;  padding-left: 0px;padding-bottom: 14px; padding-right: 0px;white-space:nowrap;">
										<input type="radio" style="visibility: hidden;"
												name="priceListType" value="all" checked="checked"><input
												type="radio" style="visibility: hidden;"
												name="priceListType"  value="specific" >
											<label>Location wise</label>
											&nbsp;&nbsp;&nbsp;<input type="checkbox" 
												 style="vertical-align: -3px;"
												id="specific" onchange="changePriceListType(this);">
											<br>
												</div>
												
												
										<div class="col-lg-12 " style=" padding-right: 0px;"> 
										 <select style="margin-top: -2px;"
												class="form-control" 
												id="selectedLocation" 
												onchange="getPriceListForSelectedLocation(this);"></select>
											<br></div>
										</div></div></div>
									
									
				
									<div class="form-group col-lg-2" style="width:12%; padding: 0px 0px 0px 25px;margin-left:13px">
									<div class="col-lg-2" style="background: #eee;;width:100%;white-space:nowrap; border-top: 2px solid #ccc; padding-left: 0px;  padding-right: 0px;border-bottom: 2px solid #ccc; ">
											<label  class="" ><spring:message code="product.range.label" />
											</label></div><br>
										<div class="col-lg-12" style="padding-left:0px;margin-top: 10px;">
										<div class="row" style="">
										
										<div class="col-lg-12" style="    padding-right: 0px;">
											<input type="text"  onblur="criteria(this)" class="form-control" value="" id = "productRangeDropDown" /></div>
										</div>
									</div>
									</div>
									
									
									
                                  
                              	<div class="form-group col-lg-2" style="width:12%; padding: 0px 0px 0px 25px">
									<div class="col-lg-2" style="background: #eee;;width:100%;white-space:nowrap; border-top: 2px solid #ccc; padding-left: 0px;  padding-right: 0px;border-bottom: 2px solid #ccc; ">
											<label><spring:message code="measure.range.label" />
											</label></div><br>
										<div class="col-lg-12" style="padding-left:0px;margin-top: 10px;">
										<div class="row" style="">
										
										<div class="col-lg-12" style="    padding-right: 0px;">
											 <input type="text" class="form-control" value=""
												id="measurementRangeDropDown" />
												</div> <%-- <img
												style="cursor: pointer; width: 28px;    padding-right: 0px;"
												onclick="appendMeasurementRange();"
												src="${pageContext.request.contextPath}/images/RedPlus.png">
											<br>
											<div class="col-lg-12" style="  padding-top:3px;  padding-right: 0px;"><select style="" class="form-control"
												id="measurementRangeDropDown"></select></div> --%> 
										</div>
									</div>
									</div>
											
								<div class="form-group col-lg-2" style="width:12%; padding: 0px 0px 0px 25px">
									<div class="col-lg-2" style="background: #eee;width:100%;white-space:nowrap; border-top: 2px solid #ccc; padding-left: 0px;  padding-right: 0px;border-bottom: 2px solid #ccc; ">
										<label  class="" ><spring:message code="utility.label" />
											</label></div><br>
										<div class="col-lg-12" style="padding-left:0px;margin-top: 10px;">
										<div class="row" style="">
										
										<div class="col-lg-12" style="    padding-right: 0px;">
											 <input type="text"  onblur="criteria(this)" class="form-control" value=""
												id="utilityRangeDropDown" />
												</div><%--  <img
												style="cursor: pointer; width: 28px;    padding-right: 0px;"
												onclick="appendUtility();"
												src="${pageContext.request.contextPath}/images/RedPlus.png">
											<br>
											<div class="col-lg-12" style="  padding-top:3px;  padding-right: 0px;"> <select style="" class="form-control"
												id="utilityRangeDropDown"></select></div>  --%>
										</div>
									</div>
									</div>
									
									
									
									
									<div class="col-lg-2" style="width:12%; padding: 0px 0px 0px 25px">
									<div class="col-lg-2" style="background: #eee;width:100%;white-space:nowrap; border-top: 2px solid #ccc; padding-left: 0px;  padding-right: 0px;border-bottom: 2px solid #ccc; ">
										<label  class="" ><spring:message code="colour.label" />
											</label></div><br>
										<div class="col-lg-12" style="padding-left:0px;margin-top: 10px;">
										<div class="row" style="">
										
										<div class="col-lg-12" style="    padding-right: 0px;">
											 <input type="text" class="form-control" value=""
												id="colourRangeDropDown" />
												</div> <%-- <img
												style="cursor: pointer; width: 28px;    padding-right: 0px;"
												onclick="appendColours();"
												src="${pageContext.request.contextPath}/images/RedPlus.png">
											<br>
											<div class="col-lg-12" style=" padding-top:3px; padding-right: 0px;"> <select style="" class="form-control"
												id="colourRangeDropDown"></select></div>  --%>
										</div>
									</div>
									</div>
									
									
									
												
								<div class="col-lg-2" style="width:12%; padding: 0px 0px 0px 25px">
									<div class="col-lg-2" style="background: #eee;width:100%;white-space:nowrap; border-top: 2px solid #ccc; padding-left: 0px;  padding-right: 0px;border-bottom: 2px solid #ccc; ">
										<label  class="" ><spring:message code="size.label" />
											</label></div><br>
										<div class="col-lg-12" style="padding-left:0px;margin-top: 10px;">
										<div class="row" style="">
										
										<div class="col-lg-12" style="    padding-right: 0px;">
											 <input type="text"  onblur="criteria(this)" class="form-control" value=""
												id="sizeRangeDropDown" />
												</div> <%-- <img
												style="cursor: pointer; width: 28px;    padding-right: 0px;"
												onclick="appendSize();"
												src="${pageContext.request.contextPath}/images/RedPlus.png">
											<br>
											<div class="col-lg-12" style="padding-right: 0px;padding-top:3px"> <select style="" class="form-control"
												id="sizeRangeDropDown"></select></div>  --%>
										</div>
									</div>
									</div>
									
									
									
									     
                             <div class="col-lg-2" style="width:12%; padding: 0px 0px 0px 25px">
                           
									<div class="col-lg-2" style="background: #eee;width:100%;white-space:nowrap; border-top: 2px solid #ccc; padding-left: 0px;  padding-right: 0px;border-bottom: 2px solid #ccc;">
										<label  class="" ><spring:message code="batch.label" />
											</label></div><br>
										<div class="col-lg-12" style="padding-left:0px;margin-top: 10px;">
										<div class="row" style="">
										
										<div class="col-lg-12" style="  padding-right: 0px;">
											 <input type="text" class="form-control" value=""
												id="batchRangeDropDown" />
												</div> <%-- <img
												style="cursor: pointer; width: 28px;    padding-right: 0px;"
												onclick="appendBatch();"
												src="${pageContext.request.contextPath}/images/RedPlus.png">
											<br>
											<div class="col-lg-12" style=" padding-top:3px; padding-right: 0px;"> <select style="" class="form-control"
												id="batchRangeDropDown"></select></div>  --%>
										</div>
					
									</div>
									</div>
											 <div class="col-lg-2" style="width:12.2%; padding: 0px 0px 0px 25px">
									<div class="col-lg-2" style="background: #eee;width:100%;white-space:nowrap; border-top: 2px solid #ccc; padding-left: 0px;  padding-right: 0px;border-bottom: 2px solid #ccc; ">
										<label  class="" ><spring:message code="style.range.label" />
											</label></div><br>
										<div class="col-lg-12" style="padding-left:0px;margin-top: 10px;">
										<div class="row" style="">
										
										<div class="col-lg-12" style="    padding-right: 0px;">
											 <input type="text"  onblur="criteria(this)" class="form-control" value=""
												id="styleRangeDropDown" />
												</div> <%-- <img
												style="cursor: pointer; width: 29px;    padding-right: 0px;"
												onclick="appendStyleRange();"
												src="${pageContext.request.contextPath}/images/RedPlus.png">
											<br>
											<div class="col-lg-12" style="padding-right: 0px;padding-top:3px"> <select style="" class="form-control"
												id="styleRangeDropDown">
												<c:forEach var="style"
													items="${sku.styleRangeList}">
													<option value="${style}">${style}</option>
												</c:forEach>
												</select></div>  --%>
										</div>
									</div>
									</div>
									</div>
								
							
								

								 <div class="row">
										<div class="col-lg-12" style="    margin-top: -21px;">
										<div class="col-lg-9" style=""></div>



										<div class="col-lg-2" 
											style="margin-right: 2%;margin-top: 0px;border: 1px solid #6d6161;padding-left: 2px;padding-right: 0px;border-radius: 1px;background: #eee;width: 10%; margin-left: 20px; ">
											
											<label style="margin-top:5px;font-size: small;"><spring:message code="startprice.label" /></label>
											<img
												style="float: right;cursor: pointer;margin-right: 0px;width: 30px;background:#ccc;padding: 2px;border-left: 1px solid gray;"
												onclick="appendPriceList();" alt=""
												src="${pageContext.request.contextPath}/images/addIcon.PNG">
										</div>

									<div class="col-lg-2"
										style="margin-top: 0px; border: 1px solid #6d6161; padding-left: 2px; padding-right: 0px; border-radius: 1px; background: #eee; width: 10%; margin-right: 0px;">
										<label style="margin-top: 5px; font-size: small;"><spring:message
												code="startprice.label" /></label> <img
											style="float: right; cursor: pointer; margin-right: 0px; width: 30px; background: #ccc; padding: 2px; border-left: 1px solid gray;"
											onclick="deletePriceList();" alt=""
											src="${pageContext.request.contextPath}/images/deleteIcon.png">
									</div>
									</div>
										</div> 
								<!-- <div class="row" style="margin-top: -22px;"> -->
								<div class="row" style="margin-top: 10px;">
							<div class="col-md-12 priceListForLocation"     style="padding: 0px">
								
								
								<div class="AllLocation priceListLocationDiv">
										<div class="pricelist" id="pricelistAllLocation1">
											<div class="col-md-10" style="padding: 0px">
												<div class="row-fluid-5">
													<div class="form-group col-lg-2 "
														style="padding-left: 0px;">
														<input type="hidden" id="productRangeAllLocation1">
														<input type="hidden" id="measurementRangeAllLocation1">
														<input type="hidden" id="utilityRangeAllLocation1">
														<input type="hidden" id="colourRangeAllLocation1">
														<input type="hidden" id="sizeRangeAllLocation1"> <input
															type="hidden" id="batchRangeAllLocation1"> <input
															type="hidden" id="styleRangeAllLocation1"> <label><spring:message
																code="cost.price.label" /> <span
															style="color: red; font-size: 2">*</span></label> <input
															type="text" class="form-control allField req pluCost"
															onkeydown="clearError(this);" onblur="calcMarkUp(this);"
															value="" id="pluCostPriceAllLocation1" style="width: 100%;"
															oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');"
															placeholder="<spring:message code="enter.cost.price.label" />" />
														<span id="pluCostPriceAllLocation1Error"
															style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
													</div>

													<div class="form-group col-lg-2 "
														style="margin-left: 14px;">
														<label><spring:message code="price.label" /> <span
															style="color: red; font-size: 2">*</span></label> <input
															type="text" onblur="criteria(this)"
															class="form-control allField req"
															onkeydown="clearError(this);" value=""
															id="pluPriceAllLocation1" style="width: 100%;"
															oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');"
															placeholder="<spring:message code="enter.price.label" />" />
														<span id="pluPriceAllLocation1Error"
															style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
													</div>
													<div class="form-group col-lg-2 " style="margin-left: 1px;">
														<label><spring:message code="sale.price.label" />
															<span style="color: red; font-size: 2">*</span></label> <input
															type="text" class="form-control allField req pluSale"
															onkeydown="clearError(this);"
															onblur="calcMarkUp(this);criteria(this)" value=""
															id="pluSalePriceAllLocation1"
															oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');"
															placeholder="<spring:message code="enter.sale.price.label" />"
															style="width: 100%" /> <span
															id="pluSalePriceAllLocation1Error"
															style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
													</div>

													<div class="form-group col-lg-2"
														style="white-space: nowrap; margin-left: 1px;">

														<label><spring:message code="ws.price.label" /> <span
															style="color: red; font-size: 2">*</span></label> <input
															type="text" onblur="criteria(this)"
															class="form-control allField req" value=""
															onkeydown="clearError(this);" id="pluWsPriceAllLocation1"
															oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');"
															placeholder="<spring:message code="enter.ws.price.label" />"
															style="width: 100%" /> <span
															id="pluWsPriceAllLocation1Error"
															style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
													</div>

													<%-- <div class="form-group col-lg-2" style="margin-left: 1px;">
														<label><spring:message code="ean.label" /></label> <input
															type="text"  onblur="criteria(this)" class="form-control allField"
															id="eanAllLocation1" value=""
															placeholder="<spring:message code="enter.ean.label" />" />
													</div>
													 --%>
													<input type="hidden" id="eanAllLocation1">
													<div class="form-group col-lg-2" style="padding-right: 0px">
													<label><spring:message
																code="sale.price.one.label" /> </label> <input type="text"
															id="salePriceOneAllLocation1"
															name="salePriceOne"
															style="resize: none; width: 100%"
															class="form-control allField"
															value="${plu.salePrice1}"
															placeholder="Enter Sale Price 1">
														<span id="businessCategoryQuickError"
															style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
													</div>





													<%-- <div class="form-group span2">
														<label><spring:message code="extra.price.label" /></label>
														<input type="text" class="form-control allField" value=""
															onkeydown="clearError(this);"
															id="pluExtraPriceAllLocation1"
															oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');"
															placeholder="<spring:message code="enter.extra.price.label" />" />
														<span id="pluExtraPriceAllLocation1Error"
															style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
													</div> --%>
												</div>

												<div class="row-fluid-5">
													<%-- <div class="form-group col-lg-2 " style="padding-left: 0px;">
														<label><spring:message code="color.label" /></label> <input
															type="text" class="form-control allField"
															onkeydown="clearError(this);" id="pluColorAllLocation1"
															placeholder="<spring:message code="enter.color.label" />" />
														<span id="pluColorAllLocation1Error"
															style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
													</div>
 --%>
													<div class="form-group col-lg-2" style="padding-left: 0px">
														<label><spring:message code="color.shade.label" /></label>
														<input type="text" onblur="criteria(this)"
															class="form-control allField"
															onkeydown="clearError(this);"
															id="pluColorShadeAllLocation1"
															placeholder="<spring:message code="enter.color.shade.label" />" />
														<span id="pluColorShadeAllLocation1Error"
															style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
													</div>
													<div class="form-group col-lg-2" style="margin-left: 14px;">
														<label><spring:message code="mbq.label" /></label> <input
															type="text" class="form-control allField"
															onkeydown="clearError(this); " onblur="criteria(this)"
															id="pluMbqAllLocation1"
															placeholder="<spring:message code="enter.mbq.label" />"
															style="width: 100%;" /> <span id="pluMbqAllLocation1Error"
															style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
													</div>

													<div class="form-group col-lg-2"
														style="white-space: nowrap; margin-left: 1px;">
														<label><spring:message
																code="quantity.in.hand.label" /> <span
															style="color: red; font-size: 2">*</span></label> <input
															type="text" class="form-control allField req"
															onblur="calculateStock();criteria(this)"
															onkeydown="clearError(this);" value=""
															id="pluQuantityAllLocation1"
															oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');"
															placeholder="<spring:message code="enter.quantity.in.hand.label" />"
															style="width: 100%;" /> <span
															id="pluQuantityAllLocation1Error"
															style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
													</div>
													<div class="form-group col-lg-2" style="margin-left: 1px;">
														<label><spring:message code="acp.label" /></label> <input
															type="text" class="form-control allField"
															onkeydown="clearError(this);" onblur="criteria(this)"
															id="pluAcpAllLocation1"
															placeholder="<spring:message code="enter.acp.label" />"
															style="width: 100%" /> <span id="pluAcpAllLocation1Error"
															style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
													</div>


													<div class="form-group col-lg-2 span2"
														style="padding-right: 0px;margin-left: 15px;">
														<%-- <label><spring:message
																code="businessSubcategory.label" /> </label> <input type="text"
															onblur="criteria(this)"
															id="businessSubcategoryDetailAllLocation1"
															name="productHanding" style="resize: none; width: 80%"
															id="businessSubcategoryQuick"
															class="form-control allField"
															value="${plu.businessSubCategory}"
															placeholder="<spring:message code="enter.businessSubcategory.label" />">
														<span id="productSideEffectsError"
															style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span> --%>
															<label><spring:message
																code="businessCategory.label" /> </label> <input type="text"
															id="businessCategoryDetailAllLocation1"
															name="productPrecautions"
															style="resize: none;width: 100%;"
															class="form-control allField"
															value="${plu.businessCategory}"
															placeholder="<spring:message code="enterbusinescategory.label" />">
														<span id="businessCategoryQuickError"
															style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>

													</div>
													<%-- <div class="form-group col-lg-2 " style="margin-left: 1px;padding-right:0px">
														<label><spring:message code="created.date.label" /></label>
														<div class="input-group">
															<div class="input-group-addon">
																<i class="fa fa-calendar"></i>
															</div>
															<input type="text"  onblur="criteria(this)" id="pluCreatedDateAllLocation1"
																readonly="readonly" class="form-control dat"
																data-inputmask="alias: dd/mm/yyyy" data-mask />
														</div>
														<span id="pluCreatedDateAllLocation1Error"
															style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
													</div> --%>

												</div>




												<div class="row-fluid-5">


													<div class="form-group col-lg-2 "
														style="margin-left: 1px; padding-left: 0px">
														<label><spring:message code="created.date.label" /></label>
														<div class="input-group">
															<div class="input-group-addon">
																<i class="fa fa-calendar"></i>
															</div>
															<input type="text" onblur="criteria(this)"
																id="pluCreatedDateAllLocation1" readonly="readonly"
																class="form-control dat" style="width: 85%"
																data-inputmask="alias: dd/mm/yyyy" data-mask />
														</div>
														<span id="pluCreatedDateAllLocation1Error"
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
																readonly="readonly"
																style="background-color: white; width: 80%"
																id="pluExpiryDateAllLocation1" size="20" type="text"
																onfocus="callCalender('pluExpiryDateAllLocation1')"
																onclick="callCalender('pluExpiryDateAllLocation1')"
																placeholder="DD/MM/YYYY" />
														</div>
														<span id="pluExpiryDateAllLocation1Error"
															style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
													</div>




													<div class="form-group col-lg-2" style="">
														<label><spring:message
																code="min.sales.quantity.label" /></label> <input type="text"
															onblur="criteria(this)" class="form-control allField"
															id="priceMinSaleQtyAllLocation1"
															value="${plu.min_sale_qty}"
															placeholder="<spring:message code="min.sales.quantity.label" />"
															style="width: 100%" />
													</div>

													<div class="form-group col-lg-2 "
														style="white-space: nowrap;">
														<label><spring:message
																code="newarrival.product.status" /> </label> <select
															class="form-control allField req" name="status"
															style="width: 100%" id="skuStatusAllLocation1">
															<option value="true"
																${'true' == plu.skuStatus ? 'selected' : ''}>Active</option>
															<option value="false"
																${'false' == plu.skuStatus ? 'selected' : ''}>In-Active</option>

														</select>
													</div>

													<div class="form-group col-lg-3" style="">
													<label><spring:message
																code="businessSubcategory.label" /> </label> <input type="text"
															onblur="criteria(this)"
															id="businessSubcategoryDetailAllLocation1"
															name="productHanding" style="resize: none;width: 72%;"
															id="businessSubcategoryQuick"
															class="form-control allField"
															value="${plu.businessSubCategory}"
															placeholder="<spring:message code="enter.businessSubcategory.label" />">
														<span id="productSideEffectsError"
															style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
														<%-- <label>Material Type</label> <input type="text"
															class="form-control allField"
															id="materailTypeAllLocation1" value="${plu.materialType}"
															placeholder="Material Type" style="width: 70%" /> --%>
													</div>


										




												</div>


												<div class="row">

													<div class="form-group col-lg-2 "
														style="padding-right: 0px">
														<label><spring:message code="updated.date.label" /></label>
														<div class="input-group">
															<div class="input-group-addon">
																<i class="fa fa-calendar"></i>
															</div>
															<input type="text" onblur="criteria(this)"
																id="pluUpdatedDateAllLocation1" readonly="readonly"
																class="form-control dat" style="width: 80%"
																data-inputmask="alias: dd/mm/yyyy" data-mask />
														</div>
														<span id="pluUpdatedDateAllLocation1Error"
															style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
													</div>

													<div class="form-group col-lg-2 span2"
														style="margin-left: 20px; padding-right: 0px">
														<label><spring:message code="packaged.date.label" /></label>
														<div class="input-group">
															<div class="input-group-addon">
																<i class="fa fa-calendar"></i>
															</div>
															<input class="form-control allField req dat"
																readonly="readonly"
																style="background-color: white; width: 80%"
																id="pluPackagedDateAllLocation1" size="20" type="text"
																onfocus="callCalender('pluPackagedDateAllLocation1')"
																onclick="callCalender('pluPackagedDateAllLocation1')"
																placeholder="DD/MM/YYYY" />
														</div>
														<span id="pluPackagedDateAllLocation1Error"
															style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
													</div>





													<div class="form-group col-lg-2">
														<label><spring:message code="pack.size.label" /></label>
														<input type="text" onblur="criteria(this)"
															class="form-control allField"
															id="pricePackSizeAllLocation1" value="01"
															style="width: 60%"
															placeholder="<spring:message code="enter.pack.size.label" />" />
													</div>

													<div class="form-group col-lg-2 "
														style="padding-left: 14px">
														<label><spring:message code="stock.factory.label" />
														</label> <input type="text" onblur="criteria(this)"
															id="stockfactorAllLocation1" name="stockfactor"
															style="resize: none;width: 95%;"
															class="form-control allField" value="" placeholder="">
														<span id="productSideEffectsError"
															style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>

													</div>


													<div class="form-group col-lg-2" style=" padding-left: 1%;margin-left: 0px;">
													<label>Material Type</label> <input type="text"
															class="form-control allField"
															id="materailTypeAllLocation1" value="${plu.materialType}"
															placeholder="Material Type" style="width: 105%;" />
														<%-- <label>Zero Stock Billing</label>
														<div class="col-lg-10" style="padding-left: 0px">
															<select class="form-control"
																name="zeroStockbillingAllLocation1"
																id="zeroStockbillingAllLocation1">
																<option value="true"><spring:message
																		code="yes.label" /></option>
																<option value="false"><spring:message
																		code="no.label" /></option>
															</select>
														</div> --%>
													</div>

												</div>

												<div class="row">
                                                 <div class="form-group col-lg-2 " style="">
													<label>Zero Stock Billing</label>
														<div class="col-lg-10" style="padding-left: 0px">
															<select class="form-control"
																name="zeroStockbillingAllLocation1" style=" width: 136%;;"
																id="zeroStockbillingAllLocation1">
																<option value="true"><spring:message
																		code="yes.label" /></option>
																<option value="false"><spring:message
																		code="no.label" /></option>
															</select>
														</div>
                                                   </div>
													<div class="form-group col-lg-2 " style="margin-left: 20px; padding-right: 0px">
														<label>EAN</label>
														<div class="col-lg-12" style="padding: 0px;">
															<input type="text" onblur="criteria(this)" style=" width: 86%;"
																id="eanAllLocation1" style="" class="form-control"
																placeholder="Enter EAN number">
															<!-- <span id="eanError" style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span> -->
															<input type="hidden" id="eanduplicateAllLocation1">
														</div>
													</div>

													<div class="form-group col-lg-2 "
														style="margin-left: 0px;padding-right: 0px">
														<label>Stock Status</label> <select
															class="form-control allField req" style="width: 84%;"
															id="skuStockStatus">
															<option value="true"
																${'true' == plu.stockStatus ? 'selected' : ''}>Active</option>
															<option value="false"
																${'false' == plu.stockStatus ? 'selected' : ''}>In-Active</option>

														</select>
													</div>

													
												</div>





												<div class="row">



													<div class="form-group col-lg-4" style="padding-right: 0px">

														<label><spring:message
																code="technicalSpecification.label" /> </label>
														<textarea rows="2" onblur="criteria(this)"
															id="technicalSpecDetailAllLocation1" style="height: 75px;resize: none"
															class="form-control allField"
															placeholder="<spring:message code="entertechnicalSpecification.label" />">${plu.technical_specification}</textarea>
														<span id="productSideEffectsError"
															style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>

													</div>


													<div class="form-group col-lg-4" style=" margin-left: 2%;">
														<label><spring:message code="description.label" />
															<span style="color: red; font-size: 2">*</span></label>
														<textarea rows="2" onblur="criteria(this)"
															class="form-control allField"
															onkeydown="clearError(this);" id="pluDescAllLocation1"
															style="height: 75px;resize: none;" required
															placeholder="<spring:message code="enter.description.label" />"></textarea>
														<span id="pluDescAllLocation1Error"
															style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
													</div>
												</div>
											</div>




											<div class="col-md-2 table-responsive"
												style="border: 1px solid #ccc; padding: 0px; margin-left: -6.5%; width: 21%;">
												<table id="SKUMasterEANAllLocation1"
													class="table table-bordered table-hover"
													style="margin-bottom: 0px">
													<thead
														style="background-color: #ccc !important; color: #ffff">
														<tr>
															<th>EAN</th>
															<th>Actiion</th>
														</tr>
													</thead>
													<tbody>
														<tr id="dynamicdiv1">
															<td id="tableeanAllLocation1" style="width: 57%"><input
																type="number" required="required"
																id="eantableAllLocation1" style="width: 100%"></td>
															<td style="width: 35%;" id="actionAllLocation1">
																<!-- appendSKUEAN(); --> <a onclick=""
																style="border-bottom: 1px solid blue; color: blue; cursor: pointer;"><font
																	size="2px">add</font></a>&nbsp&nbsp <!--  deleteSKUEAN('1')  -->
																<a onclick=""
																style="border-bottom: 1px solid blue; color: blue; cursor: pointer;"
																id="deleteAllLocation1"><font size="2px">delete</font></a>

															</td>
														</tr>
													</tbody>
												</table>

											</div>
										</div>
									</div>
								
								
								
							<%-- 			<div class="AllLocation priceListLocationDiv">
											<div class="pricelist" id="pricelistAllLocation1">
									<div class="col-md-10"  style="padding: 0px">
												<div class="row-fluid-5">
													<div class="form-group col-lg-2 " style="padding-left: 0px;">
														<input type="hidden" id="productRangeAllLocation1">
														<input type="hidden" id="measurementRangeAllLocation1">
														<input type="hidden" id="utilityRangeAllLocation1">
												        <input type="hidden" id="colourRangeAllLocation1">
												       <input type="hidden" id="sizeRangeAllLocation1">
												       <input type="hidden" id="batchRangeAllLocation1">
												       <input type="hidden" id="styleRangeAllLocation1">
														<label><spring:message code="cost.price.label" />
															<span style="color: red; font-size: 2">*</span></label> <input
															type="text" class="form-control allField req pluCost"
															onkeydown="clearError(this);" onblur="calcMarkUp(this);"
															value="" id="pluCostPriceAllLocation1" style="width:60%"
															oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');"
															placeholder="<spring:message code="enter.cost.price.label" />" />
														<span id="pluCostPriceAllLocation1Error"
															style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
													</div>
													
													<div class="form-group col-lg-2 " style="margin-left: 14px;">
														<label><spring:message code="price.label" /> <span
															style="color: red; font-size: 2">*</span></label> <input
															type="text"  onblur="criteria(this)" class="form-control allField req"
															onkeydown="clearError(this);" value=""
															id="pluPriceAllLocation1" style="width:60%"
															oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');"
															placeholder="<spring:message code="enter.price.label" />" />
														<span id="pluPriceAllLocation1Error"
															style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
													</div>
													<div class="form-group col-lg-2 " style="margin-left: 1px;">
														<label><spring:message code="sale.price.label" />
															<span style="color: red; font-size: 2">*</span></label> <input
															type="text" class="form-control allField req pluSale"
															onkeydown="clearError(this);" onblur="calcMarkUp(this);criteria(this)"
															value="" id="pluSalePriceAllLocation1"
															oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');"
															placeholder="<spring:message code="enter.sale.price.label" />" style="width:60%"/>
														<span id="pluSalePriceAllLocation1Error"
															style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
													</div>

													<div class="form-group col-lg-2" style="white-space:nowrap;margin-left: 1px;">
													
														<label><spring:message code="ws.price.label" /> <span
															style="color: red; font-size: 2">*</span></label> <input
															type="text"  onblur="criteria(this)" class="form-control allField req" value=""
															onkeydown="clearError(this);" id="pluWsPriceAllLocation1"
															oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');"
															placeholder="<spring:message code="enter.ws.price.label" />" style="width:60%"/>
														<span id="pluWsPriceAllLocation1Error"
															style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
													</div>
													
													<div class="form-group col-lg-2" style="margin-left: 1px;">
														<label><spring:message code="ean.label" /></label> <input
															type="text"  onblur="criteria(this)" class="form-control allField"
															id="eanAllLocation1" value=""
															placeholder="<spring:message code="enter.ean.label" />" />
													</div>
													
													 <input type="hidden" id="eanAllLocation1">
													 	<div class="form-group col-lg-2" style="padding-right:0px">
									<label><spring:message code="businessCategory.label" />
										</label>
									<input type="text" id="businessCategoryDetailAllLocation1" 
										name="productPrecautions" style="resize: none;width:80%"
										class="form-control allField" value="${plu.businessCategory}"
										placeholder="<spring:message code="enterbusinescategory.label" />">
									<span id="businessCategoryQuickError"
										style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
								</div>
													
													
								
                
													
													<div class="form-group span2">
														<label><spring:message code="extra.price.label" /></label>
														<input type="text" class="form-control allField" value=""
															onkeydown="clearError(this);"
															id="pluExtraPriceAllLocation1"
															oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');"
															placeholder="<spring:message code="enter.extra.price.label" />" />
														<span id="pluExtraPriceAllLocation1Error"
															style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
													</div>
												</div>
												
												<div class="row-fluid-5">
													<div class="form-group col-lg-2 " style="padding-left: 0px;">
														<label><spring:message code="color.label" /></label> <input
															type="text" class="form-control allField"
															onkeydown="clearError(this);" id="pluColorAllLocation1"
															placeholder="<spring:message code="enter.color.label" />" />
														<span id="pluColorAllLocation1Error"
															style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
													</div>
													<div class="form-group col-lg-2" style="padding-left:0px">
														<label><spring:message code="color.shade.label" /></label>
														<input type="text"  onblur="criteria(this)" class="form-control allField"
															onkeydown="clearError(this);"
															id="pluColorShadeAllLocation1"
															placeholder="<spring:message code="enter.color.shade.label" />" />
														<span id="pluColorShadeAllLocation1Error"
															style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
													</div>
													<div class="form-group col-lg-2" style="margin-left: 14px;">
														<label><spring:message code="mbq.label" /></label> <input
															type="text" class="form-control allField"
															onkeydown="clearError(this); " onblur="criteria(this)" id="pluMbqAllLocation1"
															placeholder="<spring:message code="enter.mbq.label" />" style="width:60%"/>
														<span id="pluMbqAllLocation1Error"
															style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
													</div>

													<div class="form-group col-lg-2" style="white-space:nowrap;margin-left: 1px;">
														<label><spring:message
																code="quantity.in.hand.label" /> <span
															style="color: red; font-size: 2">*</span></label> <input
															type="text" class="form-control allField req"
															onblur="calculateStock();criteria(this)" onkeydown="clearError(this);"
															value="" id="pluQuantityAllLocation1"
															oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');"
															placeholder="<spring:message code="enter.quantity.in.hand.label" />"  style="width:70%"/>
														<span id="pluQuantityAllLocation1Error"
															style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
													</div>
													<div class="form-group col-lg-2" style="margin-left: 1px;">
														<label><spring:message code="acp.label" /></label> <input
															type="text" class="form-control allField"
															onkeydown="clearError(this);" onblur="criteria(this)" id="pluAcpAllLocation1"
															placeholder="<spring:message code="enter.acp.label" />"  style="width:80%"/>
														<span id="pluAcpAllLocation1Error"
															style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
													</div>
													
													
													<div class="form-group col-lg-2 span2" style="padding-right: 0px;margin-left:17px"> 
									<label><spring:message code="businessSubcategory.label" />
										</label>
									<input type="text"  onblur="criteria(this)" id="businessSubcategoryDetailAllLocation1" 
										name="productHanding" style="resize: none;width:80%" id="businessSubcategoryQuick"
										class="form-control allField"  value="${plu.businessSubCategory}"
										placeholder="<spring:message code="enter.businessSubcategory.label" />">
									<span id="productSideEffectsError"
										style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>

								</div>	
													<div class="form-group col-lg-2 " style="margin-left: 1px;padding-right:0px">
														<label><spring:message code="created.date.label" /></label>
														<div class="input-group">
															<div class="input-group-addon">
																<i class="fa fa-calendar"></i>
															</div>
															<input type="text"  onblur="criteria(this)" id="pluCreatedDateAllLocation1"
																readonly="readonly" class="form-control dat"
																data-inputmask="alias: dd/mm/yyyy" data-mask />
														</div>
														<span id="pluCreatedDateAllLocation1Error"
															style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
													</div>
													
												</div>
												
												
												
												
												<div class="row-fluid-5">
													
													
													<div class="form-group col-lg-2 " style="margin-left: 1px;padding-left:0px">
														<label><spring:message code="created.date.label" /></label>
														<div class="input-group">
															<div class="input-group-addon">
																<i class="fa fa-calendar"></i>
															</div>
															<input type="text"  onblur="criteria(this)" id="pluCreatedDateAllLocation1"
																readonly="readonly" class="form-control dat" style="width:85%"
																data-inputmask="alias: dd/mm/yyyy" data-mask />
														</div>
														<span id="pluCreatedDateAllLocation1Error"
															style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
													</div>
													
													
													<div class="form-group col-lg-2 span2" style="margin-left:26px;padding-right:0px">
														<label><spring:message code="expiry.date.label" /></label>
														<div class="input-group">
															<div class="input-group-addon">
																<i class="fa fa-calendar"></i>
															</div>
															<input class="form-control allField req dat"
																readonly="readonly" style="background-color: white;width:80%"
																id="pluExpiryDateAllLocation1" size="20" type="text"
																onfocus="callCalender('pluExpiryDateAllLocation1')"
																onclick="callCalender('pluExpiryDateAllLocation1')"
																placeholder="DD/MM/YYYY" />
														</div>
														<span id="pluExpiryDateAllLocation1Error"
															style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
													</div>
													
													
													
													
													 <div class="form-group col-lg-2" style="">
                                           	<label><spring:message code="min.sales.quantity.label" /></label> <input
													type="text"  onblur="criteria(this)" class="form-control allField"
													id="priceMinSaleQtyAllLocation1" value="${plu.min_sale_qty}"
													placeholder="<spring:message code="min.sales.quantity.label" />" style="width:70%" />
                                         </div>
													
													<div class="form-group col-lg-2 " style="white-space:nowrap;">
																	<label><spring:message
																			code="newarrival.product.status" /> </label>
																			<select class="form-control allField req" name="status" style="width:80%" id="skuStatusAllLocation1">
										                                      	<option value="true" ${'true' == plu.skuStatus ? 'selected' : ''} >Active</option>
		                                  		                                <option value="false" ${'false' == plu.skuStatus ? 'selected' : ''} >In-Active</option>
											
										                                    </select> 
																</div>
																
																 <div class="form-group col-lg-2" style="">
                                           	<label>Material Type</label> <input
													type="text"   class="form-control allField"
													id="materailTypeAllLocation1" value="${plu.materialType}"
													placeholder="Material Type" style="width:70%" />
                                         </div>
													
													
							<div class="form-group col-lg-2" style="padding-right:0px">
									<label><spring:message code="businessCategory.label" />
										</label>
									<input type="text" id="businessCategoryDetailAllLocation1" 
										name="productPrecautions" style="resize: none;"
										class="form-control allField" value="${plu.businessCategory}"
										placeholder="<spring:message code="enterbusinescategory.label" />">
									<span id="businessCategoryQuickError"
										style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
								</div>
								
								
									
	
												</div>
												
												
												<div class="row">
												
												<div class="form-group col-lg-2 " style="padding-right:0px">
														<label><spring:message code="updated.date.label" /></label>
														<div class="input-group">
															<div class="input-group-addon">
																<i class="fa fa-calendar"></i>
															</div>
															<input type="text" onblur="criteria(this)" id="pluUpdatedDateAllLocation1"
																readonly="readonly" class="form-control dat" style="width:80%"
																data-inputmask="alias: dd/mm/yyyy" data-mask />
														</div>
														<span id="pluUpdatedDateAllLocation1Error"
															style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
													</div>				
									
													<div class="form-group col-lg-2 span2" style="margin-left:20px;padding-right:0px">
														<label><spring:message code="packaged.date.label" /></label>
														<div class="input-group">
															<div class="input-group-addon">
																<i class="fa fa-calendar"></i>
															</div>
															<input class="form-control allField req dat"
																readonly="readonly" style="background-color: white;width:80%"
																id="pluPackagedDateAllLocation1" size="20" type="text"
																onfocus="callCalender('pluPackagedDateAllLocation1')"
																onclick="callCalender('pluPackagedDateAllLocation1')"
																placeholder="DD/MM/YYYY" />
														</div>
														<span id="pluPackagedDateAllLocation1Error"
															style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
													</div>													
					
					
					
					
					
					<div class="form-group col-lg-2"  >
                                           	<label><spring:message code="pack.size.label" /></label> <input
													type="text"  onblur="criteria(this)" class="form-control allField"
													id="pricePackSizeAllLocation1" value="01" style="width:60%"
													placeholder="<spring:message code="enter.pack.size.label" />" />
                                        </div>
                                        
                                <div class="form-group col-lg-2 " style="padding-left:14px"> 
									<label><spring:message code="stock.factory.label" />
										</label>
									<input type="text"  onblur="criteria(this)" id="stockfactorAllLocation1" 
										name="stockfactor" style="resize: none;width:60%" 
										class="form-control allField"  value=""
										placeholder="">
									<span id="productSideEffectsError"
										style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>

								</div>
                                        
                                        
                                        <div class="form-group col-lg-2">
									<label>Zero Stock Billing</label>
									<div class="col-lg-10" style="padding-left: 0px">
										<select class="form-control" name="zeroStockbillingAllLocation1" id="zeroStockbillingAllLocation1">
											<option value="true"><spring:message
													code="yes.label" /></option>
											<option value="false"><spring:message
													code="no.label" /></option>
										</select>
									</div>
								</div>
                                        
                                             <div class="form-group col-lg-2" style="">
                                           	<label><spring:message code="min.sales.quantity.label" /></label> <input
													type="text"  onblur="criteria(this)" class="form-control allField"
													id="priceMinSaleQtyAllLocation1" value="${plu.min_sale_qty}"
													placeholder="<spring:message code="min.sales.quantity.label" />" />
                                         </div>
                                         
                                         
                                         
                                         <div class="form-group col-lg-2 " > 
									<label><spring:message code="stock.factory.label" />
										</label>
									<input type="text"  onblur="criteria(this)" id="stockfactor" 
										name="stockfactor" style="resize: none;" 
										class="form-control allField"  value=""
										placeholder="">
									<span id="productSideEffectsError"
										style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>

								</div>
                                         
									
								
								
								
									<div class="form-group col-lg-8" style="padding-right:0px">
								
									<label><spring:message code="technicalSpecification.label" />
										</label>
									<textarea rows="2" id="technicalSpecDetailAllLocation1"  style="resize:none"
										class="form-control allField"
										placeholder="<spring:message code="entertechnicalSpecification.label" />">${plu.technical_specification}</textarea>
									<span id="productSideEffectsError"
										style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
							
								</div>
								
								 
								
									<div class="form-group col-lg-2 span2" style="padding-right: 0px;margin-left:17px"> 
									<label><spring:message code="businessSubcategory.label" />
										</label>
									<input type="text"  onblur="criteria(this)" id="businessSubcategoryDetailAllLocation1" 
										name="productHanding" style="resize: none;" id="businessSubcategoryQuick"
										class="form-control allField"  value="${plu.businessSubCategory}"
										placeholder="<spring:message code="enter.businessSubcategory.label" />">
									<span id="productSideEffectsError"
										style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>

								</div>	
								
									
								<div class="form-group col-lg-2 span2" style="padding-right: 0px;margin-left:17px"> 
									<label><spring:message code="businessSubcategory.label" />
										</label>
									<input type="text"  onblur="criteria(this)" id="businessSubcategoryDetailAllLocation1" 
										name="productHanding" style="resize: none;" id="businessSubcategoryQuick"
										class="form-control allField"  value="${plu.businessSubCategory}"
										placeholder="<spring:message code="enter.businessSubcategory.label" />">
									<span id="productSideEffectsError"
										style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>

								</div>	
								
												
												</div>
												
												
												<div class="row-fluid-5">
													<div class="form-group span2">
														<label><spring:message code="discounttype.label" /></label> 
														<select class="form-control" id="pludiscounttypeAllLocation1">
														<option value="flat_rate">Cash Flat</option>
                                            			<option value="percentage">Cash Discount</option>
														</select>
													</div>
													<div class="form-group span2">
														<label><spring:message
																code="discount.label" /> </label> <input
															type="text" class="form-control allField req"
															onkeydown="clearError(this);"
															value="" id="pludiscountAllLocation1"
															oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');"
															placeholder="<spring:message code="discount.label" />" />
														
													</div>
												
												
												
												<div class="form-group span2">
														<label><spring:message
																code="cash.discpunt.label" /> </label> <input
															type="text" class="form-control allField req"
															onkeydown="clearError(this);"
															 id="pluCashdiscountAllLocation1"
															oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');"
															placeholder="<spring:message code="discount.label" />" />
														
													</div>
												
												
												<div class="form-group span2">
														<label><spring:message
																code="productBatchno.label" /> </label> <input
															type="text" class="form-control allField req"  
															onkeydown="clearError(this);"
															 id="pluProductBatchAllLocation1"
															oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');"
															placeholder="<spring:message code="productBatchno.label" />" />
														
													</div>
												
												
													<div class="form-group span2">
														<label><spring:message
																code="productserialno.label" /> </label> <input
															type="text" class="form-control allField req" 
															onkeydown="clearError(this);"
															value="" id="pludProductSerialNoAllLocation1"
															oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');"
															placeholder="<spring:message code="productserialno.label" />" />
														
													</div>
												
												</div>
												
												
												
												<div class="row-fluid-5">
												
												
												<div class="form-group span2">
																	<label><spring:message code="bestBeforeDate.label" /></label>
																	<div class="input-group">
																		<div class="input-group-addon">
															
															         	<i class="fa fa-calendar"></i>
															            </div>
																		<input class="form-control allField req dat"
																			readonly="readonly" style="background-color: white;"
																			id="pluBestBeforeDateAllLocation1"
																			 size="20" type="text"
																			onfocus="callCalender('pluBestBeforeDateAllLocation1')"
																			onclick="callCalender('pluBestBeforeDateAllLocation1')"
																			placeholder="DD/MM/YYYY" />
																	</div>
																	<span
																		id="pluBestBeforeDateAllLocation1Error"
																		style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
																</div>
																<div class="form-group span2">
																	<label><spring:message
																			code="effectivefromDate.label" /></label>
																	<div class="input-group">
																		<div class="input-group-addon">
																			<i class="fa fa-calendar"></i>
																		</div>
																		<input class="form-control allField req dat"
																		readonly="readonly" style="background-color: white;"
																			id="pluEffectivedDateAllLocation1"
																			onfocus="callCalender('pluEffectivedDateAllLocation1')"
																			onclick="callCalender('pluEffectivedDateAllLocation1')"
																			placeholder="DD/MM/YYYY" />
																	</div>
																	<span
																		id="pluEffectivedDateAllLocation1Error"
																		style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
																</div>
												
												
												
												<div class="form-group span2">
																	<label><spring:message code="manufacturedDate.label" /></label>
																	<div class="input-group">
																		<div class="input-group-addon">
																			<i class="fa fa-calendar"></i>
																		</div>
																		<input class="form-control allField req dat"
																			readonly="readonly" style="background-color: white;"
																			id="plumanufacturedDateAllLocation1"
																			 size="20" type="text"
																			onfocus="callCalender('plumanufacturedDateAllLocation1')"
																			onclick="callCalender('plumanufacturedDateAllLocation1')"
																			placeholder="DD/MM/YYYY" />
																	</div>
																	<span
																		id="plumanufacturedDateAllLocation1Error"
																		style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
																</div>
												
												
												<div class="form-group span2">
																	<label><spring:message code="warrantyperiad.label" /></label>
																	<input type="text" class="form-control allField"
																		onkeydown="clearError(this);" 
																		id="pluWarrantyPeriodAllLocation1"
																		placeholder="<spring:message code="enterwarrantyperiad.label" />" />
																	
																	<div class="input-group">
																		<div class="input-group-addon">
																			<i class="fa fa-calendar"></i>
																		</div>
																		<input class="form-control allField req dat"
																			readonly="readonly" style="background-color: white;"
																			id="pluwarrantyDateAllLocation1"
																			 size="20" type="text"
																			onfocus="callCalender('pluwarrantyDateAllLocation1')"
																			onclick="callCalender('pluwarrantyDateAllLocation1')"
																			placeholder="DD/MM/YYYY" />
																	</div>
																	
																	<span
																		id="pluWarrantyPeriod${selectedLocationId}${priceListCount}Error"
																		style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
																</div>
												
												
												
												
												<div class="form-group span2">
									<label><spring:message code="reorder.point.label" /></label>
									
										<input type="text" class="form-control allField"
											 name="reorderPoint" id="plureorderPointAllLocation1"
											 value="" required
											oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');"
											placeholder="<spring:message code="enter.reorder.point.label" />" />
										<span id="plureorderPointAllLocation1Error"
					style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
									
								</div>
										</div>
												
												
												
												
																
											<div class="row-fluid-5">
												<div class="form-group span2" style="padding-left:0px">
																	<label><spring:message code="blockdeQty.label" />
																		</label> <input
																		type="text" class="form-control allField req "
																		onkeydown="clearError(this);"
																		id="pluBlockedQtyAllLocation1"
																		oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');"
																		placeholder="<spring:message code="enterblockdeQty.label" />" />
																	<span
																		id="pluBlockedQty${selectedLocationId}${priceListCount}Error"
																		style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
																</div>
																
																
													<div class="form-group  span2" style="padding-left:0px">
																	<label><spring:message code="scrapedQty.label" />
																		</label> <input
																		type="text" class="form-control allField req "
																		 onkeydown="clearError(this);"
																		id="pluScrapedQtyAllLocation1"
																		oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');"
																		placeholder="<spring:message code="enterscrapedQty.label" />" />
																	<span
																		id="pluScrapedQtyError"
																		style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
																</div>			
															
															
													<div class="form-group span2">
																	<label><spring:message code="styleRange.label" /></label>
																	<input type="text" class="form-control allField"
																		onkeydown="clearError(this);" 
																		id="pluStyleRangeAllLocation1"
																		placeholder="<spring:message code="enterstyleRange.label" />" />
																	<span
																		id="pluStyleRangeAllLocation1Error"
																		style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
																</div>				
															
															
															
														<div class="form-group span2">
																	<label><spring:message code="packageId.label" /></label>
																	<input type="text" class="form-control allField"
																		onkeydown="clearError(this);"
																		id="pluPackageIdAllLocation1" name="pluPackageId"
																		value=""
																		placeholder="<spring:message code="enter.packageId.label" />" />
																	<span
																		id="pluPackageIdAllLocation1Error"
																		style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
																</div>	
																
																<div class="form-group span2">
																	<label><spring:message code="utility.label" /></label>
																	<input type="text" class="form-control allField"
																		onkeydown="clearError(this);"
																		id="pluUtilityAllLocation1"
																		value=""
																		placeholder="<spring:message code="enter.utility.label" />" />
																	<span
																		id="pluPackageIdAllLocation0Error"
																		style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
																</div>
																
																
																
																
												
											</div>
												
												
												<div class="row">
										
							<div class="form-group col-lg-2 " style="">
										<label>EAN</label>
									<div class="col-lg-12" style="padding: 0px;">
									<input type="text" onblur="criteria(this)" id="eanAllLocation1"  style="" class="form-control"   placeholder="Enter EAN number">
									<!-- <span id="eanError" style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span> -->
									<input type="hidden" id="eanduplicateAllLocation1">
									</div>
							</div>				
									
								<div class="form-group col-lg-2 " style="margin-left:20px;padding-right:0px">
										<label>Stock Status</label>
										<select class="form-control allField req" style="width:80%" id="skuStockStatus">
									         <option value="true" ${'true' == plu.stockStatus ? 'selected' : ''} >Active</option>
		                                  	 <option value="false" ${'false' == plu.stockStatus ? 'selected' : ''}>In-Active</option>
											
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
												
												
												
												<div class="form-group col-lg-5" style="padding-right:0px">
								
									<label><spring:message code="technicalSpecification.label" />
										</label>
									<textarea rows="2"  onblur="criteria(this)" id="technicalSpecDetailAllLocation1"  style="resize:none"
										class="form-control allField"
										placeholder="<spring:message code="entertechnicalSpecification.label" />">${plu.technical_specification}</textarea>
									<span id="productSideEffectsError"
										style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
							
								</div>
												
												
													<div class="form-group col-lg-5" style="padding-right:0px">
														<label><spring:message code="description.label" />
															<span style="color: red; font-size: 2">*</span></label>
														<textarea rows="2"  onblur="criteria(this)" class="form-control allField"
															onkeydown="clearError(this);" id="pluDescAllLocation1"
															style="resize: none;" required
															placeholder="<spring:message code="enter.description.label" />"></textarea>
														<span id="pluDescAllLocation1Error"
															style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
													</div>
												</div>
											</div>
										
                                     
                                     
                                     
                                     <div class="col-md-2 table-responsive" style="    border: 1px solid #ccc;
    padding: 0px;
    margin-left: -6.5%;
    width: 21%;">
									<table id="SKUMasterEANAllLocation1" class="table table-bordered table-hover" style="margin-bottom:0px">
                                    <thead style="background-color: #ccc !important; color: #ffff">
                                      <tr>										
								<th>EAN</th>
								<th>Actiion</th>
								</tr>
								</thead>
								<tbody>
								<tr id="dynamicdiv1">
								<td id="tableeanAllLocation1" style="width:57%"><input type="number" required="required"  id="eantableAllLocation1" style="width:100%"></td>
								<td style="width: 35%;" id="actionAllLocation1">
								
							<!-- appendSKUEAN(); -->	 <a onclick=""  style="border-bottom: 1px solid blue;color: blue;cursor: pointer;"><font size="2px">add</font></a>&nbsp&nbsp&nbsp&nbsp
								
							<!--  deleteSKUEAN('1')  -->    <a onclick="" style="border-bottom: 1px solid blue;color: blue;cursor: pointer;" id="deleteAllLocation1"><font size="2px">delete</font></a>
								
								</td>
								</tr>
								</tbody>
								</table>
								
								</div> 
								</div>
                                     </div> --%>
                                     
								</div>
<div class="pricelist" id="pricelistAllLocation0"
									style="display: none; padding: 0px">
									<div class="col-md-10" style="padding: 0px;">
										<div class="row-fluid-5">
											<div class="form-group col-lg-2 " style="padding-left: 0px;">
												<input type="hidden" id="productRangeAllLocation0">
												<input type="hidden" id="measurementRangeAllLocation0">
												<input type="hidden" id="utilityRangeAllLocation0">
												<input type="hidden" id="colourRangeAllLocation0"> <input
													type="hidden" id="sizeRangeAllLocation0"> <input
													type="hidden" id="batchRangeAllLocation0"> <input
													type="hidden" id="styleRangeAllLocation0"> <label><spring:message
														code="cost.price.label" /> <span
													style="color: red; font-size: 2">*</span></label> <input
													type="text" class="form-control allField req pluCost"
													onkeydown="clearError(this);"
													onblur="calcMarkUp(this);criteria(this)" value=""
													id="pluCostPriceAllLocation0"
													oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');"
													placeholder="<spring:message code="enter.cost.price.label" />"
													style="" /> <span
													id="pluCostPriceAllLocation0Error"
													style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
											</div>
											<div class="form-group col-lg-2 " style="margin-left: 14px;">
												<label><spring:message code="mrpprice.label" /> <span
													style="color: red; font-size: 2">*</span></label> <input
													type="text" class="form-control allField req"
													onkeydown="clearError(this);" onblur="criteria(this)"
													value="" id="pluPriceAllLocation0" style=""
													oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');"
													placeholder="<spring:message code="enter.price.label" />" />
												<span id="pluPriceAllLocation0Error"
													style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
											</div>
											<div class="form-group col-lg-2 " style="margin-left: 1px;">
												<label><spring:message code="sale.price.label" /> <span
													style="color: red; font-size: 2">*</span></label> <input
													type="text" class="form-control allField req pluSale"
													onkeydown="clearError(this);" onblur="calcMarkUp(this);"
													value="" id="pluSalePriceAllLocation0" style=""
													oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');"
													placeholder="<spring:message code="enter.sale.price.label" />" />
												<span id="pluSalePriceAllLocation0Error"
													style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
											</div>

											<div class="form-group col-lg-2">
												<label><spring:message code="ws.price.label" /> <span
													style="color: red; font-size: 2">*</span></label> <input
													type="text" onblur="criteria(this)"
													class="form-control allField req" value=""
													onkeydown="clearError(this);" id="pluWsPriceAllLocation0"
													style=""
													oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');"
													placeholder="<spring:message code="enter.ws.price.label" />" />
												<span id="pluWsPriceAllLocation0Error"
													style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
											</div>


											<input type="hidden" id="eanAllLocation0">
											

												<div class="form-group col-lg-2" style="padding-right: 0px">
													<label><spring:message
																code="sale.price.one.label" /> </label> <input type="text"
															id="salePriceOneAllLocation0"
															name="salePrice1"
															style="resize: none; width: 100%"
															class="form-control allField"
															value="${plu.salePrice1}"
															placeholder="Enter Sale price 1">
														<span id="salePriceOneAllLocation0Error"
															style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
													

												<%-- <label><spring:message code="businessCategory.label" />
												</label> <input type="text" onblur="criteria(this)"
													id="businessCategoryDetailAllLocation0"
													name="productPrecautions" style="resize: none; width: 80%"
													class="form-control allField"
													value="${sku.product_precautions}"
													placeholder="<spring:message code="enterbusinescategory.label" />">
												<span id="businessCategoryQuickError"
													style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span> --%>
													
													
											</div>
											<%-- <div class="form-group col-lg-2" style="margin-left: 1px;">
													<label><spring:message code="ean.label" /></label> <input
														type="text" onblur="criteria(this)" class="form-control allField"
														id="eanAllLocation0" value=""
														placeholder="<spring:message code="enter.ean.label" />" />
												</div> --%>
											<%-- <div class="form-group span2">
													<label><spring:message code="extra.price.label" /></label>
													<input type="text" class="form-control allField" value=""
														onkeydown="clearError(this);"
														id="pluExtraPriceAllLocation0"
														oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');"
														placeholder="<spring:message code="enter.extra.price.label" />" />
													<span id="pluExtraPriceAllLocation0Error"
														style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
												</div> --%>
										</div>

										<div class="row-fluid-5">
											<%-- <div class="form-group span2">
													<label><spring:message code="color.label" /></label> <input
														type="text" class="form-control allField"
														onkeydown="clearError(this);" id="pluColorAllLocation0"
														placeholder="<spring:message code="enter.color.label" />" />
													<span id="pluColorAllLocation0Error"
														style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
												</div> --%>
											<div class="form-group col-lg-2" style="padding-left: 0px">
												<label><spring:message code="color.shade.label" /></label>
												<input type="text" onblur="criteria(this)"
													class="form-control allField" onkeydown="clearError(this);"
													id="pluColorShadeAllLocation0"
													placeholder="<spring:message code="enter.color.shade.label" />" />
												<span id="pluColorShadeAllLocation0Error"
													style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
											</div>
											<div class="form-group col-lg-2" style="margin-left: 14px;">
												<label><spring:message code="mbq.label" /></label> <input
													type="text" onblur="criteria(this)"
													class="form-control allField" onkeydown="clearError(this);"
													id="pluMbqAllLocation0"
													placeholder="<spring:message code="enter.mbq.label" />"
													style="" /> <span id="pluMbqAllLocation0Error"
													style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
											</div>

											<div class="form-group col-lg-2"
												style="white-space: nowrap; margin-left: 1px;">
												<label><spring:message code="quantity.in.hand.label" />
													<span style="color: red; font-size: 2">*</span></label> <input
													type="text" onblur="criteria(this)"
													class="form-control allField req"
													onblur="calculateStock();" onkeydown="clearError(this);"
													value="" id="pluQuantityAllLocation0"
													oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');"
													placeholder="<spring:message code="enter.quantity.in.hand.label" />"
													style="" /> <span
													id="pluQuantityAllLocation0Error"
													style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
											</div>
											<div class="form-group col-lg-2" style="margin-left: 1px;">
												<label><spring:message code="acp.label" /></label> <input
													type="text" onblur="criteria(this)"
													class="form-control allField" onkeydown="clearError(this);"
													id="pluAcpAllLocation0" style=""
													placeholder="<spring:message code="enter.acp.label" />" />
												<span id="pluAcpAllLocation0Error"
													style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
											</div>


											<%-- <div class="form-group col-lg-2 " style="margin-left: 1px;padding-left:0px">
													<label><spring:message code="created.date.label" /></label>
													<div class="input-group">
														<div class="input-group-addon">
															<i class="fa fa-calendar"></i>
														</div>
														<input type="text" onblur="criteria(this)" id="pluCreatedDateAllLocation0"
															readonly="readonly" class="form-control dat" style="width:80%"
															data-inputmask="alias: dd/mm/yyyy" data-mask />
													</div>
													<span id="pluCreatedDateAllLocation0Error"
														style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
												</div> --%>

											<div class="form-group col-lg-2 span2"
												style="">
												
												
												
												<label><spring:message code="businessCategory.label" />
												</label> <input type="text" onblur="criteria(this)"
													id="businessCategoryDetailAllLocation0"
													name="productPrecautions" style="resize: none; "
													class="form-control allField"
													value="${sku.product_precautions}"
													placeholder="<spring:message code="enterbusinescategory.label" />">
												<span id="businessCategoryQuickError"
													style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span> 
												
												
												<%-- <label><spring:message
														code="businessSubcategory.label" /> </label> <input type="text"
													id="businessSubcategoryDetailAllLocation0"
													name="productHanding" onblur="criteria(this)"
													style="resize: none; width: 80%"
													id="businessSubcategoryQuick" class="form-control allField"
													value="${sku.product_side_effects}"
													placeholder="<spring:message code="enter.businessSubcategory.label" />">
												<span id="productSideEffectsError"
													style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span> --%>
													
													
													

											</div>


										</div>



										<div class="row-fluid-5">


											<div class="form-group col-lg-2 "
												style="margin-left: 1px; padding-left: 0px">
												<label><spring:message code="created.date.label" /></label>
												<div class="input-group">
													<div class="input-group-addon">
														<i class="fa fa-calendar"></i>
													</div>
													<input type="text" onblur="criteria(this)"
														id="pluCreatedDateAllLocation0" readonly="readonly"
														class="form-control dat" style="width: 84%"
														data-inputmask="alias: dd/mm/yyyy" data-mask />
												</div>
												<span id="pluCreatedDateAllLocation0Error"
													style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
											</div>


											<div class="form-group col-lg-2 span2"
												style="margin-left: 24px; padding-right: 0px">
												<label><spring:message code="packaged.date.label" /></label>
												<div class="input-group">
													<div class="input-group-addon">
														<i class="fa fa-calendar"></i>
													</div>
													<input class="form-control allField req dat"
														readonly="readonly"
														style="background-color: white; width: 83%"
														id="pluPackagedDateAllLocation0" size="20" type="text"
														onfocus="callCalender('pluPackagedDateAllLocation0')"
														onclick="callCalender('pluPackagedDateAllLocation0')"
														placeholder="DD/MM/YYYY" />
												</div>
												<span id="pluPackagedDateAllLocation0Error"
													style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
											</div>

											<div class="form-group col-lg-2 span2"
												style="margin-left: 14px">
												<label><spring:message
														code="min.sales.quantity.label" /></label> <input
													style="width: 90%" type="text"
													class="form-control allField" onblur="criteria(this)"
													id="priceMinSaleQtyAllLocation0" value=""
													placeholder="<spring:message code="min.sales.quantity.label" />" />
											</div>



											<div class="form-group col-lg-2 "
												style="margin-left: -4px;white-space: nowrap;">
												<label><spring:message
														code="newarrival.product.status" /> </label> <select
													class="form-control allField req" style=""
													id="skuStatusAllLocation0">
													<option value="true">Active</option>
													<option value="false">In-Active</option>

												</select>
											</div>

											<div class="form-group col-lg-3" style="">
											
											<label><spring:message
														code="businessSubcategory.label" /> </label> <input type="text"
													id="businessSubcategoryDetailAllLocation0"
													name="productHanding" onblur="criteria(this)"
													style="resize: none;width: 73%;"
													id="businessSubcategoryQuick" class="form-control allField"
													value="${sku.product_side_effects}"
													placeholder="<spring:message code="enter.businessSubcategory.label" />">
												<span id="productSideEffectsError"
													style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
											
											
											
												<%-- <label>Material Type</label> <input type="text"
													class="form-control allField" id="materailTypeAllLocation0"
													value="${plu.min_sale_qty}" placeholder="Material Type"
													style="width: 70%" /> --%>
											</div>

											<%-- <div class="form-group col-lg-2" style="padding-right:0px">
                            
									<label><spring:message code="businessCategory.label" />
										</label>
									<input type="text" onblur="criteria(this)" id="businessCategoryDetailAllLocation0" 
										name="productPrecautions" style="resize: none;"
										class="form-control allField" value="${sku.product_precautions}"
										placeholder="<spring:message code="enterbusinescategory.label" />">
									<span id="businessCategoryQuickError"
										style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
								</div> --%>



											<%-- <div class="form-group span2">
													<label><spring:message code="size.label" /></label> <input
														type="text" class="form-control allField"
														onkeydown="clearError(this);" id="pluSizeAllLocation0"
														placeholder="<spring:message code="enter.size.label" />" />
													<span id="pluSizeAllLocation0Error"
														style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
												</div> --%>
										</div>

										<%-- <div class="row-fluid-5">
													<div class="form-group span2">
														<label><spring:message code="discounttype.label" /></label> 
														<select class="form-control" id="pludiscounttypeAllLocation0">
														<option value="flat_rate">Cash Flat</option>
                                            			<option value="percentage">Cash Discount</option>
														</select>
													</div>
													<div class="form-group span2">
														<label><spring:message
																code="discount.label" /> </label> <input
															type="text" class="form-control allField req"
															onkeydown="clearError(this);"
															value="" id="pludiscountAllLocation0"
															oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');"
															placeholder="<spring:message code="discount.label" />" />
														
													</div>
												
												
													<div class="form-group span2">
														<label><spring:message
																code="cash.discpunt.label" /> </label> <input
															type="text" class="form-control allField req"
															onkeydown="clearError(this);"
															 id="pluCashdiscountAllLocation0"
															oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');"
															placeholder="<spring:message code="discount.label" />" />
														
													</div>
													
													
													
												<div class="form-group span2">
														<label><spring:message
																code="productBatchno.label" /> </label> <input
															type="text" class="form-control allField req"  
															onkeydown="clearError(this);"
															 id="pluProductBatchAllLocation0"
															oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');"
															placeholder="<spring:message code="productBatchno.label" />" />
														
													</div>
												
												
													<div class="form-group span2">
														<label><spring:message
																code="productserialno.label" /> </label> <input
															type="text" class="form-control allField req" 
															onkeydown="clearError(this);"
															 id="pludProductSerialNoAllLocation0"
															oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');"
															placeholder="<spring:message code="productserialno.label" />" />
														
													</div>
												 --%>




										<%-- <div class="row-fluid-5">
												
												
												<div class="form-group span2">
																	<label><spring:message code="bestBeforeDate.label" /></label>
																	<div class="input-group">
																		<div class="input-group-addon">
																			<i class="fa fa-calendar"></i>
																		</div>
																		<input class="form-control allField req dat"
																		readonly="readonly" style="background-color: white;"
																			id="pluBestBeforeDateAllLocation0"
																			value="" size="20" type="text"
																			onfocus="callCalender('pluBestBeforeDateAllLocation0')"
																			onclick="callCalender('pluBestBeforeDateAllLocation0')"
																			placeholder="DD/MM/YYYY" />
																	</div>
																	<span
																		id="pluBestBeforeDateAllLocation0Error"
																		style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
																</div>
																<div class="form-group span2">
																	<label><spring:message
																			code="effectivefromDate.label" /></label>
																	<div class="input-group">
																		<div class="input-group-addon">
																			<i class="fa fa-calendar"></i>
																		</div>
																		<input class="form-control allField req dat"
																		readonly="readonly" style="background-color: white;"
																			id="pluEffectivedDateAllLocation0"
																			onfocus="callCalender('pluEffectivedDateAllLocation0')"
																			onclick="callCalender('pluEffectivedDateAllLocation0')"
																			placeholder="DD/MM/YYYY" data-mask />
																	</div>
																	<span
																		id="pluEffectivedDateAllLocation0Error"
																		style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
																</div>
												
												
												
												<div class="form-group span2">
																	<label><spring:message code="manufacturedDate.label" /></label>
																	<div class="input-group">
																		<div class="input-group-addon">
																			<i class="fa fa-calendar"></i>
																		</div>
																		<input class="form-control allField req dat"
																			readonly="readonly" style="background-color: white;"
																			id="plumanufacturedDateAllLocation0"
																			 size="20" type="text"
																			onfocus="callCalender('plumanufacturedDateAllLocation0')"
																			onclick="callCalender('plumanufacturedDateAllLocation0')"
																			placeholder="DD/MM/YYYY" />
																	</div>
																	<span
																		id="plumanufacturedDateAllLocation0Eror"
																		style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
																</div>
												
												
												<div class="form-group span2">
																	<label><spring:message code="warrantyperiad.label" /></label>
																	<input type="text" class="form-control allField"
																		onkeydown="clearError(this);" 
																		id="pluWarrantyPeriodAllLocation0"
																	   
																		placeholder="<spring:message code="enterwarrantyperiad.label" />" />
																	<div class="input-group">
																		<div class="input-group-addon">
																			<i class="fa fa-calendar"></i>
																		</div>
																		<input class="form-control allField req dat"
																			readonly="readonly" style="background-color: white;"
																			id="pluwarrantyDateAllLocation0"
																			 size="20" type="text"
																			onfocus="callCalender('pluwarrantyDateAllLocation0')"
																			onclick="callCalender('pluwarrantyDateAllLocation0')"
																			placeholder="DD/MM/YYYY" />
																	</div>
																	<span
																		id="pluWarrantyPeriodAllLocation0Error"
																		style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
																</div>
												
												
												
												
												<div class="form-group span2">
									<label><spring:message code="reorder.point.label" /></label>
									
										<input type="text" class="form-control allField"
											 name="reorderPoint" id="plureorderPointAllLocation0"
											 value="" required
											oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');"
											placeholder="<spring:message code="enter.reorder.point.label" />" />
										<span id="plureorderPointAllLocation0Error"
					style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
									
								</div>
										</div>
												
											 --%>



										<%-- <div class="row-fluid-5">
												<div class="form-group span2" style="padding-left:0px">
																	<label><spring:message code="blockdeQty.label" />
																		</label> <input
																		type="text" class="form-control allField req "
																		onkeydown="clearError(this);"
																		id="pluBlockedQtyAllLocation0"
																	   
																		oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');"
																		placeholder="<spring:message code="enterblockdeQty.label" />" />
																	<span
																		id="pluBlockedQtyAllLocation0Error"
																		style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
																</div>
																
																
													<div class="form-group  span2" style="padding-left:0px">
																	<label><spring:message code="scrapedQty.label" />
																		</label> <input
																		type="text" class="form-control allField req "
																		 onkeydown="clearError(this);"
																		id="pluScrapedQtyAllLocation0"
																		
																		oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');"
																		placeholder="<spring:message code="enterscrapedQty.label" />" />
																	<span
																		id="pluScrapedQtyAllLocation0Error"
																		style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
																</div>			
															
															
															
													<div class="form-group span2">
																	<label><spring:message code="styleRange.label" /></label>
																	<input type="text" class="form-control allField"
																		onkeydown="clearError(this);" 
																		id="pluStyleRangeAllLocation0"
																		
																		placeholder="<spring:message code="enterstyleRange.label" />" />
																	<span
																		id="pluStyleRangeAllLocation0Error"
																		style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
																</div>				
															
															
															
														<div class="form-group span2">
																	<label><spring:message code="packageId.label" /></label>
																	<input type="text" class="form-control allField"
																		onkeydown="clearError(this);"
																		id="pluPackageIdAllLocation0"
																		value=""
																		placeholder="<spring:message code="enter.packageId.label" />" />
																	<span
																		id="pluPackageIdAllLocation0Error"
																		style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
																</div>	
																
																
																
															<div class="form-group span2">
																	<label><spring:message code="utility.label" /></label>
																	<input type="text" class="form-control allField"
																		onkeydown="clearError(this);"
																		id="pluUtilityAllLocation0"
																		value=""
																		placeholder="<spring:message code="enter.utility.label" />" />
																	<span
																		id="pluPackageIdAllLocation0Error"
																		style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
																</div>			
																
												
											</div>
												 --%>

										<%-- 	<div class="row">
												<div class="form-group col-lg-6">
													<label><spring:message code="description.label" />
														<span style="color: red; font-size: 2">*</span></label>
													<textarea rows="2" class="form-control allField"
														onkeydown="clearError(this);" id="pluDescAllLocation0"
														style="resize: none;" required
														placeholder="<spring:message code="enter.description.label" />"></textarea>
													<span id="pluDescAllLocation0Error"
														style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
												</div>
											</div>
										</div>
									</div>
							 --%>






										<div class="row">


											<div class="form-group col-lg-2" style="padding-right: 0px">
												<label><spring:message code="updated.date.label" /></label>
												<div class="input-group">
													<div class="input-group-addon">
														<i class="fa fa-calendar"></i>
													</div>
													<input type="text" onblur="criteria(this)"
														id="pluUpdatedDateAllLocation0" readonly="readonly"
														class="form-control dat" style="width: 80%"
														data-inputmask="alias: dd/mm/yyyy" data-mask />
												</div>
												<span id="pluUpdatedDateAllLocation0Error"
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
														readonly="readonly"
														style="background-color: white; width: 80%"
														id="pluExpiryDateAllLocation0" size="20" type="text"
														onfocus="callCalender('pluExpiryDateAllLocation0')"
														onclick="callCalender('pluExpiryDateAllLocation0')"
														placeholder="DD/MM/YYYY" />
												</div>
												<span id="pluExpiryDateAllLocation0Error"
													style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
											</div>

											<div class="form-group col-lg-2" style="padding-left: 7px;">
												<label><spring:message code="pack.size.label" /></label> <input
													type="text" onblur="criteria(this)"
													class="form-control allField"
													id="pricePackSizeAllLocation0" value="1" style="width: 60%"
													placeholder="<spring:message code="enter.pack.size.label" />" />
											</div>



											<%-- 	<div class="form-group col-lg-2 span2" style="padding-right: 0px"> 
									<label><spring:message code="businessSubcategory.label" />
										</label>
									<input type="text" id="businessSubcategoryDetailAllLocation0" 
										name="productHanding"onblur="criteria(this)" style="resize: none;" id="businessSubcategoryQuick"
										class="form-control allField"  value="${sku.product_side_effects}"
										placeholder="<spring:message code="enter.businessSubcategory.label" />">
									<span id="productSideEffectsError"
										style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>

								</div>		 --%>


											<div class="form-group col-lg-2 " style="padding-left: 0px;">
												<label><spring:message code="stock.factory.label" />
												</label> <input type="text" onblur="criteria(this)"
													id="stockfactorAllLocation0" name="stockfactor"
													style="width: 93%;resize: none;"
													class="form-control allField" value="" placeholder="">
												<span id="productSideEffectsError"
													style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>

											</div>

											<div class="form-group col-lg-2" style="padding-left: 5px;padding-right: 0px;">
											
											<label>Material Type</label> <input type="text"
													class="form-control allField" id="materailTypeAllLocation0"
													value="${plu.min_sale_qty}" placeholder="Material Type"
													style="width: 97%" />
											
											
												<%-- <label>Zero Stock Billing</label>
												<div class="col-lg-10" style="padding-left: 0px">
													<select class="form-control"
														name="zeroStockbillingAllLocation0"
														id="zeroStockbillingAllLocation0">
														<option value="true"><spring:message
																code="yes.label" /></option>
														<option value="false"><spring:message
																code="no.label" /></option>
													</select>
												</div> --%>
											</div>

										</div>


										<div class="row">

                                          <div class="form-group col-lg-2 " style="">
												<label>Zero Stock Billing</label>
												<div class="col-lg-10" style="padding-left: 0px">
													<select class="form-control"
														name="zeroStockbillingAllLocation0" style="width: 137%;"
														id="zeroStockbillingAllLocation0">
														<option value="true"><spring:message
																code="yes.label" /></option>
														<option value="false"><spring:message
																code="no.label" /></option>
													</select>
												</div>
                                             </div>

											<div class="form-group col-lg-2 " style="margin-left: 20px;padding-right: 0px">
												<label>EAN</label>
												<div class="col-lg-12" style="padding: 0px;">
													<input type="text" onblur="criteria(this)" style="background-color: white;width: 86%;"
														id="eanAllLocation0" style="" class="form-control"
														placeholder="Enter EAN number">
													<!-- <span id="eanError" style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span> -->
													<input type="hidden" id="eanduplicateAllLocation0">

												</div>
											</div>

											<div class="form-group col-lg-2 "
												style="">
												<label>Stock Status</label> <select
													class="form-control allField req" style=""
													id="skuStockStatus">
													<option value="true"
														${'true' == plu.stockStatus ? 'selected' : ''}>Active</option>
													<option value="false"
														${'false' == plu.stockStatus ? 'selected' : ''}>In-Active</option>

												</select>
											</div>

											<div class="form-group col-lg-2"></div>

											<div class="form-group col-lg-2 "></div>

											<div class="form-group col-lg-2"></div>
										</div>



										<div class="row">



											<div class="form-group col-lg-4 " style="padding-right: 0px">

												<label><spring:message
														code="technicalSpecification.label" /> </label>
												<textarea rows="2" onblur="criteria(this)"
													id="technicalSpecDetailAllLocation0" style="height: 75px;resize: none;"
													class="form-control allField"
													placeholder="<spring:message code="entertechnicalSpecification.label" />">${sku.product_precautions}</textarea>
												<span id="productSideEffectsError"
													style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>

											</div>

											<div class="form-group col-lg-4" style="/* height: 75px; */margin-left: 2%;padding-right: 0px">
												<label><spring:message code="description.label" />
													<span style="color: red; font-size: 2">*</span></label>
												<textarea rows="2" onblur="criteria(this)"
													class="form-control allField" onkeydown="clearError(this);"
													id="pluDescAllLocation0" style="height: 75px;resize: none;" required
													placeholder="<spring:message code="enter.description.label" />"></textarea>
												<span id="pluDescAllLocation0Error"
													style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
											</div>
										</div>
									</div>

									<div class="col-md-2 table-responsive"
										style="border: 1px solid #ccc; padding: 0px; margin-left: -6.5%; width: 22%;">
										<table id="SKUMasterEANAllLocation0"
											class="table table-bordered table-hover"
											style="margin-bottom: 0px">
											<thead
												style="background-color: #ccc !important; color: #ffff">
												<tr>
													<th>EAN</th>
													<th>Action</th>
												</tr>
											</thead>
											<tbody>

												<tr id="dynamicdivAllLocation0">
													<td id="tableeanAllLocation0" style="width: 57%"><input
														type="number" style="width: 100%" required="required"
														id="eantableAllLocation0" value="${plu.ean}"></td>
													<td style="width: 35%; white-space: nowrap;"
														id="actionAllLocation0">
														<!-- appendSKUEAN('AllLocation');  -->
														<a onclick=""
														style="border-bottom: 1px solid blue; color: blue; cursor: pointer;"><font
															size="2px">add</font></a>&nbsp&nbsp&nbsp&nbsp <!-- deleteSKUEAN('AllLocation','${count.count}');  -->
														<a onclick=""
														style="border-bottom: 1px solid blue; color: blue; cursor: pointer;"
														id="deleteAllLocation0"><font size="2px">delete</font></a>
													</td>
												</tr>

											</tbody>
										</table>

									</div>


								</div>
										<%-- <div class="pricelist" id="pricelistAllLocation0"
											style="display: none;padding: 0px">
											<div class="col-md-10" style="padding: 0px; ">
											<div class="row-fluid-5">
												<div class="form-group col-lg-2 " style="padding-left: 0px;">
													<input type="hidden" id="productRangeAllLocation0">
													<input type="hidden" id="measurementRangeAllLocation0">
													<input type="hidden" id="utilityRangeAllLocation0">
												<input type="hidden" id="colourRangeAllLocation0">
												<input type="hidden" id="sizeRangeAllLocation0">
												<input type="hidden" id="batchRangeAllLocation0">
												<input type="hidden" id="styleRangeAllLocation0">
													<label><spring:message code="cost.price.label" />
														<span style="color: red; font-size: 2">*</span></label> <input
														type="text" class="form-control allField req pluCost"
														onkeydown="clearError(this);" onblur="calcMarkUp(this);criteria(this)"
														value="" id="pluCostPriceAllLocation0"
														oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');"
														placeholder="<spring:message code="enter.cost.price.label" />" style="width:60%"/>
													<span id="pluCostPriceAllLocation0Error"
														style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
												</div>
												<div class="form-group col-lg-2 " style="margin-left: 14px;">
													<label><spring:message code="mrpprice.label" /> <span
														style="color: red; font-size: 2">*</span></label> <input
														type="text" class="form-control allField req"
														onkeydown="clearError(this);" onblur="criteria(this)" value=""
														id="pluPriceAllLocation0" style="width:60%"
														oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');"
														placeholder="<spring:message code="enter.price.label" />" />
													<span id="pluPriceAllLocation0Error"
														style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
												</div>
													<div class="form-group col-lg-2 " style="margin-left: 1px;">
													<label><spring:message code="sale.price.label" />
														<span style="color: red; font-size: 2">*</span></label> <input
														type="text" class="form-control allField req pluSale"
														onkeydown="clearError(this);" onblur="calcMarkUp(this);"
														value="" id="pluSalePriceAllLocation0" style="width:60%"
														oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');"
														placeholder="<spring:message code="enter.sale.price.label" />" />
													<span id="pluSalePriceAllLocation0Error"
														style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
												</div>

												<div class="form-group col-lg-2">
													<label><spring:message code="ws.price.label" /> <span
														style="color: red; font-size: 2">*</span></label> <input
														type="text" onblur="criteria(this)" class="form-control allField req" value=""
														onkeydown="clearError(this);" id="pluWsPriceAllLocation0" style="width:60%"
														oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');"
														placeholder="<spring:message code="enter.ws.price.label" />" />
													<span id="pluWsPriceAllLocation0Error"
														style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
												</div>
												
												
												<input type="hidden" id="eanAllLocation0">
												<div class="form-group col-lg-2" style="padding-right:0px">
                            
									<label><spring:message code="businessCategory.label" />
										</label>
									<input type="text" onblur="criteria(this)" id="businessCategoryDetailAllLocation0" 
										name="productPrecautions" style="resize: none;width:80%"
										class="form-control allField" value="${sku.product_precautions}"
										placeholder="<spring:message code="enterbusinescategory.label" />">
									<span id="businessCategoryQuickError"
										style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
								</div>
												<div class="form-group col-lg-2" style="margin-left: 1px;">
													<label><spring:message code="ean.label" /></label> <input
														type="text" onblur="criteria(this)" class="form-control allField"
														id="eanAllLocation0" value=""
														placeholder="<spring:message code="enter.ean.label" />" />
												</div>
												<div class="form-group span2">
													<label><spring:message code="extra.price.label" /></label>
													<input type="text" class="form-control allField" value=""
														onkeydown="clearError(this);"
														id="pluExtraPriceAllLocation0"
														oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');"
														placeholder="<spring:message code="enter.extra.price.label" />" />
													<span id="pluExtraPriceAllLocation0Error"
														style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
												</div>
											</div>
										
											<div class="row-fluid-5">
												<div class="form-group span2">
													<label><spring:message code="color.label" /></label> <input
														type="text" class="form-control allField"
														onkeydown="clearError(this);" id="pluColorAllLocation0"
														placeholder="<spring:message code="enter.color.label" />" />
													<span id="pluColorAllLocation0Error"
														style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
												</div>
												<div class="form-group col-lg-2" style="padding-left:0px">
													<label><spring:message code="color.shade.label" /></label>
													<input type="text" onblur="criteria(this)" class="form-control allField"
														onkeydown="clearError(this);"
														id="pluColorShadeAllLocation0"
														placeholder="<spring:message code="enter.color.shade.label" />" />
													<span id="pluColorShadeAllLocation0Error"
														style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
												</div>
												<div class="form-group col-lg-2" style="margin-left: 14px;">
													<label><spring:message code="mbq.label" /></label> <input
														type="text" onblur="criteria(this)" class="form-control allField"
														onkeydown="clearError(this);" id="pluMbqAllLocation0"
														placeholder="<spring:message code="enter.mbq.label" />" style="width:60%"/>
													<span id="pluMbqAllLocation0Error"
														style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
												</div>

												<div class="form-group col-lg-2" style="white-space:nowrap;margin-left: 1px;">
													<label><spring:message
															code="quantity.in.hand.label" /> <span
														style="color: red; font-size: 2">*</span></label> <input
														type="text" onblur="criteria(this)" class="form-control allField req"
														onblur="calculateStock();" onkeydown="clearError(this);"
														value="" id="pluQuantityAllLocation0"
														oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');"
														placeholder="<spring:message code="enter.quantity.in.hand.label" />" style="width:80%"/>
													<span id="pluQuantityAllLocation0Error"
														style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
												</div>
												<div class="form-group col-lg-2" style="margin-left: 1px;">
													<label><spring:message code="acp.label" /></label> <input
														type="text" onblur="criteria(this)" class="form-control allField"
														onkeydown="clearError(this);" id="pluAcpAllLocation0" style="width:80%"
														placeholder="<spring:message code="enter.acp.label" />" />
													<span id="pluAcpAllLocation0Error"
														style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
												</div>
												
												
												<div class="form-group col-lg-2 " style="margin-left: 1px;padding-left:0px">
													<label><spring:message code="created.date.label" /></label>
													<div class="input-group">
														<div class="input-group-addon">
															<i class="fa fa-calendar"></i>
														</div>
														<input type="text" onblur="criteria(this)" id="pluCreatedDateAllLocation0"
															readonly="readonly" class="form-control dat" style="width:80%"
															data-inputmask="alias: dd/mm/yyyy" data-mask />
													</div>
													<span id="pluCreatedDateAllLocation0Error"
														style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
												</div>
												
												<div class="form-group col-lg-2 span2" style="padding-right: 0px:padding-left:0px"> 
									<label><spring:message code="businessSubcategory.label" />
										</label>
									<input type="text" id="businessSubcategoryDetailAllLocation0" 
										name="productHanding"onblur="criteria(this)" style="resize: none;width:80%" id="businessSubcategoryQuick"
										class="form-control allField"  value="${sku.product_side_effects}"
										placeholder="<spring:message code="enter.businessSubcategory.label" />">
									<span id="productSideEffectsError"
										style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>

								</div>		
												
												
											</div>
											
											
											
												<div class="row-fluid-5">
												
											
											<div class="form-group col-lg-2 " style="margin-left: 1px;padding-left:0px">
													<label><spring:message code="created.date.label" /></label>
													<div class="input-group">
														<div class="input-group-addon">
															<i class="fa fa-calendar"></i>
														</div>
														<input type="text" onblur="criteria(this)" id="pluCreatedDateAllLocation0"
															readonly="readonly" class="form-control dat" style="width:84%"
															data-inputmask="alias: dd/mm/yyyy" data-mask />
													</div>
													<span id="pluCreatedDateAllLocation0Error"
														style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
												</div>
											
											
											<div class="form-group col-lg-2 span2" style="margin-left:24px;padding-right:0px">
														<label><spring:message code="packaged.date.label" /></label>
														<div class="input-group">
															<div class="input-group-addon">
																<i class="fa fa-calendar"></i>
															</div>
															<input class="form-control allField req dat"
																readonly="readonly" style="background-color: white;width:83%"
																id="pluPackagedDateAllLocation0" size="20" type="text"
																onfocus="callCalender('pluPackagedDateAllLocation0')"
																onclick="callCalender('pluPackagedDateAllLocation0')"
																placeholder="DD/MM/YYYY" />
														</div>
														<span id="pluPackagedDateAllLocation0Error"
															style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
													</div>	
												
											 <div class="form-group col-lg-2 span2" style="margin-left:14px">
                                           	<label><spring:message code="min.sales.quantity.label" /></label> <input style="width:69%"
													type="text" class="form-control allField"onblur="criteria(this)"
													id="priceMinSaleQtyAllLocation0" value=""
													placeholder="<spring:message code="min.sales.quantity.label" />" />
                                         </div>
												
												
												
												<div class="form-group col-lg-2 " style="white-space:nowrap;">
																	<label><spring:message
																			code="newarrival.product.status" /> </label>
																			<select class="form-control allField req" style="width:80%" id="skuStatusAllLocation0">
										                                      	<option value="true"  >Active</option>
		                                  		                                <option value="false" >In-Active</option>
											
										                                    </select> 
																</div>
																
																<div class="form-group col-lg-2" style="">
                                           	<label>Material Type</label> <input
													type="text"   class="form-control allField"
													id="materailTypeAllLocation0" value="${plu.min_sale_qty}"
													placeholder="Material Type" style="width:70%" />
                                         </div>
																
																<div class="form-group col-lg-2" style="padding-right:0px">
                            
									<label><spring:message code="businessCategory.label" />
										</label>
									<input type="text" onblur="criteria(this)" id="businessCategoryDetailAllLocation0" 
										name="productPrecautions" style="resize: none;"
										class="form-control allField" value="${sku.product_precautions}"
										placeholder="<spring:message code="enterbusinescategory.label" />">
									<span id="businessCategoryQuickError"
										style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
								</div>
																
																
																
												<div class="form-group span2">
													<label><spring:message code="size.label" /></label> <input
														type="text" class="form-control allField"
														onkeydown="clearError(this);" id="pluSizeAllLocation0"
														placeholder="<spring:message code="enter.size.label" />" />
													<span id="pluSizeAllLocation0Error"
														style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
												</div>
											</div>
											
											<div class="row-fluid-5">
													<div class="form-group span2">
														<label><spring:message code="discounttype.label" /></label> 
														<select class="form-control" id="pludiscounttypeAllLocation0">
														<option value="flat_rate">Cash Flat</option>
                                            			<option value="percentage">Cash Discount</option>
														</select>
													</div>
													<div class="form-group span2">
														<label><spring:message
																code="discount.label" /> </label> <input
															type="text" class="form-control allField req"
															onkeydown="clearError(this);"
															value="" id="pludiscountAllLocation0"
															oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');"
															placeholder="<spring:message code="discount.label" />" />
														
													</div>
												
												
													<div class="form-group span2">
														<label><spring:message
																code="cash.discpunt.label" /> </label> <input
															type="text" class="form-control allField req"
															onkeydown="clearError(this);"
															 id="pluCashdiscountAllLocation0"
															oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');"
															placeholder="<spring:message code="discount.label" />" />
														
													</div>
													
													
													
												<div class="form-group span2">
														<label><spring:message
																code="productBatchno.label" /> </label> <input
															type="text" class="form-control allField req"  
															onkeydown="clearError(this);"
															 id="pluProductBatchAllLocation0"
															oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');"
															placeholder="<spring:message code="productBatchno.label" />" />
														
													</div>
												
												
													<div class="form-group span2">
														<label><spring:message
																code="productserialno.label" /> </label> <input
															type="text" class="form-control allField req" 
															onkeydown="clearError(this);"
															 id="pludProductSerialNoAllLocation0"
															oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');"
															placeholder="<spring:message code="productserialno.label" />" />
														
													</div>
												
												
										
												
												
												<div class="row-fluid-5">
												
												
												<div class="form-group span2">
																	<label><spring:message code="bestBeforeDate.label" /></label>
																	<div class="input-group">
																		<div class="input-group-addon">
																			<i class="fa fa-calendar"></i>
																		</div>
																		<input class="form-control allField req dat"
																		readonly="readonly" style="background-color: white;"
																			id="pluBestBeforeDateAllLocation0"
																			value="" size="20" type="text"
																			onfocus="callCalender('pluBestBeforeDateAllLocation0')"
																			onclick="callCalender('pluBestBeforeDateAllLocation0')"
																			placeholder="DD/MM/YYYY" />
																	</div>
																	<span
																		id="pluBestBeforeDateAllLocation0Error"
																		style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
																</div>
																<div class="form-group span2">
																	<label><spring:message
																			code="effectivefromDate.label" /></label>
																	<div class="input-group">
																		<div class="input-group-addon">
																			<i class="fa fa-calendar"></i>
																		</div>
																		<input class="form-control allField req dat"
																		readonly="readonly" style="background-color: white;"
																			id="pluEffectivedDateAllLocation0"
																			onfocus="callCalender('pluEffectivedDateAllLocation0')"
																			onclick="callCalender('pluEffectivedDateAllLocation0')"
																			placeholder="DD/MM/YYYY" data-mask />
																	</div>
																	<span
																		id="pluEffectivedDateAllLocation0Error"
																		style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
																</div>
												
												
												
												<div class="form-group span2">
																	<label><spring:message code="manufacturedDate.label" /></label>
																	<div class="input-group">
																		<div class="input-group-addon">
																			<i class="fa fa-calendar"></i>
																		</div>
																		<input class="form-control allField req dat"
																			readonly="readonly" style="background-color: white;"
																			id="plumanufacturedDateAllLocation0"
																			 size="20" type="text"
																			onfocus="callCalender('plumanufacturedDateAllLocation0')"
																			onclick="callCalender('plumanufacturedDateAllLocation0')"
																			placeholder="DD/MM/YYYY" />
																	</div>
																	<span
																		id="plumanufacturedDateAllLocation0Eror"
																		style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
																</div>
												
												
												<div class="form-group span2">
																	<label><spring:message code="warrantyperiad.label" /></label>
																	<input type="text" class="form-control allField"
																		onkeydown="clearError(this);" 
																		id="pluWarrantyPeriodAllLocation0"
																	   
																		placeholder="<spring:message code="enterwarrantyperiad.label" />" />
																	<div class="input-group">
																		<div class="input-group-addon">
																			<i class="fa fa-calendar"></i>
																		</div>
																		<input class="form-control allField req dat"
																			readonly="readonly" style="background-color: white;"
																			id="pluwarrantyDateAllLocation0"
																			 size="20" type="text"
																			onfocus="callCalender('pluwarrantyDateAllLocation0')"
																			onclick="callCalender('pluwarrantyDateAllLocation0')"
																			placeholder="DD/MM/YYYY" />
																	</div>
																	<span
																		id="pluWarrantyPeriodAllLocation0Error"
																		style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
																</div>
												
												
												
												
												<div class="form-group span2">
									<label><spring:message code="reorder.point.label" /></label>
									
										<input type="text" class="form-control allField"
											 name="reorderPoint" id="plureorderPointAllLocation0"
											 value="" required
											oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');"
											placeholder="<spring:message code="enter.reorder.point.label" />" />
										<span id="plureorderPointAllLocation0Error"
					style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
									
								</div>
										</div>
												
											
											
											
											
											<div class="row-fluid-5">
												<div class="form-group span2" style="padding-left:0px">
																	<label><spring:message code="blockdeQty.label" />
																		</label> <input
																		type="text" class="form-control allField req "
																		onkeydown="clearError(this);"
																		id="pluBlockedQtyAllLocation0"
																	   
																		oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');"
																		placeholder="<spring:message code="enterblockdeQty.label" />" />
																	<span
																		id="pluBlockedQtyAllLocation0Error"
																		style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
																</div>
																
																
													<div class="form-group  span2" style="padding-left:0px">
																	<label><spring:message code="scrapedQty.label" />
																		</label> <input
																		type="text" class="form-control allField req "
																		 onkeydown="clearError(this);"
																		id="pluScrapedQtyAllLocation0"
																		
																		oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');"
																		placeholder="<spring:message code="enterscrapedQty.label" />" />
																	<span
																		id="pluScrapedQtyAllLocation0Error"
																		style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
																</div>			
															
															
															
													<div class="form-group span2">
																	<label><spring:message code="styleRange.label" /></label>
																	<input type="text" class="form-control allField"
																		onkeydown="clearError(this);" 
																		id="pluStyleRangeAllLocation0"
																		
																		placeholder="<spring:message code="enterstyleRange.label" />" />
																	<span
																		id="pluStyleRangeAllLocation0Error"
																		style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
																</div>				
															
															
															
														<div class="form-group span2">
																	<label><spring:message code="packageId.label" /></label>
																	<input type="text" class="form-control allField"
																		onkeydown="clearError(this);"
																		id="pluPackageIdAllLocation0"
																		value=""
																		placeholder="<spring:message code="enter.packageId.label" />" />
																	<span
																		id="pluPackageIdAllLocation0Error"
																		style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
																</div>	
																
																
																
															<div class="form-group span2">
																	<label><spring:message code="utility.label" /></label>
																	<input type="text" class="form-control allField"
																		onkeydown="clearError(this);"
																		id="pluUtilityAllLocation0"
																		value=""
																		placeholder="<spring:message code="enter.utility.label" />" />
																	<span
																		id="pluPackageIdAllLocation0Error"
																		style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
																</div>			
																
												
											</div>
												
												
											<div class="row">
												<div class="form-group col-lg-6">
													<label><spring:message code="description.label" />
														<span style="color: red; font-size: 2">*</span></label>
													<textarea rows="2" class="form-control allField"
														onkeydown="clearError(this);" id="pluDescAllLocation0"
														style="resize: none;" required
														placeholder="<spring:message code="enter.description.label" />"></textarea>
													<span id="pluDescAllLocation0Error"
														style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
												</div>
											</div>
										</div>
									</div>
							
							 
							 
							 
							 
							 

<div class="row">


<div class="form-group col-lg-2" style="padding-right:0px">
													<label><spring:message code="updated.date.label" /></label>
													<div class="input-group">
														<div class="input-group-addon">
															<i class="fa fa-calendar"></i>
														</div>
														<input type="text" onblur="criteria(this)" id="pluUpdatedDateAllLocation0"
															readonly="readonly" class="form-control dat" style="width:80%"
															data-inputmask="alias: dd/mm/yyyy" data-mask />
													</div>
													<span id="pluUpdatedDateAllLocation0Error"
														style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
												</div>
												
												
												<div class="form-group col-lg-2 span2" style="margin-left:26px;padding-right:0px">
													<label><spring:message code="expiry.date.label" /></label>
													<div class="input-group">
														<div class="input-group-addon">
															<i class="fa fa-calendar"></i>
														</div>
														<input class="form-control allField req dat"
															readonly="readonly" style="background-color: white;width:80%"
															id="pluExpiryDateAllLocation0" size="20" type="text"
															onfocus="callCalender('pluExpiryDateAllLocation0')"
															onclick="callCalender('pluExpiryDateAllLocation0')"
															placeholder="DD/MM/YYYY" />
													</div>
													<span id="pluExpiryDateAllLocation0Error"
														style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
												</div>
												
						<div class="form-group col-lg-2" style="padding-left:8px" >
                                           	<label><spring:message code="pack.size.label" /></label> <input
													type="text" onblur="criteria(this)" class="form-control allField"
													id="pricePackSizeAllLocation0" value="1" style="width:60%"
													placeholder="<spring:message code="enter.pack.size.label" />" />
                                        </div>
                                        
                                
								
										<div class="form-group col-lg-2 span2" style="padding-right: 0px"> 
									<label><spring:message code="businessSubcategory.label" />
										</label>
									<input type="text" id="businessSubcategoryDetailAllLocation0" 
										name="productHanding"onblur="criteria(this)" style="resize: none;" id="businessSubcategoryQuick"
										class="form-control allField"  value="${sku.product_side_effects}"
										placeholder="<spring:message code="enter.businessSubcategory.label" />">
									<span id="productSideEffectsError"
										style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>

								</div>			
								
								
								<div class="form-group col-lg-2 " style="padding-left:14px"> 
									<label><spring:message code="stock.factory.label" />
										</label>
									<input type="text"  onblur="criteria(this)" id="stockfactorAllLocation0" 
										name="stockfactor" style="resize: none;width:60%" 
										class="form-control allField"  value="" 
										placeholder="">
									<span id="productSideEffectsError"
										style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>

								</div>
								
								<div class="form-group col-lg-2">
									<label>Zero Stock Billing</label>
									<div class="col-lg-10" style="padding-left: 0px">
										<select class="form-control" name="zeroStockbillingAllLocation0" id="zeroStockbillingAllLocation0">
											<option value="true"><spring:message
													code="yes.label" /></option>
											<option value="false"><spring:message
													code="no.label" /></option>
										</select>
									</div>
								</div>
										
												</div>
												
												
												<div class="row">
										
							<div class="form-group col-lg-2 " style="">
										<label>EAN</label>
									<div class="col-lg-12" style="padding: 0px;">
									<input type="text" onblur="criteria(this)" id="eanAllLocation0"  style="" class="form-control"   placeholder="Enter EAN number">
									<!-- <span id="eanError" style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span> -->
									<input type="hidden" id="eanduplicateAllLocation0">
									
									</div>
							</div>				
									
								<div class="form-group col-lg-2 " style="margin-left:20px;padding-right:0px">
										<label>Stock Status</label>
										<select class="form-control allField req" style="width:80%" id="skuStockStatus">
									         <option value="true" ${'true' == plu.stockStatus ? 'selected' : ''} >Active</option>
		                                  	 <option value="false" ${'false' == plu.stockStatus ? 'selected' : ''}>In-Active</option>
											
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
							 
							 
							 
							 	<div class="form-group col-lg-5 " style="padding-right:0px">
								
									<label><spring:message code="technicalSpecification.label" />
										</label>
									<textarea rows="2" onblur="criteria(this)" id="technicalSpecDetailAllLocation0" style="resize:none"
										class="form-control allField"
										placeholder="<spring:message code="entertechnicalSpecification.label" />">${sku.product_precautions}</textarea>
									<span id="productSideEffectsError"
										style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
							
								</div>
							 
											<div class="form-group col-lg-5" style="padding-right:0px">
												<label><spring:message code="description.label" />
													<span style="color: red; font-size: 2">*</span></label>
												<textarea rows="2" onblur="criteria(this)" class="form-control allField"
													onkeydown="clearError(this);" id="pluDescAllLocation0"
													style="resize: none;" required
													placeholder="<spring:message code="enter.description.label" />"></textarea>
												<span id="pluDescAllLocation0Error"
													style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
											</div>
										</div>
										</div>
										
										<div class="col-md-2 table-responsive" style="border: 1px solid #ccc;padding: 0px; margin-left: -6.5%;width: 22%;">
							<table id="SKUMasterEANAllLocation0" class="table table-bordered table-hover" style="margin-bottom:0px">
                            <thead style="background-color: #ccc !important; color: #ffff">
                                <tr>										
								<th>EAN</th>
								<th>Action</th>
								</tr>
							</thead>
							<tbody>
							
								<tr id="dynamicdivAllLocation0">
								<td id="tableeanAllLocation0" style="width:57%"><input type="number" style="width:100%"   required="required" id="eantableAllLocation0" value="${plu.ean}"></td>
								<td style="width: 35%;white-space: nowrap;" id="actionAllLocation0">
								<!-- appendSKUEAN('AllLocation');  --><a onclick=""  style="border-bottom: 1px solid blue;color: blue;cursor: pointer;"><font size="2px">add</font></a>&nbsp&nbsp&nbsp&nbsp
							  <!-- deleteSKUEAN('AllLocation','${count.count}');  -->   <a onclick="" style="border-bottom: 1px solid blue;color: blue;cursor: pointer;" id="deleteAllLocation0"><font size="2px">delete</font></a>
								</td>
								</tr>
								
								</tbody>
								</table>
								
								</div> 
										
										
									</div> --%>

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
								</div>
							</div>
							<!-- /.box-body -->
							<div class="row" style="text-align: right;margin-right: 1px;">
								<div class="col-md-12">
									<input type="button" id="edit" style="margin-right: 25px"
										class="btnCls" onclick="validateSkuForm('new')"
										value="<spring:message code="submit.label" />" /> <input
										type="button" id="edit" class="btnCls"
										style="margin-right: 25px" onclick="resetAll();"
										value="<spring:message code="reset.label" />" />
									<c:if test="${sessionScope.role == 'super admin'}">
										<input type="button" class="btnCls"
											style="margin-right: 2%; "
											onclick="viewSkuMaster('skumaster','0');"
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
							<!-- <div class="box-footer"></div> -->
					</form>
				</div>

			</div>
		</div>
	</section>
	<!-- /.content -->
</body>
</html>