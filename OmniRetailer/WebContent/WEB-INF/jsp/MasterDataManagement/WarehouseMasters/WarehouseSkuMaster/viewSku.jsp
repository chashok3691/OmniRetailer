<!--/*
 * Project Name 	        : OmniRetailerCustomer
 * Written By		        : Mythri
 * file name		        : Inventory Manager/master/editSku.jsp
 * file type		        : JSP
 * description				: The edit sku is displayed using this jsp
 * */ -->


<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>  
    
    <!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<title>Home | Omni Retailer</title>
	<meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>
	 <script src="${pageContext.request.contextPath}/js/masterDataManagement/outletMasters/skuMaster.js"></script>
 <script src="${pageContext.request.contextPath}/js/form_plugin.js"></script>
 <script type="text/javascript" src="${pageContext.request.contextPath}/js/controller.js"></script>
 <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/jquery.calendars.picker.css">
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.calendars.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.calendars.plus.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.calendars.picker.js"></script>
	
<style type="text/css">
.row-fluid-5 {
   width: 100%;
   *zoom: 1;
 }
 .row-fluid-5:before,
 .row-fluid-5:after {
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

 .row-fluid-5 .controls-row [class*="span"] + [class*="span"] {

   margin-left: 1.875%;
 }
 .row-fluid-5 [class*="span"]:first-child{
    margin-left: 0;
 }
 .row-fluid-5 .span2 {
   width: 18.5%;
   *width: 18.5%;
 }

 /* responsive ONLY */

 @media (max-width: 600px){ /* spans reduce to 100px then go full width */

    .row-fluid-5 [class*="span"]{
    margin-left: 0;
    float: left;
    width: 100%;
    padding: 10px; 
    }
 }

	 img.thumbnail {
   	 	background: none repeat scroll 0 0 #FFFFFF;
    	margin-bottom: 0px !important;
    	border:none !important;
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
    	position:absolute;
    	 top:0;
        right:0;
    	height: 16px;
    	width: 16px;
    	cursor: pointer;
     	/* background:rgba(0, 0, 0, 0) url("${pageContext.request.contextPath}/images/deny.png") no-repeat scroll 0 0; */
    }
</style>
<script type="text/javascript">
$(document).ready(function(){
	$(".priceList").hide();
	setMarkUp();
	var dateTime = getCurrentDate();
	var date = dateTime.split(' ');
	date = date[0].split('/');
	var formatedDate = date[1] + "/" + date[0] + "/" + date[2];
	$('#lastUpdated').val(formatedDate);
	$('#createdDate').val(formatedDate);
	
	var selectedStoreLocation = $("#selectedStoreLocation").val().replace('[','').replace(']','').replace(/, /g,',').replace(/ ,/g,',');
	$("#location").val(selectedStoreLocation.split(','));
	 var selectedLocation = $("#selectedLocation").val();
	selectedLocation = selectedLocation.replace(/ /g,'_');
	 var len = $("div ."+selectedLocation+" .pricelist").length;
	 $("#currentPriceList").html("1 of "+len);
	 $('#pluCreatedDate'+len).val(formatedDate);
	 setExpiryDateAndUpdatedDate();
	/*   for(var i=1;i<=len;i++){
		  if($("#pluExpiryDate"+i).val() != "" && $("#pluExpiryDate"+i).val() != null)
		getDate('pluExpiryDate'+i);
	}  */
	 if(len>1)
		 $("#nextImg").css("opacity","1");
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
                              <br/>
                              <h3><spring:message code="view.sku.label" /></h3>
                              </div><!-- /.box-header -->
                              <!-- form start -->
                              <form id="editSku" method="post" >
                                  <div class="box-body">
                                  	<div class="row" style="text-align: right; margin-top: -27px;">
	                                  <div id="Error" style="text-align:center;color:red;font-weight:bold;">${err}</div>
									  	<input type="button" class="btnCls" style="margin-right: 1%;" onclick="viewWarehouseSkuMaster('warehouseskumaster','0','');" value="<spring:message code="cancel.label" />" />
										<hr style="margin-top: 4px;width: 99%;" />
									</div>
									<div class="row">
                                        <div class="form-group col-lg-2">
                                        	<label><spring:message code="skuid.label" /> <span style="color:red; font-size:2">*</span></label>
	                                        <input type="text" class="form-control allField" readonly="readonly" id="skuId" value="${skuId}" placeholder="<spring:message code="enter.sku.id.label" />" />
	                                        <span id="skuIdError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
																			<input type="hidden" id="searchwarehouseSKU" value="${sku.skuId}">
										
										</div>
										<div class="form-group col-lg-2">
                                        	<label><spring:message code="product.name.label" /> <span style="color:red; font-size:2">*</span></label>
	                                        <input type="text" value="${sku.productName}" readonly="readonly" class="form-control allField " id="searchItems" />
	                                        <span id="productNameError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
											<input type="hidden" class="allField" id="productId" value="${sku.productId}">
										</div>
										<div class="form-group col-lg-2">
                                    		<label><spring:message code="category.name.label" /></label>
                                            <input type="text" class="form-control allField" readonly="readonly" id="categoryName" name="categoryName" value="${sku.productCategory}" required placeholder="<spring:message code="category.name.label" />" />
                                            <span id="eanError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
                                        </div>
                                        <div class="form-group col-lg-2">
                                    		<label><spring:message code="sub.category.name.label" /></label>
                                            <input type="text" class="form-control allField" readonly="readonly" id="subCategoryName" name="subCategoryName" value="${sku.subCategory}" required placeholder="<spring:message code="sub.category.name.label" />" />
                                            <span id="eanError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
                                        </div>
                                    	<div class="form-group col-lg-2">
                                    		<label><spring:message code="ean.label" /></label>
                                            <input type="text" class="form-control allField" readonly="readonly" id="ean" name="ean" value="${sku.ean}" required placeholder="<spring:message code="enter.ean.label" />" />
                                            <span id="eanError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
                                        </div>
                                        <div class="form-group col-lg-2">
											<label><spring:message code="supplier.name.label" /> <span style="color:red; font-size:2">*</span></label>
                                            <input type="text" value="${sku.supplierName}" readonly="readonly" class="form-control allField searchItems" name="supplier_name" id="searchSupplier" />
											<span id="supplierNameError" style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
											<input type="hidden" class="allField" name="supplier_Id" id="supplier_Id" value="${sku.supplierName}"  />
										</div>
                                      </div>
                                      <div class="row">
                                     
										<div class=" col-lg-2">
											<label><spring:message code="manufacturer.code.label" /></label>
                                            <input type="text" class="form-control allField" readonly="readonly" name="manufacturerCode" id="manufacturerCode" value="${sku.manufacturerCode}" required placeholder="<spring:message code="enter.manufacturer.code.label" />" />
                                            <span id="manufacturerCodeError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
										</div>
                                    	<div class=" col-lg-2">
                                    		<label><spring:message code="manufacturer.name.label" /> <span style="color:red; font-size:2">*</span></label>
                                            <input type="text" class="form-control allField" readonly="readonly" id="manufacturer" name="make" value="${sku.make}" required placeholder="<spring:message code="enter.manufacturer.name.label" />" />
                                            <span id="manufacturerError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
                                        </div>
                                       <div class=" col-lg-2" style="padding-left:0px">
                                          <div class="form-group col-lg-8 col-sm-12">
                                            <label><spring:message code="uom.label" /> <span style="color:red; font-size:2">*</span></label>
                                             <select  class="form-control" disabled="disabled" id="uom">
                                             	<option value="KG" ${sku.uom == 'KG' ? 'selected' : ''}>KG</option>
                                             	<option value="Grams" ${sku.uom == 'Grams' ? 'selected' : ''}>Grams</option>
                                             	<option value="Litres" ${sku.uom == 'Litres' ? 'selected' : ''}>Litres</option>
                                             	<option value="Millilitres" ${sku.uom == 'Millilitres' ? 'selected' : ''}>Millilitres</option>
	                                            <option value="Meters" ${sku.uom == 'Meters' ? 'selected' : ''}>Meters</option>
	                                            <c:if test="${sku.uom != 'PCS'}">
	                                            <option value="Pieces" ${sku.uom == 'Pieces' ? 'selected' : ''}>Pieces</option>
	                                           </c:if>
	                                            <c:if test="${sku.uom == 'PCS'}">
	                                            <option value="Pieces" ${sku.uom == 'PCS' ? 'selected' : ''}>Pieces</option>
	                                           </c:if>
	                                           
	                                            <option value="Cases" ${sku.uom == 'Cases' ? 'selected' : ''}>Cases</option>
                                          </select>
                                             
                                             
                                             </div>
                                             
                                         </div>
                                        <div class=" col-lg-2" style="padding-left:0px">
                                          <div class="form-group col-lg-9 col-sm-12">
                                            <label><spring:message code="uom.label.label" /></label>
                                            <input type="text" class="form-control allField" readonly="readonly" name="uomLabel" id="uomLabel" value="${sku.uomLabel}"  placeholder="<spring:message code="enter.uom.label.label" />" />
                                        	<span id="weightError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
                                        </div></div>
                                       <div class=" col-lg-2" style="padding-left:0px">
                                          <div class="form-group col-lg-8 col-sm-12">
                                            <label><spring:message code="pack.size.label" /></label>
                                            <input type="text" class="form-control allField" readonly="readonly" name="packSize" id="packSize" value="${sku.packSize}" required placeholder="<spring:message code="enter.pack.size.label" />" oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');" />
                                            <span id="packSizeError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
										</div>
                                    
                                      </div>
                                      
                                    <div class=" col-lg-2" style="padding-left:0px">
                                          <div class="form-group col-lg-8 col-sm-12">
                                             <label><spring:message code="retail.uom.label" /></label> <span style="color:red; font-size:2">*</span></label>
                                             <select  class="form-control" disabled id="retailuom">
                                             <option value="KG" ${sku.uom == 'KG' ? 'selected' : ''}>KG</option>
                                             	<option value="Grams" ${sku.uom == 'Grams' ? 'selected' : ''}>Grams</option>
                                             	<option value="Litres" ${sku.uom == 'Litres' ? 'selected' : ''}>Litres</option>
                                             	<option value="Millilitres" ${sku.uom == 'Millilitres' ? 'selected' : ''}>Millilitres</option>
	                                            <option value="Meters" ${sku.uom == 'Meters' ? 'selected' : ''}>Meters</option>
	                                            <c:if test="${sku.uom != 'PCS'}">
	                                            <option value="Pieces" ${sku.uom == 'Pieces' ? 'selected' : ''}>Pieces</option>
	                                           </c:if>
	                                            <c:if test="${sku.uom == 'PCS'}">
	                                            <option value="Pieces" ${sku.uom == 'PCS' ? 'selected' : ''}>Pieces</option>
	                                           </c:if>
	                                           
	                                            <option value="Cases" ${sku.uom == 'Cases' ? 'selected' : ''}>Cases</option>
                                          </select>
                                         </div>
                                      </div>
                                        </div>
                                      <div class="row">
                                      
                                      <div class=" col-lg-2" style="padding-left:0px">
                                          <div class="form-group col-lg-9 col-sm-12">
                                    		<label><spring:message code="retail.units.label" /></label>
                                           	<input class="form-control" type="text" name ="retailunits"  disabled value="${sku.retailUnits}" id="retailunits"/>
                                        </div></div>
                                      
                                      
                                      <div class=" col-lg-2" style="padding-left:0px">
                                          <div class="form-group col-lg-9 col-sm-12">
                                    		<label><spring:message code="brand.code.label" /></label>
                                            <select class="form-control" disabled="disabled" id="brandCode">
                                            	<c:forEach var="brandName" items="${brandsList}">
													<option value="${brandName}" ${sku.brandCode == brandName ? 'selected' : ''}>${brandName}</option>
												</c:forEach>
                                            </select>
                                        </div>
                                        </div>
                                       
                                    	<div class=" col-lg-2" style="padding-left:0px">
                                          <div class="form-group col-lg-9 col-sm-12">
                                            <label><spring:message code="model.label" /></label>
                                            <input type="text" class="form-control allField" disabled name="model" id="model" value="${sku.model}" required  placeholder="<spring:message code="enter.model.label" />"  />
                                        	<span id="modelError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
										</div> </div>
                                        
                                        
                                     <div class=" col-lg-2" style="padding-left:0px">
                                          <div class="form-group col-lg-9 col-sm-12">
                                            <label><spring:message code="color.label" /></label>
                                            <input type="text" class="form-control allField"  disabled name="color" id="color" value="${sku.color}" placeholder="<spring:message code="enter.color.label" />" />
                                        	<span id="colorError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
                                          </div></div>
                                         <div class=" col-lg-2 shademedia" style="padding-left:0px;">
                                         <div class="form-group col-lg-9 col-sm-12">
                                         <label><spring:message code="Shade.label" /> <span style="color:red; font-size:2">*</span></label>
                                            <input type="text" style="width:150px;" class="form-control allField" disabled  id="minSaleQty" name="minSaleQty" value="" required placeholder="<spring:message code="enter.shade.label" />" oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');" />
                                            <span id="minSaleQtyError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
                                         </div>
                                         </div>
                                                <div class=" col-lg-2" style="padding-left:0px;;padding-right:0px;white-space:nowrap;">
                                          <div class="form-group col-lg-9 col-sm-12">
                                       <label><spring:message code="hsnCode.label" /> <span
										style="color: red; font-size: 2">*</span></label> 
                                            <input type="hidden"  onblur="criteria(this)" class="form-control allField" name="" id="patternCode" value="${sku.patternCode}"  placeholder="<spring:message code="enter.pattern.code.label" />" />
                                               <input type="text"  onblur="criteria(this)" class="form-control allField" disabled name="" id="hsnCode" value="${sku.hsnCode}" required placeholder="<spring:message code="hsnCode.label" />" />
                                        	<span id="hsnCodeError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
                                         </div>
                                         </div>
                                      </div>
                                  
                                      <div class="row" style="white-space:nowrap;">
                                      
                                     
                                      <div class=" col-lg-2">
                                       <div class="form-group col-lg-10 col-sm-12" style="padding-left:0px;">
                                    		<label><spring:message code="min.sales.quantity.label" /> <span style="color:red; font-size:2">*</span></label>
                                            <input type="text" class="form-control allField" readonly="readonly" id="minSaleQty" name="minSaleQty" value="${sku.minSaleQty}" required placeholder="<spring:message code="enter.min.sales.quantity.label" />" oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');" />
                                            <span id="minSaleQtyError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
                                        </div>
                                    </div>
                                        
                                     
                                         <div class=" col-lg-2" style="padding-left:0px">
                                          <div class="form-group col-lg-9 col-sm-12">
                                            <label><spring:message code="reorder.point.label" /></label>
                                            <input type="text" class="form-control allField" readonly="readonly" name="reorderPoint" id="reorderPoint" value="${sku.reorderPoint}" required oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');" placeholder="<spring:message code="enter.reorder.point.label" />" />
                                        	<span id="reorderPointError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
                                         </div></div>
                                        <div class=" col-lg-2" style="padding-left:0px">
                                          <div class="form-group col-lg-7 col-sm-12">
                                            <label><spring:message code="order.quantity.label" /></label>
                                            <input type="text" class="form-control allField" readonly="readonly" name="orderQuantity" id="orderQuantity" value="${sku.orderQuantity}" required oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');" placeholder="<spring:message code="enter.order.quantity.label" />" />
                                        	<span id="orderQuantityError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
                                         </div></div>
                                      	 <div class=" col-lg-2" style="padding-left:0px">
                                          <div class="form-group col-lg-8 col-sm-12">
                                            <label><spring:message code="product.lead.time.label" /></label>
                                            <input type="text" class="form-control allField" readonly="readonly" name="leadTime" id="leadTime" value="${sku.leadTimeDays}" required placeholder="<spring:message code="enter.product.lead.time.label" />" oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');" />
                                        	<span id="leadTimeError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
										</div></div>
										 <div class=" col-lg-1">
                                            <label><spring:message code="product.max.stock.label" /></label>
                                            <input type="text" class="form-control allField" readonly="readonly" name="maxStock" id="maxStock" value="${sku.maxStock}" required placeholder="<spring:message code="enter.product.max.stock.label" />" oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');" />
                                        	<span id="maxStockError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
                                        </div><div class="form-group col-lg-1"></div>
                                         <div class=" col-lg-2" style="padding-left:0px">
                                          <div class="form-group col-lg-8 col-sm-12">
                                            <label><spring:message code="stock.label" /> <span style="color:red; font-size:2">*</span></label>
                                            <input type="text" class="form-control allField" readonly="readonly" name="stock" id="stock" value="${sku.stock}" oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');" required placeholder="<spring:message code="enter.stock.label" />" />
                                        	<span id="stockError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
                                        </div></div>
                                      </div> 
                                      <div class="row" style="white-space:nowrap;"> 
                                         <div class=" col-lg-2" style="padding-left:0px">
                                          <div class="form-group col-lg-9 col-sm-12">
                                            <label><spring:message code="tax.code.label" /></label>
                                            <select  class="form-control" disabled="disabled" id="taxCode">
                                            	  <c:forEach var="tax" items="${taxDetails}">
                                            	  	<option value="${tax.taxName}" ${tax.taxName == sku.taxCode ? 'selected' : ''}>${tax.taxId} - ${tax.taxName}</option>
													<%-- <option value="${tax.taxId == sku.taxCode ? 'selected' : ''}">${tax.taxId} - ${tax.taxName}</option> --%>
												</c:forEach>
                                            </select>
                                        	<span id="taxCodeError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
                                         </div></div>
                                       
                                          <div class=" col-lg-2" style="padding-left:0px">
                                          <div class="form-group col-lg-9 col-sm-12">
                                        	<label><spring:message code="fr.tax.code.label" /></label>
                                             <input type="text" class="form-control allField" readonly="readonly" name="frTaxCode" id="frTaxCode" value="${sku.frTaxCode}" required placeholder="<spring:message code="enter.fr.tax.code.label" />" /> 
                                         </div></div>
                                           <div class=" col-lg-2" style="padding-left:0px">
                                          <div class="form-group col-lg-7 col-sm-12">
                                            <label><spring:message code="mark.up.label" /></label>
                                            <input type="text" class="form-control allField" readonly="readonly" name="markUp" id="markUp" value="${sku.markUp}" required placeholder="<spring:message code="enter.mark.up.label" />" />
										</div></div>
										 <div class=" col-lg-2" style="padding-left:0px">
                                          <div class="form-group col-lg-8 col-sm-12">
                                            <label><spring:message code="mark.down.label" /></label>
                                            <input type="text" class="form-control allField" readonly="readonly" name="markDown" id="markDown" value="${sku.markDown}" required  placeholder="<spring:message code="enter.mark.down.label" />"  />
										</div></div>
                                      <div class=" col-lg-2" style="padding-left:0px">
                                      <div class="form-group col-lg-10 col-sm-12">
                                            <label><spring:message code="running.plunumber.label" /> <span style="color:red; font-size:2">*</span></label>
                                            <select class="form-control" disabled="disabled" id="runningPlu">
                                             <c:forEach var="plu" items="${sku.warehouseSkuPriceLists}">
													<option value="${plu.pluCode == sku.runningPluNumber ? 'selected' : ''}">${plu.pluCode}</option>
												</c:forEach>
                                            </select>
                                        	<span id="runningPluError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
										</div>
										 </div>
										  <div class=" col-lg-2" style="padding-left:0px">
                                          <div class="form-group col-lg-9 col-sm-12">
                                            <label><spring:message code="status.label" /></label>
                                            <select class="form-control" name="status" disabled="disabled" id="status">
                                            <option value="Active" ${sku.status == 'Active' ? 'selected' : ''}>Active</option>
                                            <option value="Disabled" ${sku.status == 'Disabled' ? 'selected' : ''}>Disabled</option>
                                            <option value="Discontinued" ${sku.status == 'Discontinued' ? 'selected' : ''}>Discontinued</option>
                                            </select>
                                         </div>
										 </div>
                                    </div>
                                   <div class="row" style="white-space:nowrap;"> 
                                     <div class=" col-lg-2" style="padding-left:0px">
                                          <div class="form-group col-lg-9 col-sm-12">
                                            <label><spring:message code="open.rate.label" /></label>
                                            <input type="text" readonly="readonly" class="form-control allField" name="openRate" id="openRate" value="${sku.openRate}" placeholder="<spring:message code="enter.open.rate.label" />" oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');" />
                                        	<span id="colorError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
										</div></div>
                                      <div class=" col-lg-2" style="padding-left:0px">
                                          <div class="form-group col-lg-8 col-sm-12">
                                            <label><spring:message code="last.cost.label" /></label>
                                            <input type="text" readonly="readonly" class="form-control allField" name="lastCost" id="lastCost" value="${sku.lastCost}"  placeholder="<spring:message code="enter.last.cost.label" />" oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');" />
                                        	<span id="lastCostError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
                                        </div></div>
                                        <div class=" col-lg-2" style="padding-left:0px">
                                          <div class="form-group col-lg-7 col-sm-12">
                                            <label><spring:message code="average.cost.label" /></label>
                                            <input type="text" readonly="readonly" class="form-control allField" name="averageCost" id="averageCost" value="${sku.avgCost}" required placeholder="<spring:message code="enter.average.cost.label" />" oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');" />
                                        	<span id="averageCostError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
                                         </div></div>
                                       <div class=" col-lg-2" style="padding-left:0px">
                                          <div class="form-group col-lg-8 col-sm-12">
                                            <label><spring:message code="minimum.price.label" /></label>
                                            <input type="text" readonly="readonly" class="form-control allField" name="minPrice" id="minPrice" value="${sku.minimumPrice}" required placeholder="<spring:message code="enter.minimum.price.label" />" oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');" />
                                        	<span id="minPriceError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
                                         </div></div>
                                        <div class=" col-lg-2" style="padding-left:0px">
                                          <div class="form-group col-lg-9 col-sm-12">
											<label><spring:message code="just.in.time.orders.label" /></label>
                                            <select class="form-control" disabled="disabled" name="jitStock" id="jitStock">
													<option value="true" ${sku.jitStock == true ? 'selected' : ''}>Yes</option>
													<option value="false" ${sku.jitStock == false ? 'selected' : ''}>No</option>
                                            </select>
										</div></div>
                                      <div class=" col-lg-2" style="padding-left:0px">
                                          <div class="form-group col-lg-9 col-sm-12">
                                    		<label><spring:message code="zero.stock.orders.label" /></label>
                                            <select class="form-control" disabled="disabled" name ="zeroStock" id="zeroStock">
													<option value="true" ${sku.zeroStock == true ? 'selected' : ''}>Yes</option>
													<option value="false" ${sku.zeroStock == false ? 'selected' : ''}>No</option>
                                            </select>
                                        </div></div>
                                         </div>
                                      
                                      
                                      
                                      
						     
                                      	<div class="row">
								<div class="form-group col-lg-2">
									<label><spring:message code="primaryDepartment.label" />
										<!-- <span style="color:red; font-size:2">*</span> --></label> <input
										type="text"
										class="form-control allField searchItems searchBar" value="${sku.primaryDepartment}"
										id="primaryDepartment" disabled="disabled"
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
									<label><spring:message code="trackingRequired.label" /></label>
									<div class="col-lg-10" style="padding-left: 0px">
										<select class="form-control" name="itemTrackRequired" disabled id="itemTrackRequired">
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
									<label><spring:message code="picklist.label" /></label>
									<div class="col-lg-10" style="padding-left: 0px">
										<select class="form-control" disabled name="itemPickListRequired" id="itemPickListRequired">
											<option value="true"
												${sku.picklistItem == true ? 'selected' : ''}><spring:message
													code="yes.label" /></option>
											<option value="false"
												${sku.picklistItem == false ? 'selected' : ''}><spring:message
													code="no.label" /></option>
										</select>
									</div>
								</div>
								
									<div class="col-lg-2" style="padding-right: 10px;">
								<div class="row">
										<div class="form-group col-lg-12">
											<label>Theme</label>
											
												<input type="text" id="skutheme" readonly placeholder="Theme" class="form-control allField" value="${sku.theme}"/>
											
											<span id="skuThemeError"
												style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
										</div>
									</div>
								</div>
								
								<div class="col-lg-2" style="padding-right: 10px;">
								<div class="row">
										<div class="form-group col-lg-12">
											<label>Sub Theme</label>
											
												<input type="text" id="skuSubtheme" readonly placeholder="Sub Theme" class="form-control allField" value="${sku.subTheme}"/>
											
											<span id="skuSubthemeError"
												style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
										</div>
									</div>
								</div>
								
								
							</div>
                                          
                                 
                               
                                      
                                      
                                      
                                      	<div class="row">
								<div class="form-group col-lg-2">
									<label><spring:message code="alternate.sku.label" /></label> <input
										type="text" class="form-control allField" name="alternate_sku"
										id="alternate_sku" value="" disabled="disabled"
										placeholder="<spring:message code="alternate.sku.description.label" />" />
								</div>

								<div class="form-group col-lg-2">
									<label><spring:message code="season.code.label" /></label> <input
										type="text" class="form-control allField" name="season_code" disabled="disabled"
										id="season_code" value=""
										placeholder="<spring:message code="season.code.description.label" />" />
								</div>

								<div class="form-group col-lg-2">
									<label><spring:message code="alias.name.label" /></label> <input
										type="text" class="form-control allField" name="alias_name" disabled="disabled"
										id="alias_name" value="${sku.aliasName}"
										placeholder="<spring:message code="alias.name.description.label" />" />
								</div>

								<div class="form-group col-lg-2">
									<label><spring:message code="item.type.label" /></label> <input
										type="text" class="form-control allField"  name="item_type"
										id="item_type" value="${sku.itemType}" disabled="disabled"
										placeholder="<spring:message code="item.type.description.label" />" />
								</div>

								<div class="form-group col-lg-2">
									<label><spring:message code="item.design.label" /></label> <input
										type="text" class="form-control allField" name="item_design"
										id="item_design" value="${sku.itemDesign}" disabled="disabled"
										placeholder="<spring:message code="item.design.description.label" />" />
								</div>
								
								
								<div class="form-group col-lg-2">
									<label><spring:message code="manufactureItem.label" />
										<!-- <span style="color:red; font-size:2">*</span> --></label>
									<div class="col-lg-10" style="padding-left: 0px">
										<select class="form-control" name="manufactureItem"
											id="manufactureItem" disabled="disabled">
											<option value="true" ${sku.manufacturedItem == true ? 'selected' : ''}><spring:message
													code="yes.label" /></option>
											<option value="false" ${sku.manufacturedItem == false ? 'selected' : ''}><spring:message
													code="no.label" /></option>

										</select>
									</div>
								</div>

							</div>
                                        
                                          
                                      
                                     			<div class="row">
								<div class="form-group col-lg-2">
									<label><spring:message code="batch.required.label" />
										</label>
									<select class="form-control" name="batchrequired" id="batchrequired">
											<option value="false" ${sku.batchRequired == false ? 'selected' : ''}><spring:message
													code="no.label" /></option>
											<option value="true" ${sku.batchRequired == true ? 'selected' : ''}><spring:message
													code="yes.label" /></option>
										</select>
								</div>
	                          <div class="form-group col-lg-2">
									<label>Expiry Tolerance</label> <input
										type="number" class="form-control allField" name="expirytolerance" onblur="criteria(this)"
										id="expirytolerance" value="${sku.dispatchExpiryTolerance}"
										placeholder="" />
								</div>

								<div class="form-group col-lg-2">
										<label><spring:message code="product.handing.label" />
										</label>
									<input type="text" id="productHandingDetail"  onblur="criteria(this)" 
										name="productHanding" style="resize: none;"
										class="form-control allField"  value="${sku.productHandlng}"
										placeholder="<spring:message code="enter.product.handing.label" />">
								</div>

							
						
								

							</div>             
                                        
                                      
                                      
                                      
                               
							<div class="row">
								<div class="form-group col-lg-2" style="text-align: center;">
									<div class="icon-remove blue delete" id="picture1_image">
										<c:if test="${sku.picture1 != ''}">
											<%-- <img class="thumbnail" id="picture1_thumbnail" src="data:image/jpeg;base64,${sku.strPicture1}" style="width:100px;height:100px;"/> --%>
											<img class="thumbnail" id="picture1_thumbnail"
												src="${sku.picture1}" style="width: 100px; height: 100px;" />
										</c:if>
									</div>
								</div>
								<div class="form-group col-lg-2" style="text-align: center;">
									<div class="icon-remove blue delete" id="picture2_image">
										<c:if test="${sku.picture2 != ''}">
											<%-- <img class="thumbnail" id="picture2_thumbnail" src="data:image/jpeg;base64,${sku.strPicture2}" style="width:100px;height:100px;"> --%>
											<img class="thumbnail" id="picture2_thumbnail"
												src="${sku.picture2}" style="width: 100px; height: 100px;" />
										</c:if>
									</div>
								</div>
								<div class="form-group col-lg-2">
									<div class="icon-remove blue delete" id="picture3_image"
										style="text-align: center;">
										<c:if test="${sku.picture3 != ''}">
											<%-- <img class="thumbnail" id="picture3_thumbnail" src="data:image/jpeg;base64,${sku.strPicture3}" style="width:100px;height:100px;" /> --%>
											<img class="thumbnail" id="picture3_thumbnail"
												src="${sku.picture3}" style="width: 100px; height: 100px;" />
										</c:if>
									</div>
								</div>
                                       <div class="form-group col-lg-2">
                                        	<div class="checkbox" style="padding-left: 20px;margin-top: 0px;">
                                        		<c:if test="${sku.nonTaxable == true}">
                                        			<input type="checkbox" disabled="disabled" id="nonTaxable" checked> Non Taxable
		                                    	</c:if>
		                                    	<c:if test="${sku.nonTaxable == false}">
		                                    		<input type="checkbox" disabled="disabled" id="nonTaxable" > Non Taxable
		                                    	</c:if>
                                        	</div> 
                                        	<div class="checkbox" style="padding-left: 20px;margin-top: 20px;">
                                        		<c:if test="${sku.discountable == true}">
                                        			<input type="checkbox" disabled="disabled" id="discountable" checked> Discountable
		                                    	</c:if>
		                                    	<c:if test="${sku.discountable == false}">
		                                    		<input type="checkbox" disabled="disabled" id="discountable" > Discountable
		                                    	</c:if>
                                        	</div> 
                                        	<div class="checkbox" style="padding-left: 20px;margin-top: 20px;">
                                        		<c:if test="${sku.allowDecimals == true}">
                                        			<input type="checkbox" disabled="disabled" id="allowDecimals" checked> Allow Decimals
		                                    	</c:if>
		                                    	<c:if test="${sku.allowDecimals == false}">
		                                    		<input type="checkbox" disabled="disabled" id="allowDecimals" > Allow Decimals
		                                    	</c:if>
                                        	</div> 
                                         </div>
                                        <div class="form-group col-lg-2">
                                          <label><spring:message code="location.label" /> <span style="color:red; font-size:2">*</span></label>
                                        	<select class="form-control" onchange="addSelectedLocation();" disabled id="location" multiple="multiple" style="height: 91px;">
		                                        <c:forEach var="location" items="${workLocationsList}">
													<option value="${location}">${location}</option>
												</c:forEach>
                                        	</select>
                                        	<input type="hidden" id="selectedStoreLocation" value="${sku.selectedLocationsList}">
                                        	<span id="locationError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
                                         </div>
                                         <div class="col-lg-2">
                                         <div class="row">
                                          <div class="form-group col-lg-12">
                                            <label><spring:message code="created.date.label" /></label>
                                             <div class="input-group">
	                                            <div class="input-group-addon">
	                                                <i class="fa fa-calendar"></i>
	                                            </div>
	                                            <input type="text" id="createdDate" readonly="readonly" value="${sku.created_date}" class="form-control dat" data-inputmask="'alias': 'dd/mm/yyyy'" data-mask/>
	                                        </div>
                                        	<span id="createDateError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
											</div>
										  </div>
                                        <div class="row">
                                        <div class="form-group col-lg-12">
                                            <label><spring:message code="last.updated.label" /></label>
                                             <div class="input-group">
	                                            <div class="input-group-addon">
	                                                <i class="fa fa-calendar"></i>
	                                            </div>
	                                          <input type="text" id="lastUpdated" readonly="readonly" value="${sku.updated_date}" class="form-control dat" data-inputmask="'alias': 'dd/mm/yyyy'" data-mask/>
	                                        </div>
                                        	<span id="lastUpdatedError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
                                        </div>
                                        </div>
                                      </div>
                                      </div>
                                      <div class="row">
	                                        <div class="form-group col-lg-12">
		                                        <label><spring:message code="short.description.label" /> <span style="color:red; font-size:2">*</span></label>
		                                        <textarea rows="2" id="shortDescription" readonly="readonly" name="shortDescription" style="resize: none;" class="form-control allField" placeholder="<spring:message code="enter.short.description.label" />" >${sku.description}</textarea>
		                                        <span id="shortDescriptionError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
	                                        </div>
                                        </div>
                                        <div class="row">
                                         <div class="form-group col-lg-12">
                                            <label><spring:message code="warranty.details.label" /></label>
                                            <textarea rows="2" class="form-control allField" readonly="readonly" name="warrantyDetails" style="resize: none;" id="warrantyDetails" required placeholder="<spring:message code="enter.warranty.details.label" />" >${sku.warantyDetails}</textarea>
                                        	<span id="warrantyDetailsError"  style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
                                         </div>
                                        </div>
                                <div class="row" >
				                  <div class="col-lg-12"  >
				                    <div class="form-group col-lg-8" style="padding-left: 1px;padding-right: 1px;margin-top: 8px;cursor: pointer;margin-bottom: 0px;" >
				                    	<span style="font-weight: bold;font-size: 16px;color:#666;cursor: pointer;text-align: left;">
				                    		<spring:message code="price.list.label" />
				                    	</span>
				                    </div>
				                     <div class="form-group col-lg-4" style="margin-bottom: 4px;">
				                    	<img style="float: right;cursor: pointer;margin-right: -16px;margin-top: 0px;margin-bottom: -26px" onclick="activateHeader('priceList');" id="priceListImg" alt="" src="${pageContext.request.contextPath}/images/leftHeaderIconGreen.png">
				                     </div> 
				                    <hr style="margin-top: 31px;width: 100%;border-top: 1px solid rgb(181,230,29);" />
				                    <hr style="margin-top: -18px;width: 100%;border-top: 1px solid rgb(181,230,29);" />
				                    </div>
				                </div>
                                <div class="priceList">
                                <div class="row">
                                	<div class="col-lg-3 form-group">
                                		<div class="col-lg-12" style="border: 1px solid #CCC;">
                                		<!-- <br> -->
	                                		<input type="radio" style="visibility: hidden;" name="priceListType" value="all">
					                    	<input type="radio" style="visibility: hidden;" name="priceListType" checked="checked" value="specific">
	                                		<%-- <spring:message code="specific.location.label" />&nbsp;&nbsp;&nbsp;<input type="checkbox" checked="checked" disabled="disabled" style="vertical-align: -3px;" id="specific" onchange="changePriceListType(this);">
	                                		<br><br><br> --%>
	                                		<label><spring:message code="specific.location.label" /></label>
	                                		<select style="margin-top: -2px;" class="form-control" id="selectedLocation" onchange="getPriceListForSelectedLocation(this);">
	                                			
	                                		<c:forEach var="selectedLocation" items="${sku.selectedLocationsList}">
													<option value="${selectedLocation}">${selectedLocation}</option>
												</c:forEach>
	                                	
	                                			</select>
	                                			
	                                	<!-- 	   <c:forEach var="sl" items="${sku.warehouseSkuPriceLists}">
													<option value="${sl.storeLocation}"></option>
												</c:forEach>	                                		
	                           	<c:forEach var="plu" items="${sku.warehouseSkuPriceLists}">
													<option value="${plu.storeLocation == sku.storeLocation ? 'selected' : ''}">${plu.storeLocation}</option>
												</c:forEach> -->	
	                                	
	                                		
	                                		<!--	 <c:forEach var="sl" items="${sku.warehouseSkuPriceLists}">
													<option value="${sl.storeLocation}">${storeLocation}</option>
												</c:forEach>-->
												
												
												
	                                	
	                                		<br>
                                		</div>
                                	</div>
                                
                                	<div class="col-lg-3 form-group">
                                		<div class="col-lg-12" style="border: 1px solid #CCC;text-align: center;">
                                			<label><spring:message code="product.range.label" /> </label>
                                            <%-- <input type="text" class="form-control" value="" id="productRangeTextBox"  />
	                                			<img style="cursor: pointer;width: 30px;" onclick="appendProductRange();" src="${pageContext.request.contextPath}/images/RedPlus.png">
	                                		<br> --%>
	                                		<select style="" class="form-control" disabled id="productRangeDropDown" >
	                                			<c:forEach var="productRange" items="${sku.productRangeList}">
													<option value="${productRange}">${productRange}</option>
												</c:forEach>
	                                		</select>
	                                		<br>
                                		</div>
                                	</div>
                                	
                                	<div class="col-lg-3 form-group">
                                		<div class="col-lg-12" style="border: 1px solid #CCC;text-align: center;">
                                			<label><spring:message code="measurement.range.label" /> </label>
                                            <%-- <input type="text" class="form-control" value="" id="measurementRangeTextBox"  />
	                                			<img style="cursor: pointer;width: 30px;" onclick="appendMeasurementRange();" src="${pageContext.request.contextPath}/images/RedPlus.png">
	                                		<br> --%>
	                                		<select style="" class="form-control" disabled id="measurementRangeDropDown" >
	                                			<c:forEach var="measureRange" items="${sku.measurementRangeList}">
													<option value="${measureRange}">${measureRange}</option>
												</c:forEach>
	                                		</select>
	                                		<br>
                                		</div>
                                	</div>
                                
                                
                                
                                	<div class="col-lg-3 form-group">
                                		<div class="col-lg-12" style="border: 1px solid #CCC;text-align: center;">
                                			<label ><spring:message code="batch.label" />
<!--                                           <input type="text" class="form-control" value="" id="batchRangeTextBox" /> -->
	                                			<%--  <img style="cursor: pointer; width: 28px;    padding-right: 0px;"
												onclick="appendBatch();" src="${pageContext.request.contextPath}/images/RedPlus.png"> --%>
	                                		<br>
	                                	 <select class="form-control" disabled id="batchRangeDropDown">
	                                	 <c:forEach var="batchRange" items="${sku.batchRangeList}">
													<option value="${batchRange}">${batchRange}</option>
										</c:forEach>
	                                	 </select>
	                                		<br>
                                		</div>
                                	</div>
                                
                                
                                
                                </div>
                                <div class="row" style="">
                                <div class="col-md-10 priceListForLocation">
                                 <div class="AllLocation priceListLocationDiv"></div>
                                  <c:forEach var="selectedLocationId" items="${sku.selectedLocationsIdList}" varStatus="locationCount">
                              
                                 <div class="${selectedLocationId} priceListLocationDiv">
                                 <c:set var="priceListCount" value="1"></c:set>
                                 <c:forEach var="plu" items="${sku.warehouseSkuPriceLists}" varStatus="theCount">
                                
                                    <div class="pricelist" id="pricelist${selectedLocationId}${priceListCount}">   
                                     <div class="row-fluid-5">
                                      <div class="form-group span2">
                                      		<input type="hidden" id="productRange${selectedLocationId}${priceListCount}" value="${plu.productRange}">
                                      		<input type="hidden" id="measurementRange${selectedLocationId}${priceListCount}" value="${plu.measureRange}">
                                            <label><spring:message code="cost.price.label" /> <span style="color:red; font-size:2">*</span></label>
                                            <input type="hidden" class="form-control allField req" id="pluStoreLocation${selectedLocationId}${priceListCount}" value="${plu.storeLocation}" />
                                            <input type="text" class="form-control allField req pluCost" onkeydown="clearError(this);" onblur="calcMarkUp(this);" id="pluCostPrice${selectedLocationId}${priceListCount}" value="${plu.costPrice}" oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');" placeholder="<spring:message code="enter.cost.price.label" />" />
                                        	<span id="pluCostPrice${selectedLocationId}${priceListCount}Error" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
										</div>
                                        <div class="form-group span2">
                                            <label><spring:message code="price.label" /> <span style="color:red; font-size:2">*</span></label>
                                            <input type="text" class="form-control allField req" disabled onkeydown="clearError(this);" id="pluPrice${selectedLocationId}${priceListCount}" value="${plu.price}" oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');" placeholder="<spring:message code="enter.price.label" />" />
                                        	<span id="pluPrice${selectedLocationId}${priceListCount}Error" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
                                        </div>
                                        <div class="form-group span2">
                                            <label><spring:message code="sale.price.label" /> <span style="color:red; font-size:2">*</span></label>
                                            <input type="text" class="form-control allField req pluSale" disabled onkeydown="clearError(this);" onblur="calcMarkUp(this);" id="pluSalePrice${selectedLocationId}${priceListCount}" value="${plu.salePrice}" oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');" placeholder="<spring:message code="enter.sale.price.label" />" />
                                        	<span id="pluSalePrice${selectedLocationId}${priceListCount}Error" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
                                         </div>
                                       
                                         <div class="form-group span2">
                                            <label><spring:message code="ws.price.label" /> <span style="color:red; font-size:2">*</span></label>
                                            <input type="text" class="form-control allField req " disabled onkeydown="clearError(this);" id="pluWsPrice${selectedLocationId}${priceListCount}" value="${plu.wholesalePrice}" oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');" placeholder="<spring:message code="enter.ws.price.label" />" />
                                        	<span id="pluWsPrice${selectedLocationId}${priceListCount}Error" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
                                         </div>
                                         <div class="form-group span2">
                                            <label><spring:message code="extra.price.label" /></label>
                                            <input type="text" class="form-control allField" disabled onkeydown="clearError(this);" id="pluExtraPrice${selectedLocationId}${priceListCount}" value="${plu.extraPrice}" oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');" placeholder="<spring:message code="enter.extra.price.label" />" />
                                        	<span id="pluExtraPrice${selectedLocationId}${priceListCount}Error" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
										</div>
                                      </div> 
                                       <div class="row-fluid-5">
                                       <div class="form-group span2">
                                       		<label><spring:message code="ean.label" /></label>
                                            <input type="text" class="form-control allField"  disabled id="ean${selectedLocationId}${priceListCount}" value="${plu.ean}" placeholder="<spring:message code="enter.ean.label" />" />
                                            <%-- <label><spring:message code="plu.code.label" /> <span style="color:red; font-size:2">*</span></label>
                                            <input type="text" class="form-control allField pluCode" readonly="readonly" id="pluCode${selectedLocationId}${priceListCount}" value="${plu.pluCode}"  /> --%>
										</div> 
                                       <div class="form-group span2">
                                            <label><spring:message code="created.date.label" /></label>
                                            <div class="input-group">
	                                            <div class="input-group-addon">
	                                                <i class="fa fa-calendar"></i>
	                                            </div>
	                                            <input type="text" id="pluCreatedDate${selectedLocationId}${priceListCount}" value="${plu.created_date}"  disabled readonly="readonly" class="form-control dat" data-inputmask="alias: dd/mm/yyyy" data-mask/>
	                                        </div>
                                            <span id="pluCreatedDate${selectedLocationId}${priceListCount}Error" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
										</div>
                                      <div class="form-group span2">
                                            <label><spring:message code="updated.date.label" /></label>
                                            <div class="input-group">
	                                            <div class="input-group-addon">
	                                                <i class="fa fa-calendar"></i>
	                                            </div>
	                                            <input type="text" id="pluUpdatedDate${selectedLocationId}${priceListCount}" value="${plu.updated_date}" disabled readonly="readonly" class="form-control dat" data-inputmask="alias: dd/mm/yyyy" data-mask/>
	                                        </div>
                                        	<span id="pluUpdatedDate${selectedLocationId}${priceListCount}Error" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
										</div>
                                        <div class="form-group span2">
                                            <label><spring:message code="expiry.date.label" /></label>
                                            <div class="input-group">
	                                            <div class="input-group-addon">
	                                                <i class="fa fa-calendar"></i>
	                                            </div>
	                                            <input class="form-control allField req dat" onchange="test()" disabled readonly="readonly" style="background-color: white;" id="pluExpiryDate${selectedLocationId}${priceListCount}" value="${plu.expiry_date}" disabled size="20" type="text" onfocus="callCalender('pluExpiryDate${selectedLocationId}${priceListCount}')" onclick="callCalender('pluExpiryDate${selectedLocationId}${priceListCount}')" placeholder="DD/MM/YYYY"/>
	                                        </div>
                                        	<span id="pluExpiryDate${selectedLocationId}${priceListCount}Error" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
                                        </div>
                                         <div class="form-group span2">
                                            <label><spring:message code="size.label" /></label>
                                            <input type="text" class="form-control allField" onkeydown="clearError(this);" disabled id="pluSize${selectedLocationId}${priceListCount}" value="${plu.size}" placeholder="<spring:message code="enter.size.label" />" />
                                        	<span id="pluSize${selectedLocationId}${priceListCount}Error" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
										</div>
                                      </div> 
                                      <div class="row-fluid-5">
                                       <div class="form-group span2">
                                            <label><spring:message code="color.label" /></label>
                                            <input type="text" class="form-control allField" onkeydown="clearError(this);" id="pluColor${selectedLocationId}${priceListCount}" disabled value="${plu.color}" placeholder="<spring:message code="enter.color.label" />" />
                                            <span id="pluColor${selectedLocationId}${priceListCount}Error" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
										</div>
                                      <div class="form-group span2">
                                            <label><spring:message code="color.shade.label" /></label>
                                            <input type="text" class="form-control allField" onkeydown="clearError(this);"  disabled id="pluColorShade${selectedLocationId}${priceListCount}" value="${plu.colorShade}" placeholder="<spring:message code="enter.color.shade.label" />" />
                                        	<span id="pluColorShade${selectedLocationId}${priceListCount}Error" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
										</div>
                                        <div class="form-group span2">
                                            <label><spring:message code="mbq.label" /></label>
                                            <input type="text" class="form-control allField" onkeydown="clearError(this);"  disabled id="pluMbq${selectedLocationId}${priceListCount}" value="${plu.mbq}" placeholder="<spring:message code="enter.mbq.label" />" />
                                        	<span id="pluMbq${selectedLocationId}${priceListCount}Error" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
                                        </div>
                                      
                                          <div class="form-group span2">
                                            <label><spring:message code="quantity.in.hand.label" /> <span style="color:red; font-size:2">*</span></label>
                                            <input type="text" class="form-control allField req" onkeydown="clearError(this);" disabled id="pluQuantity${selectedLocationId}${priceListCount}" value="${plu.quantityInHand}" oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');" placeholder="<spring:message code="enter.quantity.in.hand.label" />" />
                                            <span id="pluQuantity${selectedLocationId}${priceListCount}Error" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
										</div>
                                         <div class="form-group span2">
                                            <label><spring:message code="acp.label" /></label>
                                            <input type="text" class="form-control allField" onkeydown="clearError(this);"  disabled id="pluAcp${selectedLocationId}${priceListCount}" value="${plu.acp}" placeholder="<spring:message code="enter.acp.label" />" />
                                        	<span id="pluAcp${selectedLocationId}${priceListCount}Error" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
                                         </div>
                                         </div>
                                         
                                           <div class="row-fluid-5">
                                         <div class="form-group span2">
                                           
                                            <label>Material Type</label>
                                            <input type="text"  onblur="criteria(this)"  readonly="readonly" class="form-control allField" onkeydown="clearError(this);" id="pluMaterialtype${selectedLocationId}${priceListCount}" placeholder="Material Type" value="${plu.materialType}"/>
                                        	<span id="pluMaterialtype${selectedLocationId}${priceListCount}Error" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
                                        
                                           
                                           </div>
                                           
                                           <div class="form-group span2">
									<label>Zero Stock Billing</label>
									<div class="col-lg-10" style="padding-left: 0px">
										<select class="form-control" readonly="readonly" name="zeroStockbilling${selectedLocationId}${priceListCount}" id="zeroStockbilling${selectedLocationId}${priceListCount}">
											<option value="true" ${plu.zeroStockBilling == true ? 'selected' : ''}><spring:message
													code="yes.label" /></option>
							 				<option value="false" ${plu.zeroStockBilling == false ? 'selected' : ''}><spring:message
													code="no.label" /></option>
										</select>
									</div>
								</div>
                                         
                                         <div class="form-group span2">
									<label><spring:message code="status.label" /></label>
									<div class="col-lg-10" style="padding-left: 0px">
										<select class="form-control" readonly="readonly" disabled name="skuStatus${selectedLocationId}${priceListCount}" id="skuStatus${selectedLocationId}${priceListCount}">
											<option value="true" ${plu.sku_status == true ? 'selected' : ''}>Active</option>
											<option value="false" ${plu.sku_status == false ? 'selected' : ''}>InActive</option>
										</select>
									</div>
								</div>  
                                           
                                           
                                       </div> 
                                         
                                         
                                         
                                         <div class="row">
                                         <div class="form-group col-lg-12">
                                            <label><spring:message code="description.label" /> <span style="color:red; font-size:2">*</span></label>
                                            <textarea rows="2" class="form-control allField" onkeydown="clearError(this);" disabled id="pluDesc${selectedLocationId}${priceListCount}" style="resize: none;" required placeholder="<spring:message code="enter.description.label" />" >${plu.description}</textarea>
                                        	<span id="pluDesc${selectedLocationId}${priceListCount}Error" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
                                         </div>
                                       </div> 
                                     </div>
                                      <c:set var="priceListCount" value="${priceListCount + 1}" />
                                  
                                     </c:forEach>
                                     </div>
                                    </c:forEach>
                                    </div>
                                  </div>
                                  
                                  
                                  
							<input type="hidden" id="outletCategory" value="${skuObj.productCategory}">
   <input type="hidden" id="outletBrandId" value="${skuObj.brandCode}">
    
     <input type="hidden" id="outletLocation" value="${skuObj.storeLocation}">
      <input type="hidden" id="outletSubcategory" value="${skuObj.subCategory}">
       <input type="hidden" id="outletDepartmentId" value="${skuObj.department}">
        <input type="hidden" id="outletSupplierId" value="${skuObj.supplierName}">
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
				
		<br/>
        <div class="box-footer"></div>
       
     </form>
     
   
</div>
                    
</div>

  <div class="row" style="text-align: right;">
							<input type="button" class="btnCls" style="margin-right: 2%;    margin-top: -3%;" onclick=" viewWarehouseSkuMaster('warehouseskumaster','0','');" value="<spring:message code="cancel.label" />" />
				</div>
</div>
</section><!-- /.content -->

</body>
</html>