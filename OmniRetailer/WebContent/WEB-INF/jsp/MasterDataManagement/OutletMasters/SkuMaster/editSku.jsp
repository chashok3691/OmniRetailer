<!--/*
 * Project Name 	        : OmniRetailerCustomer
 * Written By		        : Mythri
 * file name		        : Inventory Manager/master/editSku.jsp
 * file type		        : JSP
 * description				: The edit sku is displayed using this jsp
 * */ -->


<%-- <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%> --%>
		<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Home | Omni Retailer</title>
<meta
	content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no'
	name='viewport'>
<%-- <script src="${pageContext.request.contextPath}/js/jquery-1.8.3.min.js"></script> --%>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/controller.js"></script>


<script
	src="${pageContext.request.contextPath}/js/masterDataManagement/outletMasters/skuMaster.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/masterDataManagement/genericMasters/employeeMaster.js"></script>
<%-- <script src="${pageContext.request.contextPath}/js/form_plugin.js"></script> --%>
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


.editableBox {
    width: 75px;
    height: 30px;
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

<!--  added by        :  koti bomminei
      description     :  to ristrict the user from entering special characters     -->


	
	
	
	 



<script type="text/javascript">
	$(document).ready(
		
	
			function() {
				$(".priceList").hide();
				setMarkUp();
// 				callCalender('pluPackagedDate');
         $(this).scrollTop(0);

				var dateTime = getCurrentDate();
				var date = dateTime.split(' ');
				date = date[0].split('/');
				var formatedDate = date[1] + "/" + date[0] + "/" + date[2];
				$('#lastUpdated').val(formatedDate);
				//getDate('createdDate'); 
				setPriceListDivContentforEdit();
				var selectedStoreLocation = $("#selectedStoreLocation").val()
						.replace('[', '').replace(']', '').replace(/, /g, ',')
						.replace(/ ,/g, ',');
				$("#location").val(selectedStoreLocation.split(','));
				/* var selectedLocation = $("#selectedLocation").val();
				selectedLocation = selectedLocation.replace(/ /g,'_');
				 var len = $("div ."+selectedLocation+" .pricelist").length;
				 $("#currentPriceList").html("1 of "+len); */
				setExpiryDateAndUpdatedDate();
				/* for(var i=1;i<=len;i++){
				callCalender('pluExpiryDate'+i);
				 $('#pluUpdatedDate'+i).val(formatedDate);
				} */
				/*  if(len>1)
					 $("#nextImg").css("opacity","1"); */
			
				
			    
			    
			    });
	/* function deletePic(element){
	 var k = confirm("Are you sure you want to Delete");
	 if(k == true){
	 $("#picture"+element+"_image").html('');
	 $("#picture"+element+"_byte").val('');
	 }
	 } */
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
						<c:if test="${type == 'new'}">
							<h3>
								<spring:message code="new.sku.header.label" />
							</h3>
						</c:if>
						<c:if test="${type == 'edit'}">
							<h3>
								<spring:message code="edit.sku.label" />
							</h3>
						</c:if>
					</div>
					<!-- /.box-header -->
					<!-- form start -->
					<form id="editSku" method="post">
						<div class="box-body">
							<div class="row" style="text-align: right; margin-top: -27px;">
								 <div id="ErrorDetail" class="Error" style="text-align: center;color: red;font-size: 2;font-weight: bold;margin-bottom: 20px; ">${err}</div>
	        		            <div id="SuccessDetail" class="Error" style="text-align: center;color: blue;font-size: 2;font-weight: bold;margin-bottom: 20px; ">${success}</div>
								<c:if test="${type == 'new'}">
									<input type="button" id="edit" style="position: relative;"
										class="btnCls" onclick="validateSkuForm('new')"
										value="<spring:message code="submit.label" />" />
									<input type="button" id="edit" class="btnCls"
										style="margin-left: 25px; margin-right: 25px;position: relative;"
										onclick="resetAll();"
										value="<spring:message code="reset.label" />" />
									<c:if test="${sessionScope.role == 'super admin'}">
										<input type="button" class="btnCls"
											style="margin-right: 15px;position: relative;"
											onclick="viewSkuMaster('skumaster','0');"
											value="<spring:message code="cancel.label" />" />
									</c:if>
									<c:forEach var="accessControl"
										items="${sessionScope.outletMasterSettings}">
										<c:if
											test="${accessControl.appDocument == 'SkuMaster' && accessControl.write == true && accessControl.read == true}">
											<input type="button" class="btnCls"
												style="margin-right: 15px;position: relative;"
												onclick="viewSkuMaster('skumaster','0');"
												value="<spring:message code="cancel.label" />" />
										</c:if>
									</c:forEach>
								</c:if>
								<c:if test="${type == 'edit'}">
									<input type="button" class="btnCls" style="margin-right: 25px;position: relative"
										onclick="validateSkuForm('edit')"
										value="<spring:message code="submit.label" />" />
									<input type="button" class="btnCls" style="margin-right: 15px;position: relative;"
										onclick="viewSkuMaster('skumaster','0');"
										value="<spring:message code="cancel.label" />" />
								</c:if>
								<hr style="margin-top: 4px; width: 99%;" />
							</div>
							<div class="row">
								<div class="form-group col-lg-2">
									<label><spring:message code="skuid.label" /> <span
										style="color: red; font-size: 2">*</span></label>
									<c:if test="${type == 'new'}">
										<input type="text" onblur="criteria(this)"  class="form-control allField" id="skuId"
											value="${sku.skuId}"
											oninput="this.value = this.value.replace(/[^a-zA-Z0-9 -]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');"
											placeholder="<spring:message code="enter.sku.id.label" />" />
									</c:if>
									<c:if test="${type == 'edit'}">
										<input type="text" onblur="criteria(this)" class="form-control allField"
											readonly="readonly" id="skuId" value="${sku.skuId}"
											placeholder="<spring:message code="enter.sku.id.label" />" />
									</c:if>
									<span id="skuIdError"
										style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
								</div>
								<div class="form-group col-lg-2">
									<label><spring:message code="product.name.label" /> <span
										style="color: red; font-size: 2">*</span></label> <input type="text"
										value="${sku.description}"onblur="criteria(this)"
										class="form-control allField"
										id="shortDescription" name="shortDescription"
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
									<input type="hidden" class="allField" id="productId"
										value="${sku.skuId}">
								</div>
								<div class="form-group col-lg-2">
									<label><spring:message code="category.name.label" /></label> 
									<select class="form-control allField"  id="categoryNameID" name="categoryName"  onchange="searchSubCategories('categoryName','subCategoryName')">
	                             <c:forEach var="categoryList" items="${categoryList}">
									<option value="${fn:trim(categoryList.categoryName)}" ${fn:trim(categoryList.categoryName) == sku.productCategory ? 'selected' : ''} id="${fn:trim(categoryList.categoryName)}" >${fn:trim(categoryList.categoryName)}</option>
						 		</c:forEach>
	                        </select>
									<%-- <input
										type="text" class="form-control allField" readonly="readonly"
										id="categoryName" name="categoryName"
										value="${sku.productCategory}" required
										placeholder="<spring:message code="category.name.label" />" /> --%>
									<input type="hidden" id="categoryId" name="categoryId"
										value="${sku.productCategory}" /> <span id="eanError"
										style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
								</div>
								<div class="form-group col-lg-2">
									<label><spring:message code="sub.category.name.label" /></label>
									
									 <select class="form-control" id="subCategoryNameID" name="subCategoryName" >
	                          <c:forEach var="subCategoryDetailsList" items="${subCategoryDetailsList}">
									<option value="${fn:trim(subCategoryDetailsList.subcategoryName)}" ${fn:trim(subCategoryDetailsList.subcategoryName) == sku.subCategory ? 'selected' : ''} id="${fn:trim(subCategoryDetailsList.subcategoryName)}" >${fn:trim(subCategoryDetailsList.subcategoryName)}</option>
						 		</c:forEach>
	                        </select>
									<%-- <input type="text" class="form-control allField"
										readonly="readonly" id="subCategoryName"
										name="subCategoryName" value="${sku.subCategory}" required
										placeholder="<spring:message code="sub.category.name.label" />" /> --%>
									<span id="eanError"
										style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
								</div>
								<div class="form-group col-lg-2">
									<label><spring:message code="ean.label" /></label> <input
										type="text" class="form-control allField" id="ean" name="ean"
										value="${sku.ean}" required
										placeholder="<spring:message code="enter.ean.label" />" /> <span
										id="eanerr"
										style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
								</div>
								<div class="form-group col-lg-2">
									<label><spring:message
											code="skuMaster.supplier.name.label" /> <span
										style="color: red; font-size: 2"></span></label>
									<c:if test="${type == 'new'}">
										<input type="text"onblur="criteria(this)" value="${sku.supplier}"  autocomplete="off" style=""
											class="form-control allField searchItems searchBar"
											name="supplier_name" id="searchSupplier"
											placeholder="<spring:message code="search.supplier.label" />" />
										<div class=services>
											<div class="items">
												<ul class="matchedStringUl supplier"
													style="width: 89% !important; padding: 0px !important;"></ul>
											</div>
										</div>
										<span id="supplierNameError"
											style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
										<input type="hidden" class="allField" name="supplier_Id"
											id="supplier_Id" value="${sku.supplierName}" />
									</c:if>
									<c:if test="${type == 'edit'}">
										<select class="form-control" id="supplier_Id">
										<option value="Others">Others</option>
											<c:forEach var="supplier" items="${supplierList}">
												<option value="${supplier.firmName}"
													${sku.supplierName == supplier.firmName ? 'selected' : ''}>${supplier.firmName}</option>
											</c:forEach>
										</select>
									</c:if>
								</div>
							</div>

							<div class="row">
								<div class="form-group col-lg-2">
									<label><spring:message code="brand.code.label" /></label>

									<div class="col-lg-10" style="padding-left: 0px">
										<select class="form-control" id="brandCode">
										<option value="others">Others</option>
											<c:forEach var="brandName" items="${brandsList}">
												<option value="${brandName}"
													${sku.brandCode == brandName ? 'selected' : ''}>${brandName}</option>
											</c:forEach>
										</select>
									</div>
								</div>
								<div class="form-group col-lg-2">
									<label><spring:message code="manufacturer.code.label" /></label>
									<input type="text" onblur="criteria(this)" class="form-control allField"
										name="manufacturerCode" id="manufacturerCode"
										value="${sku.manufacturerCode}" required
										placeholder="<spring:message code="enter.manufacturer.code.label" />" />
									<span id="manufacturerCodeError"
										style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
								</div>
								<div class="form-group col-lg-2">
									<label><spring:message code="manufacturer.name.label" />
										<span style="color: red; font-size: 2">*</span></label> <input
										type="text" onblur="criteria(this)" class="form-control allField" id="manufacturer"
										name="make" value="${sku.make}" required
										placeholder="<spring:message code="enter.manufacturer.name.label" />" />
									<span id="manufacturerError"
										style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
								</div>
								<div class="form-group col-lg-2">
									<label><spring:message code="uom.label" /> <span
										style="color: red; font-size: 2">*</span></label>

									<div class="col-lg-10" class="" style="padding-left: 0px" >
										
										<input type="text"  id="uomList" value="${sku.uom}" list="uom"/>
<datalist id="uom">
    <option value="KG" ${sku.uom == 'KG' ? 'selected' : ''}>KG</option>
											<option value="Grams" ${sku.uom == 'Grams' ? 'selected' : ''}>Grams</option>
											<option value="Litres"
												${sku.uom == 'Litres' ? 'selected' : ''}>Litres</option>
											<option value="Millilitres"
												${sku.uom == 'Millilitres' ? 'selected' : ''}>Millilitres</option>
											<option value="Meters"
												${sku.uom == 'Meters' ? 'selected' : ''}>Meters</option>
											<option value="PCS"
												${sku.uom == 'PCS' ? 'selected' : ''}>PCS</option>
											<option value="Cases" ${sku.uom == 'Cases' ? 'selected' : ''}>Cases</option>
										
										<option value="BOTTLE"${sku.uom == 'BOTTLE' ? 'selected' : ''}>BOTTLE</option>
											<option value="CASE"${sku.uom == 'CASE' ? 'selected' : ''}>CASE</option>
</datalist>
										
										<%-- <select class="form-control" id="uom" >
											<option value="KG" ${sku.uom == 'KG' ? 'selected' : ''}>KG</option>
											<option value="Grams" ${sku.uom == 'Grams' ? 'selected' : ''}>Grams</option>
											<option value="Litres"
												${sku.uom == 'Litres' ? 'selected' : ''}>Litres</option>
											<option value="Millilitres"
												${sku.uom == 'Millilitres' ? 'selected' : ''}>Millilitres</option>
											<option value="Meters"
												${sku.uom == 'Meters' ? 'selected' : ''}>Meters</option>
											<option value="PCS"
												${sku.uom == 'PCS' ? 'selected' : ''}>PCS</option>
											<option value="Cases" ${sku.uom == 'Cases' ? 'selected' : ''}>Cases</option>
										
										<option value="BOTTLE"${sku.uom == 'BOTTLE' ? 'selected' : ''}>BOTTLE</option>
											<option value="CASE"${sku.uom == 'CASE' ? 'selected' : ''}>CASE</option>
										</select> --%>
										
											<span id="uomListError"
										style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
										
									</div>
								</div>
								<div class="form-group col-lg-2">
									<label><spring:message code="uom.label.label" /></label>
									<div class="col-lg-10" style="padding-left: 0px">
										<%--  <label><spring:message code="quantity.label" /></label>
                                            <input type="text" class="form-control allField" name="weight" id="weight" value="${sku.quantity}"  placeholder="<spring:message code="enter.quantity.label" />" oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');" />
                                        	<span id="weightError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span> --%>

										<input type="text" onblur="criteria(this)"  class="form-control allField"
											name="uomLabel" id="uomLabel" value="${sku.uomLabel}"
											placeholder="<spring:message code="enter.uom.label.label" />" />
										<span id="newWeightError"
											style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
									</div>
								</div>
								<div class="form-group col-lg-2">
									<label><spring:message code="pack.size.label" /></label>
									<div class="col-lg-10" style="padding-left: 0px">
										<input type="text" onblur="criteria(this)" class="form-control allField"
											name="packSize" id="packSize" value="${sku.packSize}"
											required
											placeholder="<spring:message code="enter.pack.size.label" />"
											oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');" />
										<span id="packSizedeatilError"
											style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
									</div>
								</div>
							</div>
							<div class="row">
								<div class="form-group col-lg-2">
									<label><spring:message code="zero.stock.orders.label" /></label>
									<div class="col-lg-10" style="padding-left: 0px">
										<select class="form-control" name="zeroStock" id="zeroStockdetail">
											<%-- <option value="true" ${sku.zeroStock == true ? 'selected' : ''}>Yes</option>
											<option value="false" ${sku.zeroStock == false ? 'selected' : ''}>No</option> --%>
											
											<option value="true"${sku.zeroStock == true ? 'selected' : ''}>Yes</option>
											<option value="false"${sku.zeroStock == false ? 'selected' : ''}>No</option>
											
										</select>
									</div>
								</div>
								<div class="form-group col-lg-2">
									<label><spring:message code="just.in.time.orders.label" /></label>
									<div class="col-lg-10" style="padding-left: 0px">
										<select class="form-control" name="jitStock" id="jitStock">
											<option value="true"
												${sku.jitStock == true ? 'selected' : ''}>Yes</option>
											<option value="false"
												${sku.jitStock == false ? 'selected' : ''}>No</option>
										</select>
									</div>
								</div>
								<div class="form-group col-lg-2">
									<label><spring:message code="min.sales.quantity.label" />
										<span style="color: red; font-size: 2"></span></label>
									<div class="col-lg-9" style="padding-left: 0px">
										<input type="text" onblur="criteria(this)" class="form-control allField"
											id="minSaleQty" name="minSaleQty" value="${sku.minSaleQty}"
											required
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
											id="maxSaleQty" name="maxSaleQty" value="${skuMaxSaleQty}" required
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
											<option value="true"
												${sku.manufacturedItem == true ? 'selected' : ''}><spring:message
													code="yes.label" /></option>
											<option value="false"
												${sku.manufacturedItem == false ? 'selected' : ''}><spring:message
													code="no.label" /></option>

										</select>
									</div>
								</div>
								<div class="form-group col-lg-2">
									<label><spring:message code="packagedItem.label" /> <!-- <span style="color:red; font-size:2">*</span> --></label>
									<div class="col-lg-10" style="padding-left: 0px">
										<select class="form-control" name="packagedItem"
											id="packagedItem">
											<option value="true" ${sku.packed == true ? 'selected' : ''}><spring:message
													code="yes.label" /></option>
											<option value="false" ${sku.packed == false? 'selected' : ''}><spring:message
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
										<input type="text" onblur="criteria(this)" class="form-control allField" name=""
											id="patternCode" value="${sku.patternCode}" required
											placeholder="<spring:message code="enter.pattern.code.label" />" />
										<span id="patternCodeError"
											style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
									</div>
								</div>
								<div class="form-group col-lg-2">
									<label><spring:message code="reorder.point.label" /></label>
									<div class="col-lg-10" style="padding-left: 0px">
										<input type="text" onblur="criteria(this)" class="form-control allField"
											name="reorderPoint" id="reorderPoint"
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
										<input type="text" onblur="criteria(this)" class="form-control allField"
											name="orderQuantity" id="orderQuantity"
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
										<input type="text" onblur="criteria(this)" class="form-control allField"
											name="leadTime" id="leadTime" value="${sku.leadTimeDays}"
											required
											placeholder="<spring:message code="enter.product.lead.time.label" />"
											oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');" />
										<span id="leadTimeError"
											style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
									</div>
								</div>
								<div class="form-group col-lg-2">
									<label><spring:message code="product.max.stock.label" /></label>
									<div class="col-lg-10" style="padding-left: 0px">
										<input type="text" onblur="criteria(this)" class="form-control allField"
											name="maxStock" id="maxStock" value="${sku.maxStock}"
											required
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
										<input type="text" onblur="criteria(this)" class="form-control allField"
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
										<select class="form-control" id="taxCode">
											<c:forEach var="tax" items="${taxDetails}">
												<%-- <option value="${tax.taxName}"
													${tax.taxName == sku.taxCode ? 'selected' : ''}>${tax.taxId}
													- ${tax.taxName}</option> --%>
													<option value="${tax.taxName}"
													${tax.taxName.toUpperCase() == sku.taxCode.toUpperCase() ? 'selected' : ''}>${tax.taxId}
													- ${tax.taxName}</option>
											</c:forEach>
										</select> <span id="taxCodeError"
											style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
									</div>
								</div>

								<div class="form-group col-lg-2">
									<label><spring:message code="fr.tax.code.label" /></label>
									<div class="col-lg-10" style="padding-left: 0px">
										<input type="text" onblur="criteria(this)" class="form-control allField"
											name="frTaxCode" id="frTaxCode" value="${sku.frTaxCode}"
											oninput="this.value = this.value.replace(/[^0-9]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');"
											required
											placeholder="<spring:message code="enter.fr.tax.code.label" />" />
											
											<span id="frTaxCodeError"
											style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
									</div>
								</div>
								<div class="form-group col-lg-2">
									<label><spring:message code="mark.up.label" /></label>
									<div class="col-lg-9" style="padding-left: 0px">
										<input type="text" onblur="criteria(this)" class="form-control allField"
											readonly="readonly" name="markUp" id="markUp"
											value="${sku.markUp}" required
											placeholder="<spring:message code="enter.mark.up.label" />" />
									</div>
								</div>
								<div class="form-group col-lg-2">
									<label><spring:message code="mark.down.label" /></label>
									<div class="col-lg-9" style="padding-left: 0px">
										<input type="text" onblur="criteria(this)" class="form-control allField"
											name="markDown" id="markDown" value="${sku.markDown}"
											required
											placeholder="<spring:message code="enter.mark.down.label" />" />
									
									<span id="markDownError"
											style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
									</div>
								</div>
								<div class="form-group col-lg-2">
									<label><spring:message code="running.plunumber.label" />
										<span style="color: red; font-size: 2">*</span></label>
									<div class="col-lg-11" style="padding-left: 0px">
										<select class="form-control" id="runningPlu">
											<c:forEach var="plu" items="${sku.skuPriceLists}">
												<option value="${plu.pluCode}"
													${plu.pluCode == sku.runningPluNumber ? 'selected' : ''}>${plu.pluCode}</option>
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
										<input type="text" onblur="criteria(this)" class="form-control allField" name="model"
											id="model" value="${sku.model}" required
											placeholder="<spring:message code="enter.model.label" />" />
										<span id="newmodelError"
											style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
									</div>
								</div>
								
								<div class="form-group col-lg-2">
									<label><spring:message code="open.rate.label" /></label>
									<div class="col-lg-10" style="padding-left: 0px">
										<input type="text" onblur="criteria(this)" class="form-control allField"
											name="openRate" id="openRate" value="${sku.openRate}"
											placeholder="<spring:message code="enter.open.rate.label" />"
											oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');" />
										<span id="colorError"
											style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
									</div>
								</div>
								<div class="form-group col-lg-2">
									<label><spring:message code="last.cost.label" /></label>
									<div class="col-lg-10" style="padding-left: 0px">
										<input type="text" onblur="criteria(this)" class="form-control allField"
											name="lastCost" id="lastCost" value="${sku.lastCost}"
											placeholder="<spring:message code="enter.last.cost.label" />"
											oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');" />
										<span id="lastCostError"
											style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
									</div>
								</div>
								<div class="form-group col-lg-2">
									<label><spring:message code="average.cost.label" /></label>
									<div class="col-lg-9" style="padding-left: 0px">
										<input type="text"onblur="criteria(this)"  class="form-control allField"
											name="averageCost" id="averageCost" value="${sku.avgCost}"
											required
											placeholder="<spring:message code="enter.average.cost.label" />"
											oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');" />
										<span id="averageCostError"
											style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
									</div>
								</div>
								<div class="form-group col-lg-2">
									<label><spring:message code="minimum.price.label" /></label>
									<div class="col-lg-9" style="padding-left: 0px">
										<input type="text"onblur="criteria(this)" class="form-control allField"
											name="minPrice" id="minPrice" value="${sku.minimumPrice}"
											required
											placeholder="<spring:message code="enter.minimum.price.label" />"
											oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');" />
										<span id="minPriceError"
											style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
									</div>
								</div>
								<div class="form-group col-lg-2">
									<label><spring:message code="color.label" /></label>
									<div class="col-lg-10" style="padding-left: 0px">
										<input type="text" onblur="criteria(this)" class="form-control allField" name="color"
											id="color" value="${sku.color}"
											placeholder="<spring:message code="enter.color.label" />" />
										<span id="skucolorError"
											style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
									</div>
								</div>

								

							</div>

							<div class="row">
							
							<div class="form-group col-lg-2">
									<label><spring:message code="status.label" /></label>
									<div class="col-lg-10" style="padding-left: 0px">
										<select class="form-control" name="status" id="editstatus">
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
										type="text"onblur="criteria(this)"
										class="form-control allField searchItems searchBar"
										id="secondaryDepartment" value="${sku.secondaryDepartment}"
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
										class="form-control allField searchItems "onblur="criteria(this)" 
										id="section" value="${sku.section}"
										placeholder="<spring:message code="section.label" />" style="" />
										
										<span id="skuSectionError"
										style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
								</div>
									<div class="form-group col-lg-2">
									<label><spring:message code="tax.exclusive.label" /></label>
									<div class="col-lg-10" style="padding-left: 0px">
										<select class="form-control" name="itemTaxExclusive" id="itemTaxExclusive">
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
								<select class="form-control" name="packagedItem"
											id="istaxon">
											<option value="true" ${sku.taxonDiscountedPrice == true ? 'selected' : ''}><spring:message
													code="yes.label" /></option>
											<option value="false" ${sku.taxonDiscountedPrice == false? 'selected' : ''}><spring:message
													code="no.label" /></option>

										</select>
									
								</div> 
								
					
								</div>
								
							</div>

							<div class="row" >
										<div class="form-group col-lg-2" style="padding-left:24px">
									<label><spring:message code="hsnCode.label" /><span
										style="color: red; font-size: 2">*</span></label> 
										<input type="text" class="form-control allField" value="${sku.hsnCode}" name="hsnCode"
										id="hsnCode" value=""onblur="criteria(this)"
										placeholder="<spring:message code="hsnCode.label" />" />
									<span id="hsnCodeError" style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
										
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
										type="text" onblur="criteria(this)"  class="form-control allField" name="alternate_sku"
										id="alternate_sku" value="${sku.alternateSkuId}"
										placeholder="<spring:message code="alternate.sku.description.label" />" />
										<span id="alternate_skuerr" style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
								</div>

								<div class="form-group col-lg-2">
									<label><spring:message code="season.code.label" /></label> <input
										type="text" onblur="criteria(this)" class="form-control allField" name="season_code"
										id="season_code" value="${sku.seasonCode}"
										placeholder="<spring:message code="season.code.description.label" />" />
									<span id="seasonCodeErr" style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
								</div>

								<div class="form-group col-lg-2">
									<label><spring:message code="alias.name.label" /></label> <input
										type="text" onblur="criteria(this)" class="form-control allField" name="alias_name"
										id="alias_name" value="${sku.aliasName}"
										placeholder="<spring:message code="alias.name.description.label" />" />
								  <span id="aliasNameErr" style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
								</div>

							<div class="form-group col-lg-2">
									<label><spring:message code="item.type.label" /></label> <input
										type="text" onblur="criteria(this)" class="form-control allField" name="item_type"
										id="item_type" value="${sku.itemType}" style="margin-left:-8px"
										placeholder="<spring:message code="item.type.description.label" />" />
								   <span id="skuItemTypeErr" style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
							</div>

								
							</div>



							<div class="row">
							
							<div class="form-group col-lg-2" style="padding-left:24px">
									
										<div class="row">
										<div class="col-lg-12">
											<label><spring:message code="item.design.label" /></label> <input
										type="text" onblur="criteria(this)" class="form-control allField" name="item_design"
										id="item_design" value="${sku.itemDesign}"
										placeholder="<spring:message code="item.design.description.label" />" />
                               <span id="skuItemDesignErr" style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
										</div>
									</div>
									<div class="row" style="padding-top: 20px;">
										<div class="col-lg-12">
											<label>Stock Status</label> 
											<select class="form-control allField req" style="width: 80%" id="stockStatus" >
												<option value="true" ${'true' == sku.stockStatus ? 'selected' : ''} >Active</option>
												<option value="false"${'false' == sku.stockStatus ? 'selected' : ''} >In-Active</option>
											</select>
										</div>
									</div>
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
									<input type="text" onblur="criteria(this)" id="productHandingDetail" 
										name="productHanding" style="resize: none;"
										class="form-control allField"  value="${sku.product_handing}"
										placeholder="<spring:message code="enter.product.handing.label" />">
									<span id="ProductHandingDetailErr" style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
								</div> 
							
							
							<div class="form-group col-lg-2"  style="">
                            
									<label><spring:message code="productUsage.label" />
										</label>
									<input type="text" id="productUsageDetail" 
										name="productUsageQuick" onblur="criteria(this)" style="resize: none;"
										class="form-control allField"  value="${sku.product_usage}"
										placeholder="<spring:message code="enter.product.handing.label" />">
									<span id="productUsageDetailErr" style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
								</div> 
							
								
								<div class="form-group col-lg-2"  style="">
                            
									<label><spring:message code="productInTake.label" />
										</label>
									<input type="text" id="productIntakeDetail"   onblur="criteria(this)" 
										class="form-control allField"  value="${sku.product_consumption_interaction}"
										placeholder="<spring:message code="enter.product.handing.label" />">
									<span id="productIntakeDetailErro" style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
								</div> 
								
								
								<div class="form-group col-lg-2"  style="">
                           		 <div class="form-group col-lg-6"  style="padding-left: 0px;padding-right: 5px;">
									<label><spring:message code="uom1.label" /></label>
									<input type="text" id="uom1Detail" onblur="criteria(this)"
										class="form-control allField"  value="${sku.uom1}"  style="margin-left:-8px"
										placeholder="<spring:message code="enteruom1.label"/>">
									<span id="uom1DetailErr" style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
								</div>	
								<div class="form-group col-lg-6"  style="padding-right: 10px;padding-left: 0;">	
								<label><spring:message code="uom2.label" /></label>
									<input type="text" id="uom2Detail" onblur="criteria(this)"
										class="form-control allField"  value="${sku.uom2}"
										placeholder="<spring:message code="enteruom2.label" />">
								<span id="uom2DetailErr" style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
								</div>
								
								</div> 	
							</div>
 <span id="pictureIconError" style="text-align: right; color: red; font-size: 2; font-weight: bold;margin-left: 52%;"></span> 

							<div class="row">
							
							<div class="form-group col-lg-2"  style="padding-left:24px">
									<label>Cost Price Editable_GRN</label>
									<select class="form-control" name="costPriceEditable" id="costPriceEditable">
											<option value="false" ${sku.costPriceEditable == false ? 'selected' : ''}><spring:message
													code="no.label" /></option>
											<option value="true" ${sku.costPriceEditable == true? 'selected' : ''}><spring:message
													code="yes.label" /></option>
										</select>
								</div> 

									<div class="form-group col-lg-2"  style=" padding-top: 20px;
									">
                            
									<label><spring:message code="batch.required.label" />
										</label>
									<select class="form-control" name="packagedItem"
											id="batchrequired">
											<option value="true" ${sku.batchRequired == true ? 'selected' : ''}><spring:message
													code="yes.label" /></option>
											<option value="false" ${sku.batchRequired == false? 'selected' : ''}><spring:message
													code="no.label" /></option>

										</select>
									
								</div> 
								
								
								
								
						<!-- 		added by: vasudev
								created on: 22-08-2019 -->
								<div class="form-group col-lg-2" style="    padding-top: 20px;
								"> 
								<label><spring:message code="SKU.description.label" /></label> 
 									<input type="file" class="btn bg-olive btn-inline" accept=".xml" title="To import, Choose the valid xml Sheet format" style="height: 30px;  width: 150px;     padding: 3px !important;" id="skuDescription" name="skuDescription" onchange="loadFileAsURL('skuDescription',this);" /> 
									<input type="hidden" id="skuDescription_refId" name="skuDescription" /> 
									<input type="hidden" id="skuDescription_name" />
									<span id="searchFilesError" style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span> 
								</div> 
								
								
<!--Added By Manideep
 Reason :To add the picture icon and their labels -->	
                           
 
							<div class="form-group col-lg-1" style="text-align: center;width: 12.3%;">
									<div class="icon-remove blue delete" id="pictureIcon_image">
										<c:if test="${sku.pictureIcon == ''}">
											<label class="myFile" id="pictureIcon_label"> <img
												src="${pageContext.request.contextPath}/images/Add_image.png"
												alt="" style="width: 100px;" /> <input type="file"
												id="pictureIcon" name="pictureIcon"
												onchange="loadImageFileAsURL('pictureIcon',this);" /> <input
												type="hidden" id="pictureIcon_refId" name="pictureIcon" /> <input
												type="hidden" id="pictureIcon_name" />
											</label>
										</c:if>
										<c:if test="${sku.pictureIcon != ''}">
											<label class="myFile" id="pictureIcon_label"
												style="display: none"> <img
												src="${pageContext.request.contextPath}/images/Add_image.png"
												alt="" style="width: 100px;" /> <input type="file"
												id="pictureIcon" name="pictureIcon"
												onchange="loadImageFileAsURL('pictureIcon',this);" /> <input
												type="hidden" id="pictureIcon_refId" name="pictureIcon" /> <input
												type="hidden" id="pictureIcon_name" />
											</label>
											<img class="thumbnail" id="pictureIcon_thumbnail"
												src="${sku.pictureIcon}" style="width: 100px; height: 100px;" />
											<img class="delImage" id="pictureIcon_delImage"
												src="${pageContext.request.contextPath}/images/deny.png"
												onclick="deletePic('pictureIcon');">
										</c:if>
									</div>
									<span id="pictureIconError" style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span> 
									<label><spring:message code="sku.picture.icon" /></label>
									
								</div>
							
							
								<div class="form-group col-lg-1" style="text-align: center;width: 12.3%;">
									<div class="icon-remove blue delete" id="picture1_image">
										<c:if test="${sku.picture1 == ''}">
											<label class="myFile" id="picture1_label"> <img
												src="${pageContext.request.contextPath}/images/Add_image.png"
												alt="" style="width: 100px;" /> <input type="file"
												id="picture1" name="picture1"
												onchange="loadImageFileAsURL('picture1',this);" /> <input
												type="hidden" id="picture1_refId" name="picture1" /> <input
												type="hidden" id="picture1_name" />
											</label>
										</c:if>
										<c:if test="${sku.picture1 != ''}">
											<label class="myFile" id="picture1_label"
												style="display: none"> <img
												src="${pageContext.request.contextPath}/images/Add_image.png"
												alt="" style="width: 100px;" /> <input type="file"
												id="picture1" name="picture1"
												onchange="loadImageFileAsURL('picture1',this);" /> <input
												type="hidden" id="picture1_refId" name="picture1" /> <input
												type="hidden" id="picture1_name" />
											</label>
											<img class="thumbnail" id="picture1_thumbnail"
												src="${sku.picture1}" style="width: 100px; height: 100px;" />
											<img class="delImage" id="picture1_delImage"
												src="${pageContext.request.contextPath}/images/deny.png"
												onclick="deletePic('picture1');">
										</c:if>
									</div>
									<label><spring:message code="sku.picture1" /></label>
								</div>
								<div class="form-group col-lg-1" style="text-align: center;width: 12.3%;">
									<div class="icon-remove blue delete" id="picture2_image">
										<c:if test="${sku.picture2 == ''}">
											<label class="myFile" id="picture2_label"> <img
												src="${pageContext.request.contextPath}/images/Add_image.png"
												alt="" style="width: 100px;" /> <input type="file"
												id="picture2" name="picture2"
												onchange="loadImageFileAsURL('picture2',this);" /> <input
												type="hidden" id="picture2_refId" name="picture2" /> <input
												type="hidden" id="picture2_name" />
											</label>
										</c:if>
										<c:if test="${sku.picture2 != ''}">
											<label class="myFile" id="picture2_label"
												style="display: none;"> <img
												src="${pageContext.request.contextPath}/images/Add_image.png"
												alt="" style="width: 100px;" /> <input type="file"
												id="picture2" name="picture2"
												onchange="loadImageFileAsURL('picture2',this);" /> <input
												type="hidden" id="picture2_refId" name="picture2" /> <input
												type="hidden" id="picture2_name" />
											</label>
											<img class="thumbnail" id="picture2_thumbnail"
												src="${sku.picture2}" style="width: 100px; height: 100px;" />
											<img class="delImage" id="picture2_delImage"
												src="${pageContext.request.contextPath}/images/deny.png"
												onclick="deletePic('picture2');">
										</c:if>
									</div>
									<label><spring:message code="sku.picture2" /></label>
								</div>
								<div class="form-group col-lg-1" style="text-align: center;width: 12.3%;">
									<div class="icon-remove blue delete" id="picture3_image"
										style="text-align: center;">
										<c:if test="${sku.picture3 == ''}">
											<label class="myFile" id="picture3_label"> <img
												src="${pageContext.request.contextPath}/images/Add_image.png"
												alt="" style="width: 100px;" /> <input type="file"
												id="picture3" name="picture3"
												onchange="loadImageFileAsURL('picture3',this);" /> <input
												type="hidden" id="picture3_refId" name="picture3" /> <input
												type="hidden" id="picture3_name" />
											</label>
										</c:if>
										<c:if test="${sku.picture3 != ''}">
											<label class="myFile" id="picture3_label"
												style="display: none;"> <img
												src="${pageContext.request.contextPath}/images/Add_image.png"
												alt="" style="width: 100px;" /> <input type="file"
												id="picture3" name="picture3"
												onchange="loadImageFileAsURL('picture3',this);" /> <input
												type="hidden" id="picture3_refId" name="picture3" /> <input
												type="hidden" id="picture3_name" />
											</label>
											<img class="thumbnail" id="picture3_thumbnail"
												src="${sku.picture3}" style="width: 100px; height: 100px;" />
											<img class="delImage" id="picture3_delImage"
												src="${pageContext.request.contextPath}/images/deny.png"
												onclick="deletePic('picture3');">
										</c:if>
									</div>
									<label><spring:message code="sku.picture3" /></label>
								</div>
								
								</div>
								<div class="row">
								<div class="form-group col-lg-2"  style="padding-left:24px">
									<div class="checkbox"
										style="padding-left: 20px; margin-top: 0px;">
										<c:if test="${sku.nonTaxable == true}">
											<input type="checkbox" id="nonTaxable" checked> Non Taxable
		                                    	</c:if>
										<c:if test="${sku.nonTaxable == false}">
											<input type="checkbox" id="nonTaxable"> Non Taxable
		                                    	</c:if>
									</div>
									<div class="checkbox"
										style="padding-left: 20px; margin-top: 20px;">
										<c:if test="${sku.discountable == true}">
											<input type="checkbox" id="discountable" checked> Discountable
		                                    	</c:if>
										<c:if test="${sku.discountable == false}">
											<input type="checkbox" id="discountable"> Discountable
		                                    	</c:if>
									</div>
									<div class="checkbox"
										style="padding-left: 20px; margin-top: 20px;">
										<c:if test="${sku.allowDecimals == true}">
											<input type="checkbox" id="allowDecimals" checked> Allow Decimals
		                                    	</c:if>
										<c:if test="${sku.allowDecimals == false}">
											<input type="checkbox" id="allowDecimals"> Allow Decimals
		                                    	</c:if>
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
									</select> <input type="hidden" id="selectedStoreLocation"
										value="${sku.selectedLocationsList}"> <span
										id="locationError"
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
								<div class="form-group col-lg-6" style="padding:23px;margin-top:-26px">
								
							
									<label><spring:message code="product.precautions.label" />
										</label>
									<textarea rows="2" onblur="criteria(this)" id="productPrecautions" 
										name="productPrecautions" style=""
										class="form-control allField"
										placeholder="<spring:message code="enter.product.precautions.label" />">${sku.product_precautions}</textarea>
									<span id="productPrecautionsDetailError"
										style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
								</div>
								
						
								
								
								<div class="form-group col-lg-6" style="padding:23px;margin-top:-26px">
								
									<label><spring:message code="product.sideEffects.label" />
										</label>
									<textarea rows="2" onblur="criteria(this)" id="productSideEffects" 
										name="productSideEffects" style=""
										class="form-control allField"
										placeholder="<spring:message code="enter.product.sideEffects.label" />">${sku.product_precautions}</textarea>
									<span id="productSideEffectsDetailError"
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
										placeholder="<spring:message code="enter.short.description.label" />">${sku.description}</textarea>
									<span id="shortDescriptionError"
										style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
								</div>
							</div> --%>
							<div class="row">
								<div class="form-group col-lg-12" style="padding:26px;margin-top:-60px">
									<label><spring:message code="warranty.details.label" /></label>
									<textarea rows="2" onblur="criteria(this)" class="form-control allField"
										name="warrantyDetails" style="resize: none;"
										id="warrantyDetails" required
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
							<div class="priceList" style="padding:8px">
								<div class="row">
									<div class="col-lg-2  form-group" style="width:12.2%; padding: 0px 0px 0px 13px;">
										<%-- <div class="col-lg-2" style="background: #eee;width:110%;white-space:nowrap; border-top: 2px solid #ccc; padding-left: 0px;  padding-right: 0px;border-bottom: 2px solid #ccc; ">
										<label  class="white-space:nowrap;" ><spring:message code="specific.location.label" />
											</label></div> --%>
										<div class="col-lg-12" style="padding-left:0px">
										<div class="row" style="">
										<div class="col-lg-9" style="padding-top: 0px;    margin-left: -15px;;  padding-left: 0px;
                                     			padding-bottom: 14px; padding-right: 0px;white-space:nowrap;">
										<input type="radio" style="visibility: hidden;"
												name="priceListType" value="all" > <input
												type="radio" style="visibility: hidden;"
												name="priceListType" value="specific" checked="checked"> 
											<label> Location wise</label>
											&nbsp;&nbsp;&nbsp;<input type="checkbox" 
												 style="vertical-align: -3px;" checked="checked"
												id="specific" onchange="changePriceListType(this);">
											<br>
												</div>
											<div class="col-lg-12 " style=" padding-right: 0px;"> 
											<select style="margin-top: -2px;"
												class="form-control" id="selectedLocation"
												onchange="getPriceListForSelectedLocation(this);">
												<option value="AllLocation">ALL</option>
												<c:forEach var="selectedLocation"
													items="${sku.selectedLocationsList}">
													<option value="${selectedLocation}">${selectedLocation}</option>
												</c:forEach>
											</select> </div>
										</div>
									
										</div>
										</div>
									
									
										<div class="form-group col-lg-2" style="width:12.2%; padding: 0px 0px 0px 25px;margin-left:13px">
									<div class="col-lg-2" style="background: #eee;;width:100%;white-space:nowrap; border-top: 2px solid #ccc; padding-left: 0px;  padding-right: 0px;border-bottom: 2px solid #ccc; ">
										<label  class="" ><spring:message code="product.range.label" />
											</label></div><br>
										<div class="col-lg-12" style="padding-left:0px;margin-top: 10px;">
										<div class="row" style="">
										
										<div class="col-lg-12" style="   padding-right: 0px;">
											 <input type="text" class="form-control" value=""
												id="productRangeDropDown" />
												</div> <%--  <img
												style="cursor: pointer; width: 29px;    padding-right: 0px;"
												onclick="appendProductRange();"
												src="${pageContext.request.contextPath}/images/RedPlus.png">
											<br>
											<div class="col-lg-12 " style="   padding-top:3px; padding-right: 0px;"> <select style="" class="form-control"
												id="productRangeDropDown">
												<c:forEach var="productRange"
													items="${sku.productRangeList}">
													<option value="${productRange}">${productRange}</option>
												</c:forEach>
												</select></div>  --%>
										</div>
									</div>
									</div>
									
									
								<div class="form-group col-lg-2" style="width:12.2%; padding: 0px 0px 0px 25px">
									<div class="col-lg-2" style="background: #eee;;width:100%;white-space:nowrap; border-top: 2px solid #ccc; padding-left: 0px;  padding-right: 0px;border-bottom: 2px solid #ccc; ">
											<label><spring:message code="measure.range.label" />
											</label></div><br>
										<div class="col-lg-12" style="padding-left:0px;margin-top: 10px;">
										<div class="row" style="">
										
										<div class="col-lg-12" style="    padding-right: 0px;">
											 <input type="text" onblur="criteria(this)" class="form-control" value=""
												id="measurementRangeDropDown" />
												</div> <%-- <img
												style="cursor: pointer; width: 29px;    padding-right: 0px;"
												onclick="appendMeasurementRange();"
												src="${pageContext.request.contextPath}/images/RedPlus.png">
											<br>
											<div class="col-lg-12" style="  padding-top:3px;   padding-right: 0px;"><select style="" class="form-control"
												id="measurementRangeDropDown">
												<c:forEach var="measurementRange"
													items="${sku.measurementRangeList}">
													<option value="${measurementRange}">${measurementRange}</option>
												</c:forEach>
											</select></div>  --%>
										</div>
									</div>
									
									
									</div>
								
									 <div class="form-group col-lg-2" style="width:12.2%; padding: 0px 0px 0px 25px">
									<div class="col-lg-2" style="background: #eee;width:100%;white-space:nowrap; border-top: 2px solid #ccc; padding-left: 0px;  padding-right: 0px;border-bottom: 2px solid #ccc; ">
										<label  class="" ><spring:message code="utility.label" />
											</label></div><br>
										<div class="col-lg-12" style="padding-left:0px;margin-top: 10px;">
										<div class="row" style="">
										
										<div class="col-lg-12" style="    padding-right: 0px;">
											 <input type="text"onblur="criteria(this)" class="form-control" value=""
												id="utilityRangeDropDown" />
												</div> <%-- <img
												style="cursor: pointer; width: 29px;    padding-right: 0px;"
												onclick="appendUtility();"
												src="${pageContext.request.contextPath}/images/RedPlus.png"> 
											<br>
											<div class="col-lg-12" style="  padding-top:3px;   padding-right: 0px;"> <select style="" class="form-control"
												id="utilityRangeDropDown">
												
												<c:forEach var="utilityRange"
													items="${sku.utilityRangeList}">
													<option value="${utilityRange}">${utilityRange}</option>
												</c:forEach>
												
												</select></div> --%>
										</div>
									</div>
									</div>
									
									
									
									
									 <div class="col-lg-2" style="width:12.2%; padding: 0px 0px 0px 25px">
									<div class="col-lg-2" style="background: #eee;width:100%;white-space:nowrap; border-top: 2px solid #ccc; padding-left: 0px;  padding-right: 0px;border-bottom: 2px solid #ccc; ">
										<label  class="" ><spring:message code="colour.label" />
											</label></div><br>
										<div class="col-lg-12" style="padding-left:0px;margin-top: 10px;">
										<div class="row" style="">
										
										<div class="col-lg-12" style="    padding-right: 0px;">
											 <input type="text" onblur="criteria(this)" class="form-control" value=""
												id="colourRangeDropDown" />
												</div> 
												
												<%-- <img
												style="cursor: pointer; width: 29px;    padding-right: 0px;"
												onclick="appendColours();"
												src="${pageContext.request.contextPath}/images/RedPlus.png">
											<br>
											<div class="col-lg-12" style="   padding-top:3px;  padding-right: 0px;"> <select style="" class="form-control"
												id="colourRangeDropDown">
												
												<c:forEach var="colourRange"
													items="${sku.colourRangeList}">
													<option value="${colourRange}">${colourRange}</option>
												</c:forEach>
												
												</select></div>  --%>
										</div>
									</div>
									</div>
									
									
									
												
								 <div class="col-lg-2" style="width:12.2%; padding: 0px 0px 0px 25px">
									<div class="col-lg-2" style="background: #eee;width:100%;white-space:nowrap; border-top: 2px solid #ccc; padding-left: 0px;  padding-right: 0px;border-bottom: 2px solid #ccc; ">
										<label  class="" ><spring:message code="size.label" />
											</label></div><br>
										<div class="col-lg-12" style="padding-left:0px;margin-top: 10px;">
										<div class="row" style="">
										
										<div class="col-lg-12" style="    padding-right: 0px;">
											 <input type="text" onblur="criteria(this)"  class="form-control" value=""
												id="sizeRangeDropDown" />
												</div> <%-- <img
												style="cursor: pointer; width: 29px;    padding-right: 0px;"
												onclick="appendSize();"
												src="${pageContext.request.contextPath}/images/RedPlus.png">
											<br>
											<div class="col-lg-12" style=" padding-top:3px;padding-right: 0px;"> <select style="" class="form-control"
												id="sizeRangeDropDown">
												<c:forEach var="sizeRange"
													items="${sku.sizeRangeList}">
													<option value="${sizeRange}">${sizeRange}</option>
												</c:forEach>
												</select></div>  --%>
										</div>
									</div>
									</div>
									
									
									
									     
                             <div class="col-lg-2" style="width:12.2%; padding: 0px 0px 0px 25px">
                           			<div class="col-lg-2" style="background: #eee;width:100%;white-space:nowrap; border-top: 2px solid #ccc; padding-left: 0px;  padding-right: 0px;border-bottom: 2px solid #ccc;">
										<label  class="" ><spring:message code="batch.label" />
											</label></div><br>
										<div class="col-lg-12" style="padding-left:0px;margin-top: 10px;">
										<div class="row" style="">
										
										<div class="col-lg-12" style="  padding-right: 0px;">
											 <input type="text" onblur="criteria(this)" class="form-control" value=""
												id="batchRangeDropDown" />
												</div>
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
											 <input type="text" onblur="criteria(this)"class="form-control" value=""
												id="styleRangeDropDown" />
												</div> 
										</div>
									</div>
									</div>
									
									
								</div>

								 <div class="row">
									<div class="col-lg-12" style="padding-right: 0px;">
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
								
								
								<br>
								
								
					
								<div class="row" style="">
									<div class="col-md-12 priceListForLocation">
										<div class="AllLocation priceListLocationDiv"></div>
										<c:forEach var="selectedLocationId"
											items="${sku.selectedLocationsIdList}"
											varStatus="locationCount">
											<div class="${selectedLocationId} priceListLocationDiv">
												<c:set var="priceListCount" value="1"></c:set>
												<c:forEach var="plu" items="${sku.skuPriceLists}"
													varStatus="theCount">
													<c:if test="${plu.storeLocationId == selectedLocationId}">
									<div class="col-md-12 pricelist" id="pricelist${selectedLocationId}${priceListCount}" style="padding:0px;">
										<div class="col-md-10" style="padding:0px;">				
															
															<div class="row-fluid-5">
																<div class="form-group col-lg-2" style="padding-left: 0px;">
																	<input type="hidden"
																		id="productRange${selectedLocationId}${priceListCount}"
																		value="${plu.productRange}"> <input
																		type="hidden"
																		id="measurementRange${selectedLocationId}${priceListCount}"
																		value="${plu.measureRange}">
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
																		<input type="hidden"
																		id="styleRange${selectedLocationId}${priceListCount}"
																		value="${plu.styleRange}">
																		<input type="hidden"
																		id="blockedQty${selectedLocationId}${priceListCount}"
																		value="${plu.blockedQuantity}">
																			<input type="hidden"
																		id="scrapedQty${selectedLocationId}${priceListCount}"
																		value="${plu.scrapedQuantity}">
																		
																		 <label><spring:message
																			code="cost.price.label" /> <span
																		style="color: red; font-size: 2">*</span></label> <input
																		type="hidden" class="form-control allField req"
																		id="pluStoreLocation${selectedLocationId}${priceListCount}"
																		value="${plu.storeLocation}" /> <input type="text"
																		class="form-control allField req pluCost"
																		onkeydown="clearError(this);"
																		onblur="calcMarkUp(this);"
																		id="pluCostPrice${selectedLocationId}${priceListCount}"
																		value="${plu.costPrice}"
																		oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');"
																		placeholder="<spring:message code="enter.cost.price.label" />" style="width:60%"/>
																	<span
																		id="pluCostPrice${selectedLocationId}${priceListCount}Error"
																		style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
																</div>
																<div class="form-group col-lg-2 " style="margin-left: 14px;">
																	<label><spring:message code="mrpprice.label" /> <span
																		style="color: red; font-size: 2">*</span></label> <input
																		type="text" class="form-control allField req"
																		onkeydown="clearError(this);"
																		id="pluPrice${selectedLocationId}${priceListCount}"
																		value="${plu.price}"
																		oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');"
																		placeholder="<spring:message code="enter.price.label" />" style="width:60%"/>
																	<span
																		id="pluPrice${selectedLocationId}${priceListCount}Error"
																		style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
																</div>
																	<div class="form-group col-lg-2 " style="margin-left: 1px;">
																	<label><spring:message code="sale.price.label" />
																		<span style="color: red; font-size: 2">*</span></label> <input
																		type="text" class="form-control allField req pluSale"
																		onkeydown="clearError(this);"
																		onblur="calcMarkUp(this);"
																		id="pluSalePrice${selectedLocationId}${priceListCount}"
																		value="${plu.salePrice}"
																		oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');"
																		placeholder="<spring:message code="enter.sale.price.label" />" style="width:60%"/>
																	<span
																		id="pluSalePrice${selectedLocationId}${priceListCount}Error"
																		style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
																</div>

																<div class="form-group col-lg-2" style="white-space:nowrap;margin-left: 24px;">
																	<label><spring:message code="ws.price.label" />
																		<span style="color: red; font-size: 2">*</span></label> <input
																		type="text" class="form-control allField req "
																		onkeydown="clearError(this);"
																		id="pluWsPrice${selectedLocationId}${priceListCount}"
																		value="${plu.wholesalePrice}"
																		oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');"
																		placeholder="<spring:message code="enter.ws.price.label" />" style="width:60%"/>
																	<span
																		id="pluWsPrice${selectedLocationId}${priceListCount}Error"
																		style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
																</div>
																
										<%-- <input type="hidden" id="ean${selectedLocationId}${priceListCount}" value="${plu.ean}"> --%>
										<input type="hidden" id="eanduplicate${selectedLocationId}${priceListCount}">
									<div class="form-group col-lg-2" style="padding-right:0px">
                            
									<label><spring:message code="businessCategory.label" />
										</label>
										
									<input type="text" onblur="criteria(this)" id="businessCategoryDetail${selectedLocationId}${priceListCount}" 
										name="productPrecautions" style="resize: none;width:80%"
										class="form-control allField" value="${plu.businessCategory}"
										placeholder="<spring:message code="enterbusinescategory.label" />" >
									<span id="businessCategoryQuickError"
										style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
								</div>
																
																
																<%-- <div class="form-group span2">
																	<label><spring:message code="extra.price.label" /></label>
																	<input type="text" class="form-control allField"
																		onkeydown="clearError(this);"
																		id="pluExtraPrice${selectedLocationId}${priceListCount}"
																		value="${plu.extraPrice}"
																		oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');"
																		placeholder="<spring:message code="enter.extra.price.label" />" />
																	<span
																		id="pluExtraPrice${selectedLocationId}${priceListCount}Error"
																		style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
																</div> --%>
															</div>

															<div class="row-fluid-5">
																<%-- <div class="form-group span2">
																	<label><spring:message code="color.label" /></label> <input
																		type="text" class="form-control allField"
																		onkeydown="clearError(this);"
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
																		onkeydown="clearError(this);"
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
																		onkeydown="clearError(this);"
																		id="pluMbq${selectedLocationId}${priceListCount}"
																		value="${plu.mbq}"
																		placeholder="<spring:message code="enter.mbq.label" />" style="width:60%"/>
																	<span
																		id="pluMbq${selectedLocationId}${priceListCount}Error"
																		style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
																</div>

																<div class="form-group col-lg-2" style="white-space:nowrap;margin-left: 1px;">
																	<label><spring:message
																			code="quantity.in.hand.label" /> <span
																		style="color: red; font-size: 2">*</span></label> <input
																		type="text" onblur="criteria(this)" class="form-control allField req"
																		onkeydown="clearError(this);"
																		id="pluQuantity${selectedLocationId}${priceListCount}"
																		value="${plu.quantityInHand}"
																		oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');"
																		placeholder="<spring:message code="enter.quantity.in.hand.label" />" style="width:80%"/>
																	<span
																		id="pluQuantity${selectedLocationId}${priceListCount}Error"
																		style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
																</div>
																<div class="form-group col-lg-2" style="margin-left: 24px;">
																	<label><spring:message code="acp.label" /></label> <input
																		type="text" onblur="criteria(this)" class="form-control allField"
																		onkeydown="clearError(this);"
																		id="pluAcp${selectedLocationId}${priceListCount}"
																		value="${plu.acp}"
																		placeholder="<spring:message code="enter.acp.label" />" style="width:80%"/>
																			 <input type="hidden" class="form-control allField"
																		id="pluCode${selectedLocationId}${priceListCount}"
																		value="${plu.pluCode}" /> 
																		<%--  <input type="hidden" class="form-control allField"
																		id="skuStatus${selectedLocationId}${priceListCount}"
																		value="${plu.skuStatus}" />  --%>
																	<span
																		id="pluAcp${selectedLocationId}${priceListCount}Error"
																		style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
																</div>
																
																
																
																<div class="form-group col-lg-2 " style="padding-right: 0px;"> 
									<label><spring:message code="businessSubcategory.label" />
										</label>
									<input type="text" onblur="criteria(this)" id="businessSubcategoryDetail${selectedLocationId}${priceListCount}" 
										style="resize: none;width:80%" 
										class="form-control allField"  value="${plu.businessSubCategory}"
										placeholder="<spring:message code="enter.businessSubcategory.label" />">
									
								</div>		
									</div>
															<div class="row-fluid-5">
																<div class="form-group col-lg-2 " style="margin-left: 1px;padding-left:0px">
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
																			data-inputmask="alias: dd/mm/yyyy" data-mask  style="width:80%" />
																	</div>
																	<span
																		id="pluCreatedDate${selectedLocationId}${priceListCount}Error"
																		style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
																</div>
															
															
															
																
																<div class="form-group col-lg-2 span2" style="margin-left: 26px;padding-right:0px">
																	<label><spring:message code="expiry.date.label" /></label>
																	<div class="input-group">
																		<div class="input-group-addon">
																			<i class="fa fa-calendar"></i>
																		</div>
																		<input class="form-control allField req dat"
																			onchange="test()" readonly="readonly"
																			style="background-color: white;width:80%"
																			id="pluExpiryDate${selectedLocationId}${priceListCount}"
																			value="${plu.expiry_date}" size="20" type="text"
																			onfocus="callCalender('pluExpiryDate${selectedLocationId}${priceListCount}')"
																			onclick="callCalender('pluExpiryDate${selectedLocationId}${priceListCount}')"
																			placeholder="DD/MM/YYYY"  />
																	</div>
																	<span
																		id="pluExpiryDate${selectedLocationId}${priceListCount}Error"
																		style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
																</div>
																																	
																
																<div class="form-group col-lg-2 span2" style="margin-left:15px">
                                           	<label><spring:message code="min.sales.quantity.label" /><span style="color: red; font-size: 2">*</span></label></label> <input
													type="text" class="form-control allField"
													id="priceMinSaleQty${selectedLocationId}${priceListCount}" value="${plu.min_sale_qty}"
													placeholder="<spring:message code="min.sales.quantity.label" />" style="width:70%"/>
                                        <span id="priceminSaleQtyError"
											style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
                                         </div>
                                         
																
																<div class="form-group col-lg-2 " style="white-space:nowrap;margin-left:20px">
																	<label><spring:message
																			code="newarrival.product.status" /> </label>
																			<select class="form-control allField req" name="status" id="skuStatus${selectedLocationId}${priceListCount}" style="width:80%">
										                                      	<option value="true" ${'true' == plu.skuStatus ? 'selected' : ''} >Active</option>
		                                  		                                <option value="false" ${'false' == plu.skuStatus ? 'selected' : ''} >In-Active</option>
											
										                                    </select> 
																</div>
																
																 <div class="form-group col-lg-2" style="">
                                           	<label>Material Type</label> <input
													type="text"   class="form-control allField"
													id="materailType${selectedLocationId}${priceListCount}" value="${plu.materialType}"
													placeholder="Material Type" style="width:70%" />
													
													<span id="materailTypeAllLocation1Error"
															style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
                                         </div>
																
																
																
																
																<%-- <div class="form-group span2">
																	<label><spring:message code="size.label" /></label> <input
																		type="text" class="form-control allField"
																		onkeydown="clearError(this);"
																		id="pluSize${selectedLocationId}${priceListCount}"
																		value="${plu.size}"
																		placeholder="<spring:message code="enter.size.label" />" />
																	<span
																		id="pluSize${selectedLocationId}${priceListCount}Error"
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
																			class="form-control dat"
																			data-inputmask="alias: dd/mm/yyyy" data-mask style="width:80%"/>
																	</div>
																	<span
																		id="pluUpdatedDate${selectedLocationId}${priceListCount}Error"
																		style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
																</div>
															
																	<div class="form-group col-lg-2 span2" style="margin-left: 20px;padding-right:0px">
																	<label><spring:message code="packaged.date.label" /></label>
																	<div class="input-group">
																		<div class="input-group-addon">
																			<i class="fa fa-calendar"></i>
																		</div>
																		<input class="form-control allField req dat"
																			onchange="test()" readonly="readonly"
																			style="background-color: white;width:80%"
																			id="pluPackagedDate${selectedLocationId}${priceListCount}"
																			value="${plu.packagingDate}" size="20" type="text"
																			onfocus="callCalender('pluPackagedDate${selectedLocationId}${priceListCount}')"
																			onclick="callCalender('pluPackagedDate${selectedLocationId}${priceListCount}')"
																			placeholder="DD/MM/YYYY" />
																	</div>
																	<span
																		id="pluPackagedDate${selectedLocationId}${priceListCount}Error"
																		style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
																</div>		
							
							
							<div class="form-group col-lg-2 span2" style="" >
                                           	<label><spring:message code="pack.size.label" /></label> <input
													type="text" onblur="criteria(this)" class="form-control allField"
													id="pricePackSize${selectedLocationId}${priceListCount}" value="${plu.pack_size}"
													placeholder="<spring:message code="enter.pack.size.label" />" style="width:60%"/>
                                        </div>
                                        
                                
                                        
                                            
								
												<div class="form-group col-lg-2 " style="padding-right: 0px;margin-left:20px"> 
									<label><spring:message code="stock.factory.label" />
										</label>
									<input type="text" onblur="criteria(this)" id="stockfactor" 
										style="resize: none;width:60%" 
										class="form-control allField"  value="${plu.stockFactor}"
										placeholder="enter stock factor"style="width:60%">
									
								</div>		
								
								<div class="form-group col-lg-2">
									<label>Zero Stock Billing</label>
									<div class="col-lg-10" style="padding-left: 0px">
										<select class="form-control" name="zeroStockbilling${selectedLocationId}${priceListCount}" id="zeroStockbilling${selectedLocationId}${priceListCount}">
											<option value="true" ${plu.zeroStockBilling == true ? 'selected' : ''}><spring:message
													code="yes.label" /></option>
							 				<option value="false" ${plu.zeroStockBilling == false ? 'selected' : ''}><spring:message
													code="no.label" /></option>
										</select>
									</div>
								</div>
												
												</div>
												
												
												<div class="row-fluid-5">
										
							<div class="form-group col-lg-2 " style="padding: 0px;">
										<label>EAN</label>
									<div class="col-lg-12" style="padding: 0px;">
									<input type="text" onblur="criteria(this)" id="ean${selectedLocationId}${priceListCount}"  style="" class="form-control"  value="${plu.ean}" placeholder="Enter EAN number">
									<!-- <span id="eanError" style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span> -->
									</div>
							</div>				
									
								<div class="form-group col-lg-2 " style="margin-left: 20px;padding-right:0px">
														<label>Stock Status</label>
										<select class="form-control allField req"  style="width:80%" id="skuStockStatus${selectedLocationId}${priceListCount}">
									         <option value="true" ${'true' == plu.stockStatus ? 'selected' : ''}>Active</option> <%--  --%>
		                                  	 <option value="false" ${'false' == plu.stockStatus ? 'selected' : ''} >In-Active</option><%-- --%>
											
										</select>	
								</div>													
					
								<div class="form-group col-lg-2">
                                           	
                                 </div>
                                        
                                <div class="form-group col-lg-2 "> 
									
								</div>
                                        
                               <div class="form-group col-lg-2">
									
								</div>						
							</div>
															
															
																<div class="row-fluid-5">
													<%-- <div class="form-group span2">
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
															onkeydown="clearError(this);"
															value="${plu.cashDiscount}" id="pluCashdiscount${selectedLocationId}${priceListCount}"
															oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');"
															placeholder="<spring:message code="discount.label" />" />
														
													</div>
													
													
													
												<div class="form-group span2">
														<label><spring:message
																code="productBatchno.label" /> </label> <input
															type="text" class="form-control allField req"  
															onkeydown="clearError(this);"
															value="${plu.productBatchNo}" id="pluProductBatch${selectedLocationId}${priceListCount}"
															oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');"
															placeholder="<spring:message code="productBatchno.label" />" />
														
													</div>
												
												
													<div class="form-group span2">
														<label><spring:message
																code="productserialno.label" /> </label> <input
															type="text" class="form-control allField req" 
															onkeydown="clearError(this);"
															value="${plu.productSerNo}" id="pludProductSerialNo${selectedLocationId}${priceListCount}"
															oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');"
															placeholder="<spring:message code="productserialno.label" />" />
														
													</div> --%>
												
												
										
												
												
											<%-- 	<div class="row-fluid-5">
												
												
												<div class="form-group span2">
																	<label><spring:message code="bestBeforeDate.label" /></label>
																	<div class="input-group">
																		<div class="input-group-addon">
																			<i class="fa fa-calendar"></i>
																		</div>
																		<input class="form-control allField req dat"
																			onchange="test()" 
																			style="background-color: white;" 
																			id=""
																			value="" size="20" type="text"
																			onfocus=""
																			onclick=""
																			placeholder="DD/MM/YYYY" />
																	</div>
																	<span
																		id=""
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
																		style="background-color: white;" 
																		onchange="test()"	id=""
																			value="${plu.effectiveFromDateStr}"
																			onfocus=""
																			onclick=""
																			placeholder="DD/MM/YYYY" data-mask />
																	</div>
																	<span
																		id=""
																		style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
																</div>
												
												
												
												<div class="form-group span2">
																	<label><spring:message code="manufacturedDate.label" /></label>
																	<div class="input-group">
																		<div class="input-group-addon">
																			<i class="fa fa-calendar"></i>
																		</div>
																		<input class="form-control allField req dat"
																			onchange="test()" 
																			style="background-color: white;" 
																			id=""
																			value="${plu.expiry_date}" size="20" type="text"
																			onfocus=""
																			onclick=""
																			placeholder="DD/MM/YYYY" />
																	</div>
																	<span
																		id=""
																		style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
																</div>
												
												
												<div class="form-group span2">
																	<label><spring:message code="warrantyperiad.label" /></label>
																	<input type="text" class="form-control allField"
																		onkeydown="clearError(this);" 
																		id="pluWarrantyPeriod${selectedLocationId}${priceListCount}"
																	    value="${plu.warrantyPeriod}"
																		placeholder="<spring:message code="enterwarrantyperiad.label" />" />
																	
																	<div class="input-group">
																		<div class="input-group-addon">
																			<i class="fa fa-calendar"></i>
																		</div>
																		<input class="form-control allField req dat"
																			readonly="readonly" style="background-color: white;"
																			id=""
																			 size="20" type="text" value=""
																			onfocus=""
																			onclick=""
																			placeholder="DD/MM/YYYY" />
																	</div>
																	
																	<span
																		id="pluWarrantyPeriod${selectedLocationId}${priceListCount}Error"
																		style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
																</div>
												
												
												
												
												<div class="form-group span2">
									<label><spring:message code="reorder.point.label" /></label>
									
										<input type="text" class="form-control allField"
											 name="reorderPoint" id="plureorderPoint${selectedLocationId}${priceListCount}"
											 value="" required
											oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');"
											placeholder="<spring:message code="enter.reorder.point.label" />" />
										<span id="plureorderPoint${selectedLocationId}${priceListCount}Error"
					style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
									
								</div>
										</div> --%>
												
											<%-- 
											
											<div class="row-fluid-5">
												<div class="form-group span2" style="padding-left:0px">
																	<label><spring:message code="blockdeQty.label" />
																		</label> <input
																		type="text" class="form-control allField req "
																		onkeydown="clearError(this);"
																		id="pluBlockedQty${selectedLocationId}${priceListCount}"
																	    value="${plu.blockedQuantity}"
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
																		onkeydown="clearError(this);" 
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
																		onkeydown="clearError(this);"
																		id="pluPackageId${selectedLocationId}${priceListCount}"
																		value="${plu.packageId}"
																		placeholder="<spring:message code="enter.packageId.label" />" />
																	<span
																		id="pluPackageId${selectedLocationId}${priceListCount}Error"
																		style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
																</div>	
																
												
												
												<div class="form-group span2">
																	<label><spring:message code="utility.label" /></label>
																	<input type="text" class="form-control allField"
																		onkeydown="clearError(this);"
																		id="pluUtility${selectedLocationId}${priceListCount}" 
																		value=""
																		placeholder="<spring:message code="enter.utility.label" />" />
																	<span
																		id="pluUtility${selectedLocationId}${priceListCount}"
																		style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
																</div>
												
												
												
											</div>
												 --%>
												</div>
															<div class="row">
															
															<div class="form-group col-lg-5" style="padding-right:0px">
								
									<label><spring:message code="technicalSpecification.label" />
										</label>
									<textarea rows="2" onblur="criteria(this)" id="technicalSpecDetail${selectedLocationId}${priceListCount}"  style="resize:none"
										class="form-control allField"
										placeholder="<spring:message code="entertechnicalSpecification.label" />">${plu.technical_specification}</textarea>
									<span id="productSideEffectsError"
										style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
							
								</div>
							
															
															
																<div class="form-group col-lg-5" style="padding-right:0px">
																	<label><spring:message code="description.label" />
																		<span style="color: red; font-size: 2">*</span></label>
																	<textarea rows="2" onblur="criteria(this)" class="form-control allField"
																		onkeydown="clearError(this);"
																		id="pluDesc${selectedLocationId}${priceListCount}"
																		style="resize: none;" required
																		placeholder="<spring:message code="enter.description.label" />">${plu.description}</textarea>
																	<span
																		id="pluDesc${selectedLocationId}${priceListCount}Error"
																		style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
																</div>
															</div>
														
								</div>							
									<div class="col-md-2 table-responsive" style="border: 1px solid #ccc;padding: 0px; margin-left: -6.5%;width: 22%;">
									<c:if test="${priceListCount == 1}">
									<table id="SKUMasterEAN${selectedLocationId}${priceListCount}${priceListCount}" class="table table-bordered table-hover" style="margin-bottom:0px">
                                    <thead style="background-color: #ccc !important; color: #ffff">
                                 <tr>										
								<th>EAN</th>
								<th>Action</th>
								</tr>
								</thead>
								<tbody>
								 <c:forEach var="skuean" items="${multipleEanPriceList}" varStatus="theCount">
								
								<c:if test="${skuean.storeLocation == selectedLocationId}">
								<tr id="dynamicdiv${selectedLocationId}1${theCount.count}">
								
								<td id="tableean${selectedLocationId}${theCount.count}" style="width:57%"><input type="number" style="width:100%"  readonly="readonly" required="required" id="eantable${selectedLocationId}1${theCount.count}" value="${skuean.ean}"></td>
								<td style="width: 35%;white-space: nowrap;" id="action${selectedLocationId}1${theCount.count}">
								
								   <a   style="border-bottom: 1px solid blue;color: blue;cursor: pointer;" onclick="appendSKUEAN('${selectedLocationId}','1${theCount.count}');"><font size="2px">add</font></a>&nbsp&nbsp&nbsp&nbsp
								
							       <a  style="border-bottom: 1px solid blue;color: blue;cursor: pointer;" id="delete${selectedLocationId}1${theCount.count}" onclick="deleteSKUEAN('${selectedLocationId}','1${theCount.count}');"><font size="2px">delete</font></a>
								
								</td>
								<%-- <input type="hidden" id="ean${selectedLocationId}${priceListCount}"  value="${plu.ean}"> --%>
								<input type="hidden" id="eanduplicate${selectedLocationId}${priceListCount}">
								</tr>
								</c:if>
								</c:forEach>
								
								</tbody>
								</table>
								</c:if>
							
								
								</div> 
								</div>
									
								<c:set var="priceListCount" value="${priceListCount + 1}" />
														
													</c:if>
												</c:forEach>
											</div>
										</c:forEach>
									</div>
									
									</div>
								
									
									
									</div>
							<div class="pricelist" id="pricelistAllLocation0"
										style="display: none;padding: 0px; ">
							<div class="col-md-10" style="padding: 0px; ">
										<div class="row-fluid-5">
											<div class="form-group col-lg-2 " style="padding-left: 0px">
												<input type="hidden" id="productRangeAllLocation0">
												<input type="hidden" id="measurementRangeAllLocation0">
												<input type="hidden" id="utilityRangeAllLocation0">
												<input type="hidden" id="colourRangeAllLocation0">
												<input type="hidden" id="sizeRangeAllLocation0">
												<input type="hidden" id="batchRangeAllLocation0">
													<input type="hidden" id="styleRangeAllLocation0">
												<label><spring:message code="cost.price.label" /> <span
													style="color: red; font-size: 2">*</span></label> <input
													type="text" class="form-control allField req pluCost"
													onkeydown="clearError(this);" onblur="calcMarkUp(this);"
													value="" id="pluCostPriceAllLocation0" style="width:60%"
													oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');"
													placeholder="<spring:message code="enter.cost.price.label" />" />
												<span id="pluCostPriceAllLocation0Error"
													style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
											</div>
											<div class="form-group col-lg-2 " style="margin-left: 14px;">
												<label><spring:message code="price.label" /> <span
													style="color: red; font-size: 2">*</span></label> <input
													type="text" class="form-control allField req"
													onkeydown="clearError(this);" value=""
													id="pluPriceAllLocation0" style="width:60%"
													oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');"
													placeholder="<spring:message code="enter.price.label" />" />
												<span id="pluPriceAllLocation0Error"
													style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
											</div>
											<div class="form-group col-lg-2 " style="margin-left: 6px;">
												<label><spring:message code="sale.price.label" /> <span
													style="color: red; font-size: 2">*</span></label> <input
													type="text" class="form-control allField req pluSale"
													onkeydown="clearError(this);" onblur="calcMarkUp(this);"
													value="" id="pluSalePriceAllLocation0" style="width:60%"
													oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');"
													placeholder="<spring:message code="enter.sale.price.label" />" />
												<span id="pluSalePriceAllLocation0Error"
													style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
											</div>

											<div class="form-group col-lg-2" style="white-space:nowrap;margin-left:21px">
												<label><spring:message code="ws.price.label" /> <span
													style="color: red; font-size: 2">*</span></label> <input
													type="text" onblur="criteria(this)"class="form-control allField req" value=""
													onkeydown="clearError(this);" id="pluWsPriceAllLocation0" style="width:60%"
													oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');"
													placeholder="<spring:message code="enter.ws.price.label" />" />
												<span id="pluWsPriceAllLocation0Error"
													style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
											</div>
											
									<!-- 	<input type="hidden" id="eanAllLocation0"> -->
										<input type="hidden" id="eanduplicateAllLocation0">
										
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
											
											
											<%-- <div class="form-group col-lg-2" style="margin-left: 1px;">
												<label><spring:message code="ean.label" /></label> <input
													type="text" class="form-control allField"
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
													onkeydown="clearError(this);" id="pluMbqAllLocation0" style="width:60%"
													placeholder="<spring:message code="enter.mbq.label" />" />
												<span id="pluMbqAllLocation0Error"
													style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
											</div>

											<div class="form-group col-lg-2" style="white-space:nowrap;margin-left: 7px;">
												<label><spring:message code="quantity.in.hand.label" />
													<span style="color: red; font-size: 2">*</span></label> <input
													type="text" onblur="criteria(this)" class="form-control allField req"
													onblur="calculateStock();" onkeydown="clearError(this);"
													value="" id="pluQuantityAllLocation0" style="width:80%"
													oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');"
													placeholder="<spring:message code="enter.quantity.in.hand.label" />" />
												<span id="pluQuantityAllLocation0Error"
													style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
											</div>
										<div class="form-group col-lg-2" style="margin-left:21px;">
												<label><spring:message code="acp.label" /></label> <input
													type="text" onblur="criteria(this)" class="form-control allField"
													onkeydown="clearError(this);" id="pluAcpAllLocation0"
													placeholder="<spring:message code="enter.acp.label" />" style="width:80%"/>
												<span id="pluAcpAllLocation0Error"
													style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
											</div>
											
											
											<div class="form-group col-lg-2 " style="padding-right: 0px;margin-left:0px"> 
									<label><spring:message code="businessSubcategory.label" />
										</label>
									<input type="text"onblur="criteria(this)" id="businessSubcategoryDetailAllLocation0" 
										name="productHanding" style="resize: none;width:80%" id="businessSubcategoryQuick"
										class="form-control allField"  value="${plu.businessSubCategory}" 
										placeholder="<spring:message code="enter.businessSubcategory.label" />">
									<span id="productSideEffectsError"
										style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>

								</div>		
											
	
	<%-- <div class="form-group col-lg-2 " style="margin-left: 1px;padding-right:0px">
												<label><spring:message code="created.date.label" /></label>
												<div class="input-group">
													<div class="input-group-addon">
														<i class="fa fa-calendar"></i>
													</div>
													<input type="text" id="pluCreatedDateAllLocation0"
														readonly="readonly" class="form-control dat"
														data-inputmask="alias: dd/mm/yyyy" data-mask />
												</div>
												<span id="pluCreatedDateAllLocation0Error"
													style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
											</div> --%>
	
										</div>
										
										
										
										
										<div class="row-fluid-5">
											
											
											<div class="form-group col-lg-2 " style="margin-left: 1px;padding-left:0px">
												<label><spring:message code="created.date.label" /></label>
												<div class="input-group">
													<div class="input-group-addon">
														<i class="fa fa-calendar"></i>
													</div>
													<input type="text" id="pluCreatedDateAllLocation0"
														readonly="readonly" class="form-control dat" style="width:80%"
														data-inputmask="alias: dd/mm/yyyy" data-mask />
												</div>
												<span id="pluCreatedDateAllLocation0Error"
													style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
											</div>
											
											<%-- <div class="form-group col-lg-2 " style="padding-left: 0px;padding-right:0px">
												<label><spring:message code="updated.date.label" /></label>
												<div class="input-group">
													<div class="input-group-addon">
														<i class="fa fa-calendar"></i>
													</div>
													<input type="text" id="pluUpdatedDateAllLocation0"
														readonly="readonly" class="form-control dat"
														data-inputmask="alias: dd/mm/yyyy" data-mask />
												</div>
												<span id="pluUpdatedDateAllLocation0Error"
													style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
											</div> --%>
											<div class="form-group col-lg-2 span2" style="margin-left:27px;padding-right:0px">
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
														placeholder="DD/MM/YYYY"  />
													<!-- <input type="text" id="pluExpiryDate1" class="form-control allField req dat" data-inputmask="alias: dd/mm/yyyy" data-mask/> -->
												</div>
												<span id="pluExpiryDateAllLocation0Error"
													style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
											</div>
											<%-- <div class="form-group span2">
												<label><spring:message code="size.label" /></label> <input
													type="text" class="form-control allField"
													onkeydown="clearError(this);" id="pluSizeAllLocation0"
													placeholder="<spring:message code="enter.size.label" />" />
												<span id="pluSizeAllLocation0Error"
													style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
											</div> --%>
											
											  <div class="form-group col-lg-2 span2" style="">
                                           	<label><spring:message code="min.sales.quantity.label" /></label> <input
													type="text" class="form-control allField"
													id="priceMinSaleQtyAllLocation0" value="" style="width:70%"
													placeholder="<spring:message code="min.sales.quantity.label" />" />
                                         </div>
											
											<div class="form-group col-lg-2 " style="white-space:nowrap;margin-left:17px">
																	<label><spring:message
																			code="newarrival.product.status" /> </label>
																			<select class="form-control allField req" style="width:80%" name="status" id="skuStatusAllLocation0">
										                                      	<option value="true" ${'true' == plu.skuStatus ? 'selected' : ''} >Active</option>
		                                  		                                <option value="false" ${'false' == plu.skuStatus ? 'selected' : ''} >In-Active</option>
											
										                                    </select> 
																</div>
																
																
																 <div class="form-group col-lg-2" style="">
                                           	<label>Material Type</label> <input
													type="text"   class="form-control allField"
													id="materailTypeAllLocation0" value="${plu.materialType}"
													placeholder="Material Type" style="width:70%" />
											
											<span id="materailTypeAllLocation0Error"
													style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>		
													
													
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
								</div>
 --%>
																
																
																
																
																
											
										</div>
								
<div class="row-fluid-5">
									
									<div class="form-group col-lg-2 " style="padding-left: 0px">
												<label><spring:message code="updated.date.label" /></label>
												<div class="input-group">
													<div class="input-group-addon">
														<i class="fa fa-calendar"></i>
													</div>
													<input type="text" id="pluUpdatedDateAllLocation0"
														readonly="readonly" class="form-control dat" style="width:80%"
														data-inputmask="alias: dd/mm/yyyy" data-mask />
												</div>
												<span id="pluUpdatedDateAllLocation0Error"
													style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
											</div>
											
											<div class="form-group col-lg-2 span2" style="margin-left: 27px;padding-right:0px">
																	<label><spring:message code="packaged.date.label" /></label>
																	<div class="input-group">
																		<div class="input-group-addon">
																			<i class="fa fa-calendar"></i>
																		</div>
																		<input class="form-control allField req dat"
																			 readonly="readonly"
																			style="background-color: white;width:80%"
																			id="pluPackagedDateAllLocation0"
																			value="${plu.packagingDate}" size="20" type="text"
																			onfocus="callCalender('pluPackagedDateAllLocation0')"
																			onclick="callCalender('pluPackagedDateAllLocation0')"
																			placeholder="DD/MM/YYYY" />
																	</div>
																	<span
																		id="pluPackagedDate${selectedLocationId}${priceListCount}Error"
																		style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
																</div>		
												
																
					<div class="form-group col-lg-2" style="margin-left:5px" >
                                           	<label><spring:message code="pack.size.label" /></label> <input
													type="text" class="form-control allField"
													id="pricePackSizeAllLocation0" value="${plu.packSize}"
													placeholder="<spring:message code="enter.pack.size.label" />" style="width:60%"/>
                                        </div>
                                        
                                        <div class="form-group col-lg-2 " style="padding-right: 0px;margin-left:20px"> 
									<label><spring:message code="stock.factory.label" />
										</label>
									<input type="text" onblur="criteria(this)" id="stockfactorAllLocation0" 
										style="resize: none;width:60%" 
										class="form-control allField"  value="${plu.stockFactor}"
										placeholder="enter stock factor"style="width:60%">
									
								</div>		
                                
                                
                                <div class="form-group col-lg-2">
									<label>Zero Stock Billing</label>
									<div class="col-lg-10" style="padding-left: 0px">
										<select class="form-control" name="zeroStockbillingAllLocation0" id="zeroStockbillingAllLocation0">
											<option value="true" ${plu.zeroStockBilling == true ? 'selected' : ''}><spring:message
													code="yes.label" /></option>
							 				<option value="false" ${plu.zeroStockBilling == false ? 'selected' : ''}><spring:message
													code="no.label" /></option>
										</select>
									</div>
								</div>
                                
                                        
                                           <%--   <div class="form-group col-lg-2 span2" style="">
                                           	<label><spring:message code="min.sales.quantity.label" /></label> <input
													type="text" class="form-control allField"
													id="priceMinSaleQtyAllLocation0" value=""
													placeholder="<spring:message code="min.sales.quantity.label" />" />
                                         </div> --%>
                                        				
									
								<%-- 	<div class="form-group col-lg-8" style="padding-right:0px">
								
									<label><spring:message code="technicalSpecification.label" />
										</label>
									<textarea rows="1" id="technicalSpecDetailAllLocation0"  style="resize:none"
										class="form-control allField"
										placeholder="<spring:message code="entertechnicalSpecification.label" />">${plu.technical_specification}</textarea>
									<span id="productSideEffectsError"
										style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
							
								</div> --%>
								
								
								<%-- <div class="form-group col-lg-2 " style="padding-right: 0px;margin-left:17px"> 
									<label><spring:message code="businessSubcategory.label" />
										</label>
									<input type="text"onblur="criteria(this)" id="businessSubcategoryDetailAllLocation0" 
										name="productHanding" style="resize: none;" id="businessSubcategoryQuick"
										class="form-control allField"  value="${plu.businessSubCategory}"
										placeholder="<spring:message code="enter.businessSubcategory.label" />">
									<span id="productSideEffectsError"
										style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>

								</div>		 --%>
												
												</div>
										
										
										
										
										
<!-- 										<div class="row-fluid-5"> -->
													<%-- <div class="form-group span2">
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
														
													</div> --%>
												
												
										
										<%-- 		
												
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
																			onfocus=""
																			onclick=""
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
																			onfocus=""
																			onclick=""
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
																			id="plumanufacturedDateAllLocation0" name="plumanufacturedDateAllLocation0"
																			 size="20" type="text"
																			onfocus=""
																			onclick=""
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
																			onfocus=""
																			onclick=""
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
																		id="pluPackageIdAllLocation0" name="pluPackageId"
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
																		id="pluUtilityAllLocation0" name="pluUtility"
																		value=""
																		placeholder="<spring:message code="enter.utility.label" />" />
																	<span
																		id="pluPackageIdAllLocation0Error"
																		style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
																</div>	
																
												
											</div>
												--%>
<!-- 												</div> -->


<div class="row-fluid-5">
										
							<div class="form-group col-lg-2 " style="padding: 0px;">
										<label>EAN</label>
									<div class="col-lg-12" style="padding: 0px;">
									<input type="text" onblur="criteria(this)" id="eanAllLocation0"  style="" class="form-control"  value="${plu.ean}" placeholder="Enter EAN number">
									<!-- <span id="eanError" style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span> -->
									</div>
							</div>				
									
								<div class="form-group col-lg-2 " style="margin-left:20px;padding-right:0px">
										<label>Stock Status</label>
										<select class="form-control allField req" style="width:80%" id="skuStockStatus${selectedLocationId}${priceListCount}">
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



										<div class="row-fluid-5">
										
										<div class="form-group col-lg-5" style="padding-left:0px">
								
									<label><spring:message code="technicalSpecification.label" />
										</label>
									<textarea rows="2" onblur="criteria(this)" id="technicalSpecDetailAllLocation0"  style="resize:none"
										class="form-control allField"
										placeholder="<spring:message code="entertechnicalSpecification.label" />">${plu.technical_specification}</textarea>
									<span id="productSideEffectsError"
										style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
							
								</div>
										
											<div class="form-group col-lg-5" style="padding-right:0px">
												<label><spring:message code="description.label" />
													<span style="color: red; font-size: 2">*</span></label>
												<textarea rows="2"onblur="criteria(this)" class="form-control allField"
													onkeydown="clearError(this);" id="pluDescAllLocation0"
													style="resize: none;" required
													placeholder="<spring:message code="enter.description.label" />"></textarea>
												<span id="pluDescAllLocation0Error"
													style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
											</div>
										</div>
									
									
									
									
									</div>
									
							<div class="col-md-2 table-responsive" style="border: 1px solid #ccc;padding: 0px; margin-left: -6.5%;width: 22%;">
							 <table id="SKUMasterEANAllLocatio0" class="table table-bordered table-hover mulEANtable" style="margin-bottom:0px">
                            <thead style="background-color: #ccc !important; color: #ffff">
                                <tr>										
								<th>EAN</th>
								<th>Action</th>
								</tr>
							</thead>
							<tbody>
							
								<tr id="dynamicdivAllLocatio0">
								<td id="tableeanAllLocation0" style="width:57%"><input type="number" style="width:100%"   required="required" id="eantableAllLocation0" value="${plu.ean}"></td>
								<td style="width: 35%;white-space: nowrap;" id="actionAllLocation0">
								<!-- ;  --><a onclick="appendSKUEAN('AllLoc00','AllLocat000')"  style="border-bottom: 1px solid blue;color: blue;cursor: pointer;"><font size="2px">add</font></a>&nbsp&nbsp&nbsp&nbsp
							  <!--   -->   <a onclick="deleteSKUEAN('AllLoc00','AllLocat000');" style="border-bottom: 1px solid blue;color: blue;cursor: pointer;" id="deleteAllLocation0"><font size="2px">delete</font></a>
								</td>
								</tr>
								
								</tbody>
								</table>
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




<input type="hidden" id="outletCategory" value="${skuObj.categoryName}">
   <input type="hidden" id="outletBrandId" value="${skuObj.brandName}">
    
     <input type="hidden" id="outletLocation" value="${skuObj.storeLocation}">
      <input type="hidden" id="outletSubcategory" value="${skuObj.subCategoryName}">
       <input type="hidden" id="outletDepartmentId" value="${skuObj.department}">
        <input type="hidden" id="outletSupplierId" value="${skuObj.supplierIdName}">
          <input type="hidden" id="maxRecords" value="${skuObj.maxRecords}">
          <input type="hidden" id="SkuMaster" value="${skuObj.searchCriteria}">
        
     <%--    <div id="Error" class="Error"
									style="text-align: center; color: red; font-size: 2; font-weight: bold;">${err}</div>
								<div id="Success" class="Error"
									style="text-align: center; color: blue; font-size: 2; font-weight: bold;">${success}</div>
						 --%>	<div class="row" style="text-align: right;">
							
							
							
								<div class="col-md-12" style=" margin-left:-9px;margin-bottom:13px;">
									<c:if test="${type == 'new'}">
										<input type="button" id="edit"
											style="position: relative;margin-right: 25px"
											class="btnCls"
											onclick="validateSkuForm('new')"
											value="<spring:message code="submit.label" />" />
										<input type="button" id="edit" class="btnCls"
											style="margin-right: 25px; position: relative;"
											onclick="resetAll();"
											value="<spring:message code="reset.label" />" />
										<c:if test="${sessionScope.role == 'super admin'}">
											<input type="button" class="btnCls"
												style="margin-right: 25px; position: relative;"
												onclick="viewSkuMaster('skumaster','0');"
												value="<spring:message code="cancel.label" />" />
										</c:if>
										<c:forEach var="accessControl"
											items="${sessionScope.outletMasterSettings}">
											<c:if
												test="${accessControl.appDocument == 'SkuMaster' && accessControl.write == true && accessControl.read == true}">
												<input type="button" class="btnCls"
													style="margin-right: 1%; position: relative"
													onclick="viewSkuMaster('skumaster','0');"
													value="<spring:message code="cancel.label" />" />
											</c:if>
										</c:forEach>
										
									</c:if>
									<c:if test="${type == 'edit'}">
										<input type="button" class="btnCls"
											style="margin-right: 25px;" onclick="validateSkuForm('edit')"
											value="<spring:message code="submit.label" />" />
										<input type="button" class="btnCls"
											onclick="viewSkuMaster('skumaster','0');"
											value="<spring:message code="cancel.label" />" />
									</c:if>
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
	<!-- /.content -->

</body>
</html>