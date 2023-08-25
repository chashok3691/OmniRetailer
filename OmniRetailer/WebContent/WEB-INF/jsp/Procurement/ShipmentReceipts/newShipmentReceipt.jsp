<!--/*
 * Project Name 	        : OmniRetailerCustomer
 * Written By		        : Mythri
 * file name		        : Inventory Manager/warehouse/procurement/newProcurementReceipt.jsp
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
<%-- 	<script src="${pageContext.request.contextPath}/js/jquery-1.6.4.min.js"></script>  --%>

 <script src="${pageContext.request.contextPath}/js/form_plugin.js"></script>
 <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.calendars.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.calendars.plus.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.calendars.picker.js"></script>
 
 <script type="text/javascript" src="${pageContext.request.contextPath}/js/validation.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/controller.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/procurement/purchaseOrderAndReceipts.js"></script>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/jquery.calendars.picker.css">
	<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
	
	
<script type="text/javascript">

$(document).ready(function(){

	focusDiv("Error");
	$("#AttachmentSuccess").html("");
	
	 var len = $("#productsList tr").length-1;
	 for(var i=1;i<=len;i++){
		 callCalender('expiryDate'+i);
		 
	 }
	
	 var dateTime = getCurrentDate();
	  var date = dateTime.split(' ');
	  date = date[0].split('/');
	  var formatedDate = date[1]+"/"+date[0]+"/"+date[2];
	  $('#date').val(formatedDate);
	  $('#deliveredOnStr').val(formatedDate);
	  
		callCalender("date");
		callCalender("deliveredOnStr");
			
		//callCalender("deliveredOnStr");
		getstateforPOandGRN();
		
		 changeTotalitems();
});
</script>
<style type="text/css">
#overflowtext{

width : 200px;
overflow: hidden;
text-overflow: ellipsis;
 text-align: left;
white-space: nowrap;
}

.matchedStringUl 
{
	z-index: 9;
}

	div.stars {
  width: 270px;
   display: inline-block; 
  display:table-row-group;
}

@media screen and (max-width: 600px) {
	/* Force table to not be like tables anymore */
	table.th { 
		width: 30%; 
	}
	}


input.star { display: none; }

label.star {
  float: right;
  padding: 5px;
  font-size: 20px;
  color: #FFA500;
  transition: all .2s;
}
.modal-dialog {
       width: auto;
    position: absolute;
    margin-top: 5%;
    margin-left: 20%;
}
input.star:checked ~ label.star:before {
  content: '\f005';
  color: #FFA500;
  transition: all .25s;
}

input.star-5:checked ~ label.star:before {
  color: #FFA500;
  /* text-shadow: 0 0 20px #952; */
}

input.star-1:checked ~ label.star:before { color: #FFA500; }

/* label.star:hover { transform: rotate(-15deg) scale(1.3); } */

label.star:before {
  content: '\f006';
  font-family: FontAwesome;
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
.labelgrn
{
margin-top: 3px;
}
.form-group {
    margin-bottom: 5px;
}
.sticky-col {
  position: sticky !important;
  position: -webkit-sticky;    
  z-index: 2;
  /* background-color: white; */
}
.first-col {
 	min-width: 60px;
    max-width: 60px;
    left: 0px;  
}

.second-col {
   left: 60px;
    min-width: 75px;
    max-width: 75px;
}
.third-col {
    min-width: 100px;
    max-width: 100px;
    left: 135px;
}
.fourth-col {
    min-width: 100px;
    max-width: 100px;
    left: 235px;
}
.fifth-col {
    min-width: 125px;
    max-width: 125px;
    left: 335px;
}
.sixth-col {
    min-width: 250px;
    max-width: 250px;
    left: 455px;
}

.fileUpload input.upload {
    position: absolute;
    top: 0;
    right: 0;
    margin: 0;
    padding: 0;
    font-size: 20px;
    cursor: pointer;
    opacity: 0;
    }

  .browsebutton:hover {
    background: grey !important;
}
.browsebutton {
    /* font-weight: bold; */
    height: 32px;
    border-radius: 0px;
    padding: 5px 0px;
    background: #3c8dbc;
    border: none;
}
.fileUpload {
    position: relative;
    overflow: hidden;
   
}

.stickyheader {
  position: sticky !important;
  top: 0;
 z-index: 10 !important;
}

</style>
</head>
<body>
<!-- Content Header (Page header) -->

<!-- Main content -->
<section class="content">
 <div class="row">
  <div class="col-lg-12">
				<div class="box box-primary">
                                <div class="box-header" style="text-align: center">
                                <div class="form-group">
                                <div class="form-group col-lg-7"  style="">
                                <h3    style="text-align: right; margin-top: 5px;" ><label  style="border-radius: 5px; padding-left: 10px;padding-right: 10px;border: 1px solid;"><spring:message code="procurement.new.grn.label" /></label></h3>
                                </div>
                                 <div class="form-group col-lg-4"  style="">
                                <div class="form-group col-lg-5" style="text-align: right;    margin-top: 7px;"><spring:message code="rate.delivery" /></div>
									<div class="form-group col-lg-7" style="">
											<div class="stars" id="stars_group">
												<input class="star star-5" id="star-5" type="radio"
													name="star" value="5" onclick="userrating(5)" /> <label style="font-family: Calibri;color:"
													class="star star-5" for="star-5"></label> <input
													class="star star-4" id="star-4" type="radio" name="star"
													value="4" onclick="userrating(4)"> <label style="font-family: Calibri;"
													class="star star-4" for="star-4"></label> <input
													class="star star-3" id="star-3" type="radio" name="star"
													value="3" onclick="userrating(3)"> <label style="font-family: Calibri;"
													class="star star-3" for="star-3"></label> <input
													class="star star-2" id="star-2" type="radio" name="star"
													value="2" onclick="userrating(2)"> <label style="font-family: Calibri;"
													class="star star-2" for="star-2"></label> <input
													class="star star-1" id="star-1" type="radio" name="star"
													value="1" onclick="userrating(1)"> <label style="font-family: Calibri;color:"
													class="star star-1" for="star-1"></label>
											</div>
										</div>
										</div>
										</div>
										
                                </div><!-- /.box-header -->
                                <!-- form start -->
                                <form id="newProcurementReceipt" method="post" >
                                    <div class="box-body">
                                     <input type="hidden" id="flowUnder" value="${flowUnder}">
                                   	 <div id="Error" class="Error" style="text-align: center;color: red;font-size: 2;font-weight: bold;margin-bottom: 21px; margin-top: -20px">${err} </div>
                                   	 <div class="row">
                                   	 <div class="col-lg-3"></div>
                                     <div id="ErrorExcel" class="ErrorExcel col-lg-4 nopadding" style="text-align: center;color: red;font-size: 2;font-weight: bold;white-space: nowrap; "></div>
											 	 <div class="col-lg-2 nopadding">
											 	  <a onclick="downloadlog();" style="color:blue;display: none;text-decoration: underline;cursor: pointer;" id="loglink">Click Here for Log!</a>
											 	 </div>
	                                   <div class="col-lg-3"></div>
	                                   </div>
	        						 <div id="Success" class="Error" style="text-align: center;color: blue;font-size: 2;font-weight: bold;margin-bottom: 21px; margin-top: -20px">${success}</div>
	        						 <div id="AttachmentSuccess" class="AttachmentSuccess" style="text-align: center;color: blue;font-size: 2;font-weight: bold;margin-bottom: 21px; margin-top: -20px"></div>
                                   <br>
                                      <input type="hidden" name="cgstAmt" id="cgstAmt" value="${procurementreceipt.cgstAmt}">
                                      <input type="hidden" name="sgstAmt" id="sgstAmt" value="${procurementreceipt.cgstAmt}">
                                          <input type="hidden" name="igstAmt" id="igstAmt" value="${procurementreceipt.igstAmt}"> 
                                   <c:choose>
                                             <c:when test="${flowUnder == 'warehouse' || flowUnder == 'procurement'}">
                                             <input type="hidden" value="draft" id="status" name="status" >
                                   
                                        			<input type="hidden" name="toBeClosePO" id="toBeClosePO" value="false">
                                                <input type="hidden" value="0" name="vendorRating" id="outlet_rating">
									<div class="row">
										<div class="form-group col-lg-3">
											<label style="font-family: Calibri;color: gray;"><spring:message code="po.reference.label" /></label>
											<input type="text" class="form-control searchItems" value="${procurementreceipt.poRef}"	style="height:30PX;background:url(${pageContext.request.contextPath}/images/search.png) no-repeat;background-position:right;"	placeholder="<spring:message code="enter.po.reference.label" />" id="po_reference" />
												 <span id="po_referenceError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
											<div class=services>
												<div class="items">
													<ul class="matchedStringUl poRef"
														style="width: 89% !important; padding: 0px !important;    z-index: 15;"></ul>
												</div>
											</div>
											<span id="poRefError" style="text-align:right;color:red;font-weight:bold;"></span>
											<input type="hidden" name="poRef" id="selected_po_ref"
												value="${procurementreceipt.poRef}">
										</div>
										<div class="form-group col-lg-2">
											<label style="font-family: Calibri;color: gray;"><spring:message code="supplier.code.label" /></label>
											<input type="text" class="form-control" readonly="readonly"
												name="supplierId" id="supplier_Id" value="${procurementreceipt.supplierId}" />
										</div>	
										<div class="form-group col-lg-1"></div>
										<div class="form-group col-lg-2">
                                            <label style="font-family: Calibri;color: gray;">GSTIN</label>
                                         <input type="hidden" id="desc"/>
                                         
                                         
                                           <input type="hidden" id="urlfordoc"/>
                                           
                                           
                                         <input type="hidden"  class="form-control" name="inspectedBy" id="inspectedBy" value="${procurementreceipt.inspectedBy}"  placeholder="<spring:message code="enter.inspected.by.label" />"    />
										
										
										 <input type="text"  class="form-control" name="gstin" id="gstin" value="" readonly="readonly"   />
										
										<!-- <div class="services">
							    			<div class="items">
							     				<ul class="matchedStringUl insemployee" style=""></ul>
							   				</div>
										</div> -->
									</div>
                                   <!--    <input type="text" class="form-control" name="inspected_by" id="inspected_by" required  placeholder="<spring:message code="enter.inspected.by.label" />"  />
                                            <span id="inspectedByError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
                                         </div>
                                         	<div class="form-group col-lg-1"></div> -->

										<div class="form-group col-lg-2">
											<label style="font-family: Calibri;color: gray;"><spring:message code="select.location" /> <span style="color:red; font-size:2">*</span></label>
											 <select
												class="form-control" id="warehouse_location" onchange="getstateforPOandGRN();">
												
							<c:choose>
			                    <c:when test="${flowUnder == 'warehouse'}">
			                    <c:forEach var="location" items="${workLocationsList}">
			                    <c:if test="${location.businessActivity == 'Warehouse' }">
													<option value="${location.businessActivity}"
														${location.locationId == outletLocation ? 'selected' : ''}>${location.locationId}</option>
								</c:if>
								</c:forEach>
								</c:when>
								<c:otherwise>
								<c:forEach var="location" items="${workLocationsList}">
											<c:if test="${location.businessActivity == 'Retail Outlet' }">
													<option value="${location.businessActivity}"
														${location.locationId == outletLocation ? 'selected' : ''}>${location.locationId}</option>
								</c:if>
								</c:forEach>
								</c:otherwise>
							</c:choose>
									
											</select>
											 <span id="warehouse_locationError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
											 <input type="hidden" name="location" id="location">
											  <input type="hidden" class="form-control"  id="supplier_state" readonly="readonly" value=""/>
											  <input type="hidden" class="form-control"  id="location_state" readonly="readonly" value=""/>
											 
										</div>	
										
										<div class="form-group col-lg-2">
                                            <label style="font-family: Calibri;color: gray;"><spring:message code="date.label" /><span style="color: red; font-size: 2">*</span></label></label>
                                            
                                        <input class="form-control calendar_icon" readonly="readonly"  style="background-color: white;" name="dueDateStr" id="date" size="20" type="text" onfocus="callCalender('date')" onclick="callCalender('date')" placeholder="DD/MM/YYYY"/>
                                            <span id="dateError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
                                        </div>
									</div>
								
									<div class="row">
										<div class="form-group col-lg-2">
											<label style="font-family: Calibri;color: gray;"><spring:message code="invoice.number.label" /><span style="color: red; font-size: 2">*</span>
												</label> 
												 <div class="form-group col-lg-12" style="padding-left:0px;padding-right:0px;">
												<input type="text" class="form-control" name="invoiceRefNumber" id="invoiceRefNumber" value="${procurementreceipt.invoiceRefNumber}" placeholder="<spring:message code="enter.invoice.number.label" />" />
									<span id="invoiceNumberError" style="text-align:right;color:red;font-weight:bold;"></span>
									
									</div>
								</div>
										<div class="form-group col-lg-1"></div>
										<div class="form-group col-lg-3">
                                   		<label style="font-family: Calibri;color: gray;"><spring:message code="supplier.name.label" /> <span style="color:red; font-size:2">*</span></label>
                                           <!--  <input type="text" class="form-control" readonly="readonly" name="supplier_name" id="supplier_name" required /> -->
                                        	<input type="text" class="form-control searchItems" autocomplete="off" value="${procurementreceipt.supplierName}" style="height:30PX;background:url(${pageContext.request.contextPath}/images/search.png) no-repeat;background-position:right;" name="supplierName" placeholder="<spring:message code="enter.supplierName.label" />"  id="searchSupplier" />
											<div class=services>
									    		<div class="items">
									     			<ul class="matchedStringUl supplier" style="width: 89%!important;padding: 0px!important;z-index: 15"></ul>
									   			</div>
											</div>								
											<span id="supplierNameError" style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
                                        </div>
										<div class="form-group col-lg-2">
											<label style="font-family: Calibri;color: gray;"><spring:message code="receivedby.label" />
												</label>
												
												<input type="text"  class="form-control searchItems searchBar" name="receivedBy"  id="receivedBy" value="${procurementreceipt.receivedBy}"  placeholder="<spring:message code="enterreceivedby.label" />" />
										<div class="services">
							    			<div class="items">
							     				<ul class="matchedStringUl recemployee" style="z-index: 15"></ul>
							   				</div>
										</div>
												
												</div>
											

										<div class="form-group col-lg-2">
<%-- 											<label style="font-family: Calibri;color: gray;"><spring:message code="submitedby.label" />
 --%>										<%--		</label> <input
												type="hidden" class="form-control" name="submittedBy" value="${sessionScope.firstName}"
												id="submitedby" 
												placeholder="<spring:message code="entersubmitedby.label" />" />
											<span id="deliveredByError"
												style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
												  <div class="col-lg-12" style="padding-left:0px;padding-right: 0px;">
                           <label style="font-family: Calibri;color: gray;"><spring:message code="category.label"/></label>
                           <select class="form-control" id="outletCategory" onchange="searchSubCategories('outletCategory','outletSubcategory')">
                           		 <option value=""><spring:message code="ALL.label"/></option>
	                            <c:forEach var="categoryList" items="${categoryList}">
									<option value="${categoryList.categoryName}" ${categoryList.categoryName == category ? 'selected' : ''} id="${categoryList.categoryName}" >${categoryList.categoryName}</option>
						 		</c:forEach>
	                        </select>
                      </div> --%>
											<label style="font-family: Calibri;color: gray;"><spring:message code="delivered.by.label" />
												</label> <input
												type="text" class="form-control" name="deliveredBy"
												id="delivered_by" required value="${procurementreceipt.deliveredBy}"
												placeholder="<spring:message code="enter.delivered.by.label" />" />
											<span id="deliveredByError"
												style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
										</div>
										
										<div class="form-group col-lg-2">
                                            <label style="font-family: Calibri;color: gray;"><spring:message code="delivery_date.label" /><span style="color: red; font-size: 2">*</span></label></label>
                                            
                                        <input class="form-control calendar_icon" readonly="readonly"  style="background-color: white;" name="deliveredOnStr" id="deliveredOnStr" size="20" type="text" onfocus="callCalender('deliveredOnStr')" value="${procurementreceipt.deliveredOnStr}" onclick="callCalender('deliveredOnStr')" placeholder="DD/MM/YYYY"/>
                                             <input type="hidden"  value="${procurementreceipt.deliveredOnStr}">
                                            <span id="deliveredOnStrError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
                                        </div>
									</div>
									
										<%-- <div class="row">
										<div class="form-group col-lg-2">
                                            <label style="font-family: Calibri;color: gray;"><spring:message code="delivery_date.label" /><span style="color: red; font-size: 2">*</span></label></label>
                                            
                                        <input class="form-control calendar_icon" readonly="readonly"  style="background-color: white;" name="deliveredOnStr" id="deliveredOnStr" size="20" type="text" onfocus="callCalender('deliveredOnStr')" value="${procurementreceipt.deliveredOnStr}" onclick="callCalender('deliveredOnStr')" placeholder="DD/MM/YYYY"/>
                                             <input type="hidden"  value="${procurementreceipt.deliveredOnStr}">
                                            <span id="deliveredOnStrError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
                                        </div>	<div class="form-group col-lg-1"></div>
                                        <input type="hidden" name="deleteditems" id="itemDeletionList"/>
										
											 <div class="form-group col-lg-2">
											<label style="font-family: Calibri;color: gray;"><spring:message code="invoice.number.label" /><span style="color: red; font-size: 2">*</span>
												</label> 
												 <div class="form-group col-lg-12" style="padding-left:0px;padding-right:0px;">
												<input type="text" class="form-control" name="invoiceRefNumber" id="invoiceRefNumber" value="${procurementreceipt.invoiceRefNumber}" placeholder="<spring:message code="enter.invoice.number.label" />" />
									<span id="invoiceNumberError" style="text-align:right;color:red;font-weight:bold;"></span>
									
									</div>
									
										</div>	
									<div class="form-group col-lg-1"></div>
										<div class="form-group col-lg-2">
											<label style="font-family: Calibri;color: gray;"><spring:message code="delivered.by.label" />
												</label> <input
												type="text" class="form-control" name="deliveredBy"
												id="delivered_by" required value="${procurementreceipt.deliveredBy}"
												placeholder="<spring:message code="enter.delivered.by.label" />" />
											<span id="deliveredByError"
												style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
										</div>	<div class="form-group col-lg-1"></div>

										<div class="form-group col-lg-2">
											<label style="font-family: Calibri;color: gray;"><spring:message code="Approvedby.label" />
												</label> <input
												type="hidden" class="form-control" name="approvedBy"
												id="Approvedby"  value="${procurementreceipt.approvedBy}"
												placeholder="<spring:message code="enterApprovedby.label" />" />
											<span id="deliveredByError"
												style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
										
										 <div class="col-lg-12" style="padding-left:0px;padding-right: 0px;">
                           <label style="font-family: Calibri;color: gray;"><spring:message code="subcategory.label"/></label>
                           <select class="form-control" id="outletSubcategory" >
                           <c:choose>
                           <c:when test="${subcategory == ''}">
                             <option value=""><spring:message code="ALL.label"/></option>
                          </c:when>
                           <c:otherwise>
                              <option value="${subcategory}">${subcategory}</option>
                            <option value=""><spring:message code="ALL.label"/></option>
                           </c:otherwise>
                           		 </c:choose>
                           		
	                           
	                        </select>
                      </div>
										
										
										</div>	<div class="form-group col-lg-1"></div>
									</div> --%>
									
									
									
										<div class="row">
									<!-- 	<div class="form-group col-lg-2">
											<label style="font-family: Calibri;color: gray;"><spring:message code="handled.by.label" />
												</label> <input type="text" class="form-control" name="handledBy" id="handledBy" placeholder="<spring:message code="enter.handled.by.label" />" />
										</div>	
										<div class="form-group col-lg-1"></div> -->
										<%--  <div class="form-group col-lg-2">
											<label style="font-family: Calibri;color: gray;"><spring:message code="invoice.number.label" />
												</label> 
												 <div class="form-group col-lg-12" style="padding-left:0px;padding-right:0px;">
												<input type="text" class="form-control" name="invoiceRefNumber" id="invoiceRefNumber" placeholder="<spring:message code="enter.invoice.number.label" />" />
									</div>	</div> --%>	
									
									</div>
								
								</c:when>
                                             <c:otherwise>
                                                  	<div class="row">
                                   		<div class="form-group col-lg-4">
                                   		<label style="font-family: Calibri;color: gray;"><spring:message code="supplier.name.label" /> <span style="color:red; font-size:2">*</span></label>
                                        	<input type="text" class="form-control searchItems" style="height:30PX;border-radius: 6px !important;background:url(${pageContext.request.contextPath}/images/search.png) no-repeat;background-position:right;" name="supplier_name" placeholder="<spring:message code="enter.supplierName.label" />"  id="searchSupplier" />
											<div class=services>
									    		<div class="items">
									     			<ul class="matchedStringUl supplier" style="width: 89%!important;padding: 0px!important;z-index: 15;"></ul>
									   			</div>
											</div>								
											<span id="supplierNameError" style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
                                        </div>
                                     	<div class="form-group col-lg-4">
                                            <label style="font-family: Calibri;color: gray;"><spring:message code="supplier.code.label" /></label>
                                            <input type="text" class="form-control" readonly="readonly" name="supplier_id" id="supplier_Id" value=""  />
                                           <%--   <select class="form-control" name="supplier_id" id="supplier_id">
                                              <c:forEach var="supplier" items="${supplierList}">
												<option value="${supplier.firmName}">${supplier.supplierCode}</option>
											</c:forEach>
                                            </select> --%>
                                            
                                        </div>
                                        <div class="form-group col-lg-4">
                                            <label style="font-family: Calibri;color: gray;"><spring:message code="select.location" /></label>
                                             <select class="form-control" id="warehouse_location">
	                                             <c:forEach var="location" items="${workLocationsList}">
													<option value="${location.businessActivity}" ${location.locationId == selectedLocation ? 'selected' : ''}>${location.locationId}</option>
												</c:forEach>
                                            </select>
                                            <input type="hidden" name="location" id="location">
                                            
                                        </div>
									  </div>
                                      <div class="row">
                                        <div class="form-group col-lg-4">
                                            <label style="font-family: Calibri;color: gray;"><spring:message code="delivered.by.label" /> <span style="color:red; font-size:2">*</span></label>
                                            <input type="text" class="form-control" name="deliveredBy" id="delivered_by"  value="" required  placeholder="<spring:message code="enter.delivered.by.label" />" />
                                            <span id="deliveredByError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
                                         </div>
                                         <div class="form-group col-lg-4">
                                            <label style="font-family: Calibri;color: gray;"><spring:message code="inspected.by.label" /> <span style="color:red; font-size:2">*</span></label>
                                            <input type="text" class="form-control" name="inspectedBy" id="inspected_by" required value="${sessionScope.firstName}" placeholder="<spring:message code="enter.inspected.by.label" />"  />
                                            <span id="inspectedByError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
                                         </div>
                                         <div class="form-group col-lg-4">
                                            <label style="font-family: Calibri;color: gray;"><spring:message code="shipment.note.label" /></label>
                                              <input type="text" class="form-control searchItems" style="height:30PX;border-radius: 6px !important;background:url(${pageContext.request.contextPath}/images/search.png) no-repeat;background-position:right;" placeholder="<spring:message code="search.shipment.note.label" />"  id="searchShipmentNoteRefs" />
											<div class=services>
									    		<div class="items">
									     			<ul class="matchedStringUl searchShipmentNoteRefs" style="width: 89%!important;padding: 0px!important;z-index: 15"></ul>
									   			</div>
											</div>	
											<input type="hidden" name="shipment_note" id="shipment_note" value="">
                                         </div>
                                         
                                        </div>
                                         <div class="row">
                                         <div class="form-group col-lg-4">
                                            <label style="font-family: Calibri;color: gray;"><spring:message code="po.reference.label" /></label>
                                           <input type="text" class="form-control searchItems" style="height:30PX;border-radius: 6px !important;background:url(${pageContext.request.contextPath}/images/search.png) no-repeat;background-position:right;" placeholder="<spring:message code="enter.po.reference.label" />"  id="po_reference" />
											<div class=services>
									    		<div class="items">
									     			<ul class="matchedStringUl poRef" style="width: 89%!important;padding: 0px!important;z-index: 15"></ul>
									   			</div>
											</div>	
											<input type="hidden" name="po_reference" id="selected_po_ref" value="">

                                      	</div>
                                         <div class="form-group col-lg-4">
                                            <label style="font-family: Calibri;color: gray;"><spring:message code="procurement.status.label" /></label>
                                             <select class="form-control" name="status" id="status">
                                            <option value="Received">Received</option>
                                            <option value="Rejected">Rejected</option>
                                            <option value="Partially Rejected">Partially Rejected</option>
                                            <option value="Inspected">Inspected</option>
                                            <option value="Stored">Stored</option>
                                            </select>
                                         </div>
                                         <div class="form-group col-lg-4">
                                            <label style="font-family: Calibri;color: gray;"><spring:message code="date.label" /></label>
                                            
                                        <input class="form-control calendar_icon" readonly="readonly" value="" style="background-color: white;" value="${procurementreceipt.dueDateStr}" name="date" id="date" size="20" type="text" onfocus="callCalender('date')" onclick="callCalender('date')" placeholder="DD/MM/YYYY"/>
                                            <span id="dateError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
                                        </div>
                                         </div>
                                             
                                             </c:otherwise>
                                             </c:choose>
                              
                                        
                                       <div class="row">
                                        <br>
                                          <div class="form-group col-lg-5 col-xs-2" style="text-align:center;  margin-bottom: 0.3%;">
                                         	<%-- <label style="font-family: Calibri;color: gray;"><spring:message code="search.items.here.label" /></label> --%>
											<input type="text"  class="form-control searchItemsforGRN searchBar" id="searchItems"  placeholder="<spring:message code="search.items.here.label" />"  style="" />
											<div class="services">
								    			<div class="items">
								     				<ul class="matchedStringUl receipt" style="z-index: 15;width: 160%;"></ul>
								   				</div>
											</div>
                                            <!-- <input type="text" list="skuList" class="form-control"  name="searchCriteria" id="searchCriteria" />
 												<datalist id="skuList"></datalist> -->
  										 </div>
  										  <div class="form-group col-lg-1 col-xs-2" style="padding: 0px;padding-top: 5px;margin-bottom: 0px !important;">
											<input type="checkbox" style="vertical-align: -2px" id="searchScan" />
											 &nbsp;&nbsp;Scan
										</div>
										<div class="form-group col-lg-1 col-xs-2" style="padding: 0px;padding-top: 5px;margin-bottom: 0px !important;">
											<input type="checkbox" style="vertical-align: -2px" id="taxInclusive" />
											 &nbsp;&nbsp;Inclusive
										</div>
						
										 <div class="col-lg-2 col-xs-2">
									<input type="file" class="btn bg-olive btn-inline" accept=".xlsx"
										 id="fileUploadCSV" onchange="addNameToTextBoxGRN('fileUploadCSV')"
										style="padding: 4px 0px;width: 100%;" />
								</div>
								<div class="col-lg-1 col-xs-2" style="padding-left: 0px;">
    					<input type="button"  class="btn bg-olive btn-inline" value="Upload" id="btnUpload"  onclick="importExcelDataForGRN(this,'new')" style="padding: 5px 8px;width: 100%;margin-left: -12px;" />
						</div>
						
						<div class="col-lg-1 col-xs-1 nopadding">
									<div class="fileUpload btn btn-primary browsebutton" style="width: 92%;">
			    			        <span style="font-size:14px;"> Attachment </span>
			    			         <input type="file" id="attachmentUpload" onchange="addNameToTextBox('attachmentUpload',this)" class="upload">
						             <input   type="hidden" name="docLinkId" id="attachmentUpload_refId" value="${agreementDocId.agreementDocId}"> 
						               <input   type="hidden" name="docLink" id="attachmentUploadFile" value="${agreementDoc.agreementDoc}"> 
						               
						                </div>
								</div>
						<div class="col-lg-1 col-xs-1" style="padding-left:0px;padding-right:0px">
								<img style="width: 30px;height: 30px;margin-left: 25px;display: none" id="skuMasterImg1" src="${pageContext.request.contextPath}/images/circleWait.gif">
                         </div>
						
                                        </div>
                                        
                                         <div class="table-responsive" style="overflow-x:auto;">
                                           <c:choose>
                    <c:when test="${flowUnder == 'warehouse' || flowUnder == 'procurement'}">
                         <div class="table-responsive" style="min-height: 25px;max-height: 450px;">
                    <table id="productsList"  class="table table-bordered table-hover"  >
                      <thead style="background-color: #3c8dbc; color: #ffffff" class="stickyheader">
                        <tr>
                        	<th class="sticky-col first-col stickyheader" style="width: 60px;background-color: #a1dbf1 !important;"><spring:message code="sl.no.label" /></th>
                        	<th class="sticky-col second-col stickyheader"style="background-color: #a1dbf1 !important;"><spring:message code="skuid.label"/></th>
                        	<th class="sticky-col third-col stickyheader"style="background-color: #a1dbf1 !important;"><spring:message code="ean.label"/></th>
                        	<th class="sticky-col fourth-col stickyheader"style="background-color: #a1dbf1 !important;"><spring:message code="hsnCode.label"/></th>
                        	<th class="sticky-col fifth-col stickyheader"style="background-color: #a1dbf1 !important;"><spring:message code="ScanCode.label"/></th>
                            <th class="sticky-col sixth-col stickyheader"style="background-color: #a1dbf1 !important;"><div style="width:200px"><spring:message code="item.desc.label"/></div></th>
                            <th style="width: 121px;"><spring:message code="batch.label" />
                            <th style="width: 115px;"><spring:message code="grn.expiredDateStr.label"/></th>
                            <th><spring:message code="suppliedqty.label"/></th>
                            <th>M Range</th>
                            <th><spring:message code="uom.label"/></th>
                            <th><spring:message code="mrp.label"/></th>
                            <th><spring:message code="prqty.label"/></th>
                            <th><spring:message code="prprice.label"/></th>
                            <th>Disc %</th>
                            <th>Disc Amount</th>
                            <th>Free Qty</th>
                            <th><spring:message code="tax.label"/>%</th>
                            <th><spring:message code="cgst.label"/></th>
                            <th><spring:message code="sgst.label"/></th>
                            <th><spring:message code="igst.label"/></th>
                            <th>CESS</th>
                        
                            <th><spring:message code="suppliedprice.label"/></th>
                            <th>Net Value</th>
                             <th>Storage Ref</th> 
                           
                            <th><spring:message code="handled.by.label" />
                        <input type="hidden"  id="handledBy" value="${empList}">
                            </th>
                            <th><spring:message code="action.label"/></th>
                        </tr>
                        </thead>
                         
                         
                         
                          <tbody style="text-align: center;">
                       <c:forEach var="item" items="${procurementreceipt.itemDetails}" varStatus="theCount">
             		   <tr id="dynamicdiv${theCount.count}">
             		   <td class="slno sticky-col first-col" style='background: #f9f9f9;' >${theCount.count}</td>
              									<td  id="Name${theCount.count}"  class='sticky-col second-col' style='background: #f9f9f9;'>${item.skuId}</td>
              										<td  id="ean${theCount.count}" class='sticky-col third-col' style='background: #f9f9f9;'>${item.ean}</td>
              									<input type="hidden" id="skuId${theCount.count}" value="${item.skuId}" />
              									<input type="hidden"  value="${item.sno}" />
              								<%-- 	<input type="hidden" id="sno${theCount.count}" value="${item.sno}" /> --%>
              									<input type="hidden" id="pluCode${theCount.count}" value="${item.pluCode}"/>
              									<input type="hidden" id="category${theCount.count}" value="${item.category}"/>
              									<input type="hidden" id="brandCode${theCount.count}" value="${item.brand}"/>
              									<input type="hidden" id="productRange${theCount.count}" value="${item.productRange}"/>
              									<input type="hidden" id="measureRange${theCount.count}" value="${item.measurementRange}"/>
              									<input type="hidden" id="color${theCount.count}" value="${item.color}"/>
              									<input type="hidden" id="size${theCount.count}" value="${item.size}"/>
              									 <input type='hidden' id="trackingRequired${theCount.count}" class="trackingRequired" value="${item.trackingRequired}"/>
              									 <input type='hidden' id="batchRequired${theCount.count}" class="batchRequired" value=""/>
              									<input type="hidden" id="utility${theCount.count}" value="${item.utility}"/>
              								   
              								   <td  id="hsnCode${theCount.count}" class='sticky-col fourth-col' style='background: #f9f9f9;'>${item.hsnCode}</td>
              							      <td  id="itemScanCode${theCount.count}"   class="itemScanCode sticky-col fifth-col" style='background: #f9f9f9;' contenteditable='true'>${item.itemScanCode}</td>  
                  							
                  		                        <td id="Desc${theCount.count}" class='sticky-col sixth-col' style='width:300px!important;background: #f9f9f9;'><div id="overflowtext"> <a href="#" data-toggle="tooltip"  title="${item.itemDesc}">${item.itemDesc}</a></div></td>    
                  							
<%--                   								<td  id="Desc${theCount.count}" >${item.itemDesc}</td>
 --%>                  								<td><textarea id="batchNum${theCount.count}" rows=1 style='resize:none;width: 87px;'>${item.bactchNum}</textarea></td>
                  								 <td><input class="form-control calendar_icon startDate" value="${item.expiryDateStr}" readonly="readonly" style="width:100px;background-color: white;" id="expiryDate${theCount.count}" onfocus="callCalender('expiryDate${theCount.count}')" onclick="callCalender('expiryDate${theCount.count}')" placeholder='DD/MM/YYYY' type="text"/></td>
                  								
                  								
                  								 <td style="" class='Pack' onBlur='changePack(this);' contenteditable="true" onkeypress='return (this.innerText.length < 10)' id="Pack${theCount.count}">${item.suppliedQty}</td>
                  								<td></td>
                  								<td id="Make${theCount.count}" >${item.uom}</td>
                  								<td><input type="text" id="mrp${theCount.count}"  style="width:70px;text-align:center" value="${item.mrp}"></td>
                  								<td id="Requested${theCount.count}"  >${item.orderQty }</td>
                  								<td class='Price${theCount.count}' id="SPrice${theCount.count}" >${item.orderPrice}</td>
                  								<td><input type="text" id="discountpercentage${theCount.count}" onBlur="changeDiscPerc(this);" contenteditable="true" onkeypress='return (this.innerText.length < 10)' style="width:70px;text-align:center" value="${item.discount}"></td>
                  								<td><input type="text" id="discountAmt${theCount.count}" onBlur="changeDiscAmt(this);" contenteditable="true" onkeypress='return (this.innerText.length < 10)' style="width:70px;text-align:center" value="${item.discountAmt}"></td>
                  								<td><input type="text" id="freeqty${theCount.count}" onBlur="changeSupplyPrice(this);" contenteditable="true" onkeypress='return (this.innerText.length < 10)'  style="width:70px;text-align:center" value="${item.freeQty}"></td>
                  								<td id="tax${theCount.count}" onblur="changeGrnTax(this);" contenteditable="true" >${item.itemTax}</td>
                  								<td id="cgsttax${theCount.count}">${item.cgstRate}</td>
                  								<td id="sgsttax${theCount.count}">${item.sgstRate}</td>
                  								<td id="igsttax${theCount.count}">${item.igstRate}</td>
                  								<td id="cess${theCount.count}">${item.cessAmt}</td>
                  							    <td style="" onBlur="changeSupplyPrice(this);" contenteditable="true" onkeypress='return (this.innerText.length < 10)' id="Price${theCount.count}" >${item.supplyPrice}</td>
                  								<td id="Cost${theCount.count}" >${item.totalCost}</td>
                  							    <td>
                  							    
                  							    <select autofocus style='width:180px' class='storageRefence'  id='storageRef${theCount.count}'>
                  								   <c:forEach var="StorageRefNumber" items="${item.storageRefList}">
                  									<option value="${StorageRefNumber.storageSystemId}" ${item.storageRef==StorageRefNumber.storageSystemId ? 'selected' : ''} >${StorageRefNumber.storageSystemId}</option>
                  								</c:forEach>
                  								</select>
                  							    
                  							    </td> 
                  								
                  								<td><select autofocus style='width:180px' class='handledBy'  id='handledBy${theCount.count}'>
                  							
                  								 <c:forEach var="empList" items="${empList}">
                  								<option value="${empList}" ${empList==item.handledBy ? 'selected' : ''} >${empList}</option>
                  								</c:forEach>
                  								
                  								</select>
                  								  <input type="hidden"  id="selectedEmployee" value="${item.handledBy}"></td> 
                  								
                  								<!-- <option>${empList}</option></select>
                  								-->
                  								<td id="Del${theCount.count}" ><img id="Img${theCount.count}" src='${pageContext.request.contextPath}/images/itemdelete.png' style='width:12%;cursor:pointer;' onclick='deleteItem(this);' title='Delete ${item.skuId}'/></td>
                  	   				
                  	   </tr>
              		   </c:forEach> 
		 </tbody>
               
                        </table></div>
                        
                        </c:when>
                      
                        <c:otherwise>
                                        <table id="productsList" class="table table-bordered table-hover">
                                          <thead style="background-color: #3c8dbc; color: #ffffff">
                                            <tr>
                                            	<th><div><spring:message code="sl.no.label" /></div></th>
                                            	<th><spring:message code="item.name.label"/></th>
                                                <th><spring:message code="item.desc.label"/></th>
                                                <th><spring:message code="price.label"/></th>
                                                <th><spring:message code="pack.label"/></th>
                                                <th><spring:message code="cost"/></th>
                                                <th><spring:message code="make.label"/></th>
                                                <th><spring:message code="supplied.label"/></th>
                                                <th><spring:message code="received.label"/></th>
                                                <th><spring:message code="rejected.label"/></th>
                                                <th><spring:message code="action.label"/></th>
                                            </tr>
                                          </thead>
                                        
                                        
                                                   <tbody style="text-align: center;">
                                           
                                           
                                            <c:forEach var="item" items="${procurementReceipt.items}" varStatus="theCount">
             		   						<%-- <tr id=dynamicdiv${fn:replace(item.item_code,' ','')}>
              									<td id=${fn:replace(item.item_code,' ','')}Name >${item.item_code}</td>
                  								<td id=${fn:replace(item.item_code,' ','')}Desc >${item.item_description}</td>
                  								<td class='Price' id=${fn:replace(item.item_code,' ','')}Price >${item.price}</td>
                  								<td class='Pack' onBlur='changePack(this);' contenteditable='true' id=${fn:replace(item.item_code,' ','')}Pack >${item.pack }</td>
                  								<td id=${fn:replace(item.item_code,' ','')}Cost >${item.cost}</td>
                  								<td id=${fn:replace(item.item_code,' ','')}Make >${item.make}</td>
                  								<td id=${fn:replace(item.item_code,' ','')}Supplied >${item.supplied }</td>
                  								<td class='Received' id=${fn:replace(item.item_code,' ','')}Received >${item.received}</td>
                  								<td onBlur='changeRejected(this);' contenteditable='true' id=${fn:replace(item.item_code,' ','')}Rejected >${item.reject}</td>
                  								<td id=${fn:replace(item.item_code,' ','')} ><img id=${fn:replace(item.item_code,' ','')} src='${pageContext.request.contextPath}/images/itemdelete.png' style='width:13%;height:13%;cursor:pointer;' onclick='deleteItem(this);' title='Delete ${item.item_code}'/></td>
                  	   						</tr> --%>
                  	   						<tr id="dynamicdiv${theCount.count}">
                  	   							<td class="slno">${theCount.count}</td>
              									<td id="Name${theCount.count}" >${item.item_code}</td>
              									<input type="hidden" id="skuId${theCount.count}" value="${item.skuId}" />
              									<input type="hidden" id="pluCode${theCount.count}" value="${item.pluCode}"/>
                  								
                  					<td id="Desc${theCount.count}"><div id="overflowtext"> <a href="#" data-toggle="tooltip"  title="${item.item_description}">${item.item_description}</a></div></td>    
                  								
                  								<td id="Desc${theCount.count}" >${item.item_description}</td>
                  								<td class='Price' id="Price${theCount.count}" >${item.price}</td>
                  								<td class='Pack' onBlur='changePack(this);' onkeypress='return (this.innerText.length < 10)' contenteditable='true' id="Pack${theCount.count}" >${item.pack }</td>
                  								<td id="Cost${theCount.count}" >${item.cost}</td>
                  								<td id="Make${theCount.count}" >${item.make}</td>
                  								<td id="Supplied${theCount.count}" >${item.supplied }</td>
                  								<td class='Received' id="Received${theCount.count}" >${item.received}</td>
                  								<td onBlur='changeRejected(this);' onkeypress='return (this.innerText.length < 10)' contenteditable='true' id="Rejected${theCount.count}" >${item.reject}</td>
                  								<td id="Del${theCount.count}" ><img id="Img${theCount.count}" src='${pageContext.request.contextPath}/images/itemdelete.png' style='width:12%;cursor:pointer;' onclick='deleteItem(this);' title='Delete ${item.item_code}'/></td>
                  	   						</tr>
              		   						</c:forEach> 
                                           
                						 </tbody>
                                                             </table>
                                       </c:otherwise></c:choose>
                                    </div>
                                   
                                   <%--    <div class="row">
								<div class="col-lg-8"></div>
								<div class="form-group col-lg-3 labelgrn" style="text-align: right;"><label style="font-family: Calibri;color: gray;" ><spring:message code="total.GRN.value"/></label></div>
								<div class="form-group col-lg-1">
								<input type="text" readonly="readonly" class="form-control" id="totalCost" name="totalCost"  value="" />
								</div>
							</div> --%>
							<div class="col-lg-12 nopadding" style="margin-top: 10px;">
					<div class="col-lg-6"></div>
					<div class="col-lg-2 nopadding">
					
					<fmt:formatNumber var="MyResult"  type="number" maxFractionDigits="2" minFractionDigits="2" value="${procurementreceipt.subTotal}"/>
					<div class="form-group col-lg-7" style="text-align: right;"><label style="font-family: Calibri;color: gray;"><spring:message code="sub.total.label" /> </label></div>
					<div class="form-group col-lg-5 nopadding">
						<input type="text" class="form-control" id="subtotalCostgrn" name="subTotal" readonly="readonly" value="${MyResult}"/>
					</div></div>
					<div class="col-lg-2 nopadding">
					
					<div class="form-group col-lg-8 " style="text-align: right;"><label style="font-family: Calibri;color: gray;">No Of Items</label></div>
						<div class="form-group col-lg-4 nopadding">
					
						<input type="number" class="form-control" id="noofitems" name="noofitems" readonly="readonly" value="0"/>
					</div>
					</div>
					<div class="col-lg-2 nopadding">
						<div class="form-group col-lg-8" style="text-align: right;"><label style="font-family: Calibri;color: gray;"><spring:message code="shipping.cost.label" /> </label></div>
						<div class="form-group col-lg-4 nopadding">
						<input type="text" class="form-control" id="shipping_costgrn" name="shipmentCharges" value="0.0" />
						</div></div>
						<span id="shipCostError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
				</div>
                  <div class="col-lg-12 nopadding">
						<div class="col-lg-6"></div>
					<div class="col-lg-2 nopadding">
						<div class="form-group col-lg-7 " style="text-align: right;"><label style="font-family: Calibri;color: gray;"><spring:message code="taxes.label" /> </label></div>
						<div class="form-group col-lg-3 nopadding">
						<input type="text" class="form-control" readonly id="total_taxgrn" name="tax" value="${procurementreceipt.tax}"  oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');"/>
						<span id="totalTaxError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
						</div>
						
						<div class="form-group col-lg-2 nopadding">
						<input type="text" class="form-control"  style="margin-left: 3px;" id="other_taxgrn" name="otherTaxAmt"  value="0.0" />
						</div>
						
						</div>
						<div class="col-lg-2 nopadding">
					
					<div class="form-group col-lg-8" style="text-align: right;"><label style="font-family: Calibri;color: gray;">Total Qty</label></div>
						<div class="form-group col-lg-4 nopadding">
					
						<input type="number" class="form-control" id="totalqty" readonly="readonly" name="totalqty" pattern= "[0-9]" value="0" />
						</div>
						</div>
						
						<div class="col-lg-2 nopadding">
						<div class="form-group col-lg-8 " style="text-align: right;"><label style="font-family: Calibri;color: gray;"><spring:message code="discounts.label" /> </label></div>
						<div class="form-group col-lg-4 nopadding">
						<input type="text" class="form-control" id="discountgrn" name="totalDiscount" value="0.0"  />
						</div>
						</div>
					</div>
					
					 <!-- <div class="col-lg-12 nopadding">
					<div class="col-lg-6"></div>
					<div class="col-lg-3 nopadding">
					
					<div class="form-group col-lg-7 " style="text-align: right;"><label style="font-family: Calibri;color: gray;">No Of Items</label></div>
						<div class="form-group col-lg-5 nopadding">
					
						<input type="number" class="form-control" id="noofitems" name="noofitems" readonly="readonly" value="0"/>
					</div>
					</div>
				
				
					<div class="col-lg-3 nopadding">
					
					<div class="form-group col-lg-7 " style="text-align: right;"><label style="font-family: Calibri;color: gray;">Total Qty</label></div>
						<div class="form-group col-lg-5 nopadding">
					
						
						<input type="number" class="form-control" id="totalqty" readonly="readonly" name="totalqty" pattern= "[0-9]" value="0" />
						</div>
						</div>
						
				</div> -->
					<div class="col-lg-12 nopadding" style="margin-bottom: 10px;">
						<div class="col-lg-6">
						
						
						
						
											<div class="row" style="">
											
						<c:if test="${flowUnder == 'warehouse' }">
						<div class="col-lg-3">
							<input type="button" class="btnCls" onclick="validateShipmentReceipt('save','')" style="margin-left: 24%;margin-bottom: -33px;" value="<spring:message code="submit.label" />" />
					       </div>
					       <div class="col-lg-3">
					        <input type="button" class="btnCls" onclick="validateShipmentReceipt('draft')" style="margin-left: 14%;margin-right: 8%;text-align: center;margin-bottom: -33px;" value="<spring:message code="save.label" />" />
						</div>
						 <div class="col-lg-3">
					        <input type="button" class="btnCls" onclick="" style="margin-left: 14%;margin-right: 8%;text-align: center;margin-bottom: -33px;width: 100px;" value="Print Labels" />
						</div>
						</c:if>
						<c:if test="${flowUnder == 'procurement'}">
						<div class="col-lg-3">
						<input type="button" class="btnCls" onclick="validateShipmentReceipt('save','')" style="margin-left: 24%;margin-bottom: -33px;" value="<spring:message code="submit.label" />" />
						</div>
						<div class="col-lg-3">
							<input type="button" class="btnCls" onclick="validateShipmentReceipt('draft')" style="margin-left: 14%;margin-right: 8%;text-align: center;margin-bottom: -33px;" value="<spring:message code="save.label" />" />
					</div>
					<div class="col-lg-3">
										        <input type="button" class="btnCls" onclick="" style="margin-left: 14%;margin-right: 8%;text-align: center;margin-bottom: -33px;width: 100px;" value="Print Labels" />
						</div>
						</c:if>
						 		<%-- <c:if test="${sessionScope.role == 'super admin'}">
							<input type="button" class="btn bg-olive btn-inline" onclick="return viewShipmentReceipts('all','','0');" style="margin-left:5%;" value="<spring:message code="cancel.label" />" />
						</c:if> --%>
						<div class="col-lg-3">
						<c:if test="${sessionScope.role != 'super admin'}">
		        			<c:if test="${flowUnder == 'procurement'}">
			        			<c:forEach var="accessControl" items="${sessionScope.procurement}">
		                           <c:if test="${accessControl.appDocument == 'ShipmentReceipts' && accessControl.read == true}">
										<input type="button" class="btnCls" onclick="return viewShipmentReceipts('all','','0');" style="margin-bottom: -33px;margin-left: 6%" value="<spring:message code="cancel.label" />" />
								  </c:if>
								</c:forEach>
		        			</c:if>
		        			<c:if test="${flowUnder == 'warehouse' }">
			        			<c:forEach var="accessControl" items="${sessionScope.warehouseStockmanagement}">
		                           <c:if test="${accessControl.appSubDocument == 'WarehouseGRN' && accessControl.read == true}">
										<input type="button" class=" btnCls" onclick="return viewShipmentReceipts('all','','0');" style="margin-bottom: -33px;margin-left: 6%" value="<spring:message code="cancel.label" />" />
								  </c:if>
								</c:forEach>
		        			</c:if>
		        		</c:if>
		        		</div>
						</div> 
						
						
						
						
						
						
						
						
						</div>
						<div class="col-lg-6 nopadding">
						<div class=" col-lg-1"></div>
						<div class=" col-lg-3" style="    font-size: 22px;    background-color: #f4f4f4;padding: 7px 0px; border-top: 1px solid #ccc;">&nbsp</div>
						<div class=" col-lg-8 nopadding"style="    background-color: #f4f4f4;padding: 7px 0px; border-top: 1px solid #ccc;">
						<div class=" col-lg-5 nopadding" style="font-size: 22px;"><label style="font-family: Calibri;color: gray;"><spring:message code="cost.label" /> </label></div>
						<div class=" col-lg-3"></div>
						<div class=" col-lg-4" style="padding-right: 0px;padding-left: 7px;">
						<%--  <c:choose>
                                      <c:when test="${!procurementreceipt.totalCost}"> --%>
                   <input type="text" style="background-color: #fff;" class="form-control" id="totalCost" name="totalCost" readonly="readonly" value="${procurementreceipt.totalCost}"/>
						
					<%--  </c:when> 
					<c:otherwise>
					<input type="text" style="background-color: #fff;" class="form-control" id="totalCost" name="totalCost" readonly="readonly" value="0.0"/>
					  </c:otherwise>
					 </c:choose>  --%>
					</div></div></div>
					</div>
							
						
                                    <c:choose>
                                      <c:when test="${flowUnder == 'warehouse' || flowUnder == 'procurement'}">
                  
                    </c:when>
                    <c:otherwise>
                                     <div class="row">
                                     
                                         <div class="form-group  col-lg-12">
                                         	<label style="font-family: Calibri;color: gray;"><spring:message code="remarks.label" /></label>
                                            <textarea class="form-control" name="remarks" id="remarks" style="resize: none;" rows="2" placeholder="<spring:message code="enter.remarks.label" />" ></textarea>
 										 </div>
                                        </div>
                                      
                                        <div class="row">
											<div class="col-lg-6"></div>
											<div class="form-group col-lg-3" style="text-align: right;"><label style="font-family: Calibri;color: gray;"><spring:message code="totalquantity.label" /> </label></div>
											<div class="form-group col-lg-3">
												<input type="text" readonly="readonly" class="form-control" id="totalQty" name="totalQty"  value="" />
											</div>
										</div>
										<div class="row">
											<div class="col-lg-6"></div>
											<div class="form-group col-lg-3" style="text-align: right;"><label style="font-family: Calibri;color: gray;"><spring:message code="cost.label" /> </label></div>
											<div class="form-group col-lg-3">
												<input type="text" readonly="readonly" class="form-control" id="totalCost" name="totalCost"  value="" />
											</div>
										</div></c:otherwise></c:choose>
                                      <input type="hidden" id="desc">
                                      	<!-- COMPOSE MESSAGE MODAL -->
                                      	<div id="triggerEvent"></div>
                                      	<div class="modal fade" id="myModalIos" role="dialog" tabindex="-1">
    <div class="modal-dialog iosmodeldialog">
    
      <!-- Modal content-->
      <div class="modal-content ">
        <div class="modal-header">
       
          <button type="button" class="close"  data-dismiss="modal">&times;</button>
        </div>
        <div class="modal-body">
       <div class="form-group col-lg-12" style="padding: 0px;font-size: 15px">Are you want to Close the  PO Ref
       
          <!-- <div class="col-lg-1"> -->
         
        <!--  </div> -->
         </div>
        <div class="form-group col-lg-10"></div>
   
          <div class="col-lg-4 col-sm-6 col-xs-6" style=""></div>
          <div class="form-group col-lg-8 col-sm-6 col-xs-6" style="padding-left: 0px; padding-right: 0px;">
<div class="col-lg-6 col-sm-6 col-xs-6" style="padding-left: 5px; padding-right: 5px;">
 <input type="button" class="iosclosebutton1" id="closepo" onclick="validateShipmentReceipt('save','true')"  value="Ok">
</div>
<div class="col-lg-6 col-sm-6 col-xs-6" style="padding-left: 5px; padding-right: 5px;">
  <input type="button" class="iosclosebutton1" id="openpo" onclick="validateShipmentReceipt('save','false')" data-dismiss="modal" value="Cancel">
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
         <div class="modal fade popup-display" id="items-modal" tabindex="-1" role="dialog" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        <h4 class="modal-title" style="text-align: center;"><spring:message code="select.products.label" /></h4>
                    </div>
             <form action="#" method="post">
                 <div class="modal-body">
                  <div class="box-body table-responsive">
                     <table id="itemsList" class="table table-bordered table-hover">
                       <thead style="background-color: #3c8dbc; color: #ffffff">
                         <tr>
                         <th style="" align="center" ><input type='checkbox' name='selectall' onClick='selectAll(this)'></th>
                             <th style="width:10"><spring:message code="item.desc.label"/></th>
                             <th><spring:message code="price.label"/></th>
                                <th><spring:message code="product.range.label"/></th>
                              <th><spring:message code="grade.label"/></th>
                                <th><spring:message code="brand.label"/></th>
                             <th><spring:message code="color.label"/></th>
                                            <th><spring:message code="size.label"/></th>
                                            <th><spring:message code="ean.label"/></th>
                         </tr>
                       </thead>
                       <tbody style="text-align: center;overflow-x:auto;width:100%">
			 			</tbody>
                    </table>
                 </div>
               
                     <div class="col-lg-8 col-sm-8 col-xs-12" style=""></div>
          <div class="form-group col-lg-4 col-sm-4 col-xs-12" style="padding-left: 0px; padding-right: 0px;">
<div class="col-lg-6 col-sm-6 col-xs-6" style="padding-left: 5px; padding-right: 5px;">
 <input type="button" class="iosclosebutton1"  onclick="getPrice(this);"  value="Ok">
</div>
<div class="col-lg-6 col-sm-6 col-xs-6" style="padding-left: 5px; padding-right: 5px;">
  <input type="button" class="iosclosebutton1" data-dismiss="modal" value="Cancel">
</div></div>
              </div>
             </form> 
          
         </div><!-- /.modal-content -->
     </div><!-- /.modal-dialog -->
 </div><!-- /.modal -->
                                    </div><!-- /.box-body -->
							<div class="row" style="">
						
						</div> 
				<br/>
                <div class="box-footer">
                                     
                </div>
               </form>
             </div>
           <%--   <input type="hidden" id="subCategories" value='${subCategories}'> --%> 
           
</div>
</div>
</section><!-- /.content -->

</body>
</html>