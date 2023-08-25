<!--/*
 * Project Name 	        : OmniRetailerCustomer
 * Written By		        : Sahitya
 * file name		        : inventorymanager/retailoutlets/stockLedger.jsp
 * file type		        : JSP
 * description				: The new storage system form is displayed using this jsp
 * */ -->

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    <!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Welcome | Omni Retailer</title>
        <meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>
        <!-- <script type="text/javascript" src="${pageContext.request.contextPath}/js/validation.js"></script> -->
        <!-- DATA TABLES -->
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/omniretailer.css">
        <link href="${pageContext.request.contextPath}/css/datatables/dataTables.bootstrap.css" rel="stylesheet" type="text/css" />
        <script type="text/javascript" src="${pageContext.request.contextPath}/js/warehouseReports/warehousereports.js"></script>
        <script type="text/javascript" src="${pageContext.request.contextPath}/js/controller.js"></script>
        
<style type="text/css">
.allignment{
  /*    width: 13.3%; */
    padding-right: 0px;
    padding-left: 0px;
}
.modal-dialog {
    width: auto;
    margin: 30px auto;
}
.modal-dialog
{
 margin-top: 14.5%;
 }
.billsPopUp
{
	position: relative;
    /* border: 2px solid gray; */
    border-radius: 10px;
   /*  background: #eee; */
    min-height: 400px;
    max-height: 500px;
  /*   margin-right:2%; */
}
.billsPopUpUpArrow
{
	float: right;
    margin-right: 1%;
    font-size: 35px;
    color: gray;
    position: relative;
    margin-top: -2.3%;
    border-bottom: 3px solid lightgrey;
    height: 25px;
    border-bottom-width: 2px;
}
@media (min-width:1400px) and (max-width:1600px)
{
.billsPopUp {
    	margin-left: -20px !important;
      /*   margin-right:2% !important; */
}
.modal-dialog
{
 margin-top: 13%;
 }
.billsPopUpUpArrow {
  margin-top: -2% !important;
  border-bottom-width: 3px !important;
 }
   
 }

@media only screen and (max-width:479px)
{
.billsPopUp {
    margin-right: -30px;
    margin-left: -30px;
}
.summaryImg{
		width: auto;
    float: left;
	}
}
@media (min-width: 1200px){
	.summaryBtn{
		margin-top: 5px;
	}
}
@media (min-width: 1200px){
	.summaryImg{
	    width: 50%;
    float: right;
    margin-right: 5%;
	}
}
.billsPopUp::after {
    content: "";
    position: absolute;
    bottom: 100%;
    /* left: 50%; */
    right: 1.5%;
    /* margin-left: 9px; */
    border-width: 14px;
    border-style: solid;
    /* border-color: transparent transparent #eee transparent; */
}
a.run{
    margin-top: 0px;
    margin-bottom: 0px;
    height: 30px;
    padding-top: 5px;
    padding-bottom: 5px;
    background: #3c8dbc;
    position: relative;
    text-decoration: none;
    color: white;
    display: inline-block;
    cursor: pointer;
    text-align: center;
    width: 100%;
}
a.download{
    display: inline-block;
    /* padding-left: 15px; */
    float: right;
    padding-right: 5px;
    font-size: 22px;
    font-weight: bold;
    cursor: pointer;
    color: grey;
}
a.button{
   position: relative;
    text-decoration: none;
    color: white;
    display: inline-block;
    padding: 7px 10px 29px 10px;
    background: #3c8dbc;
    /* border-radius: 5px; */
    /* box-shadow: 1px 0px 2px #000; */
    cursor: pointer;
    margin-top: 15px;
    height: 23px;
    text-align: center;
    margin-bottom: 15px;
    width: 100%;
}
.col-lg1-2{
    width: 20% !important;
}
.form-control {
  /*   height: 24px; */
    padding: 0px 6px;
    }
    
    .calendar_icon {
    background-position: 3px 3px;
    }
   .form-group {
    margin-bottom: 10px;
}
.blinking{-webkit-animation: blink 1s infinite;-moz-animation: blink 1s infinite;animation: blink 1s infinite;color:#3c8dbc;}
@-webkit-keyframes blink{
 0%{ opacity:0;}
 100%{opacity:1;}
}
@-moz-keyframes blink{
    0%{ opacity:0;}
    100%{opacity:1;}
}
@keyframes blink{
    0%{ opacity:0;}
    100%{opacity:1;}
}
.table-bordered>tbody>tr>td, .table-bordered>tbody>tr>th, .table-bordered>tfoot>tr>td, .table-bordered>tfoot>tr>th, .table-bordered>thead>tr>td, .table-bordered>thead>tr>th{
 border: 0px !important;
}
</style>  
<script>
$(document).ready(function(){
callCalender('from');
callCalender('to');
//	Added to fetch the locations based on zone 
// var zone = $("#outletZone").val();
// if( zone != null && zone !="")
// 	 {
// 	 	searchlocationsBasedOnZoneForDashboard('outletZone','outletLocation','');
// 	 }
	
//if($("#stocksObj").val()!="" && $("#stocksLineChart").length > 0)
    //new Chart(document.getElementById("stocksLineChart").getContext("2d")).Line(getprocurementconsumptiongraph(),newopts);
});

</script>
</head>
<body>

<%-- <section class="content-header">
   <h1><spring:message code="outlet.management.label" />
     <small><p id="heading"><spring:message code="stocks.label" /></p></small>
    </h1>
      <ol class="breadcrumb">
      	<li><a style="cursor: pointer;" onclick="return viewDashboard('inventorymanager');"><i class="fa fa-dashboard"></i><spring:message code="home.label" /></a></li>
        <li class="active"><spring:message code="outlet.management.label" /></li>
     </ol>
 </section> --%>
 <!-- Content Header (Page header) -->

<!-- Main content -->
<section class="content">
<div class="row">
  <div class="col-lg-12">
  <div class="box box-primary">
          <div class="box-header" align="center">
				<h3 class="box-title" >
					<%-- <spring:message code="salesvsprocurement" /> --%>
				</h3>			
				</div><!-- /.box-header -->
			<form id="xReportsDisplay">
                    <div class="box-body table-responsive">
                     <div class="col-lg-11" style=" background: #f4f4f4;    padding: 10px 20px;    width: 88%;">
                <div class="row">
                         <div class="col-lg1-2 col-lg-2">
                       <div class="col-lg-12" style="padding-left:0px;padding-right: 0px;">
                        <label><spring:message code="zone.label"/></label>
                           <select class="form-control" id="outletZone" onchange="searchZonallocationsBasedOnZone('outletZone','outletLocation','')">
                           		 <option value=""><spring:message code="ALL.label"/></option>
	                            <c:forEach var="zoneList" items="${zoneList}">
									<option value="${zoneList.zoneID}" ${zoneList.zoneID == zone ? 'selected' : ''} id="${zoneList}" >${zoneList.zoneID}</option>
						 		</c:forEach>
	                        </select>
                         </div>
                      </div>
                      <div class="col-lg1-2 col-lg-2">
                       <div class="col-lg-12" style="padding-left:0px;padding-right: 0px;">
                           <label><spring:message code="category.label"/></label>
                           <select class="form-control" id="outletCategory" onchange="searchSubCategories('outletCategory','outletSubcategory')">
                           		 <option value=""><spring:message code="ALL.label"/></option>
	                            <c:forEach var="categoryList" items="${categoryList}">
									<option value="${categoryList.categoryName}" ${categoryList.categoryName == category ? 'selected' : ''} id="${categoryList.categoryName}" >${categoryList.categoryName}</option>
						 		</c:forEach>
	                        </select>
                      </div>
                      </div>
                          <div class="col-lg1-2 col-lg-2">
                       <div class="col-lg-12" style="padding-left:0px;padding-right: 0px;">
                           <label><spring:message code="section.label"/></label>
                           <select class="form-control" id="section" >
                           <c:if test="${not empty section}">
                            <option value="${section}">${section}</option>
                           </c:if>
                           		 <option value=""><spring:message code="ALL.label"/></option>
                           		 
	                            
	                        </select>
                      </div>
                      </div>
                    <div class="col-lg1-2 col-lg-2">
                       <div class="col-lg-12" style="padding-left:0px;padding-right: 0px;">
                           <label><spring:message code="brand.label"/></label>
                           <select class="form-control" id="outletBrandId" >
                           		 <option value=""><spring:message code="ALL.label"/></option>
	                            <c:forEach var="brandsList" items="${brandsList}">
									<option value="${brandsList}" ${brandsList == brand ? 'selected' : ''} id="${brandsList}" >${brandsList}</option>
						 		</c:forEach>
	                        </select>
                      </div>
                      </div>
                  
                       
                         <div class="col-lg1-2 col-lg-2">
              <div class="col-lg-10" style="padding-left:0px;padding-right: 0px;">
                 		<label><spring:message code="offer_start_date.label"/></label>
                	 	<input class="form-control calendar_icon form-group" readonly="readonly" value="${startdate}" style="background-color: white;" id="from" size="20" type="text" onfocus="callCalender('from')" onclick="callCalender('from')" placeholder="DD/MM/YYYY" />
	              </div>
	            </div>
	           
                    </div>
                     <div class="row">
                       <div class="col-lg1-2 col-lg-2">
                       <div class="col-lg-12" style="padding-left:0px;padding-right: 0px;">
                           <label><spring:message code="location.label"/></label>
                           <select class="form-control" id="outletLocation" onchange="searchCategorybasedonlocation('outletLocation','outletCategory','outletBrandId');">
<%--                            		 <option value=""><spring:message code="ALL.label"/></option> --%>
	                            <c:forEach var="location" items="${locationsList}">
<%-- 									<option value="${location}" ${location == selectedLocation ? 'selected' : ''} id="${location}" >${location}</option> --%>
						 		<c:choose>
							   <c:when test="${location.description == ''}">
							    <option value="${location.locationId}" ${location.locationId == selectedLocation ? 'selected' : ''}>${location.locationId}</option>
							   </c:when>
							  <c:otherwise>
							   <option value="${location.locationId}" ${location.locationId == selectedLocation ? 'selected' : ''}>${location.locationId}-${location.description}</option>
							  </c:otherwise>
							 </c:choose>
						 		</c:forEach>
	                        </select>
                      </div>
                      </div>
                   
                         <div class="col-lg1-2 col-lg-2">
                       <div class="col-lg-12" style="padding-left:0px;padding-right: 0px;">
                           <label><spring:message code="subcategory.label"/></label>
                           <select class="form-control" id="outletSubcategory" onchange="searchSectionsBasedOnSubCategory('outletCategory','outletSubcategory', 'section');">
                           		   <c:if test="${not empty subcategory}">
                            <option value="${subcategory}">${subcategory}</option>
                           </c:if>
                           		 <option value=""><spring:message code="ALL.label"/></option>
                        
	                        </select>
                      </div>
                      </div>
                       <div class="col-lg1-2 col-lg-2">
                       <div class="col-lg-12" style="padding-left:0px;padding-right: 0px;">
                         <label>Supplier</label>
                           <select class="form-control" id="outletSupplierId" >
                           		 <option value=""><spring:message code="ALL.label"/></option>
	                            <c:forEach var="supplierList" items="${supplierList}">
									<option value="${supplierList.firmName}" ${supplierList.firmName == supplierId ? 'selected' : ''} id="${supplierList.firmName}" >${supplierList.firmName}</option>
						 		</c:forEach>
	                        </select>
                      </div>
                      </div>
                            <div class="col-lg1-2 col-lg-2">
                   <div class="col-lg-12" style="padding-left:0px;padding-right: 0px;">
                           <label><spring:message code="department.label"/></label>
                           <select class="form-control" id="outletDepartmentId" onchange="searchSubDepartmens('outletDepartmentId', 'outletSubDepartmentId');">
                           		 <option value=""><spring:message code="ALL.label"/></option>
	                            <c:forEach var="departmentList" items="${departmentList}">
									<option value="${departmentList.primaryDepartment}" ${departmentList.primaryDepartment == department ? 'selected' : ''} id="${departmentList.primaryDepartment}" >${departmentList.primaryDepartment}</option>
						 		</c:forEach>
	                        </select>
                      </div>
                      </div>
                      <div class="col-lg1-2 col-lg-2">
	               <div class="col-lg-10" style="padding-left:0px;padding-right: 0px;">
	                   <label><spring:message code="offer_end_date.label"/></label>
	                 	<input class="form-control calendar_icon form-group" readonly="readonly" value="${enddate}" style="background-color: white;" id="to" size="20" type="text" onfocus="callCalender('to')" onclick="callCalender('to')" placeholder="DD/MM/YYYY" />
		           </div>
		          </div>
                    </div>
                  </div>
                  <div class="col-lg-1" style="    width: 12%;    background: #ccc;">
                  <div class="col-lg-12" style="    border-top: 1px solid #ccc; border-bottom: 1px solid #ccc;">
                  <div class="row">
                  <a onclick="viewNewProfitabilityReports('salesReportnewProfitabilityReport','0','');" class="button"><spring:message code="searchbutton.label"/></a>
                  </div>
                  <div class="row">
                  <a onclick="resetForm();" class="button"><spring:message code="clearbutton.label"/></a>
                  </div>
                  </div></div> 
                  <div class="col-lg-12">
                  <br>
                  </div>
                  
                 <%--  <div class="col-lg-12 col-xs-12" style="padding-left: 0px;padding-right: 0px;">
                      	 <input type="text" value="${searchName}"  class="form-control searchItems searchBar" style=""  id="supplierReport" placeholder="<spring:message code="search.items.here.label" />" />
							<div class="services">
				    			<div class="items">
				     				<ul class="matchedStringUl supplierReport" style=""></ul>
				   				</div>
							</div>
						<input type="hidden" id="stock" value="${searchName}">
                    </div> --%>
                      <div>
                      
                      <div class="col-lg-1 col-xs-2" style="padding-left:0px">
				                      	<select class="form-control" id="maxRecords" style="padding: 3px 4px;" onchange="viewNewProfitabilityReports('salesReportnewProfitabilityReport','0','');">
				                      		<option value="10" ${maxRecords == '10' ? 'selected' : ''}>10</option>
				                      		<option value="25" ${maxRecords == '25' ? 'selected' : ''}>25</option>
				                      		<option value="50" ${maxRecords == '50' ? 'selected' : ''}>50</option>
				                     		<option value="100" ${maxRecords == '100' ? 'selected' : ''}>100</option>
				                      	</select>
				                      </div>
                      <div class="col-lg-10"></div>
                       <div class="col-lg-1" style="text-align: center;padding-right: 0px;padding-bottom: 4px;">
		   <input type="button" class="addBtn btn bg-olive btn-inline" data-toggle="modal" data-target="#myModalIos"  style="font-size: 16px;" value="<spring:message code="save.label" />" />
		 </div> 
                      
                      
                      
               <div id="example1_wrapper" class="dataTables_wrapper form-inline" role="grid" style="overflow-x: auto;width:100%;position: relative;white-space: nowrap;">
                     
				         <table id="example1" class="table table-bordered table-striped" >
                            <thead style=" color: #ffffff">
                               <tr>
                                	<th style="border: 2px solid #444 !important;"><spring:message code="report.sno.label" /></th>
                                    <th style="border: 2px solid #444 !important;"><spring:message code="category.label" /></th>
                                    <th style="border: 2px solid #444 !important;"><spring:message code="subcategory.label" /></th>
                                     <th style="border: 2px solid #444 !important;"><spring:message code="section.label" /></th>
                                     <th style="border: 2px solid #444 !important;"><spring:message code="storecode.label" /></th>
                                     <th style="border: 2px solid #444 !important;"><spring:message code="store.location.name.label" /></th>
                                     <th style="border: 2px solid #444 !important;"><spring:message code="supplier.vendor.name" /></th>
                                      <th style="border: 2px solid #444 !important;"><spring:message code="productid.label" /></th>
                                      <th style="border: 2px solid #444 !important;"><spring:message code="ean.code.label" /></th>  
                                      <th style="border: 2px solid #444 !important;"><spring:message code="product.name.label" /></th>
                                      <th style="border: 2px solid #444 !important;"><spring:message code="description.label" />&nbsp;/&nbsp;<spring:message code="technical.specification.label" /></th>  
                                      <th style="border: 2px solid #444 !important;"><spring:message code="brand.label" /></th>
                                      <th style="border: 2px solid #444 !important;"><spring:message code="style.label" /></th>
                                      <th style="border: 2px solid #444 !important;"><spring:message code="size.label" /></th>
                                       <th style="border: 2px solid #444 !important;"><spring:message code="colour.label" /></th>
                                       <th style="border: 2px solid #444 !important;"><spring:message code="qty.ordered.label" /></th>
                                       <th style=" border: 2px solid #444 !important;"><spring:message code="amt.label" /></th>
                                	       <th style=" border: 2px solid #444 !important;"><spring:message code="qty.reced.label" /></th>
                                    <th style="border: 2px solid #444 !important;"><spring:message code="amt.label" /></th>
                                    <th style="border: 2px solid #444 !important;"><spring:message code="invoice.no.label" /></th>
                                     
                                       <th style="border: 2px solid #444 !important;"><spring:message code="customer.newfeedback.date" /></th>
                               
                                   
                                      
                                       <th style="border: 2px solid #444 !important;"><spring:message code="po.no.label" /></th>
                                        <th style="border: 2px solid #444 !important;"><spring:message code="Grn.no.label" /></th>
                                           <th style="border: 2px solid #444 !important;"><spring:message code="created.date.label" /></th>
                                       <th style="border: 2px solid #444 !important;"><spring:message code="grn.value.label" /></th>
                                      
                                     <th style="border: 2px solid #444 !important;"><spring:message code="cp.label" />&nbsp;<spring:message code="w/o.label" />&nbsp;<spring:message code="gst.label" /></th>
									<th style="border: 2px solid #444 !important;"><spring:message code="cp.label" />&nbsp;with&nbsp;<spring:message code="disc.label" /></th>	
                                     <th style="border: 2px solid #444 !important;"><spring:message code="gst.label" />&nbsp;<spring:message code="rate.label" /></th>
                                      <th style="border: 2px solid #444 !important;"><spring:message code="input.label" />&nbsp;<spring:message code="gst.label" /></th>
                                      <th style="border: 2px solid #444 !important;"><spring:message code="cp.label" />&nbsp;with&nbsp;<spring:message code="gst.label" /></th>
                                       <th style="border: 2px solid #444 !important;"><spring:message code="frieght.label" />&nbsp;%</th>
                                       <th style="border: 2px solid #444 !important;"><spring:message code="frieght.label" />&nbsp;value</th>
                                        <th style="border: 2px solid #444 !important;"><spring:message code="frieght.qty.label" /></th>
                                       <th style="border: 2px solid #444 !important;"><spring:message code="cp.label" /></th>
                                        <th style="border: 2px solid #444 !important;"><spring:message code="mrp.label" /></th>
                                         <th style="border: 2px solid #444 !important;"><spring:message code="offer.price.label" /></th>
                                         <th style="border: 2px solid #444 !important;"><spring:message code="sale.qty.label" /></th>
                                          <th style="border: 2px solid #444 !important;"><spring:message code="sale.value.label" /></th>
                                        <th style="border: 2px solid #444 !important;"><spring:message code="margin.value.label" /></th>
                                          <th style="border: 2px solid #444 !important;"><spring:message code="margin.per.label" />&nbsp;%</th>
                                         <th style="border: 2px solid #444 !important;"><spring:message code="sales.label" />&nbsp;<spring:message code="w/o.label" />&nbsp;<spring:message code="gst.label" /></th>
                                         <th style="border: 2px solid #444 !important;"><spring:message code="output.label" />&nbsp;<spring:message code="gst.label" /></th>          
                                                   
                                      
                                         <th colspan="1" style="border: 2px solid #444 !important;"><spring:message code="category.cont.label" /></th>
                                          <th colspan="1" style="border: 2px solid #444 !important;"><spring:message code="store.cont.label" /></th>
                                           <th colspan="3" style="border: 2px solid #444 !important;">STOCK/SQFT</th>
                                         
                                          <th colspan="3" style="border: 2px solid #444 !important;"><spring:message code="area.label" /></th>
                                          <th colspan="3" style="border: 2px solid #444 !important;"><spring:message code="sale.sqft.label" /></th>
                                           <th style="border: 2px solid #444 !important;"><spring:message code="break.even.qty.label" /></th>
                                         
                                            <th style="border: 2px solid #444 !important;"><spring:message code="break.even.value.label" /></th>       
                                         
                                          <th style=" border: 2px solid #444 !important;"><spring:message code="available.qty.label" /></th>
                                </tr>
                                
                            
                                </thead>
                                 <tbody style="text-align: center;">
                                 
                                 
                                  <c:set var="qtyOrderd" value="0.0"></c:set>
                                   <c:set var="qtyReceiced" value="0.0"></c:set>
                                 <c:set var="quantityVal" value="0.0"></c:set>
                                 <c:set var="salesVal" value="0.0"></c:set>
                                  <c:set var="marginVal" value="0.0"></c:set>
                                    <c:set var="availableVal" value="0.0"></c:set>
                                    <c:set var="breakEvenQty" value="0.0"></c:set>
                                           <c:forEach var="warehousereport" items="${warehousereport.reportsList}" varStatus="theCount">
										      <tr>
                              <td style="">${theCount.index+index}</td>
                              <td style="text-align: left;">${warehousereport.category}</td>
							<td style="text-align: left;">${warehousereport.subCategory}</td>
                               
                              <td colspan="2" style="border: 2px solid #444 !important;">${warehousereport.section}</td>
                              
                              <td style="border: 2px solid #444 !important;">${warehousereport.location}</td>
                              <td style="text-align: left;">${warehousereport.supplierName}</td>
											<td style="text-align: left;">${warehousereport.skuId}</td>
											<td>${warehousereport.ean}</td>
											<td style="text-align: left;">${warehousereport.itemDesc}</td>
                           
                              <td style="border: 2px solid #444 !important;">${warehousereport.itemDesc}</td>
                              
                               	<td style="text-align: left;">${warehousereport.brandName}</td>
											<td>${warehousereport.style}</td>
											<td>${warehousereport.size}</td>
											<td>${warehousereport.color}</td>
                            
                            
                             <td>${warehousereport.poQty}</td> 
                                       <td>${warehousereport.poValue}</td> 
                            <td>${warehousereport.grnQty}</td> 
                                       <td>${warehousereport.grnValue}</td> 
                              <td style="border: 2px solid #444 !important;">${warehousereport.invoiceRef}</td>
                              <td style="border: 2px solid #444 !important;">${warehousereport.poDatestr}</td>
                              <td style="border: 2px solid #444 !important;">${warehousereport.poRef}</td>
                              
                               <td style="border: 2px solid #444 !important;">${warehousereport.noteRef}</td>
                              <td style="border: 2px solid #444 !important;">${warehousereport.grnDateStr}</td>
                              <td style="border: 2px solid #444 !important;">${warehousereport.grnValue}</td>
                             	<td>${warehousereport.costPriceWithTax}</td>
											<td>${warehousereport.costPricewithDiscount}</td>
                              <td style="border: 2px solid #444 !important;">${warehousereport.taxRate}</td>
                              <td style="border: 2px solid #444 !important;">${warehousereport.taxValue}</td>
                            
                            
                             <td style="border: 2px solid #444 !important;">${warehousereport.costPriceWithTax}</td>
                              <td style="border: 2px solid #444 !important;">${warehousereport.shipmentPer}</td>
                             <td>${warehousereport.shipmentcharges}</td>
											<td>${warehousereport.shipmentChargesperQty}</td>
											<td>${warehousereport.costPrice}</td>
											<td>${warehousereport.salePrice}</td>
                              <td style="border: 2px solid #444 !important;">${warehousereport.discount}</td>
                            
                            
                            	<td>${warehousereport.quantity}</td>
											<td>${warehousereport.price}</td>
                             	<td>${warehousereport.marginvalue}</td>
											<td>${warehousereport.marginPercentage}%</td>
                              <td style="border: 2px solid #444 !important;">${warehousereport.price-warehousereport.saleTaxValue}</td>
                              <td style="border: 2px solid #444 !important;">${warehousereport.saleTaxValue}</td>
                             
                            
                            
                            <td style="border: 2px solid #444 !important;">${warehousereport.catContr}</td>
                            
                            
                            
                             
                            <td style="border: 2px solid #444 !important;">${warehousereport.storeContr}</td>
                             
                            <td style="border: 2px solid #444 !important;"><spring:message code="wtd.label" /></td>
                            <td style="border: 2px solid #444 !important;"><spring:message code="mtd.label" /></td>
                            <td style="border: 2px solid #444 !important;"><spring:message code="ytd.label" /></td>
                            
                             
                            <td style="border: 2px solid #444 !important;"></td>
                            <td style="border: 2px solid #444 !important;"></td>
                            <td style="border: 2px solid #444 !important;"></td>
                            
                             
                            <td style="border: 2px solid #444 !important;"><spring:message code="wtd.label" /></td>
                            <td style="border: 2px solid #444 !important;"><spring:message code="mtd.label" /></td>
                            <td style="border: 2px solid #444 !important;"><spring:message code="ytd.label" /></td>
                            
                            
                            <td style="border: 2px solid #444 !important;">${warehousereport.breakEvenQty}</td>
                              <td style="border: 2px solid #444 !important;">${warehousereport.breakEvenValue}</td>
                            <td style="border: 2px solid #444 !important;">${warehousereport.availQty}</td>
                            
                              </tr>

									<%-- 	<tr style="border-bottom: 2px solid #ccc;">
											<td>${theCount.index+index}</td>
											<td style="text-align: left;">${warehousereport.category}</td>
											<td style="text-align: left;">${warehousereport.subCategory}</td>
											<td style="text-align: left;">${warehousereport.section}</td>
											<td style="text-align: left;">${warehousereport.supplierName}</td>
											<td style="text-align: left;">${warehousereport.skuId}</td>
											<td>${warehousereport.ean}</td>
											<td style="text-align: left;">${warehousereport.itemDesc}</td>
											<!-- <td></td> -->
											<td style="text-align: left;">${warehousereport.brandName}</td>
											<td>${warehousereport.style}</td>
											<td>${warehousereport.size}</td>
											<td>${warehousereport.color}</td>
											<td>${warehousereport.measureRange}</td>
											<td>${warehousereport.productRange}</td>
											<td>${warehousereport.costPriceWithTax}</td>
											<td>${warehousereport.costPricewithDiscount}</td>
											<td>${warehousereport.shipmentcharges}</td>
											<td>${warehousereport.shipmentChargesperQty}</td>
											<td>${warehousereport.costPrice}</td>
											<td>${warehousereport.salePrice}</td>
												<td>${warehousereport.quantity}</td>
											<td>${warehousereport.price}</td>
												 <td>${warehousereport.grnQty}</td> 
                                       <td>${warehousereport.grnValue}</td> 
											<td>${warehousereport.marginvalue}</td>
											<td>${warehousereport.marginPercentage}%</td>
										</tr> --%>
										
										<!--added pagewise total by manasa  -->
										
										 <c:set var="qtyOrderd" value="${qtyOrderd+warehousereport.poQty}"></c:set>
										  <c:set var="qtyReceiced" value="${qtyReceiced+warehousereport.grnQty}"></c:set>
										 
                                         <c:set var="quantityVal" value="${quantityVal+warehousereport.quantity}"></c:set>
                                         <c:set var="salesVal" value="${salesVal+warehousereport.price}"></c:set>
                                         <c:set var="marginVal" value="${marginVal+warehousereport.marginvalue}"></c:set>
                                         <c:set var="availableVal" value="${availableVal+warehousereport.availQty}"></c:set>
                                          <c:set var="breakEvenQty" value="${breakEvenQty+warehousereport.breakEvenQty}"></c:set>

									</c:forEach>
									
									
									
									<tr>
									
									<td></td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
									
									
									<td>${qtyOrderd}</td>
									<td></td>

									
									<td>${qtyReceiced}</td>
									
									
									
									
									
									<td></td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
									
									
									
									<td></td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
									
									
									
									<td></td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
									<td></td> 
									<td></td>
									
									<td>${quantityVal}</td>
									<td>${salesVal}</td>
									<td>${marginVal}</td>
									
									
									
									<td></td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
									
									<td></td>
									<td>${breakEvenQty}</td>
									<td></td>
									
									<td>${availableVal}</td>
									
								
									</tr>
									
									
									
									
									
									</tbody>
                                
                          
                         
                      </table></div>
              <div class="row">
               <input type="hidden" id="flowUnder" value="${flowUnder}">
              	<c:if test="${index-1 == 0 && totalRecords >10}">
              		<div class="form-group col-lg-6" style="text-align: left;">
              		<input type="button" class='paginationButton' value="&#60;" onclick=""> ${index} - ${totalValue} of ${totalRecords} 
              		<input type="button" class='paginationButton' value="&#62;" onclick="viewNewProfitabilityReports('salesReportnewProfitabilityReport','${totalValue}','')">
              	</div>
              	</c:if>
              	
              	<c:if test="${totalValue == totalRecords}">
              			<c:if test="${totalValue-10 >0}">
              				<div class="form-group col-lg-6" style="text-align: left;">
              		<input type="button" class='paginationButton' value="&#60;" onclick="return viewNewProfitabilityReports('salesReportnewProfitabilityReport','${index - 11}','');"> ${index} - ${totalValue} of ${totalRecords} 
              		<input type="button" class='paginationButton' value="&#62;" >
              		</div>
              			</c:if>
              			<c:if test="${totalValue-10 <= 0}">
              		<div class="form-group col-lg-6" style="text-align: left;">
              		<input type="button" class='paginationButton' value="&#60;"> ${index} - ${totalValue} of ${totalRecords} 
              		<input type="button" class='paginationButton' value="&#62;" >
              	</div>
              	</c:if>
              	</c:if>
              	<c:if test="${index-1 != 0 &&  totalValue != totalRecords}">
              		<div class="form-group col-lg-6" style="text-align: left;">
              		<input type="button" class='paginationButton' value="&#60;" onclick="return viewNewProfitabilityReports('salesReportnewProfitabilityReport','${index - 11}','');"> ${index} - ${totalValue} of ${totalRecords} .
              		<input type="button" class='paginationButton' value="&#62;" onclick="viewNewProfitabilityReports('salesReportnewProfitabilityReport','${totalValue}','')">
              	</div> 
              	</c:if>
              
              
              
              
              	<div class="col-lg-6" style="float:right;">
              	<div class="col-lg-8" style="text-align: right;padding-right: 0px;margin-top: 2px;font-size: 16px;"><spring:message code="pages.label" /></div>
              	<div class="col-lg-2" style="padding-right: 0px;">
              		<select class="form-control" id="pagination">
              		<c:set var="totalRecords" value="${totalRecords+1}"></c:set>
              	<c:forEach var="i" begin="0" end="${totalRecords}">
              	<c:if test="${(totalRecords)>0}">
              		<option value="${(i*maxRecords)}" ${index-1 == i*maxRecords ? 'selected' : ''}> ${i+1}</option>
              		<c:set var="totalRecords" value="${totalRecords-maxRecords}"></c:set>
              	</c:if>
				</c:forEach>
					</select>
              	
              	</div>
              		<div class="col-lg-2" style="padding-right: 0px;">
              		  <input type="button" onclick="viewNewProfitabilityReports('salesReportnewProfitabilityReport',document.getElementById('pagination').value,'')" class="btn bg-olive btn-inline  addBtn" value="GO">
              		</div>
             
				</div>
              </div>      
               </div>
               </div>   
              
              
           
              
                           <div id="triggerEvent"></div>
                           
                           
                            <div class="modal fade" id="myModalIos" role="dialog" tabindex="-1">
    <div class="modal-dialog iosmodeldialog">
    
      <!-- Modal content-->
      <div class="modal-content iospopup">
        <div class="modal-header">
       
          <button type="button" class="close" onclick="" data-dismiss="modal">&times;</button>
        </div>
        <div class="modal-body">
       <div class="form-group col-lg-12" style="padding: 0px;font-size: 15px">Are you sure,you want to save the  file
       
          <!-- <div class="col-lg-1"> -->
          <input type="hidden" id="stockdownloadurl" value="${downloadurl}">
        <!--  </div> -->
         </div>
        <div class="form-group col-lg-12"></div>
          <div class="col-lg-4 col-sm-6 col-xs-6" style=""></div>
          <div class="form-group col-lg-8 col-sm-6 col-xs-6" style="padding-left: 0px; padding-right: 0px;">
<div class="col-lg-6 col-sm-6 col-xs-6" style="padding-left: 5px; padding-right: 5px;">
 <input type="button" class="iosclosebutton1" onclick="viewNewProfitabilityReports('salesReportnewProfitabilityReport','0','save')"  value="Ok">
</div>
<div class="col-lg-6 col-sm-6 col-xs-6" style="padding-left: 5px; padding-right: 5px;">
  <input type="button" class="iosclosebutton1" data-dismiss="modal" value="Cancel">
</div></div>
   <br/>
        </div>
        <br/>
        <div class="modal-footer" style="padding:0px;">
         <!--  <input type="button" class="iosclosebutton" data-dismiss="modal" value="Close"/> -->
        </div>
      </div>
      
		</div>
		</div>
    
    
                           
                           
                           
    <!-- COMPOSE MESSAGE MODAL -->
    
    <div class="col-sm-12 col-lg-12 col-xs-12">
            
         <div class="modal fade popup-display" id="items-modal" tabindex="-1" role="dialog" aria-hidden="true">
            <div class="modal-dialog">
             <div class="col-sm-2 col-lg-2 col-xs-0">
    		</div>
           <div class="col-sm-10 col-lg-10 col-xs-12">
             <div class="modal-content billsPopUp" style="">
          <!--    <i class="fa fa-angle-up billsPopUpUpArrow" aria-hidden="true"></i> -->
                 <div class="modal-header" style="border-bottom-color: #fff !important;">
                        <button type="button" class="close" style="font-size: 30px;" data-dismiss="modal" aria-hidden="true">&times;</button>
                        <h4 class="modal-title" style="text-align: center;" ><spring:message code="procurementvsconsumption.label" /><h4>
                    </div>
             <form action="#" method="post">
                 <div class="modal-body">
                  <div class="box-body table-responsive" id="summary">
                <%--   <canvas id="stocksLineChart" height="350 !important;" width="600  !important;"></canvas> --%>
                 </div>
              </div>
             </form> 
             </div><!-- /.modal-content -->
         </div><!-- /.modal-dialog -->
     </div><!-- /.modal -->
 	</div>
  </div>
              
              
                                </div><!-- /.box-body -->
                            </div><!-- /.box -->
  
</div>
</div>
</section>
 <script src="${pageContext.request.contextPath}/js/plugins/datatables/jquery.dataTables.js" type="text/javascript"></script>
        <script src="${pageContext.request.contextPath}/js/plugins/datatables/dataTables.bootstrap.js" type="text/javascript"></script>
        <script type="text/javascript">
            $(function() {
                $("#productstocks").dataTable({
       			  "bPaginate": false,
                  "bLengthChange": false,
                  "bFilter": false,
                  "bSort": false,
                  "bInfo": false,
                  "bAutoWidth": false
    			});
            });
        </script>
        <input type="hidden" id="deleteActionLabel" value="<spring:message code="receiptstock.label" />"/>
</body>
</html>