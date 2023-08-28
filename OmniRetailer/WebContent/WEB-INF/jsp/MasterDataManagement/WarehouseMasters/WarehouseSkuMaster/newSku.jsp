<!--/*
 * Project Name 	        : OmniRetailerCustomer
 * Written By		        : Mythri
 * file name		        : Inventory Manager/master/newSku.jsp
 * file type		        : JSP
 * description				: The new Sku is displayed using this jsp
 * */ -->


<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
	<title>Home | Omni Retailer</title>
	<meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/controller.js"></script>
	 <script src="${pageContext.request.contextPath}/js/masterDataManagement/outletMasters/skuMaster.js"></script>
 <script src="${pageContext.request.contextPath}/js/form_plugin.js"></script>
 <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/jquery.calendars.picker.css">
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.calendars.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.calendars.plus.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.calendars.picker.js"></script>
	<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/masterDataManagement/genericMasters/employeeMaster.js"></script>
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
@media screen 
 and (max-width: 1440px) 
 and (min-width: 1280px) 
{ 
   .shademedia{
width:8%;
}

}
 @media screen (max-width: 600px){ /* spans reduce to 100px then go full width */

    .row-fluid-5 [class*="span"]{
    margin-left: 0;
    float: left;
    width: 100%;
    padding: 10px; 
    }
    }
   
 }
 @media (max-width: 1440px) and (min-width: 1240px)  {

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
  filter: alpha(opacity=0);
  cursor: pointer;
}


</style>

<!--  added by        :  koti bomminei
      description     :  to ristrict the user from entering special characters     -->

<script type="text/javascript">
	function criteria(str) {


		var x = $(str).val();
		if (x.includes("'") || x.includes("&") || x.includes("~")  || x.includes("%")  ){		
		
			alert("Special characters are not allowed!");
		  x=$(str).val("");

		}
		 $(str).val(x.trim());
	}
</script>
	
	


<script type="text/javascript">
$(document).ready(function(){
	$(this).scrollTop(0);
	callCalender('pluExpiryDateAllLocation1');
	$(".priceList").hide();
	var dateTime = getCurrentDate();
	var date = dateTime.split(' ');
	date = date[0].split('/');
	var formatedDate = date[1]+"/"+date[0]+"/"+date[2];
	$('#createdDate').val(formatedDate);
	$('#lastUpdated').val(formatedDate);
	$('#pluCreatedDateAllLocation1').val(formatedDate);
	$('#pluUpdatedDateAllLocation1').val(formatedDate);
	setPriceListDivContent();
	$("select[multiple] option").prop("selected", "selected");
	var op = '';
	$("select[multiple] option").each(function(){
		op = op + '<option value="'+$(this).val()+'">'+$(this).val()+'</option>';
		var loc = $(this).val();
		loc = loc.replace(/ /g,'_');
		if($("div ."+loc).length == 0){
			$(".priceListForLocation").append("<div class='"+loc+" priceListLocationDiv' style='display:none;'></div>");
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
                                <br/>
                                <h3><spring:message code="new.sku.header.label" /></h3>
                                </div><!-- /.box-header -->
                                <!-- form start -->
                                <form id="newSku" method="post" >
                                    <div class="box-body">
                                   	<div class="row" style="text-align: right; margin-top: -27px;">
	                                  	<div id="Error" class="Error" style="text-align: center;color: red;font-size: 2;font-weight: bold;">${err}</div>
	         							<div id="Success" class="Error" style="text-align: center;color: blue;font-size: 2;font-weight: bold;">${success}</div>
	                                  	<input type="button" id="edit" style="position: relative;" class="btnCls" onclick="validateWarehouseSkuForm('new')" value="<spring:message code="submit.label" />" />
									  	<input type="button" id="edit"  class="btnCls" style="margin-left:1%;margin-right:1%;" onclick="resetAll();" value="<spring:message code="reset.label" />" />
									    <c:if test="${sessionScope.role == 'super admin'}">
									    	<input type="button" class="btnCls" style="margin-right: 1%;position: relative;background-color:#6c6c6c !important;" onclick="viewWarehouseSkuMaster('warehouseskumaster','0','');" value="<spring:message code="cancel.label" />" />
									    </c:if>
									 <c:forEach var="accessControl" items="${sessionScope.warehouseMasterSettings}">
                      					<c:if test="${accessControl.appDocument == 'WarehouseSkuMaster' && accessControl.write == true && accessControl.read == true}">
									  	<input type="button" class="btnCls" style="margin-right: 1%;" onclick="viewWarehouseSkuMaster('warehouseskumaster','0','');" value="<spring:message code="cancel.label" />" />
									  	</c:if>
									  </c:forEach>
										<hr style="margin-top: 4px;width: 99%;" />
									</div>
								<input type="hidden" class="allField" id="warehouseskupricelist" value="">
                                   	<div class="row">
                                        <div class="form-group col-lg-2">
                                        	<label><spring:message code="skuid.label" /> <span style="color:red; font-size:2">*</span></label>
	                                        <input type="text"  onblur="criteria(this)" class="form-control allField"  id="skuId" value="${warehousesku.skuId}" oninput="this.value = this.value.replace(/[^a-zA-Z0-9 -]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');" placeholder="<spring:message code="enter.sku.id.label" />" />
	                                        <span id="skuIdError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
										</div>
										<div class="form-group col-lg-2">
                                        	<label><spring:message code="product.name.label" /> <span style="color:red; font-size:2">*</span></label>
	                                        <input type="text"  onblur="criteria(this)"  class="form-control allField " id="searchItems" value="${warehousesku.productCategory}" placeholder="<spring:message code="search.product.label" />" style="height:30PX;" />
											<!-- <div class="services">
									    		<div class="items">
									     			<ul class="matchedStringUl productNameSku" style=""></ul>
									   			</div>
											</div> -->
	                                        <span id="productNameDetailError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
											<input type="hidden"  onblur="criteria(this)" class="allField" id="productId" value="${warehousesku.productId}">
										</div>
										<div class="form-group col-lg-2">
                                    		<label><spring:message code="category.name.label" /></label>
<%--                                             <input type="text"  onblur="criteria(this)" class="form-control allField" readonly="readonly" id="categoryName" name="categoryName" value="" required placeholder="<spring:message code="category.name.label" />" />
 --%>                                            
                                            <select class="form-control allField"  id="categoryName" name="categoryName"  onchange="searchSubCategories('categoryName','subCategoryName')">
	                             <c:forEach var="categoryList" items="${categoryList}">
									<option value="${categoryList.categoryName}" ${categoryList.categoryName == sku.productCategory ? 'selected' : ''} id="${categoryList.categoryName}" >${categoryList.categoryName}</option>
						 		</c:forEach>
	                        </select>
                                            
                                            
                                            
                                            <input type="hidden"  onblur="criteria(this)" id="categoryId" name="categoryId" value="${warehousesku.category}" />
                                            <span id="eanError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
                                        </div>
                                        <div class="form-group col-lg-2">
                                    		<label><spring:message code="sub.category.name.label" /></label>
<%--                                             <input type="text"  onblur="criteria(this)" class="form-control allField" readonly="readonly" id="subCategoryName" name="subCategoryName" value="${sku.subCategoryName}" required placeholder="<spring:message code="sub.category.name.label" />" />
 --%>                                       
                                        <select class="form-control" id="subCategoryName" name="subCategoryName" >
	                          <c:forEach var="subCategoryDetailsList" items="${subCategoryDetailsList}">
									<option value="${subCategoryDetailsList.subcategoryName}" ${subCategoryDetailsList.subcategoryName == sku.subCategory ? 'selected' : ''} id="${subCategoryDetailsList.subcategoryName}" >${subCategoryDetailsList.subcategoryName}</option>
						 		</c:forEach>
	                        </select>
                                       
                                       
                                       
                                            <span id="eanError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
                                        </div>
                                    	<div class="form-group col-lg-2">
                                    		<label><spring:message code="ean.label" /></label>
                                            <input type="text"  onblur="criteria(this)" class="form-control allField"  id="ean" name="ean" value="" required placeholder="<spring:message code="enter.ean.label" />" />
                                            <span id="eanwarehouseError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
                                        </div>
                                        <div class="form-group col-lg-2">
											<label><spring:message code="supplier.name.label" /> <span style="color:red; font-size:2">*</span></label>
                                            <input type="text"   class="form-control allField searchItems" value="${warehousesku.supplierName}" name="supplier_name" id="searchSupplier" placeholder="<spring:message code="search.supplier.label" />" style="height:30PX;border-radius: 6px !important;background:url(${pageContext.request.contextPath}/images/search.png) no-repeat;background-position:right;" />
											<div class=services>
										    		<div class="items">
										     			<ul class="matchedStringUl supplier" style="width: 89%!important;padding: 0px!important;"></ul>
										   			</div>
												</div>
											<span id="supplierNameError" style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
											<input type="hidden"  onblur="criteria(this)" class="allField" name="supplier_Id" id="supplier_Id" value=""  />
										</div>
                                      </div>
                                      <div class="row">
                                     
										<div class=" col-lg-2">
											<label><spring:message code="manufacturer.code.label" /></label>
                                            <input type="text"  onblur="criteria(this)" class="form-control allField" name="manufacturerCode" id="manufacturerCode" value="" required placeholder="<spring:message code="enter.manufacturer.code.label" />" />
                                            <span id="manufacturerCodeError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
										</div>
                                    	<div class=" col-lg-2">
                                    		<label><spring:message code="manufacturer.name.label" /> <span style="color:red; font-size:2">*</span></label>
                                            <input type="text"  onblur="criteria(this)" class="form-control allField"  id="manufacturer" name="make" value="${warehousesku.make}" required placeholder="<spring:message code="enter.manufacturer.name.label" />" />
                                            <span id="manufacturerError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
                                        </div>
                                         <div class=" col-lg-2" style="padding-left:0px">
                                          <div class="form-group col-lg-8 col-sm-12">
                                            <label><spring:message code="uom.label" /> <span style="color:red; font-size:2">*</span></label>
                                             <select  class="form-control" id="uom">
                                             	<option value="KG">KG</option>
                                             	<option value="Grams">Grams</option>
                                             	<option value="Litres">Litres</option>
                                             	<option value="Millilitres">Millilitres</option>
	                                            <option value="Meters">Meters</option>
	                                            <option value="Pieces">Pieces</option>
	                                            <option value="Cases">Cases</option>
                                             </select>
                                         </div></div>
                                        
                                         <div class=" col-lg-2" style="padding-left:0px">
                                          <div class="form-group col-lg-9 col-sm-12">
                                            <label><spring:message code="uom.label.label" /></label>
                                            <input type="text"  onblur="criteria(this)" class="form-control allField" name="uomLabel" id="uomLabel" value=""  placeholder="<spring:message code="enter.uom.label.label" />" />
                                        	<span id="weightwarehouseError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
                                        </div></div>
                                          <div class=" col-lg-2" style="padding-left:0px">
                                          <div class="form-group col-lg-8 col-sm-12">
                                            <label><spring:message code="pack.size.label" /></label>
                                            <input type="text"  onblur="criteria(this)" class="form-control allField" name="packSize" id="packSize" value="${warehousesku.packSize}" required placeholder="<spring:message code="enter.pack.size.label" />" oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');" />
                                            <span id="packSizewarehouseError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
										</div>
										</div>
										<div class=" col-lg-2" style="padding-left:0px">
                                          <div class="form-group col-lg-8 col-sm-12">
                                             <label><spring:message code="retail.uom.label" /></label> 
                                             <select  class="form-control" id="retailuom">
                                             	<option value="KG">KG</option>
                                             	<option value="Grams">Grams</option>
                                             	<option value="Litres">Litres</option>
                                             	<option value="Millilitres">Millilitres</option>
	                                            <option value="Meters">Meters</option>
	                                            <option value="Pieces">Pieces</option>
	                                            <option value="Cases">Cases</option>
                                             </select>
                                         </div>
										
							</div>			
										
                                      </div>
                                      
                                      <div class="row">
                                    <div class="col-lg-2" style="padding-left:0px;padding-right:0px;">
                                          <div class="col-lg-9 col-sm-12">
                                    		<label><spring:message code="retail.units.label" /></label>
												<input  class="form-control"  onblur="criteria(this)" type="text" name ="retailunits" id="retailunits"/>
                                                <span id="retailunitsError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
                                        </div>
                                        
                                        </div>
										<div class="col-lg-2" style="padding-left:0px;pxpadding-right:0px;">
                                          <div class="form-group col-lg-10 col-sm-12">
                                    		<label><spring:message code="brand.code.label" /></label>
                                            <select class="form-control" id="brandCode">
                                             <c:forEach var="brandName" items="${brandsList}">
													<option value="${brandName}">${brandName}</option>
												</c:forEach>
                                            </select>
                                        </div></div>
                                    	<div class=" col-lg-2" style="padding-left:0px;padding-right:0px;">
                                          <div class="form-group col-lg-9 col-sm-12">
                                            <label><spring:message code="model.label" /></label>
                                            <input type="text"  onblur="criteria(this)" class="form-control allField" name="model" id="model" value="${warehousesku.model}"   placeholder="<spring:message code="enter.model.label" />"  />
                                        	<span id="modelwarehouseError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
										</div> </div>
                                       <div class=" col-lg-2" style="padding-left:0px;padding-right:0px;">
                                          <div class="form-group col-lg-9 col-sm-12">
                                            <label><spring:message code="color.label" /></label>
                                            <input type="text"  onblur="criteria(this)" class="form-control allField" name="color" id="color" value="${warehousesku.color}" placeholder="<spring:message code="enter.color.label" />" />
                                        	<span id="colorError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
                                          </div></div>
                                         <div class=" col-lg-2 a" style="padding-left:0px;;padding-right:0px;">
                                         <div class="form-group col-lg-9 col-sm-12">
                                         <label><spring:message code="Shade.label" /> </label>
                                            <input type="text"   onblur="criteria(this)" class="form-control allField"  id="shade" readonly name="minSaleQty" value="" required placeholder="<spring:message code="enter.shade.label" />" oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');" />
                                            <span id="ShadeError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
                                         </div>
                                         </div>
                                        <div class=" col-lg-2" style="padding-left:0px;;padding-right:0px;white-space:nowrap;">
                                          <div class="form-group col-lg-9 col-sm-12">
                                       <label><spring:message code="hsnCode.label" /> <span
										style="color: red; font-size: 2">*</span></label> 
                                            <input type="hidden"  onblur="criteria(this)" class="form-control allField" name="" id="patternCode" value="${warehousesku.patternCode}"  placeholder="<spring:message code="enter.pattern.code.label" />" />
                                               <input type="text"  onblur="criteria(this)" class="form-control allField" name="" id="hsnCode" value="${warehousesku.hsnCode}" required placeholder="<spring:message code="hsnCode.label" />" />
                                        	<span id="hsnCodeError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
                                         </div>
                                         </div>
                                      </div>
                                    
                                      <div class="row" style="white-space:nowrap;">
                                   <div class=" col-lg-2" style="padding-left:0px;padding-right:0px;">
                                          <div class="form-group col-lg-9 col-sm-12">
                                    		<label><spring:message code="min.sales.quantity.label" /> <span style="color:red; font-size:2">*</span></label>
                                            <input type="text"  onblur="criteria(this)" class="form-control allField"  id="minSaleQty" name="minSaleQty" value="" required placeholder="<spring:message code="enter.min.sales.quantity.label" />" oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');" />
                                            <span id="minSaleQtyError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
                                        </div>
                                     </div>
                                    
                                     <div class=" col-lg-2" style="padding-left:0px;padding-right:0px;">
                                          <div class="form-group col-lg-9 col-sm-12">
                                            <label><spring:message code="reorder.point.label" /></label>
                                            <input type="text"  onblur="criteria(this)"  class="form-control allField" name="reorderPoint" id="reorderPoint" value="${warehousesku.reorderPoint}" required oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');" placeholder="<spring:message code="enter.reorder.point.label" />" />
                                        	<span id="reorderPointError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
                                         </div></div>
                                         <div class=" col-lg-2" style="padding-left:0px;padding-right:0px;">
                                          <div class="form-group col-lg-7 col-sm-12">
                                            <label><spring:message code="order.quantity.label" /></label>
                                            <input type="text"  onblur="criteria(this)" class="form-control allField" name="orderQuantity" id="orderQuantity" value="${warehousesku.orderQuantity}" required oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');" placeholder="<spring:message code="enter.order.quantity.label" />" />
                                        	<span id="orderQuantityError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
                                         </div></div>
                                      	 <div class=" col-lg-2" style="padding-left:0px;padding-right:0px;">
                                          <div class="form-group col-lg-9 col-sm-12">
                                            <label><spring:message code="product.lead.time.label" /></label>
                                            <input type="text"  onblur="criteria(this)" class="form-control allField" name="leadTime" id="leadTime" value="${warehousesku.leadTimeDays}" required placeholder="<spring:message code="enter.product.lead.time.label" />" oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');" />
                                        	<span id="leadTimeError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
										</div></div>
										  <div class=" col-lg-2" style="padding-left:0px;padding-right:0px;">
                                            <div class="form-group col-lg-8 col-sm-12">
                                            <label><spring:message code="product.max.stock.label" /></label>
                                            <input type="text"  onblur="criteria(this)" class="form-control allField" name="maxStock" id="maxStock" value="${warehousesku.maxStock}" required placeholder="<spring:message code="enter.product.max.stock.label" />" oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');" />
                                        	<span id="maxStockError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
                                        </div></div>
                                       <div class=" col-lg-2" style="padding-left:0px;padding-right:0px;">
                                          <div class="form-group col-lg-8 col-sm-12">
                                            <label><spring:message code="stock.label" /> <span style="color:red; font-size:2">*</span></label>
                                            <input type="text"  onblur="criteria(this)" class="form-control allField" readonly="readonly" name="stock" id="stock" value="${warehousesku.stock}" oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');" required placeholder="<spring:message code="enter.stock.label" />" />
                                        	<span id="stockError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
                                        </div></div>
                                      </div> 
                                         
                                      <div class="row" style="white-space:nowrap;padding:0px;padding-right:0px;"> 
                                      <div class="col-lg-2" style="padding-left:0px">
                                          <div class="form-group col-lg-9 col-sm-12">
                                            <label><spring:message code="tax.code.label" /></label>
                                            <select  class="form-control" id="taxCode">
                                            	  <c:forEach var="tax" items="${taxDetails}">
													<option value="${tax.taxName}">${tax.taxId} - ${tax.taxName}</option>
												</c:forEach>
                                            </select>
                                        	<span id="taxCodeError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
                                         </div>
                                      </div>
                                         <div class=" col-lg-2" style="padding-left:0px;padding-right:0px;">
                                          <div class="form-group col-lg-9 col-sm-12">
                                        	<label><spring:message code="fr.tax.code.label" /></label>
                                             <input type="text"  onblur="criteria(this)" class="form-control allField" name="frTaxCode" id="frTaxCode" value="${warehousesku.frTaxCode}" oninput="this.value = this.value.replace(/[^0-9]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');" required placeholder="<spring:message code="enter.fr.tax.code.label" />" /> 
                                         <span id="frTaxCodewarehouseError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
                                         </div></div>
                                         <div class=" col-lg-2" style="padding-left:0px;padding-right:0px;">
                                          <div class="form-group col-lg-8 col-sm-12">
                                            <label><spring:message code="mark.up.label" /></label>
                                            <input type="text"  onblur="criteria(this)" class="form-control allField" readonly="readonly" name="markUp" id="markUp" value="${warehousesku.markUp}" required placeholder="<spring:message code="enter.mark.up.label" />" />
										</div></div>
										  <div class=" col-lg-2" style="padding-left:0px;padding-right:0px;">
                                          <div class="form-group col-lg-9 col-sm-12">
                                            <label><spring:message code="mark.down.label" /></label>
                                            <input type="text"  onblur="criteria(this)" class="form-control allField" name="markDown" id="markDown" value="${warehousesku.markDown}" required  placeholder="<spring:message code="enter.mark.down.label" />"  />
										<span id="markDownError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
										</div></div>
                                      <div class=" col-lg-2" style="padding-left:0px;padding-right:0px;">
                                      <div class="form-group col-lg-10 col-sm-12">
                                            <label><spring:message code="running.plunumber.label" /></label>
                                            <!-- <select class="form-control" id="runningPlu"></select> -->
                                            <input type="text"  onblur="criteria(this)" class="form-control" id="runningPlu" style="padding-right:0px;">
                                        	<span id="runningPluError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
										</div>
										</div>
										  <div class=" col-lg-2" style="padding-left:0px;padding-right:0px;">
                                          <div class="form-group col-lg-9 col-sm-12">
                                            <label><spring:message code="status.label" /></label>
                                            <select class="form-control" name="status" id="status">
                                            <option value="Active">Active</option>
                                            <option value="Disabled">Disabled</option>
                                            <option value="Discontinued">Discontinued</option>
                                            </select>
                                         </div></div>
			
                                    </div>
                                     <div class="row" style="white-space:nowrap;"> 
                                     <div class=" col-lg-2" style="padding-left:0px;padding-right:0px;">
                                          <div class="form-group col-lg-9 col-sm-12">
                                            <label><spring:message code="open.rate.label" /></label>
                                            <input type="text"  onblur="criteria(this)" class="form-control allField" name="openRate" id="openRate" value="${warehousesku.openRate}" placeholder="<spring:message code="enter.open.rate.label" />" oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');" />
                                        	<span id="colorError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
										</div></div>
                                       <div class=" col-lg-2" style="padding-left:0px;padding-right:0px;">
                                          <div class="form-group col-lg-8 col-sm-12">
                                            <label><spring:message code="last.cost.label" /></label>
                                            <input type="text"  onblur="criteria(this)" class="form-control allField" name="lastCost" id="lastCost" value="${warehousesku.lastCost}"   placeholder="<spring:message code="enter.last.cost.label" />" oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');" />
                                        	<span id="lastCostError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
                                        </div></div>
                                        <div class=" col-lg-2" style="padding-left:0px;padding-right:0px;whitespace:nowrap;">
                                          <div class="form-group col-lg-9 col-sm-12">
                                            <label><spring:message code="average.cost.label" /></label>
                                            <input type="text"  onblur="criteria(this)" class="form-control allField" name="averageCost" id="averageCost" value="${warehousesku.avgCost}" required placeholder="<spring:message code="enter.average.cost.label" />" oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');" />
                                        	<span id="averageCostError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
                                         </div></div>
                                        <div class=" col-lg-2" style="padding-left:0px;padding-right:0px;whitespace:nowrap;">
                                          <div class="form-group col-lg-9 col-sm-12">
                                            <label><spring:message code="minimum.price.label" /></label>
                                            <input type="text"  onblur="criteria(this)" class="form-control allField" name="minPrice" id="minPrice" value="${warehousesku.minimumPrice}" required placeholder="<spring:message code="enter.minimum.price.label" />" oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');" />
                                        	<span id="minPriceError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
                                         </div></div>
                                       <div class=" col-lg-2" style="padding-left:0px;padding-right:0px;">
                                          <div class="form-group col-lg-9 col-sm-12">
											<label><spring:message code="just.in.time.orders.label" /></label>
                                            <select class="form-control" name="jitStock" id="jitStock">
													<option value="true">Yes</option>
													<option value="false">No</option>
                                            </select>
										</div></div>
                                        <div class=" col-lg-2" style="padding-left:0px;padding-right:0px;">
                                          <div class="form-group col-lg-9 col-sm-12">
                                    		<label><spring:message code="zero.stock.orders.label" /></label>
                                            <select class="form-control" name ="zeroStock" id="zeroStock">
													<option value="true">Yes</option>
													<option value="false">No</option>
                                            </select>
                                        </div></div>
                                         </div>
                                         
                                        
                                        
							<div class="row">
								<div class="form-group col-lg-2">
									<label><spring:message code="primaryDepartment.label" />
										<!-- <span style="color:red; font-size:2">*</span> --></label> <input
										type="text"
										class="form-control allField searchItems searchBar"
										id="primaryDepartment"  value="${warehousesku.primaryDepartment}"
										placeholder="<spring:message code="search" />" style="" />
									<div class="services">
										<div class="items">
											<ul class="matchedStringUl primaryDepartment" style=""></ul>
										</div>
									</div>
									<span id="primaryDepartmentError"
										style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
									<input type="hidden"  onblur="criteria(this)" class="allField" id="primaryDepartment"
										value="">
								</div>
								<div class="form-group col-lg-2">
									<label><spring:message code="secondaryDepartment.label" />
										<!-- <span style="color:red; font-size:2">*</span> --></label> <input
										type="text" onblur="criteria(this)" 
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
									<input type="hidden"  onblur="criteria(this)" class="allField" id="secondaryDepartment"
										value="">
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
									<label><spring:message code="picklist.label" /></label>
									<div class="col-lg-10" style="padding-left: 0px">
										<select class="form-control" name="itemPickListRequired" id="itemPickListRequired">
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
												<input type="text" id="skutheme"  placeholder="Theme" class="form-control allField" value="${sku.theme}"/>
											<span id="skuThemewarehouseError"
												style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
										</div>
									</div>
								</div>
								
								<div class="col-lg-2" style="padding-right: 10px;">
								<div class="row">
										<div class="form-group col-lg-12">
											<label>Sub Theme</label>
												<input type="text" id="skuSubtheme"  placeholder="Sub Theme" class="form-control allField" ${sku.subTheme}/>
											<span id="skuSubthemewarehouseError"
												style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
										</div>
									</div>
								</div>


							</div>

							<div class="row">
								<div class="form-group col-lg-2">
									<label><spring:message code="alternate.sku.label" /></label> <input
										type="text" class="form-control allField" name="alternate_sku" onblur="criteria(this)"
										id="alternate_sku" value=""
										placeholder="<spring:message code="alternate.sku.description.label" />" />
								<span id="alternate_skuwarehouseError"
												style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
								</div>

								<div class="form-group col-lg-2">
									<label><spring:message code="season.code.label" /></label> <input
										type="text" class="form-control allField" name="season_code" onblur="criteria(this)"
										id="season_code" value=""
										placeholder="<spring:message code="season.code.description.label" />" />
								
								<span id="season_codeError"
												style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
								</div>

								<div class="form-group col-lg-2">
									<label><spring:message code="alias.name.label" /></label> <input
										type="text" class="form-control allField" name="alias_name" onblur="criteria(this)"
										id="alias_name" value=""
										placeholder="<spring:message code="alias.name.description.label" />" />
								
								<span id="alias_namewarehouseError"
												style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
								</div>

								<div class="form-group col-lg-2">
									<label><spring:message code="item.type.label" /></label> <input
										type="text" class="form-control allField" name="item_type"
										id="item_type" value="" onblur="criteria(this)"
										placeholder="<spring:message code="item.type.description.label" />" />
								<span id="item_typeWarehouseError"
												style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
								
								</div>

								<div class="form-group col-lg-2">
									<label><spring:message code="item.design.label" /></label> <input
										type="text"  onblur="criteria(this)" class="form-control allField" name="item_design"
										id="item_design" value=""
										placeholder="<spring:message code="item.design.description.label" />" />
								<span id="item_designWarehouseError"
												style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
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
										<span id="expirytoleranceError"
												style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
								</div>

								<div class="form-group col-lg-2">
										<label><spring:message code="product.handing.label" />
										</label>
									<input type="text" id="productHandingDetail"  onblur="criteria(this)" 
										name="productHanding" style="resize: none;"
										class="form-control allField"  value="${sku.productHandlng}"
										placeholder="<spring:message code="enter.product.handing.label" />">
								<span id="productHandingDetailwarehouseError"
												style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
								
								</div>

							
						
								

							</div>             
                                        
                                        
                                        
                                        
                                          
                                     <div class="row">
                                         <%-- <div class="form-group col-lg-3">
                                            <label><spring:message code="picture1.label" /></label>
                                            <input type="file" id="picture1" name="picture[]" multiple="multiple" onchange="loadImageFileAsURL('picture1',this);" />
                                            <input type="file" name="images[]" id="images" multiple  onchange="loadImageFileAsURL('','${attachments.elementId}',this)" >
                                         </div> --%>
                                         <div class=" form-group col-lg-2" style="text-align: center;">
											<div class="icon-remove blue delete" id="picture1_image">
											<label class="myFile" id="picture1_label">
											<img src="${pageContext.request.contextPath}/images/Add_image.png" alt="" style="width: 100px;" />
											<input type="file" id="picture1" name="picture1" onchange="loadImageFileAsURL('picture1',this);" />
                                            <input type="hidden" id="picture1_refId" name="picture1" />
                                            <input type="hidden" id="picture1_name" />
											</label>
											</div>
                                         </div>
                                         <div class="form-group col-lg-2" style="text-align: center;">
                                          <div class="icon-remove blue delete" id="picture2_image">
                                         <label class="myFile" id="picture2_label">
                                         <img src="${pageContext.request.contextPath}/images/Add_image.png" alt="" style="width: 100px;" />
                                          <input type="file" id="picture2" name="picture2" onchange="loadImageFileAsURL('picture2',this);" />
                                          <input type="hidden" id="picture2_refId" name="picture2" />
                                          <input type="hidden" id="picture2_name" />
                                          </label>
                                          </div>
                                         </div>
                                         <div class="form-group col-lg-2" style="text-align: center;">
                                         	<div class="icon-remove blue delete" id="picture3_image" >
                                         	<label class="myFile" id="picture3_label">
                                         	<img src="${pageContext.request.contextPath}/images/Add_image.png" alt="" style="width: 100px;" />
                                         	<input type="file" id="picture3" name="picture3" onchange="loadImageFileAsURL('picture3',this);" />
                                            <input type="hidden" id="picture3_refId" name="picture3" />
                                            <input type="hidden" id="picture3_name" />
                                         	</label>
                                         	</div>
                                         </div>
                                          <div class="form-group col-lg-2">
                                        	<div class="checkbox" style="padding-left: 20px;margin-top: 0px;">
	                                        	<input type="checkbox" id="nonTaxable"> Non Taxable
                                        	</div> 
                                        	<div class="checkbox" style="padding-left: 20px;margin-top: 20px;">
	                                        	<input type="checkbox" id="discountable"> Discountable
                                        	</div> 
                                        	<div class="checkbox" style="padding-left: 20px;margin-top: 20px;">
	                                        	<input type="checkbox" id="allowDecimals"> Allow Decimals
                                        	</div> 
                                         </div>
                                         <div class="form-group col-lg-2">
                                          <label><spring:message code="location.label" /> <span style="color:red; font-size:2">*</span></label>
                                        	<select class="form-control" onchange="addSelectedLocation();" id="location" multiple="multiple" style="height: 91px;">
		                                        <c:forEach var="location" items="${workLocationsList}">
													<option value="${location}">${location}</option>
												</c:forEach>
                                        	</select>
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
	                                            <input type="text" id="createdDate" readonly="readonly" class="form-control dat" data-inputmask="'alias': 'dd/mm/yyyy'" data-mask/>
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
	                                            <input type="text" id="lastUpdated" readonly="readonly" class="form-control dat" data-inputmask="'alias': 'dd/mm/yyyy'" data-mask/>
	                                        </div>
                                        	<span id="lastUpdatedError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
                                        </div>
                                        </div>
                                        </div>
                                        </div>
                                       <div class="row">
	                                        <div class="form-group col-lg-12">
		                                        <label><spring:message code="short.description.label" /> <span style="color:red; font-size:2">*</span></label>
		                                        <textarea rows="2"  onblur="criteria(this)" id="shortDescription" name="shortDescription" style="resize: none;" class="form-control allField" placeholder="<spring:message code="enter.short.description.label" />" >${sku.description}</textarea>
		                                        <span id="shortDescriptionError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
	                                        </div>
                                        </div>
                                        <div class="row">
                                         <div class="form-group col-lg-12">
                                            <label><spring:message code="warranty.details.label" /></label>
                                            <textarea rows="2"  onblur="criteria(this)" class="form-control allField" name="warrantyDetails" style="resize: none;" id="warrantyDetails" required placeholder="<spring:message code="enter.warranty.details.label" />" ></textarea>
                                        	<span id="warrantyDetailsError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
                                         </div>
                                        </div>
	                             <div class="row" >
				                    <div class="col-lg-12"  >
				                    <div class="form-group col-lg-8" style="padding-left: 1px;padding-right: 1px;margin-top: 8px;cursor: pointer;margin-bottom: 0px;" >
				                    	<span style="font-weight: bold;font-size: 16px;color:#666;cursor: pointer;text-align: left;">
				                    		<spring:message code="price.list.label" />
				                    	</span>
				                    	<%-- <span>
				                    		<input type="radio" name="priceListType" checked="checked" onchange="changePriceListType();" value="all"><spring:message code="all.location.label" />&nbsp;&nbsp;&nbsp;
				                    		<input type="radio" name="priceListType" onchange="changePriceListType();" value="specific"><spring:message code="specific.location.label" />&nbsp;&nbsp;&nbsp;
				                    		<select style="visibility: hidden;margin-top: -2px;" id="selectedLocation" onchange="getPriceListForSelectedLocation(this);"></select>
				                    	</span> --%>
				                    	<!-- <span><select class="col-lg-7 col-md-6" id="selectedLocation" onchange="getPriceListForSelectedLocation(this);"></select></span> -->
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
                                		<br>
	                                		<input type="radio" style="visibility: hidden;" name="priceListType" checked="checked" value="all">
					                    	<input type="radio" style="visibility: hidden;" name="priceListType" value="specific">
	                                		<spring:message code="specific.location.label" />&nbsp;&nbsp;&nbsp;<input type="checkbox" style="vertical-align: -3px;" id="specific" onchange="changePriceListType(this);">
	                                		<br><br><br>
	                                		<select style="margin-top: -2px;" class="form-control"  id="selectedLocation" onchange="getPriceListForSelectedLocation(this);"></select>
	                                		<br>
                                		</div>
                                	</div>
                                	
                                	<div class="col-lg-3 form-group">
                                		<div class="col-lg-12" style="border: 1px solid #CCC;text-align: center;">
                                			<label><spring:message code="product.range.label" /> </label>
                                            <input type="text"  onblur="criteria(this)"class="form-control" value="" id="productRangeTextBox"  />
	                                			<img style="cursor: pointer;width: 30px;" onclick="appendProductRange();" src="${pageContext.request.contextPath}/images/RedPlus.png">
	                                		<br>
	                                		<select style="" class="form-control" id="productRangeDropDown" ></select>
	                                		<br>
                                		</div>
                                	</div>
                                
                                	<div class="col-lg-3 form-group">
                                		<div class="col-lg-12" style="border: 1px solid #CCC;text-align: center;">
                                			<label><spring:message code="measurement.range.label" /> </label>
                                            <input type="text"  onblur="criteria(this)" class="form-control" value="" id="measurementRangeTextBox"  />
	                                			<img style="cursor: pointer;width: 30px;" onclick="appendMeasurementRange();" src="${pageContext.request.contextPath}/images/RedPlus.png">
	                                		<br>
	                                		<select style="" class="form-control" id="measurementRangeDropDown" ></select>
	                                		<br>
                                		</div>
                                	</div>
                                	
                                	
                                	<div class="col-lg-3 form-group">
                                		<div class="col-lg-12" style="border: 1px solid #CCC;text-align: center;">
                                			<label  class="" ><spring:message code="batch.label" />
                                          <input type="text"  onblur="criteria(this)" class="form-control" value="" id="batchRangeTextBox" />
	                                			 <img style="cursor: pointer; width: 28px;    padding-right: 0px;"
												onclick="appendBatch();" src="${pageContext.request.contextPath}/images/RedPlus.png">
	                                		<br>
	                                	 <select style="" class="form-control" id="batchRangeDropDown"></select>
	                                		<br>
                                		</div>
                                	</div>
                                	
                                	
                                </div>
                            
                                <div class="row">
                                	 <div class="col-md-2" style="float: right;margin-top: 0px;margin-bottom: -70px;">
                                       		<img style="float: right;cursor: pointer;margin-right: 90px;width: 30px;" onclick="appendPriceList();" alt="" src="${pageContext.request.contextPath}/images/addIcon.PNG">
                                       		<img style="float: right;cursor: pointer;margin-right: 45px;margin-top: -30px;width:30px;" onclick="deletePriceList();" alt="" src="${pageContext.request.contextPath}/images/deleteIcon.png">
                                      </div>
                                </div>
                                <!-- <div class="row" style="margin-top: -22px;"> -->
                                <div class="row" style="">
                                <div class="col-md-10 priceListForLocation">
                                <div class="AllLocation priceListLocationDiv">
                                	<div class="pricelist" id="pricelistAllLocation1">   
                                       <div class="row-fluid-5">
                                      <div class="form-group span2">
                                      		<input type="hidden" id="productRangeAllLocation1">
                                      		<input type="hidden" id="measurementRangeAllLocation1">
                                      		<input type="hidden" id="batchRangeAllLocation1">
                                            <label><spring:message code="cost.price.label" /> <span style="color:red; font-size:2">*</span></label>
                                            <input type="text" class="form-control allField req pluCost" onkeydown="clearError(this);" onblur="calcMarkUp(this);" value="" id="pluCostPriceAllLocation1" oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');" placeholder="<spring:message code="enter.cost.price.label" />" />
                                        	<span id="pluCostPriceAllLocation1Error" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
										</div>
                                        <div class="form-group span2">
                                            <label><spring:message code="price.label" /> <span style="color:red; font-size:2">*</span></label>
                                            <input type="text"  onblur="criteria(this)" class="form-control allField req" onkeydown="clearError(this);" value="${plu.price}" id="pluPriceAllLocation1" oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');" placeholder="<spring:message code="enter.price.label" />" />
                                        	<span id="pluPriceAllLocation1Error" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
                                        </div>
                                        <div class="form-group span2">
                                            <label><spring:message code="sale.price.label" /> <span style="color:red; font-size:2">*</span></label>
                                            <input type="text"  onblur="criteria(this)" class="form-control allField req pluSale" onkeydown="clearError(this);" onblur="calcMarkUp(this);" value="" id="pluSalePriceAllLocation1" oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');" placeholder="<spring:message code="enter.sale.price.label" />" />
                                        	<span id="pluSalePriceAllLocation1Error" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
                                         </div>
                                       
                                         <div class="form-group span2">
                                            <label><spring:message code="ws.price.label" /> <span style="color:red; font-size:2">*</span></label>
                                            <input type="text"  onblur="criteria(this)" class="form-control allField req" value="" onkeydown="clearError(this);" id="pluWsPriceAllLocation1" oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');" placeholder="<spring:message code="enter.ws.price.label" />" />
                                        	<span id="pluWsPriceAllLocation1Error" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
                                         </div>
                                         <div class="form-group span2">
                                            <label><spring:message code="extra.price.label" /></label>
                                            <input type="text"  onblur="criteria(this)" class="form-control allField" value="" onkeydown="clearError(this);" id="pluExtraPriceAllLocation1" oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');" placeholder="<spring:message code="enter.extra.price.label" />" />
                                        	<span id="pluExtraPriceAllLocation1Error" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
										</div>
                                      </div> 
                                       <div class="row-fluid-5">
                                       <div class="form-group span2">
                                       		<label><spring:message code="ean.label" /></label>
                                            <input type="text"  onblur="criteria(this)" class="form-control allField"  id="eanAllLocation1" value="" placeholder="<spring:message code="enter.ean.label" />" />
										    <span id="eanAllLocation1Error" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
										</div> 
                                       <div class="form-group span2">
                                            <label><spring:message code="created.date.label" /></label>
                                            <div class="input-group">
	                                            <div class="input-group-addon">
	                                                <i class="fa fa-calendar"></i>
	                                            </div>
	                                            <input type="text"   id="pluCreatedDateAllLocation1" readonly="readonly" class="form-control dat" data-inputmask="alias: dd/mm/yyyy" data-mask/>
	                                        </div>
                                            <span id="pluCreatedDateAllLocation1Error" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
										</div>
                                      <div class="form-group span2">
                                            <label><spring:message code="updated.date.label" /></label>
                                            <div class="input-group">
	                                            <div class="input-group-addon">
	                                                <i class="fa fa-calendar"></i>
	                                            </div>
	                                            <input type="text"  id="pluUpdatedDateAllLocation1" readonly="readonly" class="form-control dat" data-inputmask="alias: dd/mm/yyyy" data-mask/>
	                                        </div>
                                        	<span id="pluUpdatedDateAllLocation1Error" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
										</div>
                                        <div class="form-group span2">
                                            <label><spring:message code="expiry.date.label" /></label>
                                            <div class="input-group">
	                                            <div class="input-group-addon">
	                                                <i class="fa fa-calendar"></i>
	                                            </div>
	                                            <input class="form-control allField req dat"   readonly="readonly" style="background-color: white;" id="pluExpiryDateAllLocation1" size="20" type="text" onfocus="callCalender('pluExpiryDateAllLocation1')" onclick="callCalender('pluExpiryDateAllLocation1')" placeholder="DD/MM/YYYY"/>
	                                        </div>
                                        	<span id="pluExpiryDateAllLocation1Error" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
                                        </div>
                                         <div class="form-group span2">
                                            <label><spring:message code="size.label" /></label>
                                            <input type="text" class="form-control allField"  onblur="criteria(this)" onkeydown="clearError(this);" id="pluSizeAllLocation1" placeholder="<spring:message code="enter.size.label" />" />
                                        	<span id="pluSizeAllLocation1Error" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
										</div>
                                      </div> 
                                      <div class="row-fluid-5">
                                       <div class="form-group span2">
                                            <label><spring:message code="color.label" /></label>
                                            <input type="text"  onblur="criteria(this)"  class="form-control allField" onkeydown="clearError(this);" id="pluColorAllLocation1" placeholder="<spring:message code="enter.color.label" />" />
                                            <span id="pluColorAllLocation1Error" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
										</div>
                                      <div class="form-group span2">
                                            <label><spring:message code="color.shade.label" /></label>
                                            <input type="text"  onblur="criteria(this)"  class="form-control allField" onkeydown="clearError(this);" id="pluColorShadeAllLocation1" placeholder="<spring:message code="enter.color.shade.label" />" />
                                        	<span id="pluColorShadeAllLocation1Error" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
										</div>
                                        <div class="form-group span2">
                                            <label><spring:message code="mbq.label" /></label>
                                            <input type="text"  onblur="criteria(this)" class="form-control allField" onkeydown="clearError(this);" id="pluMbqAllLocation1" placeholder="<spring:message code="enter.mbq.label" />" />
                                        	<span id="pluMbqAllLocation1Error" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
                                        </div>
                                      
                                          <div class="form-group span2">
                                            <label><spring:message code="quantity.in.hand.label" /> <span style="color:red; font-size:2">*</span></label>
                                            <input type="text"  onblur="criteria(this)" class="form-control allField req" onblur="calculateStock();" onkeydown="clearError(this);" value="" id="pluQuantityAllLocation1" oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');" placeholder="<spring:message code="enter.quantity.in.hand.label" />" />
                                            <span id="pluQuantityAllLocation1Error" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
										</div>
                                         <div class="form-group span2">
                                            <label><spring:message code="acp.label" /></label>
                                            <input type="text"  onblur="criteria(this)"  class="form-control allField" onkeydown="clearError(this);" id="pluAcpAllLocation1" placeholder="<spring:message code="enter.acp.label" />" />
                                        	<span id="pluAcpAllLocation1Error" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
                                         </div>
                                         </div>
                                         <div class="row-fluid-5">
                                         <div class="form-group span2">
                                           
                                            <label>Material Type</label>
                                            <input type="text"  onblur="criteria(this)"  class="form-control allField" onkeydown="clearError(this);" id="pluMaterialtypeAllLocation1" placeholder="Material Type" />
                                        	<span id="pluMaterialtypeAllLocation1Error" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
                                        
                                           
                                           </div>
                                           
                                           
                                           
                                           <div class="form-group span2">
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
                                       
                                       <div class="form-group span2">
									<label><spring:message code="status.label" /></label>
									<div class="col-lg-10" style="padding-left: 0px">
										<select class="form-control" name="skuStatusAllLocation1" id="skuStatusAllLocation1">
											<option value="true" ${plu.sku_status == true ? 'selected' : ''}>Active</option>
											<option value="false" ${plu.sku_status == false ? 'selected' : ''}>InActive</option>
										</select>
									</div>
								</div>        
                                           
                                           
                                           
                                       </div> 
                                         
                                         
                                         <div class="row">
                                         <div class="form-group col-lg-12">
                                            <label><spring:message code="description.label" /> <span style="color:red; font-size:2">*</span></label>
                                            <textarea rows="2"  onblur="criteria(this)" class="form-control allField" onkeydown="clearError(this);" id="pluDescAllLocation1" style="resize: none;" required placeholder="<spring:message code="enter.description.label" />" ></textarea>
                                        	<span id="pluDescAllLocation1Error" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
                                         </div>
                                       </div> 
                                     </div>
                                </div>
                                
                                
                                <div class="pricelist" id="pricelistAllLocation0" style="display: none;">   
                                       <div class="row-fluid-5">
                                      <div class="form-group span2">
                                      		<input type="hidden" id="productRangeAllLocation0">
                                      		<input type="hidden" id="measurementRangeAllLocation0">
                                      		<input type="hidden" id="batchRangeAllLocation0">
                                            <label><spring:message code="cost.price.label" /> <span style="color:red; font-size:2">*</span></label>
                                            <input type="text" class="form-control allField req pluCost" onkeydown="clearError(this);" onblur="calcMarkUp(this);" value="" id="pluCostPriceAllLocation0" oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');" placeholder="<spring:message code="enter.cost.price.label" />" />
                                        	<span id="pluCostPriceAllLocation0Error" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
										</div>
                                        <div class="form-group span2">
                                            <label><spring:message code="price.label" /> <span style="color:red; font-size:2">*</span></label>
                                            <input type="text"  onblur="criteria(this)" class="form-control allField req" onkeydown="clearError(this);" value="" id="pluPriceAllLocation0" oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');" placeholder="<spring:message code="enter.price.label" />" />
                                        	<span id="pluPriceAllLocation0Error" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
                                        </div>
                                        <div class="form-group span2">
                                            <label><spring:message code="sale.price.label" /> <span style="color:red; font-size:2">*</span></label>
                                            <input type="text"  onblur="criteria(this)" class="form-control allField req pluSale" onkeydown="clearError(this);" onblur="calcMarkUp(this);" value="" id="pluSalePriceAllLocation0" oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');" placeholder="<spring:message code="enter.sale.price.label" />" />
                                        	<span id="pluSalePriceAllLocation0Error" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
                                         </div>
                                       
                                         <div class="form-group span2">
                                            <label><spring:message code="ws.price.label" /> <span style="color:red; font-size:2">*</span></label>
                                            <input type="text"  onblur="criteria(this)" class="form-control allField req" value="" onkeydown="clearError(this);" id="pluWsPriceAllLocation0" oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');" placeholder="<spring:message code="enter.ws.price.label" />" />
                                        	<span id="pluWsPriceAllLocation0Error" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
                                         </div>
                                         <div class="form-group span2">
                                            <label><spring:message code="extra.price.label" /></label>
                                            <input type="text"  onblur="criteria(this)"class="form-control allField" value="" onkeydown="clearError(this);" id="pluExtraPriceAllLocation0" oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');" placeholder="<spring:message code="enter.extra.price.label" />" />
                                        	<span id="pluExtraPriceAllLocation0Error" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
										</div>
                                      </div> 
                                       <div class="row-fluid-5">
                                       <div class="form-group span2">
                                       		<label><spring:message code="ean.label" /></label>
                                            <input type="text"  onblur="criteria(this)"class="form-control allField"  id="eanAllLocation0" value="" placeholder="<spring:message code="enter.ean.label" />" />
										</div> 
                                       <div class="form-group span2">
                                            <label><spring:message code="created.date.label" /></label>
                                            <div class="input-group">
	                                            <div class="input-group-addon">
	                                                <i class="fa fa-calendar"></i>
	                                            </div>
	                                            <input type="text"  id="pluCreatedDateAllLocation0" readonly="readonly" class="form-control dat" data-inputmask="alias: dd/mm/yyyy" data-mask/>
	                                        </div>
                                            <span id="pluCreatedDateAllLocation0Error" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
										</div>
                                      <div class="form-group span2">
                                            <label><spring:message code="updated.date.label" /></label>
                                            <div class="input-group">
	                                            <div class="input-group-addon">
	                                                <i class="fa fa-calendar"></i>
	                                            </div>
	                                            <input type="text" id="pluUpdatedDateAllLocation0" readonly="readonly" class="form-control dat" data-inputmask="alias: dd/mm/yyyy" data-mask/>
	                                        </div>
                                        	<span id="pluUpdatedDateAllLocation0Error" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
										</div>
                                        <div class="form-group span2">
                                            <label><spring:message code="expiry.date.label" /></label>
                                            <div class="input-group">
	                                            <div class="input-group-addon">
	                                                <i class="fa fa-calendar"></i>
	                                            </div>
	                                            <input class="form-control allField req dat" readonly="readonly" style="background-color: white;" id="pluExpiryDateAllLocation0" size="20" type="text" onfocus="callCalender('pluExpiryDateAllLocation0')" onclick="callCalender('pluExpiryDateAllLocation0')" placeholder="DD/MM/YYYY"/>
	                                        </div>
                                        	<span id="pluExpiryDateAllLocation0Error" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
                                        </div>
                                         <div class="form-group span2">
                                            <label><spring:message code="size.label" /></label>
                                            <input type="text"  onblur="criteria(this)" class="form-control allField" onkeydown="clearError(this);" id="pluSizeAllLocation0" placeholder="<spring:message code="enter.size.label" />" />
                                        	<span id="pluSizeAllLocation0Error" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
										</div>
                                      </div> 
                                      <div class="row-fluid-5">
                                       <div class="form-group span2">
                                            <label><spring:message code="color.label" /></label>
                                            <input type="text"  onblur="criteria(this)"class="form-control allField" onkeydown="clearError(this);" id="pluColorAllLocation0" placeholder="<spring:message code="enter.color.label" />" />
                                            <span id="pluColorAllLocation0Error" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
										</div>
                                      <div class="form-group span2">
                                            <label><spring:message code="color.shade.label" /></label>
                                            <input type="text"  onblur="criteria(this)"class="form-control allField" onkeydown="clearError(this);" id="pluColorShadeAllLocation0" placeholder="<spring:message code="enter.color.shade.label" />" />
                                        	<span id="pluColorShadeAllLocation0Error" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
										</div>
                                        <div class="form-group span2">
                                            <label><spring:message code="mbq.label" /></label>
                                            <input type="text"  onblur="criteria(this)"class="form-control allField" onkeydown="clearError(this);" id="pluMbqAllLocation0" placeholder="<spring:message code="enter.mbq.label" />" />
                                        	<span id="pluMbqAllLocation0Error" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
                                        </div>
                                      
                                          <div class="form-group span2">
                                            <label><spring:message code="quantity.in.hand.label" /> <span style="color:red; font-size:2">*</span></label>
                                            <input type="text"  onblur="criteria(this)" class="form-control allField req" onblur="calculateStock();" onkeydown="clearError(this);" value="" id="pluQuantityAllLocation0" oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');" placeholder="<spring:message code="enter.quantity.in.hand.label" />" />
                                            <span id="pluQuantityAllLocation0Error" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
										</div>
                                         <div class="form-group span2">
                                            <label><spring:message code="acp.label" /></label>
                                            <input type="text"  onblur="criteria(this)" class="form-control allField" onkeydown="clearError(this);" id="pluAcpAllLocation0" placeholder="<spring:message code="enter.acp.label" />" />
                                        	<span id="pluAcpAllLocation0Error" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
                                         </div>
                                         </div>
                                          <div class="row-fluid-5">
                                         <div class="form-group span2">
                                           
                                            <label>Material Type</label>
                                            <input type="text"  onblur="criteria(this)"  class="form-control allField" onkeydown="clearError(this);" id="pluMaterialtypeAllLocation0" placeholder="Material Type" />
                                        	<span id="pluMaterialtypeAllLocation0Error" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
                                        
                                           
                                           </div>
                                           
                                           
                                           
                                            <div class="form-group span2">
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
                                         <div class="form-group col-lg-12">
                                            <label><spring:message code="description.label" /> <span style="color:red; font-size:2">*</span></label>
                                            <textarea rows="2"  onblur="criteria(this)" class="form-control allField" onkeydown="clearError(this);" id="pluDescAllLocation0" style="resize: none;" required placeholder="<spring:message code="enter.description.label" />" ></textarea>
                                        	<span id="pluDescAllLocation0Error" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
                                         </div>
                                          <div class="form-group col-lg-12">
                                       </div> 
                                     </div>
                                    </div>
                                       </div>
                                       <div class="row">
                                        	<div class="col-md-2" style="float: right;margin-top: 275px;">
	                                       	<img style="float: right;cursor: pointer;margin-right: 95px;margin-top: -5px;margin-bottom: -26px;opacity: 0.5;" onclick="showPrevPriceList();" id="prevImg" alt="" src="${pageContext.request.contextPath}/images/leftIcon.png">
	                                        	<span id="currentPriceList" style="margin-left: 73px; font-size: 20px;margin-top: 7px;position: absolute;">1 of 1</span> 
	                                       	<img style="float: right;cursor: pointer;margin-right: 9px;margin-top: -24px;margin-bottom: -26px;opacity: 0.5;" onclick="showNextPriceList();" id="nextImg" alt="" src="${pageContext.request.contextPath}/images/rightIcon.png">
                                       </div>
                                       </div>
                                    </div><!-- /.box-body --> </div>
						<div class="row" style="text-align: right;">
							<input type="button" id="edit"  class="btnCls" onclick="validateWarehouseSkuForm('new')" value="<spring:message code="submit.label" />" />
							<input type="button" id="edit"  class="btnCls" style="margin-left: 1%;margin-right: 1%" onclick="resetAll();" value="<spring:message code="reset.label" />" />
						 <c:if test="${sessionScope.role == 'super admin'}"> 
						 	<input type="button" class="btnCls" style="margin-left: 1%;margin-right: 1%"  onclick=" viewWarehouseSkuMaster('warehouseskumaster','0','');" value="<spring:message code="cancel.label" />" />
						 </c:if>
					  <c:forEach var="accessControl" items="${sessionScope.warehouseMasterSettings}">
                       <c:if test="${accessControl.appDocument == 'WarehouseSkuMaster' && accessControl.write == true && accessControl.read == true}">	
							<input type="button" class="btnCls" style="margin-right: 2%;" onclick=" viewWarehouseSkuMaster('warehouseskumaster','0','');" value="<spring:message code="cancel.label" />" />
							</c:if>
						</c:forEach>
						</div>
						
					<br/>
                 <div class="box-footer"></div>
                
              </form>
         </div>
                    
</div>
</div>
</section><!-- /.content -->
</body>
</html>