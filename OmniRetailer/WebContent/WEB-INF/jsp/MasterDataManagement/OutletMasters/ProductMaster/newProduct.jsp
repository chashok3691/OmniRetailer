<!--/*
 * Project Name 	        : OmniRetailerCustomer
 * Written By		        : Mythri
 * file name		        : Inventory Manager/master/newProduct.jsp
 * file type		        : JSP
 * description				: The new product is displayed using this jsp
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
	<%--  <script src="${pageContext.request.contextPath}/js/jquery-1.6.4.min.js"></script> --%>
<script src="${pageContext.request.contextPath}/js/masterDataManagement/outletMasters/productMaster.js"></script>
 <script src="${pageContext.request.contextPath}/js/form_plugin.js"></script>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/omniretailer.css">
<style type="text/css">
	/* .col-xs-12 {
	 padding: 2% 20%;
	 } */
	/*  .error{
	 border-color:red !important;
	 } */
</style>
<script type="text/javascript">
$(document).ready(function(){
		$("#product_name").focus();
	/* var subCategories = $("#subCategories").val();
	var parsedJson = jQuery.parseJSON(subCategories);     
	var category = $("#category").val();
	var subcategoryArray = new Array();
	subcategoryArray = parsedJson[category];
	if(subcategoryArray != undefined){
		var op = '';
		for(var i=0;i<subcategoryArray.length;i++){
			op += '<option value="'+subcategoryArray[i]+'">'+subcategoryArray[i]+'</option>';
		}
		$("#sub_category").html(op);
	} */
	$(this).scrollTop(0);
	var selectedSuppliers = $("#selectedSuppliers").val();
	if(selectedSuppliers != ""){
		selectedSuppliers = selectedSuppliers.replace('[','').replace(']','').replace(/, /g,',');
		$("#productSupplier").val(selectedSuppliers.split(','));
	}
	var selectedStores = $("#selectedStores").val().replace('[','').replace(']','').replace(/, /g,',');
	if(selectedStores != ""){
		selectedStores = selectedStores.replace('[','').replace(']','').replace(/, /g,',');
		$("#productStore").val(selectedStores.split(','));
	}
	/* $("#primary_supplier").change(function () {
		$("#productSupplier").append('<option value="'+primarySupplier+'">'+primarySupplierLabel+'</option>');
		primarySupplier = $("#primary_supplier").val();
		primarySupplierLabel = $("#primary_supplier option:selected").text();
	    $("#productSupplier option[value='"+primarySupplier+"']").remove();
	}); */
	 /* $('#category').change(function () {
		 var category = $("#category").val();
		 subcategoryArray = parsedJson[category];
		 	var op = '';
			for(var i=0;i<subcategoryArray.length;i++){
				op += '<option value="'+subcategoryArray[i]+'">'+subcategoryArray[i]+'</option>';
			}
			$("#sub_category").html(op);
	    }); */
	 $("#productSupplier").change(function(){
		   $("#productSupplierError").html("");
		   $(".Error").html("");
	 });
	 $("#productStore").change(function(){
		   $("#productStoreError").html("");
		   $(".Error").html("");
	 });
 	  $("#product_name").keyup(function(){
		   $("#productNameError").html("");
		   $(".Error").html("");
 	 });
 	 
 	 $("#product_description").keydown(function(){
 		   $("#productDescriptionError").html("");
		   $(".Error").html("");
 	 }); 
 	 $("#lead_time_days").keyup(function(){
		   $("#leadTimeError").html("");
		   $(".Error").html("");
	 });
 	 $("#buy_unit_price").keyup(function(){
 		  $("#buyUnitPriceError").html("");
		   $(".Error").html("");
	 });
 	 $("#sell_unit_price").keyup(function(){
 		   $("#sellUnitPriceError").html("");
		   $(".Error").html("");
	 });
 	 
 	$("#stock_in_hand").keyup(function(){
		   $("#stockInHandError").html("");
		   $(".Error").html("");
	 });
	 
	 $("#min_stock").keyup(function(){
		   $("#minStockError").html("");
		   $(".Error").html("");
	 }); 
	 $("#max_stock").keyup(function(){
		   $("#maxStockError").html("");
		   $(".Error").html("");
	 });
	 $("#re_order_point").keyup(function(){
		   $("#reOrderPointError").html("");
		   $(".Error").html("");
	 });
});



</script>
</head>
<body>
<!-- Content Header (Page header) -->
<%-- <section class="content-header">
   <h1><spring:message code="masters.label" />
     <small><spring:message code="product.master.label" /></small>
    </h1>
      <ol class="breadcrumb">
      	<li><a style="cursor: pointer;" onclick="return viewDashboard('inventorymanager');"><i class="fa fa-dashboard"></i><spring:message code="home.label" /></a></li>
        <li class="active"><spring:message code="masters.label" /></li>
       </ol>
 </section> --%>

<!-- Main content -->
<section class="content">
<div class="row">
  <div class="col-xs-12">
				<div class="box box-primary">
                                <div class="box-header" style="text-align: center">
                               		 <h3><spring:message code="new.product.header.label" /></h3>
                                </div><!-- /.box-header -->
                                <!-- form start -->
                                <form id="newProduct" method="post" >
                                    <div class="box-body">
                                    	<div id="Error" class="Error" style="text-align: center;color: red;font-size: 2;font-weight: bold;margin-bottom: 10px; margin-top: -20px">${err}</div>
	        							<div id="Success" class="Error" style="text-align: center;color: blue;font-size: 2;font-weight: bold;margin-bottom: 10px; margin-top: -20px">${success}</div>
                                   	<div class="row">
                                   		<div class="col-lg-4"></div>
										<div class="form-group col-lg-4">
                                            <label><spring:message code="product.name.label" /> <span style="color:red; font-size:2">*</span></label>
                                            <input type="text" class="form-control" name=productName id="product_name" value="${product.productName}" required placeholder="<spring:message code="enter.product.name.label" />" />
                                         	<span id="productNameError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
										</div>
										<div class="col-lg-4"></div>
                                    	
                                      </div>
                                      <br>
                                      <br>
                                      <div class="row">
                                      <%-- <div class="form-group col-lg-3">
                                            <label><spring:message code="product.description.label" /> <span style="color:red; font-size:2">*</span></label>
                                            <input type="text" class="form-control" name="product_description" id="product_description" value="${product.productName}" required placeholder="<spring:message code="enter.product.description.label" />" />
                                        	<span id="productDescriptionError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
										</div> --%>
                                        <div class="form-group col-lg-3">
                                         <div class="col-lg-10">
                                            <label><spring:message code="category.name.label" /></label>
                                             
                                             <select class="form-control" onchange="searchSubCategoriesBasedOnCategory('category')" name="category" id="category">
                                              <c:forEach var="category" items="${categories}">
                                              <option value="${category.categoryName}" ${category.categoryName == product.category ? 'selected' : ''}>${category.categoryDescription}</option>
												<%-- <option value="${category}">${category}</option> --%>
											</c:forEach>
                                            </select>
                                        </div>
                                        </div>
                                        <div class="form-group col-lg-3">
                                         <div class="col-lg-11" style="padding-left: 0px">
                                            <label><spring:message code="sub.category.name.label" /></label>
                                            <select class="form-control" name="sub_category" id="sub_category">
                                            <option value="Select" >-- Select --</option>
                                            <c:forEach var="subCategory" items="${subCategoryList}">
                                              <option value="${subCategory.subcategoryName}" ${subCategory.subcategoryName == product.sub_category ? 'selected' : ''}>${subCategory.subcategoryDescription}</option>
											</c:forEach>
                                            </select>
                                         </div>
                                         </div>
                                          <div class="form-group col-lg-2">
                                            <label><spring:message code="product.taxable.label" /></label>
                                            <div class="col-lg-11" style="padding-left: 0px">
                                             <select class="form-control" name="taxable" id="taxable">
                                            <option value="Yes" ${'Y' == product.taxable || 'Yes' == product.taxable ? 'selected' : ''}>Yes</option>
                                            <option value="No" ${'N' == product.taxable || 'No' == product.taxable? 'selected' : ''}>No</option>
                                            </select>
                                        </div>
                                        </div>
                                        <div class="form-group col-lg-1"></div>
                                         <div class="form-group col-lg-2">
                                            <label><spring:message code="product.asset.category.label" /></label>
                                           <div class="col-lg-12" style="padding-left: 0px">
                                            <select class="form-control" name="asset_category" id="asset_category">
                                            	<option value="Office Furniture" ${'Office Furniture' == product.asset_category ? 'selected' : ''}>Office Furniture</option>
									            <option value="Computer Peripherals" ${'Computer Peripherals' == product.asset_category ? 'selected' : ''}>Computer Peripherals</option>
									            <option value="Land & Buildings" ${'Land & Buildings' == product.asset_category ? 'selected' : ''}>Land & Buildings</option>
									            <option value="Vehicles" ${'Vehicles' == product.asset_category ? 'selected' : ''}>Vehicles</option>
									            <option value="Plant & Machinery" ${'Plant & Machinery' == product.asset_category ? 'selected' : ''}>Plant & Machinery</option>
									            <option value="Machine & Equipments" ${'Machine & Equipments' == product.asset_category ? 'selected' : ''}>Machine & Equipments</option>
									            <option value="Cash Accounts" ${'Cash Accounts' == product.asset_category ? 'selected' : ''}>Cash Accounts</option>
									            <option value="Technology" ${'Technology' == product.asset_category ? 'selected' : ''}>Technology</option>
									            <option value="Bank Deposits" ${'Bank Deposits' == product.asset_category ? 'selected' : ''}>Bank Deposits</option>
									            <option value="Receivables" ${'Receivables' == product.asset_category ? 'selected' : ''}>Receivables</option>
									            <option value="Investments" ${'Investments' == product.asset_category ? 'selected' : ''}>Investments</option>
									            <option value="Marchandize Inventory" ${'Marchandize Inventory' == product.asset_category ? 'selected' : ''}>Merchandise Inventory</option>
									            <option value="Hardware Assets" ${'Hardware Assets' == product.asset_category ? 'selected' : ''}>Hardware Assets</option>
									            <option value="Consumables" ${'Consumables' == product.asset_category ? 'selected' : ''}>Consumables</option>
									            <option value="License Assets" ${'License Assets' == product.asset_category ? 'selected' : ''}>License Assets</option>
									            <option value="Fixed Assets" ${'Fixed Assets' == product.asset_category ? 'selected' : ''}>Fixed Assets</option>
									            <option value="Current Assets" ${'Current Assets' == product.asset_category ? 'selected' : ''}>Current Assets</option>
                                            </select>
                                        </div>
                                        </div>
                                        
                                         <%-- <div class="form-group col-lg-2">
                                          <div class=" col-lg-11">
                                            <label><spring:message code="product.storage.location.label" /></label>
                                            <select class="form-control" name="storage_location" id="storage_location">
	                                            <option value="G33F6" ${'G33F6' == product.storage_location ? 'selected' : ''}>G33F6</option>
	                                            <option value="G45T4" ${'G45T4' == product.storage_location ? 'selected' : ''}>G45T4</option>
	                                            <option value="G78D6" ${'G78D6' == product.storage_location ? 'selected' : ''}>G78D6</option>
                                            </select>
                                         </div>
                                          </div> --%>
                                         <!-- <div class=" col-lg-1"></div> -->
                                        </div>
                                         <div class="row">
                                         <div class="form-group col-lg-2">
                                            
                                           <div class="col-lg-11" >
                                           <label><spring:message code="product.abc.category.label" /></label>
                                            <select class="form-control" name="abc_category" id="abc_category">
	                                            <option value="A" ${'A' == product.abc_category ? 'selected' : ''}>A</option>
	                                            <option value="B" ${'B' == product.abc_category ? 'selected' : ''}>B</option>
	                                            <option value="C" ${'C' == product.abc_category ? 'selected' : ''}>C</option>
                                            </select>
                                      	</div>
                                      	 </div>
                                      	  <div class=" col-lg-1"></div>
                                         <div class="form-group col-lg-2">
                                            <label><spring:message code="product.warehouse.stock.unit.label" /></label>
                                            <div class="col-lg-11" style="padding-left: 0px">
                                             <select class="form-control" name="warehouse_stocking_unit" id="warehouse_stocking_unit" >
	                                            <option value="Pack" ${'Pack' == product.warehouse_stocking_unit ? 'selected' : ''}>Pack</option>
	                                            <option value="Box" ${'Box' == product.warehouse_stocking_unit ? 'selected' : ''}>Box</option>
	                                            <option value="Bag" ${'Bag' == product.warehouse_stocking_unit ? 'selected' : ''}>Bag</option>
	                                            <option value="Bundle" ${'Bundle' == product.warehouse_stocking_unit ? 'selected' : ''}>Bundle</option>
	                                            <option value="Case" ${'Case' == product.warehouse_stocking_unit ? 'selected' : ''}>Case</option>
                                            </select>
                                         </div>
                                         </div>
                                          <div class=" col-lg-1"></div>
                                         <div class="form-group col-lg-2">
                                            <label><spring:message code="product.retail.stock.unit.label" /></label>
                                           <div class="col-lg-11" style="padding-left: 0px">
                                            <select class="form-control" name="retail_stocking_unit" id="retail_stocking_unit">
                                            <option value="Piece" ${'Piece' == product.retail_stocking_unit ? 'selected' : ''}>Piece</option>
                                            <option value="Packet" ${'Packet' == product.retail_stocking_unit ? 'selected' : ''}>Packet</option>
                                            <option value="Weighed Packet" ${'Weighed Packet' == product.retail_stocking_unit ? 'selected' : ''}>Weighed Packet</option>
                                            </select>
                                        </div>
                                        </div>
                                         <div class=" col-lg-1"></div>
                                         <div class="form-group col-lg-2">
                                          <div class="col-lg-11" style="padding-left: 0px">
                                            <label><spring:message code="product.lead.time.label" /> <span style="color:red; font-size:2">*</span></label>
                                            <input type="text" class="form-control" name="lead_time_days" id="lead_time_days"  value="${product.lead_time_days}" oninput="this.value = this.value.replace(/[^0-9]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');" value="" placeholder="<spring:message code="enter.product.lead.time.label" />" />
                                            <span id="leadTimeError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
                                        </div>
                                        </div>
                                        </div>
                                        
                                        <div class="row">
                                         <div class="form-group col-lg-3">
                                         <div class="col-lg-11" >
                                            <label><spring:message code="product.primary.supplier.label" /></label>
                                            
                                            <select class="form-control" name="primary_supplier" id="primary_supplier">
                                             <c:forEach var="supplier" items="${supplierList}">
												<option value="${supplier.supplierCode}" ${supplier.supplierCode == product.primary_supplier ? 'selected' : ''}>${supplier.firmName}</option>
											</c:forEach>
                                             </select>
                                             </div>
                                         </div>
                                         
                                         
                                         <div class="form-group col-lg-3">
                                            <label><spring:message code="product.secondary.supplier.label" /></label>
                                           <div class="col-lg-11" style="padding-left: 0px">
                                            <select class="form-control" name="productSupplier" id="productSupplier" multiple="multiple">
                                             <c:forEach var="supplier" items="${supplierList}">
												<option value="${supplier.supplierCode}" id="${supplier.supplierCode}">${supplier.firmName}</option>
											</c:forEach>
                                            </select>
                                            <span id="productSupplierError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
                                         </div>
                                         </div>
                                         
                                         <div class="form-group col-lg-3">
                                            <label><spring:message code="product.warehouse.label" /></label>
                                          <div class="col-lg-11" style="padding-left: 0px">
                                            <select class="form-control" name="warehouse" id="warehouse" multiple="multiple">
                                             <c:forEach var="warehouse" items="${warehouseList}">
												<option value="${warehouse.warehouseId}" ${warehouse.warehouseId == product.warehouse ? 'selected' : ''}>${warehouse.warehouseId}</option>
											</c:forEach>
                                            </select>
                                        </div>
                                         </div>
                                        
                                         <div class="form-group col-lg-3">
                                            <label><spring:message code="product.store.name.label" /></label>
                                           <div class="col-lg-11" style="padding-left: 0px">
                                            <select class="form-control" name="productStore" id="productStore" multiple="multiple">
                                            <c:forEach var="store" items="${storesList}">
												<option value="${store.storeCode}">${store.storeName}</option>
											</c:forEach>
                                          </select>
                                          <span id="productStoreError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
                                         </div>
                                        </div> 
                                        </div> 
                                          <div class="row">
                                         <div class="form-group col-lg-2">
                                          
                                            <div class="col-lg-11">
                                              <label><spring:message code="product.buy.uom" /></label>
                                            <select class="form-control" name="buy_UOM" id="buy_UOM">
                                            <option value="KG" ${'KG' == product.buy_UOM ? 'selected' : ''}>KG</option>
                                            <option value="Meters" ${'Meters' == product.buy_UOM ? 'selected' : ''}>Meters</option>
                                            <option value="Pieces" ${'Pieces' == product.buy_UOM ? 'selected' : ''}>Pieces</option>
                                            <option value="Cases" ${'Cases' == product.buy_UOM ? 'selected' : ''}>Cases</option>
                                            <option value="Litres" ${'Litres' == product.buy_UOM ? 'selected' : ''}>Litres</option>
                                            
                                            <!-- 
                                            <option value="PAX">PAX</option>
                                            <option value="NOS">NOS</option>
                                            <option value="GLASS">GLASS</option>
                                            <option value="PEG">PEG</option>
                                            <option value="BOTTLE">BOTTLE</option>
                                            <option value="ML">ML</option>
                                            <option value="BTL ML">BTL ML</option>
                                            <option value="GLS ML">GLS ML</option>
                                            <option value="PITCHER">PITCHER</option> -->
                                            </select>
                                            </div>
                                        </div>
                                        <div class=" col-lg-1"></div>
                                         <div class="form-group col-lg-2">
                                            <label><spring:message code="product.buy.unit.price.label" /> <span style="color:red; font-size:2">*</span></label>
                                           <div class="col-lg-11" style="padding-left: 0px">
                                            <input type="text" class="form-control" name="buy_unit_price" id="buy_unit_price" value="${product.buy_unit_price}"  oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');" placeholder="<spring:message code="enter.product.buy.unit.price.label" />" />
                                            <span id="buyUnitPriceError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
                                        </div>
                                        </div>
                                        <div class=" col-lg-1"></div>
                                         <div class="form-group col-lg-2">
                                            <label><spring:message code="product.sell.uom" /></label>
                                           <div class="col-lg-11" style="padding-left: 0px">
                                            <select class="form-control" name="sell_UOM" id="sell_UOM">
                                            <option value="KG" ${'KG' == product.sell_UOM ? 'selected' : ''}>KG</option>
                                            <option value="Meters" ${'Meters' == product.sell_UOM ? 'selected' : ''}>Meters</option>
                                            <option value="Pieces" ${'Pieces' == product.sell_UOM ? 'selected' : ''}>Pieces</option>
                                            <option value="Cases" ${'Cases' == product.sell_UOM ? 'selected' : ''}>Cases</option>
                                            <option value="Litres" ${'Litres' == product.sell_UOM ? 'selected' : ''}>Litres</option>
                                            </select>
                                        </div>
                                          </div> 
                                          <div class=" col-lg-1"></div>
                                        <div class="form-group col-lg-2">
                                            <label><spring:message code="product.sell.unit.price.label" /> <span style="color:red; font-size:2">*</span></label>
                                           <div class="col-lg-11" style="padding-left: 0px">
                                            <input class="form-control" name="sell_unit_price" id="sell_unit_price" value="${product.sell_unit_price}"  oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');" placeholder="<spring:message code="enter.product.sell.unit.price.label" />" />
                                            <span id="sellUnitPriceError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
                                        </div>
                                        </div>
                                        </div>
                                        <div class="row">
                                         <div class="form-group col-lg-2">
                                           
                                           <div class="col-lg-11" >
                                           <label><spring:message code="product.stock.in.hand.label" /> <span style="color:red; font-size:2">*</span></label>
                                            <input class="form-control" name="stock_in_hand" id="stock_in_hand" value="${product.stock_in_hand}"  oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');" placeholder="<spring:message code="enter.product.stock.in.hand.label" />" />
                                            <span id="stockInHandError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
                                        </div>
                                        </div>
                                         <div class=" col-lg-1"></div>
                                         <div class="form-group col-lg-2">
                                            <label><spring:message code="product.min.stock.label" /> <span style="color:red; font-size:2">*</span></label>
                                            <div class="col-lg-11" style="padding-left: 0px">
                                            <input class="form-control" name="min_stock" id="min_stock" value="${product.min_stock}"  oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');" placeholder="<spring:message code="enter.product.min.stock.label" />" />
                                            <span id="minStockError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
                                        </div>
                                        </div>
                                         <div class=" col-lg-1"></div>
                                         <div class="form-group col-lg-2">
                                            <label><spring:message code="product.max.stock.label" /> <span style="color:red; font-size:2">*</span></label>
                                           <div class="col-lg-11" style="padding-left: 0px">
                                            <input class="form-control" name="max_stock" id="max_stock" value="${product.max_stock}"  oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');" placeholder="<spring:message code="enter.product.max.stock.label" />" />
                                            <span id="maxStockError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
                                        </div>
                                        </div>
                                         <div class=" col-lg-1"></div>
                                        <div class="form-group col-lg-2">
                                            <label><spring:message code="product.re.order.point.label" /> <span style="color:red; font-size:2">*</span></label>
                                           <div class="col-lg-11" style="padding-left: 0px">
                                            <input class="form-control" name="re_order_point" id="re_order_point" value="${product.re_order_point}" oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');" placeholder="<spring:message code="enter.product.re.order.point.label" />" />
                                            <span id="reOrderPointError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
                                        </div>
                                        </div>
                                         </div>
                                       
                                        <div class="row">
                                         
                                      
                                        <div class="col-lg-11">
                                          <div class="col-lg-12" >
                                        <label><spring:message code="product.description.label" /> <span style="color:red; font-size:2">*</span></label>
                                           <%--  <input type="text" class="form-control" name="product_description" id="product_description" value="${product.productName}" required placeholder="<spring:message code="enter.product.description.label" />" /> --%>
                                        	
                                        <textarea class="form-control" rows="3" style=" width: 98.5%;"  required placeholder="<spring:message code="enter.product.description.label" />" />${product.productName}</textarea>
                                        <span id="productDescriptionError" name="product_description" id="product_description" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
                                        </div>
                                        </div>
                                        <div class="col-lg-1"></div>
                                       
                                    </div><!-- /.box-body -->
									<br>
									<br>
						<div class="row" style="text-align: center;">
						 <input type="button"  class="btnCls" onclick="validateProductForm('new')" value="<spring:message code="submit.label" />" />
				 <c:if test="${sessionScope.role == 'super admin'}"> 
				 	<input type="button" class="btnCls buttonMargin"  onclick="viewProductMaster('productmaster','0');" value="<spring:message code="cancel.label" />" />
				 </c:if>
				<c:forEach var="accessControl" items="${sessionScope.genericBusinessSettings}">
				
                    <c:if test="${accessControl.appDocument == 'ProductMaster' && accessControl.write == true && accessControl.read == true}">		
						<input type="button" class="btnCls buttonMargin"  onclick="viewProductMaster('productmaster','0');" value="<spring:message code="cancel.label" />" />
					</c:if>
				</c:forEach>
						</div>
									<br/>
                                    <div class="box-footer">
                                     
                                    </div>
                                    </div>
                                </form>
                            </div>
                           <%--  <input type="hidden" id="subCategories" value='${subCategories}'>  --%>
                            <%-- <input type="hidden" id="subCategory" value='${product.sub_category}' />  --%>
						 	<input type="hidden" id="selectedSuppliers" value='${selectedSuppliers}' />
						 	<input type="hidden" id="selectedStores" value='${selectedStores}' />
						 	<input type="hidden" id="maxRecords" value="${maxRecords}"/>
						 	<input type="hidden" id="searchProducts" value="${searchName}"/>
</div>
</div>
</section><!-- /.content -->

</body>
</html>