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
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>  

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
<script src="${pageContext.request.contextPath}/js/masterDataManagement/outletMasters/skuMaster.js"></script>
<%-- <script src="${pageContext.request.contextPath}/js/form_plugin.js"></script> --%>
<%-- <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/omniretailer.css"> --%>
<link rel="stylesheet" type="text/css"  href="${pageContext.request.contextPath}/css/jquery.calendars.picker.css">
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.calendars.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.calendars.plus.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.calendars.picker.js"></script>
<%-- <script type="text/javascript"
	src="${pageContext.request.contextPath}/js/masterDataManagement/genericMasters/employeeMaster.js"></script>
 --%>

<style type="text/css">

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


</style>


<!--  added by        :  koti bomminei
      description     :  to ristrict the user from entering special characters     -->

<script type="text/javascript">



</script>
	
	
	 




<script type="text/javascript">
	$(document)
			.ready(
					function() {
						  $(".subBlock").hide();
					   $(this).scrollTop(0);
// 					   callCalender('pluPackagedDateForQuick');
						//callCalender('plumanufacturedDateAllLocation1');
						//callCalender('pluBestBeforeDateAllLocation1');
						//callCalender('pluEffectivedDateAllLocation1');
						//callCalender('pluwarrantyDateAllLocation1');
					
												
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
						<c:if test="${type == 'edit'}">
							<h3>
								<spring:message code="edit.sku.label" />
							</h3>
						</c:if>
					</div>
					<!-- /.box-header -->
					<!-- form start -->
					<form id="newSku" method="post">
						<div class="box-body">
							<div class="row" style=" margin-top: -27px;">
								<div id="ErrorQuick" class="Error"
									style="text-align: center; color: red; font-size: 2; font-weight: bold;">${err}</div>
								<div id="SuccessQuick" class="Error"
									style="text-align: center; color: blue; font-size: 2; font-weight: bold;">${success}</div>
								<div class="col-lg-8" style=" margin-top: 14px; color: red; font-size: 2; ">	
								Note: "Quick" Update is common to all locations. please use "Detailed Edit" for Specific location. 
								</div>
								<input type="button" id="edit" style="position: relative;margin-right: 25px" class="btnCls" onclick="validateQuickSkuMaster('edit')" value="<spring:message code="submit.label" />" /> 
								<input type="button" id="edit" class="btnCls"
									style="margin-right: 25px;position: relative" onclick="resetAllQuick();"
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
									<label><spring:message code="skuid.label" /> <span style="color: red; font-size: 2">*</span></label>
										<div class="col-lg-11" style="padding-left: 0px">
										 <input type="text" onblur="criteria(this)"
										class="form-control allField" readOnly id="skuIdQuick" value="${sku.skuId}"
										oninput="this.value = this.value.replace(/[^a-zA-Z0-9 -]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');"
										placeholder="<spring:message code="enter.sku.id.label" />" />
									<span id="skuIdQuickError"
										style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
								    </div>
							   </div>  
							     
							     
							     <div class="form-group col-lg-2">
									<label><spring:message code="product.name.label" /> <span style="color: red; font-size: 2">*</span></label> 
									 <div class="col-lg-12" style="padding-left: 0px">
									    <input type="text" onblur="criteria(this)" class="form-control allField " id="searchItems" value="${sku.description}" placeholder="<spring:message code="enter.product.name.label" />"/>
									     <!-- <div class="services">
										    <div class="items">
											  <ul class="matchedStringUl productNameSku" style=""></ul>
										    </div>
									    </div> -->
									<span id="productQuckNameError" style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
									<input type="hidden" class="allField" id="productId" value="${sku.skuId}">
								</div>
								</div>
								<div class="form-group col-lg-2">
                          <label><spring:message code="category.name.label" /></label>
                          <div class="col-lg-12" style="padding-left: 0px">
                           	<input type="hidden" id="categoryId" name="categoryId" value="" />
                           <select class="form-control" id="categoryName" name="categoryName"  onchange="searchSubCategories('categoryName','subCategoryName')">
	                            <c:forEach var="categoryList" items="${categoryList}">
									<option value="${fn:trim(categoryList.categoryName)}" ${fn:trim(categoryList.categoryName) == sku.productCategory ? 'selected' : ''} id="${fn:trim(categoryList.categoryName)}" >${fn:trim(categoryList.categoryName)}</option>
						 		</c:forEach>
	                        </select>
                      </div>
				</div>		
				
						
								
							<%-- 	<div class="form-group col-lg-2">
									<label><spring:message code="category.name.label" /></label>
									 <input
										type="text" class="form-control allField" readonly="readonly"
										id="categoryName" name="categoryName" value="" required
										placeholder="<spring:message code="category.name.label" />" />
									<input type="hidden" id="categoryId" name="categoryId" value="" />
									<span id="eanError"
										style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
								</div> --%>
								<%-- <div class="form-group col-lg-2">
									<label><spring:message code="sub.category.name.label" /></label>
									<input type="text" class="form-control allField"
										readonly="readonly" id="subCategoryName"
										name="subCategoryName" value="" required
										placeholder="<spring:message code="sub.category.name.label" />" />
									<span id="eanError"
										style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
								</div> --%>
								
								
								 <div class="form-group col-lg-2">
                           <label><spring:message code="subcategory.label"/></label>
                           <div class="col-lg-12" style="padding-left: 0px">
                           <select class="form-control" id="subCategoryName" name="subCategoryName" >
	                            <c:forEach var="subCategoryDetailsList" items="${subCategoryDetailsList}">
									<option value="${fn:trim(subCategoryDetailsList.subcategoryName)}" ${fn:trim(subCategoryDetailsList.subcategoryName) == sku.subCategory ? 'selected' : ''} id="${fn:trim(subCategoryDetailsList.subcategoryName)}" >${fn:trim(subCategoryDetailsList.subcategoryName)}</option>
						 		</c:forEach>
	                        </select>
                      </div>
					</div>			
								
								<div class="form-group col-lg-2">
									<label><spring:message code="ean.label" /></label> 
									<div class="col-lg-11" style="padding-left: 0px">
									<input type="text" onblur="criteria(this)" class="form-control allField" id="eanQuick" name="ean"
										value="${sku.ean}" required placeholder="<spring:message code="enter.ean.label" />" /> <span
										id="eanError" style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
								</div>
							  </div>   
							  
								<div class="form-group col-lg-2">
									<label><spring:message code="tax.code.label" /></label>
									<div class="col-lg-10" style="padding-left: 0px">
										<select class="form-control" id="taxCodeQuick">
											<c:forEach var="tax" items="${taxDetails}">
												<%-- <option value="${tax.taxName}"
													${tax.taxName == sku.taxCode ? 'selected' : ''}>${tax.taxId}
													- ${tax.taxName}</option> --%>
													<option value="${tax.taxName}"
													${tax.taxName.toUpperCase() == sku.taxCode.toUpperCase() ? 'selected' : ''}>${tax.taxName}</option>
											</c:forEach>
										</select> <span id="taxCodeError"
											style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
									</div>
								</div>
							</div>
							<div class="row">
								<div class="form-group col-lg-2">
									<label><spring:message code="primaryDepartment.label" />
										<!-- <span style="color:red; font-size:2">*</span> --></label> 
									 <div class="col-lg-12" style="padding-left: 0px">	
										<input type="text" onblur="criteria(this)"	class="form-control allField searchItems searchBar" id="primaryDepartment"
										placeholder="<spring:message code="search" />" style=""  value="${sku.primaryDepartment}"/>
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
								</div>
								<div class="form-group col-lg-2">
									<label><spring:message code="secondaryDepartment.label" />
										<!-- <span style="color:red; font-size:2">*</span> --></label> 
										 <div class="col-lg-12" style="padding-left: 0px">
										<input type="text" onblur="criteria(this)" class="form-control allField searchItems searchBar"
										id="secondaryDepartment" placeholder="<spring:message code="search" />" style="" value="${sku.secondaryDepartment}" />
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
								</div>
								 <div class="form-group col-lg-2">
                           <label><spring:message code="class.label"/></label>
                            <div class="col-lg-12" style="padding-left: 0px">
                              <select class="form-control" id="className" name="className" >
                           		 <option value=""><spring:message code="ALL.label"/></option>
	                           <%--  <c:forEach var="subCategoryDetailsList" items="${subCategoryDetailsList}">
									<option value="${subCategoryDetailsList.subcategoryName}" ${subCategoryDetailsList.subcategoryName == subcategory ? 'selected' : ''} id="${subCategoryDetailsList.subcategoryName}" >${subCategoryDetailsList.subcategoryName}</option>
						 		</c:forEach> --%>
	                        </select>
                           </div>
		               </div>				
				 <div class="form-group col-lg-2">
                           <label><spring:message code="sub.class.label"/></label>
                           <select class="form-control" id="subclassName" name="subclassName" >
                           		 <option value=""><spring:message code="ALL.label"/></option>
	                           <%--  <c:forEach var="subCategoryDetailsList" items="${subCategoryDetailsList}">
									<option value="${subCategoryDetailsList.subcategoryName}" ${subCategoryDetailsList.subcategoryName == subcategory ? 'selected' : ''} id="${subCategoryDetailsList.subcategoryName}" >${subCategoryDetailsList.subcategoryName}</option>
						 		</c:forEach> --%>
	                        </select>
                      </div>
									<div class="form-group col-lg-2">
									<label><spring:message code="model.label" /></label>
									<div class="col-lg-10" style="padding-left: 0px">
										<input type="text"onblur="criteria(this)" class="form-control allField" name="model"
											id="modelQuick" value="${sku.model}" required
											placeholder="<spring:message code="enter.model.label" />" />
										<span id="modelError"
											style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
									</div>
								</div>
						<%-- 	<div class="form-group col-lg-2">
									<label><spring:message code="color.label" /></label>
									<div class="col-lg-10" style="padding-left: 0px">
										<input type="text" class="form-control allField" name="color"
											id="color" value="${sku.color}"
											placeholder="<spring:message code="enter.color.label" />" />
										<span id="colorError"
											style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
									</div>
								</div> --%>
									<div class="form-group col-lg-2">
									<label><spring:message code="hsnCode.label" /> <span
										style="color: red; font-size: 2">*</span></label> 
									<div class="col-lg-10" style="padding-left: 0px">
									<input type="text" onblur="criteria(this)" class="form-control allField" value="${sku.hsnCode}" name="hsnCode"
										id="hsnCodeQuick"  placeholder="<spring:message code="hsnCode.label" />" />
								<span id="hsnCodeQuickError" style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
										
								</div>
							</div>
								
							</div>
<input type="hidden" id="locationslist" value="${workLocationsList}">
<input type="hidden" id="updatedDateStr" value="${sku.updated_date}">
<input type="hidden" id="createdDateStr" value="${sku.created_date}">

							<div class="row">
								<div class="form-group col-lg-2">
									<label><spring:message code="uom.label" /> <span
										style="color: red; font-size: 2">*</span></label>
									<div class="col-lg-10" style="padding-left: 0px">
										<input type="text"  id="uomQuickList" value="${sku.uom}" list="uomQuick"/>
                                      <datalist id="uomQuick">
											<option value="KG" ${sku.uom == 'KG' ? 'selected' : ''}>KG</option>
											<option value="Grams" ${sku.uom == 'Grams' ? 'selected' : ''}>Grams</option>
											<option value="Litres"${sku.uom == 'Litres' ? 'selected' : ''}>Litres</option>
											<option value="Millilitres"${sku.uom == 'Millilitres' ? 'selected' : ''}>Millilitres</option>
											<option value="Meters"${sku.uom == 'Meters' ? 'selected' : ''}>Meters</option>
											<option value="PCS"${sku.uom == 'PCS' ? 'selected' : ''}>PCS</option>
											<option value="Cases" ${sku.uom == 'Cases' ? 'selected' : ''}>Cases</option>
									</datalist>
									<span id="uomQuickListError"
											style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
									</div>
								</div>
								<div class="form-group col-lg-2">
									<label><spring:message code="uom.label.label" /></label>
									<div class="col-lg-10" style="padding-left: 0px">
										<input type="text" onblur="criteria(this)" class="form-control allField"
											name="uomLabel" id="uomLabelQuick" value="${sku.uomLabel}"
											placeholder="<spring:message code="enter.uom.label.label" />" />
										<span id="weightError"
											style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
									</div>
								</div>
								
								<div class="form-group col-lg-2">
									<label><spring:message code="pack.size.label" /></label>
									<div class="col-lg-10" style="padding-left: 0px">
										<input type="text" onblur="criteria(this)" class="form-control allField"
											name="packSize" id="packSizeQuick" value="${sku.packSize}" required
											placeholder="<spring:message code="enter.pack.size.label" />"
											oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');" />
										<span id="packSizeError"
											style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
									</div>
								</div>
							
							<%-- <c:forEach var="plu" items="${sku.skuPriceLists}" varStatus="theCount">
							<input type="hidden" id="mrpValue${theCount.count}" value="${plu.price}${plu.storeLocation}">
							<input type="hidden" id="salePriceValue${theCount.count}" value="${plu.salePrice}${plu.storeLocation}">
							<c:set var="countValue" value="${theCount.count}"/>
							</c:forEach>
							 --%>
							 
							    <div class="form-group col-lg-2 " style="">
									<label><spring:message code="costprice.label" /></label>
									<c:forEach var="plu" items="${sku.skuPriceLists}" varStatus="theCount">	
									<c:if test="${theCount.count == 1 }">
									 <input type="text" onblur="criteria(this)" class="form-control allField req pluSale" onkeydown="clearError(this);" onblur="calcMarkUp(this);" value="${plu.costPrice}" id="costPrice"
									 oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');"
									placeholder="<spring:message code="enter.sale.price.label" />" />
						      </c:if>
						       </c:forEach>
						         </div>
						         
							 
								
						         <div class="form-group col-lg-2 " style="">
									<label><spring:message code="mrp.label" /></label>
									<c:forEach var="plu" items="${sku.skuPriceLists}" varStatus="theCount">	
									<c:if test="${theCount.count == 1 }">
									 <input type="text" onblur="criteria(this)" class="form-control allField req pluSale" onkeydown="clearError(this);" onblur="calcMarkUp(this);" value="${plu.price}" id="mrp"
									 oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');"
									placeholder="<spring:message code="enter.sale.price.label" />" />
						      </c:if>
						       </c:forEach>
						         </div>
						         
								 <div class="form-group col-lg-2 " style="">
									<label><spring:message code="sale.price.label" /><span style="color: red; font-size: 2">*</span></label>
										<!-- <span style="color: red; font-size: 2">*</span> -->
										<c:forEach var="plu" items="${sku.skuPriceLists}" varStatus="theCount">	
									<c:if test="${theCount.count == 1 }">
										 <input type="text" onblur="criteria(this)" class="form-control allField req pluSale"
											onkeydown="clearError(this);" onblur="calcMarkUp(this);"
											value="${plu.salePrice}${priceListCount}" id="salePrice"	oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');"
											placeholder="<spring:message code="enter.sale.price.label" />" />
								
								</c:if>
								
								
								</c:forEach>
								<span id="salePriceError"style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
								</div>
								
						<%-- 	<div class="form-group col-lg-2">
									<label><spring:message code="hsnCode.label" /></label> 
									<div class="col-lg-10" style="padding-left: 0px">
									<input type="text" class="form-control allField" value="${sku.hsnCode}" name="hsnCode"
										id="hsnCode"  placeholder="<spring:message code="hsnCode.label" />" />
								</div>
							</div> --%>
							</div>

						<div class="row">
								<div class="form-group col-lg-2">
									<label><spring:message code="zero.stock.orders.label" /></label>
									<div class="col-lg-10" style="padding-left: 0px">
										<select class="form-control" name="zeroStock" id="zeroStock">
											<option value="true"
												${sku.zeroStock == true ? 'selected' : ''}>Yes</option>
											<option value="false"
												${sku.zeroStock == false ? 'selected' : ''}>No</option>
										</select>
									</div>
								</div>
								
									<div class="form-group col-lg-2">
									<label><spring:message code="status.label" /></label>
									<div class="col-lg-10" style="padding-left: 0px">
										<select class="form-control" name="status" id="status">
											<option value="Active"
												${sku.status == 'Active' ? 'selected' : ''}>Active</option>
											<option value="InActive"
												${sku.status == 'InActive' ? 'selected' : ''}>InActive</option>
											<option value="Discontinued"
												${sku.status == 'Discontinued' ? 'selected' : ''}>Discontinued</option>
										</select>
									</div>
								</div>
								
								<div class="form-group col-lg-2 " style="">
									<label><spring:message code="section.label" /></label>
										 <input type="text"onblur="criteria(this)" style ="width:75%" class="form-control allField req pluSale"
											onkeydown="clearError(this);" onblur="calcMarkUp(this);"
												value="${sku.section}" id="sectionQuick"
											placeholder="<spring:message code="section.label" />" />
								
								</div>
					       <!-- added by: vasudev
								created on: 22-08-2019 -->
								<div class="form-group col-lg-3" style=""> 
								<label><spring:message code="SKU.description.label" /></label> 
 									<input type="file" class="btn bg-olive btn-inline" accept=".xml" title="To import, Choose the valid xml Sheet format" style="height: 30px;  width: 233px;     padding: 3px !important;" id="skuDescription" name="skuDescription" onchange="loadFileAsURL('skuDescription',this);" /> 
									<input type="hidden" id="skuDescription_refId" name="skuDescription" /> 
									<input type="hidden" id="skuDescription_name" />
									<span id="searchFilesError" style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span> 
								</div> 	
								
								
							</div>

<div class="col-lg-12"><br></div>

<div class="row">
			 
             <div class="form-group col-lg-12" style="margin-top:20px;">
             	<label style="font-size: 18px;margin-top:-26px;float:left">Extra Details  (only for wellness)</label>
             <!--   <hr style="margin-top:0px;width:100%;"> -->
                <div class=" col-lg-12" style="margin-bottom: 4px;">
							               	<%-- <img class="headerImg" style="float: right;background-color;cursor: pointer;margin-right: -16px;margin-top: -34px;margin-bottom: -26px;" onclick="activateHeader('outletperipherals');" id="outletperipheralsImg" alt="" src="${pageContext.request.contextPath}/images/leftHeaderIconGreen.png"> --%> 
							             <!--  <a class="headerImg" style="float:right;width: 0;height: 0;border-style: solid;margin-top:-28px;cursor: pointer;border-width: 23px 0 0 31px;border-color: transparent transparent transparent gray;" onclick="activateHeader('outletperipherals');" id="outletperipheralsImg"></a> --> 		
							             <img class="headerImg" style="float: right;cursor: pointer;margin-right: -16px;margin-top: -34px;margin-bottom: -26px;" onclick="activateQuickHeader('additionalInfo');" id="additionalInfoImg" alt="" src="${pageContext.request.contextPath}/images/leftHeaderIconGreen.png">
							                 </div> 
							                
							               <hr style="margin-top:-4px;" /> 
            
            
             </div></div> 

 <div class="additionalInfo subBlock">
							<div class="row">
								<div class="form-group col-lg-2">
									<label><spring:message code="min.sales.quantity.label" /></label>
									

										<input type="text" onblur="criteria(this)" class="form-control allField"
											id="minSaleQtyForQuick" name="minSaleQty" value="${sku.minSaleQty}" required
											placeholder="<spring:message code="enter.min.sales.quantity.label" />"
											oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');" />
										<span id="minSaleQtyError"
											style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
								
								</div>
									
													
								<div class="form-group col-lg-2" style="padding-right:0px">
                            
									<label><spring:message code="businessCategory.label" />
										</label>
										<c:forEach var="plu" items="${sku.skuPriceLists}" varStatus="theCount">
										<c:if test="${theCount.count == 1 }">
									<input type="text" onblur="criteria(this)" id="businessCategoryQuick" 
										class="form-control allField" value="${plu.businessCategory}"
										placeholder="<spring:message code="enterbusinescategory.label" />">
									</c:if>
									</c:forEach>
									<span id="businessCategoryQuickError"
										style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
								</div>
	
								
							<%-- 	<div class="form-group col-lg-2"  style="padding-right:0px">
                            
									<label><spring:message code="product.sideEffects.label" />
										</label>
									<input type="text" id="businessSubCategoryQuick" 
										name="businessCategory" style="resize: none;"
										class="form-control allField"  value="${sku.product_side_effects}"
										placeholder="<spring:message code="enterbusinessSubcategory.label" />">
									<span id="businessCategoryError"
										style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
								</div> --%>
								
								
								<div class="form-group col-lg-2">
									<label><spring:message code="businessSubcategory.label" />
										</label>
										<c:forEach var="plu" items="${sku.skuPriceLists}" varStatus="theCount">
										<c:if test="${theCount.count == 1 }">
									<input type="text" onblur="criteria(this)" id="businessSubcategoryQuick" 
										class="form-control allField"  value="${plu.businessSubCategory}"
										placeholder="<spring:message code="enter.businessSubcategory.label" />">
									<span id="productSideEffectsError"
										style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
                                       </c:if>
                                       </c:forEach>
								</div>
								
										<div class="form-group col-lg-2" style="">
<!-- 										<div class="form-group col-lg-9"> -->
									<label><spring:message code="comboQuick.label" />
										</label>
								<select  class="form-control allField"  id="comboQuick">
								<option value="true"
												${sku.is_combo == true ? 'selected' : ''}><spring:message
													code="yes.label" /></option>
											<option value="false"
												${sku.is_combo == false ? 'selected' : ''}><spring:message
													code="no.label" /></option>
								</select>
<!--                              </div> -->
								</div>
								
								
								<div class="form-group col-lg-2"  style="">
                            
									<label><spring:message code="productUsage.label" />
										</label>
									<input type="text" onblur="criteria(this)" id="productUsageQuick" 
										name="productUsageQuick" style="resize: none;"
										class="form-control allField"  value="${sku.product_usage}"
										placeholder="<spring:message code="productUsage.label" />">
									
								</div> 
								
							
							<div class="form-group col-lg-2"  style="">
                            
									<label><spring:message code="product.handing.label" />
										</label>
									<input type="text" id="productHandingQuick" onblur="criteria(this)" 
										name="productHanding" style="resize: none;"
										class="form-control allField"  value="${sku.product_handing}"
										placeholder="<spring:message code="enter.product.handing.label" />">
									
								</div> 
							
							
								
							</div>
						
						<div class="row">
						
						
						<div class="form-group col-lg-2"  style="">
                            
									<label><spring:message code="productInTake.label" />
										</label>
									<input type="text" id="productIntakeQuick" onblur="criteria(this)"
										name="productUsageQuick" style=""
										class="form-control allField"  value="${sku.product_consumption_interaction}"
										placeholder="<spring:message code="enterproductInTake.label" />">
									
								</div> 
						
						
						<div class="form-group col-lg-2"  style="">
                            
									<label><spring:message code="uom1.label" />
										</label>
									<input type="text" id="uom1Quick" onblur="criteria(this)"
										class="form-control allField"  value="${sku.uom1}"
										placeholder="<spring:message code="enteruom1.label" />">
									
								</div> 
								
								
								<div class="form-group col-lg-2"  style="">
                            
									<label><spring:message code="uom2.label" />
										</label>
									<input type="text" id="uom2Quick" onblur="criteria(this)"
										class="form-control allField"  value="${sku.uom2}"
										placeholder="<spring:message code="enteruom2.label" />">
									
								</div> 
						
						
				
								
								<div class="form-group col-lg-6">
									<label><spring:message code="detailed.descriptor.label" />
										<!-- <span style="color: red; font-size: 2"></span> --></label>
									<textarea rows="1" id="shortDescriptionQuick"onblur="criteria(this)"
										name="shortDescription" style="resize: none;"
										class="form-control allField"
										placeholder="<spring:message code="enter.short.description.label" />">${sku.description}</textarea>
									<span id="shortDescriptionQuickError"
										style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
								</div>
								
								
								
								
						</div>
						
						
						
							
							<div class="row">
								<div class="form-group col-lg-6" style="">
								
							
									<label><spring:message code="product.precautions.label" />
										</label>
									<textarea rows="2" id="productPrecautionsQuick"   style="resize: none;"onblur="criteria(this)"
										class="form-control allField"
										placeholder="<spring:message code="enter.product.precautions.label" />">${sku.product_precautions}</textarea>
									<span id="productPrecautionsQuickError"
										style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
								</div>
								
						
								
								
								<div class="form-group col-lg-6" style="">
								
								
									<label><spring:message code="product.sideEffects.label" />
										</label>
									<textarea rows="2" id="productSideEffectsQuick"  style="resize: none;"onblur="criteria(this)"
										class="form-control allField"
										placeholder="<spring:message code="enter.product.sideEffects.label" />">${sku.product_side_effects}</textarea>
									<span id="productSideEffectsError"
										style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
							
								</div>
								
								
								
								
								
								
								
								</div>
						
						

							<%-- <div class="row">
								<div class="form-group col-lg-8">
									<label><spring:message code="short.description.label" />
										<span style="color: red; font-size: 2">*</span></label>
									<textarea rows="3" id="shortDescription"
										name="shortDescription" style="resize: none;"
										class="form-control allField"
										placeholder="<spring:message code="enter.short.description.label" />"></textarea>
									<span id="shortDescriptionError"
										style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
								</div>
								
									<div class="form-group col-lg-4">
									
										<div class="form-group col-lg-8">
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
								
							
									</div>
								
							</div>
							 --%>
							
				</div>			
							<div class="row">
								<%-- <div class="form-group col-lg-12">
									<label><spring:message code="short.description.label" />
										<span style="color: red; font-size: 2">*</span></label>
									<textarea rows="3" id="shortDescriptionQuick"
										name="shortDescription" style="resize: none;"
										class="form-control allField"
										placeholder="<spring:message code="enter.short.description.label" />">${sku.description}</textarea>
									<span id="shortDescriptionQuickError"
										style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
								</div> --%>
								
										<div class="form-group col-lg-12" style="">
								
								<label><spring:message code="technicalSpecification.label" />
										</label>
									<c:forEach var="plu" items="${sku.skuPriceLists}" varStatus="theCount">
										<c:if test="${theCount.count == 1 }">
									<textarea rows="2" id="technicalSpecQuick"  style="resize: none;"onblur="criteria(this)"
										class="form-control allField"
										placeholder="<spring:message code="entertechnicalSpecification.label" />">${plu.technical_specification}</textarea>
									<span id="productSideEffectsError"
										style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
			                    </c:if>
			                    </c:forEach>
								</div>
								
								
								<%-- 	<div class="form-group col-lg-4">
									
										<div class="form-group col-lg-8">
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
								
							
									</div> --%>
								
							</div>
							<!-- /.box-body -->
							<div class="row" style="text-align: right;">
								<div class="col-md-12">
									<input type="button" id="edit" style="margin-right: 25px"
										class="btnCls" onclick="validateQuickSkuMaster('edit')"
										value="<spring:message code="submit.label" />" /> <input
										type="button" id="edit" class="btnCls"
										style="margin-right: 25px" onclick="resetAllQuick();"
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

<input type="hidden" id="outletCategory" value="${skuObj.categoryName}">
   <input type="hidden" id="outletBrandId" value="${skuObj.brandName}">
    
     <input type="hidden" id="outletLocation" value="${skuObj.storeLocation}">
      <input type="hidden" id="outletSubcategory" value="${skuObj.subCategoryName}">
       <input type="hidden" id="outletDepartmentId" value="${skuObj.department}">
        <input type="hidden" id="outletSupplierId" value="${skuObj.supplierIdName}">
          <input type="hidden" id="maxRecords" value="${skuObj.maxRecords}">
          <input type="hidden" id="SkuMaster" value="${skuObj.searchCriteria}">
          
          					<!--missing hidden fields  started-->
							
							<input type="hidden" id="supplierNameQuick" value="${sku.supplier}" />
							<input type="hidden" id="brandQuick" value="${sku.brandCode}" />
							<input type="hidden" id="manufactureCodeQuick" value="${sku.manufacturerCode}" />
							<input type="hidden" id="manufactureNameQuick" value="${sku.make}" />
							<input type="hidden" id="jitStockQuick" value="${sku.jitStock}" />
							<input type="hidden" id="minSaleQtyQuick" value="${sku.minSaleQty}" />
							<input type="hidden" id="manufactureItemQuick" value="${sku.manufacturedItem}" />
							<input type="hidden" id="packagedItemQuick" value="${sku.packed}" />
							<input type="hidden" id="editableQuick" value="${sku.editable}" />
							<input type="hidden" id="patternCodeQuick" value="${sku.patternCode}" />
							<input type="hidden" id="reorderPointQuick" value="${sku.reorderPoint}" />
							<input type="hidden" id="orderQuantityQuick" value="${sku.orderQuantity}" />						
							<input type="hidden" id="leadTimeQuick" value="${sku.leadTimeDays}" />
							<input type="hidden" id="maxStockQuick" value="${sku.maxStock}" />
							<input type="hidden" id="stockQuick" value="${sku.stock}" />
							<input type="hidden" id="frTaxCodeQuick" value="${sku.frTaxCode}" />
							<input type="hidden" id="markUpQuick" value="${sku.markUp}" />
							<input type="hidden" id="markDownQuick" value="${sku.markDown}" />
							<input type="hidden" id="runningPluQuick" value="${sku.runningPluNumber}" />					
							<input type="hidden" id="openRateQuick" value="${sku.openRate}" />
							<input type="hidden" id="lastCostQuick" value="${sku.lastCost}" />
							<input type="hidden" id="averageCostQuick" value="${sku.avgCost}" />
							<input type="hidden" id="minPriceQuick" value="${sku.minimumPrice}" />
							<input type="hidden" id="colorQuick" value="${sku.color}" />
							<input type="hidden" id="itemTaxExclusiveQuick" value="${sku.itemTaxExclusive}" />
							<input type="hidden" id="itemTrackRequiredQuick" value="${sku.trackingRequired}" />							
							<input type="hidden" id="alternate_skuQuick" value="${sku.alternateSkuId}" />					
							<input type="hidden" id="season_codeQuick" value="${sku.seasonCode}" />
							<input type="hidden" id="alias_nameQuick" value="${sku.aliasName}" />
							<input type="hidden" id="item_typeQuick" value="${sku.itemType}" />
							<input type="hidden" id="item_designQuick" value="${sku.itemDesign}" />
							<input type="hidden" id="comboDetailQuick" value="${sku.is_combo}" />
							<input type="hidden" id="productHandingDetailQuick" value="${sku.product_handing}" />
							<input type="hidden" id="productUsageDetailQuick" value="${sku.product_usage}" />
							<input type="hidden" id="productIntakeDetailQuick" value="${sku.product_consumption_interaction}" />
							<input type="hidden" id="uom1DetailQuick" value="${sku.uom1}" />
							<input type="hidden" id="uom2DetailQuick" value="${sku.uom2}" />							
							<input type="hidden" id="productPrecautionsQuick" value="${sku.product_precautions}" />
							<input type="hidden" id="productSideEffectsQuick" value="${sku.product_side_effects}" />
							<input type="hidden" id="warrantyDetailsQuick" value="${sku.warantyDetails}" />
							
							<!--missing hidden fields  end-->
							<br />
							</div>
							<!-- <div class="box-footer"></div> -->
					</form>
				</div>

			</div>
		</div>
	</section>
	<!-- /.content -->
</body>
</html>