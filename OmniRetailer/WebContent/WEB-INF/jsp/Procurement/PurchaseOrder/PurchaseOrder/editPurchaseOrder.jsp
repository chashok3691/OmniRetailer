<!--/*
 * Project Name 	        : OmniRetailerCustomer
 * Written By		        : Mythri
 * file name		        : Inventory Manager/warehouse/procurement/editPurchaseOrder.jsp
 * file type		        : JSP
 * description				: The purchase order is displayed using this jsp and allows modify and save
 * */ -->


<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    <!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
	<title>Home | Omni Retailer</title>
	<meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>
	<script src="${pageContext.request.contextPath}/js/form_plugin.js"></script>
 	<script type="text/javascript" src="${pageContext.request.contextPath}/js/validation.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/controller.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/procurement/purchaseOrderAndReceipts.js"></script>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/jquery.calendars.picker.css">
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.calendars.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.calendars.plus.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.calendars.picker.js"></script>
	<%-- <script type="text/javascript" src="${pageContext.request.contextPath}/js/Csvreader/readcsv.js"></script> --%>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/excelReader/excelreader.js"></script>
<script type="text/javascript">

$(document).ready(function(){
if($('#orderDate').val() == ""){
	var dateTime = getCurrentDate();
	  var date = dateTime.split(' ');
	  date = date[0].split('/');
	  var formatedDate = date[1]+"/"+date[0]+"/"+date[2];
	  $('#orderDate').val(formatedDate);
}
		callCalender("orderDate");
		callCalender("deliveryDate");
		setLocationsDivContent();
		focusDiv('Error');
		
});
</script>
<style type="text/css">
  .p:first-child { 
   border-bottom: none !important;
    width:0% !important; 
    padding-left: 0px !important;
    padding-right: 0px !important;
}
.modal-dialog {
       width: auto;
    position: absolute;
    margin-top: 5%;
    margin-left: 20%;
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
.buttons {
	float: left;
	padding-top: 0px;
	margin-right: 2%;
	margin-top:1%;
}
a.button, .list a.button {
position:relative;
	text-decoration: none;
	color: #FFF;
	display: inline-block;
	padding: 5px 10px 5px 10px;
	/* border-radius: 5px; */
	box-shadow:1px 0px 2px #000;
	cursor:pointer;
	behavior : url(css/PIE.htc); 
	font-weight: normal; 
    background-color: rgb(128,128,128);
}
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
            <br/>
            <%-- <h3>${purchaseOrderBeanObj.PO_Ref}<spring:message code="po.details.label" /></h3> --%>
            
            <c:if test="${type == 'new'}">
             <h3><spring:message code="new.po.details.label" /></h3>
            </c:if>
            <c:if test="${type != 'new'}">
             <h3>${purchaseOrderBeanObj.PO_Ref} - <spring:message code="po.details.label" /></h3>
            </c:if>
            
            </div><!-- /.box-header -->
            <!-- form start -->
            <form id="viewProcurementReceipt" method="post" >
                <div class="box-body">
                <input type="hidden" id="operation" value="">
                <div class="row" style="text-align: right;">
                	<input type="hidden" id="type" value="${type}">
				 	<div id="Error" class="Error" style="text-align: center;color: red;font-size: 2;font-weight: bold;margin-bottom: 20px; margin-top: -20px">${err}</div>
	        		<div id="Success" class="Error" style="text-align: center;color: blue;font-size: 2;font-weight: bold;margin-bottom: 20px; margin-top: -20px">${success}</div>
	        		<c:if test="${type == 'new'}">
	        			<input type="button" id="edit" style="position: relative;margin-right:1%;" class="btnCls" onclick="validatePurchaseOrder('Submitted','new');" value="<spring:message code="submit.label" />" />
	        		</c:if>
	        		<c:if test="${type != 'new'}">
	        			<input type="button" id="edit" style="position: relative;margin-right:1%;" class="btnCls" onclick="validatePurchaseOrder('Submitted','edit');" value="<spring:message code="submit.label" />" />
	        		</c:if>
	        		
	        		<c:if test="${sessionScope.role == 'super admin'}">
						 <c:forEach var="activity" items="${purchaseOrderBeanObj.nextActivities}">
						 	<input type="button" style="margin-right:1%;width: 80px;position: relative;" class="btnCls" onclick="validatePurchaseOrder('${activity}','edit');" value="${activity}" />
						 </c:forEach>
					  </c:if>
				<%-- 	  <c:if test="${sessionScope.role != 'super admin'}">
							 <c:forEach var="activity" items="${purchaseOrderBeanObj.nextActivities}">
							 	<c:forEach var="accessControl" items="${sessionScope.procurementActivity}">
							 		<c:if test="${accessControl.appDocument == 'PurchaseOrder' && activity == accessControl.appDocumentActivity}">
									 	<input type="button" style="margin-right:1%;width: 80px;position: relative;" class="btn bg-olive btn-inline" onclick="validatePurchaseOrder('${activity}','edit');" value="${activity}" />
							 		</c:if>
			     				</c:forEach> 
							 </c:forEach>
				      </c:if> --%>
      			<c:if test="${sessionScope.role == 'super admin'}">
      				<input type="button" class="btnCls" style="margin-right:9px;" onclick="viewPurchaseOrder('all','outletPurchaseOrder','0');" value="<spring:message code="cancel.label" />" />
      			</c:if>
				<c:set var="rqstForQutation" value="false"/>
				<c:forEach var="accessControl" items="${sessionScope.procurement}">
                	<c:if test="${accessControl.appDocument == 'PurchaseOrder' && accessControl.read == true}">
                	<c:set var="rqstForQutation" value="true"/>
						<input type="button" class="btnCls" style="margin-right:9px;" onclick="viewPurchaseOrder('all','outletPurchaseOrder','0');" value="<spring:message code="cancel.label" />" />
					</c:if>
				</c:forEach>
				<c:if test="${rqstForQutation == false}"> 
					 <c:forEach var="accessControl" items="${sessionScope.warehouseStockmanagement}">
              <c:if test="${accessControl.appSubDocument == 'WarehousePurchaseOrders' && accessControl.write == true}">  
            <input type="button" class="btnCls" style="margin-right:9px;" onclick="viewPurchaseOrder('warehouse','warehousePurchaseOrder','0');" value="<spring:message code="cancel.label" />" />
              </c:if>
              </c:forEach></c:if>
				
              
				
					<hr style="margin-top: 4px;width: 99%;" />
				</div>
                 
               	<div class="row">
               		<div class="form-group col-lg-2">
                        <label><spring:message code="order_date.label" /> <span style="color:red; font-size:2">*</span></label>
                        <input type="hidden" name="pO_Ref" id="pO_Ref" value="${purchaseOrderBeanObj.PO_Ref}">
						<input class="form-control calendar_icon" readonly="readonly" style="background-color: white;" name="order_date" id="orderDate" value="${purchaseOrderBeanObj.ordereDate}" size="20" type="text" onfocus="callCalender('orderDate')" onclick="callCalender('orderDate')" placeholder="DD/MM/YYYY"/>
                     	<span id="orderDateError" style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>    
                    </div>
                    <div class="form-group col-lg-1"></div>
                 	<div class="form-group col-lg-2">
                        <label><spring:message code="delivery_date.label" /> <span style="color:red; font-size:2">*</span></label>
						<input class="form-control calendar_icon" readonly="readonly" style="background-color: white;" name="delivery_due_date" id="deliveryDate" size="20" type="text" value="${purchaseOrderBeanObj.deliveryDate}" onfocus="callCalender('deliveryDate')" onclick="callCalender('deliveryDate')" placeholder="DD/MM/YYYY"/>
						<span id="deliveryDateError" style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
                    </div>
                    <div class="form-group col-lg-1"></div>
                    <div class="form-group col-lg-2">
                        <label><spring:message code="order.submitted.by.label" /> <span style="color:red; font-size:2">*</span></label>
                        <input type="text" class="form-control" name="order_submitted_by" id="order_submitted_by" value="${purchaseOrderBeanObj.order_submitted_by}" required />
                        <span id="orderSubmittedByError" style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
                    </div>
                     <div class="form-group col-lg-1"></div>
                    <div class="form-group col-lg-2">
                        <label><spring:message code="order.approved.by.label" /></label>
                        <input type="text" class="form-control" name="order_approved_by" id="order_approved_by" value="${purchaseOrderBeanObj.order_approved_by}" required />
                        <span id="orderApprovedByError" style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
                     </div>
                      <div class="form-group col-lg-1"></div>
				</div>
                <div class="row">
                	 <div class="form-group col-lg-2">
                        <label><spring:message code="location.label" /></label>
						<select class="form-control" id="warehouseLocation" >
                         <c:forEach var="location" items="${locationBeanList}">
							<option value="${location.businessActivity}" ${location.locationId == purchaseOrderBeanObj.warehouse_location ? 'selected' : ''}>${location.locationId}</option>
						 </c:forEach>
					   </select>
                       	<input type="hidden" name="storeLocation" id="storeLocation" value="${purchaseOrderBeanObj.warehouse_location}" />
                       	<input type="hidden" id="warehouse_location" value="${purchaseOrderBeanObj.warehouse_location}">
                     </div>
                      <div class="form-group col-lg-1"></div>
                     <div class="form-group col-lg-2" style="padding-right: 0px">
						<label><spring:message code="quote.ref.label" /> </label>
						<input type="text" class="form-control searchItems" value="${purchaseOrderBeanObj.quoteRef}" style="height:30PX;;background:url(${pageContext.request.contextPath}/images/search.png) no-repeat;background-position:right;" id="quoteRef" placeholder="<spring:message code="quote.ref.label" />" />
						<div class=services>
					    		<div class="items">
					     			<ul class="matchedStringUl quoteRef" style="width: 89%!important;padding: 0px!important;"></ul>
					   			</div>
							</div>
						<!-- <span id="supplierNameError" style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span> -->
						<input type="hidden" name="quoteRef" id="quoteReference" value="${purchaseOrderBeanObj.quoteRef}"  />
					</div> <div class="form-group col-lg-1"></div>
                     <div class="form-group col-lg-2" style="padding-right: 0px">
                        <label><spring:message code="supplier.name.label" /> <span style="color:red; font-size:2">*</span></label>
                        <input type="text"  class="form-control searchItems" placeholder="<spring:message code="search.supplier.label" />"  style="height:30PX;background:url(${pageContext.request.contextPath}/images/search.png) no-repeat;background-position:right;" name="supplier_name" id="searchSupplier" value="${purchaseOrderBeanObj.supplier_name}" />
						<div class="services">
				    		<div class="items">
				     			<ul class="matchedStringUl supplier" style="width: 89%!important;padding: 0px!important;"></ul>
				   			</div>
						</div>
						<span id="supplierNameError" style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
                     </div> <div class="form-group col-lg-1"></div>
                      <input type="hidden" class="form-control" name="supplier_Id" id="supplier_Id" readonly="readonly" value="${purchaseOrderBeanObj.supplier_Id}"/>
                     <%-- <div class="form-group col-lg-3">
                        <label><spring:message code="supplier.contact.name.label" /> <span style="color:red; font-size:2">*</span></label>
                        <input type="text" class="form-control" name="supplier_contact_name" id="supplier_contact_name" value="${purchaseOrderBeanObj.supplier_contact_name}" required />
                     </div> --%>
                     <div class="form-group col-lg-2">
                       <label><spring:message code="shipment_mode.label" /></label>
                     	<select class="form-control" name="shipping_mode" id="shipping_mode">
                           <option value="Rail" ${'Rail' == purchaseOrderBeanObj.shipping_mode ? 'selected' : ''}>Rail</option>
                           <option value="Flight" ${'Flight' == purchaseOrderBeanObj.shipping_mode ? 'selected' : ''}>Flight</option>
                           <option value="Express" ${'Express' == purchaseOrderBeanObj.shipping_mode ? 'selected' : ''}>Express</option>
                           <option value="Ordinary" ${'Ordinary' == purchaseOrderBeanObj.shipping_mode ? 'selected' : ''}>Ordinary</option>
                        </select>
                     </div>
                     <div class="form-group col-lg-1"></div>
              	</div><br>
              		<%-- <div class="row">
      									<div class="col-lg-9">
      									 <c:if test="${type == 'new'}">
            						</c:if>
           							 <c:if test="${type != 'new'}">
            						<div class="col-lg-1" style="padding-left: 0px;padding-top: 17px;">
      									<img alt="" style="height:30px" src="${pageContext.request.contextPath}/images/workflow_arrow.png">
      									</div>
           									 </c:if>
      									
      									<div class="col-lg-9" style="padding-left: 0px;    padding-top: 13px;">
      									  <c:forEach var="previousWorkFlowList" items="${purchaseOrderBeanObj.previousStates}">
      									  <div class="p" style="padding-left: 15px;padding-right:15px;padding-top: 25px;border-bottom: 1px solid #ccc;width:10%;display:inline-block;"></div>
                                             <span class=" border" style="padding-left: 0px;padding-top: 17px;font-size: 16px;">${previousWorkFlowList}
      									
      									</span>
      									
                                             </c:forEach></div>
      									</div>
      									<div class="col-lg-3">
      									 <input type="hidden" value="${purchaseOrderBeanObj.status}" id="defaultstatus">
      									<c:choose>
      									<c:when test="${not empty purchaseOrderBeanObj.nextActivities}">
      									<label><spring:message code="actionrecquired.label" /></label>
                                             <select class="form-control" name="shipped_from" id="statusissue">
                                             <option value="">Action Required</option>
                                               <c:forEach var="activity" items="${purchaseOrderBeanObj.nextActivities}">
                                              <option value="${activity}">${activity}</option>
                                             </c:forEach>
                                              <c:forEach var="nextWorkFlowStates" items="${purchaseOrderBeanObj.nextWorkFlowStates}">
                                              <option value="${nextWorkFlowStates}">${nextWorkFlowStates}</option>
                                             </c:forEach>
                                           </select>
      									</c:when>
      									<c:when test="${not empty purchaseOrderBeanObj.nextWorkFlowStates}">
      									<label><spring:message code="actionrecquired.label" /></label>
                                           
                                             <select class="form-control" name="shipped_from" id="statusissue">
                                             <option value="">Action Required</option>
                                               <c:forEach var="activity" items="${purchaseOrderBeanObj.nextActivities}">
                                              <option value="${activity}">${activity}</option>
                                             </c:forEach>
                                              <c:forEach var="nextWorkFlowStates" items="${purchaseOrderBeanObj.nextWorkFlowStates}">
                                              <option value="${nextWorkFlowStates}">${nextWorkFlowStates}</option>
                                             </c:forEach>
                                           </select>
      									</c:when>
      									<c:otherwise>
      									 <input type="hidden" value="nostatus" id="nostatus">
      									</c:otherwise>
      									</c:choose>
      									
      									
      									
      									</div>
      									</div> --%>
      									 <c:if test="${type != 'new'}">
              			<div class="col-lg-12" style="background: #eee;padding: 10px 0px 10px 0px;">
      									<div class="col-lg-9">
      									
      									<div class="col-lg-9" style="padding-left: 0px;    padding-top: 5px;">
      									  <c:forEach var="previousWorkFlowList" items="${purchaseOrderBeanObj.previousStates}">
      									  <div class="p" style="display:inline-block;"></div>
                                             <span class=" border" style="padding-left: 0px;padding-top: 17px;font-size: 16px;"><img alt="" style="height:30px" src="${pageContext.request.contextPath}/images/workflow_arrow.png">${previousWorkFlowList}
      									
      									</span>
      									
                                             </c:forEach></div>
      									</div>
      									<div class="col-lg-2" style="padding-right: 0px;">
      									<div class="col-lg-12" style="padding-right: 0px;padding-left: 5px;">
      									 <input type="hidden" value="${purchaseOrderBeanObj.status}" id="defaultstatus">
      									<c:choose>
      									<c:when test="${not empty purchaseOrderBeanObj.nextWorkFlowStates}">
      									<label><spring:message code="actionrecquired.label" /></label>
                                            <input type="hidden" value="${stockRequestsObj.status}" id="defaultstatus">
                                             <select class="form-control" name="shipped_from" id="statusissue">
                                             <option value="">Action Required</option>
                                               <c:forEach var="activity" items="${purchaseOrderBeanObj.nextWorkFlowStates}">
                                              <option value="${activity}">${activity}</option>
                                             </c:forEach>
                                              <c:forEach var="nextWorkFlowStates" items="${purchaseOrderBeanObj.nextActivities}">
                                              <option value="${nextWorkFlowStates}">${nextWorkFlowStates}</option>
                                             </c:forEach>
                                           </select>
      									</c:when>
      									<c:when test="${not empty purchaseOrderBeanObj.nextActivities}">
      									<label><spring:message code="actionrecquired.label" /></label>
                                           
                                             <select class="form-control" name="shipped_from" id="statusissue">
                                             <option value="">Action Required</option>
                                               <c:forEach var="activity" items="${purchaseOrderBeanObj.nextActivities}">
                                              <option value="${activity}">${activity}</option>
                                             </c:forEach>
                                              <c:forEach var="nextWorkFlowStates" items="${purchaseOrderBeanObj.nextWorkFlowStates}">
                                              <option value="${nextWorkFlowStates}">${nextWorkFlowStates}</option>
                                             </c:forEach>
                                           </select>
      									</c:when>
      									<c:otherwise>
      									 <input type="hidden" value="nostatus" id="nostatus">
      									</c:otherwise>
      									</c:choose>
      									
      									</div>
      									
      									</div>
      									<div class="col-lg-1"></div>
      									</div></c:if>
					<div class="row">
						<br>
						 <div class="form-group col-lg-8" style="text-align:center;  margin-bottom: 0.3%;    margin-top: 1.5%;">
							<input type="text"  class="form-control searchItems" id="searchItems"  placeholder="<spring:message code="search.items.here.label" />"  style="height:30PX;text-align:left;background:url(${pageContext.request.contextPath}/images/search.png) no-repeat;background-position:right;" />
								<!-- <datalist id="skuList"></datalist> -->
								<div class="services">
						    		<div class="items">
						     			<ul class="matchedStringUl apparel" style=""></ul>
						   			</div>
								</div>
						</div>
						
						
<div class="col-lg-3" style="margin-top: 14px;">
						<input type="file" class="btn bg-olive btn-inline" accept=".xlsx" id="fileUploadCSV" onchange="addNameToTextBox('fileUploadCSV')"/>
						</div>
						<div class="col-lg-1" style="margin-top: 14px;">
    					<input type="button" class="btn bg-olive btn-inline" value="Upload" id="btnUpload"  onclick="importExcelData(this)" />
    					<!-- <input id="skuMasterFile" class="form-control" placeholder="Choose File" disabled="disabled"> -->
						</div>	
						</div>
                    <div class="table-responsive" style="overflow-x:auto;width:100%">
                    <table id="productsList" class="table table-bordered table-hover">
                      <thead style="background-color: #3c8dbc; color: #ffffff">
                        <tr>
                        	<th><div><spring:message code="sl.no.label" /></div></th>
                        	<th><spring:message code="item.code.label"/></th>
                        	<th><spring:message code="ean.label"/></th>
                        	<th><spring:message code="hsnCode.label"/></th>
                            <th><spring:message code="item.desc.label"/></th>
                            <th><spring:message code="price.label"/></th>
                            <th><spring:message code="pack.label"/></th>
                             <th><spring:message code="tax.label"/>%</th>
                             <!--added taxes  by manasa  -->
                            <th><spring:message code="cgst.label"/></th>
                            <th><spring:message code="sgst.label"/></th>
                            <th><spring:message code="igst.label"/></th>
                            <th><spring:message code="cost"/></th>
                            <th><spring:message code="uom.label"/></th>
                            <th><spring:message code="available.qty.label"/></th>
                            <th><spring:message code="colour.label"/></th>
                            <th><spring:message code="size.label"/></th>
                            <th><spring:message code="action.label"/></th>
                        </tr>
                      </thead>
                      <tbody style="text-align: center;" id="tbodyLeads">
	                       <c:forEach var="item" items="${purchaseOrderBeanObj.purchaseItems}" varStatus="theCount">
		             		   <tr id="dynamicdiv${theCount.count}">
		             		   		<td class="slno">${theCount.count}</td>
			              			<td id="itemId${theCount.count}">${item.skuId}</td>
			              			<td id="ean${theCount.count}">${item.ean}</td>
			              			<td id="hsnCode${theCount.count}">${item.hsnCode}</td>
			              			    <input type="hidden" id="requestedQty${theCount.count}" value="${item.requestedQty}" />
			              			    <input type="hidden" id="skuId${theCount.count}" value="${item.skuId}" />
			              			    <input type="hidden" id="pluCode${theCount.count}" value="${item.itemId}"/>
			              				<input type="hidden" id="category${theCount.count}" value="${item.category}"/>
			              				<input type="hidden" id="eanExcel${theCount.count}" value="${item.ean}"/>
              							<input type="hidden" id="brandCode${theCount.count}" value="${item.brand}"/>
              							<input type="hidden" id="productRange${theCount.count}" value="${item.productRange}"/>
              						     <input type="hidden" id="measureRange${theCount.count}" value="${item.measurementRange}"/>
              							<input type="hidden" id="utility${theCount.count}" value="${item.utility}"/>
              							<input type='hidden' id="taxRate${theCount.count}" value="${item.cgstRate}"/>
		                             	<input type='hidden' id="taxValue${theCount.count}" value="${item.cgstValue}"/>
              							
              							<%-- <input type="hidden" id="colour${theCount.count}" value="${item.color}"/>
              						<input type="hidden" id="sizeExcel${theCount.count}" value="${item.size}"/> --%>
			                  		<td id="itemDesc${theCount.count}">${item.itemDesc}</td>
			                  		<fmt:formatNumber var="itemPrice" type="number" minFractionDigits="2" maxFractionDigits="2" value="${item.itemPrice}" />
			                  		<td id="itemPrice${theCount.count}" contenteditable="true" onBlur='changeOrderedPrice(this);' class="Price">${itemPrice}</td>
			                  		<td id="quantity${theCount.count}" contenteditable="true"  onBlur='changeOrderedPack(this);' onkeypress='return (this.innerText.length < 10)'  class="Pack">${item.quantity }</td>
			                  		<td id="tax${theCount.count}" contenteditable="true"  onBlur='changeTax(this);'>${item.tax}</td>
			                  		<!--added taxes  by manasa  -->
			                  		<td id="cgsttax${theCount.count}">${item.cgstRate}</td>
                  				    <td id="sgsttax${theCount.count}">${item.sgstRate}</td>
                  				    <td id="igsttax${theCount.count}">${item.igstRate}</td>
                  				    
			                  		<td id="totalCost${theCount.count}" class="cost" >${item.totalCost}</td>
			                  		<td id="make${theCount.count}">${item.uom}</td>
			                  		<td id="model${theCount.count}">${item.availableQty }</td>
			                  		<td id="color${theCount.count}">${item.color}</td>
			                  		<td id="size${theCount.count}">${item.size}</td>
			                  		<td id="Del${theCount.count}"><img id="Img${theCount.count}" src="${pageContext.request.contextPath}/images/itemdelete.png" style="width:12%;cursor:pointer;" onclick="deleteItemDetails(this);" title="Delete"/></td>
		                  	   </tr>
	              		   </c:forEach> 
		 			</tbody>
                   </table>
                </div>
                  <br>
                     <div class="col-lg-12 nopadding">
					<div class="col-lg-6"></div>
					<div class="col-lg-3 nopadding">
					<div class="form-group col-lg-7 " style="text-align: right;"><label><spring:message code="sub.total.label" /> </label></div>
					<div class="form-group col-lg-5 nopadding">
					 <c:forEach var="summaryList" items="${purchaseOrderBeanObj.purchaseItems}" varStatus="thecount">
				<c:set var="qtyissued" value="${qtyissued+((summaryList.quantity)*(summaryList.itemPrice))}" scope="page" />
				</c:forEach>
						<input type="text" class="form-control" id="subtotalCost" name="products_cost" readonly="readonly" value="${purchaseOrderBeanObj.products_cost}"/>
					</div></div>
					<div class="col-lg-3 nopadding">
						<div class="form-group col-lg-7 " style="text-align: right;"><label><spring:message code="shipping.cost.label" /><span style="color:red; font-size:2">*</span> </label></div>
						<div class="form-group col-lg-5 nopadding">
						<input type="text" class="form-control" id="shipping_cost" name="shipping_cost" value="${purchaseOrderBeanObj.shipping_cost}"  oninput="this.value = this.value.replace(/[^0-9]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');"/>
						</div></div>
						<span id="shipCostError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
				</div>
                  <div class="col-lg-12 nopadding">
                  <input type="hidden" name="itemDetails" id="whPurchaseItems">
                   <input type="hidden" name="cgstAmt" id="cgstAmt" value="${purchaseOrderBeanObj.cgstAmt}">
                  <input type="hidden" name="deliveryLocations" id="deliveryLocations">
					 <input type="hidden" class="form-control" readonly="readonly" name="status" id="orderStatus"  value="${purchaseOrderBeanObj.status}"/> 
						<div class="col-lg-6"></div>
					<div class="col-lg-3 nopadding">
						<div class="form-group col-lg-7 " style="text-align: right;"><label><spring:message code="taxes.label" /> </label></div>
						<div class="form-group col-lg-3 nopadding">
						<input type="text" class="form-control" readonly id="total_tax" name="total_tax"  value="${purchaseOrderBeanObj.total_tax}"  oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');"/>
						<span id="totalTaxError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
						</div>
						
						<div class="form-group col-lg-2 nopadding">
						<input type="text" class="form-control"  style="margin-left: 3px;" id="otherTaxAmt" name="otherTaxAmt"  placeholder="otherTaxes" value="${purchaseOrderBeanObj.otherTaxAmt}"  oninput="this.value = this.value.replace(/[^0-9]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');"/>
						<span id="totalTaxError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
						</div>
						
						</div>
						<div class="col-lg-3 nopadding">
						<div class="form-group col-lg-7 " style="text-align: right;"><label><spring:message code="total.discounts.label" /> </label></div>
						<div class="form-group col-lg-5 nopadding">
						<input type="text" class="form-control" id="discount" name="shipping_cost" value="${purchaseOrderBeanObj.discount}"  oninput="this.value = this.value.replace(/[^0-9]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');"/>
						</div></div>
						<span id="shipCostError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
					
					
					<div class="row">
						<div class="col-lg-8"></div>
							</div>
					</div>
					<div class="col-lg-12 nopadding">
						<div class="col-lg-6"></div>
						<div class="col-lg-6 nopadding">
						<div class=" col-lg-2"></div>
						<div class=" col-lg-2" style="    font-size: 22px;    background-color: #f4f4f4;padding: 7px 0px; border-top: 1px solid #ccc;">&nbsp</div>
						<div class=" col-lg-8 nopadding"style="    background-color: #f4f4f4;padding: 7px 0px; border-top: 1px solid #ccc;">
						<div class=" col-lg-5 nopadding" style="font-size: 22px;"><label><spring:message code="cost.label" /> </label></div>
						<div class=" col-lg-3"></div>
						<div class=" col-lg-4" style="padding-right: 0px;padding-left: 7px;">
						 <c:forEach var="summaryList" items="${purchaseOrderBeanObj.purchaseItems}" varStatus="thecount">
				<c:set var="qty" value="${qty+((summaryList.quantity)*(summaryList.itemPrice))}" scope="page" />
				</c:forEach>
						<input type="text" style="background-color: #fff;" class="form-control" id="totalCost" name="total_po_value" readonly="readonly" value="${purchaseOrderBeanObj.total_po_value}"/>
					</div></div></div>
					</div>
					<div class="" style="margin-top: 8px;cursor: pointer;margin-bottom: 0px;" ><span style="font-weight: bold;font-size: 16px;color:#666;cursor: pointer;"><spring:message code="delivery.locations.label" /></span></div>
        <hr style="border-top: 1px solid rgb(181,230,29);margin-top: 0px;">
        <div class="row">
        	<div class="form-group col-lg-7" id="locationAddError" style="text-align: center;color: red;font-size: 2;font-weight: bold;"></div>
			<div class="form-group col-lg-3">
				<label><spring:message code="location.label" /></label>
				<select class="form-control" id="deliveryLocation" >
					<c:forEach var="location" items="${workLocationsList}">
						<option value="${location}" ${location == selectedLocation ? 'selected' : ''}>${location}</option>
					</c:forEach>
				</select>
			</div>
			<div class="form-group col-lg-2" style="padding-top: 15px;">
				<div class="buttons" style="">
					<a onclick="appendLocationsDiv()" class="button"><font size="2px"><spring:message code="addnew.label" /></font></a>
				</div>
			</div>
		</div>
		<div id="locations" style="display: none;">
			<div class="row-fluid-5 locationRow" id="locations0">
				<div class="form-group span2" >
					<label><spring:message code="location.label" /> <span style="color:red; font-size:2">*</span></label> 
					<input type="text" readonly="readonly" class="form-control addedLocation" id="location0" />
				</div>
				<div class="form-group span2" >
					<label><spring:message code="shipment_street.label" /> <span style="color:red; font-size:2">*</span></label>
					<input type="text" readonly="readonly"  class="form-control" id="street0" />
				</div>
				<div class="form-group span2" >
					<label><spring:message code="area.label" /> <span style="color:red; font-size:2">*</span></label>
					<input type="text" readonly="readonly"  class="form-control" id="area0"  />
				</div>
				<div class="form-group span2" >
					<label><spring:message code="shipment_city.label" /> <span style="color:red; font-size:2">*</span></label> 
					<input type="text" readonly="readonly" class="form-control" id="city0" />
				</div>
				<div class="form-group span2" style="padding-top: 15px;">
					<div class="buttons" style="">
						<a onclick="showPopUp(this);" id="popup0" class="button" style="width:110px;text-align: center;"><font size="2px"><spring:message code="shipments.label" /></font></a>
					</div>
					<span style="width: 60px;margin-left: 15px;">
						<img id="img0" src="${pageContext.request.contextPath}/images/itemdelete1.png" style="width: 24px;cursor: pointer;padding-top: 5px;" onclick="deleteDiv(this)">
					</span>
				</div>
				<div id="relatedItemsDiv0" style="display: none;"><table id="relatedItemsTable0"><tbody></tbody></table></div>
			</div>
		</div>
		<div class="locationsAdded">
			 <c:forEach var="item" items="${purchaseOrderBeanObj.selectedLocationList}" varStatus="theCount">
			 	<div class="row-fluid-5 locationRow" id="locations${theCount.count}">
				<div class="form-group span2" >
					<label><spring:message code="location.label" /> <span style="color:red; font-size:2">*</span></label> 
					<input type="text" readonly="readonly" value="${item.locationId}" class="form-control addedLocation" id="location${theCount.count}" />
				</div>
				<div class="form-group span2" >
					<label><spring:message code="shipment_street.label" /> <span style="color:red; font-size:2">*</span></label>
					<input type="text" readonly="readonly" value="${item.address}" class="form-control" id="street${theCount.count}" />
				</div>
				<div class="form-group span2" >
					<label><spring:message code="area.label" /> <span style="color:red; font-size:2">*</span></label>
					<input type="text" readonly="readonly" value="${item.area}" class="form-control" id="area${theCount.count}"  />
				</div>
				<div class="form-group span2" >
					<label><spring:message code="shipment_city.label" /> <span style="color:red; font-size:2">*</span></label> 
					<input type="text" readonly="readonly" value="${item.city}" class="form-control" id="city${theCount.count}" />
				</div>
				<div class="form-group span2" style="padding-top: 15px;">
					<div class="buttons" style="">
						<a onclick="showPopUp(this);" id="popup${theCount.count}" class="button" style="width:110px;text-align: center;"><font size="2px"><spring:message code="shipments.label" /></font></a>
					</div>
					<span style="width: 60px;margin-left: 15px;">
						<img id="img${theCount.count}" src="${pageContext.request.contextPath}/images/itemdelete1.png" style="width: 24px;cursor: pointer;padding-top: 5px;" onclick="deleteDiv(this)">
					</span>
				</div>
				<div id="relatedItemsDiv${theCount.count}" style="display: none;"><table id="relatedItemsTable${theCount.count}"><tbody>
					<c:set var="poCount" value="1"></c:set>
					 <c:forEach var="poLoc" items="${purchaseOrderBeanObj.shipmentLocations}" >
						 <c:if test="${item.locationId == poLoc.storeLocation}">
								<tr id="selected_${poCount}" style='margin-top:5px;'>
									<td class="selecetedSlno_">${poCount}</td>
									<td id="selectedItemId_${poCount}">${poLoc.skuId}</td>
									<input type='hidden' id='selectedSkuId_${poCount}' value="${poLoc.skuId}" />
									<input type='hidden' id='selectedPluCode_${poCount}' value="${poLoc.pluCode}" />
									<td id='selectedItemDesc_${poCount}'>${poLoc.skuName}</td>
									<td id='selectedItemPrice_${poCount}'>${poLoc.skuPrice}</td>
									<td id='selectedQuantity_${poCount}' class='selectedPack ${poLoc.pluCode}' onBlur='changeSelectedPack(this);' onkeypress='return (this.innerText.length < 10)' contenteditable='true'>${poLoc.quantity}</td>
									<td class='selectedCost' id='selectedTotalCost_${poCount}'>${poLoc.totalCost}</td>
									<td id='selectedDel_${poCount}' ><img id='selectedImg_${poCount}' src="${pageContext.request.contextPath}/images/itemdelete.png" style='width:15%;cursor:pointer;' onclick='deleteSelectedItemDetails(this);' title='Delete ${poLoc.skuId}'/></td>
									<c:set var="poCount" value="${poCount + 1}" />
								</tr>
						 </c:if>
					</c:forEach>
				</tbody></table></div>
			</div>
			 </c:forEach>
		</div>
		<br>
				<div class="row">
                     <div class="form-group col-lg-6">
                        <label><spring:message code="credit.terms.label" /></label>
                        <textarea class="form-control" name="credit_terms" style="resize: none;" id="credit_terms" required >${purchaseOrderBeanObj.credit_terms}</textarea>
                    </div>
                
                     <div class="form-group col-lg-6">
                        <label><spring:message code="payment.terms.label" /></label>
                        <textarea class="form-control" style="resize: none;" id="payment_terms" name="payment_terms">${purchaseOrderBeanObj.payment_terms}</textarea>
                    </div>
                 </div>
                    <div class="row">
						<div class="form-group col-lg-6">
							<label><spring:message code="shipping.terms.label" /></label>
							<textarea  class="form-control" name="shipping_terms" id="shipping_terms" style="resize: none;" >${purchaseOrderBeanObj.shipping_terms}</textarea>
						</div>
					
						<div class="form-group col-lg-6">
							<label><spring:message code="remarks.label" /></label>
							<textarea  class="form-control" name="remarks" id="remarks" style="resize: none;" >${purchaseOrderBeanObj.remarks}</textarea>
						</div>
					</div>
					<!-- COMPOSE MESSAGE MODAL -->
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
                                <%-- <th><spring:message code="pattern.label"/></th> --%>
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
 <input type="button" class="iosclosebutton1"  onclick="getItemPrice(this);"  value="Ok">
</div>
<div class="col-lg-6 col-sm-6 col-xs-6" style="padding-left: 5px; padding-right: 5px;">
  <input type="button" class="iosclosebutton1" data-dismiss="modal" value="Cancel">
</div></div>
              </div>
             </form> 
         </div><!-- /.modal-content -->
     </div><!-- /.modal-dialog -->
 </div><!-- /.modal -->
 
 <div class="modal fade popup-display" id="selected-items-modal" tabindex="-1" role="dialog" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content" style="width: 125%;">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        <%-- <h4 class="modal-title" style="text-align: center;"><spring:message code="select.products.label" /></h4> --%>
                    </div>
             <form action="#" method="post">
                 <div class="modal-body">
                  <div class="box-body table-responsive">
                  	<input type='hidden' id='selectedLocationId' >
                     <table id="selectedItemsList" class="table table-bordered table-hover">
                       <thead style="background-color: #3c8dbc; color: #ffffff">
                         <tr>
                             <th><div style="width:45px;"><spring:message code="sl.no.label" /></div></th>
							 <th><spring:message code="item.name.label" /></th>
							 <th><spring:message code="item.desc.label" /></th>
							 <th><spring:message code="price.label" /></th>
							 <th><spring:message code="pack.label" /></th>
							 <th><spring:message code="cost" /></th>
							 <th><spring:message code="action.label"/></th>
                         </tr>
                       </thead>
                       <tbody style="text-align: center;">
                       	
			 			</tbody>
                    </table>
                 </div>
                 <div class="row" style="text-align: center;">
                 		<input type="button" id="saveSelection"  class="btn bg-olive btn-inline" style="margin-left:1%;margin-right:1%;width: 68px;" onclick="saveSelectedSkus();" value="<spring:message code="save.label" />" />
						<!-- <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button> -->
						<input type="button" id="cancelSelection" class="btn bg-olive btn-inline" style="margin-right: 1%;" data-dismiss="modal" aria-hidden="true" value="<spring:message code="cancel.label" />" />
                 </div>
              </div>
             </form> 
         </div><!-- /.modal-content -->
     </div><!-- /.modal-dialog -->
 </div><!-- /.modal -->
                <!-- </div> --><!-- /.box-body -->
			  <div class="row" style="text-align:center;">
			  		<c:if test="${type == 'new'}">
	        			<input type="button" id="edit" style="" class="btnCls" onclick="validatePurchaseOrder('Submitted','new');" value="<spring:message code="submit.label" />" />
	        		</c:if>
	        		<c:if test="${type != 'new'}">
	        			<input type="button" id="edit" style="" class="btnCls" onclick="validatePurchaseOrder('Submitted','edit');" value="<spring:message code="submit.label" />" />
	        		</c:if>
	        		<c:if test="${sessionScope.role == 'super admin'}">
						 <c:forEach var="activity" items="${purchaseOrderBeanObj.nextActivities}">
						 	<input type="button" style="margin-right:1%;width: 80px;" class="btn bg-olive btn-inline" onclick="validatePurchaseOrder('${activity}','edit');" value="${activity}" />
						 </c:forEach>
					  </c:if>
					<%--   <c:if test="${sessionScope.role != 'super admin'}">
							 <c:forEach var="activity" items="${purchaseOrderBeanObj.nextActivities}">
							 	<c:forEach var="accessControl" items="${sessionScope.procurementActivity}">
							 		<c:if test="${accessControl.appDocument == 'PurchaseOrder' && activity == accessControl.appDocumentActivity}">
									 	<input type="button" style="margin-right:1%;width: 80px;" class="btn bg-olive btn-inline" onclick="validatePurchaseOrder('${activity}','edit');" value="${activity}" />
							 		</c:if>
			     				</c:forEach> 
							 </c:forEach>
				      </c:if> --%>
      			<c:if test="${sessionScope.role == 'super admin'}">
      				<input type="button" class=" btnCls buttonMargin" style="" onclick="viewPurchaseOrder('','outletPurchaseOrder','0');" value="<spring:message code="cancel.label" />" />
      			</c:if>
      			<c:set var="rqstForQutation" value="false"/>
				<c:forEach var="accessControl" items="${sessionScope.procurement}">
                	<c:if test="${accessControl.appDocument == 'PurchaseOrder' && accessControl.read == true}">
                	<c:set var="rqstForQutation" value="true"/>
						<input type="button" class="btnCls buttonMargin" style="" onclick="viewPurchaseOrder('all','outletPurchaseOrder','0');" value="<spring:message code="cancel.label" />" />
					</c:if>
				</c:forEach>
				<c:if test="${rqstForQutation == false}"> 
					 <c:forEach var="accessControl" items="${sessionScope.warehouseStockmanagement}">
              <c:if test="${accessControl.appSubDocument == 'WarehousePurchaseOrders' && accessControl.write == true}">  
             <input type="button" class="btnCls buttonMargin" style="" onclick="viewPurchaseOrder('all','outletPurchaseOrder','0');" value="<spring:message code="cancel.label" />" />
              </c:if>
              </c:forEach></c:if>
			<%-- 	<c:forEach var="accessControl" items="${sessionScope.warehouseStockmanagement}">
                	<c:if test="${accessControl.appDocument == 'PurchaseOrder' && accessControl.read == true}">
						<input type="button" class="" style="btnCls" onclick="viewPurchaseOrder('','outletPurchaseOrder','0');" value="<spring:message code="cancel.label" />" />
					</c:if>
				</c:forEach> --%>
				  <%-- <c:forEach var="activity" items="${purchaseOrderBeanObj.nextActivities}">
				 	<input type="button" style="margin-right:1%;width: 80px;" class="btn bg-olive btn-inline" onclick="validatePurchaseOrder('${activity}','edit');" value="${activity}" />
				 </c:forEach>
				<c:forEach var="accessControl" items="${sessionScope.procurement}">
                	<c:if test="${accessControl.appDocument == 'PurchaseOrder' && accessControl.read == true}">
						<input type="button" class="btn bg-olive btn-inline" style="margin-right:1%;" onclick="viewPurchaseOrder('','outletPurchaseOrder','0');" value="<spring:message code="cancel.label" />" />
                	</c:if>
               </c:forEach> --%>
			</div>  
		<br/>
        <div class="box-footer"></div>
        </div>
     </form>
   </div>
     
</div>
</div>
</section><!-- /.content -->
</body>
</html>