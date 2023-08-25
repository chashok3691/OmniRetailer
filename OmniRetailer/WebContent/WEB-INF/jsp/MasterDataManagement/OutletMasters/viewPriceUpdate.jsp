<!--/*
 * Project Name 	        : OmniRetailerCustomer
 * Written By		        : Manasa
 * file name		        : MasterDataManagement/OutletMasters/viewPriceUpdate
 * file type		        : JSP
 * description				: The sku  details table is displayed using this jsp
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
       <%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
       <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
        <!-- DATA TABLES -->
        <link href="${pageContext.request.contextPath}/css/datatables/dataTables.bootstrap.css" rel="stylesheet" type="text/css" />
          <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/jquery.calendars.picker.css">
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.calendars.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.calendars.plus.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.calendars.picker.js"></script>
       <%--   <script type="text/javascript" src="${pageContext.request.contextPath}/js/validation.js"></script> --%>
          <script type="text/javascript" src="${pageContext.request.contextPath}/js/controller.js"></script>
          <script type="text/javascript" src="${pageContext.request.contextPath}/js/priceUpdate.js"></script>
         
         <%--  <script type="text/javascript" src="${pageContext.request.contextPath}/js/stockTransfer/stockRequest.js"></script> --%>
<style type="text/css">
.buttons {
	float: right;
	padding-top: 0px;
	margin-right: 1%;
	margin-top:1%;
}
.iosclosebutton1 {
    width: 100%;
    border: 1px solid #3c8dbc;
    background: #3c8dbc;
    color: #fff;
    font-size: 15px!important;
    padding: 0px 0 0px 0;
    height: 24px!important;
    font-size: 18px;
    letter-spacing: 1px;
    float: right;
}
.list a.button {
position:relative;
	text-decoration: none;
	color: #FFF;
	display: inline-block;
	padding: 5px 15px 5px 15px;
	background: #3c8dbc;

	border-radius: 5px;
	box-shadow:1px 0px 2px #000;
	cursor:pointer;
	behavior : url(css/PIE.htc); 
}
a.button{
   position: relative;
    text-decoration: none;
    color: white;
    display: inline-block;
    padding: 7px 10px 32px 10px;
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
.calendar_icon{
	background-color: white;
    color: #666;
    padding: 8px 0px 8px 27px!important;
    background: url(http://soe.syr.edu/images/cal_icon_mini.gif) no-repeat left center #fff;
    width: 100%;
    background-position: 5px 5px;
    border: 1px solid #DFDFDF;
    border-radius: 4px;
    -webkit-transition: all .2s ease-out;
    -moz-transition: all .2s ease-out;
    -ms-transition: all .2s ease-out;
    transition: all .2s ease-out;
    box-shadow: none;
    -webkit-box-sizing: border-box;
    -moz-box-sizing: border-box;
    box-sizing: border-box;
}
.col-lg1-2{
    width: 25% !important;
}
.iosclosebutton {
    width: 25%;
    border: 1px solid #3c8dbc;
    background: #3c8dbc;
    color: #fff;
    font-size: 15px!important;
    padding: 3px 0 4px 0;
    height: 30px!important;
    font-size: 18px;
    letter-spacing: 1px;
    float: right;
}
.iospopup {
    width: 22%!important;
    margin-left:45%;
    margin-top: 0%;
    border-radius: 0;
}
.modal-dialog {
    width: auto;
    margin: 30px auto;
}
.modal-dialog
{
 margin-top: 14.5%;
 }
 .imgWidth
 {
 width:52%;
 height:30px;
 }
 
.billsPopUp
{
	position: relative;
    border: 2px solid gray;
    border-radius: 10px;
    background: #eee;
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
		margin-top: 3px;
	}
}
@media (min-width: 1200px){
	.summaryImg{
	     width: 50%;
    float: right;
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
    border-color: transparent transparent #eee transparent;
}
.fa1{
   /*    border: 1px solid grey;
    border-radius: 50%;
    width: 29px;
    text-align: center;
    height: 28px; */
        margin-top: -10px;
    font-size: 26px;
        cursor: pointer;
    color: grey;
}
.fa-sort-asc{
margin-top: 5px !important;
}
.modal-header .close {
    margin-top: -9px;
    color: #000;
    /* border: 1px solid #000; */
}

.sticky-col {
  position: sticky !important;
  position: -webkit-sticky;    
  z-index: 9;
  /* background-color: white; */
}

.first-col {
  width: 100px;
  min-width: 100px;
  max-width: 100px;
  left: 0px;    
}

.second-col {
    width: 150px;
    min-width: 150px;
    max-width: 150px;
    left: 60px;
}
.third-col {
    width: 150px;
    min-width: 150px;
    max-width: 150px;
    left: 160px;
}
</style> 
<script type="text/javascript">
$(document).ready(function(){
	//callCalender('fromDate');
	//callCalender('to');
	focusDiv("Error");
 var err = $("#err").val();
if(err != "")
	

	$("#searchPriceUpdate").val($("#priceUpdateSearch").val());
	//if($("#searchSKU").val().trim()!="")
		$("#priceUpdateSearch").focus();
	});
	$('document').ready(function(){
	    $('#mySearch').click(function(){
	        var search = $('#searchPriceUpdate').val();
	        return searchPriceUpdate(search,'','0','${flowLocation}');
	    })
	    $('#searchPriceUpdate').keypress(function(e){
	        if(e.which == 13){//Enter key pressed
	            $('#mySearch').click();//Trigger search button click event
	        }
	    });

	var countId = $('#countId').val(); 
	var categoryExpand = $('#categoryExpand').val();
	/*  $("img").click(function(){
		// $("#activatePurpose"+'countId').show();
		expandPrice(countId);
		// focusDiv('activatePurpose'+'countId');
	 });  */
	
	
	
var sDate=$("#sd").val();
var s=sDate.split(' ');
$("#fromDate").val(s[0]);

var eDate=$("#ed").val();
var e=eDate.split(' ');
$("#to").val(e[0]); 

// added to fetch locations based on zone
var zone = $("#outletZone").val();
if( zone != null && zone !="")
	 {
	 	searchlocationsBasedOnZoneForDashboard('outletZone','${flowLocation}','');
	 }

});
	
	
	</script>        
</head>
<body>
 <!-- Content Header (Page header) -->


<!-- Main content -->
<section class="content">
<div class="row">
  <div class="col-xs-12">
  <div class="box box-primary">
  
                      <div class="box-body table-responsive">
                          <div class="row">
	                          <div class="form-group col-lg-12" style="text-align: center;">
		                			<label style="font-size: 22px;text-align: center"><spring:message code="price.update.label" /></label>
		                     </div>
		                  </div>
		                   <div class="col-lg-11" style=" background: #f4f4f4;    padding: 16px 20px;    width: 88%;">
                                <div class="row">
                                   <div class="col-lg1-2 col-lg-2">
                                      <div class="col-lg-12" style="padding-left:0px;padding-right: 0px;">
                                        <label><spring:message code="zone.label"/></label>
                                           <select class="form-control" id="outletZone" onchange="searchlocationsBasedOnZoneForDashboard('outletZone','${flowLocation}','')">
                           		              <option value=""><spring:message code="ALL.label"/></option>
	                                         <c:forEach var="zoneList" items="${zoneList}">
													<option value="${zoneList.zoneID}" ${zoneList.zoneID == zone ? 'selected' : ''} id="${zoneList}">${zoneList.zoneID}</option>
												</c:forEach>
	                                        </select>
                                      </div>
                                   </div>
                                   <div class="col-lg1-2 col-lg-2">
                                     <div class="col-lg-12" style="padding-left:0px;padding-right: 0px;">
                                       <label><spring:message code="category.label"/></label>
                                        <select class="form-control" id="outletCategoryId" onchange="searchSubCategories('outletCategoryId','priceoutletSubcategory')">
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
                           		         <option value=""><spring:message code="ALL.label"/></option>
	                                  </select>
                                     </div>
                                  </div>
                                  
                                   <div class="col-lg1-2 col-lg-2 form-group">
                                     <div class="col-lg-12" style="padding-left:0px;padding-right: 0px;">
                                     <label><spring:message code="brand.label"/></label>
                                       <select class="form-control" id="outletBrandIdPrice" >
                           		        <option value=""><spring:message code="ALL.label"/></option>
	                                    <c:forEach var="brandsList" items="${brandsList}">
									    <option value="${brandsList}" ${brandsList == brand ? 'selected' : ''} id="${brandsList}" >${brandsList}</option>
						 		       </c:forEach>
	                                   </select>
                                      </div>
                                  </div>
                                  
	           	                 <input type="hidden" id="sd" value="${startDate}">
			                    <input type="hidden" id="ed" value="${endDate}">
                            </div>
                            <div class="row">
                               <div class="col-lg1-2 col-lg-2">
                                  <div class="col-lg-12" style="padding-left:0px;padding-right: 0px;">
                                    <label><spring:message code="location.label"/></label>
                                      <input type="hidden" id="tolocation" value="${selectedLocation }">
							           <select class="form-control" id="priceoutletLocation" onchange="searchCategorybasedonlocation('priceoutletLocation','outletCategoryId','outletBrandIdPrice');"><!-- searchStockRequests('','','0'); -->
								               <option value=""><spring:message code="ALL.label"/></option>
									           <c:forEach var="outletlocationsList" items="${outletlocationsList}">
<%-- 										        <option value="${outletlocationsList}" ${outletlocationsList == selectedLocation ? 'selected' : ''} id="${outletlocationsList}" >${outletlocationsList}</option> --%>
											<c:choose>
								<%--  <c:when test="${flowUnder == 'outlet'}"> --%>
						           <c:when test="${outletlocationsList.description == ''}">
							         <option value="${outletlocationsList.locationId}" ${outletlocationsList.locationId == selectedLocation ? 'selected' : ''}>${outletlocationsList.locationId}</option>
							        </c:when>
							        <c:otherwise>
							        <option value="${outletlocationsList.locationId}" ${outletlocationsList.locationId == selectedLocation ? 'selected' : ''}>${outletlocationsList.locationId}-${outletlocationsList.description}</option>
							        </c:otherwise>
							    </c:choose>
												</c:forEach>
							            </select>
                                  </div>
                               </div>
                              <div class="col-lg1-2 col-lg-2">
                               <div class="col-lg-12" style="padding-left:0px;padding-right: 0px;">
                                      <label><spring:message code="subcategory.label"/></label>
                                      <select class="form-control" id="priceoutletSubcategory"  onchange="searchSectionsBasedOnSubCategory('outletCategoryId','priceoutletSubcategory','section')">
                           		        <option value=""><spring:message code="ALL.label"/></option>
	                                    <c:forEach var="subCategoryDetailsList" items="${subCategoryDetailsList}">
									   <option value="${subCategoryDetailsList.subcategoryName}" ${subCategoryDetailsList.subcategoryName == subcategory ? 'selected' : ''} id="${subCategoryDetailsList.subcategoryName}" >${subCategoryDetailsList.subcategoryName}</option>
						 		       </c:forEach>
	                                  </select>
                              </div>
                            </div>
                           <div class="col-lg1-2 col-lg-2" style="">
                              <div class="col-lg-12" style="padding-left:0px;padding-right: 0px;">
                                 <label><spring:message code="department.label"/></label>
                                    <select class="form-control" id="priceoutletDepartmentId" >
                           		       <option value=""><spring:message code="ALL.label"/></option>
	                                   <c:forEach var="departmentList" items="${departmentList}">
									  <option value="${departmentList.primaryDepartment}" ${departmentList.primaryDepartment == department ? 'selected' : ''} id="${departmentList.primaryDepartment}" >${departmentList.primaryDepartment}</option>
						 		      </c:forEach>
	                                </select>
                               </div>
                           </div>
                    </div>
                  </div>
                  
                            <div class="col-lg-1" style="    width: 12%;    background: #ccc;">
                               <div class="col-lg-12" style="    border-top: 1px solid #ccc; border-bottom: 1px solid #ccc;">
                                  <div class="row">
                                    <a onclick="searchPriceUpdate('PriceUpdate','','0','${flowLocation}')" class="button"><spring:message code="searchbutton.label" /></a>
                                  </div>
                                 <div class="row">
                                    <a type="button" style="margin-top: 18px"  onclick="resetForm();" class="button" ><spring:message code="clearbutton.label"/></a>
                                 </div>
                              </div>
                            </div>
                  
                                <div id="Error" class="Error" style="text-align: center;color: red;font-size: 2;font-weight: bold;margin-bottom: 20px; margin-top: -20px">${err}</div>
	        		            <div id="Success" class="Error" style="text-align: center;color: blue;font-size: 2;font-weight: bold;margin-bottom: 20px; margin-top: -20px">${success}</div>
                  
                               <div class="col-lg-12">
                                <br>
                               </div>
									    <div class="row">
									      <div class="col-lg-1 col-xs-2" style="margin-top: 0px;">
								                <select class="form-control" id="maxRecords" style="padding: 3px 4px;" onchange="searchPriceUpdate('PriceUpdate','','0','${flowLocation}')">
								               		<option value="10" ${maxRecords == '10' ? 'selected' : ''}>10</option>
								               		<option value="25" ${maxRecords == '25' ? 'selected' : ''}>25</option>
								               		<option value="50" ${maxRecords == '50' ? 'selected' : ''}>50</option>
								              		<option value="100" ${maxRecords == '100' ? 'selected' : ''}>100</option>
								               	 </select>
								           </div>
				                       <div class="col-lg-10 col-xs-8" style="margin-left: -15px;padding-left: 19px;margin-bottom: 10px;">
                                          <div class="wrapper">	 
                                                 <input type="text"  class="form-control" style="" value="${searchName}" id="searchPriceUpdate" placeholder="<spring:message code="search.sku.label" />" />
							                      <button id="mySearch" class="searchbutton"></button>
							              </div>
						                         <input type="hidden" id="priceUpdateSearch" value="${searchName}">
                                       </div>
                                       
                                       
                                       	<div class="col-lg-1" style="padding-left: 0px;margin-left:9px;">
								                <input type="button" style="" class="btn bg-olive btn-inline  addBtn" onclick="return updatePriceDetailsAll('save','${flowLocation}');" value="<spring:message code="saveall.label" />">
								          </div>
					                </div>
					       <div style="overflow: auto;">         
                          <table id="skupriceTavble"  class="table table-bordered table-striped" style="table-layout: fixed;">
                              <thead style="background-color: #3c8dbc; color: #ffffff">
                               <tr>
                             	 <th class="sticky-col first-col" style="width:60px;background-color: #a1dbf1 !important;border-right: 2px solid rgba(153, 153, 153, 0.37) !important;"><spring:message code="sl.no.label" /></th>
                             	 <th class="sticky-col second-col" style="width:100px;background-color: #a1dbf1 !important;border-right: 2px solid rgba(153, 153, 153, 0.37) !important;"><spring:message code="report.skuid.label" /></th>
                             	<%--  <th ><spring:message code="location.label" /></th> --%>
                             	 <th class="sticky-col third-col" style="width:155px;background-color: #a1dbf1 !important;border-right: 2px solid rgba(153, 153, 153, 0.37) !important;"><spring:message code="description.label" /></th>
                             	 <th style="width:100px"><spring:message code="ean.label"/></th>
                             	  <th style="width:100px"><spring:message code="batch.number.label"/></th>
                             	 <th style="width:70px"><spring:message code="uom.label" /></th>
                             	 <th style="width:105px"><spring:message code="grade.label" /></th>
                             	 <th style="width:105px"><spring:message code="newarrival.productrange" /></th>
                                 <th style="width:75px"><spring:message code="color.label" /></th>
                             	 <th style="width:75px"><spring:message code="size.label" /></th>
                             	 <th style="width:105px"><spring:message code="salevalue.label" />
                             	 <th style="width:105px"><spring:message code="newCostPrice.label" />
                             	  <th style="width:105px"><spring:message code="mrp.label"/></th>
                                 <th style="width:105px"><spring:message code="newmrp.label"/></th>
                                 <th style="width:105px"><spring:message code="saleprice.label"/></th>
                                 <th style="width:105px"><spring:message code="newSalePrice.label"/></th>
                                 <th style="width:100px">Gross Margin</th>
                                <%--   <th><spring:message code="newProfit.label"/></th> --%>
                                 <th style="width:70px"><spring:message code="EmployeeForm.action" /></th>
                             </tr>
                         </thead>
                         <tbody style="text-align: center;">
                          <c:forEach var="sku" items="${priceUpdateList}" varStatus="totalskus">
                          <input type="hidden" id="countId" value="${totalskus.count}">
                          <c:choose>
                            <c:when test="${fn:length(sku.skuPriceLists) gt 1}">
                             <tr id="activatePurpose" >
                              <c:forEach var="pluvalue" items="${sku.skuPriceLists}" varStatus="condition">
                                <c:set var="singleplucode" value="${pluvalue.pluCode}"  />
                                <c:set var="conditioncount" value="${condition.count}"  />
                               </c:forEach>
                            	 <td class="sticky-col first-col" style="background: #f9f9f9;">${totalskus.count+index-1}</td>
                            	 <td class="sticky-col second-col" style="background: #f9f9f9;">${sku.skuId}</td>
                                 <td class="sticky-col third-col" style="background: #f9f9f9;">${sku.description}</td>
                                 <td>${sku.ean}</td>
                                 <td></td>
                                 <td>${sku.uom}</td>
                                 <td></td>
                                 <td></td>
                                 <td>${sku.color}</td>
                                 <td></td>
                                 <td></td>
                                 <td></td>
                                 <td></td>
                                 <td></td>
                                 <td></td>
                                 <td></td>
                                <!--  <td></td> -->
                                 <td></td>
                                 <td>
                                  <c:forEach var="plu" items="${sku.skuPriceLists}" varStatus="defaultplu">
                                    <c:if test="${defaultplu.count == 2}">
                                     <a  class="clickable" data-toggle="collapse" id="row${totalskus.count}" data-target=".row${totalskus.count}"> <span style="font-size: 17px" onclick="expandSkuPrice(${totalskus.count})" id="categoryExpand${totalskus.count}"><i class="fa fa1 fa-sort-desc"></i></span></a>
                                    </c:if>
                                  </c:forEach>
                                 </td>
        				    </tr>
        				    </c:when>
        				    <c:when test="${fn:length(sku.skuPriceLists) eq 1}">
        				      <tr id="priceListId" class="priceListId">
                               <c:forEach var="plucode" items="${sku.skuPriceLists}" varStatus="totalpricelists">
                             
                                 <input type="hidden" class="form-control" id="pluStoreLocation${totalskus.count}1${totalpricelists.count}" value="${plucode.storeLocation}" />
        						  <input type="hidden" class="form-control" class="pluCode" id="pluCode${totalskus.count}1${totalpricelists.count}" value="${plucode.pluCode}" />
                                 <input type="hidden" class="form-control" id="productBatch${totalskus.count}1${totalpricelists.count}" value="${plucode.productBatchNo}" />
                             
                            	 <td class="sticky-col first-col" style="background: #f9f9f9;">${totalskus.count+index-1}</td>
                            	 <td class="sticky-col second-col skuID" style="background: #f9f9f9;" id="skuId${totalskus.count}1${totalpricelists.count}" >${plucode.skuId}</td>
                                 <td class="sticky-col third-col" style="background: #f9f9f9;">${plucode.description}</td>
                                 <td id="ean${totalskus.count}1${totalpricelists.count}">${plucode.ean}</td>
                                 <td id="productBatchNum${totalskus.count}1${totalpricelists.count}">${plucode.productBatchNo}</td>
                                 <td id="uom${totalskus.count}1${totalpricelists.count}">${sku.uom}</td>
                                 <td></td>
                                 <td>${plucode.measureRange}</td>
                                 <td id="color${totalskus.count}1${totalpricelists.count}">${plucode.color}</td>
                                 <td id="size${totalskus.count}1${totalpricelists.count}">${plucode.size}</td>
                                <%--  <fmt:formatNumber var="costPrice" type="number"  minFractionDigits="2" maxFractionDigits="2" value="${(plucode.salePrice-plucode.costPrice)}" /> --%>
                                 <td id="costPrice${totalskus.count}1${totalpricelists.count}">${plucode.costPrice}</td>
                                  <td id="newcostPrice${totalskus.count}1${totalpricelists.count}" class="newcostPrice" onBlur="caluclateProfitability('${totalskus.count}1${totalpricelists.count}')" onkeypress='return (this.innerText.length < 10)'  style="padding: 8px; background-color: #ffffff;    border: 1px solid #ccc;" contenteditable="true" >${plucode.costPrice} <%-- <input type="number" style="border: none;    border: none;height: 100%;text-align: center;"  value="${plucode.newSalePrice}"  /> --%></td>
                                 
                                 <td id="mrp${totalskus.count}1${totalpricelists.count}">${plucode.price}</td>
                                 <td id="newMrp${totalskus.count}1${totalpricelists.count}" class="newMrp" onkeypress='return (this.innerText.length < 10)'  style="padding: 8px; background-color: #ffffff;    border: 1px solid #ccc;" contenteditable="true" >${plucode.price} <%-- <input type="number" style="border: none;    border: none;height: 100%;text-align: center;"  value="${plucode.newSalePrice}"  /> --%></td>
                                
                                 
                                 <td id="price${totalskus.count}1${totalpricelists.count}">${plucode.salePrice}</td>
                                 <td id="newPrice${totalskus.count}1${totalpricelists.count}" class="newPrice" onkeypress='return (this.innerText.length < 10)' onBlur="caluclateProfitability('${totalskus.count}1${totalpricelists.count}')" style="padding: 8px; background-color: #ffffff;    border: 1px solid #ccc;" contenteditable="true" >${plucode.salePrice} <%-- <input type="number" style="border: none;    border: none;height: 100%;text-align: center;"  value="${plucode.newSalePrice}"  /> --%></td>
                                
                                <%--  <td id="profitability${totalskus.count}1${totalpricelists.count}" class="profitability">
                                
                                 <fmt:formatNumber var="costPrice" type="percent"  minFractionDigits="2" maxFractionDigits="2" value="${((plucode.salePrice-plucode.costPrice)/plucode.costPrice)}" />${costPrice}
                                  <c:choose>
                                 <c:when test="${(plucode.salePrice == '0.0' && plucode.costPrice == '0.0')}">
                                 <c:out value="0"></c:out>%
                                 </c:when>
                                 
                                 <c:when test="${plucode.costPrice<plucode.salePrice && plucode.costPrice == '0.0'}">
                                 <c:out value="100"></c:out>%
                                 </c:when>
                                 
                                 <c:otherwise>
                                  <fmt:formatNumber var="costPrice" type="percent"  minFractionDigits="2" maxFractionDigits="2" value="${((plucode.salePrice-plucode.costPrice)/plucode.costPrice)}" />${costPrice}
                                 </c:otherwise>
                                 
                                 </c:choose>
                                </td> --%>
                                <td id="profitabilitynew${totalskus.count}1${totalpricelists.count}" class="profitability">
                                <c:choose>
                                  <c:when test="${(plucode.salePrice == '0.0' && plucode.costPrice == '0.0')}">
                                 <c:out value="0"></c:out>%
                                 </c:when>
                                 <c:when test="${plucode.costPrice<plucode.salePrice && plucode.costPrice == '0.0'}">
                                 <c:out value="100"></c:out>%
                                 </c:when>
                                 
                                  <c:when test="${plucode.costPrice>plucode.salePrice && plucode.salePrice == '0.0'}">
                                 <c:out value="-100"></c:out>%
                                 </c:when>
                                 
                                <c:otherwise>
                                 <fmt:formatNumber var="newcostPrice" type="number"  minFractionDigits="2" maxFractionDigits="2" value="${((plucode.salePrice-plucode.costPrice)/plucode.salePrice)*100}" />${newcostPrice}<c:out value="%">%</c:out>
                                </c:otherwise>
                                </c:choose>
                                
                                 <%-- <fmt:formatNumber var="newcostPrice" type="number"  minFractionDigits="2" maxFractionDigits="2" value="${((plucode.salePrice-plucode.costPrice)/plucode.costPrice)*100}" />${newcostPrice}<c:out value="%">%</c:out> --%>
                                </td>
                                 <td style="padding: 0px;" id="Del${totalskus.count}1${totalpricelists.count}"><img src="${pageContext.request.contextPath}/images/save.png" style="cursor:pointer;width:30px" class="imgWidth" id="Img${totalpricelists.count}" onclick="updatePriceDetails('${plucode.skuId}','${plucode.ean}','${plucode.uom}','${plucode.color}','${plucode.size}','${plucode.costPrice}','${plucode.price}','${plucode.storeLocation}','${plucode.pluCode}','${plucode.productBatchNo}',$(this).closest('tr').find('td.newPrice').text(),$(this).closest('tr').find('td.newcostPrice').text(),$(this).closest('tr').find('td.newMrp').text(),'${flowLocation}')"></td>
                                 </c:forEach>
        				    </tr>
        				
        				    </c:when>
        				    <c:otherwise>
        				    </c:otherwise>
        				    </c:choose>
        				    
        				    <tr  class="collapse rowone${totalskus.count}" id="skuPriceList${totalskus.count}1">
                                <!--    <th></th> -->
                                  <th class="sticky-col first-col" style="padding:3px;"><div style="white-space: nowrap;padding: 5px;background: #c1c1c1;">SL No.</div></th>
                                  <th class="sticky-col second-col" style="padding:3px;"><div style="white-space: nowrap;padding: 5px;background: #c1c1c1;"><spring:message code="report.skuid.label" /></div></th>
                                  <th class="sticky-col third-col" style="padding:3px;"><div style="white-space: nowrap;padding: 5px;background: #c1c1c1;"><spring:message code="location.label" /></div></th>
                                  <th style="padding:3px;"><div style="white-space: nowrap;padding: 5px;background: #c1c1c1;"><spring:message code="ean.label" /></div></th>
                                  <th style="padding:3px;"><div style="white-space: nowrap;padding: 5px;background: #c1c1c1;"><spring:message code="batch.number.label"/></div></th>
                                  <th style="padding:3px;"><div style="white-space: nowrap;padding: 5px;background: #c1c1c1;"><spring:message code="grade.label" /></div></th>
                                  <th style="padding:3px;"><div style="white-space: nowrap;padding: 5px;background: #c1c1c1;"><spring:message code="newarrival.productrange" /></div></th>
                                  <th style="padding:3px;"><div style="white-space: nowrap;padding: 5px;background: #c1c1c1;"><spring:message code="color.label" /></div></th>
                                  <th style="padding:3px;"><div style="white-space: nowrap;padding: 5px;background: #c1c1c1;"><spring:message code="size.label" /></div></th>
                                  <th style="padding:3px;"><div style="white-space: nowrap;padding: 5px;background: #c1c1c1;"><spring:message code="salevalue.label" /></div></th>
                                   <th style="padding:3px;"><div style="white-space: nowrap;padding: 5px;background: #c1c1c1;"><spring:message code="newCostPrice.label" /></div></th>
                                  
                                  <th style="padding:3px;"><div style="white-space: nowrap;padding: 5px;background: #c1c1c1;"><spring:message code="mrp.label" /></div></th>
                                  <th style="padding:3px;"><div style="white-space: nowrap;padding: 5px;background: #c1c1c1;"><spring:message code="newmrp.label" /></div></th>
                                  
                                  
                                  <th style="padding:3px;"><div style="white-space: nowrap;padding: 5px;background: #c1c1c1;"><spring:message code="saleprice.label" /></div></th>
                                  <th style="padding:3px;"><div style="white-space: nowrap;padding: 5px;background: #c1c1c1;"><spring:message code="newSalePrice.label" /></div></th>
                                  <th style="padding:3px;"><div style="white-space: nowrap;padding: 5px;background: #c1c1c1;">Gross Margin</div></th>
                                 <%--   <th style="padding:3px;"><div style="white-space: nowrap;padding: 5px;background: #c1c1c1;"><spring:message code="newProfit.label" /></div></th> --%>
                                  <th style="padding:3px;"><div style="white-space: nowrap;padding: 5px;background: #c1c1c1;"> <spring:message code="EmployeeForm.action" /></div></th>
                                  <th></th>
                                 
                             </tr>
        				 <c:forEach var="plucode" items="${sku.skuPriceLists}" varStatus="totalpricelists">
        				  
        				  <c:if test="${fn:length(sku.skuPriceLists) gt 1}">
        				   <tr  class="collapse rowone${totalskus.count}" id="productrange${totalskus.count}${totalpricelists.count}" class="productRange">
        						 <!--  <td></td> -->
        						 <input type="hidden" class="form-control" id="pluStoreLocation${totalskus.count}1${totalpricelists.count}" value="${plucode.storeLocation}" />
        						  <input type="hidden" class="form-control" class="pluCode" id="pluCode${totalskus.count}1${totalpricelists.count}" value="${plucode.pluCode}" />
        						   <input type="hidden" class="form-control" id="productBatch${totalskus.count}1${totalpricelists.count}" value="${plucode.productBatchNo}" />
        						   <input type="hidden" class="form-control" id="rowcount" class="rowCount" value="${totalskus.count}1${totalpricelists.count}" />
        						 <td class="sticky-col first-col" style="background: #f9f9f9;" id="${totalpricelists.count}">${totalpricelists.count}</td>
                            	 <td  class="skuID sticky-col second-col" style="background: #f9f9f9;" id="skuId${totalskus.count}1${totalpricelists.count}" style="">${plucode.skuId}</td>
                                 <td class="sticky-col third-col" style="background: #f9f9f9;" id = "location${totalskus.count}1${totalpricelists.count}">${plucode.storeLocation}</td>
                                 <td id="ean${totalskus.count}1${totalpricelists.count}">${plucode.ean}</td>
                                 <td id="productBatchNum${totalskus.count}1${totalpricelists.count}">${plucode.productBatchNo}</td>
                                 <td id="uom${totalskus.count}1${totalskus.count}${totalpricelists.count}"></td>
                                 <td>${plucode.measureRange}</td>
                                 <td id="color${totalskus.count}1${totalpricelists.count}">${plucode.color}</td>
                                 <td id="size${totalskus.count}1${totalpricelists.count}">${plucode.size}</td>
                                <%--  <fmt:formatNumber var="costPrice" type="number"  minFractionDigits="2" maxFractionDigits="2" value="${(plucode.salePrice-plucode.costPrice)}" /> --%>
                                 <td id="costPrice${totalskus.count}1${totalpricelists.count}">${plucode.costPrice}</td>
                                 <td id="newcostPrice${totalskus.count}1${totalpricelists.count}" class="newcostPrice" onBlur="caluclateProfitability('${totalskus.count}1${totalpricelists.count}')" onkeypress='return (this.innerText.length < 10)'  style="padding: 8px; background-color: #ffffff;    border: 1px solid #ccc;" contenteditable="true" >${plucode.costPrice} <%-- <input type="number" style="border: none;    border: none;height: 100%;text-align: center;"  value="${plucode.newSalePrice}"  /> --%></td>
                                
                                <td id="mrp${totalskus.count}1${totalpricelists.count}">${plucode.price}</td>
                                 <td id="newMrp${totalskus.count}1${totalpricelists.count}" class="newMrp" onkeypress='return (this.innerText.length < 10)'  style="padding: 8px; background-color: #ffffff;    border: 1px solid #ccc;" contenteditable="true" >${plucode.price} <%-- <input type="number" style="border: none;    border: none;height: 100%;text-align: center;"  value="${plucode.newSalePrice}"  /> --%></td>
                                
                                
                                 <td id="price${totalskus.count}1${totalpricelists.count}">${plucode.salePrice}</td>
                                 <td id="newPrice${totalskus.count}1${totalpricelists.count}" class="newPrice" onkeypress='return (this.innerText.length < 10)' onBlur="caluclateProfitability('${totalskus.count}1${totalpricelists.count}')" style="padding: 8px; background-color: #ffffff;    border: 1px solid #ccc;" contenteditable="true" >${plucode.salePrice} <%-- <input type="number" style="border: none;    border: none;height: 100%;text-align: center;"  value="${plucode.newSalePrice}"  /> --%></td>
                                <%--  <td id="profitability${totalskus.count}1${totalpricelists.count}" class="profitability">
                                 
                                <c:choose>
                                 <c:when test="${(plucode.salePrice == '0.0' && plucode.costPrice == '0.0')}">
                                 <c:out value="0"></c:out>%
                                 </c:when>
                                 <c:when test="${plucode.costPrice<plucode.salePrice && plucode.costPrice == '0.0'}">
                                 <c:out value="100"></c:out>%
                                 </c:when>
                                 <c:otherwise>
                                  <fmt:formatNumber var="costPrice" type="percent"  minFractionDigits="2" maxFractionDigits="2" value="${((plucode.salePrice-plucode.costPrice)/plucode.costPrice)}" />${costPrice}
                                 </c:otherwise>
                                 </c:choose>
                                 
                                 </td> --%>
                                <td id="profitabilitynew${totalskus.count}1${totalpricelists.count}" class="profitability">
                                 
                                  <c:choose>
                                  <c:when test="${(plucode.salePrice == '0.0' && plucode.costPrice == '0.0')}">
                                 <c:out value="0"></c:out>%
                                 </c:when>
                                 <c:when test="${plucode.costPrice<plucode.salePrice && plucode.costPrice == '0.0'}">
                                 <c:out value="100"></c:out>%
                                 </c:when>
                                    <c:when test="${plucode.costPrice>plucode.salePrice && plucode.salePrice == '0.0'}">
                                 <c:out value="-100"></c:out>%
                                 </c:when>
                                <c:otherwise>
                                 <fmt:formatNumber var="newcostPrice" type="number"  minFractionDigits="2" maxFractionDigits="2" value="${((plucode.salePrice-plucode.costPrice)/plucode.salePrice)*100}" />${newcostPrice}<c:out value="%">%</c:out>
                                </c:otherwise>
                                </c:choose>
<%--                                  <fmt:formatNumber var="newcostPrice" type="number"  minFractionDigits="2" maxFractionDigits="2" value="${((plucode.salePrice-plucode.costPrice)/plucode.costPrice)*100}" />${newcostPrice} --%>
                                </td>
                                 <td style="padding: 0px; "><img src="${pageContext.request.contextPath}/images/save.png" style="width:30px;cursor:pointer;" id="Img${totalpricelists.count}" onclick="updatePriceDetails('${plucode.skuId}','${plucode.ean}','${plucode.uom}','${plucode.color}','${plucode.size}','${plucode.costPrice}','${plucode.price}','${plucode.storeLocation}','${plucode.pluCode}','${plucode.productBatchNo}',$(this).closest('tr').find('td.newPrice').text(),$(this).closest('tr').find('td.newcostPrice').text(),$(this).closest('tr').find('td.newMrp').text(),'${flowLocation}')"></td>
                                 <td></td>
                                 
        						</tr>
        						</c:if>
        						</c:forEach>
                             </c:forEach>
                         </tbody>
                     </table></div>
                     </div>
                       <div class="panel-group" id="accordion">
                         <div class="col-lg-12" style="">
                         </div>
                      </div>
                      <div class="panel-group" id="accordion">
                        <input type="hidden" id="flowUnder" value="${flowUnder}">
                       <div class="row" style="margin-right:0%;margin-left: 0.1%;">
              	          <c:if test="${index-1 == 0 && totalRecords >maxRecords}">
              		          <div class="form-group col-lg-6" style="text-align: left;">
              		                <input type="button" class='paginationButton' value="&#60;" onclick=""> ${index} - ${totalValue} of ${totalRecords} 
              		                <input type="button" class='paginationButton' value="&#62;" onclick="viewPriceUpdate('PriceUpdate','${totalValue}','${flowLocation}');">
              	              </div>									
                       	</c:if>
                       	<c:if test="${totalValue == totalRecords}">
              			   <c:if test="${totalValue-maxRecords >0}">
              				<div class="form-group col-lg-6" style="text-align: left;">
              		          <input type="button" class='paginationButton' value="&#60;" onclick="return viewPriceUpdate('PriceUpdate','${index - (maxRecords + 1)}','${flowLocation}');"> ${index} - ${totalValue} of ${totalRecords} 
              		          <input type="button" class='paginationButton' value="&#62;" >
              		        </div>
              			  </c:if>
              			<c:if test="${totalValue-maxRecords <= 0}">
              		      <div class="form-group col-lg-6" style="text-align: left;">
              		       <input type="button" class='paginationButton' value="&#60;"> ${index} - ${totalValue} of ${totalRecords} 
              		       <input type="button" class='paginationButton' value="&#62;" >
              	          </div>
              	        </c:if>
              	       </c:if>
              	    <c:if test="${index-1 != 0 &&  totalValue != totalRecords}">
              		   <div class="form-group col-lg-6" style="text-align: left;">
              		      <input type="button" class='paginationButton' value="&#60;" onclick="return viewPriceUpdate('PriceUpdate','${index - (maxRecords + 1)}','${flowLocation}');"> ${index} - ${totalValue} of ${totalRecords} .
              		      <input type="button" class='paginationButton' value="&#62;" onclick="viewPriceUpdate('PriceUpdate','${totalValue}','${flowLocation}')">
              	         </div> 
              	      </c:if>
              	
              	   <div class="col-lg-6" style="text-align: right;"> 
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
              		  <input type="button" onclick="viewPriceUpdate('PriceUpdate',document.getElementById('pagination').value,'${flowLocation}')" class="btn bg-olive btn-inline  addBtn" value="GO">
              		</div>
             
				</div>
              	
              </div>    
              	
              </div>  
              	
                 </div>
                              
                 <!-- /.box-body -->
             </div><!-- /.box -->
  
</div>
  <div id="triggerEvent"></div>
  
		
    <!-- COMPOSE MESSAGE MODAL -->
    
   
</section><!-- /.content -->
		<!-- DATA TABES SCRIPT -->
        <script src="${pageContext.request.contextPath}/js/plugins/datatables/jquery.dataTables.js" type="text/javascript"></script>
        <script src="${pageContext.request.contextPath}/js/plugins/datatables/dataTables.bootstrap.js" type="text/javascript"></script>
         <!-- page script -->
        <script type="text/javascript">
            $(function() {
            	// $("#example1").dataTable();
                $('#example1').dataTable({
                    "bPaginate": false,
                    "bLengthChange": false,
                    "bFilter": false,
                    "bSort": false,
                    "bInfo": false,
                    "bAutoWidth": true
                });
            });
        </script>
        <input type="hidden" id="deleteActionLabel" value="<spring:message code="sku.label" />"/>
           <input type="hidden" id="err" value="${err}" />
</body>
</html>