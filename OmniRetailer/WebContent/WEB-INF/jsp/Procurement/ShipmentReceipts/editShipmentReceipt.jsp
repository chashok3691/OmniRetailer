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
    <%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
 
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    <!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
	<title>Home | Omni Retailer</title>
	<meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>
<%-- 	<script src="${pageContext.request.contextPath}/js/jquery-1.6.4.min.js"></script>  --%>

 <script src="${pageContext.request.contextPath}/js/form_plugin.js"></script>
 <script type="text/javascript" src="${pageContext.request.contextPath}/js/validation.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/controller.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/procurement/purchaseOrderAndReceipts.js"></script>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/jquery.calendars.picker.css">
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.calendars.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.calendars.plus.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.calendars.picker.js"></script>

<script type="text/javascript">
$(document).ready(function(){
	//$(this).scrollTop(0);
	focusDiv("Error")
var selectedEmployee = $("#selectedEmployee").val();
	$("#handledBy").val(selectedEmployee);

	callCalender("date");
	callCalender("deliveredOnStr");
	var supplierName = $("#supplier_id").val();
	$("#supplier_name").val(supplierName);
	$('#supplier_id').change(function () {
		 var supplierName = $("#supplier_id").val();
		 $("#supplier_name").val(supplierName);
	});
	/*  var date = getCurrentDate();
	 $('#date').val(date); */
    
	/* $("#searchCriteria").bind('input', function () {
	 var element = $(this);
	 var searchName = $(this).val();
	 $('#skuList option').each(function(index){
		 if($(this).val()==searchName){
			 getRawMaterialInfo();
		 }
	 });
	 
	 isAlphabet(element);
	 searchName = $(this).val();
	 if(searchName!=""&&searchName.length==3){
       	getRawMaterial(searchName);
       }
	}); */
	
	 var len = $("#productsList tr").length-1;
	 for(var i=1;i<=len;i++){
		 callCalender('expiryDate'+i);
		 
	 }
	
	 $("#delivered_by").keydown(function(){
		   $("#deliveredByError").html("");
		   $("#Error").html("");
	 }); 
	 $("#inspected_by").keydown(function(){
		   $("#inspectedByError").html("");
		   $("#Error").html("");
	 }); 
 
	 getstateforPOandGRN();
	 changeTotalitems();
	 changeTotalCost();
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


.stickyheader {
  position: sticky !important;
  top: 0;
 z-index: 10 !important;
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




.widthlabel {
    width: 100px;
}

	div.stars {
  width: 270px;
   display: inline-block; 
  display:table-row-group;
}

input.star { display: none; }

label.star {
  float: right;
  padding: 5px;
  font-size: 20px;
  color: #FFA500;
  transition: all .2s;
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
 .p:first-child { 
   border-bottom: none !important;
    width:0% !important; 
    padding-left: 0px !important;
    padding-right: 0px !important;
}
.labelgrn
{
margin-top: 3px;
}
.form-group {
    margin-bottom: 5px;
}
.modal-dialog {
       width: auto;
    position: absolute;
    margin-top: 5%;
    margin-left: 20%;
}

#blinking {
     color: #2d38be;
     font-size: 12px;
     font-weight: bold;
     white-space: nowrap;
     margin-top: 5px;
     transition: 1.2s;
     float: left;
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
.iospopupp {
   	width: 70%!important;
    margin-left: 45%;
    margin-top: 0%;
    border-radius: 2;
    border-radius: 12px;
	
}
</style>
</head>
<body>
<!-- Main content -->
<section class="content">
 <div class="row">
  <div class="col-lg-12">
				<div class="box box-primary">
                                <div class="box-header" style="text-align: center">
                                <br/>
                                <div class="form-group">
                               <div class="form-group col-lg-7"  style="">
                                <h3    style="text-align: right; margin-top: 5px;" ><label style="border-radius: 5px; padding-left: 10px;padding-right: 10px;border: 1px solid;"><spring:message code="procurement.edit.grn.label" /></label></h3>
                                </div>
                                
                                <div class="form-group col-lg-4"  style="">
                                
                                <div class="form-group col-lg-5" style="text-align: right;    margin-top: 12px;"><spring:message code="rate.delivery" /></div>
											<div class="form-group col-lg-7">
											<div class="stars" id="stars_group">
												<input class="star star-5" id="star-5" type="radio" 
													name="star" value="5" onclick="userrating(5)"${procurementReceipt.vendorRating=='5'?'checked':''} /> <label
													class="star star-5" for="star-5"></label> <input
													class="star star-4" id="star-4" type="radio" name="star"
													value="4" onclick="userrating(4)" ${procurementReceipt.vendorRating=='4'?'checked':''}> <label
													class="star star-4" for="star-4"></label> <input
													class="star star-3" id="star-3" type="radio" name="star"
													value="3" onclick="userrating(3)" ${procurementReceipt.vendorRating=='3'?'checked':''}> <label
													class="star star-3" for="star-3"></label> <input
													class="star star-2" id="star-2" type="radio" name="star"
													value="2" onclick="userrating(2)" ${procurementReceipt.vendorRating=='2'?'checked':''}> <label
													class="star star-2" for="star-2"></label> <input
													class="star star-1" id="star-1" type="radio" name="star"
													value="1" onclick="userrating(1)" ${procurementReceipt.vendorRating=='1'?'checked':''}> <label
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
                                      <input type="hidden" id="qtyFlagstr"  value="${procurementReceipt.qtyFlag}">
                                   
                                   	 <div id="Error" class="Error" style="text-align: center;color: red;font-size: 2;font-weight: bold;margin-bottom: 10px; margin-top: -20px">${err}</div>
                                   	 <div class="row">
                                   	 <div class="col-lg-3"></div>
                                     <div id="ErrorExcel" class="ErrorExcel col-lg-4 nopadding" style="text-align: center;color: red;font-size: 2;font-weight: bold;white-space: nowrap; "></div>
											 	 <div class="col-lg-2 nopadding">
											 	  <a onclick="downloadlog();" style="color:blue;display: none;text-decoration: underline;cursor: pointer;" id="loglink">Click Here for Log!</a>
											 	 </div>
	                                   <div class="col-lg-3"></div>
	                                   </div>
	        						 <div id="Success" class="Error" style="text-align: center;color: blue;font-size: 2;font-weight: bold;margin-bottom: 10px; margin-top: -20px">${success}</div>
	        						 <br>
                                   	<c:choose>
                                   	<c:when test="${flowUnder == 'warehouse' || flowUnder == 'procurement'}">
                                             <input type="hidden" value="${procurementReceipt.receiptNoteId}" name="receiptNoteId" >
                                                <input type="hidden" value="${procurementReceipt.vendorRating}" value="1"  name="vendorRating" id="outlet_rating">
									<div class="row">
										<div class="form-group col-lg-3">
											<label><spring:message code="po.reference.label" /></label>
											<input type="text" class="form-control searchItems" name="poRef" value="${procurementReceipt.poRef}"
												style="height:30PX;background:url(${pageContext.request.contextPath}/images/search.png) no-repeat;background-position:right;"
												placeholder="<spring:message code="enter.po.reference.label" />"
												id="po_reference" />
											<div class=services>
												<div class="items">
													<ul class="matchedStringUl poRef"
														style="width: 89% !important; padding: 0px !important;z-index: 15"></ul>
												</div>
											</div>
											<span id="poRefError" style="text-align:right;color:red;font-weight:bold;"></span>
										</div>
										<div class="form-group col-lg-2">
											<label><spring:message code="supplier.code.label" /></label>
											<input type="text" class="form-control" readonly="readonly"
												name="supplierId" id="supplier_Id" value="${procurementReceipt.supplierId}" />
										
										<input type="hidden" class="form-control"  id="supplier_state" readonly="readonly" value="${procurementReceipt.supplier_state}"/>
										<input type="hidden" class="form-control"  id="location_state" readonly="readonly" value=""/>
										
										</div>	
										<div class="form-group col-lg-1"></div>
										
										<div class="form-group col-lg-2">
                                            <label>GSTIN</label>
                                         <input type="hidden" id="desc"/>
                                         <input type="hidden"  class="form-control searchItems searchBar" name="inspectedBy" id="inspectedBy"  value="${procurementReceipt.inspectedBy}" placeholder="<spring:message code="enter.inspected.by.label" />"    />
										<input type="text"  class="form-control" name="gstin" id="gstin" value="${procurementReceipt.gstin}" readonly="readonly"   />
										
										
										<%-- <div class="services">
							    			<div class="items">
							     				<ul class="matchedStringUl insemployee" style="${procurementReceipt.supplierId}"></ul>
							   				</div>
										</div> --%>
									</div>
							<input type="hidden" name="cgstAmt" id="cgstAmt" value="${procurementReceipt.cgstAmt}">
							<input type="hidden" name="sgstAmt" id="sgstAmt" value="${procurementReceipt.sgstAmt}">
 							<input type="hidden" name="igstAmt" id="igstAmt" value="${procurementReceipt.igstAmt}">
 							<%--  <input type="hidden" id="maxRecords" name="maxRecords" value="${skuObj.maxRecords}"> --%> 
										 <!--added by manasa  -->
               	<input type="hidden" id="operation" value="${operation}">
               	
               		<input type="hidden" id="doclinkfile" value="${procurementReceipt.docLink}">
               	
               
               	 <input type="hidden" id="urlfordoc" value="${procurementReceipt.url}"/>
               	 <input type="hidden" id="linktoDownload" value="${procurementReceipt.docLink}"/>
               	   <input type="hidden" id="linktoDownloadfileName" value="${procurementReceipt.dockLinkFileName}"/>
               	 
         <input type="hidden" id="skuidpo" value="${skuObj.skuId}"> 
   <%-- <input type="hidden" id="searchItems" value="${skuObj.brand}"> --%>
    <input type="hidden" id="warehouseLocation" value="${selectedLocation}">
     <input type="hidden" id="from" value="${startDate}"> 
      <input type="hidden" id="to" value="${endDate}"> 
       <input type="hidden" id="maxRecords" value="${maxRecords}"> 
 <input type="hidden"  class="itemwise" name="supplier_name" id="searchSupplier" value="${skuObj.itemName}" /> 
      <input type="hidden" id="searchShipmentReceiptId" value="${skuObj.searchCriteria}">
               <!--added by manasa  -->
										
										
										<!-- <div class="form-group col-lg-2">
                                            <label><spring:message code="inspected.by.label" /> <span style="color:red; font-size:2">*</span></label>
                                            <input type="text" class="form-control" value="${procurementReceipt.inspectedBy}" name="inspectedBy" id="inspectedBy" required  placeholder="<spring:message code="enter.inspected.by.label" />"  />
                                            <span id="inspectedByError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
                                         </div>	<div class="form-group col-lg-1"></div> -->

										<div class="form-group col-lg-2">
											<label><spring:message code="select.location" /></label> 
											<%-- <select class="form-control" id="warehouse_location">
												<c:forEach var="location" items="${workLocationsList}">
													<option value="${location.businessActivity}"
														${location.locationId == procurementReceipt.location ? 'selected' : ''}>${location.locationId}</option>
												</c:forEach>
											</select>  --%>
							<select class="form-control" id="warehouse_location" onchange="getstateforPOandGRN();">				
							<c:choose>
			                    <c:when test="${flowUnder == 'warehouse'}">
			                    <c:forEach var="location" items="${workLocationsList}">
			                    <c:if test="${location.businessActivity == 'Warehouse' }">
													<option value="${location.businessActivity}"
														${location.locationId == procurementReceipt.location ? 'selected' : ''}>${location.locationId}</option>
								</c:if>
								</c:forEach>
								</c:when>
								<c:otherwise>
								<c:forEach var="location" items="${workLocationsList}">
											<c:if test="${location.businessActivity == 'Retail Outlet' }">
													<option value="${location.businessActivity}"
														${location.locationId == procurementReceipt.location ? 'selected' : ''}>${location.locationId}</option>
								</c:if>
								</c:forEach>
								</c:otherwise>
							</c:choose>
												
												
												
												
											</select>
											<input type="hidden" name="location" id="location">
										</div>	
										<div class="form-group col-lg-2">
                                            <label><spring:message code="date.label" /><span style="color: red; font-size: 2">*</span></label>
                                            
                                        <input class="form-control calendar_icon" readonly="readonly" value="${procurementReceipt.dueDateStr}" style="background-color: white;" name="dueDateStr" id="date" size="20" type="text" onfocus="callCalender('date')" onclick="callCalender('date')" placeholder="DD/MM/YYYY"/>
                                            <span id="dateError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
                                        </div>
									</div>
								
									<div class="row">
									
									<div class="form-group col-lg-2">
											<label><spring:message code="invoice.number.label" /><span style="color: red; font-size: 2">*</span>
												</label>
											 <div class="form-group col-lg-12" style="padding-left:0px;padding-right:0px;">
												 <input type="text" class="form-control" name="invoiceRefNumber" id="invoiceRefNumber" value="${procurementReceipt.invoiceRefNumber}" placeholder="<spring:message code="enter.invoice.number.label" />" />
											</div>
											<span id="invoiceNumberError"
												style="text-align: right; color: red; font-size: 2; font-weight: bold;white-space: nowrap;"></span>
										</div> 
										<div class="form-group col-lg-1"></div>
										<div class="form-group col-lg-3">
                                   		<label><spring:message code="supplier.name.label" /> <span style="color:red; font-size:2">*</span></label>
                                           <!--  <input type="text" class="form-control" readonly="readonly" name="supplier_name" id="supplier_name" required /> -->
                                        	<input type="text" class="form-control searchItems" autocomplete="off" style="height:30PX;background:url(${pageContext.request.contextPath}/images/search.png) no-repeat;background-position:right;" name="supplierName" id="searchSupplier" value="${procurementReceipt.supplierName}" placeholder="<spring:message code="enter.supplierName.label" />"   />
											<div class=services>
									    		<div class="items">
									     			<ul class="matchedStringUl supplier" style="width: 89%!important;padding: 0px!important;z-index: 15"></ul>
									   			</div>
											</div>								
											<span id="supplierNameError" style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
                                        </div>
										
										<div class="form-group col-lg-2">
											<label><spring:message code="receivedby.label" />
												<span style="color: red; font-size: 2">*</span></label>
												<input type="text"  class="form-control searchItems searchBar"  name="receivedBy" id="receivedBy" value="${procurementReceipt.receivedBy}"  placeholder="<spring:message code="enterreceivedby.label" />" />
										<div class="services">
							    			<div class="items">
							     				<ul class="matchedStringUl recemployee" style="z-index:100"></ul>
							   				</div>
										</div>
												<span id="receivedByError"
												style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
												</div>
										
										<!-- <div class="form-group col-lg-2">
											<label><spring:message code="receivedby.label" />
												<span style="color: red; font-size: 2">*</span></label> <input
												type="text" class="form-control" name="receivedBy"
												id="receivedby" required value="${procurementReceipt.receivedBy}"
												placeholder="<spring:message code="enterreceivedby.label" />" />
											<span id="deliveredByError"
												style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
										</div>		
											<div class="form-group col-lg-1"></div> -->	
											
										<div class="form-group col-lg-2">
											<label><spring:message code="delivered.by.label" />
												<span style="color: red; font-size: 2">*</span></label> <input
												type="text" class="form-control" name="deliveredBy" value="${procurementReceipt.deliveredBy}"
												id="delivered_by" required
												placeholder="<spring:message code="enter.delivered.by.label" />" />
											<span id="deliveredByError"
												style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
										</div>	
										<div class="form-group col-lg-2">
                                            <label><spring:message code="delivery_date.label" /><span style="color: red; font-size: 2">*</span></label>
                                            
                                        <input class="form-control calendar_icon"   value="${procurementReceipt.deliveredOnStr}" style="background-color: white;" name="deliveredOnStr" id="deliveredOnStr" size="20" type="text" onfocus="callCalender('deliveredOnStr')" onclick="callCalender('deliveredOnStr')" placeholder="DD/MM/YYYY"/>
                                            <span id="dateError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
                                        </div>	
                                        <input type="hidden" name="deleteditems" id="itemDeletionList"/>
									</div>
									
									
										 <%-- <div class="row">
										<div class="form-group col-lg-2">
                                            <label><spring:message code="delivery_date.label" /><span style="color: red; font-size: 2">*</span></label>
                                            
                                        <input class="form-control calendar_icon"   value="${procurementReceipt.deliveredOnStr}" style="background-color: white;" name="deliveredOnStr" id="deliveredOnStr" size="20" type="text" onfocus="callCalender('deliveredOnStr')" onclick="callCalender('deliveredOnStr')" placeholder="DD/MM/YYYY"/>
                                            <span id="dateError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
                                        </div>	<div class="form-group col-lg-1"></div>
									
										<div class="form-group col-lg-2">
											<label><spring:message code="invoice.number.label" /><span style="color: red; font-size: 2">*</span>
												</label>
											 <div class="form-group col-lg-12" style="padding-left:0px;padding-right:0px;">
												 <input type="text" class="form-control" name="invoiceRefNumber" id="invoiceRefNumber" value="${procurementReceipt.invoiceRefNumber}" placeholder="<spring:message code="enter.invoice.number.label" />" />
											</div>
											<span id="invoiceNumberError"
												style="text-align: right; color: red; font-size: 2; font-weight: bold;white-space: nowrap;"></span>
										</div> <div class="form-group col-lg-1"></div>
										<div class="form-group col-lg-2">
											<label><spring:message code="delivered.by.label" />
												<span style="color: red; font-size: 2">*</span></label> <input
												type="text" class="form-control" name="deliveredBy" value="${procurementReceipt.deliveredBy}"
												id="delivered_by" required
												placeholder="<spring:message code="enter.delivered.by.label" />" />
											<span id="deliveredByError"
												style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
										</div>	<div class="form-group col-lg-1"></div>

											<div class="form-group col-lg-2">
											<label><spring:message code="submitedby.label" />
												<span style="color: red; font-size: 2">*</span></label> <input
												type="text" class="form-control"  name="submittedBy" value="${procurementReceipt.submittedBy}"
												id="submitedby" required
												placeholder="<spring:message code="entersubmitedby.label" />" />
											<span id="submittedByError"
												style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
										</div>
										<div class="form-group col-lg-2">
											<label><spring:message code="Approvedby.label" />
												<span style="color: red; font-size: 2">*</span></label> <input
												type="text" class="form-control" name="approvedBy" value="${procurementReceipt.approvedBy}"
												id="Approvedby" required
												placeholder="<spring:message code="enterApprovedby.label" />" />
											<span id="approvedByError"
												style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
										</div>	<div class="form-group col-lg-1"></div>
								</div>  --%>
								
										<div class="row">
										
									<!-- 	<div class="form-group col-lg-2">
											<label><spring:message code="handled.by.label" />
												</label> <input type="text" class="form-control" name="handledBy" id="handledBy" value="${procurementReceipt.handledBy}" placeholder="<spring:message code="enter.handled.by.label" />" />
										</div>	
										<div class="form-group col-lg-1"></div> -->
										
									<%--  <div class="form-group col-lg-2">
											<label><spring:message code="invoice.number.label" />
												</label>
											 <div class="form-group col-lg-12" style="padding-left:0px;padding-right:0px;">
												 <input type="text" class="form-control" name="invoiceRefNumber" id="invoiceRefNumber" value="${procurementReceipt.invoiceRefNumber}" placeholder="<spring:message code="enter.invoice.number.label" />" />
											</div>
											<span id="invoiceNumberError"
												style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
										</div> --%>	
										
									</div>
									<br>
								<%-- 	 <c:choose>
									      <c:when test="${flowUnder=='warehouse' ||  flowUnder=='procurement'}">
									 --%>
										<div class="col-lg-12" style="    background: #eee; padding: 10px 0px 10px 0px;margin-bottom: 10px;">
      									
      									
      									<div class="row">
              			 <div class="form-group col-lg-12" style="margin-bottom:0px;margin-left: 10px;">
              			 <c:forEach var="previousWorkFlowDate" items="${procurementReceipt.grnWorkFlowLogList}" varStatus="TheCount">
              			 <fmt:formatDate value="${previousWorkFlowDate.updatedDate}" var="startFormat" pattern="dd-MM-yyyy HH:mm:ss"/> 
						<input class="form-control" readonly="readonly" style="background-color: white;width: 14%;margin: 0px;display: inline-block;margin-right: 10px;" name="updated_due_date" id="updatedDate" size="20" type="text" value="${startFormat}"/>
						
                         </c:forEach>
                          </div>
              			</div>
      									
      									<div class="col-lg-9">
      									
      									<div class="col-lg-9" style="padding-left: 0px;    padding-top: 13px;">
      									  <c:forEach var="previousWorkFlowList" items="${procurementReceipt.grnWorkFlowLogList}">
      									  <div class="p" style="display:inline-block;"></div>
                                      <span class=" border" style="padding-left: 0px;padding-top: 17px;font-size: 16px;">
      									<img alt="" style="height:30px" src="${pageContext.request.contextPath}/images/workflow_arrow.png">${previousWorkFlowList.status}
      									</span>
      									
                                             </c:forEach></div>
      									</div>
      									<div class="col-lg-2">
      								<!-- <input type="hidden" value="draft" id="status" name="status" > -->
      									<c:choose>
      									<c:when test="${not empty procurementReceipt.nextActivities}">
      									<label><spring:message code="actionrecquired.label" /></label>
                                             <select class="form-control" id="statusissue" name="status">
                                             <option value="${procurementReceipt.status}">Action Required</option>
                                               <c:forEach var="activity" items="${procurementReceipt.nextActivities}">
                                              <option value="${activity}">${activity}</option>
                                             </c:forEach>
                                              
                                           </select>
      									</c:when>
      										<c:when test="${empty procurementReceipt.nextActivities}">
      									<label><spring:message code="actionrecquired.label" /></label>
                                             <select class="form-control" id="statusissue" name="status">
                                             <option value="${procurementReceipt.status}">Action Required</option>
                                              <c:forEach var="nextWorkFlowStates" items="${procurementReceipt.nextWorkFlowStates}">
                                              <option value="${nextWorkFlowStates}">${nextWorkFlowStates}</option>
                                             </c:forEach>
                                           </select>
      									</c:when>
      							
      									<c:otherwise>
      									 <input type="hidden" value="draft" id="statusissue" name="status" >
      									</c:otherwise>
      									</c:choose>
      									
      									 <input type="hidden" value="${procurementReceipt.status}" id="statusofGRN"  >
      									
      									</div>	<div class="form-group col-lg-1"></div>
      									</div>
      									<br>
										</c:when>
<%-- </c:choose>
</c:when>   --%>                                           <c:otherwise>
                                   
                                   	
                                   	<div class="row">
                                   	 <div class="col-lg-4"></div>
                                   	  <div class="form-group col-lg-4">
                                   	  	<label><spring:message code="procurement.receipt.ref.label" /></label>
                                        <input type="text" class="form-control" readonly="readonly" name="receipt_ref_num" id="receipt_ref_num" value="${procurementReceipt.goods_receipt_ref_num}" required />
                                   	  </div>
                                   	   <div class="col-lg-4"></div>
                                   	</div>
                                   	<div class="row">
                                   		<div class="form-group col-lg-4">
                                   			<label><spring:message code="supplier.name.label" /> <span style="color:red; font-size:2">*</span></label>
                                           <!--  <input type="text" class="form-control" readonly="readonly" name="supplier_name" id="supplier_name" required /> -->
                                        	<input type="text" class="form-control searchItems" style="height:30PX;border-radius: 6px !important;background:url(${pageContext.request.contextPath}/images/search.png) no-repeat;background-position:right;" name="supplier_name" id="searchSupplier" value="${procurementReceipt.supplier_name}" />
											<div class=services>
									    		<div class="items">
									     			<ul class="matchedStringUl supplier" style="width: 89%!important;padding: 0px!important;z-index: 15"></ul>
									   			</div>
											</div>								
											<span id="supplierNameError" style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
                                        </div>
                                     	<div class="form-group col-lg-4">
                                     		<label><spring:message code="supplier.code.label" /></label>
                                            <input type="text" class="form-control" readonly="readonly" name="supplier_id" id="supplier_Id" value="${procurementReceipt.supplier_id}"  />
                                        </div>
                                        <div class="form-group col-lg-4">
                                            <label><spring:message code="procurement.location.label" /></label>
                                            <select class="form-control"  id="warehouse_location">
					                            <c:forEach var="location" items="${workLocationsList}">
													<option value="${location.businessActivity}" ${location.locationId == procurementReceipt.location ? 'selected' : ''}>${location.locationId}</option>
												</c:forEach>
					                         </select>
					                          <input type="hidden" name="location" id="location" value="${procurementReceipt.location}" />
                                        </div>
									  </div>
                                      <div class="row">
                                        <div class="form-group col-lg-4">
                                            <label><spring:message code="delivered.by.label" /> <span style="color:red; font-size:2">*</span></label>
                                            <input type="text" class="form-control" name="delivered_by" id="delivered_by" required value="${procurementReceipt.delivered_by}" placeholder="<spring:message code="enter.delivered.by.label" />" />
                                            <span id="deliveredByError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
                                         </div>
                                         <div class="form-group col-lg-4">
                                            <label><spring:message code="inspected.by.label" /> <span style="color:red; font-size:2">*</span></label>
                                            <input type="text" class="form-control" name="inspected_by" id="inspected_by" required value="${procurementReceipt.inspected_by}" placeholder="<spring:message code="enter.inspected.by.label" />"  />
                                            <span id="inspectedByError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
                                         </div>
                                         <div class="form-group col-lg-4">
                                            <label><spring:message code="shipment.note.label" /></label>
                                            <input type="text" class="form-control searchItems" value="${procurementReceipt.shipment_note}" style="height:30PX;border-radius: 6px !important;background:url(${pageContext.request.contextPath}/images/search.png) no-repeat;background-position:right;" placeholder="<spring:message code="search.shipment.note.label" />"  id="searchShipmentNoteRefs" />
											<div class=services>
									    		<div class="items">
									     			<ul class="matchedStringUl searchShipmentNoteRefs" style="width: 89%!important;padding: 0px!important;z-index: 15"></ul>
									   			</div>
											</div>	
											<input type="hidden" name="shipment_note" id="shipment_note" value="${procurementReceipt.shipment_note}">
                                         </div>
                                         
                                        </div>
                                         <div class="row">
                                         <div class="form-group col-lg-4">
                                            <label><spring:message code="po.reference.label" /></label>
                                            <input type="text" class="form-control searchItems" value="${procurementReceipt.po_reference}" style="height:30PX;border-radius: 6px !important;background:url(${pageContext.request.contextPath}/images/search.png) no-repeat;background-position:right;" placeholder="<spring:message code="enter.po.reference.label" />"  id="po_reference" />
											<div class=services>
									    		<div class="items">
									     			<ul class="matchedStringUl poRef" style="width: 89%!important;z-index: 15;padding: 0px!important;"></ul>
									   			</div>
											</div>	
											<input type="hidden" id="selected_po_ref" name="po_reference" value="${procurementReceipt.po_reference}">
                                            <%-- <select class="form-control" name="po_reference" id="po_reference">
                                            <option value="PO123" ${'PO123' == procurementReceipt.po_reference ? 'selected' : ''}>PO123</option>
                                            <option value="PO345" ${'PO345' == procurementReceipt.po_reference ? 'selected' : ''}>PO345</option>
                                            <option value="PO678" ${'PO678' == procurementReceipt.po_reference ? 'selected' : ''}>PO678</option> 
                                            </select> --%>
                                      	</div>
                                      	
                                         <div class="form-group col-lg-4">
                                            <label><spring:message code="procurement.status.label" /></label>
                                             <select class="form-control" name="status" id="status">
                                            <option value="Received" ${'Received' == procurementReceipt.status ? 'selected' : ''}>Received</option>
                                            <option value="Rejected" ${'Rejected' == procurementReceipt.status ? 'selected' : ''}>Rejected</option>
                                            <option value="Partially Rejected" ${'Partially Rejected' == procurementReceipt.status ? 'selected' : ''}>Partially Rejected</option>
                                            <option value="Inspected" ${'Inspected' == procurementReceipt.status ? 'selected' : ''}>Inspected</option>
                                            <option value="Stored" ${'Stored' == procurementReceipt.status ? 'selected' : ''}>Stored</option>
                                            </select>
                                         </div>
                                         <div class="form-group col-lg-4">
                                            <label><spring:message code="date.label" /></label>
                                              <%-- <div class="input-group">
                                            <div class="input-group-addon">
                                                <i class="fa fa-calendar"></i>
                                            </div>
                                            <input class="form-control" readonly="readonly" style="background-color: white;" name="date" id="date" value="${procurementReceipt.date}" size="20" type="text" onfocus="callCalender('date')" onclick="callCalender('date')" placeholder="DD/MM/YYYY"/>
                                            <input type="text" name="date" id="date" required value="${procurementReceipt.date}" class="form-control" data-inputmask="'alias': 'dd/mm/yyyy'" data-mask/>
                                        </div>  --%>
                                            <input class="form-control calendar_icon" readonly="readonly" value="${procurementReceipt.date}"  style="background-color: white;" name="date" id="date" size="20" type="text" onfocus="callCalender('date')" onclick="callCalender('date')" placeholder="DD/MM/YYYY"/>
                                          <span id="dateError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>  
                                          <!--   <input type="text" readonly="readonly" class="form-control" name="date" id="date" /> -->
                                        </div>
                                         </div>
                                        </c:otherwise>
                                        </c:choose>
                                         <div class="row">
                                        <br>
                                          <div class="form-group col-lg-8 col-xs-8" style="text-align:center;  margin-bottom: 0.3%;">
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
										
										
						
						<div class="col-lg-1 col-xs-1 nopadding">
									<div class="fileUpload btn btn-primary browsebutton" style="width: 100%;">
			    			        <span style="font-size:14px;padding: 8px;">Attachment</span> &nbsp;&nbsp;
			    			         <input type="file" id="attachmentUpload" onchange="addNameToTextBox('attachmentUpload',this)" class="upload">
						             <input   type="hidden" name="docLinkId" id="attachmentUpload_refId" value="${agreementDocId.agreementDocId}"> 
						               <input   type="hidden" name="docLink" id="attachmentUploadFile" value="${agreementDoc.agreementDoc}"> 
						            
						            
						                </div>
								</div>
						
						
						
							<div class="col-lg-1 col-xs-1 nopadding">
								<div class="col-lg-6 col-xs-6 nopadding">
					<img style="width: 30px;height: 30px;margin-left: 5px;display: none" id="skuMasterImg1" src="${pageContext.request.contextPath}/images/circleWait.gif">
							</div>
								
							<c:if test="${procurementReceipt.docLink != null && procurementReceipt.docLink != ''}">
							
						<div class="col-lg-6 col-xs-6 nopadding">
                         <img src="${pageContext.request.contextPath}/images/downloadicon.png"
											alt="" style="max-width: 30px !important;float: right;cursor: pointer; margin-right: 15px;	pointer-events:all" id="GRNAttachmentDownload" onclick="downloadlogedit();" />
				<%-- 	<input   type="hidden" name="docLink" id="attachmentUploadFile" value="${procurementReceipt.docLink}">	 --%>		
				</div>
					</c:if>
                         </div>
                       
										
										
									
										
                                        </div>
                                        <c:choose>
                    <c:when test="${flowUnder == 'warehouse' || flowUnder == 'procurement'}">
                         <div class="table-responsive" style="overflow-x:auto;width:100%;min-height: 25px;max-height: 450px;">
                    <table id="productsList"  class="table table-bordered table-hover">
                      <thead style="background-color: #3c8dbc; color: #ffffff" class="stickyheader">
                        <tr>
                        	<th class="sticky-col first-col stickyheader" style="width: 60px;background-color: #a1dbf1 !important;"><div><spring:message code="sl.no.label" /></div></th>
                        	<th class="sticky-col second-col stickyheader"style="background-color: #a1dbf1 !important;" ><spring:message code="skuid.label"/></th>
                        	<th class="sticky-col third-col stickyheader"style="background-color: #a1dbf1 !important;"><spring:message code="ean.label"/></th>
                        	<th class="sticky-col fourth-col stickyheader"style="background-color: #a1dbf1 !important;"><spring:message code="hsnCode.label"/></th>
                        	<th class="sticky-col fifth-col stickyheader"style="background-color: #a1dbf1 !important;"><spring:message code="ScanCode.label"/></th>
                            <th class="sticky-col sixth-col stickyheader"style="background-color: #a1dbf1 !important;"><div style="width:80px"><spring:message code="item.desc.label"/></div></th>
                            <th style="width: 121px;"><spring:message code="batch.number.label" />
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
                            <!--added taxes columns by manasa  -->
                            <th><spring:message code="cgst.label"/></th>
                            <th><spring:message code="sgst.label"/></th>
                            <th><spring:message code="igst.label"/></th>
                            <th>CESS</th>
                           
                            <th><spring:message code="suppliedprice.label"/></th>
                            <th>Net Value</th>
                           <th>Storage Ref</th> 
                            <th><spring:message code="handled.by.label" /></th>
                            <th><spring:message code="action.label"/></th>
                        </tr>
                      </thead>
                      <tbody style="text-align: center;">
                                  <c:forEach var="item" items="${procurementReceipt.items}" varStatus="theCount">
             		                 <tr id="dynamicdiv${theCount.count}">
             		                           <td class="slno sticky-col first-col" style='background: #f9f9f9;'>${theCount.count}</td>
              									<td id="Name${theCount.count}"  class='sticky-col second-col' style='background: #f9f9f9;' >${item.skuId}</td>
              									<td id="ean${theCount.count}" class='sticky-col third-col' style='background: #f9f9f9;' >${item.ean}</td>
              									<input type="hidden" id="skuId${theCount.count}" value="${item.skuId}" />
              									<input type="hidden" id="sno${theCount.count}" value="${item.sno}" />
              									<input type="hidden" id="pluCode${theCount.count}" value="${item.pluCode}"/>
              									<input type="hidden" id="category${theCount.count}" value="${item.category}"/>
              									<input type="hidden" id="brandCode${theCount.count}" value="${item.brand}"/>
              									<input type="hidden" id="productRange${theCount.count}" value="${item.productRange}"/>
              									<input type="hidden" id="measureRange${theCount.count}" value="${item.measurementRange}"/>
              									<input type="hidden" id="color${theCount.count}" value="${item.color}"/>
              									<input type="hidden" id="size${theCount.count}" value="${item.size}"/>
              									<input type="hidden" id="utility${theCount.count}" value="${item.utility}"/>
              								   <input type='hidden' id="trackingRequired${theCount.count}" class="trackingRequired" value="${item.trackingRequired}"/>
              								    <input type='hidden' id='cgstTaxRate${theCount.count}' value="${item.cgstRate}"/>
              								   <input type='hidden' id='cessTaxRate${theCount.count}' value="${item.cessRate}"/>
              								     <input type='hidden' id='igsttaxRate${theCount.count}' value="${item.igstRate}"/>
              								     <input type='hidden' id='taxationlist${theCount.count}' value='${item.taxdetailsStr}'/>
              								       <input type='hidden' id='priceDuplicate${theCount.count}' value=''/>
              								       <input type='hidden' id='pricereal${theCount.count}' value='${item.originalSupplierPrice}'/>
              								        <input type='hidden' id='pricerealedit${theCount.count}' value=''/>
              								         <input type='hidden' id='saleprice${theCount.count}' value='${item.salePrice}'/>
              								   
              								   <td id="hsnCode${theCount.count}" class='sticky-col fourth-col' style='background: #f9f9f9;'>${item.hsnCode}</td>
                  							    <td id="itemScanCode${theCount.count}" class="itemScanCode sticky-col fifth-col" style='background: #f9f9f9;' contenteditable='true'>${item.itemScanCode}</td>
                  								
                                             	<td id="Desc${theCount.count}" class='sticky-col sixth-col' style='width:300px!important;background: #f9f9f9;'><div id="overflowtext"> <a href="#" data-toggle="tooltip"  title="${item.itemDesc}">${item.itemDesc}</a></div></td>    
                  								
<%--                   								<td    class='sticky-col sixth-col' id="Desc${theCount.count}"  style='width:300px!important;background: #f9f9f9;'>${item.itemDesc}</td>
 --%>                  								<td><textarea id="batchNum${theCount.count}" rows=1 style='resize:none;width: 87px;'>${item.bactchNum}</textarea></td>
                  								 <td><input class="form-control calendar_icon startDate" value="${item.expiryDateStr}" readonly="readonly" style="width:100px;background-color: white;" id="expiryDate${theCount.count}" onfocus="callCalender('expiryDate${theCount.count}')" onclick="callCalender('expiryDate${theCount.count}')" placeholder='DD/MM/YYYY' type="text"/></td>
                  								<c:choose>
                  								<c:when test="${item.trackingRequired == false}">
                  								<td  class='Pack' onBlur='changePack(this);' id="Pack${theCount.count}" onkeypress='return (this.innerText.length < 10)' contenteditable="true"> ${item.suppliedQty }</td>
                  							    </c:when>
                  							    <c:otherwise>
                  							   <td  class='Pack' onBlur='changePack(this);' id="Pack${theCount.count}" onkeypress='return (this.innerText.length < 10)'> ${item.suppliedQty }</td>
                  							   </c:otherwise>
                  							   </c:choose>
                  								<td>${item.measurementRange}</td>
                  								<td id="Make${theCount.count}" >${item.uom}</td>
                  								<td><input type="text" id="mrp${theCount.count}"  style="width:70px;text-align:center" value="${item.mrp}"></td>
                  								<td id="Requested${theCount.count}"  >${item.orderQty }</td>
                  								<td class='Price${theCount.count}' id="SPrice${theCount.count}" >${item.orderPrice}</td>
                  								<td><input type="text" id="discountpercentage${theCount.count}" onChange="changeSupplyPrice" onBlur="changeDiscPerc(this);" contenteditable="true" onkeypress='return (this.innerText.length < 10)' style="width:70px;text-align:center" value="${item.discount}"></td>
                  								<td><input type="text" id="discountAmt${theCount.count}" onBlur="changeDiscAmt(this);" contenteditable="true" onkeypress='return (this.innerText.length < 10)' style="width:70px;text-align:center" value="${item.discountAmt}"></td>
                  								<td><input type="text" id="freeqty${theCount.count}" onBlur="changeSupplyPrice(this);" contenteditable="true" onkeypress='return (this.innerText.length < 10)'  style="width:70px;text-align:center" value="${item.freeQty}"></td>
                  								<td id="tax${theCount.count}" onblur="changeGrnTax(this);" contenteditable="true" >${item.itemTax}</td>
                  								<td id="cgsttax${theCount.count}">${item.cgstValue}</td>
                  								<td id="sgsttax${theCount.count}">${item.sgstValue}</td>
                  								<td id="igsttax${theCount.count}">${item.igstValue}</td>
                  								<td id="cess${theCount.count}">${item.cessAmt}</td>
                  								
                  							   
                  							    <td  onBlur="changeSupplyPrice(this);" id="Price${theCount.count}" onkeypress='return (this.innerText.length < 10)' contenteditable="true" >${item.supplyPrice}</td>
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
                  								<td id="Del${theCount.count}" ><img id="Img${theCount.count}" src='${pageContext.request.contextPath}/images/itemdelete.png' style='width:32%;cursor:pointer;' onclick='deleteItem(this);' title='Delete ${item.skuId}'/>
                  								  <img id="Img${theCount.count}" src='${pageContext.request.contextPath}/images/bulewhiteplusicon.png' style='width:30%;cursor:pointer;margin-left: 10px;' onclick="addSkuwithplus('${theCount.count}');" title='Additem ${item.skuId}'/>
                  								
                  								</td>
                  	   				
                  	   </tr>
              		   </c:forEach> 
		 </tbody>
                   </table></div>
                    
                    </c:when>
                 <c:otherwise>
                                         <div class="table-responsive">
                                        <table id="productsList" class="table table-bordered table-hover">
                                          <thead style="background-color: #3c8dbc; color: #ffffff">
                                            <tr>
                                            	<th><div style=""><spring:message code="sl.no.label" /></div></th>
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
                  	   						<tr id=dynamicdiv${theCount.count}>
                  	   							<td class="slno">${theCount.count}</td>
              									<td id="Name${theCount.count}" >${item.item_code}</td>
              									<input type="hidden" id="skuId${theCount.count}" value="${item.skuId}" />
              									<input type="hidden" id="pluCode${theCount.count}" value="${item.pluCode}"/>
              				  
              				          <td id="Desc${theCount.count}"  ><div id="overflowtext"> <a href="#" data-toggle="tooltip"  title="${item.item_description}">${item.item_description}</a></div></td>    
              									
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
                                    </div></c:otherwise>
                                    </c:choose>
                                    
                                     <%--          <div class="row">
								<div class="col-lg-8"></div>
								<div class="form-group col-lg-3 labelgrn" style="text-align: right;"><label><spring:message code="total.GRN.value"/></label></div>
								<div class="form-group col-lg-1">
								<input type="text" readonly="readonly" class="form-control" id="totalCost" name="totalCost"  value="${procurementReceipt.totalGRNValue}" />
								</div>
								</div> --%>
                                      
                  <div class="col-lg-12 nopadding" style="margin-top: 10px;">
					<div class="col-lg-5"></div>
					<div class="col-lg-2 nopadding">
					<div class="form-group col-lg-7 " style="text-align: right;"><label><spring:message code="sub.total.label" /> </label></div>
					<div class="form-group col-lg-5 nopadding">
						<input type="text" class="form-control" id="subtotalCostgrn" name="subTotal" readonly="readonly" value="${procurementReceipt.subTotal}"/>
					</div></div>
					<div class="col-lg-2 nopadding">
					
					<div class="form-group col-lg-8" style="text-align: right;"><label style="font-family: Calibri;color: gray;">No Of Items</label></div>
						<div class="form-group col-lg-4 nopadding">
					
						<input type="number" class="form-control" id="noofitems" name="noofitems" readonly="readonly" value="0"/>
					</div>
					</div>
					<div class="col-lg-3 nopadding">
						<div class="form-group col-lg-8" style="text-align: right;"><label><spring:message code="shipping.cost.label" /> </label></div>
						<div class="form-group col-lg-4 nopadding">
						<input type="text" class="form-control" id="shipping_costgrn" name="shipmentCharges" value="${procurementReceipt.shipmentCharges}" />
						</div></div>
						<span id="shipCostError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
				</div>
                  <div class="col-lg-12 nopadding" >
						<div class="col-lg-5"></div>
					<div class="col-lg-2 nopadding">
						<div class="form-group col-lg-7 " style="text-align: right;"><label><spring:message code="taxes.label" /> </label></div>
						<div class="form-group col-lg-3 nopadding">
						<input type="text" class="form-control" readonly id="total_taxgrn" name="tax"  value="${procurementReceipt.tax}"  oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');"/>
						<span id="totalTaxError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
						</div>
						<div class="form-group col-lg-2 nopadding">
						<input type="text" class="form-control"  style="margin-left: 3px;" id="other_taxgrn" name="otherTaxAmt"  value="${procurementReceipt.otherTaxAmt}"  oninput="this.value = this.value.replace(/[^0-9]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');"/>
						<span id="totalTaxError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
						</div>
						
						</div>
						
						<div class="col-lg-2 nopadding">
					
					<div class="form-group col-lg-8 " style="text-align: right;"><label style="font-family: Calibri;color: gray;">Total Qty</label></div>
						<div class="form-group col-lg-4 nopadding">
					
						<input type="number" class="form-control" id="totalqty" readonly="readonly" name="totalqty" pattern= "[0-9]" value="0" />
						</div>
						</div>
						
						<div class="col-lg-3 nopadding">
						<div class="form-group col-lg-8 " style="text-align: right;"><label><spring:message code="discounts.label" /> </label></div>
						<div class="form-group col-lg-4 nopadding">
						<input type="text" class="form-control" id="discountgrn" name="totalDiscount" value="${procurementReceipt.totalDiscount}" />
						</div></div>
					</div>
					
					 <!-- <div class="col-lg-12 nopadding">
					<div class="col-lg-6"></div>
					
				
				
					
						
                         </div>  -->          
                                    <div class="col-lg-12 nopadding" style="margin-bottom: 10px;">
						<div class="col-lg-5"></div>
						<div class="col-lg-7 nopadding">
						<div class=" col-lg-1"></div>
						<div class=" col-lg-3" style="    font-size: 22px;    background-color: #f4f4f4;padding: 7px 0px; border-top: 1px solid #ccc;">&nbsp</div>
						<div class=" col-lg-8 nopadding"style="    background-color: #f4f4f4;padding: 7px 0px; border-top: 1px solid #ccc;">
						<div class=" col-lg-5 nopadding" style="font-size: 22px;"><label><spring:message code="cost.label" /> </label></div>
						<div class=" col-lg-3"></div>
						<div class=" col-lg-4" style="padding-right: 0px;padding-left: 7px;">
						<input type="text" style="background-color: #fff;" class="form-control" id="totalCost" name="totalCost" readonly="readonly" value="${procurementReceipt.totalCost}"/>
					</div></div></div>
					</div>
                                     <c:choose>
                                      
                                                        	
                            
                                      
                    <c:when test="${flowUnder == 'warehouse' || flowUnder == 'procurement'}">
                    </c:when>
                    <c:otherwise>
                                     <div class="row">
                                         <!-- <div class="col-lg-3"></div> -->
                                         <div class="form-group  col-lg-12">
                                         	<label><spring:message code="remarks.label" /></label>
                                            <textarea class="form-control" name="remarks" id="remarks" rows="2" style="resize: none;" placeholder="<spring:message code="enter.remarks.label" />" >${procurementReceipt.remarks}</textarea>
 										 </div>
                                        <!--  <div class="col-lg-3"></div> -->
                                        </div>
                                         <%-- <div class="row">
                       						<div class="col-lg-4"></div>
                       						<div class="col-lg-4">
                        					<div class="form-group col-lg-6" >
                           						<label><spring:message code="totalquantity.label"/>: </label>
                           						<label id="totalQty">${procurementReceipt.receipt_total_qty}</label>
                        					</div>
                         					<div class="form-group col-lg-6">
                             					<label><spring:message code="cost.label"/>: </label>
                             					<label id="totalCost">${procurementReceipt.grand_total}</label>
                         					</div>
                         				</div>
                         				<div class="col-lg-4"></div>
                     				  </div> --%>
                     				  <div class="row">
						<div class="col-lg-6"></div>
						<div class="form-group col-lg-3" style="text-align: right;"><label><spring:message code="totalquantity.label" /> </label></div>
						<div class="form-group col-lg-3">
							<input type="text" readonly="readonly" class="form-control" id="totalQty" name="totalQty"  value="${procurementReceipt.receipt_total_qty}" />
						</div>
					</div>
					<div class="row">
						<div class="col-lg-6"></div>
						<div class="form-group col-lg-3" style="text-align: right;"><label><spring:message code="cost.label" /> </label></div>
						<div class="form-group col-lg-3">
							<input type="text" readonly="readonly" class="form-control" id="totalCost" name="totalCost"  value="${procurementReceipt.grand_total}" />
						</div>
					</div></c:otherwise></c:choose>
                                      <input type="hidden" id="desc">
                                    </div><!-- /.box-body -->
						 <div class="row" style="text-align: center;">
						 <c:choose>
						 
						 <c:when test="${not empty procurementReceipt.nextActivities || not empty procurementReceipt.nextWorkFlowStates || procurementReceipt.status =='draft'}">
						 	<c:if test="${flowUnder == 'warehouse'}">
						 	<input type="button" class="btnCls" onclick="validateShipmentReceipt('edit')" value="<spring:message code="submit.label" />" />
						 	</c:if>
						 	<c:if test="${flowUnder == 'procurement'}">
						 	<input type="button" class="btnCls" onclick="validateShipmentReceipt('edit')" value="<spring:message code="submit.label" />" />
						 	</c:if>
						 	
						 	
						 	
						 	</c:when>
						 	
						 	
						 	
						 	</c:choose>
						 	<%-- <c:if test="${flowUnder == 'procurement' && operation=='draft'}">
						 	<input type="button" class="btnCls" onclick="validateShipmentReceipt('edit','submitted')" value="<spring:message code="submit.label" />" />
						 	</c:if><!--  --> --%>
						 	
						 	<c:if test="${sessionScope.role == 'super admin'}">
						 	<input type="button" class="btn bg-olive btn-inline" onclick="" style="margin-left:5%;width: 100px;" value="Print Labels" />
						 	
						 		<input type="button" class="btn bg-olive btn-inline" onclick="return searchShipmentReceipt('','searchShipmentReceipt','0');" style="margin-left:5%;" value="<spring:message code="cancel.label" />" />
			                </c:if>
			                <c:if test="${sessionScope.role != 'super admin'}">
		        			<c:if test="${flowUnder == 'procurement'}">
			        			<c:forEach var="accessControl" items="${sessionScope.procurement}">
		                           <c:if test="${accessControl.appDocument == 'ShipmentReceipts' && accessControl.read == true}">
									<input type="button" class="btnCls buttonMargin" onclick="" style="width: 100px;" value="Print Labels" />
									
										<input type="button" class="btnCls buttonMargin" onclick="return searchShipmentReceipt('','searchShipmentReceipt','0');" style="" value="<spring:message code="cancel.label" />" />
								  </c:if>
								</c:forEach>
		        			</c:if>
		        			<c:if test="${flowUnder == 'warehouse'}">
			        			<c:forEach var="accessControl" items="${sessionScope.warehouseStockmanagement}">
		                           <c:if test="${accessControl.appSubDocument == 'WarehouseGRN' && accessControl.read == true}">
									<input type="button" class="btnCls buttonMargin" onclick="" style="width: 100px;" value="Print Labels" />
		                           
										<input type="button" class="btnCls buttonMargin" onclick="return searchShipmentReceipt('','searchShipmentReceipt','0');" style="" value="<spring:message code="cancel.label" />" />
								  </c:if>
								</c:forEach>
		        			</c:if>
		        		</c:if>
						</div> 
				<br/>
                <div class="box-footer"></div>
               </form>
             </div>
           <%--   <input type="hidden" id="subCategories" value='${subCategories}'> --%> 
           
           
           
        <div class="modal fade" id="myModalIoss" role="dialog" tabindex="-1">
         <div class="modal-dialog iosmodeldialog">
    
     
    
      <!-- Modal content-->
      <div class="modal-content iospopupp">
        <div class="modal-header" >
       
          <button type="button" class="close" style="margin-top: -17px;margin-right: -9px;" onclick="" data-dismiss="modal">&times;</button>
        </div>
        <div class="modal-body">
       <div class="form-group col-lg-12" id="errmsg" style="padding: 0px;font-size: 15px">
       
          <!-- <div class="col-lg-1"> -->
         
        <!--  </div> -->
         </div>
        <div class="form-group col-lg-12"></div>
          <div class="col-lg-4 col-sm-6 col-xs-6" style=""></div>
          
         
         
          
          <div class="form-group col-lg-8 col-sm-6 col-xs-6" style="padding-left: 0px; padding-right: 0px;margin-left:50px">
												<div class="col-lg-6 col-sm-6 col-xs-6" style="padding-left: 5px; padding-right: 5px; display: inline-block; padding: 4px 10px 28px 10px; background: #3c8dbc; cursor: pointer; margin-top: 19.5px; height: 25px; text-align: center; margin-bottom: 19px; width: 45%; margin-left: -30px;">
								<c:choose>						
						<c:when test="${not empty procurementReceipt.nextActivities || not empty procurementReceipt.nextWorkFlowStates || procurementReceipt.status =='draft'}">
						 	<c:if test="${flowUnder == 'warehouse'}">
						<input type="button" class="iosclosebutton1" onclick="validateShipmentReceipt('edit');" value="OK">
						 	</c:if>
						 	<c:if test="${flowUnder == 'procurement'}">
						<input type="button" class="iosclosebutton1" onclick="validateShipmentReceipt('edit');" value="OK">
						 	</c:if>
						 	</c:when>
						 	</c:choose>
													
													
													
												</div>
												<div class="col-lg-6 col-sm-6 col-xs-6" style="padding-left: 5px; padding-right: 5px; display: inline-block; padding: 4px 10px 28px 10px; background: #3c8dbc; cursor: pointer; margin-top: 19.5px; height: 25px; text-align: center; margin-bottom: 19px; width: 45%; margin-left: 48px;">
													<input type="button" class="iosclosebutton1" onclick="flagset();"
														data-dismiss="modal" value="Cancel">
												</div>
											</div>



   <br/>
        </div>
        <br/>
        <div class="modal-footer" style="padding:0px;">
         <!--  <input type="button" class="iosclosebutton" data-dismiss="modal" value="Close"/> -->
        </div>
      </div>
      
		</div>
		</div>
           
           
           
           
           <div id="triggerEvent"></div>
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
                             <th><spring:message code="item.desc.label"/></th>
                             <th><spring:message code="price.label"/></th>
                                <th><spring:message code="product.range.label"/></th>
                              <th><spring:message code="grade.label"/></th>
                                <th><spring:message code="brand.label"/></th>
                             <th><spring:message code="color.label"/></th>
                                            <th><spring:message code="size.label"/></th>
                                            <th><spring:message code="ean.label"/></th>
                         </tr>
                       </thead>
                       <tbody style="text-align: center;">
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
</div>
</div>
</section><!-- /.content -->

 <script type="text/javascript">
           
         $("#handledBy").val($("#selectedEmployee").val());
        
       
    
        </script>



</body>
</html>